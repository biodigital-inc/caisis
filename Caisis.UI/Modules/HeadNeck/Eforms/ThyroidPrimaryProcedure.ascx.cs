namespace Caisis.UI.Modules.HeadNeck.Eforms
{
    using System;
    using System.Data;
    using System.Drawing;
    using System.Web;
    using System.Web.UI.WebControls;
    using System.Web.UI.HtmlControls;

    using Caisis.BOL;
    using Caisis.UI.Core.Classes;
    using Caisis.DataAccess;
    using Caisis.UI.Core.Classes.CustomControls;

    /// <summary>
    ///		Summary description for Primary Procedure
    /// </summary>
    public partial class ThyroidPrimaryProcedure : BaseEFormControl
    {
        protected override void OnInit(EventArgs e)
        {
            base.OnInit(e);
            if (Page.IsPostBack)
            {
                //appends "Level" before checkbox selected values
                AppendLevelText(Level_ProcSubsite_4, ProcSubsite_4);
                AppendLevelText(Level_ProcSubsite_5, ProcSubsite_5);
                AppendLevelText(Level_ProcSubsite_6, ProcSubsite_6);
                AppendLevelText(Level_ProcSubsite_7, ProcSubsite_7);
            }
            else
            {
                //hides Other value
                HideOtherValue(Level_ProcSubsite_4);
                HideOtherValue(Level_ProcSubsite_5);
                HideOtherValue(Level_ProcSubsite_6);
                HideOtherValue(Level_ProcSubsite_7);
            }
        }

        override protected void Page_Load(object sender, System.EventArgs e)
        {
            base.Page_Load(sender, e);

            //if (Session[SessionKey.CurrentClinicDate] != null)
            //{
            //    string s = Session[SessionKey.CurrentClinicDate].ToString();

            //    if ((!string.IsNullOrEmpty(s)) && string.IsNullOrEmpty(ProcDateText_1.Value))
            //    {
            //        ProcDateText_1.Value = s;
            //        ProcDate_1.Value = DateTime.Parse(s).ToShortDateString();
            //        OpDateText_1.Value = s;
            //        OpDate_1.Value = DateTime.Parse(s).ToShortDateString();
            //        PathDateText.Value = s;
            //        PathDate.Value = DateTime.Parse(s).ToShortDateString();
            //    }
            //}

            //string Surgeon = "";
            //if (Session[SessionKey.CurrentListType] != null && Session[SessionKey.CurrentListType].ToString().ToUpper().Equals("CLINIC") && Session[SessionKey.CurrentListCrit].ToString().Length > 0)
            //{
            //    Surgeon = Session[SessionKey.CurrentListCrit].ToString();
            //}
            //if (Surgeon.Length > 0 && string.IsNullOrEmpty(ProcSurgeon_1.Value))
            //{
            //    if (Surgeon.IndexOf(",") > -1)
            //    {
            //        Surgeon = Surgeon.Remove(Surgeon.IndexOf(","));
            //    }
            //    ProcSurgeon_1.Value = Surgeon;
            //}

            SetValuesOnCheck();
            
            
            foreach (ListItem Centralli in CentralDissectDone.Items)
            {
                string Centralstr = "CentralRadioClick('" + Centralli.Value + "','" + CentralDissectDiv.ClientID + "','" + AbsentDateText_1.ClientID + "', '" + System.DateTime.Now.ToShortDateString() + "','" + AbsentDate_1.ClientID + "', '" + System.DateTime.Now.ToString() + "','" + TableName_1.ClientID + "', 'Procedures','" + FieldName_1.ClientID + "', 'ProcName','" + FieldValue_1.ClientID + "', 'Central Neck Dissection','" + AbsentReason_1.ClientID + "', 'Not Performed','" + AbsentQuality_1.ClientID + "', 'STD');";

                Centralli.Attributes.Add("onclick", Centralstr);

                if (Centralli.Selected)
                {
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "CentraljScript", Centralstr, true);
                }
            }

            foreach (ListItem Lateralli in LateralDissectDone.Items)
            {
                string Lateralstr = "LateralRadioClick('" + Lateralli.Value + "','" + LateralDissectDiv.ClientID + "','" + AbsentDateText_2.ClientID + "', '" + System.DateTime.Now.ToShortDateString() + "','" + AbsentDate_2.ClientID + "', '" + System.DateTime.Now.ToString() + "','" + TableName_2.ClientID + "', 'Procedures','" + FieldName_2.ClientID + "', 'ProcName','" + FieldValue_2.ClientID + "', 'Lateral Neck Dissection','" + AbsentReason_2.ClientID + "', 'Not Performed','" + AbsentQuality_2.ClientID + "', 'STD');";

                Lateralli.Attributes.Add("onclick", Lateralstr);

                if (Lateralli.Selected)
                {
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "LateraljScript", Lateralstr, true);
                }
            }

            ChklistSelects(Level_ProcSubsite_4);
            ChklistSelects(Level_ProcSubsite_5);
           
            foreach (ListItem Randomli in RandomSamplingDone.Items)
            {
                string Randomstr = "RandomRadioClick('" + Randomli.Value + "','" + RandomSamplingDiv.ClientID + "','" + AbsentDateText_3.ClientID + "', '" + System.DateTime.Now.ToShortDateString() + "','" + AbsentDate_3.ClientID + "', '" + System.DateTime.Now.ToString() + "','" + TableName_3.ClientID + "', 'Procedures','" + FieldName_3.ClientID + "', 'ProcName','" + FieldValue_3.ClientID + "', 'Random Lymph Node Sampling','" + AbsentReason_3.ClientID + "', 'Not Performed','" + AbsentQuality_3.ClientID + "', 'STD');";

                Randomli.Attributes.Add("onclick", Randomstr);

                if (Randomli.Selected)
                {
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "RandomjScript", Randomstr, true);
                }
            }

            ChklistSelects(Level_ProcSubsite_6);
            ChklistSelects(Level_ProcSubsite_7);

            //appends "Level" before checkbox selected values
            AppendLevelText(Level_ProcSubsite_4, ProcSubsite_4);
            AppendLevelText(Level_ProcSubsite_5, ProcSubsite_5);
            AppendLevelText(Level_ProcSubsite_6, ProcSubsite_6);
            AppendLevelText(Level_ProcSubsite_7, ProcSubsite_7);
        }

        protected void SetValuesOnCheck()
        {
            GetValuesOnCheck(ProcFindExtension_1, ProcFindStatus_1, ProcFindSide_1);
            GetValuesOnCheck(ProcFindExtension_2, ProcFindStatus_2, ProcFindSide_2);
            GetValuesOnCheck(ProcFindExtension_3, ProcFindStatus_3, ProcFindSide_3);
            GetValuesOnCheck(ProcFindExtension_4, ProcFindStatus_4, ProcFindSide_4);
            GetValuesOnCheck(ProcFindExtension_5, ProcFindStatus_5, ProcFindSide_5);
            GetValuesOnCheck(ProcFindExtension_6, ProcFindStatus_6, ProcFindSide_6);
            GetValuesOnCheck(ProcFindExtension_7, ProcFindStatus_7, ProcFindSide_7);
            GetValuesOnCheck(ProcFindExtension_8, ProcFindStatus_8, ProcFindSide_8);
            GetValuesOnCheck(ProcFindExtension_9, ProcFindStatus_9, ProcFindSide_9);
        }
        protected void GetValuesOnCheck(EformCheckBox ExtCheck, EformCheckBox grossCheck, EformTextBox prfindSide)
        {
            ExtCheck.Attributes.Add("onclick", "updateValuesOnCheck(this, '" + grossCheck.ClientID + "','" + prfindSide.ClientID + "');");
            grossCheck.Attributes.Add("onclick", "updateValuesOnCheck('" + ExtCheck.ClientID + "', this, '" + prfindSide.ClientID + "');");
        }

        protected void ChklistSelects(EformExtendedCheckBoxList ProcSubSiteLevel)
        {
            if (!Page.IsPostBack && !string.IsNullOrEmpty(ProcSubSiteLevel.Value))
            {
                string value = ProcSubSiteLevel.Value.Replace("Level ", "");
                string[] values = value.Split(",".ToCharArray(), StringSplitOptions.RemoveEmptyEntries);
                foreach (ListItem item in ProcSubSiteLevel.Items)
                {
                    for (int i = 0; i < values.Length; i++)
                    {
                        if (!string.IsNullOrEmpty(item.Value))
                        {
                            if (values[i] == item.Value)
                            {
                                item.Selected = true;
                                break;
                            }
                            else
                            {
                                item.Selected = false;
                            }
                        }
                    }
                }
            }
        }

        protected void HideOtherValue(EformExtendedCheckBoxList SubSiteLevel)
        {
            foreach (ListItem item in SubSiteLevel.Items)
            {
                if (item.Value == "")
                {
                    item.Attributes.CssStyle.Add("display", "none");
                    item.Enabled = false;
                }
            }
        }

        protected void AppendLevelText(EformExtendedCheckBoxList ProcSubSiteLevel, EformTextBox ProcSubSite)
        {
            if (!string.IsNullOrEmpty(ProcSubSiteLevel.Value) )
            {
                ProcSubSite.Value = "Level " + ProcSubSiteLevel.Value;
            }
        }
    }
}