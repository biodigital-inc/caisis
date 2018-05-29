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
using Caisis.Controller;
using Caisis.DataAccess;
using Caisis.Security;
using Caisis.UI.Core.Classes;
using Caisis.UI.ClientScript.Ajax;
using Caisis.UI.Core.Classes.CustomControls;

namespace Caisis.UI.Modules.ProtocolMgmt
{
    public partial class PatientScreening : ProtocolMgmtPatientBasePage
    {
        /// <summary>
        /// The LookupCode where LkpFieldName="IdType" representing the Patient's Protocol Participant Id
        /// </summary>
        protected static readonly string PROTOCOL_PARTICIPANT_ID_CODE = "Participant ID";

        private bool CanViewPatientInfo
        {
            get
            {
                return base.ShowPatientIdentifiers();
            }
        }

        private bool hasInstitutionDataset = true;

        public PatientScreening()
            : base()
        {
            // set require insitution dataset bool
            this.Init += (o, e) =>
                {
                    int datasetId = int.Parse(Session[SessionKey.DatasetId].ToString());
                    DataSetController dsCt = new DataSetController();
                    var dataSet = dsCt.FindDatasetNode(datasetId);
                    if (dataSet != null)
                    {
                        var all = dataSet.SelectSingleNode("dimension[@type='All']");
                        if (all == null)
                        {
                            var dimensions = dataSet.SelectNodes("dimension[@type='Institution']");
                            // Institutional dataset required
                            hasInstitutionDataset = dimensions.Count > 0;
                        }
                    }
                };
        }

