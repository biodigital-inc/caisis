using System;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Runtime.Serialization;
using System.Web;
using System.Web.UI.DataVisualization.Charting;

using Caisis.BOL;
using Caisis.WebServices;

namespace Caisis.UI.Modules.Prostate.DataAnalysis
{
    /// <summary>
    /// Adapts PatientOutcomes for web service interaction.
    /// </summary>
    public class PatientOutcomesServiceAdapter
    {
        private PatientOutcomes outcomes;

        // singleton?
        // how do we refresh?
        // just get it working first, then enhance!!

        public PatientOutcomesServiceAdapter(string physicalApplicationPath)
        {
            outcomes = InitPatientOutcomes(physicalApplicationPath);
        }

        private PatientOutcomes InitPatientOutcomes(string path)
        {
            string modelFile = path + @"App_Data\RData\Prostate\Patient Model Results.csv";
            string knotFile = path + @"App_Data\RData\Prostate\Restricted Cubic Spline Knots.csv";
            string imputationFile = path + @"App_Data\RData\Prostate\Imputation Model Results.csv";

            return new PatientOutcomes(modelFile, knotFile, imputationFile);
        }

        // how do we return results? a strongly-typed object, or just a dump?

        #region model delineation
        // model example:
        //P.BCR.CGEN: 0.99734279892278
        //P.EF.CGEN.P3M: 12.7689009379505
        //P.EF.CGEN.P6M: 16.1174795758313
        //P.EF.CGEN.P9M: 24.4992966715502
        //P.EF.CGEN.P12M: 21.5931958860513
        //P.EF.CGEN.P15M: 20.9870177383643
        //P.EF.CGEN.P18M: 21.8571627894659
        //P.EF.CGEN.P21M: 20.7551006847298
        //P.EF.CGEN.P24M: 22.1243934644205
        //P.UF.CGEN.P3M: 15.4655629214505
        //P.UF.CGEN.P6M: 16.1604963171144
        //P.UF.CGEN.P9M: 18.1859175116919
        //P.UF.CGEN.P12M: 18.8054943386343
        //P.UF.CGEN.P15M: 18.5349527442064
        //P.UF.CGEN.P18M: 18.3828758662864
        //P.UF.CGEN.P21M: 19.6037067287658
        //P.UF.CGEN.P24M: 18.3798610347719
        //P.EF.CGEN.P1Y.B3M: 0.9913004013795
        //P.EF.CGEN.P1Y.B6M: 
        //P.EF.CGEN.P1Y.B9M: 0.998169714494574
        //P.UF.CGEN.P1Y.B3M: 0.995784585768139
        //P.UF.CGEN.P1Y.B6M: 
        //P.UF.CGEN.P1Y.B9M: 0.179566548176452
        #endregion

        public PatientOutcomesResults GetPatientOutcomes(string patientMRN)
        {
            Dictionary<string, object> d = 
                new Dictionary<string,object>()
                {
                    { Patient.PtMRN, patientMRN }
                };
            var query = BusinessObject.GetByFields<Patient>(d);

            if (query.Count() == 0)
            {
                throw new ArgumentException("Could not retrieve data for MRN:", "patientMRN");
            }

            int patientId = (int) query.First()[Patient.PatientId];

            return GetPatientOutcomes(patientId);
        }

