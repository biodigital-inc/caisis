using System;
using System.Data;
using System.Collections;
using System.Web;
using System.Web.UI;
using System.Web.SessionState;
using System.Security;
using System.Security.Principal;
using System.Web.Security;
using System.Configuration;
using System.Web.Mail;
using System.Diagnostics;
using System.Text;

using Caisis.Security;
using Caisis.DataAccess;

namespace Caisis.UI.Core.Classes
{
    /// <summary>
    /// Represent the logic for logging application and user related errors to the system event log, Caisis database and Caisis error email.
    /// </summary>
    public class ExceptionHandler
    {

        /// <summary>
        /// Represents the type of error as a User Releated Error
        /// </summary>
        private static readonly string USER_ERROR_TYPE = "User Error";

        /// <summary>
        /// Creates a new instance of the ExceptionHandler.
        /// </summary>
        public ExceptionHandler()
        {
        }

        /// <summary>
        /// Publish the exception to the system event log and/or database and/or error email.
        /// </summary>
        /// <param name="ex">The exception to be published.</param>
        public static void Publish(Exception ex)
        {
            Publish(ex, string.Empty);
        }

        /// <summary>
        /// Publish the exception to the system event log and/or database and/or error email.
        /// </summary>
        /// <param name="ex">The exception to be published.</param>
        /// <param name="errorType">Optional user error subject text.</param>
        public static void Publish(Exception ex, string errorType)
        {
            string LOWER_TRUE_STRING = bool.TrueString.ToLower();

            string logErrorsToSystemEventLog = CaisisConfiguration.GetWebConfigValue("logErrorsToSystemEventLog");
            string emailErrors = CaisisConfiguration.GetWebConfigValue("emailErrors");
            string logErrorsToDatabase = CaisisConfiguration.GetWebConfigValue("logErrorsToDatabase");

            //log errors to application log
            if (!string.IsNullOrEmpty(logErrorsToSystemEventLog) && logErrorsToSystemEventLog.ToLower().Equals(LOWER_TRUE_STRING))
            {
                ExceptionHandler.WriteToApplicationLog(ex);
            }

            //send errors to admin email address
            if (!string.IsNullOrEmpty(emailErrors) && emailErrors.ToLower().Equals(LOWER_TRUE_STRING))
            {
                ExceptionHandler.SendErrorEmail(ex, errorType);
            }

            // log errors to database table for reporting in admin
            if (!string.IsNullOrEmpty(logErrorsToDatabase) && logErrorsToDatabase.ToLower().Equals(LOWER_TRUE_STRING))
            {
                ExceptionHandler.WriteToDatabaseLog(ex);
            }
        }

        /// <summary>
        /// Sends an email to the error email
        /// </summary>
        /// <param name="message">The message to send to the application email.</param>
        public static void SendEmail(string message)
        {
            SendEmail(message, USER_ERROR_TYPE);
        }

        /// <summary>
        /// Sends an email to the error email with specified subject
        /// </summary>
        /// <param name="message">The message to send to the application email.</param>
        /// <param name="subject">The subject of to the email.</param>
        public static void SendEmail(string message, string subject)
        {
            MailManager mailer = new MailManager();
            mailer.SendEmailFromError(mailer.ErrorEmailAddress, string.Empty, subject, message);
        }


        /// <summary>
        /// Send exception to error email specified in web.config
        /// </summary>
        /// <param name="ex">The exception containing the message to email</param>
        public static void SendErrorEmail(Exception ex)
        {
            SendErrorEmail(ex, string.Empty);
        }

