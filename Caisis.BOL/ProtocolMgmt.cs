using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

using System.Text;
using System.IO;

// XML
using System.Xml;
using System.Xml.Schema;
using System.Xml.Serialization;
using System.Xml.Linq;
using System.Xml.XPath;

using System.Reflection;
using System.ComponentModel;
using System.CodeDom;
using System.CodeDom.Compiler;
using Microsoft.CSharp;

using Caisis.Data;
using Caisis.DataAccess;
using Caisis.Extensions;

namespace Caisis.BOL
{
    public class ProtocolMgmtMetadataField : IComparable<ProtocolMgmtMetadataField>
    {
        public string Tablename
        {
            get;
            set;
        }

        public string Fieldname
        {
            get;
            set;
        }

        public int RecordId
        {
            get;
            set;
        }

        public int ParentRecordId
        {
            get;
            set;
        }

        // TODO: add primary key property? or make it a property of a ProtocolMgmtMetadataFieldList?

        public ProtocolMgmtMetadataField(string tablename, string fieldname) : this(tablename, fieldname, 0, 0) { }

        public ProtocolMgmtMetadataField(string tablename, string fieldname, int recordId, int parentRecordId)
        {
            Tablename = tablename;
            Fieldname = fieldname;
            RecordId = recordId;
            ParentRecordId = parentRecordId;
        }

        #region IComparable<ProtocolMgmtMetadataField> Members

        public int CompareTo(ProtocolMgmtMetadataField other)
        {
            // sort by depth, parent record id, tablename, record id, fieldname

            int depthCompare = BusinessObject.GetTableDepth(Tablename).CompareTo(BusinessObject.GetTableDepth(other.Tablename));

            if (depthCompare != 0)
                return depthCompare;

            int parentRecordIdCompare = ParentRecordId.CompareTo(other.ParentRecordId);

            if (parentRecordIdCompare != 0)
                return parentRecordIdCompare;

            int tablenameCompare = Tablename.CompareTo(other.Tablename);

            if (tablenameCompare != 0)
                return tablenameCompare;

            int recordIdCompare = RecordId.CompareTo(other.RecordId);

            if (recordIdCompare != 0)
                return recordIdCompare;

            int fieldnameCompare = Fieldname.CompareTo(other.Fieldname);

            if (fieldnameCompare != 0)
                return fieldnameCompare;

            return 0; // we don't care
        }

        #endregion
    }

    public static class ProtocolMgmt
    {
        /// <summary>
        /// A list of special tables which persits data entry items across a trial
        /// </summary>
        private static readonly string[] PERSISTED_TABLES = new string[] { "Medications", "Toxicities", "Comorbidities", "MedicalTherapy" };

        /// <summary>
        /// A list of distinct table and field, used for merging metadata + real data
        /// </summary>
        private static readonly Dictionary<string, string> DISTINCT_TABLE_FIELD = new Dictionary<string, string>()
            {
                { "LabTests", "LabTest" },
                { "Medications", "Medication" }
            };

        // todo
        private static int? GetFieldOrder(string table, string field)
        {
            return BOL.BusinessObject.GetFieldOrder(table, field);
        }

        /// <summary>
        /// Returns the metadata and associated primary keys associated with the Patient Item.
        /// </summary>
        /// <param name="patientItemId">The patient item id</param>
        /// <returns>A dictionary of metadata elements and their optional primary key.</returns>
        public static IDictionary<XElement, int?> GetMetadata(int patientItemId)
        {
            // read: check if item is special table
            string persistedTable = "";
            // read: read first row
            ProtocolMgmtDa.ReadPatientItemFields(patientItemId, (record) =>
            {
                string destTable = record.GetString(record.GetOrdinal("DestTable"));
                bool isGrid = !record.IsDBNull(record.GetOrdinal("FieldRowIndex"));
                // only persist if special table is a grid form
                if (PERSISTED_TABLES.Contains(destTable) && isGrid)
                    persistedTable = destTable;
                return false;
            });

            #region get patient items SQL

            string sql = "";
            // for simple case, get metadata for patient item
            if (string.IsNullOrEmpty(persistedTable))
            {
                sql =
@"
SELECT DISTINCT
	si.SchemaItemId,
	sif.DestTable,
	sif.DestField,
	sif.DestValue,
	sif.DisplayOrder,
	sif.FieldRowIndex,
	pif.DestTablePrimKey
FROM ProtocolMgr_PatientItems pi
INNER JOIN ProtocolMgr_ItemTimeline it
	ON pi.ItemTimelineId = it.ItemTimelineId
INNER JOIN ProtocolMgr_SchemaItems si
	ON it.SchemaItemId = si.SchemaItemId
INNER JOIN ProtocolMgr_SchemaItemFields sif
	ON si.SchemaItemId = sif.SchemaItemId
LEFT OUTER JOIN ProtocolMgr_PatientItemFields pif
	ON pi.PatientItemId = pif.PatientItemId AND sif.SchemaItemFieldId = pif.SchemaItemFieldId
WHERE
	pi.PatientItemId = @PatientItemId
";
            }
            // for special persisted cases, get persisted metadata
            else
            {
                //                sql =
                //                    @"
                //-- declare: cached variables
                //DECLARE @PatientId int
                //DECLARE @PatientSchemaId int
                //DECLARE @ProtocolSchemaId int
                //
                //-- set patient variables
                //SELECT TOP 1
                //	@PatientId = b.PatientId,
                //	@PatientSchemaId = b.PatientSchemaId,
                //	@ProtocolSchemaId = b.ProtocolSchemaId
                //FROM ProtocolMgr_PatientItems a
                //INNER JOIN ProtocolMgr_PatientSchemas b
                //	ON a.PatientSchemaId = b.PatientSchemaId
                //WHERE a.PatientItemId = @PatientItemId
                //
                //SELECT DISTINCT
                //	d.SchemaItemId,
                //	c.DestTable,
                //	c.DestField,
                //	c.DestValue,
                //	c.DisplayOrder,
                //	c.FieldRowIndex,
                //	b.DestTablePrimKey,	
                //	d.ItemDescription
                //FROM ProtocolMgr_PatientItems a
                //INNER JOIN ProtocolMgr_PatientItemFields b
                //	ON a.PatientItemId = b.PatientItemId
                //INNER JOIN ProtocolMgr_SchemaItemFields c
                //	ON b.SchemaItemFieldId = c.SchemaItemFieldId
                //INNER JOIN ProtocolMgr_SchemaItems d
                //	ON c.SchemaItemId = d.SchemaItemId
                //WHERE
                //	-- restrict to patient's schema items
                //	a.PatientSchemaId = @PatientSchemaId
                //	AND
                //	(
                //		-- restrict to query patient item
                //		(a.PatientItemId = @PatientItemId)
                //		-- restrict to grid fields like special table
                //		OR
                //		(
                //			b.DestTablePrimKey IS NOT NULL
                //            AND
                //			c.FieldRowIndex IS NOT NULL
                //			AND
                //			c.DestTable = @SpecialPatientTable
                //		)
                //	)				
                //            ";
                sql =
@"
-- declare: cached variables
DECLARE @PatientId int
DECLARE @PatientSchemaId int
DECLARE @ProtocolSchemaId int

-- set patient variables
SELECT TOP 1
	@PatientId = b.PatientId,
	@PatientSchemaId = b.PatientSchemaId,
	@ProtocolSchemaId = b.ProtocolSchemaId
FROM ProtocolMgr_PatientItems a
INNER JOIN ProtocolMgr_PatientSchemas b
	ON a.PatientSchemaId = b.PatientSchemaId
WHERE a.PatientItemId = @PatientItemId

-- get a list of items belonging to this visit
SELECT DISTINCT
	si.SchemaItemId,
	sif.DestTable,
	sif.DestField,
	sif.DestValue,
	sif.DisplayOrder,
	sif.FieldRowIndex,
	pif.DestTablePrimKey
FROM ProtocolMgr_PatientItems pi
INNER JOIN ProtocolMgr_ItemTimeline it
	ON pi.ItemTimelineId = it.ItemTimelineId
INNER JOIN ProtocolMgr_SchemaItems si
	ON it.SchemaItemId = si.SchemaItemId
INNER JOIN ProtocolMgr_SchemaItemFields sif
	ON si.SchemaItemId = sif.SchemaItemId
LEFT OUTER JOIN ProtocolMgr_PatientItemFields pif
	ON pi.PatientItemId = pif.PatientItemId AND sif.SchemaItemFieldId = pif.SchemaItemFieldId
WHERE
	pi.PatientItemId = @PatientItemId

-- union items and related siblings (union for performance, instead of join)
UNION

-- get a list of sibling items like current, i.e., Medication visit items
SELECT DISTINCT
	d.SchemaItemId,
	c.DestTable,
	c.DestField,
	c.DestValue,
	c.DisplayOrder,
	c.FieldRowIndex,
	b.DestTablePrimKey
FROM ProtocolMgr_PatientItems a
INNER JOIN ProtocolMgr_PatientItemFields b
	ON a.PatientItemId = b.PatientItemId
INNER JOIN ProtocolMgr_SchemaItemFields c
	ON b.SchemaItemFieldId = c.SchemaItemFieldId
INNER JOIN ProtocolMgr_SchemaItems d
	ON c.SchemaItemId = d.SchemaItemId
WHERE
	-- restrict to patient's schema items
	a.PatientSchemaId = @PatientSchemaId
	AND 
	c.FieldRowIndex IS NOT NULL
	AND
	c.DestTable = @SpecialPatientTable 
	AND
	b.DestTablePrimKey IS NOT NULL
";
            }
            #endregion

            DataTable table = new DataTable();

            using (SqlConnection conn = Database.GetSqlConnection())
            {
                // build SQL
                SqlCommand cmd = new SqlCommand(sql, conn);
                // required: add patient item
                cmd.Parameters.Add(new SqlParameter("@PatientItemId", patientItemId));
                // optional: add persisted table
                if (!string.IsNullOrEmpty(persistedTable))
                    cmd.Parameters.Add(new SqlParameter("@SpecialPatientTable", persistedTable));
                // fill
                SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                adapter.Fill(table);
            }

            var dbMetaData = from row in table.AsEnumerable()
                             let tablename = row["DestTable"].ToString()
                             let fieldname = row["DestField"].ToString()
                             select new
                             {
                                 DataRow = row,
                                 SchemaItemId = (int)row["SchemaItemId"],
                                 DestTable = tablename,
                                 DestField = fieldname,
                                 DestValue = row["DestValue"].ToString(),
                                 // order by metadata ???
                                 DisplayOrder = GetFieldOrder(tablename, fieldname),
                                 //DisplayOrder = row.IsNull("DisplayOrder") ? (int?)null : (int)row["DisplayOrder"],
                                 FieldRowIndex = row.IsNull("FieldRowIndex") ? (int?)null : (int)row["FieldRowIndex"],
                                 DestTablePrimKey = row.IsNull("DestTablePrimKey") ? (int?)null : (int)row["DestTablePrimKey"],
                             };
            var _gridTables = from meta in dbMetaData
                              let isGrid = meta.FieldRowIndex.HasValue
                              where isGrid
                              group meta by meta.DestTable into g
                              select new
                              {
                                  Table = g.Key,
                                  BlankRows = from r in g
                                              where !r.DestTablePrimKey.HasValue
                                              let rowIndex = r.FieldRowIndex.Value
                                              group r by rowIndex into g1
                                              select new
                                              {
                                                  RowIndex = g1.Key,
                                                  RowFields = g1
                                              },
                                  DataRows = from r in g
                                             where r.DestTablePrimKey.HasValue
                                             let rPriKey = r.DestTablePrimKey.Value
                                             group r by rPriKey into g1
                                             orderby g1.Key ascending
                                             select new
                                             {
                                                 PriKey = g1.Key,
                                                 RowFields = g1
                                             },
                              };

            // GRID NORMALIZATION
            // - adjust row index for exising records (i.e., DestTablePrimKey IS NOT NULL) 
            // - blank metadata rows are pushed to the bottom of grid of same table
            var gridTables = from row in table.AsEnumerable()
                             let isGrid = !row.IsNull(SchemaItemField.FieldRowIndex)
                             where isGrid
                             let rowTable = row[SchemaItemField.DestTable].ToString()
                             let rowField = row[SchemaItemField.DestField].ToString()
                             let rowIndex = (int)row[SchemaItemField.FieldRowIndex]
                             group row by rowTable into g
                             select new
                             {
                                 Table = g.Key,
                                 BlankRows = from r in g
                                             where r.IsNull(PatientItemField.DestTablePrimKey)
                                             let rIndex = (int)r[SchemaItemField.FieldRowIndex]
                                             group r by rIndex into g1
                                             select new
                                             {
                                                 RowIndex = g1.Key,
                                                 RowFields = g1
                                             },
                                 DataRows = from r in g
                                            where !r.IsNull(PatientItemField.DestTablePrimKey)
                                            let rPriKey = (int)r[PatientItemField.DestTablePrimKey]
                                            group r by rPriKey into g1
                                            orderby g1.Key ascending
                                            select new
                                            {
                                                PriKey = g1.Key,
                                                RowFields = g1
                                            },
                             };

            // normalize grid rows
            // i.e., fill in rowindex for data rows (if rowindexes are the same, adjust to 0-n)
            //       blank rows follow data rows
            List<DataRow> supressMetadata = new List<DataRow>();
            Dictionary<string, IEnumerable<string>> tableToFields = new Dictionary<string, IEnumerable<string>>();
            foreach (var gridTable in gridTables)
            {
                string tableName = gridTable.Table;
                var datarows = gridTable.DataRows;
                var blankrows = gridTable.BlankRows;
                var dataRowFields = datarows.SelectMany(r => r.RowFields.Select(f => f[SchemaItemField.DestField] + "")).Distinct();
                var blankRowFields = blankrows.SelectMany(r => r.RowFields.Select(f => f[SchemaItemField.DestField] + "")).Distinct();
                var allRowFields = dataRowFields.Concat(blankRowFields).Distinct();
                var missingFields = blankRowFields.Except(dataRowFields);
                if (!tableToFields.ContainsKey(tableName))
                {
                    tableToFields.Add(tableName, allRowFields);
                }

                // the distinct field to check
                string distinct_field = GetDistinctField(tableName);

                // only if there are actual records, normalize rows
                if (datarows.Count() > 0)
                {
                    var keys = gridTable.DataRows.Select(r => r.PriKey).Distinct();
                    // get a list of existing values (i.e., values which exists in real rows, LabTest, Encounter, etc...)
                    var existing_values = GetDistinctValues(tableName, keys);

                    // TODO: cleanup/refactor
                    // STEP 1: normalize "real rows" starting at index 0
                    int rowIndex = 0;
                    foreach (var datarow in datarows)
                    {
                        var fieldsInRow = datarow.RowFields;
                        foreach (var row in fieldsInRow)
                        {
                            row[SchemaItemField.FieldRowIndex] = rowIndex;
                        }
                        rowIndex++;
                    }
                    // if no existing values found, remove all blank rows, display only real rows
                    if (existing_values.Count() == 0)
                    {
                        supressMetadata.AddRange(gridTable.BlankRows.SelectMany(r => r.RowFields));
                    }
                    // otherwise, remove only blank rows which have values in the real row
                    else
                    {
                        // for the given list of blank metadata, return rows which are duplicates. i.e., metadata LabTest=PSA exists in real record
                        Func<IEnumerable<DataRow>, IEnumerable<DataRow>> getDuplicateRows = (blankRows) =>
                            {
                                return from row in blankRows
                                       let field = row[SchemaItemField.DestField].ToString()
                                       let value = row[SchemaItemField.DestValue].ToString()
                                       where field == distinct_field && existing_values.Contains(value, StringComparer.OrdinalIgnoreCase)
                                       select row;
                            };

                        // STEP 2: locate and remove "blank rows" which are already contained (i.e., real Lab exisits)
                        var removeBlankRows = from entry in gridTable.BlankRows
                                              let found_values = getDuplicateRows(entry.RowFields)
                                              where found_values.Count() > 0
                                              orderby entry.RowIndex
                                              select entry;
                        supressMetadata.AddRange(removeBlankRows.SelectMany(r => r.RowFields));
                        // STEP 3: normalize remaining "blank row" indexes after "real rows"
                        var keepBlankRows = from entry in gridTable.BlankRows
                                            let found_values = getDuplicateRows(entry.RowFields)
                                            where found_values.Count() == 0
                                            orderby entry.RowIndex
                                            select entry;
                        //var keepBlankRows = gridTable.BlankRows.Except(removeBlankRows);
                        if (keepBlankRows.Count() > 0)
                        {
                            // normalize blank row indexes, continuing from data rows
                            int maxRowIndex = datarows.SelectMany(r => r.RowFields.Select(rr => (int)rr[SchemaItemField.FieldRowIndex])).Max();
                            // reset index
                            rowIndex = maxRowIndex + 1;
                            foreach (var datarow in keepBlankRows)
                            {
                                var fieldsInRow = datarow.RowFields;
                                foreach (var row in fieldsInRow)
                                {
                                    row[SchemaItemField.FieldRowIndex] = rowIndex;
                                }
                                rowIndex++;
                            }
                        }
                    }

                }
                // for blank row, normalize metadata rows by tables
                // i.e., for a list of medication rows across multiple patient items,
                //       create new calculated row index by schema item id, and db fieldrow index
                else
                {
                    // only run cleanup on special tables
                    if (PERSISTED_TABLES.Contains(tableName))
                    {
                        int rowIndex = 0;
                        var nonNormalizedBlankRowGroups = from blank in blankrows.SelectMany(f => f.RowFields)
                                                          let schemaItemId = (int)blank[SchemaItem.SchemaItemId]
                                                          let colIndex = (int)blank[SchemaItemField.FieldRowIndex]
                                                          orderby schemaItemId ascending
                                                          group blank by new { sid = schemaItemId, cIndex = colIndex } into g
                                                          select g;
                        foreach (var blankRowGroup in nonNormalizedBlankRowGroups)
                        {
                            foreach (DataRow row in blankRowGroup)
                            {
                                row[SchemaItemField.FieldRowIndex] = rowIndex;
                            }
                            rowIndex++;
                        }
                    }
                }
            }

            // cleanup any unwanted rows
            var db_metadata = table.AsEnumerable().Except(supressMetadata);

            var query =
                from row in db_metadata
                let tablename = row[SchemaItemField.DestTable].ToString()
                let fieldname = row[SchemaItemField.DestField].ToString()
                let displayOrder = GetFieldOrder(tablename, fieldname)
                //let displayOrder = row[SchemaItemField.DisplayOrder]
                let fieldRowIndex = !row.IsNull(SchemaItemField.FieldRowIndex) ? (int)row[SchemaItemField.FieldRowIndex] : 0
                let tableDepth = BusinessObject.GetTableDepth(tablename)
                orderby
                    tableDepth ascending,
                    fieldRowIndex ascending,
                    tablename ascending,
                    displayOrder ascending,
                    fieldname ascending
                select row;



            // do we want to validate the output in some way?
            // 1. only one "record" with the minimum table depth
            // 2. fieldrowindex can be set only on the last table in a parent->...->child table sequence
            // 3. table n must be a child table of some previous table n - x
            // 4. ? if there are multiples "records" for a table (e.g. findings), said tables cannot have children

            // perhaps what would be FieldRowIndex 1 and 2 should be separate items

            int initialDepth = 0;
            string initialTablename = null;
            string initialGridTablename = null;
            string previousTablename = null;
            int? previousFieldRowIndex = null; // reset whenever tables change

            // map tablename -> List<XElement>
            // if map d/n contain table, add new entry with grid option

            // XElement metadata = null;

            List<XElement> metadataList = new List<XElement>();
            int? primaryKey = null;

            Dictionary<KeyValuePair<string, int?>, XElement> map = new Dictionary<KeyValuePair<string, int?>, XElement>();
            Dictionary<int, object> exportedFieldRowIndexMap = new Dictionary<int, object>();

            Dictionary<XElement, int?> metadataAndKeys = new Dictionary<XElement, int?>();

            foreach (DataRow row in query)
            {
                string tablename = row[SchemaItemField.DestTable].ToString();
                string fieldname = row[SchemaItemField.DestField].ToString();

                string initialValue = null;
                if (!row.IsNull(SchemaItemField.DestValue))
                {
                    string s = row[SchemaItemField.DestValue].ToString();
                    if (s != "[enter]")
                        initialValue = s;
                }

                int? fieldRowIndex = null;
                if (!row.IsNull(SchemaItemField.FieldRowIndex))
                    fieldRowIndex = (int)row[SchemaItemField.FieldRowIndex];

                int? fieldRowPriKey = null;
                if (!row.IsNull(PatientItemField.DestTablePrimKey))
                {
                    fieldRowPriKey = (int)row[PatientItemField.DestTablePrimKey];
                }

                bool grid = fieldRowIndex.HasValue;
                int depth = BusinessObject.GetTableDepth(tablename);

                if (initialTablename == null)
                {
                    initialTablename = tablename;
                    initialDepth = depth;
                }

                // validate: only one "record" with the minimum table depth
                if (tablename != initialTablename && depth == initialDepth)
                    throw new ArgumentException(string.Format("Schema Items must have a single parent table. {0} and {1} are at the same depth.", initialTablename, tablename));

                // validate: table n must be a child table of table n - 1
                //if (previousTablename != null &&
                //    tablename != previousTablename &&
                //    BusinessObject.GetParentTablename(tablename) != previousTablename)
                //{
                //    throw new ArgumentException(string.Format("Successor table {0} is not a child table of the previous table {1}.", tablename, previousTablename));
                //}

                // validate: fieldrowindex can be set only on the last table in a parent->...->child table sequence
                //if (grid)
                //{
                //    if (initialGridTablename == null)
                //        initialGridTablename = tablename;
                //    else if (tablename != initialGridTablename)
                //        throw new ArgumentException(string.Format("Schema Items may have only one grid present on the form. Both {0} and {1} are configured to display as grids.", initialGridTablename, tablename));
                //}
                //else
                //{
                //    if (initialGridTablename != null)
                //        throw new ArgumentException(string.Format("Table {0} succeeds {1}, which is configured to display as a grid.", tablename, initialGridTablename));
                //}

                // validate: fieldrowindex, if it exists, is consecutive with the previous fieldrowindex
                if (!previousFieldRowIndex.HasValue && fieldRowIndex.HasValue && fieldRowIndex.Value != 0)
                    throw new ArgumentException(string.Format("Initial FieldRowIndex, {0}, for table {1} is not equal to 0.", fieldRowIndex, tablename));

                if (tablename == previousTablename && previousFieldRowIndex.HasValue)
                {
                    if (!fieldRowIndex.HasValue)
                        throw new ArgumentException(string.Format("Null FieldRowIndex found for field {0} where FieldRowIndex is set for other fields in table {1}.", fieldname, tablename));
                    else if (fieldRowIndex.Value < previousFieldRowIndex.Value || fieldRowIndex.Value > previousFieldRowIndex.Value + 1)
                        throw new ArgumentException(string.Format("FieldRowIndex of {0} is less than or does not succeed FieldRowIndex {1}", fieldRowIndex.Value, fieldRowIndex.Value));
                }

                previousTablename = tablename;
                previousFieldRowIndex = fieldRowIndex;

                KeyValuePair<string, int?> key = new KeyValuePair<string, int?>(tablename, fieldRowIndex);

                XElement xe;

                if (!map.ContainsKey(key))
                {
                    xe = new XElement(tablename, new XAttribute("GridView", grid ? "True" : "False"));
                    map[key] = xe;




                    // no parent table should have a fieldRowIndex set
                    KeyValuePair<string, int?> parentKey = new KeyValuePair<string, int?>(BusinessObject.GetParentTablename(tablename), null);

                    if (map.ContainsKey(parentKey))
                        map[parentKey].Add(xe);

                }
                else
                {
                    xe = map[key];
                }

                //int schemaItemFieldId = (int)row[SchemaItemField.SchemaItemFieldId];
                // append field to matching XElement
                XElement el = new XElement(fieldname);

                if (initialValue != null)
                    el.Add(initialValue);

                xe.Add(el);

                // export first table
                //if (metadata == null)
                //{
                //    metadata = xe;
                //    if (!row.IsNull("DestTablePrimKey"))
                //        primaryKey = (int) row["DestTablePrimKey"];
                //}

                // TODO: export anything at the shallowest table depth
                // TODO: but we want to export in order



                if ((!primaryKey.HasValue) && (!row.IsNull("DestTablePrimKey")))
                    primaryKey = (int)row["DestTablePrimKey"];


                if (depth == initialDepth && !exportedFieldRowIndexMap.ContainsKey(fieldRowIndex ?? -1))
                {
                    metadataList.Add(xe);

                    if (!metadataAndKeys.ContainsKey(xe))
                        metadataAndKeys.Add(xe, fieldRowPriKey);


                    if (fieldRowIndex.HasValue)
                        exportedFieldRowIndexMap[fieldRowIndex.Value] = null;
                    else
                        exportedFieldRowIndexMap[-1] = null;
                }
            }

            //int? exportedKey = null;

            //if (metadataList.Count > 1)
            //{
            //    // get parent key for record with primary key

            //}
            //else
            //{
            //    exportedKey = primaryKey;
            //}

            //int? exportedKey = primaryKey;

            // field normalization: ensure all schema item columns are added
            foreach (XElement tableElement in metadataAndKeys.Keys)
            {
                string tableName = tableElement.Name.LocalName;
                if (tableToFields.ContainsKey(tableName))
                {
                    // get a list of current fields
                    var allFieldNames = tableToFields[tableName];
                    var currentFieldNames = tableElement.Elements().Select(n => n.Name.LocalName);
                    var addFieldNames = allFieldNames.Except(currentFieldNames);
                    List<XElement> fieldElements = new List<XElement>();
                    // copy original
                    fieldElements.AddRange(tableElement.Elements().Select(e => new XElement(e)));
                    // append missing
                    fieldElements.AddRange(addFieldNames.Select(f => new XElement(f)));
                    // clear current nodes
                    tableElement.RemoveNodes();
                    // cleanup: add in order, removing duplicates
                    var tableFields = from field in fieldElements
                                      group field by field.Name.LocalName into g
                                      let field = g.First()
                                      orderby GetFieldOrder(tableName, field.Name.LocalName)
                                      select field;
                    tableElement.Add(tableFields);
                }

            }

            return metadataAndKeys;
            //return new KeyValuePair<IEnumerable<XElement>, int?>(metadataList, exportedKey);
        }

