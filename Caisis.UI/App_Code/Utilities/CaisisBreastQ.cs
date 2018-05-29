using System;
using System.Collections;
using System.Collections.Generic;
using System.Collections.Specialized;
using System.Data;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Xml;

// serialization
using System.Runtime.Serialization;

// BreastQ lib
using BreastQ;

using Caisis.DataAccess;
using Caisis.BOL;

namespace Caisis.UI.Core.Utilities
{
    public class CaisisBreastQEngine : BreastQEngine
    {
        /// <summary>
        /// The relative path to the xml mapping.
        /// </summary>
        private static readonly string BREAST_Q_FILE_PATH = "~/App_Data/Scoring.xml";

        /// <summary>
        /// The relative path to the manual scorning mappings
        /// </summary>
        private static readonly string MANUAL_SCORES_FILE = "~/App_Data/ManualScoring.xml";

        public CaisisBreastQEngine()
            : base(Caisis.UI.Core.Classes.XmlUtil.GetXmlDoc(BREAST_Q_FILE_PATH))
        {
            XmlDocument manualScoresXML = Caisis.UI.Core.Classes.XmlUtil.GetXmlDoc(MANUAL_SCORES_FILE);
            if (manualScoresXML != null)
                base.LoadManualScales(manualScoresXML);
        }
    }

    public class CaisisBreastQServices
    {
        private SurveyDa da;
        private CaisisBreastQEngine scoreUtil;
        private string datasetSQL;

        public CaisisBreastQServices(string datasetSQL)
        {
            this.da = new SurveyDa();
            this.scoreUtil = new CaisisBreastQEngine();
            this.datasetSQL = datasetSQL;
        }

        public IEnumerable<BreastQPoint> GetBreastQPointsByPatient(int patientId, string surveyType, string surveyTypeAlias, string[] questions)
        {
            string querySurveyType = !string.IsNullOrEmpty(surveyTypeAlias) ? surveyTypeAlias : surveyType;
            string surveyTitle = surveyType;
            List<BreastQPoint> patientPoints = new List<BreastQPoint>();
            Dictionary<int, List<int>> patientToSurveys = new Dictionary<int, List<int>>();
            // query db via raw SurveyType
            da.ConsumeBreastQSurveyDataByPatient(datasetSQL, patientId, surveyType, questions,
                    (record) =>
                    {
                        // score survey via normalized SurveyType
                        FillBreastQPoints(querySurveyType, surveyTitle, questions, patientPoints, patientToSurveys, record);
                        return true;
                    });
            return patientPoints;
        }

        public IEnumerable<BreastQPoint> GetBreastQPointsByPhysicians(string[] apptPhysicians, string surveyType, string[] questions, Dictionary<int, List<int>> patientsToSurveys)
        {
            // capture distinct points
            List<BreastQPoint> breastQPoints = new List<BreastQPoint>();

            // consume by Physician's patients
            if (apptPhysicians.Count() > 0)
            {
                da.ConsumeBreastQSurveyDataByPhysician(datasetSQL, apptPhysicians, surveyType, questions, (record) => { FillBreastQPoints(surveyType, surveyType, questions, breastQPoints, patientsToSurveys, record); return true; });
            }
            // consume by all patients
            else
            {
                da.ConsumeBreastQSurveyData(datasetSQL, surveyType, questions, (record) => { FillBreastQPoints(surveyType, surveyType, questions, breastQPoints, patientsToSurveys, record); return true; });
            }

            return breastQPoints;
        }

        public IEnumerable<BreastQPoint> FilterByScale(IEnumerable<BreastQPoint> points, IEnumerable<string> scaleNames)
        {
            List<BreastQPoint> filteredList = new List<BreastQPoint>();
            foreach (string scaleName in scaleNames)
            {
                List<BreastQPoint> subList = points.Where(r => r.ScaleName.Equals(scaleName, StringComparison.OrdinalIgnoreCase)).ToList();
                // normalize ScaleName
                foreach (var item in subList)
                {
                    item.ScaleName = scaleName;
                }
                filteredList.AddRange(subList);
            }
            return filteredList;
        }

        public string[] GetSurveyItemsByType(string surveyType)
        {
            var surveysToQuestions = GetSurveyItemsByTypes(surveyType);
            return surveysToQuestions.Count() > 0 ? surveysToQuestions.First().Value : new string[0];
        }

