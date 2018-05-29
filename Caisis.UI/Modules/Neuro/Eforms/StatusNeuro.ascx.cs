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
    ///		Summary description for Neuro Diagnosis and FU status
    /// </summary>
    public partial class StatusNeuro : BaseEFormControl
    {
        protected override void Page_Load(object sender, EventArgs e)
        {
            base.Page_Load(sender, e);
            GetStatus();
        }

        protected void GetStatus()
        {
			DataView view = BusinessObject.GetByParentAsDataView<Status>(_patientId);
			if (view.Count >= 1)
            {
                PDFormDiv.Style.Add("display", "block");

				NeuroStatusRpt.DataSource = view;
                NeuroStatusRpt.DataBind();
            }
            else
            {
                NoNeuroDiagnosisMsgTr.Style.Add("display", "block");
            }
        }
    }
}