namespace Caisis.UI.Modules.Prostate.PaperForms
{
	using System;
	using System.Data;
	using System.Collections;
	using System.Web;
	using System.Web.UI;
	using System.Web.UI.WebControls;
	using System.Web.UI.HtmlControls;

	using Caisis.BOL;
	
	using Caisis.DataAccess;

	using System.Data.SqlClient;

	using System.Configuration;

	using Caisis.UI.Core.Classes;

	/// <summary>
	///		Summary description for UroProsFU.
	/// </summary>
    public partial class UroProsFU_Regional : BasePaperFormControl
	{

		protected static int NumHpiRowsAllowed = 10;

//		protected Label	postRP7yrNomo, LastStatus, NVB_Right, NVB_Left, PreTxPot, LastPot, SexualQOL;


//		protected Repeater complications, hpiBiopsies, HpiProstatectomies, QolTherapy;

//		protected System.Web.UI.HtmlControls.HtmlInputText potLv3Textbox, potLv2Textbox, potLv1Textbox, ContLv2Textbox, ContLv1Textbox;

//		protected bool viagraShown = false;




//		protected int hpiBiopsyId;
		private BasePaperFormControl  SurveyFormControl = null;


		override protected void Page_Load(object sender, EventArgs e)
		{

			base.Page_Load(sender, e);

            SetRegionalLocation();

			BuildReferringMD();
			BuildHPI();
			BuildPotencyStatusValues();
			BuildHpiProstatectomies();
			BuildHpiProtocols();
			BuildHpiBiopsies(hpiBiopsyId);
			BuildHPINerveStatus();
			BuildMedications(4,2);
			BuildAllergies(4,1);
			BuildComorbidities();
			BuildLabTests(6,0);
			BuildImages(2,1);
			//			BuildComplications();
			LastStatus.Text = GetLastStatus();
			BuildUrinaryStatusValues();
			BuildQOL_Therapy(0,0);


			BuildShortSexualQOL();
			BuildShortUrinaryQOL();


			LoadSurveyForm();
		}


		protected void LoadSurveyForm()
		{
			if (null != SurveyFormHolder)
			{
                //SurveyFormControl = (Caisis.UI.Core.Classes.BasePaperFormControl)this.LoadControl("UroSurveyUrinSexFunc.ascx");
                SurveyFormControl = (Caisis.UI.Core.Classes.BasePaperFormControl)this.LoadControl("UroSurveyProstateQOL_Regional.ascx");


				SurveyFormControl.BatchPatientId = this._batchPatientId;
				SurveyFormControl.FormInPatientId = this._formInPatientId;
				SurveyFormControl.FormAppointmentId = this._formAppointmentId;

				SurveyFormHolder.Controls.Add(SurveyFormControl);
			}
		}


		
		override protected void SetFormInfo()  
		{
			this._formName = "UroProsFU";
            this._formTitle = "Urology Prostate Follow-Up (Basking Ridge)";
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
                    //postRP7yrNomo.Text = hpiDs.Tables[1].Rows[0]["postRP7yrNomo"].ToString();

                    NomogramDa nda = new NomogramDa();

                    try
                    {
                        preRP5Nomo.Text = ((int) Math.Round(nda.GetPreRPResult(patientID, 5), 0)).ToString();
                    }
                    catch { }

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
                        postRP7yrNomo.Text = ((int) Math.Round(nda.GetPostRPResult(patientID, 7), 0)).ToString();
                    }
                    catch { }

                    try
                    {
                        postRP10yrNomo.Text = ((int) Math.Round(nda.GetPostRPResult(patientID, 10), 0)).ToString();
                    }
                    catch { }

					// set the value of the biopsy Id that is to be REMOVED from the results of the 
					// stored proc spFormListBiopsies so that the biopsy is only listed once in the 
					// hpi section of the form
				
