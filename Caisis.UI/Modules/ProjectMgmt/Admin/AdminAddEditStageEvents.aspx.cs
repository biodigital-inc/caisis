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
using Caisis.UI.Core.Classes;
using Caisis.UI.Core.Classes.CustomControls;

namespace Caisis.UI.Modules.ProjectMgmt
{
    public partial class AdminAddEditStageEvents : ProjectMgmtBasePage
    {

        private int projectId = -1;

        ProjectManagementDa da = new ProjectManagementDa();

        protected DataView organizationListDataView;

        // Contains a list of all events which belong to this Project (for individual orgs and at project level)
        protected DataView allProjectStageEvents;

        // A View of all stages across a project, including those at a Project Level
        // and those at an organization level
        protected DataView orgStageRecords;

        protected override void Page_Load(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(ProjectId))
            {
                Response.End();
            }
            else
            {
                projectId = int.Parse(ProjectId);
            }
            if (!Page.IsPostBack)
            {
				//ProjectStage stages = new ProjectStage();
				//stages.GetByParent(projectId);
				//if (stages.RecordCount == 0)
				if (BusinessObject.GetByParent<ProjectStage>(projectId).Count() == 0)
                {
                    ProjectMgmtUtil.CreateProjectChildRecords(projectId);
                }
                BuildCheckBoxMatrix();
            }
            SetContentVisibility();
        }

        private void SetContentVisibility()
        {
            if (!string.IsNullOrEmpty(GetQueryValue("isWizard")) && bool.Parse(GetQueryValue("isWizard")) == false)
            {
                SaveBtn.Visible = true;
                WizardTitle.Visible = false;
                BackBtn.Visible = false;
                DoneBtn.Visible = false;
            }
            else
            {
                SaveBtn.Visible = false;
                WizardTitle.Visible = true;
                BackBtn.Visible = true;
                DoneBtn.Visible = true;
            }
        }

        /// <summary>
        /// Builds checkbox matrix to allow selecting organizations and stages
        /// </summary>
        private void BuildCheckBoxMatrix()
        {
            
            LookupCodeDa lookupDa = new LookupCodeDa();

            // Set Global Organization List (controls columns)
            organizationListDataView = da.GetAllOrganizationsByProjectId(projectId).DefaultView;
            allProjectStageEvents = da.GetStageEventsByProject(projectId).DefaultView;

            // Determine if we need to filter organization
            if (!string.IsNullOrEmpty(OrganizationId))
            {
                organizationListDataView.RowFilter = ProjectOrganization.OrganizationId + " = " + OrganizationId;
            }

            // Gets all Stage names based on Lookup Codes
            DataTable stagesLkpCodes = lookupDa.GetLookupsByFieldName("ProjectStages").Tables[0];

            // Bind Organization Header Items
            OrgListRptr.DataSource = organizationListDataView;
            OrgListRptr.DataBind();

            // Bind Stages
			//ProjectStage projectStages = new ProjectStage();
			//projectStages.GetByParent(projectId);
			//orgStageRecords = projectStages.DataSourceView;

			orgStageRecords = BusinessObject.GetByParentAsDataView<ProjectStage>(projectId);

            if (orgStageRecords.Count == 0)
            {
				ProjectMgmtUtil.CreateProjectChildRecords(projectId);
				//projectStages.GetByParent(projectId);
				//orgStageRecords = projectStages.DataSourceView;

				orgStageRecords = BusinessObject.GetByParentAsDataView<ProjectStage>(projectId);
            }

            orgStageRecords.RowFilter = ProjectStage.OrganizationId + " IS NULL";

            //StagesRptr.DataSource = stagesLkpCodes;
            StagesRptr.DataSource = orgStageRecords;
            StagesRptr.DataBind();
        }

