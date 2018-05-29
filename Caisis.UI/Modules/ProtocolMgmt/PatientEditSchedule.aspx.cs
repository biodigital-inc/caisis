using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Collections.Specialized;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

using Caisis.BOL;
using Caisis.DataAccess;
using Caisis.Controller;
using Caisis.UI.Core.Classes.CustomControls;
using Caisis.UI.Core.Classes;
using Caisis.Security;

namespace Caisis.UI.Modules.ProtocolMgmt
{
    public partial class PatientEditSchedule : ProtocolMgmtBasePage
    {
        PatientDataEntryController pdec = new PatientDataEntryController(PatientDataEntryController.DEFAULT_METADATA_KEY);

        protected override void OnInit(EventArgs e)
        {
            base.OnInit(e);
            PatientList.ValueChanged += ClearRptrOnChange;
            PatientVisits.ValueChanged += ClearRptrOnChange;
        }

        protected override void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BuildPatientList();
            }
        }

        protected void BuildPatientVisits(object sender, EventArgs e)
        {
            if (PatientList.SelectedItem != null && !string.IsNullOrEmpty(PatientList.SelectedItem.Value))
            {
                string dataset = CacheManager.GetDatasetSQL(Session[SessionKey.DatasetId]);
                int protocolId = int.Parse(BaseProtocolId);
                int ptProtocolId = int.Parse(PatientList.SelectedValue);
                PatientProtocol ptProtocol = new PatientProtocol();
                ptProtocol.Get(ptProtocolId);
                int patientId = (int)ptProtocol[PatientProtocol.PatientId];
                BuildPatientSchedule(patientId);
            }
        }

        protected void BuildVisitsOnChange(object sender, EventArgs e)
        {
            string selectedTimelineId = PatientVisits.Value;
            if (!string.IsNullOrEmpty(selectedTimelineId))
            {
                int timelineId = int.Parse(selectedTimelineId);
                BuildVisitItems(timelineId);
            }
        }

        protected void ClearRptrOnChange(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(PatientList.Value) || string.IsNullOrEmpty(PatientVisits.Value))
            {
                PatientVisitItems.DataSource = null;
                PatientVisitItems.DataBind();
            }
        }

        protected void DeleteSelected(object sender, EventArgs e)
        {
            foreach (RepeaterItem item in PatientVisitItems.Items)
            {
                HiddenField idField = item.FindControl("PatientItemId") as HiddenField;
                CheckBox cbField = item.FindControl("DeletePatientItemIdField") as CheckBox;
                // remove item
                if (!string.IsNullOrEmpty(idField.Value) && cbField.Checked)
                {
                    int patientItemId = int.Parse(idField.Value);
                    ProtocolMgmtDa.DeletePatientItem(patientItemId);
                }
            }
            // refresh
            BuildVisitsOnChange(sender, e);
        }

        private void BuildPatientSchedule(int patientId)
        {
            string datasetSQL = CacheManager.GetDatasetSQL(Session[SessionKey.DatasetId]);
            string visitDatasetSQL = base.GetPatientVisitsDataset();
            int protocolId = int.Parse(BaseProtocolId);
            DataTable patientTimeline = ProtocolMgmtDa.GetPatientTimelineVisits(protocolId, patientId, datasetSQL, visitDatasetSQL, true, true);

            PatientVisits.DataSource = patientTimeline;
            PatientVisits.DataBind();
        }

        private void BuildPatientList()
        {
            string dataset = CacheManager.GetDatasetSQL(Session[SessionKey.DatasetId]);
            int protocolId = int.Parse(BaseProtocolId);
            bool showIdentifiers = base.ShowPatientIdentifiers();

            // get list
            bool canViewIdentifiers = base.ShowPatientIdentifiers();
            DataTable patientsList = ProtocolMgmtDa.GetPatientsByProtocol(protocolId, dataset, showIdentifiers, true);
            DataView sortedPatients = PatientProtocolController.SortPatientsByStudyId(patientsList, "ASC");
            var patients = from patient in sortedPatients.ToTable().AsEnumerable()
                           let name = patient["Name"].ToString()
                           select new
                           {
                               PatientDisplayName = patient[PatientProtocol.PtProtocolStudyId].ToString() + (canViewIdentifiers && !string.IsNullOrEmpty(name) ? " : " + name : ""),
                               PatientProtocolId = patient[PatientProtocol.PatientProtocolId].ToString()
                           };
            PatientList.DataSource = patients;
            PatientList.DataBind();
        }


        private void BuildVisitItems(int timelineId)
        {
            string datasetSQL = CacheManager.GetDatasetSQL(Session[SessionKey.DatasetId]);
            int protocolId = int.Parse(BaseProtocolId);

            int ptProtocolId = int.Parse(PatientList.SelectedValue);
            PatientProtocol ptProtocol = new PatientProtocol();
            ptProtocol.Get(ptProtocolId);
            int patientId = (int)ptProtocol[PatientProtocol.PatientId];

            // build a list of visit items, but restrict to direct Patient child tables
            var patientTables = BOL.BusinessObject.GetChildTableNames("Patients");
            DataTable visitItems = ProtocolMgmtDa.GetPatientFullTimeline(protocolId, patientId, datasetSQL, timelineId);
            var patientChildRecords = visitItems.AsEnumerable().Where(r => patientTables.Contains(r["DestTable"].ToString()));
            DataView visitDataSource = (patientChildRecords.Count() > 0 ? patientChildRecords.CopyToDataTable() : new DataTable()).DefaultView;
            PatientVisitItems.DataSource = visitDataSource;
            PatientVisitItems.DataBind();
        }



        private int? GetKey(IOrderedDictionary keys, string keyName)
        {
            string key = keys[keyName] + "";
            if (!string.IsNullOrEmpty(key))
                return int.Parse(key);
            else
                return null;
        }
    }
}