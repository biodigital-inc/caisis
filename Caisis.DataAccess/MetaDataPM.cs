using System;
using System.Data;
using System.Configuration;
using System.Text;

using System.Data;
using System.Data.SqlClient;

namespace Caisis.DataAccess
{
    /// <summary>
    /// Summary description for MetaDataPM
    /// </summary>
    public class MetadataPM : MetadataDa
    {
        public MetadataPM()
        {
            //
            // TODO: Add constructor logic here
            //
        }

        public DataTable GetOptionalFieldsByTableName(string tableName, string SchemaItemId)
        {
            StringBuilder sql = new StringBuilder();
            sql.Append(@"SELECT MetadataTables.TableName, MetadataTables.TableLabel, MetadataFields.FieldName, MetadataFields.FieldSuppress, MetadataFields.FieldOrder 
                            FROM information_schema.columns
	                            JOIN MetadataFields
		                            ON information_schema.columns.column_name = MetadataFields.FieldName
	                            JOIN MetadataTables
		                            ON information_schema.columns.table_name = MetadataTables.TableName
		                            And MetadataFields.TableId = MetadataTables.TableId
                            WHERE information_schema.columns.table_name = '" + tableName +
                            @"' And information_schema.columns.column_name NOT IN (
	                            SELECT ProtocolMgr_SchemaItemFields.DestField
	                            FROM ProtocolMgr_SchemaItemFields
	                            WHERE ProtocolMgr_SchemaItemFields.SchemaItemId = " + SchemaItemId +
                            @" )
                            And information_schema.columns.column_name NOT IN (
	                            SELECT information_schema.constraint_column_usage.column_name
	                            FROM information_schema.constraint_column_usage
	                            WHERE information_schema.constraint_column_usage.table_name = information_schema.columns.table_name
	                            And information_schema.constraint_column_usage.column_name LIKE '%Id'
                            )
                            And information_schema.columns.column_name NOT IN (
	                            'EnteredBy',
	                            'EnteredTime',
	                            'UpdatedBy',
	                            'UpdatedTime',
	                            'LockedBy',
	                            'LockedTime'
                            )
                            ORDER BY ordinal_position");

            SqlCommand cmd = DataAccessHelper.CreateCommand(sql.ToString());
            cmd.CommandType = CommandType.Text;
            return DataAccessHelper.GetRecord(cmd).Tables[0];
        }

        public DataTable GetOptionalFieldMetadataByTableName(string tableName, string SchemaItemId)
        {
            StringBuilder sb = new StringBuilder();
            sb.Append("SELECT MetadataTables.TableName, MetadataFields.FieldName, MetadataFields.FieldDataType, MetadataFields.FieldIsVirtual, ");
            sb.Append("MetadataFields.FieldSuppress, MetadataFields.FieldOrder, MetadataFieldAttributes.AttributeName, MetadataFieldAttributeValues.AttributeValue ");
            sb.Append(@"FROM information_schema.columns
	                        JOIN MetadataFields
		                        ON information_schema.columns.column_name = MetadataFields.FieldName
	                        JOIN MetadataTables
		                        ON information_schema.columns.table_name = MetadataTables.TableName
		                        And MetadataFields.TableId = MetadataTables.TableId
                            INNER JOIN MetadataFieldAttributeValues ON MetadataFields.FieldId = MetadataFieldAttributeValues.FieldId 
                            INNER JOIN MetadataFieldAttributes ON MetadataFieldAttributeValues.AttributeId = MetadataFieldAttributes.AttributeId 
                        WHERE information_schema.columns.table_name = '" + tableName +
                        @"' And information_schema.columns.column_name NOT IN (
	                        SELECT ProtocolMgr_SchemaItemFields.DestField
	                        FROM ProtocolMgr_SchemaItemFields
	                        WHERE ProtocolMgr_SchemaItemFields.SchemaItemId = " + SchemaItemId +
                        @" )
                        And information_schema.columns.column_name NOT IN (
	                        SELECT information_schema.constraint_column_usage.column_name
	                        FROM information_schema.constraint_column_usage
	                        WHERE information_schema.constraint_column_usage.table_name = information_schema.columns.table_name
	                        And information_schema.constraint_column_usage.column_name LIKE '%Id'
                        )
                        And information_schema.columns.column_name NOT IN (
	                        'EnteredBy',
	                        'EnteredTime',
	                        'UpdatedBy',
	                        'UpdatedTime',
	                        'LockedBy',
	                        'LockedTime'
                        )
                        ORDER BY ordinal_position");

            string sqlStmt = sb.ToString();
            SqlCommand cmd = DataAccessHelper.CreateCommand(sqlStmt);
            cmd.CommandType = CommandType.Text;
            return DataAccessHelper.GetRecord(cmd).Tables[0];
        }

        public DataTable GetFieldsByTableName(string tableName, string PatientItemId)
        {
            StringBuilder sql = new StringBuilder();
            sql.Append(@"SELECT MetadataTables.TableName, MetadataTables.TableLabel, MetadataFields.FieldName, MetadataFields.FieldSuppress, 
                            MetadataFields.FieldOrder, MetadataFields.FieldDataType AS data_type, 
                            ProtocolMgr_SchemaItems.ItemDescription, ProtocolMgr_SchemaItems.SchemaItemId,
	                        ProtocolMgr_SchemaItemFields.DestTable 'TableName', ProtocolMgr_SchemaItemFields.DestField 'FieldName',
	                        ProtocolMgr_SchemaItemFields.DestValue 'FieldValue', ProtocolMgr_SchemaItemFields.DisplayOrder,
	                        ProtocolMgr_PatientItemFields.PatientItemFieldId, ProtocolMgr_PatientItemFields.DestTablePrimKey, 
                            ProtocolMgr_PatientItems.ScheduledDate, ProtocolMgr_PatientItems.FirstAnticipatedDate,
	                        ProtocolMgr_PatientItems.LastAnticipatedDate, ProtocolMgr_PatientSchemas.PatientId
                            FROM ProtocolMgr_PatientItems
	                            JOIN ProtocolMgr_ItemTimeline
		                            ON ProtocolMgr_PatientItems.ItemTimelineId = ProtocolMgr_ItemTimeline.ItemTimelineId
	                            JOIN ProtocolMgr_SchemaItems
		                            ON ProtocolMgr_ItemTimeline.SchemaItemId = ProtocolMgr_SchemaItems.SchemaItemId
	                            JOIN ProtocolMgr_SchemaItemFields
		                            ON ProtocolMgr_SchemaItems.SchemaItemId = ProtocolMgr_SchemaItemFields.SchemaItemId
	                            JOIN ProtocolMgr_PatientItemFields
		                            ON ProtocolMgr_SchemaItemFields.SchemaItemFieldId = ProtocolMgr_PatientItemFields.SchemaItemFieldId
		                            And ProtocolMgr_PatientItems.PatientItemId = ProtocolMgr_PatientItemFields.PatientItemId
	                            JOIN MetadataTables
		                            ON ProtocolMgr_SchemaItemFields.DestTable = MetadataTables.TableName
	                            JOIN MetadataFields
		                            ON MetadataTables.TableId = MetadataFields.TableId
		                            And ProtocolMgr_SchemaItemFields.DestField = MetadataFields.FieldName
	                            JOIN ProtocolMgr_PatientSchemas
		                            ON ProtocolMgr_PatientItems.PatientSchemaId = ProtocolMgr_PatientSchemas.PatientSchemaId ");
            sql.Append(" WHERE ProtocolMgr_PatientItems.PatientItemId = " + PatientItemId + " AND ");
            sql.Append("(MetadataTables.TableName = '" + tableName + "' AND FieldSuppress = 0) ");
            sql.Append("ORDER BY MetadataFields.FieldOrder ASC, ProtocolMgr_SchemaItemFields.DisplayOrder");

            SqlCommand cmd = DataAccessHelper.CreateCommand(sql.ToString());
            cmd.CommandType = CommandType.Text;
            return DataAccessHelper.GetRecord(cmd).Tables[0];
        }

        public DataTable GetFieldMetadataByTableName(string tableName, string PatientItemId)
        {
            StringBuilder sb = new StringBuilder();
            sb.Append("SELECT MetadataTables.TableName, MetadataFields.FieldName, MetadataFields.FieldDataType, MetadataFields.FieldIsVirtual, ");
            sb.Append("MetadataFields.FieldSuppress, MetadataFields.FieldOrder, MetadataFieldAttributes.AttributeName, MetadataFieldAttributeValues.AttributeValue ");
            sb.Append(@"FROM ProtocolMgr_PatientItems
	                            JOIN ProtocolMgr_ItemTimeline
		                            ON ProtocolMgr_PatientItems.ItemTimelineId = ProtocolMgr_ItemTimeline.ItemTimelineId
	                            JOIN ProtocolMgr_SchemaItems
		                            ON ProtocolMgr_ItemTimeline.SchemaItemId = ProtocolMgr_SchemaItems.SchemaItemId
	                            JOIN ProtocolMgr_SchemaItemFields
		                            ON ProtocolMgr_SchemaItems.SchemaItemId = ProtocolMgr_SchemaItemFields.SchemaItemId
	                            JOIN ProtocolMgr_PatientItemFields
		                            ON ProtocolMgr_SchemaItemFields.SchemaItemFieldId = ProtocolMgr_PatientItemFields.SchemaItemFieldId
		                            And ProtocolMgr_PatientItems.PatientItemId = ProtocolMgr_PatientItemFields.PatientItemId
	                            JOIN MetadataTables
		                            ON ProtocolMgr_SchemaItemFields.DestTable = MetadataTables.TableName
	                            JOIN MetadataFields
		                            ON MetadataTables.TableId = MetadataFields.TableId
		                            And ProtocolMgr_SchemaItemFields.DestField = MetadataFields.FieldName
	                            JOIN ProtocolMgr_PatientSchemas
		                            ON ProtocolMgr_PatientItems.PatientSchemaId = ProtocolMgr_PatientSchemas.PatientSchemaId ");
            sb.Append("INNER JOIN MetadataFieldAttributeValues ON MetadataFields.FieldId = MetadataFieldAttributeValues.FieldId ");
            sb.Append("INNER JOIN MetadataFieldAttributes ON MetadataFieldAttributeValues.AttributeId = MetadataFieldAttributes.AttributeId ");
            sb.Append(" WHERE ProtocolMgr_PatientItems.PatientItemId = " + PatientItemId + " AND ");
            sb.Append("(MetadataTables.TableName = '" + tableName + "')");

            string sqlStmt = sb.ToString();
            SqlCommand cmd = DataAccessHelper.CreateCommand(sqlStmt);
            cmd.CommandType = CommandType.Text;
            return DataAccessHelper.GetRecord(cmd).Tables[0];
        }
    }
}
