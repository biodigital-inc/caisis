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
	public partial class UroProsFU : BasePaperFormControl
	{

		protected static int NumHpiRowsAllowed = 10;

//		protected Label	postRP7yrNomo, LastStatus, NVB_Right, NVB_Left, PreTxPot, LastPot, SexualQOL;


//		protected Repeater complications, hpiBiopsies, HpiProstatectomies, QolTherapy;

//		protected System.Web.UI.HtmlControls.HtmlInputText potLv3Textbox, potLv2Textbox, potLv1Textbox, ContLv2Textbox, ContLv1Textbox;

//		protected bool viagraShown = false;




//		protected int hpiBiopsyId;
		private BasePaperFormControl  SurveyFormControl = null;
        private BasePaperFormControl QOLReportControl = null;

		override protected void Page_Load(object sender, EventArgs e)
		{

			base.Page_Load(sender, e);

			BuildReferringMD();
			BuildHPI();
			BuildPotencyStatusValues();
			BuildHpiProstatectomies();
			BuildHpiProtocols();
			BuildHpiBiopsies(hpiBiopsyId);
			BuildHPINerveStatus();
			//BuildMedications(4,2);
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

//            BuildProstateBiopsies(this.patientID);  // moved to inside of the HPI Prostatectomies method below, only call this if there's no prostatectomy

//			LoadSurveyForm();
            LoadQOLReport();

//            LoadHomeMedicationList();
//            InsertPageBreak();
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


        protected void LoadQOLReport()
        {
            if (null != QOLReportHolder)
            {
                QOLReportControl = (Caisis.UI.Core.Classes.BasePaperFormControl)this.LoadControl("ProstateQOLResults.ascx");


                QOLReportControl.BatchPatientId = this._batchPatientId;
                QOLReportControl.FormInPatientId = this._formInPatientId;
                QOLReportControl.FormAppointmentId = this._formAppointmentId;

                QOLReportHolder.Controls.Add(QOLReportControl);
            }
        }



		
		override protected void SetFormInfo()  
		{
			this._formName = "UroProsFU";
			this._formTitle = "Urology Prostate Follow-Up";
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

                    //try
                    //{
                    //    preRP5Nomo.Text = ((int) Math.Round(nda.GetPreRPResult(patientID, 5), 0)).ToString();
                    //}
                    //catch { }

                    try
                    {
                        preRP10Nomo.Text = ((int)Math.Round(nda.GetPreRPResult(patientID, 10), 0)).ToString();
                        preRP10Nomo.Text = ((int)Math.Round(nda.GetPreRPResult(patientID, 15), 0)).ToString();
                    }
                    catch { }

                    try
                    {
                        preBrachyNomo.Text = ((int) Math.Round(nda.GetPreBrachyResult(patientID), 0)).ToString();
                    }
                    catch { }

                    try
                    {
                        postRP10yrNomo.Text = ((int) Math.Round(nda.GetPostRPResult(patientID, 10), 0)).ToString();
                    }
                    catch { }

                    try
                    {
                        preXRTNomo.Text = ((int) Math.Round(nda.GetPreXRTResult(patientID), 0)).ToString();
                    }
                    catch { }

                    //try
                    //{
                    //    postRP7yrNomo.Text = ((int) Math.Round(nda.GetPostRPResult(patientID, 7), 0)).ToString();
                    //}
                    //catch { }

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


        //protected void InsertPageBreak()
        //{
        //    if (!(Request["batchPrint"] != null && Request["batchPrint"] == "true")) BatchPageBreak.Visible = true;
        //}



        protected void BiopsiesOnDataBound(Object Sender, RepeaterItemEventArgs e)
        {

            Literal ResultField = (Literal)e.Item.FindControl("ResultField");
            Literal CommentsField = (Literal)e.Item.FindControl("CommentsField");


            if ((e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem) && e.Item.DataItem != null)
            {

                DataRowView record = ((DataRowView)e.Item.DataItem);


                if (record["BxType"].ToString().Length > 0 && (record["BxType"].ToString().ToUpper().IndexOf("PROSTATE") > -1))
                {
                    string resultText = "";
                    
                    if (record["PathGG1"].ToString().Length > 0 || record["PathGG2"].ToString().Length > 0)
                    {
                        resultText = record["PathGG1"].ToString() + " + " + record["PathGG2"].ToString();
                        if (record["PathGGS"].ToString().Length > 0) resultText += (" = " + record["PathGGS"].ToString());

                        if (record["PathResult"].ToString().Length > 0) resultText += (" (" + record["PathResult"].ToString() + ")");

                    }
                    else { resultText = record["PathResult"].ToString(); }
                    

                    ResultField.Text = resultText;
                }
                else
                {
                    ResultField.Text = record["PathResult"].ToString();
                }

                
                string comments = "";
                if (record[BOL.ProstatectomyPathology.PathHG_PIN].ToString().Length > 0) comments += "PIN:" + record[BOL.ProstatectomyPathology.PathHG_PIN].ToString() + ", ";
                if (record["PathASAP"].ToString().Length > 0) comments += "ASAP:" + record["PathASAP"].ToString();

                if (comments.Length > 0) CommentsField.Text = comments;


                if (record[BOL.BiopsyCoreProstatePathology.PathologyId].ToString().Length > 0)
                {
                    BiopsyDa b = new BiopsyDa();
                    DataTable coresDt = b.FormGetBiopsyCorePathsByPathologyId((int)record["PathologyId"]);


                    if (coresDt.Rows.Count > 0)
                    {

                        string corefilter = "LEN(" + BOL.BiopsyCoreProstatePathology.PathCoreGG1 + ") > 0 or LEN(" + BOL.BiopsyCoreProstatePathology.PathCoreGG2 + ") > 0 or LEN(" + BOL.BiopsyCoreProstatePathology.PathCoreGGS + ") > 0 or LEN(" + BOL.BiopsyCoreProstatePathology.PathCorePercCancer + ") > 0 or LEN(" + BOL.BiopsyCoreProstatePathology.PathCoreMaxCancerLength + ") > 0 or LEN(" + BOL.BiopsyCoreProstatePathology.PathCoreLength + ") > 0 or LEN(" + BOL.BiopsyCoreProstatePathology.PathCorePerineuralInv + ") > 0 or LEN(" + BOL.BiopsyCoreProstatePathology.PathCorePNI_Diam + ") > 0 or LEN(" + BOL.BiopsyCoreProstatePathology.PathCoreHG_PIN + ") > 0 or LEN(" + BOL.BiopsyCoreProstatePathology.PathCoreNumCores + ") > 0";

                        DataView coresDv = new DataView(coresDt);
                        coresDv.RowFilter = corefilter;

                        if (coresDv.Count > 0)
                        {
                            HtmlTableRow CoresContainer = (HtmlTableRow)e.Item.FindControl("CoresContainer");
                            CoresContainer.Visible = true;
                            BiopsyCoresBlankDataTable.Visible = false;


                            Repeater Cores = (Repeater)e.Item.FindControl("Cores");
                            Cores.DataSource = coresDv;
                            Cores.DataBind();
                        }
                    }
                }


                
            }


        }


        override protected void BuildImages(int MinNumImageRowsToShow, int minNumBlankImageRows)
        {

            if (patientID != 0)
            {


                DiagnosticDa imagesDa = new DiagnosticDa();
                DataTable imagesDt = imagesDa.GetImagingAll(this.patientID);

                if (imagesDt.Rows.Count > 0)
                {
                    int numBlankImageRows = MinNumImageRowsToShow - imagesDt.Rows.Count;

                    /* this code truncated the text in the notes field.  removed 11/17 from development.
					if (imagesDs.Tables[0].Rows.Count > 0)
					{

						for (int i=0; i<imagesDs.Tables[0].Rows.Count; i++)
						{
							int DxNotesLength = imagesDs.Tables[0].Rows[i]["DxNotes"].ToString().Length;
							if (DxNotesLength > 255)
							{
								imagesDs.Tables[0].Rows[i]["DxNotes"] = imagesDs.Tables[0].Rows[i]["DxNotes"].ToString().Remove(255, (DxNotesLength-255)) + "...";
							}
						}
					}
                    */



                    // be sure you have at least the number of blank rows specified earlier
                    if (numBlankImageRows < minNumBlankImageRows)
                    {
                        numBlankImageRows = minNumBlankImageRows;
                    }

                    // add the blank rows
                    for (int i = 0; i < numBlankImageRows; i++)
                    {
                        DataRow blankImageRow;
                        blankImageRow = imagesDt.NewRow();
                        blankImageRow["DxDateText"] = "/&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;/";
                        blankImageRow["DxType"] = "";
                        blankImageRow["DxResult"] = "";
                        blankImageRow["DxNotes"] = "";
                        blankImageRow["DxTarget"] = "";
                        imagesDt.Rows.Add(blankImageRow);
                    }




                    images.DataSource = imagesDt.DefaultView;
                }
                else
                {
                    images.DataSource = BlankImages(MinNumImageRowsToShow).DefaultView;
                }
            }
            else
            {
                images.DataSource = BlankImages(MinNumImageRowsToShow).DefaultView;
            }

            images.DataBind();
        }


        override protected void BuildLabTests(int minNumLabTestRowsToShow, int minNumBlankLabTestRows)
        {
            if (patientID != 0)
            {

                //Lab Tests
                string[] labTestsToGet = new string[] { "PSA", "FPSA", "PCA3", "UPCA3", "UPCA3S" };

                LabTestDa da = new LabTestDa();

                DataSet labTestsDs = da.GetLabTestsbyList(this.patientID, labTestsToGet);


                if (labTestsDs.Tables.Count > 0 && labTestsDs.Tables[0].Rows.Count > 0)
                {
                    DataTable allLabs = labTestsDs.Tables[0];
                    DataTable labsToDisplay = allLabs.Clone();

                    // get last 3 PSAs
                    DataView PSAs = new DataView(allLabs);
                    PSAs.RowFilter = LabTest.LabTest_Field + " = 'PSA'";
                    PSAs.Sort = LabTest.LabDate + " DESC";
                    int maxPSAs = 3;
                    if (PSAs.Count > maxPSAs)
                    {
                        for (int i = 0; i < maxPSAs; i++)
                        {
                            labsToDisplay.ImportRow(PSAs[i].Row);
                        }
                    }
                    else labsToDisplay.Merge(PSAs.ToTable());

                    // get last 3 FPSAs
                    DataView FPSAs = new DataView(allLabs);
                    FPSAs.RowFilter = LabTest.LabTest_Field + " = 'FPSA'";
                    FPSAs.Sort = LabTest.LabDate + " DESC";
                    int maxFPSAs = 3;
                    if (FPSAs.Count > maxFPSAs)
                    {
                        for (int i = 0; i < maxFPSAs; i++)
                        {
                            labsToDisplay.ImportRow(FPSAs[i].Row);
                        }
                    }
                    else labsToDisplay.Merge(FPSAs.ToTable());

                    // get all PCA3
                    DataView PCA3s = new DataView(allLabs);
                    PCA3s.RowFilter = LabTest.LabTest_Field + " IN ('PCA3', 'UPCA3', 'UPCA3S')";
                    if (PCA3s.Count > 0) { labsToDisplay.Merge(PCA3s.ToTable()); }


                    if (labsToDisplay.Rows.Count > 0)
                    {
                        DataView sortedLabView = new DataView(labsToDisplay);
                        sortedLabView.Sort = LabTest.LabDate + " ASC";
                        DataTable sortedLabs = sortedLabView.ToTable();

                        int numBlankLabTestRows = minNumLabTestRowsToShow - sortedLabs.Rows.Count;

                        if (numBlankLabTestRows < minNumBlankLabTestRows)
                        {
                            numBlankLabTestRows = minNumBlankLabTestRows;
                        }

                        for (int i = 0; i < numBlankLabTestRows; i++)
                        {
                            DataRow blankLabTestsRow;
                            blankLabTestsRow = sortedLabs.NewRow();
                            blankLabTestsRow["LabDateText"] = "/&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;/";
                            blankLabTestsRow["LabTest"] = "&nbsp;";
                            blankLabTestsRow["LabResult"] = "&nbsp;";
                            blankLabTestsRow["LabQuality"] = "&nbsp;";
                            sortedLabs.Rows.Add(blankLabTestsRow);
                        }


                        labTests.DataSource = sortedLabs.DefaultView;
                    }
                    else
                    {
                        labTests.DataSource = BlankLabTests(minNumLabTestRowsToShow).DefaultView;
                    }
                }
                else
                {
                    labTests.DataSource = BlankLabTests(minNumLabTestRowsToShow).DefaultView;
                }

            }
            else
            {
                labTests.DataSource = BlankLabTests(minNumLabTestRowsToShow).DefaultView;
            }

            labTests.DataBind();
        }

        override protected void BuildHpiProstatectomies()
        {

            base.BuildHpiProstatectomies(this.patientID, this._formName, "Dynamic");


            // if the patient has had a prostatectomy, hide the entire Biopsy section (before the Exam)
            if (HpiProstatectomies.Items.Count > 0)
            {
                Biopsies.Visible = false;
                BiopsyHeaderTableRow.Visible = false;
                BiopsyCoresBlankDataTableContainer.Visible = false;

            }
            else
            {
                BuildProstateBiopsies(this.patientID);
            }

        }



	}
}
