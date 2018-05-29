using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Collections.Generic;
using Caisis.BOL;
using Caisis.UI.Core.Classes.CustomControls;
using Caisis.UI.Core.Classes;

namespace Caisis.UI.Modules.ProjectMgmt
{
    /// <summary>
    /// Summary description for ProjectMgmtAddFormBaseControl
    /// </summary>
    public abstract class ProjectMgmtAddFormBaseControl : ProjectMgmtBaseControl
    {
        protected List<string> diseaseStates = new List<string>();

        public ProjectMgmtAddFormBaseControl()
        {
            //
            // TODO: Add constructor logic here
            //
        }

        protected override void Page_Load(object sender, EventArgs e)
        {
            base.Page_Load(sender, e);
            this.EnableViewState = true;
        }

        public virtual void Populate(int letterOfIntentId)
        {
            ProjectLetterOfIntent biz = new ProjectLetterOfIntent();
            biz.Get(letterOfIntentId);
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
                PopulateDiseaseState(biz[ProjectLetterOfIntent.PopulationDiseaseState].ToString());
                SetCreationDate(biz);
            }
        }

        private void SetCreationDate(ProjectLetterOfIntent biz)
        {
            ICaisisInputControl cntrl = this.FindControl("CreationDate") as ICaisisInputControl;
            if (cntrl != null)
            {
                DateTime dateValue;
                if (DateTime.TryParse(biz[ProjectLetterOfIntent.CreationDate].ToString(), out dateValue))
                    cntrl.Value = dateValue.ToShortDateString();
                else
                    cntrl.Value = "";
            }
        }

        protected abstract void PopulateDiseaseState(string strDiseaseState);

        public virtual void Save(int letterOfIntentId)
        {
            string strDiseaseState = String.Empty;
            IDiseaseState disState = (IDiseaseState)this.FindControl("DiseaseStateEditor");
            if (disState != null)
                strDiseaseState = disState.GetAllCheckedDiseaseStates();

            Save(letterOfIntentId, strDiseaseState);
        }

        protected void Save(int letterOfIntentId, string strDiseaseState)
        {
            ProjectLetterOfIntent biz = new ProjectLetterOfIntent();
            biz.Get(letterOfIntentId);
            // Only want to save fields that are visible, as non visible fields don't retain their original set values
            List<ICaisisInputControl> cicList = CICHelper.GetCaisisInputControls(this.FindControl("MainTable"));
            foreach (ICaisisInputControl cic in cicList)
            {
                if (cic.Visible)
                {
                    if (cic is CaisisCheckBox)
                    {
                        if ((cic as CaisisCheckBox).Checked)
                            biz[cic.Field] = "1";
                        else
                            biz[cic.Field] = "0";
                    }
                    else
                        biz[cic.Field] = cic.Value;
                }
            }

            biz[ProjectLetterOfIntent.PopulationDiseaseState] = strDiseaseState;

            biz.Save();
        }

    }
}