namespace Caisis.UI.Modules.Colorectal.Eforms
{
	using System;
	using System.Data;
	using System.Data.SqlClient;
	using System.Drawing;
	using System.Web;
	using System.Web.UI.WebControls;
	using System.Web.UI.HtmlControls;

	using Caisis.UI.Core.Classes;
	using Caisis.UI.Core.Classes.CustomControls;
	using Caisis.DataAccess;

	/// <summary>
	///		Summary description for ChiefComplaint.
	/// </summary>
    public partial class IntentOfOperation : BaseEFormControl
	{
        protected override void Page_Load(object sender, EventArgs e)
        {
            // override base member to trigger disabling of hiddens
            disableEformHiddenControls = true;
            base.Page_Load(sender, e);

            if(!string.IsNullOrEmpty(primProcOtherVal.Text))
            {
                PrimProcDetailsHdr1.Style.Add("display", "block");
                PrimProcDetailsTbl1.Style.Add("display", "block");
                PrimProcDetailsHdr2.Style.Add("display", "block");
                PrimProcDetailsTbl2.Style.Add("display", "block");
                PrimProcDetailsHdr3.Style.Add("display", "block");
                PrimProcDetailsTbl3.Style.Add("display", "block");
            }
            else
            {
                ProceedtoEndMsgTbl.Style.Add("display", "block");
            }

            if (string.IsNullOrEmpty(PSMCompleteResection.Text))
            {
                SurgAssessDiv.Style.Add("display", "block");
            }

            if (ResectionRadioTxt.Text == "No")
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "clearProcDetailsjScript", "clearProcDetails();", true);
            }

        }

	}
}
