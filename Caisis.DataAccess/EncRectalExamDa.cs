using System;
using System.Collections;
using System.Data;
using System.Data.SqlClient;




namespace Caisis.DataAccess
{
	/// <summary>
	/// Summary description for EncRectalExamDa.
	/// </summary>
	public class EncRectalExamDa : BaseDA //ChildDataAccessRelOne
	{
		
		public DataSet FormGetLastEncRectalExam(int PatientId)
		{
			SqlCommand com = DataAccessHelper.CreateCommand("spFormGetLastEncRectalExam");
			DataAccessHelper.AddIntInputParam(com, "PatientId", PatientId);
			DataSet ds = DataAccessHelper.GetList(com);

			return ds;
		}


        /// <summary>
        /// 
        /// </summary>
        /// <param name="patientId"></param>
        /// <returns></returns>
        public DataTable GetDREHistory(int patientId)
        {
            string sql = "SELECT Encounters.*,EncRectalExams.* FROM Encounters ";
            sql += "INNER JOIN EncRectalExams ON ";
            sql += "Encounters.EncounterId = EncRectalExams.EncounterId ";
            //sql += "LEFT JOIN EncRectalExamFindings ON ";
            //sql += "Encounters.EncounterId = EncRectalExamFindings.EncounterId ";
            sql += "WHERE Encounters.PatientId = @PatientId ";
            sql += "ORDER BY Encounters.EncDate";


            SqlCommand com = DataAccessHelper.CreateSqlCommand(sql);
            DataAccessHelper.AddIntInputParam(com, "PatientId", patientId);
            DataTable dt = DataAccessHelper.GetRecord(com).Tables[0];
            return dt;
        }


        /// <summary>
        /// 
        /// </summary>
        /// <param name="patientId"></param>
        /// <returns></returns>
        public DataTable GetAllDREFindings(int patientId)
        {
            string sql = "SELECT EncRectalExamFindings.* FROM Encounters ";
            sql += "INNER JOIN EncRectalExamFindings ON ";
            sql += "Encounters.EncounterId = EncRectalExamFindings.EncounterId ";
            sql += "WHERE Encounters.PatientId = @PatientId ";
            sql += "ORDER BY DRE_FindSide,DRE_FindLaterality,DRE_FindLevel";


            SqlCommand com = DataAccessHelper.CreateSqlCommand(sql);
            DataAccessHelper.AddIntInputParam(com, "PatientId", patientId);
            DataTable dt = DataAccessHelper.GetRecord(com).Tables[0];
            return dt;
        }

	}
}