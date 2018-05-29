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

namespace Caisis.UI.Modules.FollowUp
{
    public partial class VitalStatusCheck : FollowUpBasePage
    {
        private XmlDocument xDoc;
        private XmlNode ssdmfNode;
        private string SSDMF_AppConfigType = "Follow Up Module";
        private string SSDMF_AppConfigVariable = "Available SSDMF Requests";
        protected string recordcount;
        private Boolean _showPatientRow = false;

        struct VitalState
        {
            public const string StateDue = "StateDue";
            public const string StateCheck = "StateCheck";
            public const string StateUpdate = "StateUpdate";
        };

        public String SetVitalState
        {
            set { HiddenVitalState.Value = value; }
        }

        public String GetVitalState
        {
            get { return HiddenVitalState.Value; }
        }

        public VitalStatusCheck()
        {
            xDoc = XmlUtil.GetModulesConfigXml();
            ssdmfNode = xDoc.SelectSingleNode("/modules//module[@name='Follow Up']/configuration/SSDMFcredentials");
        }

        protected void Page_Init(object sender, EventArgs e)
        {
            LoadPatientsDue();
        }
        protected override void Page_Load(object sender, EventArgs e)
        {
            base.Page_Load(sender, e);
            SetExpirationLabels();

            if (!IsPostBack)
            {
            }
        }

        #region PATIENTS DUE FUNCTIONS

        private void LoadPatientsDue()
        {
            try
            {
                SetButtons(VitalState.StateDue);
                SetVitalState = VitalState.StateDue;

                DataTable dt = GetPatientDueForVitalStatusCheck();
                if (dt.Rows.Count > 0)
                {
                    VitalPatients.DataSource = dt;
                    VitalPatients.DataBind();
                }
                recordcount = dt.Rows.Count.ToString();
                VitalsMsg.Text = "Patients Due for Vital Status Check";
                VitalErrors.Text = "";
            }
            catch (ClientException ex)
            {
                VitalErrors.Text = ex.Message;
            }

        }

        private DataTable GetPatientDueForVitalStatusCheck()
        {
            string datasetSql = CacheManager.GetDatasetSQL(Session[SessionKey.DatasetId]);
            Caisis.DataAccess.FollowUpDA fDa = new Caisis.DataAccess.FollowUpDA();
            DataTable fDt = fDa.GetPatientByLastRecordDate(datasetSql);

            //check if any of these patients do no have PtContactStatus='NeedSSDI_Check'
            DataView fDv = new DataView(fDt);
            fDv.RowFilter = Patient.PtContactStatus + " <> 'NeedSSDI_Check' OR " + Patient.PtContactStatus + " IS NULL OR " + Patient.PtContactStatus + " = '' ";
            if (fDv.Count > 0)
            {
                Patient ptBiz = new Patient();

                //set the contact status of these patients to 'NeedSSDI_Check'
                foreach (DataRowView drv in fDv)
                {
                    ptBiz.Get(Int32.Parse(drv[Patient.PatientId].ToString()));

                    if (!ptBiz.IsEmpty)
                    {
                        ptBiz[Patient.PtContactStatus] = "NeedSSDI_Check";
                        ptBiz.Save();
                    }
                    ptBiz.Clear();
                }

                // query again for the patients due for vital status check
                fDt = fDa.GetPatientByLastRecordDate(datasetSql);
            }

            DataTable patientsDueDt = GetVitalTableTemplate();

            foreach (DataRow fDr in fDt.Rows)
            {
                DataRow ptDuedr = patientsDueDt.NewRow();
                //ptDuedr["RunSSDICheckCB"] = false;
                //ptDuedr["SsdiStatus"] = String.Empty;
                //ptDuedr["SsdiDeathDateText"] = String.Empty;
                //ptDuedr["UpdatePatientStatusCB"] = false;
                //ptDuedr["UpdatePatientStatus"] = false;
                //ptDuedr["FinalStatus"] = String.Empty;
                ptDuedr[Patient.PatientId] = int.Parse(fDr[Patient.PatientId].ToString());
                ptDuedr[Patient.PtMRN] = fDr[Patient.PtMRN].ToString();
                ptDuedr[Patient.PtFirstName] = fDr[Patient.PtFirstName].ToString();
                ptDuedr[Patient.PtLastName] = fDr[Patient.PtLastName].ToString();
                ptDuedr["PtSSN"] = fDr["PtSSN"].ToString();
                ptDuedr[Patient.PtBirthDateText] = fDr[Patient.PtBirthDateText].ToString();
                ptDuedr[Patient.PtDeathDateText] = fDr[Patient.PtDeathDateText].ToString();
                ptDuedr[Patient.PtContactStatus] = fDr[Patient.PtContactStatus].ToString();
                patientsDueDt.Rows.Add(ptDuedr);
            }

            return patientsDueDt;
        }

        #endregion

        #region SSDI CHECK FUNCTIONS

        private void LoadPatientsChecked()
        {
            try
            {
                SetButtons(VitalState.StateCheck);
                SetVitalState = VitalState.StateCheck;

                // retrieve patients to run ssdi check on
                DataSet patientToCheckDs = GetPatientsSelectedForSSDICheck();

                if (patientToCheckDs.Tables.Count > 0 && patientToCheckDs.Tables[0].Rows.Count > 0)
                {
                    VitalPatients.DataSource = patientToCheckDs.Tables[0].DefaultView;
                    VitalPatients.DataBind();

                    recordcount = patientToCheckDs.Tables[0].Rows.Count.ToString();
                }
                else
                {
                    recordcount = "0";
                }
                VitalsMsg.Text = "Patient(s) Checked";
                VitalErrors.Text = "";
            }
            catch (ClientException ex)
            {
                VitalErrors.Text = ex.Message;
            }


        }
        private DataSet GetPatientsSelectedForSSDICheck()
        {
            DataSet patientsToCheckDs = new DataSet();
            DataTable patientsToCheckDt = GetVitalTableTemplate();

            foreach (RepeaterItem rItem in VitalPatients.Items)
            {
                if (rItem.ItemType == ListItemType.Item || rItem.ItemType == ListItemType.AlternatingItem)
                {
                    CheckBox RunSSDICheckCB = (CheckBox)rItem.FindControl("RunSSDICheckCB");
                    //if (RunSSDICheckCB.Checked)
                    //{
                    CheckBox UpdatePatientStatusCB = (CheckBox)rItem.FindControl("UpdatePatientStatusCB");
                    Literal SsdiStatus = (Literal)rItem.FindControl("SsdiStatus");
                    Literal SsdiDeathDateText = (Literal)rItem.FindControl("SsdiDeathDateText");
                    Literal UpdatePatientStatus = (Literal)rItem.FindControl("UpdatePatientStatus");
                    Literal FinalStatus = (Literal)rItem.FindControl("FinalStatus");
                    Literal PatientId = (Literal)rItem.FindControl(Patient.PatientId);
                    Literal ptMrn = (Literal)rItem.FindControl(Patient.PtMRN);
                    Literal ptFirstName = (Literal)rItem.FindControl(Patient.PtFirstName);
                    Literal ptLastName = (Literal)rItem.FindControl(Patient.PtLastName);
                    Literal PtSSN = (Literal)rItem.FindControl("PtSSN");
                    Literal ptBirthDateText = (Literal)rItem.FindControl(Patient.PtBirthDateText);
                    Literal ptDeathDateText = (Literal)rItem.FindControl(Patient.PtDeathDateText);
                    Literal ptContactStatus = (Literal)rItem.FindControl(Patient.PtContactStatus);

                    DataRow dr = patientsToCheckDt.NewRow();
                    dr["RunSSDICheckCB"] = RunSSDICheckCB.Checked;
                    dr["SsdiStatus"] = RunSSDICheckCB.Checked ? "<b style=\"color: red;\" >Not Found</b>" : String.Empty;
                    dr["SsdiDeathDateText"] = String.Empty;
                    dr["UpdatePatientStatusCB"] = UpdatePatientStatusCB.Checked;
                    dr["UpdatePatientStatus"] = !string.IsNullOrEmpty(UpdatePatientStatus.Text) ? (UpdatePatientStatus.Text == "1" || UpdatePatientStatus.Text.ToLower() == "true" ? true : false) : false;
                    dr["FinalStatus"] = String.Empty;
                    dr[Patient.PatientId] = int.Parse(PatientId.Text);
                    dr[Patient.PtMRN] = ptMrn.Text;
                    dr[Patient.PtFirstName] = ptFirstName.Text;
                    dr[Patient.PtLastName] = ptLastName.Text;
                    dr["PtSSN"] = PtSSN.Text;
                    dr[Patient.PtBirthDateText] = ptBirthDateText.Text;
                    dr[Patient.PtDeathDateText] = ptDeathDateText.Text;
                    dr[Patient.PtContactStatus] = ptContactStatus.Text;
                    patientsToCheckDt.Rows.Add(dr);
                    //}
                }
            }

            patientsToCheckDs.Tables.Add(patientsToCheckDt);
            return patientsToCheckDs;
        }

