using System;
using System.Collections;
using System.Data;
using System.Data.SqlClient;



namespace Caisis.DataAccess
{ 
	/// <summary>
	/// Patient Physician DataAccess calls procedures.
	/// </summary>
	public class PatientPhysicianDa : BaseDA
	{

		protected override void SetParams()		 
		{
			this._GetStoredProc				= "spGetPatientPhysiciansRecord";
			this._InsertStoredProc			= "spInsertPatientPhysiciansRecord";
			this._UpdateStoredProc			= "spUpdatePatientPhysiciansRecord";
			this._DeleteStoredProc			= "spDeletePatientPhysiciansRecord";
			this._GetByParentStoredProc		= "spGetPatientPhysicians";
		}


		


		public DataSet ValidatePatientPhysician(int PatientId, int PhysicianId)  
		{
			SqlCommand com = DataAccessHelper.CreateCommand("spValidatePatientPhysician");
			DataAccessHelper.AddIntInputParam(com, "PatientId", PatientId);
			DataAccessHelper.AddIntInputParam(com, "PhysicianId", PhysicianId);
			return DataAccessHelper.GetList(com);
		}

		//used to display rad oncologist and urologist on seeds pages
		public DataSet GetPatientPhysiciansBySpecialty(int patientId, string specialty)  
		{
			SqlCommand com = DataAccessHelper.CreateCommand("spGetPatientPhysiciansBySpecialty");
			DataAccessHelper.AddIntInputParam(com, "PatientId", patientId);
			DataAccessHelper.AddStringInputParam(com, "Specialty", specialty);
			
			return DataAccessHelper.GetRecord(com);
		}

		//following two methods are used in inserting new patients using dimension from XML- 
		//called from PatientController
		public DataSet GetPatientPhysician(int patientPhysicianId)  
		{
			SqlCommand com = DataAccessHelper.CreateCommand("spGetPatientPhysiciansRecord");
			DataAccessHelper.AddIntInputParam(com, "PatientPhysicianId", patientPhysicianId);
			
			return DataAccessHelper.GetRecord(com);
		}
	
		public void InsertPatientPhysicianDimension(int patientId, int physicianId, string username, SqlTransaction trans)  
		{	
			SqlCommand com = DataAccessHelper.CreateCommand("spInsertPatientPhysiciansRecord", trans);
			DataAccessHelper.AddIntInputParam(com, "PatientId", patientId);
			DataAccessHelper.AddIntInputParam(com, "PhysicianId", physicianId);
			DataAccessHelper.AddStringInputParam(com, "PtPhRole", "");
			DataAccessHelper.AddStringInputParam(com, "PtPhContactStatus", "");
			DataAccessHelper.AddStringInputParam(com, "PtPhNotes", "");
			DataAccessHelper.AddStringInputParam(com, "EnteredBy", username);
			DataAccessHelper.AddDateTimeInputParam(com, "EnteredTime", DateTime.Now);
			DataAccessHelper.AddStringInputParam(com, "UpdatedBy", "");
			DataAccessHelper.AddDateTimeInputParam(com, "UpdatedTime", null);
			DataAccessHelper.AddStringInputParam(com, "LockedBy", "");
			DataAccessHelper.AddDateTimeInputParam(com, "LockedTime", null);


			DataAccessHelper.ExecuteScalar(com);
		}



		public DataSet FormGetReferringMDs(int PatientId, string FormName, string FormType)
		{
			SqlCommand com = DataAccessHelper.CreateCommand("spFormGetPatientPhysiciansReferringMDs");
			DataAccessHelper.AddIntInputParam(com, "PatientId", PatientId);
			DataAccessHelper.AddStringInputParam(com, "FormName", FormName);
			DataAccessHelper.AddStringInputParam(com, "FormType", FormType);
			DataSet ds = DataAccessHelper.GetList(com);

			return ds;
		}

        public DataSet FormGetPatientPhysicians(int PatientId, string FormName, string FormType)
        {
            DataSet ds = new DataSet();

            if (FormType == "Dynamic")
            {
                string sql = "SELECT Physicians.*,PatientPhysicianId,PtPhRole,PhSpecialty,PtPhNotes ";
                sql += "FROM PatientPhysicians INNER JOIN ";
                sql += "        Physicians ON PatientPhysicians.PhysicianId = Physicians.PhysicianId ";
                sql += "WHERE (PatientId = @PatientId ) ";
                sql += "ORDER BY Physicians.PhysicianId ";

                SqlCommand com = DataAccessHelper.CreateSqlCommand(sql);
                DataAccessHelper.AddIntInputParam(com, "PatientId", PatientId);

                ds = DataAccessHelper.GetRecord(com);
            }

            return ds;
        }

        public DataTable GetPatientPhysicians(int PatientId)
        {
            DataTable dt = new DataTable();

            string sql = "SELECT Physicians.*,PatientPhysicianId,PtPhRole,PhSpecialty,PtPhNotes, Physicians.PhLastName + ', ' + Physicians.PhFirstName AS 'PhysicianName', Physicians.PhFirstName + ' ' + Physicians.PhLastName AS 'PhysicianName2'";
            sql += "FROM PatientPhysicians INNER JOIN ";
            sql += "Physicians ON PatientPhysicians.PhysicianId = Physicians.PhysicianId ";
            sql += "WHERE (PatientPhysicians.PatientId = " + PatientId + ") ";
            sql += "ORDER BY Physicians.PhLastName "; // order by last name

            DataAccessHelper.ExecuteSqlSelect(sql, dt);

            return dt;
        }

        public DataSet GetDistinctPatientPhysiciansByRole(string role, string datasetSql)
        {
            DataSet ds = new DataSet();

            string sql = @"
                SELECT Physicians.*,PatientPhysicianId,PtPhRole,PhSpecialty,PtPhNotes,COALESCE(PhLastName,'') + COALESCE(', ' + PhFirstName,'') AS PhName 
                FROM Physicians 
                INNER JOIN PatientPhysicians
                ON PatientPhysicians.PhysicianId = Physicians.PhysicianId 
                   AND PatientPhysicians.PatientPhysicianId = 
                   (
		                SELECT TOP 1 PatientPhysicians.PatientPhysicianId
		                FROM PatientPhysicians
		                WHERE PatientPhysicians.PhysicianId = Physicians.PhysicianId 
		                      AND PatientPhysicians.PtPhRole LIKE @PtPhRole 
                   ) ";
            sql += "INNER JOIN (" + datasetSql + ") AS ds ON PatientPhysicians.PatientId= ds.PatientId ";
            sql += @"
                ORDER BY Physicians.PhLastName, Physicians.PhFirstName ";

            SqlCommand com = DataAccessHelper.CreateSqlCommand(sql);
            DataAccessHelper.AddStringInputParam(com, "PtPhRole", String.Format("%{0}%",role));
            ds = DataAccessHelper.GetRecord(com);

            return ds;
        }


	}
}