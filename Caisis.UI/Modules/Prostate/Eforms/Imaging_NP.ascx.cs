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
	using Caisis.DataAccess;

	/// <summary>
    ///		Summary description for Imaging_NP.
	/// </summary>
    public partial class Imaging_NP : BaseEFormControl
	{


		override protected void Page_Load(object sender, System.EventArgs e)
		{
			base.Page_Load(sender, e);
			BuildImaging(this._patientId, this._eformName, "Dynamic");
            base.SetTitle(ComponentTitle);
		}

        protected void BuildImaging(int PatientID, string FormName, string FormType)
        {


            DiagnosticDa imagesDa = new DiagnosticDa();
            DataTable imagesDt = imagesDa.GetImagingAll(PatientID);
            DataView dv = new DataView(imagesDt);
            dv.RowFilter = Diagnostic.DxType + " NOT IN ('TRUS')";

            if (dv.Count > 0)
            {
                images.DataSource = dv;
                images.DataBind();
            }


        }



	}
}
