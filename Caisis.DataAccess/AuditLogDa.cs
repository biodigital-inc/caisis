using System;
using System.Data;
using System.Data.SqlClient;
using System.Collections.Generic;
using System.Text;

namespace Caisis.DataAccess
{
    public class AuditLogDa : BaseDA
    {
        /// <summary>
        /// Get the audit log for a specific record in the database.
        /// </summary>
        /// <param name="tableName">The name of the table containing the record.</param>
        /// <param name="priKeyName">The name of the primary key of the table to be audited.</param>
        /// <param name="priKeyValue">the value of the primary key to be audited</param>
        /// <returns></returns>
		//public DataTable GetAuditByTableAndPrimaryKey(string tableName, string priKeyName, int priKeyValue, bool tableHasVirtualFields)
		//{
		//    SqlConnection con = Connectivity.GetConnection();
		//    SqlCommand comm = new SqlCommand("select * from AuditLog_" + tableName + " where " + priKeyName + "=" + priKeyValue + " ORDER BY LoggedTime DESC", con);
		//    DataTable dt = new DataTable();
		//    DataAccessHelper.GetList(comm, dt);
		//    return dt;
		//}

        /// <summary>
        /// Get the audit log for a specific record in the database with only the columns specified in the selectFields list.
        /// </summary>
        /// <param name="tableName"></param>
        /// <param name="priKeyName"></param>
        /// <param name="priKeyValue"></param>
        /// <param name="selectFields">List of fields to retrieve for the log</param>
        /// <returns></returns>
        public DataTable GetAuditByTableAndPrimaryKey(string tableName, string priKeyName, int priKeyValue, IEnumerable<string> inclusionFields)
        {
			//if (inclusionFields.Count == 0)
			//{
			//    return GetAuditByTableAndPrimaryKey(tableName, priKeyName, priKeyValue);
			//}
            SqlConnection con = Connectivity.GetConnection();
            string fieldsString = "";
            foreach (string s in inclusionFields)
            {
                fieldsString += s + ",";
            }
            fieldsString = fieldsString.Remove(fieldsString.Length - 1);
			// TODO: support virtual fields
            SqlCommand comm = new SqlCommand("select " + fieldsString + " from AuditLog_" + tableName + " where " + priKeyName + "=" + priKeyValue + " ORDER BY LoggedTime DESC", con);
            DataTable dt = new DataTable();
            DataAccessHelper.GetList(comm, dt);
            return dt;
        }

		/// <summary>
		/// Get the audit log for a speficic record in the database, selecting a sequence of fields in the table, in addition to virtual fields
		/// associated with the table.
		/// </summary>
		/// <param name="tableName"></param>
		/// <param name="primaryKeyName"></param>
		/// <param name="primaryKey"></param>
		/// <param name="normalFields">List of fields (in the table) to retrieve for the log</param>
		/// <param name="virtualFields">Virtual fields (if any)</param>
		/// <returns></returns>
		public DataTable GetVirtualAuditByTableAndPrimaryKey(string tableName, string primaryKeyName, int primaryKey, IEnumerable<string> normalFields, IEnumerable<string> virtualFields)
		{
			DataTable table = new DataTable();

			using (SqlConnection connection = Connectivity.GetConnection())
			{
				string sql = SqlBuilder.BuildVirtualAuditSelectStatement(tableName, primaryKeyName, primaryKey, normalFields, virtualFields);
				SqlCommand cmd = new SqlCommand(sql, connection);
				DataAccessHelper.GetList(cmd, table);
			}

			return table;
		}
    }
}
