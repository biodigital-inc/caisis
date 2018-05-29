using System;
using System.Data;
using System.Data.SqlClient;



using System.Collections;


namespace Caisis.DataAccess
{
	/// <summary>
	/// Summary description for ProstatectomyDa.
	/// </summary>
	public class ProstatectomyDa : BaseDA//ChildDataAccessRelOne
	{
	
		public DataSet FormGetRecord(int PatientId, string FormName, string FormType)
		{
//			SqlCommand com = DataAccessHelper.CreateCommand("spFormGetProcProstatectomiesRecord");
            SqlCommand com = DataAccessHelper.CreateCommand("spFormGetProstatectomyRecord");
            DataAccessHelper.AddIntInputParam(com, "PatientId", PatientId);
			DataAccessHelper.AddStringInputParam(com, "FormName", FormName);
			DataAccessHelper.AddStringInputParam(com, "FormType", FormType);
			DataSet ds = DataAccessHelper.GetList(com);

			return ds;
		}


		public Hashtable FormGetNerveStatus(int PatientId, string FormName, string FormType)
		{
			SqlCommand nerveStatusCom = DataAccessHelper.CreateCommand("spFormGetNerveStatus");
			DataAccessHelper.AddIntInputParam(nerveStatusCom, "PatientId", PatientId);
			DataAccessHelper.AddStringInputParam(nerveStatusCom, "FormName", FormName);
			DataAccessHelper.AddStringInputParam(nerveStatusCom, "FormType", FormType);
			DataAccessHelper.AddStringOutputParam(nerveStatusCom, "NVB_Left");
			DataAccessHelper.AddStringOutputParam(nerveStatusCom, "NVB_Right");

			Hashtable ht = DataAccessHelper.ExecuteScalar(nerveStatusCom);

			return ht;
		}

        public DataTable GetRecords(int PatientId)
        {
            string sql =
            @"
             SELECT * FROM Procedures 
               INNER JOIN ProstatectomyProc
               ON ProstatectomyProc.ProcedureId = Procedures.ProcedureId
               WHERE Procedures.PatientId = @PatientId
            ";

            SqlCommand cmd = DataAccessHelper.CreateSqlCommand(sql);
            DataAccessHelper.AddIntInputParam(cmd, "PatientId", PatientId);

            DataTable dt = new DataTable();
            DataAccessHelper.GetList(cmd, dt);

            return dt;
        }
			

	}
}
