namespace Caisis.UI.Modules.Prostate.Eforms
{
	using System;
	using System.Data;
	using System.Drawing;
	using System.Web;
	using System.Web.UI.WebControls;
	using System.Web.UI.HtmlControls;

	using Caisis.BOL;
	using Caisis.UI.Core.Classes;
	using Caisis.UI.Core.Classes.CustomControls;
    //2.0 	using Caisis.UI.Modules.Prostate.PaperForms;
	using Caisis.DataAccess;


	/// <summary>
	///		Summary description for ProstateHPI.
	/// </summary>
	public partial class DiseaseState : BaseEFormControl
	{


		override protected void Page_Load(object sender, System.EventArgs e)
		{
			base.Page_Load(sender, e);
			ShowLastStatus();
//			SetClinicDateOnStatusClick();
		}

		/// <summary>
		/// Displays the patients last status
		/// </summary>
		protected void ShowLastStatus()
		{

			string status = GetLastStatus(this._patientId, this._eformName, "Dynamic");
			if (status.Length > 0)
			{
				LastStatus.Text = status + "<br/><br/>";
			}
		}

		/// <summary>
		/// Defaults status date to clinic date when user selects a status
		/// </summary>
		protected void SetClinicDateOnStatusClick()
		{
			
			string	jsscript = "<script>function setStatusDate(){";
	
			if(Session[SessionKey.CurrentClinicDate] != null && Session[SessionKey.CurrentClinicDate].ToString().Length > 0)
			{
				string clinDate = Session[SessionKey.CurrentClinicDate].ToString();
				jsscript += "if(document.getElementById('" + StatusDateText.ClientID + "').value == ''){";
				jsscript += "document.getElementById('" + StatusDateText.ClientID + "').value = '" + clinDate + 
					"'; UpdateAssociatedDate(document.getElementById('" + StatusDateText.ClientID + "'))}";
			}	
			
			jsscript += "}</script>";

			Page.RegisterClientScriptBlock("xyz", jsscript);
		}
	}
}
