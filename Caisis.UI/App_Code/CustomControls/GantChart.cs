using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

using Caisis.BOL;
using Caisis.UI.Core.Classes.CustomControls;

namespace Caisis.UI.Core.Classes
{
    public enum GantPositioning
    {
        TopLeft,
        TopRight,
        BottonLeft,
        BottomRight
    }

    [ParseChildren(typeof(GantItem))]
    [ControlBuilder(typeof(CustomGantBuilder))]
    [PersistChildren(true)]
    /// <summary>
    /// Summary description for GantChart
    /// </summary>
    public class GantChart : Panel
    {
        private int markerCount = 12;
        private List<GantItem> gantItems = new List<GantItem>();

        // Color Based Variables
        public static readonly string STATIC_BASE_COLOR = "#660000";
        public static readonly string NO_VALID_DATE_COLOR = "#000000";
        public static readonly string NO_VALID_START_DATE_COLOR = "#000000";
        public static readonly string NO_VALID_END_DATE_COLOR = "#000000";
        public static readonly string DEFAULT_CSS_CLASS = "GantChart";
        public static readonly string DEFAULT_HEADER_BG_COLOR = "#999999";
        public static readonly string DEFAULT_HEADER_FONT_COLOR = "#ffffff";

        public static readonly string ABSOLUTE_POSITION = "absolute";
        public static readonly int GANT_ZINDEX = 1000;
        public static readonly int HEADER_ZINDEX = 1100;
        public static readonly int LEGEND_ZINDEX = 1200;
        public static readonly int ITEM_TOP_OFFSET = 20;

        private GantPositioning legendPosition = GantPositioning.BottomRight;

        private string gantTitle = "";
        private string gantTitleCss = "";
        private bool showGantTitle = true;
        private bool showGantLegend = false;
        private bool showGantItemDescriptions = true;

        //Style
        private string headerBackgroundColor = DEFAULT_HEADER_BG_COLOR;
        private string headerFontColor = DEFAULT_HEADER_FONT_COLOR;
        private int headerHeight = 15;
        private string headerCssClass;
        private bool useStaticHeaderStyles = true;
        private bool alternateMarkers = false;

        private string staticColor = "";
        private bool useDynamicColors = true;
        private string[] dynamicColorList = new string[] { "#660000", "#006633", "#ff9900", "#336699" };

        private int completedItemOpacity = 75;
        private int remainingItemOpacity = 50;

        // Date Variables
        private string startDataField;
        private string endDataField;
        DateTime startDate;
        DateTime endDate;

        // Javascript events
        private string onItemMouseClick;
        private string onItemMouseOver;
        private string onItemMouseOut;


        /// <summary>
        /// Gets or sets the title of the Chart
        /// </summary>
        public string GantTitle
        {
            get
            {
                return gantTitle;
            }
            set
            {
                gantTitle = value;
            }
        }

        /// <summary>
        /// Gets or sets the Css class for the chart title
        /// </summary>
        public string GantTitleCss
        {
            get
            {
                return gantTitleCss;
            }
            set
            {
                gantTitleCss = value;
            }
        }

        /// <summary>
        /// Gets or sets whether or not to show the gant chart title
        /// </summary>
        public bool ShowGantTitle
        {
            get
            {
                return showGantTitle;
            }
            set
            {
                showGantTitle = value;
            }
        }

        public GantPositioning LegendPosition
        {
            get
            {
                return legendPosition;
            }
            set
            {
                legendPosition = value;
            }
        }

        public string HeaderBackgroundColor
        {
            get
            {
                return headerBackgroundColor;
            }
            set
            {
                headerBackgroundColor = value;
            }
        }

        public string HeaderFontColor
        {
            get
            {
                return headerFontColor;
            }
            set
            {
                headerFontColor = value;
            }
        }

        /// <summary>
        /// Gets or sets the height of the header. Will be used to determine distance for start of first Gant Item.
        /// </summary>
        public int HeaderHeight
        {
            get
            {
                return headerHeight;
            }
            set
            {
                headerHeight = value;
            }
        }

        public string HeaderCssClass
        {
            get
            {
                return headerCssClass;
            }
            set
            {
                headerCssClass = value;
            }
        }

        /// <summary>
        /// Gets or sets wheather inline styles (background-color, font color, etc..) should be used.
        /// Defaults to true. Useful to set to false if styling header using HeaderCssClass.
        /// </summary>
        public bool UseStaticHeaderStyles
        {
            get
            {
                return useStaticHeaderStyles;
            }
            set
            {
                useStaticHeaderStyles = value;
            }
        }

        public string OnItemMouseClick
        {
            get
            {
                return onItemMouseClick;
            }
            set
            {
                onItemMouseClick = value;
            }
        }

        public string OnItemMouseOver
        {
            get
            {
                return onItemMouseOver;
            }
            set
            {
                onItemMouseOver = value;
            }
        }

        public string OnItemMouseOut
        {
            get
            {
                return onItemMouseOut;
            }
            set
            {
                onItemMouseOut = value;
            }
        }

        public int MarkerCount
        {
            get
            {
                return markerCount;
            }
            set
            {
                markerCount = value;
            }
        }

