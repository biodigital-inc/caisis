using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.DirectoryServices;
using System.Web.SessionState;
using System.Web.Security;
using System.Web;
using System.Security;
using System.Security.Principal;
using System.Text;
using System.Linq;

using Caisis.DataAccess;
using Caisis.BOL;
using Caisis.Security;
using Caisis.UI.Core.Classes;

namespace Caisis.Controller
{
    /// <summary>
    /// Controls the getting and setting user permissions and access rights
    /// </summary>
    public class UserController
    {
        private static readonly string LAST_NAME_MRN_SEARCH_PARAM = "LastNameMRN";

        /// <summary>
        /// A List of special Search Identifiers inserted in user search paramaters, when viewidentifiers = true
        /// </summary>
        private static readonly string[][] SPECIAL_PHI_ID_TYPES = new string[][] 
        { 
                new string[] { LAST_NAME_MRN_SEARCH_PARAM, "Last Name or MRN", "Patient Last Name or MRN" }
        };

        /// <summary>
        /// A List of special Search Identifiers inserted in user search paramaters, anyone has search access
        /// </summary>
        private static readonly string[][] SPECIAL_NON_PHI_ID_TYPES = new string[][] 
        { 
                new string[] { "PathNum", "PathNum", "Path Accession Number" } 
        };

        private HttpSessionState _session;

        public UserController()
        {

        }

        public UserController(HttpSessionState session)
        {
            _session = session;
        }

        /// <summary>
        /// Returns if User has permission to view patient identifiers
        /// </summary>
        /// <returns></returns>
        public bool CanViewPatientIdentifiers()
        {
            return PermissionManager.HasPermission(PermissionManager.ViewPatientIdentifiers);
        }

        /// <summary>
        /// Returns a list of user datasets
        /// </summary>
        /// <returns></returns>
        public DataSet GetUserDatasets()
        {
            SecurityController sc = new SecurityController();
            DataSetDa da = new DataSetDa();
            return da.GetByUser(sc.GetUserName());
        }

        public DataSet GetUserDatasets(string username)
        {
            return (new DataSetDa()).GetByUser(username);
        }

        /// <summary>
        /// Verifies user has permission to view this patient dataset, then logs user logged into dataset, returns the user permissions for the dataset.
        /// </summary>
        /// <param name="userLoginId">abstract id used to track and log patient out of current session</param>
        /// <param name="purpose">purpose for using the system</param>
        /// <param name="datasetId">id of patient poplation(dataset) user is accessing</param>
        /// <param name="userName"></param>
        /// <returns>list of user permissions</returns>
        public string GetPermissions(int userLoginId, string purpose, int datasetId, string userName)
        {
            string permissionsList = "";

            bool doesUserHaveAccessToDataset = this.VerifyUserAccessToDataset(datasetId, userName);


            if (doesUserHaveAccessToDataset == true)
            {
                //log the dataset and purpose selected
                UserDa user = new UserDa();

                SecurityController sc = new SecurityController();
                user.LogDatasetView(userLoginId, datasetId, purpose);

                PermissionDa perm = new PermissionDa();

                //returns list of permission based on dataset passed in and puts in dataset
                DataSet pds = perm.GetByUserDataset(userName, datasetId);

                //loop through dataset and put in comma deliminated list
                DataRowCollection drCol = pds.Tables[0].Rows;

                foreach (DataRow dr in drCol)
                {
                    permissionsList += "," + dr["Permission"].ToString();
                }

                if (!permissionsList.Equals(""))
                {
                    permissionsList = permissionsList.Remove(0, 1);
                }
            }
            else // user does not have access to this dataset of patients
            {
                throw new ClientException("User " + userName + " does not have access to this dataset of patients.");
            }

            return permissionsList;
        }

        public bool VerifyUserAccessToDataset(int datasetId)
        {
            SecurityController sc = new SecurityController();
            string userName = sc.GetUserName();

            return VerifyUserAccessToDataset(datasetId, userName);
        }

        public bool VerifyUserAccessToDataset(int datasetId, string userName)
        {
            DataSetDa dsDa = new DataSetDa();
            DataSet ds = dsDa.GetByUser(userName);
            if (ds.Tables[0].Rows.Count > 0)
            {
                foreach (DataRow dr in ds.Tables[0].Rows)
                {
                    if (dr["DatasetId"].ToString().Equals(datasetId.ToString()))
                    {
                        return true;
                    }
                }
            }
            return false;
        }

