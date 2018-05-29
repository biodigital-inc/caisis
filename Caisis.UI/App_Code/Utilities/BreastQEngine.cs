using System;
using System.Collections;
using System.Collections.Generic;
using System.Collections.Specialized;
using System.Data;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Xml;

// web services
using System.Web.Services;

// serialization
using System.Runtime.Serialization;

// BreaastQ lib
using QScoreLibrary;

namespace BreastQ
{
    /// <summary>
    /// BreastQ Utilities
    /// </summary>
    public class BreastQEngine
    {
        /// <summary>
        /// Represents the default response value for unanswers question.
        /// </summary>
        public static readonly int NO_RESPONSE_VALUE = -1;

        /// <summary>
        /// Lookup of survey definitions
        /// </summary>
        private Dictionary<string, SurveyDefinition> surveyLookup = new Dictionary<string, SurveyDefinition>(StringComparer.OrdinalIgnoreCase);

        /// <summary>
        /// Lookup of scale definitions
        /// </summary>
        private Dictionary<string, ScaleDefinition> scaleLookup = new Dictionary<string, ScaleDefinition>(StringComparer.OrdinalIgnoreCase);

        //Hold Manual Scoring Information For Scale
        public Dictionary<string, ManualScaleDefinition> manualScaleLookup = new Dictionary<string,ManualScaleDefinition>(StringComparer.OrdinalIgnoreCase);



        /// <summary>
        /// QScore Engine used for scoring surveys and scales
        /// </summary>
        private Estimation scoringEngine = new Estimation();

        #region Constructors

        /// <summary>
        /// Creates a new instance of the BreastQUtility using the specified survey definitions file.
        /// </summary>
        /// <param name="surveyMapping"></param>
        public BreastQEngine(XmlDocument surveyMapping)
            : this(GetSurveyDefinitionFromFile(surveyMapping))
        {
        }


        /// <summary>
        /// Creates a new instance of the BreastQUtility using the specified survey definitions.
        /// </summary>
        /// <param name="surveysDefinitions"></param>
        public BreastQEngine(IEnumerable<SurveyDefinition> surveysDefinitions)
        {
            LoadSurveyDefinitions(surveysDefinitions);
        }

        #endregion

        /// <summary>
        /// Loads the list of survey definitions into the current utility
        /// </summary>
        /// <param name="surveysDefinitions"></param>
        public void LoadSurveyDefinitions(IEnumerable<SurveyDefinition> surveysDefinitions)
        {
            surveyLookup = surveysDefinitions.ToDictionary(s => s.SurveyType, s => s, StringComparer.OrdinalIgnoreCase);
        }



        /// <summary>
        /// Loads the dictionary of manualscalenames to the the manualscaledefinitions. 
        /// The manual score calculator is part of the ManualScaleDefinition
        /// </summary>
        /// <param name="xDoc"></param>
        public void LoadManualScales(XmlDocument xDoc)
        {
            IEnumerable<ManualScaleDefinition> manScales = GetManualScaleDefinitionsFromFile(xDoc);
            manualScaleLookup = manScales.ToDictionary(s => s.scaleName.ToString(), s => s, StringComparer.OrdinalIgnoreCase);
        }


