using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.DataVisualization;
using System.Web.UI.DataVisualization.Charting;
using System.Drawing;

using Caisis.BOL;
using Caisis.DataAccess;
using Caisis.Extensions;
using Caisis.UI.Core.Classes;
using Caisis.UI.Core.Utilities;

namespace Caisis.UI.Modules.Breast.Reports
{
    public partial class BreastQScoresBySurvey : BaseReportPage
    {
        private static readonly string[] types = new string[] { "Tram", "Implants", "Tissue Expander", "Reduction", "Augmentation", "Lumpectomy", "Mastectomy" };
        private Dictionary<string, IEnumerable<string>> typesToSurveys = new Dictionary<string, IEnumerable<string>>();

        private readonly string[] LUMPECTOMY_SURVEYS = new string[]
        {
            "Lumpectomy Preop",  
            "Lumpectomy 2 Weeks",
            "Lumpectomy 6 Weeks",
            "Lumpectomy 3 Months",
            "Lumpectomy 6 Months",
            "Lumpectomy Yearly"
        };

        private readonly Dictionary<string, IEnumerable<string>> ALIAS_TO_SURVEYS = new Dictionary<string, IEnumerable<string>>
        {
            {
                "Breast Q: Mastectomy Pre",
                new string[]
                {
                    "Mastectomy Preop"
                }
            },
            {
                "Breast Q: Mastectomy Post",
                new string[]
                {
                    "Mastectomy 2 weeks",
                    "Mastectomy 6 weeks",
                    "Mastectomy 3 months",
                    "Mastectomy 6 months",
                    "Mastectomy yearly"
                }
            }
        };

        public override string ReportTitle
        {
            get
            {
                return "Breast Q Scores by Survey";
            }
        }

        protected override void Page_Load(object sender, EventArgs e)
        {
            var surveyTypes = BuildSurveyMappings();
            if (!Page.IsPostBack)
            {
                BuildSurveys(surveyTypes);
            }
        }

        private IEnumerable<string> BuildSurveyMappings()
        {
            typesToSurveys.Clear();
            CaisisBreastQEngine engine = new CaisisBreastQEngine();
            var definitions = engine.GetAllDefinitions();
            foreach (string type in types)
            {
                var surveyTypes = definitions.Where(d => d.SurveyType.Contains(type)).Select(d => d.SurveyType);
                if (surveyTypes.Count() > 0 && !typesToSurveys.ContainsKey(type))
                {
                    typesToSurveys.Add(type, surveyTypes.ToArray());
                }
            }
            return typesToSurveys.Keys;
        }

        /// <summary>
        /// Populate select with list of Breast Q Surveys
        /// </summary>
        /// <param name="surveyTypes"></param>
        private void BuildSurveys(IEnumerable<string> surveyTypes)
        {
            SurveyGroupSelection.DataSource = surveyTypes;
            SurveyGroupSelection.DataBind();
        }

        protected void OnSurveyGroupChange(object sender, EventArgs e)
        {
            string surveyGroup = SurveyGroupSelection.Value;
            SurveySelection.Items.Clear();
            if (!string.IsNullOrEmpty(surveyGroup))
            {
                var surveyTypes = GetSurveyTypesByGroup(surveyGroup);
                SurveySelection.ShowEmptyListItem = false;
                SurveySelection.DataSource = surveyTypes;
                SurveySelection.DataBind();
                SurveySelection.Items.Insert(0, new ListItem("--- All " + surveyGroup + " Surveys ---", ""));
                SurveySelection.Visible = true;
                ReportBtn.Visible = true;
            }
            else
            {
                SurveySelection.Visible = false;
                ReportBtn.Visible = false;
            }
            ResultsPanel.Visible = false;
        }

        protected void OnSurveyChange(object sender, EventArgs e)
        {
            string surveyGroup = SurveyGroupSelection.Value;
            string subType = SurveySelection.Value;
            if (!string.IsNullOrEmpty(surveyGroup))
            {
                BuildBreastQReport(surveyGroup, subType);
                ResultsPanel.Visible = true;
                base.LogReportView();
            }
            else
            {
                ResultsPanel.Visible = false;
            }
        }

