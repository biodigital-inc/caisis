using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Collections.Generic;
using System.Text;
using System.ComponentModel;
using System.Drawing;
using System.Web.SessionState;
using System.Security.Principal;
using System.Security.Permissions;

using Caisis.Security;
using Caisis.UI.Core.Classes;
using Caisis.UI.Core.Classes.CustomControls;
using Caisis.BOL;
using Caisis.DataAccess;

namespace Caisis.UI.Modules.SpecimenMgmt
{

    public partial class BTCSpecimenQuery : SpecimenMgmtBasePage
    {
        private bool setCriteria;
        private bool isPostBack;
        private string _identifierType;
        SpecimenManagerDa da = new SpecimenManagerDa();

        protected override void Page_Load(object sender, System.EventArgs e)
        {
            // get ID type from web config
            _identifierType = CaisisConfiguration.GetWebConfigValue("SpecimenModuleDefaultId");
            IdentifierType.Text = _identifierType;

            // Set Helper variables
            isPostBack = Page.IsPostBack;
            setCriteria = !string.IsNullOrEmpty(getQS("setCriteria")); // No Value or Non-existant makes this false
            if (!isPostBack)
            {
                //populating Contacts field
                DataTable contactsdt = da.GetContactsForSpecimens();
                ddlContact.DataSource = contactsdt;
                ddlContact.DataBind();

                LoadPriorQueryParams();
            }
            // attach onClick events for Specimen SubType CheckBoxLists
            BloodSamplesCheckBoxList.Attributes["onClick"] = "checkType('cbBlood');";
            TissueSamplesCheckBoxList.Attributes["onClick"] = "checkType('cbTissue');";
        }

        /// <summary>
        /// Loads QueryString values when page first loads, such as date files, etc. Checkboxes and handled
        /// sepeately when they are databound.
        /// </summary>
        private void LoadPriorQueryParams()
        {
            if (PermissionManager.HasPermission(PermissionManager.ViewPatientIdentifiers))
            {
                ShowAllFieldsRow.Visible = true;
                MrnLbl.Visible = true;
                MrnControl.Visible = true;
                cbBlood.Checked = false;
                foreach (ListItem li in this.BloodSamplesCheckBoxList.Items)
                {
                    li.Selected = false;
                }
            }

            if (setCriteria)
            {
                this.dateCollectionFrom.Value = getQS("CollectDateFrom");
                this.dateCollectionTo.Value = getQS("CollectDateTo");

                string sType = getQS("TypeArr");
                if (sType.IndexOf(this.cbBlood.Value) >= 0)
                {
                    this.cbBlood.Checked = true;
                }
                if (sType.IndexOf(this.cbTissue.Value) >= 0)
                {
                    this.cbTissue.Checked = true;
                }

                this.OtherHistology.Value = getQS("HistopaOther");
                this.ddlHistopathologicalGrade.Value = getQS("HistopaGrade");
                this.ddlContact.Value = getQS("Contact");
                this.OrgQtytxt.Value = getQS("OrgQty");
                this.ddlOptr.Value = getQS("Optr");
                this.ddlUnits.Value = getQS("Units");
                this.RemQtytxt.Value = getQS("RemQty");
                this.ddlRemQtyOptr.Value = getQS("RemOptr");
                this.ddlRemQtyUnits.Value = getQS("RemUnits");
                this.ddlSurgeon.Value = getQS("Surgeon");
                this.ddlEvtTest.Value = getQS("EventTest");
                this.ddlVitalStatus.Value = getQS("VitalStatus");
                this.txtEvtResult.Value = getQS("EventResult");

                // because at this point, the repeater contains zero items
                bool showAll = bool.Parse(getQS("ViewAll"));
                this.showAvailableOnly.Checked = !showAll;
                this.txtIdentifier.Value = getQS("Identifier");
                this.ddlSampleStatus.Value = getQS("SampleStatus");
                this.txtBoxName.Value = getQS("BoxNo");
                this.txtRefNum.Value = getQS("RefNum");
                this.txtMRN.Value = getQS("MRN");
                bool useBoxNameWildcard = bool.Parse(getQS("useBoxNameWildcard"));
                this.wildSrh.Checked = useBoxNameWildcard;
                bool AllFields = bool.Parse(getQS("ViewAllFields"));
                this.ShowAllFields.Checked = AllFields;
            }
        }

