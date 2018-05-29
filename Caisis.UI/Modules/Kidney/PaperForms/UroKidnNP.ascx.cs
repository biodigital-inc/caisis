namespace Caisis.UI.Modules.Kidney.PaperForms
{
	using System;
	using System.Data;
	using System.Drawing;
	using System.Web;
	using System.Web.UI.WebControls;
	using System.Web.UI.HtmlControls;
	using Caisis.DataAccess;

	using Caisis.UI.Core.Classes;

	/// <summary>
	///		Summary description for UroKidnNP.
	/// </summary>
	public partial class UroKidnNP : BasePaperFormControl
	{
		protected static int NumHpiRowsAllowed = 6;



		override protected void Page_Load(object sender, EventArgs e)
		{

			base.Page_Load(sender, e);

			BuildHPI();
			//this.BuildMedications(5,2);
			this.BuildAllergies(5,2);
			this.BuildComorbidities();
			this.BuildImages(6,1);
			this.BuildLabTestsDiagram();
			this.BuildFamilyHistory();
            this.BuildSocialHistory();
//            LoadHomeMedicationList();

//            LastStatus.Text = GetLastStatus();
		}

		override protected void SetFormInfo()  
		{
			this._formName = "UroKidnNP";
			this._formTitle = "Urology Kidney New Patient";
		}


		protected void BuildHPI()
		{
			if (patientID != 0)
			{
                try
                {
                    PatientDa pDa = new PatientDa();
                    DataSet hpiDs = pDa.GetPatientHPIKidney(this.patientID);
                    hpi.DataSource = hpiDs.Tables[0].DefaultView;
                    hpi.DataBind();
                }
                catch (Exception ex)
                {
                    hpi.Visible = false;
                    ExceptionHandler.Publish(ex);
                }
			}
		}



		protected void hpiItemDataBound(Object Sender, RepeaterItemEventArgs e) 
		{

			Literal StartNextHpiColumn;
			StartNextHpiColumn = (Literal) e.Item.FindControl("StartNextHpiColumn");

			if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem) 
			{
				int rowNumber = e.Item.ItemIndex + 1;
				if (System.Math.IEEERemainder(rowNumber, NumHpiRowsAllowed) == 0)
				{
					StartNextHpiColumn.Text = "</td><td width=\"*\" class=\"HPITextExtraColumns\" valign=\"top\">";
				}
				else
				{
					StartNextHpiColumn.Visible = false;
				}
			}
		}



		protected void appendToHpiItemDataBound(Object Sender, RepeaterItemEventArgs e) 
		{

			Literal StartNextHpiColumn;
			StartNextHpiColumn = (Literal) e.Item.FindControl("StartNextHpiColumn");

			int RowsAllowed = NumHpiRowsAllowed/2;

			if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem) 
			{
				int rowNumber = e.Item.ItemIndex + 1;
				if (System.Math.IEEERemainder(rowNumber, RowsAllowed) == 0)
				{
					StartNextHpiColumn.Text = "</td><td class=\"HPITextExtraColumns\" valign=\"top\">";
				}
				else
				{
					StartNextHpiColumn.Visible = false;
				}
			}
		}

		protected void HpiProstatectomiesItemDataBound(Object Sender, RepeaterItemEventArgs e) 
		{

			Literal StartNextHpiColumn;
			StartNextHpiColumn = (Literal) e.Item.FindControl("StartNextHpiColumn");


			Label CaseSurgeonLabel;
			CaseSurgeonLabel = (Label) e.Item.FindControl("CaseSurgeonLabel");

			int RowsAllowed = NumHpiRowsAllowed/2;

			if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem) 
			{
				int rowNumber = e.Item.ItemIndex + 1;
				if (System.Math.IEEERemainder(rowNumber, RowsAllowed) == 0)
				{
					StartNextHpiColumn.Text = "</td><td class=\"HPITextExtraColumns\" valign=\"top\">";
				}
				else
				{
					StartNextHpiColumn.Visible = false;
				}


				if (((DataRowView) e.Item.DataItem )["SurgCaseSurgeon"] == null || ((DataRowView) e.Item.DataItem )["SurgCaseSurgeon"].ToString() == "" )
				{
					CaseSurgeonLabel.Visible = false;
				}


			}
		}



		protected void FamilyHistoryItemCreated(Object Sender, RepeaterItemEventArgs e) 
		{

			Label  FamMemSide, FamMemDiagnosis;     
			FamMemDiagnosis = (Label) e.Item.FindControl("FamMemDiagnosis");
			FamMemSide = (Label) e.Item.FindControl("FamMemSide");


			if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem) 
			{

				if (((DataRowView) e.Item.DataItem )["FamMemDiagnosis"] == null || ((DataRowView) e.Item.DataItem )["FamMemDiagnosis"].ToString() == "" )
				{
					FamMemDiagnosis.Visible = false;
				}


				if (((DataRowView) e.Item.DataItem )["FamMemSide"] == null || ((DataRowView) e.Item.DataItem )["FamMemSide"].ToString() == "" )
				{
					FamMemSide.Visible = false;
				}

			}

		}


		override protected void BuildFamilyHistory()
		{
			if (patientID != 0)
			{

				//				BlankFamilyHistoryTable.Visible = false;

				FamilyMemberDa fDa = new FamilyMemberDa();
				DataSet familyHistoryDs = fDa.FormGetRecords(this.patientID, this._formName, "Dynamic");


				if (familyHistoryDs.Tables.Count > 0 && familyHistoryDs.Tables[0].Rows.Count > 0)
				{
					BlankFamilyHistoryTable.Visible = false;
					familyHistory.DataSource = familyHistoryDs.Tables[0].DefaultView;
					familyHistory.DataBind();
				}
				else
				{
					/*					DataRow blankFamHistoryRow;
										blankFamHistoryRow = familyHistoryDs.Tables[0].NewRow();
										blankFamHistoryRow["FamMemRelation"] = "<br><br><img src=\"../images/shim.gif\" border=\"0\" width=\"12\" height=\"1\">- Cancer:<br><br><br><br><br><img src=\"../images/shim.gif\" border=\"0\" width=\"12\" height=\"1\">- Other:";
										familyHistoryDs.Tables[0].Rows.Add(blankFamHistoryRow);
					*/

					familyHistory.Visible = false;
				}




				/*
								if (familyHistoryDs.Tables[0].Rows.Count != 0)
								{
									famHxProstateCancerYes.Checked = true;

								}
								else
								{
									famHxProstateCancerNo.Checked = true;
								}

				*/
			}
			else
			{
				familyHistory.Visible = false;
			}
		}


        override protected string GetLastStatus()
        {
            string returnString = "Date:";

            if (patientID != 0)
            {
                StatusDa sDa = new StatusDa();
                string StatusCheck = sDa.FormGetLastStatus(this.patientID, this._formName, "Dynamic");
                if (StatusCheck != null && StatusCheck.Length > 0)
                {
                    returnString = StatusCheck;
                    LastStatus.CssClass = "blackBoldText";
                }
            }
            return returnString;
        }

	}
}
