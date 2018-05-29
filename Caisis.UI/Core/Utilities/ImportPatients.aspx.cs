using System;
using System.Collections;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Web;
using System.Web.SessionState;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using System.Collections.Generic;

using System.Data.SqlClient;
using System.Data.Odbc;
using System.Diagnostics;
using System.Configuration;

using Caisis.Security;
using Caisis.DataAccess;
using Caisis.Controller;
using Caisis.BOL;

using Caisis.UI.Core.Classes;
using Caisis.UI.Core.Classes.CustomControls;

namespace Caisis.UI.Core.Utilities
{
    /// <summary>
    /// Summary description for AddNewPatients.
    /// </summary>
    public partial class ImportPatients : BasePage
    {
        public DataTable dimensionTable;
        private SessionHandler sessionHandler;
        private string navigateToPatientJS;

        // The current four McGill Identifiers
        protected static string IDTYPE_HEALTHINSNUM = "Health Ins Num";
        protected static string IDTYPE_RVHMRN = "RVH MRN";
        protected static string IDTYPE_MCHMRN = "MCH MRN";
        protected static string IDTYPE_MGHMRN = "MGH MRN";

        protected override void Page_Load(object sender, EventArgs e)
        {
            base.Page_Load(sender, e);
            sessionHandler = new SessionHandler(this.Page);

          

            // Always check to see if User has rights to add Patients
            if (PermissionManager.HasPermission("AddPatient"))
            {
                PageUtil.TurnBtnOn(saveBtn);
            }

            Session[SessionKey.CurrentPage] = "Patients";

            if (!Page.IsPostBack)
            {
                //importByMRNLayer.Attributes["style"] = "BORDER-RIGHT: #000000 1px; BORDER-TOP: #000000 1px; Z-INDEX: 3; VISIBILITY: visible; BORDER-LEFT: #000000 1px; Background-Color: f1f7fc; BORDER-BOTTOM: #000000 1px; POSITION: absolute; width:750;";
            }
        }

        #region HELPERS

        /// <summary>
        /// Load values from page into Patient Biz Object
        /// </summary>
        /// <returns></returns>
        protected Patient FillNewPatient()
        {
           Patient pt = new Patient();
           return FillPatient(pt);
        }

        protected Patient FillPatient(Patient pt)
        {
            //pt[Patient.PtMRN] = PtMRN.Value;
            pt[Patient.PtFirstName] = PtFirstName.Value;
            pt[Patient.PtLastName] = PtLastName.Value;
            pt[Patient.PtGender] = PtGender.Value;
            pt[Patient.PtBirthDateText] = PtBirthDateText.Value;
            pt[Patient.PtBirthDate] = PtBirthDate.Value;
            pt[Patient.PtContactPhone] = PtContactPhone.Value;
            pt[Patient.PtLanguage] = PtLanguage.Value;
            pt[Patient.PtAddress1] = PtAddress1.Value;
            pt[Patient.PtAddress2] = PtAddress2.Value;
            pt[Patient.PtCity] = PtCity.Value;
            pt[Patient.PtState] = PtState.Value;
            pt[Patient.PtPostalCode] = PtPostalCode.Value;
            pt[Patient.PtCountry] = PtCountry.Value;
            pt[Patient.PtNotes] = PtNotes.Value;

            return pt;
        }

        /// <summary>
        /// Validate ICaisisInputControl/BusinessObject Fields
        /// </summary>
        /// <returns></returns>
        private bool ValidateRequiredFields()
        {
            bool valid = true;

            foreach (Control con in Form.Controls)
            {
                if (con is ICaisisInputControl)
                {
                    ICaisisInputControl cic = (ICaisisInputControl)con;
                    if (cic.Required && cic.Value.Trim() == "")
                    {
                        UserMessage.Text = "<span class=requiredField>Fields named in red are required.</span>";
                        valid = false;
                    }
                }
            }
            return valid;
        }

        /// <summary>
        /// Clears the ICaisisInputControl fields on the page.
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void ClearFields()
        {
            SiteMRN.Text = "";
            hHealth_Ins_Num.Value = String.Empty;
            hRVH_MRN.Value = String.Empty;
            hMGH_MRN.Value = String.Empty;
            hMCH_MRN.Value = String.Empty;

            foreach (Control con in Form.Controls)
            {
                if (con is ICaisisInputControl)
                {
                    ICaisisInputControl cic = (ICaisisInputControl)con;
                    cic.Value = "";
                }
            }
        }

