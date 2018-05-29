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
    ///		Summary description for previuos Spine surgeries and kyphoplasty
    /// </summary>
    public partial class SpinePriorSurgeries : BaseEFormControl
    {
        protected override void Page_Load(object sender, EventArgs e)
        {
            base.Page_Load(sender, e);
            GetProcedures();
            ShowDescByCPT();
        }

        protected void GetProcedures()
        {
            DataView view = BusinessObject.GetByParentAsDataView<Procedure>(_patientId);
            if (view.Count >= 1)
            {
                PDFormDiv.Style.Add("display", "block");

                SpineProcRpt.DataSource = view;
                SpineProcRpt.DataBind();
            }
            else
            {
                NoSpineProcMsgTr.Style.Add("display", "block");
            }
        }

        protected void ShowDescByCPT()
        {
            for (int i = 1; i <= 5; i++)
            {
                EformComboBox procCPTCode = this.FindControl("ProcCPT_Code_" + i) as EformComboBox;
                EformSelect procCPTDesc = this.FindControl("ProcCPT_Description_" + i) as EformSelect;
                AutoPopulateDescByCPT(procCPTCode, procCPTDesc);
            }
        }

        /// <summary>
        /// Add script to update CPT Description
        /// </summary>
        protected void AutoPopulateDescByCPT(EformComboBox procCPTCode, EformSelect procCPTDesc)
        {
            if (procCPTCode != null && procCPTDesc != null)
            {
                string strJS = "cascadeParentByChildCode(" + procCPTCode.ClientID + "," + procCPTDesc.ClientID + ",'SpineProcCPTs', 'SpineProcCPTDesc');";

                procCPTCode.Attributes.Add("onblur", strJS);
            }
        }
    }
}