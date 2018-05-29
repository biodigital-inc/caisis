using System;
using System.Data;
using System.Configuration;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Xml;
using System.Xml.Linq;
using System.Runtime.Serialization;

using Caisis.BOL;
using Caisis.Data;
using Caisis.DataAccess;
using Caisis.Extensions;
using Caisis.UI.Core.Classes;
using Caisis.Security;
using Caisis.Controller;

namespace Caisis.UI.Modules.ProtocolMgmt
{
    /// <summary>
    /// Defines Protocol specific specimen tasks
    /// </summary>
    public class ProtocolMgmtSpecimenController
    {
        private static readonly string[] SPECIMEN_CONDITIONS = new string[] { "Adequate", "Inadequate", "Could not process" };

        /* i.e.,
 *  study id: 0123456
 *  type: Blood
 *  visit: Pre-Treatment (A)
 *  Spec: #3
 *  => 0123456-B-A-3        
*/
        /// <summary>
        /// 
        /// </summary>
        protected static readonly string SPECIMEN_TISSUE_REFERENCE_FORMAT_STRING = "{0}-{1}-{2}-{3}";

        /// <summary>
        /// 
        /// </summary>
        protected static readonly string SPECIMEN_BLOOD_REFERENCE_FORMAT_STRING = "{0}-{1}";

        public static string GetAutoSpecimenNumber(string studyId, string specimenType, string visitType, string specimenSeqNum)
        {
            return GetSpecimenReferenceNumber(studyId, specimenType, visitType, specimenSeqNum);
        }

        /// <summary>
        ///  Gets a calulated specimen reference number based on the specified params
        /// </summary>
        /// <param name="studyId"></param>
        /// <param name="specimenType"></param>
        /// <param name="visitType"></param>
        /// <param name="specimenSeqNum"></param>
        /// <returns></returns>
        public static string GetSpecimenReferenceNumber(string studyId, string specimenType, string visitType, string specimenSeqNum)
        {
            // cleanup, Blood => B
            specimenType = !string.IsNullOrEmpty(specimenType) ? specimenType.Substring(0, 1).ToUpper() : "";
            // special case
            if (specimenType == "B")
            {
                ProtocolMgmtSpecimenController controller = new ProtocolMgmtSpecimenController();
                var defaultBloodSpecimens = controller.GetDefaultBloodSpecimens("");

                string refNum = "";
                string suffix = "";
                int parse;
                if (int.TryParse(specimenSeqNum, out parse))
                {
                    int index = int.Parse(specimenSeqNum) - 1;
                    if (index >= 0 && index < defaultBloodSpecimens.Length)
                    {
                        var specimenDefault = defaultBloodSpecimens[index];
                        suffix = specimenDefault.Suffix;
                        refNum = string.Format(SPECIMEN_BLOOD_REFERENCE_FORMAT_STRING, studyId, suffix);
                    }
                }
                return refNum;
            }
            else
            {
                // return formatted specimen ref #
                string refNum = string.Format(SPECIMEN_TISSUE_REFERENCE_FORMAT_STRING, studyId, specimenType, visitType, specimenSeqNum);
                return refNum;
            }
        }

        public static string[] GetTissueAutoSpecimenIds(int ptProtocolId, string studyId, string type, string visit, int count)
        {
            int startSeqNum = 1;
            SpecimenManagerDa da = new SpecimenManagerDa();
            var specimens = da.GetSpecimenReport(ptProtocolId, null, type);
            var allSpecimentRefNum = specimens.AsEnumerable().Select(r => r[Specimen.SpecimenReferenceNumber].ToString()).Distinct();
            int maxSeqNum = allSpecimentRefNum.Count();
            // find start
            for (int seqNum = 1; seqNum <= maxSeqNum; seqNum++)
            {
                string calculatedStudyId = GetAutoSpecimenNumber(studyId, type, visit, seqNum + "");
                // if # exists, start after
                if (allSpecimentRefNum.Contains(calculatedStudyId))
                    startSeqNum++;
            }
            if (!string.IsNullOrEmpty(visit) && (type == PatientSpecimenBasePage.QUERY_BLOOD || type == PatientSpecimenBasePage.QUERY_TISSUE))
            {
                string[] results = new string[count];
                for (int i = 0, seqNum = startSeqNum; i < count; i++, seqNum++)
                    results[i] = GetAutoSpecimenNumber(studyId, type, visit, seqNum + "");
                return results;
            }
            else
                return new string[count];
        }