        /// <summary>
        /// Gets user permissions and puts them in an encrypted cookie
        /// </summary>
        /// <param name="purposeVal">user purpose</param>
        /// <param name="datasetIdVal">dataset id</param>
        public void SetPermissions(string purposeVal, int datasetIdVal, int loginId)
        {

            //int loginId = (int)Session[SessionKey.LoginId];

            //UserController secControl = new UserController();

            string permissionList = this.LogDatasetGetPermissions(loginId, purposeVal, datasetIdVal);
            string encryptedPerms = CustomCryptoHelper.EasyEncrypt(permissionList);

            HttpCookie perms = new HttpCookie("dsPerms", encryptedPerms);
            perms.Expires = DateTime.Now.AddYears(1);
            System.Web.HttpContext.Current.Response.Cookies.Add(perms);

            //SetGroupViewCode(datasetIdVal);

            // TODO: BEWARE THIS WAS REMOVED ON 1/26/08 and there may be repercussions!!! 
            // HttpContext.Current.Response.Redirect(HttpContext.Current.Request.Path); //must reload page so that the permissions can be reloaded into the principal object in the Global.asax
        }

        /// <summary>
        /// Gets user permissions and puts them in an encrypted cookie
        /// </summary>
        /// <param name="purposeVal"></param>
        /// <param name="datasetIdVal"></param>
        /// <param name="loginId"></param>
        /// <param name="userName"></param>
        public void SetPermissions(string purposeVal, int datasetIdVal, int loginId, string userName)
        {
            string permissionList = GetPermissions(loginId, purposeVal, datasetIdVal, userName);
            string encryptedPerms = CustomCryptoHelper.EasyEncrypt(permissionList);

            HttpCookie perms = new HttpCookie("dsPerms", encryptedPerms);
            perms.Expires = DateTime.Now.AddYears(1);
            System.Web.HttpContext.Current.Response.Cookies.Add(perms);

            // log default dataset
            int userId = GetUserId(userName);
            this.UpdateUserAttribute(UserAttributeName.DatasetId, datasetIdVal.ToString(), UserAttributeType.DefaultDataset, userId);
        }

        public int GetTabCount(int datasetId, string userName)
        {
            // TODO: should just use SetGroupViewCode; parse the string array on the .aspx page so you can use the tab count; dont need this method
            UserDa uda = new UserDa();
            DataSet uds = uda.GetByUserName(userName); //TODO: replace this with call to GetUserId and set output variable UserId
            int userId = int.Parse(uds.Tables[0].Rows[0][User.UserId].ToString());

            GroupDa da = new GroupDa();
            DataSet ds = da.GetGroupAccessCode(userId, datasetId);
            string tabs = ds.Tables[0].Rows[0][Group.GroupAccessCode].ToString();
            string[] tabNameList = tabs.ToString().Split(new Char[] { ',' });
            return tabNameList.Length;
        }

        /// <summary>
        /// Creates list of tabs names that should be available to user based on the user group(s)
        /// </summary>
        /// <param name="datasetIdVal">datasetId</param>
        public string SetGroupViewCode(int datasetId, string userName)
        {
            UserDa uda = new UserDa();

            DataSet uds = uda.GetByUserName(userName); //TODO: replace this with call to GetUserId and set output variable UserId
            int userId = int.Parse(uds.Tables[0].Rows[0][User.UserId].ToString());

            GroupDa da = new GroupDa();
            DataSet ds = da.GetGroupAccessCode(userId, datasetId);

            List<string> tabs = new List<string>();

            foreach (DataRow row in ds.Tables[0].Rows)
            {
                foreach (string s in row[Group.GroupAccessCode].ToString().Split(','))
                {
                    if (!tabs.Contains(s))
                    {
                        tabs.Add(s);
                    }
                }
            }

            // TODO: merge tabs

            //StringBuilder sb = new StringBuilder();
            // TODO: this ALWAYS RETURNS ONE COMMA Deliminated ROW. Don't need all of the below
            // user may be part of many groups and access to tabs must be cumulative
            /*
            foreach (DataRow dr in ds.Tables[0].Rows)
            {
                sb.Append(dr[Group.GroupAccessCode].ToString());
            }

            string[] tabNameList = sb.ToString().Split(new Char[] { ',' });

            string showTabs = "";

            // now remove duplicates from list 

            foreach (string s in tabNameList)
            {
                if (showTabs.IndexOf(s) == -1)
                {
                    showTabs += s;
                }
            }
            */
            // in v 4.1 this method moved to UserController for access by other pages. Session references removed. 
            //Session[SessionKey.GroupViewCode] = showTabs;
            //string tabs = ds.Tables[0].Rows[0][Group.GroupAccessCode].ToString();

            return string.Join(",", tabs.ToArray());
        }

