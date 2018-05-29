using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Xml;

using Caisis.BOL;
using Caisis.Controller;
using Caisis.UI.Core.Classes;
using Caisis.UI.Core.Classes.CustomControls;
using Caisis.DataAccess;
using System.Web.UI.HtmlControls;
using System.Collections;
using Caisis.Security;
using System.Data.SqlClient;

namespace Caisis.UI.Modules.FollowUp
{
    public partial class LongitudinalFollowUp : FollowUpBasePage
    {

        private XmlDocument xDoc;
        private XmlDocument xDocFollowUp;
        private XmlNode ssdmfNode;
        private XmlNode followUpNode;


        struct PatientRepeaterState
        {
            public const string GeneralV1 = "GeneralV1";
            public const string GeneralV2 = "GeneralV2";
        };

        private string _currentContactStatus = String.Empty;
        private string _dropDownDefaultPhysicianValue = " ----------- Select Physician ----------- ";
        private string _dropDownDefaultDiseaseValue = " ----------- Select Disease ----------- ";
        protected string clinicListTableWidth;

        public String FollowUpClinicDate
        {
            get
            {
                if (ViewState["clinicDate"] == null)
                    ViewState["clinicDate"] = String.Empty;
                return (String)ViewState["clinicDate"];
            }
            set { ViewState["clinicDate"] = value; }
        }
        
        public String FollowUpListType
        {
            get
            {
                if (ViewState["listType"] == null)
                    ViewState["listType"] = String.Empty;
                return (String)ViewState["listType"];
            }
            set { ViewState["listType"] = value; }
        }

        public String FollowUpListCriteria
        {
            get
            {
                if (ViewState["listCrit"] == null)
                    ViewState["listCrit"] = String.Empty;
                return (String)ViewState["listCrit"];
            }
            set { ViewState["listCrit"] = value; }
        }


        public String FollowUpListSortColumn
        {
            get
            {
                if (ViewState["sortColumn"] == null)
                    ViewState["sortColumn"] = Patient.PtLastName;
                return (String)ViewState["sortColumn"];
            }
            set { ViewState["sortColumn"] = value; }
        }

        public String FollowUpListTitle
        {
            get
            {
                if (ViewState["listTitle"] == null)
                    ViewState["listTitle"] = Patient.PtLastName;
                return (String)ViewState["listTitle"];
            }
            set { ViewState["listTitle"] = value; }
        }

        public SortDirection GVSortDirection
        {
            get
            {
                if (ViewState["sortDirection"] == null)
                    ViewState["sortDirection"] = SortDirection.Ascending;
                return (SortDirection)ViewState["sortDirection"];
            }
            set { ViewState["sortDirection"] = value; }
        }

        public String GetResultsTitle
        {
            get 
            { 
                string title = "Longitudinal Follow Up";
                title = !String.IsNullOrEmpty(GetSelectedTreatingPhysicianName) ? title + " : " + GetSelectedTreatingPhysicianName : title;
                title = !String.IsNullOrEmpty(SelectedPatientDisease) ? title + " : " + SelectedPatientDisease : title;
                title = !String.IsNullOrEmpty(FollowUpListCriteria) ? title + " : " + FollowUpListCriteria : title;
                return title; 
            }
        }

        public int SelectedTreatingPhysicianId
        {
            get 
            {
                if (ViewState["treatingPhysicianId"] == null)
                    ViewState["treatingPhysicianId"] = "0";
                return Int32.Parse(ViewState["treatingPhysicianId"].ToString());
            }
            set { ViewState["treatingPhysicianId"] = value; }
        }

        public String GetSelectedTreatingPhysicianRole
        {
            get 
            {
                if (TreatingPhysicianDDL.SelectedIndex > 0)
                {
                        ViewState["treatingPhysicianRole"] = "Treating";
                }
                else
                    ViewState["treatingPhysicianRole"] = String.Empty;

                return (String)ViewState["treatingPhysicianRole"];
            }
        }

        public String GetSelectedTreatingPhysicianName
        {
            get 
            {
                if (TreatingPhysicianDDL.SelectedIndex > 0)
                {
                    if (ViewState["treatingPhysicianName"] == null)
                        ViewState["treatingPhysicianName"] = TreatingPhysicianDDL.SelectedItem.Text;
                }
                else
                    ViewState["treatingPhysicianName"] = String.Empty;

                return (String)ViewState["treatingPhysicianName"];
                
            }
        }

        public String SelectedPatientDisease
        {
            get 
            {
                if (ViewState["treatingPatientDisease"] == null)
                    ViewState["treatingPatientDisease"] = String.Empty;
                return (String)ViewState["treatingPatientDisease"];
            }
            set { ViewState["treatingPatientDisease"] = value; }
        }

        private int _startRow = 0;
        protected int ResultsStartRow
        {
            get { return _startRow; }
            set { _startRow = value;  }
        }

        private int _endRow = 0;
        protected int ResultsEndRow
        {
            get { return _endRow; }
            set { _endRow = value; }
        }

        private int _recordCount = 0;
        protected int ResultsRecordCount
        {
            get { return _recordCount; }
            set { _recordCount = value; }
        }

        private int _numOfRecordsToDisplay = 200;
        protected int ResultsNumOfRecordsToDisplay
        {
            get { return _numOfRecordsToDisplay; }
            set { _numOfRecordsToDisplay = value; }
        }

        private string _recordMemo = String.Empty;
        protected String ResultsRecordMemo
        {
            get { return _recordMemo; }
            set { _recordMemo = value; }
        }

        protected Boolean HasSSDIAccess
        {
            get 
            { 
              // ensure SSDI utility is enabled 
                bool ssdiEnabled = false;
                bool userHasPermission = false;

                XmlAttribute enabledAttribute = ssdmfNode.Attributes["enabled"];
                if (enabledAttribute != null && !String.IsNullOrEmpty(enabledAttribute.Value))
                {
                    Boolean.TryParse(ssdmfNode.Attributes["enabled"].Value, out ssdiEnabled);
                }

                // ensure user has permission
                XmlAttribute permissionAttribute = ssdmfNode.Attributes["permission"];
                if (permissionAttribute != null && !string.IsNullOrEmpty(permissionAttribute.Value))
                {
                    string[] permissions = permissionAttribute.Value.Split(',');
                    foreach (string permission in permissions)
                    {
                        if (PermissionManager.HasPermission(permission))
                        {
                            userHasPermission = true;
                            break;
                        }
                    }
                }
                else
                    userHasPermission = true;

                return ssdiEnabled && userHasPermission ? true : false;
            }
        }

