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
    using System.Collections.Generic;

	/// <summary>
    ///		Summary description for UroProsActiveSurveillance.
	/// </summary>
    public partial class UroProsActiveSurveillance : BasePaperFormControl
	{

		protected static int NumHpiRowsAllowed = 10;

		private BasePaperFormControl  SurveyFormControl = null;
        private BasePaperFormControl QOLReportControl = null;

        protected DateTime FirstMSKBiopsyDate = DateTime.MaxValue; // will be used to compare with first Active Surveillance StatusDate
        protected string FirstMSKBiopsyDateText = ""; // will be used to display Active Surveillance date if biopsy is before statusDate
        protected int FirstMSKBiopsyProcId = 0; // will be used to highlight this record in the repeater
        protected DataTable ProstateBiopsies = new DataTable();
        

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
			BuildAllergies(2,1);
			BuildComorbidities();

            BuildLabTests(2,1);


			BuildImages(4,0);
            BuildDiseaseState();
			BuildUrinaryStatusValues();
			BuildQOL_Therapy(0,0);

			BuildShortSexualQOL();
			BuildShortUrinaryQOL();

            BuildProstateBiopsies(this.patientID);
            
            //active surveillance date needs to come after prostate biopsies
            BuildActiveSurveillanceDate();

            BuildDREHistory();

            BuildFamilyHistory();
            BuildSocialHistory();

            //            LoadQOLReport();

//            LoadHomeMedicationList();
            InsertPageBreak();
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
			this._formName = "UroProsActiveSurveillance";
			this._formTitle = "Urology Prostate Active Surveillance";
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
			
					if (hpiDs.Tables[1].Rows[0]["DxBiopsyId"] != null && hpiDs.Tables[1].Rows[0]["DxBiopsyId"].ToString().Length > 0)
					{
						hpiBiopsyId = (int)hpiDs.Tables[1].Rows[0]["DxBiopsyId"];
                        ShowDxBiopsy(hpiBiopsyId);
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



        protected void ShowDxBiopsy(int DxBiopsyId)
        {
            BusinessObject biz = BusinessObjectFactory.BuildBusinessObject("Procedures");
            biz.Get(DxBiopsyId);

            DxDateLabel.Text = biz[BOL.Procedure.ProcDateText].ToString();
        }










		protected void BuildUrinaryStatusValues()
		{
			if (patientID != 0)
			{
				SurveyDa urinaryDa = new SurveyDa();
				Hashtable ht = urinaryDa.FormGetUrinaryStatusValues(this.patientID, this._formName, "Dynamic");




                //if (ht["LastCont"] != null && ht["LastCont"].ToString() != "")
                //{
                //    LastCont.Text = "&nbsp;&nbsp;&nbsp;&nbsp;" + ht["LastCont"].ToString();
                //}
                //if (ht["ContLv2"] != null && ht["ContLv2"].ToString() != "")
                //{
                //    ContLv2Textbox.Value = ht["ContLv2"].ToString();
                //}
                //if (ht["ContLv1"] != null && ht["ContLv1"].ToString() != "")
                //{
                //    ContLv1Textbox.Value = ht["ContLv1"].ToString();
                //}
                //if (ht["LastIncontTx"] != null && ht["LastIncontTx"].ToString() != "")
                //{
                //    LastIncontTx.Text = ht["LastIncontTx"].ToString();
                //}
                //else
                //{
                //    LastIncontTxTableRow.Visible = false;
                //}
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
                //if (ht["LastPot"] != null && ht["LastPot"].ToString() != "")
                //{
                //    LastPot.Text = ht["LastPot"].ToString() + "<br>";
                //}
				if (ht["SexualQOL"] != null && ht["SexualQOL"].ToString() != "")
				{
					SexualQOL.Text = "<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" + ht["SexualQOL"].ToString();
				}
                //if (ht["PotLv3"] != null && ht["PotLv3"].ToString() != "")
                //{
                //    potLv3Textbox.Value = ht["PotLv3"].ToString();
                //}
                //if (ht["PotLv2"] != null && ht["PotLv2"].ToString() != "")
                //{
                //    potLv2Textbox.Value = ht["PotLv2"].ToString();
                //}
                //if (ht["PotLv1"] != null && ht["PotLv1"].ToString() != "")
                //{
                //    potLv1Textbox.Value = ht["PotLv1"].ToString();
                //}
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


        protected void InsertPageBreak()
        {
            if ((Request.QueryString["batchPrint"] != null && Request.QueryString["batchPrint"] == "true")) BatchPageBreak.Visible = true;
        }



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

//                        string corefilter = "LEN(" + BOL.BiopsyCoreProstatePathology.PathCoreGG1 + ") > 0 or LEN(" + BOL.BiopsyCoreProstatePathology.PathCoreGG2 + ") > 0 or LEN(" + BOL.BiopsyCoreProstatePathology.PathCoreGGS + ") > 0 or LEN(" + BOL.BiopsyCoreProstatePathology.PathCorePercCancer + ") > 0 or LEN(" + BOL.BiopsyCoreProstatePathology.PathCoreMaxCancerLength + ") > 0 or LEN(" + BOL.BiopsyCoreProstatePathology.PathCoreLength + ") > 0 or LEN(" + BOL.BiopsyCoreProstatePathology.PathCorePerineuralInv + ") > 0 or LEN(" + BOL.BiopsyCoreProstatePathology.PathCorePNI_Diam + ") > 0 or LEN(" + BOL.BiopsyCoreProstatePathology.PathCoreHG_PIN + ") > 0 or LEN(" + BOL.BiopsyCoreProstatePathology.PathCoreNumCores + ") > 0";
                        string corefilter = "LEN(" + BOL.BiopsyCoreProstatePathology.PathCoreGG1 + ") > 0 or LEN(" + BOL.BiopsyCoreProstatePathology.PathCoreGG2 + ") > 0 or LEN(" + BOL.BiopsyCoreProstatePathology.PathCoreGGS + ") > 0";

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


                // add class to MSK Biopsies
                if (FirstMSKBiopsyProcId > 0 && ((int)record["PrimaryKey"]).Equals(FirstMSKBiopsyProcId))
                {
                    HtmlTableRow BiopsyPopDataRow = (HtmlTableRow)e.Item.FindControl("BiopsyPopDataRow");
                    BiopsyPopDataRow.Attributes.Add("class", "local-institution");
                }

                
            }


        }










        protected void FamilyHistoryItemCreated(Object Sender, RepeaterItemEventArgs e)
        {

            Label FamMemSide, FamMemDiagnosis;
            FamMemDiagnosis = (Label)e.Item.FindControl("FamMemDiagnosis");
            FamMemSide = (Label)e.Item.FindControl("FamMemSide");


            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {

                if (((DataRowView)e.Item.DataItem)["FamMemDiagnosis"] == null || ((DataRowView)e.Item.DataItem)["FamMemDiagnosis"].ToString() == "")
                {
                    FamMemDiagnosis.Visible = false;
                }


                if (((DataRowView)e.Item.DataItem)["FamMemSide"] == null || ((DataRowView)e.Item.DataItem)["FamMemSide"].ToString() == "")
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



        override protected void BuildImages(int MinNumImageRowsToShow, int minNumBlankImageRows)
        {

            if (patientID != 0)
            {


                DiagnosticDa imagesDa = new DiagnosticDa();
                DataTable imagesDt = imagesDa.GetProstateMRIFindings(this.patientID);

                    int numBlankImageRows = MinNumImageRowsToShow - imagesDt.Rows.Count;

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
                        imagesDt.Rows.Add(blankImageRow);
                    }

                    images.DataSource = imagesDt.DefaultView;
                //else
                //{
                //    images.DataSource = BlankImages(MinNumImageRowsToShow).DefaultView;
                //}
            }
            //else
            //{
            //    images.DataSource = BlankImages(MinNumImageRowsToShow).DefaultView;
            //}

            images.DataBind();
        }


        //protected void AddExtentionAndInvasion(Object Sender, RepeaterItemEventArgs e)
        //{

        //    if ((e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem) && e.Item.DataItem != null)
        //    {

        //        DataRowView record = ((DataRowView)e.Item.DataItem);

        //        string site = record[BOL.ImageFinding.ImgFindSubsite].ToString().ToUpper();

        //        if (site.Equals("SEMINAL VESICLE"))
        //        {
        //            Label SVI = (Label)e.Item.FindControl("SVI");
        //            SVI.Text = record[BOL.Diagnostic.DxResult].ToString();
        //        }
        //        else if (site.Equals("EXTRACAPSULAR"))
        //        {
        //            Label ECE = (Label)e.Item.FindControl("ECE");
        //            ECE.Text = record[BOL.Diagnostic.DxResult].ToString();
        //        }
        //        else if (site.Equals("LYMPH NODES"))
        //        {
        //            Label LNI = (Label)e.Item.FindControl("LNI");
        //            LNI.Text = record[BOL.Diagnostic.DxResult].ToString();
        //        }


        //    }
        //}




        override protected void BuildLabTests(int minNumLabTestRowsToShow, int minNumBlankLabTestRows)
        {
            string[] labTestsToGet = new string[] { "PSA", "Prolaris Score", "Prolaris AUA", "Oncotype GPS", "Oncotype Path", "PCA3", "UPCA3", "UPCA3S", "PHI", "4K" };

            if (patientID != 0)
            {

                //Lab Tests

                DataTable labsToDisplay = ASLabsTable(labTestsToGet, this.patientID);

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
                    sortedLabs.Rows.Add(blankLabTestsRow);
                }


                labTests.DataSource = sortedLabs.DefaultView;
            }
            else
            {
                labTests.DataSource = BlankLabTests(minNumLabTestRowsToShow, labTestsToGet).DefaultView;
            }

            labTests.DataBind();

        }


        protected virtual DataTable BlankLabTests(int minNumLabTestRowsToShow, string[] labTestsToGet)
        {

            DataTable BlankLabTestsTable = ASLabsTable(labTestsToGet, null);

            for (int i = 0; i < minNumLabTestRowsToShow; i++)
            {
                DataRow blankLabTestsRow;
                blankLabTestsRow = BlankLabTestsTable.NewRow();
                blankLabTestsRow["LabDateText"] = "/&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;/";
                BlankLabTestsTable.Rows.Add(blankLabTestsRow);
            }

            return BlankLabTestsTable;

        }
/*
        protected DataTable ASLabsTable(string[] labTestsToGet, DataTable allLabs)
        {

            // data table structure
            DataTable labsTable = new DataTable();

            DataColumn DateTextCol = new DataColumn();
            DateTextCol.ColumnName = "LabDateText";
            labsTable.Columns.Add(DateTextCol);
            
            DataColumn DateCol = new DataColumn();
            DateCol.ColumnName = "LabDate";
            DateCol.DataType = System.Type.GetType("System.DateTime");
            labsTable.Columns.Add(DateCol);

            DataColumn PSADT = new DataColumn();
            PSADT.ColumnName = "PSADT";
            labsTable.Columns.Add(PSADT);           
            

            foreach (string lab in labTestsToGet)
            {
                DataColumn col = new DataColumn();
                col.ColumnName = lab;
                labsTable.Columns.Add(col);

                DataColumn IDCol = new DataColumn();
                IDCol.ColumnName = (lab + "Id");
                IDCol.DataType = System.Type.GetType("System.Int32");
                labsTable.Columns.Add(IDCol);
            }


            // table rows

            if (allLabs != null)
            {
                foreach (DataRow row in allLabs.Rows)
                {
                    string LabDateText = row[BOL.LabTest.LabDateText].ToString();
                    DateTime LabDate = new DateTime();
                    if (row[BOL.LabTest.LabDate].ToString().Length > 0) LabDate = (DateTime)row[BOL.LabTest.LabDate];
                    string LabType = row[BOL.LabTest.LabTest_Field].ToString();
                    string LabResult = row[BOL.LabTest.LabResult].ToString();
                    string LabNotes = row[BOL.LabTest.LabNotes].ToString();
                    int LabTestId = (int)row[BOL.LabTest.LabTestId];

                    DataRow[] currentDateRow = labsTable.Select("LabDateText = '" + LabDateText + "'");
                    if (currentDateRow.Length > 0)
                    {
                        currentDateRow[0][LabType] = LabResult;
                        currentDateRow[0][LabType + "Id"] = LabTestId;

                        // special cases
                        if (LabType.ToUpper().Equals("PROLARIS SCORE")) currentDateRow[0]["Prolaris AUA"] = LabNotes;
                        if (LabType.ToUpper().Equals("ONCOTYPE GPS")) currentDateRow[0]["Oncotype Path"] = LabNotes;

                    }
                    else
                    {
                        DataRow dr = labsTable.NewRow();
                        dr["LabDateText"] = LabDateText;
                        dr["LabDate"] = LabDate;
                        dr[LabType] = LabResult;
                        dr[LabType + "Id"] = LabTestId;

                        // special cases
                        if (LabType.ToUpper().Equals("PROLARIS SCORE")) dr["Prolaris AUA"] = LabNotes;
                        if (LabType.ToUpper().Equals("ONCOTYPE GPS")) dr["Oncotype Path"] = LabNotes;

                        labsTable.Rows.Add(dr);
                    }


                }


                if (labsTable.Rows.Count > 0)
                {
                    DataView sortedLabView = new DataView(labsTable);
                    sortedLabView.Sort = LabTest.LabDate + " ASC";
                    labsTable = sortedLabView.ToTable();



                    // get prostate volumes to calculate PSADensity in lab tests
                    DataTable ProstateVolumes = ProstateVolumesByDescendingDate();
                    if (ProstateVolumes.Rows.Count > 0)
                    {
                            foreach (DataRow labRow in labsTable.Rows)
                            {
                                double psa = 0;
                                if (labRow["LabDate"].ToString().Length > 0 && labRow["PSA"].ToString().Length > 0 && double.TryParse(labRow["PSA"].ToString(), out psa))
                                {

                                    DataView v = new DataView(ProstateVolumes);
                                    v.RowFilter = Diagnostic.DxDate + " <= #" + ((DateTime)labRow["LabDate"]).ToShortDateString() + "#";

                                    if (v.Count > 0)
                                    {
                                        double mostRecentVolumeMeasurement = 0;

                                        if (double.TryParse(v[0][ImageProstate.ImgProstateVolume].ToString(), out mostRecentVolumeMeasurement))
                                        {
                                            double psadt = Math.Round((psa / mostRecentVolumeMeasurement), 4);
                                            labRow["PSADT"] = psadt;
                                        }
                                    }

                                }
                            }
                    }


                }

            }
            return labsTable;
        }


*/


        


            

        protected void BuildDREHistory()
        {
            if (patientID != 0)
            {
                EncRectalExamDa eda = new EncRectalExamDa();
                DataTable dt = eda.GetDREHistory(this.patientID);

                if (dt.Rows.Count > 0)
                {
                    DREHistory.DataSource = dt.DefaultView;
                    DREHistory.DataBind();
                }

            }

        }



        protected void DREHistoryItemDataBound(Object Sender, RepeaterItemEventArgs e)
        {

            if ((e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem) && e.Item.DataItem != null)
            {

                DataRowView record = ((DataRowView)e.Item.DataItem);

                // get clinical stages from same date
                if (record[Encounter.EncDate].ToString().Length > 0)
                {
                    DataTable stageHistory = ClinicalStageHistory();

                    DataRow[] clinicalStageRows = stageHistory.Select("ClinStageDate = '#" + record[Encounter.EncDate] + "#'");
                    if (clinicalStageRows.Length > 0)
                    {

                        string StageT = (clinicalStageRows[0][ClinicalStage.ClinStageT].ToString());
                        string StageN = (clinicalStageRows[0][ClinicalStage.ClinStageN].ToString());
                        string StageM = (clinicalStageRows[0][ClinicalStage.ClinStageM].ToString());

                        string stages = "";
                        if (StageT.Length > 0) stages += StageT;
                        if (StageN.Length > 0) stages += (stages.Length > 0) ? (", " + StageN) : StageN;
                        if (StageM.Length > 0) stages += (stages.Length > 0) ? (", " + StageM) : StageM;

                        if (stages.Length > 0)
                        {
                            Literal ClinicalStageVals = (Literal)e.Item.FindControl("ClinicalStageVals");
                            ClinicalStageVals.Text = stages;
                        }


                    }
                }

                // get findings
                int EncounterId = (int)record[Encounter.EncounterId];
                DataView findings = DREFindingsByEncounter(EncounterId);
                if (findings.Count > 0)
                {
                    Repeater DREFindings = (Repeater)e.Item.FindControl("DREFindings");
                    DREFindings.DataSource = findings;
                    DREFindings.DataBind();
                }

            }
        }

        protected DataTable ClinicalStageHistory()
        {
            ClinicalStageDa cda = new ClinicalStageDa();
            DataTable cdt = cda.FormGetRecords(this.patientID);
            DataView cdv = new DataView(cdt);
            cdv.RowFilter = ClinicalStage.ClinStageDisease + " = 'Prostate'";
            cdv.Sort = ClinicalStage.ClinStageDate + " ASC, " +  ClinicalStage.EnteredTime + " DESC";

            return cdv.ToTable();
        }

        

        protected DataView DREFindingsByEncounter(int EncounterID)
        {
            EncRectalExamDa dreDA = new EncRectalExamDa();
            DataTable dreDT = dreDA.GetAllDREFindings(this.patientID);
            DataView dreDV = new DataView(dreDT);
            dreDV.RowFilter = EncRectalExamFinding.EncounterId + " = " + EncounterID.ToString();

            return dreDV;
        }


        override protected void BuildProstateBiopsies(int PatientID)
        {
            DataTable biopsiesDt;
            BiopsyDa bDa = new BiopsyDa();
            biopsiesDt = bDa.GetProstateBiopsies(PatientID);

            if (biopsiesDt.Rows.Count > 0)
            {
                ProstateBiopsies = biopsiesDt; // for use in calculating active surveillance date

                foreach (DataRow row in biopsiesDt.Rows)
                {
                    if (row[Procedure.ProcQuality].ToString().Equals("STD") && row[Procedure.ProcDate].ToString().Length > 0 && ((DateTime)row[Procedure.ProcDate]) < FirstMSKBiopsyDate)
                    {
                        FirstMSKBiopsyDate = (DateTime)row[Procedure.ProcDate];
                        FirstMSKBiopsyDateText = row[Procedure.ProcDateText].ToString();
                        FirstMSKBiopsyProcId = (int)row["PrimaryKey"];
                        break;
                    }
                }

                DataView BiopsiesToDisplay = new DataView(biopsiesDt);

                DataView ReviewedBiopsies = new DataView(biopsiesDt);
                ReviewedBiopsies.RowFilter = BOL.Pathology.PathQuality + " IN ('REV', 'RR')";

                if (ReviewedBiopsies.Count > 0)
                {
                    List<string> OutsidePathRecordsToFilter = new List<string>();
                    foreach (DataRowView ReviewedBiopsy in ReviewedBiopsies)
                    {
                        string ProcedureIdStr = ReviewedBiopsy["PrimaryKey"].ToString();
                        OutsidePathRecordsToFilter.Add(ProcedureIdStr);
                    }
                    string biopsyFilter = "NOT (" + BOL.Pathology.PathQuality + " = 'OUT' AND PrimaryKey IN (" + string.Join(",", OutsidePathRecordsToFilter.ToArray()) + "))";
                    BiopsiesToDisplay.RowFilter = biopsyFilter;
                }


                Biopsies.DataSource = BiopsiesToDisplay;
                Biopsies.DataBind();
                BlankBiopsyRecord.Visible = false;

            }

        }


        protected void BuildDiseaseState()
        {
            if (patientID != 0)
            {
                string ls = GetLastStatus();
                if (ls.Length > 0) { LastStatus.Text = ls; LastStatus.Visible = true; }
            }

        }


        protected void BuildActiveSurveillanceDate()
        {
            string ASDateText = ProstateUtil.ActiveSurveillanceDate(this.patientID);
            if (ASDateText.Length > 0) ASDateLabel.Text = ASDateText;

        }
        

	}
}
