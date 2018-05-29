using System;
using System.Collections;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Web;
using System.Web.SessionState;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;

using Caisis.UI.Core.Classes;
using Caisis.DataAccess;

namespace Caisis.UI.Admin
{
	/// <summary>
	/// Summary description for AdminMetaTables.
	/// </summary>
	public partial class AdminMetaTables :  AdminBasePage
    {
         
        private int MaxNoOfNewAttributes = 10;
        
        private Hashtable hstAttributeValueOptions = new Hashtable();
        private DataTable dtAttributes;
        private string viewMode = "start";
        
        protected string strAttributeSwitchOptionsForJS;

        
		private void Page_Load(object sender, System.EventArgs e)
		{
			// Put user code to initialize the page here
            if (!Page.IsPostBack)
            {
                
                btnEtAddSelectedColumnsToMetaFields.Attributes.Add("OnClick","javascript: return AddColumns();");
                btnEtAddSelectedColumnsToMetaFieldsCancel.Attributes.Add("OnClick","javascript: return AddColumnsCancel();");

                ddlEtTableName.Attributes.Add("OnChange", " if (!confirm(lblEtSelectedTableChangedQuestion(this))){lblEtSelectedTableChanged(this);return false;};");

                btnEtSaveCancel.Attributes.Add("OnClick","javascript: return EditTableCancel(this);");
                btnEtSaveEdit.Attributes.Add("OnClick","javascript: return EditTable(this);");
                
                loadTableDefs();
                loadSystemTables();
                loadAttributeSwitchOptionsForJS();
                
            }
            setViewMode();
            setAttributeSwitchOptionsForJS();
        }
		private void setViewMode()
        {
            btnEditMetaTable.Enabled = false;
            btnCreateMetaTable.Enabled = false;
            pnlStart.Visible = false;
            
            pnlEditTable.Visible = false;
            //pnlEditField.Visible = false;
            pnlNewTableStep2.Visible = false;
            btnNewTableCreatedNext.Enabled = false;
            pnlCreateNewAttributeStep2.Visible = false;
            pnlEditAnAttribute.Visible = false;
            pnlErrorMessage.Visible = false;
            switch (viewMode)
            {
                case "start":
                    pnlStart.Visible = true;
                    break;
                case "newTabelStep2":
                    pnlNewTableStep2.Visible = true;
                    break;
                case "editTable":
                    pnlEditTable.Visible = true;
                    break;
                case "createNewAttributeStep2":
                    pnlCreateNewAttributeStep2.Visible = true;
                    break;
                case "EditAnAttribute":
                    pnlEditAnAttribute.Visible = true;
                    break;
                case "errorMessage":
                    pnlErrorMessage.Visible = true;
                    break;
                /*case "editField":
                    pnlEditField.Visible = true;
                    break;*/
            }
		}
        private void loadTableDefs()
        {
            MetadataNewDa MNDa = new MetadataNewDa();
            DataTable tableDefsDt	= MNDa.GetMetaTables();
            ddlTableDefs.Items.Clear();
            ddlEtTableName.Items.Clear();
            for (int i = 0;i < tableDefsDt.Rows.Count;i++)
            {
                string id = tableDefsDt.Rows[i]["TableId"].ToString();
                string tableName = tableDefsDt.Rows[i]["TableName"].ToString();
                string tableLabel = tableDefsDt.Rows[i]["TableLabel"].ToString();
                ListItem li = new ListItem(tableName + " (" + tableLabel + ")",id);
                ListItem li2 = new ListItem(li.Text, li.Value);
                ddlTableDefs.Items.Add(li);
                ddlEtTableName.Items.Add(li2);
            }
            ddlTableDefs.Items.Insert(0,"  ");
            ddlTableDefs.SelectedIndex = 0;
            
            DataTable atts = MNDa.GetAttributes();
            ddlEditAnAttribute.Items.Clear();
            ddlEditAnAttribute.DataSource = atts;
            ddlEditAnAttribute.DataTextField = "AttributeName";
            ddlEditAnAttribute.DataValueField = "AttributeId";
            ddlEditAnAttribute.DataBind();
        }
        private void loadSystemTables()
        {
            MetadataNewDa MNDa = new MetadataNewDa();
            DataTable tablesDt	= MNDa.GetAllTablesInDB();
            // create display column for formatting
            DataView view = tablesDt.DefaultView;
            view.RowFilter = "TABLE_TYPE = 'BASE TABLE'";
            view.Sort = "TABLE_NAME ASC";

            ddlNewMetaTableBaseTable.DataSource = view;
            ddlNewMetaTableBaseTable.DataBind();

            //ddlNewMetaTableBaseTable.Items.Clear();
            //for (int i = 0;i < tablesDt.Rows.Count;i++)
            //{
            //    string tableName = tablesDt.Rows[i]["TABLE_NAME"].ToString();
            //    string tablesType = tablesDt.Rows[i]["TABLE_TYPE"].ToString();
            //    ListItem li = new ListItem(tableName + " (" + tablesType + ")",tableName);
            //    ddlNewMetaTableBaseTable.Items.Add(li);
            //}
            //ddlNewMetaTableBaseTable.Items.Insert(0,"  ");
            //ddlNewMetaTableBaseTable.SelectedIndex = 0;
        }
        private void loadAttributeValueOptions()
        {
                 
           if(hstAttributeValueOptions.Count == 0)
           {
               MetadataNewDa MNDa = new MetadataNewDa();
               dtAttributes	= MNDa.GetAttributes();
               for (int i = 0;i < dtAttributes.Rows.Count;i++)
                {
                    DataTable attributeValueOptionsDT = MNDa.GetAttributeValueOptionsForAnAttribute(int.Parse(dtAttributes.Rows[i]["AttributeId"].ToString()));
                    try
                    {
                        hstAttributeValueOptions.Add(dtAttributes.Rows[i]["AttributeName"],attributeValueOptionsDT);
                    }
                    catch(Exception e){}
                }
           }
        }
        private void loadAttributeSwitchOptionsForJS()
        {
            //should use stringbuilder instead for optimization
            MetadataNewDa MNDa = new MetadataNewDa();
            dtAttributes	= MNDa.GetAttributes();
            string strOut = "";
            for (int i = 0;i < dtAttributes.Rows.Count;i++)
            {
                DataTable attributeValueOptionsDT = MNDa.GetAttributeValueOptionsForAnAttribute(int.Parse(dtAttributes.Rows[i]["AttributeId"].ToString()));
                if (attributeValueOptionsDT.Rows.Count > 0)
                {
                    string conc = "";
                    strOut = strOut + "case '" + dtAttributes.Rows[i]["AttributeId"].ToString() + "': valueOptions = new Array(";
                    for (int j = 0; j < attributeValueOptionsDT.Rows.Count; j++)
                    {
                        strOut = strOut + conc + "'" + attributeValueOptionsDT.Rows[j]["AttributeOptionValue"].ToString() + "'";
                        conc = ",";
                    }
                    strOut = strOut + ");break;";
                }
           }
            attTxtAttributeValueOptionsSwitch.Text = attTxtAttributeValueOptionsSwitch.Text + strOut;
        }
        private void setAttributeSwitchOptionsForJS()
        {
            strAttributeSwitchOptionsForJS = attTxtAttributeValueOptionsSwitch.Text ;
        }
        private void initiateNewAttributesTemplateTable()
        {
            for (int i = 0;i<MaxNoOfNewAttributes;i++)
            {
                DropDownList ddlName = (DropDownList)dgEtFieldsAttributesNewAttributes.FindControl("attDdlNewAttributeName_" + i.ToString());
                ddlName.Attributes.Add("OnChange","javascript: return NewAttributeNameChanged(this);");
              }
        }
        protected void btnEditMetaTable_onClick(object sender, EventArgs e)
        {
            //set edit table view
            viewMode = "editTable";
            setViewMode();
            int tableId;
            if (((WebControl)sender).ID == "btnEditMetaTable" || ((WebControl)sender).ID == "btnNewTableCreatedNext")
            {
                tableId = int.Parse(ddlTableDefs.SelectedValue);
                ddlEtTableName.ClearSelection();
                ddlEtTableName.SelectedValue = tableId.ToString();
            }
            else
            {
                tableId = int.Parse(ddlEtTableName.SelectedValue);
                ddlTableDefs.SelectedValue = tableId.ToString();
            }
            MetadataNewDa MNDa = new MetadataNewDa();
            DataTable tableDefsDt = MNDa.GetMetaTable(tableId);
            DataRow dr = tableDefsDt.Rows[0];
            lblEtTableId.Text = tableId.ToString();
            string tableName = dr["TableName"].ToString();
            txtEtTableLabel.Text = dr["TableLabel"].ToString();
            txtEtTableDescription.Text = dr["TableDescription"].ToString();
            lblEtTableName.Text = tableName;
                
            updateEditTableView(tableId,tableName);
            
         }
         