        protected String GetSSDIUrl
        {
            get
            {
                string ssdiURL = String.Empty;
                if (HasSSDIAccess)
                {
                    string ssdiLocation = ssdmfNode.Attributes["location"].Value;
                    ssdiURL = Page.ResolveUrl("~/Modules/FollowUp/" + ssdiLocation);
                }
                return ssdiURL;
            }
        }

        public LongitudinalFollowUp()
        {
            xDoc = XmlUtil.GetModulesConfigXml();
            ssdmfNode = xDoc.SelectSingleNode("/modules//module[@name='Follow Up']/sections/section[@name='CheckVitalStatus']");

            xDocFollowUp = XmlUtil.GetFollowUpXml();
           // followUpNode = xDocFollowUp.SelectSingleNode("/surveyrules");

        }

        protected void Page_Init(object sender, EventArgs e)
        {
          
        }
        protected override void Page_Load(object sender, EventArgs e)
        {
           base.Page_Load(sender, e);
           this.EnableViewState = true;
 
            if (!IsPostBack)
            {
                //ClientScript.GetPostBackEventReference(this, "");
                PopulatePhysicianDropDown();
                PopulateDiseaseDropDown();
            }

            // Set Clinic Date Variable		
            this.SetClinicDate();

            // Set listType Variable
            this.SetListType();

            // Set list criteria variable
            this.SetListCriteriaValue();

            // Set list sort order
            this.SetListSortOrder();

            // Set start row
            this.SetListStartRow();

            // Set list title
            this.SetPatientListTitle();
            
            this.SetPhysicianDropDownValue();
            this.SetDiseaseDropDownValue();

            RunInitializingQueries();
            PopulateContactStatusList();               
            PopulateContactStatusResults();
        }

        #region CONTACT STATUS FUNCTIONS

            private void RunInitializingQueries()
            {
                // run survey due queries to ensure patients have the appropriate 'NeedLetterX' status, if needed

                // run query for prostectocmy pat
                XmlNodeList rulesNodes = xDocFollowUp.SelectSingleNode("/surveyrules") != null ? xDocFollowUp.SelectSingleNode("/surveyrules").ChildNodes : null;

                foreach (XmlNode currNode in rulesNodes)
                {
                    bool ruleActive = false;
                    if (currNode.Attributes["type"] != null && currNode.Attributes["type"].Value.ToLower().Equals("surveysdue") && Boolean.TryParse(currNode.Attributes["active"].Value, out ruleActive))
                    {
                        if (ruleActive)
                        {
                            string ruleName = currNode.Attributes["name"] != null ? currNode.Attributes["name"].Value : String.Empty;
                            string ruleDescription = currNode.SelectSingleNode("description") != null ? currNode.SelectSingleNode("description").InnerText : String.Empty;
                            string queryFileName = currNode.SelectSingleNode("sqlFile") != null ? currNode.SelectSingleNode("sqlFile").InnerText : String.Empty;

                            XmlNodeList coverLetterNodes = currNode.SelectSingleNode("coverletters") != null ? currNode.SelectSingleNode("coverletters").ChildNodes : null;
                            Hashtable coverLettersForRule = new Hashtable();

                            foreach (XmlNode currentCoverLetterNode in coverLetterNodes)
                            {
                                string coverLetterDisplayName = currentCoverLetterNode.Name.ToUpper() == "coverletter".ToUpper() && currentCoverLetterNode.Attributes["displayName"] != null ? currentCoverLetterNode.Attributes["displayName"].Value : String.Empty;
                                string coverLetterFileName = currentCoverLetterNode.Name.ToUpper() == "coverletter".ToUpper() && currentCoverLetterNode.Attributes["xmlFileName"] != null ? currentCoverLetterNode.Attributes["xmlFileName"].Value : String.Empty;

                                if (!String.IsNullOrEmpty(coverLetterDisplayName) && !String.IsNullOrEmpty(coverLetterFileName))
                                    coverLettersForRule.Add(coverLetterDisplayName, coverLetterFileName);
                            }

                            XmlNodeList surveyNodes = currNode.SelectSingleNode("surveys") != null ? currNode.SelectSingleNode("surveys").ChildNodes : null;
                            Hashtable surveysForRule = new Hashtable();

                            foreach (XmlNode currentSurveyNode in surveyNodes)
                            {
                                string surveyDisplayName = currentSurveyNode.Name.ToUpper() == "survey".ToUpper() && currentSurveyNode.Attributes["displayName"] != null ? currentSurveyNode.Attributes["displayName"].Value : String.Empty;
                                string surveyFileName = currentSurveyNode.Name.ToUpper() == "survey".ToUpper() & currentSurveyNode.Attributes["pdfFileName"] != null ? currentSurveyNode.Attributes["pdfFileName"].Value : String.Empty;

                                if (!String.IsNullOrEmpty(surveyDisplayName) && !String.IsNullOrEmpty(surveyFileName))
                                    surveysForRule.Add(surveyDisplayName, surveyFileName);

                            }

                            string surveydueSql = ReportController.LoadSQLFromFile(queryFileName);

                            if (!String.IsNullOrEmpty(surveydueSql))
                            {
                                DataTable surveysDueDt = new DataTable();
                                DataAccessHelper.ExecuteSqlSelect(surveydueSql, surveysDueDt);

                                // if patients are due a survey, ensure patients have there contact status updated accordingly
                                // if no surveys have been sent (no action items), contact status = NeedLetter1
                                // if latest action item = Letter1_Sent, contact status = NeedLetter2
                                // if latest action item = Letter2_Sent, contact status = NeedLetter3
                                // if latest action item = Leeter3_Sent, contact status = NeedMD_ToCallPt   
                                Patient ptObj = new Patient();
                                bool patientUpdated = false;
                                foreach (DataRow dr in surveysDueDt.Rows)
                                {
                                    patientUpdated = false;
                                    ptObj.Clear();
                                    ptObj.Get(Int32.Parse(dr[Patient.PatientId].ToString()));
                                    if (!ptObj.IsEmpty)
                                    {

                                        if (String.IsNullOrEmpty(dr[BOL.Action.ActionItem].ToString()) && !ptObj[Patient.PtContactStatus].ToString().Equals("NeedLetter1"))
                                        {
                                            ptObj[Patient.PtContactStatus] = "NeedLetter1";
                                            patientUpdated = true;
                                        }
                                        else if (dr[BOL.Action.ActionItem].ToString() == "Letter1_Sent" && !ptObj[Patient.PtContactStatus].ToString().Equals("NeedLetter2"))
                                        {
                                            ptObj[Patient.PtContactStatus] = "NeedLetter2";
                                            patientUpdated = true;
                                        }
                                        else if (dr[BOL.Action.ActionItem].ToString() == "Letter2_Sent" && !ptObj[Patient.PtContactStatus].ToString().Equals("NeedLetter3"))
                                        {
                                            ptObj[Patient.PtContactStatus] = "NeedLetter3";
                                            patientUpdated = true;
                                        }
                                        else if (dr[BOL.Action.ActionItem].ToString() == "Letter3_Sent" && !ptObj[Patient.PtContactStatus].ToString().Equals("NeedMD_ToCallPt"))
                                        {
                                            // check if patient was already called, get most recent PtWasCalled action record 
                                            bool patientWasCalled = false;

                                            ActionDa actionDa = new ActionDa();
                                            DataSet ptWasCalledDs = actionDa.ValidateActionItem(Int32.Parse(dr[Patient.PatientId].ToString()),"PtWasCalled");
                                            if (ptWasCalledDs.Tables.Count > 0 && ptWasCalledDs.Tables[0].Rows.Count > 0)
                                            {
                                                DataView ptWasCalledDv = new DataView(ptWasCalledDs.Tables[0]);
                                                ptWasCalledDv.Sort = BOL.Action.ActionDate + " DESC ";
                                                DateTime ptWasCalled;
                                                DateTime letter3Sent;
                                                if (!String.IsNullOrEmpty(ptWasCalledDv[0][BOL.Action.ActionDate].ToString())
                                                    && !String.IsNullOrEmpty(dr[BOL.Action.ActionDate].ToString()) 
                                                    && DateTime.TryParse(ptWasCalledDv[0][BOL.Action.ActionDate].ToString(), out ptWasCalled)
                                                    && DateTime.TryParse(dr[BOL.Action.ActionDate].ToString(), out letter3Sent))
                                                {
                                                    // if patient has 'PtWasCalled' action record between the last Letter3_Sent date and today, do not update
                                                    if (ptWasCalled >= letter3Sent && ptWasCalled <= DateTime.Today)
                                                        patientWasCalled = true;
                                                }
                                            }

                                            if (!patientWasCalled)
                                            {
                                                ptObj[Patient.PtContactStatus] = "NeedMD_ToCallPt";
                                                patientUpdated = true;
                                            }
                                        }

                                        if (patientUpdated)
                                            ptObj.Save();
                                    }


                                }

                            }

                        }
                    }
                }
            }

