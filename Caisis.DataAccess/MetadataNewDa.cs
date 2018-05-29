using System;
using System.Collections;
using System.Data;
using System.Data.SqlClient;



namespace Caisis.DataAccess
{
	/// <summary>
	/// Summary description for MetadataNew.
	/// had some problems that seemed to be connection pool leak related so i added 
    ///  if (com.Connection.State != ConnectionState.Closed) com.Connection.Close();
    /// everywhere just in case. Not sure if it helped but it won't harm either.
	/// </summary>
	public class MetadataNewDa 
	{
        //Meta table queries
        public DataTable GetMetaTables()  
        {
            string sql = "SELECT TableId, TableName, TableDescription, TableLabel FROM MetadataTables ORDER BY TableName";
            
            return ReturnATable(sql);
        }
        public DataTable GetMetaTable(int tableId)  
        {
            string sql = "SELECT TableId, TableName, TableDescription, TableLabel FROM MetadataTables WHERE TableId = " + tableId.ToString();
            
            return ReturnATable(sql);
        }
        public void UpdateMetaTable(int tableId, string tableDescription, string tableLabel)  
        {
            string sql = "UPDATE MetadataTables " +
                "SET tableDescription = '" + tableDescription + "', tableLabel =  '" + tableLabel + "' " +
                "WHERE tableId = " + tableId;
            
            SqlCommand com = DataAccessHelper.CreateSqlCommand(sql);
            DataAccessHelper.ExecuteScalar(com);
            if (com.Connection.State != ConnectionState.Closed) com.Connection.Close();
        }
        public int AddMetaTable(string tableName)  
        {
            string sql = "INSERT INTO MetadataTables(TableName) VALUES ('" + tableName + "');SELECT @@IDENTITY";
            SqlCommand com = DataAccessHelper.CreateSqlCommand(sql);
            DataSet ds = DataAccessHelper.GetRecord(com);
            if (com.Connection.State != ConnectionState.Closed) com.Connection.Close();
            
            return int.Parse(ds.Tables[0].Rows[0][0].ToString());
        }
        public void DeleteMetaTableAndAssociatedData(int TableId)
        {
            DeleteAllFieldValuesForAMetaTable(TableId);
            DeleteAllAttributeValuesForAMetaTable(TableId);
            DeleteAllMetaFieldsForAMetaTable(TableId);
            string sql = "DELETE FROM MetadataTables WHERE TableId = " + TableId;

            SqlCommand com = DataAccessHelper.CreateSqlCommand(sql);
            DataAccessHelper.ExecuteScalar(com);
            
            if (com.Connection.State != ConnectionState.Closed) com.Connection.Close();

        }
        //Meta field queries
        //Get all fields for a MetaTable
        public DataTable GetMetaFieldsForAMetaTable(DataTable dt, int MetaTableId)
        {
            string sql = "SELECT FieldId, FieldName, FieldDataType, FieldIsVirtual, FieldSuppress, FieldOrder FROM MetadataFields WHERE TableId = " + MetaTableId.ToString() + " ORDER BY coalesce(FieldOrder,'9999'),FieldSuppress";
            SqlCommand com = DataAccessHelper.CreateSqlCommand(sql);
            DataAccessHelper.GetRecord(com,dt);
            if (com.Connection.State != ConnectionState.Closed) com.Connection.Close();
            return dt;
        }
        public DataTable GetMetaFieldsForAMetaTable(int MetaTableId)
        {
            string sql = "SELECT FieldId, FieldName, FieldDataType, FieldIsVirtual, FieldSuppress, FieldOrder FROM MetadataFields WHERE TableId = " + MetaTableId.ToString() + " ORDER BY coalesce(FieldOrder,'9999'),FieldSuppress";
            return ReturnATable(sql); ;
        }
        public DataTable GetAMetaField(int MetaFieldId)
        {
            string sql = "SELECT FieldId, FieldName, FieldDataType, FieldIsVirtual, FieldSuppress, FieldOrder FROM MetadataFields WHERE FieldId = " + MetaFieldId.ToString();
            return ReturnATable(sql);
        }
        /*
        public DataTable GetAMetaFieldsAttributes(int MetaFieldId)
        {
            string sql = "SELECT FieldId, FieldName, FieldDataType, FieldIsVirtual, FieldSuppress, FieldOrder FROM MetadataFields WHERE FieldId = " + MetaFieldId.ToString();
            return ReturnATable(sql);
        }
        */
        public int AddMetaField(int tableId,string fieldName, string fieldDataType, int maxLength, bool fieldIsVirtual, bool fieldSuppress)  
        {
            return AddMetaField(tableId,fieldName, fieldDataType, maxLength, fieldIsVirtual, fieldSuppress ,-1,true);
        }
        public int AddMetaField(int tableId,string fieldName, string fieldDataType, int maxLength, bool fieldIsVirtual, bool fieldSuppress ,int fieldOrder)  
        {
            return AddMetaField(tableId,fieldName, fieldDataType, maxLength, fieldIsVirtual, fieldSuppress ,fieldOrder,false);
        }
        private int AddMetaField(int tableId,string fieldName, string fieldDataType, int maxLength, bool fieldIsVirtual, bool fieldSuppress ,int fieldOrder,bool fieldOrderIsNull)  
        {
			if (fieldName.IndexOf(' ') != -1)
			{
				// js client code should prevent fieldnames with spaces
				throw new ArgumentException("FieldName for metadata field cannot contain spaces, and client code (javascript) should enforce this. The MetadataFields record was not updated.");
			}

            int fieldId;
            bool addMaxLength = false;
            int attributeId = -1;
            DataTable dtA = GetAnAttribute("MaxLength"); // This is not very efficient when adding many attributes at once as it gets the id on every add. Also it is dependent on the existence of an attribute named 'MaxLength'.
            if (dtA.Rows.Count == 1)
            {
                addMaxLength = true;
                attributeId = int.Parse(dtA.Rows[0][0].ToString()); //MaxLength in MetadataFieldAttributes
            }
            int isVirtual = 0;
            int suppress = 0;
            string strFieldOrder = "null";
            if (fieldIsVirtual)
            {
                isVirtual = 1;
            }
            if (fieldSuppress)
            {
                suppress = 1;
            }
            else if (!fieldOrderIsNull)
            {
                strFieldOrder = fieldOrder.ToString();
                MetaFieldOrderFreePosition(tableId, fieldOrder);
            }
            string sql = "INSERT INTO MetadataFields(TableId, FieldName, FieldDataType, FieldIsVirtual, FieldSuppress, FieldOrder) VALUES (" + tableId + ", '" + fieldName + "', '" + fieldDataType + "', " + isVirtual + ", " + suppress + ", " + strFieldOrder + ");SELECT @@IDENTITY";
            SqlCommand com = DataAccessHelper.CreateSqlCommand(sql);
            DataSet ds = DataAccessHelper.GetRecord(com);
            if (com.Connection.State != ConnectionState.Closed) com.Connection.Close();
            
            fieldId = int.Parse(ds.Tables[0].Rows[0][0].ToString());

            if (maxLength >= 0 && addMaxLength)
            {
                sql = "INSERT INTO MetadataFieldAttributeValues(FieldId, AttributeId, AttributeValue) VALUES(" + fieldId + ", " + attributeId + ", " + maxLength + ")";
                com = DataAccessHelper.CreateSqlCommand(sql);
                DataAccessHelper.ExecuteScalar(com);
            }
            if (com.Connection.State != ConnectionState.Closed) com.Connection.Close();

            attributeId = -1;
            dtA = GetAnAttribute("Label"); 
            if (dtA.Rows.Count == 1)
            {
                attributeId = int.Parse(dtA.Rows[0][0].ToString()); //id in MetadataFieldAttributes
                AddAttribute(fieldId, attributeId, fieldName);
            }
            attributeId = -1;
            dtA = GetAnAttribute("ControlType"); 
            if (dtA.Rows.Count == 1)
            {
                attributeId = int.Parse(dtA.Rows[0][0].ToString()); //id in MetadataFieldAttributes
                AddAttribute(fieldId,attributeId,"CaisisTextBox");
            }
            return fieldId;
        }
        public void UpdateMetaField(int FieldId, string FieldName, string DataType, bool Suppress, int FieldOrder)
        {
			if (FieldName.IndexOf(' ') != -1)
			{
				// js client code should prevent fieldnames with spaces
				throw new ArgumentException("FieldName for metadata field cannot contain spaces, and client code (javascript) should enforce this. The MetadataFields record was not updated.");
			}

            string strFieldOrder = "null";
            int intSuppress = 0;
            if (Suppress)
            {
                intSuppress = 1;
            }
            else if (FieldOrder >= 0)
            {
                strFieldOrder = FieldOrder.ToString();
               // MetaFieldOrderFreePositionUsingFieldId(FieldId, FieldOrder);
            }

            string sql = "UPDATE MetadataFields SET FieldName = '" + FieldName + "',FieldDataType = '" + DataType + "', FieldSuppress= " + intSuppress + ", FieldOrder = " + strFieldOrder + " WHERE FieldId = " + FieldId;
            SqlCommand com = DataAccessHelper.CreateSqlCommand(sql);
            DataAccessHelper.ExecuteScalar(com);
            if (com.Connection.State != ConnectionState.Closed) com.Connection.Close();

        }
        public void DeleteMetaField(int FieldId)
        {
            //no cascading in db set during development:
            DeleteAllAttributesForAMetaField(FieldId);

            string sql = "DELETE FROM MetadataFields WHERE FieldId = " + FieldId;
            SqlCommand com = DataAccessHelper.CreateSqlCommand(sql);
            DataAccessHelper.ExecuteScalar(com);
            if (com.Connection.State != ConnectionState.Closed) com.Connection.Close();
            MetaFieldOrderRenumberUsingFieldId(FieldId);
        }
        public void DeleteAllMetaFieldsForAMetaTable(int TableId)
        {
            string sql = "DELETE FROM MetadataFields WHERE TableId = " + TableId;
            SqlCommand com = DataAccessHelper.CreateSqlCommand(sql);
            DataAccessHelper.ExecuteScalar(com);
            if (com.Connection.State != ConnectionState.Closed) com.Connection.Close();
        }
        public bool VirtualMetaFieldHasSavedData(int MetaFieldId)
        {
            bool rtrn = false;
            string sql = "SELECT Count(FieldValue) FROM MetadataFieldValues WHERE FieldId = " + MetaFieldId;
            DataTable dt = ReturnATable(sql);
            if (int.Parse(dt.Rows[0][0].ToString()) > 0)
            { rtrn = true; }
            return rtrn;
        }
        public bool TableHasDataSavedInVirtualMetaField(int TableId)
        {
            bool rtrn = false;
            string sql = "SELECT Count(FieldValue) FROM MetadataFieldValues WHERE FieldId IN (SELECT FieldId FROM MetadataFields WHERE TableId = " + TableId + ")";
            DataTable dt = ReturnATable(sql);
            if (int.Parse(dt.Rows[0][0].ToString()) > 0)
            { rtrn = true; }
            return rtrn;
        }
        public DataTable GetAttributes()
        {
            string sql = "SELECT fa.AttributeId, fa.AttributeName FROM MetadataFieldAttributes fa ";
            return ReturnATable(sql);
        }
        public DataTable GetAnAttribute(int AttributeId)
        {
            string sql = "SELECT fa.AttributeId, fa.AttributeName FROM MetadataFieldAttributes fa  WHERE fa.AttributeId = '" + AttributeId + "'";
            return ReturnATable(sql);
        }
        public DataTable GetAnAttribute(string AttributeName)
        {
            string sql = "SELECT fa.AttributeId, fa.AttributeName FROM MetadataFieldAttributes fa  WHERE fa.AttributeName = '" + AttributeName + "'";
            return ReturnATable(sql);
        }
        public bool AttributeExists(string AttributeName)
        {
            string sql = "SELECT COUNT(fa.AttributeId) FROM MetadataFieldAttributes fa WHERE fa.AttributeName = '" + AttributeName + "'";
            DataTable dt = ReturnATable(sql);
            if (dt.Rows.Count > 0)
            {
                return true;
            }
            {
                return false;
            }
        }
        public DataTable GetAttributeValuesForAMetaTable(DataTable dt, int TableId)
        {
            string sql = "SELECT fav.FieldId, fa.AttributeId, fa.AttributeName, fav.FieldAttributeId, fav.AttributeValue FROM MetadataFieldAttributeValues fav, MetadataFieldAttributes fa WHERE fa.AttributeId = fav.AttributeId AND fav.FieldId IN (SELECT FieldId FROM MetadataFields WHERE TableId = " + TableId +")";
            SqlCommand com = DataAccessHelper.CreateSqlCommand(sql);
            DataAccessHelper.GetRecord(com,dt);
            if (com.Connection.State != ConnectionState.Closed) com.Connection.Close();
            
            return dt;
        }
        public DataTable GetAttributeValuesForAMetaField(int MetaFieldId)
        {
            string sql = "SELECT mfa.AttributeId, FieldAttributeId,mfa.AttributeName, AttributeValue FROM MetadataFieldAttributeValues mfav,MetadataFieldAttributes mfa WHERE mfav.AttributeId = mfa.AttributeId AND FieldId = " + MetaFieldId.ToString();
            return ReturnATable(sql);
        }
        
