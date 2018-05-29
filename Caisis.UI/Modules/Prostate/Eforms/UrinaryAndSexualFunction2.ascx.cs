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
    //2.0 	using Caisis.UI.Modules.Prostate.PaperForms;
	using Caisis.DataAccess;
	using Caisis.UI.Core.Classes.CustomControls;

	using System.Collections;


	/// <summary>
    ///		Summary description for UrinaryAndSexualFunction2.
	/// </summary>
    public partial class UrinaryAndSexualFunction2 : BaseEFormControl
	{
		protected EformTextBox DateMildContinenceAchieved, DateTotalContinenceAchieved;

		// protected Literal Inc_Stub, Stric_Stub;




		override protected void Page_Load(object sender, System.EventArgs e)
		{
			base.Page_Load(sender, e);

			PopulateContinenceFields();
            PopulatePotencyFields();
            base.BuildQOL_Therapy(this._patientId, this._eformName, "Dynamic");

			object o_phy = Session[SessionKey.CurrentListCrit];
			object o_dt = Session[SessionKey.CurrentClinicDate];
			object o_mrn = Session[SessionKey.PtMRN];

			if (o_phy != null && o_dt != null && o_mrn != null)
			{	
				string clinicDateString = GetAppointmentDateString(o_mrn.ToString(), o_phy.ToString(), DateTime.Parse(o_dt.ToString()));
				
				if (clinicDateString != null)
				{

					if (SurveyDateText_2.Value == null || SurveyDateText_2.Value.Length < 1)
					{
						SurveyDate_2.Value = clinicDateString;
						SurveyDateText_2.Value = clinicDateString;
						SurveyDate_2.Disabled = true;
					}

					if (SurveyDateText_IPSS.Value == null || SurveyDateText_IPSS.Value.Length < 1)
					{
						SurveyDate_IPSS.Value = clinicDateString;
						SurveyDateText_IPSS.Value = clinicDateString;
						SurveyDate_IPSS.Disabled = true;
					}

                    if (SurveyDateText_3.Value == null || SurveyDateText_3.Value.Length < 1)
                    {
                        SurveyDateText_3.Value = clinicDateString;
                        SurveyDate_3.Value = clinicDateString;
                        SurveyDate_3.Disabled = true;
                    }


				}
			}
		}

		protected void PopulateContinenceFields()
		{
			SurveyDa urinaryDa = new SurveyDa();
			Hashtable ht = urinaryDa.FormGetUrinaryStatusValues(this._patientId, this._eformName, "Dynamic");
			if (ht["ContLv2"] != null && ht["ContLv2"].ToString() != "")
			{
//				DateMildContinenceAchieved.Text = ht["ContLv2"].ToString();
//				DateMildContinenceAchieved.ReadOnly = true;

                DateMildContinenceAchievedLabel.Text = "Mild Continence (Score 2 for Continence) was previously achieved on " + ht["ContLv2"].ToString() + ".";
				PastMildContinenceRow.Visible = false;
			}
			if (ht["ContLv1"] != null && ht["ContLv1"].ToString() != "")
			{
//				DateTotalContinenceAchieved.Text = ht["ContLv1"].ToString();
//				DateTotalContinenceAchieved.ReadOnly = true;

                DateTotalContinenceAchievedLabel.Text = "Total Continence (Score 1 for Continence) was previously achieved on " + ht["ContLv1"].ToString() + ".";
				PastTotalContinenceRow.Visible = false;
			}
			if (ht["LastCont"] != null && ht["LastCont"].ToString() != "")
			{
				LastCont.Text = "<br/><br/>" + ht["LastCont"].ToString();
			}
				else
				{
					LastCont.Visible = false;
				}
			if (ht["LastIncontTx"] != null && ht["LastIncontTx"].ToString() != "")
			{
				LastIncontTx.Text = "<br/><br/>" + ht["LastIncontTx"].ToString();
			}
				else
				{
					LastIncontTx.Visible = false;
				}
			if (ht["UrinaryQOL"] != null && ht["UrinaryQOL"].ToString() != "")
			{
				UrinaryQOL.Text = ht["UrinaryQOL"].ToString();
			}
			else
			{
				LastUrinaryQOLRow.Visible = false;
			}
		}

		// Checks to see if the appointment data in session is in the database
		private string GetAppointmentDateString(string mrn, string physician, DateTime clinicDate)
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

                return clinicDate.ToShortDateString();
			}

			return null;
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

                DateFullNormalErectionAchievedLabel.Text = "Full, Normal Erection (Score 1 for Erectile Function) was previously achieved on " + ht["PotLv1"].ToString() + ".";
                PastFullNormalRow.Visible = false;
            }
        }


 


	}
}
