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
using System.Linq;

using Caisis.Controller;
using Caisis.UI.Core;
using Caisis.UI.Core.Classes;
using Caisis.UI.Core.Classes.CustomControls;
using Caisis.BOL;
using Caisis.DataAccess;

namespace Caisis.UI.Modules.All.DataEntryForms
{
    public partial class AbsentEventForm : BasePatientDataControl
    {
        private static readonly string NoTableFieldsLabel = "-- No Absent Event Fields --";

        private PatientDataEntryController _dataEntryController = new PatientDataEntryController();

        protected override void OnInit(EventArgs e)
        {
            base.OnInit(e);

            // During init load, bind list of Tables
            if (!Page.IsPostBack)
            {
                BindAbsentEventTables();
            }

            // Add Event Handlers to main DropDowns (Table and Field)
            DropDownList tableNameDropDown = TableNameField as DropDownList;
            DropDownList tableFieldDropDown = FieldNameField as DropDownList;

            // Anytime TableName of FieldName changes, reset Mappings
            tableNameDropDown.SelectedIndexChanged += new EventHandler(ResetFieldValueMappings);
            tableFieldDropDown.SelectedIndexChanged += new EventHandler(ResetFieldValueMappings);

            // Build DropDown and Metadata
            tableNameDropDown.SelectedIndexChanged += new EventHandler(BuildFieldNames);
            tableFieldDropDown.SelectedIndexChanged += new EventHandler(BuildFieldValues);

            // Set DropDown enable property
            tableNameDropDown.PreRender += new EventHandler(SetDropDownEnable);
            tableFieldDropDown.PreRender += new EventHandler(SetDropDownEnable);
        }

        protected override void Page_Load(object sender, EventArgs e)
        {
            base.Page_Load(sender, e);
            BuildFieldValues(sender, e);
        }

        /// <summary>
        /// Bind AbsentEvent Tables dropdown
        /// </summary>
        private void BindAbsentEventTables()
        {
            // get a list of absent event tables
            IDictionary<string, string> absentEventTables = _dataEntryController.GetAbsentEventTables();
            TableNameField.DataSource = absentEventTables;
            TableNameField.DataBind();
        }

        /// <summary>
        /// Binds the list of Fields belonging to the selected Table
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void BuildFieldNames(object sender, EventArgs e)
        {
            string tableName = TableNameField.Value;

            if (!string.IsNullOrEmpty(tableName))
            {
                // get a list of absent event table fields
                IDictionary<string, string> absentEventFields = _dataEntryController.GetAbsentEventFields(tableName);
                FieldNameField.DataSource = absentEventFields;
                FieldNameField.DataBind();

                if (absentEventFields.Count == 0)
                {
                    FieldNameField.Items.Add(new ListItem(NoTableFieldsLabel, string.Empty));
                }
            }
            else
            {
                FieldNameField.Items.Clear();
            }
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void SetDropDownEnable(object sender, EventArgs e)
        {
            if (sender is CaisisSelect)
            {
                CaisisSelect dropDown = sender as CaisisSelect;
                //dropDown.Enabled = string.IsNullOrEmpty(AbsentEventIdField.Value);
            }
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void ResetFieldValueMappings(object sender, EventArgs e)
        {
            FieldValueField.Value = string.Empty;
        }

        /// <summary>
        /// Build the Field Values Control based on metadata
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void BuildFieldValues(object sender, EventArgs e)
        {
            string selectedTable = TableNameField.Value;
            string selectedField = FieldNameField.Value;

            if (!string.IsNullOrEmpty(selectedTable) && !string.IsNullOrEmpty(selectedField))
            {
                SetFieldValueMetaData(selectedTable, selectedField);
            }
        }

        /// <summary>
        /// Sets field metadata for current table field
        /// </summary>
        /// <param name="tableName"></param>
        /// <param name="fieldName"></param>
        private void SetFieldValueMetaData(string tableName, string fieldName)
        {
            // Verify there is a table and field used for creation
            if (!string.IsNullOrEmpty(tableName) && !string.IsNullOrEmpty(fieldName) && !fieldName.Equals(NoTableFieldsLabel))
            {
                // get field metadata
                IDictionary<string, string> fieldMetadata = _dataEntryController.GetFieldMetadata(tableName, fieldName);

                // set special attributes
                string metaFieldLabel = fieldMetadata.ContainsKey("FieldLabel") ? fieldMetadata["FieldLabel"] : "";
                string metaLookupCode = fieldMetadata.ContainsKey("LookupCode") ? fieldMetadata["LookupCode"] : "";
                string metaLookupDistinct = fieldMetadata.ContainsKey("LookupDistinct") ? fieldMetadata["LookupDistinct"] : "";

                FieldValueField.FieldLabel = metaFieldLabel;
                FieldValueField.LookupCode = metaLookupCode;
                FieldValueField.LookupDistinct = metaLookupDistinct;
            }
        }
    }
}