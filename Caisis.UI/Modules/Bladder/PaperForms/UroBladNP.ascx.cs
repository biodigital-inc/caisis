namespace Caisis.UI.Modules.Bladder.PaperForms
{
	using System;
	using System.Data;
	using System.Drawing;
	using System.Web;
	using System.Security;

	using System.Web.UI.WebControls;
	using System.Web.UI.HtmlControls;
	using System.Collections;

	using System.Data.SqlClient;
	using System.Collections.Specialized;
	

	using Caisis.DataAccess;
	using Caisis.BOL;

	using Caisis.UI.Core.Classes;



	/// <summary>
	///		Summary description for BladderNP.
	/// </summary>
	public partial  class UroBladNP : BasePaperFormControl
	{

		protected static int NumHpiRowsAllowed = 16;
        private BasePaperFormControl SurveyFormControl = null;


		override protected void Page_Load(object sender, EventArgs e)
		{
			base.Page_Load(sender, e);
			BuildReferringMD();
			BuildHPI();
			BuildHpiProstatectomies();
			BuildHpiProtocols();
			BuildHpiBiopsies(hpiBiopsyId);
			BuildHPINerveStatus();
			BuildImages(6,1);
			BuildMedTx(2, 1, "Intravesical", IntravesicalTx);
			BuildMedTx(2, 1, "Systemic", SystemicTx);
			BuildComorbidities();
			//BuildMedications(10, 1);
			BuildAllergies(10, 1);
			BuildXRT(1, 1);
            BuildEndoscopies(6, 1);
			BuildShortSexualQOL();
			BuildShortUrinaryQOL();
			BuildFamilyHistory();
			BuildSocialHistory();
			BuildSurgicalHistory();
			BuildLabTestsTrendView(5, 1, 24, "CREAT,BUN,NA,CL,CO2,HCT,WBC,PSA", 6);
           // LoadSurveyForm();
 //           LoadHomeMedicationList();

        }




		override protected void BuildReferringMD()
		{
			if (patientID != 0)
			{

				PatientPhysicianDa rmdDa = new PatientPhysicianDa();
				DataSet rmdDs = rmdDa.FormGetReferringMDs(this.patientID, this._formName, "Dynamic");
				if (rmdDs.Tables[0].Rows.Count > 0)
				{
					ReferringMd1Name.Text = rmdDs.Tables[0].Rows[0]["PhFirstName"].ToString() + " " + rmdDs.Tables[0].Rows[0]["PhMiddleName"].ToString() + " " + rmdDs.Tables[0].Rows[0]["PhLastName"].ToString();
					ReferringMd1Phone.Text = rmdDs.Tables[0].Rows[0]["PhWorkPhone"].ToString();
					ReferringMd1Fax.Text = rmdDs.Tables[0].Rows[0]["PhFax"].ToString();
					ReferringMd1Specialty.Text = rmdDs.Tables[0].Rows[0]["PhSpecialty"].ToString();

					if (rmdDs.Tables[0].Rows.Count > 1)
					{
						ReferringMd2Name.Text = rmdDs.Tables[0].Rows[1]["PhFirstName"].ToString() + " " + rmdDs.Tables[0].Rows[1]["PhMiddleName"].ToString() + " " + rmdDs.Tables[0].Rows[1]["PhLastName"].ToString();
						ReferringMd2Phone.Text = rmdDs.Tables[0].Rows[1]["PhWorkPhone"].ToString();
						ReferringMd2Fax.Text = rmdDs.Tables[0].Rows[1]["PhFax"].ToString();
						ReferringMd2Specialty.Text = rmdDs.Tables[0].Rows[1]["PhSpecialty"].ToString();

					}
				}
			}
		}


		protected void BuildHPI()
		{
			if (patientID != 0)
			{
				try
				{
					PatientDa pDa = new PatientDa();
					DataSet hpiDs = pDa.GetPatientHPIBladder(this.patientID);
					int rowCount = hpiDs.Tables[0].Rows.Count;

					if (rowCount > 0)
					{
						hpi.DataSource = hpiDs.Tables[0].DefaultView;
						hpi.DataBind();

						if (rowCount > (NumHpiRowsAllowed/5))
						{
							BlankHPITable.Visible = false;
						}
					}
					else
					{
						PopulatedHPITable.Visible = false;
					}
				}
				catch (Exception ex)
				{
					BlankHPITable.Visible = true;
					PopulatedHPITable.Visible = false;
					//Caisis.UI.Other.EmailError.SendErrorEmail( "Clinic Form: " + this._formTitle, "error creating hpi output");
					ExceptionHandler.Publish(ex);
				}
			}
			else
			{
				PopulatedHPITable.Visible = false;
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
					StartNextHpiColumn.Text = "</td><td width=\"*\" class=\"HPITextExtraColumnsBladder\" valign=\"top\">";
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
					StartNextHpiColumn.Text = "</td><td class=\"HPITextExtraColumnsBladder\" valign=\"top\">";
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
					StartNextHpiColumn.Text = "</td><td class=\"HPITextExtraColumnsBladder\" valign=\"top\">";
				}
				else
				{
					StartNextHpiColumn.Visible = false;
				}


                if (((DataRowView)e.Item.DataItem)["ProcSurgeon"] == null || ((DataRowView)e.Item.DataItem)["ProcSurgeon"].ToString() == "")
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

		override protected void BuildComorbidities()
		{
			if (patientID != 0)
			{
				ComorbidityDa comorbiditiesDa = new ComorbidityDa();
				DataSet comorbiditiesDs = comorbiditiesDa.FormGetRecords(this.patientID, this._formName, "Dynamic");
				
				if (comorbiditiesDs.Tables.Count > 0 && comorbiditiesDs.Tables[0].Rows.Count > 0)
				{
					comorbidities.DataSource = comorbiditiesDs.Tables[0].DefaultView;
					comorbidities.DataBind();

					ComorbiditiesCell1.RowSpan = 3;
					ComorbiditiesCell2.Visible = false;
					ComorbiditiesCell3.Visible = false;
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




		protected void BuildSurgicalHistory()
		{
			if (patientID != 0)
			{
				ChronoDa da = new ChronoDa();
				DataSet ds  = da.GetChronoList(this.patientID, "Procedures", Context.User.Identity.Name);
				
				if (ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
				{
					SurgicalHistory.DataSource = ds.Tables[0].DefaultView;
					SurgicalHistory.DataBind();

					if (ds.Tables[0].Rows.Count > 3)
					{
						SurgicalHistoryCell1.RowSpan = 5;
//						SurgicalHistoryCell1.Attributes["class"] = "FormInnerRowRightBorder";
						SurgicalHistoryCell2.Visible = false;
						SurgicalHistoryCell3.Visible = false;
						SurgicalHistoryCell4.Visible = false;
						SurgicalHistoryCell5.Visible = false;
					}
				}
			}
		}




		override protected void SetFormInfo()  
		{
			this._formName = "UroBladNP";
			this._formTitle = "Urology Bladder New Patient";
		}

        protected void LoadSurveyForm()
        {
            if (null != SurveyFormHolder)
            {
                SurveyFormControl = (Caisis.UI.Core.Classes.BasePaperFormControl)this.LoadControl("UroSurveyHematuria.ascx");


                SurveyFormControl.BatchPatientId = this._batchPatientId;
                SurveyFormControl.FormInPatientId = this._formInPatientId;
                SurveyFormControl.FormAppointmentId = this._formAppointmentId;

                SurveyFormHolder.Controls.Add(SurveyFormControl);
            }
        }



	}
}