            private void PopulateContactStatusList()
            {
                //populate contact status from distinct values- status also present in look up codes
                PatientDa patDa = new PatientDa();
                //count of patients in each contact status should be based on dataset user is logged into
                string datasetSql = CacheManager.GetDatasetSQL(Session[SessionKey.DatasetId]);
                DataSet contactStatusDs = patDa.GetDistinctContactStatusByPhysicianAndDisease(datasetSql, SelectedTreatingPhysicianId, GetSelectedTreatingPhysicianRole, SelectedPatientDisease);
                if (contactStatusDs.Tables.Count > 0)
                {
                    if (contactStatusDs.Tables[0].Rows.Count > 0)
                    {
                        ContactStatusGV.AllowSorting = true;
                        ContactStatusGV.DataSource = contactStatusDs.Tables[0];
                        ContactStatusGV.DataBind();

                        // if a status result list is showing
                        if (!String.IsNullOrEmpty(FollowUpListCriteria) && rptPatient.Items.Count > 0)
                        {
                            // if the current result status is not an option in the contact status list
                            bool foundStatus = false;
                            foreach (DataRow dr in contactStatusDs.Tables[0].Rows)
                            {
                                if (dr[Patient.PtContactStatus].ToString() == FollowUpListCriteria)
                                {
                                    foundStatus = true;
                                    break;
                                }
                            }

                            if (!foundStatus)
                                FollowUpListCriteria = String.Empty;
                        }
                    }
                    else
                    {
                        ContactStatusGV.AllowSorting = false;
                        FollowUpListCriteria = String.Empty;
                        ShowNoResultFound(contactStatusDs.Tables[0], ContactStatusGV);
                    }
                }
            }

            private void ShowNoResultFound(DataTable source, GridView gv)
            {
                source.Rows.Add(source.NewRow()); // create a new blank row to the DataTable
                // Bind the DataTable which contain a blank row to the GridView
                gv.DataSource = source;
                gv.DataBind();
                // Get the total number of columns in the GridView to know what the Column Span should be
                int columnsCount = gv.Columns.Count;
                gv.Rows[0].Cells.Clear();// clear all the cells in the row
                gv.Rows[0].Cells.Add(new TableCell()); //add a new blank cell
                gv.Rows[0].Cells[0].ColumnSpan = columnsCount; //set the column span to the new added cell

                //You can set the styles here
                gv.Rows[0].Cells[0].HorizontalAlign = HorizontalAlign.Center;
                gv.Rows[0].Cells[0].ForeColor = System.Drawing.Color.Red;
                gv.Rows[0].Cells[0].Font.Bold = true;

                //set No Results found to the new added cell
                gv.Rows[0].Cells[0].Text = "no results found";                

            }

            private void PopulateContactStatusResults()
            {

                // Show blank screen if no list has been selected, or statis is no longer option in contact list
                if (String.IsNullOrEmpty(FollowUpListType) || String.IsNullOrEmpty(FollowUpListCriteria))
                {
                    SetResultsDisplay("START");
                }
                // Get the list of patients
                else
                {
                    SetResultsDisplay("RESULTS");

                    if (!String.IsNullOrEmpty(FollowUpListType) && !String.IsNullOrEmpty(FollowUpListCriteria))
                    {

                        PatientListController ct = new PatientListController();
                        DataSet ds = null;

                        // get list of patients
                        string dsSQL = CacheManager.GetDatasetSQL(Session[SessionKey.DatasetId]);
                        PatientDa ptDa  = new PatientDa();
                        ds = ptDa.ListPatientsByContactStatusPhysicianAndDisease(dsSQL, new string[]{FollowUpListCriteria}, SelectedTreatingPhysicianId,
                            GetSelectedTreatingPhysicianRole, SelectedPatientDisease, FollowUpListSortColumn, 
                            ResultsStartRow, ResultsNumOfRecordsToDisplay);

                        if (ds.Tables.Count > 0)
                        {
                            // clinic list has its own table headers
                            if (FollowUpListType == "ContactStatus")
                            {

                                if (ds.Tables[0].Rows.Count > 0)
                                {
                                    rptPatient.DataSource = ds.Tables[0].DefaultView;
                                    rptPatient.DataBind();
                                }

                                // three sp's used to retrieve patient lists and they all have an output parameter returning a record count
                                ResultsRecordCount = (int)ds.Tables[0].ExtendedProperties[ExtendedProperty.RowCount];

                                ResultsEndRow = ResultsNumOfRecordsToDisplay;

                                if (ResultsRecordCount > ResultsNumOfRecordsToDisplay)
                                {
                                        ResultsEndRow = ResultsStartRow + ResultsNumOfRecordsToDisplay;
                                        if (ResultsEndRow > ResultsRecordCount)
                                        {
                                            ResultsEndRow = ResultsRecordCount;
                                        }
                                    //}
                                    ResultsRecordMemo = "Displaying " + ResultsStartRow + " to " + ResultsEndRow + " of " + ResultsRecordCount + " patients";
                                }
                                else
                                {
                                    ResultsRecordMemo = ResultsRecordCount + " patients returned";
                                }

                                SetStatusButtons();
                            }

                        }
                    }

                    else // no records in datatable
                    {

                    }
                }
            }