        protected void OnExportClick(object sender, EventArgs e)
        {
            string surveyType = SurveyGroupSelection.Value;
            string subType = SurveySelection.Value;

            if (!string.IsNullOrEmpty(surveyType))
            {
                ExportBreastQReport(surveyType, subType);
            }
        }

        /// <summary>
        /// Returns a the survey name used for scoring
        /// </summary>
        /// <param name="surveyType"></param>
        /// <returns></returns>
        protected string GetNormalizedScoringSurvey(string surveyType)
        {
            // search alias table
            foreach (var type in ALIAS_TO_SURVEYS)
            {
                if (type.Value.Contains(surveyType))
                    return type.Key;
            }
            return surveyType;
        }

        private void BuildBreastQReport(string surveyGroup, string subType)
        {
            DataView reportView = GetBreastQReport(surveyGroup, subType);
            // set datagrid columns
            string[] excludeColumns = new string[] { "MRN", "Survey" };
            // clear static columns, add dynamic columns
            while (BreastQScores.Columns.Count > excludeColumns.Length)
            {
                BreastQScores.Columns.RemoveAt(1);
            }
            for (int i = 0; i < reportView.Table.Columns.Count; i++)
            {
                DataColumn column = reportView.Table.Columns[i];
                string colName = column.ColumnName;
                if (!excludeColumns.Contains(colName))
                {
                    BoundField boundColumn = new BoundField();
                    boundColumn.DataField = colName;
                    boundColumn.HeaderText = colName;
                    BreastQScores.Columns.Add(boundColumn);
                }
            }
            BreastQScores.DataSource = reportView;
            BreastQScores.DataBind();

            bool hasRecords = reportView.Count > 0;
            BreastQScores.Visible = hasRecords;
            NoResults.Visible = !hasRecords;
            NoResults.Text = string.Format("No results for survey '{0}'.", surveyGroup);
            ExportBtn.Visible = base.CanExportToExcel() && hasRecords;
        }

        private void ExportBreastQReport(string surveyGroup, string subType)
        {
            var dataView = GetBreastQReport(surveyGroup, subType);
            base.ExportToExcel(dataView);
        }