        protected override void Page_Load(object sender, EventArgs e)
        {
            // set dataset message
            if (!hasInstitutionDataset)
            {
                NewPatientInstitution.Visible = true;
            }

            if (!Page.IsPostBack)
            {
                int protocolId = int.Parse(BaseProtocolId);
                // Get an auto-generate screening id
                ScreeningID.Value = PatientProtocolController.GenerateScreeningId().ToString();
                // study id
                string autoStudyId = PatientProtocolController.GenerateStudyId(protocolId);
                StudyID.Value = autoStudyId;
                bool calculateStudyIdBySite = ProtocolMgmtUtil.GenerateStudyIdByOrganization();
                // custom auto-generation
                if (calculateStudyIdBySite)
                {
                    OrganizationStudyIds.Visible = true;

                    StudyIdTooltip.Attributes["title"] = "An Id created to identify a patient on a study in the form: Site Id (2 digits) + Protocol Id (3 digits) + Incremental Patient Id (3 digits)";

                    // get associated Project (to select organizations)
                    Protocol protocol = new Protocol();
                    protocol.Get(protocolId);
                    string protocolNum = protocol[Protocol.ProtocolNum].ToString();

                    // get a list of associated organizations
                    if (!protocol.IsNull(Protocol.ProjectId) && !string.IsNullOrEmpty(protocolNum))
                    {
                        ProjectManagementDa da = new ProjectManagementDa();
                        int projectId = (int)protocol[Protocol.ProjectId];

                        // get a list of organizations associated with project
                        var projectOrganizations = BusinessObject.GetByFields<Project_ProjectOrganization>(new Dictionary<string, object> { { Project_ProjectOrganization.ProjectId, projectId } });
                        
                        // get a list of user's organizations
                        int userId = new UserController().GetUserId();
                        DataTable userOrganizations = new UserDa().GetUserOrganizations(userId);
                        var userOrganizationIds = userOrganizations.AsEnumerable().Select(r => (int)r["OrganizationId"]);

                        // get the intersect of user's sites and lead sites
                        var userLeadSites = from po in projectOrganizations
                                        let organizationType = po["OrganizationType"].ToString()
                                        let organizationId = (int)po[Project_ProjectOrganization.OrganizationId]
                                        where organizationType.Contains("Lead Site")
                                        join userOrgId in userOrganizationIds on organizationId equals userOrgId
                                        select userOrgId;
                        // if user is part of a lead site, allow to select organization
                        if (userLeadSites.Count() > 0)
                        {
                            // TODO: centralize call to get project organizations
                            var organizations = da.GetAllOrganizationsByProjectId(projectId);
                            // get a list of organizations and calculate study id per organization
                            var organizationToStudyId = from row in organizations.AsEnumerable()
                                                        let orgName = row["Name"].ToString()
                                                        let orgId = (int)row["OrganizationId"]
                                                        let isAssociated = userOrganizationIds.Contains(orgId) ? 0 : 1
                                                        orderby
                                                            //isAssociated ascending,
                                                            orgName ascending
                                                        select new
                                                        {
                                                            OrganizationName = orgName,
                                                            OrganizationId = orgId,
                                                            OrganizationStudyId = GenerateStudyIdByOrganization(protocolId, protocolNum, orgId)
                                                        };

                            OrganizationStudyIds.DataSource = organizationToStudyId;
                            OrganizationStudyIds.DataBind();
                            
                            // a list of insitutions where institution = organization in project
                            var allInstitutions = from inst in BOL.BusinessObject.GetAll<Institution>()
                                                  let institutionId = (int)inst[BOL.Institution.InstitutionId]
                                                  let institutionName = inst[BOL.Institution.Institution_Field].ToString()
                                                  select new
                                                  {
                                                      InstitutionId = institutionId,
                                                      Institution = institutionName
                                                  };
                            var orgs = from org in userOrganizations.AsEnumerable()
                                       select new
                                       {
                                           Name = org["Name"].ToString(),
                                           ShortName = org["ShortName"].ToString()
                                       };
                            // get institution where name matches an organization's name or short name
                            var institutions = from inst in allInstitutions
                                               let institutionName = inst.Institution
                                               let organization = orgs.Where(org => org.Name == institutionName || org.ShortName == institutionName).FirstOrDefault()
                                               where organization != null
                                               select new
                                               {
                                                   Text = organization.Name,
                                                   Value = inst.InstitutionId
                                               };

                            // build institutions
                            NewPatientInstitutionSelect.DataSource = institutions;
                            NewPatientInstitutionSelect.DataBind();

                            // set default study id: user's organization
                            // get user's site
                            int userLeadSiteId = userLeadSites.First();
                            // get study id for user's site
                            var userSites = organizationToStudyId.Where(o => o.OrganizationId == userLeadSiteId);
                            autoStudyId = userSites.Count() == 1 ? userSites.First().OrganizationStudyId : "";

                            // update field and select
                            OrganizationStudyIds.Value = autoStudyId;
                            StudyID.Value = autoStudyId;
                           
                        }
                            // show a list of all user's organizations
                        else
                        {
                            if (userOrganizations.Rows.Count > 0)
                            {
                                string organizationName = userOrganizations.Rows[0]["Name"].ToString();
                                int organizationId = (int)userOrganizations.Rows[0]["OrganizationId"];

                                // a list of orgaizations associated with the project
                                var organizations = from o in userOrganizations.AsEnumerable()
                                                    let orgId = (int)o["OrganizationId"]
                                                    select
                                                    new
                                                    {
                                                        OrganizationName = o["Name"].ToString(),
                                                        OrganizationId = orgId,
                                                        OrganizationStudyId = GenerateStudyIdByOrganization(protocolId, protocolNum, orgId)
                                                    };

                                // a list of insitutions where institution = organization in project
                                var allInstitutions = from inst in BOL.BusinessObject.GetAll<Institution>()
                                                      let institutionId = (int)inst[BOL.Institution.InstitutionId]
                                                      let institutionName = inst[BOL.Institution.Institution_Field].ToString()
                                                      select new
                                                                      {
                                                                          InstitutionId = institutionId,
                                                                          Institution = institutionName
                                                                      };
                                var orgs = from org in userOrganizations.AsEnumerable()
                                           select new
                                           {
                                               Name = org["Name"].ToString(),
                                               ShortName = org["ShortName"].ToString()
                                           };
                                // get institution where name matches an organization's name or short name
                                var institutions = from inst in allInstitutions
                                                   let institutionName = inst.Institution
                                                   let organization = orgs.Where(org => org.Name == institutionName || org.ShortName == institutionName).FirstOrDefault()
                                                   where organization != null
                                                   select new
                                                   {
                                                       Text = organization.Name,
                                                       Value = inst.InstitutionId
                                                   };

                                // build organizations
                                OrganizationStudyIds.DataSource = organizations;
                                OrganizationStudyIds.DataBind();


                                // build institutions
                                NewPatientInstitutionSelect.DataSource = institutions;
                                NewPatientInstitutionSelect.DataBind();


                                autoStudyId = organizations.Count()==1? organizations.First().OrganizationStudyId : "";

                                OrganizationStudyIds.Value = autoStudyId;

                                //OrganizationStudyIds.Enabled = false;
                                StudyID.Value = autoStudyId;
                            }
                        }
                    }

                    if (string.IsNullOrEmpty(autoStudyId))
                    {
                        StudyIdError.Visible = true;
                    }
                }

                // default screeing date
                //ScreeningDate.Value = DateTime.Today.ToShortDateString();

                PopulatePhysicians();

                // set search by particpant id type
                SeachTypeParticipantID.Text = PROTOCOL_PARTICIPANT_ID_CODE;

                // default participant id field
                ParticipantIdField.Text = GetNextParticipantId();

                // default radios and panel which can be seen by user
                DetermineUserSearchAccess();
            }
        }

