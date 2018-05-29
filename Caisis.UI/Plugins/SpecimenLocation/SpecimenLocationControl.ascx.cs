using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Collections.Generic;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

using Caisis.DataAccess;
using Caisis.BOL;
using Caisis.UI.Core.Classes;
using Caisis.UI.Core.Classes.CustomControls;

namespace Caisis.UI.Plugins.SpecimenLocation
{
    public partial class SpecimenLocationControl : CaisisPlugin
    {

        private List<TextBox> controlsToRender = new List<TextBox>();
        private Dictionary<string, PositionBizHelper> boxIdsToPositionBizHelper = new Dictionary<string, PositionBizHelper>();
        private bool dynamicRender = false;
        private GridView specimensGrid;

        #region REQUIRED ICaisisPlugin Members

        public override Caisis.PluginFramework.PluginType Type
        {
            get { throw new Exception("The method or operation is not implemented."); }
        }

        public override string Name
        {
            get { throw new Exception("The method or operation is not implemented."); }
        }

        public override string ControlIdToModify
        {
            get { throw new Exception("The method or operation is not implemented."); }
        }

        #endregion

        /// <summary>
        /// Gets or sets if the picker image is rendered dynamically (such as in a grid), or is rendered in place
        /// </summary>
        public bool DynamicRender
        {
            get
            {
                return dynamicRender;
            }
            set
            {
                dynamicRender = value;
            }

        }

        /// <summary>
        /// During page load, determine if picker logic needs to embedded withing a GridView
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void Page_Load(object sender, EventArgs e)
        {
            if (specimensGrid == null && dynamicRender)
            {
                specimensGrid = LocateGridOnPage(Page);
                if (specimensGrid == null)
                {
                    return;
                }

                // Add Event Handler to help track dirty rows
                specimensGrid.DataBound += new EventHandler(WireSpecimenTrackerTextBoxes);

                // Extra event handlers to fire update events and ui events
                specimensGrid.RowUpdating += new GridViewUpdateEventHandler(SpecimenGridRowUpdating);
                specimensGrid.RowDeleted += new GridViewDeletedEventHandler(SpecimenGridRowDeleted);

                // During grid pre-render, controls are finalized with clientids and viewstate available
                specimensGrid.PreRender += new EventHandler(LocateAndWireReferencedControls);
            }
        }

        protected override void Render(HtmlTextWriter writer)
        {
            if (DynamicRender)
            {
                SpecimenLocationImg.Visible = false;
            }
            foreach (TextBox txtBox in controlsToRender)
            {
                txtBox.RenderControl(writer);
            }
            base.Render(writer);
        }

        #region GridView EVENT HANDLER

        /// <summary>
        /// Dynamically adds hidden fields to the grid to keep track of which rows becomes dirty
        /// when normal grid dirty functionality isn't triggered
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void WireSpecimenTrackerTextBoxes(object sender, EventArgs e)
        {
            GridView myGrid = sender as GridView;

            // Get SpecimenAccessionId and register Array of Specimens with child Speicmens
            if (myGrid.DataKeys.Count > 0)
            {
                // Get SpecimenAccessionId from first row, since all rows share SpecimenAccessionId
                object specAccKey = myGrid.DataKeys[0][Specimen.SpecimenAccessionId];
                if (specAccKey != null && !string.IsNullOrEmpty(specAccKey.ToString()))
                {
                    int specAccId = int.Parse(specAccKey.ToString());
                    SpecimenManagerDa da = new SpecimenManagerDa();
                    DataTable dt = da.GetSpecimenshavingChilds(specAccId);
                    List<string> specIds = new List<string>();
                    foreach (DataRow row in dt.Rows)
                    {
                        string specIdWithChildren = row[Specimen.ParentSpecimenId].ToString();
                        if (!string.IsNullOrEmpty(specIdWithChildren))
                        {
                            specIds.Add(specIdWithChildren);
                        }
                    }
                    //Array of all specimenIds of specimens having children, create safe js array, insetad of new Array();
                    string jsArray = "var SpecimensWithChildren = [" + string.Join(",", specIds.ToArray()) + "];";

                    Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "SpecimensWithChildren", jsArray, true);
                }
            }

