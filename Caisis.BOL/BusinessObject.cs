using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Reflection;
using System.Threading;
using System.Xml.Linq;
using System.Web;

using Caisis.DataAccess;
using Caisis.Security;

using Caisis.Data;
using Caisis.Extensions;

namespace Caisis.BOL
{
	public static class BusinessObjectExtensions
	{
		internal static string NullRetrieve<TResult>(this IDataRecord r, Func<int, TResult> f, int i)
		{
			if (r.IsDBNull(i))
				return null;
			else
				return f(i).ToString();
		}
		
		public static DataView AsDataView<B>(this IEnumerable<B> list)
			where B : BusinessObject, new()
		{
			DataTable clonedTable = BusinessObject.GetPrototypeTable<B>();

			clonedTable.Constraints.Clear();

			foreach (DataColumn col in clonedTable.Columns)
			{
				col.AllowDBNull = true;
			}

			foreach (B b in list)
			{
				if (b.IsEmpty)
					continue;

				DataRow row = clonedTable.NewRow();

				for (int i = 0; i < b.FieldCount; i++)
					row[i] = b[i];

				clonedTable.Rows.Add(row);
			}

			return clonedTable.DefaultView;
		}

		public static DataView AsDataView(this IEnumerable<IBusinessObject> list, string tablename)
		{
			DataTable clonedTable = BusinessObject.GetPrototypeTable(tablename);

			clonedTable.Constraints.Clear();

			foreach (DataColumn col in clonedTable.Columns)
			{
				col.AllowDBNull = true;
			}

			foreach (IBusinessObject b in list)
			{
				if (b.TableName != tablename)
				{
					#region msg
					string msg = string.Format("The sequence contains a business object for a table, {0}, not matching that of the tablename argument, {1}.", b.TableName, tablename);
					#endregion
					throw new ArgumentException(msg, "tablename");
				}

				if (b.IsEmpty)
					continue;

				DataRow row = clonedTable.NewRow();

				for (int i = 0; i < b.FieldCount; i++)
					row[i] = b[i];

				clonedTable.Rows.Add(row);
			}

			return clonedTable.DefaultView;
		}
	}

	public abstract class BusinessObject : IBusinessObject
	{
		#region class initialization (traversing assembly metadata)

		private static Dictionary<string, DataTable> tableMap = new Dictionary<string,DataTable>();

		private static Dictionary<string, string> parentTablenameMap = new Dictionary<string,string>();
		private static Dictionary<string, List<string>> childTablenameMap = new Dictionary<string, List<string>>();

		private static Dictionary<string, string> primaryKeyMap = new Dictionary<string, string>();
		private static Dictionary<string, List<string>> foreignKeyMap = new Dictionary<string,List<string>>();
		private static Dictionary<string, int> depthMap = new Dictionary<string, int>();
		private static Dictionary<string, List<string>> uniqueConstraintMap = new Dictionary<string, List<string>>();
		private static Dictionary<string, bool> isMultiAssociatedMap = new Dictionary<string, bool>();
		private static Dictionary<string, string> lookupKeyNameMap = new Dictionary<string, string>();
		private static Dictionary<string, string> lookupTablenameMap = new Dictionary<string, string>();
		private static Dictionary<string, List<string>> diseaseTableMap = new Dictionary<string, List<string>>();
		private static Dictionary<string, bool> isExportableMap = new Dictionary<string, bool>();

		private static Dictionary<string, Dictionary<string, string>> virtualFieldMap = null;
		private static int virtualFieldMaxLength = 255; // will be read from the database but this is the default

        // pre-v6
		//private static Dictionary<string, Dictionary<string, string>> tableMetadataMap = new Dictionary<string, Dictionary<string, string>>();
		//private static Dictionary<string, Dictionary<string, Dictionary<string, string>>> fieldMetadataMap = new Dictionary<string, Dictionary<string, Dictionary<string, string>>>();

        // v6 metadata

        /// <summary>
        /// Disease based table metadata lookup, disease -> table -> table attribute -> (isDefault, table attribute value)
        /// </summary>
        private static Dictionary<string, Dictionary<string, Dictionary<string, KeyValuePair<bool, string>>>> tableDiseaseMetadataMap = new Dictionary<string,Dictionary<string,Dictionary<string,KeyValuePair<bool,string>>>>();
        
        /// <summary>
        /// Disease based table field metadata lookup, disease -> table -> field -> table field attribute -> (isDefault, table field attribute value)
        /// </summary>
        private static Dictionary<string, Dictionary<string, Dictionary<string, Dictionary<string, KeyValuePair<bool, string>>>>> fieldDiseaseMetadataMap = new Dictionary<string, Dictionary<string, Dictionary<string, Dictionary<string, KeyValuePair<bool, string>>>>>();

		private static ReaderWriterLockSlim tableMapLock = new ReaderWriterLockSlim();
		private static ReaderWriterLockSlim fieldMetadataLock = new ReaderWriterLockSlim();
		private static ReaderWriterLockSlim tableMetadataLock = new ReaderWriterLockSlim();

		private static readonly string MDF_TableName = "TableName";
		private static readonly string MDF_FieldName = "FieldName";
		private static readonly string MDF_FieldDataType = "FieldDataType";
		private static readonly string MDF_FieldIsVirtual = "FieldIsVirtual";
		private static readonly string MDF_FieldSuppress = "FieldSuppress";
		private static readonly string MDF_FieldOrder = "FieldOrder";
		private static readonly string MDF_AttributeName = "AttributeName";
		private static readonly string MDF_AttributeValue = "AttributeValue";

		private static readonly string MDT_TableName = "TableName";
		private static readonly string MDT_TableLabel = "TableLabel";
		private static readonly string MDT_TableDescription = "TableDescription";
		private static readonly string MDT_TableAttributeName = "TableAttributeName";
		private static readonly string MDT_TableAttributeValue = "TableAttributeValue";

		private static readonly string MDA_FieldDescription = "FieldDescription";
		private static readonly string MDA_FieldLabel = "FieldLabel";
		private static readonly string MDA_ControlType = "ControlType";
		private static readonly string MDA_Required = "Required";

        // v6 metadata
        /// <summary>
        /// The key reresenting the "DEFAULT" disease metadata view
        /// </summary>
        private static readonly string DEFAULT_METADATA_KEY = "All";

		static BusinessObject()
		{
			Dictionary<string, Dictionary<string, int>> maxLengthTableMap = GetMaxColumnLengthMap();

			foreach (Type t in Assembly.GetExecutingAssembly().GetTypes())
			{
				if (!t.IsSubclassOf(typeof(BusinessObject)))
					continue;

				DataTable table = BuildDataTable(t, maxLengthTableMap);

				string tname = table.TableName;

				// TODO: throw exception if tablename is already in tableMap ?

				tableMap[tname] = table;

				// parent tables
				ParentTablenameAttribute pta = t.GetCustomAttributes(typeof(ParentTablenameAttribute), true).OfType<ParentTablenameAttribute>().FirstOrDefault();
				if (pta != null)
				{
					string parent = pta.Tablename;

					parentTablenameMap[tname] = parent;

					if (!childTablenameMap.ContainsKey(parent))
						childTablenameMap[parent] = new List<string>();

					childTablenameMap[parent].Add(tname);
				}

				// primary keys
				IEnumerable<string> names = GetMarkedFields(t, typeof(PrimaryKeyAttribute));

				if (names.Count() != 1)
					throw new Exception(string.Format("The Business Object for tablename {0} has more than one primary key attribute set.", tname));
				else
					primaryKeyMap[tname] = names.First();

				// foreign keys
				foreignKeyMap[tname] = new List<string>(GetMarkedFields(t, typeof(ForeignKeyAttribute)));

				// unique contraints
				uniqueConstraintMap[tname] = new List<string>(GetMarkedFields(t, typeof(UniqueConstraintAttribute)));

				// diseases
				DiseaseAttribute dsa = t.GetCustomAttributes(typeof(DiseaseAttribute), true)
										.OfType<DiseaseAttribute>()
										.FirstOrDefault();
				if (dsa != null)
				{
					string diseaseName = dsa.Name;

					if (!diseaseTableMap.ContainsKey(diseaseName))
						diseaseTableMap[diseaseName] = new List<string>();

					diseaseTableMap[diseaseName].Add(tname);
				}

				// multi-association (needed by data export)
				MultiAssociatedAttribute mta = t.GetCustomAttributes(typeof(MultiAssociatedAttribute), true).OfType<MultiAssociatedAttribute>().FirstOrDefault();

				if (mta != null)
				{
					isMultiAssociatedMap[tname] = true;

					lookupTablenameMap[tname] = mta.LookupTablename;

					IEnumerable<string> k = GetMarkedFields(t, typeof(LookupKeyAttribute));

					lookupKeyNameMap[tname] = k.FirstOrDefault();
				}
				else
				{
					isMultiAssociatedMap[tname] = false;
				}

				// export
				ExportableAttribute exa = t.GetCustomAttributes(typeof(ExportableAttribute), true)
										   .OfType<ExportableAttribute>()
										   .FirstOrDefault();
				isExportableMap[tname] = exa != null;
			}

			// retrieve table and field metadata (from MetadataDa) -- also need a mechanism to refresh metadata from the database (for admins)
			_RefreshTableMetadataFromDatabase();
			_RefreshFieldMetadataFromDatabase();

			tableMap.Keys.ForEach(x => depthMap[x] = Percolate(x, 0));

			// sort child tablenames
			childTablenameMap.Values.ForEach(s => s.Sort());
		}

		private static Dictionary<string, Dictionary<string, int>> GetMaxColumnLengthMap()
		{
			// table -> { column -> maxlength }
			Dictionary<string, Dictionary<string, int>> maxLengthMap = new Dictionary<string, Dictionary<string, int>>();

			int tableNameIndex = -1;
			int columnNameIndex = -1;
			int characterMaxLengthIndex = -1;
			bool initializedIndices = false;

			Action<IDataRecord> init =
				r =>
				{
					tableNameIndex = r.GetOrdinal("TABLE_NAME");
					columnNameIndex = r.GetOrdinal("COLUMN_NAME");
					characterMaxLengthIndex = r.GetOrdinal("CHARACTER_MAXIMUM_LENGTH");
					initializedIndices = true;
				};

			Connectivity.RecordConsumerDelegate consumer =
				r =>
				{
					if (!initializedIndices)
						init(r);

					string tableName = r.GetString(tableNameIndex);
					string columnName = r.GetString(columnNameIndex);
					int characterMaxLength = r.GetInt32(characterMaxLengthIndex);

					Dictionary<string, int> columnMap;

					if (maxLengthMap.ContainsKey(tableName))
					{
						columnMap = maxLengthMap[tableName];
					}
					else
					{
						columnMap = new Dictionary<string, int>();
						maxLengthMap[tableName] = columnMap;
					}

					columnMap[columnName] = characterMaxLength;

					return true;
				};

			MetadataDa.ConsumeTableColumnMaxLengths(consumer);

			return maxLengthMap;
		}

        /// <summary>
        /// Refreshes ALL table and field metadata lookup from database
        /// </summary>
		public static void RefreshMetadataFromDatabase()
		{
			RefreshFieldMetadataFromDatabase();
			RefreshTableMetadataFromDatabase();
		}

        // v6 metadata

        /// <summary>
        /// Refreshes @tablename metadata lookup from database
        /// </summary>
        /// <param name="tablename"></param>
        public static void RefreshMetadataFromDatabase(string tablename)
        {
            RefreshFieldMetadataFromDatabase(tablename);
            RefreshTableMetadataFromDatabase(tablename);
        }

		// thread safety? do we lock the maps as we're performing this?
		// and what happens to existing queries when the refresh is taking place? do they get empty/incomplete metadata?
		// can we get this to talk to other Caisis instances in a cluster?
		public static void RefreshFieldMetadataFromDatabase()
		{
			fieldMetadataLock.EnterWriteLock();

			try
			{
				_RefreshFieldMetadataFromDatabase();
			}
			finally
			{
				fieldMetadataLock.ExitWriteLock();
			}
		}

        // v6 metadata

        /// <summary>
        /// Refreshes @tablename field metadata lookup from database
        /// </summary>
        /// <param name="tablename"></param>
        public static void RefreshFieldMetadataFromDatabase(string tablename)
        {
            fieldMetadataLock.EnterWriteLock();

            try
            {
                _RefreshFieldMetadataFromDatabase(tablename);
            }
            finally
            {
                fieldMetadataLock.ExitWriteLock();
            }
        }

