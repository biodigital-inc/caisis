using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Collections.Specialized;
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
using Caisis.UI.Core;
using Caisis.UI.Core.Classes;
using Caisis.UI.Core.Classes.CustomControls;

namespace Caisis.UI.Plugins.SurveyPlugin
{
    public partial class SurveyWizardPage : System.Web.UI.Page
    {
        /// <summary>
        /// Defines the length of the Data Entry View of a Survey
        /// </summary>
        public enum SurveyLengthType
        {
            Short,
            Long
        }

        /// <summary>
        /// The string appended to entered by when using wizard to enter survey record
        /// </summary>
        private static readonly string ENTERED_BY_SURVEY = "survey";

        /// <summary>
        /// Contains a list of Responses which have changed during postback, only these controls will be updated/saved
        /// </summary>
        List<string> dirtyCaisisResponseIDs = new List<string>();

        private bool DoSurveyUpdate = false;

        /// <summary>
        /// The ID used to Identify the "Response" field of the form (unique in rptrs)
        /// </summary>
        private static readonly string ICIC_RESPONSE_CONTROL_ID = "QuestionResponse";

        /// <summary>
        /// The default ICaisisInputControl to display a question's responese
        /// </summary>
        private static readonly string ICIC_DEFAULT_TYPE_NAME = "CaisisTextBox";

        /// <summary>
        /// Expression to sort Questions within a Section
        /// </summary>
        private static readonly string QUESTION_SORT_EXPRESSION = MetadataSurveyQuestion.SortNumber + " ASC";

        /// <summary>
        /// Provides access to data access methods for getting survey and survey metadata info
        /// </summary>
        private SurveyDa _surveyData = new SurveyDa();

        /// <summary>
        /// Determines if the Dropdown lists of surveuy should be locked
        /// </summary>
        private bool surveyTypeLocked = true;

        /// <summary>
        /// Gets or set the type of Survey (Long or Short)
        /// </summary>
        protected SurveyLengthType SurveyLength
        {
            get
            {
                if (string.IsNullOrEmpty(ViewType.Value))
                {
                    ViewType.Value = SurveyLengthType.Long.ToString();
                }
                return (SurveyLengthType)Enum.Parse(typeof(SurveyLengthType), ViewType.Value, true);
            }
            set
            {
                ViewType.Value = value.ToString();
            }
        }

        private DataTable pagesTable;
        private DataTable questionsTable;
        private DataTable sectionsTable;

        /// <summary>
        /// Gets a list of Pages for the current Survey
        /// </summary>
        private DataTable PagesTable
        {
            get
            {
                if (pagesTable == null)
                {
                    InitSurveyDataSources();
                }
                return pagesTable;
            }
        }

        /// <summary>
        /// Gets all the questions which belong to a Survey
        /// </summary>
        private DataTable AllSurveyQuestions
        {
            get
            {
                if (questionsTable == null)
                {
                    InitSurveyDataSources();                    
                }
                return questionsTable;
            }
        }

        /// <summary>
        /// Get a list of all survey sections
        /// </summary>
        private DataTable AllSurveySections
        {
            get
            {
                if (sectionsTable == null)
                {
                    InitSurveyDataSources();
                }
                return sectionsTable;
            }
        }

        /// <summary>
        /// Gets the total number of pages in this Survey
        /// </summary>
        protected int SurveyPageCount
        {
            get
            {
                return PagesTable.Rows.Count;
            }
        }

        /// <summary>
        /// Gets if this is a preview page
        /// </summary>
        private bool IsPreviewPage
        {
            get
            {
                return !string.IsNullOrEmpty(Request.QueryString["preview"]) && Request.QueryString["preview"].Equals(bool.TrueString.ToLower());
            }
        }

        /// <summary>
        /// Returns the page index passed in query string
        /// </summary>
        private string QueryPage
        {
            get
            {
                return Request.QueryString["page"];
            }
        }

        private bool showAllPages = false;
        /// <summary>
        /// Gets or sets if all pages are shown for multi-page surveys
        /// </summary>
        private bool ShowAllPages
        {
            get
            {
                return showAllPages;
            }
            set
            {
                showAllPages = value;
            }
        }

        /// <summary>
        /// Gets if a patient is in Session
        /// </summary>
        private bool PatientInSession
        {
            get
            {
                object patientIdInSession = Session[SessionKey.PatientId];
                return patientIdInSession != null && !string.IsNullOrEmpty(patientIdInSession.ToString());
            }
        }

        /// <summary>
        /// Gets or sets the page number of the current form (0 based index).
        /// </summary>
        public int PageNumber
        {
            get
            {
                return int.Parse(PageNumberField.Value);
            }
            set
            {
                PageNumberField.Value = value.ToString();
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                string querySurveyId = Request.QueryString["surveyId"];
                string querySurveyType = Request.QueryString["surveyType"];
                string queryViewType = Request.QueryString["viewType"];
                string queryReadOnly = Request.QueryString["readOnly"];
                string surveyType = string.Empty;

                // load and populate survey is survey id exists
                if (!string.IsNullOrEmpty(querySurveyId))
                {
                    // set pri key field
                    SurveyIdField.Value = querySurveyId;

                    // load record
                    int surveyId = int.Parse(querySurveyId);
                    Survey biz = new Survey();
                    biz.Get(surveyId);
                    surveyType = biz[Survey.SurveyType].ToString();

                    // populate main survey form
                    PopulateSurveyRecord();

                    // show all pages when updating
                    ShowAllPages = true;
                }

                // persist user fields passed in query string
                DefaultSurveyFieldFromURLParams();

                // Set survey type if not already defaulted by patient survey record
                if (string.IsNullOrEmpty(surveyType) && !string.IsNullOrEmpty(querySurveyType))
                {
                    surveyType = querySurveyType;
                }
                if (!string.IsNullOrEmpty(queryViewType))
                {
                    SurveyLength = queryViewType.Equals("short", StringComparison.CurrentCultureIgnoreCase) ? SurveyLengthType.Short : SurveyLengthType.Long;
                }
                if (!string.IsNullOrEmpty(queryReadOnly))
                {
                    surveyTypeLocked = bool.Parse(queryReadOnly);
                    // By default, survey chooser hidden, enable if readonly false
                    if (!surveyTypeLocked)
                    {
                        SurveyChoserPanel.Visible = true;
                    }
                }
                // default page number
                if (!string.IsNullOrEmpty(QueryPage))
                {
                    int parsePage;
                    // show all pages
                    if (QueryPage.Equals("all", StringComparison.CurrentCultureIgnoreCase))
                    {
                        showAllPages = true;
                    }
                    else if (int.TryParse(QueryPage, out parsePage))
                    {
                        PageNumber = parsePage;
                        showAllPages = false;
                    }                    
                }

                // build list of meta surveys and choose based on query string of patient survey
                BuildSurveyList();

                // Determine what the inital Survey is selected, if any
                if (!string.IsNullOrEmpty(surveyType))
                {
                    // Locate Survey in List of Surveys
                    ListItem foundSurvey = SurveyList.Items.FindByText(surveyType);
                    if (foundSurvey != null)
                    {
                        SurveyList.Value = foundSurvey.Value;
                    }
                }

                // build survey questions
                BindQuestions();

                // When in data entry mode and no patient in session, cannot proceed with data entry
                if (!PatientInSession && !IsPreviewPage)
                {
                    Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "_noPatient", "notifyNoPatient();", true);
                }
            }
            RegisterClientSaveScript();
            RegitserSurveyClientFields();
        }
		
