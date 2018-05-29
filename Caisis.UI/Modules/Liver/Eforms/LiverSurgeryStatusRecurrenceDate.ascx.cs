namespace Caisis.UI.Modules.Liver.Eforms
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
    ///		Summary description for LiverSurgeryStatusRecurrenceDate.
	/// </summary>
    public partial class LiverSurgeryStatusRecurrenceDate : BaseEFormControl
	{
        override protected void Page_Load(object sender, System.EventArgs e)
		{
			base.Page_Load(sender, e);
            base.SetTitle(ComponentTitle); 

		}
	}
}