        public static KeyValuePair<List<ProtocolMgmtMetadataField>, Dictionary<string, List<int>>> GetSchemaItemMetadata(int patientItemId)
        {
            List<ProtocolMgmtMetadataField> list = new List<ProtocolMgmtMetadataField>();
            Dictionary<string, List<int>> map = new Dictionary<string, List<int>>();

            #region sql
            string sql =
                @"SELECT
					ProtocolMgr_SchemaItemFields.DestTable,
					ProtocolMgr_SchemaItemFields.DestField,
					ProtocolMgr_SchemaItemFields.DestValue,
					ProtocolMgr_SchemaItemFields.DisplayOrder,
					ProtocolMgr_PatientItemFields.DestTablePrimKey,
					ProtocolMgr_SchemaItems.ItemDescription
				FROM
					ProtocolMgr_PatientItemFields
					INNER JOIN ProtocolMgr_SchemaItemFields
						ON ProtocolMgr_PatientItemFields.SchemaItemFieldId = ProtocolMgr_SchemaItemFields.SchemaItemFieldId
					INNER JOIN ProtocolMgr_SchemaItems
						ON ProtocolMgr_SchemaItemFields.SchemaItemId = ProtocolMgr_SchemaItems.SchemaItemId
				WHERE
					ProtocolMgr_PatientItemFields.PatientItemId = @PatientItemId                    
                ";
            #endregion

            using (SqlConnection conn = Database.GetSqlConnection())
            {
                conn.Open();

                SqlCommand cmd = new SqlCommand(sql, conn);

                using (SqlDataReader reader = cmd.ExecuteReader())
                {
                    int tableIndex = -1;
                    int fieldIndex = -1;
                    int keyIndex = -1;
                    bool init = false;

                    Func<IDataRecord, ProtocolMgmtMetadataField> f =
                        (r) =>
                        {
                            if (!init)
                            {
                                tableIndex = r.GetOrdinal("DestTable");
                                fieldIndex = r.GetOrdinal("DestField");
                                keyIndex = r.GetOrdinal("DestTablePrimKey");
                                init = true;
                            }

                            string tablename = r.GetString(tableIndex);

                            if (!r.IsDBNull(keyIndex))
                            {
                                int key = r.GetInt32(keyIndex);
                                if (!map.ContainsKey(tablename))
                                    map[tablename] = new List<int>();

                                List<int> keys = map[tablename];

                                if (!keys.Contains(key))
                                    map[tablename].Add(key);
                            }

                            return new ProtocolMgmtMetadataField(tablename, r.GetString(fieldIndex));
                        };


                    while (reader.Read())
                    {
                        list.Add(f(reader));
                    }
                }
            }

            return new KeyValuePair<List<ProtocolMgmtMetadataField>, Dictionary<string, List<int>>>(list, map);
        }

        /// <summary>
        /// For the given patient schema, get assoicated records
        /// </summary>
        /// <typeparam name="T"></typeparam>
        /// <param name="patientSchemaId"></param>
        /// <returns></returns>
        public static IEnumerable<T> GetRecordsByPatientSchema<T>(int patientSchemaId) where T : BusinessObject, new()
        {
            // validation
            string tableName = new T().TableName;
            string priKeyName = BusinessObject.GetPrimaryKeyName(tableName);

            string sqlFormat =
            @"
SELECT DISTINCT d.{1}
FROM ProtocolMgr_PatientItemFields a
INNER JOIN ProtocolMgr_PatientItems b
	ON a.PatientItemId = b.PatientItemId
INNER JOIN ProtocolMgr_SchemaItemFields c
	ON a.SchemaItemFieldId = c.SchemaItemFieldId AND c.DestTable = '{0}'
INNER JOIN {0} d
	ON a.DestTablePrimKey = d.{1}
-- patient validation
INNER JOIN ProtocolMgr_PatientSchemas e
	ON b.PatientSchemaId = e.PatientSchemaId AND d.PatientId = e.PatientId
WHERE
	b.PatientSchemaId = @PatientSchemaId
            ";
            string sql = string.Format(sqlFormat, tableName, priKeyName);
            SqlCommand cmd = DataAccessHelper.CreateSqlCommand(sql);
            DataAccessHelper.AddIntInputParam(cmd, "PatientSchemaId", patientSchemaId);
            // fill list
            List<int> keys = new List<int>();
            // get keys
            Database db = new Database();
            db.Select(cmd, (r) => { keys.Add(r.GetInt32(0)); return true; });
            // fetch records
            foreach (int key in keys)
            {
                // create new T
                T biz = new T();
                biz.Get(key);
                yield return biz;
            }
        }

        // TODO: move into generic location
        /// <summary>
        /// For the specified table + patient get the next record sequence for the patient (1,..n)
        /// </summary>
        /// <typeparam name="T"></typeparam>
        /// <param name="patientId"></param>
        /// <param name="priKey"></param>
        /// <returns></returns>
        public static int GetPatientRecordSequence<T>(int patientId, int? priKey) where T : BusinessObject, new()
        {
            // validation
            string tableName = new T().TableName;
            string priKeyName = BusinessObject.GetPrimaryKeyName(tableName);
            string getByPriKey = @"
SELECT
    CAST(RowNumber AS int) AS RowNumber
FROM
(
	SELECT
	 {1},
	 ROW_NUMBER() OVER(ORDER BY {1} ASC) AS RowNumber 
	FROM {0}
	{2}
) a
WHERE
	{1} = @PriKey
";
            // return location in sequence by key
            if (priKey.HasValue)
            {
                string specialTable = typeof(T) == typeof(Patient) ? "" : "WHERE PatientId = @PatientId";
                string sql = string.Format(getByPriKey, tableName, priKeyName, specialTable);
                SqlCommand cmd = DataAccessHelper.CreateSqlCommand(sql);
                DataAccessHelper.AddIntInputParam(cmd, "PatientId", patientId);
                DataAccessHelper.AddIntInputParam(cmd, "PriKey", priKey.Value);
                var table = DataAccessHelper.GetRecord(cmd).Tables[0];
                if (table.Rows.Count > 0)
                {
                    return (int)table.Rows[0][0];
                }
            }
            // default: next sequence
            int count = BOL.BusinessObject.Count<T>(new Dictionary<string, object> { { Patient.PatientId, patientId } });
            return count + 1;
        }

