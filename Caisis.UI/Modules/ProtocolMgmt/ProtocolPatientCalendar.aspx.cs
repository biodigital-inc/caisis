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

using Caisis.Security;
using Caisis.Controller;
using Caisis.UI.Core.Classes;
using Caisis.UI.ClientScript.Ajax;

using Caisis.BOL;
using Caisis.DataAccess;
using System.Globalization;

using System.Linq;

namespace Caisis.UI.Modules.ProtocolMgmt
{
    /// <summary>
    /// Represents a calendar view of All Patient's visits across a Protocol.
    /// Also used to represent a single Patient's visits across a Protocol.
    /// </summary>
    public partial class ProtocolPatientCalendar : ProtocolMgmtPatientBasePage
    {
        /// <summary>
        /// The query string key used for passing default calendar date.
        /// </summary>
        protected static readonly string QUERY_DATE_KEY = "SetCalendarDate";

        private const int PREV_YEARS = 5;
        private const int FOLLOWING_YEARS = 5;

        protected bool IncludeDeceasedPatients
        {
            get
            {
                string includeDeceased = Request.QueryString["includeDeceased"];
                return string.IsNullOrEmpty(includeDeceased) || PageUtil.IsTrueString(includeDeceased);
            }
        }

        /// <summary>
        /// A lookup of visits by Date (normalized date, i.e., zeroed time components)
        /// </summary>
        private Dictionary<DateTime, VisitContainer> visits = new Dictionary<DateTime, VisitContainer>();

        protected override void Page_Load(object sender, EventArgs e)
        {
            base.Page_Load(sender, e);

            this.EnableViewState = true;

            int protocolId = int.Parse(BaseProtocolId);
            int? ptId = GetPatientId();

            AdjustCalendarDisplay(ptId.HasValue);

            PopulateVisits(protocolId, ptId);

            if (!IsPostBack)
            {
                // init date, .NET bug
                ProtocolCalendar.VisibleDate = DateTime.Today;

                // build drop downs
                PopulateMonth();
                PopulateYear();

                // get default date
                DateTime defaultDate = GetDefaultDate();

                // set the default visible date
                SetCalendarDate(defaultDate);
            }
        }

        /// <summary>
        /// Adjust calendar display depdening on global or patient specific view
        /// </summary>
        /// <param name="patientSpecific"></param>
        protected void AdjustCalendarDisplay(bool patientSpecific)
        {
            if (!patientSpecific)
            {
                //ProtocolCalendar.DayStyle.Height = 64;
                PatientCalendarButtons.Visible = false;
                pageBody.Attributes.CssStyle["background-color"] = "#fbfbfb";
                CalendarKeyImg.Src = "Images/Key_VisitStatus.png";
            }
        }

        /// <summary>
        /// On pre-render, build navigation
        /// </summary>
        /// <param name="e"></param>
        protected override void OnPreRender(EventArgs e)
        {
            base.OnPreRender(e);
            SetNavigationLinks();
        }

        /// <summary>
        /// Sets navigation links to move though calendar
        /// </summary>
        private void SetNavigationLinks()
        {
            // calculate dates for moving through calendar
            DateTime current = ProtocolCalendar.VisibleDate;
            DateTime nextYear = current.AddYears(1);
            DateTime prevYear = current.AddYears(-1);
            DateTime nextMonth = current.AddMonths(1);
            DateTime prevMonth = current.AddMonths(-1);

            // get base url with required paramaters (protocolid, patientid, etc....)
            string baseURL = GetQueryString("ProtocolPatientCalendar.aspx") + "&" + QUERY_DATE_KEY + "=";

            // set year navigation
            NextYearBtn.NavigateUrl = baseURL + nextYear.ToShortDateString();
            PreviousYearBtn.NavigateUrl = baseURL + prevYear.ToShortDateString();

            // set month navigation
            NextMonth.NavigateUrl = baseURL + nextMonth.ToShortDateString();
            PreviousMonth.NavigateUrl = baseURL + prevMonth.ToShortDateString();
        }

        /// <summary>
        /// Sets the month drop down value
        /// </summary>
        /// <param name="month"></param>
        protected void SetMonth(int month)
        {
            ddlMonth.Value = month.ToString();
        }

        /// <summary>
        /// Sets the year drop down value
        /// </summary>
        /// <param name="year"></param>
        protected void SetYear(int year)
        {
            ddlYear.Value = year.ToString();
        }

