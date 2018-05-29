using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

using Caisis.BOL;
using Caisis.DataAccess;
using Caisis.UI.Core.Classes;
using Caisis.UI.Core.Classes.CustomControls;

namespace Caisis.UI.Modules.ProtocolMgmt
{
    /// <summary>
    /// Defines a page with extra properties releveant to a Patient within a Protocol Schema
    /// </summary>
    public class ProtocolMgmtPatientBasePage : ProtocolMgmtBasePage
    {
        // patient controller
        protected Caisis.Controller.PatientController pc = new Controller.PatientController();

        /// <summary>
        /// The QuereyString key used for passing PatientProtocolId
        /// </summary>
        public static readonly string QUERY_PATIENT_PROTOCOL_ID_KEY = "patientProtocolId";

        private string patientProtocolId;
        private string patientSchemaId;

        /// <summary>
        /// Gets the PatientProtocolId based on url PatientId and url ProtocolId
        /// </summary>
        public string PatientProtocolId
        {
            get
            {
                return patientProtocolId;
            }
        }

        /// <summary>
        /// Gets the PatientSchemaId based on url PatientId and url SchemaId
        /// </summary>
        public string PatientSchemaId
        {
            get
            {
                return patientSchemaId;
            }
        }

        private string patientLabel = null;
        private string patientStudyId = null;

        /// <summary>
        /// 
        /// </summary>
        public string PatientLabel
        {
            get
            {
                if (patientLabel == null)
                {
                    if (base.ShowPatientIdentifiers())
                    {

                        Patient ptBiz = new Patient();
                        ptBiz.Get(int.Parse(BaseDecryptedPatientId));
                        //patientLabel = ptBiz[Patient.PtFirstName] + " " + ptBiz[Patient.PtLastName];
                        patientLabel = pc.GetPatientName(ptBiz);
                    }
                    else
                    {
                        patientLabel = string.Empty;
                    }
                }
                return patientLabel;
            }
        }

        public string PatientStudyId
        {
            get
            {
                return patientStudyId;
            }
        }

        public ProtocolMgmtPatientBasePage()
            : base()
        {
            // handlers
            this.Init += new EventHandler(InitalizeParams);
        }

        /// <summary>
        /// Initalizes public properties used for getting Patient specific ids
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void InitalizeParams(object sender, EventArgs e)
        {
            // Patient Protocol and StudyId
            string queryPatientProtocolId = GetURLValue(QUERY_PATIENT_PROTOCOL_ID_KEY);
            if (!string.IsNullOrEmpty(queryPatientProtocolId))
            {
                PatientProtocol biz = new PatientProtocol();
                biz.Get(int.Parse(queryPatientProtocolId));
                patientProtocolId = biz[PatientProtocol.PatientProtocolId].ToString();
                patientStudyId = biz[PatientProtocol.PtProtocolStudyId].ToString();
            }
            else if (!string.IsNullOrEmpty(BaseProtocolId) && !string.IsNullOrEmpty(BaseDecryptedPatientId))
            {
                PatientProtocolDa da = new PatientProtocolDa();
                DataTable patientProtocolRecords = da.GetPatientProtocol(int.Parse(BaseDecryptedPatientId), int.Parse(BaseProtocolId));
                if (patientProtocolRecords.Rows.Count > 0)
                {
                    patientProtocolId = patientProtocolRecords.Rows[0][PatientProtocol.PatientProtocolId].ToString();
                    patientStudyId = patientProtocolRecords.Rows[0][PatientProtocol.PtProtocolStudyId].ToString();
                }
                else
                {
                    patientProtocolId = string.Empty;
                    patientStudyId = string.Empty;
                }
            }
            else
            {
                patientProtocolId = string.Empty;
                patientStudyId = string.Empty;
            }

            // Patient Schema
            if (!string.IsNullOrEmpty(BaseSchemaId) && !string.IsNullOrEmpty(BaseDecryptedPatientId))
            {
                DataTable dt = ProtocolMgmtDa.GetPatientProtocolSchema(int.Parse(BaseSchemaId), int.Parse(BaseDecryptedPatientId));
                if (dt.Rows.Count > 0)
                {
                    patientSchemaId = dt.Rows[0][PatientSchema.PatientSchemaId].ToString();
                }
                else
                {
                    patientSchemaId = string.Empty;
                }
            }
            else
            {
                patientSchemaId = string.Empty;
            }
        }

