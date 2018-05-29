namespace Caisis.UI.Modules.Prostate.Eforms
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
    ///		Summary description for PCCTCMedicalTherapy.
	/// </summary>
    public partial class PCCTCMedicalTherapy : BaseEFormControl
	{

        protected bool PriorMedTxExist = false;

		override protected void Page_Load(object sender, System.EventArgs e)
		{
			base.Page_Load(sender, e);
			BuildMedTx(this._patientId, this._eformName, "Dynamic", "");
            base.SetTitle(ComponentTitle);
		}

        override protected void BuildMedTx(int PatientID, string FormName, string FormType, string MedTxType)
        {


            base.BuildMedTx(PatientID, FormName, FormType, MedTxType);

            if (MedicalTherapies.DataSource != null) PriorMedTxExist = true;


            /*
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
                MedicalTherapies.DataSource = Ds.Tables[0].DefaultView;
                MedicalTherapies.DataBind();
            }
            */
        }



	}
}
