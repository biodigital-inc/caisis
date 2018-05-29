using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using Caisis.BOL;
using Caisis.DataAccess;
using Caisis.Extensions;
using Caisis.UI.Core.Classes;
using Caisis.UI.Core.Utilities;

using Caisis.UI.Modules.Breast.Reports;

namespace Caisis.UI.Modules.Breast.PaperForms
{
    public partial class BreastSurgeryClinicalSummary : BaseBreastQFormControl
    {
        private string _reportTitle = "";

        private readonly string[] LUMPECTOMY_SURVEYS = new string[]
        {
            "Lumpectomy Preop",  
            "Lumpectomy 2 Weeks",
            "Lumpectomy 6 Weeks",
            "Lumpectomy 3 Months",
            "Lumpectomy 6 Months",
            "Lumpectomy Yearly"
        };

        private readonly Dictionary<string, IEnumerable<string>> ALIAS_TO_SURVEYS = new Dictionary<string, IEnumerable<string>>
        {          
            {
                "Breast Q: Mastectomy Pre",
                new string[]
                {
                    "Mastectomy Preop"
                }
            },
            {
                "Breast Q: Mastectomy Post",
                new string[]
                {
                    "Mastectomy 2 weeks",
                    "Mastectomy 6 weeks",
                    "Mastectomy 3 months",
                    "Mastectomy 6 months",
                    "Mastectomy yearly"
                }
            }
        };

        private static readonly IEnumerable<string> BREAST_PROCEDURES = new string[] { "Mastectomy", "Lumpectomy" };

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

        public BreastSurgeryClinicalSummary()
            : base()
        {
            // override
            scleChartXAxisLabel = "SurveyDate";
        }

        protected override void Page_Load(object sender, EventArgs e)
        {
            base.Page_Load(sender, e);
            if (base.patientID > -1)
            {
                BuildReport();
            }
        }

        public void BuildReport()
        {
            // build patient details
            BuildProcesureDetails(this, base.patientID);

            // declare required filters
            List<BreastQPoint> points = new List<BreastQPoint>();
            string reportSurveyMatchType = "";

            // TODO: Combine static listings with lookup surveys
            var SearchSurveys = LUMPECTOMY_SURVEYS.ToDictionary(s => s, s => new string[] { s });
            foreach (string alias in ALIAS_TO_SURVEYS.Keys)
            {
                var surveys = ALIAS_TO_SURVEYS[alias].ToArray();
                SearchSurveys.Add(alias, surveys);
            }

            // intelligently find BreastQ survey data
            foreach (var entry in SearchSurveys)
            {
                string surveyTypeAlias = entry.Key;
                foreach (string surveyType in entry.Value)
                {
                    var aliasedPoints = GetBreastQPointsByTypeByAlias(surveyType, surveyTypeAlias).ToList();
                    // TODO: fix survey type, embedd in engine
                    foreach (var p in aliasedPoints)
                        p.SurveyType = surveyType;
                    // TODO: exclude invalid scoring
                    // TODO: remove specific scales
                    var validPoints = from s in aliasedPoints
                                      where s.ScaleScore > -1
                                      // TODO: validate scoring error
                                      where s.ScaleScore > 0
                                      //where s.ScaleErrorCode == QScoreLibrary.Estimation.eErrors.eNoError
                                      where !s.ScaleName.Equals("Satisfaction with Lumpectomy", StringComparison.OrdinalIgnoreCase)
                                      select s;
                    points.AddRange(validPoints);
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

        protected void BuildProcesureDetails(Control panel, int patientId)
        {
            Patient patient = new Patient();
            patient.Get(patientId);
            // procedure
            var allProcedures = BusinessObject.GetByFields<Procedure>(new Dictionary<string, object> { { Procedure.PatientId, patientId } });
            // filter procedure types
            var procedures = from bp in BREAST_PROCEDURES
                             from proc in allProcedures
                             let procName = proc[Procedure.ProcName].ToString()
                             where procName.Contains(bp)
                             select proc;
            // format Procedures
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
            // chemo: special case, 1 > records: yes, 0 = no
            var chemo = BusinessObject.GetByFields<MedicalTherapy>(new Dictionary<string, object> { { MedicalTherapy.PatientId, patientId }, { MedicalTherapy.MedTxType, "CHEMO" } }).Cast<IBusinessObject>();
            Label chemoLabel = panel.FindControl("ChemotherapyLabel") as Label;
            string chemoText = chemo.Count() > 0 ? "Yes" : "None Recorded";
            chemoLabel.Text = chemoText;
            //chemoLabel.Text = FormatListOutput(MedicalTherapy.MedTxAgent, MedicalTherapy.MedTxDate, chemo);
        }

        protected override string GetXAxisLabel(string xAxisLabel, string surveyType, DateTime surveyDate)
        {
            if (surveyType.IndexOf("Preop", StringComparison.OrdinalIgnoreCase) > -1)
                return "Pre-Op";
            else
                return surveyDate.ToShortDateString();
        }
    }
}