         private void updateEditTableView(int metaTableId, string metaTableName)
         {
            loadTableColumns(metaTableId,metaTableName);
            loadMetaFields(metaTableId);
            initiateNewAttributesTemplateTable();
         }
         
         private void loadTableColumns(int tableId, string tableName)
         {
             MetadataNewDa MNDa = new MetadataNewDa();
             DataTable cols = MNDa.GetTableColumns(tableId, tableName);
             if (cols.Rows.Count < 1)
             {
                 lblEtNotUsedFields.Visible = true;
                 lblEtNotUsedFields.Text = "None";
                 dgEtFieldsNotUsed.Visible = false;
                 btnEtAddSelectedColumnsToMetaFields.Visible = false;
                 btnEtAddSelectedColumnsToMetaFieldsInfo.Visible = false;
             }
             else
             {
                 lblEtNotUsedFields.Visible = false;
                 lblEtNotUsedFields.Text = "";
                 dgEtFieldsNotUsed.DataSource = cols.DefaultView;
                 dgEtFieldsNotUsed.DataBind();
                 dgEtFieldsNotUsed.Visible = true;
                 btnEtAddSelectedColumnsToMetaFields.Visible = true;
                 btnEtAddSelectedColumnsToMetaFieldsInfo.Visible = true;
                 lblEtNotUsedFields.Text = "Add selected items as meta fields:&nbsp;";
                 lblEtNotUsedFields.Visible = true;
             }
             btnEtAddSelectedColumnsToMetaFieldsCancel.Visible = btnEtAddSelectedColumnsToMetaFields.Visible;
                 
         }
        private void loadMetaFields(int metaTableId)
        {
            //The relationship handling should maybe be moved to MetadataNewDa instead, returning the complete Dataset
            MetadataNewDa MNDa = new MetadataNewDa();
            DataSet ds = new DataSet();
            
            DataTable ParentFields = new DataTable(); 
            ParentFields = MNDa.GetMetaFieldsForAMetaTable(ParentFields,metaTableId);
            
            
            if (ParentFields.Rows.Count < 1)
            {
                lblEtFields.Visible = true;
                lblEtFields.Text = "None";
                dgEtFields.Visible = false;
             }
            else
            {
                ParentFields.TableName = "ParentTable";
            
                DataTable ChildAttributes = new DataTable();
                ChildAttributes = MNDa.GetAttributeValuesForAMetaTable(ChildAttributes,metaTableId);
                ChildAttributes.TableName = "ChildTable";
            
                ds.Tables.Add(ParentFields);
                ds.Tables.Add(ChildAttributes);
            
                DataRelation dr = new DataRelation("ParentTable_ChildTable", ParentFields.Columns["FieldId"], ChildAttributes.Columns["FieldId"], false);
                dr.Nested = true;
                ds.Relations.Add(dr);
                
                lblEtFields.Visible = false;
                dgEtFields.DataSource = ds;
                dgEtFields.DataBind();
                dgEtFields.Visible = true;
            }
        }
        
