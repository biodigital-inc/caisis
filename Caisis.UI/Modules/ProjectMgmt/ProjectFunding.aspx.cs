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

namespace Caisis.UI.Modules.ProjectMgmt
{
    public partial class ProjectFunding : ProjectMgmtBasePage
    {

        protected int projectId = -1;
        protected int fundingId = -1;

        protected override void Page_Load(object sender, EventArgs e)
        {
            base.Page_Load(sender, e);
            this.EnableViewState = true;

            projectId = -1;
            if (!string.IsNullOrEmpty(ProjectId))
            {
                projectId = int.Parse(ProjectId);
            }

            if (!string.IsNullOrEmpty(Request.QueryString["fundingSourceId"]))
                fundingId = Int32.Parse(Request.QueryString["fundingSourceId"]);

            if (!IsPostBack)
                LoadFundingGrid("");

            if (fundingId == -1)
            {
                FundingDetailsPage.Style["display"] = "none";
            }
            else
            {
                FundingDetailsPage.Attributes["src"] = "ProjectFundingDetails.aspx?projectId=" + projectId + "&fundingId=" + fundingId;
                FundingDetailsPage.Style["display"] = "";
            }


            if (fundingId != -1)
            {
                SetGridViewSelectedByKey();
            }
        }

        private void SetGridViewSelectedByKey()
        {
            DataView dv = (DataView)FundingGrid.DataSource;
            for (int i = 0; i < dv.Table.Rows.Count; i++)
            {
                if (fundingId == Int32.Parse(dv.Table.Rows[i]["FundingSourceId"].ToString()))
                {
                    FundingGrid.Rows[i].CssClass = "datGridItemClick";
                    break;
                }
            }
        }

        private void LoadFundingGrid(string sortExpr)
        {
            //ProjectFundingSource biz = new ProjectFundingSource();
			DataView view;

			//if (projectId != -1)
			//    biz.GetByParent(projectId);
			//else
			//    biz.GetAll();

			if (projectId != -1)
				view = BusinessObject.GetByParentAsDataView<ProjectFundingSource>(projectId);
			else
				view = BusinessObject.GetAllAsDataView<ProjectFundingSource>();

            //biz.DataSourceView.Sort = sortExpr;
			view.Sort = sortExpr;

            //if (biz.DataSourceView.Table.Rows.Count == 0)
			if (view.Count == 0)
                EmptyMessageLabel.Visible = true;
            else
            {
                EmptyMessageLabel.Visible = false;
                //FundingGrid.DataSource = biz.DataSourceView;
				FundingGrid.DataSource = view;
                FundingGrid.DataBind();
            }
        }

        protected void FundingGrid_RowCreated(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                if (e.Row.DataItem != null)
                    e.Row.Attributes.Add("onclick", "goToFunding(" + ((System.Data.DataRowView)(e.Row.DataItem)).Row["FundingSourceId"] + "," + projectId + ");");
            }
        }

        /// <summary>
        /// Handle sorting of grid
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void FundingGrid_Sorting(object sender, GridViewSortEventArgs e)
        {
            GridViewSortExpression = e.SortExpression;
            GridViewSortDirection = e.SortDirection == SortDirection.Ascending ? "ASC" : "DESC";
            string sortExpr = string.Format("{0} {1}", GridViewSortExpression, GridViewSortDirection);
            LoadFundingGrid(sortExpr);
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
            FundingGrid.Sort(sortExpr, sortDir);
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
