using System;
using System.Data;
using System.Data.SqlClient;
using System.Collections;
using System.Collections.Generic;

namespace Caisis.DataAccess
{
	/// <summary>
	/// Summary description for EFormsDa.
	/// </summary>
	public class EFormsDa : BaseDA
	{
		public EFormsDa()
		{
			//
			// TODO: Add constructor logic here
			//
		}
		// spUpdateEFormXml
		// spUpdateEFormReport
		// spUpdateEFormsRecord

		protected override void SetParams()  
		{
			this._GetStoredProc = "spGetEFormsRecord";
			this._InsertStoredProc = "spInsertEFormsRecord";
			this._UpdateStoredProc = null;
			this._DeleteStoredProc = null; // eforms are never deleted- given status of "Deleted"
			this._GetByParentStoredProc = null;
		}

		public DataSet GetEformsClinicList(string datasetSql, string apptPhysician, string apptClinicDate)
		{
			SqlCommand com = DataAccessHelper.CreateCommand("spListEFormClinic");
			DataAccessHelper.AddLongStringInputParam(com, "Dataset", datasetSql);
			DataAccessHelper.AddStringInputParam(com, "ApptPhysician", apptPhysician);
			//DataAccessHelper.AddStringInputParam(com, "ApptClinicDate", apptClinicDate);
            DataAccessHelper.AddDateTimeInputParam(com, "ApptClinicDate", DataAccessHelper.ToDBDate(apptClinicDate));
			return DataAccessHelper.GetRecord(com);
		}

		public DataSet GetPatientEForms(int patientId)
		{
            string sql = "SELECT * FROM EForms ";
            sql += "WHERE PatientId = @PatientId ";
            sql += "ORDER BY EFormName,CurrentStatus ";

            SqlCommand cmd = DataAccessHelper.CreateSqlCommand(sql);
            //SqlCommand com = DataAccessHelper.CreateCommand("spGetEFormsByPatient");
            DataAccessHelper.AddIntInputParam(cmd, "PatientId", patientId);
            return DataAccessHelper.GetRecord(cmd);
		}


		/// <summary>
		/// Get the recently-created EForm (based on name) for a patient, or null if none is found.
		/// </summary>
		/// <param name="patientId"></param>
		/// <param name="eformName"></param>
		/// <returns>Returns associated DataRowView or null if no rows found</returns>
		public DataRowView GetPatientRecentEForm(int patientId, string eformName)
		{
            string sql = @"
SELECT TOP 1 * FROM Eforms 
WHERE 
EFormName = @EformName AND PatientId = @PatientId 
AND ( YEAR(EnteredTime) = YEAR(@Today) AND MONTH(EnteredTime) = MONTH(@Today) AND DAY(EnteredTime) = DAY(@Today) ) 
AND 
CurrentStatus != 'Deleted' 
AND ( EformApptTime IS NULL OR EformApptTime > @Today ) 
ORDER BY CurrentStatus ";

            SqlCommand cmd = DataAccessHelper.CreateSqlCommand(sql);
            DataAccessHelper.AddIntInputParam(cmd, "PatientId", patientId);
            DataAccessHelper.AddStringInputParam(cmd, "EformName", eformName);
            DataAccessHelper.AddDateTimeInputParam(cmd, "Today", DateTime.Today);

            DataView view = DataAccessHelper.GetList(cmd).Tables[0].DefaultView;
            if (view.Count > 0)
            {
                return view[0];
            }
            else
            {
                return null;
            }

            // OLD 5.0 code, moved to inline SQL
            //DataSet d = GetPatientEForms(patientId);
            //if (d.Tables[0].Rows.Count > 0)
            //{
            //    DataView v = d.Tables[0].DefaultView;

            //    for (int i = 0; i < v.Count; i++)
            //    {
            //        DataRowView r = v[i];

            //        DateTime updateTime = (DateTime)r["EnteredTime"];
            //        string currentStatus = r["CurrentStatus"].ToString();

            //        // we want to exclude forms created today for older clinic dates
            //        bool wasPastEform = false;
            //        if (r["EformApptTime"] != DBNull.Value)
            //        {
            //            DateTime eformApptTime = (DateTime)r["EformApptTime"];
            //            if (eformApptTime.Date < DateTime.Today)
            //            {
            //                wasPastEform = true;
            //            }
            //        }

            //        if (!wasPastEform && updateTime.Date == DateTime.Today &&
            //            currentStatus != "Deleted" &&
            //            r["EFormName"].ToString() == eformName)
            //        {
            //            return r;
            //        }
            //    }
            //}
            //return null;
		}

