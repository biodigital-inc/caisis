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
    public partial class ProjectOrgs : ProjectMgmtBasePage
    {
        protected int projectId = -1;

        protected override void Page_Load(object sender, EventArgs e)
        {
            //base.Page_Load(sender, e);
            if (!string.IsNullOrEmpty(ProjectId))
            {
                projectId = int.Parse(ProjectId);
            }

            if (!IsPostBack)
                LoadOrgsGrid("Name");

            if (!string.IsNullOrEmpty(OrganizationId) && OrganizationId != "-1")
            {
                OrgInfoPage.Style.Remove("display");
                OrgInfoPage.Attributes["src"] = "ProjectOrgsDetails.aspx?projectId=" + projectId + "&organizationId=" + (string.IsNullOrEmpty(OrganizationId) ? "-1" : OrganizationId);
            }
            else
            {
                OrgInfoPage.Style["display"] = "none";
            }
        }

        /// <summary>
        /// Sets the selected item in the grid based on OrganizationId
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void SetGridViewSelectedByKey(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(OrganizationId) && int.Parse(OrganizationId) > -1)
            {
                foreach (GridViewRow row in OrgsGrid.Rows)
                {
                    string rowOrgId = OrgsGrid.DataKeys[row.RowIndex][ProjectOrganization.OrganizationId].ToString();
                    if (rowOrgId == OrganizationId)
                    {
                        row.CssClass = "datGridItemClick";
                        break;
                    }
                }
            }
        }

        /// <summary>
        /// Binds the organization grid and sorts base on options sort expression
        /// </summary>
        /// <param name="sortExpr"></param>
        protected void LoadOrgsGrid(string sortExpr)
        {
            DataView view = GetOrgDataSource(sortExpr);
            OrgsGrid.DataSource = view;
            OrgsGrid.DataBind();
            // Show hide empty message
            EmptyMessageLabel.Visible = view.Count == 0;
        }

        /// <summary>
        /// Gets the DataSource for Organizations. Returns a list filtered
        /// by Project if records exits.
        /// </summary>
        /// <param name="sortExpr">Optional sort expression</param>
        /// <returns>A view of the Organizations List</returns>
        private DataView GetOrgDataSource(string sortExpr)
        {
            DataView dataSource = new DataView();
            if (projectId != -1)
            {
                ProjectManagementDa projDA = new ProjectManagementDa();
                DataTable dt = projDA.GetProjectOrganizationsByProjectId(projectId);
                dataSource = dt.DefaultView;
            }
            else
            {
				//ProjectOrganization biz = new ProjectOrganization();
				//biz.GetAll();
				//dataSource = biz.DataSourceView;
				dataSource = BusinessObject.GetAllAsDataView<ProjectOrganization>();
            }
            dataSource.Sort = sortExpr;
            return dataSource;
        }

        /// <summary>
        /// Attach javascipt click events to grid rows
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void AddOnClickClientEvent(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                string rowOrdId = DataBinder.Eval(e.Row.DataItem, ProjectOrganization.OrganizationId).ToString();
                e.Row.Attributes["onclick"] = "goToOrganization(" + rowOrdId + ");";
            }
        }
    }
}