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

using Caisis.UI.Core.Classes;
using Caisis.UI.Core.Classes.CustomControls;

namespace Caisis.UI.Modules.SpecimenMgmt
{
    public partial class AdvancedProstateSpecimenQuery : SpecimenMgmtBasePage
    {
        private Boolean IsQueryTypeHistology
        {
            get
            {
                if (ProsSpecQueryTypeRBL.SelectedValue.ToLower() == SearchHistology.QueryType.ToLower())
                {
                    return true;
                }
                else
                {
                    return false;
                }
            }
        }

        private Boolean IsQueryTypeRefNum
        {
            get
            {
                if (ProsSpecQueryTypeRBL.SelectedValue.ToLower() == SearchReferenceNumber.QueryType.ToLower())
                {
                    return true;
                }
                else
                {
                    return false;
                }
            }
        }

        struct SearchHistology
        {
            public const string QueryType = "Histology"; public const string FieldHistology = "Histology";
        };

        struct SearchReferenceNumber
        {
            public const string QueryType = "Reference Number"; public const string FieldReferenceNumber = "ReferenceNumber";
        };

        protected override void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                LoadPriorQueryParams();
                ChooseSearchPane();
            }
        }

        private void LoadPriorQueryParams()
        {
            if (Request.QueryString["setCriteria"] != null)
            {
                if (Request.QueryString["prostateQueryType"] != null && Request.QueryString["prostateQueryType"].ToString().ToLower().Equals(SearchHistology.QueryType.ToLower()))
                {
                    ProsSpecQueryTypeRBL.SelectedValue = SearchHistology.QueryType;

                    this.histologySearchHistology.Value = getQS(SearchHistology.FieldHistology);
                }
                else if (Request.QueryString["prostateQueryType"] != null && Request.QueryString["prostateQueryType"].ToString().ToLower().Equals(SearchReferenceNumber.QueryType.ToLower()))
                {
                    ProsSpecQueryTypeRBL.SelectedValue = SearchReferenceNumber.QueryType;

                    this.refNumSearchRefNum.Value = getQS(SearchReferenceNumber.FieldReferenceNumber);
                }
            }
        }

        private void ChooseSearchPane()
        {
            if (IsQueryTypeHistology)
            {
                ProsSpecQueryHistologyDIV.Style.Remove("display");
                ProsSpecQueryRefNumDIV.Style.Add("display", "none");
            }
            else if (IsQueryTypeRefNum)
            {
                ProsSpecQueryHistologyDIV.Style.Add("display", "none");
                ProsSpecQueryRefNumDIV.Style.Remove("display");
            }
            else
            {   ProsSpecQueryHistologyDIV.Style.Add("display", "none");
                ProsSpecQueryRefNumDIV.Style.Add("display", "none");
            }
        }

        private void ClearHistorySearchFields()
        {
            histologySearchHistology.Text = String.Empty;
            histologySearchShowAvailableOnly.Checked = false;
        }
        private void ClearRefNumSearchFields()
        {
            refNumSearchRefNum.Text = String.Empty;
            refNumSearchShowAvailableOnly.Checked = false;
        }

        # region CLICK EVENTS

        protected void btnSearch_onClick(object sender, System.Web.UI.ImageClickEventArgs e)
        {
            string redirectTo = String.Empty;

            if (!ValidInputs())
            {
                return;
            }

            if (IsQueryTypeHistology)
            {
                string histology = this.histologySearchHistology.Value;
                bool showAll = !this.histologySearchShowAvailableOnly.Checked;
                string viewAllSpecs = showAll.ToString();

                redirectTo = "SpecimenQueryResults.aspx?QueryType=ProstateResearchByHistology" +
                                    "&"+SearchHistology.FieldHistology+"=" + histology +
                                    "&ViewAll=" + viewAllSpecs;
            }
            else if (IsQueryTypeRefNum)
            {
                string refNum = this.refNumSearchRefNum.Value;
                bool showAll = !this.refNumSearchShowAvailableOnly.Checked;
                string viewAllSpecs = showAll.ToString();

                redirectTo = "SpecimenQueryResults.aspx?QueryType=ProstateResearchByReferenceNumber" +
                                    "&"+SearchReferenceNumber.FieldReferenceNumber+"=" + refNum +
                                    "&ViewAll=" + viewAllSpecs;

            }

            Response.Redirect(redirectTo);

        }

        private bool ValidInputs()
        {
            //string ageFrom = this.txtAgeFrom.Value;
            //string ageTo = this.txtAgeTo.Value;
            //if (ageFrom.Length > 0 && !PageUtil.IsInteger(ageFrom))
            //{
            //    this.validationMessage.Text = "Age must be a number";
            //    this.validationMessage.Visible = true;
            //    return false;
            //}
            //if (ageTo.Length > 0 && !PageUtil.IsInteger(ageTo))
            //{
            //    this.validationMessage.Text = "Age must be a number";
            //    this.validationMessage.Visible = true;
            //    return false;
            //}

            //this.validationMessage.Visible = false;
            if (IsQueryTypeHistology)
            {

            }
            else if (IsQueryTypeRefNum)
            {

            }

            return true;
        }

        #endregion

        protected void ProsSpecQueryTypeRBL_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (!IsQueryTypeHistology && !IsQueryTypeRefNum)
            {
                ProsSpecQueryHistologyDIV.Style.Add("display", "none");
                ProsSpecQueryRefNumDIV.Style.Add("display", "none");
            }
            else
            {
                ProsSpecQueryHistologyDIV.Style.Remove("display");
                ProsSpecQueryRefNumDIV.Style.Remove("display");
            }
        }
}
}
