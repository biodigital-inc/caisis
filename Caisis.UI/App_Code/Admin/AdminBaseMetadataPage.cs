using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

using Caisis.BOL;
using Caisis.UI.Core.Classes;
using Caisis.UI.Core.Classes.CustomControls;

namespace Caisis.UI.Admin
{
    /// <summary>
    /// Provides base functionality for pages dealing with Table and Field Level metadata.
    /// Initlize event handlers, builds and populates metadata aand values.
    /// </summary>
    public class AdminBaseMetadataPage : AdminBasePage
    {
        /// <summary>
        /// The ID of the control containing a list of attributes.
        /// </summary>
        protected static readonly string ATTRIBUTES_CONTAINER_ID = "MetadataAttributesContainer";

        /// <summary>
        /// The ID of the GridView containging metdata attribute and values
        /// </summary>
        protected static readonly string METADATA_GRID_ID = "MetadataGrid";

        /// <summary>
        /// The ID of the input control contaning the disease attribute id associated with current metadata items
        /// </summary>
        protected static readonly string METADATA_DISEASE_ATTRIBUTE_ID = "DiseaseAttributeId";

        /// <summary>
        /// The main disease controller for handling disease related metadata mappings
        /// </summary>
        protected Caisis.Controller.DiseaseController _diseaseController = new Caisis.Controller.DiseaseController();

        /// <summary>
        /// Lookup for hidden field by attribute name
        /// </summary>
        protected Dictionary<string, ICaisisInputControl> attributeToHiddenField;

        /// <summary>
        /// Gets a lookup of attribute to hidden fields for getting/setting values during posts.
        /// </summary>
        protected IDictionary<string, ICaisisInputControl> AttributeToHiddenField
        {
            get
            {
                if (attributeToHiddenField == null)
                {
                    Control container = GetMetadataAttributesContainer();
                    if (container != null)
                    {
                        attributeToHiddenField = GetAttributeToHiddenFields(container);
                    }
                    else
                    {
                        attributeToHiddenField = new Dictionary<string, ICaisisInputControl>(StringComparer.CurrentCultureIgnoreCase);
                    }
                }
                return attributeToHiddenField;
            }
        }

        /// <summary>
        /// Returns a list of unique Metadata Attributes
        /// </summary>
        protected IEnumerable<string> MetadataAttributeNames
        {
            get
            {
                return AttributeToHiddenField.Keys;
            }
        }

        /// <summary>
        /// Lookup which provides a list of Grid Rows and associated controls which have changed during posts
        /// </summary>
        protected Dictionary<GridViewRow, List<ICaisisInputControl>> dirtyRows = new Dictionary<GridViewRow, List<ICaisisInputControl>>();

        // private fields
        protected string metadataItemTableName;
        protected string attributeTableName;
        protected string attributeFieldName;
        protected string attributeValueTableName;
        protected string attributeValueFieldName;

        protected BusinessObject BIZ_METADATA_TABLE;
        protected BusinessObject BIZ_ATTRIBUTE_TABLE;
        protected BusinessObject BIZ_ATTRIBUTE_VALUE_TABLE;
        protected BusinessObject BIZ_DISEASE_ATTRIBUTE_VALUE_TABLE = new DiseaseAttributeValue();

        protected string diseaseAttributeName;

        #region CONSTRUCTOR

        public AdminBaseMetadataPage(string metadataItemTableName, string attributeTableName, string attributeFieldName, string attributeValueTableName, string attributeValueFieldName)
            : base()
        {
            // set required fields for populating/updates
            this.metadataItemTableName = metadataItemTableName;
            this.attributeTableName = attributeTableName;
            this.attributeFieldName = attributeFieldName;
            this.attributeValueTableName = attributeValueTableName;
            this.attributeValueFieldName = attributeValueFieldName;

            this.BIZ_METADATA_TABLE = BusinessObjectFactory.BuildBusinessObject(this.metadataItemTableName);
            this.BIZ_ATTRIBUTE_TABLE = BusinessObjectFactory.BuildBusinessObject(this.attributeTableName);
            this.BIZ_ATTRIBUTE_VALUE_TABLE = BusinessObjectFactory.BuildBusinessObject(this.attributeValueTableName);
        }

