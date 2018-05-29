using System;
using System.Collections.Generic;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI.DataVisualization.Charting;

using Caisis.DataAccess;
using Caisis.UI.Core.Classes;
using Caisis.UI.Core.Utilities;
using Caisis.UI.Modules.Prostate.DataAnalysis;

/// <summary>
/// Builds urinary and erectile function charts for use in
/// reports and web services.
/// </summary>
namespace Caisis.UI.Modules.Prostate.Charts
{
	public class ProstateQOLChartBuilder
	{
		#region private members
		const float DAYS_PER_MONTH = 30.43685f;

		bool initialized = false;
		int patientId;
		DataTable efChartTable;
		DataTable ufChartTable;

        List<DateTime> erectileAlerts = new List<DateTime>();
        List<DateTime> padAlerts = new List<DateTime>();
        List<DateTime> urinaryDeclineAlerts = new List<DateTime>();
        List<DateTime> bowelAlerts = new List<DateTime>();
        List<DateTime> qolAlerts = new List<DateTime>();
		#endregion

		#region properties
		public bool CanBuildErectileFunctionChart
		{
			get
			{
				return efChartTable.Rows.Count > 0;
			}
		}

		public bool CanBuildUrinaryFunctionChart
		{
			get
			{
				return ufChartTable.Rows.Count > 0;
			}
		}
		#endregion

		public ProstateQOLChartBuilder(int patientId)
		{
			this.patientId = patientId;

			efChartTable = new DataTable();
			efChartTable.Columns.Add("Months", typeof(int));
			efChartTable.Columns.Add("Score", typeof(int));

			ufChartTable = efChartTable.Clone();
		}

		public CaisisChart GetErectileFunctionChart()
		{
			Init();

			if (!CanBuildErectileFunctionChart)
				return null;

            CaisisChart c = GetChartPrototype();

			c.ID = "EFChart";

			AddEFAxes(c.ChartAreas[0]);

			c.DataSource = efChartTable;
			c.DataBind();

			return c;
		}

		#region customize ef chart
		private void AddEFAxes(ChartArea c)
		{
			c.Name = "ChartArea1";

			// AxisY
			Axis axisY = new Axis();

			axisY.Title = "Erectile Function";
			axisY.Minimum = 0;
			axisY.Maximum = 30;
			axisY.LabelAutoFitMinFontSize = 8;
			axisY.LabelAutoFitStyle = LabelAutoFitStyles.DecreaseFont;
			axisY.MajorTickMark.Enabled = false;
			axisY.MinorTickMark.Enabled = false;
			axisY.MajorGrid.Enabled = false;
			axisY.MinorGrid.Enabled = false;

			Action<int, int, string> addAxisYLabel =
				(from, to, text) =>
				{
					axisY.CustomLabels.Add(
						new CustomLabel(from,
										to,
										text,
										0,
										LabelMarkStyle.None,
										GridTickTypes.Gridline));
				};

			addAxisYLabel(-2, 2, "0");
			addAxisYLabel(10, 14, "12");
			addAxisYLabel(16, 20, "18");
			addAxisYLabel(22, 26, "24");
			addAxisYLabel(28, 32, "30");

			c.AxisY = axisY;


			// AxisY2
			Axis axisY2 = new Axis();

			axisY2.Enabled = AxisEnabled.True;
			axisY2.Minimum = 0;
			axisY2.Maximum = 30;
			axisY2.IsLabelAutoFit = false;
			axisY2.MajorTickMark.Enabled = false;
			axisY2.MinorTickMark.Enabled = false;
			axisY2.MajorGrid.Enabled = false;
			axisY2.MinorGrid.Enabled = false;

			Action<int, int, string> addAxisY2Label =
				(from, to, text) =>
				{
					axisY2.CustomLabels.Add(
						new CustomLabel(from,
										to,
										text,
										0,
										LabelMarkStyle.None,
										GridTickTypes.None));
				};

			Action<int, int> addAxisY2StripLine =
				(offset, width) =>
				{
					StripLine s = new StripLine();
					s.IntervalOffset = offset;
					s.StripWidth = width;
					s.BackColor = Color.Transparent;
					s.BorderColor = Color.FromArgb(0x99, 0x99, 0x99);

					axisY2.StripLines.Add(s);
				};

			addAxisY2Label(0, 12, " Poor");
			addAxisY2Label(12, 18, " Moderate");
			addAxisY2Label(18, 24, " Intermediate");
			addAxisY2Label(24, 30, " Good");

			addAxisY2StripLine(0, 12);
			addAxisY2StripLine(12, 6);
			addAxisY2StripLine(18, 6);
			addAxisY2StripLine(24, 6);

			c.AxisY2 = axisY2;


			// AxisX
			Axis axisX = new Axis();
			axisX.Title = "Months Since Surgery";
			axisX.Minimum = 0;
			axisX.IsLabelAutoFit = false;
			axisX.Interval = 3;
			axisX.IntervalAutoMode = IntervalAutoMode.VariableCount;
			axisX.MajorGrid.Enabled = false;
			axisX.MinorGrid.Enabled = false;
			axisX.MajorTickMark.Enabled = true;
			axisX.MajorTickMark.Interval = 3;

			c.AxisX = axisX;
		}
		#endregion

        

