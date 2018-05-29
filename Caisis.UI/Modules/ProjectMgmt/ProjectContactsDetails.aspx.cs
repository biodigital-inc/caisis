using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Collections.Generic;
using System.Collections.Specialized;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

using Caisis.BOL;
using Caisis.DataAccess;
using Caisis.Security;
using Caisis.UI.Core.Classes.CustomControls;
using Caisis.UI.Core.Classes;

namespace Caisis.UI.Modules.ProjectMgmt
{
    public partial class ProjectContactsDetails : ProjectMgmtDetailsPage, ICallbackEventHandler
    {
        protected bool isAdmin = false;
        protected int contactId = -1;
        protected string _rawCallBackArg;
        private NameValueCollection _callBackArgs;

        #region CallBack Event Handler for Searching for Users

        private void RegisterProjectMgmtCallBackScript()
        {
            // Register startup
            ClientScriptManager cm = Page.ClientScript;
            String cbReference = cm.GetCallbackEventReference(this, "arg",
                "_handleProjectMgmtCallBack", "");
            String callbackScript = "function _doProjectMgmtCallBack(arg, context) {" +
                cbReference + "; }";
            cm.RegisterClientScriptBlock(this.GetType(),
                "_doProjectMgmtCallBack", callbackScript, true);
        }

        public void RaiseCallbackEvent(String eventArgument)
        {
            _callBackArgs = System.Web.HttpUtility.ParseQueryString(eventArgument);
        }

        public string GetCallbackResult()
        {
            string fName = _callBackArgs["FirstName"];
            string lName = _callBackArgs["LastName"];
            fName = fName == null ? string.Empty : fName;
            lName = lName == null ? string.Empty : lName;

            UserDa da = new UserDa();
            DataTable userRecords = da.GetUserIdByFirstAndLastName(fName, lName).Tables[0];
            if (userRecords.Rows.Count > 0)
            {
                string[] colNames = new string[] {
                        Caisis.BOL.User.UserId,
                        Caisis.BOL.User.UserFirstName,
                        Caisis.BOL.User.UserLastName,
                        Caisis.BOL.User.UserEmail 
                    };
                string jsArray = PageUtil.DataTableToJSArray(userRecords, colNames, true);
                return jsArray;
            }
            else
            {
                return string.Empty;
            }

            return string.Empty;
        }

        #endregion

        protected override void Page_Load(object sender, EventArgs e)
        {
            //base.Page_Load(sender, e);

            // Determine if Admin view is need (show all Contacts in List)
            if (!string.IsNullOrEmpty(Request.QueryString["admin"]) && Request.QueryString["admin"].ToLower().Equals(bool.TrueString.ToLower()))
            {
                // Verify user has admin rights
                if (PermissionManager.HasPermission(PermissionManager.EditSecurity))
                {
                    isAdmin = true;
                }
            }

            if (Request.QueryString["contactId"] != null && Request.QueryString["contactId"] != "-1")
            {
                contactId = int.Parse(Request.QueryString["contactId"]);
                ContactIdField.Value = Request.QueryString["contactId"];

                if (!IsPostBack)
                {
                    PopulateOrgRptr();
                    PopulateContactMethodsGrid();

                    SetFormFieldData(contactId);
                }
            }
            else
            {
                if (!IsPostBack)
                {

                    LoadBlankForm();
                }
                else
                {
                    int nId;
                    if (Int32.TryParse(ContactIdField.Value, out nId))
                        contactId = Int32.Parse(ContactIdField.Value);
                }
            }

            SetContentVisibility();
            RegisterProjectMgmtCallBackScript();
            // Register client function to do form save
            RegisterSaveBtnClick();
        }

