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

using Caisis.BOL;
using Caisis.UI.Core.Classes;
using Caisis.UI.Core.Classes.CustomControls;
using Caisis.DataAccess;

namespace Caisis.UI.Modules.ProjectMgmt
{
    public partial class ProjectLOIResponseDetails : ProjectMgmtBasePage, ICallbackEventHandler
    {
        protected int ProjectLOIResponseId = -1;
        public int ProjectLetterOfIntentId = -1;
        private DataView orgList;

        private string _callbackOrgId;

        #region CALLBACK Related Methods (To retrieve contact for an organization)

        /// <summary>
        /// Registers the callback script used for retrieving contacts for an organization
        /// </summary>
        private void RegisterOrgCallBackScript()
        {
            // Register startup
            ClientScriptManager cm = Page.ClientScript;
            String cbReference = cm.GetCallbackEventReference(this, "arg",
                "onOrgCallBackEnd", "");
            String callbackScript = "function doOrgCallback(arg, context) {" +
                cbReference + "; }";
            cm.RegisterClientScriptBlock(this.GetType(),
                "doOrgCallback", callbackScript, true);
        }

        /// <summary>
        /// Gets called with argument from client
        /// </summary>
        /// <param name="eventArgument"></param>
        public void RaiseCallbackEvent(String eventArgument)
        {
            _callbackOrgId = eventArgument;
        }

        /// <summary>
        /// Returns a js array used by client to populate dropdowns
        /// </summary>
        /// <returns></returns>
        public string GetCallbackResult()
        {
            string[] keys = _callbackOrgId.Split(';');
            string orgId = keys[0];
            string contactClientId = keys[1];
            ProjectManagementDa da = new ProjectManagementDa();

            DataTable contacts = da.GetAllContactsByOrgId(int.Parse(orgId));
            string clientArray = PageUtil.DataTableToJSArray(contacts, new string[] { "Name", "ContactId" }, true);
            string clientObject = "['" + contactClientId + "'," + clientArray + " ]";
            return clientObject;
        }
        #endregion

        protected override void Page_Load(object sender, EventArgs e)
        {
            base.Page_Load(sender, e);
            this.EnableViewState = true;

            // Set global org list
			//ProjectOrganization biz = new ProjectOrganization();
			//biz.GetAll();
			//orgList = biz.DataSourceView;
			orgList = BusinessObject.GetAllAsDataView<ProjectOrganization>();

            if (!string.IsNullOrEmpty(Request.QueryString["ProjectLetterOfIntentId"]))
            {
                ProjectLetterOfIntentId = Int32.Parse(Request.QueryString["ProjectLetterOfIntentId"]);
            }

            if (!string.IsNullOrEmpty(Request.QueryString["ProjectLOIResponseId"]))
            {
                ProjectLOIResponseId = Int32.Parse(Request.QueryString["ProjectLOIResponseId"]);
            }

            if (ProjectLOIResponseId == -1
                && string.IsNullOrEmpty(Request.QueryString["edit"]))
                NoRecordPanel.Visible = true;
            else
                NoRecordPanel.Visible = false;

            if (!IsPostBack)
            {
                BindResponsePanel();
                PopulateResponseGrid();

                // this is hacky, feel free to improve - jf
                if (Organization.Text.Length > 0) Source.Text = Organization.Text;
            }

            SetControlState();
            RegisterOrgCallBackScript();

            // Hide Header if editing record
            if (!string.IsNullOrEmpty(GetQueryValue("edit")) && bool.Parse(GetQueryValue("edit")))
            {
                DetailsHeader.Visible = false;
            }
        }

        private void PopulateResponseGrid()
        {
			//BusinessObject.ProjectLOIResponse biz = new BusinessObject.ProjectLOIResponse();

			//biz.GetByParent(ProjectLetterOfIntentId);

			//LOIResponseGridView.DataSource = biz.DataSourceView;

			LOIResponseGridView.DataSource = BusinessObject.GetByParentAsDataView<BOL.ProjectLOIResponse>(ProjectLetterOfIntentId);
            LOIResponseGridView.DataBind();

        }