        public string SetGroupViewCode(int datasetId)
        {
            return SetGroupViewCode(datasetId, new SecurityController().GetUserName());
        }

        /// <summary>
        /// Deprecated 3.5: use GetPermissions instead  
        /// </summary>
        [Obsolete]
        public string LogDatasetGetPermissions(int userLoginId, string purpose, int datasetId)
        {
            string userName = GetUserName();

            string permissionList = this.GetPermissions(userLoginId, purpose, datasetId, userName);

            # region 3.1 old : did not verify user was in dataset properly
            /*
			//check that dataset id is one of the user's in case cookie was tampered with
			DataSetDa dsDa = new DataSetDa();
			dsDa.GetByUser(GetUserName());

			//log the dataset and purpose selected
			UserDa user = new UserDa();
			
			SecurityController sc = new SecurityController();
			user.LogDatasetView(userLoginId, datasetId, purpose);			
			
			PermissionDa perm = new PermissionDa();
			//returns list of permission based on dataset passed in and puts in dataset
			DataSet pds = perm.GetByUserDataset(GetUserName(), datasetId);
			//loop through dataset and put in comma deliminated list
			string permissionsList = "";
			DataRowCollection drCol = pds.Tables[0].Rows;
			foreach (DataRow dr in drCol)  
			{
				permissionsList += ","+dr["Permission"].ToString();
			}
			
			if(!permissionsList.Equals(""))
			{
				permissionsList = permissionsList.Remove(0,1);
			}
			*/
            # endregion

            return permissionList;
        }



        public int LoginUser(string userName, string password)
        {
            //validate user's username and password
            bool loginValid = AuthenticateUserLogin(userName, password, false);

            //log user login, returns unique loginId. Could be used to check log that user logged out. 
            UserDa da = new UserDa();
            int userLoginId = da.RecordUserLogin(userName);

            //return userLoginId to put in session so log out can be recorded
            return userLoginId;
        }

        /// <summary>
        /// Authenticates username and hashed password against database. Invalid attempts responded with
        /// message detailing reason for failure.
        /// </summary>
        /// <param name="userName"></param>
        /// <param name="password"></param>
        /// <returns></returns>
        public bool AuthenticateUserLogin(string userName, string password, bool isUserTryingToUpdatePassword)
        {
            UserDa da = new UserDa();

			// handle deactivated users
			if (da.GetUserStatus(userName) == "InvalidDeactivated")
			{
				return HandleLoginException("InvalidDeactivated");
			}

            string ldapAuthenticationMode = ConfigurationManager.AppSettings["LDAPAuthenticationMode"];
            string ldapServer = ConfigurationManager.AppSettings["LDAPServer"];

            bool useLdapAuthentication = false;
            bool ldapOnly = false;
            bool accessMgrOnly = false;

            if ("mixed".Equals(ldapAuthenticationMode, StringComparison.OrdinalIgnoreCase))
            {
                useLdapAuthentication = true;
            }
            else if ("on".Equals(ldapAuthenticationMode, StringComparison.OrdinalIgnoreCase))
            {
                useLdapAuthentication = true;
                ldapOnly = true;
            }
            else if ("accessmgr".Equals(ldapAuthenticationMode, StringComparison.OrdinalIgnoreCase))
            {
                useLdapAuthentication = true;
                accessMgrOnly = true;
            }

            if (useLdapAuthentication)
            {
                // verify that the user current exists in caisis
                DataSet ds = da.GetByUserName(userName);

                if (ds.Tables[0].Rows.Count <= 0)
                {
                    return HandleLoginException("InvalidUsername");
                }

                if (accessMgrOnly)
                {
                    // Access Manager authenticated user and they exist in Caisis: authenticate
                    return true;
                }

                using (DirectoryEntry entry = new DirectoryEntry())
                {
                    if (!string.IsNullOrEmpty(ldapServer))
                    {
                        entry.Path = "LDAP://" + ldapServer;
                    }

                    entry.Username = userName;
                    entry.Password = password;

                    DirectorySearcher searcher = new DirectorySearcher(entry);
                    searcher.Filter = "(objectClass=user)";

                    try
                    {
                        searcher.FindOne();
                        // authenticated
                        return true;
                    }
                    catch (Exception e)
                    {
                        // not authenticated
                        if (ldapOnly)
                        {
                            // terminates method execution via a ClientException
                            return HandleLoginException("LDAPAuthenticationFailed");
                        }
                        // otherwise use Caisis authentication
                    }
                }
            }

            int elapsedDaysBetweenPasswordUpdate = 0;
            byte requirePasswordUpdateOnFirstLogin = 0;

            // only set values if user is not trying to update their password; values of 0 bypass security policy
            if (isUserTryingToUpdatePassword == false)
            {
                elapsedDaysBetweenPasswordUpdate = ForcePasswordUpdateOnDay(userName);
                requirePasswordUpdateOnFirstLogin = EnforcePasswordUpdateOnFirstLogin(userName);
            }

            string hashedPassword = FormsAuthentication.HashPasswordForStoringInConfigFile(password, "MD5");
            string loginStatus = da.ValidateUser(userName, hashedPassword, requirePasswordUpdateOnFirstLogin, elapsedDaysBetweenPasswordUpdate);
            return HandleLoginException(loginStatus);
        }