        private void SetContentVisibility()
        {
            bool isEdit = !string.IsNullOrEmpty(GetQueryValue("edit")) ? true : false;

            EditContactPanel.Visible = isEdit;
            DisplayContactPanel.Visible = !isEdit;
            if (isEdit)
            {
                // If editing a new record, need a record before adding rows to grids
                bool showElement = contactId == -1;
                //                buttonAddNewOrg.Visible = !showElement;
                //                buttonAddNewContactMethod.Visible = !showElement;
            }
            else
            {
                if (contactId == -1)
                {
                    Form.Visible = false;
                }
                else
                {
                    ViewContactInfo.Visible = true;
                }
            }

            BindContactPanel();


            // Only User Admins and Module Admins should be able to handle button visibility
            if (UserType == ProjectMgmtUsers.ProjectAdmin || UserType == ProjectMgmtUsers.ModuleAdmin)
            {
                ShowEditBtn.OnClientClick = "return showEditDetailsInModal('" + Request.RawUrl + "&edit=true','Edit Contact',800);";
            }
            else
            {
                ShowEditBtn.Visible = false;
            }
        }

        #region GridView Logic

        /// <summary>
        /// Bind grids to underlying data
        /// </summary>
        private void PopulateGrids()
        {
            PopulateOrgRptr();
            PopulateContactMethodsGrid();
        }

        /// <summary>
        /// Populate associated organizations based on Contact Id
        /// </summary>
        private void PopulateOrgRptr()
        {
            // Get DataSource for Organization Display List as well as Organization Grid
            ProjectManagementDa projDA = new ProjectManagementDa();
            DataTable displayTable = projDA.GetAllOrgsByContactId(contactId);
            // Get a list of unassociated organizations to determine how many blank rows
            // as well as bind CaisisSelects
            DataView view = projDA.GetAllUnassociatedOrgsByContact(contactId).DefaultView;
            OrgGrid2.BlankRows = view.Count;
            OrgGrid2.DataSource = displayTable;
            OrgGrid2.DataBind();

            // Bind View
            OrgViewList.DataSource = displayTable;
            OrgViewList.DataBind();

            // bind contact's documents
            DataView contactDocs = ContactRegulatoryDetail.GetByFieldsAsDataView<ContactRegulatoryDetail>(new Dictionary<string, object> 
            { 
                {ContactRegulatoryDetail.ContactId,  contactId} 
            });
            ContactDocumentsGrid.DataSource = contactDocs;
            ContactDocumentsGrid.DataBind();
        }

        /// <summary>
        /// Populate contact methods based on Contact Id
        /// </summary>
        /// <param name="bShowFooter"></param>
        private void PopulateContactMethodsGrid()
        {
            //ContactMethod biz = new ContactMethod();
			//biz.GetByParent(contactId);
			//ContactMethodGridView.DataSource = biz.DataSourceView;
			ContactMethodGridView.DataSource = BusinessObject.GetByParentAsDataView<ContactMethod>(contactId);
            ContactMethodGridView.DataBind();
        }

        /// <summary>
        /// When grid is bound, bind organization select in footer row
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void HandleOrgBound(object sender, EventArgs e)
        {
			ProjectManagementDa projDA = new ProjectManagementDa();
			//ProjectOrganization biz = new ProjectOrganization();
			//biz.GetAll();
            DataView view = projDA.GetAllOrgsByContactId(contactId).DefaultView;
            DataView notAssociates = projDA.GetAllUnassociatedOrgsByContact(contactId).DefaultView;

            // After Grid has been bound, locate OrgSelects and bind to unassociates organizations
            int blankStart = OrgGrid2.Rows.Count - notAssociates.Count;
            for (int i = 0; i < OrgGrid2.Rows.Count; i++)
            {
                GridViewRow row = OrgGrid2.Rows[i];
                CaisisSelect OrgSel = row.FindControl("OrgSel") as CaisisSelect;
                //CaisisComboBox OrgRoleBlank = row.FindControl("OrgRoleBlank") as CaisisComboBox;
                CaisisComboBox CaisisComboOrgRole = row.FindControl("CaisisComboOrgRole") as CaisisComboBox;
                ImageButton OrgDelBtn = row.FindControl("OrgDelBtn") as ImageButton;

                // Hide delete button from blank rows
                if (i >= blankStart)
                {
                    OrgDelBtn.Visible = false;
                }

                //OrgSel.DataSource = biz.DataSourceView;//view;
				OrgSel.DataSource = BusinessObject.GetAllAsDataView<ProjectOrganization>();
                OrgSel.DataBind();
                // Extract organization ID from grid keys
                string orgId = OrgGrid2.DataKeys[i][ProjectOrganization_ProjectContact.OrganizationId].ToString(); ;
                OrgSel.Value = orgId;
                if (!string.IsNullOrEmpty(orgId))
                {
                    OrgSel.Enabled = false;
                }

            }
        }