        private void LoadPatientCheckedsWithMatchedSSDIData(object sender, EventArgs e, DataSet ssdiResultsDs, DataSet patientToCheckDs, Boolean show, string errorFlagMsg)
        {
            if (show)
            {
                SetButtons(VitalState.StateCheck);
                SetVitalState = VitalState.StateCheck;


                if (patientToCheckDs.Tables.Count > 0)
                {

                   DataTable patientsCheckedDt = patientToCheckDs.Tables[0].Clone();
                   this.EnableViewState = true;

                    // update the displayed status for any selected patients that have ssdi results
                    // match only for SSN for now

                    int matchCount = 0;
                    int checkCount = 0;

                    if (ssdiResultsDs.Tables.Count > 0)
                    {
                        DataView ssdiDv = new DataView(ssdiResultsDs.Tables[0]);

                        foreach (DataRow patientToCheckDr in patientToCheckDs.Tables[0].Rows)
                        {
                            // deterime if patient was selected to be checked
                            if (patientToCheckDr["RunSSDICheckCB"].ToString() == "1")
                            {
                                checkCount++;

                                // if patient was checked, show their updated contact status
                                Patient ptObj = new Patient();
                                ptObj.Get(Int32.Parse(patientToCheckDr[Patient.PatientId].ToString()));
                                if (!ptObj.IsEmpty)
                                {
                                    patientToCheckDr[Patient.PtContactStatus] = ptObj[Patient.PtContactStatus];
                                }
                                
                                // get SSN of patient to check
                                //IdentifierDa ptIdDa = new IdentifierDa();
                                //string currentSSN = ptIdDa.GetPatientIdentifierByIdType(Int32.Parse(patientToCheckDr[Patient.PatientId].ToString()), "SSN");
                                string currentSSN = patientToCheckDr["PtSSN"].ToString();
                                if (!String.IsNullOrEmpty(currentSSN))
                                {
                                    // see if current patient has ssdi data
                                    ssdiDv.RowFilter = "SSN = '" + currentSSN + "'";

                                    if (ssdiDv.Count == 1)
                                    {
                                        string deatDate = ssdiDv[0]["DOD"].ToString();

                                        if (ValidSSDIDate(deatDate))
                                        {
                                            matchCount++;

                                            patientToCheckDr["SsdiStatus"] = "<b style=\"color: green;\" >Match Found</b>";
                                            patientToCheckDr["SsdiDeathDateText"] = ConvertSSDIDateToStandardFormat(deatDate);
                                            patientToCheckDr["UpdatePatientStatus"] = true;
                                        }
                                        else
                                        {
                                            patientToCheckDr["SsdiStatus"] = "<b style=\"color: red;\" >Match Found, Invalid Death Date</b>";
                                            patientToCheckDr["SsdiDeathDateText"] = String.Empty;
                                            patientToCheckDr["UpdatePatientStatus"] = false;

                                        }
                                    }
                                    else if (ssdiDv.Count > 1)
                                    {
                                        patientToCheckDr["SsdiStatus"] = "<b style=\"color: red;\" >Match Found, Multiple Death records</b>";
                                        patientToCheckDr["SsdiDeathDateText"] = String.Empty;
                                        patientToCheckDr["UpdatePatientStatus"] = false;

                                    }
                                    else
                                    {
                                        if (!patientToCheckDr["SsdiStatus"].ToString().ToUpper().Contains("NOT CHECKED"))
                                        {
                                            patientToCheckDr["SsdiStatus"] = "<b style=\"color: red;\" >Not Found</b>";
                                            patientToCheckDr["SsdiDeathDateText"] = String.Empty;
                                            patientToCheckDr["UpdatePatientStatus"] = false;
                                        }
                                        else
                                        {
                                            patientToCheckDr["SsdiStatus"] = "<b style=\"color: red;\" >Not Checked</b>";
                                            patientToCheckDr["SsdiDeathDateText"] = String.Empty;
                                            patientToCheckDr["UpdatePatientStatus"] = false;
                                        }
                                    }

                                }

                                // add patient to checked datatable
                                patientsCheckedDt.ImportRow(patientToCheckDr);
                            }
                        }
                    }
                    // update checked patients display results

                    if (String.IsNullOrEmpty(errorFlagMsg))
                    {
                        recordcount = checkCount.ToString(); 
                        VitalsMsg.Text = "Patients Checked.  " + matchCount + " Patients Matched";
                    }
                    else
                    {
                        recordcount = String.Empty;
                        VitalsMsg.Text = matchCount + " Patients Matched";
                    }
                    //VitalPatients.DataSource = patientToCheckDs.Tables[0].DefaultView;
                    VitalPatients.DataSource = patientsCheckedDt.DefaultView;
                    VitalPatients.DataBind();
                }
            }
        }



        /// <summary>
        /// 
        /// </summary>
        /// <param name=Patient.PatientId></param>
        /// <returns></returns>
        private DataSet CheckPatientSSDIStatus(int patientId)
        {
            if (ssdmfNode != null)
            {
                string UserName = ssdmfNode.SelectSingleNode("user") != null ? ssdmfNode.SelectSingleNode("user").InnerText : string.Empty;
                string Password = ssdmfNode.SelectSingleNode("pword") != null ? ssdmfNode.SelectSingleNode("pword").InnerText : string.Empty;
                string maxQueries = ssdmfNode.SelectSingleNode("maxQueries") != null ? ssdmfNode.SelectSingleNode("maxQueries").InnerText : string.Empty;
                string expirationDate = ssdmfNode.SelectSingleNode("expirationDate") != null ? ssdmfNode.SelectSingleNode("expirationDate").InnerText : string.Empty;

                bool searchPtSSN = false;
                bool searchPtLastName = false;
                bool searchPtFirstName = false;
                bool searchPtDOB = false;
                bool searchPtMiddleName = false;
                bool searchPtDOD = false;
                bool searchPtZipLastRes = false;

                XmlNodeList ssdmfServiceInputsNode = ssdmfNode.SelectSingleNode("serviceInputs") != null ? ssdmfNode.SelectSingleNode("serviceInputs").ChildNodes : null;

                foreach (XmlNode currNode in ssdmfServiceInputsNode)
                {
                    searchPtSSN = currNode.Name.ToUpper() == "PtSSN".ToUpper() ? (currNode.InnerText == "true" ? true : false) : searchPtSSN;
                    searchPtLastName = currNode.Name.ToUpper() == Patient.PtLastName.ToUpper() ? (currNode.InnerText == "true" ? true : false) : searchPtLastName;
                    searchPtFirstName = currNode.Name.ToUpper() == Patient.PtFirstName.ToUpper() ? (currNode.InnerText == "true" ? true : false) : searchPtFirstName;
                    searchPtDOB = currNode.Name.ToUpper() == "ptDOB".ToUpper() ? (currNode.InnerText == "true" ? true : false) : searchPtDOB;
                    searchPtMiddleName = currNode.Name.ToUpper() == Patient.PtMiddleName.ToUpper() ? (currNode.InnerText == "true" ? true : false) : searchPtMiddleName;
                    searchPtDOD = currNode.Name.ToUpper() == "ptDOD".ToUpper() ? (currNode.InnerText == "true" ? true : false) : searchPtDOD;
                    searchPtZipLastRes = currNode.Name.ToUpper() == "ptZipLastRes".ToUpper() ? (currNode.InnerText == "true" ? true : false) : searchPtZipLastRes;
                }
                // validate params
                if (!string.IsNullOrEmpty(UserName) && !string.IsNullOrEmpty(Password))
                {
                    // Patient params
                    Patient biz = new Patient();
                    biz.Get(patientId);
                    PatientController ct = new PatientController();

                    string SSN = searchPtSSN ? ct.GetPatientIdentifier(patientId, "SSN") : String.Empty;
                    string FName = searchPtLastName ? biz[Patient.PtFirstName].ToString() : String.Empty;   
                    string LName = searchPtFirstName ? biz[Patient.PtLastName].ToString() : String.Empty;  
                    string ZipCode = searchPtZipLastRes ? biz[Patient.PtPostalCode].ToString() : String.Empty;
                    string ZipLumpSum = "";
                    string DOD = String.Empty;
                    if (!string.IsNullOrEmpty(biz[Patient.PtDeathDate].ToString()))
                    {
                        DOD = searchPtDOD ? ConvertToSSDIDate(((DateTime)biz[Patient.PtDeathDate]).ToShortDateString()) : String.Empty;
                    }
                    string DOB = String.Empty;
                    if (!string.IsNullOrEmpty(biz[Patient.PtBirthDate].ToString()))
                    {
                        DOB = searchPtDOB ? ConvertToSSDIDate(((DateTime)biz[Patient.PtBirthDate]).ToShortDateString()) : String.Empty;
                    }
                    string State = String.Empty;// biz[Patient.PtState].ToString();

                    // limit rows
                    string MaxRows = !String.IsNullOrEmpty(maxQueries) ? maxQueries : (100).ToString();

                    // try to invoke service
                    try
                    {
                        Caisis.Services.Clients.SSDMF.Service1 client = new Caisis.Services.Clients.SSDMF.Service1();
                        DataSet ds = client.GetQuery(UserName, Password, SSN, FName, LName, ZipCode, ZipLumpSum, DOD, DOB, State, MaxRows);                       
                         //DataSet ds = new DataSet(); // FOR TESTING, DELETE WHEN DONE
                        return ds;
                    }
                    catch (Exception ex)
                    {
                        // publish raw error
                        ExceptionHandler.Publish(ex, "SSDMF service error");
                        // throw client error
                        throw new ClientException("Service not operational");
                    }
                }
                else
                {
                    throw new ClientException("No specified credentials. Check xml configuration.");
                }
            }
            else
            {
                throw new ClientException("Check xml configuration.");
            }
        }

