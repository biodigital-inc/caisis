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
    public partial class AdvancedBreastSpecimenQuery : SpecimenMgmtBasePage
    {
        protected override void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                LoadPriorQueryParams();
            }

            // attach onClick events for Specimen SubType CheckBoxLists
            BloodSamplesCheckBoxList.Attributes["onClick"] = "checkType('cbBlood');";
            TissueSamplesCheckBoxList.Attributes["onClick"] = "checkType('cbTissue');";
        }

        private void LoadPriorQueryParams()
        {
            if (Request.QueryString["setCriteria"] != null)
            {
                this.txtAgeFrom.Value = getQS("AgeFrom");
                this.txtAgeTo.Value = getQS("AgeTo");

                this.ddlPrimaryHistoricDiagnosis.Value = getQS("PriHistDiag");
                this.ddlHistopathologicalGrade.Value = getQS("HistopaGrade");

                this.ddlER.Value = getQS("ER");
                this.ddlPR.Value = getQS("PR");
                this.ddlHer2ICC.Value = getQS("Her2ICC");
                this.ddlNodePositive.Value = getQS("NodePositive");

                this.ddlAdjuventAgent.Value = getQS("AdjAgent");
                this.cbRelapseStatus.Checked = Convert.ToBoolean(getQS("RelapseStatus"));

                string sType = getQS("TypeArr");
                if (sType.IndexOf(this.cbBlood.Value) >= 0)
                {
                    this.cbBlood.Checked = true;
                }
                if (sType.IndexOf(this.cbTissue.Value) >= 0)
                {
                    this.cbTissue.Checked = true;
                }

                //string[] bloodSubTypes = getQS("BloodSubTypeArr").Split(new Char[] { ',' }, StringSplitOptions.RemoveEmptyEntries);
                //CheckItemsInCheckBoxList(this.BloodSamplesCheckBoxList, bloodSubTypes);
                
                //string[] tissueSubTypes = getQS("TissueSubTypeArr").Split(new Char[] { ',' }, StringSplitOptions.RemoveEmptyEntries);
                //CheckItemsInCheckBoxList(this.TissueSamplesCheckBoxList, tissueSubTypes);

                this.ddlPreservationType.Value = getQS("PreservationType");

                bool showAll = bool.Parse(getQS("ViewAll"));
                this.showAvailableOnly.Checked = !showAll;
            }
        }

        protected override void Render(HtmlTextWriter writer)
        {
            if (!Page.IsPostBack)
            {
                if (Request.QueryString["setCriteria"] != null)
                {
                    string[] bloodSubTypes = getQS("BloodSubTypeArr").Split(new Char[] { ',' }, StringSplitOptions.RemoveEmptyEntries);
                    CheckItemsInCheckBoxList(this.BloodSamplesCheckBoxList, bloodSubTypes);

                    string[] tissueSubTypes = getQS("TissueSubTypeArr").Split(new Char[] { ',' }, StringSplitOptions.RemoveEmptyEntries);
                    CheckItemsInCheckBoxList(this.TissueSamplesCheckBoxList, tissueSubTypes);
                }
                else 
                {
                    //check off everything
                    foreach (ListItem li in this.BloodSamplesCheckBoxList.Items)
                    {
                        li.Selected = true;
                    }
                    foreach (ListItem li in this.TissueSamplesCheckBoxList.Items)
                    {
                        li.Selected = true;
                    }
                }
            }

            base.Render(writer);
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
            string relapseStatus = this.cbRelapseStatus.Checked.ToString();
       
            string bloodSamplesArr = GetStringOfCheckedItems(this.BloodSamplesCheckBoxList);
            string tissueSamplesArr = GetStringOfCheckedItems(this.TissueSamplesCheckBoxList);
            
            string typesArr = System.String.Empty;
            if (!this.cbBlood.Checked && !this.cbTissue.Checked)
            {
                typesArr += this.cbBlood.Value + "," + this.cbTissue.Value;
            }
            else
            {
                if (this.cbBlood.Checked)
                {
                    typesArr = this.cbBlood.Value + ",";
                }
                if (this.cbTissue.Checked)
                {
                    typesArr += this.cbTissue.Value + ",";
                }
                if (!string.IsNullOrEmpty(typesArr))
                {
                    typesArr = typesArr.Remove(typesArr.Length - 1);
                }
            }
            string preservationType = this.ddlPreservationType.SelectedValue;

            bool showAll = !this.showAvailableOnly.Checked;
            string viewAllSpecs = showAll.ToString();

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
                                "&TypeArr=" + typesArr + 
                                "&BloodSubTypeArr=" + bloodSamplesArr +
                                "&TissueSubTypeArr=" + tissueSamplesArr +
                                "&PreservationType=" + preservationType + 
                                "&ViewAll=" + viewAllSpecs;

            //  if (Request.QueryString["showAsLayer"] != null)
            //  {
            //      string escapedRedirectTo = PageUtil.EscapeSingleQuotes(redirectTo);
            //      ClientScript.RegisterClientScriptBlock(Page.GetType(), "xyz", "<script language=javascript>parent.window.location = \"" + escapedRedirectTo + "\";alert(parent.window.location);</script>");
            //}
            //else
            //{
            Response.Redirect(redirectTo);
            //}
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

        #region Code Graveyard
        /*private void ShowHideCloseBtn()
        {
            if (Request.QueryString["showAsLayer"] != null)
            {
                //this.btnClose.Visible = true;
                this.btnCloseRow.Visible = true;
            }
            else
            {
                //this.btnClose.Visible = false;
                this.btnCloseRow.Visible = false;
            }
        }*/

        //protected void btnClose_onClick(object sender, System.Web.UI.ImageClickEventArgs e)
        //{
        //    Page.RegisterClientScriptBlock("closeWindow", "<script language=\"javascript\">closeLayer();</script>");
        //}
        /*protected void btnClear_onClick(object sender, System.Web.UI.ImageClickEventArgs e)
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

            this.BloodSamplesCheckBoxList.ClearSelection();
            this.TissueSamplesCheckBoxList.ClearSelection();

            this.txtAgeFrom.Focus();
        }*/


        //private void CheckItemsInCheckBoxList(CheckBoxList cbl, string s)
        //{
        //    for (int i = 0; i < cbl.Items.Count; i++)
        //    {
        //        if (s.IndexOf(cbl.Items[i].Value) >= 0)
        //        {
        //            cbl.Items[i].Selected = true;
        //        }
        //    }
        //}
        #endregion

    }
}