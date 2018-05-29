using System;
using System.Collections;
using System.ComponentModel;
using System.Web;
using System.Web.SessionState;
using System.Security;
using System.Security.Principal;
using System.Web.Security;


using System.Configuration;
using System.Web.Mail;
using System.Diagnostics;

using Caisis.Security;
using Caisis.DataAccess;


using Caisis.UI.Core.Classes;

namespace Caisis.UI 
{
	/// <summary>
	/// Handles authentication, ui view cookies and default error handling.
	/// </summary>
	public class Global : System.Web.HttpApplication
	{
		public Global()
		{
			InitializeComponent();
		}	
		
		protected void Application_Start(Object sender, EventArgs e)
		{
			//			ExceptionHandler.SendEmail("Application started on server " + Server.MachineName + ".  Time:  "+DateTime.Now);
			
		}
 
		/// <summary>
		/// Initializes Session variables when application is set to development Mode.  This event fires when user
		/// session begins.
		/// </summary>
		/// <param name="sender"></param>
		/// <param name="e"></param>
		protected void Session_Start(Object sender, EventArgs e)
		{
			SecurityController sc = new SecurityController();
			if (sc.CheckDevelopmentMode())  
			{
                //default development values: must be corresponding record in development database or development mode will cause error on login page
                try
                {
                    
                    UserDa da = new UserDa();
                    int userLoginId = da.RecordUserLogin(HttpContext.Current.User.Identity.Name);

                    Session[SessionKey.DatasetId] = 1;
                    Session[SessionKey.PatientId] = 1;
                    Session[SessionKey.LoginId] = 0;// userLoginId;
                    Session[SessionKey.GroupViewCode] = "PATIENT LISTS,PATIENT DATA,FORMS,DATA ANALYSIS,PROTOCOL MANAGER,EFORMS";
                    Session[SessionKey.PtMRN] = "00000000";
                    Session[SessionKey.PtFirstName] = "John";
                    Session[SessionKey.PtLastName] = "Doe";
                    Session[SessionKey.PtDOB] = "01/01/1950";
                }
                catch(System.Data.SqlClient.SqlException noDevelopmentModeInfoInDatabaseException)
                {
                    string output = "<strong>Your system is in Development Mode and does not have the required User and Patient in the database.<br>" + 
                                    "Development mode puts a default user and patient in session so you can update code without logging in after each change.<br>We recommend using developmentMode only if you will be making very frequent updates to the code. It should ALWAYS be turned off when testing." +
                                    "<br><br><font color=red>To turn OFF development mode, set the \"developmentMode\" key equal to FALSE in the web.config file.</font><br><br>" +
                                    "To use developmentMode, add the UserName \"DevModeUser\" to your Users table, and add the following patient to your Patients table:<br>PtMRN = 00000000<br>PtFirstName = John<br>PtLastName = Doe<br>PtDOB = 01/01/1950";
                    Response.Write(output);

                    Response.Write("<br><br><br>Exception Detail: " + noDevelopmentModeInfoInDatabaseException.Message);
                }
				return;
			}

		}

		protected void Application_BeginRequest(Object sender, EventArgs e)
		{
            System.Globalization.CultureInfo currentCulture = System.Globalization.CultureInfo.CurrentCulture;

            // Determine if a user specified ShortDate format specified
            string webConfigShortDate = System.Web.Configuration.WebConfigurationManager.AppSettings["shortDateFormat"];

            if (!string.IsNullOrEmpty(webConfigShortDate) && !currentCulture.DateTimeFormat.ShortDatePattern.Equals(webConfigShortDate))
            {
                // Create a new CultureInfo based on Current Thread's CultureInfo
                System.Globalization.CultureInfo updatedCulture = new System.Globalization.CultureInfo(currentCulture.LCID);
                
                // Set short date format
                updatedCulture.DateTimeFormat.ShortDatePattern = webConfigShortDate;
                
                // Finally update current thread's CultureInfo
                //  DateTime ToShortDateString() (or ToString("0:d")) references CurrentCulture and should be used THROUGHOUT app!
                System.Threading.Thread.CurrentThread.CurrentCulture = updatedCulture;
               
                //System.Threading.Thread.CurrentThread.CurrentUICulture = System.Threading.Thread.CurrentThread.CurrentCulture;
            }
		}

