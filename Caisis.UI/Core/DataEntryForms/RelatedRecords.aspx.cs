using System;
using System.Data;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Xml;

using Caisis.BOL;
using Caisis.DataAccess;
using Caisis.Controller;
using Caisis.UI.Core.Classes;

namespace Caisis.UI.Core
{
    public partial class RelatedRecords : BasePage
    {
        /// <summary>
        /// A list of relation strengths for interface.
        /// </summary>
        private int[] RelationStrengths = new int[] { 0, 1, 2, 3, 4 };

        private RelatedRecordController rc = new RelatedRecordController();
        private PatientDataEntryController pdec = new PatientDataEntryController();

        /// <summary>
        /// Cached list of data entry fields for display purposed
        /// </summary>
        private Dictionary<string, Dictionary<string, string>> cachedDataEntryFields = new Dictionary<string, Dictionary<string, string>>();
         
        /// <summary>
        /// The default SrcTableName passed in query string (optional)
        /// </summary>
        protected string SrcTableName
        {
            get
            {
                return Request.QueryString["srcTableName"];
            }
        }

        /// <summary>
        /// The DestTableName passed via query string (required)
        /// </summary>
        protected string DestTableName
        {
            get
            {
                return Request.QueryString["destTableName"];
            }
        }

        /// <summary>
        /// The DestPrimaryKey passed via query string (required for relating actual records)
        /// </summary>
        protected string DestTablePrimaryKey
        {
            get
            {
                return Request.QueryString["destTablePrimaryKey"];
            }
        }

        /// <summary>
        /// The EformId passed via query string (required for relating to eform records)
        /// </summary>
        private string EformId
        {
            get
            {
                return Request.QueryString["eformId"];
            }
        }

        /// <summary>
        /// The RecordId of the DestTableName passed via query string (required for realting to eform records) 
        /// </summary>
        private string EformRecordId
        {
            get
            {
                return Request.QueryString["recordId"];
            }
        }               

        /// <summary>
        /// The client id to update text when relations updated.
        /// </summary>
        protected string RelatedClientId
        {
            get
            {
                return Request.QueryString["relatedClientId"];
            }
        }

        /// <summary>
        /// Returns if working with an actual DestTableName record
        /// </summary>
        protected bool IsActualRecord
        {
            get
            {
                return !string.IsNullOrEmpty(DestTableName) && !string.IsNullOrEmpty(DestTablePrimaryKey);
            }
        }

        /// <summary>
        /// Returns if working with an eform record
        /// </summary>
        private bool IsEform
        {
            get
            {
                return !string.IsNullOrEmpty(DestTableName) && !string.IsNullOrEmpty(EformId) && !string.IsNullOrEmpty(EformRecordId);
            }
        }

        #region Column Display

        protected string GetDisplayColumn(object dataItem)
        {
            string tableName = SourceTables.SelectedValue;
            return GetDisplayColumn(dataItem, tableName);
        }

        /// <summary>
        /// Returns the displayable column value for the current related record table. (i.e., Procedures=ProcName)
        /// </summary>
        /// <param name="dataItem"></param>
        /// <param name="tableName"></param>
        /// <returns></returns>
        protected string GetDisplayColumn(object dataItem, string tableName)
        {
            string fieldName = rc.GetRelatedRecordField(tableName);
            fieldName = !string.IsNullOrEmpty(tableName) && !string.IsNullOrEmpty(fieldName) && BusinessObject.HasField(tableName, fieldName) ? fieldName : string.Empty;
            return GetDisplayColumn(dataItem, tableName, fieldName);
        }

        /// <summary>
        /// Returns the displayable column value for the current related record table. (i.e., Procedures=ProcName)
        /// </summary>
        /// <param name="dataItem"></param>
        /// <param name="tableName"></param>
        /// <param name="fieldName"></param>
        /// <returns></returns>
        protected string GetDisplayColumn(object dataItem, string tableName, string fieldName)
        {
            string fieldValue = string.Empty;
            if (!string.IsNullOrEmpty(fieldName))
            {
                fieldValue = DataBinder.Eval(dataItem, fieldName).ToString();
            }
            return !string.IsNullOrEmpty(fieldValue) ? fieldValue : "[" + pdec.GetTableLabel(tableName) + "]";
        }

