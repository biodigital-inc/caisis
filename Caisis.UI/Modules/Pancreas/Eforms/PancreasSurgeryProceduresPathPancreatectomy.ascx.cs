namespace Caisis.UI.Modules.Pancreas.Eforms
{
	using System;
	using System.Data;
	using System.Drawing;
	using System.Web;
	using System.Web.UI.WebControls;
	using System.Web.UI.HtmlControls;

	using Caisis.BOL;
	using Caisis.UI.Core.Classes;
    //2.0 	using Caisis.UI.Modules.Prostate.PaperForms;
	using Caisis.DataAccess;
    using Caisis.UI.Core.Classes.CustomControls;

	/// <summary>
    ///		Summary description for PancreasSurgeryProceduresPathPancreatectomy.
	/// </summary>
    public partial class PancreasSurgeryProceduresPathPancreatectomy : BaseEFormControl
    {

        protected override void Page_Load(object sender, EventArgs e)
        {
            base.Page_Load(sender, e);
            base.SetTitle(ComponentTitle);
        }
    }
}