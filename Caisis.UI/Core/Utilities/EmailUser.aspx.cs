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
using Caisis.BOL;

using Caisis.UI.Core.Classes;

namespace Caisis.UI.Core.Utilities
{
	/// <summary>
	/// Summary description for EmailAdmin.
	/// </summary>
	public partial class EmailUser : System.Web.UI.Page
	{
		protected System.Web.UI.WebControls.Label lblStatus;
		protected string toUserName, toUserEmail, toFirstName, toLastName;
		protected bool noToEmail = false;
        protected bool deactivatedToUser = false;
		protected bool toDataFeed = false;



		protected void Page_Load(object sender, System.EventArgs e)
		{

			if (Request.QueryString["toUser"] != null && Request.QueryString["toUser"].ToString() != "")
			{
				toUserName = Request.QueryString["toUser"].ToString();

				// emails regarding datafeed records are sent to the admin
				if (toUserName.ToUpper().StartsWith("DATAFEED"))
				{
                    toUserEmail = CaisisConfiguration.GetWebConfigValue("adminEmail");
					txtTo.Text = "Caisis Administrators";
					txtTo.ReadOnly = true;
					noToEmail = false;
					toDataFeed = true;
				}
				else
				{

					UserDa toUser = new UserDa();
					DataSet toUserDs = toUser.GetByUserName(toUserName);

					//populate to address
					if(toUserDs.Tables[0].Rows.Count > 0)
					{
                        bool activeUser = false;
                        if ((toUserDs.Tables[0].Rows[0][BOL.User.DeactivatedTime] == null) || (toUserDs.Tables[0].Rows[0][BOL.User.DeactivatedTime].ToString().Length < 1))
                        {
                            activeUser = true;
                        }
                        else deactivatedToUser = true;


                        string emailAddress = toUserDs.Tables[0].Rows[0]["UserEmail"].ToString();
						toFirstName = toUserDs.Tables[0].Rows[0]["UserFirstName"].ToString();
						toLastName = toUserDs.Tables[0].Rows[0]["UserLastName"].ToString();


                        if (emailAddress == null || emailAddress.Equals(""))
                        {
                            noToEmail = true;
                        }



                        if (activeUser == true && noToEmail == false)
						{
							toUserEmail = emailAddress;
							txtTo.Text = toFirstName + " " + toLastName + " (email not shown)";
							txtTo.ReadOnly = true;
						}
                        else if (deactivatedToUser)
						{
                            toUserEmail = CaisisConfiguration.GetWebConfigValue("adminEmail");
                            txtTo.Text = "Caisis Administrator";
                            txtTo.ReadOnly = true;
						}
                        else if (noToEmail)// active but no email address
						{
                            toUserEmail = CaisisConfiguration.GetWebConfigValue("adminEmail");
                            txtTo.Text = "Caisis Administrator";
                            txtTo.ReadOnly = true;
						}

					}
					// no user identified
					else
					{
						toUserEmail = CaisisConfiguration.GetWebConfigValue("adminEmail");
						noToEmail = true;
					}
				}
			}

			txtSubject.Text = "Locked Record in Caisis";


			MailForm.Visible		 = true;
			sentMessageTable.Visible = false;
			
			if(Page.IsPostBack)
			{
				this.btnSend_Click(sender, e);
				
				MailForm.Visible		 = false;
				sentMessageTable.Visible = true;
			}
			else
			{
				UserDa user = new UserDa();
				DataSet ds = user.GetByUserName(User.Identity.Name);

				//populate from address
				if(ds.Tables[0].Rows.Count > 0)
				{
					string emailAddress = ds.Tables[0].Rows[0]["UserEmail"].ToString();
					fromFName.Value = ds.Tables[0].Rows[0]["UserFirstName"].ToString();
					fromLName.Value = ds.Tables[0].Rows[0]["UserLastName"].ToString();
					if(emailAddress != null && !emailAddress.Equals(""))
					{
						txtFrom.Text = emailAddress;
						txtFrom.ReadOnly = true;
					}
				}
			}
		}

