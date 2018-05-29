using System;
using System.Collections;
using System.Collections.Generic;
using System.Collections.Specialized;
using System.Data;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Xml;

using QScoreLibrary;

namespace Caisis.UI.Core.Utilities
{
    [Obsolete("Legacy BreastQ scoring. Replaced by CaisisBreastQEngine.")]
    /// <summary>
    /// BreastQScoringUtil Utility
    /// </summary>
    public class BreastQScoringUtil
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
        /// Engine used for scoring surveys and scales
        /// </summary>
        private Estimation scoringEngine = new Estimation();

        #region Constructors

        public BreastQScoringUtil()
        {
            LoadFromFile();
        }

        #endregion


        /// <summary>
        /// 
        /// </summary>
        private void LoadFromFile()
        {
            XmlDocument xDoc = Caisis.UI.Core.Classes.XmlUtil.GetXmlDoc("~/App_Data/Scoring.xml");
            XmlNodeList surveyNodes = xDoc.SelectNodes("//Survey[@type='BreastQ']");
            XmlNodeList scaleNodes = xDoc.SelectNodes("//ScaleDefinitions/Scale");
            IEnumerable<ScaleDefinition> scaleDefinition = from node in scaleNodes.Cast<XmlNode>()
                                                           let def = ParseScaleFromXml(node)
                                                           where def != null
                                                           select def;
            IEnumerable<SurveyDefinition> surveys = from surveyNode in surveyNodes.Cast<XmlNode>()
                                                    let survey = ParseSurveyFromXml(scaleDefinition, surveyNode)
                                                    where survey != null
                                                    select survey;
            surveyLookup = surveys.ToDictionary(s => s.SurveyType, s => s, StringComparer.OrdinalIgnoreCase);
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
        private SurveyDefinition GetSurveyDefinition(string surveyType)
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

        private DataTable _surveyLookupTable;

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
            return scores.Select(a => a.Value).Sum();
        }

        public Dictionary<string, int> GetSurveyScoreByScale(string surveyType, IDictionary<string, string> surveyResponses)
        {
            var normalizedResponses = NormalizeQuestions(surveyResponses, true);
            return GetSurveyScoreByScale(surveyType, normalizedResponses);
        }

        public Dictionary<string, int> GetSurveyScoreByScale(string surveyType, IDictionary<string, int> surveyResponses)
        {
            SurveyDefinition surveyMapping = _GetSurveyDefinition(surveyType);
            if (surveyMapping != null)
            {
                var scoresByScale = from def in surveyMapping.Definitions
                                    select new
                                    {
                                        Scale = def.Name,
                                        Score = GetScaleScore(def, surveyResponses)
                                    };
                return scoresByScale.ToDictionary(a => a.Scale, a => a.Score);
            }
            return new Dictionary<string, int>();
        }

        /// <summary>
        /// Gets the score for the specificed scale.
        /// </summary>
        /// <param name="scaleDefinition"></param>
        /// <param name="surveyResponses"></param>
        /// <returns></returns>
        private int GetScaleScore(ScaleDefinition scaleDefinition, IDictionary<string, int> surveyResponses)
        {
            // get required mappings
            Estimation.eScales _scale = scaleDefinition.Scale;
            Estimation.eErrors _error = Estimation.eErrors.eNoError;
            // create array of responses
            int[] _responses = new int[scaleDefinition.NumberOfItems];
            for (int i = 0; i < scaleDefinition.NumberOfItems; i++)
            {
                string questionNum = scaleDefinition.Questions[i];
                // set default response
                int questionResponse = NO_RESPONSE_VALUE;
                // set response value (if applicable)
                if (surveyResponses.ContainsKey(questionNum))
                {
                    questionResponse = surveyResponses[questionNum];
                }
                _responses[i] = questionResponse;
            }
            // score scale
            uint scaleScore = scoringEngine.EstimateQuestionnaireScale(_scale, _responses, out _error);
            // check error status
            string errorText = QScoreError(_error);

            return (int)scaleScore;
        }

        #endregion

        #region Utilities

