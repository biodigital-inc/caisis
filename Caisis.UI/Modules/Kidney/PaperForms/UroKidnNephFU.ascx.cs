namespace Caisis.UI.Modules.Kidney.PaperForms
{
	using System;
	using System.Data;
	using System.Drawing;
	using System.Web;
	using System.Web.UI.WebControls;
	using System.Web.UI.HtmlControls;

	using Caisis.DataAccess;

	using Caisis.UI.Core.Classes;

	/// <summary>
	///		Summary description for UroKidnNephFU.
	/// </summary>
	public partial class UroKidnNephFU : BasePaperFormControl
	{

		protected static int NumHpiRowsAllowed = 9;
		protected static int NumComorbiditiesRowsAllowed = 6;


		override protected void Page_Load(object sender, EventArgs e)
		{

			base.Page_Load(sender, e);

			BuildHPI();
			this.BuildReferringMD();
			//this.BuildMedications(6,2);
			//this.BuildAllergies(6,2);
            this.BuildAllergies();
			this.BuildComorbidities();
            this.BuildImagesWithKidneyFindings(7, 1);
//            this.BuildLateComplications();
//			this.BuildLabTestsDiagram();
//            LastStatus.Text = GetLastStatus();
//            BuildCurrentDiseaseState();
//            LoadHomeMedicationList();

            DataRow Nephrectomy = PatientNephrectomy(this.patientID, this.FormName, "Dynamic");
            BuildLabTestsKidney(Nephrectomy);
            BuildComplications(Nephrectomy);
            BuildKidneyDiseaseState();
            this.BuildFamilyHistory();
            this.BuildSocialHistory();

		}

        protected void BuildLabTestsKidney(DataRow Nephrectomy)
        {
            if (Nephrectomy != null && Nephrectomy[BOL.Procedure.ProcDate] != null)
            {
                DateTime NephDate;
                if (DateTime.TryParse(Nephrectomy[BOL.Procedure.ProcDate].ToString(), out NephDate))
                {
                    BuildLabTestsKidney(NephDate);
                }
                else
                {
                    BuildLabTestsKidney(DateTime.MinValue);
                }
            }
            else
            {
                BuildLabTestsKidney(DateTime.MinValue);
            }
                
        }


		protected void BuildHPI()
		{
			if (patientID != 0)
			{
                try
                {
                    PatientDa pDa = new PatientDa();
                    DataSet hpiDs = pDa.GetPatientHPIKidney(this.patientID);
                    hpi.DataSource = hpiDs.Tables[0].DefaultView;
                    hpi.DataBind();
                }
                catch (Exception ex)
                {
                    hpi.Visible = false;
                    ExceptionHandler.Publish(ex);
                }
			}


		}




        protected void BuildComplications(DataRow Nephrectomy)
        {

            if (Nephrectomy != null)
            {
                if (Nephrectomy[BOL.Procedure.OperatingRoomDetailId].ToString().Length > 0)
                {
                    int ORDetailId = Convert.ToInt32(Nephrectomy[BOL.Procedure.OperatingRoomDetailId]);
                    DateTime NephDate = (DateTime)Nephrectomy[BOL.Procedure.ProcDate];

                    ToxicityDa toxDa = new ToxicityDa();
                    DataSet toxDs = toxDa.FormGetComplicationsByORDetailId(ORDetailId, this._formName, "Dynamic");

                    if (toxDs.Tables.Count > 0 && toxDs.Tables[0].Rows.Count > 0)
                    {

                        DataView toxDv = new DataView(toxDs.Tables[0]);
                        toxDv.RowFilter = BOL.Toxicity.ToxDate + " >= #" + NephDate.Date.AddDays(30) + "#";
                        toxDv.Sort = BOL.Toxicity.ToxDate + " ASC ";

                        ComplicationsRpt.DataSource = toxDv;
                        ComplicationsRpt.DataBind();

                    }
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
					StartNextHpiColumn.Text = "</td><td width=\"*\" class=\"HPITextExtraColumns\" valign=\"top\">";
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


				if (((DataRowView) e.Item.DataItem )["SurgCaseSurgeon"] == null || ((DataRowView) e.Item.DataItem )["SurgCaseSurgeon"].ToString() == "" )
				{
					CaseSurgeonLabel.Visible = false;
				}


			}
		}



        //override protected string GetLastStatus()
        //{
        //    string returnString = "Date:";

        //    if (patientID != 0)
        //    {
        //        StatusDa sDa = new StatusDa();
        //        string StatusCheck = sDa.FormGetLastStatus(this.patientID, this._formName, "Dynamic");
        //        if (StatusCheck != null && StatusCheck.Length > 0)
        //        {
        //            returnString = StatusCheck;
        //            LastStatus.CssClass = "blackBoldText";
        //        }
        //    }
        //    return returnString;
        //}




        //override protected void BuildLateComplications()
        //{

        //    if (patientID != 0)
        //    {


        //        ToxicityDa Da = new ToxicityDa();
        //        DataSet Ds = Da.FormListToxicities(patientID, this._formName, "Dynamic", "Late");

        //        if (Ds.Tables.Count > 0 && Ds.Tables[0].Rows.Count > 0)
        //        {
        //            LateComplicationsCheckbox.Checked = true;
        //        }


        //        DataSet OtherDs = Da.FormListToxicities(patientID, this._formName, "Dynamic", "Other");


        //        if (OtherDs.Tables.Count > 0 && OtherDs.Tables[0].Rows.Count > 0)
        //        {


        //            for (int i=0; i<OtherDs.Tables[0].Rows.Count; i++)
        //            {
        //                Ds.Tables[0].ImportRow(OtherDs.Tables[0].Rows[i]);
        //            }


        //        }


        //        if (Ds.Tables.Count > 0 && Ds.Tables[0].Rows.Count > 0)
        //        {
        //            LateComplications.DataSource = Ds.Tables[0].DefaultView;
        //            LateComplications.DataBind();

        //        }

        //    }

        //}



		override protected void SetFormInfo()  
		{
			this._formName = "UroKidnNephFU";
			this._formTitle = "Urology Nephrectomy Follow-Up";
		}


		protected void ComorbiditiesItemDataBound(Object Sender, RepeaterItemEventArgs e) 
		{

			Literal StartNextColumn;
			StartNextColumn = (Literal) e.Item.FindControl("StartNextColumn");


			int RowsAllowed = NumComorbiditiesRowsAllowed;

			if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem) 
			{
				int rowNumber = e.Item.ItemIndex + 1;
				if (System.Math.IEEERemainder(rowNumber, RowsAllowed) == 0)
				{
					StartNextColumn.Text = "</td><td valign=\"top\">";
				}
				else
				{
					StartNextColumn.Visible = false;
				}


			}

		}




        protected void BuildKidneyDiseaseState()
        {
            if (patientID != 0)
            {

                base.BuildKidneyDiseaseState(this.patientID, this._formName, "Dynamic");

                if (apptClinicDate.Length > 0)
                {
                    NewStatusDateLabel.Text = apptClinicDate;
                }


            }
        }


        protected void BuildKidneyStatusRow(string StatusSearchCriteria, Label StatusLabel, Label StatusDateLabel, HtmlInputCheckBox CurrentStatusCheckBox, DataTable sDt)
        {
            if (patientID != 0)
            {
//                StatusDa sDa = new StatusDa();
//                DataSet sDs = sDa.FormGetLastStatusByStatus(this.patientID, this._formName, "Dynamic", Status);

                

                DataView sDv = new DataView(sDt);
                sDv.RowFilter = BOL.Status.Status_Field + " " + StatusSearchCriteria; // LIKE '%" + Status + "%'";
                sDv.Sort = BOL.Status.StatusDate + " DESC";

                if (sDv.Count > 0)
                {
                    StatusLabel.Text = sDv[0][BOL.Status.Status_Field].ToString();
                    StatusLabel.CssClass = "blackBoldText";

                    if (sDv[0]["StatusDateText"].ToString().Length > 0)
                    {
                        StatusDateLabel.Text = "on " + sDv[0]["StatusDateText"].ToString();
//                        CurrentStatusCheckBox.Checked = true;
                        CurrentStatusCheckBox.Visible = false;
                    }
                    else if (sDv[0]["StatusDate"].ToString().Length > 0)
                    {
                        StatusDateLabel.Text = "on " + sDv[0]["StatusDate"].ToString();
                        //                        CurrentStatusCheckBox.Checked = true;
                        CurrentStatusCheckBox.Visible = false;
                    }
                }
            }
        }



        protected virtual void BuildImagesWithKidneyFindings(int MinNumImageRowsToShow, int minNumBlankImageRows)
        {

            if (patientID != 0)
            {

                string[] kidneyDx = new string[] { "CT Scan", "MRI", "Ultrasound" };

                DiagnosticDa imagesDa = new DiagnosticDa();
//                DataTable imagesDt = imagesDa.GetImagingAll(this.patientID);
                DataTable imagesDt = imagesDa.GetDiagnosticsByType(this.patientID, kidneyDx);

                if (imagesDt.Rows.Count > 0)
                {
                    // filter to last 18mo
                    DataView imagesDv = new DataView(imagesDt);
                    string imagesFilter = BOL.Diagnostic.DxDate + " >= #" + DateTime.Now.AddMonths(-18).Date.ToShortDateString() + "#";
                    imagesFilter += " AND (";
                    imagesFilter += BOL.Diagnostic.DxTarget + "  LIKE '%CHEST%'";
                    imagesFilter += " OR " + BOL.Diagnostic.DxTarget + "  LIKE '%ABDOMEN%'";
                    imagesFilter += " OR " + BOL.Diagnostic.DxTarget + "  LIKE '%PELVIS%'";
                    imagesFilter += " OR " + BOL.Diagnostic.DxTarget + "  LIKE '%KIDNEY%'";
                    imagesFilter += " OR " + BOL.Diagnostic.DxTarget + "  LIKE '%RENAL%'";
                    imagesFilter += ")";
                    imagesDv.RowFilter = imagesFilter;


                    imagesDv.Sort = BOL.Diagnostic.DxDate + " ASC";

                    DataTable filteredImagesDt = imagesDv.ToTable();



                    // check for older intitial CT/US
                    DataView olderImagesDv = new DataView(imagesDt);
                    string olderImagesFilter = BOL.Diagnostic.DxDate + " < #" + DateTime.Now.AddMonths(-18).Date.ToShortDateString() + "#";
                    olderImagesFilter += " AND " + BOL.Diagnostic.DxType + " <> 'MRI'";
                    olderImagesFilter += " AND (";
                    olderImagesFilter += BOL.Diagnostic.DxTarget + "  LIKE '%CHEST%'";
                    olderImagesFilter += " OR " + BOL.Diagnostic.DxTarget + "  LIKE '%ABDOMEN%'";
                    olderImagesFilter += " OR " + BOL.Diagnostic.DxTarget + "  LIKE '%PELVIS%'";
                    olderImagesFilter += " OR " + BOL.Diagnostic.DxTarget + "  LIKE '%KIDNEY%'";
                    olderImagesFilter += " OR " + BOL.Diagnostic.DxTarget + "  LIKE '%RENAL%'";
                    olderImagesFilter += ")";
                    olderImagesDv.RowFilter = olderImagesFilter;
                    olderImagesDv.Sort = BOL.Diagnostic.DxDate + " ASC";

                    if (olderImagesDv.Count > 0)
                    {
                        filteredImagesDt.ImportRow(olderImagesDv[0].Row);
                        DataView repeaterDV = new DataView(filteredImagesDt);
                        repeaterDV.Sort = BOL.Diagnostic.DxDate + " ASC";
                        filteredImagesDt = repeaterDV.ToTable();
                    }








                    int numBlankImageRows = MinNumImageRowsToShow - filteredImagesDt.Rows.Count;

                    // be sure you have at least the number of blank rows specified earlier
                    if (numBlankImageRows < minNumBlankImageRows)
                    {
                        numBlankImageRows = minNumBlankImageRows;
                    }

                    // add the blank rows
                    for (int i = 0; i < numBlankImageRows; i++)
                    {
                        DataRow blankImageRow;
                        blankImageRow = filteredImagesDt.NewRow();
                        blankImageRow[BOL.Diagnostic.DxDateText] = "/&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;/";
                        blankImageRow[BOL.Diagnostic.DxType] = "";
                        blankImageRow[BOL.Diagnostic.DxResult] = "";
                        blankImageRow[BOL.Diagnostic.DxNotes] = "";
                        blankImageRow[BOL.Diagnostic.DxTarget] = "";
                        filteredImagesDt.Rows.Add(blankImageRow);
                    }

                    images.DataSource = filteredImagesDt;
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







        protected void PopulateKindneyImageFindings(Object Sender, RepeaterItemEventArgs e)
        {
            if (patientID != 0)
            {
                if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
                {
                    Literal DxTarget = (Literal)e.Item.FindControl("DxTarget");
                    Literal MaxDim = (Literal)e.Item.FindControl("MaxDim");
                    Label NumTumors = (Label)e.Item.FindControl("NumTumors");
                    HtmlInputCheckBox MultTumors = (HtmlInputCheckBox)e.Item.FindControl("MultTumors");
                    Label MaxDimMsg = (Label)e.Item.FindControl("MaxDimMsg");
                    Literal ImgFindSide = (Literal)e.Item.FindControl("ImgFindSide");
                    Literal TumorType = (Literal)e.Item.FindControl("TumorType");
                    Literal NoTumorType = (Literal)e.Item.FindControl("NoTumorType");

                    

                    int rowNumber = e.Item.ItemIndex + 1;



                    if (((DataRowView)e.Item.DataItem)[BOL.Diagnostic.DiagnosticId] != null || ((DataRowView)e.Item.DataItem)[BOL.Diagnostic.DiagnosticId].ToString().Length > 0)
                    {
                        int DiagnosticId = int.MinValue;

                        if (int.TryParse(((DataRowView)e.Item.DataItem)[BOL.Diagnostic.DiagnosticId].ToString(), out DiagnosticId))
                        {
                            DiagnosticDa DXda = new DiagnosticDa();
                            DataTable DXdt = DXda.GetDxImageFindingsKidneyByDiagnosticId(DiagnosticId);

                            if (DXdt.Rows.Count > 0)
                            {
                                decimal maxDimVal = decimal.MinValue;
                                int maxDimFindingsRowId = int.MinValue;
                                //                            if (DXdt.Rows.Count > 1) { MultTumors.Checked = true; NumTumors.Text = DXdt.Rows.Count.ToString(); }


                                foreach (DataRow DXdr in DXdt.Rows)
                                {

                                    decimal ImgFindHeight = decimal.MinValue;
                                    decimal ImgFindWidth = decimal.MinValue;
                                    decimal ImgFindLength = decimal.MinValue;

                                    bool ImgFindHeightExists = decimal.TryParse(DXdt.Rows[0][BOL.ImageFindingKidney.ImgFindHeight].ToString(), out ImgFindHeight);
                                    bool ImgFindWidthExists = decimal.TryParse(DXdt.Rows[0][BOL.ImageFindingKidney.ImgFindWidth].ToString(), out ImgFindWidth);
                                    bool ImgFindLengthExists = decimal.TryParse(DXdt.Rows[0][BOL.ImageFindingKidney.ImgFindLength].ToString(), out ImgFindLength);

                                    decimal MaxDimValForThisFindingRecord = Math.Max(Math.Max(ImgFindHeight, ImgFindWidth), ImgFindLength);

                                    if (MaxDimValForThisFindingRecord > maxDimVal)
                                    {
                                        maxDimVal = MaxDimValForThisFindingRecord;
                                        int FindingsRowId = int.MinValue;

                                        string MaxDimDisplayText = MaxDimValForThisFindingRecord.ToString();

                                        if (DXdt.Rows[0][BOL.ImageFindingKidney.ImgFindSide].ToString().Length > 0)
                                        {
                                            ImgFindSide.Text = DXdt.Rows[0][BOL.ImageFindingKidney.ImgFindSide].ToString();
 //                                           MaxDimDisplayText += " (" + DXdt.Rows[0][BOL.ImageFindingKidney.ImgFindSide].ToString() + ")";
                                        }

                                        MaxDim.Text = MaxDimDisplayText;


                                        if (!ImgFindHeightExists || !ImgFindWidthExists || !ImgFindLengthExists)
                                        {
                                            MaxDimMsg.Visible = true;
                                        }
                                        else { MaxDimMsg.Visible = false; }


                                        if (int.TryParse(DXdt.Rows[0][BOL.ImageFindingKidney.DxImageFindingKidneyId].ToString(), out FindingsRowId))
                                        {
                                            maxDimFindingsRowId = FindingsRowId;
                                        }

                                        try
                                        {
                                            if (DXdt.Rows[0][BOL.ImageFindingKidney.ImgFindTumorType]!= null && DXdt.Rows[0][BOL.ImageFindingKidney.ImgFindTumorType].ToString().Length > 0)
                                            {
                                                TumorType.Text = DXdt.Rows[0][BOL.ImageFindingKidney.ImgFindTumorType].ToString();
                                                NoTumorType.Visible = false;
                                            }
                                            
                                        }
                                        catch (Exception ex)
                                        {
                                            ExceptionHandler.Publish(ex);
                                        }

                                    }
                                }
                            }
                        }
                    }



                    if (((DataRowView)e.Item.DataItem)[BOL.Diagnostic.DxTotalNumTumors] != null || ((DataRowView)e.Item.DataItem)[BOL.Diagnostic.DxTotalNumTumors].ToString().Length > 0)
                    {
                        int DxTotalNumTumors = int.MinValue;

                        if (int.TryParse(((DataRowView)e.Item.DataItem)[BOL.Diagnostic.DxTotalNumTumors].ToString(), out DxTotalNumTumors))
                        {
                            if (DxTotalNumTumors > 1) { MultTumors.Checked = true; NumTumors.Text = DxTotalNumTumors.ToString(); }
                        }
                    }

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



        override protected void BuildLabTestsKidney(DateTime NephrectomyDate)
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




	}
}
