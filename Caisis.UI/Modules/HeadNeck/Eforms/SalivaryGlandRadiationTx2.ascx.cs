namespace Caisis.UI.Modules.HeadNeck.EForms
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

    public partial class SalivaryGlandRadiationTx2 : BaseEFormControl
    {
        override protected void Page_Load(object sender, EventArgs e)
        {
            base.Page_Load(sender, e);
            base.BuildXRT(this._patientId, "", "Dynamic");
            base.SetTitle(ComponentTitle);
        }
    }
}
