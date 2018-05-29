using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Collections.Generic;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Linq;

using Caisis.BOL;
using Caisis.DataAccess;
using Caisis.UI.Core.Classes;

namespace Caisis.UI.Modules.ProtocolMgmt
{

    public partial class PatientImaging : ProtocolMgmtPatientBasePage
    {
        private static readonly string CHRON_NAME = "Diagnostics";
        protected static readonly string[] DxImagingTypes = new string[] { "CT", "MRI", "PET", "Bone" };

        /// <summary>
        /// 
        /// </summary>
        protected string QueryTable
        {
            get
            {
                return Request.QueryString["table"];
            }
        }

        /// <summary>
        /// 
        /// </summary>
        protected string QueryRecordId
        {
            get
            {
                return Request.QueryString["recordId"];
            }
        }

        /// <summary>
        /// Gets the imaging type passed in url
        /// </summary>
        protected string ImagingType
        {
            get
            {
                return Request.QueryString["type"];
            }
        }

        /// <summary>
        /// Gets the view type passed in url
        /// </summary>
        protected string ViewType
        {
            get
            {
                return Request.QueryString["view"];
            }
        }

        protected override void Page_Load(object sender, EventArgs e)
        {
            base.Page_Load(sender, e);
            //if (!Page.IsPostBack)
            {
                PopulateForm(sender, e);
            }
        }

        protected void PopulateForm(object sender, EventArgs e)
        {
            BuildChronList();
            SetDataEntryFrame();
        }

        private void BuildChronList()
        {

            int patientId = int.Parse(BaseDecryptedPatientId);
            //ChronoDa da = new ChronoDa();
            //DataView dv = da.GetChronoList(patientId, CHRON_NAME, User.Identity.Name).Tables[0].DefaultView;
            PatientProtocolResponseDa da = new PatientProtocolResponseDa();
            // all dx types
            //DataView dv = da.GetImagingAndResponseChronList(patientId).DefaultView;
            // only specific dx types
            DataTable imagingTable = da.GetImagingAndResponseChronList(patientId, DxImagingTypes);
            DataView imagingView = imagingTable.DefaultView;
            // filter > 90 days before screened date
            if (!string.IsNullOrEmpty(PatientProtocolId) && DiagFilter.Checked)
            {
                PatientProtocolController ppc = new PatientProtocolController(int.Parse(PatientProtocolId));
                DateTime? onStudyDate = ppc.GetStatusDate(PatientProtocolController.OnStudy);
                DateTime? offStudyDate = ppc.GetStatusDate(PatientProtocolController.OffStudy);
                List<string> filters = new List<string>();
                // within 90 days of on study 
                if (onStudyDate.HasValue)
                {
                    filters.Add(string.Format("SortDate >= #{0:d}#", onStudyDate.Value.AddDays(-90)));
                }
                // after off study
                if (offStudyDate.HasValue)
                {
                    filters.Add(string.Format("SortDate <= #{0:d}#", offStudyDate.Value));
                }
                if (filters.Count > 0)
                {
                    imagingView.RowFilter = string.Join(" AND ", filters.ToArray());
                }
            }
            ImagingChronListRptr.DataSource = imagingView;
            ImagingChronListRptr.DataBind();
        }

        /// <summary>
        /// Set the inital Data Entry Frame page based on Query paramaters
        /// </summary>
        private void SetDataEntryFrame()
        {
            if (!string.IsNullOrEmpty(QueryTable) && !string.IsNullOrEmpty(QueryRecordId))
            {
                // If loading Response Record
                if (QueryTable == "ProtocolMgr_PatientResponse")
                {
                    DataEntryFrame.Attributes["src"] = GetQueryString("PatientResponseDataEntry.aspx") + "&patientResponseId=" + QueryRecordId;
                }
            }
            else
            {
                DataEntryFrame.Attributes["src"] = GetQueryString("PatientResponseDataEntry.aspx") + "&patientResponseId=";
            }
        }
    }
}