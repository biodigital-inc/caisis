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
using Caisis.UI.Core.Classes.CustomControls;

namespace Caisis.UI.Modules.ProtocolMgmt
{
    public partial class AdminTimeline : ProtocolMgmtBaseAdminPage
    {
        /// <summary>
        /// An enum describing the occurence of a visit
        /// </summary>
        public enum ProtocolStudyItemType
        {
            PreStudy,
            OnStudy
        }

        /// <summary>
        /// A SQL Expression defining items defined as Pre-Study
        /// </summary>
        protected static readonly string PRE_STUDY_EXPR = "(PreStudySchemaItem IS NOT NULL AND PreStudySchemaItem = 1)";

        /// <summary>
        /// A SQL Expression defining items defined as On-Study
        /// </summary>
        protected static readonly string ON_STUDY_EXPR = "(PreStudySchemaItem IS NULL OR PreStudySchemaItem = 0)";

        /// <summary>
        /// Default sort-column for all Timeline records
        /// </summary>
        protected static readonly string SORT_COL = "SortColumn";

        /// <summary>
        /// Column value indicating recurring visit Timeline items
        /// </summary>
        protected static readonly string ITEM_TYPE_RECURRING_VISITS = "Recurring";

        /// <summary>
        /// Controls whether the layer will close on save, else remain open
        /// </summary>
        private static readonly bool SAVE_AND_CLOSE_LAYER = false;

        private static readonly string PRE_STUDY_RPTR_ID = "PreStudyItems";
        private static readonly string ON_STUDY_RPTR_ID = "OnStudyItems";

        private static readonly int DEFAULT_VISIT_COUNT = 10;
        private static readonly string DEFAULT_INTERVAL_TYPE = "Week";
        private static readonly string[] CLIENT_ID_FIELDS = new string[] { Timeline.VisitLabel, Timeline.DisplayUnitName, Timeline.NumberOfUnits, Timeline.BufferUnitName, Timeline.BufferNumberOfUnitsPlus, Timeline.BufferNumberOfUnitsMinus };

        /// <summary>
        /// a list of special statuses (not tied to PatientProtocolStatus table)
        /// </summary>
        private static readonly string[] OPTIONAL_STATUSES = new string[] { "1st Disease Progression", "2nd Disease Progression" };

        /// <summary>
        /// A list of dependent statuses (static + optional)
        /// </summary>
        private static readonly IEnumerable<string> DEPENDENT_STATUSES = PatientProtocolController.PatientStatusSequence.Concat(OPTIONAL_STATUSES);
 
        /// <summary>
        /// Defines a method which will update/insert a record using the provided TimelineService object
        /// </summary>
        delegate void ProtocolMgmtRecordUpdater(TimelineServices service);

        /// <summary>
        /// Defines a method which will return a RepeaterItemEventHandler, which is used for 
        /// initalizating of a RepeaterItem.
        /// </summary>
        /// <param name="mirrorRptr"></param>
        /// <param name="studyType"></param>
        /// <returns></returns>
        delegate RepeaterItemEventHandler ProtocolRptrCreator(Repeater mirrorRptr, ProtocolStudyItemType studyType);

        private int totalVisitCount = 0;
        /// <summary>
        /// Controls to toal number of Visits
        /// </summary>
        protected int TotalVisitCount
        {
            get
            {
                string postedCount = Request.QueryString["VisitCount"];
                if (!string.IsNullOrEmpty(postedCount))
                {
                    int parsedCount;
                    if (int.TryParse(postedCount, out parsedCount))
                    {
                        totalVisitCount = parsedCount;
                    }
                }
                return totalVisitCount;
            }
            set
            {
                totalVisitCount = value;
            }
        }

        private bool includePreStudyItems = false;
        /// <summary>
        /// 
        /// </summary>
        protected bool IncludePreStudyItems
        {
            get
            {
                return includePreStudyItems;
            }
        }

        private bool arePatientScheduled = false;
        protected bool ArePatientScheduled
        {
            get
            {
                return arePatientScheduled;
            }
        }

        /// <summary>
        /// Gets the default interval type from Query String, deaults to Weeks
        /// </summary>
        protected string DefaultIntervalType
        {
            get
            {
                string defaultIntervalType = Request.QueryString["defaultIntervalType"];
                if (string.IsNullOrEmpty(defaultIntervalType))
                {
                    defaultIntervalType = DEFAULT_INTERVAL_TYPE;
                }
                return defaultIntervalType;
            }
        }

        #region PRIVATE Maps


        private ProtocolStudyItemType[] protocolStudyItemTypes = new ProtocolStudyItemType[] { ProtocolStudyItemType.PreStudy, ProtocolStudyItemType.OnStudy };

        /// <summary>
        /// A Map containing the type of [StudyItemType][Column Index] -> Update/Insert Method
        /// </summary>
        private Dictionary<ProtocolStudyItemType, ProtocolMgmtRecordUpdater[]> TimelineColumnMap;

        /// <summary>
        /// A Map containing the type of [StudyItemType][Column Index, Row Index] -> Update/Insert Method
        /// </summary>
        private Dictionary<ProtocolStudyItemType, ProtocolMgmtRecordUpdater[,]> ItemTimelineColumnRowMap;

        private Dictionary<ProtocolStudyItemType, string[]> DataEntryColumnClientIds;

        #endregion

        #region DATA-BASED Properties, Helper Methods


        // PRIVATE DATA Members
        private DataView schemaItemsList;
        private DataView timelineVisits;
        private DataView onStudyTimeline;
        private DataView preStudyTimeline;
        private DataTable itemTimelineRecords;

        private int? protocolSchemaId;

        /// <summary>
        /// Gets the SchemaId for current Protocol Schema, used for determining On-Sudy/Pre-Study/Schema Items
        /// </summary>
        public int ProtocolSchemaId
        {
            get
            {
                // schema id should never be null on page, parse only once
                if (!protocolSchemaId.HasValue)
                {
                    protocolSchemaId = int.Parse(BaseSchemaId);
                }
                return protocolSchemaId.Value;
            }
        }

        /// <summary>
        /// Returns a list of SchemaItems for current Protocol Schema
        /// </summary>
        private DataView SchemaItemsList
        {
            get
            {
                if (schemaItemsList == null)
                {
                    schemaItemsList = GetSchemaItems(ProtocolSchemaId);
                }
                return schemaItemsList;
            }
        }

        /// <summary>
        /// Gets the number of SchemaItems
        /// </summary>
        public int SchemaItemsCount
        {
            get
            {
                return SchemaItemsList.Count;
            }
        }

