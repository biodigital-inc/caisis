using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

using Caisis.UI.Core.Classes;
using Caisis.DataAccess;
using Caisis.BOL;
using Caisis.UI.Core.Classes.CustomControls;
using System.Collections.Generic;

namespace Caisis.UI.Modules.ProjectMgmt
{
    public partial class ProjectSummary : ProjectMgmtBasePage
    {
        protected int projectId;
        protected override void Page_Load(object sender, EventArgs e)
        {
            base.Page_Load(sender, e);
            if (!string.IsNullOrEmpty(ProjectId))
            {
                projectId = int.Parse(ProjectId);
                if (!Page.IsPostBack)
                {
                    SetView();
                }
            }
        }

        /// <summary>
        /// Determine if high level or organization level view of project summary
        /// </summary>
        protected void SetView()
        {
            SetFields(projectId);
            if (!string.IsNullOrEmpty(OrganizationId))
            {
                int orgId = int.Parse(OrganizationId);
                if (orgId > -1)
                {
                    SetOrganizationLevelView(orgId);
                }
                else
                {
                    SetAdminLevelView(projectId);
                }
            }
            else
            {
                SetAdminLevelView(projectId);
            }
        }

        /// <summary>
        /// Sets the data entry fields and binds grids
        /// </summary>
        /// <param name="projectId"></param>
        protected void SetFields(int projectId)
        {
            Project biz = new Project();
            biz.Get(projectId);
            CICHelper.SetFieldValues(this.Controls, biz);
            SetAddForms(biz["AdditionalFormNames"].ToString());
            BindGrids(projectId);
        }

        private void SetAddForms(string strAddForm)
        {
            if (!String.IsNullOrEmpty(strAddForm))
            {
                if (IncludeFormRadioList.Items.FindByValue(strAddForm) != null)
                    IncludeFormRadioList.SelectedValue = strAddForm;
            }
            else
            {
                if (IncludeFormRadioList.Items.FindByValue("None") != null)
                    IncludeFormRadioList.SelectedValue = "None";
            }
        }

        /// <summary>
        /// Binds the various summary info grids
        /// </summary>
        /// <param name="projectId"></param>
        protected void BindGrids(int projectId)
        {
            ProjectManagementDa da = new ProjectManagementDa();

            OrganizationsGrid.DataSource = da.GetAllOrganizationsSortedByProjectId(projectId);
            OrganizationsGrid.DataBind();

            ContactsGrid.DataSource = da.GetProjectContactsByProjectId(projectId);
            ContactsGrid.DataBind();

			//BusinessObject.ProjectManuscript bizMan = new BusinessObject.ProjectManuscript();
			//bizMan.GetByParent(projectId);
			//ManuscriptGrid.DataSource = bizMan.DataSourceView;
			ManuscriptGrid.DataSource = BusinessObject.GetByParentAsDataView<BOL.ProjectManuscript>(projectId);
            ManuscriptGrid.DataBind();

			//ProjectFundingSource biz = new ProjectFundingSource();
			//biz.GetByParent(projectId);
			//FundingGrid.DataSource = biz.DataSourceView;
			FundingGrid.DataSource = BusinessObject.GetByParentAsDataView<ProjectFundingSource>(projectId);
            FundingGrid.DataBind();
        }

        protected void SetAdminLevelView(int projectId)
        {
            OrganizationsGrid.Visible = true;
            ContactsGrid.Visible = true;
            OrgAddress.Visible = false;
        }

