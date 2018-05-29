using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Xml;

using Caisis.BOL;
using Caisis.DataAccess;

using Caisis.Controller;
using Caisis.UI.Core.Classes;
using Caisis.UI.Core.Classes.CustomControls;

namespace Caisis.UI.Admin
{
    public partial class Contact_Edit : AdminBasePage
    {


        protected int? ContactId
        {
            get
            {
                int? contactId = null;
                string qContactId = Request.QueryString["contactId"];
                if (!string.IsNullOrEmpty(qContactId))
                    contactId = int.Parse(qContactId);
                return contactId;
            }
        }

        protected override void Page_Load(object sender, EventArgs e)
        {
            //base.Page_Load(sender, e);

            SetView();

            if (!IsPostBack)
            {
                // exisiting
                if (ContactId.HasValue)
                {
                    BindContactPanel(ContactId.Value);
                    PopulateOrgRptr(ContactId.Value);
                }
            }
        }

        private void SetView()
        {
            string edit = Request.QueryString["edit"];
            if (!ContactId.HasValue || (!string.IsNullOrEmpty(edit) && bool.Parse(edit) == true))
            {
                ViewPanel.Visible = false;
                ContactTitle.Visible = false;
                EditPanel.Visible = true;
                UpdateBtn.Visible = true;

                if (ContactId.HasValue)
                {
                    // enable buttons
                    UpdateBtn.Text = "Update";
                    DeleteBtn.Visible = true;
                }
            }
            else
            {
                ViewPanel.Visible = true;
                ContactTitle.Visible = true;
                EditPanel.Visible = false;
                UpdateBtn.Visible = false;
            }
        }

        protected void BindContactPanel(int contactId)
        {
            Contact biz = new Contact();
            biz.Get(contactId);

            // populate fields
            CICHelper.SetFieldValues(EditPanel.Controls, biz);

            ContactTitle.Text = biz[Contact.FirstName].ToString() + " " + biz[Contact.LastName].ToString();
            foreach (string colName in biz.FieldNames)
            {
                Label field = DisplayContactPanel.FindControl(colName) as Label;
                if (field != null)
                {
                    field.Text = biz[colName].ToString();
                }
            }
            if (!string.IsNullOrEmpty(Department.Text)) Department.Text = "Department of " + Department.Text;

            // set edit btn
            ShowEditBtn.OnClientClick = "return editContact('" + contactId + "');";
        }

        protected void SaveClick(object sender, EventArgs e)
        {
            Contact contact = new Contact();
            bool isNew = !ContactId.HasValue;
            // edit user
            if (ContactId.HasValue)
            {
                contact.Get(ContactId.Value);
            }
            CICHelper.SetBOValues(EditPanel.Controls, contact, -1);
            if (!contact.IsEmpty)
            {
                contact.Save();

                // associate organization
                string organizationId = Request.QueryString["organizationId"];
                if (isNew && !string.IsNullOrEmpty(organizationId))
                {
                    ProjectOrganization_ProjectContact contactOrg = new ProjectOrganization_ProjectContact();
                    contactOrg[ProjectOrganization_ProjectContact.ContactId] = (int)contact[contact.PrimaryKeyName];
                    contactOrg[ProjectOrganization_ProjectContact.OrganizationId] = int.Parse(organizationId);
                    contactOrg[ProjectOrganization_ProjectContact.ContactType] = 0;
                    contactOrg.Save();
                }
                ReloadMain(false);
            }
            else
            {
                Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "errorUpdating", "alert('Please validate all required fields.');", true);
            }
        }


        /// <summary>
        /// Populate associated organizations based on Contact Id
        /// <param name="contactId"></param>
        /// </summary>
        private void PopulateOrgRptr(int contactId)
        {
            // Get DataSource for Organization Display List as well as Organization Grid
            ProjectManagementDa projDA = new ProjectManagementDa();
            DataTable displayTable = projDA.GetAllOrgsByContactId(contactId);


            // Bind View
            OrgViewList.DataSource = displayTable;
            OrgViewList.DataBind();

            // bind contact's documents
            //DataView contactDocs = ContactRegulatoryDetail.GetByFieldsAsDataView<ContactRegulatoryDetail>(new Dictionary<string, object> 
            //{ 
            //    {ContactRegulatoryDetail.ContactId,  ContactId} 
            //});
            //ContactDocumentsGrid.DataSource = contactDocs;
            //ContactDocumentsGrid.DataBind();
        }

        protected void DeleteClick(object sender, EventArgs e)
        {
            // Delete contact record
            Contact biz = new Contact();
            biz.Delete(ContactId.Value);

            ReloadMain(true);
        }

        private void ReloadMain(bool isDelete)
        {
            Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "reloadMainPage", "reloadMainPage(" + isDelete.ToString().ToLower() + ");", true);
        }
    }
}