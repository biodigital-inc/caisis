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


namespace Caisis.UI.Core.PatientLists
{
	/// <summary>
	/// Summary description for PatientListPage1.
	/// </summary>
	public partial class PatientListPage : FramePage
	{



		override protected void Page_Load(object sender, System.EventArgs e)
		{
	
			base.Page_Load(sender, e); //base FramePage handles putting new patients in session


			if (Request.QueryString.HasKeys() && Request.QueryString["selectedPatientDeleted"] != null && Request.QueryString["selectedPatientDeleted"] == "true")
			{
				Page.RegisterClientScriptBlock("selectedPatientDeleted", "<script>alert('The patient you selected was previously deleted from the database.  Please select another patient.');</script>");
			}

			
			if (Request.QueryString.HasKeys() && Request.QueryString["patientSession"] != null && Request.QueryString["patientSession"] == "false")
			{
				patientListContent.Attributes["src"] = "PatListContent.aspx?patientSession=false";
			}

		}

	}
}
