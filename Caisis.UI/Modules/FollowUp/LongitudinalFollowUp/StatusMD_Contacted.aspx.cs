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

namespace Caisis.UI.Modules.FollowUp
{
    public partial class StatusMD_Contacted : FollowUpBasePage
    {

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

        protected void Page_Init(object sender, EventArgs e)
        {
            this.EnableViewState = true;

            // Set list criteria variable
            this.SetListCriteriaValue();
            this.SetPhysicianId();
            this.SetDisease();

            if (!IsPostBack)
            {
                PopulateResults();
            }
            else
            {
                this.SetRecordCount();
            }
         
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
                ds = ptDa.ListPatientsByContactStatusPhysicianAndDisease(dsSQL, new string[]{FollowUpListCriteria}, SelectedTreatingPhysicianId,
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
                HtmlTableCell DateOfBirthCellTitle = (HtmlTableCell)e.Item.FindControl("DateOfBirthCellTitle");
                HtmlTableCell MRNCellTitle = (HtmlTableCell)e.Item.FindControl("MRNCellTitle");
                HtmlTableCell CommentsCellTitle = (HtmlTableCell)e.Item.FindControl("CommentsCellTitle");


                ControlCellTitle.Style["display"] = "";
                ControlCellTitle2.Style["display"] = "";
                NameCellTitle.Style["display"] = "";
                DateOfBirthCellTitle.Style["display"] = "";
                MRNCellTitle.Style["display"] = "";
                CommentsCellTitle.Style["display"] = "none";

                ControlCellTitle.Style["width"] = "10%";
                ControlCellTitle2.Style["width"] = "10%";
                NameCellTitle.Style["width"] = "20%";
                DateOfBirthCellTitle.Style["width"] = "20%";
                MRNCellTitle.Style["width"] = "20%";
                CommentsCellTitle.Style["width"] = "0%";



            }

            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {

                // create a reference to the current tr
                System.Web.UI.HtmlControls.HtmlContainerControl listRow;
                listRow = (System.Web.UI.HtmlControls.HtmlContainerControl)e.Item.FindControl("listRow");

                HtmlTableCell ControlCellValue = (HtmlTableCell)e.Item.FindControl("ControlCellValue");
                HtmlTableCell ControlCellValue2 = (HtmlTableCell)e.Item.FindControl("ControlCellValue2");

                HtmlTableCell NameCellValue = (HtmlTableCell)e.Item.FindControl("NameCellValue");
                HtmlTableCell DateOfBirthCellValue = (HtmlTableCell)e.Item.FindControl("DateOfBirthCellValue");
                HtmlTableCell MRNCellValue = (HtmlTableCell)e.Item.FindControl("MRNCellValue");
                HtmlTableCell CommentsCellValue = (HtmlTableCell)e.Item.FindControl("CommentsCellValue");


                ControlCellValue.Style["display"] = "";
                ControlCellValue2.Style["display"] = "";
                NameCellValue.Style["display"] = "";
                DateOfBirthCellValue.Style["display"] = "";
                MRNCellValue.Style["display"] = "";
                CommentsCellValue.Style["display"] = "none";


                SetLinkToPagePatientData(Sender, e, NameCellValue);
                NameCellValue.Style["text-decoration"] = "underline";

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
            }

        }

