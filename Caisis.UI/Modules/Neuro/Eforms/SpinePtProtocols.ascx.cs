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
    ///		Summary description to show all patient protocols
    /// </summary>
    public partial class SpinePtProtocols : BaseEFormControl
    {
        protected override void Page_Load(object sender, EventArgs e)
        {
            base.Page_Load(sender, e);

            GetPtProtocolStatus();
        }

        protected void GetPtProtocolStatus()
        {
            PatientProtocolDa da = new PatientProtocolDa();
            DataView view = da.GetPatientProtocolStatus(_patientId).DefaultView;

            if (view.Count >= 1)
            {
                PDFormDiv.Style.Add("display", "block");

                SpinePtProtocolsRpt.DataSource = view;
                SpinePtProtocolsRpt.DataBind();
            }
            else
            {
                NoSpinePtProtocolsMsgTr.Style.Add("display", "block");
            }
        }
    }
}