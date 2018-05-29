using System;
using System.Data;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.Services;
using System.Xml;
using System.Xml.Linq;
using System.Runtime.Serialization;
using System.Runtime.Serialization.Json;

using System.Web.Services.Protocols;

using Caisis.DataAccess;
using Caisis.Controller;
using Caisis.UI.Core.Utilities;
//using Caisis.UI.Modules.All.Charts;
using Caisis.UI.Modules.Prostate.Charts;
using Caisis.UI.Modules.Prostate.DataAnalysis;

namespace Caisis.WebServices
{
    /// <summary>
    /// Provides the basis for Caisis related Web Services
    /// </summary>
    public abstract class CaisisWebService : System.Web.Services.WebService
    {
        /// <summary>
        /// Internal error codes class
        /// </summary>
        protected static class WebServiceCodes
        {
            public static readonly int PATIENT_FOUND = 100;
            public static readonly int PATIENT_NOT_FOUND = 200;
            public static readonly int PATIENT_NOT_FOUND_MRN = 201;
            public static readonly int PATIENT_NOT_FOUND_DOB = 202;
            public static readonly int PATIENT_NOT_FOUND_LAST_NAME = 203;
            public static readonly int PATIENT_NOT_IN_DATASET = 204;
            public static readonly int PATIENT_NOT_FOUND_AMBIGIOUS = 205;
            public static readonly int INVALID_CREDENTIALS = 300;
            public static readonly int INVALID_CLIENT = 400;
            public static readonly int METHOD_EXCEPTION = 500;
        }

        /// <summary>
        /// The value to represent a web service audit field, i.e., EnteredBy, UpdatedBy
        /// </summary>
        public static readonly string ENTERED_BY_SERVICE = "web service";

        #region Client Authentication

        /// <summary>
        /// Validates the current user has access to Caisis and to service, and validates they can view Patient (if using patientId).
        /// Also validates method against a whitelist of IPs.
        /// </summary>
        /// <param name="methodName"></param>
        /// <param name="patientId"></param>
        /// <param name="username"></param>
        /// <param name="password"></param>
        /// <returns></returns>
        protected bool IsUserAuthenticated(string methodName, int? patientId, string username, string password)
        {
            bool isAuthenticated = false;
            if (!string.IsNullOrEmpty(username) && !string.IsNullOrEmpty(password))
            {
                int? userLoginId = null;

                // validate user
                UserDa da = new UserDa();
                UserController uc = new UserController();

                // VALIDATE USER AND LOGIN
                bool failedWebServiceCheck = false;
                try
                {
                    //// VALIDATE AGAINST DB
                    //string hashedPassword = FormsAuthentication.HashPasswordForStoringInConfigFile(password, "MD5");
                    //isAuthenticated = "Valid" == da.ValidateUser(username, hashedPassword, 0, 0);
                    //if (isAuthenticated)
                    //{
                    //    userLoginId = da.RecordUserLogin(username);
                    //}


                    // VALIDATE AGAINST SYSTEM
                    isAuthenticated = uc.AuthenticateUserLogin(username, password, false);
                    // VALIDATE PERMISSION
                    bool hasWebServicePermission = ValidateHasWebServicePermission(username);
                    if (!hasWebServicePermission)
                    {
                        failedWebServiceCheck = true;
                        throw new Exception();
                    }
                    userLoginId = uc.LoginUser(username, password);
                }
                catch (Exception ex)
                {
                    isAuthenticated = false;
                    if (failedWebServiceCheck)
                    {
                        throw LogServiceException(username, methodName, "User '" + username + "' does not have web service permissions", ex, WebServiceCodes.INVALID_CLIENT);
                    }
                    else
                    {
                        throw LogServiceException(username, methodName, "Not Authenticated", ex, WebServiceCodes.INVALID_CREDENTIALS);
                    }
                }
                // validate authenticated
                if (isAuthenticated && userLoginId.HasValue)
                {
                    // validate user can invoke method
                    bool isValidMethod = ValidateMethod(methodName);
                    if (isValidMethod)
                    {
                        isAuthenticated = true;
                    }
                    else
                    {
                        isAuthenticated = false;
                        // throw service error
                        throw LogServiceException(username, methodName, "Not Authorized to call method '" + methodName + "'", WebServiceCodes.INVALID_CLIENT);
                    }
                }
                // not authenticated
                else
                {
                    isAuthenticated = false;
                    // throw service error
                    throw LogServiceException(username, methodName, "Not Authenticated", WebServiceCodes.INVALID_CREDENTIALS);
                }
                // after authenticated, capture login and patient view
                Dictionary<string, string> methodParams = new Dictionary<string, string>();

                // if in context of patient, log patient view
                if (patientId.HasValue)
                {
                    var userDatasets = GetDataSetSQL(username);
                    // validate user can view patient
                    bool canViewPatient = ValidatePatientInDataSet(userDatasets, patientId.Value);
                    if (canViewPatient)
                    {
                        // log Patient View
                        uc.ViewPatient(patientId.Value, username);
                    }
                    else
                    {
                        // authentication failed
                        isAuthenticated = false;
                        // throw service error
                        throw LogServiceException(username, methodName, "Not Authenticated", WebServiceCodes.PATIENT_NOT_IN_DATASET);
                    }
                }
                // log web service view
                ReportController.LogWebServiceView(userLoginId.Value, methodName, methodParams);
            }
            else
            {
                // throw service error
                throw LogServiceException(username, methodName, "Invalid username and/or password", WebServiceCodes.INVALID_CREDENTIALS);
            }
            return isAuthenticated;
        }

        /// <summary>
        /// Validates the user has Web Service permissions
        /// </summary>
        /// <param name="username"></param>
        /// <returns></returns>
        protected bool ValidateHasWebServicePermission(string username)
        {
            bool hasPermission = false;
            var pda = new PermissionDa();
            var datasetIds = new UserController().GetUserDatasets(username).Tables[0].AsEnumerable().Select(row => (int)row[Caisis.BOL.Dataset.DatasetId]);
            foreach (int datasetId in datasetIds)
            {
                //returns list of permission based on dataset passed in and puts in dataset
                var datasetPermissions = pda.GetByUserDataset(username, datasetId).Tables[0].AsEnumerable().Select(r => r[BOL.Permission.Permission_Field].ToString());
                if (datasetPermissions.Contains("WebService"))
                {
                    hasPermission = true;
                    break;
                }
            }

            return hasPermission;
        }

        /// <summary>
        /// Validates current user has access to specificed method.
        /// </summary>
        /// <param name="methodName"></param>
        /// <returns></returns>
        protected bool ValidateMethod(string methodName)
        {
            return ValidateClient();
        }

        /// <summary>
        /// Returns if the currently connected client is validated to use this web service.
        /// </summary>
        /// <returns></returns>
        public bool ValidateClient()
        {
            // retrieve special web config ip white list
            string whitelist = CaisisConfiguration.GetWebConfigValue("WebServiceHosts");
            if (!string.IsNullOrEmpty(whitelist))
            {
                IEnumerable<string> ipWhiteList = whitelist.Split(",".ToCharArray(), StringSplitOptions.RemoveEmptyEntries);
                string clientIPAddress = this.Context.Request.UserHostAddress;
                // validate that client ip's in white list and white list is valid
                if (ipWhiteList.Count() > 0)
                {
                    if (ipWhiteList.First().ToLower().Equals("testing") || (!string.IsNullOrEmpty(clientIPAddress) && ipWhiteList.Contains(clientIPAddress)))
                    {
                        return true;
                    }
                }
            }
            return false;
        }

