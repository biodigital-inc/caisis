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
using System.Data.SqlClient;
using System.Xml;

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
    public partial class AddNewPatients : BasePage
    {
        public DataTable dimensionTable;
        private SessionHandler sessionHandler;

        private string navigateToPatientJS;

        protected override void Page_Load(object sender, EventArgs e)
        {
             //base.Page_Load(sender, e);
            sessionHandler = new SessionHandler(this.Page);

            // Always check to see if User has rights to add Patients
            if (PermissionManager.HasPermission("AddPatient"))
            {
                PageUtil.TurnBtnOn(saveBtn);
            }

            Session[SessionKey.CurrentPage] = "Patients";
 
            // build optional dimensions
            if (!Page.IsPostBack)
            {
                BuildDatasetDimensions();
            }
         }

        /// <summary>
        /// 
        /// </summary>
        protected void BuildDatasetDimensions()
        {
            int datasetId = (int)Session[SessionKey.DatasetId];

            PatientController pc = new PatientController();
            DataSet ds = pc.GetPatientDatasetOrDimensions(datasetId);
            if (ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
            {
                DataTable dt = ds.Tables[0];
                // create specially formatted text column
                dt.Columns.Add("text");
                foreach (DataRow row in dt.Rows)
                {
                    row["text"] = row["value"].ToString().Replace(":", ": ");
                }
                DatasetDimensionsRptr.DataSource = dt;
                DatasetDimensionsRptr.DataBind();

                // show layer
                DatasetDimensionsPlaceHolder.Visible = true;
            }
            // otherwise hide layer
            else
            {
                DatasetDimensionsPlaceHolder.Visible = false;
            }
        }

        /// <summary>
        /// Validates user selected a required dataset dimension.
        /// </summary>
        /// <returns>True or False if at least 1 datset dimension is selected.</returns>
        private bool ValidateDatasetDimensions()
        {
            if (DatasetDimensionsRptr.Items.Count > 0)
            {
                
                foreach (ListItem item in DatasetDimensionsRptr.Items)
                {
                    if (item.Selected)
                    {
                        return true;
                    }
                }
                string dimensionWarning = " Verify at least 1 patient attribute has been seleted.";
                if (!UserMessage.Text.Contains(dimensionWarning))
                {
                    UserMessage.Text += dimensionWarning;
                }
                return false;
            }
            else
            {
                return true;
            }
        }

        /// <summary>
        /// Saves the selected dataset dimensions for the patient.
        /// </summary>
        /// <param name="patientid"></param>
        private void SaveDatasetDimensions(int patientid)
        {
            if (DatasetDimensionsRptr.Items.Count > 0)
            {
                PatientController pc = new PatientController();
                DataTable dt = pc.GetDimensionTable();
                foreach (ListItem dim in DatasetDimensionsRptr.Items)
                {
                    // if dimension selected, insert
                    if (dim.Selected)
                    {
                        // !important: use "value", not "text" for output
                        string cbText = dim.Value;
                        DataRow dr = dt.NewRow();

                        int locColon = cbText.IndexOf(':');
                        dr["type"] = cbText.Substring(0, locColon).Trim();
                        string afterCol = cbText.Substring(locColon + 1, cbText.Length - locColon - 1).Trim();
                        int indexSpace = afterCol.IndexOf(" ", 0, afterCol.Length);
                        if (indexSpace > -1)
                        {
                            dr["value"] = afterCol.Substring(0, indexSpace);
                            dr["value2"] = afterCol.Substring(indexSpace + 1, afterCol.Length - indexSpace - 1);
                        }
                        else
                        {
                            dr["value"] = afterCol;
                        }

                        dt.Rows.Add(dr);
                    }

                }
                pc.InsertOrDatasetDimensions(dt, patientid);
            }
        }


        #region HELPERS

        /// <summary>
        /// Load values from page into Patient Biz Object
        /// </summary>
        /// <returns></returns>
        protected Patient GetPatient()
        {
            Patient pt = new Patient();

            pt[Patient.PtMRN] = PtMRN.Value;
            pt[Patient.PtFirstName] = PtFirstName.Value;
            pt[Patient.PtMiddleName] = PtMiddleName.Value;
            pt[Patient.PtLastName] = PtLastName.Value;
            pt[Patient.PtBirthDateText] = PtBirthDateText.Value;
            pt[Patient.PtBirthDate] = PtBirthDate.Value;
            pt[Patient.PtGender] = PtGender.Value;
            pt[Patient.PtRace] = PtRace.Value;
            pt[Patient.PtAddress1] = PtAddress1.Value;
            pt[Patient.PtAddress2] = PtAddress2.Value;
            pt[Patient.PtCity] = PtCity.Value;
            pt[Patient.PtState] = PtState.Value;
            pt[Patient.PtPostalCode] = PtPostalCode.Value;
            pt[Patient.PtCountry] = PtCountry.Value;
            pt[Patient.PtContactStatus] = PtContactStatus.Value;    
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

            foreach (ICaisisInputControl cic in CICHelper.GetCaisisInputControls(this))
            {
                if (cic.Required && cic.Value.Trim() == "")
                {
                    UserMessage.Text = "Fields named in red are required.";
                    UserMessage.CssClass = "requiredField";
                    valid = false;
                    break;
                 }
             }
            //foreach (Control con in Form.Controls)
            //{
            //    if (con is ICaisisInputControl)
            //    {
            //        ICaisisInputControl cic = (ICaisisInputControl)con;
            //        if (cic.Required && cic.Value.Trim() == "")
            //        {
            //            UserMessage.Text = "<span class=requiredField>Fields named in red are required.</span>";
            //            valid = false;
            //        }
            //    }
            //}
            return valid;
        }

        /// <summary>
        /// Clears the ICaisisInputControl fields on the page.
        /// </summary>

        protected void ClearFields()
        {
            CICHelper.ClearCaisisInputControlValues(this);
            //foreach (Control con in Form.Controls)
            //{
            //    if (con is ICaisisInputControl)
            //    {
            //        ICaisisInputControl cic = (ICaisisInputControl)con;
            //        cic.Value = "";
            //    }
            //}
        }

        /// <summary>
        /// 
        /// </summary>
        /// <returns></returns>
        protected string GetEncryptedPatientUrl()
        {
            if (Session[SessionKey.PatientId] != null && !string.IsNullOrEmpty(Session[SessionKey.PatientId].ToString()))
            {
                string url = Page.ResolveUrl("~/Core/DataEntryForms/Index.aspx?findClicked=true&epid=" + CustomCryptoHelper.Encrypt(Session[SessionKey.PatientId].ToString()));
                return url;
            }
            else
            {
                return string.Empty;
            }
        }

        /// <summary>
        /// Registers a helper javascript function for navigating to new patient in session.
        /// </summary>
        protected void RegisterGoToPatientFunction()
        {
            Page.ClientScript.RegisterStartupScript(this.GetType(), "onCancelClick", "goToPatient = function() { top.window.location = '" + GetEncryptedPatientUrl() + "'; }", true);
        }

        #endregion

        #region CLICK EVENTS

        protected void AddAnotherPatient(object sender, CommandEventArgs e)
        {
            ClearFields();
            RegisterGoToPatientFunction();
            cancelBtn.OnClientClick = "goToPatient()";
        }

        protected void AddPatientToDatabase(object source, EventArgs args)
        {
            if (ValidateRequiredFields() && ValidateDatasetDimensions())
            {
                Patient patient = this.GetPatient();
                PatientController ct = new PatientController();

                try
                {
                    
                    DataSet dimensionDs = ct.InsertNewPatientRecord(patient, (int)Session[SessionKey.DatasetId]);

                    // put patient in session
                    int patientId = (int)patient[Patient.PatientId];
                    ct.PutPatientInSession(Page, patientId);


                    if (dimensionDs.Tables["OrDatasetDimensions"] != null)
                    {
                        SaveDatasetDimensions(patientId);
                    }
                }
                catch (ClientException e)
                {
                    UserMessage.Text = e.Message;

                    // only allow movement between datasets if user has permission AND entered MRN and last name match existing record
                    if (e.Message.Equals(ct.msgInsertConflictWithMovePermission(this.PtMRN.Value, this.PtLastName.Value.ToUpper())))
                    {
                        UserMessage.Text = e.Message;

                        saveBtn.Visible = false;
                        moveBtn.Visible = true;
                        moveBtn.Enabled = true;
                    }
                    

                    return;
                }

                this.SetPageStateAfterInsert();
            }
            else
            {
                BuildDatasetDimensions();
            }
        }

        protected void MovePatientToCurrentDataset(object source, CommandEventArgs args)
        {
            PatientController pt = new PatientController();
            SessionHandler s = new SessionHandler(Session);
            int patientId = -1;
            int datasetId = s.GetDatasetId();
            SqlTransaction trans = null;

            DataTable dt = pt.GetPatientByMRN(this.PtMRN.Value);
            if (dt.Rows.Count == 1)
            {
                patientId = int.Parse(dt.Rows[0][Patient.PatientId].ToString());
                
                // associate the current users dataset with this patient

                // if current users dataset has multiple dimensions
                if (DatasetDimensionsRptr.Items.Count > 0)
                    SaveDatasetDimensions(patientId);
                // else, current users dataset has a single dimension
                else
                {
                    trans = DataAccessHelper.BeginTransaction();
                    pt.InsertDatasetDimensions(patientId, datasetId, trans);
                }

                pt.PutPatientInSession(Page, patientId);

            }

            this.SetPageStateAfterInsert();
        }

        /// <summary>
        /// hide show layers and allow user to click through to patient data section
        /// </summary>
        protected void SetPageStateAfterInsert()
        {
            // Set various javascript variables/click events
            string patientURL = "'" + GetEncryptedPatientUrl() + "'";
            Page.ClientScript.RegisterStartupScript(this.GetType(), "showModal", "if(top.window.modal) { top.window.modal.navigateToUrl(" + patientURL + "); }", true);
            // Tell top new patient is in session
            Page.ClientScript.RegisterClientScriptBlock(typeof(Page), "_newPatientInSession", "top._newPatientInSession = true;", true);
            PatientDataLink.Attributes.Add("onclick", "goToPatient();");
            patientAddedAlertLayer.Attributes["style"] = "border-right: #000000 1px; border-top: #000000 1px; z-index: 3; visibility: visible; border-left: #000000 1px; background-color: #f1f7fc; border-bottom: #000000 1px; position: absolute; width:750px;";
            DataEntryButtons.Visible = false;
            RegisterGoToPatientFunction();
        }

        #endregion


    }
}
