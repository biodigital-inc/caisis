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
using Caisis.BOL;
using Caisis.UI.Core.Classes.CustomControls;

namespace Caisis.UI.Modules.ProjectMgmt
{
    public partial class ProjectManuscriptDetailsEdit : ProjectMgmtBasePage
    {
        protected int manuscriptId = -1;
        protected int projectId = -1;

        protected override void Page_Load(object sender, EventArgs e)
        {
            base.Page_Load(sender, e);
            this.EnableViewState = true;
            if (Request.QueryString["projectId"] != null)
            {
                projectId = Int32.Parse(ProjectId);
            }

            if (IsPostBack)
            {
                if (manuscriptId == -1 && ManuscriptIdField.Value != null)
                    manuscriptId = Int32.Parse(ManuscriptIdField.Value.ToString());
            }
            else if (Request.QueryString["manuscriptId"] != null)
            {
                ManuscriptIdField.Value = Request.QueryString["manuscriptId"];
                manuscriptId = Int32.Parse(Request.QueryString["manuscriptId"]);
            }


            if (!IsPostBack)
            {
                PopulateJournals();
                //
                // Reload the fields from the database
                //
                ReloadAllFields();

                SetControlState();
            }
        }

        public void SetControlState()
        {
            if (StatusEdit.Value == "Publication")
            {
                EditCitationsPanel.Attributes["style"] = "display: block;";
                CitationsLabel.Attributes["style"] = "display: block;";
                divPublication.Attributes["style"] = "display: block;";
            }
            else
            {
                EditCitationsPanel.Attributes["style"] = "display: none;";
                CitationsLabel.Attributes["style"] = "display: none;";
                divPublication.Attributes["style"] = "display: none;";
            }
        }

        private void PopulateJournals()
        {
			//ProjectJournal journalBiz = new ProjectJournal();

			//journalBiz.GetAll();

            JournalId.DataTextField = "ShortName";
            JournalId.DataValueField = "JournalId";
            //JournalId.DataSource = journalBiz.DataSourceView;
			JournalId.DataSource = BusinessObject.GetAllAsDataView<ProjectJournal>();
            JournalId.DataBind();
        }

        private void PopulateManuscriptInfo()
        {
            BOL.ProjectManuscript biz = new BOL.ProjectManuscript();

            biz.Get(manuscriptId);
            CICHelper.SetFieldValues(PanelManuscriptInfo.Controls, biz);
        }

        // Populate the contacts select control
        private void PopulateSelect(string selectControlName, string selectControlFooterName, GridViewRowEventArgs e)
        {
            ProjectManagementDa projDA = new ProjectManagementDa();

            CaisisSelect selectName = null;

            GridViewRow currentRow = e.Row;
            if (e.Row.RowIndex > -1)
            {
                selectName = currentRow.FindControl(selectControlName) as CaisisSelect;
            }
            else if (e.Row.RowType == DataControlRowType.Footer)
                selectName = currentRow.FindControl(selectControlFooterName) as CaisisSelect;

            if (selectName != null)
            {
                selectName.DataTextField = "Name";
                selectName.DataValueField = "ContactId";
                selectName.DataSource = projDA.GetAllContacts();
                selectName.DataBind();
            }
        }

        protected void ManuscriptAuthorGridView_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            PopulateSelect("ManuscriptInfoAuthorName", "ManuscriptInfoAuthorNameFooter", e);
        }

