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
	using Caisis.UI.Core.Classes.CustomControls;

	/// <summary>
    ///		Summary description for MedicalTherapyBreast.
	/// </summary>
    public partial class MedicalTherapyBreast : BaseEFormControl
	{

		override protected void Page_Load(object sender, System.EventArgs e)
		{
			base.Page_Load(sender, e);
			base.BuildMedTx(this._patientId, this._eformName, "Dynamic", "");
            base.SetTitle(ComponentTitle);

            foreach (ListItem BreastMedTxli in MedTxDone.Items)
            {
                string BreastMedTxstr = "showHideBreastMedTx('" + BreastMedTxli.Value + "','" + AbsentDateText_4.ClientID + "','" + System.DateTime.Now.ToShortDateString() + "','" + AbsentDate_4.ClientID + "','" + System.DateTime.Now.ToShortDateString() + "','" + TableName_4.ClientID + "', 'MedicalTherapy','" + FieldName_4.ClientID + "', 'MedTxType','" + FieldValue_4.ClientID + "', 'Chemo','" + AbsentReason_4.ClientID + "', 'Not Performed','" + AbsentQuality_4.ClientID + "', 'STD');";

                BreastMedTxli.Attributes.Add("onclick", BreastMedTxstr);

                if (BreastMedTxli.Selected)
                {
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "BreastMedTxjScript", BreastMedTxstr, true);
                }
            }
		}
	}
}