        /// <summary>
        /// Gets or sets a static color to represent all GantItems, unless GantItem has Color property defined.
        /// </summary>
        public string StaticColor
        {
            get
            {
                return staticColor;
            }
            set
            {
                staticColor = value;
            }
        }

        /// <summary>
        /// Gets whether to not to use dynamic colors for GantItems. Will overwrite Color property on GantItem if present.
        /// </summary>
        public bool UseDynamicColors
        {
            get
            {
                return useDynamicColors;
            }
            set
            {
                useDynamicColors = value;
            }
        }

        /// <summary>
        /// Gets or sets the percentage (1-100) of the a Gant Item's remaining region's opacity.
        /// </summary>
        public int RemainingItemOpacity
        {
            get
            {
                return remainingItemOpacity;
            }
            set
            {
                if (value >= 1 && value <= 100)
                {
                    remainingItemOpacity = value;
                }
            }
        }

        /// <summary>
        /// Gets or sets the percentage (1-100) of the a Gant Item's completed region's opacity.
        /// </summary>
        public int CompletedItemOpacity
        {
            get
            {
                return completedItemOpacity;
            }
            set
            {
                if (value >= 1 && value <= 100)
                {
                    completedItemOpacity = value;
                }
            }
        }

        /// <summary>
        /// Contains a list of GantItems for a Gant Chart.
        /// </summary>
        public List<GantItem> GantItems
        {
            get
            {
                return gantItems;
            }
        }

        /// <summary>
        /// Gets or sets the start date for the Gant Chart. Defaults to earliest StartDate in GantItems list.
        /// </summary>
        public DateTime StartDate
        {
            get
            {
                return startDate;
            }
            set
            {
                startDate = value;
            }
        }

        /// <summary>
        /// Gets or sets the end date for the Gant Chart.  Defaults to latest StartDate in GantItems list.
        /// </summary>
        public DateTime EndDate
        {
            get
            {
                return endDate;
            }
            set
            {
                endDate = value;
            }
        }

        /// <summary>
        /// Gets or sets the Data Field used for binding starting point of GantItems.
        /// </summary>
        public string StartDataField
        {
            get
            {
                return startDataField;
            }
            set
            {
                startDataField = value;
            }
        }

        /// <summary>
        /// Gets or sets the Data Field used for binding ending point of GantItems.
        /// </summary>
        public string EndDataField
        {
            get
            {
                return endDataField;
            }
            set
            {
                endDataField = value;
            }
        }

        /// <summary>
        /// Gets or sets whether a legend is rendered on the chart
        /// </summary>
        public bool ShowGantLegend
        {
            get
            {
                return showGantLegend;
            }
            set
            {
                showGantLegend = value;
            }
        }

        /// <summary>
        /// Gets or sets whether to show the text description on the gant nodes
        /// </summary>
        public bool ShowGantItemDescriptions
        {
            get
            {
                return showGantItemDescriptions;
            }
            set
            {
                showGantItemDescriptions = value;
            }
        }

        /// <summary>
        /// Gets or sets whether to alternate date markers (i.e. show dates every other marker)
        /// </summary>
        public bool AlternateMarkers
        {
            get
            {
                return alternateMarkers;
            }
            set
            {
                alternateMarkers = value;
            }
        }

        public GantChart()
        {
            startDate = DateTime.MinValue;
            endDate = DateTime.MaxValue;

            this.CssClass = DEFAULT_CSS_CLASS;
        }

        /// <summary>
        /// Override child controls initalization to add GantItems into GantItem List 
        /// </summary>
        protected override void CreateChildControls()
        {
            base.CreateChildControls();
            // GantItems should be the only type of child allowed, as per CustomGantBuilder class
            foreach (Control con in this.Controls)
            {
                if (con is GantItem)
                {
                    this.gantItems.Add(con as GantItem);
                }
            }
        }

