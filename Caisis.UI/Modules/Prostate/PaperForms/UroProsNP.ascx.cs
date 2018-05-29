namespace Caisis.UI.Modules.Prostate.PaperForms
{
	using System;
	using System.Data;
	using System.Drawing;
	using System.Web;
	using System.Web.UI.WebControls;
	using System.Web.UI.HtmlControls;
	using System.Collections;

	using System.Data.SqlClient;
	using System.Collections.Specialized;
	

	using Caisis.DataAccess;
	using Caisis.BOL;
	using System.Configuration;

	using Caisis.UI.Core.Classes;


	/// <summary>
	///		Summary description for Medications.
	/// </summary>
	public partial  class UroProsNP : BasePaperFormControl
	{


		protected Label phFirstName, phLastName, phInstitution;

		protected Label apptDate, apptPhysician; 

		protected static int NumHpiRowsAllowed = 28;





		private BasePaperFormControl  SurveyFormControl = null;






		override protected void SetFormInfo()  
		{
			this._formName = "UroProsNP";
			this._formTitle = "Urology Prostate New Patient";
		}

		override protected void Page_Load(object sender, EventArgs e)
		{

			base.Page_Load(sender, e);

			BuildReferringMD();
			BuildHPI();
			//BuildMedications(8,2);
			BuildXRT(3, 1);
			BuildAllergies();
			//BuildAllergies(3,2);
			BuildComorbidities();
			BuildFamilyHistory();
			BuildSocialHistory();
			BuildLabTests(6,0);
			BuildImages(3,1);
			BuildShortSexualQOL();
			BuildShortUrinaryQOL();
//			LoadSurveyForm();
//            LoadHomeMedicationList();
		}


		protected void LoadSurveyForm()
		{
			if (null != SurveyFormHolder)
			{
                //SurveyFormControl = (Caisis.UI.Core.Classes.BasePaperFormControl)this.LoadControl("UroSurveyUrinSexFunc.ascx");
                SurveyFormControl = (Caisis.UI.Core.Classes.BasePaperFormControl)this.LoadControl("UroSurveyProstateQOL.ascx");


				SurveyFormControl.BatchPatientId = this._batchPatientId;
				SurveyFormControl.FormInPatientId = this._formInPatientId;
				SurveyFormControl.FormAppointmentId = this._formAppointmentId;



				SurveyFormHolder.Controls.Add(SurveyFormControl);
			}
		}




		protected void BuildHPI()
		{
			if (patientID != 0)
			{

				try
				{
					PatientDa hpiDa = new PatientDa();


					DataSet hpiDs = hpiDa.GetPatientHPI(this.patientID, 0, 0);
					hpi.DataSource = hpiDs.Tables[0].DefaultView;
					hpi.DataBind();


					int rowCount = hpiDs.Tables[0].Rows.Count;

					//nomograms are in a second result set
                    //preRPNomo.Text = hpiDs.Tables[1].Rows[0]["preRPNomo"].ToString();
                    //preXRTNomo.Text = hpiDs.Tables[1].Rows[0]["preXRTNomo"].ToString();
                    //preBrachyNomo.Text = hpiDs.Tables[1].Rows[0]["preBrachyNomo"].ToString();

                    NomogramDa nda = new NomogramDa();

                    //try
                    //{
                    //    preRP5Nomo.Text = ((int) Math.Round(nda.GetPreRPResult(patientID, 5), 0)).ToString();
                    //}
                    //catch { }

                    try
                    {
                        preRP10Nomo.Text = ((int) Math.Round(nda.GetPreRPResult(patientID, 10), 0)).ToString();
                    }
                    catch { }

                    try
                    {
                        preXRTNomo.Text = ((int) Math.Round(nda.GetPreXRTResult(patientID), 0)).ToString();
                    }
                    catch { }

                    try
                    {
                        preBrachyNomo.Text = ((int) Math.Round(nda.GetPreBrachyResult(patientID), 0)).ToString();
                    }
                    catch { }



                    try
                    {
                        postRP10yrNomo.Text = ((int)Math.Round(nda.GetPostRPResult(patientID, 10), 0)).ToString();
                    }
                    catch { }
				}
				catch (Exception ex)
				{
					//Caisis.UI.Other.EmailError.SendErrorEmail( "Clinic Form: " + this._formTitle, "error creating hpi output");
					ExceptionHandler.Publish(ex);
				}
			}
//			else
//			{
//				HpiSpacer.Height = NumHpiRowsAllowed*12;
//			}

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
					StartNextHpiColumn.Text = "</td><td class=\"HPITextExtraColumns\" valign=\"top\">";
				}
				else
				{
					StartNextHpiColumn.Visible = false;
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



	}
}