		private static void _RefreshFieldMetadataFromDatabase()
		{
            // pre-v6
            //int tableNameIndex = -1; // compilation and sanity hack
            //int fieldNameIndex = -1;
            //int fieldDataTypeIndex = -1;
            //int fieldIsVirtualIndex = -1;
            //int fieldSuppressIndex = -1;
            //int fieldOrderIndex = -1;
            //int attributeNameIndex = -1;
            //int attributeValueIndex = -1;

            //bool initializedIndices = false;

            //Action<IDataRecord> init = 
            //    (r) =>
            //    {
            //        tableNameIndex = r.GetOrdinal(MDF_TableName);
            //        fieldNameIndex = r.GetOrdinal(MDF_FieldName);
            //        fieldDataTypeIndex = r.GetOrdinal(MDF_FieldDataType);
            //        fieldIsVirtualIndex = r.GetOrdinal(MDF_FieldIsVirtual);
            //        fieldSuppressIndex = r.GetOrdinal(MDF_FieldSuppress);
            //        fieldOrderIndex = r.GetOrdinal(MDF_FieldOrder);
            //        attributeNameIndex = r.GetOrdinal(MDF_AttributeName);
            //        attributeValueIndex = r.GetOrdinal(MDF_AttributeValue);

            //        initializedIndices = true;
            //    };

            //Connectivity.RecordConsumerDelegate consumer =
            //    (r) =>
            //    {
            //        if (!initializedIndices)
            //            init(r);

            //        string t = r.GetString(tableNameIndex);
            //        string f = r.GetString(fieldNameIndex);

            //        // we use this pattern (of map entry initialization) quite a bit. extension method?

            //        Dictionary<string, Dictionary<string, string>> fieldAttributeMap;

            //        if (!fieldMetadataMap.ContainsKey(t))
            //        {
            //            fieldAttributeMap = new Dictionary<string, Dictionary<string, string>>();
            //            fieldMetadataMap[t] = fieldAttributeMap;
            //        }
            //        else
            //        {
            //            fieldAttributeMap = fieldMetadataMap[t];
            //        }

            //        Dictionary<string, string> attributeMap;

            //        if (!fieldAttributeMap.ContainsKey(f))
            //        {
            //            attributeMap = new Dictionary<string, string>();
            //            fieldAttributeMap[f] = attributeMap;
            //        }
            //        else
            //        {
            //            attributeMap = fieldAttributeMap[f];
            //        }

            //        // FieldDataType, FieldIsVirtual, FieldSuppress, FieldOrder are redundant across AttributeNames
            //        attributeMap.Adjoin(MDF_FieldDataType, r.NullRetrieve(i => r.GetString(i), fieldDataTypeIndex));
            //        attributeMap.Adjoin(MDF_FieldIsVirtual, r.NullRetrieve(i => r.GetBoolean(i), fieldIsVirtualIndex));
            //        attributeMap.Adjoin(MDF_FieldSuppress, r.NullRetrieve(i => r.GetBoolean(i), fieldSuppressIndex));
            //        attributeMap.Adjoin(MDF_FieldOrder, r.NullRetrieve(i => r.GetInt32(i), fieldOrderIndex));

            //        // store [AttributeName] -> [AttributeValue]
            //        if (!r.IsDBNull(attributeNameIndex))
            //            attributeMap.Adjoin(r.GetString(attributeNameIndex), r.NullRetrieve(i => r.GetString(i), attributeValueIndex));

            //        return true;
            //    };

            //fieldMetadataMap.Clear(); // we could make a less-expensive version of this that deals only with CHANGED keys...

            //MetadataDa.ConsumeFieldMetadata(consumer);

            // v6 metadata

            // re-init map
            fieldDiseaseMetadataMap.Clear();

            // consume all field metadata
            _RefreshFieldMetadataFromDatabase((callback) => MetadataDa.ConsumeFieldMetadata(callback), true);

            // v6 metadata
		}

        private static void _RefreshFieldMetadataFromDatabase(string tablename)
        {
            // for each disease entry, clear table metadata
            fieldDiseaseMetadataMap.Where(
                    d => d.Value.ContainsKey(tablename)).ForEach(
                        d => d.Value[tablename].Clear());

            _RefreshFieldMetadataFromDatabase((callback) => MetadataDa.ConsumeFieldMetadata(callback, tablename), true);
        }               

