namespace Caisis.UI.Modules.Thoracic.Eforms
{
    using System;
    using System.Data;
    using System.Data.SqlClient;
    using System.Drawing;
    using System.Web;
    using System.Web.UI.WebControls;
    using System.Web.UI.HtmlControls;

    using Caisis.UI.Core.Classes;
    using Caisis.UI.Core.Classes.CustomControls;
    using Caisis.DataAccess;

    /// <summary>
    ///		Summary description for Prior Lung Cancer details
    /// </summary>
    public partial class PriorLungCancerThoracic : BaseEFormControl
    {
        protected override void OnInit(EventArgs e)
        {
            base.OnInit(e);
        }

        protected override void Page_Load(object sender, EventArgs e)
        {
            base.Page_Load(sender, e);

            if (!string.IsNullOrEmpty(PathDateText_1.Value) || !string.IsNullOrEmpty(PathHistology_1.Value) || !string.IsNullOrEmpty(PathSide_1.Value) || !string.IsNullOrEmpty(PathSubsite_1.Value))
            {
                PathStageTR.Style.Add("display","block");
            }
        }
    }
}