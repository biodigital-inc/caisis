using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;
using System.Data;

using Caisis.BOL;
using Caisis.DataAccess;

using Caisis.UI.Core.Classes;

namespace Caisis.UI.Admin
{
    public partial class User_Edit : AdminBasePage
    {
        protected string QueryUserId
        {
            get
            {
                return Request.QueryString["userId"];
            }
        }

        protected bool IsNew
        {
            get
            {
                return string.IsNullOrEmpty(UserIdField.Value);
            }
        }

        protected override void OnInit(EventArgs e)
        {
            // simple case
            string random = Request.QueryString["random"];
            if (!string.IsNullOrEmpty(random) && random.Equals(bool.TrueString, StringComparison.OrdinalIgnoreCase))
            {
                string randomPassword = PageUtil.GenPassword(8);
                Response.Write(randomPassword);
                Response.End();
            }
            base.OnInit(e);
        }

        protected override void Page_Load(object sender, EventArgs e)
        {
            base.Page_Load(sender, e);
            if (!Page.IsPostBack)
            {
                int? userId = null;
                if (!string.IsNullOrEmpty(QueryUserId))
                {
                    userId = int.Parse(QueryUserId);
                    PopulateUser(userId.Value);
                    getSignature();
                }
                else
                {
                    PopulateBlankUser();
                }
                BuildUserGroups(userId);
                RandomizePassword();

                SetUserEmailFrame(userId, null);
                EmailUserRow.Visible = IsNew;

            }
        }

        private void RandomizePassword()
        {
            NewUserPassword.Text = PageUtil.GenPassword(8);
        }

        private void PopulateBlankUser()
        {
            Username.Enabled = true;
            CurrentUserPanel.Visible = false;
            CurrentUserTabsPanel.Visible = false;
            NewUserPanel.Visible = true;
            EmailUserRow.Visible = true;

            // set buttons
            DeleteBtn.Visible = false;
        }

        private void PopulateUser(int userId)
        {
            User biz = new User();
            biz.Get(userId);
            CICHelper.SetFieldValues(this.Controls, biz);
            // don't show password
            UserPasswordRow.Visible = false;
            RandomPasswordCheck.Visible = false;
            // set deactivate status
            if (!biz.IsNull(BOL.User.DeactivatedTime))
            {
                DeactivateUser.Checked = true;
                DeactivateDate.Value = ((DateTime)biz[BOL.User.DeactivatedTime]).ToShortDateString();
            }

            // update hidden field
            UserIdField.Value = userId.ToString();

            // show relevant fields for current user
            Username.Enabled = false;
            CurrentUserPanel.Visible = true;
            CurrentUserTabsPanel.Visible = true;
            NewUserPanel.Visible = false;
            EmailUserRow.Visible = false;


            // set buttons
            DeleteBtn.Visible = true;

            UserTitle.Text = LastName.Value + ", " + FirstName.Value + " (" + Username.Value + ")";

            UserEntered.Text = "Added to Caisis " + ((DateTime)biz[BOL.User.EnteredTime]).ToShortDateString() + " by " + (biz[BOL.User.EnteredBy]).ToString();
            if (!biz.IsNull(BOL.User.UpdatedTime))
                LastUpdated.Text = "Last Updated " + ((DateTime)biz[BOL.User.UpdatedTime]).ToShortDateString() + " by " + (biz[BOL.User.UpdatedBy]).ToString();
        }

