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
    //2.0 	using Caisis.UI.Modules.Prostate.PaperForms;
	using Caisis.DataAccess;

	/// <summary>
    ///		Summary description for MRIHistory_Prostate.
	/// </summary>
    public partial class MRIHistory_Prostate : BaseEFormControl
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
            DataTable imagesDt = imagesDa.GetProstateMRIFindings(this._patientId);

            if (imagesDt.Rows.Count > 0)
            {
                images.DataSource = imagesDt.DefaultView;
                images.DataBind();
            }


        }

        protected void AddExtentionAndInvasion(Object Sender, RepeaterItemEventArgs e)
        {

            if ((e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem) && e.Item.DataItem != null)
            {

                DataRowView record = ((DataRowView)e.Item.DataItem);

                string site = record[BOL.ImageFinding.ImgFindSite].ToString().ToUpper();

                if (site.Equals("SEMINAL VESICLE"))
                {
                    Label SVI = (Label)e.Item.FindControl("SVI");
                    SVI.Text = record[BOL.Diagnostic.DxResult].ToString();
                }
                else if (site.Equals("EXTRACAPSULAR"))
                {
                    Label ECE = (Label)e.Item.FindControl("ECE");
                    ECE.Text = record[BOL.Diagnostic.DxResult].ToString();
                }
                else if (site.Equals("LYMPH NODES"))
                {
                    Label LNI = (Label)e.Item.FindControl("LNI");
                    LNI.Text = record[BOL.Diagnostic.DxResult].ToString();
                }


            }
        }


	}
}
