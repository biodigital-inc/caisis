using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;

using Caisis.DataAccess;
using Caisis.BOL;
using Caisis.Extensions;
using Caisis.UI.Core.Classes;
using Caisis.UI.Core.Classes.CustomControls;
using Caisis.Controller;

namespace Caisis.UI.Core.DataEntry
{
    public partial class ColumnDataEntry : BasePatientDataControl
    {
        private bool showMetadataTooltip = false;

        private Dictionary<int, List<ICaisisInputControl>> columnsToContorols = new Dictionary<int, List<ICaisisInputControl>>();

        /// <summary>
        /// Event called after input control loaded into column
        /// </summary>
        public event CaisisEventHandler BuildControl;

        private EventArgs EMPTY_EVENT_ARGS = new EventArgs();

        /// <summary>
        /// Gets or sets the action used to set the input control's custom display icon
        /// </summary>
        public Action<ICaisisInputControl, Image> SetControlIcon;


        public ColumnDataEntry()
            : base()
        {
            this.BuildControl += FixListControlLayout;
        }

        private void FixListControlLayout(ICaisisInputControl sender, EventArgs e)
        {
            if (sender is CheckBoxList)
            {
                sender.PreRender += SetListControlLayout;
            }
        }

        private void SetListControlLayout(ICaisisInputControl sender, EventArgs e)
        {
            CheckBoxList cbl = sender as CheckBoxList;
            int count = cbl.Items.Count;
            int columns = Math.Min(3, Math.Max(1, count / 10));
            cbl.RepeatColumns = columns;
        }

        /// <summary>
        /// Builds a list of input controls based on table metadata
        /// </summary>
        /// <param name="table"></param>
        /// <param name="columnCount"></param>
        public virtual void BuildLayout(string table, int columnCount)
        {
            var inputControls = CICHelper.GetCaisisInputControlsByTableName(table);
            BuildLayout(inputControls, columnCount, new string[0]);
        }

        /// <summary>
        /// Builds a column layout with the specified list of controls into n columns.
        /// </summary>
        /// <param name="cicList">The list of input controls</param>
        /// <param name="columnCount">The number of columns to split controls into (remained on first)</param>
        /// <param name="commonDataElements">A list of fields which are common data elements</param>
        public virtual void BuildLayout(IEnumerable<ICaisisInputControl> cicList, int columnCount, IEnumerable<string> commonDataElements)
        {
            int controlCount = cicList.Count();
            // validate has controls
            if (controlCount > 0)
            {
                // create n columns (index: 0 to n-1)
                var columns = Enumerable.Range(0, columnCount);
                // i.e., 23/3 = 7
                int interval = controlCount / columnCount;
                // i.e., 23%3 = 2
                int remainder = interval != 0 ? controlCount % interval : 0;
                // build a lookup of column index to input controls
                var lookup = from colIndex in columns
                             let isFirst = colIndex == 0
                             // starting counting from colindex * interval, i.e., 1/11 -> 11  
                             let skip = colIndex * interval + (!isFirst ? remainder : 0)
                             let take = interval + (isFirst ? remainder : 0)
                             let columnControls = cicList.Skip(skip).Take(take)
                             orderby colIndex ascending
                             select new
                             {
                                 ColIndex = colIndex,
                                 Controls = columnControls
                             };

                // internal build layout
                BuildLayout(lookup.ToDictionary(k => k.ColIndex, v => new List<ICaisisInputControl>(v.Controls)), commonDataElements);
            }
        }

