using System;
using System.Collections;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Web;
using System.Web.SessionState;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;

using Caisis.DataAccess;
using Caisis.BOL;

namespace Caisis.UI.Admin
{
    /// <summary>
    /// Summary description for AdminGroups.
    /// </summary>
    public partial class AdminGroups : AdminBasePage
    {
        protected ImageButton DeleteBtn;

        override protected void Page_Load(object sender, System.EventArgs e)
        {
            base.Page_Load(sender, e);

            //user confirmed delete, delete then show list of groups again
            if (Request.QueryString["delete"] != null && Request.QueryString["delete"].Equals("yes"))
            {

                int groupId = int.Parse(Request.QueryString["groupId"].ToString());
                Group group = new Group();
                group.Delete(groupId);



                this.ShowGroupList();
            }

            //add new link was clicked
            else if (Request.QueryString["addNew"] != null && Request.QueryString["addNew"].Equals("yes"))
            {
                RepeaterDiv.Visible = false;
                AddGroupTable.Visible = true;
                UpdateBtn.Visible = false;
                AddBtn.Visible = true;

                if (Request.Form["GroupRole"] == null)
                {
                    this.PopulateRolesSelect();
                }
            }

            //default case, load list of groups
            else
            {
                ShowGroupList();
            }
        }
        protected void ShowGroupList()
        {
            RepeaterDiv.Visible = true;
            AddGroupTable.Visible = false;

            GroupDa gda = new GroupDa();
            DataSet uds = gda.GetGroups();
            rptGroups.DataSource = uds.Tables[0].DefaultView;
            rptGroups.DataBind();
        }

        protected void PopulateRolesSelect()
        {
            RoleDa roleda = new RoleDa();
            DataSet ds = roleda.GetRoles();

            GroupRole.DataSource = ds.Tables[0].DefaultView;
            GroupRole.DataValueField = "RoleId";
            GroupRole.DataTextField = "Role";
            GroupRole.DataBind();
            GroupRole.Items.Insert(0, new ListItem(""));

        }


        protected void AddButtonClick(object sender, CommandEventArgs e)
        {
            if (ValidateGroup())
            {
                // Insert new Group record
                Group biz = new Group();
                int roleId = int.Parse(GroupRole.Value);
                biz[Group.RoleId] = roleId;
                biz[Group.GroupName] = GroupName.Value;
                biz[Group.GroupDescription] = GroupDesc.Value;
                biz.Save();
            }

            this.ShowGroupList();
        }

        protected void UpdateButtonClick(object sender, CommandEventArgs e)
        {
            if (ValidateGroup())
            {
                // Load Group Record
                Group biz = new Group();
                biz.Get(int.Parse(GroupId.Value));
                // Update fields and save
                biz[Group.RoleId] = int.Parse(GroupRole.Value);
                biz[Group.GroupName] = GroupName.Value;
                biz[Group.GroupDescription] = GroupDesc.Value;
                biz.Save();
            }

            this.ShowGroupList();
        }

        protected void EditButtonClick(object sender, CommandEventArgs e)
        {
            RepeaterDiv.Visible = false;
            AddGroupTable.Visible = true;
            UpdateBtn.Visible = true;
            AddBtn.Visible = false;

            this.PopulateRolesSelect();

            GroupDa groupDa = new GroupDa();
            int groupId = int.Parse(e.CommandName);
            DataSet ds = groupDa.GetGroupsRecord(groupId);

            if (ds.Tables[0].Rows.Count > 0)
            {
                GroupId.Value = groupId.ToString();
                GroupName.Value = ds.Tables[0].Rows[0][Group.GroupName].ToString();
                GroupDesc.Value = ds.Tables[0].Rows[0][Group.GroupDescription].ToString();
                GroupRole.Value = ds.Tables[0].Rows[0][Group.RoleId].ToString();
            }


            //this.Page_Load(sender, (System.EventArgs)e);
        }

        protected void DeleteButtonClick(object sender, CommandEventArgs e)
        {
            RepeaterDiv.Visible = false;

            GroupDa groupDa = new GroupDa();
            int groupId = int.Parse(e.CommandName);
            DataSet ds = groupDa.GetUsersInGroup(groupId);
            string numberOfUsers = "";

            if (ds.Tables[0].Rows.Count > 0)
            {
                numberOfUsers = ds.Tables[0].Rows[0]["UserCount"].ToString();

                valMsg.Text = "There are " + numberOfUsers + " users associated with this group. Are you sure you want to delete it?";
            }
            else
            {
                valMsg.Text = "There are currently no users associated with this group. Confirm delete?";
            }
            valMsg.Text += "<br><br><a href=\"AdminGroups.aspx?delete=yes&groupId=" + groupId + "\">Yes</a>&nbsp;&nbsp;&nbsp;&nbsp;<a href=\"AdminGroups.aspx\">No</a>";
        }

        protected bool ValidateGroup()
        {
            return true;
        }
    }
}