        protected override void Render(HtmlTextWriter writer)
        {
            Page.ClientScript.RegisterStartupScript(typeof(Page), "GantManager", "var GantManager = {};", true);
            string myGant = "GantManager['" + this.ClientID + "'] = new Array();";
            Page.ClientScript.RegisterStartupScript(typeof(Page), "Gant" + this.ClientID, myGant, true);

            // Get count of Gant Items.
            int itemCount = this.gantItems.Count;
            // If there are no gant items, just render empty control.
            if (itemCount == 0)
            {
                Label noItems = new Label();
                noItems.CssClass = "GantChartNoItems";
                noItems.Text = "No Items";

                base.RenderBeginTag(writer);
                noItems.RenderControl(writer);
                base.RenderEndTag(writer);
            }
            else
            {
                // Keep track of items with no start or end dates 
                // (i.e., DateTime.Min && DateTime.Min Dates)
                List<GantItem> gantItemsNoStart = new List<GantItem>();
                List<GantItem> gantItemsNoEnd = new List<GantItem>();

                // Index of visible items, not all items in chart will be visible
                // so no need to offset valid items which are next to invalid items
                int visibleGantIndex = 0;
                for (int i = 0; i < itemCount; i++)
                {
                    GantItem item = this.gantItems[i];

                    item.ShowDescription = showGantItemDescriptions;

                    // Set opacities
                    item.RemainingOpacity = remainingItemOpacity;
                    item.CompletedOpacity = completedItemOpacity;

                    // Set mouse events, if not defined in individual items
                    if (!string.IsNullOrEmpty(this.onItemMouseClick) && string.IsNullOrEmpty(item.OnMouseClick))
                    {
                        item.OnMouseClick = this.onItemMouseClick;
                    }
                    if (!string.IsNullOrEmpty(this.onItemMouseOver) && string.IsNullOrEmpty(item.OnMouseOver))
                    {
                        item.OnMouseOver = this.onItemMouseOver;
                    }
                    if (!string.IsNullOrEmpty(this.onItemMouseOut) && string.IsNullOrEmpty(item.OnMouseOut))
                    {
                        item.OnMouseOut = this.onItemMouseOut;
                    }

                    // DETERMINE GLOBAL DATES

                    // Determine earliest start date
                    if (item.HasValidStartDate && (startDate == DateTime.MinValue || item.StartDate < startDate))
                    {
                        startDate = new DateTime(item.StartDate.Ticks);
                    }
                    else
                    {
                        if (item.HasValidEndDate && startDate > item.EndDate)
                        {
                            startDate = new DateTime(item.EndDate.Ticks);
                        }
                        gantItemsNoStart.Add(item);
                    }
                    // Determine latest end date
                    if (item.HasValidEndDate && (endDate == DateTime.MaxValue || item.EndDate > endDate))
                    {
                        endDate = new DateTime(item.EndDate.Ticks);
                    }
                    else
                    {
                        if (item.HasValidStartDate && endDate < item.StartDate)
                        {
                            endDate = new DateTime(item.StartDate.Ticks);
                        }
                        gantItemsNoEnd.Add(item);
                    }

                    // Determine if item will be visible, i.e. it has valid end or start date (or both)
                    if (!item.HasInvalidDates)
                    {

                        // Distance from the top of container is determine by factor of ITEM_TOP_OFFSET
                        item.Top = (visibleGantIndex * ITEM_TOP_OFFSET) + 25;

                        // Determine coloring of item
                        DeterminGantItemColor(item, i);

                        visibleGantIndex++;
                    }
                }

                // Determin "real" start and end dates
                // i.e. Min and Max dates should not be valid
                if (startDate == DateTime.MinValue)
                {
                    // If both dates are invalid
                    // span is the beginng of this to begining of next year
                    if (endDate == DateTime.MaxValue)
                    {
                        DateTime today = DateTime.Today;
                        DateTime firstDayOfYear = new DateTime(today.Year, 1, 1);
                        DateTime firstDayOfNextYear = new DateTime(today.Year + 1, 1, 1);
                        startDate = firstDayOfYear;
                        endDate = firstDayOfNextYear;
                    }
                    // Otherwirse, start date is a year before the end date
                    else
                    {
                        startDate = new DateTime(endDate.Year - 1, 1, 1);
                    }
                }
                else if (endDate == DateTime.MaxValue)
                {
                    // Start date is valid at this point
                    endDate = new DateTime(startDate.Year, 1, 1);
                }

                /// NORMALIZE START AND END DATE
                // Start and Ends always occur on 1st of month
                int startMonth = startDate.Month;
                int startYear = startDate.Year;
                if (startMonth == 1)
                {
                    startMonth = 12;
                    startYear = startYear - 1;
                }

                // Each marker should represent a differnt date/day, so the range of the chart
                // should cover at least the count of markers
                int currentChartDaySpan = (int)(endDate - startDate).TotalDays;
                if (currentChartDaySpan < markerCount)
                {
                    long neededChartDaySpan = (new TimeSpan(markerCount, 0, 0, 0, 0) - (endDate - startDate)).Ticks;
                    long daysBefore = neededChartDaySpan / (long)2.0;
                    long daysAfter = neededChartDaySpan / (long)2.0;
                    // Subtract and Add days to current start and end dates
                    startDate = startDate.Subtract(new TimeSpan(daysBefore));
                    endDate = endDate.Add(new TimeSpan(daysAfter));
                }
                else
                {
                    long ticksPerMarker = (endDate - startDate).Ticks / (long)markerCount;
                    startDate = startDate.Subtract(new TimeSpan(ticksPerMarker));
                    endDate = endDate.Add(new TimeSpan(ticksPerMarker));
                }


                // A double representing the ticks from the start to the end of chart
                double chartDateSpan = (double)(endDate - startDate).Ticks;
                double increment = chartDateSpan / (double)markerCount;


                // Loop tghrough all items and deteremine widths based on
                // date range in chart
                for (int i = 0; i < itemCount; i++)
                {
                    GantItem item = this.gantItems[i] as GantItem;

                    // Only concernced with calculations with items that have valid dates
                    if (item.HasValidStartDate || item.HasValidEndDate)
                    {
                        if (item.HasValidDates)
                        {
                            double itemDateSpan = (double)(item.EndDate - item.StartDate).Ticks;
                            double itemDateFromStart = (double)(item.StartDate - startDate).Ticks;
                            int itemDateSpanPercentage = (int)(itemDateSpan / chartDateSpan * 100.0);
                            int itemDateSpanFromStart = (int)(itemDateFromStart / chartDateSpan * 100.0);

                            // Items with valid dates need at least 1% width to be represented
                            item.Style["width"] = Math.Max(1, itemDateSpanPercentage) + "%";
                            item.Left = itemDateSpanFromStart;
                        }
                        // Invalid items do not need widths set explicitly, will be handled by control
                        else
                        {
                            if (item.HasValidStartDate)
                            {
                                double itemDateFromStart = (double)(item.StartDate - startDate).Ticks;
                                int itemDateFromStartPercentage = (int)(itemDateFromStart / chartDateSpan * 100.0);
                                item.Left = itemDateFromStartPercentage;
                            }
                            else if (item.HasValidEndDate)
                            {
                                double itemDateFromEnd = (double)(endDate - item.EndDate).Ticks;
                                int itemDateFromEndPercentage = 100 - (int)(itemDateFromEnd / chartDateSpan * 100.0);
                                item.Left = itemDateFromEndPercentage;
                            }
                        }
                    }
                }

                // RENDERING
                // Content which is not part of GantChart (i.e., legend, headers, etc...)
                // should be rendered/writen directly to the output
                // instead of being Controls in the GantChart Control collection



                base.RenderBeginTag(writer);
                base.RenderContents(writer);
                // Render Title
                RenderGantTitle(writer);
                // Render Header
                RenderGantHeader(increment, writer);
                // Render Chart Background (w/ lines)
                RenderGantBackground(writer);
                // Render Legend
                RenderGantLegend(writer);

                base.RenderEndTag(writer);


            }
        }

