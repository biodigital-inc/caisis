using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Xml;

#region TODO: CLEANUP
using System.IO;
using System.Text;
using System.Globalization;
#endregion

using Caisis.BOL;
using Caisis.DataAccess;
using Caisis.Security;
using Caisis.UI.Core.Classes;
using Caisis.UI.Core.Classes.CustomControls;

namespace Caisis.UI.Modules.ProtocolMgmt
{
    public partial class PatientRegistration : ProtocolMgmtPatientBasePage
    {

        private static readonly string[] STATUS_PREFIXES = new string[] { "", "Id", "Date", "DateText", "Reason" };

        /// <summary>
        /// Dictionary for easily accessing icic status fields
        /// i.e., Dictionary["OnStudy"]["PtProtocolStatusDateText"].Value = "01/01/2010";
        /// i.e., biz["PtProtocolStatusDateText"] = Dictionary["OnStudy"]["PtProtocolStatusDateText"];
        /// </summary>
        private Dictionary<string, Dictionary<string, ICaisisInputControl>> StatusDictionary;

        private PatientProtocolController ppc;

        /// <summary>
        /// Gets an instance of the PatientProtocolController used for looking up PatientProtocolStatuses
        /// </summary>
        private PatientProtocolController StatusController
        {
            get
            {
                if (ppc == null)
                {
                    int patientProtocolId = int.Parse(PatientProtocolId);
                    ppc = new PatientProtocolController(patientProtocolId);
                }
                return ppc;
            }
        }

        /// <summary>
        /// 
        /// </summary>
        protected string QueryStartupPanel
        {
            get
            {
                return Request.QueryString["panel"];
            }
        }

        /// <summary>
        /// The PatientProtocolId used for controlling PtProtocolStatuses
        /// </summary>
        private int PtProtocolId;


        private bool shiftOnStudyDate = false;

        public PatientRegistration()
            : base()
        {
            // init dictionary for quick lookup
            this.Init += new EventHandler(InitalizeStatusDictionary);
        }

        /// <summary>
        /// Track changes to OnStudy date
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void TrackOnStudyDateChange(ICaisisInputControl sender, EventArgs e)
        {
            shiftOnStudyDate = !string.IsNullOrEmpty(OnStudyStatusDate.Value);
        }

        /// <summary>
        /// Selects a random SchemaId from list of Scheams
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void SetRandomTrail(object sender, EventArgs e)
        {
            if (RandomizeCheckBox.Checked && RandomizeCheckBox.Visible)
            {
                int? randomSchemaId = GetRandomSchema();
                ScheamaList.ClearSelection();
                if (randomSchemaId.HasValue)
                {
                    ScheamaList.Value = randomSchemaId.ToString();

                    // disable as no longer random
                    RandomizeCheckBox.Checked = true;
                    ScheamaList.Enabled = false;
                }
                else
                {
                    // re-enable user selection
                    ScheamaList.Enabled = true;
                }
            }
            else
            {
                // re-enable user selection
                ScheamaList.Enabled = true;
            }

            // re-focus on registation panel
            if (sender == RandomizeCheckBox)
                RegisterStartupPanel("Registered");
        }

        /// <summary>
        /// Builds a lookup dictionary for easily accessing status fields by status name
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void InitalizeStatusDictionary(object sender, EventArgs e)
        {
            StatusDictionary = new Dictionary<string, Dictionary<string, ICaisisInputControl>>();

            foreach (string statusName in PatientProtocolController.PatientStatusSequence)
            {
                Dictionary<string, ICaisisInputControl> fieldToControl = new Dictionary<string, ICaisisInputControl>();
                foreach (string suffix in STATUS_PREFIXES)
                {
                    string controlBaseId = statusName.Replace(" ", "") + "Status";
                    ICaisisInputControl fieldControl = this.FindControl(controlBaseId + suffix) as ICaisisInputControl;
                    if (fieldControl != null)
                    {
                        fieldToControl.Add(fieldControl.Field, fieldControl);
                    }
                }
                StatusDictionary.Add(statusName, fieldToControl);
            }
        }

        protected override void Page_Load(object sender, EventArgs e)
        {
            // set required
            PtProtocolId = int.Parse(PatientProtocolId);

            // set randomization details
            bool isRandomized = SetRandomizationDetails();

            if (!Page.IsPostBack)
            {
                BuildSchemaList();
                if (isRandomized)
                {
                    SetRandomTrail(sender, e);
                }
                PopulateStatusFields();

                // set default startup panel
                string status = (!string.IsNullOrEmpty(QueryStartupPanel) ? QueryStartupPanel : "Screening").Replace(" ", "");
                RegisterStartupPanel(status);




            }
            else
            {
                // during postback go to last panel
                if (!string.IsNullOrEmpty(ActiveStatusField.Value))
                {
                    RegisterStartupPanel(ActiveStatusField.Value);
                }
            }

            // register save btn script
            PageUtil.RegitserControlPostBackScript(UpdatePostBtn, "doSavePage");
            // register randomize post back
            //PageUtil.RegitserControlPostBackScript(RandomizeBtn, "doRandomizeCheck");
        }


        /// <summary>
        /// Populates for based on PatientProtocolRegistration Record (containing consented by and registered by)
        /// and on PatientProtocolStatus records containing Consented and Registered Dates
        /// </summary>
        private void PopulateStatusFields()
        {
            // populate statuses checkboxes and date fields
            PopulateStatuses();
            // after populating, handle special cases where panels need to be disabled, populated, etc...

            // Load Patient Protocol Registration
            //PatientProtocolRegistration registrationBiz = new PatientProtocolRegistration();
            //registrationBiz.GetByParent(PtProtocolId);

            var registrationBizos = BusinessObject.GetByParent<PatientProtocolRegistration>(PtProtocolId);

            // Determine if records exists
            //if (registrationBiz.RecordCount > 0)
            if (registrationBizos.Count() > 0)
            {
                PatientProtocolRegistration registrationBiz = registrationBizos.First();
                PatientProtocolRegistrationIdField.Value = registrationBiz[PatientProtocolRegistration.PatientProtocolRegistrationId].ToString();
                CICHelper.SetFieldValues(this.Controls, registrationBiz);
            }

            // can't be on study until registered
            if (!StatusController.HasStatus(PatientProtocolController.Registered))
            {
                OnStudyStatus.Enabled = false;
                OnStudyStatusDate.Enabled = false;
                OnStudyStatusDate.Enabled = false;
                OnStudyStatusDateText.Enabled = false;
            }

            // DETERMINE SCREENING STATUS
            // if screened, set checkboxes
            DataRow screeningRecord = null;
            if (StatusController.HasStatus(PatientProtocolController.ScreeningPassed))
            {
                screeningRecord = StatusController.GetStatus(PatientProtocolController.ScreeningPassed);
                ScreenedStatus.Checked = true;
                OptionPassed.Checked = true;
            }
            else if (StatusController.HasStatus(PatientProtocolController.ScreeningFailed))
            {
                screeningRecord = StatusController.GetStatus(PatientProtocolController.ScreeningFailed);
                ScreenedStatus.Checked = true;
                OptionFailed.Checked = true;
                if (screeningRecord != null)
                    OptionFailedReason.Text = screeningRecord[PatientProtocolStatus.PtProtocolStatusReason].ToString();
            }
            // After screened, no longer can change if pass/fail, so lock fields
            if (screeningRecord != null)
            {
                ScreenedStatus.Enabled = false;
                //ScreenedStatusDateText.Enabled = false;
                OptionPassed.Enabled = false;
                OptionFailed.Enabled = false;
                ScreeningNotes.Enabled = false;
                OptionFailedReason.Enabled = false;

                ScreeningStatusId.Value = screeningRecord[PatientProtocolStatus.PatientProtocolStatusId].ToString();
                ScreenedStatusDateText.Value = screeningRecord[PatientProtocolStatus.PtProtocolStatusDateText].ToString();
                ScreenedStatusDate.Value = string.Format("{0:d}", screeningRecord[PatientProtocolStatus.PtProtocolStatusDate]);
            }

            // DETERMINE TREATMENT STARTED
            // If PatientSchema found, patient is assigned ??
            if (!string.IsNullOrEmpty(PatientSchemaId))
            {
                PatientSchema ptSchema = new PatientSchema();
                ptSchema.Get(int.Parse(PatientSchemaId));

                string ptSchemaId = ptSchema[PatientSchema.ProtocolSchemaId].ToString();
                // If ptSchema record exists, can't change schema
                if (!string.IsNullOrEmpty(ptSchemaId))
                {
                    ScheamaList.Value = ptSchemaId;
                    //ScheamaList.Enabled = false;
                }
                else
                {
                    //ScheamaList.Enabled = true;
                }
                // if on study, disable schema arm selection by hiding list and selction
                if (ppc.HasStatus(PatientProtocolController.OnStudy))
                {
                    RandomizeCheckBox.Visible = false;
                    //RandomizeBtn.Visible = false;
                    ScheamaList.Enabled = false;
                    SchemaSelectPanel.Visible = false;
                }

                // Set STATUS RECORD
                if (StatusController.HasStatus(PatientProtocolController.Registered))
                {
                    if (StatusController.HasStatus(PatientProtocolController.OnStudy))
                    {
                        DataRow startRecord = StatusController.GetStatus(PatientProtocolController.OnStudy);
                        // set status date
                        OnStudyStatus.Checked = true;
                        OnStudyStatus.Enabled = false;
                        OnStudyStatusDate.Enabled = true;
                        OnStudyStatusDateText.Enabled = true;
                    }
                    else
                    {
                        OnStudyStatus.Checked = false;
                        OnStudyStatus.Enabled = true;
                        OnStudyStatusDate.Enabled = true;
                        OnStudyStatusDateText.Enabled = true;
                    }
                }
                else
                {
                    OnStudyStatus.Checked = false;
                    OnStudyStatus.Enabled = false;
                    OnStudyStatusDate.Enabled = false;
                    OnStudyStatusDateText.Enabled = false;

                }
            }

            // can't be off study unless on at one time
            if (!StatusController.HasStatus(PatientProtocolController.OnStudy))
            {
                OffStudyStatus.Checked = false;
                OffStudyStatus.Enabled = false;
                OffStudyStatusDate.Enabled = false;
                OffStudyStatusDateText.Enabled = false;
            }

            // ELIGIBILITY
            bool? isEligible = PatientProtocolController.IsPatientEligible(PtProtocolId);
            CurrentEligibilityStatus.Text = PatientProtocolController.PatientEligiblityString(isEligible);
        }

