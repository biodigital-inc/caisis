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

using Caisis.Security;

namespace Caisis.UI.Admin
{
	/// <summary>
	/// Summary description for AdminRoles.
	/// </summary>
	public partial class AdminRoles : AdminBasePage
	{

		protected ImageButton DeleteBtn, EditBtn;
		protected HtmlSelect Permissions;
		protected HtmlInputText RoleName;
		
		override protected void Page_Load(object sender, System.EventArgs e)
		{
			base.Page_Load(sender, e);

			//user confirmed delete, delete then show list of groups again
			if(Request.QueryString["delete"] != null && Request.QueryString["delete"].Equals("yes"))
			{
				Role role = new Role();
				int roleId = int.Parse(Request.QueryString["roleId"].ToString());
				role.Delete(roleId);
				
				this.ShowRoleList();
			}

			//add new link was clicked
			//else if(Request.QueryString["addNew"] != null && Request.QueryString["addNew"].Equals("yes"))
			//{
			//	RepeaterDiv.Visible = false;
			//	AddRoleTable.Visible = true;
			//	UpdateBtn.Visible = false;
			//	AddBtn.Visible = true;
			//}

			//default case, load list of groups
			else
			{
				this.ShowRoleList();	
			}
		}
		
		protected void ShowRoleList()
		{
			RepeaterDiv.Visible = true;
			RoleDa rda = new RoleDa();
			DataSet uds = rda.GetRoles();
			rptRoles.DataSource = uds.Tables[0].DefaultView;
			rptRoles.DataBind();
		}
		   
       
		private int GetPermissionId(string permName)
		{
            int permId = -1;
            PermissionDa permDa = new PermissionDa();
			DataSet ds = permDa.GetByName(permName);
            /*if (ds.Tables[0].Rows.Count == 0)
            {
                // if permission didn't exist we insert it
                // TODO : need new permission structure to allow them to be added to the DB and not based on class def
                Permission p = new Permission();
                p[Permission.Permission_Field] = permName;
                p[Permission.PermissionDescription] = "default"; // need interface to add/update permissions
                p.Save();
                permId = (int)p[Permission.PermissionId];
            }*/
            //else
            //{
                permId = Convert.ToInt32(ds.Tables[0].Rows[0]["PermissionId"].ToString());
            //}

			return permId;
		}

       

		protected void DeleteButtonClick(object sender, CommandEventArgs e)
		{
			RepeaterDiv.Visible = false;
			
			int roleId = int.Parse(e.CommandName);
			valMsg.Text = "This role may have one or more groups associated with it. If so, all the users in the group will no longer have access to patients of the dataset the group is associated with.<br><br>Are you sure you would like to delete?";
			valMsg.Text += "<br><br><a href=\"AdminRoles.aspx?delete=yes&roleId=" + roleId + "\">Yes</a>&nbsp;&nbsp;&nbsp;&nbsp;<a href=\"AdminRoles.aspx\">No</a>";
		}

		protected bool ValidateRole(int roleId)
		{
			return true;		
		}
	}
}
