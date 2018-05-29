using System;
using System.Data;
using System.Web;
using System.Web.SessionState;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;

using System.Net.Mail;
using System.Configuration;

using Caisis.DataAccess;
using Caisis.Security;

using Caisis.UI.Core.Classes;

namespace Caisis.UI.Core.Utilities
{
	/// <summary>
	/// Summary description for EmailAdmin.
	/// </summary>
	public partial class EmailAdmin : System.Web.UI.Page
	{
		protected System.Web.UI.WebControls.Label lblStatus;



		protected void Page_Load(object sender, System.EventArgs e)
		{



			txtTo.ReadOnly			 = true;
			MailForm.Visible		 = true;
			sentMessageTable.Visible = false;
			
			if(Page.IsPostBack)
			{
				if (txtFrom.Text != null && txtFrom.Text.Length > 0)
				{
					this.btnSend_Click(sender, e);
				
					MailForm.Visible		 = false;
					sentMessageTable.Visible = true;
				}
/*				else
				{
					ErrorMsg.Text = "Please enter a valid email address in the 'from' field.";
				}
*/
			}
			else
			{


				//
				if (Request.QueryString["userError"] != null && Request.QueryString["userError"].Length > 0 && Request.QueryString["userError"] == "true")
				{
					txtSubject.Text = "Caisis Error Report";
				}

				UserDa user = new UserDa();
				DataSet ds = user.GetByUserName(User.Identity.Name);

				//populate from address
				if(ds.Tables[0].Rows.Count > 0)
				{
					string emailAddress = ds.Tables[0].Rows[0]["UserEmail"].ToString();
					fromFName.Value = ds.Tables[0].Rows[0]["UserFirstName"].ToString();
					fromLName.Value = ds.Tables[0].Rows[0]["UserLastName"].ToString();
					fromUName.Value = ds.Tables[0].Rows[0]["UserName"].ToString();
					if(emailAddress != null && !emailAddress.Equals(""))
					{
						txtFrom.Text = emailAddress;
						txtFrom.ReadOnly = true;
					}
				}

                txtTo.Text = CaisisConfiguration.GetWebConfigValue("adminEmail");
			}
		}

		private void btnSend_Click(object sender, System.EventArgs e)
		{
			string fromName = "No user was logged into Caisis at the time this message was sent.";
			if (fromLName.Value != null && fromLName.Value.ToString().Length > 0)
			{
				fromName = fromFName.Value + " " + fromLName.Value + " (" + fromUName.Value + ")";
			}

			string lastDataFormViewed;
			if (Session[SessionKey.CurrentPage] != null && Session[SessionKey.CurrentPage].ToString().Length > 0)
			{
				lastDataFormViewed = Session[SessionKey.CurrentPage].ToString();
			}
			else
			{
				lastDataFormViewed = "None";
			}

			string userBrowser = Request.Browser.Type.ToString() + " (" + Request.Browser.Version.ToString() + ")";
			string userPlatform = Request.Browser.Platform.ToString();
			string userJavascript = Request.Browser.JavaScript.ToString();
			string userIpAddress = Request.UserHostAddress.ToString();

			string serverMachineName = Server.MachineName;
			string userAuthenticated = Request.IsAuthenticated.ToString();

			string screenResolution = "Unknown";
			if (Request.Form["screenResolution"] != null && Request.Form["screenResolution"].Length > 0)
			{
				screenResolution = Request.Form["screenResolution"];
			}

			string colorDepth = "Unknown";
			if (Request.Form["colorDepth"] != null && Request.Form["colorDepth"].Length > 0)
			{
				colorDepth = Request.Form["colorDepth"] + "-bit";
			}

			string userAgent = "No User Agent Strinng Received";
			if (Request.UserAgent != null && Request.UserAgent.Length > 0)
			{
				userAgent = Request.UserAgent;
			}
                                
			MailMessage msg = new MailMessage();
 
			msg.To.Add(new MailAddress(txtTo.Text));
			
			//get user email address from database
			msg.From = new MailAddress(txtFrom.Text);
			msg.Subject = txtSubject.Text;
			msg.Body = "\nThe following message was submitted via the Caisis Help System:\n\n\nDate:   " + System.DateTime.Now.ToShortDateString() + "\nTime:   " + System.DateTime.Now.ToShortTimeString() + "\nFrom:   " + fromName;
//			msg.Body += "\nCurrent Patient in Session:   " + currentPatient;
			msg.Body += "\nLast Data Form Viewed:   " + lastDataFormViewed;

			msg.Body += "\n\n\n" + txtContent.Value;

			msg.Body += "\n\n\nUser Environment ---------------------------------------------";
			//msg.Body += "\nUser Machine Name: " + userMachineName;
			msg.Body += "\nUser IP Address: " + userIpAddress;
			msg.Body += "\nPlatform: " + userPlatform;
			msg.Body += "\nBrowser Type: " + userBrowser;
			msg.Body += "\nUser Agent: " + userAgent;
			msg.Body += "\nJavaScript Enabled: " + userJavascript;
			msg.Body += "\nScreen Resolution: " + screenResolution;
//			msg.Body += "\nBrowser size: " + browserSize;
			msg.Body += "\nColor Depth: " + colorDepth;
			msg.Body += "\nUser Was Logged Into Caisis: " + userAuthenticated;
			msg.Body += "\nServer Machine Name: " + serverMachineName;

            MailManager mailer = new MailManager();
            mailer.SendEmail(msg);                   
		}
	}
}
