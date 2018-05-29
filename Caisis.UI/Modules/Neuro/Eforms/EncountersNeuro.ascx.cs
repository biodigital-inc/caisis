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
    ///		Summary description for Neuro Encounters
    /// </summary>
    public partial class EncountersNeuro : BaseEFormControl
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
            GetEncounters();

            //Auto-Calculate BSA and BMI
            ShowBSAandBMI();
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

        protected void GetEncounters()
        {
			DataView view = BusinessObject.GetByParentAsDataView<Encounter>(_patientId);
			if (view.Count >= 1)
            {
                PDFormDiv.Style.Add("display", "block");

				NeuroEncountersRpt.DataSource = view;
                NeuroEncountersRpt.DataBind();
            }
            else
            {
                NoNeuroEncMsgTr.Style.Add("display", "block");
            }
        }

        protected void ShowBSAandBMI()
        {
            AutoCalcBSAandBMI(Height_1, Weight_1, BSA_1, BMI_1);
            AutoCalcBSAandBMI(Height_2, Weight_2, BSA_2, BMI_2);
            AutoCalcBSAandBMI(Height_3, Weight_3, BSA_3, BMI_3);
            AutoCalcBSAandBMI(Height_4, Weight_4, BSA_4, BMI_4);
            AutoCalcBSAandBMI(Height_5, Weight_5, BSA_5, BMI_5);
            AutoCalcBSAandBMI(Height_6, Weight_6, BSA_6, BMI_6);
            AutoCalcBSAandBMI(Height_7, Weight_7, BSA_7, BMI_7);
            AutoCalcBSAandBMI(Height_8, Weight_8, BSA_8, BMI_8);
            AutoCalcBSAandBMI(Height_9, Weight_9, BSA_9, BMI_9);
            AutoCalcBSAandBMI(Height_10, Weight_10, BSA_10, BMI_10);
        }

        protected void AutoCalcBSAandBMI(EformTextBox Height, EformTextBox Weight, EformTextBox BSA, EformTextBox BMI)
        {
            // calculation in utilities.js 
            string strJS = "calculateBSAandBMI(" + BSA.ClientID + "," + BMI.ClientID + "," + Height.ClientID + ", " + Weight.ClientID + ");";

            Height.Attributes.Add("onblur", strJS);
            Weight.Attributes.Add("onblur", strJS);
        }

    }
}