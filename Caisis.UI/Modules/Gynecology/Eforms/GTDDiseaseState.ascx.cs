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
    //2.0 	using Caisis.UI.Modules.Prostate.PaperForms;
	using Caisis.DataAccess;
	using Caisis.UI.Core.Classes.CustomControls;


	/// <summary>
    ///		Summary description for GastricDiseaseState.
	/// </summary>
    public partial class GTDDiseaseState : BaseEFormControl
	{
        protected string PresetDiagnosisDateText;
        protected string PresetDiagnosisDate;

		override protected void Page_Load(object sender, System.EventArgs e)
		{
			base.Page_Load(sender, e);
			BuildDiseaseState();


		}



        protected void BuildDiseaseState()
        {
            BuildStatusRow(Diagnosis_StatusDateText, CurrentStatus_Diagnosis);
            BuildStatusRow(_2_StatusDateText, CurrentStatus_2);
            BuildStatusRow(_3_StatusDateText, CurrentStatus_3);
            BuildStatusRow(_4_StatusDateText, CurrentStatus_4);
            BuildStatusRow(_5_StatusDateText, CurrentStatus_5);


        //    BuildStatusRow("Diagnosis Date", Diagnosis_DateLabel, Diagnosis_StatusDateText, Diagnosis_StatusRow, CurrentStatus_Diagnosis);
        //    BuildStatusRow("Localized", Localized_DateLabel, Localized_StatusDateText, Localized_StatusRow, CurrentStatus_Localized);
        //    BuildStatusRow("Rising PSA Non-Castrate", RisingPSANonCastrate_DateLabel, RisingPSANonCastrate_StatusDateText, RisingPSANonCastrate_StatusRow, CurrentStatus_RisingPSANonCastrate);
        //    BuildStatusRow("Clinical Mets Non-Castrate", ClinMetsNonCastrate_DateLabel, ClinMetsNonCastrate_StatusDateText, ClinMetsNonCastrate_StatusRow, CurrentStatus_ClinMetsNonCastrate);
        //    BuildStatusRow("Rising PSA Castrate", RisingPSACastrate_DateLabel, RisingPSACastrate_StatusDateText, RisingPSACastrate_StatusRow, CurrentStatus_RisingPSACastrate);
        //    BuildStatusRow("Clinical Mets Castrate", ClinMetsCastrate_DateLabel, ClinMetsCastrate_StatusDateText, ClinMetsCastrate_StatusRow, CurrentStatus_ClinMetsCastrate);

        //    PreSetDiagnosisDate("Diagnosis Date");
        }


        protected void BuildStatusRow(EformTextBox StatusDateText, EformCheckBox CurrentStatusCheckBox)
        {

            CurrentStatusCheckBox.Attributes.Add("onclick", "SetDiseaseStateDate(this, '" + StatusDateText.ClientID + "', '" + System.DateTime.Now.ToShortDateString() + "');");



        //    StatusDa sDa = new StatusDa();
        //    DataSet sDs = sDa.FormGetLastStatusByStatus(this._patientId, this._eformName, "Dynamic", Status);


        //    if (sDs.Tables.Count > 0 && sDs.Tables[0].Rows.Count > 0)
        //    {
        //        if (sDs.Tables[0].Rows[0]["StatusDateText"].ToString().Length > 0)
        //        {
        //            StatusDateLabel.Text = sDs.Tables[0].Rows[0]["StatusDateText"].ToString();
        //            StatusDateText.Visible = false;
        //            CurrentStatusCheckBox.Visible = false;
        //            ActivatePopulatedStatusRow(StatusRow, sDs.Tables[0].Rows[0]["StatusId"].ToString());
        //        }
        //        else if (sDs.Tables[0].Rows[0]["StatusDate"].ToString().Length > 0)
        //        {
        //            StatusDateLabel.Text = sDs.Tables[0].Rows[0]["StatusDate"].ToString();
        //            StatusDateText.Visible = false;
        //            CurrentStatusCheckBox.Visible = false;
        //            ActivatePopulatedStatusRow(StatusRow, sDs.Tables[0].Rows[0]["StatusId"].ToString());
        //        }
        //        else
        //        {
        //            CurrentStatusCheckBox.Attributes.Add("onclick", "SetDiseaseStateDate(this, '" + StatusDateText.ClientID + "', '" + System.DateTime.Now.ToShortDateString() + "');");
        //            StatusDateLabel.Visible = false;   // prob not necessary -jf
        //        }
        //    }
        //    else
        //    {
        //        CurrentStatusCheckBox.Attributes.Add("onclick", "SetDiseaseStateDate(this, '" + StatusDateText.ClientID + "', '" + System.DateTime.Now.ToShortDateString() + "');");
        //        StatusDateLabel.Visible = false;   // prob not necessary -jf
        //    }




        }


        //protected void ActivatePopulatedStatusRow(HtmlTableRow StatusRow, string StatusId)
        //{
        //    StatusRow.Attributes.Add("class", "ClinicalEformPopulatedRow");
        //    StatusRow.Attributes.Add("onMouseOver", "this.className='ClinicalEformHighlightedRow';");
        //    StatusRow.Attributes.Add("onMouseOut", "this.className='ClinicalEformPopulatedRow';");
        //    StatusRow.Attributes.Add("onclick", "LoadDataEntryForm('Status', " + StatusId + ", 'StatusDateText,StatusDate,Status', 'PCCTCDiseaseState');");
        //}


        //protected void PreSetDiagnosisDate(string Status)
        //{

        //    StatusDa sDa = new StatusDa();
        //    DataSet sDs = sDa.FormGetLastStatusByStatus(this._patientId, this._eformName, "Dynamic", Status);


        //    if (sDs.Tables.Count > 0 && sDs.Tables[0].Rows.Count > 0)
        //    {
        //        if (sDs.Tables[0].Rows[0]["StatusDateText"].ToString().Length > 0)
        //        {
        //            PresetDiagnosisDateText = sDs.Tables[0].Rows[0]["StatusDateText"].ToString();
        //        }
        //        if (sDs.Tables[0].Rows[0]["StatusDate"].ToString().Length > 0)
        //        {
        //            PresetDiagnosisDate = sDs.Tables[0].Rows[0]["StatusDate"].ToString();
        //        }
        //    }
        //    else
        //    {
        //        PresetDiagnosisDateText = Diagnosis_StatusDateText.Value;
        //        PresetDiagnosisDate = Diagnosis_StatusDate.Value;
        //    }
              
        //}


	}
}
