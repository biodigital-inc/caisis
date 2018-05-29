using System;
using System.Collections;
using System.Data;
using System.Data.SqlClient;



namespace Caisis.DataAccess
{
    /// <summary>
    /// Summary description for IdentifierDa.
    /// </summary>
    public class IdentifierDa : BaseDA
    {

        public DataSet ValidateIdentifier(string Identifier, string IdType)
        {
            SqlCommand com = DataAccessHelper.CreateCommand("spValidateIdentifier");
            DataAccessHelper.AddStringInputParam(com, "Identifier", Identifier);
            DataAccessHelper.AddStringInputParam(com, "IdType", IdType);
            return DataAccessHelper.GetList(com);
        }

        public bool DoesIdentifierExist(string Identifier, string IdType)
        {
            DataSet ds = new DataSet();
            ds = this.ValidateIdentifier(Identifier, IdType);
            if (ds.Tables[0].Rows.Count == 0)
            {
                return false;
            }
            else
            {
                return true;
            }
        }

        /// <summary>
        /// Return Patient's Identifier by type
        /// </summary>
        /// <param name="patientId"></param>
        /// <param name="idType"></param>
        /// <returns></returns>
        public string GetPatientIdentifierByIdType(int patientId, string idType)
        {
            DataTable dt = GetPatientIdentifierTableByIdType(patientId, idType, false);
            if (dt.Rows.Count > 0)
            {
                return dt.Rows[0]["Identifier"].ToString();
            }
            else
            {
                return string.Empty;
            }
        }

        /// <summary>
        /// Return Patient's Identifier table by type
        /// </summary>
        /// <param name="patientId"></param>
        /// <param name="idType"></param>
        /// <returns></returns>
        public DataTable GetPatientIdentifierTableByIdType(int patientId, string idType)
        {
            return GetPatientIdentifierTableByIdType(patientId, idType, true);
        }

        /// <summary>
        /// Gets a list of DISTINCT IdType across patients in datset.
        /// </summary>
        /// <param name="dataset">The dataset SQL.</param>
        /// <returns>A list of unique IdTypes.</returns>
        public DataTable GetPatientSearchIdentifiers(string dataset)
        {
            string sql =
            @"
            SELECT 
	            DISTINCT id.IdType
            FROM Identifiers id
            INNER JOIN ({0}) p
            ON p.PatientId = id.PatientId
            ORDER BY id.IdType ASC
            ";
            string fullSQL = string.Format(sql, dataset);
            SqlCommand com = DataAccessHelper.CreateSqlCommand(fullSQL);
            DataTable dt = DataAccessHelper.GetRecord(com).Tables[0];
            return dt;
        }

        /// <summary>
        /// Return Patient's Identifier Table by type, restricted by columns
        /// </summary>
        /// <param name="patientId">The Patient Id to seach for in Identifier's table.</param>
        /// <param name="idType">The identifier type.</param>
        /// <param name="includeAllColumns">true = SELECT *, false = SEELCT Identifier.</param>
        /// <returns></returns>
        private DataTable GetPatientIdentifierTableByIdType(int patientId, string idType, bool includeAllColumns)
        {
            // list of columns to include in select
            DataTable dt = new DataTable();
            string columns = includeAllColumns ? "*" : "Identifier";
            string sql = "SELECT " + columns + " FROM Identifiers WHERE PatientId = @PatientId AND IdType = @IdType";
            SqlCommand com = DataAccessHelper.CreateSqlCommand(sql);
            DataAccessHelper.AddIntInputParam(com, "PatientId", patientId);
            DataAccessHelper.AddStringInputParam(com, "IdType", idType);
            dt = DataAccessHelper.GetList(com).Tables[0];

            return dt;

        }


    }
}
