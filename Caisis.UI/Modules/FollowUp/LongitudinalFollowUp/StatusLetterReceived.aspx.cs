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
using System.IO;
using System.Text;
using System.Net;

namespace Caisis.UI.Modules.FollowUp
{
    public partial class StatusLetterReceived : FollowUpBasePage
    {

        public int PatientId
        {
            get
            {
                if (ViewState["patientId"] == null)
                    ViewState["patientId"] = "0";
                return Int32.Parse(ViewState["patientId"].ToString());
            }
            set { ViewState["patientId"] = value; }
        }

        string _patientName = String.Empty;
        public string PatientName
        {
            get { return _patientName; }
            set { _patientName = value; }
        }

        //string _patientCompany = String.Empty;
        //public string PatientCompany
        //{
        //    get { return _patientCompany; }
        //    set { _patientCompany = value; }
        //}

        //string _patientBusinessCity = String.Empty;
        //public string PatientBusinessCity
        //{
        //    get { return _patientBusinessCity; }
        //    set { _patientBusinessCity = value; }
        //}

        //string _patientBusinessState = String.Empty;
        //public string PatientBusinessState
        //{
        //    get { return _patientBusinessState; }
        //    set { _patientBusinessState = value; }
        //}

        string _patientAddress1 = String.Empty;
        public string PatientAddress1
        {
            get { return _patientAddress1; }
            set { _patientAddress1 = value; }
        }

        string _patientAddress2 = String.Empty;
        public string PatientAddress2
        {
            get { return _patientAddress2; }
            set { _patientAddress2 = value; }
        }

        string _patientCity = String.Empty;
        public string PatientCity
        {
            get { return _patientCity; }
            set { _patientCity = value; }
        }

        string _patientState = String.Empty;
        public string PatientState
        {
            get { return _patientState; }
            set { _patientState = value; }
        }

        string _patientPostalCode = String.Empty;
        public string PatientPostalCode
        {
            get { return _patientPostalCode; }
            set { _patientPostalCode = value; }
        }

        string _patientCountry = String.Empty;
        public string PatientCountry
        {
            get { return _patientCountry; }
            set { _patientCountry = value; }
        }

        //string _patientEmail = String.Empty;
        //public string PatientEmail
        //{
        //    get { return _patientEmail; }
        //    set { _patientEmail = value; }
        //}

        //string _patientContactPerson = String.Empty;
        //public string PatientContactPerson
        //{
        //    get { return _patientContactPerson; }
        //    set { _patientContactPerson = value; }
        //}

        //string _patientContactAddress1 = String.Empty;
        //public string PatientContactAddress1
        //{
        //    get { return _patientContactAddress1; }
        //    set { _patientContactAddress1 = value; }
        //}

        //string _patientContactAddress2 = String.Empty;
        //public string PatientContactAddress2
        //{
        //    get { return _patientContactAddress2; }
        //    set { _patientContactAddress2 = value; }
        //}

        //string _patientContactCity = String.Empty;
        //public string PatientContactCity
        //{
        //    get { return _patientContactCity; }
        //    set { _patientContactCity = value; }
        //}

        //string _patientContactState = String.Empty;
        //public string PatientContactState
        //{
        //    get { return _patientContactState; }
        //    set { _patientContactState = value; }
        //}

        //string _patientContactPostalCode = String.Empty;
        //public string PatientContactPostalCode
        //{
        //    get { return _patientContactPostalCode; }
        //    set { _patientContactPostalCode = value; }
        //}

        //string _patientContactPhone = String.Empty;
        //public string PatientContactPhone
        //{
        //    get { return _patientContactPhone; }
        //    set { _patientContactPhone = value; }
        //}


        protected void Page_Init(object sender, EventArgs e)
        {
            this.EnableViewState = true;

            this.SetPatientInfo();
          
            if (!IsPostBack)
            {
            }

            // initialize patient address info
            PatientAddress1TB.Text = String.IsNullOrEmpty(PatientAddress1TB.Text) ? PatientAddress1 : PatientAddress1TB.Text;
            PatientAddress2TB.Text = String.IsNullOrEmpty(PatientAddress2TB.Text) ? PatientAddress2 : PatientAddress2TB.Text;
            PatientCityTB.Text = String.IsNullOrEmpty(PatientCityTB.Text) ? PatientCity : PatientCityTB.Text;
            PatientStateSelect.SelectedValue = String.IsNullOrEmpty(PatientStateSelect.SelectedValue) ? PatientState : PatientStateSelect.SelectedValue;
            PatientPostalCodeTB.Text = String.IsNullOrEmpty(PatientPostalCodeTB.Text) ? PatientPostalCode : PatientPostalCodeTB.Text;
            PatientCountryCB.Text = String.IsNullOrEmpty(PatientCountryCB.Text) ? PatientCountry : PatientCountryCB.Text;

        }
        protected override void Page_Load(object sender, EventArgs e)
        {
            //base.Page_Load(sender, e);

        }


