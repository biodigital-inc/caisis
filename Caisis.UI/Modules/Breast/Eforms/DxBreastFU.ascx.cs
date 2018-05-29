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
    ///		Summary description for imaging for Breast eform.
    /// </summary>
    public partial class DxBreastFU : BaseEFormControl
    {
        override protected void Page_Load(object sender, System.EventArgs e)
        {
            base.Page_Load(sender, e);

            //populates existing diagnostics
            GetDiagnostics();
        }

        protected void GetDiagnostics()
        {
            DataView view = BusinessObject.GetByParentAsDataView<Diagnostic>(_patientId);
            if (view.Count >= 1)
            {
                BreastFUDxRpt.DataSource = view;
                BreastFUDxRpt.DataBind();
            }
        }
    }
}
