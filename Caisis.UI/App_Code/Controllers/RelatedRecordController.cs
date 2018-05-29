using System;
using System.Data;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Xml;

using Caisis.BOL;
using Caisis.DataAccess;

namespace Caisis.Controller
{
    /// <summary>
    /// Summary description for RelatedRecordController
    /// </summary>
    public class RelatedRecordController
    {

        /// <summary>
        /// The metadata attribute used for marking a table to used related record utilities
        /// </summary>
        public static readonly string RELATED_RECORDS_UTILITY_TABLE_ATTRIBUTE = "RelatedRecordUtility";

        /// <summary>
        /// The metadata attribute used for mapping realtable tables
        /// </summary>
        public static readonly string RELATED_RECORDS_TABLE_ATTRIBUTE = "RelatedRecordTable";
        
        /// <summary>
        /// The metadata attribute used for the main related record field
        /// </summary>
        public static readonly string RELATED_RECORDS_FIELD_ATTRIBUTE = "RelatedRecordField";
        
        /// <summary>
        /// The name of source system representing the Caisis database
        /// </summary>
        public static string SOURCE_SYSTEM = "Caisis";

        private PatientDataEntryController pdec;

        public RelatedRecordController()
        {
            pdec = new PatientDataEntryController();
        }

        #region Metadata Table and Fields


        public IEnumerable<string> GetRelatedRecordUtilityTables()
        {
            var dataEntryForms = pdec.GetDataEntryForms();
            var relatedTables = pdec.GetTablesByAttribute(RELATED_RECORDS_UTILITY_TABLE_ATTRIBUTE, true.ToString()).Intersect(dataEntryForms);
            return relatedTables;
        }

        /// <summary>
        /// Returns a list of Related Record tables marked via metadata
        /// </summary>
        /// <returns></returns>
        public IEnumerable<string> GetRelatedRecordTables()
        {
            var dataEntryForms = pdec.GetDataEntryForms();
            var relatedTables = pdec.GetTablesByAttribute(RELATED_RECORDS_TABLE_ATTRIBUTE, true.ToString()).Intersect(dataEntryForms);
            return relatedTables;
        }

        /// <summary>
        /// Returns a lookup of tables which are used for relating records (tableName = > tableLabel).
        /// </summary>
        /// <returns></returns>
        public IDictionary<string, string> GetRelatedRecordTablesAndLabels()
        {
            return pdec.GetDataEntryFormLabels(GetRelatedRecordTables());
        }

        /// <summary>
        /// Returns the displayable field for the related records table.
        /// </summary>
        /// <param name="tableName"></param>
        /// <returns></returns>
        public string GetRelatedRecordField(string tableName)
        {
            string relatedFieldName = string.Empty;
            var relatedFields = pdec.GetFieldsByAttribute(tableName, RELATED_RECORDS_FIELD_ATTRIBUTE, true.ToString());
            if( relatedFields.Count() > 0)
            {
                string rField = relatedFields.First();
                // validate field
                if (BOL.BusinessObject.HasField(tableName, rField))
                {
                    relatedFieldName = rField;
                }
            } 
            return relatedFieldName;
        }

        /// <summary>
        /// Gets the sort column for the related table
        /// </summary>
        /// <param name="tableName"></param>
        /// <returns></returns>
        public string GetRelatedSortColumn(string tableName)
        {
            // locate first date field ???
            var datefields = from col in BOL.BusinessObject.GetFieldNames(tableName)
                             where col.EndsWith("Date")
                             select col;
            return datefields.Count() > 0 ? datefields.First() : string.Empty;
        }

        #endregion

        #region GET RECORDS

        public DataView GetRelatedRecordsByTableAndKey(int patientId, string destTableName, int destTablePriKey)
        {
            return GetRelatedRecordsByTableAndKey(patientId, destTableName, destTablePriKey, GetRelatedRecordTables());
        }