        public DataTable GetAttributesNotUsedForAMetaField(int MetaFieldId)
        {
            string sql = "SELECT mfa.AttributeId,mfa.AttributeName FROM MetadataFieldAttributes mfa WHERE mfa.AttributeId NOT IN (SELECT mfav.AttributeId FROM MetadataFieldAttributeValues mfav WHERE mfav.FieldId = " + MetaFieldId.ToString() + ")";
            return ReturnATable(sql);
        }
        
        public DataTable GetAttributeValueOptions()
        {
            string sql = "SELECT AttributeId, AttributeOptionId, AttributeOptionValue FROM MetadataFieldAttributeValueOptions";
            return ReturnATable(sql);
        }
        
        public DataTable GetAttributeValueOptionsForAnAttribute(int attributeId)
        {
            string sql = "SELECT AttributeId, AttributeOptionId, AttributeOptionValue FROM MetadataFieldAttributeValueOptions WHERE AttributeId = " + attributeId;
            return ReturnATable(sql);
        }
        public DataTable GetAttributeValueOptionsForAnAttributeWithUsageInfo(int attributeId)
        {
            //string sql = "SELECT AttributeOptionValue, Count(FieldId) as UsedTimes FROM MetadataFieldAttributeValueOptions vo, MetadataFieldAttributeValues v WHERE v.AttributeId = " + attributeId + " AND v.AttributeId = vo.AttributeId AND v.AttributeValue = vo.AttributeOptionValue GROUP BY vo.AttributeId, AttributeOptionId, AttributeOptionValue";
            //This SQL ended up more complex than needed... should use join etc:
            string sql = "SELECT AttributeOptionValue, (SELECT Count(FieldID) FROM MetadataFieldAttributeValues WHERE attributeId =  " + attributeId + "  AND AttributeValue = vo.AttributeOptionValue) as UsedTimes FROM MetadataFieldAttributeValueOptions vo, MetadataFieldAttributeValues v WHERE vo.AttributeId =  " + attributeId + "  AND ((v.AttributeId = vo.AttributeId AND v.AttributeValue = vo.AttributeOptionValue) OR (vo.AttributeOptionValue NOT IN (SELECT AttributeValue FROM MetadataFieldAttributeValues WHERE attributeId =  " + attributeId + " ))) GROUP BY vo.AttributeId, AttributeOptionId, AttributeOptionValue";
            return ReturnATable(sql);
        }
        public void AddAttributeValueOption(int attributeId, string valueOption)
        {
            string sql = "INSERT INTO MetadataFieldAttributeValueOptions (AttributeId,AttributeOptionValue) values (" + attributeId + ",'" + valueOption + "')";
            SqlCommand com = DataAccessHelper.CreateSqlCommand(sql);
            DataAccessHelper.ExecuteScalar(com);
            if (com.Connection.State != ConnectionState.Closed) com.Connection.Close();
        }
        public void DeleteAttributeValueOption(int attributeId, string valueOption)
        {
            string sql = "DELETE FROM MetadataFieldAttributeValues WHERE AttributeId = " + attributeId + " AND AttributeValue = '" + valueOption + "'";
            SqlCommand com = DataAccessHelper.CreateSqlCommand(sql);
            DataAccessHelper.ExecuteScalar(com);
            sql = "DELETE FROM MetadataFieldAttributeValueOptions WHERE AttributeId = " + attributeId + " AND AttributeOptionValue = '" + valueOption + "'";
            com = DataAccessHelper.CreateSqlCommand(sql);
            DataAccessHelper.ExecuteScalar(com);
            if (com.Connection.State != ConnectionState.Closed) com.Connection.Close();
        }
        public void DeleteAllAttributesForAMetaField(int FieldId)
        {
            //no cascading in db set during development:
            string sql = "DELETE FROM MetadataFieldAttributeValues  WHERE FieldId = " + FieldId ;
            SqlCommand com = DataAccessHelper.CreateSqlCommand(sql);
            DataAccessHelper.ExecuteScalar(com);
            if (com.Connection.State != ConnectionState.Closed) com.Connection.Close();
        }
        public void DeleteAllAttributeValuesForAMetaTable(int TableId)
        {
            //no cascading in db set during development:
            string sql = "DELETE FROM MetadataFieldAttributeValues  WHERE FieldId IN (SELECT FieldId FROM MetadataFields WHERE TableId = " + TableId +")";
            SqlCommand com = DataAccessHelper.CreateSqlCommand(sql);
            DataAccessHelper.ExecuteScalar(com);
            if (com.Connection.State != ConnectionState.Closed) com.Connection.Close();
        }
        public void AddAttribute(int FieldId, int AttributeId, string AttributeValue)
        {
            string sql = "INSERT INTO MetadataFieldAttributeValues(FieldId, AttributeId, AttributeValue) VALUES(" + FieldId + "," + AttributeId + ",'" + AttributeValue + "')";
            SqlCommand com = DataAccessHelper.CreateSqlCommand(sql);
            DataAccessHelper.ExecuteScalar(com);
            if (com.Connection.State != ConnectionState.Closed) com.Connection.Close();
            
        }
        public void UpdateAttribute(int FieldAttributeId, string AttributeValue)
        {
            string sql = "UPDATE MetadataFieldAttributeValues SET AttributeValue = '" + AttributeValue + "' WHERE FieldAttributeId = " + FieldAttributeId.ToString();
            SqlCommand com = DataAccessHelper.CreateSqlCommand(sql);
            DataAccessHelper.ExecuteScalar(com);
            if (com.Connection.State != ConnectionState.Closed) com.Connection.Close();
            
        }
        public void DeleteAttribute(int FieldAttributeId)
        {
            //no cascading in db set during development:
            string sql = "DELETE FROM MetadataFieldAttributeValues  WHERE FieldAttributeId = " + FieldAttributeId ;
            SqlCommand com = DataAccessHelper.CreateSqlCommand(sql);
            DataAccessHelper.ExecuteScalar(com);
            if (com.Connection.State != ConnectionState.Closed) com.Connection.Close();
            
        }
        public void DeleteAttribute(int FieldId, int AttributeId)
        {
            //no cascading in db set during development:
            string sql = "DELETE FROM MetadataFieldAttributeValues  WHERE FieldId = " + FieldId + " AND AttributeId = " + AttributeId ;
            SqlCommand com = DataAccessHelper.CreateSqlCommand(sql);
            DataAccessHelper.ExecuteScalar(com);
            if (com.Connection.State != ConnectionState.Closed) com.Connection.Close();
            
        }
        public void CreateNewAttribute(string AttributeName)
        {
            //no cascading in db set during development:
            string sql = "INSERT INTO MetadataFieldAttributes(AttributeName) VALUES('" + AttributeName + "')";
            SqlCommand com = DataAccessHelper.CreateSqlCommand(sql);
            DataAccessHelper.ExecuteScalar(com);
            if (com.Connection.State != ConnectionState.Closed) com.Connection.Close();
        }
        public void UpdateAttributeName(int AttributeId,string AttributeName)
        {
            //no cascading in db set during development:
            string sql = "UPDATE MetadataFieldAttributes SET AttributeName = '" + AttributeName + "' WHERE AttributeId = " + AttributeId;
            SqlCommand com = DataAccessHelper.CreateSqlCommand(sql);
            DataAccessHelper.ExecuteScalar(com);
            if (com.Connection.State != ConnectionState.Closed) com.Connection.Close();
        }

