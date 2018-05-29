using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Runtime.Serialization;
using System.Runtime.Serialization.Json;
using Caisis.DataAccess;

using System.Collections;
using System.Collections.Generic;
using System.Xml;
using System.Linq;


using Caisis.BOL;
using Caisis.Controller;
using Caisis.Security;
using Caisis.UI.Core.Classes;

namespace Caisis.UI.Modules.ProtocolMgmt
{
    public partial class PatientIndex : ProtocolMgmtPatientBasePage
    {
        /// <summary>
        /// Returns tab to load based on query string
        /// </summary>
        public string DefaultTab
        {
            get
            {
                return Request.QueryString["tab"];
            }
        }

        /// <summary>
        /// 
        /// </summary>
        public string OptionalEncodedQuery
        {
            get
            {
                return Request.QueryString["qs"];
            }
        }

        /// <summary>
        /// 
        /// </summary>
        protected bool PatientTreatmentStarted
        {
            get
            {
                bool started = false;
                if (!string.IsNullOrEmpty(PatientProtocolId))
                {
                    int patientId = int.Parse(BaseDecryptedPatientId);
                    int protocolId = int.Parse(BaseProtocolId);
                    int patientProtocolId = int.Parse(PatientProtocolId);
                    PatientProtocolController ppc = new PatientProtocolController(patientProtocolId);
                    if (ppc.HasStatus(PatientProtocolController.OnStudy))
                    {
                        started = true;
                    }
                    else
                    {
                        object dsid = Session[SessionKey.DatasetId];
                        string datasetSQL = CacheManager.GetDatasetSQL(dsid);
                        //DataTable dt = ProtocolMgmtDa.GetPatientTimeline(protocolId, patientId, datasetSQL);
                        started = ProtocolMgmtDa.PatientHasTimeline(protocolId, patientId, null, datasetSQL);
                    }
                }
                return !started;
            }
        }


        public string DefaultURL
        {
            get
            {
                string pageToLoad = string.Empty;
                // qs value is passed in as url encoded, must decode
                // i.e., PatientIndex.aspx?....tab=PatientSummary&qs=key%3D21%26name%3Dtest -> qs: key=21&name=test
                // if tabName = query tab, pass on extra url decoded paramaters in qs key
                if (!string.IsNullOrEmpty(DefaultTab))
                {
                    string url = GetQueryString(DefaultTab + ".aspx");
                    if (!string.IsNullOrEmpty(OptionalEncodedQuery))
                    {
                        url += "&" + Server.UrlDecode(OptionalEncodedQuery);
                    }
                    // pass along decoded url paramaters to tab
                    pageToLoad = url;
                }
                return pageToLoad;
            }
        }

        public PatientIndex()
            : base
                ()
        {
            // During initalization verify patient session information is correct
            this.Init += new EventHandler(InitalizePatientSession);
        }

        /// <summary>
        /// Puts Patient, as specified in patientId query string, in session
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void InitalizePatientSession(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(BaseDecryptedPatientId))
            {
                int patientId = int.Parse(BaseDecryptedPatientId);
                PatientController ptController = new PatientController();
                ptController.PutPatientInSession(Page, patientId);
            }
        }

        protected override void Page_Load(object sender, EventArgs e)
        {
            base.Page_Load(sender, e);
            bool isSpecimenEnabled = EnableSpecimens(int.Parse(BaseProtocolId));
            // get tab links
            var links = PageUtil.GetControls<HtmlAnchor>(PatientMenuTable);
            // set dynamic url based on current query params
            foreach (var link in links)
            {
                // set url with params
                link.HRef = GetQueryString(link.HRef);
                // default view (non-specimen users see all tabs, specimen users see none)
                link.Visible = true;
                // special case
                if (link == SpecimensTab)
                {
                    // specimen user+enabled
                    if (isSpecimenEnabled)
                    {
                        SpecimensTabCell.Visible = true;
                        link.Visible = true;
                        // focus on speicmens tab for speicmen users
                        //if (isSpecimenUser)
                        //{
                        //    Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "ENABLE_PROTOCOL_SPECIMENS", "var ENABLE_PROTOCOL_SPECIMENS = true;", true);
                        //}
                    }
                    else
                    {
                        SpecimensTabCell.Visible = false;
                        link.Visible = false;
                    }
                }
            }
        }

        /// <summary>
        /// Gets if the Specimen tab is available
        /// </summary>
        /// <param name="protocolId"></param>
        /// <returns></returns>
        private static bool EnableSpecimens(int protocolId)
        {
            // read config
            var xDoc = XmlUtil.GetModulesConfigXml();
            var protocolMatchNodes = xDoc.SelectNodes("//module[@name='Protocol Management']//EditSpecimens/Protocol");

            // get protocol
            DataView data = BusinessObject.GetByFieldsAsDataView<Protocol>(new Dictionary<string, object> { { Protocol.ProtocolId, protocolId } });
            if (data.Count > 0 && protocolMatchNodes.Count > 0)
            {
                // for each protocol config, check if current Protocol shows specimen
                foreach (XmlNode match in protocolMatchNodes)
                {
                    // restrict by protocol
                    string expr = match.Attributes["match"] != null ? match.Attributes["match"].Value : "";
                    if (!string.IsNullOrEmpty(expr))
                    {
                        data.RowFilter = expr;
                        return data.Count > 0;
                    }
                }
            }
            return false;
        }
    }
}