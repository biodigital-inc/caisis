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
	using Caisis.DataAccess;
    using Caisis.UI.Core.Classes.CustomControls;

	/// <summary>
    ///		Summary description for ProstateSpecimenIdentifiers.
    /// </summary
    public partial class ProstateSpecimenIdentifiers : BaseEFormControl
	{
		override protected void Page_Load(object sender, System.EventArgs e)
		{
			base.Page_Load(sender, e);
            base.SetTitle(ComponentTitle);

            // set ramq identifier
            IdentifierDa ptIdDa = new IdentifierDa();
            DataTable caseDt = ptIdDa.GetPatientIdentifierTableByIdType(this._patientId, "CASE ID NUMBER");
            DataView caseDv = new DataView(caseDt);
            if (caseDv.Count > 0)
            {
                NoCaseNumMsgTr.Style.Add("display","none");
                NoCaseNumTr.Style.Add("display", "none");
                HasCaseNumMsgTr.Style.Remove("display");
                HasCaseNumTr.DataSource = caseDv;
                HasCaseNumTr.DataBind();
            }
            else
            {
                NoCaseNumMsgTr.Style.Remove("display");
                NoCaseNumTr.Style.Remove("display");
                HasCaseNumMsgTr.Style.Add("display", "none");
            }

            DataTable carisCaseDt = ptIdDa.GetPatientIdentifierTableByIdType(this._patientId, "CARIS CASE ID NUMBER");
            DataView carisCaseDv = new DataView(carisCaseDt);
            if (carisCaseDv.Count > 0)
            {
                NoCarisCaseNumMsgTr.Visible = false;
                NoCarisCaseNumTr.Visible = false;
                HasCarisCaseNumMsgTr.Visible = true;
                HasCarisCaseNumTr.DataSource = carisCaseDv;
                HasCarisCaseNumTr.DataBind();
            }
            else
            {
                NoCarisCaseNumMsgTr.Visible = true;
                NoCarisCaseNumTr.Visible = true;
                HasCarisCaseNumMsgTr.Visible = false;
            }
        }
	}
}
