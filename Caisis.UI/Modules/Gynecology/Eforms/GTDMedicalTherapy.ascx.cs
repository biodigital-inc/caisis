namespace Caisis.UI.Modules.Gynecology.Eforms
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
    ///		Summary description for GTDMedicalTherapy.
	/// </summary>
    public partial class GTDMedicalTherapy : BaseEFormControl
	{

        protected bool PriorHormoneTxExist = false;

		override protected void Page_Load(object sender, System.EventArgs e)
		{
			base.Page_Load(sender, e);
            //BuildMedTx(this._patientId, this._eformName, "Dynamic", "");
            BuildHormoneMedTx(this._patientId, this._eformName, "Dynamic");
            base.SetTitle(ComponentTitle);
		}




        protected void BuildHormoneMedTx(int PatientID, string FormName, string FormType)
        {

            MedicalTherapyDa Da = new MedicalTherapyDa();
            DataSet Ds = new DataSet();
 
            Ds = Da.FormGetRecords(PatientID, FormName, FormType);

            DataView Dv = Ds.Tables[0].DefaultView;
            Dv.RowFilter = Caisis.BOL.MedicalTherapy.MedTxType + " IN ('HORM', 'Horm', 'horm', 'HORMONE', 'Hormone', 'hormone')";


            if (Dv.Count > 0)
            {
                MedicalTherapies.DataSource = Dv;
                MedicalTherapies.DataBind();
                PriorHormoneTxExist = true;
            }
        }


	}
}