        /// <summary>
        /// Build list of input controls by column
        /// </summary>
        /// <param name="controlMap"></param>
        /// <param name="commonDataElements">A list of fields which are common data elements</param>
        protected virtual void BuildLayout(Dictionary<int, List<ICaisisInputControl>> controlMap, IEnumerable<string> commonDataElements)
        {
            columnsToContorols = controlMap;
            bool checkCDE = commonDataElements.Count() > 0;
            // BUILD CONTORLS INLINE
            bool isSingleColumn = controlMap.Count() == 1;
            foreach (var entry in controlMap)
            {
                int colIndex = entry.Key;
                int colNumber = colIndex + 1;
                var inputControls = entry.Value;
                Panel columnPanel = new Panel();
                columnPanel.CssClass = "EditDataEntryForm_Column" + colNumber;
                // SPECIAL CASE: adjust single col layout
                if (isSingleColumn)
                {
                    columnPanel.CssClass = columnPanel.CssClass + " EditDataEntryForm_ColumnSingle";
                }
                // add column to main control
                ColumnsAndControls.Controls.Add(columnPanel);
                // add controls to columns
                foreach (var inputControl in inputControls)
                {
                    // create row container
                    Control control = inputControl as Control;
                    Panel inputContainer = new Panel();
                    inputContainer.CssClass = "EditDataEntryField_Container";
                    // create external label for input controls
                    HtmlGenericControl inputLabel = new HtmlGenericControl("label");
                    inputLabel.Attributes["class"] = "EditDataEntryField_Label";
                    Image inputIcon = new Image();
                    inputIcon.ImageUrl = "~/Images/shim.gif";
                    inputIcon.CssClass = "EditDataEntryField_icon_standard";
                    // set late bound associated id
                    inputControl.ShowLabel = false;
                    //inputLabel.InnerText = !string.IsNullOrEmpty(inputControl.FieldLabel) ? inputControl.FieldLabel : "&nbsp;";
                    inputControl.PreRender += (iInputControl, e) =>
                    {
                        Control iControl = iInputControl as Control;
                        // supress built in label and set external label
                        if (iControl is CaisisHidden)
                        {
                            inputLabel.InnerHtml = "&nbsp;";
                        }
                        else
                        {
                            // set table
                            inputLabel.InnerHtml = !string.IsNullOrEmpty(iInputControl.FieldLabel) ? iInputControl.FieldLabel : iInputControl.Field;
                            // set associated for
                            inputLabel.Attributes["for"] = iControl.ClientID;
                        }
                        // set label css on required fields
                        if (iInputControl.Required)
                        {
                            inputLabel.Attributes["class"] = "requiredField";
                        }

                        // set common data element
                        if (checkCDE && commonDataElements.Contains(iInputControl.Field))
                        {
                            inputContainer.CssClass = "EditDataEntryField_Container EditDataEntryField_Common";
                        }

                        // set metadata tooltips
                        //inputLabel.ToolTip = iControl.HelpDescription;
                        // get client args for tooltip events
                        string clientArgs = string.Join(",", new string[] { "'" + PageUtil.EscapeSingleQuotes(iInputControl.HelpDescription) + "'", "this", "'" + iInputControl.Table + "'", "'" + iInputControl.Field + "'", "event" });
                        // get tooltip script for standard tooltip and metadata tooltips
                        string tooltipScriptOn = "if(window.showToolTipMessage) { showToolTipMessage(" + clientArgs + "); }";
                        string tooltipScriptOff = "if(window.hideToolTip) { hideToolTip(" + clientArgs + "); }";

                        string metaTooltipSciptOn = "if(window.showMetadataTooltip) { showMetadataTooltip(" + clientArgs + "); }";
                        string metaTooltipSciptOff = "if(window.hideMetadataTooltip) { hideMetadataTooltip(" + clientArgs + "); }";

                        // view metadata on field row
                        inputContainer.Attributes["onclick"] = metaTooltipSciptOn;
 //                       inputContainer.Attributes["onmouseout"] = metaTooltipSciptOff;

                        // view tooltip on field label
                        inputLabel.Attributes["onmouseover"] = tooltipScriptOn;
                        inputLabel.Attributes["onmouseout"] = tooltipScriptOff;
                    };

                    // UI fixese
                    if (inputControl is CaisisHidden)
                    {
                        (inputControl as CaisisHidden).ShowSpacer = false;
                    }
                    // add controls to container
                    inputContainer.Controls.Add(inputIcon);
                    inputContainer.Controls.Add(inputLabel);
                    inputContainer.Controls.Add(control);
                    columnPanel.Controls.Add(inputContainer);

                    // dispatch events

                    // set icon (if applicable)
                    if (SetControlIcon != null)
                    {
                        SetControlIcon(inputControl, inputIcon);
                    }

                    // dispatch build event
                    OnBuildControl(inputControl);
                }
            }
        }

        /// <summary>
        /// Returns a list of all ICaisisInputControls contained in this control
        /// </summary>
        /// <returns></returns>
        public virtual IEnumerable<ICaisisInputControl> GetInputControls()
        {
            return columnsToContorols.SelectMany(col => col.Value);
        }

        /// <summary>
        /// Returns a list of columns with input controls
        /// </summary>
        /// <returns></returns>
        public virtual Dictionary<int, List<ICaisisInputControl>> GetInputControlsMap()
        {
            return columnsToContorols.ToDictionary(col => col.Key, col => col.Value);
        }

        /// <summary>
        /// Raises the build control events, signaling an input control has been built
        /// </summary>
        /// <param name="iCIC"></param>
        protected void OnBuildControl(ICaisisInputControl iCIC)
        {
            if (BuildControl != null)
            {
                BuildControl(iCIC, EMPTY_EVENT_ARGS);
            }
        }
    }
}