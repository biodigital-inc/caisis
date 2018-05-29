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
using Caisis.BOL;
using Caisis.UI.Core.Classes.CustomControls;
using Caisis.DataAccess;
using System.Collections.Specialized;
using System.Linq;

namespace Caisis.UI.Modules.ProtocolMgmt
{
    public partial class AdminSchemaItemChildTableGrid : ProtocolMgmtBaseShemaItemControl
    {
        protected class CICCombined
        {
            public ICaisisInputControl CICParent;
            public ICaisisInputControl CICChild;
        }

        class _ProtocolCICHelper : CICHelper
        {
            private const string CONTROLTYPE = "ControlType";
            private static readonly string[] AUDIT_FIELD_NAMES = new string[] { "EnteredBy", "EnteredTime", "UpdatedBy", "UpdatedTime", "LockedBy", "LockedTime" };

            // copy and paste; ugh, but you c/n override static methods
            public static List<ICaisisInputControl> GetCaisisInputControlsByTableName(string tableName)
            {
                List<ICaisisInputControl> cicList = new List<ICaisisInputControl>();
                // get metadata
                var fieldMetadata = ProtocolMgmtController.GetTableFieldsMetadata(tableName);
                foreach (var field in fieldMetadata)
                {
                    string fieldName = field.Key;
                    Dictionary<string, string> metadata = new Dictionary<string, string>(field.Value);
                    bool required = BOL.BusinessObject.IsRequired(tableName, fieldName, null); 
                    string controlType = metadata.ContainsKey(CONTROLTYPE) ? metadata[CONTROLTYPE] : "";
                    if (controlType.Equals("")) controlType = typeof(CaisisTextBox).Name;

                    // eliminate LookupDistinct that references PatientId, UserName
                    if (metadata.ContainsKey("LookupDistinct"))
                    {
                        string lkpDistint = metadata["LookupDistinct"];
                        if (!string.IsNullOrEmpty(lkpDistint) && lkpDistint.Contains("@"))
                        {
                            metadata.Remove("LookupDistinct");
                        }
                    }

                    ICaisisInputControl cic = InvokeInputControl(controlType);
                    cic.Field = fieldName;
                    cic.Table = tableName;
                    cic.ShowLabel = false;
                    cic.CssClass = "DynamicControlsClass";

                    if (cic is WebControl)
                    {
                        ((WebControl)cic).Style.Add("height", "20px");
                    }

                    // set its metadata based attributes
                    SetCICAttributes(cic, metadata);

                    // set required from db if not set via metadata
                    if (!cic.Required && !string.IsNullOrEmpty(tableName) && !string.IsNullOrEmpty(fieldName))
                    {
                        if (BOL.BusinessObjectFactory.CanBuildBusinessObject(tableName))
                        {
                            cic.Required = BOL.BusinessObject.IsRequired(tableName, fieldName);
                        }
                    }

                    //if (!(cic is CaisisHidden))
                    cicList.Add(cic);

                }
                return cicList;
            }

            public static ICaisisInputControl InvokeInputControl(string controlType)
            {
                switch (controlType)
                {
                    case "CaisisCheckBox":
                        return new _ProtocolCheckBox();
                    default:
                        return CICHelper.InvokeInputControl(controlType);
                }
            }
        }

        class _ProtocolCheckBox : CaisisCheckBox, ICaisisInputControl
        {
            private string _value;

            string ICaisisInputControl.Value
            {
                get { return _value; }
                set
                {
                    _value = value;

                    if (_value == "1" || _value.ToLower() == "on" || _value.ToLower() == "true")
                        this.Checked = true;
                    else
                        this.Checked = false;
                }
            }

            protected override bool LoadPostData(string postDataKey, System.Collections.Specialized.NameValueCollection postCollection)
            {
                _value = postCollection[postDataKey];
                return base.LoadPostData(postDataKey, postCollection);
            }
        }

        protected enum Row_Actions
        {
            Delete = 1,
            Update = 2
        };

