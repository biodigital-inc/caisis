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
using System.Collections.Generic;
using System.Text;

using Caisis.UI.Core.Classes;
using Caisis.UI.Core.Classes.CustomControls;

namespace Caisis.UI.Modules.SpecimenMgmt
{
    public partial class LocalSpecimenQuery : SpecimenMgmtBasePage
    {
        private bool setCriteria;
        private bool isPostBack;
        private string _identifierType; 

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
                LoadPriorQueryParams();
            }
        }

        /// <summary>
        /// Loads QueryString values when page first loads, such as date files, etc. Checkboxes and handled
        /// sepeately when they are databound.
        /// </summary>
        private void LoadPriorQueryParams()
        {
            if (setCriteria)
            {
                this.dateCollectionFrom.Value = getQS("CollectDateFrom");
                this.dateCollectionTo.Value = getQS("CollectDateTo");

                // because at this point, the repeater contains zero items
                bool showAll = bool.Parse(getQS("ViewAll"));
                this.showAvailableOnly.Checked = !showAll;
                //this.ddlIdentifierType.Value = getQS("IdType");
                this.txtIdentifier.Value = getQS("Identifier");
                this.ddlSampleStatus.Value = getQS("SampleStatus");
                this.txtBoxName.Value = getQS("BoxNo");
                this.txtRefNum.Value = getQS("RefNum");
                bool useBoxNameWildcard = bool.Parse(getQS("useBoxNameWildcard"));
                this.wildSrh.Checked = useBoxNameWildcard;

            }
        }

        #region Handle Repeater Logic for CheckBoxes

        /// <summary>
        /// When Repeater is DataBound, bind checkboxes and use their values
        /// to get the LookupCode for the SubTypes. Then, read values from QueryString
        /// and check applicable items.
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        public void BindSpecimenSubTypesCheckBoxes(object sender, RepeaterItemEventArgs e)
        {
            CheckBoxList subSpecimenCheckBoxList = e.Item.FindControl("SubTypeCheckBoxList") as CheckBoxList;
            CheckBox specimenCheckBox = e.Item.FindControl("SpecimenTypeCheckBox") as CheckBox;
            string lkpCode = "Specimen_SubType_" + specimenCheckBox.Text.Replace(" ", "");            

            // Bind to lookup codes dynamically
            subSpecimenCheckBoxList.DataTextField = "LkpCode";
            subSpecimenCheckBoxList.DataValueField = "LkpCode";
            subSpecimenCheckBoxList.DataSource = CacheManager.GetLookupCodeList(lkpCode);
            subSpecimenCheckBoxList.DataBind();

            subSpecimenCheckBoxList.Attributes.Add("onclick", "checkType('" + specimenCheckBox.ClientID + "');");
            //check for subtypes 
            if (subSpecimenCheckBoxList.Items.Count > 0)
            {
                specimenCheckBox.Attributes.Add("onclick", "checkSubType(this, '" + subSpecimenCheckBoxList.ClientID + "');");
            }

            if (!isPostBack)
            {
                // Repeater index starts at 0, our Type index starts at 1
                int typeIndex = e.Item.ItemIndex + 1;
                HandleReturnedParams(typeIndex, specimenCheckBox, subSpecimenCheckBoxList);
            }
        }

        /// <summary>
        /// Handle Checking of CheckBoxes when page is first loaded
        /// </summary>
        private void HandleReturnedParams(int typePosition, CheckBox typeCheckBox, CheckBoxList subTypeCheckBoxes)
        {
            // If query string was passed from referring page, check items
            if (setCriteria)
            {
                string typeKey = "Type" + typePosition;
                string typeVal = getQS(typeKey);
                if (!string.IsNullOrEmpty(typeVal))
                {
                    typeCheckBox.Checked = true;
                    string subTypesKey = "SubType" + typePosition;
                    string[] subTypesArr = getQS(subTypesKey).Split(new Char[] { ',' }, StringSplitOptions.RemoveEmptyEntries);
                    CheckItemsInCheckBoxList(subTypeCheckBoxes, subTypesArr);
                }
            }
            else
            {
                // Check Type CheckBox
                typeCheckBox.Checked = true;
                
                // Do not check subtype boxes by default; FS 8/18/08
                // Check All SubType CheckBoxes
                //foreach (ListItem li in subTypeCheckBoxes.Items)
                //{
                //    li.Selected = true;
                //}
            }
        }
        #endregion

        protected void btnSearch_onClick(Object sender, System.Web.UI.ImageClickEventArgs e)
        {
            string sDateFrom = Request.Form["dateCollectionFrom"];
            string sDateTo = Request.Form["dateCollectionTo"];
            string sampleStatus = Request.Form["ddlSampleStatus"];
            string identifier = txtIdentifier.Value.Trim();
            //string identifierType = Request.Form["ddlIdentifierType;
            string sBoxNo = this.txtBoxName.Value;
            string refNum = this.txtRefNum.Value;

            if (!validateInput(sDateFrom, sDateTo))
            {
                return;
            }

            // Build Query String for Types and SubTypes
            StringBuilder typeSubTypeArray = new StringBuilder();

            foreach (RepeaterItem item in SpecimenTypeRptr.Items)
            {
                CheckBox uniqueSpecimenCheckBox = item.FindControl("SpecimenTypeCheckBox") as CheckBox;
                if (uniqueSpecimenCheckBox.Checked)
                {
                    int typeIndex = item.ItemIndex + 1;
                    string typeKey = "Type" + typeIndex;
                    string typeVal = uniqueSpecimenCheckBox.Text;
                    typeSubTypeArray.Append("&" + typeKey + "=" + typeVal);
                    CheckBoxList uniqueSpecimenSubTypeCheckBox = item.FindControl("SubTypeCheckBoxList") as CheckBoxList;
                    string subTypeKey = "SubType" + typeIndex;

                    typeSubTypeArray.Append("&" + subTypeKey + "=");
                    bool subTypesExists = false;
                    for (int i = 0; i < uniqueSpecimenSubTypeCheckBox.Items.Count; i++)
                    {
                        ListItem subTypeItem = uniqueSpecimenSubTypeCheckBox.Items[i];
                        if (subTypeItem.Selected)
                        {
                            subTypesExists = true;
                            string subTypeVal = subTypeItem.Text;
                            typeSubTypeArray.Append(subTypeVal + ",");
                        }

                    }
                    if (subTypesExists)
                    {
                        typeSubTypeArray.Remove(typeSubTypeArray.Length - 1, 1);
                    }
                    
                }
            }

            bool showAll = !this.showAvailableOnly.Checked;
            string viewAllSpecs = showAll.ToString();

            bool useBoxNameWildcard = this.wildSrh.Checked;
            string BoxNameWildCard = useBoxNameWildcard.ToString();
            
            string redirectTo = "SpecimenQueryResults.aspx?QueryType=Local" +
                "&CollectDateFrom=" + sDateFrom +
                "&CollectDateTo=" + sDateTo +
                "&Identifier=" + identifier +
                "&IdType=" + _identifierType +
                "&SampleStatus=" + sampleStatus +
                "&BoxNo=" + sBoxNo +
                "&useBoxNameWildcard=" + BoxNameWildCard +
                "&RefNum=" + refNum +
                "&ViewAll=" + viewAllSpecs +
            "&NumOfPairs=" + SpecimenTypeRptr.Items.Count;
            
            redirectTo += typeSubTypeArray.ToString();

            Response.Redirect(redirectTo);
        }
       
        // TODO: what type of checking do we need? 
        private bool validateInput(string sDateFrom, string sDateTo)
        {
            return true;
        }



        # region code graveyard
        //private void LoadDefaultForm()
        //{
        //    dateCollectionFrom.Text=base.MySessionString("sv_lqCollectDateFrom");
        //    dateCollectionTo.Text=base.MySessionString("sv_lqCollectDateTo");

        //    switch(base.MySessionString("sv_lqChkBlood"))
        //    {
        //        case "True":
        //            rbBlood.Checked=true;
        //            break;
        //        case "False":
        //            rbBlood.Checked=false;
        //            break;
        //        default:
        //            rbBlood.Checked=false;
        //            break;
        //    }
        //    switch(base.MySessionString("sv_lqChkTissue"))
        //    {
        //        case "True":
        //            rbTissue.Checked=true;
        //            break;
        //        case "False":
        //            rbTissue.Checked=false;
        //            break;
        //        default:
        //            rbTissue.Checked=false;
        //            break;
        //    }

        //    txtTBRefMask.Value=base.MySessionString("sv_lqTBRefNumber");
        //    base.FillDDList(ddlSampleStatus,base.MySessionString("sv_lqDdlSampleStatus"));
        //    txtVialNumber.Value=base.MySessionString("sv_lqTxtVialNumber");
        //}
        /*
         * protected void btnClear_onClick(object sender, System.Web.UI.ImageClickEventArgs e)
		{
			this.dateCollectionFrom.Text="";
			this.dateCollectionTo.Text="";

			this.rbBlood.Checked=false;
			this.rbTissue.Checked=false;
			
            this.txtIdentifier.Value="";
			this.ddlSampleStatus.SelectedIndex=0;
			this.txtVialNumber.Value="";
			this.txtBoxName.Value="";
		}*/
        # endregion
    }
}
