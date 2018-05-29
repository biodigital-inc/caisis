namespace Caisis.UI.Modules.Prostate.Eforms
{
	using System;
	using System.Data;
	using System.Data.SqlClient;
	using System.Drawing;
	using System.Web;
	using System.Web.UI.WebControls;
	using System.Web.UI.HtmlControls;

	using Caisis.BOL;
	using Caisis.UI.Core.Classes;
    //2.0 using Caisis.UI.Modules.Prostate.PaperForms;
	using Caisis.DataAccess;
	using Caisis.UI.Core.Classes.CustomControls;



	/// <summary>
	///		Summary description for ProstateHPI.
	/// </summary>
	public partial class RectalExam : BaseEFormControl
	{





        //2.0 protected Literal  DreResultFieldId;






		override protected void Page_Load(object sender, System.EventArgs e)
		{
			base.Page_Load(sender, e);

			// create client side array
			// [0]=Side [1]=Level [2]=Cancer [3]=ECE [4]=CancerSelectClientId [5]=ECESelectClientId

			string arrayVals = "";
			arrayVals += "<script language='javascript'>var dreArray = new Array(8);";
			arrayVals += "dreArray[0] = new Array('Left','SV','" + DRE_FindResult_1.Value + "','" + DRE_FindExtension_1.Value + "', '" + DRE_FindResult_1.ClientID + "', '" + DRE_FindExtension_1.ClientID + "', '" + DRE_FindSide_1.ClientID + "', '" + DRE_FindLevel_1.ClientID + "');";
			arrayVals += "dreArray[1] = new Array('Left','Base','" + DRE_FindResult_2.Value + "','" + DRE_FindExtension_2.Value + "', '" + DRE_FindResult_2.ClientID + "', '" + DRE_FindExtension_2.ClientID + "', '" + DRE_FindSide_2.ClientID + "', '" + DRE_FindLevel_2.ClientID + "');";
			arrayVals += "dreArray[2] = new Array('Left','Mid','" + DRE_FindResult_3.Value + "','" + DRE_FindExtension_3.Value + "', '" + DRE_FindResult_3.ClientID + "', '" + DRE_FindExtension_3.ClientID + "', '" + DRE_FindSide_3.ClientID + "', '" + DRE_FindLevel_3.ClientID + "');";
			arrayVals += "dreArray[3] = new Array('Left','Apex','" + DRE_FindResult_4.Value + "','" + DRE_FindExtension_4.Value + "', '" + DRE_FindResult_4.ClientID + "', '" + DRE_FindExtension_4.ClientID + "', '" + DRE_FindSide_4.ClientID + "', '" + DRE_FindLevel_4.ClientID + "');";
			arrayVals += "dreArray[4] = new Array('Right','SV','" + DRE_FindResult_5.Value + "','" + DRE_FindExtension_5.Value + "', '" + DRE_FindResult_5.ClientID + "', '" + DRE_FindExtension_5.ClientID + "', '" + DRE_FindSide_5.ClientID + "', '" + DRE_FindLevel_5.ClientID + "');";
			arrayVals += "dreArray[5] = new Array('Right','Base','" + DRE_FindResult_6.Value + "','" + DRE_FindExtension_6.Value + "', '" + DRE_FindResult_6.ClientID + "', '" + DRE_FindExtension_6.ClientID + "', '" + DRE_FindSide_6.ClientID + "', '" + DRE_FindLevel_6.ClientID + "');";
			arrayVals += "dreArray[6] = new Array('Right','Mid','" + DRE_FindResult_7.Value + "','" + DRE_FindExtension_7.Value + "', '" + DRE_FindResult_7.ClientID + "', '" + DRE_FindExtension_7.ClientID + "', '" + DRE_FindSide_7.ClientID + "', '" + DRE_FindLevel_7.ClientID + "');";
			arrayVals += "dreArray[7] = new Array('Right','Apex','" + DRE_FindResult_8.Value + "','" + DRE_FindExtension_8.Value + "', '" + DRE_FindResult_8.ClientID + "', '" + DRE_FindExtension_8.ClientID + "', '" + DRE_FindSide_8.ClientID + "', '" + DRE_FindLevel_8.ClientID + "');</script>";
			
			Page.RegisterClientScriptBlock("abc", arrayVals);
			
			SetImageOpacity();



			object o_phy = Session[SessionKey.CurrentListCrit];
			object o_dt = Session[SessionKey.CurrentClinicDate];
			object o_mrn = Session[SessionKey.PtMRN];

			if (o_phy != null && o_dt != null && o_mrn != null)
			{	
				if (ClinStageDateText.Value == null || ClinStageDateText.Value.Length < 1)
				{
					AddClinStageDate(o_mrn.ToString(), o_phy.ToString(), DateTime.Parse(o_dt.ToString()));
				}
			}


			DreResultFieldId.Text = DRE_Result.ClientID;
		}


		protected void SetImageOpacity()
		{
			SetImageScript.Text = "<script>";

            if (DRE_FindResult_1.Value.ToUpper() == "DEFINITE")
			{
				SetImageScript.Text += "setOpacity('DiagramLeftSV', 100);";
			}

			SetImageScript.Text += "</script>";
		}


		// Checks to see if the appointment data in session is in the database
		private void AddClinStageDate(string mrn, string physician, DateTime clinicDate)
		{
			string cmdText = "SELECT * FROM Appointments WHERE ApptMRN = @ApptMRN And ApptPhysician = @ApptPhysician And ApptClinicDate = @ApptClinicDate";
			
			SqlCommand cmd = DataAccessHelper.CreateCommand(cmdText);
			cmd.CommandType = CommandType.Text;

			cmd.Parameters.Add("@ApptMRN", mrn);
			cmd.Parameters.Add("@ApptPhysician", physician);
			cmd.Parameters.Add("@ApptClinicDate", clinicDate);

			DataTable table = new DataTable();
			DataAccessHelper.GetList(cmd, table);

			if (table.Rows.Count > 0)
			{
				DataRow row = table.Rows[0];

                string clinicDateString = clinicDate.ToShortDateString();
				ClinStageDateText.Value = clinicDateString;
				ClinStageDate.Value = clinicDateString;
				// re-disable ClinStageDate
				ClinStageDate.Disabled = true;
			}
		}




	}
}
