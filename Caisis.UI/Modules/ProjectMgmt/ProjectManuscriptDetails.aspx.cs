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
    public partial class ProjectManuscriptDetails : ProjectMgmtBasePage
    {
        protected int manuscriptId = -1;
        public int projectId = -1;

        protected override void Page_Load(object sender, EventArgs e)
        {
            base.Page_Load(sender, e);
            if (Request.QueryString["projectId"] != null)
            {
                projectId = Int32.Parse(ProjectId);
            }

            if (IsPostBack)
            {
                if (manuscriptId == -1 && ManuscriptId.Value != null)
                    manuscriptId = Int32.Parse(ManuscriptId.Value.ToString());
            }
            else if (Request.QueryString["manuscriptId"] != null)
            {
                ManuscriptId.Value = Request.QueryString["manuscriptId"];
                manuscriptId = Int32.Parse(Request.QueryString["manuscriptId"]);
            }
            if (!IsPostBack)
            {
                ReloadAllFields();
            }

            SetControlState();
        }

        private void SetControlState()
        {
            if (manuscriptId == -1)
            {
                EditButton.Attributes["style"] = "display: none;";
                DeleteButton.Attributes["style"] = "display: none;";
                DisplayManuscriptPanel.Visible = false;
            }
            else
            {
                EditButton.Attributes["style"] = "display: block;";
                DeleteButton.Attributes["style"] = "display: block;";
            }

            if (Status.Text == "Publication")
            {
                divPublication.Attributes["style"] = "display: block;";
            }
            else
                divPublication.Attributes["style"] = "display: none;";
        }

        protected void BindManuscriptPanel()
        {
            BOL.ProjectManuscript biz = new BOL.ProjectManuscript();
            biz.Get(manuscriptId);

            foreach (string colName in biz.FieldNames)
            {
                Label field = DisplayManuscriptPanel.FindControl(colName) as Label;
                if (field != null)
                {
                    field.Text = biz[colName].ToString();
                }
            }

            PopulateJournalName(biz["JournalId"].ToString());
        }

        private void PopulateManuscriptEventGrid()
        {
            ProjectManagementDa projDA = new ProjectManagementDa();

            DataTable dt = projDA.GetManuscriptInfo(manuscriptId);

            ProjectManuscriptEventGridViewReadOnly.DataSource = dt;
            ProjectManuscriptEventGridViewReadOnly.DataBind();
        }

        private void PopulatePublicationCitationGrid()
        {
			//ProjectManuscriptCitation biz = new ProjectManuscriptCitation();

			//biz.GetByParent(manuscriptId);

			//ManuscriptCitationGridViewReadOnly.DataSource = biz.DataSourceView;
			ManuscriptCitationGridViewReadOnly.DataSource = 
				BusinessObject.GetByParentAsDataView<ProjectManuscriptCitation>(manuscriptId);
            ManuscriptCitationGridViewReadOnly.DataBind();
        }

        private void PopulateManuscriptAuthorsGrid()
        {
            ProjectManagementDa projDA = new ProjectManagementDa();

            DataTable dt = projDA.GetAuthorsByManuscriptId(manuscriptId);

            ManuscriptAuthorGridViewReadOnly.DataSource = dt;
            ManuscriptAuthorGridViewReadOnly.DataBind();

        }

        private void ReloadAllFields()
        {
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

            BindManuscriptPanel();
        }

        private void PopulateJournalName(string journalId)
        {
            if (string.IsNullOrEmpty(journalId))
                return;

            ProjectJournal biz = new ProjectJournal();

            biz.Get(Int32.Parse(journalId));

            JournalName.Text = biz["JournalName"].ToString();

        }

        protected void DeleteButton_Click(object sender, EventArgs e)
        {
            if (manuscriptId > -1)
            {
                BOL.ProjectManuscript biz = new BOL.ProjectManuscript();
                biz.Delete(manuscriptId);
            }

            RefreshMainList();
        }

        /// <summary>
        /// Signals list to refresh
        /// </summary>
        private void RefreshMainList()
        {
            string refreshList = "refreshList(-1, " + projectId + ");";
            Page.ClientScript.RegisterStartupScript(typeof(Page), "refreshList", refreshList, true);
        }

    }
}