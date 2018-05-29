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

namespace Caisis.UI.Modules.ProjectMgmt
{
    /// <summary>
    /// Summary description for ProjectMgmtBaseControl
    /// </summary>
    public class ProjectMgmtBaseControl : BaseControl
    {
        // Case Insensitive Query String And From Key
        private static readonly string PROJECT_FORM_KEY = "projectId";
        private static readonly string ORG_FORM_KEY = "organizationId";

        /// <summary>
        /// Gets the current ProjectId based on QueryString/Form name "projectId"
        /// </summary>
        public string ProjectId
        {
            get
            {
                return GetValueFromQueryForm(PROJECT_FORM_KEY);
            }
        }

        public string OrganizationId
        {
            get
            {
                return GetValueFromQueryForm(ORG_FORM_KEY);
            }
        }


        private string GetValueFromQueryForm(string key)
        {
            string valFromQuery = Request.QueryString[key];
            string valFromForm = Request.Form[key];
            if (valFromQuery == null && valFromForm == null)
            {
                return string.Empty;
            }
            else if (valFromQuery != null && valFromForm == null)
            {
                return valFromQuery;
            }
            else if (valFromQuery == null && valFromForm != null)
            {
                return valFromForm;
            }
            else
            {
                if (valFromQuery == valFromForm)
                {
                    return valFromQuery;
                }
                else
                {
                    throw new Exception("Posted " + key + " value does not match " + key + " from query string.");
                }
            }

        }

        public ProjectMgmtBaseControl()
        {
            //
            // TODO: Add constructor logic here
            //
        }
    }
}