            foreach (GridViewRow row in myGrid.Rows)
            {
                List<ICaisisInputControl> cicList = PageUtil.GetCaisisInputControlsInContainer(row);
                foreach (ICaisisInputControl iCIC in cicList)
                {
                    if (iCIC.Field == SpecimenPosition.BoxId)
                    {
                        HiddenField tracker = new HiddenField();
                        tracker.ValueChanged += GetRecordUpdatingHandler(myGrid);
                        // Tracker ID is determined by Ref BoxId field
                        tracker.ID = (iCIC as Control).ID + "Tracker";
                        row.Cells[0].Controls.Add(tracker);
                    }
                }
            }
        }


        /// <summary>
        /// Returns an EventHandler which updates a GridRow based on the hidden field's row
        /// </summary>
        /// <param name="grid"></param>
        /// <returns></returns>
        protected EventHandler GetRecordUpdatingHandler(GridView grid)
        {
            // Create a closure
            return delegate(object sender, EventArgs args)
            {
                GridView updatingGrid = grid;

                // Determine row which triggered save
                int updatingRowIndex = ((sender as HiddenField).NamingContainer as GridViewRow).RowIndex;
                ICaisisGridView iGrid = grid as ICaisisGridView;
                if (iGrid != null)
                {
                    // Add to grid's dirty rows to be updated
                    if (!iGrid.DirtyRows.Contains(updatingRowIndex))
                    {
                        iGrid.DirtyRows.Add(updatingRowIndex);
                    }
                }
            };
        }

        /// <summary>
        /// Deletes SpecimenBox and SpecimenPosition records when deleting a specimen
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void SpecimenGridRowDeleted(object sender, GridViewDeletedEventArgs e)
        {
            string positionId = e.Values[Specimen.PositionId].ToString();
            // Check for existnce of position id in deleted record
            if (!string.IsNullOrEmpty(positionId))
            {
                SpecimenPosition biz = new SpecimenPosition();
                biz.Delete(int.Parse(positionId));
            }
        }

        /// <summary>
        /// Creates controls for placing the Position and Box name in a grid.
        /// In addition, the rows positionid and boxid are tracked in the viewstate to trigger SpecimenPosition records updates/deletes.
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void LocateAndWireReferencedControls(object sender, EventArgs e)
        {

            if (specimensGrid != null)
            {
                List<ICaisisInputControl> tmpKeys = new List<ICaisisInputControl>();

                string jsArray = "";
                foreach (GridViewRow row in specimensGrid.Rows)
                {
                    int rowIndex = row.RowIndex;
                    string specimenId = specimensGrid.DataKeyNames[0] == Specimen.SpecimenId ? specimensGrid.DataKeys[0].Value.ToString() : string.Empty;

                    ICaisisInputControl boxId = PageUtil.DeepFindICaisisInputControl(row, Specimen.BoxId);
                    ICaisisInputControl positionId = PageUtil.DeepFindICaisisInputControl(row, SpecimenPosition.PositionId);
                    string uniqueClientKey = (boxId as Control).UniqueID;

                    TextBox boxName = new TextBox();
                    boxName.ID = uniqueClientKey + "RefBoxName";
                    boxName.Style.Add(HtmlTextWriterStyle.Display, "none");
                    controlsToRender.Add(boxName);

                    TextBox positionName = new TextBox();
                    positionName.ID = uniqueClientKey + "RefPositionName";
                    positionName.Style.Add(HtmlTextWriterStyle.Display, "none");
                    controlsToRender.Add(positionName);

                    // Set Box Name and Position Name based off of records
                    if (!string.IsNullOrEmpty(boxId.Value))
                    {
                        SpecimenBox box = new SpecimenBox();
                        box.Get(int.Parse(boxId.Value));
                        boxName.Text = box[SpecimenBox.BoxName].ToString();
                        if (Page.IsPostBack)
                        {
                            if (!string.IsNullOrEmpty(positionId.Value))
                            {
                                SpecimenPosition pos = new SpecimenPosition();
                                pos.Get(int.Parse(positionId.Value));
                                positionName.Text = pos[SpecimenPosition.Position].ToString();
                            }
                            else if (this.ViewState["SpecimenId$" + rowIndex] != null)
                            {
                                string posName = Request.Form[(this.ViewState["SpecimenId$" + rowIndex] as string[])[3]];
                                positionName.Text = posName;
                            }
                        }
                        else if (!string.IsNullOrEmpty(positionId.Value))
                        {
                            SpecimenPosition pos = new SpecimenPosition();
                            pos.Get(int.Parse(positionId.Value));
                            positionName.Text = pos[SpecimenPosition.Position].ToString();
                        }
                    }

                    SpecimenFormHelper helper = new SpecimenFormHelper(rowIndex.ToString(), specimenId, boxId as Control, positionId as Control, boxName as Control, positionName as Control);
                    jsArray += helper.ClientIdsJavaScriptArray + ",";

                    string key = helper.AccessKey;
                    string[] val = helper.FormArray;
                    this.ViewState.Add(key, val);
                }

                // Register ClientIds Array to page, where populating is handled via JavaScript
                jsArray = jsArray.TrimEnd(",".ToCharArray());
                Page.ClientScript.RegisterArrayDeclaration("SpecimenLocationRefList", jsArray);
                string disableControls = (!specimensGrid.Enabled).ToString().ToLower();
                Page.ClientScript.RegisterClientScriptBlock(typeof(Page), "DisabledPickerControls", "var disablePickerControls = " + disableControls + ";", true);
            }
        }