        #endregion

        #region CLICK EVENTS

            protected void ContactStatusGV_RowDataBound(object sender, GridViewRowEventArgs e)
            {

                if (e.Row.RowType == DataControlRowType.DataRow)
                {
                    string rowContactStatus = DataBinder.Eval(e.Row.DataItem, "PtContactStatus").ToString();

                    if (rowContactStatus.Equals(""))
                    {
                        e.Row.Attributes["class"] = "";
                        e.Row.Attributes["onmouseover"] = "this.className='';";
                        e.Row.Attributes["onmouseout"] = "this.className='';";
                    }
                    else
                    {

                        if (FollowUpListType.Equals("ContactStatus") && FollowUpListCriteria == rowContactStatus)
                        {
                            e.Row.Attributes["class"] = "ReportList_ReportOuterContainerSelected";
                            e.Row.Focus();
                        }
                        else
                        {
                            e.Row.Attributes["class"] = "ReportList_ReportOuterContainer";
                        }

                        e.Row.Attributes["onclick"] = "javascript:location.href='LongitudinalFollowUp.aspx?listType=ContactStatus&listCrit=" + rowContactStatus + "&treatingPhysicianId=" + SelectedTreatingPhysicianId + "&treatingPatientDisease=" + SelectedPatientDisease + "'; ";
                    }

                }
            }
            protected void ContactStatus_Sorting(object sender, GridViewSortEventArgs e)
            {
                string sortExpression = e.SortExpression;
                ViewState["SortExpression"] = sortExpression;

                PatientDa patDa = new PatientDa();
                string datasetSql = CacheManager.GetDatasetSQL(Session[SessionKey.DatasetId]);
                DataSet contactStatusDs = patDa.GetDistinctContactStatusByPhysicianAndDisease(datasetSql,SelectedTreatingPhysicianId,GetSelectedTreatingPhysicianRole,SelectedPatientDisease);
                
                if (contactStatusDs.Tables.Count > 0)
                {
                    DataView dataView = new DataView(contactStatusDs.Tables[0]);
                    if (GVSortDirection == SortDirection.Ascending)
                        GVSortDirection = SortDirection.Descending;
                    else
                        GVSortDirection = SortDirection.Ascending;
                    dataView.Sort = sortExpression + " " + ConvertSortDirectionToSql(GVSortDirection);
                    
                    ContactStatusGV.DataSource = dataView;
                    ContactStatusGV.DataBind();
                }
            }

            protected void TreatingPhysicianDDL_SelectedIndexChanged(object sender, EventArgs e)
            {

                if (TreatingPhysicianDDL.SelectedIndex > 0 && !String.IsNullOrEmpty(TreatingPhysicianDDL.SelectedValue))
                    SelectedTreatingPhysicianId = Int32.Parse(TreatingPhysicianDDL.SelectedValue);
                else
                    SelectedTreatingPhysicianId = 0;

                PopulateContactStatusList();
                PopulateContactStatusResults();
            }

            protected void PatientDiseaseDDL_SelectedIndexChanged(object sender, EventArgs e)
            {
                if (PatientDiseaseDDL.SelectedIndex > 0)
                    SelectedPatientDisease = PatientDiseaseDDL.SelectedValue;
                else
                    SelectedPatientDisease = String.Empty;
             
                PopulateContactStatusList();
                PopulateContactStatusResults();
            }

            protected void rptItemDataBound(Object sender, RepeaterItemEventArgs e)
            {

                ConfigurePatientRepeater(sender, e);
            }


