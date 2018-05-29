namespace Caisis.UI.Modules.Neuro.Eforms
{
    using System;
    using System.Data;
    using System.Data.SqlClient;
    using System.Drawing;
    using System.Web;
    using System.Web.UI.WebControls;
    using System.Web.UI.HtmlControls;

    using Caisis.BOL;
    using Caisis.UI.Core.Classes;
    using Caisis.UI.Core.Classes.CustomControls;
    using Caisis.DataAccess;

    /// <summary>
    ///		Summary description for previuos Spine med therapies
    /// </summary>
    public partial class SpinePriorMedTx : BaseEFormControl
    {
        protected override void Page_Load(object sender, EventArgs e)
        {
            base.Page_Load(sender, e);
            GetMedTx();
            ShowTypeByAgent();
        }

        protected void GetMedTx()
        {
            DataView view = BusinessObject.GetByParentAsDataView<MedicalTherapy>(_patientId);
            if (view.Count >= 1)
            {
                PDFormDiv.Style.Add("display", "block");

                SpineMedTxRpt.DataSource = view;
                SpineMedTxRpt.DataBind();
            }
            else
            {
                NoSpineMedTxMsgTr.Style.Add("display", "block");
            }
        }

        protected void ShowTypeByAgent()
        {
            for (int i = 1; i <= 10; i++)
            {
                EformComboBox medTxAgent = this.FindControl("MedTxAgent_" + i) as EformComboBox;
                EformSelect medTxType = this.FindControl("MedTxType_" + i) as EformSelect;
                AutoPopulateTypeByAgent(medTxAgent, medTxType);
            }
        }

        /// <summary>
        /// Add script to update MedTxType
        /// </summary>
        protected void AutoPopulateTypeByAgent(EformComboBox medTxAgent, EformSelect medTxType)
        {
            if (medTxAgent != null && medTxType != null)
            {
                string strJS = "cascadeParentByChildCode(" + medTxAgent.ClientID + "," + medTxType.ClientID + ",'MedTxAgent', 'MedTxType');";

                medTxAgent.Attributes.Add("onblur", strJS);
            }
        }
    }
}