        /// <summary>
        /// 
        /// </summary>
        /// <returns></returns>
        private string GetEncryptedPatientUrl()
        {
            string url = "../DataEntryForms/index.aspx?findClicked=true&epid=" + CustomCryptoHelper.Encrypt(Session[SessionKey.PatientId].ToString());
            return url;
        }

        /// <summary>
        /// Registers a helper javascript function for navigating to new patient in session.
        /// </summary>
        protected void RegisterGoToPatientFunction()
        {
            Page.ClientScript.RegisterStartupScript(this.GetType(), "onCancelClick", "function goToPatient() { top.window.location = '" + GetEncryptedPatientUrl() + "'; }", true);
        }

        #endregion

        #region CLICK EVENTS

        protected void AddAnotherPatient(object sender, CommandEventArgs e)
        {
            ClearFields();
            RegisterGoToPatientFunction();
            cancelBtn.OnClientClick = "goToPatient()";
        }

        protected void AddPatientToDatabase(object source, CommandEventArgs args)
        {
            bool isUpdate = false;

            if (ValidateRequiredFields())
            {
                Patient patient = new Patient();
                try
                {
                   int PtID = GetPatientIdFromIdentifiers();
   
                   if(PtID < 0) // Patient is not in Caisis Already
                   {
                        // INSERT PATIENT INCLUDING PROPER DATASET
                        patient = this.FillNewPatient();
                        PatientController ct = new PatientController();
                        DataSet dimensionDs = ct.InsertNewPatientRecord(patient, (int)Session[SessionKey.DatasetId]);

                      
                        if (dimensionDs.Tables["OrDatasetDimensions"] != null)
                        {
                            Context.Items["temp"] = dimensionDs.Tables["OrDatasetDimensions"];
                            Server.Transfer("CommonTasks.aspx?TaskPage=AddPatientDimension");
                        }
                    }
                    else
                    {
                        // UPDATE PATIENT
                        int patientId = this.GetPatientIdFromIdentifiers();
                        patient.Get(patientId);
                        this.FillPatient(patient);
                        patient.Save();
                        isUpdate = true;
                    }
                   PatientController ptController = new PatientController();
                   ptController.PutPatientInSession(Page, (int)patient[Patient.PatientId]);

                    
                }
                catch (ClientException e)
                {
                    UserMessage.Text = e.Message;
                    return;
                }

                // NEW: patient was inserted, now do Identifiers if they exist
                try
                {
                    this.InsertIdentifiers(patient[Patient.PatientId].ToString());
                }
                catch (ClientException e)
                {
                    UserMessage.Text = e.Message;
                    // dont return since patient already went in DB
                }

                // Patient was INSERTED OR UPDATED; Set various javascript variables/click events
                string patientURL = "'" + GetEncryptedPatientUrl() + "'";
                Page.ClientScript.RegisterStartupScript(this.GetType(), "showModal", "if(top.window.modal) { top.window.modal.navigateToUrl(" + patientURL + "); }", true);
                PatientDataLink.Attributes.Add("onclick", "goToPatient();");
                UserMessage.Text = "";
                if (isUpdate)
                {
                    PatientAddedMsg.Text = "The patient demographics and identifiers have been updated in Caisis.";
                }
                else
                {
                    PatientAddedMsg.Text = "The patient has been added to the database.";
                }
                patientAddedAlertLayer.Attributes["style"] = "BORDER-RIGHT: #000000 1px; BORDER-TOP: #000000 1px; Z-INDEX: 3; VISIBILITY: visible; BORDER-LEFT: #000000 1px; Background-Color: f1f7fc; BORDER-BOTTOM: #000000 1px; POSITION: absolute; width:750;";
                RegisterGoToPatientFunction();

                
            }

        }