        /// <summary>
        /// Sets values for each stage
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void BindProjectStageEvents(object sender, RepeaterItemEventArgs e)
        {
            // Row For Stages (Item Template)
            if (e.Item.DataItem != null)
            {
                int stageId = int.Parse(DataBinder.Eval(e.Item.DataItem, ProjectStage.StageId).ToString());
                string stageName = DataBinder.Eval(e.Item.DataItem, ProjectStage.Name).ToString();
                string stageColorCode = DataBinder.Eval(e.Item.DataItem, ProjectStage.ColorCode).ToString();

                HiddenField projectStageId = e.Item.FindControl("ProjectStageId") as HiddenField;
                projectStageId.Value = stageId.ToString();

                Label stageLabel = e.Item.FindControl("StageLabel") as Label;
                stageLabel.Text = stageName;

                HiddenField stageColor = e.Item.FindControl("StageColor") as HiddenField;
                stageColor.Value = stageColorCode;

                Repeater OrgSingleStageRptr = e.Item.FindControl("OrgSingleStageRptr") as Repeater;
                if (OrgSingleStageRptr != null)
                {
                    OrgSingleStageRptr.DataSource = organizationListDataView;
                    OrgSingleStageRptr.DataBind();
                }

                // Get a list of Events which belong to this stage
				//ProjectStageEvent stageEvents = new ProjectStageEvent();
				//stageEvents.GetByParent(stageId);
                DataView dv = da.GetStageEvents(stageId).DefaultView;
                dv.Sort = "SortOrder";

                // Binds Rows of Events which belong to Stage
                Repeater projectStageEventsRptr = e.Item.FindControl("ProjectStageEventsRptr") as Repeater;
                //projectStageEventsRptr.DataSource = stageEvents.DataSourceView;
				projectStageEventsRptr.DataSource = dv;
                projectStageEventsRptr.DataBind();


                Panel stageCheckBoxContainer = e.Item.FindControl("DoCheckBoxContainer") as Panel;
                if (!string.IsNullOrEmpty(stageColorCode))
                {
                    stageCheckBoxContainer.Style["border"] = "2px solid " + stageColorCode;
                }
            }

        }

        /// <summary>
        /// For each Stage, set values for each organization
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void SetSingleStageEvents(object sender, RepeaterItemEventArgs e)
        {
            // Set Organization Id
            int orgId = int.Parse(DataBinder.Eval(e.Item.DataItem, ProjectOrganization.OrganizationId).ToString());
            HiddenField orgIdField = e.Item.FindControl("OrgIdField") as HiddenField;
            orgIdField.Value = orgId.ToString();

            // Get Stage Name from containg RepeaterItem
            Repeater orgStageRptr = e.Item.NamingContainer as Repeater;
            RepeaterItem stageRow = orgStageRptr.NamingContainer as RepeaterItem;
            string stageName = DataBinder.Eval(stageRow.DataItem, ProjectStage.Name).ToString();
            string stageColorCode = DataBinder.Eval(stageRow.DataItem, ProjectStage.ColorCode).ToString();

            // Set StageId for this Organization if its has a stage row this row
            HiddenField orgStageIdField = e.Item.FindControl("OrgStageIdField") as HiddenField;
            CheckBox orgStageCheckBox = e.Item.FindControl("StageCheckBox") as CheckBox;

            // Search master stage records for a recording belong to this org
            string filterClause = ProjectStage.OrganizationId + " = " + orgId + " AND " + ProjectStage.Name + " = '" + stageName.Replace("'", "''") + "'";
            DataRow[] orgStages = orgStageRecords.Table.Select(filterClause);

            // If records were found, check off box and sets its stage id
            if (orgStages.Length > 0)
            {
                DataRow orgStage = orgStages[0];
                int orgStageId = int.Parse(orgStage[ProjectStage.StageId].ToString());
                orgStageIdField.Value = orgStageId.ToString();
                orgStageCheckBox.Checked = true;
            }
            else
            {
                orgStageIdField.Value = string.Empty;
                orgStageCheckBox.Checked = false;
            }


            if (!string.IsNullOrEmpty(stageColorCode))
            {
                orgStageCheckBox.Style["border"] = "2px solid " + stageColorCode;
            }
        }

