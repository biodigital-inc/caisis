using System;
using System.Collections;
using System.Data;
using System.Data.SqlClient;

namespace Caisis.DataAccess
{
    public class ClinicalStageDa : BaseDA
    {
        public DataTable FormGetRecords(int PatientId)
		{
            DataTable dt = new DataTable();
            string sql = "SELECT * FROM ClinicalStages WHERE PatientId=" + PatientId; 
           
			DataAccessHelper.ExecuteSqlSelect(sql,dt);
			return dt;
		}

        public DataTable GetClinicalStages(int PatientId, string ClinStageDisease)
        {
            DataTable dt = new DataTable();
            string sql = "SELECT * FROM ClinicalStages WHERE PatientId = " + PatientId.ToString();
            sql += " AND ClinStageDisease = '" + ClinStageDisease + "'";

            DataAccessHelper.ExecuteSqlSelect(sql, dt);
            return dt;
        }

    }
}
