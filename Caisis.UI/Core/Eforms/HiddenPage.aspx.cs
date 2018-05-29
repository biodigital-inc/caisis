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


using Caisis.DataAccess;
using Caisis.BOL;
using Caisis.Controller;
using Caisis.UI.Core.Classes;

namespace Caisis.UI.Core.Eforms
{
	/// <summary>
	/// HiddenPage is used from hidden frames to perform hidden actions such as checking eform status
	/// </summary>
	public partial class HiddenPage : System.Web.UI.Page
	{
		private int _eformId = 0;

		
		protected void Page_Load(object sender, System.EventArgs e)
		{
			if(Request.QueryString["eformId"]!= null && Request.QueryString["action"] != null)
			{
				_eformId = Convert.ToInt32(Request.QueryString["eformId"].ToString());

				if(_eformId != 0)
				{
					string action = Request.QueryString["action"].ToString();

					if(action.Equals("isapproved"))
					{
						CheckEFormApproval();
					}
					else if(action.Equals("getstatus"))
					{
						GetEFormStatus();
					}
				}
			}
		}

		/// <summary>
		/// when eform has already been approved redirects user to the clinic list
		/// </summary>
		private void CheckEFormApproval()
		{	
			EFormController ect = new EFormController();

			string status = ect.GetEFormStatus(_eformId);

			if(status.Equals(EformStatusManager.Status_Approved))
			{
			
				string approvedBy = "";
				string approvedTime = "";
				string userRealName = "";

				// get the user who approved form and date
				EFormsDa da = new EFormsDa();

				DataSet ds = da.GetEformsRecord(_eformId);

				if(ds.Tables[0].Rows.Count == 1)
				{
					approvedBy = ds.Tables[0].Rows[0][EForm.UpdatedBy].ToString(); 
					approvedTime = ds.Tables[0].Rows[0][EForm.UpdatedTime].ToString(); 

					UserDa userda = new UserDa();
					DataSet userds = userda.GetByUserName(approvedBy);
					
					userRealName = userds.Tables[0].Rows[0]["UserFirstName"].ToString() + " " + userds.Tables[0].Rows[0]["UserLastName"].ToString();
				}

				string jsScript = "<script language=javascript>alert('This eform was approved by " + userRealName + " on " + approvedTime + " and can no longer be updated.\\n\\n You will now be redirected to the clinic list'); top.location.href = 'Index.aspx?status=home';</script>";
			
				Response.Write(jsScript);
			}
			// submit parent frame with data
			else
			{
				// js script from parent page passes in url var when it should submit
				if(Request.QueryString["submitMe"] != null && Request.QueryString["submitMe"].ToString().ToLower().Equals("true"))
				{
					//submitMe()
					string jsScript = "<script language=javascript>parent.submitMe();</script>";
			
					Response.Write(jsScript);
				}
			}

			
		}

		/// <summary>
		/// Get eform status and fire client side script back to calling page
		/// </summary>
		private void GetEFormStatus()
		{	
			EFormController ect = new EFormController();

			string status = ect.GetEFormStatus(_eformId);

			string jsScript = "<script language=javascript>parent.setEFormStatus('" + status + "')</script>";

			Response.Write(jsScript);
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
