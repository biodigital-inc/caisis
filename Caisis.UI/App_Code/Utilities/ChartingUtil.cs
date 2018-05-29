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


using Caisis.DataAccess;
using Caisis.Security;
using Caisis.Controller;
using Caisis.UI.Core.Classes;
using Caisis.BOL;


namespace Caisis.UI.Core.Utilities
{
    /// <summary>
    /// The base class for Chart User Controls with methods for specialized output
    /// </summary>
    public class CaisisChart : Chart
    {
        protected string chartShortName;

        // check query string for special render mode
        private bool renderBase64ByQuery = true;
        // chart will default render as IMG
        private bool renderToOutput = false;
        // chart will render as base64 string
        private bool renderBase64 = false;

        public CaisisChart()
            : base()
        {
            // set default short name
            string typeName = this.GetType().Name;
            this.chartShortName = typeName.Replace("ChartControl", string.Empty);
        }

        public CaisisChart(string shortName)
            : base()
        {
            this.chartShortName = shortName;
        }

        /// <summary>
        /// Gets or sets whether the chart should be rendered as an IMG with src set to base64 encoded rerepsentation
        /// </summary>
        public bool RenderBase64ByQuery
        {
            get
            {
                return renderBase64ByQuery;
            }
            set
            {
                renderBase64ByQuery = value;
            }
        }

        /// <summary>
        /// Gets or sets if the chart is rendered as a base64 encoded string
        /// </summary>
        public bool RenderBase64
        {
            get
            {
                return renderBase64;
            }
            set
            {
                renderBase64 = value;
            }
        }

        /// <summary>
        /// Gets or sets whether the Chart output is rendered directy to the Response Output (true)
        /// or if it is rendered as IMG tag (false/default)
        /// </summary>
        public bool WriteImageToOutput
        {
            get
            {
                if (this != null)
                {
                    return this.RenderType == RenderType.BinaryStreaming;
                }
                return renderToOutput;
            }
            set
            {
                if (this != null)
                {
                    this.RenderType = value ? RenderType.BinaryStreaming : RenderType.ImageTag;
                }
                renderToOutput = value;
            }
        }

        /// <summary>
        /// Returns the base-64 string representation of the Chart as a PNG image.
        /// </summary>
        /// <returns></returns>
        public string ToBase64()
        {
            return ToBase64(this);
        }

        /// <summary>
        /// Returns a list of charting params passed in query string, as "param" + chart short name.
        /// i.e., "chartPSA=PSA,ACP" -> ["PSA", "ACP"]
        /// </summary>
        /// <returns></returns>
        public virtual IEnumerable<string> GetChartQueryParams()
        {
            if (!string.IsNullOrEmpty(chartShortName))
            {
                string queryParamName = "chart" + chartShortName;
                string queryParamsValue = Page != null && Page.Request != null ? Page.Request.QueryString[queryParamName] : string.Empty;
                if (!string.IsNullOrEmpty(queryParamsValue))
                {
                    // return list of chart params
                    var chartParams = queryParamsValue.Split(",".ToCharArray(), StringSplitOptions.RemoveEmptyEntries);
                    return chartParams;
                }
            }
            return new string[] { };
        }

        /// <summary>
        /// Returns the base-64 string representation of the Chart as a PNG image.
        /// </summary>
        /// <param name="chart"></param>
        /// <returns></returns>
        public static string ToBase64(Chart chart)
        {
            // stream for capturing output
            System.IO.MemoryStream ms = new System.IO.MemoryStream();
            // render chart image to stream
            chart.SaveImage(ms, ChartImageFormat.Png);
            // convert raw bytes to base-64 encoded string
            byte[] rawBytes = ms.ToArray();
            return Convert.ToBase64String(rawBytes);
        }

        protected override void Render(HtmlTextWriter writer)
        {
            string base64QS = Page != null && Page.Request != null ? Page.Request.QueryString["base64"] : string.Empty;
            bool renderBase64ByQS = RenderBase64ByQuery && !string.IsNullOrEmpty(base64QS) && bool.Parse(base64QS) == true;
            // render by base64 via QS or static attribute
            if (renderBase64ByQS || RenderBase64)
            {
                System.Web.UI.WebControls.Image img = new System.Web.UI.WebControls.Image();
                // required
                //img.ID = this.ID;
                //this.Attributes["id"] = this.ClientID;
                img.ID = this.ClientID;
                // consistent attributes
                img.Width = this.Width;
                img.Height = this.Height;
                img.AlternateText = this.AlternateText;
                img.ToolTip = this.ToolTip;
                // set raw data source
                string base64 = this.ToBase64();
                img.ImageUrl = "data:image/png;base64," + base64;
                // finally render image
                img.RenderControl(writer);
            }
            else
            {
                base.Render(writer);
            }
        }
    }

