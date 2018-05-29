namespace Caisis.UI.Modules.All.Eforms
{
	using System;
	using System.Data;
	using System.Drawing;
	using System.Web;
	using System.Web.UI.WebControls;
	using System.Web.UI.HtmlControls;

	using Caisis.UI.Core;
	
	using Caisis.BOL;

	using Caisis.UI.Core.Classes;

	/// <summary>
    ///		Summary description for AnesthesiaWDuration2.
	/// </summary>
    public partial class AnesthesiaWDuration2 : BaseEFormControl
	{
        override protected void Page_Load(object sender, System.EventArgs e)
        {
            base.Page_Load(sender, e);
            base.SetTitle(ComponentTitle);

        }
	}
}
