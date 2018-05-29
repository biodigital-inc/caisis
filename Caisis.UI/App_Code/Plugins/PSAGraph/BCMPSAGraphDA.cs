using System;
using System.Data;
using System.Data.SqlClient;
using System.Collections;

using Caisis.DataAccess;

namespace Caisis.UI.Plugins.PSAGraph
{
	/// <summary>
	/// Summary description for BCMPSAGraphDA.
	/// </summary>
	public class BCMPSAGraphDA
	{
		public BCMPSAGraphDA()
		{
			//
			// TODO: Add constructor logic here
			//
		}

		/*
        public static bool areSprocsInstalled()
        {
            try
            {
//              SqlCommand com = DataAccessHelper.CreateCommand("if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[spGetBiopsiesFlash]') and OBJECTPROPERTY(id, N'IsProcedure') = 1) SELECT 'true' ELSE Select 'false'");
//              return (bool)com.ExecuteScalar();
                return true;
            }
            catch ( SqlException e)
            {
                throw new Exception("Could not create the stored procedures necessary for the PSA Graph. Please contact your System Administrator or DBA",e);
            }
        }

        public static void installSprocs(string createSprocsSql)
        {
            SqlCommand com = DataAccessHelper.CreateCommand(createSprocsSql);
            com.ExecuteNonQuery();
        }
		*/
		

        public static DataSet GetAllBiopsiesFlash(int patientId)
        {
          //SqlCommand com = DataAccessHelper.CreateCommand("spGetBiopsiesFlash");
			SqlCommand com = DataAccessHelper.CreateCommand("spPluginPSAGraphGetBiopsiesFlash");
            DataAccessHelper.AddIntInputParam(com, "PatientId", patientId);
            DataSet ds = DataAccessHelper.GetList(com);
            return ds;
        }

	
        public static DataSet GetChronoListStatusEntries(int patientId) 
        {
            SqlCommand com = DataAccessHelper.CreateCommand("spChronoListStatus");
            DataAccessHelper.AddIntInputParam(com, "PatientId", patientId);
            DataSet ds = DataAccessHelper.GetList(com);

            return ds;
        }
		

        public static DataSet GetRecurredDate(int patientId) 
        {
           // SqlCommand com = DataAccessHelper.CreateCommand("spGetRecurredDate");
			
			SqlCommand com = DataAccessHelper.CreateCommand("spPluginPSAGraphGetRecurredDate");
            DataAccessHelper.AddIntInputParam(com, "PatientId", patientId);
            DataSet ds = DataAccessHelper.GetList(com);

            return ds;
        }

        public static DataSet GetPSADTVelocity(int patientId, DateTime startDt, DateTime endDt, string PSAThreshold) 
        {
            //SqlCommand com = DataAccessHelper.CreateCommand("spGetPSADTVelocity");
			SqlCommand com = DataAccessHelper.CreateCommand("spPluginPSAGraphGetPSADTVelocity");
            DataAccessHelper.AddIntInputParam(com, "PatientId", patientId);
            DataAccessHelper.AddDateTimeInputParam(com, "StartDT", startDt);
            DataAccessHelper.AddDateTimeInputParam(com, "EndDT", endDt);
            DataAccessHelper.AddStringInputParam(com, "PSAThreshold", PSAThreshold);
            DataSet ds = DataAccessHelper.GetList(com);

            return ds;
        }

        public static DataSet GetFirstRadiationTherapy(int patientId) 
        {
            // SqlCommand com = DataAccessHelper.CreateCommand("spGetRadiationTherapyFirst");
			SqlCommand com = DataAccessHelper.CreateCommand("spPluginPSAGraphGetRadiationTherapyFirst");
            DataAccessHelper.AddIntInputParam(com, "PatientId", patientId);
            DataSet ds = DataAccessHelper.GetList(com);

            return ds;
        }

        public static DataSet GetPathSummaryFlash(int patientId) 
        {
            //SqlCommand com = DataAccessHelper.CreateCommand("spGetPathSummaryFlash");
            SqlCommand com = DataAccessHelper.CreateCommand("spPluginPSAGraphGetPathSummaryFlash");
			DataAccessHelper.AddIntInputParam(com, "PatientId", patientId);
            DataSet ds = DataAccessHelper.GetList(com);

            return ds;
        }

        public static Hashtable GetProstSurgeryRecord(int PatientId)
        {

            SqlCommand com = DataAccessHelper.CreateCommand("spFormGetProcProstatectomyDate");
            DataAccessHelper.AddIntInputParam(com, "PatientId", PatientId);
            DataAccessHelper.AddStringOutputParam(com, "RP_Date");

            Hashtable ht = DataAccessHelper.ExecuteScalar(com);

            return ht;

        }

        public static DataSet GetFirstHormoneTherapy(int primKey) 
        {
            // SqlCommand com = DataAccessHelper.CreateCommand("spGetFirstHormoneTherapy");
			SqlCommand com = DataAccessHelper.CreateCommand("spPluginPSAGraphGetHormoneTherapyFirst");
            DataAccessHelper.AddIntInputParam(com, "PatientId", primKey);
            DataSet ds = DataAccessHelper.GetList(com);
            return ds;
        }

        public static DataSet GetAllPSAs(int PatientId)
        {
           // SqlCommand com = DataAccessHelper.CreateCommand("spGetLabTestAllPSAs");
            SqlCommand com = DataAccessHelper.CreateCommand("spPluginPSAGraphGetLabTestAllPSAs");
			DataAccessHelper.AddIntInputParam(com, "PatientId", PatientId);
            DataSet ds = DataAccessHelper.GetList(com);

            return ds;
        }

        public static string GetPtFullName(int PatientId)
        {
            // SqlCommand com = DataAccessHelper.CreateCommand("spGetPtFullName");
			SqlCommand com = DataAccessHelper.CreateCommand("spGetPatientsRecord");
            DataAccessHelper.AddIntInputParam(com, "PatientId", PatientId);
            DataSet ds = DataAccessHelper.GetList(com);
            return  ds.Tables[0].Rows[0]["PtFirstName"].ToString() + " " + ds.Tables[0].Rows[0]["PtMiddleName"].ToString() + " " + ds.Tables[0].Rows[0]["PtLastName"].ToString();
        }

	}
}
