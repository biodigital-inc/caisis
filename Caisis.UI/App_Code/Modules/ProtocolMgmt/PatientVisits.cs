using System;
using System.Data;
using System.Configuration;
using System.Collections.Generic;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Collections;
using Caisis.Security;
using System.Text;

namespace Caisis.UI.Modules.ProtocolMgmt
{
    public abstract class PatientVisits
    {
        private List<_PatientCalendarItem> Schedule;
        private DateTime _date;

        protected _PatientCalendarItem currentPatient;

        public PatientVisits(DateTime date)
        {
            _date = date;
            Schedule = new List<_PatientCalendarItem>();
            currentPatient = null;
        }

        public void Add(DataRow row, bool bPatientCalendar, bool bShowPatientIdentifiers)
        {
            string name;
            if (!bPatientCalendar)
            {
                name = GetPatientName(row, bShowPatientIdentifiers);
            }
            else
            {
                name = row["ItemDescription"].ToString();
            }

            if (currentPatient == null || !currentPatient.Name.Equals(name))
            {
                AddData(row, bPatientCalendar, bShowPatientIdentifiers);
            }
            else // append to item descriptions
            {
                currentPatient.AddItemDescription(row["ItemDescription"].ToString());
            }
        }

        public virtual void PopulateTableCell(TableCell cell, bool bPatientSpecific)
        {
            foreach (_PatientCalendarItem p in Schedule)
            {
                HyperLink label = new HyperLink();
                if (bPatientSpecific)
                {
                    // determine if passing along deviation infor
                    if (!string.IsNullOrEmpty(p.DeviationTable) && !string.IsNullOrEmpty(p.DeviationKey))
                    {
                        label.Attributes["onclick"] = "var rVal = loadPatientItem('" + CustomCryptoHelper.Encrypt(p.PatientItemId) + "','" + p.DeviationTable + "','" + p.DeviationKey + "'); if(rVal!=null) { return rVal; } else { return false; }";
                    }
                    else
                    {
                        label.Attributes["onclick"] = "var rVal = loadPatientItem('" + CustomCryptoHelper.Encrypt(p.PatientItemId) + "'); if(rVal!=null) { return rVal; } else { return false; }";
                    }
                }
                else
                {
                    label.Attributes["onclick"] = "var rVal = parent.loadPatientVisit('" + p.ProtocolId + "', '" + p.SchemaId + "','" + CustomCryptoHelper.Encrypt(p.PatientId) + "','" + p.TimelineId + "'); if(rVal!=null) { return rVal; } else { return false; }";
                }
                label.NavigateUrl = "#";
                label.Text = p.Name;
                label.ToolTip = string.Format("{0}{1}", GetVisitTitle(p), p.ItemDescriptions);

                label.CssClass = this.CssClass;
                GetJS(label, p, bPatientSpecific);
                cell.Controls.Add(label);
            }
        }

        protected abstract String GetVisitTitle(_PatientCalendarItem currP);

        /// <summary>
        /// Gets the css class attribute for Visit
        /// </summary>
        protected abstract string CssClass
        {
            get;
        }

        protected virtual void GetJS(HyperLink l, _PatientCalendarItem currP, bool bPatientSpecific)
        {
            l.Attributes.Add("onmouseover", getAddtlMouseEvent(currP.PatientId, bPatientSpecific));
            l.Attributes.Add("onmouseout", getAddtlMouseEvent(currP.PatientId, bPatientSpecific));
        }

        protected string getAddtlMouseEvent(string tempPtId, bool bPatientSpecific)
        {
            String strAddnlMouseEvent = String.Empty;
            if (!bPatientSpecific)
            {
                // client function removed
                //strAddnlMouseEvent = "storePatientId('" + CustomCryptoHelper.Encrypt(tempPtId) + "');";
            }

            return strAddnlMouseEvent;
        }

        protected void AddData(DataRow row, bool bPatientCalendar, bool bShowPatientIdentifiers)
        {
            string name;
            if (!bPatientCalendar)
            {
                name = GetPatientName(row, bShowPatientIdentifiers);
            }
            else
                name = row["ItemDescription"].ToString();
            _PatientCalendarItem p;
            if (bPatientCalendar)
            {
                // determine if using deviations (use overloaded constructor) or standard patient items
                if (row.Table.Columns.Contains("DeviationTable") && row.Table.Columns.Contains("DeviationKey"))
                {
                    p = new _PatientCalendarItem(name, row["PatientId"].ToString(), row["ProtocolId"].ToString(), row["ProtocolSchemaId"].ToString(), row["TimelineId"].ToString(), row["PatientItemId"].ToString(), "", "", row["DeviationTable"].ToString(), row["DeviationKey"].ToString());
                }
                else
                {
                    p = new _PatientCalendarItem(name, row["PatientId"].ToString(), row["ProtocolId"].ToString(), row["ProtocolSchemaId"].ToString(), row["TimelineId"].ToString(), row["PatientItemId"].ToString(), "", "");
                }
            }
            else
            {
                p = new _PatientCalendarItem(name, row["PatientId"].ToString(), row["ProtocolId"].ToString(), row["ProtocolSchemaId"].ToString(), row["TimelineId"].ToString(), "", row["PatientSchemaId"].ToString(), row["SchemaItemId"].ToString());
            }
            PopulateDetails(p, row);
            Schedule.Add(p);
            currentPatient = p;
        }