        protected override void Render(HtmlTextWriter writer)
        {
            if (!Page.IsPostBack)
            {
                if (Request.QueryString["setCriteria"] != null)
                {
                    string[] histologies = getQS("HistArr").Split(new Char[] { ',' }, StringSplitOptions.RemoveEmptyEntries);
                    CheckItemsInCheckBoxList(this.histologyCheckList, histologies);

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

                        if (PermissionManager.HasPermission(PermissionManager.ViewPatientIdentifiers))
                        {
                            li.Selected = false;
                        }
                    }
                    foreach (ListItem li in this.TissueSamplesCheckBoxList.Items)
                    {
                        li.Selected = true;
                    }
                    //foreach (ListItem li in this.histologyCheckList.Items)
                    //{
                    //    li.Selected = true;
                    //}
                }
            }

            base.Render(writer);
        }

        #region Handle Repeater Logic for CheckBoxes

        /// <summary>
        /// When Repeater is DataBound, bind checkboxes and use their values
        /// to get the LookupCode for the SubTypes. Then, read values from QueryString
        /// and check applicable items.
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        //public void BindSpecimenSubTypesCheckBoxes(object sender, RepeaterItemEventArgs e)
        //{
        //    CheckBoxList subSpecimenCheckBoxList = e.Item.FindControl("SubTypeCheckBoxList") as CheckBoxList;
        //    CheckBox specimenCheckBox = e.Item.FindControl("SpecimenTypeCheckBox") as CheckBox;
        //    string lkpCode = "Specimen_SubType_" + specimenCheckBox.Text.Replace(" ", "");

        //    subSpecimenCheckBoxList.Attributes.Add("onclick", "checkType('" + specimenCheckBox.ClientID + "');");
        //    specimenCheckBox.Attributes.Add("onclick", "checkSubType(this, '" + subSpecimenCheckBoxList.ClientID + "');");

        //    // Bind to lookup codes dynamically
        //    subSpecimenCheckBoxList.DataTextField = "LkpCode";
        //    subSpecimenCheckBoxList.DataValueField = "LkpCode";
        //    subSpecimenCheckBoxList.DataSource = CacheManager.GetLookupCodeList(lkpCode);
        //    subSpecimenCheckBoxList.DataBind();

        //    if (!isPostBack)
        //    {
        //        // Repeater index starts at 0, our Type index starts at 1
        //        int typeIndex = e.Item.ItemIndex + 1;
        //        HandleReturnedParams(typeIndex, specimenCheckBox, subSpecimenCheckBoxList);
        //    }
        //}

        /// <summary>
        /// Handle Checking of CheckBoxes when page is first loaded
        /// </summary>
        //private void HandleReturnedParams(int typePosition, CheckBox typeCheckBox, CheckBoxList subTypeCheckBoxes)
        //{
        //    // If query string was passed from referring page, check items
        //    if (setCriteria)
        //    {
        //        string typeKey = "Type" + typePosition;
        //        string typeVal = getQS(typeKey);
        //        if (!string.IsNullOrEmpty(typeVal))
        //        {
        //            typeCheckBox.Checked = true;
        //            string subTypesKey = "SubType" + typePosition;
        //            string[] subTypesArr = getQS(subTypesKey).Split(new Char[] { ',' }, StringSplitOptions.RemoveEmptyEntries);
        //            CheckItemsInCheckBoxList(subTypeCheckBoxes, subTypesArr);
        //        }
        //    }
        //    else
        //    {
        //        // Check Type CheckBox
        //        typeCheckBox.Checked = true;

