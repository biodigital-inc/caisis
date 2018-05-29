using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Data.Common;
using System.Data.SqlClient;
using System.Text;
using System.Linq;

namespace Caisis.DataAccess
{
    /// <summary>
    /// This is the "user-friendly" data access class for the metadata data model. TableMetadataDa and FieldMetadataDa
    /// will address their associated tables "directly". The data accessors in this class are based on functionality
    /// originally developed for the Dynamic Form and Metadata (Help) Admin interface.
    /// </summary>
    public class MetadataDa : BaseDA
    {
        public MetadataDa() { }

        private static readonly string GET_TABLE_METADATA_SQL =
@"
";

        /// <summary>
        /// The base SQL used to select field metadata across all diseases
        /// </summary>
        private static readonly string GET_FIELD_METADATA_SQL =
@"
SELECT
*
FROM
(
	SELECT
		field_metadata.TableName,
		field_metadata.TableId,
		field_metadata.FieldId,
		field_metadata.FieldName,
		field_metadata.FieldDataType,
		field_metadata.FieldIsVirtual,
		field_metadata.FieldOrder,
		field_metadata.FieldSuppress,
		field_metadata.AttributeId,
		field_metadata.FieldAttributeId,
		field_metadata.AttributeName,
		field_metadata.AttributeValue,
		disease_metadata.DiseaseId,
		disease_metadata.DiseaseName,
		disease_metadata.DiseaseAttributeName,
		disease_metadata.DiseaseAttributeValueId,
		disease_metadata.DiseaseAttributeValue
	FROM
	(
		-- get field metadata
		SELECT 
			a.*,
			d.TableName,
			b.FieldAttributeId,
			c.*,
			b.AttributeValue
		FROM MetadataFields a
		LEFT OUTER JOIN MetadataFieldAttributeValues b
			ON a.FieldId = b.FieldId
		LEFT OUTER JOIN MetadataFieldAttributes  c
			ON c.AttributeId = b.AttributeId
		INNER JOIN MetadataTables d
			ON a.TableId = d.TableId
	) field_metadata
	LEFT OUTER JOIN
	(
		-- get disease mapping to field metadata
		SELECT
			a.DiseaseAttributeValueId,
			a.DiseaseAttributeValue,
			b.DiseaseAttributeName,
			c.DiseaseId,
			c.DiseaseName,
			f.FieldId,
			f.FieldName,
			e.AttributeId,
			e.AttributeName,
			d.FieldAttributeId,
			d.AttributeValue
		FROM DiseaseAttributeValues a
		INNER JOIN DiseaseAttributes b
			ON a.DiseaseAttributeId = b.DiseaseAttributeId
		INNER JOIN Diseases c
			ON a.DiseaseId = c.DiseaseId
		INNER JOIN MetadataFieldAttributeValues d
			ON b.DiseaseAttributeName = 'FieldAttributeId' AND a.DiseaseAttributeValue = CAST(d.FieldAttributeId AS varchar(255))
		INNER JOIN MetadataFieldAttributes e
			ON d.AttributeId = e.AttributeId
		INNER JOIN MetadataFields f
			ON d.FieldId = f.FieldId
	) disease_metadata 
	-- restrict to field and attribute value pri key
	ON
		field_metadata.FieldId = disease_metadata.FieldId
		AND disease_metadata.FieldAttributeId = field_metadata.FieldAttributeId
) a
{0}
ORDER BY
    a.TableName ASC,
    a.FieldName ASC,
    a.AttributeName ASC,
    a.DiseaseId ASC,
    a.DiseaseAttributeValueId ASC
";


        /// <summary>
        /// SELECT * 
        /// FROM FieldMetadata 
        /// WHERE TableId = @TableId
        /// </summary>
        /// <param name="tableId"></param>
        /// <returns></returns>
        public DataTable GetFieldMetadataByTableId(int tableId)
        {
            SqlCommand com = DataAccessHelper.CreateCommand("spGetFieldMetadataByTableId");
            DataAccessHelper.AddIntInputParam(com, "TableId", tableId);
            return DataAccessHelper.GetRecord(com).Tables[0];
        }

        public DataTable GetTableMetaDataByTableName(string tableName)
        {
            string sql = "SELECT * " +
                "FROM  MetadataTables " +
                "WHERE MetadataTables.TableName = '" + tableName + "'";

            SqlCommand cmd = DataAccessHelper.CreateCommand(sql);
            cmd.CommandType = CommandType.Text;
            return DataAccessHelper.GetRecord(cmd).Tables[0];
        }

