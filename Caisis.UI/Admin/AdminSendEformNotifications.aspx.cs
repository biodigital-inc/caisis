using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Collections.Generic;
using System.Net.Mail;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

using System.Xml;
using System.Xml.Xsl;

using Caisis.UI.Core.Classes;
using Caisis.DataAccess;
using Caisis.BOL;

namespace Caisis.UI.Admin
{
    public partial class AdminSendEformNotifications : AdminBasePage
    {
        // Query Constants
        private static readonly string AutoRunQueryString = "autoRun";
        private static readonly string SearchDateQueryString = "searchDate";

        private static readonly string XSLTPath = "EFormNotificationTemplate.xsl";

        // A list of Column Names to be passed to the XSL parsing document
        private static readonly List<string> xslFieldArgs = new List<string>(new string[] { SurgeryAppointment.PatientId, SurgeryAppointment.ApptMRN, SurgeryAppointment.ApptFirstName, SurgeryAppointment.ApptLastName, SurgeryAppointment.ApptSurgeryDate, SurgeryAppointment.ApptEform, SurgeryAppointment.ApptCaseSurgeon });

        #region Private Properties
        /// <summary>
        /// Gets the date representation of the current search date
        /// </summary>
        private DateTime SearchDate
        {
            get
            {
                return DateTime.Parse(HiddenDateValue.Value);
            }
        }

        /// <summary>
        /// Gets the short date text representation of the current search date
        /// </summary>
        private string SearchDateText
        {
            get
            {
                return SearchDate.ToShortDateString();
            }
        }
        #endregion

        /// <summary>
        /// Handles logic for automated processing, if needed
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected override void Page_Load(object sender, EventArgs e)
        {
            // NOTE: Automated processing will invoke sending emails and will close connection to server.
            CheckAutomatedProcessing();

            // If a user is browsing directly to this page, it will still fall under the base Admin Page's security check
            base.Page_Load(sender, e);

            // Handle normal user request
            if (!Page.IsPostBack)
            {
                DateChooser.Text = SearchDateText;
                SetAppointmentGrid();
            }
        }

        #region GridView Methods

        /// <summary>
        /// When the Grid is bound, update status text to reflect results.
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void OnNotificationGridBound(object sender, EventArgs e)
        {
            GridView grid = sender as GridView;
            if (grid.Rows.Count > 0)
            {
                GridPanel.Visible = true;
                SearchResultsMessage.Visible = false;
            }
            else
            {
                GridPanel.Visible = false;
                SearchResultsMessage.Visible = true;
                SearchResultsMessage.InnerText = "There were no Appointments for " + SearchDateText;
            }
        }

        /// <summary>
        /// Binds the Grid to the the results from the current date
        /// </summary>
        private void SetAppointmentGrid()
        {
            AppointmentDa da = new AppointmentDa();
            DataTable dt = da.GetSurgeryAppointments(SearchDate, false);
            SendNotificationGrid.DataSource = dt;
            SendNotificationGrid.DataBind();
        }
        #endregion

        #region Automated Events

        /// <summary>
        /// Sends emails to physicians for a sepcific date
        /// </summary>
        /// <param name="date">the appointment date</param>
        /// <param name="excludeLastSentItems">if to exclude previously sent emails</param>
        /// <returns>the number of emails sent</returns>
        protected int BulkSendEmailsForDate(DateTime date, bool excludeLastSentItems)
        {
            DataTable dt = new AppointmentDa().GetSurgeryAppointments(date, excludeLastSentItems);
            Dictionary<string, List<int>> distinctEmailsAndKeys = GetDistinctEmailAppointments(dt);
            SendEmails(distinctEmailsAndKeys, dt);
            return distinctEmailsAndKeys.Count;
        }
        #endregion

        #region Click Events

