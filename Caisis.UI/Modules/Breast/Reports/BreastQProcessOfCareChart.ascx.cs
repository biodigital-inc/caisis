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
    public partial class BreastQProcessOfCareChart : BaseBreastQChartControl
    {
        private static readonly Font AXIS_FONT = new Font("Arial", 9, System.Drawing.FontStyle.Regular);

        private static IDictionary<string, System.Drawing.Color> BREASTQ_PROCESS_OF_CARE_SCALE = new Dictionary<string, System.Drawing.Color>(
                new Dictionary<string, System.Drawing.Color>
                {
                    { "Satisfaction with Information", System.Drawing.ColorTranslator.FromHtml("#4F81BD") },
                    { "Satisfaction with Plastic Surgeon", System.Drawing.ColorTranslator.FromHtml("#C0504D") },
                    { "Satisfaction with Medical Team", System.Drawing.ColorTranslator.FromHtml("#9BBB59") },
                    { "Satisfaction with Office Staff", System.Drawing.ColorTranslator.FromHtml("#8064A2") }
                }, StringComparer.OrdinalIgnoreCase);

        #region public UI properties

        public Unit ChartWidth
        {
            get
            {
                return ProcessOfCareChart.Width;
            }
            set
            {
                ProcessOfCareChart.Width = value;
            }
        }

        public Unit ChartHeight
        {
            get
            {
                return ProcessOfCareChart.Height;
            }
            set
            {
                ProcessOfCareChart.Height = value;
            }
        }
        #endregion


        protected override void OnLoad(EventArgs e)
        {
            base.OnLoad(e);
        }

        public virtual void SetTitle(string title)
        {
            ProcessOfCareChart.Titles[0].Text = title;
        }

        /// <summary>
        /// Gets the CaisisChart instance used in this component.
        /// </summary>
        /// <returns></returns>
        public virtual CaisisChart GetChart()
        {
            return ProcessOfCareChart;
        }

        public virtual void ClearSeries()
        {
            // re-init ui
            ProcessOfCareChart.Series.Clear();
        }

        public override void DataBindChart(string yTitle, Dictionary<Color, Dictionary<string, int>> dataPointList)
        {
            // validation: check for data
            var dataPoints = dataPointList.SelectMany(p => p.Value.Values);
            if (dataPoints.Count() == 0)
                return;

            var area = ProcessOfCareChart.ChartAreas["MainArea"];

            // set title
            SetTitle(yTitle);
            area.AxisY.Title = yTitle;

            // get distinct scale names
            var scaleNames = dataPointList.SelectMany(p => p.Value.Keys).Distinct();

            // for each plot, add buffer
            double min = dataPoints.Min();
            double max = dataPoints.Max();
            int dataPointCount = dataPoints.Count();
            double barWidth = 1000 / dataPointCount;
            double barSpacing = 10.0 / dataPointCount;


            // build series  
            area.AxisX.IsMarksNextToAxis = false;
            Series series = new Series();
            series.ChartType = SeriesChartType.RangeColumn;
            series.YValuesPerPoint = dataPointList.Count();
            series.ChartArea = "MainArea";
            series.AxisLabel = " ";// scale;
            series.IsValueShownAsLabel = false;// true;
            area.AxisX.LabelAutoFitStyle = LabelAutoFitStyles.None;
            Font dataPointFont = new Font("Arial", 10, FontStyle.Bold);
            ProcessOfCareChart.Series.Add(series);

            // calculate spacing based on points and groups
            double groupCount = dataPointList.Count();
            double dataPointIndex = 1.0;
            double dataPointIncrement = 1.0;

            foreach (string scale in scaleNames)
            {
                string scaleShortName = PageUtil.ToCamelCase(scale.Replace("Satisfaction with", ""));
                foreach (var pair in dataPointList)
                {
                    dataPointIndex += dataPointIncrement;
                    var color = pair.Key;
                    series.Color = color;
                    var scaleToPoints = pair.Value;
                    // get scales
                    if (scaleToPoints.ContainsKey(scale))
                    {
                        int point = scaleToPoints[scale];
                        var dataPoint = new DataPoint();
                        dataPoint.SetValueXY(scaleShortName, point);
                        dataPoint.XValue = dataPointIndex;


                        dataPoint.Color = color;
                        // dataPoint.LabelForeColor = ColorTranslator.FromHtml("#bbbbbb");
                        // dataPoint.Label = scaleShortName;
                        // dataPoint.AxisLabel = scaleShortName;
                        dataPoint.Font = dataPointFont;

                        series.Points.Add(dataPoint);

                        // add label per grouping
                        if (dataPointIndex % groupCount == 0.0)
                        {
                            CustomLabel label = new CustomLabel(dataPointIndex - .5, (dataPointIndex + groupCount * dataPointIncrement) - .5, scaleShortName, 0, LabelMarkStyle.Box);
                            label.ToolTip = scale;
                            area.AxisX.CustomLabels.Add(label);
                        }
                    }
                }
            }

        }

        public override void DataBindChart(string title, string xTitle, string yTitle, IEnumerable<CaisisDataPoint> points)
        {
            if (points.Count() == 0)
                return;

            ChartArea area = ProcessOfCareChart.ChartAreas["MainArea"];

            // set title
            SetTitle(title);
            ProcessOfCareChart.Titles[0].Font = new Font("Arial", 12, System.Drawing.FontStyle.Bold);

            // set y axis title
            area.AxisY.Title = yTitle;
            area.AxisY.TitleFont = AXIS_FONT;
            // set x axis title
            area.AxisX.Title = xTitle;
            area.AxisX.TitleFont = AXIS_FONT;

            // build series            
            area.AxisX.IsMarksNextToAxis = false;
            Series series = new Series();
            series.ChartType = SeriesChartType.RangeColumn;
            series.YValuesPerPoint = 1;
            series.ChartArea = area.Name;
            series.AxisLabel = " ";// scale;
            series.IsValueShownAsLabel = false;// true;
            area.AxisX.LabelAutoFitStyle = LabelAutoFitStyles.None;
            Font dataPointFont = new Font("Arial", 10, FontStyle.Bold);
            ProcessOfCareChart.Series.Add(series);

            // add points to series
            foreach (var point in points)
            {
                // create series point with attributes
                DataPoint dataPoint = new DataPoint();
                dataPoint.SetValueXY(point.XValue, point.YValues);
                dataPoint.YValues = point.YValues;

                // set metadata
                dataPoint.AxisLabel = point.AxisLabel;
                dataPoint.Label = point.Label;
                dataPoint.Color = point.DataPointColor;

                // add point to series
                series.Points.Add(dataPoint);
            }
        }
    }
}