        public DataView GetRelatedRecordsByTableAndKey(int patientId, string destTableName, int destTablePriKey, IEnumerable<string> relatedTableNames)
        {
            var relatedTablesAndLabels = pdec.GetDataEntryFormLabels(relatedTableNames);
            string destTablePriKeyName = BOL.BusinessObject.GetPrimaryKeyName(destTableName);
            //var relatedRecords = RelatedRecordController.GetRelatedRecords(tableName, int.Parse(primaryKey));
            var distinctTables = from table in relatedTablesAndLabels
                                 let srcTable = table.Key
                                 let dateColumn = GetRelatedSortColumn(srcTable)
                                 select new
                                 {
                                     SrcTableName = srcTable,
                                     SrcTablePriKeyName = BOL.BusinessObject.GetPrimaryKeyName(srcTable),
                                     SrcTableDisplayColumn = GetRelatedRecordField(srcTable),
                                     SrcTableSortField = dateColumn
                                 };
            var srcTableLookup = distinctTables.ToDictionary(a => new KeyValuePair<string, string>(a.SrcTableName, a.SrcTablePriKeyName), a => new KeyValuePair<string, string>(a.SrcTableDisplayColumn, a.SrcTableSortField));
            DataTable relatedRecordsByTable = Caisis.DataAccess.RelatedRecordsDa.GetRelatedRecordsByTableAndKey(patientId, destTableName, destTablePriKeyName, destTablePriKey, srcTableLookup);
            DataView relatedRecords = relatedRecordsByTable.DefaultView;
            relatedRecords.Sort = "SrcTableSortField ASC";

            return relatedRecords;
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="srcTableName"></param>
        /// <param name="srcPriKey"></param>
        /// <returns></returns>
        public static IEnumerable<RelatedRecord> GetRelatedRecords(string srcTableName, int srcPriKey)
        {
            Dictionary<string, object> fieldsAndValues = new Dictionary<string, object>
            {
                { RelatedRecord.SrcTableName , srcTableName},
                { RelatedRecord.SrcPrimaryKey, srcPriKey},
                { RelatedRecord.SrcSystem, SOURCE_SYSTEM}
            };
            return GetRelatedRecords(fieldsAndValues);
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="srcTableName"></param>
        /// <param name="srcPriKey"></param>
        /// <param name="destTableName"></param>
        /// <returns></returns>
        public static IEnumerable<RelatedRecord> GetRelatedRecords(string srcTableName, int srcPriKey, string destTableName)
        {
            Dictionary<string, object> fieldsAndValues = new Dictionary<string, object>
            {
                { RelatedRecord.SrcTableName , srcTableName},
                { RelatedRecord.SrcPrimaryKey, srcPriKey},
                { RelatedRecord.DestTableName , destTableName},
                { RelatedRecord.SrcSystem, SOURCE_SYSTEM}
            };
            return GetRelatedRecords(fieldsAndValues);
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="srcTableName"></param>
        /// <param name="destTableName"></param>
        /// <param name="destPriKey"></param>
        /// <returns></returns>
        public static IEnumerable<RelatedRecord> GetRelatedRecordsByDest(string srcTableName, string destTableName, int destPriKey)
        {
            Dictionary<string, object> fieldsAndValues = new Dictionary<string, object>
            {
                { RelatedRecord.SrcTableName , srcTableName},
                { RelatedRecord.DestTableName , destTableName},
                { RelatedRecord.DestPrimaryKey, destPriKey},
                { RelatedRecord.SrcSystem, SOURCE_SYSTEM}
            };
            return GetRelatedRecords(fieldsAndValues);
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="srcTableName"></param>
        /// <param name="srcPriKey"></param>
        /// <param name="destTableName"></param>
        /// <param name="destPriKey"></param>
        /// <returns></returns>
        public static IEnumerable<RelatedRecord> GetRelatedRecords(string srcTableName, int srcPriKey, string destTableName, int destPriKey)
        {
            return GetRelatedRecords(SOURCE_SYSTEM, srcTableName, srcPriKey, destTableName, destPriKey);
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="srcSystem"></param>
        /// <param name="srcTableName"></param>
        /// <param name="srcPriKey"></param>
        /// <param name="destTableName"></param>
        /// <param name="destPriKey"></param>
        /// <returns></returns>
        public static IEnumerable<RelatedRecord> GetRelatedRecords(string srcSystem, string srcTableName, int srcPriKey, string destTableName, int destPriKey)
        {
            Dictionary<string, object> fieldsAndValues = new Dictionary<string, object>
            {
                { RelatedRecord.SrcTableName , srcTableName},
                { RelatedRecord.SrcPrimaryKey, srcPriKey},
                { RelatedRecord.DestTableName , destTableName},
                { RelatedRecord.DestPrimaryKey, destPriKey},
                { RelatedRecord.SrcSystem, srcSystem}
            };
            return GetRelatedRecords(fieldsAndValues);
        }

        /// <summary>
        /// Returns a list of BizObject of type T related to the source BizObject within Caisis.
        /// </summary>
        /// <typeparam name="T"></typeparam>
        /// <param name="source"></param>
        /// <returns></returns>
        public static IEnumerable<T> GetRelatedRecordsBySource<T>(IBusinessObject source)
            where T : BusinessObject, IBusinessObject, new()
        {
            var relatedRecords = GetRelatedRecords(source.TableName, (int)source[source.PrimaryKeyName], new T().TableName);
            return GetRelatedBizObjects<T>(relatedRecords, RelatedRecord.DestTableName, RelatedRecord.DestPrimaryKey);
        }

        /// <summary>
        /// Returns a list of BizObject of type T related to the source BizObject within Caisis.
        /// </summary>
        /// <typeparam name="T"></typeparam>
        /// <param name="destination"></param>
        /// <returns></returns>
        public static IEnumerable<T> GetRelatedRecordsByDestination<T>(IBusinessObject destination)
           where T : BusinessObject, IBusinessObject, new()
        {
            var relatedRecords = GetRelatedRecordsByDest(new T().TableName, destination.TableName, (int)destination[destination.PrimaryKeyName]);
            return GetRelatedBizObjects<T>(relatedRecords, RelatedRecord.SrcTableName, RelatedRecord.SrcPrimaryKey);
        }

        /// <summary>
        /// For the given list of RelatedRecords, load the relevent related BizObjects by type
        /// </summary>
        /// <typeparam name="T"></typeparam>
        /// <param name="relatedRecords"></param>
        /// <param name="keyField"></param>
        /// <returns></returns>
        public static IEnumerable<T> GetRelatedBizObjects<T>(IEnumerable<RelatedRecord> relatedRecords, string tableNameField, string tableKeyField)
            where T : BusinessObject, IBusinessObject, new()
        {
            // get keys by target table: i.e., SELECT LabTestId WHERE LabTests is DestTableName
            string targetTable = new T().TableName;
            var targetPriKeys = relatedRecords.Where(r => r[tableNameField].ToString() == targetTable).Select(r => int.Parse(r[tableKeyField].ToString())).Distinct();
            List<T> bizos = new List<T>();
            foreach (var priKey in targetPriKeys)
            {
                var bizo = new T();
                bizo.Get(priKey);
                if (!bizo.IsEmpty)
                {
                    bizos.Add(bizo);
                }
            }
            return bizos;
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="fieldsAndValues"></param>
        /// <returns></returns>
        private static IEnumerable<RelatedRecord> GetRelatedRecords(Dictionary<string, object> fieldsAndValues)
        {
            return RelatedRecord.GetByFields<RelatedRecord>(fieldsAndValues);
        }

        #endregion

        #region CHECK RECORDS

        /// <summary>
        /// 
        /// </summary>
        /// <param name="srcTableName"></param>
        /// <param name="srcPriKey"></param>
        /// <param name="destTableName"></param>
        /// <returns></returns>
        public static bool HasRelatedRecords(string srcTableName, int srcPriKey, string destTableName)
        {
            Dictionary<string, object> fieldsAndValues = new Dictionary<string, object>
            {
                { RelatedRecord.SrcTableName , srcTableName},
                { RelatedRecord.SrcPrimaryKey, srcPriKey},
                { RelatedRecord.DestTableName , destTableName},
                { RelatedRecord.SrcSystem, SOURCE_SYSTEM}
            };
            return HasRelatedRecords(fieldsAndValues);
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="srcTableName"></param>
        /// <param name="destTableName"></param>
        /// <param name="destPriKey"></param>
        /// <returns></returns>
        public static bool HasRelatedRecordsByDest(string srcTableName, string destTableName, int destPriKey)
        {
            Dictionary<string, object> fieldsAndValues = new Dictionary<string, object>
            {
                { RelatedRecord.SrcTableName , srcTableName},
                { RelatedRecord.DestTableName , destTableName},
                { RelatedRecord.DestPrimaryKey, destPriKey},
                { RelatedRecord.SrcSystem, SOURCE_SYSTEM}
            };
            return HasRelatedRecords(fieldsAndValues);
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="srcTableName"></param>
        /// <param name="srcPriKey"></param>
        /// <param name="destTableName"></param>
        /// <param name="destPriKey"></param>
        /// <returns></returns>
        public static bool HasRelatedRecords(string srcTableName, int srcPriKey, string destTableName, int destPriKey)
        {
            return HasRelatedRecords(SOURCE_SYSTEM, srcTableName, srcPriKey, destTableName, destPriKey);
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="srcSystem"></param>
        /// <param name="srcTableName"></param>
        /// <param name="srcPriKey"></param>
        /// <param name="destTableName"></param>
        /// <param name="destPriKey"></param>
        /// <returns></returns>
        public static bool HasRelatedRecords(string srcSystem, string srcTableName, int srcPriKey, string destTableName, int destPriKey)
        {
            Dictionary<string, object> fieldsAndValues = new Dictionary<string, object>
            {
                { RelatedRecord.SrcTableName , srcTableName},
                { RelatedRecord.SrcPrimaryKey, srcPriKey},                
                { RelatedRecord.DestTableName , destTableName},
                { RelatedRecord.DestPrimaryKey, destPriKey},
                { RelatedRecord.SrcSystem, srcSystem}
            };
            return HasRelatedRecords(fieldsAndValues);
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="fieldsAndValues"></param>
        /// <returns></returns>
        private static bool HasRelatedRecords(Dictionary<string, object> fieldsAndValues)
        {
            return RelatedRecord.Exists<RelatedRecord>(fieldsAndValues);
        }

        #endregion

        #region CREATE

        /// <summary>
        /// Creates a related record where source and destination tables are in Caisis.
        /// Does NOT check for previous records.
        /// </summary>
        /// <param name="source"></param>
        /// <param name="destination"></param>
        /// <returns></returns>
        public static RelatedRecord CreateRelatedRecord(IBusinessObject source, IBusinessObject destination)
        {
            return CreateRelatedRecord(SOURCE_SYSTEM, source.TableName, (int)source[source.PrimaryKeyName], destination.TableName, (int)destination[destination.PrimaryKeyName], false);
        }

        /// <summary>
        /// Creates a related record where source and destination tables are in Caisis. User for soft ties between Caisis Records.
        /// Does NOT check for previous records.
        /// </summary>
        /// <param name="srcTable"></param>
        /// <param name="srcPrimaryKey"></param>
        /// <param name="destTable"></param>
        /// <param name="destPriKey"></param>
        /// <returns></returns>
        public static RelatedRecord CreateRelatedRecord(string srcTable, int srcPrimaryKey, string destTable, int destPriKey)
        {
            return CreateRelatedRecord(SOURCE_SYSTEM, srcTable, srcPrimaryKey, destTable, destPriKey);
        }
               
        /// <summary>
        /// Creates a related record with the specified source system, in which Caisis is the destination table.
        /// Does NOT check for previous records.
        /// <param name="srcSystem"></param>
        /// <param name="srcTable"></param>
        /// <param name="srcPrimaryKey"></param>
        /// <param name="destTable"></param>
        /// <param name="destPriKey"></param>
        /// <returns></returns>
        public static RelatedRecord CreateRelatedRecord(string srcSystem, string srcTable, int srcPrimaryKey, string destTable, int destPriKey)
        {
            return CreateRelatedRecord(SOURCE_SYSTEM, srcTable, srcPrimaryKey, destTable, destPriKey, false);
        }
        
        /// <summary>
        /// Creates a related record with the specified source system, in which Caisis is the destination table and checks for existing records before inserting (if true).
        /// </summary>
        /// <param name="srcSystem"></param>
        /// <param name="srcTable"></param>
        /// <param name="srcPrimaryKey"></param>
        /// <param name="destTable"></param>
        /// <param name="destPriKey"></param>
        /// <param name="validateExisting"></param>
        /// <returns></returns>
        public static RelatedRecord CreateRelatedRecord(string srcSystem, string srcTable, int srcPrimaryKey, string destTable, int destPriKey, bool checkExisiting)
        {
            return CreateRelatedRecord(srcSystem, srcTable, srcPrimaryKey, destTable, destPriKey, null, checkExisiting);
        }

        /// <summary>
        /// Creates a related record with the specified source system, in which Caisis is the destination table and checks for existing records before inserting (if true).
        /// </summary>
        /// <param name="srcSystem"></param>
        /// <param name="srcTable"></param>
        /// <param name="srcPrimaryKey"></param>
        /// <param name="destTable"></param>
        /// <param name="destPriKey"></param>
        /// <param name="relationStrength"></param>
        /// <param name="checkExisiting"></param>
        /// <returns></returns>
        public static RelatedRecord CreateRelatedRecord(string srcSystem, string srcTable, int srcPrimaryKey, string destTable, int destPriKey, int? relationStrength, bool checkExisiting)
        {
            // validate exisiting record if needed, and return if found
            if (checkExisiting && HasRelatedRecords(srcSystem, srcTable, srcPrimaryKey, destTable, destPriKey))
            {
                return GetRelatedRecords(srcSystem, srcTable, srcPrimaryKey, destTable, destPriKey).First();
            }
            // otherwise, insert and return
            else
            {
                RelatedRecord relatedRecord = new RelatedRecord();
                relatedRecord[RelatedRecord.SrcTableName] = srcTable;
                relatedRecord[RelatedRecord.SrcPrimaryKey] = srcPrimaryKey;
                relatedRecord[RelatedRecord.DestTableName] = destTable;
                relatedRecord[RelatedRecord.DestPrimaryKey] = destPriKey;
                relatedRecord[RelatedRecord.SrcSystem] = srcSystem;
                if (relationStrength.HasValue)
                {
                    relatedRecord[RelatedRecord.RelationStrength] = relationStrength.Value;
                }
                relatedRecord.Save();

                return relatedRecord;
            }
        }

        #endregion

        /// <summary>
        /// Deletes related record(s) that matches the given source table, destination table, src primary key, and destination primary key
        /// Both source and destination tables must be in Caisis.
        /// </summary>
        /// <param name="srcTable"></param>
        /// <param name="srcPrimaryKey"></param>
        /// <param name="destTable"></param>
        /// <param name="destPriKey"></param>
        /// <returns></returns>
        public static void DeleteRelatedRecord(string srcTable, int srcPrimaryKey, string destTable, int destPriKey)
        {
            DeleteRelatedRecord(SOURCE_SYSTEM, srcTable, srcPrimaryKey, destTable, destPriKey);
        }

        /// <summary>
        /// Deletes related record with the specified source system, source table, src primary key, destination table, and destination primary key.
        /// </summary>
        /// <param name="srcSystem"></param>
        /// <param name="srcTable"></param>
        /// <param name="srcPrimaryKey"></param>
        /// <param name="destTable"></param>
        /// <param name="destPriKey"></param>
        /// <param name="validateExisting"></param>
        /// <returns></returns>
        public static void DeleteRelatedRecord(string srcSystem, string srcTable, int srcPrimaryKey, string destTable, int destPriKey)
        {
            // if related records found with specified parameters, delete each record
            if (HasRelatedRecords(srcSystem, srcTable, srcPrimaryKey, destTable, destPriKey))
            {
                var relatedRecords = GetRelatedRecords(srcSystem, srcTable, srcPrimaryKey, destTable, destPriKey);

                foreach (var record in relatedRecords) { record.Delete(); }
            }

        }

        #region EFORM

        /// <summary>
        /// Gets a list of SrcTable -> (SrcPriKey,RelationStrength) for the specificed eform record
        /// </summary>
        /// <param name="eformXML"></param>
        /// <param name="eformTableName"></param>
        /// <param name="eformRecordId"></param>
        /// <returns></returns>
        public Dictionary<string, Dictionary<int, int>> GetEformRelatedRecords(XmlDocument eformXML, string eformTableName, string eformRecordId)
        {
            var relatedXmlNodes = eformXML.SelectNodes("//" + eformTableName + "[@RecordId='" + eformRecordId + "']/RelatedRecords");//[@ScrTableName='" + srcTableName + "' and @SrcSystem='Caisis']/RelatedRecord");
            var lookup = from node in relatedXmlNodes.Cast<XmlNode>()
                         let srcTableName = node.Attributes["ScrTableName"].Value
                         let srcSystem = node.Attributes["SrcSystem"].Value
                         where srcSystem=="Caisis"
                         select new
                         {
                             SrcTableName = srcTableName,
                             RelatedRecords = from record in node.SelectNodes("RelatedRecord").Cast<XmlNode>()
                                              let srcPriKey = record["SrcPrimaryKey"].InnerText
                                              let strength = record["RelationStrength"].InnerText
                                              where !string.IsNullOrEmpty(srcPriKey) && !string.IsNullOrEmpty(strength)
                                              select new
                                              {
                                                  SrcPrimaryKey = int.Parse(srcPriKey),
                                                  RelationStrength = int.Parse(strength)
                                              }
                         };
            return lookup.ToDictionary(a => a.SrcTableName, a => a.RelatedRecords.ToDictionary(b => b.SrcPrimaryKey, b => b.RelationStrength));
        }

        /// <summary>
        /// For the specified eform record, insert/update/delete related records by SrcTable -> (SrcPriKey,RelationStrength)
        /// NOTE: null or empty relation strengths == delete relation.
        /// </summary>
        /// <param name="eformXML"></param>
        /// <param name="eformTableName"></param>
        /// <param name="eformRecordId"></param>
        /// <param name="sourceRelatedRecords"></param>
        public void UpdateEformRelatedRecords(XmlDocument eformXML, string eformTableName, string eformRecordId, Dictionary<string, Dictionary<int, string>> sourceRelatedRecords)
        {
            // get main record node
            var recordNode = eformXML.SelectSingleNode("//" + eformTableName + "[@RecordId='" + eformRecordId + "']");
            if (recordNode == null)
                return;
            // for each source table, check for existing related node, else create
            foreach (string sourceTable in sourceRelatedRecords.Keys)
            {
                var sourceTableKeysAndStrengths = sourceRelatedRecords[sourceTable];
                XmlNode node_RelatedRecords = recordNode.SelectSingleNode("RelatedRecords[@ScrTableName='" + sourceTable + "' and @SrcSystem='" + SOURCE_SYSTEM + "']");
                // check <RelatedRecords>
                if (node_RelatedRecords == null)
                {
                    node_RelatedRecords = eformXML.CreateElement("RelatedRecords");
                    XmlAttribute attribute_SrcTableName = eformXML.CreateAttribute("ScrTableName");
                    attribute_SrcTableName.Value = sourceTable;
                    XmlAttribute attribute_SrcSystem = eformXML.CreateAttribute("SrcSystem");
                    attribute_SrcSystem.Value = SOURCE_SYSTEM;
                    // insert main node
                    node_RelatedRecords.Attributes.Append(attribute_SrcTableName);
                    node_RelatedRecords.Attributes.Append(attribute_SrcSystem);
                    recordNode.AppendChild(node_RelatedRecords);
                }
                foreach (int srcPrimaryKey in sourceTableKeysAndStrengths.Keys)
                {
                    string strength = sourceTableKeysAndStrengths[srcPrimaryKey];
                    // check <RelatedRecord>
                    XmlNode node_RelatedRecord = node_RelatedRecords.SelectSingleNode("RelatedRecord[SrcPrimaryKey = '" + srcPrimaryKey + "' and RelationStrength]");
                    if (node_RelatedRecord == null)
                    {
                        // if there is no node and empty, no need to insert
                        if (string.IsNullOrEmpty(strength))
                            continue;
                        node_RelatedRecord = eformXML.CreateElement("RelatedRecord");
                        XmlNode node_SrcPrimaryKey = eformXML.CreateElement("SrcPrimaryKey");
                        node_SrcPrimaryKey.InnerText = srcPrimaryKey.ToString();
                        XmlNode node_RelationStrength = eformXML.CreateElement("RelationStrength");
                        node_RelationStrength.InnerText = strength;
                        node_RelatedRecord.AppendChild(node_SrcPrimaryKey);
                        node_RelatedRecord.AppendChild(node_RelationStrength);
                        node_RelatedRecords.AppendChild(node_RelatedRecord);
                    }
                    else
                    {
                        // update strenght for current record
                        if (!string.IsNullOrEmpty(strength))
                        {
                            // update strength
                            XmlNode node_RelatedRecord_RelationStrength = node_RelatedRecord["RelationStrength"];
                            node_RelatedRecord_RelationStrength.InnerText = strength;
                        }
                            // otherwise delete node with no strength
                        else
                        {
                            node_RelatedRecords.RemoveChild(node_RelatedRecord);
                        }
                    }
                }
            }
        }

        /// <summary>
        /// Appends DisplayValue and SortValue for related records in Eform
        /// </summary>
        /// <param name="eformXML"></param>
        public void AppendEformRelatedRecordValues(XmlDocument eformXML)
        {
            // create a map of related records in this eform
            XmlNodeList relatedRecords = eformXML.SelectNodes("//RelatedRecords[@ScrTableName and @SrcSystem='Caisis']");
            var map = from relatedNode in relatedRecords.Cast<XmlNode>()
                      let tableName = relatedNode.Attributes["ScrTableName"].Value
                      let priKeyName = BOL.BusinessObject.GetPrimaryKeyName(tableName)
                      let displayField = GetRelatedRecordField(tableName)
                      let sortField = GetRelatedSortColumn(tableName)
                      select new
                      {
                          TableName = tableName,
                          PriKeyName = priKeyName,
                          DisplayField = displayField,
                          SortField = sortField,
                          RelatedNodes = from recordNode in relatedNode.SelectNodes("RelatedRecord").Cast<XmlNode>()
                                         let priKey = int.Parse(recordNode["SrcPrimaryKey"].InnerText)
                                         select new
                                         {
                                             Node = recordNode,
                                             PriKey = priKey
                                         }
                      };
            // lookup of table name, key, display value and sort value
            var flatTableAndFields = from table in map
                                     group table by table.TableName into g
                                     select g.First();
            var tableAndRelevantFields = flatTableAndFields.ToDictionary(a => new KeyValuePair<string, string>(a.TableName, a.PriKeyName), a => new KeyValuePair<string, string>(a.DisplayField, a.SortField));
            // lookup of table and keys
            Dictionary<string, List<int>> tableAndPriKeys = new Dictionary<string, List<int>>();
            foreach (var table in map)
            {
                string tableName = table.TableName;
                if (!tableAndPriKeys.ContainsKey(tableName))
                {
                    tableAndPriKeys.Add(tableName, new List<int>());
                }
                var keys = tableAndPriKeys[tableName];
                foreach (var relatedNode in table.RelatedNodes)
                {
                    int priKey = relatedNode.PriKey;
                    if (!keys.Contains(priKey))
                    {
                        keys.Add(priKey);
                    }
                }
            }
            // end if not processing related records
            if (tableAndPriKeys.SelectMany(a => a.Value).Count() == 0)
                return;
            // return data table of table display and sort value
            DataTable relatedRecordsByTable = Caisis.DataAccess.GlobalDa.GetRecordByTableAndFields(tableAndRelevantFields, tableAndPriKeys.ToDictionary(a => a.Key, a => a.Value.AsEnumerable<int>()));
            // append <DisplayValue> and <SortField> to related record nodes
            foreach (var relatedTable in map)
            {
                string tableName = relatedTable.TableName;
                foreach (var relatedRecord in relatedTable.RelatedNodes)
                {
                    int priKey = relatedRecord.PriKey;
                    XmlNode recordNode = relatedRecord.Node;
                    var found = relatedRecordsByTable.Select("TableName = '" + tableName + "' AND PrimaryKey = " + priKey);
                    if (found.Count() > 0)
                    {
                        DataRow data = found.First();
                        string displayValue = data["DisplayField"].ToString();
                        string sortValue = data["SortValue"].ToString();
                        XmlNode displayNode = recordNode["DisplayValue"];
                        if (displayNode == null)
                        {
                            displayNode = eformXML.CreateElement("DisplayValue");
                            recordNode.AppendChild(displayNode);
                        }
                        displayNode.InnerText = displayValue;
                        XmlNode sortNode = recordNode["SortValue"];
                        if (sortNode == null)
                        {
                            sortNode = eformXML.CreateElement("SortValue");
                            recordNode.AppendChild(sortNode);
                        }
                        sortNode.InnerText = sortValue;
                    }
                }
            }
        }

        /// <summary>
        /// Remove DisplayValue and SortValue from the EForm XML
        /// </summary>
        /// <param name="eformXML"></param>
        public static void RemoveEformRelatedRecordValues(XmlDocument eformXML)
        {
            XmlNodeList displayValue = eformXML.SelectNodes("//RelatedRecords[@ScrTableName and @SrcSystem='Caisis']/RelatedRecord/DisplayValue");
            XmlNodeList sortValue = eformXML.SelectNodes("//RelatedRecords[@ScrTableName and @SrcSystem='Caisis']/RelatedRecord/SortValue");
            var removeNodes = displayValue.Cast<XmlNode>().Concat(sortValue.Cast<XmlNode>());
            foreach (XmlNode nodeToRemove in removeNodes)
            {
                nodeToRemove.ParentNode.RemoveChild(nodeToRemove);
            }
        }

        #endregion

    }
}