        /// <summary>
        /// Send exception to error email specified in web.config with errorType as subject
        /// </summary>
        /// <param name="ex">The exception containing the message to email</param>
        /// <param name="errorType">Optional user error subject text.</param>
        public static void SendErrorEmail(Exception ex, string errorType)
        {
            //ExceptionHandler.Publish(ex);

            string userName = "";

            if (HttpContext.Current.User != null)
            {
                userName = HttpContext.Current.User.Identity.Name;
            }


            HttpRequest req = HttpContext.Current.Request;
            HttpSessionState ses = HttpContext.Current.Session;


            string userBrowser = req.Browser.Type.ToString() + " (" + req.Browser.Version.ToString() + ")";
            string userPlatform = req.Browser.Platform.ToString();
            string userJavascript = req.Browser.JavaScript.ToString() + " (" + req.Browser.EcmaScriptVersion.ToString() + ")"; ;
            string userCookies = req.Browser.Cookies.ToString();
            string userIpAddress = req.UserHostAddress.ToString();
            string userAuthenticated = req.IsAuthenticated.ToString();

            // user Roles
            string userRoleList = "";
            if (req.Cookies["dsPerms"] != null)
            {
                userRoleList = CustomCryptoHelper.EasyDecrypt(req.Cookies["dsPerms"].Value.ToString());
            }
            else
            {
                userRoleList = "User permissions cookie does not exist.";
            }

            //session info 
            string sessionInfo = "";

            if (ses != null)
            {
                sessionInfo = "\n Is new session : " + ses.IsNewSession.ToString();

                if (ses[SessionKey.LoginId] != null)
                {
                    sessionInfo += "\n LoginId: " + ses[SessionKey.LoginId];
                    sessionInfo += "\n Session TimeOut: " + ses.Timeout;
                    sessionInfo += "\n Patient Id: ";
                    if (ses[SessionKey.PatientId] != null)
                    {
                        sessionInfo += ses[SessionKey.PatientId].ToString();
                    }

                    sessionInfo += "\n User Dataset: ";
                    if (ses[SessionKey.DatasetId] != null)
                    {
                        sessionInfo += ses[SessionKey.DatasetId].ToString();
                    }
                }
                else
                {
                    sessionInfo = "\n User does not have a Session.LoginId.";
                }
            }
            else
            {
                sessionInfo = "\n HttpContext.Current.Session is null. No session information available.";
            }


            //cookie info
            string ticketIssueDate = "No Ticket Issued";
            string ticketExpDate = "No Ticket Issued";

            if (HttpContext.Current.User != null && HttpContext.Current.User.Identity is FormsIdentity)
            {
                FormsAuthenticationTicket ticket = ((FormsIdentity)HttpContext.Current.User.Identity).Ticket;

                ticketIssueDate = ticket.IssueDate.ToString();
                ticketExpDate = ticket.Expiration.ToString();
            }

            string ticketInfo = "";
            ticketInfo += "\n User ticket issued (same as user login Time) : " + ticketIssueDate;
            ticketInfo += "\n User ticket expiration Date :" + ticketExpDate;

            string messageBody = "Time of error:  " + DateTime.Now;
            messageBody += "\nUser name:  " + userName;
            messageBody += "\n";
            messageBody += "\nMachine environment -------------------------------";
            messageBody += "\nMachineName: " + HttpContext.Current.Server.MachineName;
            messageBody += "\nUser Host Address: " + req.UserHostName;
            messageBody += "\nURL: " + req.Url;
            messageBody += "\nPlatform: " + userPlatform;
            messageBody += "\nBrowser Type: " + userBrowser;
            messageBody += "\nJavaScript Enabled: " + userJavascript;
            messageBody += "\nUser IP Address: " + userIpAddress;

            messageBody += "\n";
            messageBody += "\nUser Session\\Ticket Info -------------------------------:" + sessionInfo;
            messageBody += "\n User Was Logged Into Caisis:  " + userAuthenticated;
            messageBody += "\n User Permissions : " + userRoleList;
            messageBody += ticketInfo;

            //if clause added 9/22 fs; 
            //TODO: SendErrorEmail should use BuildErrorEmail unless an explicit exception has been passed in
            if (ex != null)
            {
                messageBody += "\n\n Exception message : " + ex.Message;

                messageBody += "\n\n Stack Trace --------------------------------------------\n " + ex.ToString() + "\n";
            }
            else
            {
                messageBody += "\n\n Unable to publish stack trace. Caught exception was null.";
            }

            //new 2.2 error handling logic
            // messageBody += "\n\n Exception:  " + BuildErrorMessage();
            //end error logic 2.2

            string subject = USER_ERROR_TYPE;
            // is error type specified, set subject "User Error: Eform Merge Issue"
            if (!string.IsNullOrEmpty(errorType))
            {
                subject = string.Format("{0} : {1}", USER_ERROR_TYPE, errorType);
            }
            SendEmail(messageBody, subject);
        }

        /// <summary>
        /// Create error message string using exception
        /// </summary>
        /// <returns></returns>
        private static string BuildErrorMessage(Exception e)
        {
            const string uriFormat = "\r\n\r\nURI: {0}\r\n\r\n";
            const string exceptionFormat = "{0}: \"{1}\"\r\n{2}\r\n\r\n";

            HttpRequest Request = HttpContext.Current.Request;

            StringBuilder message = new StringBuilder();

            if (Request != null)
            {
                message.AppendFormat(uriFormat, Request.Path);
            }

            /*if (HttpContext.Current.Server != null) 
            {
                Exception e;
                for (e = HttpContext.Current.Server.GetLastError(); e != null; e = e.InnerException) 
                {
                    message.AppendFormat(exceptionFormat, 
                        e.GetType().Name, 
                        e.Message,
                        e.StackTrace);
                }
            }*/

            if (e != null)
            {
                message.AppendFormat(exceptionFormat, e.GetType().Name, e.Message, e.StackTrace);
            }

            return message.ToString();
        }

        /// <summary>
        /// Logs the exception to the Windows Application Event Log.
        /// </summary>
        /// <param name="ex">The exception to be published.</param>
        public static void WriteToApplicationLog(Exception ex)
        {
            const string sourceName = ".NET Runtime";
            const string serverName = ".";
            const string logName = "Application";

            string message = BuildErrorMessage(ex);

            if (!EventLog.SourceExists(sourceName))
            {
                EventLog.CreateEventSource(sourceName, logName);
            }

            EventLog Log = new EventLog(logName, serverName, sourceName);
            Log.WriteEntry(message, EventLogEntryType.Error);

            //Server.ClearError(); // uncomment this to cancel the error
        }