        public void DeleteAllFieldValuesForAMetaTable(int TableId)
        {
            //no cascading in db set during development:
            string sql = "DELETE FROM MetadataFieldValues  WHERE FieldId IN (SELECT FieldId FROM MetadataFields WHERE TableId = " + TableId + ")";
            SqlCommand com = DataAccessHelper.CreateSqlCommand(sql);
            DataAccessHelper.ExecuteScalar(com);
            if (com.Connection.State != ConnectionState.Closed) com.Connection.Close();
        }
        //Information_schema queries

        /// <summary>
        /// Returns a list of ALL tables and their fields
        /// </summary>
        /// <returns></returns>
        public DataTable GetAllTableAndColumns()
        {
            string sql =
@"
SELECT DISTINCT
	tables.TABLE_NAME,
	columns.COLUMN_NAME,
	tables.TABLE_TYPE
FROM INFORMATION_SCHEMA.TABLES tables
INNER JOIN INFORMATION_SCHEMA.COLUMNS columns
	ON tables.TABLE_CATALOG = columns.TABLE_CATALOG
	AND tables.TABLE_SCHEMA= columns.TABLE_SCHEMA
	AND tables.TABLE_NAME = columns.TABLE_NAME
WHERE
    tables.TABLE_TYPE = 'BASE TABLE'
    AND tables.TABLE_NAME NOT LIKE '%AuditLog%'
    AND tables.TABLE_NAME NOT LIKE '%Z_%'
    AND tables.TABLE_NAME NOT LIKE '%sysdiagrams%'
ORDER BY
	tables.TABLE_NAME ASC,
	columns.COLUMN_NAME ASC
";
            return ReturnATable(sql);
        }

