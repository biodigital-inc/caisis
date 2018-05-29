namespace Caisis.UI.Modules.All.Eforms
{
	using System;
	using System.Data;
	using System.Drawing;
	using System.Web;
	using System.Web.UI.WebControls;
	using System.Web.UI.HtmlControls;

	using Caisis.BOL;
	using Caisis.UI.Core.Classes;
    //2.0 	using Caisis.UI.Modules.Prostate.PaperForms;
	using Caisis.DataAccess;

	/// <summary>
	///		Summary description for MedicationsClinical.
	/// </summary>
	public partial class ReferringMD : BaseEFormControl
	{



		override protected void Page_Load(object sender, System.EventArgs e)
		{
			base.Page_Load(sender, e);

			BuildReferringMD();
		}



		override protected void BuildReferringMD()
		{
			PatientPhysicianDa rmdDa = new PatientPhysicianDa();
			DataSet rmdDs = rmdDa.FormGetReferringMDs(this._patientId, this._eformName, "Dynamic");
			if (rmdDs.Tables.Count > 0 && !rmdDs.Tables[0].Rows.Count.Equals(0))
			{
				ReferringMD.DataSource = rmdDs.Tables[0].DefaultView;
				ReferringMD.DataBind();
			}
		}




	}
}
