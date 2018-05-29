using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using Caisis.Security;


namespace Caisis.UI.Modules.ProtocolMgmt
{
    public class _PatientCalendarItem
	{
		private string name;
		internal string firstDate;
		internal string lastDate;
		private string _dateRange;
		private string _descBr;
		private string _patientid;
        private string _protocolid;
		private string _schemaid;
		private string _timelineid;
        private string _patientitemid;
        private string _patientschemaid;
        private string _schemaitemid;
        private string _deviationTable;
        private string _deviationKey;
		private List<string> itemDescriptions; //strings

        internal _PatientCalendarItem(string patientName, string patientId, string protocolId, string schemaId, string timelineId, string patientitemid, string patientschemaid, string schemaitemid)
		{
			name = patientName;
			_patientid = patientId;
            _protocolid = protocolId;
			_schemaid = schemaId;
			_descBr = null;
			_timelineid = timelineId;
            _patientitemid = patientitemid;
            _patientschemaid = patientschemaid;
            _schemaitemid = schemaitemid;
            itemDescriptions = new List<string>();
		}

        internal _PatientCalendarItem(string patientName, string patientId, string protocolId, string schemaId, string timelineId, string patientitemid, string patientschemaid, string schemaitemid, string deviationTable, string deviationKey)
            : this(patientName, patientId, protocolId, schemaId, timelineId, patientitemid, patientschemaid, schemaitemid)
        {
            _deviationTable = deviationTable;
            _deviationKey = deviationKey;
        }

		internal string DateRange
		{
			get
			{
				if (_dateRange == null)
				{
					StringBuilder b = new StringBuilder(firstDate);
					b.Append(" - ");
					b.Append(lastDate);
					_dateRange = b.ToString();
				}
				return _dateRange;
			}
		}

		internal string Name
		{
			get
			{
				return name;
			}
		}

		internal string PatientId
		{
			get
			{
				return _patientid;
			}
		}

		internal string SchemaId
		{
			get
			{
				return _schemaid;
			}
		}

        internal string ProtocolId
        {
            get
            {
                return _protocolid;
            }
        }

		internal string TimelineId
		{
			get
			{
				return _timelineid;
			}
		}

        internal string PatientItemId
        {
            get
            {
                return _patientitemid;
            }
        }

        internal string PatientSchemaId
        {
            get
            {
                return _patientschemaid;
            }
        }

        internal string SchemaItemId
        {
            get
            {
                return _schemaitemid;
            }
        }

		internal string ItemDescriptions
		{
			get
			{
				if (_descBr == null)
				{
					_descBr = String.Join(",\n ", (string[]) itemDescriptions.ToArray());
				}
				return _descBr;
			}
		}

        internal string DeviationTable
        {
            get
            {
                return _deviationTable;
            }
        }

        internal string DeviationKey
        {
            get
            {
                return _deviationKey;
            }
        }

		internal void AddDates(string firstAnticipatedDate, string lastAnticipatedDate)
		{
			firstDate = firstAnticipatedDate;
			lastDate = lastAnticipatedDate;
		}

		internal void AddItemDescription(string description)
		{
            itemDescriptions.Add(description);            
		}
	}
    
	/// <summary>
	/// This class arranges visits in a more component/object-friendly manner than
	/// would nested loops and StringBuilder.Append() statements, making it easier
	/// for folks to add style and eye candy to the protocol calendar.
	/// </summary>
	public class VisitContainer
	{
        private AnticipatedVisits anticipatedVisits;
        private ScheduledVisits scheduledVisits;
        private PerformedVisits performedVisits;
        private DataEnteredVisits dataEnteredVisits;
        private UnplannedVisits unplannedVisits;
        private NotApplicableVisists notApplicableVisits;
        private RefusedVisists refusedVisits;
        private DependentVisits dependentVisits;

		private DateTime _date;

		public VisitContainer(DateTime date)
		{
            anticipatedVisits = new AnticipatedVisits(date);
            scheduledVisits = new ScheduledVisits(date);
            performedVisits = new PerformedVisits(date);
            dataEnteredVisits = new DataEnteredVisits(date);
            unplannedVisits = new UnplannedVisits(date);
            notApplicableVisits = new NotApplicableVisists(date);
            refusedVisits = new RefusedVisists(date);
            dependentVisits = new DependentVisits(date);
			_date = date;
		}

		/// <summary>
		/// This will not check dates for you!
		/// </summary>
		/// <param name="row"></param>
        public void AddToVisit(DataRow row, bool bPatientCalendar, bool bShowPatientIdentifiers)
		{
			// we can retrieve status now
			// compare scheduled vs. anticipated, append to item descriptions
			// if the "new" patient = current patient
			//string name = row["PtFirstName"] + " " + row["PtLastName"];
			string status = row["Status"].ToString();
			
			// ENCAPSULATE ME WITH A SCHEDULED/ANTICIPATED SWITCH!!!!
			//if (row["ScheduledDate"] != DBNull.Value) // scheduled

            if ("Scheduled".Equals(status))
            {
                scheduledVisits.Add(row, bPatientCalendar, bShowPatientIdentifiers);
            }
            else if ("Anticipated".Equals(status))
            {
                anticipatedVisits.Add(row, bPatientCalendar, bShowPatientIdentifiers);
            }
            else if ("Completed".Equals(status) || "Performed".Equals(status))
            {
                performedVisits.Add(row, bPatientCalendar, bShowPatientIdentifiers);
            }
            else if ("Unplanned".Equals(status))
            {
                unplannedVisits.Add(row, bPatientCalendar, bShowPatientIdentifiers);
            }
            else if ("Not Applicable".Equals(status))
            {
                notApplicableVisits.Add(row, bPatientCalendar, bShowPatientIdentifiers);
            }
            else if ("Refused".Equals(status))
            {
                refusedVisits.Add(row, bPatientCalendar, bShowPatientIdentifiers);
            }
            else if ("Dependent".Equals(status))
            {
                dependentVisits.Add(row, bPatientCalendar, bShowPatientIdentifiers);
            }
            else
            {
                dataEnteredVisits.Add(row, bPatientCalendar, bShowPatientIdentifiers);
            }
		}

		/// <summary>
		/// This is the method you want to change to alter the LAYOUT of the cell and possibly
		/// the styles of controls created in this method (if the stylesheet doesn't account for them).
		/// Cell background, borders, etc. are handled by child elements of the ASP:Calendar tag found
		/// in VisitCalendar.aspx.
		/// 
		/// Scheduled and anticipated visitors should be separated via layout and style cues. Also, mouseovers
		/// on a visitor should display the item description(s) and date range (if visit = anticipated). Links
		/// should take the user to an "appropriate" place.
		/// 
		/// Completed+ visits are now visible.
		/// </summary>
		/// <param name="cell">typically the Cell property of a DayRenderEventArgs object</param>
		public void Render(TableCell cell, bool bPatientSpecific)
		{
			cell.Controls.Add(new LiteralControl("<br/>"));
			// handle scheduled patients
            anticipatedVisits.PopulateTableCell(cell, bPatientSpecific);
            scheduledVisits.PopulateTableCell(cell, bPatientSpecific);
            performedVisits.PopulateTableCell(cell, bPatientSpecific);
            dataEnteredVisits.PopulateTableCell(cell, bPatientSpecific);
            unplannedVisits.PopulateTableCell(cell, bPatientSpecific);
            notApplicableVisits.PopulateTableCell(cell, bPatientSpecific);
            refusedVisits.PopulateTableCell(cell, bPatientSpecific);
            dependentVisits.PopulateTableCell(cell, bPatientSpecific);
		}
	}
}
