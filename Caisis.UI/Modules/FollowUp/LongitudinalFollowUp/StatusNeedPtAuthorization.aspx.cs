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
using System.Linq;

namespace Caisis.UI.Modules.FollowUp
{
    public partial class StatusNeedPtAuthorization : FollowUpBasePage
    {

        private XmlDocument xDocFollowUp;
        // comma separated list of patient Ids to pass in qs when printing labels
        protected string printLabelsPageUrlvVars = String.Empty;
        protected const string _printLabelsPage = "../PrintLabels.aspx";

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

        private int _recordCount = 0;
        protected int ResultsRecordCount
        {
            get
            {
                if (ViewState["recordCount"] == null)
                    ViewState["recordCount"] = "0";
                return Int32.Parse(ViewState["recordCount"].ToString());
            }
            set { ViewState["recordCount"] = value; }
        }

        private string _recordMemo = String.Empty;
        protected String ResultsRecordMemo
        {
            get { return _recordMemo; }
            set { _recordMemo = value; }
        }


        public StatusNeedPtAuthorization()
        {
            xDocFollowUp = XmlUtil.GetFollowUpXml();
        }

        public String PrintingInstructions
        {
            get
            {
                XmlNodeList rulesNodes = xDocFollowUp.SelectSingleNode("/surveyrules") != null ? xDocFollowUp.SelectSingleNode("/surveyrules").ChildNodes : null;

                foreach (XmlNode currNode in rulesNodes)
                {
                    bool ruleActive = false;
                    if (currNode.Attributes["type"] != null && currNode.Attributes["type"].Value.ToLower().Equals("hippaprintinginstructions") && Boolean.TryParse(currNode.Attributes["active"].Value, out ruleActive))
                    {
                        if (ruleActive)
                        {
                            return currNode != null ? currNode.InnerXml.Trim() + "<b style=\"color: blue;\">Click \"Printing Complete\" button when done.</b>" : String.Empty; 
                        }
                    }
                }

                return String.Empty;
            }
        }

        public String EmailingInstructions
        {
            get
            {
                XmlNodeList rulesNodes = xDocFollowUp.SelectSingleNode("/surveyrules") != null ? xDocFollowUp.SelectSingleNode("/surveyrules").ChildNodes : null;

                foreach (XmlNode currNode in rulesNodes)
                {
                    bool ruleActive = false;
                    if (currNode.Attributes["type"] != null && currNode.Attributes["type"].Value.ToLower().Equals("hippaemailinginstructions") && Boolean.TryParse(currNode.Attributes["active"].Value, out ruleActive))
                    {
                        if (ruleActive)
                        {
                            return currNode != null ? currNode.InnerXml.Trim() : String.Empty;
                        }
                    }
                }

                return String.Empty;
            }
        }
        protected void Page_Init(object sender, EventArgs e)
        {
            this.EnableViewState = true;

            // Set list criteria variable
            this.SetListCriteriaValue();
            this.SetPhysicianId();
            this.SetDisease();

            if (!IsPostBack)
            {
                SetPageView("Select");
                RbPrintTypeSurveys.Checked = true;
                RbPrintTypeLabels.Checked = false;
                OnRbPrintTypeLabelsCheckChange(sender, e);
            }
            else
            {
                this.SetRecordCount();
            }
            PopulateResults();
        
        }
        protected override void Page_Load(object sender, EventArgs e)
        {
           //base.Page_Load(sender, e);
        }

        private void PopulateResults()
        {
            if (!String.IsNullOrEmpty(FollowUpListCriteria))
            {

                PatientListController ct = new PatientListController();
                DataSet ds = null;

                // get list of patients
                string dsSQL = CacheManager.GetDatasetSQL(Session[SessionKey.DatasetId]);
                PatientDa ptDa = new PatientDa();
                //ds = ptDa.ListPatientsByContactStatusPhysicianAndDisease(dsSQL, new string[]{FollowUpListCriteria}, SelectedTreatingPhysicianId,
                //    "Treating", SelectedPatientDisease, "", 0, 0);
                ds = ptDa.ListPatientsByContactStatusPhysicianAndDisease(dsSQL, new string[] { "NeedPtAuthorization" }, SelectedTreatingPhysicianId,
                    "Treating", SelectedPatientDisease, "", 0, 0);

                if (ds.Tables.Count > 0)
                {
                        if (ds.Tables[0].Rows.Count > 0)
                        {
                            rptPatient.DataSource = ds.Tables[0].DefaultView;
                            rptPatient.DataBind();
                        }

                        // three sp's used to retrieve patient lists and they all have an output parameter returning a record count
                        ResultsRecordCount = (int)ds.Tables[0].ExtendedProperties[ExtendedProperty.RowCount];
                        ResultsRecordMemo = ResultsRecordCount + " patients returned";

                }
            }



        }

