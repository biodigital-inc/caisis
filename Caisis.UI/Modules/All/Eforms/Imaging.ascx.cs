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
	public partial class Imaging : BaseEFormControl
	{


		override protected void Page_Load(object sender, System.EventArgs e)
		{
			base.Page_Load(sender, e);
			BuildProstateImages();
            base.SetTitle(ComponentTitle);
		}


        protected void BuildProstateImages()
        {


            DiagnosticDa imagesDa = new DiagnosticDa();
            DataTable imagesDt = imagesDa.GetImagingAll(this._patientId);

            if (imagesDt.Rows.Count > 0)
            {
                images.DataSource = imagesDt.DefaultView;
                images.DataBind();
            }


        }


	}
}