        protected void btnCreateMetaTable_onClick(object sender, EventArgs e)
        {
            //set create table view
            viewMode = "newTabelStep2";
            string tableName = ddlNewMetaTableBaseTable.SelectedValue;
            MetadataNewDa MNDa = new MetadataNewDa();
            int tableId = MNDa.AddMetaTable(tableName);
            lbNewTableResult.Text = "A new meta table based on '" + tableName + "' was created.<BR><BR>Click 'Next' to continue to edit meta table data and meta fields for the new meta table.<BR><BR>";
            lbNewTableResultTableId.Text = tableId.ToString();
            lbNewTableResultTableName.Text = tableName;
            loadTableDefs();
            ddlTableDefs.SelectedIndex = ddlTableDefs.Items.IndexOf(ddlTableDefs.Items.FindByValue(tableId.ToString()));
            setViewMode();
            btnNewTableCreatedNext.Enabled = true;
            ddlNewMetaTableBaseTable.SelectedIndex = 0;
        }
        protected void btnEtSave_onClick(object sender, EventArgs e)
        {
            //set create table view
            viewMode = "editTable";
            setViewMode();
            int tableId = int.Parse(ddlTableDefs.SelectedValue);
            
            MetadataNewDa MNDa = new MetadataNewDa();
            MNDa.UpdateMetaTable(tableId,txtEtTableDescription.Text,txtEtTableLabel.Text);
        }

