using System;
using System.Data;
using System.Collections;
using System.Collections.Generic;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Xml;

using Caisis.BOL;
using Caisis.UI.Core.Classes;
using Caisis.Security;
using Caisis.DataAccess;

namespace Caisis.UI.Modules.ProtocolMgmt
{
    /// <summary>
    /// A context in which a page is realated to a Protocol.
    /// </summary>
    public enum ProtocolMgmtContext
    {
        Global,
        Protocol,
        Patient
    }

    /// <summary>
    /// A permission which defines a user's role in a Protocol
    /// </summary>
    public enum ProtocolMgmtUsers
    {
        ProtocolAdmin,
        ProtocolUser
    }

    public enum ProtocolMgmtSpecimenUser
    {
        User,
        Admin
    }

    public enum SpecimenInventoryMode
    {
        Collection,
        Pathology,
        Sequencing,
        Analysis,
        cBIO
    }

    /// <summary>
    /// Defines base functionality inherited by all pages of the ProtocolMgmt Module
    /// </summary>
    public class ProtocolMgmtBasePage : BasePage
    {
        #region Constants

        /// <summary>
        /// The key used for retrieveing and setting query string for PatientId
        /// </summary>
        public static readonly string QUERY_PATIENT_ID_KEY = "paid";

        /// <summary>
        /// The key used for retrieveing and setting query string for ProtocolId
        /// </summary>
        public static readonly string QUERY_PROTOCOL_ID_KEY = "prid";

        /// <summary>
        /// The key used for retrieveing and setting query string for SchemaId
        /// </summary>
        public static readonly string QUERY_PROTOCOL_SCHEMA_KEY = "scid";

        private ProtocolMgmtUsers _userType;

        #endregion

        #region

        private ProtocolMgmtContext _protocolContext = ProtocolMgmtContext.Global;
        private string _protocolNumber;

        private string _protocolTitle;

        // specimen user type
        private ProtocolMgmtSpecimenUser? _userSpecimenType = null;

        // specimen controller
        protected ProtocolMgmtSpecimenController specimenController = new ProtocolMgmtSpecimenController();

        #endregion

        #region Public Properties

        public ProtocolMgmtUsers UserType
        {
            get
            {
                return _userType;
            }
        }

        public ProtocolMgmtSpecimenUser? UserSpecimenType
        {
            get
            {
                return _userSpecimenType;
            }
        }

        /// <summary>
        /// Returns the ENCRYPTED patientId in the QuereyString
        /// </summary>
        public string BasePatientId
        {
            get
            {
                return GetURLValue(QUERY_PATIENT_ID_KEY);
            }
        }

        /// <summary>
        /// Returns the DECRYPTED patientId in the QuereyString
        /// </summary>
        public string BaseDecryptedPatientId
        {
            get
            {
                if (!string.IsNullOrEmpty(BasePatientId))
                {
                    return DecryptPatientId(BasePatientId);
                }
                else
                {
                    return string.Empty;
                }
            }
        }

        /// <summary>
        /// Returns the protocolId in the QuereyString
        /// </summary>
        public string BaseProtocolId
        {
            get
            {
                return GetURLValue(QUERY_PROTOCOL_ID_KEY);
            }
        }

        /// <summary>
        /// Returns the schemaId in the QuereyString
        /// </summary>
        public string BaseSchemaId
        {
            get
            {
                return GetURLValue(QUERY_PROTOCOL_SCHEMA_KEY);
            }
        }

        /// <summary>
        /// Gets the context of the current page as it relates to a Protocol
        /// </summary>
        public ProtocolMgmtContext ProtocolContext
        {
            get
            {
                return _protocolContext;
            }
        }

        /// <summary>
        /// Gets the ProtocolNumber of current Protocol
        /// </summary>
        public string ProtocolNumber
        {
            get
            {
                return _protocolNumber;
            }
        }

        /// <summary>
        /// Gets the ProtocolTitle of current Protocol
        /// </summary>
        public string ProtocolTitle
        {
            get
            {
                return _protocolTitle;
            }
        }

        #endregion

        #region Constructor

        public ProtocolMgmtBasePage()
            : base()
        {
            // Set defaults
            _protocolContext = ProtocolMgmtContext.Global;
            this.PreRender += new EventHandler(SetUserPatientView);
        }

        #endregion

        #region Public Helper Methods

        /// <summary>
        /// Retrieves a value from the QueryString
        /// </summary>
        /// <param name="key"></param>
        /// <returns></returns>
        public string GetURLValue(string key)
        {
            return Request.QueryString[key];
        }

        /// <summary>
        /// Returns an encrypted patientid
        /// </summary>
        /// <param name="pId"></param>
        /// <returns></returns>
        public string EncryptPatientId(string pId)
        {
            return EncryptValue(pId);
        }

        /// <summary>
        /// Returns a decrypted patientid
        /// </summary>
        /// <param name="pId"></param>
        /// <returns></returns>
        public string DecryptPatientId(string pId)
        {
            return DecrypyValue(pId);
        }

        /// <summary>
        /// Encrypts a value for being sent through form or url
        /// </summary>
        /// <param name="value"></param>
        /// <returns></returns>
        public string EncryptValue(string value)
        {
            if (!string.IsNullOrEmpty(value))
            {
                return Security.CustomCryptoHelper.Encrypt(value);
            }
            else
            {
                return string.Empty;
            }
        }

        /// <summary>
        /// Decrypts a value for being sent through form or url
        /// </summary>
        /// <param name="encryptedValue"></param>
        /// <returns></returns>
        public string DecrypyValue(string encryptedValue)
        {
            if (!string.IsNullOrEmpty(encryptedValue))
            {
                return Security.CustomCryptoHelper.Decrypt(encryptedValue);
            }
            else
            {
                return string.Empty;
            }
        }


