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
    ///		Summary description for Thyroid Post Surgical Treatment
    /// </summary>
    public partial class ThyroidPostSurgicalTx : BaseEFormControl
    {
        override protected void Page_Load(object sender, System.EventArgs e)
        {
            base.Page_Load(sender, e);
            foreach (ListItem Salvageli in SalvageSurgeryDone.Items)
            {
                string SalvageStr = "SurgeryRadioClick('" + Salvageli.Value + "','" + ProcDiv.ClientID + "','" + AbsentDateText_5.ClientID + "', '" + System.DateTime.Now.ToShortDateString() + "','" + AbsentDate_5.ClientID + "', '" + System.DateTime.Now.ToString() + "','" + TableName_5.ClientID + "', 'Procedures','" + FieldName_5.ClientID + "', 'ProcName','" + FieldValue_5.ClientID + "', 'Salvage Surgery','" + AbsentReason_5.ClientID + "', 'Not Performed','" + AbsentQuality_5.ClientID + "', 'STD');";

                Salvageli.Attributes.Add("onclick", SalvageStr);
                if (Salvageli.Selected)
                {
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "SalvagejScript", SalvageStr, true);
                }
            }

            SetSalvageSurgeon();
        }

        protected void SetSalvageSurgeon()
        {
            GetSalvageSurgeon(ProcDateText_8, ProcSurgeon_8, ProcInstitution_8, ProcService_8, ProcSite_8, ProcIndication_8, ProcQuality_8);
            GetSalvageSurgeon(ProcDateText_9, ProcSurgeon_9, ProcInstitution_9, ProcService_9, ProcSite_9, ProcIndication_9, ProcQuality_9);
            GetSalvageSurgeon(ProcDateText_10, ProcSurgeon_10, ProcInstitution_10, ProcService_10, ProcSite_10, ProcIndication_10, ProcQuality_10);
            GetSalvageSurgeon(ProcDateText_11, ProcSurgeon_11, ProcInstitution_11, ProcService_11, ProcSite_11, ProcIndication_11, ProcQuality_11);
            GetSalvageSurgeon(ProcDateText_12, ProcSurgeon_12, ProcInstitution_12, ProcService_12, ProcSite_12, ProcIndication_12, ProcQuality_12);
        }

        protected void GetSalvageSurgeon(EformTextBox salDateTxt, EformTextBox salSurgeon, EformTextBox salInstitution, EformTextBox salService, EformTextBox salSite, EformTextBox salIndication, EformTextBox salQuality)
        {
            salDateTxt.Attributes.Add("onblur", "updateSurgeon('" + salSurgeon.ClientID + "','" + salInstitution.ClientID + "','" + salService.ClientID + "','" + salSite.ClientID + "','" + salIndication.ClientID + "','" + salQuality.ClientID + "')");
        }
    }
}