        protected void btnEtDeleteTable_onClick(object sender, EventArgs e)
        {
            MetadataNewDa MNDa = new MetadataNewDa();
            bool okToDelete = true;
            int tableId = int.Parse(ddlTableDefs.SelectedValue);
            okToDelete = !MNDa.TableHasDataSavedInVirtualMetaField(tableId);

            if (okToDelete)
            {
                viewMode = "start";
                setViewMode();
                MNDa.DeleteMetaTableAndAssociatedData(tableId);
                ddlTableDefs.SelectedIndex = 0;
                loadTableDefs();
            }
            else
            {
                viewMode = "errorMessage";
                setViewMode();
                lblErrorHeading.Text = "Could not delete meta table";
                lblErrorMessage.Text = "One or more virtual meta field in the selected meta table has data saved in a virtual table. The meta table was not deleted.";
            }
        }
        protected void btnEtAddSelectedColumnsToMetaFields_onClick(object sender, EventArgs e)
        {              
            //set create table view
            viewMode = "editTable";
            setViewMode();
            int tableId = int.Parse(ddlTableDefs.SelectedValue);
            string tableName = lblEtTableName.Text;
            
            
            string fieldName;
            string fieldDataType;
            int maxLength = -1;
            int order;
            
            MetadataNewDa MNDa = new MetadataNewDa();
            if (MNDa.MetaFieldOrderTableHasOrderedFields(tableId))
            { order = -1;}
            else
            {order = 1;}
            foreach (DataGridItem i in dgEtFieldsNotUsed.Items) 
            {

                CheckBox deleteChkBxItem = (CheckBox) i.FindControl ("chkSelection");

                if (deleteChkBxItem.Checked) 
                {
                    string strMaxLength;
                    fieldName = i.Cells[1].Text;
                    fieldDataType = ParseSQLDatatypeToCsharp(i.Cells[2].Text);
                    strMaxLength  = i.Cells[3].Text;
                    if (PageUtil.IsInteger(strMaxLength))
                    {
                        maxLength = int.Parse(strMaxLength);
                    }
                    else
                    {
                        maxLength = -1;
                    }
                    if (order > 0)
                    {
                        MNDa.AddMetaField(tableId, fieldName, fieldDataType, maxLength, false, false, order);
                        order++;
                    }
                    else { MNDa.AddMetaField(tableId, fieldName, fieldDataType, maxLength, false, false); }
                }

            }
            updateEditTableView(tableId,tableName);
        }
        protected void dgEtFields_ItemDataBound(Object sender, System.Web.UI.WebControls.DataGridItemEventArgs e )
        {
            ListItemType lt = e.Item.ItemType;
            ListItem[] itms = new ListItem[5] {new ListItem("bool"), new ListItem("Datetime"), new ListItem("decimal"), new ListItem("int"), new ListItem("string")};
            if(lt == ListItemType.Header)
            {
                ImageButton iBtn = (ImageButton) e.Item.FindControl("etBtnExpandAttributesAll");
                iBtn.Attributes.Add("OnClick","javascript: return ExpandAttributesAll(this);");
            }
            else if(lt == ListItemType.Item || lt == ListItemType.AlternatingItem)
            {
                    DataRowView dv = e.Item.DataItem as DataRowView;
                    if(dv != null)
                    {
                        DataGrid dgEtFieldsAttributes = e.Item.FindControl("dgEtFieldsAttributes")  as DataGrid;
                        dgEtFieldsAttributes.ToolTip = dv.Row.ItemArray[0].ToString();
                        if(dgEtFieldsAttributes != null)
                        {
                            dgEtFieldsAttributes.DataSource =     dv.CreateChildView("ParentTable_ChildTable");
                            dgEtFieldsAttributes.DataBind();
                        }
                    }
                    
                    DropDownList ddl3 = (DropDownList) e.Item.FindControl("efDdlFieldDataType");
                    ddl3.Items.AddRange(itms);
                    PreSelectDropDown("efDdlFieldDataType", "FieldDataType", e.Item);
                    DropDownList ddl = (DropDownList) e.Item.FindControl("efDdlFieldOrder");
                    ddl.Items.Add("[not set]");
                    for (int i = 1;i<201;i++)
                    {
                        ddl.Items.Add(i.ToString());
                    }
                    PreSelectDropDown("efDdlFieldOrder", "FieldOrder", e.Item);
                    
                    Button btn = (Button) e.Item.FindControl("btnEditField");
                    btn.Attributes.Add("OnClick","javascript: return EditField(this);");
                    ImageButton iBtn2 = (ImageButton) e.Item.FindControl("etBtnExpandAttributes");
                    iBtn2.Attributes.Add("OnClick","javascript: return ExpandAttributes(this);");

                    CheckBox chbx = (CheckBox)e.Item.FindControl("efCbxFieldSuppress");
                    chbx.InputAttributes.Add("disabled", "disabled");
                    
                
                    
                }
                else if(lt == ListItemType.Footer)
                {
                    
                Button btn2 = (Button) e.Item.FindControl("efBtnAddNewFieldCancel");
                btn2.Attributes.Add("OnClick","javascript: return cancelNewField(this);");
                
                DropDownList ddl1 = (DropDownList) e.Item.FindControl("efDdlNewVirtualFieldDataType");
                DropDownList ddl2 = (DropDownList) e.Item.FindControl("efDdlNewFieldOrder");
                ddl1.Items.AddRange(itms);
                ddl1.Items.Insert(0,new ListItem(""));
                ddl2.Items.Add("[not set]");
                for (int i = 1;i<201;i++)
                {
                    ddl2.Items.Add(i.ToString());
                }
                    
                }
                
                
                
        }
        private void PreSelectDropDown(string controlName, string fieldName, DataGridItem item)
        {
            DropDownList ddl = (DropDownList) item.FindControl(controlName);
            if (ddl != null)
            {
                DataRow row = ((DataRowView) item.DataItem).Row;
                string vl = row[fieldName].ToString();
                if (vl.Length < 1 && controlName == "efDdlFieldOrder")
                {
                    vl = "[not set]";
                }
                ListItem li = new ListItem(vl);
                if (ddl.Items.IndexOf(li) < 0)
                {
                    ddl.Items.Add(vl);
                }
                ddl.SelectedValue = vl;
            
            }
        }
        protected void dgEtFields_ItemCommand(Object source, System.Web.UI.WebControls.DataGridCommandEventArgs e)
        {
            bool isVirtual;
            bool fieldSuppress;
            int fieldOrder;
            int fieldId;
            try
            {
            fieldId = int.Parse(e.Item.Cells[1].Text);
            }
            catch 
            {
                fieldId = -1;
            }
            int tableId = int.Parse(ddlTableDefs.SelectedValue);
            string tableName = lblEtTableName.Text;
            MetadataNewDa MNDa = new MetadataNewDa();
                      
            switch (e.CommandName)
            {
                case "Expand":
                    viewMode = "editTable";
                    setViewMode();
               
                    PlaceHolder exp;
                    exp = e.Item.Cells[2].FindControl("Expanded") as PlaceHolder;
                    exp.Visible = !exp.Visible;
                    break;
                case "Edit":
                    string fieldName = ((TextBox)e.Item.Cells[2].Controls[1]).Text;
                    string fieldDataType = ((DropDownList)e.Item.Cells[3].Controls[1]).SelectedValue;
                    fieldSuppress = ((CheckBox)e.Item.Cells[5].Controls[1]).Checked;
					isVirtual = ((CheckBox) e.Item.Cells[4].Controls[1]).Checked;
                    try
                    {
                        fieldOrder = int.Parse(((DropDownList)e.Item.Cells[6].Controls[1]).SelectedValue);
                    }
                    catch
                    {
                        fieldOrder = -1;
                    }
                    viewMode = "editTable";
                    setViewMode();

                  
                    DataRow fieldDr = MNDa.GetMetadataField(fieldId);
                    int previousFieldOrder = -1;

                    if (fieldDr[BOL.MetadataField.FieldOrder] != null && PageUtil.IsInteger(fieldDr[BOL.MetadataField.FieldOrder].ToString()))
                    {
                        previousFieldOrder = (int)fieldDr[BOL.MetadataField.FieldOrder];
                    }

                      
                    // This call updates the field order correctly
                    MNDa.UpdateMetaField(fieldId, fieldName, fieldDataType, fieldSuppress, fieldOrder);

                    // Resequence fields
                    this.UpdateFieldOrders(fieldOrder, previousFieldOrder, tableId, fieldId, fieldSuppress);

					if (isVirtual)
					{
						// refresh virtual field map
						//Caisis.BOL.BusinessObjectFactory.RebuildVirtualFieldMap();
						Caisis.BOL.BusinessObject.RebuildVirtualFields();
					}
                    
                    updateEditTableView(tableId,tableName);
                    break;
                case "Delete":
                    bool okToDelete = true;
                    isVirtual = ((CheckBox)e.Item.Cells[4].Controls[1]).Checked;
                    fieldId = int.Parse(e.Item.Cells[1].Text);
                        
                    if (isVirtual)
                    {
                        okToDelete = !MNDa.VirtualMetaFieldHasSavedData(fieldId);
                    }
                    if (okToDelete)
                    {
                        viewMode = "editTable";
                        setViewMode();

                        MNDa.DeleteMetaField(fieldId);

						if (isVirtual)
						{
							// refresh virtual field map
							//Caisis.BOL.BusinessObjectFactory.RebuildVirtualFieldMap();
							Caisis.BOL.BusinessObject.RebuildVirtualFields();
						}

                        //MNDa.MetaFieldOrderRenumber(tableId);
                        updateEditTableView(tableId, tableName);
                     }
                    else
                    {
                        viewMode = "errorMessage";
                        setViewMode();
                        lblErrorHeading.Text = "Could not delete virtual meta field";
                        lblErrorMessage.Text = "The selected virtual meta field has data saved in virtual table. The virtual meta field was not deleted.";
                    }
                    break;
                 case "AddNewField":
                    TextBox efTxtNewVirtualField;
                   DropDownList efDdlNewVirtualFieldDataType;
                   CheckBox efCbxNewFieldIsVirtual;
                   CheckBox efCbxNewFieldSuppress;
                   DropDownList efDdlNewFieldOrder;
        
                     efTxtNewVirtualField = (TextBox) e.Item.FindControl("efTxtNewVirtualField");
                     efDdlNewVirtualFieldDataType = (DropDownList) e.Item.FindControl("efDdlNewVirtualFieldDataType");
                     efCbxNewFieldIsVirtual = (CheckBox) e.Item.FindControl("efCbxNewFieldIsVirtual");
                     efCbxNewFieldSuppress = (CheckBox) e.Item.FindControl("efCbxNewFieldSuppress");
                     efDdlNewFieldOrder = (DropDownList) e.Item.FindControl("efDdlNewFieldOrder");
                    
                     string newFieldName = efTxtNewVirtualField.Text;
                     string dataType = efDdlNewVirtualFieldDataType.SelectedValue;
                     fieldSuppress = ((CheckBox)e.Item.Cells[5].Controls[1]).Checked;
                     string strFieldOrder = ((DropDownList)e.Item.Cells[6].Controls[1]).SelectedValue;
                     fieldOrder = -1;
                     try
                     {
                         fieldOrder = int.Parse(((DropDownList)e.Item.Cells[6].Controls[1]).SelectedValue);
                     }
                     catch{};
                     if(fieldOrder > -1)
                     {
                             fieldId = MNDa.AddMetaField(tableId,newFieldName,dataType,-1,true,fieldSuppress,fieldOrder);
                             MNDa.MetaFieldOrderRenumber(tableId);
                     }
                     else
                     {
                         fieldId = MNDa.AddMetaField(tableId,newFieldName,dataType,-1,true,fieldSuppress);
                     }

					 // refresh virtual field map
					 //Caisis.BOL.BusinessObjectFactory.RebuildVirtualFieldMap();
					 Caisis.BOL.BusinessObject.RebuildVirtualFields();
                     
                     viewMode = "editTable";
                     setViewMode();
                     updateEditTableView(tableId,tableName);
                     break;
                 case "AddNewFieldCancel":
                     viewMode = "editTable";
                     setViewMode();
                     updateEditTableView(tableId,tableName);
                    break;
            }
            
        }