					if (hpiDs.Tables[1].Rows[0]["DxBiopsyId"] != null && hpiDs.Tables[1].Rows[0]["DxBiopsyId"].ToString().Length > 0)
					{
						hpiBiopsyId = (int)hpiDs.Tables[1].Rows[0]["DxBiopsyId"];
					}
				}
				catch (Exception ex)
				{
					hpi.Visible = false;
					//Caisis.UI.Other.EmailError.SendErrorEmail( "Clinic Form: " + this._formTitle, "error creating hpi output");
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
					StartNextHpiColumn.Text = "</td><td class=\"HPITextExtraColumns\" valign=\"top\">";
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













		protected void BuildUrinaryStatusValues()
		{
			if (patientID != 0)
			{
				SurveyDa urinaryDa = new SurveyDa();
				Hashtable ht = urinaryDa.FormGetUrinaryStatusValues(this.patientID, this._formName, "Dynamic");




				if (ht["LastCont"] != null && ht["LastCont"].ToString() != "")
				{
					LastCont.Text = "&nbsp;&nbsp;&nbsp;&nbsp;" + ht["LastCont"].ToString();
				}
				if (ht["ContLv2"] != null && ht["ContLv2"].ToString() != "")
				{
					ContLv2Textbox.Value = ht["ContLv2"].ToString();
				}
				if (ht["ContLv1"] != null && ht["ContLv1"].ToString() != "")
				{
					ContLv1Textbox.Value = ht["ContLv1"].ToString();
				}
				if (ht["LastIncontTx"] != null && ht["LastIncontTx"].ToString() != "")
				{
					LastIncontTx.Text = ht["LastIncontTx"].ToString();
				}
				else
				{
					LastIncontTxTableRow.Visible = false;
				}
				if (ht["UrinaryQOL"] != null && ht["UrinaryQOL"].ToString() != "")
				{
					UrinaryQOL.Text = "<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" + ht["UrinaryQOL"].ToString();
				}



			}

		}















		protected override void BuildPotencyStatusValues()
		{
			if (patientID != 0)
			{
				SurveyDa potencyDa = new SurveyDa();
				Hashtable ht = potencyDa.FormGetPotencyStatusValues(this.patientID, this._formName, "Dynamic");
			
				if (ht["PreTxPot"] != null && ht["PreTxPot"].ToString() != "")
				{
					PreTxPot.Text = ht["PreTxPot"].ToString() + "<br>";
				}
				if (ht["LastPot"] != null && ht["LastPot"].ToString() != "")
				{
					LastPot.Text = ht["LastPot"].ToString() + "<br>";
				}
				if (ht["SexualQOL"] != null && ht["SexualQOL"].ToString() != "")
				{
					SexualQOL.Text = "<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" + ht["SexualQOL"].ToString();
				}
				if (ht["PotLv3"] != null && ht["PotLv3"].ToString() != "")
				{
					potLv3Textbox.Value = ht["PotLv3"].ToString();
				}
				if (ht["PotLv2"] != null && ht["PotLv2"].ToString() != "")
				{
					potLv2Textbox.Value = ht["PotLv2"].ToString();
				}
				if (ht["PotLv1"] != null && ht["PotLv1"].ToString() != "")
				{
					potLv1Textbox.Value = ht["PotLv1"].ToString();
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


				if (((DataRowView) e.Item.DataItem )["ProcSurgeon"] == null || ((DataRowView) e.Item.DataItem )["ProcSurgeon"].ToString() == "" )
				{
					CaseSurgeonLabel.Visible = false;
				}


			}
		}





		protected void BuildQOL_Therapy(int MinNumQOL_TherapyRowsToShow, int minNumBlankQOL_TherapyRows)
		{
			if (patientID != 0)
			{

				QOL_TherapyDa QolDa = new QOL_TherapyDa();
				DataSet QolDs = QolDa.FormListQOL_Therapy(this.patientID, this._formName, "Dynamic");

				if (QolDs.Tables.Count > 0)
				{
					int numBlankQolRows = minNumBlankQOL_TherapyRows - QolDs.Tables[0].Rows.Count;



					// be sure you have at least the number of blank rows specified earlier
					if (numBlankQolRows < minNumBlankQOL_TherapyRows)
					{
						numBlankQolRows = minNumBlankQOL_TherapyRows;
					}

					if (numBlankQolRows > 0)
					{
						// add the blank rows
						for (int i=0; i<numBlankQolRows; i++)
						{
							DataRow blankQolRow;
							blankQolRow = QolDs.Tables[0].NewRow();
							blankQolRow["QOL_Therapy"] = "&nbsp;";
							blankQolRow["QOL_TxDateText"] = "&nbsp;";
							blankQolRow["QOL_TxStopDateText"] = "&nbsp;";
							QolDs.Tables[0].Rows.Add(blankQolRow);
						}
					}
					QolTherapy.DataSource = QolDs.Tables[0].DefaultView;
				}
				else
				{
					QolTherapy.DataSource = BlankQOL_Therapy(MinNumQOL_TherapyRowsToShow).DefaultView;
				}

			}
			else
			{
				QolTherapy.DataSource = BlankQOL_Therapy(MinNumQOL_TherapyRowsToShow).DefaultView;
			}

			QolTherapy.DataBind();
		}



		protected DataTable BlankQOL_Therapy(int MinNumQOL_TherapyRowsToShow)
		{
			DataTable BlankQolTable = new DataTable();
			BlankQolTable.Columns.Add("QOL_Therapy");
			BlankQolTable.Columns.Add("QOL_TxDateText");
			BlankQolTable.Columns.Add("QOL_TxStopDateText");

			for (int i=0; i<MinNumQOL_TherapyRowsToShow; i++)
			{
				DataRow blankQolRow;
				blankQolRow = BlankQolTable.NewRow();
				blankQolRow["QOL_Therapy"] = "&nbsp;";
				blankQolRow["QOL_TxDateText"] = "&nbsp;";
				blankQolRow["QOL_TxStopDateText"] = "&nbsp;";
				BlankQolTable.Rows.Add(blankQolRow);
			}
		
		
			return BlankQolTable;
		}











		protected void QolTherapyItemDataBound(Object Sender, RepeaterItemEventArgs e) 
		{

			System.Web.UI.HtmlControls.HtmlTableRow QolTherapyRow;
			QolTherapyRow = (HtmlTableRow) e.Item.FindControl("QolTherapyRow");



			if (e.Item.ItemType == ListItemType.Item) 
			{
				
				if ((((DataRowView) e.Item.DataItem )["QOL_Therapy"] != null) && (((DataRowView) e.Item.DataItem )["QOL_Therapy"].ToString().ToUpper().IndexOf("VIAGRA") > -1 ))
				{
					if (viagraShown == true)
					{
						QolTherapyRow.Visible = false;
					}
					else
					{
						QolTherapyRow.Visible = true;
						viagraShown = true;
					}
				}
			}
		}




	}
}
