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
	///		Summary description for MedicationsClinical.
	/// </summary>
    public partial class GUProstateImaging : BaseEFormControl
	{


		override protected void Page_Load(object sender, System.EventArgs e)
		{
			base.Page_Load(sender, e);
            BuildGUEFormImages(this._patientId, "GUProsFU", "Dynamic");
            base.SetTitle(ComponentTitle);
		}


        protected void BuildGUEFormImages(int PatientID, string FormName, string FormType)
        {
            DiagnosticDa imagesDa = new DiagnosticDa();
            DataSet imagesDs = imagesDa.FormGetDxImages(PatientID, FormName, FormType);

            if (imagesDs.Tables.Count > 0 && imagesDs.Tables[0].Rows.Count > 0)
            {
                images.DataSource = imagesDs.Tables[0].DefaultView;
                images.DataBind();
            }
        }


        override protected void EFormRepeaterOnDataBound(Object Sender, RepeaterItemEventArgs e)
        {
            base.EFormRepeaterOnDataBound(Sender, e);

            Literal NotesDisplay;
			NotesDisplay = (Literal) e.Item.FindControl("NotesDisplay");

            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                DataRowView drv = e.Item.DataItem as DataRowView;

                if (drv != null && drv[BOL.Diagnostic.DxNotes].ToString().Length > 100)
                {
                    NotesDisplay.Text = drv[BOL.Diagnostic.DxNotes].ToString().Remove(100) + "...";
                }
                else { NotesDisplay.Text = drv[BOL.Diagnostic.DxNotes].ToString(); }
            }
        }


	}
}
