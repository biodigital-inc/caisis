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

using Caisis.DataAccess;
using Caisis.BOL;
using Caisis.Security;
using Caisis.UI.Core.Classes;
using Caisis.UI.Core.Classes.CustomControls;

using System.Linq;

namespace Caisis.UI.Modules.ProtocolMgmt
{
    public partial class PatientVisit : ProtocolMgmtPatientBasePage
    {
        private List<int> dirtyVisits = new List<int>();
        protected List<string> ReadOnlyDates = new List<string>();

        public int? SelectedTimelineId
        {
            get
            {
                if (!string.IsNullOrEmpty(VisitsDropDown.Value))
                    return int.Parse(VisitsDropDown.Value);
                else
                    return null;
            }
        }

        protected override void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                // build list of visits
                PopulateVisitList();

                // set default visit
                string queryTimelineId = Request.QueryString["timelineid"] + "";
                string queryPatientItemId = Request.QueryString["patientItemId"];

                // set visit by timeline
                if (!string.IsNullOrEmpty(queryTimelineId))
                {
                    int parsedTimelineId = int.Parse(queryTimelineId);
                    VisitsDropDown.Value = parsedTimelineId.ToString();
                }
                //  set visit by item itemline
                else if (!string.IsNullOrEmpty(queryPatientItemId))
                {
                    // get timeline id by patient item
                    string decrypteItemId = DecrypyValue(queryPatientItemId);
                    int patientItemId = int.Parse(decrypteItemId);
                    int? timelineId = ProtocolMgmtDa.GetPatientTimelineId(patientItemId);
                    if (timelineId.HasValue)
                        VisitsDropDown.Value = timelineId.Value.ToString();
                }
                // if no value select, default to first visit
                if (string.IsNullOrEmpty(VisitsDropDown.Value) && VisitsDropDown.Items.Count > 1)
                    VisitsDropDown.SelectedIndex = 1;
                // build visits
                SetVisit(sender, e);