        /// <summary>
        /// Occurs when user clicks search by date
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void RunSearch(object sender, EventArgs e)
        {
            string dateText = DateChooser.Value;
            if (!string.IsNullOrEmpty(dateText))
            {
                DateTime searchDate = DateTime.Parse(dateText);
                HiddenDateValue.Value = searchDate.ToShortDateString();
                SetAppointmentGrid();
            }
        }

        /// <summary>
        /// Occurs when a user chooses items in the grid and clicks send, to mail
        /// checked records to physicians.
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void SendEmailNotificationsClick(object sender, CommandEventArgs e)
        {
            Dictionary<string, List<int>> emailHash = new Dictionary<string, List<int>>();
            DataTable dataSource = new AppointmentDa().GetSurgeryAppointments(SearchDate, false);
            foreach (GridViewRow row in SendNotificationGrid.Rows)
            {
                CheckBox box = row.FindControl("EmailUserCheckBox") as CheckBox;
                if (box.Checked)
                {
                    int apptId = int.Parse(SendNotificationGrid.DataKeys[row.RowIndex].Value.ToString());
                    DataRow record = dataSource.Select(SurgeryAppointment.SurgeryAppointmentId + " = " + apptId)[0];
                    string emailAddress = record[SurgeryAppointment.ApptSurgeonEmail].ToString();
                    if (!string.IsNullOrEmpty(emailAddress))
                    {
                        AddEmailAppointmentToDictionary(emailHash, emailAddress, apptId);
                    }
                }
            }
            SendEmails(emailHash, dataSource);
            GridPanel.Visible = false;
            SearchResultsMessage.Visible = true;
            int emailCount = emailHash.Count;
            string total = emailCount == 1 ? " email" : " emails";
            SearchResultsMessage.InnerText = "You have successfully sent " + emailCount + total + ".";
        }
        #endregion

        #region Helper Methods

        /// <summary>
        /// Check is automated processing is calling this page via Query String.
        /// </summary>
        private void CheckAutomatedProcessing()
        {
            string autoRunText = Request.QueryString[AutoRunQueryString];
            string searchDateText = Request.QueryString[SearchDateQueryString];
            DateTime searchDate;
            if (!DateTime.TryParse(searchDateText, out searchDate))
            {
                searchDate = DateTime.Today;
                if (!Page.IsPostBack)
                {
                    HiddenDateValue.Value = searchDate.ToShortDateString();
                }
            }
            else
            {
                HiddenDateValue.Value = searchDate.ToShortDateString();
            }
            bool autoRun;
            if (bool.TryParse(autoRunText, out autoRun))
            {
                if (autoRun && !Page.IsPostBack)
                {
                    int sentEmails = BulkSendEmailsForDate(searchDate, true);
                    Response.Write(sentEmails + (sentEmails == 1 ? " email has" : " emails have") + " been sent to Physicians for " + searchDate.ToShortDateString());
                    Response.End();
                }
            }
        }

        /// <summary>
        /// Returns a list of distinct email addresses, associated with an Appointment
        /// </summary>
        /// <param name="dt"></param>
        /// <returns></returns>
        private Dictionary<string, List<int>> GetDistinctEmailAppointments(DataTable dt)
        {
            Dictionary<string, List<int>> hashedList = new Dictionary<string, List<int>>();
            foreach (DataRow row in dt.Rows)
            {
                int apptId = int.Parse(row[SurgeryAppointment.SurgeryAppointmentId].ToString());
                string emailAddress = row[SurgeryAppointment.ApptSurgeonEmail].ToString();
                if (!string.IsNullOrEmpty(emailAddress))
                {
                    AddEmailAppointmentToDictionary(hashedList, emailAddress, apptId);
                }
            }
            return hashedList;
        }

