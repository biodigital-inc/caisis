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
using System.Xml.Linq;

using Caisis.BOL;
using Caisis.DataAccess;
using Caisis.UI.Core.Classes;
using Caisis.UI.Core.Classes.CustomControls;

namespace Caisis.UI.Modules.ProtocolMgmt
{
    public partial class PatientEligibility : ProtocolMgmtPatientBasePage
    {
        /// <summary>
        /// Represents the Computed Question Number column
        /// </summary>
        protected static readonly string QuestionNumberColumn = "QuestionNumberColumn";

        // Values inserted into PatientProtocolRegQuestionnaire.Response field depening on response
        private static readonly string RESPONSE_ELIGIBLE = "Eligible";
        private static readonly string RESPONSE_INELIGIBLE = "Ineligible";
        private static readonly string RESPONSE_NOTAPPLICABLE = "N/A";

        private static readonly Dictionary<string, string> CANNED_RESPONSES = new Dictionary<string, string>
        {
            { RESPONSE_ELIGIBLE, RESPONSE_ELIGIBLE },
            { RESPONSE_INELIGIBLE, RESPONSE_INELIGIBLE },
            { RESPONSE_NOTAPPLICABLE, RESPONSE_NOTAPPLICABLE },
        };

        /// <summary>
        /// name of client script used for triggering save click
        /// </summary>
        protected static readonly string DO_SAVE_INELIGIBLE = "doSaveIneligibile";

        private List<GridViewRow> dirtyRows = new List<GridViewRow>();

        private string protocolNumberText;
        public string ProtocolNumberText
        {
            get
            {
                if (protocolNumberText == null)
                {
                    Protocol biz = new Protocol();
                    biz.Get(int.Parse(BaseProtocolId));
                    protocolNumberText = biz[Protocol.ProtocolNum].ToString();
                }
                return protocolNumberText;
            }
        }

        protected string ProtocolVersionText = "";
        private int? versionId = null;
        private int? metaSurveyId = null;
        private int? registrationId = null;
        private bool enableOverrideBit = true;

        /// <summary>
        /// Gets whether there are records in the PatientProtocolRegQuestionnaire for this RegistrationId
        /// </summary>
        public bool HasRecords
        {
            get
            {
                if (registrationId.HasValue)
                {
                    return
                        BusinessObject.Count<PatientProtocolRegQuestionnaire>(new Dictionary<string, object> { {
                           PatientProtocolRegQuestionnaire.PatientProtocolRegistrationId, registrationId.Value } }) > 0;
                }

                return false;
            }
        }

        public PatientEligibility()
            : base()
        {
            this.Init += new EventHandler(SetProtocolVariables);
            this.PreRender += new EventHandler(SetQuestionaireVisibility);
        }

        protected override void Page_Load(object sender, EventArgs e)
        {
            // build patient survey
            if (!Page.IsPostBack)
            {
                BuildPatientEligibility();
            }
        }