        #region CLICK EVENTS

        protected void Option1RB_CheckedChanged(object sender, EventArgs e)
        {
            SetOptionMode(1);
        }
        protected void Option2RB_CheckedChanged(object sender, EventArgs e)
        {
            SetOptionMode(2);

            PatientAddress1TB.Text = String.IsNullOrEmpty(PatientAddress1TB.Text) ? PatientAddress1 : PatientAddress1TB.Text;
            PatientAddress2TB.Text = String.IsNullOrEmpty(PatientAddress2TB.Text) ? PatientAddress2 : PatientAddress2TB.Text;
            PatientCityTB.Text = String.IsNullOrEmpty(PatientCityTB.Text) ? PatientCity : PatientCityTB.Text;
            PatientStateSelect.SelectedValue = String.IsNullOrEmpty(PatientStateSelect.SelectedValue) ? PatientState : PatientStateSelect.SelectedValue;
            PatientPostalCodeTB.Text = String.IsNullOrEmpty(PatientPostalCodeTB.Text) ? PatientPostalCode : PatientPostalCodeTB.Text;
            PatientCountryCB.Text = String.IsNullOrEmpty(PatientCountryCB.Text) ? PatientCountry : PatientCountryCB.Text;
        }
        protected void Option3RB_CheckedChanged(object sender, EventArgs e)
        {
            SetOptionMode(3);

        }


        protected void LetterReceivedClick(object sender, EventArgs e)
        {
            if (PatientId != 0)
            {
                // create ActionItem = 'DataReceived' 
                UserController userCt = new UserController();
                int currentUserId = userCt.GetUserId();
                UserDa currentUserDa = new UserDa();
                DataSet currentUserDs = currentUserDa.GetByUserId(userCt.GetUserId());

                bool actionAlreadyExists = false;

                ActionDa actionDa = new ActionDa();
                DataSet actionDs = actionDa.ValidateActionItem(PatientId, "DataReceived");
                if (actionDs.Tables.Count > 0)
                {
                    DataView actionDv = new DataView(actionDs.Tables[0]);
                    actionDv.RowFilter = BOL.Action.ActionDateText + " = '" + DateTime.Today.ToShortDateString() + "' AND " + BOL.Action.ActionItem + " = 'DataReceived' ";
                    if (actionDv.Count > 0)
                        actionAlreadyExists = true;
                }

                // if action item does not already exist for today
                if (!actionAlreadyExists)
                {
                    BOL.Action actionObj = new Caisis.BOL.Action();
                    actionObj[BOL.Action.PatientId] = PatientId;
                    actionObj[BOL.Action.ActionDateText] = LetterReceivedDateText.Text;
                    actionObj[BOL.Action.ActionDate] = DateTime.Parse(LetterReceivedDate.Value).ToString();
                    actionObj[BOL.Action.ActionItem] = "DataReceived";
                    actionObj[BOL.Action.ActionNotes] = "Letter received";
                    actionObj[BOL.Action.EnteredBy] = (currentUserDs.Tables.Count > 0 && currentUserDs.Tables[0].Rows.Count > 0) ? currentUserDs.Tables[0].Rows[0][BOL.User.UserName].ToString() : "not specified";
                    actionObj[BOL.Action.EnteredTime] = DateTime.Today;

                    actionObj.Save();
                }

                // set patient status to 'NeedDataEntry'
                Patient ptObj = new Patient();
                ptObj.Get(PatientId);
                if (!ptObj.IsEmpty)
                {
                    ptObj[Patient.PtContactStatus] = "NeedDataEntry";
                    ptObj[Patient.UpdatedBy] = (currentUserDs.Tables.Count > 0 && currentUserDs.Tables[0].Rows.Count > 0) ? currentUserDs.Tables[0].Rows[0][BOL.User.UserName].ToString() : "not specified";
                    ptObj[Patient.UpdatedTime] = DateTime.Today;

                    ptObj.Save();
                }            
            }
            
            Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "_reloadMainPage", "reloadMainPage(); ", true);
        }