        protected virtual void PopulateDetails(_PatientCalendarItem p, DataRow row)
        {
            p.AddItemDescription(row["ItemDescription"].ToString());
        }

        /// <summary>
        /// Returns the display name for the current row patient (with deidentified logic)
        /// </summary>
        /// <param name="row"></param>
        /// <param name="bShowPatientIdentifiers"></param>
        /// <returns></returns>
        protected string GetPatientName(DataRow row, bool bShowPatientIdentifiers)
        {
            if (bShowPatientIdentifiers)
            {
                // format display name
                string firstName = row["PtFirstName"].ToString();
                string lastName = row["PtLastName"].ToString();
                return string.Format("{0}, {1}", lastName, firstName);
            }
            else
            {
                // format study id
                string protocolStudyId = row["PtProtocolStudyId"].ToString();
                return string.Format("Study ID: {0}", protocolStudyId);
            }
        }

    }

    public class ScheduledVisits : PatientVisits
    {
        public ScheduledVisits(DateTime date)
            : base(date)
        {
        }

        protected override string CssClass
        {
            get
            {
                return "scheduledItem";
            }
        }

        protected override String GetVisitTitle(_PatientCalendarItem currP)
        {
            return "Scheduled Items: \n ";
        }
    }

    [Obsolete()]
    public class CompletedVisits : PatientVisits
    {
        public CompletedVisits(DateTime date)
            : base(date)
        {
        }

        protected override string CssClass
        {
            get
            {
                return "completedItem";
            }
        }

        protected override String GetVisitTitle(_PatientCalendarItem currP)
        {
            return "Completed Items: \n ";
        }
    }

    public class PerformedVisits : PatientVisits
    {
        public PerformedVisits(DateTime date)
            : base(date)
        {
        }

        protected override string CssClass
        {
            get
            {
                return "performedItem";
            }
        }

        protected override String GetVisitTitle(_PatientCalendarItem currP)
        {
            return "Performed Items: \n ";
        }
    }

    public class DataEnteredVisits : PatientVisits
    {
        public DataEnteredVisits(DateTime date)
            : base(date)
        {
        }

        protected override string CssClass
        {
            get
            {
                return "dataEnteredItem";
            }
        }

        protected override String GetVisitTitle(_PatientCalendarItem currP)
        {
            return "Data Entered Items: \n ";
        }
    }

    public class NotApplicableVisists : PatientVisits
    {
        public NotApplicableVisists(DateTime date)
            : base(date)
        {
        }

        protected override string CssClass
        {
            get
            {
                return "notApplicableItem";
            }
        }

        protected override String GetVisitTitle(_PatientCalendarItem currP)
        {
            return "Not Applicable Items: \n ";
        }
    }

    public class RefusedVisists : PatientVisits
    {
        public RefusedVisists(DateTime date)
            : base(date)
        {
        }

        protected override string CssClass
        {
            get
            {
                return "refusedItem";
            }
        }

        protected override String GetVisitTitle(_PatientCalendarItem currP)
        {
            return "Refused Items: \n ";
        }
    }

    public class UnplannedVisits : PatientVisits
    {
        public UnplannedVisits(DateTime date)
            : base(date)
        {
        }

        protected override string CssClass
        {
            get
            {
                return "unplannedItem";
            }
        }

        protected override String GetVisitTitle(_PatientCalendarItem currP)
        {
            return "Unplanned Item: \n ";
        }
    }

    public class AnticipatedVisits : PatientVisits
    {
        public AnticipatedVisits(DateTime date)
            : base(date)
        {
        }

        protected override string CssClass
        {
            get
            {
                return "anticipatedItem";
            }
        }

        protected override String GetVisitTitle(_PatientCalendarItem currP)
        {
            return "Anticipated for " + currP.DateRange + " \n ";
        }

        protected override void GetJS(HyperLink a, _PatientCalendarItem currP, bool bPatientSpecific)
        {
            string jsarray = GetJsArray(currP.firstDate, currP.lastDate);
            a.Attributes.Add("onmouseover", "modDates(" + jsarray + ", highlightCell);" + getAddtlMouseEvent(currP.PatientId, bPatientSpecific));
            a.Attributes.Add("onmouseout", "modDates(" + jsarray + ", resetCell);" + getAddtlMouseEvent(currP.PatientId, bPatientSpecific));
        }

        private string GetJsArray(string firstDate, string lastDate)
        {
            StringBuilder buffer = new StringBuilder("['");
            buffer.Append(String.Join("','", (string[])DateRangeEnumerator.EnumerateVisits(firstDate, lastDate).ToArray(typeof(string))));
            buffer.Append("']");
            return buffer.ToString();
        }

        protected override void PopulateDetails(_PatientCalendarItem p, DataRow row)
        {
            p.AddDates(((DateTime)row["FirstAnticipatedDate"]).ToShortDateString(), ((DateTime)row["LastAnticipatedDate"]).ToShortDateString());
            p.AddItemDescription(row["ItemDescription"].ToString());
        }
    }

    public class DependentVisits : PatientVisits
    {
        public DependentVisits(DateTime date)
            : base(date)
        {
        }

        protected override string CssClass
        {
            get
            {
                return "dependentItem";
            }
        }

        protected override String GetVisitTitle(_PatientCalendarItem currP)
        {
            return "Dependent Item: \n ";
        }
    }
}
