using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

using Caisis.BOL;
using Caisis.UI;
using Caisis.DataAccess;
using Caisis.UI.Core.Classes;
using Caisis.Security;

using System.Linq;


namespace Caisis.UI.Modules.FollowUp
{

    public partial class Modules_FollowUp_BatchPrintLetters : SurveyBasePage
    {
        private string _redirectPath = "BatchPrintContainer.aspx?isSurvey=false&batchPrint=true";

        protected override void Page_Load(object sender, EventArgs e)
        {
            // set default values
            if (!Page.IsPostBack)
            {
                LoadSurveyTypeDDL();

                ProcessDate.Text = DateTime.Now.ToShortDateString();
                ProcedureType.Text = FollowUpUtil.DEFAULT_PROCEDURE;
                ddlSurveyType.SelectedIndex = 1;
            }

            LoadFollowUpList();
        }

        /// <summary>
        /// Populate and bind the survey type drop down list.
        /// </summary>
        private void LoadSurveyTypeDDL()
        {
            ddlSurveyType.LookupCode = "PtContactStatus,FollowUp,Survey";
        }

        private void LoadFollowUpList()
        {
            DataTable dt = new DataTable();
            dt = SetFollowUpLetterList();

            NumSurveyPatients.Text = dt.Rows.Count.ToString();

            rptFollowUpList.DataSource = dt.DefaultView;
            rptFollowUpList.DataBind();
        }

        private DataTable SetFollowUpLetterList()
        {
            // need to validate string is actual date
            DateTime processDate = Convert.ToDateTime(ProcessDate.Text);

            // procedure can be entered from UI too
            string procedureType = ProcedureType.Text;

            _redirectPath += "&proc=" + procedureType + "&processDate=" + processDate.ToShortDateString();

            FollowUpDA da = new FollowUpDA();
            DataTable lastSurveyPatientsDt = new DataTable();

            lastSurveyPatientsDt = da.GetPatientsLastSurveySentList(procedureType, FollowUpUtil.GetSurveyShortName(ddlSurveyType.SelectedValue));

            DataTable fuLetterPatientsDt = new DataTable();
            DataColumn dc0 = new DataColumn("PatientId");
            DataColumn dc1 = new DataColumn("PtName");
            DataColumn dc2 = new DataColumn("PtMRN");
            DataColumn dc3 = new DataColumn("Surgeon");
            DataColumn dc4 = new DataColumn("FUMonth");
            DataColumn dc5 = new DataColumn("SurveyName");
            DataColumn dc6 = new DataColumn("SentDate");
            DataColumn dc7 = new DataColumn("Address1");
            DataColumn dc8 = new DataColumn("Address2");
            DataColumn dc9 = new DataColumn("City");
            DataColumn dc10 = new DataColumn("State");
            DataColumn dc11 = new DataColumn("Zip");
            DataColumn dc12 = new DataColumn("LastName");
            DataColumn dc13 = new DataColumn("FirstName");

            fuLetterPatientsDt.Columns.Add(dc12);
            fuLetterPatientsDt.Columns.Add(dc13);
            fuLetterPatientsDt.Columns.Add(dc0);
            fuLetterPatientsDt.Columns.Add(dc1);
            fuLetterPatientsDt.Columns.Add(dc2);
            fuLetterPatientsDt.Columns.Add(dc3);
            fuLetterPatientsDt.Columns.Add(dc4);
            fuLetterPatientsDt.Columns.Add(dc5);
            fuLetterPatientsDt.Columns.Add(dc6);
            fuLetterPatientsDt.Columns.Add(dc7);
            fuLetterPatientsDt.Columns.Add(dc8);
            fuLetterPatientsDt.Columns.Add(dc9);
            fuLetterPatientsDt.Columns.Add(dc10);
            fuLetterPatientsDt.Columns.Add(dc11);

            // HERE: remove patients who have completed the survey within 20 days after it was sent to them
            foreach (DataRow dr in lastSurveyPatientsDt.Rows)
            {
                int pId = Int32.Parse(dr[Patient.PatientId].ToString());
                DateTime surveySentDate = Convert.ToDateTime(dr[Caisis.BOL.Action.ActionDate].ToString());

                // we have the surveySent actionItem is "NAME x Month Sent"                
                string surveySentActionItem = dr[Caisis.BOL.Action.ActionItem].ToString();

                string surveyType = FollowUpUtil.GetSurveyNameFromActionItem(surveySentActionItem);
                string month = FollowUpUtil.GetSurveyMonthNoFromActionItem(surveySentActionItem);

                // and want to get the equivalent letterSent ActionItem: for now it is "NAME x Month Letter Sent"
                string letterSentActionItem = FollowUpUtil.GetActionItemToLog(pId, month, surveyType, false);

                if (processDate > surveySentDate.AddDays(20)) //expected to receive survey within 20 days of processdate
                {
                    // if expected survey was not received, send letter to patient only if not already sent before
                    if (da.GetSurveyByActionItem(pId, surveySentActionItem).Rows.Count == 0 && da.LetterAlreadySent(pId, letterSentActionItem) == false)
                    {
                     
                        // get the (full) survey name to display in the list of results
                        string selectedSurvey = ddlSurveyType.SelectedValue;
                        string surveyFullName = FollowUpUtil.GetSurveyFullName(int.Parse(month), selectedSurvey);

                        // patient is due for a follow up letter
                        DataRow fuRow = fuLetterPatientsDt.NewRow();
                        fuRow["PatientId"] = pId.ToString();
                        fuRow["LastName"] = dr[Patient.PtLastName].ToString();
                        fuRow["FirstName"] = dr[Patient.PtFirstName].ToString();
                        fuRow["PtName"] = dr[Patient.PtLastName].ToString() + ", " + dr[Patient.PtFirstName].ToString();
                        fuRow["PtMRN"] = dr[Patient.PtMRN].ToString();
                        fuRow["Surgeon"] = da.GetMostRecentTreatingPhysician(pId);
                        fuRow["FUMonth"] = month.ToString();
                        fuRow["SurveyName"] = surveyFullName;

                        DateTime dt;
                        dt = Convert.ToDateTime(dr[Caisis.BOL.Action.ActionDate].ToString());
                        fuRow["SentDate"] = dt.ToShortDateString(); //last survey sent date
                        //fuRow["SentDate"] = dr[Caisis.BOL.Action.ActionDate].ToString(); //last survey sent date

                        if (string.IsNullOrEmpty(letterSentActionItem))
                        {
                            fuRow["SurveyName"] = fuRow["SurveyName"].ToString() + "<BR>Invalid Action Name";
                        }

                        // retrieve additional patient data
                        if (!String.IsNullOrEmpty(dr[Patient.PtMRN].ToString()))
                        {
                            PatientDa ptDa = new PatientDa();
                            DataTable ptInfoDt = ptDa.GetPatientByMRN(dr[Patient.PtMRN].ToString());
                            if (ptInfoDt.Rows.Count > 0)
                            {
                                fuRow["Address1"] = ptInfoDt.Rows[0][Patient.PtAddress1].ToString();
                                fuRow["Address2"] = ptInfoDt.Rows[0][Patient.PtAddress2].ToString();
                                fuRow["City"] = ptInfoDt.Rows[0][Patient.PtCity].ToString();
                                fuRow["State"] = ptInfoDt.Rows[0][Patient.PtState].ToString();
                                fuRow["Zip"] = ptInfoDt.Rows[0][Patient.PtPostalCode].ToString();
                            }
                        }

                        fuLetterPatientsDt.Rows.Add(fuRow);

                        // NOTE: all patients get the same follow up letter, but this could change?
                        _redirectPath += "&" + dr[Patient.PatientId].ToString() + "=" + month + "_Follow Up Letter";
                    }
                }

                CreateBatchButton.Attributes.Add("onclick", "window.location.href='" + _redirectPath + "'");
            }

            return fuLetterPatientsDt;
        }

