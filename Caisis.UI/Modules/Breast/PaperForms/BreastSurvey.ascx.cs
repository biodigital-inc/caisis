using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.DataVisualization;
using System.Web.UI.DataVisualization.Charting;
using System.Drawing;

using Caisis.BOL;
using Caisis.DataAccess;
using Caisis.Extensions;
using Caisis.UI.Core.Classes;
using Caisis.UI.Core.Utilities;

using Caisis.UI.Modules.Breast.Reports;

namespace Caisis.UI.Modules.Breast.PaperForms
{
    public partial class BreastSurvey : BaseBreastQFormControl
    {
        private string _reportTitle = "";

        private static readonly string SURVEY_IMPLANTS = "Breast Q: Implants";
        private static readonly string SURVEY_TISSUE_EXPANDER = "Breast Q: Tissue Expander";
        private static readonly string SURVEY_TRAM = "Breast Q: Tram";

        private readonly string[] BREASTQ_SURVEY_NAMES = new string[]
        {
            SURVEY_TISSUE_EXPANDER,
            SURVEY_IMPLANTS,
            SURVEY_TRAM
        };

        public virtual string ReportTitle
        {
            get
            {
                return _reportTitle;
            }
            set
            {
                _reportTitle = value;
            }
        }

        public BreastSurvey()
            : base()
        {
            // overrides
            scleChartXAxisLabel = "SurveyTypeTitle";
        }

        protected override void Page_Load(object sender, EventArgs e)
        {
            base.Page_Load(sender, e);
            if (base.patientID > -1)
            {
                BuildReport();
            }
        }

        /// <summary>
        /// For the current Patient, build the BreastQ report
        /// </summary>
        public void BuildReport()
        {
            // build patient details
            BuildProcesureDetails(this, base.patientID);

            // declare required filters
            List<BreastQPoint> points = new List<BreastQPoint>();
            string reportSurveyMatchType = "";

            // intelligently find BreastQ survey data
            foreach (string surveyTypeMatch in BREASTQ_SURVEY_NAMES)
            {
                IEnumerable<BreastQPoint> surveyPoints = GetBreastQPointsByType(surveyTypeMatch);

                // found: use survey data
                if (surveyPoints.Count() > 0)
                {
                    // add points
                    points.AddRange(surveyPoints);

                    reportSurveyMatchType = surveyTypeMatch;
                    // special case: Tissue Expander + Implants, combine
                    if (surveyTypeMatch == SURVEY_TISSUE_EXPANDER)
                    {
                        IEnumerable<BreastQPoint> implantSurveyPoints = GetBreastQPointsByType(SURVEY_IMPLANTS);
                        points.AddRange(implantSurveyPoints);
                    }
                    // end search
                    break;
                }
            }
            // if survey data found, build report
            if (points.Count() > 0)
            {
                BuildReportCharts(ScalesRptr, NoSurveyMsg, reportSurveyMatchType, "", points);
            }
            // set title
            if (!string.IsNullOrEmpty(reportSurveyMatchType))
            {
                _reportTitle = reportSurveyMatchType;
            }
        }

        /// <summary>
        /// Populate the Patient's Procedure details
        /// </summary>
        /// <param name="panel"></param>
        /// <param name="patientId"></param>
        protected void BuildProcesureDetails(Control panel, int patientId)
        {
            Patient patient = new Patient();
            patient.Get(patientId);
            // procedure
            var allProcedures = BusinessObject.GetByFields<Procedure>(new Dictionary<string, object> { { Procedure.PatientId, patientId } });
            // filter procedures by CPT Codes
            var procedures = from procedure in allProcedures
                             let procName = procedure[Procedure.ProcName].ToString()
                             let cptCode = procedure[Procedure.ProcCPT_Code].ToString()
                             where !string.IsNullOrEmpty(cptCode) && PageUtil.IsInteger(cptCode)
                             let cpt = int.Parse(cptCode)
                             where BREASTQ_CPT_CODES.Keys.Contains(cpt)
                             select procedure;

            // procedures
            Label procLabel = panel.FindControl("ProceduresLabel") as Label;
            procLabel.Text = FormatListOutput(Procedure.ProcName, Procedure.ProcDate, procedures.Cast<IBusinessObject>());
            // tox
            var toxicities = BusinessObject.GetByFields<Toxicity>(new Dictionary<string, object> { { Toxicity.PatientId, patientId } }).Cast<IBusinessObject>();
            Label toxLabel = panel.FindControl("ToxicityLabel") as Label;
            toxLabel.Text = FormatListOutput(Toxicity.ToxName, Toxicity.ToxDate, toxicities);
            // radio
            var radiation = BusinessObject.GetByFields<RadiationTherapy>(new Dictionary<string, object> { { RadiationTherapy.PatientId, patientId } }).Cast<IBusinessObject>();
            Label radiationLabel = panel.FindControl("RadiationLabel") as Label;
            radiationLabel.Text = FormatListOutput(RadiationTherapy.RadTxType, RadiationTherapy.RadTxDate, radiation);
            // chemo
            var chemo = BusinessObject.GetByFields<MedicalTherapy>(new Dictionary<string, object> { { MedicalTherapy.PatientId, patientId }, { MedicalTherapy.MedTxType, "CHEMO" } }).Cast<IBusinessObject>();
            Label chemoLabel = panel.FindControl("ChemotherapyLabel") as Label;
            chemoLabel.Text = FormatListOutput(MedicalTherapy.MedTxAgent, MedicalTherapy.MedTxDate, chemo);
        }

    }
}