        public Dictionary<string, string[]> GetSurveyItemsByTypes(params string[] surveyTypes)
        {
            return surveyTypes.Where(s => scoreUtil.HasSurveyDefinition(s)).ToDictionary(s => s, s => scoreUtil.GetSurveyDefinition(s).Definitions.SelectMany(d => d.Questions).ToArray());
        }

        private void FillBreastQPoints(string surveyType, string surveyTitle, string[] questions, List<BreastQPoint> points, Dictionary<int, List<int>> patientsToSurveys, IDataRecord record)
        {
            var qa = questions.ToDictionary(q => q, q => record[q].ToString());
            int score = scoreUtil.GetSurveyScore(surveyType, qa);
            var scoreByScale = scoreUtil.GetSurveyScoreByScale(surveyType, qa);
            int patientId = (int)record[Survey.PatientId];
            int surveyId = (int)record[Survey.SurveyId];
            DateTime surveyDate = (DateTime)record[Survey.SurveyDate];

            // todo: do we retain per patient/survey
            var point = new
            {
                SurveyType = GetSurveyTypeTitle(surveyType, ""), // cleanup survey name
                SurveyTitle = surveyTitle,
                SurveyDateTicks = surveyDate.Ticks, // normalize
                SurveyDateText = surveyDate.ToShortDateString(),
                PatientId = patientId,
                SurveyId = surveyId,
                Responses = scoreByScale
            };

            points.AddRange(point.Responses.Where(r=>r.Value.Score.HasValue).Select(r => new BreastQPoint(point.SurveyType, point.SurveyTitle, point.SurveyDateText, point.SurveyDateTicks, r.Key, r.Value.Score.Value)));

            // update patients
            if (!patientsToSurveys.ContainsKey(patientId))
            {
                patientsToSurveys.Add(patientId, new List<int>());
            }
            // update surveys
            List<int> surveyIds = patientsToSurveys[patientId];
            if (!surveyIds.Contains(surveyId))
            {
                surveyIds.Add(surveyId);
            }
        }

        /// <summary>
        /// Gets a friendly title for survey type strippig off reduntant titles and adding camel case
        /// </summary>
        /// <param name="surveyType"></param>
        /// <param name="match"></param>
        /// <returns></returns>
        private string GetSurveyTypeTitle(string surveyType, string match)
        {
            //return surveyType;
            string title = surveyType;
            //title = title.Replace(match, "");
            // misc
            title = title.Replace("Tissue Expander", "TE");
            // normalize scale name
            title = title.Replace("Breast Q: ", "");

            // camel case
            title = Caisis.UI.Core.Classes.PageUtil.ToCamelCase(title);

            return title;
        }

    }

    #region BreastQ related classes

    public class BreastQPoint
    {
        private string surveyType;
        private string surveyTitle;
        private string surveyDateText;
        private long surveyDateTicks;
        private string scaleName;
        private int scaleScore;

        public string SurveyType
        {
            get
            {
                return surveyType;
            }
            set
            {
                surveyType = value;
            }
        }

        public string SurveyTitle
        {
            get
            {
                return surveyTitle;
            }
            set
            {
                surveyTitle = value;
            }
        }

        public string SurveyDateText
        {
            get
            {
                return surveyDateText;
            }
            set
            {
                surveyDateText = value;
            }
        }

        public long SurveyDateTicks
        {
            get
            {
                return surveyDateTicks;
            }
            set
            {
                surveyDateTicks = value;
            }
        }

        public string ScaleName
        {
            get
            {
                return scaleName;
            }
            set
            {
                scaleName = value;
            }
        }

        public int ScaleScore
        {
            get
            {
                return scaleScore;
            }
            set
            {
                scaleScore = value;
            }
        }

        public BreastQPoint()
        {
            this.surveyType = "";
            this.surveyDateText = "";
            this.surveyDateTicks = 0;
            this.scaleName = "";
            this.scaleScore = 0;
        }

        public BreastQPoint(string SurveyType, string SurveyDateText, long SurveyDateTicks, string ScaleName, int ScaleScore)
            : this(SurveyType, SurveyType, SurveyDateText, SurveyDateTicks, ScaleName, ScaleScore)
        {
        }

        public BreastQPoint(string SurveyType, string SurveyTitle, string SurveyDateText, long SurveyDateTicks, string ScaleName, int ScaleScore)
            : this()
        {
            this.surveyType = SurveyType;
            this.surveyTitle = SurveyTitle;
            this.surveyDateText = SurveyDateText;
            this.surveyDateTicks = SurveyDateTicks;
            this.scaleName = ScaleName;
            this.scaleScore = ScaleScore;
        }
    }