        public DataTable GetUserRecentEforms(int userId, string datasetSQL, int? topResults, int? recentDays)
        {
            string sql =
        @"
        SELECT {1}
	        e.PatientId,
	        e.EformId,
	        e.EformName,
	        e.CurrentStatus,
	        e.EformApptTime,
	        e.EformApptPhysician,
            e.UpdatedTime,
	        p.PtLastName,
	        p.PtFirstName,
	        p.PtMRN
        FROM EForms e
        INNER JOIN ({0}) p
	        ON p.PatientId = e.PatientId
        LEFT OUTER JOIN Users u
	        ON u.UserId = e.UserId
	        OR u.UserName = e.EnteredBy
	        OR u.UserName = e.UpdatedBy
        WHERE
	        e.UserId = @UserId {2}
        ORDER BY e.UpdatedTime DESC
            ";
            string top = topResults.HasValue ? "TOP " + topResults.Value : string.Empty;
            string days = recentDays.HasValue ? "AND e.EnteredTime >= @MinDate" + recentDays.Value : string.Empty;
            string fullSQL = string.Format(sql, datasetSQL, top, days);
            SqlCommand cmd = DataAccessHelper.CreateSqlCommand(fullSQL);
            DataAccessHelper.AddIntInputParam(cmd, "UserId", userId);
            if (recentDays.HasValue)
            {
                DateTime normalizedMinDate = DateTime.Today.AddDays(-recentDays.Value);
                DataAccessHelper.AddDateTimeInputParam(cmd, "MinDate", normalizedMinDate);
            }

            DataTable dt = DataAccessHelper.GetList(cmd).Tables[0];
            return dt;
        }
  
        [Obsolete]
		public DataSet GetEformsRecord(int eformId)
		{
			SqlCommand com = DataAccessHelper.CreateCommand("spGetEFormsRecord");
			DataAccessHelper.AddIntInputParam(com, "EformId", eformId);
			return DataAccessHelper.GetRecord(com);
		}
		
		public string GetEFormStatus(int eformId)
		{
			SqlCommand com = DataAccessHelper.CreateCommand("spGetEFormStatus");
			DataAccessHelper.AddIntInputParam(com, "EformId", eformId);
			DataSet ds = DataAccessHelper.GetRecord(com);
			
			if(ds.Tables[0].Rows.Count > 0)
			{
				return ds.Tables[0].Rows[0]["CurrentStatus"].ToString();
			}
			else
			{
				return "";
			}
		}

		/// <summary>
		/// Get patient record based on patient MRN, physician, and appointment date
		/// </summary>
		/// <returns></returns>
		public DataTable GetPatientAppointmentRecord(string mrn, string physician, DateTime clinicDate)
		{
			string cmdText = "SELECT * FROM Appointments WHERE ApptMRN = @ApptMRN And ApptPhysician = @ApptPhysician And ApptClinicDate = @ApptClinicDate";
			
			SqlCommand cmd = DataAccessHelper.CreateCommand(cmdText);
			cmd.CommandType = CommandType.Text;

			cmd.Parameters.Add("@ApptMRN", mrn);
			cmd.Parameters.Add("@ApptPhysician", physician);
			cmd.Parameters.Add("@ApptClinicDate", clinicDate);

			DataTable table = new DataTable();
			DataAccessHelper.GetList(cmd, table);

			return table;
		}

		[Obsolete]
		public DataSet GetPatientOpenEformByName(int patientId, string eformName)
		{
			SqlCommand com = DataAccessHelper.CreateCommand("spGetPatientOpenEFormByName");
			DataAccessHelper.AddIntInputParam(com, "PatientId", patientId);
			DataAccessHelper.AddStringInputParam(com, "EFormName", eformName);
			return DataAccessHelper.GetRecord(com);
		}
	
