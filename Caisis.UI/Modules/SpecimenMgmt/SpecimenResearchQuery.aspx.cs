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
using System.Text;

using Caisis.UI.Core.Classes;
using Caisis.UI.Core.Classes.CustomControls;

namespace Caisis.UI.Modules.SpecimenMgmt
{
    public partial class SpecimenResearchQuery : SpecimenMgmtBasePage
    {
        protected override void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                LoadPriorQueryParams();
            }
        }

        private void LoadPriorQueryParams()
        {
            if (Request.QueryString["setDefaultParams"] != null)
            {
                this.txtAgeFrom.Value = getQS("AgeFrom");
                this.txtAgeTo.Value = getQS("AgeTo");

                this.ddlPrimaryHistoricDiagnosis.SelectedValue = getQS("ProHistDiag");
                this.ddlHistopathologicalGrade.SelectedValue = getQS("HistopaGrade");

                this.ddlER.SelectedValue = getQS("ER");
                this.ddlPR.SelectedValue = getQS("PR");
                this.ddlHer2ICC.SelectedValue = getQS("Her2ICC");
                this.ddlNodePositive.SelectedValue = getQS("NodePositive");

                this.ddlAdjuventAgent.SelectedValue = getQS("AdjAgent");
                this.cbRelapseStatus.Checked = Convert.ToBoolean(getQS("RelapseStatus"));

                CheckItemsInCheckBoxList(this.bloodSamplesCheckBoxList, getQS("BloodSamplesArr"));
                CheckItemsInCheckBoxList(this.tissueSamplesCheckBoxList, getQS("TissueSamplesArr"));
                
                this.ddlTissueType.SelectedValue = getQS("TissueType");
            }
        }

        protected void btnSearch_onClick(object sender, System.Web.UI.ImageClickEventArgs e)
        {
            if (!ValidInputs())
            {
                return;
            }

            string ageFrom = this.txtAgeFrom.Value;
            string ageTo = this.txtAgeTo.Value;
            string primaryHistoricDiagnosis = this.ddlPrimaryHistoricDiagnosis.SelectedValue;
            string histopathologicalGrade = this.ddlHistopathologicalGrade.SelectedValue;

            string ER = this.ddlER.SelectedValue;
            string PR = this.ddlPR.SelectedValue;
            string Her2ICC = this.ddlHer2ICC.SelectedValue;
            string nodePositive = this.ddlNodePositive.SelectedValue;

            string adjuventAgent = this.ddlAdjuventAgent.SelectedValue;

            string relapseStatus = "";
            if (this.cbRelapseStatus.Checked == true)
            {
                relapseStatus = "true";
            }
            else
            {
                relapseStatus = "false";
            }

            string bloodSamplesArr = GetStringOfCheckedItems(this.bloodSamplesCheckBoxList);
            string tissueSamplesArr = GetStringOfCheckedItems(this.tissueSamplesCheckBoxList);
      
            string tissueType = this.ddlTissueType.SelectedValue;

            string redirectTo = "SpecimenQueryResults.aspx?QueryType=BreastResearch" +
                                "&AgeFrom=" + ageFrom +
                                "&AgeTo=" + ageTo +
                                "&PriHistDiag=" + primaryHistoricDiagnosis +
                                "&HistopaGrade=" + histopathologicalGrade +
                                "&ER=" + ER +
                                "&PR=" + PR +
                                "&Her2ICC=" + Her2ICC +
                                "&NodePositive=" + nodePositive +
                                "&AdjAgent=" + adjuventAgent +
                                "&RelapseStatus=" + relapseStatus +
                                "&BloodSamplesArr=" + bloodSamplesArr +
                                "&TissueSamplesArr=" + tissueSamplesArr +
                                "&TissueType=" + tissueType;

            if (Request.QueryString["showAsLayer"] != null)
            {
                Page.RegisterClientScriptBlock("xyz", "<script language=javascript>parent.window.location = '" + redirectTo + "'</script>;");
            }
            else
            {
                Response.Redirect(redirectTo);
            }
        }

        protected void btnClear_onClick(object sender, System.Web.UI.ImageClickEventArgs e)
        {
            this.txtAgeFrom.Value = "";
            this.txtAgeTo.Value = "";

            foreach (Control c in this.searchForm.Controls)
            {
                if (c is CaisisSelect)
                {
                    CaisisSelect cs = (CaisisSelect)c;
                    cs.ClearSelection();
                }
            }

            this.bloodSamplesCheckBoxList.ClearSelection();
            this.tissueSamplesCheckBoxList.ClearSelection();
    
            this.txtAgeFrom.Focus();
        }

        /// <summary>
        /// Concatenates all selected values in a CheckBoxList. Values are in single quotes and separated by commas.
        /// </summary>
        /// <param name="cbl"></param>
        /// <returns></returns>
        private string GetStringOfCheckedItems(CheckBoxList cbl)
        {
            StringBuilder sb = new StringBuilder();

            for (int i = 0; i < cbl.Items.Count; i++)
            {
                if (cbl.Items[i].Selected)
                {
                    if (sb.Length > 0)
                        sb.Append(", ");
                    sb.Append("'" + cbl.Items[i].Text + "'");
                }
            }
            return sb.ToString();
        }

        private void CheckItemsInCheckBoxList(CheckBoxList cbl, string s)
        {
            for (int i = 0; i < cbl.Items.Count; i++)
            {
                if (s.IndexOf(cbl.Items[i].Text) >= 0)
                {
                    cbl.Items[i].Selected = true;
                }
            }
        }
 
        private bool ValidInputs()
        {
            string ageFrom = this.txtAgeFrom.Value;
            string ageTo = this.txtAgeTo.Value;
            if (ageFrom.Length > 0 && !PageUtil.IsInteger(ageFrom))
            {
                this.validationMessage.Text = "Age must be a number";
                this.validationMessage.Visible = true;
                return false;
            }
            if (ageTo.Length > 0 && !PageUtil.IsInteger(ageTo))
            {
                this.validationMessage.Text = "Age must be a number";
                this.validationMessage.Visible = true;
                return false;
            }

            this.validationMessage.Visible = false;
            return true;
        }

        protected void SortLookupDescOnDataBind(object sender, EventArgs e)
        {
            CaisisSelect cs = sender as CaisisSelect;
            if (cs.DataSource is DataView)
            {
                DataView dataSource = cs.DataSource as DataView;
                dataSource.Sort = Caisis.BOL.LookupCode.LkpCode + " DESC";
            }
        }
    }
}