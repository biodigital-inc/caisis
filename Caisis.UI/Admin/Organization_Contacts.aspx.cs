using System;
using System.Data;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using Caisis.BOL;
using Caisis.DataAccess;

namespace Caisis.UI.Admin
{
    public partial class Organization_Contacts : AdminBasePage
    {
        protected override void Page_Load(object sender, EventArgs e)
        {
            SetEditMode();

            if (!Page.IsPostBack)
            {
                string organizationId = Request.QueryString["organizationId"];
                if (!string.IsNullOrEmpty(organizationId))
                {
                    int _organizationId = int.Parse(organizationId);
                    BuildContacts(_organizationId);

                    SetOrganizationDetails(_organizationId);
                }
            }
        }

        private void SetOrganizationDetails(int organizationId)
        {
            ProjectOrganization organization = new ProjectOrganization();
            organization.Get(organizationId);

            string name = organization[ProjectOrganization.Name].ToString();
            OrganizationName.Text = name;
        }

        private void SetEditMode()
        {
            string method = Request.QueryString["method"] + "";
            switch (method)
            {
                case ("associate_contact"):
                    associate_contact.Visible = true;
                    MainPanel.Visible = false;
                    OrganizationName.Visible = false;
                    Load_Associate_Contact();
                    break;
                default:
                    associate_contact.Visible = false;
                    MainPanel.Visible = true;
                    OrganizationName.Visible = true;
                    Load_Main();
                    break;
            }
        }

        private void Load_Main()
        {
        }

        private void Load_Associate_Contact()
        {
            if (Page.IsPostBack)
                return;
            int organizationId = int.Parse(Request.QueryString["organizationId"]);

            ContactsDa da = new ContactsDa();
            DataTable contactAndUsers = da.GetAllContactsAndUser(organizationId);
            AssociateContactsRptr.DataSource = contactAndUsers;
            AssociateContactsRptr.DataBind();
        }

        protected void BulkAssociateContacts(object sender, EventArgs e)
        {
            int organizationId = int.Parse(Request.QueryString["organizationId"]);
            foreach (RepeaterItem item in AssociateContactsRptr.Items)
            {
                var organizationContactId = (item.FindControl("OrganizationContactId") as HiddenField).Value;
                var contactId = (item.FindControl("ContactId") as HiddenField).Value;
                var check = item.FindControl("AssociateCheckBox") as CheckBox;
                if (check.Checked)
                {
                    // add association
                    if (string.IsNullOrEmpty(organizationContactId))
                    {
                        AddOrganizationContact(organizationId, int.Parse(contactId));
                    }
                }
                else
                {
                    // remove association
                    if (!string.IsNullOrEmpty(organizationContactId))
                    {
                        DeleteOrganizationContact(int.Parse(organizationContactId));
                    }
                }
            }

            Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "reloadMainPage", "reloadMainPage();", true);
        }

        private void BuildContacts(int organizationId)
        {
            // build contacts
            ContactsDa da = new ContactsDa();
            var contactAndUsers = da.GetAllContactsAndUser(organizationId).DefaultView;
            contactAndUsers.RowFilter = "OrganizationContactId IS NOT NULL";
            ContactsRptr.DataSource = contactAndUsers;
            ContactsRptr.DataBind();

            NoContacsMessage.Visible = contactAndUsers.Count == 0;

            // build projects
            ProjectManagementDa projectDa = new ProjectManagementDa();
            DataView projects = projectDa.GetAllProjectsForOrg(organizationId).DefaultView;
            projects.Sort = Project.Title + " ASC";
            ProjectsRptr.DataSource = projects;
            ProjectsRptr.DataBind();

            NoProjectsMessage.Visible = projects.Count == 0;

            // build protocols
            DataView protocols = ProtocolMgmtDa.GetProtocolsByOrganization(organizationId).DefaultView;
            protocols.Sort = Protocol.ProtocolNum + " ASC";
            ProtocolRptr.DataSource = protocols;
            ProtocolRptr.DataBind();

            NoProtocolsMessage.Visible = protocols.Count == 0;
        }     

        private int AddOrganizationContact(int organizationId, int contactId)
        {
            ProjectOrganization_ProjectContact organizationContact = new ProjectOrganization_ProjectContact();
            organizationContact[ProjectOrganization_ProjectContact.OrganizationId] = organizationId;
            organizationContact[ProjectOrganization_ProjectContact.ContactId] = contactId;
            organizationContact[ProjectOrganization_ProjectContact.ContactType] = 0;
            organizationContact.Save();
            return (int)organizationContact[organizationContact.PrimaryKeyName];
        }

        private void DeleteOrganizationContact(int organizationContactId)
        {
            ProjectOrganization_ProjectContact organizationContact = new ProjectOrganization_ProjectContact();
            organizationContact.Delete(organizationContactId);
        }
    }
}