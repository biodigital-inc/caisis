namespace Caisis.UI.Modules.Gynecology.Eforms
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
    ///		Summary description for ClinicalStageGTD.
	/// </summary>
    public partial class ClinicalStageGTD : BaseEFormControl
	{


		override protected void Page_Load(object sender, System.EventArgs e)
		{
			base.Page_Load(sender, e);
            BuildClinicalStages(this._patientId);
            base.SetTitle(ComponentTitle);
		}

        protected void BuildClinicalStages(int PatientID)
        {
            ClinicalStageDa clinicalstageDa = new ClinicalStageDa();
            DataTable clinicalstageDs = clinicalstageDa.FormGetRecords(PatientID);

            DataView dv = clinicalstageDs.DefaultView;
//            dv.RowFilter = BOL.ClinicalStage.ClinStageDisease + "=Prostate";

            if (dv.Count > 0)
            {
                clinicalStages.DataSource = dv;
                clinicalStages.DataBind();
            }
        }


	}
}