        #endregion

        #region Session

        /// <summary>
        /// Initalizes a new Session for the service
        /// </summary>
        /// <param name="username"></param>
        /// <param name="patientId"></param>
        protected void StartSession(string username, int? patientId)
        {
            string[] roleList = new string[] { };
            string datasets = string.Join(",", roleList);
            FormsAuthenticationTicket ticket =
                new FormsAuthenticationTicket(
                    1,                          // version
                    username,                   // user name
                    DateTime.Now,               // issue time
                    DateTime.Now.AddMinutes(5), // EXPIRES
                    false,                      // persistent
                    datasets				    // user data
                );
            FormsIdentity id = new FormsIdentity(ticket);
            Caisis.Security.CustomPrincipal cp = new Caisis.Security.CustomPrincipal(id, roleList);
            System.Threading.Thread.CurrentPrincipal = cp;

            // set patient id
            if (patientId.HasValue)
            {
                Session[Caisis.UI.Core.Classes.SessionKey.PatientId] = patientId;
                // set dataset id
                var userDatasets = GetDataSetSQL(username);
                int? datasetId = FindPatientInDataSet(userDatasets, patientId.Value);
                if (datasetId.HasValue)
                {
                    Session[Caisis.UI.Core.Classes.SessionKey.DatasetId] = datasetId;
                }
            }
        }

        /// <summary>
        /// Ends the current Service session
        /// </summary>
        protected void EndSession()
        {
            FormsAuthentication.SignOut();
            System.Threading.Thread.CurrentPrincipal = null;
        }

        #endregion

        #region Logging

        /// <summary>
        /// Logs and thorws a web service exception.
        /// </summary>
        /// <param name="username">Web Service UserName</param>
        /// <param name="method">Web Service Method</param>
        /// <param name="userErrorMessage">The Exception to signal CLIENT/USER.</param>
        /// <param name="errorCode">The error code</param>
        /// <returns></returns>
        protected Exception LogServiceException(string username, string method, string userErrorMessage, int errorCode)
        {
            string fullClientMessage = userErrorMessage;
            Exception ex = new Exception(userErrorMessage);
            return LogServiceException(username, method, userErrorMessage, ex, errorCode);
        }

        /// <summary>
        /// Logs and thorws a web service exception.
        /// </summary>
        /// <param name="username">Web Service UserName</param>
        /// <param name="method">Web Service Method</param>
        /// <param name="userErrorMessage">The Exception to signal CLIENT/USER.</param>
        /// <param name="ex">The exception published to the application log.</param>
        /// <param name="errorCode">The error code</param>
        /// <returns>The Exception which can be thrown to the client.</returns>
        protected Exception LogServiceException(string username, string method, string userErrorMessage, Exception ex, int errorCode)
        {
            // full message published to Caisis Error Handling
            string caisisErrorLogMessage = string.Format("Web Service Exception: UserName: '{0}' | Method: '{1}' | User Error: '{2}' | Error Code: '{3}'", username, method, userErrorMessage, errorCode);
            // !important, application will log original exception.
            Caisis.UI.Core.Classes.ExceptionHandler.Publish(ex, caisisErrorLogMessage);
            // !important, client exception, should only contain user message
            Exception clientException = new Exception(userErrorMessage + " (ERROR CODE: " + errorCode + ")");
            return clientException;
        }

        #endregion

        #region Patient Utilities

        /// <summary>
        /// Returns a list of the user's dataset id to sql
        /// </summary>
        /// <param name="username"></param>
        /// <returns></returns>
        protected IDictionary<int, string> GetDataSetSQL(string username)
        {
            var ct = new DataSetController();
            DataTable dt = new UserController().GetUserDatasets(username).Tables[0];
            var datasetIdToSQL = from row in dt.AsEnumerable()
                                 let datasetId = (int)row[Caisis.BOL.Dataset.DatasetId]
                                 select new
                                 {
                                     Id = datasetId,
                                     SQL = ct.GetDatasetSQL(datasetId),
                                 };
            return datasetIdToSQL.ToDictionary(d => d.Id, d => d.SQL);
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="userDatasets"></param>
        /// <param name="patientId"></param>
        /// <returns></returns>
        protected bool ValidatePatientInDataSet(IDictionary<int, string> userDatasets, int patientId)
        {
            return FindPatientInDataSet(userDatasets, patientId).HasValue;
        }

        /// <summary>
        /// For the given list of datasets, find the first datasetId to which the patient belongs.
        /// </summary>
        /// <param name="userDatasets"></param>
        /// <param name="patientId"></param>
        /// <returns></returns>
        protected int? FindPatientInDataSet(IDictionary<int, string> userDatasets, int patientId)
        {
            DataSetController ct = new DataSetController();
            // search each dataset for Patient
            foreach (var dataset in userDatasets)
            {
                int datasetId = dataset.Key;
                string datasetSQL = dataset.Value;
                bool patientInDataset = ct.IsPatientInDataset(patientId, datasetSQL);
                // found entry, return id
                if (patientInDataset)
                {
                    return datasetId;
                }
            }
            return null;
        }

        #endregion

    }