        public CaisisChart GetUrinaryFunctionChart()
		{
			Init();

			if (!CanBuildUrinaryFunctionChart)
				return null;

            CaisisChart c = GetChartPrototype();

			c.ID = "UFChart";

			AddUFAxes(c.ChartAreas[0]);

			c.DataSource = ufChartTable;
			c.DataBind();

			return c;
		}

		#region customize uf chart
		private void AddUFAxes(ChartArea c)
		{
			c.Name = "ChartArea2";

			// AxisY
			Axis axisY = new Axis();

			axisY.Title = "Urinary Function";
			axisY.Minimum = 0;
			axisY.Maximum = 21;
			axisY.LabelAutoFitMinFontSize = 8;
			axisY.LabelAutoFitStyle = LabelAutoFitStyles.DecreaseFont;
			axisY.MajorTickMark.Enabled = false;
			axisY.MinorTickMark.Enabled = false;
			axisY.MajorGrid.Enabled = false;
			axisY.MinorGrid.Enabled = false;

			Action<int, int, string> addAxisYLabel =
				(from, to, text) =>
				{
					axisY.CustomLabels.Add(
						new CustomLabel(from,
										to,
										text,
										0,
										LabelMarkStyle.None,
										GridTickTypes.Gridline));
				};

			addAxisYLabel(-1, 1, "0");
			addAxisYLabel(9, 11, "10");
			addAxisYLabel(15, 17, "16");
			addAxisYLabel(20, 22, "21");

			c.AxisY = axisY;


			// AxisY2
			Axis axisY2 = new Axis();

			axisY2.Enabled = AxisEnabled.True;
			axisY2.Minimum = 0;
			axisY2.Maximum = 21;
			axisY2.IsLabelAutoFit = false;
			axisY2.MajorTickMark.Enabled = false;
			axisY2.MinorTickMark.Enabled = false;
			axisY2.MajorGrid.Enabled = false;
			axisY2.MinorGrid.Enabled = false;

			Action<int, int, string> addAxisY2Label =
				(from, to, text) =>
				{
					axisY2.CustomLabels.Add(
						new CustomLabel(from,
										to,
										text,
										0,
										LabelMarkStyle.None,
										GridTickTypes.None));
				};

			Action<int, int> addAxisY2StripLine =
				(offset, width) =>
				{
					StripLine s = new StripLine();
					s.IntervalOffset = offset;
					s.StripWidth = width;
					s.BackColor = Color.Transparent;
					s.BorderColor = Color.FromArgb(0x99, 0x99, 0x99);

					axisY2.StripLines.Add(s);
				};

			addAxisY2Label(0, 10, " Poor");
			addAxisY2Label(10, 16, " Moderate");
			addAxisY2Label(16, 21, " Good");

			addAxisY2StripLine(0, 10);
			addAxisY2StripLine(10, 6);
			addAxisY2StripLine(16, 5);

			c.AxisY2 = axisY2;


			// AxisX
			Axis axisX = new Axis();
			axisX.Title = "Months Since Surgery";
			axisX.Minimum = 0;
			axisX.IsLabelAutoFit = false;
			axisX.Interval = 3;
			axisX.IntervalAutoMode = IntervalAutoMode.VariableCount;
			axisX.MajorGrid.Enabled = false;
			axisX.MinorGrid.Enabled = false;
			axisX.MajorTickMark.Enabled = true;
			axisX.MajorTickMark.Interval = 3;

			c.AxisX = axisX;
		}
		#endregion

        #region extend chart
        public static void AddSeries(Chart chart, IEnumerable<DataPoint> points)
        {
            Series s = new Series();

            s.ChartType = SeriesChartType.Line;
            s.Color = Color.Blue;
            s.IsValueShownAsLabel = true;
            s.LabelForeColor = Color.Blue;
            s.MarkerStyle = MarkerStyle.Square;

            foreach (DataPoint p in points)
                s.Points.Add(p);

            chart.Series.Add(s);
        }
        #endregion

        public IEnumerable<DateTime> ErectileAlerts
        {
            get
            {
                Init();

                return erectileAlerts;
            }
        }