        /// <summary>
        /// From the given xml document, return a list of survey definitions
        /// </summary>
        /// <param name="xDoc"></param>
        /// <returns></returns>
        public static IEnumerable<SurveyDefinition> GetSurveyDefinitionFromFile(XmlDocument xDoc)
        {
            XmlNodeList surveyNodes = xDoc.SelectNodes("//Survey[@type='BreastQ']");
            IEnumerable<ScaleDefinition> scaleDefinition = GetScaleDefinitionsFromFile(xDoc);
            IEnumerable<SurveyDefinition> surveysDefinitions = from surveyNode in surveyNodes.Cast<XmlNode>()
                                                               let survey = ParseSurveyFromXml(scaleDefinition, surveyNode)
                                                               where survey != null
                                                               select survey;
            return surveysDefinitions;
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="xDoc"></param>
        /// <returns></returns>
        public static IEnumerable<ScaleDefinition> GetScaleDefinitionsFromFile(XmlDocument xDoc)
        {
            XmlNodeList scaleNodes = xDoc.SelectNodes("//ScaleDefinitions/Scale");
            IEnumerable<ScaleDefinition> scaleDefinition = from node in scaleNodes.Cast<XmlNode>()
                                                           let def = ParseScaleFromXml(node)
                                                           where def != null
                                                           select def;
            return scaleDefinition;
        }

        // load Manually Scored Scales From XML File
        public static IEnumerable<ManualScaleDefinition> GetManualScaleDefinitionsFromFile(XmlDocument xDoc)
        {
            XmlNodeList manScaleNodes = xDoc.SelectNodes("//ManualScales/Scale");
            IEnumerable<ManualScaleDefinition> manScaleDefinitions = from node in manScaleNodes.Cast<XmlNode>()
                                                                     let def = ParseManScaleFromXml(node)
                                                                     where def != null
                                                                     select def;
            return manScaleDefinitions;
        }

        /// <summary>
        /// Gets if there is a survey definition
        /// </summary>
        /// <param name="surveyType"></param>
        /// <returns></returns>
        public bool HasSurveyDefinition(string surveyType)
        {
            return _HasSurveyDefinition(surveyType);
        }

        /// <summary>
        /// Gets the scoring definition
        /// </summary>
        /// <param name="surveyType"></param>
        /// <returns></returns>
        public SurveyDefinition GetSurveyDefinition(string surveyType)
        {
            return _GetSurveyDefinition(surveyType);
        }

        /// <summary>
        /// Returns if there is a matching scoring algorithm for the specified survey type
        /// </summary>
        /// <param name="surveyType"></param>
        /// <returns></returns>
        private bool _HasSurveyDefinition(string surveyType)
        {
            return _GetSurveyDefinition(surveyType) != null;
        }

        private SurveyDefinition _GetSurveyDefinition(string surveyType)
        {
            if (surveyLookup.ContainsKey(surveyType))
            {
                return surveyLookup[surveyType];
            }
            else
            {
                return null;
            }
            /*
            SurveyDefinition definition = null;

            if (_surveyLookupTable == null)
            {
                _surveyLookupTable = new DataTable();
                _surveyLookupTable.Columns.Add(new DataColumn("Match", typeof(string)));
                var row = _surveyLookupTable.NewRow();
                _surveyLookupTable.Rows.Add(row);
            }
            var rowData = _surveyLookupTable.Rows[0];
            rowData[0] = surveyType;
            foreach (var entry in surveyLookup)
            {
                string match = entry.Key;
                if (match.Contains("%"))
                {
                    string sqlMath = match.Replace("'", "''");
                    if (_surveyLookupTable.Select("Match LIKE  '" + sqlMath + "'").Length > 0)
                    {
                        definition= entry.Value;
                        break;
                    }
                }
                else if (match.Equals(surveyType, StringComparison.OrdinalIgnoreCase))
                {
                    definition= entry.Value;
                    break;
                }
            }
            return definition;
            */
        }


        #region Scoring

        public int GetSurveyScore(string surveyType, IDictionary<string, string> surveyResponses)
        {
            return GetSurveyScore(surveyType, NormalizeQuestions(surveyResponses, true));
        }

        public int GetSurveyScore(string surveyType, IDictionary<string, int> surveyResponses)
        {
            var scores = GetSurveyScoreByScale(surveyType, surveyResponses);
            return scores.Select(a => a.Value.Score ?? 0).Sum();
        }

        public int GetSurveyScore(string surveyType, BreastQResponse[] responses)
        {
            var scores = GetSurveyScoreByScale(surveyType, responses);
            return scores.Select(a => a.Value.Score ?? 0).Sum();
        }


        public Dictionary<string, BreastQScaleScore> GetSurveyScoreByScale(string surveyType, IDictionary<string, string> surveyResponses)
        {
            var normalizedResponses = NormalizeQuestions(surveyResponses, true);
            return GetSurveyScoreByScale(surveyType, normalizedResponses);
        }

        public Dictionary<string, BreastQScaleScore> GetSurveyScoreByScale(string surveyType, BreastQResponse[] responses)
        {
            return GetSurveyScoreByScale(surveyType, responses.ToDictionary(k => k.Question, v => v.Response));
        }

        public Dictionary<string, BreastQScaleScore> GetSurveyScoreByScale(string surveyType, IDictionary<string, int> surveyResponses)
        {
            SurveyDefinition surveyMapping = _GetSurveyDefinition(surveyType);
            if (surveyMapping != null)
            {
                var scoresByScale = from def in surveyMapping.Definitions
                                    select new
                                    {
                                        Scale = def.Title,
                                        Score = GetScaleScore(def, surveyResponses)
                                    };
                return scoresByScale.ToDictionary(a => a.Scale, a => a.Score);
            }
            return new Dictionary<string, BreastQScaleScore>();
        }

        /*
        public Dictionary<string, int> GetManSurveyScoreByScale(string surveyType, IDictionary<string,int> surveyResponses)
        {
           
        }
        */


        public BreastQScaleScore GetScaleScore(ScaleDefinition scaleDefinition, IEnumerable<BreastQResponse> responses)
        {
            return GetScaleScore(scaleDefinition, responses.ToDictionary(k => k.Question, v => v.Response));
        }

        public BreastQScaleScore GetScaleScore(ScaleDefinition scaleDefinition, IDictionary<string, int> surveyResponses)
        {
            return GetScaleScore(scaleDefinition, surveyResponses.ToDictionary(a => a.Key, v => true ? v.Value : (int?)null));
        }

        /// <summary>
        /// Gets the score for the specificed scale.
        /// </summary>
        /// <param name="scaleDefinition"></param>
        /// <param name="surveyResponses"></param>
        /// <returns></returns>
        public BreastQScaleScore GetScaleScore(ScaleDefinition scaleDefinition, IDictionary<string, int?> surveyResponses)
        {
            int[] responses =  GetScaleResponses(scaleDefinition, surveyResponses);
            return GetScaleScore(scaleDefinition, responses);
        }

        /// <summary>
        /// Gets an normalized (pad invalid/empty responses) to match scale definition expectations.
        /// </summary>
        /// <param name="scaleDefinition"></param>
        /// <param name="surveyResponses"></param>
        /// <returns></returns>
        public int[] GetScaleResponses(ScaleDefinition scaleDefinition, IDictionary<string, int?> surveyResponses)
        {
            // create array of responses
            int[] responses = new int[scaleDefinition.NumberOfItems];
            for (int i = 0; i < scaleDefinition.NumberOfItems; i++)
            {
                string questionNum = scaleDefinition.Questions[i];
                // default response
                int questionResponse = NO_RESPONSE_VALUE;
                // check response (if applicable)
                if (surveyResponses.ContainsKey(questionNum))
                {
                    int? surveyResponse = surveyResponses[questionNum];
                    if (surveyResponse.HasValue)
                        questionResponse = surveyResponse.Value;
                }
                // set response
                responses[i] = questionResponse;
            }
            return responses;
        }

        public BreastQScaleScore GetScaleScore(ScaleDefinition scaleDefinition, int[] scaleResponses)
        {
            // ask if scale is defined in QScoreLibrary
            QScoreLibrary.Estimation.eScales? _scale = null;
            // manual scale
            ManualScaleDefinition manualScale = null;
            _scale = BreastQEngine.GetScale(scaleDefinition.Scale);            
            Estimation.eErrors scaleError = Estimation.eErrors.eErrorNoResponseData;
            int? scaleScore = null;
            if (_scale.HasValue)
            {
                // use breastq assembly to calculate the score
                int engineScore = (int)scoringEngine.EstimateQuestionnaireScale(_scale.Value, scaleResponses, out scaleError);
                if (scaleError == Estimation.eErrors.eNoError)
                {
                    scaleScore = engineScore;
                }
            }
            else if (manualScaleLookup.TryGetValue(scaleDefinition.Scale, out manualScale))
            {
                // score manually
                int[] convertedResponses = new int[scaleResponses.Length];
                for (int i=0; i<scaleResponses.Length; i++)
                {
                    convertedResponses[i] = manualScale.slope * scaleResponses[i] + manualScale.intercept;
                    //Some responses saturate.
                    if (convertedResponses[i]> manualScale.max)
                    {
                        convertedResponses[i] = manualScale.max;
                    }

                    //0 is an invalid response for all manual scales
                    if (scaleResponses[i] == 0)
                    {
                        convertedResponses[i] = -1;
                    }

                }

                int responseSum = convertedResponses.Sum();
                int finalScore;
                if (!manualScale.ScoreHashTable.TryGetValue(responseSum, out finalScore))
                {
                    //finalScore = -1; //invalid sum
                    scaleError = Estimation.eErrors.eErrorNoResponseData;
                }
                else if (scaleResponses.Max() > manualScale.maxResponse)
                {
                    //invalid response
                    //finalScore = -1;
                    scaleError = Estimation.eErrors.eErrorImplementationResponsesInvalidValue;
                }
                else
                {
                    scaleError = Estimation.eErrors.eNoError;
                    scaleScore = finalScore;
                }
            }
            else if (!string.IsNullOrEmpty(scaleDefinition.Alias))
            {
                _scale = BreastQEngine.GetScale(scaleDefinition.Alias);
                if (_scale.HasValue)
                {
                    // can you call this function recursively?
                    int engineScore = (int)scoringEngine.EstimateQuestionnaireScale(_scale.Value, scaleResponses, out scaleError);
                    if (scaleError == Estimation.eErrors.eNoError)
                    {
                        scaleScore = engineScore;
                    }
                }
            }

            BreastQScaleScore breastQScore = new BreastQScaleScore();
            // set error code
            if (_scale == null && manualScale == null)
                breastQScore.Error = Estimation.eErrors.eErrorImplementationInvalidScaleEnum;
            else
                breastQScore.Error = scaleError;

            breastQScore.Scale = scaleDefinition;
            // set score
            if (scaleError == Estimation.eErrors.eNoError && scaleScore.HasValue)
                breastQScore.Score = (int?)scaleScore;
            else
                breastQScore.Score = null;
            return breastQScore;
        }
        
        
        #endregion

        #region Utilities

        private static SurveyDefinition ParseSurveyFromXml(IEnumerable<ScaleDefinition> scaleDefinitions, XmlNode surveyNode)
        {
            string type = ParseXmlAttribute(surveyNode, "match");
            if (!string.IsNullOrEmpty(type))
            {
                /* OLD
                var scales = from scaleNode in surveyNode.SelectNodes("Scales/Scale").Cast<XmlNode>()
                             let scaleName = ParseXmlAttribute(scaleNode, "scaleName")
                             join def in scaleDefinitions on scaleName equals def.Scale.ToString()
                             where def != null
                             select def;
                */
                var scales = from scaleNode in surveyNode.SelectNodes("Scales/Scale").Cast<XmlNode>()
                             let scaleName = ParseXmlAttribute(scaleNode, "scaleName")
                             join def in scaleDefinitions on scaleName equals def.Scale.ToString()
                             where def != null
                             select def;
                if (scales.Count() > 0)
                {
                    return new SurveyDefinition(type, scales.ToArray());
                }
            }
            return null;
        }

        private static ScaleDefinition ParseScaleFromXml(XmlNode scaleNode)
        {
            QScoreLibrary.Estimation.eScales? scaleEnum = null;
            string name = ParseXmlAttribute(scaleNode, "name");
            string scaleName = ParseXmlAttribute(scaleNode, "scaleName");
            string questions = ParseXmlAttribute(scaleNode, "numbers");
            string alias = ParseXmlAttribute(scaleNode, "alias");
            
            if (!string.IsNullOrEmpty(scaleName) && !string.IsNullOrEmpty(questions))
            {
                string[] questionsList = questions.Split(",".ToCharArray(), StringSplitOptions.RemoveEmptyEntries);
                ScaleDefinition tempScaleDef = new ScaleDefinition(scaleName, name, questionsList);

                if (!string.IsNullOrEmpty(alias))
                {
                    tempScaleDef.Alias = alias;
                }

                /*
                if (!string.IsNullOrEmpty(maxResponse))
                {
                    tempScaleDef.maxResponse = Convert.ToInt16(maxResponse);
                }
                
                 */
                return tempScaleDef;
            }


            return null;
        }

        private static ManualScaleDefinition ParseManScaleFromXml(XmlNode manScaleNode)
        {
            string name = ParseXmlAttribute(manScaleNode, "name");
            string scaleName = ParseXmlAttribute(manScaleNode, "scaleName");
            string questionsString = ParseXmlAttribute(manScaleNode, "questions");
            int _slope = Convert.ToInt16(ParseXmlAttribute(manScaleNode, "slope"));
            int _intercept = Convert.ToInt16(ParseXmlAttribute(manScaleNode, "intercept"));
            int _max = Convert.ToInt16(ParseXmlAttribute(manScaleNode, "max"));
            int _maxResponse = Convert.ToInt16(ParseXmlAttribute(manScaleNode, "maxResponse"));
            string[] questions;
            Dictionary<int,int> manualScoreTable = new Dictionary<int,int>();

            questions = questionsString.Split(",".ToCharArray(),StringSplitOptions.RemoveEmptyEntries);

            XmlNodeList scoreMapvals = manScaleNode.SelectNodes("scoreMapValue");
            foreach (XmlNode scoreitem in scoreMapvals)
            {
                string _response = scoreitem.SelectSingleNode("response").InnerText;
                string _score = scoreitem.SelectSingleNode("score").InnerText;
                int response = Convert.ToInt16(_response);
                int score = Convert.ToInt16(_score);
                manualScoreTable.Add(response, score);

            }

            ManualScaleDefinition manscaledef = new ManualScaleDefinition(name, scaleName, questions, _slope, _intercept, _max, _maxResponse, manualScoreTable);
            return manscaledef;

        }

        /// <summary>
        /// Returns the scale based on string value.
        /// </summary>
        /// <param name="scale">The scale to parse</param>
        /// <returns>A scale or NULL (if not parseable)</returns>
        private static QScoreLibrary.Estimation.eScales? GetScale(string scale)
        {
            if (string.IsNullOrEmpty(scale) || !Enum.GetNames(typeof(QScoreLibrary.Estimation.eScales)).Contains(scale, StringComparer.OrdinalIgnoreCase))
                return null;
            QScoreLibrary.Estimation.eScales scaleEnum = (QScoreLibrary.Estimation.eScales)Enum.Parse(typeof(QScoreLibrary.Estimation.eScales), scale, true);
            return scaleEnum;
        }

        private static string ParseXmlAttribute(XmlNode node, string attribute)
        {
            return node.Attributes[attribute] != null ? node.Attributes[attribute].Value : string.Empty;
        }

        /// <summary>
        /// Gets a normalized lookup of questions and answers as int.
        /// flattenResponses:
        ///     True = remove entries with invalid/non-parseable response
        ///     False = set invalid/non-parseable to default response value
        /// </summary>
        /// <param name="sourceQuestionsAndResponses"></param>
        /// <param name="flattenResponses"></param>
        /// <returns></returns>
        public static Dictionary<string, int> NormalizeQuestions(IDictionary<string, string> sourceQuestionsAndResponses, bool flattenResponses)
        {
            int parsedResponse = NO_RESPONSE_VALUE;
            var normalizedResponses = from response in sourceQuestionsAndResponses
                                      let valueParsed = int.TryParse(response.Value, out parsedResponse)
                                      where valueParsed || !flattenResponses
                                      select new
                                      {
                                          QuestionNumber = response.Key,
                                          ResponseValue = valueParsed ? parsedResponse : NO_RESPONSE_VALUE
                                      };
            return normalizedResponses.ToDictionary(a => a.QuestionNumber, a => a.ResponseValue);
        }

        #endregion

        public SurveyDefinition[] GetAllDefinitions()
        {
            return surveyLookup.Values.ToArray();
        }

        

        public ScaleDefinition[] GetAllScaleDefinitions()
        {
            //OLD: return surveyLookup.SelectMany(d => d.Value.Definitions).GroupBy(s => s.Scale).Select(g=>g.First()).ToArray();
            return surveyLookup.SelectMany(d => d.Value.Definitions).GroupBy(s => s.Scale).Select(g => g.First()).ToArray();
        }
              
        /// <summary>
        /// Returns a user-friendly scale error message
        /// </summary>
        /// <param name="eErrorCode"></param>
        /// <returns></returns>
        public string GetQScoreErrorString(QScoreLibrary.Estimation.eErrors eErrorCode)
        {
            string _msg = String.Empty;

            switch (eErrorCode)
            {
                case QScoreLibrary.Estimation.eErrors.eNoError:
                    _msg = "No error";
                    //All good
                    break;
                case QScoreLibrary.Estimation.eErrors.eErrorImplementationInvalidScaleEnum:
                    _msg = "Implemenation Error - Invalid Scale (enum)";
                    //Implementatiuon Error - An invalid enum for eScale is used (has a cast been made)
                    break;
                case QScoreLibrary.Estimation.eErrors.eErrorImplementationResponsesInvalidSize:
                    _msg = "Implemenation Error - Invalid Response Array Size";
                    //Implementatiuon Error - Response vector does not match number of items for scale
                    break;
                case QScoreLibrary.Estimation.eErrors.eErrorImplementationResponsesInvalidValue:
                    _msg = "Implemenation Error - Invalid Value for Response";
                    //Implementation Error - A response has an invalid value
                    break;
                case QScoreLibrary.Estimation.eErrors.eErrorNoResponseData:
                    _msg = "N/A";
                    //All responses are missing therefore no estimate can be generated 
                    //This can be a valid situation whereby a scale is not applicable to a patient or a patient has not responded to any items in the scale
                    break;
            }

            return _msg;
        }

    }

