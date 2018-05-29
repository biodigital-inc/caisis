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

using Caisis.DataAccess;
using Caisis.UI.Core.Classes;

using System.Net.Mail;
using System.Configuration;

namespace Caisis.UI.Core.Utilities
{
    /// <summary>
    /// Summary description for ForgotPassword.
    /// </summary>
    public partial class ForgotPassword : System.Web.UI.Page
    {

        protected void Page_Load(object sender, System.EventArgs e)
        {
            //rGen = new Random();

            FormTable.Visible = true;
            SentTable.Visible = false;

            if (Page.IsPostBack)
            {

                if (Request.Form["userName"] != null && Request.Form["userName"].ToString().Length > 0)
                {
                    FormTable.Visible = false;
                    SentTable.Visible = true;

                    //take username and get password
                    UserDa da = new UserDa();
                    DataSet ds = da.GetByUserName(userName.Value);


                    if (ds.Tables[0].Rows.Count > 0)
                    {
                        string userStatus = da.GetUserStatus(userName.Value);
                        if (userStatus.Equals("Valid"))
                        {
                            string userEmail = ds.Tables[0].Rows[0]["UserEmail"].ToString();
                            string userFirstName = ds.Tables[0].Rows[0]["UserFirstName"].ToString();
                            string userLastName = ds.Tables[0].Rows[0]["UserLastName"].ToString();

                            //set new password in database
                            string newPassword = this.SetRandomPassword(userEmail);

                            if (!newPassword.Equals("false"))
                            {
                                //email new random password
                                this.EmailNewPassword(userEmail, userFirstName, userLastName, newPassword);

                                emailMessage.Text = "An email with a new password has been sent to " + userEmail + ".\n\n<br>Please update this password on first login. Thank you.";
                            }
                            else
                            {
                                //update of password failed
                                emailMessage.Text = "There was a problem updating your password. Please contact " + CaisisConfiguration.GetWebConfigValue("adminEmail") + " to request a new password.";
                            }
                        }
                        else if (userStatus.Equals("InvalidDeactivated"))
                        {
                            //Deactivated user
                            emailMessage.Text = "User has been deactivated. Please contact " + CaisisConfiguration.GetWebConfigValue("adminEmail") + ".";
                        }
                        else
                        {
                            //InvalidUnknown. InvalidUsername should never get here because of 'if(ds.Tables[0].Rows.Count > 0)' above.
                            emailMessage.Text = "There was an unknown problem updating your password. Please contact " + CaisisConfiguration.GetWebConfigValue("adminEmail") + " to request a new password.";
                        }

                    }
                    else
                    {

                        emailMessage.Text = "The username you entered does not have an email address on file. Please contact the Administrator to obtain a new password.";
                    }

                    ValidationMsg.Visible = false;
                }
                else
                {
                    ValidationMsg.InnerText = "You must enter your username to request a new password.";
                }

            }
        }

        private void EmailNewPassword(string emailAddress, string userFirstName, string userLastName, string newPassword)
        {
            MailManager mailer = new MailManager();

            string subject = "New Password Request";
            string body = "\nDear " + userFirstName + " " + userLastName + ",\n\n";
            body += "You are receiving this message in response to a request for a new password to the Caisis system.\n\n";
            body += "Your password has been updated to:  " + newPassword + "\n\nPlease update this password the next time you log in to the system.\n";
            body += "If you did not request a new password, or if you have any other problems with the system, please contact a system administrator at " + mailer.AdminEmailAddress + " and we will contact you as soon as possible.\n\n\nThank you,\nThe Caisis Team";
            
            mailer.SendEmailFromAdmin(emailAddress, string.Empty, subject, body);
        }

        private string SetRandomPassword(string emailAddress)
        {
            string newPassword = PageUtil.GenPassword(6);

            string newHashedPswd = FormsAuthentication.HashPasswordForStoringInConfigFile(newPassword, "MD5");

            UserDa da = new UserDa();

            bool success = da.UpdateForgotPassword(emailAddress, newHashedPswd, "Forgot Password Page");

            if (success)
                return newPassword;
            else
                return "false";
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