        // TODO: look at switch statement passthrough and return values
        public bool HandleLoginException(string loginStatus)
        {
            switch (loginStatus)
            {
                case "Valid":
                    return true;

                case "InvalidUsername":
                    throw new ClientException("Username does not exist.");

                case "InvalidPassword":
                    throw new ClientException("Invalid Password. Passwords are case-sensitive.");

                case "InvalidDeactivated":
                    throw new ClientException("User has been deactivated. Please contact the admin.");

                case "InvalidPasswordLength":
                    string min = CaisisConfiguration.GetWebConfigValue("MinimumPasswordLength");
                    throw new ClientException("New password must be at least " + min + " characters.");

                case "RepeatPassword":
                    string limit = CaisisConfiguration.GetWebConfigValue("RepeatPasswordsLimit");
                    throw new ClientException("You must use a new password that has not been used within the last " + limit + " password updates.");

                case "PasswordsNotEqual":
                    throw new ClientException("The new passwords you entered are not identical.");

                case "Invalid_ElapsedPasswordPeriod": // in v 4.1 
                    string days = CaisisConfiguration.GetWebConfigValue("ForcePasswordUpdateOnDay");
                    throw new ClientException("You are required to update your password every " + days + " days. Please update it now.");

                case "Invalid_PasswordUpdateRequiredOnFirstLogin": // this should stay in last switch position; not in v 4.1 ; this login status must be added to spValidateLogin
                    throw new ClientException("You must update your password on first login.");

                case "LDAPAuthenticationFailed":
                    throw new ClientException("Your username or password is incorrect. Please contact your administrator.");

                default:
                    return false;
            }
        }

        public bool ValidateNewPassword(string username, string password, string newPassword1, string newPassword2)
        {
            if (!newPassword1.Equals(newPassword2))
            {
                HandleLoginException("PasswordsNotEqual");
                return false;
            }
            else if (UsingRepeatPassword(username, newPassword1) > 0)
            {
                HandleLoginException("RepeatPassword");
                return false;
            }
            else if (MinimumPasswordLength() > 0 && newPassword1.Length < MinimumPasswordLength()) // this num should come from web.config
            {
                HandleLoginException("InvalidPasswordLength");
                return false;
            }
            else
            {
                return AuthenticateUserLogin(username, password, true);
            }
        }

        /*
        public bool ForcePasswordUpdate(string username, string password)
        {
            bool forceIt = false;

            // force update on first login?
            if (EnforcePasswordUpdateOnFirstLogin(username))
            {
                forceIt = true;
                HandleLoginException("FirstUserLogin");
            }
            // force update after elapsed time period?
            else if (ForcePasswordUpdateOnDay(username))
            {
                forceIt = true;
                HandleLoginException("ForcePasswordUpdate");
            }

            return forceIt;
        }
        */

        // return 0 if this policy is not being enforced or user has not used the password within limitation; else return limitation
        private int UsingRepeatPassword(string username, string newPassword)
        {
            // check web.config to see if turned on and how many allowed
            string limit = CaisisConfiguration.GetWebConfigValue("RepeatPasswordsLimit");
            if (PageUtil.IsInteger(limit))
            {
                int numPasswords = int.Parse(limit);
                if (numPasswords > 0)
                {
                    UserDa da = new UserDa();
                    string hashedNewPassword = FormsAuthentication.HashPasswordForStoringInConfigFile(newPassword, "MD5");
                    bool isRecent = da.IsUserPasswordRecent(username, hashedNewPassword, numPasswords);
                    if (isRecent)
                    {
                        return numPasswords;
                    }
                }
            }
            return 0;
        }

        private int MinimumPasswordLength()
        {
            // check web.config; default to 3
            string length = CaisisConfiguration.GetWebConfigValue("MinimumPasswordLength");
            if (PageUtil.IsInteger(length))
            {
                return int.Parse(length);
            }
            else
            {
                return 0;
            }
        }

