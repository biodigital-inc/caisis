using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;



namespace Caisis.DataAccess
{
	/// <summary>
	/// Handles database calls that are relevant to all tables
	/// </summary>
	public class GlobalDa
	{
		public GlobalDa()
		{
			//
			// TODO: Add constructor logic here
			//
		}

		public int GetRecordCount(string tableName, string fieldName, int parentKey)  
		{
			SqlCommand com = DataAccessHelper.CreateCommand("spGetRecordCountById");
			DataAccessHelper.AddStringInputParam(com, "TableName", tableName);	
			DataAccessHelper.AddStringInputParam(com, "FieldName", fieldName);	
			DataAccessHelper.AddIntInputParam(com, "Id", parentKey);
	
			DataAccessHelper.AddIntOutputParam(com, "Rowcount");

			Hashtable outParams = DataAccessHelper.ExecuteScalar(com);
			
			if(outParams["Rowcount"] != System.DBNull.Value)
			{
				return (int)outParams["Rowcount"];
			}
			else
			{
				return -1;
			}
		}

        /// <summary>
        /// Returns a normalized view of multiple tables based on their display value and sort order
        /// </summary>
        /// <param name="tableKeySortFields"></param>
        /// <param name="priKeys"></param>
        /// <returns></returns>
        public static DataTable GetRecordByTableAndFields(Dictionary<KeyValuePair<string, string>, KeyValuePair<string, string>> tableKeySortFields, Dictionary<string, IEnumerable<int>> priKeys)
        {
            string sql = @"
            SELECT	   
                '{0}' AS TableName,
                a.{1} AS PrimaryKey,
                {2} AS DisplayField,
                {3} AS SortValue
            FROM {0} a
            WHERE
	            a.{1} IN ({5})
             ";

            List<string> buffer = new List<string>();
            foreach (var tablePair in tableKeySortFields)
            {
                string tableName = tablePair.Key.Key;
                string priKeyName = tablePair.Key.Value;
                string tableDisplayField = tablePair.Value.Key;
                string tableSortField = tablePair.Value.Value;
                string naturalSortField = priKeyName;
                string tablePriKeys = string.Join(",", priKeys[tableName].Select(a => a.ToString()).ToArray());
                // normalize value
                if (string.IsNullOrEmpty(tableDisplayField))
                {
                    tableDisplayField = "''";
                }
                if (string.IsNullOrEmpty(tableSortField))
                {
                    tableSortField = "''";
                }

                string[] formatParams = new string[] { tableName, priKeyName, tableDisplayField, tableSortField, naturalSortField, tablePriKeys };
                string formattedSQL = string.Format(sql, formatParams);

                buffer.Add(formattedSQL);
            }

            string fullSQL = string.Join(" UNION ", buffer.ToArray());
            // build command
            SqlCommand com = DataAccessHelper.CreateSqlCommand(fullSQL);
            DataTable dt = DataAccessHelper.GetRecord(com).Tables[0];
            return dt;
        }

	}
}
