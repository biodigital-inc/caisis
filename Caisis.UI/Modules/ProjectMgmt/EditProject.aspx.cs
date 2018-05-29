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

namespace Caisis.UI.Modules.ProjectMgmt
{
    public partial class EditProject : ProjectMgmtBasePage
    {
        protected int projectId = -1;
        protected int organizationId = -1;

        protected override void Page_Load(object sender, EventArgs e)
        {
            base.Page_Load(sender, e);
            if (!string.IsNullOrEmpty(ProjectId))
            {
                projectId = int.Parse(ProjectId);
                Project biz = new Project();
                biz.Get(projectId);
                ProjectTitle.Text = biz[Project.Title].ToString();
                ProjectTitle.ToolTip = biz[Project.Description].ToString();
                AdjustTitleStyle();

                ReturnToMultiOrgLink.PostBackUrl = "EditProject.aspx?projectId=" + projectId;

                if (!string.IsNullOrEmpty(OrganizationId) && OrganizationId != "-1")
                {
                    organizationId = int.Parse(OrganizationId);

                    MainGantFrame.Attributes["src"] = "AjaxGantLoader.aspx?projectId=" + ProjectId + "&tableName=ProjectOrganization&priKey=" + organizationId + "&loadFromParent=true";
                }
                else
                {
                    // We only want to show admin navigation if the user has permission to see all organizations
                    if (base.UserType == ProjectMgmtUsers.ProjectAdmin || base.UserType == ProjectMgmtUsers.ModuleAdmin)
                    {
                        MainGantFrame.Attributes["src"] = "AjaxGantLoader.aspx?projectId=" + ProjectId + "&tableName=Project&priKey=-1" + "&loadFromParent=true"; ;
                    }
                }
            }
        }


        protected void AdjustTitleStyle()
        {
            if (ProjectTitle.Text.Length > 205) ProjectTitle.Style.Add("font-size", "11px");
            else if (ProjectTitle.Text.Length < 70) ProjectTitle.Style.Add("font-size", "20px");
            else if (ProjectTitle.Text.Length < 100) ProjectTitle.Style.Add("font-size", "17px");
        }


    }
}