        // first functional in v 4.1
        private int ForcePasswordUpdateOnDay(string username)
        {
            string day = CaisisConfiguration.GetWebConfigValue("ForcePasswordUpdateOnDay");
            UserDa da = new UserDa();
            if (!string.IsNullOrEmpty(day) && PageUtil.IsInteger(day) && !day.Equals("0"))
            {
                return int.Parse(day);
                //bool updatedWithinRequiredTime = da.UserChangedPasswordRecently(username, int.Parse(day));
                //if (updatedWithinRequiredTime == false)
                //{
                //    return true;
                //}
            }
            return 0;
        }

        // first functional in version 4.1 
        private byte EnforcePasswordUpdateOnFirstLogin(string username)
        {
            string force = CaisisConfiguration.GetWebConfigValue("ForcePasswordUpdateOnFirstLogin");
            if (!String.IsNullOrEmpty(force) && force.ToLower().Equals("true"))
            {
                return 1;
                //UserDa da = new UserDa();
                //int count = da.GetUserLoginCount(username);
                //if (count == 0)
                //{
                //    return true;
                //}
            }
            return 0;
        }


        private string GetUserName()
        {
            SecurityController sc = new SecurityController();
            return sc.GetUserName();
        }

        /// <summary>
        /// Returns the current User's UserId
        /// </summary>
        /// <returns></returns>
        public int GetUserId()
        {
            return GetUserId(GetUserName()); ;
        }

        /// <summary>
        /// Returns the specified User's UserId
        /// </summary>
        /// <param name="userName"></param>
        /// <returns></returns>
        public int GetUserId(string userName)
        {
            UserDa uDA = new UserDa();
            int userId = uDA.GetUserId(userName);
            return userId;
        }

        public void SetUserLoginCredentials(string user, string password)
        {
            string roleList = "";

            int loginSessionId = this.LoginUser(user, password);
            _session[SessionKey.LoginId] = loginSessionId;

            HttpContext currentContext = HttpContext.Current;
            string formsCookieStr = string.Empty;

            FormsAuthenticationTicket ticket = new FormsAuthenticationTicket(
                1,                                  // version
                user,                     // user name
                DateTime.Now,                       // issue time
                DateTime.Now.AddMinutes(_session.Timeout),       // EXPIRES, updated 4/4/05
                false,                              // persistent
                roleList							// user data
                );

            // get the encrypted representation suitable for placing in a HTTP cookie
            formsCookieStr = FormsAuthentication.Encrypt(ticket);
            HttpCookie FormsCookie = new HttpCookie(FormsAuthentication.FormsCookieName, formsCookieStr);

            currentContext.Response.Cookies.Add(FormsCookie);
        }

        public void LogoutUser()
        {
            UserDa da = new UserDa();
            DataSet ds = da.GetByUserName(this.GetUserName());
            if (ds.Tables[0].Rows[0]["UserId"] is int)
            {
                da.RecordUserLogout((int)ds.Tables[0].Rows[0]["UserId"]);
            }
        }

        public void LogLoginAttempt(string errorMsg, string userName )
        {
            int loginSessionId = -1;
            HttpRequest req = HttpContext.Current.Request;
            System.Web.HttpBrowserCapabilities browser = req.Browser;

            if (_session[SessionKey.LoginId] != null)
            {
                loginSessionId = (int)_session[SessionKey.LoginId];
            }
            string userBrowser = browser.Type.ToString() + " (" + browser.Version.ToString() + ")";
            string userPlatform = browser.Platform.ToString();
            string userJavascript = browser.JavaScript.ToString() + " (" + browser.EcmaScriptVersion.ToString() + ")"; ;
            string userCookies = browser.Cookies.ToString();
            string userIpAddress = req.UserHostAddress.ToString();
            string screenResolution = "Unknown";
            string message = errorMsg;
            if (message.Length == 0)
            {
                message = "Valid.";
            }

            if (req.Form["screenResolution"] != null && req.Form["screenResolution"].Length > 0)
            {
                screenResolution = req.Form["screenResolution"];
            }

            string colorDepth = "Unknown";
            if (req.Form["colorDepth"] != null && req.Form["colorDepth"].Length > 0)
            {
                colorDepth = req.Form["colorDepth"] + "-bit";
            }

            string userAgent = "No User Agent Strinng Received";
            if (req.UserAgent != null && req.UserAgent.Length > 0)
            {
                userAgent = req.UserAgent;
            }
            Caisis.DataAccess.UserDa ud = new Caisis.DataAccess.UserDa();
            ud.LogLoginAttempt(userName, loginSessionId, message, userIpAddress, userAgent, userBrowser, userPlatform, userJavascript, userCookies, screenResolution, colorDepth);
        }

