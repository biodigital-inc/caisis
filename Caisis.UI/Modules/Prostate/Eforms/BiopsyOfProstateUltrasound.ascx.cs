namespace Caisis.UI.Modules.Prostate.Eforms
{
    using System;
    using System.Data;
    using System.Linq;
    using System.Collections;
    using System.Collections.Generic;
    using System.Drawing;
    using System.Web;
    using System.Web.UI.WebControls;
    using System.Web.UI.HtmlControls;

    using Caisis.BOL;
    using Caisis.UI.Core.Classes;
    using Caisis.DataAccess;

	/// <summary>
    ///		Summary description for BiopsyOfProstateUltrasound.
	/// </summary>
    public partial class BiopsyOfProstateUltrasound : BaseEFormControl
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
            dv.RowFilter = Diagnostic.DxType + " IN ('TRUS', 'MRUS')";

            if (dv.Count > 0)
            {
                NoImagesMsg.Visible = false;
                images.DataSource = dv;
                images.DataBind();
            }

        }

        override protected void EFormRepeaterOnDataBound(Object Sender, RepeaterItemEventArgs e)
        {

            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                DataRowView drv = e.Item.DataItem as DataRowView;

                if (drv[Diagnostic.DiagnosticId] != null && !string.IsNullOrEmpty(drv[Diagnostic.DiagnosticId].ToString()))
                {
                    IEnumerable<IBusinessObject> c = BusinessObject.GetByParent("DxImageProstate", (int)drv[Diagnostic.DiagnosticId]);

                    if (c != null && c.Count<IBusinessObject>() > 0)
                    {
                        string volume = c.First<IBusinessObject>()[BOL.ImageProstate.ImgProstateVolume].ToString();
                        if (volume.Length > 0)
                        {
                            Literal Volume = (Literal)e.Item.FindControl("Volume");
                            Volume.Text = volume;
                        }

                    }


                }

            }

            // the base class handles the lock icon
            base.EFormRepeaterOnDataBound(Sender, e);
        }



	}
}
