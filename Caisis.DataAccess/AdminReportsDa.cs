using System;
using System.Collections;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;

namespace Caisis.DataAccess
{
    /// <summary>
    /// Summary description for SecurityReportsDa.
    /// </summary>
    public class AdminReportsDa
    {
        public AdminReportsDa()
        {
            //
            // TODO: Add constructor logic here
            //
        }

        //        public void LogLoginAttempt(string userName, int loginId,string errorMessage, string IP, string userAgent, string browser, string platform, string javascript, string cookies, string screenResolution, string colorDepth)
        //        {
        //
        //            if (errorMessage.Length > 50)
        //            {
        //                errorMessage = errorMessage.Substring(0,50);
        //            }
        //            if (userAgent.Length > 255)
        //            {
        //                userAgent = userAgent.Substring(0,255);
        //            }
        //                
        //            SqlCommand com = DataAccessHelper.CreateCommand("spInsertUserLoginAttempt");
        //            DataAccessHelper.AddStringInputParam(com, "UserName", userName);
        //            DataAccessHelper.AddDateTimeInputParam(com, "UserLoginAttemptTime", DateTime.Now);
        //            DataAccessHelper.AddIntInputParam(com, "UserLoginSessionId", loginSessionId );
        //            DataAccessHelper.AddStringInputParam(com, "UserErrorMessage", errorMessage);
        //            DataAccessHelper.AddStringInputParam(com, "UserIP", IP);
        //            DataAccessHelper.AddStringInputParam(com, "UserUserAgent", userAgent);
        //            DataAccessHelper.AddStringInputParam(com, "UserBrowser", browser);
        //            DataAccessHelper.AddStringInputParam(com, "UserPlatform", platform);
        //            DataAccessHelper.AddStringInputParam(com, "UserJavascript", javascript);
        //            DataAccessHelper.AddStringInputParam(com, "UserCookies", cookies);
        //            DataAccessHelper.AddStringInputParam(com, "UserScreenResolution", screenResolution);
        //            DataAccessHelper.AddStringInputParam(com, "UserColorDepth", colorDepth);
        //            DataAccessHelper.ExecuteScalar(com);
        //		
        //        }


        #region oldcode
        //        public DataSet GetLoginStatistics(string FromDate, string ToDate)  
        //        {
        //            SqlCommand com = DataAccessHelper.CreateCommand("spGetLoginStats");
        //            return AddParams(com,FromDate, ToDate);
        //        }
        //        public DataSet GetPatientViewslastByPatient(string FromDate, string ToDate)  
        //        {
        //            SqlCommand com = DataAccessHelper.CreateCommand("sp_DL_GetPatientViewsLastByPatient");
        //            return AddParams(com,FromDate, ToDate);
        //        }
        //        public DataSet GetPatientViewsByPatient(string ptId, string FromDate, string ToDate)  
        //        {
        //            SqlCommand com = DataAccessHelper.CreateCommand("sp_DL_GetPatientViewsByPatient");
        //            DataAccessHelper.AddStringInputParam(com, "PatientId", ptId);
        //            
        //            return AddParams(com,FromDate, ToDate);
        //        }
        //        
        //        public DataSet GetUsersLastFiveLogins(string username)  
        //        {
        //            SqlCommand com = DataAccessHelper.CreateCommand("sp_DL_getLastFiveLoginsForUser");
        //            DataAccessHelper.AddStringInputParam(com, "UserName", username);
        //            
        //            return GetRecord(com);
        //        }
        //        public DataSet GetUsersLogins(string username)  
        //        {
        //            SqlCommand com = DataAccessHelper.CreateCommand("sp_DL_getLoginsForUser");
        //            DataAccessHelper.AddStringInputParam(com, "UserName", username);
        //            
        //            return GetRecord(com);
        //        }
        //        public DataSet GetUsersLastFivePatientViews(string userId)  
        //        {
        //            SqlCommand com = DataAccessHelper.CreateCommand("sp_DL_GetPatientViewsByUserTopFive");
        //            DataAccessHelper.AddIntInputParam(com, "UserID", int.Parse(userId));
        //            
        //            return GetRecord(com);
        //        }
        //        public DataSet GetUsersPatientViews(string userId)  
        //        {
        //            SqlCommand com = DataAccessHelper.CreateCommand("sp_DL_GetPatientViewsByUser");
        //            DataAccessHelper.AddIntInputParam(com, "UserID", int.Parse(userId));
        //            
        //            return GetRecord(com);
        //        }
        //        public DataSet GetTimeSincePasswordChangeList(string FromDate, string ToDate)  
        //        {
        //            SqlCommand com = DataAccessHelper.CreateCommand("sp_DL_GetTimeSincePasswordChangeList");
        //            return AddParams(com,FromDate, ToDate);
        //        }
        //        
        //        public DataSet GetUserStatistics(string FromDate, string ToDate)  
        //        {
        //            SqlCommand com = DataAccessHelper.CreateCommand("spGetUserStatistics");
        //            return AddParams(com,FromDate, ToDate);
        //        }
        #endregion

