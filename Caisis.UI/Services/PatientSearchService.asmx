<%@ WebService Language="C#" Class="Caisis.WebServices.PatientSearchService" %>

using System;
using System.Data;
using System.Web;
using System.Web.Services;
using System.Web.Services.Protocols;
using System.Runtime.Serialization;
using System.Linq;

using Caisis.UI.Core;
using Caisis.UI.Core.Classes;
using Caisis.Controller;

namespace Caisis.WebServices
{

    /// <summary>
    /// A service for searching for Patients.
    /// </summary>
    [WebService(Namespace = "http://www.caisis.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    [System.Web.Script.Services.ScriptService]
    public class PatientSearchService : CaisisWebService
    {
        protected PatientController pc = new PatientController();
        private static readonly int MaxSearchResults = 25;

        public PatientSearchService()
            : base()
        {
        }

        [WebMethod(EnableSession = true)]
        public PatientResults[] Search(string searchType, string searchText)
        {
            // search patients
            string datasetSQL = CacheManager.GetDatasetSQL(Session[SessionKey.DatasetId]);
            DataTable searchResults = SearchForPatients(searchType, searchText);
            // return results
            var patients = from row in searchResults.AsEnumerable()
                           let patient = new PatientResults(
                                pc.GetPatientFirstName(row["PtFirstName"].ToString()),
                                pc.GetPatientLastName(row["PtLastName"].ToString()),
                                pc.GetPatientMRN(row["PtMRN"].ToString()),
                                pc.GetPatientDateOfBirth(row["PtBirthDateText"].ToString()),
                                Caisis.Security.CustomCryptoHelper.Encrypt(row["PatientId"].ToString()))
                           orderby patient.LastName ascending
                           select patient;
            return patients.Take(MaxSearchResults).ToArray();
        }

  

        /// <summary>
        /// Returns a DataTable of Patients and associated info (LastName, FirstName, etc...)
        /// </summary>
        /// <param name="identifierType">unique identifier or LastNameMRN</param>
        /// <param name="searchFilter">search filter to search for</param>
        /// <returns></returns>
        public DataTable SearchForPatients(string identifierType, string searchFilter)
        {
            DataTable results = new DataTable();
            SearchController ct = new SearchController();
            string datasetSQL = CacheManager.GetDatasetSQL(Session[SessionKey.DatasetId]);
            if (identifierType == "LastNameMRN")
            {
                results = ct.FindPatient(searchFilter, datasetSQL).Tables[0];
            }
            else
            {
                results = ct.FindPatientByIdentifier(searchFilter, identifierType, datasetSQL).Tables[0];
            }
            return results;
        }
    }

    [DataContract(Name="Patient")]
    public class PatientResults
    {
        [DataMember]
        public string FirstName;
        [DataMember]
        public string LastName;
        [DataMember]
        public string MRN;
        [DataMember]
        public string DOB;
        [DataMember]
        public string EncPatientId;

        public PatientResults(string firstName, string lastName, string mrn, string dob, string epid)
        {
            this.FirstName = firstName;
            this.LastName = lastName;
            this.MRN = mrn;
            this.DOB = dob;
            this.EncPatientId = epid;
        }
    }
}