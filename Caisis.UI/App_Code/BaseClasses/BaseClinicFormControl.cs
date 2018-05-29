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

using System.Collections.Generic;




namespace Caisis.UI.Core.Classes
{
	/// <summary>
	/// Binds values to repeaters or strings diplayed in Caisis paper forms.
	/// </summary>
	public class BaseClinicFormControl : BaseControl
	{

        protected Repeater allergies, medications, labTests, images, comorbidities, MedicalTherapies, XRT, QolTherapy, StatusRpt;
        protected Repeater HpiProstatectomies, hpiProtocols, hpiBiopsies, Biopsies, ReferringMD, SocialHx, FamilyMemHx, HpiNephrectomies;
        protected Repeater PtPhys;
		protected Label LastStatus,  NVB_Right, NVB_Left;
		protected int hpiBiopsyId;
        protected HtmlContainerControl StatusMsg;

		// simple version
		protected void BuildAllergies(int PatientID, string FormName, string FormType)
		{

				AllergyDa aDa = new AllergyDa();
				DataSet aDs = aDa.FormGetRecords(PatientID, FormName, FormType);
				if (aDs.Tables.Count > 0 && aDs.Tables[0].Rows.Count > 0)
				{
					allergies.DataSource = aDs.Tables[0].DefaultView;
					allergies.DataBind();
				}
		}


		protected void BuildMedications(int PatientID, string FormName, string FormType)
		{

				string stopDate = System.DateTime.Now.ToShortDateString();

				if (Session[SessionKey.CurrentListType] != null && Session[SessionKey.CurrentListType].ToString() == "Clinic" && Session[SessionKey.CurrentClinicDate] != null && Session[SessionKey.CurrentClinicDate].ToString().Length > 0)
				{
					stopDate = Session[SessionKey.CurrentClinicDate].ToString();
				}


				MedicationDa medDa = new MedicationDa();
				DataSet medDs = medDa.FormGetRecords(PatientID, FormName, FormType, stopDate);
				
				if (medDs.Tables.Count > 0 && medDs.Tables[0].Rows.Count > 0)
				{
					medications.DataSource = medDs.Tables[0].DefaultView;
					medications.DataBind();
				}


		}