            private void ConfigurePatientRepeater(Object Sender, RepeaterItemEventArgs e)
            {
                string repeaterState = GetRepeaterStateByStatus(FollowUpListCriteria);

                if (e.Item.ItemType == ListItemType.Header)
                {
                    HtmlTableCell ImageButtonCellTitle = (HtmlTableCell)e.Item.FindControl("ImageButtonCellTitle");
                    HtmlTableCell CheckBoxCellTitle = (HtmlTableCell)e.Item.FindControl("CheckBoxCellTitle");
                    HtmlTableCell NameCellTitle = (HtmlTableCell)e.Item.FindControl("NameCellTitle");
                    HtmlTableCell DateOfBirthCellTitle = (HtmlTableCell)e.Item.FindControl("DateOfBirthCellTitle");
                    HtmlTableCell MRNCellTitle = (HtmlTableCell)e.Item.FindControl("MRNCellTitle");
                    HtmlTableCell CommentsCellTitle = (HtmlTableCell)e.Item.FindControl("CommentsCellTitle");
                    HtmlTableCell HrefLinkCellTitle = (HtmlTableCell)e.Item.FindControl("HrefLinkCellTitle");

                    if (repeaterState == PatientRepeaterState.GeneralV1)
                    {
                        ImageButtonCellTitle.Style["display"] = "none";
                        CheckBoxCellTitle.Style["display"] = "none";
                        NameCellTitle.Style["display"] = "";
                        DateOfBirthCellTitle.Style["display"] = "";
                        MRNCellTitle.Style["display"] = "";
                        CommentsCellTitle.Style["display"] = "";
                        HrefLinkCellTitle.Style["display"] = "none";

                        ImageButtonCellTitle.Style["width"] = "0%";
                        CheckBoxCellTitle.Style["width"] = "0%";
                        NameCellTitle.Style["width"] = "35%";
                        DateOfBirthCellTitle.Style["width"] = "10%";
                        MRNCellTitle.Style["width"] = "15%";
                        CommentsCellTitle.Style["width"] = "40%";
                        HrefLinkCellTitle.Style["width"] = "0%";
                    }
                    else if (repeaterState == PatientRepeaterState.GeneralV2)
                    {
                        ImageButtonCellTitle.Style["display"] = "";
                        CheckBoxCellTitle.Style["display"] = "none";
                        NameCellTitle.Style["display"] = "";
                        DateOfBirthCellTitle.Style["display"] = "";
                        MRNCellTitle.Style["display"] = "";
                        CommentsCellTitle.Style["display"] = "none";
                        HrefLinkCellTitle.Style["display"] = "none";

                        ImageButtonCellTitle.Style["width"] = "15%";
                        CheckBoxCellTitle.Style["width"] = "0%";
                        NameCellTitle.Style["width"] = "35%";
                        DateOfBirthCellTitle.Style["width"] = "25%";
                        MRNCellTitle.Style["width"] = "25%";
                        CommentsCellTitle.Style["width"] = "0%";
                        HrefLinkCellTitle.Style["width"] = "0%";
                    }


       
                }

                if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
                {

                    // create a reference to the current tr
                    System.Web.UI.HtmlControls.HtmlContainerControl listRow;
                    listRow = (System.Web.UI.HtmlControls.HtmlContainerControl)e.Item.FindControl("listRow");

                    HtmlTableCell ImageButtonCellValue = (HtmlTableCell)e.Item.FindControl("ImageButtonCellValue");
                    ImageButton ImageButtonValue = (ImageButton)e.Item.FindControl("ImageButtonValue");

                    HtmlTableCell CheckBoxCellValue = (HtmlTableCell)e.Item.FindControl("CheckBoxCellValue");
                    CheckBox CheckBoxValue = (CheckBox)e.Item.FindControl("CheckBoxValue");

                    HtmlTableCell NameCellValue = (HtmlTableCell)e.Item.FindControl("NameCellValue");
                    HtmlTableCell DateOfBirthCellValue = (HtmlTableCell)e.Item.FindControl("DateOfBirthCellValue");
                    HtmlTableCell MRNCellValue = (HtmlTableCell)e.Item.FindControl("MRNCellValue");
                    HtmlTableCell CommentsCellValue = (HtmlTableCell)e.Item.FindControl("CommentsCellValue");
                    
                    HtmlTableCell HrefLinkCellValue = (HtmlTableCell)e.Item.FindControl("HrefLinkCellValue");
                    Literal HrefLinkValue = (Literal)e.Item.FindControl("HrefLinkValue");

                    if (repeaterState == PatientRepeaterState.GeneralV1)
                    {
                        ImageButtonCellValue.Style["display"] = "none";
                        CheckBoxCellValue.Style["display"] = "none";
                        NameCellValue.Style["display"] = "";
                        DateOfBirthCellValue.Style["display"] = "";
                        MRNCellValue.Style["display"] = "";
                        CommentsCellValue.Style["display"] = "";
                        HrefLinkCellValue.Style["display"] = "none";
                        
                    }
                    else if (repeaterState == PatientRepeaterState.GeneralV2)
                    {
                        ImageButtonCellValue.Style["display"] = "";
                        CheckBoxCellValue.Style["display"] = "none";
                        NameCellValue.Style["display"] = "";
                        DateOfBirthCellValue.Style["display"] = "";
                        MRNCellValue.Style["display"] = "";
                        CommentsCellValue.Style["display"] = "none";
                        HrefLinkCellValue.Style["display"] = "none";

                        if (((DataRowView)e.Item.DataItem)[Patient.PatientId].ToString().Length > 0)
                        {
                            string utilityPageTitle = FollowUpListCriteria;
                            string alternateFileName = String.Empty;
                            string imageButtonFileName = FollowUpListCriteria + "Btn.gif";
                            int imageButtonWidth = 100;

                            if (FollowUpListCriteria == "NeedMD_Contact")
                            {
                                utilityPageTitle = "Need MD Contact";
                                imageButtonWidth = 60;
                            }
                            else if (FollowUpListCriteria == "NeedPtContactInfo")
                            {
                                utilityPageTitle = "Need Pt Contact Info";
                                imageButtonWidth = 90;
                            }
                            else if (FollowUpListCriteria.Contains("Letter") && FollowUpListCriteria.Contains("Sent"))
                            {
                                utilityPageTitle = "Letter Received";
                                imageButtonWidth = 75;
                                imageButtonFileName = "LetterReceivedBtn.gif";
                                alternateFileName = "StatusLetterReceived.aspx";
                            }
                            else if (FollowUpListCriteria == "PtAuthorizationRequested")
                            {
                                utilityPageTitle = "Authorization Received";
                                imageButtonWidth = 110;
                                imageButtonFileName = "AuthorizationReceivedBtn.gif";
                            }                              

                            string pId = ((DataRowView)e.Item.DataItem)[Patient.PatientId].ToString();
                            ImageButtonValue.Attributes.Add("onClick", "return runStatusUtility('" + utilityPageTitle + "','" + pId + "','" + alternateFileName + "');");
                            ImageButtonValue.ImageUrl = Page.ResolveUrl("~/Modules/FollowUp/Images/" + imageButtonFileName);
                            ImageButtonValue.Width = Unit.Point(imageButtonWidth);
                            
                        }
                        else
                        {
                            ImageButtonCellValue.Style["display"] = "none";
                        }


                    }

                    SetLinkToPagePatientData(Sender, e, NameCellValue);
                    NameCellValue.Style["text-decoration"] = "underline";
                }
            }


            private void SetLinkToPagePatientData(Object Sender, RepeaterItemEventArgs e, HtmlControl ctrl)
            {
                //// create a reference to the current tr
                //System.Web.UI.HtmlControls.HtmlContainerControl listRow;
                //listRow = (System.Web.UI.HtmlControls.HtmlContainerControl)e.Item.FindControl("listRow");


                // if the patient ID for this row is empty, clicking the row will cause a javascript alert.
                if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
                {
                    if (((DataRowView)e.Item.DataItem)["patientId"].ToString().Length > 0)
                    {
                        string localPatientId = ((DataRowView)e.Item.DataItem)["patientId"].ToString();

                        string currentClass = ctrl.Attributes["class"].ToString();

                        //ctrl.Attributes["class"] = currentClass;
                        //ctrl.Attributes["onmouseover"] = "this.className='ReportList_ReportOuterContainerSelected'";
                        //ctrl.Attributes["onmouseout"] = "this.className='" + currentClass + "';";
                        ctrl.Style["cursor"] = "pointer";
                        if (localPatientId == "")
                        {
                            ctrl.Attributes.Add("onClick", "javascript:alert('This patient is not in the database.  No information about this patient beyond the data listed on this page is currently available.');");
                        }
                        else
                        {
                            string urlVars = "epid=" + CustomCryptoHelper.Encrypt(localPatientId) + "&patientList=yes";
                            string url = Page.ResolveUrl("~/Core/DataEntryForms/Index.aspx?findClicked=true&epid=" + CustomCryptoHelper.Encrypt(localPatientId)) + "&patientList=yes";
                            ctrl.Attributes.Add("onClick", "top.location='" + url + "';");
                        }
                    }
                }
            }