        /// <summary>
        /// Determine a user's permission to search and add Patients
        /// </summary>
        protected void DetermineUserSearchAccess()
        {
            //AddNewPatient.Enabled = CanViewPatientInfo;
            //FindPatientFields.Visible = CanViewPatientInfo;
            //PatientSearchAjax.Enabled = CanViewPatientInfo;

            // User can search by identifiers
            SeachTypeMRN.Visible = CanViewPatientInfo;
            // Search by participant id when blinded
            SeachTypeMRN.Checked = CanViewPatientInfo;
            SeachTypeParticipantID.Checked = !CanViewPatientInfo;
            // User can search client
            SearchByClinicSection.Visible = CanViewPatientInfo;

            NewPatientSection.Visible = CanViewPatientInfo;

            // If cannot view identifiers, notify user
            DeIdentifiedNotice.Visible = !CanViewPatientInfo;
        }

        /// <summary>
        /// 
        /// </summary>
        private void PopulatePhysicians()
        {
            AppointmentDa aptDa = new AppointmentDa();
            FindPatientClinic.DataSource = aptDa.GetDistinctAppointmentPhysicians().Tables[0].DefaultView;
            FindPatientClinic.DataBind();
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void DoSave(object sender, EventArgs e)
        {
            try
            {
                if (ValidateForm())
                {
                    // REQUIRED
                    int protocolId = int.Parse(BaseProtocolId);

                    // STEP 1: Get PatientId
                    Patient patient = new Patient();
                    int ptId = -1;
                    if (CanViewPatientInfo)
                    {
                        if (AddNewPatient.Checked)
                        {
                            patient[Patient.PtFirstName] = NewFirstName.Value;
                            patient[Patient.PtLastName] = NewLastName.Value;
                            patient[Patient.PtMRN] = NewMRN.Value;
                            // If no name or mrn, enter notes to save record
                            patient[Patient.PtNotes] = "Protocol-Patient";
                            // insert records using controller
                            PatientController ct = new PatientController();
                            try
                            {
                                // insert new patient
                                InsertNewPatientRecord(patient);
                            }
                            catch (InvalidScreeningException ex)
                            {
                                throw ex;
                            }
                            // if cannot insert patient, already exits, warn user
                            catch (Exception ex)
                            {
                                throw new InvalidScreeningException("Select a new MRN, another patient with the same MRN already exists in the system.");
                            }
                            //if (patient.RecordCount > 0)
                            if (!patient.IsEmpty)
                            {
                                ptId = int.Parse(patient[Patient.PatientId].ToString());
                            }
                        }
                        // if using existing patient
                        else if (FindExistingPatient.Checked)
                        {
                            if (!string.IsNullOrEmpty(epid.Value))
                            {
                                ptId = int.Parse(DecrypyValue(epid.Value));
                            }
                        }
                    }
                    // if cannnot view PatientInfo, insert blinded info
                    else
                    {
                        patient[Patient.PtFirstName] = string.Empty;
                        patient[Patient.PtLastName] = string.Empty;
                        patient[Patient.PtMRN] = string.Empty;
                        patient[Patient.PtNotes] = "Blinded-Protocol-Patient";

                        // insert new patient
                        InsertNewPatientRecord(patient);

                        //if (patient.RecordCount > 0)
                        if (!patient.IsEmpty)
                        {
                            ptId = int.Parse(patient[Patient.PatientId].ToString());
                        }
                    }

                    // STEP 2: Create ParticipantID (if needed)
                    if (ptId != -1)
                    {
                        if (!PatientProtocolController.HasParticipantId(protocolId, ptId))
                        {
                            PatientProtocolController.CreateParticipantIdIdentifier(protocolId, ptId);
                        }
                    }

                    // VALIDATION: ensure non-duplicate PatientProtocol, via insert new patient
                    int? ptProtocolId = null;
                    var pp = BusinessObject.GetByFields<PatientProtocol>(
                        new Dictionary<string, object>
                        {
                              { PatientProtocol.ProtocolId, protocolId  },
                              { PatientProtocol.PatientId, ptId }
                        }
                    );
                    if (pp.Count() > 0)
                    {
                        ptProtocolId = (int)pp.First()[PatientProtocol.PatientProtocolId];
                    }

                    // STEP 3: Determine Pass or Fail, and create relevent records

                    // If screening failed, create empty PatientProtocol record to track screening
                    if (ScreeningFailed.Checked)
                    {
                        PatientProtocol ptProtocol = new PatientProtocol();
                        if (ptProtocolId.HasValue)
                        {
                            ptProtocol.Get(ptProtocolId.Value);
                        }
                        else
                        {
                            ptProtocol[PatientProtocol.PatientId] = ptId;
                            ptProtocol[PatientProtocol.ProtocolId] = protocolId;
                            ptProtocol[PatientProtocol.PtProtocolScreeningId] = PatientProtocolController.GenerateScreeningId();
                            ptProtocol.Save();
                        }
                        PatientProtocolStatus status = new PatientProtocolStatus();
                        status[PatientProtocolStatus.PatientProtocolId] = ptProtocol[PatientProtocol.PatientProtocolId];
                        status[PatientProtocolStatus.PtProtocolStatus] = PatientProtocolController.ScreeningFailed;

                        DateTime statusDate = DateTime.Today;
                        if (!string.IsNullOrEmpty(ScreeningDate.Value) && DateTime.TryParse(ScreeningDate.Value, out statusDate))
                        {
                            status[PatientProtocolStatus.PtProtocolStatusDate] = statusDate;
                            status[PatientProtocolStatus.PtProtocolStatusDateText] = statusDate.ToShortDateString();
                        }
                        else
                        {
                            status[PatientProtocolStatus.PtProtocolStatusDate] = DateTime.Today;
                            status[PatientProtocolStatus.PtProtocolStatusDateText] = DateTime.Today.ToShortDateString();
                        }
                        status[PatientProtocolStatus.PtProtocolStatusReason] = ReasonFailed.Value;
                        status[PatientProtocolStatus.PtProtocolStatusNotes] = ReasonFailedNotes.Value;
                        status.Save();
                    }
                    // If screening passed, create necessary records
                    else if (ScreeningPassed.Checked)
                    {
                        // Create PatientProtocol for Patient
                        PatientProtocol ptProtocol = new PatientProtocol();
                        if (ptProtocolId.HasValue)
                        {
                            ptProtocol.Get(ptProtocolId.Value);
                            bool doUpdate = false;
                            // update/ insert fields
                            if (ptProtocol.IsNull(PatientProtocol.PtProtocolStudyId))
                            {
                                ptProtocol[PatientProtocol.PtProtocolStudyId] = StudyID.Value;
                                doUpdate = true;
                            }
                            if (ptProtocol.IsNull(PatientProtocol.PtProtocolScreeningId))
                            {
                                ptProtocol[PatientProtocol.PtProtocolScreeningId] = PatientProtocolController.GenerateScreeningId();
                                doUpdate = true;
                            }
                            if (doUpdate)
                                ptProtocol.Save();
                        }
                        else
                        {
                            ptProtocol[PatientProtocol.ProtocolId] = protocolId;
                            ptProtocol[PatientProtocol.PatientId] = ptId;
                            ptProtocol[PatientProtocol.PtProtocolScreeningId] = PatientProtocolController.GenerateScreeningId();
                            ptProtocol[PatientProtocol.PtProtocolStudyId] = StudyID.Value;
                            ptProtocol.Save();
                        }

                        // CREATE STUDY ID IDENTIFIER
                        PatientProtocolController.CreateStudyIdIdentifier((int)ptProtocol[ptProtocol.PrimaryKeyName]);

                        // Create Registration Record
                        PatientProtocolRegistration registrationRecord = new PatientProtocolRegistration();
                        registrationRecord[PatientProtocolRegistration.PatientProtocolId] = ptProtocol[PatientProtocol.PatientProtocolId];
                        registrationRecord[PatientProtocolRegistration.ConsentedTo] = " ";
                        registrationRecord.Save();

                        PatientProtocolStatus status = new PatientProtocolStatus();
                        status[PatientProtocolStatus.PatientProtocolId] = ptProtocol[PatientProtocol.PatientProtocolId];
                        status[PatientProtocolStatus.PtProtocolStatus] = PatientProtocolController.ScreeningPassed;
                        DateTime statusDate = DateTime.Today;
                        if (!string.IsNullOrEmpty(ScreeningDate.Value) && DateTime.TryParse(ScreeningDate.Value, out statusDate))
                        {
                            status[PatientProtocolStatus.PtProtocolStatusDate] = statusDate;
                            status[PatientProtocolStatus.PtProtocolStatusDateText] = statusDate.ToShortDateString();
                        }
                        else
                        {
                            status[PatientProtocolStatus.PtProtocolStatusDate] = DateTime.Today;
                            status[PatientProtocolStatus.PtProtocolStatusDateText] = DateTime.Today.ToShortDateString();
                        }
                        status[PatientProtocolStatus.PtProtocolStatusNotes] = StudyNodes.Value;
                        status.Save();
                    }

                    // STEP 4: Register Client Script events

                    // Save and Close
                    if (sender == SaveBtn)
                    {
                        Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "saveAndClose", "saveAndClose();", true);
                    }
                    // Save and Load Registration Interface
                    else if (sender == ContinueBtn)
                    {
                        string script = "if(parent.patientAssigned) { parent.patientAssigned('" + protocolId + "','','" + EncryptValue(ptId.ToString()) + "'); }";
                        Page.ClientScript.RegisterStartupScript(this.GetType(), "OnPatientAssigned", script, true);
                    }
                    ErrorMessage.Text = "";
                }
            }
            catch (InvalidScreeningException invalidFormException)
            {
                ErrorMessage.Text = "Error:&nbsp;&nbsp;" + invalidFormException.Message;
            }
        }

