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

using Caisis.DataAccess;
using Caisis.BOL;
using Caisis.UI.Core.Classes;
using Caisis.UI.Core.Classes.CustomControls;

namespace Caisis.UI.Modules.ProjectMgmt
{
    public partial class EditLetterOfIntentField : ProjectMgmtBasePage
    {
        private int loiId;
        private ProjectMgmtAddFormBaseControl addFormControl = null;

        protected override void Page_Load(object sender, EventArgs e)
        {
            base.Page_Load(sender, e);
            this.EnableViewState = true;

            // Load additional form
            LoadAddFormControl();

            string field = Request.QueryString["field"];
            List<ICaisisInputControl> cicList = CICHelper.GetCaisisInputControls(addFormControl);
            bool isNotesField = false;
            foreach (ICaisisInputControl cic in cicList)
            {
                if (cic.Field == field)
                {
                    Page.ClientScript.RegisterStartupScript(typeof(Page), "FocusOnField", "document.getElementById('" + (cic as Control).ClientID + "').focus();", true);
                    if (cic is CaisisTextArea)
                    {
                        isNotesField = true;
                        break;
                    }
                }
            }
            // If editing a TextArea, only show that field
            // else show all non-textarea fields
            foreach (ICaisisInputControl cic in cicList)
            {
                if (isNotesField)
                {
                    cic.Visible = cic.Field == field;
                }
                else
                {
                    cic.Visible = !(cic is CaisisTextArea);
                }
            }

            // Only need to populate form is record exits 
            if (!string.IsNullOrEmpty(ProjectId))
            {
                int projectId = int.Parse(ProjectId);
				//ProjectLetterOfIntent biz = new ProjectLetterOfIntent();
				//biz.GetByParent(projectId);
				//if (biz.RecordCount > 0)

				ProjectLetterOfIntent biz = BusinessObject.GetByParent<ProjectLetterOfIntent>(projectId).First();
				if (!biz.IsEmpty)
                {
                    loiId = int.Parse(biz[ProjectLetterOfIntent.ProjectLetterOfIntentId].ToString());
                    if (!Page.IsPostBack)
                        addFormControl.Populate(loiId);
                }
            }

        }

        private void LoadAddFormControl()
        {
            Project bizProject = new Project();
            bizProject.Get(Int32.Parse(ProjectId));

            //if (bizProject.RecordCount > 0)
			if (!bizProject.IsEmpty)
            {
                if (bizProject[Project.AdditionalFormNames].ToString() == "Project Proposal")
                {
                    addFormControl = (ProjectMgmtAddFormBaseControl)this.LoadControl("Controls/ProjectApprovalEditor.ascx");
                    EditorHolder.Controls.Add(addFormControl);
                }
                else
                {
                    String strGIField = Request.QueryString["GIField"];
                    if (String.IsNullOrEmpty(strGIField) || strGIField.Equals("false"))
                        addFormControl = (ProjectMgmtAddFormBaseControl)this.LoadControl("Controls/LetterOfIntentEditor.ascx");
                    else
                        addFormControl = (ProjectMgmtAddFormBaseControl)this.LoadControl("Controls/LetterOfIntentEditorGI.ascx");
                    EditorHolder.Controls.Add(addFormControl);
                }
            }
        }

        /// <summary>
        /// Updates the record and closes page is loaded in a modal window
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void SaveRecord(object sender, EventArgs e)
        {
            addFormControl.Save(loiId);
            string qs = "?projectId=" + ProjectId;
            base.RegisterUpdatePageScript(qs, true);
        }
    }
}