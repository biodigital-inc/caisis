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

using Caisis.DataAccess;
using Caisis.BOL;
using Caisis.UI.Core.Classes;

namespace Caisis.UI.Modules.FollowUp
{

    public partial class CompleteSurveys : SurveyBasePage
    {
        private static readonly string reportTitle = "Complete Surveys";

        protected override void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                // Default Dates
                StartDateField.Value = DateTime.Today.Subtract(TimeSpan.FromDays(31)).ToShortDateString();
                EndDateField.Value = DateTime.Today.ToShortDateString();

                FollowUpUtil.PopulateSurveyDropDown(ddlSurveyType);
            }
        }

        /// <summary>
        /// Handle click of run report
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void RunReportClick(object sender, EventArgs e)
        {
            int recordCount = 0;

            // Get report from db and bind to grid
            DataView reportView = GetReport();
            ReportGrid.DataSource = reportView;
            ReportGrid.DataBind();
            recordCount = reportView.Count;

            if (recordCount == 1)
            {
                UserText.Text = "There is 1 record";
            }
            else
            {
                UserText.Text = "There are " + recordCount + " records";
            }
            // log report view
            base.LogReportView(reportTitle);
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void ExportToExcelClick(object sender, EventArgs e)
        {
            DataView reportView = GetReport();
            base.ExportToExcel(reportView, reportTitle, "SurveyHistory.xls");
        }
 
        /// <summary>
        /// 
        /// </summary>
        /// <returns></returns>
        private DataView GetReport()
        {
            DateTime startDate = !string.IsNullOrEmpty(StartDateField.Value) ? DateTime.Parse(StartDateField.Value) : DateTime.Today;
            DateTime endDate = !string.IsNullOrEmpty(EndDateField.Value) ? DateTime.Parse(EndDateField.Value) : DateTime.Today;

            string surveyType = ddlSurveyType.SelectedValue + "%";

            FollowUpDA da = new FollowUpDA();
            DataTable dt = da.GetCompletedSurveysByType(startDate.ToShortDateString(), endDate.ToShortDateString(), surveyType);

            DataTable myTable = new DataTable();
            string[] colNames = new string[] { "MRN", "Patient Name", "SurveyId", "Survey", "Month", "Sent Date", "Received Date" };
            foreach (string colName in colNames)
            {
                myTable.Columns.Add(new DataColumn(colName));
            }

            // get the names of the scoring sections for the column names from the first survey returned
            if (dt.Rows.Count > 0)
            {
                int surveyId = (int)dt.Rows[0][Survey.SurveyId];
                DataTable scoreDt1 = SurveyScoringUtil.FillScores(surveyId);

                foreach (DataRow dr1 in scoreDt1.Rows)
                {
                    myTable.Columns.Add(new DataColumn(dr1["Section"].ToString()));
                }
            }



            foreach (DataRow dr in dt.Rows)
            {
                DataRow newRow = myTable.NewRow();
                string ptName = dr[Patient.PtFirstName].ToString() + " " + dr[Patient.PtMiddleName].ToString() + " " + dr[Patient.PtLastName].ToString();
                int surveyId = int.Parse(dr[Survey.SurveyId].ToString());

                // get table with scores
                DataTable scoreDt2 = new DataTable();
                scoreDt2 = SurveyScoringUtil.FillScores(surveyId);

                newRow["MRN"] = dr[Patient.PtMRN].ToString();
                newRow["Patient Name"] = ptName;
                newRow["SurveyId"] = dr[Survey.SurveyId].ToString();
                newRow["Survey"] = dr[Survey.SurveyType].ToString();

                string actionItemStr = dr[Caisis.BOL.Action.ActionItem].ToString();
                string surveyMonth = FollowUpUtil.GetSurveyMonthNoFromActionItem(actionItemStr);
                newRow["Month"] = surveyMonth;

                newRow["Sent Date"] =  DateTime.Parse(dr[Caisis.BOL.Action.ActionDate].ToString()).ToShortDateString();
                newRow["Received Date"] = DateTime.Parse(dr[Survey.SurveyDate].ToString()).ToShortDateString();

                // translate the scores that are in rows to columns in this patients record
                for (int i = 0; i < scoreDt2.Rows.Count; i++)
                {
                    int columnIndex = i + 7;
                    newRow[columnIndex] = scoreDt2.Rows[i]["AverageStandardized"].ToString();
                }

                myTable.Rows.Add(newRow);
            }
        
            return myTable.DefaultView;
        }
    }
}