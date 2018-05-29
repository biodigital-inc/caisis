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
    ///		Summary description for Thoracic Diagnostics
    /// </summary>
    public partial class DxThoracic : BaseEFormControl
    {
        protected override void Page_Load(object sender, EventArgs e)
        {
            base.Page_Load(sender, e);

            if (!string.IsNullOrEmpty(DxDateText_6.Value) || !string.IsNullOrEmpty(DxSide_6.Value) || !string.IsNullOrEmpty(DxTarget_6.Value))
            {
                DxImgFindingsTR.Style.Add("display", "block");
            }

            if (!string.IsNullOrEmpty(DxDateText_13.Value) || !string.IsNullOrEmpty(DxSide_13.Value) || !string.IsNullOrEmpty(DxTarget_13.Value))
            {
                DxImgFindingsTR2.Style.Add("display", "block");
            }
        }
    }
}