		/// <summary>
        /// Sets optional survey data based on Survey
        /// </summary>
        /// <param name="survey"></param>
        private bool SetOptionalSurveyData(Survey survey)
        {
            if(!survey.PrimaryKeyHasValue)
                return false;
            string surveyType = survey[Survey.SurveyType].ToString();
            DateTime? surveyDate = null;
            if (!survey.IsNull(Survey.SurveyDateText))
            {
                surveyDate = DateTime.Parse(survey[Survey.SurveyDateText].ToString());
            }
            if (!string.IsNullOrEmpty(surveyType) && surveyDate.HasValue)
            {
                string sexualAssessmentSurveyType = "SexualMedicineAssessmentSurveyResults";
                var userReports = Caisis.Controller.ReportConfigurations.LoadFromXml(Caisis.Controller.ReportConfigurationType.User);
                if (userReports.ContainsKey(sexualAssessmentSurveyType))
                {
                    // load patient
                    Patient ptBiz = new Patient();
                    ptBiz.Get((int)survey[Survey.PatientId]);
                    string ptMRN = ptBiz[Patient.PtMRN].ToString();

                    var assessmentReport = userReports[sexualAssessmentSurveyType];
                    AdminReportsDa da = new AdminReportsDa();
                    string datasetSql = CacheManager.GetDatasetSQL(System.Web.HttpContext.Current.Session[SessionKey.DatasetId]);
                    string sql = assessmentReport.StoredProcedure;
                    object patientIdInSession = Session[SessionKey.PatientId];
                    // get report params
                    Dictionary<string, string> paramValues = GetBaseReportParams();
                    // add specialized params
                    paramValues.Add("FromDate", surveyDate.Value.ToShortDateString());
                    paramValues.Add("ToDate", surveyDate.Value.AddDays(1).ToShortDateString());
                    // get report
                    DataTable reportData = da.GetAdminReport(datasetSql, sql, paramValues, false).Tables[0];
                    // locate patient
                    var patientSurveyData = from row in reportData.AsEnumerable()
                                            let rowPtMrn = row["MRN"].ToString()
                                            where ptMRN == rowPtMrn
                                            let rowSurveyDate = row["Survey Date"].ToString()
                                            where !string.IsNullOrEmpty(rowSurveyDate) && PageUtil.IsDate(rowSurveyDate)
                                            let sDate = DateTime.Parse(rowSurveyDate)
                                            where sDate.ToShortDateString() == surveyDate.Value.ToShortDateString()
                                            select row;
                    if (patientSurveyData.Count() > 0)
                    {
                        DataRow scoresRow = patientSurveyData.First();
                        string sourceNotes = survey[Survey.SurveyNotes].ToString();
                        string[] sourceLines = sourceNotes.Split('\n').Select(line => line.TrimEnd("\r".ToCharArray())).ToArray();
                        var columns = new KeyValuePair<string, string>[]
                        {
                            new KeyValuePair<string, string>( "FSFI Score", "FSFI" ),
                            new KeyValuePair<string, string>( "SSS Score",  "SSS" ),
                            new KeyValuePair<string, string>( "Total VAS Score", "Total VAS" ),
                            new KeyValuePair<string, string>( "Composite VAS Score", "Composite VAS" )
                        };
                        List<string> newLines = new List<string>();
                        for (int i = 0; i < columns.Length; i++)
                        {
                            string column = columns[i].Key;
                            string displayName = columns[i].Value;
                            string value = scoresRow[column].ToString();
                            if (string.IsNullOrEmpty(value))
                                continue;
                            string displayValue = displayName + " : " + value;
                            bool exists = false;
                            for (int j = 0; j < sourceLines.Length; j++)
                            {
                                string sourceLine = sourceLines[j];
                                // replace current line
                                if (sourceLine.StartsWith(displayName))
                                {
                                    sourceLines[j] = displayValue;
                                    exists = true;
                                    break;
                                }                               
                            }
                            if(!exists)
                                newLines.Add(displayValue);
                        }
                        var buffer = sourceLines.Concat(newLines).ToArray();
                        string notes = string.Join("\n", buffer);
                        survey[Survey.SurveyNotes] = notes;

                        return true;
                    }
                }
            }
            return false;
        }

        /// <summary>
        /// Returns a list of default paramaters for use on reports
        /// </summary>
        /// <returns></returns>
        private Dictionary<string, string> GetBaseReportParams()
        {
            int patientIdInSession = int.Parse(Session[SessionKey.PatientId].ToString());
            Patient patient = new Patient();
            patient.Get(patientIdInSession);
            return new Dictionary<string, string>
            {
                { Patient.PatientId, patient[Patient.PatientId].ToString() },
                { Patient.PtMRN, patient[Patient.PtMRN].ToString() }
            };
        }

        /// <summary>
        /// Regitser client scripts for invoking click events client side.
        /// </summary>
        private void RegisterClientSaveScript()
        {
            PageUtil.RegitserControlPostBackScript(SaveBtn, "_doSurveySaveClick");
            PageUtil.RegitserControlPostBackScript(BackBtn, "_doSurveyBackClick");
            PageUtil.RegitserControlPostBackScript(NextBtn, "_doSurveyNextClick");
        }

        /// <summary>
        /// Regitsers a double array of survey client fields and client ids
        /// </summary>
        private void RegitserSurveyClientFields()
        {
            var clientIds = from field in CICHelper.GetCaisisInputControlDictionary(SurveyFields)
                            where field.Key != "SurveyType"
                            select "['" + field.Key + "', '" + (field.Value as Control).ClientID + "']";
            string clientIdList = string.Join(",", clientIds.ToArray());
            Page.ClientScript.RegisterArrayDeclaration("SURVEY_CLIENT_IDS", clientIdList);
        }

