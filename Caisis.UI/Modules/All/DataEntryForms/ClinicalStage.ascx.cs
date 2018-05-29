using System;
using System.Data;
using System.Configuration;
using System.Collections.Generic;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

using Caisis.UI.Core;
using Caisis.UI.Core.Classes;
using Caisis.UI.Core.Classes.CustomControls;

namespace Caisis.UI.Modules.All.DataEntryForms
{
    public partial class ClinicalStage : BasePatientDataControl
    {
        #region - Event Handlers (For Binding Repeaters and Handling Cascading Events)

        /// <summary>
        /// Binds repeater to DataSource in matching CaisisSelect
        /// </summary>
        /// <param name="clinRep"></param>
        /// <param name="clinSel"></param>
        protected void BindRepeater(Repeater clinRep, CaisisSelect clinSel, HtmlAnchor showLink)
        {
            clinRep.DataSource = clinSel.DataSource;
            clinRep.DataBind();
            // If select contains Values, populate Repeater with data
            if (clinSel.Items.Count > 0)
            {
                if (Page.IsPostBack && clinSel.Enabled)
                {
                    showLink.Attributes.Clear();
                    showLink.Attributes.Add("onclick", "showClinStage('" + clinSel.Field + "Div')");
                }
                else
                {
                    showLink.Attributes.Clear();
                    //showLink.Attributes.Add("onclick", "alert('There are no values for " + clinSel.ID + "');");
                }
            }
            else
            {
                showLink.Attributes.Clear();
                showLink.Attributes.Add("onclick", "alert('There are no values for " + clinSel.ID + "');");
            }
        }
        /// <summary>
        /// Adds javascript functionality to set dropdown list values based on definitions
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void BindLinksToStageInfo(object sender, RepeaterItemEventArgs e)
        {
            Repeater rep = (Repeater)sender;
            HtmlAnchor link = (HtmlAnchor)e.Item.FindControl(rep.ID.Replace("Rptr", "Link"));
            CaisisSelect cs = (CaisisSelect)PageUtil.RecursiveFindControl(rep.NamingContainer, rep.ID.Replace("Rptr", ""));
            string valToSet = DataBinder.Eval(e.Item.DataItem, "LkpCode").ToString();
            link.Attributes.Add("onclick", "selectStageValue('" + cs.ClientID + "','" + valToSet + "');closeClinStage();");
        }

        protected void FilterByDisease(object sender, EventArgs e)
        {
            string[] stages = new string[] { "T", "N", "M", "S" };
            CaisisSelect cs = (CaisisSelect)sender;
            string disease = cs.RefList["ClinStageDisease"].ToString();
            if (!string.IsNullOrEmpty(disease))
            {
                disease = disease.Replace(" ", "");
                foreach (ListItem item in cs.Items)
                {
                    string yearText = string.Join(null, System.Text.RegularExpressions.Regex.Split(item.Text, "[^\\d]"));

                    int parsedNum;
                    string year = "";
                    if (!string.IsNullOrEmpty(yearText) && int.TryParse(yearText, out parsedNum))
                    {
                        year = yearText;
                    }
                    else
                    {
                        year = item.Text;
                    }

                    if (!string.IsNullOrEmpty(year))
                    {
                        bool enable = false;
                        foreach (string stage in stages)
                        {
                            string lkpCode = "StageClin_" + disease + "_" + year + "_" + stage;
                            DataTable results = CacheManager.GetLookupCodeList(lkpCode);
                            if (results.Rows.Count > 0)
                            {
                                enable = true;
                                break;
                            }
                        }
                        item.Enabled = enable;
                    }
                }
            }
        }

        #endregion

        protected override void Render(HtmlTextWriter writer)
        {
            BindRepeater(this.ClinStageTRptr, this.ClinStageT, this.ClinStageTShowLink);
            BindRepeater(this.ClinStageNRptr, this.ClinStageN, this.ClinStageNShowLink);
            BindRepeater(this.ClinStageMRptr, this.ClinStageM, this.ClinStageMShowLink);
            BindRepeater(this.ClinStageSRptr, this.ClinStageS, this.ClinStageSShowLink);

            // Determine if the selected diseases which need to show Staging Group
            List<string> diseaseGroupRestrictions = new List<string>(StagingGroupRestrictions.Value.Split(",".ToCharArray(), StringSplitOptions.RemoveEmptyEntries));
            if (diseaseGroupRestrictions.Contains(ClinStageDisease.Value))
            {
                ClinStageGroup.Visible = true;
            }
            else
            {
                ClinStageGroup.Visible = false;
            }
            base.Render(writer);
        }
    }
}