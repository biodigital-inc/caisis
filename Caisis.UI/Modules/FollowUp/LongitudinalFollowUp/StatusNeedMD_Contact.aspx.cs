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
    public partial class StatusNeedMD_Contact : FollowUpBasePage
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

        string _physicianName = String.Empty;
        public string PatientFollowingPhysicianName
        {
            get { return _physicianName; }
            set { _physicianName = value; }
        }

        string _physicianTitle = String.Empty;
        public string PatientFollowingPhysicianTitle
        {
            get { return _physicianTitle; }
            set { _physicianTitle = value; }
        }

        string _physicianFirstName = String.Empty;
        public string PatientFollowingPhysicianFirstName
        {
            get { return _physicianFirstName; }
            set { _physicianFirstName = value; }
        }

        string _physicianLastName = String.Empty;
        public string PatientFollowingPhysicianLastName
        {
            get { return _physicianLastName; }
            set { _physicianLastName = value; }
        }

        string _physicianWorkPhone = String.Empty;
        public string PatientFollowingPhysicianWorkPhone
        {
            get { return _physicianWorkPhone; }
            set { _physicianWorkPhone = value; }
        }

        string _physicianFax = String.Empty;
        public string PatientFollowingPhysicianFax
        {
            get { return _physicianFax; }
            set { _physicianFax = value; }
        }

        string _physicianAddress = String.Empty;
        public string PatientFollowingPhysicianAddress
        {
            get { return _physicianAddress; }
            set { _physicianAddress = value; }
        }

        string _physicianAddress1 = String.Empty;
        public string PatientFollowingPhysicianAddressLine1
        {
            get { return _physicianAddress1; }
            set { _physicianAddress1 = value; }
        }

        string _physicianAddress2 = String.Empty;
        public string PatientFollowingPhysicianAddressLine2
        {
            get { return _physicianAddress2; }
            set { _physicianAddress2 = value; }
        }

        string _physicianAddressCity = String.Empty;
        public string PatientFollowingPhysicianAddressCity
        {
            get { return _physicianAddressCity; }
            set { _physicianAddressCity = value; }
        }

        string _physicianAddressState = String.Empty;
        public string PatientFollowingPhysicianAddressState
        {
            get { return _physicianAddressState; }
            set { _physicianAddressState = value; }
        }

        string _physicianAddressPostalCode = String.Empty;
        public string PatientFollowingPhysicianAddressPostalCode
        {
            get { return _physicianAddressPostalCode; }
            set { _physicianAddressPostalCode = value; }
        }

        protected void Page_Init(object sender, EventArgs e)
        {
            this.EnableViewState = true;

            this.SetPatientInfo();
          
            if (!IsPostBack)
            {
            }

            // initialize coversheet data
            CoverSheetDate.Text = String.IsNullOrEmpty(CoverSheetDate.Text) ? DateTime.Today.ToShortDateString() : CoverSheetDate.Text;
            CoverSheetFaxRE.Text = String.IsNullOrEmpty(CoverSheetFaxRE.Text) ? PatientName : CoverSheetFaxRE.Text;
            CoverSheetFaxMemo.Text = String.IsNullOrEmpty(CoverSheetFaxMemo.Text) ? "" : CoverSheetFaxMemo.Text;
            CoverSheetToFax.Text = String.IsNullOrEmpty(CoverSheetToFax.Text) ? PatientFollowingPhysicianFax : CoverSheetToFax.Text;
            CoverSheetTo.Text = String.IsNullOrEmpty(CoverSheetTo.Text) ? PatientFollowingPhysicianName : CoverSheetTo.Text;

            // initialize coverletter data
            CoverLetterDate.Text = String.IsNullOrEmpty(CoverLetterDate.Text) ? DateTime.Today.ToShortDateString() : CoverLetterDate.Text;
            CoverLetterTo.Text = String.IsNullOrEmpty(CoverLetterTo.Text) ? PatientFollowingPhysicianName : CoverLetterTo.Text;
            
            CoverLetterToAddress1.Text = String.IsNullOrEmpty(CoverLetterToAddress1.Text) ? PatientFollowingPhysicianAddressLine1 : CoverLetterToAddress1.Text;
            CoverLetterToAddress2.Text = String.IsNullOrEmpty(CoverLetterToAddress2.Text) ? PatientFollowingPhysicianAddressLine2 : CoverLetterToAddress2.Text;
            CoverLetterToCity.Text = String.IsNullOrEmpty(CoverLetterToCity.Text) ? PatientFollowingPhysicianAddressCity : CoverLetterToCity.Text;
            CoverLetterToState.Text = String.IsNullOrEmpty(CoverLetterToState.Text) ? PatientFollowingPhysicianAddressState : CoverLetterToState.Text;
            CoverLetterToPostalCode.Text = String.IsNullOrEmpty(CoverLetterToPostalCode.Text) ? PatientFollowingPhysicianAddressPostalCode: CoverLetterToPostalCode.Text;
            
            CoverLetterSalutation.Text = String.IsNullOrEmpty(CoverLetterSalutation.Text) ? "Dear " + PatientFollowingPhysicianTitle + " " + PatientFollowingPhysicianLastName : CoverLetterSalutation.Text;
            CoverLetterClosure1.Text = String.IsNullOrEmpty(CoverLetterClosure1.Text) ? "Sincerely," : CoverLetterClosure1.Text;
        }
        protected override void Page_Load(object sender, EventArgs e)
        {
            //base.Page_Load(sender, e);

        }




        #region CLICK EVENTS

        protected void SaveActionClick(object sender, EventArgs e)
        {
            if (PatientId != 0)
            {
                // create ActionItem = 'MD_Contacted' for patients to check
                ActionDa actionDa = new ActionDa();
                BOL.Action actionObj = new Caisis.BOL.Action();
                actionObj[BOL.Action.PatientId] = PatientId;
                actionObj[BOL.Action.ActionDateText] = DateTime.Today.ToShortDateString();
                actionObj[BOL.Action.ActionDate] = DateTime.Today;
                actionObj[BOL.Action.ActionItem] = "MD_Contacted";
                actionObj[BOL.Action.ActionNotes] = !String.IsNullOrEmpty(PersonSpokeTo.Text) ? "Spoke to " + PersonSpokeTo.Text : String.Empty;

                UserController userCt = new UserController();
                int currentUserId = userCt.GetUserId();
                UserDa currentUserDa = new UserDa();
                DataSet currentUserDs = currentUserDa.GetByUserId(userCt.GetUserId());
                actionObj[BOL.Action.EnteredBy] = (currentUserDs.Tables.Count > 0 && currentUserDs.Tables[0].Rows.Count > 0) ? currentUserDs.Tables[0].Rows[0][BOL.User.UserName].ToString() : "not specified";

                actionObj[BOL.Action.EnteredTime] = DateTime.Now;

                actionObj.Save();

                // set patient status to 'MD_Contacted'
                Patient ptObj = new Patient();
                ptObj.Get(PatientId);
                if (!ptObj.IsEmpty)
                {
                    ptObj[Patient.PtContactStatus] = "MD_Contacted";
                    ptObj[Patient.UpdatedTime] = DateTime.Now;
                    ptObj[Patient.UpdatedBy] = (currentUserDs.Tables.Count > 0 && currentUserDs.Tables[0].Rows.Count > 0) ? currentUserDs.Tables[0].Rows[0][BOL.User.UserName].ToString() : "not specified";
                    
                    ptObj.Save();
                }

            
            }
            
            Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "_reloadMainPage", "reloadMainPage(); ", true);
        }


        protected void PrintFaxCoversheetClick(object sender, EventArgs e)
        {
            BaseLongitudinalControl lControl = null;

            PatientResultsDiv.Style["display"] = "none";
            ButtonsDiv.Style["display"] = "none";

            // get ascx control (conference patient data)
            lControl = (BaseLongitudinalControl)this.LoadControl("CoversheetFaxNeedMD_Contact.ascx");

            lControl.PatientId = PatientId;
            DateTime date;
            if (DateTime.TryParse(CoverSheetDate.Text, out date))
                lControl.CoversheetDate = date;
            else
                lControl.CoversheetDate = DateTime.Today;

            lControl.CoversheetTo = CoverSheetTo.Text;
            lControl.CoversheetToFax = CoverSheetToFax.Text;
            lControl.CoversheetFrom = CoverSheetFrom.Text;
            lControl.CoversheetFromPhone = CoverSheetFromPhone.Text;
            lControl.CoversheetFromFax = CoverSheetFromFax.Text;
            lControl.CoversheetFaxPages = CoverSheetFaxPages.Text;
            lControl.CoversheetFaxRE = CoverSheetFaxRE.Text;
            lControl.CoversheetFaxMemo = CoverSheetFaxMemo.Text;

            // load .ascx control onto page
            formHolder.Controls.Add(lControl);

            ReturnToStatusPageBtn.Attributes.Add("onClick", "return returnToStatusPage('Need MD Contact','" + PatientId + "');");
            PrintDiv.Style["display"] = "";
            PrintButtonsDiv.Style["display"] = ""; 

        }


        protected void PrintCoverLetterClick(object sender, EventArgs e)
        {
            BaseLongitudinalControl lControl = null;

            PatientResultsDiv.Style["display"] = "none";
            ButtonsDiv.Style["display"] = "none";

            // get ascx control (conference patient data)
            lControl = (BaseLongitudinalControl)this.LoadControl("CoversheetLetterNeedMD_Contact.ascx");

            lControl.PatientId = PatientId;
            DateTime date;
            if (DateTime.TryParse(CoverLetterDate.Text, out date))
                lControl.CoversheetDate = date;
            else
                lControl.CoversheetDate = DateTime.Today;

            lControl.CoversheetTo = CoverLetterTo.Text;
            lControl.CoversheetToAddress1 = CoverLetterToAddress1.Text;
            lControl.CoversheetToAddress2 = CoverLetterToAddress2.Text;
            lControl.CoversheetToCity = CoverLetterToCity.Text;
            lControl.CoversheetToState = CoverLetterToState.Text;
            lControl.CoversheetToPostalCode = CoverLetterToPostalCode.Text;
            lControl.CoversheetLetterSalutation = PatientFollowingPhysicianTitle + PatientFollowingPhysicianLastName;
            lControl.CoversheetLetterBody = CoverLetterBody.Text;
            lControl.CoversheetLetterClosure1 = CoverLetterClosure1.Text;
            lControl.CoversheetLetterClosure2 = CoverLetterClosure2.Text;
            lControl.CoversheetLetterClosure3 = CoverLetterClosure3.Text;
            lControl.CoversheetLetterClosure4 = CoverLetterClosure4.Text;

            // load .ascx control onto page
            formHolder.Controls.Add(lControl);

            ReturnToStatusPageBtn.Attributes.Add("onClick", "return returnToStatusPage('Need MD Contact','" + PatientId + "');");
            PrintDiv.Style["display"] = "";
            PrintButtonsDiv.Style["display"] = "";

        }


        protected void CancelModalClick(object sender, EventArgs e)
        {
            Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "_cancelPage", "cancelPage(); ", true);
        }

        protected void CloseModalClick(object sender, EventArgs e)
        {
            Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "_closePage", "closePage(); ", true);
        }

        protected void AssignPhysicianClick(object sender, EventArgs e)
        {
            // assign selected physician as following physician
            if (!String.IsNullOrEmpty(FollowingPhysicianId.SelectedValue) && PatientId != 0)
            {
                Physician phObj = new Physician();
                phObj.Get(Int32.Parse(FollowingPhysicianId.SelectedValue));
                if (!phObj.IsEmpty)
                {
                    PhysicianDa pda = new PhysicianDa();
                    int physicianId = Int32.Parse(phObj[Physician.PhysicianId].ToString());

                    PatientPhysicianDa ptPhDa = new PatientPhysicianDa();
                    DataTable ptphDt = ptPhDa.ValidatePatientPhysician(PatientId, physicianId).Tables[0];
                    if (VerifyUnique(ptphDt))
                    {
                        AssignPhysicianErrorLBL.Text = String.Empty;

                        // NEW CODE, insert record though middle tier
                        PatientPhysician ptPhysician = new PatientPhysician();
                        ptPhysician[PatientPhysician.PatientId] = PatientId;
                        ptPhysician[PatientPhysician.PhysicianId] = physicianId;
                        ptPhysician[PatientPhysician.PtPhRole] = "Following";

                        UserController userCt = new UserController();
                        int currentUserId = userCt.GetUserId();
                        UserDa currentUserDa = new UserDa();
                        DataSet currentUserDs = currentUserDa.GetByUserId(userCt.GetUserId());

                        ptPhysician[PatientPhysician.EnteredTime] = DateTime.Now;
                        ptPhysician[PatientPhysician.EnteredBy] = (currentUserDs.Tables.Count > 0 && currentUserDs.Tables[0].Rows.Count > 0) ? currentUserDs.Tables[0].Rows[0][BOL.User.UserName].ToString() : "not specified";
                        ptPhysician.Save();

                        Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "_refreshPage", "refreshPage(); ", true);
                    }
                    else
                    {
                        AssignPhysicianErrorLBL.Text = "Physician " + phObj[Physician.PhFirstName].ToString() + " " + phObj[Physician.PhLastName].ToString() + " already assigned to patient as a(n) " + ptphDt.Rows[0][PatientPhysician.PtPhRole].ToString() + " physician.";
                    }
                }
            }
            
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

                    // set patient name
                    Patient ptObj = new Patient();
                    ptObj.Get(PatientId);
                    if (!String.IsNullOrEmpty(ptObj[BOL.Patient.PtLastName].ToString())) PatientName = String.Concat(PatientName, ptObj[BOL.Patient.PtLastName].ToString());
                    if (!String.IsNullOrEmpty(ptObj[BOL.Patient.PtMiddleName].ToString())) PatientName = String.Concat(PatientName, " ", ptObj[BOL.Patient.PtMiddleName].ToString());
                    if (!String.IsNullOrEmpty(ptObj[BOL.Patient.PtFirstName].ToString())) PatientName = String.Concat(PatientName, ", ", ptObj[BOL.Patient.PtFirstName].ToString());

                    // set patient following physician info
                    PatientPhysicianDa ptPhDa = new PatientPhysicianDa();
                    DataTable ptPhysiciansDt = ptPhDa.GetPatientPhysicians(PatientId);
                    DataView ptPhysiciansDv = new DataView(ptPhysiciansDt);
                    ptPhysiciansDv.RowFilter = PatientPhysician.PtPhRole + " LIKE '%following%'";
                    ptPhysiciansDv.Sort = PatientPhysician.UpdatedTime + " DESC, " + PatientPhysician.EnteredTime + " DESC";

                    if (ptPhysiciansDv.Count > 0)
                    {
                        NoPhysicianDiv.Style["display"] = "none";
                        PhysicianDiv.Style["display"] = "";

                        if (!String.IsNullOrEmpty(ptPhysiciansDv[0][BOL.Physician.PhTitle].ToString())) PatientFollowingPhysicianTitle = String.Concat(PatientFollowingPhysicianTitle, ptPhysiciansDv[0][BOL.Physician.PhTitle].ToString(), " ");
                        if (!String.IsNullOrEmpty(ptPhysiciansDv[0][BOL.Physician.PhFirstName].ToString())) PatientFollowingPhysicianFirstName = String.Concat(PatientFollowingPhysicianFirstName, ptPhysiciansDv[0][BOL.Physician.PhFirstName].ToString());
                        if (!String.IsNullOrEmpty(ptPhysiciansDv[0][BOL.Physician.PhLastName].ToString())) PatientFollowingPhysicianLastName = String.Concat(PatientFollowingPhysicianLastName, " ", ptPhysiciansDv[0][BOL.Physician.PhLastName].ToString());

                        if (!String.IsNullOrEmpty(ptPhysiciansDv[0][BOL.Physician.PhTitle].ToString())) PatientFollowingPhysicianName = String.Concat(PatientFollowingPhysicianName, ptPhysiciansDv[0][BOL.Physician.PhTitle].ToString(), " ");
                        if (!String.IsNullOrEmpty(ptPhysiciansDv[0][BOL.Physician.PhFirstName].ToString())) PatientFollowingPhysicianName = String.Concat(PatientFollowingPhysicianName, ptPhysiciansDv[0][BOL.Physician.PhFirstName].ToString());
                        if (!String.IsNullOrEmpty(ptPhysiciansDv[0][BOL.Physician.PhLastName].ToString())) PatientFollowingPhysicianName = String.Concat(PatientFollowingPhysicianName, " ", ptPhysiciansDv[0][BOL.Physician.PhLastName].ToString());
                        if (!String.IsNullOrEmpty(ptPhysiciansDv[0][BOL.Physician.PhSuffix].ToString())) PatientFollowingPhysicianName = String.Concat(PatientFollowingPhysicianName, ", ", ptPhysiciansDv[0][BOL.Physician.PhSuffix].ToString());


                        PatientFollowingPhysicianWorkPhone = ptPhysiciansDv[0][BOL.Physician.PhWorkPhone].ToString();
                        PatientFollowingPhysicianFax = ptPhysiciansDv[0][BOL.Physician.PhFax].ToString();

                        if (!String.IsNullOrEmpty(ptPhysiciansDv[0][BOL.Physician.PhAddress1].ToString())) PatientFollowingPhysicianAddressLine1 = String.Concat(PatientFollowingPhysicianAddressLine1, ptPhysiciansDv[0][BOL.Physician.PhAddress1].ToString());
                        if (!String.IsNullOrEmpty(ptPhysiciansDv[0][BOL.Physician.PhAddress2].ToString())) PatientFollowingPhysicianAddressLine2 = String.Concat(PatientFollowingPhysicianAddressLine2, ptPhysiciansDv[0][BOL.Physician.PhAddress2].ToString());
                        if (!String.IsNullOrEmpty(ptPhysiciansDv[0][BOL.Physician.PhCity].ToString())) PatientFollowingPhysicianAddressCity = String.Concat(PatientFollowingPhysicianAddressCity, ptPhysiciansDv[0][BOL.Physician.PhCity].ToString());
                        if (!String.IsNullOrEmpty(ptPhysiciansDv[0][BOL.Physician.PhState].ToString())) PatientFollowingPhysicianAddressState = String.Concat(PatientFollowingPhysicianAddressState, ptPhysiciansDv[0][BOL.Physician.PhState].ToString());
                        if (!String.IsNullOrEmpty(ptPhysiciansDv[0][BOL.Physician.PhPostalCode].ToString())) PatientFollowingPhysicianAddressPostalCode = String.Concat(PatientFollowingPhysicianAddressPostalCode, ptPhysiciansDv[0][BOL.Physician.PhPostalCode].ToString());
                        
                        if (!String.IsNullOrEmpty(ptPhysiciansDv[0][BOL.Physician.PhAddress1].ToString())) PatientFollowingPhysicianAddress = String.Concat(PatientFollowingPhysicianAddress, ptPhysiciansDv[0][BOL.Physician.PhAddress1].ToString(), "<br/>");
                        if (!String.IsNullOrEmpty(ptPhysiciansDv[0][BOL.Physician.PhAddress2].ToString())) PatientFollowingPhysicianAddress = String.Concat(PatientFollowingPhysicianAddress, ptPhysiciansDv[0][BOL.Physician.PhAddress2].ToString(), "<br/>");
                        if (!String.IsNullOrEmpty(ptPhysiciansDv[0][BOL.Physician.PhCity].ToString())) PatientFollowingPhysicianAddress = String.Concat(PatientFollowingPhysicianAddress, ptPhysiciansDv[0][BOL.Physician.PhCity].ToString());
                        if (!String.IsNullOrEmpty(ptPhysiciansDv[0][BOL.Physician.PhState].ToString())) PatientFollowingPhysicianAddress = String.Concat(PatientFollowingPhysicianAddress, ", ", ptPhysiciansDv[0][BOL.Physician.PhState].ToString());
                        if (!String.IsNullOrEmpty(ptPhysiciansDv[0][BOL.Physician.PhPostalCode].ToString())) PatientFollowingPhysicianAddress = String.Concat(PatientFollowingPhysicianAddress, " ", ptPhysiciansDv[0][BOL.Physician.PhPostalCode].ToString());

                        CloseBtn.Style["display"] = "none";
                        CancelBtn.Style["display"] = "";
                        AddPhysicianLink.Attributes["onclick"] = "popupAddEditPhysician('../../../Core/Utilities/AddEditPhysicians.aspx?newWindow=true');";
                        EditPhysicianLink.Attributes["onclick"] = "popupAddEditPhysician('../../../Core/Utilities/AddEditPhysicians.aspx?physid=" + ptPhysiciansDv[0][BOL.Physician.PhysicianId].ToString() + "'); ";
                    }
                    // else, paitent has no following physician
                    else
                    {
                        this.PopulatePhysiciansDropDown();

                        NoPhysicianDiv.Style["display"] = "";
                        PhysicianDiv.Style["display"] = "none";
                        NeedMD_ContactCompleteBtn.Style["display"] = "none";
                        CloseBtn.Style["display"] = "";
                        CancelBtn.Style["display"] = "none";
                        AddPhysicianLink.Attributes["onclick"] = "popupAddEditPhysician('../../../Core/Utilities/AddEditPhysicians.aspx?newWindow=true');";
                        EditPhysicianLink.Attributes["onclick"] = "popupAddEditPhysician('../../../Core/Utilities/AddEditPhysicians.aspx?newWindow=true');";

                    }
                }

            }
        }

        private void PopulatePhysiciansDropDown()
        {
            PhysicianDa phDa = new PhysicianDa();
            DataSet phDs = phDa.GetDistinctPhysicians();
            if (phDs.Tables.Count > 0)
            {
                FollowingPhysicianId.DataSource = phDs.Tables[0].DefaultView;
                FollowingPhysicianId.DataTextField = "PhName";
                FollowingPhysicianId.DataValueField = Physician.PhysicianId;
                FollowingPhysicianId.DataBind();
            }
        }

        protected bool VerifyUnique(DataTable dt)
        {
            if (dt.Rows.Count == 0)
            {
                return true;
            }
            else
            {
                return false;
            }
        }

        #endregion




 
}
}