        /// <summary>
        /// Gets a url with ProtocolId, SchemaId and PatientId appended based on current query string
        /// </summary>
        /// <param name="baseURL"></param>
        /// <returns></returns>
        public virtual string GetQueryString(string baseURL)
        {
            return GetQueryString(baseURL, BaseProtocolId, BaseSchemaId, BaseDecryptedPatientId, false);
        }

        /// <summary>
        /// Gets a url with ProtocolId, SchemaId and PatientId specified, patientid is unencrypted key
        /// </summary>
        /// <param name="baseURL"></param>
        /// <returns></returns>
        public virtual string GetQueryString(string baseURL, string protocolId, string schemaId, string patientId, bool removeNulls)
        {
            string ePid = !string.IsNullOrEmpty(patientId) ? EncryptPatientId(patientId) : "";
            string[] urlParams = new string[] { QUERY_PROTOCOL_ID_KEY + "=" + protocolId, QUERY_PROTOCOL_SCHEMA_KEY + "=" + schemaId, QUERY_PATIENT_ID_KEY + "=" + ePid };
            string url = baseURL + "?" + string.Join("&", urlParams);
            return url;
        }

        /// <summary>
        /// Populates fields on Page with BusinessObject
        /// </summary>
        /// <param name="iBiz"></param>
        protected void PopulateForm(IBusinessObject iBiz)
        {
            PopulateForm(this, iBiz);
        }

        /// <summary>
        /// Populate fields in Control container with BusinessObject
        /// </summary>
        /// <param name="container"></param>
        /// <param name="iBiz"></param>
        protected void PopulateForm(Control container, IBusinessObject iBiz)
        {
            CICHelper.SetFieldValues(container.Controls, iBiz);
        }

        #endregion

        protected override void OnInit(EventArgs e)
        {
            base.OnInit(e);

            SetUserPermissions();
            SetPageContextAndVariables();
        }

        /// <summary>
        /// Sets the user's view of the form based on permission.
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void SetUserPatientView(object sender, EventArgs e)
        {
            //// suppress page from rendering without permission
            //if (RestrictSpecimenUsers && HasSpecimenPermission && UserType != ProtocolMgmtUsers.ProtocolAdmin)
            //{
            //    this.Visible = false;
            //    Response.StatusCode = 403;
            //}
        }

        /// <summary>
        /// Sets user permissions in content of the Protocol
        /// </summary>
        private void SetUserPermissions()
        {
            if (PermissionManager.HasPermission(PermissionManager.EditProtocolSchema) || PermissionManager.HasPermission(PermissionManager.EditSecurity))
            {
                _userType = ProtocolMgmtUsers.ProtocolAdmin;
            }
            else
            {
                _userType = ProtocolMgmtUsers.ProtocolUser;
            }
            // set specimen permission
            bool specimenUser = Caisis.Security.PermissionManager.HasPermission("ProtocolSpecimenUser");
            bool specimenAdminUser = Caisis.Security.PermissionManager.HasPermission("ProtocolSpecimenAdmin");
            if (specimenAdminUser)
                _userSpecimenType = ProtocolMgmtSpecimenUser.Admin;
            else if (specimenUser)
                _userSpecimenType = ProtocolMgmtSpecimenUser.User;
            else
                _userSpecimenType = null;
        }

        /// <summary>
        /// 
        /// </summary>
        private void SetPageContextAndVariables()
        {
            if (!string.IsNullOrEmpty(BaseProtocolId))
            {
                Protocol biz = new Protocol();
                biz.Get(int.Parse(BaseProtocolId));
                _protocolNumber = biz[Protocol.ProtocolNum].ToString();
                _protocolTitle = biz[Protocol.ProtocolTitle].ToString();;
            }
        }

        #region !Importatnt CustomDataset

        /// <summary>
        /// Returns the Protocol specific visits dataset (PatientItems)
        /// </summary>
        /// <returns></returns>
        protected virtual string GetPatientVisitsDataset()
        {
            // get core Dataset
            string datasetSQL = CacheManager.GetDatasetSQL(Page.Session[SessionKey.DatasetId]);
            // get protocol
            int protocolId = int.Parse(BaseProtocolId);
            // return special visits SQL
            return ProtocolMgmtController.GetVisitDatasetSQL(datasetSQL, protocolId);
        }

        #endregion

        #region !Important Specimen Patient Dataset

        /// <summary>
        /// Gets a special dataset based on Specimen User type
        /// </summary>
        /// <returns></returns>
        protected string GetSpecimenPatientsDatasetSQL()
        {
            int protocolId = int.Parse(BaseProtocolId);
            string datasetSQL = CacheManager.GetDatasetSQL(Session[SessionKey.DatasetId]);
            // !important: admin users, query across all patients on this protocol
            if (UserSpecimenType.HasValue && UserSpecimenType.Value == ProtocolMgmtSpecimenUser.Admin)
            {
                string specimenAdminSQLFormat =
@"
SELECT DISTINCT pp.PatientId
FROM Patients p
INNER JOIN PatientProtocols pp
    ON p.PatientId = pp.PatientId
WHERE
    pp.ProtocolId = {0}
";
                return string.Format(specimenAdminSQLFormat, protocolId);
            }
            // standard users, query only dataset patients this on protocol
            else
            {
                string specimenUserSQLFormat =
@"
SELECT DISTINCT pp.PatientId
FROM ({0}) p
INNER JOIN PatientProtocols pp
    ON p.PatientId = pp.PatientId
WHERE
    pp.ProtocolId = {1}
";
                return string.Format(specimenUserSQLFormat, datasetSQL, protocolId);
            }
        }

        #endregion

    }
}