        public DataTable GetFieldsByTableName(string tableName)
        {
            string sql = "SELECT MetadataTables.TableName, MetadataTables.TableLabel, MetadataFields.FieldName, MetadataFields.FieldSuppress, MetadataFields.FieldOrder " +
                "FROM MetadataFields INNER JOIN MetadataTables ON MetadataFields.TableId = MetadataTables.TableId " +
                "WHERE (MetadataTables.TableName = '" + tableName + "' AND FieldSuppress = 0) ORDER BY MetadataFields.FieldOrder ASC";

            SqlCommand cmd = DataAccessHelper.CreateCommand(sql);
            cmd.CommandType = CommandType.Text;
            return DataAccessHelper.GetRecord(cmd).Tables[0];
        }

        /// <summary>
        /// Gets DataTable of all the fields or a table, the attibutes of those fields, and the values of those attributes
        /// </summary>
        /// <param name="tableName">name of database table</param>
        /// <returns>datatable</returns>
        public DataTable GetFieldMetadataByTableName(string tableName)
        {
            //StringBuilder sb = new StringBuilder();
            //sb.Append("SELECT MetadataTables.TableName, MetadataFields.FieldName, MetadataFields.FieldDataType, MetadataFields.FieldIsVirtual, ");
            //sb.Append("MetadataFields.FieldSuppress, MetadataFields.FieldOrder, MetadataFieldAttributes.AttributeName, MetadataFieldAttributeValues.AttributeValue ");
            //sb.Append("FROM  MetadataFields INNER JOIN MetadataTables ON MetadataFields.TableId = MetadataTables.TableId ");
            //sb.Append("INNER JOIN MetadataFieldAttributeValues ON MetadataFields.FieldId = MetadataFieldAttributeValues.FieldId ");
            //sb.Append("INNER JOIN MetadataFieldAttributes ON MetadataFieldAttributeValues.AttributeId = MetadataFieldAttributes.AttributeId ");
            //sb.Append("WHERE (MetadataTables.TableName = '" + tableName + "')");

            //string sqlStmt = sb.ToString();
            //SqlCommand cmd = DataAccessHelper.CreateCommand(sqlStmt);
            //cmd.CommandType = CommandType.Text;
            //return DataAccessHelper.GetRecord(cmd).Tables[0];

            // v6 backward-compatibility (get DEFAULT TableMetadata)
            return GetFieldMetadata(tableName, null);
        }

        //        /// <summary>
        //        /// Consumes records from a query returning metadata for all fields.
        //        /// </summary>
        //        /// <param name="consumer">record consumer</param>
        //        public static void ConsumeFieldMetadata(Connectivity.RecordConsumerDelegate consumer)
        //        {
        //            string sql =
        //                @"SELECT MetadataTables.TableName, MetadataFields.FieldName, MetadataFields.FieldDataType, MetadataFields.FieldIsVirtual,
        //					MetadataFields.FieldSuppress, MetadataFields.FieldOrder, MetadataFieldAttributes.AttributeName, MetadataFieldAttributeValues.AttributeValue
        //					FROM  MetadataFields INNER JOIN MetadataTables ON MetadataFields.TableId = MetadataTables.TableId
        //					INNER JOIN MetadataFieldAttributeValues ON MetadataFields.FieldId = MetadataFieldAttributeValues.FieldId
        //					INNER JOIN MetadataFieldAttributes ON MetadataFieldAttributeValues.AttributeId = MetadataFieldAttributes.AttributeId
        //					ORDER BY TableName, FieldName, AttributeName, AttributeValue";

        //            SqlCommand command = new SqlCommand(sql);
        //            Connectivity.ConsumeRecord(command, consumer);
        //        }

        //        public static void ConsumeTableMetadata(Connectivity.RecordConsumerDelegate consumer)
        //        {
        //            //            string sql =
        //            //                @"SELECT TableName, TableLabel, TableDescription
        //            //					FROM  MetadataTables
        //            //					ORDER BY TableName, TableLabel, TableDescription";

