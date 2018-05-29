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


using Caisis.BOL;
using Caisis.Controller;
using Caisis.UI.Core.Classes;

namespace Caisis.UI.Core.Eforms
{
	/// <summary>
	/// Calls EFormReport in IFrame for display only of approved eforms.
	/// </summary>
	public partial class EFormViewer : EFormBasePage
	{


		override protected void Page_Load(object sender, System.EventArgs e)
		{
			if(Request.QueryString["eformId"] != null)
			{
				int _eformId = int.Parse(Request.QueryString["eformId"].ToString());
			
				EFormController ctr = new EFormController();
				DataSet eds = ctr.GetRecord(_eformId);
			
				if(eds.Tables[0].Rows.Count > 0)
				{
					// display report html from database
					if(eds.Tables[0].Rows[0][Caisis.BOL.EForm.EFormReport].ToString().Length > 0)
					{
						theReport.InnerHtml = eds.Tables[0].Rows[0][Caisis.BOL.EForm.EFormReport].ToString();	
					}
				}
			}

			string pageTitle = "";

			if (Session[SessionKey.PtFirstName] != null && Session[SessionKey.PtFirstName].ToString().Length > 0)
			{
				pageTitle += Session[SessionKey.PtFirstName].ToString();
			}
			if (Session[SessionKey.PtLastName] != null && Session[SessionKey.PtLastName].ToString().Length > 0)
			{
				pageTitle += " " + Session[SessionKey.PtLastName].ToString();
			}


			eformTitle.Text = pageTitle + "<br/><br/><br/><br/>";


		}
	}
}
