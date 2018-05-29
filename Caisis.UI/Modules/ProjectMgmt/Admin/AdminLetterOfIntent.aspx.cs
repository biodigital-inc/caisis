using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Collections.Generic;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

using Caisis.BOL;
using Caisis.UI.Core.Classes;
using Caisis.UI.Core.Classes.CustomControls;

namespace Caisis.UI.Modules.ProjectMgmt
{
    public partial class AdminLetterOfIntent : ProjectMgmtBasePage
    {
        private string LetterOfIntentId
        {
            get
            {
                return Request.QueryString["loiId"];
            }
        }

        protected override void Page_Load(object sender, EventArgs e)
        {
            base.Page_Load(sender, e);
            this.EnableViewState = true;
            if (!Page.IsPostBack && !string.IsNullOrEmpty(LetterOfIntentId))
            {
                PopulateLargeFields();

                LOIForm.Populate(int.Parse(LetterOfIntentId));
            }
            else if (Page.IsPostBack)
            {
                RestoreLargeFieldsFromHidden();
            }

            HtmlGenericControl htmlContrl = this.FindControl("BackGroundHTML") as HtmlGenericControl;
        }

        private void RestoreLargeFieldsFromHidden()
        {
            List<ICaisisInputControl> cicList = PageUtil.GetCaisisInputControlsInContainer(this.Page);
            foreach (ICaisisInputControl cic in cicList)
            {
                string jsDesc = "showFieldDescription(this,'" + cic.Field + "');";
                if (cic is CaisisTextArea)
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
            }
        }

        protected void PopulateLargeFields()
        {
            ProjectLetterOfIntent biz = new ProjectLetterOfIntent();
            biz.Get(Int32.Parse(LetterOfIntentId));
            CICHelper.SetFieldValues(this.Controls, biz);
            List<ICaisisInputControl> cicList = PageUtil.GetCaisisInputControlsInContainer(this);
            foreach (ICaisisInputControl cic in cicList)
            {
                if (cic is CaisisTextArea)
                {
                    string jsDesc = "showFieldDescription(this,'" + cic.Field + "');";

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
            }
        }

        /// <summary>
        /// Handles back click, save LOI record and go to project creation
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void HandleBackClick(object sender, EventArgs e)
        {
            SaveLargeFields();

            LOIForm.Save(int.Parse(LetterOfIntentId));

            // Go To Project Details
            Response.Redirect("AdminCreateProject.aspx?projectId=" + ProjectId + "&loiId=" + LetterOfIntentId);
        }

        /// <summary>
        /// Handles next click, takes user to associated institutions
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void HandleNextClick(object sender, EventArgs e)
        {
            SaveLargeFields();
            LOIForm.Save(int.Parse(LetterOfIntentId));
            Response.Redirect("AdminAddEditInstitutionAndContacts.aspx?projectId=" + ProjectId + "&loiId=" + LetterOfIntentId + "&isWizard=true");
        }

        protected void SaveAndPrint(object sender, EventArgs e)
        {
            SaveLargeFields();

            LOIForm.Save(int.Parse(LetterOfIntentId));

            string printScript = "window.open('..//LetterOfIntent.aspx?IsEditable=true&projectId=" + ProjectId + "','PrintView', 'toolbars=no,resize=no,scrollbars=yes,width=800,height=700,left=300,top=200');";

            Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "Print", printScript, true);
        }

        private void SaveLargeFields()
        {
            // Verify that projectid and loi id exist
            if (!string.IsNullOrEmpty(LetterOfIntentId) && !string.IsNullOrEmpty(ProjectId))
            {
                int projectId = int.Parse(ProjectId);
                // Load LOI Record
                ProjectLetterOfIntent biz = new ProjectLetterOfIntent();
                biz.Get(int.Parse(LetterOfIntentId));
                // Save Updated Details
                CICHelper.SetBOValues(this.Controls, biz, projectId);
                biz.Save();
            }
        }
    }
}