        //            string sql =
        //                @"SELECT TableName, 'TableLabel' AS TableAttributeName, TableLabel AS TableAttributeValue
        //					FROM  MetadataTables
        //
        //					UNION
        //
        //					SELECT TableName, 'TableDescription' AS TableAttributeName, TableDescription AS TableAttributeValue
        //					FROM MetadataTables
        //
        //					UNION
        //
        //					SELECT 
        //						MetadataTables.TableName, 
        //						MetadataTableAttributes.TableAttributeName, 
        //						MetadataTableAttributeValues.TableAttributeValue
        //					FROM MetadataTables
        //						INNER JOIN MetadataTableAttributeValues
        //							ON ( MetadataTables.TableId = MetadataTableAttributeValues.TableId )
        //						INNER JOIN MetadataTableAttributes
        //							ON ( MetadataTableAttributeValues.TableAttributeId = MetadataTableAttributes.TableAttributeId )
        //
        //					ORDER BY TableName, TableAttributeName, TableAttributeValue";

        //            SqlCommand command = new SqlCommand(sql);
        //            Connectivity.ConsumeRecord(command, consumer);
        //        }

        public static void ConsumeTableColumnMaxLengths(Connectivity.RecordConsumerDelegate consumer)
        {
            string sql =
                @"SELECT C.TABLE_NAME, 
						   C.COLUMN_NAME, 
						   C.DATA_TYPE, 
						   C.CHARACTER_MAXIMUM_LENGTH
					FROM INFORMATION_SCHEMA.COLUMNS C
						INNER JOIN INFORMATION_SCHEMA.TABLES T
							ON C.TABLE_NAME = T.TABLE_NAME
							AND C.TABLE_CATALOG = T.TABLE_CATALOG
							AND C.TABLE_SCHEMA = T.TABLE_SCHEMA
					WHERE C.TABLE_NAME NOT LIKE 'AuditLog_%' AND 
						  C.TABLE_NAME NOT LIKE 'Z_%' AND
						  C.TABLE_SCHEMA = 'dbo' AND
						  C.CHARACTER_MAXIMUM_LENGTH IS NOT NULL AND
						  T.TABLE_TYPE = 'BASE TABLE'
					ORDER BY TABLE_NAME";

            SqlCommand command = new SqlCommand(sql);
            Connectivity.ConsumeRecord(command, consumer);
        }

        /// <summary>
        /// Gets DataTable of all the virtual fields associated with a table
        /// </summary>
        /// <param name="tableName">name of database table</param>
        /// <returns>datatable</returns>
        public DataTable GetVirtualFieldNamesByTableName(string tableName)
        {
            StringBuilder sb = new StringBuilder();
            sb.Append("SELECT MetadataTables.TableName, MetadataFields.FieldName, MetadataFields.FieldDataType, MetadataFields.FieldIsVirtual, ");
            sb.Append("MetadataFields.FieldSuppress, MetadataFields.FieldOrder ");
            sb.Append("FROM  MetadataFields INNER JOIN MetadataTables ON MetadataFields.TableId = MetadataTables.TableId ");
            sb.Append("WHERE (MetadataTables.TableName = '" + tableName + "')");
            sb.Append("AND (MetadataFields.FieldIsVirtual = 1) AND MetadataFields.FieldSuppress != 1");

            string sqlStmt = sb.ToString();
            SqlCommand cmd = DataAccessHelper.CreateCommand(sqlStmt);
            cmd.CommandType = CommandType.Text;
            return DataAccessHelper.GetRecord(cmd).Tables[0];
        }

        ///// <summary>
        ///// SELECT TableName, TableId 
        ///// FROM TableMetadata
        ///// </summary>
        ///// <returns></returns>
        //public DataTable ListTableMetadata()
        //{
        //    SqlCommand com = DataAccessHelper.CreateCommand("spListTableMetadata");
        //    return DataAccessHelper.GetRecord(com).Tables[0];
        //}

        /// <summary>
        /// SELECT MetadataTables.TableName, MetadataFields.FieldName
        /// FROM MetadataTables
        /// INNER JOIN MetadataFields
        /// ON MetadataTables.TableId = MetadataFields.TableId
        /// WHERE MetadataFields.FieldIsVirtual = 1
        /// ORDER BY MetadataTables.TableName, MetadataFields.FieldName
        /// </summary>
        /// <param name="recordConsumer"></param>
        public static void ReadVirtualFieldMetadata(Connectivity.RecordConsumerDelegate recordConsumer)
        {
            string sql = @"
				SELECT
					MetadataTables.TableName, MetadataFields.FieldName
				FROM
					MetadataTables
						INNER JOIN MetadataFields
							ON MetadataTables.TableId = MetadataFields.TableId
				WHERE MetadataFields.FieldIsVirtual = 1
				ORDER BY MetadataTables.TableName, MetadataFields.FieldName";

            SqlCommand cmd = new SqlCommand(sql);

            Connectivity.ConsumeRecord(cmd, recordConsumer);
        }