        private DataView GetBreastQReport(string surveyGroup, string subType)
        {
            // validate type map
            if (!typesToSurveys.ContainsKey(surveyGroup))
                return new DataTable().DefaultView;
            IEnumerable<string> surveyTypes = typesToSurveys[surveyGroup];

            Caisis.Controller.PatientController pc = new Controller.PatientController();
            string datasetSQL = CacheManager.GetDatasetSQL(Session[SessionKey.DatasetId]);
            CaisisBreastQEngine engine = new CaisisBreastQEngine();
            SurveyDa surveyDA = new SurveyDa();
            List<Dictionary<string, string>> allScores = new List<Dictionary<string, string>>();
            var aliasMap = GetAliasToSurveys();
            foreach (string surveyType in surveyTypes)
            {
                var survey = engine.GetSurveyDefinition(surveyType);
                var scales = survey.Definitions;
                string[] questions = scales.SelectMany(s => s.Questions).Distinct().ToArray();

                string[] _surveyTypes = new string[] { surveyType };
                // special case
                if (aliasMap.ContainsKey(surveyType))
                    _surveyTypes = aliasMap[surveyType].ToArray();
                foreach (string _surveyType in _surveyTypes)
                {
                    // optional filter by exact survey
                    if (string.IsNullOrEmpty(subType) || subType.Equals(_surveyType, StringComparison.OrdinalIgnoreCase))
                    {

                        string engineSurveyType = surveyType;
                        // TODO: refactor into generic class to read and fill scores data table
                        // read pivotted row (patient+survey+questions), and score
                        surveyDA.ConsumeBreastQSurveyData(datasetSQL, _surveyType, questions, (record) =>
                        {
                            // get responses, 1a=>2, 1b=>2, ...
                            Dictionary<string, string> responses = questions.ToDictionary(q => q, q => record[q].ToString());
                            // get scores by scale, Satisfaction With Breasts => 56, ...
                            Dictionary<string, BreastQ.BreastQScaleScore> scores = engine.GetSurveyScoreByScale(engineSurveyType, responses);
                            // create column values
                            Dictionary<string, string> values = new Dictionary<string, string>();
                            // add required columns
                            values.Add("MRN", pc.GetPatientMRN(record["PtMRN"].ToString()));
                            values.Add("Survey", _surveyType);
                            values.Add("Date", string.Format("{0:d}", record["SurveyDate"]));
                            // fill in scale scores
                            foreach (var score in scores)
                            {
                                string scaleName = score.Key;
                                string scaleValue = "";
                                // valida score
                                if (score.Value.Error == QScoreLibrary.Estimation.eErrors.eNoError)
                                {
                                    scaleValue = score.Value.Score.ToString();
                                }
                                // error in scoring
                                else
                                {
                                    scaleValue = "FAIL: " + engine.GetQScoreErrorString(score.Value.Error);
                                }

                                //values.Add(score.Key, score.Value.Score.ToString());
                                values.Add(scaleName, scaleValue);
                            }

                            // add row
                            allScores.Add(values);

                            // continue
                            return true;
                        });
                    }
                }
            }

            // get a list of columns across patients (i.e., PtMRN, Date, Scale 1, Scale 3, Scale 7)
            string[] columns = allScores.SelectMany(s => s.Keys).Distinct().ToArray();
            string[] patientColumns = new string[] { "MRN", "Survey", "Date" };
            string[] scaleColumns = columns.Except(patientColumns).ToArray();
            // normalize datasource
            DataTable dataSource = new DataTable();
            dataSource.Columns.AddRange(columns.Select(c => new DataColumn(c, typeof(String))).ToArray());
            // for each row, normalize values
            foreach (var row in allScores)
            {
                object[] values = new object[columns.Length];
                for (int i = 0; i < columns.Length; i++)
                {
                    string column = columns[i];
                    // add patient columns
                    if (patientColumns.Contains(column))
                    {
                        values[i] = row[column];
                    }
                    else if (scaleColumns.Contains(column))
                    {
                        // applicable scale
                        if (row.ContainsKey(column))
                        {
                            values[i] = row[column];
                        }
                        // non-applicable scale
                        else
                        {
                            values[i] = "N/A";
                        }
                    }

                }
                dataSource.Rows.Add(values);
            }

            return dataSource.DefaultView;
        }

        private IEnumerable<string> GetSurveyTypesByGroup(string surveyGroup)
        {
            List<string> surveyTypes = new List<string>();
            var aliasMap = GetAliasToSurveys();
            foreach (string surveyGroupType in aliasMap.Keys)
            {
                if (surveyGroupType.Contains(surveyGroup))
                {
                    surveyTypes.AddRange(aliasMap[surveyGroupType]);
                }
            }
            if (surveyTypes.Count() > 0)
                return surveyTypes;
            else if (typesToSurveys.ContainsKey(surveyGroup))
                return typesToSurveys[surveyGroup];
            else
                return new string[0];
        }

        private Dictionary<string, IEnumerable<string>> GetAliasToSurveys()
        {
            // TODO: Combine static listings with lookup surveys
            var SearchSurveys = LUMPECTOMY_SURVEYS.ToDictionary(s => s, s => new string[] { s });
            foreach (string alias in ALIAS_TO_SURVEYS.Keys)
            {
                var surveys = ALIAS_TO_SURVEYS[alias].ToArray();
                SearchSurveys.Add(alias, surveys);
            }
            return SearchSurveys.ToDictionary(s => s.Key, s => s.Value.AsEnumerable());
        }

    }
}