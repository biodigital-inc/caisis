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
using System.Data.SqlClient;
using System.Web.Security;

using Caisis.DataAccess;
using Caisis.BOL;

using System.Web.Mail;
using System.Configuration;

using Caisis.UI.Core.Classes;

namespace Caisis.UI.Admin
{
	/// <summary>
	/// Summary description for AdminEditPassword.
	/// </summary>
	public partial class AdminEditPassword : AdminBasePage
	{

        protected bool UseLDAP
        {
            get
            {
                string ldapMode = CaisisConfiguration.GetWebConfigValue("LDAPAuthenticationMode");
                if (!string.IsNullOrEmpty(ldapMode) && ldapMode.ToLower() == "on")
                {
                    return true;
                }
                else
                {
                    return false;
                }
            }
        }

		override protected void Page_Load(object sender, System.EventArgs e)
		{
			base.Page_Load(sender, e);

			FormTable.Visible = false;

			valMsg.Text = "";

			SelectUserName.Attributes.Add("onchange", "this.form."+SelectSubmitted.ClientID+".value = 'true'; this.form.submit();");

			string strJScript	 = "<SCRIPT LANGUAGE=javascript><!-- \n";
			strJScript			+= "function setPassword(){\n";
			strJScript			+= "if(dataForm." + PswdType.ClientID + ".checked == true){;\n";
			strJScript			+= "	dataForm." + UserPassword.ClientID + ".value = dataForm." + RandomPasswordHolder.ClientID + ".value;\n";
			strJScript			+= "}\n";
			strJScript			+= "else{\n";
			strJScript			+= "dataForm." + UserPassword.ClientID + ".value = '';\n";
			strJScript			+= "}\n";
			strJScript			+= "}\n";
			strJScript			+= "//--></SCRIPT>";
			
			Page.RegisterStartupScript("xyz", strJScript);
			
			if(Page.IsPostBack)
			{
			
				//check if form is submitted from select box or to update password	
				if(Request.Form["SelectSubmitted"] != null && Request.Form["SelectSubmitted"].Equals("true")) 
				{
					FormTable.Visible = true;
					
					RandomPasswordHolder.Value = PageUtil.GenPassword(6);
					UserPassword.Value = RandomPasswordHolder.Value;
					PswdType.Attributes.Add("onClick", "setPassword();");

					SelectSubmitted.Value = "false";
				}
				
			}
			else
			{
				this.SetUserDropDown();
			}


            if (UseLDAP)
            {
                Passwordvalidator.Enabled = false;
                UseLDAPRow.Visible = true;
                UserPassword.Attributes["class"] = "LDAPGray";
            }
		}

		protected void UpdateButtonClick(object sender, CommandEventArgs e)
		{
			if(Request.Form["UserPassword"] != null && !Request.Form["UserPassword"].Equals("") && Request.Form["SelectSubmitted"].Equals("false"))
			{
				//update password
				if(ValidateUserPassword(Request.Form["UserPassword"]))
				{
					int userId = int.Parse(Request.Form["SelectUserName"]);
					string pswd = Request.Form["UserPassword"];

					string hashedPassword = FormsAuthentication.HashPasswordForStoringInConfigFile(pswd, "MD5");
					Caisis.Security.SecurityController sc = new Caisis.Security.SecurityController();
					UserDa da = new UserDa();
					da.UpdateUserPassword(userId, hashedPassword, sc.GetUserName());
                    // no need to email user if using ldap
                    if (UseLDAP)
                    {
                        valMsg.Text = "User Password has been updated.<br /> <a href=\"AdminUpdatePassword.aspx\">Update Another User?</a>";
                    }
                    else
                    {
                        valMsg.Text = "User Password has been updated. Would like to email it to them? <a href=\"AdminEmailUser.aspx?userId=" + userId + "&pswd=" + pswd + "\">Yes</a>&nbsp;&nbsp;&nbsp;<a href=\"AdminUpdatePassword.aspx\">No</a>";
                    }
				}
			}
		}

		protected void CancelButtonClick(object sender, CommandEventArgs e)
		{
			UserPassword.Value = "";
			SelectSubmitted.Value = "";
			this.Page_Load(sender, e);
		}

		protected bool ValidateUserPassword(string userPassword)
		{
			return true;
		}

		protected void SetUserDropDown()
		{
			
			UserDa das = new UserDa();
			DataSet ds = das.GetUsers();
			SelectUserName.DataSource		= ds.Tables[0].DefaultView;
			SelectUserName.DataValueField	= "UserId";
			SelectUserName.DataTextField	= "UserFullName";
			SelectUserName.DataBind();
			SelectUserName.Items.Insert(0,new ListItem(""));
		}
	}
}
