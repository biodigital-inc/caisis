using System;
using System.Data;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

using Caisis.BOL;
using Caisis.DataAccess;
using Caisis.Controller;
using Caisis.UI.Core.Classes;
using Caisis.UI.Core.Classes.CustomControls;

namespace Caisis.UI.Admin
{
    public partial class AdminEditFieldMetadata : AdminBaseMetadataPage
    {
        private static readonly int SORT_COL_INDEX = 1;
        private int? tableId = null;
        private List<string> dirtyTableAttributes = new List<string>();
        private DataTable lkpCodes = null;

        private IEnumerable<string> miscTableAttributes = new string[0];
        //private IDictionary<string, IEnumerable<string>> miscFieldAttributes = new Dictionary<string, IEnumerable<string>>();
        private PatientDataEntryController _dataEntryController;

        /// <summary>
        /// Gets the Metadata Table passed via query string
        /// </summary>
        protected string QueryTableName
        {
            get
            {
                return Request.QueryString["table"];
            }
        }

        /// <summary>
        /// Gets the Metadata TableId passed via query string
        /// </summary>
        protected string QueryTableId
        {
            get
            {
                return Request.QueryString["tableId"];
            }
        }

        /// <summary>
        /// Gets a list of all LookupCodes
        /// </summary>
        private DataTable LookupCodesTable
        {
            get
            {
                if (lkpCodes == null)
                {
                    LookupCodeDa da = new LookupCodeDa();
                    lkpCodes = da.GetLookupFieldNames().Tables[0];
                }
                return lkpCodes;
            }
        }

        /// <summary>
        /// Gets a CSV list of static field attributes
        /// </summary>
        protected string ExcludedFieldAttributes
        {
            get
            {
                var staticFieldAttributes = GetAttributeToHiddenFields(MetadataAttributesContainer).Keys.ToArray();
                return string.Join(",", staticFieldAttributes);
            }
        }

        public AdminEditFieldMetadata()
            : base(new MetadataField().TableName, new MetadataFieldAttribute().TableName, MetadataFieldAttribute.AttributeName, new MetadataFieldAttributeValue().TableName, MetadataFieldAttributeValue.AttributeValue)
        {
        }

        protected override void OnInit(EventArgs e)
        {
            // order matters
            _dataEntryController = new PatientDataEntryController(QueryDiseaseName);
            AddDynamicAttributes();
            SetTableId();
            TrackDirtyTableAttributes();

            // call base
            base.OnInit(e);
        }

        /// <summary>
        /// Add missing table and field attributes to the interface
        /// </summary>
        private void AddDynamicAttributes()
        {
            // TABLE ATTRIBUTES
            var allTableAttributes = BOL.BusinessObject.GetAll<MetadataTableAttribute>().ToDictionary(b => b[MetadataTableAttribute.TableAttributeName].ToString(), b => (int)b[MetadataTableAttribute.TableAttributeId]);
            var staticTableAttributes = GetAttributeToHiddenFields(TableAttributesPanel).Keys;
            miscTableAttributes = from attribute in allTableAttributes.Keys.Except(staticTableAttributes, StringComparer.OrdinalIgnoreCase)
                                  orderby attribute ascending
                                  select attribute;
            foreach (string attribute in miscTableAttributes)
            {
                // add attributes
                CaisisHidden attributeField = new CaisisHidden();
                attributeField.Table = "MetadataTableAttributes";
                attributeField.Field = attribute;
                attributeField.ID = attribute + "_Id";

                TableAttributesPanel.Controls.Add(attributeField);

                // add attribute values
                DynamicallyAddAttribute(TableMiscAttributesPanel, attribute, "MetadataTableAttributeValues", new string[0]);
            }
            // FIELD ATTRIBUTES
            //var staticFieldAttributes = GetAttributeToHiddenFields(MetadataAttributesContainer).Keys;
            //// field attributes not defined (i.e., misc)
            //var missingFieldAttributes = from b in BOL.BusinessObject.GetAll<MetadataFieldAttribute>()
            //                             let attribute = b[MetadataFieldAttribute.AttributeName].ToString()
            //                             let attributeId = (int)b[MetadataFieldAttribute.AttributeId]
            //                             where !staticFieldAttributes.Contains(attribute)
            //                             orderby attribute ascending
            //                             select new
            //                             {
            //                                 Attribute = attribute,
            //                                 AttributeOptions = BOL.BusinessObject.GetByParent<MetadataFieldAttributeValueOption>(attributeId).Select(option => option[BOL.MetadataFieldAttributeValueOption.AttributeOptionValue].ToString())
            //                             };
            //miscFieldAttributes = missingFieldAttributes.ToDictionary(a => a.Attribute, a => a.AttributeOptions);
            //// dynamically add to attribute id container
            //foreach (string miscAttribute in miscFieldAttributes.Keys)
            //{
            //    CaisisHidden attributeField = new CaisisHidden();
            //    attributeField.Table = "MetadataFieldAttributes";
            //    attributeField.Field = miscAttribute;
            //    attributeField.ID = miscAttribute + "_FieldAttributeId";

            //    MetadataAttributesContainer.Controls.Add(attributeField);
            //}
        }