        /// <summary>
        /// Rebind Associated Organizations on delete
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void OrgGridRecordDelete(object sender, GridViewDeletedEventArgs e)
        {
            PopulateOrgRptr();
            LoadOrganizationsList();
        }

        /// <summary>
        /// Rebind Contact Methods on delete
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void ContactMethodRecordDeleted(object sender, GridViewDeletedEventArgs e)
        {
            PopulateContactMethodsGrid();
        }

        #endregion


        protected void BindContactPanel()
        {
            Contact biz = new Contact();
            biz.Get(contactId);
            FirstName.Text = biz[Contact.FirstName].ToString();
            LastName.Text = biz[Contact.FirstName].ToString();
            foreach (string colName in biz.FieldNames)
            {
                Label field = DisplayContactPanel.FindControl(colName) as Label;
                if (field != null)
                {
                    field.Text = biz[colName].ToString();
                }
            }
            if (!string.IsNullOrEmpty(Department.Text)) Department.Text = "Department of " + Department.Text;
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
                // base query string should contain projectId
                qs = "?projectId=" + ProjectId + "&FilterBy=Projects&FilterID=" + ProjectId;
                // If a record was not deleted (i.e., updated or inserted, we will also pass in contactId
                if (!isDelete)
                {
                    qs += "&contactId=" + contactId;
                }
            }
            else if (!isDelete)
            {
                qs = "?contactId=" + contactId;
            }
            else
            {
                qs = "?contactId=-1";
            }

            qs += "&contactType=" + Request.QueryString["contactType"];
            qs += "&admin=" + Request.QueryString["admin"];

            // call script to update main list view page with query params
            base.RegisterUpdatePageScript(qs, true);
            if (!isDelete)
            {
                SignalParentPage();
            }
        }

        protected void AddContactTypeOnUpdate(object sender, GridViewUpdateEventArgs e)
        {
            e.Keys.Add("ContactType", 0);
        }


        /// <summary>
        /// Load organizations to the select box
        /// </summary>
        private void LoadOrganizationsList()
        {
            ProjectManagementDa projDA = new ProjectManagementDa();
            ContactProjOrgName.DataSource = projDA.GetAllUnassociatedOrgsByContact(contactId).DefaultView; ;
            ContactProjOrgName.DataBind();
        }

        /// <summary>
        /// Resets form fields and contactId for creating a new record
        /// </summary>
        private void LoadBlankForm()
        {
            contactId = -1;
            ContactIdField.Value = string.Empty;
            CICHelper.ClearCaisisInputControlValues(EditPanel);

            // If db doesn't have a contact type defined, set by query string
            if (string.IsNullOrEmpty(ContactType.Value) && !Page.IsPostBack && !string.IsNullOrEmpty(Request.QueryString["contactType"]))
            {
                ContactType.Value = Request.QueryString["contactType"];
            }

            // Determine if ContactType should be enabled
            if (isAdmin)
            {
                ContactType.Enabled = true;
            }

            PopulateContactMethodsGrid();
            PopulateOrgRptr();
        }

        private void SetFormFieldData(int contactId)
        {
            Contact contacts = new Contact();
            contacts.Get(contactId);
            CICHelper.SetFieldValues(Form.Controls, contacts);

            // Determine if ContactType should be enabled
            if (isAdmin)
            {
                ContactType.Enabled = true;
            }

            // Is Contact a User determined by if a userid is defined for this contact
            UserCheck.Checked = !string.IsNullOrEmpty(contacts[Contact.UserId].ToString());

            // Bind list of contac methods
			//ContactMethod biz = new ContactMethod();
			//biz.GetByParent(contactId);
			//ContactDetailsRptr.DataSource = biz.DataSourceView;
			ContactDetailsRptr.DataSource = BusinessObject.GetByParentAsDataView<ContactMethod>(contactId);
            ContactDetailsRptr.DataBind();
        }

