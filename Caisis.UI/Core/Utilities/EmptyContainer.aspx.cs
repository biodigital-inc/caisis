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

namespace Caisis.UI.Core.Utilities
{
	/// <summary>
	/// Summary description for CommonTasks.
	/// </summary>
	public partial class CommonTasks : FramePage
	{

		override protected void Page_Load(object sender, System.EventArgs e)
		{
	
			

			if (Request.QueryString["TaskPage"] != null && Request.QueryString["TaskPage"].Length > 0)
			{
				string taskPageUrl;

				taskPageUrl = Request.QueryString["TaskPage"] + "?";


				if(Request.QueryString["primKey"] != null && Request.QueryString["primKey"].Length > 0)
				{
					taskPageUrl += "primKey=" + Request.QueryString["primKey"] + "&";
				}
				if(Request.QueryString["splash"] != null && Request.QueryString["splash"].Length > 0)
				{
					taskPageUrl += "splash=" + Request.QueryString["splash"];
				}

				TaskContainer.Attributes.Add("src", taskPageUrl);
			}




		
			// base page handles logging of patient views and redirects
			base.Page_Load(sender, e);
		}
	}
}