        /// <summary>
        /// Gets the friendly display label for the related record (i.e., "Proctectomy (4/23/2009)"
        /// </summary>
        /// <param name="dataItem"></param>
        /// <returns></returns>
        protected string GetRelatedRecordDisplayLabel(object dataItem)
        {
            string srcTableName = DataBinder.Eval(dataItem, RelatedRecord.SrcTableName).ToString();
            string srcTableField = DataBinder.Eval(dataItem, "SrcTableField").ToString();
            string srcTableSortField = DataBinder.Eval(dataItem, "SrcTableSortField", "{0:d}").ToString();

            string displayValue = !string.IsNullOrEmpty(srcTableField) ? srcTableField : "[" + pdec.GetTableLabel(srcTableName) + "]";
            if (!string.IsNullOrEmpty(srcTableSortField))
            {
                displayValue += " (" + srcTableSortField + ")";
            }
            return displayValue;
        }

        /// <summary>
        /// Gets the user friendly table name
        /// </summary>
        /// <param name="tableName"></param>
        /// <returns></returns>
        protected string GetTableLabel(string tableName)
        {
            return pdec.GetTableLabel(tableName);
        }

        /// <summary>
        /// Gets the main title
        /// </summary>
        /// <returns></returns>
        protected string GetAttributionTitle()
        {
            string label = Request.QueryString["label"];
            if (!string.IsNullOrEmpty(label))
            {
                return label;
            }
            // default
            return GetTableLabel(DestTableName);
        }

        #endregion             

        protected override void Page_Load(object sender, EventArgs e)
        {
            //base.Page_Load(sender, e);
            if (!ProcessAjaxRequest())
            {
                if (!Page.IsPostBack)
                {
                    // build related table names
                    BuildRelatedTableNames();
                    // select default
                    if (!string.IsNullOrEmpty(SrcTableName))
                    {
                        Caisis.UI.Core.Classes.PageUtil.SelectDropDownItem(SourceTables, SrcTableName);
                        BuildRelatedRecords(SourceTables, new EventArgs());
                    }
                }
            }
        }

        /// <summary>
        /// If page is invoked from a POSTed AJAX request (methodName), build output list
        /// </summary>
        /// <returns></returns>
        private bool ProcessAjaxRequest()
        {
            string method = Request.Form["methodName"];
            string destTableName = Request.Form["destTableName"];
            string destPrimaryKey = Request.Form["destTablePrimaryKey"];
            switch (method)
            {
                case ("GetRelatedRecords"):
                    if (!string.IsNullOrEmpty(destTableName) && !string.IsNullOrEmpty(destPrimaryKey))
                    {
                        SessionHandler sh = new SessionHandler(Session);
                        int patientId = sh.GetPatientId();
                        int destTablePriKey = int.Parse(destPrimaryKey);
                        DataView relatedRecords = rc.GetRelatedRecordsByTableAndKey(patientId, destTableName, destTablePriKey);
                        relatedRecords.Sort = "SrcTableSortField ASC";

                        RelatedRecordsRptr.DataSource = relatedRecords;
                        RelatedRecordsRptr.DataBind();
                        return true;
                    }
                    break;
                default:
                    break;
            }
            return false;
        }

        /// <summary>
        /// Sets hidden RelatedRecord ids and radios for current associations
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void SetRelatedRadioButtons(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                // set src pri key (required)
                string srcTable = SourceTables.SelectedValue;
                string srcTableKeyName = BOL.BusinessObject.GetPrimaryKeyName(srcTable);
                string srcTableId = DataBinder.Eval(e.Item.DataItem, srcTableKeyName).ToString();
                HiddenField srcTableKeyField = e.Item.FindControl("SrcTablePriKey") as HiddenField;
                srcTableKeyField.Value = srcTableId;

                // set relation strength if currently associated
                string relatedRecordId = DataBinder.Eval(e.Item.DataItem, RelatedRecord.RelatedRecordId).ToString();
                string relationStrengthValue = DataBinder.Eval(e.Item.DataItem, RelatedRecord.RelationStrength).ToString();

                // set related record id (optional)
                HiddenField relatedRecordIdField = e.Item.FindControl("RelatedRecordId") as HiddenField;
                if (!string.IsNullOrEmpty(relationStrengthValue))
                {
                    // set relation strength
                    foreach (int relationStrength in RelationStrengths)
                    {
                        RadioButton relationRadio = e.Item.FindControl("Relation_Radio_" + relationStrength) as RadioButton;
                        if (relationStrength.ToString() == relationStrengthValue)
                        {
                            relationRadio.Checked = true;
                            if (!string.IsNullOrEmpty(relatedRecordId))
                            {
                                relatedRecordIdField.Value = relatedRecordId;
                            }
                        }
                    }
                }
            }
        }

