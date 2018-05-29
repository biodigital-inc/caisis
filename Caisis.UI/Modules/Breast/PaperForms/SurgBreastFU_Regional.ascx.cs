namespace Caisis.UI.Modules.Breast.PaperForms
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
	///		Summary description for UroProsFU.
	/// </summary>
    public partial class SurgBreastFU_Regional : BasePaperFormControl
	{

		protected static int NumHpiRowsAllowed = 10;

//		protected Label	postRP7yrNomo, LastStatus, NVB_Right, NVB_Left, PreTxPot, LastPot, SexualQOL;


//		protected Repeater complications, hpiBiopsies, HpiProstatectomies, QolTherapy;

//		protected System.Web.UI.HtmlControls.HtmlInputText potLv3Textbox, potLv2Textbox, potLv1Textbox, ContLv2Textbox, ContLv1Textbox;

//		protected bool viagraShown = false;




//		protected int hpiBiopsyId;
		private BasePaperFormControl  SurveyFormControl = null;


		override protected void Page_Load(object sender, EventArgs e)
		{

			base.Page_Load(sender, e);

            SetRegionalLocation();

			BuildReferringMD();
			BuildHPI();
//			BuildPotencyStatusValues();
//			BuildHpiProstatectomies();
//			BuildHpiProtocols();
//			BuildHpiBiopsies(hpiBiopsyId);
//			BuildHPINerveStatus();
			BuildMedications(4,2);
			BuildAllergies(4,1);
			BuildComorbidities();
			//BuildLabTests(6,0);
			BuildImages(4,1);
			//			BuildComplications();
			LastStatus.Text = GetLastStatus();




		}



		
		override protected void SetFormInfo()  
		{
			this._formName = "SurgBreastFU_Regional";
            this._formTitle = "Breast Surgery Follow-Up (Basking Ridge)";
		}





		protected void BuildHPI()
		{
			if (patientID != 0)
			{
				try
				{
					PatientDa hpiDa = new PatientDa();
                    DataSet hpiDs = hpiDa.GetPatientHPIBreast(this.patientID);
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





	}
}
