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
    ///		Summary description for Thoracic Actions and Status
    /// </summary>
    public partial class StatusThoracic : BaseEFormControl
    {
        protected override void Page_Load(object sender, EventArgs e)
        {
            base.Page_Load(sender, e);

            SetDeathStatus();
        }

        protected void SetDeathStatus()
        {
            Patient ptObj = new Patient();
            ptObj.Get(this._patientId);

            if (!ptObj.IsEmpty)
            {
                DeathStatusRpt.DataSource = new Patient[] { ptObj }.AsDataView();
                DeathStatusRpt.DataBind();
            }
        }
    }
}