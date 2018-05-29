using System;
using System.Collections;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Web;
using System.Web.SessionState;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using System.Web.UI.DataVisualization.Charting;
using System.Data.SqlClient;
using System.Linq;

using Caisis.Security;
using Caisis.DataAccess;
using Caisis.BOL;
using Caisis.UI.Core.Classes;
using Caisis.Controller;

namespace Caisis.UI.Modules.All.Reports
{
    /// <summary>
    /// Summary description for PatientOverviewReport.
    /// </summary>

    public partial class PatientOverviewReport : BaseReportPage
    {
        //Constant set to determine when to start the next HPI column based on the number of rows KR
        protected static int NumHpiRowsAllowed = 10;

        protected string patientName;
        protected string reportTitle;

        protected Repeater rptNarrative;

        protected int recordCount;

        public override string ReportTitle
        {
            get
            {
                return reportTitle;
            }
        }

        override protected void Page_Load(object sender, System.EventArgs e)
        {
            if (Session[SessionKey.PatientId] != null && !Session[SessionKey.PatientId].ToString().Equals(""))
            {
                int patientID = (int)Session[SessionKey.PatientId];

                SecurityController sc = new SecurityController();
                string userName = sc.GetUserName();

                reportTitle = "Patient Summary Report";
                PatientController pc = new PatientController();
                Patient p = new Patient();
                p.Get(patientID);
                patientName = pc.GetPatientName(p, true) + " " + pc.GetPatientMRN(p) + " " + System.DateTime.Now;
                //patientName = Session[SessionKey.PtFirstName].ToString() + " " + Session[SessionKey.PtLastName].ToString() + "&nbsp;&nbsp;&nbsp;MRN:&nbsp;" + Session[SessionKey.PtMRN].ToString() + "&nbsp;&nbsp;&nbsp;&nbsp;" + System.DateTime.Now;

                //Narrator
                //Narrative narrative  = new Narrative();
                //narrative.GetByParent(patientID);
                //narrative.DataSourceView.Sort = "EnteredTime DESC"; 
                //rptNarrator.DataSource = narrative.DataSourceView;
                DataView narrative = BusinessObject.GetByParentAsDataView<Narrative>(patientID);
                narrative.Sort = "EnteredTime DESC";
                rptNarrator.DataSource = narrative;
                rptNarrator.DataBind();


                //Allergies
                //Allergy allergy		= new Allergy();
                //allergy.GetByParent(patientID);
                //rptAllergies.DataSource = allergy.DataSourceView;
                rptAllergies.DataSource = BusinessObject.GetByParentAsDataView<Allergy>(patientID);
                rptAllergies.DataBind();

                //Medications
                //Medication med		= new Medication();
                //med.GetByParent(patientID);
                //rptMedications.DataSource = med.DataSourceView;
                rptMedications.DataSource = BusinessObject.GetByParentAsDataView<Medication>(patientID);
                rptMedications.DataBind();

                //Comorbidities
                //Comorbidity com		= new Comorbidity();
                //com.GetByParent(patientID);
                //rptComorbidities.DataSource = com.DataSourceView;
                rptComorbidities.DataSource = BusinessObject.GetByParentAsDataView<Comorbidity>(patientID);
                rptComorbidities.DataBind();

                //HPI SUmmary
                PatientDa hpiDa = new PatientDa();
                DataSet hpiDs = hpiDa.GetPatientHPI(patientID, 0, 0);
                //DataSet hpiDs = DataAccessHelper.GetList(phiCom);
                rptHPI.DataSource = hpiDs.Tables[0].DefaultView;
                rptHPI.DataBind();
                //nomograms are in a second result set
                //preRPNomo.Text = hpiDs.Tables[1].Rows[0]["preRPNomo"].ToString();
                //preXRTNomo.Text = hpiDs.Tables[1].Rows[0]["preXRTNomo"].ToString();
                //preBrachyNomo.Text = hpiDs.Tables[1].Rows[0]["preBrachyNomo"].ToString();
                //postRP2yrNomo.Text = hpiDs.Tables[1].Rows[0]["postRP2yrNomo"].ToString();
                //postRP5yrNomo.Text = hpiDs.Tables[1].Rows[0]["postRP5yrNomo"].ToString();
                //postRP7yrNomo.Text = hpiDs.Tables[1].Rows[0]["postRP7yrNomo"].ToString();

                NomogramDa nda = new NomogramDa();

                try
                {
                    preRP5Nomo.Text = ((int)Math.Round(nda.GetPreRPResult(patientID, 5), 0)).ToString();
                }
                catch { }

                try
                {
                    preRP10Nomo.Text = ((int)Math.Round(nda.GetPreRPResult(patientID, 10), 0)).ToString();
                }
                catch { }

                try
                {
                    preXRTNomo.Text = ((int)Math.Round(nda.GetPreXRTResult(patientID), 0)).ToString();
                }
                catch { }

                try
                {
                    preBrachyNomo.Text = ((int)Math.Round(nda.GetPreBrachyResult(patientID), 0)).ToString();
                }
                catch { }

                try
                {
                    postRP2yrNomo.Text = ((int)Math.Round(nda.GetPostRPResult(patientID, 2), 0)).ToString();
                }
                catch { }

                try
                {
                    postRP5yrNomo.Text = ((int)Math.Round(nda.GetPostRPResult(patientID, 5), 0)).ToString();
                }
                catch { }

                try
                {
                    postRP7yrNomo.Text = ((int)Math.Round(nda.GetPostRPResult(patientID, 7), 0)).ToString();
                }
                catch { }

                try
                {
                    postRP10yrNomo.Text = ((int)Math.Round(nda.GetPostRPResult(patientID, 10), 0)).ToString();
                }
                catch { }


                //Chron List: displays most relevant/common list
                BuildChronList(sender, e);

                // build charts
                BuildChart();

                // log view
                base.LogReportView();
            }
            else // no patient in session
            {
                patientName = "Please select a patient before generating this report.";
            }

            SetControlsVisibility();

        }

