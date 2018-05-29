namespace Caisis.UI.Modules.All.PaperForms
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
	public partial class GUGenFU : BasePaperFormControl
	{

		protected static int NumHpiRowsAllowed = 10;
		protected static int NumMedRowsAllowed = 7;
		protected static int NumLabsRowsAllowed = 7;



		override protected void Page_Load(object sender, EventArgs e)
		{

			base.Page_Load(sender, e);

			BuildReferringMD();
			BuildHPI();
			//			BuildHpiProtocols();
			// BuildMedications();
			BuildComorbidities();
			BuildAllergies();
			BuildLabTests(0,0);
			BuildImages(0,0);
//			BuildCurrentDiseaseState();

            BuildGeneralSitesOfDisease();
//            LoadHomeMedicationList();

		}






		override protected void SetFormInfo()  
		{
            this._formName = "GUGenFU";
			this._formTitle = "GU / Medicine General Follow-Up";
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




        protected virtual void BuildGeneralSitesOfDisease()
        {
            if (patientID != 0)
            {
                SurveyDa sDa = new SurveyDa();
                DataSet sDs = sDa.FormGetRecentSurveyByType(this.patientID, this._formName, "Dynamic", "GU Sites of Disease");


                if (sDs.Tables.Count > 1 && sDs.Tables[1].Rows.Count > 0)
                {

                    CheckSiteOfDisease(sDs.Tables[1], "Bladder", Bladder_Present, Bladder_Absent);
                    CheckSiteOfDisease(sDs.Tables[1], "Bladder: Muscle Invasive", BladderMuscleInvasive_Present, null);
                    CheckSiteOfDisease(sDs.Tables[1], "Bladder: Locally Advanced / Unresectable", BladderLocallyAdvancedUnresectable_Present, null);

                    CheckSiteOfDisease(sDs.Tables[1], "Kidney", Kidney_Present, Kidney_Absent);
                    CheckSiteOfDisease(sDs.Tables[1], "Ureter", Ureter_Present, Ureter_Absent);
                    CheckSiteOfDisease(sDs.Tables[1], "Renal Pelvis", RenalPelvis_Present, RenalPelvis_Absent);
                    CheckSiteOfDisease(sDs.Tables[1], "Urethra", Urethra_Present, Urethra_Absent);
                    CheckSiteOfDisease(sDs.Tables[1], "Testes", Testes_Present, Testes_Absent);
                    CheckSiteOfDisease(sDs.Tables[1], "Other", Other_Present, Other_Absent);


                    CheckSiteOfDisease(sDs.Tables[1], "Metastatic to Bone", Bone_Present, Bone_Absent);
                    CheckSiteOfDisease(sDs.Tables[1], "Metastatic to Soft Tissue", SoftTissue_Present, SoftTissue_Absent);
                    CheckSiteOfDisease(sDs.Tables[1], "Metastatic to Lymph Nodes", LymphNodes_Present, LymphNodes_Absent);
                    CheckSiteOfDisease(sDs.Tables[1], "Metastatic to Lung", Lung_Present, Lung_Absent);
                    CheckSiteOfDisease(sDs.Tables[1], "Metastatic to Liver", Liver_Present, Liver_Absent);
                    CheckSiteOfDisease(sDs.Tables[1], "Metastatic to Brain", Brain_Present, Brain_Absent);
                    CheckSiteOfDisease(sDs.Tables[1], "Metastatic to Other", MS_Other_Present, MS_Other_Absent);

                }

            }
        }




        // override base version, no longer use old stored proc
        override protected void BuildLabTests(int minNumLabTestRowsToShow, int minNumBlankLabTestRows)
        {
            if (patientID != 0)
            {

                //Lab Tests
                LabTestDa da = new LabTestDa();

// old version  DataSet labTestsDs = da.FormGetRecords(this.patientID, this._formName, "Dynamic");


                string[] l = { "PSA", "FPSA", "AFP", "HCG", "HCGN", "LDH" };
                DataSet labTestsDs = da.GetLabTestsbyList(this.patientID, l);

                if (labTestsDs.Tables.Count > 0)
                {
                    DataTable LastXOfEach = labTestsDs.Tables[0].Clone();
                    int countPerLabTest = 3; // number of each type of lab test to show

                    foreach (string labTest in l)
                    {
                        DataView dv = new DataView(labTestsDs.Tables[0]);
                        string labFilter = BOL.LabTest.LabTest_Field + " = '" + labTest + "'";
                        dv.RowFilter = labFilter;
                        dv.Sort = BOL.LabTest.LabDate + " DESC";

                        if (dv.Count > 0)
                        {
                            DataTable t = dv.ToTable();
                            int lastI = (t.Rows.Count >= countPerLabTest) ? countPerLabTest : t.Rows.Count;
                            for (int i = 0; i < lastI; i++)
                            {
                                LastXOfEach.ImportRow(t.Rows[i]);
                            }       
                        }
                    }

                    if (LastXOfEach.Rows.Count > 0)
                    {
                        DataView SortedLabsView = new DataView(LastXOfEach);
                        SortedLabsView.Sort = BOL.LabTest.LabDate + " DESC";
                        DataTable SortedLabs = SortedLabsView.ToTable();

                        int numBlankLabTestRows = minNumLabTestRowsToShow - SortedLabs.Rows.Count;

                        if (numBlankLabTestRows < minNumBlankLabTestRows)
                        {
                            numBlankLabTestRows = minNumBlankLabTestRows;
                        }

                        for (int i = 0; i < numBlankLabTestRows; i++)
                        {
                            DataRow blankLabTestsRow;
                            blankLabTestsRow = SortedLabs.NewRow();
                            blankLabTestsRow["LabDateText"] = "/&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;/";
                            blankLabTestsRow["LabTest"] = "&nbsp;";
                            blankLabTestsRow["LabResult"] = "&nbsp;";
                            blankLabTestsRow["LabQuality"] = "&nbsp;";
                            SortedLabs.Rows.Add(blankLabTestsRow);
                        }
                        labTests.DataSource = SortedLabs.DefaultView;
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




	}

}
