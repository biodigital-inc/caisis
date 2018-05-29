namespace Caisis.UI.Modules.Bladder.PaperForms
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

	using Caisis.UI.Core.Classes;

	/// <summary>
	///		Summary description for UroBladFU.
	/// </summary>
	public partial class UroBladFU_rev2 : BasePaperFormControl
	{

		protected static int NumHpiRowsAllowed = 20;

		protected static int NumMedRowsAllowed = 5;

		override protected void Page_Load(object sender, EventArgs e)
		{

			base.Page_Load(sender, e);
//			HpiSpacer.Height = NumHpiRowsAllowed*10;  //this is in here temporarily until we populate forms

			BuildReferringMD();
			BuildHPI();
//			BuildPotencyStatusValues();
//			BuildHpiProstatectomies();
			BuildHpiProtocols();
//			BuildHpiBiopsies(hpiBiopsyId);
//			BuildHPINerveStatus();
			//BuildMedications();
			BuildAllergies(3,0);
			BuildComorbidities();
//			BuildLabTests();
//			BuildLabTests(4,1);

			BuildLabTestsTrendView(8, 1, 24, "CREAT,BUN,NA,CL,CO2,HCT,WBC,PSA", 6);
			BuildImages(5,1);
            BuildComplications();
//			LastStatus.Text = GetLastStatus();
//			BuildUrinaryStatusValues();
//			BuildQOL_Therapy(0,0);
			BuildXRT(1, 1);
			BuildMedTx(3, 1, "Intravesical", IntravesicalTx);
			BuildMedTx(2, 1, "Systemic", SystemicTx);
            BuildCytologies(3, 1);
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
			StartNextHpiColumn = (Literal) e.Item.FindControl("StartNextHpiColumn");

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
					StartNextHpiColumn.Text = "</td><td class=\"HPITextExtraColumnsBladder\" valign=\"top\">";
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



		protected void BuildComplications()
		{
			if (patientID != 0)
			{
				ToxicityDa tDa = new ToxicityDa();
				DataSet tDs = tDa.FormListToxicities(patientID, this._formName, "Dynamic", "Late");

				if (tDs.Tables.Count > 0 && tDs.Tables[0].Rows.Count > 0 )
				{
					ComplicationsCheckbox.Checked = true;
					complications.DataSource = tDs.Tables[0].DefaultView;
					complications.DataBind();
				}
			}
		}

/*		override protected void BuildMedications()
		{
			base.BuildMedications();

			if (medications.Items.Count > 0)
			{
				blankMedicationsTableRow.Visible = false;
			}
			else
			{
				medications.Visible = false;
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
*/

		override protected void SetFormInfo()  
		{
			this._formName = "UroBladFU";
			this._formTitle = "Urology Bladder Follow-Up";
		}



	}
}
