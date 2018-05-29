using System;
using System.Data;
using System.Security;
using System.Security.Principal;
using System.Configuration;

//using Caisis.BusinessObject;

namespace Caisis.Security
{	

	/// <summary>
	/// Summary description for SecurityController.
	/// </summary>
	public class SecurityController
	{
		/// <summary>
		/// Toggled from web.config key. Primary purpose is to allow developers to refresh the 
		/// application after building (avoiding having to relogin each time to set the session variables)
		/// </summary>
		/// <returns></returns>
		public bool CheckDevelopmentMode()  
		{
			string devMode = ConfigurationSettings.AppSettings["developmentMode"];
		
			if (devMode != null && devMode.Equals("true"))  
			{
				return true;
			}
			else 
			{
				return false;
			}
		}

		/// <summary>
		/// Returns username of logged in user. Should be called instead of 
		/// Identity.Name to centralize logic. 
		/// </summary>
		/// <returns>username</returns>
		public String GetUserName()  
		{			
			IPrincipal p = System.Threading.Thread.CurrentPrincipal;
			
			return p.Identity.Name;
		}

		/// <summary>
		/// Returns the current view mode from clients cookie. Should be called to encapsulate logic
		/// </summary>
		/// <returns></returns>
		public string GetViewMode()
		{
			CustomPrincipal cp = System.Threading.Thread.CurrentPrincipal as CustomPrincipal;
			
			return cp.UserProfile["diseaseView"].ToString();
		}
		
	}
}
