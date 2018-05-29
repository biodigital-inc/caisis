using System;
using System.Web;
using System.Web.SessionState;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using System.Xml;

using Caisis.UI.Core.Classes;
using Caisis.Security;

namespace Caisis.UI.Modules.PatientEducation
{
	public partial class PatientEdSplash : BasePage
	{
		protected override void Page_Load(object sender, System.EventArgs e)
		{
			base.Page_Load(sender, e);

            if (PermissionManager.HasPermission("PatientEdAdmin"))
            {
                ManagementIcon.Visible = true;
            }
		}
		 
	}
}
