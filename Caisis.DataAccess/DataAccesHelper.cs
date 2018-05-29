using System;
using System.Data;
using System.Data.SqlClient;
using System.Collections;
using System.Configuration;

using System.Security.Cryptography;
using System.Text;
using System.IO;


using Caisis.Security;

namespace Caisis.DataAccess
{
    public enum SqlOperation
    {
        Insert,
        Update
    }


    /// <summary>
    /// Summary description for DataAccessHelper.
    /// </summary>
    public class DataAccessHelper
    {

        /// <summary>
        /// Add an input paramater, passing DBNull for null paramater values
        /// </summary>
        /// <param name="cmd">The SQL command</param>
        /// <param name="key">The name of the paramater, "@" will be prepended to param name</param>
        /// <param name="val">The value of the paramater, NULL -> DBNull</param>
        /// <param name="nullable">Indicate whether the input param accepts NULL param values</param>
        public static void AddInputParam(SqlCommand cmd, string key, object val, bool nullable)
        {
            string paramName = "@" + key;
            object paramValue;
            // null check
            if (val == null)
            {
                if (nullable)
                {
                    paramValue = DBNull.Value;
                }
                else
                {
                    throw new DataAccessException("Input parameter " + key + " cannot be NULL.");
                }
            }
            else
            {
                paramValue = val;
            }
            // add param
            SqlParameter param = new SqlParameter(paramName, paramValue);
            cmd.Parameters.Add(param);            
        }

        /// <summary>
        /// Add data time parameter to stored procedure
        /// </summary>
        /// <param name="com"></param>
        /// <param name="key"></param>
        /// <param name="val"></param>
        /// <returns></returns>
        public static bool AddDateTimeInputParam(SqlCommand com, string key, DateTime? val)
        {

            SqlParameter param = new SqlParameter("@" + key, System.Data.SqlDbType.DateTime);

            if (val.HasValue)
            {
                param.Value = val;
            }
            else
            {
                param.Value = DBNull.Value;
            }

            com.Parameters.Add(param);
            return true;
        }

        /// <summary>
        /// Add bit parameter to stored procedure
        /// </summary>
        /// <param name="com"></param>
        /// <param name="key"></param>
        /// <param name="val"></param>
        /// <returns></returns>

        public static bool AddBitInputParam(SqlCommand com, string key, byte val)
        {
            SqlParameter param = new SqlParameter("@" + key, System.Data.SqlDbType.Bit);
            param.Value = val;

            com.Parameters.Add(param);
            return true;
        }

        /// <summary>
        /// Add 32-bit int parameter to stored procedure
        /// </summary>
        /// <param name="com"></param>
        /// <param name="key"></param>
        /// <param name="val"></param>
        /// <returns></returns>
        public static bool AddIntInputParam(SqlCommand com, string key, object val)
        {
            SqlParameter param = new SqlParameter("@" + key, System.Data.SqlDbType.Int);
            if (val is int)
            {
                param.Value = val;
            }
            else if (val == DBNull.Value)
            {
                throw new Caisis.DataAccess.DataAccessException("Input parameter " + key + " was not of type int.");
            }

            com.Parameters.Add(param);

            return true;
        }


        /// <summary>
        /// Add string parameter up to 250 characters to stored procedure
        /// </summary>
        /// <param name="com"></param>
        /// <param name="key"></param>
        /// <param name="val"></param>
        /// <returns></returns>
        public static bool AddStringInputParam(SqlCommand com, string key, string val)
        {
            SqlParameter param = new SqlParameter("@" + key, System.Data.SqlDbType.VarChar, 250);
            param.Value = val;

            com.Parameters.Add(param);
            return true;
        }

        /// <summary>
        /// Add string parameter up to 2000 characters to stored procedure
        /// </summary>
        /// <param name="com"></param>
        /// <param name="key"></param>
        /// <param name="val"></param>
        /// <returns></returns>
        public static bool AddLongStringInputParam(SqlCommand com, string key, string val)
        {
            SqlParameter param = new SqlParameter("@" + key, System.Data.SqlDbType.VarChar, 2000);
            param.Value = val;

            com.Parameters.Add(param);
            return true;
        }

        /// <summary>
        /// Add text parameter to stored procedure
        /// </summary>
        /// <param name="com"></param>
        /// <param name="key"></param>
        /// <param name="val"></param>
        /// <returns></returns>
        public static bool AddTextInputParam(SqlCommand com, string key, string val)
        {
            SqlParameter param = new SqlParameter("@" + key, System.Data.SqlDbType.Text);
            param.Value = val;

            com.Parameters.Add(param);
            return true;
        }