        /// <summary>
        ///  
        /// </summary>
        /// <param name="recordConsumer"></param>
        public static void ReadColumns(Connectivity.RecordConsumerDelegate recordConsumer)
        {
            string sql =
            @"
SELECT
	C.TABLE_NAME, 
	C.COLUMN_NAME, 
	C.DATA_TYPE,
	C.IS_NULLABLE
FROM INFORMATION_SCHEMA.COLUMNS C
INNER JOIN INFORMATION_SCHEMA.TABLES T
	ON C.TABLE_NAME = T.TABLE_NAME
	AND C.TABLE_CATALOG = T.TABLE_CATALOG
	AND C.TABLE_SCHEMA = T.TABLE_SCHEMA
WHERE C.TABLE_NAME NOT LIKE 'AuditLog_%' AND 
	C.TABLE_NAME NOT LIKE 'Z_%' AND
	C.TABLE_SCHEMA = 'dbo' AND
	T.TABLE_TYPE = 'BASE TABLE'
ORDER BY TABLE_NAME";

            SqlCommand cmd = new SqlCommand(sql);

            Connectivity.ConsumeRecord(cmd, recordConsumer);
        }

        ///// <summary>
        ///// UPDATE FieldMetadata 
        ///// SET FieldName = @FieldName, FieldDescription = @FieldDescription, 
        /////		FieldLabel = @FieldLabel, FieldControlType = @FieldControlType, 
        /////		FieldDataType = @FieldDataType, FieldRowSource = @FieldRowSource 
        /////	WHERE FieldId = @FieldId
        ///// </summary>
        ///// <returns></returns>
        //public bool UpdateFieldMetadata(int fieldId, string name, string desc, string label, string controlType,
        //    string dataType, string rowSource)
        //{
        //    SqlCommand com = DataAccessHelper.CreateCommand("spUpdateFieldMetadataForAdmin");
        //    // set params
        //    AddParameterWithNullCheck(com, "@FieldId", fieldId);
        //    AddParameterWithNullCheck(com, "@FieldName", name);
        //    AddParameterWithNullCheck(com, "@FieldDescription", desc);
        //    AddParameterWithNullCheck(com, "@FieldLabel", label);
        //    AddParameterWithNullCheck(com, "@FieldControlType", controlType);
        //    AddParameterWithNullCheck(com, "@FieldDataType", dataType);
        //    AddParameterWithNullCheck(com, "@FieldRowSource", rowSource);

        //    DataAccessHelper.ExecuteScalar(com);
        //    return true;
        //}

        // comes in handy, was stolen from AdminMetadata.aspx.cs
        //private static void AddParameterWithNullCheck(SqlCommand cmd, string fieldname, object val)
        //{
        //    if (val == null)
        //    {
        //        cmd.Parameters.Add(new SqlParameter(fieldname, DBNull.Value));
        //    }
        //    else
        //    {
        //        cmd.Parameters.Add(new SqlParameter(fieldname, val));
        //    }
        //}

        /*protected override void SetParams()
		{
			this._GetStoredProc = null;
			this._InsertStoredProc = null;
			this._UpdateStoredProc = null;
			this._DeleteStoredProc = null;
			this._GetByParentStoredProc = null;
		}*/

        ///// <summary>
        ///// Gets the values associated with a table and attribute
        ///// </summary>
        ///// <param name="tableId"></param>
        ///// <param name="tableAttributeId"></param>
        ///// <returns></returns>
        //public DataTable GetTableMetaDataTableAttributeValues(int tableId, int tableAttributeId)
        //{
        //    string sql = "SELECT * FROM MetadataTableAttributeValues ";
        //    sql += "LEFT OUTER JOIN MetadataTables ";
        //    sql += "ON MetadataTables.TableId = MetadataTableAttributeValues.TableId ";
        //    sql += "LEFT OUTER JOIN MetadataTableAttributes ";
        //    sql += "ON MetadataTableAttributes.TableAttributeId = MetadataTableAttributeValues.TableAttributeId ";
        //    sql += "WHERE MetadataTableAttributeValues.TableId = @TableId AND MetadataTableAttributeValues.TableAttributeId = @TableAttributeId";
        //    SqlCommand cmd = DataAccessHelper.CreateSqlCommand(sql);
        //    DataAccessHelper.AddIntInputParam(cmd, "TableId", tableId);
        //    DataAccessHelper.AddIntInputParam(cmd, "TableAttributeId", tableAttributeId);
        //    return DataAccessHelper.GetRecord(cmd).Tables[0];
        //}

