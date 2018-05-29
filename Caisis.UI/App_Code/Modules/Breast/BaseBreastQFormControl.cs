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

using Caisis.UI.Modules.Breast.Reports;

namespace Caisis.UI.Modules.Breast.PaperForms
{
    /// <summary>
    /// Summary description for BaseBreastQFormControl
    /// </summary>
    public class BaseBreastQFormControl : BasePaperFormControl
    {
        protected static readonly Font DEFAULT_FONT = new System.Drawing.Font("Arial", 12, System.Drawing.FontStyle.Bold);

        protected readonly string[] codes = new string[0];

        // chart
        protected string scleChartXAxisLabel = "SurveyTypeTitle";

        // DA
        protected SurveyDa surveyDA = new SurveyDa();
        // engine
        protected CaisisBreastQServices service;
        protected CaisisBreastQEngine engine;

        /// <summary>
        /// A list of CPT Codes and Procedure names representing the primary procedure details to display
        /// </summary>
        protected static IDictionary<int, string> BREASTQ_CPT_CODES = new Dictionary<int, string>
        {
            { 19364, "Tram"},
            { 19367, "Tram" },
            { 19368, "Tram" },
            { 19357, "Tissue Expander" },
            { 11970, "Implants"},
            { 19340, "Implants" },
            { 11971, "Complications" },
            { 19328, "Complications" }
        };

        #region COLORS

        protected static IDictionary<string, System.Drawing.Color> BREASTQ_PROCESS_OF_CARE_SCALE = new Dictionary<string, System.Drawing.Color>(
new Dictionary<string, System.Drawing.Color>
        {
            { "Satisfaction with Information", System.Drawing.ColorTranslator.FromHtml("#4F81BD") },
            { "Satisfaction with Surgeon", System.Drawing.ColorTranslator.FromHtml("#C0504D") },
            { "Satisfaction with Medical Team", System.Drawing.ColorTranslator.FromHtml("#9BBB59") },
            { "Satisfaction with Office Staff", System.Drawing.ColorTranslator.FromHtml("#8064A2") }
        }, StringComparer.OrdinalIgnoreCase);

        int colorIndex = 0;

        protected static readonly Color[] COLOR_WHEEL = new Color[]
        {
            Color.FromArgb(79,129,189),
            Color.FromArgb(192,0,0),
            Color.FromArgb(255,192,0),
            Color.FromArgb(0,176,80),
            Color.FromArgb(230,185,184),
            Color.FromArgb(96,74,123), 
        };

        /// <summary>
        /// Gets the next Color on the Color Wheel
        /// </summary>
        /// <returns></returns>
        protected Color GetNextColor()
        {
            var color = COLOR_WHEEL[colorIndex++ % COLOR_WHEEL.Length];
            return color;
        }

        #endregion

        public BaseBreastQFormControl()
            : base()
        {
            // init engine
            this.Init += (o, e) => InitBreastQ();
        }

        protected override void Page_Load(object sender, EventArgs e)
        {
            base.Page_Load(sender, e);
        }

        /// <summary>
        /// Returns a list of each chart on the page
        /// </summary>
        /// <returns></returns>
        public virtual IEnumerable<CaisisChart> GetCharts()
        {
            return PageUtil.GetControls<CaisisChart>(Page);
        }

        #region get data

