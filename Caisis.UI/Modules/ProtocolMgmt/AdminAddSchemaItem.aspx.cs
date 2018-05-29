using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Collections.Generic;
using System.Xml;
using Caisis.BOL;
using Caisis.UI.Core.Classes.CustomControls;
using Caisis.DataAccess;
using System.Collections.Specialized;
using System.Reflection;

namespace Caisis.UI.Modules.ProtocolMgmt
{
    public partial class AdminAddSchemaItem : ProtocolMgmtBaseAdminPage
    {
        string[] radioButtonsArr = new string[] { "Do Not Collect", "Collect At Visit", "Preset Value" };

        private bool patientsAssigned = false;

		private Dictionary<string, List<CheckBox>> checkBoxMap = new Dictionary<string, List<CheckBox>>();

        private int SchemaItemId
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

        private bool CreateFromTemplate
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

        private bool CopyFromSchema
        {
            get
            {
                string copyFromSchema = Request["copyFromSchema"];

                if (!String.IsNullOrEmpty(copyFromSchema))
                {
                    bool bCopyFromSchema = false;

                    if (Boolean.TryParse(copyFromSchema, out bCopyFromSchema))
                    {
                        return bCopyFromSchema;
                    }
                }

                return false;
            }
        }

        protected override void Page_Load(object sender, EventArgs e)
        {
            base.Page_Load(sender, e);

            base.EnableViewState = true;

            // set on click for grid checkbox
			ParentTableIsGridCheckBox.InputAttributes["onclick"] = "ShowChildTables(!this.checked);";

            // register update fields button
            Caisis.UI.Core.Classes.PageUtil.RegitserControlPostBackScript(RebuildChildTables, "doViewFieldsClick");

			if (!IsPostBack)
			{
				HavePatientsBeenAssigned();

				GetTemplates();

				// if patients are assigned, don't allow layout and table changes
				SetControlVisibility();

				// Available tables
				LoadItemTypes();

				// Get item name
				SetItemName();

				SetItemTypeEditability();

				PopulateChildTableList(DropDownListItemType.SelectedValue);

				// Figure out what type of layout based on previously saved data
				SetLayoutType();

				// Set the frame Url
				if (SchemaItemId != -1)
					LoadDetailsPage();

				RestoreCreateOption();
			}
			else
			{
				//layoutTitle.Text = LayoutType.Value;
			}
        }

		protected override void OnPreRender(EventArgs e)
		{
			base.OnPreRender(e);

			string script = BuildJavascriptCheckBoxMap();
			Page.ClientScript.RegisterStartupScript(this.GetType(), "checkBoxMap", script, true);
		}

        private void RestoreCreateOption()
        {
            if (CopyFromSchema)
            {
                CopySchemaRB.Checked = true;
                ItemCreateOption.Text = CopySchemaRB.Value;

                TemplatesItems.Style.Add("display", "none");
                SchemaItems.Style.Add("display", "block");
                TemplateMenuItemsHeader.Style.Add("display", "");

                SetTemplateRadioButton(SchemaItemsRptr);
            }
            else if (CreateFromTemplate)
            {
                UseTemplateRB.Checked = true;
                ItemCreateOption.Text = UseTemplateRB.Value;

                TemplatesItems.Style.Add("display", "block"); 
                SchemaItems.Style.Add("display", "none");
                TemplateMenuItemsHeader.Style.Add("display", "");

                SetTemplateRadioButton(TemplatesRptr);
            }
            else
            {
                CreateSchemaRB.Checked = true;
                ItemCreateOption.Text = CreateSchemaRB.Value;
            }
        }

        private void SetTemplateRadioButton(Repeater rptr)
        {
            foreach (RepeaterItem ri in rptr.Items)
            {
                HiddenField schItemId = ri.FindControl("SchemaItemIdHd") as HiddenField;
                if (schItemId != null)
                {
                    if (schItemId.Value == SchemaItemId.ToString())
                    {
                        RadioButton rb = ri.FindControl("SchemaItemOption") as RadioButton;
                        if (rb != null)
                        {
                            ItemToCopy.Text = rb.Text;
                            rb.Checked = true;
                            break;
                        }
                    }
                }
            }
        }

        private void GetTemplates()
        {
            TemplatesRptr.DataSource = ProtocolMgmtDa.GetAllTemplates();
            TemplatesRptr.DataBind();

            int schemaId = int.Parse(BaseSchemaId);
            DataTable dt = ProtocolMgmtDa.GetDistinctSchemaItems(schemaId);
            SchemaItemsRptr.DataSource = dt;
            SchemaItemsRptr.DataBind();

        }