        /// <summary>
        /// Inserts a new patient with relevant required dataset paramaters
        /// </summary>
        /// <param name="patient"></param>
        /// <returns></returns>
        private DataSet InsertNewPatientRecord(Patient patient)
        {
            PatientController ct = new PatientController();
            int sessionId =  (int)Session[SessionKey.DatasetId];
            int? institutionId = null;

            // if current dataset isn't mapped to institution, add institution based on user selection     
            if (!hasInstitutionDataset)
            {
                string institutionIdValue = NewPatientInstitutionSelect.Value;
                if (string.IsNullOrEmpty(institutionIdValue))
                {
                    throw new InvalidScreeningException("An Institution is required for adding a patient to this dataset.");
                }
                else
                {
                    institutionId = int.Parse(institutionIdValue);
                }
            }
            // insert patient
            DataSet dimensionDs = ct.InsertNewPatientRecord(patient, sessionId);
            // if an insitution is required, create dimension
            if (patient.PrimaryKeyHasValue && !hasInstitutionDataset && institutionId.HasValue)
            {
                int patientId = (int)patient[Patient.PatientId];
                PatientInstitution pi = new PatientInstitution();
                pi[PatientInstitution.PatientId] = patientId;
                pi[PatientInstitution.InstitutionId] = institutionId.Value;
                pi.Save();
            }
            // return new dimension
            return dimensionDs;
        }