        /// <summary>
        /// Gets a view of all the Timeline records belonging to the current Protocol Schema
        /// </summary>
        private DataView TimelineVisits
        {
            get
            {
                if (timelineVisits == null)
                {
                    // GET RAW DATA AND ADD SPECIAL COLUMNS
                    //DataView view = BusinessObject.GetByParentAsDataView<Timeline>(ProtocolSchemaId);
                    DataView view = ProtocolMgmtDa.GetTimelineBySchmeaId(ProtocolSchemaId).DefaultView;
                    DataTable rawTable = view.Table;
                    // Remove restrictions and constraints
                    foreach (DataColumn col in rawTable.Columns)
                    {
                        col.AllowDBNull = true;
                    }
                    rawTable.Constraints.Clear();

                    // ADD SORT COLUMNS
                    DataColumn sortCol = new DataColumn(SORT_COL, typeof(Int32));
                    sortCol.DefaultValue = 1;

                    // ADD SPECIAL RECURRING VISITS COLUMNS

                    // track if visit is recurring
                    DataColumn recurringVisitsColumn = new DataColumn("RecurringVisits", typeof(bool));
                    recurringVisitsColumn.DefaultValue = false;
                    // track visit for every "interval",i.e. for every 5 weeks, for every 2 months, etc...
                    DataColumn recurringVisitsEveryColumn = new DataColumn("RecurringVisitsEvery", typeof(int));
                    // track how long recurring happens,i.e., for 10 weeks, for 12 months,etc...
                    DataColumn recurringVisitsForColumn = new DataColumn("RecurringVisitsFor", typeof(int));

                    // add list of special columns
                    rawTable.Columns.AddRange(new DataColumn[] { sortCol, recurringVisitsColumn, recurringVisitsEveryColumn, recurringVisitsForColumn });

                    // get a list of recurring items, which are grouped by position and where type = "Recurring Visit"
                    var recurringGroups = from row in rawTable.AsEnumerable()
                                          let intervalType = row[Timeline.ItemIntervalType].ToString()
                                          let numUnits = int.Parse(row[Timeline.NumberOfUnits].ToString())
                                          let position = int.Parse(row[Timeline.DisplayColumnPosition].ToString())
                                          // recurring visits will be marked with "Recurring" in interval type
                                          where intervalType.Contains(ITEM_TYPE_RECURRING_VISITS)
                                          // recurring visits will have same position and increasing num units
                                          orderby position ascending, numUnits ascending
                                          group row by position into g
                                          select g;

                    // for each grouping of recurring visits, leave first visit, as its the base,
                    // and remove extra visits which are part of the recurring visits
                    foreach (IGrouping<int, DataRow> grouping in recurringGroups)
                    {
                        int groupVisits = grouping.Count();
                        // only concerted with groups > 1, as no need to handle recurring for single groups
                        if (groupVisits > 1)
                        {
                            // the visit which is first visit in sequence of recurring visits which serves as template to others
                            DataRow startIntervalVisit = grouping.First();

                            int lastNumUnit = (int)grouping.Last()[Timeline.NumberOfUnits];
                            int firstNumUnit = (int)grouping.First()[Timeline.NumberOfUnits];
                            // i.e. for every 2 weeks
                            int forEvery = (lastNumUnit - firstNumUnit) / (groupVisits - 1);
                            // i.e., for 10 weeks = every 2 weeks for 5 times
                            int forInterval = forEvery * grouping.Count();

                            // set values for default visit for setting inital values in UI
                            startIntervalVisit[recurringVisitsColumn] = true;
                            startIntervalVisit[recurringVisitsEveryColumn] = Math.Max(0, forEvery);
                            startIntervalVisit[recurringVisitsForColumn] = Math.Max(0, forInterval);

                            // for every recurring visit which isn't first, remove
                            var nonStartVisit = grouping.Where(b => b != startIntervalVisit);
                            foreach (DataRow row in nonStartVisit)
                            {
                                rawTable.Rows.Remove(row);
                            }
                        }
                    }

                    // DEFAULTS, set inital view,filtering, and sorting
                    timelineVisits = view;
                    timelineVisits.RowFilter = "";
                    timelineVisits.Sort = SORT_COL + " DESC";

                }
                return timelineVisits;
            }
        }

        /// <summary>
        /// Gets a list of Pre-Study Timeline records
        /// </summary>
        private DataView PreStudyTimeline
        {
            get
            {
                if (preStudyTimeline == null)
                {
                    // pre study always has 1 item
                    preStudyTimeline = GetFilteredStudies(PRE_STUDY_EXPR, 1);
                }
                return preStudyTimeline;
            }
        }

        /// <summary>
        /// Gets the number of Pre-Study Items
        /// </summary>
        public int PreStudyCount
        {
            get
            {
                return PreStudyTimeline.Count;
            }
        }

        /// <summary>
        /// Gets a list of On-Study Timeline records
        /// </summary>
        private DataView OnStudyTimeline
        {
            get
            {
                if (onStudyTimeline == null)
                {
                    onStudyTimeline = GetFilteredStudies(ON_STUDY_EXPR, TotalVisitCount);
                }
                return onStudyTimeline;
            }
        }

        /// <summary>
        /// Gets the number of On-Study Items
        /// </summary>
        public int OnStudyCount
        {
            get
            {
                return OnStudyTimeline.Count;
            }
        }

        /// <summary>
        /// Gets a list of all ItemTimeline records belonging to current ProtocolSchema
        /// </summary>
        private DataTable ItemTimelineRecords
        {
            get
            {
                if (itemTimelineRecords == null)
                {
                    itemTimelineRecords = GetItemTimelines(ProtocolSchemaId).Table;
                }
                return itemTimelineRecords;
            }
        }

        /// <summary>
        /// Gets a list of ProtocolSchemaItems by ProtocolSchemaId
        /// </summary>
        /// <param name="schemaId"></param>
        /// <returns></returns>
        protected DataView GetSchemaItems(int schemaId)
        {
            //return BusinessObject.GetByParentAsDataView<SchemaItem>(schemaId);
            return ProtocolMgmtDa.GetDistinctSchemaItems(schemaId).DefaultView;
        }

        /// <summary>
        /// Gets all ProtocolItemTimelines belonging to the ProtocolSchema.
        /// </summary>
        /// <param name="schemaId"></param>
        /// <returns></returns>
        protected DataView GetItemTimelines(int schemaId)
        {
            return ProtocolMgmtDa.GetTimelineItemsBySchemaId(schemaId).DefaultView;
        }

        /// <summary>
        /// Returns a filterd list of Timeline records, with blank rows
        /// </summary>
        /// <param name="expr">The filter expression used for filtering view</param>
        /// <param name="totalRows">The total number of rows needed for the filtered table</param>
        /// <returns></returns>
        private DataView GetFilteredStudies(string expr, int totalRows)
        {
            // Get a filtered table from underlying view
            TimelineVisits.RowFilter = expr;
            DataTable filteredTable = TimelineVisits.ToTable();
            // Clear filter for next usage
            TimelineVisits.RowFilter = "";

            // Return filtered table with n-blank rows
            DataView view = filteredTable.DefaultView;
            view.Sort = SORT_COL + " DESC, " + Timeline.DisplayColumnPosition + " ASC";

            // remove rows
            if (totalRows < view.Count)
            {
                // get a list of pri key which to supress from the view
                // i.e., 5 records exist, user wants 2 visits, supress 3
                List<string> supressedRecords = new List<string>();
                int startIndex = view.Count - 1;
                int endIndex = totalRows - 1;
                if (startIndex > -1 && endIndex > -1)
                {
                    for (int i = startIndex; i > endIndex; i--)
                    {
                        string timelineId = view[i][Timeline.TimelineId].ToString();
                        supressedRecords.Add(timelineId);
                    }
                    if (supressedRecords.Count > 0)
                    {
                        string ex = Timeline.TimelineId + " NOT IN({0})";
                        string csv = string.Join(",", supressedRecords.ToArray());
                        view.RowFilter = string.Format(ex, csv);
                    }
                }
            }
            // add rows
            else if (totalRows > view.Count)
            {
                int blankRows = totalRows - view.Count;
                for (int i = 0; i < blankRows; i++)
                {
                    DataRow blankRow = filteredTable.NewRow();
                    blankRow[SORT_COL] = 0;
                    filteredTable.Rows.Add(blankRow);
                }
            }

            // Default Visit Labels at the data source level
            for (int i = 0; i < filteredTable.Rows.Count; i++)
            {
                DataRow row = filteredTable.Rows[i];
                string visitLabel = row[Timeline.VisitLabel].ToString();
                if (string.IsNullOrEmpty(visitLabel))
                {
                    string newVisitLabel = "";
                    string trimmedIntervalType = DefaultIntervalType.Replace("s", "");
                    int numUnits;
                    if (DefaultIntervalType == "Day")
                    {
                        numUnits = (i * 7) + 1;
                    }
                    else
                    {
                        numUnits = i + 1;
                    }
                    if (expr == PRE_STUDY_EXPR)
                    {
                        newVisitLabel = "Pre-Study";
                    }
                    else
                    {
                        newVisitLabel = trimmedIntervalType + " " + numUnits;
                    }

                    // Default field values
                    row[Timeline.VisitLabel] = newVisitLabel;
                    row[Timeline.DisplayUnitName] = trimmedIntervalType;
                    row[Timeline.NumberOfUnits] = numUnits;

                    row[Timeline.BufferUnitName] = "Day";
                    row[Timeline.BufferNumberOfUnitsPlus] = 0;
                    row[Timeline.BufferNumberOfUnitsMinus] = 0;
                }
            }

            return view;
        }