    /// <summary>
    /// WebServices which provide Caisis related services
    /// </summary>
    [WebService(Namespace = "http://www.caisis.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    // [System.Web.Script.Services.ScriptService]
    public class WebService : CaisisWebService
    {
        public WebService()
            : base()
        {
        }

        /// <summary>
        /// Gets the PatientId by MRN and Last Name
        /// NOTE: -1 = no patient found
        /// </summary>
        /// <param name="patientMRN">The Patient's MRN</param>
        /// <param name="patientLastName">The Patient's Last Name</param>
        /// <param name="username">Caisis username</param>
        /// <param name="password">Caisis password</param>
        /// <returns></returns>
        [WebMethod(Description = "Gets the PatientId by MRN and Last Name, -1 = NO PATIENT FOUND")]
        public int GetPatientIdByMRNAndLastName(string patientMRN, string patientLastName, string username, string password)
        {
            int? patientId = null;
            if (IsUserAuthenticated("GetPatientIdByMRNAndLastName", null, username, password))
            {
                int? _patientId = _GetPatientIdByIdentifier(patientLastName, patientMRN, null);
                // if patient found, validate user can view patient
                if (_patientId.HasValue && IsUserAuthenticated("GetPatientIdByMRNAndLastName", _patientId.Value, username, password))
                {
                    patientId = _patientId.Value;
                }
            }
            return patientId.HasValue ? patientId.Value : -1;
        }

        /// <summary>
        /// Gets the PatientId by MRN and Date of Birth
        /// NOTE: -1 = no patient found
        /// </summary>
        /// <param name="patientMRN">The Patient's MRN</param>
        /// <param name="dob">The Patient's Date of Birth</param>
        /// <param name="username">Caisis username</param>
        /// <param name="password">Caisis password</param>
        /// <returns></returns>
        [WebMethod(Description = "Gets the PatientId by MRN and Date of Birth, -1 = NO PATIENT FOUND")]
        public int GetPatientIdByMRNAndDOB(string patientMRN, DateTime dob, string username, string password)
        {
            int? patientId = null;
            if (IsUserAuthenticated("GetPatientIdByMRNAndDOB", null, username, password))
            {
                int? _patientId = _GetPatientIdByIdentifier(string.Empty, patientMRN, dob);
                // if patient found, validate user can view patient
                if (_patientId.HasValue && IsUserAuthenticated("GetPatientIdByMRNAndDOB", _patientId.Value, username, password))
                {
                    patientId = _patientId.Value;
                }
            }
            return patientId.HasValue ? patientId.Value : -1;
        }

        /// <summary>
        /// Gets the PatientId by MRN + (LastName || DOB)
        /// </summary>
        /// <param name="patientLastName"></param>
        /// <param name="patientMRN"></param>
        /// <param name="dob"></param>
        /// <returns></returns>
        private int? _GetPatientIdByIdentifier(string patientLastName, string patientMRN, DateTime? dob)
        {
            int? patientId = null;
            // validate MRN
            if (!string.IsNullOrEmpty(patientMRN))
            {
                // search by Name + MRN
                if (!string.IsNullOrEmpty(patientLastName))
                {
                    var patients = BOL.BusinessObject.GetByFields<BOL.Patient>(new Dictionary<string, object>
                        {
                            { BOL.Patient.PtLastName, patientLastName },
                            { BOL.Patient.PtMRN, patientMRN }
                        });
                    if (patients.Count() > 0)
                    {
                        patientId = (int)patients.First()[BOL.Patient.PatientId];
                    }
                }
                // search by MRN + DOB if none found by Name + MRN
                if (!patientId.HasValue && dob.HasValue)
                {
                    DataTable ptSearch = new PatientDa().GetPatientByMRNAndDOB(patientMRN, dob.Value);
                    if (ptSearch.Rows.Count > 0)
                    {
                        patientId = (int)ptSearch.Rows[0]["PatientId"];
                    }
                }
            }
            return patientId;
        }

        [WebMethod(Description = "Search for a patient by MRN AND (Last Name OR Date of Birth).")]
        public PatientSeachResult GetPatientIdByIdentifiers(string patientMRN, string patientLastName, DateTime? patientDOB, string username, string password)
        {
            // validate web method
            if (IsUserAuthenticated("GetPatientIdByIdentifiers", null, username, password))
            {
                PatientSeachResult result = GetPatientId(patientMRN, patientLastName, patientDOB, username);
                return result;
            }
            // default
            PatientSeachResult emptyResult = new PatientSeachResult();
            emptyResult.ErrorCode = WebServiceCodes.INVALID_CREDENTIALS;
            emptyResult.PatientId = null;
            return emptyResult;
        }

        private PatientSeachResult GetPatientId(string patientMRN, string patientLastName, DateTime? patientDOB, string username)
        {
            // found patient
            int? patientId = null;
            // search
            int error = WebServiceCodes.PATIENT_NOT_FOUND;
            // required: validate MRN
            if (!string.IsNullOrEmpty(patientMRN))
            {
                PatientDa da = new PatientDa();
                // get a list of patients by MRN
                DataTable found = da.GetPatientByMRN(patientMRN);
                var foundPatients = from row in found.AsEnumerable()
                                    let id = (int)row[BOL.Patient.PatientId]
                                    let mrn = row[BOL.Patient.PtMRN].ToString()
                                    let lastName = row[BOL.Patient.PtLastName].ToString()
                                    let dob = !row.IsNull(BOL.Patient.PtBirthDate) ? (DateTime)row[BOL.Patient.PtBirthDate] : (DateTime?)null
                                    select new
                                    {
                                        PatientId = id,
                                        LastName = lastName,
                                        MRN = mrn,
                                        DOB = dob
                                    };
                // if results found, validate against 2nd field
                if (foundPatients.Count() > 0)
                {
                    int? foundPatientId = null;
                    // validate against last name
                    if (!string.IsNullOrEmpty(patientLastName))
                    {
                        var foundByLastName = foundPatients.Where(p => patientLastName.Equals(p.LastName, StringComparison.OrdinalIgnoreCase));
                        if (foundByLastName.Count() == 1)
                        {
                            foundPatientId = foundByLastName.First().PatientId;
                        }
                        // error
                        else if (foundByLastName.Count() > 1)
                        {
                            error = WebServiceCodes.PATIENT_NOT_FOUND_AMBIGIOUS;
                        }
                        // error
                        else
                        {
                            error = WebServiceCodes.PATIENT_NOT_FOUND_LAST_NAME;
                        }
                    }
                    // validate against dob
                    else if (patientDOB.HasValue)
                    {
                        var foundByDOB = foundPatients.Where(p => p.DOB.HasValue && patientDOB.Value.Date == p.DOB.Value.Date);
                        if (foundByDOB.Count() == 1)
                        {
                            foundPatientId = foundByDOB.First().PatientId;
                        }
                        else if (foundByDOB.Count() > 1)
                        {
                            error = WebServiceCodes.PATIENT_NOT_FOUND_AMBIGIOUS;
                        }
                        // error
                        else
                        {
                            error = WebServiceCodes.PATIENT_NOT_FOUND_DOB;
                        }
                    }
                    // validation: dataset
                    if (foundPatientId.HasValue)
                    {
                        var userDatasets = GetDataSetSQL(username);
                        // validate user can view patient
                        bool canViewPatient = ValidatePatientInDataSet(userDatasets, foundPatientId.Value);
                        if (canViewPatient)
                        {
                            patientId = foundPatientId;
                            error = WebServiceCodes.PATIENT_FOUND;
                        }
                        else
                        {
                            error = WebServiceCodes.PATIENT_NOT_IN_DATASET;
                        }
                    }
                }
                else
                {
                    error = WebServiceCodes.PATIENT_NOT_FOUND;
                }
            }
            else
            {
                error = WebServiceCodes.PATIENT_NOT_FOUND_MRN;
            }

            PatientSeachResult result = new PatientSeachResult();
            result.PatientId = patientId;
            result.ErrorCode = error;
            return result;
        }

        /// <summary>
        /// Gets a list of Prostate Patient Data Elements
        /// </summary>
        /// <param name="patientId">Caisis PatientId</param>
        /// <param name="username">Caisis username</param>
        /// <param name="password">Caisis password</param>
        /// <returns>Data Elements</returns>
        [WebMethod(Description = "Gets a list of Prostate Patient Data Elements")]
        public ProstatePatientDataElements GetProstatePatientDataElements(int patientId, string username, string password)
        {
            ProstatePatientDataElements data_points = new ProstatePatientDataElements();
            if (IsUserAuthenticated("GetProstatePatientDataElements", patientId, username, password))
            {
                Func<string, bool?> parse =
                    s =>
                    {
                        switch (s)
                        {
                            case "1":
                                return true;
                            case "0":
                                return false;
                            default:
                                return null;
                        }
                    };

                Func<IDataRecord, bool> consumer =
                    record =>
                    {
                        Func<string, XElement> xe = s => new XElement(s, record[s]);

                        data_points.PatientId = xe("PatientId").Value;
                        data_points.PtAge = xe("PtAge").Value;
                        data_points.PreSurgeryPSA = xe("PreSurgeryPSA").Value;
                        data_points.RPDate = xe("RPDate").Value;
                        data_points.PathGG1 = xe("PathGG1").Value;
                        data_points.PathGG2 = xe("PathGG2").Value;
                        data_points.ECE = xe("ECE").Value;
                        data_points.ECE_Parsed = parse(xe("ECE_Parsed").Value);
                        data_points.SVI = xe("SVI").Value;
                        data_points.SVI_Parsed = parse(xe("SVI_Parsed").Value);
                        data_points.LNI = xe("LNI").Value;
                        data_points.LNI_Parsed = parse(xe("LNI_Parsed").Value);
                        data_points.PLND = xe("PLND").Value;
                        data_points.Smoker = xe("Smoker").Value;
                        return false;
                    };

                WebServiceDa.ConsumeStarDataPoints(patientId, consumer);
            }

            return data_points;
        }

        /// <summary>
        /// Returns the Patient's PSA Chart as a base-64 encoded PNG
        /// </summary>
        /// <param name="patientId">Caisis PatientId</param>
        /// <param name="username">Caisis username</param>
        /// <param name="password">Caisis password</param>
        /// <returns></returns>
        [WebMethod(Description = "Returns the Patient's PSA Chart as a base-64 encoded PNG")]
        public string GetPatientPSAChart(int patientId, string username, string password)
        {
            if (IsUserAuthenticated("GetPatientPSAChart", patientId, username, password))
            {
                CaisisChart chart = ChartingUtil.GetPatientPSAChart(patientId);
                return GetBase64EncodedChart(chart); ;
            }
            else
            {
                return string.Empty;
            }
        }

        /// <summary>
        /// Returns a Patient's Erectile Function Chart as a base-64 encoded PNG
        /// </summary>
        /// <param name="patientId">Caisis PatientId</param>
        /// <param name="username">Caisis username</param>
        /// <param name="password">Caisis password</param>
        /// <returns></returns>
        [WebMethod(Description = "Returns a Patient's Erectile Function Chart as a base-64 encoded PNG")]
        public string GetPatientErectileFunctionChart(int patientId, string username, string password)
        {
            if (IsUserAuthenticated("GetPatientErectileFunctionChart", patientId, username, password))
            {
                ProstateQOLChartBuilder builder = new ProstateQOLChartBuilder(patientId);
                CaisisChart chart = builder.GetErectileFunctionChart();
                if (chart != null)
                {
                    return GetBase64EncodedChart(chart);
                }
                else
                {
                    return string.Empty;
                }
            }
            else
            {
                return string.Empty;
            }
        }

        /// <summary>
        /// Returns a Patient's Expected and Actual Erectile Function Chart as a base-64 encoded PNG
        /// </summary>
        /// <param name="patientId">Caisis PatientId</param>
        /// <param name="username">Caisis username</param>
        /// <param name="password">Caisis password</param>
        /// <returns></returns>
        [WebMethod(Description = "Returns a Patient's Expected and Actual Erectile Function Chart as a base-64 encoded PNG")]
        public string GetPatientExpectedErectileFunctionChart(int patientId, string username, string password)
        {
            if (IsUserAuthenticated("GetPatientExpectedErectileFunctionChart", patientId, username, password))
            {
                ProstateQOLChartBuilder builder = new ProstateQOLChartBuilder(patientId);
                CaisisChart chart = builder.GetErectileFunctionChart();
                if (chart != null)
                {
                    PatientOutcomesServiceAdapter adapter = new PatientOutcomesServiceAdapter(Context.Request.PhysicalApplicationPath);
                    PatientOutcomesResults results = adapter.GetPatientOutcomes(patientId);
                    adapter.AddErectileOutcomesToChart(chart, results);
                    return GetBase64EncodedChart(chart);
                }
                else
                {
                    return string.Empty;
                }
            }
            else
            {
                return string.Empty;
            }
        }

        /// <summary>
        /// Returns a Patient's Urinary Function Chart as a base-64 encoded PNG
        /// </summary>
        /// <param name="patientId">Caisis PatientId</param>
        /// <param name="username">Caisis username</param>
        /// <param name="password">Caisis password</param>
        /// <returns></returns>
        [WebMethod(Description = "Returns a Patient's Urinary Function Chart as a base-64 encoded PNG")]
        public string GetPatientUrinaryFunctionChart(int patientId, string username, string password)
        {
            if (IsUserAuthenticated("GetPatientUrinaryFunctionChart", patientId, username, password))
            {
                ProstateQOLChartBuilder builder = new ProstateQOLChartBuilder(patientId);
                CaisisChart chart = builder.GetUrinaryFunctionChart();
                if (chart != null)
                {
                    return GetBase64EncodedChart(chart);
                }
                else
                {
                    return string.Empty;
                }
            }
            else
            {
                return string.Empty;
            }
        }

        /// <summary>
        /// Returns a Patient's Expected and Actual Urinary Function Chart as a base-64 encoded PNG
        /// </summary>
        /// <param name="patientId">Caisis PatientId</param>
        /// <param name="username">Caisis username</param>
        /// <param name="password">Caisis password</param>
        /// <returns></returns>
        [WebMethod(Description = "Returns a Patient's Expected and Actual Urinary Function Chart as a base-64 encoded PNG")]
        public string GetPatientExpectedUrinaryFunctionChart(int patientId, string username, string password)
        {
            if (IsUserAuthenticated("GetPatientExpectedUrinaryFunctionChart", patientId, username, password))
            {
                ProstateQOLChartBuilder builder = new ProstateQOLChartBuilder(patientId);
                CaisisChart chart = builder.GetUrinaryFunctionChart();
                if (chart != null)
                {
                    PatientOutcomesServiceAdapter adapter = new PatientOutcomesServiceAdapter(Context.Request.PhysicalApplicationPath);
                    PatientOutcomesResults results = adapter.GetPatientOutcomes(patientId);
                    adapter.AddUrinaryOutcomesToChart(chart, results);
                    return GetBase64EncodedChart(chart);
                }
                else
                {
                    return string.Empty;
                }
            }
            else
            {
                return string.Empty;
            }
        }


        /// <summary>
        /// Returns a Patient's Prostate Alerts from the Survivorship Report
        /// </summary>
        /// <param name="patientId">Caisis PatientId</param>
        /// <param name="username">Caisis username</param>
        /// <param name="password">Caisis password</param>
        /// <returns></returns>
        [WebMethod(Description = "Returns a Patient's Prostate Alerts from the Survivorship Report")]
        public PatientProstateAlerts GetPatientProstateAlerts(int patientId, string username, string password)
        {
            PatientProstateAlerts alerts = new PatientProstateAlerts();

            if (IsUserAuthenticated("GetPatientProstateAlerts", patientId, username, password))
            {
                ProstateQOLChartBuilder builder = new ProstateQOLChartBuilder(patientId);

                alerts.ErectileAlertCount = builder.ErectileAlerts.Count();
                alerts.ErectileAlertMessage = alerts.ErectileAlertCount > 0 ? "Erectile dysfunction" : "";
                alerts.ErectileFirstAlertDate = alerts.ErectileAlertCount > 0 ? builder.ErectileAlerts.First().ToString("MM/dd/yyyy") : "";

                alerts.PadAlertCount = builder.PadAlerts.Count();
                alerts.PadAlertMessage = alerts.PadAlertCount > 0 ? "Urinary dysfunction more than 1 yr after surgery" : "";
                alerts.PadFirstAlertDate = alerts.PadAlertCount > 0 ? builder.PadAlerts.First().ToString("MM/dd/yyyy") : "";

                alerts.UrinaryDeclineAlertCount = builder.UrinaryDeclineAlerts.Count();
                alerts.UrinaryDeclineAlertMessage = alerts.UrinaryDeclineAlertCount > 0 ? "Decline in urinary function" : "";
                alerts.UrinaryDeclineFirstAlertDate = alerts.UrinaryDeclineAlertCount > 0 ? builder.UrinaryDeclineAlerts.First().ToString("MM/dd/yyyy") : "";

                alerts.BowelAlertCount = builder.BowelAlerts.Count();
                alerts.BowelAlertMessage = alerts.BowelAlertCount > 0 ? "Bowel dysfunction" : "";
                alerts.BowelFirstAlertDate = alerts.BowelAlertCount > 0 ? builder.BowelAlerts.First().ToString("MM/dd/yyyy") : "";

                alerts.QualityOfLifeAlertCount = builder.QolAlerts.Count();
                alerts.QualityOfLifeAlertMessage = alerts.QualityOfLifeAlertCount > 0 ? "Low health related quality of life" : "";
                alerts.QualityOfLifeFirstAlertDate = alerts.QualityOfLifeAlertCount > 0 ? builder.QolAlerts.First().ToString("MM/dd/yyyy") : "";
            }

            return alerts;
        }

        public string GetProstateQOLForm(int patientId)
        {
            System.IO.StringWriter writer = new System.IO.StringWriter();
            Server.Execute("~/Core/PaperForms/FormsContent.aspx?formType=ProstateQOLResults.ascx&base64=true", writer);
            string html = writer.ToString();
            return html;
        }

        public string GetBreastQReportForm(int patientId)
        {
            System.IO.StringWriter writer = new System.IO.StringWriter();
            Server.Execute("~/Core/PaperForms/FormsContent.aspx?formType=BreastSurvey.ascx&base64=true", writer);
            string html = writer.ToString();
            return html;
        }

        public string GetBreastSurgeryClinicalSummaryReport(int patientId)
        {
            System.IO.StringWriter writer = new System.IO.StringWriter();
            Server.Execute("~/Core/PaperForms/FormsContent.aspx?formType=BreastSurgeryClinicalSummary.ascx&base64=true", writer);
            string html = writer.ToString();
            return html;
        }

        public string GetActiveSurveillanceSurvivorshipForm(int patientId)
        {
            System.IO.StringWriter writer = new System.IO.StringWriter();
            Server.Execute("~/Core/PaperForms/FormsContent.aspx?formType=ActiveSurveillanceSurvivorship.ascx&base64=true", writer);
            string html = writer.ToString();
            return html;
        }

        public string GetKidneyClinicalSummaryReport(int patientId)
        {
            System.IO.StringWriter writer = new System.IO.StringWriter();
            Server.Execute("~/Core/PaperForms/FormsContent.aspx?formType=KidneyClinicalSummary.ascx&base64=true", writer);
            string html = writer.ToString();
            return html;
        }

        public string GetColorectalSummaryReport(int patientId)
        {
            System.IO.StringWriter writer = new System.IO.StringWriter();
            Server.Execute("~/Core/PaperForms/FormsContent.aspx?formType=StomaSurvey.ascx&base64=true", writer);
            string html = writer.ToString();
            return html;
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="patientId"></param>
        /// <param name="username"></param>
        /// <param name="password"></param>
        /// <returns></returns>
        [WebMethod(Description = "Returns the HTML output for the Prostate QOL Results form for the Patient.", EnableSession = true)]
        public string GetProstateQOLForm(int patientId, string username, string password)
        {
            if (IsUserAuthenticated("GetProstateQOLForm", patientId, username, password))
            {
                StartSession(username, patientId);
                string html = GetProstateQOLForm(patientId);
                EndSession();
                return html;
            }
            else
            {
                return string.Empty;
            }
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="patientId"></param>
        /// <param name="username"></param>
        /// <param name="password"></param>
        [WebMethod(Description = "Returns the HTML output for the BreastQ Report for the Patient.", EnableSession = true)]
        public string GetBreastQReportForm(int patientId, string username, string password)
        {
            if (IsUserAuthenticated("GetBreastQForm", patientId, username, password))
            {
                StartSession(username, patientId);
                string html = GetBreastQReportForm(patientId);
                EndSession();
                return html;
            }
            else
            {
                return string.Empty;
            }
        }

                /// <summary>
        /// 
        /// </summary>
        /// <param name="patientId"></param>
        /// <param name="username"></param>
        /// <param name="password"></param>
        [WebMethod(Description = "Returns the HTML output for the Breast Surgery Clinical Summary for the Patient.", EnableSession = true)]
        public string GetBreastSurgeryClinicalSummaryReport(int patientId, string username, string password)
        {
            if (IsUserAuthenticated("GetBreastSurgeryClinicalSummaryReport", patientId, username, password))
            {
                StartSession(username, patientId);
                string html = GetBreastSurgeryClinicalSummaryReport(patientId);
                EndSession();
                return html;
            }
            else
            {
                return string.Empty;
            }
        }
        
        [WebMethod(Description = "Returns the HTML output for the Active Surveillance Survivorship form for the Patient.", EnableSession = true)]
        /// <summary>
        /// 
        /// </summary>
        /// <param name="patientId"></param>
        /// <param name="username"></param>
        /// <param name="password"></param>
        /// <returns></returns>
        public string GetActiveSurveillanceSurvivorshipForm(int patientId, string username, string password)
        {
            if (IsUserAuthenticated("GetActiveSurveillanceSurvivorshipForm", patientId, username, password))
            {
                StartSession(username, patientId);
                string html = GetActiveSurveillanceSurvivorshipForm(patientId);
                EndSession();
                return html;
            }
            else
            {
                return string.Empty;
            }
        }

        [WebMethod(Description = "Returns the HTML output for the Kidney Clinical Summary Report for the Patient.", EnableSession = true)]
        /// <summary>
        /// 
        /// </summary>
        /// <param name="patientId"></param>
        /// <param name="username"></param>
        /// <param name="password"></param>
        /// <returns></returns>
        public string GetKidneyClinicalSummaryReport(int patientId, string username, string password)
        {
            if (IsUserAuthenticated("GetKidneyClinicalSummaryReport", patientId, username, password))
            {
                StartSession(username, patientId);
                string html = GetKidneyClinicalSummaryReport(patientId);
                EndSession();
                return html;
            }
            else
            {
                return string.Empty;
            }
        }

        [WebMethod(Description = "Returns the HTML output for the Colorectal Clinical Summary Report for the Patient.", EnableSession = true)]
        /// <summary>
        /// 
        /// </summary>
        /// <param name="patientId"></param>
        /// <param name="username"></param>
        /// <param name="password"></param>
        /// <returns></returns>
        public string GetColorectalSummaryReport(int patientId, string username, string password)
        {
            if (IsUserAuthenticated("GetColorectalSummaryReport", patientId, username, password))
            {
                StartSession(username, patientId);
                string html = GetColorectalSummaryReport(patientId);
                EndSession();
                return html;
            }
            else
            {
                return string.Empty;
            }
        }

        /// <summary>
        /// Return patient outcomes for SAM.
        /// </summary>
        /// <param name="patientId">Caisis PatientId</param>
        /// <param name="username">Caisis username</param>
        /// <param name="password">Caisis password</param>
        /// <returns></returns>
        [WebMethod(Description = "Return patient outcomes for SAM.")]
        public PatientOutcomesResults GetPatientOutcomes(int patientId, string username, string password)
        {
            if (IsUserAuthenticated("GetPatientOutcomes", patientId, username, password))
            {
                string path = this.Context.Request.PhysicalApplicationPath;
                PatientOutcomesServiceAdapter service = new PatientOutcomesServiceAdapter(path);
                return service.GetPatientOutcomes(patientId);
            }
            else
            {
                return new PatientOutcomesResults();
            }
        }

        /// <summary>
        /// Return SAM BCR status for a patient.
        /// </summary>
        /// <param name="patientId">Caisis PatientId</param>
        /// <param name="username">Caisis username</param>
        /// <param name="password">Caisis password</param>
        /// <returns></returns>
        [WebMethod(Description = "Return SAM BCR status for a patient.")]
        public PatientBCRStatus GetPatientBCRStatus(int patientId, string username, string password)
        {
            PatientBCRStatus bcr = new PatientBCRStatus();

            if (IsUserAuthenticated("GetPatientHadBCR", patientId, username, password))
            {
                Func<IDataRecord, bool> consumer =
                    record =>
                    {
                        bcr.BCR = record["bcr"].ToString();
                        bcr.BCRDate = record["bcrdate"].ToString();
                        bcr.LastFollowupDate = record["lastfollowupdate"].ToString();
                        bcr.LastPSADate = record["lastpsadate"].ToString();
                        bcr.SurgDate = record["surgdate"].ToString();
                        return false;
                    };

                PatientOutcomesDa da = new PatientOutcomesDa();
                da.ConsumeBCRStatus(patientId, consumer);
            }

            return bcr;
        }

        /// <summary>
        /// For the given Patient, inserts a Survey and associated Responses/SurveyItems.
        /// </summary>
        /// <param name="patientLastName">The Patient's Last Name</param>
        /// <param name="patientMRN">The Patient's MRN</param>
        /// <param name="dob">The Patient's DOB</param>
        /// <param name="survey">The Survey containing SurveyItem reponses</param>
        /// <param name="username">Caisis username</param>
        /// <param name="password">Caisis password</param>
        /// <returns></returns>
        [WebMethod(Description = "For the given Patient by Last Name and (MRN or DOB), inserts a Survey and associated Responses/SurveyItems.", EnableSession = true)]
        public bool InsertPatientSurveyByIdentifiers(string patientLastName, string patientMRN, DateTime dob, PatientSurvey survey, string username, string password)
        {
            return _InsertPatientSurveyByIdentifiers(patientLastName, patientMRN, dob, survey, username, password);
        }

        /// <summary>
        /// For the given Patient, inserts a Survey and associated Responses/SurveyItems.
        /// </summary>
        /// <param name="patientLastName">The Patient's Last Name</param>
        /// <param name="patientMRN">The Patient's MRN</param>
        /// <param name="survey">The Survey containing SurveyItem reponses</param>
        /// <param name="username">Caisis username</param>
        /// <param name="password">Caisis password</param>
        /// <returns></returns>
        [WebMethod(Description = "For the given Patient by Last Name and MRN, inserts a Survey and associated Responses/SurveyItems.", EnableSession = true)]
        public bool InsertPatientSurveyByNameMRN(string patientLastName, string patientMRN, PatientSurvey survey, string username, string password)
        {
            return _InsertPatientSurveyByIdentifiers(patientLastName, patientMRN, null, survey, username, password);
        }

        /// <summary>
        /// For the given Patient, inserts a Survey and associated Responses/SurveyItems.
        /// </summary>
        /// <param name="patientMRN">The Patient's MRN</param>
        /// <param name="dob">The Patient's DOB</param>
        /// <param name="survey">The Survey containing SurveyItem reponses</param>
        /// <param name="username">Caisis username</param>
        /// <param name="password">Caisis password</param>
        /// <returns></returns>
        [WebMethod(Description = "For the given Patient by MRN and DOB, inserts a Survey and associated Responses/SurveyItems.", EnableSession = true)]
        public bool InsertPatientSurveyByDOBMRN(string patientMRN, DateTime dob, PatientSurvey survey, string username, string password)
        {
            return _InsertPatientSurveyByIdentifiers(string.Empty, patientMRN, dob, survey, username, password);
        }

        /// <summary>
        /// Inserts the survey for the given patient by identifiers
        /// </summary>
        /// <param name="patientLastName"></param>
        /// <param name="patientMRN"></param>
        /// <param name="dob"></param>
        /// <param name="survey"></param>
        /// <param name="username"></param>
        /// <param name="password"></param>
        /// <returns></returns>
        private bool _InsertPatientSurveyByIdentifiers(string patientLastName, string patientMRN, DateTime? dob, PatientSurvey survey, string username, string password)
        {
            // validate
            if (IsUserAuthenticated("InsertPatientSurveyByNameMRN", null, username, password))
            {
                // lookup patient
                int? patientId = _GetPatientIdByIdentifier(patientLastName, patientMRN, dob);
                if (patientId.HasValue)
                {
                    return InsertPatientSurvey(patientId.Value, survey, username, password);
                }
            }
            return false;
        }

        /// <summary>
        /// For the given Patient, inserts a Survey and associated Responses/SurveyItems.
        /// </summary>
        /// <param name="patientId">Caisis PatientId</param>
        /// <param name="survey">The Survey containing SurveyItem reponses</param>
        /// <param name="username">Caisis username</param>
        /// <param name="password">Caisis password</param>
        /// <returns></returns>
        [WebMethod(Description = "For the given Patient, inserts a Survey and associated Responses/SurveyItems.", EnableSession = true)]
        public bool InsertPatientSurvey(int patientId, PatientSurvey survey, string username, string password)
        {
            bool inserted = false;
            if (IsUserAuthenticated("InsertPatientSurvey", patientId, username, password))
            {
                bool surveyValid = ValidateSurvey(survey);
                if (!surveyValid)
                {
                    return false;
                }
                else
                {
                    // init session for service User
                    StartSession(username, patientId);

                    // INSERT SURVEY AND SURVEY ITEMS

                    try
                    {
                        // SURVEY
                        Caisis.BOL.Survey surveyBiz = new Caisis.BOL.Survey();
                        // set required fields
                        surveyBiz[Caisis.BOL.Patient.PatientId] = patientId;

                        // fill Survey Fields
                        surveyBiz[Caisis.BOL.Survey.SurveyType] = survey.SurveyType;
                        surveyBiz[Caisis.BOL.Survey.SurveyResult] = survey.SurveyResult;
                        surveyBiz[Caisis.BOL.Survey.SurveyTotal] = survey.SurveyTotal;
                        surveyBiz[Caisis.BOL.Survey.SurveyVersion] = survey.SurveyVersion;
                        surveyBiz[Caisis.BOL.Survey.SurveyNotes] = survey.SurveyNotes;
                        surveyBiz[Caisis.BOL.Survey.SurveyDataSource] = survey.SurveyDataSource;
                        surveyBiz[Caisis.BOL.Survey.SurveyQuality] = survey.SurveyQuality;
                        surveyBiz[Caisis.BOL.Survey.SurveyClinician] = survey.SurveyClinician;

                        // special case for dates
                        if (survey.SurveyDate != null && survey.SurveyDate.ToString() != string.Empty)
                        {
                            // zero out time component
                            DateTime zeroedDate = new DateTime(survey.SurveyDate.Year, survey.SurveyDate.Month, survey.SurveyDate.Day, 0, 0, 0);
                            surveyBiz[BOL.Survey.SurveyDate] = zeroedDate;
                            surveyBiz[BOL.Survey.SurveyDateText] = zeroedDate.ToShortDateString();
                        }

                        // save survey and capture key for survey items
                        surveyBiz[BOL.Survey.EnteredBy] = username;
                        surveyBiz.AppendToUserName(ENTERED_BY_SERVICE);
                        surveyBiz.Save();
                        int surveyId = (int)surveyBiz[surveyBiz.PrimaryKeyName];

                        // SURVEY RELATED RECORD
                        if (!string.IsNullOrEmpty(survey.RelatedSystem) && !string.IsNullOrEmpty(survey.RelatedSystemTable))
                        {
                            BOL.RelatedRecord relatedRecord = new Caisis.BOL.RelatedRecord();
                            relatedRecord[BOL.RelatedRecord.SrcSystem] = survey.RelatedSystem;
                            relatedRecord[BOL.RelatedRecord.SrcTableName] = survey.RelatedSystemTable;
                            relatedRecord[BOL.RelatedRecord.SrcPrimaryKey] = survey.RelatedSystemPrimaryKey;
                            relatedRecord[BOL.RelatedRecord.DestTableName] = surveyBiz.TableName;
                            relatedRecord[BOL.RelatedRecord.DestPrimaryKey] = surveyId;
                            relatedRecord[BOL.RelatedRecord.EnteredBy] = username;
                            relatedRecord.AppendToUserName(ENTERED_BY_SERVICE);
                            relatedRecord.Save();
                        }

                        // SURVEY ITEMS

                        //for each survey item, insert for parent survey
                        foreach (PatientSurveyItem surveyItem in survey.PatientSurveyItems)
                        {
                            // Create new SurveyItem
                            BOL.SurveyItem itemBiz = new Caisis.BOL.SurveyItem();
                            // set parent survey id
                            itemBiz[BOL.SurveyItem.SurveyId] = surveyId;

                            // set SurveyItem fields
                            itemBiz[BOL.SurveyItem.SurveyItemNum] = surveyItem.SurveyItemNum;
                            itemBiz[BOL.SurveyItem.SurveyItem_Field] = surveyItem.SurveyItem;
                            itemBiz[BOL.SurveyItem.SurveyItemResult] = surveyItem.SurveyItemResult;
                            itemBiz[BOL.SurveyItem.SurveyItemTotal] = surveyItem.SurveyItemTotal;
                            itemBiz[BOL.SurveyItem.SurveyItemNotes] = surveyItem.SurveyItemNotes;

                            // save item
                            itemBiz[BOL.SurveyItem.EnteredBy] = username;
                            itemBiz.AppendToUserName(ENTERED_BY_SERVICE);
                            itemBiz.Save();
                            int surveyItemId = (int)itemBiz[itemBiz.PrimaryKeyName];

                            // create related record
                            if (!string.IsNullOrEmpty(surveyItem.RelatedSystem) && !string.IsNullOrEmpty(surveyItem.RelatedSystemTable))
                            {
                                BOL.RelatedRecord relatedRecord = new Caisis.BOL.RelatedRecord();
                                relatedRecord[BOL.RelatedRecord.SrcSystem] = surveyItem.RelatedSystem;
                                relatedRecord[BOL.RelatedRecord.SrcTableName] = surveyItem.RelatedSystemTable;
                                relatedRecord[BOL.RelatedRecord.SrcPrimaryKey] = surveyItem.RelatedSystemPrimaryKey;
                                relatedRecord[BOL.RelatedRecord.DestTableName] = itemBiz.TableName;
                                relatedRecord[BOL.RelatedRecord.DestPrimaryKey] = surveyItemId;
                                relatedRecord[BOL.RelatedRecord.EnteredBy] = username;
                                relatedRecord.AppendToUserName(ENTERED_BY_SERVICE);
                                relatedRecord.Save();
                            }
                        }

                        // records inserted fine
                        inserted = true;
                    }
                    // error inserting records, log error, return false to user
                    catch (Exception ex)
                    {
                        LogServiceException(username, "InsertPatientSurvey", "Error Inserting Survey and Survey Items", ex, WebServiceCodes.METHOD_EXCEPTION);
                        inserted = false;
                    }

                    // END INSERT SURVEY AND SURVEY ITEMS

                    // end session
                    EndSession();

                    return inserted;
                }
            }
            else
            {
                return inserted;
            }
        }

        /// <summary>
        /// Validates survey data
        /// </summary>
        /// <param name="survey"></param>
        /// <returns></returns>
        private static bool ValidateSurvey(PatientSurvey survey)
        {
            bool valid = true;
            // validate survey items
            foreach (PatientSurveyItem surveyItem in survey.PatientSurveyItems)
            {
                if (surveyItem == null)
                {
                    valid = false;
                    break;
                }
                Dictionary<string, string> fields = new Dictionary<string, string>
                {
                    { BOL.SurveyItem.SurveyItemNum ,surveyItem.SurveyItemNum },
                    { BOL.SurveyItem.SurveyItem_Field ,surveyItem.SurveyItem },
                    { BOL.SurveyItem.SurveyItemResult , surveyItem.SurveyItemResult },
                    { BOL.SurveyItem.SurveyItemTotal , surveyItem.SurveyItemTotal },
                    { BOL.SurveyItem.SurveyItemNotes , surveyItem.SurveyItemNotes }
                };
                foreach (var field in fields)
                {
                    int? maxLength = BOL.BusinessObject.GetFieldMaxLength("SurveyItems", field.Key);
                    if (!string.IsNullOrEmpty(field.Value) && maxLength.HasValue && maxLength.Value < field.Value.Length)
                    {
                        valid = false;
                        break;
                    }
                }
            }
            return valid;
        }

        [WebMethod(Description = "For the given Survey, get the score", EnableSession = false)]
        public int GetBreastQSurveyScore(PatientSurvey survey, string username, string password)
        {
            int score = CaisisBreastQEngine.NO_RESPONSE_VALUE;
            if (IsUserAuthenticated("GetBreastQSurveyScore", null, username, password))
            {
                string surveyType = survey.SurveyType;
                Dictionary<string, string> questionsAndResults = survey.PatientSurveyItems.ToDictionary(si => si.SurveyItemNum, si => si.SurveyItemResult);
                CaisisBreastQEngine engine = new CaisisBreastQEngine();
                score = engine.GetSurveyScore(surveyType, questionsAndResults);
            }
            return score;
        }


        [WebMethod(Description = "For the given Patient, return if they are currently on active surveillance.", EnableSession = true)]
        public bool[] QueryActiveSurveillancePatient(PatientObject patient, string username, string password)
        {
            if (IsUserAuthenticated("QueryActiveSurveillancePatient", null, username, password))
            {
                return QueryActiveSurveillancePatients(patient);
            }
            return new bool[0];
        }

        [WebMethod(Description = "For the given list of Patients, return if they are currently on active surveillance.", EnableSession = true)]
        public bool[] QueryActiveSurveillancePatients(PatientObject[] patients, string username, string password)
        {
            if (IsUserAuthenticated("QueryActiveSurveillancePatients", null, username, password))
            {
                return QueryActiveSurveillancePatients(patients);
            }
            return new bool[0];
        }

        [WebMethod(Description = "Queries a Colorectal patient for an Active Surveillance Status Date.")]
        public PatientActiveSurveillanceStatus QueryColorectalActiveSurveillanceStatus(PatientObject patient, string username, string password)
        {
            // search Patient
            PatientSeachResult patientResult = GetPatientIdByIdentifiers(patient.MRN, patient.Name, patient.DOB, username, password);
            int? patientId = patientResult.PatientId;
            // create Status
            PatientActiveSurveillanceStatus status = new PatientActiveSurveillanceStatus();
            // set patient code
            status.ErrorCode = patientResult.ErrorCode;
            // get status
            status.StatusDate = null;
            if (patientId.HasValue && IsUserAuthenticated("QueryColorectalActiveSurveillanceStatus", patientId, username, password))
            {
                StatusDa da = new StatusDa();
                status.StatusDate = da.QueryColorectalActiveSurvailance(patientId.Value);
            }
            return status;
        }

        public bool[] QueryActiveSurveillancePatients(params PatientObject[] patients)
        {
            // create ordered return values, default to false
            bool[] returnValues = new bool[patients.Length];
            for (int i = 0; i < returnValues.Length; i++)
                returnValues[i] = false;
            // for each patient, set bool based on active surveillance
            StatusDa da = new StatusDa();
            da.QueryWatchfulWaiting((record) =>
            {
                int patientId = (int)record["PatientId"];
                string patientMRN = record["PtMRN"].ToString();
                for (int i = 0; i < patients.Length; i++)
                {
                    var patient = patients[i];
                    if (patient.MRN == patientMRN)
                        returnValues[i] = true;
                }
                return true;
            });
            return returnValues;
        }

        /// <summary>
        /// Serializes chart to base-64 encoded string
        /// </summary>
        /// <param name="chart"></param>
        /// <returns></returns>
        private string GetBase64EncodedChart(CaisisChart chart)
        {
            return chart.ToBase64();
        }

    }

    #region Strongly Typed Service Objects

    [DataContract]
    public class ServiceObject
    {
        [DataMember]
        public string RelatedSystem;

        [DataMember]
        public string RelatedSystemTable;

        [DataMember]
        public int RelatedSystemPrimaryKey;

        public ServiceObject()
        {
        }
    }

    [DataContract]
    public class ProstatePatientDataElements
    {
        [DataMember]
        public string PatientId;

        [DataMember]
        public string PtAge;

        [DataMember]
        public string PreSurgeryPSA;

        [DataMember]
        public string RPDate;

        [DataMember]
        public string PathGG1;

        [DataMember]
        public string PathGG2;

        [DataMember]
        public string ECE;

        [DataMember]
        public bool? ECE_Parsed;

        [DataMember]
        public string SVI;

        [DataMember]
        public bool? SVI_Parsed;

        [DataMember]
        public string LNI;

        [DataMember]
        public bool? LNI_Parsed;

        [DataMember]
        public string PLND;

        [DataMember]
        public string Smoker;
    }

    [DataContract]
    public class PatientBCRStatus
    {
        [DataMember]
        public string BCR;

        [DataMember]
        public string BCRDate;

        [DataMember]
        public string LastFollowupDate;

        [DataMember]
        public string LastPSADate;

        [DataMember]
        public string SurgDate;
    }

    [DataContract]
    public class PatientProstateAlerts
    {
        [DataMember]
        public int ErectileAlertCount;

        [DataMember]
        public string ErectileAlertMessage;

        [DataMember]
        public string ErectileFirstAlertDate;

        [DataMember]
        public int PadAlertCount;

        [DataMember]
        public string PadAlertMessage;

        [DataMember]
        public string PadFirstAlertDate;

        [DataMember]
        public int UrinaryDeclineAlertCount;

        [DataMember]
        public string UrinaryDeclineAlertMessage;

        [DataMember]
        public string UrinaryDeclineFirstAlertDate;

        [DataMember]
        public int BowelAlertCount;

        [DataMember]
        public string BowelAlertMessage;

        [DataMember]
        public string BowelFirstAlertDate;

        [DataMember]
        public int QualityOfLifeAlertCount;

        [DataMember]
        public string QualityOfLifeAlertMessage;

        [DataMember]
        public string QualityOfLifeFirstAlertDate;
    }


    /// <summary>
    /// Represents a Simple Survey
    /// </summary>
    [DataContract]
    public class PatientSurvey : ServiceObject
    {
        [DataMember]
        public DateTime SurveyDate;

        [DataMember]
        public string SurveyType;

        [DataMember]
        public string SurveyResult;

        [DataMember]
        public string SurveyTotal;

        [DataMember]
        public string SurveyVersion;

        [DataMember]
        public string SurveyNotes;

        [DataMember]
        public string SurveyDataSource;

        [DataMember]
        public string SurveyQuality;

        [DataMember]
        public string SurveyClinician;

        [DataMember]
        public PatientSurveyItem[] PatientSurveyItems = new PatientSurveyItem[] { };
    }

    /// <summary>
    /// Represents a Simple Survey Item (Question/Response)
    /// </summary>
    [DataContract]
    public class PatientSurveyItem : ServiceObject
    {
        [DataMember]
        public string SurveyItemNum;

        [DataMember]
        public string SurveyItem;

        [DataMember]
        public string SurveyItemResult;

        [DataMember]
        public string SurveyItemTotal;

        [DataMember]
        public string SurveyItemNotes;
    }

    [DataContract]
    public class PatientObject
    {
        [DataMember]
        public string Name;

        [DataMember]
        public DateTime DOB;

        [DataMember]
        public string MRN;
    }

    [DataContract]
    public class PatientSeachResult
    {
        [DataMember]
        public int ErrorCode;

        [DataMember]
        public int? PatientId;
    }

    [DataContract]
    public class PatientActiveSurveillanceStatus
    {
        [DataMember]
        public int ErrorCode;

        [DataMember]
        public DateTime? StatusDate;
    }

    #endregion
}