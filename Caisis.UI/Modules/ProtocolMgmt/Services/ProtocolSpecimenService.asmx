<%@ WebService Language="C#" Class="Caisis.UI.Modules.ProtocolMgmt.Services.ProtocolSpecimenService" %>

using System;
using System.Web;
using System.Web.Services;
using System.Web.Services.Protocols;

using Caisis.BOL;
using Caisis.WebServices;
using Caisis.UI.Modules.ProtocolMgmt;

namespace Caisis.UI.Modules.ProtocolMgmt.Services
{
    [WebService(Namespace = "http://www.caisis.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    [System.Web.Script.Services.ScriptService]
    public class ProtocolSpecimenService : CaisisWebService
    {
        ProtocolMgmtSpecimenController controller = new ProtocolMgmtSpecimenController();

        [WebMethod]
        public string[] GetAutoSpecimenIds(string protocolNum, int ptProtocolId, string type, string studyId, string visit)
        {
            if (type == "Blood")
            {
                var defaults = ProtocolMgmtSpecimenController.GetBloodAutoSpecimenIds(protocolNum, ptProtocolId, studyId, visit);
                string[] results = new string[defaults.Length];
                for (int i = 0; i < defaults.Length; i++)
                {
                    var defaultSpecimen = defaults[i];
                    string value = defaultSpecimen.SpecimenReferenceNumber + "|" + defaultSpecimen.SubType + "|" + defaultSpecimen.VialType;
                    if (visit == "")
                    {
                        results[i] = "||";
                    }
                    else
                    {
                        results[i] = value;
                    }
                }
                return results;
            }
            else
            {
                string[] results = ProtocolMgmtSpecimenController.GetTissueAutoSpecimenIds(ptProtocolId, studyId, type, visit, 6);
                return results;
            }
        }
        
        [WebMethod]
        public int UpdateSpecimenCondition(int specimenId, string condition)
        {
            Specimen biz = new Specimen();
            biz.Get(specimenId);
            string notes = biz[Specimen.SpecimenNotes].ToString();
            string[] conditions = controller.GetConditions();
            if (!string.IsNullOrEmpty(condition) && controller.GetSpecimenCondition(notes) != condition)
            {
                string updatedNotes = notes;
                bool found = false;
                foreach (string conditionValue in conditions)
                {
                    if (updatedNotes.Contains(conditionValue))
                    {
                        updatedNotes = updatedNotes.Replace(conditionValue, condition);
                        found = true;
                        break;
                    }
                }
                if (found == false)
                    updatedNotes = updatedNotes + (updatedNotes == "" ? "" : " ") + condition;

                if (notes != updatedNotes)
                {
                    biz[Specimen.SpecimenNotes] = updatedNotes;
                    biz.Save();
                }
            }
            return (int)biz[Specimen.SpecimenId];
        }
    }
}