        /// <summary>
        /// Dynamically Add Field Attrributes to each grid row
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void AddDynamicFieldAttributes(object sender, GridViewRowEventArgs e)
        {
            // v6: suppressing adding attribute dynamicall, use popup for efficency
            //if (e.Row.RowType == DataControlRowType.DataRow)
            //{
            //    Control miscAttributesHolder = e.Row.FindControl("MiscFieldAttributesPanel");
            //    // when panel loaded, dynamically add misc field attributes and attach change handlers
            //    foreach (var attributePair in miscFieldAttributes)
            //    {
            //        string attributeName = attributePair.Key;
            //        IEnumerable<string> attributeValueOptions = attributePair.Value;
            //        // add attribute and optional list of available values
            //        DynamicallyAddAttribute(miscAttributesHolder, attributeName, "MetadataFieldAttributeValues", attributeValueOptions);
            //    }
            //    //// after adding attribute values, track dirty fields (todo: add to base logic)
            //    //var inputControls = PageUtil.GetCaisisInputControlsInContainer(miscAttributesHolder);
            //    //inputControls.ForEach(c => c.ValueChanged += base.MarkRowDirty);

            //}
            //// todo: normalize tracking of fields
            //base.AddChangeEventHanlders(sender, e);
        }
 
        private void DynamicallyAddAttribute(Control container, string attributeName, string attributeValueTable, IEnumerable<string> attributeValueOptions)
        {
            HtmlGenericControl attributeWrapper = new HtmlGenericControl("div");
            Label attributeValueLabel = new Label();
            CaisisHidden valueIdField = new CaisisHidden();
            CaisisHidden diseaseAttributeValueId = new CaisisHidden();
            ICaisisInputControl attributeValue;
            // if attribute options assigned, build options
            if (attributeValueOptions.Count() > 0)
            {
                CaisisSelect attributeValuesInput = new CaisisSelect();
                attributeValue = attributeValuesInput;
                attributeValuesInput.DataSource = attributeValueOptions;
                attributeValuesInput.DataBind();
            }
            else
            {
                attributeValue = new CaisisTextBox();
            }
            attributeWrapper.Attributes["class"] = "attributeFieldWrapper";

            attributeValueLabel.ID = attributeName + "_Label";
            attributeValueLabel.Text = attributeName;

            valueIdField.ID = attributeName + "_ValueId";
            valueIdField.Table = attributeValueTable;
            valueIdField.Field = attributeName;

            diseaseAttributeValueId.ID = attributeName + "_DiseaseAttributeValueId";
            diseaseAttributeValueId.Table = "DiseaseAttributeValues";
            diseaseAttributeValueId.Field = attributeName;

            Control inputAttributeValue = attributeValue as Control;
            inputAttributeValue.ID = attributeName;
            attributeValue.ShowLabel = false;
            attributeValue.Table = attributeValueTable;
            attributeValue.Field = attributeName;
            attributeValueLabel.AssociatedControlID = inputAttributeValue.ID;

            container.Controls.Add(attributeWrapper);
            attributeWrapper.Controls.Add(attributeValueLabel);
            attributeWrapper.Controls.Add(valueIdField);
            attributeWrapper.Controls.Add(diseaseAttributeValueId);
            attributeWrapper.Controls.Add(inputAttributeValue);
        }