            protected void ResetBtn_Click(object sender, ImageClickEventArgs e)
            {
                // reset all view states
                FollowUpClinicDate = String.Empty;
                FollowUpListCriteria = String.Empty;
                FollowUpListSortColumn = String.Empty;
                FollowUpListTitle = String.Empty;
                FollowUpListType = String.Empty;

                SelectedTreatingPhysicianId = 0;
                SelectedPatientDisease = String.Empty;

                Response.Redirect(HttpContext.Current.Request.ApplicationPath + "/Modules/FollowUp/LongitudinalFollowUp.aspx");

            }

        #endregion

        #region HELPER FUNCTIONS

            protected void SetClinicDate()
            {

                if (Request.Form.HasKeys() && Request.Form["clinicDate"] != null)
                {
                    FollowUpClinicDate = Request.Form["clinicDate"].ToString();
                    Session[SessionKey.CurrentClinicDate] = Request.Form["clinicDate"].ToString();
                }
                else if (!String.IsNullOrEmpty(FollowUpClinicDate))
                {
                    Session[SessionKey.CurrentClinicDate] = FollowUpClinicDate;
                }
                else
                {
                    SessionHandler sh = new SessionHandler(this.Page.Session);
                    FollowUpClinicDate = sh.GetCurrentClinicDate();
                }
            }

            protected void SetListType()
            {
                if (Request.QueryString.HasKeys() && Request.QueryString.Get("listType") != null)
                {
                    FollowUpListType = Request.QueryString.Get("listType").ToString();
                    Session[SessionKey.CurrentListType] = FollowUpListType;
                }
                else if (!String.IsNullOrEmpty(FollowUpListType))
                {
                    Session[SessionKey.CurrentListType] = FollowUpListType;
                }
                else
                    Session[SessionKey.CurrentListType] = String.Empty;
                //else if (Session[SessionKey.CurrentListType] != null && Session[SessionKey.CurrentListType].ToString().Length > 0)
                //{
                //    FollowUpListType = Session[SessionKey.CurrentListType].ToString();
                //}
            }

            protected void SetListCriteriaValue()
            {
                if (Request.QueryString.HasKeys() && Request.QueryString.Get("listCrit") != null)
                {
                    FollowUpListCriteria = Request.QueryString.Get("listCrit").ToString();
                    Session[SessionKey.CurrentListCrit] = FollowUpListCriteria;
                }
                else if (!String.IsNullOrEmpty(FollowUpListCriteria))
                {
                    Session[SessionKey.CurrentListCrit] = FollowUpListCriteria;
                }
                else
                    Session[SessionKey.CurrentListCrit] = String.Empty;

            }

            protected void SetListSortOrder()
            {

                if (Request.QueryString.HasKeys() && null != Request.QueryString["sortColumn"])
                {
                    FollowUpListSortColumn = Request.QueryString["sortColumn"];
                }

            }

            protected void SetListStartRow()
            {
                if (Request.QueryString.HasKeys() && null != Request.QueryString["startRow"])
                {
                    ResultsStartRow = int.Parse(Request.QueryString["startRow"]);
                }
            }

            protected void SetPatientListTitle()
            {
                // set the page title and also set listMod for category list
                switch (FollowUpListType)
                {

                    case "ContactStatus":
                        FollowUpListTitle = "Contact Status:  " + FollowUpListCriteria;
                        break;

                    default:
                        FollowUpListTitle = FollowUpListType + ":  " + FollowUpListCriteria;
                        break;
                }

            }

            protected void SetPhysicianDropDownValue()
            {

                if (Request.QueryString.HasKeys() && Request.QueryString.Get("treatingPhysicianId") != null && SelectedTreatingPhysicianId == 0)
                {
                    SelectedTreatingPhysicianId = Int32.Parse(Request.QueryString.Get("treatingPhysicianId").ToString());
                }

                if (!IsPostBack && SelectedTreatingPhysicianId != 0 && TreatingPhysicianDDL.SelectedValue != SelectedTreatingPhysicianId.ToString())
                    TreatingPhysicianDDL.SelectedValue = SelectedTreatingPhysicianId.ToString();
            }

            protected void SetDiseaseDropDownValue()
            {

                if (Request.QueryString.HasKeys() && Request.QueryString.Get("treatingPatientDisease") != null && String.IsNullOrEmpty(SelectedPatientDisease))
                {
                    SelectedPatientDisease = Request.QueryString.Get("treatingPatientDisease").ToString();
                }
                if (!IsPostBack && !String.IsNullOrEmpty(SelectedPatientDisease) && PatientDiseaseDDL.SelectedValue != SelectedPatientDisease)
                    PatientDiseaseDDL.SelectedValue = SelectedPatientDisease;
            }

        private void PopulatePhysicianDropDown()
        {
            PatientPhysicianDa ptPhDa = new PatientPhysicianDa();
            string datasetSql = CacheManager.GetDatasetSQL(Session[SessionKey.DatasetId]);
            DataSet ptPhDs = ptPhDa.GetDistinctPatientPhysiciansByRole("Treating", datasetSql);

            if (ptPhDs.Tables.Count > 0)
            {
                TreatingPhysicianDDL.DataTextField = "PhName";
                TreatingPhysicianDDL.DataValueField = Physician.PhysicianId;
                TreatingPhysicianDDL.DataSource = ptPhDs.Tables[0].DefaultView;
                TreatingPhysicianDDL.DataBind();
                TreatingPhysicianDDL.Items.Insert(0, new ListItem(_dropDownDefaultPhysicianValue, String.Empty));

            }


        }