        /// <summary>
        /// Builds a list of available months for the current calendar
        /// </summary>
        protected void PopulateMonth()
        {
            ddlMonth.Items.Clear();
            int CurrentMonthIndex = -1;
            for (int i = 1; i <= 12; i++)
            {
                // mark current month
                if (i == ProtocolCalendar.VisibleDate.Month)
                    CurrentMonthIndex = i;
                string monthName = CultureInfo.CurrentCulture.DateTimeFormat.GetMonthName(i);
                ListItem li = new ListItem(monthName, i.ToString());
                ddlMonth.Items.Add(li);
            }
            //SetMonth(CurrentMonthIndex - 1);

        }

        /// <summary>
        /// Builds a list of available years for the current calendar
        /// </summary>
        protected void PopulateYear()
        {
            ddlYear.Items.Clear();

            int anchorYear = DateTime.Today.Year;
            int firstYear = anchorYear - PREV_YEARS;
            int lastYear = anchorYear + FOLLOWING_YEARS;

            for (int i = firstYear; i <= lastYear; i++)
            {
                ddlYear.Items.Add(i.ToString());
            }
        }

        /// <summary>
        /// Sets the visible calendar date as well as adjust month and year selectors
        /// </summary>
        /// <param name="setDate"></param>
        private void SetCalendarDate(DateTime setDate)
        {
            // set calendar date
            ProtocolCalendar.VisibleDate = setDate;
            // set month drop down
            SetMonth(setDate.Month);
            // set year drop down
            SetYear(setDate.Year);
        }

        /// <summary>
        /// Returns the inital visible calendar date, defaulting to Today.
        /// If a visit date is passed via query string, always default to that day.
        /// If no visits occur in default visible range, return date to last visit.
        /// </summary>
        /// <returns>A Date representing the default visible calendar date.</returns>
        private DateTime GetDefaultDate()
        {
            // determine default date if passed by query string
            DateTime defaultDate = DateTime.Today;
            DateTime? queryDate = GetRequestDate();
            // get date from query string
            if (queryDate.HasValue)
            {
                defaultDate = queryDate.Value;
            }
            // if no date explicitly passed via query string, determine most recent past date
            else
            {
                // get first visible calendar date
                DateTime firstCalendarDate = new DateTime(defaultDate.Year, defaultDate.Month, 1);
                firstCalendarDate = firstCalendarDate.DayOfWeek == DayOfWeek.Sunday ? firstCalendarDate.AddDays(-7) : firstCalendarDate.AddDays((int)firstCalendarDate.DayOfWeek * -1);
                // get last visible calendar date
                DateTime lastCalendarDate = firstCalendarDate.AddDays(42);

                // determine if there are visits in the current range
                var visitsInRange = from visit in visits
                                    let visitDate = visit.Key
                                    where visitDate >= firstCalendarDate && visitDate <= lastCalendarDate
                                    select visit;

                // if there are no visits in range, go back and find last visit
                if (visitsInRange.Count() == 0)
                {
                    var previousVisits = from visit in visits
                                         let visitDate = visit.Key
                                         where visitDate < firstCalendarDate
                                         orderby visitDate descending
                                         select visit;
                    // if there are previous visits, get last visit
                    if (previousVisits.Count() > 0)
                    {
                        defaultDate = previousVisits.First().Key;
                    }
                }
            }
            return defaultDate;
        }



        #region Utilties

        /// <summary>
        /// Gets the current PatientId for patient specific calendar. NULL for Full Protocol Calendar.
        /// </summary>
        /// <returns>If patient specific, return patient id, else NULL.</returns>
        private int? GetPatientId()
        {
            // if working in contex of a patient, patint id should be valid encrypted string
            if (!string.IsNullOrEmpty(BaseDecryptedPatientId))
            {
                int parsedInt = 0;
                // return parsed patient id
                if (int.TryParse(BaseDecryptedPatientId, out parsedInt))
                {
                    return parsedInt;
                }
            }
            // otherwise null
            return null;
        }

