using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Web;
using System.Web.Services;
using System.Web.Services.Protocols;
using System.Runtime.Serialization;
using System.Linq;

using Caisis.BOL;
using Caisis.DataAccess;

namespace Caisis.UI.Modules.ProtocolMgmt
{

    [WebService(Namespace = "http://www.caisis.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    [System.Web.Script.Services.ScriptService]
    public class ProtocolMgmtWebService : System.Web.Services.WebService
    {
        [DataContract]
        public class ContactInfo
        {
            [DataMember]
            public string Name;
            [DataMember]
            public string Email;
            [DataMember]
            public string Phone;
        }

        private static readonly string[] conditions = new string[] { "Adequate", "Inadequate", "Could not process" };

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

        private static readonly string[] BLOOD_SUFFIXES = new string[]
                {
                    "S-1",
                    "S-2",
                    "P-1",
                    "P-2",
                    "B-1",
                    "BU-1",
                    "PAX-1",
                    "PAX-2",
                    "W-1"
                };

        public static readonly string[][] DEFAULT_BLOOD_SPECIMENS = new string[][]
         {
            new string[] { "S-1","Serum" },
            new string[] { "S-2","Serum" },
            new string[] { "P-1","Plasma" },
            new string[] { "P-2","Plasma" },
            new string[] { "B-1","Buffy Coat" },
            new string[] { "BU-1","Buccolic Swab" },
            new string[] { "PAX-1","PAXgene" },
            new string[] { "PAX-2","PAXgene" },
            new string[] { "W-1","Whole Blood" }
         };

        [WebMethod]
        public string[] GetAutoSpecimenIds(int ptProtocolId, string type, string studyId, string visit)
        {
            string[] results = GetAutoSpecimenIds(ptProtocolId, studyId, type, visit, 6);
            return results;
        }

        private static string[] GetAutoSpecimenIds(int ptProtocolId, string studyId, string type, string visit, int count)
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

        public static string GetAutoSpecimenNumber(string studyId, string specimenType, string visitType, string specimenSeqNum)
        {
            return GetSpecimenReferenceNumber(studyId, specimenType, visitType, specimenSeqNum);
        }

        ///// <summary>
        ///// Gets the next calulated specimen reference number for the current Patient
        ///// </summary>
        ///// <param name="specimentSeqNum"></param>
        ///// <returns></returns>
        //public string GetSpecimenReferenceNumber(string specimentSeqNum)
        //{
        //    return GetSpecimenReferenceNumber(PatientStudyId, QuerySpecimenType, QueryVisitType, specimentSeqNum);
        //}

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
                string refNum = "";
                string suffix = "";
                int parse;
                if (int.TryParse(specimenSeqNum, out parse))
                {
                    int index = int.Parse(specimenSeqNum) - 1;
                    if (index >= 0 && index < BLOOD_SUFFIXES.Length)
                    {
                        suffix = BLOOD_SUFFIXES[index] + "";
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



        [WebMethod]
        public ContactInfo GetContactInfo(string name)
        {
            string[] names = name.Split(' ');
            string fName = names.Length > 0 ? names[0] : "";
            string lName = names.Length > 1 ? names[1] : "";
            string phone = "";
            string email = "";
            // check contact
            var contact = BOL.Contact.GetByFields<Contact>(new Dictionary<string, object>
                {
                    { Contact.FirstName, fName },
                    { Contact.LastName, lName }
                }).FirstOrDefault();
            if (contact != null)
            {
                int contactId = (int)contact[Contact.ContactId];
                var workPhone = BusinessObject.GetByFields<ContactMethod>(new Dictionary<string, object> { { ContactMethod.ContactId, contactId }, { ContactMethod.Type, "Work Phone" } }).FirstOrDefault();
                var workEmail = BusinessObject.GetByFields<ContactMethod>(new Dictionary<string, object> { { ContactMethod.ContactId, contactId }, { ContactMethod.Type, "Work Email" } }).FirstOrDefault();

                phone = workPhone != null ? workPhone[ContactMethod.ContactData].ToString() : "";
                email = workEmail != null ? workEmail[ContactMethod.ContactData].ToString() : "";
            }
            // write response
            ContactInfo contactInfo = new ContactInfo();
            contactInfo.Email = email;
            contactInfo.Phone = phone;
            return contactInfo;
        }

        #region Specimens

        [WebMethod]
        public int UpdateSpecimenCondition(int specimenId, string condition)
        {
            Specimen biz = new Specimen();
            biz.Get(specimenId);
            string notes = biz[Specimen.SpecimenNotes].ToString();
            if (!string.IsNullOrEmpty(condition) && GetSpecimenCondition(notes) != condition)
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

        [WebMethod]
        public string GetSpecimenCondition(string note)
        {
            foreach (string conditionValue in conditions)
            {
                if (note.Contains(conditionValue))
                    return conditionValue;
            }
            return "";
        }

        [WebMethod]
        public string[] GetConditions()
        {
            return conditions.ToArray();
        }

        #endregion
    }
}