using System;
using System.Data;

using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;

using System.Data.SqlClient;
using System.Web.Security;

using Caisis.DataAccess;
using Caisis.BOL;

using Caisis.UI.Core.Classes;

namespace Caisis.UI.Admin
{
	/// <summary>
	/// Summary description for AdminPageAddUser.
	/// </summary>
	public partial class AdminEditDeleteUser : AdminBasePage
	{

		

		override protected void Page_Load(object sender, System.EventArgs e)
		{
			base.Page_Load(sender, e);

			valMsg.Text = "";



			SelectUserName.Attributes.Add("onchange", "this.form."+SelectSubmitted.ClientID+".value = 'true'; this.form.submit();");

			//DeleteBtn.Attributes.Add("onClick", "confirmDelete();");

			if(Page.IsPostBack)
			{
			
				//check if form is submitted from select box or to add/delete	
				if(Request.Form["SelectSubmitted"] != null && Request.Form["SelectSubmitted"].Equals("true")) 
				{
					//select box submitted form, populate forms fields
					//UserDa da = new UserDa();
					//DataSet userDs = da.GetByUserId( int.Parse(Request.Form["SelectUserName"]));
					//DataRow userDr = userDs.Tables[0].Rows[0];

                    User userDr = new User();
                    userDr.Get(int.Parse(Request.Form["SelectUserName"]));

					UserName.Value = userDr["UserName"].ToString();
					UserEmail.Value = userDr["UserEmail"].ToString();
					UserFirstName.Value = userDr["UserFirstName"].ToString();
					UserLastName.Value = userDr["UserLastName"].ToString();
                    UserEmployeeId.Value = userDr[BOL.User.UserEmployeeId].ToString();

					// set deactivate checkbox and time is not null
					string dDate = "";
					if(userDr["DeactivatedTime"] != null && PageUtil.IsDate(userDr["DeactivatedTime"].ToString()))
					{
						dDate = ((DateTime)userDr["DeactivatedTime"]).ToShortDateString();
					}
					DeactivateDate.Value = dDate;
					
					if(userDr["DeactivatedTime"] != null && userDr["DeactivatedTime"].ToString().Length > 0)
					{
						Deactivate.Checked = true;
					}
					else
					{
						Deactivate.Checked = false;
					}
			
					FormTable.Visible = true;

					SelectSubmitted.Value = "false";
				}
			}
			//page just loaded, show select with usernames
			else
			{
				this.SetUserDropDown();
		
				FormTable.Visible = false;
			}
		}

		protected void CancelButtonClick(object sender, CommandEventArgs e)
		{
			//clear fields
			SelectUserName.Value = "";
			UserName.Value = "";
			UserEmail.Value = "";
			UserFirstName.Value = "";
			UserLastName.Value = "";
            UserEmployeeId.Value = "";
			DeactivateDate.Value = "";
			Deactivate.Checked = false;
						
			//reset drop down
			this.SetUserDropDown();

			this.Page_Load(sender, e);
		}

		protected void UpdateButtonClick(object sender, CommandEventArgs e)
		{
			//validate update
			if(ValidateUpdate())
			{
				//update
				this.UpdateUserRecord(int.Parse(Request.Form["SelectUserName"]));

				valMsg.Text = "User has been updated. Select another or use the navigation to the left.";
			}
		}
		protected void DeleteButtonClick(object sender, CommandEventArgs e)
		{
			this.DeleteUserRecord(int.Parse(Request.Form["SelectUserName"]));
						
			//clear fields
			SelectUserName.Value = "";
			UserName.Value = "";
			UserEmail.Value = "";
			UserFirstName.Value = "";
			UserLastName.Value = "";
            UserEmployeeId.Value = "";

						
			//reset drop down
			this.SetUserDropDown();
						
			//hide table
			FormTable.Visible = false;

			valMsg.Text = "User has been deleted. Select another or use the navigation to the left.";
		}

		protected bool ValidateUpdate()
		{
			bool returnVal = true;
			valMsg.Text = "";

			// if selected, check that deactivate date is the correct format
			if(Request.Form["Deactivate"] != null && Request.Form["Deactivate"].Equals("yes"))
			{
				if(Request.Form["DeactivateDate"] == null || Request.Form["DeactivateDate"].Length < 4 || !PageUtil.IsDate(Request.Form["DeactivateDate"]))	
				{
					valMsg.Text += "Error: Deactivate date not in DateFormat";
					return returnVal = false;
				}
			}

			//TODO: set valMsg if problem. check for duplicate usernames
			
			return returnVal;
		}

		protected void UpdateUserRecord(int userId)
		{
            object deactivateDate;

            if(PageUtil.IsDate(Request.Form["DeactivateDate"]))
			{
				deactivateDate = DateTime.Parse(Request.Form["DeactivateDate"].ToString());
			}
			else
			{
				deactivateDate = System.DBNull.Value;
			}

            User u = new User();
            u.Get(userId);
            u[BOL.User.UserFirstName] = UserFirstName.Value;
            u[BOL.User.UserLastName] = UserLastName.Value;
            u[BOL.User.UserName] = UserName.Value;
            u[BOL.User.UserEmail] = UserEmail.Value;
            u[BOL.User.UserEmployeeId] = UserEmployeeId.Value;
            u[BOL.User.DeactivatedTime] = deactivateDate;

            u.Save();

            # region pre v5.0
            //UserDa da = new UserDa();
            //object deactivateDate;
            //Caisis.Security.SecurityController sc = new Caisis.Security.SecurityController();
            //bool returnVal = da.UpdateUserRecord(userId, Request.Form["UserName"], Request.Form["UserFirstName"], Request.Form["UserLastName"], Request.Form["UserEmail"], deactivateDate, sc.GetUserName());
            //return returnVal;
            # endregion 
        }

		protected void DeleteUserRecord(int userId)
		{
			//UserDa da = new UserDa();
			//bool returnVal = da.DeleteUserRecord(userId
			//return returnVal;

            Caisis.BOL.User u = new User();
            u.Delete(userId);
		}
    
		protected void SetUserDropDown()
		{
			
			UserDa das = new UserDa();
			DataSet ds = das.GetUsers();
			SelectUserName.DataSource		= ds.Tables[0].DefaultView;
			SelectUserName.DataValueField	= "UserId";
			SelectUserName.DataTextField	= "UserFullName";
			SelectUserName.DataBind();
			SelectUserName.Items.Insert(0,new ListItem(""));
		}
	}
}
