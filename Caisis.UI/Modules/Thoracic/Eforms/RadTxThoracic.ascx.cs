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
    ///		Summary description for Thoracic Radiation Therapies
    /// </summary>
    public partial class RadTxThoracic : BaseEFormControl
    {
        protected override void Page_Load(object sender, EventArgs e)
        {
            base.Page_Load(sender, e);

            GetRadTx();
        }

        //gets the existing rad therapies for this patient
        protected void GetRadTx()
        {
            DataView view = BusinessObject.GetByParentAsDataView<RadiationTherapy>(_patientId);

            if (view.Count >= 1)
            {
                ThoracicRadTxRpt.DataSource = view;
                ThoracicRadTxRpt.DataBind();
            }
        }
    }
}