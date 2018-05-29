using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI.DataVisualization;
using System.Web.UI.DataVisualization.Charting;
using System.Drawing;

using Caisis.UI.Core.Classes;
using Caisis.UI.Core.Utilities;

namespace Caisis.UI.Modules.Breast.Reports
{
    /// <summary>
    /// Summary description for BaseBreastQChartControl
    /// </summary>
    public abstract class BaseBreastQChartControl : BaseControl
    {
        public BaseBreastQChartControl()
            : base()
        {

        }

        public abstract void DataBindChart(string yTitle, Dictionary<Color, Dictionary<string, int>> dataPointList);

        public abstract void DataBindChart(string title, string xTitle, string yTitle, IEnumerable<CaisisDataPoint> points);
    }

    public abstract class BaseBreastQScaleChart : BaseBreastQChartControl
    {
        public BaseBreastQScaleChart()
            : base()
        {
        }

        public abstract void DataBindChart(DataView view, string xField, string yField, string otherField, string title, string xAxisTitle, string yAxisTitle, Color color, SeriesChartType chartType, MarkerStyle markerStyle);
    }
}