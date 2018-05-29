namespace Caisis.UI.Modules.All.Eforms
{
	using System;
	using System.Data;
	using System.Drawing;
	using System.Web;
	using System.Web.UI.WebControls;
	using System.Web.UI.HtmlControls;

	using Caisis.BOL;
	using Caisis.UI.Core.Classes;
	//2.0 using Caisis.UI.Modules.Prostate.PaperForms;
	using Caisis.DataAccess;
	using Caisis.UI.Core.Classes.CustomControls;

	/// <summary>
    ///		Summary description for ChemoAndImmunoTherapy.
	/// </summary>
    public partial class ChemoAndImmunoTherapy : BaseEFormControl
	{

		override protected void Page_Load(object sender, System.EventArgs e)
		{
			base.Page_Load(sender, e);
			this.BuildMedTx(this._patientId, this._eformName, "Dynamic", "");
            base.SetTitle(ComponentTitle);

        }


        override protected void BuildMedTx(int PatientID, string FormName, string FormType, string MedTxType)
        {

            MedicalTherapyDa Da = new MedicalTherapyDa();
            DataSet Ds = new DataSet();

            if (MedTxType.Length > 0)
            {
                Ds = Da.FormGetRecords(PatientID, FormName, FormType, MedTxType);
            }
            else
            {
                Ds = Da.FormGetRecords(PatientID, FormName, FormType);
            }



            if (Ds.Tables.Count > 0 && Ds.Tables[0].Rows.Count > 0)
            {
                DataView Dv = new DataView(Ds.Tables[0]);
                Dv.RowFilter = (BOL.MedicalTherapy.MedTxType + " IN ('CHEMO', 'IMMUNO')");
                if (Dv.Count > 0)
                {
                    MedicalTherapies.DataSource = Dv;
                    MedicalTherapies.DataBind();
                }
            }
        }


	}
}