        protected void UpdatePatientAddressClick(object sender, EventArgs e)
        {
            if (PatientId != 0)
            {
                // create ActionItem = 'DataReceived' 
                UserController userCt = new UserController();
                int currentUserId = userCt.GetUserId();
                UserDa currentUserDa = new UserDa();
                DataSet currentUserDs = currentUserDa.GetByUserId(userCt.GetUserId());

                bool actionAlreadyExists = false;

                ActionDa actionDa = new ActionDa();
                DataSet actionDs = actionDa.ValidateActionItem(PatientId, "DataReceived");
                if (actionDs.Tables.Count > 0)
                {
                    DataView actionDv = new DataView(actionDs.Tables[0]);
                    actionDv.RowFilter = BOL.Action.ActionDateText + " = '" + DateTime.Today.ToShortDateString() + "' AND " + BOL.Action.ActionItem + " = 'DataReceived' ";
                    if (actionDv.Count > 0)
                        actionAlreadyExists = true;
                }

                // if action item does not already exist for today
                if (!actionAlreadyExists)
                {
                    BOL.Action actionObj = new Caisis.BOL.Action();
                    actionObj[BOL.Action.PatientId] = PatientId;
                    actionObj[BOL.Action.ActionDateText] = DateTime.Today.ToShortDateString();
                    actionObj[BOL.Action.ActionDate] = DateTime.Today;
                    actionObj[BOL.Action.ActionItem] = "DataReceived";
                    actionObj[BOL.Action.ActionNotes] = "Patient contact information updated";
                    actionObj[BOL.Action.EnteredBy] = (currentUserDs.Tables.Count > 0 && currentUserDs.Tables[0].Rows.Count > 0) ? currentUserDs.Tables[0].Rows[0][BOL.User.UserName].ToString() : "not specified";
                    actionObj[BOL.Action.EnteredTime] = DateTime.Today;

                    actionObj.Save();

                }

                Patient ptObj = new Patient();
                ptObj.Get(PatientId);
                if (!ptObj.IsEmpty)
                {
                    ptObj[Patient.PtContactStatus] = "Current";

                    ptObj[Patient.PtAddress1] = PatientAddress1TB.Text;
                    ptObj[Patient.PtAddress2] = PatientAddress2TB.Text;
                    ptObj[Patient.PtCity] = PatientCityTB.Text;
                    ptObj[Patient.PtState] = PatientStateSelect.SelectedValue;
                    ptObj[Patient.PtPostalCode] = PatientPostalCodeTB.Text;
                    ptObj[Patient.PtCountry] = PatientCountryCB.Text;
                    ptObj[Patient.UpdatedBy] = (currentUserDs.Tables.Count > 0 && currentUserDs.Tables[0].Rows.Count > 0) ? currentUserDs.Tables[0].Rows[0][BOL.User.UserName].ToString() : "not specified";
                    ptObj[Patient.UpdatedTime] = DateTime.Now;

                    ptObj.Save();

                    if (AddressUpdatedLBL != null && AddressUpdatedImg != null)
                    {
                        AddressUpdatedImg.Style["display"] = "";
                        AddressUpdatedLBL.Text = "Address updated " + DateTime.Parse(ptObj[Patient.UpdatedTime].ToString()).ToShortDateString() + " at " + DateTime.Parse(ptObj[Patient.UpdatedTime].ToString()).ToShortTimeString() + ", Pt Status: " + ptObj[Patient.PtContactStatus].ToString();
                    }
                    if (NeedMDContactLBL != null && NeedMDContactImg != null)
                    {
                        NeedMDContactImg.Style["display"] = "none";
                        NeedMDContactLBL.Text = String.Empty;
                    }

                }
            }

            //Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "_reloadMainPage", "reloadMainPage(); ", true);
        }

