using System;
using System.Data;
using System.Configuration;
using System.ComponentModel;
using System.Collections.Generic;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

namespace Caisis.UI.Modules.ProjectMgmt
{
    /// <summary>
    /// An ImageButton which is enabled/visible based on User Premissions defined in base page.
    /// </summary>
    public class ProjectMgmtButton : ImageButton
    {
        private string[] _userTypeNames;
        private ProjectMgmtUsers[] _userTypes;

        private ProjectMgmtContext _projectContext;

        // signals that the context is defined by client code
        private bool _customContext = false;

        public ProjectMgmtButton()
        {
            // Set default UserTypes allowed button access
            UserTypeNames = new string[] { ProjectMgmtUsers.ModuleAdmin.ToString(), ProjectMgmtUsers.ProjectAdmin.ToString() };
        }

        /// <summary>
        /// When control is loaded, set visibility based ob UserType
        /// </summary>
        /// <param name="e"></param>
        protected override void OnLoad(EventArgs e)
        {
            base.OnLoad(e);
            SetButtonVisibility();
        }


        [TypeConverter(typeof(StringArrayConverter))]
        /// <summary>
        /// Gets or sets the UserTypes which should have this button available/visible.
        /// </summary>
        public string[] UserTypeNames
        {
            get
            {
                return _userTypeNames;
            }
            set
            {
                _userTypeNames = value;
                SetParsedUserTypes();
            }
        }

        /// <summary>
        /// Gets an arary of ProjectMgmtUsers 
        /// </summary>
        public ProjectMgmtUsers[] UserTypes
        {
            get
            {
                return _userTypes;
            }
        }

        /// <summary>
        ///  Sets the Project Context for the button, 
        /// i.e. only show in certain situations, such as project view
        /// </summary>
        public ProjectMgmtContext ProjectContext
        {
            get
            {
                return _projectContext;
            }
            set
            {
                _projectContext = value;
                _customContext = true;
            }
        }

        /// <summary>
        /// Determine visibility of control based on UserType
        /// </summary>
        private void SetButtonVisibility()
        {
            // Determine if page is ProjectMgmt page and read user type
            // to determine visibility
            if (Page is ProjectMgmtBasePage)
            {
                ProjectMgmtBasePage projectPage = Page as ProjectMgmtBasePage;
                ProjectMgmtContext activePageContext = projectPage.ProjectContext;
                ProjectMgmtUsers activeUserType = projectPage.UserType;

                // Buttons default visibility = false
                bool hasPermission = false;

                foreach (ProjectMgmtUsers type in _userTypes)
                {
                    if (activeUserType == type && (!_customContext || _customContext && _projectContext == activePageContext))
                    {
                        hasPermission = true;
                        break;
                    }
                }

                // Finally set button visibility
                this.Visible = hasPermission;
                this.Enabled = hasPermission;
            }
        }

        private void SetParsedUserTypes()
        {
            // Set array of User Types by parsing string values
            _userTypes = new ProjectMgmtUsers[_userTypeNames.Length];
            for (int i = 0; i < _userTypeNames.Length; i++)
            {
                string userTypeName = _userTypeNames[i];
                _userTypes[i] = (ProjectMgmtUsers)Enum.Parse(typeof(ProjectMgmtUsers), userTypeName);
            }
        }
    }

}