        /// <summary>
        /// Updates password to new one and logs user logged in.
        /// </summary>
        /// <param name="userName"></param>
        /// <param name="password"></param>
        /// <param name="newPassword"></param>
        /// <returns></returns>
        public bool UpdateUserPassword(string userName, string password, string newPassword)
        {

            UserDa da = new UserDa();
            DataSet ds = da.GetByUserName(userName);
            int userId = (int)ds.Tables[0].Rows[0]["UserId"];
            Caisis.Security.SecurityController sc = new Caisis.Security.SecurityController();
            string userMakingUpdate = sc.GetUserName();

            // user updating record could be an admin or the user themselves; 
            // if sc.GetUserName does not return a value, it's the user from the login page 
            if (userMakingUpdate == null)
            {
                userMakingUpdate = userName;
            }

            bool updated = da.UpdateUserPassword(userId, newPassword, userMakingUpdate);
            if (updated)
            {
                da.RecordUserLogin(userName); // we need to record this after a password update due to the "UpdatePasswordOnFirstLogin" policy
            }
            return updated;
        }


        /// <summary>
        /// Logs a Patient View of current Session User.
        /// </summary>
        /// <param name="patientId">The PatientId of Patient to view.</param>
        /// <returns>Return a populated Patient object.</returns>
        public Patient ViewPatient(int patientId)
        {
            string username = this.GetUserName();
            return ViewPatient(patientId, username);
        }

        /// <summary>
        /// Logs a Patient View
        /// </summary>
        /// <param name="patientId">The PatientId of Patient to view.</param>
        /// <param name="username">The UserName of user viewing Patient.</param>
        /// <returns>Return a populated Patient object.</returns>
        public Patient ViewPatient(int patientId, string username)
        {
            //int userId = AuthorizePatientView(patientId);
            UserDa da = new UserDa();
            da.LogPatientView(username, patientId);

            Patient pt = new Patient();
            pt.Get(patientId);
            //return pt.DataSourceView.Table.Rows[0]; // we don't like doing it this way.

            return pt;
        }

        /// <summary>
        /// Gets the user last name from the currently logged in user.
        /// </summary>
        /// <returns></returns>
        public string GetLoggedInUserLastName()
        {
            string userLastName = string.Empty;

            // Get username from session
            SecurityController sCon = new SecurityController();
            string uName = sCon.GetUserName();
            if (!string.IsNullOrEmpty(uName))
            {
                // Get user last name from db
                UserDa uDa = new UserDa();
                DataTable uTable = uDa.GetByUserName(uName).Tables[0];
                userLastName = uTable.Rows[0][Caisis.BOL.User.UserLastName].ToString();

            }
            return userLastName;
        }

        #region Manage User Identifiers

        /// <summary>
        /// Returns a list of IdType lookup codes the User can search by
        /// </summary>
        /// <returns></returns>
        public DataTable GetSearchIdentifiers()
        {
            DataTable dt = new DataTable();
            LookupCodeDa da = new LookupCodeDa();
            // get search identifiers by dataset
            if (HttpContext.Current.Session != null && HttpContext.Current.Session[SessionKey.DatasetId] != null && !string.IsNullOrEmpty(HttpContext.Current.Session[SessionKey.DatasetId].ToString()))
            {
                object datasetId = HttpContext.Current.Session[SessionKey.DatasetId];
                // a list of unique identifiers across dataset
                string dataset = CacheManager.GetDatasetSQL(HttpContext.Current.Session[SessionKey.DatasetId]);
                IdentifierDa ida = new IdentifierDa();
                dt = ida.GetPatientSearchIdentifiers(dataset);
                // adjust to map to lookup tables (i.e., LkpCode and LkpDescription columns)
                dt.Columns.Add(new DataColumn(LookupCode.LkpCode, typeof(string), Identifier.IdType));
                dt.Columns.Add(new DataColumn(LookupCode.LkpDescription, typeof(string), Identifier.IdType));
            }
            // otherwise get from lookup codes
            else
            {
                dt = da.GetLookupCodes("IdType");
            }
            
            // If user can view Identifiers, get all IdType
            if (CanViewPatientIdentifiers())
            {
                // fill with non restrictive codes
                FillIdTableWithSpecialIdTypes(dt, SPECIAL_NON_PHI_ID_TYPES);
                // fill with view patient identifier specific codes
                FillIdTableWithSpecialIdTypes(dt, SPECIAL_PHI_ID_TYPES);
            }
            // else restrict to non PHI codes
            else
            {
                // attribute used to tag phi codes
                string IDTypeLookupCode = "IdType";
                string PHILookupAttribute = "PHI";

                // get a list of PHI lookup codes
                var phiCodes = from row in da.GetLookupCodesAttributeValues(IDTypeLookupCode, PHILookupAttribute).AsEnumerable()
                               let lkpCode = row[LookupCode.LkpCode].ToString()
                               select lkpCode;
                // from user search identifiers, filter those which aren't PHI
                var nonPhiCodes = from row in dt.AsEnumerable()
                                  let lkpCode = row[LookupCode.LkpCode].ToString()
                                  where !phiCodes.Contains(lkpCode)
                                  select row;
                if (nonPhiCodes.Count() > 0)
                {
                    // update data table to reflect filtered list
                    dt = nonPhiCodes.CopyToDataTable();
                }
                else
                {
                    dt = dt.Clone();
                }
                // fill with non restrictive codes
                FillIdTableWithSpecialIdTypes(dt, SPECIAL_NON_PHI_ID_TYPES);
            }
            return dt;
        }

