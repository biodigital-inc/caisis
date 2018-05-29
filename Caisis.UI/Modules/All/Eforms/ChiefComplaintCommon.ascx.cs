namespace Caisis.UI.Modules.All.Eforms
{
	using System;
	using System.Data;
	using System.Data.SqlClient;
	using System.Drawing;
	using System.Web;
	using System.Web.UI.WebControls;
	using System.Web.UI.HtmlControls;

	using Caisis.UI.Core.Classes;
	using Caisis.UI.Core.Classes.CustomControls;
	using Caisis.DataAccess;

	/// <summary>
    ///		Summary description for ChiefComplaintCommon.
	/// </summary>
    public partial class ChiefComplaintCommon : BaseEFormControl
	{

		protected override void Page_Load(object sender, EventArgs e)
		{

			base.Page_Load (sender, e);
            base.SetTitle(ComponentTitle);


			
			// UPDATE THIS TO USER EFORMCONTROLLER.VALIDATESESSIONAPPOINTMENTDATA
			object o_phy = Session[SessionKey.CurrentListCrit];
			object o_dt = Session[SessionKey.CurrentClinicDate];
			object o_mrn = Session[SessionKey.PtMRN];

			if (o_phy != null && o_dt != null && o_mrn != null)
			{	
				// IS THIS RIGHT? 
				if (EncDateText.Text == null || EncDateText.Text == "")
				{
					ValidateSessionAppointmentData(o_mrn.ToString(), o_phy.ToString(), DateTime.Parse(o_dt.ToString()));
				}
			}
		}

		// Checks to see if the appointment data in session is in the database
		private void ValidateSessionAppointmentData(string mrn, string physician, DateTime clinicDate)
		{
			EFormsDa da = new EFormsDa();

			// UPDATE this to reference eformcontroller method
			DataTable table = da.GetPatientAppointmentRecord(mrn, physician, clinicDate);

			if (table.Rows.Count > 0)
			{
				DataRow row = table.Rows[0];
				// populate controls with appointment data
				object objApptVisitType = row["ApptVisitType"];
				if (objApptVisitType != DBNull.Value)
				{
					EncType.Value = row["ApptVisitType"].ToString();
				}
				
				//if (EncPhysician.Items.FindByValue(physician) == null)
				//{
				//	EncPhysician.Items.Add(new ListItem(physician, physician));
				//}

				//EncPhysician.SelectedValue = physician;

                EncPhysician.Value = physician;

                string clinicDateString = clinicDate.ToShortDateString();
				EncDateText.Text = clinicDateString;
				EncDate.Value = clinicDateString;
			}
		}

        //private void LoadPhysicianList()
        //{
        //    AppointmentDa aptDa = new AppointmentDa();

        //    EncPhysician.DataSource = aptDa.GetDistinctAppointmentPhysicians().Tables[0].DefaultView;
        //    EncPhysician.DataTextField = "ApptPhysician";
        //    EncPhysician.DataValueField = "ApptPhysician";
			
        //    EncPhysician.DataBind();
        //    EncPhysician.Items.Insert(0,new ListItem("",""));
            
        //}
	}
}