        private void BuildUserGroups(int? userId)
        {
            GroupsList.Items.Clear();

            if (userId.HasValue)
            {
                GroupDa da = new GroupDa();
                DataView groupsList = da.GetGroupsByUser(userId.Value).DefaultView;
                groupsList.Sort = BOL.Group.GroupName + " ASC";

                // build list of avialble groups
                // groupsList.RowFilter = BOL.UserGroup.UserGroupId + " IS NULL";
                GroupsList.DataSource = groupsList;
                GroupsList.DataBind();
                SetGroupCheckBox(GroupsList, groupsList.Table);
                
                // build list of current groups
                groupsList.RowFilter = BOL.UserGroup.UserGroupId + " IS NOT NULL";
                UserGroupsPanel.Visible = true;
                CurrentUserGroupsRptr.DataSource = groupsList;
                CurrentUserGroupsRptr.DataBind();

                BuildUserAttributes(userId.Value);

                AddUserGroupText.Visible = true;
            }
            else
            {
                DataView groupsList = BOL.BusinessObject.GetAllAsDataView<BOL.Group>();
                groupsList.Sort = BOL.Group.GroupName + " ASC";

                // build list of avialble groups
                GroupsList.DataSource = groupsList;
                GroupsList.DataBind();

                // build list of current groups (empty)
                UserGroupsPanel.Visible = false;
                CurrentUserGroupsRptr.DataSource = null;
                CurrentUserGroupsRptr.DataBind();

                AddUserGroupText.Visible = false;
            }
        }

        private void BuildUserAttributes(int userId)
        {
            // user attributes
            DataView usersAttributes = BusinessObject.GetByParentAsDataView<UserAttribute>(userId);
            usersAttributes.Sort = UserAttribute.UserAttributeType + " ASC," + UserAttribute.UserAttributeName + " ASC";
            UserAttributesRptr.DataSource = usersAttributes;
            UserAttributesRptr.DataBind();
        }

        private void SetGroupCheckBox(CheckBoxList cbl, DataTable userGroups)
        {
            foreach (ListItem item in cbl.Items)
            {
                if (!string.IsNullOrEmpty(item.Value))
                {
                    int groupId = int.Parse(item.Value);
                    item.Selected = userGroups.Select(UserGroup.GroupId + " = " + groupId + " AND " + UserGroup.UserGroupId + " IS NOT NULL").Count() > 0;
                }
            }
        }

        #region event handlers

        protected void SaveClick(object sender, EventArgs e)
        {
            // important, capture state locally
            bool isNewUser = IsNew;

            // validate
            if (!isNewUser || ValidateUser())
            {
                int? userId = null;
                User user = new User();
                // !important: password is a special case
                string clearPassword = "";
                string hashedPassword = "";
                if (!isNewUser)
                {
                    userId = int.Parse(UserIdField.Value);
                    user.Get(userId.Value);
                    hashedPassword = user[BOL.User.UserPassword].ToString();
                }
                else
                {
                    clearPassword = UserPassword.Text;
                    hashedPassword = GetHasedPassword(clearPassword);
                }
                // set field values
                CICHelper.SetBOValues(this.Controls, user, -1);
                // !important (persist password)
                user[BOL.User.UserPassword] = hashedPassword;

                // deactivated ?
                if (DeactivateUser.Checked)
                {
                    DateTime deactivateDate = DateTime.Today;
                    string deactivateDateText = DeactivateDate.Value;
                    // validate deactivate date
                    if (DateTime.TryParse(deactivateDateText, out deactivateDate))
                    {
                        user[BOL.User.DeactivatedTime] = deactivateDate;
                    }
                }
                else
                {
                    user[BOL.User.DeactivatedTime] = null;
                }

                // insert/update
                user.Save();
                userId = (int)user[user.PrimaryKeyName];

                // UDPATE GROUPS

                // determine which checkbox list is updating/inserting
                CheckBoxList groupsList = GroupsList;
                // get lookup of current user's GroupId -> UserGroupId
                Dictionary<int, int> currentGroups = new Dictionary<int, int>();
                if (!isNewUser)
                {
                    currentGroups = BOL.BusinessObject.GetByFields<UserGroup>(new Dictionary<string, object> { { UserGroup.UserId, userId.Value } }).ToDictionary(r => (int)r[UserGroup.GroupId], r => (int)r[UserGroup.UserGroupId]);
                }
                foreach (ListItem item in groupsList.Items)
                {
                    if (!string.IsNullOrEmpty(item.Value))
                    {
                        int groupId = int.Parse(item.Value);
                        // insert if checked and not currently assigned (or new)
                        if (item.Selected && (isNewUser || !currentGroups.ContainsKey(groupId)))
                        {
                            UserGroup biz = new UserGroup();
                            biz[UserGroup.UserId] = userId.Value;
                            biz[UserGroup.GroupId] = groupId;
                            biz.Save();
                        }
                        // if unchecked and currently assigned, remove
                        else if (!isNewUser && !item.Selected && currentGroups.ContainsKey(groupId))
                        {
                            int userGroupId = currentGroups[groupId];
                            UserGroup biz = new UserGroup();
                            biz.Delete(userGroupId);
                        }
                    }
                }

                // reload page for new user
                //if (isNewUser)
                //{
                //    Response.Redirect("User_Edit.aspx?userId=" + userId.Value + (EmailUser.Checked ? "#EmailUserTab" : ""));
                //}
                // otherwise, re-populate
                //else
                //{
                // repopulate patient and groups
                PopulateUser(userId.Value);
                BuildUserGroups(userId);

                // email frame
                SetUserEmailFrame(userId, EmailUser.Checked ? clearPassword : "");
                if (isNewUser)
                {
                    if (EmailUser.Checked)
                    {
                        Page.ClientScript.RegisterStartupScript(this.GetType(), "setActiveTab", "setActiveTab('email');", true);
                    }
                    SetUpdatedMessage("User '" + Username.Value + "' has been created.");
                }
                else
                {
                    SetUpdatedMessage("User '" + Username.Value + "' has been updated.");
                }
                //}
            }
            else
            {
                SetUpdatedMessage("A user with this username already exists.");
            }

            // check if adding a new user attribute
            AddUserAttribute(sender, e);
        }