        /// <summary>
        /// Populates status checkboxes, date fields based on PatientProtocolStatus records
        /// </summary>
        private void PopulateStatuses()
        {
            foreach (string status in StatusDictionary.Keys)
            {
                if (StatusController.HasStatus(status))
                {
                    // Get status record
                    DataRow statusRecord = StatusController.GetStatus(status);
                    // Get dictionary of status fields to associated control
                    Dictionary<string, ICaisisInputControl> fieldToControls = StatusDictionary[status];
                    // set field values to macth record
                    foreach (string field in fieldToControls.Keys)
                    {
                        ICaisisInputControl iCIC = fieldToControls[field];
                        if (field != PatientProtocolStatus.PtProtocolStatus && iCIC is CheckBox)
                        {
                            (iCIC as CheckBox).Checked = true;
                        }
                        else
                        {
                            // handle special formatting for dates
                            string format = field == PatientProtocolStatus.PtProtocolStatusDateText ? "{0:d}" : "{0}";
                            iCIC.Value = string.Format(format, statusRecord[field]);
                        }

                    }
                }
            }
        }

        /// <summary>
        /// Builds a list of Schemas belonging to Protcol
        /// </summary>
        private void BuildSchemaList()
        {
            DataTable schemaListTable = ProtocolMgmtDa.GetSchemasByProtocol(int.Parse(BaseProtocolId));
            // manually build a list of schema, but disable full selection
            var schemas = from r in schemaListTable.AsEnumerable()
                          let schemaDesc = r[ProtocolSchema.ProtocolArmDescription].ToString()
                          let schemaId = (int)r[ProtocolSchema.ProtocolSchemaId]
                          let isAccrued = (int)r["IsMaxAccrual"] > 0
                          let versionId = (int)r["ProtocolVersionId"]
                          let versionNum = r["VersionNumber"].ToString()
                          orderby versionId ascending, schemaId ascending
                          select new
                          {
                              SchemaId = schemaId,
                              SchemaDescription = schemaDesc,
                              IsMaxAccrued = isAccrued,
                              VersionId = versionId,
                              VersionNum = versionNum
                          };
            // adjust lookup
            ScheamaList.Items.Clear();
            foreach (var schema in schemas)
            {
                var item = new ListItem();
                // disable items which are fully accrued
                item.Enabled = !schema.IsMaxAccrued;
                // set title tooltip
                string fullDescription = schema.SchemaDescription;
                string schemaTitle = PageUtil.GetTrimmedDescription(fullDescription, 80);
                item.Text = string.Format("{0} (v{1})", schemaTitle, schema.VersionNum);
                item.Attributes["title"] = fullDescription;
                // set value
                item.Value = schema.SchemaId.ToString();
                ScheamaList.Items.Add(item);
            }
            ScheamaListReadOnly.DataSource = schemas;
            ScheamaListReadOnly.DataBind();
            //ScheamaList.DataSource = schemaListTable;
            //ScheamaList.DataBind();

            // Do not show randomize if only 1 schema
            if (schemaListTable.Rows.Count == 1)
            {
                RandomizeCheckBox.Visible = false;
                //RandomizeBtn.Visible = false;
                //ScheamaList.Items[0].Attributes["style"] = "display: none;";
                //ScheamaList.Items[1].Selected = true;
            }
        }

        /// <summary>
        /// Gets a lookup of schemas and if they are full
        /// </summary>
        /// <returns></returns>
        private IDictionary<int, bool> GetSchemaAccrualStatus()
        {
            DataTable schemaListTable = ProtocolMgmtDa.GetSchemasByProtocol(int.Parse(BaseProtocolId));

            var schemas = from r in schemaListTable.AsEnumerable()
                          let schemaDesc = r[ProtocolSchema.ProtocolArmDescription].ToString()
                          let schemaId = (int)r[ProtocolSchema.ProtocolSchemaId]
                          let isAccrued = (int)r["IsMaxAccrual"] > 0
                          select new
                          {
                              SchemaId = schemaId,
                              SchemaDescription = schemaDesc,
                              IsMaxAccrued = isAccrued
                          };
            // adjust lookup
            return schemas.ToDictionary(a => a.SchemaId, a => a.IsMaxAccrued);
        }


        /// <summary>
        /// Removes a Patient Protocol Status record when checkbox unchecked
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void DeleteStatusOnUncheck(object sender, EventArgs e)
        {
            CaisisCheckBox cb = sender as CaisisCheckBox;
            // Prikey is suffied with  Status  checkbox id + "Id"
            CaisisHidden statusId = this.FindControl(cb.ID + "Id") as CaisisHidden;
            // If uncheked from original state, remove record
            if (!cb.Checked && statusId != null)
            {
                int statusPriKey = int.Parse(statusId.Value);
                PatientProtocolStatus biz = new PatientProtocolStatus();
                biz.Delete(statusPriKey);
                statusId.Value = string.Empty;
            }
        }