        private void LoadSSDIQueryResults(DataSet ssdiResultsDs, Boolean show, string errorMsgs)
        {
            ResultsGrid.Visible = show;

            if (show)
            {

                if (ssdiResultsDs.Tables.Count > 0)
                {
                        SSDIResultsNoResultsDiv.Style["display"] = "none";
                        SSDIResultsLinkDiv.Style["display"] = "";

                        ResultsGrid.DataSource = ssdiResultsDs;
                        ResultsGrid.DataBind();
                }
                else
                {
                    SSDIResultsNoResultsDiv.Style["display"] = "";
                    SSDIResultsLinkDiv.Style["display"] = "none";
                    SSDINoResutlsMsg.Text = "No results returned from service.";
                }
            }
            else
            {
                if (!String.IsNullOrEmpty(errorMsgs))
                {
                    SSDIResultsNoResultsDiv.Style["display"] = "";
                    SSDIResultsLinkDiv.Style["display"] = "none";
                    SSDINoResutlsMsg.Text = "<b style=\"color:red;\">"+errorMsgs+"</b>";
                }
            }
        }

        #endregion

        #region UPDATE PATIENTS FUNCTIONS

        protected void UpdateSelectedPatientClick(object sender, EventArgs e)
        {
            try
            {
                // get patients selected to be update
                DataSet patientToUpdateDs = GetPatientsToUpdate();

                // if patients were selected
                if (patientToUpdateDs.Tables.Count > 0 && patientToUpdateDs.Tables[0].Rows.Count > 0)
                {
                    foreach (DataRow patientToUpdateDr in patientToUpdateDs.Tables[0].Rows)
                    {
                        bool success = false;
                        Patient currentPt = new Patient();
                        currentPt.Get(Int32.Parse(patientToUpdateDr[Patient.PatientId].ToString()));

                        //string deathDateText = ConvertSSDIDateToStandardFormat(patientToUpdateDr["SsdiDeathDateText"].ToString());
                        string deathDateText = patientToUpdateDr["SsdiDeathDateText"].ToString();

                        // convert standard date to fuzzy date, if needed
                        DateTime deathDate = new DateTime();
                        if (!DateTime.TryParse(deathDateText, out deathDate))
                        {
                            deathDate = ConvertToFuzzyDate(deathDateText);
                        }


                        // update death date for patient
                        if (!String.IsNullOrEmpty(deathDateText) && deathDate != null)
                        {
                            success = true;
                            patientToUpdateDr[Patient.PtDeathDateText] = deathDateText;
                            currentPt[Patient.PtDeathDateText] = deathDateText;
                            currentPt[Patient.PtDeathDate] = deathDate;
                        }

                        if (success)
                        {
                            patientToUpdateDr["FinalStatus"] = "<b style=\"color: green;\" >Updated</b>";
                            currentPt.Save();          
                  
                            // retrieve the updated patient contact status (should have been triggered when action item saved)
                            currentPt.Get(Int32.Parse(patientToUpdateDr[Patient.PatientId].ToString()));
                            patientToUpdateDr[Patient.PtContactStatus] = currentPt[Patient.PtContactStatus].ToString();
                       }
                        else
                        {
                            patientToUpdateDr["FinalStatus"] = "<b style=\"color: red;\" >Not Updated<br/>Error Saving Death Date</b>";
                        }
                    }

                    // display updated patients
                    LoadPatientsUpdated(patientToUpdateDs);
                }
            }
            catch (ClientException ex)
            {
                VitalErrors.Text = ex.Message;
            }
        }

        private void LoadPatientsUpdated(DataSet patientsUpdated)
        {
            try
            {
                SetButtons(VitalState.StateUpdate);
                SetVitalState = VitalState.StateUpdate;

                DataSet patientsUpdatedDs = new DataSet();

                this.EnableViewState = false;

                // retrieve patients updated
                if (patientsUpdated != null)
                {
                    patientsUpdatedDs = patientsUpdated.Copy();
                }
                else
                    patientsUpdatedDs = GetPatientsToUpdate();

                if (patientsUpdatedDs.Tables.Count > 0 && patientsUpdatedDs.Tables[0].Rows.Count > 0)
                {
                    VitalPatients.DataSource = patientsUpdatedDs.Tables[0].DefaultView;
                    VitalPatients.DataBind();

                    recordcount = patientsUpdatedDs.Tables[0].Rows.Count.ToString();
                }
                else
                {
                    recordcount = "0";
                }
                VitalsMsg.Text = "Patient(s) Updated";
                VitalErrors.Text = "";

            }
            catch (ClientException ex)
            {
                VitalErrors.Text = ex.Message;
            }
        }

