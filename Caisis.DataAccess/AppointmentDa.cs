using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;



namespace Caisis.DataAccess
{
    /// <summary>
    /// Summary description for Appointment Data Access.
    /// </summary>
    public class AppointmentDa : BaseDA
    {
        #region ugly sql
        private static readonly string DEPT_SQL = "SELECT DISTINCT(ApptDept) FROM Appointments WHERE ApptDept IS NOT NULL ORDER BY ApptDept";
        // TODO: add union and aliases for fields that show up
        private static readonly string HELP_SQL = "SELECT FieldName, FieldDescription FROM TableMetadata JOIN FieldMetadata ON TableMetadata.TableId = FieldMetadata.TableId WHERE TableName IN ('Appointments','Patients')";
        #endregion

        protected override void SetParams()
        {
            this._GetStoredProc = "";
            this._InsertStoredProc = "";
            this._UpdateStoredProc = "";
            this._DeleteStoredProc = "";
            this._GetByParentStoredProc = "";
        }

        // TODO: create appointment bizObj and define fields

        [Obsolete("In v3.1 don't use GetAppointments; use PatientDa.ListPatients with 'Clinic' as the listValue parameter instead", true)]
        public DataSet GetAppointments(string apptPhysician, string orderBy, string apptClinicDate, int startRow, int numRows)
        {
            SqlCommand com = DataAccessHelper.CreateCommand("spListAppointments");
            DataAccessHelper.AddStringInputParam(com, "ApptPhysician", apptPhysician);
            DataAccessHelper.AddStringInputParam(com, "OrderByField", orderBy);
            DataAccessHelper.AddDateTimeInputParam(com, "ApptClinicDate", Convert.ToDateTime(apptClinicDate));
            return DataAccessHelper.GetList(com, startRow, numRows);
        }

        /// <summary>
        /// Get distinct Physician names from Appointments table 
        /// </summary>
        /// <returns></returns>
        public DataSet GetDistinctAppointmentPhysicians()
        {
            SqlCommand com = DataAccessHelper.CreateCommand("spGetDistinctAppointmentPhysicians");
            DataSet ds = DataAccessHelper.GetList(com);
            return ds;
        }


        public DataSet GetAppointmentsRecord(int AppointmentId)
        {
            SqlCommand com = DataAccessHelper.CreateCommand("spGetAppointmentsRecord");
            DataAccessHelper.AddIntInputParam(com, "AppointmentId", AppointmentId);
            DataSet ds = DataAccessHelper.GetList(com);
            return ds;
        }

        public DataTable GetDistinctAppointmentDepartments()
        {
            SqlCommand cmd = DataAccessHelper.CreateCommand(DEPT_SQL);
            cmd.CommandType = CommandType.Text;
            return DataAccessHelper.GetList(cmd).Tables[0];
        }

        public DataTable GetAppointmentsMetadata()
        {
            SqlCommand cmd = DataAccessHelper.CreateCommand(HELP_SQL);
            cmd.CommandType = CommandType.Text;
            return DataAccessHelper.GetList(cmd).Tables[0];
        }

        /// <summary>
        /// Gets a list of Surgery Appointments for a particular Date
        /// </summary>
        /// <param name="date">The ApptSurgeryDate of the appointment</param>
        /// <param name="excludeSentItems">exclude items which have already been sent</param>
        /// <returns></returns>
        public DataTable GetSurgeryAppointments(DateTime date, bool excludeSentItems)
        {
            string sql = "SELECT * FROM SurgeryAppointment WHERE MONTH(ApptSurgeryDate) = MONTH(@DateCompare) AND DAY(ApptSurgeryDate) = DAY(@DateCompare) AND YEAR(ApptSurgeryDate) = YEAR(@DateCompare)";
            if (excludeSentItems)
            {
                sql += " AND LastNotificationSent IS NULL";
            }
            SqlCommand cmd = DataAccessHelper.CreateCommand(sql);
            DataAccessHelper.AddDateTimeInputParam(cmd, "DateCompare", date);
            cmd.CommandType = CommandType.Text;
            DataTable dt = new DataTable();
            DataAccessHelper.GetList(cmd, dt);
            return dt;
        }

        /// <summary>
        /// Updates the Last Notification sent date for a list of Surgeries (via SurgeryAppointmentId)
        /// </summary>
        /// <param name="listOfApptIds"></param>
        /// <param name="date"></param>
        public void UpdateLastNotificationDate(IEnumerable<int> listOfApptIds, DateTime date)
        {
            if (listOfApptIds.Count() > 0)
            {
                // create update sql format
                string updateSQLFormat = "UPDATE SurgeryAppointment SET LastNotificationSent = @NotifyDate WHERE SurgeryAppointmentId IN ({0})";
                // create csv list of ids to update
                string sqlInStatement = string.Join(",", listOfApptIds.Select(id => id.ToString()).ToArray());
                // fill in csv list into sql statement
                string doUpdateSQL = string.Format(updateSQLFormat, sqlInStatement);

                SqlCommand cmd = DataAccessHelper.CreateCommand(doUpdateSQL);
                DataAccessHelper.AddDateTimeInputParam(cmd, "NotifyDate", date);
                cmd.CommandType = CommandType.Text;
                DataAccessHelper.ExecuteScalar(cmd);
            }
        }

        /// <summary>
        /// Gets a list of efroms emailed on LastNotificationSent Date
        /// </summary>
        /// <param name="date"></param>
        /// <returns></returns>
        public DataTable GetEformsSurgeryAppointmentsSentByDate(DateTime date)
        {
            string sql = "SELECT * FROM SurgeryAppointment WHERE MONTH(LastNotificationSent) = MONTH(@DateCompare) AND DAY(LastNotificationSent) = DAY(@DateCompare) AND YEAR(LastNotificationSent) = YEAR(@DateCompare)";
            SqlCommand cmd = DataAccessHelper.CreateCommand(sql);
            DataAccessHelper.AddDateTimeInputParam(cmd, "DateCompare", date);
            cmd.CommandType = CommandType.Text;
            DataTable dt = new DataTable();
            DataAccessHelper.GetList(cmd, dt);
            return dt;
        }

        /// <summary>
        /// Returns a list of User's with Appointments within the past month.
        ///     SELECT Users.*, Appointments.ApptPhysician
        /// </summary>
        /// <returns></returns>
        public DataTable GetUsersWithAppointments()
        {
            string sql =
 @"
SELECT DISTINCT
    u.*,
    a.ApptPhysician
FROM Users u
INNER JOIN 
(
    SELECT DISTINCT ApptPhysician FROM Appointments
    WHERE ApptClinicDate >= DATEADD(d,0,DATEDIFF(d,0,DATEADD(m , -1, GETDATE())))
) a
ON a.ApptPhysician LIKE '%' + u.UserFirstName + '%'
   AND a.ApptPhysician LIKE '%' + u.UserLastName + '%'
ORDER BY
   a.ApptPhysician
";
            SqlCommand cmd = DataAccessHelper.CreateCommand(sql);
            cmd.CommandType = CommandType.Text;
            DataTable dt = new DataTable();
            DataAccessHelper.GetList(cmd, dt);
            return dt;
        }
    }
}