        private string TableName;
        private bool ParentTable;
        private List<ICaisisInputControl> fieldList = null;
        private Dictionary<string, Dictionary<string, DataRow>> existingData;
        private StringDictionary dictCollectOptions;

        private const int BLANK_ROWS = 20;

        private bool bSchemaCanBeDeleted = true;
        private bool bSchemaItemCanBeDeleted = true;

        protected List<ICaisisInputControl> FieldList
        {
            get
            {
                //if (fieldList == null)
                {
                    fieldList = _ProtocolCICHelper.GetCaisisInputControlsByTableName(TableName);
                }
                return fieldList;
            }

        }

        protected override void OnInit(EventArgs e)
        {
            base.OnInit(e);

            // SUPRESS UI Columns

            // supress rending hidden header fields
            RepeaterChildTableOpt.ItemDataBound += SupressHiddenFieldColumns;
            RepeaterChildTableHeader.ItemCreated += (a, b) =>
                {
                };
            // supress rendeing hidden columns in each grid row
            ChildTableGridView.ItemCreated += (a, b) =>
                {
                    // locate columns rptr
                    Repeater childTableColRptr = b.Item.FindControl("ChildTableColRptr") as Repeater;
                    childTableColRptr.ItemDataBound += SupressHiddenFieldColumns;
                };
        }

