using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Collections.Generic;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

using Caisis.BOL;
using Caisis.UI.Core.Classes.CustomControls;
using Caisis.UI.Core.Classes;
using Caisis.DataAccess;


namespace Caisis.UI.Modules.ProjectMgmt
{
    public partial class ProjectOrgsDetails : ProjectMgmtDetailsPage
    {
        protected int orgId = -1;
        protected int projectId = -1;

        protected override void Page_Load(object sender, EventArgs e)
        {
            base.Page_Load(sender, e);

            // Set defaults based on query string
            projectId = !string.IsNullOrEmpty(ProjectId) ? int.Parse(ProjectId) : -1;
            orgId = !string.IsNullOrEmpty(OrganizationId) ? int.Parse(OrganizationId) : -1;

            if (!Page.IsPostBack)
            {
                OrgIdField.Value = orgId.ToString();
                if (orgId != -1)
                {
                    SetFormState(false);
                    SetFormFieldData(orgId);
                }
                else
                {
                    LoadBlankForm();
                }
            }
            else
            {
                // During postbacks, orgid is saved in hidden field, retrieve value
                if (!string.IsNullOrEmpty(OrgIdField.Value))
                {
                    orgId = int.Parse(OrgIdField.Value);
                }
            }
            SetContentVisibility();
        }

        /// <summary>
        /// Determine what content should be shown based on User Permission and Edit Mode
        /// </summary>
        private void SetContentVisibility()
        {
            if (orgId != -1)
            {
                // When editing, hide details
                if (IsEditPage)
                {
                    DetailsViewLayer.Visible = false;
                    DataEntryLayer.Visible = true;
                    ShowEditBtn.Visible = false;
                }
                else
                {
                    DataEntryLayer.Visible = false;
                    DetailsViewLayer.Visible = true;
                    ShowEditBtn.Visible = true;
                }
            }
            else
            {
                // If no record exits, hide form
                if (!IsEditPage)
                {
                    Form.Visible = false;
                }
                else
                {

                    DataEntryLayer.Visible = IsEditPage;
                    DetailsViewLayer.Visible = !IsEditPage;
                    ShowEditBtn.Visible = !IsEditPage;
                }
            }
        }

        /// <summary>
        /// Resets all input fields and orgid values
        /// </summary>
        private void LoadBlankForm()
        {
            orgId = -1;
            OrgIdField.Value = string.Empty;

            CICHelper.ClearCaisisInputControlValues(DataEntryLayer);
            SetFormState(true);
        }

        private void SetFormFieldData(int tempOrgId)
        {
            ProjectOrganization org = new ProjectOrganization();
            org.Get(tempOrgId);

            CICHelper.SetFieldValues(Form.Controls, org);

            // Set Color if needed
            string orgColor = org[ProjectOrganization.ColorCode].ToString();
            if (!string.IsNullOrEmpty(orgColor))
            {
                ColorCodeBox.Style[HtmlTextWriterStyle.BackgroundColor] = orgColor;
            }
            // Set fields in Main table
            // Labels are assigned IDs based on field names in ProjectOrganization table
            OrganizationFullName.Text = org[ProjectOrganization.Name].ToString();
            foreach (string field in org.FieldNames)
            {
                Label fieldValue = DetailsViewLayer.FindControl(field) as Label;
                if (fieldValue != null)
                {
                    fieldValue.Text = org[field].ToString();
                }
            }
        }

        /// <summary>
        /// Removes client event if not in context of project or editing current org
        /// </summary>
        /// <param name="sende"></param>
        /// <param name="e"></param>
        protected void HandleIsNewProject(object sende, EventArgs e)
        {
            if (projectId == -1 || orgId != -1)
            {
                SaveBtn.OnClientClick = string.Empty;
            }
        }

        #region CLICK EVENTS

        protected void SaveClick(object sender, CommandEventArgs e)
        {
            SaveProject(false);
        }

        private void SaveProject(bool addToProject)
        {
            ProjectOrganization org = new ProjectOrganization();
            bool isNew = true;
            if (orgId != -1)
            {
                isNew = false;
                org.Get(orgId);
            }
            CICHelper.SetBOValues(Form.Controls, org, 0);

            org.Save();

            // Ensure color picker box color
            if (!string.IsNullOrEmpty(ColorCode.Value))
            {
                ColorCodeBox.Style[HtmlTextWriterStyle.BackgroundColor] = ColorCode.Value;
            }


            OrganizationFullName.Text = org[ProjectOrganization.Name].ToString();

            int nOriginalOrgId = orgId;

            orgId = Int32.Parse(org[ProjectOrganization.OrganizationId].ToString());
            OrgIdField.Value = org[ProjectOrganization.OrganizationId].ToString();

            SetFormState(false);

            if (addToProject)
            {
                // Check if this is a new organization and the user wants to assign this organization to the project
                AddOrgToProject(nOriginalOrgId);
            }

            RefreshMainList(false);
        }