		public int InsertEFormsRecord(int userId, int patientId, string eformName, string eformXml, string currentStatus, object eformApptTime, string eformApptPhysician, string userName)  
		{
			SqlCommand com = DataAccessHelper.CreateCommand("spInsertEFormsRecord");
			DataAccessHelper.AddIntInputParam(com, "UserId", userId);
			DataAccessHelper.AddIntInputParam(com, "PatientId", patientId);	
			DataAccessHelper.AddStringInputParam(com, "EformName", eformName);
			DataAccessHelper.AddTextInputParam(com, "EformXml", eformXml);	
			DataAccessHelper.AddStringInputParam(com, "CurrentStatus", currentStatus);
			DataAccessHelper.AddDateTimeInputParam(com, "EformApptTime", DataAccessHelper.ToDBDate(eformApptTime));
			DataAccessHelper.AddStringInputParam(com, "EformApptPhysician", eformApptPhysician);

			DataAccessHelper.AddStringInputParam(com, "UpdatedBy", userName);
			DataAccessHelper.AddDateTimeInputParam(com, "UpdatedTime", DateTime.Now);
			DataAccessHelper.AddStringInputParam(com, "EnteredBy", userName);
			DataAccessHelper.AddDateTimeInputParam(com, "EnteredTime", DateTime.Now);
			
			DataAccessHelper.AddIntOutputParam(com, "NewPrimaryKey");

			Hashtable outParams = DataAccessHelper.ExecuteScalar(com);
			
			if(outParams["NewPrimaryKey"] != System.DBNull.Value)
			{
				return (int)outParams["NewPrimaryKey"];
			}
			else
			{
				return -1;
			}
		}

        public void InsertEFormsLogRecord(int eformId, string status, string updatedBy, DateTime updatedTime)
        {
            SqlCommand com = DataAccessHelper.CreateCommand("spInsertEFormLogRecord");
            DataAccessHelper.AddIntInputParam(com, "EFormId", eformId);
            DataAccessHelper.AddStringInputParam(com, "Status", status);
            DataAccessHelper.AddStringInputParam(com, "UpdatedBy", updatedBy);
            DataAccessHelper.AddDateTimeInputParam(com, "UpdatedTime", updatedTime);

            DataAccessHelper.ExecuteScalar(com);
        }

		/// <summary>
		/// Updates the status of the eform and pushes last status to the eform log
		/// </summary>
		/// <param name="eformId"></param>
		/// <param name="currentStatus"></param>
		/// <param name="userName"></param>
		/// <returns></returns>
		public bool UpdateEFormStatus (int eformId, string currentStatus, string userName)  
		{
			SqlCommand com = DataAccessHelper.CreateCommand("spUpdateEFormsStatus");
			DataAccessHelper.AddIntInputParam(com, "EformId", eformId);	
			DataAccessHelper.AddStringInputParam(com, "CurrentStatus", currentStatus);
			DataAccessHelper.AddStringInputParam(com, "UpdatedBy", userName);
			DataAccessHelper.AddDateTimeInputParam(com, "UpdatedTime", DateTime.Now);
			DataAccessHelper.ExecuteScalar(com);
			return true;
		}

		public bool UpdateEFormRecord(int eformId, string eformXml, string eformReport, string currentStatus, string userName)  
		{
			SqlCommand com = DataAccessHelper.CreateCommand("spUpdateEFormsRecord");
			DataAccessHelper.AddIntInputParam(com, "EformId", eformId);	
			DataAccessHelper.AddTextInputParam(com, "EformXml", eformXml);
			DataAccessHelper.AddTextInputParam(com, "EformReport", eformReport);
			DataAccessHelper.AddStringInputParam(com, "CurrentStatus", currentStatus);
			DataAccessHelper.AddStringInputParam(com, "UpdatedBy", userName);
			DataAccessHelper.AddDateTimeInputParam(com, "UpdatedTime", DateTime.Now);
			DataAccessHelper.ExecuteScalar(com);
			return true;
		}