        /// <summary>
        /// Supresses visibility of item based on caisis input type of item
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void SupressHiddenFieldColumns(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                CheckBox cb = e.Item.FindControl("CollectOptions") as CheckBox;
                ICaisisInputControl cicField = e.Item.DataItem as ICaisisInputControl;
                if (cicField != null)
                {
                    // supress item visibility for hidden controls
                    if (cicField is CaisisHidden)
                    {
                        //e.Item.Visible = false;
                    }
                 }
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        public override bool LoadControl(string tableName, string schemaItemId, bool bParentTable, bool bCreateNew)
        {
            TableName = tableName;
            ParentTable = bParentTable;
            SelectedChildTableName.Text = tableName;

            bSchemaCanBeDeleted = !(HavePatientsBeenAssigned(schemaItemId));
            bSchemaItemCanBeDeleted = !(HasTimelineBeenCreated(schemaItemId));

            // Get existing values from database
            bool bDataExists = GetExistingData(tableName, schemaItemId);

            // Change Add Row Button to point to current repeater
            SetAddRowButton();

            if (!IsPostBack)
                BindHeaders();

            // Store the column collection options
            StoreCollectOptions();

            PopulateChildTable(tableName, schemaItemId, bParentTable);

            return bDataExists;
        }

        protected bool HasTimelineBeenCreated(string schemaItemId)
        {
            int nSchemaitemId;

            bool TimelineCreated = true;

            if (Int32.TryParse(schemaItemId, out nSchemaitemId))
            {
                TimelineCreated = ProtocolMgmtDa.HasTimelineBeenCreated(nSchemaitemId);
            }

            return TimelineCreated;
        }

        protected bool HavePatientsBeenAssigned(string schemaItemId)
        {
            int nSchemaitemId;

            bool PatientsAssigned = true;

            if (Int32.TryParse(schemaItemId, out nSchemaitemId))
            {
                PatientsAssigned = ProtocolMgmtDa.HavePatientsBeenAssignedToSchema(nSchemaitemId);
            }

            return PatientsAssigned;
        }

        public override void SaveControl(int schemaItemId, bool bParentTable, bool bCreateNew)
        {
            Panel pnl = Page.FindControl(TableName + "Holder") as Panel;

            if (pnl != null)
            {
                // primary key for already saved values
                int nPrimaryKey = -1;

                int nFieldRowIndex = -1;

                // if FieldRowIndex hidden field is set to -1 then delete the record
                // otherwise, insert the record
                bool bSkipRow = true;

                Row_Actions action = Row_Actions.Update;

                int DisplayOrder = 0;

                foreach (ICaisisInputControl c in ExtractCaisisInputControls(pnl))
                {
                    if (c is CaisisHidden && (c.Field == null || !c.Field.EndsWith("Date")))
                    {
                        CaisisHidden csHidden = c as CaisisHidden;
                        if (csHidden.ID == "SchemaItemFieldId")
                        {
                            Int32.TryParse(csHidden.Value, out nPrimaryKey);

                            if (bCreateNew)
                                nPrimaryKey = -1;
                        }
                        else if (csHidden.ID == "FieldRowIndex")
                        {
                            DisplayOrder = 0;

                            // Adjust FieldRowIndex so they are sequential
                            if (!String.IsNullOrEmpty(csHidden.Value))
                            {
                                bSkipRow = false;

                                if (csHidden.Value == "-1")
                                    action = Row_Actions.Delete;
                                else
                                {
                                    action = Row_Actions.Update;

                                    nFieldRowIndex++;
                                }
                            }
                            else
                                bSkipRow = true;
                        }
                    }
                    else if (!bSkipRow)
                    {
                        // if no check boxes checked and a new record, don't save
                        if (!OptionsSelected()
                            && nPrimaryKey <= 0)
                            continue;

                        SchemaItemField field = new SchemaItemField();
                        field.Get(nPrimaryKey);

                        // If csHidden.Value == -1 then delete
                        if (action == Row_Actions.Update)
                        {
                            AdjustFieldValueSave(c);

                            if (!String.IsNullOrEmpty(c.Value))
                            {
                                field[SchemaItemField.FieldRowIndex] = nFieldRowIndex;
                                field[SchemaItemField.SchemaItemId] = schemaItemId;
                                field[SchemaItemField.DestTable] = c.Table;
                                field[SchemaItemField.DestField] = c.Field;
                                field[SchemaItemField.DestValue] = c.Value;
                                field[SchemaItemField.DisplayOrder] = DisplayOrder++;

                                field.Save();
                            }
                            else
                            {
                                if (!field.IsNull(SchemaItemField.SchemaItemFieldId))
                                {
                                    int schemaItemFieldId = (int)field[SchemaItemField.SchemaItemFieldId];
                                    ProtocolMgmtDa.DeleteSchemaItemField(schemaItemFieldId);
                                }                               
                            }
                        }
                        else if (action == Row_Actions.Delete)
                        {
                            if (!field.IsNull(SchemaItemField.SchemaItemFieldId))
                            {
                                int schemaItemFieldId = (int)field[SchemaItemField.SchemaItemFieldId];
                                ProtocolMgmtDa.DeleteSchemaItemField(schemaItemFieldId);
                            }
                        }
                    }
                }
            }
        }

        protected bool OptionsSelected()
        {
            foreach (string s in dictCollectOptions.Values)
            {
                if (!String.IsNullOrEmpty(s))
                    return true;
            }

            return false;
        }

        // Adjust values to correspond to collect options
        protected void AdjustFieldValueSave(ICaisisInputControl c)
        {
            if (c != null)
            {
                bool isDateField = c.Field.EndsWith("Date");
                // special case for Date fields
                if (isDateField)
                {
                    // find DateText field in same row
                    var row = (c as Control).NamingContainer.NamingContainer;
                    var dateTextFields = from cic in ExtractCaisisInputControls(row)
                                         where cic.Field == c.Field + "Text"
                                         select cic;
                    // if there is a corrosponding date text field, use control for value
                    if (dateTextFields.Count() > 0)
                    {
                        var dateField = c;
                        var dateTextField = dateTextFields.First();
                        // adjust Date field to match DateText
                        DateTime testDate = DateTime.Now;
                        if (dictCollectOptions[dateTextField.Field].ToLower() == "true")
                        {
                            // if a valid date, set to that date
                            if (!string.IsNullOrEmpty(dateTextField.Value) && DateTime.TryParse(dateTextField.Value, out testDate))
                            {
                                c.Value = dateTextField.Value;
                            }
                            // other blank out
                            else
                            {
                                c.Value = "[enter]";
                            }
                        }
                        // if DateText field not collected, clear Date field value
                        else if (dictCollectOptions[dateTextField.Field].ToLower() == "false")
                        {
                            c.Value = string.Empty;
                        }
                    }
                    else
                    {
                        c.Value = string.Empty;
                    }
                }
                else
                {
                    if (dictCollectOptions.ContainsKey(c.Field.ToLower()))
                    {
                        if (dictCollectOptions[c.Field].ToLower() == "true"
                            && String.IsNullOrEmpty(c.Value))
                            c.Value = "[enter]";
                        else if (dictCollectOptions[c.Field].ToLower() == "false")
                            c.Value = String.Empty;
                    }
                }
            }
        }

        // Adjust values to correspond to collect options
        protected void AdjustFieldValueLoad(ICaisisInputControl cic)
        {
            if (dictCollectOptions.ContainsKey(cic.Field.ToLower()))
            {
                if (dictCollectOptions[cic.Field].ToLower() == "false")
                {
                    cic.CssClass = "UnEditable";
                    if (cic is WebControl)
                        ((WebControl)cic).Attributes.Add("disabled", "true");
                }
                else if (cic.Value == "[enter]")
                    cic.Value = String.Empty;
            }
        }

        // Change Add Row Button to point to current repeater
        protected void SetAddRowButton()
        {
            buttonAddNewChildTableCol.OnClientClick = "showAddNewRow('" + MainTable.ClientID + "'); return false;";
        }

        // Store the choices made for collecting items
        protected void StoreCollectOptions()
        {
            dictCollectOptions = new StringDictionary();

            foreach (RepeaterItem riOpt in RepeaterChildTableOpt.Items)
            {
                CheckBox cb = riOpt.FindControl("CollectOptions") as CheckBox;

                if (cb != null)
                {
                    Label childTableColumnName = RepeaterChildTableHeader.Items[riOpt.ItemIndex].FindControl("ChildTableColumnNameHidden") as Label;
                    if (childTableColumnName != null)
                    {
                        if (Request.Form[cb.UniqueID] != null)
                            dictCollectOptions.Add(childTableColumnName.Text, Request.Form[cb.UniqueID] == "on" ? "true" : "false");
                        else
                            dictCollectOptions.Add(childTableColumnName.Text, cb.Checked.ToString());
                    }
                }
            }
        }

        protected void PopulateChildTable(string tableName, string schemaItemId, bool bParentTable)
        {
            if (String.IsNullOrEmpty(tableName))
                return;

            int nSchemaItemId = -1;
            if (Int32.TryParse(schemaItemId, out nSchemaItemId))
            {
                DataTable dtChildRows = ProtocolMgmtDa.GetChildRowsBySchemaItemId(nSchemaItemId, tableName, bParentTable);

                for (int i = 0; i < BLANK_ROWS; i++)
                {
                    DataRow dr = dtChildRows.NewRow();
                    if (i == 0
                        && dtChildRows.Rows.Count == 0)
                    {
                        dr["FieldRowIndex"] = 0;
                    }
                    dtChildRows.Rows.Add(dr);
                }
                ChildTableGridView.DataSource = dtChildRows;
                ChildTableGridView.DataBind();
            }
        }

        protected void AssignCheckBoxes(object sender, RepeaterItemEventArgs e)
        {
            RepeaterItem ItemRow = e.Item;
            if (ItemRow.ItemType == ListItemType.Item
                || ItemRow.ItemType == ListItemType.AlternatingItem)
            {
                ICaisisInputControl cicField = ItemRow.DataItem as ICaisisInputControl;

                // Attach event to control item appearance
                CheckBox cb = ItemRow.FindControl("CollectOptions") as CheckBox;
                if (cb != null)
                {
                    cb.Attributes.Add("onclick", "checkBoxSelectionChanged('" + MainTable.ClientID + "', " + ItemRow.ItemIndex + ",'" + cb.ClientID + "');");
                    if (cicField != null && cicField.Required)
                    {
                        cb.Checked = true;
                        cb.Attributes["onclick"] = "return handleRequiredSchemaItemCheck(this);";
                    }
                }
                                
                if (cicField != null)
                {
                    // Return so option selections are not reloaded
                    if (IsPostBack)
                        return;

                    string key = "";
                    foreach (string s in existingData.Keys)
                    {
                        key = s;
                        break;
                    }

                    if (existingData.ContainsKey(key))
                    {
                        Dictionary<string, DataRow> rowData = existingData[key];

                        if (rowData.ContainsKey(cicField.Field))
                        {
                            DataRow dr = rowData[cicField.Field];
                            if (dr != null)
                            {
                                string val = dr[SchemaItemField.DestValue].ToString();
                                if (!String.IsNullOrEmpty(val)
                                    || val == "[enter]")
                                {
                                    cb.Checked = true;
                                }
                            }
                        }
                    }
                }
            }
        }

        protected void BindHeaders()
        {
            //Bind checkboxes
            if (RepeaterChildTableOpt != null)
            {
                RepeaterChildTableOpt.DataSource = FieldList;
                RepeaterChildTableOpt.DataBind();
            }

            if (RepeaterChildTableHeader != null)
            {
                RepeaterChildTableHeader.DataSource = FieldList;
                RepeaterChildTableHeader.DataBind();
            }
        }

        protected void BindChildRepeaters(object sender, RepeaterItemEventArgs e)
        {
            RepeaterItem ItemRow = e.Item;
            if (ItemRow.ItemType == ListItemType.Item
                || ItemRow.ItemType == ListItemType.AlternatingItem)
            {
                Repeater childTableColRptr = e.Item.FindControl("ChildTableColRptr") as Repeater;

                //THIS NEEDS TO BE CACHED
                if (childTableColRptr != null)
                {
                    childTableColRptr.DataSource = FieldList;
                    childTableColRptr.DataBind();
                }

                Button btnDelete = ItemRow.FindControl("btnDeleteRow") as Button;
                if (btnDelete != null)
                {
                    string schemaItemId = DataBinder.Eval(ItemRow.DataItem,"SchemaItemId").ToString();
                    if (!bSchemaCanBeDeleted
                        || String.IsNullOrEmpty(schemaItemId))
                        btnDelete.Visible = false;
                    btnDelete.OnClientClick = "$('" + btnDelete.UniqueID + "').style.display = 'none'; setGridRowState('" + ItemRow.FindControl("FieldRowIndex").ClientID + "', '-1'); return false;";
                }
            }
        }

        protected void AddDynamicControls(object sender, RepeaterItemEventArgs e)
        {
            RepeaterItem ItemRow = e.Item;
            if (ItemRow.ItemType == ListItemType.Item 
                || ItemRow.ItemType == ListItemType.AlternatingItem)
            {
                PlaceHolder cicControlHolder = ItemRow.FindControl("cicControlHolder") as PlaceHolder;

                // Get Hidden Value contained in the parent row
                RepeaterItem parentRepeaterItem = ((Repeater)sender).Parent as RepeaterItem;
                if (parentRepeaterItem != null)
                {
                    CaisisHidden fieldRowIndex = parentRepeaterItem.FindControl("FieldRowIndex") as CaisisHidden;
                    CaisisHidden schemaItemFieldId = ItemRow.FindControl("SchemaItemFieldId") as CaisisHidden;

                    if (cicControlHolder != null)
                    {
                        cicControlHolder.Controls.Add(ItemRow.DataItem as Control);
                         
                        ICaisisInputControl cic = ItemRow.DataItem as ICaisisInputControl;
                        if (cic != null)
                        {
                            if (existingData.ContainsKey(fieldRowIndex.Value))
                            {
                                Dictionary<string, DataRow> rowData = existingData[fieldRowIndex.Value];
                                if (rowData.ContainsKey(cic.Field))
                                {
                                    if (!IsPostBack)
                                        cic.Value = rowData[cic.Field]["DestValue"].ToString();

                                    // Set hidden field with SchemaitemFieldId
                                    if (schemaItemFieldId != null)
                                    {
                                        schemaItemFieldId.Value = rowData[cic.Field][SchemaItemField.SchemaItemFieldId].ToString();
                                    }
                                }
                            }

                            AdjustFieldValueLoad(cic);
                        }
                    }
                }
            }
        }

        protected void DeleteSchemaItemRow(object sender, CommandEventArgs e)
        {
            Button btn = sender as Button;
            int schemaItemId = int.Parse(e.CommandArgument.ToString());
            Repeater schemaItemFieldRptr = btn.NamingContainer.FindControl("ChildTableColRptr") as Repeater;
            // step 1: for each schema item field in row, delete
            foreach (RepeaterItem itemField in schemaItemFieldRptr.Items)
            {
                string sifid = (itemField.FindControl("SchemaItemFieldId") as ICaisisInputControl).Value;
                if (!string.IsNullOrEmpty(sifid))
                {
                    int schemaItemFieldId = int.Parse(sifid);
                    ProtocolMgmtDa.DeleteSchemaItemField(schemaItemFieldId);
                }
            }
            // step 2: fix indexes
            string username = new Caisis.Security.SecurityController().GetUserName();
            ProtocolMgmtDa.FixSchemaItemIndexes(schemaItemId, username);
            // step 3: rebuild form        
            // TODO: cleaner way of doing
            Response.Redirect(Request.RawUrl);
        }


        /// <summary>
        /// Store Field Values from SchemaItemFields table
        /// </summary>
        /// <param name="protocolSchemaId"></param>
        /// <returns></returns>
        protected bool GetExistingData(string tableName, string schemaItemId)
        {
            if (!String.IsNullOrEmpty(schemaItemId))
            {
                existingData = new Dictionary<string, Dictionary<string, DataRow>>();

                bool handledTableSelect = false;

				//SchemaItemField fields = new SchemaItemField();
				//fields.GetByParent(Int32.Parse(schemaItemId));

                // Need to sort records to know where the new record begins
                //DataView dvFields = fields.DataSourceView;
				DataView dvFields = BusinessObject.GetByParentAsDataView<SchemaItemField>(int.Parse(schemaItemId));
                dvFields.RowFilter = "DestTable='" + tableName + "'";
                dvFields.Sort = "FieldRowIndex ASC";

                string currFieldRowIndex = "-1";

                Dictionary<string, DataRow> rowData = new Dictionary<string, DataRow> ();

                foreach (DataRow row in dvFields.ToTable().Rows)
                {
                    if (currFieldRowIndex != row[SchemaItemField.FieldRowIndex].ToString())
                    {
                        rowData = new Dictionary<string, DataRow>();
                        currFieldRowIndex = row[SchemaItemField.FieldRowIndex].ToString();
                        existingData[currFieldRowIndex] = rowData;
                    }
                    rowData[row[SchemaItemField.DestField].ToString()] = row;
                }
            }
            else
            {
                existingData = new Dictionary<string, Dictionary<string, DataRow>>();
            }

            return existingData.Count > 0 ? true : false;
        }

        // Get all child Caisis Controls in a Control
        IEnumerable<ICaisisInputControl> ExtractCaisisInputControls(Control control)
        {
            if (control is ICaisisInputControl)
            {
                yield return control as ICaisisInputControl;
            }

            foreach (Control c in control.Controls)
            {
                foreach (ICaisisInputControl i in ExtractCaisisInputControls(c))
                {
                    yield return i;
                }
            }
        }

        public string SetRowVisibility(string index, string pkId)
        {
            if (String.IsNullOrEmpty(pkId)
                && index != "0")
                return "none";
            else
                return "";
        }
    }
}