    /// <summary>
    /// A generic chron list chart of chron data, such as lab tests, etc...
    /// </summary>
    public class ChronItemChartControl : CaisisChart
    {
        /// <summary>
        /// The default plot color
        /// </summary>
        protected static readonly Color DEFAULT_CHRON_COLOR = Color.BlueViolet;

        /// <summary>
        /// A list of default chart colors
        /// </summary>
        protected static readonly Color[] DEFAULT_CHRON_COLORS = new Color[]
        {
            DEFAULT_CHRON_COLOR,
            Color.Aqua,
            Color.DarkBlue,
            Color.Firebrick,
            Color.ForestGreen,
            Color.Indigo,
            Color.Magenta,
            Color.Olive,
            Color.OrangeRed
        };

        private int _colorIncrement = 0;

        #region variables

        protected string chronVarName;
        protected string[] chronFilters = new string[0];
        protected string chronLookupCode;
        protected IDictionary<string, Color> chonVarColors;
        #endregion

        #region public getters/setters

        /// <summary>
        /// Gets or sets the chron list VarName field
        /// </summary>
        public string ChronVarName
        {
            get
            {
                return chronVarName;
            }
            set
            {
                chronVarName = value;
            }
        }  

        [TypeConverter(typeof(StringArrayConverter))]
        /// <summary>
        /// Gets or sets the list of fields by which to filter VarName
        /// </summary>
        public virtual string[] ChronVarFilters
        {
            get
            {
                return chronFilters;
            }
            set
            {
                chronFilters = value;
            }
        }

        /// <summary>
        /// Gets or sets the LKpFieldName to lookup default VarName values
        /// </summary>
        public string ChronLookupCode
        {
            get
            {
                return chronLookupCode;
            }
            set
            {
                chronLookupCode = value;
            }
        }

        /// <summary>
        /// 
        /// </summary>
        protected IDictionary<string, Color> ChonVarColors
        {
            get
            {
                if (chonVarColors == null)
                {
                    chonVarColors = GetDefaultColors(chronLookupCode);
                }
                return chonVarColors;
            }
        }

        #endregion
        
        #region constructors

        public ChronItemChartControl()
            : base()
        {
            InitUIDefaults();
        }

        public ChronItemChartControl(string varName, string lookupCode)
            : this()
        {
            this.chronVarName = varName;
            this.chronLookupCode = lookupCode;
        }

        #endregion

        #region control overrides

        protected override void OnInit(EventArgs e)
        {
            // determine if client set filters
            if (ChronVarFilters.Count() == 0)
            {
                var filterParams = GetChartQueryParams();
                // set query string filter
                if (filterParams.Count() > 0)
                {
                    ChronVarFilters = filterParams.ToArray();
                }
                // else default
                else
                {
                    InitDefaultChronFilters(chronLookupCode);
                }
            }
            // continue init dispatch
            base.OnInit(e);
        }

        protected override void OnDataBound(EventArgs e)
        {
            // after data binding, reinit color increment
            _colorIncrement = 0;
            // dispatch
            base.OnDataBound(e);
        }

        #endregion

        #region Init