        /// <summary>
        /// Renders out the title of the chart
        /// </summary>
        /// <param name="writer"></param>
        private void RenderGantTitle(HtmlTextWriter writer)
        {
            if (showGantTitle && !string.IsNullOrEmpty(gantTitle))
            {
                // Create label/span for rendering gant chart title
                Label title = new Label();
                title.Text = gantTitle;
                title.ToolTip = gantTitle;
                // Use user defined class
                if (!string.IsNullOrEmpty(gantTitleCss))
                {
                    title.CssClass = gantTitleCss;
                }
                // Else use default inline styles
                else
                {
                    title.Style["position"] = ABSOLUTE_POSITION;
                    title.Style["bottom"] = "5px";
                    title.Style["right"] = "5px";
                    title.Style["color"] = "#000000";
                }
                // Set z-index to stack on top of other items
                title.Style[HtmlTextWriterStyle.ZIndex] = "" + LEGEND_ZINDEX + 1;
                title.RenderControl(writer);
            }
        }

        /// <summary>
        /// Renders the Header of the GantChart with the dates listed based on the span of dates
        /// and the number of markers.
        /// </summary>
        /// <param name="writer"></param>
        private void RenderGantHeader(double increment, HtmlTextWriter writer)
        {
            // Creat a container for holding header items
            Panel headerContainer = new Panel();

            // Set Required Styles
            headerContainer.Style[HtmlTextWriterStyle.Position] = ABSOLUTE_POSITION;
            headerContainer.Style[HtmlTextWriterStyle.Left] = "0%";
            headerContainer.Style[HtmlTextWriterStyle.Top] = "0%";
            headerContainer.Style[HtmlTextWriterStyle.Width] = "100%";
            headerContainer.Style[HtmlTextWriterStyle.Height] = headerHeight + "px";



            // Set user configured styles
            if (!string.IsNullOrEmpty(headerCssClass))
            {
                headerContainer.CssClass = headerCssClass;
            }
            else if (useStaticHeaderStyles || string.IsNullOrEmpty(headerCssClass))
            {
                headerContainer.Style[HtmlTextWriterStyle.BackgroundColor] = headerBackgroundColor;
                headerContainer.Style[HtmlTextWriterStyle.BorderStyle] = "none";
                headerContainer.Style[HtmlTextWriterStyle.Color] = headerFontColor;
            }

            headerContainer.Style[HtmlTextWriterStyle.ZIndex] = HEADER_ZINDEX.ToString();
            int headerItemsNeeded = markerCount - 1;

            for (int i = 0; i < headerItemsNeeded; i++)
            {
                // Create Header Item and Text Holder
                Panel headerItem = new Panel();
                Label headerItemText = new Label();

                // Set Date
                DateTime nextMarker = new DateTime(startDate.Ticks + (long)((i + 1) * increment));
                headerItemText.Text = nextMarker.ToShortDateString();

                // Calculate width and positioning
                double singleMarkerWidth = 100.0 / (double)markerCount;
                double singleHeaderItemWidth = 100.0 / (double)(headerItemsNeeded);
                double headerItemOffset = singleHeaderItemWidth - singleMarkerWidth;

                double width = singleHeaderItemWidth;
                double left = (double)i * singleMarkerWidth + ((singleMarkerWidth / 2.0) - headerItemOffset);

                headerItem.Style[HtmlTextWriterStyle.Width] = width + "%";
                headerItem.Style[HtmlTextWriterStyle.Left] = left + "%";

                headerItem.Style[HtmlTextWriterStyle.Position] = ABSOLUTE_POSITION;
                headerItem.Style[HtmlTextWriterStyle.TextAlign] = "center";
                headerItem.Style[HtmlTextWriterStyle.FontWeight] = "bold";

                // Add text to item, and item to header
                headerItem.Controls.Add(headerItemText);
                headerContainer.Controls.Add(headerItem);

                // Determine if dates need to be alternated (NOTE: Items are still rendered, just supressed on UI)
                // Items are rendered to get parseable date
                if (alternateMarkers && i % 2 == 1)
                {
                    headerItem.Style["display"] = "none";
                }
            }
            headerContainer.RenderControl(writer);
        }

