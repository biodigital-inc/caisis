using System;
using System.Collections;
using System.Data;
using System.Data.SqlClient;



namespace Caisis.DataAccess
{
	/// <summary>
	/// Summary description for Patient.
	/// </summary>
	public class MedicationDa : BaseDA
	{
		

		public DataSet FormGetRecords(int PatientId, string FormName, string FormType, string StopDate)
		{
			SqlCommand com = DataAccessHelper.CreateCommand("spFormListMedications");
			DataAccessHelper.AddIntInputParam(com, "PatientId", PatientId);
			DataAccessHelper.AddStringInputParam(com, "FormName", FormName);
			DataAccessHelper.AddStringInputParam(com, "FormType", FormType);
			//DataAccessHelper.AddStringInputParam(com, "StopDate", StopDate);
            DataAccessHelper.AddDateTimeInputParam(com, "StopDate", DataAccessHelper.ToDBDate(StopDate));
			DataSet ds = DataAccessHelper.GetList(com);

			return ds;
		}

        /*
		public DataSet FormGetErectileMedication(int PatientId, string MedDate)
		{
			SqlCommand com = DataAccessHelper.CreateCommand("spFormGetErectileMedication");
			DataAccessHelper.AddIntInputParam(com, "PatientId", PatientId);
			//DataAccessHelper.AddStringInputParam(com, "MedDate", MedDate);
            DataAccessHelper.AddDateTimeInputParam(com, "MedDate", DataAccessHelper.ToDBDate(MedDate));
			DataSet ds = DataAccessHelper.GetList(com);

			return ds;
		}
		*/

        /// <summary>
        /// Gets a UNION view of Medications + MedicalTherapy (Orally) optionally restricted by @StopDate.
        /// </summary>
        /// <param name="patientId">The patientId of the Patient</param>
        /// <param name="stopDate">Optionally restrict to MedStopDate >= @StopDate, null for no restriction.</param>
        /// <returns></returns>
        public DataTable GetMedicationsAndOralMedTx(int patientId, DateTime? stopDate)
        {         
            string fullSQLFormat =
            @"
            SELECT *
            FROM
            (
                SELECT Medication, MedDose, MedUnits, MedSchedule, MedIndication, MedRoute, MedDateText, MedDate, MedStopDateText, MedStopDate
                FROM Medications 
                WHERE PatientId = @PatientId
            
                UNION ALL
            
                SELECT MedTxAgent as 'Medication', MedTxDose as 'MedDose', MedTxUnits as 'MedUnits', MedTxSchedule as 'MedSchedule', MedTxIndication as 'MedIndication', MedTxRoute as 'MedRoute', MedTxDateText as 'MedDateText', MedTxDate as 'MedDate', MedTxStopDateText as 'MedStopDateText', MedTxStopDate as 'MedStopDate'
                FROM MedicalTherapy
                WHERE PatientId = @PatientId AND MedTxRoute = 'Orally'
            ) medications 
            -- filtering
            {0}
            -- ordering
            ORDER BY MedDate ASC, Medication ASC
            ";
            // determine @StopDate filtering
            string whereSQL = stopDate.HasValue ? "WHERE (ISNULL(MedStopDateText,'') = '') OR MedStopDate >= @StopDate" : "";
            string fullSQL = string.Format(fullSQLFormat, whereSQL);

            SqlCommand com = DataAccessHelper.CreateSqlCommand(fullSQL);
            DataAccessHelper.AddIntInputParam(com, "PatientId", patientId);
            // add @StopDate
            if (stopDate.HasValue)
            {
                DateTime stopDateParam = new DateTime(stopDate.Value.Year, stopDate.Value.Month, stopDate.Value.Day, 0, 0, 0);
                DataAccessHelper.AddDateTimeInputParam(com, "StopDate", stopDateParam);
            }
            DataTable dt = DataAccessHelper.GetList(com).Tables[0];
           
            return dt;
        }
	}
}
