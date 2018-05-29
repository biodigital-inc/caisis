namespace Caisis.UI.Modules.All.PaperForms
{
	using System;
	using System.Data;
	using System.Drawing;
	using System.Web;
	using System.Web.UI.WebControls;
	using System.Web.UI.HtmlControls;

    using System.Collections.Generic;
	using Caisis.DataAccess;

	using Caisis.UI.Core.Classes;

	/// <summary>
	///		Summary description for UroSexFunc.
	/// </summary>
	public partial class UroSexFuncFU : BasePaperFormControl
	{
		protected static int NumHpiRowsAllowed = 10;

		override protected void Page_Load(object sender, EventArgs e)
		{

			base.Page_Load(sender, e);

//			BuildReferringMD();
            BuildHPI();
//			BuildPotencyStatusValues();
			BuildHpiProstatectomies();
			BuildHpiProtocols();
			BuildHpiBiopsies(hpiBiopsyId);
			BuildHPINerveStatus();

			BuildErectileFunction(4, 1);
            BuildHypogonadism(0, 0);
		}

		override protected void SetFormInfo()  
		{
			this._formName = "UroSexFuncFU";
			this._formTitle = "Urology Sexual Function Follow-Up";
		}



		protected void BuildHPI()
		{
            if (patientID != 0)
            {
                try
                {
                    PatientDa hpiDa = new PatientDa();
                    DataSet hpiDs = hpiDa.GetPatientHPI(this.patientID, 1, 1);
                    hpi.DataSource = hpiDs.Tables[0].DefaultView;
                    hpi.DataBind();

                    int rowCount = hpiDs.Tables[0].Rows.Count;


                    //nomograms are in a second result set
                    /*				preRPNomo.Text = hpiDs.Tables[1].Rows[0]["preRPNomo"].ToString();
                                    preXRTNomo.Text = hpiDs.Tables[1].Rows[0]["preXRTNomo"].ToString();
                                    preBrachyNomo.Text = hpiDs.Tables[1].Rows[0]["preBrachyNomo"].ToString();
                                    postRP7yrNomo.Text = hpiDs.Tables[1].Rows[0]["postRP7yrNomo"].ToString();
                    */
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


                if (((DataRowView)e.Item.DataItem)["ProcSurgeon"] == null || ((DataRowView)e.Item.DataItem)["ProcSurgeon"].ToString() == "")
				{
					CaseSurgeonLabel.Visible = false;
				}


			}
		}





        protected void BuildErectileFunction(int minNumRowsToShow, int minNumBlankRows)
        {
            if (patientID != 0)
            {
                SurveyDa sDa = new SurveyDa();

                DataSet sDs = sDa.FormGetSurveyErectileFunction(this.patientID);
                if (sDs != null && sDs.Tables.Count > 0 && sDs.Tables[0].Rows.Count > 0)
                {


                    // fill in blank rows for medications when they are not populated only because the prescription hasn't changed
                    for (int j = 1; j < sDs.Tables[0].Rows.Count; j++)
                    {

                        try
                        {
                            // oral meds
                            if (sDs.Tables[0].Rows[j]["Oral Agent"] != null
                             && sDs.Tables[0].Rows[j]["Oral Agent"].ToString().Length < 1
                             && sDs.Tables[0].Rows[j]["Oral Dose"].ToString().Length < 1
                             && sDs.Tables[0].Rows[j]["Date"].ToString().Length > 1
                             && sDs.Tables[0].Rows[j - 1]["Date"].ToString().Length > 1
                             && sDs.Tables[0].Rows[j - 1]["Oral Agent"].ToString().Length > 0
                             && (sDs.Tables[0].Rows[j - 1]["Oral Agent Stop Date"].ToString().Length < 1
                                     || Convert.ToDateTime(sDs.Tables[0].Rows[j - 1]["Oral Agent Stop Date"].ToString()) > DateTime.Now
                                     || Convert.ToDateTime(sDs.Tables[0].Rows[j - 1]["Oral Agent Stop Date"].ToString()) > Convert.ToDateTime(sDs.Tables[0].Rows[j]["Date"].ToString()))

                               )
                            {
                                sDs.Tables[0].Rows[j]["Oral Agent"] = sDs.Tables[0].Rows[j - 1]["Oral Agent"];
                                sDs.Tables[0].Rows[j]["Oral Dose"] = sDs.Tables[0].Rows[j - 1]["Oral Dose"];
                                sDs.Tables[0].Rows[j]["Oral Agent Stop Date"] = sDs.Tables[0].Rows[j - 1]["Oral Agent Stop Date"];
                            }
                        }
                        catch { }

                        try
                        {
                            // ICI meds
                            if (sDs.Tables[0].Rows[j]["ICI Agent"] != null
                             && sDs.Tables[0].Rows[j]["ICI Agent"].ToString().Length < 1
                             && sDs.Tables[0].Rows[j]["ICI Dose"].ToString().Length < 1
                             && sDs.Tables[0].Rows[j]["Date"].ToString().Length > 1
                             && sDs.Tables[0].Rows[j - 1]["Date"].ToString().Length > 1
                             && sDs.Tables[0].Rows[j - 1]["ICI Agent"].ToString().Length > 0
                             && (sDs.Tables[0].Rows[j - 1]["ICI Stop Date"].ToString().Length < 1
                                     || Convert.ToDateTime(sDs.Tables[0].Rows[j - 1]["ICI Stop Date"].ToString()) > DateTime.Now
                                     || Convert.ToDateTime(sDs.Tables[0].Rows[j - 1]["ICI Stop Date"].ToString()) > Convert.ToDateTime(sDs.Tables[0].Rows[j]["Date"].ToString()))

                               )
                            {
                                sDs.Tables[0].Rows[j]["ICI Agent"] = sDs.Tables[0].Rows[j - 1]["ICI Agent"];
                                sDs.Tables[0].Rows[j]["ICI Dose"] = sDs.Tables[0].Rows[j - 1]["ICI Dose"];
                                sDs.Tables[0].Rows[j]["ICI Stop Date"] = sDs.Tables[0].Rows[j - 1]["ICI Stop Date"];
                            }
                        }
                        catch { }
                    }
                    



                    // original way
                    int numBlankRows = minNumRowsToShow - sDs.Tables[0].Rows.Count;

                    if (numBlankRows < minNumBlankRows)
                    {
                        numBlankRows = minNumBlankRows;
                    }

                    for (int i = 0; i < numBlankRows; i++)
                    {
                        DataRow blankRow = sDs.Tables[0].NewRow();
                        sDs.Tables[0].Rows.Add(blankRow);
                    }
                    erectileFunction.DataSource = sDs.Tables[0].DefaultView;
                    


                    /* with filter
                    DataView sDv = sDs.Tables[0].DefaultView;
                    string filterExpression = "(Len([Duration Post TX]) > 0) OR (Len([Spontaneous Erectile Function %]) > 0)";
                    sDv.RowFilter = filterExpression;

                    DataTable newDt = sDv.ToTable();



                    int numBlankRows = minNumRowsToShow - newDt.Rows.Count;

                    if (numBlankRows < minNumBlankRows)
                    {
                        numBlankRows = minNumBlankRows;
                    }

                    for (int i = 0; i < numBlankRows; i++)
                    {
                        DataRow blankRow = newDt.NewRow();
                        newDt.Rows.Add(blankRow);
                    }
                    erectileFunction.DataSource = newDt.DefaultView;
                     */
                    
                }
                else
                {
                    erectileFunction.DataSource = BlankErectileFunction(minNumRowsToShow).DefaultView;
                }

            }
            else
            {
                erectileFunction.DataSource = BlankErectileFunction(minNumRowsToShow).DefaultView;
            }

            try
            {
                erectileFunction.DataBind();
            }
            catch
            {
                erectileFunction.DataSource = BlankErectileFunction(minNumRowsToShow).DefaultView;
                erectileFunction.DataBind();
            }
        }

/*      old way
        protected void BuildErectileFunction(int minNumRowsToShow, int minNumBlankRows)
		{
			if (patientID != 0)
			{

				DataTable eDt = ErectileFuntionDataTable();

				if (eDt != null && eDt.Columns.Count > 0)
				{
					int numBlankRows = minNumRowsToShow - eDt.Rows.Count;

					if (numBlankRows < minNumBlankRows)
					{
						numBlankRows = minNumBlankRows;
					}

					for (int i=0; i<numBlankRows; i++)
					{
						DataRow blankRow = eDt.NewRow();
						eDt.Rows.Add(blankRow);
					}
					erectileFunction.DataSource = eDt.DefaultView;
				}
				else
				{
					erectileFunction.DataSource = BlankErectileFunction(minNumRowsToShow).DefaultView;
				}

			}
			else
			{
				erectileFunction.DataSource = BlankErectileFunction(minNumRowsToShow).DefaultView;
			}
			
			erectileFunction.DataBind();

		}


		// create the datatable for erectile function.  Currently hits the database a lot - once for
		// each table cell populated on the form.  Also pulls column names from the lookup codes.  - jf
		protected DataTable ErectileFuntionDataTable()
		{
			SurveyDa sDa = new SurveyDa();

			DataSet SurveyIdDs = sDa.FormGetSurveysByType(this.patientID, this._formName, "Dynamic", "Mulhall Erection");
			DataTable eDt = new DataTable();
			
			if (SurveyIdDs.Tables.Count > 0 && SurveyIdDs.Tables[0].Rows.Count > 0)
			{



				LookupCodeDa lDa = new LookupCodeDa();
				DataTable lDt = lDa.GetLookupCodes("SurveyItem_MulhallErection");
				int numCols = 0;
					
				if (lDt.Rows.Count > 0)
				{
					numCols = lDt.Rows.Count;
				}


				MedicationDa OralAgentDa = new MedicationDa();
				DataSet OralAgentDs;


				if (numCols > 0)
				{

					// create date column
					DataColumn DateCol;
					DateCol = new DataColumn();
					DateCol.ColumnName = "Date";
					eDt.Columns.Add(DateCol);

					// create Oral Agent column
					DataColumn AgentCol;
					AgentCol = new DataColumn();
					AgentCol.ColumnName = "Oral Agent";
					eDt.Columns.Add(AgentCol);

					// create ICI Agent column
					DataColumn ICICol;
					ICICol = new DataColumn();
					ICICol.ColumnName = "ICI Agent";
					eDt.Columns.Add(ICICol);

					// create Dose column
					DataColumn DoseCol;
					DoseCol = new DataColumn();
					DoseCol.ColumnName = "Dose";
					eDt.Columns.Add(DoseCol);

					// add appropriately named columns to main table
					for (int i=0; i<numCols; i++)
					{
						DataColumn iCol;
						iCol = new DataColumn();
						iCol.ColumnName = lDt.Rows[i]["LkpCode"].ToString();
						eDt.Columns.Add(iCol);
					}


					// build the rows of the erectile function table
					for (int i=0; i<SurveyIdDs.Tables[0].Rows.Count; i++)
					{

	
						int SurvId = Convert.ToInt32(SurveyIdDs.Tables[0].Rows[i]["SurveyId"]);
						DataRow blankRow = eDt.NewRow();
						eDt.Rows.Add(blankRow);

						eDt.Rows[i]["Date"] = SurveyIdDs.Tables[0].Rows[i]["SurveyDateText"].ToString();

						OralAgentDs = new DataSet();
						OralAgentDs = OralAgentDa.FormGetErectileMedication(this.patientID, SurveyIdDs.Tables[0].Rows[i]["SurveyDate"].ToString());
						if (OralAgentDs.Tables.Count > 0 && OralAgentDs.Tables[0].Rows.Count > 0)
						{
							if (OralAgentDs.Tables[0].Rows[0]["MedRoute"].ToString().ToUpper().Equals("INTRACAVERNOSAL"))
							{
								eDt.Rows[i]["ICI Agent"] = OralAgentDs.Tables[0].Rows[0]["Medication"].ToString();
//								eDt.Rows[i]["Oral Agent"] = "&nbsp;";
							}
							else
							{
								eDt.Rows[i]["Oral Agent"] = OralAgentDs.Tables[0].Rows[0]["Medication"].ToString();
//								eDt.Rows[i]["ICI Agent"] = "&nbsp;";
							}

							eDt.Rows[i]["Dose"] = OralAgentDs.Tables[0].Rows[0]["MedDose"].ToString();
						}

						// add data to the columns of the current row
						for (int j=0; j<numCols; j++)
						{
							string SurvItem = lDt.Rows[j]["LkpCode"].ToString();
					
							DataSet dds = sDa.FormGetSurveyItemsResult(SurvId, this._formName, "Dynamic", SurvItem);	
		
							if (dds.Tables.Count > 0 && dds.Tables[0].Rows.Count > 0)
							{
								eDt.Rows[i][SurvItem] = dds.Tables[0].Rows[0]["SurveyItemResult"].ToString();
							}
								
						}






					}

				}
			}
			
			return eDt;

		}
*/

		protected DataTable BlankErectileFunction(int MinNumRowsToShow)
		{
			DataTable eDt = new DataTable();
			LookupCodeDa lDa = new LookupCodeDa();
			DataTable lDt = lDa.GetLookupCodes("SurveyItem_MulhallErection");
			int numCols = 0;


			// create date column
			DataColumn DateCol;
			DateCol = new DataColumn();
			DateCol.ColumnName = "Date";
			eDt.Columns.Add(DateCol);

			// create Oral Agent column
			DataColumn AgentCol;
			AgentCol = new DataColumn();
			AgentCol.ColumnName = "Oral Agent";
			eDt.Columns.Add(AgentCol);

			// create ICI Agent column
			DataColumn ICICol;
			ICICol = new DataColumn();
			ICICol.ColumnName = "ICI Agent";
			eDt.Columns.Add(ICICol);

			// create Dose column
			DataColumn DoseCol;
			DoseCol = new DataColumn();
			DoseCol.ColumnName = "Dose";
			eDt.Columns.Add(DoseCol);

            // create Dose column
            DataColumn OralDoseCol;
            OralDoseCol = new DataColumn();
            OralDoseCol.ColumnName = "Oral Dose";
            eDt.Columns.Add(OralDoseCol);

            // create Dose column
            DataColumn ICIDoseCol;
            ICIDoseCol = new DataColumn();
            ICIDoseCol.ColumnName = "ICI Dose";
            eDt.Columns.Add(ICIDoseCol);


					
			if (lDt.Rows.Count > 0)
			{
				numCols = lDt.Rows.Count;
			}


			if (numCols > 0)
			{

				// add appropriately named columns to table
				for (int i=0; i<numCols; i++)
				{
					DataColumn iCol;
					iCol = new DataColumn();
					iCol.ColumnName = lDt.Rows[i]["LkpCode"].ToString();
					eDt.Columns.Add(iCol);
				}

			}

			for (int i=0; i<MinNumRowsToShow; i++)
			{
				DataRow BlankRow;
				BlankRow = eDt.NewRow();
				eDt.Rows.Add(BlankRow);
			}

			return eDt;

		}




	}
}
