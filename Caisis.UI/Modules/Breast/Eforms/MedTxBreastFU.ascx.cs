namespace Caisis.UI.Modules.Breast.Eforms
{
    using System;
    using System.Data;
    using System.Drawing;
    using System.Web;
    using System.Web.UI;
    using System.Web.UI.WebControls;
    using System.Web.UI.HtmlControls;

    using Caisis.BOL;
    using Caisis.UI.Core.Classes;
    using Caisis.UI.Core.Classes.CustomControls;
    using Caisis.DataAccess;


    /// <summary>
    ///		Summary description for New Treatments for Breast eform.
    /// </summary>
    public partial class MedTxBreastFU : BaseEFormControl
    {
        override protected void Page_Load(object sender, System.EventArgs e)
        {
            base.Page_Load(sender, e);

            //populates MedType depending upon MedAgent
            BuildDependentValues();  

            //populates existing medical therapies
            GetMedTherapies();

            //populates existing medical therapies
            GetRadTherapies();

            updateComplications(CellulitisYesNo, EncDateText, ToxDateText_1, ToxDate_1, ToxName_1, "Cellulitis", ToxQuality_1);
            updateComplications(LymphedemaYesNo, EncDateText, ToxDateText_2, ToxDate_2, ToxName_2, "Lymphedema", ToxQuality_2);
            updateComplications(WoundProblemYesNo, EncDateText, ToxDateText_3, ToxDate_3, ToxName_3, "Wound Problem", ToxQuality_3);
            
        }

        //this function is used to update complication values, only if 'Yes' is selected on check all selection, 
        //from previous user control - interval patient compliants
        protected void updateComplications(EformTextBox option_value, EformTextBox encDtTxt, EformTextBox toxDtTxt, EformTextBox toxDt, EformTextBox tox, string toxValue, EformTextBox toxQlty)
        {
            if (option_value.Value == "Yes")
            {
                toxDtTxt.Value = encDtTxt.Value;
                toxDt.Value = encDtTxt.Value;
                tox.Value = toxValue;
                toxQlty.Value = "STD";
            }
            else if (option_value.Value == "No" || !string.IsNullOrEmpty(option_value.Value.ToString()))
            {
                toxDtTxt.Value = "";
                toxDt.Value = "";
                tox.Value = "";
                toxQlty.Value = "";
            }
        }

        protected void GetMedTherapies()
        {
            DataView view = BusinessObject.GetByParentAsDataView<MedicalTherapy>(_patientId);
            if (view.Count >= 1)
            {
                BreastFUMedTxRpt.DataSource = view;
                BreastFUMedTxRpt.DataBind();
            }
        }

        protected void GetRadTherapies()
        {
            DataView view = BusinessObject.GetByParentAsDataView<RadiationTherapy>(_patientId);
            if (view.Count >= 1)
            {
                BreastFURadTxRpt.DataSource = view;
                BreastFURadTxRpt.DataBind();
            }
        }

        /// <summary>
        /// For each MedTxAgent row, add script to update MedTxType
        /// </summary>
        protected void BuildDependentValues()
        {
            DataTable dt = CacheManager.GetLookupCodeList("MedTxAgent");
            for (int i = 1; i <= 10; i++)
            {
                Control medTxAgent = this.FindControl("MedTxAgent_" + i) as Control;
                Control medTxType = this.FindControl("MedTxType_" + i) as Control;
                if (medTxAgent != null && medTxType != null)
                {
                    PageUtil.RegisterDependentFieldScript(Page, medTxAgent, medTxType, dt, LookupCode.LkpCode, LookupCode.LkpDescription, "AgentToType");
                }
            }
        }
    }
}