        /// <summary>
        /// 
        /// </summary>
        protected void SetOrganizationLevelView(int orgId)
        {
            // Load record from BusinessObject
            ProjectOrganization org = new ProjectOrganization();
            org.Get(orgId);
            // Set Heading And Hide Grid
            OrgHeading.Text = "Organization";
            OrganizationsGrid.Visible = false;
            ContactsGrid.Visible = false;

            OrgAddress.Visible = true;
            // Set Address
            OrgName.Text = org[ProjectOrganization.Name].ToString();
            OrgShortName.Text = org[ProjectOrganization.ShortName].ToString();
            OrgAddress1.Text = org[ProjectOrganization.Address1].ToString();
            OrgAddress2.Text = org[ProjectOrganization.Address2].ToString();
            OrgCity.Text = org[ProjectOrganization.City].ToString();
            OrgState.Text = org[ProjectOrganization.State].ToString();
            OrgPostal.Text = org[ProjectOrganization.PostalCode].ToString();

            ProjectManagementDa da = new ProjectManagementDa();
            // Filter list of contacts in this project by this organization
            DataView orgsContacts = da.GetAllContactsWithOrgNameByProjectId(projectId).DefaultView;
            orgsContacts.RowFilter = ProjectOrganization.OrganizationId + " = " + OrganizationId;
            OrgContactsRptr.DataSource = orgsContacts;
            OrgContactsRptr.DataBind();
        }