        /// <summary>
        /// Initalizese UI defaults
        /// </summary>
        protected void InitUIDefaults()
        {
            this.Height = 450;
            this.Width = 800;
            this.BorderlineDashStyle = ChartDashStyle.Solid;
            this.BackGradientStyle= GradientStyle.DiagonalLeft;
            this.BackColor = System.Drawing.ColorTranslator.FromHtml("#5996AF");
            this.BorderSkin.SkinStyle = BorderSkinStyle.Emboss;

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

            area.AxisX.LineColor = Color.FromArgb(64, 64, 64, 64);
            area.AxisX.MajorGrid.LineColor = Color.FromArgb(64, 64, 64, 64);
            area.AxisX.IsLabelAutoFit = false;
            area.AxisX.ArrowStyle = AxisArrowStyle.None;
            area.AxisX.LabelStyle.Font = new Font("Arial", (float)8.25);

            area.AxisX2.Enabled =  AxisEnabled.False;
            area.AxisY2.Enabled = AxisEnabled.False;
            area.Area3DStyle.Rotation = 10;
            area.Area3DStyle.Perspective = 10;
            area.Area3DStyle.Inclination = 15;
            area.Area3DStyle.IsRightAngleAxes = false;
            area.Area3DStyle.WallWidth = 10;
            area.Area3DStyle.IsClustered = false;
            this.ChartAreas.Add(area);

            // legend default
            Legend legend = new Legend("Default");
            legend.Enabled = true;
            legend.IsTextAutoFit = true;
            legend.BackColor = System.Drawing.ColorTranslator.FromHtml("#D0E1E9");
            legend.BorderColor = System.Drawing.ColorTranslator.FromHtml("#DDEAF0");
            legend.Docking = Docking.Bottom;
            legend.Font = new Font("Arial", (float)8.25, FontStyle.Bold);
            this.Legends.Add(legend);
        }

        /// <summary>
        /// Init lab filter
        /// </summary>
        protected void InitDefaultChronFilters(string lkpFieldName)
        {
            if (!string.IsNullOrEmpty(lkpFieldName))
            {
                // set default filter fields
                chronFilters = (from row in CacheManager.GetLookupCodeList(lkpFieldName).AsEnumerable()
                                let code = row[LookupCode.LkpCode].ToString()
                                orderby code ascending
                                select code).Distinct().ToArray();
            }
            else
            {
                chronFilters = new string[] { };
            }
        }

        /// <summary>
        /// Get mapping of chron items to color
        /// </summary>
        /// <param name="lkpFieldName">The lkp field assocaited to colors by attribute</param>
        private IDictionary<string,Color> GetDefaultColors(string lkpFieldName)
        {
            if (!string.IsNullOrEmpty(lkpFieldName))
            {
                // build simple lookup for var name > color
                DataTable colorsDt = new LookupCodeDa().GetLookupCodesAttributeValues(lkpFieldName, "Color");
                var lookup = from row in colorsDt.AsEnumerable()
                             let lkpCode = row[LookupCode.LkpCode].ToString()
                             let lkpAttributeValue = row[LookupCodeAttribute.AttributeValue].ToString()
                             group lkpAttributeValue by lkpCode into g
                             let lkpCode = g.First()
                             let color = !string.IsNullOrEmpty(lkpCode) ? (lkpCode.StartsWith("#") ? System.Drawing.ColorTranslator.FromHtml(lkpCode) : System.Drawing.Color.FromName(lkpCode)) : DEFAULT_CHRON_COLOR
                             select new
                             {
                                 Code = g.Key,
                                 Color = color
                             };
                // convert mapping to lookup of var to Color
                return lookup.ToDictionary(k => k.Code, k => k.Color);
            }
            else
            {
                return new Dictionary<string, Color>();
            }
        }

        #endregion

        #region Build Chart

        /// <summary>
        /// Builds the PSA chart for patient with all lab types
        /// </summary>
        /// <param name="patientId"></param>
        public void BuildChart(int patientId)
        {
            BuildChart(patientId, ChronVarFilters);
        }

        /// <summary>
        /// Builds the PSA chart for patient by lab types
        /// </summary>
        /// <param name="patientId"></param>
        /// <param name="varTypes"></param>
        public void BuildChart(int patientId, IEnumerable<string> varTypes)
        {
            if (!string.IsNullOrEmpty(ChronVarName))
            {
                ChronoDa da = new ChronoDa();
                DataSet ds = da.GetChronoList(patientId, ChronVarName, System.Web.HttpContext.Current.User.Identity.Name);
                DataTable dt = ds.Tables[0];
                BuildChart(dt, varTypes);
            }
        }

