using System;
using System.Data;
using System.Collections;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;

using Caisis.Security;

using Caisis.BOL;

using Caisis.DataAccess;

using System.Data.SqlClient;

using System.Configuration;
using System.Linq;

using System.Collections.Generic;



namespace Caisis.UI.Core.Classes
{
	/// <summary>
	/// Summary description for FormControl.
	/// </summary>
	public class BasePaperFormControl : Caisis.UI.Core.Classes.BaseClinicFormControl
	{
		protected int patientID;
		protected string _formName, _formTitle;
		protected bool _apptScheduled;
		protected bool IsOnePageForm = false;
		//		protected string _barCode;
		protected int _batchPatientId = 0;
		protected int _formAppointmentId = 0;
		protected int _formInPatientId = 0;
		protected string institutionShortName;
		protected string institutionName;

		protected string patientFirstName, patientMiddleName, patientLastName, patientMRN, patientDOB, patientAddress1, patientAddress2, patientCity, patientState, patientPostalCode, patientMRNLabel, patientNameLabel, patientAddressLabel;
		protected string currentClinicDate, physicianName, apptClinicDate, apptPhysicianName;
		protected string InPatientAdmitDate, InPatientRoomNumber, InPatientAdmitReason;
		//		protected string verticalBarCodeDiv = "";


		protected Repeater hpi;
		protected Label preRPNomo, preXRTNomo, preBrachyNomo;
		protected HtmlImage HpiSpacer;


		protected Repeater Cytologies, EarlyComplications, LateComplications, IntravesicalTx, SystemicTx, Endoscopies;
		protected System.Web.UI.HtmlControls.HtmlTableRow LateComplicationsUreteroentericRow, LateComplicationsHerniaRow, LateComplicationsStomaRow;
		protected Label blankReferrringMD;


		protected Repeater familyHistory, complications;




		protected System.Web.UI.HtmlControls.HtmlInputCheckBox NED, Localized, RisingPSA_NonCastrate, ClinMetsNonCastrate, RisingPSA_Castrate, ClinMetsCastrate;



		protected Label socHxOccupation, socHxMaritalStatus, socHxChildren, socHxTobaccoPacksPerDay, socHxTobaccoYears, socHxTobaccoQuitYear, socHxCarcinogen, socHxAlcohol, socHxOther, socHxTobaccoType;
		protected HtmlInputCheckBox  socHxTobaccoQuit;


		protected HtmlInputCheckBox  famHxProstateCancerNo, famHxProstateCancerYes, socHxTobaccoPacksPerDayCheckBox, socHxTobaccoQuitYearCheckbox, LateComplicationsCheckbox;

		protected Literal lastPageStyleMod;  // change div style to add a page break between forms during a batch print

		protected HtmlContainerControl LastPageInForm;

		protected System.Web.UI.HtmlControls.HtmlTable BlankFamilyHistoryTable;


		protected HtmlInputText potLv3Textbox, potLv2Textbox, potLv1Textbox, ContLv2Textbox, ContLv1Textbox;

		


		protected Label	postRP7yrNomo,PreTxPot, LastPot, SexualQOL;


		protected Label ShortSexualQOLTotal, ShortSexualQOLQ4, ShortSexualQOLQ5, ShortUrinaryQOLTotal, ShortUrinaryQOLQ1, ShortUrinaryQOLQ2, ShortUrinaryQOLQ3, LastUrinaryQOLScores, LastSexualQOLScores;
	

		protected Repeater LabTestsTrendView, LabTestsTrendViewDates;
		protected HtmlTableRow LabTestsTrendViewBlankTableRow, LabTestsTrendViewPopTableRow, PopulatedLabTestsTableRow;


		protected Label PhysicianSignatureLabel;

		protected string BarCodeMRN, BarCodeDate, BarCodeAcctType, BarCodeDivCssClass;


		protected bool viagraShown = false;
		protected bool IsEmbeddedForm = false;

        protected BasePaperFormControl HomeMedicationsListControl = null;
        protected PlaceHolder HomeMedicationsListHolder;

        protected HtmlContainerControl LabTestBlankRows;


        protected Repeater Hypogonadism;
        protected Literal HypogonadismOptionalStyles;


        /// <summary>
        /// Returns a list of page indexes (0 based) to be displayed via query string
        /// </summary>
        public int[] DisplayPageIndexes
        {
            get
            {
                string pages = Request.QueryString["pages"];
                if (!string.IsNullOrEmpty(pages))
                {
                    var pageNums = from pNum in pages.Split(",".ToCharArray(), StringSplitOptions.RemoveEmptyEntries)
                                   let pNumTrim = pNum.Trim()
                                   where PageUtil.IsInteger(pNumTrim)
                                   select int.Parse(pNumTrim) - 1;
                    return pageNums.ToArray();
                }
                return new int[0];
            }
        }

        /// <summary>
        /// Returns a list of page numbers (1 based) to be displayed via query string
        /// </summary>
        public int[] DisplayPageNumbers
        {
            get
            {
                var pageIndexes = DisplayPageIndexes;
                int[] pageNumbers = new int[pageIndexes.Length];
                for (int i = 0; i < pageIndexes.Length; i++)
                    pageNumbers[i] = pageIndexes[i] + 1;
                return pageNumbers;
            }
        }

		override protected void Page_Load(object sender, EventArgs e)
		{

			PopulatePaperFormHeaders();


		}


		public string FormName
		{
			get 
			{
				return _formName;
			}

			set
			{
				_formName = value;
			}
		}

		public string FormTitle
		{
			get 
			{
				return _formTitle;
			}

			set
			{
				_formTitle = value;
			}
		}

		public int BatchPatientId
		{
			get 
			{
				return _batchPatientId;
			}

			set
			{
				_batchPatientId = value;
			}
		}

		public int FormAppointmentId
		{
			get 
			{
				return _formAppointmentId;
			}

			set
			{
				_formAppointmentId = value;
			}
		}

		public int FormInPatientId
		{
			get 
			{
				return _formInPatientId;
			}

			set
			{
				_formInPatientId = value;
			}
		}

		public bool ApptScheduled
		{
			get 
			{
				return _apptScheduled;
			}
		}

		
		override protected void OnInit(System.EventArgs e)  
		{

			if (LastPageInForm != null && IsEmbeddedForm == true)
			{
				if (IsOnePageForm == true)
				{
					LastPageInForm.Attributes.Add("style", "page-break-after: always;");
				}
				else
				{
					LastPageInForm.Attributes.Add("style", "page-break-before:always; page-break-after: always;");
				}

			}


			if (Request["batchPrint"] != null && Request["batchPrint"] == "true")
			{
				//				lastPageStyleMod.Text = " page-break-after: always;";
				if (LastPageInForm != null)
				{
                    LastPageInForm.Attributes.Add("style", "page-break-after: always;");


/*					if (IsOnePageForm == false)
					{
						LastPageInForm.Attributes.Add("style", "page-break-before:always; page-break-after: always;");
					}
					else
					{
						LastPageInForm.Attributes.Add("style", "page-break-after: always;");
					}
*/
				}
				if (_batchPatientId != 0)
				{
					patientID = (int)_batchPatientId;
				}
			}
			else if (Session[SessionKey.PatientId] == null) 
			{
				//should not be hardcoded to any value;
				patientID = 0;
				//				_apptScheduled = false;
			}
			else if (Session[SessionKey.FormStyle] != null && Session[SessionKey.FormStyle].ToString() == "blank") 
			{
				patientID = 0;
				//				_apptScheduled = false;
			}
			else 
			{
				if (Session[SessionKey.PatientId] != null && Session[SessionKey.PatientId].ToString().Length > 0)
				{
					patientID = (int)Session[SessionKey.PatientId];
				}
				else
				{
					patientID = 0;
				}
			}
			this.SetFormInfo();


			institutionShortName = CaisisConfiguration.GetWebConfigValue("institutionShortName");
            institutionName = CaisisConfiguration.GetWebConfigValue("institutionName");

			base.OnInit(e);
		}



        
		virtual protected void SetFormInfo()  
		{
		}


