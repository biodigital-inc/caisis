using System;
using System.Collections;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Web;
using System.Web.SessionState;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;

using System.Web.Security;
using System.Security;
using System.Security.Principal;

using Caisis.Security;

using Caisis.DataAccess;
using Caisis.BOL;
using Caisis.Controller;
using Caisis.UI.Core.Classes;

namespace Caisis.UI.Core.Eforms
{
	/// <summary>
	/// Removes current user from session on load. On submit verifies clinic user and adds credentials to session, then hides parent layer to reveal prior eform.
	/// </summary>
	public partial class EFormClinicUserLogin : System.Web.UI.Page
	{

		protected void Page_Load(object sender, System.EventArgs e)
		{
			
			// this page just refreshed to save permissions, now hide the layer
			if(Request.QueryString["hide"] != null && Request.QueryString["hide"].Equals("true"))
			{
				this.HideMe();
			}
			else if(Page.IsPostBack)
			{
                SetCredentials();
			}	
			// on page load remove current user from session
			else if(!Page.IsPostBack) 
			{
				UserController uct = new UserController();
				uct.LogoutUser();

				Session.Remove(SessionKey.LoginId);
				Session.Remove(SessionKey.GroupViewCode);
				//Session.Remove(SessionKey.UserPurpose);
				//Session.Remove(SessionKey.DatasetId);	
		
				FormsAuthentication.SignOut();
			
				Response.Cookies["dsPerms"].Expires = new DateTime(2005,1,1);//set date in past to remove cookie

				// get users with edit eform rights
				UserDa da = new UserDa();

				int dsId = Convert.ToInt32(Session[SessionKey.DatasetId].ToString());
				
				DataSet ds = da.GetUsersWithPermission(dsId, PermissionManager.EFormEdit);
                DataView dv = ds.Tables[0].DefaultView;
                dv.Sort = "UserName";
                ClinicUsers.DataSource = dv;
				ClinicUsers.DataValueField = "UserName";
				ClinicUsers.DataTextField = "UserName";
				ClinicUsers.DataBind();
			}
		}

        protected void RedirectUser(object sender, CommandEventArgs e)
        {

            Session.Remove(SessionKey.DatasetId);	
            Response.Redirect("../../ClientSideRedirect.aspx"); 
        }

		// check user credentials and login
		//protected void SubmitBtnClick(object sender, CommandEventArgs e)
		//{
		//	if(CheckCredentials())
		//	{
				// if credentials verified, hide parent layer
		//		this.HideMe();
		//	}
		//}

		private void HideMe()
		{
			Page.RegisterClientScriptBlock("xyz", "<script language=javascript>parent.frames.hideClinicUserLogin();</script>");
		}

		private void SetCredentials()
		{
			string roleList = "";
			string hashedPassword = "";
			int loginSessionId = 0;

			string userName = ClinicUsers.SelectedValue;

			UserController ct = new UserController();

			try 
			{	
				// UserController handles hashed passwords
				// hashedPassword				= FormsAuthentication.HashPasswordForStoringInConfigFile(ClinicUserPswd.Text, "MD5");	
				// loginSessionId				=  ct.LoginUser(userName, hashedPassword);
				loginSessionId = ct.LoginUser(userName, ClinicUserPswd.Text);
				
				Session[SessionKey.LoginId] = loginSessionId;
					
			}
			catch (ClientException ex)  
			{
                errorMessage.Text = ex.Message;
                /*
                switch (ex.ExceptionType)  
				{
					
                    case ClientExceptionType.InvalidPassword:
						errorMessage.Text = "Invalid Password. Passwords are case-sensitive.";
						break;
					case ClientExceptionType.InvalidUser:
						errorMessage.Text = "Username does not exist.";
						break;
					case ClientExceptionType.InactiveUser:
						errorMessage.Text = "User has been deactivated. Please contact admin.";
						break;
				}
                 */
			}	

			if(loginSessionId > 0)
			{
			
				HttpContext currentContext = HttpContext.Current;
			
				string formsCookieStr = string.Empty;

				FormsAuthenticationTicket ticket = new    FormsAuthenticationTicket(
					1,                                  // version
					userName,                     // user name
					DateTime.Now,                       // issue time
					DateTime.Now.AddMinutes(Session.Timeout),       // EXPIRES, updated 4/4/05
					false,                              // persistent
					roleList							// user data
					);

				// get the encrypted representation suitable for placing in a HTTP cookie
				formsCookieStr = FormsAuthentication.Encrypt(ticket);
			
				HttpCookie FormsCookie = new HttpCookie(FormsAuthentication.FormsCookieName, formsCookieStr);
				
				currentContext.Response.Cookies.Add(FormsCookie);

				int dsId = Convert.ToInt32(Session[SessionKey.DatasetId].ToString());

				// set permissions refreshes page
				SetPermissions(loginSessionId, dsId, userName); 
			}
		}

		private void SetPermissions(int loginSessionId, int datasetIdVal, string userName)  
		{
			string purposeVal = "ClinicEforms";

			UserController secControl = new UserController();

			string permissionList = secControl.GetPermissions(loginSessionId,purposeVal,datasetIdVal, userName); 
			string encryptedPerms = CustomCryptoHelper.EasyEncrypt(permissionList);
      
			HttpCookie perms = new HttpCookie("dsPerms", encryptedPerms);
			perms.Expires = DateTime.Now.AddYears(1);
			Response.Cookies.Add(perms);

            Session[SessionKey.GroupViewCode] = secControl.SetGroupViewCode(datasetIdVal, userName);

			// Hide
			Response.Redirect(Request.Path + "?hide=true"); //must reload page so that the permissions can be reloaded into the principal object in the Global.asax
		}

        /* centralized logic in v4.1 FS
       /// <summary>
       /// Set the identifier that will be used to set tab visibility based on user group
       /// </summary>
       /// <param name="datasetIdVal">datasetId</param>
       private void SetGroupViewCode(int datasetId)  
       {    
           UserDa uda	= new UserDa();
			
           DataSet uds = uda.GetByUserName(userName); //TODO: replace this with call to GetUserId and set output variable UserId
           int userId = int.Parse(uds.Tables[0].Rows[0]["UserId"].ToString());
			
           GroupDa da = new GroupDa();
           DataSet ds = da.GetGroupAccessCode(userId, datasetId);
            
           Session[SessionKey.GroupViewCode] = ds.Tables[0].Rows[0][Group.GroupAccessCode].ToString();
           
       }
        */

        #region Web Form Designer generated code
        override protected void OnInit(EventArgs e)
		{
			//
			// CODEGEN: This call is required by the ASP.NET Web Form Designer.
			//
			InitializeComponent();
			base.OnInit(e);
		}
		
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