		public bool UpdateEFormXml (int eformId, string eformXml, string currentStatus, string userName)  
		{
			SqlCommand com = DataAccessHelper.CreateCommand("spUpdateEFormsXml");
			DataAccessHelper.AddIntInputParam(com, "EformId", eformId);	
			DataAccessHelper.AddTextInputParam(com, "EformXml", eformXml);
			DataAccessHelper.AddStringInputParam(com, "CurrentStatus", currentStatus);
			DataAccessHelper.AddStringInputParam(com, "UpdatedBy", userName);
			DataAccessHelper.AddDateTimeInputParam(com, "UpdatedTime", DateTime.Now);
			DataAccessHelper.ExecuteScalar(com);
			return true;
		}

		public bool UpdateEFormReport (int eformId, string eformReport,  string currentStatus, string userName)  
		{
			SqlCommand com = DataAccessHelper.CreateCommand("spUpdateEFormsReport");
			DataAccessHelper.AddIntInputParam(com, "EformId", eformId);	
			DataAccessHelper.AddTextInputParam(com, "EformReport", eformReport);
			DataAccessHelper.AddStringInputParam(com, "CurrentStatus", currentStatus);
			DataAccessHelper.AddStringInputParam(com, "UpdatedBy", userName);
			DataAccessHelper.AddDateTimeInputParam(com, "UpdatedTime", DateTime.Now);
			DataAccessHelper.ExecuteScalar(com);
			return true;
		}

		public DataSet GetEformsInbox(int UserId, string Status)
		{
			SqlCommand com = DataAccessHelper.CreateCommand("spGetEFormsInbox");
			DataAccessHelper.AddIntInputParam(com, "UserId", UserId);
			DataAccessHelper.AddStringInputParam(com, "CurrentStatus", Status);
			return DataAccessHelper.GetRecord(com);
		}

        public DataTable GetEformsByEnteredDate(DateTime date)
        {
            string sql = "SELECT EForms.*, Patients.PtMrn, Patients.PtLastName + ',' + PtFirstName as Name ";
            sql += "FROM EForms INNER JOIN Patients ON Patients.PatientId = Eforms.PatientId ";
            sql += "WHERE MONTH(EForms.EnteredTime) = MONTH(@DateCompare) AND DAY(EForms.EnteredTime) = DAY(@DateCompare) AND YEAR(EForms.EnteredTime) = YEAR(@DateCompare) ";
            sql += "ORDER BY EForms.EFormId ASC";

            SqlCommand cmd = DataAccessHelper.CreateCommand(sql);
            DataAccessHelper.AddDateTimeInputParam(cmd, "DateCompare", date);
            cmd.CommandType = CommandType.Text;
            DataTable dt = new DataTable();
            DataAccessHelper.GetList(cmd, dt);
            return dt;
        }

        /// <summary>
        /// Returns the HTML ouput representation of the eform.
        /// </summary>
        /// <param name="eformId"></param>
        /// <returns></returns>
        public string GetEformReport(int eformId)
        {
            string sql = "SELECT EFormReport FROM EForms Where EformId = @EformId";
            SqlCommand cmd = DataAccessHelper.CreateCommand(sql);
            DataAccessHelper.AddIntInputParam(cmd, "EformId", eformId);
            cmd.CommandType = CommandType.Text;
            DataTable dt = new DataTable();
            DataAccessHelper.GetList(cmd, dt);
            string reportHTML = dt.Rows.Count == 0 ? string.Empty : dt.Rows[0]["EformReport"].ToString();
            return reportHTML;

        }