        #region Visit UTILITIES

        /// <summary>
        /// For the given table, get the distinct field used for duplicate checks
        /// </summary>
        /// <param name="table"></param>
        /// <returns></returns>
        private static string GetDistinctField(string table)
        {
            if (DISTINCT_TABLE_FIELD.ContainsKey(table))
                return DISTINCT_TABLE_FIELD[table];
            else
                return "";
        }

        /// <summary>
        /// For the given special table and keys, return a list of distinct value for common field, i.e., distinct LabTest
        /// </summary>
        /// <param name="table"></param>
        /// <param name="keys"></param>
        /// <returns></returns>
        private static IEnumerable<string> GetDistinctValues(string table, IEnumerable<int> keys)
        {

            List<string> values = new List<string>();
            string field = GetDistinctField(table);
            if (!string.IsNullOrEmpty(field) && keys.Count() > 0)
            {

                string key_name = BOL.BusinessObject.GetPrimaryKeyName(table);
                string sql =
string.Format(
@"
SELECT DISTINCT {1}
FROM {0}
WHERE {1} IS NOT NULL AND {2} IN({3})
",
table,
field,
key_name,
string.Join(",", keys.Select(k => k.ToString()).ToArray())
);
                var cmd = DataAccessHelper.CreateSqlCommand(sql);
                Database db = new Database();
                db.Select(cmd, (r) =>
                    {
                        values.Add(r.GetString(0));
                        return true;
                    });
            }
            return values.ToArray();
        }

        #endregion

        #region table specific data

        /// <summary>
        /// 
        /// </summary>
        /// <param name="protocolSchemaId"></param>
        /// <param name="patientSchemaId"></param>
        public static Dictionary<string, IEnumerable<MedTxAdministration>> GetMedTxAgents(int protocolSchemaId, int patientSchemaId)
        {
            MedicalTherapyDa da = new MedicalTherapyDa();
            DataTable trialMedTx = da.GetProtocolSchemaTherapies(protocolSchemaId);
            // combine data
            var trialAgents = trialMedTx.AsEnumerable().Select(m => m[MedicalTherapy.MedTxAgent].ToString()).Distinct().ToArray();
            IEnumerable<MedicalTherapy> patientTherapies = BOL.ProtocolMgmt.GetRecordsByPatientSchema<MedicalTherapy>(patientSchemaId);
            var therapies = from agent in trialAgents
                            join tx in patientTherapies on agent equals tx[MedicalTherapy.MedTxAgent].ToString() into g
                            let tx = g.FirstOrDefault()
                            let txAdmin = tx == null ? new MedTxAdministration[0] : BOL.BusinessObject.GetByParent<MedTxAdministration>((int)tx[MedTxAdministration.MedicalTherapyId])
                            select new
                            {
                                MedTx = agent,
                                Tx = tx,
                                MedTxAdministrations = txAdmin
                            };
            return therapies.ToDictionary(t => t.MedTx, t => t.MedTxAdministrations);
        }

        #endregion

        /// <summary>
        /// For the specified Locked (if applicable), updates the record without unlocking
        /// </summary>
        /// <param name="bizo"></param>
        public static void SaveLockedRecord(IBusinessObject bizo)
        {
            // TODO: restrict table/field which can be updated
            if (!(bizo is LabTest) || !bizo.PrimaryKeyHasValue || !bizo.HasField(BusinessObject.UpdatedBy))
            {
                bizo.Save();
            }
            else
            {
                string username = new Security.SecurityController().GetUserName();
                string tableName = bizo.TableName;
                string keyName = bizo.PrimaryKeyName;
                int labTestId = (int)bizo[bizo.PrimaryKeyName];
                Dictionary<string, object> values = new Dictionary<string, object> {
                                                    { LabTest.LabTestId, labTestId },
                                                    { LabTest.LabClinicalSignificance, bizo[LabTest.LabClinicalSignificance] },
                                                    { LabTest.UpdatedBy, username },
                                                    { LabTest.UpdatedTime, DateTime.Now }};
                Database db = new Database();
                db.Update(tableName, (a) => { return values[a]; }, values.Keys.Except(new string[] { keyName }), new string[0], keyName);
            }
        }
    }

    /// <summary>
    /// Provides services related to patient visits
    /// </summary>
    public class ProtocolMgmtVisitServices
    {
        private static readonly int BUFFER_PLUS = 90;
        private static readonly int BUFFER_MINUS = -90;

        private static readonly Dictionary<string, string> TABLE_TO_FIELD = new Dictionary<string, string>
        {
            { "LabTests" , "LabTest" },
            { "MedicalTherapy", "MedTxType" },
            { "Surveys", "SurveyType" },
            { "Actions", "ActionItem" },
            { "Diagnostics", "DxType" }
        };

        private int patientItemId = -1;
        private int patientId = -1;

        Caisis.Data.Database db = new Database();
        private string tableName = "";
        private string tablePriKeyName = "";
        private string[] tableFieldNames = new string[0];
        private IEnumerable<int> tableKeys = new int[0];
        private IEnumerable<string> tableValues = new string[0];
        private DateTime? dateStart = null;
        private DateTime? dateEnd = null;
        private bool restrictData = true;

        public ProtocolMgmtVisitServices(int patientItemId, DateTime? dateStart, DateTime? dateEnd, bool restrictData)
        {
            this.patientItemId = patientItemId;
            this.patientId = ProtocolMgmtDa.GetPatientIdByPatientItemId(patientItemId);
            this.dateStart = dateStart;
            this.dateEnd = dateEnd;
            this.restrictData = restrictData;
            if (this.dateStart.HasValue)
                this.dateStart.Value.AddDays(BUFFER_MINUS);
            if (this.dateEnd.HasValue)
                this.dateEnd.Value.AddDays(BUFFER_PLUS);

            this.RefreshVisits();
        }

        public string GetTableName()
        {
            return tableName;
        }

        public string GetPriKeyName()
        {
            return tablePriKeyName;
        }

        public string[] GetFieldNames()
        {
            return tableFieldNames;
        }

        public void RefreshVisits()
        {
            int patientId = ProtocolMgmtDa.GetPatientIdByPatientItemId(patientItemId);
            DataTable itemFields = ProtocolMgmtDa.GetPatientItemFields(patientItemId);
            var _metadata = from row in itemFields.AsEnumerable()
                            let table = row["DestTable"].ToString()
                            let field = row["DestField"].ToString()
                            let priKey = row["DestTablePrimKey"].ToString()
                            let colNum = row.IsNull("DisplayOrder") ? 0 : (int)row["DisplayOrder"]
                            let rowNum = row.IsNull("FieldRowIndex") ? 0 : (int)row["FieldRowIndex"]
                            let defaultValue = row.IsNull("DestValue") || row["DestValue"].ToString() == "[enter]" ? "" : row["DestValue"].ToString()
                            group new { Field = field, Order = colNum, PriKey = priKey, DefaultValue = defaultValue } by table into g
                            select new
                            {
                                Table = g.Key,
                                Fields = (from f in g
                                          orderby f.Order ascending
                                          select g.Select(a => a.Field)).SelectMany(a => a).Distinct(),
                                Keys = g.Where(a => !string.IsNullOrEmpty(a.PriKey)).Select(a => int.Parse(a.PriKey)).Distinct()
                            };
            if (_metadata.Count() > 0)
            {
                // !important: query top level table as source
                var source = (from m in _metadata
                              let depth = BOL.BusinessObject.GetTableDepth(m.Table)
                              orderby depth ascending
                              select m).First();
                tableName = source.Table;
                tablePriKeyName = BOL.BusinessObject.GetPrimaryKeyName(tableName);
                //tableFieldNames = source.Fields.ToArray();
                // TODO: allow virtual fields
                tableFieldNames = source.Fields.Intersect(BOL.BusinessObject.GetFieldNames(tableName)).Except(BOL.BusinessObject.GetVirtualFields(tableName)).ToArray();

                tableKeys = source.Keys;

                var _values = from row in itemFields.AsEnumerable()
                              let table = row["DestTable"].ToString()
                              let field = row["DestField"].ToString()
                              let defaultValue = row.IsNull("DestValue") || row["DestValue"].ToString() == "[enter]" ? "" : row["DestValue"].ToString()
                              where table == tableName && TABLE_TO_FIELD.ContainsKey(tableName) && TABLE_TO_FIELD[tableName] == field
                              where !string.IsNullOrEmpty(defaultValue)
                              select defaultValue;
                tableValues = _values.Distinct();
                // start and end dates
                /*
                if (!dateStart.HasValue || !dateEnd.HasValue)
                {
                    PatientItem item = new PatientItem();
                    item.Get(patientItemId);
                    if (!item.IsNull(PatientItem.ScheduledDate))
                    {
                        DateTime scheduledDate = (DateTime)item[PatientItem.ScheduledDate];
                        this.dateStart = scheduledDate.AddDays(-30);
                        this.dateEnd = scheduledDate.AddDays(30);
                    }
                }
                */
            }
            else
            {
                tableName = "";
                tablePriKeyName = "";
                tableFieldNames = new string[0];
                tableKeys = new int[0];
                tableValues = new string[0];
                this.dateStart = null;
                this.dateEnd = null;
            }
        }

        public DataTable GetVisitRelatedRecords(int? start, int? end)
        {
            if (string.IsNullOrEmpty(tableName) || BOL.BusinessObject.GetParentTablename(tableName) != "Patients")
                return new DataTable();

            var db_select_columns = new string[] { "PatientId", tablePriKeyName }.Concat(tableFieldNames).Distinct().ToArray();
            var select_restriction = new Dictionary<string, IEnumerable<object>> { { "PatientId", new object[] { patientId } } };
            string dateField = tableFieldNames.Where(f => f.EndsWith("Date")).FirstOrDefault();
            if (restrictData && TABLE_TO_FIELD.ContainsKey(tableName) && tableValues.Count() > 0)
                select_restriction.Add(TABLE_TO_FIELD[tableName], tableValues.ToArray());
            // create and populate DataTable]
            DataTable dbtable = Select(tableName, tablePriKeyName, db_select_columns, select_restriction, tableKeys, dateField, dateStart, dateEnd);
            // add special columns
            dbtable.Columns.Add(new DataColumn("Associated", typeof(bool)));
            dbtable.Columns.Add(new DataColumn("TableName", typeof(String)));
            int columnCount = dbtable.Columns.Count;
            // read and fill rows from db
            foreach (DataRow row in dbtable.Rows)
            {
                row[columnCount - 2] = tableKeys.Contains((int)row[tablePriKeyName]);
                row[columnCount - 1] = tableName;
            }

            return dbtable;
        }

        public int GetVisitRelatedRecordsCount()
        {
            if (!string.IsNullOrEmpty(tableName))
                return db.Count(tableName, tablePriKeyName, new Dictionary<string, object> { { "PatientId", patientId } });
            else
                return 0;
        }

        /// <summary>
        /// For the given list of records, associate them with the given visit.
        /// </summary>
        /// <param name="username"></param>
        /// <param name="tableToKeys"></param>
        public void AddRecordsToVisit(string username, Dictionary<string, IEnumerable<int>> tableToKeys)
        {
            ProtocolMgmtDa.UpdateProtocolMgrPatientFieldsWithPKey(patientItemId, tableToKeys, username);
        }

        /// <summary>
        /// For the given list of records, remove their association them with the given visit.
        /// </summary>
        /// <param name="username"></param>
        /// <param name="tableToKeys"></param>
        public void RemoveRecordsFromVisit(string username, Dictionary<string, IEnumerable<int>> tableToKeys)
        {
            foreach (string table in tableToKeys.Keys)
            {
                IEnumerable<int> keys = tableToKeys[table];
                foreach (int priKey in keys)
                {
                    IEnumerable<PatientItemField> patientItemFields = BOL.BusinessObject.GetByFields<PatientItemField>
                             (
                                 new Dictionary<string, object>
                        {
                            { PatientItemField.PatientItemId, patientItemId },
                            { PatientItemField.DestTablePrimKey, priKey }
                        }
                             );
                    foreach (PatientItemField patientItemField in patientItemFields)
                    {
                        patientItemField[PatientItemField.DestTablePrimKey] = DBNull.Value;
                        patientItemField.Save();
                    }
                }
            }
        }

        /// <summary>
        /// For the current visit, disassociate ALL records with this visit.
        /// </summary>
        /// <param name="username"></param>
        public void RemoveAllRecordsFromVisit(string username)
        {
            IEnumerable<PatientItemField> patientItemFields = BOL.BusinessObject.GetByFields<PatientItemField>
            (
                new Dictionary<string, object> { { PatientItemField.PatientItemId, patientItemId } }
            );
            foreach (PatientItemField patientItemField in patientItemFields)
            {
                patientItemField[PatientItemField.DestTablePrimKey] = DBNull.Value;
                patientItemField.Save();
            }
        }

        private static DataTable Select(string tableName, string tablePriKeyName, IEnumerable<string> selectTableColumns, Dictionary<string, IEnumerable<object>> selectTableRestrictions, IEnumerable<int> tableKeys, string dateFieldName, DateTime? dateStart, DateTime? dateEnd)
        {
            string SQL_TEMPLATE =
@"
SELECT
{0}
FROM {1}
WHERE ({2}) {3}   
";
            bool hasDateRestriction = !string.IsNullOrEmpty(dateFieldName) && (dateStart.HasValue || dateEnd.HasValue);
            Dictionary<string, object[]> whereParams = selectTableRestrictions.ToDictionary(k => k.Key, v => v.Value.ToArray());
            List<string> select = selectTableColumns.ToList();
            List<string> where = new List<string>();
            // add select
            select.Add(string.Format("ROW_NUMBER() OVER(ORDER BY {0} ASC) AS RowNumber", tablePriKeyName));
            // add where restrictions
            foreach (var restriction in whereParams)
            {
                string fieldName = restriction.Key;
                object[] fieldRestrictions = restriction.Value;
                int fieldRestrictionsCount = fieldRestrictions.Count();
                if (fieldRestrictionsCount == 0)
                {
                    continue;
                }
                else if (fieldRestrictionsCount == 1)
                {
                    where.Add(string.Format("{0} = @{0}", fieldName));
                }
                else
                {
                    var pNames = new string[fieldRestrictionsCount];
                    for (int i = 0; i < fieldRestrictionsCount; i++)
                        pNames[i] = string.Format("@{0}_{1}", fieldName, i);
                    where.Add(string.Format("{0} IN({1})", fieldName, string.Join(",", pNames)));
                }
            }
            // add date restriction
            if (hasDateRestriction)
            {
                if (dateStart.HasValue && dateEnd.HasValue)
                {
                    where.Add(string.Format("({0} BETWEEN {1} AND {2})", dateFieldName, "@_StartDate", "@_EndDate"));
                }
                else if (dateStart.HasValue)
                {
                    where.Add(string.Format("({0} >= {1})", dateFieldName, "@_StartDate"));
                }
                else if (dateEnd.HasValue)
                {
                    where.Add(string.Format("({0} <= {1})", dateFieldName, "@_EndDate"));
                }
            }
            // format full sql
            string selectSQL = string.Join(",", select.ToArray());
            string whereSQL = string.Join(" AND ", where.ToArray());
            string keySQL = tableKeys.Count() == 0 ? "" : string.Format(" OR {0} IN ({1})", tablePriKeyName, string.Join(",", tableKeys.Select(k => k.ToString()).ToArray()));
            string sql = string.Format(SQL_TEMPLATE, selectSQL, tableName, whereSQL, keySQL);

            var cmd = DataAccessHelper.CreateSqlCommand(sql);
            // add select restrictions
            foreach (var restriction in whereParams)
            {
                string fieldName = restriction.Key;
                object[] fieldRestrictions = restriction.Value;
                int fieldRestrictionsCount = fieldRestrictions.Count();
                if (fieldRestrictionsCount == 0)
                {
                    continue;
                }
                else if (fieldRestrictionsCount == 1)
                {
                    DataAccessHelper.AddInputParam(cmd, fieldName, fieldRestrictions[0], true);
                }
                else
                {
                    for (int i = 0; i < fieldRestrictionsCount; i++)
                        DataAccessHelper.AddInputParam(cmd, string.Format("{0}_{1}", fieldName, i), fieldRestrictions[i], true);
                }
            }
            if (hasDateRestriction)
            {
                if (dateStart.HasValue)
                    DataAccessHelper.AddDateTimeInputParam(cmd, "_StartDate", dateStart.Value);
                if (dateEnd.HasValue)
                    DataAccessHelper.AddDateTimeInputParam(cmd, "_EndDate", dateEnd.Value);
            }
            var table = DataAccessHelper.GetRecord(cmd).Tables[0];
            return table;
        }
    }

