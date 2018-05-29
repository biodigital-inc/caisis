using System;
using System.Data;
using System.Data.SqlClient;
using System.Collections;
using System.Collections.Generic;

namespace Caisis.DataAccess
{
    /// <summary>
    /// Calls to database relevant to users
    /// </summary>
    public class UserDa
    {
        /// <summary>
        /// Gets validity of user and password
        /// </summary>
        /// <param name="userName">username</param>
        /// <param name="password">password</param>
        /// <returns>status code of Valid, InvalidUsername, InvalidPassword, or InvalidDeactivated</returns>
        public string ValidateUser(string userName, string password, byte requirePasswordUpdateOnFirstLogin, int elapsedDays)
        {
            SqlCommand com = DataAccessHelper.CreateCommand("spValidateLogin");
            DataAccessHelper.AddStringInputParam(com, "UserName", userName);
            DataAccessHelper.AddStringInputParam(com, "UserPassword", password);
            DataAccessHelper.AddBitInputParam(com, "RequirePasswordUpdateOnFirstLogin", requirePasswordUpdateOnFirstLogin);
            DataAccessHelper.AddIntInputParam(com, "ElapsedDays", elapsedDays);
            DataAccessHelper.AddStringOutputParam(com, "LoginStatus");
            Hashtable ht = DataAccessHelper.ExecuteScalar(com);

            // a status code of Valid, InvalidUsername, InvalidPassword, or InvalidDeactivated
            return ht["LoginStatus"].ToString();
        }
        
        /*public string ValidateUser(string userName, string password)
        {
            SqlCommand com = DataAccessHelper.CreateCommand("spValidateLogin");
            DataAccessHelper.AddStringInputParam(com, "UserName", userName);
            DataAccessHelper.AddStringInputParam(com, "UserPassword", password);
            DataAccessHelper.AddStringOutputParam(com, "LoginStatus");
            Hashtable ht = DataAccessHelper.ExecuteScalar(com);

            // a status code of Valid, InvalidUsername, InvalidPassword, or InvalidDeactivated
            return ht["LoginStatus"].ToString();
        }*/

        /// <summary>
        /// Gets validity of user
        /// </summary>
        /// <param name="userName">username</param>
        /// <returns>status code of Valid, InvalidUsername or InvalidDeactivated</returns>
        public string GetUserStatus(string userName)
        {
            SqlCommand com = DataAccessHelper.CreateCommand("spValidateUserIsActive");
            DataAccessHelper.AddStringInputParam(com, "UserName", userName);
            DataAccessHelper.AddStringOutputParam(com, "UserStatus");
            Hashtable ht = DataAccessHelper.ExecuteScalar(com);

            //Used from ForgotPassword, where password is unknown
            return ht["UserStatus"].ToString();
        }

        // we hate this method, but need it temporarily to make some attending accountable for the eform!
        public DataSet GetUserIdByFirstAndLastName(string firstName, string lastName)
        {
            string sqlStmt = "SELECT * FROM Users WHERE UserFirstName = '" + firstName + "' AND UserLastName = '" + lastName + "'";
            SqlCommand cmd = DataAccessHelper.CreateCommand(sqlStmt);
            cmd.CommandType = CommandType.Text;

            return DataAccessHelper.GetRecord(cmd);
        }

        //public DataSet GetRoles(string userName)  
        //{
        //	SqlCommand com = DataAccessHelper.CreateCommand("spGetUserRoles");
        //	DataAccessHelper.AddStringInputParam(com, "userName", userName);
        //	return DataAccessHelper.GetRecord(com);
        //}

        public DataSet GetUsers()
        {
            SqlCommand com = DataAccessHelper.CreateCommand("spGetUsers");
            return DataAccessHelper.GetRecord(com);
        }

        public DataTable GetByEmail(string emailAddress)
        {
            string sql = "SELECT * FROM Users WHERE UserEmail = '" + emailAddress + "'";
            DataTable dt = new DataTable();
            DataAccessHelper.ExecuteSqlSelect(sql, dt);
            return dt;
        }