        /// <summary>
        /// Returns the calendar date passed in the Query String
        /// </summary>
        /// <returns></returns>
        private DateTime? GetRequestDate()
        {
            string queryDate = Request.QueryString[QUERY_DATE_KEY];
            string queryYear = Request.QueryString["year"];
            string queryMonth = Request.QueryString["month"];
            // full date passed in query string
            if (!string.IsNullOrEmpty(queryDate))
            {
                DateTime calDate = DateTime.Today;
                // return parsed date
                if (DateTime.TryParse(queryDate, out calDate))
                {
                    return calDate;
                }
            }
            // individual components passed in query string
            else if (!string.IsNullOrEmpty(queryYear) && !string.IsNullOrEmpty(queryMonth))
            {
                return new DateTime(int.Parse(queryYear), int.Parse(queryMonth), 1, 0, 0, 0);
            }
            // othwerwise return null for unparseable date
            return null;
        }

        /// <summary>
        /// Returns a normalized date object (zeroed time component) used as a key for lookups.
        /// </summary>
        /// <param name="source"></param>
        /// <returns></returns>
        private DateTime GetDateKey(DateTime source)
        {
            DateTime key = new DateTime(source.Year, source.Month, source.Day, 0, 0, 0);
            return key;
        }

        #endregion

        #region Calendar Event Handlers