        protected void rptItemDataBound(Object sender, RepeaterItemEventArgs e)
        {
            ConfigurePatientRepeater(sender, e);
        }


        private void ConfigurePatientRepeater(Object Sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Header)
            {
                HtmlTableCell ControlCellTitle = (HtmlTableCell)e.Item.FindControl("ControlCellTitle");
                HtmlTableCell ControlCellTitle2 = (HtmlTableCell)e.Item.FindControl("ControlCellTitle2");
                HtmlTableCell NameCellTitle = (HtmlTableCell)e.Item.FindControl("NameCellTitle");
                HtmlTableCell MRNCellTitle = (HtmlTableCell)e.Item.FindControl("MRNCellTitle");
                HtmlTableCell PhysicianTreatingCellTitle = (HtmlTableCell)e.Item.FindControl("PhysicianTreatingCellTitle");
                HtmlTableCell SurveysDueCellTitle = (HtmlTableCell)e.Item.FindControl("SurveysDueCellTitle");

                ControlCellTitle.Style["display"] = "";
                ControlCellTitle2.Style["display"] = "";
                NameCellTitle.Style["display"] = "";
                MRNCellTitle.Style["display"] = "";
                PhysicianTreatingCellTitle.Style["display"] = "";
                SurveysDueCellTitle.Style["display"] = "";

                ControlCellTitle.Style["width"] = "5%";
                ControlCellTitle2.Style["width"] = "5%";
                NameCellTitle.Style["width"] = "25%";
                MRNCellTitle.Style["width"] = "20%";
                PhysicianTreatingCellTitle.Style["width"] = "25%";
                SurveysDueCellTitle.Style["width"] = "20%";
            }

            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {

                // create a reference to the current tr
                System.Web.UI.HtmlControls.HtmlContainerControl listRow;
                listRow = (System.Web.UI.HtmlControls.HtmlContainerControl)e.Item.FindControl("listRow");

                HtmlTableCell ControlCellValue = (HtmlTableCell)e.Item.FindControl("ControlCellValue");
                HtmlTableCell ControlCellValue2 = (HtmlTableCell)e.Item.FindControl("ControlCellValue2");

                Label StatusPatientId = (Label)e.Item.FindControl("StatusPatientId");
                HtmlTableCell NameCellValue = (HtmlTableCell)e.Item.FindControl("NameCellValue");
                HtmlTableCell MRNCellValue = (HtmlTableCell)e.Item.FindControl("MRNCellValue");
                HtmlTableCell PhysicianTreatingCellValue = (HtmlTableCell)e.Item.FindControl("PhysicianTreatingCellValue");
                HtmlTableCell SurveysDueCellValue = (HtmlTableCell)e.Item.FindControl("SurveysDueCellValue");

                CheckBox EmailCB = (CheckBox)e.Item.FindControl("EmailCB");
                CheckBox PrintCB = (CheckBox)e.Item.FindControl("PrintCB");

                Literal PhysicianTreating = (Literal)e.Item.FindControl("PhysicianTreating");

                Label SurveysDue = (Label)e.Item.FindControl("SurveysDue");
                Label SurveysDueFileNames = (Label)e.Item.FindControl("SurveysDueFileNames");
                Label SurveyMenuLinkTitle = (Label)e.Item.FindControl("SurveyMenuLinkTitle");
                HtmlAnchor SurveyMenuLink = (HtmlAnchor)e.Item.FindControl("SurveyMenuLink");
                HtmlGenericControl SurveyPacketMenuDiv = (HtmlGenericControl)e.Item.FindControl("SurveyPacketMenuDiv");

                ControlCellValue.Style["display"] = "";
                ControlCellValue2.Style["display"] = "";
                NameCellValue.Style["display"] = "";
                MRNCellValue.Style["display"] = "";
                PhysicianTreatingCellValue.Style["display"] = "";
                SurveysDueCellValue.Style["display"] = "";

                SetLinkToPagePatientData(Sender, e, NameCellValue);
                NameCellValue.Style["text-decoration"] = "underline";

                EmailCB.Attributes.Add("onClick", "return mutuallyExcludeCheckbox(" + EmailCB.ClientID + "," + PrintCB.ClientID + ",'email');");
                PrintCB.Attributes.Add("onClick", "return mutuallyExcludeCheckbox(" + EmailCB.ClientID + "," + PrintCB.ClientID + ",'mail');");

                // re-populate checkbox counter (postback)
                int counter = 0;
                if (EmailCB.Checked)
                {
                    if (int.TryParse(NumOfPatientsToEmail.Text, out counter))
                        NumOfPatientsToEmail.Text = (counter + 1).ToString();
                }
                if (PrintCB.Checked)
                {
                    if (int.TryParse(NumOfPatientsToMail.Text, out counter))
                        NumOfPatientsToMail.Text = (counter + 1).ToString();
                }

                string currentStatus = String.Empty;
                if (((DataRowView)e.Item.DataItem)[BOL.Patient.PtContactStatus].ToString().Length > 0)
                {
                    currentStatus = ((DataRowView)e.Item.DataItem)[BOL.Patient.PtContactStatus].ToString();
                }

                int patientId;
                if (Int32.TryParse(StatusPatientId.Text, out patientId))
                {
                    //get patient's treating physician, if any
                    PatientPhysicianDa ptPhDa = new PatientPhysicianDa();
                    DataView patientPhysiciansDv = ptPhDa.GetPatientPhysicians(patientId).DefaultView;
                    patientPhysiciansDv.RowFilter = PatientPhysician.PtPhRole + " = 'Treating' ";
                    if (patientPhysiciansDv.Count > 0)
                        PhysicianTreating.Text = patientPhysiciansDv[0]["PhysicianName"].ToString();

                    // set survey sent/due fields
                    SurveyMenuLinkTitle.Text = currentStatus;
                    SurveyMenuLinkTitle.Style["text-decoration"] = "underline";
                    SurveyMenuLinkTitle.Style["cursor"] = "pointer";
                    SurveyMenuLink.Attributes["onclick"] = "ShowGetNeedPtAuthorizationPacket('" + patientId.ToString() + "','" + SurveyPacketMenuDiv.ClientID + "','" + SurveyMenuLinkTitle.ClientID + "','" + SurveysDue.ClientID + "','" + SurveysDueFileNames.ClientID + "');";
                    SurveyMenuLink.Attributes["onmouseout"] = "HideGetNeedPtAuthorizationPacket('" + SurveyPacketMenuDiv.ClientID + "','" + SurveyMenuLinkTitle.ClientID + "','" + SurveysDue.ClientID + "','" + SurveysDueFileNames.ClientID + "');";
                }

            }
        }
        private void SetLinkToPagePatientData(Object Sender, RepeaterItemEventArgs e, HtmlControl ctrl)
        {
            // if the patient ID for this row is empty, clicking the row will cause a javascript alert.
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                if (((DataRowView)e.Item.DataItem)["patientId"].ToString().Length > 0)
                {
                    string localPatientId = ((DataRowView)e.Item.DataItem)["patientId"].ToString();

                    string currentClass = ctrl.Attributes["class"].ToString();
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


        #region CLICK EVENTS

        protected void Repeater1_ItemCreated(object o, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                CheckBox EmailCB = (CheckBox)e.Item.FindControl("EmailCB");
                CheckBox PrintCB = (CheckBox)e.Item.FindControl("PrintCB");
                CheckBox DoNotContactPerMDCB = (CheckBox)e.Item.FindControl("DoNotContactPerMDCB");
                
                //EmailCB.CheckedChanged += new EventHandler(EmailCB_CheckedChanged);
                //PrintCB.CheckedChanged += new EventHandler(PrintCB_CheckedChanged);
                //DoNotContactPerMDCB.CheckedChanged += new EventHandler(DoNotContactPerMDCB_CheckedChanged);

                //EmailCB.Attributes.Add("onClick", "return mutuallyExcludeCheckbox(" + EmailCB.ClientID + "," + PrintCB.ClientID + "," + DoNotContactPerMDCB.ClientID + ");");
                //PrintCB.Attributes.Add("onClick", "return mutuallyExcludeCheckbox(" + PrintCB.ClientID + "," + EmailCB.ClientID + "," + DoNotContactPerMDCB.ClientID + ");");
                //DoNotContactPerMDCB.Attributes.Add("onClick", "return mutuallyExcludeCheckbox(" + DoNotContactPerMDCB.ClientID + "," + EmailCB.ClientID + "," + PrintCB.ClientID + ");");
            }

        }

        protected void Repeater1_ItemCommand(object o, RepeaterCommandEventArgs e)
        {

        }

        protected void EmailCB_CheckedChanged(Object sender, EventArgs e)
        {

        }

        protected void PrintCB_CheckedChanged(Object sender, EventArgs e)
        {

        }


        protected void OnRbPrintTypeLabelsCheckChange(object sender, EventArgs e)
        {              
                LoadPrintingMaterial();
                SetOptionMode(2);
        }

        protected void LoadPrintingMaterial()
        {
            DataView dv = new DataView(GetSelectedPatients());
            if (dv.Table.Columns.Contains("Mail"))
            {

                dv.RowFilter = "Mail = 1";
                if (dv.Count > 0)
                {
                    string patientIds = String.Empty;
                    foreach (DataRowView drv in dv)
                    {
                        if (String.IsNullOrEmpty(patientIds))
                            patientIds = drv[Patient.PatientId].ToString();
                        else
                            patientIds = patientIds + "," + drv[Patient.PatientId].ToString();
                    }

                    if (RbPrintTypeSurveys.Checked)
                    {
                        

                        PrintSurveysLetterDiv.Style["display"] = "";
                        PrintLabelsDiv.Style["display"] = "none";
                        printFormButtonAnchor.Visible = false;
                        printFormButtonAnchor.HRef = "";

                        Page.ClientScript.RegisterStartupScript(this.GetType(), "", "SetPrintPackageSource('" + CustomCryptoHelper.Encrypt(patientIds) + "') ", true);
                    }
                    else if (RbPrintTypeLabels.Checked)
                    {
                        PrintSurveysLetterDiv.Style["display"] = "none";
                        PrintLabelsDiv.Style["display"] = "";
                        printFormButtonAnchor.Visible = true;
                        printFormButtonAnchor.HRef = "javascript:printAddressLabels();";

                        Page.ClientScript.RegisterStartupScript(this.GetType(), "", "LoadAddressLabels('" + CustomCryptoHelper.Encrypt(patientIds) + "') ", true);

                    }
                }
            }
      

        }


        protected void SelectPatientsClick(object sender, EventArgs e)
        {
            DataView dv = new DataView(GetSelectedPatients());

            dv.RowFilter = "Email = 1";
            NumOfPatientsToEmail.Text = dv.Count.ToString();
            dv.RowFilter = "Mail = 1";
            NumOfPatientsToMail.Text = dv.Count.ToString();

            SetPageView("Select");
        }
        
        protected void PatientsSelectedClick(object sender, EventArgs e)
        {
            SetOptionMode(0);

            DataView dv = new DataView(GetSelectedPatients());
            if (dv.Table.Columns.Contains("Email"))
            {

                dv.RowFilter = "Email = 1";
                if (dv.Count == 0)
                {
                    Option1RB.Enabled = false;
                    Option1Title.Text = "No emails to send.";
                    Option1Title.ForeColor = System.Drawing.Color.Gray;
                }
                else if (dv.Count == 1)
                    Option1Title.Text = "Send emails for " + dv.Count + " patient.";
                else if (dv.Count > 1)
                    Option1Title.Text = "Send emails for " + dv.Count + " patients.";               
            }
            else
            {
                Option1RB.Enabled = false;
                Option1Title.Text = "No emails to send.";
                Option1Title.ForeColor = System.Drawing.Color.Gray;
            }

            if (dv.Table.Columns.Contains("Mail"))
            {
                dv.RowFilter = "Mail = 1";
                if (dv.Count == 0)
                {
                    Option2RB.Enabled = false;
                    Option2Title.Text = "No packages to print.";
                    Option2Title.ForeColor = System.Drawing.Color.Gray;
                }
                else if (dv.Count == 1)
                    Option2Title.Text = "Print packages for " + dv.Count + " patient.";
                else if (dv.Count > 1)
                    Option2Title.Text = "Print packages for " + dv.Count + " patients.";

            }
            else
            {
                Option2RB.Enabled = false;
                Option2Title.Text = "No packages to print.";
                Option2Title.ForeColor = System.Drawing.Color.Gray;
            }

            SetPageView("Process");
        }

        protected void Option1RB_CheckedChanged(object sender, EventArgs e)
        {
            SetOptionMode(1);
        }
        protected void Option2RB_CheckedChanged(object sender, EventArgs e)
        {
            LoadPrintingMaterial();
            SetOptionMode(2);
            Option2Details.Text = PrintingInstructions;
        }

        protected void PrintingCompleteClick(object sender, EventArgs e)
        {

            DataView dv = new DataView(GetSelectedPatients());
            dv.RowFilter = "Mail = 1";
            int count = 0;
            foreach (DataRowView drv in dv)
            {
                // set patient status and create action items for PtAuthorizationRequested
                ActionDa actionDa = new ActionDa();
                BOL.Action actionObj = new Caisis.BOL.Action();
                Patient ptObj = new Patient();
                ptObj.Get(Int32.Parse(drv[BOL.Patient.PatientId].ToString()));

                if (!ptObj.IsEmpty)
                {
                    ptObj[Patient.PtContactStatus] = "PtAuthorizationRequested";
                    actionObj[BOL.Action.ActionItem] = "PtAuthorizationRequested";

                    UserController userCt = new UserController();
                    int currentUserId = userCt.GetUserId();
                    UserDa currentUserDa = new UserDa();
                    DataSet currentUserDs = currentUserDa.GetByUserId(userCt.GetUserId());
                    ptObj[Patient.UpdatedBy] = (currentUserDs.Tables.Count > 0 && currentUserDs.Tables[0].Rows.Count > 0) ? currentUserDs.Tables[0].Rows[0][BOL.User.UserName].ToString() : "not specified";
                    ptObj[Patient.UpdatedTime] = DateTime.Today;
                    ptObj.Save();

                    actionObj[BOL.Action.PatientId] = Int32.Parse(drv[BOL.Patient.PatientId].ToString());
                    actionObj[BOL.Action.ActionDateText] = DateTime.Today.ToShortDateString();
                    actionObj[BOL.Action.ActionDate] = DateTime.Today;
                    actionObj[BOL.Action.EnteredBy] = (currentUserDs.Tables.Count > 0 && currentUserDs.Tables[0].Rows.Count > 0) ? currentUserDs.Tables[0].Rows[0][BOL.User.UserName].ToString() : "not specified";
                    actionObj[BOL.Action.EnteredTime] = DateTime.Now;
                    actionObj.Save();

                    count++;
                }
            }

            if (count > 0)
            {
                Option2RB.Checked = false;
                Option2RB.Enabled = false;
                Option2Title.Text = "No packages to print.";
                Option2Title.ForeColor = System.Drawing.Color.Gray;
                Option2ResultDiv.Style["display"] = "none";
                Option2Details.Text = String.Empty;

                RemovePatientFromNeedLetterList(dv, "Mail");
            }
        }

        private void RemovePatientFromNeedLetterList(DataView dv, string corresondenceType)
        {
            foreach (RepeaterItem rItem in rptPatient.Items)
            {
                if (rItem.ItemType == ListItemType.Item || rItem.ItemType == ListItemType.AlternatingItem)
                {
                    Label PatientId = (Label)rItem.FindControl("StatusPatientId");
                    dv.RowFilter = corresondenceType + " = 1 AND " + BOL.Patient.PatientId + " = " + Int32.Parse(PatientId.Text);
                    if (dv.Count == 1)
                    {
                        HtmlTableRow listRow = (HtmlTableRow)rItem.FindControl("listRow");
                        CheckBox EmailCB = (CheckBox)rItem.FindControl("EmailCB");
                        CheckBox PrintCB = (CheckBox)rItem.FindControl("PrintCB");

                        listRow.Style["display"] = "none";
                        EmailCB.Checked = false;
                        PrintCB.Checked = false;
                    }

                }

            }

        }

        protected void CancelModalClick(object sender, EventArgs e)
        {
            Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "_cancelPage", "cancelPage(); ", true);
        }
        
