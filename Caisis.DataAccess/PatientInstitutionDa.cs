using System;
using System.Collections;
using System.Data;
using System.Data.SqlClient;



namespace Caisis.DataAccess
{
	/// <summary>
	/// Patient Institution Da calls procedures.
	/// </summary>
	public class PatientInstitutionDa : BaseDA // : TwoPKDataAccess
	{
		protected override void SetParams()  
		{
			this._GetStoredProc				= "spGetPatientInstitutionsRecord";
			this._InsertStoredProc			= "spInsertPatientInstitutionsRecord";
			this._UpdateStoredProc			= "spUpdatePatientInstitutionsRecord";
			this._DeleteStoredProc			= "spDeletePatientInstitutionsRecord";
			this._GetByParentStoredProc		= "spGetPatientInstitutions";
		}


		//following two methods are used in inserting new patients using dimension from XML- 
		//called from PatientController
        [Obsolete]
		public void InsertPatientInstitution(int patientId, int institutionId, SqlTransaction trans)  
		{
			SqlCommand com = DataAccessHelper.CreateCommand("spInsertPatientInstitutionsRecord", trans);
			DataAccessHelper.AddIntInputParam(com, "PatientId", patientId);
			DataAccessHelper.AddIntInputParam(com, "InstitutionId", institutionId);
			DataAccessHelper.AddDateTimeInputParam(com, "EnteredTime", DateTime.Now);
			DataAccessHelper.AddDateTimeInputParam(com, "UpdatedTime", DateTime.Now);

			DataAccessHelper.ExecuteScalar(com);
		}


		public DataSet GetPatientInstitution(int patientId, int institutionId, SqlTransaction trans)  
		{
			SqlCommand com = DataAccessHelper.CreateCommand("spGetPatientInstitutionsRecord", trans);
			DataAccessHelper.AddIntInputParam(com, "PatientId", patientId);
			DataAccessHelper.AddIntInputParam(com, "InstitutionId", institutionId);

			return DataAccessHelper.GetRecord(com);

		}

        public DataTable GetPatientInstitutionsByPatientId(int patientId)
        {
            DataTable dt = new DataTable();

            string sql = "SELECT PatientInstitutions.PatientInstitutionId,Institutions.InstitutionId, Institutions.Institution FROM PatientInstitutions, Institutions WHERE PatientInstitutions.InstitutionId = Institutions.InstitutionId AND PatientInstitutions.PatientId = '" + patientId + "'";
            DataAccessHelper.ExecuteSqlSelect(sql, dt);
            return dt;
            
        }
		/*
		public DataSet GetPatientInstitutionRecord(int primKey, int primKeyTwo)  
		{
			SqlCommand com = DataAccessHelper.CreateCommand("spGetPatientInstitutionsRecord");
			DataAccessHelper.AddIntInputParam(com, "PatientId", primKey);
			DataAccessHelper.AddIntInputParam(com, "InstitutionId", primKeyTwo);
			return DataAccessHelper.GetRecord(com);
		}

		public bool DeletePatientInstitutionRecord(int primKey, int primKeyTwo)  
		{
			SqlCommand com = DataAccessHelper.CreateCommand("spDeletePatientInstitutionsRecord");
			DataAccessHelper.AddIntInputParam(com, "PatientId", primKey);
			DataAccessHelper.AddIntInputParam(com, "InstitutionId", primKeyTwo);
			DataAccessHelper.ExecuteScalar(com);
			return true;
		}
		
		*/
	}
}