        /// <summary>
        /// Resequences the FieldOrders of the MetadataFields effected by the movement of a MetadataField
        /// </summary>
        /// <param name="fieldOrder">the new  order of the moved field</param>
        /// <param name="previousFieldOrder">the order of the field before it was moved</param>
        /// <param name="tableId">the id of the table of the field that was moved</param>
        /// <param name="fieldId">the id of the field that was moved</param>
        private void UpdateFieldOrders(int fieldOrder, int previousFieldOrder, int tableId, int fieldId, bool fieldSuppressed)
        {
            MetadataNewDa MNDa = new MetadataNewDa();

            int numPositionChange;

            // how many positions has the field moved up or down?
            if (previousFieldOrder == -1) // -1 means field order was previously Null
            {
                numPositionChange = -1;
            }
            else
            {
                numPositionChange = fieldOrder - previousFieldOrder;
            }
            

            if (numPositionChange != 0 || fieldSuppressed) // make sure field moved
            {
                DataSet ReorderRecords = MNDa.GetFieldsForReodering(tableId, fieldId, fieldOrder, numPositionChange);

                int newFieldOrder = 1; // field was moved up from previous position

                if (numPositionChange < 0) // but if the field was moved down
                {
                    newFieldOrder = fieldOrder + 1; //move all fields above and equal to the new field order up one position
                }
                else if (numPositionChange == 0 && fieldSuppressed) // the position wasn't changed but the field was suppressed! reorder everything under where it was
                {
                    newFieldOrder = fieldOrder;
                }

                foreach (DataRow dr in ReorderRecords.Tables[0].Rows)
                {
                    MNDa.IncreaseMetaFieldOrderNumberByOne((int)dr[BOL.MetadataField.FieldId], newFieldOrder);
                    newFieldOrder++;
                }
            }
            

        }

