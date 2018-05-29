using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

using Caisis.DataAccess;
using Caisis.BOL;
using Caisis.UI.Core.Classes;
using Caisis.Security;

namespace Caisis.UI.Modules.ProjectMgmt
{

    /// <summary>
    /// A context in which a page is realated to a Project.
    /// </summary>
    public enum ProjectMgmtContext
    {
        Global,
        Project,
        Organization
    }

    /// <summary>
    /// A permission which defines a user's role in a Project
    /// </summary>
    public enum ProjectMgmtUsers
    {
        ModuleAdmin,
        ProjectAdmin,
        ProjectUser
    }

    /// <summary>
    /// A base page for ProjectMgmt which contains permission and Project context logic
    /// </summary>
    public class ProjectMgmtBasePage : BasePage
    {
        // variables
        private ProjectMgmtContext _projectContext;
        private ProjectMgmtUsers _userType;
        private string _projectId;
        private string _organizationId;
        private bool isWizard;

        // Case Insensitive Query String And From Keys
        private static readonly string QUERY_PROJECT_KEY = "projectId";
        private static readonly string QUERY_ORG_KEY = "organizationId";
        private static readonly string QUERY_CONTEXT_KEY = "context";
        private static readonly string QUERY_IS_WIZARD_KEY = "isWizard";

        public ProjectMgmtBasePage()
        {
            // Default user type is regular user
            _userType = ProjectMgmtUsers.ProjectUser;
        }

        /// <summary>
        /// Gets the current User Type based on permissions assigned to the group the user belong to
        /// </summary>
        public ProjectMgmtUsers UserType
        {
            get
            {
                return _userType;
            }
        }

        /// <summary>
        /// Gets the context for the current page, i.e. Global, Project or Organization
        /// </summary>
        public ProjectMgmtContext ProjectContext
        {
            get
            {
                return _projectContext;
            }
        }

        /// <summary>
        /// Gets the current ProjectId based on QueryString name "projectId"
        /// </summary>
        public string ProjectId
        {
            get
            {
                return _projectId;
            }
        }

        /// <summary>
        /// Gets the current OrganizationId based on QueryString name "organizationId"
        /// </summary>
        public string OrganizationId
        {
            get
            {
                return _organizationId;
            }
        }

        /// <summary>
        /// Gets if this page is a wizard page, i.e., next/prev buttons
        /// </summary>
        public bool IsWizardPage
        {
            get
            {
                return isWizard;
            }
        }

        /// <summary>
        /// During initalization set permissions and context, to be used by page
        /// </summary>
        /// <param name="e"></param>
        protected override void OnInit(EventArgs e)
        {
            base.OnInit(e);

            // Get defaults for project and organization
            _projectId = GetQueryValue(QUERY_PROJECT_KEY);
            _organizationId = GetQueryValue(QUERY_ORG_KEY);

            SetUserPermissions();
            SetPageContextAndVariables();
        }

        /// <summary>
        /// Read paramaters off query string and determine context
        /// </summary>
        private void SetUserPermissions()
        {
            if (PermissionManager.HasPermission(PermissionManager.AdminProjectModule) || PermissionManager.HasPermission(PermissionManager.EditSecurity))
            {
                _userType = ProjectMgmtUsers.ModuleAdmin;
            }
            else if (PermissionManager.HasPermission(PermissionManager.AdminProject))
            {
                SecurityController sc = new SecurityController();
                string userName = sc.GetUserName();

                // If working with a Project, determine if user is part of project
                if (!string.IsNullOrEmpty(ProjectId))
                {
                    UserDa userDa = new UserDa();
                    int userId = userDa.GetUserId(userName);

                    ProjectManagementDa projectDa = new ProjectManagementDa();
                    DataTable contactsInProject = projectDa.GetProjectContactsByProjectId(int.Parse(ProjectId));
                    string userInProjectQuery = Contact.UserId + " IS NOT NULL AND " + Contact.UserId + " = " + userId;

                    // Query contacts in project to see if user is associated with this Project
                    if (contactsInProject.Select(userInProjectQuery).Length > 0)
                    {
                        _userType = ProjectMgmtUsers.ProjectAdmin;
                    }
                    // User permissions for this project defaults to regular user
                    else
                    {
                        _userType = ProjectMgmtUsers.ProjectUser;
                    }
                }
                // If not working in project, user will have normal access to normal 
                //ProjectAdmin Administrative functions
                else
                {
                    _userType = ProjectMgmtUsers.ProjectAdmin;
                }
            }
            else if (PermissionManager.HasPermission(PermissionManager.UpdateProject))
            {
                _userType = ProjectMgmtUsers.ProjectUser;
            }
        }