        /// <summary>
        /// Returs whether the sepecified SchemaItemId and TimelineId are found in the Table of ItemTimeline records
        /// </summary>
        /// <param name="schemaItemId"></param>
        /// <param name="timelineId"></param>
        /// <returns></returns>
        private DataRow[] FindItemTimelineRecords(string schemaItemId, string timelineId)
        {
            string searchExpr = SchemaItem.SchemaItemId + " = " + schemaItemId + " AND " + Timeline.TimelineId + " = " + timelineId;
            DataRow[] foundRecords = ItemTimelineRecords.Select(searchExpr);
            return foundRecords;
        }

        #endregion
        protected override void OnInit(EventArgs e)
        {
            base.OnInit(e);

            // set if any patients have been assigned
            int schemaId = int.Parse(BaseSchemaId);
            arePatientScheduled = ProtocolMgmtDa.ArePatientsScheduledOnSchema(schemaId);

            // pre-study items
            string includePre = Request.QueryString["IncludePreStudy"];
            if (!string.IsNullOrEmpty(includePre))
            {
                includePreStudyItems = bool.Parse(includePre);
            }
            else
            {
                // Validate that "real" Timeline records exists in Pre-Study record (i.e., has pri key)
                if (PreStudyTimeline.Count > 0 && !string.IsNullOrEmpty(PreStudyTimeline[0][Timeline.TimelineId].ToString()))
                {
                    includePreStudyItems = true;
                }
                else
                {
                    includePreStudyItems = false;
                }
            }

            // Re-initalize data helpers
            InitalizeDataItems();
            InitalizeMap();
        }
        /// <summary>
        /// 
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected override void Page_Load(object sender, EventArgs e)
        {
            // During first load build interface
            if (!Page.IsPostBack)
            {
                // Verify that there are Items
                if (SchemaItemsCount == 0)
                {
                    Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "NoItems", "notifyNoItems();", true);
                    SetIntervalVisitForm.Visible = false;
                    Form.Visible = false;
                    return;
                }

                bool editTimlineMode = false;

                if (ArePatientScheduled)
                {
                    //SaveBtn.Visible = false;
                    ChangeVisitBtn.Enabled = false;
                    ShowHidePreStudy.Enabled = false;
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "PatientsRegisters", "notifyPatientsScheduled();", true);
                }

                // If no records exist yet, show default number of visits
                if (TimelineVisits.Count == 0)
                {
                    // if no reocrds exist and no visit in querey string, bring to interval chooser
                    if (!string.IsNullOrEmpty(Request.QueryString["VisitCount"]))
                    {
                        editTimlineMode = true;
                    }
                    TotalVisitCount = DEFAULT_VISIT_COUNT;
                }
                else
                {
                    editTimlineMode = true;
                }

                BindItems();
                SetIntervalVisitForm.Visible = !editTimlineMode;
                Form.Visible = editTimlineMode;