        /// <summary>
        /// Renders lines in the background to indicate markers in the Gant Chart.
        /// </summary>
        /// <param name="writer"></param>
        private void RenderGantBackground(HtmlTextWriter writer)
        {
            HtmlTable gantBackground = new HtmlTable();
            gantBackground.CellPadding = 0;
            gantBackground.CellSpacing = 0;
            gantBackground.Attributes.Add("class", "GantBackgroundTable");
            HtmlTableRow row = new HtmlTableRow();
            gantBackground.Rows.Add(row);
            for (int i = 0; i < markerCount; i++)
            {
                HtmlTableCell cell = new HtmlTableCell();
                Label l = new Label();
                cell.Controls.Add(l);
                row.Cells.Add(cell);
            }
            gantBackground.RenderControl(writer);
        }


        /// <summary>
        /// Renders the legeng used to signal dates which aren't valid.
        /// </summary>
        /// <param name="writer"></param>
        private void RenderGantLegend(HtmlTextWriter writer)
        {
            if (ShowGantLegend)
            {
                HtmlTable gantLegend = new HtmlTable();
                HtmlTableRow legendRow = new HtmlTableRow();
                gantLegend.Rows.Add(legendRow);

                string iconStyleWidth = "15px";

                HtmlTableCell noValidDateIcon = new HtmlTableCell();
                noValidDateIcon.Style[HtmlTextWriterStyle.BackgroundColor] = NO_VALID_DATE_COLOR;
                noValidDateIcon.Style[HtmlTextWriterStyle.Width] = iconStyleWidth;
                legendRow.Cells.Add(noValidDateIcon);

                HtmlTableCell noValidDateTextField = new HtmlTableCell();
                noValidDateTextField.InnerText = "No Valid Dates";
                legendRow.Cells.Add(noValidDateTextField);

                HtmlTableCell noValidStartDateIcon = new HtmlTableCell();
                noValidStartDateIcon.Style[HtmlTextWriterStyle.BackgroundColor] = NO_VALID_START_DATE_COLOR;
                noValidStartDateIcon.Style[HtmlTextWriterStyle.Width] = iconStyleWidth;
                legendRow.Cells.Add(noValidStartDateIcon);

                HtmlTableCell noValidStartDateField = new HtmlTableCell();
                noValidStartDateField.InnerText = "No Valid Start Date";
                legendRow.Cells.Add(noValidStartDateField);

                HtmlTableCell noValidEndDateIcon = new HtmlTableCell();
                noValidEndDateIcon.Style[HtmlTextWriterStyle.BackgroundColor] = NO_VALID_END_DATE_COLOR;
                noValidEndDateIcon.Style[HtmlTextWriterStyle.Width] = iconStyleWidth;
                legendRow.Cells.Add(noValidEndDateIcon);

                HtmlTableCell noValidEndDateField = new HtmlTableCell();
                noValidEndDateField.InnerText = "No Valid End Date";
                legendRow.Cells.Add(noValidEndDateField);

                HtmlTableCell showLabelsCell = new HtmlTableCell();
                showLabelsCell.Style["width"] = iconStyleWidth;
                // Create a checkbox which executes inline js to show/hide labels
                CheckBox showHideLabelsCheckBox = new CheckBox();
                showHideLabelsCheckBox.Checked = true;
                string inlineJSShowHideLabels = "var c = this.checked;var g=document.getElementById('" + this.ClientID + "');var gi=g.getElementsByTagName('DIV'); for(var i=0;i<gi.length;i++){ if(gi[i].className=='GantItemDescription') gi[i].style.display = c ? '' : 'none'; }";
                showHideLabelsCheckBox.Attributes["onclick"] = inlineJSShowHideLabels;

                showLabelsCell.Controls.Add(showHideLabelsCheckBox);
                legendRow.Cells.Add(showLabelsCell);

                HtmlTableCell showLabelsText = new HtmlTableCell();
                showLabelsText.InnerText = "Show Labels";
                legendRow.Cells.Add(showLabelsText);

                foreach (HtmlTableCell cell in new HtmlTableCell[] { noValidDateTextField, noValidStartDateField, noValidEndDateField, showLabelsText })
                {
                    cell.Style["font-size"] = "8px";
                    cell.Style["text-align"] = "center";
                }

                gantLegend.CellPadding = 0;
                gantLegend.CellSpacing = 0;
                gantLegend.Style[HtmlTextWriterStyle.Position] = ABSOLUTE_POSITION;
                gantLegend.Style[HtmlTextWriterStyle.ZIndex] = LEGEND_ZINDEX.ToString();
                gantLegend.Style["width"] = "350px";
                gantLegend.Style["background-color"] = "#ffffff";
                gantLegend.Style["border"] = "1px solid #333333";
                gantLegend.Style["height"] = "10px";
                gantLegend.Style["table-layout"] = "fixed";

                if (LegendPosition == GantPositioning.BottomRight)
                {
                    gantLegend.Style["bottom"] = "5px";
                    gantLegend.Style["right"] = "5px";
                }

                // Render Legend Table
                gantLegend.RenderControl(writer);
            }
        }



