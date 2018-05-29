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
    public partial class Organization_List : AdminBasePage
    {
        protected override void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                BuildOrganizations();
            }
        }

        /// <summary>
        /// Builds a list of Organizations associated with the current Project
        /// </summary>
        private void BuildOrganizations()
        {
            var organizations = BusinessObject.GetAllAsDataView<ProjectOrganization>();
            organizations.Sort = ProjectOrganization.Name + " ASC";
            OrganizationsRptr.DataSource = organizations;
            OrganizationsRptr.DataBind();

            NoResultsMsg.Visible = organizations.Count == 0;
        }
    }
}