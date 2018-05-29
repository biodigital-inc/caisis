using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;

namespace Caisis.DataAccess
{
    // TODO: move me to Caisis.DataAccess once that namespace no longer depends on Caisis.BusinessObject

    public class SqlCommandUtils
    {
        // TODO: this is already in DataAccess helper IIRC
        public static bool AddIntInputParam(SqlCommand com, string key, object val)
        {
            SqlParameter param = new SqlParameter("@" + key, System.Data.SqlDbType.Int);
            if (val is int)
            {
                param.Value = val;
            }
            else if (val == DBNull.Value)
            {
                throw new Exception("Input parameter " + key + " was not of type int.");
            }

            com.Parameters.Add(param);

            return true;
        }

        public static bool AddInputParam(SqlCommand com, string key, object val)
        {
            com.Parameters.Add(new SqlParameter("@" + key, val));

            return true;
        }

		public static void SetParams(SqlCommand com, DataRow dr)
		{
			foreach (DataColumn column in dr.Table.Columns)
			{
				com.Parameters.Add(new SqlParameter("@" + column.ColumnName, dr[column.ColumnName]));
			}
		}

		public static void SetParams(SqlCommand com, IEnumerable<string> columnNames, DataRow dr)
		{
			foreach (string columnName in columnNames)
			{
				if (dr.Table.Columns.Contains(columnName))
				{
					com.Parameters.Add(new SqlParameter("@" + columnName, dr[columnName]));
				}
			}
		}

		public static void SetParams(SqlCommand cmd, IEnumerable<KeyValuePair<string, object>> keyValuePairs)
		{
			foreach (KeyValuePair<string, object> kvp in keyValuePairs)
			{
				cmd.Parameters.Add(new SqlParameter("@" + kvp.Key, kvp.Value));
			}
		}
    }
}