        public IEnumerable<DateTime> PadAlerts
        {
            get
            {
                Init();

                return padAlerts;
            }
        }

        public IEnumerable<DateTime> UrinaryDeclineAlerts
        {
            get
            {
                Init();

                return urinaryDeclineAlerts;
            }
        }

        public IEnumerable<DateTime> BowelAlerts
        {
            get
            {
                Init();

                return bowelAlerts;
            }
        }

        public IEnumerable<DateTime> QolAlerts
        {
            get
            {
                Init();

                return qolAlerts;
            }
        }

		// get the source data for the charts
		private void Init()
		{
			if (initialized)
				return;

			DataView prostateQOLResults = ReportDa.GetProstateQOLResults(patientId);

			if (prostateQOLResults.Count > 0)
			{
				// the query excludes null rp dates
				DateTime rpDate = (DateTime) prostateQOLResults[0]["RPDate"];

				AnalyzeSurveys(patientId, rpDate);
			}

			initialized = true;
		}

		// a cut-down version of ProstateQOLResults.AnalyzeSurveys(...),
		// which is tightly-coupled with the display for the associated report
		private void AnalyzeSurveys(int patientId, DateTime rpDate)
		{
			MSKProstateQOLSurvey helper = new MSKProstateQOLSurvey();
			DataTable surveyTable = helper.GetSurveys(patientId);
			DataView surveyScores = helper.GetScores(surveyTable);

			int count = surveyScores.Count;

            int patientBaseline_efScore = 0;
			int patientBaseline_ufScore = 0;

            bool foundPatientBaseline_EF = false;
            bool addedPatientBaseline_EF = false;
            bool foundPatientBaseline_UF = false;
            bool addedPatientBaseline_UF = false;

            int? prevMinUrinaryScore = null;
            int? prevUrinaryScore = null;

			for (int i = 0; i < count; i++)
			{
				DataRowView row = surveyScores[i];

				DateTime surveyDate = (DateTime) row["SurveyDate"];

				double monthsSinceRP = (surveyDate - rpDate).Days / DAYS_PER_MONTH;
				//int roundedMonths = (int) Math.Round(monthsSinceRP, 0);
                double roundedMonths = monthsSinceRP;

                Func<string, int?> getScore = s => row[s] == DBNull.Value ? null : (int?)row[s];

                int? efScore = getScore("EF_Score");
                int? ufScore = getScore("UF_Score");
                int? qolScore = getScore("GH_Score");
                int? bowelScore = getScore("BF_Score");


                // add only the most recent pre-rp survey to the chart datasources
                if (surveyDate <= rpDate)
                {
                    if (efScore.HasValue)
                    {
                        patientBaseline_efScore = efScore.Value;
                        foundPatientBaseline_EF = true;

                        if (count == 1)
                        {
                            AddDataPoint(efChartTable, 0, patientBaseline_efScore);
                        }
                    }

                    if (ufScore.HasValue)
                    {
                        patientBaseline_ufScore = ufScore.Value;
                        foundPatientBaseline_UF = true;

                        if (count == 1)
                        {
                            AddDataPoint(ufChartTable, 0, patientBaseline_ufScore);
                        }
                    }

                    continue;
                }
                else
                {
                    if (foundPatientBaseline_EF && !addedPatientBaseline_EF)
                    {
                        AddDataPoint(efChartTable, 0, patientBaseline_efScore);

                        addedPatientBaseline_EF = true;
                    }

                    if (foundPatientBaseline_UF && !addedPatientBaseline_UF)
                    {
                        AddDataPoint(ufChartTable, 0, patientBaseline_ufScore);

                        addedPatientBaseline_UF = true;
                    }
                }

                if (efScore.HasValue)
                    AddDataPoint(efChartTable, roundedMonths, efScore.Value);

                if (ufScore.HasValue)
                    AddDataPoint(ufChartTable, roundedMonths, ufScore.Value);

                // clear alerts if conditions improve

                // erectile alerts
                if (efScore.HasValue)
                {
                    if (efScore < 22)
                        erectileAlerts.Add(surveyDate);
                    else
                        erectileAlerts.Clear();
                }

                // urinary alerts
                // handle max urinary score
                if (ufScore.HasValue)
                {
                    if (i > 0 && prevMinUrinaryScore.HasValue)
                    {
                        if ((monthsSinceRP > 12 && ufScore <= prevMinUrinaryScore.Value - 3) ||
                            (monthsSinceRP <= 12 && ufScore < prevMinUrinaryScore.Value))
                            urinaryDeclineAlerts.Add(surveyDate);
                        else if (prevUrinaryScore.HasValue && ufScore > prevUrinaryScore)
                            urinaryDeclineAlerts.Clear();
                    }

                    if (!prevMinUrinaryScore.HasValue || ufScore < prevMinUrinaryScore.Value)
                        prevMinUrinaryScore = ufScore;

                    prevUrinaryScore = ufScore;
                }

                // qol alerts
                if (qolScore.HasValue)
                {
                    if (qolScore < 6)
                        qolAlerts.Add(surveyDate);
                    else
                        qolAlerts.Clear();
                }

                // pad alerts
                object padObj = row["PadResponse"];
                if (padObj != DBNull.Value && surveyDate > rpDate.AddYears(1))
                {
                    if (3 <= (int) padObj)
                        padAlerts.Add(surveyDate);
                    else
                        padAlerts.Clear();
                }

                // bowel alerts
                object bowelHabitObj = row["HabitResponse"];
                object bowelEnjoymentObj = row["EnjoymentResponse"];

                if ((bowelHabitObj != DBNull.Value && 3 <= (int) bowelHabitObj) ||
                    (bowelEnjoymentObj != DBNull.Value && 3 <= (int) bowelEnjoymentObj))
                {
                    bowelAlerts.Add(surveyDate);
                }
                else if (bowelHabitObj != DBNull.Value && bowelEnjoymentObj != DBNull.Value &&
                         2 >= (int) bowelHabitObj && 2 >= (int) bowelEnjoymentObj)
                {
                    bowelAlerts.Clear();
                }
			}

            /*
            List<int> months = new List<int>() { 0, 3, 6, 9, 12, 15, 18, 21, 24, 36, 48 };
            var ranges = GenerateRanges(months);

            ufChartTable = FilterChartDataPoints(ufChartTable, ranges);
            efChartTable = FilterChartDataPoints(efChartTable, ranges);
            */
		}