		//protected void GetAllSchemas()
		//{
		//    int nSchemaId;

		//    if (Int32.TryParse(BaseSchemaId, out nSchemaId))
		//    {

		//    }
		//}

        private void HavePatientsBeenAssigned()
        {
            patientsAssigned = ProtocolMgmtDa.HavePatientsBeenAssignedToSchema(SchemaItemId);
        }

        private int GetTableCount()
        {
            if (SelectedChildTablesLabel.Text != "")
            {
                string[] strChildTables = SelectedChildTablesLabel.Text.Split(',');

                return strChildTables.Length;
            }

            return 0;
        }

        private void SetControlVisibility()
        {
            if (patientsAssigned)
            {
                // LayoutTypeRBList.Enabled = false;
                RebuildChildTables.Visible = false;
            }
        }

        private void LoadDetailsPage()
        {
            SchemaItemDetailsPage.Attributes["src"] = GetDetailsPageUrl();
        }

		private void ClearDetailsPage()
		{
			SchemaItemDetailsPage.Attributes["src"] = "";
		}

        private string GetDetailsPageUrl()
        {
            string strUrl = GetQueryString("AdminSchemaItemTables.aspx");
            
            strUrl += "&scitid=" + SchemaItemId;

            strUrl += "&itemName=" + TextBoxItemName.Text;

            strUrl += "&parentTable=" + DropDownListItemType.SelectedValue;

            // doesn't matter
			// strUrl += "&parentTableLayout=" + LayoutTypeRBList.SelectedValue;

			strUrl += "&parentIsGrid=" + ParentTableIsGridCheckBox.Checked;

            // if from template, make sure controls are created without schemaitemid
            if (CreateFromTemplate || CopyFromSchema)
                strUrl += "&createFromTemplate=true";

            string strChildTableParam = String.Empty;

			Action<string, bool> appendChildTable =
				(t, g) =>
				{
					if (strChildTableParam != String.Empty)
						strChildTableParam += ",";

					strChildTableParam += t + "." + g;
				};

            foreach(RepeaterItem ri in ChildTablesRptr.Items)
            {
				//CheckBox cb = ri.FindControl("cbChildTable") as CheckBox;

				//if (cb != null
				//    && cb.Checked)
				//{
				//    if (strChildTableParam != "")
				//        strChildTableParam += ",";
				//    strChildTableParam += cb.Text;
				//}

				Label label = ri.FindControl("childTableNameLabel") as Label;
				CheckBox listCheckBox = ri.FindControl("childTableListCheckBox") as CheckBox;
				CheckBox gridCheckBox = ri.FindControl("childTableGridCheckBox") as CheckBox;

				if (label == null)
					continue;

				string tablename = label.Text;

				if (listCheckBox != null && listCheckBox.Checked)
					appendChildTable(tablename, false);
				else if (gridCheckBox != null && gridCheckBox.Checked)
					appendChildTable(tablename, true);
            }

            SetChildHeader(strChildTableParam);

            if (!String.IsNullOrEmpty(strChildTableParam))
            {
                //strChildTableParam = strChildTableParam.Remove(strChildTableParam.Length - 1);
                strChildTableParam = "&childTables=" + strChildTableParam;
            }

            strUrl += strChildTableParam;

            return strUrl;
        }

        private void SetChildHeader(string childHeader)
        {
            SelectedChildTablesLabel.Text = childHeader;

            int tbCount = GetTableCount();

            if (SelectedChildTablesLabel.Text.Length > 20)
                SelectedChildTablesLabel.Text = SelectedChildTablesLabel.Text.Substring(0, 20) + "....";

            SelectedChildTablesLabel.Text += "&nbsp;&nbsp;&nbsp;(" + tbCount + ")";
        }

        private void SetRepeaterValue(RadioButtonList rbl, string val)
        {
            for (int i = 0; i < rbl.Items.Count; i++)
            {
                if (rbl.Items[i].Text == val)
                {
                    rbl.SelectedIndex = i;
                }

            }
        }

        private void SetLayoutType()
        {
			if (SchemaItemId == -1)
				return;

			IEnumerable<SchemaItemField> fields = BusinessObject.GetByParent<SchemaItemField>(SchemaItemId);

			if (fields.Count() == 0)
				return;

			string tablename = fields.First()[SchemaItemField.DestTable].ToString();

			if (fields.All(f => f[SchemaItemField.DestTable].ToString() == tablename && !f.IsNull(SchemaItemField.FieldRowIndex)))
				ParentTableIsGridCheckBox.Checked = true;
        }