		private void btnSend_Click(object sender, System.EventArgs e)
		{

			string fromFirstName = fromFName.Value;
			string fromLastName = fromLName.Value;
			string currentPatient = Session[SessionKey.PtFirstName].ToString() + " " + Session[SessionKey.PtLastName].ToString() + "    MRN: " + Session[SessionKey.PtMRN].ToString(); 

			MailMessage msg = new MailMessage();
 
			msg.To.Add(new MailAddress(toUserEmail));
			
			//get user email address from database
			msg.From = new MailAddress(txtFrom.Text);
            msg.Subject = txtSubject.Text;
            if (deactivatedToUser == true)
            {
                msg.Body = "\nThis message was sent to DEACTIVATED USER " + toUserName + " via the Caisis Information System regarding a locked record.  This message has been forwarded to your admin account because this user has been deactivated.";
                if (noToEmail == true)
                {
                    msg.Body += "  The record for this user currently has no email address associated with it.";
                }

                msg.Body += "\n\nDate:   " + System.DateTime.Now.ToShortDateString() + "\nTime:   " + System.DateTime.Now.ToShortTimeString() + "\nFrom:   " + fromFirstName + " " + fromLastName + "\nRegarding Patient:   " + currentPatient;
                msg.Body += "\nPage Being Viewed:   " + Session[SessionKey.CurrentPage].ToString();
                msg.Body += "\n\n\n" + txtContent.Value + "\n\n\nNote: You may respond to the user by replying to this message.";
            }
			else if (noToEmail == true)
			{
				msg.Body = "\nThis message was sent to user " + toUserName + " via the Caisis Information System regarding a locked record.  This message has been forwarded to your admin account because there is no email address on record for this user.";
				msg.Body += "\n\nDate:   " + System.DateTime.Now.ToShortDateString() + "\nTime:   " + System.DateTime.Now.ToShortTimeString() + "\nFrom:   " + fromFirstName + " " + fromLastName + "\nRegarding Patient:   " + currentPatient;
				msg.Body += "\nPage Being Viewed:   " + Session[SessionKey.CurrentPage].ToString();
				msg.Body += "\n\n\n" + txtContent.Value + "\n\n\nNote: You may respond to the user by replying to this message.";
			}
			else if (toDataFeed == true)
			{
				msg.Body = "\nThis message was sent to you via the Caisis Information System regarding a record imported from a Data Feed:";
				msg.Body += "\n\nDate:   " + System.DateTime.Now.ToShortDateString() + "\nTime:   " + System.DateTime.Now.ToShortTimeString() + "\nFrom:   " + fromFirstName + " " + fromLastName + "\nRegarding Patient:   " + currentPatient;
				msg.Body += "\nPage Being Viewed:   " + Session[SessionKey.CurrentPage].ToString();
				msg.Body += "\n\n\n" + txtContent.Value + "\n\n\nNote: You may respond to the user by replying to this message.";
			}
			else
			{
				msg.Body = "\nThis message was sent to you via the Caisis Information System regarding a locked record:";
				msg.Body += "\n\nDate:   " + System.DateTime.Now.ToShortDateString() + "\nTime:   " + System.DateTime.Now.ToShortTimeString() + "\nFrom:   " + fromFirstName + " " + fromLastName + "\nRegarding Patient:   " + currentPatient;
                if (Session[SessionKey.CurrentPage] != null && Session[SessionKey.CurrentPage].ToString().Length > 0)
                {
                    msg.Body += "\nPage Being Viewed:   " + Session[SessionKey.CurrentPage].ToString();
                }
				msg.Body += "\n\n\n" + txtContent.Value + "\n\n\nNote: You may respond to the user by replying to this message.";
			}
			//to add attachments
			//StrFilePath = "c:\\emps.txt"  
			//MailAttachment attach = new MailAttachment(strFilePath);  
			//msg.Attachments.Add(attach);  


            MailManager mailer = new MailManager();
            mailer.SendEmail(msg);
                    
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
