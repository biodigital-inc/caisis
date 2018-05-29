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
    ///		Summary description for OutcomesStatus_Restaging.
	/// </summary>
    public partial class OutcomesStatus_Restaging : BaseEFormControl
	{



		override protected void Page_Load(object sender, System.EventArgs e)
		{
			base.Page_Load(sender, e);
			BuildDiseaseState();
            base.SetTitle(ComponentTitle);
		}



		protected void BuildDiseaseState()
		{
            BuildStatusRow("Restaging - Complete response", Completeresponse_DateLabel, Completeresponse_StatusDate, Completeresponse_StatusDateText, Completeresponse_StatusRow, CurrentStatus_Completeresponse);
            BuildStatusRow("Restaging - Regression", Regression_DateLabel, Regression_StatusDate, Regression_StatusDateText, Regression_StatusRow, CurrentStatus_Regression);
            BuildStatusRow("Restaging - No changes", Restaging_No_Changes_DateLabel, Restaging_No_Changes_StatusDate, Restaging_No_Changes_StatusDateText, Restaging_No_Changes_StatusRow, CurrentStatus_Restaging_No_Changes);
            BuildStatusRow("Restaging - Local Progression", Restaging_Local_Progression_DateLabel, Restaging_Local_Progression_StatusDate, Restaging_Local_Progression_StatusDateText, Restaging_Local_Progression_StatusRow, CurrentStatus_Restaging_Local_Progression);
            BuildStatusRow("Restaging - Distant Progression", Restaging_Distant_Progression_DateLabel, Restaging_Distant_Progression_StatusDate, Restaging_Distant_Progression_StatusDateText, Restaging_Distant_Progression_StatusRow, CurrentStatus_Restaging_Distant_Progression);
            BuildStatusRow("Restaging - Local and Distant Progression", Restaging_Local_and_Distant_Progression_DateLabel, Restaging_Local_and_Distant_Progression_StatusDate, Restaging_Local_and_Distant_Progression_StatusDateText, Restaging_Local_and_Distant_Progression_StatusRow, CurrentStatus_Restaging_Local_and_Distant_Progression);
            BuildOtherStatusRow(Other1_Status.Value, Other1_DateLabel, Other1_StatusDate, Other1_StatusDateText, Other1_StatusRow, CurrentStatus_Other1, Other1_Status);
            BuildOtherStatusRow(Other2_Status.Value, Other2_DateLabel, Other2_StatusDate, Other2_StatusDateText, Other2_StatusRow, CurrentStatus_Other2, Other2_Status);
            BuildOtherStatusRow(Other3_Status.Value, Other3_DateLabel, Other3_StatusDate, Other3_StatusDateText, Other3_StatusRow, CurrentStatus_Other3, Other3_Status);

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
            StatusRow.Attributes.Add("onclick", "LoadDataEntryForm('Status', " + StatusId + ", 'StatusDateText,StatusDate,Status,StatusDisease', 'StatusDiseaseState');");
		}





	}
}