        /// <summary>
        /// Determin coloring of GantItem, based on dates and override when needed.
        /// </summary>
        /// <param name="item">The GantItem to check.</param>
        private void DeterminGantItemColor(GantItem item, int itemIndex)
        {
            // Items with invalid Date(s), need to be re-colored
            if (item.HasInvalidDates)
            {
                if (string.IsNullOrEmpty(item.Color))
                {
                    item.Color = NO_VALID_DATE_COLOR;
                }
                item.Description = item.Description;
            }
            else if (!item.HasValidStartDate)
            {
                if (string.IsNullOrEmpty(item.Color))
                {
                    item.Color = NO_VALID_START_DATE_COLOR;
                }
                item.Description = item.Description;
            }
            else if (!item.HasValidEndDate)
            {
                if (string.IsNullOrEmpty(item.Color))
                {
                    item.Color = NO_VALID_END_DATE_COLOR;
                }
                item.Description = item.Description;
            }
            // If dynamic coloring is requested, overwrite inline values
            else if (useDynamicColors)
            {
                if (string.IsNullOrEmpty(item.Color))
                {
                    int colorIndex = itemIndex % dynamicColorList.Length;
                    item.Color = dynamicColorList[colorIndex];
                }
            }
            // All items need a color, determine default color
            else if (string.IsNullOrEmpty(item.Color))
            {
                // If a static color is set for chart, use that color
                if (!string.IsNullOrEmpty(this.staticColor))
                {
                    item.Color = this.staticColor;
                }
                // Else, use a default color
                else
                {
                    item.Color = STATIC_BASE_COLOR;
                }
            }
        }
    }

    [ParseChildren(true)]
    /// <summary>
    /// Wrapper class to symbolize a horizontal bar on a Gant Chart.
    /// </summary>
    public class GantItem : Panel
    {
        // Constants
        public static readonly int ITEM_HEIGHT = 12;
        public static readonly string ITEM_POSITIONING = "absolute";
        public static readonly string ITEM_FLOAT_DIRECTION = "left";
        private static readonly int HEX_HALF_POINT = Int32.Parse("ffffff", System.Globalization.NumberStyles.HexNumber) / 2;
        private static readonly string HEX_DARK = "#000000";
        private static readonly string HEX_LIGHT = "#000000";

        private bool showDescription = true;

        /// <summary>
        /// The width of item if it has an invalid start or end dates (not both).
        /// </summary>
        private static readonly string INVALID_DATE_WIDTH = "2px";

        /// <summary>
        /// The offset the item's descrption whn it has an invalid start or end dates (not both).
        /// </summary>
        private static readonly string INVALID_DATE_OFFSET = "6px";

        private Panel completed = new Panel();
        private Panel remaining = new Panel();

        private DateTime startDate;
        private DateTime endDate;

        private string color;
        private int percentComplete = 100;

        private string description = "";
        private int remainingOpacity = 50;
        private int completedOpacity = 75;

        private int top = 0;
        private int left = 0;

        private string onMouseClick;
        private string onMouseOver;
        private string onMouseOut;

        /// <summary>
        /// Gets or sets the description for the GantItem. User for displaying item.
        /// </summary>
        public string Description
        {
            get
            {
                return description;
            }
            set
            {
                description = value;
            }
        }

        public string OnMouseClick
        {
            get
            {
                return onMouseClick;
            }
            set
            {
                onMouseClick = value;
            }
        }

        /// <summary>
        /// Gets or sets the name of javascript function to execute when user mouses' over the GantItem. 
        /// function(gantItem,event,startDateShortString,endDateShortString,gantItemColor);
        /// Ex: OnMouseOver="handleGantOver" -> onmouseover="handleGantOver(this,event,'01/01/2008','05/25/2008','#fffccc');"
        /// </summary>
        public string OnMouseOver
        {
            get
            {
                return onMouseOver;
            }
            set
            {
                onMouseOver = value;
            }
        }

        /// <summary>
        /// Gets or sets the name of the javascript function which is fired when user mouses' out of the GantItem.
        /// function(gantItem,event);
        /// Ex: OnMouseOver="handleGantOut" -> onmouseover="handleGantOut(this,event);"
        /// </summary>
        public string OnMouseOut
        {
            get
            {
                return onMouseOut;
            }
            set
            {
                onMouseOut = value;
            }
        }