        protected void NeedMDContactClick(object sender, EventArgs e)
        {
            if (PatientId != 0)
            {
                // create ActionItem = 'DataReceived' 
                UserController userCt = new UserController();
                int currentUserId = userCt.GetUserId();
                UserDa currentUserDa = new UserDa();
                DataSet currentUserDs = currentUserDa.GetByUserId(userCt.GetUserId());

                bool actionAlreadyExists = false;

                ActionDa actionDa = new ActionDa();
                DataSet actionDs = actionDa.ValidateActionItem(PatientId, "DataReceived");
                if (actionDs.Tables.Count > 0)
                {
                    DataView actionDv = new DataView(actionDs.Tables[0]);
                    actionDv.RowFilter = BOL.Action.ActionDateText + " = '" + DateTime.Today.ToShortDateString() + "' AND " + BOL.Action.ActionItem + " = 'DataReceived' ";
                    if (actionDv.Count > 0)
                        actionAlreadyExists = true;
                }

                // if action item does not already exist for today
                if (!actionAlreadyExists)
                {
                    BOL.Action actionObj = new Caisis.BOL.Action();
                    actionObj[BOL.Action.PatientId] = PatientId;
                    actionObj[BOL.Action.ActionDateText] = DateTime.Today.ToShortDateString();
                    actionObj[BOL.Action.ActionDate] = DateTime.Today;
                    actionObj[BOL.Action.ActionItem] = "DataReceived";
                    actionObj[BOL.Action.EnteredBy] = (currentUserDs.Tables.Count > 0 && currentUserDs.Tables[0].Rows.Count > 0) ? currentUserDs.Tables[0].Rows[0][BOL.User.UserName].ToString() : "not specified";
                    actionObj[BOL.Action.EnteredTime] = DateTime.Today;

                    actionObj.Save();
                }

                // set patient status to 'NeedMD_ToCallPt'
                Patient ptObj = new Patient();
                ptObj.Get(PatientId);
                if (!ptObj.IsEmpty)
                {
                    ptObj[Patient.PtContactStatus] = "NeedMD_ToCallPt";
                    ptObj[Patient.UpdatedBy] = (currentUserDs.Tables.Count > 0 && currentUserDs.Tables[0].Rows.Count > 0) ? currentUserDs.Tables[0].Rows[0][BOL.User.UserName].ToString() : "not specified";
                    ptObj[Patient.UpdatedTime] = DateTime.Now;

                    ptObj.Save();

                    if (AddressUpdatedLBL != null && AddressUpdatedImg != null)
                    {
                        AddressUpdatedImg.Style["display"] = "none";
                        AddressUpdatedLBL.Text = String.Empty;
                    }
                    if (NeedMDContactLBL != null && NeedMDContactImg != null)
                    {
                        NeedMDContactImg.Style["display"] = "";
                        NeedMDContactLBL.Text = "Pt Status: " + ptObj[Patient.PtContactStatus].ToString();
                    }
                }
            }

            //Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "_reloadMainPage", "reloadMainPage(); ", true);
        }