        public DataTable GetEforms(DateTime? EnteredTimeStart, DateTime? EnteredTimeEnd, string EnteredBy, DateTime? UpdatedTimeStart, DateTime? UpdatedTimeEnd, string UpdatedBy, string EFormName, string CurrentStatus, DateTime? EFormApptTimeStart, DateTime? EFormApptTimeEnd, string EFormApptPhysician)
        {
            string sql = "SELECT EForms.PatientId, EForms.EformId, EForms.EFormName, EForms.CurrentStatus, EForms.EFormApptTime, EForms.EFormApptPhysician, EForms.EnteredBy, EForms.EnteredTime, EForms.UpdatedBy, EForms.UpdatedTime, Patients.PtMrn, Patients.PtLastName + ',' + PtFirstName as Name ";
            sql += "FROM EForms INNER JOIN Patients ON Patients.PatientId = Eforms.PatientId ";


            List<string> searchParams = new List<string>();

            if (EFormName.Length > 0) searchParams.Add("(EForms.EFormName = @EFormName)");
            if (CurrentStatus.Length > 0) searchParams.Add("(EForms.CurrentStatus = @CurrentStatus)");
            if (EFormApptPhysician.Length > 0) searchParams.Add("(EForms.EFormApptPhysician = @EFormApptPhysician)");
            if (EnteredBy.Length > 0) searchParams.Add("(EForms.EnteredBy = @EnteredBy)");
            if (UpdatedBy.Length > 0) searchParams.Add("(EForms.UpdatedBy = @UpdatedBy)");

            if (EnteredTimeStart != null) searchParams.Add("(EForms.EnteredTime >= @EnteredTimeStart)");
            if (EnteredTimeEnd != null) searchParams.Add("(EForms.EnteredTime <= @EnteredTimeEnd)");
            if (UpdatedTimeStart != null) searchParams.Add("(EForms.UpdatedTime >= @UpdatedTimeStart)");
            if (UpdatedTimeEnd != null) searchParams.Add("(EForms.UpdatedTime <= @UpdatedTimeEnd)");
            if (EFormApptTimeStart != null) searchParams.Add("(EForms.EFormApptTime >= @EFormApptTimeStart)");
            if (EFormApptTimeEnd != null) searchParams.Add("(EForms.EFormApptTime <= @EFormApptTimeEnd)");

            string whereClause = "";
            if (searchParams.Count > 0)
            {
                whereClause = String.Join(" AND ", searchParams.ToArray());
            }
            else
            {
                EnteredTimeStart = DateTime.Now;
                whereClause = "MONTH(EForms.UpdatedTime) = MONTH(@EnteredTimeStart) AND DAY(EForms.UpdatedTime) = DAY(@EnteredTimeStart) AND YEAR(EForms.UpdatedTime) = YEAR(@EnteredTimeStart) ";
            }

            sql += ("WHERE " + whereClause);

            //if (UpdatedTime != null)
            //{
            //    sql += "WHERE MONTH(EForms.UpdatedTime) = MONTH(@UpdatedTime) AND DAY(EForms.UpdatedTime) = DAY(@UpdatedTime) AND YEAR(EForms.UpdatedTime) = YEAR(@UpdatedTime) ";
            //}
            sql += "ORDER BY EForms.EFormId ASC";

            SqlCommand cmd = DataAccessHelper.CreateCommand(sql);
            DataAccessHelper.AddStringInputParam(cmd, "CurrentStatus", CurrentStatus);
            DataAccessHelper.AddStringInputParam(cmd, "EFormName", EFormName);
            DataAccessHelper.AddStringInputParam(cmd, "EFormApptPhysician", EFormApptPhysician);
            DataAccessHelper.AddStringInputParam(cmd, "EnteredBy", EnteredBy);
            DataAccessHelper.AddStringInputParam(cmd, "UpdatedBy", UpdatedBy);
            DataAccessHelper.AddDateTimeInputParam(cmd, "EnteredTimeStart", EnteredTimeStart);
            DataAccessHelper.AddDateTimeInputParam(cmd, "EnteredTimeEnd", EnteredTimeEnd);
            DataAccessHelper.AddDateTimeInputParam(cmd, "UpdatedTimeStart", UpdatedTimeStart);
            DataAccessHelper.AddDateTimeInputParam(cmd, "UpdatedTimeEnd", UpdatedTimeEnd);
            DataAccessHelper.AddDateTimeInputParam(cmd, "EFormApptTimeStart", EFormApptTimeStart);
            DataAccessHelper.AddDateTimeInputParam(cmd, "EFormApptTimeEnd", EFormApptTimeEnd);
            cmd.CommandType = CommandType.Text;
            DataTable dt = new DataTable();
            DataAccessHelper.GetList(cmd, dt);
            return dt;
        }
	}
}
