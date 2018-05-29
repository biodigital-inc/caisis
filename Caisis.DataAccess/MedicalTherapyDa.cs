using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;


namespace Caisis.DataAccess
{
	/// <summary>
	/// Summary description for Patient.
	/// </summary>
	public class MedicalTherapyDa : BaseDA
	{
	


		public DataSet FormGetRecords(int PatientId, string FormName, string FormType)
		{
			SqlCommand com = DataAccessHelper.CreateCommand("spFormListMedicalTherapy");
			DataAccessHelper.AddIntInputParam(com, "PatientId", PatientId);
			DataAccessHelper.AddStringInputParam(com, "FormName", FormName);
			DataAccessHelper.AddStringInputParam(com, "FormType", FormType);
			DataSet ds = DataAccessHelper.GetList(com);

			return ds;
		}

		// This overload takes a modifier to get specific categories of MedTx
		public DataSet FormGetRecords(int PatientId, string FormName, string FormType, string Modifier)
		{
			SqlCommand com = DataAccessHelper.CreateCommand("spFormListMedicalTherapy");
			DataAccessHelper.AddIntInputParam(com, "PatientId", PatientId);
			DataAccessHelper.AddStringInputParam(com, "FormName", FormName);
			DataAccessHelper.AddStringInputParam(com, "FormType", FormType);
			DataAccessHelper.AddStringInputParam(com, "Modifier", Modifier);
			DataSet ds = DataAccessHelper.GetList(com);

			return ds;
		}

        public DataSet FormGetSpecialRecords(int PatientId, string FormName, string FormType, string searchField, string searchClause, string searchFilter)
        {
            DataSet ds = new DataSet();

            if (FormType == "Dynamic" && !String.IsNullOrEmpty(searchFilter) && !String.IsNullOrEmpty(searchClause) && !String.IsNullOrEmpty(searchField))
            {
                string sql = "SELECT * ";
                sql += "FROM MedicalTherapy ";
                sql += "WHERE (PatientId = @PatientId ) ";
                sql += "AND " + searchField + " " + searchClause + " (" + searchFilter + ") ";
                sql += "ORDER BY MedTxDate ASC, MedTxType ASC, MedTxAgent ASC ";

                SqlCommand com = DataAccessHelper.CreateSqlCommand(sql);
                DataAccessHelper.AddIntInputParam(com, "PatientId", PatientId);

                ds = DataAccessHelper.GetRecord(com);
            }

            return ds;
        }

        public DataSet FormGetMedTxAdminRecords(int MedicalTherapyId)
        {
            DataSet ds = new DataSet();

            string sql = "SELECT * ";
            sql += "FROM MedTxAdministration ";
            sql += "WHERE (MedicalTherapyId = @MedicalTherapyId ) ";
            sql += "ORDER BY MedTxAdminStartDate";

            SqlCommand com = DataAccessHelper.CreateSqlCommand(sql);
            DataAccessHelper.AddIntInputParam(com, "MedicalTherapyId", MedicalTherapyId);

            ds = DataAccessHelper.GetRecord(com);

            return ds;
        }




			


        /// <summary>
        /// Get a list of MedicalTherapy records by patient + MedTxType
        /// </summary>
        /// <param name="patientId"></param>
        /// <param name="exactMatch"></param>
        /// <param name="likeMatch"></param>
        /// <returns></returns>
        public DataTable GetPatientTherapiesByType(int patientId, IEnumerable<string> exactMatch, IEnumerable<string> likeMatch)
        {
            string sql =
            @"
            SELECT * FROM MedicalTherapy
            WHERE PatientId = @PatientId AND ({0}) 
            ";
            // declare params
            var exacts = exactMatch.ToArray();
            var likes = likeMatch.ToArray();
            List<string> matchClauses = new List<string>();
            // build param name
            string[] paramNames = new string[exacts.Length];
            string[] likeParamNames = new string[likes.Length];
            // build exact match
            if (exacts.Length > 0)
            {
                for (int i = 0; i < exacts.Length; i++)
                {
                    string paramName = "@MedTxType_" + i;
                    paramNames[i] = paramName;
                }
                matchClauses.Add(string.Format("MedTxType IN ({0})", string.Join(", ", paramNames)));
            }
            // build like match
            if (likes.Length > 0)
            {
                for (int i = 0; i < likes.Length; i++)
                {
                    string paramName = "@MedTxType_LIKE_" + i;
                    likeParamNames[i] = paramName;
                    string clause = string.Format("MedTxType LIKE '%' + {0} + '%'", paramName);
                    matchClauses.Add(clause);
                }
            }
            string fullSQLL = string.Format(sql, string.Join(" OR ", matchClauses.ToArray()));
            SqlCommand com = DataAccessHelper.CreateSqlCommand(fullSQLL);
            DataAccessHelper.AddIntInputParam(com, "PatientId", patientId);
            // add type params
            for (int i = 0; i < exacts.Length; i++)
            {
                string paramName = "MedTxType_" + i;
                string paramValue = exacts[i];
                DataAccessHelper.AddStringInputParam(com, paramName, paramValue);
            }
            for (int i = 0; i < likes.Length; i++)
            {
                string paramName = "MedTxType_LIKE_" + i;
                string paramValue = likes[i];
                DataAccessHelper.AddStringInputParam(com, paramName, paramValue);
            }
            DataTable dt = DataAccessHelper.GetRecord(com).Tables[0];
            return dt;
        }

