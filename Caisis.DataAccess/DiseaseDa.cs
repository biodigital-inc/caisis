using System;
using System.Data;
using System.Data.SqlClient;
using System.Collections;



namespace Caisis.DataAccess
{
	/// <summary>
	/// Summary description for DiseaseDa.
	/// </summary>
	public class DiseaseDa : BaseDA
	{
		protected override void SetParams()  
		{
			this._GetStoredProc = "spGetDiseaseRecord";
			this._InsertStoredProc = "spInsertDiseasesRecord";
			this._UpdateStoredProc = "spUpdateDiseasesRecord";
			this._DeleteStoredProc = "spDeleteDiseasesRecord";
			this._GetByParentStoredProc = "spGetDiseases";
		}

		public DataSet GetDiseases()  
		{
			SqlCommand com = DataAccessHelper.CreateCommand("spGetDiseases");
		
			return DataAccessHelper.GetRecord(com);
		}

		public int GetPrimKey(string diseaseName)  
		{
			SqlCommand com = DataAccessHelper.CreateCommand("spGetDatasetDimensionValue");
			
			DataAccessHelper.AddStringInputParam(com, "Dimension", "Diseases");
			DataAccessHelper.AddStringInputParam(com, "InputValue", diseaseName);
			DataAccessHelper.AddIntOutputParam(com, "OutputValue");
			
			Hashtable outParams = DataAccessHelper.ExecuteScalar(com);
			
			if(outParams["OutputValue"] != System.DBNull.Value)
			{
				return (int)outParams["OutputValue"];
			}
			else
			{
				return -1;
			}
		}

        /// <summary>
        /// Returns a list of ALL diseases with optional attribute
        /// </summary>
        /// <param name="attributeName"></param>
        /// <returns></returns>
        public DataTable GetDiseasesByAttribute(string attributeName)
        {
            return GetDiseasesByAttribute(attributeName, null);
        }

        /// <summary>
        /// Returns a list of Diseases with optional attribute values.
        /// NULL or empty values ignored.
        /// </summary>
        /// <param name="attributeName"></param>
        /// <param name="attributeValue"></param>
        /// <returns></returns>
        public DataTable GetDiseasesByAttribute(string attributeName, string attributeValue)
        {
            return GetDiseasesByAttribute(null, attributeName, attributeValue);
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="diseaseId"></param>
        /// <param name="attributeName"></param>
        /// <param name="attributeValue"></param>
        /// <returns></returns>
        public DataTable GetDiseasesByAttribute(int? diseaseId, string attributeName, string attributeValue)
        {
            string sql =
          @"
            SELECT
	            DiseaseId,
	            DiseaseName,
	            DiseaseAttributeId,
	            DiseaseAttributeValueId,
	            DiseaseAttributeValue,
	            DiseaseAttributeName
            FROM
            (
	            SELECT
		            a.DiseaseId,
		            a.DiseaseName,
		            b.DiseaseAttributeId,
		            b.DiseaseAttributeValueId,
		            b.DiseaseAttributeValue,
		            b.DiseaseAttributeName,
		            ROW_NUMBER() OVER (PARTITION BY a.DiseaseId ORDER BY b.DiseaseAttributeValueId ASC) AS RowNum
	            FROM Diseases a                    
	            {0} JOIN
	            (
		            SELECT
			            a.DiseaseId,
			            a.DiseaseAttributeId,
			            a.DiseaseAttributeValueId,
			            a.DiseaseAttributeValue,
			            b.DiseaseAttributeName
		            FROM DiseaseAttributeValues a
		            INNER JOIN DiseaseAttributes b
			            ON a.DiseaseAttributeId = b.DiseaseAttributeId
		            WHERE b.DiseaseAttributeName = @DiseaseAttributeName
	            ) b
	            ON a.DiseaseId = b.DiseaseId
                {1}
            ) a
           -- WHERE RowNum = 1
            {2}
            ORDER BY DiseaseName ASC
            ";

            // by disease, inner, else outer
            string joinClause = diseaseId.HasValue ? "INNER" : "LEFT OUTER";
            string optWhereDisease = diseaseId.HasValue ? " WHERE a.DiseaseId = @DiseaseId " : "";
            string optWhereValue = !string.IsNullOrEmpty(attributeValue) ? " WHERE a.DiseaseAttributeValue = @DiseaseAttributeValue" : "";

            SqlCommand cmd = DataAccessHelper.CreateSqlCommand(string.Format(sql, joinClause, optWhereDisease, optWhereValue));
            // add key field
            DataAccessHelper.AddStringInputParam(cmd, "DiseaseAttributeName", attributeName);
            // add optional filters
            if (diseaseId.HasValue)
            {
                DataAccessHelper.AddIntInputParam(cmd, "DiseaseId", diseaseId.Value);
            }
            if (!string.IsNullOrEmpty(attributeValue))
            {
                DataAccessHelper.AddStringInputParam(cmd, "DiseaseAttributeValue", attributeValue);
            }
            // execute update
            return DataAccessHelper.GetList(cmd).Tables[0];
        }

        /// <summary>
        /// Returns a list of diseases with attribute IsView = true
        /// </summary>
        /// <returns></returns>
        public DataTable GetDiseaseViews()
        {
            return GetDiseasesByAttribute("IsView", true.ToString());
        }

	}
}
