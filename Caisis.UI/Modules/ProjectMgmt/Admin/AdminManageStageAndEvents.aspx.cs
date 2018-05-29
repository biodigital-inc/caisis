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

using Caisis.BOL;
using Caisis.UI.Core.Classes;
using Caisis.UI.Core.Classes.CustomControls;
using System.Collections.Generic;
using Caisis.DataAccess;

namespace Caisis.UI.Modules.ProjectMgmt
{
    public partial class AdminManageStageAndEvents : ProjectMgmtBasePage
    {
        LookupCodeDa da = new LookupCodeDa();

        // Lists of parent lookupcodeid to child lookcodeids used to aviod multiple insert
        // and delete statements
        Dictionary<int, List<string>> codesToInsert = new Dictionary<int, List<string>>();
        Dictionary<int, List<string>> codesToRemove = new Dictionary<int, List<string>>();

        DataTable stageColorCodeAttributes;

        protected override void Page_Load(object sender, EventArgs e)
        {
            SetView();
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="e"></param>
        protected override void OnInit(EventArgs e)
        {
            base.OnInit(e);

            // Add event handlers for binding Lookup Code relationships
            CurrentProjectTypesRptr.ItemDataBound += GetRelationRptrBoundHandler(ProjectMgmtUtil.PROJECT_STAGE_TYPE_CODE);
            CurrentStagesRptr.ItemDataBound += GetRelationRptrBoundHandler(ProjectMgmtUtil.PROJECT_STAGE_EVENT_TYPE_CODE);
            CurStageEventsRptr.ItemDataBound += GetRelationRptrBoundHandler(ProjectMgmtUtil.PROJECT_EVENT_ATTRIBUTE_TYPE_CODE);
        }


        /// <summary>
        /// Sets the currnet view, edit lookup codes or edit relationships
        /// </summary>
        private void SetView()
        {
            if (!string.IsNullOrEmpty(Request.QueryString["back"]))
            {
                BackBtn.Visible = true;
                BackBtn.NavigateUrl = Request.QueryString["back"];
            }

            bool doEditRelationships = !string.IsNullOrEmpty(Request.QueryString["view"]) && Request.QueryString["view"] == "tree";
            if (doEditRelationships)
            {
                TreePanel.Visible = true;
                EditPanel.Visible = false;
            }
            else
            {
                TreePanel.Visible = false;
                EditPanel.Visible = true;
            }
            if (!Page.IsPostBack)
            {
                if (doEditRelationships)
                {
                    BuildCurrentTree();
                }
                else
                {
                    BuildStageStageEventsAndAttributes();
                }
            }
        }

        #region Edit Lookup Codes

        /// <summary>
        /// Bind lookup code columns/grids to their respecitve lookup codes
        /// </summary>
        private void BuildStageStageEventsAndAttributes()
        {

            SetColorAttributeId();

            string sortExpr = LookupCode.LkpOrder + " ASC";

            ProjectTypeGrid.DataSource = GetSortedGridDataSource("ProjectType");
            ProjectTypeGrid.DataBind();

            StagesGrid.DataSource = GetSortedGridDataSource("ProjectStages");
            StagesGrid.DataBind();

            EventsGrid.DataSource = GetSortedGridDataSource("ProjectStageEvents");
            EventsGrid.DataBind();

            AttributesGrid.DataSource = GetSortedGridDataSource("ProjectEventAttributes");
            AttributesGrid.DataBind();
        }

        /// <summary>
        /// Gets the datasoruce for the lookup code, with the Lookup order sorted
        /// </summary>
        /// <param name="lkpFieldName"></param>
        /// <returns></returns>
        private DataView GetSortedGridDataSource(string lkpFieldName)
        {
            DataTable dt = da.GetLookupsByFieldName(lkpFieldName).Tables[0];
            string sortHelperName = "_lookupSortHelper";
            DataColumn sortHelperCol = new DataColumn(sortHelperName);
            sortHelperCol.DefaultValue = 0;
            dt.Columns.Add(sortHelperCol);

            DataRow[] lkpOrderRows = dt.Select(LookupCode.LkpOrder + " IS NOT NULL");
            foreach (DataRow lkpOrderRow in lkpOrderRows)
            {
                lkpOrderRow[sortHelperCol] = 1;
            }

            string sortExpr = sortHelperName + " DESC, " + LookupCode.LkpOrder + " ASC";
            DataView gridDataSource = dt.DefaultView;
            gridDataSource.Sort = sortExpr;
            return gridDataSource;
        }

        /// <summary>
        /// Update lookup code record
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void HandleLookupUpdate(object sender, GridViewUpdateEventArgs e)
        {
            GridView lkpCodeGrid = sender as GridView;
            GridViewRow updateRow = lkpCodeGrid.Rows[e.RowIndex];
            // Fill dictionary from row controls
            CaisisGridView.ExtractCaisisInputValuesFromContainer(updateRow, e.NewValues);

            // Create a new biz for updating/inserting
            LookupCode biz = new LookupCode();
            // Determine if a lookupcodeid exists
            object lkpCodeIdKey = lkpCodeGrid.DataKeys[e.RowIndex][LookupCode.LookupCodeId];
            if (lkpCodeIdKey != null && !string.IsNullOrEmpty(lkpCodeIdKey.ToString()))
            {
                int lkpCodeId = int.Parse(lkpCodeIdKey.ToString());
                biz.Get(lkpCodeId);
            }
            else
            {
                return;
            }
            // Set the lkpcode extracted from textbox
            foreach (string col in e.NewValues.Keys)
            {
                //if (biz.HasColumn(col))
				if (biz.HasField(col))
                {
                    biz[col] = e.NewValues[col];
                }
            }

            biz.Save();

            // Notify the built-in update event to cancel/i.e., not bubble
            e.Cancel = true;
        }

        /// <summary>
        /// Adds a new lookup code record, footer. If adding stage lookup code, extract color value
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void AddLookupCode(object sender, EventArgs e)
        {
            CaisisTextBox lkpBox = sender as CaisisTextBox;
            if (lkpBox != null)
            {
                string lkpFieldName = lkpBox.FieldLabel;
                string lkpCode = lkpBox.Text;
                string lkpOrderServerId = lkpFieldName + LookupCode.LkpOrder;

                CaisisTextBox lkpOrderBox = lkpBox.NamingContainer.FindControl(lkpOrderServerId) as CaisisTextBox;
                string lkpOrder = lkpOrderBox.Value;
                if (!string.IsNullOrEmpty(lkpCode))
                {
                    int newLkpCodeId = AddLookupCodeValue(lkpFieldName, lkpCode, lkpOrder);
                    lkpBox.Value = string.Empty;
                    // Save a color atttibute for the new record for stage lookup code
                    if (lkpBox == StageLkpCode && !string.IsNullOrEmpty(ColorAttributeId.Value) && !string.IsNullOrEmpty(NewColorCode.Value))
                    {
                        LookupCodeAttribute colorAttributeValue = new LookupCodeAttribute();
                        colorAttributeValue[LookupCodeAttribute.LookupCodeId] = newLkpCodeId;
                        colorAttributeValue[LookupCodeAttribute.AttributeId] = ColorAttributeId.Value;
                        colorAttributeValue[LookupCodeAttribute.AttributeValue] = NewColorCode.Value;
                        colorAttributeValue[LookupCodeAttribute.AttributeSuppress] = 0;
                        colorAttributeValue.Save();
                        NewColorCode.Value = string.Empty;
                    }
                }
            }
        }

        /// <summary>
        /// Adds a new LkpCode value for a LkpFieldName
        /// </summary>
        /// <param name="lkpField"></param>
        /// <param name="lkpCode"></param>
        /// <returns></returns>
        private int AddLookupCodeValue(string lkpField, string lkpCode, string lkpOrder)
        {
            LookupCode biz = new LookupCode();
            biz[LookupCode.LkpFieldName] = lkpField;
            biz[LookupCode.LkpCode] = lkpCode;
            biz[LookupCode.LkpSuppress] = 0;
            biz[LookupCode.LkpOrder] = lkpOrder;
            biz.Save();
            return int.Parse(biz[biz.PrimaryKeyName].ToString());
        }

        /// <summary>
        /// Sets the color AttributeId used for updating attributes for setting colors with stages
        /// </summary>
        private void SetColorAttributeId()
        {
            if (!Page.IsPostBack)
            {
                LookupCodeDa da = new LookupCodeDa();
                DataView colorAttibutes = da.GetLookupAttributeByName("Color").DefaultView;
                if (colorAttibutes.Count > 0)
                {
                    int attId = int.Parse(colorAttibutes[0][LookupAttribute.AttributeId].ToString());
                    ColorAttributeId.Value = attId.ToString();
                    int attributeId = int.Parse(ColorAttributeId.Value);
                    stageColorCodeAttributes = da.GetLookupCodeAttributesByAttributeId(attributeId);
                }
            }
            else
            {
                int attributeId = int.Parse(ColorAttributeId.Value);
                stageColorCodeAttributes = da.GetLookupCodeAttributesByAttributeId(attributeId);
            }
        }

        /// <summary>
        /// When Stages Grid is bound, color boxes need to be set and colors assigned
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void SetColorBox(object sender, GridViewRowEventArgs e)
        {
            ExtendedGridView srcGrid = sender as ExtendedGridView;
            if (srcGrid == StagesGrid && e.Row.RowType == DataControlRowType.DataRow)
            {
                int lkpCodeId = int.Parse(StagesGrid.DataKeys[e.Row.RowIndex][LookupCode.LookupCodeId].ToString());

                HiddenField lkpCodeIdField = e.Row.FindControl("LookupCodeId") as HiddenField;
                lkpCodeIdField.Value = lkpCodeId.ToString();

                HiddenField colorCodeField = e.Row.FindControl("ColorCode") as HiddenField;
                HiddenField lookupCodeAttributeId = e.Row.FindControl("LookupCodeAttributeId") as HiddenField;
                Label colorBoxField = e.Row.FindControl("ColorCodeBox") as Label;
                // Show color picker when clicking on box and copy selected value to hidden field
                colorBoxField.Attributes["onclick"] = "showColorPicker('" + colorCodeField.ClientID + "',this,event);";

                if (stageColorCodeAttributes != null)
                {
                    DataRow[] attValues = stageColorCodeAttributes.Select("LookupCodeId = " + lkpCodeId);
                    if (attValues.Length > 0)
                    {
                        string colorCode = attValues[0][LookupCodeAttribute.AttributeValue].ToString();
                        lookupCodeAttributeId.Value = attValues[0][LookupCodeAttribute.LookupCodeAttributeId].ToString();
                        colorCodeField.Value = colorCode;
                        colorBoxField.Style[HtmlTextWriterStyle.BackgroundColor] = colorCode;
                    }
                }
            }
        }

        /// <summary>
        /// Updates the stage record when color code is changed
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void SaveStage(object sender, EventArgs e)
        {
            GridViewRow row = (sender as Control).NamingContainer as GridViewRow;
            if (row != null)
            {
                HiddenField colorCodeField = row.FindControl("ColorCode") as HiddenField;
                HiddenField lookupCodeAttributeId = row.FindControl("LookupCodeAttributeId") as HiddenField;
                HiddenField lkpCodeIdField = row.FindControl("LookupCodeId") as HiddenField;

                if (!string.IsNullOrEmpty(ColorAttributeId.Value) && !string.IsNullOrEmpty(colorCodeField.Value))
                {
                    LookupCodeAttribute biz = new LookupCodeAttribute();
                    if (!string.IsNullOrEmpty(lookupCodeAttributeId.Value))
                    {
                        biz.Get(int.Parse(lookupCodeAttributeId.Value));
                    }
                    biz[LookupCodeAttribute.LookupCodeId] = lkpCodeIdField.Value;
                    biz[LookupCodeAttribute.AttributeId] = ColorAttributeId.Value;
                    biz[LookupCodeAttribute.AttributeValue] = colorCodeField.Value;
                    biz[LookupCodeAttribute.AttributeSuppress] = 0;
                    biz.Save();
                    lookupCodeAttributeId.Value = biz[LookupCodeAttribute.LookupCodeAttributeId].ToString();
                }
            }
        }

        /// <summary>
        /// Update lookup codes for each lookup code grid
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void HandleUpdateLookupCodesClick(object sender, EventArgs e)
        {
            foreach (ExtendedGridView grid in new ExtendedGridView[] { ProjectTypeGrid, StagesGrid, EventsGrid, AttributesGrid })
            {
                foreach (int rowIndex in grid.DirtyRows)
                {
                    grid.UpdateRow(rowIndex, true);
                }
            }
            BuildStageStageEventsAndAttributes();
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void HandleLookupDeleteClick(object sender, CommandEventArgs e)
        {
            int lkpCodeId = int.Parse(e.CommandArgument.ToString());
            LookupCodeDa da = new LookupCodeDa();
            da.DeleteLookupCode(lkpCodeId);
            BuildStageStageEventsAndAttributes();
        }
        #endregion

        #region Edit Lookup Relationships

        /// <summary>
        /// Builds the current realtionship tree with top level lookup codes (parent codes) 
        /// </summary>
        private void BuildCurrentTree()
        {
            DataTable projectTypes = da.GetLookupsByFieldName("ProjectType").Tables[0];
            CurrentProjectTypesRptr.DataSource = projectTypes;
            CurrentProjectTypesRptr.DataBind();

            DataTable stageCodes = da.GetLookupsByFieldName("ProjectStages").Tables[0];
            CurrentStagesRptr.DataSource = stageCodes;
            CurrentStagesRptr.DataBind();

            DataTable stageEventCodes = da.GetLookupsByFieldName("ProjectStageEvents").Tables[0];
            CurStageEventsRptr.DataSource = stageEventCodes;
            CurStageEventsRptr.DataBind();
        }

        /// <summary>
        /// Returns a new RepeaterItemEventHandler which sets hidden lookup code ids
        /// as well as bind child checkboxes and check items in relationship
        /// </summary>
        /// <param name="lkpFieldName"></param>
        /// <returns></returns>
        private RepeaterItemEventHandler GetRelationRptrBoundHandler(string lkpFieldName)
        {
            RepeaterItemEventHandler itemBoundHandler = new RepeaterItemEventHandler(delegate(object sender, RepeaterItemEventArgs e)
            {
                string lkpId = DataBinder.Eval(e.Item.DataItem, LookupCode.LookupCodeId).ToString();
                int parLkpId = int.Parse(lkpId);

                HiddenField parLkpIdField = e.Item.FindControl("ParentLookupCodeId") as HiddenField;
                parLkpIdField.Value = lkpId;

                Repeater curItems = e.Item.FindControl("CurrentItemsRptr") as Repeater;
                DataTable rptrCodes = da.GetLookupsByFieldName(lkpFieldName).Tables[0];
                curItems.DataSource = rptrCodes;
                curItems.DataBind();

                DataTable childCodes = da.GetChildCodesByLookupIdAndChildLookupName(parLkpId, lkpFieldName);
                foreach (RepeaterItem item in curItems.Items)
                {
                    CheckBox childCheckBox = item.FindControl("CurrentItemCheckBox") as CheckBox;
                    HiddenField childLkpIdField = item.FindControl("LookupCodeId") as HiddenField;
                    if (!string.IsNullOrEmpty(childLkpIdField.Value))
                    {
                        // See if this item (child lookupcodeid) is in childCode list
                        // and determine if item should be checked
                        string sqlFindChildCode = "ParentCodeId = " + lkpId + " AND ChildCodeId = " + childLkpIdField.Value;
                        if (childCodes.Select(sqlFindChildCode).Length > 0)
                        {
                            childCheckBox.Checked = true;
                        }
                    }
                }
            });

            return itemBoundHandler;
        }

        /// <summary>
        /// Set LkpCode for label in realation tree
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void SetLkpCodeNames(object sender, RepeaterItemEventArgs e)
        {
            string lkpCode = DataBinder.Eval(e.Item.DataItem, LookupCode.LkpCode).ToString();
            string lkpCodeId = DataBinder.Eval(e.Item.DataItem, LookupCode.LookupCodeId).ToString();

            HiddenField lkpCodeField = e.Item.FindControl("LookupCodeId") as HiddenField;
            lkpCodeField.Value = lkpCodeId.ToString();

            CheckBox curItem = e.Item.FindControl("CurrentItemCheckBox") as CheckBox;
            curItem.Text = lkpCode;
            curItem.ToolTip = lkpCode;
        }

        /// <summary>
        /// Update the lookup relationships. Keys will be added to respecitve lists to have 1 udpate
        /// for inserition and 1 for deltion of relationships
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void SaveRelationships(object sender, EventArgs e)
        {
            foreach (int parLkpId in codesToInsert.Keys)
            {
                string[] childLkpIds = codesToInsert[parLkpId].ToArray();
                da.InsertChildCodes(parLkpId, childLkpIds);
            }
            foreach (int parLkpId in codesToRemove.Keys)
            {
                string[] childLkpIds = codesToRemove[parLkpId].ToArray();
                da.RemoveChildCodes(parLkpId, childLkpIds);
            }
            codesToInsert.Clear();
            codesToRemove.Clear();
        }

        /// <summary>
        /// Signaled by checkbox in realtion tree. Add lookupcodeid to be added or deleted based on parent lookupcodeid.
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void UpdateLookupRelationship(object sender, EventArgs e)
        {
            CheckBox lkpCheckBox = sender as CheckBox;
            HiddenField lkpIdField = lkpCheckBox.NamingContainer.FindControl("LookupCodeId") as HiddenField;
            HiddenField parentLkpIdField = lkpCheckBox.NamingContainer.NamingContainer.NamingContainer.FindControl("ParentLookupCodeId") as HiddenField;

            string lkpCodeId = lkpIdField.Value;
            int parLkpCodeId = int.Parse(parentLkpIdField.Value);

            Dictionary<int, List<string>> updateDeleteHash = lkpCheckBox.Checked ? codesToInsert : codesToRemove;

            if (!string.IsNullOrEmpty(lkpCodeId))
            {
                if (updateDeleteHash.ContainsKey(parLkpCodeId))
                {
                    updateDeleteHash[parLkpCodeId].Add(lkpCodeId);
                }
                else
                {
                    List<string> lkpCodeIdList = new List<string>();
                    lkpCodeIdList.Add(lkpCodeId);
                    updateDeleteHash.Add(parLkpCodeId, lkpCodeIdList);
                }
            }
        }
        #endregion
    }
}