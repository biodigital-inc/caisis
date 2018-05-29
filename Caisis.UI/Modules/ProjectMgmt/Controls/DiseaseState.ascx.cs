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
using Caisis.DataAccess;
using Caisis.UI.Core.Classes.CustomControls;
using System.Collections.Generic;

namespace Caisis.UI.Modules.ProjectMgmt
{
    public partial class DiseaseState : ProjectMgmtBaseControl, IDiseaseState
    {
        private List<string> diseaseStates = new List<string>();
        private bool bEditable;
        private enum ProjectType {LOI, ProjectApproval};

        protected override void Page_Load(object sender, EventArgs e)
        {
            base.Page_Load(sender, e);
            this.EnableViewState = true;
        }

        public void PopulateDiseaseStateLOI(List<string> disStates, bool bEdit)
        {
            PopulateStates(disStates, bEdit, ProjectType.LOI);
        }

        public void PopulateDiseaseStateProjApproval(List<string> disStates, bool bEdit)
        {
            PopulateStates(disStates, bEdit, ProjectType.ProjectApproval);
        }

        private void PopulateStates(List<string> disStates, bool bEdit, ProjectType projType)
        {
            bEditable = bEdit;
            diseaseStates = disStates;
            ProjectManagementDa projDa = new ProjectManagementDa();
            
            DataTable da;
            if (projType == ProjectType.LOI)
                da = projDa.GetAllDiseaseStateCodeLOI();
            else 
                da = projDa.GetAllDiseaseStateCodeProjApproval();
            DiseaseStateRptr.DataSource = da;
            DiseaseStateRptr.DataBind();
        }

        /// <summary>
        /// When item is bound, set title and check box if in list of diseas states
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void OnDiseaseStateRptrBound(object sender, RepeaterItemEventArgs e)
        {
            CheckBox cb = e.Item.FindControl("DiseaseStateCheckBox") as CheckBox;
            cb.Enabled = bEditable;
            if (cb != null)
            {
                string lkpCode = DataBinder.Eval(e.Item.DataItem, "LkpCode").ToString();
                string lkpDesc = DataBinder.Eval(e.Item.DataItem, "LkpDescription").ToString();
                cb.Text = lkpCode;
                cb.ToolTip = lkpDesc;
                if (diseaseStates.Contains(lkpCode))
                {
                    cb.Checked = true;
                }
            }
        }

        public string GetAllCheckedDiseaseStates()
        {
            string strDiseaseState = "";
            List<string> disStates = new List<string>();
            foreach (RepeaterItem item in DiseaseStateRptr.Items)
            {
                CaisisCheckBox diseaseState = item.FindControl("DiseaseStateCheckBox") as CaisisCheckBox;
                if (diseaseState.Checked)
                {
                    disStates.Add(diseaseState.Text);
                }
            }
            return string.Join(",", disStates.ToArray());
        }
    }
}
