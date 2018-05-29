using System;
using System.Configuration;
using System.Data;
using System.Data.Odbc;
using System.Data.SqlClient;


namespace Caisis.DataAccess
{
	/// <summary>
	/// On data export logs patients with associated anonymous identifier to UserExportPatients table.
	/// </summary>
	public class UserExportPatientsDa
	{
		protected string keyLocation	= AppDomain.CurrentDomain.BaseDirectory.ToString() + "Export/UserHashes/";


		public UserExportPatientsDa()
		{
			// used to be TmpSelectedPatientDa
			// TODO: Add constructor logic here
			//
		}

		public void DeleteRecords(string userExportId)  
		{
			SqlCommand com = DataAccessHelper.CreateSqlCommand("delete from UserExportPatients where userExportId = "+userExportId);
			DataAccessHelper.ExecuteScalar(com);
		}




		/// <summary>
		/// Bulk inserts the relationship between the PatientId and AnonymousId for the user's dataset into the UserExports table.
		/// </summary>
		public DataSet CreateTable(string datasetSql, int userExportId)  
		{		
			
			int endFrom = (datasetSql.ToLower()).IndexOf("from");
			string fromString = datasetSql.Substring(endFrom, datasetSql.Length-endFrom);

			string insertString = "INSERT INTO UserExportPatients (PatientId,PtMrn,UserExportId) "
				+ " SELECT PatientId, PtMrn, '"+ userExportId.ToString()+"' "
				+ fromString;

			SqlCommand com = DataAccessHelper.CreateSqlCommand(insertString);

			com.CommandTimeout = 90;
			DataAccessHelper.ExecuteScalar(com);
            
			return null;

			/*  code below uses row by row inserts
			SqlConnection conn = DataAccessHelper.GetConnection();

			int selectLoc = datasetSql.IndexOf("*");
			SqlCommand com = DataAccessHelper.CreateSqlCommand("select patientId, PtMRN "+datasetSql.Substring(selectLoc+1, datasetSql.Length-selectLoc-1), conn);

			DataSet ds = DataAccessHelper.GetList(com);

			conn.Open();
			foreach(DataRow dr in ds.Tables[0].Rows)  
			{
				// replace this with a stored proc?  
				string insertSql = "insert into UserExportPatients(UserExportId, PatientId, PtMRN) values("+userExportId.ToString()+", "
					+ dr["PatientId"].ToString()+", '"+dr["ptmrn"].ToString()+"')";
				com.CommandText = insertSql;
				try 
				{
					com.ExecuteScalar();
				}
				catch 
				{
					conn.Close();
					throw;
				}
			}	
		
			com.CommandText = "select * from UserExportPatients";
			ds = DataAccessHelper.GetList(com);

			conn.Close();

			return ds;		
			
			*/
		}

	}
}

