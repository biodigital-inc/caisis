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
    ///		Summary description for Spine Tx Plan
    /// </summary>
    public partial class SpineTxPlan : BaseEFormControl
    {
        protected override void Page_Load(object sender, EventArgs e)
        {
            base.Page_Load(sender, e);
            GetActions();
            GetAliveStatus();


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
                
                string clinicDateString = clinicDate.ToShortDateString();
                EncDateText_1.Text = clinicDateString;
                EncDate_1.Value = clinicDateString;
            }
        }

        protected void GetActions()
        {
            DataView view = BusinessObject.GetByParentAsDataView<BOL.Action>(_patientId);
            if (view.Count >= 1)
            {
                PDFormDiv.Style.Add("display", "block");

                SpineActionsRpt.DataSource = view;
                SpineActionsRpt.DataBind();
            }
            else
            {
                NoSpineActionsMsgTr.Style.Add("display", "block");
            }
        }

        protected void GetAliveStatus()
        {
            StatusDa da = new StatusDa();
            DataSet ds = da.GetStatusField(_patientId, "Alive");
            DataView view = ds.Tables[0].DefaultView;
            if (view.Count >= 1)
            {
                SpineLastKnownAliveRpt.DataSource = view;
                SpineLastKnownAliveRpt.DataBind();
            }
        }
    }
}