    /// <summary>
    /// Represents services for import/exporting protocol, schemas, patients and other Protocol related tasks
    /// </summary>
    public class ProtocolMgmtServices
    {
        public static readonly string XSD_NAMESPACE = "";

        /// <summary>
        /// The SQL representing patients eligible for export
        /// </summary>
        private static readonly string ELIGIBLE_PATIENTS_SQL =
            @"
	SELECT DISTINCT
		PatientId,
        PtRace,
        PtGender,
        PtDeathDate,
		PatientProtocolId,
		PtProtocolStudyId,
		PtRegistrationAge,
        PhysicianOfRecord,
        PassedScreeningDate
    FROM
	(
		SELECT DISTINCT
			p.PatientId,
            p.PtRace,
            p.PtGender,
			p.PtBirthDate,
            p.PtDeathDate,
			b.PatientProtocolId,
			b.PtProtocolStudyId,
            [PassedScreeningDate],
			CASE
				WHEN ISNUMERIC(PtRegistrationAge)=1 THEN CAST(PtRegistrationAge AS int)
				WHEN p.PtBirthDate IS NOT NULL AND [StatusRegisterDate] IS NOT NULL THEN CAST(FLOOR(DATEDIFF(DAY, p.PtBirthDate, [StatusRegisterDate])/365.242199) AS int)
                ELSE NULL
			END
			AS [PtRegistrationAge],
            PhysicianOfRecord
		FROM ({0}) a
		INNER JOIN Patients p
            ON a.PatientId = p.PatientId
		INNER JOIN PatientProtocols b
			ON a.PatientId = b.PatientId
		INNER JOIN Protocols c
			ON b.ProtocolId = c.ProtocolId
		LEFT OUTER JOIN PatientProtocolRegistration d
			ON b.PatientProtocolId = d.PatientProtocolId
		LEFT OUTER JOIN
		(
			SELECT
				PatientProtocolId,
				[Registered] AS [RegistedDate],
				[Consented] AS [ConsentedDate],
				[Passed Screening] AS [PassedScreeningDate],
                COALESCE([Registered],[Consented],[Passed Screening]) AS [StatusRegisterDate]
			FROM
			(
				SELECT PatientProtocolId, PtProtocolStatus, PtProtocolStatusDate 
				FROM PatientProtocolStatus
				WHERE PtProtocolStatusDate IS NOT NULL
			) AS a
			PIVOT
			(
				MIN(PtProtocolStatusDate)
				FOR PtProtocolStatus IN ([Registered],[Consented],[Passed Screening])
			) AS a
		) p_status
			ON b.PatientProtocolId = p_status.PatientProtocolId
		WHERE
			c.ProtocolId = {1}
	) a
    -- required
    WHERE PassedScreeningDate IS NOT NULL
";

        /// <summary>
        /// A list of tables to not export
        /// </summary>
        public static readonly string[] NO_EXPORT_PATIENT_TABLES = new string[] 
        { 
            "PatientDiseases",
            "Permissions",
            "DiseaseAttributes",
            "DiseaseAttributeValues",
            "EForms",
            "EFormLog",
            "DxImageEndorectalUltrasounds",
            "EncBimanualExams", 
            "EncExams",
            "EncNodeExamFinding",
            "EncRectalExams",
            "EncReviewOfSystem",
            "Allergies",
            "DietaryIntake",
            "FamilyMembers",
            "Hospitalizations",
            "OperatingRoomDetails",
            "ProceduresAssistants",
            "PatientPhoneNumbers",
            "PhysicianBilling"
        };

        /// <summary>
        /// A list of fields to not export
        /// </summary>
        private static readonly string[] NO_EXPORT_PATIENT_FIELDS = new string[] 
        { 
            BusinessObject.EnteredBy,
            BusinessObject.EnteredTime,
            BusinessObject.UpdatedBy,
            BusinessObject.UpdatedTime,
            BusinessObject.LockedBy,
            BusinessObject.LockedTime,
            "ImgReviewed",
            "ImgCompared",
            "ImgDigitized",
            "EncFellow",
            "EncType",
            "EncNurse",
            "EncStatus",
            "EncPresentation",
            "PathLaboratory",
            "ClinStageNotes",
            "CategoryType"
        };

        /// <summary>
        /// Do not export fields which end with these values
        /// </summary>
        public static readonly string[] NO_EXPORT_ENDS_WITH_FIELDS = new string[]
        {
            "Id"
        };

        /// <summary>
        /// Do not export fields which contain these values
        /// </summary>
        public static readonly string[] NO_EXPORT_CONTAIN_FIELDS = new string[]
        {
            "Disease",
            "DataSource",
            "Quality",
            "Physician",
            "Surgeon",
            "Institution",
            "Assistants",
            "ChiefComplaint",
            "Pathologist",
            "Accession",
            "PathNum",
            "Pending",
            "SurgeonType",
            "Assistant",
            "AssistantType",
            "ChiefComplaints",
            "Diagnostics",
            "ProcAccreditation",
            "ProcCPT_Code",
            "ProcLogNum"
        };

        /// <summary>
        /// A list of patient statuses to include
        /// </summary>
        public static readonly string[] INCLUDED_STATUSES = new string[]
        {           
            "Clinical Mets Castrate",
            "Clinical Mets Non-Castrate",
            "Diagnosis Date",
            "Localized",
            "Rising PSA Castrate",
            "Rising PSA Non-Castrate"
        };

        public static readonly Dictionary<string, string> NULL_RESTRICTIONS = new Dictionary<string, string>
        {
            { "Specimens", "SpecimenStatus"}
        };


        private Dictionary<string, Dictionary<string, Type>> tableToFieldsMap = new Dictionary<string, Dictionary<string, Type>>();

        public ProtocolMgmtServices()
        {
            BuildMap();
        }

        private void BuildMap()
        {
            tableToFieldsMap = new Dictionary<string, Dictionary<string, Type>>();
            Caisis.DataAccess.MetadataDa.ReadColumns((record) =>
            {
                string tName = record["TABLE_NAME"].ToString();
                string cName = record["COLUMN_NAME"].ToString();
                string cTypeName = record["DATA_TYPE"].ToString();
                bool isNullable = record["IS_NULLABLE"].ToString().Equals("YES", StringComparison.OrdinalIgnoreCase);
                Type cType = typeof(string);
                switch (cTypeName)
                {
                    case ("datetime"):
                        cType = !isNullable ? typeof(DateTime) : typeof(DateTime?);
                        break;
                    case ("int"):
                        cType = !isNullable ? typeof(int) : typeof(int?);
                        break;
                    //case ("smallint"):
                    //    cType = typeof(int);
                    //    break;
                    //case ("decimal"):
                    //    cType = typeof(int);
                    //    break;
                    case ("bit"):
                        cType = !isNullable ? typeof(bool) : typeof(bool?);
                        break;
                    default:
                        cType = typeof(string);
                        break;
                }

                tableToFieldsMap.Adjoin(tName, new Dictionary<string, Type>());
                Dictionary<string, Type> fieldToTypeMap = tableToFieldsMap[tName];
                fieldToTypeMap.Add(cName, cType);

                return true;
            });

        }

        public static List<string> GetPatientTableNames()
        {
            // get a list of tables under Patients
            List<string> patientTables = new List<string>();
            EnumerateTable("Patients", patientTables);

            // cleanup
            var logTables = patientTables.Where(t => t.EndsWith("Log"));
            // patient tables which are part specific diseases
            string[] diseases = new string[] { "All", "Prostate" };
            var diseaseTables = diseases.SelectMany(d => BusinessObject.GetTableNamesForDisease(d));

            // filter: include Patient, except special tables, and which are part of disease speficic tables
            patientTables = patientTables.Except(NO_EXPORT_PATIENT_TABLES).Except(logTables).Intersect(diseaseTables).ToList();
            // add special tables
            string[] optionalTables = new string[] { "SpecimenAccessions", "Specimens", "Categories" };
            patientTables = patientTables.Union(optionalTables).ToList();

            patientTables.Add("Patients");

            return patientTables;
        }

        public static string GetClassName(string tableName)
        {
            if (tableName == "Status")
            {
                return "Status";
            }
            else if (tableName.EndsWith("y"))
            {
                return tableName;
            }
            else if (tableName.EndsWith("ies"))
            {
                return tableName.Substring(0, tableName.Length - 3) + "y";
            }
            if (tableName.EndsWith("s") && !tableName.EndsWith("Status"))
                return tableName.Substring(0, tableName.Length - 1);
            else
                return tableName;
        }

        public static string GetEnumerableClassName(string tableName)
        {
            if (tableName.EndsWith("y"))
            {
                return tableName.Substring(0, tableName.Length - 1) + "ies";
            }
            else if (tableName.EndsWith("ies"))
            {
                return tableName;
            }
            else if (tableName.EndsWith("Status"))
            {
                return tableName + "es";
            }
            else if (tableName.EndsWith("s"))
            {
                return tableName;
            }
            else
            {
                return tableName + "s";
            }
        }

        private static void EnumerateTable(string tableName, List<string> tables)
        {
            foreach (string table in BusinessObject.GetChildTableNames(tableName))
            {
                tables.Add(table);
                // special case: only specific table
                if (table == "PatientProtocols")
                {
                    tables.Add("PatientProtocolStatus");
                }
                else
                {
                    EnumerateTable(table, tables);
                }
            }
        }

        public Dictionary<string, Type> GetFieldNames(string tableName)
        {
            // SPECIAL CASES:
            if (tableName == "Patients")
            {
                //fieldNames = fieldNames.Take(0);
                return new Dictionary<string, Type> {
                    { Patient.PatientId, typeof(int) },
                    { Patient.PtRace, typeof(String) },
                    { Patient.PtGender, typeof(String) },
                    { Patient.PtDeathDate, typeof(DateTime?) },
                    { PatientProtocol.PtProtocolStudyId, typeof(String) },
                    { PatientProtocolRegistration.PtRegistrationAge, typeof(int?) },
                    { PatientProtocolRegistration.PhysicianOfRecord, typeof(String) }                
                };
            }
            else if (tableName == "SpecimenAccessions")
            {
                return new Dictionary<string, Type> {
                    { SpecimenAccession.CollectDate, typeof(DateTime) },
                    { SpecimenAccession.AccessionAnatomicSite, typeof(String) },
                    { SpecimenAccession.AccessionVisitType, typeof(String) },
                    { SpecimenAccession.AccessionProcInstrument, typeof(String) },
                    { SpecimenAccession.CollectNotes, typeof(String) }
                };
            }
            else if (tableName == "Specimens")
            {
                return new Dictionary<string, Type> {
                    { Specimen.SpecimenStatus , typeof(String) },
                    { Specimen.SpecimenType , typeof(String) },
                    { Specimen.SpecimenSubType , typeof(String) },
                    { Specimen.SpecimenPreservationType , typeof(String) },
                    { Specimen.SpecimenReferenceNumber , typeof(String) },                     
                    { Specimen.SpecimenCollectionTime  , typeof(String) },
                    { Specimen.SpecimenFrozenTime  , typeof(String) },
                    { Specimen.SpecimenNotes  , typeof(String) }
                };
            }
            else
            {
                var bo = BusinessObjectFactory.BuildBusinessObject(tableName);
                var view = new BusinessObject[] { bo }.AsDataView(tableName);
                Dictionary<string, Type> fieldMap = new Dictionary<string, Type>();
                // build type map

                var typeMap = tableToFieldsMap.ContainsKey(tableName) ? tableToFieldsMap[tableName] : new Dictionary<string, Type>();
                foreach (var field in typeMap)
                {
                    string fieldName = field.Key;
                    Type fieldType = field.Value;
                }

                // ADD FIELDS/MEMBERS
                var foreignKeys = BusinessObject.GetForeignKeyNames(tableName);
                var keyNames = new string[] { BusinessObject.GetPrimaryKeyName(tableName) }.Union(foreignKeys);

                var fieldNames = Caisis.BOL.BusinessObject.GetFieldNames(tableName);
                // cleanup DateText
                var dateTextFields = from field in fieldNames
                                     where field.EndsWith("Date")
                                     select field + "Text";
                fieldNames = fieldNames.Except(dateTextFields);
                // cleanup audit

                fieldNames = fieldNames.Except(NO_EXPORT_PATIENT_FIELDS).Except(keyNames);

                // remove fields which ends with or contains
                List<string> excludedFields = new List<string>();
                foreach (string exclusion in NO_EXPORT_ENDS_WITH_FIELDS)
                {
                    foreach (string field in fieldNames)
                    {
                        if (field.EndsWith(exclusion))
                            excludedFields.Add(field);
                    }
                }
                foreach (string exclusion in NO_EXPORT_CONTAIN_FIELDS)
                {
                    foreach (string field in fieldNames)
                    {
                        if (field.Contains(exclusion))
                            excludedFields.Add(field);
                    }
                }
                fieldNames = fieldNames.Except(excludedFields).Distinct();

                if (tableName == "PatientProtocols")
                {
                    // fieldMap.Add(PatientProtocol.PatientId, typeof(int));
                    //fieldMap.Add(PatientProtocol.ProtocolId, typeof(int));
                    fieldMap.Add(PatientProtocol.PtProtocolScreeningId, typeof(int?));
                    fieldMap.Add(PatientProtocol.PtProtocolStudyId, typeof(String));
                }
                foreach (string fieldName in fieldNames)
                {
                    if (typeMap.ContainsKey(fieldName))
                        fieldMap.Add(fieldName, typeMap[fieldName]);
                }

                return fieldMap;
            }
        }

        public static XDocument ExportProtocol(int protocolId, Dictionary<string, IEnumerable<int>> keyRestrictions)
        {
            return ProtocolImportExport.ExportProtocol(protocolId, keyRestrictions);
        }

        public static IEnumerable<BusinessObject> ImportProtocol(XDocument protocolMapping, int? existingProtocolId, out string error, params string[] validateFields)
        {
            return ProtocolImportExport.ImportProtocol(protocolMapping, existingProtocolId, out error, validateFields);
        }

