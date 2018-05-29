using System;
using System.Security;
using System.Security.Principal;
using System.Security.Permissions;
using System.Configuration;

using Caisis.Security;

namespace Caisis.Controller
{
	/// <summary>
	/// This is the controller all other controllers are derived from.  Contains a place for
	/// centralizing logic.  Includes such 
	/// </summary>
	abstract public class BaseController
	{
		protected CustomPrincipal p;
		public BaseController()
		{
			p = (CustomPrincipal)System.Threading.Thread.CurrentPrincipal;
		}


		/// <summary>
		/// Checks to see if the current user is authenticated.  When user is running development mode
		/// this method automatically returns true.
		/// </summary>
		/// <returns>Bool "true" if user is authenticated.</returns>
		protected bool IsAuthenticated()  
		{

			if (null == p)  
			{
				return false;
			}
			else if (!p.Identity.IsAuthenticated)  
			{
				return false;
			}
			else  
			{
				return true;
			}
		}

		/// <summary>
		/// Returns the username of the user currently logged into the application.
		/// </summary>
		/// <returns>String representing the username of the current user.</returns>
		protected String GetUserName()  
		{
			SecurityController sc = new SecurityController();
			return sc.GetUserName();
		}

		/// <summary>
		/// Permissions in database should match string values: ViewData, EditData, UnlockData
		/// </summary>
		/// <remarks>
		/// To check permissions on other events like edit narrative, put
		/// call to PermissionMananger.HasPermissions("EditNarrative") directly in the class.
		/// Just common functions put in DataEntryControl for reference by children
		/// also in DB EditNarrative, DeleteData, DeletePatient, UnlockData, EditData, ViewData
		/// </remarks>
		protected void AuthorizeGet()  
		{
			if (!PermissionManager.HasPermission("ViewData")) 
			{
				throw new ClientException("You do not have permission to view this record, please re-login to the application.", true);
			}
		}

		/// <summary>
		/// <seealso cref="AuthorizeGet()"/>
		/// </summary>
		protected void AuthorizeUpdate()
		{
			if (!PermissionManager.HasPermission("EditData"))  {
				throw new ClientException("You do not have permission to edit this record, please re-login to the application.", true);
			}

		}
		/// <summary>
		/// <seealso cref="AuthorizeGet()"/>
		/// </summary>
		protected void AuthorizeDelete()
		{
			if (!PermissionManager.HasPermission("EditData"))  
			{
				throw new ClientException("You do not have permission to delete this record, please re-login to the application.", true);
			}
		}
		/// <summary>
		/// <seealso cref="AuthorizeGet()"/>
		/// </summary>
		protected void AuthorizeInsert()  
		{
			if (!PermissionManager.HasPermission("EditData"))  
			{
				throw new ClientException("You do not have permission to insert this record, please re-login to the application.", true);
			}
		}
	}
}
