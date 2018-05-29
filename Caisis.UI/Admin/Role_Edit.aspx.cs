using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using System.Data;

using Caisis.BOL;
using Caisis.DataAccess;

using Caisis.UI.Core.Classes;
using Caisis.UI.Core.Classes.CustomControls;

namespace Caisis.UI.Admin
{
    public partial class Role_Edit : AdminBasePage
    {
        private int? _roleId = null;
        private Dictionary<HtmlInputCheckBox, HtmlInputHidden> dirtyControls = new Dictionary<HtmlInputCheckBox, HtmlInputHidden>();

        private bool IsNewRole
        {
            get
            {
                return !_roleId.HasValue;
            }
        }

        protected string QueryRoleId
        {
            get
            {
                return Request.QueryString["roleId"];
            }
        }

        private Dictionary<int, int> currentRolePermissions = new Dictionary<int, int>();
        private Dictionary<string, int> permissionsLookup = new Dictionary<string, int>();            

        protected override void Page_Load(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(QueryRoleId))
            {
                _roleId = int.Parse(QueryRoleId);
            }

            if (!Page.IsPostBack)
            {
                BuildModulePermissions();
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

        /// <summary>
        /// Builds a list of permissions
        /// </summary>
        private void BuildModulePermissions()
        {
            // get a list of modules
            var allModules = CaisisConfiguration.GetModuleConfigList();
            var modules = from m in allModules
                          //where m.Permissions.Count() > 0
                          orderby m.Name ascending
                          select new
                          {
                              ModuleName = m.Name,
                              Name = m.Name,
                              Permissions = m.Permissions
                          };
            // handle sub section permissions
            var subSections = from module in allModules
                              where module.ModuleSections.Count() > 0
                              select from section in module.ModuleSections
                                     select new
                                     {
                                         ModuleName = module.Name,
                                         Name = section.SectionName,
                                         Permissions = section.Permissions
                                     };
            var allSubSections = subSections.SelectMany(a => a);
            modules = modules.Concat(allSubSections);

            var globalPermissions = allModules.SelectMany(m => m.GlobalPermissions).Distinct().ToDictionary(k => k.Key, v => v.Value);

            var global = (from g in globalPermissions
                          select new
                          {
                              ModuleName = "Global",
                              Name = "Global",
                              Permissions = globalPermissions as IDictionary<string, string>
                          }).Distinct();
            var fullList = global.Concat(modules);
            //var flatModules = from module in fullList
            //                  orderby (module.Name == "Global" ? 0 : 1) ascending, module.ModuleName ascending, module.Name ascending
            //                  select from permission in module.Permissions
            //                         let isFirst = module.Permissions.First().Key == permission.Key
            //                         let mp = new
            //                         {
            //                             IsFirst = isFirst,
            //                             Module = module.Name,
            //                             ModuleName = module.ModuleName,
            //                             Permission = permission.Key,
            //                             PermissionDescription = permission.Value,
            //                             PermissionId = permissionsList.ContainsKey(permission.Key) ? permissionsList[permission.Key].ToString() : string.Empty
            //                         }
            //                         orderby (mp.IsFirst ? 0 : 1) ascending, mp.Permission ascending
            //                         select mp;
            

            var flatModules = from module in fullList
                              group module by module.ModuleName into g
                              where g.Count() > 0
                              select new
                              {
                                  ModuleName = g.Key,
                                  ModulePermissions = g.SelectMany(m => m.Permissions)
                              };

            ModulePermissionsRptr.DataSource = flatModules;
            ModulePermissionsRptr.DataBind();
        }

        protected void BuildModulePermissions(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                object modulePermissions = DataBinder.Eval(e.Item.DataItem, "ModulePermissions");
                var rptr = e.Item.FindControl("TabPermissionsRptr") as Repeater;
                rptr.DataSource = modulePermissions;
                rptr.DataBind();
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
            permissionsLookup.Clear();
            currentRolePermissions.Clear();

            // init permissions
            permissionsLookup = BusinessObject.GetAll<Permission>().ToDictionary(r => r[Permission.Permission_Field].ToString(), r => (int)r[Permission.PermissionId]);
            // init role permissions

            if (_roleId.HasValue)
            {
                RolePermissionDa rolePermDa = new RolePermissionDa();
                var rolePermissions = rolePermDa.GetRolePermissions(_roleId.Value);
                currentRolePermissions = rolePermissions.AsEnumerable().ToDictionary(r => (int)r[RolePermission.PermissionId], r => (int)r[RolePermission.RolePermissionId]);
            }
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
                string permission = DataBinder.Eval(e.Item.DataItem, "Key").ToString();
                int? permissionId = null;
                if (permissionsLookup.ContainsKey(permission))
                {
                    permissionId = permissionsLookup[permission];

                    HtmlInputCheckBox permissionCheckBox = e.Item.FindControl("PermissionCheckBox") as HtmlInputCheckBox;
                    HtmlInputHidden rolePermissionIdField = e.Item.FindControl("RolePermissionIdField") as HtmlInputHidden;
                    permissionCheckBox.Value = permissionId.Value.ToString();

                    // Determine if a current rolepermission is assigned for this permission
                    if (currentRolePermissions.ContainsKey(permissionId.Value))
                    {
                        int rolePermissionId = currentRolePermissions[permissionId.Value];
                        rolePermissionIdField.Value = rolePermissionId.ToString();
                        permissionCheckBox.Checked = true;
                    }
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
            Response.Redirect("Role_Edit.aspx?roleid=" + _roleId);
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void UpdateButtonClick(object sender, CommandEventArgs e)
        {
            Caisis.BOL.Role biz = new Caisis.BOL.Role();
            biz.Get(_roleId.Value);
            biz[Caisis.BOL.Role.Role_Field] = Role.Value;
            biz[Caisis.BOL.Role.RoleDescription] = RoleDesc.Value;
            biz[Caisis.BOL.Role.DeactivatedTime] = null;
            biz.Save();

            InsertPermissions();
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void DeleteButtonClick(object sender, CommandEventArgs e)
        {
            if (_roleId.HasValue)
            {
                Caisis.BOL.Role biz = new Caisis.BOL.Role();
                biz.Delete(_roleId.Value);

                Response.Redirect("Role_List.aspx");
            }
        }

        #endregion

        #region Data Helper Methods

        /// <summary>
        /// 
        /// </summary>
        protected void SetRoleDetails()
        {
            Role role = new Role();
            role.Get(_roleId.Value);
            Role.Value = role[BOL.Role.Role_Field].ToString();
            RoleDesc.Value = role[BOL.Role.RoleDescription].ToString();

            RoleTitle.Text = Role.Value;
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
                    biz[RolePermission.RoleId] = _roleId.Value;
                    // create permission if needed
                    if (string.IsNullOrEmpty(permissionsCheckBox.Value))
                    {
                        var pName = permissionsCheckBox.NamingContainer.FindControl("PermissionsLabel") as Label;
                        var pDesc = permissionsCheckBox.NamingContainer.FindControl("PermissionsDesc") as Label;
                        BOL.Permission permission = new Permission();
                        permission[BOL.Permission.Permission_Field] = pName.Text;
                        permission[BOL.Permission.PermissionDescription] = pDesc.Text;
                        permission.Save();

                        permissionsCheckBox.Value = permission[permission.PrimaryKeyName].ToString();
                    }
                    int permissionId = int.Parse(permissionsCheckBox.Value);
                    // set role
                    biz[RolePermission.PermissionId] = permissionId;
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