        private static void _RefreshFieldMetadataFromDatabase(Action<Connectivity.RecordConsumerDelegate> metaGetter, bool updateMetadataMap)
        {
            int tableNameIndex = -1; // compilation and sanity hack
            int fieldNameIndex = -1;
            int fieldDataTypeIndex = -1;
            int fieldIsVirtualIndex = -1;
            int fieldSuppressIndex = -1;
            int fieldOrderIndex = -1;
            int attributeNameIndex = -1;
            int attributeValueIndex = -1;

            bool initializedIndices = false;

            Action<IDataRecord> init =
                (r) =>
                {
                    tableNameIndex = r.GetOrdinal(MDF_TableName);
                    fieldNameIndex = r.GetOrdinal(MDF_FieldName);
                    fieldDataTypeIndex = r.GetOrdinal(MDF_FieldDataType);
                    fieldIsVirtualIndex = r.GetOrdinal(MDF_FieldIsVirtual);
                    fieldSuppressIndex = r.GetOrdinal(MDF_FieldSuppress);
                    fieldOrderIndex = r.GetOrdinal(MDF_FieldOrder);
                    attributeNameIndex = r.GetOrdinal(MDF_AttributeName);
                    attributeValueIndex = r.GetOrdinal(MDF_AttributeValue);

                    initializedIndices = true;
                };
            Connectivity.RecordConsumerDelegate consumeDiseaseMetadata =
                  record =>
                  {
                      if (!initializedIndices)
                          init(record);

                      string table = record.GetString(tableNameIndex);
                      string fieldName = record.GetString(fieldNameIndex);
                      string attributeName = record.GetString(attributeNameIndex);
                      string attributeValue = record.GetString(attributeValueIndex);
                      string diseaseName = record["DiseaseName"].ToString();
                      bool isDefault = record["DiseaseName"] == DBNull.Value;

                      // normalize disease
                      diseaseName = !string.IsNullOrEmpty(diseaseName) ? diseaseName : DEFAULT_METADATA_KEY;
                      // add disease entry
                      if (!fieldDiseaseMetadataMap.ContainsKey(diseaseName))
                      {
                          fieldDiseaseMetadataMap.Add(diseaseName, new Dictionary<string, Dictionary<string, Dictionary<string, KeyValuePair<bool, string>>>>(StringComparer.OrdinalIgnoreCase));
                      }
                      var diseaseMetadata = fieldDiseaseMetadataMap[diseaseName];
                      // add table entry
                      if (!diseaseMetadata.ContainsKey(table))
                      {
                          diseaseMetadata.Add(table, new Dictionary<string, Dictionary<string, KeyValuePair<bool, string>>>(StringComparer.OrdinalIgnoreCase));
                      }
                      var diseaseTableMetadata = diseaseMetadata[table];
                      // add field entry
                      if (!diseaseTableMetadata.ContainsKey(fieldName))
                      {
                          diseaseTableMetadata.Add(fieldName, new Dictionary<string, KeyValuePair<bool, string>>(StringComparer.OrdinalIgnoreCase));
                      }
                      var diseaseTableFieldMetadata = diseaseTableMetadata[fieldName];
                      // add field attribute entry
                      if (!diseaseTableFieldMetadata.ContainsKey(attributeName))
                      {
                          diseaseTableFieldMetadata.Add(attributeName, new KeyValuePair<bool, string>(isDefault, attributeValue));
                      }

                      return true;
                  };

            metaGetter(consumeDiseaseMetadata);

            if (updateMetadataMap)
            {
                if (fieldDiseaseMetadataMap.ContainsKey(DEFAULT_METADATA_KEY))
                {
                    var defaultMetadata = fieldDiseaseMetadataMap[DEFAULT_METADATA_KEY];
                    var defaultTables = defaultMetadata.Keys;
                    foreach (var other in fieldDiseaseMetadataMap)
                    {
                        string disease = other.Key;
                        var diseaseMetadata = other.Value;
                        // no need to copy default->default
                        if (disease == DEFAULT_METADATA_KEY)
                        {
                            continue;
                        }
                        foreach (string table in defaultTables)
                        {
                            var defaultTableMetadata = defaultMetadata[table];
                            // if disease doesn't contain entry, copy all metadata
                            if (!diseaseMetadata.ContainsKey(table))
                            {
                                // copy all table -> field attributes, indicating default
                                diseaseMetadata.Add(table, defaultTableMetadata.ToDictionary(a => a.Key, a=>a.Value.ToDictionary(b=>b.Key, b=> new KeyValuePair<bool, string>(true, b.Value.Value), StringComparer.OrdinalIgnoreCase), StringComparer.OrdinalIgnoreCase));
                            }
                            else
                            {
                                var diseaseTableMetadata = diseaseMetadata[table];
                                foreach (string field in defaultTableMetadata.Keys)
                                {
                                    var defaultTableFieldMetadata = defaultTableMetadata[field];
                                    // if disease table doesn't contain attribute, copy
                                    if (!diseaseTableMetadata.ContainsKey(field))
                                    {
                                        // create attribute entry, indicating not default
                                        diseaseTableMetadata.Add(field, defaultTableFieldMetadata.ToDictionary(a => a.Key, a => new KeyValuePair<bool, string>(true, a.Value.Value), StringComparer.OrdinalIgnoreCase));
                                    }
                                    else
                                    {
                                        var diseaseTableFieldAttributes = diseaseTableMetadata[field];
                                        // copy attribute values
                                        foreach (string attributeName in defaultTableFieldMetadata.Keys)
                                        {
                                            var defaultTableFieldAttributePair = defaultTableFieldMetadata[attributeName];
                                            if (!diseaseTableFieldAttributes.ContainsKey(attributeName))
                                            {
                                                diseaseTableFieldAttributes.Add(attributeName, new KeyValuePair<bool, string>(true, defaultTableFieldAttributePair.Value));
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                } 
            }
        }

		public static void RefreshTableMetadataFromDatabase()
		{
			tableMetadataLock.EnterWriteLock();

			try
			{
				_RefreshTableMetadataFromDatabase();
			}
			finally
			{
				tableMetadataLock.ExitWriteLock();
			}
		}

        public static void RefreshTableMetadataFromDatabase(string tablename)
        {
            tableMetadataLock.EnterWriteLock();

            try
            {
                _RefreshTableMetadataFromDatabase(tablename);
            }
            finally
            {
                tableMetadataLock.ExitWriteLock();
            }
        }

		private static void _RefreshTableMetadataFromDatabase()
		{
            // pre-v6
            //int tableNameIndex = -1;
            //int tableAttributeNameIndex = -1;
            //int tableAttributeValueIndex = -1;

            //bool initializedIndices = false;

            //Action<IDataRecord> init =
            //    (r) =>
            //    {
            //        tableNameIndex = r.GetOrdinal(MDT_TableName);
            //        tableAttributeNameIndex = r.GetOrdinal(MDT_TableAttributeName);
            //        tableAttributeValueIndex = r.GetOrdinal(MDT_TableAttributeValue);

            //        initializedIndices = true;
            //    };

            //Connectivity.RecordConsumerDelegate consumer =
            //    (r) =>
            //    {
            //        if (!initializedIndices)
            //            init(r);

            //        string t = r.GetString(tableNameIndex);

            //        Dictionary<string, string> attributeMap;

            //        if (!tableMetadataMap.ContainsKey(t))
            //        {
            //            attributeMap = new Dictionary<string, string>();
            //            tableMetadataMap[t] = attributeMap;
            //        }
            //        else
            //        {
            //            attributeMap = tableMetadataMap[t];
            //        }

            //        attributeMap.Adjoin(r.GetString(tableAttributeNameIndex), r.NullRetrieve(i => r.GetString(i), tableAttributeValueIndex));

            //        return true;
            //    };

            //tableMetadataMap.Clear();

            //MetadataDa.ConsumeTableMetadata(consumer);

            // v6 metadata

            // clear map
            tableDiseaseMetadataMap.Clear();
            // refresh all disease table metadata
            _RefreshTableMetadataFromDatabase((callback) => MetadataDa.ConsumeTableMetadata(callback), true);
            // v6 metadata
		}

        private static void _RefreshTableMetadataFromDatabase(string tablename)
        {
            // for each disease entry, clear table metadata
            tableDiseaseMetadataMap.Where(
                    d => d.Value.ContainsKey(tablename)).ForEach(
                        d => d.Value[tablename].Clear());

            // refresh metadata for specific table
            _RefreshTableMetadataFromDatabase((callback) => MetadataDa.ConsumeTableMetadata(callback, tablename) ,true);
        }

        private static void _RefreshTableMetadataFromDatabase(Action<Connectivity.RecordConsumerDelegate> metaGetter, bool updateMetadataMap)
        {
            int tableNameIndex = -1;
            int tableAttributeNameIndex = -1;
            int tableAttributeValueIndex = -1;

            bool initializedIndices = false;

            Action<IDataRecord> init =
                (r) =>
                {
                    tableNameIndex = r.GetOrdinal(MDT_TableName);
                    tableAttributeNameIndex = r.GetOrdinal(MDT_TableAttributeName);
                    tableAttributeValueIndex = r.GetOrdinal(MDT_TableAttributeValue);

                    initializedIndices = true;
                };
            Connectivity.RecordConsumerDelegate callback =
                (record) =>
                {
                    if (!initializedIndices)
                        init(record);

                    string table = record.GetString(tableNameIndex);
                    string attributeName = record.GetString(tableAttributeNameIndex);
                    string attributeValue = record.GetString(tableAttributeValueIndex);
                    string diseaseName = record["DiseaseName"].ToString();
                    bool isDefault = record["DiseaseName"] == DBNull.Value;
                    // normalize disease
                    diseaseName = !string.IsNullOrEmpty(diseaseName) ? diseaseName : DEFAULT_METADATA_KEY;
                    // add disease entry
                    if (!tableDiseaseMetadataMap.ContainsKey(diseaseName))
                    {
                        tableDiseaseMetadataMap.Add(diseaseName, new Dictionary<string, Dictionary<string, KeyValuePair<bool, string>>>(StringComparer.OrdinalIgnoreCase));
                    }
                    var diseaseMetadata = tableDiseaseMetadataMap[diseaseName];
                    // add table entry
                    if (!diseaseMetadata.ContainsKey(table))
                    {
                        diseaseMetadata.Add(table, new Dictionary<string, KeyValuePair<bool, string>>(StringComparer.OrdinalIgnoreCase));
                    }
                    var diseaseTableMetadata = diseaseMetadata[table];
                    // add table metadata entry
                    if (!diseaseTableMetadata.ContainsKey(attributeName))
                    {
                        diseaseTableMetadata.Adjoin(attributeName, new KeyValuePair<bool, string>(isDefault, attributeValue));
                    } 

                    return true;
                };
            // fill disease metadata map
            metaGetter(callback);

            // merge metadata
            if (updateMetadataMap)
            {
                if (tableDiseaseMetadataMap.ContainsKey(DEFAULT_METADATA_KEY))
                {
                    var defaultMetadata = tableDiseaseMetadataMap[DEFAULT_METADATA_KEY];
                    var defaultTables = defaultMetadata.Keys;
                    foreach (var other in tableDiseaseMetadataMap)
                    {
                        string disease = other.Key;
                        var diseaseMetadata = other.Value;
                        // no need to copy default->default
                        if (disease == DEFAULT_METADATA_KEY)
                        {
                            continue;
                        }
                        foreach (string table in defaultTables)
                        {                            
                            var defaultTableMetadata = defaultMetadata[table];
                            // if disease doesn't contain entry, copy all metadata
                            if (!diseaseMetadata.ContainsKey(table))
                            {
                                // copy all table attributes, indicating default
                                diseaseMetadata.Add(table, defaultTableMetadata.ToDictionary(a => a.Key, a => new KeyValuePair<bool, string>(true, a.Value.Value), StringComparer.OrdinalIgnoreCase));
                            }
                            else
                            {
                                var diseaseTableMetadata = diseaseMetadata[table];
                                foreach(string attributeName in defaultTableMetadata.Keys)
                                {
                                    var defaulTableMetadataPair = defaultTableMetadata[attributeName];
                                    // if disease table doesn't contain attribute, copy
                                    if (!diseaseTableMetadata.ContainsKey(attributeName))
                                    {
                                        // create attribute entry, indicating not default
                                        diseaseTableMetadata.Add(attributeName, new KeyValuePair<bool, string>(true, defaulTableMetadataPair.Value));
                                    }
                                }
                            }
                        }
                    }
                }                
            }

        }

		private static int Percolate(string tablename, int depth)
		{
			string parent;

			if (parentTablenameMap.ContainsKey(tablename) && 
				(parent = parentTablenameMap[tablename]) != tablename)
				return Percolate(parent, depth + 1);
			else
				return depth;
		}

		private static IEnumerable<string> GetMarkedFields(Type t, Type attributeType)
		{
			if (!attributeType.IsSubclassOf(typeof(Attribute)))
				throw new ArgumentException("attributeType was not a subclass of Attribute.", "attributeType");

			return
				from fieldInfo in t.GetFields(BindingFlags.Static | BindingFlags.Public | BindingFlags.FlattenHierarchy)
				where fieldInfo.GetCustomAttributes(attributeType, true).Any()
				select fieldInfo.Name;
		}

		//private static IEnumerable<DataTable> BuildDataTables()
		//{
		//    return
		//        from type in Assembly.GetExecutingAssembly().GetTypes()
		//        where type.IsSubclassOf(typeof(BusinessObject))
		//        select BuildDataTable(type);
		//}

		private static DataTable BuildDataTable(Type type, Dictionary<string, Dictionary<string, int>> maxLengthTableMap)
		{
			if (!type.IsSubclassOf(typeof(BusinessObject)))
				throw new ArgumentException("Type must be subclassable from BusinessObject", "type");

			// traverse attributes and build table

			// tablename
			// columns (name, type, allow nulls
			// do we even need to note primary, foreign keys here?

			DataTable table = new DataTable();

			object[] tablenameAtts = type.GetCustomAttributes(typeof(TablenameAttribute), true);

			if (tablenameAtts.Length != 1)
				throw new ArgumentException("Type must have one and only one Tablename attribute", "type");

			string tablename = ((TablenameAttribute) tablenameAtts[0]).Tablename;
			table.TableName = tablename;

			IDictionary<string, int> maxLengthMap;

			if (maxLengthTableMap.ContainsKey(tablename))
				maxLengthMap = maxLengthTableMap[tablename];
			else
				maxLengthMap = new Dictionary<string, int>();

			Func<Type, bool> exists = t => type.GetCustomAttributes(t, true).Length > 0;

			bool noEnterBy = false;
			bool noEnterTime = false;
			bool noUpdateBy = false;
			bool noUpdateTime = false;
			bool noLockBy = false;
			bool noLockTime = false;

			// we may change the associated attributes
			if (exists(typeof(NoBaseColumnsAttribute)))
			{
				noEnterBy = noEnterTime = noUpdateBy = noUpdateTime = noLockBy = noLockTime = true;
			}
			
			if (exists(typeof(NoUserFieldsAttribute)))
			{
				noEnterBy = noUpdateBy = noLockBy = true;
			}
			
			if (exists(typeof(NoUpdateAttribute)))
			{
				noUpdateBy = noUpdateTime = true;
			}
			
			if (exists(typeof(NoLockAttribute)))
			{
				noLockBy = noLockTime = true;
			}

			var q = (
				from fieldInfo in type.GetFields(BindingFlags.Static | BindingFlags.Public | BindingFlags.FlattenHierarchy)
				let name = fieldInfo.GetValue(null).ToString()
				let maxLength = maxLengthMap.ContainsKey(name) ? maxLengthMap[name] : (int?) null
				where 
					fieldInfo.FieldType == typeof(string) &&
					!(noEnterBy && name == EnteredBy) &&
					!(noEnterTime && name == EnteredTime) &&
					!(noUpdateBy && name == UpdatedBy) &&
					!(noUpdateTime && name == UpdatedTime) &&
					!(noLockBy && name == LockedBy) &&
					!(noLockTime && name == LockedTime)
				select BuildDataColumn(name, fieldInfo.GetCustomAttributes(true).Cast<Attribute>(), maxLength)
			).Union(
				from virtualField in GetVirtualFields(tablename)
				select BuildDataColumn(virtualField, typeof(string), true, true, virtualFieldMaxLength)
			);

			table.Columns.AddRange(q.ToArray());

			return table;
		}

		// useful whenever virtual fields change
		// TODO: lock the tables somehow (does each entry in the table map have a lock?)
		public static void RebuildVirtualFields()
		{
			PopulateVirtualFields(virtualFieldMap);

            List<string> tnames = new List<string>(tableMap.Keys);

			foreach (string t in tnames)
			{
				DataTable table = tableMap[t].Clone();

				List<DataColumn> vfcolumns = new List<DataColumn>();

				// delete existing virtual fields
				for (int i = 0; i < table.Columns.Count; i++)
				{
					DataColumn column = table.Columns[i];

                    if (column.ExtendedProperties.ContainsKey(MDF_FieldIsVirtual))
                        vfcolumns.Add(column);
				}

				vfcolumns.ForEach(table.Columns.Remove);

				// add virtual fields from repopulated map 
				// TODO: (redundant with portion of above method)
				var q =
					from virtualField in GetVirtualFields(t)
					select BuildDataColumn(virtualField, typeof(string), true, true, virtualFieldMaxLength);

				table.Columns.AddRange(q.ToArray());

				tableMap[t] = table;
			}
		}

		// this is a stub
		// TODO: virtual field support class?
		// TODO: we also need a mechanism to resynchronize these
		internal static IEnumerable<string> GetVirtualFields(string tablename)
		{
			if (virtualFieldMap == null)
			{
				virtualFieldMap = new Dictionary<string, Dictionary<string, string>>();

				PopulateVirtualFields(virtualFieldMap);
			}

			if (virtualFieldMap.ContainsKey(tablename))
			{
				return virtualFieldMap[tablename].Keys;
			}
			else
			{
				return new List<string>();
			}
		}

		private static void PopulateVirtualFields(Dictionary<string, Dictionary<string, string>> map)
		{
			map.Clear();

			int tablenameIndex = -1;
			int fieldnameIndex = -1;

			bool initializedIndices = false;

			Action<IDataRecord> init =
				(r) =>
				{
					tablenameIndex = r.GetOrdinal("TableName");
					fieldnameIndex = r.GetOrdinal("FieldName");

					initializedIndices = true;
				};

			Connectivity.RecordConsumerDelegate consumer =
				(r) =>
				{
					if (!initializedIndices)
						init(r);

					string tablename = r.GetString(tablenameIndex);

					if (!map.ContainsKey(tablename))
						map[tablename] = new Dictionary<string, string>();

					map[tablename][r.GetString(fieldnameIndex)] = null;

					return true;
				};

			MetadataDa.ReadVirtualFieldMetadata(consumer);
		}

		private static DataColumn BuildDataColumn(string columnName, IEnumerable<Attribute> attributes, int? maxLength)
		{
			Type dataType = null;
			bool allowNulls = true;

			foreach (Attribute a in attributes)
			{
				if (a is DataTypeAttribute)
				{
					dataType = ((DataTypeAttribute) a).Type;
				}
				else if (a is NotNullAttribute)
				{
					allowNulls = false;
				}
			}

			if (dataType == null)
				throw new ArgumentException("Attributes must include a DataTypeAttribute", "attributes");

			return BuildDataColumn(columnName, dataType, allowNulls, false, maxLength);
		}

		private static DataColumn BuildDataColumn(string columnName, Type dataType, bool allowNulls, bool isVirtual, int? maxLength)
		{
			DataColumn c = new DataColumn(columnName, dataType);

			c.AllowDBNull = allowNulls;

			if (isVirtual)
				c.ExtendedProperties.Add(MDF_FieldIsVirtual, null);

			if (maxLength.HasValue && dataType == typeof(string))
				c.MaxLength = maxLength.Value;

			return c;
		}

		//private static void EvaluateFieldAttribute(string tablename, string fieldname, Attribute a)
		//{
		//    if (a is PrimaryKeyAttribute)
		//    {
		//        if (!primaryKeyMap.ContainsKey(tablename))
		//            primaryKeyMap[tablename] = new List<string>();

		//        primaryKeyMap[tablename].Add(fieldname);
		//    }
		//    else if (a is ForeignKeyAttribute)
		//    {
		//        if (!foreignKeyMap.ContainsKey(tablename))
		//            foreignKeyMap[tablename] = new List<string>();

		//        foreignKeyMap[tablename].Add(fieldname);
		//    }
		//}

		#endregion

		#region common fields
		[NotNull]
		[DataType(typeof(string))]
		public static readonly string EnteredBy = "EnteredBy";

		[NotNull]
		[DataType(typeof(DateTime))]
		public static readonly string EnteredTime = "EnteredTime";

		[DataType(typeof(string))]
		public static readonly string UpdatedBy = "UpdatedBy";

		[DataType(typeof(DateTime))]
		public static readonly string UpdatedTime = "UpdatedTime";

		// These may be moved into an (abstract) subclass: e.g. LockableBusinessObject

		[DataType(typeof(string))]
		public static readonly string LockedBy = "LockedBy";

		[DataType(typeof(DateTime))]
		public static readonly string LockedTime = "LockedTime";
		#endregion

		DataRow record; // holds the actual data; why not SortedDictionary<string, object> ?; DataRow gives us type safety (via exceptions)
        Database db = new Database();

		// TODO: base bizos (extending this abstract class) that have the necessary user, time, locked fields ...

		string tablename = null;
		string parentTablename = null;
		string primaryKeyName = null;
		List<string> foreignKeyNames = null;

		List<BusinessObject> children;
		BusinessObject parent;

		bool useEnteredBy = false;
		bool useEnteredTime = false;
		bool useUpdatedBy = false;
		bool useUpdatedTime = false;
		bool useLockedBy = false;
		bool useLockedTime = false;
		bool oneToOne = false; // primary key is parent key

		bool insideEForm;

		internal bool InsideEForm
		{
			get { return insideEForm; }
			set
			{
				insideEForm = value;

				if (value)
					AppendToUserName("eform");
			}
		}

		bool saveValidationEnabled = false;
		int saveValidationPatientId;

		List<string> uniqueConstraints = null;

		bool isMultiAssociated = false;
		string lookupKeyName = null;
		string lookupTablename = null;
		bool isExportable = false;
		string userNameComment = null;

		public BusinessObject()
		{
			children = new List<BusinessObject>();
			Init();
		}

		// TODO: do we really want to use this constructor to add children, or do we want to use AddChild(...)
		// use AddChild(...), eliminating need for extenders to explicitly declare constructors
		// use this during the conversion process
		private BusinessObject(params BusinessObject[] children)
		{
			this.children = new List<BusinessObject>(children);
			Init();
		}

		// TODO: EXCEPTION for adding a child whose parent table is not this object's table

		// does the child-adding constructor suffice, or do we need this?
		// should be private perhaps
		private void AddChild(BusinessObject child)
		{
			child.db = db;
			children.Add(child);
		}

		#region initialization

		// TODO: how do we cache this or make it run once per type w/o forcing extenders to define static constructors?
		void Init()
		{
			// get tablename, parentTablename
			// TODO: (optimization) type -> tablename map to cache this reflection
			TablenameAttribute ta = this.GetType().GetCustomAttributes(true).OfType<TablenameAttribute>().First();
			tablename = ta.Tablename;

			if (parentTablenameMap.ContainsKey(tablename))
				parentTablename = parentTablenameMap[tablename];

			// initialize field metadata from static data
			primaryKeyName = primaryKeyMap[tablename];
			foreignKeyNames = foreignKeyMap[tablename];

			// get empty data row
			record = tableMap[tablename].NewRow();

			// handle base fields
			useEnteredBy = HasField(EnteredBy);
			useEnteredTime = HasField(EnteredTime);
			useUpdatedBy = HasField(UpdatedBy);
			useUpdatedTime = HasField(UpdatedTime);
			useLockedBy = HasField(LockedBy);
			useLockedTime = HasField(LockedTime);

			// handle one-to-one
			oneToOne = foreignKeyNames.Contains(primaryKeyName);

			// handle unique constraints
			uniqueConstraints = uniqueConstraintMap[tablename];

			// multi-association
			isMultiAssociated = isMultiAssociatedMap[tablename];

			if (isMultiAssociated)
			{
				lookupTablename = lookupTablenameMap[tablename];
				lookupKeyName = lookupKeyNameMap[tablename];
			}

			// export
			isExportable = isExportableMap[tablename];
		}

		#endregion

		#region transaction support
		internal void SetDb(Database database)
		{
			this.db = database;
		}
		#endregion

		#region IBusinessObject Members

		public string TableName
		{
			get { return tablename; }
		}

		public IEnumerable<string> FieldNames
		{
			// TODO: use the factory?
			get
			{
				return
					from DataColumn column in record.Table.Columns
					select column.ColumnName;
			}
		}

        internal IEnumerable<string> RealFieldNames
        {
			get { return GetRealFields(tablename); }
        }

        internal IEnumerable<string> VirtualFieldNames
        {
            get { return GetVirtualFields(tablename); }
        }

        public string PrimaryKeyName
        {
            get { return primaryKeyName; }
        }

		public IEnumerable<string> ForeignKeyNames
		{
			get { return foreignKeyNames; }
		}

		public string ParentKeyName
		{
			get 
			{
				if (parentTablename != null && primaryKeyMap.ContainsKey(parentTablename))
					return primaryKeyMap[parentTablename];
				else
					return null;
			}
		}

		public bool PrimaryKeyHasValue
		{
			get { return !record.IsNull(primaryKeyName); }
		}

		public IEnumerable<IBusinessObject> Children
		{
			get { return children.Cast<IBusinessObject>(); }
		}

		public IBusinessObject Parent
		{
			get { return parent; }
			protected set { parent = value as BusinessObject; }
		}

		public string ParentTableName
		{
			get { return GetParentTablename(tablename); }
		}

		public bool HasChildren
		{
			get { return children.Count > 0; }
		}

		public bool HasField(string fieldname)
		{
			if (fieldname == null)
				return false;

			return record.Table.Columns.Contains(fieldname);
		}

		public static bool HasField(string tablename, string fieldname)
		{
			CheckTable(tablename);

			if (fieldname == null)
				return false;

			return tableMap[tablename].Columns.Contains(fieldname);
		}

		public int FieldCount
		{
			// TODO: do we want to use the factory for this?
			get { return record.Table.Columns.Count; }
		}

		public bool HasSiblings
		{
			get { return !oneToOne; }
		}

		public bool IsLockable
		{
			get { return useLockedBy || useLockedTime; }
		}

		public bool IsLocked
		{
			get
			{
				return
					(useLockedBy && !IsNull(LockedBy) && !string.IsNullOrEmpty(record[LockedBy].ToString())) ||
					(useLockedTime && !IsNull(LockedTime));
			}
		}

		public IEnumerable<string> UniqueConstraints
		{
			get { return uniqueConstraints; }
		}

		public bool IsMultiAssociated
		{
			get { return isMultiAssociated; }
		}

		public string LookupKeyName
		{
			get { return lookupKeyName; }
		}

		public string LookupTableName
		{
			get { return lookupTablename; }
		}

		public bool IsExportable
		{
			get { return isExportable; }
		}

		public object this[string fieldname]
		{
			get
			{
				return record[fieldname];
			}
			set
			{
				if (ShouldBeDBNull(fieldname, value))
					value = DBNull.Value;

				record[fieldname] = value;
			}
		}

		public object this[int fieldIndex]
		{
			get
			{
				return record[fieldIndex];
			}
			set
			{
				record[fieldIndex] = value;
			}
		}

		public void Delete()
		{
			Delete((int) record[primaryKeyName]);
		}

		public virtual void Delete(int primaryKey)
		{
			if (!ValidateDelete())
				throw new InvalidDeleteException();

			db.Delete(tablename, GetUserName(), PrimaryKeyName, primaryKey, HasVirtualFields);

			// children? is this necessary? won't the cascade delete trigger handle things?
			// children.ForEach(b => b.Delete());

			// wipe the data that we have
			record = tableMap[tablename].NewRow();
		}

		public void Get(int primaryKey)
		{
            if (!ValidateSelect())
                throw new InvalidSelectException();

            // argument and this.record should have the same order of fields
            Func<IDataRecord, bool> consumer =
                r =>
                {
                    for (int i = 0; i < r.FieldCount; i++)
                        record[i] = r[i];

                    return false;
                };

			Dictionary<string, object> keyPair = new Dictionary<string, object>() { { primaryKeyName, primaryKey } };

			db.Select(tablename, primaryKeyName, RealFieldNames, VirtualFieldNames, keyPair, consumer);
		}

		public void Lock()
		{
			// lock validation?
			LockRecord();
			Save();
		}

		private void LockRecord()
		{
			if (useLockedBy)
				record[LockedBy] = GetUserName();

			if (useLockedTime)
				record[LockedTime] = DateTime.Now;

			children.ForEach(x => x.LockRecord());
		}

		public void Unlock()
		{
			// unlock validation?
			UnlockRecord();
			Save();
		}

		private void UnlockRecord()
		{
			if (useLockedBy)
				record[LockedBy] = "";

			if (useLockedTime)
				record[LockedTime] = DBNull.Value;

			children.ForEach(x => x.UnlockRecord());
		}


		// TODO: handle data truncation gracefully
		public void Save()
		{
			if (IsEmpty)
				return;

			db.BeginTransaction();

			try
			{
				_Save();
				db.CommitTransaction();
			}
			catch (Exception e)
			{
				db.RollbackTransaction();

				if (e.Message.Contains("UNIQUE KEY"))
					throw new UniqueKeyConstraintException(e.Message, uniqueConstraints);
				else
					throw e;
			}
		}

		private void _Save()
		{
			if (IsEmpty)
				return;

			bool doInsert = record[PrimaryKeyName] == DBNull.Value ||
							(oneToOne && useEnteredTime && record[EnteredTime] == DBNull.Value);

			if (doInsert)
				Insert();
			else
				Update();

			// children?
			// update children with key only if child's key field is empty
			foreach (BusinessObject child in children)
			{
				if (child[PrimaryKeyName] == DBNull.Value)
					child[PrimaryKeyName] = record[PrimaryKeyName];

				child._Save();
			}
		}

		public void Clear()
		{
			record = tableMap[tablename].NewRow();
		}

		public void EnableSaveValidation(int patientId)
		{
			saveValidationEnabled = true;
			saveValidationPatientId = patientId;
		}

		public void AppendToUserName(string text)
		{
			userNameComment = text;
		}

		/// <summary>
		/// Traverses the tree of business objects to verify that each 
		/// non-empty element of the tree has data in its required fields.
		/// </summary>
		/// <returns></returns>
		public bool RequiredFieldsHaveData
		{
			get
			{
				var fieldQuery =
					from fieldname in FieldNames
					where IsRequired(fieldname)
					select !IsNull(fieldname);

				return (IsEmpty || fieldQuery.All(x => x)) && children.All(c => c.RequiredFieldsHaveData);
			}
		}

		// TODO: verify performance vs non-linq version
		public bool RequiredFieldsHaveData2
		{
			get
			{
				bool valid = true;

				if (!IsEmpty)
				{
					foreach (string fieldname in FieldNames)
					{
						if (IsRequired(fieldname))
							valid &= !IsNull(fieldname);
					}
				}

				foreach (BusinessObject child in children)
					valid &= child.RequiredFieldsHaveData2;

				return valid;
			}
		}

		#endregion

		#region internal properties (useful for export services)
		internal bool UseEnteredBy
		{
			get { return useEnteredBy; }
		}

		internal bool UseEnteredTime
		{
			get { return useEnteredTime; }
		}

		internal bool UseUpdatedBy
		{
			get { return useUpdatedBy; }
		}

		internal bool UseUpdatedTime
		{
			get { return useUpdatedTime; }
		}

		internal bool UseLockedBy
		{
			get { return useLockedBy; }
		}

		internal bool UseLockedTime
		{
			get { return useLockedTime; }
		}
		#endregion

		#region static collection getters

		private static Func<IDataRecord, bool> BuildConsumerForList(Action<BusinessObject> appendBusinesObject, Func<BusinessObject> getBusinessObject)
		{
			return
				r =>
				{
					BusinessObject b = getBusinessObject();

					for (int i = 0; i < r.FieldCount; i++)
						b.record[i] = r[i];

					appendBusinesObject(b);

					return true;
				};
		}

		private static Func<IDataRecord, bool> BuildConsumerForTable(DataTable table)
		{
			return
				r =>
				{
					DataRow row = table.NewRow();

					for (int i = 0; i < r.FieldCount; i++)
						row[i] = r[i];

					table.Rows.Add(row);

					return true;
				};
		}

		private static IEnumerable<BusinessObject> _GetByFields(string tablename, IDictionary<string, object> fieldValues)
		{
			// TODO: validate select

			CheckTable(tablename);
			fieldValues.Keys.ForEach(f => CheckField(tablename, f));

			Database db = new Database();
			List<BusinessObject> list = new List<BusinessObject>();

			var consumer =
				BuildConsumerForList(
					list.Add,
					() => BusinessObjectFactory.BuildBusinessObject(tablename));

			db.Select(tablename,
					  primaryKeyMap[tablename],
					  GetRealFields(tablename),
					  GetVirtualFields(tablename),
					  fieldValues,
					  consumer);

			return list;
		}

		public static IEnumerable<IBusinessObject> GetByFields(string tablename, IDictionary<string, object> fieldValues)
		{
			return _GetByFields(tablename, fieldValues).Cast<IBusinessObject>();
		}

		public static IEnumerable<T> GetByFields<T>(IDictionary<string, object> fieldValues)
			where T : BusinessObject, IBusinessObject, new()
		{
			// TODO: validate select
			string tablename = new T().TableName;
			fieldValues.Keys.ForEach(f => CheckField(tablename, f));

			Database db = new Database();
			List<T> list = new List<T>();

			var consumer =
				BuildConsumerForList(
					b => list.Add(b as T),
					() => new T());

			db.Select(tablename,
					  primaryKeyMap[tablename],
					  GetRealFields(tablename),
					  GetVirtualFields(tablename),
					  fieldValues,
					  consumer);

			return list;
		}

		private static DataView _GetByFieldsAsDataView(string tablename, IDictionary<string, object> fieldValues)
		{
			fieldValues.Keys.ForEach(f => CheckField(tablename, f));

			Database db = new Database();
			DataTable clonedTable = tableMap[tablename].Clone();

			db.Select(tablename,
					  primaryKeyMap[tablename],
					  GetRealFields(tablename),
					  GetVirtualFields(tablename),
					  fieldValues,
					  BuildConsumerForTable(clonedTable));

			return clonedTable.DefaultView;
		}

		public static DataView GetByFieldsAsDataView(string tablename, IDictionary<string, object> fieldValues)
		{
			CheckTable(tablename);
			return _GetByFieldsAsDataView(tablename, fieldValues);
		}

		public static DataView GetByFieldsAsDataView<T>(IDictionary<string, object> fieldValues)
			where T : BusinessObject, IBusinessObject, new()
		{
			// TODO: don't we have a type map (type -> tablename) somewhere?
			return _GetByFieldsAsDataView(new T().tablename, fieldValues);
		}

		public static IEnumerable<IBusinessObject> GetByParent(string tablename, int parentKey)
		{
			if (!HasParentTable(tablename))
				return new List<IBusinessObject>();

			var parKey = new Dictionary<string, object>() { { GetParentKeyName(tablename), parentKey } };
			return GetByFields(tablename, parKey);
		}

		public static IEnumerable<T> GetByParent<T>(int parentKey)
			where T : BusinessObject, IBusinessObject, new()
		{
			string parentKeyName = GetParentKeyName(new T().tablename);
			var parKey = new Dictionary<string, object>() { { parentKeyName, parentKey } };
			return GetByFields<T>(parKey);
		}

		public static DataView GetByParentAsDataView(string tablename, int parentKey)
		{
			var parKey = new Dictionary<string, object>() { { GetParentKeyName(tablename), parentKey } };
			return GetByFieldsAsDataView(tablename, parKey);
		}

		public static DataView GetByParentAsDataView<T>(int parentKey)
			where T : BusinessObject, IBusinessObject, new()
		{
			string parentKeyName = GetParentKeyName(new T().tablename);
			var parKey = new Dictionary<string, object>() { { parentKeyName, parentKey } };
			return GetByFieldsAsDataView<T>(parKey);
		}

		public static IEnumerable<IBusinessObject> GetAll(string tablename)
		{
			return GetByFields(tablename, new Dictionary<string, object>());
		}

		public static IEnumerable<T> GetAll<T>()
			where T : BusinessObject, IBusinessObject, new()
		{
			return GetByFields<T>(new Dictionary<string, object>());
		}

		public static DataView GetAllAsDataView(string tablename)
		{
			CheckTable(tablename);
			return _GetByFieldsAsDataView(tablename, new Dictionary<string, object>());
		}

		public static DataView GetAllAsDataView<T>()
			where T : BusinessObject, IBusinessObject, new()
		{
			return _GetByFieldsAsDataView(new T().tablename, new Dictionary<string, object>());
		}

		#endregion

		#region static queries

		private static int _Count(string tablename, IDictionary<string, object> fieldValues)
		{
			fieldValues.Keys.ForEach(f => CheckField(tablename, f));

			Database db = new Database();
			return db.Count(tablename, primaryKeyMap[tablename], fieldValues);
		}
		
		public static int Count(string tablename, IDictionary<string, object> fieldValues)
		{
			CheckTable(tablename);
			return _Count(tablename, fieldValues);
		}

		public static int Count<T>(IDictionary<string, object> fieldValues)
			where T : BusinessObject, new()
		{
			return _Count(new T().tablename, fieldValues);
		}

		public static bool Exists(string tablename, IDictionary<string, object> fieldValues)
		{
			return Count(tablename, fieldValues) > 0;
		}

		public static bool Exists<T>(IDictionary<string, object> fieldValues)
			where T : BusinessObject, new()
		{
			return Count<T>(fieldValues) > 0;
		}

		#endregion

		internal static DataTable GetPrototypeTable<T>()
			where T : IBusinessObject, new()
		{
			return tableMap[new T().TableName].Clone();
		}

		internal static DataTable GetPrototypeTable(string tablename)
		{
			CheckTable(tablename);
			return tableMap[tablename].Clone();
		}

		public static IEnumerable<string> GetAllTableNames()
		{
			// can optimize by adding to instantiation
			List<string> list = new List<string>(tableMap.Keys);

			list.Sort();

			return list;
		} 

		public static IEnumerable<string> GetChildTableNames(string tablename)
		{
			CheckTable(tablename);

			if (childTablenameMap.ContainsKey(tablename))
				return childTablenameMap[tablename];
			else
				return new List<string>();
		}

		public static IEnumerable<string> GetDescendantTableNames(string tablename)
		{
			CheckTable(tablename);

			foreach (string child in GetChildTableNames(tablename))
			{
				yield return child;

				foreach (string d in GetDescendantTableNames(child))
					yield return d;
			}
        }

        public static IEnumerable<string> GetTableNamesForDisease(string diseaseName)
        {
            if (diseaseTableMap.ContainsKey(diseaseName))
                return diseaseTableMap[diseaseName];
            else
                return new List<string>();
        }

        #region QUERY by Table Attibute

        /// <summary>
        /// Gets a list of table names with the specificed attribute in the DEFAULT metadata schema.
        /// </summary>
        /// <param name="attributeName"></param>
        /// <returns></returns>
		public static IEnumerable<string> GetTableNamesWithMetadataAttribute(string attributeName)
		{
            return GetTableNamesWithMetadataAttribute(attributeName, null);
		}

        /// <summary>
        /// Gets a list of table names with the specificed attribute.
        /// </summary>
        /// <param name="attributeName">The name of the attribute</param>
        /// <param name="disease">The disease in which to search for attribute, NULL or empty string == DEFAULT</param>
        /// <returns></returns>
        public static IEnumerable<string> GetTableNamesWithMetadataAttribute(string attributeName, string disease)
        {             
            return GetTableNamesWithMetadataAttributeValue(attributeName, null, disease);
        }

        /// <summary>
        /// Gets a list of table names with the specificed attribute with specified value in the DEFAULT metadata schema.
        /// </summary>
        /// <param name="attributeName"></param>
        /// <param name="attributeValue"></param>
        /// <returns></returns>
		public static IEnumerable<string> GetTableNamesWithMetadataAttributeValue(string attributeName, string attributeValue)
		{
            return GetTableNamesWithMetadataAttributeValue(attributeName, attributeValue, null);
        }

        #endregion

        #region QUERY by Field Attribute

        /// <summary>
        /// Gets a list of table names with the specificed attribute with specified value.
        /// </summary>
        /// <param name="attributeName">The name of the attribute</param>
        /// <param name="attributeValue">The attribute value to search for (NULL or empty string == check attribute name only)</param>
        /// <param name="disease">The disease in which to search for attribute, NULL or empty string == DEFAULT</param>
        /// <returns></returns>
        public static IEnumerable<string> GetTableNamesWithMetadataAttributeValue(string attributeName, string attributeValue, string disease)
        {
            // disease normalization
            disease = _GetDisease(disease);
            // prevent redundant lookups
            bool isDefaultSearch = disease == DEFAULT_METADATA_KEY;
            // caputure list
            List<string> tables = new List<string>();
            foreach (string table in GetAllTableNames())
            {
                string tableAttributeValue = string.Empty;
                // check if table has disease specific attribute
                if (HasMetadataTableAttribute(table, attributeName, disease))
                {
                    if (string.IsNullOrEmpty(attributeValue))
                    {
                        tables.Add(table);
                        continue;
                    }
                    tableAttributeValue = GetMetadataTableAttribute(table, attributeName, disease);
                }
                // otherwise check if table has DEFAULT attribute
                else if (!isDefaultSearch && HasMetadataTableAttribute(table, attributeName, DEFAULT_METADATA_KEY))
                {
                    if (string.IsNullOrEmpty(attributeValue))
                    {
                        tables.Add(table);
                        continue;
                    }
                    tableAttributeValue = GetMetadataTableAttribute(table, attributeName, DEFAULT_METADATA_KEY);
                }
                if (!string.IsNullOrEmpty(tableAttributeValue) && !string.IsNullOrEmpty(tableAttributeValue) && attributeValue.Equals(tableAttributeValue, StringComparison.OrdinalIgnoreCase))
                {
                    tables.Add(table);
                }
            }
            return tables;
        }

        /// <summary>
        /// Gets a list of fields names with the specificed attribute in the DEFALUT disease view.
        /// </summary>
        /// <param name="table">The name of the table to search</param>
        /// <param name="attributeName">The name of the attribute</param>
        /// <returns>A list of fields with attribute</returns>
        public static IEnumerable<string> GetFieldNamesWithMetadataAttribute(string table, string attributeName)
        {
            return GetFieldNamesWithMetadataAttribute(table, attributeName, null);
        }

        /// <summary>
        /// Gets a list of fields names with the specificed attribute in the specified diseaes view.
        /// </summary>
        /// <param name="table">The name of the table to search</param>
        /// <param name="attributeName">The name of the attribute</param>
        /// <param name="disease">The disease in which to search for attribute, NULL or empty string == DEFAULT</param>
        /// <returns>A list of fields with attribute</returns>
        public static IEnumerable<string> GetFieldNamesWithMetadataAttribute(string table, string attributeName, string disease)
        {
            return GetFieldNamesWithMetadataAttributeValue(table, attributeName, null, disease);
        }

        #endregion

        /// <summary>
        /// Gets a list of fields names with the specificed attribute with specified value.
        /// </summary>
        /// <param name="table">The name of the table to search</param>
        /// <param name="attributeName">The name of the attribute</param>
        /// <param name="attributeValue">The attribute value to search for (NULL or empty string == check attribute name only)</param>
        /// <param name="disease">The disease in which to search for attribute, NULL or empty string == DEFAULT</param>
        /// <returns>A list of fields with attribute and value</returns>
        public static IEnumerable<string> GetFieldNamesWithMetadataAttributeValue(string table, string attributeName, string attributeValue, string disease)
        {
            CheckTable(table);
            disease = _GetDisease(disease);
            bool isDefaultSearch = disease == DEFAULT_METADATA_KEY;
            List<string> fields = new List<string>();
            foreach (string field in GetFieldNames(table))
            {
                string fieldAttributeValue = string.Empty;
                if (HasMetadataFieldAttribute(table, field, attributeName, disease))
                {
                    if (string.IsNullOrEmpty(attributeValue))
                    {
                        fields.Add(field);
                        continue;
                    }
                    fieldAttributeValue = GetMetadataFieldAttribute(table, field, attributeName, disease);
                }
                else if (!isDefaultSearch && HasMetadataFieldAttribute(table, field,  attributeName, DEFAULT_METADATA_KEY))
                {
                    if (string.IsNullOrEmpty(attributeValue))
                    {
                        fields.Add(field);
                        continue;
                    }
                    fieldAttributeValue = GetMetadataFieldAttribute(table, field,  attributeName, DEFAULT_METADATA_KEY);
                }
                if (!string.IsNullOrEmpty(attributeValue) && !string.IsNullOrEmpty(fieldAttributeValue) && attributeValue.Equals(fieldAttributeValue, StringComparison.OrdinalIgnoreCase))
                {
                    fields.Add(field);
                }
            }
            return fields;
        }

		private static void CheckField(string tablename, string fieldname)
		{
			if (!HasField(tablename, fieldname))
				throw new ArgumentException(string.Format("The business object for the {0} table does not contain the field '{1}'.", tablename, fieldname));
		}

		private static void CheckTable(string tablename)
		{
			if (!tableMap.ContainsKey(tablename))
				throw new ArgumentException(string.Format("No business object has the tablename '{0}'.", tablename), "tablename");
		}

        /// <summary>
        /// Gets the primary key name
        /// </summary>
        /// <param name="tablename"></param>
        /// <returns></returns>
		public static string GetPrimaryKeyName(string tablename)
		{
			CheckTable(tablename);

			return primaryKeyMap[tablename];
		}

        /// <summary>
        /// Gets the parent key name
        /// </summary>
        /// <param name="tablename"></param>
        /// <returns></returns>
		public static string GetParentKeyName(string tablename)
		{
			CheckTable(tablename);

			if (!HasParentTable(tablename))
				return null;
			else
				return primaryKeyMap[parentTablenameMap[tablename]];
		}

        /// <summary>
        /// Gets a list of foreign key names
        /// </summary>
        /// <param name="tablename"></param>
        /// <returns></returns>
		public static IEnumerable<string> GetForeignKeyNames(string tablename)
		{
			CheckTable(tablename);

			return foreignKeyMap[tablename];
		}

        /// <summary>
        /// Gets a list of field names
        /// </summary>
        /// <param name="tablename"></param>
        /// <returns></returns>
		public static IEnumerable<string> GetFieldNames(string tablename)
		{
			CheckTable(tablename);

			return
				from DataColumn c in tableMap[tablename].Columns
				select c.ColumnName;
		}

		internal bool HasVirtualFields
		{
			get { return TableHasVirtualFields(tablename); }
		}

		internal static bool TableHasVirtualFields(string tablename)
		{
			return
				virtualFieldMap.ContainsKey(tablename) &&
				virtualFieldMap[tablename].Count > 0;
		}

		internal static IEnumerable<string> GetRealFields(string tablename)
		{
			return GetFieldNames(tablename).Where(f => !(virtualFieldMap.ContainsKey(tablename) && virtualFieldMap[tablename].ContainsKey(f)));
		}

		internal static bool IsVirtualField(string tablename, string fieldname)
		{
			CheckTable(tablename);

			return virtualFieldMap[tablename].ContainsKey(fieldname);
		}

		public static bool TableIsExportable(string tablename)
		{
			CheckTable(tablename);
			return isExportableMap[tablename];
		}

        /// <summary>
        /// Returns if the current BizObject is empty, i.e., fields have no value (NULL)
        /// </summary>
		public bool IsEmpty
		{
			get
			{
				foreach (string f in FieldNames.Where(x => x != primaryKeyName && x != ParentKeyName))
				{
					if (!record.IsNull(f))
						return false;
				}

				return true;
			}
		}        

        /// <summary>
        /// Returns if the specified field's value is NULL
        /// </summary>
        /// <param name="fieldname"></param>
        /// <returns></returns>
		public bool IsNull(string fieldname)
		{
			CheckField(tablename, fieldname);
			return _IsNull(fieldname);
		}

        private bool _IsNull(string fieldname)
        {
            object value = this[fieldname];
            return value == null || value == DBNull.Value;
        }

        // v6

        /// <summary>
        /// Returns if table @parentTableName's primary key's name == @childTableName's parent key's name
        /// </summary>
        /// <param name="parentTableName">The name of the parent table</param>
        /// <param name="childTableName">The name of the child table</param>
        /// <returns>If the parent table's pri key == child table's parent key</returns>
        public static bool IsPrimaryKeyForeignKey(string parentTableName, string childTableName)
        {
            // validation
            CheckTable(parentTableName);
            CheckTable(childTableName);

            if (parentTableName.Equals(childTableName))
            {
                return false;
            }

            // ??? multiple foreign keys
            string parent_PriKeyName = GetPrimaryKeyName(parentTableName);
            string child_ParentKeyName = GetParentKeyName(parentTableName);
            if (parent_PriKeyName.Equals(child_ParentKeyName))
            {
                return true;
            }
            else
            {
                return false;
            }
        }

		#region metadata methods

		public static string GetParentTablename(string tablename)
		{
			if (!tableMap.ContainsKey(tablename))
				throw new ArgumentException(string.Format("No business object has the tablename '{0}'.", tablename), "tablename");

			return parentTablenameMap.ContainsKey(tablename) ? parentTablenameMap[tablename] : null;
		}

		public static bool HasParentTable(string tablename)
		{
			if (!tableMap.ContainsKey(tablename))
				throw new ArgumentException(string.Format("No business object has the tablename '{0}'.", tablename), "tablename");

			return parentTablenameMap.ContainsKey(tablename);
		}

		public static int GetTableDepth(string tablename)
		{
			if (!tableMap.ContainsKey(tablename))
				throw new ArgumentException(string.Format("No business object has the tablename '{0}'.", tablename), "tablename");

			return depthMap[tablename];
		}

		#region metadata support

		private static TResult GetMetadata<TResult>(ReaderWriterLockSlim metadataLock, Func<TResult> f)
		{
			metadataLock.EnterReadLock();

			try
			{
				return f();
			}
			finally
			{
				metadataLock.ExitReadLock();
			}
		}

        #region TABLE Metadata

        public IDictionary<string, string> GetMetadataTableAttributes()
        {
            return GetMetadataTableAttributes(tablename);
        }

        public static IDictionary<string, string> GetMetadataTableAttributes(string tablename)
        {
            // pre-v6
            //CheckTable(tablename);
            //return GetMetadata(tableMetadataLock, () => new Dictionary<string, string>(tableMetadataMap[tablename]));

            var tableAttributes = GetMetadataTableAttributes(tablename, DEFAULT_METADATA_KEY);
            return tableAttributes.ToDictionary(a => a.Key, a => a.Value.Value, StringComparer.OrdinalIgnoreCase);
        }

        /// <summary>
        /// Gets the Table Metadata for the specified disease.
        /// </summary>
        /// <param name="tablename"></param>
        /// <param name="disease"></param>
        /// <returns></returns>
        public static IDictionary<string, KeyValuePair<bool, string>> GetMetadataTableAttributes(string tablename, string disease)
        {
            CheckTable(tablename);
            disease = _GetDisease(disease);
            return GetMetadata(tableMetadataLock,
                () => tableDiseaseMetadataMap[disease][tablename].ToDictionary(k => k.Key, v => new KeyValuePair<bool, string>(v.Value.Key, v.Value.Value), StringComparer.OrdinalIgnoreCase));
        }

        public string GetMetadataTableAttribute(string attributeName)
        {
            return GetMetadataTableAttribute(tablename, attributeName);
        }

        public static string GetMetadataTableAttribute(string tablename, string attributeName)
        {
            // pre-v6
            //CheckTable(tablename);
            //return GetMetadata(tableMetadataLock, () => tableMetadataMap[tablename][attributeName]);

            return GetMetadataTableAttribute(tablename, attributeName, DEFAULT_METADATA_KEY);
        }

        /// <summary>
        /// Gets the Table Metadata's attribute value for the specified disease. 
        /// </summary>
        /// <param name="tablename"></param>
        /// <param name="attributeName"></param>
        /// <param name="disease"></param>
        /// <returns></returns>
        public static string GetMetadataTableAttribute(string tablename, string attributeName, string disease)
        {
            CheckTable(tablename);
            disease = _GetDisease(disease);
            return GetMetadata(tableMetadataLock, () => tableDiseaseMetadataMap[disease][tablename][attributeName].Value);
        }

        public bool HasMetadataTableAttribute(string attributeName)
        {
            return HasMetadataTableAttribute(tablename, attributeName);
        }

        public static bool HasMetadataTableAttribute(string tablename, string attributeName)
        {
            // pre-v6
            //Func<bool> f = 
            //    () => tableMetadataMap.ContainsKey(tablename) && 
            //          tableMetadataMap[tablename].ContainsKey(attributeName) &&
            //          !string.IsNullOrEmpty(tableMetadataMap[tablename][attributeName]);

            //return GetMetadata(tableMetadataLock, f);
            return HasMetadataTableAttribute(tablename, attributeName, DEFAULT_METADATA_KEY);
        }

        public static bool HasMetadataTableAttribute(string tablename, string attributeName, string disease)
        {
            CheckTable(tablename);
            disease = _GetDisease(disease);
            Func<bool> f =
                    () =>
                          tableDiseaseMetadataMap.ContainsKey(disease) &&
                          tableDiseaseMetadataMap[disease].ContainsKey(tablename) &&
                          tableDiseaseMetadataMap[disease][tablename].ContainsKey(attributeName);

            return GetMetadata(tableMetadataLock, f);
        }

        public static bool HasMetadataTableAttributes(string tablename, string disease)
        {
            CheckTable(tablename);
            disease = _GetDisease(disease);
            Func<bool> f =
                    () =>
                            tableDiseaseMetadataMap.ContainsKey(disease) &&
                            tableDiseaseMetadataMap[disease].ContainsKey(tablename) &&
                            tableDiseaseMetadataMap[disease][tablename].Count() > 0;

            return GetMetadata(tableMetadataLock, f);
        }

        #endregion

        #region FIELD Metadata


        public IDictionary<string, string> GetMetadataFieldAttributes(string fieldname)
        {
            return GetMetadataFieldAttributes(tablename, fieldname);
        }

        public static IDictionary<string, string> GetMetadataFieldAttributes(string tablename, string fieldname)
        {
            // pre-v6
            //CheckTable(tablename);
            //CheckField(tablename, fieldname);
            //return GetMetadata(fieldMetadataLock, () => fieldMetadataMap[tablename][fieldname]);

            var fieldMetadata = GetMetadataFieldAttributes(tablename, fieldname, DEFAULT_METADATA_KEY);
            return fieldMetadata.ToDictionary(a => a.Key, a => a.Value.Value, StringComparer.OrdinalIgnoreCase);
        }

        public static IDictionary<string, KeyValuePair<bool, string>> GetMetadataFieldAttributes(string tablename, string fieldname, string disease)
        {
            CheckTable(tablename);
            CheckField(tablename, fieldname);
            disease = _GetDisease(disease);
            return GetMetadata(fieldMetadataLock,
                    () => fieldDiseaseMetadataMap[disease][tablename][fieldname].ToDictionary(k => k.Key, v => new KeyValuePair<bool, string>(v.Value.Key, v.Value.Value), StringComparer.OrdinalIgnoreCase));
        }

        /// <summary>
        /// Gets field metadata for all table fields in the specific disease view.
        /// </summary>
        /// <param name="tablename"></param>
        /// <param name="disease"></param>
        /// <returns></returns>
        public static Dictionary<string, Dictionary<string, KeyValuePair<bool, string>>> GetMetadataTableFieldAttributes(string tablename, string disease)
        {
            CheckTable(tablename);
            disease = _GetDisease(disease);
            return GetMetadata(fieldMetadataLock,
                () => fieldDiseaseMetadataMap[disease][tablename]);
        }

        public string GetMetadataFieldAttribute(string fieldname, string attributeName)
        {
            return GetMetadataFieldAttribute(tablename, fieldname, attributeName);
        }

        public static string GetMetadataFieldAttribute(string tablename, string fieldname, string attributeName)
        {
            // pre-v6
            //CheckTable(tablename);
            //CheckField(tablename, fieldname);
            //return GetMetadata(fieldMetadataLock, () => fieldMetadataMap[tablename][fieldname][attributeName]);

            return GetMetadataFieldAttribute(tablename, fieldname, attributeName, DEFAULT_METADATA_KEY);
        }

        public static string GetMetadataFieldAttribute(string tablename, string fieldname, string attributeName, string disease)
        {
            CheckTable(tablename);
            CheckField(tablename, fieldname);
            disease = _GetDisease(disease);
            return GetMetadata(fieldMetadataLock,
                    () => fieldDiseaseMetadataMap[disease][tablename][fieldname][attributeName].Value);
        }

        /// <summary>
        /// Returns true if the specificed table in disease view has fields with metadata
        /// </summary>
        /// <param name="tablename"></param>
        /// <param name="disease"></param>
        /// <returns></returns>
        public static bool HasMetadataTableFieldAttributes(string tablename, string disease)
        {
            CheckTable(tablename);
            disease = _GetDisease(disease);

            Func<bool> f =
                () => fieldDiseaseMetadataMap.ContainsKey(disease) &&
                      fieldDiseaseMetadataMap[disease].ContainsKey(tablename) &&
                      fieldDiseaseMetadataMap[disease][tablename].Count() > 0;

            return GetMetadata(fieldMetadataLock, f);
        }

        public bool HasMetadataFieldAttribute(string fieldname, string attributeName)
        {
            return HasMetadataFieldAttribute(tablename, fieldname, attributeName);
        }

        public static bool HasMetadataFieldAttribute(string tablename, string fieldname, string attributeName)
        {
            // pre-v6
            //Func<bool> f =
            //    () => fieldMetadataMap.ContainsKey(tablename) &&
            //          fieldMetadataMap[tablename].ContainsKey(fieldname) &&
            //          fieldMetadataMap[tablename][fieldname].ContainsKey(attributeName) &&
            //          !string.IsNullOrEmpty(fieldMetadataMap[tablename][fieldname][attributeName]);
            //return GetMetadata(fieldMetadataLock, f);

            return HasMetadataFieldAttribute(tablename, fieldname, attributeName, DEFAULT_METADATA_KEY);
        }

        public static bool HasMetadataFieldAttribute(string tablename, string fieldname, string attributeName, string disease)
        {
            CheckTable(tablename);
            CheckField(tablename, fieldname);
            disease = _GetDisease(disease);

            Func<bool> f =
                () => fieldDiseaseMetadataMap.ContainsKey(disease) &&
                      fieldDiseaseMetadataMap[disease].ContainsKey(tablename) &&
                      fieldDiseaseMetadataMap[disease][tablename].ContainsKey(fieldname) &&
                      fieldDiseaseMetadataMap[disease][tablename][fieldname].ContainsKey(attributeName) &&
                      !string.IsNullOrEmpty(fieldDiseaseMetadataMap[disease][tablename][fieldname][attributeName].Value);

            return GetMetadata(fieldMetadataLock, f);
        }

        public static bool HasMetadataFieldAttributes(string tablename, string fieldname, string disease)
        {
            CheckTable(tablename);
            CheckField(tablename, fieldname);
            disease = _GetDisease(disease);

            Func<bool> f =
                () => fieldDiseaseMetadataMap.ContainsKey(disease) &&
                      fieldDiseaseMetadataMap[disease].ContainsKey(tablename) &&
                      fieldDiseaseMetadataMap[disease][tablename].ContainsKey(fieldname);

            return GetMetadata(fieldMetadataLock, f);
        }

        public static bool HasMetadataTableFieldsAttributes(string tablename, string disease)
        {
            CheckTable(tablename);
            disease = _GetDisease(disease);

            Func<bool> f =
                () => fieldDiseaseMetadataMap.ContainsKey(disease) &&
                      fieldDiseaseMetadataMap[disease].ContainsKey(tablename);

            return GetMetadata(fieldMetadataLock, f);
        }

        #endregion

        // v6

		public string TableLabel
		{
            get
            {
                //return GetMetadataTableAttribute(MDT_TableLabel);
                return GetTableLabel(tablename);
            }
		}        

        /// <summary>
        /// Gets the Table's user friendly label
        /// </summary>
        /// <param name="tablename"></param>
        /// <returns></returns>
        public static string GetTableLabel(string tablename)
        {
            //return GetMetadataTableAttribute(tablename, MDT_TableLabel);
            return GetTableLabel(tablename, DEFAULT_METADATA_KEY);
        }

        public static string GetTableLabel(string tablename, string disease)
        {
            return GetMetadataTableAttribute(tablename, MDT_TableLabel, disease);
        }

        // v6

		public string TableDescription
		{
			get 
            {
                //return GetMetadataTableAttribute(MDT_TableDescription);
                return GetTableDescription(tablename);
            }
		}

        public static string GetTableDescription(string tablename)
        {
            //return GetMetadataTableAttribute(tablename, MDT_TableDescription);
            return GetTableDescription(tablename, DEFAULT_METADATA_KEY);
        }

        public static string GetTableDescription(string tablename, string disease)
        {
            return GetMetadataTableAttribute(tablename, MDT_TableDescription, disease);
        }

		public static bool HasTableLabel(string tablename)
		{
			//return HasMetadataTableAttribute(tablename, MDT_TableLabel);
            return HasTableLabel(tablename, DEFAULT_METADATA_KEY);
		}

        public static bool HasTableLabel(string tablename, string disease)
        {
            return HasMetadataTableAttribute(tablename, MDT_TableLabel, disease);
        }

		public static bool HasTableDescription(string tablename)
		{
			//return HasMetadataTableAttribute(tablename, MDT_TableDescription);
            return HasTableDescription(tablename, DEFAULT_METADATA_KEY);
		}

        public static bool HasTableDescription(string tablename, string disease)
        {
            return HasMetadataTableAttribute(tablename, MDT_TableDescription, disease);

        }

        // v6

		public string GetDescription(string fieldname)
		{
			return GetDescription(tablename, fieldname);
		}

		public static string GetDescription(string tablename, string fieldname)
		{
            return GetDescription(tablename, fieldname, DEFAULT_METADATA_KEY);
		}

        public static string GetDescription(string tablename, string fieldname, string disease)
        {
            return GetMetadataFieldAttribute(tablename, fieldname, MDA_FieldDescription, disease);
        }

		public string GetLabel(string fieldname)
		{
			return GetLabel(tablename, fieldname);
		}

		public static string GetLabel(string tablename, string fieldname)
		{
            // pre-v6
			//return GetMetadataFieldAttribute(tablename, fieldname, MDA_FieldLabel);
            return GetLabel(tablename, fieldname, DEFAULT_METADATA_KEY);
		}

        public static string GetLabel(string tablename, string fieldname, string disease)
        {
            return GetMetadataFieldAttribute(tablename, fieldname, MDA_FieldLabel, disease);
        } 

		public string GetControlType(string fieldname)
		{
			return GetControlType(tablename, fieldname);
		}

		public static string GetControlType(string tablename, string fieldname)
		{
            return GetControlType(tablename, fieldname, DEFAULT_METADATA_KEY);
		}

        public static string GetControlType(string tablename, string fieldname, string disease)
        {
            return GetMetadataFieldAttribute(tablename, fieldname, MDA_ControlType, disease);
        }

		public bool AllowsNullValues(string fieldname)
		{
			return AllowsNullValues(tablename, fieldname);
		}

		public static bool AllowsNullValues(string tablename, string fieldname)
		{
			CheckTable(tablename);
			CheckField(tablename, fieldname);

			DataTable table = tableMap[tablename];

			return table.Columns[fieldname].AllowDBNull;
		}

		public bool IsRequired(string fieldname)
		{
			return IsRequired(tablename, fieldname);
		}

		public static bool IsRequired(string tablename, string fieldname)
		{
            return IsRequired(tablename, fieldname, DEFAULT_METADATA_KEY);
		}

        public static bool IsRequired(string tablename, string fieldname, string disease)
        {
            if (!HasMetadataFieldAttribute(tablename, fieldname, MDA_Required, disease))
                return false;

            string s = GetMetadataFieldAttribute(tablename, fieldname, MDA_Required, disease);

            bool required;

            return bool.TryParse(s, out required) && required;
        }

		public bool IsSuppressed(string fieldname)
		{
			return IsSuppressed(tablename, fieldname);
		}

		public static bool IsSuppressed(string tablename, string fieldname)
		{
            return IsSuppressed(tablename, fieldname, DEFAULT_METADATA_KEY);
		}

        public static bool IsSuppressed(string tablename, string fieldname, string disease)
        {
            if (!HasMetadataFieldAttribute(tablename, fieldname, MDF_FieldSuppress, disease))
                return false;

            string s = GetMetadataFieldAttribute(tablename, fieldname, MDF_FieldSuppress, disease);

            bool suppressed;

            return bool.TryParse(s, out suppressed) && suppressed;
        }

		public int? GetFieldOrder(string fieldname)
		{
			return GetFieldOrder(tablename, fieldname);
		}

		public static int? GetFieldOrder(string tablename, string fieldname)
		{
            return GetFieldOrder(tablename, fieldname, DEFAULT_METADATA_KEY);
		}

        public static int? GetFieldOrder(string tablename, string fieldname, string disease)
        {
            if (!HasMetadataFieldAttribute(tablename, fieldname, MDF_FieldOrder, disease))
                return null;

            string s = GetMetadataFieldAttribute(tablename, fieldname, MDF_FieldOrder, disease);

            int order;

            if (int.TryParse(s, out order))
                return order;
            else
                return null;
        }

		public bool HasDescription(string fieldname)
		{
			return HasDescription(tablename, fieldname);
		}

		public static bool HasDescription(string tablename, string fieldname)
		{
            return HasDescription(tablename, fieldname, DEFAULT_METADATA_KEY);
		}

        public static bool HasDescription(string tablename, string fieldname, string disease)
        {
            return HasMetadataFieldAttribute(tablename, fieldname, MDA_FieldDescription, disease);
        }

		public bool HasLabel(string fieldname)
		{
			return HasLabel(tablename, fieldname);
		}

		public static bool HasLabel(string tablename, string fieldname)
		{
            return HasLabel(tablename, fieldname, DEFAULT_METADATA_KEY);
		}

        public static bool HasLabel(string tablename, string fieldname, string disease)
        {
            return HasMetadataFieldAttribute(tablename, fieldname, MDA_FieldLabel, disease);
        }

		public bool HasControlType(string fieldname)
		{
			return HasControlType(tablename, fieldname);
		}

		public static bool HasControlType(string tablename, string fieldname)
		{
            return HasControlType(tablename, fieldname, DEFAULT_METADATA_KEY);
		}

        public static bool HasControlType(string tablename, string fieldname, string disease)
        {
            return HasMetadataFieldAttribute(tablename, fieldname, MDA_ControlType, disease);
        }

		public bool HasFieldOrder(string fieldname)
		{
			return HasFieldOrder(tablename, fieldname);
		}

		public static bool HasFieldOrder(string tablename, string fieldname)
		{
            return HasFieldOrder(tablename, fieldname, DEFAULT_METADATA_KEY);
		}

        public static bool HasFieldOrder(string tablename, string fieldname, string disease)
        {
            return HasMetadataFieldAttribute(tablename, fieldname, MDF_FieldOrder, disease);
        }

		public int? GetFieldMaxLength(string fieldname)
		{
			return GetFieldMaxLength(tablename, fieldname);
		}

		public static int? GetFieldMaxLength(string tablename, string fieldname)
		{
			// CheckTable(tablename); // implied by CheckField(...)
			CheckField(tablename, fieldname);

			int length = tableMap[tablename].Columns[fieldname].MaxLength;

			if (length == -1)
				return null;

			return length;
		}

		#endregion

		#endregion

		#region validation - should these be here or abstracted in db connectivity?

		protected virtual bool ValidateInsert()
		{
			if (!ValidatePatientId())
				throw new InvalidPatientException();

			return true;
		}

		protected virtual bool ValidateUpdate()
		{
			if (!ValidatePatientId())
				throw new InvalidPatientException();

			return true;
		}
        
        // should this take a Func<?, bool> ?
		protected virtual bool ValidateSelect()
		{
            return true;
		}

		// TODO: delete with verification
		protected virtual bool ValidateDelete()
		{
			if (!ValidatePatientId())
				throw new InvalidPatientException();

			return true;
		}

		private bool ValidatePatientId()
		{
			if (!saveValidationEnabled)
				return true;

			if (this is Patient)
				return IsNull(Patient.PatientId) || saveValidationPatientId == (int) this[Patient.PatientId];

			int? pid = AssociatedPatientId;

			return !pid.HasValue || pid == saveValidationPatientId;
		}

		private void PushAncestors(string tablename, Action<string> push)
		{
			if (!HasParentTable(tablename))
				return;

			string parent = GetParentTablename(tablename);
			push(parent);

			PushAncestors(parent, push);
		}

		private int? AssociatedPatientId
		{
			get
			{
				int? id = null;
				List<string> ancestors = new List<string>();
				PushAncestors(tablename, ancestors.Add);

				Database.MultiSelectBuilder builder = new Database.MultiSelectBuilder(tablename, db);

				builder.AddField("Patients", Patient.PatientId);

				string fromTable = tablename;

				foreach (string ancestor in ancestors)
				{
					string fieldSuffix = "." + GetPrimaryKeyName(ancestor);
					string near = fromTable + fieldSuffix;
					string far = ancestor + fieldSuffix;

					builder.JoinTable(ancestor, near, far);

					fromTable = ancestor;
				}

				string parentKey = GetPrimaryKeyName(parentTablename);

				builder.AddConstraint(tablename, parentKey, this[parentKey]);

				builder.Select(
					r =>
					{
						id = r.GetInt32(0);
						return false;
					});

				return id;
			}
		}

		#endregion

		#region xml support

		public static IEnumerable<IBusinessObject> Convert(XElement xmlMetadata)
		{
			return Convert(xmlMetadata, null, null, null, null, null);
		}

		public static IEnumerable<IBusinessObject> Convert(XElement xmlMetadata, string identifierName, int? identifierValue)
		{
			return Convert(xmlMetadata, null, null, null, identifierName, identifierValue);
		}

		public static IEnumerable<IBusinessObject> Convert(
			XElement xmlMetadata,
			Action<BusinessObject, string, IDictionary<string, string>> fieldNotifier,
			Action<Func<IEnumerable<IBusinessObject>>, Action<IBusinessObject>, IEnumerable<string>, XElement> gridNotifier,
			Action<string> transitionNotifier,
			string identifierName,
			int? identifierValue)
		{
			List<BusinessObject> list = new List<BusinessObject>();

			_Convert(list, xmlMetadata, fieldNotifier, gridNotifier, transitionNotifier, identifierName, identifierValue, null, null);

			return list.Cast<IBusinessObject>();
		}

		// assumes a sorted xmlMetadataList
		public static IEnumerable<IBusinessObject> Convert(
			IEnumerable<XElement> xmlMetadataList,
			Action<BusinessObject, string, IDictionary<string, string>> fieldNotifier,
			Action<Func<IEnumerable<IBusinessObject>>, Action<IBusinessObject>, IEnumerable<string>, XElement> gridNotifier,
			Action<string> transitionNotifier,
			string identifierName,
			int? identifierValue)
		{
			// TODO: we could reorganize this to work for general xml list (grids, non-grids mixed)
			List<BusinessObject> list = new List<BusinessObject>();
			Dictionary<string, string> set = new Dictionary<string, string>();

			string previousTablename = null;

			Queue<System.Action> callbacks = new Queue<System.Action>();

			foreach (XElement x in xmlMetadataList)
			{
				string tablename = x.Name.LocalName;
				XAttribute att = x.Attribute("GridView");
				bool grid = att != null && att.Value == "True";

				if (grid)
				{
					if ((!string.IsNullOrEmpty(identifierName)) && identifierValue.HasValue)
					{
						if (!set.ContainsKey(tablename))
						{
							_Convert(list, x, fieldNotifier, gridNotifier, transitionNotifier, identifierName, identifierValue, null, null, callbacks);
						}
					}
					else
					{
						_Convert(list, x, fieldNotifier, gridNotifier, transitionNotifier, identifierName, identifierValue, null, previousTablename, callbacks);
					}
				}
				else
				{
					_Convert(list, x, fieldNotifier, gridNotifier, transitionNotifier, identifierName, identifierValue, null, null, callbacks);
				}

				set[tablename] = null;
				previousTablename = tablename;
			}

			while (callbacks.Count > 0)
				callbacks.Dequeue()();

			return list.Cast<IBusinessObject>();
        }

        #region TESTING (load grid by pri key)

        public static IEnumerable<IBusinessObject> Convert(
            IEnumerable<XElement> xmlMetadataList,
            Action<BusinessObject, string, IDictionary<string, string>> fieldNotifier,
            Action<Func<IEnumerable<IBusinessObject>>, Action<IBusinessObject>, IEnumerable<string>, XElement> gridNotifier,
            Action<string> transitionNotifier,
            IDictionary<XElement,int?> identifierNameToValue)
        {

            // TODO: we could reorganize this to work for general xml list (grids, non-grids mixed)
            List<BusinessObject> list = new List<BusinessObject>();
            //List<KeyValuePair<string, int?>> set = new List<KeyValuePair<string, int?>>();
            Dictionary<string, string> set = new Dictionary<string, string>();

            string previousTablename = null;

            Queue<System.Action> callbacks = new Queue<System.Action>();

            foreach (XElement x in xmlMetadataList)
            {
                string tablename = x.Name.LocalName;
                XAttribute att = x.Attribute("GridView");
                bool grid = att != null && att.Value == "True";

                string identifierName = BusinessObject.GetPrimaryKeyName(tablename);
                int? identifierValue =  identifierNameToValue.ContainsKey(x) ? identifierNameToValue[x] : null;;

                if (grid)
                {
                    if ((!string.IsNullOrEmpty(identifierName)) && identifierValue.HasValue)
                    {
                        //if (!set.ContainsKey(tablename))
                        {
                            _Convert(list, x, fieldNotifier, gridNotifier, transitionNotifier, identifierName, identifierValue, null, previousTablename, callbacks);
                        }
                    }
                    else
                    {
                        _Convert(list, x, fieldNotifier, gridNotifier, transitionNotifier, identifierName, identifierValue, null, previousTablename, callbacks);
                    }
                }
                else
                {
                    _Convert(list, x, fieldNotifier, gridNotifier, transitionNotifier, identifierName, identifierValue, null, null, callbacks);
                }

                set[tablename] = null;
                previousTablename = tablename;
            }

            while (callbacks.Count > 0)
                callbacks.Dequeue()();

            return list.Cast<IBusinessObject>();
        }

        #endregion

        private static void _Convert(
			List<BusinessObject> accum,
			XElement xmlMetadata,
			Action<BusinessObject, string, IDictionary<string, string>> fieldCallback,
			Action<Func<IEnumerable<IBusinessObject>>, Action<IBusinessObject>, IEnumerable<string>, XElement> gridCallback,
			Action<string> transitionCallback,
			string identifierName,
			int? identifierValue,
			BusinessObject parent, // necessary anymore?
			string previousTablename)
		{
			Queue<System.Action> callbacks = new Queue<System.Action>();

			_Convert(accum, xmlMetadata, fieldCallback, gridCallback, transitionCallback, identifierName, identifierValue, parent, previousTablename, callbacks);

			while (callbacks.Count > 0)
				callbacks.Dequeue()();
		}

		private static void _Convert(
			List<BusinessObject> accum,
			XElement xmlMetadata,
			Action<BusinessObject, string, IDictionary<string, string>> fieldCallback,
			Action<Func<IEnumerable<IBusinessObject>>, Action<IBusinessObject>, IEnumerable<string>, XElement> gridCallback,
			Action<string> transitionCallback,
			string identifierName,
			int? identifierValue,
			BusinessObject parent, // necessary anymore?
			string previousTablename,
			Queue<System.Action> callbacks)
		{
			string tablename = xmlMetadata.Name.LocalName;

			CheckTable(tablename);

			if (transitionCallback != null && tablename != previousTablename)
				callbacks.Enqueue(() => transitionCallback(tablename));

			XAttribute att = xmlMetadata.Attribute("GridView");

			if (att != null && att.Value == "True")
			{
				// accumulate fields (note that we don't allow subtables here)
				IEnumerable<string> selectedFields;
				List<string> selectedFieldList = new List<string>();

				foreach (XElement child in xmlMetadata.Elements())
				{
					string name = child.Name.LocalName;

					if (HasField(tablename, name))
						selectedFieldList.Add(name);
				}

				selectedFields = selectedFieldList.Count != 0 ? selectedFieldList : GetFieldNames(tablename);

				// handle grid view
				IList<BusinessObject> bizos;

				//if (identifier != null && identifier.Count > 0)
				//    bizos = GetByParent(tablename, identifier);

				if ((!string.IsNullOrEmpty(identifierName)) && identifierValue.HasValue)
				{
					if (parent != null && parent.children.Count(b => b.tablename == tablename) > 0)
						return;
					//else if (accum.Count(b => b.tablename == tablename) > 0)
					//	return;

					bizos = new List<BusinessObject>(_GetByFields(tablename, new Dictionary<string, object>() { { identifierName, identifierValue.Value } }));
				}
				else
				{
					BusinessObject b = BusinessObjectFactory.BuildBusinessObject(tablename);

					foreach (XElement child in xmlMetadata.Elements())
					{
						string name = child.Name.LocalName;

						if (b.HasField(name) && !string.IsNullOrEmpty(child.Value))
							b[name] = System.Convert.ChangeType(child.Value, b.GetDataType(name));
					}

					bizos = new List<BusinessObject>();
					bizos.Add(b);
				}

				if (parent != null)
					bizos.ForEach(b => b.db = parent.db);

				// TODO: store last Action<IBusinessObject> for accumulation? also need previous tablename

				if (gridCallback != null)
				{
					// the following would be the same unless the tablename changes
					Func<IEnumerable<IBusinessObject>> f;
					Action<IBusinessObject> a;

					if (tablename != previousTablename)
					{
						if (parent != null)
						{
							f = () => parent.Children.Where(x => x.TableName == tablename); // Where tablename matches
							a = b => parent.AddChild(b as BusinessObject);

							bizos.ForEach(b => a(b));
						}
						else
						{
							f = () => accum.Cast<IBusinessObject>().Where(x => x.TableName == tablename);
							a = b =>
								{
									BusinessObject bo = b as BusinessObject;

                                    if (bo.HasField(identifierName) && bo.PrimaryKeyName != identifierName && identifierValue.HasValue)
                                        bo[identifierName] = identifierValue.Value;

									accum.Add(bo);
								};

							accum.AddRange(bizos);
						}

						callbacks.Enqueue(() => gridCallback(f, a, selectedFields, xmlMetadata)); // databinds...

						// TODO: xmlMetadata could be via a Func<XElement> that returns the last child of the parent matching the same tablename
					}
					else
					{
						accum.AddRange(bizos);
					}
				}
				else
				{
					accum.AddRange(bizos);
				}
			}
			else
			{
				BusinessObject b = BusinessObjectFactory.BuildBusinessObject(tablename);

				//if (parent != null)
				//    parent.AddChild(b);

				if (parent != null)
					b.db = parent.db;

				bool retrieved = false;

				string p = tablename;

				foreach (XElement child in xmlMetadata.Elements())
				{
					string name = child.Name.LocalName;

					if (b.HasField(name))
					{
						if (!string.IsNullOrEmpty(child.Value))
						{
							// do we catch exceptions here?
							b[name] = System.Convert.ChangeType(child.Value, b.GetDataType(name));
						}

						if (fieldCallback == null)
							continue;

						Dictionary<string, string> atts = new Dictionary<string, string>();

						child.Attributes().ForEach(a => atts[a.Name.LocalName] = a.Value);

						callbacks.Enqueue(() => fieldCallback(b, name, atts));
					}
					else if (tablename == BusinessObject.GetParentTablename(name))
					{
						if ((!string.IsNullOrEmpty(identifierName)) && identifierValue.HasValue)
						{
							b.Get(identifierValue.Value);
							retrieved = true;
						}

						_Convert(b.children, child, fieldCallback, gridCallback, transitionCallback, identifierName, identifierValue, b, p, callbacks);

						p = name;
					}
					else
					{
						// bogon
						throw new ArgumentException(string.Format(@"The name '{0}' is neither a fieldname or child tablename of the table: {1}. Please confirm the validity of your xml.", name, tablename), "xmlTree");
					}
				}

				if (!retrieved)
				{
					if ((!string.IsNullOrEmpty(identifierName)) && identifierValue.HasValue)
						b.Get(identifierValue.Value);
				}

				accum.Add(b);
			}
		}

		private static void PercolateDatabase(BusinessObject b)
		{
			foreach (BusinessObject child in b.children)
			{
				child.db = b.db;
				PercolateDatabase(child);
			}
		}

		public static IEnumerable<string> EnumerateFieldnames(XElement metadata)
		{
			string tablename = metadata.Name.LocalName;

			foreach (XElement child in metadata.Elements())
			{
				string name = child.Name.LocalName;

				if (HasField(tablename, name))
					yield return name;
				else
					foreach (string f in EnumerateFieldnames(child))
						yield return f;
			}
		}

		#endregion

		// sort of tablenames, parent > child
		public static List<string> SortTablenamesByParent(IEnumerable<string> tablenames)
		{
			List<string> list = new List<string>(tablenames);

			list.Sort((x, y) => GetTableDepth(x).CompareTo(GetTableDepth(y)));

			return list;
		}

		// TODO: generic method for sorting types via a Func on said type that returns a tablename
		public static List<T> SortTablenamesByParent<T>(IEnumerable<T> items, Func<T, string> getTablename)
		{
			List<T> list = new List<T>(items);

			list.Sort((x, y) => GetTableDepth(getTablename(x)).CompareTo(GetTableDepth(getTablename(y))));

			return list;
		}

		// search the tree for a business object
		internal BusinessObject Search(string tablename, int order)
		{
			return Search(tablename, order, 0);
		}

		private BusinessObject Search(string tablename, int desiredOrder, int currentOrder)
		{
			if (this.tablename == tablename && desiredOrder == currentOrder)
			{
				return this;
			}
			else
			{
				int i = 0;
				string lastTablename = null;

				foreach (BusinessObject child in children)
				{
					i = child.tablename == lastTablename ? i + 1 : 0;

					BusinessObject b = Search(tablename, desiredOrder, i);

					if (b != null)
						return b;

					lastTablename = child.tablename;
				}
			}

			return null;
		}

		// handle inside/outside eforms
		private string GetUserName()
		{
			string username = new SecurityController().GetUserName();

			//if (InsideEForm)
			//    return username + " (eform)";
			//else
			//    return username;

			if (!string.IsNullOrEmpty(userNameComment))
				return username + " (" + userNameComment + ")";
			else
				return username;
		}

		protected int? Insert()
		{
			if (!ValidateInsert())
				throw new InvalidInsertException();

			if (useEnteredBy)
				record[EnteredBy] = GetUserName();

			if (useEnteredTime)
				record[EnteredTime] = DateTime.Now;

			var filteredFieldNames =
				from f in RealFieldNames
				where oneToOne || f != primaryKeyName
				select f;

			int? identity = db.Insert(tablename, s => record[s], filteredFieldNames, VirtualFieldNames, oneToOne, primaryKeyName);

			if (identity.HasValue)
			{
				record[PrimaryKeyName] = identity;
			}
			else if (!oneToOne)
			{
				#region msg
				string msg = "Scope_Identity() failed for table {0}, whose primary key is not one of its foreign keys. Please verify the attributes applied to the business object.";
				#endregion
				throw new ApplicationException(string.Format(msg, tablename));
			}

			return identity;
		}

		protected int Update()
		{
			if (!ValidateUpdate())
				throw new InvalidUpdateException();

			if (useUpdatedBy)
				record[UpdatedBy] = GetUserName();

			if (useUpdatedTime)
				record[UpdatedTime] = DateTime.Now;

			var filteredFieldNames =
				from f in RealFieldNames
				where !(f == primaryKeyName ||
						f == EnteredBy ||
						f == EnteredTime)
				select f;

			return db.Update(tablename, s => record[s], filteredFieldNames, VirtualFieldNames, PrimaryKeyName);
		}

		private string GetFieldName(int fieldIndex)
		{
			return record.Table.Columns[fieldIndex].ColumnName;
		}

		private Type GetDataType(string fieldname)
		{
			if (!HasField(fieldname))
				throw new ArgumentException(string.Format("The business object for the {0} table does not contain the field '{1}'.", tablename, fieldname));

			return record.Table.Columns[fieldname].DataType;
		}

		private bool ShouldBeDBNull(string fieldname, object value)
		{
			if (value is string && (value as string) == "")
			{
				return true;
			}
			else if (HasField(fieldname) && GetDataType(fieldname) == typeof(DateTime) && value == null)
			{
				return true;
			}
			else
			{
				return false;
			}
		}

		private bool ShouldBeDBNull(int fieldIndex, object value)
		{
			return ShouldBeDBNull(GetFieldName(fieldIndex), value);
		}

        /// <summary>
        /// Gets a normalized disease lookup key
        /// </summary>
        /// <param name="disease"></param>
        /// <returns>A normalized disease lookup key, i.e, non null or empty</returns>
        private static string _GetDisease(string disease)
        {
            return !string.IsNullOrEmpty(disease) ? disease : DEFAULT_METADATA_KEY;
        }
	}
}
