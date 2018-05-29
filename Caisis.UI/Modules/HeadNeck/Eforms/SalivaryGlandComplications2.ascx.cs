namespace Caisis.UI.Modules.HeadNeck.Eforms
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
    ///		Summary description for SalivaryGlandComplications2.
	/// </summary>
    public partial class SalivaryGlandComplications2 : BaseEFormControl
	{
		override protected void Page_Load(object sender, System.EventArgs e)
		{
			base.Page_Load(sender, e);
            base.SetTitle(ComponentTitle);
            BuildGeneralComplications(this._patientId, this._eformName, "Dynamic");
        }

        protected void BuildGeneralComplications(int PatientID, string FormName, string FormType)
        {
            ToxicityDa toxDa = new ToxicityDa();

            DataSet toxDs = toxDa.FormListToxicities(PatientID, FormName, FormType,"");
            DataView dv = new DataView(toxDs.Tables[0]);

            if (dv.Count > 0)
            {
                ComplicationsRptr.DataSource = dv;
                ComplicationsRptr.DataBind();
            }
        }

	}
}