        private static SurveyDefinition ParseSurveyFromXml(IEnumerable<ScaleDefinition> scaleDefinitions, XmlNode surveyNode)
        {
            string type = ParseXmlAttribute(surveyNode, "match");
            if (!string.IsNullOrEmpty(type))
            {
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
            if (!string.IsNullOrEmpty(scaleName))
            {
                scaleEnum = BreastQScoringUtil.GetScale(scaleName);
            }
            if (scaleEnum.HasValue && !string.IsNullOrEmpty(questions))
            {
                string[] questionsList = questions.Split(",".ToCharArray(), StringSplitOptions.RemoveEmptyEntries);
                return new ScaleDefinition(scaleEnum.Value, name, questionsList);
            }
            return null;
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

        private class SurveyDefinition
        {
            private string surveyType;
            private ScaleDefinition[] definitions;

            public string SurveyType
            {
                get
                {
                    return surveyType;
                }
            }

            public ScaleDefinition[] Definitions
            {
                get
                {
                    return definitions;
                }
            }

            public SurveyDefinition(string surveyType, ScaleDefinition[] definitions)
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
                var foundScale = Definitions.Where(scale => scale.Name.Equals(scaleName, StringComparison.OrdinalIgnoreCase));
                return foundScale.FirstOrDefault();
            }
        }

        private class ScaleDefinition
        {
            private readonly QScoreLibrary.Estimation.eScales eScale;
            private readonly string name;
            private string[] questions;

            /// <summary>
            /// Gets the scale
            /// </summary>
            public QScoreLibrary.Estimation.eScales Scale
            {
                get
                {
                    return eScale;
                }
            }

            /// <summary>
            /// Gets the title
            /// </summary>
            public string Name
            {
                get
                {
                    return name;
                }
            }

            /// <summary>
            /// Returns the list of questions
            /// </summary>
            public string[] Questions
            {
                get
                {
                    return questions;
                }
            }

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

            public ScaleDefinition(QScoreLibrary.Estimation.eScales eScale, string name, string[] questions)
            {
                this.eScale = eScale;
                this.name = name;
                this.questions = questions.ToArray();
            }

            public override string ToString()
            {
                return Name;
            }
        }

        //static ScaleDefinition[] s_ScaleDefinitions = 
        //{ 
        //    new ScaleDefinition (QScoreLibrary.Estimation.eScales.eAugPre1, "eAugPre1", 6),
        //    new ScaleDefinition (QScoreLibrary.Estimation.eScales.eAugPre2, "eAugPre2", 9),
        //    new ScaleDefinition (QScoreLibrary.Estimation.eScales.eAugPre3, "eAugPre3", 5),
        //    new ScaleDefinition (QScoreLibrary.Estimation.eScales.eAugPre4, "eAugPre4", 5),
        //    new ScaleDefinition (QScoreLibrary.Estimation.eScales.eAugPost1, "eAugPost1", 17),
        //    new ScaleDefinition (QScoreLibrary.Estimation.eScales.eAugPost2, "eAugPost2", 8),
        //    new ScaleDefinition (QScoreLibrary.Estimation.eScales.eAugPost3, "eAugPost3", 9),
        //    new ScaleDefinition (QScoreLibrary.Estimation.eScales.eAugPost4, "eAugPost4", 5),
        //    new ScaleDefinition (QScoreLibrary.Estimation.eScales.eAugPost5, "eAugPost5", 7),
        //    new ScaleDefinition (QScoreLibrary.Estimation.eScales.eAugPost6, "eAugPost6", 16),
        //    new ScaleDefinition (QScoreLibrary.Estimation.eScales.eAugPost7, "eAugPost7", 12),
        //    new ScaleDefinition (QScoreLibrary.Estimation.eScales.eAugPost8, "eAugPost8", 7),
        //    new ScaleDefinition (QScoreLibrary.Estimation.eScales.eAugPost9, "eAugPost9", 7),
        //    new ScaleDefinition (QScoreLibrary.Estimation.eScales.eRecPre1, "eRecPre1", 4),
        //    new ScaleDefinition (QScoreLibrary.Estimation.eScales.eRecPre2, "eRecPre2", 10),
        //    new ScaleDefinition (QScoreLibrary.Estimation.eScales.eRecPre3, "eRecPre3", 16),
        //    new ScaleDefinition (QScoreLibrary.Estimation.eScales.eRecPre4, "eRecPre4", 5),
        //    // where is Pre 5?
        //    new ScaleDefinition (QScoreLibrary.Estimation.eScales.eRecPre6, "eRecPre6", 6),
        //    new ScaleDefinition (QScoreLibrary.Estimation.eScales.eRecPost1, "eRecPost1", 16),
        //    // where is Post 2?
        //    new ScaleDefinition (QScoreLibrary.Estimation.eScales.eRecPost3, "eRecPost3", 7),
        //    new ScaleDefinition (QScoreLibrary.Estimation.eScales.eRecPost4, "eRecPost4", 10),
        //    new ScaleDefinition (QScoreLibrary.Estimation.eScales.eRecPost5, "eRecPost5", 6),
        //    new ScaleDefinition (QScoreLibrary.Estimation.eScales.eRecPost6, "eRecPost6", 16),
        //    new ScaleDefinition (QScoreLibrary.Estimation.eScales.eRecPost7, "eRecPost7", 8),
        //    new ScaleDefinition (QScoreLibrary.Estimation.eScales.eRecPost10, "eRecPost10", 5),
        //    new ScaleDefinition (QScoreLibrary.Estimation.eScales.eRecPost11, "eRecPost11", 15),
        //    new ScaleDefinition (QScoreLibrary.Estimation.eScales.eRecPost12, "eRecPost12", 12),
        //    new ScaleDefinition (QScoreLibrary.Estimation.eScales.eRecPost13, "eRecPost13", 7),
        //    new ScaleDefinition (QScoreLibrary.Estimation.eScales.eRecPost14, "eRecPost14", 7),
        //    new ScaleDefinition (QScoreLibrary.Estimation.eScales.eRedPre1, "eRedPre1", 11),
        //    new ScaleDefinition (QScoreLibrary.Estimation.eScales.eRedPre2, "eRedPre2", 9),
        //    new ScaleDefinition (QScoreLibrary.Estimation.eScales.eRedPre3, "eRedPre3", 5),
        //    new ScaleDefinition (QScoreLibrary.Estimation.eScales.eRedPre4, "eRedPre4", 14),
        //    new ScaleDefinition (QScoreLibrary.Estimation.eScales.eRedPost1, "eRedPost1", 13),
        //    new ScaleDefinition (QScoreLibrary.Estimation.eScales.eRedPost2, "eRedPost2", 8),
        //    new ScaleDefinition (QScoreLibrary.Estimation.eScales.eRedPost3, "eRedPost3", 9),
        //    new ScaleDefinition (QScoreLibrary.Estimation.eScales.eRedPost4, "eRedPost4", 5),
        //    new ScaleDefinition (QScoreLibrary.Estimation.eScales.eRedPost5, "eRedPost5", 14),
        //    new ScaleDefinition (QScoreLibrary.Estimation.eScales.eRedPost6, "eRedPost6", 13),
        //    new ScaleDefinition (QScoreLibrary.Estimation.eScales.eRedPost7, "eRedPost7", 5),
        //    new ScaleDefinition (QScoreLibrary.Estimation.eScales.eRedPost8, "eRedPost8", 12),
        //    new ScaleDefinition (QScoreLibrary.Estimation.eScales.eRedPost9, "eRedPost9", 7),
        //    new ScaleDefinition (QScoreLibrary.Estimation.eScales.eRedPost10, "eRedPost10", 7)
        //};

        public string QScoreError(QScoreLibrary.Estimation.eErrors eErrorCode)
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
                    _msg = "N.A";
                    //All responses are missing therefore no estimate can be generated 
                    //This can be a valid situation whereby a scale is not applicable to a patient or a patient has not responded to any items in the scale
                    break;
            }

            return _msg;
        }
    }

}