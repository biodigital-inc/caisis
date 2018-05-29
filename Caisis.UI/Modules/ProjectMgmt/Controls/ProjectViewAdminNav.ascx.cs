using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

using Caisis.BOL;
using Caisis.DataAccess;
using Caisis.UI.Core.Classes;
using Caisis.UI.Core.Classes.CustomControls;

namespace Caisis.UI.Modules.ProjectMgmt
{
    /// <summary>
    /// Contains the navigation elements for an Admin level view of a Project.
    /// </summary>
    public partial class ProjectViewAdminNav : ProjectMgmtBaseControl
    {
        protected override void Page_Load(object sender, EventArgs e)
        {
            base.Page_Load(sender, e);
            SetProjectViewLevel();
            SetLinkPermissions();
        }

        private void SetLinkPermissions()
        {
            if (Page is ProjectMgmtBasePage)
            {
                ProjectMgmtBasePage page = Page as ProjectMgmtBasePage;
                // Regular user shouldn't see funding sources
                if (page.UserType == ProjectMgmtUsers.ProjectUser)
                {
                    Funding.Visible = false;
                }
                // Hide if in context of organization
                if (page.ProjectContext != ProjectMgmtContext.Project)
                {
                    this.Visible = false;
                }
                else
                {
                    Funding.HRef = Page.ResolveUrl("ProjectFunding.aspx?projectId=" + ProjectId);
                }
            }
        }

        /// <summary>
        /// Sets menus and links based on instituion level view or broad overview
        /// </summary>
        protected void SetProjectViewLevel()
        {
            // Show/Hide letter of intent list item
			//ProjectLetterOfIntent loi = new ProjectLetterOfIntent();
			//loi.GetByParent(int.Parse(ProjectId));
			//LOI.Visible = loi.RecordCount > 0;
			//if (loi.RecordCount == 0)
			IEnumerable<ProjectLetterOfIntent> loi = BusinessObject.GetByParent<ProjectLetterOfIntent>(int.Parse(ProjectId));

			if (loi.Count() == 0)
            {
                LOI.Visible = false;
                LOIResponse.Visible = false;

            }
            else
            {
                Project biz = new Project();
                biz.Get(int.Parse(ProjectId));

                String strAdditionalForms = biz["AdditionalFormNames"].ToString();

                if (!String.IsNullOrEmpty(strAdditionalForms)
                    && strAdditionalForms != "None")
                {
                    LOI.Visible = true;
                    LOI.Title = strAdditionalForms;
                    LOI.InnerText = strAdditionalForms;

                    LOIResponse.HRef = this.ResolveUrl("../ProjectLOIResponse.aspx") + "?projectId=" + ProjectId;

                    if (strAdditionalForms == "Project Proposal")
                    {
                        LOI.HRef = this.ResolveUrl("../ProjectApproval.aspx") + "?projectId=" + ProjectId;
                        LOIResponse.Title = "Proposal Responses";
                        LOIResponse.InnerText = "Proposal Responses";
                    }
                    else if (strAdditionalForms == "Letter Of Intent")
                    {
                        LOI.HRef = this.ResolveUrl("../LetterOfIntent.aspx") + "?projectId=" + ProjectId;
                        LOIResponse.Title = "LOI Response";
                        LOIResponse.InnerText = "LOI Response";
                    }
                }
                else
                {
                    LOI.Visible = false;
                    LOIResponse.Visible = false;
                }

            }
        }

        private static int? GetProtocolId(int projectId)
        {
            Protocol protocol = BOL.BusinessObject.GetByFields<Protocol>(new Dictionary<string, object> { { Protocol.ProjectId, projectId } }).FirstOrDefault();
            if (protocol != null && protocol.PrimaryKeyHasValue)
                return (int)protocol[Protocol.ProtocolId];
            else
                return null;
        }
    }
}