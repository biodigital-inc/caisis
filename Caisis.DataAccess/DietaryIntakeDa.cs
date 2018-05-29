using System;
using System.Collections;
using System.Data;
using System.Data.SqlClient;



namespace Caisis.DataAccess
{
	/// <summary>
	/// Summary description for DietaryIntake.
	/// </summary>
	public class DietaryIntakeDa : BaseDA
	{
        protected override void SetParams()
		{
			this._GetStoredProc = "spGetDietaryIntakeRecord";
			this._InsertStoredProc = "spInsertDietaryIntakeRecord";
			this._UpdateStoredProc = "spUpdateDietaryIntakeRecord";
			this._DeleteStoredProc = "spDeleteDietaryIntakeRecord";
			this._GetByParentStoredProc = "spGetDietaryIntake";
		}

        public DataSet FormGetRecords(int PatientId, string FormName, string FormType)
        {
            DataSet ds = new DataSet();

            if (FormType == "Dynamic")
            {
                string sql = @"
                  SELECT * 
                  FROM DietaryIntake
                  LEFT JOIN DietaryIntakeItems ON DietaryIntakeItems.DietaryIntakeId =  DietaryIntake.DietaryIntakeId   
                  WHERE (PatientId = @PatientId ) 
                  ORDER BY IntakeDate ASC ";

                SqlCommand com = DataAccessHelper.CreateSqlCommand(sql);
                DataAccessHelper.AddIntInputParam(com, "PatientId", PatientId);
                ds = DataAccessHelper.GetRecord(com);
            }

            return ds;
        }
			
	}
}
