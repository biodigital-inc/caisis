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
    public partial class AdminEditFieldMetadataMisc : AdminBaseMetadataPage
    {
        private IDictionary<string, IEnumerable<string>> miscFieldAttributes = new Dictionary<string, IEnumerable<string>>();

        public AdminEditFieldMetadataMisc()
            : base(new MetadataField().TableName, new MetadataFieldAttribute().TableName, MetadataFieldAttribute.AttributeName, new MetadataFieldAttributeValue().TableName, MetadataFieldAttributeValue.AttributeValue)
        {
        }

        protected override void OnInit(EventArgs e)
        {
            base.OnInit(e);
            // dynamically build attributes
            AddDynamicAttributes();
        }
          

        protected override void PopulateAttributeValues()
        {
            int? _tableId = null;
            int? _fieldId = null;

            string qTableId = Request.QueryString["tableId"];
            string qFieldId = Request.QueryString["fieldId"];
            if (!string.IsNullOrEmpty(qTableId))
            {
                _tableId = int.Parse(qTableId);
                if (!string.IsNullOrEmpty(qFieldId))
                {
                    _fieldId = int.Parse(qFieldId);
                }
            }
            if (!_tableId.HasValue)
                return;

            // populate table field attributes
            MetadataDa da = new MetadataDa();
            DataTable dt = da.GetFieldMetadata(_tableId.Value, QueryDiseaseId);

            // build a list of unique metadata tables with there associated metadata
            var tableToAttributes = from row in dt.AsEnumerable()
                                    let fieldId = (int)row[MetadataField.FieldId]
                                    // restrict to single field (if applicable)
                                    where !_fieldId.HasValue || fieldId == _fieldId
                                    group row by fieldId into groupByField
                                    let filedName = groupByField.First()[MetadataField.FieldName].ToString()
                                    let fieldSort = groupByField.First()[MetadataField.FieldOrder].ToString()
                                    // sort by field sort order, with null to bottom
                                    let sort = !string.IsNullOrEmpty(fieldSort) ? int.Parse(fieldSort) : int.MaxValue
                                    orderby sort ascending, filedName ascending
                                    select new
                                    {
                                        TableId = _tableId,
                                        FieldId = groupByField.Key,
                                        FieldName = filedName,
                                        //FieldSuppress = groupByField.First()[MetadataField.FieldSuppress],
                                        //FieldOrder = groupByField.First()[MetadataField.FieldOrder],
                                        Data = groupByField,
                                        DiseaseAttributes = from record in groupByField
                                                            where !record.IsNull(DiseaseAttributeValue.DiseaseAttributeValueId)
                                                            select record
                                    };
            MetadataGrid.DataSource = tableToAttributes;
            MetadataGrid.DataBind();
        }

        private void AddDynamicAttributes()
        {
            // FIELD ATTRIBUTES
            var excludedFieldAttributes = GetExcludedAttributes();
            var missingFieldAttributes = from b in BOL.BusinessObject.GetAll<MetadataFieldAttribute>()
                                         let attribute = b[MetadataFieldAttribute.AttributeName].ToString()
                                         let attributeId = (int)b[MetadataFieldAttribute.AttributeId]
                                         // exclude attributes in list
                                         where !excludedFieldAttributes.Contains(attribute, StringComparer.OrdinalIgnoreCase)
                                         orderby attribute ascending
                                         select new
                                         {
                                             Attribute = attribute,
                                             AttributeOptions = BOL.BusinessObject.GetByParent<MetadataFieldAttributeValueOption>(attributeId).Select(option => option[BOL.MetadataFieldAttributeValueOption.AttributeOptionValue].ToString())
                                         };
            // set list of misc attributes
            miscFieldAttributes = missingFieldAttributes.ToDictionary(a => a.Attribute, a => a.AttributeOptions);
            // dynamically add to attribute id container
            foreach (string miscAttribute in miscFieldAttributes.Keys)
            {
                CaisisHidden attributeField = new CaisisHidden();
                attributeField.Table = "MetadataFieldAttributes";
                attributeField.Field = miscAttribute;
                attributeField.ID = miscAttribute + "_FieldAttributeId";

                MetadataAttributesContainer.Controls.Add(attributeField);
            }
        }

        protected void AddDynamicFieldAttributes(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                Control miscAttributesHolder = e.Row.FindControl("MiscFieldAttributesPanel");
                // when panel loaded, dynamically add misc field attributes and attach change handlers
                foreach (var attributePair in miscFieldAttributes)
                {
                    string attributeName = attributePair.Key;
                    IEnumerable<string> attributeValueOptions = attributePair.Value;
                    // add attribute and optional list of available values
                    DynamicallyAddAttribute(miscAttributesHolder, attributeName, "MetadataFieldAttributeValues", attributeValueOptions);
                }
                //// after adding attribute values, track dirty fields (todo: add to base logic)
                //var inputControls = PageUtil.GetCaisisInputControlsInContainer(miscAttributesHolder);
                //inputControls.ForEach(c => c.ValueChanged += base.MarkRowDirty);

            }
            // todo: normalize tracking of fields
            base.AddChangeEventHanlders(sender, e);
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="container"></param>
        /// <param name="attributeName"></param>
        /// <param name="attributeValueTable"></param>
        /// <param name="attributeValueOptions"></param>
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
        /// Returns a list of field attributes to exclude from dynamically generated list
        /// </summary>
        /// <returns></returns>
        private IEnumerable<string> GetExcludedAttributes()
        {
            string excludeAttributes = Request.QueryString["exclude"];
            if (!string.IsNullOrEmpty(excludeAttributes))
            {
                return excludeAttributes.Split(',');
            }
            else
            {
                return new string[0];
            }
        }
    }
}