        /// <summary>
        /// Get a list of distinct MedTxAgent for a patient
        /// </summary>
        /// <param name="patientId"></param>
        /// <returns></returns>
        public DataTable GetPatientMedTxAgents(int patientId)
        {
            string sql =
@"
SELECT DISTINCT MedTxAgent
FROM MedicalTherapy
WHERE PatientId = @PatientId AND MedTxAgent IS NOT NULL
ORDER BY MedTxAgent ASC
";
            SqlCommand com = DataAccessHelper.CreateSqlCommand(sql);
            DataAccessHelper.AddIntInputParam(com, "PatientId", patientId);

           return DataAccessHelper.GetRecord(com).Tables[0];
        }

        /// <summary>
        /// Gets a list of DISTINCT MedTxAgents by schema arm.
        /// </summary>
        /// <param name="protocolSchemaId"></param>
        /// <returns></returns>
        public DataTable GetProtocolSchemaTherapies(int protocolSchemaId)
        {
            string sql =
@"
SELECT DestValue AS [MedTxAgent], ItemOrder
FROM ProtocolMgr_ProtocolSchemas a
INNER JOIN ProtocolMgr_SchemaItems b
	ON a.ProtocolSchemaId = b.ProtocolSchemaId
INNER JOIN ProtocolMgr_SchemaItemFields c
	ON b.SchemaItemId = c.SchemaItemId
WHERE
	a.ProtocolSchemaId = @ProtocolSchemaId
	AND c.DestTable = 'MedicalTherapy'
	AND c.DestField = 'MedTxAgent'
	AND c.DestValue IS NOT NULL
	AND c.DestValue  <> '[enter]'
GROUP BY
	DestValue,
	ItemOrder
ORDER BY
	CASE WHEN ItemOrder IS NOT NULL THEN 0 ELSE 1 END,
	ItemOrder,
	DestValue
";
            SqlCommand com = DataAccessHelper.CreateSqlCommand(sql);
            DataAccessHelper.AddIntInputParam(com, "ProtocolSchemaId", protocolSchemaId);

            return DataAccessHelper.GetRecord(com).Tables[0];
        }

        /// <summary>
        /// Gets a list of DISTINCT MedTxAgents for patient on schema.
        /// </summary>
        /// <param name="patientSchemaId"></param>
        /// <returns></returns>
        public DataTable GetPatientSchemaTherapies(int patientSchemaId)
        {
            string sql =
@"
SELECT MedTxAgent
FROM ProtocolMgr_PatientSchemas pps
INNER JOIN ProtocolMgr_PatientItems ppi
	ON pps.PatientSchemaId = ppi.PatientSchemaId
INNER JOIN ProtocolMgr_PatientItemFields pif
	ON ppi.PatientItemId = pif.PatientItemId
INNER JOIN ProtocolMgr_SchemaItemFields sif
	ON pif.SchemaItemFieldId = sif.SchemaItemFieldId
INNER JOIN MedicalTherapy medtx
	ON pif.DestTablePrimKey = medtx.MedicalTherapyId
WHERE
	pps.PatientSchemaId = @PatientSchemaId
	AND sif.DestTable = 'MedicalTherapy'
	AND sif.DestField = 'MedTxAgent'
	AND pif.DestTablePrimKey IS NOT NULL
ORDER BY MedTxDate
";
            SqlCommand com = DataAccessHelper.CreateSqlCommand(sql);
            DataAccessHelper.AddIntInputParam(com, "PatientSchemaId", patientSchemaId);

            return DataAccessHelper.GetRecord(com).Tables[0];
        }

	}
}