        public void ExportProtocolPatients(XmlWriter writer, string datasetSQL, int userLoginId, int protocolId, IEnumerable<int> patients, IEnumerable<string> tables, Dictionary<string, List<Dictionary<string, object>>> table_restrictions, Dictionary<string, IEnumerable<string>> select_field_restrictions, bool unmaskDates)
        {
            // globals
            Database db = new Database();
            // cache
            IEnumerable<string> table_names = tables;
            Dictionary<string, IEnumerable<string>> table_to_child_tables = table_names.ToDictionary(t => t, t => BOL.BusinessObject.GetChildTableNames(t).Intersect(table_names)).Where(t => t.Value.Count() > 0).ToDictionary(t => t.Key, t => t.Value);
            Dictionary<string, string> table_to_x_table = table_names.ToDictionary(t => t, t => ProtocolMgmtServices.GetClassName(t));
            Dictionary<string, Dictionary<string, Type>> table_to_fields = table_names.ToDictionary(t => t, t => GetFieldNames(t));
            // get info for specific patients
            var eligiblePatients = from patient in GetEligibleProtocolExportPatients(datasetSQL, protocolId, unmaskDates, patients.ToArray()).AsEnumerable()
                                   select new
                                       {
                                           PatientId = (int)patient[Patient.PatientId],
                                           PtRace = patient[Patient.PtRace].ToString(),
                                           PtGender = patient[Patient.PtGender].ToString(),
                                           PtDeathDate = patient.IsNull(Patient.PtDeathDate) ? (DateTime?)null : (DateTime)patient[Patient.PtDeathDate],
                                           PtProtocolId = (int)patient[PatientProtocol.PatientProtocolId],
                                           PtProtocolStudyId = patient[PatientProtocol.PtProtocolStudyId].ToString(),
                                           PtRegistrationAge = patient[PatientProtocolRegistration.PtRegistrationAge].ToString(),
                                           PhysicianOfRecord = patient[PatientProtocolRegistration.PhysicianOfRecord].ToString(),
                                           // optional
                                           PassedScreeningDate = patient.IsNull("PassedScreeningDate") ? (DateTime?)null : (DateTime)patient["PassedScreeningDate"]
                                       };

            // <Patients>
            writer.WriteStartElement("Patients");
            foreach (var patient in eligiblePatients)
            {
                Dictionary<string, object> patient_fields = new Dictionary<string, object>()
                            {                              
                                //{ Patient.PatientId, patient.PatientId },
                                { Patient.PtRace, patient.PtRace },
                                { Patient.PtGender, patient.PtGender },
                                { Patient.PtDeathDate, patient.PtDeathDate },
                                { PatientProtocol.PtProtocolStudyId , patient.PtProtocolStudyId },
                                { PatientProtocolRegistration.PtRegistrationAge, patient.PtRegistrationAge },
                                { PatientProtocolRegistration.PhysicianOfRecord, patient.PhysicianOfRecord }
                            };
                // TODO: deep clone
                Dictionary<string, List<Dictionary<string, object>>> patient_table_restrictions = table_restrictions.ToDictionary(k => k.Key, v => v.Value.Select(a => a.ToDictionary(b => b.Key, c => c.Value)).ToList());
                // special tables
                List<Dictionary<string, object>> ptProtocolRestrictions = new List<Dictionary<string, object>>();
                ptProtocolRestrictions.Add(new Dictionary<string, object> { { PatientProtocol.PatientProtocolId, patient.PtProtocolId } });
                patient_table_restrictions.Add("PatientProtocols", ptProtocolRestrictions);

                // <Patient>
                WriteRecordAndChildren(
                        db,
                        writer,
                        "Patients",
                        patient.PatientId,
                        patient_fields,
                        table_names,
                        table_to_child_tables,
                        patient.PassedScreeningDate,
                        patient_table_restrictions,
                        table_to_x_table,
                        table_to_fields,
                        select_field_restrictions,
                        unmaskDates);
                // </Patient>
            }
            // </Patients>
            writer.WriteEndElement();
            writer.Flush();
        }

        private void WriteRecordAndChildren(
            Database db,
            XmlWriter writer,
            string table_name,
            int table_pri_key,
            IDictionary<string, object> table_data,
            IEnumerable<string> table_names,
            Dictionary<string, IEnumerable<string>> table_to_child_tables,
            DateTime? baseline,
            Dictionary<string, List<Dictionary<string, object>>> table_restrictions,
            Dictionary<string, string> table_to_x_table,
            Dictionary<string, Dictionary<string, Type>> table_to_fields,
            Dictionary<string, IEnumerable<string>> select_field_restrictions,
            bool unmasked)
        {
            // select restriction: if table has static select, do not add missing fields
            if (select_field_restrictions.ContainsKey(table_name) && select_field_restrictions[table_name].Count() > 0)
            {
                var select_fields = select_field_restrictions[table_name];
                table_data = table_data.Where(p => select_fields.Contains(p.Key)).ToDictionary(k => k.Key, v => v.Value);
            }
            // if table contains no data to write, ignore node
            if (table_data.Count == 0 || !table_data.Any(v => !string.IsNullOrEmpty(v.Value + "")))
                return;
            // TODO: restrict statuses
            if (table_name == "Status" && table_data.ContainsKey("Status"))
            {
                string status = table_data["Status"] + "";
                if (!INCLUDED_STATUSES.Contains(status, StringComparer.OrdinalIgnoreCase))
                    return;
            }
            // todo: restrict null fields i.e., don't export specimens without status
            if (NULL_RESTRICTIONS.ContainsKey(table_name))
            {
                string field = NULL_RESTRICTIONS[table_name];
                // stop processing on empty field data
                if (!table_data.ContainsKey(field) || table_data[field] + "" == "")
                {
                    return;
                }
            }

            // <Encounter>
            string table_pri_key_name = BOL.BusinessObject.GetPrimaryKeyName(table_name);
            string xTableName = table_to_x_table[table_name];
            writer.WriteStartElement(xTableName);

            // write field data
            var field_to_type = table_to_fields[table_name];
            foreach (string field_name in table_data.Keys)
            {
                object field_value = table_data[field_name];
                Type field_type = field_to_type[field_name];
                bool isUnmaskedDate = unmasked && (field_type == typeof(DateTime) || field_type == typeof(DateTime?));
                // write field value: including masked value
                string fieldValue = GetRawFieldValue(field_type, field_value, baseline, false);
                // for unmasked dates, don't write empty
                if (!isUnmaskedDate || !string.IsNullOrEmpty(fieldValue))
                {
                    writer.WriteStartElement(field_name);
                    writer.WriteValue(fieldValue);
                    writer.WriteEndElement();
                    writer.Flush();
                }
                // special case: write unmasked date values
                if (isUnmaskedDate)
                {
                    string field_name_unmasked = field_name + "_Unmasked";
                    string field_value_unmasked = GetRawFieldValue(field_type, field_value, baseline, true);

                    writer.WriteStartElement(field_name_unmasked);
                    writer.WriteValue(field_value_unmasked);
                    writer.WriteEndElement();
                    writer.Flush();
                }
                // ...
                // <LabDate>78</LabDate>
                // <LabResult>23</LabResults>
                // ...
                // xml.WriteRaw(tmp.OuterXml);
            }
            if (table_to_child_tables.ContainsKey(table_name))
            {
                var child_tables = table_to_child_tables[table_name];

                foreach (var child_table in child_tables)
                {
                    string child_table_pri_key_name = BOL.BusinessObject.GetPrimaryKeyName(child_table);
                    string child_table_parent_key_name = BOL.BusinessObject.GetParentKeyName(child_table);
                    string xEnumTableName = ProtocolMgmtServices.GetEnumerableClassName(child_table);

                    var child_fields_to_type = table_to_fields[child_table];
                    var child_table_fields = child_fields_to_type.Keys;//.Intersect(BOL.BusinessObject.GetFieldNames(child_table));
                    if (child_table_fields.Count() == 0)
                        continue;

                    bool enumTableWritten = false;

                    Dictionary<string, object> parent_key_restriction = new Dictionary<string, object> { { child_table_parent_key_name, table_pri_key } };
                    IEnumerable<Dictionary<string, object>> child_table_restrictions_list;
                    // static restrictions
                    if (table_restrictions.ContainsKey(child_table))
                    {
                        child_table_restrictions_list = table_restrictions[child_table];
                    }
                    else
                    {
                        var base_child_table_restriction = new List<Dictionary<string, object>>();
                        base_child_table_restriction.Add(new Dictionary<string, object>());
                        child_table_restrictions_list = base_child_table_restriction;
                    }

                    foreach (var restriction in child_table_restrictions_list)
                    {
                        var child_table_restrictions = restriction.Concat(parent_key_restriction).ToDictionary(k => k.Key, v => v.Value);

                        db.Select(
                            child_table,
                            child_table_pri_key_name,
                            child_table_fields.Union(new string[] { child_table_pri_key_name }),
                            new string[0],
                            child_table_restrictions,
                            (record) =>
                            {
                                // <EncPhysicalExams>
                                if (!enumTableWritten)
                                {
                                    writer.WriteStartElement(xEnumTableName);
                                    enumTableWritten = true;
                                }

                                // <EncPhysicalExam>
                                int child_key = (int)record[child_table_pri_key_name];
                                string xChildTableName = table_to_x_table[child_table];

                                var record_data = child_table_fields.Where(f => !record.IsDBNull(record.GetOrdinal(f))).ToDictionary(f => f, f => record[f]);
                                if (record_data.Count() > 0)
                                    WriteRecordAndChildren(db, writer, child_table, child_key, record_data, table_names, table_to_child_tables, baseline, table_restrictions, table_to_x_table, table_to_fields, select_field_restrictions, unmasked);

                                return true;
                            });
                    }

                    // </EncPhysicalExams>
                    if (enumTableWritten)
                    {
                        writer.WriteEndElement();
                        writer.Flush();
                    }
                }
            }
            // </Encounter>
            writer.WriteEndElement();
            writer.Flush();
        }

        //        public XDocument ExportProtocolPatients(string datasetSQL, int userLoginId, int protocolId, IEnumerable<int> patients, ExportServices.ExceptionHandlerDelegate exceptionHandler)
        //        {
        //            // restrict dataset to dataset and protocol
        //            string protocolDatasetSQLFormat =
        //             @"
        //            SELECT
        //              a.*
        //            FROM
        //            (
        //                SELECT b.*
        //                FROM ({0}) a
        //                INNER JOIN Patients b 
        //                    ON a.PatientId = b.PatientId
        //                {1}
        //            ) a
        //            ";
        //            // get eligible patients
        //            string eligiblePatientsDatasetSQL = GetEligibleProtocolExportPatientsSQL(datasetSQL, protocolId);
        //            string restrictedPatientIds = "";
        //            // add restricted patient ids
        //            if (patients.Count() > 0)
        //                restrictedPatientIds = "WHERE b.PatientId IN(" + string.Join(",", patients.Select(s => s.ToString()).ToArray()) + ")";
        //            string datasetProtocolSQL = string.Format(protocolDatasetSQLFormat, eligiblePatientsDatasetSQL, restrictedPatientIds);

        //            XmlWriterSettings settings = new XmlWriterSettings();
        //            settings.Indent = true;
        //            settings.IndentChars = "\t";

        //            //XmlWriter output = XmlWriter.Create(Response.Output, settings);

        //            ExportServices es = new ExportServices();
        //            es.ExceptionHandler = exceptionHandler;
        //            es.DatasetSql = datasetProtocolSQL;
        //            es.DiseaseType = "All";
        //            es.PrivacyLevel = "Identified";
        //            /*
        //            DateTime approvalDate;
        //            if (DateTime.TryParse(Request.Form["approvalDate"], out approvalDate))
        //            {
        //                es.IrbApprovalDate = approvalDate;
        //            }
        //             */
        //            es.IrbApprovalDate = DateTime.Today;

        //            es.IrbApprovalType = "Research Authorization";
        //            es.Purpose = "Data Exploration";
        //            es.UserLoginId = userLoginId;

        //            es.AppendFilenameHeaderCallback = new ExportServices.AppendFilenameHeaderDelegate((myInt) =>
        //            {
        //            });

        //            // get a list of tables
        //            List<string> tables = ProtocolMgmtServices.GetPatientTableNames();
        //            //es.Export(output, tables);

        //            //output.Close();

        //            // debug
        //            XDocument xDoc = new XDocument();
        //            XmlWriter xWriter = xDoc.CreateWriter();
        //            es.Export(xWriter, tables);

        //            xWriter.Close();

        //            // get a list of eligible patients and requirements
        //            DataTable eligiblePatientsDataset = GetEligibleProtocolExportPatients(datasetSQL, protocolId);

        //            // root element: <Patients>
        //            XElement xPatients = new XElement("Patients");
        //            foreach (var patient in xDoc.Root.Elements("Patients"))
        //            {
        //                // get patientId
        //                string patientIdValue = patient.Element("PatientId").Value;
        //                int patientId = int.Parse(patientIdValue);
        //                // de-identify patient
        //                //patient.RemoveAll();


        //                // get PatientProtocol
        //                //var ptProtocolRecords = BusinessObject.GetByFields<PatientProtocol>(new Dictionary<string, object>
        //                //{
        //                //    { PatientProtocol.ProtocolId, protocolId },
        //                //    { PatientProtocol.PatientId, patientId }
        //                //});
        //                //PatientProtocol ptProtocol = ptProtocolRecords.First();

        //                // PatientProtocol fields
        //                var ptProtocol = eligiblePatientsDataset.Select(PatientProtocol.PatientId + " = " + patientId).First();
        //                int ptProtocolId = (int)ptProtocol[PatientProtocol.PatientProtocolId];
        //                string ptProtocolStudyId = ptProtocol[PatientProtocol.PtProtocolStudyId].ToString();

        //                // get date of diagnosis
        //                /*
        //                DateTime baseline = DateTime.Now;
        //                // get regsitered date
        //                var registered = BusinessObject.GetByFields<PatientProtocolStatus>(
        //                    new Dictionary<string, object>
        //                    {
        //                        { PatientProtocolStatus.PatientProtocolId, ptProtocolId },
        //                        { PatientProtocolStatus.PtProtocolStatus, "Registered" }
        //                    });

        //                if (registered.Count() > 0)
        //                {
        //                    baseline = (DateTime)registered.First()[PatientProtocol.EnteredTime];
        //                }
        //                 */
        //                // validate diagnosis date + age
        //                if (ptProtocol.IsNull(Status.StatusDate) || ptProtocol.IsNull(PatientProtocolRegistration.PtRegistrationAge))
        //                    continue;
        //                DateTime dateOfDiagnosis = (DateTime)ptProtocol[Status.StatusDate];// GetDateOfDiagnosis(patientId);
        //                int ageAtRegistration = (int)ptProtocol[PatientProtocolRegistration.PtRegistrationAge];// GetPatientRegistrationAge(ptProtocolId);

        //                //if (!dateOfDiagnosis.HasValue || !ageAtRegistration.HasValue)
        //                //    continue;

        //                // recursively build <Patient> tree
        //                XElement xPatient = RecursivelyBuild(tables, xDoc, patient, dateOfDiagnosis);
        //                // todo: cleanup
        //                xPatient.Elements(PatientProtocol.PtProtocolStudyId).Remove();
        //                xPatient.Elements(PatientProtocolRegistration.PtRegistrationAge).Remove();

        //                // special fields
        //                XElement xPatientId = xPatient.Element(Patient.PatientId);
        //                XElement xStudyId = new XElement(PatientProtocol.PtProtocolStudyId, ptProtocolStudyId);
        //                xPatientId.AddAfterSelf(xStudyId);
        //                XElement xPtAge = new XElement(PatientProtocolRegistration.PtRegistrationAge, ageAtRegistration);
        //                xStudyId.AddAfterSelf(xPtAge);

        //                // cleanup "other" PatientProtocols
        //                var xPtProtocols = xPatient.Descendants("PatientProtocol");
        //                var xOtherPtProtocols = xPtProtocols.Where(pp => pp.Element(PatientProtocol.PatientId).Value != patientId.ToString() && pp.Element(PatientProtocol.ProtocolId).Value != protocolId.ToString());
        //                xOtherPtProtocols.Remove();

        //                // add <Patient> to <Patients>
        //                xPatients.Add(xPatient);

        //                // validation ?: deserialize -> serialize
        //            }

        //            // return <Patients> document
        //            XDocument xPatientsDocument = new XDocument(
        //                                             new XDeclaration("1.0", "utf-8", "yes"),
        //                                                 xPatients);
        //            return xPatientsDocument;
        //        }

        public List<string> ValidatePatientProtocolSchema(XDocument patientExport)
        {
            XDocument patientSchema = GetPatientProtocolSchema();
            return ValidatePatientProtocolSchema(patientExport, patientSchema);
        }