        public DataSet GetByUserName(string userName)
        {
            SqlCommand com = DataAccessHelper.CreateCommand("spGetUsersRecordByUserName");
            DataAccessHelper.AddStringInputParam(com, "UserName", userName);

            return DataAccessHelper.GetRecord(com);
        }

        public int GetUserId(string userName)
        {
            SqlCommand com = DataAccessHelper.CreateCommand("spGetUserId");
            DataAccessHelper.AddStringInputParam(com, "UserName", userName);
            DataAccessHelper.AddIntOutputParam(com, "UserId");
            Hashtable ht = DataAccessHelper.ExecuteScalar(com);

            if (ht["UserId"] != null)
                return (int)ht["UserId"];
            else
                return 0;
        }

        public DataSet GetByUserId(int userId)
        {
            SqlCommand com = DataAccessHelper.CreateCommand("spGetUsersRecordByUserId");
            DataAccessHelper.AddIntInputParam(com, "UserId", userId);

            return DataAccessHelper.GetRecord(com);
        }
        /*
                public DataSet GetByPassword(string password)  
                {
                    SqlCommand com = DataAccessHelper.CreateCommand("spGetUsersRecordByPassword");
                    DataAccessHelper.AddStringInputParam(com, "userName", userName);

                    return DataAccessHelper.GetRecord(com);
		
                }
        */
        public bool LogPatientView(string userName, int patientId)
        {
            SqlCommand com = DataAccessHelper.CreateCommand("spInsertUserPatientViewsRecord");
            DataAccessHelper.AddStringInputParam(com, "userName", userName);
            DataAccessHelper.AddIntInputParam(com, "PatientId", patientId);
            DataAccessHelper.AddDateTimeInputParam(com, "ViewTime", DateTime.Now);

            DataAccessHelper.ExecuteScalar(com);

            return true;
        }

        /// <summary>
        /// Returns a list of recent patient views
        /// </summary>
        /// <param name="userId">the user's userid</param>
        /// <param name="dataset">the dataset under which user viewed patient</param>
        /// <param name="count">restrict records to top @count, null for all</param>
        /// <param name="distinct">true|false if to filter distinct patients</param>
        /// <returns></returns>
        public DataTable GetPatientView(int userId, string dataset, int? count, bool distinct)
        {
            string sql = @"
            SELECT {0} 
	            a.PatientId,
	            a.PtLastName,
	            a.PtMiddleName,
	            a.PtFirstName,
	            a.PtMRN, ";
            if (distinct)
            {
                sql += "MAX(a.ViewTime) AS ViewTime ";
            }
            else
            {
                sql += "a.ViewTime ";
            }
            sql += @"
            FROM 
                (SELECT
                    p.*,
                    upv.ViewTime
                FROM UserPatientViews upv
                INNER JOIN ({1}) p
                    ON p.PatientId = upv.PatientId
                WHERE upv.UserId = @UserId) a ";
            if (distinct)
            {
                sql += @"
            GROUP BY
	            a.PatientId,
	            a.PtLastName,
	            a.PtMiddleName,
	            a.PtFirstName,
	            a.PtMRN ";
            }
            sql += "ORDER BY ViewTime DESC";
            string countSQL = count.HasValue ? "TOP " + count.Value : "";
            sql = string.Format(sql, countSQL, dataset);
            SqlCommand com = DataAccessHelper.CreateSqlCommand(sql);
            DataAccessHelper.AddIntInputParam(com, "UserId", userId);

            DataTable dt = DataAccessHelper.GetRecord(com).Tables[0];
            return dt;
        }

        public int RecordUserLogin(string userName)
        {
            SqlCommand com = DataAccessHelper.CreateCommand("spInsertUserLoginsRecord");
            DataAccessHelper.AddStringInputParam(com, "userName", userName);
            DataAccessHelper.AddDateTimeInputParam(com, "UserLoginTime", DateTime.Now);

            DataAccessHelper.AddIntOutputParam(com, "NewPrimaryKey");


            Hashtable ht = DataAccessHelper.ExecuteScalar(com);

            return (int)ht["NewPrimaryKey"];
        }

