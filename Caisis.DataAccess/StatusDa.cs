using System;
using System.Collections;
using System.Data;
using System.Data.SqlClient;



namespace Caisis.DataAccess
{
	/// <summary>
	/// StatusDataAccess calls procedures.
	/// </summary>
	public class StatusDa : BaseDA
	{
		

		public string FormGetLastStatus(int PatientId, string FormName, string FormType)
		{
			string lastStatusString = "";

			SqlCommand lastStatusCom = DataAccessHelper.CreateCommand("spFormGetLastStatus");
			DataAccessHelper.AddIntInputParam(lastStatusCom, "PatientId", PatientId);
			DataAccessHelper.AddStringInputParam(lastStatusCom, "FormName", FormName);
			DataAccessHelper.AddStringInputParam(lastStatusCom, "FormType", FormType);
			DataAccessHelper.AddStringOutputParam(lastStatusCom, "lastStatus");
			Hashtable ht = DataAccessHelper.ExecuteScalar(lastStatusCom);
			lastStatusString = ht["lastStatus"].ToString();

			return lastStatusString;
		}

        public string FormGetLastStatusAndDateOnly(int PatientId, string FormName, string FormType)
        {
            string lastStatusString = "";

            string sql = @"
                SELECT TOP 1 
                @LastStatus = 'Last Status: ' + ISNULL(Status,'') + ' On ' + ISNULL(StatusDateText,'') 
                FROM Status
                WHERE PatientId = @PatientId AND Status<>'Alive'
                ORDER BY StatusDate DESC ";

            SqlCommand lastStatusCom = DataAccessHelper.CreateSqlCommand(sql);
            DataAccessHelper.AddIntInputParam(lastStatusCom, "PatientId", PatientId);
            DataAccessHelper.AddStringOutputParam(lastStatusCom, "lastStatus");
            Hashtable ht = DataAccessHelper.ExecuteScalar(lastStatusCom);
            lastStatusString = ht["lastStatus"].ToString();

            return lastStatusString;

        }

		public DataSet FormGetLastStatusByStatus(int PatientId, string FormName, string FormType, string Status)
		{
			SqlCommand com = DataAccessHelper.CreateCommand("spFormGetLastStatusByStatus");
			DataAccessHelper.AddIntInputParam(com, "PatientId", PatientId);
			DataAccessHelper.AddStringInputParam(com, "FormName", FormName);
			DataAccessHelper.AddStringInputParam(com, "FormType", FormType);
			DataAccessHelper.AddStringInputParam(com, "Status", Status);
			DataSet ds = DataAccessHelper.GetList(com);

			return ds;
		}

        /// <summary>
        /// Gets records of given status for a patient
        /// </summary>
        /// <param name="PatientId"></param>
        /// <param name="Status"></param>
        /// <returns></returns>
        public DataSet GetStatus(int PatientId, string StatusDisease)
        {
            string sql = @"
              SELECT *
              FROM Status
              WHERE PatientId = @PatientId 
	          AND StatusDisease {0} @StatusDisease
              ORDER BY StatusDate ";

            bool isLike = StatusDisease.Contains("%");
//           SqlCommand com = DataAccessHelper.CreateSqlCommand(sql);
            SqlCommand com = DataAccessHelper.CreateSqlCommand(string.Format(sql, isLike ? "LIKE" : "="));
            DataAccessHelper.AddIntInputParam(com, "PatientId", PatientId);
            DataAccessHelper.AddStringInputParam(com, "StatusDisease", StatusDisease);
            DataSet ds = DataAccessHelper.GetList(com);

            return ds;
        }

        /// <summary>
        /// Gets records of given status field for a patient
        /// </summary>
        /// <param name="PatientId"></param>
        /// <param name="Status"></param>
        /// <returns></returns>
        public DataSet GetStatusField(int PatientId, string Status)
        {
            string sql = @"
              SELECT *
              FROM Status
              WHERE PatientId = @PatientId AND Status=@Status
              ORDER BY StatusDate ";

            SqlCommand com = DataAccessHelper.CreateSqlCommand(sql);
            DataAccessHelper.AddIntInputParam(com, "PatientId", PatientId);
            DataAccessHelper.AddStringInputParam(com, "Status", Status);
            DataSet ds = DataAccessHelper.GetList(com);

            return ds;
        }

        /// <summary>
        /// Query a list of patients who are on Active Surveillance and Watchful Waiting (PatientId, PtMRN)
        /// </summary>
        /// <param name="consumer"></param>
        public void QueryWatchfulWaiting(Connectivity.RecordConsumerDelegate consumer)
        {
            string sql =
            @"
            SELECT
	            DISTINCT S.PatientId, P.PtMRN
            FROM Status S
	            INNER JOIN Patients P ON S.PatientId = P.PatientId
            WHERE
	            S.Status IN ('Active Surveillance', 'Watchful Waiting')
                AND S.StatusDisease LIKE '%Prostate%'
	            AND S.PatientId NOT IN
	            (
		            SELECT Status.PatientId
		            FROM Status
			            INNER JOIN Procedures ON Status.PatientId = Procedures.PatientId
		            WHERE Status IN ('Active Surveillance', 'Watchful Waiting')
			              AND ProcName IN ('CP','LP','LP_CONV','PP','RALP','RP','SalvCP','SalvLP','SalvRP')
			              AND ProcDate > StatusDate
	            )
            ";
            SqlCommand com = DataAccessHelper.CreateSqlCommand(sql);
            Connectivity.ConsumeRecord(com, consumer);
        }

        /// <summary>
        /// Query a Colorectal patients active survailance state
        /// </summary>
        /// <param name="patientId"></param>
        /// <returns></returns>
        public DateTime? QueryColorectalActiveSurvailance(int patientId)
        {
            DateTime? statusDate = null;
            string sql =
            @"
            SELECT  b.PtMrn, MIN(StatusDate)MinStatusDate --, a.PatientId, status
            FROM Status a INNER JOIN Patients b ON a.PatientId = b.PatientId
            WHERE
                  b.PatientId = @PatientId
                  AND StatusDisease = 'Rectal Cancer'
                  AND Status IN ('Active surveillance/NED','Active surveillance/AWD')
            GROUP BY a.PatientId, PtMRN, Status
            ";
            SqlCommand com = DataAccessHelper.CreateSqlCommand(sql);
            DataAccessHelper.AddIntInputParam(com, "PatientId", patientId);
            Connectivity.ConsumeRecord(com, (r) =>
                {
                    int fieldIndex = r.GetOrdinal("MinStatusDate");
                    if (!r.IsDBNull(fieldIndex))
                        statusDate = (DateTime)r.GetDateTime(fieldIndex);
                    return true;
                });
            return statusDate;
        }
	}
}
