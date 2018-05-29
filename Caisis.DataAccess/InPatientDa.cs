using System;
using System.Collections;
using System.Data;
using System.Data.SqlClient;



namespace Caisis.DataAccess 
{
	/// <summary>
	/// Summary description for InPatient Data Access.
	/// </summary>
	public class InPatientDa : BaseDA
	{
		protected override void SetParams()  
		{
			this._GetStoredProc = "";
			this._InsertStoredProc = "";
			this._UpdateStoredProc = "";
			this._DeleteStoredProc = "";
			this._GetByParentStoredProc = "";
		}

		[Obsolete("In v3.1 don't use GetInPatients; use PatientDa.ListPatients with 'InPatient' as the listValue parameter instead", true)]
		public DataSet GetInPatients(string inPtService, int startRow, int numRows)
		{
			SqlCommand com = DataAccessHelper.CreateCommand("spListInPatients");
			DataAccessHelper.AddStringInputParam(com, "InPtService", inPtService);
			return DataAccessHelper.GetList(com, startRow, numRows); 
		}

		/// <summary>
		/// Get distinct in patient service names from Appointments table 
		/// Returns one column called InPtService
		/// </summary>
		/// <returns></returns>
		public DataSet GetInPatientServices()
		{
			SqlCommand com = DataAccessHelper.CreateCommand("spGetDistinctInPatientServices");
			DataSet ds = DataAccessHelper.GetList(com);
			return ds;
		}

		public DataSet GetInPatientsRecord(int InPatientId)
		{
			SqlCommand com = DataAccessHelper.CreateCommand("spGetInPatientsRecord");
			DataAccessHelper.AddIntInputParam(com, "InPatientId", InPatientId);
			DataSet ds = DataAccessHelper.GetList(com);
			return ds; 
		}

		public DataSet GetInPatientsRecordByMRN(string InPtMrn)
		{
			SqlCommand com = DataAccessHelper.CreateCommand("spGetInPatientsRecordByMRN");
			DataAccessHelper.AddStringInputParam(com, "InPtMrn", InPtMrn);
			DataSet ds = DataAccessHelper.GetList(com);
			return ds; 
		}



	}
}