        // Populate the contacts select control
        private void PopulateSelect(string selectControlName, string selectControlFooterName, GridViewRowEventArgs e)
        {
            ProjectManagementDa projDA = new ProjectManagementDa();

            CaisisSelect selectName = null;

            GridViewRow currentRow = e.Row;
            if (e.Row.RowIndex > -1)
            {
                selectName = currentRow.FindControl(selectControlName) as CaisisSelect;
            }
            else if (e.Row.RowType == DataControlRowType.Footer)
                selectName = currentRow.FindControl(selectControlFooterName) as CaisisSelect;

            if (selectName != null)
            {
                selectName.DataTextField = "Name";
                selectName.DataValueField = "ContactId";
                selectName.DataSource = projDA.GetAllContacts();
                selectName.DataBind();
            }
        }

        protected void BindOrganizationsAndContacts(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                // Get the org drop down, contact drop down and contactid hidden field
                CaisisSelect organizationIdField = e.Row.FindControl("OrganizationEdit") as CaisisSelect;
                HtmlSelect contactDropDown = e.Row.FindControl("ContactNameEdit") as HtmlSelect;
                CaisisHidden contactIdField = e.Row.FindControl("ContactId") as CaisisHidden;

                // Attach change events to the dropdowns to handle respective client events
                string onOrgChange = "onOrgChange(this,'" + organizationIdField.ClientID + "','" + contactDropDown.ClientID + "');";
                PageUtil.AttachClientEventToControl(organizationIdField as WebControl, "onchange", onOrgChange);
                string onContactSelChange = "copyToContactId(this,'" + contactIdField.ClientID + "');";
                contactDropDown.Attributes["onchange"] = onContactSelChange;

                // Populate Organizations and Contacts
                organizationIdField.DataSource = orgList;
                organizationIdField.DataBind();

                string orgId = DataBinder.Eval(e.Row.DataItem, "OrganizationId").ToString();
                // Set selected orgid
                organizationIdField.Value = orgId;

                // Populate Contacts
                if (!string.IsNullOrEmpty(orgId))
                {
                    ProjectManagementDa da = new ProjectManagementDa();
                    DataTable contacts = da.GetAllContactsByOrgId(int.Parse(orgId));
                    contactDropDown.DataSource = contacts;
                    contactDropDown.DataBind();
                    // Add blank item at beginning
                    contactDropDown.Items.Insert(0, new ListItem(string.Empty, string.Empty));

                    // Set value of associated contact
                    string contactId = DataBinder.Eval(e.Row.DataItem, "ContactId").ToString();
                    if (!string.IsNullOrEmpty(contactId))
                    {
                        contactDropDown.Value = contactId;
                        contactIdField.Value = contactId;
                    }
                }
            }
        }

        protected void UpdateButton_Click(object sender, EventArgs e)
        {
            //
            // Save the Response Grid
            //

            LOIResponseGridView.Save(ProjectLetterOfIntentId, true);

            /*BusinessObject.ProjectLOIResponse biz = new BusinessObject.ProjectLOIResponse();

            if (ProjectLOIResponseId != -1)
                biz.Get(ProjectLOIResponseId);

            if (ProjectLetterOfIntentId != -1)
                CICHelper.SetBOValues(EditResponsePanel.Controls, biz, ProjectLetterOfIntentId);
            else
                CICHelper.SetBOValues(EditResponsePanel.Controls, biz, 0);

            biz.Save();

            if (biz["ProjectLOIResponseId"].ToString() != "")
            {
                ProjectLOIResponseId = Int32.Parse(biz["ProjectLOIResponseId"].ToString());
            }*/

            GoToMainList();
        }

        protected void CancelButton_Click(object sender, EventArgs e)
        {
            GoToMainList();
        }

