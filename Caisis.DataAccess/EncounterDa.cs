using System;
using System.Collections;
using System.Data;
using System.Data.SqlClient;




namespace Caisis.DataAccess
{
	/// <summary>
	/// Summary description for EncounterDa.
	/// </summary>
	public class EncounterDa : BaseDA
	{
		
		/*
		public DataSet ValidateUnique(DataRow dr)  
		{
			SqlCommand com = DataAccessHelper.CreateCommand("spValidateEncounter");
			DataAccessHelper.AddIntInputParam(com, "PatientId", (int)dr["PatienId"]);
			string physician = "";

			if (dr["EncPhysician"] != DBNull.Value)  
			{
				physician = (string)dr["EncPhysician"];
			}

			DataAccessHelper.AddStringInputParam(com, "EncPhysician", physician);

			DataAccessHelper.AddDateTimeInputParam(com, "EncDate", DataAccessHelper.ToDBDate(dr["EncDate"]));
			

			return DataAccessHelper.GetList(com);
		}
        */

        public DataSet FormGetRecords(int PatientId, string FormName, string FormType)
        {
            DataSet ds = new DataSet();

            if (FormType == "Dynamic")
            {
                string sql = @"
                  SELECT * 
                  FROM Encounters
                  WHERE (PatientId = @PatientId )
                  ORDER BY EncDate ASC ";

                SqlCommand com = DataAccessHelper.CreateSqlCommand(sql);
                DataAccessHelper.AddIntInputParam(com, "PatientId", PatientId);

                ds = DataAccessHelper.GetRecord(com);
            }

            return ds;
        }

        //gets all ROS of each encounter
        public DataSet FormGetEncROSRecords(int PatientId, string FormName, string FormType)
        {
            DataSet ds = new DataSet();

            string sql = "";
            if (FormType == "Dynamic")
            {
                sql = "SELECT enc.*, ros.* ";
                sql += "FROM Encounters enc ";
                sql += "INNER JOIN EncReviewOfSystems ros ON enc.EncounterID = ros.EncounterID ";
                sql += "WHERE (enc.PatientId = @PatientId ) ";
                sql += "ORDER BY EncReviewOfSystemId ASC ";

                SqlCommand com = DataAccessHelper.CreateSqlCommand(sql);
                DataAccessHelper.AddIntInputParam(com, "PatientId", PatientId);

                ds = DataAccessHelper.GetRecord(com);
            }

            return ds;
        }
	}
}