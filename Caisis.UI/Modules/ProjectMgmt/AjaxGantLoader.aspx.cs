using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

using Caisis.UI.Core.Classes;
using Caisis.BOL;
using Caisis.DataAccess;

namespace Caisis.UI.Modules.ProjectMgmt
{
    public partial class AjaxGantLoader : System.Web.UI.Page
    {

        protected int projectId;
        protected string loadFromParent = "false";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(Request.QueryString["tableName"]) && !string.IsNullOrEmpty(Request.QueryString["priKey"]) && !string.IsNullOrEmpty(Request.QueryString["projectId"]))
            {
                string tableName = Request.QueryString["tableName"];
                int priKey = int.Parse(Request.QueryString["priKey"]);
                projectId = int.Parse(Request.QueryString["projectId"]);
                string color = Request.QueryString["color"];

                // Determine if child gant charts are loaded from parent page function
                if (!string.IsNullOrEmpty(Request.QueryString["loadFromParent"]))
                {
                    loadFromParent = Request.QueryString["loadFromParent"];
                    DynamicGantChart.MarkerCount = 18;
                }

                // Determine if a color is used for gant coloring
                // Else the color box needs to be supressed
                if (!string.IsNullOrEmpty(color))
                {
                    DynamicGantChart.StaticColor = color;
                    GantColorBox.Style["background-color"] = color;
                }
                else
                {
                    GantColorBoxColumn.Visible = false;
                }

                // Determine what type of chart needs to be built
                if (tableName.Equals("Project"))
                {
                    ProjectMgmtUtil.BuildAdminLevelGantChart(DynamicGantChart, projectId);
                    GantTitle.Text = DynamicGantChart.GantTitle;
                }

                else if (tableName.Equals("ProjectOrganization"))
                {
                    ProjectMgmtUtil.BuildOrganizationLevelGantChart(DynamicGantChart, projectId, priKey);
                    GantTitle.Text = DynamicGantChart.GantTitle;
                }
                else if (tableName.Equals("ProjectStage"))
                {
                    ProjectMgmtUtil.BuildStageLevelGantChart(DynamicGantChart, priKey);
                    GantTitle.Text = DynamicGantChart.GantTitle;
                }
            }
        }

        /// <summary>
        /// Sets the labels for each item on the chart
        /// </summary>
        private void CreateLabels()
        {
            // Clear all items in label container to prepare for current gant items
            LabelsContainer.Controls.Clear();

            // Set padding to align labels with chart items
            int paddingTop = DynamicGantChart.HeaderHeight + GantItem.ITEM_HEIGHT;
            LabelsContainer.Style["padding-top"] = paddingTop + "px";

            // Loop through each item and get description and create label
            foreach (GantItem item in DynamicGantChart.GantItems)
            {
                // Items with both dates invalid are not shown on interface
                if (!item.HasInvalidDates)
                {
                    // Creat a new label with the description of the gant item
                    Label gantItemLabel = new Label();
                    gantItemLabel.CssClass = "GantItemLabel";
                    gantItemLabel.Text = item.Description;
                    gantItemLabel.ToolTip = item.ToolTip;
                    LabelsContainer.Controls.Add(gantItemLabel);
                }
            }
        }

        /// <summary>
        /// During rendering, labels will be inserted dynamically to match gant items
        /// </summary>
        /// <param name="writer"></param>
        protected override void Render(HtmlTextWriter writer)
        {
            CreateLabels();
            base.Render(writer);
        }
    }
}