        /// <summary>
        /// Add 32-bit int OUTPUT parameter up to stored procedure
        /// </summary>
        /// <param name="com"></param>
        /// <param name="key"></param>
        /// <param name="val"></param>
        /// <returns></returns>
        public static bool AddIntOutputParam(SqlCommand com, string key)
        {
            SqlParameter param = new SqlParameter("@" + key, System.Data.SqlDbType.Int, 50);
            param.Direction = System.Data.ParameterDirection.Output;
            com.Parameters.Add(param);
            return true;
        }

        /// <summary>
        /// Add string OUTPUT parameter up to 250 charactes to stored procedure
        /// </summary>
        /// <param name="com"></param>
        /// <param name="key"></param>
        /// <param name="val"></param>
        /// <returns></returns>
        public static bool AddStringOutputParam(SqlCommand com, string key)
        {
            SqlParameter param = new SqlParameter("@" + key, System.Data.SqlDbType.VarChar, 250);
            param.Direction = System.Data.ParameterDirection.Output;
            com.Parameters.Add(param);
            return true;
        }

        private static Hashtable DeriveOutputParams(SqlCommand com)
        {
            System.Collections.Hashtable outParams = new System.Collections.Hashtable();
            for (int i = 0; i < com.Parameters.Count; i++)
            {
                if (com.Parameters[i].Direction == System.Data.ParameterDirection.Output)
                {
                    String paramName = com.Parameters[i].ParameterName;
                    paramName = paramName.Replace("@", "");
                    outParams.Add(paramName, com.Parameters[i].Value);
                }
            }
            return outParams;
        }

        public static Hashtable ExecuteScalar(SqlCommand com)
        {
            try
            {
                SqlConnection conn = com.Connection;
                if (conn.State == ConnectionState.Closed)
                {
                    conn.Open();
                }
                com.ExecuteScalar();
                if (com.Transaction == null)
                {
                    conn.Close();
                }

                return DeriveOutputParams(com);
            }
            catch (Exception ex)
            {
                if (com.Transaction == null)
                {
                    com.Connection.Close();
                }
                else
                {
                    com.Transaction.Rollback();
                    //com.Transaction.Dispose();
                    com.Connection.Close();
                }
                throw ex;
            }
        }
        public static DataSet GetRecord(SqlCommand com)
        {
            DataSet ds = new DataSet();
            DataTable dt = new DataTable();
            ds.Tables.Add(dt);
            GetRecord(com, dt);
            return ds;
        }

        public static void GetRecord(SqlCommand com, DataSet ds, string dsTable)
        {
            GetRecord(com, ds.Tables[dsTable]);
        }

        public static void GetRecord(SqlCommand com, DataTable dt)
        {
            try
            {
                SqlDataAdapter da = new SqlDataAdapter(com);
                da.TableMappings.Add("Table", dt.TableName);
                da.Fill(dt);
            }
            catch
            {
                if (com.Transaction == null)
                {
                    com.Connection.Close();
                }
                else
                {
                    com.Transaction.Rollback();
                    //com.Transaction.Dispose();
                    com.Connection.Close();
                }
                throw;
            }
        }

        public static void SetParams(SqlCommand com, DataRow dr)
        {
            DataColumn dc = new DataColumn();
            SqlParameterCollection spCol = com.Parameters;
            foreach (SqlParameter sp in spCol)
            {
                if (sp.Direction == ParameterDirection.Input)
                {
                    string colName = sp.ParameterName.Remove(0, 1);
                    try
                    {

                        switch (sp.DbType)
                        {
                            case DbType.Int32:
                                sp.Value = Int32.Parse(dr[colName].ToString());
                                break;
                            case DbType.Int16:
                                sp.Value = Int16.Parse(dr[colName].ToString());
                                break;
                            case DbType.String:
                                sp.Value = dr[colName];
                                break;
                            case DbType.DateTime:
                                sp.Value = DateTime.Parse(dr[colName].ToString());
                                break;
                        }
                    }
                    catch
                    {
                        throw new TechnicalException(colName + "not of type " + sp.DbType);
                    }
                }
            }
        }


        public static void DeriveParams(SqlCommand com, DataRow dr)
        {
            DataColumnCollection cols = dr.Table.Columns;

            foreach (DataColumn c in cols)
            {
                bool sup = false;
                if (null != c.ExtendedProperties[ExtendedProperty.Suppress] && (bool)c.ExtendedProperties[ExtendedProperty.Suppress] == true)
                {
                    sup = true;
                }

                if (sup == false)
                {
                    string val = dr[c].ToString();
                    SqlParameter param = new SqlParameter("@" + c.ColumnName, dr[c]);
                    com.Parameters.Add(param);
                }
                else
                {
                    //reset value so that future operations are refreshed
                    c.ExtendedProperties[ExtendedProperty.Suppress] = false;
                }
            }
        }