        public List<string> ValidatePatientProtocolSchema(XDocument patientExport, XDocument patientSchema)
        {
            XmlSchemaSet schemas = new XmlSchemaSet();
            schemas.Add(XSD_NAMESPACE, patientSchema.CreateReader());// XmlReader.Create(new StringReader(xsdMarkup)));

            List<string> errors = new List<string>();
            patientExport.Validate(schemas, (o, e) =>
            {
                errors.Add(e.Message);
            });

            return errors;
        }

        /// <summary>
        /// Returns a list of patients eligible for Export
        /// </summary>
        /// <param name="datasetSQL"></param>
        /// <param name="protocolId"></param>
        /// <param name="unmaskDates"></param>
        /// <param name="patients"></param>
        /// <returns></returns>
        public static DataTable GetEligibleProtocolExportPatients(string datasetSQL, int protocolId, bool unmaskDates, params int[] patients)
        {
            string sql = GetEligibleProtocolExportPatientsSQL(datasetSQL, protocolId, unmaskDates, patients);
            SqlCommand eligiblePatientsCMD = DataAccess.DataAccessHelper.CreateSqlCommand(sql);
            DataTable eligiblePatientsDataset = DataAccess.DataAccessHelper.GetRecord(eligiblePatientsCMD).Tables[0];
            return eligiblePatientsDataset;
        }

