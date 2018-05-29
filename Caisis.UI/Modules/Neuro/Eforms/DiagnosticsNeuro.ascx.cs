namespace Caisis.UI.Modules.Neuro.Eforms
{
    using System;
    using System.Data;
    using System.Data.SqlClient;
    using System.Drawing;
    using System.Web;
    using System.Web.UI.WebControls;
    using System.Web.UI.HtmlControls;

    using Caisis.BOL;
    using Caisis.UI.Core.Classes;
    using Caisis.UI.Core.Classes.CustomControls;
    using Caisis.DataAccess;

    /// <summary>
    ///		Summary description for Neuro Diagnostics and Actions
    /// </summary>
    public partial class DiagnosticsNeuro : BaseEFormControl
    {
        protected override void Page_Load(object sender, EventArgs e)
        {
            base.Page_Load(sender, e);
            GetDx();
            GetActions();
        }

        protected void GetDx()
        {
			DataView view = BusinessObject.GetByParentAsDataView<Diagnostic>(_patientId);
			if (view.Count >= 1)
            {
                PDFormDiv.Style.Add("display", "block");

				NeuroDxRpt.DataSource = view;
                NeuroDxRpt.DataBind();
            }
            else
            {
                NoNeuroDxMsgTr.Style.Add("display", "block");
            }
        }

        protected void GetActions()
        {
			DataView view = BusinessObject.GetByParentAsDataView<BOL.Action>(_patientId);
			if (view.Count >= 1)
            {
                ActionsPDFormDiv.Style.Add("display", "block");

				NeuroActionsRpt.DataSource = view;
                NeuroActionsRpt.DataBind();
            }
            else
            {
                NoNeuroActionsMsgTr.Style.Add("display", "block");
            }
        }
    }
}