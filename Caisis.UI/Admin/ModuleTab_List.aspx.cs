using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

using Caisis.BOL;
using Caisis.DataAccess;

using Caisis.UI.Core.Classes;
using Caisis.UI.Core.Classes.CustomControls;

namespace Caisis.UI.Admin
{
    public partial class ModuleTab_List : AdminBasePage
    {

        protected string ModuleName
        {
            get
            {
                return Request.QueryString["moduleName"];
            }
        }

        protected override void Page_Load(object sender, EventArgs e)
        {
            base.Page_Load(sender, e);
            if (!Page.IsPostBack)
            {
                // determine if showing module groups or basic group listing
                if (!string.IsNullOrEmpty(ModuleName))
                {
                    BuildModuleGroups(ModuleName);
                }
                else
                {
                    BuildModulesTabs();
                }
            }
        }

        /// <summary>
        /// Builds a list of all modules/tabs
        /// </summary>
        private void BuildModulesTabs()
        {
            var tabs = from tab in CaisisConfiguration.GetModuleConfigList()
                       where tab.IsTab
                       select tab.Name;
            ModulesRptr.DataSource = tabs;
            ModulesRptr.DataBind();

            // set labels
            ListMainLabel.Text = "Modules / Tabs";
            ListCountLabel.Text = tabs.Count().ToString();
            ListLabel.Text = "Modules in Caisis";

            // set list visibility
            ModulesRptr.Visible = true;
            ModuleGroupsRptr.Visible = false;            
        }

        /// <summary>
        /// Builds a list of module sections
        /// </summary>
        private void BuildModuleGroups(string moduleName)
        {
            var groups = from g in BOL.BusinessObject.GetAll<Group>()
                         where !g.IsNull(Group.GroupAccessCode)
                         let groupModules = g[Group.GroupAccessCode].ToString().Split(',')
                         where groupModules.Contains(moduleName, StringComparer.OrdinalIgnoreCase)
                         select g;
            DataView groupsInModule = groups.AsDataView<Group>();
            groupsInModule.Sort =  Group.GroupName + " ASC";
            ModuleGroupsRptr.DataSource = groupsInModule;
            ModuleGroupsRptr.DataBind();

            // set labels
            ListMainLabel.Text = moduleName;
            ListCountLabel.Text = groupsInModule.Count.ToString();
            ListLabel.Text = "Groups have access to '" +  moduleName + "'";

            // set list visibility
            ModulesRptr.Visible = false;
            ModuleGroupsRptr.Visible = true;
        }

    }
}