        protected void dgEtFieldsAttributes_ItemDataBound(Object sender, System.Web.UI.WebControls.DataGridItemEventArgs e )
        {
            ListItemType lt = e.Item.ItemType;
            if (lt == ListItemType.Header)
            {
                loadAttributeValueOptions();
            }    
            else if(lt == ListItemType.Item || lt == ListItemType.AlternatingItem)
            {
                DataRowView dv = e.Item.DataItem as DataRowView;
                
                DropDownList ddl3 = (DropDownList) e.Item.FindControl("attDdlAttributeValue");
                DataTable options = (DataTable) hstAttributeValueOptions[dv["AttributeName"].ToString()];
                if(options.Rows.Count > 0)
                {
                    ddl3.DataSource = options;
                    ddl3.DataTextField = "AttributeOptionValue";
                    ddl3.DataValueField = "AttributeOptionValue";
                    ddl3.DataBind();
                    PreSelectDropDown("attDdlAttributeValue", "AttributeValue", e.Item);
                    
                    ddl3.Visible = true;
                    ((TextBox) e.Item.FindControl("attTxtAttributeValue")).Visible = false;
                    ((TextBox) e.Item.FindControl("attTxtAttributeValueCtrlUsed")).Text = "ddl";
                }
                else
                {
                    ddl3.Visible = false;
                    ((TextBox) e.Item.FindControl("attTxtAttributeValue")).Visible = true;
                    ((TextBox) e.Item.FindControl("attTxtAttributeValueCtrlUsed")).Text = "txt";
                }

                // handle display of attribute name
                Literal attLitAttributeName;
                attLitAttributeName = (System.Web.UI.WebControls.Literal)e.Item.FindControl("attLitAttributeName");
                attLitAttributeName.Text = dv["AttributeName"].ToString();
                
                if (attLitAttributeName.Text.Equals("LookupCode"))
                {
                    string lookupCodeValue = dv["AttributeValue"].ToString();
                    attLitAttributeName.Text += " <img src=\"../Images/Icon_Plus.gif\" style=\"cursor: pointer;\" onclick=\"launchLookupCodeFrame('" + lookupCodeValue + "')\">";
                }
            }
            else if(lt == ListItemType.Footer)
            {
                DataGrid dg = (DataGrid)sender;
                ((TextBox) e.Item.FindControl("attTxtFieldIdFooter")).Text = dg.ToolTip;
                DropDownList ddlUnusedAttributes = (DropDownList) e.Item.FindControl("attDdlAddAttributeUnusedAttributes");
                MetadataNewDa MNDa = new MetadataNewDa();
                DataTable unusedAttributes = MNDa.GetAttributesNotUsedForAMetaField(int.Parse(dg.ToolTip));
                ddlUnusedAttributes.Items.Clear();
                ddlUnusedAttributes.DataSource = unusedAttributes;
                ddlUnusedAttributes.DataTextField = "AttributeName";
                ddlUnusedAttributes.DataValueField = "AttributeId";
                ddlUnusedAttributes.DataBind();
                Button btnAdd = (Button) e.Item.FindControl("attBtnEditAttributeSave");
                btnAdd.Attributes.Add("OnClick","javascript: return prepareToSaveNewAttributes(this);");
                
                Button attBtnEditAttribute;
                Button attBtnEditAttributeCancel;
                Button attBtnAddAttribute;
                attBtnEditAttribute = (Button) e.Item.FindControl("attBtnEditAttribute");
                attBtnEditAttribute.Attributes.Add("OnClick","javascript: return EditAttributes(this);");
                attBtnAddAttribute = (Button) e.Item.FindControl("attBtnAddAttribute");
                attBtnAddAttribute.Attributes.Add("OnClick","javascript: return AddNewAttribute(this);");
                attBtnEditAttributeCancel = (Button) e.Item.FindControl("attBtnEditAttributeCancel");
                attBtnEditAttributeCancel.Attributes.Add("OnClick","javascript: return EditAttributesCancel(this);");
                
            }
                
                
                
        }
        protected void dgEtFieldsAttributes_ItemCommand(Object source, System.Web.UI.WebControls.DataGridCommandEventArgs e)
        {
            
            int attributeId;
            int tableId = int.Parse(ddlTableDefs.SelectedValue);
            string tableName = lblEtTableName.Text;
            
            MetadataNewDa MNDa = new MetadataNewDa();
            
            switch (e.CommandName)
            {
                case "Delete":
           
                    attributeId = int.Parse(e.Item.Cells[0].Text);
                    MNDa.DeleteAttribute(attributeId);
                 
                    break;
                
                case "SaveAttributes":  
                    DataGrid dgAttributes = (DataGrid) source;
                    foreach(DataGridItem dgi in dgAttributes.Items)
                    {
                        if (dgi.ItemType == ListItemType.Item || dgi.ItemType  == ListItemType.AlternatingItem)
                        {
                            int fieldAttributeId = int.Parse(dgi.Cells[0].Text);
                            DropDownList ddl = (DropDownList) dgi.FindControl("attDdlAttributeValue");
                            TextBox txt = (TextBox) dgi.FindControl("attTxtAttributeValue");
                            string theValue;
                            if (((TextBox) dgi.FindControl("attTxtAttributeValueCtrlUsed")).Text == "txt")
                            {
                                theValue = txt.Text;
                            }
                            else
                            {
                                theValue = ddl.SelectedValue;
                            }

                            theValue = PageUtil.EscapeSingleQuotesForSql(theValue);
                            MNDa.UpdateAttribute(fieldAttributeId, theValue);
                        }
                    }
                    TextBox txtNewAttributesList = (TextBox)Page.FindControl("attTxtNewAttributesList");
                    
                    string[] atts = txtNewAttributesList.Text.Split(char.Parse("@"));
                    for (int k = 0;k<atts.Length;k++)
                    {
                        string[] anAtt = atts[k].Split(char.Parse(";"));
                        if (anAtt.Length == 3 && PageUtil.IsInteger(anAtt[0]) && PageUtil.IsInteger(anAtt[1]))
                        {
                            string attValue = PageUtil.EscapeSingleQuotesForSql(anAtt[2]);

                            MNDa.DeleteAttribute(int.Parse(anAtt[0]),int.Parse(anAtt[1]));
                            MNDa.AddAttribute(int.Parse(anAtt[0]), int.Parse(anAtt[1]), attValue);
                        }
                    }
                    txtNewAttributesList.Text = "";
                break;
            }
            viewMode = "editTable";
            setViewMode();
            updateEditTableView(tableId,tableName);
        }
        protected void dgOptionsForAnAttribute_ItemCommand(Object source, System.Web.UI.WebControls.DataGridCommandEventArgs e)
        {
            viewMode = "EditAnAttribute";
            setViewMode();

            string optionValue;
            int attributeId;
            attributeId = int.Parse(txtEditAnAttributeId.Text);
            MetadataNewDa MNDa = new MetadataNewDa();

            switch (e.CommandName)
            {
                case "Delete":

                    optionValue = ((Literal)e.Item.Cells[0].Controls[1]).Text;
                    MNDa.DeleteAttributeValueOption(attributeId, optionValue);
                    loadAttributeValueOptionsForAnAttribute(attributeId);
                    break;
                case "Add":
                    optionValue = ((TextBox)e.Item.FindControl("txtNewOption")).Text;
                    MNDa.AddAttributeValueOption(attributeId,optionValue);
                    loadAttributeValueOptionsForAnAttribute(attributeId);
                    break;

            }
        }
        #region Add and edit attribute options
            