        protected void Repeater1_ItemCommand(object o, RepeaterCommandEventArgs e)
        {
            try
            {
                string currentPatientId = Convert.ToString(e.CommandArgument);
                string actionItemCommand = Convert.ToString(e.CommandName);

                HtmlImage DataReceivedImg = (HtmlImage)e.Item.FindControl("DataReceivedImg");
                ImageButton DataReceivedBtn = (ImageButton)e.Item.FindControl("DataReceivedBtn");
                Label DataReceivedLBL = (Label)e.Item.FindControl("DataReceivedLBL");

                HtmlImage NeedMD_ContactImg = (HtmlImage)e.Item.FindControl("NeedMD_ContactImg");
                ImageButton NeedMD_ContactBtn = (ImageButton)e.Item.FindControl("NeedMD_ContactBtn");
                Label NeedMD_ContactLBL = (Label)e.Item.FindControl("NeedMD_ContactLBL");

                UserController userCt = new UserController();
                int currentUserId = userCt.GetUserId();
                UserDa currentUserDa = new UserDa();
                DataSet currentUserDs = currentUserDa.GetByUserId(userCt.GetUserId());

                if (actionItemCommand == "DataReceived")
                {
                    if (DataReceivedBtn != null && DataReceivedImg != null)
                    {
                        DataReceivedBtn.Style["display"] = "none";
                    }

                    if (!String.IsNullOrEmpty(currentPatientId))
                    {
                        bool actionAlreadyExists = false;

                        ActionDa actionDa = new ActionDa();
                        DataSet actionDs = actionDa.ValidateActionItem(Int32.Parse(currentPatientId), actionItemCommand);
                        if (actionDs.Tables.Count > 0)
                        {
                            DataView actionDv = new DataView(actionDs.Tables[0]);
                            actionDv.RowFilter = BOL.Action.ActionDateText + " = '" + DateTime.Today.ToShortDateString() + "' AND " + BOL.Action.ActionItem + " = '" + actionItemCommand + "' ";
                            if (actionDv.Count > 0)
                                actionAlreadyExists = true;
                        }

                        // if action item does not already exist for today
                        if (!actionAlreadyExists)
                        {

                            // create ActionItem = 'DataReceived' for patients to check
                            BOL.Action actionObj = new Caisis.BOL.Action();
                            actionObj[BOL.Action.PatientId] = int.Parse(currentPatientId);
                            actionObj[BOL.Action.ActionDateText] = DateTime.Today.ToShortDateString();
                            actionObj[BOL.Action.ActionDate] = DateTime.Today;
                            actionObj[BOL.Action.ActionItem] = actionItemCommand;

                            actionObj[BOL.Action.EnteredBy] = (currentUserDs.Tables.Count > 0 && currentUserDs.Tables[0].Rows.Count > 0) ? currentUserDs.Tables[0].Rows[0][BOL.User.UserName].ToString() : "not specified";
                            actionObj[BOL.Action.EnteredTime] = DateTime.Today;

                            actionObj.Save();
                        }

                        // set patient status to 'NeedDataEntry'
                        Patient ptObj = new Patient();
                        ptObj.Get(Int32.Parse(currentPatientId));
                        if (!ptObj.IsEmpty)
                        {
                            ptObj[Patient.PtContactStatus] = "NeedDataEntry";
                            ptObj[Patient.UpdatedTime] = DateTime.Today;
                            ptObj[Patient.UpdatedBy] = (currentUserDs.Tables.Count > 0 && currentUserDs.Tables[0].Rows.Count > 0) ? currentUserDs.Tables[0].Rows[0][BOL.User.UserName].ToString() : "not specified";
                            ptObj.Save();
                        }

                        if (DataReceivedLBL != null && DataReceivedImg != null)
                        {
                            DataReceivedImg.Style["display"] = "";
                            DataReceivedLBL.Text = actionItemCommand;
                        }

                        // show "NeedMD_Contact" btn
                        if (NeedMD_ContactBtn != null)
                        {
                            NeedMD_ContactBtn.Style["display"] = "";
                        }

                        if (NeedMD_ContactLBL != null && NeedMD_ContactImg != null)
                        {
                            NeedMD_ContactImg.Style["display"] = "none";
                            NeedMD_ContactLBL.Text = String.Empty;
                        }
                    }
                }
                else if (actionItemCommand == "NeedMD_Contact")
                {
                    if (NeedMD_ContactBtn != null && NeedMD_ContactImg != null)
                    {
                        NeedMD_ContactBtn.Style["display"] = "none";
                    }

                    if (!String.IsNullOrEmpty(currentPatientId))
                    {
                        // if any action item was created for "DataReceived", delete

                        ActionDa actionDa = new ActionDa();
                        DataSet actionDs = actionDa.ValidateActionItem(Int32.Parse(currentPatientId), "DataReceived");
                        if (actionDs.Tables.Count > 0)
                        {
                            DataView actionDv = new DataView(actionDs.Tables[0]);
                            actionDv.RowFilter = BOL.Action.ActionDateText + " = '" + DateTime.Today.ToShortDateString() + "' AND " + BOL.Action.ActionItem + " = 'DataReceived' ";
                            if (actionDv.Count > 0)
                            {
                                BOL.Action actionObj = new Caisis.BOL.Action();
                                actionObj.Get(Int32.Parse(actionDv[0][BOL.Action.ActionId].ToString()));
                                actionObj.Delete();
                            }
                        }


                        // set patient status to 'NeedMD_Contact'
                        Patient ptObj = new Patient();
                        ptObj.Get(Int32.Parse(currentPatientId));
                        if (!ptObj.IsEmpty)
                        {
                            ptObj[Patient.PtContactStatus] = "NeedMD_Contact";
                            ptObj[Patient.UpdatedTime] = DateTime.Today;
                            ptObj[Patient.UpdatedBy] = (currentUserDs.Tables.Count > 0 && currentUserDs.Tables[0].Rows.Count > 0) ? currentUserDs.Tables[0].Rows[0][BOL.User.UserName].ToString() : "not specified";
                            ptObj.Save();
                        }

                        if (NeedMD_ContactLBL != null && NeedMD_ContactImg != null)
                        {
                            NeedMD_ContactImg.Style["display"] = "";
                            NeedMD_ContactLBL.Text = actionItemCommand;
                        }

                        // show "Data Received" btn
                        if (DataReceivedBtn != null)
                        {
                            DataReceivedBtn.Style["display"] = "";
                        }

                        if (DataReceivedLBL != null && DataReceivedImg != null)
                        {
                            DataReceivedImg.Style["display"] = "none";
                            DataReceivedLBL.Text = String.Empty;
                        }
                    }
                }

            }
            catch (Exception ex)
            {
                // publish raw error
                ExceptionHandler.Publish(ex);
            }
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


        #endregion




 
}
}