        /// <summary>
        /// 
        /// </summary>
        /// <param name="typeMatch"></param>
        /// <returns></returns>
        protected DataTable GetSurveyItemsByType(string typeMatch)
        {
            string sqlMatch = typeMatch + "%";
            // i.e., "Breast Q: Implants" => ["Breast Q: Implants 2 weeks", "Breast Q: Implants 6 weeks", ...]
            DataTable surveysByType = surveyDA.GetSurveysAndItemsByType(patientID, sqlMatch, null, null);
            return surveysByType;
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="typeMatch"></param>
        /// <returns></returns>
        protected IEnumerable<BreastQPoint> GetBreastQPointsByType(string typeMatch)
        {
            // i.e., "Breast Q: Implants" => ["Breast Q: Implants 2 weeks", "Breast Q: Implants 6 weeks", ...]
            var matches = engine.GetAllDefinitions().Where(s => s.SurveyType.StartsWith(typeMatch, StringComparison.OrdinalIgnoreCase));
            IEnumerable<BreastQPoint> pointsByType = matches.SelectMany(def => service.GetBreastQPointsByPatient(patientID, def.SurveyType, "", def.Definitions.SelectMany(d => d.Questions).ToArray()));
            return pointsByType;
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="SurveyType"></param>
        /// <param name="SurveyTypeAlias"></param>
        /// <returns></returns>
        protected IEnumerable<BreastQPoint> GetBreastQPointsByTypeByAlias(string SurveyType, string SurveyTypeAlias)
        {
            var def = engine.GetAllDefinitions().FirstOrDefault(s => s.SurveyType.Equals(SurveyTypeAlias, StringComparison.OrdinalIgnoreCase));
            if (def != null)
            {
                return service.GetBreastQPointsByPatient(patientID, SurveyType, SurveyTypeAlias, def.Definitions.SelectMany(d => d.Questions).ToArray());
            }
            else
            {
                return new BreastQPoint[0];
            }
        }

        #endregion

        #region build charts

        /// <summary>
        /// For the given SurveyType pull all surveys, score, group and graph
        /// <param name="scalesRptr"></param>
        /// <param name="noSurveyMsg"></param>
        /// <param name="SurveyTypeMatch">The name of the Survey to match</param>
        /// <param name="breastQPoints"></param>
        /// </summary>
        protected void BuildReportCharts(Repeater scalesRptr, System.Web.UI.HtmlControls.HtmlControl noSurveyMsg, string SurveyTypeMatch, string SurveyTypeAlias, IEnumerable<BreastQPoint> breastQPoints)
        {
            var surveyByTypesAndScores = from p in breastQPoints
                                         // cleanup: flatten surveys (i.e., Tram 2 Month x2)
                                         group p by new { Type = p.SurveyType, Scale = p.ScaleName } into g
                                         select g.First();

            var scoresByScale = from survey in surveyByTypesAndScores
                                group survey by survey.ScaleName into scaleGroup
                                let scaleName = scaleGroup.Key
                                let scaleSurveys = scaleGroup.OrderBy(s => s.SurveyDateTicks)
                                select new
                                {
                                    // normalized scale name
                                    ScaleName = scaleName,
                                    // as IEnumerable<BreastQPoint>
                                    ScaleData = scaleSurveys,
                                    // as DataView
                                    ScaleDataView = ToDataView(scaleName, scaleSurveys.Select(s => new object[] { s.SurveyType, GetSurveyTypeTitle(s.SurveyType, SurveyTypeMatch), new DateTime(s.SurveyDateTicks), s.SurveyDateText, s.ScaleName, s.ScaleScore }))
                                };

            // SPECIAL CASE: extract special scales
            var specialScales = from scale in scoresByScale
                                where BREASTQ_PROCESS_OF_CARE_SCALE.Keys.Contains(scale.ScaleName, StringComparer.OrdinalIgnoreCase)
                                select scale;
            // STANDARD CASE: a list of standard scales to build
            var stdScales = from scale in scoresByScale
                            where !BREASTQ_PROCESS_OF_CARE_SCALE.Keys.Contains(scale.ScaleName, StringComparer.OrdinalIgnoreCase)
                            select scale;

            // BUILD: build specialized ProcessOfCare chart
            int lastIndex = stdScales.Count() - 1;
            scalesRptr.ItemDataBound += (r, e) =>
            {
                // show process of care in footer
                if (e.Item.ItemType == ListItemType.Footer)
                {
                    var ProcessOfCareChart = e.Item.FindControl("ProcessOfCareChart") as BaseBreastQChartControl;
                    var ProcessOfCareLabel = e.Item.FindControl("ProcessOfCareLabel");

                    // get last scale
                    var lastType = from scaleData in specialScales.SelectMany(s => s.ScaleData)
                                   orderby scaleData.SurveyDateTicks descending
                                   select scaleData.SurveyType;
                    if (lastType.Count() > 0)
                    {
                        string lastSurveyType = lastType.First();
                        var data = from scale in specialScales
                                   from survey in scale.ScaleData
                                   where survey.SurveyType == lastSurveyType
                                   select survey;
                        // process of care data point
                        var processDataPoints = from scale in BREASTQ_PROCESS_OF_CARE_SCALE
                                                let scaleName = scale.Key
                                                let scaleColor = scale.Value
                                                let points = data.Where(s => s.ScaleName.Equals(scaleName, StringComparison.OrdinalIgnoreCase))
                                                select new
                                                {
                                                    Name = scaleName,
                                                    Color = scaleColor,
                                                    Points = points.ToDictionary(p => p.ScaleName, p => p.ScaleScore)
                                                };
                        var processDataSource = processDataPoints.ToDictionary(p => p.Color, p => p.Points);
                        var _processDataPoints = from scale in BREASTQ_PROCESS_OF_CARE_SCALE
                                                 let scaleName = scale.Key
                                                 let scaleColor = scale.Value
                                                 let points = data.Where(s => s.ScaleName.Equals(scaleName, StringComparison.OrdinalIgnoreCase))
                                                 let label = ""
                                                 let axisLabel = scaleName.Replace("Satisfaction with", "")
                                                 let xValue = scaleName
                                                 let yValues = points.Select(p => (double)p.ScaleScore).ToArray()
                                                 select new CaisisDataPoint(label, axisLabel, scaleColor, xValue, yValues);

                        //ProcessOfCareChart.DataBindChart("Total BQ Score", processDataSource);
                        ProcessOfCareChart.DataBindChart("Process Of Care: Satisfaction", "", "Total BQ Score", _processDataPoints);

                        ProcessOfCareChart.Visible = true;
                        ProcessOfCareLabel.Visible = false;
                    }
                    else
                    {
                        ProcessOfCareChart.Visible = false;
                        ProcessOfCareLabel.Visible = true;
                    }
                }
            };

            // BUILD: build standard charts
            scalesRptr.DataSource = stdScales;
            scalesRptr.DataBind();

            // show special message when no data found
            if (scoresByScale.Count() > 0) noSurveyMsg.Visible = false;
        }

        #endregion

        #region rptr

        protected void BuildScaleChart(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                string scaleName = DataBinder.Eval(e.Item.DataItem, "ScaleName").ToString();
                DataView pointsView = DataBinder.Eval(e.Item.DataItem, "ScaleDataView") as DataView;
                IEnumerable<BreastQPoint> points = DataBinder.Eval(e.Item.DataItem, "ScaleData") as IEnumerable<BreastQPoint>;
                CaisisChart chart = e.Item.FindControl("BreastQChart") as CaisisChart;
                BaseBreastQScaleChart scaleChart = e.Item.FindControl("ScaleChart") as BaseBreastQScaleChart;

                BuildScaleSeries(chart, scaleName, pointsView);

                Literal NewTableRow = (Literal)e.Item.FindControl("NewTableRow");
                if (e.Item.ItemIndex > 0 && (e.Item.ItemIndex % 2) == 1)
                {
                    NewTableRow.Visible = true;
                }

                // DEBUG:

                Repeater debugRptr = e.Item.FindControl("BreastQChart_Data") as Repeater;
                bool debug = Request.QueryString["debug"] == "true";
                if (debugRptr != null && debug)
                {
                    debugRptr.DataSource = points;
                    debugRptr.DataBind();
                }
              
            }
        }

        #endregion

        #region init

        /// <summary>
        /// Initalize the breast Q engine
        /// </summary>
        protected void InitBreastQ()
        {
            string datasetSQL = CacheManager.GetDatasetSQL(Session[SessionKey.DatasetId]);
            service = new CaisisBreastQServices(datasetSQL);
            engine = new CaisisBreastQEngine();
        }

        #endregion

        #region cpt codes

        protected IDictionary<int, string> GetCPTCodes()
        {
            return new Dictionary<int, string>();
        }

        #endregion

        #region scale building

        protected Series BuildScaleSeries(CaisisChart chart, string scaleName)
        {
            // set title
            string currentTitle = chart.Titles[0].Text;
            if (string.IsNullOrEmpty(currentTitle))
            {
                chart.Titles[0].Text = scaleName;
            }
            chart.Titles[0].Font = DEFAULT_FONT;
            // create new series
            Series series = new Series(scaleName);
            series.ChartArea = "MainArea";
            series.ChartType = SeriesChartType.Line;
            //series.Color = System.Drawing.ColorTranslator.FromHtml("#8d2a2c");
            series.Color = GetNextColor();
            series.BorderWidth = 3;
            series.MarkerStyle = MarkerStyle.Diamond;
            series.MarkerColor = COLOR_WHEEL[0];// System.Drawing.ColorTranslator.FromHtml("#8d2a2c");
            series.MarkerSize = 11;
            series["ShowMarkerLines"] = "False";
            series.LabelFormat = "";
            series.IsValueShownAsLabel = false;
            series.SmartLabelStyle.Enabled = true;
            series.LabelAngle = 0;
            series.Font = new Font(FontFamily.GenericSansSerif, 7, FontStyle.Regular);
            series.LabelForeColor = Color.Black;
            chart.Series.Add(series);

            return series;
        }

        protected void BuildScaleSeries(CaisisChart chart, string scaleName, DataView points)
        {
            var series = BuildScaleSeries(chart, scaleName);
            // data bind
            BindScaleSeries(chart, series, points);
        }

        protected void BindScaleSeries(CaisisChart chart, Series series, DataView points)
        {
            // TODO: cleanup
            DataTable dt = points.Table;
            // create points label
            dt.Columns.Add(new DataColumn("PointsLabel", typeof(string), "SurveyDateText"));
            dt.Columns.Add(new DataColumn("Tooltip", typeof(string), "SurveyDateText + ' (' + ScaleScore + ')'"));
            dt.Columns.Add(new DataColumn("SurveyDateTicks", typeof(double)));
            // TODO: x-axis label
            dt.Columns.Add(new DataColumn("XAxisLabel", typeof(string)));
            double[] ticks = new double[dt.Rows.Count];
            // collect date as points
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                DataRow row = dt.Rows[i];
                var tick = (double)((DateTime)row["SurveyDate"]).Ticks;
                ticks[i] = tick;
                // set x-axis label
                string xAxisLabel = row[scleChartXAxisLabel].ToString();
                row["XAxisLabel"] = GetXAxisLabel(xAxisLabel, row["SurveyType"].ToString(), (DateTime)row["SurveyDate"]);
            }

            // smooth points
            //int[] normalizedPoints = SmoothPoints(ticks, 1, Math.Min(10, ticks.Count() * 2));
            // TODO: revisit point spacing, smooth based on percentage
            int[] normalizedPoints = SmoothPoints(ticks, 0, 100, true, true);
            // update column 
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                DataRow row = dt.Rows[i];
                int normalizedPoint = (int)normalizedPoints[i];
                row["SurveyDateTicks"] = normalizedPoint;
            }
            // smooth axis range
            double min = normalizedPoints.Min();
            double max = normalizedPoints.Max();
            var area = chart.ChartAreas["MainArea"];
            //area.AxisX.Minimum = min;
            //area.AxisX.Maximum = max;

