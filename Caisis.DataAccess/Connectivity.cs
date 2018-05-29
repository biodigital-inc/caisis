using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Text;

using Caisis.Security;

namespace Caisis.DataAccess
{
    public class Connectivity
    {
        #region utilities
        delegate T UseConnectionDelegate<T>(SqlConnection connection);
        delegate string CrudDelegate(DataTable table, IEnumerable<string> restrictions);
        delegate T ExecutionDelegate<T>(SqlCommand command, DataTable table);

        private static T Crud<T>(string tablename, List<KeyValuePair<string, int>> primaryKey,
            DataTable table, CrudDelegate f, ExecutionDelegate<T> execsql)
        {
            SqlCommand cmd = new SqlCommand(f(table, ExtractKeys<string, int>(primaryKey)));

            foreach (KeyValuePair<string, int> kvp in primaryKey)
            {
                SqlCommandUtils.AddInputParam(cmd, kvp.Key, kvp.Value);
            }

            return execsql(cmd, table);
        }

        public static SqlConnection GetConnection()
        {
            string dbConnStr = System.Configuration.ConfigurationSettings.AppSettings["dbConnectionString"];

            if (ConfigurationSettings.AppSettings["encryptDbConnectString"] != null && ConfigurationSettings.AppSettings["encryptDbConnectString"].ToString().Equals("true"))
            {
                dbConnStr = CustomCryptoHelper.Decrypt(dbConnStr);
            }

            return new SqlConnection(dbConnStr);
        }

        private static T ExecuteUsingConnection<T>(UseConnectionDelegate<T> useConnectionDelegate)
        {
            T result;

            using (SqlConnection connection = GetConnection())
            {
                connection.Open();

                result = useConnectionDelegate(connection);
            }

            return result;
        }

        private static int FillTable(SqlCommand command, DataTable table)
        {
            return ExecuteUsingConnection<int>(
                delegate (SqlConnection connection)
                {
                    command.Connection = connection;
                    SqlDataAdapter adapter = new SqlDataAdapter(command);
                    return adapter.Fill(table);
                }
            );
        }

        private static int ExecuteNonQuery(SqlCommand command)
        {
            return ExecuteUsingConnection<int>(
                delegate (SqlConnection connection)
                {
                    command.Connection = connection;
                    return command.ExecuteNonQuery();
                }
            );
        }

        private static int ExecuteScalar(SqlCommand command)
        {
            return ExecuteUsingConnection<int>(
                delegate (SqlConnection connection)
                {
                    command.Connection = connection;
                    return (int) command.ExecuteScalar();
                }
            );
        }
        #endregion

        #region delete

        // reuse the connection of other delete commands
        private static SqlCommand BuildAuditDeleteCommand(string tablename, string username, string pkname1, string pkvalue1,
            string pkname2, string pkvalue2)
        {
            SqlCommand cmd = new SqlCommand("spUpdateAuditLogDeletedBy");
            cmd.CommandType = CommandType.StoredProcedure;

            // TableName, UserName, PKColumnName1, PKColumnValue1, PKColumnName2?, PKColumnValue2?
            SqlCommandUtils.AddInputParam(cmd, "TableName", tablename);
            SqlCommandUtils.AddInputParam(cmd, "UserName", username);
            SqlCommandUtils.AddInputParam(cmd, "PKColumnName1", pkname1);
            SqlCommandUtils.AddInputParam(cmd, "PKColumnValue1", pkvalue1);

            if (pkname2 != null && pkname2 != "" && pkvalue2 != null && pkvalue2 != "")
            {
                SqlCommandUtils.AddInputParam(cmd, "PKColumnName2", pkname2);
                SqlCommandUtils.AddInputParam(cmd, "PKColumnValue2", pkvalue2);
            }

            return cmd;
        }

        protected internal static int Delete(SqlCommand deleteCommand, SqlCommand auditCommand)
        {
            // return ExecuteNonQuery(command);

            return ExecuteUsingConnection<int>(
                delegate(SqlConnection connection)
                {
                    deleteCommand.Connection = connection;
                    auditCommand.Connection = connection;

                    int rowsAffected = deleteCommand.ExecuteNonQuery();
                    auditCommand.ExecuteNonQuery();

                    return rowsAffected;
                }
            );
        }