		protected void BuildLabTests(int PatientID, string FormName, string FormType)
		{


				LabTestDa da = new LabTestDa();

				DataSet ds = da.FormGetRecords(PatientID, FormName, FormType);
				if (ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
				{
					labTests.DataSource = ds.Tables[0].DefaultView;
					labTests.DataBind();
				}


		}

		protected void BuildImages(int PatientID, string FormName, string FormType)
		{


			DiagnosticDa imagesDa = new DiagnosticDa();
			DataSet imagesDs = imagesDa.FormGetDxImages(PatientID, FormName, FormType);

			if (imagesDs.Tables.Count > 0 && imagesDs.Tables[0].Rows.Count > 0)
			{
				images.DataSource = imagesDs.Tables[0].DefaultView;
				images.DataBind();
			}


		}


		protected string GetLastStatus(int PatientID, string FormName, string FormType)
		{
			string returnString = "";

			StatusDa sDa = new StatusDa();
			returnString = sDa.FormGetLastStatus(PatientID, FormName, FormType);


			return returnString;
		}


		protected virtual void BuildComorbidities(int PatientID, string FormName, string FormType)
		{

				ComorbidityDa comorbiditiesDa = new ComorbidityDa();
				DataSet comorbiditiesDs = comorbiditiesDa.FormGetRecords(PatientID, FormName, FormType);
				if (comorbiditiesDs.Tables.Count > 0 && comorbiditiesDs.Tables[0].Rows.Count > 0)
				{
					comorbidities.DataSource = comorbiditiesDs.Tables[0].DefaultView;
					comorbidities.DataBind();
				}

		}



		protected virtual void BuildMedTx(int PatientID, string FormName, string FormType, string MedTxType)
		{

				MedicalTherapyDa Da = new MedicalTherapyDa();
				DataSet Ds = new DataSet();

				if (MedTxType.Length > 0)
				{
					Ds = Da.FormGetRecords(PatientID, FormName, FormType, MedTxType);
				}
				else
				{
					Ds = Da.FormGetRecords(PatientID, FormName, FormType);
				}

				if (Ds.Tables.Count > 0 && Ds.Tables[0].Rows.Count > 0)
				{
					MedicalTherapies.DataSource = Ds.Tables[0].DefaultView;
					MedicalTherapies.DataBind();
				}
		}



		protected virtual void BuildXRT(int PatientID, string FormName, string FormType)
		{

			RadiationTherapyDa Da = new RadiationTherapyDa();
			DataSet Ds = Da.FormGetRecords(PatientID, FormName, FormType);

			if (Ds.Tables.Count > 0 && Ds.Tables[0].Rows.Count > 0)
			{
				XRT.DataSource = Ds.Tables[0].DefaultView;
				XRT.DataBind();
			}
		}

        protected virtual void BuildStatus(int patientId, string PatientStatus)
        {

            StatusDa Da = new StatusDa();
            DataSet Ds = Da.GetStatus(patientId, PatientStatus);

            if (Ds.Tables.Count > 0 && Ds.Tables[0].Rows.Count > 0)
            {
                StatusRpt.DataSource = Ds.Tables[0].DefaultView;
                StatusRpt.DataBind();
            }
        }

		protected virtual void BuildQOL_Therapy(int PatientID, string FormName, string FormType)
		{

			QOL_TherapyDa QolDa = new QOL_TherapyDa();
			DataSet QolDs = QolDa.FormListQOL_Therapy(PatientID, FormName, FormType);

			if (QolDs.Tables.Count > 0 && QolDs.Tables[0].Rows.Count > 0)
			{
				QolTherapy.DataSource = QolDs.Tables[0].DefaultView;
				QolTherapy.DataBind();
			}
		}

		protected virtual void BuildHpiProstatectomies(int PatientID, string FormName, string FormType)
		{

			ProstatectomyDa prostatectomiesDa = new ProstatectomyDa();
			DataSet prostatectomiesDs = prostatectomiesDa.FormGetRecord(PatientID, FormName, FormType);
			if (prostatectomiesDs.Tables.Count > 0 && prostatectomiesDs.Tables[0].Rows.Count > 0)
			{
				HpiProstatectomies.DataSource = prostatectomiesDs.Tables[0].DefaultView;
				HpiProstatectomies.DataBind();
			}

		}

        protected virtual void BuildHpiNephrectomies(int PatientID)
        {

            NephrectomyDa nephDa = new NephrectomyDa();
            DataTable nephDt = nephDa.GetNephrectomies(PatientID);
            if (nephDt.Rows.Count > 0)
            {
                HpiNephrectomies.DataSource = nephDt.DefaultView;
                HpiNephrectomies.DataBind();
            }

        }


		protected void BuildHpiProtocols(int PatientID, string FormName, string FormType)
		{
				
			PatientProtocolDa protocolsDa = new PatientProtocolDa();
			DataSet protcolsDs = protocolsDa.FormGetRecords(PatientID, FormName, FormType);
			if (protcolsDs.Tables.Count > 0 && protcolsDs.Tables[0].Rows.Count > 0)
			{
				hpiProtocols.DataSource = protcolsDs.Tables[0].DefaultView;
				hpiProtocols.DataBind();
			}

		}



		protected void BuildHpiBiopsies(int PatientID, string FormName, string FormType, int hpiBiopsyId)
		{
				
			
			DataSet biopsiesDs;
			string sendBiopsyId = "";
			BiopsyDa bDa = new BiopsyDa();
			if (hpiBiopsyId.ToString().Length > 0)
			{
				sendBiopsyId = hpiBiopsyId.ToString();
			}

			biopsiesDs = bDa.FormGetRecords(PatientID, sendBiopsyId, FormName, FormType);

			if (biopsiesDs.Tables.Count > 0 && biopsiesDs.Tables[0].Rows.Count > 0)
			{
				hpiBiopsies.DataSource = biopsiesDs.Tables[0].DefaultView;
				hpiBiopsies.DataBind();
			}

		}


		protected void BuildBiopsies(int PatientID, string FormName, string FormType)
		{
			DataSet biopsiesDs;
			BiopsyDa bDa = new BiopsyDa();
			biopsiesDs = bDa.FormGetRecords(PatientID, "", FormName, FormType);

			if (biopsiesDs.Tables.Count > 0 && biopsiesDs.Tables[0].Rows.Count > 0)
			{
				Biopsies.DataSource = biopsiesDs.Tables[0].DefaultView;
				Biopsies.DataBind();
			}

		}


        protected virtual void BuildProstateBiopsies(int PatientID)
        {
            DataTable biopsiesDt;
            BiopsyDa bDa = new BiopsyDa();
            biopsiesDt = bDa.GetProstateBiopsies(PatientID);

            if (biopsiesDt.Rows.Count > 0)
            {
                Biopsies.DataSource = biopsiesDt.DefaultView;
                Biopsies.DataBind();
            }

        }

        protected void BuildPatientPhysicians(int PatientID, string FormName, string FormType)
        {
            DataSet ptPtPhysDs;
            PatientPhysicianDa ptPhysDa = new PatientPhysicianDa();
            ptPtPhysDs = ptPhysDa.FormGetPatientPhysicians(PatientID, FormName, FormType);

            if (ptPtPhysDs.Tables.Count > 0 && ptPtPhysDs.Tables[0].Rows.Count > 0)
            {
                PtPhys.DataSource = ptPtPhysDs.Tables[0].DefaultView;
                PtPhys.DataBind();
            }
        }


		protected virtual void BuildReferringMD()
		{
		}

        protected virtual void BuildKidneyDiseaseState(int PatientID, string FormName, string FormType)
        {

                StatusDa sDa = new StatusDa();
                DataSet sDs = sDa.GetStatus(PatientID, "Kidney");
                if (sDs.Tables.Count > 0 && sDs.Tables[0].Rows.Count > 0)
                {
                    StatusRpt.DataSource = sDs.Tables[0].DefaultView;
                    StatusRpt.DataBind();
                }

        }
        protected virtual void BuildDiseaseStateForDisease(int PatientID, string Disease)
        {

            StatusDa sDa = new StatusDa();
            DataSet sDs = sDa.GetStatus(PatientID, Disease);
            if (sDs.Tables.Count > 0 && sDs.Tables[0].Rows.Count > 0)
            {
                if (StatusMsg != null) StatusMsg.Visible = false;
                StatusRpt.DataSource = sDs.Tables[0].DefaultView;
                StatusRpt.DataBind();
            }
        }

        protected DataRow PatientNephrectomy(int PatientID, string FormName, string FormType)
        {

            DataRow Nephrectomy = null;

            ProcedureDa procDa = new ProcedureDa();
            DataSet procDs = procDa.FormGetSpecialRecords(PatientID, FormName, FormType, BOL.Procedure.ProcName, " IN ", "'Nephrectomy','Partial Nephrectomy','Laparoscopic Nephroureterectomy','Partial for Horshoe Kidney','Laparoscopic Partial Nephrectomy','Nephroureterectomy','Laparoscopic Radical Nephrectomy','Radical Nephrectomy', 'Robotic Partial Nephrectomy', 'Robotic Radical Nephrectomy'");

            if (procDs.Tables.Count > 0 && procDs.Tables[0].Rows.Count > 0)
            {
                DataView procDv = new DataView(procDs.Tables[0]);
                procDv.RowFilter = BOL.Procedure.ProcDate + " IS NOT NULL";
                procDv.Sort = BOL.Procedure.ProcDate + " ASC ";

                if (procDv.Count > 0) Nephrectomy = procDv[0].Row;

            }

            return Nephrectomy;

        }

        protected DataView KidneyLabsWithGFR(int PatientID, DataView labDv)
        {
            DataTable labDt = labDv.ToTable();
            labDt.Columns.Add("GFR");
            labDt.Columns.Add("GFRError");

            // Calculate GFR
            // eGFR = 141 * min(SCr/k,1)^a * max(SCr/k,1)^-1.209 * 0.993^Age x [1.018 if female] * [1.159 if black]

            bool AgeOK = false;
            bool GenderOK = false;
            bool RaceOK = false;
            bool CreatOK = false;

            IBusinessObject biz = BusinessObjectFactory.BuildBusinessObject("Patients");
            biz.Get(PatientID);
            string ptGender = biz[BOL.Patient.PtGender].ToString();
            string ptRace = biz[BOL.Patient.PtRace].ToString();
            int ptAge = 0;

            DateTime ptBirthDate;
            if (DateTime.TryParse(biz[BOL.Patient.PtBirthDate].ToString(), out ptBirthDate))
            {
                ptAge = Convert.ToInt32(Math.Floor(((DateTime.Now - ptBirthDate).TotalDays) / (365.242222)));
                AgeOK = true;
            }

            double k = 0;
            double a = 0;


            if (ptGender.ToUpper() == "MALE") { k = 0.9; a = -0.411; GenderOK = true; }
            else if (ptGender.ToUpper() == "FEMALE") { k = 0.7; a = -0.329; GenderOK = true; }

            if (ptRace.Length > 0) { RaceOK = true; }

            if (GenderOK && RaceOK && AgeOK)
            {
                foreach (DataRow dr in labDt.Rows)
                {
                    double creatResult;
                    if (dr[BOL.LabTest.LabResult].ToString().Length > 0 && double.TryParse(dr[BOL.LabTest.LabResult].ToString(), out creatResult))
                    {
                        double gfrCalc = (141) * (Math.Pow((Math.Min((creatResult / k), 1)), a)) * (Math.Pow((Math.Max((creatResult / k), 1)), -1.209)) * (Math.Pow(0.993, ptAge));
                        if (ptGender.ToUpper() == "FEMALE") gfrCalc = gfrCalc * 1.018;
                        if (ptRace.ToUpper().Contains("BLACK")) gfrCalc = gfrCalc * 1.159;
                        dr["GFR"] = Math.Round(gfrCalc, 3);
                    }
                    else { dr["GFRError"] = "Invalid Creatinine Value"; }
                }
            }
            else
            {
                foreach (DataRow dr in labDt.Rows)
                {
                    string errorMsg = "GFR cannot be calculated.<br/>(";
                    if (!GenderOK) errorMsg += "No Gender. ";
                    if (!RaceOK) errorMsg += "No Race. ";
                    if (!AgeOK) errorMsg += "No Age.";
                    errorMsg += ")";
                    dr["GFRError"] = errorMsg;
                }
            }


            return labDt.DefaultView;
        }



        protected double GFR(DateTime BirthDate, string Gender, string Race, double Creat)
        {
            int Age = Convert.ToInt32(Math.Floor(((DateTime.Now - BirthDate).TotalDays) / (365.242222)));

            double k = 0;
            double a = 0;

            if (Gender.ToUpper() == "MALE") { k = 0.9; a = -0.411;}
            else if (Gender.ToUpper() == "FEMALE") { k = 0.7; a = -0.329; }


            double gfrCalc = (141) * (Math.Pow((Math.Min((Creat / k), 1)), a)) * (Math.Pow((Math.Max((Creat / k), 1)), -1.209)) * (Math.Pow(0.993, Age));
            if (Gender.ToUpper() == "FEMALE") gfrCalc = gfrCalc * 1.018;
            if (Race.ToUpper().Contains("BLACK")) gfrCalc = gfrCalc * 1.159;

            return gfrCalc;
        }





        protected DataView LabsWithGFR(int PatientID, DataView labDv)
        {
            DataTable labDt = labDv.ToTable();
            labDt.Columns.Add("GFR");
            labDt.Columns.Add("GFRError");

            // Calculate GFR
            // eGFR = 141 * min(SCr/k,1)^a * max(SCr/k,1)^-1.209 * 0.993^Age x [1.018 if female] * [1.159 if black]

            bool AgeOK = false;
            bool GenderOK = false;
            bool RaceOK = false;
            //           bool CreatOK = false;

            IBusinessObject biz = BusinessObjectFactory.BuildBusinessObject("Patients");
            biz.Get(PatientID);
            string ptGender = biz[BOL.Patient.PtGender].ToString();
            string ptRace = biz[BOL.Patient.PtRace].ToString();
            int ptAge = 0;

            DateTime ptBirthDate;
            if (DateTime.TryParse(biz[BOL.Patient.PtBirthDate].ToString(), out ptBirthDate))
            {
                ptAge = Convert.ToInt32(Math.Floor(((DateTime.Now - ptBirthDate).TotalDays) / (365.242222)));
                AgeOK = true;
            }

            double k = 0;
            double a = 0;


            if (ptGender.ToUpper() == "MALE") { k = 0.9; a = -0.411; GenderOK = true; }
            else if (ptGender.ToUpper() == "FEMALE") { k = 0.7; a = -0.329; GenderOK = true; }

            if (ptRace.Length > 0) { RaceOK = true; }

            if (GenderOK && RaceOK && AgeOK)
            {
                foreach (DataRow dr in labDt.Rows)
                {
                    if (dr[BOL.LabTest.LabTest_Field].ToString().ToUpper().Equals("CREAT"))
                    {
                        double creatResult;
                        if (dr[BOL.LabTest.LabResult].ToString().Length > 0 && double.TryParse(dr[BOL.LabTest.LabResult].ToString(), out creatResult))
                        {
                            double gfrCalc = (141) * (Math.Pow((Math.Min((creatResult / k), 1)), a)) * (Math.Pow((Math.Max((creatResult / k), 1)), -1.209)) * (Math.Pow(0.993, ptAge));
                            if (ptGender.ToUpper() == "FEMALE") gfrCalc = gfrCalc * 1.018;
                            if (ptRace.ToUpper().Contains("BLACK")) gfrCalc = gfrCalc * 1.159;
                            dr["GFR"] = Math.Round(gfrCalc, 3);
                        }
                        else { dr["GFRError"] = "Invalid Creatinine Value"; }
                    }
                }
            }
            else
            {
                string errorMsg = "GFR cannot be calculated.<br/>(";
                if (!GenderOK) errorMsg += "No Gender. ";
                if (!RaceOK) errorMsg += "No Race. ";
                if (!AgeOK) errorMsg += "No Age.";
                errorMsg += ")";
                foreach (DataRow dr in labDt.Rows)
                {
                    if (dr[BOL.LabTest.LabTest_Field].ToString().ToUpper().Equals("CREAT")) dr["GFRError"] = errorMsg;
                }
            }


            return labDt.DefaultView;
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





        protected DataTable AddValueToHypogonadismTable(DataTable HypogonadismTable, string DateText, string ColumnName, string ColumnValue, int PrimaryKey)
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

                        if (HypogonadismTable.Columns.Contains(ColumnName + "Id"))
                        {
                            hRow[(ColumnName + "Id")] = PrimaryKey;
                        }

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

                    if (HypogonadismTable.Columns.Contains(ColumnName + "Id"))
                    {
                        dr[(ColumnName + "Id")] = PrimaryKey;
                    }

                    HypogonadismTable.Rows.Add(dr);
                }

            }
            else
            {
                DataRow dr2 = HypogonadismTable.NewRow();
                dr2[ColumnName] = ColumnValue;
                dr2["DateText"] = DateText;
                //          dr["Date"] = Date;

                if (HypogonadismTable.Columns.Contains(ColumnName + "Id"))
                {
                    dr2[(ColumnName + "Id")] = PrimaryKey;
                }

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

            DataColumn MedicationIdCol = new DataColumn();
            MedicationIdCol.ColumnName = "MedicationId";
            HypogonadismTable.Columns.Add(MedicationIdCol);

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






            DataColumn PSAIdCol = new DataColumn();
            PSAIdCol.ColumnName = "PSAId";
            HypogonadismTable.Columns.Add(PSAIdCol);

            DataColumn tTIdCol = new DataColumn();
            tTIdCol.ColumnName = "tTId";
            HypogonadismTable.Columns.Add(tTIdCol);

            DataColumn fTIdCol = new DataColumn();
            fTIdCol.ColumnName = "fTId";
            HypogonadismTable.Columns.Add(fTIdCol);

            DataColumn SHBGIdCol = new DataColumn();
            SHBGIdCol.ColumnName = "SHBGId";
            HypogonadismTable.Columns.Add(SHBGIdCol);

            DataColumn E2IdCol = new DataColumn();
            E2IdCol.ColumnName = "E2Id";
            HypogonadismTable.Columns.Add(E2IdCol);

            DataColumn LHIdCol = new DataColumn();
            LHIdCol.ColumnName = "LHId";
            HypogonadismTable.Columns.Add(LHIdCol);

            DataColumn FSHIdCol = new DataColumn();
            FSHIdCol.ColumnName = "FSHId";
            HypogonadismTable.Columns.Add(FSHIdCol);


            DataColumn PRLIdCol = new DataColumn();
            PRLIdCol.ColumnName = "PRLId";
            HypogonadismTable.Columns.Add(PRLIdCol);


            DataColumn HCTIdCol = new DataColumn();
            HCTIdCol.ColumnName = "HCTId";
            HypogonadismTable.Columns.Add(HCTIdCol);


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


        protected string TimeSpanLongString(DateTime FirstDate, DateTime SecondDate)
        {
            string timespanStr = "";

            int diff = (SecondDate - FirstDate).Days;
            if (diff > 365)
            {
                int years = (int)(Math.Floor(diff / 365.2422));
                int extraMonthDays = (int)(Math.Floor(diff % (365.2422)));
                int months = (int)(Math.Floor(extraMonthDays / (365.2422 / 12)));
                int extraDays = (int)(Math.Round(extraMonthDays % (365.2422 / 12)));
                timespanStr = years.ToString() + " yr, " + months.ToString() + " mo, " + extraDays + " days";
            }
            else if (diff > 30)
            {
                int months = (int)(Math.Floor(diff / (365.2422 / 12)));
                int extraDays = (int)(Math.Round(diff % (365.2422 / 12)));
                timespanStr = months.ToString() + " months, " + extraDays + " days";
            }
            else
            {
                timespanStr = diff.ToString() + " days";
            }

            return timespanStr;
        }


        //protected Hashtable TimeSpanByYearsMonthsDays(DateTime FirstDate, DateTime SecondDate)
        //{
        //    Hashtable span = new Hashtable();
        //    span.Add("Years", 0);
        //    span.Add("Months", 0);
        //    span.Add("Days", 0);

        //    int diff = (SecondDate - FirstDate).Days;
        //    if (diff > 365)
        //    {
        //        int years = (int)(Math.Floor(diff / 365.25));
        //        int extraMonthDays = (int)(Math.Floor(diff % (365.25)));
        //        int months = (int)(Math.Floor(extraMonthDays / (365.25 / 12)));
        //        int extraDays = (int)(Math.Round(extraMonthDays % (365.25 / 12)));

        //        span["Years"] = years;
        //        span["Months"] = months;
        //        span["Days"] = extraDays;
        //    }
        //    else if (diff > 30)
        //    {
        //        int months = (int)(Math.Floor(diff / (365.25 / 12)));
        //        int extraDays = (int)(Math.Round(diff % (365.25 / 12)));
        //        span["Months"] = months;
        //        span["Days"] = extraDays;
        //    }
        //    else
        //    {
        //        span["Days"] = diff.ToString() + " days";
        //    }

        //    return span;
        //}


        protected int? PatientAge(int PatientId)
        {
            int? age = null;

            string datasetSQL = CacheManager.GetDatasetSQL(Session[SessionKey.DatasetId]);
            PatientDa p = new PatientDa();
            DataTable pt = p.GetPatientById(PatientId, datasetSQL);

            if (pt.Rows.Count == 1 && pt.Rows[0][BOL.Patient.PtBirthDateText].ToString().Length > 0)
            {
                DateTime dob = new DateTime();
                if (DateTime.TryParse(pt.Rows[0][BOL.Patient.PtBirthDateText].ToString(), out dob))
                {
                    int diff = (DateTime.Now - dob).Days;
                    age = (int)(Math.Floor(diff / 365.2422));
                }

            }
            return age;

        }





        protected DataTable ASLabsTable(string[] labTestsToGet, int? PatientId)
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

            if (PatientId != null)
            {

                int pId = PatientId ?? default(int);

                LabTestDa da = new LabTestDa();

                DataSet labTestsDs = da.GetLabTestsbyList(pId, labTestsToGet);


                DataTable allLabs = labTestsDs.Tables[0];




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
                        DataTable ProstateVolumes = ProstateVolumesByDescendingDate(pId);
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
            }
            return labsTable;
        }




