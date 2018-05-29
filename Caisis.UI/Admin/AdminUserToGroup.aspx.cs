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

using System.Web.Security;

using Caisis.DataAccess;
using Caisis.BOL;

namespace Caisis.UI.Admin   
{
	/// <summary>
	/// Summary description for AdminUserToGroup.
	/// 
	/// Need to implement insert validation
	/// </summary>
	public partial class AdminUserToGroup : AdminBasePage
	{		
		override protected void Page_Load(object sender, System.EventArgs e)
		{
			base.Page_Load(sender, e);

			valMsg.Text = "";
			groupMessage.Text = "";
			AddBtn.ImageUrl = "../Images/AdminImages/submit.gif"; 
			AddBtn.Width = 65; 
			AddBtn.Height= 21;
			
			SelectUserName.Attributes.Add("onchange", "this.form."+SelectSubmitted.ClientID+".value = 'true'; this.form.submit();");

			if(Page.IsPostBack)
			{
				//check if form is submitted from select box or to update password	
				if(!Request.Form["SelectUserName"].Equals("") && Request.Form["SelectSubmitted"] != null && Request.Form["SelectSubmitted"].Equals("true")) 
				{
					this.ShowGroupSelect(int.Parse(Request.Form["SelectUserName"]));
				}
			}
			else
			{
				// Put user code to initialize the page here
				//don't use AdminUtil function because need username here
				UserDa das = new UserDa();
				DataSet ds = das.GetUsers();
				SelectUserName.DataSource		= ds.Tables[0].DefaultView;
				SelectUserName.DataValueField	= "UserId";
				SelectUserName.DataTextField	= "UserFullName";
				SelectUserName.DataBind();
				SelectUserName.Items.Insert(0,new ListItem(""));

				SelectGroupTable.Visible = false;		
	
				//adding new user 
				if(Request.QueryString["newUser"] != null && Request.QueryString["newUser"].Equals("yes"))
				{
					SelectUserName.Value = Request.QueryString["userId"];

					this.ShowGroupSelect(int.Parse(Request.QueryString["userId"]));
				}
			}

		}//end page_load

		protected void ShowGroupSelect(int userId)
		{
			groupMessage.Text = "";		
			
			GroupDa gda = new GroupDa();

			//get users existing groups
			DataSet uds = gda.GetUserGroupsByUserId(userId);
			rptUserGroups.DataSource = uds.Tables[0].DefaultView;
			rptUserGroups.DataBind();

			if(uds.Tables[0].Rows.Count == 0)
			{
				groupMessage.Text = "No Groups Assigned";
			}
					
			//get groups
			DataSet gds = gda.GetGroups();
			UserGroup.DataSource		= gds.Tables[0].DefaultView;
			UserGroup.DataValueField	= "GroupId";
			UserGroup.DataTextField		= "GroupName";
			UserGroup.DataBind();
			UserGroup.Items.Insert(0,new ListItem(""));

			SelectGroupTable.Visible = true;
		}

		protected void AddButtonClick(object sender, System.Web.UI.ImageClickEventArgs e)
		{
			if(!Request.Form["UserGroup"].Equals("") && !Request.Form["UserGroup"].Equals(""))
			{                
				int userId = int.Parse(Request.Form["SelectUserName"]);
				int groupId = int.Parse(Request.Form["UserGroup"]);
			
				if(ValidateUserGroup())
				{
                    Caisis.BOL.UserGroup biz = new Caisis.BOL.UserGroup();
                    biz[Caisis.BOL.UserGroup.UserId] = userId;
                    biz[Caisis.BOL.UserGroup.GroupId] = groupId;
                    biz.Save();
				}

				this.ShowGroupSelect(userId);
				//this.Page_Load(sender, (System.EventArgs)e);
			}
			else
			{
				valMsg.Text = "You must select a user name and group.";
			}
		}
		
		protected void DeleteButtonClick(object sender, CommandEventArgs e)
		{
            int userGroupId = int.Parse(e.CommandArgument.ToString());
            Caisis.BOL.UserGroup biz = new Caisis.BOL.UserGroup();
            biz.Delete(userGroupId);
			
			this.Page_Load(sender, (System.EventArgs)e);
		}

		protected bool ValidateUserGroup()
		{
			return true;
		}
	}
}
