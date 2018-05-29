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
    public partial class PatientSummary : ProtocolMgmtPatientBasePage
    {
        /// <summary>
        /// The PtProtocol record for current patient
        /// </summary>
        private PatientProtocol ptProtocol;

        private DataView visitList;
        private DataView VisitList
        {
            get
            {
                if (visitList == null && !string.IsNullOrEmpty(PatientSchemaId))
                {
                    DataTable table = ProtocolMgmtDa.PopulateSummaryRepeater(int.Parse(PatientSchemaId));
                    // Add column to contain displayable
                    // DataColumn visitText = new DataColumn(VISIT_TEXT_COLUMN, typeof(String), "DisplayUnitName + ' ' + NumberOfUnits");
                    //table.Columns.Add(visitText);
                    visitList = table.DefaultView;
                }
                return visitList;
            }
        }

        private string latestPatientStatus;
        protected string LatestPatientStatus
        {
            get
            {
                if (latestPatientStatus == null)
                {
                    latestPatientStatus = new PatientProtocolController(int.Parse(PatientProtocolId)).GetLatestStatus();
                }
                return latestPatientStatus;
            }
        }

        protected override void Page_Load(object sender, EventArgs e)
        {
            // always load patient protocol record
            if (!string.IsNullOrEmpty(PatientProtocolId))
            {
                ptProtocol = new PatientProtocol();
                ptProtocol.Get(int.Parse(PatientProtocolId));
            }

            if (!Page.IsPostBack)
            {
                PopulatePtProtocolNotes();
                BindStatus();
                BindVisits();
            }
        }

        /// <summary>
        /// Populates PtProtocol Notes Field from PtProtocol record
        /// </summary>
        private void PopulatePtProtocolNotes()
        {
            if (ptProtocol != null)
            {
                PtProtocolNotes.Text = ptProtocol[PatientProtocol.PtProtocolNotes].ToString();
            }
        }

        /// <summary>
        /// Updates PtProtocol record with PtProtocol Notes Field
        /// </summary>
        private void UpdatePtProtocolNotes()
        {
            if (ptProtocol != null)
            {
                ptProtocol[PatientProtocol.PtProtocolNotes] = PtProtocolNotes.Text;
                ptProtocol.Save();
            }
        }

        /// <summary>
        /// Build list of statuses
        /// </summary>
        private void BindStatus()
        {
            if (ptProtocol != null)
            {
                int patProtocolId = (int)ptProtocol[PatientProtocol.PatientProtocolId];
                bool? isEligible = PatientProtocolController.IsPatientEligible(patProtocolId);
                string ptEligibilityStatus = PatientProtocolController.PatientEligiblityString(isEligible);
                string[] eligibilityStatuses = new string[] { PatientProtocolController.Eligible, PatientProtocolController.Ineligible };
                // get all statuses for patient
                IEnumerable<PatientProtocolStatus> patientStatuses = BusinessObject.GetByParent<PatientProtocolStatus>(patProtocolId);
                // explicitly sort statuses by date then weight, (get status weight by location in list)
                string[] statusSequence = PatientProtocolController.PatientStatusSequence;
                var sortedPatientStatuses = from biz in patientStatuses
                                            let status = biz[PatientProtocolStatus.PtProtocolStatus].ToString()
                                            let weight = Array.IndexOf(statusSequence, status)
                                            let date = biz.IsNull(PatientProtocolStatus.PtProtocolStatusDate) ? DateTime.MinValue : (DateTime)biz[PatientProtocolStatus.PtProtocolStatusDate]
                                            orderby weight ascending, date ascending
                                            let ptProtocolStatus = string.Format("{0}", biz[PatientProtocolStatus.PtProtocolStatus])
                                            select new
                                            {
                                                PatientProtocolStatusId = string.Format("{0}", biz[PatientProtocolStatus.PatientProtocolStatusId]),
                                                PtProtocolStatusDate = string.Format("{0:d}", biz[PatientProtocolStatus.PtProtocolStatusDate]),
                                                PtProtocolStatus = eligibilityStatuses.Contains(ptProtocolStatus) ? ptProtocolStatus + " (" + ptEligibilityStatus + ")" : ptProtocolStatus,
                                                PtProtocolStatusReason = string.Format("{0}", biz[PatientProtocolStatus.PtProtocolStatusReason])
                                            };

                // build list
                PatientProtocolStatusRptr.DataSource = sortedPatientStatuses;
                PatientProtocolStatusRptr.DataBind();
            }
        }

        /// <summary>
        /// Build a list of vists
        /// </summary>
        private void BindVisits()
        {
            if (!string.IsNullOrEmpty(PatientSchemaId))
            {
                VisitList.RowFilter = "Status = 'Performed' or Status = 'Completed'";
                if (VisitList.Count > 0)
                {
                    if (VisitList[VisitList.Count - 1]["ScheduledDate"] != null && VisitList[VisitList.Count - 1]["ScheduledDate"].ToString().Length > 0)
                    {
                        CompletedItemSubtitle.Text = "Most recent visit was on " + ((DateTime)VisitList[VisitList.Count - 1]["ScheduledDate"]).ToShortDateString() + ".";
                    }
                    else { CompletedItemSubtitle.Text = "Most recent items performed:"; }
                }
                CompletedVisitsRptr.DataSource = VisitList;
                CompletedVisitsRptr.DataBind();

                VisitList.RowFilter = "Status = 'Anticipated'";
                if (VisitList.Table.Rows.Count > 0) AnticipatedItemSubtitle.Text = "The following items need to be scheduled:";
                AnticipatedVisitsRptr.DataSource = VisitList;
                AnticipatedVisitsRptr.DataBind();

                VisitList.RowFilter = "Status = 'Scheduled'";
                if (VisitList.Count > 0)
                {
                    if (VisitList[0]["ScheduledDate"] != null && VisitList[0]["ScheduledDate"].ToString().Length > 0)
                    {
                        ScheduledItemSubtitle.Text = "Next scheduled item is for " + ((DateTime)VisitList[0]["ScheduledDate"]).ToShortDateString() + ".";
                    }
                    else { ScheduledItemSubtitle.Text = "The following items have been marked as \"Scheduled\":"; }
                }

                ScheduledVisitsRptr.DataSource = VisitList;
                ScheduledVisitsRptr.DataBind();

            }
        }

        /// <summary>
        /// Updates the patient Protocol notes
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void UpdatePatientProtocolNotes(object sender, EventArgs e)
        {
            UpdatePtProtocolNotes();
        }
    }
}