                ShowHidePreStudy.Checked = IncludePreStudyItems;
            }
        }


        /// <summary>
        /// 
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void SetVisitCountText(object sender, EventArgs e)
        {
            // Visit count is number of on study items
            VisitCount.Text = OnStudyCount.ToString();
        }

        /// <summary>
        /// Build interface based on various Repeaters
        /// </summary>
        protected void BindItems()
        {
            // Re-initalize data helpers
            InitalizeDataItems();
            InitalizeMap();

            // HEADER ROW and COLUMNS (Controls columns which represents Visits)
            PreStudyItemsRptr.DataSource = PreStudyTimeline;
            PreStudyItemsRptr.DataBind();

            OnStudyItemsRptr.DataSource = OnStudyTimeline;
            OnStudyItemsRptr.DataBind();

            // SCHEMA ITEM ROWS
            SchemaItemsRptr.DataSource = SchemaItemsList;
            SchemaItemsRptr.DataBind();

            // SCHEMA ITEM ROWS for EACH TIMELINEITEM (n-Columns for each x-Row)
            SchemaItemsTimelineItemRptr.DataSource = SchemaItemsList;
            SchemaItemsTimelineItemRptr.DataBind();
        }

        /// <summary>
        /// re-initalize various Data helpers
        /// </summary>
        private void InitalizeDataItems()
        {
            schemaItemsList = null;
            timelineVisits = null;
            onStudyTimeline = null;
            preStudyTimeline = null;
            itemTimelineRecords = null;
        }

        /// <summary>
        /// Re-initalizes map containing 
        /// </summary>
        private void InitalizeMap()
        {
            // initalize maps
            ItemTimelineColumnRowMap = new Dictionary<ProtocolStudyItemType, ProtocolMgmtRecordUpdater[,]>();
            TimelineColumnMap = new Dictionary<ProtocolStudyItemType, ProtocolMgmtRecordUpdater[]>();
            DataEntryColumnClientIds = new Dictionary<ProtocolStudyItemType, string[]>();

            // fill maps
            ItemTimelineColumnRowMap[ProtocolStudyItemType.PreStudy] = new ProtocolMgmtRecordUpdater[PreStudyCount, SchemaItemsCount];
            ItemTimelineColumnRowMap[ProtocolStudyItemType.OnStudy] = new ProtocolMgmtRecordUpdater[OnStudyCount, SchemaItemsCount];

            TimelineColumnMap[ProtocolStudyItemType.PreStudy] = new ProtocolMgmtRecordUpdater[PreStudyCount];
            TimelineColumnMap[ProtocolStudyItemType.OnStudy] = new ProtocolMgmtRecordUpdater[OnStudyCount];

            DataEntryColumnClientIds[ProtocolStudyItemType.PreStudy] = new string[PreStudyCount];
            DataEntryColumnClientIds[ProtocolStudyItemType.OnStudy] = new string[OnStudyCount];
        }

        #region Rptr DATA BINDING

        /// <summary>
        /// Adds relevant event handlers for Timeline header columns
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="timelineColumnArg"></param>
        protected void InitalizeTimelineEvents(object sender, RepeaterItemEventArgs timelineColumnArg)
        {
            ProtocolStudyItemType studyType = sender == PreStudyItemsRptr ? ProtocolStudyItemType.PreStudy : ProtocolStudyItemType.OnStudy;
            RepeaterItem timelineColumn = timelineColumnArg.Item;
            int colIndex = timelineColumn.ItemIndex;

            // for each real data column, i.e., not header or fotter
            if (timelineColumn.ItemType == ListItemType.Item || timelineColumn.ItemType == ListItemType.AlternatingItem)
            {
                // Hidden Field for tracking existing timeline records
                CaisisHidden timelineIdField = timelineColumn.FindControl("TimelineIdField") as CaisisHidden;

                // Get a Dictionary where the ICaisisInputControls can be looked up by Field Name
                Dictionary<string, ICaisisInputControl> iCICLookup = BuildICICLookup(timelineColumn);

                // PRE-RENDER/LATE-BOUND, fill client ids
                timelineColumn.PreRender += new EventHandler(delegate(object a, EventArgs b)
                {
                    string[] clientFieldList = new string[CLIENT_ID_FIELDS.Length];
                    for (int i = 0; i < CLIENT_ID_FIELDS.Length; i++)
                    {
                        Control iCICControl = (iCICLookup[CLIENT_ID_FIELDS[i]] as Control);
                        clientFieldList[i] = "'" + iCICControl.ClientID + "'";
                    }
                    string fullClientArgs = "[" + string.Join(",", clientFieldList) + "]";
                    DataEntryColumnClientIds[studyType][colIndex] = fullClientArgs;
                });

                //  Method for inserting Timeline for study type
                TimelineColumnMap[studyType][colIndex] = new ProtocolMgmtRecordUpdater(delegate(TimelineServices service)
                {
                    CheckBox advancedOptionsBox = timelineColumn.FindControl("AdvancedOptionsCheckBox") as CheckBox;
                    CheckBox repeatsCheckBox = timelineColumn.FindControl("RepeatsCheckBox") as CheckBox;
                    CheckBox dependentCheckBox = timelineColumn.FindControl("DependentCheckBox") as CheckBox;

                    bool doRecurring = false;
                    int? recurHowOften = null;
                    int? recurHowLong = null;

                    bool isDependent = false;
                    int? foreignTimelineIndex = null;
                    int? foreignSchemaItemId = null;

                    // a list of interval types for this visit (i.e., "Dependent", "Recurring", "Recurring|Dependent", "Recurring|Dependent Off Study", etc...)
                    List<string> itemIntervalTypes = new List<string>();

                    if (advancedOptionsBox != null && advancedOptionsBox.Checked)
                    {
                        // DETERMINE RECURRING VISIT
                        Control intervalType = timelineColumn.FindControl("ItemIntervalType");
                        Control intervalEvery = timelineColumn.FindControl("RecurringIntervalValue");
                        Control intervalFor = timelineColumn.FindControl("RecurringIntervalFor");

                        string recurringValue = Request.Form[intervalEvery.UniqueID];
                        string recurringFor = Request.Form[intervalFor.UniqueID];
                        if (repeatsCheckBox.Checked && !string.IsNullOrEmpty(recurringValue) && !string.IsNullOrEmpty(recurringFor))
                        {
                            doRecurring = true;
                            recurHowOften = int.Parse(recurringValue);
                            recurHowLong = int.Parse(recurringFor);

                            // mark as reucrring
                            itemIntervalTypes.Add("Recurring");
                        }


                        // DETERMINE DEPENDENT VISIT
                        CaisisSelect dependantVisists = timelineColumn.FindControl("DependantVisistsSelect") as CaisisSelect;
                        CaisisSelect dependantVisistItems = timelineColumn.FindControl("DependentVisitItems") as CaisisSelect;
                        CaisisSelect dependentPatientStatusSelect = timelineColumn.FindControl("PatientStatusesDropDown") as CaisisSelect;
                        RadioButton dependentCheckBoxNormal = timelineColumn.FindControl("DependentCheckBoxNormal") as RadioButton;
                        RadioButton dependentCheckBoxStatus = timelineColumn.FindControl("DependentCheckBoxStatus") as RadioButton;

                        // determine how long after dependent status
                        CaisisTextBox dependentNumUnits = timelineColumn.FindControl("DependentVisitNumberOfUnits") as CaisisTextBox;
                        CaisisSelect dependentUnitName = timelineColumn.FindControl("DependentVisitDisplayUnitName") as CaisisSelect;


                        // if chosing dependeing visit or if choosing recurring and dependent on previous
                        if (dependentCheckBox.Checked)
                        {
                            // determine if normal visit dependency or status dependency

                            // dependent on previous visit's item
                            if (dependentCheckBoxNormal.Checked)
                            {
                                // select visit item
                                string dependentSchemaItemId = dependantVisistItems.Value;
                                // validate selected visit and visit item
                                if (dependantVisists.SelectedIndex > -1 && !string.IsNullOrEmpty(dependentSchemaItemId))
                                {
                                    isDependent = true;
                                    // schema item is by id
                                    foreignSchemaItemId = int.Parse(dependentSchemaItemId);

                                    // if including pre study, use natural index
                                    if (ShowHidePreStudy.Checked)
                                    {
                                        foreignTimelineIndex = dependantVisists.SelectedIndex;
                                    }
                                    // otherwise we need to adjust for account pre study items
                                    else
                                    {
                                        if (dependantVisists.SelectedIndex - PreStudyCount > -1)
                                        {
                                            foreignTimelineIndex = dependantVisists.SelectedIndex - PreStudyCount;
                                        }
                                        // if visit index is invalid, dependency is invalid
                                        else
                                        {
                                            isDependent = false;
                                            foreignTimelineIndex = null;
                                            foreignSchemaItemId = null;
                                        }
                                    }

                                    // validate dependecy (as a dependency can only occur with a valid previous visit item)
                                    if (isDependent)
                                    {
                                        RepeaterItem schemaItemRow = SchemaItemsTimelineItemRptr.Items[dependantVisistItems.SelectedIndex];
                                        // get all checkboxes in the selected row
                                        var checkboxes = PageUtil.GetCaisisInputControlsInContainer(schemaItemRow).OfType<CaisisCheckBox>();
                                        // find the checkbox represening the selected visit's item
                                        if (checkboxes.Count() > 0 && checkboxes.Count() > foreignTimelineIndex)
                                        {
                                            int checkboxIndex = foreignTimelineIndex.Value;
                                            // adjust index based on pre-study
                                            if (!ShowHidePreStudy.Checked)
                                            {
                                                // if not using pre-study, adjust checkbox location to offset list of pre-study items
                                                checkboxIndex += PreStudyCount;
                                            }
                                            var checkbox = checkboxes.ElementAt(checkboxIndex);
                                            // invalidate
                                            if (!checkbox.Checked)
                                            {
                                                isDependent = false;
                                                foreignTimelineIndex = null;
                                                foreignSchemaItemId = null;
                                            }
                                        }
                                        else
                                        {
                                            isDependent = false;
                                            foreignTimelineIndex = null;
                                            foreignSchemaItemId = null;
                                        }
                                        // mark as dependent
                                        if (isDependent)
                                        {
                                            itemIntervalTypes.Add("Dependent");
                                        }
                                    }
                                }
                            }
                            // dependency on Patient status
                            else if (dependentCheckBoxStatus.Checked)
                            {
                                string dependentStatus = dependentPatientStatusSelect.Value;
                                // mark visit as depending on status
                                if (!string.IsNullOrEmpty(dependentStatus))
                                {
                                    isDependent = true;
                                    // i.e., "Dependent Off Treatment" - > depdens on patient going off treatment
                                    string dependentStatusInterval = string.Format("{0} {1}", "Dependent", dependentStatus);
                                    itemIntervalTypes.Add(dependentStatusInterval);
                                }
                            }
                        }

                        // if dependent or recurring, need to know how long after
                        if (isDependent || doRecurring)
                        {
                            if (!string.IsNullOrEmpty(dependentUnitName.Value) && !string.IsNullOrEmpty(dependentNumUnits.Value))
                            {
                                // udpate lookup to reflect new base Unit Inteval and num
                                iCICLookup[Timeline.DisplayUnitName] = dependentUnitName;
                                iCICLookup[Timeline.NumberOfUnits] = dependentNumUnits;
                            }
                        }
                    }
                    // update timeline
                    UpdateTimelineRecord(studyType, iCICLookup, service, itemIntervalTypes, colIndex, doRecurring, recurHowOften, recurHowLong, isDependent, foreignTimelineIndex, foreignSchemaItemId);
                });
            }
        }

        /// <summary>
        /// Foreach SchemaItem, located child ItemTimeline rptrs, and setup event handlers
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void BuildSchemaItemAndItemTimelineEvents(object sender, RepeaterItemEventArgs schemaItemArg)
        {
            RepeaterItem schemaItemRow = schemaItemArg.Item;
            if (schemaItemRow.ItemType == ListItemType.Header || schemaItemRow.ItemType == ListItemType.Item || schemaItemRow.ItemType == ListItemType.AlternatingItem)
            {
                // SchemaId pri key field
                CaisisHidden schemaItemIdField = schemaItemRow.FindControl("SchemaItemIdField") as CaisisHidden;
                // PreStudy ItemTimeline rptr
                Repeater preStudyItems = schemaItemRow.FindControl(PRE_STUDY_RPTR_ID) as Repeater;
                // OnStudy ItemTimeline rptr
                Repeater onStudyItems = schemaItemRow.FindControl(ON_STUDY_RPTR_ID) as Repeater;

                // Set prikey SchemaId value
                if (schemaItemIdField != null && schemaItemRow.DataItem != null)
                {
                    schemaItemIdField.Value = DataBinder.Eval(schemaItemRow.DataItem, SchemaItem.SchemaItemId).ToString();
                }

                // When SchemaItem is binding, bind child PreStudy and OnStudy Repeaters
                // These columns will be the assciation between a SchemaItem (row) and Timeline (col)
                schemaItemRow.DataBinding += new EventHandler(delegate(object schemaItemRptr, EventArgs schemaItemArgs)
                {
                    preStudyItems.DataSource = PreStudyTimeline;
                    preStudyItems.DataBind();

                    onStudyItems.DataSource = OnStudyTimeline;
                    onStudyItems.DataBind();
                });

                // During ItemCreation of ItemTimeline records (i.e.,real data columns), attach event handlers
                if (schemaItemRow.ItemType == ListItemType.Item || schemaItemRow.ItemType == ListItemType.AlternatingItem)
                {
                    // A method which returns and RepeaterItemEventHandler used for handling the creation
                    // of each column/checkbox, containing logic for updating/populating the ItemTimeline table
                    ProtocolRptrCreator GetCreator = new ProtocolRptrCreator(delegate(Repeater mirrorRptr, ProtocolStudyItemType studyType)
                    {
                        // Create a new instance of the OnItemCreate Handler
                        return new RepeaterItemEventHandler(delegate(object o, RepeaterItemEventArgs timelineItemEventArg)
                        {
                            if (timelineItemEventArg.Item.ItemType == ListItemType.Item || timelineItemEventArg.Item.ItemType == ListItemType.AlternatingItem)
                            {
                                // ItemTimeline column
                                RepeaterItem itemTimelineCol = timelineItemEventArg.Item;
                                // Timeline column
                                RepeaterItem timelineDataEntryCol = mirrorRptr.Items[itemTimelineCol.ItemIndex];
                                // build events which sets checkboxes, and handles updating of ItemTimlime records
                                InitalizeItemTimelineEvents(studyType, schemaItemRow, itemTimelineCol, timelineDataEntryCol, schemaItemIdField);
                            }
                        });
                    });

                    // Attach Handlers
                    preStudyItems.ItemCreated += GetCreator(PreStudyItemsRptr, ProtocolStudyItemType.PreStudy);
                    onStudyItems.ItemCreated += GetCreator(OnStudyItemsRptr, ProtocolStudyItemType.OnStudy);
                }
            }
        }

        /// <summary>
        /// Builds event handlers which set checkbox states on binding and updates
        /// </summary>
        /// <param name="studyType"></param>
        /// <param name="schemaItemRow"></param>
        /// <param name="itemTimelineCol"></param>
        /// <param name="timelineDataEntryCol"></param>
        /// <param name="schemaItemIdField"></param>
        protected void InitalizeItemTimelineEvents(ProtocolStudyItemType studyType, RepeaterItem schemaItemRow, RepeaterItem itemTimelineCol, RepeaterItem timelineDataEntryCol, CaisisHidden schemaItemIdField)
        {
            // Current Timeline Index
            int colIndex = timelineDataEntryCol.ItemIndex;
            // Current SchemaItem
            int rowIndex = schemaItemRow.ItemIndex;

            CaisisHidden timelineItemIdField = itemTimelineCol.FindControl("ItemTimelineIdField") as CaisisHidden;

            CaisisCheckBox colCheckBox = itemTimelineCol.FindControl("ColCheckBox") as CaisisCheckBox;
            CaisisHidden timelineIdField = timelineDataEntryCol.FindControl("TimelineIdField") as CaisisHidden;

            // If patients are scheduled, checkbox is disabled
            colCheckBox.Enabled = !ArePatientScheduled;

            // Create anonmous EventHandler to determine checkbox state when binding to data
            itemTimelineCol.DataBinding += new EventHandler(delegate(object oo, EventArgs ee)
            {
                string timelineId = DataBinder.Eval(itemTimelineCol.DataItem, Timeline.TimelineId).ToString();
                string schemaItemId = schemaItemIdField.Value;

                if (!string.IsNullOrEmpty(schemaItemId) && !string.IsNullOrEmpty(timelineId))
                {
                    // If ItemTimeline records are found based, check check-box
                    DataRow[] foundRecords = FindItemTimelineRecords(schemaItemId, timelineId);
                    if (foundRecords.Length > 0)
                    {
                        // set ItemTimelineId used for updating
                        timelineItemIdField.Value = foundRecords[0][ItemTimeline.ItemTimelineId].ToString();
                        // checkbox chcked
                        colCheckBox.Checked = true;
                    }
                    else
                    {
                        colCheckBox.Checked = false;
                    }
                }
                else
                {
                    colCheckBox.Checked = false;
                }
                // if patients are scheduled, allow adding
                if (ArePatientScheduled && !colCheckBox.Checked)
                {
                    colCheckBox.Enabled = true;
                }
            });

            // Method for inserting ItemTimeline for study type
            ItemTimelineColumnRowMap[studyType][colIndex, rowIndex] = new ProtocolMgmtRecordUpdater(delegate(TimelineServices service)
            {
                // If checked, create new record
                if (colCheckBox.Checked)
                {
                    UpdateItemTimelineRecord(service, int.Parse(schemaItemIdField.Value));
                }
            });
        }

        /// <summary>
        /// Populates ICaisisInputControls with values from DataItem
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void SetInputFieldValues(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.AlternatingItem || e.Item.ItemType == ListItemType.Item)
            {
                // Iterate over icic fields and set field values
                List<ICaisisInputControl> iCICList = PageUtil.GetCaisisInputControlsInContainer(e.Item);
                foreach (ICaisisInputControl iCIC in iCICList)
                {
                    if (!string.IsNullOrEmpty(iCIC.Field))
                    {
                        string fieldValue = DataBinder.Eval(e.Item.DataItem, iCIC.Field).ToString();
                        if (!string.IsNullOrEmpty(fieldValue))
                        {
                            iCIC.Value = fieldValue;
                        }
                    }
                }
                // ADVANCED OPTIONS
                bool isRepeat = (bool)DataBinder.Eval(e.Item.DataItem, "RecurringVisits");
                // specially computed columns
                string dependentItemTimelineId = DataBinder.Eval(e.Item.DataItem, "DependentItemTimelineId").ToString();
                string dependentTimelineId = DataBinder.Eval(e.Item.DataItem, "DependentTimelineId").ToString();
                string dependentSchemaItemId = DataBinder.Eval(e.Item.DataItem, "DependentSchemaItemId").ToString();
                string itemIntervalType = DataBinder.Eval(e.Item.DataItem, Timeline.ItemIntervalType).ToString();

                bool isDependent = !string.IsNullOrEmpty(dependentItemTimelineId);


                CheckBox advancedOptionsBox = e.Item.FindControl("AdvancedOptionsCheckBox") as CheckBox;
                CheckBox repeatsCheckBox = e.Item.FindControl("RepeatsCheckBox") as CheckBox;
                CheckBox dependentCheckBox = e.Item.FindControl("DependentCheckBox") as CheckBox;
                if (advancedOptionsBox != null)
                {
                    // check boxes
                    advancedOptionsBox.Checked = isRepeat || isDependent;
                    repeatsCheckBox.Checked = isRepeat;
                    dependentCheckBox.Checked = isDependent;
                }

                // REPEAT VISITS
                CaisisSelect recurringInterval = e.Item.FindControl("RecurringIntervalValue") as CaisisSelect;
                CaisisSelect recurringIntervalFor = e.Item.FindControl("RecurringIntervalFor") as CaisisSelect;
                if (recurringInterval != null)
                {
                    string recurringIntervalValue = DataBinder.Eval(e.Item.DataItem, "RecurringVisitsEvery").ToString();
                    string recurringIntervalForValue = DataBinder.Eval(e.Item.DataItem, "RecurringVisitsFor").ToString();

                    var days = Enumerable.Range(1, 30);
                    recurringInterval.DataSource = days;
                    recurringInterval.DataBind();

                    recurringIntervalFor.DataSource = days;
                    recurringIntervalFor.DataBind();

                    // if a recurring visit, set how often and how many times it recurrs
                    if (isRepeat)
                    {
                        recurringInterval.Value = recurringIntervalValue;
                        recurringIntervalFor.Value = recurringIntervalForValue;
                    }
                }

                // DEPENDENT VISITS
                CaisisSelect dependantVisistsSelect = e.Item.FindControl("DependantVisistsSelect") as CaisisSelect;
                CaisisSelect dependentVisitItems = e.Item.FindControl("DependentVisitItems") as CaisisSelect;
                CaisisSelect dependentPatientStatusSelect = e.Item.FindControl("PatientStatusesDropDown") as CaisisSelect;
                RadioButton dependentCheckBoxNormal = e.Item.FindControl("DependentCheckBoxNormal") as RadioButton;
                RadioButton dependentCheckBoxStatus = e.Item.FindControl("DependentCheckBoxStatus") as RadioButton;

                if (dependantVisistsSelect != null)
                {
                    DataTable dependentVisits = null;
                    // determine if there are pre study items
                    if (PreStudyTimeline.Table.Rows.Count > 0)
                    {
                        // determine if there are on study items
                        if (OnStudyTimeline.Table.Rows.Count > 0)
                        {
                            // get all pre study visits
                            var preStudy = PreStudyTimeline.Table.AsEnumerable();
                            // get on study visits before this visit
                            var onStudy = OnStudyTimeline.Table.AsEnumerable().Take(e.Item.ItemIndex);
                            // if there are on study items not including this, combile lines
                            if (onStudy.Count() > 0)
                            {
                                // combine pre study and filtered on study visits
                                dependentVisits = preStudy.Concat(onStudy).CopyToDataTable();
                            }
                            else
                            {
                                dependentVisits = PreStudyTimeline.Table;
                            }
                        }
                        else
                        {
                            dependentVisits = PreStudyTimeline.Table;
                        }
                    }
                    // determine on study items
                    else if (OnStudyTimeline.Table.Rows.Count > 0)
                    {
                        dependentVisits = OnStudyTimeline.Table;
                    }

                    if (dependentVisits != null)
                    {
                        // build list of visits which this can depend
                        dependantVisistsSelect.DataSource = dependentVisits;
                        dependantVisistsSelect.DataBind();
                    }

                    // current visit can depend on any item
                    dependentVisitItems.DataSource = SchemaItemsList;
                    dependentVisitItems.DataBind();

                    // build list of available statuses
                    dependentPatientStatusSelect.DataSource = DEPENDENT_STATUSES;
                    dependentPatientStatusSelect.DataBind();

                    // if dependent, set previous visit and item
                    if (isDependent && !string.IsNullOrEmpty(dependentTimelineId) && !string.IsNullOrEmpty(dependentSchemaItemId))
                    {
                        dependantVisistsSelect.Value = dependentTimelineId;
                        dependentVisitItems.Value = dependentSchemaItemId;

                        dependentCheckBoxNormal.Checked = true;
                    }
                    else
                    {
                        // determine if dependent on status
                        var intervalTypes = itemIntervalType.Split('|');
                        var dependentOnStatuses = from status in intervalTypes
                                                  // cleanup status, "Dependent Off Study" -> "Off Study"
                                                  let dependentStatusName = status.Replace("Dependent ", "")
                                                  // if status list contains one of these values, it is dependent on this status
                                                  where DEPENDENT_STATUSES.Contains(dependentStatusName)
                                                  select dependentStatusName;
                        // if current interval type includes a patient status, set status
                        if (dependentOnStatuses.Count() > 0)
                        {
                            advancedOptionsBox.Checked = true;
                            dependentCheckBox.Checked = true;
                            dependentCheckBoxStatus.Checked = true;
                            dependentPatientStatusSelect.Value = dependentOnStatuses.First();
                        }
                    }
                }

            }
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="container"></param>
        /// <returns></returns>
        private Dictionary<string, ICaisisInputControl> BuildICICLookup(Control container)
        {
            List<ICaisisInputControl> iCICs = PageUtil.GetCaisisInputControlsInContainer(container);
            Dictionary<string, ICaisisInputControl> iCICLookup = new Dictionary<string, ICaisisInputControl>(iCICs.Count);
            foreach (ICaisisInputControl iCIC in iCICs)
            {
                //if not disabled from front-end
                if (iCIC.Enabled != false)
                {
                    iCIC.Enabled = !ArePatientScheduled;
                }
                if (!string.IsNullOrEmpty(iCIC.Field) && !iCICLookup.ContainsKey(iCIC.Field))
                {
                    iCICLookup.Add(iCIC.Field, iCIC);
                }
            }
            return iCICLookup;
        }

        #endregion

        #region MAIN INSERT METHODS

        /// <summary>
        /// Inserts Timeline records
        /// </summary>
        /// <param name="studyType"></param>
        /// <param name="iCICLookup"></param>
        /// <param name="service"></param>
        /// <param name="intervalTypes"></param>
        /// <param name="colIndex"></param>
        /// <param name="doRecurring"></param>
        /// <param name="recurHowOften"></param>
        /// <param name="recurHowLong"></param>
        /// <param name="isDependent"></param>
        /// <param name="foreignTimelineIndex"></param>
        /// <param name="foreignSchemaItemId"></param>
        private void UpdateTimelineRecord(ProtocolStudyItemType studyType, Dictionary<string, ICaisisInputControl> iCICLookup, TimelineServices service, IEnumerable<string> intervalTypes, int colIndex, bool doRecurring, int? recurHowOften, int? recurHowLong, bool isDependent, int? foreignTimelineIndex, int? foreignSchemaItemId)
        {
            // INSERTING
            string unit = iCICLookup[Timeline.DisplayUnitName].Value;
            int position = colIndex;
            int numUnits = 1;
            int.TryParse(iCICLookup[Timeline.NumberOfUnits].Value, out numUnits);

            string bufUnitName = iCICLookup[Timeline.BufferUnitName].Value;
            int bufPlus, bufMinus = 0;

            int.TryParse(iCICLookup[Timeline.BufferNumberOfUnitsPlus].Value, out bufPlus);
            int.TryParse(iCICLookup[Timeline.BufferNumberOfUnitsMinus].Value, out bufMinus);

            string visistLabel = iCICLookup[Timeline.VisitLabel].Value;

            // ??? Only allow recurring or regular(empty) type now
            //string itemIntervalType = doRecurring ? ITEM_TYPE_RECURRING_VISITS : string.Empty;
            //string itemIntervalType = iCICLookup[Timeline.ItemIntervalType].Value;

            object preStudyBit = studyType == ProtocolStudyItemType.PreStudy ? 1 : 0;

            // HANDLE RECURRING ITEMS
            if (doRecurring && recurHowOften.HasValue && recurHowLong.HasValue)
            {
                // recurring interval will match unit name
                //string recurringIntervalValue = unit;
                //// validate int fields
                //int everyInterval;
                //int forInterval;

                /*
                 * Inital Visit: Week 1
                 * Recurrs How Often: 2 Weeks
                 * Recurrs How Long: 8 Weeks
                 * Number of Intevals: 3 (minus inital visit)
                 * Total Visit: 5 (Week 1, Week 3, Week 5, Week 7, Week 9)
                 */

                // insert default visit (i.e., Week 1)
                UpdateTimeline(service, studyType, colIndex, unit, position, numUnits, bufUnitName, bufPlus, bufMinus, visistLabel, intervalTypes, preStudyBit, foreignTimelineIndex, foreignSchemaItemId);
                //if (int.TryParse(recurringValue, out everyInterval) && int.TryParse(recurringFor, out forInterval))
                //{
                // total number of visits (minus 1 for inital visit)
                int numIntervals = (recurHowLong.Value / recurHowOften.Value) - 1;
                // for total number of recurring visits, increment units (i.e. Week 1 becomes 3, 5, 7, etc...)
                for (int i = 1; i <= numIntervals; i++)
                {
                    int localNumUnits = numUnits + (recurHowOften.Value * i);
                    // generate static visit label based on interval type and num units
                    string localVisistLabel = string.Format("{0} {1}", unit, localNumUnits);
                    // insert record
                    UpdateTimeline(service, studyType, colIndex, unit, position, localNumUnits, bufUnitName, bufPlus, bufMinus, localVisistLabel, intervalTypes, preStudyBit, foreignTimelineIndex, foreignSchemaItemId);
                }

                //int startNumUnits = numUnits + everyInterval;
                // build recurring visits loop
                //for (int addNumUnits = startNumUnits; addNumUnits <= forInterval; addNumUnits += everyInterval)
                //{
                //int localNumUnits = numUnits + addNumUnits;
                //string localVisistLabel = string.Format("{0} {1}", recurringIntervalValue, localNumUnits);

                //UpdateTimeline(service, studyType, colIndex, unit, position, localNumUnits, bufUnitName, bufPlus, bufMinus, localVisistLabel, itemIntervalType, preStudyBit);
                //}
                //}
            }
            // normal update
            else
            {
                UpdateTimeline(service, studyType, colIndex, unit, position, numUnits, bufUnitName, bufPlus, bufMinus, visistLabel, intervalTypes, preStudyBit, foreignTimelineIndex, foreignSchemaItemId);
            }
        }


        private void UpdateTimeline(TimelineServices service, ProtocolStudyItemType studyType, int colIndex, string unit, int position, int numUnits, string bufUnitName, int bufPlus, int bufMinus, string visistLabel, IEnumerable<string> intervalTypes, object preStudyBit, int? foreignTimelineIndex, int? foreignSchemaItemId)
        {
            // insert Timeline
            service.InsertTimeline(unit, position, numUnits, bufUnitName, bufPlus, bufMinus, visistLabel, intervalTypes, preStudyBit, foreignTimelineIndex, foreignSchemaItemId);
            //return dependentVisit; UpdateTimeline(TimelineServices service, ProtocolStudyItemType studyType, int colIndex, string unit, int position, int numUnits, string bufUnitName, int bufPlus, int bufMinus, string visistLabel, string itemIntervalType, object preStudyBit, int? foreignTimelineIndex, int? foreignSchemaItemId)


            // insert ItemTimeline for each row of current Timeline
            UpdateTimelineChildItemTimeline(service, studyType, colIndex);
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="service"></param>
        /// <param name="studyType"></param>
        /// <param name="colIndex"></param>
        private void UpdateTimelineChildItemTimeline(TimelineServices service, ProtocolStudyItemType studyType, int colIndex)
        {
            for (int rowIndex = 0; rowIndex < SchemaItemsList.Count; rowIndex++)
            {
                ProtocolMgmtRecordUpdater itemTimelineUpdater = ItemTimelineColumnRowMap[studyType][colIndex, rowIndex];
                itemTimelineUpdater(service);
            }
        }

        /// <summary>
        /// Updates ItemTimeline record
        /// </summary>
        /// <param name="service"></param>
        /// <param name="schemaId"></param>
        private void UpdateItemTimelineRecord(TimelineServices service, int schemaId)
        {
            service.InsertItemTimeline(schemaId);
        }

        #endregion

        #region CLICK EVENTS

        /// <summary>
        /// Redirect response to reflect new visit count
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void ChangeVisitNumberClick(object sender, EventArgs e)
        {
            // Validate Input
            int visitCount = DEFAULT_VISIT_COUNT;
            if (!string.IsNullOrEmpty(VisitCount.Text))
            {
                int.TryParse(VisitCount.Text, out visitCount);
            }
            LoadNewTimelineRequest(visitCount.ToString(), ShowHidePreStudy.Checked);
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void PrevClick(object sender, EventArgs e)
        {
            // navigate to previous step
            Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "GoToPrevStep", "goToPrevStep();", true);
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void SaveClick(object sender, EventArgs e)
        {
            if (ArePatientScheduled)
            {
                SaveNewTimelineItems();
            }
            else
            {
                SaveTimeline();
            }
            if (SAVE_AND_CLOSE_LAYER)
            {
                // closes layer and reload schema list
                Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "saveAndFinish", "saveAndFinish();", true);
            }
            else
            {
                // leave layer open and reload timeline interface
                LoadNewTimelineRequest(TotalVisitCount.ToString(), ShowHidePreStudy.Checked);
            }
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="visitCount"></param>
        /// <param name="includePreStudy"></param>
        protected void LoadNewTimelineRequest(string visitCount, bool includePreStudy)
        {
            // pass new count to url
            string redirectURL = GetQueryString("AdminTimeline.aspx") + "&VisitCount=" + visitCount + "&IncludePreStudy=" + includePreStudy.ToString().ToLower();
            // load new request
            Response.Redirect(redirectURL, true);
        }

        #endregion

        protected string PRE_VISIT_LABEL_LIST = "";
        protected string ON_VISIT_LABEL_LIST = "";

        protected override void Render(HtmlTextWriter writer)
        {
            // Register client visit label ids
            PRE_VISIT_LABEL_LIST = string.Join(",", DataEntryColumnClientIds[ProtocolStudyItemType.PreStudy]);
            ON_VISIT_LABEL_LIST = string.Join(",", DataEntryColumnClientIds[ProtocolStudyItemType.OnStudy]);

            base.Render(writer);
        }


        /// <summary>
        /// 
        /// </summary>
        private void SaveTimeline()
        {
            TimelineServices service = new TimelineServices(ProtocolSchemaId);
            int updateIndex = 0;

            // for each type of study type (pre/on)
            for (int i = 0; i < protocolStudyItemTypes.Length; i++)
            {
                ProtocolStudyItemType type = protocolStudyItemTypes[i];
                ProtocolMgmtRecordUpdater[] PreOnStudyColumnMap = TimelineColumnMap[type];
                if (type == ProtocolStudyItemType.PreStudy && ShowHidePreStudy.Checked == false)
                {
                    // do nothing
                }
                else
                {
                    for (int colIndex = 0; colIndex < PreOnStudyColumnMap.Length; colIndex++, updateIndex++)
                    {
                        // run update for column (Timeline)
                        ProtocolMgmtRecordUpdater timlineUpdater = PreOnStudyColumnMap[colIndex];
                        timlineUpdater(service);
                    }
                }
            }

            // Verify no Patients assigned
            if (!ProtocolMgmtDa.ArePatientsScheduledOnSchema(ProtocolSchemaId))
            {
                // Remove old timeline
                ProtocolMgmtDa.DeleteOldTimeline(ProtocolSchemaId);
                // Insert new records
                service.Save();
            }
        }

        private void SaveNewTimelineItems()
        {
            int schemaId = int.Parse(BaseSchemaId);
            // get a lookup of Timelines -> Repeating Timelines (i.e., this visit repeats x times)
            var data_source = from r in ProtocolMgmtDa.GetTimelineBySchmeaId(ProtocolSchemaId).AsEnumerable()
                         let type = r[Timeline.ItemIntervalType].ToString()
                         where type == "Recurring"
                         let timelineId = (int)r[Timeline.TimelineId]
                         let position = (int)r[Timeline.DisplayColumnPosition]
                         select new
                         {
                             TimelineId = timelineId,
                             Position = position
                         };
            var data_source_lookup = from a in data_source
                      select new
                      {
                          TimelineId = a.TimelineId,
                          RepeatingTimelines = from b in data_source
                                               where a.Position == b.Position && a.TimelineId != b.TimelineId
                                               select b.TimelineId
                      };
            var timeline_dictionary = data_source_lookup.ToDictionary(a => a.TimelineId, a => a.RepeatingTimelines.ToArray());

            List<KeyValuePair<int,int>> newItemTimelines = new List<KeyValuePair<int,int>>();
            for (int i = 0; i < protocolStudyItemTypes.Length; i++)
            {
                ProtocolStudyItemType type = protocolStudyItemTypes[i];
                string typePrefix = type == ProtocolStudyItemType.PreStudy ? "Pre" : "On";

                var timelineRptr = type == ProtocolStudyItemType.PreStudy ? PreStudyItemsRptr : OnStudyItemsRptr;
                for (int j = 0; j < SchemaItemsTimelineItemRptr.Items.Count; j++)
                {
                    RepeaterItem item = SchemaItemsTimelineItemRptr.Items[j];
                    var schemaItemIdField = item.FindControl("SchemaItemIdField") as CaisisHidden;
                    int schemaItemId = int.Parse(schemaItemIdField.Value);
                    // row current schema item row, get item timeline cell
                    var itemTimelineItems = item.FindControl(type == ProtocolStudyItemType.PreStudy ? "PreStudyItems" : "OnStudyItems") as Repeater;
                    for (int k = 0; k < itemTimelineItems.Items.Count; k++)
                    {
                        RepeaterItem itemTimeline = itemTimelineItems.Items[k];
                        RepeaterItem timelineColumn = timelineRptr.Items[k];
                        var timelineIdField = timelineColumn.FindControl("TimelineIdField") as CaisisHidden;
                        // find check box in individual cell
                        var checkbox = itemTimeline.FindControl("ColCheckBox") as CaisisCheckBox;
                        // validate: timeline record exists + enabled + checked = insert new item timeline
                        if (!string.IsNullOrEmpty(timelineIdField.Value) && checkbox.Enabled && checkbox.Checked)
                        {
                            int timelineId = int.Parse(timelineIdField.Value);
                            // Timeline + related repeating Timelines (if applicable)
                            var timelines = new int[] { timelineId }.Concat(timeline_dictionary.ContainsKey(timelineId) ? timeline_dictionary[timelineId] : new int[0]);
                            foreach (int visitTimelineId in timelines)
                            {
                                // i.e., insert ItemTimeline using TimelineId + SchemaItemId
                                newItemTimelines.Add(new KeyValuePair<int, int>(visitTimelineId, schemaItemId));
                            }
                        }
                    }
                }
            }
            // build insert and schema items
            if (newItemTimelines.Count() > 0)
            {
                Caisis.Security.SecurityController sc = new Caisis.Security.SecurityController();
                string username = sc.GetUserName();
                ProtocolMgmtController.ScheduleNewPatientItems(schemaId, newItemTimelines, username);
            }
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void AddRecurringScript(object sender, EventArgs e)
        {
            CheckBox cb = sender as CheckBox;
            int index = (cb.NamingContainer as RepeaterItem).ItemIndex;
            cb.Attributes["onclick"] = string.Format("handleRecurringClick(this,{0});", index);
        }
    }
}