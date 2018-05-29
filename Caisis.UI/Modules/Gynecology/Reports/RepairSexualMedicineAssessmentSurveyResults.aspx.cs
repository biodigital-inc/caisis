using System;
using System.Data;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Configuration;
using System.DirectoryServices;

using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;

using System.Data.SqlClient;
using System.Web.Security;

using Caisis.DataAccess;
using Caisis.BOL;

using Caisis.UI.Core.Classes;
using Caisis.UI.Core.Classes.CustomControls;
using Caisis.Controller;

namespace Caisis.UI.Modules.Gynecology.Reports
{
    public partial class RepairSexualMedicineAssessmentSurveyResults : BaseReportPage
    {
        private static readonly string[] RESTRICTED_GROUPS = new string[]
        {
            "SystemAdministrators",
            "MSKGyn_RSAs",
            "MSKGYN_DataAnalysis"
        };

        private KeyValuePair<string, string>[] SCORE_COLUMNS = new KeyValuePair<string, string>[]
                {
                    new KeyValuePair<string, string>( "FSFI Score", "FSFI" ),
                    new KeyValuePair<string, string>( "SSS Score",  "SSS" ),
                    new KeyValuePair<string, string>( "Total VAS Score", "Total VAS" ),
                    new KeyValuePair<string, string>( "Composite VAS Score", "Composite VAS" )
                };

        private int totalCount = 0;
        private int differentCount = 0;

        protected override void Page_Load(object sender, EventArgs e)
        {
            // validate GROUP access
            string userName = new Security.SecurityController().GetUserName();
            GroupDa da = new GroupDa();
            var userGroupNames = da.GetUserGroups(userName).Tables[0].AsEnumerable().Select(r => r[BOL.Group.GroupName].ToString());
           
            // if user is not in special group, end response
            if (RESTRICTED_GROUPS.Intersect(userGroupNames).Count() == 0)
            {
                Page.Visible = false;
                Response.End();
            }

            base.Page_Load(sender, e);
            base.EnableViewState = true;
            if (!Page.IsPostBack)
            {
                // default dates
                FromDate.Text = DateTime.Today.AddMonths(-1).ToShortDateString();
                ToDate.Text = DateTime.Today.ToShortDateString();
            }
        }

        protected void RunReport(object sender, EventArgs e)
        {
            RepairSurveyResults();
        }

        private void RepairSurveyResults()
        {
            ReportConfigurations rc = new ReportConfigurations();
            rc.LoadReportsFromXml(ReportConfigurationType.User);
            if (rc.ContainsKey("SexualMedicineAssessmentSurveyResults"))
            {
                var report = rc.GetReportById("SexualMedicineAssessmentSurveyResults");
                string sql = report.StoredProcedure;
                string datasetSQL = CacheManager.GetDatasetSQL(Session[SessionKey.DatasetId]);
                var sqlParams = new Dictionary<string, string>
                    {
                        { "FromDate", FromDate.Value },
                        // System.Data.SqlTypes.SqlDateTime.MinValue.Value.ToShortDateString() 
                        { "ToDate", ToDate.Value  }
                        // System.Data.SqlTypes.SqlDateTime.MaxValue.Value.ToShortDateString()
                    };
                AdminReportsDa da = new AdminReportsDa();
                DataView results = da.GetAdminReport(datasetSQL, sql, sqlParams, false).Tables[0].DefaultView;
                results.Sort = "[SurveyDate] ASC, [MRN] ASC";

                // reset counts
                totalCount = results.Count;
                differentCount = 0;

                SurveyGrid.DataSource = results;
                SurveyGrid.DataBind();

                // set counts: should be updated on data bound
                TotalCount.Text = totalCount.ToString();
                DifferentCount.Text = differentCount.ToString();
            }
        }