        /// <summary>
        /// 
        /// </summary>
        /// <returns></returns>
        private bool ValidateForm()
        {
            List<string> errors = new List<string>();
            // if neither screening pas/fail checked
            if (!(ScreeningPassed.Checked || ScreeningFailed.Checked))
            {
                errors.Add("Please choose Passed or Failed.");
            }
                // if either check, validate if patient protocol exists
            else if (ScreeningPassed.Checked || ScreeningFailed.Checked)
            {
                if (FindExistingPatient.Checked && CanViewPatientInfo)
                {
                    if (string.IsNullOrEmpty(epid.Value))
                    {
                        errors.Add("No Patient found, please search for Patient again.");
                    }
                    // if using existing patient, validate not already assigned to this Protocol
                    else
                    {
                        int protocolId = int.Parse(BaseProtocolId);
                        int patientId = int.Parse(DecrypyValue(epid.Value));
                        PatientProtocolDa da = new PatientProtocolDa();
                        DataTable patientProtocolRecords = da.GetPatientProtocol(patientId, protocolId);
                        // if a PatientProtocol record already exists, ask user to go to registration page
                        if (patientProtocolRecords.Rows.Count > 0)
                        {
                            errors.Add("The selected patient has already been assigned to this protocol.");
                            // register script to ask user to go to Patient's registration page
                            DataTable patientSchemaRecords = ProtocolMgmtDa.GetPatientProtocolSchemasByProtocol(protocolId, patientId);
                            string schemaId = "";
                            // if patient has patient schema record
                            // ?? need to handle cases where on differnt arms
                            if (patientSchemaRecords.Rows.Count > 0)
                            {
                                schemaId = patientSchemaRecords.Rows[0][PatientSchema.ProtocolSchemaId].ToString();
                            }
                            string doCheck = "confirm('This patient has already been assigned to this Protocol, would you like to go to this patient\\'s Registration page?')";
                            string script = "if(parent.patientAssigned) { if(" + doCheck + ") { parent.patientAssigned('" + BaseProtocolId + "','" + schemaId + "','" + epid.Value + "'); } }";
                            Page.ClientScript.RegisterStartupScript(this.GetType(), "LoadExisitingPatientProtocol", script, true);
                        }
                    }
                }
            }
            else
            {
                errors.Add("Please verify that all required fields have been entered.");
            }
            // check study id
            if (ScreeningPassed.Checked)
            {
                if (StudyID.Value == string.Empty)
                {
                    errors.Add("Please choose a valid StudyId.");
                }
                // not empty, check if exits
                else
                {
                    if (ProtocolMgmtDa.StudyIdExists(StudyID.Value, int.Parse(BaseProtocolId)))
                    {
                        errors.Add("This Study Id '" + StudyID.Value + "' already exits, please choose another StudyId.");
                    }
                }
            }
            if (errors.Count>0)
            {
                string errorMessage = string.Join(" ", errors.ToArray());
                throw new InvalidScreeningException(errorMessage);
            }
            return true;
        }
               
