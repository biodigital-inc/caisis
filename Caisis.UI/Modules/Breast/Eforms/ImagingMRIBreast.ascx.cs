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
    ///		Summary description for ImagingMRIBreast.
	/// </summary>
    public partial class ImagingMRIBreast : BaseEFormControl
	{


		override protected void Page_Load(object sender, System.EventArgs e)
		{
			base.Page_Load(sender, e);
            base.SetTitle(ComponentTitle);

            BuildImagesMRIs(this._patientId);

            foreach (ListItem BreastMRIli in MRIDone.Items)
            {
                string BreastMRIstr = "showHideBreastMRI('" + BreastMRIli.Value + "','" + AbsentDateText_8.ClientID + "','" + System.DateTime.Now.ToShortDateString() + "','" + AbsentDate_8.ClientID + "','" + System.DateTime.Now.ToShortDateString() + "','" + TableName_8.ClientID + "', 'Diagnostics','" + FieldName_8.ClientID + "', 'DxType','" + FieldValue_8.ClientID + "', 'MRI','" + AbsentReason_8.ClientID + "', 'Not Performed','" + AbsentQuality_8.ClientID + "', 'STD');";

                BreastMRIli.Attributes.Add("onclick", BreastMRIstr);

                if (BreastMRIli.Selected)
                {
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "BreastMRIjScript", BreastMRIstr, true);
                }
            }

        }

        protected void BuildImagesMRIs(int PatientID)
        {
            DiagnosticDa imagesDa = new DiagnosticDa();
            DataTable imagesDt = imagesDa.GetDiagnosticsWithDxImagesByType(PatientID, "MRI");

            if (imagesDt.Rows.Count > 0)
            {
                images.DataSource = imagesDt.DefaultView;
                images.DataBind();
            }
        }


	}
}
