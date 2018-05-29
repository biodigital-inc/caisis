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
    ///		Summary description for OralCavityChemoTx.
    /// </summary>
    public partial class OralCavityChemoTx : BaseEFormControl
    {

        protected override void Page_Load(object sender, System.EventArgs e)
        {
            base.Page_Load(sender, e);
            BuildChemoTx(this._patientId, "", "Dynamic");
            base.SetTitle(ComponentTitle);

            //LookupCodeDa lpcDa = new LookupCodeDa();
            //DataTable lpcDt = lpcDa.GetLookupCodes("MedTxAgent");
            //DataTable lpcDt2 = lpcDa.GetLookupCodes("MedTxType");

            //SetNewAgentLookupCode(MedTxAgent_6, lpcDt,MedTxType_6,lpcDt2);
            //SetNewAgentLookupCode(MedTxAgent_7, lpcDt, MedTxType_7, lpcDt2);
            //SetNewAgentLookupCode(MedTxAgent_8, lpcDt, MedTxType_8, lpcDt2);
            //SetNewAgentLookupCode(MedTxAgent_9, lpcDt, MedTxType_9, lpcDt2);
            //SetNewAgentLookupCode(MedTxAgent_10, lpcDt, MedTxType_10, lpcDt2);
        }

        protected void BuildChemoTx(int PatientID, string FormName, string FormType)
        {

            MedicalTherapyDa Da = new MedicalTherapyDa();
            DataSet Ds = new DataSet();
            Ds = Da.FormGetRecords(PatientID, FormName, FormType);
            DataView dv = new DataView(Ds.Tables[0]);

            dv.RowFilter = MedicalTherapy.MedTxType + " LIKE '%CHEMO%' ";

            if (dv.Count > 0 )
            {
                MedicalTherapies.DataSource = dv;
                MedicalTherapies.DataBind();
            }
        }

        //protected void SetNewAgentLookupCode(EformComboBox agent, DataTable lookupcodeDt, EformDropDownList type, DataTable lookupcodeDt2)
        //{           
        //    DataView dv = new DataView(lookupcodeDt);
        //    dv.AllowNew = true;
        //    DataRowView drv = dv.AddNew();
        //    drv[LookupCode.LkpDescription] = "";
        //    drv[LookupCode.LkpCode] = "";
        //    drv.EndEdit();
        //    dv.RowFilter = LookupCode.LkpDescription + " LIKE '%CHEMO%' OR " + LookupCode.LkpDescription + " = '' ";
        //    dv.Sort = LookupCode.LkpCode + " ASC ";
            
        //    agent.DataSource = dv;
        //    agent.DataTextField = LookupCode.LkpCode;
        //    agent.DataValueField = LookupCode.LkpCode;
        //    agent.DataBind();
     
        //    DataView dv2 = new DataView(lookupcodeDt2);
        //    dv2.AllowNew = true;
        //    DataRowView drv2 = dv2.AddNew();
        //    drv2[LookupCode.LkpDescription] = "";
        //    drv2[LookupCode.LkpCode] = "";
        //    drv2.EndEdit();
        //    dv2.RowFilter = LookupCode.LkpCode + " LIKE '%CHEMO%' OR " + LookupCode.LkpDescription + " = '' ";
        //    dv2.Sort = LookupCode.LkpCode + " ASC ";
            
        //    type.DataSource = dv2;
        //    type.DataTextField = LookupCode.LkpCode;
        //    type.DataValueField = LookupCode.LkpCode;
        //    type.DataBind();

        //}
    }
}
