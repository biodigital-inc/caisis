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
    //2.0 	using Caisis.UI.Modules.Prostate.PaperForms;
	using Caisis.DataAccess;
	using Caisis.UI.Core.Classes.CustomControls;

	/// <summary>
	///		Summary description for MedicationsClinical.
	/// </summary>
	public partial class CurrentMedicalTherapy_GU : BaseEFormControl
	{



		override protected void Page_Load(object sender, System.EventArgs e)
		{
			base.Page_Load(sender, e);
//			BuildCurrentMedTx();
		
		}

		protected void BuildCurrentMedTx()
		{
			MedicalTherapyDa Da = new MedicalTherapyDa();
			DataSet Ds = new DataSet();

			Ds = Da.FormGetRecords(this._patientId, this._eformName, "Dynamic");

//            MedTxAdministrationDa Daa =  = new MedTxAdministrationDa();
//            DataSet Dsa = Daa.FormGetRecords(this._patientId, this._eformName, "Dynamic");

			if (Ds.Tables.Count > 0 && Ds.Tables[0].Rows.Count > 0)
			{
                if (Ds.Tables[0].Rows[(Ds.Tables[0].Rows.Count) - 1]["MedTxStopDateText"].ToString().Length < 1 )
                {
                    CurrentTXLabel.Text = Ds.Tables[0].Rows[(Ds.Tables[0].Rows.Count) - 1]["MedTxAgent"].ToString();
                    CurrentTXStartDateLabel.Text = Ds.Tables[0].Rows[(Ds.Tables[0].Rows.Count) - 1]["MedTxDateText"].ToString();
                    mostRecentTxRow.Attributes.Add("onclick", "LoadDataEntryForm('MedicalTherapy', " + Ds.Tables[0].Rows[(Ds.Tables[0].Rows.Count) - 1]["MedicalTherapyId"].ToString() + ", 'MedTxDateText,MedTxDate,MedTxStopDateText,MedStopTxDate,MedTxType,MedTxAgent,MedTxDose,MedTxUnits,MedTxInstitution,MedTxNotes', 'CurrentMedicalTherapy_GU');");
                    mostRecentTxRow.Visible = true;
//                    mostRecentTxRowHelpText.Visible = true;
//                    newTxLabel.Text = "New";
                }
			}
		}



	}
}
