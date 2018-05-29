namespace Caisis.UI.Modules.GI.Eforms
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
    ///		Summary description for EsophagusSurgeryComplications2.
	/// </summary>
    public partial class EsophagusSurgeryComplications2 : BaseEFormControl
	{
		override protected void Page_Load(object sender, System.EventArgs e)
		{
			base.Page_Load(sender, e);
            base.SetTitle(ComponentTitle);

            GetToxicityHx(this._patientId, this._eformName, "Dynamic");

		}

        private void GetToxicityHx(int PatientID, string FormName, string FormType)
        {
            ToxicityDa toxDa = new ToxicityDa();
            DataSet toxDs = toxDa.FormListToxicities(PatientID, FormName, FormType, "");
            if (toxDs.Tables.Count > 0 && toxDs.Tables[0].Rows.Count > 0)
            {
                Toxicities.DataSource = toxDs.Tables[0].DefaultView;
                Toxicities.DataBind();
            }

        }
	}
}