        /// <summary>
        /// Logs the exception to the Caisis database.
        /// </summary>
        /// <param name="ex">The exception to be published.</param>
        public static void WriteToDatabaseLog(Exception ex)
        {
            string ErrUserName = "";

            HttpRequest req = HttpContext.Current.Request;
            HttpSessionState ses = HttpContext.Current.Session;

            string ErrURL = req.Url.ToString();
            string ErrFullPath = req.PhysicalPath.ToString();//.Replace("\\",".");

            string ErrFileName = ErrFullPath.Substring(ErrFullPath.LastIndexOf("\\") + 1);

            string ErrQueryString = req.QueryString.ToString();
            string ErrForm = req.Form.ToString();

            //Remove viewstate and such
            if (ErrForm.Length > 0)
            {
                string[] aErrForm = ErrForm.Split('&');
                ErrForm = "";
                for (int i = 0; i < aErrForm.Length; i++)
                {
                    if (!aErrForm[i].StartsWith("__"))
                    {
                        ErrForm = ErrForm + aErrForm[i] + "&";
                    }
                }
            }

            string ErrBrowser = req.Browser.Type.ToString() + " (" + req.Browser.Version.ToString() + ")";
            string ErrPlatform = req.Browser.Platform.ToString();
            string ErrCookies = req.Browser.Cookies.ToString();
            string ErrJavascript = req.Browser.JavaScript.ToString() + " (" + req.Browser.EcmaScriptVersion + ")";
            string ErrIP = req.UserHostAddress.ToString();
            string ErrAuthenticated = req.IsAuthenticated.ToString();
            string ErrHostName = req.UserHostName;

            // user Roles
            string ErrPermList = "";

            //session info 
            string ErrSessionIsNew = "";
            int ErrLoginId = -1;
            int ErrSessionTimeOut = -1;
            int ErrPatientId = -1;
            int ErrDatasetId = -1;

            //TODO: Add tab info

            //path after core
            //to show the section

            DateTime? ErrTicketIssueDate = null;
            DateTime? ErrTicketExpiration = null;

            DateTime ErrorTime = DateTime.Now;

            string ErrMachineName = HttpContext.Current.Server.MachineName;

            string ErrorName = "";
            string ErrorMessage = "";
            string ErrStackTrace = "";

            if (HttpContext.Current.User != null)
            {
                ErrUserName = HttpContext.Current.User.Identity.Name;
            }


            if (req.Cookies["dsPerms"] != null)
            {
                ErrPermList = CustomCryptoHelper.EasyDecrypt(req.Cookies["dsPerms"].Value.ToString());
            }
            else
            {
                ErrPermList = "User permissions cookie does not exist.";
            }

            if (ses != null)
            {
                ErrSessionIsNew = ses.IsNewSession.ToString();

                if (ses[SessionKey.LoginId] != null)
                {
                    if (PageUtil.IsInteger(ses[SessionKey.LoginId].ToString()))
                    {
                        ErrLoginId = int.Parse(ses[SessionKey.LoginId].ToString());
                    }

                    ErrSessionTimeOut = ses.Timeout;

                    if (ses[SessionKey.PatientId] != null)
                    {
                        if (PageUtil.IsInteger(ses[SessionKey.PatientId].ToString()))
                        {
                            ErrPatientId = int.Parse(ses[SessionKey.PatientId].ToString());
                        }
                    }

                    if (ses[SessionKey.DatasetId] != null)
                    {
                        if (PageUtil.IsInteger(ses[SessionKey.DatasetId].ToString()))
                        {
                            ErrDatasetId = int.Parse(ses[SessionKey.DatasetId].ToString());
                        }
                    }
                }
                else
                {
                    //"User does not have a Session.LoginId."
                }
            }
            else
            {
                //"HttpContext.Current.Session is null. No session information available."
            }


            //cookie info
            if (HttpContext.Current.User != null && HttpContext.Current.User.Identity is FormsIdentity)
            {
                FormsAuthenticationTicket ticket = ((FormsIdentity)HttpContext.Current.User.Identity).Ticket;

                ErrTicketIssueDate = ticket.IssueDate;
                ErrTicketExpiration = ticket.Expiration;
            }

            if (ex != null)
            {
                ErrorName = ex.GetType().Name;
                ErrorMessage = ex.Message;
                // ErrStackTrace = ex.StackTrace;
                ErrStackTrace = ex.ToString();
            }

            // log error details to db
            ErrorLogDa elda = new ErrorLogDa();
            elda.LogError(ErrLoginId,
                            ErrDatasetId,
                            ErrPatientId,
                            ErrUserName,
                            ErrURL,
                            ErrFullPath,
                            ErrFileName,
                            ErrForm,
                            ErrQueryString,
                            ErrBrowser,
                            ErrPlatform,
                            ErrJavascript,
                            ErrIP,
                            ErrAuthenticated,
                            ErrHostName,
                            ErrPermList,
                            ErrSessionIsNew,
                            ErrSessionTimeOut,
                            ErrTicketIssueDate,
                            ErrTicketExpiration,
                            ErrorTime,
                            ErrMachineName,
                            ErrorName,
                            ErrorMessage,
                            ErrStackTrace
                         );

        }
    }
}
