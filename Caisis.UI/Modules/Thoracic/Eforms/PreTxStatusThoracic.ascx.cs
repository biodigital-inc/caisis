namespace Caisis.UI.Modules.Thoracic.Eforms
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
    ///		Summary description for Thoracic Pre-Tx Status and Clinical Stages
    /// </summary>
    public partial class PreTxStatusThoracic : BaseEFormControl
    {
        protected override void Page_Load(object sender, EventArgs e)
        {
            base.Page_Load(sender, e);

            GetStatus();
        }

        protected void GetStatus()
        {
			DataView dv = BusinessObject.GetByParentAsDataView<Status>(_patientId);

			if (dv.Count > 0)
			{
				PreTxStatusRpt.DataSource = dv;
				PreTxStatusRpt.DataBind();
			}
        }
    }
}