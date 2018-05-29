namespace Caisis.UI.Modules.Breast.Eforms
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
    ///		Summary description for ImagingUltrasoundBreast.
	/// </summary>
    public partial class ImagingUltrasoundBreast : BaseEFormControl
	{


        override protected void Page_Load(object sender, System.EventArgs e)
        {
            base.Page_Load(sender, e);
            base.SetTitle(ComponentTitle);

            BuildImagesUltrasound(this._patientId);

            foreach (ListItem BreastUltrasoundli in UltrasoundDone.Items)
            {
                string BreastUltrasoundstr = "showHideBreastUltrasound('" + BreastUltrasoundli.Value + "','" + AbsentDateText_9.ClientID + "','" + System.DateTime.Now.ToShortDateString() + "','" + AbsentDate_9.ClientID + "','" + System.DateTime.Now.ToShortDateString() + "','" + TableName_9.ClientID + "', 'Diagnostics','" + FieldName_9.ClientID + "', 'DxType','" + FieldValue_9.ClientID + "', 'Ultrasound','" + AbsentReason_9.ClientID + "', 'Not Performed','" + AbsentQuality_9.ClientID + "', 'STD');";

                BreastUltrasoundli.Attributes.Add("onclick", BreastUltrasoundstr);

                if (BreastUltrasoundli.Selected)
                {
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "BreastUltrasoundjScript", BreastUltrasoundstr, true);
                }
            }

        }

        protected void BuildImagesUltrasound(int PatientID)
        {
            DiagnosticDa imagesDa = new DiagnosticDa();
            DataTable imagesDt = imagesDa.GetDiagnosticsByType(PatientID, "Ultrasound");

            if (imagesDt.Rows.Count > 0)
            {
                images.DataSource = imagesDt.DefaultView;
                images.DataBind();
            }
        }

	}
}