        private DataSet GetPatientsToUpdate()
        {
            DataSet patientsToUpdateDs = new DataSet();

            DataTable patientsToUpdateDt = GetVitalTableTemplate();

            foreach (RepeaterItem rItem in VitalPatients.Items)
            {
                if (rItem.ItemType == ListItemType.Item || rItem.ItemType == ListItemType.AlternatingItem)
                {
                    CheckBox UpdatePatientStatusCB = (CheckBox)rItem.FindControl("UpdatePatientStatusCB");
                    if (UpdatePatientStatusCB.Checked)
                    {
                        CheckBox RunSSDICheckCB = (CheckBox)rItem.FindControl("RunSSDICheckCB");
                        Literal SsdiStatus = (Literal)rItem.FindControl("SsdiStatus");
                        Literal SsdiDeathDateText = (Literal)rItem.FindControl("SsdiDeathDateText");
                        Literal UpdatePatientStatus = (Literal)rItem.FindControl("UpdatePatientStatus");
                        Literal FinalStatus = (Literal)rItem.FindControl("FinalStatus");
                        Literal PatientId = (Literal)rItem.FindControl(Patient.PatientId);
                        Literal ptMrn = (Literal)rItem.FindControl(Patient.PtMRN);
                        Literal ptFirstName = (Literal)rItem.FindControl(Patient.PtFirstName);
                        Literal ptLastName = (Literal)rItem.FindControl(Patient.PtLastName);
                        Literal PtSSN = (Literal)rItem.FindControl("PtSSN");
                        Literal ptBirthDateText = (Literal)rItem.FindControl(Patient.PtBirthDateText);
                        Literal ptDeathDateText = (Literal)rItem.FindControl(Patient.PtDeathDateText);
                        Literal ptContactStatus = (Literal)rItem.FindControl(Patient.PtContactStatus);

                        DataRow dr = patientsToUpdateDt.NewRow();
                        dr["RunSSDICheckCB"] = RunSSDICheckCB.Checked;
                        dr["SsdiStatus"] = SsdiStatus.Text;
                        dr["SsdiDeathDateText"] = SsdiDeathDateText.Text;
                        dr["UpdatePatientStatusCB"] = UpdatePatientStatusCB.Checked;
                        dr["UpdatePatientStatus"] = !string.IsNullOrEmpty(UpdatePatientStatus.Text) ? (UpdatePatientStatus.Text == "1" || UpdatePatientStatus.Text.ToLower() == "true" ? true : false) : false;
                        dr["FinalStatus"] = String.Empty;
                        dr[Patient.PatientId] = int.Parse(PatientId.Text);
                        dr[Patient.PtMRN] = ptMrn.Text;
                        dr[Patient.PtFirstName] = ptFirstName.Text;
                        dr[Patient.PtLastName] = ptLastName.Text;
                        dr["PtSSN"] = PtSSN.Text;
                        dr[Patient.PtBirthDateText] = ptBirthDateText.Text;
                        dr[Patient.PtDeathDateText] = ptDeathDateText.Text;
                        dr[Patient.PtContactStatus] = ptContactStatus.Text;
                        patientsToUpdateDt.Rows.Add(dr);
                    }
                }
            }

            patientsToUpdateDs.Tables.Add(patientsToUpdateDt);
            return patientsToUpdateDs;
        }

        private DataSet GetPatientsUpdated()
        {
            DataSet patientsUpdatedDs = new DataSet();
            DataTable patientsUpdatedDt = GetVitalTableTemplate();

            foreach (RepeaterItem rItem in VitalPatients.Items)
            {
                if (rItem.ItemType == ListItemType.Item || rItem.ItemType == ListItemType.AlternatingItem)
                {
                    CheckBox UpdatePatientStatusCB = (CheckBox)rItem.FindControl("UpdatePatientStatusCB");
                    if (UpdatePatientStatusCB.Checked)
                    {
                        CheckBox RunSSDICheckCB = (CheckBox)rItem.FindControl("RunSSDICheckCB");
                        Literal SsdiStatus = (Literal)rItem.FindControl("SsdiStatus");
                        Literal SsdiDeathDateText = (Literal)rItem.FindControl("SsdiDeathDateText");
                        Literal UpdatePatientStatus = (Literal)rItem.FindControl("UpdatePatientStatus");
                        Literal FinalStatus = (Literal)rItem.FindControl("FinalStatus");
                        Literal PatientId = (Literal)rItem.FindControl(Patient.PatientId);
                        Literal ptMrn = (Literal)rItem.FindControl(Patient.PtMRN);
                        Literal ptFirstName = (Literal)rItem.FindControl(Patient.PtFirstName);
                        Literal ptLastName = (Literal)rItem.FindControl(Patient.PtLastName);
                        Literal PtSSN = (Literal)rItem.FindControl("PtSSN");
                        Literal ptBirthDateText = (Literal)rItem.FindControl(Patient.PtBirthDateText);
                        Literal ptDeathDateText = (Literal)rItem.FindControl(Patient.PtDeathDateText);
                        Literal ptContactStatus = (Literal)rItem.FindControl(Patient.PtContactStatus);

                        DataRow dr = patientsUpdatedDt.NewRow();
                        dr["RunSSDICheckCB"] = RunSSDICheckCB.Checked;
                        dr["SsdiStatus"] = SsdiStatus.Text;
                        dr["SsdiDeathDateText"] = SsdiDeathDateText.Text;
                        dr["UpdatePatientStatusCB"] = true;
                        dr["UpdatePatientStatus"] = UpdatePatientStatus.Text;
                        dr["FinalStatus"] = "<b style=\"color: green;\" >Updated</b>";
                        dr[Patient.PatientId] = int.Parse(PatientId.Text);
                        dr[Patient.PtMRN] = ptMrn.Text;
                        dr[Patient.PtFirstName] = ptFirstName.Text;
                        dr[Patient.PtLastName] = ptLastName.Text;
                        dr["PtSSN"] = PtSSN.Text;
                        dr[Patient.PtBirthDateText] = ptBirthDateText.Text;
                        dr[Patient.PtDeathDateText] = ptDeathDateText.Text;
                        dr[Patient.PtContactStatus] = ptContactStatus.Text;

                        patientsUpdatedDt.Rows.Add(dr);
                    }
                }
            }
            patientsUpdatedDs.Tables.Add(patientsUpdatedDt);
            return patientsUpdatedDs;
        }

        #endregion

        #region REPEATER FUNCTIONS

        protected void CheckVitalStatusRepeater(Object Sender, RepeaterItemEventArgs e)
        {

            if (GetVitalState == VitalState.StateDue)
            {
                ConfigureStateDueRepeater(Sender, e);
            }
            else if (GetVitalState == VitalState.StateCheck)
            {
                ConfigureStateCheckRepeater(Sender, e);
            }
            else if (GetVitalState == VitalState.StateUpdate)
            {
                ConfigureStateUpdateRepeater(Sender, e);
            }
        }

        private void ConfigureStateDueRepeater(Object Sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Header)
            {
                HtmlTableCell RunSSDICheckCBTitleCell = (HtmlTableCell)e.Item.FindControl("RunSSDICheckCBTitleCell");
                HtmlTableCell SsdiStatusTitleCell = (HtmlTableCell)e.Item.FindControl("SsdiStatusTitleCell");
                HtmlTableCell UpdatePatientStatusCBTitleCell = (HtmlTableCell)e.Item.FindControl("UpdatePatientStatusCBTitleCell");
                HtmlTableCell FinalStatusTitleCell = (HtmlTableCell)e.Item.FindControl("FinalStatusTitleCell");

                HtmlImage RunSSDICheckAll = (HtmlImage)e.Item.FindControl("RunSSDICheckAll");

                RunSSDICheckCBTitleCell.Style["display"] = "";
                SsdiStatusTitleCell.Style["display"] = "none";
                UpdatePatientStatusCBTitleCell.Style["display"] = "none";
                FinalStatusTitleCell.Style["display"] = "none";

                RunSSDICheckAll.Attributes.Add("onclick", "checkAllWidgetsInColumn('VitalSignsHTMLTable', 0, 10); EnableButton(" + RunSSDICheckAll.ClientID + "," + CheckStatusBtn.ClientID + ",'RunSSDICheckCB'" + ");");
            }

            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {

                HtmlTableCell RunSSDICheckCBValueCell = (HtmlTableCell)e.Item.FindControl("RunSSDICheckCBValueCell");
                HtmlTableCell SsdiStatusValueCell = (HtmlTableCell)e.Item.FindControl("SsdiStatusValueCell");
                HtmlTableCell UpdatePatientStatusCBValueCell = (HtmlTableCell)e.Item.FindControl("UpdatePatientStatusCBValueCell");
                HtmlTableCell FinalStatusValueCell = (HtmlTableCell)e.Item.FindControl("FinalStatusValueCell");

                RunSSDICheckCBValueCell.Style["display"] = "";
                SsdiStatusValueCell.Style["display"] = "none";
                UpdatePatientStatusCBValueCell.Style["display"] = "none";
                FinalStatusValueCell.Style["display"] = "none";

                CheckBox RunSSDICheckCB = (CheckBox)e.Item.FindControl("RunSSDICheckCB");
                Literal PatientId = (Literal)e.Item.FindControl(Patient.PatientId);
                Literal ptMrn = (Literal)e.Item.FindControl(Patient.PtMRN);
                Literal ptFirstName = (Literal)e.Item.FindControl(Patient.PtFirstName);
                Literal ptLastName = (Literal)e.Item.FindControl(Patient.PtLastName);
                Literal PtSSN = (Literal)e.Item.FindControl("PtSSN");
                Literal ptBirthDateText = (Literal)e.Item.FindControl(Patient.PtBirthDateText);
                Literal ptDeathDateText = (Literal)e.Item.FindControl(Patient.PtDeathDateText);
                Literal ptContactStatus = (Literal)e.Item.FindControl(Patient.PtContactStatus);


                if (RunSSDICheckCB != null)
                {
                    RunSSDICheckCB.Attributes.Add("onclick", "EnableButton(" + RunSSDICheckCB.ClientID + "," + CheckStatusBtn.ClientID + ",'RunSSDICheckCB'" + ");");
                }

                if (((DataRowView)e.Item.DataItem)[Patient.PatientId].ToString().Length > 0)
                {
                    PatientId.Text = ((DataRowView)e.Item.DataItem)[Patient.PatientId].ToString();
                }
                if (((DataRowView)e.Item.DataItem)[Patient.PtMRN].ToString().Length > 0)
                {
                    ptMrn.Text = ((DataRowView)e.Item.DataItem)[Patient.PtMRN].ToString();
                }
                if (((DataRowView)e.Item.DataItem)[Patient.PtFirstName].ToString().Length > 0)
                {
                    ptFirstName.Text = ((DataRowView)e.Item.DataItem)[Patient.PtFirstName].ToString();
                }
                if (((DataRowView)e.Item.DataItem)[Patient.PtLastName].ToString().Length > 0)
                {
                    ptLastName.Text = ((DataRowView)e.Item.DataItem)[Patient.PtLastName].ToString();
                }
                if (((DataRowView)e.Item.DataItem)["PtSSN"].ToString().Length > 0)
                {
                    PtSSN.Text = ((DataRowView)e.Item.DataItem)["PtSSN"].ToString();
                }
                else
                {
                    //PtSSN.Text = "<b style=\"color: red;\" >Not specified</b>";
                    // if patient has no SSN, should not be able to run check on; disable checkbox
                    RunSSDICheckCB.Enabled = false;
                }

                if (((DataRowView)e.Item.DataItem)[Patient.PtBirthDateText].ToString().Length > 0)
                {
                    ptBirthDateText.Text = ((DataRowView)e.Item.DataItem)[Patient.PtBirthDateText].ToString();
                }
                if (((DataRowView)e.Item.DataItem)[Patient.PtDeathDateText].ToString().Length > 0)
                {
                    ptDeathDateText.Text = ((DataRowView)e.Item.DataItem)[Patient.PtDeathDateText].ToString();
                }
                if (((DataRowView)e.Item.DataItem)[Patient.PtContactStatus].ToString().Length > 0)
                {
                    ptContactStatus.Text = ((DataRowView)e.Item.DataItem)[Patient.PtContactStatus].ToString();
                }
            }
        }

