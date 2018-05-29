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
using Caisis.DataAccess;

namespace Caisis.UI.Modules.ProjectMgmt
{
    public partial class ProjectManuscript : ProjectMgmtBasePage
    {
        protected int projectId = -1;
        protected int manuscriptId = -1;

        protected override void Page_Load(object sender, EventArgs e)
        {
            base.Page_Load(sender, e);
            this.EnableViewState = true;

            projectId = -1;
            if (!string.IsNullOrEmpty(ProjectId))
            {
                projectId = int.Parse(ProjectId);
            }

            if (!string.IsNullOrEmpty(Request.QueryString["manuscriptId"]))
                manuscriptId = Int32.Parse(Request.QueryString["manuscriptId"]);

            if (manuscriptId == -1)
            {
                ManuscriptDetailsPage.Style["display"] = "none";
            }
            else
            {
                ManuscriptDetailsPage.Style["display"] = "";
                ManuscriptDetailsPage.Attributes["src"] = "ProjectManuscriptDetails.aspx?projectId=" + projectId + "&manuscriptId=" + manuscriptId;
            }

            if (!IsPostBack)
                LoadManuscriptGrid(null);


            if (manuscriptId != -1)
            {
                SetGridViewSelectedByKey();
            }
        }

        private void SetGridViewSelectedByKey()
        {
            DataView dv = (DataView)ManuscriptsGrid.DataSource;
            for (int i = 0; i < dv.Table.Rows.Count; i++)
            {
                if (manuscriptId == Int32.Parse(dv.Table.Rows[i]["ManuscriptId"].ToString()))
                {
                    ManuscriptsGrid.Rows[i].CssClass = "datGridItemClick";
                    break;
                }
            }
        }

        protected void LoadManuscriptGrid(string sortExpr)
        {
            ProjectManagementDa projDA = new ProjectManagementDa();

            DataTable dt = CombineRows(projDA.GetManuscriptsByProject(projectId));

            DataView dv = new DataView(dt);
            dv.Sort = sortExpr;

            if (dt.Rows.Count == 0)
                EmptyMessageLabel.Visible = true;
            else
            {
                EmptyMessageLabel.Visible = false;
                ManuscriptsGrid.DataSource = dv;
                ManuscriptsGrid.DataBind();
            }

        }

        private DataTable CombineRows(DataTable OrigTable)
        {
            DataTable dtCombined = OrigTable.Clone();

            for (int i = 0; i < OrigTable.Rows.Count; i++)
            {
                if (i == 0)
                {
                    dtCombined.ImportRow(OrigTable.Rows[i]);
                    continue;
                }

                if (OrigTable.Rows[i]["ManuscriptId"].ToString() == OrigTable.Rows[i - 1]["ManuscriptId"].ToString())
                {
                    continue;
                }
                else
                {
                    dtCombined.ImportRow(OrigTable.Rows[i]);
                }
            }

            return dtCombined;
        }

        protected void ContactsGrid_RowCreated(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                if (e.Row.DataItem != null)
                    e.Row.Attributes.Add("onclick", "goToManuscript(" + ((System.Data.DataRowView)(e.Row.DataItem)).Row["ManuscriptId"] + "," + projectId + ");");
            }
        }

        /// <summary>
        /// Handle sorting of grid
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void ManuscriptsGrid_Sorting(object sender, GridViewSortEventArgs e)
        {
            GridViewSortExpression = e.SortExpression;
            GridViewSortDirection = e.SortDirection == SortDirection.Ascending ? "ASC" : "DESC";
            string sortExpr = string.Format("{0} {1}", GridViewSortExpression, GridViewSortDirection);
            LoadManuscriptGrid(sortExpr);
        }

        /// <summary>
        /// Sorts Organizations based on column selected in header.
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void HandleHeaderSortClick(object sender, CommandEventArgs e)
        {
            LinkButton btn = sender as LinkButton;
            string sortExpr = e.CommandArgument.ToString();
            SortDirection sortDir = GridViewSortDirection == String.Empty || GridViewSortDirection == "ASC" ? SortDirection.Descending : SortDirection.Ascending;
            ManuscriptsGrid.Sort(sortExpr, sortDir);
        }

        private string GridViewSortDirection
        {
            get { return ViewState["SortDirection"] as string ?? "ASC"; }

            set { ViewState["SortDirection"] = value; }
        }

        private string GridViewSortExpression
        {
            get { return ViewState["SortExpression"] as string ?? string.Empty; }

            set { ViewState["SortExpression"] = value; }
        }

    }
}