        /// <summary>
        /// Sets the label indicating selected schema
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void SetSelectedSchema(object sender, EventArgs e)
        {
            // set label to match selected schema
            if (ScheamaList.SelectedItem != null)
            {
                SelectedSchema.Text = ScheamaList.SelectedItem.Text;
                // get full description from toolip
                string fullDescription = ScheamaList.SelectedItem.Attributes["title"];
                if (!string.IsNullOrEmpty(fullDescription))
                {
                    SelectedSchema.ToolTip = fullDescription;
                }
            }
            else
            {
                SelectedSchema.Text = string.Empty;
                SelectedSchema.ToolTip = string.Empty;
            }

            SelectedSchema.Visible = !SchemaSelectPanel.Visible;

            // customize randomization
            Protocol biz = new Protocol();
            biz.Get(int.Parse(BaseProtocolId));
            string protocolNum = biz[Protocol.ProtocolNum].ToString();
            bool isCustomRandomization = ProtocolRandomization.IsRandomized(protocolNum);
            if (isCustomRandomization)
                SelectedSchema.Visible = true;
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void SetRandomTrial(object sender, EventArgs e)
        {
            // get PSA double time
            float? psaDT = ProtocolMgmtUtil.GetPatientPSADoublingTime(PtProtocolId);
            // get gleason scroes
            var gleasonPair = ProtocolMgmtUtil.GetGleasonPathologyRecord(PtProtocolId);

            // clear stratum
            RandomizationText.Text = "";
            try
            {
                if (gleasonPair.HasValue)
                {
                    Pathology pathology = gleasonPair.Value.Key;
                    BusinessObject pathType = gleasonPair.Value.Value;
                    string gg1String = "";
                    string gg2String = "";
                    string ggsString = "";

                    if (pathType is ProstatectomyPathology)
                    {
                        ProstatectomyPathology prostatectomy = pathType as ProstatectomyPathology;
                        gg1String = prostatectomy[ProstatectomyPathology.PathGG1].ToString();
                        gg2String = prostatectomy[ProstatectomyPathology.PathGG2].ToString();
                        ggsString = prostatectomy[ProstatectomyPathology.PathGGS].ToString();
                    }
                    else if (pathType is BiopsyProstatePathology)
                    {
                        BiopsyProstatePathology biopsy = pathType as BiopsyProstatePathology;
                        gg1String = biopsy[BiopsyProstatePathology.PathGG1].ToString();
                        gg2String = biopsy[BiopsyProstatePathology.PathGG2].ToString();
                        ggsString = biopsy[BiopsyProstatePathology.PathGGS].ToString();
                    }
                    if (PageUtil.IsInteger(gg1String) && PageUtil.IsInteger(gg2String) && PageUtil.IsInteger(ggsString))
                    {
                        int gg1 = int.Parse(gg1String);
                        int gg2 = int.Parse(gg2String);
                        int ggs = int.Parse(ggsString);

                        int? stratum = ProtocolRandomization.GetStratumNum(psaDT.Value, gg1, gg2, ggs);
                        System.Diagnostics.Debug.WriteLine("Caculated Stratum: " + stratum);

                        RandomizationText.Text = "";
                        // write output
                        if (stratum.HasValue)
                        {
                            ProtocolRandomization random = new ProtocolRandomization(stratum.Value);
                            PatientProtocol ptProtocol = new PatientProtocol();
                            ptProtocol.Get(PtProtocolId);
                            if (!ptProtocol.IsNull(PatientProtocol.PtProtocolStudyId))
                            {
                                string studyId = ptProtocol[PatientProtocol.PtProtocolStudyId].ToString();
                                int? currentStratum = ProtocolRandomization.GetStratumByStudyId(studyId).Key;
                                // is target stratum == current stratum
                                bool doUpdatePatientSchema = !(currentStratum.HasValue && stratum.Value == currentStratum.Value);
                                
                                var record = random.WriteNextStudyId(studyId, currentStratum);
                                if (record != null)
                                {
                                    // get schema
                                    string targetSchemaName = record["Treatment Assignment"].ToString();
                                    var schemas = ProtocolMgmtDa.GetSchemasByProtocol(int.Parse(BaseProtocolId));
                                    var targetSchema = schemas.AsEnumerable().Where(s => s[ProtocolSchema.ProtocolArmDescription].ToString() == targetSchemaName).FirstOrDefault();
                                    if (targetSchema != null)
                                    {
                                        int targetSchemaId = (int)targetSchema[ProtocolSchema.ProtocolSchemaId];
                                        int protocolId = int.Parse(BaseProtocolId);
                                        int patientId = int.Parse(BaseDecryptedPatientId);
                                        // check for current assignment
                                        int? ptSchemaId = GetPatientSchemaId();

                                        PatientSchema ptSchema = new PatientSchema();
                                        if (ptSchemaId.HasValue)
                                        {
                                            ptSchema.Get(ptSchemaId.Value);
                                        }
                                        else
                                        {
                                            ptSchema[PatientSchema.PatientId] = patientId;
                                        }
                                        // update/insert
                                        ptSchema[PatientSchema.ProtocolSchemaId] = targetSchemaId;
                                        if(doUpdatePatientSchema)
                                            SavePatientSchema(ptSchema);

                                        // Update schemaId field for start treatment arm
                                        if(!ptSchema.IsNull(ptSchema.PrimaryKeyName))
                                            SchemaIdField.Value = ptSchema[ptSchema.PrimaryKeyName].ToString();

                                        // update UI
                                        RandomizationText.Text = record["Randomization Number"].ToString();

                                        //if (doUpdatePatientSchema)
                                        {
                                            ScheamaList.Value = SchemaIdField.Value;
                                        }
                                    }
                                    else
                                    {
                                        RandomizationText.Text = "No schema found...";
                                    }
                                }
                                else
                                {
                                    RandomizationText.Text = "Unable to assign patient to random schema";
                                }
                            }
                        }
                    }
                }
            }
            catch (System.UnauthorizedAccessException ex)
            {
                RandomizationText.Text = "Unable to assign patient to random schema, please check file access.";
            }
            catch (Exception ex)
            {
                RandomizationText.Text = "Unable to assign patient to random schema";
            }
        }

        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void UpdateRegistrationClick(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(PatientProtocolId))
            {
                // Ensure status records are queries realtime
                StatusController.ReloadStatuses();

                // Insert/Update Registration Record
                UpdateRegistrationRecord();
                // SCREENED
                if (ScreenedStatus.Checked)
                {
                    // TODO: manual update, should be dynamic
                    if (!string.IsNullOrEmpty(ScreeningStatusId.Value))
                    {
                        int screenStatusId = int.Parse(ScreeningStatusId.Value);
                        PatientProtocolStatus status = new PatientProtocolStatus();
                        status.Get(screenStatusId);
                        status[PatientProtocolStatus.PtProtocolStatusDateText] = ScreenedStatusDateText.Value;
                        status[PatientProtocolStatus.PtProtocolStatusDate] = ScreenedStatusDate.Value;
                        SavePatientProtocolStatus(status);
                    }
                }
                // CONSENTED
                if (ConsentedStatus.Checked)
                {
                    UpdateStatusRecord(PatientProtocolController.Consented, ConsentedStatusId);
                }
                // ELIGIBLE
                if (EligibleStatus.Checked)
                {
                    UpdateStatusRecord(PatientProtocolController.Eligible, EligibleStatusId);
                }
                // OFF TREATMENT
                if (OffTreatmentStatus.Checked)
                {
                    UpdateStatusRecord(PatientProtocolController.OffTreatment, OffTreatmentStatusId);
                    if (!string.IsNullOrEmpty(PatientSchemaId) && !string.IsNullOrEmpty(OffTreatmentStatusDate.Value))
                    {
                        // now place off study
                        int pProtocolId = int.Parse(PatientProtocolId);
                        int pProtocolSchemaId = int.Parse(PatientSchemaId);
                        DateTime offTreatmentDate = DateTime.Parse(OffTreatmentStatusDate.Value);
                        PatientProtocolController.PutPatientOffTreatment(pProtocolId, pProtocolSchemaId, offTreatmentDate);
                        Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "ReloadParentList", "if(window.parent.parent.reloadListAndCalendar) { window.parent.parent.reloadListAndCalendar(); }", true);
                    }
                }
                // OFF STUDY
                if (OffStudyStatus.Checked)
                {
                    UpdateStatusRecord(PatientProtocolController.OffStudy, OffStudyStatusId);
                    // if schema was assigned
                    if (!string.IsNullOrEmpty(PatientSchemaId) && !string.IsNullOrEmpty(OffStudyStatusDate.Value))
                    {
                        // now place off study
                        int pProtocolId = int.Parse(PatientProtocolId);
                        int pProtocolSchemaId = int.Parse(PatientSchemaId);
                        DateTime offStudyDate = DateTime.Parse(OffStudyStatusDate.Value);
                        PatientProtocolController.PutPatientOffStudy(pProtocolId, pProtocolSchemaId, offStudyDate);
                        Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "ReloadParentList", "if(window.parent.parent.reloadListAndCalendar) { window.parent.parent.reloadListAndCalendar(); }", true);
                    }
                }
                UpdateRegisteredStatusRecord();
                UpdateScreeningRecord();
                try
                {
                    UpdateTreatmentStarted();
                    RegisterReloadScript(string.Empty);
                }
                catch (Exception ex)
                {
                    RegisterReloadScript(string.Empty);
                }
            }