        // If the item has been saved, not allow item type to be changed
        private void SetItemTypeEditability()
        {
			//SchemaItemField fields = new SchemaItemField();
			//fields.GetByParent(SchemaItemId);

            string parentTable = GetParentTable(ProtocolMgmtDa.GetDistinctSchemaItemFields(SchemaItemId));

            // string parentTable = Request["parentTable"];
            if (!String.IsNullOrEmpty(parentTable))
            {
                //DataView dv = fields.DataSourceView;
				DataView dv = BusinessObject.GetByParentAsDataView<SchemaItemField>(SchemaItemId);
                dv.RowFilter = "DestTable = '" + parentTable + "'";

                if (dv.Count > 0)
                {
                    DropDownListItemType.SelectedValue = dv[0][SchemaItemField.DestTable].ToString();
                    DropDownListItemType.Enabled = false;
                    ParentTableIsGridCheckBox.Enabled = false;
                }
            }
        }

        private string GetParentTable(DataTable dt)
        {
            DataRow dr = GetParentRowBySchemaItemId(dt);

            if (dr != null)
            {
                if (dr[SchemaItemField.DestTable] != null)
                    return dr[SchemaItemField.DestTable].ToString();
            }

            return String.Empty;
        }

        private DataRow GetParentRowBySchemaItemId(DataTable dt)
        {
            if (dt.Rows.Count == 0)
                return null;

            // If only one record for this schemaItemId, it must be the parent
            if (dt.Rows.Count == 1
                || !BusinessObject.HasParentTable(dt.Rows[0]["DestTable"].ToString()))
                return dt.Rows[0];

            for (int i = 0; i < dt.Rows.Count; i++)
            {
                int StartingIndex = i + 1;

                DataRow drCurrent = dt.Rows[i];

                while (StartingIndex < dt.Rows.Count)
                {
                    DataRow drNext = dt.Rows[StartingIndex];

                    if (BusinessObject.GetParentTablename(drCurrent["DestTable"].ToString()) == drNext["DestTable"].ToString())
                        return drNext;
                    else if (BusinessObject.GetParentTablename(drNext["DestTable"].ToString()) == drCurrent["DestTable"].ToString())
                        return drCurrent;

                    StartingIndex++;
                }
            }

            return null;
        }

        /// <summary>
        /// Gets all Child Tables which belong to a ProtocolSchema
        /// </summary>
        /// <param name="protocolSchemaId"></param>
        /// <returns></returns>
        private List<string> GetSchemaChildTableNames()
        {
            DataTable dtChildTables = ProtocolMgmtDa.GetChildTablesBySchema(SchemaItemId);

            List<string> childList = new List<string>();

            foreach (DataRow dr in dtChildTables.Rows)
                childList.Add(dr[SchemaItemField.DestTable].ToString());

            return childList;

        }

        void SetItemName()
        {
            if (SchemaItemId != -1)
            {
                SchemaItem item = new SchemaItem();
                item.Get(SchemaItemId);

                // show item description
                TextBoxItemName.Text = item[SchemaItem.ItemDescription].ToString();
            }
        }

        private void LoadItemTypes()
        {
            //AvailableTableConfiguration config = new AvailableTableConfiguration();
            DropDownListItemType.DataSource = Caisis.BOL.BusinessObject.GetTableNamesWithMetadataAttribute("ProtocolMgmtTopLevelTable");
            DropDownListItemType.DataBind();
			DropDownListItemType.Items.Insert(0, new ListItem("", ""));
        }

        protected void DropDownListItemType_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (DropDownListItemType.SelectedIndex > 0)
            {
				ClearDetailsPage();

                // populate item name with the item type
				string tablename = DropDownListItemType.SelectedValue;

				if (Caisis.BOL.BusinessObject.HasTableLabel(tablename))
					TextBoxItemName.Text = Caisis.BOL.BusinessObject.GetTableLabel(tablename);
				else
					TextBoxItemName.Text = tablename;

                DisplayRebuildButton();
                // rebuild child tables
                RebuildChildTables_Click(sender, e);
            }

            // Populate child table list
            PopulateChildTableList(DropDownListItemType.SelectedValue);
        }

		private void DisplayRebuildButton()
        {
			if (//!String.IsNullOrEmpty(layoutTitle.Text)&& 
				DropDownListItemType.SelectedIndex > 0)
                RebuildButtonHolder.Style.Add("display", "");
        }