        protected void UpdatePasswordClick(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(UserIdField.Value))
            {
                int userId = int.Parse(UserIdField.Value);
                BOL.User user = new User();
                user.Get(userId);
                // update password field
                string clearPassword = NewUserPassword.Text;
                string hashedPassword = GetHasedPassword(clearPassword);
                user[BOL.User.UserPassword] = hashedPassword;
                user.Save();
                // refresh random password
                RandomizePassword();

                string username = user[BOL.User.UserName].ToString();
                SetUpdatedMessage("User " + username + "'s password has been updated.");
                SetUserEmailFrame(userId, clearPassword);
            }
        }

        protected void DeleteClick(object sender, EventArgs e)
        {
            // delete user
            if (!string.IsNullOrEmpty(UserIdField.Value))
            {
                int userId = int.Parse(UserIdField.Value);
                BOL.User biz = new User();
                biz.Delete(userId);
            }
            // redirect to list
            Response.Redirect("User_List.aspx");
        }

        protected void DeleteUserGroup(object sender, CommandEventArgs e)
        {
            string userGroupId = e.CommandArgument.ToString();
            if (!string.IsNullOrEmpty(userGroupId))
            {
                // delete user group
                UserGroup biz = new UserGroup();
                biz.Delete(int.Parse(userGroupId));

                // re-populate groups
                BuildUserGroups(int.Parse(UserIdField.Value));
            }
        }
        protected void DeleteUserAttribute(object sender, CommandEventArgs e)
        {
            string userAttributeId = e.CommandArgument.ToString();
            if (!string.IsNullOrEmpty(userAttributeId))
            {
                // delete user userAttributeId
                BOL.UserAttribute biz = new UserAttribute();
                biz.Delete(int.Parse(userAttributeId));

                // re-populate groups
                BuildUserGroups(int.Parse(UserIdField.Value));
            }
        }

