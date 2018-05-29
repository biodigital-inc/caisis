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

using Caisis.DataAccess;
using Caisis.BOL;
using Caisis.UI.Core.Classes;
using Caisis.UI.Core.Classes.CustomControls;

namespace Caisis.UI.Modules.ProjectMgmt
{
    public partial class EditAssociatedOrganizations : ProjectMgmtBasePage
    {
        private int projectId;
        private DataView associatedOrgs;
        private DataView unAssociatedOrgs;

        protected override void Page_Load(object sender, EventArgs e)
        {
            projectId = int.Parse(ProjectId);
            if (!Page.IsPostBack)
            {
                BindOrganizationData();
            }
            if (IsWizardPage)
            {
                SaveBtn.Style["display"] = "none";
                RegisterWizardSave();
            }
        }

        /// <summary>
        /// Bind grid to exitsing orgs for project
        /// </summary>
        protected void BindOrganizationData()
        {
            ProjectManagementDa da = new ProjectManagementDa();

            // Set global views used for bind grid and dropdowns
            associatedOrgs = da.GetProjectOrganizationsByProjectId(projectId).DefaultView;
            // Insert helper column for sorting associated organizations
            string helpSortCol = "TempSortCol";
            DataColumn bob = new DataColumn(helpSortCol);
            bob.DefaultValue = 1;
            associatedOrgs.Table.Columns.Add(bob);
            foreach (DataRow row in associatedOrgs.Table.Rows)
            {
                row[helpSortCol] = 0;
            }
            associatedOrgs.Sort = helpSortCol + " ASC," + ProjectOrganization.Name + " ASC";

            // Unassociated organizations should also be sorted by name
            unAssociatedOrgs = da.GetAllProjectOrganizationsExcludingProject(projectId).DefaultView;
            unAssociatedOrgs.Sort = ProjectOrganization.Name + " ASC";

            AssociatedOrgsGrid.DataSource = associatedOrgs;
            AssociatedOrgsGrid.DataBind();
        }

        /// <summary>
        /// Sets the data source for organization dropdown
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void SetOrgDropDown(object sender, GridViewRowEventArgs e)
        {
            int rowIndex = e.Row.RowIndex;
            CaisisSelect orgDropDown = e.Row.FindControl("OrganizationDropDown") as CaisisSelect;

            if (rowIndex > -1 && orgDropDown != null)
            {
                DataView dropDownView;
                // Blank row drop down should only contain those unassociated orgs
                if (AssociatedOrgsGrid.BlankRowIndexes.Contains(rowIndex))
                {
                    dropDownView = unAssociatedOrgs;
                }
                // Existing records should bind to existing orgs in project
                // and should be disabled, not allowing organization to be changed
                else
                {
                    dropDownView = associatedOrgs;
                    orgDropDown.Enabled = false;
                }
                orgDropDown.DataSource = dropDownView;
                orgDropDown.DataBind();
            }
        }

        /// <summary>
        /// Need to rebind grid when record deleted.
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void OnOrganizationDeleted(object sender, GridViewDeletedEventArgs e)
        {
            BindOrganizationData();
            base.RegisterUpdatePageScript(string.Empty, false);
        }

        /// <summary>
        /// Occurs when click save
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void SaveOrgs(object sender, EventArgs e)
        {
            Dictionary<string, int> keys = new Dictionary<string, int>();
            keys.Add(Project_ProjectOrganization.ProjectId, projectId);
            AssociatedOrgsGrid.Save(keys);
            BindOrganizationData();
            base.RegisterUpdatePageScript(string.Empty, false);
            RegisterWiazardToNext();
        }

        /// <summary>
        /// Register script to be called on client to postback and initiate a save
        /// </summary>
        private void RegisterWizardSave()
        {
            PostBackOptions p = new PostBackOptions(SaveBtn);
            string doSaveServerScript = Page.ClientScript.GetPostBackEventReference(p);
            string doSaveFunction = "function doFormSave() { " + doSaveServerScript + " } ";
            Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "doFormSave", doSaveFunction, true);
        }

        /// <summary>
        /// Calls a function to continue to next page if defined in parent page
        /// </summary>
        private void RegisterWiazardToNext()
        {
            string goToNextScript = "if(parent.handleOrgSave) { parent.handleOrgSave.call(parent); }";
            Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "GoToNextScript", goToNextScript, true);
        }
    }
}