        /// <summary>
        /// Bind attributes for each stage
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void BindProjectStageEventAttributes(object sender, RepeaterItemEventArgs e)
        {
            int projectStageEventId = int.Parse(DataBinder.Eval(e.Item.DataItem, ProjectStageEvent.StageEventId).ToString());


            Label eventName = e.Item.FindControl("StageEventLabel") as Label;
            eventName.Text = DataBinder.Eval(e.Item.DataItem, ProjectStageEvent.Name).ToString();

            HiddenField stageEventId = e.Item.FindControl("StageEventIdField") as HiddenField;
            stageEventId.Value = projectStageEventId.ToString();

			//ProjectEventAttribute stageEventAttributes = new ProjectEventAttribute();
			//stageEventAttributes.GetByParent(projectStageEventId);

			//eventAttributes.DataSource = stageEventAttributes.DataSourceView;
            /*
            Repeater eventAttributes = e.Item.FindControl("ProjectStageEventAttributesRptr") as Repeater;
            eventAttributes.DataSource = BusinessObject.GetByParentAsDataView<ProjectEventAttribute>(projectStageEventId);
            eventAttributes.DataBind();
            */

            // Bind Empty Columns For Orgs
            Repeater OrgStageEventRptr = e.Item.FindControl("OrgStageEventRptr") as Repeater;
            if (OrgStageEventRptr != null)
            {
                OrgStageEventRptr.DataSource = organizationListDataView;
                OrgStageEventRptr.DataBind();

                // Check individual organization's stage
                foreach (RepeaterItem item in OrgStageEventRptr.Items)
                {
                    ProjectManagementDa da = new ProjectManagementDa();
                    CheckBox orgStageEventCheckBox = item.FindControl("OrgStageEventCheckBox") as CheckBox;
                    HiddenField orgIdField = item.FindControl("OrgIdField") as HiddenField;

                    if (orgStageEventCheckBox != null && !string.IsNullOrEmpty(orgIdField.Value))
                    {
                        string eventExistsSQL = ProjectStage.OrganizationId + " IS NOT NULL AND " + ProjectStage.OrganizationId + " = " + orgIdField.Value + " AND " + ProjectStageEvent.Name + " = '" + eventName.Text.Replace("'", "''") + "'";
                        if (allProjectStageEvents.Table.Select(eventExistsSQL).Length > 0)
                        {
                            orgStageEventCheckBox.Checked = true;
                        }
                        else
                        {
                            orgStageEventCheckBox.Checked = false;
                        }
                    }
                }
            }
        }


        protected void SetOrgIdField(object sender, RepeaterItemEventArgs e)
        {
            string orgId = DataBinder.Eval(e.Item.DataItem, ProjectOrganization.OrganizationId).ToString();
            HiddenField orgIdField = e.Item.FindControl("OrgIdField") as HiddenField;
            orgIdField.Value = orgId;
        }


        /// <summary>
        /// Creates a new stage record
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void CreateOrganizationStageRecord(object sender, EventArgs e)
        {

            CaisisCheckBox eventCheckBox = sender as CaisisCheckBox;

            // Only need to save if checked
            if (eventCheckBox.Checked)
            {
                ProjectStage biz = new ProjectStage();

                RepeaterItem rptrItem = eventCheckBox.NamingContainer as RepeaterItem;
                HiddenField orgIdField = rptrItem.FindControl("OrgIdField") as HiddenField;
                HiddenField stageIdField = rptrItem.FindControl("OrgStageIdField") as HiddenField;
                HiddenField projectStageId = rptrItem.NamingContainer.NamingContainer.FindControl("ProjectStageId") as HiddenField;
                Label sName = rptrItem.NamingContainer.NamingContainer.FindControl("StageLabel") as Label;
                HiddenField sColor = rptrItem.NamingContainer.NamingContainer.FindControl("StageColor") as HiddenField;
                // Only save a new stage record if one doesn't exist
                if (string.IsNullOrEmpty(stageIdField.Value))
                {
                    int orgId = int.Parse(orgIdField.Value);
                    int projStageId = int.Parse(projectStageId.Value);
                    string stageName = sName.Text;

                    ProjectStage stageBiz = new ProjectStage();
                    stageBiz[ProjectStage.ProjectId] = projectId;
                    stageBiz[ProjectStage.OrganizationId] = orgId;
                    stageBiz[ProjectStage.Name] = stageName;
                    stageBiz[ProjectStage.ColorCode] = sColor.Value;
                    stageBiz.Save();

                    int orgStageId = int.Parse(stageBiz[ProjectStage.StageId].ToString());
                    stageIdField.Value = orgStageId.ToString();
                }
            }
        }


