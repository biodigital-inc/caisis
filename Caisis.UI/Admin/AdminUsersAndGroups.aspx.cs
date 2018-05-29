using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

using Caisis.DataAccess;

namespace Caisis.UI.Admin
{
    public partial class AdminUsersAndGroups : AdminBasePage
    {
        protected override void Page_Load(object sender, EventArgs e)
        {
            base.Page_Load(sender, e);
            BuildStats();
        }

        private void BuildStats()
        {
            SetActivePanel();






            BuildUserGroups();
            BuildUsers();
            BuildDatasets();
            BuildDatasets();
            BuildRoles();
            BuildModules();
            BuildPermissions();
        }


        /// <summary>
        /// 
        /// </summary>
        private void SetActivePanel()
        {
            string page = Request.QueryString["page"];
            if (!string.IsNullOrEmpty(page))
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "loadPage", "loadUserGroupsPage('" + page + ".aspx');", true);
            }
        }

        /// <summary>
        /// 
        /// </summary>
        private void BuildUserGroups()
        {
            GroupDa gda = new GroupDa();
            DataView groups = gda.GetGroups().Tables[0].DefaultView;
            GroupsRptr.DataSource = groups;
            GroupsRptr.DataBind();

            GroupsCount.Text = groups.Count.ToString();
        }

        private void BuildUsers()
        {
            var users = BOL.BusinessObject.GetAllAsDataView<BOL.User>();
            users.Sort = BOL.User.UserName + " ASC";
            UsersRptr.DataSource = users;
            UsersRptr.DataBind();

            // set count
            UsersCount.Text = users.Count.ToString();
        }

        private void BuildDatasets()
        {
            var datasets = BOL.BusinessObject.GetAllAsDataView<BOL.Dataset>();
            datasets.Sort = BOL.Dataset.DatasetName + " ASC";
            DatasetsRptr.DataSource = datasets;
            DatasetsRptr.DataBind();

            DatasetsCount.Text = datasets.Count.ToString();
        }

        private void BuildRoles()
        {
            DataView roles = BOL.BusinessObject.GetAllAsDataView<BOL.Role>();
            roles.Sort = BOL.Role.Role_Field + " ASC";

            RolesRptr.DataSource = roles;
            RolesRptr.DataBind();

            RolesCount.Text = roles.Count.ToString();
        }


        /// <summary>
        /// Builds a list of all tabs
        /// </summary>
        private void BuildModules()
        {
            var tabs = from tab in CaisisConfiguration.GetModuleConfigList()
                       where tab.IsTab
                       select tab.Name;
            ModulesRptr.DataSource = tabs;
            ModulesRptr.DataBind();

            ModulesCount.Text = tabs.Count().ToString();
        }

        private void BuildPermissions()
        {
            var permissions = BOL.BusinessObject.GetAllAsDataView<BOL.Permission>();
            permissions.Sort = BOL.Permission.Permission_Field + " ASC";
            PermissionsRptr.DataSource =permissions;
            PermissionsRptr.DataBind();

            PermissionsCount.Text = permissions.Count.ToString();
        }
    }
}