		private void PopulateChildTableList(string parentTableName)
		{
            if (!string.IsNullOrEmpty(parentTableName))
            {
                IEnumerable<string> childTablenames = Caisis.BOL.BusinessObject.GetDescendantTableNames(parentTableName);
                List<string> selectedTables = GetSchemaChildTableNames();

                Func<string, string> onClick = id => "if (this.checked) $('" + id + "').checked = false;";

                ChildTablesRptr.ItemDataBound +=
                    new RepeaterItemEventHandler(
                        (o, e) =>
                        {
                            CheckBox listCheckBox = e.Item.FindControl("childTableListCheckBox") as CheckBox;
                            CheckBox gridCheckBox = e.Item.FindControl("childTableGridCheckBox") as CheckBox;

                            listCheckBox.InputAttributes["onclick"] = onClick(gridCheckBox.ClientID);
                            gridCheckBox.InputAttributes["onclick"] = onClick(listCheckBox.ClientID);

                            // disable list/grid based on relation to parent table
                            string tablename = e.Item.DataItem as string;

                            List<CheckBox> list = new List<CheckBox>();
                            list.Add(listCheckBox);
                            list.Add(gridCheckBox);

                            checkBoxMap[tablename] = list;

                            // if t is one-to-one with parent: disable grid
                            // if t is one-to-many with parent: disable list

                            string primaryKey = Caisis.BOL.BusinessObject.GetPrimaryKeyName(tablename);
                            string parentKey = Caisis.BOL.BusinessObject.GetPrimaryKeyName(parentTableName);

                            bool precheck = false;

                            if (selectedTables.Contains(tablename))
                            {
                                precheck = true;

                                if (!string.IsNullOrEmpty(SelectedChildTablesLabel.Text))
                                    SelectedChildTablesLabel.Text += ", ";

                                SelectedChildTablesLabel.Text += tablename;
                            }

                            if (patientsAssigned)
                            {
                                gridCheckBox.Enabled = false;
                                listCheckBox.Enabled = false;

                                if (precheck)
                                {
                                    listCheckBox.Checked = primaryKey == parentKey;
                                    gridCheckBox.Checked = primaryKey != parentKey;
                                }
                            }
                            else
                            {
                                if (primaryKey == parentKey)
                                {
                                    gridCheckBox.Enabled = false;
                                    listCheckBox.Enabled = true;

                                    if (precheck)
                                        listCheckBox.Checked = true;
                                }
                                else
                                {
                                    gridCheckBox.Enabled = true;
                                    listCheckBox.Enabled = false;

                                    if (precheck)
                                        gridCheckBox.Checked = true;
                                }
                            }



                            // TODO: check unchecked parent tables in the list
                        });

                ChildTablesRptr.DataSource = childTablenames;
                ChildTablesRptr.DataBind();

                if (childTablenames != null && childTablenames.Count() > 0)
                {
                    ChildTableSummary.Style["display"] = ";";
                    ChildMenuTextDisplay.Style["display"] = ";";
                }
                else
                {
                    ChildTableSummary.Style["display"] = "none;";
                    ChildMenuTextDisplay.Style["display"] = "none;";
                }
            }
		}

        // Populate child table list
        private void PopulateChildTableListOld(string parentTableName)
        {
            if (String.IsNullOrEmpty(parentTableName))
                return;

            // Populate child table ddl
			IEnumerable<string> childTablesList = Caisis.BOL.BusinessObject.GetDescendantTableNames(parentTableName);

			//ChildTablesRptr.ItemDataBound += 
			//    new RepeaterItemEventHandler(
			//        (o, e) => 
			//        {
			//            CheckBox cb = e.Item.FindControl("cbChildTable") as CheckBox;

			//            if (cb != null)
			//                checkBoxMap[cb.Text] = cb;
			//        });

			ChildTablesRptr.DataSource = childTablesList;
			ChildTablesRptr.DataBind();
			
			#region old code
			//RegisterJSTableMap(childTablesList);

			//ChildTablesRptr.DataSource = childTablesList;

			//StringBuilder cbScript = new StringBuilder();

			//ChildTablesRptr.ItemDataBound +=
			//    new RepeaterItemEventHandler(
			//        (o, e) =>
			//        {
			//            CheckBox cb = e.Item.FindControl("cbChildTable") as CheckBox;
			//            if (cb != null)
			//            {
			//                string tablename = cb.Text;
			//                string id = cb.UniqueID;

			//                cbScript.AppendFormat("cbmap['{0}'] = '{1}';", tablename, id);
			//                cbScript.AppendLine();
			//                cbScript.AppendFormat("cblist.push('{0}');", id);
			//                cbScript.AppendLine();
			//            }
			//        });

			//ChildTablesRptr.DataBind();

			//Page.ClientScript.RegisterStartupScript(this.GetType(), "checkboxMap", cbScript.ToString(), true);
			#endregion

			if (childTablesList != null && childTablesList.Count() > 0)
            {
                ChildTableSummary.Style["display"] = ";";

				//if (LayoutTypeRBList.Items.FindByValue("List and Grid") == null)
				//    LayoutTypeRBList.Items.Add("List and Grid");
            }
            else
            {
				//ListItem li = new ListItem("List and Grid");
				//if (LayoutTypeRBList.Items.FindByValue("List and Grid") != null)
				//    LayoutTypeRBList.Items.Remove(li);
                ChildTableSummary.Style["display"] = "none;";
            }
        }

		