        protected void btnEditAnAttribute_onClick(object sender, EventArgs e)
        {
            MetadataNewDa MNDa = new MetadataNewDa();
            
            viewMode = "EditAnAttribute";
            setViewMode();
            int attributeId = -1;
            Button btn = (Button)sender;
            switch (btn.Text)
            {
                case "Edit attribute":
                    attributeId = int.Parse(ddlEditAnAttribute.SelectedValue);
                    break;
                case "Next":
                    attributeId = int.Parse(lblCreateNewAttributeId.Text);
                    break;
                case "Save":
                    attributeId = int.Parse(txtEditAnAttributeId.Text);
                    string attributeName = txtEditAnAttributeName.Text;
                    if(attributeName.Length > 0)
                    {
                        MNDa.UpdateAttributeName(attributeId,attributeName);
                    }
                    break;
                case "Cancel":
                    attributeId = int.Parse(txtEditAnAttributeId.Text);
                    break;
            }
            DataTable dtA = MNDa.GetAnAttribute(attributeId);
            txtEditAnAttributeId.Text = dtA.Rows[0]["AttributeId"].ToString();
            txtEditAnAttributeName.Text = dtA.Rows[0]["AttributeName"].ToString();

            loadAttributeValueOptionsForAnAttribute(attributeId);
        }
        protected void loadAttributeValueOptionsForAnAttribute(int attributeId)
        {
            MetadataNewDa MNDa = new MetadataNewDa();
            
            DataTable dtAO = MNDa.GetAttributeValueOptionsForAnAttributeWithUsageInfo(attributeId);
            dgOptionsForAnAttribute.DataSource = dtAO.DefaultView;
            dgOptionsForAnAttribute.DataBind();
         
        }
        protected void btnAddAnAttribute_onClick(object sender, EventArgs e)
        {
            string newAttName = txtNewAttributeName.Text;
            string result = "";
            MetadataNewDa MNDa = new MetadataNewDa();
            if (newAttName.Length > 0)
            {
                if (MNDa.AttributeExists(newAttName))
                {
                    result = "An attribute called '" + newAttName + "' already exists. The new attribute was not created.";
                    btnCreateNewAttributeNext.Visible = false;
                }
                {
                    try
                    {
                        MNDa.CreateNewAttribute(newAttName);
                        result = "The new attribute '" + newAttName + "' was successfully created.";
                        btnCreateNewAttributeNext.Visible = true;
                    }
                    catch (Exception err)
                    {
                        result = "An error occured while creating the new attribute '" + newAttName + "'. The attribute was not added.";
                        btnCreateNewAttributeNext.Visible = false;
                    }
                }
            }
            lblCreateNewAttributeResult.Text = result;
            lblCreateNewAttributeName.Text = newAttName;
            lblCreateNewAttributeId.Text = MNDa.GetAnAttribute(newAttName).Rows[0]["AttributeId"].ToString();
            viewMode = "createNewAttributeStep2";
            setViewMode();
        } 
        #endregion
        //NB! Not complete, add more datatypes!
        private string ParseSQLDatatypeToCsharp(string sqlDatatype)
        {
            string rtrn = sqlDatatype;
            switch (sqlDatatype)
            {
                case "varchar":
                rtrn = "string";
                break;
                case "bit":
                rtrn = "bool";
                break;
                case "datetime":
                rtrn = "Datetime";
                break;
            }
            return rtrn;
        }
		#region Web Form Designer generated code
		override protected void OnInit(EventArgs e)
		{
			//
			// CODEGEN: This call is required by the ASP.NET Web Form Designer.
			//
			InitializeComponent();
			/*if(!Page.IsPostBack)
			{
			    buildNewAttributesTemplateTable();
			}*/
			base.OnInit(e);
		}
		
		/// <summary>
		/// Required method for Designer support - do not modify
		/// the contents of this method with the code editor.
		/// </summary>
		private void InitializeComponent()
		{    
			this.Load += new System.EventHandler(this.Page_Load);
		}
		#endregion
	}
}