        /// <summary>
        /// Handle the row updating event, by updating the position Id for this Specimen Record
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void SpecimenGridRowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            object boxId = e.NewValues[Specimen.BoxId];
            object positionId = e.NewValues[Specimen.PositionId];
            object specimenId = e.Keys[Specimen.SpecimenId];
            if (boxId != null)
            {
                string specimenIdKey = specimenId.ToString();
                string boxIdKey = boxId.ToString();
                string positionIdKey = positionId.ToString();
                string accessKey = SpecimenFormHelper.GetAccessKey(e.RowIndex.ToString(), specimenIdKey);

                // Cannot insert record without an int BoxId (parent key)
                if (this.ViewState[accessKey] != null && !string.IsNullOrEmpty(boxIdKey))
                {
                    string[] a = this.ViewState[accessKey] as string[];
                    string boxName = Request.Form[a[2]];
                    string positionName = Request.Form[a[3]];

                    if (!string.IsNullOrEmpty(boxName))
                    {
                        //checking for Position in order to add/update the Specimens with or without selection of Positions
                        if (!string.IsNullOrEmpty(positionName))
                        {
                            PositionBizHelper helper = new PositionBizHelper(boxIdKey, positionIdKey, positionName);
                            e.NewValues[Specimen.PositionId] = helper.SaveRecord();
                        }
                        else
                        {
                            e.NewValues[Specimen.PositionId] = string.Empty;
                        }
                    }
                    else
                    {
                        e.NewValues[Specimen.BoxId] = string.Empty;
                        e.NewValues[Specimen.PositionId] = string.Empty;
                    }

                }
            }
        }

        #endregion

        /// <summary>
        /// Returns the first instance of a CaisisGridView on the page
        /// </summary>
        /// <param name="container"></param>
        /// <returns></returns>
        private GridView LocateGridOnPage(Control container)
        {
            GridView rVal = null;
            foreach (Control con in container.Controls)
            {
                if (con is GridView)
                {
                    rVal = con as GridView;
                }
                else if (con.HasControls())
                {
                    rVal = LocateGridOnPage(con);
                }
                if (rVal != null)
                {
                    return rVal;
                }
            }
            return rVal;
        }

        /// <summary>
        /// Helper class for updating SpecimenPosition records
        /// </summary>
        protected internal class PositionBizHelper
        {
            private string bId, pId;
            private string pName;

            public PositionBizHelper(string boxId, string positionId, string positionName)
            {
                bId = boxId;
                pId = positionId;
                pName = positionName;
            }

            public string SaveRecord()
            {
                SpecimenPosition biz = new SpecimenPosition();

                if (!string.IsNullOrEmpty(pId))
                {
                    biz.Get(int.Parse(pId));
                }

                biz[SpecimenPosition.BoxId] = bId;
                biz[SpecimenPosition.Position] = pName;
                biz[SpecimenPosition.PositionStatus] = "Filled";

                biz.Save();

                string posIdOnSaveInsert = biz[SpecimenPosition.PositionId].ToString();
                return posIdOnSaveInsert;
            }
        }

        /// <summary>
        /// A Helper class which returns the ClientIds and FormKeys for our Speicmen Controls
        /// </summary>
        protected internal class SpecimenFormHelper
        {
            private string accessKey;


            // Client Ids
            private string boxIdClientId;
            private string positionIdClientId;
            private string boxNameClientId;
            private string positionNameClientId;

            // Keys
            private string boxIdFormKey;
            private string positionIdFormKey;
            private string boxNameFormKey;
            private string positionNameFormKey;

            string[] formArray = new string[4];
            string[] clientIdsArray = new string[4];

            public string AccessKey
            {
                get
                {
                    return accessKey;
                }
            }

            #region Client ID Properties

            public string BoxIdClientId
            {
                get
                {
                    return boxIdClientId;
                }
            }
            public string PositionIdClientId
            {
                get
                {
                    return positionIdClientId;
                }
            }
            public string BoxNameClientId
            {
                get
                {
                    return boxNameClientId;
                }
            }
            public string PositionNameClientId
            {
                get
                {
                    return positionNameClientId;
                }
            }
            #endregion

            #region Form Key Properties
            public string BoxIdFormKey
            {
                get
                {
                    return boxIdFormKey;
                }
            }

            public string PositionIdFormKey
            {
                get
                {
                    return positionIdFormKey;
                }
            }

            public string BoxNameFormKey
            {
                get
                {
                    return boxNameFormKey;
                }
            }
            public string PositionNameFormKey
            {
                get
                {
                    return positionNameFormKey;
                }
            }

            public string[] FormArray
            {
                get
                {
                    return formArray;
                }
            }

            public string[] ClientIdsArray
            {
                get
                {
                    return clientIdsArray;
                }
            }

            public string ClientIdsJavaScriptArray
            {
                get
                {
                    return "['" + clientIdsArray[0] + "','" + clientIdsArray[1] + "','" + clientIdsArray[2] + "','" + clientIdsArray[3] + "']";
                }
            }

            #endregion

            public SpecimenFormHelper(string rowIndex, string specimenId, Control boxId, Control positionId, Control boxName, Control positionName)
            {
                this.accessKey = GetAccessKey(rowIndex, specimenId);

                this.boxIdClientId = boxId.ClientID;
                this.positionIdClientId = positionId.UniqueID;
                this.boxNameClientId = boxName.ClientID;
                this.positionNameClientId = positionName.ClientID;

                this.clientIdsArray = new string[] { this.boxIdClientId, this.positionIdClientId, this.boxNameClientId, this.positionNameClientId };

                this.boxIdFormKey = boxId.UniqueID;
                this.positionIdFormKey = positionId.UniqueID;
                this.boxNameFormKey = boxName.UniqueID;
                this.positionNameFormKey = positionName.UniqueID;

                this.formArray = new string[] { this.boxIdFormKey, this.positionIdFormKey, this.boxNameFormKey, this.positionNameFormKey };
            }

            public static string GetAccessKey(string rowIndex, string specimenId)
            {
                string _key = Specimen.SpecimenId + "$" + rowIndex;// + "$" + specimenId;
                return _key;
            }
        }

    }
}

