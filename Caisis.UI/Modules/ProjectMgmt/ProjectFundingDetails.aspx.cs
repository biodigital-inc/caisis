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
    public partial class ProjectFundingDetails : ProjectMgmtDetailsPage
    {
        protected int fundingId = -1;
        public int projectId = -1;

        protected override void Page_Load(object sender, EventArgs e)
        {
            base.Page_Load(sender, e);
            this.EnableViewState = true;
            if (Request.QueryString["projectId"] != null)
            {
                projectId = Int32.Parse(ProjectId);
            }

            if (Request.QueryString["fundingId"] != null)
            {
                fundingId = Int32.Parse(Request.QueryString["fundingId"]);
            }

            EditButton.OnClientClick = "goToEditDetails(" + fundingId + "," + projectId + "); return false;";

            if (!IsPostBack)
            {
                BindFundingPanel();
                PopulateFundingInfo();
                PopulateFundingInvoiceGrid();
            }

            SetContentVisibility();
        }

        private void PopulateFundingInfo()
        {
            ProjectFundingSource biz = new ProjectFundingSource();

            biz.Get(fundingId);
            CICHelper.SetFieldValues(EditFundingPanel.Controls, biz);
        }

        private void PopulateFundingInvoiceGrid()
        {
			//ProjectInvoice biz = new ProjectInvoice();

			//biz.GetByParent(fundingId);

			DataView view = BusinessObject.GetByParentAsDataView<ProjectInvoice>(fundingId);

            //if (biz.DataSourceView.Table.Rows.Count == 0)
			if (view.Count == 0)
            {
                ViewInvoicesLabel.Visible = false;
                EditInvoicesLabel.Visible = false;
            }

            //FundingInvoiceGridViewReadOnly.DataSource = biz.DataSourceView;
			FundingInvoiceGridViewReadOnly.DataSource = view;
            FundingInvoiceGridViewReadOnly.DataBind();

            //ProjectInvoiceGridView.DataSource = biz.DataSourceView;
			ProjectInvoiceGridView.DataSource = view;
            ProjectInvoiceGridView.DataBind();
        }

        protected void UpdateButton_Click(object sender, EventArgs e)
        {
            //
            // Save the Funding Info fields
            //
            ProjectFundingSource biz = new ProjectFundingSource();

            if (fundingId != -1)
                biz.Get(fundingId);

            if (projectId != -1)
                CICHelper.SetBOValues(EditFundingPanel.Controls, biz, projectId);
            else
                CICHelper.SetBOValues(EditFundingPanel.Controls, biz, 0);

            biz.Save();

            if (biz["FundingSourceId"].ToString() != "")
            {
                fundingId = Int32.Parse(biz["FundingSourceId"].ToString());
            }

            ProjectInvoiceGridView.Save(fundingId);

            GoToMainList();
        }

        protected void BindFundingPanel()
        {
            ProjectFundingSource biz = new ProjectFundingSource();
            biz.Get(fundingId);

            foreach (string colName in biz.FieldNames)
            {
                Label field = DisplayFundingPanel.FindControl(colName) as Label;
                if (field != null)
                {
                    field.Text = biz[colName].ToString();
                }
            }

            DetailsHeader.Text = biz["Source"].ToString();
        }

        private void SetContentVisibility()
        {
            if (IsEditPage)
            {
                DisplayPanel.Visible = false;
                EditPanel.Visible = true;
            }
            else
            {
                DisplayPanel.Visible = true;
                EditPanel.Visible = false;
            }
        }

        protected void DeleteButton_Click(object sender, EventArgs e)
        {
            if (fundingId > -1)
            {
                ProjectFundingSource biz = new ProjectFundingSource();
                biz.Delete(fundingId);
            }

            if (!string.IsNullOrEmpty(Request.QueryString["edit"])
                && Request.QueryString["edit"] == "true")
            {
                RefreshAndGoToMainList();
            }
            else
            {
                RefreshMainList();
            }

        }

        /// <summary>
        /// Signals list to refresh
        /// </summary>
        private void RefreshAndGoToMainList()
        {
            Page.ClientScript.RegisterStartupScript(typeof(Page), "refreshList", "top.CURRENT_MODAL_CALLER.refreshList(-1," + projectId + "); top.hideModal();", true);
        }

        /// <summary>
        /// Signals list to refresh
        /// </summary>
        private void GoToMainList()
        {
            Page.ClientScript.RegisterStartupScript(typeof(Page), "refreshList", "top.CURRENT_MODAL_CALLER.refreshList(" + fundingId + "," + projectId + ");top.hideModal();", true);
        }

        /// <summary>
        /// Signals list to refresh
        /// </summary>
        private void RefreshMainList()
        {
            string refreshList = "refreshList(-1, " + projectId + ");";
            Page.ClientScript.RegisterStartupScript(typeof(Page), "refreshList", refreshList, true);
        }

        /// <summary>
        /// Registers a startup script to refresh main page (which opened editor)
        /// </summary>
        /// <param name="pId"></param>
        /// <param name="manId"></param>
        private void RegisterRefreshScript(int pId, int fundingId)
        {
            string qs = "?projectId=" + pId + "&fundingSourceId=" + fundingId;
            base.RegisterUpdatePageScript(qs, true);
        }
    }
}
