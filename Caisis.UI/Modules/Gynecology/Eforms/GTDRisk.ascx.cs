namespace Caisis.UI.Modules.Gynecology.Eforms
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
    ///		Summary description for GTDRisk.
	/// </summary>
    public partial class GTDRisk : BaseEFormControl
	{
        
		override protected void Page_Load(object sender, System.EventArgs e)
		{
			base.Page_Load(sender, e);
            base.SetTitle(ComponentTitle);
		}

	}
}