    [DataContract]
    public class SurveyDefinition
    {
        private string surveyType;
        private ScaleDefinition[] definitions;

        [DataMember]
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

        [DataMember]
        public ScaleDefinition[] Definitions
        {
            get
            {
                return definitions;
            }
            set
            {
                definitions = value;
            }
        }

        public SurveyDefinition()
        {
            this.surveyType = "";
            this.definitions = new ScaleDefinition[0];
        }

        public SurveyDefinition(string surveyType, ScaleDefinition[] definitions)
            : this()
        {
            this.surveyType = surveyType;
            this.definitions = definitions;
        }

        /// <summary>
        /// Gets the scale definition by name
        /// </summary>
        /// <param name="scaleName"></param>
        /// <returns></returns>
        public ScaleDefinition GetScaleDefinitionByName(string scaleName)
        {
            var foundScale = Definitions.Where(scale => scale.Title.Equals(scaleName, StringComparison.OrdinalIgnoreCase));
            return foundScale.FirstOrDefault();
        }
    }

    [DataContract]
    public class ScaleDefinition
    {
        
        //private QScoreLibrary.Estimation.eScales eScale;
        private string _scaleName;
        private string title;
        private string[] questions;
        private string _alias;
        //private int _maxResponse;

        /*
        [DataMember]
        /// <summary>
        /// Gets the scale
        /// </summary>
        public QScoreLibrary.Estimation.eScales Scale
        {
            get
            {
                return eScale;
            }
            set
            {
                eScale = value;
            }
        }
        */

