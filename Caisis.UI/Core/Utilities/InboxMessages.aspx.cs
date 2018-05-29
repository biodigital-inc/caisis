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
using System.Configuration;

using Caisis.DataAccess;
using Caisis.BOL;
using Caisis.Controller;
using Caisis.Security;
using Caisis.UI.Core.Classes;
//2.0 using Caisis.UI.Core.Eforms;

namespace Caisis.UI.Core.Utilities
{
	/// <summary>
	/// Displays messages based on match of logged in user and user id stored in the eforms table, and the status of the eforms.
	/// </summary>
	public partial class InboxMessages : BasePage
	{


		protected Literal inboxMessage;

		override protected void Page_Load(object sender, System.EventArgs e)
		{
			
			string userName = new SecurityController().GetUserName();

			UserDa uda	= new UserDa();
			DataSet uDs = uda.GetByUserName(userName);

			int userId = int.Parse(uDs.Tables[0].Rows[0]["UserId"].ToString());

			string msgType = "";
			if(Request.QueryString["msgStatus"] != null && Request.QueryString["msgStatus"].Length > 0)
			{
				msgType = "'" + Request.QueryString["msgStatus"] + "'"; 
			}
			else
			{
				msgType =  "'" + EformStatusManager.Status_DataEntryInProgress 
					+ "','" + EformStatusManager.Status_DataEntryComplete
					+ "','" + EformStatusManager.Status_Narrated 
					+ "'";
			}

			PopulateInbox(userId, msgType);
			

		}

		/// <summary>
		/// Binds messages to Inbox repeater
		/// </summary>
		/// <param name="userId">logged in user</param>
		/// <param name="msgType">type of message to dislay</param>
		private void PopulateInbox(int userId, string msgType)
		{
			EFormsDa iDa = new EFormsDa();
			
			DataSet iDs = iDa.GetEformsInbox(userId, msgType);
				
			if (iDs != null && iDs.Tables.Count > 0 && iDs.Tables[0].Rows.Count > 0)
			{
				rptInbox.DataSource = iDs.Tables[0].DefaultView;
				rptInbox.DataBind();

				InboxMessagesBody.Attributes.Add("onload", "top.TaskContainer.setNumMessages('" + iDs.Tables[0].Rows.Count + "')");
			}
		}

		protected void rptItemCreated(Object sender, RepeaterItemEventArgs e)
		{

			// create a reference to the current tr
			System.Web.UI.HtmlControls.HtmlContainerControl listRow;
			listRow= (System.Web.UI.HtmlControls.HtmlContainerControl) e.Item.FindControl("listRow");

			Literal inboxMessage;
			inboxMessage = (Literal) e.Item.FindControl("inboxMessage");
			//Please complete and approve <%# ((System.Data.DataRowView)Container.DataItem)["EFormName"]%> for <%# ((System.Data.DataRowView)Container.DataItem)["PtFirstName"]%> <%# ((System.Data.DataRowView)Container.DataItem)["PtLastName"]%> (MRN <%# ((System.Data.DataRowView)Container.DataItem)["PtMrn"]%>; DOB <%# ((System.Data.DataRowView)Container.DataItem)["PtBirthDateText"]%>)

			// if the patient ID for this row is empty, clicking the row will cause a javascript alert.
			if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
			{
				string eformId		  = ((DataRowView) e.Item.DataItem )[EForm.EFormId].ToString();
				string localPatientId = ((DataRowView) e.Item.DataItem )[EForm.PatientId].ToString();
				string eformName	  = ((DataRowView) e.Item.DataItem )[EForm.EFormName].ToString();
				string status		  = ((DataRowView) e.Item.DataItem )[EForm.CurrentStatus].ToString();
				string ptName		  = ((DataRowView) e.Item.DataItem )[Patient.PtFirstName].ToString() + " " + ((DataRowView) e.Item.DataItem )[Patient.PtLastName].ToString();
				string ptMrn		  = ((DataRowView) e.Item.DataItem )[Patient.PtMRN].ToString();
				
				if (localPatientId != "" && eformName != "")
				{
					string urlVars = "eform=" + Server.UrlEncode(eformName) + "&status=" + status + "&epid=" + CustomCryptoHelper.Encrypt(localPatientId) + "&eformid=" + eformId + "";

					listRow.Attributes.Add("onClick","top.location='../Eforms/Index.aspx?"+urlVars+"';");
				}

				if(status.Equals(EformStatusManager.Status_DataEntryInProgress))
				{
					inboxMessage.Text = "Please complete, review and approve " + eformName + " for " + ptName + " (MRN " + ptMrn + ") "; 
				}
				else if(status.Equals(EformStatusManager.Status_DataEntryComplete))
				{
					inboxMessage.Text = "Please review and approve " + eformName + " for " + ptName + " (MRN " + ptMrn + ") "; 
				}
				 else if(status.Equals(EformStatusManager.Status_Narrated))
				{
					inboxMessage.Text = "Please approve " + eformName + " for " + ptName + " (MRN " + ptMrn + ") "; 
				}
				else if(status.Equals(EformStatusManager.Status_Approved))
				{
					inboxMessage.Text = "This eform is no longer editable, but please click to view the approved " + eformName + " for " + ptName + " (MRN " + ptMrn + ")"; 
				}
				else
				{
					inboxMessage.Text = "Please click to view " + eformName + " for " + ptName + " (MRN " + ptMrn + ") ";
				}
			}
		}
	}
}