        #endregion

        protected override void OnInit(EventArgs e)
        {
            base.OnInit(e);
            AttachEventHandlers();
            SetDiseaseAttribute();
        }

        protected override void Page_Load(object sender, EventArgs e)
        {
            base.Page_Load(sender, e);
            if (!Page.IsPostBack)
            {
                PopulateAttributes();
                PopulateAttributeValues();
            }
        }

        /// <summary>
        /// Attach relevent data binding, value tracking, event handlers
        /// </summary>
        protected void AttachEventHandlers()
        {
            GridView metadataGrid = GetMetadataGrid();
            if (metadataGrid != null)
            {
                // re-init dirty rows during databining
                metadataGrid.DataBinding += (a, b) => dirtyRows.Clear();
                // track "dirty" fields during post
                metadataGrid.RowCreated += AddChangeEventHanlders;
                // set attribute value id and values
                metadataGrid.RowDataBound += SetAttributeValueFields;
            }
        }

        /// <summary>
        /// Sets the disease attribute pri key mapped to this piece of metadata.
        /// i.e., "MetadataFieldAttributeValues" -> "FieldAttributeId" == "DiseaseAttributeValues" -> "DiseaseAttributeValue"
        /// </summary>
        protected void SetDiseaseAttribute()
        {
            ICaisisInputControl input = GetMetadataDiseaseAttributeId();
            if (input != null)
            {
                // get the pri key of the metadata value table (i.e., "MetadataFieldAttributeValues" -> "FieldAttributeId")
                string metadataValueTablePriKey = BIZ_ATTRIBUTE_VALUE_TABLE.PrimaryKeyName;
                // get disease attribute (else, create)
                DiseaseAttribute_Table diseaseAttribute = _diseaseController.GetDiseaseAttribute(metadataValueTablePriKey);
                if (diseaseAttribute == null)
                {
                    diseaseAttribute = _diseaseController.CreateDiseaseAttribute(metadataValueTablePriKey);
                }
                // set pri key
                input.Value = diseaseAttribute[DiseaseAttribute_Table.DiseaseAttributeId].ToString();
            }
        }

        #region EVENT HANDLERS

        /// <summary>
        /// 
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void UpdateClick(object sender, EventArgs e)
        {
            // update "dirty" records
            Update();
        }

        /// <summary>
        /// When control value changes during post, add to list of "dirty" fields by row
        /// </summary>
        /// <param name="cic"></param>
        /// <param name="e"></param>
        protected void MarkRowDirty(ICaisisInputControl cic, EventArgs e)
        {
            Control con = cic as Control;
            GridViewRow row = CaisisGridView.GetGridViewRowByControl(con); //con.NamingContainer as GridViewRow;
            if (row != null)
            {
                List<ICaisisInputControl> kvp;
                if (dirtyRows.ContainsKey(row))
                {
                    kvp = dirtyRows[row];
                }
                else
                {
                    kvp = new List<ICaisisInputControl>();
                    dirtyRows.Add(row, kvp);
                }
                if (!kvp.Contains(cic))
                {
                    kvp.Add(cic);
                }
            }
        }

        /// <summary>
        /// Track changes to input controls to track "dirty" fields
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void AddChangeEventHanlders(object sender, GridViewRowEventArgs e)
        {
            var cicList = PageUtil.GetCaisisInputControlsInContainer(e.Row);
            foreach (ICaisisInputControl cic in cicList)
            {
                cic.ValueChanged += MarkRowDirty;
            }
        }