		private void AddDataPoint(DataTable table, double months, int score)
		{
			DataRow row = table.NewRow();

			row["Months"] = months;
			row["Score"] = score;

			table.Rows.Add(row);
		}

        IEnumerable<FRange> GenerateRanges(IEnumerable<int> months)
        {
            foreach (int m in months)
            {
                FRange range = new FRange();
                range.attractor = m;
                range.includeLow = true;
                range.includeHigh = true;

                int window = 1 + Math.Min(2, m / 12); // yes, integer division is what we want
                range.low = m - window;
                range.high = m + window;

                yield return range;
            }
        }

        DataTable InitChartTable()
        {
            DataTable t = new DataTable();
            t.Columns.Add("Months", typeof(int));
            t.Columns.Add("Score", typeof(int));

            return t;
        }

        DataTable FilterChartDataPoints(DataTable table, IEnumerable<FRange> ranges)
        {
            DataTable ft = InitChartTable();

            IEnumerable<FPoint> points =
                table.AsEnumerable().Select(r => new FPoint((int) r["Months"], (int) r["Score"]));

            foreach (FPoint p in FuncFilter.Filter(points, ranges))
            {
                AddDataPoint(ft, (int) p.x, (int) p.y);
            }

            return ft;
        }


		#region programmatic chart definition
        private CaisisChart GetChartPrototype()
		{
            CaisisChart c = new CaisisChart();

			c.Width = 550;
			c.Height = 200;

			c.BorderlineDashStyle = ChartDashStyle.Solid;
			c.BackColor = Color.FromArgb(0xFF, 0xFF, 0xFF);


			// legend
			Legend legend1 = new Legend("Legend1");
			legend1.Enabled = false;

			c.Legends.Add(legend1);


			// series
			SmartLabelStyle labelStyle = new SmartLabelStyle();
			labelStyle.Enabled = true;
			labelStyle.CalloutLineAnchorCapStyle = LineAnchorCapStyle.None;
			labelStyle.CalloutStyle = LabelCalloutStyle.None;

			Series series = new Series("Series1");
			series.ChartType = SeriesChartType.Line;
			series.Color = Color.FromArgb(0xC4, 0x3E, 0x06);
			series.Legend = "Legend1";
			series.XValueMember = "Months";
			series.YValueMembers = "Score";
			series.IsValueShownAsLabel = true;
			series.LabelForeColor = Color.FromArgb(0xC4, 0x3E, 0x06);
			series.SmartLabelStyle = labelStyle;
			series.MarkerStyle = MarkerStyle.Circle;
            series.MarkerSize = 4;

			c.Series.Add(series);


			// chart area
			ChartArea chartArea = new ChartArea();
			chartArea.BackSecondaryColor = Color.White;
			chartArea.BackColor = Color.AliceBlue;
			chartArea.ShadowColor = Color.Transparent;
			chartArea.BackGradientStyle = GradientStyle.TopBottom;

			c.ChartAreas.Add(chartArea);

			return c;
		}
		#endregion
	}
}
