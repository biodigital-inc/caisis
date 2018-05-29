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
    ///		Summary description for Peds Neuro status
    /// </summary>
    public partial class StatusPedsNeuro : BaseEFormControl
    {
        protected override void Page_Load(object sender, EventArgs e)
        {
            base.Page_Load(sender, e);
            GetPedsNeuroStatus();
        }

        protected void GetPedsNeuroStatus()
        {
            DataView view = BusinessObject.GetByParentAsDataView<Status>(_patientId);
            if (view.Count >= 1)
            {
                PedsNeuroStatusRpt.DataSource = view;
                PedsNeuroStatusRpt.DataBind();
            }
            else
            {
                NoPedsNeuroStatusMsgTr.Style.Add("display", "block");
                PrevPedsNeuroStRptHdr.Visible = false;
            }
        }
    }
}
