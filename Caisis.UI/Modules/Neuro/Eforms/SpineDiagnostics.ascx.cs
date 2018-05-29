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
    ///		Summary description for Spine Diagnostics
    /// </summary>
    public partial class SpineDiagnostics : BaseEFormControl
    {
        protected override void Page_Load(object sender, EventArgs e)
        {
            base.Page_Load(sender, e);
            GetDx();
        }

        protected void GetDx()
        {
            DataView view = BusinessObject.GetByParentAsDataView<Diagnostic>(_patientId);
            if (view.Count >= 1)
            {
                PDFormDiv.Style.Add("display", "block");

                SpineDxRpt.DataSource = view;
                SpineDxRpt.DataBind();
            }
            else
            {
                NoSpineDxMsgTr.Style.Add("display", "block");
            }
        }
    }
}