        [DataMember]
        public string Scale
        {
            get
            {
                return _scaleName;
            }
            set
            {
                _scaleName = value;
            }
        }

        [DataMember]
        /// <summary>
        /// Gets the title
        /// </summary>
        public string Title
        {
            get
            {
                return title;
            }
            set
            {
                title = value;
            }
        }

        [DataMember]
        /// <summary>
        /// Returns the list of questions
        /// </summary>
        public string[] Questions
        {
            get
            {
                return questions;
            }
            set
            {
                questions = value;
            }
        }

        [DataMember]
        public string Alias
        {
            get
            {
                return _alias;

            }
            set
            {
                _alias = value;
            }
        }

        /// <summary>
        /// Returns the number of questions in this scale
        /// </summary>
        [DataMember]
        public int QuestionCount
        {
            get
            {
                return Questions.Length;
            }
            set
            {
                Questions = new string[value];
            }
        }

        /*
        public int maxResponse
        {
            get
            {
                return _maxResponse;
            }
            set
            {
                _maxResponse = value;
            }
        }
        */ 

        /// <summary>
        /// Gets the number of items in scale
        /// </summary>
        public int NumberOfItems
        {
            get
            {
                return questions.Length;
            }
        }

        public ScaleDefinition()
        {
            this.title = "";
            this.questions = new string[0];
        }

