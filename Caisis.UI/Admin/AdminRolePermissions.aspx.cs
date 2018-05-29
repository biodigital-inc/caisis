using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Collections.Generic;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

using Caisis.DataAccess;
using Caisis.BOL;
using Caisis.UI.Core.Classes;

namespace Caisis.UI.Admin
{
    /// <summary>
    /// 
    /// </summary>
    public partial class AdminRolePermissions : AdminBasePage
    {
        private int _roleId = -1;
        private Dictionary<HtmlInputCheckBox, HtmlInputHidden> dirtyControls = new Dictionary<HtmlInputCheckBox, HtmlInputHidden>();

        private bool IsNewRole
        {
            get
            {
                return _roleId == -1;
            }
        }

        private DataTable currentRolePermissions;

        protected override void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["roleid"] != null)
            {
                _roleId = int.Parse(Request.QueryString["roleid"]);
            }

            if (!Page.IsPostBack)
            {
                BindPermissionList();

                if (IsNewRole) // new role being added
                {
                    UpdateBtn.Visible = false;
                }
                else
                {
                    AddBtn.Visible = false;
                    SetRoleDetails();
                }
            }
        }

        #region Repeater Events

        /// <summary>
        /// During databinding of Permission, get permissions for current role
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void PopulateCurrentPermissions(object sender, EventArgs e)
        {
            RolePermissionDa rolePermDa = new RolePermissionDa();
            currentRolePermissions = rolePermDa.GetRolePermissions(_roleId);
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void SetCheckBoxUIProperties(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.AlternatingItem || e.Item.ItemType == ListItemType.Item)
            {
                string permissionId = DataBinder.Eval(e.Item.DataItem, RolePermission.PermissionId).ToString();

                HtmlInputCheckBox permissionCheckBox = e.Item.FindControl("PermissionCheckBox") as HtmlInputCheckBox;
                HtmlInputHidden rolePermissionIdField = e.Item.FindControl("RolePermissionIdField") as HtmlInputHidden;
                permissionCheckBox.Value = permissionId;

                // Determine if a current rolepermission is assigned for this permission
                DataRow[] foundPermissions = currentRolePermissions.Select(RolePermission.PermissionId + " = " + permissionId);
                if (foundPermissions.Length > 0)
                {
                    string rolePermissionId = foundPermissions[0][RolePermission.RolePermissionId].ToString();
                    rolePermissionIdField.Value = rolePermissionId;
                    permissionCheckBox.Checked = !string.IsNullOrEmpty(rolePermissionId);
                }
            }
        }

        /// <summary>
        /// When a checkbox's checked state changes during post, control is marked as dirty (record needs to be updated/deleted)
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void SetControlDirty(object sender, EventArgs e)
        {
            if (sender is HtmlInputCheckBox)
            {
                HtmlInputCheckBox permissionsCheckBox = sender as HtmlInputCheckBox;
                HtmlInputHidden rolePermissionIdField = permissionsCheckBox.NamingContainer.FindControl("RolePermissionIdField") as HtmlInputHidden;

                dirtyControls.Add(permissionsCheckBox, rolePermissionIdField);
            }
        }

        #endregion

        #region Button Events

        /// <summary>
        /// Adds a new Role to the database
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void AddButtonClick(object sender, CommandEventArgs e)
        {
            Caisis.BOL.Role biz = new Caisis.BOL.Role();
            biz[Caisis.BOL.Role.Role_Field] = Role.Value;
            biz[Caisis.BOL.Role.RoleDescription] = RoleDesc.Value;
            biz.Save();

            // After save, verify record inseted and insert permissions
            string newPriKey = biz[biz.PrimaryKeyName].ToString();
            if (!string.IsNullOrEmpty(newPriKey))
            {
                _roleId = int.Parse(newPriKey);
                InsertPermissions();
            }
            Response.Redirect("AdminRolePermissions.aspx?roleid=" + _roleId);
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void UpdateButtonClick(object sender, CommandEventArgs e)
        {
            Caisis.BOL.Role biz = new Caisis.BOL.Role();
            biz.Get(_roleId);
            biz[Caisis.BOL.Role.Role_Field] = Role.Value;
            biz[Caisis.BOL.Role.RoleDescription] = RoleDesc.Value;
            biz[Caisis.BOL.Role.DeactivatedTime] = null;
            biz.Save();
            
            InsertPermissions();
        }

        #endregion

        #region Data Helper Methods

        /// <summary>
        /// 
        /// </summary>
        protected void BindPermissionList()
        {
			//Permission biz = new Permission();
			//biz.GetAll();

			//DataView permissionsList = biz.DataSourceView;

			DataView permissionsList = BusinessObject.GetAllAsDataView<Permission>();

            // Bind List of CheckBoxes
            PermissionsRptr.DataSource = permissionsList;
            PermissionsRptr.DataBind();

            // Bind Legend
            Legend.DataSource = permissionsList;
            Legend.DataBind();
        }

        /// <summary>
        /// 
        /// </summary>
        protected void SetRoleDetails()
        {
            Role role = new Role();
            role.Get(_roleId);
            Role.Value = role[BOL.Role.Role_Field].ToString();
            RoleDesc.Value = role[BOL.Role.RoleDescription].ToString();
        }

        /// <summary>
        /// 
        /// </summary>
        private void InsertPermissions()
        {
            foreach (HtmlInputCheckBox permissionsCheckBox in dirtyControls.Keys)
            {
                HtmlInputHidden rolePermissionIdField = dirtyControls[permissionsCheckBox];
                RolePermission biz = new RolePermission();
                if (permissionsCheckBox.Checked)
                {
                    biz[RolePermission.RoleId] = _roleId;
                    biz[RolePermission.PermissionId] = int.Parse(permissionsCheckBox.Value);
                    biz.Save();
                }
                else if (!string.IsNullOrEmpty(rolePermissionIdField.Value))
                {
                    int rolePermissionId = int.Parse(rolePermissionIdField.Value);
                    biz.Delete(rolePermissionId);
                }
            }
        }

        #endregion

    }
}