        /// <summary>
        /// 
        /// </summary>
        /// <param name="patientId"></param>
        /// <returns></returns>
        protected string GetParticipantId(int patientId)
        {
            int protocolId = int.Parse(BaseProtocolId);
            return PatientProtocolController.GetParticipantId(protocolId, patientId);
        }

        /// <summary>
        /// 
        /// </summary>
        /// <returns></returns>
        protected string GetNextParticipantId()
        {
            int protocolId = int.Parse(BaseProtocolId);
            string generatedParticipantId = PatientProtocolController.GenerateParticipantId(protocolId);
            return generatedParticipantId;
        }        

        /// <summary>
        /// 
        /// </summary>
        /// <param name="patientList"></param>
        /// <returns></returns>
        protected DataTable GetPatientParticipantTable(DataTable patientList)
        {
            // ensure columns are normalized to ensure view identifier permissions
            PatientController pc = new PatientController();
            foreach (DataRow row in patientList.Rows)
            {
                string firstName = row[Patient.PtFirstName].ToString();
                string lastName = row[Patient.PtLastName].ToString();
                string mrn = row[Patient.PtMRN].ToString();
                row[Patient.PtFirstName] = pc.GetPatientFirstName(firstName);
                row[Patient.PtLastName] = pc.GetPatientLastName(lastName);
                row[Patient.PtMRN] = pc.GetPatientMRN(mrn);
                if (!CanViewPatientInfo)
                {
                    row[Patient.PtBirthDateText] = string.Empty;
                }

            }
            return patientList;
        }