        protected void ContactsGrid_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            BindRow(sender, e, "ProjectContacts.aspx", "ContactId", "&FilterBy=Projects&FilterId=" + projectId + "&contactType=Project", "Contacts");
        }
        protected void OrganizationsGrid_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            //          BindRow(sender, e, "ProjectOrgs.aspx", "OrganizationId", "", "Organizations");
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                if (e.Row.DataItem != null)
                {
                    string rowOrgId = DataBinder.Eval(e.Row.DataItem, ProjectOrganization.OrganizationId).ToString();
                    string rowColorCode = DataBinder.Eval(e.Row.DataItem, ProjectOrganization.ColorCode).ToString();

                    // Go to organization view on click
                    e.Row.Attributes["onclick"] = "goToOrganizationView('" + rowOrgId + "')";

                    // Set color box for organization
                    Label colorCodeBox = e.Row.FindControl("OrgColorCode") as Label;
                    if (!string.IsNullOrEmpty(rowColorCode) && colorCodeBox != null)
                    {
                        colorCodeBox.Style[HtmlTextWriterStyle.BackgroundColor] = rowColorCode;
                    }
                }
            }


        }
        protected void ManuscriptGrid_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            BindRow(sender, e, "ProjectManuscript.aspx", "ManuscriptId", "", "Manuscripts");
        }
        protected void FundingGrid_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            BindRow(sender, e, "ProjectFunding.aspx", "FundingSourceId", "", "Funding");
        }

        private void BindRow(object sender, GridViewRowEventArgs e, string strPage, string strId, string strOptional, string strPageLink)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                if (e.Row.DataItem != null)
                {
                    e.Row.Attributes.Add("onclick", "goToLink('" + strPage + "?projectId=" + projectId + "&" + strId + "=" + ((System.Data.DataRowView)(e.Row.DataItem)).Row[strId] + strOptional + "','" + strPageLink + "');");
                }
            }
        }

        protected void UpdateProjectRecord(object sender, EventArgs e)
        {
            Project biz = new Project();
            biz.Get(projectId);

            List<ICaisisInputControl> cicList = PageUtil.GetCaisisInputControlsInContainer(Form);
            foreach (ICaisisInputControl cic in cicList)
            {
                if (biz.TableName == cic.Table && biz.HasField(cic.Field))
                {
                    if (cic.Enabled)
                        biz[cic.Field] = cic.Value;
                }
            }

            bool bAddFormChanged = false;

            if (biz["AdditionalFormNames"] != IncludeFormRadioList.SelectedValue)
            {
                biz["AdditionalFormNames"] = IncludeFormRadioList.SelectedValue;
                bAddFormChanged = true;
            }

            //CICHelper.SetBOValues(Form.Controls, biz, -1);
            biz.Save();

            SetView();

            if (bAddFormChanged)
            {
                AddNewLOIRecord();
                RefreshMainList();
            }
        }

        protected void PreviewDeleteProjectRecord(object sender, EventArgs e)
        {
            DataEntryLayer.Visible = false;
            DeleteLayer.Visible = true;

            Delete(true);
        }

 
        protected void DeleteProjectRecord(object sender, EventArgs e)
        {
            Delete(false);
        }

        // TODO: refactor into controller
        private void Delete(bool preview)
        {            
            // only module admin can delete projects
            if (!preview && UserType == ProjectMgmtUsers.ModuleAdmin)
            {
                // biz objects for deleting
                Project projectBiz = new Project();
                ProjectStage stageBiz = new ProjectStage();
                ProjectStageEvent eventBiz = new ProjectStageEvent();
                ProjectEventAttribute attributeBiz = new ProjectEventAttribute();

                // delete bottom -> up
                foreach (ProjectStage stage in BOL.BusinessObject.GetByParent<ProjectStage>(projectId))
                {
                    int stageId = (int)stage[stage.PrimaryKeyName];
                    foreach (ProjectStageEvent evt in BOL.BusinessObject.GetByParent<ProjectStageEvent>(stageId))
                    {
                        int eventId = (int)evt[evt.PrimaryKeyName];
                        foreach (ProjectEventAttribute attribute in BOL.BusinessObject.GetByParent<ProjectEventAttribute>(eventId))
                        {
                            int attributeId = (int)attribute[attribute.PrimaryKeyName];
                            // delete attribute
                            attributeBiz.Delete(attributeId);
                        }
                        // delete event
                        eventBiz.Delete(eventId);
                    }
                    // delete stage
                    stageBiz.Delete(stageId);
                }
                // delete project
                projectBiz.Delete(projectId);

                // reload browser
                Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "refreshBrowser", "window.top.location = window.top.location;", true);
            }
        }

        private void AddNewLOIRecord()
        {
            if (IncludeFormRadioList.SelectedValue.CompareTo("None") != 0)
            {
				//ProjectLetterOfIntent biz = new ProjectLetterOfIntent();
				//biz.GetByParent(projectId);
				//if (biz.RecordCount == 0)
				//{
				//    biz.NewRow();
				//    biz[ProjectLetterOfIntent.ProjectId] = projectId;
				//    if (biz.HasColumn(ProjectLetterOfIntent.CreationDate))
				//        biz[ProjectLetterOfIntent.CreationDate] = DateTime.Now;

				//    PopulateLOINumber(biz);
				//    biz.Save();
				//}
				//else
				//{
				//    if (PopulateLOINumber(biz))
				//        biz.Save();
				//}

				var criteria = new Dictionary<string, object>() { { ProjectLetterOfIntent.ProjectId, projectId } };

				ProjectLetterOfIntent biz;

				if (!BusinessObject.Exists<ProjectLetterOfIntent>(criteria))
				{
					biz = new ProjectLetterOfIntent();
					biz[ProjectLetterOfIntent.ProjectId] = projectId;
					if (biz.HasField(ProjectLetterOfIntent.CreationDate))
						biz[ProjectLetterOfIntent.CreationDate] = DateTime.Now;

					PopulateLOINumber(biz);
					biz.Save();
				}
				else
				{
					biz = BusinessObject.GetByParent<ProjectLetterOfIntent>(projectId).First();
				}
            }

        }

        private bool PopulateLOINumber(ProjectLetterOfIntent biz)
        {
            if (IncludeFormRadioList.SelectedValue.CompareTo("Letter Of Intent") == 0
                && biz.HasField(ProjectLetterOfIntent.LOINumber)
                && String.IsNullOrEmpty(biz[ProjectLetterOfIntent.LOINumber].ToString()))
            {
                ProjectManagementDa projDA = new ProjectManagementDa();
                biz[ProjectLetterOfIntent.LOINumber] = projDA.GetIDForLOI();

                return true;
            }

            return false;
        }

        /// <summary>
        /// Signals list to refresh
        /// </summary>
        private void RefreshMainList()
        {
            string strOrgId = "";
            if (!String.IsNullOrEmpty(OrganizationId))
                strOrgId = OrganizationId;
            string refreshList = "refreshList(" + projectId + ",'" + strOrgId + "');";
            Page.ClientScript.RegisterStartupScript(typeof(Page), "refreshList", refreshList, true);
        }
    }
}