        /// <summary>
        /// Sets the current table id via query string paramater
        /// </summary>
        private void SetTableId()
        {
            if (!string.IsNullOrEmpty(QueryTableId))
            {
                tableId = int.Parse(QueryTableId);
            }
            else if (!string.IsNullOrEmpty(QueryTableName))
            {
                // get metadata table by table name
                MetadataTable metaTable = BusinessObject.GetByFields<MetadataTable>(new Dictionary<string, object> { { MetadataTable.TableName_Field, QueryTableName } }).FirstOrDefault();
                if (metaTable != null)
                {
                    tableId = (int)metaTable[MetadataTable.TableId];
                }
            }
        }

        /// <summary>
        /// Attach event handler for tracking "dirty" table attribute values
        /// </summary>
        private void TrackDirtyTableAttributes()
        {
            // get a list of attributes
            var attributeFields = GetAttributeToHiddenFields(TableAttributesPanel);
            // locate value controls, add attach event handler for tracking dirty values
            foreach (string attributeName in attributeFields.Keys)
            {
                ICaisisInputControl attributeValueControl = TablePanel.FindControl(attributeName) as ICaisisInputControl;
                if (attributeValueControl != null)
                {
                    attributeValueControl.ValueChanged += MarkTableAttributeDirty;
                }
            }
        }

        /// <summary>
        /// Make various UI adjustments
        /// </summary>
        private void AdjustUI()
        {
            // supress sort column in disease specific view
            //MetadataGrid.Columns[SORT_COL_INDEX].Visible = !QueryDiseaseId.HasValue;
        }

        protected override void OnPreRender(EventArgs e)
        {
            base.OnPreRender(e);
            AdjustUI();
        }