        public DataSet GetUserInfo(string uName)
        {
            SqlCommand com = DataAccessHelper.CreateCommand("spGetUsersRecordByUserName");
            DataAccessHelper.AddStringInputParam(com, "UserName", uName);

            return GetRecord(com, null);
        }
        public DataSet GetUsersLastFiveLogins(string userName)
        {
            SqlCommand com = DataAccessHelper.CreateCommand("spRptAdminLastFiveLoginsForUser");
            DataAccessHelper.AddStringInputParam(com, "UserName", userName);

            return GetRecord(com, null);
        }
        public DataSet GetUsersLastFivePatientViews(string userId)
        {
            SqlCommand com = DataAccessHelper.CreateCommand("spRptAdminLastFivePatientViewsByAUser");
            DataAccessHelper.AddIntInputParam(com, "UserID", int.Parse(userId));

            return GetRecord(com, null);
        }
        public DataSet GetUsersLastFiveRecordChanges(string userId)
        {
            SqlCommand com = DataAccessHelper.CreateCommand("spRptAdminLastFiveUsersRecordChanges");
            DataAccessHelper.AddIntInputParam(com, "UserID", int.Parse(userId));

            return GetRecord(com, null);
        }

        //prepared for  multiple filter criterias
        public DataSet GetAdminReport(string dataset, string storedProcedure, IDictionary<string, string> paramNameValues, string fromDate, string toDate, bool useWarehouse)
        {
            SqlCommand com;
            //for security, only SPs written for this 
            //report tool can be executed
            if (storedProcedure.StartsWith("sp") && !storedProcedure.StartsWith("spRptAdmin"))
            {
                throw new ArgumentException("Stored procedure name must start with 'spRptAdmin'.");
            }
            else if (storedProcedure.StartsWith("spRptAdmin"))
            {
                com = GetAdminReportCommand(storedProcedure, CommandType.StoredProcedure, useWarehouse);
            }
            else
            {
                com = GetAdminReportCommand(storedProcedure, CommandType.Text, useWarehouse);
            }

            // fill params
            foreach (string paramName in paramNameValues.Keys)
            {
                string paramValue = paramNameValues[paramName];
                DataAccessHelper.AddStringInputParam(com, paramName, paramValue);
            }

            return AddTimePeriodParams(dataset, com, fromDate, toDate);
        }
        public DataSet GetAdminReport(string dataset, string storedProcedure, IDictionary<string, string> paramNameValues, bool useWarehouse)
        {
            SqlCommand com;
            //for security, only SPs written for this 
            //report tool can be executed
            if (storedProcedure.StartsWith("sp") && !storedProcedure.StartsWith("spRptAdmin"))
            {
                throw new ArgumentException("Stored procedure name must start with 'spRptAdmin'.");
            }
            else if (storedProcedure.StartsWith("spRptAdmin"))
            {
                com = GetAdminReportCommand(storedProcedure, CommandType.StoredProcedure, useWarehouse);
            }
            else
            {
                com = GetAdminReportCommand(storedProcedure, CommandType.Text, useWarehouse);
            }            // fill params
            foreach (string paramName in paramNameValues.Keys)
            {
                string paramValue = paramNameValues[paramName];
                DataAccessHelper.AddStringInputParam(com, paramName, paramValue);
            }

            return GetRecord(com, dataset);
        }
        public DataSet GetAdminReport(string dataset, string sql, string paramName, string paramValue, string fromDate, string toDate, bool useWarehouse)
        {
            //for security, only SPs written for this 
            //report tool can be executed
            SqlCommand com;

            if (sql.StartsWith("sp") && !sql.StartsWith("spRpt"))
            {
                throw new ArgumentException("Stored procedure name must start with 'spRpt'.");
            }
            else if (sql.StartsWith("spRpt")) // executing a stored proc
            {
                com = GetAdminReportCommand(sql, CommandType.StoredProcedure, useWarehouse);
            }
            else
            {
                com = GetAdminReportCommand(sql, CommandType.Text, useWarehouse);
            }

            if (paramName != null)
            {
                DataAccessHelper.AddStringInputParam(com, paramName, paramValue);
            }
            return AddTimePeriodParams(dataset, com, fromDate, toDate);
        }
        public DataSet GetAdminReport(string dataset, string sql, string paramName, string paramValue, bool useWarehouse)
        {
            //for security, only SPs written for this 
            //report tool can be executed
            SqlCommand com;

            if (sql.StartsWith("sp") && !sql.StartsWith("spRpt"))
            {
                throw new ArgumentException("Stored procedure name must start with 'spRpt'.");
            }
            else if (sql.StartsWith("spRpt")) // executing a stored proc
            {
                com = GetAdminReportCommand(sql, CommandType.StoredProcedure, useWarehouse);
            }
            else
            {
                com = GetAdminReportCommand(sql, CommandType.Text, useWarehouse);
            }

            if (paramName != null && paramName != "")
            {

                DataAccessHelper.AddStringInputParam(com, paramName, paramValue);

            }
            return GetRecord(com, dataset);
        }