        public static int Delete(string tablename, string username, string primaryKeyName, int primaryKey, bool deleteVirtualValues)
        {
			string sql;

			if (deleteVirtualValues)
			{
				sql = SqlBuilder.BuildVirtualParameterizedDeleteStatement(tablename, primaryKeyName);
			}
			else
			{
				sql = SqlBuilder.BuildParameterizedDeleteStatement(tablename, primaryKeyName);
			}

            SqlCommand command = new SqlCommand(sql);
            SqlCommandUtils.AddIntInputParam(command, primaryKeyName, primaryKey);

			if (deleteVirtualValues)
			{
				command.Parameters.Add(new SqlParameter("@TableName", tablename));
				command.Parameters.Add(new SqlParameter("@PrimaryKey", primaryKey));
			}

            return Delete(command, BuildAuditDeleteCommand(tablename, username, primaryKeyName, primaryKey.ToString(), null, null));
        }

        public static int Delete(string tablename, string username, List<KeyValuePair<string, int>> primaryKey)
        {
            // TODO: we could use an enumerator here. seems like a waste to make a copy of a collection
            IEnumerable<string> keys = ExtractKeys<string, int>(primaryKey);

            string sql = SqlBuilder.BuildParameterizedDeleteStatement(tablename, keys);

            SqlCommand command = new SqlCommand(sql);

            foreach (KeyValuePair<string, int> kvp in primaryKey)
            {
                SqlCommandUtils.AddInputParam(command, kvp.Key, kvp.Value);
            }

            SqlCommand dcmd;

            if (primaryKey.Count > 1)
            {
                dcmd = BuildAuditDeleteCommand(tablename, username, primaryKey[0].Key, primaryKey[0].Value.ToString(),
                    primaryKey[1].Key, primaryKey[1].Value.ToString());
            }
            else
            {
                dcmd = BuildAuditDeleteCommand(tablename, username, primaryKey[0].Key, primaryKey[0].Value.ToString(), null, null);
            }

            return Delete(command, dcmd);
        }
        #endregion

        #region get
        protected internal static int Get(SqlCommand command, DataTable table)
        {
            return FillTable(command, table);
        }

		protected internal static DataView Get(SqlCommand command)
		{
			DataTable table = new DataTable();
			FillTable(command, table);
			return table.DefaultView;
		}

        public static int Get(string tablename, string primaryKeyName, int primaryKey, DataTable table)
        {
            string sql = SqlBuilder.BuildParameterizedSelectByStatement(tablename, primaryKeyName);

            SqlCommand command = new SqlCommand(sql);
            SqlCommandUtils.AddIntInputParam(command, primaryKeyName, primaryKey);

            return Get(command, table);
        }

        public static int Get(string tablename, List<KeyValuePair<string, int>> primaryKey, DataTable table)
        {
            IEnumerable<string> keys = ExtractKeys<string, int>(primaryKey);

            // our various CRUD statements differ only via this method call (all share the same signature?)
            string sql = SqlBuilder.BuildParameterizedSelectByStatement(tablename, keys);

            SqlCommand command = new SqlCommand(sql);

            foreach (KeyValuePair<string, int> kvp in primaryKey)
            {
                SqlCommandUtils.AddInputParam(command, kvp.Key, kvp.Value);
            }

            return Get(command, table);
        }

        public static int GetAll(string tablename, DataTable table)
        {
            string sql = SqlBuilder.BuildParameterizedSelectByStatement(tablename, "");

            SqlCommand command = new SqlCommand(sql);

            return Get(command, table);
        }

        public static int GetDistinctForLookup(string tablename, string valuefield, string textfield, 
            string restrictions, string order, DataTable table)
        {
            SqlCommand command = new SqlCommand(SqlBuilder.BuildLookupDistinctStatement(tablename, valuefield, textfield, restrictions, order));
            return Get(command, table);
        }

        public static int GetByField(string tablename, string fieldname, object fieldvalue, DataTable table)
        {
            string sql = SqlBuilder.BuildParameterizedSelectByStatement(tablename, fieldname);

            SqlCommand command = new SqlCommand(sql);
            SqlCommandUtils.AddInputParam(command, fieldname, fieldvalue);

            return Get(command, table);
        }

		// uses new QueryBuilder
		public static int Get(QueryBuilder query, DataTable table)
		{
			SqlCommand command = new SqlCommand(query.ToSql());

			foreach (string k in query.Parameters.Keys)
			{
				SqlCommandUtils.AddInputParam(command, k, query.Parameters[k]);
			}

			return Get(command, table);
		}

        public static int GetChildren(string tablename, string parentKeyName, int parentKey, DataTable table)
        {
            // actually this is just an alias for Get, put here for clarity and convenience
            return Get(tablename, parentKeyName, parentKey, table);
        }

		// TODO: add support for virtual fields