        private void ConfigureStateCheckRepeater(Object Sender, RepeaterItemEventArgs e)
        {
          
            if (e.Item.ItemType == ListItemType.Header)
            {
                HtmlTableCell RunSSDICheckCBTitleCell = (HtmlTableCell)e.Item.FindControl("RunSSDICheckCBTitleCell");
                HtmlTableCell SsdiStatusTitleCell = (HtmlTableCell)e.Item.FindControl("SsdiStatusTitleCell");
                HtmlTableCell UpdatePatientStatusCBTitleCell = (HtmlTableCell)e.Item.FindControl("UpdatePatientStatusCBTitleCell");
                HtmlTableCell FinalStatusTitleCell = (HtmlTableCell)e.Item.FindControl("FinalStatusTitleCell");

                HtmlImage UpdatePatientStatusCheckAll = (HtmlImage)e.Item.FindControl("UpdatePatientStatusCheckAll");

                RunSSDICheckCBTitleCell.Style["display"] = "none";
                SsdiStatusTitleCell.Style["display"] = "";
                UpdatePatientStatusCBTitleCell.Style["display"] = "";
                FinalStatusTitleCell.Style["display"] = "none";

                UpdatePatientStatusCheckAll.Attributes.Add("onclick", "checkAllWidgetsInColumn('VitalSignsHTMLTable', 2, 10); EnableButton(" + UpdatePatientStatusCheckAll.ClientID + "," + UpdateSelectedPatient.ClientID + ",'UpdatePatientStatusCB'" + ");");
            }

            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {

                HtmlTableRow PatientRow = (HtmlTableRow)e.Item.FindControl("PatientRow");
                HtmlTableCell RunSSDICheckCBValueCell = (HtmlTableCell)e.Item.FindControl("RunSSDICheckCBValueCell");
                HtmlTableCell SsdiStatusValueCell = (HtmlTableCell)e.Item.FindControl("SsdiStatusValueCell");
                HtmlTableCell UpdatePatientStatusCBValueCell = (HtmlTableCell)e.Item.FindControl("UpdatePatientStatusCBValueCell");
                HtmlTableCell FinalStatusValueCell = (HtmlTableCell)e.Item.FindControl("FinalStatusValueCell");
                HtmlTableCell ptDeathDateTextValueCell = (HtmlTableCell)e.Item.FindControl("ptDeathDateTextValueCell");

                RunSSDICheckCBValueCell.Style["display"] = "none";
                SsdiStatusValueCell.Style["display"] = "";
                UpdatePatientStatusCBValueCell.Style["display"] = "";
                FinalStatusValueCell.Style["display"] = "none";

                Literal SsdiStatus = (Literal)e.Item.FindControl("SsdiStatus");
                Literal SsdiDeathDateText = (Literal)e.Item.FindControl("SsdiDeathDateText");
                CheckBox RunSSDICheckCB = (CheckBox)e.Item.FindControl("RunSSDICheckCB");
                CheckBox UpdatePatientStatusCB = (CheckBox)e.Item.FindControl("UpdatePatientStatusCB");
                Literal PatientId = (Literal)e.Item.FindControl(Patient.PatientId);
                Literal ptMrn = (Literal)e.Item.FindControl(Patient.PtMRN);
                Literal ptFirstName = (Literal)e.Item.FindControl(Patient.PtFirstName);
                Literal ptLastName = (Literal)e.Item.FindControl(Patient.PtLastName);
                Literal PtSSN = (Literal)e.Item.FindControl("PtSSN");
                Literal ptBirthDateText = (Literal)e.Item.FindControl(Patient.PtBirthDateText);
                Literal ptContactStatus = (Literal)e.Item.FindControl(Patient.PtContactStatus);

                if (UpdatePatientStatusCB != null)
                {
                    UpdatePatientStatusCB.Attributes.Add("onclick", "EnableButton(" + UpdatePatientStatusCB.ClientID + "," + UpdateSelectedPatient.ClientID + ",'UpdatePatientStatusCB'" + ");");
                }

                if (RunSSDICheckCB != null && ((DataRowView)e.Item.DataItem)["RunSSDICheckCB"].ToString().Length > 0)
                {
                    string runSsdiCheck = ((DataRowView)e.Item.DataItem)["RunSSDICheckCB"].ToString();
                    RunSSDICheckCB.Checked = !string.IsNullOrEmpty(runSsdiCheck) ? (runSsdiCheck == "1" || runSsdiCheck.ToLower() == "true" ? true : false) : false;
                    _showPatientRow = RunSSDICheckCB.Checked;

                    if (RunSSDICheckCB.Checked)
                    {
                        PatientRow.Style["display"] = "";
                    }
                    else
                    {
                        PatientRow.Style["display"] = "none";
                    }
                }
                else
                {
                    PatientRow.Style["display"] = "none";
                }

                if (((DataRowView)e.Item.DataItem)["SsdiStatus"].ToString().Length > 0)
                {
                    SsdiStatus.Text = ((DataRowView)e.Item.DataItem)["SsdiStatus"].ToString();
                }
                if (((DataRowView)e.Item.DataItem)["UpdatePatientStatus"].ToString().Length > 0)
                {

                    if (SsdiStatus.Text.ToUpper().Contains("NOT FOUND") || SsdiStatus.Text.ToUpper().Contains("INVALID") || SsdiStatus.Text.ToUpper().Contains("MULTIPLE") || SsdiStatus.Text.ToUpper().Contains("NOT CHECKED"))
                    {
                        UpdatePatientStatusCB.Enabled = false;
                        UpdatePatientStatusCB.Checked = false;
                    }
                    else
                    {
                        string updatePatient = ((DataRowView)e.Item.DataItem)["UpdatePatientStatus"].ToString();
                        UpdatePatientStatusCB.Checked = !string.IsNullOrEmpty(updatePatient) ? (updatePatient == "1" || updatePatient.ToLower() == "true" ? true : false) : false;
                        if (UpdatePatientStatusCB.Checked)
                            UpdateSelectedPatient.Enabled = true;
                    }
                }
                if (((DataRowView)e.Item.DataItem)["SsdiDeathDateText"].ToString().Length > 0)
                {
                    ptDeathDateTextValueCell.Style.Add(HtmlTextWriterStyle.Color, "green");
                    ptDeathDateTextValueCell.Style.Add(HtmlTextWriterStyle.FontWeight, "bold");
                }

                if (((DataRowView)e.Item.DataItem)[Patient.PatientId].ToString().Length > 0)
                {
                    PatientId.Text = ((DataRowView)e.Item.DataItem)[Patient.PatientId].ToString();
                }
                if (((DataRowView)e.Item.DataItem)[Patient.PtMRN].ToString().Length > 0)
                {
                    ptMrn.Text = ((DataRowView)e.Item.DataItem)[Patient.PtMRN].ToString();
                }
                if (((DataRowView)e.Item.DataItem)[Patient.PtFirstName].ToString().Length > 0)
                {
                    ptFirstName.Text = ((DataRowView)e.Item.DataItem)[Patient.PtFirstName].ToString();
                }
                if (((DataRowView)e.Item.DataItem)[Patient.PtLastName].ToString().Length > 0)
                {
                    ptLastName.Text = ((DataRowView)e.Item.DataItem)[Patient.PtLastName].ToString();
                }
                if (((DataRowView)e.Item.DataItem)["PtSSN"].ToString().Length > 0)
                {
                    PtSSN.Text = ((DataRowView)e.Item.DataItem)["PtSSN"].ToString();

                    // if patient has no SSN, should not be able to run check on; disable checkbox
                    if (String.IsNullOrEmpty(PtSSN.Text))
                    {
                        UpdateSelectedPatient.Enabled = false;
                        UpdatePatientStatusCB.Checked = false;
                    }
                }
                if (((DataRowView)e.Item.DataItem)[Patient.PtBirthDateText].ToString().Length > 0)
                {
                    ptBirthDateText.Text = ((DataRowView)e.Item.DataItem)[Patient.PtBirthDateText].ToString();
                }
                if (((DataRowView)e.Item.DataItem)[Patient.PtContactStatus].ToString().Length > 0)
                {
                    ptContactStatus.Text = ((DataRowView)e.Item.DataItem)[Patient.PtContactStatus].ToString();
                }
            }

            if (e.Item.ItemType == ListItemType.Separator)
            {
                HtmlTableRow PatientSeperatorRow = (HtmlTableRow)e.Item.FindControl("PatientSeperatorRow");

                if (_showPatientRow)
                {
                    PatientSeperatorRow.Style["display"] = "";
                }
                else
                {
                    PatientSeperatorRow.Style["display"] = "none";
                }
            }

        }