		protected void Application_EndRequest(Object sender, EventArgs e)
		{

		}

		protected void Application_AuthenticateRequest(Object sender, EventArgs e)
		{
			SecurityController sc = new SecurityController();
			
			// when in DEVELOPMENT mode set default values so developers do not have to log in after each build
			if (sc.CheckDevelopmentMode())  
			{
				FormsAuthenticationTicket ticket = new    FormsAuthenticationTicket(
					1,										 // version
					"DevModeUser",							// user name
					DateTime.Now,							// issue time
					DateTime.Now.AddMinutes(120),       // EXPIRES
					false,
					""
					);

				FormsIdentity id = new FormsIdentity(ticket);

				string [] allPerms = {"EditData","ViewData","DeleteData","UnlockData",
										 "AddPatient","DeletePatient","EditSecurity", "EditNarrative", "EditEForm", "InitiateEForm", "ApproveEForm"};
				//
				CustomPrincipal cp = new CustomPrincipal(id, allPerms);						
				if (Request.Cookies["diseaseView"] != null)  
				{
					cp.UserProfile["diseaseView"] = Request.Cookies["diseaseView"].Value.ToString();
				}

				HttpContext.Current.User = cp;	
				return;
			}
			

			HttpContext currentContext = HttpContext.Current;
			if (HttpContext.Current.User != null)
			{
				if (HttpContext.Current.User.Identity.IsAuthenticated)
				{
					if( HttpContext.Current.User.Identity is FormsIdentity ) 
					{
						FormsIdentity id = HttpContext.Current.User.Identity as FormsIdentity;
						
						//getting roles from cookie
						FormsAuthenticationTicket ticket = id.Ticket;

						string[] roleList = null;
						

						if (Request.Cookies["dsPerms"] != null)  
						{
							//will add logic to un hash permissions before storing
							string encryptedStr = Request.Cookies["dsPerms"].Value.ToString();
							try 
							{
								roleList = ((CustomCryptoHelper.EasyDecrypt(encryptedStr)).Split(','));
							}
							catch (ClientException ex)  
							{
								if (ex.ExceptionType == ClientExceptionType.InvalidPassword)  
								{									
									FormsAuthentication.SignOut();
									Response.Cookies["dsPerms"].Expires = new DateTime(2002,1,1);
								}
							}
						}
							
						CustomPrincipal cp = new CustomPrincipal(id, roleList);
						
						if (Request.Cookies["diseaseView"] != null)  
						{
							cp.UserProfile["diseaseView"] = Request.Cookies["diseaseView"].Value.ToString();
						}

						HttpContext.Current.User = cp;
					}
				}
			}
   
		}

		protected void Application_Error(Object sender, EventArgs e)
		{
			//updated 9/22
            Exception ex = Server.GetLastError();

            // hack: exclude chart-related image error from error messaging
            if (!IsChartImageException(ex))
            {
                ExceptionHandler.Publish(ex);
            }
		}

        private bool IsChartImageException(Exception ex)
        {
            if (ex.Message == "The image is not found." &&
                ex.Source == "System.Web.DataVisualization" &&
                ex.TargetSite != null && ex.TargetSite.Name == "ProcessSavedChartImage")
            {
                return true;
            }

            return false;
        }

		//only fires when SessionState = InProc
		protected void Session_End(Object sender, EventArgs e)
		{
			//			ExceptionHandler.SendEmail("Session ended on server " + Server.MachineName + ".  Time:  "+DateTime.Now);

		}

		protected void Application_End(Object sender, EventArgs e)
		{
			//			ExceptionHandler.SendEmail("Application ended on server " + Server.MachineName + ".  Time:  "+DateTime.Now);
		}
			
		#region Web Form Designer generated code
		/// <summary>
		/// Required method for Designer support - do not modify
		/// the contents of this method with the code editor.
		/// </summary>
		private void InitializeComponent()
		{    
		}
		#endregion
	}
}