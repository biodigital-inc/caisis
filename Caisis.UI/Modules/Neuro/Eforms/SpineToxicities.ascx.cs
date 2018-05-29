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
    ///		Summary description for Spine toxicities/complications
    /// </summary>
    public partial class SpineToxicities : BaseEFormControl
    {
        protected override void Page_Load(object sender, EventArgs e)
        {
            base.Page_Load(sender, e);
            GetToxicities();
        }

        protected void GetToxicities()
        {
            DataView view = BusinessObject.GetByParentAsDataView<BOL.Toxicity>(_patientId);
            if (view.Count >= 1)
            {
                PDFormDiv.Style.Add("display", "block");

                SpineToxRpt.DataSource = view;
                SpineToxRpt.DataBind();
            }
            else
            {
                NoSpineToxMsgTr.Style.Add("display", "block");
            }
        }
    }
}