                // build a list of unplanned events
                PopulateUnplannedEvents();
            }
        }

        /// <summary>
        /// Populates visit dropdown
        /// </summary>
        private void PopulateVisitList()
        {
            int protocolId = int.Parse(BaseProtocolId);
            int patientId = int.Parse(BaseDecryptedPatientId);
            string datasetSQL = CacheManager.GetDatasetSQL(Session[SessionKey.DatasetId]);
            string visitDatasetSQL = base.GetPatientVisitsDataset();
            DataTable visits = ProtocolMgmtDa.GetPatientTimelineVisits(protocolId, patientId, datasetSQL, visitDatasetSQL, false, false);
            VisitsDropDown.DataSource = visits;
            VisitsDropDown.DataBind();
        }

        /// <summary>
        /// Populates a list of Unplanned Events for current patient.
        /// </summary>
        private void PopulateUnplannedEvents()
        {
            if (!string.IsNullOrEmpty(PatientSchemaId))
            {
                int protocolId = int.Parse(BaseProtocolId);
                int schemaId = int.Parse(BaseSchemaId);
                int patientId = int.Parse(BaseDecryptedPatientId);
                int patientSchemaId = int.Parse(PatientSchemaId);
                DataTable patientDeviationItems = ProtocolMgmtDa.GetPatientDeviations(protocolId, schemaId, patientId, patientSchemaId);
                // all deviations: filter
                var allDeviations = patientDeviationItems.AsEnumerable();
                var deviationRecords = allDeviations.Where(d => d["DeviationTable"].ToString() == "ProtocolMgr_PatientDeviations");
                // deviations linked to a visit
                var linkedDeviations = deviationRecords.Where(d => !d.IsNull("TimelineId"));
                var dataSource = allDeviations.Except(linkedDeviations);
                // build a list of deviations, ignoring linked visits (i.e., missed visits)
                DataTable patientDeviationsDataSource = dataSource.Count() > 0 ? dataSource.CopyToDataTable() : new DataTable();
                DeviationsGrid.DataSource = patientDeviationsDataSource;
                DeviationsGrid.DataBind();
            }
        }

        /// <summary>
        /// During initalization, set control values and attach change handler to updates schedule date and status on change
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void WireUpdateEvent(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                // Locate controls needed to be updates
                CaisisHidden deviationId = e.Row.FindControl(PatientDeviation.PatientDeviationId) as CaisisHidden;
                CaisisHidden pItemStatus = e.Row.FindControl(PatientItem.Status) as CaisisHidden;
                CaisisTextBox pItemSDate = e.Row.FindControl(PatientItem.ScheduledDate) as CaisisTextBox;
                Image dataEntered = e.Row.FindControl("DataEntered") as Image;
                Label dataEntry = e.Row.FindControl("DataEntry") as Label;

                // during data-binding, set values and UI elements (images, etc...) and realted deviation
                e.Row.DataBinding += new EventHandler(delegate(object o, EventArgs eArg)
                {
                    int patientItemId = int.Parse(PatientVisitsGrid.DataKeys[e.Row.RowIndex][PatientItem.PatientItemId].ToString());
                    string status = DataBinder.Eval(e.Row.DataItem, PatientItem.Status).ToString();
                    string scheduledDate = DataBinder.Eval(e.Row.DataItem, PatientItem.ScheduledDate, "{0:d}").ToString();

                    // set ICaisisInputControls Values
                    pItemStatus.Value = status;
                    pItemSDate.Value = scheduledDate;

                    // determine if checkbox marks are visible

                    string dataEntryCount = DataBinder.Eval(e.Row.DataItem, "DataEntryCount").ToString();
                    int EntryCount;
                    if (Int32.TryParse(dataEntryCount, out EntryCount)
                        && EntryCount > 0)
                    {
                        dataEntry.Text = "Entered";
                        dataEntry.CssClass = "DataEntered";
                        dataEntered.Visible = true;
                    }
                    else
                    {
                        dataEntry.Text = "Not Done";
                        dataEntry.CssClass = "DataNotDone";
                        dataEntered.Visible = false;
                    }
                    // for current patient item, find related deviation record
                    var foundDeviations = PatientDeviation.GetByFields<PatientDeviation>(new Dictionary<string, object> { 
                        { PatientDeviation.PatientItemId, patientItemId},
                        { PatientDeviation.DeviationType,"Missed Visit"} 
                    });
                    if (foundDeviations.Count() > 0)
                    {
                        deviationId.Value = foundDeviations.First()[PatientDeviation.PatientDeviationId].ToString();
                    }
                    // add date range validation
                    string clientDateFormatString = "new Date('{0}')";
                    object firstDate = DataBinder.Eval(e.Row.DataItem, PatientItem.FirstAnticipatedDate);
                    object lastDate = DataBinder.Eval(e.Row.DataItem, PatientItem.LastAnticipatedDate);

                    string clientFirstDate = "null";
                    string clientLastDate = "null";
                    if (firstDate != null && !string.IsNullOrEmpty(firstDate.ToString()))
                    {
                        DateTime date = (DateTime)firstDate;
                        clientFirstDate = string.Format(clientDateFormatString, date);
                    }
                    if (lastDate != null && !string.IsNullOrEmpty(lastDate.ToString()))
                    {
                        DateTime date = (DateTime)lastDate;
                        clientLastDate = string.Format(clientDateFormatString, date);

                    }
                    // add client script to validate date range
                    pItemSDate.Attributes["onfocus"] = string.Format("validateScheduledDate(this, {0}, {1}, true, event);", clientFirstDate, clientLastDate);
                });

                e.Row.PreRender += new EventHandler(delegate(object a, EventArgs b)
                    {
                        ReadOnlyDates.Add(pItemSDate.ClientID);
                    });
            }
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void MarkRowDirty(ICaisisInputControl sender, EventArgs e)
        {
            int rowIndex = ((sender as Control).NamingContainer as GridViewRow).RowIndex;
            if (!dirtyVisits.Contains(rowIndex))
            {
                dirtyVisits.Add(rowIndex);
            }
        }

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
        /// 
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void UpdateStatusClick(object sender, EventArgs e)
        {
            foreach (int dirtyRow in dirtyVisits)
            {
                GridViewRow row = PatientVisitsGrid.Rows[dirtyRow];
                CaisisHidden pItemStatus = row.FindControl(PatientItem.Status) as CaisisHidden;
                CaisisTextBox pItemSDate = row.FindControl(PatientItem.ScheduledDate) as CaisisTextBox;
                CaisisHidden deviationId = row.FindControl(PatientDeviation.PatientDeviationId) as CaisisHidden;
                int patientItemId = int.Parse(PatientVisitsGrid.DataKeys[dirtyRow][PatientItem.PatientItemId].ToString());
                string patientItemStatus = pItemStatus.Value;
                string scheduledDate = pItemSDate.Value;

                PatientItem biz = new PatientItem();
                biz.Get(patientItemId);
                biz[PatientItem.Status] = patientItemStatus;
                biz[PatientItem.ScheduledDate] = scheduledDate;
                // needs deviation ???


                if (patientItemStatus == "Missed")
                {
                    // do not create deviation
                    /*
                    PatientDeviation deviation = new PatientDeviation();
                    if (!string.IsNullOrEmpty(deviationId.Value))
                    {
                        deviation.Get(int.Parse(deviationId.Value));
                    }
                    // otherwise set required foreign key
                    else
                    {
                        deviation[PatientDeviation.PatientItemId] = patientItemId.ToString();
                    }
                    deviation[PatientDeviation.DeviationType] = "Missed Visit";
                    deviation.Save();

                    // update hidden deviation field
                    deviationId.Value = deviation[PatientDeviation.PatientDeviationId].ToString();
                    */
                }
                // if status isn't missed, remove deviation if exists
                else if (!string.IsNullOrEmpty(deviationId.Value))
                {
                    PatientDeviation deviation = new PatientDeviation();
                    deviation.Delete(int.Parse(deviationId.Value));
                    deviationId.Value = string.Empty;
                }
                biz.Save();

                // trigger scheduling for dependent items
                PatientProtocolController.ScheduleDependentItemsByItemStatus(patientItemId, patientItemStatus);

            }
            dirtyVisits.Clear();

            SetVisit(sender, e);

            RegisterReloadPatientLists();
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void SetVisit(object sender, EventArgs e)
        {
            if (SelectedTimelineId.HasValue)
            {
                PatientVisitsGrid.DataSource = GetFilteredVisitList(SelectedTimelineId.Value);
                PatientVisitsGrid.DataBind();

                DataEntryPanel.Visible = true;
            }
            else
            {
                DataEntryPanel.Visible = false;
            }
        }

        /// <summary>
        /// Returns a filtered list of patient items by visit (TimelineId)
        /// </summary>
        /// <param name="timelineId">The visit TimelineId</param>
        /// <returns></returns>
        private DataView GetFilteredVisitList(int timelineId)
        {
            int patientSchemaId = int.Parse(PatientSchemaId);
            DataTable visitItems = ProtocolMgmtDa.GetPatientVisitSchedulingSummary(patientSchemaId, timelineId);
            return visitItems.DefaultView;
        }


        /// <summary>
        /// 
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void ShiftPatientSchedule(object sender, EventArgs e)
        {
            SecurityController ct = new SecurityController();
            string userName = ct.GetUserName();
            int ptSchemaId = int.Parse(PatientSchemaId);
            int shiftNumDays = Int32.Parse(ShiftNumOfDays.Value);
            DateTime shiftDate = DateTime.Parse(ShiftDate.Value);
            // shift schedule with user provided values
            ProtocolMgmtDa.SaveShiftData(ptSchemaId, shiftDate, shiftNumDays, userName, DateTime.Now);
            // reload page to reflect new schedule
            Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "ReloadPage", "reloadPage();", true);
        }

        /// <summary>
        /// 
        /// </summary>
        private void RegisterReloadPatientLists()
        {
            // register script to refresh main patient lists
            Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "ReloadParentList", "reloadMainLists();", true);
        }
    }
}