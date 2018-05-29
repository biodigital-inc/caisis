using System;
using System.Collections;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Web;
using System.Web.SessionState;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;

using Caisis.UI.Core.Classes;

namespace Caisis.UI.Admin
{
	/// <summary>
	/// Summary description for AdminLookUpSectionIntro.
	/// </summary>
	public partial class AdminLookUpSectionIntro : AdminBasePage
	{
		protected HtmlButton refreshButton;
		protected Label display;

		override protected void Page_Load(object sender, System.EventArgs e)
		{
			// Put user code to initialize the page here
			base.Page_Load(sender, e);
		}

		protected void RefreshCommand(Object sender, CommandEventArgs e)  
		{
			CacheManager.ResetLookupCodeCache();
			display.Text="Lookupcodes have been Refeshed";
		}
	}
}