    [DataContract]
    public class BreastQSurveyAverage
    {
        [DataMember]
        public string ScaleName;

        [DataMember]
        public int AvgScore;

        public BreastQSurveyAverage()
        {
        }

        public BreastQSurveyAverage(string scaleName, int avgScore)
        {
            this.ScaleName = scaleName;
            this.AvgScore = avgScore;
        }
    }

    public class BreastQSurveyPoints
    {
        private string surveyName;
        private int surveyCount;
        private int patientCount;

        private Dictionary<int, List<int>> surveyAudit = new Dictionary<int, List<int>>();

        private IEnumerable<BreastQPoint> surveyPoints = new BreastQPoint[0];

        public BreastQSurveyPoints(string surveyType, Dictionary<int, List<int>> patientsToSurveys, IEnumerable<BreastQPoint> points)
        {
            this.surveyName = surveyType;
            this.surveyAudit = patientsToSurveys;
            this.surveyPoints = points;
        }

        public IEnumerable<int> GetPatients()
        {
            return surveyAudit.Keys.Distinct();
        }

        public IEnumerable<int> GetSurveys()
        {
            return surveyAudit.SelectMany(p => p.Value).Distinct();
        }

        public IEnumerable<BreastQPoint> GetPoints()
        {
            return surveyPoints;
        }
    }

    [DataContract]
    public class BreastQDataset
    {
        private string name;
        private int patientCount;
        private int surveyCount;

        [System.Runtime.Serialization.DataMember]
        public string Name
        {
            get
            {
                return name;
            }
            set
            {
                name = value;
            }
        }

        [System.Runtime.Serialization.DataMember]
        public int PatientCount
        {
            get
            {
                return patientCount;
            }
            set
            {
                patientCount = value;
            }
        }

        [System.Runtime.Serialization.DataMember]
        public int SurveyCount
        {
            get
            {
                return surveyCount;
            }
            set
            {
                surveyCount = value;
            }
        }

        private string color;
        public string HexColor
        {
            get
            {
                return color;
            }
            set
            {
                color = value;
            }
        }


        private BreastQSurveyAverage[] averages = new BreastQSurveyAverage[0];

        [DataMember]
        public BreastQSurveyAverage[] ScaleAverages
        {
            get
            {
                return averages;
            }
            set
            {
                averages = value;
            }
        }

        private List<BreastQSurveyPoints> surveys = new List<BreastQSurveyPoints>();

        public BreastQDataset()
        {
        }

        public BreastQDataset(string name, IEnumerable<BreastQSurveyPoints> surveys)
            : this()
        {
            this.Name = name;
            Add(surveys);
        }

        public BreastQDataset(string name, IEnumerable<BreastQSurveyPoints> surveys, string hexColor)
            : this(name, surveys)
        {
            this.color = hexColor;
        }

        public void Add(IEnumerable<BreastQSurveyPoints> surveys)
        {
            this.surveys.AddRange(surveys);
            // adjust SUMs
            this.PatientCount = GetPatientCount();
            this.SurveyCount = GetSurveyCount();
            this.ScaleAverages = SumAverages(GetPoints());
        }

        public IEnumerable<BreastQSurveyPoints> GetSurveyPoints()
        {
            return surveys;
        }

        public IEnumerable<BreastQPoint> GetPoints()
        {
            return surveys.SelectMany(s => s.GetPoints());
        }

        private int GetPatientCount()
        {
            return SumPatientCount(surveys);
        }

        private int GetSurveyCount()
        {
            return SumSurveyCount(surveys);
        }

        public static int SumPatientCount(IEnumerable<BreastQSurveyPoints> surveys)
        {
            return surveys.SelectMany(s => s.GetPatients()).Distinct().Count();
        }

        public static int SumSurveyCount(IEnumerable<BreastQSurveyPoints> surveys)
        {
            return surveys.SelectMany(s => s.GetSurveys()).Distinct().Count();
        }

        public static BreastQSurveyAverage[] SumAverages(IEnumerable<BreastQPoint> points)
        {
            var pointsBySurveyAndScale = from p in points
                                         group p by p.ScaleName into g
                                         select new
                                         {
                                             Scale = g.Key,
                                             Average = (int)g.Select(p => p.ScaleScore).Average()
                                         };
            return pointsBySurveyAndScale.Select(s => new BreastQSurveyAverage(s.Scale, s.Average)).ToArray();
        }
    }

    #endregion

}