		private string BuildJavascriptCheckBoxMap()
		{
			StringBuilder b = new StringBuilder();

			b.AppendLine("var cbmap = new Object();");
			b.AppendLine("var parentMap = new Object();");
			b.AppendLine();

			Func<string, int, string> f = (s, i) => checkBoxMap[s][i].ClientID;
			Func<string, string> listId = s => f(s, 0);
			Func<string, string> gridId = s => f(s, 1);

			foreach (string tablename in checkBoxMap.Keys)
			{
				// build child checkbox list
				string array = "new Array()";
				IEnumerable<string> descendants = Caisis.BOL.BusinessObject.GetDescendantTableNames(tablename);

				if (descendants.Count() > 0)
				{
					var query =
						from d in descendants
						where checkBoxMap.ContainsKey(d)
						select "'" + listId(d) + "','" + gridId(d) + "'";

					array = "[" + string.Join(",", query.ToArray()) + "]";
				}

				Action<string> append = s => b.AppendFormat("cbmap['{0}'] = {1};", s, array).AppendLine();

				// map parent checkboxes to child checkboxes
				string listCbId = listId(tablename);
				string gridCbId = gridId(tablename);

				append(listCbId);
				append(gridCbId);

				// map child checkboxes to parent checkboxes
				string parentTablename = Caisis.BOL.BusinessObject.GetParentTablename(tablename);

				if (checkBoxMap.ContainsKey(parentTablename))
				{
					
					string parentArray = "['" + listId(parentTablename) + "','" + gridId(parentTablename) + "']";
					Action<string> a = s => b.AppendFormat("parentMap['{0}'] = {1};", s, parentArray).AppendLine();

					a(listCbId);
					a(gridCbId);
				}
			}

			return b.ToString();
		}

		#region old code
		//private string BuildJSTableMap(Dictionary<string, string> tablenames)
		//{
		//    // format:
		//    // var cbmap = new Object();
		//    // for each tablename:
		//    // cbmap[$tablename] = ['d0', 'd1', ... ]; where di <- descendant of $tablename

		//    StringBuilder b = new StringBuilder();

		//    b.AppendLine("var tablemap = new Object();");
		//    b.AppendLine("var cbmap = new Object();");
		//    b.AppendLine("var cblist = new Array();");
		//    b.AppendLine();

		//    foreach (string t in tablenames.Keys)
		//    {
		//        IEnumerable<string> descendants = Caisis.BOL.BusinessObject.GetDescendantTableNames(t);

		//        string array = null;

		//        if (descendants.Count() > 0)
		//        {
		//            var query =
		//                from d in Caisis.BOL.BusinessObject.GetDescendantTableNames(t)
		//                where tablenames.ContainsKey(d)
		//                select string.Format("'{0}'", d);

		//            array = string.Format("[{0}]", string.Join(",", query.ToArray()));
		//        }
		//        else
		//        {
		//            array = "new Array()";
		//        }

		//        b.AppendFormat("tablemap['{0}'] = {1};", t, array);
		//        b.AppendLine();
		//    }

		//    return b.ToString();
		//}

		//private void RegisterJSTableMap(IEnumerable<string> tablenames)
		//{
		//    Dictionary<string, string> map = new Dictionary<string, string>();

		//    foreach (string t in tablenames)
		//        map[t] = null;

		//    string script = BuildJSTableMap(map);

		//    Page.ClientScript.RegisterStartupScript(this.GetType(), "tableMap", script, true);
		//}
		

