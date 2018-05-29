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
	///		Summary description for ProstateHPI.
	/// </summary>
	public partial class DiseaseState_GU : BaseEFormControl
	{




		override protected void Page_Load(object sender, System.EventArgs e)
		{
			base.Page_Load(sender, e);
			BuildDiseaseState();



//			SetClinicDateOnStatusClick();
		}



		protected void BuildDiseaseState()
		{
			BuildStatusRow("Localized", Localized_DateLabel, Localized_StatusDateText, Localized_StatusRow, CurrentStatus_Localized);
			BuildStatusRow("Rising PSA Non-Castrate", RisingPSANonCastrate_DateLabel, RisingPSANonCastrate_StatusDateText, RisingPSANonCastrate_StatusRow, CurrentStatus_RisingPSANonCastrate);
			BuildStatusRow("Clinical Mets Non-Castrate", ClinMetsNonCastrate_DateLabel, ClinMetsNonCastrate_StatusDateText, ClinMetsNonCastrate_StatusRow, CurrentStatus_ClinMetsNonCastrate);
			BuildStatusRow("Rising PSA Castrate", RisingPSACastrate_DateLabel, RisingPSACastrate_StatusDateText, RisingPSACastrate_StatusRow, CurrentStatus_RisingPSACastrate);
			BuildStatusRow("Clinical Mets Castrate", ClinMetsCastrate_DateLabel, ClinMetsCastrate_StatusDateText, ClinMetsCastrate_StatusRow, CurrentStatus_ClinMetsCastrate);

		}


		protected void BuildStatusRow(string Status, Label StatusDateLabel, EformTextBox StatusDateText, HtmlTableRow StatusRow, EformCheckBox CurrentStatusCheckBox)
		{
			StatusDa sDa = new StatusDa();
			DataSet sDs = sDa.FormGetLastStatusByStatus(this._patientId, this._eformName, "Dynamic", Status);


			if (sDs.Tables.Count > 0 && sDs.Tables[0].Rows.Count > 0)
			{
				if (sDs.Tables[0].Rows[0]["StatusDateText"].ToString().Length > 0)
				{
					StatusDateLabel.Text = sDs.Tables[0].Rows[0]["StatusDateText"].ToString();
					StatusDateText.Visible = false;
					CurrentStatusCheckBox.Visible = false;
					ActivatePopulatedStatusRow(StatusRow, sDs.Tables[0].Rows[0]["StatusId"].ToString());
				}
				else if (sDs.Tables[0].Rows[0]["StatusDate"].ToString().Length > 0)
				{
					StatusDateLabel.Text = sDs.Tables[0].Rows[0]["StatusDate"].ToString();
					StatusDateText.Visible = false;
					CurrentStatusCheckBox.Visible = false;
					ActivatePopulatedStatusRow(StatusRow, sDs.Tables[0].Rows[0]["StatusId"].ToString());
				}
				else
				{
                    CurrentStatusCheckBox.Attributes.Add("onclick", "SetDiseaseStateDate(this, '" + StatusDateText.ClientID + "', '" + System.DateTime.Now.ToShortDateString() + "');");
					StatusDateLabel.Visible = false;   // prob not necessary -jf
				}
			}
			else
			{
                CurrentStatusCheckBox.Attributes.Add("onclick", "SetDiseaseStateDate(this, '" + StatusDateText.ClientID + "', '" + System.DateTime.Now.ToShortDateString() + "');");
				StatusDateLabel.Visible = false;   // prob not necessary -jf
			}


		}


		protected void ActivatePopulatedStatusRow(HtmlTableRow StatusRow, string StatusId)
		{
			StatusRow.Attributes.Add("class", "ClinicalEformPopulatedRow");
			StatusRow.Attributes.Add("onMouseOver", "this.className='ClinicalEformHighlightedRow';");
			StatusRow.Attributes.Add("onMouseOut", "this.className='ClinicalEformPopulatedRow';");
			StatusRow.Attributes.Add("onclick", "LoadDataEntryForm('Status', " + StatusId + ", 'StatusDateText,StatusDate,Status', 'DiseaseState_GU');");
		}





	}
}
