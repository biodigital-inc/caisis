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
    ///		Summary description for MedicationsClinical.
    /// </summary>
    public partial class ThyroidMedicalTx : BaseEFormControl
    {

        protected override void Page_Load(object sender, System.EventArgs e)
        {
            base.Page_Load(sender, e);
            base.BuildMedTx(this._patientId, "", "Dynamic", "");

            updateMedDetails();
        }       

        protected void updateMedDetails()
        {
            setMedTxDetails(MedTxAgent_1, MedTxType_1, MedTxDisease_1, MedTxQuality_1);
            setMedTxDetails(MedTxAgent_2, MedTxType_2, MedTxDisease_2, MedTxQuality_2);
            setMedTxDetails(MedTxAgent_3, MedTxType_3, MedTxDisease_3, MedTxQuality_3);
            setMedTxDetails(MedTxAgent_4, MedTxType_4, MedTxDisease_4, MedTxQuality_4);
            setMedTxDetails(MedTxAgent_5, MedTxType_5, MedTxDisease_5, MedTxQuality_5);
        }

        protected void setMedTxDetails(EformComboBox agentCombo, EformTextBox typeTxtBx, EformTextBox medDiseaseTxt, EformTextBox medQltyTxt)
        {
            agentCombo.Attributes.Add("onblur", "updateMedTxDetails('" + typeTxtBx.ClientID + "','" + medDiseaseTxt.ClientID + "','" + medQltyTxt.ClientID + "');");
        }

    }
}