        public PatientOutcomesResults GetPatientOutcomes(int patientId)
        {
            IDictionary<string, double?> rawResults = outcomes.CalculateOutcomes(patientId);

            PatientOutcomesResults results = new PatientOutcomesResults();

            foreach (string key in rawResults.Keys)
            {
                double? r = rawResults[key];

                switch (key)
                {
                    // return 5-year production; consistent with previous practice
                    // case "P.BCR.CGEN":
                    case "P.BCR.CGEN.0":
                        results.NomogramPredictionBaseline = r;
                        break;
                    case "P.BCR.CGEN.2":
                        results.NomogramPrediction2Year = r;
                        break;
                    case "P.BCR.CGEN.5":
                        results.BiochemicalRecurrenceRate = r;
                        results.NomogramPrediction5Year = r;
                        break;
                    case "P.BCR.CGEN.7":
                        results.NomogramPrediction7Year = r;
                        break;
                    case "P.BCR.CGEN.10":
                        results.NomogramPrediction10Year = r;
                        break;
                    case "P.EF.CGEN.P3M":
                        results.ErectileScore3Month = r;
                        break;
                    case "P.EF.CGEN.P6M":
                        results.ErectileScore6Month = r;
                        break;
                    case "P.EF.CGEN.P9M":
                        results.ErectileScore9Month = r;
                        break;
                    case "P.EF.CGEN.P12M":
                        results.ErectileScore12Month = r;
                        break;
                    case "P.EF.CGEN.P15M":
                        results.ErectileScore15Month = r;
                        break;
                    case "P.EF.CGEN.P18M":
                        results.ErectileScore18Month = r;
                        break;
                    case "P.EF.CGEN.P21M":
                        results.ErectileScore21Month = r;
                        break;
                    case "P.EF.CGEN.P24M":
                        results.ErectileScore24Month = r;
                        break;
                    case "P.UF.CGEN.P3M":
                        results.UrinaryScore3Month = r;
                        break;
                    case "P.UF.CGEN.P6M":
                        results.UrinaryScore6Month = r;
                        break;
                    case "P.UF.CGEN.P9M":
                        results.UrinaryScore9Month = r;
                        break;
                    case "P.UF.CGEN.P12M":
                        results.UrinaryScore12Month = r;
                        break;
                    case "P.UF.CGEN.P15M":
                        results.UrinaryScore15Month = r;
                        break;
                    case "P.UF.CGEN.P18M":
                        results.UrinaryScore18Month = r;
                        break;
                    case "P.UF.CGEN.P21M":
                        results.UrinaryScore21Month = r;
                        break;
                    case "P.UF.CGEN.P24M":
                        results.UrinaryScore24Month = r;
                        break;
                    case "P.EF.CGEN.P1Y.B3M":
                        results.ErectileRate1YearBasedOn3Month = r;
                        break;
                    case "P.EF.CGEN.P1Y.B6M":
                        results.ErectileRate1YearBasedOn6Month = r;
                        break;
                    case "P.EF.CGEN.P1Y.B9M":
                        results.ErectileRate1YearBasedOn9Month = r;
                        break;
                    case "P.UF.CGEN.P1Y.B3M":
                        results.UrinaryRate1YearBasedOn3Month = r;
                        break;
                    case "P.UF.CGEN.P1Y.B6M":
                        results.UrinaryRate1YearBasedOn6Month = r;
                        break;
                    case "P.UF.CGEN.P1Y.B9M":
                        results.UrinaryRate1YearBasedOn9Month = r;
                        break;
                }
            }

            return results;
        }

        public void AddErectileOutcomesToChart(Chart chart, PatientOutcomesResults results)
        {
            List<KeyValuePair<int, double?>> r = new List<KeyValuePair<int, double?>>()
            {
                new KeyValuePair<int, double?>(3, results.ErectileScore3Month),
                new KeyValuePair<int, double?>(6, results.ErectileScore6Month),
                new KeyValuePair<int, double?>(9, results.ErectileScore9Month),
                new KeyValuePair<int, double?>(12, results.ErectileScore12Month),
                new KeyValuePair<int, double?>(15, results.ErectileScore15Month),
                new KeyValuePair<int, double?>(18, results.ErectileScore18Month),
                new KeyValuePair<int, double?>(21, results.ErectileScore21Month),
                new KeyValuePair<int, double?>(24, results.ErectileScore24Month)
            };

            AddOutcomes(chart, r);
        }

        public void AddUrinaryOutcomesToChart(Chart chart, PatientOutcomesResults results)
        {
            List<KeyValuePair<int, double?>> r = new List<KeyValuePair<int, double?>>()
            {
                new KeyValuePair<int, double?>(3, results.UrinaryScore3Month),
                new KeyValuePair<int, double?>(6, results.UrinaryScore6Month),
                new KeyValuePair<int, double?>(9, results.UrinaryScore9Month),
                new KeyValuePair<int, double?>(12, results.UrinaryScore12Month),
                new KeyValuePair<int, double?>(15, results.UrinaryScore15Month),
                new KeyValuePair<int, double?>(18, results.UrinaryScore18Month),
                new KeyValuePair<int, double?>(21, results.UrinaryScore21Month),
                new KeyValuePair<int, double?>(24, results.UrinaryScore24Month)
            };

            AddOutcomes(chart, r);
        }

