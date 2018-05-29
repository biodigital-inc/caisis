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
    ///		Summary description for DiseaseState_ActiveSurveillance.
	/// </summary>
    public partial class DiseaseState_ActiveSurveillance : BaseEFormControl
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


	}
}
