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
    ///		Summary description for Thoracic Detection
    /// </summary>
    public partial class DetectionThoracic : BaseEFormControl
    {
        protected override void Page_Load(object sender, EventArgs e)
        {
            base.Page_Load(sender, e);

            //PathNotes in PriorLungCancer usercontrol updates here
            if (!string.IsNullOrEmpty(PriorLungResection.Value) && !string.IsNullOrEmpty(PriorLungCancer.Value))
            {
                PathNotes_1.Value = "PriorLungResection: " + PriorLungResection.Value + "\n PriorLungCancer: " + PriorLungCancer.Value;
            }
            else if (!string.IsNullOrEmpty(PriorLungResection.Value) && string.IsNullOrEmpty(PriorLungCancer.Value))
            {
                PathNotes_1.Value = "PriorLungResection: " + PriorLungResection.Value;
            }
            else if (string.IsNullOrEmpty(PriorLungResection.Value) && !string.IsNullOrEmpty(PriorLungCancer.Value))
            {
                PathNotes_1.Value = "PriorLungCancer: " + PriorLungCancer.Value;
            }
            else if (string.IsNullOrEmpty(PriorLungResection.Value) && string.IsNullOrEmpty(PriorLungCancer.Value))
            {
                PathNotes_1.Value = "";
            }

            //shows existing diagnostic details
            GetDx();
        }

        protected void GetDx()
        {
			DataView dv = BusinessObject.GetByParentAsDataView<Diagnostic>(_patientId);

			if (dv.Count > 0)
			{
				DxRpt.DataSource = dv;
				DxRpt.DataBind();
			}
        }
    }
}