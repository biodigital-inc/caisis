using System;
using System.Data;
using System.Collections;
using System.Collections.Generic;
using System.Configuration;
using System.DirectoryServices;

using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;

using System.Data.SqlClient;
using System.Web.Security;

using Caisis.DataAccess;
using Caisis.BOL;

using Caisis.UI.Core.Classes;

namespace Caisis.UI.Admin
{
    /// <summary>
    /// Summary description for AdminPageAddUser.
    /// 
    /// Need to add validation to check for unique email address
    /// </summary>
    public partial class AdminAddUser : AdminBasePage
    {

        override protected void Page_Load(object sender, System.EventArgs e)
        {
            if (Request.QueryString["inquireAboutRoles"] != null && Request.QueryString["userId"].Length > 0)
            {
                AddUserTable.Visible = false;

                valMsg.Text = "\n\nWould you like to add this user to a group? <a href=\"AdminUserToGroup.aspx?userId=" + Request.QueryString["userId"] + "&newUser=yes\">Yes</a>&nbsp;&nbsp;&nbsp;<a href=\"AdminAddUser.aspx\">No</a>";
            }
            else
            {
                base.Page_Load(sender, e);
                RandomPasswordHolder.Value = PageUtil.GenPassword(6);
            }

            // display the ldap search button only if we can successfully connect to LDAP
            if (CaisisConfiguration.PingLDAP())
            {
                SearchLdapButton.Visible = true;
            }
            bool useLDAP = CaisisConfiguration.UseLDAP();
            if (useLDAP)
            {
                PasswordValidator.Enabled = false;
                UseLDAPRow.Visible = true;
                UserPassword.Attributes["class"] = "LDAPGray";
            }

        }


        protected void SubmitButtonClick(object sender, CommandEventArgs e)
        {
            if (ValidateUser())
            {
                // validate the no using LDAP, else supress password
                string pswd = Request.Form["UserPassword"];
                string hashedPassword = FormsAuthentication.HashPasswordForStoringInConfigFile(pswd, "MD5");

                User u = new User();

                u[BOL.User.UserFirstName] = UserFirstName.Value;
                u[BOL.User.UserLastName] = UserLastName.Value;
                u[BOL.User.UserName] = UserName.Value;
                u[BOL.User.UserPassword] = hashedPassword;
                u[BOL.User.UserEmail] = UserEmail.Value;
                u[BOL.User.UserEmployeeId] = UserEmployeeId.Value;
                u.Save();

                int userId = -1;

                if (int.TryParse(u[BOL.User.UserId].ToString(), out userId))
                {
                    AddUserTable.Visible = false;
                    if (!UserFirstName.Value.Equals("") && !UserLastName.Value.Equals(""))
                    {
                        valMsg.Text = UserFirstName.Value + " " + UserLastName.Value + " has been added to the database.<br><br>";
                    }
                    else
                    {
                        valMsg.Text = "User has been added to the database.<br><br>";
                    }

                    valMsg.Text += "Would like to email them their account information? <a href=\"AdminEmailUser.aspx?userId=" + userId + "&pswd=" + (CaisisConfiguration.UseLDAP() ? string.Empty : pswd) + "&newUser=yes\">Yes</a>&nbsp;&nbsp;&nbsp;<a href=\"AdminAddUser.aspx?userId=" + userId + "&inquireAboutRoles=yes\">No</a>";
                }

                # region pre v 5.0 logic
                /*
                UserDa userDa = new UserDa();
                Caisis.Security.SecurityController sc = new Caisis.Security.SecurityController();
                int userId = userDa.InsertUserRecord(UserName.Value, hashedPassword, UserFirstName.Value, UserLastName.Value, UserEmail.Value, sc.GetUserName());
                //int userId = InsertUser(hashedPassword);

                if (userId != -1)
                {
                    AddUserTable.Visible = false;
                    if (!UserFirstName.Value.Equals("") && !UserLastName.Value.Equals(""))
                    {
                        valMsg.Text = UserFirstName.Value + " " + UserLastName.Value + " has been added to the database.<br><br>";
                    }
                    else
                    {
                        valMsg.Text = "User has been added to the database.<br><br>";
                    }
                    valMsg.Text += "Would like to email them their account information? <a href=\"AdminEmailUser.aspx?userId=" + userId + "&pswd=" + pswd + "&newUser=yes\">Yes</a>&nbsp;&nbsp;&nbsp;<a href=\"AdminAddUser.aspx?userId=" + userId + "&inquireAboutRoles=yes\">No</a>";
                }
                */
                # endregion 
            }
        }

        protected void CancelButtonClick(object sender, CommandEventArgs e)
        {
            UserPassword.Value = "";
            UserName.Value = "";
            UserLastName.Value = "";
            UserFirstName.Value = "";
            UserEmployeeId.Value = "";
            UserEmail.Value = "";
            this.Page_Load(sender, e);
        }

        protected bool ValidateUser()
        {
            UserDa uDa = new UserDa();
            DataSet ds = uDa.GetByUserName(UserName.Value);

            int count = ds.Tables[0].Rows.Count;

            if (count > 0)
            {
                string name = ds.Tables[0].Rows[0]["UserName"].ToString();
                string fname = ds.Tables[0].Rows[0]["UserFirstName"].ToString();
                string lname = ds.Tables[0].Rows[0]["UserLastName"].ToString();

                valMsg.Text = "** Invalid entry: username " + name + " is already being used by: " + fname + " " + lname + "";

                return false;
            }
            else
            {
                return true;
            }
		}
	}
}