        /// <summary>
        /// Initalizes page level variables accoring to the Context of the Page
        /// </summary>
        private void SetPageContextAndVariables()
        {
            // is wizard
            string wiz = GetQueryValue(QUERY_IS_WIZARD_KEY);
            if (!string.IsNullOrEmpty(wiz))
            {
                isWizard = bool.Parse(wiz);
            }
            else
            {
                isWizard = false;
            }


            // Context shouldn't be passed in query string
            //// Set page context
            //string contextQueryParam = GetQueryValue(QUERY_CONTEXT_KEY);
            //// If context is passed as part of query string, set context
            //if (Enum.IsDefined(typeof(ProjectMgmtContext), contextQueryParam))
            //{
            //    _projectContext = (ProjectMgmtContext)Enum.Parse(typeof(ProjectMgmtContext), contextQueryParam, true);
            //}
            //// Else, context will be determined based on query params
            //else
            //{


            if (string.IsNullOrEmpty(_projectId) && string.IsNullOrEmpty(_organizationId))
            {
                _projectContext = ProjectMgmtContext.Global;
            }
            else if (!string.IsNullOrEmpty(_projectId) && string.IsNullOrEmpty(_organizationId))
            {
                _projectContext = ProjectMgmtContext.Project;
            }
            else if (!string.IsNullOrEmpty(_projectId) && !string.IsNullOrEmpty(_organizationId))
            {
                _projectContext = ProjectMgmtContext.Organization;
            }
            else
            {
                // In this case projectId is empty but org id is valid, should not
                // be the case??
                _projectContext = ProjectMgmtContext.Global;
            }
            //}
            // After context is set, we need to then handle variables
            // NOTE: Do not empty out variables???
            //switch (_projectContext)
            //{
            //    // Project and Organization have no meaning in this context
            //    case (ProjectMgmtContext.Global):
            //        _projectId = string.Empty;
            //        _organizationId = string.Empty;
            //        break;
            //    // In the context of a project, no org should exist
            //    case (ProjectMgmtContext.Project):
            //        _organizationId = string.Empty;
            //        break;
            //    // Case doesn't need to be handled, values initally defined above
            //    case (ProjectMgmtContext.Organization):
            //        break;
            //}

        }

        /// <summary>
        /// Gets the value of the query string key.
        /// </summary>
        /// <param name="key">Keys whose "value" will be retuned</param>
        /// <returns>The value defined  by the key</returns>
        public string GetQueryValue(string key)
        {
            string queryValue = QueryKeyExists(key) ? Page.Request.QueryString[key] : string.Empty;
            return queryValue;
        }

        /// <summary>
        /// Returns whether or not a query string key exits, i.e. ?key=value
        /// </summary>
        /// <param name="key">The key to search for in the query string</param>
        /// <returns>True if the key exits, else false</returns>
        public bool QueryKeyExists(string key)
        {
            bool nullKey = Page.Request.QueryString[key] == null;
            return !nullKey;
        }

        /// <summary>
        /// Reloads main list page(if applicable w/ query string)
        /// </summary>
        /// <param name="query">query string to append to page, must include "?". Empty string reloads current url.</param>
        /// <param name="hideModal">determine if modal should be closed, after running update</param>
        public void RegisterUpdatePageScript(string query, bool hideModal)
        {
            string doHideModal = hideModal.ToString().ToLower();
            string jsExecute = "if(updateMainPage) { updateMainPage('" + query + "'); } if(top.hideModal && " + doHideModal + ") { top.hideModal(); }";
            Page.ClientScript.RegisterStartupScript(typeof(Page), "UpdateMainPageScript", jsExecute, true);

        }
    }
}