        private void PopulateDiseaseDropDown()
        {
            PatientDiseaseDa ptDsDa = new PatientDiseaseDa();
            string datasetSql = CacheManager.GetDatasetSQL(Session[SessionKey.DatasetId]);
            DataSet ptDsDs = ptDsDa.GetDistinctPatientDiseases(datasetSql);

            if (ptDsDs.Tables.Count > 0)
            {
                PatientDiseaseDDL.DataTextField = Disease.DiseaseName;
                PatientDiseaseDDL.DataValueField = Disease.DiseaseName;
                PatientDiseaseDDL.DataSource = ptDsDs.Tables[0].DefaultView;
                PatientDiseaseDDL.DataBind();
                PatientDiseaseDDL.Items.Insert(0, new ListItem(_dropDownDefaultDiseaseValue,String.Empty));
            }


        }

        private string ConvertSortDirectionToSql(SortDirection sortDirection)
        {
            string newSortDirection = String.Empty;

            switch (sortDirection)
            {
                case SortDirection.Ascending:
                    newSortDirection = "ASC";
                    break;

                case SortDirection.Descending:
                    newSortDirection = "DESC";
                    break;
            }

            return newSortDirection;
        }



        private void SetResultsDisplay(string mode)
        {
            switch (mode.ToUpper())
            {
                case "START": ContactStatusStartDIV.Style["display"] = String.Empty;
                               ContactStatusResultsDIV.Style["display"] = "none";
                               ContactStatusButtonsDIV.Style["display"] = "none";
                               break;

                case "RESULTS": ContactStatusStartDIV.Style["display"] = "none";
                               ContactStatusResultsDIV.Style["display"] = String.Empty;
                                ContactStatusButtonsDIV.Style["display"] = DisplayButtonDiv(FollowUpListCriteria) ? String.Empty : "none";
                                break;

                default: ContactStatusStartDIV.Style["display"] = String.Empty;
                           ContactStatusResultsDIV.Style["display"] = "none";
                           ContactStatusButtonsDIV.Style["display"] = "none";
                           break;
            }
        }



        private String GetRepeaterStateByStatus(string status)
        {

            switch (status.ToUpper())
            {
                case "CURRENT": return PatientRepeaterState.GeneralV1;
                case "LETTER1_SENT": return PatientRepeaterState.GeneralV2;
                case "LETTER2_SENT": return PatientRepeaterState.GeneralV2;
                case "LETTER3_SENT": return PatientRepeaterState.GeneralV2;
                case "NEEDTUMORREGISTRYCHECK": return PatientRepeaterState.GeneralV1;
                case "NEEDSSDI_CHECK": return PatientRepeaterState.GeneralV1;
                case "NEEDLETTER1": return PatientRepeaterState.GeneralV1;
                case "NEEDLETTER2": return PatientRepeaterState.GeneralV1;
                case "NEEDLETTER3": return PatientRepeaterState.GeneralV1;
                case "NEEDDATAENTRY": return PatientRepeaterState.GeneralV1;
                case "NEEDPTAUTHORIZATION": return PatientRepeaterState.GeneralV1;
                case "PTAUTHORIZATIONREQUESTED": return PatientRepeaterState.GeneralV2;
                case "NEEDMD_CONTACT": return PatientRepeaterState.GeneralV2;
                case "MD_CONTACTED": return PatientRepeaterState.GeneralV1;
                case "NEEDMD_TOCALLPT": return PatientRepeaterState.GeneralV1;
                case "LOSTTOFOLLOWUP": return PatientRepeaterState.GeneralV1;
                case "DONOTCONTACTPERPT": return PatientRepeaterState.GeneralV1;
                case "DONOTCONTACTPERMD": return PatientRepeaterState.GeneralV1;
                case "NEEDPTCONTACTINFO": return PatientRepeaterState.GeneralV2;

                default: return PatientRepeaterState.GeneralV1;
            }
        }


        private Boolean DisplayButtonDiv(string status)
        {

            switch (status.ToUpper())
            {
                case "CURRENT": return false;
                case "LETTER1_SENT": return true;
                case "LETTER2_SENT": return true;
                case "LETTER3_SENT": return true;
                case "NEEDTUMORREGISTRYCHECK": return true;
                case "NEEDSSDI_CHECK": return true;
                case "NEEDLETTER1": return true;
                case "NEEDLETTER2": return true;
                case "NEEDLETTER3": return true;
                case "NEEDDATAENTRY": return true;
                case "NEEDPTAUTHORIZATION": return true;
                case "PTAUTHORIZATIONREQUESTED": return true;
                case "NEEDMD_CONTACT": return false;
                case "MD_CONTACTED": return true;
                case "NEEDMD_TOCALLPT": return true;
                case "LOSTTOFOLLOWUP": return false;
                case "DONOTCONTACTPERPT": return false;
                case "DONOTCONTACTPERMD": return false;
                case "NEEDPTCONTACTINFO": return false;

                default: return false;
            }
        }