        private void AddOutcomes(Chart chart, IEnumerable<KeyValuePair<int, double?>> results)
        {
            bool hasData = false;

            Series s = new Series("Expected");
            s.BorderDashStyle = ChartDashStyle.Dash;
            s.ChartType = SeriesChartType.Line;
            s.Color = Color.FromArgb(0x3D, 0x55, 0x6D);
            double? prevScore = null;

            foreach (var r in results)
            {
                int months = r.Key;
                double? score = r.Value;

                if (score.HasValue || prevScore.HasValue)
                {
                    double d = (int)Math.Max(score.HasValue ? score.Value : prevScore.Value, prevScore.HasValue ? prevScore.Value : score.Value);
                    s.Points.Add(new DataPoint(months, d));
                    prevScore = d;
                    hasData = true;
                }
            }

            if (hasData)
                chart.Series.Add(s);
        }
    }

    #region serialization
    [DataContract]
    public class PatientOutcomesResults
    {
        [DataMember]
        public double? BiochemicalRecurrenceRate;

        [DataMember]
        public double? ErectileScore3Month;

        [DataMember]
        public double? ErectileScore6Month;

        [DataMember]
        public double? ErectileScore9Month;

        [DataMember]
        public double? ErectileScore12Month;

        [DataMember]
        public double? ErectileScore15Month;

        [DataMember]
        public double? ErectileScore18Month;

        [DataMember]
        public double? ErectileScore21Month;

        [DataMember]
        public double? ErectileScore24Month;

        //[DataMember]
        //public double? ErectileScore36Month;

        //[DataMember]
        //public double? ErectileScore48Month;

        [DataMember]
        public double? ErectileRate1YearBasedOn3Month;

        [DataMember]
        public double? ErectileRate1YearBasedOn6Month;

        [DataMember]
        public double? ErectileRate1YearBasedOn9Month;

        //[DataMember]
        //public double? ErectileRate2YearBasedOn3Month;

        //[DataMember]
        //public double? ErectileRate2YearBasedOn6Month;

        //[DataMember]
        //public double? ErectileRate2YearBasedOn9Month;

        //[DataMember]
        //public double? ErectileRate2YearBasedOn12Month;

        //[DataMember]
        //public double? ErectileRate2YearBasedOn15Month;

        //[DataMember]
        //public double? ErectileRate2YearBasedOn18Month;

        //[DataMember]
        //public double? ErectileRate2YearBasedOn21Month;

        [DataMember]
        public double? UrinaryScore3Month;

        [DataMember]
        public double? UrinaryScore6Month;

        [DataMember]
        public double? UrinaryScore9Month;

        [DataMember]
        public double? UrinaryScore12Month;

        [DataMember]
        public double? UrinaryScore15Month;

        [DataMember]
        public double? UrinaryScore18Month;

        [DataMember]
        public double? UrinaryScore21Month;

        [DataMember]
        public double? UrinaryScore24Month;

        //[DataMember]
        //public double? UrinaryScore36Month;

        //[DataMember]
        //public double? UrinaryScore48Month;

        [DataMember]
        public double? UrinaryRate1YearBasedOn3Month;

        [DataMember]
        public double? UrinaryRate1YearBasedOn6Month;

        [DataMember]
        public double? UrinaryRate1YearBasedOn9Month;

        [DataMember]
        public double? NomogramPredictionBaseline;

        [DataMember]
        public double? NomogramPrediction2Year;

        [DataMember]
        public double? NomogramPrediction5Year;

        [DataMember]
        public double? NomogramPrediction7Year;

        [DataMember]
        public double? NomogramPrediction10Year;
    }
    #endregion
}