        /// <summary>
        /// Returns the User's current search identifier
        /// </summary>
        /// <returns></returns>
        public string GetSearchIdentifier()
        {
            if (HasDefaultIdentifierType())
            {
                return GetDefaultIdentifierTypeCookie().Value;
            }
            else
            {
                return string.Empty;
            }
        }

        /// <summary>
        /// Returns if a user can search by the specified Identifier
        /// </summary>
        /// <param name="idType"></param>
        /// <returns></returns>
        public bool CanSearchIdentifier(string searchIdType)
        {
            if (!string.IsNullOrEmpty(searchIdType))
            {
                var foundIdTypes = from idTypeRow in GetSearchIdentifiers().AsEnumerable()
                                   let idType = idTypeRow[LookupCode.LkpCode].ToString()
                                   where !string.IsNullOrEmpty(idType) && idType.Equals(searchIdType, StringComparison.OrdinalIgnoreCase)
                                   select idType;

                return foundIdTypes.Count() > 0;
            }
            else
            {
                return false;
            }
        }

        /// <summary>
        /// Gets the HttpCookie representing the User's default search criteria
        /// </summary>
        /// <returns></returns>
        private HttpCookie GetDefaultIdentifierTypeCookie()
        {
            HttpCookie idTypeCookie = System.Web.HttpContext.Current.Request.Cookies["DefaultSearchType"];
            return idTypeCookie;
        }

        /// <summary>
        /// Gets if the default search cookie is set
        /// </summary>
        /// <returns></returns>
        public bool HasDefaultIdentifierType()
        {
            HttpCookie idTypeCookie = GetDefaultIdentifierTypeCookie();
            return !IsCookieEmpty(idTypeCookie);
        }

        /// <summary>
        /// Gets the Default Search tpe for current User
        /// </summary>
        /// <returns></returns>
        public string GetDefaultIdentifierType()
        {
            string cookieValue = GetSearchIdentifier();
            if (!string.IsNullOrEmpty(cookieValue))
            {
                // verify that this cookie value ALSO has an attribute of "UseAsDefault=True"; otherwise return null
                LookupCodeDa da = new LookupCodeDa();
                DataTable taggedIdTypes = da.GetLookupCodesAttributeValues("IdType", "UseAsDefault");
                string safeValue = cookieValue.Replace("'", "''");
                string matchExpr = LookupCode.LkpCode + " = '{0}' AND " + LookupCodeAttribute.AttributeValue + " = '{1}'";
                string fullExpr = string.Format(matchExpr, safeValue, bool.TrueString) + " OR " + string.Format(matchExpr, safeValue, bool.TrueString.ToLower());
                if (taggedIdTypes.Select(fullExpr).Length > 0)
                {
                    return cookieValue;
                }
            }
            return null;
        }

