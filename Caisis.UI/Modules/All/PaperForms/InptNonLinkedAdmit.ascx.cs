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
	///		Summary description for UroPreopNote.
	/// </summary>
	public partial class InptNonLinkedAdmit : BasePaperFormControl
	{
		protected static int NumHpiRowsAllowed = 10;

		override protected void Page_Load(object sender, EventArgs e)
		{

			base.Page_Load(sender, e);

			if (patientMRN != null && patientMRN.Length > 0)
			{
				InPatientDa piDa = new InPatientDa();
				DataSet piDs = piDa.GetInPatientsRecordByMRN(patientMRN);

				if (!piDs.Tables[0].Rows.Count.Equals(0))
				{
					InPatientAdmitDate = Convert.ToDateTime(piDs.Tables[0].Rows[0]["InPtAdmitDate"]).ToShortDateString();
					InPatientRoomNumber = piDs.Tables[0].Rows[0]["InPtBedNum"].ToString();
					InPatientAdmitReason = piDs.Tables[0].Rows[0]["InPtAdmitReason"].ToString();
				}

			}

			SetPhysicianSignatureLabel();


		}

		override protected void SetFormInfo()  
		{
			this._formName = "InptNonLinkedAdmit";
			this._formTitle = "Non-Linked Admission Note";
		}

		override protected void OnInit(System.EventArgs e)
		{
			IsOnePageForm = true;
			base.OnInit(e);
		}

		protected void BuildHPI()
		{
			if (patientID != 0)
			{
				PatientDa hpiDa = new PatientDa();
				DataSet hpiDs = hpiDa.GetPatientHPI(this.patientID, 0, 0);
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


				if (((DataRowView) e.Item.DataItem )["SurgCaseSurgeon"] == null || ((DataRowView) e.Item.DataItem )["SurgCaseSurgeon"].ToString() == "" )
				{
					CaseSurgeonLabel.Visible = false;
				}


			}
		}

	}
}
