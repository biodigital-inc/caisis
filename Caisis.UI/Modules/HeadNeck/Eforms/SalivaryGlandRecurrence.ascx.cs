namespace Caisis.UI.Modules.HeadNeck.Eforms
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
    ///		Summary description for SalivaryGlandRecurrence.
    /// </summary>

    public partial class SalivaryGlandRecurrence : BaseEFormControl
    {
        protected override void Page_Load(object sender, System.EventArgs e)
        {
            base.Page_Load(sender, e);
            base.SetTitle(ComponentTitle);
            BuildStatusRptr(this._patientId, this._eformName, "Dynamic");
        }

        protected void BuildStatusRptr(int PatientId, string EformName, string EformType)
        {
            StatusDa statusDa = new StatusDa();
            DataSet statusDs = statusDa.GetStatus(PatientId, "Salivary Cancer");
            DataView dv = new DataView(statusDs.Tables[0]);
            dv.RowFilter = Status.Status_Field + " LIKE '%Recurrence%' OR " + Status.Status_Field + " LIKE '%Metastasis%' ";
            if (dv.Count > 0)
            {
                StatusRptr.DataSource = dv;
                StatusRptr.DataBind();
            }

        }
    }
}
