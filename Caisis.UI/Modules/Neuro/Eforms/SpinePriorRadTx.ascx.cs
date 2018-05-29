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
    ///		Summary description for previuos Spine Rad tx
    /// </summary>
    public partial class SpinePriorRadTx : BaseEFormControl
    {
        protected override void Page_Load(object sender, EventArgs e)
        {
            base.Page_Load(sender, e);
            GetRadTx();
        }

        protected void GetRadTx()
        {
            DataView view = BusinessObject.GetByParentAsDataView<RadiationTherapy>(_patientId);
            if (view.Count >= 1)
            {
                PDFormDiv.Style.Add("display", "block");

                SpineRadTxRpt.DataSource = view;
                SpineRadTxRpt.DataBind();
            }
            else
            {
                NoSpineRadTxMsgTr.Style.Add("display", "block");
            }
        }
    }
}