        public bool RecordUserLogout(int userId)
        {
            SqlCommand com = DataAccessHelper.CreateCommand("spUpdateUserLogoutTime");
            DataAccessHelper.AddIntInputParam(com, "UserId", userId);
            DataAccessHelper.AddDateTimeInputParam(com, "UserLogoutTime", DateTime.Now);

            DataAccessHelper.ExecuteScalar(com);

            return true;
        }

        public bool LogDatasetView(int userLoginId, int dataSetId, string purpose)
        {
            SqlCommand com = DataAccessHelper.CreateCommand("spInsertUserDatasetViewsRecord");
            DataAccessHelper.AddIntInputParam(com, "userLoginId", userLoginId);
            DataAccessHelper.AddIntInputParam(com, "dataSetId", dataSetId);
            DataAccessHelper.AddStringInputParam(com, "purpose", purpose);

            DataAccessHelper.AddDateTimeInputParam(com, "ViewTime", DateTime.Now);

            DataAccessHelper.ExecuteScalar(com);

            return true;
        }

        public bool UpdateUserPassword(int userId, string userNewPassword, string updatedBy)
        {
            SqlCommand com = DataAccessHelper.CreateCommand("spUpdateUserPassword");
            DataAccessHelper.AddIntInputParam(com, "UserId", userId);
            DataAccessHelper.AddStringInputParam(com, "UserPassword", userNewPassword);
            DataAccessHelper.AddDateTimeInputParam(com, "UpdatedTime", DateTime.Now);
            DataAccessHelper.AddStringInputParam(com, "UpdatedBy", updatedBy);

            DataAccessHelper.AddIntOutputParam(com, "Valid");
            DataAccessHelper.ExecuteScalar(com);

            return true;
        }

        public bool UpdateForgotPassword(string userEmail, string userNewPassword, string updatedBy)
        {
            SqlCommand com = DataAccessHelper.CreateCommand("spUpdateUserPasswordEmail");
            DataAccessHelper.AddStringInputParam(com, "UserPassword", userNewPassword);
            DataAccessHelper.AddStringInputParam(com, "UserEmail", userEmail);
            DataAccessHelper.AddDateTimeInputParam(com, "UpdatedTime", DateTime.Now);
            DataAccessHelper.AddStringInputParam(com, "UpdatedBy", updatedBy);
            DataAccessHelper.ExecuteScalar(com);

            return true;
        }

        public int InsertUserRecord(string userName, string hashedPassword, string firstName, string lastName, string email, string updatedBy)
        {
            SqlCommand com = DataAccessHelper.CreateCommand("spInsertUsersRecord");
            DataAccessHelper.AddStringInputParam(com, "UserName", userName);
            DataAccessHelper.AddStringInputParam(com, "UserPassword", hashedPassword);
            DataAccessHelper.AddStringInputParam(com, "UserFirstName", firstName);
            DataAccessHelper.AddStringInputParam(com, "UserLastName", lastName);
            DataAccessHelper.AddStringInputParam(com, "UserEmail", email);

            DataAccessHelper.AddDateTimeInputParam(com, "EnteredTime", DateTime.Now);
            DataAccessHelper.AddDateTimeInputParam(com, "UpdatedTime", DateTime.Now);
            DataAccessHelper.AddDateTimeInputParam(com, "DeactivatedTime", null);

            DataAccessHelper.AddStringInputParam(com, "EnteredBy", updatedBy);
            DataAccessHelper.AddStringInputParam(com, "UpdatedBy", updatedBy);

            DataAccessHelper.AddIntOutputParam(com, "NewPrimaryKey");

            Hashtable outParams = DataAccessHelper.ExecuteScalar(com);

            if (outParams["NewPrimaryKey"] != System.DBNull.Value)
            {
                return (int)outParams["NewPrimaryKey"];
            }
            else
            {
                return -1;
            }
        }