        protected void ManuscriptEventGridView_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            PopulateSelect("ProjectManuscriptEventName", "", e);
        }

        protected void ProjectManuscriptEventGridView_RowDeleted(object sender, GridViewDeletedEventArgs e)
        {
            PopulateManuscriptEventGrid();
        }

        private void PopulateManuscriptEventGrid()
        {
            ProjectManagementDa projDA = new ProjectManagementDa();

            DataTable dt = projDA.GetManuscriptInfo(manuscriptId);

            ProjectManuscriptEventGridView.DataSource = dt;
            ProjectManuscriptEventGridView.DataBind();
        }

        private void PopulateManuscriptAuthorsGrid()
        {
            ProjectManagementDa projDA = new ProjectManagementDa();

            DataTable dt = projDA.GetAuthorsByManuscriptId(manuscriptId);

            DataView dv = dt.DefaultView;
            dv.Table.Columns.Add("AuthorOrderInt", typeof(int), "IsNull(AuthorOrder, 100000)");
            dv.Sort = "AuthorOrderInt";

            ManuscriptAuthorGridView.DataSource = dv;
            ManuscriptAuthorGridView.DataBind();

        }

        private void PopulatePublicationCitationGrid()
        {
			//ProjectManuscriptCitation biz = new ProjectManuscriptCitation();

			//biz.GetByParent(manuscriptId);

			//PublicationCitationGridView.DataSource = biz.DataSourceView;
			PublicationCitationGridView.DataSource = BusinessObject.GetByParentAsDataView<ProjectManuscriptCitation>(manuscriptId);
            PublicationCitationGridView.DataBind();
        }


        protected void UpdateEventsButton_Click(object sender, EventArgs e)
        {
            //
            // Save the Manuscript Info fields
            //
            BOL.ProjectManuscript biz = new BOL.ProjectManuscript();

            if (manuscriptId != -1)
                biz.Get(manuscriptId);

            if (projectId != -1)
                CICHelper.SetBOValues(PanelManuscriptInfo.Controls, biz, projectId);
            else
                CICHelper.SetBOValues(PanelManuscriptInfo.Controls, biz, 0);

            if (biz.HasField(BOL.ProjectManuscript.ProjectId))
                biz[BOL.ProjectManuscript.JournalId] = Request.Form["JournalId"];

            biz.Save();

            if (biz["ManuscriptId"].ToString() != "")
            {
                manuscriptId = Int32.Parse(biz["ManuscriptId"].ToString());
                ManuscriptIdField.Value = biz["ManuscriptId"].ToString();
            }

            //
            // Save Authors Grid
            //
            ManuscriptAuthorGridView.Save(manuscriptId);

            //
            // Save Events Grid
            //
            ProjectManuscriptEventGridView.Save(manuscriptId);

            //
            // Save Citations Grid
            //
            PublicationCitationGridView.Save(manuscriptId);

            GoToMainList();
        }

        protected void CancelEventsButton_Click(object sender, EventArgs e)
        {
            GoToMainList();
        }

        private void ReloadAllFields()
        {
            //
            // Reload the Manuscript Info fields
            //
            PopulateManuscriptInfo();

            //
            // Reload Authors Grid
            //
            PopulateManuscriptAuthorsGrid();

            //
            // Reload Events Grid
            //
            PopulateManuscriptEventGrid();

            //
            // Reload Citations Grid 
            //
            PopulatePublicationCitationGrid();
        }

        protected void DeleteButton_Click(object sender, EventArgs e)
        {
            if (manuscriptId > -1)
            {
                BOL.ProjectManuscript biz = new BOL.ProjectManuscript();
                biz.Delete(manuscriptId);

                RefreshAndGoToMainList();
            }
        }

        /// <summary>
        /// Signals list to refresh
        /// </summary>
        private void RefreshAndGoToMainList()
        {
            RegisterRefreshScript(projectId, -1);
        }

        /// <summary>
        /// Signals list to refresh
        /// </summary>
        private void GoToMainList()
        {
            RegisterRefreshScript(projectId, manuscriptId);
        }

        /// <summary>
        /// Registers a startup script to refresh main page (which opened editor)
        /// </summary>
        /// <param name="pId"></param>
        /// <param name="manId"></param>
        private void RegisterRefreshScript(int pId, int manId)
        {
            string qs = "?projectId=" + pId + "&manuscriptId=" + manId;
            base.RegisterUpdatePageScript(qs, true);
        }
    }
}