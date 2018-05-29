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
using Caisis.Extensions;
using Caisis.Controller;
using Caisis.DataAccess;
using Caisis.Security;
using Caisis.UI.Core.Classes;
using Caisis.UI.ClientScript.Ajax;
using Caisis.UI.Core.Classes.CustomControls;

namespace Caisis.UI.Modules.ProtocolMgmt
{
    public partial class PatientBulkScreening : ProtocolMgmtBasePage
    {
        int protocolId;
        PatientController pc = new PatientController();

        public bool ReadOnly
        {
            get
            {
                return Request.QueryString["readonly"] == "true";
            }
        }

        protected override void Page_Load(object sender, EventArgs e)
        {
            protocolId = int.Parse(BaseProtocolId);
            if (!Page.IsPostBack)
            {
                BuildBulkEdit();
            }
        }

        private void BuildBulkEdit()
        {
            string datasetSQL = CacheManager.GetDatasetSQL(Session[SessionKey.DatasetId]);
            DataView ppSummary = ProtocolMgmtDa.GetProtocolPatientSummary(protocolId, datasetSQL).DefaultView;
            if (ReadOnly)
            {
                PatientPortalHeaderBar.Visible = false;
                BulkPatientReadOnly.Visible = true;
                InstitutionHeader.Visible = true;
                StudyIdHeader.Visible = true;
                BulkPatientEdit.Visible = false;
                AddBtn.Visible = false;
                UpdateBtn.Visible = false;
                BulkPatientEdit.BlankRows = 0;
                BulkPatientEdit.VisibleBlankRows = 0;
                BulkPatientReadOnly.DataSource = ppSummary;
                BulkPatientReadOnly.DataBind();
            }
            else
            {
                PatientPortalHeaderBar.Visible = true;
                BulkPatientReadOnly.Visible = false;
                InstitutionHeader.Visible = false;
                StudyIdHeader.Visible = false;
                BulkPatientEdit.Visible = true;
                AddBtn.Visible = true;
                UpdateBtn.Visible = true;
                BulkPatientEdit.BlankRows = 10;
                BulkPatientEdit.VisibleBlankRows = 5;
                BulkPatientEdit.DataSource = ppSummary;
                BulkPatientEdit.DataBind();
            }
        }

        protected void UpdateBtn_Click(object sender, EventArgs e)
        {
            foreach (int rowIndex in BulkPatientEdit.DirtyRows)
            {
                GridViewRow row = BulkPatientEdit.Rows[rowIndex];
                var values = CICHelper.GetCaisisInputControlDictionary(row).ToDictionary(a => a.Key, a => a.Value.Value);
                string patientIdValue = BulkPatientEdit.DataKeys[rowIndex][Patient.PatientId] + "";
                int? patientId = null;
                // update new Patient 
                Patient patient = UpdateRecord<Patient>(patientIdValue, new Dictionary<string, object> { 
                    { Patient.PtRace, values[Patient.PtRace] }
                });
                if (patient.PrimaryKeyHasValue)
                    patientId = (int)patient[Patient.PatientId];

                if (patientId.HasValue)
                {
                    // update Registration ID identifier
                    string identifierId = BulkPatientEdit.DataKeys[rowIndex][Identifier.IdentifierId] + "";
                    string registrationID = values[Identifier.Identifier_Field];
                    if (!string.IsNullOrEmpty(registrationID))
                    {
                        Identifier localIdentifier = UpdateRecord<Identifier>(identifierId, new Dictionary<string, object> { 
                            { Identifier.PatientId, patientId},
                            { Identifier.IdType, "Registration ID" },
                            { Identifier.Identifier_Field, registrationID },
                        });
                    }
                    // update PatientProtocol
                    string ptProtocolId = BulkPatientEdit.DataKeys[rowIndex][PatientProtocol.PatientProtocolId] + "";
                    PatientProtocol ptProtocol = UpdateRecord<PatientProtocol>(ptProtocolId, new Dictionary<string, object> { 
                        {  PatientProtocol.PatientId, patientId},
                        {  PatientProtocol.ProtocolId, protocolId}
                    });
                    string statusId = BulkPatientEdit.DataKeys[rowIndex][PatientProtocolStatus.PatientProtocolStatusId] + "";
                    // update Registration Status
                    if (ptProtocol.PrimaryKeyHasValue)
                    {
                        PatientProtocolStatus status = UpdateRecord<PatientProtocolStatus>(statusId, new Dictionary<string, object> { 
                        { PatientProtocolStatus.PatientProtocolId, (int)ptProtocol[PatientProtocol.PatientProtocolId] },
                        {  PatientProtocolStatus.PtProtocolStatus, "Registered" },
                        {  PatientProtocolStatus.PtProtocolStatusDate, values[PatientProtocolStatus.PtProtocolStatusDate] },
                        {  PatientProtocolStatus.PtProtocolStatusDateText, values[PatientProtocolStatus.PtProtocolStatusDateText] }
                    });
                    }
                }
            }
            // rebuild
            BuildBulkEdit();
            // refresh main list
            Page.ClientScript.RegisterStartupScript(this.GetType(), "reloadParentPage", "if(parent.reloadListAndCalendar) { parent.reloadListAndCalendar(); }", true);
        }

        protected void BulkPatientEdit_RowDeleted(object sender, GridViewDeletedEventArgs e)
        {
            BuildBulkEdit();
        }

        private T UpdateRecord<T>(string priKey, Dictionary<string, object> values) where T : BusinessObject, new()
        {
            // create Biz
            T biz = new T();
            // load existing
            if (!string.IsNullOrEmpty(priKey))
            {
                biz.Get(int.Parse(priKey));
            }
            // else new
            else
            {
                // special case
                if (biz is Patient)
                {
                    Patient patient = biz as Patient;
                    int datasetId = (int)Session[SessionKey.DatasetId];
                    patient[Patient.PtNotes] = "Protocol-Patient";
                    pc.InsertNewPatientRecord(patient, datasetId);
                }
                else
                {
                    values.ForEach(a => { if (biz.ForeignKeyNames.Contains(a.Key)) { biz[a.Key] = a.Value; } });
                }
            }
            // update
            bool dirty = values.Any(a => a.Value != biz[a.Key].ToString());
            if (dirty)
            {
                foreach (var value in values)
                {
                    string field = value.Key;
                    object fieldValue = value.Value;
                    if (biz.HasField(field) && !biz.ForeignKeyNames.Contains(field))
                        biz[value.Key] = fieldValue;
                }
                biz.Save();
            }
            return biz;
        }
    }
}