        /// <summary>
        /// Builds Rptr containing each Source Table's record details
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void BuildRelatedDetails(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                // build related record details (use list of fields from data entry to build details)
                string srcTableName = SourceTables.SelectedValue;
                IDictionary<string, string> displayDataEntryFields = GetDataEntryDisplayFields(srcTableName);
                var dataEntryFieldsAndValue = from field in displayDataEntryFields
                                              let fieldName = field.Key
                                              let fieldLabel = field.Value
                                              let fieldValue = DataBinder.Eval(e.Item.DataItem, fieldName).ToString()
                                              // filter out fields without values
                                              where !string.IsNullOrEmpty(fieldValue)
                                              select new
                                              {
                                                  FieldName = fieldName,
                                                  FieldLabel = fieldLabel,
                                                  FieldValue = fieldValue
                                              };
                // display details
                Repeater detailsRptr = e.Item.FindControl("RelatedRecordsDetailsRptr") as Repeater;
                detailsRptr.DataSource = dataEntryFieldsAndValue;
                detailsRptr.DataBind();
            }
        }

        protected void SaveClick(object sender, EventArgs e)
        {
            Save();
            BuildRelatedRecords(sender, e);
        }

        private void Save()
        {
            // required
            string sourceTable = SourceTables.SelectedValue;
            string destTable =  DestTableName;
            int? destPriKey = null;
            Dictionary<string, Dictionary<int, string>> tablesRecordsAndKeys = new Dictionary<string,Dictionary<int,string>>();
             tablesRecordsAndKeys.Add(sourceTable, new Dictionary<int,string>());
            var recordsAndKeys = tablesRecordsAndKeys[sourceTable];
            // determine if using actual records or eform        
            if (IsActualRecord)
            {
                destPriKey = int.Parse(DestTablePrimaryKey);
            }     

            foreach (RepeaterItem item in TableRecordsRptr.Items)
            {
                // get related record if (if it exists)
                HiddenField srcTableKeyField = item.FindControl("SrcTablePriKey") as HiddenField;
                HiddenField relatedRecordIdField = item.FindControl("RelatedRecordId") as HiddenField;

                // get dest key (should always exist)
                int srcPriKey = int.Parse(srcTableKeyField.Value);
                // get existing related record (if exists)
                int? relatedRecordId = null;
                if (!string.IsNullOrEmpty(relatedRecordIdField.Value))
                {
                    relatedRecordId = int.Parse(relatedRecordIdField.Value);
                }

                // iterate relation strengths and insert/update/delete relation (if applicable)
                bool doDelete = true;

                // mark inital strength for update/insert/delete, empty
                recordsAndKeys[srcPriKey] = string.Empty;

                foreach (int relationStrength in RelationStrengths)
                {
                    RadioButton relationRadio = item.FindControl("Relation_Radio_" + relationStrength) as RadioButton;
                    if (relationRadio.Checked)
                    {
                        // once an item is checked, no need to delete
                        doDelete = false;

                        // mark updated relation
                        recordsAndKeys[srcPriKey] = relationStrength.ToString();

                        // if record exists (updated strength)
                        if (relatedRecordId.HasValue)
                        {
                            RelatedRecord biz = new RelatedRecord();
                            biz.Get(relatedRecordId.Value);
                            biz[RelatedRecord.RelationStrength] = relationStrength;
                            biz.Save();
                        }
                        // if there is a destination, update
                        else if (destPriKey.HasValue)
                        {
                            RelatedRecord biz = RelatedRecordController.CreateRelatedRecord(RelatedRecordController.SOURCE_SYSTEM, sourceTable, srcPriKey, destTable, destPriKey.Value, relationStrength, true);
                        }
                        else if (IsEform)
                        {
                            // handled by update map
                        }

                        // only 1 checked radio per row
                        break;
                    }
                }
                // if no items have been checked, remove related record
                if (doDelete)
                {
                    // delete real relation
                    if (relatedRecordId.HasValue)
                    {
                        RelatedRecord biz = new RelatedRecord();
                        biz.Delete(relatedRecordId.Value);
                        // update keys
                        relatedRecordId = null;
                        relatedRecordIdField.Value = string.Empty;
                    }
                    // delete eform reation
                    else if (IsEform)
                    {
                        // handled by update map
                    }
                }
            }
            // for eforms, insert/update/delete relationships
            if (IsEform)
            {
                // udpate xml
                XmlDocument eformXML = GetEformXml();
                rc.UpdateEformRelatedRecords(eformXML, DestTableName, EformRecordId, tablesRecordsAndKeys);
                // update record
                EForm biz = new EForm();
                biz.Get(int.Parse(EformId));
                biz[EForm.EFormXML] = eformXML.OuterXml;
                biz.Save();
            }
            // Register update script
            if (!string.IsNullOrEmpty(RelatedClientId))// && sourceTable == SrcTableName)
            {
                var relationStrengths = tablesRecordsAndKeys.SelectMany(a => a.Value.Select(b => b.Value)).Where(a => !string.IsNullOrEmpty(a));
                string clientRelationArray = "[" + string.Join(",", relationStrengths.ToArray()) + "]";
                Page.ClientScript.RegisterStartupScript(this.GetType(), "refreshAndCloseRelatedRecords", "refreshAndCloseRelatedRecords('" + RelatedClientId + "', " + clientRelationArray + ");", true);
            }
            else
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "refreshAndCloseRelatedRecords", "refreshAndCloseRelatedRecords();", true);
            }
        }

        /// <summary>
        /// Builds a list of relatable table names
        /// </summary>
        private void BuildRelatedTableNames()
        {
            SessionHandler sh = new SessionHandler(Session);
            int patientId = sh.GetPatientId();

            // only allow child tables which are direct children of Patients
            Patient patient = new Patient();
            string parTableName = patient.TableName;
            string parKeyName = Patient.PatientId;
            int parKey = patientId;

            // get a list of relateable tables
            var relatedRecordsTables = GetRelatedTables();
            // get a list of records and their counts (children of patients table)
            var tablesAndCounts = from table in relatedRecordsTables
                                  let tableName = table.Key
                                  let tableLabel = table.Value
                                  let doLookupCount = BOL.BusinessObject.GetParentTablename(tableName) == parTableName && BOL.BusinessObject.GetParentKeyName(tableName) == parKeyName
                                  let recordCount = doLookupCount ? BOL.BusinessObject.Count(tableName, new Dictionary<string, object> { { parKeyName, parKey } }) : 0
                                  let normalizedCount = recordCount + (DestTableName == tableName ? -1 : 0)
                                  // only allow tables with records
                                  where !doLookupCount || normalizedCount > 0
                                  select new
                                  {
                                      TableName = tableName,
                                      TableLabel = tableLabel + " (" + (doLookupCount ? normalizedCount.ToString() : "N/A") + ")"
                                  };

            SourceTables.DataSource = tablesAndCounts;
            SourceTables.DataBind();
        }

        protected void BuildRelatedRecords(object sender, EventArgs e)
        {
            string sourceTable = SourceTables.SelectedValue;
            object relatedDataSource = null;

            if (!string.IsNullOrEmpty(sourceTable))
            {
                string sourcePriKeyName = BOL.BusinessObject.GetPrimaryKeyName(sourceTable);
                int? destPriKey = null;
                if (!string.IsNullOrEmpty(DestTablePrimaryKey))
                {
                    destPriKey = int.Parse(DestTablePrimaryKey);
                }
                string destPriKeyName = BOL.BusinessObject.GetPrimaryKeyName(DestTableName);

                SessionHandler sh = new SessionHandler(Session);
                int patientId = sh.GetPatientId();

                // get a list of all records from dest table with optional relation (filter out self)
                DataTable relatedTable = RelatedRecordsDa.GetRelatedRecordsByTableAndKey(patientId, DestTableName, destPriKeyName, destPriKey, sourceTable, sourcePriKeyName, false);
                DataView relatedRecords = relatedTable.DefaultView;
                // actual records
                if (destPriKey.HasValue)
                {
                    // set dest table and dest key to actual values
                    relatedTable.Columns[RelatedRecord.DestTableName].Expression = "'" + DestTableName + "'";
                   // relatedTable.Columns[RelatedRecord.DestPrimaryKey].Expression = destPriKeyName;

                    // exclude current table relation
                    if (sourceTable == DestTableName)
                    {
                        relatedRecords.RowFilter = sourcePriKeyName + " <> " + destPriKey;
                    }
                }
                // eform records (load eform, then update data source with related strengths)
                else if (IsEform)
                {
                    XmlDocument eformXML = GetEformXml();
                    // get a list of currenly associated records to node
                    var eFormTablesAndRelations = rc.GetEformRelatedRecords(eformXML, DestTableName, EformRecordId);
                    if (eFormTablesAndRelations.ContainsKey(sourceTable))
                    {
                        var sourceTableRelations = eFormTablesAndRelations[sourceTable];
                        // for each related record, find match data row and update Strength value
                        foreach (var eFormRelatedRecord in sourceTableRelations)
                        {
                            int srcPriKey = eFormRelatedRecord.Key;
                            int strength = eFormRelatedRecord.Value;
                            // check for rows which are realted (i.e.,ProcedureId = SrcPriKey), no need to test SrcTable
                            foreach (DataRow row in relatedTable.Select(sourcePriKeyName + " = " + srcPriKey))
                            {
                                row[RelatedRecord.RelationStrength] = strength;
                            }
                        }
                    }
                }
                // determine if sorting
                string sortColumn = rc.GetRelatedSortColumn(sourceTable);
                if (!string.IsNullOrEmpty(sortColumn))
                {
                    relatedRecords.Sort = sortColumn + " ASC";
                }
                relatedDataSource = relatedRecords;

                // build data source, releated records and details
                if (relatedRecords.Count > 0)
                {
                    TableRecordsRptr.Visible = true;
                    TableRecordsRptr.DataSource = relatedDataSource;
                    TableRecordsRptr.DataBind();

                    TableRecordsDetailsRptr.DataSource = relatedDataSource;
                    TableRecordsDetailsRptr.DataBind();
                    AttributionTableRelationStrengthHeading.Visible = true;
                    RelationStrengthLookup.Visible = true;
                    NoRecordsMsgRow.Visible = false;
                }
                else
                {
                    TableRecordsRptr.Visible = false;
                    AttributionTableRelationStrengthHeading.Visible = false;
                    RelationStrengthLookup.Visible = false;
                    NoRecordsMsgRow.Visible = true;
                }

            }
        }

        #region UTILITIES (eform helper, display helpers, etc...

        /// <summary>
        /// Returns the XmlDocuemnt represented in the eform record
        /// </summary>
        /// <returns></returns>
        private XmlDocument GetEformXml()
        {
            // load eform
            XmlDocument eformXML = new XmlDocument();
            int eformId = int.Parse(EformId);
            EForm eForm = new EForm();
            eForm.Get(eformId);
            if (!eForm.IsNull(BOL.EForm.EFormXML))
            {
                eformXML.LoadXml(eForm[BOL.EForm.EFormXML].ToString());
            }
            return eformXML;
        }

        /// <summary>
        /// Gets a list of tables marked for using as relatable tables
        /// </summary>
        /// <returns></returns>
        private IDictionary<string, string> GetRelatedTables()
        {
            // check query string for manual list of related tables
            string queryRelatedTables = Request.QueryString["relatedTables"];
            IDictionary<string, string> relatedSrcTables = new Dictionary<string, string>();
            if (!string.IsNullOrEmpty(queryRelatedTables))
            {
                var tables = from table in queryRelatedTables.Split(",".ToCharArray(), StringSplitOptions.RemoveEmptyEntries)
                             where pdec.IsTable(table)
                             select table;
                // validate names
                if (tables.Count() > 0)
                {
                    relatedSrcTables = pdec.GetDataEntryFormLabels(tables);
                }
            }

            // default: use metadata if no related tables specified
            relatedSrcTables = relatedSrcTables.Count() > 0 ? relatedSrcTables : rc.GetRelatedRecordTablesAndLabels();

            // add defatult table
            if (!string.IsNullOrEmpty(SrcTableName) && !relatedSrcTables.ContainsKey(SrcTableName))
            {
                relatedSrcTables.Add(SrcTableName, pdec.GetTableLabel(SrcTableName));
            }
            // validation: only allow tables related to Patients
            return (from table in relatedSrcTables
                    where BOL.BusinessObject.GetParentTablename(table.Key) == "Patients"
                    select table).ToDictionary(a => a.Key, a => a.Value);
        }

        /// <summary>
        /// Returns a list of data entry fields displayed on data entry forms 
        /// </summary>
        /// <param name="tableName"></param>
        /// <returns></returns>
        private IDictionary<string, string> GetDataEntryDisplayFields(string tableName)
        {
            // determine if table fields are cached, else build lookup
            if (!cachedDataEntryFields.ContainsKey(tableName))
            {
                cachedDataEntryFields.Add(tableName, CICHelper.GetCaisisInputFields(tableName));
            }
            return cachedDataEntryFields[tableName];
        }

        #endregion
    }
}