        /// <summary>
        /// 
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void ProtocolCalendar_DayRender(object sender, DayRenderEventArgs e)
        {
            // the key used to lookup visit
            DateTime key = GetDateKey(e.Day.Date);

            // need to clear controls first
            e.Cell.Controls.RemoveAt(0);

            // replace the link that ASP.NET automatically creates
            //           HtmlAnchor a = new HtmlAnchor();
            //           a.HRef = "javascript: parent.forwardChildRequest('DaySchemaVisits.aspx?paid=" + ProtocolId.Value + "&date=" + Server.HtmlEncode(shortDate) + "');";
            //           a.InnerText = e.Day.DayNumberText;
            //           a.Attributes["class"] = "dayText";
            //           e.Cell.Controls.Add(a);

            Label a = new Label();
            a.Text = e.Day.DayNumberText;
            a.Attributes["class"] = "dayText";
            e.Cell.Controls.Add(a);

            // tag the cell
            e.Cell.ID = "_day_" + e.Day.Date.Month + "_" + e.Day.Date.Day;

            // lookup the date in foo_table, and fill e.Cell with the retrieved info
            if (visits.ContainsKey(key))
            {
                int? ptId = GetPatientId();
                bool patientSpecific = ptId.HasValue;
                visits[key].Render(e.Cell, patientSpecific);
            }
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void ProtocolCalendar_VisibleMonthChanged(object sender, MonthChangedEventArgs e)
        {
            SetMonth(e.NewDate.Month - 1);
            SetYear(e.NewDate.Year);
        }

        #endregion

        #region Populate vists and datasouce

        /// <summary>
        /// Builds a lookup of vistis by date
        /// </summary>
        /// <param name="protocolId"></param>
        /// <param name="ptId"></param>
        private void PopulateVisits(int protocolId, int? ptId)
        {
            // re-initilize lookup
            visits.Clear();

            bool patientSpecific = ptId.HasValue;

            // get scheduling
            DataTable patientTimelineItems = GetFullTimeline(protocolId, ptId);

            // ADD NORMAL VISITS
            foreach (DataRow row in patientTimelineItems.Rows)
            {
                //int numUnits = 0;
                //string _numUnitsStr = row[Timeline.NumberOfUnits].ToString();
                //if (!string.IsNullOrEmpty(_numUnitsStr))
                //{
                //    numUnits = Int32.Parse(_numUnitsStr);
                //}
                // TODO: take account of patient shifting (trust ...PatientItems.*AnticipatedDate first)
                // replace this w/ the same function on the ACTUAL anticipated date
                //DateTime anticipatedDate = BufferUtil.GetAnticipatedDate((DateTime) row["StartDate"], row["DisplayUnitName"].ToString(), numUnits);
                // TODO: this should be the last anticipated date w/o the plus buffer

                //int buffplus = 0;
                //string _bufnumunits = row[Timeline.BufferNumberOfUnitsPlus].ToString();
                //if (_bufnumunits != null && !"".Equals(_bufnumunits))
                //{
                //    buffplus = Int32.Parse(_bufnumunits);
                //}

                // TODO: the above does not take into account the type of buffer unit (days, weeks, months)

                int bufferPlus = 0;
                int bufferMultiplier = 1; // default to days

                string bufferUnits = row[Timeline.BufferUnitName].ToString();

                if (bufferUnits.ToLower().StartsWith("week"))
                    bufferMultiplier = 7;
                else if (bufferUnits.ToLower().StartsWith("month"))
                    bufferMultiplier = 28; // see fnProtocolMgrAnticipatedDate

                DateTime anticipatedDate = ((DateTime)row[PatientItem.LastAnticipatedDate]).AddDays(0 - (bufferPlus * bufferMultiplier));
                DateTime _date = (DateTime)(row[PatientItem.ScheduledDate] == DBNull.Value ? anticipatedDate : row[PatientItem.ScheduledDate]);
                // the key used to lookup visit
                DateTime key = GetDateKey(_date);
                if (!visits.ContainsKey(_date))
                {
                    VisitContainer visit = new VisitContainer(_date);
                    // add item to visit
                    visit.AddToVisit(row, patientSpecific, base.ShowPatientIdentifiers());
                    // add new entry to visit lookup
                    visits.Add(_date, visit);
                }
                else
                {
                    // add item to visit
                    visits[_date].AddToVisit(row, patientSpecific, base.ShowPatientIdentifiers());
                }
            }

            // ADD PATIENT DEVIATION VISITS
            if (!string.IsNullOrEmpty(PatientSchemaId))
            {
                DataTable patientDeviationItems = Caisis.DataAccess.ProtocolMgmtDa.GetPatientDeviations(protocolId, int.Parse(BaseSchemaId), ptId.Value, int.Parse(PatientSchemaId));
                foreach (DataRow row in patientDeviationItems.Rows)
                {
                    if (row[PatientItem.ScheduledDate] != null && !string.IsNullOrEmpty(row[PatientItem.ScheduledDate].ToString()))
                    {
                        DateTime _date = (DateTime)row[PatientItem.ScheduledDate];
                        // the key used to lookup visit
                        DateTime key = GetDateKey(_date);
                        if (!visits.ContainsKey(key))
                        {
                            VisitContainer visit = new VisitContainer(_date);
                            visit.AddToVisit(row, patientSpecific, base.ShowPatientIdentifiers());
                            visits.Add(key, visit);
                        }
                        else
                        {
                            visits[key].AddToVisit(row, patientSpecific, base.ShowPatientIdentifiers());
                        }
                    }
                }
            }
        }

        /// <summary>
        /// Returns the full timeline of patients on a trail.
        /// Restrict to single patient with non-null patientId
        /// </summary>
        /// <param name="protocolId"></param>
        /// <param name="patientId"></param>
        /// <returns></returns>
        private DataTable GetFullTimeline(int protocolId, int? patientId)
        {
            bool patientSpecific = patientId.HasValue;
            string dataset = CacheManager.GetDatasetSQL(Session[SessionKey.DatasetId]);
            string visitDatasetSQL = base.GetPatientVisitsDataset();

            // get calendar for specific patient
            if (patientSpecific)
            {
                //return ProtocolMgmtDa.GetPatientTimeline(protocolId, patientId.Value, dataset, visitDatasetSQL, null);

                return ProtocolMgmtDa.GetFullPatientTimeline(protocolId, patientId.Value, dataset);
            }
            // get calendar for all patients
            else
            {

                IEnumerable<int> selectedSchemas = GetSelectedSchemas();
                /*
                return ProtocolMgmtDa.GetTimeline(protocolId, selectedSchemas, dataset, visitDatasetSQL, IncludeDeceasedPatients);
                */
                // get calendar


                // get optional schema filters
                // convert csv list to strongly typed int list
                //IEnumerable<int> restrictBySchemas = from arm in queryArms.Split(",".ToCharArray(), StringSplitOptions.RemoveEmptyEntries)
                //                                     select int.Parse(arm);
                // determine if filtering by arms
                if (selectedSchemas.Count() > 0)
                {
                    return ProtocolMgmtDa.GetFullTimeline(protocolId, selectedSchemas, dataset, IncludeDeceasedPatients);
                }
                // or across all arms
                else
                {
                    return ProtocolMgmtDa.GetFullTimeline(protocolId, dataset, IncludeDeceasedPatients);
                }


            }
        }

        private IEnumerable<int> GetSelectedSchemas()
        {
            IEnumerable<string> selected = (Request.QueryString["TreatmentArms"] + "").Split(",".ToCharArray(), StringSplitOptions.RemoveEmptyEntries);
            return selected.Select(s => int.Parse(s));
        }

        #endregion
    }
}