        ///// <summary>
        ///// Gets all attribute values for a table
        ///// </summary>
        ///// <param name="tableId"></param>
        ///// <returns></returns>
        //public DataTable GetTableMetaDataTableAttributeValues(int tableId)
        //{
        //    string sql = "SELECT * FROM MetadataTableAttributeValues ";
        //    sql += "LEFT OUTER JOIN MetadataTables ";
        //    sql += "ON MetadataTables.TableId = MetadataTableAttributeValues.TableId ";
        //    sql += "LEFT OUTER JOIN MetadataTableAttributes ";
        //    sql += "ON MetadataTableAttributes.TableAttributeId = MetadataTableAttributeValues.TableAttributeId ";
        //    sql += "WHERE MetadataTableAttributeValues.TableId = @TableId AND MetadataTableAttributeValues.TableAttributeId = @TableAttributeId";

        //    SqlCommand cmd = DataAccessHelper.CreateSqlCommand(sql);
        //    DataAccessHelper.AddIntInputParam(cmd, "TableId", tableId);
        //    return DataAccessHelper.GetRecord(cmd).Tables[0];
        //}


        #region TABLE METADATA

        public DataTable GetAllTableMetadata(int? tableId, int? diseaseId)
        {
            string sql =
           @"
            SELECT
            *
            FROM
            (
                SELECT
                    table_metadata.TableId,
                    table_metadata.TableName,
                    table_metadata.TableDescription,
                    table_metadata.TableLabel,
                    table_metadata.TableAttributeId,
                    table_metadata.TableAttributeValueId,
                    table_metadata.TableAttributeName,
                    table_metadata.TableAttributeValue,        
                    disease_metadata.DiseaseId,
                    disease_metadata.DiseaseName,
                    disease_metadata.DiseaseAttributeName,
                    disease_metadata.DiseaseAttributeValueId,
                    disease_metadata.DiseaseAttributeValue
                FROM
                (
                    -- get table metadata
                    SELECT 
                        a.*,
                        b.TableAttributeValueId,
                        c.*,
                        b.TableAttributeValue
                    FROM MetadataTables a
                    LEFT OUTER JOIN MetadataTableAttributeValues b
                        ON a.TableId = b.TableId
                    LEFT OUTER JOIN MetadataTableAttributes  c
                        ON c.TableAttributeId = b.TableAttributeId
                ) table_metadata
                LEFT OUTER JOIN
                (
                    -- get disease mapping to table metadata
                    SELECT
                        a.DiseaseAttributeValueId,
                        a.DiseaseAttributeValue,
                        b.DiseaseAttributeName,
                        c.DiseaseId,
                        c.DiseaseName,
                        f.TableId,
                        f.TableName,
                        e.TableAttributeId,
                        e.TableAttributeName,
                        d.TableAttributeValueId,
                        d.TableAttributeValue
                    FROM DiseaseAttributeValues a
                    INNER JOIN DiseaseAttributes b
                        ON a.DiseaseAttributeId = b.DiseaseAttributeId
                    INNER JOIN Diseases c
                        ON a.DiseaseId = c.DiseaseId
                    INNER JOIN MetadataTableAttributeValues d
                        ON b.DiseaseAttributeName = 'TableAttributeValueId' AND a.DiseaseAttributeValue = CAST(d.TableAttributeValueId AS varchar(255))
                    INNER JOIN MetadataTableAttributes e
                        ON d.TableAttributeId = e.TableAttributeId
                    INNER JOIN MetadataTables f
                        ON d.TableId = f.TableId
                ) disease_metadata 
                -- restrict to table and attribute value pri key
                ON
                    table_metadata.TableId = disease_metadata.TableId
                    AND disease_metadata.TableAttributeValueId = table_metadata.TableAttributeValueId
            ) a
            -- restrict to current table fields, disease and non-disease values only
            WHERE
                 (a.DiseaseId = @DiseaseId OR a.DiseaseId IS NULL) {0}
            ORDER BY
                a.TableName ASC,
                a.TableAttributeName ASC
            ";
            string tableFilter = tableId.HasValue ? " AND a.TableId = @TableId " : "";

            // create command
            SqlCommand com = DataAccessHelper.CreateSqlCommand(string.Format(sql, tableFilter));

            // add params
            DataAccessHelper.AddInputParam(com, "DiseaseId", diseaseId, true);
            DataAccessHelper.AddInputParam(com, "TableId", tableId, true);

            // exec and return
            DataTable dt = DataAccessHelper.GetRecord(com).Tables[0];
            return dt;
        }