        protected void DoNotContactClick(object sender, EventArgs e)
        {
            if (PatientId != 0)
            {
                // create ActionItem = 'DataReceived' 
                UserController userCt = new UserController();
                int currentUserId = userCt.GetUserId();
                UserDa currentUserDa = new UserDa();
                DataSet currentUserDs = currentUserDa.GetByUserId(userCt.GetUserId());

                bool actionAlreadyExists = false;

                ActionDa actionDa = new ActionDa();
                DataSet actionDs = actionDa.ValidateActionItem(PatientId, "DataReceived");
                if (actionDs.Tables.Count > 0)
                {
                    DataView actionDv = new DataView(actionDs.Tables[0]);
                    actionDv.RowFilter = BOL.Action.ActionDateText + " = '" + DateTime.Today.ToShortDateString() + "' AND " + BOL.Action.ActionItem + " = 'DataReceived' ";
                    if (actionDv.Count > 0)
                        actionAlreadyExists = true;
                }

                // if action item does not already exist for today
                if (!actionAlreadyExists)
                {
                    BOL.Action actionObj = new Caisis.BOL.Action();
                    actionObj[BOL.Action.PatientId] = PatientId;
                    actionObj[BOL.Action.ActionDateText] = DateTime.Today.ToShortDateString();
                    actionObj[BOL.Action.ActionDate] = DateTime.Now;
                    actionObj[BOL.Action.ActionItem] = "DataReceived";
                    actionObj[BOL.Action.EnteredBy] = (currentUserDs.Tables.Count > 0 && currentUserDs.Tables[0].Rows.Count > 0) ? currentUserDs.Tables[0].Rows[0][BOL.User.UserName].ToString() : "not specified";
                    actionObj[BOL.Action.EnteredTime] = DateTime.Today;

                    actionObj.Save();
                }

                // set patient status to 'DoNotContactPerPT'
                Patient ptObj = new Patient();
                ptObj.Get(PatientId);
                if (!ptObj.IsEmpty)
                {
                    ptObj[Patient.PtContactStatus] = "DoNotContactPerPt";
                    ptObj[Patient.UpdatedBy] = (currentUserDs.Tables.Count > 0 && currentUserDs.Tables[0].Rows.Count > 0) ? currentUserDs.Tables[0].Rows[0][BOL.User.UserName].ToString() : "not specified";
                    ptObj[Patient.UpdatedTime] = DateTime.Today;

                    ptObj.Save();
                }
            }

            Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "_reloadMainPage", "reloadMainPage(); ", true);
        }


        protected void SaveActionClick(object sender, EventArgs e)
        {
            Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "_reloadMainPage", "reloadMainPage(); ", true);
        }

        protected void CancelModalClick(object sender, EventArgs e)
        {
            Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "_cancelPage", "cancelPage(); ", true);
        }

        protected void CloseModalClick(object sender, EventArgs e)
        {
            Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "_closePage", "closePage(); ", true);
        }

        #endregion

        #region HELPER FUNCTIONS


        protected void SetPatientInfo()
        {

            if (Request.QueryString.HasKeys() && Request.QueryString.Get("patientId") != null)
            {
                PatientId = Int32.Parse(Request.QueryString.Get("patientId").ToString());

                if (PatientId != 0)
                {
                    // set patient name and info
                    Patient ptObj = new Patient();
                    ptObj.Get(PatientId);
                    if (!String.IsNullOrEmpty(ptObj[BOL.Patient.PtLastName].ToString())) PatientName = String.Concat(PatientName, ptObj[BOL.Patient.PtLastName].ToString());
                    if (!String.IsNullOrEmpty(ptObj[BOL.Patient.PtMiddleName].ToString())) PatientName = String.Concat(PatientName, " ", ptObj[BOL.Patient.PtMiddleName].ToString());
                    if (!String.IsNullOrEmpty(ptObj[BOL.Patient.PtFirstName].ToString())) PatientName = String.Concat(PatientName, ", ", ptObj[BOL.Patient.PtFirstName].ToString());

                    PatientAddress1 = ptObj[BOL.Patient.PtAddress1].ToString();
                    PatientAddress2 = ptObj[BOL.Patient.PtAddress2].ToString();
                    PatientCity = ptObj[BOL.Patient.PtCity].ToString();
                    PatientState = ptObj[BOL.Patient.PtState].ToString();
                    PatientPostalCode = ptObj[BOL.Patient.PtPostalCode].ToString();
                    PatientCountry = ptObj[BOL.Patient.PtCountry].ToString();

                    CancelBtn.Style["display"] = "";
                }
            }
        }

        private void SetOptionMode(int optionNum)
        {
            switch (optionNum)
            {
                case 1:  Option1ResultDiv.Style["display"] = "";
                         Option2ResultDiv.Style["display"] = "none";
                         Option3ResultDiv.Style["display"] = "none";
                         Option2RB.Checked = false;
                         Option3RB.Checked = false;
                         OptionResultTitle.Text = Option1Title.Text;
                         break;
                case 2:  Option1ResultDiv.Style["display"] = "none";
                         Option2ResultDiv.Style["display"] = "";
                         Option3ResultDiv.Style["display"] = "none";
                         Option1RB.Checked = false;
                         Option3RB.Checked = false;
                         OptionResultTitle.Text = Option2Title.Text;
                         break;
                case 3:  Option1ResultDiv.Style["display"] = "none";
                         Option2ResultDiv.Style["display"] = "none";
                         Option3ResultDiv.Style["display"] = "";
                         Option1RB.Checked = false;
                         Option2RB.Checked = false;
                         OptionResultTitle.Text = Option3Title.Text;
                         break;
                default: Option1ResultDiv.Style["display"] = "none";
                         Option2ResultDiv.Style["display"] = "none";
                         Option3ResultDiv.Style["display"] = "none";
                         Option1RB.Checked = false;
                         Option2RB.Checked = false;
                         Option3RB.Checked = false;
                         OptionResultTitle.Text = String.Empty;
                         break;
            }
        }

        #endregion





}
}