        /// <summary>
        /// Get a sql command used for running report, based on connection
        /// </summary>
        /// <param name="sql">The SQL Select or Stored Proc</param>
        /// <param name="type">The type of command (sql text or stored proc)</param>
        /// <param name="useWarehouse">Determines if using a connection to the data warehouse.</param>
        /// <returns></returns>
        private SqlCommand GetAdminReportCommand(string sql, CommandType type, bool useWarehouse)
        {
            SqlCommand com = new SqlCommand();
            // Determine if to use a connection to the data warehouse
            if (useWarehouse)
            {
                if (type == CommandType.StoredProcedure)
                {
                    com = DataAccessHelper.CreateWarehouseCommand(sql);
                }
                else if (type == CommandType.Text)
                {
                    com = DataAccessHelper.CreateWarehouseSqlCommand(sql);
                }
            }
            else
            {
                if (type == CommandType.StoredProcedure)
                {
                    com = DataAccessHelper.CreateCommand(sql, CommandType.StoredProcedure);
                }
                else if (type == CommandType.Text)
                {
                    com = DataAccessHelper.CreateCommand(sql, CommandType.Text);
                }
            }
            return com;
        }

        /* for use of sql strings
        public DataSet GetAdminReport(string sqlString)
        {
            DataSet ds = new DataSet();
            DataTable dt = new DataTable();
            DataAccessHelper.ExecuteSqlSelect(sqlString, dt);
            ds.Tables.Add(dt);
            return ds;
        }
        */

        private DataSet AddTimePeriodParams(string dataset, SqlCommand com, string FromDate, string ToDate)
        {
            if (isDate(FromDate))
            {
                DataAccessHelper.AddDateTimeInputParam(com, "FromDate", DateTime.Parse(FromDate));
            }
            if (isDate(ToDate))
            {
                DataAccessHelper.AddDateTimeInputParam(com, "ToDate", DateTime.Parse(ToDate));
            }
            return GetRecord(com, dataset);
        }

        private DataSet GetRecord(SqlCommand com, string datasetSQL)
        {
            if (com.CommandType == CommandType.Text && !string.IsNullOrEmpty(datasetSQL))
            {
                string srcSQL = com.CommandText;
                string destSQL = SetPatientDatasetParam(srcSQL, datasetSQL);
                com.CommandText = destSQL;
            }
            return DataAccessHelper.GetRecord(com);
        }

        /// <summary>
        /// Returns the @Patients param to be aliased in the code to the patient dataset sql.
        /// i.e., @Patients - > (SELECT ...) Patients
        /// </summary>
        /// <param name="sql"></param>
        /// <param name="dataset"></param>
        /// <returns></returns>
        private static string SetPatientDatasetParam(string sql, string dataset)
        {
            // (SELECT ...)  Patients
            string aliasedPatients = string.Format("({0}) Patients", dataset);
            // @Patients - > (SELECT ...) Patients
            string adjustedSQL = sql.Replace("@Patients", aliasedPatients);
            // return adjusted SQL
            return adjustedSQL;
        }

        private bool isDate(string str)
        {
            bool isDate = true;
            try
            {
                DateTime dt = DateTime.Parse(str);
            }
            catch (FormatException)
            {
                isDate = false;
            }
            return isDate;
        }
    }
}