        protected void ExportToExcelClick(object sender, EventArgs e)
        {
            DataTable XLDt = SetFollowUpLetterList();

            // remove permision based columns
            if (!PermissionManager.HasPermission(PermissionManager.ViewPatientIdentifiers))
            {
                if (XLDt.Columns["ptMRN"] != null) XLDt.Columns.Remove("ptMRN");
            }

            // remove irrelevant columns
            if (XLDt.Columns["PatientId"] != null) XLDt.Columns.Remove("PatientId");
            if (XLDt.Columns["PtName"] != null) XLDt.Columns.Remove("PtName");

            // rename columns
            if (XLDt.Columns["LastName"] != null) XLDt.Columns["LastName"].ColumnName = "Last Name";
            if (XLDt.Columns["FirstName"] != null) XLDt.Columns["FirstName"].ColumnName = "First Name";
            if (XLDt.Columns["PtMRN"] != null) XLDt.Columns["PtMRN"].ColumnName = "Patient MRN";
            if (XLDt.Columns["Surgeon"] != null) XLDt.Columns["Surgeon"].ColumnName = "Treating Physician";
            if (XLDt.Columns["FUMonth"] != null) XLDt.Columns["FUMonth"].ColumnName = "Follow Up Month";
            if (XLDt.Columns["SurveyName"] != null) XLDt.Columns["SurveyName"].ColumnName = "Survey";
            if (XLDt.Columns["SentDate"] != null) XLDt.Columns["SentDate"].ColumnName = "Date Sent";
            if (XLDt.Columns["Address1"] != null) XLDt.Columns["Address1"].ColumnName = "Address1";
            if (XLDt.Columns["Address2"] != null) XLDt.Columns["Address2"].ColumnName = "Address2";
            if (XLDt.Columns["City"] != null) XLDt.Columns["City"].ColumnName = "City";
            if (XLDt.Columns["State"] != null) XLDt.Columns["State"].ColumnName = "State";
            if (XLDt.Columns["Zip"] != null) XLDt.Columns["Zip"].ColumnName = "Zip";

            DataView qryDataReportView = XLDt.DefaultView;
            Caisis.Controller.ExcelExporter.ExportToExcel(this, qryDataReportView, "Patient Letters Due Results", "PatientLettersDue.xls");
        }

    }
}