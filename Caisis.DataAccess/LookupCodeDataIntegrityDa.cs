using System;
using System.Collections;
using System.Data;
using System.Data.SqlClient;




namespace Caisis.DataAccess
{
	/// <summary>
	/// Summary description for LookupCodeDa.
	/// </summary>
	public class LookupCodeDataIntegrityDa 
	{
		
        //
        /*public DataTable GetTableMetaData()  
        {
            //SqlCommand com = DataAccessHelper.CreateCommand("spGetTableMetaData");
            //DataSet ds = DataAccessHelper.GetRecord(com);
			//return ds.Tables[0];

            MetadataNewDa MNDa = new MetadataNewDa();
            return MNDa.GetMetaTables();
        }
        //
         * */
        /*
        public DataTable GetColumnNames(string tableName)  
        {
            SqlCommand com = DataAccessHelper.CreateCommand("spGetFieldMetadataByTableName");
            DataAccessHelper.AddStringInputParam(com,"TableName",tableName);
            DataSet ds = DataAccessHelper.GetRecord(com);
			
            return ds.Tables[0];
        }
        public DataTable GetColumnNames(int tableId)
        {
            DataTable dt = new DataTable();
            MetadataNewDa MNDa = new MetadataNewDa();
            return MNDa.GetMetaFieldsForAMetaTable(dt, tableId);
        }
        */
        public DataTable GetColumnNames(int tableId)
        {
            DataTable dt = new DataTable();
            string sql = "SELECT FieldId, FieldName, FieldDataType, FieldIsVirtual, FieldSuppress, FieldOrder FROM MetadataFields WHERE FieldName NOT LIKE '%Id' AND TableId = " + tableId.ToString();
            SqlCommand com = DataAccessHelper.CreateSqlCommand(sql);
            DataAccessHelper.GetRecord(com, dt);
            if (com.Connection.State != ConnectionState.Closed) com.Connection.Close();
            return dt;
        }
        /*
         * //
        public DataTable GetFieldMetaDataRecord(int fieldId)  
        {
            SqlCommand com = DataAccessHelper.CreateCommand("spGetFieldMetadataRecord");
            DataAccessHelper.AddIntInputParam(com,"FieldId",fieldId);
            DataSet ds = DataAccessHelper.GetRecord(com);
			
            return ds.Tables[0];
        }
        */
        //
        /*
        public DataTable GetFieldValues(string tableName, string fieldName)
        {
            string sql = "SELECT " + tableName + "." + fieldName + " theValue, "
                + "Count(" + tableName + "." + fieldName + ")  Count "
                + "FROM " + tableName + " "
                + "GROUP BY " + tableName + "." + fieldName + " "
                + "ORDER BY Count(" + tableName + "." + fieldName + ") DESC;";

            SqlCommand com = DataAccessHelper.CreateSqlCommand(sql);
            DataSet ds = DataAccessHelper.GetRecord(com);

            return ds.Tables[0];
        }
        */
        public DataTable GetFieldValues(int fieldId,string tableName, string fieldName)
        {
            MetadataNewDa MNDa = new MetadataNewDa();
            bool isVirtual = MNDa.MetaTableFieldIsVirtual(fieldId);
            string sql;
            if (isVirtual)
            {
                sql = "SELECT FieldValue theValue, Count(FieldValueId)  Count "
                    + "FROM MetadataFieldValues WHERE FieldId = " + fieldId + " GROUP BY FieldValue "
                    + "ORDER BY Count(FieldValueId) DESC;";

            }
            else
            {
                sql = "SELECT " + tableName + "." + fieldName + " theValue, "
                    + "Count(" + tableName + "." + fieldName + ")  Count "
                    + "FROM " + tableName + " "
                    + "GROUP BY " + tableName + "." + fieldName + " "
                    + "ORDER BY Count(" + tableName + "." + fieldName + ") DESC;";
            }
            SqlCommand com = DataAccessHelper.CreateSqlCommand(sql);
            DataSet ds = DataAccessHelper.GetRecord(com);

            return ds.Tables[0];
        }
        public void recode(string table, string field, string theValue,string recodeTo,int fieldId)
        {
            //implicit data type conversion in SQL server
            MetadataNewDa MNDa = new MetadataNewDa();
            bool isVirtual = MNDa.MetaTableFieldIsVirtual(fieldId);
            string sql;
            if (!isVirtual)
            {
                sql = "UPDATE " + table + " ";
                if ((recodeTo == null) || (recodeTo == "Null"))
                {
                    sql = sql + "SET " + table + "." + field + " = Null ";
                }
                else
                {
                    sql = sql + "SET " + table + "." + field + " = '" + recodeTo + "' ";
                }
                sql = sql + " WHERE (((" + table + "." + field + ")='" + theValue + "'))";
            }
            else
            {
                sql = "UPDATE MetadataFieldValues ";
                if ((recodeTo == null) || (recodeTo == "Null"))
                {
                    sql = sql + " SET FieldValue = Null ";
                }
                else
                {
                    sql = sql + " SET FieldValue = '" + recodeTo + "' ";
                }
                sql = sql + " WHERE (FieldValue = '" + theValue + "' AND FieldId = " + fieldId + ") ";
            
            }
            SqlCommand com = DataAccessHelper.CreateSqlCommand(sql);
            DataAccessHelper.ExecuteScalar(com);
            
        }
	}
}
