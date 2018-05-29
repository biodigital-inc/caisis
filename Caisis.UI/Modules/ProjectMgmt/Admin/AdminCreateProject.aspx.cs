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
    public partial class AdminCreateProject : ProjectMgmtBasePage
    {
        private string LetterOfIntentId
        {
            get
            {
                return Request.QueryString["loiId"];
            }
        }

        private string ProjectApprovalId
        {
            get
            {
                return Request.QueryString["projectApprovalId"];
            }
        }

        protected override void Page_Load(object sender, EventArgs e)
        {
            base.Page_Load(sender, e);
            //LookupCodeDa da = new LookupCodeDa();
            //DataTable codes = da.GetLookupsByFieldName("ProjectApprovalType").Tables[0];
            //if (codes.Rows.Count>0)
            //{
            //    int parentLkpId = int.Parse(codes.Rows[0]["LookupCodeId"].ToString());
            //    DataTable childCodes = da.GetChildCodesByLookupIdAndChildLookupName(parentLkpId, "ProjectType");
            //}
            if (!string.IsNullOrEmpty(ProjectId) && !Page.IsPostBack)
            {
                PopulateForm(ProjectId);
            }
            else if (!Page.IsPostBack)
            {
                ProjectManagementDa projDA = new ProjectManagementDa();
                ProjectNum.Text = projDA.GetIDForProject();
            }
        }

        protected void PopulateForm(string projId)
        {
            if (!string.IsNullOrEmpty(projId))
            {
                int projectId = int.Parse(projId);
                Project biz = new Project();
                biz.Get(projectId);
                CICHelper.SetFieldValues(this.Controls, biz);

                ProjectNum.Text = biz[Project.ProjectNum].ToString();

                if (!String.IsNullOrEmpty(biz[Project.AdditionalFormNames].ToString()))
                {
                    if (IncludeFormRadioList.Items.FindByValue(biz[Project.AdditionalFormNames].ToString()) != null)
                        IncludeFormRadioList.SelectedValue = biz[Project.AdditionalFormNames].ToString();
                }
            }
        }

        /// <summary>
        /// Returns true if the selected ProjectType needs an approval record, else false.
        /// </summary>
        /// <param name="projectType"></param>
        /// <returns></returns>
        private bool FormNeedsApprovalStep(string projectType)
        {
            LookupCodeDa da = new LookupCodeDa();
            // LookupCode ProjectApprovalType should contain a single lookup value
            // used to link child codes as needing approval step.
            DataTable dt = da.GetLookupsByFieldName("ProjectApprovalType").Tables[0];
            DataRow[] singleType = dt.Select("LkpCode = 'ProjectApprovalType'");
            if (singleType.Length > 0)
            {
                int parentCodeId = int.Parse(singleType[0]["LookupCodeId"].ToString());
                // Get all the ProjectTypes which need approval
                DataTable childCodes = da.GetChildCodesByLookupIdAndChildLookupName(parentCodeId, "ProjectType");
                // If projectType is in this list, we need an approval step
                if (childCodes.Select("LkpCode = '" + PageUtil.EscapeSingleQuotesForSql(projectType) + "'").Length > 0)
                {
                    return true;
                }
            }
            return false;
        }

        protected void OnCreateNewProjectClick(object sender, EventArgs e)
        {
            // Create New Biz Object
            Project biz = new Project();
            // Verify required fields
            bool fieldsValid = !string.IsNullOrEmpty(ProjectTitle.Value) && !string.IsNullOrEmpty(ProjectType.Value);

            // If fields are valid, proceed with update/insert
            if (fieldsValid)
            {
                bool isInsert = true;
                // Load Project records if working with existing projectid
                if (!string.IsNullOrEmpty(ProjectId))
                {
                    biz.Get(int.Parse(ProjectId));
                    isInsert = false;
                }

                // Populate and Save Biz
                CICHelper.SetBOValues(this.Controls, biz, 0);

                if (String.IsNullOrEmpty(biz[Project.ProjectNum].ToString()))
                {
                    ProjectManagementDa projDA = new ProjectManagementDa();
                    biz[Project.ProjectNum] = projDA.GetIDForProject();
                }

                biz[Project.AdditionalFormNames] = IncludeFormRadioList.SelectedValue;

                biz.Save();

                // Create child records if needed
                string projId = biz[Project.ProjectId].ToString();
                int priKey = int.Parse(projId);
                if (isInsert)
                {
                    //ProjectMgmtUtil.CreateProjectChildRecords(priKey);
                }
                // Load/Create LOI Record if needed
                string loiId = string.Empty;
                //if (LetterOfIntent.Checked)
                if (IncludeFormRadioList.SelectedValue == "Letter Of Intent")
                {
					//ProjectLetterOfIntent letter = new ProjectLetterOfIntent();
					//letter.GetByParent(priKey);
					//if (letter.RecordCount == 0)
					//{
					//    letter[ProjectLetterOfIntent.ProjectId] = projId;
					//    letter[ProjectLetterOfIntent.CreationDate] = DateTime.Now;

					//    ProjectManagementDa projDA = new ProjectManagementDa();
					//    letter[ProjectLetterOfIntent.LOINumber] = projDA.GetIDForLOI();
					//    letter.Save();
					//}
					//loiId = letter[ProjectLetterOfIntent.ProjectLetterOfIntentId].ToString();

					var criteria = new Dictionary<string, object>() { { ProjectLetterOfIntent.ProjectId, priKey } };

					if (!BusinessObject.Exists<ProjectLetterOfIntent>(criteria))
					{
						ProjectLetterOfIntent letter = new ProjectLetterOfIntent();
						letter[ProjectLetterOfIntent.ProjectId] = projId;
						letter[ProjectLetterOfIntent.CreationDate] = DateTime.Now;

						ProjectManagementDa projDA = new ProjectManagementDa();
						letter[ProjectLetterOfIntent.LOINumber] = projDA.GetIDForLOI();
						letter.Save();

						loiId = letter[ProjectLetterOfIntent.ProjectLetterOfIntentId].ToString();
					}
					else
					{
						var letters = BusinessObject.GetByParent<ProjectLetterOfIntent>(priKey);
						loiId = letters.First()[ProjectLetterOfIntent.ProjectLetterOfIntentId].ToString();
					}
                }

                // Load/Create ProjectApproval Record if needed
                string projectApprovalId = string.Empty;
                //if (FormNeedsApprovalStep(ProjectType.Value))
                if (IncludeFormRadioList.SelectedValue == "Project Proposal")
                {
					//ProjectLetterOfIntent letter = new ProjectLetterOfIntent();
					//letter.GetByParent(priKey);
					//if (letter.RecordCount == 0)
					//{
					//    letter[ProjectLetterOfIntent.ProjectId] = projId;
					//    letter[ProjectLetterOfIntent.CreationDate] = DateTime.Now;
					//    letter.Save();
					//}
					//projectApprovalId = letter[ProjectLetterOfIntent.ProjectLetterOfIntentId].ToString();

					var criteria = new Dictionary<string, object>() { { ProjectLetterOfIntent.ProjectId, priKey } };

					if (!BusinessObject.Exists<ProjectLetterOfIntent>(criteria))
					{
						ProjectLetterOfIntent letter = new ProjectLetterOfIntent();
						letter[ProjectLetterOfIntent.ProjectId] = projId;
						letter[ProjectLetterOfIntent.CreationDate] = DateTime.Now;
						letter.Save();

						projectApprovalId = letter[ProjectLetterOfIntent.ProjectLetterOfIntentId].ToString();
					}
					else
					{
						var letters = BusinessObject.GetByParent<ProjectLetterOfIntent>(priKey);
						projectApprovalId = letters.First()[ProjectLetterOfIntent.ProjectLetterOfIntentId].ToString();
					}
                }
                TransferToNextStep(projId, loiId, projectApprovalId);
            }
        }

        protected void TransferToNextStep(string projId, string loiId, string projectApprovalId)
        {
            string redirectPath = string.Empty;
            if (!string.IsNullOrEmpty(projectApprovalId))
            {
                redirectPath = "AdminProjectApproval.aspx?projectId=" + projId + "&projectApprovalId=" + projectApprovalId;
            }
            else if (!string.IsNullOrEmpty(loiId))
            {
                redirectPath = "AdminLetterOfIntent.aspx?projectId=" + projId + "&loiId=" + loiId;
            }
            else
            {
                redirectPath = "AdminAddEditInstitutionAndContacts.aspx?projectId=" + projId + "&isWizard=true";
            }
            Response.Redirect(redirectPath);
        }
    }
}