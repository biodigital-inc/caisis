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
    ///		Summary description for Thoracic CT Scan
    /// </summary>
    public partial class CTScanThoracic : BaseEFormControl
    {
        protected override void Page_Load(object sender, EventArgs e)
        {
            base.Page_Load(sender, e);

            if (!string.IsNullOrEmpty(DxDateText_2.Value) || !string.IsNullOrEmpty(DxSide_2.Value) || !string.IsNullOrEmpty(DxTarget_2.Value))
            {
                DxFindingsTR1.Style.Add("display", "block");
            }
        }
    }
}