        public static void DeriveParams(SqlCommand com, DataTable dt)
        {
            DeriveParams(com, dt.Rows[0]);

        }

        public static void GetList(SqlCommand com, DataTable dt)
        {
            try
            {
                SqlDataAdapter da = new SqlDataAdapter(com);
                //da.TableMappings.Add("Table", dt.TableName);
                da.Fill(dt);
            }
            catch
            {
                if (com.Transaction == null)
                {
                    com.Connection.Close();
                }
                else
                {
                    com.Transaction.Rollback();
                    //com.Transaction.Dispose();
                    com.Connection.Close();
                }
                throw;
            }

        }


        /*
                public static DataSet GetList(SqlCommand com)  
                {
                    DataSet ds = new DataSet();
                    DataTable dt = new DataTable();
                    GetList(com, dt);
                    ds.Tables.Add(dt);
                    return ds;
                }
        */

        /// <summary>
        /// Fill DataSet based on select statement
        /// </summary>
        /// <param name="com">sql command</param>
        /// <returns>result set</returns>
        public static DataSet GetList(SqlCommand com)
        {
            DataSet ds = new DataSet();
            try
            {
                SqlDataAdapter da = new SqlDataAdapter(com);
                da.Fill(ds);
            }
            catch
            {
                if (com.Transaction == null)
                {
                    com.Connection.Close();
                }
                else
                {
                    com.Transaction.Rollback();
                    //com.Transaction.Dispose();
                    com.Connection.Close();
                }
                throw;
            }
            return ds;
        }

        /// <summary>
        /// Fill DataSet based on select statement and record interval
        /// </summary>
        /// <param name="com">Sql statement</param>
        /// <param name="startRow">First record returned</param>
        /// <param name="numRows">Last record returned</param>
        /// <returns>Result set and rowcount</returns>
        public static DataSet GetList(SqlCommand com, int startRow, int numRows)
        {
            try
            {
                DataSet ds = new DataSet();

                AddIntOutputParam(com, "RowCount");
                SqlDataAdapter da = new SqlDataAdapter(com);
                //da.TableMappings.Add("Table", dt.TableName);
                if (startRow >= 0 && numRows > 0)
                {
                    da.Fill(ds, startRow, numRows, "Patients");
                }
                else
                {
                    da.Fill(ds);
                }

                Hashtable outParams = DeriveOutputParams(com);

                ds.Tables[0].ExtendedProperties[ExtendedProperty.RowCount] = (int)outParams["RowCount"];

                return ds;

            }
            catch
            {
                if (com.Transaction == null)
                {
                    com.Connection.Close();
                }
                else
                {
                    com.Transaction.Rollback();
                    //com.Transaction.Dispose();
                    com.Connection.Close();
                }
                throw;
            }
        }

        /// <summary>
        /// Can be used to execute SQL statements, although stored procedures should be used whenever possible
        /// </summary>
        /// <param name="cmdText"></param>
        /// <param name="dt"></param>
        public static void ExecuteSqlSelect(string cmdText, DataTable dt)
        {
            SqlDataAdapter da = new SqlDataAdapter(cmdText, GetConnection());
            da.Fill(dt);
        }
        public static void ExecuteSql(string cmdText, DataTable dt)
        {
            ExecuteSqlSelect(cmdText, dt);
        }

        /// <summary>
        /// Executes a SQL SELECT statement on the Data Warehouse and returns a view of the results
        /// </summary>
        /// <param name="cmdText"></param>
        /// <returns></returns>
        public static DataView ExecuteSqlSelectOnWarehouse(string cmdText)
        {
            SqlCommand com = CreateWarehouseSqlCommand(cmdText);
            DataTable dt = DataAccessHelper.GetList(com).Tables[0];
            return dt.DefaultView;
        }

        /// <summary>
        /// Executes a SQL Stored Proc on the Data Warehouse and returns a view of the results
        /// </summary>
        /// <param name="spName"></param>
        /// <returns></returns>
        public static DataView ExecuteStoredProcOnWarehouse(string spName)
        {
            SqlCommand com = CreateWarehouseCommand(spName);
            DataTable dt = DataAccessHelper.GetList(com).Tables[0];
            return dt.DefaultView;
        }