        private void AddOrgToProject(int nOrgId)
        {
            Project_ProjectOrganization bizProjOrg = new Project_ProjectOrganization();
            //bizProjOrg.NewRow();
            bizProjOrg[Project_ProjectOrganization.ProjectId] = projectId;
            bizProjOrg[Project_ProjectOrganization.OrganizationId] = orgId;
            bizProjOrg.Save();
        }


        protected void NewClick(object sender, CommandEventArgs e)
        {
            Response.Redirect(Request.Path + "?organizationId=-1&projectId=" + projectId);
        }

        protected void CancelClick(object sender, CommandEventArgs e)
        {
            if (orgId != -1)
            {
                SetFormFieldData(orgId);
                SetFormState(false);
            }
            else
            {
                LoadBlankForm();
            }
        }

        protected void DeleteClick(object sender, CommandEventArgs e)
        {
            ProjectOrganization biz = new ProjectOrganization();
            biz.Delete(orgId);

            LoadBlankForm();
            SetFormState(true);

            RefreshMainList(true);
        }

        /// <summary>
        /// When in context of a project and adding a new organization
        /// user will choose if to add new organization to current project
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void HandleAddOrgToProject(object sender, CommandEventArgs e)
        {
            bool doAddToProject = projectId != -1 && orgId == -1 && bool.Parse(e.CommandArgument.ToString());
            SaveProject(doAddToProject);
        }

        #endregion

        private void SetFormState(bool isFormEnabled)
        {
            bool _isFormEnabled = isFormEnabled;
            //CICHelper.EnableFields(this.Form.Controls, _isFormEnabled);

            if (orgId == -1)
            {
                // New
                SetButtonVisibility(true, true, true, true, false, true, true);
                SetButtonStates(false, false, true, true, false, true, false);

            }
            else
            {
                if (_isFormEnabled)
                {
                    // Populated Enabled Unlocked Form
                    SetButtonVisibility(true, true, true, true, false, true, true);
                    SetButtonStates(false, false, true, true, false, true, true);
                }
                else
                {
                    // Populated Disabled Unlocked Form
                    SetButtonVisibility(true, true, true, true, false, true, true);
                    SetButtonStates(true, true, false, false, false, false, false);
                }
            }

        }

        private void SetButtonStates(bool enableNewBtn, bool enableEditBtn, bool enableSaveBtn, bool enableLockBtn, bool enableUnlockBtn, bool enableCancelBtn, bool enableDeleteBtn)
        {
            return;
            // new
            //if (enableNewBtn) { NewBtn.Enabled = true; NewBtn.ImageUrl = "../../Images/DataEntryButtons/Button_New_On.gif"; } else { NewBtn.Enabled = false; NewBtn.ImageUrl = "../../Images/DataEntryButtons/Button_New_Off.gif"; }

            // save
            if (enableSaveBtn) { SaveBtn.Enabled = true; SaveBtn.ImageUrl = "../../Images/DataEntryButtons/Button_Save_On.gif"; } else { SaveBtn.Enabled = false; SaveBtn.ImageUrl = "../../Images/DataEntryButtons/Button_Save_Off.gif"; }


            // delete
            if (enableDeleteBtn) { DeleteBtn.Enabled = true; DeleteBtn.ImageUrl = "../../Images/DataEntryButtons/Button_Delete_On.gif"; }
            else
            {
                DeleteBtn.Enabled = false;
                DeleteBtn.ImageUrl = "../../Images/DataEntryButtons/Button_Delete_Off.gif";
            }
            SetContentVisibility();
        }

        private void SetButtonVisibility(bool showNewBtn, bool showEditBtn, bool showSaveBtn, bool showLockBtn, bool showUnlockBtn, bool showCancelBtn, bool showDeleteBtn)
        {
            return;
            //NewBtn.Visible = showNewBtn;

            SaveBtn.Visible = showSaveBtn;
            DeleteBtn.Visible = showDeleteBtn;
        }

        /// <summary>
        /// Signals main list view page to reload using query string paramaters
        /// </summary>
        /// <param name="isDelete"></param>
        private void RefreshMainList(bool isDelete)
        {
            string qs = "";
            // In working in context of a project, filter list of by project
            if (!string.IsNullOrEmpty(ProjectId) && ProjectId != "-1")
            {
                qs = "?projectId=" + ProjectId;
                if (!isDelete)
                {
                    qs += "&organizationId=" + orgId;
                }
            }
            else if (!isDelete)
            {
                qs += "?organizationId=" + orgId;
            }
            else
            {
                qs += "?organizationId=-1";
            }

            // call script to update main list view page with query params
            base.RegisterUpdatePageScript(qs, true);
            if (!isDelete)
            {
                SignalParentPage();
            }
        }

        /// <summary>
        /// If a script is registered on parent page, execute it to signal record saved
        /// </summary>
        private void SignalParentPage()
        {
            string script = "if(parent.onRecordSave) { parent.onRecordSave.call(parent,'" + OrgIdField.Value + "'); } else {  if(top.hideModal) { top.hideModal(); }  }";
            Page.ClientScript.RegisterStartupScript(this.GetType(), "onOrgSave", script, true);
        }
    }
}