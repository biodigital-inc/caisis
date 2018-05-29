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
    ///		Summary description for PreviousProcedures.
    /// </summary>
    public partial class PreviousProceduresBreastFU : BaseEFormControl
    {

        protected override void Page_Load(object sender, EventArgs e)
        {
            base.Page_Load(sender, e);

            GetSurgicalHistory();
        }

        protected void GetSurgicalHistory()
        {
            DataView view = BusinessObject.GetByParentAsDataView<Procedure>(_patientId);
            if (view.Count >= 1)
            {
                PrevProcsHdrTr.Visible = true;
                PDFormDiv.Style.Add("display", "block");
                rptSurgicalHistory.DataSource = view;
                rptSurgicalHistory.DataBind();
            }
            else
            {
                NoProcsTr.Visible = true;
            }
        }

    }
}