            // if patient is assigned to schema,
            // trigger update on depdent events by statuses
            /*
            int protocolId = int.Parse(BaseProtocolId);
            int patientId = int.Parse(BaseDecryptedPatientId);
            DataTable patientSchemas = ProtocolMgmtDa.GetPatientProtocolSchemasByProtocol(protocolId, patientId);
            // validate patient on schema
            if (patientSchemas.Rows.Count > 0)
            {
                int patientSchemaId = (int)patientSchemas.Rows[0][PatientSchema.PatientSchemaId];
                // trigger scheduling by statuses
                PatientProtocolController.ScheduleDependentItemsByPatientStatus(patientSchemaId);
            }
            */

            int? ptSchemaId = GetPatientSchemaId();
            // validate patient on schema
            if (ptSchemaId.HasValue)
            {
                // trigger scheduling by statuses
                PatientProtocolController.ScheduleDependentItemsByPatientStatus(ptSchemaId.Value);
            }
        }

        /// <summary>
        /// Sets warning message 
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void SetOnStudyWarning(object sender, EventArgs e)
        {
            // validate registration
            bool isRegistered = StatusController.HasStatus(PatientProtocolController.Registered);
            // validate questionnaire
            bool hasQuestionnaire = false;
            if (!string.IsNullOrEmpty(PatientProtocolRegistrationIdField.Value))
            {
                int regId = int.Parse(PatientProtocolRegistrationIdField.Value);
                hasQuestionnaire = PatientProtocolRegQuestionnaire.GetByParent<PatientProtocolRegQuestionnaire>(regId).Count() > 0;
            }
            // set message visibility based on eligibility
            OnStudyNoRegistrationWarning.Visible = !isRegistered;
            OnStudyNoQuestionnaireWarning.Visible = !hasQuestionnaire;

            EligibiltyIncomplete.Visible = !hasQuestionnaire;
            EligibiltyComplete.Visible = hasQuestionnaire;

            // supress checkbox for onstudy if criteria not met
            bool canGoOnStudy = isRegistered && hasQuestionnaire;
            if (!canGoOnStudy)
            {
                OnStudyStatus.Enabled = false;
            }
        }






        #region Insert/Updates PatientProtocolStatus records

        /// <summary>
        /// Inserts/Updates the Registration record associated with this PatientProtocol record
        /// </summary>
        private void UpdateRegistrationRecord()
        {
            PatientProtocolRegistration registrationRecord = new PatientProtocolRegistration();
            // Updating
            if (!string.IsNullOrEmpty(PatientProtocolRegistrationIdField.Value))
            {
                registrationRecord.Get(int.Parse(PatientProtocolRegistrationIdField.Value));
            }

            CICHelper.SetBOValues(this.Controls, registrationRecord, PtProtocolId);

            // Insert/Update Registration Record
            registrationRecord.Save();

            PatientProtocolRegistrationIdField.Value = registrationRecord[PatientProtocolRegistration.PatientProtocolRegistrationId].ToString();
        }


        /// <summary>
        /// Inserts/Updates the PatientProtocolStatus table to reflect Registered Date
        /// </summary>
        private void UpdateRegisteredStatusRecord()
        {
            if (RegisteredStatus.Checked && RegisteredStatus.Enabled)
            {
                PatientProtocolStatus registeredStatus = GetStatusRecord(RegisteredStatusId.Value, PatientProtocolController.Registered);
                registeredStatus[PatientProtocolStatus.PtProtocolStatusDateText] = RegisteredStatusDateText.Value;
                registeredStatus[PatientProtocolStatus.PtProtocolStatusDate] = RegisteredStatusDate.Value;

                // When Patient becomes registered, they need a ProtocolSchema record
                int protocolId = int.Parse(BaseProtocolId);
                int patientId = int.Parse(BaseDecryptedPatientId);
                PatientSchema ptSchema = new PatientSchema();
                int? ptSchemaId = GetPatientSchemaId();

                // Determine Schema
                string selectedSchemaId = ScheamaList.Value;

                // need patient schema record
                if (!ptSchemaId.HasValue)
                {
                    Protocol biz = new Protocol();
                    biz.Get(int.Parse(BaseProtocolId));
                    string protocolNum = biz[Protocol.ProtocolNum].ToString();
                    bool isCustomRandomization = ProtocolRandomization.IsRandomized(protocolNum);

                    if (!isCustomRandomization)
                    {
                        ptSchema[PatientSchema.PatientId] = BaseDecryptedPatientId;

                        // random
                        if (string.IsNullOrEmpty(selectedSchemaId) && RandomizeCheckBox.Checked)
                        {
                            int? randomSchemaId = GetRandomSchema();
                            if (randomSchemaId.HasValue)
                            {
                                selectedSchemaId = randomSchemaId.ToString();
                            }
                        }
                        if (!string.IsNullOrEmpty(selectedSchemaId))
                        {
                            ptSchema[PatientSchema.ProtocolSchemaId] = selectedSchemaId;

                            SavePatientSchema(ptSchema);

                            // Update schemaId field for start treatment arm
                            SchemaIdField.Value = selectedSchemaId;
                        }
                    }
                }
                // otherwise, update
                else
                {
                    // if not on study, ok to update PatientSchemaId
                    if (!ppc.HasStatus(PatientProtocolController.OnStudy) && !string.IsNullOrEmpty(selectedSchemaId))
                    {
                        ptSchema.Get(ptSchemaId.Value);
                        ptSchema[PatientSchema.ProtocolSchemaId] = selectedSchemaId;
                        SavePatientSchema(ptSchema);

                        SchemaIdField.Value = selectedSchemaId;
                    }
                }

                // update/insert
                SavePatientProtocolStatus(registeredStatus);


                // update hidden field
                RegisteredStatusId.Value = registeredStatus[PatientProtocolStatus.PatientProtocolStatusId].ToString();

                // since they are registered, remove RegistrationPending
                if (StatusController.HasStatus(PatientProtocolController.RegistrationPending))
                {
                    PatientProtocolStatus biz = new PatientProtocolStatus();
                    biz.Delete((int)StatusController.GetStatus(PatientProtocolController.RegistrationPending)[PatientProtocolStatus.PatientProtocolStatusId]);
                }
            }
        }

        /// <summary>
        /// Inserts/Updates the PatientProtocolStatus table to reflect screening
        /// </summary>
        private void UpdateScreeningRecord()
        {
            if (ScreenedStatus.Checked)
            {
                // only insert new status record if screening for first time
                if (!StatusController.HasStatus(PatientProtocolController.ScreeningPassed) && !StatusController.HasStatus(PatientProtocolController.ScreeningFailed))
                {
                    PatientProtocol ptProtocol = new PatientProtocol();
                    ptProtocol.Get(PtProtocolId);

                    // new status for capturning pass/fail
                    PatientProtocolStatus statusBiz = new PatientProtocolStatus();
                    statusBiz[PatientProtocolStatus.PatientProtocolId] = PtProtocolId;

                    if (!string.IsNullOrEmpty(ScreenedStatusDateText.Value))
                    {
                        DateTime screenedDate = DateTime.Parse(ScreenedStatusDateText.Value);
                        statusBiz[PatientProtocolStatus.PtProtocolStatusDate] = screenedDate;
                        statusBiz[PatientProtocolStatus.PtProtocolStatusDateText] = screenedDate.ToShortDateString();
                    }
                    // SET SCREENING STATUS
                    if (OptionPassed.Checked)
                    {
                        statusBiz[PatientProtocolStatus.PtProtocolStatus] = PatientProtocolController.ScreeningPassed;

                        ptProtocol[PatientProtocol.PtProtocolScreeningId] = PatientProtocolController.GenerateScreeningId();
                        ptProtocol[PatientProtocol.PtProtocolStudyId] = PatientProtocolController.GenerateStudyId(int.Parse(BaseProtocolId));
                    }
                    // fail, just add screenig id
                    else if (OptionFailed.Checked)
                    {
                        statusBiz[PatientProtocolStatus.PtProtocolStatus] = PatientProtocolController.ScreeningFailed;
                        statusBiz[PatientProtocolStatus.PtProtocolStatusReason] = OptionFailedReason.Value;

                        // needs just studyid
                        ptProtocol[PatientProtocol.PtProtocolScreeningId] = PatientProtocolController.GenerateScreeningId();
                    }
                    // set notes
                    statusBiz[PatientProtocolStatus.PtProtocolStatusNotes] = ScreeningNotes.Value;

                    // UPDATE PATIENT PROTOCOL AND STATUS
                    ptProtocol.Save();

                    SavePatientProtocolStatus(statusBiz);

                    // CREATE STUDY ID IDENTIFIER
                    PatientProtocolController.CreateStudyIdIdentifier(PtProtocolId);
                }
            }
        }

        /// <summary>
        /// Inserts/Updates the PatientProtocolStatus table to reflect treatment started
        /// </summary>
        private void UpdateTreatmentStarted()
        {
            // Need SchemaId for updating
            string updateSchemaId = BaseSchemaId;
            if (!string.IsNullOrEmpty(SchemaIdField.Value))
            {
                updateSchemaId = SchemaIdField.Value;
            }
            //SchemaIdField.Value = updateSchemaId;
            if (OnStudyStatus.Checked && OnStudyStatus.Enabled && !string.IsNullOrEmpty(updateSchemaId))
            {
                bool treatmentStarted = false;
                int protocolId = int.Parse(BaseProtocolId);
                int schemaId = int.Parse(updateSchemaId);
                int patientId = int.Parse(BaseDecryptedPatientId);

                // Reload statuses for dependencies
                StatusController.ReloadStatuses();

                // If they don't have treatment started and have passed, cointinue
                if (!StatusController.HasStatus(PatientProtocolController.OnStudy) && StatusController.HasStatus(PatientProtocolController.ScreeningPassed) && StatusController.HasStatus(PatientProtocolController.Registered))
                {
                    SecurityController sc = new SecurityController();
                    string username = sc.GetUserName();
                    DateTime today = DateTime.Now;
                    DateTime startDate = DateTime.Now;

                    // date for StartDate
                    if (!string.IsNullOrEmpty(OnStudyStatusDate.Value))
                    {
                        if (!DateTime.TryParse(OnStudyStatusDate.Value, out startDate))
                        {
                            startDate = DateTime.Today;
                        }
                    }
                    // ASSIGN PATIENTS MAIN CALL

                    // validate: do not schedule if timeline already exists
                    string datasetSQL = CacheManager.GetDatasetSQL(Page.Session[SessionKey.DatasetId]);
                    bool patientHasTimeline = ProtocolMgmtDa.PatientHasTimeline(protocolId, patientId, null, datasetSQL);
                    if (!patientHasTimeline)
                    {
                        ProtocolMgmtDa.AssignPatients(schemaId, patientId, username, startDate, today);
                    }


                    // START TREATMENT STATUS
                    PatientProtocolStatus statusStart = new PatientProtocolStatus();
                    statusStart[PatientProtocolStatus.PatientProtocolId] = PtProtocolId;
                    statusStart[PatientProtocolStatus.PtProtocolStatus] = PatientProtocolController.OnStudy;
                    DateTime statusDate = DateTime.Now;
                    if (!string.IsNullOrEmpty(OnStudyStatusDate.Value))
                    {
                        if (!DateTime.TryParse(OnStudyStatusDate.Value, out statusDate))
                        {
                            statusDate = DateTime.Today;
                        }
                    }

                    statusStart[PatientProtocolStatus.PtProtocolStatusDate] = statusDate;
                    statusStart[PatientProtocolStatus.PtProtocolStatusDateText] = statusDate.ToShortDateString();
                    SavePatientProtocolStatus(statusStart);
                    
                    treatmentStarted = true;
                }
                if (!treatmentStarted)
                {
                    throw new Exception(PatientProtocolController.OnStudy + " ERROR: There was an error starting treatment for this Patient on the selected Treatment Arm.");
                }
            }
            // shift on study date
            else if (OnStudyStatus.Checked && !OnStudyStatus.Enabled && !string.IsNullOrEmpty(updateSchemaId) && shiftOnStudyDate)
            {
                // query current on study date
                StatusController.ReloadStatuses();
                DataRow status = StatusController.GetStatus(PatientProtocolController.OnStudy);
                // validate current OnStudy status
                if (status != null && !status.IsNull(PatientProtocolStatus.PtProtocolStatusDate) && PageUtil.IsDate(OnStudyStatusDate.Value))
                {
                    PatientProtocolStatus statusBiz = new PatientProtocolStatus();
                    statusBiz.Get((int)status[PatientProtocolStatus.PatientProtocolStatusId]);
                    // determine days to shift, + or -
                    string newOnStudyDateText = OnStudyStatusDate.Value;
                    DateTime originalOnStudyDate = (DateTime)statusBiz[PatientProtocolStatus.PtProtocolStatusDate];
                    DateTime newOnStudyDate = DateTime.Parse(newOnStudyDateText);
                    int shiftNumDays = (newOnStudyDate - originalOnStudyDate).Days;
                    // 0 days = no shifting, otherwise, shift either direction
                    if (shiftNumDays != 0 && !string.IsNullOrEmpty(PatientSchemaId))
                    {
                        // Update Status Record
                        /*
                        // HACK: shift visits after min date to shift entire schedule, TODO: query first date ???
                        DateTime shiftDate = new DateTime(1970, 1, 1);
                        // shift schedule with user provided values
                        ProtocolMgmtDa.SaveShiftData(ptSchemaId, shiftDate, shiftNumDays, userName, DateTime.Now);
                       */                        
                        // update status
                        statusBiz[PatientProtocolStatus.PtProtocolStatusDateText] = newOnStudyDateText;
                        statusBiz[PatientProtocolStatus.PtProtocolStatusDate] = newOnStudyDate;
                        SavePatientProtocolStatus(statusBiz);

                        // update schedule
                        SecurityController ct = new SecurityController();
                        string username = ct.GetUserName();
                        int patientSchemaId = int.Parse(PatientSchemaId);
                        ProtocolMgmtDa.UpdatePatientTimeline(patientSchemaId, username);

                        // update UI
                        OnStudyStatusDateText.Value = newOnStudyDate.ToShortDateString();
                        OnStudyStatusDate.Value = newOnStudyDate.ToShortDateString();

                        // reload main tab
                        Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "reloadPatientPortal", "if(parent.reloadPatientPortal) { parent.reloadPatientPortal('PatientRegistration'); }", true);
                    }
                }
            }
        }

        #endregion

        #region HELPER METHODS

        /// <summary>
        /// Generic method to update PatientProtocolStatus record with relevent fields
        /// </summary>
        /// <param name="status">The "Status" of the record, ProtocolMgmtController for status Status list</param>
        /// <param name="statusIdField">The hidden field to tract the PatientProtocolStatusId</param>
        private void UpdateStatusRecord(string status, CaisisHidden statusIdField)
        {
            PatientProtocolStatus statusBiz = GetStatusRecord(statusIdField.Value, status);
            Dictionary<string, ICaisisInputControl> statusFieldControls = StatusDictionary[status];
            foreach (string field in statusFieldControls.Keys)
            {
                // status will already have been populated
                if (field != PatientProtocolStatus.PtProtocolStatus)
                {
                    statusBiz[field] = statusFieldControls[field].Value;
                }
            }
            // update/insert
            SavePatientProtocolStatus(statusBiz);

            // update hidden field
            statusIdField.Value = statusBiz[PatientProtocolStatus.PatientProtocolStatusId].ToString();
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="statusIdField"></param>
        private void RemoveStatusRecord(CaisisHidden statusIdField)
        {
            // If unchecking offstudy, remove record
            if (!string.IsNullOrEmpty(statusIdField.Value))
            {
                PatientProtocolStatus statusBiz = new PatientProtocolStatus();
                statusBiz.Delete(int.Parse(statusIdField.Value));
            }
        }

        /// <summary>
        /// Returns a PatientProtocolStatus, populated by priKeyField,
        /// PatientProtocolId and PtProtocolStatus if not null
        /// </summary>
        /// <param name="priKeyField">optional pt protocol status id</param>
        /// <param name="statusEnum">status name</param>
        /// <returns>An initalied PatientProtocolStatus Biz</returns>
        private PatientProtocolStatus GetStatusRecord(string priKeyField, string statusEnum)
        {
            PatientProtocolStatus biz = new PatientProtocolStatus();
            // load existing record
            if (!string.IsNullOrEmpty(priKeyField))
            {
                biz.Get(int.Parse(priKeyField));
            }
            // otherwise return new instance with required fields initalized
            else
            {
                biz[PatientProtocolStatus.PatientProtocolId] = PtProtocolId;
                biz[PatientProtocolStatus.PtProtocolStatus] = statusEnum;
            }
            return biz;
        }

        /// <summary>
        /// Reloads the page with optional client message before reload
        /// </summary>
        /// <param name="clientMessage"></param>
        private void RegisterReloadScript(string clientMessage)
        {
            string safeMessage = PageUtil.EscapeSingleQuotes(clientMessage);
            string clientSchemaId = SchemaIdField.Value;
            // If patient has to ProtocolSchema record and no error message
            if (string.IsNullOrEmpty(clientSchemaId) && string.IsNullOrEmpty(clientMessage))
            {
                clientSchemaId = ScheamaList.Value;
            }
            Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "ReloadPage", "reloadRegistration('" + BaseProtocolId + "','" + clientSchemaId + "','" + BasePatientId + "','" + ActiveStatusField.Value + "', '" + ActiveSubTabIndex.Value + "',  '" + safeMessage + "');", true);
        }

        /// <summary>
        /// Registers a startup script for initalizing which panel is selected on page load
        /// </summary>
        /// <param name="status"></param>
        private void RegisterStartupPanel(string status)
        {
            // update hidden field
            ActiveStatusField.Value = status;
            int activeSubIndex = 0;
            if (!string.IsNullOrEmpty(ActiveSubTabIndex.Value))
            {
                activeSubIndex = int.Parse(ActiveSubTabIndex.Value);
            }
            else if (!string.IsNullOrEmpty(Request.QueryString["subIndex"]))
            {
                activeSubIndex = int.Parse(Request.QueryString["SubIndex"]);
            }
            string startupPanelScript = string.Format("initActivePanel('{0}', {1});", status, activeSubIndex);
            Page.ClientScript.RegisterStartupScript(this.GetType(), "StartupPanel", startupPanelScript, true);
        }

        #endregion

        #region RANDOMIZATION

        /// <summary>
        /// Gets a random schema id from the Schema list
        /// </summary>
        /// <returns></returns>
        private int? GetRandomSchema()
        {
            var filledStatus = GetSchemaAccrualStatus();
            int protocolId = int.Parse(BaseProtocolId);
            return ProtocolMgmtController.RandomizeTrial(protocolId);
        }

        /// <summary>
        /// Returns the randomization mapping for the Protocol (i.e., SchemaId => Randomization Weight)
        /// </summary>
        /// <returns></returns>
        private bool SetRandomizationDetails()
        {
            Protocol biz = new Protocol();
            biz.Get(int.Parse(BaseProtocolId));
            string protocolNum = biz[Protocol.ProtocolNum].ToString();
            bool isCustomRandomization = ProtocolRandomization.IsRandomized(protocolNum);
            bool cannotChangeSchema = !string.IsNullOrEmpty(PatientSchemaId) && StatusController.HasStatus(PatientProtocolController.Registered);

            // show/hide relevant panels
            if (isCustomRandomization)
            {
                //CustomizedRandomBtn.Visible = true;
                RandomizeCheckBox.Enabled = false;
                RandomizeCheckBox.Checked = true;
                RandomizeCheckBox.Visible = false;
                //RandomizeBtn.Visible = false;
                ScheamaList.Visible = false;

                ScheamaListReadOnly.Visible = false;// !cannotChangeSchema;
                CustomizedRandomText.Visible = false;// !cannotChangeSchema;

                // set randomization UI
                //StandardTreatmentPanel.Visible = false;
                SchemaSelectPanel.Visible = false;
                CustomRandomizationPanel.Visible = true;                

                // get current stratum
                PatientProtocol ptProtocol = new PatientProtocol();
                ptProtocol.Get(PtProtocolId);
                if (!ptProtocol.IsNull(PatientProtocol.PtProtocolStudyId))
                {
                    string studyId = ptProtocol[PatientProtocol.PtProtocolStudyId].ToString();
                    var record = ProtocolRandomization.GetStratumByStudyId(studyId);
                    if (record.Key.HasValue)
                    {
                        string randomizationNum = record.Value["Randomization Number"].ToString();
                        RandomizationText.Text = randomizationNum;
                    }
                }

                RegisteredButton_0.Visible = true;
                RegisteredTab_0.Visible = true;
                // set inactive
                RegisteredButton_1.Attributes["class"] = "dataEntryButtonGray";
                RegisteredTab_1.Style["display"] = "none";
            }
            else
            {
                //StandardTreatmentPanel.Visible = true;
                SchemaSelectPanel.Visible = true;
                CustomRandomizationPanel.Visible = false;
                //CustomizedRandomBtn.Visible = false;                
                /*RandomizeCheckBox.Enabled = true;
                RandomizeCheckBox.Checked = false;
                RandomizeCheckBox.Visible = true;
                
                ScheamaList.Visible = true;
                ScheamaListReadOnly.Visible = false;
*/
                /*CustomizedRandomText.Visible = false;
                CustomizedRandomText.Text = string.Empty;

                 */

                RegisteredButton_0.Visible = false;
                RegisteredTab_0.Visible = false;
                // set active
                RegisteredButton_1.Attributes["class"] = "dataEntryButtonRed";
                RegisteredTab_1.Style["display"] = "block";
            }
            return isCustomRandomization;
        }

        #endregion

        internal class ProtocolRandomization
        {
            private static readonly string STRATUM_FILE_ON_DISK_FORMAT = "~/App_Data/MPXRandomization/{0}";
            private static readonly string STRATUM_FILE_FORMAT = "Stratum{0}.csv";
            private static readonly string PROTOCOL_MATCH = "c11-086 v2";

            private int stratum = -1;

            /// <summary>
            /// Gets if the specifiec Protocol has a Statum based randomiation
            /// </summary>
            /// <param name="protocolNum"></param>
            /// <returns></returns>
            public static bool IsRandomized(string protocolNum)
            {
                return PROTOCOL_MATCH.Equals(protocolNum, StringComparison.OrdinalIgnoreCase);
            }

            /// <summary>
            /// Creates a new instance of the randomizer with the target Stratum
            /// </summary>
            /// <param name="stratum"></param>
            public ProtocolRandomization(int stratum)
            {
                this.stratum = stratum;
            }

            /// <summary>
            /// Writes the specificed Study Id to the current Stratum (if applicable) and returns the record if inserted (or if already exists).
            /// </summary>
            /// <param name="ptProtocolStudyId"></param>
            /// <param name="validateStratum"></param>
            /// <returns></returns>
            public DataRow WriteNextStudyId(string ptProtocolStudyId, int? validateStratum)
            {
                // check if study id already palced
                KeyValuePair<int?, DataRow> current = GetStratumByStudyId(ptProtocolStudyId);
                int? currentStratum = current.Key;
                DataRow currentStudyIdRow = current.Value;
                // validate
                if (currentStratum.HasValue && validateStratum.HasValue && currentStratum.Value == validateStratum.Value)
                {
                    return currentStudyIdRow;
                }
                // cleanup existing ???
                if (currentStratum.HasValue && currentStudyIdRow != null)
                {
                    // load current
                    string currentFileName = GetFileName(currentStratum.Value);
                    var currentStratumTable = LoadFromFile(currentFileName);
                    // cleanup, reset Subject Id
                    var found = FindStudyId(ptProtocolStudyId, currentStratum.Value, currentStratumTable);
                    if (found.Key.HasValue)
                    {
                        var dataRow = found.Value;
                        dataRow["Subject Id"] = "";
                        dataRow["Date"] = "";
                        // write back results
                        WriteToFile(currentStratumTable, currentFileName);
                    }

                    //return currentStudyIdRow;
                }
                // load stratum table
                DataTable data = GetTable();
                if (data != null)
                {
                    // locate next empty instance
                    var emptyRows = data.Select("[Subject Id] IS NULL OR [Subject Id] = ''");
                    if (emptyRows.Length > 0)
                    {
                        var firstEmptyRow = emptyRows[0];
                        // set study id
                        firstEmptyRow["Subject Id"] = ptProtocolStudyId;
                        firstEmptyRow["Date"] = DateTime.Today.ToShortDateString();
                        // save
                        string file = GetFileName(this.stratum);
                        WriteToFile(data, file);
                        // return results
                        return firstEmptyRow;
                    }
                }
                return null;
            }

            /// <summary>
            /// Loads the current Stratum into a DataTable for reading/writing.
            /// </summary>
            /// <returns></returns>
            public DataTable GetTable()
            {
                return LoadFromFile(GetFileName(this.stratum));
            }

            /// <summary>
            /// For the specified PSA Doubling Times and Gleason scores, calculate the target Stratum.
            /// </summary>
            /// <param name="psaDT">The patient's PSA Doubling Time</param>
            /// <param name="pathGG1"></param>
            /// <param name="pathGG2"></param>
            /// <param name="pathGGS"></param>
            /// <returns>The calculated Stratum, else NULL</returns>
            public static int? GetStratumNum(float psaDT, int pathGG1, int pathGG2, int pathGGS)
            {
                // Stratum 1: PSADT (<=9 months) and Gleason score (<=6, 3+4)				
                if (psaDT <= 9 && (pathGGS <= 6 || (pathGG1 == 3 && pathGG2 == 4)))
                {
                    return 1;
                }
                // Stratum 2: PSADT (>9 months) and Gleason score (<=6, 3+4)				
                else if (psaDT > 9 && (pathGGS <= 6 || (pathGG1 == 3 && pathGG2 == 4)))
                {
                    return 2;
                }
                // Stratum 3: PSADT (<=9 months) and Gleason score (4+3, >=8)		
                else if (psaDT <= 9 && (pathGGS >= 8 || (pathGG1 == 4 && pathGG2 == 3)))
                {
                    return 3;
                }
                //Stratum 4: PSADT (>9 months) and Gleason score (4+3, >=8)
                else if (psaDT > 9 && (pathGGS >= 8 || (pathGG1 == 4 && pathGG2 == 3)))
                {
                    return 4;
                }
                else
                {
                    return null;
                }
            }

            /// <summary>
            /// Gets the stratum number for the specified Study Id
            /// </summary>
            /// <param name="ptProtocolStudyId"></param>
            /// <returns></returns>
            public static KeyValuePair<int?, DataRow> GetStratumByStudyId(string ptProtocolStudyId)
            {
                foreach (int stratum in new int[] { 1, 2, 3, 4 })
                {
                    var data = LoadFromFile(GetFileName(stratum));
                    if (data != null)
                    {
                        var pair = FindStudyId(ptProtocolStudyId, stratum, data);
                        if (pair.Key.HasValue)
                        {
                            return pair;
                        }
                    }
                }
                return new KeyValuePair<int?, DataRow>(null, null);
            }

            public static KeyValuePair<int?, DataRow> FindStudyId(string ptProtocolStudyId, int stratum, DataTable data)
            {
                var records = data.Select("[Subject Id] = '" + ptProtocolStudyId + "'");
                if (records.Length > 0)
                {
                    KeyValuePair<int?, DataRow> pair = new KeyValuePair<int?, DataRow>(stratum, records.First());
                    return pair;
                }
                return new KeyValuePair<int?, DataRow>(null, null);
            }

            /// <summary>
            /// Gets the full path to the specified Stratum
            /// </summary>
            /// <param name="stratum"></param>
            /// <returns></returns>
            private static string GetFileName(int stratum)
            {
                string relativePath = string.Format(STRATUM_FILE_FORMAT, stratum);
                //string fullPath = HttpContext.Current.Server.MapPath(relativePath);
                //return fullPath;
                return relativePath;
            }

            /// <summary>
            /// Writes the specified Stratum data to a file.
            /// </summary>
            /// <param name="data"></param>
            /// <param name="file"></param>
            /// <returns></returns>
            private static bool WriteToFile(DataTable data, string file)
            {
                bool useFileSystem = UseMPXFileSystem();
                if (useFileSystem)
                {
                    string fileRelPath = string.Format(STRATUM_FILE_ON_DISK_FORMAT, file);
                    string fileAbsPath = HttpContext.Current.Server.MapPath(fileRelPath);
                    if (System.IO.File.Exists(fileAbsPath))
                    {
                        Caisis.DataAnalysis.CSV.Write(data, fileAbsPath);
                        return true;
                    }
                }
                else
                {
                    System.IO.StringWriter writer = new System.IO.StringWriter();
                    _CSV.Write(data, writer);

                    BOL.PCCTCFiles fileBiz = GetFile(file);
                    if (fileBiz != null)
                    {
                        fileBiz[BOL.PCCTCFiles.PCCTCFileName] = file;
                        fileBiz[BOL.PCCTCFiles.PCCTCFileData] = writer.ToString();
                        fileBiz.Save();

                        return true;
                    }
                }
                return false;
            }

            /// <summary>
            /// Loads the specificed Stratum data.
            /// </summary>
            /// <param name="file"></param>
            /// <returns></returns>
            private static DataTable LoadFromFile(string file)
            {
                bool useFileSystem = UseMPXFileSystem();
                if (useFileSystem)
                {
                    string fileRelPath = string.Format(STRATUM_FILE_ON_DISK_FORMAT, file);
                    string fileAbsPath = HttpContext.Current.Server.MapPath(fileRelPath);
                    if (System.IO.File.Exists(fileAbsPath))
                    {
                        var data = Caisis.DataAnalysis.CSV.Read(fileAbsPath);
                        return data;
                    }
                }
                else
                {
                    BOL.PCCTCFiles fileBiz = GetFile(file);
                    if (fileBiz != null && !fileBiz.IsEmpty)
                    {
                        string rawData = fileBiz[BOL.PCCTCFiles.PCCTCFileData].ToString();
                        System.IO.StreamReader reader = new System.IO.StreamReader(new System.IO.MemoryStream(System.Text.ASCIIEncoding.ASCII.GetBytes(rawData)));
                        var data = _CSV.Read(reader);
                        return data;
                    }
                }
                return null;
            }


            private static bool UseMPXFileSystem()
            {
                bool useFileSystem = false;
                try
                {
                    GetFile("_TEST_MPX_FILE_");
                }
                // ??? TODO: better validation
                catch (System.Data.SqlClient.SqlException ex)
                {
                    useFileSystem = true;
                }
                return useFileSystem;
            }

            public static BOL.PCCTCFiles GetFile(string fileName)
            {
                return BOL.BusinessObject.GetByFields<BOL.PCCTCFiles>(
                     new Dictionary<string, object>
                     {
                         { BOL.PCCTCFiles.PCCTCFileName, fileName }
                     }).FirstOrDefault();
            }

            #region TODO: CLEANUP

            internal class _CSV
            {
                static readonly char delim = GetDelimiter();

                /// <summary>
                /// Consume a csv file line-by-line.
                /// </summary>
                /// <param name="consumer">
                /// consumer should return true to continue reading,
                /// false to terminate consumption
                /// </param>
                public static void Consume(string filename, Func<IDictionary<string, string>, bool> consumer)
                {
                    Consume(new StreamReader(filename), consumer);
                }

                public static void Consume(StreamReader sr, Func<IDictionary<string, string>, bool> consumer)
                {
                    string line;
                    List<string> headers = null;

                    while ((line = sr.ReadLine()) != null)
                    {
                        string[] tokens = line.Split(delim);

                        if (headers == null)
                        {
                            headers = new List<string>(tokens.Select(s => HandleSimpleEscape(s)));
                        }
                        else
                        {
                            Dictionary<string, string> fv = new Dictionary<string, string>();

                            for (int i = 0; i < tokens.Length; i++)
                                fv[headers[i]] = HandleSimpleEscape(tokens[i]);

                            if (!consumer(fv))
                                break;
                        }
                    }
                }

                public static DataTable Read(string filename)
                {
                    return Read(new StreamReader(filename));
                }

                public static DataTable Read(StreamReader reader)
                {
                    DataTable t = new DataTable();
                    bool headersHandled = false;

                    Func<IDictionary<string, string>, bool> f =
                        record =>
                        {
                            if (!headersHandled)
                            {
                                foreach (string k in record.Keys)
                                    t.Columns.Add(k);

                                headersHandled = true;
                            }

                            DataRow r = t.NewRow();
                            foreach (string k in record.Keys)
                                r[k] = record[k];

                            t.Rows.Add(r);
                            return true;
                        };

                    Consume(reader, f);

                    return t;
                }

                // return s[1:-1] if quoted, s otherwise
                private static string HandleSimpleEscape(string s)
                {
                    int len = s.Length;

                    if (len == 0 || !(s[0] == '"' && s[len - 1] == '"'))
                        return s;
                    else
                        return s.Substring(1, len - 2);
                }

                // for writing, what kind of generic, enumerable interface can we accept?
                // the core function is a record-converter: ADO.Net "record" -> csv line

                public static void Write(IEnumerable datasource, string filename, IEnumerable<string> headers)
                {
                    using (StreamWriter sw = new StreamWriter(filename))
                    {
                        if (headers != null && headers.Count() > 0)
                            sw.WriteLine(AsCSV(headers));

                        foreach (object record in datasource)
                        {
                            IEnumerable fields = record as IEnumerable;

                            if (fields == null)
                                continue;

                            sw.WriteLine(AsCSV(fields.Cast<object>().Select(x => x.ToString())));
                        }
                    }
                }

                public static void Write(DataTable data, TextWriter writer)
                {
                    // headers
                    var headers =
                        from DataColumn c in data.Columns
                        select c.ColumnName;

                    if (headers.Count() > 0)
                        writer.WriteLine(AsCSV(headers));

                    // records
                    foreach (var row in data.AsEnumerable())
                    {
                        writer.WriteLine(AsCSV(row.ItemArray.Select(x => x.ToString())));
                    }
                }

                public static void Write(DataTable data, string filename)
                {
                    using (StreamWriter sw = new StreamWriter(filename))
                    {
                        Write(data, sw);
                    }
                }

                protected static string AsCSV(IEnumerable<string> fields)
                {
                    // WARNING: we have to "escape" double-quotes, commas, and newlines!
                    // QUESTION: can we use the locale to determine whether to use commas or semicolons?
                    return string.Join(delim.ToString(), fields.Select(x => ProcessField(x)).ToArray());
                }

                protected static string ProcessField(string field)
                {
                    #region reference, from http://en.wikipedia.org/wiki/Comma-separated_values
                    /*
            CSV is a delimited data format that has fields/columns separated by 
            the comma character and records/rows terminated by newlines. 
            Fields that contain a special character (comma, newline, or double quote), must be enclosed in double quotes. 
            If a line contains a single entry which is the empty string, it may be enclosed in double quotes. 
            If a field's value contains a double quote character it is escaped by placing another double quote character next to it. 
            The CSV file format does not require a specific character encoding, byte order, or line terminator format.

            Each record is one line terminated by a line feed (ASCII/LF=0x0A) or a carriage return and line feed pair (ASCII/CRLF=0x0D 0x0A), however, line-breaks can be embedded.
            Fields are separated by commas. (In locales where the comma is used as a decimal separator, the semicolon is used instead as a delimiter. 
            The different delimiters cause problems when CSV files are exchanged, for example, between France and USA.)
            */
                    #endregion

                    StringBuilder b = new StringBuilder();
                    bool escape = false;
                    bool testnl = false;

                    for (int i = 0; i < field.Length; i++)
                    {
                        char c = field[i];

                        if (c == '"')
                        {
                            b.Append('"');
                            escape = true;
                        }
                        else if (c == '\r')
                        {
                            testnl = true;
                        }
                        else if ((testnl && c == '\n') || c == delim)
                        {
                            escape = true;
                        }

                        b.Append(c);
                    }

                    // CLR BUG: new StringBuilder('"') will be initially empty
                    if (escape)
                        return new StringBuilder().Append('"').Append(b).Append('"').ToString();
                    else
                        return b.ToString();
                }

                private static char GetDelimiter()
                {
                    if (CultureInfo.CurrentCulture.NumberFormat.NumberDecimalSeparator == ",")
                        return ';';
                    else
                        return ',';
                }
            }

            #endregion
        }

        #region validation

        // todo: assigned to more than one schema per trials
        private int? GetPatientSchemaId()
        {
            int protocolId = int.Parse(BaseProtocolId);
            int patientId = int.Parse(BaseDecryptedPatientId);
            PatientSchema ptSchema = new PatientSchema();
            DataTable patientSchemas = ProtocolMgmtDa.GetPatientProtocolSchemasByProtocol(protocolId, patientId);
            if (patientSchemas.Rows.Count > 0)
            {
                return (int)patientSchemas.Rows[0][PatientSchema.PatientSchemaId];
            }
            else
            {
                return null;
            }
        }

        private void SavePatientSchema(PatientSchema ptSchema)
        {
            // validation
            if (!ptSchema.IsNull(PatientSchema.PatientId))
            {
                // existing: OK
                if (ptSchema.PrimaryKeyHasValue)
                {
                }
                // validate: new record
                else
                {
                    int protocolId = int.Parse(BaseProtocolId);
                    int patientId = int.Parse(BaseDecryptedPatientId);
                    DataTable patientSchemas = ProtocolMgmtDa.GetPatientProtocolSchemasByProtocol(protocolId, patientId);
                    if (patientSchemas.Rows.Count > 0)
                    {
                        throw new Exception("This subject has already been assigned to a schema on this Protocol.");
                    }
                }
            }
            ptSchema.Save();
        }

        /// <summary>
        /// Saves the selected status, preventing duplication
        /// </summary>
        /// <param name="statusBiz"></param>
        private void SavePatientProtocolStatus(PatientProtocolStatus statusBiz)
        {
            string bizStatus = statusBiz[PatientProtocolStatus.PtProtocolStatus].ToString();
            // new ???
            if (!string.IsNullOrEmpty(bizStatus) && !statusBiz.PrimaryKeyHasValue)
            {
                DataRow existingStatus = StatusController.GetStatus(bizStatus);
                // status exists already ??
                if (existingStatus != null)
                {
                    // load existing
                    PatientProtocolStatus existingStatusBiz = new PatientProtocolStatus();
                    existingStatusBiz.Get((int)existingStatus[PatientProtocolStatus.PatientProtocolStatusId]);
                    // copy special fields
                    existingStatusBiz[PatientProtocolStatus.PtProtocolStatusDate] = statusBiz[PatientProtocolStatus.PtProtocolStatusDate];
                    existingStatusBiz[PatientProtocolStatus.PtProtocolStatusDateText] = statusBiz[PatientProtocolStatus.PtProtocolStatusDateText];
                    existingStatusBiz[PatientProtocolStatus.PtProtocolStatusReason] = statusBiz[PatientProtocolStatus.PtProtocolStatusReason];
                    existingStatusBiz[PatientProtocolStatus.PtProtocolStatusNotes] = statusBiz[PatientProtocolStatus.PtProtocolStatusNotes];
                    // update reference to existing Biz
                    statusBiz = existingStatusBiz;
                }
            }
            // OK: already populated status
            else
            {
            }
            statusBiz.Save();
            // reload statuses
            StatusController.ReloadStatuses();
        }

        #endregion

    }
}