        /// <summary>
        /// Initilizes DataTable for survey pages, sections and questions based on survey metadata and patient survey data.
        /// </summary>
        private void InitSurveyDataSources()
        {
            // check key values
            int? metaSurveyId = null;
            int? surveyId = null;
            if (!string.IsNullOrEmpty(SurveyList.Value))
            {
                metaSurveyId = int.Parse(SurveyList.Value);
            }
            if (!string.IsNullOrEmpty(SurveyIdField.Value))
            {
                surveyId = int.Parse(SurveyIdField.Value);
            }
            // working with survey metadata
            if (metaSurveyId.HasValue)
            {
                // working with survey metadata merged with patient survey
                if (surveyId.HasValue)
                {
                    pagesTable = _surveyData.GetPatientMetaSurveyPages(metaSurveyId.Value, surveyId.Value);
                    sectionsTable = _surveyData.GetPatientMetaSurveySections(metaSurveyId.Value, surveyId.Value);
                    questionsTable = _surveyData.GetPatientMetaSurvey(metaSurveyId.Value, surveyId.Value);
                }
                // otherwise working directly with survey metadat
                else
                {
                    pagesTable = _surveyData.GetPatientMetaSurveyPages(metaSurveyId.Value);
                    sectionsTable = _surveyData.GetPatientMetaSurveySections(metaSurveyId.Value);
                    questionsTable = _surveyData.GetPatientMetaSurvey(metaSurveyId.Value);
                }
            }
            // working with survey data directly
            else if (surveyId.HasValue)
            {
                pagesTable = _surveyData.GetPatientMetaSurveyPages(null, surveyId.Value);
                sectionsTable = _surveyData.GetPatientMetaSurveySections(null, surveyId.Value);
                questionsTable = _surveyData.GetPatientMetaSurvey(null, surveyId.Value);
            }
        }

        /// <summary>
        /// Sets Survey field values based on query string where query key = Field Name
        /// </summary>
        private void DefaultSurveyFieldFromURLParams()
        {
            IDictionary<string, ICaisisInputControl> cicList = CICHelper.GetCaisisInputControlDictionary(SurveyFields);
            var fieldNames = new Caisis.BOL.Survey().FieldNames;
            foreach (string fieldName in fieldNames)
            {
                // don't persist survey type
                if (fieldName != Survey.SurveyType)
                {
                    string queryValue = Request.QueryString[fieldName];
                    // if value is passed in query string, update
                    if (!string.IsNullOrEmpty(queryValue) && cicList.ContainsKey(fieldName))
                    {
                        ICaisisInputControl iCIC = cicList[fieldName];
                        iCIC.Value = queryValue;
                    }
                }
            }
        }

        /// <summary>
        /// Builds a list of all avilable Survey's
        /// </summary>
        private void BuildSurveyList()
        {
            SurveyList.DataSource = BusinessObject.GetAllAsDataView<MetadataSurvey>();
            SurveyList.DataBind();
        }

        private void PopulateSurveyRecord()
        {
            if (!string.IsNullOrEmpty(SurveyIdField.Value))
            {
                int surveyId = int.Parse(SurveyIdField.Value);
                Survey biz = new Survey();
                biz.Get(surveyId);

                // Set Fields from BusinessObject
                CICHelper.SetFieldValues(SurveyFields.Controls, biz);
            }
        }

        /// <summary>
        /// Determine if button should be enabled/disabled based on SHORT or LONG Survey
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void SetBtnAction(object sender, EventArgs e)
        {
            if (sender == LongViewBtn)
            {
                bool isEnabled = SurveyLength == SurveyLengthType.Short;
                LongViewBtn.Visible = isEnabled;
                if (isEnabled)
                {
                    LongViewBtn.NavigateUrl = GetNavigateUrl(SurveyLengthType.Long);
                }
                else
                {
                    LongViewBtn.CssClass = "ViewTabBtnDisabled";
                    LongViewBtn.ToolTip = string.Empty;
                    LongViewBtn.NavigateUrl = "#";
                    LongViewBtn.Attributes.Remove("onclick");
                }
            }
            else if (sender == ShortViewBtn)
            {
                bool isEnabled = SurveyLength == SurveyLengthType.Long;
                ShortViewBtn.Visible = isEnabled;
                if (isEnabled)
                {
                    ShortViewBtn.NavigateUrl = GetNavigateUrl(SurveyLengthType.Short);
                }
                else
                {
                    ShortViewBtn.CssClass = "ViewTabBtnDisabled";
                    ShortViewBtn.ToolTip = string.Empty;
                    ShortViewBtn.NavigateUrl = "#";
                    ShortViewBtn.Attributes.Remove("onclick");
                }
            }
        }

        /// <summary>
        /// During rendering, derteremine which buttons are hidden or visible
        /// </summary>
        /// <param name="writer"></param>
        protected override void Render(HtmlTextWriter writer)
        {
            // Determine navigation
            DeterminePageNavigation();
            base.Render(writer);
        }

        #region Build Short or Long View of Survey

        /// <summary>
        /// Builds the short version of a survey
        /// </summary>
        protected void BindShortView()
        {
            BuildSurveyView(SurveyLengthType.Short);

            // short survey will build all questions
            DataView questionsView = AllSurveyQuestions.DefaultView;
            questionsView.Sort = QUESTION_SORT_EXPRESSION;

            ShortViewQuestionRptr.DataSource = questionsView;
            ShortViewQuestionRptr.DataBind();

            // only 1 page on short view
            ShowAllBtn.Visible = false;
        }

        /// <summary>
        /// Builds a list of a long survey
        /// </summary>
        protected void BindLongView()
        {
            BuildSurveyView(SurveyLengthType.Long);
            // display a list of pages (default to 1 page)
            string[] pages = new string[] { };
            // validate there is at least 1 page for this survey
            if (PagesTable.Rows.Count > 0)
            {
                // showing all pages
                if (ShowAllPages)
                {
                    // array of all pages
                    pages = (from row in PagesTable.AsEnumerable()
                             let page = row[MetadataSurveyQuestion.Page].ToString()
                             select page).ToArray();

                    ShowAllBtn.Visible = false;
                }
                // otherwise show page by page index
                else
                {
                    // no need for btn on single page
                    if (PagesTable.Rows.Count == 1)
                    {
                        ShowAllBtn.Visible = false;
                    }
                    else
                    {
                        ShowAllBtn.Visible = true;
                    }

                    // page number should be 0 based index in page list
                    int pageIndex = PageNumber < PagesTable.Rows.Count ? PageNumber : 0;
                    string pageName = PagesTable.Rows[PageNumber][MetadataSurveyQuestion.Page].ToString();

                    // array of single page
                    pages = new string[] { pageName };
                }
            }
            else
            {
                ShowAllBtn.Visible = false;
            }

            // long survey will build, pages -> sections -> questions
            SurveyPageRptr.DataSource = pages;
            SurveyPageRptr.DataBind();
        }

