namespace Caisis.UI.Modules.Prostate.Eforms
{
	using System;
	using System.Data;
	using System.Drawing;
	using System.Web;
	using System.Web.UI.WebControls;
	using System.Web.UI.HtmlControls;

	using Caisis.BOL;
	using Caisis.UI.Core.Classes;
    //2.0 	using Caisis.UI.Modules.Prostate.PaperForms;
    using Caisis.DataAccess;
    using System.Data.SqlClient;


	/// <summary>
	///		Summary description for ProstateHPI.
	/// </summary>
    public partial class ProstateQOL : BaseEFormControl
	{


		override protected void Page_Load(object sender, System.EventArgs e)
		{
			base.Page_Load(sender, e);

            object o_phy = Session[SessionKey.CurrentListCrit];
            object o_dt = Session[SessionKey.CurrentClinicDate];
            object o_mrn = Session[SessionKey.PtMRN];

            if (o_phy != null && o_dt != null && o_mrn != null)
            {
                string clinicDateString = GetAppointmentDateString(o_mrn.ToString(), o_phy.ToString(), DateTime.Parse(o_dt.ToString()));

                if (clinicDateString != null)
                {
                    if (SurveyDateText_1.Value == null || SurveyDateText_1.Value.Length < 1)
                    {
                        SurveyDate_1.Value = clinicDateString;
                        SurveyDateText_1.Value = clinicDateString;
                        SurveyDate_1.Disabled = true;
                    }
                }
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


	}
}
