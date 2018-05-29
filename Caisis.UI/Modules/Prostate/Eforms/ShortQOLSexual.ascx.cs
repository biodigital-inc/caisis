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
	using Caisis.UI.Core.Classes.CustomControls;
	//2.0 using Caisis.UI.Modules.Prostate.PaperForms;
	using Caisis.DataAccess;

	using System.Collections;


	/// <summary>
	///		Summary description for ProstateHPI.
	/// </summary>
	public partial class ShortQOLSexual : BaseEFormControl
	{




		override protected void Page_Load(object sender, System.EventArgs e)
		{
			base.Page_Load(sender, e);
			base.BuildQOL_Therapy(this._patientId, this._eformName, "Dynamic");
			PopulatePotencyFields();

			object o_phy = Session[SessionKey.CurrentListCrit];
			object o_dt = Session[SessionKey.CurrentClinicDate];
			object o_mrn = Session[SessionKey.PtMRN];

			if (o_phy != null && o_dt != null && o_mrn != null)
			{	
				if (SurveyDateText_3.Value == null || SurveyDateText_3.Value.Length < 1)
				{
					AddSurveyDate(o_mrn.ToString(), o_phy.ToString(), DateTime.Parse(o_dt.ToString()));
				}
			}
		}

		protected void PopulatePotencyFields()
		{
			SurveyDa potencyDa = new SurveyDa();
			Hashtable ht = potencyDa.FormGetPotencyStatusValues(this._patientId, this._eformName, "Dynamic");


/*			this is populating in the HPI control right now.  -jf
			if (ht["PreTxPot"] != null && ht["PreTxPot"].ToString() != "")
			{
				PreTxPot.Text = "<br/><br/>" + ht["PreTxPot"].ToString();
			}
*/
			if (ht["LastPot"] != null && ht["LastPot"].ToString() != "")
			{
				LastPot.Text = "<br/><br/>" + ht["LastPot"].ToString();
			}
			if (ht["SexualQOL"] != null && ht["SexualQOL"].ToString() != "")
			{
				SexualQOL.Text = ht["SexualQOL"].ToString();
			}
				else
				{
					LastSexualQOLRow.Visible = false;
				}
			if (ht["PotLv3"] != null && ht["PotLv3"].ToString() != "")
			{
//				DatePartialErectionAchieved.Text = ht["PotLv3"].ToString();
//				DatePartialErectionAchieved.ReadOnly = true;

                DatePartialErectionAchievedLabel.Text = "Partial Erection (Score 3 for Erectile Function) was previously achieved on " + ht["PotLv3"].ToString() + ".";

				PastPartialErectionRow.Visible = false;
				

			}
			if (ht["PotLv2"] != null && ht["PotLv2"].ToString() != "")
			{
//				DateFullRecentlyDiminishedErectionAchieved.Text = ht["PotLv2"].ToString();
//				DateFullRecentlyDiminishedErectionAchieved.ReadOnly = true;

                DateFullRecentlyDiminishedErectionAchievedLabel.Text = "Full but Recently Diminished Erection (Score 2 for Erectile Function)<br/>was previously achieved on " + ht["PotLv2"].ToString() + ".";
				PastFullRecentlyDiminishedRow.Visible = false;


			}
			if (ht["PotLv1"] != null && ht["PotLv1"].ToString() != "")
			{
//				DateFullNormalErectionAchieved.Text = ht["PotLv1"].ToString();
//				DateFullNormalErectionAchieved.ReadOnly = true;

				DateFullNormalErectionAchievedLabel.Text = ht["PotLv1"].ToString();
				PastFullNormalRow.Visible = false;
			}		
		}

		private void AddSurveyDate(string mrn, string physician, DateTime clinicDate)
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
				SurveyDateText_3.Value = clinicDateString;
				SurveyDate_3.Value = clinicDateString;
				SurveyDate_3.Disabled = true;
			}
		}


	}
}
