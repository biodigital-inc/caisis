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
    public partial class StatusNeedPtContactInfo : FollowUpBasePage
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

        string _patientCompany = String.Empty;
        public string PatientCompany
        {
            get { return _patientCompany; }
            set { _patientCompany = value; }
        }

        string _patientBusinessCity = String.Empty;
        public string PatientBusinessCity
        {
            get { return _patientBusinessCity; }
            set { _patientBusinessCity = value; }
        }

        string _patientBusinessState = String.Empty;
        public string PatientBusinessState
        {
            get { return _patientBusinessState; }
            set { _patientBusinessState = value; }
        }

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

        string _patientEmail = String.Empty;
        public string PatientEmail
        {
            get { return _patientEmail; }
            set { _patientEmail = value; }
        }

        string _patientContactPerson = String.Empty;
        public string PatientContactPerson
        {
            get { return _patientContactPerson; }
            set { _patientContactPerson = value; }
        }

        string _patientContactAddress1 = String.Empty;
        public string PatientContactAddress1
        {
            get { return _patientContactAddress1; }
            set { _patientContactAddress1 = value; }
        }

        string _patientContactAddress2 = String.Empty;
        public string PatientContactAddress2
        {
            get { return _patientContactAddress2; }
            set { _patientContactAddress2 = value; }
        }

        string _patientContactCity = String.Empty;
        public string PatientContactCity
        {
            get { return _patientContactCity; }
            set { _patientContactCity = value; }
        }

        string _patientContactState = String.Empty;
        public string PatientContactState
        {
            get { return _patientContactState; }
            set { _patientContactState = value; }
        }

        string _patientContactPostalCode = String.Empty;
        public string PatientContactPostalCode
        {
            get { return _patientContactPostalCode; }
            set { _patientContactPostalCode = value; }
        }

        string _patientContactPhone = String.Empty;
        public string PatientContactPhone
        {
            get { return _patientContactPhone; }
            set { _patientContactPhone = value; }
        }


        protected void Page_Init(object sender, EventArgs e)
        {
            this.EnableViewState = true;

            this.SetPatientInfo();
          
            if (!IsPostBack)
            {
            }

            // initialize patient business info
            PatientCompanyTB.Text = String.IsNullOrEmpty(PatientCompanyTB.Text) ? PatientCompany : PatientCompanyTB.Text;
            PatientBusinessCityTB.Text = String.IsNullOrEmpty(PatientBusinessCityTB.Text) ? PatientBusinessCity : PatientBusinessCityTB.Text;
            PatientBusinessStateSelect.SelectedValue = String.IsNullOrEmpty(PatientBusinessStateSelect.SelectedValue) ? PatientBusinessState : PatientBusinessStateSelect.SelectedValue;

            // initialize patient address info
            PatientAddress1TB.Text = String.IsNullOrEmpty(PatientAddress1TB.Text) ? PatientAddress1 : PatientAddress1TB.Text;
            PatientAddress2TB.Text = String.IsNullOrEmpty(PatientAddress2TB.Text) ? PatientAddress2 : PatientAddress2TB.Text;
            PatientCityTB.Text = String.IsNullOrEmpty(PatientCityTB.Text) ? PatientCity : PatientCityTB.Text;
            PatientStateSelect.SelectedValue = String.IsNullOrEmpty(PatientStateSelect.SelectedValue) ? PatientState : PatientStateSelect.SelectedValue;
            PatientPostalCodeTB.Text = String.IsNullOrEmpty(PatientPostalCodeTB.Text) ? PatientPostalCode : PatientPostalCodeTB.Text;
            PatientEmailTB.Text = String.IsNullOrEmpty(PatientEmailTB.Text) ? PatientEmail : PatientEmailTB.Text;
            PatientCountryCB.Text = String.IsNullOrEmpty(PatientCountryCB.Text) ? PatientCountry : PatientCountryCB.Text;

            // initialize patient contact address info
            PatientContactPersonTB.Text = String.IsNullOrEmpty(PatientContactPersonTB.Text) ? PatientContactPerson : PatientContactPersonTB.Text;
            PatientContactAddress1TB.Text = String.IsNullOrEmpty(PatientContactAddress1TB.Text) ? PatientContactAddress1 : PatientContactAddress1TB.Text;
            PatientContactAddress2TB.Text = String.IsNullOrEmpty(PatientContactAddress2TB.Text) ? PatientContactAddress2 : PatientContactAddress2TB.Text;
            PatientContactCityTB.Text = String.IsNullOrEmpty(PatientContactCityTB.Text) ? PatientContactCity : PatientContactCityTB.Text;
            PatientContactStateSelect.SelectedValue = String.IsNullOrEmpty(PatientContactStateSelect.SelectedValue) ? PatientContactState : PatientContactStateSelect.SelectedValue;
            PatientContactPostalCodeTB.Text = String.IsNullOrEmpty(PatientContactPostalCodeTB.Text) ? PatientContactPostalCode : PatientContactPostalCodeTB.Text;
            PatientContactPhoneTB.Text = String.IsNullOrEmpty(PatientContactPhoneTB.Text) ? PatientContactPhone : PatientContactPhoneTB.Text;            
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
                // create ActionItem = 'PtContactInfoUpdated' for patients to check
                ActionDa actionDa = new ActionDa();
                BOL.Action actionObj = new Caisis.BOL.Action();
                actionObj[BOL.Action.PatientId] = PatientId;
                actionObj[BOL.Action.ActionDateText] = DateTime.Today.ToShortDateString();
                actionObj[BOL.Action.ActionDate] = DateTime.Today;
                actionObj[BOL.Action.ActionItem] = "PtContactInfoUpdated";

                UserController userCt = new UserController();
                int currentUserId = userCt.GetUserId();
                UserDa currentUserDa = new UserDa();
                DataSet currentUserDs = currentUserDa.GetByUserId(userCt.GetUserId());
                actionObj[BOL.Action.EnteredBy] = (currentUserDs.Tables.Count > 0 && currentUserDs.Tables[0].Rows.Count > 0) ? currentUserDs.Tables[0].Rows[0][BOL.User.UserName].ToString() : "not specified";

                actionObj[BOL.Action.EnteredTime] = DateTime.Today;

                actionObj.Save();

                // set patient status to 'current'
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
                    ptObj[Patient.PtEmail] = PatientEmailTB.Text;
                    ptObj[Patient.PtCountry] = PatientCountryCB.Text;

                    ptObj[Patient.PtCompany] = PatientCompanyTB.Text;
                    ptObj[Patient.PtBusinessCity] = PatientBusinessCityTB.Text;
                    ptObj[Patient.PtBusinessState] = PatientBusinessStateSelect.SelectedValue;

                    ptObj[Patient.PtContactPerson] = PatientContactPersonTB.Text;
                    ptObj[Patient.PtContactAddress1] = PatientContactAddress1TB.Text;
                    ptObj[Patient.PtContactAddress2] = PatientContactAddress2TB.Text;
                    ptObj[Patient.PtContactCity] = PatientContactCityTB.Text;
                    ptObj[Patient.PtContactState] = PatientContactStateSelect.SelectedValue;
                    ptObj[Patient.PtContactPostalCode] = PatientContactPostalCodeTB.Text;
                    ptObj[Patient.PtContactPhone] = PatientContactPhoneTB.Text;

                    ptObj[Patient.UpdatedBy] = (currentUserDs.Tables.Count > 0 && currentUserDs.Tables[0].Rows.Count > 0) ? currentUserDs.Tables[0].Rows[0][BOL.User.UserName].ToString() : "not specified";
                    ptObj[Patient.UpdatedTime] = DateTime.Today;

                    ptObj.Save();
                }            
            }
            
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

                    PatientCompany = ptObj[BOL.Patient.PtCompany].ToString();
                    PatientBusinessCity = ptObj[BOL.Patient.PtBusinessCity].ToString();
                    PatientBusinessState = ptObj[BOL.Patient.PtBusinessState].ToString();

                    PatientAddress1 = ptObj[BOL.Patient.PtAddress1].ToString();
                    PatientAddress2 = ptObj[BOL.Patient.PtAddress2].ToString();
                    PatientCity = ptObj[BOL.Patient.PtCity].ToString();
                    PatientState = ptObj[BOL.Patient.PtState].ToString();
                    PatientPostalCode = ptObj[BOL.Patient.PtPostalCode].ToString();
                    PatientCountry = ptObj[BOL.Patient.PtCountry].ToString();
                    PatientEmail = ptObj[BOL.Patient.PtEmail].ToString();

                    PatientContactPerson = ptObj[BOL.Patient.PtContactPerson].ToString();
                    PatientContactAddress1 = ptObj[BOL.Patient.PtContactAddress1].ToString();
                    PatientContactAddress2 = ptObj[BOL.Patient.PtContactAddress2].ToString();
                    PatientContactCity = ptObj[BOL.Patient.PtContactCity].ToString();
                    PatientContactState = ptObj[BOL.Patient.PtContactState].ToString();
                    PatientContactPostalCode = ptObj[BOL.Patient.PtContactPostalCode].ToString();
                    PatientContactPhone = ptObj[BOL.Patient.PtContactPhone].ToString();

                    CancelBtn.Style["display"] = "";
                }
            }
        }

        #endregion




 
}
}