        // hate this, totally inefficient
        private int GetPatientIdFromIdentifiers()
        {
            IdentifierDa da = new IdentifierDa();
            DataSet ds = new DataSet();
            int patientId = -1;

            if (healthInsNumExists.Value.Equals("True"))
            {
                ds = da.ValidateIdentifier(hHealth_Ins_Num.Value, IDTYPE_HEALTHINSNUM);
            }
            else if (rvhExists.Value.Equals("True"))
            {
                ds = da.ValidateIdentifier(hRVH_MRN.Value, IDTYPE_RVHMRN);
            }
            else if (mghExists.Value.Equals("True"))
            {
                 ds = da.ValidateIdentifier(hMGH_MRN.Value, IDTYPE_MGHMRN);
            }
            else if (mchExists.Value.Equals("True"))
            {
                 ds = da.ValidateIdentifier(hMCH_MRN.Value, IDTYPE_MCHMRN);
            }

            if (ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
            {
                patientId = int.Parse(ds.Tables[0].Rows[0][Identifier.PatientId].ToString());
            }

            return patientId;
        }

        protected void RetrievePatientFromExternalSource(Object source, CommandEventArgs args)
        {
            string retVal = GetPatientFromADT(Sites.SelectedValue, SiteMRN.Text);

            if (retVal.Equals("patient found"))
            {
                // now validate patient not alread in database by identifiers
                bool patientInDB = this.IsPatientInDatabase();

                if (patientInDB == false)
                {
                    UserMessage.Text = "Please confirm the details of the patient are accurate before adding to Caisis.";
                }
                else
                {
                    // patient already in DB; update demographics and insert any new identifiers
                    UserMessage.Text = "This patient is already in Caisis. Please click the submit button to update the patient information.";
                    PtNotes.Enabled = false;
                    saveBtn.ImageUrl = "../../Images/Submit.gif";
                }

                saveBtn.Enabled = true;
                addPatientLayer.Attributes["style"] = "VISIBILITY: visible; z-index: -7;";
                //importByMRNLayer.Attributes["style"] = "VISIBILITY: hidden; BORDER-RIGHT: #000000 1px; BORDER-TOP: #000000 1px; Z-INDEX: 3;  BORDER-LEFT: #000000 1px; Background-Color: f1f7fc; BORDER-BOTTOM: #000000 1px; POSITION: absolute; width:750;";
                importByMRNLayer.Visible = false;   
            }
            else
            {
                UserMessage.Text = "No Patient Found. Please verify that you entered the correct site and MRN.";
                //importByMRNLayer.Attributes["style"] = "VISIBILITY: visible; BORDER-RIGHT: #000000 1px; BORDER-TOP: #000000 1px; Z-INDEX: 3;  BORDER-LEFT: #000000 1px; Background-Color: f1f7fc; BORDER-BOTTOM: #000000 1px; POSITION: absolute; width:750;";
            }
         }

        // use imported identifiers to check for presence of patient in caisis 
        private bool IsPatientInDatabase()
        {
            DataSet ds = new DataSet();
            IdentifierDa da = new IdentifierDa();
            string flagNewIdWith = "<Font color=red title=\"denotes this MRN is not in Caisis yet and will be imported.\"> * </font>";
           
            if (hHealth_Ins_Num.Value.Length > 0) healthInsNumExists.Value = da.DoesIdentifierExist(hHealth_Ins_Num.Value, IDTYPE_HEALTHINSNUM).ToString();
            if (hRVH_MRN.Value.Length > 0) rvhExists.Value = da.DoesIdentifierExist(hRVH_MRN.Value, IDTYPE_RVHMRN).ToString();
            if (hMGH_MRN.Value.Length > 0) mghExists.Value = da.DoesIdentifierExist(hMGH_MRN.Value, IDTYPE_MGHMRN).ToString();
            if (hMCH_MRN.Value.Length > 0) mchExists.Value = da.DoesIdentifierExist(hMCH_MRN.Value, IDTYPE_MCHMRN).ToString();

            if (healthInsNumExists.Value.Equals("True") || rvhExists.Value.Equals("True") || mghExists.Value.Equals("True") || mchExists.Value.Equals("True"))
            {
                // patient is already in database; flag only new identifiers then return true
                if (healthInsNumExists.Value.Equals("False") && Health_Ins_Num.Text.Length > 0) Health_Ins_Num.Text += flagNewIdWith;
                if (rvhExists.Value.Equals("False") && RVH_MRN.Text.Length > 0) RVH_MRN.Text += flagNewIdWith;
                if (mghExists.Value.Equals("False") && MGH_MRN.Text.Length > 0) MGH_MRN.Text += flagNewIdWith;
                if (mchExists.Value.Equals("False") && MGH_MRN.Text.Length > 0) MCH_MRN.Text += flagNewIdWith;
                UserMessage.Text += flagNewIdWith + " denotes new Identifier.";

                // NEED to return the patient ID
                return true;
            }
            else
            {
                return false;
            }
        }

        private string GetImportDBConnectionString()
        {
            string conn;
            if (ConfigurationSettings.AppSettings["encryptDbConnectString"] != null && ConfigurationSettings.AppSettings["encryptDbConnectString"].Length > 0)
            {
                conn = System.Configuration.ConfigurationSettings.AppSettings["importDbConnectionString"];
            }
            else
            {
                throw new ClientException("Connection string \"importDbConnectionString\" to database used for import not defined in web.config file.");
            }
            return conn;
        }

        // TODO: pull McGill specific code into separate class
        private string GetPatientFromADT(string ThisSite, string ThisMRN)
        {

            OdbcConnection connection;
            OdbcCommand command;
            OdbcDataReader reader;
            string returnValue = "";
            ThisSite = ThisSite.ToUpper();

            // Connect to Clinical Data Repository (CDR) Database via ODBC. (MySQL)
            try
            {
                connection = new OdbcConnection();
                connection.ConnectionString = this.GetImportDBConnectionString();
                connection.Open();
            }
            catch (Exception e)
            {
                UserMessage.Text = "Connection Error. Error connecting to Clinical Data Repository (CDR) Database. " + e.Message;
                throw;
            }

            ThisSite = ThisSite.Trim();

            // MRN must be 12 digits and Left padded with zeros. 
            // It's a requirement by CDR because MRNs are stored as 12 digits, 
            // although the maximum valid MRN in ADT is 7 digits.
            ThisMRN = ThisMRN.Trim();
            if (ThisMRN.Length < 12)
            {
                ThisMRN = ThisMRN.PadLeft(12, '0');
            }
            ////////////////////////////////////////////////////

            String sQuery = " Select * from t_patient as p, t_medical_record as m " +
                            " where p.patient_id = m.patient_id and m.site='" + ThisSite +
                                    "' and m.mrn='" + ThisMRN + "';";


            if (connection != null)
            {
                // create a SqlCommand object to hold the SQL statement
                command = connection.CreateCommand();

                command = new OdbcCommand(sQuery, connection);

                reader = command.ExecuteReader();

                if (!reader.HasRows)
                {
                    returnValue = "No Patient Found";
                    reader.Close();
                    connection.Close();
                    return returnValue;
                }

                string RAMQ = "";
                string Sex = "";
                string Birthdate = "";
                if (reader.Read())
                {
                    RAMQ = reader["HEALTH_INSURANCE_NO"].ToString();
                    Sex = reader["SEX"].ToString();
                    Birthdate = reader["BIRTHDATE"].ToString();
                    if (Birthdate.Length >= 10)
                    {
                        Birthdate = String.Format("{0:u}", reader["BIRTHDATE"]);    // yyyy-mm-dd hh:mm:ss (UniversalSortableDateTimePattern)
                        Birthdate = Birthdate.Substring(0, 10);                     // take only yyyy-mm-dd to Match with later in the next Query
                    }

                    // FIRST POPULATE THE PATIENT FIELDS 
                    GetPatientValuesFromReader(reader);

                }

                string mrnRVH = "";
                string mrnMGH = "";
                string mrnMCH = "";
                string healthInsNum = "";
                string sep = "!";
                string site = "";

                if(RAMQ != "")
                {
                    sQuery = " select * from t_patient as p, t_medical_record as m " +
                             "          where p.patient_id = m.patient_id  " +
                             "            and p.health_insurance_no = '" + RAMQ + "' " +
                             "            and p.sex = '" + Sex + "' " +
                             "            and date_format(p.birthdate,'%Y-%m-%d') = '" + Birthdate + "' " +
                             "          order by m.SITE DESC "; // order by SITE DESCending to try 
                    // to avoid MCH to be the first record.
                    // RVH or MGH will appear before MCH.   
                    // Address taken from RVH or MGH record
                    // is obviously more recent and more accurate 
                    // than MCH one which was recorded when the patient was
                    // still a child.

                    command.CommandText = sQuery;
                    reader.Close();
                    reader = command.ExecuteReader();

                    int count = 0;
                    site = "";

                    GetIdentifiersFromReader(reader);
                }

                command.Dispose();
                reader.Close();
                reader.Dispose();
                connection.Close();
            }

            return "patient found";
        }

        private void GetIdentifiersFromReader(OdbcDataReader reader)
        {
            string mrnRVH = "";
            string mrnMGH = "";
            string mrnMCH = "";
            string site = "";
            string healthInsNum = "";

            int count = 0;

            while (reader.Read())
            {
                count += 1;
                this.SetIdentifier(reader["SITE"].ToString(), reader["MRN"].ToString());  
            }
        }

        private void GetPatientValuesFromReader(OdbcDataReader reader)
        {

            DateTime result;
            DateTime.TryParse(reader["BIRTHDATE"].ToString(), out result);

            Health_Ins_Num.Text = reader["HEALTH_INSURANCE_NO"].ToString();
            hHealth_Ins_Num.Value = reader["HEALTH_INSURANCE_NO"].ToString();

            lblPtLastName.Text = PtLastName.Value   = reader["FAMILY_NAME"].ToString();
            lblPtFirstName.Text = PtFirstName.Value = reader["GIVEN_NAME"].ToString();
            lblPtGender.Text = PtGender.Value       = reader["SEX"].ToString();
            lblPtBirthDateText.Text = PtBirthDateText.Value = result.ToShortDateString();
            PtBirthDate.Value = result.ToShortDateString(); // need birthdate and birthdatetext
            lblPtLanguage.Text = PtLanguage.Value = reader["PREFERRED_LANGUAGE"].ToString();
            lblPtAddress1.Text = PtAddress1.Value = reader["STREET_ADDRESS"].ToString();
            lblPtCity.Text = PtCity.Value = reader["MUNICIPALITY"].ToString();
            lblPtState.Text = PtState.Value = reader["PROVINCE"].ToString();
            lblPtPostalCode.Text = PtPostalCode.Value = reader["POSTAL_CODE"].ToString();
            lblPtContactPhone.Text = PtContactPhone.Value = reader["TELEPHONE_NUMBER"].ToString();
            
            // handle country; mis-spelled 
            if (reader["COUNTY"].ToString().Length > 0)
            {
                lblPtCountry.Text = PtCountry.Value = reader["County"].ToString();
            }
            else if (reader["PROVINCE"].ToString().Length > 0)
            {
                lblPtCountry.Text = PtCountry.Value = "Canada";
            }

            // OTHER FIELDS AVAILABLE
            // = reader["PLACE_OF_BIRTH"].ToString();
            // = reader["SPOUSE_NAME"].ToString();
            // = reader["FATHER_NAME"].ToString();
            // = reader["MOTHER_MAIDEN_NAME_PID"].ToString();
            // = reader["DECEASED_WHEN"].ToString(); // DECEASED DATE??? 

            this.SetIdentifier(reader["SITE"].ToString(), reader["MRN"].ToString());
        }

        protected void SetIdentifier(string site, string mrn)
        {
            // remove leading 0's
            string id = mrn.TrimStart('0');

            if (site == "RVH")
            {
                RVH_MRN.Text = id;
                hRVH_MRN.Value = id;
            }
            if (site == "MGH")
            {
                MGH_MRN.Text = id;
                hMGH_MRN.Value = id;
            }
            if (site == "MCH")
            {
                MCH_MRN.Text = id;
                hMCH_MRN.Value = id;
            }
        }

        // TODO: Ideally this would be generic and iterate over a list of IDTypes and Ids
        private void InsertIdentifiers(string patientId)
        {
            if (hHealth_Ins_Num.Value.Length > 0 && healthInsNumExists.Value.Equals("False"))
            {
                Identifier i = new Identifier();
                i[Identifier.PatientId] = patientId;
                i[Identifier.IdType] = IDTYPE_HEALTHINSNUM;
                i[Identifier.Identifier_Field] = hHealth_Ins_Num.Value;
                i.Save();
            }

            if (hRVH_MRN.Value.Length > 0 && rvhExists.Value.Equals("False"))
            {
                Identifier i = new Identifier();
                i[Identifier.PatientId] = patientId;
                i[Identifier.IdType] = IDTYPE_RVHMRN;
                i[Identifier.Identifier_Field] = hRVH_MRN.Value;
                i.Save();
            }

            if (hMGH_MRN.Value.Length > 0 && mghExists.Value.Equals("False"))
            {
                Identifier i = new Identifier();
                i[Identifier.PatientId] = patientId;
                i[Identifier.IdType] = IDTYPE_MGHMRN;
                i[Identifier.Identifier_Field] = hMGH_MRN.Value;
                i.Save();
            }

            if (hMCH_MRN.Value.Length > 0 && mchExists.Value.Equals("False"))
            {
                Identifier i = new Identifier();
                i[Identifier.PatientId] = patientId;
                i[Identifier.IdType] = IDTYPE_MCHMRN;
                i[Identifier.Identifier_Field] = hMCH_MRN.Value;
                i.Save();
            }
        }

        #endregion


    }
}