            series.Points.DataBind(points, "SurveyDateTicks", "ScaleScore", "AxisLabel=XAxisLabel,Tooltip=Tooltip");

        }

        #endregion

        #region formatting

        protected virtual string GetXAxisLabel(string xAxisLabel, string surveyType, DateTime surveyDate)
        {
            return xAxisLabel;
        }

        /// <summary>
        /// Create a specialized csv list
        /// </summary>
        /// <param name="displayField"></param>
        /// <param name="dateField"></param>
        /// <param name="dataSource"></param>
        /// <returns></returns>
        protected static string FormatListOutput(string displayField, string dateField, IEnumerable<IBusinessObject> dataSource)
        {
            var outputValues = from row in dataSource
                               let displayValue = row[displayField].ToString()
                               let dateHasValue = !row.IsNull(dateField)
                               let dateValue = dateHasValue ? ((DateTime)row[dateField]).ToShortDateString() : ""
                               orderby dateHasValue ? (DateTime)row[dateField] : DateTime.MinValue descending
                               select !string.IsNullOrEmpty(dateValue) ? displayValue + " (" + dateValue + ")" : displayValue;
            if (outputValues.Count() == 0)
                return "";
            else
                return string.Join(", ", outputValues.ToArray()); ;
        }

        #endregion

