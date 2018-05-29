namespace Caisis.UI.Modules.Neuro.Eforms
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
    using Caisis.DataAccess;

    /// <summary>
    ///		Summary description for Spine Encounters
    /// </summary>
    public partial class SpineEncounters : BaseEFormControl
    {
        protected override void Page_Load(object sender, EventArgs e)
        {
            base.Page_Load(sender, e);

            // UPDATE THIS TO USER EFORMCONTROLLER.VALIDATESESSIONAPPOINTMENTDATA
            object o_phy = Session[SessionKey.CurrentListCrit];
            object o_dt = Session[SessionKey.CurrentClinicDate];
            object o_mrn = Session[SessionKey.PtMRN];

            if (o_phy != null && o_dt != null && o_mrn != null)
            {
                // IS THIS RIGHT? 
                if (EncDateText_1.Text == null || EncDateText_1.Text == "")
                {
                    ValidateSessionAppointmentData(o_mrn.ToString(), o_phy.ToString(), DateTime.Parse(o_dt.ToString()));
                }
            }

            //gets all existing encounters of the patient
            GetEncounters(this._patientId, this._eformName, "Dynamic");
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
                    EncType_1.Value = row["ApptVisitType"].ToString();
                }

                EncPhysician_1.Value = physician;

                string clinicDateString = clinicDate.ToShortDateString();
                EncDateText_1.Text = clinicDateString;
                EncDate_1.Value = clinicDateString;
            }
        }

        //gets prior encouters that are available
        protected void GetEncounters(int PatientID, string FormName, string FormType)
        {
            DataSet EncDS, EncROSDS;
            EncounterDa EncDa = new EncounterDa();
            EncDS = EncDa.FormGetRecords(PatientID, FormName, FormType);
            EncROSDS = EncDa.FormGetEncROSRecords(PatientID, FormName, FormType);

            if (EncDS.Tables.Count > 0 && EncDS.Tables[0].Rows.Count > 0)
            {
                PDFormDiv.Style.Add("display", "block");

                EncDS.Tables[0].TableName = "Encounters";
                EncROSDS.Tables[0].TableName = "EncReviewOfSystems";

                DataSet EncROSCoreDs = new DataSet();
                EncROSCoreDs.Tables.Add(EncDS.Tables[0].Copy());
                EncROSCoreDs.Tables.Add(EncROSDS.Tables[0].Copy());

                EncROSCoreDs.Relations.Add("myrelation", EncROSCoreDs.Tables["Encounters"].Columns[Encounter.EncounterId], EncROSCoreDs.Tables["EncReviewOfSystems"].Columns[Encounter.EncounterId]);


                SpineEncountersRpt.DataSource = EncROSCoreDs.Tables["Encounters"].DefaultView;
                SpineEncountersRpt.DataBind();
            }
            else
            {
                NoSpineEncMsgTr.Style.Add("display", "block");
            }

        }

        override protected void EFormRepeaterOnDataBound(Object Sender, RepeaterItemEventArgs e)
        {

            base.EFormRepeaterOnDataBound(Sender, e);

            DataRowView dv = e.Item.DataItem as DataRowView;
            if (dv != null)
            {
                Repeater nestedRepeater = e.Item.FindControl("SpineROSRpt") as Repeater;
                if (nestedRepeater != null)
                {
                    nestedRepeater.DataSource = dv.CreateChildView("myrelation");
                    nestedRepeater.DataBind();
                }
            }
        }
    }
}