        public bool UpdateUserRecord(int userId, string userName, string userFirstName, string userLastName, string userEmail, object deactivateDate, string updatedBy)
        {
            SqlCommand com = DataAccessHelper.CreateCommand("spUpdateUsersRecord");
            DataAccessHelper.AddIntInputParam(com, "UserId", userId);
            DataAccessHelper.AddStringInputParam(com, "UserName", userName);
            DataAccessHelper.AddStringInputParam(com, "UserFirstName", userFirstName);
            DataAccessHelper.AddStringInputParam(com, "UserLastName", userLastName);
            DataAccessHelper.AddStringInputParam(com, "UserEmail", userEmail);
            DataAccessHelper.AddDateTimeInputParam(com, "UpdatedTime", DateTime.Now);
            DataAccessHelper.AddStringInputParam(com, "UpdatedBy", updatedBy);
            DataAccessHelper.AddDateTimeInputParam(com, "DeactivatedTime", DataAccessHelper.ToDBDate(deactivateDate));

            DataAccessHelper.ExecuteScalar(com);

            return true;
        }

        public bool DeleteUserRecord(int userId)
        {
            SqlCommand com = DataAccessHelper.CreateCommand("spDeleteUsersRecord");
            DataAccessHelper.AddIntInputParam(com, "UserId", userId);

            DataAccessHelper.ExecuteScalar(com);

            return true;
        }

        public DataSet GetUserStatistics()
        {
            SqlCommand com = DataAccessHelper.CreateCommand("spRptAdminUserStatistics");
            return DataAccessHelper.GetRecord(com);
        }

        public DataSet GetUserStatistics(string OrderByField)
        {
            SqlCommand com = DataAccessHelper.CreateCommand("spGetUserStatistics");
            DataAccessHelper.AddStringInputParam(com, "OrderByField", OrderByField);
            return DataAccessHelper.GetRecord(com);
        }

        public DataSet GetUsersWithPermission(int datasetId, string permission)
        {
            SqlCommand com = DataAccessHelper.CreateCommand("spGetUsersWithPermission");
            DataAccessHelper.AddIntInputParam(com, "DatasetId", datasetId);
            DataAccessHelper.AddStringInputParam(com, "Permission", permission);
            return DataAccessHelper.GetRecord(com);
        }

        public void LogLoginAttempt(string userName, int loginId, string errorMessage, string IP, string userAgent, string browser, string platform, string javascript, string cookies, string screenResolution, string colorDepth)
        {

            if (errorMessage.Length > 50)
            {
                errorMessage = errorMessage.Substring(0, 50);
            }
            if (userAgent.Length > 255)
            {
                userAgent = userAgent.Substring(0, 255);
            }

            SqlCommand com = DataAccessHelper.CreateCommand("spInsertUserLoginAttempt");
            DataAccessHelper.AddStringInputParam(com, "UserName", userName);
            DataAccessHelper.AddDateTimeInputParam(com, "UserLoginAttemptTime", DateTime.Now);
            DataAccessHelper.AddIntInputParam(com, "UserLoginId", loginId);
            DataAccessHelper.AddStringInputParam(com, "UserErrorMessage", errorMessage);
            DataAccessHelper.AddStringInputParam(com, "UserIP", IP);
            DataAccessHelper.AddStringInputParam(com, "UserUserAgent", userAgent);
            DataAccessHelper.AddStringInputParam(com, "UserBrowser", browser);
            DataAccessHelper.AddStringInputParam(com, "UserPlatform", platform);
            DataAccessHelper.AddStringInputParam(com, "UserJavascript", javascript);
            DataAccessHelper.AddStringInputParam(com, "UserCookies", cookies);
            DataAccessHelper.AddStringInputParam(com, "UserScreenResolution", screenResolution);
            DataAccessHelper.AddStringInputParam(com, "UserColorDepth", colorDepth);
            DataAccessHelper.ExecuteScalar(com);

        }

