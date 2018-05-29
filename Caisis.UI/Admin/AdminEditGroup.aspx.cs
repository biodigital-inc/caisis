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
    public partial class AdminEditGroup : AdminBasePage
    {
        private IEnumerable<string> currentGroupAccessTabs = new string[0];
        private IEnumerable<int> currentGroupDatasets = new int[0];

        protected string QueryGroupId
        {
            get
            {
                return Request.QueryString["groupId"];
            }
        }

        protected override void Page_Load(object sender, EventArgs e)
        {
            base.Page_Load(sender, e);
            if (!Page.IsPostBack)
            {
                BuildRoles();
                if (!string.IsNullOrEmpty(QueryGroupId))
                {
                    PopulateGroup(int.Parse(QueryGroupId));
                }                
                BuildDatasets();
                BuildTabs();
            }
        }


        #region build interface

        private void PopulateGroup(int groupId)
        {
            Group group = new Group();
            group.Get(groupId);
            CICHelper.SetFieldValues(GroupFields.Controls, group);

            currentGroupAccessTabs = group[Group.GroupAccessCode].ToString().Split(",".ToCharArray(), StringSplitOptions.RemoveEmptyEntries);
            var groupDatasets = BusinessObject.GetByFields<GroupDataset>(new Dictionary<string, object>()
                {
                    { GroupDataset.GroupId, int.Parse(QueryGroupId) }
                });
            currentGroupDatasets = groupDatasets.Select(g => (int)g[GroupDataset.DatasetId]);
        }

        /// <summary>
        /// Builds a list of available roles
        /// </summary>
        private void BuildRoles()
        {
            DataView roles = BusinessObject.GetAllAsDataView<Role>();
            roles.Sort = Role.Role_Field + " ASC";
            GroupRole.DataSource = roles;
            GroupRole.DataBind();
        }

        /// <summary>
        /// Builds a list of all datasets
        /// </summary>
        private void BuildDatasets()
        {
            DataView datasets = BusinessObject.GetAllAsDataView<Dataset>();
            datasets.Sort = Dataset.DatasetName + " ASC";
            DatasetsRptr.DataSource = datasets;
            DatasetsRptr.DataBind();

        }

        /// <summary>
        /// Builds a list of all tabs
        /// </summary>
        private void BuildTabs()
        {
            var tabs = CaisisConfiguration.GetModuleConfigList().Where(m => m.IsTab);
            //XmlDocument xmlDoc = XmlUtil.GetModulesConfigXml();
            //XmlNodeList listOfTabs = xmlDoc.SelectNodes("modules/module[@isTab='true']");
            TabsRptr.DataSource = tabs;
            TabsRptr.DataBind();
        }
 
        /// <summary>
        /// Sets the checkbox for the specified type (dataset or tab)
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void SetCheckBoxes(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                // get checkbox
                CaisisCheckBox keyField = e.Item.FindControl("KeyField") as CaisisCheckBox;
                // get value field
                ICaisisInputControl valueField = e.Item.FindControl("ValueField") as ICaisisInputControl;
                // handle dataset access           
                if (sender == DatasetsRptr)
                {
                    int rowDatasetId = (int)DataBinder.Eval(e.Item.DataItem, "DatasetId");
                    keyField.Checked = currentGroupDatasets.Contains(rowDatasetId);
                }
                // handle tab access
                else if (sender == TabsRptr)
                {
                    string rowTabName = DataBinder.Eval(e.Item.DataItem, "Name").ToString();
                    // check if tab is in access code
                    keyField.Checked = currentGroupAccessTabs.Contains(rowTabName.ToUpper());
                }
            }
        }

        #endregion

        #region event handlers

        protected void SaveClick(object sender, EventArgs e)
        {
            int? groupId = Save();
        }

        protected void CancelClick(object sender, EventArgs e)
        {

        }


        #endregion

        #region CRUD

        private int? Save()
        {
            Group group = new Group();
            // load existing, otherwise new group
            if (!string.IsNullOrEmpty(QueryGroupId))
            {
                group.Get(int.Parse(QueryGroupId));
            }
            CICHelper.SetBOValues(GroupFields.Controls, group, -1);
            group.Save();
            int groupId = (int)group[Group.GroupId];

            // update group datasets
            var selectedDatasets = GetRptrSelectedValues(DatasetsRptr).Cast<int>();
            // update group tabs
            var selectedTabs = GetRptrSelectedValues(TabsRptr);
            string accessCode = string.Join(",", selectedTabs.ToArray());
            // return updated/inserted group
            return groupId;
        }

        #endregion

        private IEnumerable<string> GetRptrSelectedValues(Repeater rptr)
        {
            var selcetedItems = from item in rptr.Items.Cast<RepeaterItem>()
                                let keyField = item.FindControl("KeyField") as CaisisCheckBox
                                let valueField = item.FindControl("ValueField") as ICaisisInputControl
                                where keyField.Checked
                                select valueField.Value;
            return selcetedItems;
        }
    }
}