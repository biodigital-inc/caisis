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
    ///		Summary description for Peds Neuro Medications
    /// </summary>
    public partial class MedsPedsNeuro : BaseEFormControl
    {
        protected override void Page_Load(object sender, EventArgs e)
        {
            base.Page_Load(sender, e);
            GetPedsMeds();
        }
        protected void GetPedsMeds()
        {
            DataView view = BusinessObject.GetByParentAsDataView<Medication>(_patientId);
            if (view.Count >= 1)
            {
                PedsNeuroMedsRpt.DataSource = view;
                PedsNeuroMedsRpt.DataBind();
            }
            else
            {
                NoPedsNeuroMedsMsgTr.Style.Add("display", "block");
                PrevPedsNeuroMedsRptHdr.Visible = false;
            }
        }

    }
}
