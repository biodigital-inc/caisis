using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

namespace Caisis.UI.Modules.ProjectMgmt
{
    public partial class ProjectManagerSplash : ProjectMgmtBasePage
    {
        protected override void Page_Load(object sender, EventArgs e)
        {
            base.Page_Load(sender, e);
            // Regular users don't have access to create project or modify stages
            if (UserType == ProjectMgmtUsers.ProjectUser)
            {
                CreateProjectBtn.Visible = false;
                ManageStagesBtn.Visible = false;
            }
        }
    }
}
