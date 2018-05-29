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
using Caisis.Controller;

namespace Caisis.UI  
{
	
	public partial class Logout : System.Web.UI.Page
	{
		protected void Page_Load(object sender, System.EventArgs e)
		{
			
            UserController ct = new UserController();
			ct.LogoutUser();
			
            // clear session
			Session.Abandon();
            Session.Clear();

            // see ya
			FormsAuthentication.SignOut();
			
            // delete cookies
			Response.Cookies["dsPerms"].Expires = new DateTime(2002,1,1);//set date in past to remove cookie

            // back to login page
            RedirectOnLogout();
        }

        private void RedirectOnLogout()
        {
            // do not redirect to login page if using novell access manager; otherwise send user back to login page
            if (!CaisisConfiguration.GetWebConfigValue("LDAPAuthenticationMode").ToLower().Equals("accessmgr") )
            {
                Response.Redirect("Login.aspx", false);
            }
        }

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