        protected void BindResponsePanel()
        {
            BOL.ProjectLOIResponse biz = new BOL.ProjectLOIResponse();
            biz.Get(ProjectLOIResponseId);

            foreach (string colName in biz.FieldNames)
            {
                Label field = DisplayResponsePanel.FindControl(colName) as Label;
                if (field != null)
                {
                    field.Text = biz[colName].ToString();
                }
            }

            SetOrgNameByOrgId(biz[BOL.ProjectLOIResponse.OrganizationId].ToString());
            SetContactNameById(biz[BOL.ProjectLOIResponse.ContactId].ToString());
        }

        private void SetContactNameById(string strContactId)
        {
            if (!string.IsNullOrEmpty(strContactId))
            {
                Contact biz = new Contact();
                int nContactId = Int32.Parse(strContactId);
                biz.Get(nContactId);

                //if (biz.RecordCount > 0)
				if (!biz.IsEmpty)
                {
                    ContactName.Text = biz["LastName"] + ", " + biz["FirstName"];
                }
            }
        }

        private void SetOrgNameByOrgId(string strOrgId)
        {
            if (!string.IsNullOrEmpty(strOrgId))
            {
                ProjectOrganization orgBiz = new ProjectOrganization();

                int nOrgId = -1;

                nOrgId = Int32.Parse(strOrgId);
                orgBiz.Get(nOrgId);
                //if (orgBiz.RecordCount > 0)
				if (!orgBiz.IsEmpty)
                    Organization.Text = orgBiz["Name"].ToString();
            }
        }

        private void SetControls(bool bEdit, bool bDelete, bool bUpdate, bool bNew, bool bCancel, bool bDisplayFunding, bool bEditFunding)
        {
            UpdateButton.Attributes["style"] = (bUpdate == true ? "display: block;" : "display: none;");
            CancelButton.Attributes["style"] = (bCancel == true ? "display: block;" : "display: none;");
            DisplayResponsePanel.Visible = bDisplayFunding;
            EditResponsePanel.Visible = bEditFunding;

        }

        private void SetControlState()
        {
            if (ProjectLOIResponseId == -1)
            {
                if (!string.IsNullOrEmpty(Request.QueryString["edit"])
                && Request.QueryString["edit"] == "true")
                {
                    SetControls(false, false, true, false, true, false, true);
                }
                else
                    SetControls(true, false, false, true, false, false, false);
            }
            else
            {
                if (!string.IsNullOrEmpty(Request.QueryString["edit"])
                && Request.QueryString["edit"] == "true")
                {
                    SetControls(false, true, true, false, true, false, true);
                }
                else
                {
                    SetControls(true, true, false, true, false, true, false);
                }
            }
        }
        /*
        protected void DeleteButton_Click(object sender, EventArgs e)
        {
            if (ProjectLOIResponseId > -1)
            {
                BusinessObject.ProjectLOIResponse biz = new BusinessObject.ProjectLOIResponse();
                biz.Delete(ProjectLOIResponseId);
            }

            if (!string.IsNullOrEmpty(Request.QueryString["edit"])
                && Request.QueryString["edit"] == "true")
            {
                RefreshAndGoToMainList();
            }
            else
            {
                RefreshMainList();
            }

        }*/

        /// <summary>
        /// Signals list to refresh
        /// </summary>
        private void RefreshAndGoToMainList()
        {
            Page.ClientScript.RegisterStartupScript(typeof(Page), "refreshList", "top.CURRENT_MODAL_CALLER.refreshList(-1," + ProjectLetterOfIntentId + "); top.hideModal();", true);
        }

        /// <summary>
        /// Signals list to refresh
        /// </summary>
        private void GoToMainList()
        {
            Page.ClientScript.RegisterStartupScript(typeof(Page), "refreshList", "top.CURRENT_MODAL_CALLER.refreshList(" + ProjectLOIResponseId + "," + ProjectLetterOfIntentId + ");top.hideModal();", true);
        }

        /// <summary>
        /// Signals list to refresh
        /// </summary>
        private void RefreshMainList()
        {
            string refreshList = "refreshList(-1, " + ProjectLetterOfIntentId + ");";
            Page.ClientScript.RegisterStartupScript(typeof(Page), "refreshList", refreshList, true);
        }
    }
}
