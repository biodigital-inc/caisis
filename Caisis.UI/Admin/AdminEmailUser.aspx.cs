using System;
using System.Data;
using System.Configuration;

using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;

using Caisis.DataAccess;
using Caisis.UI.Core.Classes;

namespace Caisis.UI.Admin
{
    /// <summary>
    /// Summary description for AdminEmailUserPassword.
    /// </summary>
    public partial class AdminEmailUser : AdminBasePage
    {
        protected string emailAddress;
        protected string userName;
        protected string userLast;
        protected string userFirst;
        protected int userId;

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

        private string EncPassword
        {
            get
            {
                return Request.QueryString["encpswd"];
            }
        }

        protected override void Page_Load(object sender, System.EventArgs e)
        {
            base.Page_Load(sender, e);

            if (!string.IsNullOrEmpty(Request.QueryString["userId"]))
            {
                //admin is coming from update password or just added new user.. populate send email fieds with new password info
                userId = int.Parse(Request.QueryString["userId"]);
                string pswd = Request.QueryString["pswd"];
                if (!string.IsNullOrEmpty(EncPassword))
                {
                    pswd = Security.CustomCryptoHelper.Decrypt(EncPassword);
                }

                UserDa user = new UserDa();
                DataSet ds = user.GetByUserId(userId);

                //populate to address
                if (ds.Tables[0].Rows.Count > 0)
                {
                    emailAddress = ds.Tables[0].Rows[0]["UserEmail"].ToString();
                    userName = ds.Tables[0].Rows[0]["UserName"].ToString();
                    userLast = ds.Tables[0].Rows[0]["UserLastName"].ToString();
                    userFirst = ds.Tables[0].Rows[0]["UserFirstName"].ToString();

                    if (!string.IsNullOrEmpty(emailAddress))
                    {
                        txtTo.Text = emailAddress;
                    }
                }

                // Default Admin Mail Address
                MailManager m = new MailManager();
                txtFrom.Text = m.AdminEmailAddress;

                if (Request.QueryString["newUser"] != null && Request.QueryString["newUser"].Equals("yes"))
                {
                    newUserBool.Value = bool.TrueString;
                    //new user default message
                    txtSubject.Text = "Caisis Account Information";
                    txtContent.Value = userFirst + " " + userLast + ",\n\nYour new Caisis account has been created by a system administrator. You may now use the information below to login to the system.\n\n";
                    txtContent.Value += "UserName:  " + userName + "\n";

                    // if using LDAP
                    if (UseLDAP)
                    {
                        txtContent.Value+= "Password:  Log in using your network (Windows) password.";
                    }
                    // otherwise, normal auth
                    else
                    {
                        txtContent.Value += "Password:  " + pswd + "\n\n";
                        txtContent.Value += "Please update this password on your first use of the system.  You may do this by clicking the \"Change Your Password\" button on the login page.";
                    }

                }
                else
                {
                    // only notify about valid password updates
                    if (!string.IsNullOrEmpty(pswd))
                    {
                        txtSubject.Text = "Password Update";
                        txtContent.Value = userFirst + " " + userLast + ",\n\nYour Caisis password has been updated by a system administrator.\n\nYour new password is:  " + pswd + "\n\n";
                        txtContent.Value += "Please update this password on your next use of the system.  You may do this by clicking the \"Change Your Password\" button on the login page.";
                    }
                }
                // append sent date to existing content
                if (!string.IsNullOrEmpty(txtSubject.Text))
                {
                    txtContent.Value += "\n\n\nThe Caisis Team";
                    txtContent.Value += "\n\nMessage Sent:  " + System.DateTime.Now.ToShortDateString() + " " + System.DateTime.Now.ToShortTimeString();
                }
            }
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void SendButtonClick(object sender, EventArgs e)
        {
            MailManager mailer = new MailManager();
            mailer.SendEmail(txtFrom.Text, txtFrom.Text, txtTo.Text, txtBcc.Text, txtSubject.Text, txtContent.Value);

            // Hide main Panel
            EmailUserPanel.Visible = false;

            // Determine is new user added or sending normal email
            if (newUserBool.Value.Equals(bool.TrueString) && !string.IsNullOrEmpty(userId.ToString()))
            {
                MessageNewUser.Visible = true;
            }
            else
            {
                MessageNormalUser.Visible = true;
            }
        }
    }
}