        //        // Do not check subtype boxes by default; FS 8/18/08
        //        // Check All SubType CheckBoxes
        //        //foreach (ListItem li in subTypeCheckBoxes.Items)
        //        //{
        //        //    li.Selected = true;
        //        //}
        //    }
        //}
        #endregion

        protected void btnSearch_onClick(Object sender, System.Web.UI.ImageClickEventArgs e)
        {
            string sDateFrom = Request.Form["dateCollectionFrom"];
            string sDateTo = Request.Form["dateCollectionTo"];
            string sampleStatus = Request.Form["ddlSampleStatus"];

            string otherhisto = Request.Form["OtherHistology"];
            string histopathologicalGrade = this.ddlHistopathologicalGrade.SelectedValue;
            string SpecimenContact = this.ddlContact.SelectedValue;
            string specOrgQty = this.OrgQtytxt.Value.Trim();
            string optr = this.ddlOptr.SelectedValue;
            string units = Request.Form["ddlUnits"];
            string specRemQty = this.RemQtytxt.Value.Trim();
            string RemOptr = this.ddlRemQtyOptr.SelectedValue;
            string RemUnits = Request.Form["ddlRemQtyUnits"];
            string surgeon = Request.Form["ddlSurgeon"];
            string eventTest = this.ddlEvtTest.SelectedValue;
            string vital = this.ddlVitalStatus.SelectedValue;

            string identifier = txtIdentifier.Value.Trim();
            string sBoxNo = this.txtBoxName.Value;
            string refNum = this.txtRefNum.Value;
            string mrn = this.txtMRN.Value;
            string eventResult = this.txtEvtResult.Value;

            if (!validateInput(sDateFrom, sDateTo))
            {
                return;
            }

            string histologyArr = GetStringOfCheckedItems(this.histologyCheckList);
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

            bool showAll = !this.showAvailableOnly.Checked;
            string viewAllSpecs = showAll.ToString();

            bool useBoxNameWildcard = this.wildSrh.Checked;
            string BoxNameWildCard = useBoxNameWildcard.ToString();

            bool AllFields = this.ShowAllFields.Checked;
            string viewAllFields = AllFields.ToString();

            string redirectTo = "SpecimenQueryResults.aspx?QueryType=BTCResearch" +
                "&ViewAllFields=" + viewAllFields +
                "&CollectDateFrom=" + sDateFrom +
                "&CollectDateTo=" + sDateTo +
                "&HistArr=" + histologyArr +
                "&HistopaOther=" + otherhisto +
                "&HistopaGrade=" + histopathologicalGrade +
                "&Contact=" + SpecimenContact +
                "&OrgQty=" + specOrgQty +
                "&Optr=" + optr +
                "&Units=" + units +
                "&RemQty=" + specRemQty +
                "&RemOptr=" + RemOptr +
                "&RemUnits=" + RemUnits +
                "&Surgeon=" + surgeon +
                "&EventTest=" + eventTest +
                "&EventResult=" + eventResult +
                "&VitalStatus=" + vital +
                "&Identifier=" + identifier +
                "&IdType=" + _identifierType +
                "&SampleStatus=" + sampleStatus +
                "&BoxNo=" + sBoxNo +
                "&useBoxNameWildcard=" + BoxNameWildCard +
                "&RefNum=" + refNum +
                "&MRN=" + mrn +
                "&ViewAll=" + viewAllSpecs +
                "&TypeArr=" + typesArr + 
                "&BloodSubTypeArr=" + bloodSamplesArr +
                "&TissueSubTypeArr=" + tissueSamplesArr ;

            Response.Redirect(redirectTo);
        }
        
        private bool validateInput(string sDateFrom, string sDateTo)
        {
            return true;
        }
    }
}
