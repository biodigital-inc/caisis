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
    public partial class AdminAddEditInstitutionAndContacts : ProjectMgmtBasePage
    {
        // CONSTANTS
        private static readonly string EDIT_TYPE_ORG = "Organizations";
        private static readonly string EDIT_TYPE_CONTACTS = "Contacts";

        protected override void Page_Load(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(ProjectId))
            {
                if (!Page.IsPostBack)
                {
                    EditType.Value = !string.IsNullOrEmpty(Request.QueryString["editType"]) ? Request.QueryString["editType"] : EDIT_TYPE_ORG;
                    SetIFramePath();
                }
                RegisterNextScript();
            }
        }

        /// <summary>
        /// Registers a function which can be called to simulate next and back btn click
        /// </summary>
        private void RegisterNextScript()
        {
            PostBackOptions backOptions = new PostBackOptions(BackBtn);
            string backServerScript = Page.ClientScript.GetPostBackEventReference(backOptions);
            string backScript = "function goBack() { " + backServerScript + " } ";
            Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "goBack", backScript, true);

            PostBackOptions nextOptions = new PostBackOptions(NextBtn);
            string forwardServerScript = Page.ClientScript.GetPostBackEventReference(nextOptions);
            string forwardScript = "function goForward() { " + forwardServerScript + " } ";
            Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "goForward", forwardScript, true);

        }

        protected void HandleBackClick(object sender, EventArgs e)
        {
            if (EditType.Value.Equals(EDIT_TYPE_ORG))
            {
                string loi = Request.QueryString["loiId"];
                string projectApprovalId = Request.QueryString["projectApprovalId"];

                if (!string.IsNullOrEmpty(projectApprovalId))
                {
                    Response.Redirect("AdminProjectApproval.aspx?projectId=" + ProjectId + "&projectApprovalId=" + projectApprovalId);
                }
                else if (!string.IsNullOrEmpty(loi))
                {
                    Response.Redirect("AdminLetterOfIntent.aspx?projectId=" + ProjectId + "&loiId=" + loi);
                }
                else
                {
                    Response.Redirect("AdminCreateProject.aspx?projectId=" + ProjectId);
                }

            }
            else if (EditType.Value.Equals(EDIT_TYPE_CONTACTS))
            {
                EditType.Value = EDIT_TYPE_ORG;
                SetIFramePath();
            }
        }

        protected void SetLeadOrg()
        {
            return;
            //int nProjectId = Int32.Parse(ProjectId);
            //ProjectManagementDa projDA = new ProjectManagementDa();

            //projDA.ResetLeadOrg(nProjectId);

            //if (!String.IsNullOrEmpty(leadOrgId.Value)
            //    && leadOrgId.Value != "-1")
            //{
            //    DataTable daOrg = projDA.GetOrgByProjectAndOrgId(nProjectId, Int32.Parse(leadOrgId.Value));

            //    if (daOrg.Rows.Count > 0)
            //    {
            //        projDA.SetLeadOrg(nProjectId, Int32.Parse(daOrg.Rows[0]["OrganizationId"].ToString()));

            //    }
            //}
        }

        protected void HandleNextClick(object sender, EventArgs e)
        {
            if (EditType.Value.Equals(EDIT_TYPE_ORG))
            {
                SetLeadOrg();

                EditType.Value = EDIT_TYPE_CONTACTS;
                SetIFramePath();
            }
            else if (EditType.Value.Equals(EDIT_TYPE_CONTACTS))
            {
                Response.Redirect("AdminAddEditStageEvents.aspx?projectId=" + ProjectId);
            }
        }

        private void SetIFramePath()
        {
            if (EditType.Value.Equals(EDIT_TYPE_ORG))
            {
                AddEditFrame.Attributes["src"] = "../EditAssociatedOrganizations.aspx?projectId=" + ProjectId + "&isWizard=" + IsWizardPage;
                PageTitle.Text = EDIT_TYPE_ORG + " Associated With this Project";
            }
            else if (EditType.Value.Equals(EDIT_TYPE_CONTACTS))
            {
                AddEditFrame.Attributes["src"] = "../EditAssociatedContacts.aspx?projectId=" + ProjectId + "&isWizard=" + IsWizardPage;
                PageTitle.Text = EDIT_TYPE_CONTACTS + " Associated With this Project";
            }
        }
    }
}
