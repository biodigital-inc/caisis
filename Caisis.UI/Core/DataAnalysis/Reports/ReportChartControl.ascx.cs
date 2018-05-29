using System;
using System.Data;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.DataVisualization.Charting;

using Caisis.Controller;
using Caisis.UI.Core.Classes;
using Caisis.UI.Core.Utilities;

namespace Caisis.UI.Core.DataAnalysis.Reports
{
    public partial class ReportChartControl : BaseControl
    {
        public virtual Unit Width
        {
            get
            {
                return ReportChart.Width;
            }
            set
            {
                ReportChart.Width = value;
            }
        }

        public virtual Unit Height
        {
            get
            {
                return ReportChart.Height;
            }
            set
            {
                ReportChart.Height = value;
            }
        }

        /// <summary>
        /// Returns the undelying Caisis Charting control
        /// </summary>
        /// <returns></returns>
        public virtual CaisisChart GetChart()
        {
            return ReportChart;
        }

        public virtual void BuildChart(DataView dataSource, ReportConfiguration report)
        {
            ReportChartingConfig charting = report.ChartConfig;

            ReportChart.Series.Clear();

            string label = charting.XAxis;
            string tooltip = charting.YAxis;
            string seriesName = report.Title;
            System.Web.UI.DataVisualization.Charting.Series series = new Series(seriesName);
            ReportChart.Series.Add(series);
            series["ShowMarkerLines"] = "True";
            series.BorderWidth = 2;
            series.ShadowOffset = 1;
            series.ShadowColor = System.Drawing.Color.DarkGray;
            series.Color = System.Drawing.Color.Red;
            series.ChartType = charting.ChartType;
            series.MarkerStyle = MarkerStyle.Circle;
            series.MarkerSize = 7;
            series.Points.DataBind(dataSource, charting.XAxis, charting.YAxis, string.Format("Tooltip={0}, Label={1}", tooltip, label));

        }
    }
}