        protected DataTable ProstateVolumesByDescendingDate(int PatientId)
        {

            DataTable volumes = new DataTable();


            // add PSA Density
            DiagnosticDa d = new DiagnosticDa();
            DataTable ProstateImages = d.GetProstateImageFindings(PatientId);
            DataView ProstateImagesWithLWH = new DataView(ProstateImages);

            string prostateImgFilter = Diagnostic.DxDate + " IS NOT NULL";
            prostateImgFilter += " and Len(" + ImageProstate.ImgProstateHeight + ") > 0";
            prostateImgFilter += " and Len(" + ImageProstate.ImgProstateLength + ") > 0";
            prostateImgFilter += " and Len(" + ImageProstate.ImgProstateWidth + ") > 0";

            ProstateImagesWithLWH.RowFilter = prostateImgFilter;
            if (ProstateImagesWithLWH.Count > 0)
            {
                DataTable ProstateDimensions = ProstateImagesWithLWH.ToTable(false, Diagnostic.DxDateText, Diagnostic.DxDate, ImageProstate.ImgProstateHeight, ImageProstate.ImgProstateLength, ImageProstate.ImgProstateWidth, ImageProstate.ImgProstateVolume);

                foreach (DataRow ProstateMeasurement in ProstateDimensions.Rows)
                {
                    double ImgProstateHeight = 0;
                    double ImgProstateLength = 0;
                    double ImgProstateWidth = 0;

                    if (double.TryParse(ProstateMeasurement[ImageProstate.ImgProstateHeight].ToString(), out ImgProstateHeight)
                        && double.TryParse(ProstateMeasurement[ImageProstate.ImgProstateLength].ToString(), out ImgProstateLength)
                        && double.TryParse(ProstateMeasurement[ImageProstate.ImgProstateWidth].ToString(), out ImgProstateWidth))
                    {
                        double vol = (ImgProstateHeight * ImgProstateLength * ImgProstateWidth * 0.52);
                        ProstateMeasurement[ImageProstate.ImgProstateVolume] = vol;
                    }
                    else ProstateMeasurement[ImageProstate.ImgProstateVolume] = null;

                }

                DataView vols = new DataView(ProstateDimensions);
                vols.RowFilter = ImageProstate.ImgProstateVolume + " IS NOT NULL";
                vols.Sort = Diagnostic.DxDate + " DESC";

                if (vols.Count > 0) volumes = vols.ToTable();

            }

            return volumes;

        }

	}
}
