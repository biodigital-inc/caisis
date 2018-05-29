using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Collections.Generic;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

using Caisis;
using Caisis.Controller;
using Caisis.UI.Core.Classes;
using Caisis.UI.Core.Classes.CustomControls;
using Caisis.DataAccess;
using Caisis.BOL;

namespace Caisis.UI.Modules.FollowUp
{
    public partial class Modules_FollowUp_ViewPatientSurveySummary : SurveyBasePage
    {
        private string _redirectPath = "BatchPrintContainer.aspx?isSurvey=true&batchPrint=true&processDate=" + DateTime.Now.ToShortDateString();

        protected override void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                int ptId = -1;
                if (Request.QueryString["usePtInSession"] != null && Request.QueryString["usePtInSession"].Equals("true"))
                {
                    SessionHandler sh = new SessionHandler(Session);
                    ptId = sh.GetPatientId();
                }
                else if (Request.QueryString["ptId"] != null && Request.QueryString["ptId"].Length > 0)
                {
                    ptId = int.Parse(Request.QueryString["ptId"]);
                    // Place patient in session
                    PatientController ptController = new PatientController();
                    ptController.PutPatientInSession(Page, ptId);
                }

                FollowUpUtil.PopulateSurveyDropDown(SurveyDD);
                LoadPatientData(ptId);
            }
        }

        
        /// <summary>
        /// Load the patients survey history into the grid of follow up dates
        /// </summary>
        /// <param name="patientId"></param>
        private void LoadPatientData(int patientId)
        {
            string noRecordMsg = "This patient has not had a qualifying procedure and is not scheduled for one within Caisis. Follow up surveys therefore do not apply at this time.";

            // set page title 
            Patient p = new Patient();
            p.Get(patientId);
            this.ResultsTitle.Text += p[Patient.PtFirstName].ToString() + " " + p[Patient.PtLastName].ToString();

            FollowUpDA da = new FollowUpDA();

            // retrieve procedure lookupcode values specified for Follow up module
            DataTable followupProcLkpcodes = CacheManager.GetLookupCodeList(FollowUpUtil.DEFAULT_PROCEDURE_LOOKUPCODE);
            string followupProcList = CreateDelimitedString(followupProcLkpcodes, LookupCode.LkpCode, ",");

            // retrive most recent Follow up related procedure for patient
            DataTable dtProc = da.GetPatientProcedureInfo(patientId, followupProcList);

            Status.Value = da.GetPatientContactStatus(patientId);

            if (dtProc.Rows.Count > 0)
            {
                DataTable dt = da.GetPatientSentSurveysList(patientId);

                ProcedureName.Value = dtProc.Rows[0][Procedure.ProcName].ToString();
                _redirectPath += "&proc=" + ProcedureName.Value + "&processDate=" + DateTime.Now.ToShortDateString();

                string dosString = dtProc.Rows[0][Procedure.ProcDate].ToString();
                DateTime dos = DateTime.Parse(dosString);
                DOS.Value = dos.ToShortDateString();

                // Build DataSource to contain Dates
                int[] months = new int[] { 0, 1, 3, 6, 12, 18, 24, 30, 36, 48, 60 };
                DataTable myTable = new DataTable();
                string[] colNames = new string[] { "MonthName", "MonthNumber", "DueDate", "SentDate", "TimesSent", "CompletedDate", "CompletedSurveyId", "SurveyType", "UserSurveyType", "ActionId" };
                foreach (string colName in colNames)
                {
                    myTable.Columns.Add(new DataColumn(colName));
                }

                foreach (int month in months)
                {
                    DataRow newRow = myTable.NewRow();
                    string monthName = "Month" + " " + month.ToString();
                    if (month == 0)
                    {
                        monthName = "Pre Op";
                        DateTime dueDate = dos.AddDays(-14);
                        newRow["DueDate"] = dueDate.ToShortDateString();
                    }

                    newRow["MonthName"] = monthName;
                    newRow["MonthNumber"] = month.ToString();

                    if (month > 0)
                    {
                        DateTime dueDate = dos.AddMonths(month);
                        newRow["DueDate"] = dueDate.ToShortDateString();
                    }

                    // Action Items are always in format:  'Survey Name X Month Sent' where X is the month number
                    string expression = "ActionItem LIKE '% " + month.ToString() + " Month Sent'";
                    DataRow[] sentDates = dt.Select(expression);

                    string actionItem = string.Empty;

                    // TODO: confirm that sent dates work
                    if (sentDates.Length > 0)
                    {
                        actionItem = (string)sentDates[sentDates.Length - 1][Caisis.BOL.Action.ActionItem];
                        string surveyName = FollowUpUtil.GetSurveyNameFromActionItem(actionItem);

                        // use the most recent Date
                        DateTime sentDate = (DateTime)sentDates[sentDates.Length - 1][Caisis.BOL.Action.ActionDate];
                        newRow["SentDate"] = sentDate.ToShortDateString();
                        
                        // parse out the survey type from the "ActionItem" column
                        newRow["ActionId"] = (int)sentDates[sentDates.Length - 1][Caisis.BOL.Action.ActionId];   
                        newRow["SurveyType"] = surveyName;
                        newRow["UserSurveyType"] = surveyName;
                    }

                    newRow["TimesSent"] = sentDates.Length.ToString();

                    // if survey was sent (action item exists), then see if survey data was already entered
                    if(!string.IsNullOrEmpty(actionItem))
                    {
                        // to see data has been entered for a survey we now look for a RELATED RECORD: Actions to Survey
                        DataTable completeSurveysDt = da.GetSurveyByActionItem(patientId, actionItem);

                        if (completeSurveysDt.Rows.Count > 0)
                        {
                            DateTime completedDate = (DateTime)completeSurveysDt.Rows[0][Survey.SurveyDate];
                            newRow["CompletedDate"] = completedDate.ToShortDateString();
                            newRow["CompletedSurveyId"] = completeSurveysDt.Rows[0][Survey.SurveyId].ToString();
                        }
                    }
                 
                    // Finally add new row to datasource
                    myTable.Rows.Add(newRow);
                }

                // Bind Rptr to DataSource
                MyRptr.DataSource = myTable;
                MyRptr.DataBind();
            }
            else
            {
                this.noResultsRow.Visible = true;
                this.noRecordsFound.Text = noRecordMsg;
            }
        }

        
        /// <summary>
        /// Set dates based on surgery date and attach onClick event for EnterData button.
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void SetDates(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                int month = int.Parse(DataBinder.Eval(e.Item.DataItem, "MonthNumber").ToString());
                HtmlTableRow row = e.Item.FindControl("surveyRow") as HtmlTableRow;
                if (month < 1)
                {
                    row.Attributes.Add("class", "SurveyGroup0");
                }
                else if (month <= 12)
                {
                    row.Attributes.Add("class", "SurveyGroup1");
                }
                else if (month <= 48)
                {
                    row.Attributes.Add("class", "SurveyGroup2");
                }
                else if (month > 48)
                {
                    row.Attributes.Add("class", "SurveyGroup3");
                }

                HiddenField monthField = e.Item.FindControl("MonthNumber") as HiddenField;
                monthField.Value = month.ToString();

                ICaisisInputControl ddMonth = e.Item.FindControl("dd_month") as ICaisisInputControl;
                ICaisisInputControl sdMonth = e.Item.FindControl("sd_month") as ICaisisInputControl;
                ICaisisInputControl timesMonth = e.Item.FindControl("times_month") as ICaisisInputControl;
                ICaisisInputControl cdMonth = e.Item.FindControl("cd_month") as ICaisisInputControl;

                string sentDate = DataBinder.Eval(e.Item.DataItem, "SentDate").ToString();
                string completedDate = DataBinder.Eval(e.Item.DataItem, "CompletedDate").ToString();
                if (!string.IsNullOrEmpty(sentDate) && string.IsNullOrEmpty(completedDate))
                {
                    ImageButton enterBtn = e.Item.FindControl("EnterBtn") as ImageButton;
                    enterBtn.Visible = true;
                    //enterBtn.Attributes.Add("onClick", "enterSurveyData('" + DataBinder.Eval(e.Item.DataItem, "ActionId").ToString() + "', '" + DataBinder.Eval(e.Item.DataItem, "SurveyType").ToString() + "')");

                    enterBtn.OnClientClick = "enterSurveyResponses('" + Server.UrlEncode(DataBinder.Eval(e.Item.DataItem, "SurveyType").ToString()) + "','" + Server.UrlEncode(DataBinder.Eval(e.Item.DataItem, "MonthNumber").ToString()) + "')";
                }
                else if (!string.IsNullOrEmpty(completedDate))
                {
                    ImageButton viewBtn = e.Item.FindControl("ViewBtn") as ImageButton;
                    viewBtn.Visible = true;

                    // because there is a completedDate, there is a surveyId
                    string surveyId = DataBinder.Eval(e.Item.DataItem, "CompletedSurveyId").ToString();
                    viewBtn.OnClientClick = "viewSurveyResponses('" + surveyId + "')";
                }


            }
        }

        
        /// <summary>
        /// Handle click of Print button
        /// </summary>
        /// <param name="source"></param>
        /// <param name="e"></param>
        protected void HandleItemClick(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "Print")
            {
                HiddenField monthNumField = e.Item.FindControl("MonthNumber") as HiddenField;
                string monthNum = monthNumField.Value;
                // Now you have the month number
                string surveyName = SurveyDD.SelectedValue;

                SessionHandler sh = new SessionHandler(Session);
                int ptId = sh.GetPatientId();

                // Redirect to BatchPrintContainer page
                _redirectPath += "&proc=" + ProcedureName.Text + "&" + ptId + "=" + monthNum + "_" + surveyName;

                Response.Redirect(_redirectPath);
            }
        }

        private String CreateDelimitedString(DataTable dt, string columnName, string delimter)
        {
            string list = "";
            foreach (DataRow dr in dt.Rows)
            {
                string fieldValue = dr[columnName].ToString();
                // if value already contains an apostrophe
                if (fieldValue.Contains("'"))
                    fieldValue = fieldValue.Replace("'","''");

                list = String.Concat(list, "\'", fieldValue, "\'", delimter);
            }

            if (list.EndsWith(delimter))
            {
                int index = list.LastIndexOf(delimter);
                list = list.Remove(index);
            }
            return list;
        }

    }
}