        /// <summary>
        /// Returns the number of times the user has Logged into the system.
        /// </summary>
        /// <param name="userName">the name of the user to query</param>
        /// <returns>the number of times the user has logged into the system</returns>
        public int GetUserLoginCount(string userName)
        {
            string sql = "SELECT COUNT(*) AS CNT FROM UserLogins INNER JOIN Users ON Users.UserId = UserLogins.UserId  WHERE Users.UserName = '" + userName + "'";
            SqlCommand com = DataAccessHelper.CreateSqlCommand(sql);
            string loginCount = DataAccessHelper.GetRecord(com).Tables[0].Rows[0]["CNT"].ToString();
            return int.Parse(loginCount);
        }

        public DataTable GetUserLoginsCountByMonthInThisYear(int userId)
        {
            DateTime maxDate = DateTime.Now;
            DateTime minDate = new DateTime(maxDate.Year, 1, 1, 0, 0, 0);
            return GetUserLoginsCountByMonthInRange(userId, minDate, maxDate);
        }

        public DataTable GetUserLoginsCountByMonthInPastYear(int userId)
        {
            DateTime maxDate = DateTime.Now;
            DateTime normalizedMin = maxDate.AddDays(-365);
            DateTime minDate = new DateTime(normalizedMin.Year, normalizedMin.Month, normalizedMin.Day, 0, 0, 0);
            return GetUserLoginsCountByMonthInRange(userId, minDate, maxDate);
        }

        public DataTable GetUserLoginsCountByMonthInRange(int userId, DateTime minDate, DateTime maxDate)
        {
            string sql = 
            @"
            SELECT 
	            ul.UserId,
	            -- how often user logged in by year and month
	            YEAR(ul.UserLoginTime) AS LoginYear,
	            MONTH(ul.UserLoginTime) AS LoginMonth,
	            COUNT(ul.UserLoginTime) AS LoginCount
            	
            FROM UserLogins ul
            WHERE 
	            -- restrict to user
	            ul.UserId = @UserId
	            AND
	            -- restrict to logins within past year
	            ul.UserLoginTime >= @StartDate AND ul.UserLogintime <= @EndDate
            GROUP BY
	            ul.UserId,
	            -- group by year and month
	            YEAR(ul.UserLoginTime),
	            MONTH(ul.UserLoginTime) 
            ORDER BY LoginYear DESC, LoginMonth DESC
            ";
            SqlCommand com = DataAccessHelper.CreateSqlCommand(sql);
            DataAccessHelper.AddIntInputParam(com, "UserId", userId);
             DataAccessHelper.AddDateTimeInputParam(com, "StartDate", minDate);
            DataAccessHelper.AddDateTimeInputParam(com, "EndDate", maxDate);
           DataTable dt = DataAccessHelper.GetRecord(com).Tables[0];
            return dt;
        }

        /// <summary>
        /// Returns active users within a given dataset
        /// </summary>
        /// <param name="datasetId"></param>
        /// <returns></returns>
        public DataTable GetActiveUsersInDataset(int datasetId)
        {
            string sql = @"SELECT DISTINCT Users.*, COALESCE(UserLastName,'') + ', ' + COALESCE(UserFirstName,'') AS UserLastCommaFirst 
            FROM Datasets INNER JOIN
                 GroupDatasets ON Datasets.DatasetId = GroupDatasets.DatasetId INNER JOIN
                 Groups ON GroupDatasets.GroupId = Groups.GroupId INNER JOIN
                 UserGroups ON Groups.GroupId = UserGroups.GroupId INNER JOIN
                 Users ON UserGroups.UserId = Users.UserId
            WHERE DatasetActive = 1 AND 
                  Datasets.DataSetId = " + datasetId + @" AND
                  (UserGroups.DeactivatedTime IS NULL OR UserGroups.DeactivatedTime >GETDATE()) AND
                  (Users.DeactivatedTime IS NULL OR Users.DeactivatedTime >GETDATE())
                  ORDER BY UserLastCommaFirst";
            SqlCommand com = DataAccessHelper.CreateSqlCommand(sql);
            DataTable dt = DataAccessHelper.GetRecord(com).Tables[0];
            return dt;
        }