        /// <summary>
        /// Gets or sets the "top" position of the item in the Gant Chart (as px)
        /// </summary>
        public int Top
        {
            get
            {
                return top;
            }
            set
            {
                top = value;
            }
        }

        /// <summary>
        /// Gets or sets the "left" position of the item in the Gant Chart (as %)
        /// </summary>
        public int Left
        {
            get
            {
                return left;
            }
            set
            {
                left = value;
            }
        }

        /// <summary>
        /// Gets or sets the StartDate for the span of the GantItem
        /// </summary>
        public DateTime StartDate
        {
            get
            {
                return startDate;
            }
            set
            {
                startDate = value;
            }
        }

        /// <summary>
        /// Gets or sets the EndDate for the span of the GantItem
        /// </summary>
        public DateTime EndDate
        {
            get
            {
                return endDate;
            }
            set
            {
                endDate = value;
            }
        }

        /// <summary>
        /// Returns whether or not this item has a valid StartDate (i.e. StartDate!=DateTime.MinValue)
        /// </summary>
        public bool HasValidStartDate
        {
            get
            {
                return startDate != DateTime.MinValue;
            }
        }

        /// <summary>
        /// Returns whether or not this item has a valid EndDate (i.e. EndDate!=DateTime.MaxValue)
        /// </summary>
        public bool HasValidEndDate
        {
            get
            {
                return endDate != DateTime.MaxValue;
            }
        }

        /// <summary>
        /// Returns wether the StartDate and EndDates are valid (i.e., not equal to DateTime max and min constants)
        /// </summary>
        public bool HasValidDates
        {
            get
            {
                return HasValidStartDate && HasValidEndDate;
            }
        }

        /// <summary>
        /// Returns wether the StartDate and EndDates are invalid (i.e., equal to DateTime max and min constants)
        /// </summary>
        public bool HasInvalidDates
        {
            get
            {
                return !HasValidStartDate && !HasValidEndDate;
            }
        }

        public int PercentComplete
        {
            get
            {
                return percentComplete;
            }
            set
            {
                percentComplete = value;
            }
        }

        public string Color
        {
            get
            {
                return color;
            }
            set
            {
                color = value;
            }
        }

        /// <summary>
        /// Gets or sets the percentage (1-100) of the remaining region's opacity.
        /// </summary>
        public int RemainingOpacity
        {
            get
            {
                return remainingOpacity;
            }
            set
            {
                if (value >= 1 && value <= 100)
                {
                    remainingOpacity = value;
                }
            }
        }

        /// <summary>
        /// Gets or sets the percentage (1-100) of the completed region's opacity.
        /// </summary>
        public int CompletedOpacity
        {
            get
            {
                return completedOpacity;
            }
            set
            {
                if (value >= 1 && value <= 100)
                {
                    completedOpacity = value;
                }
            }
        }

        /// <summary>
        /// Gets or sets whether to show item description.
        /// </summary>
        public bool ShowDescription
        {
            get
            {
                return showDescription;
            }
            set
            {
                showDescription = value;
            }
        }

        public GantItem()
        {
            Initalize();
            BuildProgressBars();
        }

        /// <summary>
        /// Initazlie variables and base cases
        /// </summary>
        private void Initalize()
        {
            // Initalizs
            startDate = DateTime.MinValue;
            endDate = DateTime.MaxValue;

            // Styles
            this.Width = 0;
            this.CssClass = "GantChartItem";
            //this.Color = GantChart.BASE_COLOR;
            this.Style.Add("position", ITEM_POSITIONING);
        }

        public GantItem(DateTime start, DateTime end)
            : this()
        {
            this.startDate = start;
            this.endDate = end;
        }

        private void BuildProgressBars()
        {
            if (this.Controls.Count == 0)
            {
                completed.Style.Add("position", GantChart.ABSOLUTE_POSITION);
                completed.Style.Add("height", ITEM_HEIGHT + "px");
                remaining.Style.Add("position", GantChart.ABSOLUTE_POSITION);
                remaining.Style.Add("height", ITEM_HEIGHT + "px");

                this.Controls.Add(completed);
                this.Controls.Add(remaining);
            }
        }