        private void SetStatusButtons()
        {
            if (DisplayButtonDiv(FollowUpListCriteria))
            {

                if (FollowUpListCriteria.ToUpper() == "NEEDTUMORREGISTRYCHECK")
                {
                    SetStatusButton(StatusBtn1,true, "Tumor Registry Checked", 0, 0);
                    SetStatusButton(StatusBtn2,false, "", 0, 0);
                    SetStatusButton(StatusBtn3,false, "", 0, 0);
                    SetStatusButton(StatusBtn4,false, "", 0, 0);

                    StatusBtn1.Attributes.Add("onClick", "return runStatusUtility('Tumor Registry Checked','','');");
                    StatusBtn1.ImageUrl = Page.ResolveUrl("~/Modules/FollowUp/Images/" + FollowUpListCriteria + "Btn.gif");
                }
                else if (FollowUpListCriteria.ToUpper() == "NEEDSSDI_CHECK")
                {
                    SetStatusButton(StatusBtn1,true, "Start SSDI Utility", 0, 0);
                    SetStatusButton(StatusBtn2,false, "", 0, 0);
                    SetStatusButton(StatusBtn3,false, "", 0, 0);
                    SetStatusButton(StatusBtn4,false, "", 0, 0);

                    // set onclick event
                    if (!String.IsNullOrEmpty(GetSSDIUrl))
                    {
                        //StatusBtn1.HRef = GetSSDIUrl;
                        StatusBtn1.PostBackUrl = GetSSDIUrl;
                    }
                    else
                        // do not allow user to go to module
                        StatusBtn1.Visible = false;

                     StatusBtn1.ImageUrl = Page.ResolveUrl("~/Modules/FollowUp/Images/" + FollowUpListCriteria + "Btn.gif");

                }
                else if (FollowUpListCriteria.ToUpper() == "NEEDMD_TOCALLPT")
                {
                    SetStatusButton(StatusBtn1,true, "Patient Called", 0, 0);
                    SetStatusButton(StatusBtn2,false, "", 0, 0);
                    SetStatusButton(StatusBtn3,false, "", 0, 0);
                    SetStatusButton(StatusBtn4,false, "", 0, 0);

                    StatusBtn1.Attributes.Add("onClick", "return runStatusUtility('Patient Called','','');");
                    StatusBtn1.ImageUrl = Page.ResolveUrl("~/Modules/FollowUp/Images/" + FollowUpListCriteria + "Btn.gif");
                }
                else if (FollowUpListCriteria.ToUpper() == "NEEDLETTER1" || 
                         FollowUpListCriteria.ToUpper() == "NEEDLETTER2" || 
                         FollowUpListCriteria.ToUpper() == "NEEDLETTER3")
                {
                    SetStatusButton(StatusBtn1,true, "Start \"Need Letter(s)\" Utility", 0, 0);
                    SetStatusButton(StatusBtn2,false, "", 0, 0);
                    SetStatusButton(StatusBtn3,false, "", 0, 0);
                    SetStatusButton(StatusBtn4,false, "", 0, 0);

                    StatusBtn1.Attributes.Add("onClick", "return runStatusUtility('Need Letter','','StatusNeedLetter.aspx');");
                    StatusBtn1.ImageUrl = Page.ResolveUrl("~/Modules/FollowUp/Images/NeedLetterBtn.gif");
                }
                else if (FollowUpListCriteria.ToUpper() == "LETTER1_SENT" ||
                         FollowUpListCriteria.ToUpper() == "LETTER2_SENT" ||
                         FollowUpListCriteria.ToUpper() == "LETTER2_SENT")
                {
                    SetStatusButton(StatusBtn1, true, "Check For Completed Online Surveys", 0, 0);
                    SetStatusButton(StatusBtn2, false, "", 0, 0);
                    SetStatusButton(StatusBtn3, false, "", 0, 0);
                    SetStatusButton(StatusBtn4, false, "", 0, 0);

                    StatusBtn1.Attributes.Add("onClick", "return runStatusUtility('Retrieve Completed Online Surveys','','RetreiveRedCapSurveys.aspx');");
                    StatusBtn1.ImageUrl = Page.ResolveUrl("~/Modules/FollowUp/Images/RunOnlineSurveysUtility.gif");
                }
                else if (FollowUpListCriteria.ToUpper() == "NEEDPTAUTHORIZATION")
                {
                    SetStatusButton(StatusBtn1,true, "Start Patient Authorization Utility", 0, 0);
                    SetStatusButton(StatusBtn2,false, "", 0, 0);
                    SetStatusButton(StatusBtn3,false, "", 0, 0);
                    SetStatusButton(StatusBtn4,false, "", 0, 0);

                    StatusBtn1.Attributes.Add("onClick", "return runStatusUtility('HIPAA Authorization','','');");
                    StatusBtn1.ImageUrl = Page.ResolveUrl("~/Modules/FollowUp/Images/" + FollowUpListCriteria + "Btn.gif");
                }
                else if (FollowUpListCriteria.ToUpper() == "PTAUTHORIZATIONREQUESTED")
                {
                    SetStatusButton(StatusBtn1, true, "Check For Completed Online Forms", 0, 0);
                    SetStatusButton(StatusBtn2, false, "", 0, 0);
                    SetStatusButton(StatusBtn3, false, "", 0, 0);
                    SetStatusButton(StatusBtn4, false, "", 0, 0);

                    StatusBtn1.Attributes.Add("onClick", "return runStatusUtility('Retrieve Completed Online Forms','','RetreiveRedCapSurveys.aspx');");
                    StatusBtn1.ImageUrl = Page.ResolveUrl("~/Modules/FollowUp/Images/RunOnlineFormsUtility.gif");
                }
                else if (FollowUpListCriteria.ToUpper() == "MD_CONTACTED")
                {
                    SetStatusButton(StatusBtn1, true, "MD Contacted", 0, 0);
                    SetStatusButton(StatusBtn2, false, "", 0, 0);
                    SetStatusButton(StatusBtn3, false, "", 0, 0);
                    SetStatusButton(StatusBtn4, false, "", 0, 0);

                    StatusBtn1.Attributes.Add("onClick", "return runStatusUtility('MD Contacted','','');");
                    StatusBtn1.ImageUrl = Page.ResolveUrl("~/Modules/FollowUp/Images/" + FollowUpListCriteria + "Btn.gif");
                }
                else if (FollowUpListCriteria.ToUpper() == "NEEDDATAENTRY")
                {
                    SetStatusButton(StatusBtn1, true, "Need Data Entry", 0, 0);
                    SetStatusButton(StatusBtn2, false, "", 0, 0);
                    SetStatusButton(StatusBtn3, false, "", 0, 0);
                    SetStatusButton(StatusBtn4, false, "", 0, 0);

                    StatusBtn1.Attributes.Add("onClick", "return runStatusUtility('Need Data Entry','','');");
                    StatusBtn1.ImageUrl = Page.ResolveUrl("~/Modules/FollowUp/Images/" + FollowUpListCriteria + "Btn.gif");
                }
                else
                {
                    SetStatusButton(StatusBtn1, false, "", 0, 0);
                    SetStatusButton(StatusBtn2, false, "", 0, 0);
                    SetStatusButton(StatusBtn3, false, "", 0, 0);
                    SetStatusButton(StatusBtn4, false, "", 0, 0);

                }
            }
            else
            {
                SetStatusButton(StatusBtn1, false, "", 0, 0);
                SetStatusButton(StatusBtn2, false, "", 0, 0);
                SetStatusButton(StatusBtn3, false, "", 0, 0);
                SetStatusButton(StatusBtn4, false, "", 0, 0);

            }

        }

        private void SetStatusButton(ImageButton control,Boolean showLink, string lintTitle, int widthPixels, int heightPixels)
        {
            control.Visible = showLink;

            if (showLink)
            {
                control.AlternateText = lintTitle;
                control.Width = widthPixels != 0 ? widthPixels : control.Width;
                control.Height = heightPixels != 0 ? heightPixels : control.Width;
                control.Style.Add("cursor", "pointer");
            }
            else
            {
                control.AlternateText = String.Empty;
                control.Width = 0;
                control.Height = 0; 

            }
        }


        #endregion




 
}
}