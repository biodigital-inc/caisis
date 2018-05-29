using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

namespace Caisis.UI.Modules.ProjectMgmt
{
    /// <summary>
    /// A ProjectMgmt page containing details of a project for viewing and editing.
    /// </summary>
    public class ProjectMgmtDetailsPage : ProjectMgmtBasePage
    {
        private static readonly string DETAILS_HEADER_ID = "DetailsHeader";
        private static readonly string EDIT_QUERY_STRING = "edit";

        public ProjectMgmtDetailsPage()
            : base()
        {

        }

        /// <summary>
        /// Get whether this page is an edit page, signaled by query string "edit"
        /// </summary>
        public bool IsEditPage
        {
            get
            {
                string editString = GetQueryValue(EDIT_QUERY_STRING);
                bool isEdit = !string.IsNullOrEmpty(editString) ? bool.Parse(editString) : false;
                return isEdit;
            }
        }

        /// <summary>
        /// Various controls are hidden based on their role in a details page.
        /// </summary>
        /// <param name="e"></param>
        protected override void OnPreRender(EventArgs e)
        {
            base.OnPreRender(e);

            // When rendering details page, in edit mode hide header if exist
            Label detailsHeader = Page.FindControl(DETAILS_HEADER_ID) as Label;
            if (detailsHeader != null)
            {
                detailsHeader.Visible = !IsEditPage;
            }
        }
    }
}
