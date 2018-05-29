using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using Caisis.BOL;
using Caisis.DataAccess;

namespace Caisis.UI.Modules.ProjectMgmt
{
    public partial class ProjectLOIResponse : ProjectMgmtBasePage
    {
        protected int ProjectLetterOfIntentId = -1;
        protected int LOIId = -1;

        protected override void Page_Load(object sender, EventArgs e)
        {
            base.Page_Load(sender, e);
            this.EnableViewState = true;

            if (!string.IsNullOrEmpty(Request.QueryString["ProjectLetterOfIntentId"]))
            {
                ProjectLetterOfIntentId = Int32.Parse(Request.QueryString["ProjectLetterOfIntentId"]);
            }
            else
                GetProjectLetterOfIntentId();

            if (!string.IsNullOrEmpty(Request.QueryString["ProjectLOIResponseId"]))
                LOIId = Int32.Parse(Request.QueryString["ProjectLOIResponseId"]);

            if (!IsPostBack)
                LoadResponseGrid("");


            if (LOIId != -1)
            {
                LOIResponseDetailsPage.Attributes["src"] = "ProjectLOIResponseDetails.aspx?ProjectLetterOfIntentId=" + ProjectLetterOfIntentId + "&ProjectLOIResponseId=" + LOIId;
                SetGridViewSelectedByKey();
                LOIResponseDetailsPage.Style["display"] = "";
            }
            else
            {
                LOIResponseDetailsPage.Style["display"] = "none";
            }

            EditButton.OnClientClick = "AddNewResponse(" + ProjectLetterOfIntentId + "); return false;";

        }

        private void GetProjectLetterOfIntentId()
        {
            int projectId = -1;
            if (!string.IsNullOrEmpty(ProjectId))
            {
                projectId = int.Parse(ProjectId);
            }

            if (projectId != -1)
            {
				//ProjectLetterOfIntent biz = new ProjectLetterOfIntent();
				//biz.GetByParent(projectId);

				//if (biz.RecordCount > 0)
				//	ProjectLetterOfIntentId = Int32.Parse(biz["ProjectLetterOfIntentId"].ToString());

				var letters = BusinessObject.GetByParent<ProjectLetterOfIntent>(projectId);

				if (letters.Count() > 0)
                    ProjectLetterOfIntentId = Int32.Parse(letters.First()["ProjectLetterOfIntentId"].ToString());
            }
        }

        private void SetGridViewSelectedByKey()
        {
            if (ResponseGrid.DataSource != null)
            {
                DataView dv = (DataView)ResponseGrid.DataSource;
                for (int i = 0; i < dv.Table.Rows.Count; i++)
                {
                    if (LOIId == Int32.Parse(dv.Table.Rows[i]["ProjectLOIResponseId"].ToString()))
                    {
                        ResponseGrid.Rows[i].CssClass = "datGridItemClick";
                        break;
                    }
                }
            }
        }

        private void LoadResponseGrid(string sortExpr)
        {
            ProjectManagementDa projDA = new ProjectManagementDa();
            DataTable dt = projDA.GetLOIResponse(ProjectLetterOfIntentId);

            dt.DefaultView.Sort = sortExpr;

            if (dt.DefaultView.Table.Rows.Count == 0)
                EmptyMessageLabel.Visible = true;
            else
            {
                EmptyMessageLabel.Visible = false;
                ResponseGrid.DataSource = dt.DefaultView;
                ResponseGrid.DataBind();
            }
        }

        protected void ResponseGrid_RowCreated(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                if (e.Row.DataItem != null)
                    e.Row.Attributes.Add("onclick", "goToResponse(" + ((System.Data.DataRowView)(e.Row.DataItem)).Row["ProjectLOIResponseId"] + "," + ProjectLetterOfIntentId + ");");
            }
        }

        /// <summary>
        /// Handle sorting of grid
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void ResponseGrid_Sorting(object sender, GridViewSortEventArgs e)
        {
            GridViewSortExpression = e.SortExpression;
            GridViewSortDirection = e.SortDirection == SortDirection.Ascending ? "ASC" : "DESC";
            string sortExpr = string.Format("{0} {1}", GridViewSortExpression, GridViewSortDirection);
            LoadResponseGrid(sortExpr);
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
            ResponseGrid.Sort(sortExpr, sortDir);
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