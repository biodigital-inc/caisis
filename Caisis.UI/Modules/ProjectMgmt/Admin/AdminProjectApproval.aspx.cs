using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

using Caisis.BOL;
using Caisis.UI.Core.Classes;
using Caisis.UI.Core.Classes.CustomControls;
using System.Collections.Generic;
using Caisis.DataAccess;

namespace Caisis.UI.Modules.ProjectMgmt
{
    public partial class AdminProjectApproval : ProjectMgmtBasePage
    {
        private List<string> diseaseStates = new List<string>();

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
            this.EnableViewState = true;
            if (!Page.IsPostBack && !string.IsNullOrEmpty(ProjectApprovalId))
            {
                PopulateForm(int.Parse(ProjectApprovalId));
            }
        }

        /// <summary>
        /// Populates fields based on biz object
        /// </summary>
        /// <param name="projectApprovalId"></param>
        protected void PopulateForm(int projectApprovalId)
        {
            ProjectLetterOfIntent biz = new ProjectLetterOfIntent();
            biz.Get(projectApprovalId);
            CICHelper.SetFieldValues(this.Controls, biz);
            List<ICaisisInputControl> cicList = PageUtil.GetCaisisInputControlsInContainer(this.Page);
            foreach (ICaisisInputControl cic in cicList)
            {
                string jsDesc = "showFieldDescription(this,'" + cic.Field + "');";
                if (cic is CaisisTextBox)
                {
                    (cic as CaisisTextBox).Attributes.Add("onfocus", jsDesc);
                }
                else if (cic is CaisisSelect)
                {
                    (cic as CaisisSelect).Attributes.Add("onfocus", jsDesc);
                }
                else if (cic is CaisisTextArea)
                {
                    CaisisTextArea cicTA = cic as CaisisTextArea;
                    cicTA.Attributes.Add("onfocus", jsDesc);
                    // Locate helper HTML node used for displaying HTML content contained
                    // in TextArea node
                    string helperHTMLDivId = cicTA.ID + "HTML";
                    HtmlGenericControl helperDIV = this.FindControl(helperHTMLDivId) as HtmlGenericControl;
                    if (helperDIV != null)
                    {
                        helperDIV.InnerHtml = cic.Value;
                    }

                }
                else if (cic is CaisisCheckBox)
                {
                    (cic as CaisisCheckBox).Attributes.Add("onchange", jsDesc);
                }
            }

			//if (biz.RecordCount > 0)
			if (!biz.IsEmpty)
            {
                string strDiseaseState = biz[ProjectLetterOfIntent.PopulationDiseaseState].ToString();
                diseaseStates = new List<string>(strDiseaseState.Split(','));
                PopulateDiseaseState();
            }
        }

        private void SaveLOI()
        {
            // Verify that projectid and loi id exist
            if (!string.IsNullOrEmpty(ProjectApprovalId) && !string.IsNullOrEmpty(ProjectId))
            {
                int projectId = int.Parse(ProjectId);
                // Load LOI Record
                ProjectLetterOfIntent biz = new ProjectLetterOfIntent();
                biz.Get(int.Parse(ProjectApprovalId));
                // Save Updated Details
                CICHelper.SetBOValues(this.Controls, biz, projectId);

                DiseaseState disState = (DiseaseState)this.FindControl("DiseaseStateEditor");
                if (disState != null)
                    biz[ProjectLetterOfIntent.PopulationDiseaseState] = disState.GetAllCheckedDiseaseStates();

                biz.Save();
            }
        }

        private void PopulateDiseaseState()
        {
            DiseaseState disState = (DiseaseState)this.FindControl("DiseaseStateEditor");
            if (disState != null)
                disState.PopulateDiseaseStateProjApproval(diseaseStates, true);
        }

        /// <summary>
        /// Handles back click, save LOI record and go to project creation
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void HandleBackClick(object sender, EventArgs e)
        {
            SaveLOI();
            // Go To Project Details
            Response.Redirect("AdminCreateProject.aspx?projectId=" + ProjectId + "&projectApprovalId=" + ProjectApprovalId);
        }

        /// <summary>
        /// Handles next click, takes user to associated institutions
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void HandleNextClick(object sender, EventArgs e)
        {
            SaveLOI();
            Response.Redirect("AdminAddEditInstitutionAndContacts.aspx?projectId=" + ProjectId + "&projectApprovalId=" + ProjectApprovalId + "&isWizard=true");
        }
    }
}