        /// <summary>
        /// Determine width of completed bars and opacity of remaining item.
        /// </summary>
        /// <param name="writer"></param>
        protected override void Render(HtmlTextWriter writer)
        {
            // Control only needs to render, if there is a start and end date.
            // Otherwise, there is a no range to represent on the chart, do not render.
            if (!HasInvalidDates)
            {
                // Render Mouse Events
                // An wrapper js function is created, which user to call a function using GantItem properties such as color, startDate,etc...
                // Ex: GantItem.OnClientClick="doSomething(bar,e,color);"
                //     onclick="(function(bar,e,startDate,endDate,color,displayText) { doSomething(bar,e,color); })(this,event,'02/18/2004','05/12/2008','#fffccc','My Text');"
                string javascriptArgs = GetMouseEventScript();
                string anonJsFunc = "(function(bar,e,startDate,endDate,color,displayText){ " + onMouseClick + " })" + javascriptArgs;

                if (!string.IsNullOrEmpty(onMouseClick))
                {
                    this.Attributes.Add("onclick", anonJsFunc);
                }
                if (!string.IsNullOrEmpty(onMouseOver))
                {
                    this.Attributes.Add("onmouseover", anonJsFunc);
                }
                if (!string.IsNullOrEmpty(onMouseOut))
                {
                    this.Attributes.Add("onmouseout", anonJsFunc);
                }

                // Set required inline styles
                this.Style.Add("left", Left + "%");
                this.Style.Add("top", Top + "px");
                this.Style.Add("height", GantItem.ITEM_HEIGHT + "px");

                // Completed and remaining percentages are scaled as percentage of Gant Item's width
                // And positioning is also absolutely positioned in ralation to the Gant Item.
                string completedPercentage = percentComplete + "%";
                string remainingPercentage = (100 - percentComplete) + "%";

                completed.Style.Add("width", completedPercentage);
                completed.Style["top"] = "0%";
                completed.Style["left"] = "0%";

                remaining.Style.Add("width", remainingPercentage);
                remaining.Style["top"] = "0%";
                remaining.Style["left"] = percentComplete + "%";

                // Color Item
                this.Style.Add("border", "1px solid " + color);
                completed.Style.Add("background-color", color);
                remaining.Style.Add("background-color", color);

                // Set completed and remaining opacity
                completed.Style.Add("filter", "alpha(opacity=" + completedOpacity + ")");
                completed.Style.Add("opacity", "." + completedOpacity);
                remaining.Style.Add("filter", "alpha(opacity=" + remainingOpacity + ")");
                remaining.Style.Add("opacity", "." + remainingOpacity);

                // Render start html tag item
                base.RenderBeginTag(writer);

                // Create a label for rendering Item description
                Label itemLabelDescription = new Label();
                itemLabelDescription.CssClass = "GantItemDescription";
                itemLabelDescription.Text = this.description;
                itemLabelDescription.Style["width"] = "auto";
                itemLabelDescription.Style["z-Index"] = (GantChart.GANT_ZINDEX + 1).ToString();
                itemLabelDescription.Style["color"] = DetermineInverseHexColor(color);

                // Items with invalid dates (start or end) will appear as small dash
                // and description will dock to right or left, depending to where the items
                // appears on the graph
                if (!HasValidStartDate || !HasValidEndDate)
                {
                    // Bar will appear as dash
                    this.Style["width"] = INVALID_DATE_WIDTH;
                }

                // Description will dock to keep text within bounds of chart
                string[] itemDockPositions = this.Left > 50 ? new string[] { "right", "left" } : new string[] { "left", "right" };
                itemLabelDescription.Style[itemDockPositions[0]] = INVALID_DATE_OFFSET;
                itemLabelDescription.Style["text-align"] = itemDockPositions[0];
                itemLabelDescription.Style[itemDockPositions[1]] = "auto";

                // Render Item Label
                if (ShowDescription)
                {
                    itemLabelDescription.RenderControl(writer);
                }
                // Render gant item contexts (remaining and completed containers)
                base.RenderContents(writer);
                // Render end html tag for item
                base.RenderEndTag(writer);
            }
        }

        /// <summary>
        /// Returns a paramitized function for calling javascript mouse events
        /// </summary>
        /// <returns></returns>
        private string GetMouseEventScript()
        {
            string formattedStart = startDate.ToShortDateString();
            string formattedEnd = endDate.ToShortDateString();
            string displayText = Page.Server.HtmlEncode("Start Date: " + formattedStart + " End Date: " + formattedEnd + " Percentage Complete: " + percentComplete + "%");
            string parameters = "(this,event,'" + formattedStart + "','" + formattedEnd + "','" + color + "','" + displayText + "');";
            return parameters;
        }

        /// <summary>
        /// Returns a hex color which will stand out against Item's color.
        /// Light color items will have light text, and dark colors will have light text.
        /// </summary>
        /// <param name="hexColor">original hex color</param>
        /// <returns>Light or Dark color which contrasts against item color</returns>
        private string DetermineInverseHexColor(string hexColor)
        {
            string inverseHex = hexColor;
            if (!string.IsNullOrEmpty(hexColor) && hexColor.Contains("#") && this.HasValidDates)
            {
                // Extract #
                String hexString = hexColor.Substring(1);
                // Determine the hex representation as an int and determine if 
                // is its a light (large 16-bit int) or dark color(small 16-bit int).
                int hexInt = int.Parse(hexString, System.Globalization.NumberStyles.HexNumber);
                if (hexInt < HEX_HALF_POINT) { inverseHex = HEX_LIGHT; }
                else { inverseHex = HEX_DARK; }
            }
            return inverseHex;
        }
    }

    /// <summary>
    /// Custom control builder class to ensure only GantItems can be child properties of a control.
    /// </summary>
    public class CustomGantBuilder : ControlBuilder
    {
        public override Type GetChildControlType(String tagName, IDictionary attributes)
        {
            if (tagName.Contains(typeof(GantItem).Name))
                return typeof(GantItem);

            else
            {
                throw new Exception("Tag \"" + tagName + "\" not allowed in this control.");
            }
        }

        public override void AppendLiteralString(string s)
        {
            // Ignores literals between rows.
        }

    }
}
