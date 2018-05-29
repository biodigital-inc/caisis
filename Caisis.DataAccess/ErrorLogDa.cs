using System;
using System.Data.SqlClient;
using System.Data;


namespace Caisis.DataAccess
{
    /// <summary>
    /// Summary description for ErrorLogDa.
    /// </summary>
    public class ErrorLogDa
    {
        public ErrorLogDa()
        {
            //
            // TODO: Add constructor logic here
            //

        }
        public void LogError(int LoginId,
                                int DatasetId,
                                int PatientId,
                                string ErrUserName,
                                string ErrURL,
                                string ErrFullPath,
                                string ErrFileName,
                                string ErrForm,
                                string ErrQueryString,
                                string ErrBrowser,
                                string ErrPlatform,
                                string ErrJavascript,
                                string ErrIP,
                                string ErrAuthenticated,
                                string ErrHostName,
                                string ErrRoleList,
                                string ErrSessionIsNew,
                                int ErrSessionTimeOut,
                                DateTime? ErrTicketIssueDate,
                                DateTime? ErrTicketExpiration,
                                DateTime ErrorTime,
                                string ErrMachineName,
                                string ErrorName,
                                string ErrorMessage,
                                string ErrStackTrace
                                )
        {
            SqlCommand com = DataAccessHelper.CreateCommand("spInsertErrorLog");
            DataAccessHelper.AddIntInputParam(com, "UserLoginId", LoginId);
            DataAccessHelper.AddIntInputParam(com, "DatasetId", DatasetId);
            DataAccessHelper.AddIntInputParam(com, "PatientId", PatientId);
            DataAccessHelper.AddStringInputParam(com, "ErrUserName", trimString(ErrUserName, 50));
            DataAccessHelper.AddStringInputParam(com, "ErrURL", trimString(ErrURL, 255));
            DataAccessHelper.AddStringInputParam(com, "ErrFullPath", trimString(ErrFullPath, 2550));
            DataAccessHelper.AddStringInputParam(com, "ErrFileName", trimString(ErrFileName, 255));
            DataAccessHelper.AddStringInputParam(com, "ErrForm", trimString(ErrForm, 500));
            DataAccessHelper.AddStringInputParam(com, "ErrQueryString", trimString(ErrQueryString, 255));
            DataAccessHelper.AddStringInputParam(com, "ErrBrowser", trimString(ErrBrowser, 50));
            DataAccessHelper.AddStringInputParam(com, "ErrPlatform", trimString(ErrPlatform, 50));
            DataAccessHelper.AddStringInputParam(com, "ErrJavascript", trimString(ErrJavascript, 50));
            DataAccessHelper.AddStringInputParam(com, "ErrIP", trimString(ErrIP, 50));
            DataAccessHelper.AddStringInputParam(com, "ErrAuthenticated", trimString(ErrAuthenticated, 50));
            DataAccessHelper.AddStringInputParam(com, "ErrHostName", trimString(ErrHostName, 255));
            DataAccessHelper.AddStringInputParam(com, "ErrRoleList", trimString(ErrRoleList, 255));
            DataAccessHelper.AddStringInputParam(com, "ErrSessionIsNew", trimString(ErrSessionIsNew, 50));
            DataAccessHelper.AddIntInputParam(com, "ErrSessionTimeOut", ErrSessionTimeOut);

            // validate date time params
            if (ErrTicketIssueDate.HasValue)
            {
                DataAccessHelper.AddDateTimeInputParam(com, "ErrTicketIssueDate", ErrTicketIssueDate);
            }
            if (ErrTicketExpiration.HasValue)
            {
                DataAccessHelper.AddDateTimeInputParam(com, "ErrTicketExpiration", ErrTicketExpiration);
            }

            DataAccessHelper.AddDateTimeInputParam(com, "ErrorTime", ErrorTime);
            DataAccessHelper.AddStringInputParam(com, "ErrMachineName", trimString(ErrMachineName, 255));
            DataAccessHelper.AddStringInputParam(com, "ErrorName", trimString(ErrorName, 50));
            DataAccessHelper.AddStringInputParam(com, "ErrorMessage", trimString(ErrorMessage, 255));
            DataAccessHelper.AddStringInputParam(com, "ErrStackTrace", trimString(ErrStackTrace, 500));
            try
            {
                DataAccessHelper.ExecuteScalar(com);
            }
            catch (Exception ex)
            {
                string m = ex.Message;
            }
        }

        /// <summary>
        /// Gets a count of the recent number of errors in the system.
        /// </summary>
        /// <param name="days"></param>
        /// <returns></returns>
        public int GetRecentErrorCount(int? days)
        {
            return GetRecentErrors(days, null, "ErrorLogId").Rows.Count;
        }

        /// <summary>
        /// Gets a list of the recent errors in the system.
        /// </summary>
        /// <param name="days"></param>
        /// <param name="top"></param>
        /// <returns></returns>
        public DataTable GetRecentErrors(int? days, int? top)
        {
            return GetRecentErrors(days, top, "*");
        }

        private static DataTable GetRecentErrors(int? days, int? top, string column)
        {
            string sql =
            @"
                SELECT {0} {1}
                FROM ErrorLog
                {2}
                ORDER By ErrorTime DESC
            ";
            string topSQL = top.HasValue ? "TOP " + top.Value : "";
            string columnSQL = column;
            string dateSQL = days.HasValue ? "WHERE ErrorTime > @Date" : "";
            SqlCommand cmd = DataAccessHelper.CreateSqlCommand(string.Format(sql, topSQL, columnSQL, dateSQL));
            if (days.HasValue)
            {
                DateTime date = DateTime.Today.AddDays(-days.Value);
                DataAccessHelper.AddDateTimeInputParam(cmd, "Date", date);
            }
            DataTable dt = DataAccessHelper.GetRecord(cmd).Tables[0];
            return dt;
        }

        private string trimString(string str, int len)
        {
            if (str.Length > len)
            {
                str = str.Substring(0, len);
            }
            return str;
        }
    }
}