        protected void SetColumnValues(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                // set survey id
                ICaisisInputControl surveyIdField = e.Row.FindControl("SurveyId") as ICaisisInputControl;
                surveyIdField.Value = DataBinder.Eval(e.Row.DataItem, "SurveyId").ToString();

                // for each score, set hidden field and lookup
                Dictionary<string, string> scoresToValues = new Dictionary<string, string>();
                foreach (var column in SCORE_COLUMNS)
                {
                    string columnName = column.Key;
                    string columnDisplayName = column.Value;
                    string columnValue = DataBinder.Eval(e.Row.DataItem, columnName).ToString();
                    // add score
                    scoresToValues.Add(columnName, columnValue);
                    // store discrete values
                    string scoreFieldId = columnName.Replace(" ", "");
                    var scoreField = e.Row.FindControl(scoreFieldId) as ICaisisInputControl;
                    scoreField.Value = columnValue;
                }
                // compare source and target
                string currentSurveyNotes = DataBinder.Eval(e.Row.DataItem, Survey.SurveyNotes).ToString();
                string calculatedSurveyNotes = GetComputedSurveyNotes(currentSurveyNotes, scoresToValues);
                bool doesCurrentMatchCalculated = DoLinesMatch(currentSurveyNotes, calculatedSurveyNotes);

                HtmlGenericControl actualValueText = e.Row.FindControl("ActualValueText") as HtmlGenericControl;
                HtmlGenericControl targetValueText = e.Row.FindControl("TargetValueText") as HtmlGenericControl;
                // set display values
                actualValueText.InnerText = currentSurveyNotes;
                targetValueText.InnerText = calculatedSurveyNotes;

                // set diff field
                var auditCell = e.Row.Cells[e.Row.Cells.Count - 2];
                auditCell.Text = (!doesCurrentMatchCalculated).ToString();
                if (!doesCurrentMatchCalculated)
                {
                    auditCell.CssClass = "AuditCellMismatch";
                    differentCount++;
                }
            }
        }

        protected void FixSelected(object sender, EventArgs e)
        {
            foreach (GridViewRow row in SurveyGrid.Rows)
            {
                CheckBox doUpdateField = row.FindControl("DoUpdate") as CheckBox;
                if (doUpdateField.Checked)
                {
                    FixSelected(row);
                }
            }
            // update report
            RunReport(sender, e);
        }

        protected void FixSelected(object sender, CommandEventArgs e)
        {
            // locate target value
            var row = (sender as Control).NamingContainer;
            FixSelected(row);

            // update report
            RunReport(sender, e);
        }

        protected void FixSelected(Control row)
        {

            ICaisisInputControl surveyIdField = row.FindControl("SurveyId") as ICaisisInputControl;
            int surveyId = int.Parse(surveyIdField.Value);

            // create a lookup for each discrete score
            Dictionary<string, string> scoresToValues = new Dictionary<string, string>();
            foreach (var column in SCORE_COLUMNS)
            {
                string columnName = column.Key;
                string columnDisplayName = column.Value;
                string scoreFieldId = columnName.Replace(" ", "");
                var scoreField = row.FindControl(scoreFieldId) as ICaisisInputControl;
                string scoreValue = scoreField.Value;

                scoresToValues.Add(columnName, scoreValue);
            }
            // update notes field
            Survey survey = new Survey();
            survey.Get(surveyId);
            // get current notes
            string sourceSurveyNotes = survey[Survey.SurveyNotes].ToString();
            // get computed notes
            string computedSurveyNotes = GetComputedSurveyNotes(sourceSurveyNotes, scoresToValues);
            // update notes field
            survey[Survey.SurveyNotes] = computedSurveyNotes;
            survey.Save();
        }

        private string GetComputedSurveyNotes(string sourceNotes, Dictionary<string, string> scoresAndValues)
        {
            string[] sourceLines = GetLines(sourceNotes);
            List<string> newLines = new List<string>();
            for (int i = 0; i < SCORE_COLUMNS.Length; i++)
            {
                string column = SCORE_COLUMNS[i].Key;
                string displayName = SCORE_COLUMNS[i].Value;
                string value = scoresAndValues[column].ToString();
                if (string.IsNullOrEmpty(value))
                    continue;
                string displayValue = displayName + " : " + value;
                bool exists = false;
                for (int j = 0; j < sourceLines.Length; j++)
                {
                    string sourceLine = sourceLines[j];
                    // replace current line
                    if (sourceLine.StartsWith(displayName))
                    {
                        sourceLines[j] = displayValue;
                        exists = true;
                        break;
                    }
                }
                if (!exists)
                    newLines.Add(displayValue);
            }
            var buffer = sourceLines.Concat(newLines).ToArray();
            string notes = string.Join("\n", buffer);

            return notes;
        }

        private bool DoLinesMatch(string lineA, string lineB)
        {
            var linesA = GetLines(lineA);
            var linesB = GetLines(lineB);
            return linesA.Length == linesB.Length && linesA.Intersect(linesB).Count() == linesA.Count();
        }

        private string[] GetLines(string source)
        {
            string[] sourceLines = source.Split('\n').Select(line => line.TrimEnd("\r".ToCharArray())).ToArray();
            return sourceLines;
        }
    }
}