        /*
        public ScaleDefinition(QScoreLibrary.Estimation.eScales eScale, string title, string[] questions)
            : this()
        {
            this.eScale = eScale;
            this.title = title;
            this.questions = questions.ToArray();
        }
        */

        public ScaleDefinition(string _scaleName, string title, string[] questions) : this()
        {
            this.Scale = _scaleName;
            this.title = title;
            this.questions = questions.ToArray();

        }

        public override string ToString()
        {
            return Title;
        }
    }

    [DataContract]
    public class ManualScaleDefinition
    {

        //private variables : score info
        //public variables: scale name, questions, title, etc.
        private string _title;
        private string[] _questions;
        private string _scaleName;
        private Dictionary<int, int> _ScoreHashTable;
        private int _slope;
        private int _intercept;
        private int _max;
        private int _maxReponse;

        public ManualScaleDefinition(string name,string scaleName,string[] questions, int slope, int intercept, int max, int maxResponse, Dictionary<int,int> manualScoreTable)
        {
            this.title = name;
            this.scaleName = scaleName;
            this.questions = questions;
            this.slope = slope;
            this.intercept = intercept;
            this.max = max;
            this.maxResponse = maxResponse;
            this.ScoreHashTable = manualScoreTable;
            
        }

        [DataMember]
        public string title {
            get
            {
                return this._title;
            } 
            set
            {
                this._title = value;
            }
        }

