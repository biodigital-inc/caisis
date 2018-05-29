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
	///		Summary description for GUProsNP.
	/// </summary>
	public partial class GUGenNP : BasePaperFormControl
	{

		protected static int NumHpiRowsAllowed = 8;
		protected static int NumMedRowsAllowed = 6;
		protected static int NumLabsRowsAllowed = 6;
		






		override protected void Page_Load(object sender, EventArgs e)
		{

			base.Page_Load(sender, e);

			BuildReferringMD();
//			BuildCurrentDiseaseState();
			BuildHPI();
			//			BuildHpiProtocols();
			BuildImages(5,1);
			BuildLabTests();
			BuildFamilyHistory();
			BuildSocialHistory();
			//BuildMedications();
			BuildComorbidities();
            BuildAllergies();
//            LoadHomeMedicationList();
		}

	
		
		override protected void SetFormInfo()  
		{
			this._formName = "GUGenNP";
			this._formTitle = "GU / Medicine New Patient";
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
                    PatientDa hpiDa = new PatientDa();
                    DataSet hpiDs = hpiDa.GetPatientHPIProstateGU(this.patientID, 0);


                    if (hpiDs.Tables[0].Rows.Count > 0)
                    {
                        hpi.DataSource = hpiDs.Tables[0].DefaultView;
                        hpi.DataBind();
                    }
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


		protected void imagesItemCreated(Object Sender, RepeaterItemEventArgs e) 
		{

			Literal ImagesNotesBullet, ImagesResultBullet;     
			ImagesNotesBullet = (Literal) e.Item.FindControl("ImagesNotesBullet");
			ImagesResultBullet = (Literal) e.Item.FindControl("ImagesResultBullet");

			if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem) 
			{

				if (((DataRowView) e.Item.DataItem )["DxNotes"] == null || ((DataRowView) e.Item.DataItem )["DxNotes"].ToString() == "" )
				{
					ImagesNotesBullet.Visible = false;
				}

				if (((DataRowView) e.Item.DataItem )["DxResult"] == null || ((DataRowView) e.Item.DataItem )["DxResult"].ToString() == "" )
				{
					ImagesResultBullet.Visible = false;
				}
			}

		}




		override protected void BuildFamilyHistory()
		{
			if (patientID != 0)
			{

				// Family History
				SqlCommand familyHistoryCom = DataAccessHelper.CreateCommand("spFormListFamilyMemberDiagnosis");
				DataAccessHelper.AddIntInputParam(familyHistoryCom, "patientID", this.patientID);
				DataAccessHelper.AddStringInputParam(familyHistoryCom, "formName", "URONV");
				DataAccessHelper.AddStringInputParam(familyHistoryCom, "formType", "dynamic");

				DataSet familyHistoryDs = DataAccessHelper.GetList(familyHistoryCom);


				if (familyHistoryDs.Tables[0].Rows.Count == 0)
				{
					DataRow blankFamHistoryRow;
					blankFamHistoryRow = familyHistoryDs.Tables[0].NewRow();
					blankFamHistoryRow["FamMemRelation"] = "<br><br><img src=\"../images/shim.gif\" border=\"0\" width=\"12\" height=\"1\">- Cancer:<br><br><br><br><br><img src=\"../images/shim.gif\" border=\"0\" width=\"12\" height=\"1\">- Other:";
					familyHistoryDs.Tables[0].Rows.Add(blankFamHistoryRow);
				}

				if (familyHistoryDs.Tables[0].Rows.Count > 0)
				{
					FamilyHistoryFiller.Visible = false;
					familyHistory.DataSource = familyHistoryDs.Tables[0].DefaultView;
					familyHistory.DataBind();
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




		override protected void BuildSocialHistory()
		{
			if (patientID != 0)
			{

				// Social History
				SqlCommand socialHistoryCom = DataAccessHelper.CreateCommand("spFormGetSocialHistoriesRecord");
				DataAccessHelper.AddIntInputParam(socialHistoryCom, "patientID", this.patientID);
				DataAccessHelper.AddStringInputParam(socialHistoryCom, "formName", "URONV");
				DataAccessHelper.AddStringInputParam(socialHistoryCom, "formType", "dynamic");

				DataSet socialHistoryDs = DataAccessHelper.GetList(socialHistoryCom);
				if (!socialHistoryDs.Tables.Count.Equals(0) && !socialHistoryDs.Tables[0].Rows.Count.Equals(0))
				{
					socHxOccupation.Text = socialHistoryDs.Tables[0].Rows[0]["SocHxOccupation"].ToString();
					socHxMaritalStatus.Text = socialHistoryDs.Tables[0].Rows[0]["SocHxMaritalStatus"].ToString();
					socHxChildren.Text = socialHistoryDs.Tables[0].Rows[0]["SocHxChildren"].ToString();


					//					socHxTobaccoType.Text = socialHistoryDs.Tables[0].Rows[0]["SocHxTobaccoType"].ToString();



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
					
					if (socialHistoryDs.Tables[0].Rows[0]["SocHxAlcohol"] != null && socialHistoryDs.Tables[0].Rows[0]["SocHxAlcohol"].ToString().Length > 0)
					{
						socHxAlcohol.Text = socialHistoryDs.Tables[0].Rows[0]["SocHxAlcohol"].ToString();
					}
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


        //override protected void BuildLabTests()
        //{
        //    if (patientID != 0)
        //    {

        //        LabTestDa da = new LabTestDa();

        //        DataSet ds = da.FormGetRecords(this.patientID, this._formName, "Dynamic");
        //        if (ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
        //        {

        //            labTestsBlankTable.Visible = false;
        //            labTests.DataSource = ds.Tables[0].DefaultView;
        //            labTests.DataBind();
        //        }
        //        else
        //        {
        //            labTestsPopulatedTable.Visible = false;
        //        }

        //    }
        //    else
        //    {
        //        labTestsPopulatedTable.Visible = false;
        //    }

        //}




        // override base version, no longer use old stored proc
        override protected void BuildLabTests()
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

                        labTests.DataSource = SortedLabs.DefaultView;


                        labTestsBlankTable.Visible = false;
                        labTests.DataSource = SortedLabs.DefaultView;
                        labTests.DataBind();



                    }
                    else
                    {
                        labTestsPopulatedTable.Visible = false;
                    }
                }
                else
                {
                    labTestsPopulatedTable.Visible = false;
                }

            }
            else
            {
                labTestsPopulatedTable.Visible = false;
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
					StartNextLabTestsColumn.Text = "</td><td class=\"PopulatedTextExtraColumns\" valign=\"top\">";
				}
				else
				{
					StartNextLabTestsColumn.Visible = false;
				}
			}
		}




	}
}
