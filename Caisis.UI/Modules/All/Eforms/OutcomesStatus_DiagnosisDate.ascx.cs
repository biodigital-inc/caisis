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
	using Caisis.DataAccess;
	using Caisis.UI.Core.Classes.CustomControls;


	/// <summary>
    ///		Summary description for OutcomesStatus_DiagnosisDate.
	/// </summary>
    public partial class OutcomesStatus_DiagnosisDate : BaseEFormControl
	{



		override protected void Page_Load(object sender, System.EventArgs e)
		{
			base.Page_Load(sender, e);
			BuildDiseaseState();
            base.SetTitle(ComponentTitle);
		}



		protected void BuildDiseaseState()
		{
            BuildStatusRow("Diagnosis Date", Diagnosis_Date_DateLabel_21, Diagnosis_Date_StatusDate_21, Diagnosis_Date_StatusDateText_21, Diagnosis_Date_StatusRow_21, CurrentStatus_Diagnosis_Date_21);

        }


        protected void BuildStatusRow(string Status, Label StatusDateLabel, EformHidden StatusDate, EformTextBox StatusDateText, HtmlTableRow StatusRow, EformCheckBox CurrentStatusCheckBox)
        {
			StatusDa sDa = new StatusDa();
			DataSet sDs = sDa.FormGetLastStatusByStatus(this._patientId, this._eformName, "Dynamic", Status);

			// set the number of blank rows that are added to the medications section

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
                    CurrentStatusCheckBox.Attributes.Add("onclick", "SetDiseaseStateDate(this, '" + StatusDateText.ClientID + "', '" + System.DateTime.Now.ToShortDateString() + "', '" + StatusDate.ClientID + "');");
                    StatusDateLabel.Visible = false;   // prob not necessary -jf
				}
			}
			else
			{
                CurrentStatusCheckBox.Attributes.Add("onclick", "SetDiseaseStateDate(this, '" + StatusDateText.ClientID + "', '" + System.DateTime.Now.ToShortDateString() + "', '" + StatusDate.ClientID + "');");
                StatusDateLabel.Visible = false;   // prob not necessary -jf
			}


		}

        protected void BuildOtherStatusRow(string Status, Label StatusDateLabel, EformHidden StatusDate, EformTextBox StatusDateText, HtmlTableRow StatusRow, EformCheckBox CurrentStatusCheckBox, EformComboBox StatusValue)
        {
            StatusDa sDa = new StatusDa();
            DataSet sDs = sDa.FormGetLastStatusByStatus(this._patientId, this._eformName, "Dynamic", Status);

            // set the number of blank rows that are added to the medications section

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
                    CurrentStatusCheckBox.Attributes.Add("onclick", "SetDiseaseStateDate(this, '" + StatusDateText.ClientID + "', '" + System.DateTime.Now.ToShortDateString() + "', '" + StatusDate.ClientID + "');");
                    StatusDateLabel.Visible = false;   // prob not necessary -jf
                    
                }
            }
            else
            {
                CurrentStatusCheckBox.Attributes.Add("onclick", "SetDiseaseStateDate(this, '" + StatusDateText.ClientID + "', '" + System.DateTime.Now.ToShortDateString() + "', '" + StatusDate.ClientID + "');");
                StatusDateLabel.Visible = false;   // prob not necessary -jf
            }


        }


		protected void ActivatePopulatedStatusRow(HtmlTableRow StatusRow, string StatusId)
		{
			StatusRow.Attributes.Add("class", "ClinicalEformPopulatedRow");
			StatusRow.Attributes.Add("onMouseOver", "this.className='ClinicalEformHighlightedRow';");
			StatusRow.Attributes.Add("onMouseOut", "this.className='ClinicalEformPopulatedRow';");
            StatusRow.Attributes.Add("onclick", "LoadDataEntryForm('Status', " + StatusId + ", 'StatusDateText,StatusDate,Status,StatusDisease', 'Status');");
		}





	}
}
