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
using System.Collections.Generic;
using Caisis.UI.Core.Classes.CustomControls;
using Caisis.DataAccess;
using Caisis.BOL;
using System.Collections.Specialized;

namespace Caisis.UI.Modules.ProtocolMgmt
{
    public partial class AdminSchemaItemTables : ProtocolMgmtBaseAdminPage
    {
        protected string ParentTable
        {
            get
            {
                string parentTable = Request["parentTable"];
                if (!String.IsNullOrEmpty(parentTable))
                    return parentTable;

                return String.Empty;
            }
        }

		//protected string ChildTables
		//{
		//    get
		//    {
		//        string childTables = Request["childTables"];
		//        if (!String.IsNullOrEmpty(childTables))
		//            return childTables;

		//        return String.Empty;
		//    }
		//}

		private IEnumerable<KeyValuePair<string, bool>> ChildTableSequence
		{
			get
			{
				string childTables = Request["childTables"];

				if (childTables == null)
					yield break;

				foreach (string token in childTables.Split(','))
				{
					string[] pair = token.Split('.');

					yield return new KeyValuePair<string, bool>(pair[0], pair[1] == "True");
				}
			}
		}

        protected string ItemName
        {
            get
            {
                string itemName = Request["itemName"];
                if (!String.IsNullOrEmpty(itemName))
                    return itemName;

                return String.Empty;
            }
        }

        protected string ParentTableLayout
        {
            get
            {
                string parentTableLayout = Request["parentTableLayout"];
                if (!String.IsNullOrEmpty(parentTableLayout))
                    return parentTableLayout;

                return String.Empty;
            }
        }

		private bool ParentTableIsGrid
		{
			get
			{
				return "True" == (Request["parentIsGrid"] ?? "");
			}
		}

        protected int SchemaItemId
        {
            get
            {
                string schemaItemId = Request["scitid"];

                if (!String.IsNullOrEmpty(schemaItemId))
                {
                    int scitid = -1;

                    if (Int32.TryParse(schemaItemId, out scitid))
                    {
                        return scitid;
                    }
                }

                return -1;
            }
        }

        protected int ProtocolVersionId
        {
            get
            {
                string protocolVersionId = Request["prvr"];

                if (!String.IsNullOrEmpty(protocolVersionId))
                {
                    int prvr = -1;

                    if (Int32.TryParse(protocolVersionId, out prvr))
                    {
                        return prvr;
                    }
                }

                return -1;
            }
        }

        protected bool CreateFromTemplate
        {
            get
            {
                string createFromTemplate = Request["createFromTemplate"];

                if (!String.IsNullOrEmpty(createFromTemplate))
                {
                    bool bCreateFromTemplate = false;

                    if (Boolean.TryParse(createFromTemplate, out bCreateFromTemplate))
                    {
                        return bCreateFromTemplate;
                    }
                }

                return false;
            }
        }

        private ProtocolMgmtBaseShemaItemControl parentList;
        Dictionary<string, ProtocolMgmtBaseShemaItemControl> dictChildTables = new Dictionary<string,ProtocolMgmtBaseShemaItemControl> ();

        protected override void Page_Load(object sender, EventArgs e)
        {
            base.Page_Load(sender, e);

            base.EnableViewState = true;
			bool parentIsGrid = ParentTableIsGrid;

            if (!string.IsNullOrEmpty(ParentTable))
            {
                AddParentTableToPage(parentIsGrid);
            }

			if (!parentIsGrid)
			{
				AddChildTables(ChildTableSequence);
			}

            SetButtonState();

            if (!IsPostBack)
                SetTemplateCB();
        }

        protected void SetTemplateCB()
        {
            SchemaItem item = new SchemaItem();
            item.Get(SchemaItemId);

            if (Boolean.TrueString.ToLower().Equals(item[SchemaItem.ItemIsTemplate].ToString().ToLower()))
            {
                if (!CreateFromTemplate)
                    TemplateCheckBox.Checked = true;
            }
            else
                TemplateCheckBox.Checked = false;
        }