        /// <summary>
        /// Returns a list of the user's most recent passwords ordered by DATE (DESC/RECENT)
        /// </summary>
        /// <param name="userName">the name of the user to query</param>
        /// <param name="count">the number of recent password to obtain</param>
        /// <returns>A datatable of UserPassword and LoggedTime</returns>
        public DataTable GetUserRecentPasswords(string userName, int count)
        {
            //List<string> oldPasswordList = new List<string>();
            string sql = "SELECT TOP " + count + " AuditLog_Users.UserPassword,MAX(AuditLog_Users.LoggedTime) FROM AuditLog_Users INNER JOIN Users ON Users.UserId = AuditLog_Users.UserId WHERE Users.UserName = '" + userName + "' GROUP BY AuditLog_Users.UserPassword ORDER BY MAX(AuditLog_Users.LoggedTime) DESC";
            SqlCommand com = DataAccessHelper.CreateSqlCommand(sql);
            DataTable dt = DataAccessHelper.GetRecord(com).Tables[0];
            return dt;
        }

        /// <summary>
        /// Checks if the user's requested password is one of their most recent passwords.
        /// </summary>
        /// <param name="userName">name of the user to query</param>
        /// <param name="testPassword">the requested password to test</param>
        /// <returns></returns>
        public bool IsUserPasswordRecent(string userName, string testPassword, int passwordCount)
        {
            List<string> passwordList = new List<string>();
            DataTable dt = GetUserRecentPasswords(userName, passwordCount);
            foreach (DataRow row in dt.Rows)
            {
                string oldPassword = row["UserPassword"].ToString();
                if (passwordList.Count < passwordCount)
                {
                    passwordList.Add(oldPassword);
                }
                else
                {
                    break;
                }
            }
            return passwordList.Contains(testPassword);
        }

        /// <summary>
        /// Returns if the user has changed their password with # days from Today
        /// </summary>
        /// <param name="userName">the user to query</param>
        /// <param name="days">the number of days to search back from Today</param>
        /// <returns></returns>
        public bool UserChangedPasswordWithinAllowablePeriod(string userName, int days)
        {
            SqlCommand com = DataAccessHelper.CreateCommand("spInsertUsersRecord");
            DataAccessHelper.AddStringInputParam(com, "UserName", userName);
            DataAccessHelper.AddIntInputParam(com, "ElapsedDays", days);   
            Hashtable outParams = DataAccessHelper.ExecuteScalar(com);

            if (outParams["HasUpdatedPassword"] != System.DBNull.Value && ((bool)outParams["HasUpdatedPassword"]) == false)
            {
                return false;
            }
            else
            {
                return true;
            }
            
            // tried the below and finally gave up and created a proc
            // string sql = "select DISTINCT AuditLog_Users.UserPassword from AuditLog_Users inner join Users on AuditLog_Users.UserId = Users.UserId  where AuditLog_Users.UpdatedTime > (GETDATE() - " + days + ") and Users.UserName = '" + userName + "' AND AuditLog_Users.UserPassword <> Users.UserPassword";
			// string sql = @"SELECT DISTINCT AuditLog_Users.UserPassword FROM AuditLog_Users INNER JOIN Users ON AuditLog_Users.UserId = Users.UserId WHERE DATEDIFF(day,AuditLog_Users.LoggedTime,GETDATE()) < {0} AND Users.UserName = '{1}' AND AuditLog_Users.UserPassword <> Users.UserPassword";
			// string sql = @"SELECT DISTINCT AuditLog_Users.UserPassword FROM AuditLog_Users inner join Users ON AuditLog_Users.UserId = Users.UserId 
			//				WHERE DATEDIFF(day, COALESCE(AuditLog_Users.UpdatedTime, AuditLog_Users.EnteredTime), GETDATE()) > {0} 
			//				AND Users.UserName = '{1}' AND AuditLog_Users.UserPassword <> Users.UserPassword";
			//SqlCommand com = DataAccessHelper.CreateSqlCommand(string.Format(sql, days, userName));
            //DataTable dt = DataAccessHelper.GetRecord(com).Tables[0];
            //return dt.Rows.Count > 0;
        }


