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
    ///		Summary description for Comorbidities
    /// </summary>
    public partial class ThyroidComorbidities : BaseEFormControl
    {
        override protected void Page_Load(object sender, System.EventArgs e)
        {
            base.Page_Load(sender, e);
            BuildComorbidities(this._patientId, this._eformName, "Dynamic");

            SetComorQuality();
            SetComorComboQuality();
        }

        protected void SetComorQuality()
        {
            GetComorQuality(Comorbidity_1, ComorbQuality_1);
            GetComorQuality(Comorbidity_2, ComorbQuality_2);
            GetComorQuality(Comorbidity_3, ComorbQuality_3);
            GetComorQuality(Comorbidity_4, ComorbQuality_4);
            GetComorQuality(Comorbidity_5, ComorbQuality_5);
            GetComorQuality(Comorbidity_6, ComorbQuality_6);
            GetComorQuality(Comorbidity_7, ComorbQuality_7);
            GetComorQuality(Comorbidity_8, ComorbQuality_8);
            GetComorQuality(Comorbidity_9, ComorbQuality_9);
            GetComorQuality(Comorbidity_10, ComorbQuality_10);            
        }

        protected void SetComorComboQuality()
        {
            GetComorComboQuality(Comorbidity_11, ComorbQuality_11);
            GetComorComboQuality(Comorbidity_12, ComorbQuality_12);
            GetComorComboQuality(Comorbidity_13, ComorbQuality_13);
            GetComorComboQuality(Comorbidity_14, ComorbQuality_14);
            GetComorComboQuality(Comorbidity_15, ComorbQuality_15);
        }

        protected void GetComorQuality(EformCheckBox ComorChk, EformTextBox ComorQltyTxt)
        {
            ComorChk.Attributes.Add("onclick", "updateComorQlty(this,'" + ComorQltyTxt.ClientID + "');");
        }

        protected void GetComorComboQuality(EformComboBox ComorCombo, EformTextBox ComorQltyTxt)
        {
            ComorCombo.Attributes.Add("onblur", "updateComorComboQlty('" + ComorQltyTxt.ClientID + "');");
        }
    }
}