        #region utilities

        /// <summary>
        /// For the given range of points, smooth into array in range
        /// </summary>
        /// <param name="rawData"></param>
        /// <param name="rangeMIN"></param>
        /// <param name="rangeMAX"></param>
        /// <param name="shift"></param>
        /// <param name="incremental"></param>
        /// <returns></returns>
        protected static int[] SmoothPoints(double[] rawData, int rangeMIN, int rangeMAX, bool shift, bool incremental)
        {
            double dataMax = rawData.Max();
            double dataMin = rawData.Min();
            double dataRange = dataMax - dataMin;
            int dataCount = rawData.Length;
            int[] normalized = new int[dataCount];
            int[] normalizedShifted = new int[dataCount];
            int[] normalizeIncremental = new int[dataCount];
            for (int i = 0; i < dataCount; i++)
            {
                // smooth source
                double sourcePoint = rawData[i];
                // update normalized
                double destinationPoint = (sourcePoint - dataMin) / dataRange;
                destinationPoint = (1.0 - destinationPoint) * rangeMIN + (destinationPoint * rangeMAX);

                int normalizedPoint = (int)destinationPoint;
                // set normalized point
                normalized[i] = normalizedPoint;
                // set shifted point
                // smooth more: i.e., if there are overlapping points (2x #3), shift #s
                normalizedShifted[i] = shift && normalizedShifted.Contains(normalizedPoint) ? normalizedShifted.Max() + 1 : normalizedPoint;
                // incremented, i.e., 1,2,3,4...n
                normalizeIncremental[i] = i;
            }
            if (incremental)
            {
                return normalizeIncremental;
            }
            else if (shift)
            {
                return normalizedShifted;
            }
            else
            {
                return normalized;
            }
        }

