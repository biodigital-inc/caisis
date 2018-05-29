namespace Caisis.UI.Modules.Prostate.Eforms
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
    ///		Summary description for ChiefComplaint_AS_Status.
	/// </summary>
    public partial class ChiefComplaint_AS_Status : BaseEFormControl
	{

		protected override void Page_Load(object sender, EventArgs e)
		{
			//if (!Page.IsPostBack)
			//{
			//	this.LoadPhysicianList();
			//}

			base.Page_Load (sender, e);
			
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

            AddActiveSurveillanceStatus();
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


        // add an active surveillance record to Caisis if the patient doesn't already have one
        private void AddActiveSurveillanceStatus()
        {

            StatusDa sDa = new StatusDa();
            DataSet sDs = sDa.GetStatus(this._patientId, "Prostate%");
            bool ASRecordExists = false;

            if (sDs.Tables.Count > 0 && sDs.Tables[0].Rows.Count > 0)
            {
                DataView sDv = new DataView(sDs.Tables[0]);
                sDv.RowFilter = BOL.Status.Status_Field + " IN ('Active Surveillance', 'Watchful Waiting') and " + BOL.Status.StatusDate + " IS NOT NULL";

                if (sDv.Count > 0) ASRecordExists = true;
            }


            if (!ASRecordExists)
            {
//                ActiveSurveillanceStatusMsg.Visible = true;
                ASStatus.Visible = true;
            }

        }
	}
}