        private void SetQuestionaireVisibility(object sender, EventArgs e)
        {
            if (PatientEligibilityGrid.Rows.Count == 0)
            {
                NoQuestionsLabel.Visible = true;
                MainContainer.Visible = false;
            }
            else
            {
                NoQuestionsLabel.Visible = false;
                MainContainer.Visible = true;
            }
        }
        /// <summary>
        /// Builds the patient questionnaire
        /// </summary>
        private void BuildPatientEligibility()
        {
            int ptProtocolId = int.Parse(PatientProtocolId);
            bool canEnterData = true;
            if (registrationId.HasValue)
            {
                if (!metaSurveyId.HasValue && !registrationId.HasValue)
                {
                    canEnterData = false;
                }
                else
                {
                    DataView questionsView = ProtocolMgmtDa.GetPatientQuestionnaire(metaSurveyId, registrationId).DefaultView;
                    PatientEligibilityGrid.DataSource = questionsView;
                    PatientEligibilityGrid.DataBind();

                    canEnterData = questionsView.Count > 0;
                }

            }

            // Update UI elements based on user being able to enter data
            CoverLayer.Visible = !canEnterData;
            UpdateBtn.Visible = canEnterData;

            // display Eligibility status
            EligibilityStatus.Visible = true;

            // determine eligibility
            if (metaSurveyId.HasValue && registrationId.HasValue)
            {
                bool? eligible = PatientProtocolController.IsPatientEligible(ptProtocolId, metaSurveyId.Value, registrationId.Value);
                string eligibleString = PatientProtocolController.PatientEligiblityString(eligible);
                EligibilityStatus.Text = eligibleString;
            }
            else
            {
                EligibilityStatus.Text = "Not Completed";
            }
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void SetProtocolVariables(object sender, EventArgs e)
        {
            int protocolId = int.Parse(BaseProtocolId);
            // inital values
            versionId = null;
            metaSurveyId = null;
            registrationId = null;
            ProtocolVersionText = "";

            // get most recent version with a survey
            var versions = from version in BOL.BusinessObject.GetByParent<ProtocolVersion>(protocolId)
                           where !version.IsNull(ProtocolVersion.MetadataSurveyId)
                           orderby (int)version[ProtocolVersion.ProtocolVersionId] descending
                           select version;
            // get version + meta survey
            if (versions.Count() > 0)
            {
                ProtocolVersion version = versions.First();
                metaSurveyId = int.Parse(version[ProtocolVersion.MetadataSurveyId].ToString());
                versionId = (int)version[ProtocolVersion.ProtocolVersionId];
                ProtocolVersionText = "Version " + version[ProtocolVersion.VersionNumber].ToString();
            }
            // get registration
            if (!string.IsNullOrEmpty(PatientProtocolId))
            {
                // Check for Registration record
                var registrationRecord = BusinessObject.GetByParent<PatientProtocolRegistration>(int.Parse(PatientProtocolId)).FirstOrDefault();
                if (registrationRecord != null)
                {
                    registrationId = (int)registrationRecord[PatientProtocolRegistration.PatientProtocolRegistrationId];
                }
            }
        }

        /// <summary>
        /// Manually build a list of responses
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void SetQuestionnaireResponses(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowIndex > -1)
            {
                // v6.x
                string questionIdValue = "";
                // get meta question id
                if (e.Row.DataItem != null)
                    questionIdValue = DataBinder.Eval(e.Row.DataItem, MetadataSurveyQuestion.MetadataSurveyQuestionId).ToString();
                else
                    questionIdValue = (e.Row.FindControl("MetaQuestionIdField") as HiddenField).Value;
                int? questionId = null;
                if (!string.IsNullOrEmpty(questionIdValue))
                    questionId = int.Parse(questionIdValue);

                // create input control
                Control responseContainer = e.Row.FindControl("ResponsesContainer");
                CaisisRadioButtonList responseRadioBtns = new CaisisRadioButtonList();

                Dictionary<string, string> radioResponses = GetRowResponses(questionId);
                bool isCanned = radioResponses == CANNED_RESPONSES;
                if (isCanned)
                    responseRadioBtns.CssClass = "canned";
                responseRadioBtns.SelectedIndexChanged += SaveCheckRow;
                responseRadioBtns.Uncheckable = true;
                responseRadioBtns.ShowEmptyListItem = false;
                responseRadioBtns.ShowOther = false;
                responseRadioBtns.ID = "ResponsesRadioBtns";
                responseRadioBtns.AppendDataBoundItems = false;
                responseRadioBtns.DataTextField = "Key";
                responseRadioBtns.DataValueField = "Value";
                responseRadioBtns.DataSource = radioResponses;
                responseRadioBtns.DataBind();

                // add to container
                responseContainer.Controls.Add(responseRadioBtns);
            }
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void SetQuestionnaireRadio(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                // always need to set question number label
                string question = DataBinder.Eval(e.Row.DataItem, PatientProtocolRegQuestionnaire.Question).ToString();
                string questionNumber = DataBinder.Eval(e.Row.DataItem, PatientProtocolRegQuestionnaire.QuestionNum).ToString();
                Label questionLabel = e.Row.FindControl("QuestionLabel") as Label;
                Label questionNumLabel = e.Row.FindControl("QuestionNumLabel") as Label;
                questionLabel.Text = question;
                questionNumLabel.Text = questionNumber;

                // set QuestionIdField field
                string metaQuestionId = DataBinder.Eval(e.Row.DataItem, MetadataSurveyQuestion.MetadataSurveyQuestionId).ToString();
                HiddenField metaQuestionIdField = e.Row.FindControl("MetaQuestionIdField") as HiddenField;
                metaQuestionIdField.Value = metaQuestionId;

                // Set RegQuestioId for updates
                string regQuestionId = DataBinder.Eval(e.Row.DataItem, PatientProtocolRegQuestionnaire.PatientProtocolRegQuestionnaireId).ToString();
                HiddenField regQuestionIdField = e.Row.FindControl("RegQuestionIdField") as HiddenField;
                regQuestionIdField.Value = regQuestionId;

                // Popualate hidden fields
                HiddenField regIneligibleOverride = e.Row.FindControl("InEligibleRadioHidden") as HiddenField;
                string overrideBit = DataBinder.Eval(e.Row.DataItem, PatientProtocolRegQuestionnaire.IneligibleResponseOverride).ToString();
                regIneligibleOverride.Value = !string.IsNullOrEmpty(overrideBit) ? (bool.Parse(overrideBit) ? "1" : "") : "";
                HiddenField regIneligibleOverrideReason = e.Row.FindControl("InEligibleRadioReason") as HiddenField;
                regIneligibleOverrideReason.Value = DataBinder.Eval(e.Row.DataItem, PatientProtocolRegQuestionnaire.IneligibleOverrideReason).ToString();


                // v6.x
                bool isr = !string.IsNullOrEmpty(regQuestionId);
                // set response + add scripts
                string questionResponse = DataBinder.Eval(e.Row.DataItem, PatientProtocolRegQuestionnaire.Response).ToString();

                CaisisRadioButtonList responseRadioBtns = e.Row.FindControl("ResponsesContainer").Controls[0] as CaisisRadioButtonList;
                bool responseFound = false;
                bool isCanned = responseRadioBtns.CssClass == "canned";
                responseRadioBtns.Value = questionResponse;
                foreach (ListItem responseItem in responseRadioBtns.Items)
                {
                    string responseValue = responseItem.Value;
                    // if current response equal values, check
                    if (!responseFound && !string.IsNullOrEmpty(responseValue) && questionResponse.Equals(responseValue, StringComparison.OrdinalIgnoreCase))
                    {
                        // responseItem.Selected = true;
                        //responseFound = true;
                    }
                    // add scripts: only in default cases
                    if (isCanned)
                        responseItem.Attributes["onclick"] = "onResponseSelected(this, '" + PageUtil.EscapeSingleQuotes(responseValue) + "', event);";
                }
            }
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void SaveCheckRow(object sender, EventArgs e)
        {
            GridViewRow updateRow = (sender as Control).NamingContainer as GridViewRow;
            if (!dirtyRows.Contains(updateRow))
                dirtyRows.Add(updateRow);
        }

        /// <summary>
        /// Returns the DataView with a computed question number column specified by QuestionNumberColumn string.
        /// Used for normalizing QuestionColumn from different data sources.
        /// </summary>
        /// <param name="view"></param>
        /// <returns></returns>
        private DataView GetQuestionaireDataSource(DataView view, string questionColumn)
        {
            if (!view.Table.Columns.Contains(QuestionNumberColumn))
            {
                DataColumn computedColumn = new DataColumn(QuestionNumberColumn, typeof(String), questionColumn);
                view.Table.Columns.Add(computedColumn);
            }
            return view;
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void UpdateEligibilityClick(object sender, EventArgs e)
        {
            int ptProtocolId = int.Parse(PatientProtocolId);
            // A registaion record is needed to save questions, create one if needed
            if (!registrationId.HasValue)
            {
                PatientProtocolRegistration patientReg = new PatientProtocolRegistration();
                patientReg[PatientProtocolRegistration.PatientProtocolId] = ptProtocolId;
                patientReg[PatientProtocolRegistration.ResearchAuthorizationSigned] = " ";
                patientReg.Save();
                // set pri key fields for updating questions
                registrationId = (int)patientReg[PatientProtocolRegistration.PatientProtocolRegistrationId];
            }
            // determine if bulk update (first insert), or only updating changed rows
            bool doBulkUpdate = true;// !HasRecords;
            SaveQuestionnaire(doBulkUpdate);
            
            // special case: go to summary
            if (!string.IsNullOrEmpty(InEligibleBit.Value))
            {
                Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "GoToSummary", "goToSummary();", true);
            }

            BuildPatientEligibility();
            UpdateMessage.Visible = true;
        }

        /// <summary>
        /// Updates/inserts questions
        /// </summary>
        /// <param name="bulkUpdate"></param>
        private void SaveQuestionnaire(bool bulkUpdate)
        {
            foreach (GridViewRow row in PatientEligibilityGrid.Rows)
            {
                if (bulkUpdate || dirtyRows.Contains(row))
                    SaveRow(row);
            }
            dirtyRows.Clear();
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="row"></param>
        private void SaveRow(GridViewRow row)
        {
            // v6.x
            CaisisRadioButtonList responseRadioBtns = row.FindControl("ResponsesContainer").Controls[0] as CaisisRadioButtonList;

            HiddenField regQuestionIdField = row.FindControl("RegQuestionIdField") as HiddenField;
            Label questionNumLabel = row.FindControl("QuestionNumLabel") as Label;
            Label questionLabel = row.FindControl("QuestionLabel") as Label;

            HiddenField iRadioHidden = row.FindControl("InEligibleRadioHidden") as HiddenField;
            HiddenField iRadioReason = row.FindControl("InEligibleRadioReason") as HiddenField;

            // determine Response (default empty)
            // TODO: bug fix: Value not correctly set for unselected radio
            string questionResponse = Request.Form[responseRadioBtns.UniqueID];

            //string questionResponse = (responseRadioBtns.OtherListItem != null && responseRadioBtns.OtherListItem.Selected ? responseRadioBtns.OtherListItem.Value : Request.Form[responseRadioBtns.UniqueID]) + "";// responseRadioBtns.Value;// responseRadioBtns.SelectedItem != null ? responseRadioBtns.SelectedItem.Value : "";

            // Values for save
            string regQuestionId = regQuestionIdField.Value;
            string questionNum = questionNumLabel.Text;
            string question = questionLabel.Text;
            string overrideIneligible = iRadioHidden.Value;
            string overrideReason = iRadioReason.Value;

            // Save/Update record
            SaveEligibilityQuestion(registrationId.Value, regQuestionId, questionNum, question, questionResponse, overrideIneligible, overrideReason);
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="registrationId"></param>
        /// <param name="regQuestionId"></param>
        /// <param name="questionNum"></param>
        /// <param name="question"></param>
        /// <param name="response"></param>
        /// <param name="overrideIneligible"></param>
        /// <param name="overrideReason"></param>
        private void SaveEligibilityQuestion(int registrationId, string regQuestionId, string questionNum, string question, string response, string overrideIneligible, string overrideReason)
        {
            bool isIneligible = (response + "").StartsWith(RESPONSE_INELIGIBLE, StringComparison.OrdinalIgnoreCase);
            PatientProtocolRegQuestionnaire biz = new PatientProtocolRegQuestionnaire();
            // Determine if updating
            if (!string.IsNullOrEmpty(regQuestionId))
                biz.Get(int.Parse(regQuestionId));
            biz[PatientProtocolRegQuestionnaire.PatientProtocolRegistrationId] = registrationId;
            biz[PatientProtocolRegQuestionnaire.QuestionNum] = questionNum;
            biz[PatientProtocolRegQuestionnaire.Question] = question;
            biz[PatientProtocolRegQuestionnaire.Response] = response;
            // special case
            biz[PatientProtocolRegQuestionnaire.IneligibleResponseOverride] = isIneligible ? overrideIneligible : "";
            biz[PatientProtocolRegQuestionnaire.IneligibleOverrideReason] = isIneligible ? overrideReason : "";
            biz.Save();
        }

        /// <summary>
        /// Registers a client script for trigger save click
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void RegisterUpdateScript(object sender, EventArgs e)
        {
            PostBackOptions pbo = new PostBackOptions(UpdateBtn);
            string pbScript = "function " + DO_SAVE_INELIGIBLE + "() { " + Page.ClientScript.GetPostBackEventReference(pbo) + " }";
            Page.ClientScript.RegisterStartupScript(this.GetType(), DO_SAVE_INELIGIBLE, pbScript, true);
        }

        /// <summary>
        /// Get a list of responses for the question
        /// </summary>
        /// <param name="questionId"></param>
        /// <returns></returns>
        private Dictionary<string, string> GetRowResponses(int? questionId)
        {
            Dictionary<string, string> responses = new Dictionary<string, string>();
            if (questionId.HasValue)
            {
                responses = BOL.BusinessObject.GetByParent<MetadataQuestionResponse>(questionId.Value).ToDictionary(
                        q => q[MetadataQuestionResponse.ResponseText].ToString(),
                        q => q[MetadataQuestionResponse.ResponseValue].ToString()
                );
            }
            return responses.Count() > 0 ? responses : CANNED_RESPONSES;
        }
    }
}