		protected void PopulatePaperFormHeaders()
		{
			if (patientID != 0)
			{
				patientMRNLabel = "MRN:";
				patientNameLabel = "Name:";
				patientAddressLabel = "Address:";


				// patient identification------------------------------------------------------
				PatientDa piDa = new PatientDa();
				DataSet piDs = piDa.FormGetPatientsIdentification(this.patientID, this._formName, "Dynamic");

				if (!piDs.Tables[0].Rows.Count.Equals(0))
				{
					patientFirstName = piDs.Tables[0].Rows[0]["ptFirstName"].ToString();
//					patientMiddleName = piDs.Tables[0].Rows[0]["ptMiddleName"].ToString();
					patientLastName = piDs.Tables[0].Rows[0]["ptLastName"].ToString();
					patientMRN = piDs.Tables[0].Rows[0]["ptMrn"].ToString();
					patientDOB = piDs.Tables[0].Rows[0]["ptBirthDateText"].ToString();
					if (patientDOB != null && patientDOB != "")
					{
						patientDOB = "DOB:&nbsp;&nbsp;" + patientDOB;
					}
					patientAddress1 = piDs.Tables[0].Rows[0]["PtAddress1"].ToString();
					if (patientAddress1 != null && patientAddress1 != "")
					{
						patientAddress1 = patientAddress1 + "<br>";
					}
					patientAddress2 = piDs.Tables[0].Rows[0]["PtAddress2"].ToString();
					if (patientAddress2 != null && patientAddress2 != "")
					{
						patientAddress2 = patientAddress2 + "<br>";
					}
					patientCity = piDs.Tables[0].Rows[0]["PtCity"].ToString();
					if (patientCity != null && patientCity != "")
					{
						patientCity = patientCity + ", ";
					}
					patientState = piDs.Tables[0].Rows[0]["PtState"].ToString();
					patientPostalCode = piDs.Tables[0].Rows[0]["PtPostalCode"].ToString();


					if (patientMRN != null && patientMRN.Length > 0)
					{
						BarCodeMRN = "*MRN" + patientMRN + "*";
					}

				}

				// end patient identification---------------------------------------------------





				// Appointment information ---------------------------------------------------

				if (Session[SessionKey.CurrentClinicDate] != null && Session[SessionKey.CurrentClinicDate].ToString().Length > 0)
				{
					currentClinicDate = Session[SessionKey.CurrentClinicDate].ToString();
				}
				else
				{
					// default clinic date to today
					currentClinicDate = System.DateTime.Now.Date.ToShortDateString();
					Session[SessionKey.CurrentClinicDate] = System.DateTime.Now.Date.ToShortDateString();
				}


				if (Session[SessionKey.CurrentListType] != null && Session[SessionKey.CurrentListType].ToString() == "Clinic")
				{
					physicianName = Session[SessionKey.CurrentListCrit].ToString();
				}
				else
				{
					physicianName = "";
				}


				PatientDa apptDa = new PatientDa();

				DataSet apptDs = apptDa.FormGetPatientAppointments(this.patientID, currentClinicDate, physicianName);
				if (apptDs.Tables.Count > 0 && !apptDs.Tables[0].Rows.Count.Equals(0))
				{
                    apptClinicDate = Convert.ToDateTime(apptDs.Tables[0].Rows[0]["apptClinicDate"]).ToShortDateString();
                    apptPhysicianName = apptDs.Tables[0].Rows[0]["apptPhysician"].ToString();
				}				
				else
				{
					_apptScheduled = false;
                    apptClinicDate = DateTime.Now.ToShortDateString();
				}

				if (apptClinicDate != null && apptClinicDate.Length > 0)
				{
					BarCodeDate = "*" + apptClinicDate + "*";
				}



				
				// End appointment information ---------------------------------------------------


				BarCodeAcctType = "*ACCTOUTPATIENT*";




			}
			else if (_formAppointmentId > 0)
			{
				AppointmentDa piDa = new AppointmentDa();
				DataSet piDs = piDa.GetAppointmentsRecord(_formAppointmentId);

				if (!piDs.Tables[0].Rows.Count.Equals(0))
				{

					patientMRNLabel = "MRN:";
					patientNameLabel = "Name:";
					patientAddressLabel = "&nbsp;";


					patientFirstName = piDs.Tables[0].Rows[0]["ApptFirstName"].ToString();
					patientLastName = piDs.Tables[0].Rows[0]["ApptLastName"].ToString();
					patientMRN = piDs.Tables[0].Rows[0]["ApptMrn"].ToString();

					if (piDs.Tables[0].Rows[0]["ApptBirthDate"] != DBNull.Value)
					{
						patientDOB = Convert.ToDateTime(piDs.Tables[0].Rows[0]["ApptBirthDate"]).ToShortDateString();
						if (patientDOB != null && patientDOB != "")
						{
							patientDOB = "DOB:&nbsp;&nbsp;" + patientDOB;
						}
					}

					if (!piDs.Tables[0].Rows.Count.Equals(0))
					{
                        apptClinicDate = Convert.ToDateTime(piDs.Tables[0].Rows[0]["apptClinicDate"]).ToShortDateString();
						apptPhysicianName = piDs.Tables[0].Rows[0]["apptPhysician"].ToString();
					}				
					else
					{
						_apptScheduled = false;
				        apptClinicDate = DateTime.Now.ToShortDateString();
					}





					if (patientMRN != null && patientMRN.Length > 0)
					{
						BarCodeMRN = "*MRN" + patientMRN + "*";
					}

				}

			}
			else if (_formInPatientId > 0)
			{
				InPatientDa piDa = new InPatientDa();
				DataSet piDs = piDa.GetInPatientsRecord(_formInPatientId);

				if (!piDs.Tables[0].Rows.Count.Equals(0))
				{

					patientMRNLabel = "MRN:";
					patientNameLabel = "Name:";
					patientAddressLabel = "&nbsp;";


					patientFirstName = piDs.Tables[0].Rows[0]["InPtFirstName"].ToString();
					patientLastName = piDs.Tables[0].Rows[0]["InPtLastName"].ToString();
					patientMRN = piDs.Tables[0].Rows[0]["InPtMrn"].ToString();
					patientDOB = Convert.ToDateTime(piDs.Tables[0].Rows[0]["InPtBirthDate"]).ToShortDateString();
					if (patientDOB != null && patientDOB != "")
					{
						patientDOB = "DOB:&nbsp;&nbsp;" + patientDOB;
					}

                    apptClinicDate = DateTime.Now.ToShortDateString();
					
					if (patientMRN != null && patientMRN.Length > 0)
					{
						BarCodeMRN = "*MRN" + patientMRN + "*";
					}

				}

			}
				// hide things that shouldn't appear if the form is blank
			else
			{
				patientMRNLabel = "&nbsp;";
				patientNameLabel = "&nbsp;";
                patientAddressLabel = "&nbsp;";
                patientFirstName = "";
                patientLastName = "";
			}




			// show barcodes for Win IE only
			if (Request.Browser.Platform.ToUpper().StartsWith("WIN") && Request.Browser.Type.ToUpper().StartsWith("IE"))
			{
				BarCodeDivCssClass = "VerticalBarCodeDiv";
			}
			else
			{
				BarCodeDivCssClass = "NoVerticalBarCodeDiv";
			}
		}

		
		
		override protected void BuildReferringMD()
		{
			if (patientID != 0)
			{

				PatientPhysicianDa rmdDa = new PatientPhysicianDa();
				DataSet rmdDs = rmdDa.FormGetReferringMDs(this.patientID, this._formName, "Dynamic");
				if (rmdDs.Tables.Count > 0 && !rmdDs.Tables[0].Rows.Count.Equals(0))
				{
					ReferringMD.DataSource = rmdDs.Tables[0].DefaultView;
					ReferringMD.DataBind();
					blankReferrringMD.Visible = false;
				}
				else
				{
                    blankReferrringMD.Text = "(" + CaisisConfiguration.GetWebConfigValue("institutionShortName") + ")<img src=\"../../images/shim.gif\" border=\"0\" width=\"200\" height=\"1\">Non-" + CaisisConfiguration.GetWebConfigValue("institutionShortName") + ": ";
				}
			}
			else
			{
                blankReferrringMD.Text = "(" + CaisisConfiguration.GetWebConfigValue("institutionShortName") + ")<img src=\"../../images/shim.gif\" border=\"0\" width=\"200\" height=\"1\">Non-" + CaisisConfiguration.GetWebConfigValue("institutionShortName") + ": ";
			}
		}

		
		
		// complex table version
		protected virtual void BuildMedications(int minNumMedRowsToShow, int minNumBlankMedRows)
		{
			if (patientID != 0)
			{

				// Medications
				string stopDate = System.DateTime.Now.ToShortDateString();

				if (Session[SessionKey.CurrentListType] != null && Session[SessionKey.CurrentListType].ToString() == "Clinic" && Session[SessionKey.CurrentClinicDate] != null && Session[SessionKey.CurrentClinicDate].ToString().Length > 0)
				{
					stopDate = Session[SessionKey.CurrentClinicDate].ToString();
				}


				MedicationDa medDa = new MedicationDa();

				DataSet medDs = medDa.FormGetRecords(this.patientID, this._formName, "Dynamic", stopDate);

				// set the number of blank rows that are added to the medications section

				if (medDs.Tables.Count > 0 && medDs.Tables[0].Rows.Count > 0)
				{
					int numBlankMedRows = minNumMedRowsToShow - medDs.Tables[0].Rows.Count;

					// be sure you have at least the number of blank rows specified earlier
					if (numBlankMedRows < minNumBlankMedRows)
					{
						numBlankMedRows = minNumBlankMedRows;
					}

					// add the blank rows
					for (int i=0; i<numBlankMedRows; i++)
					{
						DataRow blankMedsRow;
						blankMedsRow = medDs.Tables[0].NewRow();
						blankMedsRow["Medication"] = "&nbsp;";
						blankMedsRow["MedDose"] = "&nbsp;";
						blankMedsRow["MedSchedule"] = "&nbsp;";
                        blankMedsRow["MedDateText"] = "&nbsp;";
                        blankMedsRow["MedStopDateText"] = "&nbsp;";
                        blankMedsRow["MedIndication"] = "&nbsp;";
                        blankMedsRow["MedRoute"] = "&nbsp;";

						medDs.Tables[0].Rows.Add(blankMedsRow);
					}

					medications.DataSource = medDs.Tables[0].DefaultView;
				}
				else
				{
					medications.DataSource = BlankMedications(minNumMedRowsToShow).DefaultView;
				}

			}
			else
			{
				medications.DataSource = BlankMedications(minNumMedRowsToShow).DefaultView;

			}
			medications.DataBind();
		}


		protected DataTable BlankMedications(int minNumMedRowsToShow)
		{
			DataTable blankMedDt = new DataTable();
			blankMedDt.Columns.Add("Medication");
			blankMedDt.Columns.Add("MedDose");
			blankMedDt.Columns.Add("MedSchedule");
			blankMedDt.Columns.Add("MedUnits");
            blankMedDt.Columns.Add("MedDateText");
            blankMedDt.Columns.Add("MedStopDateText");
            blankMedDt.Columns.Add("MedIndication");
            blankMedDt.Columns.Add("MedRoute");
			// add the blank rows
			for (int i=0; i<minNumMedRowsToShow; i++)
			{
				DataRow blankMedsRow;
				blankMedsRow = blankMedDt.NewRow();
				blankMedsRow["Medication"] = "&nbsp;";
				blankMedsRow["MedDose"] = "&nbsp;";
				blankMedsRow["MedSchedule"] = "&nbsp;";
                blankMedsRow["MedDateText"] = "&nbsp;";
                blankMedsRow["MedStopDateText"] = "&nbsp;";
                blankMedsRow["MedIndication"] = "&nbsp;";
                blankMedsRow["MedRoute"] = "&nbsp;";
				blankMedDt.Rows.Add(blankMedsRow);
			}

			return blankMedDt;
		}