        private static string GetEligibleProtocolExportPatientsSQL(string datasetSQL, int protocolId, bool unmaskDates, params int[] patients)
        {
            if (patients.Length > 0)
            {
                string patientsCSV = string.Join(",", patients.Select(p => p.ToString()).ToArray());
                datasetSQL = string.Format("SELECT a.* FROM ({0}) a WHERE a.PatientId IN({1})", datasetSQL, patientsCSV);
            }
            string getEligiblePatientsDatasetSQL = string.Format(ELIGIBLE_PATIENTS_SQL, datasetSQL, protocolId);
            return getEligiblePatientsDatasetSQL;
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="patientId"></param>
        /// <returns></returns>
        public static Procedure GetDiagnosticBiopsy(int patientId)
        {
            string DIAGNOSIS_SQL =
    @"
SELECT TOP 1
	a.ProcedureId
FROM
(
	SELECT
        PatientId,
	    ProcedureId,
	    ROW_NUMBER() OVER(PARTITION BY PatientId ORDER BY ProcRank DESC, ProcDate ASC) AS RowNum
	FROM
	(
		SELECT
            Procedures.PatientId,
            Procedures.ProcedureId,
			Procedures.ProcDate,
			-- create rank
			(CASE
				WHEN ProcSite = 'Prostate' AND Pathology.PathResult IN ('MOD', 'POOR', 'WELL', 'LOW', 'POS', 'Positive') THEN 1
				ELSE 0
			END)
			AS [ProcRank]
		FROM Patients p
		INNER JOIN Procedures
			ON Procedures.PatientId = p.PatientId
		INNER JOIN Pathology
			ON Procedures.ProcedureId = Pathology.ProcedureId
		WHERE
			Procedures.PatientId = @PatientId
			AND
			ProcName IN ('TURP', 'TRUS Biopsy', 'Biopsy', 'Needle Biopsy', 'Core Biopsy')
			AND
			ProcDate IS NOT NULL
	) a
) a
WHERE
	RowNum = 1
";
            SqlCommand cmd = DataAccessHelper.CreateSqlCommand(DIAGNOSIS_SQL);
            DataAccessHelper.AddIntInputParam(cmd, "PatientId", patientId);
            DataTable diagnosticBiopsies = DataAccessHelper.GetRecord(cmd).Tables[0];
            if (diagnosticBiopsies.Rows.Count > 0)
            {
                Procedure biopsy = new Procedure();
                biopsy.Get((int)diagnosticBiopsies.Rows[0][Procedure.ProcedureId]);
                return biopsy;
            }
            return null;
        }

        /// <summary>
        /// Returns the date (if applicable) of diagnosis, i.e., Status = "Diagnosis Date of Prostate Cancer"
        /// </summary>
        /// <param name="patientId"></param>
        /// <returns></returns>
        public static DateTime? GetDateOfDiagnosis(int patientId)
        {
            DateTime? dateOfDiagnosis = null;
            // query diagnosis date via Status
            var diagnosisStatus = BusinessObject.GetByFields<Status>(
                          new Dictionary<string, object>
                           {
                               { Status.PatientId, patientId },
                               { Status.Status_Field, "Diagnosis Date" },
                               { Status.StatusDisease, "Prostate Cancer" }
                           }).FirstOrDefault();
            if (diagnosisStatus != null && !diagnosisStatus.IsNull(Status.StatusDate))
            {
                dateOfDiagnosis = (DateTime)diagnosisStatus[Status.StatusDate];
            }
            // get via diagnostics biopsy
            else
            {
                Procedure diagnosticBiopsy = GetDiagnosticBiopsy(patientId);
                if (diagnosticBiopsy != null && diagnosticBiopsy.PrimaryKeyHasValue)
                {
                    dateOfDiagnosis = (DateTime)diagnosticBiopsy[Procedure.ProcDate];
                }
            }
            return dateOfDiagnosis;
        }

        /// <summary>
        /// Gets the PSA at Diagnosis
        /// </summary>
        /// <param name="patientId"></param>
        /// <returns></returns>
        public static LabTest GetBaselinePSA(int patientId)
        {
            // check if baseline PSA by stamp
            var baselineParams =  new Dictionary<string, object> { { LabTest.LabTest_Field, "PSA" } };
            LabTest baselineLab = GetBaselineRecord<LabTest>(patientId, baselineParams, "PSA") ?? GetBaselineRecord<LabTest>(patientId, baselineParams, "");
            if (baselineLab != null)
            {
                return baselineLab;
            }
            // else use closest to date of diagnosis
            else
            {
                DateTime? diagnosisDate = GetDateOfDiagnosis(patientId);
                if (diagnosisDate.HasValue)
                {
                    // get PSA before diagnosis date
                    LabTestDa da = new LabTestDa();
                    DataTable labs = da.GetClosestLabs(patientId, diagnosisDate.Value, "PSA");
                    if (labs.Rows.Count > 0)
                    {
                        int labTestId = (int)labs.Rows[0][LabTest.LabTestId];
                        LabTest lab = new LabTest();
                        lab.Get(labTestId);
                        return lab;
                    }
                }
            }
            return null;
        }

        /// <summary>
        /// Gets the baseline Biopsy
        /// </summary>
        /// <param name="patientId"></param>
        /// <returns></returns>
        public static Procedure GetBaselineBiopsy(int patientId)
        {
            return GetBaselineRecord<Procedure>(patientId, new Dictionary<string, object>(), "BX");
        }

        /// <summary>
        /// For the specified table and params, get the Baseline record
        /// </summary>
        /// <typeparam name="T"></typeparam>
        /// <param name="patientId"></param>
        /// <param name="queryParams"></param>
        /// <param name="enteredBySuffix"></param>
        /// <returns></returns>
        public static T GetBaselineRecord<T>(int patientId, Dictionary<string, object> queryParams, string enteredBySuffix) where T : BusinessObject, new()
        {
            string sqlFormat =
@"
SELECT TOP 1 {1}
FROM {0}
WHERE
	PatientId = @PatientId
	AND
	EnteredBy LIKE '%(' + @EnteredBy + ')%'
    {2}
ORDER BY
	EnteredTime ASC
";
            string enteredBy = string.Format(!string.IsNullOrEmpty(enteredBySuffix) ? "baseline - {0}" : "baseline", enteredBySuffix);
            T bizo = new T();
            Dictionary<string, object> whereParams = queryParams.Where(a => bizo.HasField(a.Key)).ToDictionary(a => a.Key, a => a.Value);
            string whereSQL = "";
            // add param filter
            whereParams.ForEach(p =>
                    whereSQL += string.Format(" AND {0} = @{0}", p.Key));
            string sql = string.Format(sqlFormat, bizo.TableName, bizo.PrimaryKeyName, whereSQL);
            SqlCommand cmd = DataAccessHelper.CreateSqlCommand(sql);
            DataAccessHelper.AddIntInputParam(cmd, "PatientId", patientId);
            DataAccessHelper.AddStringInputParam(cmd, "EnteredBy", enteredBy);
            // add params
            whereParams.ForEach(p =>
                DataAccessHelper.AddInputParam(cmd, p.Key, p.Value, false));
            DataView view = DataAccessHelper.GetRecord(cmd).Tables[0].DefaultView;
            if (view.Count > 0)
            {
                int priKey = (int)view[0][0];
                bizo.Get(priKey);
                return bizo;
            }
            else
            {
                return null;
            }
        }
        
        /// <summary>
        /// Returns the age at time of registration via [PatientProtocolRegistration]
        /// </summary>
        /// <param name="patientProtocolId"></param>
        /// <returns></returns>
        public static int? GetPatientRegistrationAge(int patientProtocolId)
        {
            PatientProtocolRegistration biz = BOL.BusinessObject.GetByParent<PatientProtocolRegistration>(patientProtocolId).FirstOrDefault();
            if (biz != null && !biz.IsEmpty)
            {
                int parseAge = -1;
                string age = biz[PatientProtocolRegistration.PtRegistrationAge].ToString();
                if (!string.IsNullOrEmpty(age) && int.TryParse(age, out parseAge))
                {
                    return parseAge;
                }
            }
            return null;
        }

        private XElement RecursivelyBuild(IEnumerable<string> sourceTables, XDocument sourceDoc, XElement sourceNode, DateTime baselineDate)
        {
            string tableName = sourceNode.Name.LocalName;
            string xTableName = ProtocolMgmtServices.GetClassName(tableName);
            string xEnumTableName = ProtocolMgmtServices.GetEnumerableClassName(tableName);
            string priKeyName = BOL.BusinessObject.GetPrimaryKeyName(tableName);
            string priKeyValue = sourceNode.Element(priKeyName) != null ? sourceNode.Element(priKeyName).Value : "";
            var fieldNames = GetFieldNames(tableName);

            // select fields with data, validate field data types
            var xFieldData = from field in fieldNames.Keys
                             let fieldType = fieldNames[field]
                             // always add field
                             let fieldValue = sourceNode.Element(field) != null ? sourceNode.Element(field).Value : ""
                             where !string.IsNullOrEmpty(fieldValue)
                             select new XElement(field, GetFieldXValue(fieldType, fieldValue, baselineDate));
            var xData = new XElement(xTableName);
            if (xFieldData.Count() > 0)
            {
                xData.Add(xFieldData);
            }

            // children
            if (!string.IsNullOrEmpty(priKeyValue))
            {
                foreach (string childTableName in BusinessObject.GetChildTableNames(tableName).Intersect(sourceTables))
                {
                    var childTableEnum = ProtocolMgmtServices.GetEnumerableClassName(childTableName);
                    var xChildEnum = new XElement(childTableEnum);
                    var childData = sourceDoc.Root.Elements(childTableName).Where(l => l.Element(priKeyName).Value == priKeyValue);
                    foreach (var c in childData)
                    {
                        xChildEnum.Add(RecursivelyBuild(sourceTables, sourceDoc, c, baselineDate));
                    }

                    xData.Add(xChildEnum);
                }
            }

            return xData;

        }

        private static string GetFieldXValue(Type fieldType, string fieldValue, DateTime baselineDate)
        {
            string xValue = "";
            // int fields: validate field
            if ((fieldType == typeof(int) || fieldType == typeof(int?)) && !string.IsNullOrEmpty(fieldValue))
            {
                xValue = int.Parse(fieldValue).ToString();
            }
            else if ((fieldType == typeof(bool) || fieldType == typeof(bool?)) && !string.IsNullOrEmpty(fieldValue))
            {
                xValue = bool.Parse(fieldValue).ToString().ToLower();
            }
            // date time fields: output days from baseline date
            else if ((fieldType == typeof(DateTime) || fieldType == typeof(DateTime?)) && !string.IsNullOrEmpty(fieldValue))
            {
                xValue = ((int)DateTime.Parse(fieldValue).Subtract(baselineDate).TotalDays).ToString();
            }
            // nullable || string: output raw value
            else
            {
                xValue = fieldValue;
            }


            return xValue;
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="fieldType"></param>
        /// <param name="fieldValue"></param>
        /// <param name="baselineDate"></param>
        /// <param name="unmasked">True|False if value is unmasked (for default masked values)</param>
        /// <returns></returns>
        private static string GetRawFieldValue(Type fieldType, object fieldValue, DateTime? baselineDate, bool unmasked)
        {
            string xValue = "";
            // int fields: validate field
            if ((fieldType == typeof(int) || fieldType == typeof(int?)))
            {
                return fieldValue.ToString();
            }
            else if ((fieldType == typeof(bool) || fieldType == typeof(bool?)))
            {
                return ((bool)fieldValue).ToString().ToLower();
            }
            // date time fields: output days from baseline date
            else if ((fieldType == typeof(DateTime) || fieldType == typeof(DateTime?)))
            {
                if (fieldValue == null)
                {
                    return "";
                }
                else
                {
                    // unmasked
                    if (unmasked)
                        return ((DateTime)fieldValue).ToUniversalTime().ToString("yyyy-MM-dd");
                    // masked
                    else if (baselineDate.HasValue)
                        return ((int)((DateTime)fieldValue).Subtract(baselineDate.Value).TotalDays).ToString();
                    else
                        return "";
                }
                // todo: add better validation
                //    throw new Exception("Baseline date required for export");
            }
            // nullable || string: output raw value
            else
            {
                return fieldValue.ToString();
            }

        }


        /// <summary>
        /// Gets the XSD schema representation of a Patient Protocol
        /// </summary>
        /// <returns></returns>
        public XDocument GetPatientProtocolSchema()
        {
            var xsdService = new ProtocolXSDServices(this);
            return xsdService.GetPatientProtocolXSD();
        }

        #region DATA HELPERS

        #endregion

        internal static class ProtocolImportExport
        {
            private static readonly Dictionary<string, IEnumerable<string>> PROTOCOL_TABLES_AND_RESTRICTIONS = new Dictionary<string, IEnumerable<string>>
            {
                { "Protocols", new string[] { "ProjectId" } },
                { "ProtocolMgr_ProtocolVersions", new string[] { "MetadataSurveyId" } },
                { "ProtocolMgr_ProtocolSchemas", new string[] {} },
                { "ProtocolMgr_SchemaItems", new string[] {} },
                { "ProtocolMgr_SchemaItemFields", new string[] {} },
                { "ProtocolMgr_Timeline", new string[] {} },
                { "ProtocolMgr_ItemTimeline", new string[] {} }
            };

            public static void FillKeys(string table_name, int pri_key, Dictionary<string, Dictionary<int, int>> map)
            {
                string pri_key_name = BusinessObject.GetPrimaryKeyName(table_name);
                // create entry if none exists, get table => keys
                map.Adjoin(table_name, new Dictionary<int, int>());
                Dictionary<int, int> realToFake = map[table_name];
                // get xml pri key
                int x_pri_key = (realToFake.Count() > 0 ? realToFake.Values.Max() : 0) + 1;
                realToFake.Add(pri_key, x_pri_key);

                Database db = new Database();
                var child_tables = BusinessObject.GetChildTableNames(table_name).Intersect(map.Keys);
                foreach (string child_table in child_tables)
                {
                    string child_pri_key_name = BusinessObject.GetPrimaryKeyName(child_table);
                    List<int> child_pri_keys = new List<int>();
                    db.Select(child_table,
                        child_pri_key_name,
                        new string[] { child_pri_key_name },
                        new string[0],
                        new Dictionary<string, object> { { pri_key_name, pri_key } },
                        r =>
                        {
                            child_pri_keys.Add((int)r[child_pri_key_name]);
                            return true;
                        });
                    child_pri_keys.ForEach(child_key =>
                           FillKeys(child_table, child_key, map));
                }
            }

            /// <summary>
            /// Gets a list of exportable column names (excluding pri keys and audit fields)
            /// </summary>
            /// <param name="tableName"></param>
            /// <returns></returns>
            public static IEnumerable<string> GetDataColumnNames(string tableName)
            {
                string pri_key_name = BusinessObject.GetPrimaryKeyName(tableName);
                var all_field_names = BusinessObject.GetFieldNames(tableName);
                var foreign_key_names = BusinessObject.GetForeignKeyNames(tableName);
                var export_field_names =
                        new string[] 
                    { 
                        BusinessObject.EnteredBy,
                        BusinessObject.EnteredTime,
                        BusinessObject.UpdatedBy,
                        BusinessObject.UpdatedTime,
                        BusinessObject.LockedBy,
                        BusinessObject.LockedTime
                    };
                var no_copy_names = PROTOCOL_TABLES_AND_RESTRICTIONS.ContainsKey(tableName) ? PROTOCOL_TABLES_AND_RESTRICTIONS[tableName] : new string[0];
                var std_columns = all_field_names.Except(new string[] { pri_key_name }).Except(foreign_key_names).Except(export_field_names).Except(no_copy_names);
                return std_columns;
            }

            public static void RecursiveBuild(List<XElement> xData, IBusinessObject biz, Dictionary<string, Dictionary<int, int>> map, Dictionary<string, IEnumerable<int>> keyRestrictions)
            {
                // table variables
                string table_name = biz.TableName;
                string pri_key_name = BusinessObject.GetPrimaryKeyName(table_name);
                var all_field_names = BusinessObject.GetFieldNames(table_name);
                var foreign_key_names = biz.ForeignKeyNames;
                var export_field_names =
                        new string[] 
                    { 
                        BusinessObject.EnteredBy,
                        BusinessObject.EnteredTime,
                        BusinessObject.UpdatedBy,
                        BusinessObject.UpdatedTime,
                        BusinessObject.LockedBy,
                        BusinessObject.LockedTime
                    };
                var std_columns = GetDataColumnNames(table_name);
                // tables
                var restricted_table_names = map.Keys;
                var child_table_names = BusinessObject.GetChildTableNames(table_name).Intersect(restricted_table_names);

                // xml special variables
                int pri_key = (int)biz[pri_key_name];
                int x_pri_key = map[table_name][pri_key];

                // validation: if restrictions defined, only allow export of specific keys
                // TODO: do we fix generating of x_pri_key???
                if (keyRestrictions.ContainsKey(table_name) && !keyRestrictions[table_name].Contains(pri_key))
                {
                    return;
                }


                // build node
                XElement table_node = new XElement(table_name);

                // build standard fields
                var std_fields = from field in std_columns
                                 select new XElement(field, GetData(biz[field]));
                // build foreign keys
                var key_fields = from field in foreign_key_names
                                 let foreign_key = (int)biz[field]
                                 let found = map.Where(t => BusinessObject.GetPrimaryKeyName(t.Key) == field && t.Value.ContainsKey(foreign_key))
                                 where found.Count() > 0
                                 let _foreignKey = found.First().Value[foreign_key]
                                 select new XElement(field, _foreignKey);
                // BUILD SELF:
                // add pri key
                table_node.Add(new XElement(pri_key_name, x_pri_key));
                // add key fields
                table_node.Add(key_fields);
                // add std fields
                table_node.Add(std_fields);
                xData.Add(table_node);

                // BUILD CHILDREN:
                var all_child_biz = child_table_names.SelectMany(child_table => BusinessObject.GetByFields(child_table, new Dictionary<string, object> { { pri_key_name, pri_key } }));
                all_child_biz.ForEach(b => RecursiveBuild(xData, b, map, keyRestrictions));


                //// build children downwards
                //var children = from child_table in child_table_names
                //               // i.e., get all Protocol Versions where ProtocolId = 1
                //               from child_biz in BusinessObject.GetByFields(child_table, new Dictionary<string, object> { { pri_key_name, pri_key } })
                //               select RecursiveBuild(xData, child_biz, map);

                //// add children
                //table_node.Add(children);
                //return table_node;
            }

            public static string GetData(object source)
            {
                if (source is DateTime)
                {
                    // ISO 8601 format
                    DateTime date = (DateTime)source;
                    string dateString = date.ToString("s");
                    return dateString;
                }
                else if (source != null)
                {
                    return source.ToString();
                }
                else
                {
                    return string.Empty;
                }
            }

            /// <summary>
            /// Exports the current Protocol as an XmlDocument
            /// </summary>
            /// <param name="protocolId"></param>
            /// <param name="keyRestrictions"></param>
            /// <returns></returns>
            public static XDocument ExportProtocol(int protocolId, Dictionary<string, IEnumerable<int>> keyRestrictions)
            {
                Protocol protocol = new Protocol();
                protocol.Get(protocolId);
                return ExportProtocol(protocol, keyRestrictions);
            }

            /// <summary>
            /// Exports the current Protocol as an XmlDocument
            /// </summary>
            /// <param name="protocol"></param>
            /// <param name="keyRestrictions"></param>
            /// <returns></returns>
            public static XDocument ExportProtocol(Protocol protocol, Dictionary<string, IEnumerable<int>> keyRestrictions)
            {
                int protocolId = (int)protocol[Protocol.ProtocolId];
                Dictionary<string, Dictionary<int, int>> tableToRealToAutoKeys = new Dictionary<string, Dictionary<int, int>>();
                List<XElement> xData = new List<XElement>();

                PROTOCOL_TABLES_AND_RESTRICTIONS.Keys.ForEach(t =>
                                tableToRealToAutoKeys.Add(t, new Dictionary<int, int>()));
                FillKeys(protocol.TableName, protocolId, tableToRealToAutoKeys);


                RecursiveBuild(xData, protocol, tableToRealToAutoKeys, keyRestrictions);
                XDocument xDoc = new XDocument(
                                            new XDeclaration("1.0", "utf-8", "yes"),
                                                new XElement("Caisis",
                                                    xData));
                return xDoc;
            }

            /// <summary>
            /// Imports the specifiec XmlDocument mapping into a Protocol (existing or new)
            /// </summary>
            /// <param name="protocolMapping"></param>
            /// <param name="existingProtocolId"></param>
            /// <param name="error">(Optional) Protocol to insert versions, schemas, etc... into</param>
            /// <param name="validateFields">A list of fields to validate against before inserting</param>
            /// <returns>Imported BizObject records</returns>
            public static IEnumerable<BusinessObject> ImportProtocol(XDocument protocolMapping, int? existingProtocolId, out string error, params string[] validateFields)
            {
                // attempt to process Protocol
                Dictionary<string, Dictionary<int, int>> map = new Dictionary<string, Dictionary<int, int>>();
                List<BusinessObject> bizos = new List<BusinessObject>();
                // STEP 1:
                foreach (string table in PROTOCOL_TABLES_AND_RESTRICTIONS.Keys)
                {
                    map.Adjoin(table, new Dictionary<int, int>());
                    var lookup = map[table];

                    string priKeyField = BusinessObject.GetPrimaryKeyName(table);
                    var foreignKeyFields = BusinessObject.GetForeignKeyNames(table);
                    var nonKeyFields = GetDataColumnNames(table);
                    foreach (var xTableData in protocolMapping.Root.Elements(table))
                    {
                        BusinessObject bizo = BusinessObjectFactory.BuildBusinessObject(table);
                        // validate against existing
                        if (bizo is Protocol && validateFields.Length > 0 && !existingProtocolId.HasValue)
                        {
                            var queryFields = validateFields.ToDictionary(f => f, f => (object)xTableData.Element(f).Value);
                            bool exists = BusinessObject.Exists(table, queryFields);
                            if (exists)
                            {
                                string message = string.Join(" | ", queryFields.Select(a => a.Key.ToUpper() + "=" + a.Value).ToArray());
                                error = "Protocol already exists. " + message;
                                return null;
                            }
                        }

                        int xPriKey = int.Parse(xTableData.Element(priKeyField).Value);
                        // set non-key fields

                        nonKeyFields.ForEach(f =>
                        {
                            var xData = xTableData.Element(f);
                            if (xData != null)
                                bizo[f] = xData.Value;
                        });
                        foreignKeyFields.ForEach(f =>
                        {
                            int xFK = int.Parse(xTableData.Element(f).Value);
                            var tables = map.Where(m => BusinessObject.GetPrimaryKeyName(m.Key) == f);
                            if (tables.Count() > 0)
                            {
                                int fk = tables.First().Value[xFK];
                                bizo[f] = fk;
                            }
                        });

                        /* DEBUG
                        if (bizo is Protocol)
                        {
                            bizo[Protocol.ProtocolTitle] = bizo[Protocol.ProtocolTitle] + ": IMPORTED";
                        }
                         */

                        // save
                        if (!bizo.IsEmpty)
                        {
                            int priKey = -1;
                            // TODO: optimize this step
                            // load existing
                            if (bizo is Protocol && existingProtocolId.HasValue)
                            {
                                bizo = new Protocol();
                                bizo.Get(existingProtocolId.Value);
                                // update pri key
                                priKey = existingProtocolId.Value;
                            }
                            // create new
                            else
                            {
                                bizo.Save();
                                // get new pri key
                                priKey = (int)bizo[priKeyField];
                            }
                            // update lookup table
                            bizos.Add(bizo);
                            lookup.Add(xPriKey, priKey);
                        }
                        else if (bizo is Protocol)
                        {
                            break;
                        }
                    }
                }

                //}
                // DEBUG: remove all records
                /*
                map.Reverse().ForEach(t =>
                         t.Value.Values.ForEach(pk =>
                               BusinessObjectFactory.BuildBusinessObject(t.Key).Delete(pk)));
                */
                error = "";
                return bizos;
            }



        }

        /// <summary>
        /// A utility class for generating strongly typed objects
        /// </summary>
        internal class ProtocolXSDServices
        {
            private static readonly string FORMAT_ENUMERABLE_CLASSNAME = "System.Collections.Generic.List<{0}>";

            static readonly string[] REQUIRED_NAMESPACES = new string[]
            {
                "System",
                "System.Runtime.Serialization",
                "System.Xml",
                //"System.Xml.Serialization",
                //"System.Collections.ObjectModel"
            };

            // code generator and code provider
            private CodeDomProvider csProvider;
            // source code
            private string sourceCode;
            // compiled assembly
            private Assembly assembly;

            private ProtocolMgmtServices service;

            public ProtocolXSDServices(ProtocolMgmtServices service)
            {
                csProvider = CodeDomProvider.CreateProvider("CSharp");
                this.service = service;
            }

            public XDocument GetPatientProtocolXSD()
            {
                List<string> tableNames = ProtocolMgmtServices.GetPatientTableNames();

                string sourceCode = GetPatientProtocolSourceCode(tableNames);

                Assembly assembly = GetPatientProtocolAssembly(sourceCode);

                // XSD: generate XSD for a list of patients
                string eclass = ProtocolMgmtServices.GetEnumerableClassName("Patients");
                Type patientArrayType = assembly.GetType("Caisis.Serialization." + eclass);
                //Type patientArrayType = assembly.GetType("Caisis.Serialization.Patient[]");
                var soapReflectionImporter = new SoapReflectionImporter();
                var xmlSchemas = new XmlSchemas();
                var xmlSchema = new XmlSchema();
                xmlSchemas.Add(xmlSchema);
                var xmlSchemaExporter = new XmlSchemaExporter(xmlSchemas);

                Type[] exportTypes = new Type[] { patientArrayType };
                //Type[] exportTypes = assembly.GetTypes();
                foreach (Type type in exportTypes)
                {
                    var xmlTypeMapping = soapReflectionImporter.ImportTypeMapping(type);
                    xmlSchemaExporter.ExportTypeMapping(xmlTypeMapping);
                }

                // var exporter = new System.Runtime.Serialization.XsdDataContractExporter();

                XDocument patientsXSD = new XDocument();
                XmlWriter patientsXSDWriter = patientsXSD.CreateWriter();
                var assemblies = new Assembly[] { assembly };
                //if (exporter.CanExport(patientArrayType))
                //{
                //    exporter.Export(patientArrayType);
                //    XmlSchemaSet mySchemas = exporter.Schemas;

                //    XmlQualifiedName XmlNameValue = exporter.GetRootElementName(patientArrayType);
                //    string patientsNS = XmlNameValue.Namespace;

                //    foreach (XmlSchema schema in mySchemas.Schemas(patientsNS))
                //    {
                //        // cleanup
                //        var elements = schema.Elements.Values.Cast<System.Xml.Schema.XmlSchemaElement>();
                //        foreach (var element in elements)
                //        {
                //            //get the Complex type of the element
                //            XmlSchemaComplexType custType =
                //                (XmlSchemaComplexType)element.ElementType;
                //            XmlSchemaSequence seq =
                //                (XmlSchemaSequence)custType.Particle;
                //            //seq.Items.Add(phoneElem);

                //            element.IsNillable = false;
                //        }

                //        schema.Write(patientsXSDWriter);
                //    }

                //    // cleanup
                //    patientsXSDWriter.Close();

                //    //var allNodes = patientsXSD.Descendants();
                //    //Dictionary<string, string> nullableAttributes = new Dictionary<string, string>
                //    //{
                //    //   { "nillable", "true" },
                //    //   { "minOccurs", "0" },
                //    //   { "maxOccurs", "1" }
                //    //};
                //    //Dictionary<string, string> nonNullableAttributes = new Dictionary<string, string>
                //    //{
                //    //   { "nillable", "false" },
                //    //   { "minOccurs", "1" },
                //    //   { "maxOccurs", "1" }
                //    //};
                //    ////var sequences = allNodes.Where(n => n.Name.LocalName == "sequence");
                //    ////foreach (var sequence in sequences)
                //    ////{
                //    ////    sequence = "all";
                //    ////}
                //    //foreach (string table in tableNames)
                //    //{
                //    //    string className = ProtocolMgmtServices.GetClassName(table);
                //    //    var fieldTypes = service.GetFieldNames(table);

                //    //    var xTables = allNodes.Where(n => n.Name.LocalName == "complexType" && n.Attribute("name").Value == className);
                //    //    foreach (var xTable in xTables)
                //    //    {
                //    //        var intFields = xTable.Descendants().Where(n => n.Name.LocalName == "element" && n.Attribute("type").Value == "xs:int");
                //    //        // normalize attribute on int fields (i.e., nullable vs non-nullable)
                //    //        foreach (var field in intFields)
                //    //        {
                //    //            string fieldName = field.Attribute("name").Value;
                //    //            if (fieldTypes.ContainsKey(fieldName))
                //    //            {
                //    //                var type = fieldTypes[fieldName];
                //    //                bool isNullable = type.IsGenericType && type.GetGenericTypeDefinition().Equals(typeof(Nullable<>));
                //    //                var attributeList = isNullable ? nullableAttributes : nonNullableAttributes;

                //    //                foreach (var a in attributeList)
                //    //                {
                //    //                    if (field.Attribute(a.Key) != null)
                //    //                        field.Attribute(a.Key).Value = a.Value;
                //    //                    else
                //    //                        field.Add(new XAttribute(a.Key, a.Value));
                //    //                }
                //    //            }
                //    //        }
                //    //    }
                //    //}
                //    // return XSD
                //    //return patientsXSD;
                //}

                MemoryStream msXSD = new MemoryStream();
                StreamWriter msXSDWriter = new StreamWriter(msXSD);
                xmlSchema.Write(msXSDWriter);

                msXSDWriter.Flush();
                msXSD.Position = 0;
                StreamReader msXSDReader = new StreamReader(msXSD);
                string msXSDOutput = msXSDReader.ReadToEnd();

                msXSDWriter.Close();
                msXSDReader.Close();

                XDocument patientProtocolSchema = XDocument.Parse(msXSDOutput);

                var allNodes = patientProtocolSchema.Descendants();
                /* TODO */
                Dictionary<string, string> nullableAttributes = new Dictionary<string, string>
                    {
                       { "nillable", "true" },
                       { "minOccurs", "0" },
                       { "maxOccurs", "1" }
                    };
                Dictionary<string, string> nonNullableAttributes = new Dictionary<string, string>
                    {
                       { "nillable", "false" },
                       { "minOccurs", "1" },
                       { "maxOccurs", "1" }
                    };
                // noormalize: table
                // ArrayOfPatients -> Patients, etc...
                foreach (string table in tableNames)
                {
                    string className = ProtocolMgmtServices.GetClassName(table);
                    string listClassName = ProtocolMgmtServices.GetEnumerableClassName(table);

                    var nodesOfType = allNodes.Where(n => n.Attribute("type") != null && n.Attribute("type").Value == "ArrayOf" + className);
                    var nodesOfName = allNodes.Where(n => n.Attribute("name") != null && n.Attribute("name").Value == "ArrayOf" + className);
                    foreach (var node in nodesOfType)
                    {
                        node.Attribute("type").Value = listClassName;
                    }
                    foreach (var node in nodesOfName)
                    {
                        node.Attribute("name").Value = listClassName;
                    }
                    var nodesOfNameAndType = allNodes.Where(n => n.Attribute("type") != null && n.Attribute("type").Value == listClassName && n.Attribute("name") != null && n.Attribute("name").Value == listClassName);
                    // require enumerable memebers to be declared
                    // Patient -> LabTests, Encounters, Surveys, etc...
                    foreach (var node in nodesOfNameAndType)
                    {
                        foreach (var a in nonNullableAttributes)
                        {
                            if (node.Attribute(a.Key) != null)
                                node.Attribute(a.Key).Value = a.Value;
                            //else
                            //    node.Add(new XAttribute(a.Key, a.Value));
                        }
                    }



                    //msXSDOutput = msXSDOutput.Replace("\"ArrayOf" + className + "\"", "\"" + listClassName + "\"").Replace("_Field", "");
                    //// cleanup field
                    //foreach (var fieldToType in service.GetFieldNames(table))
                    //{
                    //    string field = fieldToType.Key;
                    //    Type fieldType = fieldToType.Value;
                    //    if (fieldType == typeof(int?) || fieldType == typeof(DateTime?))
                    //    {
                    //        msXSDOutput = msXSDOutput.Replace("maxOccurs=\"1\" minOccurs=\"1\"", "maxOccurs=\"1\" minOccurs=\"0\"");//"name=\"" + field + "\" type=\"xs:int\" xsi:nil=\"true\"");//"name=\"" + field + "\" maxOccurs=\"1\" minOccurs=\"1\"", "name=\"" + field + "\" maxOccurs=\"1\" minOccurs=\"1\" xsi:nil=\"true\"");
                    //    }
                    //}
                }
                // normalize: field
                // LabTest_Field -> LabTest
                var fieldNodes = allNodes.Where(n => n.Attribute("name") != null && n.Attribute("name").Value.EndsWith("_Field"));
                foreach (var node in fieldNodes)
                    node.Attribute("name").Value = node.Attribute("name").Value.Trim("_Field".ToCharArray());


                //msXSDOutput = msXSDOutput.Replace("xmlns:xs=\"http://www.w3.org/2001/XMLSchema\"", "xmlns:xs=\"http://www.w3.org/2001/XMLSchema\" elementFormDefault=\"qualified\"");


                //var sequences = allNodes.Where(n => n.Name.LocalName == "sequence");
                //foreach (var sequence in sequences)
                //{
                //    sequence = "all";
                //}
                foreach (string table in tableNames)
                {
                    string className = ProtocolMgmtServices.GetClassName(table);
                    var fieldTypes = service.GetFieldNames(table);

                    var xTables = allNodes.Where(n => n.Name.LocalName == "complexType" && n.Attribute("name").Value == className);
                    foreach (var xTable in xTables)
                    {
                        var nullableFields = xTable.Descendants().Where(n => n.Name.LocalName == "element" && (n.Attribute("type").Value == "xs:int" || n.Attribute("type").Value == "xs:boolean"));
                        // normalize attribute on int fields (i.e., nullable vs non-nullable)
                        foreach (var field in nullableFields)
                        {
                            string fieldName = field.Attribute("name").Value;
                            if (fieldTypes.ContainsKey(fieldName))
                            {
                                var type = fieldTypes[fieldName];
                                bool isNullable = type.IsGenericType && type.GetGenericTypeDefinition().Equals(typeof(Nullable<>));
                                var attributeList = isNullable ? nullableAttributes : nonNullableAttributes;

                                foreach (var a in attributeList)
                                {
                                    if (field.Attribute(a.Key) != null)
                                        field.Attribute(a.Key).Value = a.Value;
                                    else
                                        field.Add(new XAttribute(a.Key, a.Value));
                                }
                            }
                        }
                    }
                }

                return patientProtocolSchema;
            }

            public string GetPatientProtocolSourceCode(IEnumerable<string> tableNames)
            {
                if (!string.IsNullOrEmpty(sourceCode))
                    return sourceCode;

                //text writer to write the code
                StringWriter sw = new StringWriter();

                //code generator and code provider
                csProvider = CodeDomProvider.CreateProvider("CSharp");

                // namespace declaration
                CodeNamespace caisisSerializtionNamespace = new CodeNamespace("Caisis.Serialization");

                // add required
                foreach (string ns in REQUIRED_NAMESPACES)
                {
                    caisisSerializtionNamespace.Imports.Add(new CodeNamespaceImport(ns));
                }

                Dictionary<string, CodeTypeDeclaration> tableToType = new Dictionary<string, CodeTypeDeclaration>();

                // iternator
                foreach (string tableName in tableNames)
                {
                    //string tableClassName = string.Format(FORMAT_CLASS_NAME, tableName);
                    string tableClassName = ProtocolMgmtServices.GetClassName(tableName);

                    // class declaration
                    CodeTypeDeclaration serializeClass = new CodeTypeDeclaration(tableClassName);
                    caisisSerializtionNamespace.Types.Add(serializeClass);
                    serializeClass.IsClass = true;
                    // mark class as serializeable
                    serializeClass.CustomAttributes.Add(new CodeAttributeDeclaration("DataContract", new CodeAttributeArgument("Namespace", new CodePrimitiveExpression(XSD_NAMESPACE))));
                    CodeAttributeDeclaration serializeClassNS = new CodeAttributeDeclaration(
  new CodeTypeReference(typeof(System.Xml.Serialization.XmlRootAttribute)),
  new CodeAttributeArgument(new CodePrimitiveExpression(tableName)), new CodeAttributeArgument("Namespace", new CodePrimitiveExpression("")));
                    serializeClass.CustomAttributes.Add(serializeClassNS);


                    tableToType.Add(tableName, serializeClass);

                    // list<T>
                    string enumClassName = ProtocolMgmtServices.GetEnumerableClassName(tableName);
                    CodeTypeDeclaration listClass = new CodeTypeDeclaration(enumClassName);
                    listClass.IsClass = true;
                    listClass.BaseTypes.Add(string.Format(FORMAT_ENUMERABLE_CLASSNAME, tableClassName));
                    caisisSerializtionNamespace.Types.Add(listClass);

                    CodeConstructor listConstructor = new CodeConstructor();
                    listConstructor.Attributes = MemberAttributes.Public;
                    listClass.Members.Add(listConstructor);

                    // mark as serializable
                    //listClass.CustomAttributes.Add(new CodeAttributeDeclaration("DataContract"));
                    listClass.CustomAttributes.Add(new CodeAttributeDeclaration("CollectionDataContract", new CodeAttributeArgument("Namespace", new CodePrimitiveExpression(XSD_NAMESPACE))));//, new CodeAttributeArgument("Namespace", new CodePrimitiveExpression("www.caisis.org"))));
                    //listClass.CustomAttributes.Add(new CodeAttributeDeclaration(new CodeTypeReference(typeof(System.Xml.Serialization.XmlAttributeAttribute)), new CodeAttributeArgument("Form", new CodePrimitiveExpression(System.Xml.Schema.XmlSchemaForm.Unqualified))));
                    // XML attribute: mark collection as having type
                    CodeAttributeDeclaration xmlNameAttribute = new CodeAttributeDeclaration(
                      new CodeTypeReference(typeof(System.Xml.Serialization.XmlRootAttribute)),
                      new CodeAttributeArgument(new CodePrimitiveExpression(enumClassName)), new CodeAttributeArgument("Namespace", new CodePrimitiveExpression("")));
                    listClass.CustomAttributes.Add(xmlNameAttribute);


                    // class constructor
                    /*
                    CodeConstructor cc = new CodeConstructor();
                    cc.Attributes = MemberAttributes.Public;
                    //cc.Statements.Add(mi1);
                    serializeClass.Members.Add(cc);
                    */

                    // ADD FIELDS/MEMBERS                             
                    var fieldMap = service.GetFieldNames(tableName);

                    foreach (var field in fieldMap)
                    {
                        string fieldName = field.Key;
                        Type dbFieldType = field.Value;
                        string memberName = fieldName;
                        Type fieldType = typeof(String);
                        bool isNullable = dbFieldType.IsGenericType && dbFieldType.GetGenericTypeDefinition().Equals(typeof(Nullable<>));
                        // nullable types
                        //if (isNullable)
                        //{
                        //    fieldType = typeof(String);
                        //}
                        //// special case                       
                        //else if (fieldType == typeof(DateTime) || fieldType == typeof(int))
                        //{
                        //    fieldType = typeof(int);
                        //}
                        fieldType = dbFieldType;
                        if (fieldType == typeof(DateTime))
                        {
                            fieldType = typeof(int);
                        }
                        else if (fieldType == typeof(DateTime?))
                        {
                            fieldType = typeof(int?);
                        }


                        if (memberName == tableClassName)
                        {
                            memberName = fieldName + "_Field";
                        }


                        // create members
                        CodeMemberField fieldMember = new CodeMemberField(fieldType, memberName);
                        fieldMember.Attributes = MemberAttributes.Public;

                        // mark member as serializeable
                        fieldMember.CustomAttributes.Add(new CodeAttributeDeclaration("DataMember"));
                        serializeClass.Members.Add(fieldMember);

                        // field name avoids class collision, but serialize/de-serialize to XmlRoot name
                        // i.e.,
                        // [XmlRoot("LabTest")]
                        // public string LabTest_Field
                        fieldMember.CustomAttributes.Add(new CodeAttributeDeclaration(
                           new CodeTypeReference(typeof(System.Xml.Serialization.XmlElementAttribute)),
                           new CodeAttributeArgument(new CodePrimitiveExpression(fieldName))));

                        //if (isNullable)
                        {
                            //             fieldMember.CustomAttributes.Add(
                            //new CodeAttributeDeclaration(
                            //"System.Xml.Serialization.XmlElement",
                            //new CodeAttributeArgument(
                            //"Form",
                            //new CodeFieldReferenceExpression(new CodeTypeReferenceExpression("System.Xml.Schema.XmlSchemaForm"), "Unqualified")),
                            //new CodeAttributeArgument(
                            //"IsNullable",
                            //new CodePrimitiveExpression(true))));

                            fieldMember.CustomAttributes.Add(new CodeAttributeDeclaration(
                           new CodeTypeReference(typeof(System.Xml.Serialization.XmlElementAttribute)),
                           new CodeAttributeArgument("IsNullable", new CodePrimitiveExpression(isNullable))));
                            if (fieldType == typeof(int))
                            {
                                fieldMember.Attributes = MemberAttributes.Public;
                                // i.e., public LabTests LabTests = new LabTests();
                                fieldMember.InitExpression = new CodeFieldReferenceExpression(new CodeTypeReferenceExpression("System.Int32"), "MinValue");
                            }
                        }
                    }

                }

                // dynamically add nesting
                foreach (string tableName in tableToType.Keys)
                {
                    CodeTypeDeclaration type = tableToType[tableName];
                    // build children
                    var childTableNames = BusinessObject.GetChildTableNames(tableName).Intersect(tableNames);
                    foreach (string childTableName in childTableNames)
                    {
                        var childType = tableToType[childTableName];
                        //string childTableType = string.Format("{0}[]", childType.Name);
                        //string childTableListName = string.Format(FORMAT_LIST_NAME, childTableName);
                        string childTableListName = ProtocolMgmtServices.GetClassName(childTableName);
                        string enumClassName = ProtocolMgmtServices.GetEnumerableClassName(childTableName);
                        string childTableType = string.Format(FORMAT_ENUMERABLE_CLASSNAME, childTableListName);

                        // create members
                        // i.e., public LabTests LabTests;
                        CodeMemberField fieldMember = new CodeMemberField(enumClassName, enumClassName);
                        fieldMember.Attributes = MemberAttributes.Public;
                        // i.e., public LabTests LabTests = new LabTests();
                        fieldMember.InitExpression = new CodeTypeReferenceExpression("new " + enumClassName + "()");

                        // attribute: DataMember                    
                        CodeAttributeDeclaration dataMemberAttribute = new CodeAttributeDeclaration("DataMember");
                        fieldMember.CustomAttributes.Add(dataMemberAttribute);

                        type.Members.Add(fieldMember);
                    }

                }


                // gen code
                csProvider.GenerateCodeFromNamespace(caisisSerializtionNamespace, sw, null);
                // get output code
                sourceCode = sw.ToString();
                // cleanup               
                sw.Close();

                return sourceCode;
            }

            public Assembly GetPatientProtocolAssembly(string sourceCode)
            {
                if (assembly != null)
                    return assembly;

                CompilerParameters fileParams = new CompilerParameters();
                // add required referenced assemblies
                foreach (string ns in REQUIRED_NAMESPACES)
                    fileParams.ReferencedAssemblies.Add(ns + ".dll");
                fileParams.GenerateInMemory = true;
                fileParams.GenerateExecutable = false;
                fileParams.IncludeDebugInformation = false;
                fileParams.WarningLevel = 3;
                fileParams.TreatWarningsAsErrors = false;
                fileParams.CompilerOptions = "/optimize";
                //fileParams.OutputAssembly = OUTPUT_DLL_NAME;
                //fileParams.TempFiles = new TempFileCollection(OUTPUT_TEMP_PATH, false);
                CompilerResults compileFileResult = csProvider.CompileAssemblyFromSource(fileParams, sourceCode);
                assembly = compileFileResult.CompiledAssembly;
                return assembly;
            }

        }

        /// <summary>
        /// Returns a list of special tables and distinct values, based on current exportable patients.
        /// </summary>
        /// <param name="datasetSQL"></param>
        /// <param name="protocolId"></param>
        /// <param name="unmaskDates"></param>
        /// <returns></returns>
        public static Dictionary<string, List<string>> GetDataExportFilters(string datasetSQL, int protocolId, bool unmaskDates)
        {
            datasetSQL = GetEligibleProtocolExportPatientsSQL(datasetSQL, protocolId, unmaskDates);
            Dictionary<string, string> tableFields = new Dictionary<string, string>
            {
                { "LabTests", "LabTest" },
                { "Diagnostics", "DxType" },
                { "Procedures", "ProcName" },
                { "Pathology", "PathSpecimenType" }
            };
            List<string> sqlBuffer = new List<string>();
            Dictionary<string, List<string>> values = new Dictionary<string, List<string>>();
            // build sql + entries
            foreach (var pair in tableFields)
            {
                string table = pair.Key;
                string field = pair.Value;
                values.Add(table, new List<string>());
                sqlBuffer.Add(string.Format("SELECT DISTINCT '{0}' AS [Table], {1} AS [Value] FROM {0} a INNER JOIN ({2}) b on a.PatientId = b.PatientId", table, field, datasetSQL));
            }
            string sql = string.Format("SELECT DISTINCT [Table],[Value] FROM ({0}) a ORDER BY [Table] ASC, [Value] ASC", string.Join(" UNION ", sqlBuffer.ToArray()));
            SqlCommand com = DataAccessHelper.CreateSqlCommand(sql);
            DataTable records = DataAccessHelper.GetList(com).Tables[0];
            var data = from record in records.AsEnumerable()
                       group record by record["Table"].ToString() into g
                       select new
                       {
                           Table = g.Key,
                           Values = g.Select(r => r["Value"].ToString())
                       };
            foreach (var pair in data)
                values[pair.Table].AddRange(pair.Values);
            return values;
        }

    }
}