        public static SqlConnection GetConnection()
        {
            string dbConnStr = ConfigurationSettings.AppSettings["dbConnectionString"].ToString();

            if (ConfigurationSettings.AppSettings["encryptDbConnectString"] != null && ConfigurationSettings.AppSettings["encryptDbConnectString"].ToString().Equals("true"))
            {
                dbConnStr = CustomCryptoHelper.Decrypt(dbConnStr);
            }

            SqlConnection conn = new System.Data.SqlClient.SqlConnection();

            conn.ConnectionString = dbConnStr;

            return conn;
        }

        /// <summary>
        /// Returns the connection string for the Data Warehouse
        /// </summary>
        /// <returns></returns>
        public static SqlConnection GetWarehouseConnection()
        {
            string warehouseKey = "warehouseConnectionString";
            string encryptWarehouseKey = "encryptWarehouseConnectionString";
            string warehouseConnection = ConfigurationSettings.AppSettings[warehouseKey].ToString();

            if (ConfigurationSettings.AppSettings[encryptWarehouseKey] != null && ConfigurationSettings.AppSettings[encryptWarehouseKey].ToString().ToLower().Equals("true"))
            {
                warehouseConnection = CustomCryptoHelper.Decrypt(warehouseConnection);
            }
            SqlConnection conn = new System.Data.SqlClient.SqlConnection();
            conn.ConnectionString = warehouseConnection;

            return conn;
        }

        public static SqlCommand CreateSqlCommand(string cmdText)
        {
            SqlConnection conn = GetConnection();
            return CreateSqlCommand(cmdText, conn);
        }


        public static SqlCommand CreateSqlCommand(string cmdText, SqlConnection conn)
        {
            SqlCommand com = new SqlCommand(cmdText, conn);
            com.CommandTimeout = conn.ConnectionTimeout;
            return com;
        }

        public static SqlCommand CreateWarehouseSqlCommand(string cmdText)
        {
            SqlConnection conn = GetWarehouseConnection();
            SqlCommand com = CreateSqlCommand(cmdText, conn);
            com.CommandTimeout = conn.ConnectionTimeout;
            return com;
        }

        /// <summary>
        /// for stored procs only
        /// </summary>
        /// <param name="cmdText"></param>
        /// <returns></returns>
        public static SqlCommand CreateCommand(String cmdText)
        {
            SqlConnection conn = GetConnection();
            SqlCommand com = new System.Data.SqlClient.SqlCommand(cmdText, conn);
            com.CommandType = System.Data.CommandType.StoredProcedure;
            return com;
        }

        public static SqlCommand CreateCommand(String cmdText, CommandType commandType)
        {
            SqlConnection conn = GetConnection();
            SqlCommand com = new System.Data.SqlClient.SqlCommand(cmdText, conn);
            com.CommandType = commandType;
            return com;
        }

        public static SqlCommand CreateCommand(String cmdText, SqlTransaction trans)
        {
            /*  removed transaction logic, replace after fully tested- 2/21 spy*/
            if (trans == null)
            {
                throw new DataAccessException("SqlTransaction object cannot be null for CreateCommand method, please fix your code.");
            }
            SqlConnection conn = trans.Connection;
            SqlCommand com = new System.Data.SqlClient.SqlCommand(cmdText, conn, trans);
            com.CommandType = System.Data.CommandType.StoredProcedure;
            return com;
        }

        public static SqlCommand CreateWarehouseCommand(String cmdText)
        {
            SqlConnection conn = GetWarehouseConnection();
            SqlCommand com = new System.Data.SqlClient.SqlCommand(cmdText, conn);
            com.CommandType = System.Data.CommandType.StoredProcedure;
            return com;
        }

        public static SqlTransaction BeginTransaction()
        {
            SqlConnection conn = GetConnection();
            conn.Open();
            SqlTransaction trans = conn.BeginTransaction(IsolationLevel.ReadUncommitted);
            return trans;
        }

        public static void EndTransaction(SqlTransaction trans)
        {
            trans.Commit();
            //trans.Dispose();
            if (trans.Connection != null)
            {
                trans.Connection.Close();
            }
        }

        /// <summary>
        /// NOTE: This will throw an error on invalid date
        /// </summary>
        /// <param name="pDate"></param>
        /// <returns></returns>
        public static DateTime? ToDBDate(object pDate)
        {
            if (pDate!=null && !string.IsNullOrEmpty(pDate.ToString()))
            {
                return DateTime.Parse(pDate.ToString());
            }
            else
            {
                return null;
            }
        }


    }
}
