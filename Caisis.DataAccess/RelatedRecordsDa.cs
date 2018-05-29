using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;

namespace Caisis.DataAccess
{
    /// <summary>
    /// 
    /// </summary>
    public class RelatedRecordsDa : BaseDA
    {
        /// <summary>
        /// Represents the static value for SrcSystem which indiates SrcSystem is Caisis
        /// </summary>
        public static readonly string CAISIS_SRC_SYSTEM = "Caisis";

        /// <summary>
        /// Returns a list of records
        /// </summary>
        /// <param name="srcTableName"></param>
        /// <param name="srcPriKey"></param>
        /// <param name="destTableName"></param>
        /// <returns></returns>
        public static DataTable GetRecords(string srcTableName, int srcPriKey, string destTableName)
        {
            Dictionary<string, object> fieldsAndValues = new Dictionary<string, object>
            {
                {"SrcTableName" , srcTableName},
                {"SrcPrimaryKey", srcPriKey},
                {"DestTableName" , destTableName},
            };
            return ExecuteSimpleSelect(fieldsAndValues);

        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="srcTableName"></param>
        /// <param name="srcPriKey"></param>
        /// <param name="destTableName"></param>
        /// <param name="destPriKey"></param>
        /// <returns></returns>
        public static DataTable GetRecord(string srcTableName, int srcPriKey, string destTableName, int destPriKey)
        {
            Dictionary<string, object> fieldsAndValues = new Dictionary<string, object>
            {
                {"SrcTableName" , srcTableName},
                {"SrcPrimaryKey", srcPriKey},
                {"DestTableName" , destTableName},
                {"DestPrimaryKey", destPriKey}
            };
            return ExecuteSimpleSelect(fieldsAndValues);
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="srcTableName"></param>
        /// <param name="srcPriKey"></param>
        /// <param name="srcSecPriKey"></param>
        /// <param name="destTableName"></param>
        /// <param name="destPriKey"></param>
        /// <returns></returns>
        public static DataTable GetRecord(string srcTableName, int srcPriKey, int srcSecPriKey, string destTableName, int destPriKey)
        {
            Dictionary<string, object> fieldsAndValues = new Dictionary<string, object>
            {
                {"SrcTableName" , srcTableName},
                {"SrcPrimaryKey", srcPriKey},
                {"SrcSecPrimaryKey", srcSecPriKey},
                {"DestTableName" , destTableName},
                {"DestPrimaryKey", destPriKey}
            };
            return ExecuteSimpleSelect(fieldsAndValues);
        }

        /// <summary>
        /// Returns a list of records from the dest table which related to the source system.
        /// collapseRecords=true, only records from dest table which are related to the source tables (.ie., INNER JOIN)
        /// collapseRecords=false, all records from dest table including optional related source records (i.e., LEFT JOIN)
        /// </summary>
        /// <param name="patientId">The patient id</param>
        /// <param name="sourceTable">The table which to check for relations</param>
        /// <param name="sourceKeyName">The pri key name of the source table</param>
        /// <param name="sourceKeyValue">The pri key value of the source table</param>
        /// <param name="destTable">The table which to check for relation</param>
        /// <param name="destTableKeyName">The table's pri key used for relation</param>
        /// <param name="collapseRecords">True=inner join, False=outer join</param>
        /// <returns></returns>
        public static DataTable GetRelatedRecordsByTableAndKey(int patientId, string destTable, string destTableKeyName, int? destTableKeyValue, string sourceTable, string sourceTableKeyName, bool collapseRecords)
        {
            string sql = @"
            SELECT
	            a.*,
	            b.RelatedRecordId,
	            b.DestTableName,
	            b.DestPrimaryKey,
	            b.SrcTableName,
	            b.SrcPrimaryKey,
	            b.RelationStrength 
            FROM {2} a
            {4} RelatedRecords b
            ON
	            b.SrcSystem = 'Caisis'
	            AND b.SrcTableName = @SrcTableName
	            AND b.SrcPrimaryKey = a.{3}
	            AND b.DestTableName = @DestTableName
            {4} {0} c
	            ON b.DestPrimaryKey = c.{1}
            WHERE
	            a.PatientId = @PatientId
            ORDER BY
	            CASE WHEN RelatedRecordId IS NULL THEN 1
	            ELSE 0
	            END ASC,
                b.DestPrimaryKey ASC
            ";

            // build dynamic sql

            // collapseRecords==only include records which are related
            string collapseStatement = collapseRecords ? "INNER JOIN" : "LEFT OUTER JOIN";
            string[] formatParams = new string[] { destTable, destTableKeyName, sourceTable, sourceTableKeyName, collapseStatement };
            string formattedSQL = string.Format(sql, formatParams);
            // build command
            SqlCommand com = DataAccessHelper.CreateSqlCommand(formattedSQL);
            // add required params
            DataAccessHelper.AddIntInputParam(com, "PatientId", patientId);
            DataAccessHelper.AddStringInputParam(com, "SrcSystem", CAISIS_SRC_SYSTEM);
            DataAccessHelper.AddStringInputParam(com, "SrcTableName", sourceTable);
            if (destTableKeyValue.HasValue)
            {
                DataAccessHelper.AddIntInputParam(com, "DestPrimaryKey", destTableKeyValue.Value);
            }
            else
            {
                DataAccessHelper.AddInputParam(com, "DestPrimaryKey", null, true);
            }
            DataAccessHelper.AddStringInputParam(com, "DestTableName", destTable);

            DataTable dt = DataAccessHelper.GetRecord(com).Tables[0];
            return dt;
        }

        public static DataTable GetRelatedRecordsByTableAndKey(int patientId, string destTableName, string destTableKeyName, int? destTableKeyValue, IDictionary<KeyValuePair<string, string>, KeyValuePair<string, string>> srcTableLookup)
        {
            string sql = @"
            SELECT	            
	            b.RelatedRecordId,
                b.SrcTableName,
                b.SrcPrimaryKey,
	            b.DestTableName,
	            b.DestPrimaryKey,
	            b.RelationStrength,
                {3} AS SrcTableField,
                {4} AS SrcTableSortField 
            FROM {1} a
            INNER JOIN RelatedRecords b
            ON
	            b.SrcSystem = 'Caisis'
	            AND b.SrcTableName = @SrcTableName_{1}
	            AND b.SrcPrimaryKey = a.{2}
	            AND b.DestTableName = @DestTableName
	            AND b.DestPrimaryKey = @DestPrimaryKey
            INNER JOIN {0} c
	            ON b.DestPrimaryKey = @DestPrimaryKey
            WHERE
	            a.PatientId = @PatientId
             ";

            List<string> buffer = new List<string>();
            foreach (var srcTablePair in srcTableLookup)
            {
                string srcTableName = srcTablePair.Key.Key;
                string srcTablePriKeyName = srcTablePair.Key.Value;
                string srcTableDisplayColumn = srcTablePair.Value.Key;
                string srcTableSortColumn = srcTablePair.Value.Value;
                srcTableDisplayColumn = !string.IsNullOrEmpty(srcTableDisplayColumn) ? "a." + srcTableDisplayColumn : "''";
                srcTableSortColumn = !string.IsNullOrEmpty(srcTableSortColumn) ? "a." + srcTableSortColumn : "''";

                string[] formatParams = new string[] { destTableName, srcTableName, srcTablePriKeyName, srcTableDisplayColumn, srcTableSortColumn };
                string formattedSQL = string.Format(sql, formatParams);

                buffer.Add(formattedSQL);
            }

            string fullSQL = string.Join(" UNION ", buffer.ToArray());
            // build command
            SqlCommand com = DataAccessHelper.CreateSqlCommand(fullSQL);
            // add required params
            DataAccessHelper.AddIntInputParam(com, "PatientId", patientId);
            DataAccessHelper.AddStringInputParam(com, "SrcSystem", CAISIS_SRC_SYSTEM);
            DataAccessHelper.AddStringInputParam(com, "DestTableName", destTableName);
            if (destTableKeyValue.HasValue)
            {
                DataAccessHelper.AddIntInputParam(com, "DestPrimaryKey", destTableKeyValue.Value);
            }
            else
            {
                DataAccessHelper.AddInputParam(com, "DestPrimaryKey", null, true);
            }
            // add dynamic params
            foreach (var srcTablePair in srcTableLookup)
            {
                string srcTableName = srcTablePair.Key.Key;
                DataAccessHelper.AddStringInputParam(com, "SrcTableName" + "_" + srcTableName, srcTableName);
            }

            DataTable dt = DataAccessHelper.GetRecord(com).Tables[0];
            return dt;
        }

        /// <summary>
        /// Executes a simple select on the RelatedRecords table with list of fields and their realted values
        /// </summary>
        /// <param name="fieldsAndValues">a mapping of fields to value, i.,e., SrcTable="Patients",SrcPriKey=1,etc...</param>
        /// <returns></returns>
        private static DataTable ExecuteSimpleSelect(Dictionary<string, object> fieldsAndValues)
        {
            SqlCommand com = DataAccessHelper.CreateSqlCommand("");
            List<string> sqlParams = new List<string>(fieldsAndValues.Count);
            foreach (string paramName in fieldsAndValues.Keys)
            {
                object paramValue = fieldsAndValues[paramName];
                Type paramType = paramValue.GetType();

                string param_expr = "{0} = @{0}";
                string full_expr = string.Format(param_expr, paramName);

                if (paramType == typeof(int))
                {
                    DataAccessHelper.AddIntInputParam(com, paramName, paramValue);
                    sqlParams.Add(full_expr);
                }
                else if (paramType == typeof(string))
                {
                    DataAccessHelper.AddStringInputParam(com, paramName, paramValue.ToString());
                    sqlParams.Add(full_expr);
                }
            }
            // Add default source system
            sqlParams.Add("SrcSystem = @SrcSystem");
            DataAccessHelper.AddStringInputParam(com, "SrcSystem", CAISIS_SRC_SYSTEM);
            // generate dynamic sql, "select * from table where a = @a AND b = @b AND c = @c ..."
            com.CommandText = "SELECT * FROM RelatedRecords  WHERE " + string.Join(" AND ", sqlParams.ToArray());

            // execute statement and return table
            DataTable dt = DataAccessHelper.GetRecord(com).Tables[0];
            return dt;
        }
    }
}
