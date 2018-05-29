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
using Caisis.UI.Core.Classes.CustomControls;

namespace Caisis.UI.Modules.ProjectMgmt
{
    /// <summary>
    /// Contains the navigation elements for an Organization level view of a Project.
    /// </summary>
    public partial class ProjectViewOrgNav : ProjectMgmtBaseControl
    {
        protected override void Page_Load(object sender, EventArgs e)
        {
            base.Page_Load(sender, e);
            if (!string.IsNullOrEmpty(ProjectId) && !string.IsNullOrEmpty(OrganizationId))
            {
                SetOrganizationTitle();
                BindProjectStagesRptr();
            }
            SetLinkPermissions();
        }

        private void SetLinkPermissions()
        {
            if (Page is ProjectMgmtBasePage)
            {
                ProjectMgmtBasePage page = Page as ProjectMgmtBasePage;
                // Regular user shouldn't see funding sources
                if (page.UserType == ProjectMgmtUsers.ProjectUser)
                {
                    Funding.Visible = false;
                }
                // Hide navigation if not in organization view
                if (page.ProjectContext != ProjectMgmtContext.Organization)
                {
                    this.Visible = false;
                }
                else
                {
                    Funding.HRef = Page.ResolveUrl("ProjectFunding.aspx?projectId=" + ProjectId);
                }
            }
        }

        protected void SetAddNewStageLink(object sender, EventArgs e)
        {
            ProjectMgmtButton btn = sender as ProjectMgmtButton;
            btn.OnClientClick = "return showEditDetailsInModal('" + Page.ResolveUrl("EditStage.aspx") + "?projectId=" + ProjectId + "&organizationId=" + OrganizationId + "','Edit Stage')";
        }

        /// <summary>
        /// 
        /// </summary>
        protected void SetOrganizationTitle()
        {
            ProjectOrganization org = new ProjectOrganization();
            org.Get(int.Parse(OrganizationId));
            OrganizationLabel.Text = org[ProjectOrganization.Name].ToString();
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="projectId"></param>
        /// <param name="organizationId"></param>
        protected void BindProjectStagesRptr()
        {
            int projectId = int.Parse(ProjectId);
            int orgId = int.Parse(OrganizationId);

            // Get all stages belonging to current organization
			//ProjectStage stages = new ProjectStage();
			//stages.GetByParent(projectId);
			//DataView view = stages.DataSourceView;
			DataView view = BusinessObject.GetByParentAsDataView<ProjectStage>(projectId);
            view.RowFilter = ProjectStage.OrganizationId + " = " + orgId;
            // Sort oldest stages (inserted first) to top.
            view.Sort = ProjectStage.StageId + " ASC";
            ProjectStagesRptr.DataSource = view;
            ProjectStagesRptr.DataBind();
        }

        /// <summary>
        /// Set stage label and color when item bound
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void SetStageItems(object sender, RepeaterItemEventArgs e)
        {
            string stageId = DataBinder.Eval(e.Item.DataItem, ProjectStage.StageId).ToString();
            string stageName = DataBinder.Eval(e.Item.DataItem, ProjectStage.Name).ToString();
            string stageColor = DataBinder.Eval(e.Item.DataItem, ProjectStage.ColorCode).ToString();
            Label stageNameLabel = e.Item.FindControl("StageName") as Label;
            stageNameLabel.Text = stageName;
            Panel stageColorBlock = e.Item.FindControl("StageColorBlock") as Panel;
            // Use color for record
            if (!string.IsNullOrEmpty(stageColor))
            {
                stageColorBlock.Style[HtmlTextWriterStyle.BackgroundColor] = stageColor;
            }
            // Else use default color
            else
            {
                // Need to determine defualt color,or set no color
                //stageColorBlock.Style[HtmlTextWriterStyle.BackgroundColor] = GantChart.BASE_COLOR;
            }

            // Sets active stage link if passed in url
            if (!string.IsNullOrEmpty(Request.QueryString["stageId"]) && Request.QueryString["stageId"] == stageId)
            {
                string clientStageId = "'StageLink" + stageId + "'";
                string setActiveLink = "setActiveNavLink($(" + clientStageId + "));";
                Page.ClientScript.RegisterStartupScript(this.GetType(), "SetActiveStage", setActiveLink, true);
            }
        }
    }
}