        /// <summary>
        /// Sets the input control values for the input controls
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void SetAttributeValueFields(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                // bizo representing attribute (i.e., MetadataFieldAttribute)
                IBusinessObject attributeBiz = BusinessObjectFactory.BuildBusinessObject(BIZ_ATTRIBUTE_TABLE.TableName);
                // bizo representing metadata attribute  value(i.e., MetadataFieldAttributeValue)
                IBusinessObject attributeValueBiz = BusinessObjectFactory.BuildBusinessObject(BIZ_ATTRIBUTE_VALUE_TABLE.TableName);
                // only corcerned about populating input controls which map to metadata attributes
                foreach (var nameToField in AttributeToHiddenField)
                {
                    string attributeName = nameToField.Key;
                    // field: pri key of attribute
                    ICaisisInputControl attributeIdField = nameToField.Value;
                    // field: pri key to attribute value
                    ICaisisInputControl attributeValueIdField = GetTableAttributeValueIdControl(e.Row, attributeName);
                    // field: attribute value
                    ICaisisInputControl attributeValueField = GetTableAttributeValueControl(e.Row, attributeName);
                    // field: disease attribute value id (i.e., Prostate PageTitle) 
                    ICaisisInputControl diseaseAttributeValueId = GetDiseaseAttributeValueId(e.Row, attributeName);
                    // validate fields
                    if (attributeIdField != null && attributeValueIdField != null && attributeValueField != null)
                    {
                        int? attributeId = null;
                        int? attributeValueId = null;
                        if (!string.IsNullOrEmpty(attributeIdField.Value))
                        {
                            attributeId = int.Parse(attributeIdField.Value);
                        }
                        else
                        {
                            return;// no need to process items without attribute??
                        }

                        IEnumerable<DataRow> diseaseDataSource = DataBinder.Eval(e.Row.DataItem, "DiseaseAttributes") as IEnumerable<DataRow>;
                        // for list of item's attribute value pairs, find by current attribute

                        if (diseaseAttributeValueId != null)
                        {
                            if (diseaseDataSource.Count() > 0)
                            {
                                var diseaseSpecificAttributeValue = from row in diseaseDataSource
                                                                    let rowAttributeName = row[attributeFieldName].ToString()
                                                                    where rowAttributeName.Equals(attributeName, StringComparison.CurrentCultureIgnoreCase)
                                                                    select row;
                                if (diseaseSpecificAttributeValue.Count() > 0)
                                {
                                    string priKeyField = BIZ_ATTRIBUTE_VALUE_TABLE.PrimaryKeyName;

                                    // set attribute value id                                    
                                    attributeValueIdField.Value = diseaseSpecificAttributeValue.First()[priKeyField].ToString();
                                    // set attribute value
                                    attributeValueField.Value = diseaseSpecificAttributeValue.First()[attributeValueFieldName].ToString();
                                    // set disease value id field
                                    diseaseAttributeValueId.Value = diseaseSpecificAttributeValue.First()["DiseaseAttributeValueId"].ToString(); ;

                                    // call setter for attribute value
                                    SetInputControlValue(attributeValueField, attributeValueField.Value, diseaseSpecificAttributeValue.First());

                                    continue;
                                }
                            }
                        }
                        // data already filtered out to only include attributes for this metadata item
                        IEnumerable<DataRow> dataSource = DataBinder.Eval(e.Row.DataItem, "Data") as IEnumerable<DataRow>;

                        var found = from row in dataSource
                                    where !row.IsNull(attributeBiz.PrimaryKeyName)
                                    let rowAttributeId = (int)row[attributeBiz.PrimaryKeyName]
                                    where rowAttributeId == attributeId.Value
                                    select row;
                        DataRow attributeKeyAndValue = found.FirstOrDefault();
                        string attributeValue = string.Empty;
                        // if data row found, set fields
                        if (attributeKeyAndValue != null)
                        {
                            attributeValueId = (int)attributeKeyAndValue[attributeValueBiz.PrimaryKeyName];
                            attributeValue = attributeKeyAndValue[attributeValueFieldName].ToString();
                            // update hidden pri key
                            attributeValueIdField.Value = attributeValueId.Value.ToString();
                        }
                        // call setter for attribute value
                        SetInputControlValue(attributeValueField, attributeValue, attributeKeyAndValue);
                    }
                }
                // for other non-attribute fields, run setter
                var nonAttributeControls = from cic in CICHelper.GetCaisisInputControls(e.Row)
                                           where cic.Table != BIZ_ATTRIBUTE_VALUE_TABLE.TableName && cic.Table != BIZ_DISEASE_ATTRIBUTE_VALUE_TABLE.TableName
                                           select cic;
                foreach (ICaisisInputControl cic in nonAttributeControls)
                {
                    object value = DataBinder.GetPropertyValue(e.Row.DataItem, cic.Field);
                    if (value != null)
                    {
                        cic.Value = value.ToString();
                        SetInputControlValue(cic, value.ToString(), null);
                    }
                }
            }
        }

