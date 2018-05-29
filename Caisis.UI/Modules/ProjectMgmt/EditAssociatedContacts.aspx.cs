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
    public partial class EditAssociatedContacts : ProjectMgmtBasePage
    {
        protected int projectId;
        private DataView associatedContacts;
        private DataView unassociatedContact;

        protected override void Page_Load(object sender, EventArgs e)
        {
            base.Page_Load(sender, e);

            if (!string.IsNullOrEmpty(ProjectId))
            {
                projectId = int.Parse(ProjectId);
                if (!Page.IsPostBack)
                {
                    BindContactsData();
                }
            }
        }

        #region Data Binding

        /// <summary>
        /// Binds To and From Selects to show available and selected Contacts
        /// </summary>
        protected void BindContactsData()
        {
            ProjectManagementDa da = new ProjectManagementDa();
            unassociatedContact = da.GetAllUnassignedContacts(projectId).DefaultView;
            associatedContacts = da.GetProjectContactsByProjectId(projectId).DefaultView;

            FromContactsOrgRptr.DataSource = da.GetProjectOrganizationsByProjectId(projectId).DefaultView;
            FromContactsOrgRptr.DataBind();

            ToContactsOrgRptr.DataSource = da.GetProjectOrganizationsByProjectId(projectId).DefaultView;
            ToContactsOrgRptr.DataBind();
        }

        protected void OnContactsOrgBind(object sender, RepeaterItemEventArgs e)
        {
            Repeater contactsRptr = sender as Repeater;
            Repeater singleContactsRptr = e.Item.FindControl("SingleContactsRptr") as Repeater;
            if (singleContactsRptr != null)
            {
                int orgId = int.Parse(DataBinder.Eval(e.Item.DataItem, ProjectOrganization.OrganizationId).ToString());
                ProjectManagementDa da = new ProjectManagementDa();

                DataView view;

                List<string> associatedContacts = new List<string>();
                DataTable tmp = da.GetAllContactsByOrgId(orgId);
                if (tmp.Rows.Count > 0)
                {
                    foreach (DataRow row in tmp.Rows)
                    {
                        string contactId = row[Contact.ContactId].ToString();
                        associatedContacts.Add(contactId);
                    }
                    view = da.GetProjectContactsByProjectId(projectId).DefaultView;
                    string uniqueContacts = String.Join(",", associatedContacts.ToArray());
                    string rowFilter = "ContactId IN (" + uniqueContacts + ")";
                    view.RowFilter = rowFilter;
                    if (view.Table.Select(rowFilter).Length == 0)
                    {
                        e.Item.Visible = false;
                    }
                }
                else
                {
                    e.Item.Visible = false;
                    return;
                }



                singleContactsRptr.DataSource = view;
                singleContactsRptr.DataBind();
            }
        }

        /// <summary>
        /// Handle building of contacts based on organization
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void OnFromOrganizationsBound(object sender, RepeaterItemEventArgs e)
        {
            Repeater singleContactsRptr = e.Item.FindControl("SingleContactsRptr") as Repeater;

            int orgId = int.Parse(DataBinder.Eval(e.Item.DataItem, ProjectOrganization.OrganizationId).ToString());
            ProjectManagementDa da = new ProjectManagementDa();

            DataView fromOrgContacts = da.GetAllUnassignedContacts(projectId).DefaultView;
            string filter = "OrganizationId = " + orgId;
            fromOrgContacts.RowFilter = filter;
            // If there were no records which filterd, hide item
            if (fromOrgContacts.Count == 0)
            {
                e.Item.Visible = false;
            }
            // else bind options to contacts
            else
            {
                singleContactsRptr.DataSource = fromOrgContacts;
                singleContactsRptr.DataBind();
            }
        }

        #endregion

        #region Event Handlers

        /// <summary>
        /// Moves Items (Records) from the Left Select to Right Select
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void OnAddClick(object sender, EventArgs e)
        {
            ProjectManagementDa da = new ProjectManagementDa();
            string key = "FromContacts";
            int[] keysToAdd = PageUtil.GetKeysFromMultiSelect(Request, key);
            if (keysToAdd.Length > 0)
            {
                da.AddAssociatedContacts(projectId, keysToAdd);
                BindContactsData();
            }
            base.RegisterUpdatePageScript(string.Empty, false);
        }

        /// <summary>
        /// Moves Items (Records) from the Right Select to Left Select
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void OnRemoveClick(object sender, EventArgs e)
        {
            ProjectManagementDa da = new ProjectManagementDa();
            string key = "ToContacts";
            int[] keysToRemove = PageUtil.GetKeysFromMultiSelect(Request, key);
            da.RemoveAssociatedContacts(projectId, keysToRemove);
            BindContactsData();
            base.RegisterUpdatePageScript(string.Empty, false);
        }
        #endregion

        protected void ReturnToProjectOrgsListBtn_Click(object sender, EventArgs e)
        {
            Response.Redirect("ProjectOrgs.aspx?projectId=" + projectId);
        }
        protected void ReturnToProjectContactsListBtn_Click(object sender, EventArgs e)
        {
            Response.Redirect("ProjectContacts.aspx?FilterBy=Projects&FilterID=" + projectId);
        }
    }
}
