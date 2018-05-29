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
    ///		Summary description for Radiation.
    /// </summary>
    public partial class ThyroidRadiationTx : BaseEFormControl
    {
        override protected void Page_Load(object sender, System.EventArgs e)
        {
            base.Page_Load(sender, e);
            base.BuildXRT(this._patientId, "", "Dynamic");

            SetRadtxQlty();
        }

        protected void SetRadtxQlty()
        {
            GetRadtxQlty(RadTxType_11, RadTxQuality_11);
            GetRadtxQlty(RadTxType_12, RadTxQuality_12);
            GetRadtxQlty(RadTxType_13, RadTxQuality_13);
            GetRadtxQlty(RadTxType_14, RadTxQuality_14);
            GetRadtxQlty(RadTxType_15, RadTxQuality_15);
        }

        protected void GetRadtxQlty(EformComboBox RadTypeCombo, EformTextBox RadQltyTxt)
        {
            RadTypeCombo.Attributes.Add("onblur", "updateRadTxQlty('" + RadQltyTxt.ClientID + "');");
        }
    }
}