        private void ConfigureStateUpdateRepeater(Object Sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Header)
            {
                HtmlTableCell RunSSDICheckCBTitleCell = (HtmlTableCell)e.Item.FindControl("RunSSDICheckCBTitleCell");
                HtmlTableCell SsdiStatusTitleCell = (HtmlTableCell)e.Item.FindControl("SsdiStatusTitleCell");
                HtmlTableCell UpdatePatientStatusCBTitleCell = (HtmlTableCell)e.Item.FindControl("UpdatePatientStatusCBTitleCell");
                HtmlTableCell FinalStatusTitleCell = (HtmlTableCell)e.Item.FindControl("FinalStatusTitleCell");

                HtmlImage UpdatePatientStatusCheckAll = (HtmlImage)e.Item.FindControl("UpdatePatientStatusCheckAll");

                RunSSDICheckCBTitleCell.Style["display"] = "none";
                SsdiStatusTitleCell.Style["display"] = "none";
                UpdatePatientStatusCBTitleCell.Style["display"] = "none";
                FinalStatusTitleCell.Style["display"] = "";

                //UpdatePatientStatusCheckAll.Attributes.Add("onclick", "checkAllWidgetsInColumn('VitalSignsHTMLTable', 2, 9); EnableButton(" + UpdatePatientStatusCheckAll.ClientID + "," + UpdateSelectedPatient.ClientID + ",'UpdatePatientStatusCB'" + ");");
            }

            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {

                HtmlTableCell RunSSDICheckCBValueCell = (HtmlTableCell)e.Item.FindControl("RunSSDICheckCBValueCell");
                HtmlTableCell SsdiStatusValueCell = (HtmlTableCell)e.Item.FindControl("SsdiStatusValueCell");
                HtmlTableCell UpdatePatientStatusCBValueCell = (HtmlTableCell)e.Item.FindControl("UpdatePatientStatusCBValueCell");
                HtmlTableCell FinalStatusValueCell = (HtmlTableCell)e.Item.FindControl("FinalStatusValueCell");
                HtmlTableCell ptDeathDateTextValueCell = (HtmlTableCell)e.Item.FindControl("ptDeathDateTextValueCell");

                RunSSDICheckCBValueCell.Style["display"] = "none";
                SsdiStatusValueCell.Style["display"] = "none";
                UpdatePatientStatusCBValueCell.Style["display"] = "none";
                FinalStatusValueCell.Style["display"] = "";

                HtmlTableRow PatientRow = (HtmlTableRow)e.Item.FindControl("PatientRow");
                Literal FinalStatus = (Literal)e.Item.FindControl("FinalStatus");
                //Literal SsdiStatus = (Literal)e.Item.FindControl("SsdiStatus");
                Literal SsdiDeathDateText = (Literal)e.Item.FindControl("SsdiDeathDateText");
                //CheckBox UpdatePatientStatusCB = (CheckBox)e.Item.FindControl("UpdatePatientStatusCB");
                Literal PatientId = (Literal)e.Item.FindControl(Patient.PatientId);
                Literal ptMrn = (Literal)e.Item.FindControl(Patient.PtMRN);
                Literal ptFirstName = (Literal)e.Item.FindControl(Patient.PtFirstName);
                Literal ptLastName = (Literal)e.Item.FindControl(Patient.PtLastName);
                Literal PtSSN = (Literal)e.Item.FindControl("PtSSN");
                Literal ptBirthDateText = (Literal)e.Item.FindControl(Patient.PtBirthDateText);
                Literal ptDeathDateText = (Literal)e.Item.FindControl(Patient.PtDeathDateText);
                Literal ptContactStatus = (Literal)e.Item.FindControl(Patient.PtContactStatus);


                //if (UpdatePatientStatusCB != null)
                //{
                //    UpdatePatientStatusCB.Attributes.Add("onclick", "EnableButton(" + UpdatePatientStatusCB.ClientID + "," + UpdateSelectedPatient.ClientID + ",'UpdatePatientStatusCB'" + ");");
                //}


                if (((DataRowView)e.Item.DataItem)["FinalStatus"].ToString().Length > 0)
                {
                    FinalStatus.Text = ((DataRowView)e.Item.DataItem)["FinalStatus"].ToString();
                }
                //if (((DataRowView)e.Item.DataItem)["UpdatePatientStatus"].ToString().Length > 0)
                //{

                //    if (SsdiStatus.Text.ToUpper().Contains("NOT FOUND") || SsdiStatus.Text.ToUpper().Contains("INVALID") || SsdiStatus.Text.ToUpper().Contains("MULTIPLE"))
                //    {
                //        UpdatePatientStatusCB.Enabled = false;
                //    }
                //    else
                //    {
                //        string updatePatient = ((DataRowView)e.Item.DataItem)["UpdatePatientStatus"].ToString();
                //        UpdatePatientStatusCB.Checked = !string.IsNullOrEmpty(updatePatient) ? (updatePatient == "1" || updatePatient.ToLower() == "true" ? true : false) : false;
                //        if (UpdatePatientStatusCB.Checked)
                //            UpdateSelectedPatient.Enabled = true;
                //    }
                //}
                //if (((DataRowView)e.Item.DataItem)["SsdiDeathDateText"].ToString().Length > 0)
                //{
                //    SsdiDeathDateText.Text = ((DataRowView)e.Item.DataItem)["SsdiDeathDateText"].ToString();
                //}

                if (((DataRowView)e.Item.DataItem)[Patient.PatientId].ToString().Length > 0)
                {
                    PatientId.Text = ((DataRowView)e.Item.DataItem)[Patient.PatientId].ToString();
                }
                if (((DataRowView)e.Item.DataItem)[Patient.PtMRN].ToString().Length > 0)
                {
                    ptMrn.Text = ((DataRowView)e.Item.DataItem)[Patient.PtMRN].ToString();
                }
                if (((DataRowView)e.Item.DataItem)[Patient.PtFirstName].ToString().Length > 0)
                {
                    ptFirstName.Text = ((DataRowView)e.Item.DataItem)[Patient.PtFirstName].ToString();
                }
                if (((DataRowView)e.Item.DataItem)[Patient.PtLastName].ToString().Length > 0)
                {
                    ptLastName.Text = ((DataRowView)e.Item.DataItem)[Patient.PtLastName].ToString();
                }
                if (((DataRowView)e.Item.DataItem)["PtSSN"].ToString().Length > 0)
                {
                    PtSSN.Text = ((DataRowView)e.Item.DataItem)["PtSSN"].ToString();
                }
                if (((DataRowView)e.Item.DataItem)[Patient.PtBirthDateText].ToString().Length > 0)
                {
                    ptBirthDateText.Text = ((DataRowView)e.Item.DataItem)[Patient.PtBirthDateText].ToString();
                }
                if (((DataRowView)e.Item.DataItem)[Patient.PtDeathDateText].ToString().Length > 0)
                {
                    SsdiDeathDateText.Visible = false;
                    ptDeathDateText.Text = ((DataRowView)e.Item.DataItem)[Patient.PtDeathDateText].ToString();
                    ptDeathDateTextValueCell.Style.Add(HtmlTextWriterStyle.Color, "green");
                    ptDeathDateTextValueCell.Style.Add(HtmlTextWriterStyle.FontWeight, "bold");

                }
                if (((DataRowView)e.Item.DataItem)[Patient.PtContactStatus].ToString().Length > 0)
                {
                    ptContactStatus.Text = ((DataRowView)e.Item.DataItem)[Patient.PtContactStatus].ToString();
                }


                if (FinalStatus.Text == "<b style=\"color: green;\" >Updated</b>" && ptContactStatus.Text == "Current" && !String.IsNullOrEmpty(ptDeathDateText.Text))
                {
                    PatientRow.Style["display"] = "";
                    _showPatientRow = true;
                }
                else
                {
                    PatientRow.Style["display"] = "none";
                    _showPatientRow = false;
                }
            }

