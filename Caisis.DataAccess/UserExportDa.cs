using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Text;

namespace Caisis.DataAccess
{
    /// <summary>
    /// Summary description for UserExportDa.
    /// </summary>
    public class UserExportDa : BaseDA
    {
        /// <summary>
        /// SQL which retrieves User Exports By UserId
        /// </summary>
        private static readonly string GET_USER_EXPORTS_SQl =
        @"
        SELECT UserExports.* FROM UserExports 
        INNER JOIN UserLogins 
        ON UserLogins.UserLoginId = UserExports.UserLoginId 
        INNER JOIN Users 
        ON Users.UserId = UserLogins.UserId 
        WHERE Users.UserId = @UserId 
        ";

        public UserExportDa()
        {

        }

        protected override void SetParams()
        {
            this._GetStoredProc = "spGetUserExportsRecord";
            this._InsertStoredProc = "spInsertUserExportsRecord";
            this._UpdateStoredProc = "spUpdateUserExportsRecord";
            this._DeleteStoredProc = "spDeleteUserExportsRecord";
            this._GetByParentStoredProc = "";
        }

        /// <summary>
        /// Gets User Exports by UserId
        /// </summary>
        /// <param name="userId"></param>
        /// <returns></returns>
        public DataTable GetUserExports(int userId)
        {
            SqlCommand com = DataAccessHelper.CreateSqlCommand(GET_USER_EXPORTS_SQl);
            DataAccessHelper.AddIntInputParam(com, "UserId", userId);
            DataTable dt = DataAccessHelper.GetRecord(com).Tables[0];
            return dt;
        }

        /// <summary>
        /// Gets User Exports by UserId, restricted to Export Type
        /// </summary>
        /// <param name="userId"></param>
        /// <param name="exportType"></param>
        /// <returns></returns>
        public DataTable GetUserExports(int userId, string exportType)
        {
            string sql = GET_USER_EXPORTS_SQl + " AND ExportType = @ExportType";
            SqlCommand com = DataAccessHelper.CreateSqlCommand(sql);
            DataAccessHelper.AddIntInputParam(com, "UserId", userId);
            DataAccessHelper.AddStringInputParam(com, "ExportType", exportType);
            DataTable dt = DataAccessHelper.GetRecord(com).Tables[0];
            return dt;
        }

        /// <summary>
        /// Gets User Exports by UserId, restricted to Export Type, and which occur after ExportDate, ordered by ExportDate DESC.
        /// </summary>
        /// <param name="userId"></param>
        /// <param name="exportType"></param>
        /// <param name="exportDate"></param>
        /// <returns></returns>
        public DataTable GetRecentUserExports(int userId, string exportType, DateTime exportDate)
        {
            string sql = GET_USER_EXPORTS_SQl +
                @" AND ExportType = @ExportType AND ExportDate >= @ExportDate
                ORDER BY ExportDate DESC
                ";
            SqlCommand com = DataAccessHelper.CreateSqlCommand(sql);
            DataAccessHelper.AddIntInputParam(com, "UserId", userId);
            DataAccessHelper.AddStringInputParam(com, "ExportType", exportType);
            DataAccessHelper.AddDateTimeInputParam(com, "ExportDate", exportDate);
            DataTable dt = DataAccessHelper.GetRecord(com).Tables[0];
            return dt;
        }

        /// <summary>
        /// Returns a list of the most commonly user reports. Ordered by ExportCount DESC.
        /// SELECT
        ///     ExportName: column value
        ///     ExportCount: computed count of group by ExportName
        ///     ExportTitle: friendly display title "ExportName (ExportCount)"
        /// </summary>
        /// <param name="topResults">Restrict to TOP n results.</param>
        /// <param name="recentDays">Restrict to past n days.</param>
        /// <returns></returns>
        public DataTable GetMostCommonlyUserReports(int? topResults, int? recentDays)
        {
            // detmerine if to filter by days
            string restrictByCountSQL = string.Empty;
            if (topResults.HasValue)
            {
                restrictByCountSQL = " TOP " + topResults.Value + " ";
            }
            string restrictByDaysSQL = string.Empty;
            if (recentDays.HasValue)
            {
                restrictByDaysSQL = " AND ExportDate >= GETDATE() - " + recentDays.Value;
            }

            string sql =
            string.Format(@"
            SELECT {0} 
            ExportName,
            COUNT(ExportName) ExportCount,
            ExportName + ' (' + CAST(COUNT(ExportName) AS varchar(55)) + ')' AS ExportTitle
            FROM
            (
            SELECT
            CASE
	            WHEN CHARINDEX('?',ExportName) > 0 THEN SUBSTRING(ExportName,0,CHARINDEX('?',ExportName))
	            ELSE ExportName 
            END AS ExportName
            FROM UserExports
            WHERE ExportType = 'Report View' {1}) reports
            GROUP BY ExportName
            ORDER BY ExportCount DESC
            ", restrictByCountSQL, restrictByDaysSQL);

            SqlCommand com = DataAccessHelper.CreateSqlCommand(sql);
            DataTable dt = DataAccessHelper.GetRecord(com).Tables[0];
            return dt;
        }
    }
}