        /// <summary>
        /// Get a list of pre-generated Blood Specimen #s based on Trial
        /// </summary>
        /// <param name="protocolNum"></param>
        /// <param name="ptProtocolId"></param>
        /// <param name="studyId"></param>
        /// <param name="visit"></param>
        /// <returns></returns>
        public static ProtocolSpecimenAutoNumber[] GetBloodAutoSpecimenIds(string protocolNum, int ptProtocolId, string studyId, string visit)
        {
            ProtocolMgmtSpecimenController sc = new ProtocolMgmtSpecimenController();
            var bloodSpecimenIds = sc.GetDefaultBloodSpecimens(protocolNum);
            SpecimenManagerDa da = new SpecimenManagerDa();
            var specimens = da.GetSpecimenReport(ptProtocolId, null, "Blood");
            var allSpecimentRefNum = specimens.AsEnumerable().Select(r => r[Specimen.SpecimenReferenceNumber].ToString()).Distinct();
            int maxSeqNum = allSpecimentRefNum.Count();

            List<ProtocolSpecimenAutoNumber> values = new List<ProtocolSpecimenAutoNumber>();
            int maxSearch = allSpecimentRefNum.Count() + bloodSpecimenIds.Length;
            for (int i = 0; i < bloodSpecimenIds.Length; i++)
            {
                var bloodSpecimen = bloodSpecimenIds[i];
                // sequence
                for (int seq = 1; seq <= maxSearch; seq++)
                {
                    string specimenReferenceFormat = "";
                    bool containsNumber = System.Text.RegularExpressions.Regex.IsMatch(bloodSpecimen.Suffix, "^[0-9A-Z]+(-[0-9A-Z]+)+$");
                    // includes static #, exclude sequence #
                    if (containsNumber)
                    {
                        if (!string.IsNullOrEmpty(visit))
                            specimenReferenceFormat = "{0}-{1}-{2}";
                        else
                            specimenReferenceFormat = "{0}-{2}";
                    }
                    else
                    {
                        specimenReferenceFormat = "{0}-{1}-{2}-{3}";
                    }
                    string autoRefNum = string.Format(specimenReferenceFormat, studyId, visit, bloodSpecimen.Suffix, seq);
                    if (!allSpecimentRefNum.Contains(autoRefNum))
                    {
                        ProtocolSpecimenAutoNumber auto = new ProtocolSpecimenAutoNumber(autoRefNum, bloodSpecimen.SubType, bloodSpecimen.VialType);
                        values.Add(auto);
                        break;
                    }
                }                
            }
            return values.ToArray();
        }

        #region specimen defaults

        public ProtocolSpecimenDefault[] GetDefaultBloodSpecimens(string protocolNum)
        {
            return GetDefaultSpecimens(protocolNum, "Blood Specimens");
        }
        public ProtocolSpecimenDefault[] GetDefaultTissueSpecimens(string protocolNum)
        {
            return GetDefaultSpecimens(protocolNum, "Tissue Specimens");
        }

        private static ProtocolSpecimenDefault[] GetDefaultSpecimens(string protocolNum, string type)
        {
            List<ProtocolSpecimenDefault> defaults = new List<ProtocolSpecimenDefault>();
            // get default specimen configuration
            string xPath = string.Format("//specimens//defaults[@type='{0}']", type);
            XmlNode specimenDefaultNode = ProtocolMgmtController.GetConfigurationNode(Protocol.ProtocolNum, protocolNum, xPath);
            if (specimenDefaultNode != null)
            {
                // TODO: add automated de-serialization
                var defaultNodes = from node in specimenDefaultNode.SelectNodes("ProtocolSpecimenDefault").Cast<XmlNode>()
                                   let suffix = node.SelectSingleNode("Suffix").InnerText
                                   let subType = node.SelectSingleNode("SubType").InnerText
                                   let vialType = node.SelectSingleNode("VialType").InnerText
                                   select new ProtocolSpecimenDefault(suffix, subType, vialType);
                defaults.AddRange(defaultNodes);
            }
            return defaults.ToArray();
        }

        public Dictionary<string, string> GetSpecimenVisits(string protocolNum, string type)
        {
            string xPath = string.Format("//specimens//visits[@type='{0}']", type);
            XmlNode visitNodes = ProtocolMgmtController.GetConfigurationNode(Protocol.ProtocolNum, protocolNum, xPath);
            if (visitNodes != null)
            {
                var visits = from visit in visitNodes.SelectNodes("visit").Cast<XmlNode>()
                             select new
                             {
                                 Label = visit.SelectSingleNode("Label").InnerText,
                                 Value = visit.SelectSingleNode("Value").InnerText
                             };
                return visits.ToDictionary(v => v.Label, v => v.Value);
            }
            else
            {
                return new Dictionary<string, string>();
            }
        }

        #endregion

        #region specimen condition
        
        public string GetSpecimenCondition(string note)
        {
            foreach (string conditionValue in SPECIMEN_CONDITIONS)
            {
                if (note.Contains(conditionValue))
                    return conditionValue;
            }
            return "";
        }

        public string[] GetConditions()
        {
            return SPECIMEN_CONDITIONS.ToArray();
        }

        #endregion
    }

    [DataContract]
    public class ProtocolSpecimenDefault
    {
        [DataMember]
        public string Suffix;

        [DataMember]
        public string SubType;

        [DataMember]
        public string VialType;

        public ProtocolSpecimenDefault()
        {
        }

        public ProtocolSpecimenDefault(string specimenReferenceSuffix, string specimenSubType, string specimenVialType)
            : this()
        {
            this.Suffix = specimenReferenceSuffix;
            this.SubType = specimenSubType;
            this.VialType = specimenVialType;
        }
    }

    [DataContract]
    public class ProtocolSpecimenAutoNumber
    {
        [DataMember]
        public string SpecimenReferenceNumber;

        [DataMember]
        public string SubType;

        [DataMember]
        public string VialType;


        public ProtocolSpecimenAutoNumber()
        {
        }

        public ProtocolSpecimenAutoNumber(string specimenRefNum, string subType, string vialType)
            : this()
        {
            this.SpecimenReferenceNumber = specimenRefNum;
            this.SubType = subType;
            this.VialType = vialType;
        }
    }
}