        [DataMember]
        public string scaleName
        {
            get
            {
                return this._scaleName;
            }
            set
            {
                this._scaleName = value;
            }
        }
        [DataMember]
        public string[] questions
        {
            get
            {
                return this._questions;
            }
            set
            {
                this._questions = value;
            }
        }

        public int slope
        { 
            get
            {
                return this._slope;
            }
            set
            {
                this._slope = value;
            }
        }

        public int intercept
        {
            get
            {
                return this._intercept;
            }
            set
            {
                this._intercept = value;
            }
        }

        public int max
        {
            get
            {
                return this._max;
            }
            set
            {
                this._max = value;
            }
        }

        public int maxResponse
        {
            get
            {
                return this._maxReponse;
            }
            set
            {
                this._maxReponse = value;
            }
        }

        public Dictionary<int, int> ScoreHashTable
        {
            get
            {
                return this._ScoreHashTable;
            }
            set
            {
                this._ScoreHashTable = value;
            }
        }

    }


    [DataContract]
    public class BreastQResponse
    {
        [DataMember]
        public int Response;

        [DataMember]
        public string Question;

        public BreastQResponse()
        {
        }

        public BreastQResponse(string question, int response)
            : this()
        {
            this.Question = question;
            this.Response = response;
        }
    }

    [DataContract]
    public class BreastQScaleScore
    {
        [DataMember]
        public ScaleDefinition Scale;

        [DataMember]
        public int? Score;

        [DataMember]
        public QScoreLibrary.Estimation.eErrors Error = Estimation.eErrors.eNoError;

        public BreastQScaleScore()
        {
            Scale = new ScaleDefinition();
            Score = null;
            Error = Estimation.eErrors.eNoError;
        }

        public BreastQScaleScore(ScaleDefinition scale, int score, Estimation.eErrors error)
            : this()
        {
            Scale = scale;
            Score = score;
            Error = error;
        }
    }
}