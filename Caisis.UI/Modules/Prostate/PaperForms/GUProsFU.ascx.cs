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
	///		Summary description for GUProsFU.
	/// </summary>
    public partial class GUProsFU : BasePaperFormControl
	{

		protected static int NumHpiRowsAllowed = 22;
        protected static int NumMedRowsAllowed = 7;
//        protected static int NumLabsRowsAllowed = 20;
        protected int NumLabsRowsAllowed = 7;




		override protected void Page_Load(object sender, EventArgs e)
		{

			base.Page_Load(sender, e);

			BuildReferringMD();
			BuildHPI();
			//			BuildHpiProtocols();
//            BuildMedications();
//            BuildAdditionalGUMedicationSection(20, 4);
			BuildComorbidities();
			BuildAllergies();
//			BuildLabTests(0,0);
            this.BuildLabTests();
            BuildImages(0,0);
			BuildCurrentDiseaseState();
			//
            BuildPSA_DT();

            BuildProstateSitesOfDisease();
            BuildReviewOfSystemsWithBaslineToxicities();



//            LoadHomeMedicationList();
		}






		override protected void SetFormInfo()  
		{
			this._formName = "GUProsFU";
			this._formTitle = "GU / Medicine Prostate Follow-Up";
		}



		protected void BuildHPI()
		{
			if (patientID != 0)
			{
                try
                {
                    PatientDa hpiDa = new PatientDa();
                    DataSet hpiDs = hpiDa.GetPatientHPIProstateGU(this.patientID, 0);
                    hpi.DataSource = hpiDs.Tables[0].DefaultView;
                    hpi.DataBind();

                    int rowCount = hpiDs.Tables[0].Rows.Count;
                }
                catch (Exception ex)
                {
                    hpi.Visible = false;
                    ExceptionHandler.Publish(ex);
                }
			}
		}

        protected void BuildPSA_DT()
        {
            if (patientID != 0)
            {
                NomogramDa nda = new NomogramDa();
                try
                {
					float psaDoublingTime = nda.GetPSADoublingTime(patientID);

					if (psaDoublingTime != float.PositiveInfinity)
					{
						psaDT.Text = string.Format("{0:F2} months (calculated based on the last 3 valid PSA values).", psaDoublingTime);
					}
                }
                catch { }
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




		protected void medicationsItemDataBound(Object Sender, RepeaterItemEventArgs e) 
		{

			Literal StartNextMedColumn;
			StartNextMedColumn = (Literal) e.Item.FindControl("StartNextMedColumn");

			int RowsAllowed = NumMedRowsAllowed;

			if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem) 
			{
				int rowNumber = e.Item.ItemIndex + 1;
				if (System.Math.IEEERemainder(rowNumber, RowsAllowed) == 0)
				{
					StartNextMedColumn.Text = "</td><td class=\"PopulatedTextExtraColumns\" valign=\"top\">";
				}
				else
				{
					StartNextMedColumn.Visible = false;
				}
			}
		}







		protected void labTestsItemDataBound(Object Sender, RepeaterItemEventArgs e) 
		{

			Literal StartNextLabTestsColumn;
			StartNextLabTestsColumn = (Literal) e.Item.FindControl("StartNextLabTestsColumn");

			int RowsAllowed = NumLabsRowsAllowed;

			if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem) 
			{
				int rowNumber = e.Item.ItemIndex + 1;
				if (System.Math.IEEERemainder(rowNumber, RowsAllowed) == 0)
				{
					StartNextLabTestsColumn.Text 
						= "</td><td class=\"PopulatedTextExtraColumns\" valign=\"top\">";
				}
				else
				{
					StartNextLabTestsColumn.Visible = false;
				}
			}
		}


		protected void imagesItemCreated(Object Sender, RepeaterItemEventArgs e) 
		{

			Literal ImagesNotesBullet;     
			ImagesNotesBullet = (Literal) e.Item.FindControl("ImagesNotesBullet");

			if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem) 
			{

				if (((DataRowView) e.Item.DataItem )["DxNotes"] == null || ((DataRowView) e.Item.DataItem )["DxNotes"].ToString() == "" )
				{
					ImagesNotesBullet.Visible = false;
				}

			}

		}




        protected virtual void BuildProstateSitesOfDisease()
        {
            if (patientID != 0)
            {
                SurveyDa sDa = new SurveyDa();
                DataSet sDs = sDa.FormGetRecentSurveyByType(this.patientID, this._formName, "Dynamic", "Prostate Sites of Disease");

 
                if (sDs.Tables.Count > 1 && sDs.Tables[1].Rows.Count > 0)
                {
                    // Bone
                    CheckSiteOfDisease(sDs.Tables[1], "Bone", Bone_Present, Bone_Absent);
                    CheckSiteOfDisease(sDs.Tables[1], "Soft Tissue", SoftTissue_Present, SoftTissue_Absent);
                    CheckSiteOfDisease(sDs.Tables[1], "Lymph Nodes", LymphNodes_Present, LymphNodes_Absent);
                    CheckSiteOfDisease(sDs.Tables[1], "Lung", Lung_Present, Lung_Absent);
                    CheckSiteOfDisease(sDs.Tables[1], "Liver", Liver_Present, Liver_Absent);
                    CheckSiteOfDisease(sDs.Tables[1], "Local Disease", LocalDisease_Present, LocalDisease_Absent);
                    CheckSiteOfDisease(sDs.Tables[1], "Prostatic Mass", LocalDisease_Present, LocalDisease_Absent);
                }

            }
        }


        protected virtual void BuildReviewOfSystemsWithBaslineToxicities()
        {
            if (patientID != 0)
            {
                ToxicityDa tDa = new ToxicityDa();
                DataSet tDs = tDa.FormListToxicities(this.patientID, this._formName, "Dynamic", "");


                if (tDs.Tables.Count > 0 && tDs.Tables[0].Rows.Count > 0)
                {
                    DataTable SymptomsTable = new DataTable();

                    DataColumn Symptoms = new DataColumn();
                    Symptoms.ColumnName = "Symptoms";
                    Symptoms.DataType = System.Type.GetType("System.String");
                    SymptomsTable.Columns.Add(Symptoms);

                    DataColumn BaselineGradeLabel = new DataColumn();
                    BaselineGradeLabel.ColumnName = "BaselineGradeLabel";
                    BaselineGradeLabel.DataType = System.Type.GetType("System.Object");
                    SymptomsTable.Columns.Add(BaselineGradeLabel);

                    AddSymptomToToxicityList(SymptomsTable, "Fatigue", BaselineGrade_Fatigue);
                    AddSymptomToToxicityList(SymptomsTable, "Fever", BaselineGrade_Fever);
                    AddSymptomToToxicityList(SymptomsTable, "Anorexia", BaselineGrade_Anorexia);
                    AddSymptomToToxicityList(SymptomsTable, "Rash", BaselineGrade_Rash);
                    AddSymptomToToxicityList(SymptomsTable, "Oral Mucositis", BaselineGrade_OralMucositis);
                    AddSymptomToToxicityList(SymptomsTable, "Dyspnea", BaselineGrade_Dyspnea);
                    AddSymptomToToxicityList(SymptomsTable, "Edema", BaselineGrade_Edema);
                    AddSymptomToToxicityList(SymptomsTable, "Chest Pain", BaselineGrade_ChestPain);
                    AddSymptomToToxicityList(SymptomsTable, "Nausea", BaselineGrade_Nausea);
                    AddSymptomToToxicityList(SymptomsTable, "Vomiting", BaselineGrade_Vomiting);
                    AddSymptomToToxicityList(SymptomsTable, "Diarrhea", BaselineGrade_Diarrhea);
                    AddSymptomToToxicityList(SymptomsTable, "Constipation", BaselineGrade_Constipation);
                    AddSymptomToToxicityList(SymptomsTable, "Sensory Neuropathy", BaselineGrade_SensoryNeuropathy);
                    AddSymptomToToxicityList(SymptomsTable, "Motor Neuropathy", BaselineGrade_MotorNeuropathy);
                    AddSymptomToToxicityList(SymptomsTable, "Urinary Frequency", BaselineGrade_UrinaryFrequency);
                    AddSymptomToToxicityList(SymptomsTable, "Hemorrhage - Urinary NOS", BaselineGrade_HemorrhageUrinaryNOS);
                    AddSymptomToToxicityList(SymptomsTable, "Pain - Urethra", BaselineGrade_PainUrethra);
                    AddSymptomToToxicityList(SymptomsTable, "Incontinence", BaselineGrade_Incontinence);
                    AddSymptomToToxicityList(SymptomsTable, "Pain", BaselineGrade_Pain);


                    string filterExpression = "(1 = 1) ";

                    foreach (DataRow sRow in SymptomsTable.Rows)
                    {
                        filterExpression += "AND (ToxName <> '" + sRow["Symptoms"].ToString() + "')";
                        CheckForBaselineToxicity(tDs.Tables[0], sRow["Symptoms"].ToString(), (Label) sRow["BaselineGradeLabel"]);
                    }

                    DataView myView = tDs.Tables[0].DefaultView;
                    myView.RowFilter = filterExpression;

                    if (myView.Count > 0)
                    {
                        OtherBaselineToxicitiesHtmlRow.Visible = true;
                        OtherBaselineToxicitiesRpt.DataSource = myView;
                        OtherBaselineToxicitiesRpt.DataBind();
                    }



                }

            }
        }

        protected virtual void AddSymptomToToxicityList(DataTable sTable, string symptomName, Label BaselineGradeLabelControl)
        {
            DataRow sRow = sTable.NewRow();
            sRow["Symptoms"] = symptomName;
            sRow["BaselineGradeLabel"] = BaselineGradeLabelControl;
            sTable.Rows.Add(sRow);
        }

        protected virtual void CheckForBaselineToxicity(DataTable BaselineToxicitiesTable, string Symptom, Label BaselineDisplay)
        {
            foreach (DataRow tRow in BaselineToxicitiesTable.Rows)
            {
                if (tRow["ToxName"].ToString().ToUpper().Equals(Symptom.ToUpper()))
                {
                    if (tRow["ToxGrade"].ToString().Length > 0)
                    {
                        BaselineDisplay.Text = "Baseline<br/>Grade " + tRow["ToxGrade"].ToString();
                    }
                }
            }
        }






        override protected void BuildLabTests()
        {
            if (patientID != 0)
            {

                string[] labTestsToGet = new string[] { "PSA", "CTC" };

                LabTestDa da = new LabTestDa();
                DataSet labTestsDs = da.GetLabTestsbyList(this.patientID, labTestsToGet);


                if (labTestsDs.Tables.Count > 0 && labTestsDs.Tables[0].Rows.Count > 0)
                {
                    DataView dv = new DataView(labTestsDs.Tables[0]);
                    dv.RowFilter = BOL.LabTest.LabDate + " IS NOT NULL and " + BOL.LabTest.LabDate + " >= #" + DateTime.Now.AddYears(-1).ToShortDateString() + "#";
                    dv.Sort = BOL.LabTest.LabTest_Field + " DESC, " + BOL.LabTest.LabDate + " DESC";

                    if (dv.Count > 0)
                    {
                        if (dv.Count > (NumLabsRowsAllowed * 2)) NumLabsRowsAllowed = (int)(Math.Ceiling((decimal)(dv.Count / 2))) + 1;
                        labTests.DataSource = dv;
                        labTests.DataBind();
                    }
                }

            }

        }






	}

}
