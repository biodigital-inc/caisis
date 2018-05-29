using System;
using System.Collections;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using System.Drawing;
using System.ComponentModel;

using System.Web.UI.DataVisualization.Charting;

using Caisis.UI.Core.Utilities;

namespace Caisis.UI.Modules.Prostate.Charts
{

    /// <summary>
    /// Summary description for PSAWaterfallChart
    /// </summary>
    public class PSAWaterfallChart : CaisisChart
    {
        public PSAWaterfallChart()
            : base()
        {
        }

        public void BuildChart(System.Data.DataView view, string percentageChangeField, string title)
        {
            // set title
            var chartTitle = this.Titles[0];
            chartTitle.Text = title;
            this.Series[0].Points.DataBind(view, "", percentageChangeField, "");
        }

        public void BuildChart(IEnumerable<double> points, string title)
        {
            // set title
            var chartTitle = this.Titles[0];
            chartTitle.Text = title;
            var orderedPoints = from point in points
                                orderby point ascending
                                select point;
            this.Series[0].Points.DataBindY(orderedPoints.ToArray());
        }

        protected override void OnInit(EventArgs e)
        {
            base.OnInit(e);
            this.BuildLayout();
        }

        private void BuildLayout()
        {
            this.Height = 250;
            this.Width = 400;
            this.BackColor = Color.Transparent;

            // series defaults
            Series series = new Series();
            series.BorderColor = Color.FromArgb(180, 26, 59, 105);
            series.Color = Color.FromArgb(220, 65, 140, 240);
            this.Series.Add(series);

            // area defaults
            ChartArea area = new ChartArea();
            area.BackColor = Color.AliceBlue;
            area.BorderColor = Color.FromArgb(64, 64, 64, 64); //System.Drawing.ColorTranslator.FromHtml("#5996AF");//"64, 64, 64, 64"
            area.BorderDashStyle = ChartDashStyle.Solid;

            area.AxisY.LineColor = Color.FromArgb(64, 64, 64, 64);
            area.AxisY.MajorGrid.LineColor = Color.FromArgb(64, 64, 64, 64);
            area.AxisY.IsLabelAutoFit = false;
            area.AxisY.ArrowStyle = AxisArrowStyle.None;
            area.AxisY.LabelStyle.Font = new Font("Arial", (float)8.25);
            area.AxisY.Title = "Change in PSA (%)";

            area.AxisX.LineColor = Color.FromArgb(64, 64, 64, 64);
            area.AxisX.MajorGrid.LineColor = Color.FromArgb(64, 64, 64, 64);
            area.AxisX.IsLabelAutoFit = false;
            area.AxisX.ArrowStyle = AxisArrowStyle.None;
            area.AxisX.LabelStyle.Font = new Font("Arial", (float)8.25);
            area.AxisX.Title = "Patients";

            area.AxisX2.Enabled = AxisEnabled.False;
            area.AxisY2.Enabled = AxisEnabled.False;
            area.Area3DStyle.Rotation = 10;
            area.Area3DStyle.Perspective = 10;
            area.Area3DStyle.Inclination = 15;
            area.Area3DStyle.IsRightAngleAxes = false;
            area.Area3DStyle.WallWidth = 10;
            area.Area3DStyle.IsClustered = false;
            this.ChartAreas.Add(area);

            Title title = new Title();
            this.Titles.Add(title);
        }
    }
}