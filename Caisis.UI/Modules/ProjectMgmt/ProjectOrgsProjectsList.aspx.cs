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

using Caisis.BOL;
using Caisis.DataAccess;
using Caisis.UI.Core.Classes;
using Caisis.UI.Modules.ProjectMgmt;

namespace Caisis.UI.Modules.ProjectMgmt
{
    public partial class ProjectOrgsProjectsList : ProjectMgmtBasePage
    {
        protected override void Page_Load(object sender, EventArgs e)
        {
            base.Page_Load(sender, e);
            string organizationId = Request.QueryString["organizationId"];
            if (!string.IsNullOrEmpty(organizationId))
            {
                BuildOrganizationProjects(int.Parse(organizationId));
            }
        }

        private void BuildOrganizationProjects(int organizationId)
        {
            ProjectManagementDa da = new ProjectManagementDa();
            DataView projectsList = da.GetAllProjectsForOrg(organizationId).DefaultView;
            OrganizationProjectsRptr.DataSource = projectsList;
            OrganizationProjectsRptr.DataBind();
        }
    }
}
