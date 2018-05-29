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
    public partial class StatusNeedMD_ToCallPt : FollowUpBasePage
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

            if (!IsPostBack)
            {
                PopulateResults();
            }
        }

        private void PopulateResults()
        {
            if (!String.IsNullOrEmpty(FollowUpListCriteria))
            {

                PatientListController ct = new PatientListController();
                DataSet ds = null;

                // get list of patients
                string dsSQL = CacheManager.GetDatasetSQL(Session[SessionKey.DatasetId]);
                //ds = ct.GetList(dsSQL, FollowUpListType, FollowUpListCriteria, "", "", 0, numRecords, "", "");
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
                Literal ControlTitle = (Literal)e.Item.FindControl("ControlTitle");
                Literal ControlTitle2 = (Literal)e.Item.FindControl("ControlTitle2");
                HtmlTableCell DateOfBirthCellTitle = (HtmlTableCell)e.Item.FindControl("DateOfBirthCellTitle");
                HtmlTableCell MRNCellTitle = (HtmlTableCell)e.Item.FindControl("MRNCellTitle");
                HtmlTableCell HrefLinkCellTitle = (HtmlTableCell)e.Item.FindControl("HrefLinkCellTitle");
                Literal HrefLinkTitle = (Literal)e.Item.FindControl("HrefLinkTitle");

                ControlCellTitle.Style["display"] = "";
                ControlCellTitle2.Style["display"] = "";
                DateOfBirthCellTitle.Style["display"] = "";
                MRNCellTitle.Style["display"] = "";
                HrefLinkCellTitle.Style["display"] = "";

                ControlCellTitle.Style["width"] = "10%";
                ControlCellTitle2.Style["display"] = "25%";
                DateOfBirthCellTitle.Style["width"] = "20%";
                MRNCellTitle.Style["width"] = "20%";
                HrefLinkCellTitle.Style["width"] = "25%";

                //ControlTitle.Text = "Was Patient Called?";
                ControlTitle2.Text = "Patient Status";
                HrefLinkTitle.Text = "Name";


            }

            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {

                // create a reference to the current tr
                System.Web.UI.HtmlControls.HtmlContainerControl listRow;
                listRow = (System.Web.UI.HtmlControls.HtmlContainerControl)e.Item.FindControl("listRow");

                HtmlTableCell ControlCellValue = (HtmlTableCell)e.Item.FindControl("ControlCellValue");
                HtmlTableCell ControlCellValue2 = (HtmlTableCell)e.Item.FindControl("ControlCellValue2");

                ImageButton PatientCalledBtn = (ImageButton)e.Item.FindControl("PatientCalledBtn");
                ImageButton CurrentBtn = (ImageButton)e.Item.FindControl("CurrentBtn");
                ImageButton DoNotContactPerMDBtn = (ImageButton)e.Item.FindControl("DoNotContactPerMDBtn");

                HtmlTableCell DateOfBirthCellValue = (HtmlTableCell)e.Item.FindControl("DateOfBirthCellValue");
                HtmlTableCell MRNCellValue = (HtmlTableCell)e.Item.FindControl("MRNCellValue");

                HtmlTableCell HrefLinkCellValue = (HtmlTableCell)e.Item.FindControl("HrefLinkCellValue");
                Literal HrefLinkValue = (Literal)e.Item.FindControl("HrefLinkValue");


                ControlCellValue.Style["display"] = "";
                ControlCellValue2.Style["display"] = "";
                DateOfBirthCellValue.Style["display"] = "";
                MRNCellValue.Style["display"] = "";
                HrefLinkCellValue.Style["display"] = "";

                string firstName = String.Empty;
                string lastName = String.Empty;

                if (((DataRowView)e.Item.DataItem)[Patient.PtFirstName].ToString().Length > 0)
                {
                    firstName = ((DataRowView)e.Item.DataItem)[Patient.PtFirstName].ToString();
                }
                if (((DataRowView)e.Item.DataItem)[Patient.PtLastName].ToString().Length > 0)
                {
                    lastName = ((DataRowView)e.Item.DataItem)[Patient.PtLastName].ToString();
                }

                SetLinkToPagePatientData(Sender, e, HrefLinkCellValue);
                HrefLinkValue.Text = !String.IsNullOrEmpty(firstName) ? lastName + ", " + firstName : lastName;
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
                DropDownList StatusDDL = (DropDownList)e.Item.FindControl("StatusDDL");
                StatusDDL.SelectedIndexChanged += new EventHandler(StatusDDL_OnSelectedIndexChanged);

                StatusDDL.Attributes.Add("onBlur", "return checkPatientStatus(this);");
            }

        }

        protected void Repeater1_ItemCommand(object o, RepeaterCommandEventArgs e)
        {
                try
                {
                    string currentPatientId = Convert.ToString(e.CommandArgument);
                    string actionItemCommand = Convert.ToString(e.CommandName);

                    HtmlImage PatientCalledImg = (HtmlImage)e.Item.FindControl("PatientCalledImg");
                    ImageButton PatientCalledBtn = (ImageButton)e.Item.FindControl("PatientCalledBtn");
                    Label PatientCalledLBL = (Label)e.Item.FindControl("PatientCalledLBL");

                    DropDownList StatusDDL = (DropDownList)e.Item.FindControl("StatusDDL");
                    Label StatusLBL = (Label)e.Item.FindControl("StatusLBL");
                    Label StatusPatientId = (Label)e.Item.FindControl("StatusPatientId");

                    if (Convert.ToString(e.CommandName) == "PtWasCalled")
                    {

                        if (PatientCalledBtn != null)
                        {
                            PatientCalledBtn.Style["display"] = "none";
                        }
                        if (!String.IsNullOrEmpty(currentPatientId))
                        {
                            // create ActionItem = 'PtWasCalled' for patients to check
                            ActionDa actionDa = new ActionDa();
                            BOL.Action actionObj = new Caisis.BOL.Action();
                            actionObj[BOL.Action.PatientId] = int.Parse(currentPatientId);
                            actionObj[BOL.Action.ActionDateText] = DateTime.Today.ToShortDateString();
                            actionObj[BOL.Action.ActionDate] = DateTime.Today;
                            actionObj[BOL.Action.ActionItem] = actionItemCommand;

                            UserController userCt = new UserController();
                            int currentUserId = userCt.GetUserId();
                            UserDa currentUserDa = new UserDa();
                            DataSet currentUserDs = currentUserDa.GetByUserId(userCt.GetUserId());
                            actionObj[BOL.Action.EnteredBy] = (currentUserDs.Tables.Count > 0 && currentUserDs.Tables[0].Rows.Count > 0) ? currentUserDs.Tables[0].Rows[0][BOL.User.UserName].ToString() : "not specified";

                            actionObj[BOL.Action.EnteredTime] = DateTime.Today;

                            actionObj.Save();

                            if (PatientCalledImg != null & PatientCalledLBL != null)
                            {
                                PatientCalledImg.Style["display"] = "";
                                PatientCalledLBL.Text = actionItemCommand;
                            }

                            // show status options
                            if (StatusDDL != null && StatusLBL != null)
                            {
                                StatusDDL.Style["display"] = "";
                                StatusDDL.Width = Unit.Pixel(150);
                                StatusLBL.Style["display"] = "none";

                                Patient ptObj = new Patient();
                                ptObj.Get(Int32.Parse(StatusPatientId.Text));
                                if (!ptObj.IsEmpty)
                                {
                                    ListItem statusLi = new ListItem(ptObj[Patient.PtContactStatus].ToString(), ptObj[Patient.PtContactStatus].ToString());
                                    if (StatusDDL.Items.Contains(statusLi))
                                        StatusDDL.SelectedValue = statusLi.Value;
                                    else
                                        StatusDDL.SelectedValue = "Current";
                                }
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

        protected void StatusDDL_OnSelectedIndexChanged(Object sender, EventArgs e)
        {
            foreach (RepeaterItem item in rptPatient.Items)
            {
                if (item.ItemType == ListItemType.Item || item.ItemType == ListItemType.AlternatingItem)
                {
                    DropDownList StatusDDL = (DropDownList)item.FindControl("StatusDDL");
                    Label StatusLBL = (Label)item.FindControl("StatusLBL");
                    Label StatusPatientId = (Label)item.FindControl("StatusPatientId");

                    Patient ptObj = new Patient();
                    ptObj.Get(Int32.Parse(StatusPatientId.Text));
                    if (!ptObj.IsEmpty)
                    {
                        if (!String.IsNullOrEmpty(StatusDDL.SelectedValue) && ptObj[Patient.PtContactStatus].ToString() != StatusDDL.SelectedValue)
                        {
                            ptObj[Patient.PtContactStatus] = StatusDDL.SelectedValue;

                            UserController userCt = new UserController();
                            int currentUserId = userCt.GetUserId();
                            UserDa currentUserDa = new UserDa();
                            DataSet currentUserDs = currentUserDa.GetByUserId(userCt.GetUserId());
                            ptObj[Patient.UpdatedTime] = DateTime.Today;
                            ptObj[Patient.UpdatedBy] = (currentUserDs.Tables.Count > 0 && currentUserDs.Tables[0].Rows.Count > 0) ? currentUserDs.Tables[0].Rows[0][BOL.User.UserName].ToString() : "not specified";
                            
                            ptObj.Save();
                        }
                    }
                }
            }
            rptPatient.Focus();

        }

        protected void CloseModalClick(object sender, EventArgs e)
        {
           Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "_reloadMainPage", "reloadMainPage(); ", true);
        }

        protected void CancelModalClick(object sender, EventArgs e)
        {
            Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "_cancelPage", "cancelPage(); ", true);
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