        //Query information_schema, get all tables not already Caisis meta data table
        public DataTable GetAllTablesInDB()
        {
            string sql = "SELECT TABLE_NAME, TABLE_TYPE FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME NOT IN (SELECT TableName FROM MetadataTables) AND TABLE_NAME NOT LIKE 'AuditLog_%' AND TABLE_NAME NOT LIKE 'Metadata%'";
            return ReturnATable(sql);
        }
        //Query information_schema, get all columns for a database table, not already used as a meta table field
        public DataTable GetTableColumns(int tableId, string tablename)
        {
            string sql = "SELECT COLUMN_NAME, DATA_TYPE = Left(DATA_TYPE, 10), CHARACTER_MAXIMUM_LENGTH as CHAR_MAX_LEN FROM INFORMATION_SCHEMA.COLUMNS " +
                            "WHERE TABLE_NAME = '" + tablename + "' AND COLUMN_NAME NOT IN (SELECT FieldName FROM MetadataFields WHERE TableID = " + tableId + ")";
                            //+ "ORDER BY COLUMN_NAME"; 
            return ReturnATable(sql);
        }
        public bool MetaTableFieldIsVirtual(int fieldId)
        {
            DataTable dt = GetAMetaField(fieldId);
            bool isVirtual = (bool)dt.Rows[0]["FieldIsVirtual"];
            return isVirtual;
        }
        //Meta Field Order functions
        public bool MetaFieldOrderTableHasOrderedFields(int tableId)
        {
            string sql = "SELECT Count(TableId) FROM MetadataFields WHERE TableId = " + tableId.ToString() +  "  AND FieldOrder > 0";
            DataTable dt = ReturnATable(sql);
            return (bool)(int.Parse(dt.Rows[0][0].ToString()) > 0);

        }
        private void MetaFieldOrderFreePosition(int tabelId, int position)
        {
            if (!MetaFieldOrderFieldOrderIsFree(tabelId, position))
            {
                string sql = "UPDATE MetadataFields SET FieldOrder = FieldOrder + 1 WHERE FieldOrder >= " + position + " AND TableId = " + tabelId;
                SqlCommand com = DataAccessHelper.CreateSqlCommand(sql);
                DataAccessHelper.ExecuteScalar(com);
            }
        }
        private void MetaFieldOrderFreePositionUsingFieldId(int fieldId, int position)
        {
            if (!MetaFieldOrderFieldOrderIsFreeUsingFieldId(fieldId, position))
            {
                string sql = "UPDATE MetadataFields SET FieldOrder = FieldOrder + 1 WHERE FieldOrder >= " + position + " AND TableId IN (SELECT TableId FROM MetadataFields WHERE FieldId = " + fieldId + ")";
                SqlCommand com = DataAccessHelper.CreateSqlCommand(sql);
                DataAccessHelper.ExecuteScalar(com);
            }
        }
        private bool MetaFieldOrderFieldOrderIsFree(int tableId, int position)
        {
            bool rtrn = true;
            string sql = "SELECT Count(FieldId) FROM MetadataFields WHERE TableId = " + tableId + " AND FieldOrder = " + position;
            DataTable dt = ReturnATable(sql);
            if (int.Parse(dt.Rows[0][0].ToString()) > 0)
            { rtrn = false; }
            return rtrn;
        }
        private bool MetaFieldOrderFieldOrderIsFreeUsingFieldId(int fieldId, int position)
        {
            bool rtrn = true;
            string sql = "SELECT Count(FieldId) FROM MetadataFields WHERE TableId IN (SELECT TableId FROM MetadataFields WHERE FieldId = " + fieldId + ") AND FieldOrder = " + position;
            DataTable dt = ReturnATable(sql);
            if (int.Parse(dt.Rows[0][0].ToString()) > 0)
            { rtrn = false; }
            return rtrn;
        }
        public void MetaFieldOrderRenumber(int tabelId)
        {
            string sql = "DECLARE @index int;SET @index = 0;UPDATE MetadataFields SET @index = FieldOrder = @index + 1 WHERE FieldId IN (SELECT TOP 1000 FieldId FROM MetadataFields WHERE TableId = " + tabelId + " AND FieldOrder IS NOT NULL ORDER BY FieldOrder)";
            SqlCommand com = DataAccessHelper.CreateSqlCommand(sql);
            DataAccessHelper.ExecuteScalar(com);
        }
        public void MetaFieldOrderRenumberUsingFieldId(int fieldID)
        {
            string sql = "DECLARE @index int;SET @index = 0;UPDATE MetadataFields SET @index = FieldOrder = @index + 1 WHERE FieldId IN (SELECT TOP 1000 FieldId FROM MetadataFields WHERE TableId IN (SELECT TableId FROM MetadataFields WHERE FieldId = " + fieldID + ") AND FieldOrder IS NOT NULL ORDER BY FieldOrder)";
            SqlCommand com = DataAccessHelper.CreateSqlCommand(sql);
            DataAccessHelper.ExecuteScalar(com);
        }
        //Helper function
        private DataTable ReturnATable(string sql)
        {
            SqlCommand com = DataAccessHelper.CreateSqlCommand(sql);
            DataSet ds = DataAccessHelper.GetRecord(com);
			if (com.Connection.State != ConnectionState.Closed) com.Connection.Close();
            return ds.Tables[0];    
        }
        