        protected void CloseModalClick(object sender, EventArgs e)
        {
           Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "_reloadMainPage", "reloadMainPage(); ", true);
        }

        #endregion

        #region HELPER FUNCTIONS

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

        protected void SetPhysicianId()
        {

            if (Request.QueryString.HasKeys() && Request.QueryString.Get("treatingPhysicianId") != null)
            {
                SelectedTreatingPhysicianId = Int32.Parse(Request.QueryString.Get("treatingPhysicianId").ToString());
            }

        }

        protected void SetDisease()
        {

            if (Request.QueryString.HasKeys() && Request.QueryString.Get("treatingPatientDisease") != null )
            {
                SelectedPatientDisease = Request.QueryString.Get("treatingPatientDisease").ToString();
            }
        }

        protected void SetRecordCount()
        {

            if (Request.QueryString.HasKeys() && Request.QueryString.Get("recordCount") != null)
            {
                ResultsRecordCount = Int32.Parse(Request.QueryString.Get("recordCount").ToString());
                ResultsRecordMemo = ResultsRecordCount + " patients returned";
            }
        }

        private void SetPageView(string mode)
        {
            if (mode.ToUpper() == "SELECT")
            {
                SelectCorrespondenceDiv.Style["display"] = "";
                ProcessCorrespondenceDiv.Style["display"] = "none";

                BackBtn.Style["display"] = "none";
                NextBtn.Style["display"] = "";
                CloseBtn.Style["display"] = "";
                //ClickToCompleteBtn.Style["display"] = "none";

            }
            else if (mode.ToUpper() == "PROCESS")
            {
                SelectCorrespondenceDiv.Style["display"] = "none";
                ProcessCorrespondenceDiv.Style["display"] = "";

                BackBtn.Style["display"] = "";
                NextBtn.Style["display"] = "none";
                CloseBtn.Style["display"] = "";
                //ClickToCompleteBtn.Style["display"] = "";

            }

        }

        private void SetOptionMode(int optionNum)
        {
            switch (optionNum)
            {
                case 1: Option1ResultDiv.Style["display"] = "";
                    Option2ResultDiv.Style["display"] = "none";
                    Option2RB.Checked = false;
                    Option2Details.Text = String.Empty;
                    break;
                case 2: Option1ResultDiv.Style["display"] = "none";
                    Option2ResultDiv.Style["display"] = "";
                    Option1RB.Checked = false;
                    Option1Details.Text = String.Empty;
                    break;
                case 3: Option1ResultDiv.Style["display"] = "none";
                    Option2ResultDiv.Style["display"] = "none";
                    Option1RB.Checked = false;
                    Option2RB.Checked = false;
                    Option1Details.Text = String.Empty;
                    Option2Details.Text = String.Empty;
                    break;
                default: Option1ResultDiv.Style["display"] = "none";
                    Option2ResultDiv.Style["display"] = "none";
                    Option1RB.Checked = false;
                    Option2RB.Checked = false;
                    Option1RB.Enabled = true;
                    Option2RB.Enabled = true;
                    Option1Title.ForeColor = System.Drawing.Color.Empty;
                    Option2Title.ForeColor = System.Drawing.Color.Empty;
                    Option1Details.Text = String.Empty;
                    Option2Details.Text = String.Empty;
                    break;
            }
        }


        private DataTable GetSelectedPatients()
        {
            DataTable patientCorrespondenceDt = new DataTable();
            patientCorrespondenceDt.Columns.Add(Patient.PatientId, Type.GetType("System.Int32"));
            //patientCorrespondenceDt.Columns.Add(Patient.PtFirstName, Type.GetType("System.String"));
            //patientCorrespondenceDt.Columns.Add(Patient.PtLastName, Type.GetType("System.String"));
            //patientCorrespondenceDt.Columns.Add(Patient.PtMRN, Type.GetType("System.String"));
            patientCorrespondenceDt.Columns.Add("Email", Type.GetType("System.Byte"));
            patientCorrespondenceDt.Columns.Add("Mail", Type.GetType("System.Byte"));
            patientCorrespondenceDt.Columns.Add("SurveyFileNames", Type.GetType("System.String"));
            patientCorrespondenceDt.Columns.Add("CoverLetterFileName", Type.GetType("System.String"));

            // get patients checked
            foreach (RepeaterItem rItem in rptPatient.Items)
            {
                if (rItem.ItemType == ListItemType.Item || rItem.ItemType == ListItemType.AlternatingItem)
                {
                    Label PatientId = (Label)rItem.FindControl("StatusPatientId");
                    CheckBox EmailCB = (CheckBox)rItem.FindControl("EmailCB");
                    CheckBox PrintCB = (CheckBox)rItem.FindControl("PrintCB");
                    Label SurveysDueFileNames = (Label)rItem.FindControl("SurveysDueFileNames");

                    DataRow dr = patientCorrespondenceDt.NewRow();
                    dr[Patient.PatientId] = int.Parse(PatientId.Text);
                    dr["Email"] = EmailCB.Checked;
                    dr["Mail"] = PrintCB.Checked;
                    patientCorrespondenceDt.Rows.Add(dr);

                }

            }

            return patientCorrespondenceDt;
        }


        #endregion




 
}
}