        /// <summary>
        /// Add Parent Table to the Page
        /// </summary>
        /// <param name="protocolSchemaId"></param>
        /// <returns></returns>
        protected void AddParentTableToPage(bool parentIsGrid)
        {
            string ControlToLoad;

            if (parentIsGrid)
                ControlToLoad = "AdminSchemaItemChildTableGrid.ascx";
            else
                ControlToLoad = "AdminSchemaItemList.ascx";

            parentList = (ProtocolMgmtBaseShemaItemControl)LoadControl(ControlToLoad);

            Panel pnl = new Panel();
            pnl.ID = ParentTable + "Holder";
            pnl.Attributes["runat"] = "server";

            pnl.Controls.Add(parentList);

            MainTableContainer.Controls.Add(pnl);

            bool bDisplayChild = parentList.LoadControl(ParentTable, Request["scitid"], true, CreateFromTemplate);
        }

        /// <summary>
        /// Add all Child Tables to the Page
        /// </summary>
        /// <param name="protocolSchemaId"></param>
        /// <returns></returns>
		//protected void AddChildTablesToPage_Garbage(string parentTableName)
		//{
		//    string ControlToLoad;
		//    String[] childTables = ChildTables.Split(',');

		//    int maxIndex = childTables.Length - 1;

		//    for (int i = 0; i <= maxIndex; i++)
		//    {
		//        string childName = childTables[i];

		//        ProtocolMgmtBaseShemaItemControl childGrid;

		//        if (ParentTableLayout == "List and Grid" && i == maxIndex)
		//            ControlToLoad = "AdminSchemaItemChildTableGrid.ascx";
		//        else
		//            ControlToLoad = "AdminSchemaItemList.ascx";

		//        childGrid = (ProtocolMgmtBaseShemaItemControl) LoadControl(ControlToLoad);

		//        Panel pnl = new Panel();
		//        pnl.ID = childName + "Holder";
		//        pnl.Attributes["runat"] = "server";

		//        ChildrenTableContainer.Controls.Add(pnl);
		//        pnl.Controls.Add(childGrid);

		//        bool bDisplayChild = childGrid.LoadControl(childName, Request["scitid"], false, CreateFromTemplate);

		//        dictChildTables.Add(childName, childGrid);
		//    }
		//}

		private void AddChildTables(IEnumerable<KeyValuePair<string, bool>> childTables)
		{
			foreach (KeyValuePair<string, bool> childTable in childTables)
			{
				string tablename = childTable.Key;
				bool isGrid = childTable.Value;
				string controlName = isGrid ? "AdminSchemaItemChildTableGrid.ascx" : "AdminSchemaItemList.ascx";

				ProtocolMgmtBaseShemaItemControl control = (ProtocolMgmtBaseShemaItemControl) LoadControl(controlName);

				Panel panel = new Panel();
				panel.ID = tablename + "Holder";

				ChildrenTableContainer.Controls.Add(panel);
				panel.Controls.Add(control);

				control.LoadControl(tablename, Request["scitid"], false, CreateFromTemplate);

				dictChildTables[tablename] = control;
			}
		}

        protected void SetButtonState()
        {
            if (SchemaItemId == -1
                || CreateFromTemplate)
            {
                CreateButton.Visible = true;
                SaveButton.Visible = false;
                DeleteButton.Visible = false;
            }
            else
            {
                CreateButton.Visible = false;
                SaveButton.Visible = true;


                int visitsAssigned = BusinessObject.Count<ItemTimeline>(new Dictionary<string, object>
                {
                    { ItemTimeline.SchemaItemId, SchemaItemId }
                });

                if (visitsAssigned == 0 && !HavePatientsBeenAssigned())
                    DeleteButton.Visible = true;
            }


        }

