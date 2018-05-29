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
    public partial class Group_Edit : AdminBasePage
    {
        private IEnumerable<string> currentGroupAccessTabs = new string[0];
        private IEnumerable<GroupDataset> currentGroupDatasets = new GroupDataset[0];
        protected IDictionary<int, int> associatedUsers = new Dictionary<int, int>();

        /// <summary>
        /// Gets the groupId passed via query string
        /// </summary>
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
                int? groupId = null;
                BuildRoles();
                if (!string.IsNullOrEmpty(QueryGroupId))
                {
                    groupId = int.Parse(QueryGroupId);
                    PopulateGroup(groupId.Value);

                    AssignedUsers.Checked = false;
                }
                else
                {
                    AssignedUsers.Checked = true;
                }
                BuildDatasets();
                BuildUsers(groupId);
                BuildTabs();
            }
        }

        private IEnumerable<GroupDataset> GetCurrentGroupDatasets()
        {
            var groupDatasets = BusinessObject.GetByFields<GroupDataset>(new Dictionary<string, object>()
                {
                    { GroupDataset.GroupId, int.Parse(QueryGroupId) }
                });
            return groupDatasets;
        }

        #region build interface

        /// <summary>
        /// Populates main Group data entry fields
        /// </summary>
        /// <param name="groupId"></param>
        private void PopulateGroup(int groupId)
        {
            Group group = new Group();
            group.Get(groupId);
            CICHelper.SetFieldValues(GroupFields.Controls, group);

            currentGroupAccessTabs = group[Group.GroupAccessCode].ToString().Split(",".ToCharArray(), StringSplitOptions.RemoveEmptyEntries);
            currentGroupDatasets = GetCurrentGroupDatasets();


            GroupTitle.Text = GroupName.Value;
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

        private void BuildUsers(int? groupId)
        {
            if (groupId.HasValue)
            {
                associatedUsers = BOL.BusinessObject.GetByFields<BOL.UserGroup>(new Dictionary<string, object>
            {
                {  BOL.UserGroup.GroupId, groupId.Value }
            }).ToDictionary(b => (int)b[BOL.UserGroup.UserId], b => (int)b[BOL.UserGroup.UserGroupId]);
            }
            else
            {
                associatedUsers = new Dictionary<int, int>();
            }

            var users = BOL.BusinessObject.GetAllAsDataView<BOL.User>();
            users.Sort = BOL.User.UserLastName + " ASC";
            UsersRptr.DataSource = users;
            UsersRptr.DataBind();

            // set inital view all users
            AssignedUsers.Checked = associatedUsers.Count == 0;
        }

        /// <summary>
        /// Builds a list of all tabs
        /// </summary>
        private void BuildTabs()
        {
            var tabs = from tab in CaisisConfiguration.GetModuleConfigList()
                       where tab.IsTab
                       select tab.Name.ToUpper();
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
                    int rowDatasetId = (int)DataBinder.Eval(e.Item.DataItem, Dataset.DatasetId);
                    var found = from g in currentGroupDatasets
                                let d = (int)g[GroupDataset.DatasetId]
                                where d == rowDatasetId
                                select g;
                    if (found.Count() > 0)
                    {
                        keyField.Checked = true;
                        // set pri key
                        valueField.Value = found.First()[GroupDataset.GroupDatasetId].ToString();
                    }
                }
                // handle tab access
                else if (sender == TabsRptr)
                {
                    string tabName = e.Item.DataItem.ToString();
                    // check if tab is in access code
                    keyField.Checked = currentGroupAccessTabs.Contains(tabName);
                }
            }
        }

        #endregion

        #region event handlers

        protected void SaveClick(object sender, EventArgs e)
        {
            int? groupId = Save();
            if (groupId.HasValue)
            {
                Response.Redirect("Group_Edit.aspx?groupId=" + groupId);
            }
        }

        protected void DeleteClick(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(QueryGroupId))
            {
                Group biz = new Group();
                biz.Delete(int.Parse(QueryGroupId));
                Response.Redirect("Group_List.aspx");
            }
        }

        protected void CancelClick(object sender, EventArgs e)
        {
            Response.Redirect("Group_Edit.aspx?groupId=" + QueryGroupId);
        }

        protected void SetAssociatedGroupUsers(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                int userId = (int)DataBinder.Eval(e.Item.DataItem, "UserId");
                HiddenField userIdField = e.Item.FindControl("UserIdField") as HiddenField;
                userIdField.Value = userId.ToString();
                if (associatedUsers.ContainsKey(userId))
                {
                    int userGroupId = associatedUsers[userId];
                    HiddenField userGroupIdField = e.Item.FindControl("UserGroupIdField") as HiddenField;
                    userGroupIdField.Value = userGroupId.ToString();
                    CheckBox associateUserField = e.Item.FindControl("AssociateUserField") as CheckBox;
                    associateUserField.Checked = true;
                }
            }
        }

        #endregion

        #region CRUD

        /// <summary>
        /// Updates/inserts group
        /// </summary>
        /// <returns></returns>
        private int? Save()
        {
            Group group = new Group();
            // load existing, otherwise new group
            if (!string.IsNullOrEmpty(QueryGroupId))
            {
                group.Get(int.Parse(QueryGroupId));
            }
            int roleId = int.Parse(GroupRole.Value);
            CICHelper.SetBOValues(GroupFields.Controls, group, roleId);
            // update group access code
            var selectedTabs = GetRptrSelectedValues(TabsRptr);
            string accessCode = string.Join(",", selectedTabs.ToArray());
            group[Group.GroupAccessCode] = accessCode;

            // update Group
            group.Save();
            int groupId = (int)group[Group.GroupId];

            // update group datasets
            SaveGroupDatasets(groupId);

            // uddate group users
            SaveGroupUsers(groupId);

            // return updated/inserted group
            return groupId;
        }

        /// <summary>
        /// Updates the list of group datasets
        /// </summary>
        /// <param name="groupId"></param>
        private void SaveGroupDatasets(int groupId)
        {
            foreach (RepeaterItem item in DatasetsRptr.Items)
            {
                var keyField = item.FindControl("KeyField") as CaisisCheckBox;
                var groupDatesetIdField = item.FindControl("ValueField") as ICaisisInputControl;
                var datasetIdField = item.FindControl("DatasetId") as ICaisisInputControl;
                // checked
                if (keyField.Checked)
                {
                    // determine if key exists, else insert
                    if (string.IsNullOrEmpty(groupDatesetIdField.Value))
                    {
                        GroupDataset groupDataset = new GroupDataset();
                        groupDataset[GroupDataset.GroupId] = groupId;
                        groupDataset[GroupDataset.DatasetId] = int.Parse(datasetIdField.Value);
                        groupDataset.Save();

                        groupDatesetIdField.Value = groupDataset[groupDataset.PrimaryKeyName].ToString();
                    }
                }
                // unchecked
                else
                {
                    // if pri key exists, delete
                    if (!string.IsNullOrEmpty(groupDatesetIdField.Value))
                    {
                        GroupDataset groupDataset = new GroupDataset();
                        groupDataset.Delete(int.Parse(groupDatesetIdField.Value));
                    }
                }
            }
        }

        /// <summary>
        /// Updates the list of Users in a group
        /// </summary>
        /// <param name="groupId"></param>
        private void SaveGroupUsers(int groupId)
        {
            foreach (RepeaterItem item in UsersRptr.Items)
            {
                HiddenField userIdField = item.FindControl("UserIdField") as HiddenField;
                HiddenField userGroupIdField = item.FindControl("UserGroupIdField") as HiddenField;
                CheckBox associateUserField = item.FindControl("AssociateUserField") as CheckBox;

                // checked
                if (associateUserField.Checked)
                {
                    // add association
                    if (string.IsNullOrEmpty(userGroupIdField.Value))
                    {
                        UserGroup userGroup = new UserGroup();
                        int userId = int.Parse(userIdField.Value);
                        userGroup[BOL.UserGroup.UserId] = userId;
                        userGroup[BOL.UserGroup.GroupId] = groupId;
                        userGroup.Save();

                        userGroupIdField.Value = userGroup[BOL.UserGroup.UserGroupId].ToString();
                    }
                }
                // unchecked
                else
                {
                    // delete assocaition
                    if (!string.IsNullOrEmpty(userGroupIdField.Value))
                    {
                        UserGroup userGroup = new UserGroup();
                        int userGroupId = int.Parse(userGroupIdField.Value);
                        userGroup.Delete(userGroupId);

                        userGroupIdField.Value = string.Empty;
                    }
                }
            }
        }

        #endregion

        #region utilities

        /// <summary>
        /// Extract selected values from checked checkboxes
        /// </summary>
        /// <param name="rptr"></param>
        /// <returns></returns>
        private IEnumerable<string> GetRptrSelectedValues(Repeater rptr)
        {
            var selcetedItems = from item in rptr.Items.Cast<RepeaterItem>()
                                let keyField = item.FindControl("KeyField") as CaisisCheckBox
                                let valueField = item.FindControl("ValueField") as ICaisisInputControl
                                where keyField.Checked
                                select valueField.Value;
            return selcetedItems;
        }

        #endregion
    }
}