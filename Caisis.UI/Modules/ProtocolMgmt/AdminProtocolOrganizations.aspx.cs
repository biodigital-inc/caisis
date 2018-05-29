using System;
using System.Data;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using Caisis.BOL;
using Caisis.DataAccess;
using Caisis.UI.Core.Classes.CustomControls;

namespace Caisis.UI.Modules.ProtocolMgmt
{
    public partial class AdminProtocolOrganizations : ProtocolMgmtBaseAdminPage
    {

        private List<RepeaterItem> updateItems = new List<RepeaterItem>();

        protected override void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack && !string.IsNullOrEmpty(BaseProtocolId))
            {
                int protocolId = int.Parse(BaseProtocolId);
                BuildProtocolOrganizations(protocolId);
            }
        }

        private void BuildProtocolOrganizations(int protocolId)
        {
            var organizations = BusinessObject.GetAll<ProjectOrganization>();
            Protocol protocol = new Protocol();
            protocol.Get(protocolId);
            if (!protocol.IsNull(Protocol.ProjectId))
            {
                int projectId = (int)protocol[Protocol.ProjectId];
                Project project = new Project();
                project.Get(projectId);
                string projectName = project[Project.Title].ToString();

                // get contacts
                ContactsDa da = new ContactsDa();
                var userContacts = da.GetAllContactsAndUser();

                var projectOrganizations = BusinessObject.GetByFields<Project_ProjectOrganization>(new Dictionary<string, object> { { Project_ProjectOrganization.ProjectId, projectId } });
                var data_source = from organization in organizations
                                  let organizationId = (int)organization[ProjectOrganization.OrganizationId]
                                  join po in projectOrganizations on organizationId equals (int)po[Project_ProjectOrganization.OrganizationId] into g
                                  let organizationName = organization[ProjectOrganization.Name].ToString()
                                  let organizationType = g.Count() > 0 ? g.First()[Project_ProjectOrganization.OrganizationType] + "" : ""
                                  orderby organizationName ascending
                                  let contacts = (from contact in userContacts.AsEnumerable()
                                                  where !contact.IsNull(ProjectOrganization_ProjectContact.OrganizationId)
                                                  where (int)contact[ProjectOrganization_ProjectContact.OrganizationId] == organizationId
                                                  let lastName = contact[Contact.LastName].ToString()
                                                  let firstName = contact[Contact.FirstName].ToString()
                                                  orderby lastName ascending
                                                  select lastName + ", " + firstName).Distinct()
                                  select new
                                  {
                                      Name = organizationName,
                                      OrganizationId = organizationId,
                                      OrganizationType = organizationType,
                                      ProjectOrganizationId = g.Count() > 0 ? g.First()[Project_ProjectOrganization.ProjectOrganizationId] + "" : "",
                                      Contacts = contacts.Count() > 0 ? Server.HtmlEncode("CONTACTS \n" + string.Join("\n", contacts.ToArray())) : "NO CONTACTS"
                                  };

                updateItems.Clear();

                OrganizationsRptr.DataSource = data_source;
                OrganizationsRptr.DataBind();

                // show data entry panel
                DataEntryPanel.Visible = true;
                ProjectLabel.Text = "PROJECT: " + projectName;

                ProjectIdField.Value = projectId.ToString();
            }
        }

        protected void SetFieldValues(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemIndex > -1)
            {
                var inputs = CICHelper.GetCaisisInputControls(e.Item);
                inputs.ForEach(i => i.Value = DataBinder.Eval(e.Item.DataItem, i.Field).ToString());
            }
        }

        protected void MarkUpdateRow(object sender, EventArgs e)
        {
            var control = sender as Control;
            var item = control.NamingContainer as RepeaterItem;
            if (!updateItems.Contains(item))
                updateItems.Add(item);
        }

        protected void UpdateProjectOrganizations(object sender, EventArgs e)
        {
            int projectId = int.Parse(ProjectIdField.Value);
            foreach (RepeaterItem item in updateItems)
            {
                string organizationId = (item.FindControl("OrganizationIdField") as HiddenField).Value;
                string projectOrganizationId = (item.FindControl("ProjectOrganizationIdField") as HiddenField).Value;
                string organizationType = (item.FindControl("ProjectOrganizationType") as ICaisisInputControl).Value;
                bool isAssociated = (item.FindControl("AssociateOrganizations") as CheckBox).Checked;
                if (isAssociated)
                {
                    Project_ProjectOrganization po = new Project_ProjectOrganization();
                    // update
                    if (!string.IsNullOrEmpty(projectOrganizationId))
                    {
                        po.Get(int.Parse(projectOrganizationId));
                    }
                    // insert
                    else
                    {
                        po[Project_ProjectOrganization.OrganizationId] = int.Parse(organizationId);
                        po[Project_ProjectOrganization.ProjectId] = projectId;
                    }
                    po[Project_ProjectOrganization.OrganizationType] = organizationType;
                    po.Save();
                }
                else
                {
                    // delete
                    if (!string.IsNullOrEmpty(projectOrganizationId))
                    {
                        Project_ProjectOrganization po = new Project_ProjectOrganization();
                        po.Delete(int.Parse(projectOrganizationId));
                    }
                }
            }
            // reload
            Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "reloadMainPage", "reloadMainPage();", true);
        }
    }
}