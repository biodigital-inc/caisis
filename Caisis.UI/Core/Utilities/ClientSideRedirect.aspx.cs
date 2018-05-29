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

using Caisis.UI.Core.Classes;

namespace Caisis.UI.Core.Utilities
{
	/// <summary>
	/// ClientSideRedirect is called when session expires from a Response.Redirect or a Server.Transer method. 
	/// 
	/// ClientSideRedirect relocates users to the login page using javascript to ensure the login page occupies the parent frame. 
	///
	/// </summary>
	public partial class ClientSideRedirect : System.Web.UI.Page
	{
		protected void Page_Load(object sender, System.EventArgs e)
		{

			try
			{
				// fix made 7/19/05, added to 3.0 release
				string _redirectto = HttpContext.Current.Request.ApplicationPath + "/Login.aspx";
				
				if (Request.QueryString["to"] != null)  
				{
					_redirectto = Request.QueryString["to"]+".aspx";
				}
				//user should be redirected to PatientLists from PatientData because there is no patient id in session and a dataset is defined
				else if (Session[SessionKey.DatasetId] != null && Session[SessionKey.DatasetId].ToString().Length > 0)
				{
					//from url variable set in DataEntryContainer OnInit() when a patientID is undefined
					if (Request.QueryString["from"] != null && (Request.QueryString["from"].IndexOf("PatientData") > -1 || Request.QueryString["from"].IndexOf("Forms") > -1))  
					{
						// updated 3/7/06 fs
						_redirectto = HttpContext.Current.Request.ApplicationPath + "/Core/PatientLists/PatientListPage.aspx?patientSession=false";
				
					}
					
				}

				// Form the script to be registered at client side.
				String scriptString = "<script type=\"text/javascript\"> function Redirect() {";
				scriptString += "parent.location='"+ _redirectto+"';}";
				scriptString += "</script>";

				this.RegisterStartupScript("Startup", scriptString);
			}
			catch(Exception ex)
			{
				throw new System.Exception(ex.Message);
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