        #endregion

        #region BUILD ATTRIBUTES AND ATTRIBUTE VALUES

        /// <summary>
        /// Populates the list of attribute pri key fields for the current metadata type.
        /// i.e., MetadataFieldAttributes -> AttributeId -> FieldLabel, FieldSupress, ControlType
        /// </summary>
        protected virtual void PopulateAttributes()
        {
            // get attribute container
            Control attributeContainer = GetMetadataAttributesContainer();
            if (attributeContainer != null)
            {
                PopulateAttributes(BIZ_ATTRIBUTE_TABLE.TableName, attributeFieldName, AttributeToHiddenField);
            }
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="aTableName"></param>
        /// <param name="aFieldName"></param>
        /// <param name="attributeLookup"></param>
        protected static void PopulateAttributes(string aTableName, string aFieldName, IDictionary<string, ICaisisInputControl> attributeLookup)
        {
            // get a list of all attributes (i.e., MetadataFieldAttributes)
            IBusinessObject attributeBiz = BusinessObjectFactory.BuildBusinessObject(aTableName);
            string tableName = attributeBiz.TableName;
            string priKeyName = attributeBiz.PrimaryKeyName;
            IEnumerable<IBusinessObject> attributes = BusinessObject.GetAll(aTableName);
            var dbAttributes = (from biz in attributes
                                let attributeId = (int)biz[priKeyName]
                                let attributeName = biz[aFieldName].ToString()
                                select new
                                {
                                    Id = attributeId,
                                    Name = attributeName
                                }).ToDictionary(a=>a.Name, a=>a.Id, StringComparer.OrdinalIgnoreCase);
            // for each attribute set pri key for assocaited hidden field
            foreach (var entry in attributeLookup)
            {
                string attributeName = entry.Key;
                ICaisisInputControl attributeIdField = entry.Value;
                // set attribute id 
                if (dbAttributes.ContainsKey(attributeName))
                {
                    int attributeId = dbAttributes[attributeName];
                    attributeIdField.Value = attributeId.ToString();
                }
                // create attribute id
                else
                {
                    var biz = BusinessObjectFactory.BuildBusinessObject(aTableName);
                    biz[aFieldName] = attributeName;
                    biz.Save();
                    string priKey = biz[biz.PrimaryKeyName].ToString();
                    attributeIdField.Value = priKey;
                }
            }
         }

        /// <summary>
        /// 
        /// </summary>
        protected virtual void PopulateAttributeValues()
        {
        }

        #endregion

        #region CRUD

        /// <summary>
        /// Updates the metadta attibutes and attribute values
        /// </summary>
        protected virtual void Update()
        {
            GridView grid = GetMetadataGrid();
            if (grid == null)
            {
                return;
            }
            foreach (var dirtyRow in dirtyRows)
            {
                // the "dirty" grid row
                GridViewRow row = dirtyRow.Key;
                int rowIndex = row.RowIndex;
                // lookup of key fields in row
                var rowDataKeys = grid.DataKeys[rowIndex].Values;
                // a list of controls which are "dirty" in row
                var dirtyControls = dirtyRow.Value;
                // a list of "dirty" controls which represent an attribute value
                var dirtyAttributes = dirtyControls.Where(c => c.Table == attributeValueTableName);
                // a list of "dirty" contorls which represents a dirty metdata item
                var dirtyMetadataItemFields = dirtyControls.Where(c => c.Table == metadataItemTableName);

                IBusinessObject metadataItemBiz = BusinessObjectFactory.BuildBusinessObject(metadataItemTableName);
                int metadataItemKey = (int)rowDataKeys[metadataItemBiz.PrimaryKeyName];

                // for each row, only updates values(attribuet values) which have changed, not all attribute values
                foreach (ICaisisInputControl dirtyAttributeValue in dirtyAttributes)
                {
                    string attributeName = dirtyAttributeValue.Field;
                    // only update if there is an attribute by this name
                    if (AttributeToHiddenField.ContainsKey(attributeName))
                    {
                        IBusinessObject attributeBiz = BusinessObjectFactory.BuildBusinessObject(BIZ_ATTRIBUTE_TABLE.TableName);
                        int? attributeId = null;
                        int? attributeValueId = null;

                        // get the table attribute id
                        ICaisisInputControl attributeIdField = AttributeToHiddenField[attributeName];

                        // CREATE/LOAD: Attribute (i.e., "FieldLabel" -> MetadataFieldAttribute)  

                        // if attribute exists, set value
                        if (!string.IsNullOrEmpty(attributeIdField.Value))
                        {
                            attributeId = int.Parse(attributeIdField.Value);
                        }
                        // otherwise insert attribute
                        else
                        {
                            // set required attribute name
                            attributeBiz[attributeFieldName] = attributeName;
                            attributeBiz.Save();

                            // update hidden attribute id field
                            attributeId = (int)attributeBiz[attributeBiz.PrimaryKeyName];
                            attributeIdField.Value = attributeId.Value.ToString();
                        }

                        // INSERT/UPDATE: Attribute Value (i.e., "FieldLabel" + "My Field" -> MetadataFieldAttributeValue)               

                        // the field representing the AttributeValueId
                        ICaisisInputControl attributeValueIdField = GetTableAttributeValueIdControl(row, attributeName);
                        // the field representing the input control containing the AttributeValue
                        ICaisisInputControl attributeValueControl = GetTableAttributeValueControl(row, attributeName);
                        // the disease mapping to the attribute value
                        ICaisisInputControl diseaseAttributeValueId = GetDiseaseAttributeValueId(row, attributeName);

                        // validate fields exists
                        if (attributeValueIdField != null && attributeValueControl != null)
                        {
                            IBusinessObject attributeValueBiz = BusinessObjectFactory.BuildBusinessObject(attributeValueTableName);
                            bool isDiseaseSpecific = QueryDiseaseId.HasValue && diseaseAttributeValueId != null;
                            // load attribute value, if isn't disease specific or disease specific has a value
                            if (!string.IsNullOrEmpty(attributeValueIdField.Value) && (!isDiseaseSpecific || !string.IsNullOrEmpty(diseaseAttributeValueId.Value)))
                            {
                                attributeValueId = int.Parse(attributeValueIdField.Value);
                                attributeValueBiz.Get(attributeValueId.Value);
                            }
                            // set required foreign keys for insert
                            else
                            {
                                // set required attribute id key (i.e., AttributeId)
                                attributeValueBiz[attributeBiz.PrimaryKeyName] = attributeId;
                                // set required metadata id (i.e., FieldId)
                                attributeValueBiz[metadataItemBiz.PrimaryKeyName] = metadataItemKey;
                            }

                            // get attribute value (i.e., "ControlType" = "CaisisTextBox")
                            string attributeValue = GetInputControlValue(attributeValueControl);

                            // update table attribute value

                            // validate (no empty values allowed)
                            if (string.IsNullOrEmpty(attributeValue))
                            {
                                // delete empty values
                                if (attributeValueId.HasValue)
                                {
                                    // delete atttibute value
                                    attributeValueBiz.Delete(attributeValueId.Value);
                                    attributeValueId = null;
                                    attributeValueIdField.Value = string.Empty;
                                    // delete disease specific mapping
                                    if (isDiseaseSpecific && !string.IsNullOrEmpty(diseaseAttributeValueId.Value))
                                    {
                                        DiseaseAttributeValue dav = new DiseaseAttributeValue();
                                        dav.Delete(int.Parse(diseaseAttributeValueId.Value));
                                        diseaseAttributeValueId.Value = string.Empty;
                                    }
                                }
                                continue;
                            }
                            else
                            {
                                attributeValueBiz[attributeValueFieldName] = attributeValue;
                                attributeValueBiz.Save();
                                // update hidden field
                                attributeValueId = (int)attributeValueBiz[attributeValueBiz.PrimaryKeyName];
                                attributeValueIdField.Value = attributeValueId.ToString();

                                // handle disease specific mapping
                                if (isDiseaseSpecific)
                                {
                                    var diseaseAttributeValue = new DiseaseAttributeValue();
                                    var diseaseAttributeId = GetMetadataDiseaseAttributeId();
                                    // load existing mapping
                                    if (!string.IsNullOrEmpty(diseaseAttributeValueId.Value))
                                    {
                                        diseaseAttributeValue.Get(int.Parse(diseaseAttributeValueId.Value));
                                    }
                                    // new
                                    else
                                    {
                                        diseaseAttributeValue[DiseaseAttributeValue.DiseaseId] = QueryDiseaseId.Value;
                                        diseaseAttributeValue[DiseaseAttributeValue.DiseaseAttributeId] = diseaseAttributeId.Value;
                                    }
                                    diseaseAttributeValue[DiseaseAttributeValue.DiseaseAttributeValue_Field] = attributeValueIdField.Value;

                                    diseaseAttributeValue.Save();
                                    diseaseAttributeValueId.Value = diseaseAttributeValue[diseaseAttributeValue.PrimaryKeyName].ToString();
                                }
                            }
                        }
                    }
                }
                // update metadata item (i.e., MetadataField)
                if (dirtyMetadataItemFields.Count() > 0)
                {
                    // load by pri key (i.e., FieldId)
                    metadataItemBiz.Get(metadataItemKey);
                    // update fields which have changed (i.e., FieldOrder, FieldSupress)
                    foreach (ICaisisInputControl input in dirtyMetadataItemFields)
                    {
                        metadataItemBiz[input.Field] = GetInputControlValue(input);
                    }
                    // save record
                    metadataItemBiz.Save();
                }
            }
            // after update rebuilds lists
            PopulateAttributeValues();
        }

        #endregion

        #region GET CONTROLS

        /// <summary>
        /// Gets the container containing a list of hidden fields representing unique metadata attributes
        /// </summary>
        /// <returns></returns>
        protected Control GetMetadataAttributesContainer()
        {
            return this.FindControl(ATTRIBUTES_CONTAINER_ID);
        }

        /// <summary>
        /// Gets the container containing a list of metadata attribute/value pairs
        /// </summary>
        /// <returns></returns>
        protected GridView GetMetadataGrid()
        {
            return this.FindControl(METADATA_GRID_ID) as GridView;
        }

        /// <summary>
        /// Gets the input field contaning the pri key of the disease attribute mapped to these items
        /// </summary>
        /// <returns></returns>
        protected ICaisisInputControl GetMetadataDiseaseAttributeId()
        {
            return this.FindControl(METADATA_DISEASE_ATTRIBUTE_ID) as ICaisisInputControl;
        }

        /// <summary>
        /// Returns the ICaisisInputControl by attribute name and suffix.
        /// </summary>
        /// <param name="container"></param>
        /// <param name="attributeName"></param>
        /// <param name="suffix"></param>
        /// <returns></returns>
        protected ICaisisInputControl GetInputControlById(Control container, string attributeName, string suffix)
        {
            string lookupId = string.Format("{0}{1}", attributeName, suffix);
            if (container != null)
            {
                return container.FindControl(lookupId) as ICaisisInputControl;
            }
            else
            {
                return null;
            }
        }

        /// <summary>
        /// Returns the control containing the TableAttributeId (the pri key table attribute).
        /// </summary>
        /// <param name="attributeName"></param>
        /// <returns></returns>
        protected ICaisisInputControl GetTableAttributeIdControl(string attributeName)
        {
            Control container = GetMetadataAttributesContainer();
            return GetInputControlById(container, attributeName, "_Id");
        }

        /// <summary>
        /// Returns the control containing the TableAttributeValueId (the pri key representing the table's value for the attribute).
        /// </summary>
        /// <param name="container"></param>
        /// <param name="attributeName"></param>
        /// <returns></returns>
        protected ICaisisInputControl GetTableAttributeValueIdControl(Control container, string attributeName)
        {
            return GetInputControlById(container, attributeName, "_ValueId");
        }

        /// <summary>
        /// Returns the association between disease and metadata value (i.e., Prostate PageTitle) 
        /// </summary>
        /// <param name="container"></param>
        /// <param name="attributeName"></param>
        /// <returns></returns>
        protected ICaisisInputControl GetDiseaseAttributeValueId(Control container, string attributeName)
        {
            return GetInputControlById(container, attributeName, "_DiseaseAttributeValueId");
        }

        /// <summary>
        /// Returns the control containing the TableAttributeValue (the table's value for the attribute).
        /// </summary>
        /// <param name="container"></param>
        /// <param name="attributeName"></param>
        /// <returns></returns>
        protected ICaisisInputControl GetTableAttributeValueControl(Control container, string attributeName)
        {
            return GetInputControlById(container, attributeName, string.Empty);
        }

        /// <summary>
        /// Gets a lookup of attribute fields by name
        /// </summary>
        /// <param name="container"></param>
        /// <returns></returns>
        protected Dictionary<string, ICaisisInputControl> GetAttributeToHiddenFields(Control container)
        {
           return new Dictionary<string, ICaisisInputControl>(CICHelper.GetCaisisInputControlDictionary(container), StringComparer.CurrentCultureIgnoreCase);
        }

        #endregion

        #region ATTRIBUTE VALUES: GETTERS AND SETTTERS

        /// <summary>
        /// Sets the Value of the input control
        /// </summary>
        /// <param name="inputControl"></param>
        /// <param name="inputControlValue"></param>
        /// <param name="dataSource"></param>
        protected virtual void SetInputControlValue(ICaisisInputControl inputControl, string inputControlValue, DataRow dataSource)
        {
            // special case, normalized checkbox values to true/false
            if (inputControl is CheckBox)
            {
                bool isChecked = false;
                if (inputControlValue.ToLower().Equals(bool.TrueString.ToLower()) || inputControl.Equals(1.ToString()))
                {
                    isChecked = true;
                }
                inputControl.Value = inputControlValue;
                (inputControl as CheckBox).Checked = isChecked;
            }
            else
            {
                inputControl.Value = inputControlValue;
            }
        }

        /// <summary>
        /// Gets the Value of the input control representing the attribute value
        /// </summary>
        /// <param name="inputControl"></param>
        /// <returns></returns>
        protected virtual string GetInputControlValue(ICaisisInputControl inputControl)
        {
            // special case, normalized checkbox values to true/false
            if (inputControl is CheckBox)
            {
                return (inputControl as CheckBox).Checked.ToString();
            }
            else
            {
                return inputControl.Value;
            }
        }

        #endregion
    }
}