        /// <summary>
        /// Sets panel visibilty and titles for the specified type of survey length
        /// </summary>
        /// <param name="type"></param>
        private void BuildSurveyView(SurveyLengthType type)
        {
            // set global type
            SurveyLength = type;
            // set panel visibilty
            ShortView.Visible = type == SurveyLengthType.Short;
            LongView.Visible = type == SurveyLengthType.Long;

            string metaSurveyType = SurveyList.SelectedItem.Text;

            SurveyTitle.Text = metaSurveyType;
        }
        #endregion

        #region Repeater DataBinding/Render Events

        /// <summary>
        /// Binds a list of sections for a page
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void BindPageSections(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                string pageTitle = e.Item.DataItem.ToString();// DataBinder.Eval(e.Item.DataItem, MetadataSurveyQuestion.Page).ToString();

                DataView pageSectionsList = AllSurveySections.DefaultView;//_surveyData.GetSurveySections(int.Parse(SurveyList.Value)).DefaultView;
                pageSectionsList.RowFilter = GetColumnFilterExpression(MetadataSurveyQuestion.Page, pageTitle, string.Empty);

                // Sections are bound to page
                Repeater pageSectionRptr = e.Item.FindControl("PageSectionsRptr") as Repeater;
                pageSectionRptr.DataSource = pageSectionsList;
                pageSectionRptr.DataBind();
            }
        }

        /// <summary>
        /// Binds questions in Each Section (LONG SURVEY)
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void BindSectionQuestions(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                string metaSection = DataBinder.Eval(e.Item.DataItem, MetadataSurveyQuestion.Section).ToString();
                string metaPage = DataBinder.Eval(e.Item.DataItem, MetadataSurveyQuestion.Page).ToString();
                string sortNumber = DataBinder.Eval(e.Item.DataItem, MetadataSurveyQuestion.SortNumber).ToString();

                HtmlGenericControl questionsList = e.Item.FindControl("SurveyQuestions") as HtmlGenericControl;
                Repeater metaSectionQuestionsRptr = e.Item.FindControl("SectionQuestionsRptr") as Repeater;

                DataView questionsView = AllSurveyQuestions.DefaultView;

                string matchExpr = GetColumnFilterExpression(MetadataSurveyQuestion.Section, metaSection, string.Empty) + " AND " + GetColumnFilterExpression(MetadataSurveyQuestion.Page, metaPage, string.Empty);
                questionsView.RowFilter = matchExpr;
                questionsView.Sort = QUESTION_SORT_EXPRESSION;
                metaSectionQuestionsRptr.DataSource = questionsView;
                metaSectionQuestionsRptr.DataBind();

                if (questionsView.Count == 0)
                {
                    e.Item.Visible = false;
                }
            }
        }

        /// <summary>
        /// Durining init of each question, init event handlers to track hidden id fields, set labels, generate dynamic controls and set values.
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void InitQuestionsAndResponses(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                object dataItem = e.Item.DataItem;
                // locate special hidden fields used for tracking records
                HiddenField surveyItemIdField = e.Item.FindControl("SurveyItemId") as HiddenField;
                HiddenField metaQuestionIdField = e.Item.FindControl("MetaQuestionId") as HiddenField;
                // dynamically add input controls representing responses (for long surveys) (survey item result) and set value to default result
                e.Item.Load += (x, y) =>
                    {
                        // only long surveys need dynamic input controls to be inserted at runtime
                        if (SurveyLength == SurveyLengthType.Long)
                        {
                            // Long Surveys need to have dynamically created input control inserted into place holder on load
                            RepeaterItem questionItem = e.Item;
                            string surveyItemId = surveyItemIdField.Value;
                            string metaQuestionId = metaQuestionIdField.Value;
                            // either survey item id or meta question id will be used to generate control
                            string field;
                            int fieldId;

                            // if survey item record exits for current question, use data row to generate control
                            if (!string.IsNullOrEmpty(surveyItemId))
                            {
                                field = SurveyItem.SurveyItemId;
                                fieldId = int.Parse(surveyItemId);
                            }
                            // otherwise, use metadata for question
                            else
                            {
                                field = MetadataSurveyQuestion.MetadataSurveyQuestionId;
                                fieldId = int.Parse(metaQuestionId);
                            }

                            // create and dynamically insert caisis control into placeholder, with required properties (i.e., required, control type, layout)
                            PlaceHolder dynamicHolder = e.Item.FindControl("DynamicCICHolder") as PlaceHolder;
                            ICaisisInputControl iCIC = GetResponseCaisisControl(field, fieldId);
                            WebControl iCICWC = iCIC as WebControl;
                            iCICWC.ID = ICIC_RESPONSE_CONTROL_ID;
                            iCIC.ShowLabel = false;
                            dynamicHolder.Controls.Add(iCICWC);

                            if (iCIC is DataBoundControl)
                            {
                            }
                            // Extended controls need other field
                            if (iCIC is CaisisCheckBoxList)
                            {
                                CaisisCheckBoxList cbList = iCIC as CaisisCheckBoxList;
                                cbList.AppendDataBoundItems = false;
                                //cbList.ShowOther = true;
                            }
                            else if (iCIC is CaisisRadioButtonList)
                            {
                                CaisisRadioButtonList radioList = iCIC as CaisisRadioButtonList;
                                radioList.AppendDataBoundItems = false;
                                radioList.Uncheckable = true;
                                //radioList.ShowOther = true;
                            }
                            // add required validator, radiobutton list and checkbox lists don't validate client side
                            else if (iCIC.Required)
                            {
                                RequiredFieldValidator cicValidator = new RequiredFieldValidator();
                                cicValidator.ControlToValidate = iCICWC.ID;
                                cicValidator.SetFocusOnError = true;
                                cicValidator.Display = ValidatorDisplay.Dynamic;
                                cicValidator.Text = "Please choose a value for this required field.";
                                dynamicHolder.Controls.Add(cicValidator);
                            }

                            // data binding for data bound controls
                            if (iCIC is ListControl || iCIC is CheckBox)
                            {
                                // get special data souce with computed questions
                                DataTable questionResponses = _surveyData.GetSurveyQuestionResponses(int.Parse(metaQuestionId));
                                if (iCIC is ListControl)
                                {
                                    (iCIC as ListControl).DataTextField = "ResponseComputedText";
                                    (iCIC as ListControl).DataValueField = MetadataQuestionResponse.ResponseValue;

                                    (iCIC as ListControl).DataSource = questionResponses;
                                    (iCIC as ListControl).DataBind();
                                    
                                    (iCIC as ListControl).Style["display"] = "inline-table";
                                }
                                // For check controls such as CheckBox and RadioButton (which extends checkbox), set text
                                else if (iCIC is CheckBox)
                                {
                                    CheckBox cicCheckControl = iCIC as CheckBox;
                                    cicCheckControl.Text = questionResponses.Rows.Count > 0 ? questionResponses.Rows[0][MetadataQuestionResponse.ResponseText].ToString() : "";
                                }
                            }

                            // set input control value
                            //if (iCIC is DataBoundControl)
                            //{
                            //    (iCICWC as DataBoundControl).DataBound += (a, b) => iCIC.Value = surveyResult;
                            //}
                            //else
                            //{
                            //    iCICWC.DataBinding += (a, b) => iCIC.Value = surveyResult;
                            //}
                            object o = e.Item.DataItem;

                            if (dataItem != null)
                            {
                                // get survey item result 
                                string surveyResult = DataBinder.Eval(dataItem, SurveyItem.SurveyItemResult).ToString();
                                iCIC.Value = surveyResult;
                            }
                            //iCIC.Value = surveyResult;

                            // attach generic change handler to track response value changes, to signal updates
                            iCIC.ValueChanged += new CaisisEventHandler(HandleControlValueChange);
                        }
                    };

                // set special images
                Control renalDiagram_1 = e.Item.FindControl("Renal_Diagram_1");
                Control renalDiagram_2 = e.Item.FindControl("Renal_Diagram_2");
                if (renalDiagram_1 != null && renalDiagram_2 != null && e.Item.DataItem != null)
                {
                    string surveyType = Request.QueryString["surveyType"] + "";
                    // on existing surveys, check selected value
                    if (string.IsNullOrEmpty(surveyType) && SurveyList.SelectedItem != null)
                        surveyType = SurveyList.SelectedItem.Text;
                    string questionNum = DataBinder.Eval(e.Item.DataItem, MetadataSurveyQuestion.QuestionNumber).ToString() + "";
                    string question = DataBinder.Eval(e.Item.DataItem, MetadataSurveyQuestion.Question).ToString() + "";
                    if (surveyType == "Renal Mass Surveillance")
                    {
                        renalDiagram_1.Visible = question.Contains("Location relative to the polar lines");
                        renalDiagram_2.Visible = question.Contains("Anterior/Posterior (nephrometry score)");
                    }
                    else
                    {
                        renalDiagram_1.Visible = false;
                        renalDiagram_2.Visible = false;
                    }
                }
            }
        }

        /// <summary>
        /// Sets the question and number labels and hidden fields used to track survey item ids and meta questions id
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void BindQuestionLabelsAndHiddenFields(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                HiddenField surveyItemIdField = e.Item.FindControl("SurveyItemId") as HiddenField;
                HiddenField metaQuestionIdField = e.Item.FindControl("MetaQuestionId") as HiddenField;

                // get data values
                string surveyItemId = DataBinder.Eval(e.Item.DataItem, SurveyItem.SurveyItemId).ToString();
                string surveyResult = DataBinder.Eval(e.Item.DataItem, SurveyItem.SurveyItemResult).ToString();

                string metaQuestionId = DataBinder.Eval(e.Item.DataItem, MetadataSurveyQuestion.MetadataSurveyQuestionId).ToString();
                string metaQuestion = DataBinder.Eval(e.Item.DataItem, MetadataSurveyQuestion.Question).ToString();
                string metaQuestionNumber = DataBinder.Eval(e.Item.DataItem, MetadataSurveyQuestion.QuestionNumber).ToString();

                // set hidden survey id used to track real records
                surveyItemIdField.Value = surveyItemId;

                // set meta question id, only used on long survey to track the meta data used to generate the dynamic caisis control
                if (metaQuestionIdField != null)
                {
                    metaQuestionIdField.Value = metaQuestionId;
                }

                // set labels
                Label questionNum = e.Item.FindControl("QuestionNum") as Label;
                questionNum.Text = metaQuestionNumber;
                // show question tooltip for short surveys
                if (SurveyLength == SurveyLengthType.Short)
                {
                    questionNum.ToolTip = metaQuestion;
                }

                Label question = e.Item.FindControl("Question") as Label;
                question.Text = metaQuestion;

                // if there is no associated question metadata, indicate
                Label dataEntryResponse = e.Item.FindControl("DataEntryResponse") as Label;
                dataEntryResponse.Visible = string.IsNullOrEmpty(metaQuestionId);

                // single short surveys have static input control, set value based on data souce
                if (SurveyLength == SurveyLengthType.Short)
                {
                    ICaisisInputControl iCIC = e.Item.FindControl(ICIC_RESPONSE_CONTROL_ID) as ICaisisInputControl;
                    iCIC.Value = surveyResult;
                }
            }
        }

        /// <summary>
        /// During rendering, sections with 1 question and no section title are not shown as sections
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void ShowHideSectionStyles(object sender, EventArgs e)
        {
            Repeater sectionsRptr = sender as Repeater;
            foreach (RepeaterItem section in sectionsRptr.Items)
            {
                Repeater sectionQuestions = section.FindControl("SectionQuestionsRptr") as Repeater;
                if (sectionQuestions.Items.Count == 1)
                {
                    RepeaterItem item = section;
                    HtmlGenericControl sectionQuestionsList = item.FindControl("SurveyQuestions") as HtmlGenericControl;
                    HtmlGenericControl sectionTitle = item.FindControl("SurveySectionTitle") as HtmlGenericControl;

                    if (string.IsNullOrEmpty(sectionTitle.InnerText.Trim()) && sectionQuestionsList != null && SurveyPageCount == 1)
                    {
                        sectionQuestionsList.Attributes.Remove("class");
                    }
                }
            }
        }

        /// <summary>
        /// Fires when ICaisisInputControl's value changes during postback
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void HandleControlValueChange(ICaisisInputControl sender, EventArgs e)
        {
            // Unique identifer for control
            string uniqueID = (sender as WebControl).UniqueID;
            // Control is dirty (i.e., needs to update values)
            if (!dirtyCaisisResponseIDs.Contains(uniqueID))
            {
                dirtyCaisisResponseIDs.Add(uniqueID);
            }
        }

        /// <summary>
        /// Signals that the Survey Record needs updating
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void SetSurveyUpdate(object sender, EventArgs e)
        {
            DoSurveyUpdate = true;
        }


        /// <summary>
        /// Returns a dynamic ICaisisInputControl based on ResponeType
        /// </summary>
        /// <param name="fieldName"></param>
        /// <param name="fieldId"></param>
        /// <returns></returns>
        private ICaisisInputControl GetResponseCaisisControl(string fieldName, int fieldId)
        {
            // Control Default Type
            string dynamicControlType = ICIC_DEFAULT_TYPE_NAME;
            // Default is contorl is required
            bool isRequired = false;
            // Default layout for radiobuttonlist
            RepeatDirection layoutDir = RepeatDirection.Vertical;

            DataRow[] foundRows = AllSurveyQuestions.Select(fieldName + " = " + fieldId);
            if (foundRows.Length > 0)
            {
                string foundControlType = foundRows[0][MetadataSurveyQuestion.ResponseControlType].ToString();
                if (!string.IsNullOrEmpty(foundControlType))
                {
                    dynamicControlType = foundControlType;
                }

                // Independent of control type

                // Determine if required
                string reqString = foundRows[0][MetadataSurveyQuestion.ResponseRequired].ToString();
                if (PageUtil.IsTrueString(reqString))
                {
                    isRequired = true;
                }
                // Determine layout (if applicable)
                string layoutString = foundRows[0][MetadataSurveyQuestion.ResponseLayout].ToString();
                if (!string.IsNullOrEmpty(layoutString))
                {
                    layoutDir = (RepeatDirection)Enum.Parse(typeof(RepeatDirection), layoutString);
                }
            }
            // Create a Dynamic ICaisisInputControl Control
            ICaisisInputControl dynamicControl = CICHelper.InvokeInputControl(dynamicControlType);
            // set required properties
            // !important, control maps to result field in survey items
            dynamicControl.Table = "SurveyItems";
            dynamicControl.Field = SurveyItem.SurveyItemResult;
            dynamicControl.Required = isRequired;
            if (dynamicControl is RadioButtonList)
            {
                RadioButtonList rbl = dynamicControl as RadioButtonList;
                rbl.RepeatDirection = layoutDir;
                // for explicit extended control, show other
                if (dynamicControl is CaisisExtendedRadioButtonList)
                {
                    CaisisExtendedRadioButtonList eList = dynamicControl as CaisisExtendedRadioButtonList;
                    eList.ShowOther = true;
                    eList.Uncheckable = true;
                }
            }
            else if (dynamicControl is CheckBoxList)
            {
                CheckBoxList cbl = dynamicControl as CheckBoxList;
                cbl.RepeatDirection = layoutDir;
                // for explicit extended control, show other
                if (dynamicControl is CaisisExtendedCheckBoxList)
                {
                    CaisisExtendedCheckBoxList eList = dynamicControl as CaisisExtendedCheckBoxList;
                    eList.ShowOther = true;
                }
            }
            return dynamicControl;
        }

        #endregion

        #region Button Click Events

        /// <summary>
        /// 
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void NextClick(object sender, EventArgs e)
        {
            SaveSurveyClick(sender, e);

            // Adjust page index
            GoToNextPage();
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void BackClick(object sender, EventArgs e)
        {
            SaveSurveyClick(sender, e);

            // Adjust page index
            GoToPrevPage();
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void ShowAllPagesClick(object sender, EventArgs e)
        {
            SaveSurveyClick(sender, e);
            GoToPage("all");
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void SaveSurveyClick(object sender, EventArgs e)
        {
            // Only update records, if not previewing Survey
            if (!IsPreviewPage)
            {
                SaveSurvey();
            }
            // Save was signaled by save click
            //if (sender == SaveBtn)
            {
                Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "_reloadMainPage", "reloadMainPage('" + SurveyIdField.Value + "'); fireUnload = true;", true);
            }
        }
        #endregion

        #region Page and URL Navigation Helpers (for navigating between pages and short/long view)

        /// <summary>
        /// Determine which buttons should be shown/hidden
        /// </summary>
        private void DeterminePageNavigation()
        {

            // For short surveys, no paging, just save
            if (SurveyLength == SurveyLengthType.Short)
            {
                SaveBtn.Visible = true;
                BackBtn.Visible = false;
                NextBtn.Visible = false;
            }
            // Longer surveys, need special paging requirements
            else if (SurveyLength == SurveyLengthType.Long)
            {
                // if showing all pages
                if (ShowAllPages)
                {
                    SaveBtn.Visible = true;
                    BackBtn.Visible = false;
                    NextBtn.Visible = false;

                    PageNumberNav.Text = SurveyPageCount + (SurveyPageCount == 1 ? " Page" : " Pages");
                }
                else
                {
                    int curPageIndex = PageNumber;
                    int lastPageIndex = PagesTable.Rows.Count - 1;
                    int prevPageIndex = PageNumber - 1;
                    int nextPageIndex = PageNumber + 1;
                    if (curPageIndex == 0)
                    {
                        BackBtn.Visible = false;
                        if (lastPageIndex == 0)
                        {
                            SaveBtn.Visible = true;
                        }
                        else
                        {
                            SaveBtn.Visible = false;
                        }
                    }
                    if (lastPageIndex == curPageIndex)
                    {
                        SaveBtn.Visible = true;
                        NextBtn.Visible = false;
                    }
                    if (nextPageIndex < lastPageIndex)
                    {
                        NextBtn.Visible = true;
                        SaveBtn.Visible = false;
                    }
                    if (nextPageIndex == lastPageIndex)
                    {
                        NextBtn.Visible = true;
                        SaveBtn.Visible = false;
                    }
                    // Set PageNav numbering
                    PageNumberNav.Text = string.Format("{0}/{1}", nextPageIndex, SurveyPageCount);
                }
            }
        }

        /// <summary>
        /// 
        /// </summary>
        private void GoToNextPage()
        {
            if (PageNumber < PagesTable.Rows.Count - 1)
            {
                PageNumber = PageNumber + 1;
            }
            GoToPage(PageNumber.ToString());
        }

        /// <summary>
        /// 
        /// </summary>
        private void GoToPrevPage()
        {
            if (PageNumber > 0)
            {
                PageNumber = PageNumber - 1;
            }
            GoToPage(PageNumber.ToString());
        }

        /// <summary>
        /// Loads the next page of the data entry form
        /// </summary>
        /// <param name="pageNumber"></param>
        private void GoToPage(string pageNumber)
        {
            // load next page
            string goToUrl = GetNavigateUrl(SurveyLength, pageNumber);
            Response.Redirect(goToUrl);
        }

        /// <summary>
        /// 
        /// </summary>
        /// <returns></returns>
        private string GetNavigateUrl()
        {
            return GetNavigateUrl(SurveyLength);
        }

        /// <summary>
        /// Get a url for navigating to a survey
        /// </summary>
        /// <param name="type"></param>
        /// <returns></returns>
        private string GetNavigateUrl(SurveyLengthType type)
        {
            return GetNavigateUrl(type, PageNumber.ToString());
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="type"></param>
        /// <param name="pageNumber"></param>
        /// <returns></returns>
        private string GetNavigateUrl(SurveyLengthType type, string pageNumber)
        {
            // create a list of url params for passing along
            Dictionary<string, string> urlParams = GetNavigateParams(type);
            urlParams["page"] = pageNumber;
            // create a url for navigating pages
            string fullQueryPath = "SurveyWizardPage.aspx?" + PageUtil.CreateUrlPairs(urlParams);
            return fullQueryPath;
        }

        /// <summary>
        /// Returns a populated dictionary of query parms to pass along in url
        /// </summary>
        /// <param name="type"></param>
        /// <returns></returns>
        private Dictionary<string, string> GetNavigateParams(SurveyLengthType type)
        {
            string surveyType = SurveyList.SelectedItem != null ? SurveyList.SelectedItem.Text : string.Empty;
            // create a list of url params for passing along
            Dictionary<string, string> urlParams = new Dictionary<string, string>()
            {
                { "surveyId", SurveyIdField.Value },
                { "surveyType", surveyType },
                { "viewType", type.ToString() },
                // page number is not needed on short surveys
                { "page", type== SurveyLengthType.Short ? string.Empty: PageNumber.ToString() }
            };
            // determine if month is added
            string queryMonth = Request.QueryString["month"];
            if (!string.IsNullOrEmpty(queryMonth))
            {
                urlParams.Add("month", queryMonth);
            }
            // add survey fields persisted in url (except special fields)
            //var surveyInputFields = CICHelper.GetCaisisInputControlDictionary(SurveyFields).Keys;
            //foreach(string field in surveyInputFields)
            //{
            //    // sepcial case
            //    if (!field.Equals(Survey.SurveyType, StringComparison.OrdinalIgnoreCase))
            //    {
            //        string qsValue = Request.QueryString[field];
            //        if (!string.IsNullOrEmpty(qsValue) && !urlParams.ContainsKey(qsValue))
            //        {
            //            urlParams.Add(field, qsValue);
            //        }
            //    }
            //}
          
            return urlParams;
        }

        #endregion

        #region SurveyList DropDown Methods

        /// <summary>
        /// 
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void HandleChooseSurvey(object sender, EventArgs e)
        {
            // During autopostbacks of SurveyList dropdown, we will redirect to page
            if (sender == SurveyList)
            {
                Response.Redirect(GetNavigateUrl());
            }
            else
            {
                BindQuestions();
            }
        }

        /// <summary>
        /// Binds questions based on SurveyLength
        /// </summary>
        private void BindQuestions()
        {
            if (SurveyLength == SurveyLengthType.Short)
            {
                BindShortView();
            }
            else if (SurveyLength == SurveyLengthType.Long)
            {
                BindLongView();
            }
        }

        #endregion

        #region INSERT/UPDATE Survey and SurveyItems

        private void SaveSurvey()
        {
            // Get PatientId from session
            object patientIdInSession = Session[SessionKey.PatientId];

            if (patientIdInSession != null && !string.IsNullOrEmpty(patientIdInSession.ToString()))
            {
                // Determine if to create new Survey or load existing Survey
                // Check if a record already exists
                Survey biz = new Survey();
                if (string.IsNullOrEmpty(SurveyIdField.Value))
                {
                    // Required
                    biz[Survey.PatientId] = patientIdInSession;

                    // If user specified type passed in url, set as type
                    //if (!string.IsNullOrEmpty(UserSurveyType.Value))
                    // {
                    //    biz[Survey.SurveyType] = UserSurveyType.Value;
                    //}
                    //else
                    //{
                    biz[Survey.SurveyType] = SurveyList.SelectedItem.Text;
                    //}

                    DoSurveyUpdate = true;
                }
                else
                {
                    int sId = int.Parse(SurveyIdField.Value);
                    biz.Get(sId);
                }

                // Populate biz fields from UI fields
                CICHelper.SetBOValues(SurveyFields.Controls, biz, 0);

                // Manually Set DateField
                if (!string.IsNullOrEmpty(SurveyDateText.Value))
                {
                    DateTime parsedDate = DateTime.Now;
                    if (DateTime.TryParse(SurveyDateText.Value, out parsedDate))
                    {
                        biz[Survey.SurveyDate] = parsedDate;
                    }
                }

                // Only call Update on Survey record if record does't exist
                // or value has changed since last post
                //if (DoSurveyUpdate)
                // always update Survey record to normalize UpdatedTime
                {
                    // MARK RECORD AS SURVEY
                    biz.AppendToUserName(ENTERED_BY_SURVEY);
					
                    // Save new Survey Record
                    biz.Save();

                    // Save Action record in some cases
                    this.SaveRelatedItem(biz[Survey.SurveyType].ToString(), int.Parse(biz[biz.PrimaryKeyName].ToString()), patientIdInSession);
                }

                int surveyId = int.Parse(biz[biz.PrimaryKeyName].ToString());
                SurveyIdField.Value = surveyId.ToString();

                // If updating short form, all question in main rptr
                if (SurveyLength == SurveyLengthType.Short)
                {
                    SaveQuestionsInRptr(ShortViewQuestionRptr, surveyId);
                }
                // If long, questions are nested inside each section
                else if (SurveyLength == SurveyLengthType.Long)
                {
                    // NEW Code
                    foreach (RepeaterItem pageItem in SurveyPageRptr.Items)
                    {
                        // Save SurveyItems for visible pages
                        if (pageItem.Visible)
                        {
                            Repeater pageSectionRptr = pageItem.FindControl("PageSectionsRptr") as Repeater;
                            foreach (RepeaterItem sectionItem in pageSectionRptr.Items)
                            {
                                Repeater questionsRptr = sectionItem.FindControl("SectionQuestionsRptr") as Repeater;
                                SaveQuestionsInRptr(questionsRptr, surveyId);
                            }
                        }
                    }
                }
								
                // optional scroing: run after suvey items have been inserted
                bool hasScore = this.SetOptionalSurveyData(biz);
                if (hasScore)
                {
                    biz.Save();
                }
				
				
                // Prompt user that page is closing
                //}
                //// Else notify user
                //else
                //{
                //    Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "_recordExists", "alert('A Survey has already been saved for this Patient. Please clpse the window.');", true);
                //}
            }
        }

        /// <summary>
        /// Saves a new SurveyItem records for each question in Repeater
        /// </summary>
        /// <param name="questionsRptr">Repeater containing questions</param>
        /// <param name="surveyId">The parent SurveyId</param>
        private void SaveQuestionsInRptr(Repeater questionsRptr, int surveyId)
        {
            foreach (RepeaterItem item in questionsRptr.Items)
            {
                // Label which container SurveyItem (Question)
                Label question = item.FindControl("Question") as Label;
                Label questionNumberLabel = item.FindControl("QuestionNum") as Label;
                string surveyItem = question.Text;
                string surveyItemQuestionNumber = questionNumberLabel.Text;

                // PriKey for SurveyItem
                HiddenField surveyItemId = item.FindControl("SurveyItemId") as HiddenField;
                // ICIC which contains the SurveyResult (Response)
                ICaisisInputControl questionResponse = item.FindControl(ICIC_RESPONSE_CONTROL_ID) as ICaisisInputControl;
                string responseUniqueId = (questionResponse as WebControl).UniqueID;

                // Values which are marked dirty need to be updated
                bool isAnswerDirty = dirtyCaisisResponseIDs.Contains(responseUniqueId);

                // Determine if there is a SurveyItem record in db, otherwise always create
                bool surveyItemExists = !string.IsNullOrEmpty(surveyItemId.Value);

                // special controls always need to be updated (because of way state change is tracked during postback)
                bool isSpecialCase = questionResponse is CaisisCheckBoxList || questionResponse is CaisisRadioButtonList;

                // "dirty" responses, empty response, and special cases need update/insert
                if (isAnswerDirty || !surveyItemExists || isSpecialCase)
                {
                    // survey item response
                    string surveyItemResult = questionResponse.Value; //questionResponse is CaisisRadioButtonList ? Request.Form[responseUniqueId] : questionResponse.Value;

                    // Create new SurveyItem biz for updating/inserting
                    SurveyItem itemBiz = new SurveyItem();

                    // If SurveyItem exist, load
                    if (!string.IsNullOrEmpty(surveyItemId.Value))
                    {
                        // load exisiting record, record will have question and question num populated
                        itemBiz.Get(int.Parse(surveyItemId.Value));
                    }
                    // If creating a new record, set parent SurveyId and question
                    else
                    {
                        itemBiz[SurveyItem.SurveyId] = surveyId;
                        // set question num and question
                        itemBiz[SurveyItem.SurveyItem_Field] = surveyItem;
                        itemBiz[SurveyItem.SurveyItemNum] = surveyItemQuestionNumber;
                    }
                    // set user response
                    itemBiz[SurveyItem.SurveyItemResult] = surveyItemResult;

                    // MARK RECORD AS SURVEY
                    itemBiz.AppendToUserName(ENTERED_BY_SURVEY);
                    // Update/Save record
                    itemBiz.Save();

                    // Update SurveyId hidden field to track existing record
                    surveyItemId.Value = itemBiz[SurveyItem.SurveyItemId].ToString();
                }
            }
        }

        #endregion

        /// <summary>
        /// Returns a specially formatted SQL expression to match column values (NULL=='')
        /// </summary>
        /// <param name="colName"></param>
        /// <param name="colValue"></param>
        /// <returns></returns>
        private string GetColumnFilterExpression(string colName, string colValue, string sortNumber)
        {
            string expr = "";
            if (!string.IsNullOrEmpty(colValue))
            {
                expr = colName + " = '" + colValue.Replace("'", "''") + "'";
            }
            else
            {
                expr = "(" + colName + " IS NULL OR " + colName + " = '')";
                if (!string.IsNullOrEmpty(sortNumber))
                {
                    expr = "(" + expr + " AND SortNumber = " + sortNumber + ")";
                }
            }
            return expr;
        }

        // follow up module saves RelatedRecord when a survey is saved
        private void SaveRelatedItem(string surveyName, int surveyPK, object patientId)
        {
            // create a hard relationship between the SENT ACTION ITEM and the SURVEY RECORD
            if (!string.IsNullOrEmpty(Request.QueryString["saveActionItem"]) && !string.IsNullOrEmpty(Request.QueryString["month"]))
            {
                // first get Action record by action item and patient id
                string actionItem = Caisis.UI.Modules.FollowUp.FollowUpUtil.GetSurveyActionItem(surveyName, Request.QueryString["month"]);
                FollowUpDA da = new FollowUpDA();
                DataTable actionDt = da.GetSurveyActionItem((int)patientId, actionItem);

                if (actionDt.Rows.Count > 0)
                {
                    int actionPk = int.Parse(actionDt.Rows[0][Caisis.BOL.Action.ActionId].ToString());

                    // second insert association between Action Item and Survey in Related Records table
                    RelatedRecord rr = new RelatedRecord();
                    rr[RelatedRecord.SrcPrimaryKey] = actionPk;
                    rr[RelatedRecord.SrcTableName] = "Actions";
                    rr[RelatedRecord.SrcSystem] = "Caisis";
                    rr[RelatedRecord.DestTableName] = "Surveys";
                    rr[RelatedRecord.DestPrimaryKey] = surveyPK;
                    rr.Save();
                }
            }

            // if specified in URL, save Action Item that Survey is Complete
            /*if (!string.IsNullOrEmpty(Request.QueryString["saveActionItem"]))
            {
                Caisis.BOL.Action action = new Caisis.BOL.Action();
                action[Caisis.BOL.Action.PatientId] = patientIdInSession;
                action[Caisis.BOL.Action.ActionDate] = System.DateTime.Now;
                action[Caisis.BOL.Action.ActionDateText] = System.DateTime.Now.ToShortDateString();
                action[Caisis.BOL.Action.ActionItem] = surveyName + " Data Entered";
                action.Save();
            }*/
        }
    }
}
