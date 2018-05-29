namespace Caisis.UI.Modules.Liver.Eforms
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
    ///		Summary description for LiverSurgeryStatusLastContact.
	/// </summary>
    public partial class LiverSurgeryStatusLastContact : BaseEFormControl
	{

		override protected void Page_Load(object sender, System.EventArgs e)
		{
			base.Page_Load(sender, e);
			BuildDiseaseState();
            base.SetTitle(ComponentTitle);
		}



		protected void BuildDiseaseState()
		{
            BuildStatusRow("No Evidence of Disease", NED_DateLabel, NED_StatusDate, NED_StatusDateText, NED_StatusRow, CurrentStatus_NED_11, StatusNotes_11);
            BuildStatusRow("AWD", AWD_DateLabel, AWD_StatusDate, AWD_StatusDateText, AWD_StatusRow, CurrentStatus_AWD_12, StatusNotes_12);
            BuildStatusRow("AWD - Local Recurrence", AWD_Local_Recurrence_DateLabel, AWD_Local_Recurrence_StatusDate, AWD_Local_Recurrence_StatusDateText, AWD_Local_Recurrence_StatusRow, CurrentStatus_AWD_Local_Recurrence_13, StatusNotes_13);
            BuildStatusRow("AWD - Distant Metastasis", AWD_Distant_Metastasis_DateLabel, AWD_Distant_Metastasis_StatusDate, AWD_Distant_Metastasis_StatusDateText, AWD_Distant_Metastasis_StatusRow, CurrentStatus_AWD_Distant_Metastasis_14,StatusNotes_14);
            BuildStatusRow("AWD - Local and Metastasis", AWD_Local_and_Metastasis_DateLabel, AWD_Local_and_Metastasis_StatusDate, AWD_Local_and_Metastasis_StatusDateText, AWD_Local_and_Metastasis_StatusRow, CurrentStatus_AWD_Local_and_Metastasis_15, StatusNotes_15);
            BuildStatusRow("Lost To Follow up", Lost_to_Follow_up_DateLabel, Lost_to_Follow_up_StatusDate, Lost_to_Follow_up_StatusDateText, Lost_to_Follow_up_StatusRow, CurrentStatus_Lost_to_Follow_up_16, StatusNotes_16);
            //BuildStatusRow("Dead of Disease", DeadofDisease_DateLabel, DeadofDisease_StatusDate, DeadofDisease_StatusDateText, DeadofDisease_StatusRow, CurrentStatus_DeadofDisease_17, StatusNotes_17);
            BuildOtherStatusRow(Other1_Status.Value, Other1_DateLabel, Other1_StatusDate, Other1_StatusDateText, Other1_StatusRow, CurrentStatus_Other1_18, Other1_Status, StatusNotes_18);
            BuildOtherStatusRow(Other2_Status.Value, Other2_DateLabel, Other2_StatusDate, Other2_StatusDateText, Other2_StatusRow, CurrentStatus_Other2_19, Other2_Status, StatusNotes_19);
            BuildOtherStatusRow(Other3_Status.Value, Other3_DateLabel, Other3_StatusDate, Other3_StatusDateText, Other3_StatusRow, CurrentStatus_Other3_20, Other3_Status, StatusNotes_20);

		}


        protected void BuildStatusRow(string Status, Label StatusDateLabel, EformHidden StatusDate, EformTextBox StatusDateText, HtmlTableRow StatusRow, EformCheckBox CurrentStatusCheckBox, EformTextBox StatusNotes)
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
                    StatusNotes.Visible = false;
					ActivatePopulatedStatusRow(StatusRow, sDs.Tables[0].Rows[0]["StatusId"].ToString());
				}
				else if (sDs.Tables[0].Rows[0]["StatusDate"].ToString().Length > 0)
				{
					StatusDateLabel.Text = sDs.Tables[0].Rows[0]["StatusDate"].ToString();
					StatusDateText.Visible = false;
					CurrentStatusCheckBox.Visible = false;
                    StatusNotes.Visible = false;
					ActivatePopulatedStatusRow(StatusRow, sDs.Tables[0].Rows[0]["StatusId"].ToString());
				}
				else
				{
                    CurrentStatusCheckBox.Attributes.Add("onclick", "SetDiseaseStateDate(this, '" + StatusDateText.ClientID + "', '" + System.DateTime.Now.ToShortDateString() + "', '" + StatusDate.ClientID + "', '" + StatusNotes.ClientID + "');");
                    StatusDateLabel.Visible = false;   // prob not necessary -jf
				}
			}
			else
			{
                CurrentStatusCheckBox.Attributes.Add("onclick", "SetDiseaseStateDate(this, '" + StatusDateText.ClientID + "', '" + System.DateTime.Now.ToShortDateString() + "', '" + StatusDate.ClientID + "', '" + StatusNotes.ClientID + "');");
                StatusDateLabel.Visible = false;   // prob not necessary -jf
			}


		}

        protected void BuildOtherStatusRow(string Status, Label StatusDateLabel, EformHidden StatusDate, EformTextBox StatusDateText, HtmlTableRow StatusRow, EformCheckBox CurrentStatusCheckBox, EformComboBox StatusValue, EformTextBox StatusNotes)
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
                    StatusNotes.Visible = false;
                    ActivatePopulatedStatusRow(StatusRow, sDs.Tables[0].Rows[0]["StatusId"].ToString());
                }
                else if (sDs.Tables[0].Rows[0]["StatusDate"].ToString().Length > 0)
                {
                    StatusDateLabel.Text = sDs.Tables[0].Rows[0]["StatusDate"].ToString();
                    StatusDateText.Visible = false;
                    CurrentStatusCheckBox.Visible = false;
                    StatusNotes.Visible = false;
                    ActivatePopulatedStatusRow(StatusRow, sDs.Tables[0].Rows[0]["StatusId"].ToString());
                }
                else
                {
                    CurrentStatusCheckBox.Attributes.Add("onclick", "SetDiseaseStateDate(this, '" + StatusDateText.ClientID + "', '" + System.DateTime.Now.ToShortDateString() + "', '" + StatusDate.ClientID + "', '" + StatusNotes.ClientID + "');");
                    StatusDateLabel.Visible = false;   // prob not necessary -jf
                    
                }
            }
            else
            {
                CurrentStatusCheckBox.Attributes.Add("onclick", "SetDiseaseStateDate(this, '" + StatusDateText.ClientID + "', '" + System.DateTime.Now.ToShortDateString() + "', '" + StatusDate.ClientID + "', '" + StatusNotes.ClientID + "');");
                StatusDateLabel.Visible = false;   // prob not necessary -jf
            }


        }


		protected void ActivatePopulatedStatusRow(HtmlTableRow StatusRow, string StatusId)
		{
			StatusRow.Attributes.Add("class", "ClinicalEformPopulatedRow");
			StatusRow.Attributes.Add("onMouseOver", "this.className='ClinicalEformHighlightedRow';");
			StatusRow.Attributes.Add("onMouseOut", "this.className='ClinicalEformPopulatedRow';");
            StatusRow.Attributes.Add("onclick", "LoadDataEntryForm('Status', " + StatusId + ", 'StatusDateText,StatusDate,Status,StatusDisease,StatusNotes', 'LastContact');");
		}





	}
}