        /// <summary>
        /// Validates a cookie is not null or not empty
        /// </summary>
        /// <param name="idTypeCookie"></param>
        /// <returns></returns>
        private bool IsCookieEmpty(HttpCookie idTypeCookie)
        {
            return idTypeCookie == null || idTypeCookie.Value == string.Empty;
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="dt"></param>
        /// <param name="idTypes"></param>
        private void FillIdTableWithSpecialIdTypes(DataTable dt, string[][] idTypes)
        {
            DataColumn displayNameColumn;
            DataColumn idTypeColumn;
            if (dt.Columns.Contains("DisplayName"))
            {
                displayNameColumn = dt.Columns["DisplayName"];
            }
            else
            {
                displayNameColumn = new DataColumn("DisplayName", typeof(string));
                dt.Columns.Add(displayNameColumn);
            }
            if (dt.Columns.Contains(Identifier.IdType))
            {
                idTypeColumn = dt.Columns[Identifier.IdType];
            }
            else
            {
                idTypeColumn = new DataColumn(Identifier.IdType, typeof(string));
                dt.Columns.Add(idTypeColumn);
            }
            for (int i = 0; i < idTypes.Count(); i++)
            {
                string[] pseudoLkpCode = idTypes[i];
                DataRow blank = dt.NewRow();
                blank[idTypeColumn] = pseudoLkpCode[0];
                blank[LookupCode.LkpCode] = pseudoLkpCode[0];
                // special display name column
                blank[displayNameColumn] = pseudoLkpCode[1];
                blank[LookupCode.LkpDescription] = pseudoLkpCode[2];
                dt.Rows.InsertAt(blank, i);
            }
            foreach (DataRow row in dt.Rows)
            {
                row[displayNameColumn] = row[displayNameColumn] != null && row[displayNameColumn].ToString() != string.Empty ? row[displayNameColumn] : row[LookupCode.LkpCode];
            }
        }

        #endregion

        # region Manage User Attributes

        /// <summary>
        /// Get the value for current user provided the attribute name. Returns empty string if it does not exist.
        /// </summary>
        /// <param name="attributeName"></param>
        /// <returns></returns>
        public string GetUserAttributeValue(string attributeName)
        {
            string attributeValue = string.Empty;
            int userId = this.GetUserId();
            UserDa da = new UserDa();
            DataTable dt = da.GetUserAttribute(userId, attributeName);
            if (dt.Rows.Count > 0)
            {
                attributeValue = dt.Rows[0][UserAttribute.UserAttributeValue].ToString();
            }
            return attributeValue;
        }
        
        /// <summary>
        /// Return the attribute id for current user and provide attribute name. Returns 0 if not found. 
        /// </summary>
        /// <param name="attributeName"></param>
        /// <returns></returns>
        public int? GetUserAttributeId(string attributeName)
        {
            int userId = this.GetUserId();             
            return GetUserAttributeId(attributeName, userId);
        }

        /// <summary>
        /// Return the attribute id for current user and provide attribute name. Returns 0 if not found. 
        /// </summary>
        /// <param name="attributeName"></param>
        /// <param name="userId"></param>
        /// <returns></returns>
        public int? GetUserAttributeId(string attributeName, int userId)
        {
            int? userAttributeId = null;
            UserDa da = new UserDa();
            DataTable dt = da.GetUserAttribute(userId, attributeName);
            if (dt.Rows.Count > 0)
            {
                userAttributeId = int.Parse(dt.Rows[0][UserAttribute.UserAttributeId].ToString());
            }
            return userAttributeId;
        }

        /// <summary>
        /// Updates attribute value or inserts a new one if did not previously exist
        /// </summary>
        /// <param name="attributeName"></param>
        /// <param name="attributeValue"></param>
        /// <param name="attributeType"></param>
        public void UpdateUserAttribute(string attributeName, string attributeValue, string attributeType)
        {
            int userId = this.GetUserId();
            UpdateUserAttribute(attributeName, attributeValue, attributeType, userId);                
        }

        /// <summary>
        /// Updates attribute value or inserts a new one if did not previously exist
        /// </summary>
        /// <param name="attributeName"></param>
        /// <param name="attributeValue"></param>
        /// <param name="attributeType"></param>
        /// <param name="userId"></param>
        public void UpdateUserAttribute(string attributeName, string attributeValue, string attributeType, int userId)
        {
            int? userAttributeId = GetUserAttributeId(attributeName, userId);

            UserAttribute u = new UserAttribute();

            if (userAttributeId.HasValue)
            {
                u.Get(userAttributeId.Value);
            }
            else
            {
                u[UserAttribute.UserId] = userId;
                u[UserAttribute.UserAttributeType] = attributeType;
                u[UserAttribute.UserAttributeName] = attributeName;
            }

            // update or insert the attribute values
            u[UserAttribute.UserAttributeValue] = attributeValue;
            u.Save();
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="type"></param>
        /// <returns></returns>
        public DataTable GetUserAttributesByType(string type)
        {
            int userId = this.GetUserId();
            DataView view = UserAttribute.GetByFieldsAsDataView<UserAttribute>(new Dictionary<string, object>()
            {
                { UserAttribute.UserId, userId },
                { UserAttribute.UserAttributeType, type },
            });
            return view.Table;
        }

        # endregion 
    }
}
