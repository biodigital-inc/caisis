using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using Caisis.BOL;
using Caisis.UI.Core.Classes;

namespace Caisis.UI.Admin
{
    public partial class Organization_Edit : AdminBasePage
    {
        protected int? OrganizationId
        {
            get
            {
                string organizationId = Request.QueryString["organizationId"];
                if (!string.IsNullOrEmpty(organizationId))
                    return int.Parse(organizationId);
                return null;
            }
        }

        protected override void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack && OrganizationId.HasValue)
            {
                BuildOrganization(OrganizationId.Value);
            }
        }

        private void BuildOrganization(int organizationId)
        {
            BOL.ProjectOrganization organization = new ProjectOrganization();
            organization.Get(organizationId);
            CICHelper.SetFieldValues(EditPanel.Controls, organization);

            // enable buttons
            UpdateBtn.Text = "Update";
            DeleteBtn.Visible = true;
        }

        protected void SaveClick(object sender, EventArgs e)
        {
            BOL.ProjectOrganization organization = new ProjectOrganization();
            // udpdate
            if (OrganizationId.HasValue)
            {
                organization.Get(OrganizationId.Value);
            }
            CICHelper.SetBOValues(EditPanel.Controls, organization, -1);
            if (!organization.IsEmpty)
            {
                organization.Save();
                ReloadMain(false);
            }
        }

        protected void DeleteClick(object sender, EventArgs e)
        {
            if (OrganizationId.HasValue)
            {
                BOL.ProjectOrganization organization = new ProjectOrganization();
                organization.Delete(OrganizationId.Value);
                ReloadMain(true);
            }
        }

        private void ReloadMain(bool isDelete)
        {
            Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "reloadMainPage", "reloadMainPage(" + isDelete.ToString().ToLower() + ");", true);
        }
    }

}