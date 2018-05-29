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
    ///		Summary description for OropharynxMedicalTx3.
    /// </summary>
    public partial class OropharynxMedicalTx3 : BaseEFormControl
    {

        protected override void Page_Load(object sender, System.EventArgs e)
        {
            base.Page_Load(sender, e);
            base.BuildMedTx(this._patientId, "", "Dynamic", "");
            base.SetTitle(ComponentTitle);
        }       
    }
}