        protected void AddUserAttribute(object sender, EventArgs e)
        {
            int? userId = null;
            if (!string.IsNullOrEmpty(QueryUserId))
            {
                userId = int.Parse(QueryUserId);
            }

            string type = AddAttributeType.Value;
            string name = AddAttributeName.Value;
            string value = AddAttributeValue.Value;

            if (userId.HasValue && !string.IsNullOrEmpty(type) && !string.IsNullOrEmpty(name) && !string.IsNullOrEmpty(value))
            {
                BOL.UserAttribute biz = new UserAttribute();
                biz[BOL.UserAttribute.UserId] = userId.Value;
                biz[BOL.UserAttribute.UserAttributeType] = type;
                biz[BOL.UserAttribute.UserAttributeName] = name;
                biz[BOL.UserAttribute.UserAttributeValue] = value;
                biz.Save();

                // build list
                BuildUserAttributes(userId.Value);
                // reset fields
                AddAttributeType.Value = "";
                AddAttributeName.Value = "";
                AddAttributeValue.Value = "";
            }
        }

        #endregion


        protected bool ValidateUser()
        {
            var user = BOL.BusinessObject.GetByFields<User>(new Dictionary<string, object> { { BOL.User.UserName, Username.Value } }).FirstOrDefault();
            if (user != null)
            {
                string name = user[BOL.User.UserName].ToString();
                string fname = user[BOL.User.UserFirstName].ToString();
                string lname = user[BOL.User.UserLastName].ToString();

                //valMsg.Text = "** Invalid entry: username " + name + " is already being used by: " + fname + " " + lname + "";

                return false;
            }
            else
            {
                return true;
            }
        }

        protected void SetUserEmailFrame(int? userId, string userPassword)
        {
            string emailURL = "AdminEmailUser.aspx?userId=" + (userId.HasValue ? userId.ToString() : "") + "&encpswd=" + (!string.IsNullOrEmpty(userPassword) ? Security.CustomCryptoHelper.Encrypt(userPassword) : "");
            emailUserFrame.Attributes["src"] = emailURL;
        }

        /// <summary>
        /// Regitsers a client script giving the user a message about udpate, delete, etc...
        /// </summary>
        /// <param name="message"></param>
        private void SetUpdatedMessage(string message)
        {
            string messageScript = "setUserUpdateMessage('" + PageUtil.EscapeSingleQuotes(message) + "');";
            Page.ClientScript.RegisterStartupScript(this.GetType(), "setUserUpdateMessage", messageScript, true);
        }

        private string GetHasedPassword(string password)
        {
            string hashedPassword = FormsAuthentication.HashPasswordForStoringInConfigFile(password, "MD5");
            return hashedPassword;
        }


        private void setSignatureLink(DataRow signatureRecord)
        {

                string fileId = signatureRecord[UploadedFile.FileId].ToString();
                string fileExtension = signatureRecord[UploadedFile.FileExtension].ToString();
                string fileLabel = signatureRecord[UploadedFile.FileLabel].ToString();

                AddSignatureLink.Style["display"] = "none";
                SignatureImage.Style["display"] = "";

                UploadedFile biz = new UploadedFile();
                biz.Get(int.Parse(fileId));
                SignatureImage.ImageUrl = "../Plugins/FileLoader/DocumentLoader.aspx?fileId=" + Security.CustomCryptoHelper.Encrypt(fileId);
                SignatureImage.ToolTip = "Click to view or change signature.";
        }



        private void getSignature()
        {

            FilesDa da = new FilesDa();
            DataSet ds = da.GetRecordsByTableAndTablePK("Users", int.Parse(this.QueryUserId));

            UserSignatureRow.Visible = true;

            if (ds.Tables[0].Rows.Count > 0)
            {

                foreach (DataRow dr in ds.Tables[0].Rows)
                {
                    bool isFileAnImage = IMG_EXTENSIONS.Contains(dr[UploadedFile.FileExtension].ToString()) ? true : false;
                    string fileLabel = dr[UploadedFile.FileLabel].ToString();
                    if (isFileAnImage && fileLabel.ToUpper() == "SIGNATURE")
                    {
                        setSignatureLink(dr);
                    }
                }
            }



        }



        public static readonly List<string> IMG_EXTENSIONS = new List<string>(new string[] { ".jpg", ".jpeg", ".gif", ".bmp", ".png" });


    }
}