		public static int Get(string tablename, string primaryKeyName, int primaryKey, IEnumerable<string> virtualFields, DataTable table)
		{
			SqlCommand command = new SqlCommand(SqlBuilder.BuildVirtualParameterizedSelectStatement(tablename, primaryKeyName, primaryKeyName, virtualFields));
			SqlCommandUtils.AddIntInputParam(command, primaryKeyName, primaryKey);

			return Get(command, table);
		}

		public static int GetByField(string tablename, string fieldname, object fieldvalue, string primaryKeyName, IEnumerable<string> virtualFields, DataTable table)
		{
			SqlCommand command = new SqlCommand(SqlBuilder.BuildVirtualParameterizedSelectStatement(tablename, primaryKeyName, fieldname, virtualFields));
			SqlCommandUtils.AddInputParam(command, fieldname, fieldvalue);

			return Get(command, table);
		}

		public static int GetChildren(string tablename, string primaryKeyName, string parentKeyName, int parentKey, IEnumerable<string> virtualFields, DataTable table)
		{
			SqlCommand command = new SqlCommand(SqlBuilder.BuildVirtualParameterizedSelectStatement(tablename, primaryKeyName, parentKeyName, virtualFields));
			SqlCommandUtils.AddIntInputParam(command, parentKeyName, parentKey);

			return Get(command, table);
		}

        /// <summary>
        /// For the specified field name, return the values as a List of T.
        /// </summary>
        /// <typeparam name="T"></typeparam>
        /// <param name="cmd"></param>
        /// <param name="fieldName"></param>
        /// <returns></returns>
        public static List<T> GetPrimitiveValues<T>(SqlCommand cmd, string fieldName) where T : struct
        {
            return GetPrimitiveValues<T>(cmd, fieldName, null);
        }

        /// <summary>
        /// For the specified field index, return the values as a List of T.
        /// </summary>
        /// <typeparam name="T"></typeparam>
        /// <param name="cmd"></param>
        /// <param name="fieldIndex"></param>
        /// <returns></returns>
        public static List<T> GetPrimitiveValues<T>(SqlCommand cmd, int fieldIndex) where T : struct
        {
            return GetPrimitiveValues<T>(cmd, "", fieldIndex);
        }

        private static List<T> GetPrimitiveValues<T>(SqlCommand cmd, string fieldName, int? fieldIndex) where T : struct
        {
            int? index = null;
            if (fieldIndex.HasValue)
                index = fieldIndex.Value;
            List<T> values = new List<T>();
            DataAccess.Connectivity.ConsumeRecord(cmd, (r) =>
            {
                if (!index.HasValue)
                    index = r.GetOrdinal(fieldName);
                // add non-null values, add empty string?
                if (!r.IsDBNull(index.Value))
                    values.Add((T)r.GetValue(index.Value));
                return true;
            });
            return values;
        }

        #region deidentification

        private static List<string> DeidentifyColumns(List<string> columns, Dictionary<string, DeidentifyOptions> map)
        {
            List<string> deidentified = new List<string>();

            foreach (string c in columns)
            {
                if (map.ContainsKey(c))
                {
                    switch (map[c])
                    {
                        case DeidentifyOptions.MaskDate:
                            // Year([columnName]) As columnName
                            StringBuilder temp = new StringBuilder("Year ([");
                            temp.Append(c);
                            temp.Append("]) As ");
                            temp.Append(c);
                            deidentified.Add(temp.ToString());
                            break;
                        case DeidentifyOptions.Omit:
                            break;
                        case DeidentifyOptions.Randomize:
                            // do nothing for now; PatientId will be handled by HARDCODE
                            break;
                        case DeidentifyOptions.None:
                            deidentified.Add(c);
                            break;
                    }
                }
                else
                {
                    deidentified.Add(c);
                }
            }

            return deidentified;
        }

        #endregion

        #endregion

        #region insert
        protected internal static int Insert(SqlCommand command)
        {
            return ExecuteScalar(command);
        }

        protected internal static int InsertBatch(SqlCommand command)
        {
            return ExecuteNonQuery(command);
        }

        public static int Insert(string tablename, IEnumerable<string> columnNames, DataRow row, IEnumerable<string> virtualFields)
        {
            string sql = SqlBuilder.BuildParameterizedInsertStatement(tablename, columnNames, true, virtualFields);

            SqlCommand command = new SqlCommand(sql);

			SqlCommandUtils.SetParams(command, columnNames, row);
            
			// also need to set params for tablename and virtual fields
			bool setTablename = true;
			int i = 1;

			foreach (string f in virtualFields)
			{
				if (setTablename)
				{
					command.Parameters.Add(new SqlParameter("@TableName", tablename));
					setTablename = false;
				}

				// set @FNi, @FVi for i in [1, vf count]
				command.Parameters.Add(new SqlParameter(string.Format("@FN{0}", i), f));
				command.Parameters.Add(new SqlParameter(string.Format("@FV{0}", i), row[f].ToString()));

				i++;
			}

            return Insert(command);
        }