        // return count of records whos FieldOrder is greater than or equal or less than or equal to the field order passed in
        public DataSet GetFieldsForReodering(int tableId, int fieldId, int fieldOrder, int numPositionChanged)
        {
            string sql = "";
            if (numPositionChanged > 0)
            {
                sql = "SELECT FieldId FROM MetadataFields WHERE TableId = " + tableId + " AND FieldId != " + fieldId + " AND FieldOrder <= " + fieldOrder + " ORDER BY FIELDORDER ASC";
            }
            else if(numPositionChanged <= 0)
            {
                sql = "SELECT FieldId FROM MetadataFields WHERE TableId = " + tableId + " AND FieldId != " + fieldId + " AND FieldOrder >= " + fieldOrder + " ORDER BY FIELDORDER ASC";
            }
            SqlCommand com = DataAccessHelper.CreateSqlCommand(sql);
            DataSet ds = DataAccessHelper.GetRecord(com);
            return ds;
        }

        public void IncreaseMetaFieldOrderNumberByOne(int fieldId, int newFieldOrder)
        {
            string sql = "UPDATE MetadataFields Set FieldOrder = " + newFieldOrder + " WHERE FieldId = " + fieldId;
            SqlCommand com = DataAccessHelper.CreateSqlCommand(sql);
            DataAccessHelper.ExecuteScalar(com);
        }

        public DataRow GetMetadataField(int fieldId)
        {
            string sql = "SELECT * FROM MetadataFields WHERE FieldId = " + fieldId;
            SqlCommand com = DataAccessHelper.CreateSqlCommand(sql);
            DataSet ds = DataAccessHelper.GetRecord(com);
            return ds.Tables[0].Rows[0];
        }
        
	}
}
