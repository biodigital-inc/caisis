namespace Caisis.UI.Modules.Testis.PaperForms
{
	using System;
	using System.Data;
	using System.Drawing;
	using System.Web;
	using System.Web.UI.WebControls;
	using System.Web.UI.HtmlControls;
	using Caisis.DataAccess;
    using Caisis.BOL;

	using Caisis.UI.Core.Classes;

	/// <summary>
	///		Summary description for UroTestNP.
	/// </summary>
	public partial class UroTestNP : BasePaperFormControl
	{

		protected static int NumHpiRowsAllowed = 17;

//		Removed and added BuildImages from bladder form
//		protected Repeater CTAbdomenPelvis, CTChest, BrainScan, XRayChest, PETScan, ScrotalUS;
//		protected System.Web.UI.HtmlControls.HtmlTable BlankCXRTable, BlankScrotalUSTable, BlankChestCTTable, BlankCTAbdomenPelvisTable, BlankBrainScanTable, BlankPETScanTable;



		override protected void Page_Load(object sender, EventArgs e)
		{

			base.Page_Load(sender, e);

			this.BuildHPI();
			//this.BuildMedications(4,2);
			this.BuildAllergies(4,2);
			this.BuildComorbidities();
			this.BuildFamilyHistory();
			this.BuildSocialHistory();
			this.BuildImages(7,3);
            BuildLabTestsTrendView(4, 1, 24, "HCG,HCGN,AFP,LDH", 4);
//            LoadHomeMedicationList();

		}





		protected void BuildHPI()
		{
			if (patientID != 0)
			{

				try
				{
					PatientDa hpiDa = new PatientDa();


					DataSet hpiDs = hpiDa.GetPatientHPITestis(this.patientID);
					hpi.DataSource = hpiDs.Tables[0].DefaultView;
					hpi.DataBind();


//					int rowCount = hpiDs.Tables[0].Rows.Count;

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
					familyHistory.Visible = false;
				}


				Patient pt = new Patient();
                pt.Get(this.patientID);

                //if (pt.DataSourceView.Count > 0 && pt["PtRace"] != null)
				if (!pt.IsEmpty && pt["PtRace"] != null)
				{
                    Race.Text = pt["PtRace"].ToString();
				}


			}
			else
			{
				familyHistory.Visible = false;
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

		override protected void SetFormInfo()  
		{
			this._formName = "UroTestNP";
			this._formTitle = "Urology Testis New Patient";
		}

	}
}
