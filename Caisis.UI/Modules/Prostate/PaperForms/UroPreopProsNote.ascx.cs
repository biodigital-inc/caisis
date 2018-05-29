namespace Caisis.UI.Modules.Prostate.PaperForms
{
	using System;
	using System.Data;
	using System.Drawing;
	using System.Collections;
	using System.Web;
	using System.Web.UI.WebControls;
	using System.Web.UI.HtmlControls;
	
	using Caisis.BOL;
	
	using Caisis.DataAccess;

	using System.Data.SqlClient;

	using System.Configuration;

	using Caisis.UI.Core.Classes;

	/// <summary>
	///		Summary description for UroPreopNote.
	/// </summary>
	public partial class UroPreopProsNote : BasePaperFormControl
	{
		protected static int NumHpiRowsAllowed = 7;

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

			
//			BuildLabTests(3,0);
//			BuildImages(3,1);
			//			BuildComplications();
//			LastStatus.Text = GetLastStatus();
//			BuildUrinaryStatusValues();
		}

		override protected void SetFormInfo()  
		{
			this._formName = "UroPreopProsNote";
			this._formTitle = "Urology Preoperative Prostatectomy Note";
		}

		override protected void OnInit(System.EventArgs e)
		{
			if (this.Parent.Parent.GetType().ToString().IndexOf("HtmlGenericControl") < 0)
			{
				IsEmbeddedForm = true;
			}
			base.OnInit(e);
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
	/*
					preRPNomo.Text = hpiDs.Tables[1].Rows[0]["preRPNomo"].ToString();
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




//				if (ht["LastCont"] != null && ht["LastCont"].ToString() != "")
//				{
//					LastCont.Text = "&nbsp;&nbsp;&nbsp;&nbsp;" + ht["LastCont"].ToString();
//				}
//				if (ht["ContLv2"] != null && ht["ContLv2"].ToString() != "")
//				{
//					ContLv2Textbox.Value = ht["ContLv2"].ToString();
//				}
//				if (ht["ContLv1"] != null && ht["ContLv1"].ToString() != "")
//				{
//					ContLv1Textbox.Value = ht["ContLv1"].ToString();
//				}
//				if (ht["LastIncontTx"] != null && ht["LastIncontTx"].ToString() != "")
//				{
//					LastIncontTx.Text = ht["LastIncontTx"].ToString();
//				}
//				else
//				{
//					LastIncontTxTableRow.Visible = false;
//				}
//				if (ht["UrinaryQOL"] != null && ht["UrinaryQOL"].ToString() != "")
//				{
//					UrinaryQOL.Text = "<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" + ht["UrinaryQOL"].ToString();
//				}



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

	}
}