        internal class InvalidScreeningException : Exception
        {
            public InvalidScreeningException(string message)
                : base(message)
            {
            }
        }

        // TODO: REFACTOR to Controller/DA
        private string GenerateStudyIdByOrganization(int protocolId, string protocolNum, int organizationId)
        {
            string generatedStudyId = string.Empty;

            int parseValue = -1;
            string strippedProtocolNum = protocolNum.Contains("-") ? protocolNum.Substring(protocolNum.LastIndexOf("-") + 1) : protocolNum;
            // cleanup version #, i.e., v1
            if (strippedProtocolNum.Length > 0)
            {
                var words = strippedProtocolNum.Split(' ');
                if (words.Length > 0)
                {
                    strippedProtocolNum = words[0];
                }
            }

            if (int.TryParse(strippedProtocolNum, out parseValue))
            {
                // note: retain padded 0s in full protocol #
                string normalizedProtocolNum = strippedProtocolNum;

                var organization = new ProjectOrganization();
                organization.Get(organizationId);
                string orgNum = organization[ProjectOrganization.OrgNum].ToString();

                // validation: requires OrgNum
                if (!string.IsNullOrEmpty(orgNum))
                {
                    // get a list of all Patients on Protocol
                    var patientProtocols = BusinessObject.GetByFields<PatientProtocol>(new Dictionary<string, object> { { PatientProtocol.ProtocolId, protocolId } });
                    List<int> normalizedStudyIds = new List<int>();
                    // for each patient, collection StudyId for trial
                    foreach (var patientProtocol in patientProtocols)
                    {
                        // full compound id
                        string fullStudyId = patientProtocol[PatientProtocol.PtProtocolStudyId].ToString();
                        // strip last 3 numbers for patient seq #
                        if (fullStudyId.Length >= 3)
                        {
                            string normalizedStudyId = fullStudyId.Substring(fullStudyId.Length - 3, 3);
                            // validate int, add to collection
                            if (int.TryParse(normalizedStudyId, out parseValue))
                            {
                                normalizedStudyIds.Add(int.Parse(normalizedStudyId));
                            }
                        }
                    }
                    // default
                    int nextNormalizedStudyId = 1;
                    // increment if patients currently assigned
                    if (normalizedStudyIds.Count() > 0)
                    {
                        // get next study id (current MAX + 1)
                        // TODO: MAX (i.e., 1, 2, 15, 16, then 17) or NEXT (i.e., 1, 2, 15, 16, then 3)
                        int maxNormalizedStudyId = normalizedStudyIds.Max();
                        nextNormalizedStudyId = maxNormalizedStudyId + 1;
                    }

                    // FORMAT: 2 digit org num + 3 digit protocol id + 3 digit incremental subject id
                    string nextFullStudyId = string.Format("{0:d2}{1:d3}{2:d3}", orgNum, normalizedProtocolNum, nextNormalizedStudyId);

                    return nextFullStudyId;
                }

            }

            return generatedStudyId;
        }
    }
}
