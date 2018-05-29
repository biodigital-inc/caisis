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

using Caisis.Controller;
using Caisis.UI.Core.Classes;

namespace Caisis.UI.Core.Eforms
{
	/// <summary>
	/// Summary description for EFormDelete.
	/// </summary>
	public partial class EFormDelete : EFormBasePage
	{
		
		protected override void Page_Load(object sender, System.EventArgs e)
		{
			base.Page_Load(sender, e);

			if(!Page.IsPostBack)
			{
				this.SetDefaultConfirmDeleteMsg();
			}

		}

		

		protected void SetDefaultConfirmDeleteMsg()
		{
			string ptName = " for ";

			if (Session[SessionKey.PtFirstName] != null && Session[SessionKey.PtFirstName].ToString().Length > 0)
			{
				ptName += Session[SessionKey.PtFirstName].ToString();
			}
			if (Session[SessionKey.PtLastName] != null && Session[SessionKey.PtLastName].ToString().Length > 0)
			{
				ptName += " " + Session[SessionKey.PtLastName].ToString();
			}
						
			UserMsg.Text = "You are about to delete the ";
						
			UserMsg.Text += base.EFormName;
						
			if(ptName != " for ")
				UserMsg.Text += ptName;

			UserMsg.Text += "<br><br>Would you like to proceed?";

			CancelBtn.Visible = true;

			DeleteBtn.Visible = true;
		}

		protected void DeleteOnBtnClick(object sender, CommandEventArgs e)
		{
			if(base.EFormId > 0)
			{
				EFormController ect = new EFormController();
				
				ect.UpdateEFormStatus(base.EFormId, EformStatusManager.Status_Deleted, base.EFormUserName);

				CancelBtn.Visible = false;

				DeleteBtn.Visible = false;

				UserMsg.Text = "The EForm has been deleted.<br><br>Click <a href=\"EFormList.aspx\">here</a> to select or start another eform from the list of clinic patients.";
			}
		}

		protected void ReturnToEFormOnBtnClick(object sender, CommandEventArgs e)
		{
			Response.Redirect("EditEFormContainer.aspx?eformId=" + base.EFormId + "");
		}
		
		
	}
}