            if (e.Item.ItemType == ListItemType.Separator)
            {
                HtmlTableRow PatientSeperatorRow = (HtmlTableRow)e.Item.FindControl("PatientSeperatorRow");

                if (_showPatientRow)
                {
                    PatientSeperatorRow.Style["display"] = "";
                }
                else
                {
                    PatientSeperatorRow.Style["display"] = "none";
                }
            }

        }

         #endregion

        #region CLICK EVENTS

        /// <summary>
        /// 
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void CheckPatientSSIDStatusClick(object sender, EventArgs e)
        {
            try
            {
                SSDINoResutlsMsg.Text = "";

                // retrieve patients to run ssdi check on
                DataSet patientToCheckDs = GetPatientsSelectedForSSDICheck();

                // if patients where selected
                if (patientToCheckDs.Tables.Count > 0 && patientToCheckDs.Tables[0].Rows.Count > 0)
                {

                    DataSet ssdiResultsDs = new DataSet();
                    DataTable ssdiResultsDt = GetSSDITableTemplate();
                    int ptErrorsCount = 0;
                    string errorFlagMsgs = String.Empty;

                    // query ssdi service for every selected patient
                    foreach (DataRow ptDr in patientToCheckDs.Tables[0].Rows)
                    {

                        if (ptDr["RunSSDICheckCB"] != null && ptDr["RunSSDICheckCB"].ToString() == "1")
                        {
                            Boolean errorFlag = false;

                            // get patient ssdi status, if any
                            DataSet currentPatientQueryDs = CheckPatientSSDIStatus(int.Parse(ptDr[Patient.PatientId].ToString()));

                            // add any results to the ssdi dataset
                            if (currentPatientQueryDs.Tables.Count > 0 )
                            {

                               // if service returned an error, show message
                                if (currentPatientQueryDs.Tables[0].Columns.Contains("Error"))
                                {
                                    errorFlag = true;
                                    ptErrorsCount++;
                                    errorFlagMsgs = ptErrorsCount + " patient(s) not checked.  Confirm service account is operational.<br/><br/>Service error:  " + currentPatientQueryDs.Tables[0].Rows[0]["Error"].ToString();
                                    ptDr["SsdiStatus"] = "<b style=\"color: red;\" >Not Checked</b>";

                                }
                                // else, decrement available requests, add to ssdi results table
                                else
                                {
                                    DecreaseAvailableSSDMFRequests(1);

                                    foreach (DataRow ssdiDr in currentPatientQueryDs.Tables[0].Rows)
                                    {
                                        ssdiResultsDt.ImportRow(ssdiDr);
                                    }

                                }                                
                            }

                            if (!errorFlag)
                            {
                                // create ActionItem = 'SSDI_Checked' for patients to check
                                ActionDa actionDa = new ActionDa();
                                BOL.Action actionObj = new Caisis.BOL.Action();
                                actionObj[BOL.Action.PatientId] = int.Parse(ptDr[Patient.PatientId].ToString());
                                actionObj[BOL.Action.ActionDateText] = DateTime.Today.ToShortDateString();
                                actionObj[BOL.Action.ActionDate] = DateTime.Today;
                                actionObj[BOL.Action.ActionItem] = "SSDI_Checked";

                                UserController userCt = new UserController();
                                int currentUserId = userCt.GetUserId();
                                UserDa currentUserDa = new UserDa();
                                DataSet currentUserDs = currentUserDa.GetByUserId(userCt.GetUserId());
                                actionObj[BOL.Action.EnteredBy] = (currentUserDs.Tables.Count > 0 && currentUserDs.Tables[0].Rows.Count > 0) ? currentUserDs.Tables[0].Rows[0][BOL.User.UserName].ToString() : "not specified";

                                actionObj[BOL.Action.EnteredTime] = DateTime.Today;

                                actionObj.Save();

                                // set patient contact status to 'Current'
                                Patient ptObj = new Patient();
                                ptObj.Get(Int32.Parse(ptDr[Patient.PatientId].ToString()));
                                if (!ptObj.IsEmpty)
                                {
                                    ptObj[Patient.PtContactStatus] = "Current";
                                    ptObj.Save();
                                }

                            }
                            else
                            {
                                SSDIResultsNoResultsDiv.Style["display"] = "";
                                SSDIResultsLinkDiv.Style["display"] = "none";

                            }
                        }
                    }

                    ssdiResultsDs.Tables.Add(ssdiResultsDt);

                    // show query results returned from ssdi service
                    if (String.IsNullOrEmpty(errorFlagMsgs))
                        LoadSSDIQueryResults(ssdiResultsDs, true, errorFlagMsgs);
                    else
                        LoadSSDIQueryResults(ssdiResultsDs, false, errorFlagMsgs);

                    // display the ssdi results for selected patients, if any
                    LoadPatientCheckedsWithMatchedSSDIData(sender, e, ssdiResultsDs, patientToCheckDs, true, errorFlagMsgs);

                    SetExpirationLabels();
                }
            }
            catch (ClientException ex)
            {
                SSDINoResutlsMsg.Text = SSDINoResutlsMsg.Text + "<br/>" + ex.Message;
            }
        }


        protected void ReturnToPatientsDueClick(object sender, EventArgs e)
        {
            try
            {
                SSDINoResutlsMsg.Text = "No check performed.";
                VitalErrors.Text = String.Empty;
                recordcount = String.Empty;
                VitalsMsg.Text = String.Empty;
             
                LoadPatientsDue();
            }
            catch (ClientException ex)
            {
                VitalErrors.Text = ex.Message;
            }
        }

        #endregion

        #region HELPER FUNCTIONS

        protected void SetExpirationLabels()
        {
            // read total number of service requests in contract and deduct by number run (need to store this somewhere)
            string availableRequests = GetAvailableSSDMFRequests();
            SSDMFRequestsRemaining.Text = !String.IsNullOrEmpty(availableRequests) ? availableRequests : "Unknown";
            SSDMFRequestsRemaining.Style["color"] = !String.IsNullOrEmpty(availableRequests) && availableRequests != "0" ? "Green" : "Red";

            // read expiration date set in web.config
            string expireDate = ssdmfNode.SelectSingleNode("expirationDate") != null ? ssdmfNode.SelectSingleNode("expirationDate").InnerText : string.Empty;
            if (!String.IsNullOrEmpty(expireDate))
            {
                DateTime subExpDate = DateTime.Parse(expireDate);
                System.TimeSpan expirationDate = subExpDate.Subtract(DateTime.Now.Date);
                DaysToSSDIExpiration.Text = expirationDate.Days >= 0 ? expirationDate.Days.ToString() : "0";
                DaysToSSDIExpiration.Style["color"] = expirationDate.Days > 0 ? "Green" : "Red";
           }
        }

        protected String GetAvailableSSDMFRequests()
        {
            string ssdmfRequests = String.Empty;
            AppConfigDa appDa = new AppConfigDa();
            DataSet appDs = appDa.GetConfig(SSDMF_AppConfigType, SSDMF_AppConfigVariable);
            if (appDs.Tables.Count > 0)
            {
                DataView appDv = new DataView(appDs.Tables[0]);
                if (appDv.Count > 0)
                {
                    ssdmfRequests = appDv[0][BOL.AppConfig.ConfigValue].ToString();
                }

            }
            return ssdmfRequests;

        }

        protected void DecreaseAvailableSSDMFRequests(int decrementValue)
        {
            AppConfigDa appDa = new AppConfigDa();
            DataSet appDs = appDa.GetConfig(SSDMF_AppConfigType, SSDMF_AppConfigVariable);
            if (appDs.Tables.Count > 0)
            {
                DataView appDv = new DataView(appDs.Tables[0]);
                if (appDv.Count > 0)
                {
                    int configId = Int32.Parse(appDv[0][BOL.AppConfig.AppConfigId].ToString());
                    int currentAvailableRequests = Int32.Parse(appDv[0][BOL.AppConfig.ConfigValue].ToString());
                    int updatedAvailableRequests = currentAvailableRequests - decrementValue;
                    appDa.UpdateConfigValue(configId, updatedAvailableRequests.ToString());
                }

            }
        }

        private void SetButtons(string mode)
        {
            if (mode == VitalState.StateCheck)
            {
                CheckStatusBtn.Style["display"] = "none";
                ReturnToPatientsDue.Style["display"] = "";
                UpdateSelectedPatient.Style["display"] = "";
            }
            else if (mode == VitalState.StateUpdate)
            {
                CheckStatusBtn.Style["display"] = "none";
                ReturnToPatientsDue.Style["display"] = "";
                UpdateSelectedPatient.Style["display"] = "none";
            }
            else
            {
                CheckStatusBtn.Style["display"] = "";
                ReturnToPatientsDue.Style["display"] = "none";
                UpdateSelectedPatient.Style["display"] = "none";
            }

        }

        private String ConvertSSDIDateToStandardFormat(string ssdiDate)
        {
            // ssdi date format should be mmddyyyy
            // if dd=00, no day was recorded, ignore 
            // if mm=00, no month was recorded, ignore 

            // convert to mm/dd/yyyy
            // or mm/yyyy if dd=00
            // or yyyy if mm=00

            string temp = String.Empty;
            if (ValidSSDIDate(ssdiDate))
            {
                string month = ssdiDate.Substring(0, 2);
                string day = ssdiDate.Substring(2, 2);
                string year = ssdiDate.Substring(4, 4);

                if (month == "00")
                {
                    // keep only year
                    temp = year;
                }
                else
                {
                    if (day == "00")
                    {
                        // keep only month and year
                        temp = month + "/" + year;
                    }
                    else
                    {
                        temp = month + "/" + day + "/" + year;
                    }
                }
            }

            return temp;
        }


        private String ConvertToSSDIDate(string date)
        {
            // ssdi date format should be mmddyyyy
            // remove any '/' from date
            string temp = date;
            return temp.Replace("/", "");
        }

        private Boolean ValidSSDIDate(string ssdiDate)
        {

            // ssdi date format should be mmddyyyy
            if (!String.IsNullOrEmpty(ssdiDate) && ssdiDate.Length == 8)
            {
                string month = ssdiDate.Substring(0, 2);
                string day = ssdiDate.Substring(2, 2);
                string year = ssdiDate.Substring(4, 4);

                int monthNum;
                int dayNum;
                int yearNum;

                if (Int32.TryParse(month, out monthNum))
                {
                    // 00 for month means no data was recorded, only year should be used
                    if (!(monthNum >= 0 && monthNum <= 12))
                        return false;
                }
                else
                    return false;

                if (Int32.TryParse(day, out dayNum))
                {
                    // 00 for day means no data was recorded
                    if (!(dayNum >= 0 && dayNum <= 31))
                        return false;
                }
                else
                    return false;

                if (Int32.TryParse(year, out yearNum))
                {
                    if (yearNum < 1800)
                        return false;
                }
                else
                    return false;

                return true;
            }
            else
                return false;

        }

        private DateTime ConvertToFuzzyDate(string date)
        {
            DateTime convertedDate = new DateTime();

            if (!DateTime.TryParse(date, out convertedDate))
            {
                // string is not valid date, try to create fuzzy date
                // date string should be in one of the following formats:
                // 1.  mm/yyyy
                // 2.  yyyy

                string tempDate = String.Empty;

                if (date.Length == 4)
                {
                    // must be year only.  use 07/01/[yyyy] as full date
                    tempDate = "07/01/" + date;
                    convertedDate = DateTime.Parse(tempDate);
                }
                else if (date.Length == 7)
                {
                    // format is mm/yyyy.  use [mm]/15/[yyyy] as full date
                    tempDate = date.Substring(0, 2) + "/15/" + date.Substring(3, 4);
                    convertedDate = DateTime.Parse(tempDate);
                }
            }

            return convertedDate;
        }

        private DataTable GetVitalTableTemplate()
        {
            DataTable templateDt = new DataTable();
            templateDt.Columns.Add("RunSSDICheckCB", Type.GetType("System.Byte"));
            templateDt.Columns.Add("SsdiStatus", Type.GetType("System.String"));
            templateDt.Columns.Add("SsdiDeathDateText", Type.GetType("System.String"));
            templateDt.Columns.Add("UpdatePatientStatusCB", Type.GetType("System.Byte"));
            templateDt.Columns.Add("UpdatePatientStatus", Type.GetType("System.Byte"));
            templateDt.Columns.Add("FinalStatus", Type.GetType("System.String"));
            templateDt.Columns.Add(Patient.PatientId, Type.GetType("System.Int32"));
            templateDt.Columns.Add(Patient.PtMRN, Type.GetType("System.String"));
            templateDt.Columns.Add("PtSSN", Type.GetType("System.String"));
            templateDt.Columns.Add(Patient.PtFirstName, Type.GetType("System.String"));
            templateDt.Columns.Add(Patient.PtLastName, Type.GetType("System.String"));
            templateDt.Columns.Add(Patient.PtBirthDateText, Type.GetType("System.String"));
            templateDt.Columns.Add(Patient.PtDeathDateText, Type.GetType("System.String"));
            templateDt.Columns.Add(Patient.PtContactStatus, Type.GetType("System.String"));
            return templateDt;
        }

        private DataTable GetSSDITableTemplate()
        {
            DataTable templateDt = new DataTable();
            templateDt.Columns.Add("Status", Type.GetType("System.String"));
            templateDt.Columns.Add("SSN", Type.GetType("System.String"));
            templateDt.Columns.Add("LastName", Type.GetType("System.String"));
            templateDt.Columns.Add("SuffixName", Type.GetType("System.String"));
            templateDt.Columns.Add("FirstName", Type.GetType("System.String"));
            templateDt.Columns.Add("MiddleName", Type.GetType("System.String"));
            templateDt.Columns.Add("VPCode", Type.GetType("System.String"));
            templateDt.Columns.Add("DOD", Type.GetType("System.String"));
            templateDt.Columns.Add("DOB", Type.GetType("System.String"));
            templateDt.Columns.Add("ZipLastRes", Type.GetType("System.String"));
            templateDt.Columns.Add("ZipLumpSum", Type.GetType("System.String"));
            templateDt.Columns.Add("siganture_date", Type.GetType("System.String"));
            templateDt.Columns.Add("URL", Type.GetType("System.String"));
            return templateDt;
        }
        #endregion


    }
}