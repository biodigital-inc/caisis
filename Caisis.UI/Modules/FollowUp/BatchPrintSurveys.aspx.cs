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

    public partial class Modules_FollowUp_BatchPrintSurveys : SurveyBasePage
    {
        private string _redirectPath = "BatchPrintContainer.aspx?isSurvey=true&batchPrint=true";

        protected override void Page_Load(object sender, EventArgs e)
        {
            // set default values
            if (!Page.IsPostBack)
            {
                // set default values
                ProcessDate.Text = DateTime.Now.ToShortDateString();
                ddlSurveyType.SelectedIndex = 1;
                ddlProcedure.SelectedValue = FollowUpUtil.DEFAULT_PROCEDURE;
            }

            LoadFollowUpList();
        }

        private void LoadFollowUpList()
        {
            DataTable dt = new DataTable();
            dt = SetFollowUpList();

            NumSurveyPatients.Text = dt.Rows.Count.ToString();

            rptFollowUpList.DataSource = dt.DefaultView;
            rptFollowUpList.DataBind();
        }

        private DataTable SetFollowUpList()
        {
            // get user input
            DateTime processDate = Convert.ToDateTime(ProcessDate.Text);
            string selectedSurvey = ddlSurveyType.SelectedValue;
            string procedureType = ddlProcedure.Text;

            _redirectPath += "&proc=" + procedureType + "&processDate=" + processDate.ToShortDateString();


            FollowUpDA da = new FollowUpDA();
            DataTable surgPatientsDt = new DataTable();

            // return all patients with PtContactStatus as selected
            surgPatientsDt = da.GetActivePatientsForQOLFollowUp(processDate.ToShortDateString(), procedureType, selectedSurvey);

            DataTable fuPatientsDt = new DataTable();
            DataColumn dc0 = new DataColumn("PatientId");
            DataColumn dc1 = new DataColumn("PtName");
            DataColumn dc2 = new DataColumn("PtMRN");
            DataColumn dc3 = new DataColumn("DueDate");
            DataColumn dc4 = new DataColumn("FUMonth");
            DataColumn dc5 = new DataColumn("ProcName");
            DataColumn dc6 = new DataColumn("ProcDate");
            DataColumn dc7 = new DataColumn("Surgeon");
            DataColumn dc8 = new DataColumn("SurveyName");
            DataColumn dc9 = new DataColumn("Address1");
            DataColumn dc10 = new DataColumn("Address2");
            DataColumn dc11 = new DataColumn("City");
            DataColumn dc12 = new DataColumn("State");
            DataColumn dc13 = new DataColumn("Zip");
            DataColumn dc14 = new DataColumn("LastName");
            DataColumn dc15 = new DataColumn("FirstName");

            fuPatientsDt.Columns.Add(dc14);
            fuPatientsDt.Columns.Add(dc15);
            fuPatientsDt.Columns.Add(dc0);
            fuPatientsDt.Columns.Add(dc1);
            fuPatientsDt.Columns.Add(dc2);
            fuPatientsDt.Columns.Add(dc3);
            fuPatientsDt.Columns.Add(dc4);
            fuPatientsDt.Columns.Add(dc5);
            fuPatientsDt.Columns.Add(dc6);
            fuPatientsDt.Columns.Add(dc7);
            fuPatientsDt.Columns.Add(dc8);
            fuPatientsDt.Columns.Add(dc9);
            fuPatientsDt.Columns.Add(dc10);
            fuPatientsDt.Columns.Add(dc11);
            fuPatientsDt.Columns.Add(dc12);
            fuPatientsDt.Columns.Add(dc13);

            // remove patients who don't belong;
            foreach (DataRow dr in surgPatientsDt.Rows)
            {
                DateTime surgDate = (DateTime)dr[Procedure.ProcDate];

                int daysPriorToDueDate = -15;
                int daysAfterDueDate;
                int month, previousMonth;
                bool breakLoop = false;

                // TODO: HANDLE PRE_TREATMENT SURVEY
                //-- processingdate < scheduledSurgeryDate
                //-- AND PreOP has not been sent before
                //-- AND processDate is no earlier than 30 days before due date 
                //-- AND IF it was sent before, make sure it was not 14 days or less ago
                //-- THEN Send PreOp

                if (processDate < surgDate) //means PRE-OP
                {
                    DateTime dueDate = surgDate.AddDays(-14);
                    string surveyShortType = FollowUpUtil.GetSurveyFullName(-1, ddlSurveyType.SelectedValue); //month is -1 since pre-op
                    int pId = Int32.Parse(dr[Patient.PatientId].ToString());


                    DataTable dt = GetThisLastSurveySentRecord(surveyShortType, 0, pId);

                    //1. survey has not been sent before and processdate is no earlier than 30 days before duedate
                    //2. survey was sent before, we will send again if it was sent out more than 14 days ago and has not been received yet

                    if ((SurveyAlreadySent(surveyShortType, 0, pId) == false && processDate > dueDate.AddDays(-30)) ||
                         (dt.Rows.Count > 0 && da.GetSurveyByActionItem(pId, dt.Rows[0][Caisis.BOL.Action.ActionItem].ToString()).Rows.Count == 0 && DateTime.Parse(dt.Rows[0][Caisis.BOL.Action.ActionDate].ToString()) < processDate.AddDays(-14)))
                    {
                        string surveyName = FollowUpUtil.GetSurveyFullName(0, surveyShortType);

                        DataRow fuRow = fuPatientsDt.NewRow();
                        fuRow["PatientId"] = pId.ToString();
                        fuRow["LastName"] = dr[Patient.PtLastName].ToString();
                        fuRow["FirstName"] = dr[Patient.PtFirstName].ToString();
                        fuRow["PtName"] = dr[Patient.PtLastName].ToString() + ", " + dr[Patient.PtFirstName].ToString();
                        fuRow["PtMRN"] = dr[Patient.PtMRN].ToString();
                        fuRow["DueDate"] = dueDate.ToShortDateString();
                        fuRow["FUMonth"] = "Pre-Op";
                        fuRow["ProcName"] = dr[Procedure.ProcName].ToString();
                        fuRow["ProcDate"] = surgDate.ToShortDateString();
                        fuRow["Surgeon"] = da.GetMostRecentTreatingPhysician(pId);
                        fuRow["SurveyName"] = surveyName;

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

                        fuPatientsDt.Rows.Add(fuRow);

                        // 0 used for PreTx surveys
                        // _redirectPath += "&" + dr[Patient.PatientId].ToString() + "=0_" + surveyName.Replace(" ", "");
                        _redirectPath += "&" + dr[Patient.PatientId].ToString() + "=0_" + surveyName;
                    }
                }

                // rules for distribution: 1 dimension contains send month; 2 dimension contains number of days before due date in which survey should be received
                //int[,] surveyMonths = { { 1, 21 }, { 3, 30 }, { 6, 45 }, { 12, 60 }, { 18, 75 }, { 24, 75 }, { 30, 75 }, { 36, 75 }, { 48, 75 }, { 60, 75 } };

                // rules for new distribution: 1 dimension contains send month; 2 dimension contains number of days before due date in which survey should be received
                int[,] surveyMonths = { { 1, 21 }, { 3, 21 }, { 6, 21 }, { 12, 21 }, { 18, 30 }, { 24, 30 }, { 30, 30 }, { 36, 30 }, { 48, 30 }, { 60, 30 } };

                for (int i = 0; i < 10; i++)
                {
                    // retrieve send month                  
                    month = surveyMonths[i, 0];

                    daysAfterDueDate = surveyMonths[i, 1];
                    DateTime dueDate = surgDate.AddMonths(month);

                    if (dueDate >= processDate.AddDays(daysPriorToDueDate) && dueDate <= processDate.AddDays(daysAfterDueDate))
                    {
                        breakLoop = true;

                        string currentSurveyDueName = FollowUpUtil.GetSurveyFullName(month, selectedSurvey);
                        //string previousSurveyName = FollowUpUtil.GetSurveyFullName(previousMonth, selectedSurvey);

                        // if 1) current survey was not already sent AND 2) At least 1 of the previous 3 surveys have been sent AND received
                        if (!SurveyAlreadySent(currentSurveyDueName, month, Int32.Parse(dr[Patient.PatientId].ToString())) &&
                             PassesSurveyReceivedRule(surveyMonths, i, dr[Patient.PatientId].ToString(), selectedSurvey))
                        {
                            // patient is due for a month survey
                            DataRow fuRow = fuPatientsDt.NewRow();
                            string pId = dr[Patient.PatientId].ToString();
                            fuRow["PatientId"] = pId;
                            fuRow["LastName"] = dr[Patient.PtLastName].ToString();
                            fuRow["FirstName"] = dr[Patient.PtFirstName].ToString();
                            fuRow["PtName"] = dr[Patient.PtLastName].ToString() + ", " + dr[Patient.PtFirstName].ToString();
                            fuRow["PtMRN"] = dr[Patient.PtMRN].ToString();
                            fuRow["DueDate"] = dueDate.ToShortDateString();
                            fuRow["FUMonth"] = month.ToString();
                            fuRow["ProcName"] = dr[Procedure.ProcName].ToString();
                            fuRow["ProcDate"] = surgDate.ToShortDateString();
                            fuRow["Surgeon"] = da.GetMostRecentTreatingPhysician(Int32.Parse(pId));
                            fuRow["SurveyName"] = currentSurveyDueName;

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

                            fuPatientsDt.Rows.Add(fuRow);

                            _redirectPath += "&" + dr[Patient.PatientId].ToString() + "=" + month + "_" + currentSurveyDueName;
                        }
                    }

                    if (breakLoop) break;
                }
            }

            CreateBatchButton.Attributes.Add("onclick", "window.location.href='" + _redirectPath + "'");

            return fuPatientsDt;
        }

        private bool PassesSurveyReceivedRule(int[,] surveyMonths, int i, string patientId, string selectedSurvey)
        {
            bool passesRule = true;

            // get name for Pre TX Survey
            int month = 0;
            string surveyName = FollowUpUtil.GetSurveyFullName(month, selectedSurvey);

            // if patient has already answered a Pre TX Survey
            if (SurveyAlreadyReceived(surveyName, month, Int32.Parse(patientId)))
            {
                int index = i;

                // ensure we are at, at least, the fourth survey (month 12) to be sent
                if (index > 2)
                {
                    int numOfSurveysMissed = 0;

                    // check if the last 3 surveys were all sent, but not received
                    for (int j = 1; j <= 3; j++)
                    {
                        index--;
                        month = surveyMonths[index, 0];
                        surveyName = FollowUpUtil.GetSurveyFullName(month, selectedSurvey);

                        if (SurveyAlreadySent(surveyName, month, Int32.Parse(patientId)) && !SurveyAlreadyReceived(surveyName, month, Int32.Parse(patientId)))
                            numOfSurveysMissed++;
                        else
                            break;
                    }

                    // if last 3 surveys were all sent, but none received, DO NOT send current survey
                    if (numOfSurveysMissed == 3)
                        passesRule = false;
                }
            }
            // if patient has NOT answered a Pre TX Survey
            else
            {
                // send no other surveys
                passesRule = false;
            }
            return passesRule;
        }


        /// <summary>
        /// Returns true if survey was already sent. False otherwise.
        /// ActionItem is of form "NAME x Month Survey Sent", where x is month number and NAME is from SurveyKey
        /// </summary>
        /// <param name="surveyName"></param>
        /// <param name="month"></param>
        /// <returns></returns>
        private bool SurveyAlreadySent(string surveyName, int month, int patientId)
        {
            // 1. check Action to see if Action exists for this survey/month
            string actionName = FollowUpUtil.GetSurveyActionItem(surveyName, month.ToString());

            FollowUpDA da = new FollowUpDA();
            return da.SurveyAlreadySent(patientId, actionName);
        }

        /// <summary>
        /// Returns true if survey was receieved. False otherwise.
        /// ActionItem is of form "NAME x Month Sent", where x is month number and NAME is from SurveyKey
        /// </summary>
        /// <param name="surveyName"></param>
        /// <param name="month"></param>
        /// <param name="patientId"></param>
        /// <returns></returns>
        private bool SurveyAlreadyReceived(string surveyName, int month, int patientId)
        {
            // retrieve action tiem
            string actionItem = FollowUpUtil.GetSurveyActionItem(surveyName, month.ToString());

            if (!String.IsNullOrEmpty(actionItem))
            {
                FollowUpDA da = new FollowUpDA();

                // if nothing returned, survey data has not been entered, therefore survey has not been received
                DataTable dt = da.GetSurveyByActionItem(patientId, actionItem);

                if (dt.Rows.Count > 0)
                    return true;
                else
                    return false;
            }
            else
                return false;

        }

        /// <summary>
        /// Returns the date of the last survey sent that matches the ActionItem for this patient.
        /// ActionItem is of form "NAME x Month Sent"
        /// </summary>
        /// <param name="surveyShortType">Either "QOL" or "EPIC"</param>
        /// <param name="month"></param>
        /// <returns></returns>
        private DataTable GetThisLastSurveySentRecord(string surveyName, int month, int patientId)
        {
            string actionName = FollowUpUtil.GetSurveyActionItem(surveyName, month.ToString());

            FollowUpDA da = new FollowUpDA();
            DataTable dt = da.GetThisLastSurveySent(patientId, actionName);

            return dt;
        }

        protected void ExportToExcelClick(object sender, EventArgs e)
        {
            DataTable XLDt = SetFollowUpList();

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
            if (XLDt.Columns["PtMRN"] != null) XLDt.Columns["PtMRN"].ColumnName = "MRN";
            if (XLDt.Columns["DueDate"] != null) XLDt.Columns["DueDate"].ColumnName = "Due Date";
            if (XLDt.Columns["FUMonth"] != null) XLDt.Columns["FUMonth"].ColumnName = "Follow Up Month";
            if (XLDt.Columns["ProcName"] != null) XLDt.Columns["ProcName"].ColumnName = "Procedure Name";
            if (XLDt.Columns["ProcDate"] != null) XLDt.Columns["ProcDate"].ColumnName = "Procedure Date";
            if (XLDt.Columns["Surgeon"] != null) XLDt.Columns["Surgeon"].ColumnName = "Treating Physician";
            if (XLDt.Columns["SurveyName"] != null) XLDt.Columns["SurveyName"].ColumnName = "Survey";
            if (XLDt.Columns["Address1"] != null) XLDt.Columns["Address1"].ColumnName = "Address1";
            if (XLDt.Columns["Address2"] != null) XLDt.Columns["Address2"].ColumnName = "Address2";
            if (XLDt.Columns["City"] != null) XLDt.Columns["City"].ColumnName = "City";
            if (XLDt.Columns["State"] != null) XLDt.Columns["State"].ColumnName = "State";
            if (XLDt.Columns["Zip"] != null) XLDt.Columns["Zip"].ColumnName = "Zip";

            DataView qryDataReportView = XLDt.DefaultView;
            Caisis.Controller.ExcelExporter.ExportToExcel(this, qryDataReportView, "Patient Surveys Due Results", "PatientSurveysDue.xls");
        }
    }
 
}