        protected void BuildChronList(object sender, EventArgs e)
        {
            if (Session[SessionKey.PatientId] != null && !Session[SessionKey.PatientId].ToString().Equals(""))
            {
                
                string chronListType = ChronType.SelectedValue;
                int patientID = (int)Session[SessionKey.PatientId];

                ChronoDa da = new ChronoDa();
                DataSet ds = da.GetChronoList(patientID, chronListType, User.Identity.Name);

                rptChrono.DataSource = ds.Tables[0].DefaultView;
                rptChrono.DataBind();
                recordCount = ds.Tables[0].Rows.Count;
            }
        }

        /// <summary>
        /// Builds generic lab graph
        /// </summary>
        protected void BuildChart()
        {
           
           
            SessionHandler sh = new SessionHandler(Session);
            int patientId = sh.GetPatientId();
            int count = LabTest.Count<LabTest>(new Dictionary<string, object>
                {
                    { LabTest.PatientId, int.Parse(Session[SessionKey.PatientId].ToString()) }
                });
            if (count == 0)
            {
                LabChartPanel.Visible = false;
                LabChartLabel.Text = "Lab Tests: None Recorded";
            }
        }

        /// <summary>
        /// Sets the visibility of special sections by query string
        /// </summary>
        private void SetControlsVisibility()
        {
            // set nomogram visibility            
            string viewMode = GetDiseaseView();
            if (viewMode.Equals("Prostate", StringComparison.CurrentCultureIgnoreCase))
            {
                NomogramTable.Visible = true;
            }
            else
            {
                string showNomogram = Request.QueryString["nomogram"];
                NomogramTable.Visible = !string.IsNullOrEmpty(showNomogram) ? bool.Parse(showNomogram) : false;
            }
            // set narrative visibility
            NarrativeTable.Visible = rptNarrator.Items.Count > 0;

            // set medications
            MedicationsTable.Visible = rptMedications.Items.Count > 0;
        }

        /// <summary>
        /// Gets the current disease view
        /// </summary>
        /// <returns></returns>
        private string GetDiseaseView()
        {
            Caisis.Security.SecurityController sc = new Caisis.Security.SecurityController();
            string viewMode = sc.GetViewMode();
            return viewMode;
        }
    }

}