        /// <summary>
        /// For the specific data source, plots var types
        /// </summary>
        /// <param name="dt"></param>
        /// <param name="varTypes"></param>
        public void BuildChart(DataTable dt, IEnumerable<string> varTypes)
        {
            this.Series.Clear();

            // get normalized search lookup
            var searchTypes = varTypes.Select(v => v.ToLower());

            var labs = from lab in dt.AsEnumerable()
                       let rowVarName = lab["VarName"].ToString()
                       let rowVarNameLower= rowVarName.ToLower()
                       // do normalized match
                       where searchTypes.Contains(rowVarNameLower)
                       group lab by rowVarName into g
                       select g;
            foreach (IGrouping<string, DataRow> grouping in labs)
            {
                string varName = grouping.Key;
                // convert gruoped results into DataView
                DataView chronByVarName = grouping.CopyToDataTable().DefaultView;

                string seriesName = varName;
                this.Series.Add(seriesName);
                this.Series[seriesName]["ShowMarkerLines"] = "True";
                this.Series[seriesName].BorderWidth = 2;
                this.Series[seriesName].ShadowOffset = 1;
                this.Series[seriesName].ShadowColor = System.Drawing.Color.DarkGray;
                this.Series[seriesName].Color = GetChartLineColor(varName);
                this.Series[seriesName].ChartType = SeriesChartType.Line;
                this.Series[seriesName].MarkerStyle = MarkerStyle.Circle;
                this.Series[seriesName].MarkerSize = 7;
                this.Series[seriesName].Points.DataBind(chronByVarName, "varDate", "varValue", "Tooltip=varName, Label=varValue");
            }

            this.DataBind();
        }

        #endregion

        /// <summary>
        /// Returns the Color for selected chron item
        /// </summary>
        /// <param name="itemName"></param>
        /// <returns></returns>
        protected Color GetChartLineColor(string itemName)
        {
            Color chartColor;
            // if lookup contains color
            if(ChonVarColors.ContainsKey(itemName))
            {
                chartColor = ChonVarColors[itemName];
            }
                // otherwise get color from default list
            else
            {
                // get current color
                chartColor = DEFAULT_CHRON_COLORS[_colorIncrement];
                // increment
                _colorIncrement = _colorIncrement == DEFAULT_CHRON_COLORS.Length - 1 ? 0 : (_colorIncrement + 1);
            }
            return chartColor;
        }
    }

    /// <summary>
    /// A chron list chart of lab data
    /// </summary>
    public class LabChartControl : ChronItemChartControl
    {
        private static readonly string LAB_TEST_VARNAME_DEFAULT = "LabTests";
        private static readonly string LAB_TEST_LOOKUP_CODE = "LabTest";

        /// <summary>
        /// Gets the chron list var name
        /// </summary>
        private static string LAB_TEST_VARNAME
        {
            get
            {
                string specialLabsTable = CaisisConfiguration.GetWebConfigValue("ExtendedLabsTable");
                return !string.IsNullOrEmpty(specialLabsTable) ? specialLabsTable : LAB_TEST_VARNAME_DEFAULT;
            }
        }

        public LabChartControl()
            : base(LAB_TEST_VARNAME, LAB_TEST_LOOKUP_CODE)
        {
        }

        [TypeConverter(typeof(StringArrayConverter))]
        /// <summary>
        /// Gets or sets the list of fileds by which to filter the lab graph
        /// </summary>
        protected virtual string[] LabFields
        {
            get
            {
                return base.ChronVarFilters;
            }
            set
            {
                base.ChronVarFilters = value;
            }
        }
    }

    /// <summary>
    /// 
    /// </summary>
    public static class ChartingUtil
    {
        /// <summary>
        /// Return a populated PSAChart control for specified patient
        /// </summary>
        /// <param name="patintId"></param>
        /// <returns></returns>
        public static LabChartControl GetPatientPSAChart(int patintId)
        {
            // load control for generating output
            LabChartControl psaGraph = new LabChartControl();
            psaGraph.BuildChart(patintId);
            return psaGraph;
        }
    }

    /// <summary>
    /// Represents the data and metadata (label, color, etc..) for a data point
    /// </summary>
    public class CaisisDataPoint
    {
        public object XValue;
        public double[] YValues;
        public string Label = "";
        public string AxisLabel = "";
        public Color DataPointColor = Color.Black;

        public CaisisDataPoint()
        {
        }

        public CaisisDataPoint(string label, string axisLabel, object xValue, params double[] yValues)
            : this()
        {
            this.Label = label;
            this.AxisLabel = axisLabel;
            this.XValue = xValue;
            this.YValues = yValues;
        }

        public CaisisDataPoint(string label, string axisLabel, Color pointColor, object xValue, params double[] yValues)
            : this(label, axisLabel, xValue, yValues)
        {
            this.DataPointColor = pointColor;
        }
    }
}