		//protected List<string> GetAllChildTables(string tablename)
		//{
		//    List<string> childTablesList = new List<string>();

		//    PatientDataEntryController pde = new PatientDataEntryController();

		//    XmlNode childrenTables = pde.GetPageConfigNode(tablename);

		//    if (childrenTables == null)
		//        return null;

		//    foreach (XmlNode childNode in childrenTables)
		//    {
		//        string strChildTable = childNode.Attributes["tableName"].Value;
		//        if (!String.IsNullOrEmpty(strChildTable))
		//        {
		//            childTablesList.Add(strChildTable);
		//        }
		//    }

		//    return childTablesList;
		//}

		#endregion

		// Select checkboxes for child tables that have been added already
		// TODO: fix me for new code
        protected void SetSelectedChildTablesOld(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemIndex == 0)
                SelectedChildTablesLabel.Text = String.Empty;

            if (e.Item.ItemType == ListItemType.Item
                || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                CheckBox cb = e.Item.FindControl("cbChildTable") as CheckBox;

                if (cb == null)
                    return;

                string checkBoxChildName = e.Item.DataItem.ToString();
                List<string> listChildTables = GetSchemaChildTableNames();

                // if patients have been assigned, not allow any changes
                cb.Enabled = !patientsAssigned;

                if (listChildTables.Contains(checkBoxChildName))
                {
                    cb.Checked = true;
                    if (SelectedChildTablesLabel.Text != "")
                        SelectedChildTablesLabel.Text += ", ";
                    SelectedChildTablesLabel.Text += checkBoxChildName;
                }
            }
        }

		protected void SetSelectedChildTables(object sender, RepeaterItemEventArgs e)
		{
			Label tablenameLabel = e.Item.FindControl("childTableNameLabel") as Label;
			CheckBox listCheckBox = e.Item.FindControl("childTableListCheckBox") as CheckBox;
			CheckBox gridCheckBox = e.Item.FindControl("childTableGridCheckBox") as CheckBox;
			

		}

        protected void RebuildChildTables_Click(object sender, EventArgs e)
        {
			//if (LayoutTypeRBList.SelectedValue == "List"
			//    || LayoutTypeRBList.SelectedValue == "Grid")
			//{
			//    foreach(RepeaterItem ri in ChildTablesRptr.Items)
			//    {
			//        CheckBox cb = ri.FindControl("cbChildTable") as CheckBox;
			//        if (cb != null)
			//        {
			//            cb.Checked = false;
			//        }
			//    }
			//}

			// TODO: deselect all checkboxes

			//foreach (RepeaterItem ri in ChildTablesRptr.Items)
			//{
			//    CheckBox listCheckBox = ri.FindControl("cbChildTableListCheckBox") as CheckBox;
			//    CheckBox gridCheckBox = ri.FindControl("cbChildTableGridCheckBox") as CheckBox;

			//    if (listCheckBox != null)
			//        listCheckBox.Checked = false;

			//    if (gridCheckBox != null)
			//        gridCheckBox.Checked = false;
			//}

            LoadDetailsPage();
        }
        
        private void LayoutTypeRBList_SelectedIndexChanged(object sender, EventArgs e)
        {
            RebuildButtonHolder.Style.Add("display", "");
        }
        
        protected void TemplatesRptr_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.AlternatingItem || e.Item.ItemType == ListItemType.Item)
            {
                RadioButton rb = e.Item.FindControl("SchemaItemOption") as RadioButton;

                string strSrc = GetQueryString("AdminAddSchemaItem.aspx");

                strSrc += "&scitid=" + DataBinder.Eval(e.Item.DataItem, "SchemaItemId").ToString();

                // Make sure the controls are loaded without schemaitemids
                strSrc += "&createFromTemplate=true";

                rb.Attributes["onclick"] = "reloadWindow('" + strSrc + "');";
                
            }
        }

        protected void SchemaItemsRptr_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.AlternatingItem || e.Item.ItemType == ListItemType.Item)
            {
                RadioButton rb = e.Item.FindControl("SchemaItemOption") as RadioButton;

                string strSrc = GetQueryString("AdminAddSchemaItem.aspx");

                strSrc += "&scitid=" + DataBinder.Eval(e.Item.DataItem, "SchemaItemId").ToString();

                // Make sure the controls are loaded without schemaitemids
                strSrc += "&copyFromSchema=true";

                rb.Attributes["onclick"] = "reloadWindow('" + strSrc + "');";

            }
        }
    }
}
