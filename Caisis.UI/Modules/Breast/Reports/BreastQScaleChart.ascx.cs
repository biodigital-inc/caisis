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
    public partial class BreastQScaleChart : BaseBreastQScaleChart
    {
        private static readonly Font DEFAULT_FONT = new System.Drawing.Font("Arial", 12, System.Drawing.FontStyle.Bold);
        private static readonly Color DEFAULT_SERIES_COLOR = Color.Red;

        #region public UI properties

        public Unit ChartWidth
        {
            get
            {
                return BreastQChart.Width;
            }
            set
            {
                BreastQChart.Width = value;
            }
        }

        public Unit ChartHeight
        {
            get
            {
                return BreastQChart.Height;
            }
            set
            {
                BreastQChart.Height = value;
            }
        }
        #endregion

        protected override void OnLoad(EventArgs e)
        {
            base.OnLoad(e);
        }

        /// <summary>
        /// Gets the CaisisChart instance used in this component.
        /// </summary>
        /// <returns></returns>
        public virtual CaisisChart GetChart()
        {
            return BreastQChart;
        }

        #region DATA BINDING

        /// <summary>
        /// Clears all series in the chart
        /// </summary>
        public virtual void ClearSeries()
        {
            // re-init ui
            BreastQChart.Series.Clear();
        }

        /// <summary>
        /// Databinds the specified view with metadata.
        /// </summary>
        /// <param name="view"></param>
        /// <param name="xField"></param>
        /// <param name="yField"></param>
        /// <param name="otherField"></param>
        /// <param name="title"></param>
        /// <param name="xAxisTitle"></param>
        /// <param name="yAxisTitle"></param>
        /// <param name="color"></param>
        public override void DataBindChart(DataView view, string xField, string yField, string otherField, string title, string xAxisTitle, string yAxisTitle, Color color, SeriesChartType chartType, MarkerStyle markerStyle)
        {
            // build ui
            ChartArea area = BreastQChart.ChartAreas[0];
            area.AxisX.Title = yAxisTitle;
            area.AxisY.Title = xAxisTitle;
            Series series = BuildSeries(BreastQChart, color, chartType, markerStyle, title);
            // data bind
            BindSeries(series, view, xField, yField, otherField);
        }

        public override void DataBindChart(string title, string xTitle, string yTitle, IEnumerable<CaisisDataPoint> points)
        {
        }

        public override void DataBindChart(string yTitle, Dictionary<Color, Dictionary<string, int>> dataPointList)
        {
        }

        #endregion

        private Series BuildSeries(CaisisChart chart, Color seriesColor, SeriesChartType seriesChartType, MarkerStyle seriesMarkerStyle, string seriesTitle)
        {
            // set title
            string currentTitle = chart.Titles[0].Text;
            if (string.IsNullOrEmpty(currentTitle))
            {
                chart.Titles[0].Text = seriesTitle;
            }
            chart.Titles[0].Font = DEFAULT_FONT;
            // create new series
            Series series = new Series();//seriesTitle);
            series.ChartArea = "MainArea";
            series.ChartType = seriesChartType;// SeriesChartType.Line;
            //series.Color = System.Drawing.ColorTranslator.FromHtml("#8d2a2c");
            series.Color = seriesColor;
            series.BorderWidth = 3;
            series.MarkerStyle = seriesMarkerStyle; //MarkerStyle.Diamond;
            series.MarkerColor = seriesColor;// Color.FromArgb(79, 129, 189);
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

        /// <summary>
        /// DataBinds a series
        /// </summary>
        /// <param name="series"></param>
        /// <param name="view"></param>
        /// <param name="xField"></param>
        /// <param name="yField"></param>
        /// <param name="otherFields"></param>
        private void BindSeries(Series series, DataView view, string xField, string yField, string otherFields)
        {
            series.Points.DataBind(view, xField, yField, otherFields);
        }
    }
}