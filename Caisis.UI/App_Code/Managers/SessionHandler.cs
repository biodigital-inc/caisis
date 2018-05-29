using System;
using System.Data;
using System.Web.UI;
using System.Web.SessionState;

using Caisis.BOL;

namespace Caisis.UI.Core.Classes
{
    /// <summary>
    /// Summary description for SessionHandler.
    /// </summary>
    public sealed class SessionHandler
    {
        private HttpSessionState _session;

        public SessionHandler(HttpSessionState session)
        {
            _session = session;
        }

        public SessionHandler(Page page)
        {
            _session = page.Session;
        }

        public void PutCurrentPageInSession(string currentPageName)
        {
            _session[SessionKey.CurrentPage] = currentPageName;
        }

        /// <summary>
        /// Gets the patient id, or 0 if no patient is in session
        /// </summary>
        /// <returns>Patient Id</returns>
        public int GetPatientId()
        {
            if (_session[SessionKey.PatientId] != null && !_session[SessionKey.PatientId].ToString().Equals(""))
            {
                return (int)_session[SessionKey.PatientId];
            }
            return 0;
        }

        /// <summary>
        /// Gets the current dataset id, or redirects user to login page if no patient is in session
        /// </summary>
        /// <returns>Patient Id</returns>
        public int GetDatasetId()
        {
            if (_session[SessionKey.DatasetId] != null && !_session[SessionKey.DatasetId].ToString().Equals(""))
            {
                return (int)_session[SessionKey.DatasetId];
            }
            else // if no dataset id exists throw user out
            {
                string loginPage = "~/Login.aspx";
                System.Web.HttpContext.Current.Response.Redirect(loginPage);
            }
            return 0;
        }

        /// <summary>
        /// Gets the patient name, or empty string if no patient is in session
        /// </summary>
        /// <returns>Patient Name (first middle last)</returns>
        public string GetPatientName()
        {
            string patientName = "";

            if (_session[SessionKey.PtFirstName] != null && _session[SessionKey.PtFirstName].ToString().Length > 0)
            {
                patientName = _session[SessionKey.PtFirstName].ToString();
            }

            if (_session[SessionKey.PtLastName] != null && _session[SessionKey.PtLastName].ToString().Length > 0)
            {
                if (patientName != "") patientName += " ";

                patientName += _session[SessionKey.PtLastName].ToString();
            }

            return patientName;
        }

        /// <summary>
        /// Get the current clinic date from session. 
        /// If not in session adds it based on current date. 
        /// Supports internationalization based on culture settings.
        /// </summary>
        /// <returns></returns>
        public string GetCurrentClinicDate()
        {
            string currentClinicDate = "";
            if (_session[SessionKey.CurrentClinicDate] != null && _session[SessionKey.CurrentClinicDate].ToString() != "")
            {
                currentClinicDate = _session[SessionKey.CurrentClinicDate].ToString();
            }
            else
            {
                // default clinic date to today
                currentClinicDate = System.DateTime.Now.Date.ToShortDateString();
                _session[SessionKey.CurrentClinicDate] = currentClinicDate;
            }
            return currentClinicDate;
        }

        /// <summary>
        /// Updates the patient information in the session.
        /// </summary>
        /// <param name="patientId"></param>
        /// <param name="mrn"></param>
        /// <param name="firstName"></param>
        /// <param name="lastName"></param>
        /// <param name="birthDateText"></param>
        public void UpdateSessionPatientInfo(int patientId, string mrn, string firstName, string lastName, string birthDateText)
        {
            _session[SessionKey.PatientId] = patientId;
            _session[SessionKey.PtMRN] = mrn;
            _session[SessionKey.PtFirstName] = firstName;
            _session[SessionKey.PtLastName] = lastName;
            _session[SessionKey.PtDOB] = birthDateText;
        }

        /// <summary>
        /// Updates the patient information in the session.
        /// </summary>
        /// <param name="row">DataRow containing patient name, id, mrn, and date of birth (can be null)</param>
        public void UpdateSessionPatientInfo(DataRow row)
        {
            UpdateSessionPatientInfo(
                (int)row[Patient.PatientId],
                row[Patient.PtMRN].ToString(),
                row[Patient.PtFirstName].ToString(),
                row[Patient.PtLastName].ToString(),
                row[Patient.PtBirthDateText].ToString());
        }

        public void UpdateSessionPatientInfo(Patient pt)
        {
            UpdateSessionPatientInfo(
                (int)pt[Patient.PatientId],
                pt[Patient.PtMRN].ToString(),
                pt[Patient.PtFirstName].ToString(),
                pt[Patient.PtLastName].ToString(),
                pt[Patient.PtBirthDateText].ToString());
        }

        public void UpdateSessionPatientInfo(int patientId)
        {
            Patient pt = new Patient();
            pt.Get(patientId);

            UpdateSessionPatientInfo(
                (int)pt[Patient.PatientId],
                pt[Patient.PtMRN].ToString(),
                pt[Patient.PtFirstName].ToString(),
                pt[Patient.PtLastName].ToString(),
                pt[Patient.PtBirthDateText].ToString());
        }

        public void ClearCurrentPatient()
        {
            _session[SessionKey.PatientId] = "";
            _session[SessionKey.PtMRN] = "";
            _session[SessionKey.PtFirstName] = "";
            _session[SessionKey.PtLastName] = "";
            _session[SessionKey.PtDOB] = "";
        }

        public void EmptySession()
        {
            _session[SessionKey.PatientId] = "";
            _session[SessionKey.PtMRN] = "";
            _session[SessionKey.PtFirstName] = "";
            _session[SessionKey.PtLastName] = "";
            _session[SessionKey.CurrentListCrit] = "";
            _session[SessionKey.PtDOB] = "";
            _session[SessionKey.GroupViewCode] = "";
        }

		// TODO: MIGRATION - DELETE ME
        /// <summary>
        /// Verifiers whether patient in session syncs up with Patient biz
        /// </summary>
        /// <param name="biz"></param>
        /// <returns>true if values are the same, else false</returns>
        public bool VerifyPatientInSession(Patient biz)
        {
            object sessionPatientId = _session[SessionKey.PatientId];
            object sessionFirstName = _session[SessionKey.PtFirstName];
            object sessionLastName = _session[SessionKey.PtLastName];
            object sessionMRN = _session[SessionKey.PtMRN];
            object sessionDOB = _session[SessionKey.PtDOB];

            string currentPatientId = biz[Patient.PatientId].ToString();
            string currentFirstName = biz[Patient.PtFirstName].ToString();
            string currentLastName = biz[Patient.PtLastName].ToString();
            string currentMRN = biz[Patient.PtMRN].ToString();
            string currentDOB = biz[Patient.PtBirthDateText].ToString();

            // Valiate there is a Patient in Session
            if (sessionPatientId != null && !string.IsNullOrEmpty(sessionPatientId.ToString()))
            {
                // Validate Session variables match current Patient Biz
                if (sessionPatientId.ToString() != currentPatientId || sessionFirstName.ToString() != currentFirstName || sessionLastName.ToString() != currentLastName || sessionMRN.ToString() != currentMRN || sessionDOB.ToString() != currentDOB)
                {
                    return false;
                }
                //values in Session match current Patient Biz
                else
                {
                    return true;
                }
            }
            else
            {
                return false;
            }
        }
    }
}
