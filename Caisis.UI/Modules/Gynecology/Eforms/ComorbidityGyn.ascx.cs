namespace Caisis.UI.Modules.Gynecology.Eforms
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
    ///		Summary description for GYN Comorbidity details
    /// </summary>
    public partial class ComorbidityGyn : BaseEFormControl
    {
        protected override void Page_Load(object sender, EventArgs e)
        {
            base.Page_Load(sender, e);
            GetComorbs();
        }

        protected void GetComorbs()
        {
            DataView view = BusinessObject.GetByParentAsDataView<Comorbidity>(_patientId);
            if (view.Count >= 1)
            {
                GynComorbsRpt.DataSource = view;
                GynComorbsRpt.DataBind();
            }
            else
            {
                NoGynComorbsMsgTr.Style.Add("display","block");
                PrevGynComorbsRptHdr.Visible = false;
            }
        }
    }
}