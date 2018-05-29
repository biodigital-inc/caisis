namespace Caisis.UI.Modules.Bladder.PaperForms
{
	using System;
	using System.Data;
	using System.Drawing;
	using System.Web;
	using System.Web.UI.WebControls;
	using System.Web.UI.HtmlControls;

	using Caisis.BOL;
	
	using Caisis.DataAccess;

	using System.Data.SqlClient;

	using Caisis.UI.Core.Classes;


	/// <summary>
	///		Summary description for UroBladCystFU.
	/// </summary>
	public partial class UroBladCystFU : BasePaperFormControl
	{

		protected static int NumHpiRowsAllowed = 17;




		override protected void Page_Load(object sender, EventArgs e)
		{

			base.Page_Load(sender, e);
            BuildCytologies(3, 1);
			BuildHPI();
			BuildReferringMD();
			//			BuildPotencyStatusValues();
//			BuildHpiProstatectomies();
//			BuildHpiProtocols();
//			BuildHpiBiopsies(hpiBiopsyId);
//			BuildHPINerveStatus();
            BuildEarlyComplications(3,1);
            BuildLateComplications(2,0);
			BuildShortSexualQOL();
			BuildCtMri(4,1);
			BuildImages(4,1);
			//BuildMedications(6, 1);
			BuildAllergies(6,1);
			BuildComorbidities();
            BuildLabTestsTrendView(4, 1, 24, "CREAT,BUN,NA,CL,CO2,HCT,WBC,PSA", 6);
//            LoadHomeMedicationList();
		}

        protected void BuildHPI()
        {
            if (patientID != 0)
            {
                try
                {
                    PatientDa pDa = new PatientDa();
                    DataSet hpiDs = pDa.GetPatientHPIBladder(this.patientID);
                    hpi.DataSource = hpiDs.Tables[0].DefaultView;
                    hpi.DataBind();

                    int rowCount = hpiDs.Tables[0].Rows.Count;
                    /*					if (rowCount < NumHpiRowsAllowed)
                                        {
                                            int newHeight = (NumHpiRowsAllowed-rowCount)*10;
                                            HpiSpacer.Height = newHeight;
                                        }
                    */
                }
                catch (Exception ex)
                {
                    //					HpiSpacer.Height = NumHpiRowsAllowed*10;
                    //Caisis.UI.Other.EmailError.SendErrorEmail( "Clinic Form: " + this._formTitle, "error creating hpi output");
                    ExceptionHandler.Publish(ex);
                }

            }
            /*			else
                        {
                            HpiSpacer.Height = NumHpiRowsAllowed*14;
                        }
            */

        }


        protected void hpiItemDataBound(Object Sender, RepeaterItemEventArgs e)
        {

            Literal StartNextHpiColumn;
            StartNextHpiColumn = (Literal)e.Item.FindControl("StartNextHpiColumn");

            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                int rowNumber = e.Item.ItemIndex + 1;
                if (System.Math.IEEERemainder(rowNumber, NumHpiRowsAllowed) == 0)
                {
                    StartNextHpiColumn.Text = "</td><td width=\"*\" class=\"HPITextExtraColumnsBladder\" valign=\"top\">";
                }
                else
                {
                    StartNextHpiColumn.Visible = false;
                }
            }
        }

		
//        previous version
	
//        protected void BuildHPI()
//        {
//            if (patientID != 0)
//            {
//                try
//                {
//                    PatientDa pDa = new PatientDa();
//                    DataSet hpiDs = pDa.GetPatientHPIBladder(this.patientID);


//                    if (hpiDs != null && hpiDs.Tables.Count > 0 && hpiDs.Tables[0].Rows.Count > 0)
//                    {

//                        int rowCount = hpiDs.Tables[0].Rows.Count;




//                        // -------- this section bolds certain lines in the HPI ------------------

//                        bool FirstPosTURFound = false;

//                        for (int i=0; i<rowCount; i++)
//                        {
//                            if (hpiDs.Tables[0].Rows[i]["PatientHPI"] != null && hpiDs.Tables[0].Rows[i]["PatientHPI"].ToString().Length > 0)
//                            {
//                                // check for first positive TUR *********************
//                                if (!FirstPosTURFound && hpiDs.Tables[0].Rows[i]["VarName"] != null && hpiDs.Tables[0].Rows[i]["VarName"].ToString().StartsWith("TUR"))
//                                {
//                                    // check if postitive
//                                    if ((hpiDs.Tables[0].Rows[i]["PatientHPI"].ToString().ToUpper().IndexOf("ABNORMAL") > -1 || (hpiDs.Tables[0].Rows[i]["PatientHPI"].ToString().Length > 13 && hpiDs.Tables[0].Rows[i]["PatientHPI"].ToString().ToUpper().IndexOf(" T", 14) > -1)))
//                                    {
//                                        hpiDs.Tables[0].Rows[i]["PatientHPI"] = "<strong>" + hpiDs.Tables[0].Rows[i]["PatientHPI"].ToString() + "</strong>";
//                                        FirstPosTURFound = true;
//                                        if (hpiDs.Tables[0].Rows[i]["VarDate"] != null && hpiDs.Tables[0].Rows[i]["VarDate"].ToString().Length > 0)
//                                        {
//                                            DxDateLabel.Text = hpiDs.Tables[0].Rows[i]["VarDate"].ToString();
//                                        }
//                                    }
//                                }
//                                    // bold if cystectomy
//                                else if (hpiDs.Tables[0].Rows[i]["VarName"] != null && hpiDs.Tables[0].Rows[i]["VarName"].ToString().ToUpper().Equals("CYSTECTOMY"))
//                                {
//                                    hpiDs.Tables[0].Rows[i]["PatientHPI"] = "<strong>" + hpiDs.Tables[0].Rows[i]["PatientHPI"].ToString() + "</strong>";
							
//                                    // not sure why this is in here - commenting out - jf 11/01/2011
//                                    //if (hpiDs.Tables[0].Rows[i]["ExtraInfo"] != null && hpiDs.Tables[0].Rows[i]["ExtraInfo"].ToString().Length > 0)
//                                    //{
//                                    //    CystectomyStageLabel.Text = hpiDs.Tables[0].Rows[i]["ExtraInfo"].ToString();
//                                    //}
							

//                                    // write nodes and stage below **************************
								
//                                    if (hpiDs.Tables[0].Rows[i]["PatientHPI"].ToString().LastIndexOf("Nodes:") > -1)
//                                    {
//                                        int NodesStringLocation = hpiDs.Tables[0].Rows[i]["PatientHPI"].ToString().LastIndexOf("Nodes:") + 6;
//                                        string NodesText = hpiDs.Tables[0].Rows[i]["PatientHPI"].ToString().Remove(0, NodesStringLocation);
//                                        if (NodesText != null && NodesText.Length > 0)
//                                        {
//                                            CystectomyNodesLabel.Text = NodesText;
//                                        }
//                                    }

//                                }
//                                    // bold if systemic CHEMO
//                                else if (hpiDs.Tables[0].Rows[i]["VarName"] != null && hpiDs.Tables[0].Rows[i]["VarName"].ToString().ToUpper().StartsWith("CHEMO"))
//                                {
//                                    if (hpiDs.Tables[0].Rows[i]["ExtraInfo"] != null && hpiDs.Tables[0].Rows[i]["ExtraInfo"].ToString() == "Systemic")
//                                    {
//                                        hpiDs.Tables[0].Rows[i]["PatientHPI"] = "<strong>" + hpiDs.Tables[0].Rows[i]["PatientHPI"].ToString() + "</strong>";
//                                    }
//                                }




//                            }
//                        }
//                        // ------------------------------------------------------------------------


//                        hpi.DataSource = hpiDs.Tables[0].DefaultView;
//                        hpi.DataBind();

///*					
//                        if (rowCount < NumHpiRowsAllowed)
//                        {
//                            int newHeight = (NumHpiRowsAllowed-rowCount)*10;
//                            HpiSpacer.Height = newHeight;
//                        }


//*/
//                    }

//                }
//                catch (Exception ex)
//                {
//                    hpi.Visible = false;
////					HpiSpacer.Height = NumHpiRowsAllowed*10;
//                    //Caisis.UI.Other.EmailError.SendErrorEmail( "Clinic Form: " + this._formTitle, "error creating hpi output");
//                    ExceptionHandler.Publish(ex);
//                }

//            }
///*
//            else
//            {
//                HpiSpacer.Height = NumHpiRowsAllowed*10;
//            }
//*/

//        }



//        protected void hpiItemDataBound(Object Sender, RepeaterItemEventArgs e) 
//        {
//            Literal StartNextHpiColumn;
//            StartNextHpiColumn = (Literal) e.Item.FindControl("StartNextHpiColumn");

//            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem) 
//            {
//                int rowNumber = e.Item.ItemIndex + 1;
//                if (System.Math.IEEERemainder(rowNumber, NumHpiRowsAllowed) == 0)
//                {
//                    StartNextHpiColumn.Text = "</td><td width=\"*\" class=\"HPITextExtraColumnsBladder\" valign=\"top\">";
//                }
//                else
//                {
//                    StartNextHpiColumn.Visible = false;
//                }
//            }
//        }



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
					StartNextHpiColumn.Text = "</td><td class=\"HPITextExtraColumnsBladder\" valign=\"top\">";
				}
				else
				{
					StartNextHpiColumn.Visible = false;
				}
			}
		}

        //protected void HpiProstatectomiesItemDataBound(Object Sender, RepeaterItemEventArgs e) 
        //{
        //    Literal StartNextHpiColumn;
        //    StartNextHpiColumn = (Literal) e.Item.FindControl("StartNextHpiColumn");

        //    Label CaseSurgeonLabel;
        //    CaseSurgeonLabel = (Label) e.Item.FindControl("CaseSurgeonLabel");

        //    int RowsAllowed = NumHpiRowsAllowed/2;

        //    if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem) 
        //    {
        //        int rowNumber = e.Item.ItemIndex + 1;
        //        if (System.Math.IEEERemainder(rowNumber, RowsAllowed) == 0)
        //        {
        //            StartNextHpiColumn.Text = "</td><td class=\"HPITextExtraColumnsBladder\" valign=\"top\">";
        //        }
        //        else
        //        {
        //            StartNextHpiColumn.Visible = false;
        //        }


        //        if (((DataRowView) e.Item.DataItem )["ProcSurgeon"] == null || ((DataRowView) e.Item.DataItem )["ProcSurgeon"].ToString() == "" )
        //        {
        //            CaseSurgeonLabel.Visible = false;
        //        }


        //    }
        //}


		
		protected virtual void BuildCtMri(int MinNumImageRowsToShow, int minNumBlankImageRows)
		{

			if (patientID != 0)
			{
				DiagnosticDa imagesDa = new DiagnosticDa();
				DataSet imagesDs = imagesDa.FormGetDxImages(this.patientID, this._formName, "Dynamic", "CT/MRI");

				if (imagesDs.Tables.Count > 0)
				{
					int numBlankImageRows = MinNumImageRowsToShow - imagesDs.Tables[0].Rows.Count;

                    /* this code truncated the text in the notes field.  removed 11/17 from development.
					if (imagesDs.Tables[0].Rows.Count > 0)
					{

						for (int i=0; i<(imagesDs.Tables[0].Rows.Count - 1); i++)
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
						imagesDs.Tables[0].Rows.Add(blankImageRow);
					}

					CtMri.DataSource = imagesDs.Tables[0].DefaultView;
				}
				else
				{
					CtMri.DataSource = BlankImages(MinNumImageRowsToShow).DefaultView;
				}
			}
			else
			{
				CtMri.DataSource = BlankImages(MinNumImageRowsToShow).DefaultView;
			}
						
			CtMri.DataBind();
		}

		override protected void BuildImages(int MinNumImageRowsToShow, int minNumBlankImageRows)
		{

			if (patientID != 0)
			{


				DiagnosticDa imagesDa = new DiagnosticDa();
				DataSet imagesDs = imagesDa.FormGetDxImages(this.patientID, this._formName, "Dynamic", "NOT CT/MRI");

				if (imagesDs.Tables.Count > 0)
				{
					int numBlankImageRows = MinNumImageRowsToShow - imagesDs.Tables[0].Rows.Count;

                    /* this code truncated the text in the notes field.  removed 11/17 from development.
					if (imagesDs.Tables[0].Rows.Count > 0)
					{

						for (int i=0; i<(imagesDs.Tables[0].Rows.Count - 1); i++)
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

		
		
		
		override protected void SetFormInfo()  
		{
			this._formName = "UroBladCystFU";
			this._formTitle = "Urology Bladder Cystectomy Follow-Up";
		}

		
	}
}