        /// <summary>
        /// Returns the largest gap between numbers
        /// </summary>
        /// <param name="points"></param>
        /// <returns></returns>
        protected static int GetMaxGap(int[] points)
        {
            int gap = 0;
            for (int i = 1; i < points.Length; i++)
                gap = Math.Max(gap, points[i] - points[i - 1]);
            return gap;
        }

        /// <summary>
        /// Create a data table for the given table and data arrays
        /// </summary>
        /// <param name="name"></param>
        /// <param name="data"></param>
        /// <returns></returns>
        protected static DataView ToDataView(string name, IEnumerable<object[]> data)
        {
            // build table
            var table = new DataTable(name);
            // build columns
            string[] columns = new string[] { "SurveyType", "SurveyTypeTitle", "SurveyDate", "SurveyDateText", "ScaleName", "ScaleScore" };
            table.Columns.AddRange(columns.Select(c => new DataColumn(c)).ToArray());
            table.Columns["ScaleScore"].DataType = typeof(int);
            table.Columns["SurveyDate"].DataType = typeof(DateTime);
            // add data
            data.ForEach(d => table.Rows.Add(d));
            // sort and return view
            var view = table.DefaultView;
            view.Sort = "SurveyDate ASC";
            return view;
        }

        /// <summary>
        /// Gets a friendly title for survey type strippig off reduntant titles and adding camel case
        /// </summary>
        /// <param name="SurveyType"></param>
        /// <param name="match"></param>
        /// <returns></returns>
        protected static string GetSurveyTypeTitle(string SurveyType, string match)
        {
            //return SurveyType;
            string title = SurveyType;
            //title = title.Replace(match, "");
            // misc
            title = title.Replace("Tissue Expander", "TE");
            // normalize scale name
            title = title.Replace("Breast Q: ", "");

            // camel case
            title = PageUtil.ToCamelCase(title);

            return title;
        }

        #endregion
    }
}