        public DataTable GetUserAttribute(int userId, string attributeName)
        {
            string sql = "SELECT * FROM UserAttributes WHERE UserId = " + userId + " AND UserAttributeName = '" + attributeName + "'";
            SqlCommand com = DataAccessHelper.CreateSqlCommand(sql);
            return DataAccessHelper.GetRecord(com).Tables[0];
        }

        public int GetUserLoginCount(int? days)
        {
            string sql =
            @"
            SELECT COUNT(DISTINCT(UserId))
            FROM UserLogins
            {0}
            ";
            string dateSQL = days.HasValue ? "WHERE UserLoginTime > @Date" : "";
            SqlCommand cmd = DataAccessHelper.CreateSqlCommand(string.Format(sql, dateSQL));
            if (days.HasValue)
            {
                DateTime date = DateTime.Today.AddDays(-days.Value);
                DataAccessHelper.AddDateTimeInputParam(cmd, "Date", date);
            }
            DataTable dt = DataAccessHelper.GetRecord(cmd).Tables[0];
            return (int)dt.Rows[0][0];
        }


        /// <summary>
        /// Returns users with a given attribute value
        /// </summary>
        /// <param name="datasetId"></param>
        /// <returns></returns>
        public DataTable GetUsersByAttributeValue(string AttrubuteName, string AttributeValue)
        {
            string sql = @"SELECT *
            FROM Users INNER JOIN UserAttributes ON Users.UserId = UserAttributes.UserId
            WHERE UserAttributes.UserAttributeName = '" + AttrubuteName + @"' AND UserAttributes.UserAttributeValue = '" + AttributeValue + @"'";
            SqlCommand com = DataAccessHelper.CreateSqlCommand(sql);
            DataTable dt = DataAccessHelper.GetRecord(com).Tables[0];
            return dt;
        }

        #region Contacts

        /// <summary>
        /// Returns a list of Contacts assoicated with the user
        /// </summary>
        /// <param name="userId"></param>
        /// <returns></returns>
        public DataTable GetUserContacts(int userId)
        {
            string sql =
            @"
            SELECT
                u.UserId,
	            u.UserName,
	            u.UserFirstName,
	            u.UserLastName,
	            u.UserEmail,
                c.ContactId,
	            c.FirstName,
	            c.LastName
            FROM Users u
            INNER JOIN Contact c
	            ON u.UserId = c.UserId
            WHERE
	            u.UserId = @UserId
            ";
            SqlCommand cmd = DataAccessHelper.CreateSqlCommand(sql);
            DataAccessHelper.AddIntInputParam(cmd, "UserId", userId);
            DataTable dt = DataAccessHelper.GetRecord(cmd).Tables[0];
            return dt;
        }

        /// <summary>
        /// Returns a list of Organizations associated with the user
        /// </summary>
        /// <param name="userId"></param>
        /// <returns></returns>
        public DataTable GetUserOrganizations(int userId)
        {
            string sql =
            @"
            SELECT
                u.UserId,
                u.UserName,
                u.UserFirstName,
                u.UserLastName,
                u.UserEmail,
                c.ContactId,
                c.FirstName,
                c.LastName,
                oc.OrganizationContactId,
                o.OrganizationId,
                o.Name,
                o.ShortName,
                o.OrgNum
            FROM Users u
            INNER JOIN Contact c
	            ON u.UserId = c.UserId
            INNER JOIN ProjectOrganization_ProjectContact oc
	            ON c.ContactId = oc.ContactId
            INNER JOIN ProjectOrganization o
	            ON oc.OrganizationId = o.OrganizationId
            WHERE
	            u.UserId = @UserId
            ";
            SqlCommand cmd = DataAccessHelper.CreateSqlCommand(sql);
            DataAccessHelper.AddIntInputParam(cmd, "UserId", userId);
            DataTable dt = DataAccessHelper.GetRecord(cmd).Tables[0];
            return dt;
        }

        #endregion
    }
}
