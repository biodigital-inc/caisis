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
using Caisis.UI.Core.Classes.CustomControls;
using System.Collections.Generic;
using Caisis.DataAccess;
using System.Collections.Specialized;

using System.Linq;

namespace Caisis.UI.Modules.ProtocolMgmt
{
    public partial class AdminSchemaItemList : ProtocolMgmtBaseShemaItemControl
    {
        #region nested Protocol Manager extensions of CaisisInputControls, helpful only on this page

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
            public static List<CICCombined> GetCaisisInputControlsByTableName(string tableName)
            {
                List<CICCombined> cicList = new List<CICCombined>();
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

                    // set its metadata based attributes
                    SetCICAttributes(cic, metadata);

                    // set required from db if not set via metadata
                    if (!cic.Required && BOL.BusinessObjectFactory.CanBuildBusinessObject(tableName))
                    {
                        cic.Required = required;
                    }

                    CICCombined cicCombined = new CICCombined();
                    cicCombined.CICParent = cic;

                    // if it's a fuzzy date, add to the previous control
                    if (cicList.Count() > 0 && cic is CaisisHidden)
                    {
                        CICCombined cicTop = cicList[cicList.Count - 1];
                        if (cicTop.CICParent is CaisisTextBox
                            && ((CaisisTextBox)cicTop.CICParent).CalcDate)
                        {
                            cicTop.CICChild = cic;
                        }
                        else
                        {
                            // Add control to Control list
                            cicList.Add(cicCombined);
                        }
                    }
                    else
                    {
                        // Add control to Control list
                        cicList.Add(cicCombined);
                    }
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

        #endregion

        class _ProtocolCheckBox : CaisisCheckBox, ICaisisInputControl
        {
            private string _value;

            string ICaisisInputControl.Value
            {
                get
                {
                    return _value;
                }
                set
                {
                    if (value != null && value != "" && value != "0" && value.ToLower() != "false" && value.ToLower() != "no" && value.ToLower() != "[enter]")
                    {
                        this.Checked = true;
                        _value = value;
                    }
                    else
                    {
                        this.Checked = false;
                        _value = value;
                    }
                }
            }

            protected override bool LoadPostData(string postDataKey, System.Collections.Specialized.NameValueCollection postCollection)
            {
                _value = postCollection[postDataKey];
                return base.LoadPostData(postDataKey, postCollection);
            }
        }

        private Dictionary<string, DataRow> existingData;
        private StringDictionary dictCBList;

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

        
        protected void Page_Load(object sender, EventArgs e)
        {
            int i = 1;
        }

        public override bool LoadControl(string tableName, string schemaItemId, bool bParentTable, bool bCreateNew)
        {
            GetExistingData();

            TableName.Text = tableName;

            if (IsPostBack)
            {
                StoreCheckBoxes();
            }
            
            if (!string.IsNullOrEmpty(tableName))
            {
                BuildDynamicControls(tableName);
            }

            return true;
        }

        public override void SaveControl(int schemaItemId, bool bParentTable, bool bCreateNew)
        {
            int DisplayOrder = 0;

            IEnumerable<ICaisisInputControl>  list = ExtractCaisisInputControls(SchemaItemsListRptr);
            foreach (ICaisisInputControl c in list)
            {
                if (existingData.ContainsKey(c.Field))
                {
                    DataRow fieldRow = existingData[c.Field];
                    int fieldId = (int)fieldRow[SchemaItemField.SchemaItemFieldId];
                    if (bCreateNew)
                        fieldId = -1;
                    SchemaItemField field = new SchemaItemField();

                    AdjustFieldValue(c);

                    if (string.IsNullOrEmpty(c.Value) && !c.Required)
                    {
                        // delete the field
                        //field.Delete(fieldId);
                        ProtocolMgmtDa.DeleteSchemaItemField(fieldId);
                    }
                    else
                    {
                        // update the field
                        field.Get(fieldId);
                        field[SchemaItemField.SchemaItemId] = schemaItemId;
                        field[SchemaItemField.DestTable] = c.Table;
                        field[SchemaItemField.DestField] = c.Field;
                        field[SchemaItemField.DestValue] = c.Value;
                        field[SchemaItemField.DisplayOrder] = DisplayOrder++;
                        field[SchemaItemField.FieldRowIndex] = DBNull.Value;

                        field.Save();
                    }
                }
                else
                {
                    // for new fields
                    // insert

                    AdjustFieldValue(c);

                    if (!string.IsNullOrEmpty(c.Value) || c.Required)
                    {
                        SchemaItemField field = new SchemaItemField();
                        field[SchemaItemField.SchemaItemId] = schemaItemId;
                        field[SchemaItemField.DestTable] = c.Table;
                        field[SchemaItemField.DestField] = c.Field;
                        field[SchemaItemField.DestValue] = c.Value;
                        field[SchemaItemField.DisplayOrder] = DisplayOrder++;
                        field[SchemaItemField.FieldRowIndex] = DBNull.Value;

                        field.Save();
                    }
                }
            }
        }

        private string GetFieldValue(string fieldName)
        {
            // if existing record and it has data
            // populate the field with that data
            if (existingData != null
                && existingData.ContainsKey(fieldName))
            {
                string val = existingData[fieldName][SchemaItemField.DestValue].ToString();

                return val;
            }

            return String.Empty;
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

        private int SaveField(int itemId, SchemaItemField field, ICaisisInputControl c, int DisplayOrder)
        {
            field[SchemaItemField.SchemaItemId] = itemId;
            field[SchemaItemField.DestTable] = c.Table;
            field[SchemaItemField.DestField] = c.Field;
            field[SchemaItemField.DestValue] = c.Value;
            field[SchemaItemField.DisplayOrder] = DisplayOrder++;

            field.Save();

            return DisplayOrder;
        }

        private Dictionary<string, DataRow> GetExistingData()
        {
            if (SchemaItemId != -1)
            {
                existingData = new Dictionary<string, DataRow>();

				//SchemaItemField fields = new SchemaItemField();
				//fields.GetByParent(SchemaItemId);

				DataView view = BusinessObject.GetByParentAsDataView<SchemaItemField>(SchemaItemId);

                //foreach (DataRow row in fields.GetTable().Rows)
				foreach (DataRow row in view.Table.Rows)
                {
                    existingData[row[SchemaItemField.DestField].ToString()] = row;
                }
            }
            else
            {
                existingData = new Dictionary<string, DataRow>();
            }

            return existingData;
        }

        protected void StoreCheckBoxes()
        {
            dictCBList = new StringDictionary();

            for (int i = 0; i < SchemaItemsListRptr.Items.Count; i++)
            {
                RepeaterItem item = SchemaItemsListRptr.Items[i];
                if (item.ItemType == ListItemType.Item
                    || item.ItemType == ListItemType.AlternatingItem)
                {
                    CheckBox cb = item.FindControl("CheckBoxCollect") as CheckBox;
                    string searchString = cb.UniqueID.Substring(0, cb.UniqueID.LastIndexOf(IdSeparator));
                    if (cb != null
                        && Request.Form[cb.UniqueID] != null)
                    {
                        dictCBList.Add(searchString, Request.Form[cb.UniqueID] == "on" ? "true" : "false");
                    }
                    else
                        dictCBList.Add(searchString, "false");
                }
            }
        }

        void BuildDynamicControls(string tablename)
        {
            if (string.IsNullOrEmpty(tablename))
                return;

            SchemaItemsListRptr.DataSource = _ProtocolCICHelper.GetCaisisInputControlsByTableName(tablename);
            SchemaItemsListRptr.DataBind();
        }

        // Add dynamic Caisis controls
        protected void PopulateItemValues(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item ||
              e.Item.ItemType == ListItemType.AlternatingItem)
            {

                PlaceHolder presetPanel =
                       (PlaceHolder)e.Item.FindControl("DynamicControlHolder");
                if (presetPanel != null)
                {
                    if (e.Item.DataItem is CICCombined)
                    {
                        CICCombined _c = e.Item.DataItem as CICCombined;
                        if (_c.CICParent is ICaisisInputControl)
                        {
                            ICaisisInputControl cisControl = _c.CICParent as ICaisisInputControl;
                            cisControl.ShowLabel = false;

                            Label attrName =
                                (Label)e.Item.FindControl("ItemAttrName");
                            if (cisControl.Required)
                            {
                                attrName.CssClass = "requiredField";
                            }

                            CheckBox checkBoxCollect = (CheckBox)e.Item.FindControl("CheckBoxCollect");

                            if (attrName != null)
                            {
                                attrName.Text = cisControl.FieldLabel;
                            }

                            string controlValue = GetFieldValue(cisControl.Field);

                            if (String.IsNullOrEmpty(controlValue)
                                || controlValue.Equals("[enter]"))
                                cisControl.CssClass = "UnEditable";

                            presetPanel.Controls.Add((Control)_c.CICParent);

                            // Populate radio buttons and controls
                            if (!IsPostBack)
                            {
                                RestoreRadioButtonsState(controlValue, e.Item);
                                cisControl.Value = controlValue == "[enter]" ? "" : controlValue;
                            }

                            if (_c.CICChild != null
                                && _c.CICChild is CaisisHidden)
                            {
                                _c.CICChild.Value = GetFieldValue(_c.CICChild.Field);
                                presetPanel.Controls.Add((Control)_c.CICChild);
                            }

                            // add events so the entry item changes its state
                            AddOnClickEventsToRBs(e.Item, _c);

                            AddOnClickEventsToControls(e.Item, _c.CICParent);

							HandleNonNullFields(e.Item, _c.CICParent);
                        }
                    }
                }
            }
        }

		private void HandleNonNullFields(RepeaterItem item, ICaisisInputControl ic)
		{
			CheckBox cb = item.FindControl("CheckBoxCollect") as CheckBox;

			if (cb != null)
			{
				string tablename = ic.Table;
				string fieldname = ic.Field;

                // field which don't allow null
				if (!Caisis.BOL.BusinessObject.AllowsNullValues(tablename, fieldname))
				{
					cb.Checked = true;
				   //cb.Enabled = false;
				}
                // fields which are required have to by checked and cannot be unchecked
                if (ic.Required)
                {
                    cb.Checked = true;
                    cb.Attributes["onclick"] = "return handleRequiredSchemaItemCheck(this);";
                }
			}
		}

        protected void RestoreRadioButtonsState(string controlValue, RepeaterItem item)
        {
            // Populate check box
            CheckBox selectedCheckBox = (CheckBox)item.FindControl("CheckBoxCollect");
            if (selectedCheckBox != null)
            {
                if (!String.IsNullOrEmpty(controlValue))
                {
                    selectedCheckBox.Checked = true;
                }
                else
                {
                    selectedCheckBox.Checked = false;
                }
            }
        }

        // Change field value for save according to the radio buttons
        protected void AdjustFieldValue(ICaisisInputControl c)
        {
            if (c is Control)
            {
                Control webControl = c as Control;

                string searchString = webControl.UniqueID.Substring(0, webControl.UniqueID.LastIndexOf(IdSeparator));
                if (dictCBList.ContainsKey(searchString))
                {
                    string selectedButton = dictCBList[searchString];
                    if (selectedButton == "true"
                        && String.IsNullOrEmpty(c.Value))
                        c.Value = "[enter]";
                    else if (selectedButton == "false")
                        c.Value = "";
                }
            }
        }

        protected void AddOnClickEventsToControls(RepeaterItem item, ICaisisInputControl c)
        {
            CheckBox cb = (CheckBox)item.FindControl("CheckBoxCollect");
            if (cb != null)
            {
                WebControl _c = c as WebControl;
                if (_c != null)
                {
                    _c.Attributes.Add("onClick", "SetEditableControl('" + cb.ClientID + "', '" + _c.ClientID + "');");
                    _c.Attributes.Add("onblur", "SetEditableControl('" + cb.ClientID + "', '" + _c.ClientID + "');");
                }
            }
        }

        protected void AddOnClickEventsToRBs(RepeaterItem item, CICCombined c)
        {
            CheckBox cb = (CheckBox)item.FindControl("CheckBoxCollect");
            if (cb!= null)
                cb.Attributes.Add("onClick", GetOnClickJavascript(c, cb.ClientID));

        }

        private string GetOnClickJavascript(CICCombined c, string cbId)
        {
            Control _c = c.CICParent as Control;
            Control _c_child = c.CICChild as Control;

            if (_c is CaisisCheckBox)
            {
                return string.Format("toggleUserEntered_CheckBox('{0}', '{1}')", _c.ClientID, cbId);
            }
            else
            {
                string childId = _c_child != null ? _c_child.ClientID : "";
                return string.Format("toggleUserEntered('{0}', '{1}', '{2}')", _c.ClientID, childId, cbId);
            }
        }

    }
}