        /// <summary>
        /// Consume a uniform view of ALL Table Metadata represented by the UNION of disease specific and DEFAULT metadata.
        /// </summary>
        /// <param name="consumer">Data consumer callback</param>
        public static void ConsumeTableMetadata(Connectivity.RecordConsumerDelegate consumer)
        {
            ConsumeTableMetadata(consumer, null);
        }

        /// <summary>
        /// Consume a uniform view of ALL Table Metadata (optnal table filter) represented by the UNION of disease specific and DEFAULT metadata.
        /// </summary>
        /// <param name="consumer">Data consumer callback</param>
        /// <param name="tableName">Filter table metadata by tablename (optional, non-NULL or EMPTY==All Tables)</param>
        public static void ConsumeTableMetadata(Connectivity.RecordConsumerDelegate consumer, string tableName)
        {
            string sql =
          @"
            SELECT
            *
            FROM
            (
                SELECT
                    table_metadata.TableId,
                    table_metadata.TableName,
                    table_metadata.TableDescription,
                    table_metadata.TableLabel,
                    table_metadata.TableAttributeId,
                    table_metadata.TableAttributeValueId,
                    table_metadata.TableAttributeName,
                    table_metadata.TableAttributeValue,        
                    disease_metadata.DiseaseId,
                    disease_metadata.DiseaseName,
                    disease_metadata.DiseaseAttributeName,
                    disease_metadata.DiseaseAttributeValueId,
                    disease_metadata.DiseaseAttributeValue
                FROM
                (
                    -- get table metadata
                    SELECT 
                        a.*,
                        b.TableAttributeValueId,
                        c.*,
                        b.TableAttributeValue
                    FROM MetadataTables a
                    LEFT OUTER JOIN MetadataTableAttributeValues b
                        ON a.TableId = b.TableId
                    LEFT OUTER JOIN MetadataTableAttributes  c
                        ON c.TableAttributeId = b.TableAttributeId
                ) table_metadata
                LEFT OUTER JOIN
                (
                    -- get disease mapping to table metadata
                    SELECT
                        a.DiseaseAttributeValueId,
                        a.DiseaseAttributeValue,
                        b.DiseaseAttributeName,
                        c.DiseaseId,
                        c.DiseaseName,
                        f.TableId,
                        f.TableName,
                        e.TableAttributeId,
                        e.TableAttributeName,
                        d.TableAttributeValueId,
                        d.TableAttributeValue
                    FROM DiseaseAttributeValues a
                    INNER JOIN DiseaseAttributes b
                        ON a.DiseaseAttributeId = b.DiseaseAttributeId
                    INNER JOIN Diseases c
                        ON a.DiseaseId = c.DiseaseId
                    INNER JOIN MetadataTableAttributeValues d
                        ON b.DiseaseAttributeName = 'TableAttributeValueId' AND a.DiseaseAttributeValue = CAST(d.TableAttributeValueId AS varchar(255))
                    INNER JOIN MetadataTableAttributes e
                        ON d.TableAttributeId = e.TableAttributeId
                    INNER JOIN MetadataTables f
                        ON d.TableId = f.TableId
                ) disease_metadata 
                -- restrict to table and attribute value pri key
                ON
                    table_metadata.TableId = disease_metadata.TableId
                    AND disease_metadata.TableAttributeValueId = table_metadata.TableAttributeValueId
            ) a
            WHERE
                a.TableAttributeId IS NOT NULL {0}
            ORDER BY
                a.TableName ASC,
                a.TableAttributeName ASC
            ";
            // optional where
            string whereSQL = string.Empty;
            if (!string.IsNullOrEmpty(tableName))
            {
                whereSQL = "AND a.TableName = @TableName";
            }
            SqlCommand com = DataAccessHelper.CreateSqlCommand(string.Format(sql, whereSQL));
            if (!string.IsNullOrEmpty(tableName))
            {
                DataAccessHelper.AddStringInputParam(com, "TableName", tableName);
            }
            Connectivity.ConsumeRecord(com, consumer);
        }