        /// <summary>
        /// When an organization's event checkbox is checked, it will create a 
        /// new event record using the row's event name
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void CreateOrganizationStageEventRecord(object sender, EventArgs e)
        {
            CheckBox eventCheckBox = sender as CheckBox;
            if (eventCheckBox != null && eventCheckBox.Checked)
            {
                int colIndex = (eventCheckBox.NamingContainer as RepeaterItem).ItemIndex;
                int rowIndex = (eventCheckBox.NamingContainer.NamingContainer.NamingContainer.NamingContainer.NamingContainer as RepeaterItem).ItemIndex;

                HiddenField projectStageEventIdField = eventCheckBox.NamingContainer.NamingContainer.NamingContainer.FindControl("StageEventIdField") as HiddenField;

                Repeater stagesRptr = eventCheckBox.NamingContainer.NamingContainer.NamingContainer.NamingContainer.NamingContainer.NamingContainer as Repeater;
                RepeaterItem stageItem = stagesRptr.Items[rowIndex];
                Repeater orgStageRptr = stageItem.FindControl("OrgSingleStageRptr") as Repeater;

                string eventName = (eventCheckBox.NamingContainer.NamingContainer.NamingContainer.FindControl("StageEventLabel") as Label).Text;
                HiddenField parentStageId = orgStageRptr.Items[colIndex].FindControl("OrgStageIdField") as HiddenField;

                // Create a new BusinessObject
                ProjectStageEvent eventBiz = new ProjectStageEvent();
                // Set required fields
                eventBiz[ProjectStageEvent.StageId] = int.Parse(parentStageId.Value);
                eventBiz[ProjectStageEvent.Name] = eventName;
                // Save New Event Record
                eventBiz.Save();

                int projectStageEventId = int.Parse(projectStageEventIdField.Value);
                int stageEventId = int.Parse(eventBiz[ProjectStageEvent.StageEventId].ToString());
                CreateChildEventAttributesFromEvent(stageEventId, projectStageEventId);
            }
        }

        /// <summary>
        /// Occurs after the list of checkboxes have updated
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void HandleMatrixUpdated(object sender, EventArgs e)
        {
            BuildCheckBoxMatrix();
        }

        private void CreateChildEventAttributesFromEvent(int orgStageEventId, int baseEventId)
        {
			//ProjectEventAttribute projectStageEventAttributes = new ProjectEventAttribute();
			//projectStageEventAttributes.GetByParent(baseEventId);

			DataView view = BusinessObject.GetByParentAsDataView<ProjectEventAttribute>(baseEventId);

            //foreach (DataRow projectEventAtt in projectStageEventAttributes.DataSourceView.Table.Rows)
			foreach (DataRow projectEventAtt in view.Table.Rows)
            {
                // Create a new attribute based on project event's attributes
                ProjectEventAttribute orgStageEventAtt = new ProjectEventAttribute();
                orgStageEventAtt[ProjectEventAttribute.AttributeName] = projectEventAtt[ProjectEventAttribute.AttributeName];
                orgStageEventAtt[ProjectEventAttribute.StageEventId] = orgStageEventId;
                orgStageEventAtt.Save();
            }

        }

        #region CLICK EVENTS

        /// <summary>
        /// Occurs when clicking on back button on wizard
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void OnBackClick(object sender, EventArgs e)
        {
            Response.Redirect("AdminAddEditInstitutionAndContacts.aspx?projectId=" + projectId + "&editType=Contacts&isWizard=true");
        }

        /// <summary>
        /// Occurs when clicking done button on wizard
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void OnDoneClick(object sender, EventArgs e)
        {
            HandleMatrixUpdated(sender, e);
            Response.Redirect("../EditProject.aspx?projectId=" + projectId);
        }

        protected void OnSaveClick(object sender, EventArgs e)
        {
            HandleMatrixUpdated(sender, e);
            Page.ClientScript.RegisterStartupScript(this.GetType(), "CloseModal", "if(top.hideModal) { top.hideModal(); }", true);
        }

        #endregion
    }
}