        protected void DeleteMetadataField(object sender, GridViewDeleteEventArgs e)
        {
            int fieldId = (int)MetadataGrid.DataKeys[e.RowIndex][MetadataField.FieldId];
            MetadataField biz = new MetadataField();
            biz.Delete(fieldId);
            Response.Redirect("AdminEditFieldMetadata.aspx?diseaseId=" + QueryDiseaseId + "&tableId=" + QueryTableId);
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="tableAttributeField"></param>
        /// <param name="e"></param>
        protected void MarkTableAttributeDirty(ICaisisInputControl tableAttributeField, EventArgs e)
        {
            if (!dirtyTableAttributes.Contains(tableAttributeField.Field))
            {
                dirtyTableAttributes.Add(tableAttributeField.Field);
            }
        }

        #region build interface

        protected void PopulateTableAttributes()
        {
            dirtyTableAttributes.Clear();

            // special cases
            if (tableId.HasValue && !Page.IsPostBack)
            {
                MetadataTable biz = new MetadataTable();
                biz.Get(tableId.Value);
                string tableName = biz[MetadataTable.TableName_Field].ToString();

                // display with children
                //var childTableNames =  BOL.BusinessObject.GetChildTableNames(tableName);
                var childTableNames = _dataEntryController.GetDataEntryForms();
                // only show picker if there are child tables
                if (childTableNames.Count() > 0)
                {
                    DisplayWithChild.DataSource = childTableNames;
                    DisplayWithChild.DataBind();
                }
                else
                {
                    DisplayWithChild.Visible = false;
                    DisplayWithChild_Label.Visible = false;
                }

                // plugins
                Caisis.Controller.PluginsController pc = new Caisis.Controller.PluginsController();
                var pluginNames = pc.GetPluginNames();
                Plugins.DataSource = pluginNames;
                Plugins.DataBind();
            }
            // special case: relevant tables
            if (tableId.HasValue && !Page.IsPostBack)
            {
                var allTableNames = _dataEntryController.GetDataEntryForms();// BOL.BusinessObject.GetAllTableNames();
                MostRelevantTables.DataSource = allTableNames;
                MostRelevantTables.DataBind();
            }

            // get list of table attribute names/description
            var namesAndDescriptions = BOL.BusinessObject.GetAll<MetadataTableAttribute>().ToDictionary(a => a[MetadataTableAttribute.TableAttributeName].ToString(), a => a[MetadataTableAttribute.TableAttributeDescription].ToString(), StringComparer.OrdinalIgnoreCase);

            // get all table metadata
            MetadataDa da = new MetadataDa();
            var tableSpecificMetadata = da.GetAllTableMetadata(tableId, QueryDiseaseId).AsEnumerable();
            var tableDataSource = from record in tableSpecificMetadata
                                  let dAttributeName = record[MetadataTableAttribute.TableAttributeName].ToString()
                                  let dAttributeValue = record[MetadataTableAttributeValue.TableAttributeValue].ToString()
                                  let dTableAttributeValueId = record[MetadataTableAttributeValue.TableAttributeValueId].ToString()
                                  let dAttributeValueId = record[DiseaseAttributeValue.DiseaseAttributeValueId].ToString()
                                  orderby (!record.IsNull(DiseaseAttributeValue.DiseaseAttributeValueId) ? 0 : 1) ascending
                                  let a = new
                                  {
                                      TableAttributeName = dAttributeName,
                                      TableAttributeValue = dAttributeValue,
                                      TableAttributeValueId = dTableAttributeValueId,
                                      DiseaseAttributeValueId = dAttributeValueId
                                  }
                                  group a by a.TableAttributeName into g
                                  select g.First();
            var inputs = CICHelper.GetCaisisInputControls(TablePanel);
            // get a list of attributes
            var attributeFields = GetAttributeToHiddenFields(TableAttributesPanel);
            // populate attributes (i.e., "PageTitle", "MenuTile",...)
            PopulateAttributes(new MetadataTableAttribute().TableName, MetadataTableAttribute.TableAttributeName, attributeFields);
            // populate table attribute values
            foreach (var entry in attributeFields)
            {
                string attributeName = entry.Key;
                // i.e., "PageTitle"
                var attributeIdField = entry.Value;
                // i.e., "Encounter" > "PageTitle"
                var tableAttributeValueId = GetTableAttributeValueIdControl(TablePanel, attributeName);
                // i.e. "Prostate Encounter Form"
                var attributeValue = GetTableAttributeValueControl(TablePanel, attributeName);
                // i.e., "Prostate" > "Encounter" > "PageTitle" = "Prostate Encounter Form"
                var diseaseAttributeValueId = GetDiseaseAttributeValueId(TablePanel, attributeName);

                // locate table attribute values
                var found = tableDataSource.Where(a => a.TableAttributeName.Equals(attributeName, StringComparison.CurrentCultureIgnoreCase));
                if (found.Count() > 0)
                {
                    var dataSource = found.First();
                    // set field value
                    SetInputControlValue(tableAttributeValueId, dataSource.TableAttributeValueId.ToString(), null);
                    SetInputControlValue(attributeValue, dataSource.TableAttributeValue, null);
                    SetInputControlValue(diseaseAttributeValueId, dataSource.DiseaseAttributeValueId.ToString(), null);
                }

                // set friendly tooltip for attribute
                if (namesAndDescriptions.ContainsKey(attributeName))
                {
                    string attributeDescription = namesAndDescriptions[attributeName];
                    var attributeLabel = TablePanel.FindControl(attributeName + "_Label") as Label;
                    if (attributeLabel != null)
                    {
                        // set friendly tooltip
                        attributeLabel.Attributes["onmouseover"] = "showToolTipMessage('" + PageUtil.EscapeSingleQuotes(attributeDescription) + "');";
                        attributeLabel.Attributes["onmouseout"] = "hideToolTip();";
                        attributeLabel.ToolTip = attributeDescription;
                    }
                }
            }

            // SPECIAL CASE: handle columns and grid
            if (GridView.Checked)
            {
                NumDisplayColumns.SelectedIndex = 2;
            }
        }

        /// <summary>
        /// Builds a list of available MetadataTables
        /// </summary>
        protected override void PopulateAttributeValues()
        {
            if (tableId.HasValue)
            {
                // populate main table attributes
                PopulateTableAttributes();

                // populate table field attributes
                MetadataDa da = new MetadataDa();
                DataTable dt = da.GetFieldMetadata(tableId.Value, QueryDiseaseId);

                // build a list of unique metadata tables with there associated metadata
                var tableToAttributes = from row in dt.AsEnumerable()
                                        let fieldId = (int)row[MetadataField.FieldId]
                                        group row by fieldId into groupByField
                                        let filedName = groupByField.First()[MetadataField.FieldName].ToString()
                                        let fieldOrderMetadata = from record in groupByField
                                                                 let attributeName = record[MetadataFieldAttribute.AttributeName].ToString()
                                                                 let attributeValue = record[MetadataFieldAttributeValue.AttributeValue].ToString()
                                                                 // filter by FieldOrder attribute
                                                                 where attributeName.Equals(MetadataField.FieldOrder, StringComparison.OrdinalIgnoreCase) && PageUtil.IsInteger(attributeValue)
                                                                 // filter by disease (or defaul=NULL)
                                                                 where (!QueryDiseaseId.HasValue && record.IsNull(Disease.DiseaseId)) || (QueryDiseaseId.HasValue && !record.IsNull(Disease.DiseaseId))
                                                                 let fieldOrder = int.Parse(attributeValue)
                                                                 select fieldOrder
                                        // sort by field sort order, with null to bottom
                                        let fieldOrder = fieldOrderMetadata.Count() > 0 ? fieldOrderMetadata.First() : int.MaxValue
                                        //let sort = !string.IsNullOrEmpty(fieldSort) ? int.Parse(fieldSort) : int.MaxValue
                                        orderby fieldOrder ascending, filedName ascending
                                        select new
                                        {
                                            TableId = tableId,
                                            FieldId = groupByField.Key,
                                            FieldName = filedName,
                                            FieldOrder = fieldOrder,
                                            //FieldSuppress = false,
                                            Data = groupByField,
                                            DiseaseAttributes = from record in groupByField
                                                                where !record.IsNull(DiseaseAttributeValue.DiseaseAttributeValueId)
                                                                select record
                                        };
                MetadataGrid.DataSource = tableToAttributes;
                MetadataGrid.DataBind();

                // build fields without metadata
                MetadataTable biz = new MetadataTable();
                biz.Get(tableId.Value);

                MetadataNewDa MNDa = new MetadataNewDa();
                DataTable cols = MNDa.GetTableColumns(tableId.Value, biz[MetadataTable.TableName_Field].ToString());
                // build a list of actual fields not yet assigned metadata
                var nonMetadataFields = from row in cols.AsEnumerable()
                                        select new
                                        {
                                            COLUMN_NAME = row["COLUMN_NAME"].ToString(),
                                            DATA_TYPE = row["DATA_TYPE"].ToString(),
                                            CHAR_MAX_LEN = row["CHAR_MAX_LEN"].ToString(),
                                            IS_VIRTUAL = false
                                        };
                // build blank rows for new virtual fields
                var blankVirtualFields = from i in Enumerable.Range(0, 1)
                                         select new
                                         {
                                             COLUMN_NAME = string.Empty,
                                             DATA_TYPE = string.Empty,
                                             CHAR_MAX_LEN = string.Empty,
                                             IS_VIRTUAL = true
                                         };
                var dataSource = nonMetadataFields.Concat(blankVirtualFields);
                NonMetadataFields.DataSource = dataSource;
                NonMetadataFields.DataBind();
            }
        }

        #endregion

        #region custom update

        /// <summary>
        /// Updates the table's metadata as well as field's metadata
        /// </summary>
        protected override void Update()
        {
            bool hasDirtyFields = dirtyTableAttributes.Count() > 0 || base.dirtyRows.Count() > 0;
            // create meta fields
            bool hasNewMetaFields = InsertMetadataFields();
            // update: table metadata (!important, order matters)
            UpdateTableAttributes();
            // update: field metadata
            base.Update();
            // refresh metadata
            MetadataTable biz = new MetadataTable();
            biz.Get(tableId.Value);
            string tableName = biz[MetadataTable.TableName_Field].ToString();

            // when updating table attributes, refresh BO and cached items
            if (hasDirtyFields)
            {
                BOL.BusinessObject.RefreshMetadataFromDatabase(tableName);
                // updating table label causes PDE refresh ???
                if (dirtyTableAttributes.Contains(TableLabel.Field, StringComparer.OrdinalIgnoreCase))
                {
                    // CacheManager.RefreshPatientDataCache(QueryDiseaseName);
                }
            }

            // close modal, unless new meta fields added
            if (!hasNewMetaFields)
            {
                string updateScript = "if(top.reloadDataEntryFrame) { top.reloadDataEntryFrame(); top.hideModal(); }";
                Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "OnUpdateScript", updateScript, true);
            }
        }