        protected bool HasTimelineBeenCreated()
        {
            return ProtocolMgmtDa.HasTimelineBeenCreated(SchemaItemId);
        }

        protected bool HavePatientsBeenAssigned()
        {
            return ProtocolMgmtDa.HavePatientsBeenAssignedToSchema(SchemaItemId);
        }

        # region Button Clicks

        protected void CreateItemBtn_Click(object sender, ImageClickEventArgs e)
        {
            SchemaItem item = new SchemaItem();

            item[SchemaItem.ProtocolSchemaId] = int.Parse(BaseSchemaId);
            //item[SchemaItem.ItemDescription] = ItemName;
            item[SchemaItem.ItemDescription] = parentItemName.Value;
            item[SchemaItem.ItemIsTemplate] = TemplateCheckBox.Checked;

            item.Save();

            int nSchemaItemId;
            if (Int32.TryParse(item[SchemaItem.SchemaItemId].ToString(), out nSchemaItemId))
            {
                parentList.SaveControl(nSchemaItemId, true, CreateFromTemplate);

                foreach (string s in dictChildTables.Keys)
                {
                    dictChildTables[s].SaveControl(nSchemaItemId, false, CreateFromTemplate);
                }
            }
            

            RegisterUpdatePageScript(true, String.Empty);
        }

        protected void SaveItemBtn_Click(object sender, ImageClickEventArgs e)
        {
            SchemaItem item = new SchemaItem();

            // old schema needs to be deleted if changes are still allowed
            if (!HavePatientsBeenAssigned()
                && !HasTimelineBeenCreated())
            {
                if (ProtocolMgmtDa.DeleteOldSchemaItem(SchemaItemId))
                {
                    // Set values for the new schema to be created
                    item[SchemaItem.ProtocolSchemaId] = int.Parse(BaseSchemaId);
                }
                else
                    item.Get(SchemaItemId);
            }
            else
            {
                // otherwise, get the schema
                item.Get(SchemaItemId);
            }

            item[SchemaItem.ItemDescription] = parentItemName.Value;
            item[SchemaItem.ItemIsTemplate] = TemplateCheckBox.Checked;

            item.Save();

            int nSchemaItemId;
            if (Int32.TryParse(item[SchemaItem.SchemaItemId].ToString(), out nSchemaItemId))
            {
                parentList.SaveControl(nSchemaItemId, true, CreateFromTemplate);

                foreach (string s in dictChildTables.Keys)
                {
                    dictChildTables[s].SaveControl(nSchemaItemId, false, CreateFromTemplate);
                }
            }

            RegisterUpdatePageScript(true, String.Empty);
        }

        protected void DeleteItemBtn_Click(object sender, ImageClickEventArgs e)
        {
            string strErrMsg = String.Empty;

            if (!ProtocolMgmtDa.DeleteOldSchemaItem(SchemaItemId))
                strErrMsg = "Schema Item Could not be Deleted!";

            RegisterUpdatePageScript(true, strErrMsg);
        }

        # endregion Button Clicks

        public void RegisterUpdatePageScript(bool hideModal, string errMsg)
        {
            string query = "?" + QUERY_PROTOCOL_ID_KEY + "=" + BaseProtocolId + "&" + QUERY_PROTOCOL_SCHEMA_KEY + "=" + BaseSchemaId + "&" + QUERY_PATIENT_ID_KEY + "=" + BasePatientId;

            string doHideModal = hideModal.ToString().ToLower();

            string jsExecute = String.Empty;
            if (!String.IsNullOrEmpty(errMsg))
                jsExecute = "alert('" + errMsg + "'); ";
            
            jsExecute += "parent.reloadAdminProtocolFrame(); if(top.hideModal && " + doHideModal + ") { top.hideModal(); }";
            Page.ClientScript.RegisterStartupScript(typeof(Page), "UpdateMainPageScript", jsExecute, true);

        }
    }
}