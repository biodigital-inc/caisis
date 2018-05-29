using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using System.Data;

using Caisis.BOL;
using Caisis.DataAccess;

using Caisis.UI.Core.Classes;
using Caisis.UI.Core.Classes.CustomControls;

namespace Caisis.UI.Admin
{
    public partial class Table_EditForms : AdminBaseMetadataPage
    {
        private List<RepeaterItem> dirtyRows = new List<RepeaterItem>();

        private List<string> dirtyTableNames = new List<string>();

        public Table_EditForms()
            : base(new MetadataTable().TableName, new MetadataTableAttribute().TableName, MetadataTableAttribute.TableAttributeName, new MetadataTableAttributeValue().TableName, MetadataTableAttributeValue.TableAttributeValue)
        {
        }

        protected override void Page_Load(object sender, EventArgs e)
        {
            base.Page_Load(sender, e);
            if (!Page.IsPostBack)
            {
            }
        }

        protected override void PopulateAttributeValues()
        {
            dirtyRows.Clear();
            Caisis.Controller.PatientDataEntryController pdec = new Caisis.Controller.PatientDataEntryController(QueryDiseaseName);

            MetadataDa da = new MetadataDa();
            // step 1: get all tables (optionally filtered attributes by disease)
            var allTables = da.GetAllTableMetadata(null, QueryDiseaseId).AsEnumerable();
            
            // step 2: get all metadata tables
            var tableLookup = (from table in BOL.BusinessObject.GetAll<MetadataTable>()
                               select new
                               {
                                   TableId = (int)table[MetadataTable.TableId],
                                   TableName = table[MetadataTable.TableName_Field].ToString()
                               }).ToDictionary(a => a.TableName, a => a.TableId);

            // step 3: build lookup of metadata and disease specific mappings
            var metadataLookup = (from row in allTables
                                  let tableId = (int)row[MetadataTable.TableId]
                                  group row by tableId into tableMetadata
                                  let source = tableMetadata.First()
                                  select new
                                  {
                                      TableName = source[MetadataTable.TableName_Field].ToString(),
                                      TableMetadata = tableMetadata,
                                      DiseaseAttributes = from record in tableMetadata
                                                          where !record.IsNull(DiseaseAttributeValue.DiseaseAttributeValueId)
                                                          select record
                                  }).ToDictionary(
                                    a => a.TableName,
                                    a => new KeyValuePair<IEnumerable<DataRow>, IEnumerable<DataRow>>
                                        (a.TableMetadata,
                                        a.DiseaseAttributes)
                                 );

            // step 4: get tree structure of tables
            var depthMap = Caisis.Controller.PatientDataEntryController.GetPatientDataEntryMapLookup(tableLookup.Keys);
            
            // step 5: build data grid data source
            var dataSource = from entry in depthMap
                             let table = entry.Key
                             let tableId = tableLookup[table]
                             let tableMetadata = metadataLookup.ContainsKey(table) ? metadataLookup[table].Key : new DataRow[0]
                             let diseaseAttributes = metadataLookup.ContainsKey(table) ? metadataLookup[table].Value : new DataRow[0]
                             select new
                             {
                                 TableId = tableId,
                                 TableName = table,
                                 TableLabel = pdec.GetTableLabel(table),
                                 TableIcon = pdec.GetTableIcon(table, true),
                                 TableDepth = depthMap[table],
                                 Data = tableMetadata,
                                 DiseaseAttributes = diseaseAttributes
                             };

            //var tablesNames = allTables.Select(r => r[MetadataTable.TableName_Field].ToString()).Distinct();
            //var depthMap = Caisis.Controller.PatientDataEntryController.GetTableDepthMapLookup(tablesNames, true);
            //// build a list of unique metadata tables with there associated metadata
            //var tableToAttributes = from row in allTables
            //                        let tableId = (int)row[MetadataTable.TableId]
            //                        group row by tableId into groupByTable
            //                        let tableName = groupByTable.First()[MetadataTable.TableName_Field].ToString()
            //                        orderby tableName ascending
            //                        select new
            //                        {
            //                            TableId = groupByTable.Key,
            //                            TableName = tableName,
            //                            TableLabel = pdec.GetTableLabel(tableName),
            //                            TableIcon = pdec.GetTableIcon(tableName, true),
            //                            TableDepth = depthMap.ContainsKey(tableName) ? depthMap[tableName] : 0,
            //                            Data = groupByTable,
            //                            DiseaseAttributes = from record in groupByTable
            //                                                where !record.IsNull(DiseaseAttributeValue.DiseaseAttributeValueId)
            //                                                select record
            //                        };

            //var dbTables = BOL.BusinessObject.GetAllTableNames();
            //tableToAttributes = from table in dbTables
            //                    join meta in tableToAttributes on table equals meta.TableName
            //                    select meta;

            //// get tables in depth map
            //var hasDepthEntry = from d in depthMap
            //                    join t in tableToAttributes on d.Key equals t.TableName
            //                    select t;
            //// append tables not in depth map
            //var dataSource = hasDepthEntry.Concat(tableToAttributes.Except(hasDepthEntry));
            
            
            // bind table attributes data source
            MetadataGrid.DataSource = dataSource;
            MetadataGrid.DataBind();
        }

        /// <summary>
        /// During postback, track tables which have updated attributes.
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void TrackDirtyTables(object sender, EventArgs e)
        {
            CheckBox cb = sender as CheckBox;
            string tableName = (cb.NamingContainer.FindControl("TableName_Field") as HiddenField).Value;
            if (!dirtyTableNames.Contains(tableName))
            {
                dirtyTableNames.Add(tableName);
            }
        }

        /// <summary>
        /// Shows the disease specific icon when applicable
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void SetDiseaseSpecificIcon(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                // if in disease specific view
                if (QueryDiseaseId.HasValue)
                {
                    var diseaseSpecificIcon = e.Row.FindControl("DiseaseSpecificIcon") as Image;
                    IEnumerable<DataRow> allMetadata = DataBinder.Eval(e.Row.DataItem, "Data") as IEnumerable<DataRow>;
                    IEnumerable<DataRow> diseaseMetadata = DataBinder.Eval(e.Row.DataItem, "DiseaseAttributes") as IEnumerable<DataRow>;
                    // find disease specific table suppress attribute
                    var tableSuprress = diseaseMetadata.Where(r => r[MetadataTableAttribute.TableAttributeName].ToString() == "TableSuppress").FirstOrDefault();
                    diseaseSpecificIcon.Visible = tableSuprress != null;
                }
            }
        }

        /// <summary>
        /// Update tables' "Form" attribute
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void SaveClick(object sender, EventArgs e)
        {
            // update tables
            base.Update();

            // refresh metadata for each table
            foreach (string table in dirtyTableNames)
            {
                BOL.BusinessObject.RefreshTableMetadataFromDatabase(table);
            }
            dirtyTableNames.Clear();

            CacheManager.RefreshPatientDataCache(QueryDiseaseName);
            
            // regitser update script
            Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "closeDataEntry", "closeDataEntry();", true);
        }
    }
}