        protected void SaveClick(object sender, CommandEventArgs e)
        {
            Contact contacts = new Contact();
            bool isNew = true;
            if (contactId != -1)
            {
                isNew = false;
                contacts.Get(contactId);
            }

            CICHelper.SetBOValues(EditPanel.Controls, contacts, 0);
            int nOrgContactId = contactId;

            contacts.Save();

            // Get the new contactId from the DB
            contactId = Int32.Parse(contacts[Contact.ContactId].ToString());
            ContactIdField.Value = contacts[Contact.ContactId].ToString();

            // Save ProjectOrg ProjContacts
            // ProjectOrg_ProjectCon needs 2 keys, orgid and contact id
            // However, orgid will be extracted from dropdown value
            System.Collections.Generic.Dictionary<string, int> keyList = new System.Collections.Generic.Dictionary<string, int>();
            keyList.Add("ContactId", contactId);
            OrgGrid2.Save(keyList);

            ContactMethodGridView.Save(contactId);

            // update contact documents
            ContactDocumentsGrid.Save(contactId);

            PopulateGrids();

            LoadOrganizationsList();

            PopulateContactMethodsGrid();


            RefreshMainList(false);


            SetContentVisibility();

            // Check if the new contact needs to be assigned to the current project
            AddContactToProject(nOrgContactId);
        }

        private bool IsNewAndNeedsAdd(int nContactId)
        {
            if (ProjectId != "-1" && hiddenAddContact.Value == "true")
            {
                if (nContactId == -1)
                {
                    return true;
                }
            }

            return false;
        }

        private void AddContactToProject(int nContactId)
        {
            if (!IsNewAndNeedsAdd(nContactId))
                return;

            Project_Contact bizProjContact = new Project_Contact();
            //bizProjContact.NewRow();
            bizProjContact[Project_Contact.ProjectId] = ProjectId;
            bizProjContact[Project_Contact.ContactId] = contactId;
            bizProjContact.Save();
        }

        protected void NewClick(object sender, CommandEventArgs e)
        {
            Response.Redirect(Request.Path + "?contactId=-1");
        }

        protected void CancelClick(object sender, CommandEventArgs e)
        {
            int temp;

            ContactProjOrgName.Visible = false;

            if (contactId != -1)
            {
                SetFormFieldData(contactId);
                PopulateContactMethodsGrid();

            }
            else
            {
                LoadBlankForm();
            }
        }

        protected void DeleteClick(object sender, CommandEventArgs e)
        {
            // Delete contact record
            Contact biz = new Contact();
            biz.Delete(contactId);

            // Load empty form
            LoadBlankForm();

            PopulateGrids();
            RefreshMainList(true);
        }

        protected void AddNewContactMethod_Click(object sender, ImageClickEventArgs e)
        {
            // Save and Rebind
            PopulateContactMethodsGrid();
        }

        protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
        {
            ContactProjOrgName.Visible = true;

            LoadOrganizationsList();
        }

        protected void SaveNewContact()
        {
            ContactMethodGridView.SaveFooterRecord(contactId);

            PopulateContactMethodsGrid();
        }

        /// <summary>
        /// Fields which ends in Date, should display short date on bound
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void SetShortDateFields(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                foreach (ICaisisInputControl icic in PageUtil.GetCaisisInputControlsInContainer(e.Row))
                {
                    if (!string.IsNullOrEmpty(icic.Value) && icic.Field.EndsWith("Date"))
                    {
                        DateTime testDate;
                        if (DateTime.TryParse(icic.Value, out testDate))
                        {
                            icic.Value = testDate.ToShortDateString();
                        }
                    }
                }
            }
        }

        private void SignalParentPage()
        {
            string script = "if(parent.onRecordSave) { parent.onRecordSave.call(parent,'" + ContactIdField.Value + "'); } else {  if(top.hideModal) { top.hideModal(); }  }";
            Page.ClientScript.RegisterStartupScript(this.GetType(), "onContactSave", script, true);
        }


        /// <summary>
        ///  
        /// </summary>
        private void RegisterSaveBtnClick()
        {
            PostBackOptions saveOptions = new PostBackOptions(BtnSave);
            string saveEventServerScript = Page.ClientScript.GetPostBackEventReference(saveOptions);
            string _doContactSave = "function _doContactSave() { " + saveEventServerScript + " } ";
            Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "_doContactSave", _doContactSave, true);

        }
    }
}