        public static void InsertWithoutIdentity(string tablename, IEnumerable<string> columnNames, DataRow row)
        {
            string sql = SqlBuilder.BuildParameterizedInsertStatement(tablename, columnNames, false, null);

            SqlCommand command = new SqlCommand(sql);
            SqlCommandUtils.SetParams(command, columnNames, row);

            ExecuteNonQuery(command);
        }
        #endregion

        #region update
        protected internal static int Update(SqlCommand command)
        {
            return ExecuteNonQuery(command);
        }

		//public static int Update(string tablename, IEnumerable<string> columnNames, string keyName, DataRow row)
		//{
		//    string sql = SqlBuilder.BuildParameterizedUpdateByStatement(tablename, columnNames, keyName);

		//    // TODO: filter virtual fields but not primary key
			
		//    SqlCommand command = new SqlCommand(sql);
		//    SqlCommandUtils.SetParams(command, row);

		//    return Update(command);
		//}

        public static int Update(string tablename, IEnumerable<string> columnNames, IEnumerable<string> keyNames, DataRow row, IEnumerable<string> virtualFields)
        {
            string sql = SqlBuilder.BuildParameterizedUpdateByStatement(tablename, columnNames, keyNames, virtualFields);

            SqlCommand command = new SqlCommand(sql);

			// TODO: filter virtual fields but not primary key

            SqlCommandUtils.SetParams(command, columnNames, row);
			SqlCommandUtils.SetParams(command, keyNames, row);

			// TODO: add virtual fields params [@TableName, @FNi, @FVi, @PrimaryKey]
			// we could change @PrimaryKey -> @[$PrimaryKeyName], reusing the primary key param from the main update statement
			bool runOnce = true;
			int i = 1;

			foreach (string f in virtualFields)
			{
				if (runOnce)
				{
					string primaryKeyName = null;

					foreach (string k in keyNames)
					{
						primaryKeyName = k;
						break;
					}

					command.Parameters.Add(new SqlParameter("@TableName", tablename));
					command.Parameters.Add(new SqlParameter("@PrimaryKey", row[primaryKeyName]));
					runOnce = false;
				}

				// set @FNi, @FVi for i in [1, vf count]
				command.Parameters.Add(new SqlParameter(string.Format("@FN{0}", i), f));
				command.Parameters.Add(new SqlParameter(string.Format("@FV{0}", i), row[f].ToString()));

				i++;
			}

            return Update(command);
        }

		//public static int Update(DataRow row)
		//{
		//    string tablename = row.Table.TableName;
		//    string primaryKeyName = row.Table.PrimaryKey[0].ColumnName;
		//    List<string> columnNames = new List<string>();

		//    // we should reuse what's in BizObject atm !!!
		//    foreach (DataColumn column in row.Table.Columns)
		//    {
		//        columnNames.Add(column.ColumnName);
		//    }

		//    return Update(tablename, columnNames, primaryKeyName, row);
		//}
        #endregion

		#region record consumption - for folks who like closures and dependency injection :)

		/// <summary>
		/// Database record consumption delegate using IDataRecord as a parameter.
		/// </summary>
		/// <param name="record">a read-only handle to the record</param>
		/// <returns>return true to continue reading, false to terminate reading</returns>
		public delegate bool RecordConsumerDelegate(IDataRecord record);

		internal static void ConsumeRecord(SqlCommand command, RecordConsumerDelegate consumer)
		{
			using (SqlConnection connection = GetConnection())
			{
				command.Connection = connection;
				
				if (connection.State != ConnectionState.Open)
				{
					connection.Open();
				}

				using (SqlDataReader reader = command.ExecuteReader())
				{
					while (reader.Read())
					{
						if (!consumer(reader))
						{
							break;
						}
					}
				}
			}
		}

		#endregion

		private static IEnumerable<TKey> ExtractKeys<TKey,TValue>(List<KeyValuePair<TKey, TValue>> keyValuePairs)
        {
            foreach (KeyValuePair<TKey, TValue> kvp in keyValuePairs)
            {
                yield return kvp.Key;
            }
        }
    }
}