		// simple version
		protected virtual void BuildMedications()
		{
			if (patientID != 0)
			{

				BuildMedications(this.patientID, this._formName, "Dynamic");

			}
		}


		// simple version
		protected void BuildAllergies()
		{

			if (patientID != 0)
			{
				BuildAllergies(this.patientID, this._formName, "Dynamic");
			}

		}




		// complex table version
		protected void BuildAllergies(int MinNumAllergyRowsToShow, int minNumBlankAllergyRows)
		{
			if (patientID != 0)
			{

				AllergyDa aDa = new AllergyDa();
				DataSet ds = aDa.FormGetRecords(this.patientID, this._formName, "Dynamic");

				if (ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
				{
					int numBlankAllergyRows = MinNumAllergyRowsToShow - ds.Tables[0].Rows.Count;

					// be sure you have at least the number of blank rows specified earlier
					if (numBlankAllergyRows < minNumBlankAllergyRows)
					{
						numBlankAllergyRows = minNumBlankAllergyRows;
					}

					// add the blank rows
					for (int i=0; i<numBlankAllergyRows; i++)
					{
						DataRow blankAllergyRow;
						blankAllergyRow = ds.Tables[0].NewRow();
						blankAllergyRow["Allergen"] = "&nbsp;";
						blankAllergyRow["AllergyResponse"] = "&nbsp;";
						ds.Tables[0].Rows.Add(blankAllergyRow);
					}

					allergies.DataSource = ds.Tables[0].DefaultView;
				}
				else
				{
					allergies.DataSource = BlankAllergies(MinNumAllergyRowsToShow).DefaultView;
				}
			}
			else
			{

				allergies.DataSource = BlankAllergies(MinNumAllergyRowsToShow).DefaultView;

			}

			allergies.DataBind();

		}


		protected DataTable BlankAllergies(int MinNumAllergyRowsToShow)
		{
	
			DataTable BlankAllergyTable = new DataTable();
			BlankAllergyTable.Columns.Add("Allergen");
			BlankAllergyTable.Columns.Add("AllergyResponse");

			for (int i=0; i<MinNumAllergyRowsToShow; i++)
			{
				DataRow blankAllergyRow;
				blankAllergyRow = BlankAllergyTable.NewRow();
				blankAllergyRow["Allergen"] = "&nbsp;";
				blankAllergyRow["AllergyResponse"] = "&nbsp;";
				BlankAllergyTable.Rows.Add(blankAllergyRow);
			}

			return BlankAllergyTable;


		}



		protected virtual void BuildComorbidities()
		{
			if (patientID != 0)
			{
				BuildComorbidities(this.patientID, this.FormName, "Dynamic");
			}
		}


		protected virtual void BuildFamilyHistory()
		{
			if (patientID != 0)
			{

				FamilyMemberDa fDa = new FamilyMemberDa();
				DataSet familyHistoryDs = fDa.FormGetRecords(this.patientID, this._formName, "Dynamic");


				if (familyHistoryDs.Tables[0].Rows.Count == 0)
				{
					DataRow blankFamHistoryRow;
					blankFamHistoryRow = familyHistoryDs.Tables[0].NewRow();
					blankFamHistoryRow["FamMemRelation"] = "<br><br><img src=\"../../images/shim.gif\" border=\"0\" width=\"12\" height=\"1\">- Cancer:<br><br><br><br><br><img src=\"../../images/shim.gif\" border=\"0\" width=\"12\" height=\"1\">- Other:";
					familyHistoryDs.Tables[0].Rows.Add(blankFamHistoryRow);
				}


				familyHistory.DataSource = familyHistoryDs.Tables[0].DefaultView;
				familyHistory.DataBind();

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
		}


		// simple repeater version
		protected virtual void BuildLabTests()
		{
			if (patientID != 0)
			{
				BuildLabTests(this.patientID, this._formName, "Dynamic");
			}

		}


		protected virtual void BuildLabTestsDiagram()
		{
			if (patientID != 0)
			{

				LabTestDa da = new LabTestDa();

//				DataSet ds = da.FormGetRecords(this.patientID, this._formName, "Dynamic");
//              DataSet ds = da.FormGetAllLabs(this.patientID, this._formName, "Dynamic");

                string[] l = {"CREAT"};
                DataSet ds = da.GetLabTestsbyList(this.patientID,l);

				if (ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
				{
					labTests.DataSource = ds.Tables[0].DefaultView;
					labTests.DataBind();
				}
				else
				{
//					PopulatedLabTestsTableRow.Visible = false;
				}
			}
			else
			{
//				PopulatedLabTestsTableRow.Visible = false;
			}

		}


        protected virtual void BuildLabTestsKidney(DateTime NephrectomyDate)
        {
            if (patientID != 0)
            {


                LabTestDa da = new LabTestDa();

                string[] l = { "CREAT" };
                DataSet ds = da.GetLabTestsbyList(this.patientID, l);

                if (ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
                {
                    DataTable dt = ds.Tables[0];

                    //                   dt.Columns.Add("LastBeforeNeph", typeof(Boolean));

                    DataColumn LastBeforeNeph = new DataColumn();
                    LastBeforeNeph.ColumnName = "LastBeforeNeph";
                    LastBeforeNeph.DataType = System.Type.GetType("System.Boolean");
                    LastBeforeNeph.DefaultValue = false;
                    dt.Columns.Add(LastBeforeNeph);

                    // highlight pre-op creat
                    if (NephrectomyDate != null && NephrectomyDate != DateTime.MinValue)
                    {
                        for (int i = 0; i < dt.Rows.Count; i++)
                        {
                            if (dt.Rows[i][BOL.LabTest.LabDate] != null && dt.Rows[i][BOL.LabTest.LabDate].ToString().Length > 0 && (DateTime)dt.Rows[i][BOL.LabTest.LabDate] <= NephrectomyDate)
                            {
                                if ((i == (dt.Rows.Count - 1)) || (DateTime)dt.Rows[i + 1][BOL.LabTest.LabDate] > NephrectomyDate || (DateTime)dt.Rows[i][BOL.LabTest.LabDate] == NephrectomyDate)
                                {
                                    dt.Rows[i]["LastBeforeNeph"] = true;

                                    //DataRow moveRow = dt.Rows[i];
                                    //DataRow newRow = dt.NewRow();
                                    //newRow.ItemArray = moveRow.ItemArray;
                                    //dt.Rows.Remove(moveRow);
                                    //dt.Rows.InsertAt(newRow, 0);
                                    //break;
                                }
                            }
                        }
                    }





                    DataView labDv = new DataView(dt);
                    labDv.RowFilter = "(" + BOL.LabTest.LabDate + " > #" + DateTime.Today.AddYears(-1) + "# AND " + BOL.LabTest.LabDate + " >= #" + NephrectomyDate.ToShortDateString() + "#) OR LastBeforeNeph = true";

                    if (labDv.Count > 0)
                    {

                        DataView labRptDv = KidneyLabsWithGFR(this.patientID, labDv);

                        labTests.DataSource = labRptDv;
                        labTests.DataBind();
                        LabTestBlankRows.Visible = false;
                    }

                }
            }



        }






		// complex table version
		protected virtual void BuildLabTests(int minNumLabTestRowsToShow, int minNumBlankLabTestRows)
		{
			if (patientID != 0)
			{

				//Lab Tests
				LabTestDa da = new LabTestDa();

				DataSet labTestsDs = da.FormGetRecords(this.patientID, this._formName, "Dynamic");


				if (labTestsDs.Tables.Count > 0)
				{
					int numBlankLabTestRows = minNumLabTestRowsToShow - labTestsDs.Tables[0].Rows.Count;

					if (numBlankLabTestRows < minNumBlankLabTestRows)
					{
						numBlankLabTestRows = minNumBlankLabTestRows;
					}

					for (int i=0; i<numBlankLabTestRows; i++)
					{
						DataRow blankLabTestsRow;
						blankLabTestsRow = labTestsDs.Tables[0].NewRow();
						blankLabTestsRow["LabDateText"] = "/&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;/";
						blankLabTestsRow["LabTest"] = "&nbsp;";
						blankLabTestsRow["LabResult"] = "&nbsp;";
						blankLabTestsRow["LabQuality"] = "&nbsp;";
						labTestsDs.Tables[0].Rows.Add(blankLabTestsRow);
					}
					labTests.DataSource = labTestsDs.Tables[0].DefaultView;
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






		protected virtual void BuildLabTestsTrendView(int minNumLabTestRowsToShow, int minNumBlankLabTestRows, int NumMonthsToShow, string LabsToShow, int NumColumnsToShow)
		{
			if (patientID != 0)
			{

				//Lab Tests
				LabTestDa da = new LabTestDa();
				DataSet labTestsDs = da.FormGetRecords(this.patientID, this._formName, "Dynamic", "CrossTab", NumMonthsToShow, LabsToShow, NumColumnsToShow);


				if (labTestsDs.Tables.Count > 0 && labTestsDs.Tables[0].Rows.Count > 0)
				{
					int NumberOfCols = labTestsDs.Tables[0].Columns.Count;


					// Build a table that will contain the dates of the labs
					DataTable dt = new DataTable("LabDatesTable");
					DataColumn LabDatesColumn;

					LabDatesColumn = new DataColumn();
					LabDatesColumn.ColumnName = "LabDates";
					LabDatesColumn.DataType = System.Type.GetType("System.String");
					dt.Columns.Add(LabDatesColumn);

					for (int i=0; i<(NumberOfCols-1); i++)
					{
						Object[] nextDate = new Object[1] {labTestsDs.Tables[0].Columns[i+1].ColumnName};
						dt.Rows.Add(nextDate);
					}




					// if there are less cols than available to show, add appropriate #
					if ((NumberOfCols - 1) < NumColumnsToShow)
					{
						int NumColumnsToAdd = NumColumnsToShow - (NumberOfCols - 1);


						for (int i=0; i<NumColumnsToAdd; i++)
						{
							DataColumn BlankLabColumn;
							BlankLabColumn = new DataColumn();
							BlankLabColumn.DataType = System.Type.GetType("System.String");
							labTestsDs.Tables[0].Columns.Add(BlankLabColumn);

							Object[] blankDate = new Object[1] {"Date:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"};
							dt.Rows.Add(blankDate);


						}
					}


					// add rows if space available
					int numBlankLabTestRows = minNumLabTestRowsToShow - labTestsDs.Tables[0].Rows.Count;

					if (numBlankLabTestRows < minNumBlankLabTestRows)
					{
						numBlankLabTestRows = minNumBlankLabTestRows;
					}

					for (int i=0; i<numBlankLabTestRows; i++)
					{
						DataRow blankLabTestsRow;
						blankLabTestsRow = labTestsDs.Tables[0].NewRow();
						labTestsDs.Tables[0].Rows.Add(blankLabTestsRow);
					}




					// fill repeaters
					LabTestsTrendViewDates.DataSource = dt.DefaultView;
					LabTestsTrendViewDates.DataBind();
	
					LabTestsTrendView.DataSource = labTestsDs.Tables[0].DefaultView;
					LabTestsTrendView.DataBind();

					LabTestsTrendViewBlankTableRow.Visible = false;



				}
				else
				{
					LabTestsTrendViewPopTableRow.Visible =  false;

				}



			}
			else
			{
				LabTestsTrendViewPopTableRow.Visible =  false;

			}
		}


        protected virtual DataTable BlankLabTests(int minNumLabTestRowsToShow)
		{

			DataTable BlankLabTestsTable = new DataTable();
			BlankLabTestsTable.Columns.Add("LabDateText");
			BlankLabTestsTable.Columns.Add("LabTest");
			BlankLabTestsTable.Columns.Add("LabResult");
			BlankLabTestsTable.Columns.Add("LabQuality");

			for (int i=0; i<minNumLabTestRowsToShow; i++)
			{
				DataRow blankLabTestsRow;
				blankLabTestsRow = BlankLabTestsTable.NewRow();
				blankLabTestsRow["LabDateText"] = "/&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;/";
				blankLabTestsRow["LabTest"] = "&nbsp;";
				blankLabTestsRow["LabResult"] = "&nbsp;";
				blankLabTestsRow["LabQuality"] = "&nbsp;";
				BlankLabTestsTable.Rows.Add(blankLabTestsRow);
			}

			return BlankLabTestsTable;

		}


		protected virtual void BuildImages(int MinNumImageRowsToShow, int minNumBlankImageRows)
		{

			if (patientID != 0)
			{


				DiagnosticDa imagesDa = new DiagnosticDa();
				DataSet imagesDs = imagesDa.FormGetDxImages(this.patientID, this._formName, "Dynamic");

				if (imagesDs.Tables.Count > 0)
				{
					int numBlankImageRows = MinNumImageRowsToShow - imagesDs.Tables[0].Rows.Count;

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
					for (int i=0; i<numBlankImageRows; i++)
					{
						DataRow blankImageRow;
						blankImageRow = imagesDs.Tables[0].NewRow();
						blankImageRow["DxDateText"] = "/&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;/";
						blankImageRow["DxType"] = "";
						blankImageRow["DxResult"] = "";
						blankImageRow["DxNotes"] = "";
						blankImageRow["DxTarget"] = "";
						imagesDs.Tables[0].Rows.Add(blankImageRow);
					}




					images.DataSource = imagesDs.Tables[0].DefaultView;
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



		protected DataTable BlankImages(int MinNumImageRowsToShow)
		{

			DataTable BlankImageTable = new DataTable();
			BlankImageTable.Columns.Add("DxDateText");
			BlankImageTable.Columns.Add("DxType");
			BlankImageTable.Columns.Add("DxResult");
			BlankImageTable.Columns.Add("DxNotes");
            BlankImageTable.Columns.Add("DxTarget");
            BlankImageTable.Columns.Add("DiagnosticId");
            BlankImageTable.Columns.Add("DxTotalNumTumors");
            
			for (int i=0; i<MinNumImageRowsToShow; i++)
			{
				DataRow blankImageRow;
				blankImageRow = BlankImageTable.NewRow();
				blankImageRow["DxDateText"] = "/&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;/";
				blankImageRow["DxType"] = "";
				blankImageRow["DxResult"] = "";
				blankImageRow["DxNotes"] = "";
				blankImageRow["DxTarget"] = "";
				BlankImageTable.Rows.Add(blankImageRow);
			}

			return BlankImageTable;

		}



		protected void BuildHpiProtocols()
		{
			if (patientID != 0)
			{
				BuildHpiProtocols(this.patientID, this._formName, "Dynamic");
			}
		}






		protected virtual void BuildCurrentDiseaseState()
		{
			string lastStatusString = "";

			if (patientID != 0)
			{

				StatusDa sDa = new StatusDa();
				lastStatusString = sDa.FormGetLastStatus(this.patientID, this._formName, "Dynamic");

				if (lastStatusString.Length > 0)
				{
                    if (NED != null && lastStatusString.IndexOf("No Evidence of Disease") > -1)
                    {
                        NED.Checked = true;
                    }
                    if (lastStatusString.IndexOf("Localized") > -1)
					{
						Localized.Checked = true;
					}
					else if (lastStatusString.IndexOf("RisingPSA_NonCastrate") > -1 || lastStatusString.IndexOf("Rising PSA Non-Castrate") > -1)
					{
						RisingPSA_NonCastrate.Checked = true;
					}
					else if (lastStatusString.IndexOf("ClinMetsNonCastrate") > -1 || lastStatusString.IndexOf("Clinical Mets Non-Castrate") > -1)
					{
						ClinMetsNonCastrate.Checked = true;
					}
					else if (lastStatusString.IndexOf("RisingPSA_Castrate") > -1 || lastStatusString.IndexOf("Rising PSA Castrate") > -1)
					{
						RisingPSA_Castrate.Checked = true;
					}
					else if (lastStatusString.IndexOf("ClinMetsCastrate") > -1 || lastStatusString.IndexOf("Clinical Mets Castrate") > -1)
					{
						ClinMetsCastrate.Checked = true;
					}

				}
			}







			/*
						System.DateTime mostRecentDiseaseStateDate = Convert.ToDateTime("01/01/0001");
						string currentDiseaseState = "";
						int numDiseaseStates = 5;
						string[] DiseaseState = new string[5] { "Localized", "RisingPSA_NonCastrate", "ClinMetsNonCastrate", "RisingPSA_Castrate", "ClinMetsCastrate" };


						if (patientID != 0)
						{

							for (int i=0; i<numDiseaseStates; i++)
							{
								SqlCommand com = DataAccessHelper.CreateCommand("spFormGetDiseaseStateRecord");
								DataAccessHelper.AddIntInputParam(com, "patientID", this.patientID);
								DataAccessHelper.AddStringInputParam(com, "Status", DiseaseState[i] );
								DataAccessHelper.AddStringInputParam(com, "formName", "GUFU");
								DataAccessHelper.AddStringInputParam(com, "formType", "dynamic");

								DataSet ds = DataAccessHelper.GetList(com);

								if(ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0 && ds.Tables[0].Rows[0]["Status"] != DBNull.Value && ds.Tables[0].Rows[0]["Status"] != null && ds.Tables[0].Rows[0]["Status"].ToString() != "")
								{
									if(ds.Tables[0].Rows[0]["StatusDate"] != DBNull.Value && ds.Tables[0].Rows[0]["StatusDate"] != null && ds.Tables[0].Rows[0]["StatusDate"].ToString().Length >0 && Convert.ToDateTime(ds.Tables[0].Rows[0]["StatusDate"]) > mostRecentDiseaseStateDate)
									{
										currentDiseaseState = ds.Tables[0].Rows[0]["Status"].ToString();
										mostRecentDiseaseStateDate = Convert.ToDateTime(ds.Tables[0].Rows[0]["StatusDate"]);
									}
								}
							}
							if (currentDiseaseState.Length > 0)
							{
								switch (currentDiseaseState)
								{
									case "Localized":
										Localized.Checked = true;
										break;
									case "RisingPSA_NonCastrate":
										RisingPSA_NonCastrate.Checked = true;
										break;
									case "ClinMetsNonCastrate":
										ClinMetsNonCastrate.Checked = true;
										break;
									case "RisingPSA_Castrate":
										RisingPSA_Castrate.Checked = true;
										break;
									case "ClinMetsCastrate":
										ClinMetsCastrate.Checked = true;
										break;
								}
							}
						}
			*/
		}


		protected virtual string GetLastStatus()
		{
			string returnString = "";

			if (patientID != 0)
			{
				returnString = GetLastStatus(this.patientID, this._formName, "Dynamic");
			}

			return returnString;
		}


		protected virtual void BuildSocialHistory()
		{
			if (patientID != 0)
			{


				SocialHistoryDa socialHistoryDa = new SocialHistoryDa();
				DataSet socialHistoryDs = socialHistoryDa.FormGetRecords(this.patientID, this._formName, "Dynamic");
				if (!socialHistoryDs.Tables.Count.Equals(0) && !socialHistoryDs.Tables[0].Rows.Count.Equals(0))
				{
					socHxOccupation.Text = socialHistoryDs.Tables[0].Rows[0]["SocHxOccupation"].ToString();
					socHxMaritalStatus.Text = socialHistoryDs.Tables[0].Rows[0]["SocHxMaritalStatus"].ToString();
					socHxChildren.Text = socialHistoryDs.Tables[0].Rows[0]["SocHxChildren"].ToString();


					socHxTobaccoType.Text = socialHistoryDs.Tables[0].Rows[0]["SocHxTobaccoType"].ToString();



					if (socialHistoryDs.Tables[0].Rows[0]["SocHxTobaccoPacksPerDay"] != null && socialHistoryDs.Tables[0].Rows[0]["SocHxTobaccoPacksPerDay"].ToString() != "")
					{
						socHxTobaccoPacksPerDay.Text = socialHistoryDs.Tables[0].Rows[0]["SocHxTobaccoPacksPerDay"].ToString();
						socHxTobaccoPacksPerDayCheckBox.Checked = true;
					}
					if (socialHistoryDs.Tables[0].Rows[0]["SocHxTobaccoYears"] != null && socialHistoryDs.Tables[0].Rows[0]["SocHxTobaccoYears"].ToString() != "")
					{
						socHxTobaccoPacksPerDayCheckBox.Checked = true;
						socHxTobaccoYears.Text = socialHistoryDs.Tables[0].Rows[0]["SocHxTobaccoYears"].ToString();
					}
					
					
					
					if (socialHistoryDs.Tables[0].Rows[0]["SocHxTobaccoQuitYear"] != null && socialHistoryDs.Tables[0].Rows[0]["SocHxTobaccoQuitYear"].ToString() != "")
					{
						socHxTobaccoQuitYearCheckbox.Checked = true;
						socHxTobaccoQuitYear.Text = socialHistoryDs.Tables[0].Rows[0]["SocHxTobaccoQuitYear"].ToString();
					}
					socHxCarcinogen.Text = socialHistoryDs.Tables[0].Rows[0]["SocHxCarcinogen"].ToString();
					socHxAlcohol.Text = socialHistoryDs.Tables[0].Rows[0]["SocHxAlcohol"].ToString();


				}
			}
		}



		protected virtual void BuildHpiBiopsies(int hpiBiopsyId)
		{
			if (patientID != 0)
			{
				BuildHpiBiopsies(this.patientID, this._formName, "Dynamic", hpiBiopsyId);
			}
		}





		protected virtual void BuildHPINerveStatus()
		{
			if (patientID != 0)
			{
				ProstatectomyDa pDa = new ProstatectomyDa();
				Hashtable ht = pDa.FormGetNerveStatus(this.patientID, this._formName, "Dynamic");
				if (ht["NVB_Left"] != null && ht["NVB_Left"].ToString() != "")
				{
					NVB_Left.Text = ht["NVB_Left"].ToString() + "<br>";
				}
				if (ht["NVB_Right"] != null && ht["NVB_Right"].ToString() != "")
				{
					NVB_Right.Text = ht["NVB_Right"].ToString();
				}
			}

		}




		protected virtual void BuildPotencyStatusValues()
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



		protected virtual void BuildHpiProstatectomies()
		{
			if (patientID != 0)
			{
				BuildHpiProstatectomies(this.patientID, this._formName, "Dynamic");
			}
		}


        protected virtual void BuildHpiNephrectomies()
        {
            if (patientID != 0)
            {
                BuildHpiNephrectomies(this.patientID);
            }
        }



		protected virtual void BuildCytologies(int MinNumRowsToShow, int minNumBlankRows)
		{

			if (patientID != 0)
			{


				CytologyDa cDa = new CytologyDa();
				DataSet cDs = cDa.FormGetRecords(this.patientID, this._formName, "Dynamic");

				if (cDs.Tables.Count > 0 && cDs.Tables[0].Rows.Count > 0)
				{
					int numBlankRows = MinNumRowsToShow - cDs.Tables[0].Rows.Count;

					// be sure you have at least the number of blank rows specified earlier
					if (numBlankRows < minNumBlankRows)
					{
						numBlankRows = minNumBlankRows;
					}

					// add the blank rows
					for (int i=0; i<numBlankRows; i++)
					{
						DataRow blankRow;
						blankRow = cDs.Tables[0].NewRow();
						cDs.Tables[0].Rows.Add(blankRow);
					}

					Cytologies.DataSource = cDs.Tables[0].DefaultView;
				}
				else
				{
					Cytologies.DataSource = BlankCytologies(MinNumRowsToShow).DefaultView;
				}
			}
			else
			{
				Cytologies.DataSource = BlankCytologies(MinNumRowsToShow).DefaultView;
			}
						
			Cytologies.DataBind();
		}



		protected DataTable BlankCytologies(int MinNumImageRowsToShow)
		{

			DataTable BlankCytologyTable = new DataTable();
			BlankCytologyTable.Columns.Add("PathDateText");
            BlankCytologyTable.Columns.Add("PathSpecimenCollection");
            BlankCytologyTable.Columns.Add("PathResult");
            BlankCytologyTable.Columns.Add("PathHistology");
            BlankCytologyTable.Columns.Add("PathDataSource");

			for (int i=0; i<MinNumImageRowsToShow; i++)
			{
				DataRow BlankCytologyRow;
				BlankCytologyRow = BlankCytologyTable.NewRow();
				BlankCytologyTable.Rows.Add(BlankCytologyRow);
			}

			return BlankCytologyTable;

		}


		protected virtual void BuildShortSexualQOL()
		{
			if (patientID != 0)
			{
				SurveyDa sDa = new SurveyDa();
				//				DataSet sDs = sDa.FormGetRecentSurveyByType(this.patientID, this._formName, "Dynamic", "Short QOL Sexual");
				DataSet sDs = sDa.FormGetRecentSurveyByType(this.patientID, this._formName, "Dynamic", "Short QOL Urinary and Sexual");

				if (!sDs.Tables.Count.Equals(0) && !sDs.Tables[0].Rows.Count.Equals(0))
				{


					string QTotalText = "";
					string Q4Text, Q5Text, Q6Text;

					Q4Text = Q5Text = Q6Text = QTotalText = "";

					if (sDs.Tables[0].Rows[0]["SurveyResult"].ToString().Length > 0)
					{
						//						ShortSexualQOLTotal.Text = "&nbsp;&nbsp;" + sDs.Tables[0].Rows[0]["SurveyResult"].ToString() + "&nbsp;&nbsp;";
						if (sDs.Tables[0].Rows[0]["SurveyDate"] != DBNull.Value && sDs.Tables[0].Rows[0]["SurveyDate"].ToString().Length > 0)
						{
							QTotalText = "&nbsp;&nbsp;on " + sDs.Tables[0].Rows[0]["SurveyDateText"].ToString();
						}
					}
					
					if (sDs.Tables.Count > 1 && sDs.Tables[1].Rows.Count > 0)
					{
						int surveyItemsCount = sDs.Tables[1].Rows.Count;
						int SurveyTotal = 0;
						
						for (int i=0; i<surveyItemsCount; i++)
						{
							if (sDs.Tables[1].Rows[i]["SurveyItem"].ToString().StartsWith("Q4") && sDs.Tables[1].Rows[i]["SurveyItemResult"].ToString().Length > 0)
							{
								//								ShortSexualQOLQ4.Text = "&nbsp;&nbsp;" + sDs.Tables[1].Rows[i]["SurveyItemResult"].ToString() + "&nbsp;&nbsp;";
								Q4Text += "Q4: " + sDs.Tables[1].Rows[i]["SurveyItemResult"].ToString() + "&nbsp;&nbsp;&nbsp;";
							
								
								// Q4 is not to be added - JF - 07/07/2005
/*								try
								{
									SurveyTotal += Convert.ToInt32(sDs.Tables[1].Rows[i]["SurveyItemResult"]);
								}
								catch
								{
								}
*/
							}
							else if (sDs.Tables[1].Rows[i]["SurveyItem"].ToString().StartsWith("Q5") && sDs.Tables[1].Rows[i]["SurveyItemResult"].ToString().Length > 0)
							{
								//								ShortSexualQOLQ5.Text = "&nbsp;&nbsp;" + sDs.Tables[1].Rows[i]["SurveyItemResult"].ToString() + "&nbsp;&nbsp;";
								Q5Text += "Q5: " + sDs.Tables[1].Rows[i]["SurveyItemResult"].ToString() + "&nbsp;&nbsp;&nbsp;";
								try
								{
									SurveyTotal += (int) Convert.ToInt32(sDs.Tables[1].Rows[i]["SurveyItemResult"]);
								}
								catch
								{
								}
							}
							else if (sDs.Tables[1].Rows[i]["SurveyItem"].ToString().StartsWith("Q6") && sDs.Tables[1].Rows[i]["SurveyItemResult"].ToString().Length > 0)
							{
								//								ShortSexualQOLQ5.Text = "&nbsp;&nbsp;" + sDs.Tables[1].Rows[i]["SurveyItemResult"].ToString() + "&nbsp;&nbsp;";
								Q6Text += "Q6: " + sDs.Tables[1].Rows[i]["SurveyItemResult"].ToString() + "&nbsp;&nbsp;&nbsp;";
								try
								{
									SurveyTotal += (int) Convert.ToInt32(sDs.Tables[1].Rows[i]["SurveyItemResult"]);
								}
								catch
								{
								}
							}
						}

						if (SurveyTotal > 0)
						{
							QTotalText = "Total (Q5+Q6): " + SurveyTotal.ToString() + "&nbsp;&nbsp;" + QTotalText;
						}


					}


					if (Q4Text.Length > 0 || Q5Text.Length > 0 || Q6Text.Length > 0 || QTotalText.Length > 0)
					{
						LastSexualQOLScores.Text = "Last QOL:&nbsp;&nbsp;" + Q4Text + Q5Text + Q6Text + QTotalText + "<br/>&nbsp;";
					}

				}
			}
		}




		protected virtual void BuildShortUrinaryQOL()
		{
			if (patientID != 0)
			{
				SurveyDa Da = new SurveyDa();
				//				DataSet Ds = Da.FormGetRecentSurveyByType(this.patientID, this._formName, "Dynamic", "Short QOL Urinary");
				DataSet Ds = Da.FormGetRecentSurveyByType(this.patientID, this._formName, "Dynamic", "Short QOL Urinary and Sexual");

				if (!Ds.Tables.Count.Equals(0) && !Ds.Tables[0].Rows.Count.Equals(0))
				{
					string QTotalText = "";
					string Q1Text, Q2Text, Q3Text;

					Q1Text = Q2Text = Q3Text = QTotalText = "";


					if (Ds.Tables[0].Rows[0]["SurveyResult"].ToString().Length > 0)
					{
						//						ShortUrinaryQOLTotal.Text = "&nbsp;&nbsp;" + Ds.Tables[0].Rows[0]["SurveyResult"].ToString() + "&nbsp;&nbsp;";
						//						QTotalText = "Total: " + Ds.Tables[0].Rows[0]["SurveyResult"].ToString();
						if (Ds.Tables[0].Rows[0]["SurveyDate"] != DBNull.Value && Ds.Tables[0].Rows[0]["SurveyDate"].ToString().Length > 0)
						{
							QTotalText = "&nbsp;&nbsp;on " + Convert.ToDateTime(Ds.Tables[0].Rows[0]["SurveyDate"]).ToShortDateString();
						}

					}
					if (Ds.Tables.Count > 1 && Ds.Tables[1].Rows.Count > 0)
					{
						int surveyItemsCount = Ds.Tables[1].Rows.Count;
						int SurveyTotal = 0;
						


						for (int i=0; i<surveyItemsCount; i++)
						{
							
							if (Ds.Tables[1].Rows[i]["SurveyItem"].ToString().StartsWith("Q1") && Ds.Tables[1].Rows[i]["SurveyItemResult"].ToString().Length > 0)
							{
								//								ShortUrinaryQOLQ1.Text = "&nbsp;&nbsp;" + Ds.Tables[1].Rows[i]["SurveyItemResult"].ToString() + "&nbsp;&nbsp;";
								Q1Text += "Q1: " + Ds.Tables[1].Rows[i]["SurveyItemResult"].ToString() + "&nbsp;&nbsp;&nbsp;";
								try
								{
									SurveyTotal += Convert.ToInt32(Ds.Tables[1].Rows[i]["SurveyItemResult"]);
								}
								catch
								{
								}
							}
							else if (Ds.Tables[1].Rows[i]["SurveyItem"].ToString().StartsWith("Q2") && Ds.Tables[1].Rows[i]["SurveyItemResult"].ToString().Length > 0)
							{
								//								ShortUrinaryQOLQ2.Text = "&nbsp;&nbsp;" + Ds.Tables[1].Rows[i]["SurveyItemResult"].ToString() + "&nbsp;&nbsp;";
								Q2Text += "Q2: " + Ds.Tables[1].Rows[i]["SurveyItemResult"].ToString() + "&nbsp;&nbsp;&nbsp;";
								try
								{
									SurveyTotal += Convert.ToInt32(Ds.Tables[1].Rows[i]["SurveyItemResult"]);
								}
								catch
								{
								}
							}
							else if (Ds.Tables[1].Rows[i]["SurveyItem"].ToString().StartsWith("Q3") && Ds.Tables[1].Rows[i]["SurveyItemResult"].ToString().Length > 0)
							{
								//								ShortUrinaryQOLQ3.Text = "&nbsp;&nbsp;" + Ds.Tables[1].Rows[i]["SurveyItemResult"].ToString() + "&nbsp;&nbsp;";
								Q3Text += "Q3: " + Ds.Tables[1].Rows[i]["SurveyItemResult"].ToString() + "&nbsp;&nbsp;&nbsp;";
								try
								{
									SurveyTotal += Convert.ToInt32(Ds.Tables[1].Rows[i]["SurveyItemResult"]);
								}
								catch
								{
								}
							}


						}

						if (SurveyTotal > 0)
						{
							QTotalText = "Total: " + SurveyTotal.ToString() + "&nbsp;&nbsp;" + QTotalText;
						}

					}


					if (Q1Text.Length > 0 || Q2Text.Length > 0 || Q3Text.Length > 0 || QTotalText.Length > 0)
					{
						LastUrinaryQOLScores.Text = "Last QOL:&nbsp;&nbsp;" + Q1Text + Q2Text + Q3Text + QTotalText + "<br/>&nbsp;";
					}
				}




			}
		}




		protected virtual void BuildXRT(int MinNumRowsToShow, int minNumBlankRows)
		{

			if (patientID != 0)
			{


				RadiationTherapyDa Da = new RadiationTherapyDa();
				DataSet Ds = Da.FormGetRecords(this.patientID, this._formName, "Dynamic");

				if (Ds.Tables.Count > 0)
				{
					int numBlankRows = MinNumRowsToShow - Ds.Tables[0].Rows.Count;

					// be sure you have at least the number of blank rows specified earlier
					if (numBlankRows < minNumBlankRows)
					{
						numBlankRows = minNumBlankRows;
					}

					// add the blank rows
					for (int i=0; i<numBlankRows; i++)
					{
						DataRow blankRow;
						blankRow = Ds.Tables[0].NewRow();
						Ds.Tables[0].Rows.Add(blankRow);
					}

					XRT.DataSource = Ds.Tables[0].DefaultView;
				}
				else
				{
					XRT.DataSource = BlankXRT(MinNumRowsToShow).DefaultView;
				}
			}
			else
			{
				XRT.DataSource = BlankXRT(MinNumRowsToShow).DefaultView;
			}
						
			XRT.DataBind();
		}



		protected DataTable BlankXRT(int MinNumImageRowsToShow)
		{

			DataTable BlankXRTTable = new DataTable();
			BlankXRTTable.Columns.Add("RadTxDateText");
			BlankXRTTable.Columns.Add("RadTxStopDateText");
			BlankXRTTable.Columns.Add("RadTxTarget");
			BlankXRTTable.Columns.Add("RadTxType");
			BlankXRTTable.Columns.Add("RadTxTotalDose");
			BlankXRTTable.Columns.Add("RadTxNotes");

			for (int i=0; i<MinNumImageRowsToShow; i++)
			{
				DataRow BlankXRTRow;
				BlankXRTRow = BlankXRTTable.NewRow();
				BlankXRTTable.Rows.Add(BlankXRTRow);
			}

			return BlankXRTTable;

		}




		protected virtual void BuildEarlyComplications(int MinNumRowsToShow, int minNumBlankRows)
		{

			if (patientID != 0)
			{


				ToxicityDa Da = new ToxicityDa();
				DataSet Ds = Da.FormListToxicities(patientID, this._formName, "Dynamic", "Early");

				if (Ds.Tables.Count > 0)
				{
					int numBlankRows = MinNumRowsToShow - Ds.Tables[0].Rows.Count;

					// be sure you have at least the number of blank rows specified earlier
					if (numBlankRows < minNumBlankRows)
					{
						numBlankRows = minNumBlankRows;
					}

					// add the blank rows
					for (int i=0; i<numBlankRows; i++)
					{
						DataRow blankRow;
						blankRow = Ds.Tables[0].NewRow();
						Ds.Tables[0].Rows.Add(blankRow);
					}

					EarlyComplications.DataSource = Ds.Tables[0].DefaultView;
				}
				else
				{
					EarlyComplications.DataSource = BlankComplications(MinNumRowsToShow).DefaultView;
				}
			}
			else
			{
				EarlyComplications.DataSource = BlankComplications(MinNumRowsToShow).DefaultView;
			}
						
			EarlyComplications.DataBind();
		}


		protected virtual void BuildLateComplications(int MinNumRowsToShow, int minNumBlankRows)
		{

			if (patientID != 0)
			{


				ToxicityDa Da = new ToxicityDa();
				DataSet Ds = Da.FormListToxicities(patientID, this._formName, "Dynamic", "Late");

				if (Ds.Tables.Count > 0)
				{
					int numBlankRows = MinNumRowsToShow - Ds.Tables[0].Rows.Count;

					// be sure you have at least the number of blank rows specified earlier
					if (numBlankRows < minNumBlankRows)
					{
						numBlankRows = minNumBlankRows;
					}

					// add the blank rows
					for (int i=0; i<numBlankRows; i++)
					{
						DataRow blankRow;
						blankRow = Ds.Tables[0].NewRow();
						Ds.Tables[0].Rows.Add(blankRow);
					}

					LateComplications.DataSource = Ds.Tables[0].DefaultView;
					LateComplications.DataBind();

					// hide these table rows
					LateComplicationsStomaRow.Visible = false;
					LateComplicationsUreteroentericRow.Visible = false;
					LateComplicationsHerniaRow.Visible = false;


				}
				else
				{

					//					LateComplications.DataSource = BlankComplications(MinNumRowsToShow).DefaultView;
				}
			}
			else
			{
				//				LateComplications.DataSource = BlankComplications(MinNumRowsToShow).DefaultView;
			}
						

		}


		protected virtual void BuildLateComplications()
		{

			if (patientID != 0)
			{


				ToxicityDa Da = new ToxicityDa();
				DataSet Ds = Da.FormListToxicities(patientID, this._formName, "Dynamic", "Late");

				if (Ds.Tables.Count > 0 && Ds.Tables[0].Rows.Count > 0)
				{
					LateComplicationsCheckbox.Checked = true;
					LateComplications.DataSource = Ds.Tables[0].DefaultView;
					LateComplications.DataBind();

				}

			}

		}


		protected void LateComplicationsItemDataBound(Object Sender, RepeaterItemEventArgs e) 
		{

			if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem) 
			{
				if (((DataRowView) e.Item.DataItem )["ToxName"] != null && ((DataRowView) e.Item.DataItem )["ToxName"].ToString().Length > 0 && ((DataRowView) e.Item.DataItem )["ToxName"].ToString().ToUpper() != "NONE")
				{
					LateComplicationsCheckbox.Checked = true;
				}
			}


		}







		protected DataTable BlankComplications(int MinNumImageRowsToShow)
		{

			DataTable BlankComplicationsTable = new DataTable();
			BlankComplicationsTable.Columns.Add("ToxDateText");
			BlankComplicationsTable.Columns.Add("ToxName");
			BlankComplicationsTable.Columns.Add("ToxRelatedTo");
			BlankComplicationsTable.Columns.Add("ToxDataSource");


			for (int i=0; i<MinNumImageRowsToShow; i++)
			{
				DataRow BlankComplicationsRow;
				BlankComplicationsRow = BlankComplicationsTable.NewRow();
				BlankComplicationsTable.Rows.Add(BlankComplicationsRow);
			}

			return BlankComplicationsTable;

		}



		protected virtual void BuildMedTx(int MinNumRowsToShow, int minNumBlankRows, string MedTxType, Repeater MedTxRepeater)
		{

			if (patientID != 0)
			{
				MedicalTherapyDa Da = new MedicalTherapyDa();
				DataSet Ds = Da.FormGetRecords(patientID, this._formName, "Dynamic", MedTxType);

				if (Ds.Tables.Count > 0)
				{
					int numBlankRows = MinNumRowsToShow - Ds.Tables[0].Rows.Count;

					// be sure you have at least the number of blank rows specified earlier
					if (numBlankRows < minNumBlankRows)
					{
						numBlankRows = minNumBlankRows;
					}

					// add the blank rows
					for (int i=0; i<numBlankRows; i++)
					{
						DataRow blankRow;
						blankRow = Ds.Tables[0].NewRow();
						Ds.Tables[0].Rows.Add(blankRow);
					}

					MedTxRepeater.DataSource = Ds.Tables[0].DefaultView;
				}
				else
				{
					MedTxRepeater.DataSource = BlankMedTx(MinNumRowsToShow).DefaultView;
				}
			}
			else
			{
				MedTxRepeater.DataSource = BlankMedTx(MinNumRowsToShow).DefaultView;
			}
						
			MedTxRepeater.DataBind();
		}



		protected DataTable BlankMedTx(int MinNumImageRowsToShow)
		{

			DataTable BlankMedTxTable = new DataTable();
			BlankMedTxTable.Columns.Add("MedTxDateText");
			BlankMedTxTable.Columns.Add("MedTxStopDateText");
			BlankMedTxTable.Columns.Add("MedTxAgent");
			BlankMedTxTable.Columns.Add("MedTxNotes");

			for (int i=0; i<MinNumImageRowsToShow; i++)
			{
				DataRow BlankMedTxRow;
				BlankMedTxRow = BlankMedTxTable.NewRow();
				BlankMedTxTable.Rows.Add(BlankMedTxRow);
			}

			return BlankMedTxTable;

		}


		protected virtual void BuildEndoscopies(int MinNumRowsToShow, int minNumBlankRows)
		{

			if (patientID != 0)
			{
				EndoscopyDa Da = new EndoscopyDa();
				DataSet Ds = Da.FormGetRecords(patientID, this._formName, "Dynamic");

				if (Ds.Tables.Count > 0)
				{
					int numBlankRows = MinNumRowsToShow - Ds.Tables[0].Rows.Count;

					// be sure you have at least the number of blank rows specified earlier
					if (numBlankRows < minNumBlankRows)
					{
						numBlankRows = minNumBlankRows;
					}

					// add the blank rows
					for (int i=0; i<numBlankRows; i++)
					{
						DataRow blankRow;
						blankRow = Ds.Tables[0].NewRow();
						Ds.Tables[0].Rows.Add(blankRow);
					}

					Endoscopies.DataSource = Ds.Tables[0].DefaultView;
				}
				else
				{
					Endoscopies.DataSource = BlankEndoscopies(MinNumRowsToShow).DefaultView;
				}
			}
			else
			{
				Endoscopies.DataSource = BlankEndoscopies(MinNumRowsToShow).DefaultView;
			}
						
			Endoscopies.DataBind();
		}



		protected DataTable BlankEndoscopies(int MinNumImageRowsToShow)
		{

			DataTable BlankEndoscopiesTable = new DataTable();
            BlankEndoscopiesTable.Columns.Add("ProcDateText");
            BlankEndoscopiesTable.Columns.Add("ProcName");
            BlankEndoscopiesTable.Columns.Add("PathResult");
            BlankEndoscopiesTable.Columns.Add("PathStageT");
            BlankEndoscopiesTable.Columns.Add("PathGrade");
            BlankEndoscopiesTable.Columns.Add("PathHistology");
            BlankEndoscopiesTable.Columns.Add("Pathologist");

			for (int i=0; i<MinNumImageRowsToShow; i++)
			{
				DataRow BlankEndoscopiesRow;
				BlankEndoscopiesRow = BlankEndoscopiesTable.NewRow();
				BlankEndoscopiesTable.Rows.Add(BlankEndoscopiesRow);
			}

			return BlankEndoscopiesTable;

		}



		protected void SetPhysicianSignatureLabel()
		{
			UserDa da = new UserDa();
			SecurityController sc = new SecurityController();
			DataSet ds = da.GetByUserName(sc.GetUserName());

			if (ds.Tables[0].Rows.Count == 1)  
			{

				GroupDa gda = new GroupDa();
				DataSet uds = gda.GetUserGroupsByUserId((int) ds.Tables[0].Rows[0]["UserId"]);

				if (uds.Tables.Count > 0 && uds.Tables[0].Rows.Count > 0)
				{

					// need to make sure user is a physician

					bool isPhysician = false;

					for (int i=0; i<uds.Tables[0].Rows.Count; i++)
					{
						if (uds.Tables[0].Rows[i]["GroupName"].ToString().ToUpper().IndexOf("ATTENDING") > -1)
						{
							isPhysician = true; 
						}

					}

					if (isPhysician)
					{
						PhysicianSignatureLabel.Text += ds.Tables[0].Rows[0]["UserFirstName"].ToString() + " " + ds.Tables[0].Rows[0]["UserLastName"].ToString() + ", MD";			
					}
					else
					{
						PhysicianSignatureLabel.Visible = false;
					}

				}


			}
			else
			{
				PhysicianSignatureLabel.Visible = false;
			}
		}



        protected virtual void CheckSiteOfDisease(DataTable SurveyItemTable, string Site, HtmlImage PresentImage, HtmlImage AbsentImage)
        {
            for (int i = 0; i < SurveyItemTable.Rows.Count; i++)
            {
                if (SurveyItemTable.Rows[i]["SurveyItem"].ToString().ToUpper().Equals(Site.ToUpper()))
                {
                    if (SurveyItemTable.Rows[i]["SurveyItemResult"].ToString().ToUpper().Equals("PRESENT"))
                    {
                        PresentImage.Src = "../../../Images/icon_checkBoxChecked.gif";
                    }
                    else if (AbsentImage != null && SurveyItemTable.Rows[i]["SurveyItemResult"].ToString().ToUpper().Equals("ABSENT"))
                    {
                        AbsentImage.Src = "../../../Images/icon_checkBoxChecked.gif";
                    }
                }
            }
        }


        protected void BuildHypogonadism(int minNumRowsToShow, int minNumBlankRows)
        {
            if (patientID != 0)
            {
                DataTable HypogonadismTable = this.HypogonadismTable();


                // Lab Tests
                LabTestDa lDa = new LabTestDa();
                List<List<string>> HypogonadismLabs = HypogonadismLabKey();
                List<string> HypogonadismLabValues = new List<string>();

                foreach (List<string> l in HypogonadismLabs)
                {
                    HypogonadismLabValues.AddRange(l);
                }

                DataSet lDs = lDa.GetLabTestsbyList(this.patientID, HypogonadismLabValues.ToArray());

                if (lDs != null && lDs.Tables.Count > 0 && lDs.Tables[0].Rows.Count > 0)
                {
                    foreach (DataRow hRow in lDs.Tables[0].Rows)
                    {
                        foreach (List<string> l in HypogonadismLabs)
                        {
                            //                     if (hRow[BOL.LabTest.LabTest_Field].ToString().ToUpper() == l[0].ToUpper())
                            if (l.Contains(hRow[BOL.LabTest.LabTest_Field].ToString().ToUpper()))
                            {
                                HypogonadismTable = AddValueToHypogonadismTable(HypogonadismTable, hRow[BOL.LabTest.LabDateText].ToString(), l[0], hRow[BOL.LabTest.LabResult].ToString());
                                break;
                            }
                        }
                    }
                }


                // Medications
                MedicationDa mDa = new MedicationDa();
                List<string> HypogonadismMedications = HypogonadismMedicationKey();

                DataSet mDs = mDa.FormGetRecords(this.patientID, "", "Dynamic", "");

                if (mDs != null && mDs.Tables.Count > 0 && mDs.Tables[0].Rows.Count > 0)
                {
                    foreach (DataRow mRow in mDs.Tables[0].Rows)
                    {
                        foreach (string m in HypogonadismMedications)
                        {
                            if (mRow[BOL.Medication.Medication_Field].ToString().ToUpper() == m.ToUpper())
                            {
                                string medValue = mRow[BOL.Medication.Medication_Field].ToString();
                                //                                if (mRow[BOL.Medication.MedDose].ToString().Length > 0) medValue += (" (" + mRow[BOL.Medication.MedDose].ToString() + mRow[BOL.Medication.MedUnits].ToString() + ")");
                                HypogonadismTable = AddValueToHypogonadismTable(HypogonadismTable, mRow[BOL.Medication.MedDateText].ToString(), "Medication", medValue);
                                HypogonadismTable = AddValueToHypogonadismTable(HypogonadismTable, mRow[BOL.Medication.MedDateText].ToString(), "MedDose", mRow[BOL.Medication.MedDose].ToString());
                                HypogonadismTable = AddValueToHypogonadismTable(HypogonadismTable, mRow[BOL.Medication.MedDateText].ToString(), "MedUnits", mRow[BOL.Medication.MedUnits].ToString());
                                break;
                            }
                        }
                    }
                }



                if (HypogonadismTable.Rows.Count > 0)
                {
                    foreach (DataRow hRow in HypogonadismTable.Rows)
                    {
                        if (hRow["DateText"].ToString().Length > 0)
                        {
                            DateTime dt;
                            if (DateTime.TryParse(hRow["DateText"].ToString(), out dt))
                            {
                                hRow["Date"] = dt;
                            }

                        }
                    }

                    int maxRowsToShowOnForm = 8;

                    if (HypogonadismTable.Rows.Count > maxRowsToShowOnForm)
                    {
                        int numRecordsToDelete = HypogonadismTable.Rows.Count - maxRowsToShowOnForm;
                        DataView hgv = HypogonadismTable.DefaultView;
                        hgv.Sort = "Date ASC";
                        DataTable hgt = hgv.ToTable();

                        for (int i = 0; i < numRecordsToDelete; i++)
                        {
                            hgt.Rows[0].Delete();
                        }

                        DataView hgv2 = hgt.DefaultView;
                        hgv2.Sort = "Date ASC";
                        FillHypogonadism(hgv2);

                    }
                    else
                    {
                        DataView hv = HypogonadismTable.DefaultView;
                        hv.Sort = "Date ASC";
                        FillHypogonadism(hv);
                    }
                }

            }
        }

        protected void FillHypogonadism(DataView dv)
        {
            Hypogonadism.DataSource = dv;
            Hypogonadism.DataBind();

            //DataView hctCheck = new DataView(dv.ToTable());
            //string hctFilter = "(Len([HCT]) > 0)";
            //hctCheck.RowFilter = hctFilter;
            //if (hctCheck.Count > 0) HypogonadismOptionalStyles.Visible = false;

        }

        protected DataTable AddValueToHypogonadismTable(DataTable HypogonadismTable, string DateText, string ColumnName, string ColumnValue)
        {

            if (HypogonadismTable.Rows.Count > 0)
            {
                bool dateExists = false;
                foreach (DataRow hRow in HypogonadismTable.Rows)
                {
                    if (hRow["DateText"].ToString() == DateText)
                    {
                        if (hRow[ColumnName].ToString().Length > 0)
                        {
                            hRow[ColumnName] += ("<br/>" + ColumnValue);
                        }
                        else { hRow[ColumnName] = ColumnValue; }

                        dateExists = true;
                        break;
                    }
                }

                if (!dateExists)
                {
                    DataRow dr = HypogonadismTable.NewRow();
                    dr[ColumnName] = ColumnValue;
                    dr["DateText"] = DateText;
                    //          dr["Date"] = Date;
                    HypogonadismTable.Rows.Add(dr);
                }

            }
            else
            {
                DataRow dr2 = HypogonadismTable.NewRow();
                dr2[ColumnName] = ColumnValue;
                dr2["DateText"] = DateText;
                //          dr["Date"] = Date;
                HypogonadismTable.Rows.Add(dr2);
            }

            return HypogonadismTable;

        }


        protected DataTable HypogonadismTable()
        {
            DataTable HypogonadismTable = new DataTable();

            DataColumn DateTextCol = new DataColumn();
            DateTextCol.ColumnName = "DateText";
            HypogonadismTable.Columns.Add(DateTextCol);

            DataColumn DateCol = new DataColumn();
            DateCol.ColumnName = "Date";
            DateCol.DataType = System.Type.GetType("System.DateTime");
            HypogonadismTable.Columns.Add(DateCol);

            DataColumn MedicationCol = new DataColumn();
            MedicationCol.ColumnName = "Medication";
            HypogonadismTable.Columns.Add(MedicationCol);

            DataColumn MedDoseCol = new DataColumn();
            MedDoseCol.ColumnName = "MedDose";
            HypogonadismTable.Columns.Add(MedDoseCol);

            DataColumn MedUnitsCol = new DataColumn();
            MedUnitsCol.ColumnName = "MedUnits";
            HypogonadismTable.Columns.Add(MedUnitsCol);

            DataColumn PSACol = new DataColumn();
            PSACol.ColumnName = "PSA";
            HypogonadismTable.Columns.Add(PSACol);

            DataColumn tTCol = new DataColumn();
            tTCol.ColumnName = "tT";
            HypogonadismTable.Columns.Add(tTCol);

            DataColumn fTCol = new DataColumn();
            fTCol.ColumnName = "fT";
            HypogonadismTable.Columns.Add(fTCol);

            DataColumn SHBGCol = new DataColumn();
            SHBGCol.ColumnName = "SHBG";
            HypogonadismTable.Columns.Add(SHBGCol);

            DataColumn E2Col = new DataColumn();
            E2Col.ColumnName = "E2";
            HypogonadismTable.Columns.Add(E2Col);

            DataColumn LHCol = new DataColumn();
            LHCol.ColumnName = "LH";
            HypogonadismTable.Columns.Add(LHCol);

            DataColumn FSHCol = new DataColumn();
            FSHCol.ColumnName = "FSH";
            HypogonadismTable.Columns.Add(FSHCol);


            DataColumn PRLCol = new DataColumn();
            PRLCol.ColumnName = "PRL";
            HypogonadismTable.Columns.Add(PRLCol);


            DataColumn HCTCol = new DataColumn();
            HCTCol.ColumnName = "HCT";
            HypogonadismTable.Columns.Add(HCTCol);

            return HypogonadismTable;
        }


        protected List<List<string>> HypogonadismLabKey()
        {
            // first string in each list has to be the column name in the repeater - jf
            List<string> PSALabValues = new List<string> { "PSA", "Prostate Specific Antigen" };
            List<string> tTLabValues = new List<string> { "tT", "TEST", "True Testosterone" };
            List<string> fTLabValues = new List<string> { "fT", "TESTFR", "Free Testosterone" };
            List<string> SHBGLabValues = new List<string> { "SHBG", "HBG", "Sex Hormone Binding Globulin" };
            List<string> E2LabValues = new List<string> { "E2", "ESTRAD", "Estradiol" };
            List<string> LHLabValues = new List<string> { "LH", "Lutenizing Hormone" };
            List<string> FSHLabValues = new List<string> { "FSH", "Follicle Stimulating Hormone" };
            List<string> PRLLabValues = new List<string> { "PRL", "PROL", "Prolactin" };
            List<string> HCTLabValues = new List<string> { "HCT", "Hematocrit" };


            List<List<string>> HypogonadismLabs = new List<List<string>> { PSALabValues, tTLabValues, fTLabValues, SHBGLabValues, E2LabValues, LHLabValues, FSHLabValues, PRLLabValues, HCTLabValues };

            return HypogonadismLabs;
        }

        protected List<string> HypogonadismMedicationKey()
        {
            List<string> HypogonadismMedications = new List<string> { "AndroGel", "Testim", "Clomid", "Testopel", "Testosterone Inj" };

            return HypogonadismMedications;
        }


        protected void SetRegionalLocation()
        {
            BarCodeAcctType = "*ACCTREGIONALS*";
        }

        protected void LoadHomeMedicationList()
        {
            if (null != HomeMedicationsListHolder)
            {
                HomeMedicationsListControl = (Caisis.UI.Core.Classes.BasePaperFormControl)this.LoadControl("~/Modules/Prostate/PaperForms/GUPatientMedicationSheet.ascx");


                HomeMedicationsListControl.BatchPatientId = this._batchPatientId;
                HomeMedicationsListControl.FormInPatientId = this._formInPatientId;
                HomeMedicationsListControl.FormAppointmentId = this._formAppointmentId;

                HomeMedicationsListHolder.Controls.Add(HomeMedicationsListControl);
            }
        }





        protected void ShowAllergyResponse(Object Sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                Literal AllergyResponseText = (Literal)e.Item.FindControl("AllergyResponseText");
                string a = "";

                if (((DataRowView)e.Item.DataItem)[BOL.Allergy.AllergyResponse].ToString() != null && ((DataRowView)e.Item.DataItem)[BOL.Allergy.AllergyResponse].ToString().ToUpper() == "OTHER" && ((DataRowView)e.Item.DataItem)[BOL.Allergy.AllergyNotes].ToString() != null && ((DataRowView)e.Item.DataItem)[BOL.Allergy.AllergyNotes].ToString().Length > 0)
                {
                    a = ((DataRowView)e.Item.DataItem)[BOL.Allergy.AllergyNotes].ToString();
                }
                else
                {
                    a = ((DataRowView)e.Item.DataItem)[BOL.Allergy.AllergyResponse].ToString();
                }

                if (a.Length > 0) AllergyResponseText.Text = "(" + a + ")";


            }
        }




	}
}