        protected void UpdateTableAttributes()
        {
            //bool isDiseaseSpecific = QueryDiseaseId.HasValue;
            // create table disease attribute
            var diseaseAttributeId = _diseaseController.GetDiseaseAttribute(MetadataTableAttributeValue.TableAttributeValueId);
            if (diseaseAttributeId == null)
            {
                diseaseAttributeId = _diseaseController.CreateDiseaseAttribute(MetadataTableAttributeValue.TableAttributeValueId);
            }
            int _diseaseAttributeId = (int)diseaseAttributeId[diseaseAttributeId.PrimaryKeyName];

            // get a list of attributes
            var tableAttributeFields = GetAttributeToHiddenFields(TableAttributesPanel);
            // update each attribute
            //foreach (var entry in tableAttributeFields)
            //{
            //    string attributeName = entry.Key;
            //    // only update "dirty" table attributes
            //    if (dirtyTableAttributes.Contains(attributeName))
            //    {
            //        // i.e., "PageTitle"
            //        var attributeIdField = entry.Value;
            //        // i.e., "Encounter" > "PageTitle"
            //        var tableAttributeValueId = GetTableAttributeValueIdControl(TablePanel, attributeName);
            //        // i.e. "Prostate Encounter Form"
            //        var attributeValue = GetInputControlValue(GetTableAttributeValueControl(TablePanel, attributeName));
            //        // i.e., "Prostate" > "Encounter" > "PageTitle" = "Prostate Encounter Form"
            //        var diseaseAttributeValueId = GetDiseaseAttributeValueId(TablePanel, attributeName);

            //        // update/insert table attribute value
            //        int? tavid = null;
            //        MetadataTableAttributeValue biz = new MetadataTableAttributeValue();
            //        // load existing
            //        if (!string.IsNullOrEmpty(tableAttributeValueId.Value))
            //        {
            //            tavid = int.Parse(tableAttributeValueId.Value);
            //            biz.Get(tavid.Value);
            //        }
            //        // else insert
            //        else
            //        {
            //            biz[MetadataTableAttributeValue.TableAttributeId] = attributeIdField.Value;
            //            biz[MetadataTableAttributeValue.TableId] = tableId.Value;
            //        }

            //        // validate attribute value (no empty values should be saved)
            //        // TODO: move logic to base page
            //        if (string.IsNullOrEmpty(attributeValue))
            //        {
            //            // delete on empty values
            //            if (tavid.HasValue)
            //            {
            //                // delete attribute value
            //                biz.Delete(tavid.Value);
            //                tavid = null;
            //                tableAttributeValueId.Value = string.Empty;
            //                // delete disease specific mapping
            //                if (isDiseaseSpecific && !string.IsNullOrEmpty(diseaseAttributeValueId.Value))
            //                {
            //                    DiseaseAttributeValue dav = new DiseaseAttributeValue();
            //                    dav.Delete(int.Parse(diseaseAttributeValueId.Value));
            //                    diseaseAttributeValueId.Value = string.Empty;
            //                }
            //                continue;
            //            }
            //        }
            //        else
            //        {

            //            biz[MetadataTableAttributeValue.TableAttributeValue] = attributeValue;
            //            biz.Save();
            //            // update key
            //            tavid = (int)biz[biz.PrimaryKeyName];
            //            tableAttributeValueId.Value = tavid.Value.ToString();

            //            // determine if disease mapping needed (and one doesn't exist)
            //            if (isDiseaseSpecific && string.IsNullOrEmpty(diseaseAttributeValueId.Value))
            //            {
            //                // create mapping of table attirbute value to disease
            //                var diseaseMapping = _diseaseController.CreateDiseaseAttributeValue(QueryDiseaseId.Value, tableAttributeValueIdAttribute, tableAttributeValueId.Value);
            //                diseaseAttributeValueId.Value = diseaseMapping[diseaseMapping.PrimaryKeyName].ToString();
            //            }
            //        }
            //    }
            //}
            // TODO

            // SPECIAL CASE: handle columns and grid
            if (NumDisplayColumns.SelectedIndex == 2)
            {
                GridView.Checked = true;
            }

            int metadataItemKey = tableId.Value;
            foreach (var dirtyAttributeValue in tableAttributeFields)
            {
                string attributeName = dirtyAttributeValue.Key;
                // only update if there is an attribute by this name
                if (tableAttributeFields.ContainsKey(attributeName))
                {
                    IBusinessObject attributeBiz = new MetadataTableAttribute();// BusinessObjectFactory.BuildBusinessObject(BIZ_ATTRIBUTE_TABLE.TableName);
                    int? attributeId = null;
                    int? attributeValueId = null;

                    // get the table attribute id
                    ICaisisInputControl attributeIdField = tableAttributeFields[attributeName];

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
                        attributeBiz[MetadataTableAttribute.TableAttributeName] = attributeName;
                        attributeBiz.Save();

                        // update hidden attribute id field
                        attributeId = (int)attributeBiz[attributeBiz.PrimaryKeyName];
                        attributeIdField.Value = attributeId.Value.ToString();
                    }

                    // INSERT/UPDATE: Attribute Value (i.e., "FieldLabel" + "My Field" -> MetadataFieldAttributeValue)               

                    // the field representing the AttributeValueId
                    ICaisisInputControl attributeValueIdField = GetTableAttributeValueIdControl(TablePanel, attributeName);
                    // the field representing the input control containing the AttributeValue
                    ICaisisInputControl attributeValueControl = GetTableAttributeValueControl(TablePanel, attributeName);
                    // the disease mapping to the attribute value
                    ICaisisInputControl diseaseAttributeValueId = GetDiseaseAttributeValueId(TablePanel, attributeName);

                    // validate fields exists
                    if (attributeValueIdField != null && attributeValueControl != null)
                    {
                        IBusinessObject attributeValueBiz = new MetadataTableAttributeValue();// BusinessObjectFactory.BuildBusinessObject(attributeValueTableName);
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
                            attributeValueBiz[MetadataTableAttribute.TableAttributeId] = attributeId;
                            // set required metadata id (i.e., FieldId)
                            attributeValueBiz[MetadataTable.TableId] = metadataItemKey;
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
                            attributeValueBiz[MetadataTableAttributeValue.TableAttributeValue] = attributeValue;
                            attributeValueBiz.Save();
                            // update hidden field
                            attributeValueId = (int)attributeValueBiz[attributeValueBiz.PrimaryKeyName];
                            attributeValueIdField.Value = attributeValueId.ToString();

                            // handle disease specific mapping
                            if (isDiseaseSpecific)
                            {
                                var diseaseAttributeValue = new DiseaseAttributeValue();
                                if (!string.IsNullOrEmpty(diseaseAttributeValueId.Value))
                                {
                                    diseaseAttributeValue.Get(int.Parse(diseaseAttributeValueId.Value));
                                }
                                else
                                {
                                    diseaseAttributeValue[DiseaseAttributeValue.DiseaseId] = QueryDiseaseId;
                                    diseaseAttributeValue[DiseaseAttributeValue.DiseaseAttributeId] = _diseaseAttributeId;
                                }                              
                                 
                                diseaseAttributeValue[DiseaseAttributeValue.DiseaseAttributeValue_Field] = attributeValueIdField.Value;

                                diseaseAttributeValue.Save();
                                diseaseAttributeValueId.Value = diseaseAttributeValue[diseaseAttributeValue.PrimaryKeyName].ToString();
                            }
                        }
                    }
                }
            }
            // TODO
            // re-init dirty attributes
            dirtyTableAttributes.Clear();
        }

        /// <summary>
        /// Inserts MetadataFields for fields without metadata
        /// </summary>
        protected bool InsertMetadataFields()
        {
            bool newMetaFields = false;
            bool refreshVirtual = false;
            foreach (RepeaterItem item in NonMetadataFields.Items)
            {
                CheckBox cb = item.FindControl("MetaFieldCheckBox") as CheckBox;
                CheckBox isVirtual = item.FindControl("MetaFieldIsVirtual") as CheckBox;
                TextBox fieldName = item.FindControl("MetaFieldName") as TextBox;
                if (cb.Checked && !string.IsNullOrEmpty(fieldName.Text))
                {
                    MetadataField field = new MetadataField();
                    field[MetadataField.TableId] = tableId.Value;
                    field[MetadataField.FieldName] = fieldName.Text;
                    field[MetadataField.FieldSuppress] = true;
                    field[MetadataField.FieldIsVirtual] = isVirtual.Checked;
                    field.Save();

                    newMetaFields = true;
                    refreshVirtual = isVirtual.Checked || refreshVirtual;
                }
            }
            // ensure metadata field rebuilt
            if (refreshVirtual)
            {
                BOL.BusinessObject.RebuildVirtualFields();
            }
            return newMetaFields;
        }

        #endregion

        #region custom getters and setters

        /// <summary>
        /// Sets the value of the input control 
        /// </summary>
        /// <param name="attributeValueField"></param>
        /// <param name="attributeValue"></param>
        /// <param name="data"></param>
        protected override void SetInputControlValue(ICaisisInputControl attributeValueField, string attributeValue, DataRow data)
        {
            switch (attributeValueField.Field)
            {
                case ("ControlType"):
                    SetInputControlTypeDropDown(attributeValueField as CaisisSelect);
                    break;
                case ("LookupCode"):
                    BuildLookupCodePopup(attributeValueField, attributeValue);
                    break;
                default:
                    break;
            }
            // set input control value
            base.SetInputControlValue(attributeValueField, attributeValue, data);
        }

        /// <summary>
        /// Builds a list of available input control types
        /// </summary>
        /// <param name="controlTypeSelect"></param>
        private void SetInputControlTypeDropDown(CaisisSelect controlTypeSelect)
        {
            var cicTypeList = from cic in ReflectionManager.GetMetaInputControlNames()
                              // temp, centralize
                              where cic.IndexOf("Eform", 0, StringComparison.OrdinalIgnoreCase) < 0
                              orderby cic ascending
                              select cic;
            controlTypeSelect.DataSource = cicTypeList;
            controlTypeSelect.DataBind();
        }

        /// <summary>
        /// Sets client script for Lookup Code
        /// </summary>
        /// <param name="lkpField"></param>
        /// <param name="lkpCode"></param>
        private void BuildLookupCodePopup(ICaisisInputControl lkpFieldControl, string lkpFieldName)
        {
            string lkpClientId = (lkpFieldControl as Control).ClientID;
            Image lkpInfoImg = (lkpFieldControl as Control).FindControl("LookupCode_EditImg") as Image;
            string clientScript = "return viewFieldLookupCode(this, '" + lkpClientId + "');";
            lkpInfoImg.Attributes["onclick"] = clientScript;
            lkpInfoImg.ToolTip = "View " + lkpFieldName + " Lookup Codes";

            BuildLookupCodeCombo(lkpFieldControl);
        }

        /// <summary>
        /// Builds static list of available Lookup Codes
        /// </summary>
        /// <param name="combo"></param>
        private void BuildLookupCodeCombo(ICaisisInputControl icic)
        {
            if (icic is CaisisComboBox)
            {
                CaisisComboBox combo = icic as CaisisComboBox;
                combo.BuildComboData(LookupCodesTable, LookupCode.LkpFieldName, LookupCode.LkpFieldName);
            }
        }

        protected override string GetInputControlValue(ICaisisInputControl attributeValueField)
        {
            return base.GetInputControlValue(attributeValueField);
        }

        #endregion

    }
}