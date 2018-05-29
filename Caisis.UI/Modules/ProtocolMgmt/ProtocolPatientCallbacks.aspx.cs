using System;
using System.Data;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using Caisis.Security;
using Caisis.BOL;
using Caisis.Controller;
using Caisis.UI.Core.Classes;

namespace Caisis.UI.Modules.ProtocolMgmt
{
    /// <summary>
    /// Provides ajax callback methods for populate patient related searches
    /// </summary>
    public partial class ProtocolPatientCallbacks : ProtocolMgmtPatientBasePage
    {
        /// <summary>
        /// The LookupCode where LkpFieldName="IdType" representing the Patient's Protocol Participant Id
        /// </summary>
        protected static readonly string PROTOCOL_PARTICIPANT_ID_CODE = "Participant ID";

        private bool isSingleResult = false;

        private bool CanViewPatientInfo
        {
            get
            {
                return base.ShowPatientIdentifiers();
            }
        }

        protected override void Page_Load(object sender, EventArgs e)
        {
            base.Page_Load(sender, e);
            string methodName = Request.Form["methodName"];
            switch (methodName)
            {
                case("PatientSearch"):
                    string searchTerm = Request.Form["searchTerm"];
                    string searchType = Request.Form["searchType"];
                    SetPatientSearchResults(searchTerm, searchType);
                    break;
                case("GetClinicPatients"):
                    string clinicName = Request.Form["clinicName"];
                    SetClinicPatients(clinicName);
                    break;
                case("GetParticipantId"):
                    string epid = Request.Form["patientId"];
                    SetParticipantId(epid);
                    break;
                default:
                    break;
            }
        }

        #region Patient Search

        private void SetPatientSearchResults(string searchTerm, string searchType)
        {
            SearchController ct = new SearchController();
            string datasetSQL = CacheManager.GetDatasetSQL(Session[SessionKey.DatasetId]);
            // Determine type of search, if identifier or normal search
            DataTable results = new DataTable();
            if (!string.IsNullOrEmpty(searchType) && searchType.Equals(PROTOCOL_PARTICIPANT_ID_CODE))
            {
                results = ct.FindPatientByIdentifier(searchTerm, PROTOCOL_PARTICIPANT_ID_CODE, datasetSQL).Tables[0];
                // add identifier columns
                if (PatientResults.Columns.Count == 3)
                {
                    BoundField identifierColumn = new BoundField();
                    identifierColumn.DataField = "Identifier";
                    PatientResults.Columns.Add(identifierColumn);
                }
            }
            else if (CanViewPatientInfo)
            {
                results = ct.FindPatient(searchTerm, datasetSQL).Tables[0];
            }

            isSingleResult = results.Rows.Count == 1;

            PatientResults.DataSource = GetPatientParticipantTable(results);
            PatientResults.DataBind();
        }

        protected DataTable GetPatientParticipantTable(DataTable patientList)
        {
            // ensure columns are normalized to ensure view identifier permissions
            PatientController pc = new PatientController();
            foreach (DataRow row in patientList.Rows)
            {
                string firstName = row[Patient.PtFirstName].ToString();
                string lastName = row[Patient.PtLastName].ToString();
                string mrn = row[Patient.PtMRN].ToString();
                row[Patient.PtFirstName] = pc.GetPatientFirstName(firstName);
                row[Patient.PtLastName] = pc.GetPatientLastName(lastName);
                row[Patient.PtMRN] = pc.GetPatientMRN(mrn);
                if (!CanViewPatientInfo)
                {
                    row[Patient.PtBirthDateText] = string.Empty;
                }

            }
            return patientList;
        }

        protected void SetPtChooser(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.DataItem != null)
            {
                int patientIdKey = (int)DataBinder.Eval(e.Row.DataItem, Patient.PatientId);
                string pId = EncryptValue(patientIdKey.ToString());
                string ptName = DataBinder.Eval(e.Row.DataItem, Patient.PtLastName).ToString() + ", " + DataBinder.Eval(e.Row.DataItem, Patient.PtFirstName).ToString();
                string ptDOB = DataBinder.Eval(e.Row.DataItem, Patient.PtBirthDateText).ToString();
                string ptMRN = DataBinder.Eval(e.Row.DataItem, Patient.PtMRN).ToString();
                string clientClick = "choosePatient('" + pId + "','" + ptName + "','" + ptDOB + "','" + ptMRN + "');";

                e.Row.Attributes["onclick"] = "return " + clientClick;

                // for single result, set hidden client click
                if (e.Row.DataItemIndex == 0 && isSingleResult)
                {
                    PatientResults_Single.Value = clientClick;
                }
            }
        }

        #endregion

        /// <summary>
        /// Sets the list of clinic patients
        /// </summary>
        /// <param name="clinicName"></param>
        private void SetClinicPatients(string clinicName)
        {
            if (CanViewPatientInfo)
            {
                PatientListController ct = new PatientListController();
                // set number of patients to list per page; default is 200
                int numRecords = 200;

                // get list of patients
                string dsSQL = CacheManager.GetDatasetSQL(Session[SessionKey.DatasetId]);
                string listMod = "";
                SecurityController sc = new SecurityController();
                string listUser = sc.GetUserName();

                DataSet ds = null;
                ds = ct.GetList(dsSQL, "Clinic", clinicName, listMod, "ApptPhysician", 0, numRecords, DateTime.Today.ToShortDateString(), listUser);

                DataTable dt = ds.Tables[0];
                dt.Columns.Add(new DataColumn("ApptName", typeof(String), "ApptLastName + ',' + ApptFirstName"));

                DataColumn epidCol = new DataColumn("ApptEncryptedPatientId", typeof(String));
                dt.Columns.Add(epidCol);
                // encrypt pids
                foreach (DataRow row in dt.Rows)
                {
                    string pid = row["ApptPatientId"].ToString();
                    if (!string.IsNullOrEmpty(pid))
                    {
                        row[epidCol] = EncryptValue(pid);
                    }
                }

                ClinicPatients.DataSource = dt;
                ClinicPatients.DataBind();
            }
        }
        
        /// <summary>
        /// Sets the computed participant id
        /// </summary>
        /// <param name="epid"></param>
        private void SetParticipantId(string epid)
        {
            string participantId= string.Empty;
            if (!string.IsNullOrEmpty(epid))
            {
                int patientId = int.Parse(DecrypyValue(epid));
                int protocolId = int.Parse(BaseProtocolId);
                participantId= PatientProtocolController.GetParticipantId(protocolId, patientId);
            }
            ParticipantId.Value =  participantId;
        }
    }
}