        #endregion

        #region FIELD METADATA

        /// <summary>
        /// Gets a uniform view of Field Metadata for the specific table's field.
        /// Represents the UNION of disease specific and DEFAULT metadata.
        /// </summary>
        /// <param name="tableId">The MetadataTable's MetadataTableId</param>
        /// <param name="diseaseId">The optional DiseaseId filter</param>
        /// <returns>A uniform view of a table's fields and metadata</returns>
        public DataTable GetFieldMetadata(int tableId, int? diseaseId)
        {
            return GetFieldMetadata(new KeyValuePair<string, object>("TableId", tableId), diseaseId);
        }

        /// <summary>
        /// Gets a uniform view of Field Metadata for the specific table's field.
        /// Represents the UNION of disease specific and DEFAULT metadata.
        /// </summary>
        /// <param name="tableName">The MetadataTable's TableName</param>
        /// <param name="diseaseId">The optional DiseaseId filter</param>
        /// <returns>A uniform view of a table's fields and metadata</returns>
        public DataTable GetFieldMetadata(string tableName, int? diseaseId)
        {
            return GetFieldMetadata(new KeyValuePair<string, object>("TableName", tableName), diseaseId);
        }

        /// <summary>
        /// Gets a uniform view of Field Metadata by the table's specific filters.
        /// Represents the UNION of disease specific and DEFAULT metadata.
        /// </summary>
        /// <param name="filter">A pair representing the filter MetadataTable's filter</param>
        /// <param name="diseaseId">The optional DiseaseId filter</param>
        /// <returns>A uniform view of a table's fields and metadata</returns>
        private static DataTable GetFieldMetadata(KeyValuePair<string, object> filter, int? diseaseId)
        {
            // build WHERE clause
            string whereSQL =
                string.Format(
                @"             
                    -- restrict to current table fields, disease and non-disease values only
                    WHERE
	                    a.{0} = @{0}
	                    AND (a.DiseaseId = @DiseaseId OR a.DiseaseId IS NULL)
                ", filter.Key);

            // create command
            SqlCommand com = DataAccessHelper.CreateSqlCommand(string.Format(GET_FIELD_METADATA_SQL, whereSQL));

            // add params
            if (filter.Value is int)
            {
                DataAccessHelper.AddIntInputParam(com, filter.Key, filter.Value);
            }
            else if (filter.Value is string)
            {
                DataAccessHelper.AddStringInputParam(com, filter.Key, (string)filter.Value);
            }
            DataAccessHelper.AddInputParam(com, "DiseaseId", diseaseId, true);

            return DataAccessHelper.GetRecord(com).Tables[0];
        }

        /// <summary>
        /// Consume a uniform view of ALL Field Metadata represented by the UNION of disease specific and DEFAULT metadata.
        /// </summary>
        /// <param name="consumer">Data consumer callback</param>
        public static void ConsumeFieldMetadata(Connectivity.RecordConsumerDelegate consumer)
        {
            ConsumeFieldMetadata(consumer, null);
        }

        /// <summary>
        /// Consume a uniform view of ALL (optnal table filter) Field Metadata represented by the UNION of disease specific and DEFAULT metadata.
        /// </summary>
        /// <param name="consumer">Data consumer callback</param>
        /// <param name="tableName">Filter field metadata by tablename (optional, non-NULL or EMPTY==All Table Fields)</param>
        public static void ConsumeFieldMetadata(Connectivity.RecordConsumerDelegate consumer, string tableName)
        {
            // build WHERE clause
            string whereTemplate =
            @"             
            WHERE
                a.AttributeId IS NOT NULL {0}
            ";
            string whereSQL = string.Format(whereTemplate, !string.IsNullOrEmpty(tableName) ? "AND a.TableName = @TableName" : "");

            SqlCommand com = DataAccessHelper.CreateSqlCommand(string.Format(GET_FIELD_METADATA_SQL, whereSQL));
            if (!string.IsNullOrEmpty(tableName))
            {
                DataAccessHelper.AddStringInputParam(com, "TableName", tableName);
            }
            Connectivity.ConsumeRecord(com, consumer);
        }

        #endregion
    }


}
