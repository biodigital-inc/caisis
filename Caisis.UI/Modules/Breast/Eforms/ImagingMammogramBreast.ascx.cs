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
    ///		Summary description for ImagingMammogramBreast.
	/// </summary>
    public partial class ImagingMammogramBreast : BaseEFormControl
	{


		override protected void Page_Load(object sender, System.EventArgs e)
		{
			base.Page_Load(sender, e);
            base.SetTitle(ComponentTitle);

            BuildImagesMamograms(this._patientId);

            foreach (ListItem BreastMammogramli in MammogramUltrasoundDone.Items)
            {
                string BreastMammogramstr = "showHideBreastMammogram('" + BreastMammogramli.Value + "','" + AbsentDateText_7.ClientID + "','" + System.DateTime.Now.ToShortDateString() + "','" + AbsentDate_7.ClientID + "','" + System.DateTime.Now.ToShortDateString() + "','" + TableName_7.ClientID + "', 'Diagnostics','" + FieldName_7.ClientID + "', 'DxType','" + FieldValue_7.ClientID + "', 'Mammogram','" + AbsentReason_7.ClientID + "', 'Not Performed','" + AbsentQuality_7.ClientID + "', 'STD');";

                BreastMammogramli.Attributes.Add("onclick", BreastMammogramstr);

                if (BreastMammogramli.Selected)
                {
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "BreastMammogramjScript", BreastMammogramstr, true);
                }
            }

        }

        protected void BuildImagesMamograms(int PatientID)
        {
            DiagnosticDa imagesDa = new DiagnosticDa();
            DataTable imagesDt = imagesDa.GetDiagnosticsByType(PatientID, "Mammogram");

            if (imagesDt.Rows.Count > 0)
            {
                images.DataSource = imagesDt.DefaultView;
                images.DataBind();
            }
        }


	}
}