        /// <summary>
        /// Helper methods used to insert email addre
        /// </summary>
        /// <param name="dictionary"></param>
        /// <param name="emailAddress"></param>
        private void AddEmailAppointmentToDictionary(Dictionary<string, List<int>> dictionary, string emailAddress, int apptId)
        {
            if (!string.IsNullOrEmpty(emailAddress))
            {
                emailAddress = emailAddress.ToLower();
                if (dictionary.ContainsKey(emailAddress))
                {
                    List<int> pkList = dictionary[emailAddress];
                    pkList.Add(apptId);
                }
                else
                {
                    List<int> pkList = new List<int>();
                    pkList.Add(apptId);
                    dictionary.Add(emailAddress, pkList);
                }
            }
        }

        /// <summary>
        /// Sends emails to those emails, where each email contains those users email addresses.
        /// </summary>
        /// <param name="hashedList"></param>
        /// <param name="dataSource"></param>
        private void SendEmails(Dictionary<string, List<int>> hashedList, DataTable dataSource)
        {
            MailManager m = new MailManager();
            List<int> updateKeys = new List<int>();
            foreach (string emailAddress in hashedList.Keys)
            {


                XmlDocument xDoc = new XmlDocument();
                xDoc.AppendChild(xDoc.CreateXmlDeclaration("1.0", System.Text.Encoding.UTF8.WebName, "yes"));
                XmlElement eForms = xDoc.CreateElement("eforms");
                xDoc.AppendChild(eForms);

                List<int> emailPriKeys = hashedList[emailAddress];
                updateKeys.AddRange(emailPriKeys);
                string toName = "";
                string toAddress = emailAddress;
                foreach (int priKey in emailPriKeys)
                {
                    DataRow record = dataSource.Select(SurgeryAppointment.SurgeryAppointmentId + " = " + priKey)[0];
                    toName = record[SurgeryAppointment.ApptCaseSurgeon].ToString();
                    XmlElement eFormNode = CreateEFromNode(xDoc, record);
                    eForms.AppendChild(eFormNode);
                }

                // Prepare the message
                MailMessage message = new MailMessage();
                message.From = m.AdminMailAddress;
                message.To.Add(new MailAddress(emailAddress, toName));
                message.Subject = "Here are the surgeries for " + toName + " on " + SearchDateText;

                // Generate HTML output based on EForm XML
                XslTransform transformer = new XslTransform();
                XsltArgumentList argList = new XsltArgumentList();
                argList.AddParam("surgeonName", string.Empty, toName);
                argList.AddParam("surgeonEmail", string.Empty, emailAddress);
                argList.AddParam("surgeryDate", string.Empty, SearchDateText);
                argList.AddParam("urlBase", string.Empty, PageUtil.GetAbsoluteUrl(this.Page, "~/"));
                transformer.Load(Server.MapPath(XSLTPath));
                System.IO.StringWriter messageWriter = new System.IO.StringWriter();
                transformer.Transform(xDoc, argList, messageWriter);
                message.Body = messageWriter.ToString();
                message.IsBodyHtml = true;
                m.SendEmail(message);
            }
            // Update Last Notification Date
            AppointmentDa da = new AppointmentDa();
            da.UpdateLastNotificationDate(updateKeys, DateTime.Now);
        }

        /// <summary>
        /// Create XML Node used for transforming in HTML email
        /// </summary>
        /// <param name="xDoc"></param>
        /// <param name="row"></param>
        /// <returns></returns>
        private XmlElement CreateEFromNode(XmlDocument xDoc, DataRow row)
        {
            XmlElement eFormElement = xDoc.CreateElement("eform");
            foreach (string field in xslFieldArgs)
            {
                DataColumn col = row.Table.Columns[field];
                XmlElement fieldNode = xDoc.CreateElement(field);
                string fieldValue = "";
                if (col.DataType == typeof(DateTime))
                {
                    fieldValue = DateTime.Parse(row[col].ToString()).ToShortDateString();
                }
                else
                {
                    fieldValue = row[col].ToString();
                }
                // HTML/XML Encode for being sent as HTML EMail
                fieldNode.InnerText = Server.HtmlEncode(fieldValue);
                eFormElement.AppendChild(fieldNode);
            }
            return eFormElement;
        }

        #endregion
    }
}
