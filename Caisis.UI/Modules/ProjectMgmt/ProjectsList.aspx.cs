using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Collections.Specialized;
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

namespace Caisis.UI.Modules.ProjectMgmt
{
    public partial class ProjectsList : ProjectMgmtBasePage
    {
        private string callbackSearchType;
        private string callbackSearchValue;
        protected int recordCount;

        /// <summary>
        /// Returns if a User's list of projects needs to be fitered by permission
        /// </summary>
        private bool FilterByUser
        {
            get
            {
                return UserType == ProjectMgmtUsers.ProjectUser;
            }
        }

        protected string SortName
        {
            get
            {
                return Request.QueryString["sortName"] + "";
            }
        }

        protected string SortDirection
        {
            get
            {
                return Request.QueryString["sortDirection"] + "";
            }
        }


        /// <summary>
        /// 
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected override void Page_Load(object sender, EventArgs e)
        {
            base.Page_Load(sender, e);
            
            if (!Page.IsPostBack)
            {
                DataView projectsList = new DataView();
                // If filtering by user, determine which project a user belongs
                if (FilterByUser)
                {
                    ProjectManagementDa da = new ProjectManagementDa();
                    string uName = new Caisis.Security.SecurityController().GetUserName();
                    UserDa uda = new UserDa();
                    int uId = uda.GetUserId(uName);
                    projectsList = da.GetAllProjectsByUserId(uId).DefaultView;
                }
                // Else, user has access to all projects
                else
                {
                    //Project biz = new Project();
                    if (String.IsNullOrEmpty(OrganizationId) || OrganizationId.Equals("-1"))
                    {
						//biz.GetAll();
						//projectsList = biz.DataSourceView;
						projectsList = BusinessObject.GetAllAsDataView<Project>();
                    }
                    else
                    {
                        ProjectManagementDa da = new ProjectManagementDa();
                        projectsList = da.GetAllProjectsForOrg(Int32.Parse(OrganizationId)).DefaultView;
                    }
                }
                // Force default sort to earliest records first
                //projectsList.Sort = Project.ProjectId + " ASC";

                // default sort
                projectsList.Sort = "Title";
                
                // SORTING DISABLED
                recordCount = projectsList.Count;
                
                // Bind projects to user's view
                BindProjectList(projectsList);
            }
        }

        /// <summary>
        /// Binds the list of Projects based on User's Permission
        /// </summary>
        /// <param name="dv"></param>
        private void BindProjectList(DataView dv)
        {
            // retain sort
            if (!string.IsNullOrEmpty(SortName))
            {
                dv.Sort = SortName;
            }
            ProjectsListRptr.DataSource = dv;
            ProjectsListRptr.DataBind();
        }

        /// <summary>
        /// Hilight found text in search columns
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void HilightFoundText(object sender, RepeaterItemEventArgs e)
        {
            // If invoked from callback, value is set
            if (!string.IsNullOrEmpty(callbackSearchValue))
            {
                // Search through each search columns and highlight if text found
                foreach (string colName in ProjectManagementDa.SEARCH_COLUMNS)
                {
                    Label labelField = e.Item.FindControl(colName + "Field") as Label;
                    Label first = e.Item.FindControl(colName + "Pre") as Label;
                    Label match = e.Item.FindControl(colName + "Match") as Label;
                    Label pos = e.Item.FindControl(colName + "Post") as Label;
                    if (labelField != null)
                    {
                        string colValue = DataBinder.Eval(e.Item.DataItem, colName).ToString();

                        int textFoundIndex = System.Globalization.CultureInfo.CurrentCulture.CompareInfo.IndexOf(colValue, callbackSearchValue, System.Globalization.CompareOptions.IgnoreCase);
                        if (textFoundIndex > -1)
                        {
                            int textFoundEndIndex = textFoundIndex + callbackSearchValue.Length;
                            first.Text = colValue.Substring(0, textFoundIndex);
                            match.Text = colValue.Substring(textFoundIndex, callbackSearchValue.Length);
                            pos.Text = colValue.Substring(textFoundEndIndex, colValue.Length - textFoundEndIndex);

                            // Hide standard label
                            labelField.Visible = false;
                        }
                        else
                        {
                            // Hide highlighted text labels
                            first.Visible = false;
                            match.Visible = false;
                            pos.Visible = false;
                        }
                    }
                }
            }
        }

        #region SEARCH CALLBACK METHODS
                 
        /// <summary>
        /// 
        /// </summary>
        /// <param name="e"></param>
        protected void DoProjectSearch(Caisis.UI.ClientScript.Ajax.CaisisAjaxEventArgs e)
        {
            callbackSearchType = e.ClientParams["SearchType"];
            callbackSearchValue = e.ClientParams["SearchValue"];

            e.ReturnValue = GetCallbackResult();
        }

        /// <summary>
        /// Gets the table of search results
        /// </summary>
        /// <returns></returns>
        public HtmlGenericControl GetCallbackResult()
        {
            ProjectManagementDa da = new ProjectManagementDa();

            // Determine if need to filter by user id
            DataView projectsList = new DataView();
            if (FilterByUser)
            {
                string uName = new Caisis.Security.SecurityController().GetUserName();
                UserDa uda = new UserDa();
                int uId = uda.GetUserId(uName);

                projectsList = da.ProjectMgmtSearch(callbackSearchValue, uId).DefaultView;
            }
            else
            {
                projectsList = da.ProjectMgmtSearch(callbackSearchValue).DefaultView;
            }

            BindProjectList(projectsList);

            return ContentTableHolder;
        }
        #endregion
    }
}
