namespace Caisis.UI.Modules.All.PaperForms
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
	///		Summary description for UroUrinFunc.
	/// </summary>
	public partial class UroUrinFuncNP : BasePaperFormControl
	{


		override protected void Page_Load(object sender, EventArgs e)
		{

			base.Page_Load(sender, e);


			this.BuildReferringMD();
			//this.BuildMedications(6, 1);
			this.BuildAllergies(6, 1);
			this.BuildComorbidities();
			this.BuildLabTests(3,0);
			this.BuildImages(4,1);
			BuildFamilyHistory();
            BuildSocialHistory();
//            LoadHomeMedicationList();


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
			}
			else
			{
				familyHistory.Visible = false;
			}
		}



		override protected void SetFormInfo()  
		{
			this._formName = "UroUrinFuncNP";
			this._formTitle = "Urology Urinary Function New Patient";
		}


	}
}