        /// <summary>
        /// Gets base query string with patientProtocolId appended
        /// </summary>
        /// <param name="baseURL"></param>
        /// <returns></returns>
        public override string GetQueryString(string baseURL)
        {
            return base.GetQueryString(baseURL) + "&patientProtocolId=" + PatientProtocolId + "&patientSchemaId=" + PatientSchemaId;
        }

        /// <summary>
        /// Returns a specially formatted url, which will pass along url parameters, and load tab.
        /// In addition, an optional query string can be passed along to tab page.
        /// </summary>
        /// <param name="baseURL">The url to of the page to load, without the "?"</param>
        /// <param name="tab">the tab specified to target a tab in the Patient Portal</param>
        /// <param name="qs">a query string to be url encoded to pass along in url</param>
        /// <returns></returns>
        public string GetPatientPortalQueryString(string baseURL, string tab, string qs)
        {
            string url = GetQueryString(baseURL);
            // pass query key qs = encoded extra parameters, which will get loaded receiving page
            string fullURL = url + "&tab=" + tab + "&qs=" + Server.UrlEncode(qs);
            return fullURL;
        }
    }

    /// <summary>
    /// Defines a page in the context of a specific patient specimen type
    /// </summary>
    public class PatientSpecimenBasePage : ProtocolMgmtPatientBasePage
    {
        public static readonly string QUERY_TISSUE = "Tissue";
        public static readonly string QUERY_BLOOD = "Blood";
        #region headings based on specimen type
        protected static readonly string[][] TISSUE_COLUMNS = new string[][] 
        {
            new string[] { "SpecimenReferenceNumber", "Specimen ID", typeof(CaisisTextBox).Name },
            new string[] { "SpecimenSubType", "Sample Type", typeof(CaisisTextBox).Name },
            new string[] { "AccessionAnatomicSite", "Biopsy Site", typeof(CaisisTextBox).Name },
            new string[] { "AccessionProcName", "Collection Method", typeof(CaisisTextBox).Name },
            //new string[] { "", "Needle", typeof(CaisisTextBox).Name },
            new string[] { "SpecimenPreservationType", "Processing Method", typeof(CaisisTextBox).Name },
            new string[] { "AccessionDate", "Collection Date", typeof(CaisisTextBox).Name },
            new string[] { "SpecimenCollectionTime", "Collection Time", typeof(CaisisTextBox).Name },
            new string[] { "SpecimenFrozenTime", "Time Frozen", typeof(CaisisTextBox).Name },
            new string[] { "SpecimenStatus", "Status", typeof(CaisisTextBox).Name }
       };

        protected static readonly string[][] BLOOD_COLUMNS = new string[][]
        {
            new string[] { "SpecimenReferenceNumber", "Specimen ID", typeof(CaisisTextBox).Name },
            new string[] { "SpecimenSubType", "Tube Use", typeof(CaisisTextBox).Name },
            new string[] { "SpecimenVialType", "Tube Type", typeof(CaisisTextBox).Name },
            new string[] { "AccessionDate", "Collection Date", typeof(CaisisTextBox).Name },
            new string[] { "SpecimenCollectionTime", "Collection Time", typeof(CaisisTextBox).Name },
            new string[] { "SpecimenFrozenTime", "Time Frozen", typeof(CaisisTextBox).Name },
            new string[] { "SpecimenStatus", "Status", typeof(CaisisTextBox).Name }
       };

        #endregion
       
        private string patientStudyId = "";

        #region Query String Filters

        protected string QuerySpecimenType
        {
            get
            {
                return Request.QueryString["specimenType"] + "";
            }
        }

        protected string QueryVisitType
        {
            get
            {
                return Request.QueryString["visitType"] + "";
            }
        }

        #endregion

        protected string PatientStudyId
        {
            get
            {
                return patientStudyId;
            }
        }

        public PatientSpecimenBasePage()
            : base()
        {
            this.Init += (o, e) =>
            {
                // set study id
                if (!string.IsNullOrEmpty(PatientProtocolId))
                {
                    int ptProtocolId = int.Parse(PatientProtocolId);
                    PatientProtocol biz = new PatientProtocol();
                    biz.Get(ptProtocolId);
                    patientStudyId = biz[PatientProtocol.PtProtocolStudyId].ToString();
                }
            };
        }
    }
}
