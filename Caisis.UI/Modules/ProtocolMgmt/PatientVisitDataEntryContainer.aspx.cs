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

using Caisis.DataAccess;
using Caisis.BOL;
using Caisis.UI.Core.Classes;
using Caisis.UI.ClientScript.Ajax;

namespace Caisis.UI.Modules.ProtocolMgmt
{
    public partial class PatientVisitDataEntryContainer : ProtocolMgmtPatientBasePage
    {
        /// <summary>
        /// Gets the current data entry item
        /// </summary>
        protected string QueryPatientItem
        {
            get
            {
                return Request.QueryString["patientItemId"];
            }
        }

        /// <summary>
        /// Gets the optinal src tab in the url
        /// </summary>
        protected string QueryTab
        {
            get
            {
                return Request.QueryString["tab"];
            }
        }

        /// <summary>
        /// Gets the url which loads the patient portal with relevant tab and query string
        /// </summary>
        protected string PatientPortalURL
        {
            get
            {
                // determine if a src tab was passed, otheriwse, go back to patient visits
                string tab = !string.IsNullOrEmpty(QueryTab) ? QueryTab : "PatientVisit";
                return GetPatientPortalQueryString("PatientIndex.aspx", tab, "patientItemId=" + QueryPatientItem);
            }
        }

        protected override void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                BuildNavigation();
            }
            SetNavigationButtons();
        }

        #region AJAX

        /// <summary>
        /// 
        /// </summary>
        /// <param name="e"></param>
        protected void GetLatestItemStatuses(CaisisAjaxEventArgs e)
        {
            DataView navigation = GetFilteredNavigation();
            if (navigation.Count > 0)
            {
                var itemToStatus = from item in GetFilteredNavigation().ToTable().AsEnumerable()
                                   let itemId = EncryptPatientId(item[PatientItem.PatientItemId].ToString())
                                   let status = item[PatientItem.Status].ToString()
                                   select "['" + PageUtil.EscapeSingleQuotes(itemId) + "','" + PageUtil.EscapeSingleQuotes(status) + "']";
                e.ReturnValue = "[" + string.Join(",", itemToStatus.ToArray()) + "]";
            }
            else
            {
                e.ReturnValue = "[]";
            }
        }

        #endregion

        /// <summary>
        /// 
        /// </summary>
        /// <param name="dataItem"></param>
        /// <returns></returns>
        protected string GetItemStatus(object dataItem)
        {
            string defaultStatus = "Anticipated";
            string status = DataBinder.Eval(dataItem, "Status").ToString();
            return !string.IsNullOrEmpty(status) ? status : defaultStatus;
        }

        /// <summary>
        /// Builds navigation for data entry
        /// </summary>
        private void BuildNavigation()
        {
            DataView navigation = GetFilteredNavigation();
            // build list
            PatientVisitsRptr.DataSource = navigation;
            PatientVisitsRptr.DataBind();
            // set visit label
            if (navigation.Count > 0 && !string.IsNullOrEmpty(QueryPatientItem))
            {
                string decrypteItemId = DecrypyValue(QueryPatientItem);
                int parsedPatientItemId = int.Parse(decrypteItemId);
                var found = navigation.Table.Select(PatientItem.PatientItemId + " = " + parsedPatientItemId).FirstOrDefault();
                if (found != null)
                    VisitTitle.Text = found[Timeline.VisitLabel].ToString();
            }
        }

        /// <summary>
        /// 
        /// </summary>
        /// <returns></returns>
        private DataView GetFilteredNavigation()
        {
            DataTable visitItems = null;
            if (!string.IsNullOrEmpty(PatientSchemaId))
            {
                int patientSchemaId = int.Parse(PatientSchemaId);
                int? timelineId = null;
                // restrict to timeline
                if (!string.IsNullOrEmpty(QueryPatientItem))
                {
                    string decrypteItemId = DecrypyValue(QueryPatientItem);
                    int parsedPatientItemId = int.Parse(decrypteItemId);
                    timelineId = ProtocolMgmtDa.GetPatientTimelineId(parsedPatientItemId);
                }
                // get visit items, restricted by optional timeline
                visitItems = ProtocolMgmtDa.GetPatientVisitSchedulingSummary(patientSchemaId, timelineId);
            }
            else
            {
                visitItems = new DataTable();
            }


            return visitItems.DefaultView;
        }

        /// <summary>
        /// Determine data entry navigation
        /// </summary>
        private void SetNavigationButtons()
        {
            // determine which is the return icon
            bool fromCalendar = !string.IsNullOrEmpty(QueryTab) && QueryTab == "ProtocolPatientCalendar";
            SaveReturnCalendarBtn.Visible = fromCalendar;
            SaveReturnListBtn.Visible = !fromCalendar;
        }
    }
}
