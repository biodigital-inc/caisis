namespace Caisis.UI.Modules.HeadNeck.Eforms
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
    ///		Summary description for SalivaryGlandNodeExamFindings.
	/// </summary>
    public partial class SalivaryGlandNodeExamFindings : BaseEFormControl
	{
        override protected void Page_Load(object sender, EventArgs e)
        {
            base.Page_Load(sender, e);
            base.SetTitle(ComponentTitle);
        }
	}
}
