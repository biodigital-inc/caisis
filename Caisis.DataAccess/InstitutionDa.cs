using System;
using System.Data;
using System.Data.SqlClient;
using System.Collections;

namespace Caisis.DataAccess
{
	/// <summary>
	/// Summary description for InstitutionDa.
	/// </summary>
	public class InstitutionDa : BaseDA
	{
		public int GetPrimKey(string institutionName)  
		{
			SqlCommand com = DataAccessHelper.CreateCommand("spGetDatasetDimensionValue");
			
			DataAccessHelper.AddStringInputParam(com, "Dimension", "Institutions");
			DataAccessHelper.AddStringInputParam(com, "InputValue", institutionName);
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

      
        public DataSet GetDistinctSurgeryInstitution() // need to select from dataset?  
        {
            SqlCommand com = DataAccessHelper.CreateCommand("spGetDistinctSurgeryInstitutions");
            return DataAccessHelper.GetList(com);
        }

        /// <summary>
        /// Returns all records in table
        /// </summary>
        /// <returns></returns>
        public DataTable GetInstitutions()
        {
            DataTable dt = new DataTable();
            string sql = "SELECT Institutions.InstitutionId, Institutions.Institution FROM Institutions";
            DataAccessHelper.ExecuteSqlSelect(sql, dt);
            return dt;
        }

    }
}
