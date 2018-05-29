using System;
using System.Collections;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Web;
using System.Web.SessionState;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;

using System.Linq;

using System.Xml;
using System.Xml.XPath;
using System.Xml.Xsl;
using System.Text;
using System.IO;
using System.Configuration;
using System.Xml.Linq;

using Caisis.BOL;
using Caisis.Controller;
using Caisis.DataAccess;

using Caisis.UI.Core.Classes;

using System.Reflection;
using System.Net.Mail;

//TODO v4.1 : If user does not have approve permission display button to Finish data review, otherwise diplay approve button


namespace Caisis.UI.Core.Eforms
{
    /// <summary>
    /// Summary description for temp.
    /// </summary>
    public partial class ReviewEForm : EFormBasePage
    {
        protected ImageButton SaveButton;

        XsltArgumentList _xslArgs = new XsltArgumentList();
        private Dictionary<string, object> _transformArguments = new Dictionary<string, object>();

        private XmlDocument xmlDoc;
        private XDocument xDoc;

        protected override void Page_Load(object sender, System.EventArgs e)
        {
            base.Page_Load(sender, e);
            Page.EnableViewState = false; // no need for it

            if (IsPostBack) // Approve or Submit for Approval was clicked
            {
//                testDiv.Visible = true;
//                theNarrative.Visible = false;

                this.SaveNarrative();

                if (EFormController.CanApproveEForm())
                {
                    this.ApproveEForm(); // redirect occurs
                    this.GoToApprovedPage();
                }
                else
                {
                    DisplayReport();
                }
                //this.NextStepOnBtnClick();  
            }
            else
            {
                string eformId = base.EFormId.ToString();
                Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "xyz", "var eformId = " + eformId, true);
                DisplayReport();
            }
        }
        

        private void DisplayReport()
        {
            //GenericEFormViewer viewer = new GenericEFormViewer(base.EFormId);
            //Response.Write(viewer.GetGenericEformHTML());
            //theNarrative.Visible = false;
            //return;

            #region old code that needed refactoring
            //EFormController ctr = new EFormController();

            //DataSet eds = ctr.GetRecord(base.EFormId);

            //if (eds.Tables[0].Rows.Count > 0)
            //{
            //    HiddenEFormId.Value = base.EFormId.ToString();

            //    string eformStatus = eds.Tables[0].Rows[0][Caisis.BOL.EForm.CurrentStatus].ToString();

            //    string s = eds.Tables[0].Rows[0][Caisis.BOL.EForm.EFormXML].ToString();

            //    HiddenEFormId.Value = eds.Tables[0].Rows[0][Caisis.BOL.EForm.EFormId].ToString();

            //    xmlDoc = new XmlDocument();

            //    xmlDoc.LoadXml(s);

            //    // get xsl file name from url variable, remove whitespace, and add extenstion
            //    string xslFileName = base.EFormName.Replace(" ", "") + ".xslt";

            //    // transform the xml file
            //    string narrative = this.TransformData(xmlDoc, xslFileName);

            //    theNarrative.InnerHtml = narrative;

            //    NarrativeHolder.Value = narrative;

            //    #region old way; only uses transform first time narrative is displayed

            //    /* if eform narrative is in the table display it, otherwise use the transform
            //    if(eds.Tables[0].Rows[0][Caisis.BOL.EForm.EFormReport].ToString().Length > 0)
            //    {
            //        string narrativeTxt = eds.Tables[0].Rows[0][Caisis.BOL.EForm.EFormReport].ToString();	
					
            //        theNarrative.InnerHtml = narrativeTxt;
					
            //        NarrativeHolder.Value = narrativeTxt;
            //    }
            //    // use transform and xml to display report
            //    else
            //    {
            //        string s = eds.Tables[0].Rows[0][Caisis.BOL.EForm.EFormXML].ToString();
					
            //        HiddenEFormId.Value = eds.Tables[0].Rows[0][Caisis.BOL.EForm.EFormId].ToString();

            //        XmlDocument xmlDoc = new XmlDocument();
					
            //        xmlDoc.LoadXml(s);
					
            //        // get xsl file name from url variable, remove whitespace, and add extenstion
            //        string xslFileName = base.EFormName.Replace(" ", "") + ".xslt";
				
            //        // transform the xml file
            //        string narrative = this.TransformData(xmlDoc, xslFileName);

            //        // save's report first time page is loaded;
            //        this.SaveNarrative(narrative, base.EFormId, this.StatusOnPageLoad);

            //        theNarrative.InnerHtml = narrative;

            //        NarrativeHolder.Value = narrative;
					
            //    }
            //    */
            //    # endregion

            //}
            #endregion

            // refactored version of the above
            EForm eform = new EForm();
            eform.Get(base.EFormId);

            if (!eform.IsEmpty)
            {
                string eformStatus = eform[EForm.CurrentStatus].ToString();
                string xml = eform[EForm.EFormXML].ToString();

                xmlDoc = new XmlDocument();
                xmlDoc.LoadXml(xml);
                xDoc = XDocument.Parse(xml, LoadOptions.None);

                // related records
                RelatedRecordController rc = new RelatedRecordController();
                rc.AppendEformRelatedRecordValues(xmlDoc);

                // get xsl file name from url variable, remove whitespace, and add extenstion
                string xslFileName = base.EFormName.Replace(" ", "") + ".xslt";

                // transform the xml file
                string narrative = this.TransformData(xmlDoc, xslFileName);

                theNarrative.InnerHtml = narrative;

                NarrativeHolder.Value = narrative;
            }
        }

        private string TransformData(XmlDocument xmlDoc, string xslFileName)
        {
            string module = Caisis.UI.Core.Classes.XmlUtil.GetParentModuleDirectory(xslFileName, "EForms");

            System.Text.StringBuilder sb = new System.Text.StringBuilder();

            HtmlTextWriter writer = new HtmlTextWriter(new StringWriter(sb));

            XslTransform xsl = new XslTransform();

            string xslPath = "~/Modules/" + module + "/EForms/" + xslFileName;
            string fullPathToXslDoc = Server.MapPath(xslPath);
            // consider moving this clause to ReviewEformContainer to approve performance.
            if (System.IO.File.Exists(fullPathToXslDoc))
            {
                // old: statically call methods to populate params
                this.AddParamsToXslArgList();

                // new: dyanically call methods by params in transform
//                this.AddParamsToXslArgList(fullPathToXslDoc);

                xsl.Load(fullPathToXslDoc);
                AddXmlNodeTransformArgument("Procedures", new XElement[0]);
                xsl.Transform(xmlDoc, _xslArgs, writer);
            }
            else // xsl doesn't exist, use generic display of data
            {
                //Server.Transfer("EFormVerify.aspx?eformId=" + base.EFormId);
                EFormGenericTransformController genericView = new EFormGenericTransformController();
                sb.Append(genericView.GetGenericTransform(base.EFormId, true));
            }

            return sb.ToString();
        }

        private void SaveNarrative()
        {
            ///int eId = Convert.ToInt32(HiddenEFormId.Value);

            // TODO: the narrative that is saved should look the same as the on screen narrative
            //       but without the javascript. EFormGenericTransformController takes bool to turn js events on/off
            //string narrative = Request.Form[NarrativeHolder.UniqueID].ToString();
            string narrative = Request.Form[NarrativeHolder.UniqueID] + "";

            if (narrative.Length < 1)
            {
                Exception ex = new Exception("No narrative present in NarrativeHolder field.");
                ExceptionHandler.Publish(ex);
                narrative = GetNarrative();
            }


            this.SaveNarrative(narrative, base.EFormId, EformStatusManager.Status_Narrated);
        }

        private string GetNarrative()
        {
            EForm eform = new EForm();
            eform.Get(base.EFormId);

            string narrativeString = "no report";

            if (!eform.IsEmpty)
            {
                string eformStatus = eform[EForm.CurrentStatus].ToString();
                string xml = eform[EForm.EFormXML].ToString();

                xmlDoc = new XmlDocument();
                xmlDoc.LoadXml(xml);
                xDoc = XDocument.Parse(xml, LoadOptions.None);

                // related records
                RelatedRecordController rc = new RelatedRecordController();
                rc.AppendEformRelatedRecordValues(xmlDoc);

                // get xsl file name from url variable, remove whitespace, and add extenstion
                string xslFileName = base.EFormName.Replace(" ", "") + ".xslt";

                // transform the xml file
                narrativeString = this.TransformData(xmlDoc, xslFileName);
            }

            return narrativeString;

        }

        // todo: (bas) parameterize this w/ a status string
        private void SaveNarrative(string narrative, int eformId, string status)
        {
            string userName = base.EFormUserName;
            EFormController ect = new EFormController();
            ect.UpdateEFormReport(eformId, narrative, status, userName);
        }

        private void ApproveEForm()
        {
            if (EFormController.CanApproveEForm())
            {
                string _userName = base.EFormUserName;
                int _patientId = base.EFormPatientId;
                int _eformId = base.EFormId;
                string _eformName = base.EFormName;// should pull from url

                // get eform record	
                XmlDocument xmlDoc = new XmlDocument();
                EFormController ctr = new EFormController();

                DataSet ds = ctr.GetRecord(_eformId);

                if (ds.Tables[0].Rows.Count == 1)
                {
                    // CONFIRM EFORM HAS NOT ALREADY BEEN APPROVED
                    if (!ds.Tables[0].Rows[0][EForm.CurrentStatus].ToString().Equals(EformStatusManager.Status_Approved))
                    {
                        string s = ds.Tables[0].Rows[0][EForm.EFormXML].ToString();

                        string migrationErrorLog;

                        XmlServiceSettings settings = EFormController.GetEFormExportSettings(_eformName);
                        bool migrationSuccess = XmlServices.MigrateEformXml(_patientId, s, out migrationErrorLog, settings);


                        if (ds.Tables[0].Rows[0][EForm.EFormReport].ToString().Length < 0)
                        {
                            Exception ex = new Exception("No narrative when approving EForm. Attempting to generate new report.");
                            ExceptionHandler.Publish(ex);
                            ds.Tables[0].Rows[0][EForm.EFormReport] = GetNarrative();
                        }

                        // update eform status to 'approved' and updated by person
                        // even if there was a failure migrating data, update status to approved and notify sys admin, because some of the data may have migrated and we don't want user to re-approve/migrate!
                        ctr.UpdateEFormXml(_eformId, s, EformStatusManager.Status_Approved, _userName);

                        if (migrationSuccess)
                        {
                            SendReportToUser(_eformId, _eformName, _userName, _patientId);
                            ReferEFormToUsers(_eformId, _eformName, _userName, _patientId);
                        }
                        else
                        {
                            string errorOutput = "\n\nEFORM APPPROVAL ERROR LOG (records below were not stored in database)\n\nEFormId: " + _eformId + " Approved By: " + base.EFormUserName + " at " + DateTime.Now + "\n\n" + migrationErrorLog;
                            Exception migrationException = new Exception(errorOutput);
                            ExceptionHandler.Publish(migrationException);
                        }
                    }
                }
            }
        }

        /// <summary>
        /// If EmailReportToUserOnApproval attribute to set to true, send view of report to user who approved eform and cc admin : Note, this always sends the generic report even if a transform to a paper view exists   
        /// </summary>
        /// <param name="eformId"></param>
        /// <param name="userName"></param>
        /// <param name="patientId"></param>
        private void SendReportToUser(int eformId, string eformName, string userName, int patientId)
        {
            XmlNode configNode = CaisisConfiguration.GetEFormNode(eformName);
            if (configNode != null)
            {
                XmlAttribute att = configNode.Attributes["emailReportToUserOnApproval"];
                if (att != null)
                {
                    // Try to read value from xml and send email if true
                    //try
                    //{
                    bool doSend = bool.Parse(att.Value);
                    if (doSend)
                    {
                        // The following logic will replace generic view in v.4.5
                        //GenericEFormViewer viewer = new GenericEFormViewer(eformId);
                        //string htmlOutput = viewer.GetGenericEformHTML();
                        EFormsDa da = new EFormsDa();
                        string htmlOutput = da.GetEformReport(eformId);

                        UserDa user = new UserDa();
                        string userAddress = user.GetByUserName(userName).Tables[0].Rows[0][Caisis.BOL.User.UserEmail].ToString();

                        Patient p = new Patient();
                        p.Get(patientId);
                        string ptMRN = p[Patient.PtMRN].ToString();
                        string emailSubject = "Eform Approved for Patient MRN " + ptMRN;

                        MailManager mailer = new MailManager();
                        mailer.UseHtmlFormat = true;
                        mailer.SendEmailFromAdmin(userAddress, mailer.AdminEmailAddress, emailSubject, htmlOutput);
                    }
                    //}
                    //catch (Exception ex)
                    //{
                    //}
                }
            }
        }

        // go to the approved/print page
        protected void GoToApprovedPage()
        {
            Page.ClientScript.RegisterStartupScript(this.GetType(), "xyz", "parent.window.location.href='ApproveEFormContainer.aspx?approved=true&eformId=" + base.EFormId + "';", true);
        }

        private DataView GetTopDataViewRows(DataView dv, Int32 n)
        {
            DataTable dt = dv.Table.Clone();

            for (int i = 0; i < n; i++)
            {
                if (i >= dv.Count)
                {
                    break;
                }
                dt.ImportRow(dv[i].Row);
            }
            return new DataView(dt, dv.RowFilter, dv.Sort, dv.RowStateFilter);
        }




        /// <summary>
        /// Refer other user(s) to the approved eform 
        /// </summary>
        /// <param name="eformId"></param>
        /// <param name="userName"></param>
        /// <param name="patientId"></param>
        private void ReferEFormToUsers(int eformId, string eformName, string userName, int patientId)
        {
            string referListString = Request["referTo"].ToString();
            string referMessage = Request["referralMessage"].ToString();

            if (referListString.Length > 0)
            {

                // EForm info
                EFormsDa da = new EFormsDa();
                DataSet ds = da.GetEformsRecord(eformId);

                if (ds.Tables[0].Rows.Count == 1)
                {
                    string UpdatedBy = ds.Tables[0].Rows[0][EForm.UpdatedBy].ToString();
                    string UpdatedTime = ds.Tables[0].Rows[0][EForm.UpdatedTime].ToString();
                    string EFormName = ds.Tables[0].Rows[0][EForm.EFormName].ToString();
                    string ApptPhysician = ds.Tables[0].Rows[0][EForm.EformApptPhysician].ToString();
                    string EFormId = ds.Tables[0].Rows[0][EForm.EFormId].ToString();
                    string EFormApptDateText = ds.Tables[0].Rows[0][EForm.EformApptTime].ToString();
                    DateTime EFormApptDate;
                    if (DateTime.TryParse(EFormApptDateText, out EFormApptDate))
                    {
                        EFormApptDateText = EFormApptDate.ToShortDateString();
                    }


                    // Patient info
                    Patient p = new Patient();
                    p.Get(patientId);
                    string patientFirstName = p[Patient.PtFirstName].ToString();
                    string patientLastName = p[Patient.PtLastName].ToString();
                    string patientMRN = p[Patient.PtMRN].ToString();
                    string patientDOB = p[Patient.PtBirthDateText].ToString();

                    // sender info
                    UserDa user = new UserDa();
                    DataRow sender = user.GetByUserName(userName).Tables[0].Rows[0];
                    string senderEmail = sender[Caisis.BOL.User.UserEmail].ToString();
                    string senderLastName = sender[Caisis.BOL.User.UserLastName].ToString();
                    string senderFirstName = sender[Caisis.BOL.User.UserFirstName].ToString();

                    // recipient info
                    string referListSeparators = "-";
                    char[] referListDemlinators = referListSeparators.ToCharArray();
                    string[] referList = referListString.Split(referListDemlinators);



                    foreach (string userIDStr in referList)
                    {
                        int userID = 0;

                        if (int.TryParse(userIDStr, out userID))
                        {
                            User biz = new User();
                            biz.Get(userID);

                            string referToUserName = biz[BOL.User.UserName].ToString();
                            bool limitEMailInfo = LimitReferralEmailInfo(referToUserName);

                            string referToEmail = biz[BOL.User.UserEmail].ToString();
                            string referToLastName = biz[BOL.User.UserLastName].ToString();
                            string referToFirstName = biz[BOL.User.UserFirstName].ToString();


                            string XSLTPath = "~/Admin/EFormReferralTemplate.xsl";

                            MailManager m = new MailManager();

                            XmlDocument xDoc = new XmlDocument();
                            xDoc.AppendChild(xDoc.CreateXmlDeclaration("1.0", System.Text.Encoding.UTF8.WebName, "yes"));
                            XmlElement eForms = xDoc.CreateElement("eforms");
                            xDoc.AppendChild(eForms);

                            string toName = referToFirstName + " " + referToLastName;
                            string toAddress = referToEmail;
                            string fromName = senderFirstName + " " + senderLastName;

                            // Prepare the message
                            MailMessage message = new MailMessage();
                            message.From = new MailAddress(senderEmail, fromName);
                            message.To.Add(new MailAddress(toAddress, toName));
                            message.Bcc.Add(new MailAddress(m.AdminEmailAddress));
                            message.Subject = "Patient Referral: " + patientLastName + ", " + patientFirstName + " " + patientMRN;

                            // Generate HTML output based on EForm XML
                            XslTransform transformer = new XslTransform();
                            XsltArgumentList argList = new XsltArgumentList();

                            argList.AddParam("senderLastName", string.Empty, senderLastName);
                            argList.AddParam("senderFirstName", string.Empty, senderFirstName);
                            argList.AddParam("patientLastName", string.Empty, patientLastName);
                            argList.AddParam("patientFirstName", string.Empty, patientFirstName);
                            argList.AddParam("patientMRN", string.Empty, patientMRN);
                            argList.AddParam("patientDOB", string.Empty, patientDOB);
                            argList.AddParam("patientId", string.Empty, patientId);
                            argList.AddParam("eformName", string.Empty, eformName);
                            argList.AddParam("eformDate", string.Empty, EFormApptDateText);
                            argList.AddParam("eformId", string.Empty, eformId);
                            argList.AddParam("recipientLastName", string.Empty, referToLastName);
                            argList.AddParam("recipientFirstName", string.Empty, referToFirstName);
                            argList.AddParam("referralMessage", string.Empty, referMessage);
                            argList.AddParam("limitEMailInfo", string.Empty, limitEMailInfo.ToString().ToLower());  // limit the info sent to a limited subset of referral recipients


                            argList.AddParam("urlBase", string.Empty, PageUtil.GetAbsoluteUrl(this.Page, "~/"));
                            transformer.Load(Server.MapPath(XSLTPath));
                            System.IO.StringWriter messageWriter = new System.IO.StringWriter();
                            transformer.Transform(xDoc, argList, messageWriter);
                            message.Body = messageWriter.ToString();
                            message.IsBodyHtml = true;
                            m.SendEmail(message);


                        }

                    }
                }
            }
        }
        
        

        # region Add Xsl Parameters to the Xsl

        /// <summary>
        /// For the specified transform document, dynamically add required params
        /// </summary>
        /// <param name="fullXSLPath"></param>
        private void AddParamsToXslArgList(string fullXSLPath)
        {
            string[] methodFormats = { "Add{0}Params", "Add{0}" };
            // use reflection to locate relevant methods to invoke
            Type type = this.GetType().BaseType;
            // get a list of distinct param names
            var distinctParamNames = EnumerateXSLTParams(fullXSLPath).Distinct();
            // for each param, check if method exists to populate
            foreach (string paramName in distinctParamNames)
            {
                // check if current param added
                if (_transformArguments.ContainsKey(paramName))
                    continue;
                // i.e., param=InstitutionName, method=AddInstitutionNameParams
                // i.e., param=DemogrphicParams, method=AddDemogrphicParams
                foreach (string methodFormat in methodFormats)
                {
                    string methodFullName = string.Format(methodFormat, paramName);
                    var callback = type.GetMethod(methodFullName, BindingFlags.NonPublic | BindingFlags.Instance);
                    // if method exists, invoke (should be parameter method)
                    if (callback != null)
                    {
                        callback.Invoke(this, new object[0]);
                        break;
                    }
                }                
            }
        }

        /// <summary>
        /// Returns a list of param names for the specified xsl document, including external libraries
        /// </summary>
        /// <param name="soureceXSLTPath"></param>
        /// <returns></returns>
        private List<string> EnumerateXSLTParams(string soureceXSLTPath)
        {
            XmlDocument soureceXDoc = new XmlDocument();
            soureceXDoc.Load(soureceXSLTPath);
            List<string> paramNames = new List<string>();
            string sourceDirectory = Path.GetDirectoryName(soureceXSLTPath);
            XmlNamespaceManager namespaceManager = new XmlNamespaceManager(soureceXDoc.NameTable);
            namespaceManager.AddNamespace("xsl", "http://www.w3.org/1999/XSL/Transform");
            // select dynamic param names
            XmlNodeList sourceParams = soureceXDoc.SelectNodes("//xsl:param[@name]", namespaceManager);
            // add params
            foreach (XmlNode sourceParam in sourceParams)
            {
                string sourceParamName = sourceParam.Attributes["name"].Value;
                paramNames.Add(sourceParamName);
            }
            // select dynamic param names
            XmlNodeList libraries = soureceXDoc.SelectNodes("//xsl:include", namespaceManager);
            foreach (XmlNode lib in libraries)
            {
                string includeRelativePath = lib.Attributes["href"].Value;
                string includeFullPath = Path.GetFullPath(Path.Combine(sourceDirectory, includeRelativePath));
                if (!string.IsNullOrEmpty(includeFullPath) && System.IO.File.Exists(includeFullPath))
                {
                    // recursively include external libraries
                    paramNames.AddRange(EnumerateXSLTParams(includeFullPath));
                }
            }
            return paramNames;
        }

        /// <summary>
        /// Adds a paramater to the XSLT
        /// </summary>
        /// <param name="key"></param>
        /// <param name="empty"></param>
        /// <param name="value"></param>
        private void AddTransformArgument(string key, string empty, object value)
        {
            if (!_transformArguments.ContainsKey(key))
            {
                _transformArguments.Add(key, value);
                if (value is IEnumerable<XElement>)
                {
                    AddXmlNodeTransformArgument(key, value as IEnumerable<XElement>);
                }
                else
                {
                    _xslArgs.AddParam(key, "", value);
                }
            }
        }

        /// <summary>
        /// Adds the list of XElements
        /// </summary>
        /// <param name="key"></param>
        /// <param name="values"></param>
        private void AddXmlNodeTransformArgument(string key, IEnumerable<XElement> values)
        {
            XDocument xDoc = new XDocument(new XElement("root", values));
            var xNodeParams = xDoc.CreateNavigator().SelectChildren(XPathNodeType.All);
           _xslArgs.AddParam(key, "", xNodeParams);
        }

        /// <summary>
        /// Calls methods that add parameters to the Xsl
        /// </summary>
        private void AddParamsToXslArgList()
        {
            // string
            AddInstitutionNameParams();
            AddDemographicParams();
            AddPriorProceduresParam();
            AddDreParams();

            // rows
            AddComorbidityParams();
            AddAllergiesParams();
            AddToxicityParams();
            AddMedicationParams();
            AddLabTestParams();
            AddLabTestParams2();
            AddImagingRows();
            AddBMDImagingRows();
            AddMedicalTherapyParams();
            AddRadiationTherapyParams();
            AddReferringMDParams();
            AddPatientsPhysiciansParams();
            AddProstateBiopsyParams();
 //           AddDiagnosticProstateBiopsyParams();
            AddFamilyMemberHxParams();
            AddSocialHxParams();
            AddSurgeryHistoryParams();
            AddSurgeryHistoryParams2();
            AddProcedureParams();
            AddBrachyTherapyParams();
            AddHospitalizationsParams();
            AddStatusParams();
            AddCategoryParams();
            AddContactsParams();
            AddAppointmentParams();
            AddDietaryIntakeParams();
            AddPSADTParam();
            AddCurrentMedTxParams();
            AddGUProstateStatusParams();
            AddEncounterParams();

            // append protocols to hpi and other things?
            // hpi dataset used to get below params
            AddHPIParams();


            if (this.EFormName.Contains("Kid"))
            {
                
                    AddCombinedDiagnostics_Kidney();
                    AddKidneyHPI();
                    AddCombinedComplications_Kidney();
                    AddCombinedFamilyMembers();
                    AddCombinedSocialHistories();
                    AddDiseaseState_Kidney();
                    AddLabTests_Kidney();
            }
            if (this.EFormName.Contains("Pros"))
            {
                AddCombinedBiopsies_Prostate();
                AddCombinedDiagnostics();
                AddCombinedLabTests_Prostate();


                if (this.EFormName.Replace(" ", "").Contains("UroProsFU"))
                {
                    AddHadProstatectomy();
                }
                else if (this.EFormName.Contains("NP"))
                {
                    AddCombinedFamilyMembers();
                    AddCombinedSocialHistories();
                    AddCombinedRadTx();
                    AddCombinedAllergies();
                    AddCombinedComorbidities();
                    AddCombinedProcedures();
                }
                else if (this.EFormName.Contains("Surveillance"))
                {
                    BuildActiveSurveillanceLabTests();
                    AddCombinedFamilyMembers();
                    AddCombinedSocialHistories();
                    AddCombinedRadTx();
                    AddCombinedAllergies();
                    AddCombinedComorbidities();
                    AddCombinedProcedures();
                    AddCombinedQOLTherapies();
                    AddActiveSurveillanceRectalExamHistory();
                    AddProstateBiopsyActiveSurveillanceParams();
                    AddCombinedProstateMRI();
                }
                else if (this.EFormName.Replace(" ", "").Contains("BiopsyOfProstate"))
                {
                    AddActiveSurveillanceRectalExamHistory();
                    AddCombinedProstateMRI();
                    AddCombinedProstateUlrasound();
                }
                else if (this.EFormName.Contains("Survivor"))
                {
                    AddCombinedFamilyMembers();
                    AddCombinedSocialHistories();
                    AddCombinedRadTx();
                    AddCombinedAllergies();
                    AddCombinedComorbidities();
                    AddCombinedProcedures();
//                    AddCombinedQOLTherapies();
                    AddCombinedToxicities();
                    AddCombinedMedications();
                    BuildSurvivorshipLabTests();
                    AddCombinedMedTx();
                }
            }
            else if (this.EFormName.Contains("Survivorship"))
            {
                AddCombinedBiopsies_Prostate();
                AddCombinedDiagnostics();
                AddCombinedLabTests_Prostate();
                AddCombinedFamilyMembers();
                AddCombinedSocialHistories();
                AddCombinedRadTx();
                AddCombinedAllergies();
                AddCombinedComorbidities();
                AddCombinedProcedures();
                //                    AddCombinedQOLTherapies();
                AddCombinedToxicities();
                AddCombinedMedications();
                BuildSurvivorshipLabTests();
                AddCombinedMedTx();
                AddCombinedCytology();
            }
            
       }

        private void AddHPIParams()
        {
            if (this.EFormName.StartsWith("GU"))
            {
                AddGUHpiParam();
            }
            else if (this.EFormName.ToUpper().Contains("BLAD"))
            {
                AddBladderHpiParam();
            }
            else
            {
                PatientDa hpiDa = new PatientDa();
                try
                {
                    DataSet hpiDs = hpiDa.GetPatientHPI(base.EFormPatientId, 0, 0);
                    AddBiopsyParams(hpiDs);
                    AddClinStageTParam(hpiDs);
                    AddHpiParam(hpiDs);
                }
                catch (Exception ex)
                {
                    ExceptionHandler.Publish(ex);
                }
                AddNomogramParams(base.EFormPatientId);
            }
        }

        /// <summary>
        /// Adds Bladder HPI to Xsl parameters
        /// </summary>
        /// <param name="hpiDs"></param>
        private void AddBladderHpiParam()
        {

            PatientDa hpiDa = new PatientDa();
            try
            {
                DataSet hpiDs = hpiDa.GetPatientHPIBladder(base.EFormPatientId);
                AddHpiParam(hpiDs);
            }
            catch (Exception ex)
            {
                AddTransformArgument("Hpi", "", "");
            }

        }


        /// <summary>
        /// Adds Institution name and img tag for institution logo based on web.config variable to Xsl params.
        /// Institution logo should be stored in the format AbbreviatedName_FormLogo.gif, ie MSKCC_FormLogo.gif.
        /// </summary>
        private void AddInstitutionNameParams()
        {
            string name = CaisisConfiguration.GetWebConfigValue("institutionName");
            string shortName = CaisisConfiguration.GetWebConfigValue("institutionShortName");
            if (!string.IsNullOrEmpty(shortName))
            {
                // <img src=../../Images/FormImages/MSKCC_FormLogo.gif width="80" border="0" align="left" />
                string imagePath = Page.ResolveUrl("~/Images/FormImages/") + shortName+ "_FormLogo.gif";
                string logoUrl = "<img src=\"" + imagePath + "\" width=\"80\" border=\"0\" align=\"left\" />";
                AddTransformArgument("InstitutionLogoImgUrl", "", logoUrl);
            }
            if (!string.IsNullOrEmpty(name))
            {
                AddTransformArgument("InstitutionName", "", name);
            }
        }

        /// <summary>
        /// Adds to DRE_Result and DRE_Weight to Xsl params
        /// </summary>
        private void AddDreParams()
        {
            EncRectalExamDa eDa = new EncRectalExamDa();
            DataSet eDs = eDa.FormGetLastEncRectalExam(base.EFormPatientId);

            if (eDs.Tables.Count > 0 && eDs.Tables[0].Rows.Count > 0)
            {
                if (eDs.Tables[0].Rows[0]["DRE_Result"].ToString().Length > 0)
                {
                    AddTransformArgument("DRE_Result", "", eDs.Tables[0].Rows[0]["DRE_Result"].ToString());
                }

                if (eDs.Tables[0].Rows[0]["DRE_ProstateWeight"].ToString().Length > 0)
                {
                    AddTransformArgument("DRE_Weight", "", eDs.Tables[0].Rows[0]["DRE_ProstateWeight"].ToString());
                }
            }
        }


        /// <summary>
        /// Adds prior procedures ("OpName") to Xsl params
        /// </summary>
        private void AddPriorProceduresParam()
        {
            ChronoDa chronoDa = new ChronoDa();
            DataSet chronoDs = chronoDa.GetChronoList(base.EFormPatientId, "Procedures", User.Identity.Name);

            if (chronoDs.Tables.Count > 0 && chronoDs.Tables[0].Rows.Count > 0)
            {
                string ChronoString = "Prior Procedures: ";

                for (int i = 0; i < chronoDs.Tables[0].Rows.Count; i++)
                {
                    ChronoString += chronoDs.Tables[0].Rows[i]["varDate"].ToString() + " " + chronoDs.Tables[0].Rows[i]["VarValue"].ToString() + ", ";
                }

                AddTransformArgument("OpName", "", ChronoString);
            }
        }


        private void AddImagingRows()
        {
            DiagnosticDa imagesDa = new DiagnosticDa();
            DataSet ds = imagesDa.FormGetDxImages(base.EFormPatientId, this.EFormName, "Dynamic");


            if (ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
            {
                StringBuilder sb = new StringBuilder();

                foreach (DataRow dr in ds.Tables[0].Rows)
                {
                    sb.Append("<tr class=\"EFormTableRow\" onmouseover=\"this.className='chronListHilighted';\" onmouseout=\"this.className='EFormTableRow';\" onclick=\"LoadDataEntryForm('Diagnostics', '" + dr[Diagnostic.DiagnosticId].ToString() + "', '')\">");

                    sb.Append("<td align=center valign=middle class=\"FormInsideTableLeftCell\">");
                    sb.Append(dr[Diagnostic.DxDateText].ToString());
                    sb.Append("&#160;</td>");

                    sb.Append("<td align=center valign=middle class=\"FormInsideTableRegCell\">");
                    sb.Append(dr[Diagnostic.DxType].ToString());
                    sb.Append("&#160;</td>");

                    sb.Append("<td align=center valign=middle class=\"FormInsideTableRegCell\">");
                    sb.Append(dr[Diagnostic.DxResult].ToString());
                    sb.Append("&#160;</td>");

                    sb.Append("<td align=center valign=middle class=\"FormInsideTableRegCell\">");
                    sb.Append(dr[Diagnostic.DxNotes].ToString());
                    sb.Append("&#160;</td>");

                    sb.Append("</tr>");

                }
                AddTransformArgument("ImagingRows", "", sb.ToString());





                StringBuilder sb2 = new StringBuilder();

                foreach (DataRow dr in ds.Tables[0].Rows)
                {
                    sb2.Append("<tr onmouseover=\"this.className='chronListHilighted';\" onmouseout=\"this.className='';\" onclick=\"LoadDataEntryForm('Diagnostics', '" + dr[Diagnostic.DiagnosticId].ToString() + "', '')\">");

                    sb2.Append("<td align=\"center\" class=\"FormInsideTableLeftCell\">");
                    sb2.Append(dr[Diagnostic.DxDateText].ToString());
                    sb2.Append("&#160;</td>");

                    sb2.Append("<td align=\"center\" class=\"FormInsideTableRegCell\">");
                    sb2.Append(dr[Diagnostic.DxType].ToString());
                    sb2.Append("&#160;</td>");

                    sb2.Append("<td class=\"FormInsideTableRegCell\">");
                    if (dr[Diagnostic.DxResult].ToString().Length > 0) sb2.Append("Result: " + dr[Diagnostic.DxResult].ToString());
                    if (dr[Diagnostic.DxResult].ToString().Length > 0 && dr[Diagnostic.DxNotes].ToString().Length > 0) sb2.Append("&#160;&#160;&#160;--&#160;&#160;&#160;");
                    sb2.Append(dr[Diagnostic.DxNotes].ToString());
                    sb2.Append("&#160;</td>");

                    sb2.Append("</tr>");



                }
                AddTransformArgument("GUProsFUImagingRows", "", sb2.ToString());

            }

            DataTable dxDt, dxFindingDt;
            DiagnosticDa dxDa = new DiagnosticDa();

            dxDt = dxDa.GetDiagnosticsByType(base.EFormPatientId, "CT", "MRI");

            if (dxDt.Rows.Count > 0)
            {

                // limit to last 10 records
                DataView dxDv = new DataView(dxDt);
                dxDv.Sort = Diagnostic.DxDate + " DESC ";
                dxDv = GetTopDataViewRows(dxDv, 5);
                dxDv.Sort = Diagnostic.DxDate + " ASC ";
                DataTable dxTopTenDt = dxDv.ToTable();

                StringBuilder sb4 = new StringBuilder();

                if (dxDt.Rows.Count > 5)
                {
                    sb4.Append("<tr class=\"EFormTableRow\" align=center style=\"background-color: #A8A8A8;\">");
                    sb4.Append("<td colspan=\"6\" align=\"center\" valign=\"middle\" class=\"FormInsideTableLeftCell\" >");
                    sb4.Append("<i>most recent 5&#160;</i></td>");
                    sb4.Append("</tr>");
                }

                foreach (DataRow dr4 in dxTopTenDt.Rows)
                {
                    sb4.Append("<tr>");
                    sb4.Append("<td align=\"center\" valign=\"middle\" class=\"FormInsideTableLeftCell\" colspan=\"1\" >");
                    sb4.Append("<strong>Date</strong></td>");
                    sb4.Append("<td align=\"center\" valign=\"middle\" class=\"FormInsideTableLeftCell\" colspan=\"2\" >");
                    sb4.Append("<strong>Result</strong></td>");
                    sb4.Append("<td align=\"center\" valign=\"middle\" class=\"FormInsideTableLeftCell\" >");
                    sb4.Append("<strong>Scan Type</strong></td>");
                    sb4.Append("<td align=\"center\" valign=\"middle\" class=\"FormInsideTableLeftCell\" >");
                    sb4.Append("<strong># of tumors</strong></td>");
                    sb4.Append("<td align=\"center\" valign=\"middle\" class=\"FormInsideTableLeftCell\" >");
                    sb4.Append("<strong>Institution</strong></td>");
                    sb4.Append("</tr>");

                    sb4.Append("<tr class=\"EFormTableRow\" onmouseover=\"this.className='chronListHilighted';\" onmouseout=\"this.className='EFormTableRow';\" onclick=\"LoadDataEntryForm('Diagnostics', '" + dr4[Diagnostic.DiagnosticId].ToString() + "', 'DxDateText,DxResult,DxType,DxTotalNumTumors,DxInstitution,DxNotes')\" >");

                    sb4.Append("<td align=\"center\" valign=\"middle\" class=\"FormInsideTableLeftCell\" >");
                    sb4.Append(dr4[Diagnostic.DxDateText].ToString());
                    sb4.Append("&#160;</td>");

                    sb4.Append("<td align=\"center\" valign=\"middle\" class=\"FormInsideTableLeftCell\" colspan=\"2\" >");
                    sb4.Append(dr4[Diagnostic.DxResult].ToString());
                    sb4.Append("&#160;</td>");

                    sb4.Append("<td align=\"center\" valign=\"middle\" class=\"FormInsideTableLeftCell\" >");
                    sb4.Append(dr4[Diagnostic.DxType].ToString());
                    sb4.Append("&#160;</td>");

                    sb4.Append("<td align=\"center\" valign=\"middle\" class=\"FormInsideTableLeftCell\" >");
                    sb4.Append(dr4[Diagnostic.DxTotalNumTumors].ToString());
                    sb4.Append("&#160;</td>");

                    sb4.Append("<td align=\"center\" valign=\"middle\" class=\"FormInsideTableLeftCell\" >");
                    sb4.Append(dr4[Diagnostic.DxInstitution].ToString());
                    sb4.Append("&#160;</td>");

                    sb4.Append("</tr>");

                    sb4.Append("<tr class=\"EFormTableRow\" onmouseover=\"this.className='chronListHilighted';\" onmouseout=\"this.className='EFormTableRow';\" onclick=\"LoadDataEntryForm('Diagnostics', '" + dr4[Diagnostic.DiagnosticId].ToString() + "', 'DxDateText,DxResult,DxType,DxTotalNumTumors,DxInstitution,DxNotes')\" >");

                    sb4.Append("<td align=\"left\" valign=\"middle\" class=\"FormInsideTableLeftCell\" colspan=\"6\" >");
                    sb4.Append("<strong>Notes:  </strong>" + dr4[Diagnostic.DxNotes].ToString());
                    sb4.Append("&#160;</td>");

                    sb4.Append("</tr>");

                    dxFindingDt = dxDa.GetDxImagesByDiagnosticId(this.EFormPatientId, Convert.ToInt32(dr4[Diagnostic.DiagnosticId].ToString())).Tables[0];

                    if (dxFindingDt.Rows.Count > 0)
                    {

                        sb4.Append("<tr> ");

                        sb4.Append("<td align=\"center\" valign=\"middle\" class=\"FormInsideTableLeftCell\" colspan=\"1\" >");
                        sb4.Append("<strong></strong></td>");
                        sb4.Append("<td align=\"center\" valign=\"middle\" class=\"FormInsideTableLeftCell\" colspan=\"2\" >");
                        sb4.Append("<strong>Finding</strong></td>");
                        sb4.Append("<td align=\"center\" valign=\"middle\" class=\"FormInsideTableLeftCell\" colspan=\"2\" >");
                        sb4.Append("<strong>Location (if applicable)</strong></td>");
                        sb4.Append("<td align=\"center\" valign=\"middle\" class=\"FormInsideTableLeftCell\" >");
                        sb4.Append("<strong>Size (if applicable)</strong></td>");


                        sb4.Append("</tr>");

                        foreach (DataRow dr4b in dxFindingDt.Rows)
                        {

                            sb4.Append("<tr onclick=\"LoadDataEntryForm('DxImageFindings', '" + dr4b[ImageFinding.DxImageFindingId].ToString() + "', 'ImgFindResult,ImgFindSubsite,ImgFindWidth')\">");

                            sb4.Append("<td align=\"center\" valign=\"middle\" class=\"FormInsideTableLeftCell\"  >");
                            sb4.Append("<strong></strong></td>");

                            sb4.Append("<td align=\"center\" valign=\"middle\" class=\"FormInsideTableLeftCell\"  colspan=\"2\" >");
                            sb4.Append(dr4b[ImageFinding.ImgFindResult].ToString());
                            sb4.Append("&#160;</td>");

                            sb4.Append("<td align=\"center\" valign=\"middle\" class=\"FormInsideTableLeftCell\" colspan=\"2\" >");
                            sb4.Append(dr4b[ImageFinding.ImgFindSubsite].ToString());
                            sb4.Append("&#160;</td>");

                            sb4.Append("<td align=\"center\" valign=\"middle\" class=\"FormInsideTableRegCell\"  >");
                            sb4.Append(dr4b[ImageFinding.ImgFindWidth].ToString());
                            sb4.Append("&#160;</td>");

                            sb4.Append("</tr>");


                        }
                    }

                    sb4.Append("<tr> ");
                    sb4.Append("<td align=\"center\" valign=\"middle\" class=\"FormInsideTableLeftCell\" colspan=\"6\" >");
                    sb4.Append("&#160;</td>");
                    sb4.Append("</tr>");
                }

                AddTransformArgument("ImagingLiverHxLS", "", sb4.ToString());
            }


        }

         private void AddBMDImagingRows()
        {
            DiagnosticDa imagesDa = new DiagnosticDa();

             string type = "Bone Scan";

             DataTable dt = imagesDa.GetDiagnosticsByType(base.EFormPatientId, "Bone Scan", "BMD", "Bone Mineral Density");

             if (dt.Rows.Count > 0)
            {
                StringBuilder sb = new StringBuilder();

                foreach (DataRow dr in dt.Rows)
                {
                    sb.Append("<tr class=\"EFormTableRow\" >");

                    sb.Append("<td align=center valign=middle class=\"FormInsideTableLeftCell\" onmouseover=\"this.className='chronListHilighted';\" onmouseout=\"this.className='EFormTableRow';\" onclick=\"LoadDataEntryForm('Diagnostics', '" + dr[Diagnostic.DiagnosticId].ToString() + "', 'DxDateText,DxType,DxInstitution')\">");
                    sb.Append(dr[Diagnostic.DxDateText].ToString());
                    sb.Append("&#160;</td>");

                    sb.Append("<td align=center valign=middle class=\"FormInsideTableRegCell\" onmouseover=\"this.className='chronListHilighted';\" onmouseout=\"this.className='EFormTableRow';\" onclick=\"LoadDataEntryForm('Diagnostics', '" + dr[Diagnostic.DiagnosticId].ToString() + "', 'DxDateText,DxType,DxInstitution')\">");
                    sb.Append(dr[Diagnostic.DxType].ToString());
                    sb.Append("&#160;</td>");

                    sb.Append("<td align=center valign=middle class=\"FormInsideTableRegCell\" onmouseover=\"this.className='chronListHilighted';\" onmouseout=\"this.className='EFormTableRow';\" onclick=\"LoadDataEntryForm('Diagnostics', '" + dr[Diagnostic.DiagnosticId].ToString() + "', 'DxDateText,DxType,DxInstitution')\">");
                    sb.Append(dr[Diagnostic.DxInstitution].ToString());
                    sb.Append("&#160;</td>");


                 
                    DataSet ds2 = imagesDa.GetDxImagesByDiagnosticId(base.EFormPatientId,int.Parse(dr[Diagnostic.DiagnosticId].ToString()));

                    if (ds2.Tables.Count > 0 && ds2.Tables[0].Rows.Count > 0)
                    {
                        foreach (DataRow dr2 in ds2.Tables[0].Rows)
                        {

                            sb.Append("<td align=center valign=middle class=\"FormInsideTableRegCell\" onmouseover=\"this.className='chronListHilighted';\" onmouseout=\"this.className='EFormTableRow';\" onclick=\"LoadDataEntryForm('DxImageFindings', '" + dr2[ImageFinding.DxImageFindingId].ToString() + "', 'ImgFindSite,ImgFindStatus,ImgFindResult,ImgFindNotes')\">");
                            sb.Append(dr2[ImageFinding.ImgFindSite].ToString());
                            sb.Append("&#160;</td>");

                            sb.Append("<td align=center valign=middle class=\"FormInsideTableRegCell\" onmouseover=\"this.className='chronListHilighted';\" onmouseout=\"this.className='EFormTableRow';\" onclick=\"LoadDataEntryForm('DxImageFindings', '" + dr2[ImageFinding.DxImageFindingId].ToString() + "', 'ImgFindSite,ImgFindStatus,ImgFindResult,ImgFindNotes')\">");
                            sb.Append(dr2[ImageFinding.ImgFindStatus].ToString());
                            sb.Append("&#160;</td>");

                            sb.Append("<td align=center valign=middle class=\"FormInsideTableRegCell\" onmouseover=\"this.className='chronListHilighted';\" onmouseout=\"this.className='EFormTableRow';\" onclick=\"LoadDataEntryForm('DxImageFindings', '" + dr2[ImageFinding.DxImageFindingId].ToString() + "', 'ImgFindSite,ImgFindStatus,ImgFindResult,ImgFindNotes')\">");
                            sb.Append(dr2[ImageFinding.ImgFindResult].ToString());
                            sb.Append("&#160;</td>");

                            sb.Append("<td align=center valign=middle class=\"FormInsideTableRegCell\" onmouseover=\"this.className='chronListHilighted';\" onmouseout=\"this.className='EFormTableRow';\" onclick=\"LoadDataEntryForm('DxImageFindings', '" + dr2[ImageFinding.DxImageFindingId].ToString() + "', 'ImgFindSite,ImgFindStatus,ImgFindResult,ImgFindNotes')\">");
                            sb.Append(dr2[ImageFinding.ImgFindNotes].ToString());
                            sb.Append("&#160;</td>");

                            sb.Append("<tr>");
                            sb.Append("</tr>");

                            sb.Append("<td align=\"center\" valign=\"middle\" class=\"FormInsideTableRegCell\" colspan=\"1\">");
                            sb.Append("&#160;</td>");
                            sb.Append("<td align=\"center\" valign=\"middle\" class=\"FormInsideTableRegCell\" colspan=\"1\">");
                            sb.Append("&#160;</td>");
                            sb.Append("<td align=\"center\" valign=\"middle\" class=\"FormInsideTableRegCell\" colspan=\"1\">");
                            sb.Append("&#160;</td>");
                            
                       }
                    }

                    sb.Append("<td align=\"center\" valign=\"middle\" class=\"FormInsideTableRegCell\" colspan=\"1\">");
                    sb.Append("&#160;</td>");
                    sb.Append("<td align=\"center\" valign=\"middle\" class=\"FormInsideTableRegCell\" colspan=\"1\">");
                    sb.Append("&#160;</td>");
                    sb.Append("<td align=\"center\" valign=\"middle\" class=\"FormInsideTableRegCell\" colspan=\"1\">");
                    sb.Append("&#160;</td>");
                    sb.Append("<td align=\"center\" valign=\"middle\" class=\"FormInsideTableRegCell\" colspan=\"1\">");
                    sb.Append("&#160;</td>");

                    sb.Append("</tr>");
                }
                AddTransformArgument("BMDImagingRows", "", sb.ToString());
            }



        }


        /// <summary>
        /// Adds "ComorbidityRows" which includes comorbidity, date, and notes as a parameter in <tr><td></td></tr> format
        /// </summary>
        private void AddComorbidityParams()
        {

            ComorbidityDa comorbiditiesDa = new ComorbidityDa();
            DataSet comorbiditiesDs = comorbiditiesDa.FormGetRecords(base.EFormPatientId, "", "Dynamic");

            if (comorbiditiesDs.Tables.Count > 0 && comorbiditiesDs.Tables[0].Rows.Count > 0)
            {
                StringBuilder sb = new StringBuilder();

                foreach (DataRow dr in comorbiditiesDs.Tables[0].Rows)
                {
                    sb.Append("<tr class=\"EFormTableRow\" onmouseover=\"this.className='chronListHilighted';\" onmouseout=\"this.className='EFormTableRow';\" onclick=\"LoadDataEntryForm('Comorbidities', '" + dr[Comorbidity.ComorbidityId].ToString() + "', '')\">");
                    sb.Append("<td align=center valign=middle class=\"FormInsideTableLeftCell\">");
                    sb.Append(dr[Comorbidity.ComorbDateText].ToString());
                    sb.Append("&#160;</td>");

                    sb.Append("<td align=center valign=middle class=\"FormInsideTableRegCell\">");
                    sb.Append(dr[Comorbidity.Comorbidity_Field].ToString());
                    sb.Append("&#160;</td>");

                    sb.Append("<td align=center valign=middle class=\"FormInsideTableRegCell\">");
                    sb.Append(dr[Comorbidity.ComorbNotes].ToString());
                    sb.Append("&#160;</td>");
                    sb.Append("</tr>");
                }
                AddTransformArgument("ComorbidityRows", "", sb.ToString());




                StringBuilder sb2 = new StringBuilder();

                DataView comorbiditiesDv = new DataView(comorbiditiesDs.Tables[0]);
                comorbiditiesDv.Sort = Comorbidity.ComorbDate + " DESC ";
                comorbiditiesDv = GetTopDataViewRows(comorbiditiesDv, 10);
                comorbiditiesDv.Sort = Comorbidity.ComorbDate + " ASC, " + Comorbidity.Comorbidity_Field + " ASC ";

                if (comorbiditiesDs.Tables[0].Rows.Count > 10)
                {
                    sb2.Append("<tr class=\"EFormTableRow\" align=center style=\"background-color: #A8A8A8;\">");
                    sb2.Append("<td colspan=\"2\" align=\"center\" valign=\"middle\" class=\"FormInsideTableLeftCell\" >");
                    sb2.Append("<i>most recent 10&#160;</i></td>");
                    sb2.Append("</tr>");
                }

                foreach (DataRow dr2 in comorbiditiesDv.ToTable().Rows)
                {
                    sb2.Append("<tr class=\"EFormTableRow\" onmouseover=\"this.className='chronListHilighted';\" onmouseout=\"this.className='EFormTableRow';\" onclick=\"LoadDataEntryForm('Comorbidities', '" + dr2[Comorbidity.ComorbidityId].ToString() + "', '')\">");
                    sb2.Append("<td align=center valign=middle class=\"FormInsideTableRegCell\">");
                    sb2.Append(dr2[Comorbidity.Comorbidity_Field].ToString());
                    sb2.Append("&#160;</td>");

                    sb2.Append("<td align=center valign=middle class=\"FormInsideTableRegCell\">");
                    sb2.Append(dr2[Comorbidity.ComorbNotes].ToString());
                    sb2.Append("&#160;</td>");
                    sb2.Append("</tr>");
                }
                AddTransformArgument("ComorbidityHxLS", "", sb2.ToString());


                StringBuilder sb3 = new StringBuilder();

                foreach (DataRow dr in comorbiditiesDs.Tables[0].Rows)
                {
                    sb3.Append("<tr onmouseover=\"this.className='chronListHilighted';\" onmouseout=\"this.className='';\" onclick=\"LoadDataEntryForm('Comorbidities', '" + dr[Comorbidity.ComorbidityId].ToString() + "', '')\">");
                    sb3.Append("<td >");
                    sb3.Append(dr[Comorbidity.ComorbDateText].ToString());
                    sb3.Append("</td>");

                    sb3.Append("<td >");
                    sb3.Append(dr[Comorbidity.Comorbidity_Field].ToString());
                    sb3.Append("</td>");
                    sb3.Append("</tr>");
                }
                AddTransformArgument("ComorbidityGUProstateFURows", "", sb3.ToString());





            }

        }


        private void AddToxicityParams()
        {

            ToxicityDa da = new ToxicityDa();
            DataSet ds = da.FormListToxicities(base.EFormPatientId, "", "Dynamic", "");

            if (ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
            {
                StringBuilder sb = new StringBuilder();

                foreach (DataRow dr in ds.Tables[0].Rows)
                {
                    sb.Append("<tr class=\"EFormTableRow\" onmouseover=\"this.className='chronListHilighted';\" onmouseout=\"this.className='EFormTableRow';\" onclick=\"LoadDataEntryForm('Toxicities', '" + dr[Toxicity.ToxicityId].ToString() + "', '')\">");

                    sb.Append("<td align=center valign=middle class=\"FormInsideTableLeftCell\">");
                    sb.Append(dr[Toxicity.ToxDateText].ToString());
                    sb.Append("&#160;</td>");

                    sb.Append("<td align=center valign=middle class=\"FormInsideTableRegCell\">");
                    sb.Append(dr[Toxicity.ToxName].ToString());
                    sb.Append("&#160;</td>");

                    sb.Append("<td align=center valign=middle class=\"FormInsideTableRegCell\">");
                    sb.Append(dr[Toxicity.ToxNotes].ToString());
                    sb.Append("&#160;</td>");

                    sb.Append("</tr>");
                }

                AddTransformArgument("ToxicityRows", "", sb.ToString());
            }

            DataView toxLiverDv = new DataView(ds.Tables[0]);

            if (toxLiverDv.Count > 0)
            {
                StringBuilder sb2 = new StringBuilder();

                if (toxLiverDv.Count > 10)
                {
                    sb2.Append("<tr class=\"EFormTableRow\" align=center style=\"background-color: #A8A8A8;\">");
                    sb2.Append("<td colspan=\"3\" align=\"center\" valign=\"middle\" class=\"FormInsideTableLeftCell\" >");
                    sb2.Append("<i>most recent 10&#160;</i></td>");
                    sb2.Append("</tr>");
                }

                toxLiverDv.Sort = Toxicity.ToxDate + " DESC ";
                toxLiverDv = GetTopDataViewRows(toxLiverDv, 10);
                toxLiverDv.Sort = Toxicity.ToxDate + " ASC ";

                foreach (DataRow dr2 in toxLiverDv.ToTable().Rows)
                {
                    sb2.Append("<tr class=\"EFormTableRow\" onmouseover=\"this.className='chronListHilighted';\" onmouseout=\"this.className='EFormTableRow';\" onclick=\"LoadDataEntryForm('Toxicities', '" + dr2[Toxicity.ToxicityId].ToString() + "', 'ToxDateText,ToxDate,ToxName,ToxNotes')\">");

                    sb2.Append("<td align=center valign=middle class=\"FormInsideTableLeftCell\">");
                    sb2.Append(dr2[Toxicity.ToxDateText].ToString());
                    sb2.Append("&#160;</td>");

                    sb2.Append("<td align=center valign=middle class=\"FormInsideTableRegCell\">");
                    sb2.Append(dr2[Toxicity.ToxName].ToString());
                    sb2.Append("&#160;</td>");

                    sb2.Append("<td align=center valign=middle class=\"FormInsideTableRegCell\">");
                    sb2.Append(dr2[Toxicity.ToxNotes].ToString());
                    sb2.Append("&#160;</td>");

                    sb2.Append("</tr>");

                }
                AddTransformArgument("ToxicityLiverHxLS", "", sb2.ToString());

            }

        }


        private void AddMedicationParams()
        {
            string stopDate = "";

            EFormController ctr = new EFormController();
            DataSet eds = ctr.GetRecord(base.EFormId);

            if (eds.Tables[0].Rows.Count > 0 && eds.Tables[0].Rows[0][Caisis.BOL.EForm.EformApptTime].ToString().Length > 0)
            {
                stopDate = ((DateTime)eds.Tables[0].Rows[0][Caisis.BOL.EForm.EformApptTime]).ToShortDateString(); 
            }

            MedicationDa da = new MedicationDa();
            DataSet ds = da.FormGetRecords(base.EFormPatientId, base.EFormName, "Dynamic", stopDate);

           
            if (ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
            {
                StringBuilder sb = new StringBuilder();

                foreach (DataRow dr in ds.Tables[0].Rows)
                {
                    sb.Append("<tr class=\"EFormTableRow\" onmouseover=\"this.className='chronListHilighted';\" onmouseout=\"this.className='EFormTableRow';\" onclick=\"LoadDataEntryForm('Medications', '" + dr[Medication.MedicationId].ToString() + "', '')\">");

                    sb.Append("<td align=center valign=middle class=\"FormInsideTableLeftCell\">");
                    sb.Append(dr[Medication.Medication_Field].ToString());
                    sb.Append("&#160;</td>");

                    sb.Append("<td align=center valign=middle class=\"FormInsideTableRegCell\">");
                    sb.Append(dr[Medication.MedDose].ToString());
                    sb.Append("&#160;</td>");

                    sb.Append("<td align=center valign=middle class=\"FormInsideTableRegCell\">");
                    sb.Append(dr[Medication.MedUnits].ToString());
                    sb.Append("&#160;</td>");

                    sb.Append("<td align=center valign=middle class=\"FormInsideTableRegCell\">");
                    sb.Append(dr[Medication.MedRoute].ToString());
                    sb.Append("&#160;</td>"); 
                    
                    sb.Append("<td align=center valign=middle class=\"FormInsideTableRegCell\">");
                    sb.Append(dr[Medication.MedSchedule].ToString());
                    sb.Append("&#160;</td>");

                    sb.Append("<td align=center valign=middle class=\"FormInsideTableRegCell\">");
                    sb.Append(dr[Medication.MedDateText].ToString());
                    sb.Append("&#160;</td>");

                    sb.Append("<td align=center valign=middle class=\"FormInsideTableRegCell\">");
                    sb.Append(dr[Medication.MedStopDateText].ToString());
                    sb.Append("&#160;</td>");

                    sb.Append("</tr>");

                }


                StringBuilder sb_BiopsyOfProstate = new StringBuilder();

                foreach (DataRow dr in ds.Tables[0].Rows)
                {
                    sb_BiopsyOfProstate.Append("<tr class=\"EFormTableRow\" onmouseover=\"this.className='chronListHilighted';\" onmouseout=\"this.className='EFormTableRow';\" onclick=\"LoadDataEntryForm('Medications', '" + dr[Medication.MedicationId].ToString() + "', '')\">");

                    sb_BiopsyOfProstate.Append("<td align=center valign=middle class=\"FormInsideTableLeftCell\">");
                    sb_BiopsyOfProstate.Append(dr[Medication.Medication_Field].ToString());
                    sb_BiopsyOfProstate.Append("&#160;</td>");

                    sb_BiopsyOfProstate.Append("<td align=center valign=middle class=\"FormInsideTableRegCell\">");
                    sb_BiopsyOfProstate.Append(dr[Medication.MedDose].ToString());
                    sb_BiopsyOfProstate.Append("&#160;</td>");

                    sb_BiopsyOfProstate.Append("<td align=center valign=middle class=\"FormInsideTableRegCell\">");
                    sb_BiopsyOfProstate.Append(dr[Medication.MedUnits].ToString());
                    sb_BiopsyOfProstate.Append("&#160;</td>");

                    sb_BiopsyOfProstate.Append("<td align=center valign=middle class=\"FormInsideTableRegCell\">");
                    sb_BiopsyOfProstate.Append(dr[Medication.MedSchedule].ToString());
                    sb_BiopsyOfProstate.Append("&#160;</td>");

                    sb_BiopsyOfProstate.Append("<td align=center valign=middle class=\"FormInsideTableRegCell\">");
                    sb_BiopsyOfProstate.Append(dr[Medication.MedDateText].ToString());
                    sb_BiopsyOfProstate.Append("&#160;</td>");

                    sb_BiopsyOfProstate.Append("<td align=center valign=middle class=\"FormInsideTableRegCell\">");
                    sb_BiopsyOfProstate.Append(dr[Medication.MedStopDateText].ToString());
                    sb_BiopsyOfProstate.Append("&#160;</td>");

                    sb_BiopsyOfProstate.Append("</tr>");

                }

                StringBuilder sb_inline = new StringBuilder();
                foreach (DataRow dr in ds.Tables[0].Rows)
                {

                    sb_inline.Append("<span style=\"display: block;\" onmouseover=\"this.className='chronListHilighted';\" onmouseout=\"this.className='EFormTableRow'\" onclick=\"LoadDataEntryForm('Medications', '" + dr[Medication.MedicationId].ToString() + "', '')\" >");
                    sb_inline.Append(dr[Medication.Medication_Field].ToString());
                    sb_inline.Append("&#160;&#160;");
                    sb_inline.Append(dr[Medication.MedDose].ToString());
                    sb_inline.Append("&#160;");
                    sb_inline.Append(dr[Medication.MedUnits].ToString());
                    sb_inline.Append("&#160;&#160;");
                    sb_inline.Append(dr[Medication.MedSchedule].ToString());
                    sb_inline.Append("</span>");
                }




                StringBuilder sb2 = new StringBuilder();
                DataView dv = new DataView(ds.Tables[0]);
                dv.RowFilter = Medication.MedStopDate + " IS NULL OR " + Medication.MedStopDate + " >= '" + DateTime.Now + "' ";
                dv.Sort = Medication.MedType + " ASC, " + Medication.MedDate + " ASC ";

                foreach (DataRowView dr2 in dv)
                {
                    // create string for MedicationTablePS table, for Pharmaceutical History Eform
                    sb2.Append("<tr class=\"EFormTableRow\" onmouseover=\"this.className='chronListHilighted';\" onmouseout=\"this.className='EFormTableRow';\" onclick=\"LoadDataEntryForm('Medications', '" + dr2[Medication.MedicationId].ToString() + "', '')\">");

                    sb2.Append("<td align=center valign=middle class=\"FormInsideTableLeftCell\">");
                    sb2.Append(dr2[Medication.Medication_Field].ToString());
                    sb2.Append("&#160;</td>");

                    sb2.Append("<td align=center valign=middle class=\"FormInsideTableRegCell\">");
                    sb2.Append(dr2[Medication.MedDose].ToString() + " " + dr2[Medication.MedUnits].ToString());
                    sb2.Append("&#160;</td>");

                    sb2.Append("<td align=center valign=middle class=\"FormInsideTableRegCell\">");
                    sb2.Append(dr2[Medication.MedRoute].ToString());
                    sb2.Append("&#160;</td>");

                    sb2.Append("<td align=center valign=middle class=\"FormInsideTableRegCell\">");
                    sb2.Append(dr2[Medication.MedSchedule].ToString());
                    sb2.Append("&#160;</td>");

                    sb2.Append("<td align=center valign=middle class=\"FormInsideTableRegCell\">");
                    sb2.Append(dr2[Medication.MedDateText].ToString());
                    sb2.Append("&#160;</td>");

                    sb2.Append("<td align=center valign=middle class=\"FormInsideTableRegCell\">");
                    sb2.Append(dr2[Medication.MedStopDateText].ToString());
                    sb2.Append("&#160;</td>");

                    sb2.Append("<td align=center valign=middle class=\"FormInsideTableRegCell\">");
                    sb2.Append(dr2[Medication.MedNotes].ToString());
                    sb2.Append("&#160;</td>");

                    sb2.Append("</tr>");
                }
				
				
				StringBuilder sb3 = new StringBuilder();
                DataView dv3 = new DataView(ds.Tables[0]);
                dv3.RowFilter = Medication.MedStopDate + " IS NULL OR " + Medication.MedStopDate + " >= '" + DateTime.Now + "' ";
                dv3.Sort = Medication.MedType + " ASC, " + Medication.MedDate + " ASC ";

                foreach (DataRowView dr3 in dv3)
                {
                    sb3.Append("<tr class=\"EFormTableRow\" onmouseover=\"this.className='chronListHilighted';\" onmouseout=\"this.className='EFormTableRow';\" onclick=\"LoadDataEntryForm('Medications', '" + dr3[Medication.MedicationId].ToString() + "', '')\">");

                    sb3.Append("<td align=center valign=middle class=\"FormInsideTableLeftCell\"  style=\"height: 26px;\" >");
                    sb3.Append(dr3[Medication.Medication_Field].ToString());
                    sb3.Append("&#160;</td>");

                    sb3.Append("<td align=center valign=middle class=\"FormInsideTableRegCell\">");
                    sb3.Append(dr3[Medication.MedDose].ToString() + "&#160;" + dr3[Medication.MedUnits].ToString());
                    sb3.Append("</td>");

                    sb3.Append("<td align=center valign=middle class=\"FormInsideTableRegCell\">");
                    sb3.Append(dr3[Medication.MedSchedule].ToString());
                    sb3.Append("&#160;</td>");

                    sb3.Append("<td align=center valign=middle class=\"FormInsideTableRegCell\">");
                    sb3.Append(dr3[Medication.MedIndication].ToString());
                    sb3.Append("&#160;</td>"); 

                    sb3.Append("<td align=center valign=middle class=\"FormInsideTableRegCell\">");
                    sb3.Append(dr3[Medication.MedRoute].ToString());
                    sb3.Append("&#160;</td>"); 
                    
                    sb3.Append("<td align=center valign=middle class=\"FormInsideTableRegCell\">");
                    sb3.Append(dr3[Medication.MedDateText].ToString());
                    sb3.Append("&#160;</td>");

                    sb3.Append("<td align=center valign=middle class=\"FormInsideTableRegCell\">");
                    sb3.Append(dr3[Medication.MedStopDateText].ToString());
                    sb3.Append("&#160;</td>");

                    sb3.Append("</tr>");

                }


                // GU Home Medications List includes Oral MedTx records.
                StringBuilder sb4 = new StringBuilder();
                ds.Tables[0].Columns.Add("MedTableType");

                foreach (DataRow dr in ds.Tables[0].Rows)
                {
                    dr["MedTableType"] = "Medications";
                }

                MedicalTherapyDa medTxDa = new MedicalTherapyDa();
                DataSet medTxDs = medTxDa.FormGetRecords(base.EFormPatientId, base.EFormName, "Dynamic");

                if (medTxDs.Tables.Count > 0 && medTxDs.Tables[0].Rows.Count > 0)
                {

                    string medTxFilterStopDate = stopDate;
                    if (medTxFilterStopDate.Length < 1) medTxFilterStopDate = DateTime.Now.ToShortDateString();


                    DataView medTxDv = new DataView(medTxDs.Tables[0]);
                    string filter = "(MedTxRoute = 'Orally') AND (Isnull(MedTxStopDateText,'') = '')";
                    medTxDv.RowFilter = filter;

                    foreach (DataRowView drv in medTxDv)
                    {
                        DataRow newRow;
                        newRow = ds.Tables[0].NewRow();
                        newRow["Medication"] = drv.Row["MedTxAgent"];
                        newRow["MedDose"] = drv.Row["MedTxDose"];
                        newRow["MedUnits"] = drv.Row["MedTxUnits"];
                        newRow["MedSchedule"] = drv.Row["MedTxSchedule"];
                        newRow["MedIndication"] = drv.Row["MedTxIndication"];
                        newRow["MedRoute"] = drv.Row["MedTxRoute"];
                        newRow["MedDateText"] = drv.Row["MedTxDateText"];
                        newRow["MedDate"] = drv.Row["MedTxDate"];
                        newRow["MedStopDateText"] = drv.Row["MedTxStopDateText"];
                        newRow["MedicationId"] = drv.Row["MedicalTherapyId"];
                        newRow["MedTableType"] = "MedicalTherapy";
                        ds.Tables[0].Rows.Add(newRow);
                    }

                }



                DataView dv4 = new DataView(ds.Tables[0]);
                dv4.RowFilter = Medication.MedStopDate + " IS NULL OR " + Medication.MedStopDate + " >= '" + DateTime.Now + "' ";
                dv4.Sort = "MedDate, MedStopDate, Medication";

                foreach (DataRowView dr4 in dv4)
                {
                    sb4.Append("<tr class=\"EFormTableRow\" onmouseover=\"this.className='chronListHilighted';\" onmouseout=\"this.className='EFormTableRow';\" onclick=\"LoadDataEntryForm('" + dr4["MedTableType"] + "', '" + dr4[Medication.MedicationId].ToString() + "', '')\">");

                    sb4.Append("<td align=center valign=middle class=\"FormInsideTableLeftCell\"  style=\"height: 26px;\" >");
                    sb4.Append(dr4[Medication.Medication_Field].ToString());
                    sb4.Append("&#160;</td>");

                    sb4.Append("<td align=center valign=middle class=\"FormInsideTableRegCell\">");
                    sb4.Append(dr4[Medication.MedDose].ToString() + "&#160;" + dr4[Medication.MedUnits].ToString());
                    sb4.Append("</td>");

                    sb4.Append("<td align=center valign=middle class=\"FormInsideTableRegCell\">");
                    sb4.Append(dr4[Medication.MedSchedule].ToString());
                    sb4.Append("&#160;</td>");

                    sb4.Append("<td align=center valign=middle class=\"FormInsideTableRegCell\">");
                    sb4.Append(dr4[Medication.MedIndication].ToString());
                    sb4.Append("&#160;</td>");

                    sb4.Append("<td align=center valign=middle class=\"FormInsideTableRegCell\">");
                    sb4.Append(dr4[Medication.MedRoute].ToString());
                    sb4.Append("&#160;</td>");

                    sb4.Append("<td align=center valign=middle class=\"FormInsideTableRegCell\">");
                    sb4.Append(dr4[Medication.MedDateText].ToString());
                    sb4.Append("&#160;</td>");

                    sb4.Append("<td align=center valign=middle class=\"FormInsideTableRegCell\">");
                    sb4.Append(dr4[Medication.MedStopDateText].ToString());
                    sb4.Append("&#160;</td>");

                    sb4.Append("</tr>");

                }
                // !!!!!!!!!!!!!!! be careful adding any parameters after sb4 / MedicationRowsGUHML, as MedTx records are inserted into the medications result set.

                AddTransformArgument("MedicationRows", "", sb.ToString());
                AddTransformArgument("MedicationsRowsPH", "", sb2.ToString());
                AddTransformArgument("MedicationsRowsPDS", "", sb2.ToString());
				AddTransformArgument("MedicationRowsHML", "", sb3.ToString());
                AddTransformArgument("MedicationRowsBiopsyOfProstate", "", sb_BiopsyOfProstate.ToString());
                AddTransformArgument("MedicationRowsGUHML", "", sb4.ToString());
                AddTransformArgument("MedicationRowsInline", "", sb_inline.ToString());
            }
        }


        /// <summary>
        /// Adds "AllergyRows" which includes Allergen and AllergyResponse
        /// </summary>
        private void AddAllergiesParams()
        {

            AllergyDa da = new AllergyDa();
            DataSet ds = da.FormGetRecords(base.EFormPatientId, "", "Dynamic");

            if (ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
            {
                StringBuilder sb = new StringBuilder();
                StringBuilder sb2 = new StringBuilder();
                StringBuilder sb3 = new StringBuilder();


                foreach (DataRow dr in ds.Tables[0].Rows)
                {
                    sb.Append("<tr class=\"EFormTableRow\" onmouseover=\"this.className='chronListHilighted';\" onmouseout=\"this.className='EFormTableRow';\" onclick=\"LoadDataEntryForm('Allergies', '" + dr[Allergy.AllergyId].ToString() + "', '" + Allergy.Allergen + "," + Allergy.AllergyResponse + "')\">");

                    sb.Append("<td align=center valign=middle class=\"FormInsideTableLeftCell\">");
                    sb.Append(dr[Allergy.Allergen].ToString());
                    sb.Append("&#160;</td>");

                    sb.Append("<td align=center valign=middle class=\"FormInsideTableRegCell\">");
                    sb.Append(dr[Allergy.AllergyResponse].ToString());
                    sb.Append("&#160;</td>");

                    sb.Append("</tr>");

                    sb2.Append(dr[Allergy.Allergen].ToString() + ",");


                    string a = "";
                    if (dr[Allergy.AllergyResponse].ToString() != null && dr[Allergy.AllergyResponse].ToString().Length > 0)
                    {
                        if (dr[Allergy.AllergyResponse].ToString().ToUpper() == "OTHER" && dr[Allergy.AllergyNotes].ToString() != null && dr[Allergy.AllergyNotes].ToString().Length > 0)
                        {
                            a = "(" + dr[Allergy.AllergyNotes].ToString() + ")";
                        }
                        else
                        {
                            a = "(" + dr[Allergy.AllergyResponse].ToString() + ")";
                        }
                    }
                    sb3.Append(dr[Allergy.Allergen].ToString() + " " + a + ",");
                }

                AddTransformArgument("AllergyRows", "", sb.ToString());
                AddTransformArgument("AllergyString", "", sb2.ToString().TrimEnd(','));
                AddTransformArgument("AllergyGUString", "", sb3.ToString().TrimEnd(','));
            }
        }


        /// <summary>
        /// Adds "ComorbidityRows" which includes comorbidity, date, and notes as a parameter in <tr><td></td></tr> format
        /// </summary>
        private void AddLabTestParams()
        {

            LabTestDa ltDa = new LabTestDa();
            DataSet ltDs = ltDa.FormGetRecords(base.EFormPatientId, "", "Dynamic");

            if (ltDs.Tables.Count > 0 && ltDs.Tables[0].Rows.Count > 0)
            {
                StringBuilder sb = new StringBuilder();
                StringBuilder sb2 = new StringBuilder();

                foreach (DataRow dr in ltDs.Tables[0].Rows)
                {
                    sb.Append("<tr class=\"EFormTableRow\" onmouseover=\"this.className='chronListHilighted';\" onmouseout=\"this.className='EFormTableRow';\" onclick=\"LoadDataEntryForm('LabTests', '" + dr[LabTest.LabTestId].ToString() + "', 'LabDateText,LabTest,LabResult,LabUnits,LabQuality')\">");

                    sb.Append("<td align=center valign=middle class=\"FormInsideTableLeftCell\">");
                    sb.Append(dr[LabTest.LabDateText].ToString());
                    sb.Append("&#160;</td>");

                    sb.Append("<td align=center valign=middle class=\"FormInsideTableRegCell\">");
                    sb.Append(dr[LabTest.LabTest_Field].ToString());
                    sb.Append("&#160;</td>");

                    sb.Append("<td align=center valign=middle class=\"FormInsideTableRegCell\">");
                    sb.Append(dr[LabTest.LabResult].ToString());
                    sb.Append("&#160;</td>");

                    sb.Append("<td align=center valign=middle class=\"FormInsideTableRegCell\">");
                    sb.Append(dr[LabTest.LabQuality].ToString());
                    sb.Append("&#160;</td>");

                    sb.Append("</tr>");

                    sb2.Append("<span class=\"EFormTableRow\" onmouseover=\"this.className='chronListHilighted';\" onmouseout=\"this.className='EFormTableRow';\" onclick=\"LoadDataEntryForm('LabTests', '" + dr[LabTest.LabTestId].ToString() + "', 'LabDateText,LabTest,LabResult,LabUnits,LabQuality')\">");
                    sb2.Append(dr[LabTest.LabDateText].ToString());
                    sb2.Append("&#160;&#160;&#160;&#160;&#160;");
                    sb2.Append(dr[LabTest.LabTest_Field].ToString());
                    sb2.Append("&#160;&#160;&#160;&#160;&#160;");
                    sb2.Append(dr[LabTest.LabResult].ToString());
                    sb2.Append("&#160;&#160;&#160;&#160;&#160;");
                    sb2.Append(dr[LabTest.LabQuality].ToString());
                    sb2.Append("</span><br/>");
                }

                AddTransformArgument("LabTestRows", "", sb.ToString());
                AddTransformArgument("LabTestGURows", "", sb2.ToString());
            }


            LabTestDa allLtDa = new LabTestDa();
            DataSet allLtDs = allLtDa.FormGetAllLabs(base.EFormPatientId, base.EFormName, "Dynamic");

            if (allLtDs.Tables.Count > 0 && allLtDs.Tables[0].Rows.Count > 0)
            {
                StringBuilder sb2 = new StringBuilder();

                foreach (DataRow dr2 in allLtDs.Tables[0].Rows)
                {
                    sb2.Append("<tr class=\"EFormTableRow\" onmouseover=\"this.className='chronListHilighted';\" onmouseout=\"this.className='EFormTableRow';\" onclick=\"LoadDataEntryForm('LabTests', '" + dr2[LabTest.LabTestId].ToString() + "', 'LabDateText,LabTest,LabResult,LabUnits,LabQuality')\">");

                    sb2.Append("<td align=center valign=middle class=\"FormInsideTableLeftCell\">");
                    sb2.Append(dr2[LabTest.LabDateText].ToString());
                    sb2.Append("&#160;</td>");

                    sb2.Append("<td align=center valign=middle class=\"FormInsideTableRegCell\">");
                    sb2.Append(dr2[LabTest.LabTest_Field].ToString());
                    sb2.Append("&#160;</td>");

                    sb2.Append("<td align=center valign=middle class=\"FormInsideTableRegCell\">");
                    sb2.Append(dr2[LabTest.LabResult].ToString());
                    sb2.Append("&#160;</td>");

                    sb2.Append("<td align=center valign=middle class=\"FormInsideTableRegCell\">");
                    sb2.Append(dr2[LabTest.LabQuality].ToString());
                    sb2.Append("&#160;</td>");

                    sb2.Append("</tr>");
                }

                AddTransformArgument("LabTestRowsAll", "", sb2.ToString());
            }

            DataView labDv = new DataView(allLtDs.Tables[0]);

            if (labDv.Count > 0)
            {
                StringBuilder sb3 = new StringBuilder();

                if (labDv.Count > 10)
                {
                    sb3.Append("<tr class=\"EFormTableRow\" align=center style=\"background-color: #A8A8A8;\">");
                    sb3.Append("<td colspan=\"5\" align=\"center\" valign=\"middle\" class=\"FormInsideTableLeftCell\" >");
                    sb3.Append("<i>most recent 10&#160;</i></td>");
                    sb3.Append("</tr>");
                }

                labDv.Sort = LabTest.LabDate + " DESC ";
                labDv = GetTopDataViewRows(labDv, 10);
                labDv.Sort = LabTest.LabDate + " ASC ";

                foreach (DataRow dr3 in labDv.ToTable().Rows)
                {
                    sb3.Append("<tr class=\"EFormTableRow\" onmouseover=\"this.className='chronListHilighted';\" onmouseout=\"this.className='EFormTableRow';\" onclick=\"LoadDataEntryForm('LabTests', '" + dr3[LabTest.LabTestId].ToString() + "', 'LabDateText,LabTest,LabResult,LabUnits,LabNotes')\">");

                    sb3.Append("<td align=center valign=middle class=\"FormInsideTableLeftCell\">");
                    sb3.Append(dr3[LabTest.LabDateText].ToString());
                    sb3.Append("&#160;</td>");

                    sb3.Append("<td align=center valign=middle class=\"FormInsideTableRegCell\">");
                    sb3.Append(dr3[LabTest.LabTest_Field].ToString());
                    sb3.Append("&#160;</td>");

                    sb3.Append("<td align=center valign=middle class=\"FormInsideTableRegCell\">");
                    sb3.Append(dr3[LabTest.LabResult].ToString());
                    sb3.Append("&#160;</td>");

                    sb3.Append("<td align=center valign=middle class=\"FormInsideTableRegCell\">");
                    sb3.Append(dr3[LabTest.LabUnits].ToString());
                    sb3.Append("&#160;</td>");
                    
                    sb3.Append("<td align=center valign=middle class=\"FormInsideTableRegCell\">");
                    sb3.Append(dr3[LabTest.LabNotes].ToString());
                    sb3.Append("&#160;</td>");

                    sb3.Append("</tr>");
                }
                AddTransformArgument("LabsLiverHxLS", "", sb3.ToString());

            }
        }

        private void AddLabTestParams2()
        {

            LabTestDa ltDa = new LabTestDa();
            DataSet ltDs = ltDa.FormGetAllLabs(base.EFormPatientId, base.EFormName, "Dynamic");

            if (ltDs.Tables.Count > 0 && ltDs.Tables[0].Rows.Count > 0)
            {
                StringBuilder sb = new StringBuilder();

                foreach (DataRow dr in ltDs.Tables[0].Rows)
                {
                    sb.Append("<tr class=\"EFormTableRow\" onmouseover=\"this.className='chronListHilighted';\" onmouseout=\"this.className='EFormTableRow';\" onclick=\"LoadDataEntryForm('LabTests', '" + dr[LabTest.LabTestId].ToString() + "', 'LabDateText,LabTest,LabResult,LabUnits,LabQuality')\">");

                    sb.Append("<td align=center valign=middle class=\"FormInsideTableLeftCell\">");
                    sb.Append(dr[LabTest.LabDateText].ToString());
                    sb.Append("&#160;</td>");

                    sb.Append("<td align=center valign=middle class=\"FormInsideTableRegCell\">");
                    sb.Append(dr[LabTest.LabTest_Field].ToString());
                    sb.Append("&#160;</td>");

                    sb.Append("<td align=center valign=middle class=\"FormInsideTableRegCell\">");
                    sb.Append(dr[LabTest.LabResult].ToString());
                    sb.Append("&#160;</td>");

                    sb.Append("<td align=center valign=middle class=\"FormInsideTableRegCell\">");
                    sb.Append(dr[LabTest.LabUnits].ToString());
                    sb.Append("</td>");
                }
                AddTransformArgument("LabTestRowsAll2", "", sb.ToString());
            }


            DataView labsPDSDv = new DataView(ltDs.Tables[0]);

            // retrieve the date the eform was created
            EFormsDa eformDa = new EFormsDa();
            DataSet eformDs = eformDa.GetEformsRecord(this.EFormId);
            DataView eformDv = new DataView(eformDs.Tables[0]);

            string oneWeekPriorText = String.Empty;
            if (eformDv.Count > 0)
            {
                TimeSpan oneWeek = new TimeSpan(7, 0, 0, 0);
                DateTime oneWeekPrior = DateTime.Parse(eformDv[0][EForm.EnteredTime].ToString()).Subtract(oneWeek);
                oneWeekPriorText = oneWeekPrior.ToShortDateString();
                labsPDSDv.RowFilter = LabTest.LabDate + " >= '" + oneWeekPriorText + "' ";
            }

            if (labsPDSDv.Count > 0)
            {
                StringBuilder sb2 = new StringBuilder();

                // create lab tests for Medical Disharge Summary eform
                if (!String.IsNullOrEmpty(oneWeekPriorText))
                    sb2.Append("<tr class=\"EFormTableRow\"><td colspan=\"5\" align=center style=\"background-color: #A8A8A8;\"><i>Lab Tests since " + oneWeekPriorText + "<i/></td></tr>");

                foreach (DataRowView drv in labsPDSDv)
                {
                    sb2.Append("<tr class=\"EFormTableRow\" onmouseover=\"this.className='chronListHilighted';\" onmouseout=\"this.className='EFormTableRow';\" onclick=\"LoadDataEntryForm('LabTests', '" + drv[LabTest.LabTestId].ToString() + "', 'LabDateText,LabTest,LabResult,LabUnits,LabQuality')\">");

                    sb2.Append("<td align=center valign=middle class=\"FormInsideTableLeftCell\">");
                    sb2.Append(drv[LabTest.LabDateText].ToString());
                    sb2.Append("&#160;</td>");

                    sb2.Append("<td align=center valign=middle class=\"FormInsideTableRegCell\">");
                    sb2.Append(drv[LabTest.LabTest_Field].ToString());
                    sb2.Append("&#160;</td>");

                    sb2.Append("<td align=center valign=middle class=\"FormInsideTableRegCell\">");
                    sb2.Append(drv[LabTest.LabResult].ToString());
                    sb2.Append("&#160;</td>");

                    sb2.Append("<td align=center valign=middle class=\"FormInsideTableRegCell\">");
                    sb2.Append(drv[LabTest.LabUnits].ToString());
                    sb2.Append("&#160;</td>");

                    sb2.Append("<td align=center valign=middle class=\"FormInsideTableRegCell\">");
                    sb2.Append(drv[LabTest.LabQuality].ToString());
                    sb2.Append("&#160;</td>");

                    sb2.Append("</tr>");

                }


                AddTransformArgument("LabTablePDSHistory", "", sb2.ToString());
            }


            DataView labsPreOpDv = new DataView(ltDs.Tables[0]);
            string thirtyDaysPriorText = String.Empty;
            if (eformDv.Count > 0)
            {
                TimeSpan thrityDays = new TimeSpan(30, 0, 0, 0);
                DateTime thrityDaysPrior = DateTime.Parse(eformDv[0][EForm.EnteredTime].ToString()).Subtract(thrityDays);
                thirtyDaysPriorText = thrityDaysPrior.ToShortDateString();
                labsPreOpDv.RowFilter = LabTest.LabDate + " >= '" + thirtyDaysPriorText + "' ";
            }

            if (labsPreOpDv.Count > 0)
            {
                StringBuilder sb3 = new StringBuilder();

                // create lab tests for Pre Op eform
                if (!String.IsNullOrEmpty(thirtyDaysPriorText))
                    sb3.Append("<tr class=\"EFormTableRow\"><td colspan=\"5\" align=center style=\"background-color: #A8A8A8;\"><i>Lab Tests since " + thirtyDaysPriorText + "<i/></td></tr>");

                foreach (DataRowView drv in labsPreOpDv)
                {
                    sb3.Append("<tr class=\"EFormTableRow\" onmouseover=\"this.className='chronListHilighted';\" onmouseout=\"this.className='EFormTableRow';\" onclick=\"LoadDataEntryForm('LabTests', '" + drv[LabTest.LabTestId].ToString() + "', 'LabDateText,LabTest,LabResult,LabUnits,LabQuality')\">");

                    sb3.Append("<td align=center valign=middle class=\"FormInsideTableLeftCell\">");
                    sb3.Append(drv[LabTest.LabDateText].ToString());
                    sb3.Append("&#160;</td>");

                    sb3.Append("<td align=center valign=middle class=\"FormInsideTableRegCell\">");
                    sb3.Append(drv[LabTest.LabTest_Field].ToString());
                    sb3.Append("&#160;</td>");

                    sb3.Append("<td align=center valign=middle class=\"FormInsideTableRegCell\">");
                    sb3.Append(drv[LabTest.LabResult].ToString());
                    sb3.Append("&#160;</td>");

                    sb3.Append("<td align=center valign=middle class=\"FormInsideTableRegCell\">");
                    sb3.Append(drv[LabTest.LabUnits].ToString());
                    sb3.Append("&#160;</td>");

                    sb3.Append("<td align=center valign=middle class=\"FormInsideTableRegCell\">");
                    sb3.Append(drv[LabTest.LabQuality].ToString());
                    sb3.Append("&#160;</td>");

                    sb3.Append("</tr>");

                }


                AddTransformArgument("LabTablePreOpHistory", "", sb3.ToString());
            }



            // GU EForm
            DataView GUEFormLabsDv = new DataView(ltDs.Tables[0]);
            GUEFormLabsDv.RowFilter = BOL.LabTest.LabTest_Field + " IN ('WBC', 'ANEUT', 'CREAT', 'HGB', 'UNVPLT')";
            DataView GUEFormDv = new DataView(eformDs.Tables[0]);


            if (GUEFormDv.Count > 0 && GUEFormLabsDv.Count > 0)
            {
                DateTime EFormEnteredDate = DateTime.Parse(eformDv[0][EForm.EnteredTime].ToString()).Date;
                DateTime LastLabTestDate;
                DateTime GULabDate;

                if (DateTime.TryParse(GUEFormLabsDv[GUEFormLabsDv.Count - 1][BOL.LabTest.LabDate].ToString(), out LastLabTestDate))
                {
                    GULabDate = (LastLabTestDate <= EFormEnteredDate) ? LastLabTestDate : EFormEnteredDate;
                }
                else
                {
                    GULabDate = EFormEnteredDate;
                }
 
                _xslArgs.AddParam("LabTestOnEFormDate_WBC", "", GetLabResultOnDate(GUEFormLabsDv, GULabDate, "WBC"));
                _xslArgs.AddParam("LabTestOnEFormDate_ANEUT", "", GetLabResultOnDate(GUEFormLabsDv, GULabDate, "ANEUT"));
                _xslArgs.AddParam("LabTestOnEFormDate_CREAT", "", GetLabResultOnDate(GUEFormLabsDv, GULabDate, "CREAT"));
                _xslArgs.AddParam("LabTestOnEFormDate_HGB", "", GetLabResultOnDate(GUEFormLabsDv, GULabDate, "HGB"));
                _xslArgs.AddParam("LabTestOnEFormDate_UNVPLT", "", GetLabResultOnDate(GUEFormLabsDv, GULabDate, "UNVPLT"));
                _xslArgs.AddParam("LabTestOnEFormDate_DateText", "", GULabDate.ToShortDateString());

            }  
        }

        protected string GetLabResultOnDate(DataView LabsDv, DateTime EFormDate, string LabTestType)
        {
            string result = "";
            LabsDv.RowFilter = LabTest.LabDate + " = '" + EFormDate + "' AND " + LabTest.LabTest_Field + " = '" + LabTestType + "'";

            if (LabsDv.Count > 0)
            {
                result = LabsDv[0][LabTest.LabResult].ToString() + " " + LabsDv[0][LabTest.LabUnits].ToString();
            }


            return result;

        }



        /// <summary>
        /// Adds HPI to Xsl parameters
        /// </summary>
        /// <param name="hpiDs"></param>
        private void AddHpiParam(DataSet hpiDs)
        {
            if (hpiDs.Tables.Count > 0 && hpiDs.Tables[0].Rows.Count > 0)
            {
                DataTable HpiDt = hpiDs.Tables[0];

                StringBuilder sb = new StringBuilder();

                int startNextRowAt = 12;

                int rowIndex = 0;

                sb.Append("<table cellspacing=0><tr><td>&nbsp;</td><td valign=top>");

                foreach (DataRow dr in HpiDt.Rows)
                {
                    if (rowIndex == startNextRowAt || rowIndex == startNextRowAt * 2)
                    {
                        sb.Append("</td><td valign=top>");
                    }

                    sb.Append(dr["patientHPI"].ToString() + "<br/>");

                    rowIndex++;
                }

                sb.Append("</td><td>&nbsp;</td></tr></table>");

                AddTransformArgument("Hpi", "", sb.ToString());
            }
        }



        /// <summary>
        /// Adds GU HPI to Xsl parameters
        /// </summary>
        /// 
        private void AddGUHpiParam()
        {
            try
            {
                PatientDa hpiDa = new PatientDa();
                DataSet hpiDs = hpiDa.GetPatientHPIProstateGU(base.EFormPatientId, 1);

                char[] sep1 = { '|' };

                char[] sep2 = { ',' };

                List<XElement> HPIGroupElements = new List<XElement>();

                if (hpiDs.Tables.Count > 0 && hpiDs.Tables[0].Rows.Count > 0)
                {
                    DataTable HpiDt = hpiDs.Tables[0];

                    //StringBuilder sb = new StringBuilder();

                    //int startNextRowAt = 12;

                    //int rowIndex = 0;

                    //sb.Append("<table cellspacing=\"0\"><tr><td>&nbsp;</td><td valign=\"top\">");

                    // list for processing hpi and xml items
                    List<XElement> list = new List<XElement>();

                    // PROCESS DB DATA
                    foreach (DataRow dr in HpiDt.Rows)
                    {

                        // maybe move this into a RowFilter for a DataView later - jf
                        string filter = dr["Filters"].ToString();
                        if (true)
                        {


                            string[] tableNames = dr["TableNames"].ToString().Split(sep2, StringSplitOptions.RemoveEmptyEntries);

                            string[] primaryKeys = dr["PrimaryKeys"].ToString().Split(sep2, StringSplitOptions.RemoveEmptyEntries);

                            string[] hpiItems = dr["patientHPIDelimited"].ToString().Split(sep1, StringSplitOptions.RemoveEmptyEntries);

                            string hpiString = dr["patientHPIDelimited"].ToString();

                            int numberOfHpiItems = primaryKeys.Length;

                            string hpi;
                            if (numberOfHpiItems > 0)
                            {

                                DateTime hpiDate;
                                string hpiDateString = "";
                                // group like items into grouping
                                var grouping = new XElement("HPIGroup");
                                for (int i = 0; i < hpiItems.Length; i++)
                                {
                                    var hpiItem = hpiItems[i];
                                    //                                    string table = tableNames[i];
                                    string table = "";
                                    // this if statement is here to catch the special case of there being a mismatch in the lengths of patientHPIDelimited, tablenames, and primarykeys
                                    if (i < tableNames.Length) table = tableNames[i];

                                    //int priKey;
                                    //bool priKeyIsInt = Int32.TryParse(primaryKeys[i], out priKey);

                                    int priKey;
                                    string priKeyStr = "";
                                    // this extra if statement is here to catch the special case of there being a mismatch in the lengths of patientHPIDelimited, tablenames, and primarykeys
                                    if (i < primaryKeys.Length) priKeyStr = primaryKeys[i];
                                    bool priKeyIsInt = Int32.TryParse(priKeyStr, out priKey);


                                    string endDate = "";
                                    string item = "";


                                    if (priKeyIsInt && tableNames[i].Length > 0)
                                    {

                                        hpi = hpiItem.Replace("__", "");
                                        var pairs = hpi.Split(' ');
                                        // extract dates
                                        if (pairs.First().Contains("-"))
                                        {
                                            var dateField = pairs.First().Split('-');
                                            hpiDateString = dateField.ElementAt(0);
                                            endDate = dateField.ElementAt(1);

                                            item = string.Join(" ", pairs.Skip(1).Take(pairs.Count()).ToArray());
                                        }
                                        else
                                        {
                                            if (pairs.Count() > 0)
                                            {
                                                if (i == 0)
                                                {
                                                    //if (DateTime.TryParse(pairs.First(), out hpiDate))
                                                    if (!string.IsNullOrEmpty(pairs.First()))
                                                    {
                                                        hpiDateString = pairs.First();
                                                        item = string.Join(" ", pairs.Skip(1).Take(pairs.Count()).ToArray());
                                                    }
                                                    else
                                                    {
                                                        item = string.Join(" ", pairs.ToArray());
                                                    }
                                                }
                                                else
                                                {
                                                    item = string.Join(" ", pairs.ToArray());
                                                }
                                            }
                                        }
                                        grouping.Add(new XElement("HPI",
                                                              new XElement("Table", table),
                                                              new XElement("PriKey", priKey.ToString()),
                                                              new XElement("StartDate", hpiDateString),
                                                              new XElement("EndDate", endDate),
                                                              new XElement("Item", item)
                                                          )
                                            );
                                    }
                                }
                                grouping.Add(new XAttribute("HPIDate", hpiDateString));
                                list.Add(grouping);

                            }

                        }
                    }


                    //sb.Append("</td><td>&nbsp;</td></tr></table>");

                    //DataTable dt = hpiDs.Tables[0];

                    // PROCESS XML DATA

                    // mappings: KeyValuePair<table, date sort field>, KeyValuePair<list of fields for display, display format string>
                    var map = new Dictionary<KeyValuePair<string, string>, KeyValuePair<string[], string>>
                 {
                    {
                        new KeyValuePair<string, string>("MedicalTherapy", MedicalTherapy.MedTxDateText),
                        new KeyValuePair<string[], string>(new string[] { MedicalTherapy.MedTxAgent,MedicalTherapy.MedTxDose, MedicalTherapy.MedTxUnits }, "{0} {1} {2}")
                    },
                    {
                        new KeyValuePair<string, string>("RadiationTherapy",  RadiationTherapy.RadTxDateText),
                        new KeyValuePair<string[], string>(new string[] {RadiationTherapy.RadTxType,RadiationTherapy.RadTxTarget,RadiationTherapy.RadTxTotalDose,RadiationTherapy.RadTxUnits,RadiationTherapy.RadTxNumFractions}, "{0} {1} {2} {3} {4}")
                    },
                    {
                        new KeyValuePair<string, string>("BrachyTherapy", BrachyTherapy.BrachyDateText), 
                        new KeyValuePair<string[], string>(new string[] { BrachyTherapy.BrachyPrescribedDose,BrachyTherapy.BrachyIsotope }, "{0} {1}")
                    },
                    {
                        new KeyValuePair<string, string>("Procedures", Procedure.ProcDateText), 
                        new KeyValuePair<string[], string>(new string[] { Procedure.ProcName, Procedure.ProcSide, Procedure.ProcSite}, "{0} {1} {2}")
                    }
                 };

                    // iterate through mapping and build values
                    foreach (var pair in map)
                    {
                        var key = pair.Key;
                        var value = pair.Value;
                        string table = key.Key;
                        var datefield = key.Value;
                        var fields = value.Key;
                        var format = value.Value;
                        var tableNodes = xmlDoc.SelectNodes("//" + table);
                        foreach (XmlNode tableNode in tableNodes)
                        {
                            var tableFields = tableNode.SelectNodes("*[not(*) and string-length(node())!=0]");
                            if (tableFields.Count > 0)
                            {
                                var recordIdValue = tableNode.Attributes["RecordId"].Value;
                                string startDateValue = tableNode.SelectSingleNode(datefield).InnerText;
                                var fieldValues = new string[fields.Length];
                                for (int i = 0; i < fields.Length; i++)
                                {
                                    string field = fields[i];
                                    fieldValues[i] = tableNode.SelectSingleNode(field).InnerText;
                                }

                                string itemValue = string.Format(format, fieldValues);
                                list.Add(new XElement("HPIGroup",
                                            new XAttribute("HPIDate", startDateValue),
                                            new XElement("HPI",
                                                    new XElement("Table", table),
                                                    new XElement("PriKey", string.Empty),
                                                    new XElement("RecordId", recordIdValue),
                                                    new XElement("StartDate", startDateValue),
                                                    new XElement("EndDate", string.Empty),
                                                    new XElement("Item", itemValue))));
                            }
                        }
                    }

                    // FILTER, SORT, SET PARAM

                    // sort helper
                    DateTime d;

                    // filter out merged list, and sort
                    var filteredNodes = from hpiGroup in list
                                        let node = hpiGroup.Descendants("HPI").First()
                                        let startDateValue = node.Element("StartDate").Value
                                        let endDateValue = node.Element("EndDate").Value
                                        let itemValue = node.Element("Item").Value
                                        // filter out nodes without dates or values
                                        where !string.IsNullOrEmpty(startDateValue) || !string.IsNullOrEmpty(endDateValue) || !string.IsNullOrEmpty(itemValue)
                                        // sort by date, pushing empty start dates or non-parseable values to top
                                        let sort = !string.IsNullOrEmpty(startDateValue) && DateTime.TryParse(startDateValue, out d) ? new DateTime(d.Ticks) : DateTime.MinValue
                                        orderby sort ascending
                                        select hpiGroup;

                    // add filtered list of HPI Groups
                    HPIGroupElements.AddRange(filteredNodes);

                }
                // create xml doc for iterating
                XDocument xDoc = new XDocument(new XElement("root", HPIGroupElements));
                XPathNodeIterator HPIItemsParam = xDoc.CreateNavigator().SelectChildren(XPathNodeType.All);
                // add as enumerable param object
                //AddTransformArgument("GUProstateHpi", "", sb.ToString());
                AddTransformArgument("HPIItems", "", HPIItemsParam);
            }
            catch (Exception ex)
            {
                ExceptionHandler.Publish(ex);
            }
        }




        //private void AddNomogramParams(DataSet hpiDs)
        //{
        //    if (hpiDs.Tables.Count > 1 && hpiDs.Tables[1].Rows.Count > 0)
        //    {
        //        AddTransformArgument( "preRPNomo", "", hpiDs.Tables[1].Rows[0]["preRPNomo"].ToString() );
        //        AddTransformArgument( "preXRTNomo", "", hpiDs.Tables[1].Rows[0]["preXRTNomo"].ToString() );
        //        AddTransformArgument( "preBrachyNomo", "", hpiDs.Tables[1].Rows[0]["preBrachyNomo"].ToString() ); 
        //        AddTransformArgument( "postRP7yrNomo", "", hpiDs.Tables[1].Rows[0]["postRP7yrNomo"].ToString() ); 
        //    }
        //}

        private void AddNomogramParams(int patientId)
        {
            NomogramDa nda = new NomogramDa();

            try
            {
                AddTransformArgument("preRP5Nomo", "", ((int)Math.Round(nda.GetPreRPResult(patientId, 5), 0)).ToString());
            }
            catch { }

            try
            {
                AddTransformArgument("preRP10Nomo", "", ((int)Math.Round(nda.GetPreRPResult(patientId, 10), 0)).ToString());
            }
            catch { }

            try
            {
                AddTransformArgument("preXRTNomo", "", ((int)Math.Round(nda.GetPreXRTResult(patientId), 0)).ToString());
            }
            catch { }

            try
            {
                AddTransformArgument("preBrachyNomo", "", ((int)Math.Round(nda.GetPreBrachyResult(patientId), 0)).ToString());
            }
            catch { }

            try
            {
                AddTransformArgument("postRP7yrNomo", "", ((int)Math.Round(nda.GetPostRPResult(patientId, 7), 0)).ToString());
            }
            catch { }

            try
            {
                AddTransformArgument("postRP10yrNomo", "", ((int)Math.Round(nda.GetPostRPResult(patientId, 10), 0)).ToString());
            }
            catch { }

        }

        /// <summary>
        /// Adds Clinical Stage T to Xsl parameters
        /// </summary>
        /// <param name="hpiDs"></param>
        private void AddClinStageTParam(DataSet hpiDs)
        {
            if (hpiDs.Tables.Count > 2 && hpiDs.Tables[2].Rows.Count > 0 && hpiDs.Tables[2].Rows[0]["DxBiopsyId"] != null && hpiDs.Tables[2].Rows[0]["DxBiopsyId"].ToString().Length > 0)
            {
                string ClinStageT = hpiDs.Tables[2].Rows[0]["ClinStage"].ToString();
                AddTransformArgument("ClinStageT", "", ClinStageT);
            }
        }

        /// <summary>
        /// Adds Dx_BxDateText, Dx_BxDate, Dx_BxType, Dx_BxResult, Dx_BxPIN, Dx_BxASAP, Dx_BxGG1, Dx_BxGG2, Dx_BxGGS, Dx_BxGG1_Revd, Dx_BxGG2_Revd, Dx_BxGGS_Revd, Dx_BxPosCores, Dx_BxPosCores_Revd to Xsl parameters
        /// </summary>
        /// <param name="hpiDs">DataSet containing HPI</param>
        private void AddBiopsyParams(DataSet hpiDs)
        {
            if (hpiDs.Tables.Count > 1 && hpiDs.Tables[1].Rows.Count > 0 && hpiDs.Tables[1].Rows[0]["DxBiopsyId"] != null && hpiDs.Tables[1].Rows[0]["DxBiopsyId"].ToString().Length > 0)
            {
                int DxBiopsyId = (int)hpiDs.Tables[1].Rows[0]["DxBiopsyId"];

                // v4 JASON HOW WAS BIOPSY RESTRUCTURED

                /*BiopsyProstateDa bDa = new BiopsyProstateDa();
                DataSet bDs = bDa.GetRecord(DxBiopsyId);

                if (bDs != null && bDs.Tables.Count > 0 && bDs.Tables[0].Rows.Count > 0)
                {
                    string Dx_BxDateText = bDs.Tables[0].Rows[0]["BxDateText"].ToString();
                    AddTransformArgument("Dx_BxDateText", "", Dx_BxDateText);

                    string Dx_BxDate = bDs.Tables[0].Rows[0]["BxDate"].ToString();
                    AddTransformArgument("Dx_BxDate", "", Dx_BxDate);

                    string Dx_BxType = bDs.Tables[0].Rows[0]["BxType"].ToString();
                    AddTransformArgument("Dx_BxType", "", Dx_BxType);

                    string Dx_BxResult = bDs.Tables[0].Rows[0]["BxResult"].ToString();
                    AddTransformArgument("Dx_BxResult", "", Dx_BxResult);

//					string Dx_BxPIN = bDs.Tables[0].Rows[0]["BxPIN"].ToString();
//					AddTransformArgument("Dx_BxPIN", "", Dx_BxPIN);
//
//					string Dx_BxASAP = bDs.Tables[0].Rows[0]["BxASAP"].ToString();
//					AddTransformArgument("Dx_BxASAP", "", Dx_BxASAP);

                    string Dx_BxGG1 = bDs.Tables[0].Rows[0]["BxGG1"].ToString();
                    AddTransformArgument("Dx_BxGG1", "", Dx_BxGG1);

                    string Dx_BxGG2 = bDs.Tables[0].Rows[0]["BxGG2"].ToString();
                    AddTransformArgument("Dx_BxGG2", "", Dx_BxGG2);

                    string Dx_BxGGS = bDs.Tables[0].Rows[0]["BxGGS"].ToString();
                    AddTransformArgument("Dx_BxGGS", "", Dx_BxGGS);

                    string Dx_BxGG1_Revd = bDs.Tables[0].Rows[0]["BxGG1_Revd"].ToString();
                    AddTransformArgument("Dx_BxGG1_Revd", "", Dx_BxGG1_Revd);

                    string Dx_BxGG2_Revd = bDs.Tables[0].Rows[0]["BxGG2_Revd"].ToString();
                    AddTransformArgument("Dx_BxGG2_Revd", "", Dx_BxGG2_Revd);

                    string Dx_BxGGS_Revd = bDs.Tables[0].Rows[0]["BxGGS_Revd"].ToString();
                    AddTransformArgument("Dx_BxGGS_Revd", "", Dx_BxGGS_Revd);

                    string Dx_BxPosCores = bDs.Tables[0].Rows[0]["BxPosCores"].ToString();
                    AddTransformArgument("Dx_BxPosCores", "", Dx_BxPosCores);

                    string Dx_BxPosCores_Revd = bDs.Tables[0].Rows[0]["BxPosCoresRevd"].ToString();
                    AddTransformArgument("Dx_BxPosCores_Revd", "", Dx_BxPosCores_Revd);
               
                }*/

            }
        }


        /// <summary>
        /// Adds PtFirstName, PtLastName, PtMiddleName, PtTitle, PtSuffix, PtMRN, PtAge, PtAddress, and InPtAccountNum to Xsl parameters
        /// </summary>
        private void AddDemographicParams()
        {
            DataRow pRow = null;

            // v3.5
            //PatientDa pDa = new PatientDa();
            //DataSet pDs = pDa.GetRecord(base.EFormPatientId);
            //if (pDs != null && pDs.Tables.Count > 0 && pDs.Tables[0].Rows.Count > 0)
            //{
            //	pRow = pDs.Tables[0].Rows[0];
            //}

            Patient pt = new Patient();
            pt.Get(base.EFormPatientId);

            //if (pt != null && pt.DataSourceView.Count > 0)
			if (!pt.IsEmpty)
            {

                AddTransformArgument("PtFirstName", "", pt["PtFirstName"].ToString());
                AddTransformArgument("PtLastName", "", pt["PtLastName"].ToString());
                AddTransformArgument("PtMiddleName", "", pt["PtMiddleName"].ToString());
                AddTransformArgument("PtTitle", "", pt["PtTitle"].ToString());
                AddTransformArgument("PtSuffix", "", pt["PtSuffix"].ToString());


                PatientController pc = new PatientController();
                UserController uc = new UserController();
                string defaultIdType = uc.GetDefaultIdentifierType();

                // use the default identifier as the patient id for eform transform
                if (!string.IsNullOrEmpty(defaultIdType) && defaultIdType != PatientController.LAST_NAME_MRN_IDENTIFIER)
                {
                    string idValue = pc.GetPatientIdentifier(base.EFormPatientId, defaultIdType);
                    string idTitle = defaultIdType;

                    AddTransformArgument("PtMRNTitle", "", idTitle);

                    if (!string.IsNullOrEmpty(idValue))
                        AddTransformArgument("PtMRN", "", idValue);

                }
                // otherwise default to MRN
                else
                {
                    AddTransformArgument("PtMRNTitle", "", "MRN");
                    AddTransformArgument("PtMRN", "", pt["PtMRN"].ToString());
                }

                AddTransformArgument("PtBirthDate", "", pt["PtBirthDateText"].ToString());
                AddTransformArgument("PtBirthPlace", "", pt["PtBirthPlace"].ToString());
                AddTransformArgument("PtGender", "", pt["PtGender"].ToString());


                string addressString = "";

                if (pt["PtAddress1"].ToString().Length > 0)
                {
                    addressString += pt["PtAddress1"].ToString() + "<BR>";
                }
                if (pt["PtAddress2"].ToString().Length > 0)
                {
                    addressString += pt["PtAddress2"].ToString() + "<BR>";
                }
                if (pt["PtCity"].ToString().Length > 0)
                {
                    addressString += pt["PtCity"].ToString() + ", ";
                }
                if (pt["PtState"].ToString().Length > 0)
                {
                    addressString += pt["PtState"].ToString() + " ";
                }
                if (pt["PtPostalCode"].ToString().Length > 0)
                {
                    addressString += pt["PtPostalCode"].ToString();
                }
                if (addressString.Length > 0)
                {
                    AddTransformArgument("PtAddress", "", addressString);
                }
                if (pt[Patient.PtRace].ToString().Length > 0)
                {
                    AddTransformArgument(Patient.PtRace, "", pt[Patient.PtRace].ToString());
                }
                if (pt[Patient.PtBirthDate].ToString().Length > 0)
                {
                    AddTransformArgument("PtAge", "", base.GetPatientAge((DateTime)pt[Patient.PtBirthDate]));
                }
                string deathYesNo = String.Empty;
                string deathType = String.Empty;
                string deathCause = String.Empty;
                 if (pt[Patient.PtDeathDateText].ToString().Length > 0)
                {
                    deathYesNo = "Yes: " + pt[Patient.PtDeathDateText].ToString();
                    deathType = pt[Patient.PtDeathType].ToString(); 
                    deathCause = pt[Patient.PtDeathCause].ToString();                   
                }
                 else
                     deathYesNo = "No";
                 AddTransformArgument("PtDeathAgePDSHistory", "", deathYesNo.ToString());
                 AddTransformArgument("PtDeathType", "", deathCause.ToString());
                 AddTransformArgument("PtDeathCause", "", deathCause.ToString());


                if (pt["PtMRN"].ToString().Length > 0)
                {
                    InPatientDa piDa = new InPatientDa();
                    DataSet piDs = piDa.GetInPatientsRecordByMRN(pt["PtMRN"].ToString());
                    if (piDs.Tables.Count > 0 && piDs.Tables[0].Rows.Count > 0)
                    {
                        string InPatientAccountNumber = piDs.Tables[0].Rows[0]["InPtAccountNum"].ToString();
                        AddTransformArgument("InPtAccountNum", "", InPatientAccountNumber);
                    }
                }

                // set ramq identifier
                IdentifierDa ptIdDa = new IdentifierDa();
                string ramq = ptIdDa.GetPatientIdentifierByIdType(base.EFormPatientId, "Health Ins Num");
                if (String.IsNullOrEmpty(ramq))
                    ramq = "N/A";
                AddTransformArgument("RAMQIdentifier", "", ramq);

                // set ssn identifier
                string ssn = ptIdDa.GetPatientIdentifierByIdType(base.EFormPatientId, "Social Security Number");
                if (String.IsNullOrEmpty(ssn))
                {
                    ssn = "N/A";
                    AddTransformArgument("HasSSN", "", "No");
                }
                else
                    AddTransformArgument("HasSSN", "", "Yes");

                AddTransformArgument("SSNIdentifier", "", ssn);

                // set todays date
                // retrieve current culture
                /*
                System.Globalization.CultureInfo currentCulture = System.Globalization.CultureInfo.CurrentCulture;
                string todaysDate = String.Empty;
                // if culture is set to "en-US", use 12 hr time, else, use 24hr time
                if (currentCulture.Name.Contains("en-US"))
                    todaysDate = DateTime.Now.ToString("MM/dd/yyyy");
                else
                    todaysDate = DateTime.Now.ToString("MM/dd/yyyy");
                */
                string todayDateString = DateTime.Now.ToShortDateString();
                AddTransformArgument("TodaysDate", "", todayDateString);

            }
        }

        private void AddReferringMDParams()
        {
            PatientPhysicianDa rmdDa = new PatientPhysicianDa();
            DataSet rmdDs = rmdDa.FormGetReferringMDs(base.EFormPatientId, this.EFormName, "Dynamic");

            StringBuilder sb = new StringBuilder();


            if (rmdDs.Tables.Count > 0 && !rmdDs.Tables[0].Rows.Count.Equals(0))
            {
                foreach (DataRow dr in rmdDs.Tables[0].Rows)
                {
                    if (!String.IsNullOrEmpty(sb.ToString()))
                        sb.Append(", ");

                    sb.Append(dr[Physician.PhFirstName].ToString() + " ");
                    sb.Append(dr[Physician.PhLastName].ToString() + " ");
                    if (!String.IsNullOrEmpty(dr[Physician.PhInstitution].ToString()))
                        sb.Append("(" + dr[Physician.PhInstitution].ToString() + ")");

                }
            }

            AddTransformArgument("ReferringMdList", "", sb.ToString());

        }

        /// <summary>
        /// Adds formatted patient physician names, plus physicianid, to Xsl params.
        /// </summary>
        private void AddPatientsPhysiciansParams()
        {

            PatientPhysicianDa rmdDa = new PatientPhysicianDa();
            DataSet rmdDs = rmdDa.FormGetPatientPhysicians(base.EFormPatientId, this.EFormName, "Dynamic");


            StringBuilder sb = new StringBuilder();
            StringBuilder sb2 = new StringBuilder();
            StringBuilder sb3 = new StringBuilder();


            if (rmdDs.Tables.Count > 0 && !rmdDs.Tables[0].Rows.Count.Equals(0))
            {
                foreach (DataRow dr in rmdDs.Tables[0].Rows)
                {                            
                    sb.Append("<tr class=\"EFormTableRow\" onmouseover=\"this.className='chronListHilighted';\" onmouseout=\"this.className='EFormTableRow';\" onclick=\"LoadDataEntryForm('PatientPhysicians', '" + dr[PatientPhysician.PatientPhysicianId].ToString() + "', '')\">");
                    
                    //sb.Append("<td align=\"center\" valign=\"middle\" class=\"FormInsideTableLeftCell\">");
                    //sb.Append(dr[Physician.PhLastName].ToString() + ",  " + dr[Physician.PhFirstName].ToString());
                    //sb.Append("&#160;</td>");

                    sb.Append("<td align=\"center\" valign=\"middle\" class=\"FormInsideTableRegCell\">");
                    sb.Append(dr[PatientPhysician.PtPhRole].ToString());
                    sb.Append("&#160;</td>");

                    //sb.Append("<td align=\"center\" valign=\"middle\" class=\"FormInsideTableRegCell\">");
                    //sb.Append(dr[PatientPhysician.PtPhNotes].ToString());
                    //sb.Append("&#160;</td>");

                    
                    sb.Append("</tr>");

                    sb2.Append("<tr class=\"EFormTableRow\" onmouseover=\"this.className='chronListHilighted';\" onmouseout=\"this.className='EFormTableRow';\" onclick=\"LoadDataEntryForm('PatientPhysicians', '" + dr[PatientPhysician.PatientPhysicianId].ToString() + "', '')\">");

                    sb2.Append("<td align=\"center\" valign=\"middle\" class=\"FormInsideTableLeftCell\">");
                    sb2.Append(dr[Physician.PhLastName].ToString() + ",  " + dr[Physician.PhFirstName].ToString() + " [Specialty: " + dr[Physician.PhSpecialty].ToString() + "]");
                    sb2.Append("&#160;</td>");


                    sb2.Append("</tr>");

                    if (dr[PatientPhysician.PtPhRole].ToString() == "Referring")
                    {
                        sb3.Append("<tr class=\"EFormTableRow\" onmouseover=\"this.className='chronListHilighted';\" onmouseout=\"this.className='EFormTableRow';\" onclick=\"LoadDataEntryForm('PatientPhysicians', '" + dr[PatientPhysician.PatientPhysicianId].ToString() + "', '')\">");
                        sb3.Append("<td align=\"center\" valign=\"middle\" class=\"FormInsideTableLeftCell\">");
                        sb3.Append(dr[Physician.PhLastName].ToString() + ",  " + dr[Physician.PhFirstName].ToString() + " [Specialty: " + dr[Physician.PhSpecialty].ToString() + "]");
                        sb3.Append("&#160;</td>");
                        sb3.Append("</tr>");
                    }
                }
            }

            AddTransformArgument("PatientPhysiciansRows", "", sb.ToString());
            AddTransformArgument("PatientPhysiciansNameKeyRows", "", sb2.ToString());
            AddTransformArgument("PatientPhysiciansReferringNameKeyRows", "", sb3.ToString());

        }


        /// <summary>
        /// Adds "MedicalTherapyRows" in <tr><td></td></tr> format
        /// </summary>
        private void AddMedicalTherapyParams()
        {
            
            MedicalTherapyDa Da = new MedicalTherapyDa();
            DataSet Ds = new DataSet();
            
            Ds = Da.FormGetRecords(this.EFormPatientId, this.EFormName, "Dynamic");

            if (Ds.Tables.Count > 0 && Ds.Tables[0].Rows.Count > 0)
            {
                StringBuilder sb = new StringBuilder();

                foreach (DataRow dr in Ds.Tables[0].Rows)
                {
                    sb.Append("<tr class=\"EFormTableRow\" onmouseover=\"this.className='chronListHilighted';\" onmouseout=\"this.className='EFormTableRow';\" onclick=\"LoadDataEntryForm('MedicalTherapy', '" + dr[MedicalTherapy.MedicalTherapyId].ToString() + "', '')\">");

                    sb.Append("<td align=\"center\" valign=\"middle\" class=\"FormInsideTableLeftCell\">");
                    sb.Append(dr[MedicalTherapy.MedTxDateText].ToString());
                    sb.Append("&#160;</td>");

                    sb.Append("<td align=\"center\" valign=\"middle\" class=\"FormInsideTableRegCell\">");
                    sb.Append(dr[MedicalTherapy.MedTxType].ToString());
                    sb.Append("&#160;</td>");

                    sb.Append("<td align=\"center\" valign=\"middle\" class=\"FormInsideTableRegCell\">");
                    sb.Append(dr[MedicalTherapy.MedTxAgent].ToString());
                    sb.Append("&#160;</td>");

                    sb.Append("<td align=\"center\" valign=\"middle\" class=\"FormInsideTableRegCell\">");
                    sb.Append(dr[MedicalTherapy.MedTxDose].ToString());
                    sb.Append("&#160;</td>");

                    sb.Append("<td align=\"center\" valign=\"middle\" class=\"FormInsideTableRegCell\">");
                    sb.Append(dr[MedicalTherapy.MedTxUnits].ToString());
                    sb.Append("&#160;</td>");

                    sb.Append("<td align=\"center\" valign=\"middle\" class=\"FormInsideTableRegCell\">");
                    sb.Append(dr[MedicalTherapy.MedTxInstitution].ToString());
                    sb.Append("&#160;</td>");

                    sb.Append("<td align=\"center\" valign=\"middle\" class=\"FormInsideTableRegCell\">");
                    sb.Append(dr[MedicalTherapy.MedTxNotes].ToString());
                    sb.Append("&#160;</td>");

                    sb.Append("</tr>");
                }

                AddTransformArgument("MedicalTherapyRows", "", sb.ToString());



                StringBuilder sbTRUSBiopsy = new StringBuilder();

                foreach (DataRow dr in Ds.Tables[0].Rows)
                {
                    sbTRUSBiopsy.Append("<tr class=\"EFormTableRow\" onmouseover=\"this.className='chronListHilighted';\" onmouseout=\"this.className='EFormTableRow';\" onclick=\"LoadDataEntryForm('MedicalTherapy', '" + dr[MedicalTherapy.MedicalTherapyId].ToString() + "', '')\">");

                    sbTRUSBiopsy.Append("<td align=\"center\" valign=\"middle\" class=\"FormInsideTableLeftCell\">");
                    sbTRUSBiopsy.Append(dr[MedicalTherapy.MedTxDateText].ToString());
                    sbTRUSBiopsy.Append("&#160;</td>");

                    sbTRUSBiopsy.Append("<td align=\"center\" valign=\"middle\" class=\"FormInsideTableRegCell\">");
                    sbTRUSBiopsy.Append(dr[MedicalTherapy.MedTxType].ToString());
                    sbTRUSBiopsy.Append("&#160;</td>");

                    sbTRUSBiopsy.Append("<td align=\"center\" valign=\"middle\" class=\"FormInsideTableRegCell\">");
                    sbTRUSBiopsy.Append(dr[MedicalTherapy.MedTxAgent].ToString());
                    sbTRUSBiopsy.Append("&#160;</td>");

                    sbTRUSBiopsy.Append("<td align=\"center\" valign=\"middle\" class=\"FormInsideTableRegCell\">");
                    sbTRUSBiopsy.Append(dr[MedicalTherapy.MedTxDose].ToString());
                    sbTRUSBiopsy.Append("&#160;</td>");

                    sbTRUSBiopsy.Append("<td align=\"center\" valign=\"middle\" class=\"FormInsideTableRegCell\">");
                    sbTRUSBiopsy.Append(dr[MedicalTherapy.MedTxUnits].ToString());
                    sbTRUSBiopsy.Append("&#160;</td>");

                    sbTRUSBiopsy.Append("<td align=\"center\" valign=\"middle\" class=\"FormInsideTableRegCell\">");
                    sbTRUSBiopsy.Append(dr[MedicalTherapy.MedTxInstitution].ToString());
                    sbTRUSBiopsy.Append("&#160;</td>");

                    sbTRUSBiopsy.Append("<td align=\"center\" valign=\"middle\" class=\"FormInsideTableRegCell\">");
                    sbTRUSBiopsy.Append(dr[MedicalTherapy.MedTxNotes].ToString());
                    sbTRUSBiopsy.Append("&#160;</td>");

                    sbTRUSBiopsy.Append("</tr>");
                }

                AddTransformArgument("MedicalTherapyTRUSBiopsyRows", "", sbTRUSBiopsy.ToString());


            }



            Ds = Da.FormGetSpecialRecords(this.EFormPatientId, this.EFormName, "Dynamic", MedicalTherapy.MedTxType, "IN", "'Anti-viral History'");  

            if (Ds.Tables.Count > 0 && Ds.Tables[0].Rows.Count > 0)
            {
                StringBuilder sb4 = new StringBuilder();

                DataView antiViralMedTxDv = new DataView(Ds.Tables[0]);
                antiViralMedTxDv.Sort = MedicalTherapy.MedTxDate + " DESC ";
                antiViralMedTxDv = GetTopDataViewRows(antiViralMedTxDv, 10);
                antiViralMedTxDv.Sort = MedicalTherapy.MedTxDate + " ASC, " + MedicalTherapy.MedTxAgent + " ASC ";

                if (Ds.Tables[0].Rows.Count > 10)
                {
                    sb4.Append("<tr class=\"EFormTableRow\" align=center style=\"background-color: #A8A8A8;\">");
                    sb4.Append("<td colspan=\"4\" align=\"center\" valign=\"middle\" class=\"FormInsideTableLeftCell\" >");
                    sb4.Append("<i>most recent 10&#160;</i></td>");
                    sb4.Append("</tr>");
                }


                foreach (DataRow dr4 in antiViralMedTxDv.ToTable().Rows)
                {
                    sb4.Append("<tr class=\"EFormTableRow\" onmouseover=\"this.className='chronListHilighted';\" onmouseout=\"this.className='EFormTableRow';\" onclick=\"LoadDataEntryForm('MedicalTherapy', '" + dr4[MedicalTherapy.MedicalTherapyId].ToString() + "', 'MedTxDateText,MedTxDate,MedTxType,MedTxAgent,MedTxStopDateText')\">");

                    sb4.Append("<td align=\"center\" valign=\"middle\" class=\"FormInsideTableLeftCell\">");
                    sb4.Append(dr4[MedicalTherapy.MedTxDateText].ToString());
                    sb4.Append("&#160;</td>");

                    sb4.Append("<td align=\"center\" valign=\"middle\" class=\"FormInsideTableRegCell\">");
                    sb4.Append(dr4[MedicalTherapy.MedTxType].ToString());
                    sb4.Append("&#160;</td>");

                    sb4.Append("<td align=\"center\" valign=\"middle\" class=\"FormInsideTableRegCell\">");
                    sb4.Append(dr4[MedicalTherapy.MedTxAgent].ToString());
                    sb4.Append("&#160;</td>");

                    sb4.Append("<td align=\"center\" valign=\"middle\" class=\"FormInsideTableRegCell\">");
                    sb4.Append(dr4[MedicalTherapy.MedTxStopDateText].ToString());
                    sb4.Append("&#160;</td>");

                    sb4.Append("</tr>");
                }

                AddTransformArgument("AntiViralHxLS", "", sb4.ToString());
            }


            Ds = Da.FormGetSpecialRecords(this.EFormPatientId, this.EFormName, "Dynamic", MedicalTherapy.MedTxType, " NOT IN ", "'Anti-viral History'");  
            DataView medTxLiverDv = new DataView(Ds.Tables[0]);

            if (medTxLiverDv.Count > 0)
            {
                StringBuilder sb5 = new StringBuilder();

                if (medTxLiverDv.Count > 10)
                {
                    sb5.Append("<tr class=\"EFormTableRow\" align=center style=\"background-color: #A8A8A8;\">");
                    sb5.Append("<td colspan=\"6\" align=\"center\" valign=\"middle\" class=\"FormInsideTableLeftCell\" >");
                    sb5.Append("<i>most recent 10&#160;</i></td>");
                    sb5.Append("</tr>");
                }

                medTxLiverDv.Sort = MedicalTherapy.MedTxDate + " DESC ";
                medTxLiverDv = GetTopDataViewRows(medTxLiverDv, 10);
                medTxLiverDv.Sort = MedicalTherapy.MedTxDate + " ASC ";

                foreach (DataRow dr5 in medTxLiverDv.ToTable().Rows)
                {
                    sb5.Append("<tr class=\"EFormTableRow\" onmouseover=\"this.className='chronListHilighted';\" onmouseout=\"this.className='EFormTableRow';\" onclick=\"LoadDataEntryForm('MedicalTherapy', '" + dr5[MedicalTherapy.MedicalTherapyId].ToString() + "', 'MedTxDateText,MedTxDate,MedTxType,MedTxDose,MedTxUnits,MedTxStopDateText,MedTxStopDate,MedTxNotes')\">");

                    sb5.Append("<td align=\"center\" valign=\"middle\" class=\"FormInsideTableLeftCell\">");
                    sb5.Append(dr5[MedicalTherapy.MedTxDateText].ToString());
                    sb5.Append("&#160;</td>");

                    sb5.Append("<td align=\"center\" valign=\"middle\" class=\"FormInsideTableRegCell\">");
                    sb5.Append(dr5[MedicalTherapy.MedTxType].ToString());
                    sb5.Append("&#160;</td>");

                    sb5.Append("<td align=\"center\" valign=\"middle\" class=\"FormInsideTableRegCell\">");
                    sb5.Append(dr5[MedicalTherapy.MedTxDose].ToString());
                    sb5.Append("&#160;</td>");

                    sb5.Append("<td align=\"center\" valign=\"middle\" class=\"FormInsideTableRegCell\">");
                    sb5.Append(dr5[MedicalTherapy.MedTxUnits].ToString());
                    sb5.Append("&#160;</td>");

                    sb5.Append("<td align=\"center\" valign=\"middle\" class=\"FormInsideTableRegCell\">");
                    sb5.Append(dr5[MedicalTherapy.MedTxStopDateText].ToString());
                    sb5.Append("&#160;</td>");

                    sb5.Append("<td align=\"center\" valign=\"middle\" class=\"FormInsideTableRegCell\">");
                    sb5.Append(dr5[MedicalTherapy.MedTxNotes].ToString());
                    sb5.Append("&#160;</td>");

                    sb5.Append("</tr>");

                }
                AddTransformArgument("MedicalTherapiesLiverHxLS", "", sb5.ToString());

            }
        




        }



        /// <summary>
        /// Adds "RadiationTherapyRows" in <tr><td></td></tr> format
        /// </summary>
        private void AddRadiationTherapyParams()
        {


            RadiationTherapyDa Da = new RadiationTherapyDa();
            DataSet Ds = Da.FormGetRecords(this.EFormPatientId, this.EFormName, "Dynamic");

            if (Ds.Tables.Count > 0 && Ds.Tables[0].Rows.Count > 0)
            {
                StringBuilder sb = new StringBuilder();

                foreach (DataRow dr in Ds.Tables[0].Rows)
                {
                    sb.Append("<tr class=\"EFormTableRow\" onmouseover=\"this.className='chronListHilighted';\" onmouseout=\"this.className='EFormTableRow';\" onclick=\"LoadDataEntryForm('RadiationTherapy', '" + dr[RadiationTherapy.RadiationTherapyId].ToString() + "', 'RadTxDateText,RadTxDate,RadTxTarget,RadTxTotalDose,RadTxInstitution,RadTxNotes')\">");

                    sb.Append("<td align=\"center\" valign=\"middle\" class=\"FormInsideTableLeftCell\">");
                    sb.Append(dr[RadiationTherapy.RadTxDateText].ToString());
                    sb.Append("&#160;</td>");

                    sb.Append("<td align=\"center\" valign=\"middle\" class=\"FormInsideTableRegCell\">");
                    sb.Append(dr[RadiationTherapy.RadTxType].ToString());
                    sb.Append("&#160;</td>");

                    sb.Append("<td align=\"center\" valign=\"middle\" class=\"FormInsideTableRegCell\">");
                    sb.Append(dr[RadiationTherapy.RadTxTarget].ToString());
                    sb.Append("&#160;</td>");

                    sb.Append("<td align=\"center\" valign=\"middle\" class=\"FormInsideTableRegCell\">");
                    sb.Append(dr[RadiationTherapy.RadTxTotalDose].ToString());
                    sb.Append("&#160;</td>");

                    sb.Append("<td align=\"center\" valign=\"middle\" class=\"FormInsideTableRegCell\">");
                    sb.Append(dr[RadiationTherapy.RadTxInstitution].ToString());
                    sb.Append("&#160;</td>");

                    sb.Append("<td align=\"center\" valign=\"middle\" class=\"FormInsideTableRegCell\">");
                    sb.Append(dr[RadiationTherapy.RadTxNotes].ToString());
                    sb.Append("&#160;</td>");

                }
                AddTransformArgument("RadiationTherapyRows", "", sb.ToString());

            }




        }


        private void AddProstateBiopsyParams()
        {
            DataTable biopsiesDt;
            BiopsyDa bDa = new BiopsyDa();
            biopsiesDt = bDa.GetProstateBiopsies(this.EFormPatientId);



            if (biopsiesDt.Rows.Count > 0)
            {
                StringBuilder sb = new StringBuilder();

                foreach (DataRow dr in biopsiesDt.Rows)
                {

                    sb.Append("<tr><td class=\"FormOuterTableRow\"><table align=\"center\" border=\"0\" width=\"100%\" cellpadding=\"0\" cellspacing=\"0\">");

                    sb.Append("<tr class=\"EFormTableRow\" onmouseover=\"this.className='chronListHilighted';\" onmouseout=\"this.className='EFormTableRow';\" onclick=\"LoadDataEntryForm('Pathology', '" + dr["PathologyId"].ToString() + "', '')\">");

                    sb.Append("<td height=\"30\"  style=\"width: 13%; border-top: solid 1px #000000; text-align: center; border-bottom: none;\" class=\"FormInsideTableRegCell\">");
                    sb.Append(dr["ProcDateText"].ToString());
                    sb.Append("&#160;</td>");

                    sb.Append("<td class=\"FormInsideTableRegCell\"  style=\"width: 15%; border-top: solid 1px #000000;text-align:center;\">");
                    sb.Append(dr["ProcName"].ToString());
                    sb.Append("&#160;</td>");

                    sb.Append("<td class=\"FormInsideTableRegCell\"  style=\"width: 22%; border-top: solid 1px #000000;text-align:center;\">");
                    if (dr["PathGG1"].ToString().Length > 0 || dr["PathGG2"].ToString().Length > 0 || dr["PathGGS"].ToString().Length > 0)
                    {
                        sb.Append(dr["PathGG1"].ToString());
                        sb.Append("&#160;+&#160;");
                        sb.Append(dr["PathGG2"].ToString());
                        sb.Append("&#160;=&#160;");
                        sb.Append(dr["PathGGS"].ToString());

                    }
                    if (dr["PathResult"].ToString().Length > 0)
                    {
                        sb.Append("&#160;(");
                        sb.Append(dr["PathResult"].ToString());
                        sb.Append(")");
                    }
                    sb.Append("&#160;</td>");

                    sb.Append("<td class=\"FormInsideTableRegCell\"  style=\"width: 10%; border-top: solid 1px #000000;text-align:center;\">");
                    sb.Append(dr["PathQuality"].ToString());
                    sb.Append("&#160;</td>");

                    sb.Append("<td class=\"FormInsideTableRegCell\"  style=\"width: 40%; border-top: solid 1px #000000;\">");

                    string comments = "";
                    if (dr[BOL.ProstatectomyPathology.PathHG_PIN].ToString().Length > 0) comments += "PIN:" + dr[BOL.ProstatectomyPathology.PathHG_PIN].ToString() + ", ";
                    if (dr["PathASAP"].ToString().Length > 0) comments += "ASAP:" + dr["PathASAP"].ToString();
                    sb.Append(comments);
                    sb.Append("&#160;</td>");

                    sb.Append("</tr>");



                    //cores
                    if (dr[BOL.BiopsyCoreProstatePathology.PathologyId].ToString().Length > 0)
                    {

                        DataTable coresDt = bDa.FormGetBiopsyCorePathsByPathologyId((int)dr[BOL.BiopsyCoreProstatePathology.PathologyId]);

                        if (coresDt.Rows.Count > 0)
                        {

                            string corefilter = "LEN(" + BOL.BiopsyCoreProstatePathology.PathCoreGG1 + ") > 0 or LEN(" + BOL.BiopsyCoreProstatePathology.PathCoreGG2 + ") > 0 or LEN(" + BOL.BiopsyCoreProstatePathology.PathCoreGGS + ") > 0 or LEN(" + BOL.BiopsyCoreProstatePathology.PathCorePercCancer + ") > 0 or LEN(" + BOL.BiopsyCoreProstatePathology.PathCoreMaxCancerLength + ") > 0 or LEN(" + BOL.BiopsyCoreProstatePathology.PathCoreLength + ") > 0 or LEN(" + BOL.BiopsyCoreProstatePathology.PathCorePerineuralInv + ") > 0 or LEN(" + BOL.BiopsyCoreProstatePathology.PathCorePNI_Diam + ") > 0 or LEN(" + BOL.BiopsyCoreProstatePathology.PathCoreHG_PIN + ") > 0 or LEN(" + BOL.BiopsyCoreProstatePathology.PathCoreNumCores + ") > 0";

                            DataView coresDv = new DataView(coresDt);
                            coresDv.RowFilter = corefilter;

                            if (coresDv.Count > 0)
                            {






                                string coreStr1 =
                                    @"

                                      <tr id=""CoresContainer"" >
                                      <td class=""FormInsideTableRegCell"" style=""padding: 0px 0px 0px 0px; border-bottom: none;"">&#160;</td>
                                      <td colspan=""4"" style=""padding: 0px 0px 0px 0px; border: none; "">

                                          <style type=""text/css"">
                                              table.BiopsyCoresPopDataTable
                                              {
                                              width: 100%;
                                              border-collapse: collapse;
                                              }
                                              table.BiopsyCoresPopDataTable td
                                              {
                                              text-align: center;
                                              border: solid 1px #666666;
                                              padding: 1px;
                                              }
                                              .inputFieldFlat
                                              {
                                              border: solid 1px #666666;
                                              text-align: center;
                                              }
                                          </style>
                                          <table align=""center"" border=""0"" width=""100%"" cellpadding=""0"" cellspacing=""0"" style="""">
                                              <tr>
                                                  <td align=""center"" valign=""middle"" class=""FormInsideTableRegCell"" style=""width: 43%; padding: 8px 0px 4px 0px;"">
                                                      <strong>Gleason Grade</strong>
                                                      &#160;&#160;

                             ";
                                coreStr1 += dr["PathGG1"].ToString();
                                coreStr1 += "&#160;+&#160; ";
                                coreStr1 += dr["PathGG2"].ToString();
                                coreStr1 += "&#160;=&#160 ";
                                coreStr1 += dr["PathGGS"].ToString();
                                coreStr1 += @"</td><td align=""center"" valign=""middle"" class=""FormInsideTableRegCell"" style=""padding: 8px 0px 4px 0px;"">
                                                      <strong>Cores</strong> &#160;&#160;Positive:";
                                coreStr1 += dr["PathPosCores"].ToString();
                                coreStr1 += "&#160;&#160; Total:";
                                coreStr1 += dr["PathNumCores"].ToString();
                                coreStr1 += "</td></tr></table>";






                                coreStr1 += @"

                                          <table class=""BiopsyCoresPopDataTable"" cellspacing=""0"" style=""width: 100%; border-collapse: collapse;"" >
                                              <tr>
                                                  <td align=""center"">Side</td>
                                                  <td align=""center"">Laterality</td>
                                                  <td align=""center"">Level</td>
                                                  <td width=""7%"" align=""center"">Pos Cores</td>
                                                  <td width=""7%"" align=""center"">Total Cores </td>
                                                  <td width=""7%"" align=""center"">GG1</td>
                                                  <td width=""7%"" align=""center"">GG2</td>
                                                  <td width=""7%"" align=""center"">GGS</td>
                                                  <td width=""7%"" align=""center"">%Ca</td>
                                                  <td width=""7%"" align=""center"">mmCa</td>
                                                  <td width=""8%"" align=""center"">mmCore</td>
                                                  <td width=""6%"" align=""center"">PNI</td>
                                                  <td width=""7%"" align=""center"">ASAP</td>
                                                  <td width=""7%"" align=""center"">HG PIN </td>
                                              </tr>

                            ";
                                foreach (DataRowView coreRow in coresDv)
                                {
                                    coreStr1 += "<tr>";
                                    coreStr1 += ("<td style=\"height: 18px; text-align: center;\">" + coreRow["PathCoreSide"].ToString() + "&#160;</td>");
                                    coreStr1 += ("<td style=\"text-align: center;\">" + coreRow["PathCoreLaterality"].ToString() + "&#160;</td>");
                                    coreStr1 += ("<td style=\"text-align: center;\">" + coreRow["PathCoreLevel"].ToString() + "&#160;</td>");
                                    coreStr1 += ("<td style=\"text-align: center;\">" + coreRow["PathCoreNumCores"].ToString() + "&#160;</td>");
                                    coreStr1 += ("<td style=\"text-align: center;\">" + coreRow["PathCoreNumTotalCores"].ToString() + "&#160;</td>");
                                    coreStr1 += ("<td style=\"text-align: center;\">" + coreRow["PathCoreGG1"].ToString() + "&#160;</td>");
                                    coreStr1 += ("<td style=\"text-align: center;\">" + coreRow["PathCoreGG2"].ToString() + "&#160;</td>");
                                    coreStr1 += ("<td style=\"text-align: center;\">" + coreRow["PathCoreGGS"].ToString() + "&#160;</td>");
                                    coreStr1 += ("<td style=\"text-align: center;\">" + coreRow["PathCorePercCancer"].ToString() + "&#160;</td>");
                                    coreStr1 += ("<td style=\"text-align: center;\">" + coreRow["PathCoreMaxCancerLength"].ToString() + "&#160;</td>");
                                    coreStr1 += ("<td style=\"text-align: center;\">" + coreRow["PathCoreLength"].ToString() + "&#160;</td>");
                                    coreStr1 += ("<td style=\"text-align: center;\">" + coreRow["PathCorePNI_Diam"].ToString() + "&#160;</td>");
                                    coreStr1 += ("<td style=\"text-align: center;\">" + coreRow["PathCoreASAP"].ToString() + "&#160;</td>");
                                    coreStr1 += ("<td style=\"text-align: center;\">" + coreRow["PathCoreHG_PIN"].ToString() + "&#160;</td>");
                                }

                                coreStr1 += "</table>";








                                coreStr1 += "</td></tr>";
                                sb.Append(coreStr1);
                            }
                        }
                    }
                    sb.Append("</table></td></tr>");


                }

                AddTransformArgument("ProstateBiopsyRows", "", sb.ToString());

            }

        }


        private void AddProstateBiopsyActiveSurveillanceParams()
        {
            DataTable biopsiesDt;
            BiopsyDa bDa = new BiopsyDa();
            biopsiesDt = bDa.GetProstateBiopsies(this.EFormPatientId);

            DataView PositiveBiopsiesDv = new DataView(biopsiesDt);
            PositiveBiopsiesDv.RowFilter = "Isnull(" + BOL.BiopsyProstatePathology.PathGGS + ",'') <> ''";
            DataTable PositiveBiopsiesDt = PositiveBiopsiesDv.ToTable();

            if (PositiveBiopsiesDt.Rows.Count > 0)
            {

                DataView BiopsiesToDisplay = new DataView(PositiveBiopsiesDt);


                // don't display any OUT Path records that have been reviewed
                DataView ReviewedBiopsies = new DataView(PositiveBiopsiesDt);
                ReviewedBiopsies.RowFilter = BOL.Pathology.PathQuality + " IN ('REV', 'RR')";

                if (ReviewedBiopsies.Count > 0)
                {
                    List<string> OutsidePathRecordsToFilter = new List<string>();
                    foreach (DataRowView ReviewedBiopsy in ReviewedBiopsies)
                    {
                        string ProcedureIdStr = ReviewedBiopsy["PrimaryKey"].ToString();
                        OutsidePathRecordsToFilter.Add(ProcedureIdStr);
                    }
                    string biopsyFilter = "NOT (" + BOL.Pathology.PathQuality + " = 'OUT' AND PrimaryKey IN (" + string.Join(",", OutsidePathRecordsToFilter.ToArray()) + "))";
                    BiopsiesToDisplay.RowFilter = biopsyFilter;
                }


                DataTable filteredBiopsiesDt = BiopsiesToDisplay.ToTable();

                StringBuilder sb = new StringBuilder();

                foreach (DataRow dr in filteredBiopsiesDt.Rows)
                {

                    sb.Append("<tr><td class=\"FormOuterTableRow\"><table align=\"center\" border=\"0\" width=\"100%\" cellpadding=\"0\" cellspacing=\"0\">");

                    sb.Append("<tr class=\"EFormTableRow\" onmouseover=\"this.className='chronListHilighted';\" onmouseout=\"this.className='EFormTableRow';\" onclick=\"LoadDataEntryForm('Pathology', '" + dr["PathologyId"].ToString() + "', '')\">");

                    sb.Append("<td height=\"30\"  style=\"width: 13%; border-top: solid 1px #000000; text-align: center; border-bottom: none;\" class=\"FormInsideTableRegCell\">");
                    sb.Append(dr["ProcDateText"].ToString());
                    sb.Append("&#160;</td>");

                    sb.Append("<td class=\"FormInsideTableRegCell\"  style=\"width: 15%; border-top: solid 1px #000000;text-align:center;\">");
                    sb.Append(dr["ProcName"].ToString());
                    sb.Append("&#160;</td>");

                    sb.Append("<td class=\"FormInsideTableRegCell\"  style=\"width: 22%; border-top: solid 1px #000000;text-align:center;\">");
                    if (dr["PathGG1"].ToString().Length > 0 || dr["PathGG2"].ToString().Length > 0 || dr["PathGGS"].ToString().Length > 0)
                    {
                        sb.Append(dr["PathGG1"].ToString());
                        sb.Append("&#160;+&#160;");
                        sb.Append(dr["PathGG2"].ToString());
                        sb.Append("&#160;=&#160;");
                        sb.Append(dr["PathGGS"].ToString());

                    }
                    if (dr["PathResult"].ToString().Length > 0)
                    {
                        sb.Append("&#160;(");
                        sb.Append(dr["PathResult"].ToString());
                        sb.Append(")");
                    }
                    sb.Append("&#160;</td>");

                    sb.Append("<td class=\"FormInsideTableRegCell\"  style=\"width: 10%; border-top: solid 1px #000000;text-align:center;\">");
                    sb.Append(dr["PathQuality"].ToString());
                    sb.Append("&#160;</td>");

                    sb.Append("<td class=\"FormInsideTableRegCell\"  style=\"width: 40%; border-top: solid 1px #000000;\">");

                    string comments = "";
                    if (dr[BOL.ProstatectomyPathology.PathHG_PIN].ToString().Length > 0) comments += "PIN:" + dr[BOL.ProstatectomyPathology.PathHG_PIN].ToString() + ", ";
                    if (dr["PathASAP"].ToString().Length > 0) comments += "ASAP:" + dr["PathASAP"].ToString();
                    sb.Append(comments);
                    sb.Append("&#160;</td>");

                    sb.Append("</tr>");



                    //cores
                    if (dr[BOL.BiopsyCoreProstatePathology.PathologyId].ToString().Length > 0)
                    {

                        DataTable coresDt = bDa.FormGetBiopsyCorePathsByPathologyId((int)dr[BOL.BiopsyCoreProstatePathology.PathologyId]);

                        if (coresDt.Rows.Count > 0)
                        {

                            //                            string corefilter = "LEN(" + BOL.BiopsyCoreProstatePathology.PathCoreGG1 + ") > 0 or LEN(" + BOL.BiopsyCoreProstatePathology.PathCoreGG2 + ") > 0 or LEN(" + BOL.BiopsyCoreProstatePathology.PathCoreGGS + ") > 0 or LEN(" + BOL.BiopsyCoreProstatePathology.PathCorePercCancer + ") > 0 or LEN(" + BOL.BiopsyCoreProstatePathology.PathCoreMaxCancerLength + ") > 0 or LEN(" + BOL.BiopsyCoreProstatePathology.PathCoreLength + ") > 0 or LEN(" + BOL.BiopsyCoreProstatePathology.PathCorePerineuralInv + ") > 0 or LEN(" + BOL.BiopsyCoreProstatePathology.PathCorePNI_Diam + ") > 0 or LEN(" + BOL.BiopsyCoreProstatePathology.PathCoreHG_PIN + ") > 0 or LEN(" + BOL.BiopsyCoreProstatePathology.PathCoreNumCores + ") > 0";



                            string corefilter = "LEN(" + BOL.BiopsyCoreProstatePathology.PathCoreGG1 + ") > 0 or LEN(" + BOL.BiopsyCoreProstatePathology.PathCoreGG2 + ") > 0 or LEN(" + BOL.BiopsyCoreProstatePathology.PathCoreGGS + ") > 0";

                            DataView coresDv = new DataView(coresDt);
                            coresDv.RowFilter = corefilter;

                            if (coresDv.Count > 0)
                            {






                                string coreStr1 =
                                    @"

                                      <tr id=""CoresContainer"" >
                                      <td class=""FormInsideTableRegCell"" style=""padding: 0px 0px 0px 0px; border-bottom: none;"">&#160;</td>
                                      <td colspan=""4"" style=""padding: 0px 0px 0px 0px; border: none; "">

                                          <style type=""text/css"">
                                              table.BiopsyCoresPopDataTable
                                              {
                                              width: 100%;
                                              border-collapse: collapse;
                                              }
                                              table.BiopsyCoresPopDataTable td
                                              {
                                              text-align: center;
                                              border: solid 1px #666666;
                                              padding: 1px;
                                              }
                                              .inputFieldFlat
                                              {
                                              border: solid 1px #666666;
                                              text-align: center;
                                              }
                                          </style>
                                          <table align=""center"" border=""0"" width=""100%"" cellpadding=""0"" cellspacing=""0"" style="""">
                                              <tr>
                                                  <td align=""center"" valign=""middle"" class=""FormInsideTableRegCell"" style=""width: 43%; padding: 8px 0px 4px 0px;"">
                                                      <strong>Gleason Grade</strong>
                                                      &#160;&#160;

                             ";
                                coreStr1 += dr["PathGG1"].ToString();
                                coreStr1 += "&#160;+&#160; ";
                                coreStr1 += dr["PathGG2"].ToString();
                                coreStr1 += "&#160;=&#160 ";
                                coreStr1 += dr["PathGGS"].ToString();
                                coreStr1 += @"</td><td align=""center"" valign=""middle"" class=""FormInsideTableRegCell"" style=""padding: 8px 0px 4px 0px;"">
                                                      <strong>Cores</strong> &#160;&#160;Positive:";
                                coreStr1 += dr["PathPosCores"].ToString();
                                coreStr1 += "&#160;&#160; Total:";
                                coreStr1 += dr["PathNumCores"].ToString();
                                coreStr1 += "</td></tr></table>";






                                coreStr1 += @"

                                          <table class=""BiopsyCoresPopDataTable"" cellspacing=""0"" style=""width: 100%; border-collapse: collapse;"" >
                                              <tr>
                                                  <td align=""center"">Side</td>
                                                  <td align=""center"">Laterality</td>
                                                  <td align=""center"">Level</td>
                                                  <td width=""7%"" align=""center"">Pos Cores</td>
                                                  <td width=""7%"" align=""center"">Total Cores </td>
                                                  <td width=""7%"" align=""center"">GG1</td>
                                                  <td width=""7%"" align=""center"">GG2</td>
                                                  <td width=""7%"" align=""center"">GGS</td>
                                                  <td width=""7%"" align=""center"">%Ca</td>
                                                  <td width=""7%"" align=""center"">mmCa</td>
                                                  <td width=""8%"" align=""center"">mmCore</td>
                                                  <td width=""6%"" align=""center"">PNI</td>
                                                  <td width=""7%"" align=""center"">ASAP</td>
                                                  <td width=""7%"" align=""center"">HG PIN </td>
                                              </tr>

                            ";
                                foreach (DataRowView coreRow in coresDv)
                                {
                                    coreStr1 += "<tr>";
                                    coreStr1 += ("<td style=\"height: 18px; text-align: center;\">" + coreRow["PathCoreSide"].ToString() + "&#160;</td>");
                                    coreStr1 += ("<td style=\"text-align: center;\">" + coreRow["PathCoreLaterality"].ToString() + "&#160;</td>");
                                    coreStr1 += ("<td style=\"text-align: center;\">" + coreRow["PathCoreLevel"].ToString() + "&#160;</td>");
                                    coreStr1 += ("<td style=\"text-align: center;\">" + coreRow["PathCoreNumCores"].ToString() + "&#160;</td>");
                                    coreStr1 += ("<td style=\"text-align: center;\">" + coreRow["PathCoreNumTotalCores"].ToString() + "&#160;</td>");
                                    coreStr1 += ("<td style=\"text-align: center;\">" + coreRow["PathCoreGG1"].ToString() + "&#160;</td>");
                                    coreStr1 += ("<td style=\"text-align: center;\">" + coreRow["PathCoreGG2"].ToString() + "&#160;</td>");
                                    coreStr1 += ("<td style=\"text-align: center;\">" + coreRow["PathCoreGGS"].ToString() + "&#160;</td>");
                                    coreStr1 += ("<td style=\"text-align: center;\">" + coreRow["PathCorePercCancer"].ToString() + "&#160;</td>");
                                    coreStr1 += ("<td style=\"text-align: center;\">" + coreRow["PathCoreMaxCancerLength"].ToString() + "&#160;</td>");
                                    coreStr1 += ("<td style=\"text-align: center;\">" + coreRow["PathCoreLength"].ToString() + "&#160;</td>");
                                    coreStr1 += ("<td style=\"text-align: center;\">" + coreRow["PathCorePNI_Diam"].ToString() + "&#160;</td>");
                                    coreStr1 += ("<td style=\"text-align: center;\">" + coreRow["PathCoreASAP"].ToString() + "&#160;</td>");
                                    coreStr1 += ("<td style=\"text-align: center;\">" + coreRow["PathCoreHG_PIN"].ToString() + "&#160;</td>");
                                }

                                coreStr1 += "</table>";








                                coreStr1 += "</td></tr>";
                                sb.Append(coreStr1);
                            }
                        }
                    }
                    sb.Append("</table></td></tr>");


                }

                AddTransformArgument("ProstateBiopsyActiveSurveillanceRows", "", sb.ToString());

            }

        }

        private void AddDiagnosticProstateBiopsyParams()
        {
            DataSet diagBiopsiesPathIdDs, diagBopsiesDs, diagBopsiesCoreDs, trusVolumesDs3;
            BiopsyProstateDa diagBDa = new BiopsyProstateDa();

            // retrieve the pathology ids of all biopsy records (both biopsy paths and biopsy cores)
            diagBiopsiesPathIdDs = diagBDa.FormGetBiopsyPathologyIds(this.EFormPatientId, this.EFormName, "Dynamic");

            // ready pathology ids for query
            string biopsyPathIds = String.Empty;

            foreach (DataRow dr in diagBiopsiesPathIdDs.Tables[0].Rows)
            {
                biopsyPathIds = String.Concat(biopsyPathIds, dr[Pathology.PathologyId].ToString(), ",");
            }

            if (!String.IsNullOrEmpty(biopsyPathIds))
            {
                // trim any trailing or leading spaces/commas
                biopsyPathIds = biopsyPathIds.Trim(' ', ',');

                diagBopsiesDs = diagBDa.FormGetBiopsyPathRecords(this.EFormPatientId, this.EFormName, "Dynamic", biopsyPathIds);


                if (diagBopsiesDs.Tables.Count > 0 && diagBopsiesDs.Tables[0].Rows.Count > 0)
                {
                    StringBuilder sb = new StringBuilder();
                    foreach (DataRow dr in diagBopsiesDs.Tables[0].Rows)
                    {

                        sb.Append("<tr class=\"EFormTableRow\" onmouseover=\"this.className='chronListHilighted';\" onmouseout=\"this.className='EFormTableRow';\">");

                        sb.Append("<td align=\"center\" valign=\"middle\" class=\"FormInsideTableLeftCell\" onclick=\"LoadDataEntryForm('Pathology', '" + dr[Pathology.PathologyId].ToString() + "', 'PathDateText,PathQuality,PathGG1,PathGG2,PathGGS,PathResult,PathPosCores,PathNumCores,PathNotes')\">");
                        sb.Append(dr[Pathology.PathDateText].ToString());
                        sb.Append("&#160;</td>");

                        sb.Append("<td align=\"center\" valign=\"middle\" class=\"FormInsideTableLeftCell\"  onclick=\"LoadDataEntryForm('Pathology', '" + dr[Pathology.PathologyId].ToString() + "', 'PathDateText,PathQuality,PathGG1,PathGG2,PathGGS,PathResult,PathPosCores,PathNumCores,PathNotes')\">");
                        sb.Append(dr[Pathology.PathQuality].ToString());
                        sb.Append("&#160;</td>");

                        sb.Append("<td align=\"center\" valign=\"middle\" class=\"FormInsideTableRegCell\"  onclick=\"LoadDataEntryForm('ProstateBiopsyPath', '" + dr[Pathology.PathologyId].ToString() + "', 'PathDateText,PathQuality,PathGG1,PathGG2,PathGGS,PathResult,PathPosCores,PathNumCores,PathNotes')\">");
                        sb.Append(dr[BiopsyProstatePathology.PathGG1].ToString());
                        sb.Append("&#160;</td>");

                        sb.Append("<td align=\"center\" valign=\"middle\" class=\"FormInsideTableRegCell\"  onclick=\"LoadDataEntryForm('ProstateBiopsyPath', '" + dr[Pathology.PathologyId].ToString() + "', 'PathDateText,PathQuality,PathGG1,PathGG2,PathGGS,PathResult,PathPosCores,PathNumCores,PathNotes')\">");
                        sb.Append(dr[BiopsyProstatePathology.PathGG2].ToString());
                        sb.Append("&#160;</td>");

                        sb.Append("<td align=\"center\" valign=\"middle\" class=\"FormInsideTableRegCell\"  onclick=\"LoadDataEntryForm('ProstateBiopsyPath', '" + dr[Pathology.PathologyId].ToString() + "', 'PathDateText,PathQuality,PathGG1,PathGG2,PathGGS,PathResult,PathPosCores,PathNumCores,PathNotes')\">");
                        sb.Append(dr[BiopsyProstatePathology.PathGGS].ToString());
                        sb.Append("&#160;</td>");

                        sb.Append("<td align=\"center\" valign=\"middle\" class=\"FormInsideTableRegCell\"  onclick=\"LoadDataEntryForm('Pathology', '" + dr[Pathology.PathologyId].ToString() + "', 'PathDateText,PathQuality,PathGG1,PathGG2,PathGGS,PathResult,PathPosCores,PathNumCores,PathNotes')\" >");
                        sb.Append(dr[Pathology.PathResult].ToString());
                        sb.Append("&#160;</td>");

                        sb.Append("<td align=\"center\" valign=\"middle\" class=\"FormInsideTableRegCell\"  onclick=\"LoadDataEntryForm('ProstateBiopsyPath', '" + dr[Pathology.PathologyId].ToString() + "', 'PathDateText,PathQuality,PathGG1,PathGG2,PathGGS,PathResult,PathPosCores,PathNumCores,PathNotes')\">");
                        sb.Append(String.Concat("Positive: ", dr[BiopsyProstatePathology.PathPosCores].ToString(), "<br/>Total: ", dr[BiopsyProstatePathology.PathNumCores].ToString()));
                        sb.Append("&#160;</td>");
                        sb.Append("<td align=\"center\" valign=\"middle\" class=\"FormInsideTableRegCell\" colspan=\"5\"  onclick=\"LoadDataEntryForm('Pathology', '" + dr[Pathology.PathologyId].ToString() + "', 'PathDateText,PathQuality,PathGG1,PathGG2,PathGGS,PathResult,PathPosCores,PathNumCores,PathNotes')\">");
                        sb.Append(dr[Pathology.PathNotes].ToString());
                        sb.Append("&#160;</td>");

                        diagBopsiesCoreDs = diagBDa.FormGetBiopsyCorePathRecords(this.EFormPatientId, this.EFormName, "Dynamic", dr[Pathology.PathologyId].ToString());

                        if (diagBopsiesCoreDs.Tables.Count > 0 && diagBopsiesCoreDs.Tables[0].Rows.Count > 0)
                        {
                            sb.Append("<tr>");

                            sb.Append("<td align=\"center\" valign=\"middle\" class=\"FormInsideTableLeftCell\" colspan=\"1\" >");
                            sb.Append("<strong></strong></td>");
                            sb.Append("<td align=\"center\" valign=\"middle\" class=\"FormInsideTableLeftCell\" >");
                            sb.Append("<strong>Zone</strong></td>");
                            sb.Append("<td align=\"center\" valign=\"middle\" class=\"FormInsideTableLeftCell\" >");
                            sb.Append("<strong>#Cores</strong></td>");
                            sb.Append("<td align=\"center\" valign=\"middle\" class=\"FormInsideTableLeftCell\" >");
                            sb.Append("<strong>GG1</strong></td>");
                            sb.Append("<td align=\"center\" valign=\"middle\" class=\"FormInsideTableLeftCell\" >");
                            sb.Append("<strong>GG2</strong></td>");
                            sb.Append("<td align=\"center\" valign=\"middle\" class=\"FormInsideTableLeftCell\" >");
                            sb.Append("<strong>GGS</strong></td>");
                            sb.Append("<td align=\"center\" valign=\"middle\" class=\"FormInsideTableLeftCell\" >");
                            sb.Append("<strong>%Ca</strong></td>");
                            sb.Append("<td width=\"6%\" align=\"center\" valign=\"middle\" class=\"FormInsideTableLeftCell\" >");
                            sb.Append("<strong>mmCa</strong></td>");
                            sb.Append("<td width=\"6%\" align=\"center\" valign=\"middle\" class=\"FormInsideTableLeftCell\" >");
                            sb.Append("<strong>mmCore</strong></td>");
                            sb.Append("<td width=\"6%\" align=\"center\" valign=\"middle\" class=\"FormInsideTableLeftCell\" >");
                            sb.Append("<strong>PNI</strong></td>");
                            sb.Append("<td width=\"6%\" align=\"center\" valign=\"middle\" class=\"FormInsideTableLeftCell\" >");
                            sb.Append("<strong>ASAP</strong></td>");
                            sb.Append("<td width=\"6%\" align=\"center\" valign=\"middle\" class=\"FormInsideTableLeftCell\" >");
                            sb.Append("<strong>HG PIN</strong></td>");

                            sb.Append("</tr>");

                            foreach (DataRow dr2 in diagBopsiesCoreDs.Tables[0].Rows)
                            {

                                sb.Append("<tr class=\"EFormTableRow\" onmouseover=\"this.className='chronListHilighted';\" onmouseout=\"this.className='EFormTableRow';\" onclick=\"LoadDataEntryForm('ProstateBiopsyCorePath', '" + dr2["ProstateBiopsyCorePathId"].ToString() + "', '')\">");

                                sb.Append("<td align=\"center\" valign=\"middle\" class=\"FormInsideTableRegCell\" colspan=\"1\">");
                                sb.Append("&#160;</td>");

                                sb.Append("<td align=\"center\" valign=\"middle\" class=\"FormInsideTableLeftCell\"  onclick=\"LoadDataEntryForm('ProstateBiopsyCorePath', '" + dr2[BiopsyCoreProstatePathology.ProstateBiopsyCorePathId].ToString() + "', '')\">");
                                sb.Append(dr2[BiopsyCoreProstatePathology.PathCoreZone].ToString());
                                sb.Append("&#160;</td>");

                                sb.Append("<td align=\"center\" valign=\"middle\" class=\"FormInsideTableLeftCell\"  onclick=\"LoadDataEntryForm('ProstateBiopsyCorePath', '" + dr2[BiopsyCoreProstatePathology.ProstateBiopsyCorePathId].ToString() + "', '')\">");
                                sb.Append(dr2[BiopsyCoreProstatePathology.PathCoreNumCores].ToString());
                                sb.Append("&#160;</td>");

                                sb.Append("<td width=\"8%\" align=\"center\" valign=\"middle\" class=\"FormInsideTableRegCell\"  onclick=\"LoadDataEntryForm('ProstateBiopsyCorePath', '" + dr2[BiopsyCoreProstatePathology.ProstateBiopsyCorePathId].ToString() + "', '')\">");
                                sb.Append(dr2[BiopsyCoreProstatePathology.PathCoreGG1].ToString());
                                sb.Append("&#160;</td>");

                                sb.Append("<td width=\"8%\" align=\"center\" valign=\"middle\" class=\"FormInsideTableRegCell\"  onclick=\"LoadDataEntryForm('ProstateBiopsyCorePath', '" + dr2[BiopsyCoreProstatePathology.ProstateBiopsyCorePathId].ToString() + "', '')\">");
                                sb.Append(dr2[BiopsyCoreProstatePathology.PathCoreGG2].ToString());
                                sb.Append("&#160;</td>");

                                sb.Append("<td width=\"8%\" align=\"center\" valign=\"middle\" class=\"FormInsideTableRegCell\"  onclick=\"LoadDataEntryForm('ProstateBiopsyCorePath', '" + dr2[BiopsyCoreProstatePathology.ProstateBiopsyCorePathId].ToString() + "', '')\">");
                                sb.Append(dr2[BiopsyCoreProstatePathology.PathCoreGGS].ToString());
                                sb.Append("&#160;</td>");

                                sb.Append("<td align=\"center\" valign=\"middle\" class=\"FormInsideTableRegCell\"  onclick=\"LoadDataEntryForm('ProstateBiopsyCorePath', '" + dr2[BiopsyCoreProstatePathology.ProstateBiopsyCorePathId].ToString() + "', '')\">");
                                sb.Append(dr2[BiopsyCoreProstatePathology.PathCorePercCancer].ToString());
                                sb.Append("&#160;</td>");

                                sb.Append("<td align=\"center\" valign=\"middle\" class=\"FormInsideTableRegCell\"  onclick=\"LoadDataEntryForm('ProstateBiopsyCorePath', '" + dr2[BiopsyCoreProstatePathology.ProstateBiopsyCorePathId].ToString() + "', '')\">");
                                sb.Append(dr2[BiopsyCoreProstatePathology.PathCoreCancerLength].ToString());
                                sb.Append("&#160;</td>");

                                sb.Append("<td align=\"center\" valign=\"middle\" class=\"FormInsideTableRegCell\"  onclick=\"LoadDataEntryForm('ProstateBiopsyCorePath', '" + dr2[BiopsyCoreProstatePathology.ProstateBiopsyCorePathId].ToString() + "', '')\">");
                                sb.Append(dr2[BiopsyCoreProstatePathology.PathCoreLength].ToString());
                                sb.Append("&#160;</td>");

                                sb.Append("<td align=\"center\" valign=\"middle\" class=\"FormInsideTableRegCell\"  onclick=\"LoadDataEntryForm('ProstateBiopsyCorePath', '" + dr2[BiopsyCoreProstatePathology.ProstateBiopsyCorePathId].ToString() + "', '')\">");
                                sb.Append(dr2[BiopsyCoreProstatePathology.PathCorePerineuralInv].ToString());
                                sb.Append("&#160;</td>");

                                sb.Append("<td align=\"center\" valign=\"middle\" class=\"FormInsideTableRegCell\"  onclick=\"LoadDataEntryForm('ProstateBiopsyCorePath', '" + dr2[BiopsyCoreProstatePathology.ProstateBiopsyCorePathId].ToString() + "', '')\">");
                                sb.Append(dr2[BiopsyCoreProstatePathology.PathCoreASAP].ToString());
                                sb.Append("&#160;</td>");

                                sb.Append("<td align=\"center\" valign=\"middle\" class=\"FormInsideTableRegCell\"  onclick=\"LoadDataEntryForm('ProstateBiopsyCorePath', '" + dr2[BiopsyCoreProstatePathology.ProstateBiopsyCorePathId].ToString() + "', '')\">");
                                sb.Append(dr2[BiopsyCoreProstatePathology.PathCoreHG_PIN].ToString());
                                sb.Append("&#160;</td>");

                                sb.Append("</tr>");

                                sb.Append("<tr>");
                                sb.Append("</tr>");

                            }
                        }
                        sb.Append("</tr>");

                        sb.Append("<tr>");

                        sb.Append("<td align=\"center\" valign=\"middle\" class=\"FormInsideTableLeftCell\" colspan=\"12\" >");
                        sb.Append("&#160;</td>");

                        sb.Append("</tr>");

                    }



                    AddTransformArgument("DiagnosticProstateBiopsyRows", "", sb.ToString());
                }


                trusVolumesDs3 = diagBDa.FormGetBiopsyTRUSVolumeRecords(this.EFormPatientId, this.EFormName, "Dynamic");

                if (trusVolumesDs3.Tables.Count > 0 && trusVolumesDs3.Tables[0].Rows.Count > 0)
                {
                    StringBuilder sb2 = new StringBuilder();
                    foreach (DataRow dr3 in trusVolumesDs3.Tables[0].Rows)
                    {
                        if (!String.IsNullOrEmpty(dr3[ImageProstate.ImgProstateVolume].ToString()))
                        {
                            sb2.Append("<tr class=\"EFormTableRow\" onmouseover=\"this.className='chronListHilighted';\" onmouseout=\"this.className='EFormTableRow';\">");
                            sb2.Append("<td align=\"center\" valign=\"middle\" class=\"FormInsideTableLeftCell\"  onclick=\"LoadDataEntryForm('Diagnostics', '" + dr3[Diagnostic.DiagnosticId].ToString() + "', 'DxDateText,DxType,DxTarget,DxDisease')\">");
                            sb2.Append(dr3[Diagnostic.DxDateText].ToString());
                            sb2.Append("&#160;</td>");
                            sb2.Append("<td align=\"center\" valign=\"middle\" class=\"FormInsideTableRegCell\" onclick=\"LoadDataEntryForm('DxImageProstate', '" + dr3[Diagnostic.DiagnosticId].ToString() + "', 'ImgProstateVolume')\">");
                            sb2.Append(dr3[ImageProstate.ImgProstateVolume].ToString());
                            sb2.Append("&#160;</td>");
                            sb2.Append("</tr>");
                        }
                    }
                    AddTransformArgument("DiagnosticProstateBiopsyTRUSRows", "", sb2.ToString());
                }


            }
        }

       private void AddFamilyMemberHxParams()
       {

           DataSet famMemDs, famMemDiagDs;
           FamilyMemberDa famMemHxDa = new FamilyMemberDa();
           famMemDs = famMemHxDa.FormGetFamMemRecords(this.EFormPatientId, this.EFormName, "Dynamic");

           if (famMemDs.Tables.Count > 0 && famMemDs.Tables[0].Rows.Count > 0)
           {
               StringBuilder sb = new StringBuilder();

               foreach (DataRow dr in famMemDs.Tables[0].Rows)
               {
                   sb.Append("<tr class=\"EFormTableRow\" onmouseover=\"this.className='chronListHilighted';\" onmouseout=\"this.className='EFormTableRow';\">");

                   sb.Append("<td align=\"center\" valign=\"middle\" class=\"FormInsideTableLeftCell\" onclick=\"LoadDataEntryForm('FamilyMembers', '" + dr[FamilyMember.FamilyMemberId].ToString() + "', 'FamMemSide,FamMemRelation,FamMemDeathAge')\">");
                   sb.Append(dr[FamilyMember.FamMemSide].ToString());
                   sb.Append("&#160;</td>");

                   sb.Append("<td align=\"center\" valign=\"middle\" class=\"FormInsideTableLeftCell\"  onclick=\"LoadDataEntryForm('FamilyMembers', '" + dr[FamilyMember.FamilyMemberId].ToString() + "', 'FamMemSide,FamMemRelation,FamMemDeathAge')\">");
                   sb.Append(dr[FamilyMember.FamMemRelation].ToString());
                   sb.Append("&#160;</td>");

                   sb.Append("<td align=\"center\" valign=\"middle\" class=\"FormInsideTableRegCell\"  onclick=\"LoadDataEntryForm('FamilyMembers', '" + dr[FamilyMember.FamilyMemberId].ToString() + "', 'FamMemSide,FamMemRelation,FamMemDeathAge')\">");
                   sb.Append(dr[FamilyMember.FamMemDeathAge].ToString());
                   sb.Append("&#160;</td>");

                   famMemDiagDs = famMemHxDa.FormGetFamMemDiagnosisSpecialRecords(this.EFormPatientId, this.EFormName, "Dynamic", "FamilyMemberDiagnosis." + FamilyMemberDiagnosis.FamilyMemberId, " IN ", dr[FamilyMember.FamilyMemberId].ToString());

                   if (famMemDiagDs.Tables.Count > 0 && famMemDiagDs.Tables[0].Rows.Count > 0)
                   {
                       int famMemDiagCount = famMemDiagDs.Tables[0].Rows.Count;

                       foreach (DataRow dr2 in famMemDiagDs.Tables[0].Rows)
                       {

                           sb.Append("<td align=\"center\" valign=\"middle\" class=\"FormInsideTableLeftCell\"  onclick=\"LoadDataEntryForm('FamilyMemberDiagnosis', '" + dr2[FamilyMemberDiagnosis.FamilyMemberDiagnosisId].ToString() + "', '')\">");
                           sb.Append(dr2[FamilyMemberDiagnosis.FamMemDiagnosis].ToString());
                           sb.Append("&#160;</td>");

                           sb.Append("<td align=\"center\" valign=\"middle\" class=\"FormInsideTableLeftCell\"  onclick=\"LoadDataEntryForm('FamilyMemberDiagnosis', '" + dr2[FamilyMemberDiagnosis.FamilyMemberDiagnosisId].ToString() + "', '')\">");
                           sb.Append(dr2[FamilyMemberDiagnosis.FamMemDiagnosisAge].ToString());
                           sb.Append("&#160;</td>");

                           sb.Append("<td align=\"center\" valign=\"middle\" class=\"FormInsideTableRegCell\"  onclick=\"LoadDataEntryForm('FamilyMemberDiagnosis', '" + dr2[FamilyMemberDiagnosis.FamilyMemberDiagnosisId].ToString() + "', '')\">");
                           sb.Append(dr2[FamilyMemberDiagnosis.FamMemNotes].ToString());
                           sb.Append("&#160;</td>");

                           famMemDiagCount--;

                           if (famMemDiagCount > 0)
                           {
                               sb.Append("<tr>");
                               sb.Append("</tr>");

                               sb.Append("<td align=\"center\" valign=\"middle\" class=\"FormInsideTableRegCell\" colspan=\"3\">");
                               sb.Append("&#160;</td>");
                           }
                       }
                   }
                   else
                   {
                       sb.Append("<td align=\"center\" valign=\"middle\" class=\"FormInsideTableLeftCell\" colspan=\"3\" >");
                       sb.Append("&#160;</td>");
                   }
                   sb.Append("</tr>");
               }
               AddTransformArgument("PatientsFamilyMembersRows", "", sb.ToString());

           }
       }

        private void AddSocialHxParams()
        {

            DataSet socialHxDs;
            SocialHistoryDa shDa = new SocialHistoryDa();
            socialHxDs = shDa.FormGetRecords(this.EFormPatientId, this.EFormName, "Dynamic");
            
            StringBuilder sb = new StringBuilder();
            StringBuilder sb2 = new StringBuilder();
            StringBuilder sb3 = new StringBuilder();
            
            if (socialHxDs.Tables.Count > 0 && socialHxDs.Tables[0].Rows.Count > 0)
            {
                

                foreach (DataRow dr in socialHxDs.Tables[0].Rows)
                {
                    sb.Append("<tr class=\"EFormTableRow\" onmouseover=\"this.className='chronListHilighted';\" onmouseout=\"this.className='EFormTableRow';\" onclick=\"LoadDataEntryForm('SocialHistories', '" + dr[Patient.PatientId].ToString() + "', 'SocHxOccupation,SocHxMaritalStatus,SocHxChildren,SocHxTobaccoType,SocHxTobaccoPacksPerDay,SocHxTobaccoYears,SocHxTobaccoQuitYear,SocHxAlcohol,SocHxCarcinogen')\" >");

                    sb.Append("<td align=\"center\" valign=\"middle\" class=\"FormInsideTableLeftCell\" >");
                    sb.Append(dr[SocialHistory.SocHxOccupation].ToString());
                    sb.Append("&#160;</td>");

                    sb.Append("<td align=\"center\" valign=\"middle\" class=\"FormInsideTableLeftCell\" >");
                    sb.Append(dr[SocialHistory.SocHxMaritalStatus].ToString());
                    sb.Append("&#160;</td>");

                    sb.Append("<td align=\"center\" valign=\"middle\" class=\"FormInsideTableRegCell\" >");
                    sb.Append(dr[SocialHistory.SocHxChildren].ToString());
                    sb.Append("&#160;</td>");

                    sb.Append("<td align=\"center\" valign=\"middle\" class=\"FormInsideTableLeftCell\" >");
                    sb.Append(dr[SocialHistory.SocHxTobaccoType].ToString());
                    sb.Append("&#160;</td>");

                    sb.Append("<td align=\"center\" valign=\"middle\" class=\"FormInsideTableLeftCell\" >");
                    sb.Append(String.Concat(dr[SocialHistory.SocHxTobaccoPacksPerDay].ToString(), " packs/date for ", dr[SocialHistory.SocHxTobaccoYears].ToString(), " year(s)"));
                    sb.Append("&#160;</td>");

                    sb.Append("<td align=\"center\" valign=\"middle\" class=\"FormInsideTableRegCell\" >");
                    sb.Append(dr[SocialHistory.SocHxTobaccoQuitYear].ToString());
                    sb.Append("&#160;</td>");

                    sb.Append("<td align=\"center\" valign=\"middle\" class=\"FormInsideTableLeftCell\" >");
                    sb.Append(dr[SocialHistory.SocHxAlcohol].ToString());
                    sb.Append("&#160;</td>");

                    sb.Append("<td align=\"center\" valign=\"middle\" class=\"FormInsideTableRegCell\" >");
                    sb.Append(dr[SocialHistory.SocHxCarcinogen].ToString());
                    sb.Append("&#160;</td>");
                    
                    sb.Append("</tr>");

                    /*******************************************/
                    /**** Updated Social Hx Table Version ******/
                    /*******************************************/

                    /* Row 1 */
                    sb2.Append("<tr class=\"EFormTableRow\" >");

                    sb2.Append("<td align=\"center\" valign=\"middle\" class=\"FormInsideTableLeftCell\" colspan=\"1\" >");
                    sb2.Append("<strong>Occupation</strong></td>");
                    sb2.Append("<td align=\"center\" valign=\"middle\" class=\"FormInsideTableLeftCell\" >");
                    sb2.Append("<strong>Marital Status</strong></td>");
                    sb2.Append("<td align=\"center\" valign=\"middle\" class=\"FormInsideTableLeftCell\" >");
                    sb2.Append("<strong>Children</strong></td>");

                    sb2.Append("</tr>");

                    sb2.Append("<tr class=\"EFormTableRow\" onmouseover=\"this.className='chronListHilighted';\" onmouseout=\"this.className='EFormTableRow';\" onclick=\"LoadDataEntryForm('SocialHistories', '" + dr[Patient.PatientId].ToString() + "', 'SocHxOccupation,SocHxMaritalStatus,SocHxChildren,SocHxTobaccoType,SocHxTobaccoPacksPerDay,SocHxTobaccoYears,SocHxTobaccoQuitYear,SocHxAlcohol,SocHxAlcoholDrinksPerDay,SocHxAlcoholYears,SocHxAlcoholQuitYear,SocHxCarcinogen,SocHxNotes')\" >");

                    sb2.Append("<td align=\"center\" valign=\"middle\" class=\"FormInsideTableLeftCell\" >");
                    sb2.Append(dr[SocialHistory.SocHxOccupation].ToString());
                    sb2.Append("&#160;</td>");

                    sb2.Append("<td align=\"center\" valign=\"middle\" class=\"FormInsideTableLeftCell\" >");
                    sb2.Append(dr[SocialHistory.SocHxMaritalStatus].ToString());
                    sb2.Append("&#160;</td>");

                    sb2.Append("<td align=\"center\" valign=\"middle\" class=\"FormInsideTableRegCell\" >");
                    sb2.Append(dr[SocialHistory.SocHxChildren].ToString());
                    sb2.Append("&#160;</td>");

                    sb2.Append("</tr>");

                    /* Row 2 */
                    sb2.Append("<tr class=\"EFormTableRow\" >");

                    sb2.Append("<td align=\"center\" valign=\"middle\" class=\"FormInsideTableLeftCell\" colspan=\"1\" >");
                    sb2.Append("<strong>Tobacco Type</strong></td>");
                    sb2.Append("<td align=\"center\" valign=\"middle\" class=\"FormInsideTableLeftCell\" >");
                    sb2.Append("<strong>Tobacco Usage</strong></td>");
                    sb2.Append("<td align=\"center\" valign=\"middle\" class=\"FormInsideTableLeftCell\" >");
                    sb2.Append("<strong>Tobacco Year Quit</strong></td>");

                    sb2.Append("</tr>");

                    sb2.Append("<tr class=\"EFormTableRow\" onmouseover=\"this.className='chronListHilighted';\" onmouseout=\"this.className='EFormTableRow';\" onclick=\"LoadDataEntryForm('SocialHistories', '" + dr[Patient.PatientId].ToString() + "', 'SocHxOccupation,SocHxMaritalStatus,SocHxChildren,SocHxTobaccoType,SocHxTobaccoPacksPerDay,SocHxTobaccoYears,SocHxTobaccoQuitYear,SocHxAlcohol,SocHxAlcoholDrinksPerDay,SocHxAlcoholYears,SocHxAlcoholQuitYear,SocHxCarcinogen,SocHxNotes')\" >");

                    sb2.Append("<td align=\"center\" valign=\"middle\" class=\"FormInsideTableLeftCell\" >");
                    sb2.Append(dr[SocialHistory.SocHxTobaccoType].ToString());
                    sb2.Append("&#160;</td>");

                    sb2.Append("<td align=\"center\" valign=\"middle\" class=\"FormInsideTableLeftCell\" >");
                    sb2.Append(dr[SocialHistory.SocHxTobaccoPacksPerDay].ToString() + " packs(s)/day for " + dr[SocialHistory.SocHxTobaccoYears].ToString() + " years<br/>");
                    sb2.Append(dr[SocialHistory.SocHxTobaccoPacksPerYear].ToString() + " packs(s)/year" );
                    sb2.Append("&#160;</td>");

                    sb2.Append("<td align=\"center\" valign=\"middle\" class=\"FormInsideTableRegCell\" >");
                    sb2.Append(dr[SocialHistory.SocHxTobaccoQuitYear].ToString());
                    sb2.Append("&#160;</td>");

                    sb2.Append("</tr>");


                    /* Row 3 */
                    sb2.Append("<tr class=\"EFormTableRow\" >");

                    sb2.Append("<td align=\"center\" valign=\"middle\" class=\"FormInsideTableLeftCell\" colspan=\"1\" >");
                    sb2.Append("<strong>Alcohol Status</strong></td>");
                    sb2.Append("<td align=\"center\" valign=\"middle\" class=\"FormInsideTableLeftCell\" >");
                    sb2.Append("<strong>Alcohol Usage</strong></td>");
                    sb2.Append("<td align=\"center\" valign=\"middle\" class=\"FormInsideTableLeftCell\" >");
                    sb2.Append("<strong>Alcohol Year Quit</strong></td>");

                    sb2.Append("</tr>");

                    sb2.Append("<tr class=\"EFormTableRow\" onmouseover=\"this.className='chronListHilighted';\" onmouseout=\"this.className='EFormTableRow';\" onclick=\"LoadDataEntryForm('SocialHistories', '" + dr[Patient.PatientId].ToString() + "', 'SocHxOccupation,SocHxMaritalStatus,SocHxChildren,SocHxTobaccoType,SocHxTobaccoPacksPerDay,SocHxTobaccoYears,SocHxTobaccoQuitYear,SocHxAlcohol,SocHxAlcoholDrinksPerDay,SocHxAlcoholYears,SocHxAlcoholQuitYear,SocHxCarcinogen,SocHxNotes')\" >");

                    sb2.Append("<td align=\"center\" valign=\"middle\" class=\"FormInsideTableLeftCell\" >");
                    sb2.Append(dr[SocialHistory.SocHxAlcohol].ToString());
                    sb2.Append("&#160;</td>");

                    sb2.Append("<td align=\"center\" valign=\"middle\" class=\"FormInsideTableLeftCell\" >");
                    sb2.Append(dr[SocialHistory.SocHxAlcoholDrinksPerDay].ToString() + " drinks(s)/day for " + dr[SocialHistory.SocHxAlcoholYears].ToString() + " years");
                    sb2.Append("&#160;</td>");

                    sb2.Append("<td align=\"center\" valign=\"middle\" class=\"FormInsideTableRegCell\" >");
                    sb2.Append(dr[SocialHistory.SocHxAlcoholQuitYear].ToString());
                    sb2.Append("&#160;</td>");

                    sb2.Append("</tr>");

                    /* Row 4 */
                    sb2.Append("<tr class=\"EFormTableRow\" >");

                    sb2.Append("<td align=\"center\" valign=\"middle\" class=\"FormInsideTableLeftCell\" colspan=\"1\" >");
                    sb2.Append("<strong>Carcinogen Exposure</strong></td>");
                    sb2.Append("<td align=\"center\" valign=\"middle\" class=\"FormInsideTableLeftCell\" colspan=\"2\" >");
                    sb2.Append("<strong>Notes</strong></td>");


                    sb2.Append("</tr>");

                    sb2.Append("<tr class=\"EFormTableRow\" onmouseover=\"this.className='chronListHilighted';\" onmouseout=\"this.className='EFormTableRow';\" onclick=\"LoadDataEntryForm('SocialHistories', '" + dr[Patient.PatientId].ToString() + "', 'SocHxOccupation,SocHxMaritalStatus,SocHxChildren,SocHxTobaccoType,SocHxTobaccoPacksPerDay,SocHxTobaccoYears,SocHxTobaccoQuitYear,SocHxAlcohol,SocHxAlcoholDrinksPerDay,SocHxAlcoholYears,SocHxAlcoholQuitYear,SocHxCarcinogen,SocHxNotes')\" >");

                    sb2.Append("<td align=\"center\" valign=\"middle\" class=\"FormInsideTableLeftCell\" >");
                    sb2.Append(dr[SocialHistory.SocHxCarcinogen].ToString());
                    sb2.Append("&#160;</td>");

                    sb2.Append("<td align=\"center\" valign=\"middle\" class=\"FormInsideTableRegCell\" colspan=\"2\" >");
                    sb2.Append(dr[SocialHistory.SocHxNotes].ToString());
                    sb2.Append("&#160;</td>");

                    sb2.Append("</tr>");


                    /*******************************************/
                    /**** Third Social Hx Table Version ******/
                    /*******************************************/

                    /* Row 1 */
                    sb3.Append("<tr class=\"EFormTableRow\" >");

                    sb3.Append("<td align=\"center\" valign=\"middle\" class=\"FormInsideTableLeftCell\" colspan=\"1\" >");
                    sb3.Append("<strong>Tobacco Type</strong></td>");
                    sb3.Append("<td align=\"center\" valign=\"middle\" class=\"FormInsideTableLeftCell\" >");
                    sb3.Append("<strong>Tobacco Usage</strong></td>");
                    sb3.Append("<td align=\"center\" valign=\"middle\" class=\"FormInsideTableLeftCell\" >");
                    sb3.Append("<strong>Tobacco Year Quit</strong></td>");

                    sb3.Append("</tr>");

                    sb3.Append("<tr class=\"EFormTableRow\" onmouseover=\"this.className='chronListHilighted';\" onmouseout=\"this.className='EFormTableRow';\" onclick=\"LoadDataEntryForm('SocialHistories', '" + dr[Patient.PatientId].ToString() + "', 'SocHxOccupation,SocHxMaritalStatus,SocHxChildren,SocHxTobaccoType,SocHxTobaccoPacksPerDay,SocHxTobaccoYears,SocHxTobaccoQuitYear,SocHxAlcohol,SocHxAlcoholDrinksPerDay,SocHxAlcoholYears,SocHxAlcoholQuitYear,SocHxCarcinogen,SocHxNotes')\" >");

                    sb3.Append("<td align=\"center\" valign=\"middle\" class=\"FormInsideTableLeftCell\" >");
                    sb3.Append(dr[SocialHistory.SocHxTobaccoType].ToString());
                    sb3.Append("&#160;</td>");

                    sb3.Append("<td align=\"center\" valign=\"middle\" class=\"FormInsideTableLeftCell\" >");
                    sb3.Append(dr[SocialHistory.SocHxTobaccoPacksPerDay].ToString() + " packs(s)/day for " + dr[SocialHistory.SocHxTobaccoYears].ToString() + " years<br/>");
                    sb3.Append(dr[SocialHistory.SocHxTobaccoPacksPerYear].ToString() + " packs(s)/year");
                    sb3.Append("&#160;</td>");

                    sb3.Append("<td align=\"center\" valign=\"middle\" class=\"FormInsideTableRegCell\" >");
                    sb3.Append(dr[SocialHistory.SocHxTobaccoQuitYear].ToString());
                    sb3.Append("&#160;</td>");

                    sb3.Append("</tr>");

                    /* Row 2 */
                    sb3.Append("<tr class=\"EFormTableRow\" >");

                    sb3.Append("<td align=\"center\" valign=\"middle\" class=\"FormInsideTableLeftCell\" >");
                    sb3.Append("<strong>Other Tobacco Usage</strong></td>");
                    sb3.Append("<td align=\"center\" valign=\"middle\" class=\"FormInsideTableLeftCell\" >");
                    sb3.Append("<strong>&#160;</strong></td>");
                    sb3.Append("<td align=\"center\" valign=\"middle\" class=\"FormInsideTableLeftCell\" >");
                    sb3.Append("<strong>&#160;</strong></td>");

                    sb3.Append("</tr>");

                    sb3.Append("<tr class=\"EFormTableRow\" onmouseover=\"this.className='chronListHilighted';\" onmouseout=\"this.className='EFormTableRow';\" onclick=\"LoadDataEntryForm('SocialHistories', '" + dr[Patient.PatientId].ToString() + "', 'SocHxOccupation,SocHxMaritalStatus,SocHxChildren,SocHxTobaccoType,SocHxTobaccoPacksPerDay,SocHxTobaccoYears,SocHxTobaccoQuitYear,SocHxAlcohol,SocHxAlcoholDrinksPerDay,SocHxAlcoholYears,SocHxAlcoholQuitYear,SocHxOther,SocHxNotes')\" >");

                    sb3.Append("<td align=\"center\" valign=\"middle\" class=\"FormInsideTableLeftCell\" >");
                    sb3.Append(dr[SocialHistory.SocHxOther].ToString());
                    sb3.Append("&#160;</td>");
                    sb3.Append("<td align=\"center\" valign=\"middle\" class=\"FormInsideTableRegCell\" >");
                    sb3.Append("&#160;</td>");
                    sb3.Append("<td align=\"center\" valign=\"middle\" class=\"FormInsideTableRegCell\" >");
                    sb3.Append("&#160;</td>");

                    sb3.Append("</tr>");

                    /* Row 3 */
                    sb3.Append("<tr class=\"EFormTableRow\" >");

                    sb3.Append("<td align=\"center\" valign=\"middle\" class=\"FormInsideTableLeftCell\" colspan=\"1\" >");
                    sb3.Append("<strong>Alcohol Status</strong></td>");
                    sb3.Append("<td align=\"center\" valign=\"middle\" class=\"FormInsideTableLeftCell\" >");
                    sb3.Append("<strong>Alcohol Usage</strong></td>");
                    sb3.Append("<td align=\"center\" valign=\"middle\" class=\"FormInsideTableLeftCell\" >");
                    sb3.Append("<strong>Alcohol Year Quit</strong></td>");

                    sb3.Append("</tr>");

                    sb3.Append("<tr class=\"EFormTableRow\" onmouseover=\"this.className='chronListHilighted';\" onmouseout=\"this.className='EFormTableRow';\" onclick=\"LoadDataEntryForm('SocialHistories', '" + dr[Patient.PatientId].ToString() + "', 'SocHxOccupation,SocHxMaritalStatus,SocHxChildren,SocHxTobaccoType,SocHxTobaccoPacksPerDay,SocHxTobaccoYears,SocHxTobaccoQuitYear,SocHxAlcohol,SocHxAlcoholDrinksPerDay,SocHxAlcoholYears,SocHxAlcoholQuitYear,SocHxOther,SocHxNotes')\" >");

                    sb3.Append("<td align=\"center\" valign=\"middle\" class=\"FormInsideTableLeftCell\" >");
                    sb3.Append(dr[SocialHistory.SocHxAlcohol].ToString());
                    sb3.Append("&#160;</td>");

                    sb3.Append("<td align=\"center\" valign=\"middle\" class=\"FormInsideTableLeftCell\" >");
                    sb3.Append(dr[SocialHistory.SocHxAlcoholDrinksPerDay].ToString() + " drinks(s)/day for " + dr[SocialHistory.SocHxAlcoholYears].ToString() + " years");
                    sb3.Append("&#160;</td>");

                    sb3.Append("<td align=\"center\" valign=\"middle\" class=\"FormInsideTableRegCell\" >");
                    sb3.Append(dr[SocialHistory.SocHxAlcoholQuitYear].ToString());
                    sb3.Append("&#160;</td>");

                    sb3.Append("</tr>");

                    /* Row 4 */
                    sb3.Append("<tr class=\"EFormTableRow\" onmouseover=\"this.className='chronListHilighted';\" onmouseout=\"this.className='EFormTableRow';\" onclick=\"LoadDataEntryForm('SocialHistories', '" + dr[Patient.PatientId].ToString() + "', 'SocHxOccupation,SocHxMaritalStatus,SocHxChildren,SocHxTobaccoType,SocHxTobaccoPacksPerDay,SocHxTobaccoYears,SocHxTobaccoQuitYear,SocHxAlcohol,SocHxAlcoholDrinksPerDay,SocHxAlcoholYears,SocHxAlcoholQuitYear,SocHxOther,SocHxNotes')\" >");

                    sb3.Append("<td align=\"left\" valign=\"middle\" class=\"FormInsideTableRegCell\" colspan=\"3\" >");
                    sb3.Append("<strong>&#160;&#160;Notes:&#160;&#160;</strong>" + dr[SocialHistory.SocHxNotes].ToString());

                    sb3.Append("</tr>");

                }
                AddTransformArgument("HasSocialHistory", "", "Yes");
            }
            else
            {
                sb.Append("<tr class=\"EFormTableRow\" onmouseover=\"this.className='chronListHilighted';\" onmouseout=\"this.className='EFormTableRow';\" onclick=\"LoadDataEntryForm('SocialHistories', '" + this.EFormPatientId.ToString() + "', 'SocHxOccupation,SocHxMaritalStatus,SocHxChildren,SocHxTobaccoType,SocHxTobaccoPacksPerDay,SocHxTobaccoYears,SocHxTobaccoQuitYear,SocHxAlcohol,SocHxCarcinogen')\" >");

                sb.Append("<td align=\"center\" valign=\"middle\" class=\"FormInsideTableLeftCell\" >");
                sb.Append("&#160;</td>");
                sb.Append("<td align=\"center\" valign=\"middle\" class=\"FormInsideTableLeftCell\" >");
                sb.Append("&#160;</td>");
                sb.Append("<td align=\"center\" valign=\"middle\" class=\"FormInsideTableLeftCell\" >");
                sb.Append("&#160;</td>");
                sb.Append("<td align=\"center\" valign=\"middle\" class=\"FormInsideTableLeftCell\" >");
                sb.Append("&#160;</td>");
                sb.Append("<td align=\"center\" valign=\"middle\" class=\"FormInsideTableLeftCell\" >");
                sb.Append("&#160;</td>");
                sb.Append("<td align=\"center\" valign=\"middle\" class=\"FormInsideTableLeftCell\" >");
                sb.Append("&#160;</td>");
                sb.Append("<td align=\"center\" valign=\"middle\" class=\"FormInsideTableLeftCell\" >");
                sb.Append("&#160;</td>");
                sb.Append("<td align=\"center\" valign=\"middle\" class=\"FormInsideTableLeftCell\" >");
                sb.Append("&#160;</td>");

                sb.Append("</tr>");


                sb2.Append("<tr class=\"EFormTableRow\" onmouseover=\"this.className='chronListHilighted';\" onmouseout=\"this.className='EFormTableRow';\" onclick=\"LoadDataEntryForm('SocialHistories', '" + this.EFormPatientId.ToString() + "', 'SocHxOccupation,SocHxMaritalStatus,SocHxChildren,SocHxTobaccoType,SocHxTobaccoPacksPerDay,SocHxTobaccoYears,SocHxTobaccoQuitYear,SocHxAlcohol,SocHxCarcinogen')\" >");

                sb2.Append("<td align=\"center\" valign=\"middle\" class=\"FormInsideTableLeftCell\" >");
                sb2.Append("&#160;</td>");
                sb2.Append("<td align=\"center\" valign=\"middle\" class=\"FormInsideTableLeftCell\" >");
                sb2.Append("&#160;</td>");
                sb2.Append("<td align=\"center\" valign=\"middle\" class=\"FormInsideTableLeftCell\" >");
                sb2.Append("&#160;</td>");

                sb2.Append("</tr>");

                sb3.Append("<tr class=\"EFormTableRow\" onmouseover=\"this.className='chronListHilighted';\" onmouseout=\"this.className='EFormTableRow';\" onclick=\"LoadDataEntryForm('SocialHistories', '" + this.EFormPatientId.ToString() + "', 'SocHxOccupation,SocHxMaritalStatus,SocHxChildren,SocHxTobaccoType,SocHxTobaccoPacksPerDay,SocHxTobaccoYears,SocHxTobaccoQuitYear,SocHxAlcohol,SocHxCarcinogen')\" >");

                sb3.Append("<td align=\"center\" valign=\"middle\" class=\"FormInsideTableLeftCell\" >");
                sb3.Append("&#160;</td>");
                sb3.Append("<td align=\"center\" valign=\"middle\" class=\"FormInsideTableLeftCell\" >");
                sb3.Append("&#160;</td>");
                sb3.Append("<td align=\"center\" valign=\"middle\" class=\"FormInsideTableLeftCell\" >");
                sb3.Append("&#160;</td>");

                sb3.Append("</tr>");

                AddTransformArgument("HasSocialHistory", "", "No");
            }
            AddTransformArgument("PatientsSocialHistoriesRows", "", sb.ToString());
            AddTransformArgument("PatientsSocialHistoriesRows2", "", sb2.ToString());
            AddTransformArgument("PatientsSocialHistoriesRows3", "", sb3.ToString());
            
        }


        private void AddSurgeryHistoryParams()
        {

            DataSet surgeryDs;
            ProcedureDa surgeryDa = new ProcedureDa();
            surgeryDs = surgeryDa.FormGetRecords(this.EFormPatientId, this.EFormName, "Dynamic");
            DataView dv = new DataView(surgeryDs.Tables[0]);

            if (dv.Count > 0)
            {
                StringBuilder sb = new StringBuilder();
                StringBuilder sb2 = new StringBuilder();

                foreach (DataRow dr in dv.ToTable().Rows)
                {
                    sb.Append("<tr class=\"EFormTableRow\" onmouseover=\"this.className='chronListHilighted';\" onmouseout=\"this.className='EFormTableRow';\" onclick=\"LoadDataEntryForm('Procedures', '" + dr[Procedure.ProcedureId].ToString() + "', 'ProcDateText,ProcName,ProcSurgeon,ProcPrimary,ProcSite,ProcSide,ProcIndication,ProcNotes')\">");

                    sb.Append("<td align=\"center\" valign=\"middle\" class=\"FormInsideTableLeftCell\" >");
                    if (dr[Procedure.ProcPending].ToString() == "True")
                        sb.Append("Yes");
                    sb.Append("&#160;</td>");

                    sb.Append("<td align=\"center\" valign=\"middle\" class=\"FormInsideTableLeftCell\" >");
                    sb.Append(dr[Procedure.ProcDateText].ToString());
                    sb.Append("&#160;</td>");

                    sb.Append("<td align=\"center\" valign=\"middle\" class=\"FormInsideTableLeftCell\" >");
                    sb.Append(dr[Procedure.ProcSite].ToString());
                    sb.Append("&#160;</td>");

                    sb.Append("<td align=\"center\" valign=\"middle\" class=\"FormInsideTableRegCell\" >");
                    sb.Append(dr[Procedure.ProcSide].ToString());
                    sb.Append("&#160;</td>");

                    sb.Append("<td align=\"center\" valign=\"middle\" class=\"FormInsideTableRegCell\" >");
                    sb.Append(dr[Procedure.ProcName].ToString());
                    sb.Append("&#160;</td>");

                    sb.Append("<td align=\"center\" valign=\"middle\" class=\"FormInsideTableRegCell\" >");
                    sb.Append(dr[Procedure.ProcSurgeon].ToString());
                    sb.Append("&#160;</td>");

                    sb.Append("<td align=\"center\" valign=\"middle\" class=\"FormInsideTableRegCell\" >");
                    sb.Append(dr[Procedure.ProcIndication].ToString());
                    sb.Append("&#160;</td>");

                    sb.Append("<td align=\"center\" valign=\"middle\" class=\"FormInsideTableRegCell\" >");
                    sb.Append(dr[Procedure.ProcNotes].ToString());
                    sb.Append("&#160;</td>");
                    sb.Append("</tr>");

                    //create surgical history for Medical Disharge Summary eform transform
                    sb2.Append("<tr class=\"EFormTableRow\" onmouseover=\"this.className='chronListHilighted';\" onmouseout=\"this.className='EFormTableRow';\" onclick=\"LoadDataEntryForm('Procedures', '" + dr[Procedure.ProcedureId].ToString() + "', 'ProcPending,ProcDateText,ProcName,ProcSide,ProcNotes')\">");

                    sb2.Append("<td align=\"center\" valign=\"middle\" class=\"FormInsideTableLeftCell\" >");
                    if (dr[Procedure.ProcPending].ToString() == "True")
                        sb2.Append("Yes");
                    sb2.Append("&#160;</td>");

                    sb2.Append("<td align=\"center\" valign=\"middle\" class=\"FormInsideTableLeftCell\" >");
                    sb2.Append(dr[Procedure.ProcDateText].ToString());
                    sb2.Append("&#160;</td>");

                    sb2.Append("<td align=\"center\" valign=\"middle\" class=\"FormInsideTableLeftCell\" >");
                    sb2.Append(dr[Procedure.ProcName].ToString());
                    sb2.Append("&#160;</td>");

                    sb2.Append("<td align=\"center\" valign=\"middle\" class=\"FormInsideTableRegCell\" >");
                    sb2.Append(dr[Procedure.ProcSide].ToString());
                    sb2.Append("&#160;</td>");

                    sb2.Append("<td align=\"center\" valign=\"middle\" class=\"FormInsideTableRegCell\" >");
                    sb2.Append(dr[Procedure.ProcNotes].ToString());
                    sb2.Append("&#160;</td>");

                    sb2.Append("</tr>");

                }
                AddTransformArgument("SurgicalHistoryRows", "", sb.ToString());
                AddTransformArgument("SurgicalHistoryRowsPDS", "", sb2.ToString());

            }
        }

        private void AddSurgeryHistoryParams2()
        {

            DataSet surgeryDs;
            ProcedureDa surgeryDa = new ProcedureDa();
            surgeryDs = surgeryDa.FormGetRecords(this.EFormPatientId, this.EFormName, "Dynamic");

            DataView dv = new DataView(surgeryDs.Tables[0]);
            dv.RowFilter = Procedure.ProcPending + " IS NULL OR " + Procedure.ProcPending + " = " + false;
            if (dv.Count > 0)
            {
                StringBuilder sb = new StringBuilder();

                foreach (DataRow dr in dv.ToTable().Rows)
                {
                    sb.Append("<tr class=\"EFormTableRow\" onmouseover=\"this.className='chronListHilighted';\" onmouseout=\"this.className='EFormTableRow';\" onclick=\"LoadDataEntryForm('Procedures', '" + dr[Procedure.ProcedureId].ToString() + "', '')\">");

                    sb.Append("<td align=\"center\" valign=\"middle\" class=\"FormInsideTableLeftCell\" >");
                    sb.Append(dr[Procedure.ProcDateText].ToString());
                    sb.Append("&#160;</td>");

                    sb.Append("<td align=\"center\" valign=\"middle\" class=\"FormInsideTableRegCell\" >");
                    sb.Append(dr[Procedure.ProcName].ToString());
                    sb.Append("&#160;</td>");

                    sb.Append("<td align=\"center\" valign=\"middle\" class=\"FormInsideTableRegCell\" >");
                    sb.Append(dr[Procedure.ProcApproach].ToString());
                    sb.Append("&#160;</td>");
                    sb.Append("</tr>");

                }
                AddTransformArgument("SurgicalHistoryRows2", "", sb.ToString());

            }
        }

        private void AddProcedureParams()
        {

            DataSet surgeryDs;
            ProcedureDa surgeryDa = new ProcedureDa();
            surgeryDs = surgeryDa.FormGetRecords(this.EFormPatientId, this.EFormName, "Dynamic");

            DataView dv = new DataView(surgeryDs.Tables[0]);
            dv.RowFilter = Procedure.ProcPending + " = " + true;
            if (dv.Count > 0)
            {
                StringBuilder sb = new StringBuilder();

                foreach (DataRow dr in dv.ToTable().Rows)
                {
                    sb.Append("<tr class=\"EFormTableRow\" onmouseover=\"this.className='chronListHilighted';\" onmouseout=\"this.className='EFormTableRow';\" onclick=\"LoadDataEntryForm('Procedures', '" + dr[Procedure.ProcedureId].ToString() + "', '')\">");

                    sb.Append("<td align=\"center\" valign=\"middle\" class=\"FormInsideTableLeftCell\" >");
                    sb.Append(dr[Procedure.ProcDateText].ToString());
                    sb.Append("&#160;</td>");

                    sb.Append("<td align=\"center\" valign=\"middle\" class=\"FormInsideTableRegCell\" >");
                    sb.Append(dr[Procedure.ProcName].ToString());
                    sb.Append("&#160;</td>");

                    sb.Append("<td align=\"center\" valign=\"middle\" class=\"FormInsideTableRegCell\" >");
                    sb.Append(dr[Procedure.ProcSide].ToString());
                    sb.Append("&#160;</td>");

                    sb.Append("<td align=\"center\" valign=\"middle\" class=\"FormInsideTableRegCell\" >");
                    sb.Append(dr[Procedure.ProcNotes].ToString());
                    sb.Append("&#160;</td>");
                    sb.Append("</tr>");

                }
                AddTransformArgument("PlannedProceduresRows", "", sb.ToString());
            }

            DataView biopsyDv = new DataView(surgeryDs.Tables[0]);
            biopsyDv.RowFilter = Procedure.ProcName + " = 'Biopsy' ";

            if (biopsyDv.Count > 0)
            {
                StringBuilder sb2 = new StringBuilder();

                if (biopsyDv.Count > 10)
                {
                    sb2.Append("<tr class=\"EFormTableRow\" align=center style=\"background-color: #A8A8A8;\">");
                    sb2.Append("<td colspan=\"3\" align=\"center\" valign=\"middle\" class=\"FormInsideTableLeftCell\" >");
                    sb2.Append("<i>most recent 10&#160;</i></td>");
                    sb2.Append("</tr>");
                }

                biopsyDv.Sort = Procedure.ProcDate + " DESC ";
                biopsyDv = GetTopDataViewRows(biopsyDv, 10);
                biopsyDv.Sort = Procedure.ProcDate + " ASC ";

                foreach (DataRow dr in biopsyDv.ToTable().Rows)
                {
                    sb2.Append("<tr class=\"EFormTableRow\" onmouseover=\"this.className='chronListHilighted';\" onmouseout=\"this.className='EFormTableRow';\" onclick=\"LoadDataEntryForm('Procedures', '" + dr[Procedure.ProcedureId].ToString() + "', 'ProcDateText,ProcDate,ProcName,ProcApproach,ProcNotes')\">");

                    sb2.Append("<td align=\"center\" valign=\"middle\" class=\"FormInsideTableLeftCell\" >");
                    sb2.Append(dr[Procedure.ProcDateText].ToString());
                    sb2.Append("&#160;</td>");

                    sb2.Append("<td align=\"center\" valign=\"middle\" class=\"FormInsideTableRegCell\" >");
                    sb2.Append(dr[Procedure.ProcName].ToString());
                    sb2.Append("&#160;</td>");

                    sb2.Append("<td align=\"center\" valign=\"middle\" class=\"FormInsideTableRegCell\" >");
                    sb2.Append(dr[Procedure.ProcApproach].ToString());
                    sb2.Append("&#160;</td>");

                    sb2.Append("</tr>");

                    sb2.Append("<tr class=\"EFormTableRow\" onmouseover=\"this.className='chronListHilighted';\" onmouseout=\"this.className='EFormTableRow';\" onclick=\"LoadDataEntryForm('Procedures', '" + dr[Procedure.ProcedureId].ToString() + "', 'ProcDateText,ProcDate,ProcName,ProcApproach,ProcNotes')\">");

                    sb2.Append("<td colspan=\"3\" align=\"left\" valign=\"middle\" style=\"padding: 5px;\" class=\"FormInsideTableLeftCell\" >");
                    sb2.Append("<strong>Pathology Report:  </strong>" + dr[Procedure.ProcNotes].ToString());
                    sb2.Append("&#160;</td>");

                    sb2.Append("</tr>");
                }
                AddTransformArgument("BiopsyPerformedHxLS", "", sb2.ToString());


                DataView interventionalRadDv = new DataView(surgeryDs.Tables[0]);
                interventionalRadDv.RowFilter = Procedure.ProcName + " LIKE '%TACE%' OR " + Procedure.ProcName + " LIKE '%PVE%' OR " + Procedure.ProcName + " LIKE '%RFA%' ";

                if (interventionalRadDv.Count > 0)
                {
                    StringBuilder sb3 = new StringBuilder();

                    if (interventionalRadDv.Count > 10)
                    {
                        sb2.Append("<tr class=\"EFormTableRow\" align=center style=\"background-color: #A8A8A8;\">");
                        sb2.Append("<td colspan=\"6\" align=\"center\" valign=\"middle\" class=\"FormInsideTableLeftCell\" >");
                        sb2.Append("<i>most recent 10&#160;</i></td>");
                        sb2.Append("</tr>");
                    }

                    interventionalRadDv.Sort = Procedure.ProcDate + " DESC ";
                    interventionalRadDv = GetTopDataViewRows(interventionalRadDv, 10);
                    interventionalRadDv.Sort = Procedure.ProcDate + " ASC ";

                    foreach (DataRow dr3 in interventionalRadDv.ToTable().Rows)
                    {
                        sb3.Append("<tr class=\"EFormTableRow\" onmouseover=\"this.className='chronListHilighted';\" onmouseout=\"this.className='EFormTableRow';\" onclick=\"LoadDataEntryForm('Procedures', '" + dr3[Procedure.ProcedureId].ToString() + "', 'ProcDateText,ProcDate,ProcName,ProcSite,ProcSubsite,ProcSurgeon,ProcApproach,ProcNotes')\">");

                        sb3.Append("<td align=\"center\" valign=\"middle\" class=\"FormInsideTableLeftCell\" >");
                        sb3.Append(dr3[Procedure.ProcDateText].ToString());
                        sb3.Append("&#160;</td>");

                        sb3.Append("<td align=\"center\" valign=\"middle\" class=\"FormInsideTableRegCell\" >");
                        sb3.Append(dr3[Procedure.ProcName].ToString());
                        sb3.Append("&#160;</td>");

                        sb3.Append("<td align=\"center\" valign=\"middle\" class=\"FormInsideTableRegCell\" >");
                        sb3.Append(dr3[Procedure.ProcSubsite].ToString());
                        sb3.Append("&#160;</td>");

                        sb3.Append("<td align=\"center\" valign=\"middle\" class=\"FormInsideTableRegCell\" >");
                        sb3.Append(dr3[Procedure.ProcSurgeon].ToString());
                        sb3.Append("&#160;</td>");

                        sb3.Append("<td align=\"center\" valign=\"middle\" class=\"FormInsideTableRegCell\" >");
                        sb3.Append(dr3[Procedure.ProcApproach].ToString());
                        sb3.Append("&#160;</td>");

                        sb3.Append("<td align=\"center\" valign=\"middle\" class=\"FormInsideTableRegCell\" >");
                        sb3.Append(dr3[Procedure.ProcNotes].ToString());
                        sb3.Append("&#160;</td>");

                        sb3.Append("</tr>");

                    }
                    AddTransformArgument("InterventionalRadHxLS", "", sb3.ToString());

                }
            }
        }

        private void AddBrachyTherapyParams()
        {

            // check if patient already had Brachy
            Caisis.BOL.BrachyTherapy brachy = new Caisis.BOL.BrachyTherapy();
            brachy.Get(int.Parse(Session[SessionKey.PatientId].ToString()));
            //DataTable brachyTherapyDt = brachy.GetTable();
			DataTable brachyTherapyDt = new BrachyTherapy[] { brachy }.AsDataView().Table;

            StringBuilder sb = new StringBuilder();

            if (brachyTherapyDt.Rows.Count > 0)
            {
                foreach (DataRow dr in brachyTherapyDt.Rows)
                {
                    sb.Append("<tr class=\"EFormTableRow\" onmouseover=\"this.className='chronListHilighted';\" onmouseout=\"this.className='EFormTableRow';\" onclick=\"LoadDataEntryForm('BrachyTherapy', '" + dr[Patient.PatientId].ToString() + "', 'BrachyDateText,BrachyPrescribedDose,BrachyIsotope,BrachyInstitution,BrachyNotes')\" >");

                    sb.Append("<td align=\"center\" valign=\"middle\" class=\"FormInsideTableLeftCell\" >");
                    sb.Append(dr[BrachyTherapy.BrachyDateText].ToString());
                    sb.Append("&#160;</td>");

                    sb.Append("<td align=\"center\" valign=\"middle\" class=\"FormInsideTableLeftCell\" >");
                    sb.Append(dr[BrachyTherapy.BrachyPrescribedDose].ToString());
                    sb.Append("&#160;</td>");

                    sb.Append("<td align=\"center\" valign=\"middle\" class=\"FormInsideTableRegCell\" >");
                    sb.Append(dr[BrachyTherapy.BrachyIsotope].ToString());
                    sb.Append("&#160;</td>");

                    sb.Append("<td align=\"center\" valign=\"middle\" class=\"FormInsideTableLeftCell\" >");
                    sb.Append(dr[BrachyTherapy.BrachyInstitution].ToString());
                    sb.Append("&#160;</td>");

                    sb.Append("<td align=\"center\" valign=\"middle\" class=\"FormInsideTableRegCell\" >");
                    sb.Append(dr[BrachyTherapy.BrachyNotes].ToString());
                    sb.Append("&#160;</td>");

                    sb.Append("</tr>");

                }
                AddTransformArgument("HasBrachyTherapyHistory", "", "Yes");  
            }
            else
            {
                sb.Append("<tr class=\"EFormTableRow\" onmouseover=\"this.className='chronListHilighted';\" onmouseout=\"this.className='EFormTableRow';\" onclick=\"LoadDataEntryForm('BrachyTherapy', '" + this.EFormPatientId.ToString() + "', 'BrachyDateText,BrachyPrescribedDose,BrachyIsotope,BrachyInstitution,BrachyNotes')\" >");

                sb.Append("<td align=\"center\" valign=\"middle\" class=\"FormInsideTableLeftCell\" >");
                sb.Append("&#160;</td>");
                sb.Append("<td align=\"center\" valign=\"middle\" class=\"FormInsideTableLeftCell\" >");
                sb.Append("&#160;</td>");
                sb.Append("<td align=\"center\" valign=\"middle\" class=\"FormInsideTableLeftCell\" >");
                sb.Append("&#160;</td>");
                sb.Append("<td align=\"center\" valign=\"middle\" class=\"FormInsideTableLeftCell\" >");
                sb.Append("&#160;</td>");
                sb.Append("<td align=\"center\" valign=\"middle\" class=\"FormInsideTableLeftCell\" >");
                sb.Append("&#160;</td>");

                sb.Append("</tr>");
                AddTransformArgument("HasBrachyTherapyHistory", "", "No");  
            }
            AddTransformArgument("BrachyTherapyRows", "", sb.ToString());
        }


        private void AddHospitalizationsParams()
        {

            DataSet hospDs;
            HospitalizationDa hospDa = new HospitalizationDa();
            hospDs = hospDa.FormGetRecords(this.EFormPatientId, this.EFormName, "Dynamic");
            DataView dv = new DataView(hospDs.Tables[0]);

            if (dv.Count > 0)
            {
                StringBuilder sb = new StringBuilder();

                foreach (DataRowView dr in dv)
                {
                    // create string for Hospitalizations for Pharmaceutical History Eform
                    sb.Append("<tr class=\"EFormTableRow\" onmouseover=\"this.className='chronListHilighted';\" onmouseout=\"this.className='EFormTableRow';\" onclick=\"LoadDataEntryForm('Hospitalizations', '" + dr[Hospitalization.HospitalizationId].ToString() + "', '')\">");

                    sb.Append("<td align=\"center\" valign=\"middle\" class=\"FormInsideTableLeftCell\" >");
                    sb.Append(dr[Hospitalization.HospAdmitDateText].ToString());
                    sb.Append("&#160;</td>");

                    sb.Append("<td align=\"center\" valign=\"middle\" class=\"FormInsideTableRegCell\" >");
                    sb.Append(dr[Hospitalization.HospLivingArrangmentPre].ToString());
                    sb.Append("&#160;</td>");

                    sb.Append("</tr>");
                }

                DataSet hospDs2;
                hospDs2 = hospDa.FormGetHospitalizationsWithServiceAction(this.EFormPatientId, this.EFormName, "Dynamic");
                DataView dv2 = new DataView(hospDs2.Tables[0]);

                if (dv2.Count > 0)
                {
                    StringBuilder sb2 = new StringBuilder();

                    foreach (DataRowView dr2 in dv2)
                    {
                        // create string for Hospitalizations for Medical Disharge Summary Eform

                        // display only current hospitalizations
                        DateTime dischargeDateObj = DateTime.Today;
                        string dischargeDateString = String.Empty;

                        if (DateTime.TryParse(dr2[Hospitalization.HospDischargeDate].ToString(), out dischargeDateObj))
                            dischargeDateString = dr2[Hospitalization.HospDischargeDate].ToString();

                        if (String.IsNullOrEmpty(dischargeDateString) || dischargeDateObj >= DateTime.Today)
                        {
                            sb2.Append("<tr class=\"EFormTableRow\" onmouseover=\"this.className='chronListHilighted';\" onmouseout=\"this.className='EFormTableRow';\" >");

                            sb2.Append("<td align=\"left\" valign=\"middle\" class=\"FormInsideTableLeftCell\" style=\"white-space: nowrap;\" onclick=\"LoadDataEntryForm('Hospitalizations', '" + dr2[Hospitalization.HospitalizationId].ToString() + "', '')\">");
                            sb2.Append("A.: " + dr2[Hospitalization.HospAdmitDateText].ToString() + "<br/>D.: " + dr2[Hospitalization.HospDischargeDateText].ToString());
                            sb2.Append("&#160;</td>");

                            sb2.Append("<td align=\"center\" valign=\"middle\" class=\"FormInsideTableRegCell\" onclick=\"LoadDataEntryForm('Hospitalizations', '" + dr2[Hospitalization.HospitalizationId].ToString() + "', '')\">");
                            sb2.Append(dr2[Hospitalization.HospAdmitReason].ToString());
                            sb2.Append("&#160;</td>");

                            sb2.Append("<td align=\"center\" valign=\"middle\" class=\"FormInsideTableRegCell\" onclick=\"LoadDataEntryForm('Actions', '" + dr2[BOL.Action.ActionId].ToString() + "', '')\">");
                            sb2.Append(dr2[BOL.Action.ActionNotes].ToString());
                            sb2.Append("&#160;</td>");

                            sb2.Append("<td align=\"center\" valign=\"middle\" class=\"FormInsideTableRegCell\" onclick=\"LoadDataEntryForm('Hospitalizations', '" + dr2[Hospitalization.HospitalizationId].ToString() + "', '')\">");
                            sb2.Append(dr2[Hospitalization.HospDepartment].ToString());
                            sb2.Append("&#160;</td>");

                            sb2.Append("<td align=\"center\" valign=\"middle\" class=\"FormInsideTableRegCell\" onclick=\"LoadDataEntryForm('Hospitalizations', '" + dr2[Hospitalization.HospitalizationId].ToString() + "', '')\">");
                            sb2.Append(dr2[Hospitalization.HospAdmitPhysician].ToString());
                            sb2.Append("&#160;</td>");

                            sb2.Append("<td align=\"left\" valign=\"middle\" class=\"FormInsideTableRegCell\" style=\"white-space: nowrap;\" onclick=\"LoadDataEntryForm('Hospitalizations', '" + dr2[Hospitalization.HospitalizationId].ToString() + "', '')\">");
                            sb2.Append("Pre: " + dr2[Hospitalization.HospLivingArrangmentPre].ToString() + "<br/>Post: " + dr2[Hospitalization.HospLivingArrangmentPost].ToString());
                            sb2.Append("&#160;</td>");

                            if (!String.IsNullOrEmpty(dr2[Patient.PtDeathDateText].ToString()))
                            {
                                DateTime deathDateObj = DateTime.Parse(dr2[Patient.PtDeathDateText].ToString());

                                // if this hospitalization does not have a discharge date, but does have admit date 
                                if (String.IsNullOrEmpty(dr2[Hospitalization.HospDischargeDateText].ToString()) && !String.IsNullOrEmpty(dr2[Hospitalization.HospAdmitDateText].ToString()))
                                {
                                    DateTime admitDateObj = DateTime.Parse(dr2[Hospitalization.HospAdmitDateText].ToString());
                                    if (deathDateObj >= admitDateObj)
                                    {
                                        // if patient has a death date is equal or greater than admit date, patient died during this visit
                                        sb2.Append("<td align=\"center\" valign=\"middle\" class=\"FormInsideTableRegCell\" >");
                                        sb2.Append("Yes: " + dr2[Patient.PtDeathDateText].ToString());
                                        sb2.Append("&#160;</td>");
                                    }
                                    else
                                    {
                                        sb2.Append("<td align=\"center\" valign=\"middle\" class=\"FormInsideTableRegCell\" >");
                                        sb2.Append("No");
                                        sb2.Append("&#160;</td>");
                                    }

                                }
                                // if patient has a death date is equal or less than discharge date, patient died during this visit
                                else if (!String.IsNullOrEmpty(dr2[Hospitalization.HospDischargeDate].ToString()))
                                {
                                    DateTime dischargeDateObj2 = DateTime.Parse(dr2[Hospitalization.HospDischargeDate].ToString());

                                    if (deathDateObj <= dischargeDateObj2)
                                    {
                                        sb2.Append("<td align=\"center\" valign=\"middle\" class=\"FormInsideTableRegCell\" >");
                                        sb2.Append("Yes: " + dr2[Patient.PtDeathDateText].ToString());
                                        sb2.Append("&#160;</td>");
                                    }
                                    else
                                    {
                                        sb2.Append("<td align=\"center\" valign=\"middle\" class=\"FormInsideTableRegCell\" >");
                                        sb2.Append("No");
                                        sb2.Append("&#160;</td>");
                                    }
                                }
                                else
                                {
                                    sb2.Append("<td align=\"center\" valign=\"middle\" class=\"FormInsideTableRegCell\" >");
                                    sb2.Append("No");
                                    sb2.Append("&#160;</td>");
                                }
                            }
                            else
                            {
                                sb2.Append("<td align=\"center\" valign=\"middle\" class=\"FormInsideTableRegCell\" >");
                                sb2.Append("No");
                                sb2.Append("&#160;</td>");
                            }


                            sb2.Append("<td align=\"left\" valign=\"middle\" class=\"FormInsideTableRegCell\" style=\"white-space: nowrap;\" onclick=\"LoadDataEntryForm('Hospitalizations', '" + dr2[Hospitalization.HospitalizationId].ToString() + "', '')\">");
                            sb2.Append("Pre: " + dr2[Hospitalization.HospAmbulationPre].ToString() + "<br/>Post: " + dr2[Hospitalization.HospAmbulationPost].ToString());
                            sb2.Append("&#160;</td>");

                            sb2.Append("</tr>");

                            sb2.Append("<tr class=\"EFormTableRow\" onmouseover=\"this.className='chronListHilighted';\" onmouseout=\"this.className='EFormTableRow';\" >");
                            sb2.Append("<td colspan=\"8\" align=\"left\" valign=\"middle\" class=\"FormInsideTableRegCell\" onclick=\"LoadDataEntryForm('Hospitalizations', '" + dr2[Hospitalization.HospitalizationId].ToString() + "', '')\">");
                            sb2.Append("<Strong>Notes:</strong> " + dr2[Hospitalization.HospNotes].ToString());
                            sb2.Append("&#160;</td>");

                            sb2.Append("</tr>");
                        }
                    }
                    AddTransformArgument("HospitalizationsPH", "", sb.ToString());
                    AddTransformArgument("HospitalizationsPDSHistory", "", sb2.ToString());

                }
            }
        }

        private void AddStatusParams()
        {

            DataSet statusDs;
            StatusDa statusDa = new StatusDa();
            statusDs = statusDa.GetStatus(this.EFormPatientId, "Medication Management");
            DataView dv = new DataView(statusDs.Tables[0]);

            if (dv.Count > 0)
            {
                // create string for RxKnowledge/Management for Pharmaceutical History Eform transform
                StringBuilder sb = new StringBuilder();

                foreach (DataRow dr in dv.ToTable().Rows)
                {
                    sb.Append("<tr class=\"EFormTableRow\" onmouseover=\"this.className='chronListHilighted';\" onmouseout=\"this.className='EFormTableRow';\" onclick=\"LoadDataEntryForm('Status', '" + dr[Status.StatusId].ToString() + "', '')\">");

                    sb.Append("<td align=\"center\" valign=\"middle\" class=\"FormInsideTableLeftCell\" >");
                    sb.Append(dr[Status.StatusDateText].ToString());
                    sb.Append("&#160;</td>");

                    sb.Append("<td align=\"center\" valign=\"middle\" class=\"FormInsideTableLeftCell\" >");
                    sb.Append(dr[Status.Status_Field].ToString());
                    sb.Append("&#160;</td>");

                    sb.Append("<td align=\"center\" valign=\"middle\" class=\"FormInsideTableRegCell\" >");
                    sb.Append(dr[Status.StatusPhysician].ToString());
                    sb.Append("&#160;</td>");

                    sb.Append("<td align=\"center\" valign=\"middle\" class=\"FormInsideTableRegCell\" >");
                    sb.Append(dr[Status.StatusNotes].ToString());
                    sb.Append("&#160;</td>");

                    sb.Append("</tr>");

                }
                AddTransformArgument("RxKnowledgePH", "", sb.ToString());
                AddTransformArgument("RxKnowledgePDS", "", sb.ToString());

            }

            statusDs = statusDa.GetStatusField(this.EFormPatientId, "Diagnosis Date");
            dv = new DataView(statusDs.Tables[0]);

            if (dv.Count > 0)
            {
                StringBuilder sb2 = new StringBuilder();

                // limit to last 10 records
                DataView statusDv = new DataView(statusDs.Tables[0]);
                statusDv.Sort = Status.StatusDate + " DESC ";
                statusDv = GetTopDataViewRows(statusDv, 10);
                statusDv.Sort = Status.StatusDate + " ASC ";

                if (dv.Count > 10)
                {
                    sb2.Append("<tr class=\"EFormTableRow\" align=center style=\"background-color: #A8A8A8;\">");
                    sb2.Append("<td colspan=\"2\" align=\"center\" valign=\"middle\" class=\"FormInsideTableLeftCell\" >");
                    sb2.Append("<i>most recent 10&#160;</i></td>");
                    sb2.Append("</tr>");
                }

                foreach (DataRow dr2 in statusDv.ToTable().Rows)
                {
                    sb2.Append("<tr class=\"EFormTableRow\" onmouseover=\"this.className='chronListHilighted';\" onmouseout=\"this.className='EFormTableRow';\" onclick=\"LoadDataEntryForm('Status', '" + dr2[Status.StatusId].ToString() + "', '')\">");

                    sb2.Append("<td align=\"center\" valign=\"middle\" class=\"FormInsideTableLeftCell\" >");
                    sb2.Append(dr2[Status.StatusDateText].ToString());
                    sb2.Append("&#160;</td>");

                    sb2.Append("<td align=\"center\" valign=\"middle\" class=\"FormInsideTableLeftCell\" >");
                    sb2.Append(dr2[Status.StatusDisease].ToString());
                    sb2.Append("&#160;</td>");

                    sb2.Append("</tr>");
                }

                AddTransformArgument("DiagnosisDateHxLS", "", sb2.ToString());

            }


        }


        private void AddCategoryParams()
        {

            DataSet categoryDs;
            CategoryDa categoryDa = new CategoryDa();
            categoryDs = categoryDa.GetPatientCategories(this.EFormPatientId);
            DataView dv = new DataView(categoryDs.Tables[0]);

            dv.RowFilter = Category.Category_Field + " LIKE '*Insurance*' ";
            StringBuilder sb = new StringBuilder();
            if (dv.Count > 0)
            {
                // create string for Insurance Type for Pharmaceutical History Eform transform
                

                foreach (DataRowView dr in dv)
                {
                    sb.Append("<tr class=\"EFormTableRow\" onmouseover=\"this.className='chronListHilighted';\" onmouseout=\"this.className='EFormTableRow';\" onclick=\"LoadDataEntryForm('Categories', '" + dr[Category.CategoryId].ToString() + "', '')\">");

                    sb.Append("<td align=\"center\" valign=\"middle\" class=\"FormInsideTableLeftCell\" >");
                    sb.Append(dr[Category.Category_Field].ToString());
                    sb.Append("&#160;</td>");

                    sb.Append("</tr>");

                }          
            }
            else
            {
                sb.Append("<tr class=\"EFormTableRow\" onmouseover=\"this.className='chronListHilighted';\" onmouseout=\"this.className='EFormTableRow';\" onclick=\"LoadComponentByTable('Categories','')\">");

                sb.Append("<td align=\"center\" valign=\"middle\" class=\"FormInsideTableLeftCell\" >");
                sb.Append("&#160;</td>");

                sb.Append("</tr>");
            }
            AddTransformArgument("InsuranceTypePH", "", sb.ToString());
        }

        private void AddContactsParams()
        {
/* PatientID field only In MUHC Release for Contacts table 
 
            DataSet contactDs;
            ContactsDa contactDa = new ContactsDa();
            contactDs = contactDa.GetContactByPatientIDandContactType(this.EFormPatientId, "Patient Pharmacy");
            DataView dv = new DataView(contactDs.Tables[0]);

            if (dv.Count > 0)
            {
                // create string for Patient Pharmacies for Pharmaceutical History Eform transform
                StringBuilder sb = new StringBuilder();

                foreach (DataRowView dr in dv)
                {
                    sb.Append("<tr class=\"EFormTableRow\" onmouseover=\"this.className='chronListHilighted';\" onmouseout=\"this.className='EFormTableRow';\" onclick=\"LoadDataEntryForm('Contact', '" + dr[Contact.ContactId].ToString() + "', '')\">");

                    sb.Append("<td align=\"center\" valign=\"middle\" class=\"FormInsideTableLeftCell\" >");
                    sb.Append(dr[Contact.LastName].ToString());
                    sb.Append("&#160;</td>");

                    sb.Append("<td align=\"center\" valign=\"middle\" class=\"FormInsideTableLeftCell\" >");
                    sb.Append(dr[Contact.Address1].ToString());
                    sb.Append("&#160;</td>");

                    sb.Append("<td align=\"center\" valign=\"middle\" class=\"FormInsideTableLeftCell\" >");
                    sb.Append(dr[Contact.AssistantPhone].ToString());
                    sb.Append("&#160;</td>");

                    sb.Append("<td align=\"center\" valign=\"middle\" class=\"FormInsideTableLeftCell\" >");
                    sb.Append(dr[Contact.AssistantFax].ToString());
                    sb.Append("&#160;</td>");

                    sb.Append("</tr>");

                }
                AddTransformArgument("PatientPharmaciesPH", "", sb.ToString());
                AddTransformArgument("PatientPharmaciesPDS", "", sb.ToString());
            }
 */
     }


        private void AddAppointmentParams()
        {

            DataSet ptDs;
            PatientDa ptDa = new PatientDa();
            DataSet apptDs = ptDa.FormGetPatientAppointments(this.EFormPatientId,null,null);
            DataView dv = new DataView(apptDs.Tables[0]);

            dv.Sort = Appointment.ApptClinicDate + " ASC, " + Appointment.ApptTime + " ASC ";
            if (dv.Count > 0)
            {
                // create string for Follow Up for Medical Disharge Summary Eform transform
                StringBuilder sb = new StringBuilder();

                foreach (DataRowView dr in dv)
                {
                    sb.Append("<tr class=\"EFormTableRow\" onmouseover=\"this.className='chronListHilighted';\" onmouseout=\"this.className='EFormTableRow';\" onclick=\"LoadDataEntryForm('Appointments', '" + dr[Appointment.AppointmentId].ToString() + "', '')\">");

                    sb.Append("<td align=\"center\" valign=\"middle\" class=\"FormInsideTableLeftCell\" >");
                    sb.Append(DateTime.Parse(dr[Appointment.ApptClinicDate].ToString()).ToShortDateString());
                    sb.Append("&#160;</td>");

                    string apptTime = String.Empty;
                    if (!String.IsNullOrEmpty(dr[Appointment.ApptTime].ToString()))
                    {
                        // retrieve current culture
                        System.Globalization.CultureInfo currentCulture = System.Globalization.CultureInfo.CurrentCulture;

                        // if culture is set to "en-US", use 12 hr time, else, use 24hr time
                        if (currentCulture.Name.Contains("en-US"))
                            apptTime = DateTime.Parse(dr[Appointment.ApptTime].ToString()).ToShortTimeString();
                        else
                            apptTime = DateTime.Parse(dr[Appointment.ApptTime].ToString()).ToString("H:mm");
                    }
                    sb.Append("<td align=\"center\" valign=\"middle\" class=\"FormInsideTableLeftCell\" >");
                    sb.Append(apptTime);
                    sb.Append("&#160;</td>");

                    sb.Append("<td align=\"center\" valign=\"middle\" class=\"FormInsideTableLeftCell\" >");
                    sb.Append(dr[Appointment.ApptDept].ToString());
                    sb.Append("&#160;</td>");

                    sb.Append("<td align=\"center\" valign=\"middle\" class=\"FormInsideTableLeftCell\" >");
                    sb.Append(dr[Appointment.ApptPhysician].ToString());
                    sb.Append("&#160;</td>");

                    sb.Append("<td align=\"center\" valign=\"middle\" class=\"FormInsideTableLeftCell\" >");
                    sb.Append(dr[Appointment.ApptNotes].ToString());
                    sb.Append("&#160;</td>");

                    sb.Append("</tr>");

                }
                AddTransformArgument("PatientAppointmentsPDSHistory", "", sb.ToString());

            }
        }


        private void AddDietaryIntakeParams()
        {
            DietaryIntakeDa dietDa = new DietaryIntakeDa();
            DataSet dietDs = dietDa.FormGetRecords(this.EFormPatientId,this.EFormName,"Dynamic");
            DataView dv = new DataView(dietDs.Tables[0]);

            if (dv.Count > 0)
            {
                // create string for Diet for Medical Disharge Summary Eform transform
                StringBuilder sb = new StringBuilder();

                foreach (DataRowView dr in dv)
                {
                    sb.Append("<tr class=\"EFormTableRow\" onmouseover=\"this.className='chronListHilighted';\" onmouseout=\"this.className='EFormTableRow';\" onclick=\"LoadDataEntryForm('DietaryIntake', '" + dr[DietaryIntake.DietaryIntakeId].ToString() + "', '')\">");

                    sb.Append("<td align=\"center\" valign=\"middle\" class=\"FormInsideTableLeftCell\" >");
                    sb.Append(dr[DietaryIntake.IntakeDateText].ToString());
                    sb.Append("&#160;</td>");

                    sb.Append("<td align=\"center\" valign=\"middle\" class=\"FormInsideTableLeftCell\" >");
                    sb.Append(dr[DietaryIntake.IntakeNotes].ToString());
                    sb.Append("&#160;</td>");

                    sb.Append("</tr>");

                }
                AddTransformArgument("DietRowsPDS", "", sb.ToString());

            }
        }

        private void AddPSADTParam()
        {
            string DT = "";

            NomogramDa nda = new NomogramDa();
            try
            {
                float psaDoublingTime = nda.GetPSADoublingTime(this.EFormPatientId);

                if (psaDoublingTime != float.PositiveInfinity)
                {
                    DT = string.Format("{0:F2} months (calculated based on the last 3 valid PSA values).", psaDoublingTime);
                }
            }
            catch { }

            AddTransformArgument("psaDT", "", DT);

        }

        private void AddCurrentMedTxParams()
        {

            MedicalTherapyDa Da = new MedicalTherapyDa();
            DataSet Ds = new DataSet();

            Ds = Da.FormGetRecords(this.EFormPatientId, this.EFormName, "Dynamic");


            if (Ds.Tables.Count > 0 && Ds.Tables[0].Rows.Count > 0)
            {
                if (Ds.Tables[0].Rows[(Ds.Tables[0].Rows.Count) - 1]["MedTxStopDateText"].ToString().Length < 1)
                {

                    StringBuilder sb = new StringBuilder();

                    sb.Append("<tr  class=\"EFormTableRow\" onmouseover=\"this.className='chronListHilighted';\" onmouseout=\"this.className='EFormTableRow';\" onclick=\"LoadDataEntryForm('MedicalTherapy', '" + Ds.Tables[0].Rows[(Ds.Tables[0].Rows.Count) - 1]["MedicalTherapyId"].ToString() + "', '')\"><td height=\"28\" valign=\"middle\" class=\"FormInsideTableRegCell\"><strong>Current TX</strong>&#160;&#160;&#160;");
                    sb.Append(Ds.Tables[0].Rows[(Ds.Tables[0].Rows.Count) - 1]["MedTxAgent"].ToString());
                    sb.Append("</td><td colspan=\"3\" valign=\"middle\" class=\"FormInsideTableRegCell\">Start Date&#160;&#160;");
                    sb.Append(Ds.Tables[0].Rows[(Ds.Tables[0].Rows.Count) - 1]["MedTxDateText"].ToString());
                    sb.Append("</td></tr>");
                    AddTransformArgument("CurrentMedTxParams", "", sb.ToString());

                }
            }

        }

        private void AddGUProstateStatusParams()
		{
            StringBuilder sb = new StringBuilder();

            sb.Append(BuildGUProstateStatusParamRow("Localized"));
            sb.Append(BuildGUProstateStatusParamRow("Rising PSA Non-Castrate"));
            sb.Append(BuildGUProstateStatusParamRow("Clinical Mets Non-Castrate"));
            sb.Append(BuildGUProstateStatusParamRow("Rising PSA Castrate"));
            sb.Append(BuildGUProstateStatusParamRow("Clinical Mets Castrate"));
            if (sb.ToString().Length > 0) { AddTransformArgument("GUProstateStatusParams", "", sb.ToString()); }
		}


        private string BuildGUProstateStatusParamRow(string Status)
		{
			StatusDa sDa = new StatusDa();
            DataSet sDs = sDa.FormGetLastStatusByStatus(this.EFormPatientId, this.EFormName, "Dynamic", Status);

            StringBuilder sb2 = new StringBuilder();
            if (sDs.Tables.Count > 0 && sDs.Tables[0].Rows.Count > 0)
			{
				if (sDs.Tables[0].Rows[0]["StatusDateText"].ToString().Length > 0)
				{
                    sb2.Append("<tr  class=\"EFormTableRow\" onmouseover=\"this.className='chronListHilighted';\" onmouseout=\"this.className='EFormTableRow';\" onclick=\"LoadDataEntryForm('Status', '" + sDs.Tables[0].Rows[0]["StatusId"].ToString() + "', '')\">");
                    sb2.Append("<td align=\"center\" valign=\"middle\" class=\"FormInsideTableRegCell\">" + sDs.Tables[0].Rows[0]["StatusDateText"].ToString() + "&#160;</td>");
                    sb2.Append("<td align=\"center\" valign=\"middle\" class=\"FormInsideTableRegCell\">" + sDs.Tables[0].Rows[0]["Status"].ToString() + "&#160;</td>");
                    sb2.Append("</tr>");
				}
				else
				{
                    sb2.Append("<tr  class=\"EFormTableRow\" onmouseover=\"this.className='chronListHilighted';\" onmouseout=\"this.className='EFormTableRow';\" onclick=\"LoadDataEntryForm('Status', '" + sDs.Tables[0].Rows[0]["StatusId"].ToString() + "', '')\">");
                    sb2.Append("<td align=\"center\" valign=\"middle\" class=\"FormInsideTableRegCell\">" + sDs.Tables[0].Rows[0]["StatusDate"].ToString() + "&#160;</td>");
                    sb2.Append("<td align=\"center\" valign=\"middle\" class=\"FormInsideTableRegCell\">" + sDs.Tables[0].Rows[0]["Status"].ToString() + "&#160;</td>");
                    sb2.Append("</tr>");
                }            
			}
            return sb2.ToString();
		}

        private void AddEncounterParams()
        {
            EncounterDa encDa = new EncounterDa();
            DataSet encDs = encDa.FormGetRecords(base.EFormPatientId, "", "Dynamic");

            if (encDs.Tables.Count > 0 && encDs.Tables[0].Rows.Count > 0)
            {
                StringBuilder sb = new StringBuilder();

                DataView encDv = new DataView(encDs.Tables[0]);
                encDv.Sort = Encounter.EncDate + " DESC ";
                encDv = GetTopDataViewRows(encDv, 10);
                encDv.Sort = Encounter.EncDate + " ASC ";

                if (encDs.Tables[0].Rows.Count > 10)
                {
                    sb.Append("<tr class=\"EFormTableRow\" align=center style=\"background-color: #A8A8A8;\">");
                    sb.Append("<td colspan=\"6\" align=\"center\" valign=\"middle\" class=\"FormInsideTableLeftCell\" >");
                    sb.Append("<i>most recent 10&#160;</i></td>");
                    sb.Append("</tr>");
                }

                foreach (DataRow dr in encDv.ToTable().Rows)
                {
                    sb.Append("<tr class=\"EFormTableRow\" onmouseover=\"this.className='chronListHilighted';\" onmouseout=\"this.className='EFormTableRow';\" onclick=\"LoadDataEntryForm('Encounters', '" + dr[Encounter.EncounterId].ToString() + "', 'EncDateText,EncDate,EncHeight,EncWeight,EncBMI,EncInstitution')\">");
 
                    sb.Append("<td align=center valign=middle class=\"FormInsideTableRegCell\">");
                    sb.Append(dr[Encounter.EncDateText].ToString());
                    sb.Append("&#160;</td>");

                    sb.Append("<td align=center valign=middle class=\"FormInsideTableRegCell\">");
                    sb.Append(dr[Encounter.EncHeight].ToString());
                    sb.Append("&#160;</td>");

                    sb.Append("<td align=center valign=middle class=\"FormInsideTableRegCell\">");
                    sb.Append(dr[Encounter.EncWeight].ToString());
                    sb.Append("&#160;</td>");

                    sb.Append("<td align=center valign=middle class=\"FormInsideTableRegCell\">");
                    sb.Append(dr[Encounter.EncBMI].ToString());
                    sb.Append("&#160;</td>");

                    sb.Append("<td align=center valign=middle class=\"FormInsideTableRegCell\">");
                    sb.Append(dr[Encounter.EncInstitution].ToString());
                    sb.Append("&#160;</td>");

                    sb.Append("<td align=center valign=middle class=\"FormInsideTableRegCell\">");
                    if (dr[Encounter.EncNotes].ToString().Contains("OTHER EFORM DATA"))
                        sb.Append("[not shown]");
                    else
                        sb.Append(dr[Encounter.EncNotes].ToString());
                    sb.Append("&#160;</td>");

                    sb.Append("</tr>");
                }
                AddTransformArgument("VitalSignsHxLS", "", sb.ToString());


                StringBuilder sb2 = new StringBuilder();

                DataView encDv2 = new DataView(encDs.Tables[0]);
                encDv2.RowFilter = "(" + Encounter.EncECOG_Score + " IS NOT NULL OR " + Encounter.EncECOG_Score + " <> '') AND (" + Encounter.EncKPS + " IS NOT NULL OR " + Encounter.EncKPS + " <> '') ";
                encDv2.Sort = Encounter.EncDate + " DESC ";
                encDv2 = GetTopDataViewRows(encDv2, 10);
                encDv2.Sort = Encounter.EncDate + " ASC ";

                if (encDv2.Count > 10)
                {
                    sb2.Append("<tr class=\"EFormTableRow\" align=center style=\"background-color: #A8A8A8;\">");
                    sb2.Append("<td colspan=\"2\" align=\"center\" valign=\"middle\" class=\"FormInsideTableLeftCell\" >");
                    sb2.Append("<i>most recent 10&#160;</i></td>");
                    sb2.Append("</tr>");
                }

                foreach (DataRow dr2 in encDv2.ToTable().Rows)
                {
                    sb2.Append("<tr class=\"EFormTableRow\" onmouseover=\"this.className='chronListHilighted';\" onmouseout=\"this.className='EFormTableRow';\" onclick=\"LoadDataEntryForm('Encounters', '" + dr2[Encounter.EncounterId].ToString() + "', 'EncDateText,EncDate,EncECOG_Score,EncKPS')\">");

                    sb2.Append("<td align=center valign=middle class=\"FormInsideTableRegCell\">");
                    sb2.Append(dr2[Encounter.EncECOG_Score].ToString());
                    sb2.Append("&#160;</td>");

                    sb2.Append("<td align=center valign=middle class=\"FormInsideTableRegCell\">");
                    sb2.Append(dr2[Encounter.EncKPS].ToString());
                    sb2.Append("&#160;</td>");

                    sb2.Append("</tr>");
                }
                AddTransformArgument("PerformanceLiverHxLS", "", sb2.ToString());
            }

        }



        private void AddCombinedBiopsies_Prostate()
        {
            DataTable biopsiesDt;
            BiopsyDa bDa = new BiopsyDa();
            biopsiesDt = bDa.GetProstateBiopsies(base.EFormPatientId);
            List<XElement> dbData = XmlUtil.TransformTableToNodes(biopsiesDt, "Procedures");

            foreach (XElement dbNode in dbData)
            {
                dbNode.Add(new XAttribute("IsDB", bool.TrueString.ToLower() + ""));
                int priKey = int.Parse(dbNode.Element("PrimaryKey").Value);

                DataTable coresDt = bDa.FormGetBiopsyCorePathsByProcedureId(priKey);



                if (coresDt.Rows.Count > 0)
                {
                    List<XElement> dbCoreData = XmlUtil.TransformTableToNodes(coresDt, "ProstateBiopsyCorePath");
                    dbNode.Add(dbCoreData);

                }


            }
            IEnumerable<XElement> xmlData = xDoc.XPathSelectElements("//Pathology");
            foreach (XElement xmlNode in xmlData) { xmlNode.Add(new XAttribute("IsDB", bool.FalseString.ToLower() + "")); }
            IEnumerable<XElement> combinedData = dbData.Concat(xmlData);

            AddXmlNodeTransformArgument("CombinedBiopsies_Prostate", combinedData);
        }



        private void AddCombinedRadTx()
        {
            IEnumerable<XElement> xmlData = xDoc.XPathSelectElements("//RadiationTherapy");
            foreach (XElement xmlNode in xmlData) { xmlNode.Add(new XAttribute("IsDB", bool.FalseString.ToLower() + "")); }

            DataTable dt = BusinessObject.GetByParentAsDataView<RadiationTherapy>(base.EFormPatientId).Table;
            if (dt.Rows.Count > 0)
            {

                List<XElement> dbData = XmlUtil.TransformTableToNodes(dt, "RadiationTherapy");

                foreach (XElement dbNode in dbData)
                {
                    dbNode.Add(new XAttribute("IsDB", bool.TrueString.ToLower() + ""));
                }
                IEnumerable<XElement> combinedData = dbData.Concat(xmlData);
                AddXmlNodeTransformArgument("CombinedRadTx", combinedData);
            }
            else
            {
                AddXmlNodeTransformArgument("CombinedRadTx", xmlData);
            }
        }

        private void AddCombinedAllergies()
        {
            IEnumerable<XElement> xmlData = xDoc.XPathSelectElements("//Allergies");
            foreach (XElement xmlNode in xmlData) { xmlNode.Add(new XAttribute("IsDB", bool.FalseString.ToLower() + "")); }

            DataTable dt = BusinessObject.GetByParentAsDataView<Allergy>(base.EFormPatientId).Table;
            if (dt.Rows.Count > 0)
            {

                List<XElement> dbData = XmlUtil.TransformTableToNodes(dt, "Allergies");

                foreach (XElement dbNode in dbData)
                {
                    dbNode.Add(new XAttribute("IsDB", bool.TrueString.ToLower() + ""));
                }
                IEnumerable<XElement> combinedData = dbData.Concat(xmlData);
                AddXmlNodeTransformArgument("CombinedAllergies", combinedData);
            }
            else
            {
                AddXmlNodeTransformArgument("CombinedAllergies", xmlData);
            }
        }

        private void AddCombinedComorbidities()
        {
            IEnumerable<XElement> xmlData = xDoc.XPathSelectElements("//Comorbidities");
            foreach (XElement xmlNode in xmlData) { xmlNode.Add(new XAttribute("IsDB", bool.FalseString.ToLower() + "")); }

            DataTable dt = BusinessObject.GetByParentAsDataView<Comorbidity>(base.EFormPatientId).Table;
            if (dt.Rows.Count > 0)
            {

                List<XElement> dbData = XmlUtil.TransformTableToNodes(dt, "Comorbidities");

                foreach (XElement dbNode in dbData)
                {
                    dbNode.Add(new XAttribute("IsDB", bool.TrueString.ToLower() + ""));
                }
                IEnumerable<XElement> combinedData = dbData.Concat(xmlData);
                IOrderedEnumerable<XElement> sortedCombinedData = XmlUtil.SortXDataByDate(combinedData, BOL.Comorbidity.ComorbDateText);
                AddXmlNodeTransformArgument("CombinedComorbidities", sortedCombinedData);
            }
            else
            {
                AddXmlNodeTransformArgument("CombinedComorbidities", xmlData);
            }
        }

        private void AddCombinedProcedures()
        {
            IEnumerable<XElement> xmlData = xDoc.XPathSelectElements("//Procedures");
            foreach (XElement xmlNode in xmlData) { xmlNode.Add(new XAttribute("IsDB", bool.FalseString.ToLower() + "")); }

            DataTable dt = BusinessObject.GetByParentAsDataView<Procedure>(base.EFormPatientId).Table;
            if (dt.Rows.Count > 0)
            {

                List<XElement> dbData = XmlUtil.TransformTableToNodes(dt, "Procedures");

                foreach (XElement dbNode in dbData)
                {
                    dbNode.Add(new XAttribute("IsDB", bool.TrueString.ToLower() + ""));
                }
                IEnumerable<XElement> combinedData = dbData.Concat(xmlData);
                IOrderedEnumerable<XElement> sortedCombinedData = XmlUtil.SortXDataByDate(combinedData, BOL.Procedure.ProcDateText);
                AddXmlNodeTransformArgument("CombinedProcedures", sortedCombinedData);
            }
            else
            {
                AddXmlNodeTransformArgument("CombinedProcedures", xmlData);
            }
        }



        private void AddCombinedToxicities()
        {
            IEnumerable<XElement> xmlData = xDoc.XPathSelectElements("//Toxicities");
            foreach (XElement xmlNode in xmlData) { xmlNode.Add(new XAttribute("IsDB", bool.FalseString.ToLower() + "")); }

            DataTable dt = BusinessObject.GetByParentAsDataView<Toxicity>(base.EFormPatientId).Table;
            if (dt.Rows.Count > 0)
            {

                List<XElement> dbData = XmlUtil.TransformTableToNodes(dt, "Toxicities");

                foreach (XElement dbNode in dbData)
                {
                    dbNode.Add(new XAttribute("IsDB", bool.TrueString.ToLower() + ""));
                }
                IEnumerable<XElement> combinedData = dbData.Concat(xmlData);
                IOrderedEnumerable<XElement> sortedCombinedData = XmlUtil.SortXDataByDate(combinedData, BOL.Toxicity.ToxDateText);
                AddXmlNodeTransformArgument("CombinedToxicities", sortedCombinedData);
            }
            else
            {
                AddXmlNodeTransformArgument("CombinedToxicities", xmlData);
            }
        }




        private void AddCombinedMedications()
        {
            IEnumerable<XElement> xmlData = xDoc.XPathSelectElements("//Medications");
            foreach (XElement xmlNode in xmlData) { xmlNode.Add(new XAttribute("IsDB", bool.FalseString.ToLower() + "")); }

            string stopDate = System.DateTime.Now.ToShortDateString();

            if (Session[SessionKey.CurrentListType] != null && Session[SessionKey.CurrentListType].ToString() == "Clinic" && Session[SessionKey.CurrentClinicDate] != null && Session[SessionKey.CurrentClinicDate].ToString().Length > 0)
            {
                stopDate = Session[SessionKey.CurrentClinicDate].ToString();
            }


            MedicationDa medDa = new MedicationDa();
            DataSet medDs = medDa.FormGetRecords(base.EFormPatientId, base.EFormName.Replace(" ", ""), "Dynamic", stopDate);



            if (medDs.Tables.Count > 0 && medDs.Tables[0].Rows.Count > 0)
            {

                List<XElement> dbData = XmlUtil.TransformTableToNodes(medDs.Tables[0], "Medications");

                foreach (XElement dbNode in dbData)
                {
                    dbNode.Add(new XAttribute("IsDB", bool.TrueString.ToLower() + ""));
                }
                IEnumerable<XElement> combinedData = dbData.Concat(xmlData);
                IOrderedEnumerable<XElement> sortedCombinedData = XmlUtil.SortXDataByDate(combinedData, BOL.Medication.MedDateText);
                AddXmlNodeTransformArgument("CombinedMedications", sortedCombinedData);
            }
            else
            {
                AddXmlNodeTransformArgument("CombinedMedications", xmlData);
            }
        }



        private void BuildSurvivorshipLabTests()
        {
            IEnumerable<XElement> xmlData = xDoc.XPathSelectElements("//LabTests");
            //           foreach (XElement xmlNode in xmlData) { xmlNode.Add(new XAttribute("IsDB", bool.FalseString.ToLower() + "")); }

            string[] labTestsToGet = new string[] { "PSA", "CREAT" };

            LabTestDa da = new LabTestDa();
            DataSet labTestsDs = da.GetLabTestsbyList(base.EFormPatientId, labTestsToGet);


            if (labTestsDs.Tables.Count > 0 && labTestsDs.Tables[0].Rows.Count > 0)
            {

                List<XElement> dbData = XmlUtil.TransformTableToNodes(labTestsDs.Tables[0], "LabTests");

                foreach (XElement dbNode in dbData)
                {
                    dbNode.Add(new XAttribute("IsDB", bool.TrueString.ToLower() + ""));
                }
                IEnumerable<XElement> combinedData = dbData.Concat(xmlData);
                IOrderedEnumerable<XElement> sortedCombinedData = XmlUtil.SortXDataByDate(combinedData, BOL.LabTest.LabDateText);
                AddXmlNodeTransformArgument("SurvivorshipLabTests", sortedCombinedData);

            }
            else
            {
                AddXmlNodeTransformArgument("SurvivorshipLabTests", xmlData);
            }



        }


        private void AddCombinedMedTx()
        {
            IEnumerable<XElement> xmlData = xDoc.XPathSelectElements("//MedicalTherapy");
            foreach (XElement xmlNode in xmlData) { xmlNode.Add(new XAttribute("IsDB", bool.FalseString.ToLower() + "")); }

            DataTable dt = BusinessObject.GetByParentAsDataView<MedicalTherapy>(base.EFormPatientId).Table;
            if (dt.Rows.Count > 0)
            {

                List<XElement> dbData = XmlUtil.TransformTableToNodes(dt, "MedicalTherapy");

                foreach (XElement dbNode in dbData)
                {
                    dbNode.Add(new XAttribute("IsDB", bool.TrueString.ToLower() + ""));
                }
                IEnumerable<XElement> combinedData = dbData.Concat(xmlData);
                IOrderedEnumerable<XElement> sortedCombinedData = XmlUtil.SortXDataByDate(combinedData, BOL.MedicalTherapy.MedTxDateText);
                AddXmlNodeTransformArgument("CombinedMedTx", sortedCombinedData);
            }
            else
            {
                AddXmlNodeTransformArgument("CombinedMedTx", xmlData);
            }
        }
        

        



        private void AddCombinedDiagnostics_Kidney()
        {
 //           DataTable diagnostics = BusinessObject.GetByParentAsDataView<Diagnostic>(base.EFormPatientId).Table;


            string[] kidneyDx = new string[] { "CT Scan", "MRI", "Ultrasound" };
            DiagnosticDa imagesDa = new DiagnosticDa();
            DataTable imagesDt = imagesDa.GetDiagnosticsByType(this.EFormPatientId, kidneyDx);
            List<XElement> dbData = new List<XElement>();

            if (imagesDt.Rows.Count > 0)
            {
                // filter to last 18mo
                DataView imagesDv = new DataView(imagesDt);
                string imagesFilter = BOL.Diagnostic.DxDate + " >= #" + DateTime.Now.AddMonths(-18).Date.ToShortDateString() + "#";
                imagesFilter += " AND (";
                imagesFilter += BOL.Diagnostic.DxTarget + "  LIKE '%CHEST%'";
                imagesFilter += " OR " + BOL.Diagnostic.DxTarget + "  LIKE '%ABDOMEN%'";
                imagesFilter += " OR " + BOL.Diagnostic.DxTarget + "  LIKE '%PELVIS%'";
                imagesFilter += " OR " + BOL.Diagnostic.DxTarget + "  LIKE '%KIDNEY%'";
                imagesFilter += " OR " + BOL.Diagnostic.DxTarget + "  LIKE '%RENAL%'";
                imagesFilter += ")";
                imagesDv.RowFilter = imagesFilter;


                imagesDv.Sort = BOL.Diagnostic.DxDate + " ASC";

                DataTable filteredImagesDt = imagesDv.ToTable();



                // check for older intitial CT/US
                DataView olderImagesDv = new DataView(imagesDt);
                string olderImagesFilter = BOL.Diagnostic.DxDate + " < #" + DateTime.Now.AddMonths(-18).Date.ToShortDateString() + "#";
                olderImagesFilter += " AND " + BOL.Diagnostic.DxType + " <> 'MRI'";
                olderImagesFilter += " AND (";
                olderImagesFilter += BOL.Diagnostic.DxTarget + "  LIKE '%CHEST%'";
                olderImagesFilter += " OR " + BOL.Diagnostic.DxTarget + "  LIKE '%ABDOMEN%'";
                olderImagesFilter += " OR " + BOL.Diagnostic.DxTarget + "  LIKE '%PELVIS%'";
                olderImagesFilter += " OR " + BOL.Diagnostic.DxTarget + "  LIKE '%KIDNEY%'";
                olderImagesFilter += " OR " + BOL.Diagnostic.DxTarget + "  LIKE '%RENAL%'";
                olderImagesFilter += ")";
                olderImagesDv.RowFilter = olderImagesFilter;
                olderImagesDv.Sort = BOL.Diagnostic.DxDate + " ASC";

                if (olderImagesDv.Count > 0)
                {
                    filteredImagesDt.ImportRow(olderImagesDv[0].Row);
                    DataView repeaterDV = new DataView(filteredImagesDt);
                    repeaterDV.Sort = BOL.Diagnostic.DxDate + " ASC";
                    filteredImagesDt = repeaterDV.ToTable();
                }

                //now add 3 columns from Kidney findings and get data --------------------------------------------------------------
                filteredImagesDt.Columns.Add("MaxDim");
                filteredImagesDt.Columns.Add("MaxDimSide");
                filteredImagesDt.Columns.Add("TumorType");


                DiagnosticDa DXda = new DiagnosticDa();

                foreach (DataRow filteredImagesDr in filteredImagesDt.Rows)
                {
                    DataTable DXdt = DXda.GetDxImageFindingsKidneyByDiagnosticId((int)filteredImagesDr[BOL.Diagnostic.DiagnosticId]);

                    if (DXdt.Rows.Count > 0)
                    {
                        decimal maxDimVal = decimal.MinValue;
                        int maxDimFindingsRowId = int.MinValue;

                        foreach (DataRow DXdr in DXdt.Rows)
                        {

                            decimal ImgFindHeight = decimal.MinValue;
                            decimal ImgFindWidth = decimal.MinValue;
                            decimal ImgFindLength = decimal.MinValue;

                            bool ImgFindHeightExists = decimal.TryParse(DXdt.Rows[0][BOL.ImageFindingKidney.ImgFindHeight].ToString(), out ImgFindHeight);
                            bool ImgFindWidthExists = decimal.TryParse(DXdt.Rows[0][BOL.ImageFindingKidney.ImgFindWidth].ToString(), out ImgFindWidth);
                            bool ImgFindLengthExists = decimal.TryParse(DXdt.Rows[0][BOL.ImageFindingKidney.ImgFindLength].ToString(), out ImgFindLength);

                            decimal MaxDimValForThisFindingRecord = Math.Max(Math.Max(ImgFindHeight, ImgFindWidth), ImgFindLength);

                            if (MaxDimValForThisFindingRecord > maxDimVal)
                            {
                                maxDimVal = MaxDimValForThisFindingRecord;
                                int FindingsRowId = int.MinValue;

                                string MaxDimDisplayText = MaxDimValForThisFindingRecord.ToString();

                                if (DXdt.Rows[0][BOL.ImageFindingKidney.ImgFindSide].ToString().Length > 0)
                                {
                                    filteredImagesDr["MaxDimSide"] = DXdt.Rows[0][BOL.ImageFindingKidney.ImgFindSide].ToString();
                                }

                                filteredImagesDr["MaxDim"] = MaxDimDisplayText;


                                //if (!ImgFindHeightExists || !ImgFindWidthExists || !ImgFindLengthExists)
                                //{
                                //    MaxDimMsg.Visible = true;
                                //}
                                //else { MaxDimMsg.Visible = false; }


                                if (int.TryParse(DXdt.Rows[0][BOL.ImageFindingKidney.DxImageFindingKidneyId].ToString(), out FindingsRowId))
                                {
                                    maxDimFindingsRowId = FindingsRowId;
                                }

                                try
                                {
                                    if (DXdt.Rows[0][BOL.ImageFindingKidney.ImgFindTumorType] != null && DXdt.Rows[0][BOL.ImageFindingKidney.ImgFindTumorType].ToString().Length > 0)
                                    {
                                        filteredImagesDr["TumorType"] = DXdt.Rows[0][BOL.ImageFindingKidney.ImgFindTumorType].ToString();
//                                        NoTumorType.Visible = false;
                                    }

                                }
                                catch (Exception ex)
                                {
                                    ExceptionHandler.Publish(ex);
                                }

                            }
                        }
                    }

                }

                if (filteredImagesDt.Rows.Count > 0) dbData = XmlUtil.TransformTableToNodes(filteredImagesDt, "Diagnostics");


            }
            //------------------------------------------------------------------------------------------------------------








            // TODO
            foreach (XElement dbNode in dbData)
            {
                dbNode.Add(new XAttribute("IsDB", bool.TrueString.ToLower() + ""));
//                int priKey = int.Parse(dbNode.Element("DiagnosticId").Value);
// //               EnumerateChildTables("Diagnostics", priKey, dbNode, new string[] { "DxImageFindingsKidney" });
////                special case here so don't use method above.


//                var bizChildTableNames = BOL.BusinessObject.GetChildTableNames("Diagnostics");
//                var children = from childTable in bizChildTableNames.Intersect(new string[] { "DxImageFindingsKidney" })
//                               let childBiz = BOL.BusinessObject.GetByParentAsDataView(childTable, priKey)
//                               select XmlUtil.TransformTableToNodes(childBiz.Table, childTable);
//                // TODO: recurrsion
//                dbNode.Add(children);

            }
            IEnumerable<XElement> xmlData = xDoc.XPathSelectElements("//Diagnostics");

            foreach (XElement xmlNode in xmlData)
            {
                xmlNode.Add(new XAttribute("IsDB", bool.FalseString.ToLower() + ""));
            }

            IEnumerable<XElement> combinedData = dbData.Concat(xmlData);

            AddXmlNodeTransformArgument("CombinedDiagnostics_Kidney", combinedData);
        }

        private void EnumerateChildTables(string tableName, int tablePrimaryKey, XElement xTableElement, IEnumerable<string> selectChildTables)
        {
            var bizChildTableNames = BOL.BusinessObject.GetChildTableNames(tableName);
            var children = from childTable in bizChildTableNames.Intersect(selectChildTables)
                           let childBiz = BOL.BusinessObject.GetByParentAsDataView(childTable, tablePrimaryKey)
                           select XmlUtil.TransformTableToNodes(childBiz.Table, childTable);
            // TODO: recurrsion
            xTableElement.Add(children);
        }


        private void AddCombinedDiagnostics()
        {
            IEnumerable<XElement> xmlData = xDoc.XPathSelectElements("//Diagnostics");
            foreach (XElement xmlNode in xmlData) { xmlNode.Add(new XAttribute("IsDB", bool.FalseString.ToLower() + "")); }

            DataTable dt = BusinessObject.GetByParentAsDataView<Diagnostic>(base.EFormPatientId).Table;
            if (dt.Rows.Count > 0)
            {

                List<XElement> dbData = XmlUtil.TransformTableToNodes(dt, "Diagnostics");

                foreach (XElement dbNode in dbData)
                {
                    dbNode.Add(new XAttribute("IsDB", bool.TrueString.ToLower() + ""));
                }
                IEnumerable<XElement> combinedData = dbData.Concat(xmlData);
                IOrderedEnumerable<XElement> sortedCombinedData = XmlUtil.SortXDataByDate(combinedData, BOL.Diagnostic.DxDateText);
                AddXmlNodeTransformArgument("CombinedDiagnostics", sortedCombinedData);
            }
            else
            {
                AddXmlNodeTransformArgument("CombinedDiagnostics", xmlData);
            }

        }


        private void AddCombinedLabTests_Prostate()
        {
            IEnumerable<XElement> xmlData = xDoc.XPathSelectElements("//LabTests");
            foreach (XElement xmlNode in xmlData) { xmlNode.Add(new XAttribute("IsDB", bool.FalseString.ToLower() + "")); }

            DataTable dt = new DataTable();
            string[] labTestsToGet = new string[] { "PSA", "FPSA", "PCA3", "UPCA3", "UPCA3S" };
            LabTestDa da = new LabTestDa();
            DataSet labTestsDs = da.GetLabTestsbyList(base.EFormPatientId, labTestsToGet);

            if (labTestsDs.Tables.Count > 0 && labTestsDs.Tables[0].Rows.Count > 0)
            {
                DataTable allLabs = labTestsDs.Tables[0];
                DataTable labsToDisplay = allLabs.Clone();

                // get last 3 PSAs
                DataView PSAs = new DataView(allLabs);
                PSAs.RowFilter = LabTest.LabTest_Field + " = 'PSA'";
                PSAs.Sort = LabTest.LabDate + " DESC";
                int maxPSAs = 3;
                if (PSAs.Count > maxPSAs)
                {
                    for (int i = 0; i < maxPSAs; i++)
                    {
                        labsToDisplay.ImportRow(PSAs[i].Row);
                    }
                }
                else labsToDisplay.Merge(PSAs.ToTable());

                // get last 3 FPSAs
                DataView FPSAs = new DataView(allLabs);
                FPSAs.RowFilter = LabTest.LabTest_Field + " = 'FPSA'";
                FPSAs.Sort = LabTest.LabDate + " DESC";
                int maxFPSAs = 3;
                if (FPSAs.Count > maxFPSAs)
                {
                    for (int i = 0; i < maxFPSAs; i++)
                    {
                        labsToDisplay.ImportRow(FPSAs[i].Row);
                    }
                }
                else labsToDisplay.Merge(FPSAs.ToTable());

                // get all PCA3
                DataView PCA3s = new DataView(allLabs);
                PCA3s.RowFilter = LabTest.LabTest_Field + " IN ('PCA3', 'UPCA3', 'UPCA3S')";
                if (PCA3s.Count > 0) { labsToDisplay.Merge(PCA3s.ToTable()); }


                if (labsToDisplay.Rows.Count > 0)
                {
                    DataView sortedLabView = new DataView(labsToDisplay);
                    sortedLabView.Sort = LabTest.LabDate + " ASC";
                    dt = sortedLabView.ToTable();
                }
            }

            if (dt.Rows.Count > 0)
            {
                List<XElement> dbData = XmlUtil.TransformTableToNodes(dt, "LabTests");

                foreach (XElement dbNode in dbData)
                {
                    dbNode.Add(new XAttribute("IsDB", bool.TrueString.ToLower() + ""));
                }
                IEnumerable<XElement> combinedData = dbData.Concat(xmlData);
                IOrderedEnumerable<XElement> sortedCombinedData = XmlUtil.SortXDataByDate(combinedData, BOL.LabTest.LabDateText);
                AddXmlNodeTransformArgument("CombinedLabTests_Prostate", sortedCombinedData);
            }
            else
            {
                AddXmlNodeTransformArgument("CombinedLabTests_Prostate", xmlData);
            }

        }

        private void AddKidneyHPI()
        {

            PatientDa da = new PatientDa();
            DataSet ds = da.GetPatientHPIKidney(base.EFormPatientId);
            DataTable dt = ds.Tables[0];
            List<XElement> hpi = XmlUtil.TransformTableToNodes(dt, "hpi");

            foreach (XElement hpiNode in hpi)
                hpiNode.Add(new XAttribute("IsDB", true + ""));
            AddXmlNodeTransformArgument("KidneyHPI", hpi);
        }


        protected DataRow PatientNephrectomy(int PatientID, string FormName, string FormType)
        {

            DataRow Nephrectomy = null;

            ProcedureDa procDa = new ProcedureDa();
            DataSet procDs = procDa.FormGetSpecialRecords(PatientID, FormName, FormType, BOL.Procedure.ProcName, " IN ", "'Nephrectomy','Partial Nephrectomy','Laparoscopic Nephroureterectomy','Partial for Horshoe Kidney','Laparoscopic Partial Nephrectomy','Nephroureterectomy','Laparoscopic Radical Nephrectomy','Radical Nephrectomy', 'Robotic Partial Nephrectomy', 'Robotic Radical Nephrectomy'");

            if (procDs.Tables.Count > 0 && procDs.Tables[0].Rows.Count > 0)
            {
                DataView procDv = new DataView(procDs.Tables[0]);
                procDv.RowFilter = BOL.Procedure.ProcDate + " IS NOT NULL";
                procDv.Sort = BOL.Procedure.ProcDate + " ASC ";

                if (procDv.Count > 0) Nephrectomy = procDv[0].Row;

            }

            return Nephrectomy;

        }

        private void AddCombinedComplications_Kidney()
        {
            DataRow Nephrectomy = PatientNephrectomy(this.EFormPatientId, this.EFormName, "Dynamic");

            IEnumerable<XElement> complications = xDoc.XPathSelectElements("//Toxicities");
            foreach (XElement xNode in complications) xNode.Add(new XAttribute("IsDB", bool.FalseString.ToLower() + ""));

            if (Nephrectomy != null)
            {
                if (Nephrectomy[BOL.Procedure.OperatingRoomDetailId].ToString().Length > 0)
                {
                    int ORDetailId = Convert.ToInt32(Nephrectomy[BOL.Procedure.OperatingRoomDetailId]);
                    DateTime NephDate = (DateTime)Nephrectomy[BOL.Procedure.ProcDate];

                    ToxicityDa toxDa = new ToxicityDa();
                    DataSet toxDs = toxDa.FormGetComplicationsByORDetailId(ORDetailId, this.EFormName, "Dynamic");

                    if (toxDs.Tables.Count > 0 && toxDs.Tables[0].Rows.Count > 0)
                    {

                        DataView toxDv = new DataView(toxDs.Tables[0]);
                        toxDv.RowFilter = BOL.Toxicity.ToxDate + " >= #" + NephDate.Date.AddDays(30) + "#";
                        toxDv.Sort = BOL.Toxicity.ToxDate + " ASC ";

                        if (toxDv.Count > 0)
                        {
                            DataTable dt = toxDv.ToTable();
                            List<XElement> dbData = XmlUtil.TransformTableToNodes(dt, "Toxicities");
                            foreach (XElement dbNode in dbData)
                                dbNode.Add(new XAttribute("IsDB", true + ""));

                            complications = complications.Concat(dbData);
                        }

                    }
                }

            }



            AddXmlNodeTransformArgument("CombinedComplications_Kidney", complications);
        }




        private void AddCombinedFamilyMembers()
        {
            DataTable familyMembers = BusinessObject.GetByParentAsDataView<FamilyMember>(base.EFormPatientId).Table;

            List<XElement> dbData = XmlUtil.TransformTableToNodes(familyMembers, "FamilyMembers");

            // TODO
            foreach (XElement dbNode in dbData)
            {
                dbNode.Add(new XAttribute("IsDB", bool.TrueString.ToLower() + ""));
                int priKey = int.Parse(dbNode.Element(BOL.FamilyMember.FamilyMemberId).Value);
                EnumerateChildTables("FamilyMembers", priKey, dbNode, new string[] { "FamilyMemberDiagnosis" });
            }
            IEnumerable<XElement> xmlData = xDoc.XPathSelectElements("//FamilyMembers");
            foreach (XElement xmlNode in xmlData) { xmlNode.Add(new XAttribute("IsDB", bool.FalseString.ToLower() + "")); }
            IEnumerable<XElement> combinedData = dbData.Concat(xmlData);

            AddXmlNodeTransformArgument("CombinedFamilyMembers", combinedData);
        }



        private void AddCombinedSocialHistories()
        {

            IEnumerable<XElement> xmlData = xDoc.XPathSelectElements("//SocialHistories");

            DataTable socialHistory = BusinessObject.GetByParentAsDataView<SocialHistory>(base.EFormPatientId).Table;

            if (socialHistory.Rows.Count > 0)
            {
                List<XElement> dbData = XmlUtil.TransformTableToNodes(socialHistory, "SocialHistories");

                // TODO
                foreach (XElement dbNode in dbData)
                {
                    dbNode.Add(new XAttribute("IsDB", bool.TrueString.ToLower() + ""));
                }
                AddXmlNodeTransformArgument("CombinedSocialHistories", dbData);
            }
            else
            {
                AddXmlNodeTransformArgument("CombinedSocialHistories", xmlData);
            }
        }

        
        private void AddDiseaseState_Kidney()
        {

            IEnumerable<XElement> xmlData = xDoc.XPathSelectElements("//Status");
            foreach (XElement xmlNode in xmlData)
            {
                xmlNode.Add(new XAttribute("IsDB", bool.FalseString.ToLower() + ""));
            }

            StatusDa sDa = new StatusDa();
            DataSet sDs = sDa.GetStatus(this.EFormPatientId, "Kidney");
            if (sDs.Tables.Count > 0 && sDs.Tables[0].Rows.Count > 0)
            {
                List<XElement> dbData = XmlUtil.TransformTableToNodes(sDs.Tables[0], "Status");

                foreach (XElement dbNode in dbData)
                {
                    dbNode.Add(new XAttribute("IsDB", bool.TrueString.ToLower() + ""));
                }
                IEnumerable<XElement> combinedData = dbData.Concat(xmlData);
                AddXmlNodeTransformArgument("DiseaseState_Kidney", combinedData);
            }
            else { AddXmlNodeTransformArgument("DiseaseState_Kidney", xmlData); }


            
        }


        private void AddLabTests_Kidney()
        {
            DataRow Nephrectomy = PatientNephrectomy(this.EFormPatientId, this.EFormName, "Dynamic");

            DataTable dbDataTable = new DataTable();
            
            if (Nephrectomy != null && Nephrectomy[BOL.Procedure.ProcDate] != null)
            {
                DateTime NephDate;
                if (DateTime.TryParse(Nephrectomy[BOL.Procedure.ProcDate].ToString(), out NephDate))
                {
                    dbDataTable = DBLabTests_Kidney(NephDate);
                }
                else
                {
                    dbDataTable = DBLabTests_Kidney(DateTime.MinValue);
                }
            }
            else
            {
                dbDataTable = DBLabTests_Kidney(DateTime.MinValue);
            }

            List<XElement> dbData = XmlUtil.TransformTableToNodes(dbDataTable, "LabTests");

            foreach (XElement dbNode in dbData)
            {
                dbNode.Add(new XAttribute("IsDB", bool.TrueString.ToLower() + ""));
            }

            

            IEnumerable<XElement> xmlData = xDoc.XPathSelectElements("//LabTests");

            foreach (XElement xmlNode in xmlData)
            {
                xmlNode.Add(new XAttribute("IsDB", bool.FalseString.ToLower() + ""));
            }


            IEnumerable<XElement> combinedData = dbData.Concat(xmlData);


            IEnumerable<XElement> combinedDataWithGFR = KidneyLabsWithGFR(this.EFormPatientId, combinedData);


            AddXmlNodeTransformArgument("LabTests_Kidney", combinedDataWithGFR);


            
        }





        protected DataTable DBLabTests_Kidney(DateTime NephrectomyDate)
        {

            DataTable LabTestDt = new DataTable();

            LabTestDa da = new LabTestDa();

            string[] l = { "CREAT" };
            DataSet ds = da.GetLabTestsbyList(this.EFormPatientId, l);

            if (ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
            {
                DataTable dt = ds.Tables[0];

                DataColumn LastBeforeNeph = new DataColumn();
                LastBeforeNeph.ColumnName = "LastBeforeNeph";
                LastBeforeNeph.DataType = System.Type.GetType("System.Boolean");
                LastBeforeNeph.DefaultValue = false;
                dt.Columns.Add(LastBeforeNeph);

                // highlight pre-op creat
                if (NephrectomyDate != null && NephrectomyDate != DateTime.MinValue)
                {
                    for (int i = 0; i < dt.Rows.Count; i++)
                    {
                        if (dt.Rows[i][BOL.LabTest.LabDate] != null && dt.Rows[i][BOL.LabTest.LabDate].ToString().Length > 0 && (DateTime)dt.Rows[i][BOL.LabTest.LabDate] <= NephrectomyDate)
                        {
                            if ((i == (dt.Rows.Count - 1)) || (DateTime)dt.Rows[i + 1][BOL.LabTest.LabDate] > NephrectomyDate || (DateTime)dt.Rows[i][BOL.LabTest.LabDate] == NephrectomyDate)
                            {
                                dt.Rows[i]["LastBeforeNeph"] = true;
                            }
                        }
                    }
                }

                DataView labDv = new DataView(dt);
                labDv.RowFilter = "(" + BOL.LabTest.LabDate + " > #" + DateTime.Today.AddYears(-1) + "# AND " + BOL.LabTest.LabDate + " >= #" + NephrectomyDate.ToShortDateString() + "#) OR LastBeforeNeph = true";

                if (labDv.Count > 0)
                {
                    LabTestDt = labDv.ToTable();
                }


            }

                return LabTestDt;



        }


        protected IEnumerable<XElement> KidneyLabsWithGFR(int PatientID, IEnumerable<XElement> labXML)
        {
            DataTable labDt = XmlUtil.GetDataTable(labXML);
            labDt.Columns.Add("GFR");
            labDt.Columns.Add("GFRError");

            // Calculate GFR
            // eGFR = 141 * min(SCr/k,1)^a * max(SCr/k,1)^-1.209 * 0.993^Age x [1.018 if female] * [1.159 if black]

            bool AgeOK = false;
            bool GenderOK = false;
            bool RaceOK = false;
            bool CreatOK = false;

            IBusinessObject biz = BusinessObjectFactory.BuildBusinessObject("Patients");
            biz.Get(PatientID);
            string ptGender = biz[BOL.Patient.PtGender].ToString();
            string ptRace = biz[BOL.Patient.PtRace].ToString();
            int ptAge = 0;

            DateTime ptBirthDate;
            if (DateTime.TryParse(biz[BOL.Patient.PtBirthDate].ToString(), out ptBirthDate))
            {
                ptAge = Convert.ToInt32(Math.Floor(((DateTime.Now - ptBirthDate).TotalDays) / (365.242222)));
                AgeOK = true;
            }

            double k = 0;
            double a = 0;


            if (ptGender.ToUpper() == "MALE") { k = 0.9; a = -0.411; GenderOK = true; }
            else if (ptGender.ToUpper() == "FEMALE") { k = 0.7; a = -0.329; GenderOK = true; }

            if (ptRace.Length > 0) { RaceOK = true; }

            if (GenderOK && RaceOK && AgeOK)
            {
                foreach (DataRow dr in labDt.Rows)
                {
                    if (dr[BOL.LabTest.LabTest_Field].ToString().ToUpper().StartsWith("CREAT"))
                    {
                        double creatResult;
                        if (dr[BOL.LabTest.LabResult].ToString().Length > 0 && double.TryParse(dr[BOL.LabTest.LabResult].ToString(), out creatResult))
                        {
                            double gfrCalc = (141) * (Math.Pow((Math.Min((creatResult / k), 1)), a)) * (Math.Pow((Math.Max((creatResult / k), 1)), -1.209)) * (Math.Pow(0.993, ptAge));
                            if (ptGender.ToUpper() == "FEMALE") gfrCalc = gfrCalc * 1.018;
                            if (ptRace.ToUpper().Contains("BLACK")) gfrCalc = gfrCalc * 1.159;
                            dr["GFR"] = Math.Round(gfrCalc, 3);
                        }
                        else { dr["GFRError"] = "Invalid Creatinine Value"; }
                    }
                }
            }
            else
            {
                string errorMsg = "GFR cannot be calculated. (";
                if (!GenderOK) errorMsg += "No Gender. ";
                if (!RaceOK) errorMsg += "No Race. ";
                if (!AgeOK) errorMsg += "No Age.";
                errorMsg += ")";
                foreach (DataRow dr in labDt.Rows)
                {
                    if (dr[BOL.LabTest.LabTest_Field].ToString().ToUpper().StartsWith("CREAT"))
                    {
                        dr["GFRError"] = errorMsg;
                    }
                }
            }


            IEnumerable<XElement> labXMLWithGFR = XmlUtil.TransformTableToNodes(labDt, "LabTests");

            return labXMLWithGFR;
        }







        protected void BuildActiveSurveillanceLabTests()
        {
            string[] labTestsToGet = new string[] { "PSA", "Prolaris Score", "Prolaris AUA", "Oncotype GPS", "Oncotype Path", "PCA3", "UPCA3", "UPCA3S", "PHI", "4K" };



            DataTable labsToDisplay = ASLabsTable(labTestsToGet);

            DataView sortedLabView = new DataView(labsToDisplay);
            sortedLabView.Sort = LabTest.LabDate + " ASC";
            DataTable sortedLabs = sortedLabView.ToTable();




            List<XElement> dbData = XmlUtil.TransformTableToNodes(sortedLabs, "ASLabTests");

            // TODO
            foreach (XElement dbNode in dbData)
            {
                dbNode.Add(new XAttribute("IsDB", bool.TrueString.ToLower() + ""));
            }

            AddXmlNodeTransformArgument("ActiveSurveillanceLabs", dbData);



        }

        protected string FilteredActiveSurveillanceLabName(string labName)
        {
            string filteredLabName = labName.Replace(" ", "").Replace("4", "Four");
            return filteredLabName;
        }






        protected DataTable ASLabsTable(string[] labTestsToGet)
        {

            // data table structure
            DataTable labsTable = new DataTable();

            DataColumn DateTextCol = new DataColumn();
            DateTextCol.ColumnName = "LabDateText";
            labsTable.Columns.Add(DateTextCol);

            DataColumn DateCol = new DataColumn();
            DateCol.ColumnName = "LabDate";
            DateCol.DataType = System.Type.GetType("System.DateTime");
            labsTable.Columns.Add(DateCol);

            DataColumn PSADT = new DataColumn();
            PSADT.ColumnName = "PSADT";
            labsTable.Columns.Add(PSADT);


            foreach (string lab in labTestsToGet)
            {
                DataColumn col = new DataColumn();
                col.ColumnName = FilteredActiveSurveillanceLabName(lab);
                labsTable.Columns.Add(col);

                DataColumn IDCol = new DataColumn();
                IDCol.ColumnName = (FilteredActiveSurveillanceLabName(lab) + "Id");
                IDCol.DataType = System.Type.GetType("System.Int32");
                labsTable.Columns.Add(IDCol);
            }


            int pId = base.EFormPatientId;

            LabTestDa da = new LabTestDa();

            DataSet labTestsDs = da.GetLabTestsbyList(pId, labTestsToGet);


            DataTable allLabs = labTestsDs.Tables[0];




            // table rows

            if (allLabs != null)
            {
                foreach (DataRow row in allLabs.Rows)
                {
                    string LabDateText = row[BOL.LabTest.LabDateText].ToString();
                    DateTime LabDate = new DateTime();
                    if (row[BOL.LabTest.LabDate].ToString().Length > 0) LabDate = (DateTime)row[BOL.LabTest.LabDate];
                    string LabType = FilteredActiveSurveillanceLabName(row[BOL.LabTest.LabTest_Field].ToString());
                    string LabResult = row[BOL.LabTest.LabResult].ToString();
                    string LabNotes = row[BOL.LabTest.LabNotes].ToString();
                    int LabTestId = (int)row[BOL.LabTest.LabTestId];

                    DataRow[] currentDateRow = labsTable.Select("LabDateText = '" + LabDateText + "'");
                    if (currentDateRow.Length > 0)
                    {
                        currentDateRow[0][LabType] = LabResult;
                        currentDateRow[0][LabType + "Id"] = LabTestId;

                        // special cases
                        if (LabType.ToUpper().Equals(FilteredActiveSurveillanceLabName("PROLARIS SCORE"))) currentDateRow[0][FilteredActiveSurveillanceLabName("Prolaris AUA")] = LabNotes;
                        if (LabType.ToUpper().Equals(FilteredActiveSurveillanceLabName("ONCOTYPE GPS"))) currentDateRow[0][FilteredActiveSurveillanceLabName("Oncotype Path")] = LabNotes;

                    }
                    else
                    {
                        DataRow dr = labsTable.NewRow();
                        dr["LabDateText"] = LabDateText;
                        dr["LabDate"] = LabDate;
                        dr[LabType] = LabResult;
                        dr[LabType + "Id"] = LabTestId;

                        // special cases
                        if (LabType.ToUpper().Equals(FilteredActiveSurveillanceLabName("PROLARIS SCORE"))) dr[FilteredActiveSurveillanceLabName("Prolaris AUA")] = LabNotes;
                        if (LabType.ToUpper().Equals(FilteredActiveSurveillanceLabName("ONCOTYPE GPS"))) dr[FilteredActiveSurveillanceLabName("Oncotype Path")] = LabNotes;

                        labsTable.Rows.Add(dr);
                    }


                }


                if (labsTable.Rows.Count > 0)
                {
                    DataView sortedLabView = new DataView(labsTable);
                    sortedLabView.Sort = LabTest.LabDate + " ASC";
                    labsTable = sortedLabView.ToTable();



                    // get prostate volumes to calculate PSADensity in lab tests
                    DataTable ProstateVolumes = ProstateVolumesByDescendingDate(pId);
                    if (ProstateVolumes.Rows.Count > 0)
                    {
                        foreach (DataRow labRow in labsTable.Rows)
                        {
                            double psa = 0;
                            if (labRow["LabDate"].ToString().Length > 0 && labRow["PSA"].ToString().Length > 0 && double.TryParse(labRow["PSA"].ToString(), out psa))
                            {

                                DataView v = new DataView(ProstateVolumes);
                                v.RowFilter = Diagnostic.DxDate + " <= #" + ((DateTime)labRow["LabDate"]).ToShortDateString() + "#";

                                if (v.Count > 0)
                                {
                                    double mostRecentVolumeMeasurement = 0;

                                    if (double.TryParse(v[0][ImageProstate.ImgProstateVolume].ToString(), out mostRecentVolumeMeasurement))
                                    {
                                        double psadt = Math.Round((psa / mostRecentVolumeMeasurement), 4);
                                        labRow["PSADT"] = psadt;
                                    }
                                }

                            }
                        }
                    }


                }

            }
            return labsTable;
        }




        protected DataTable ProstateVolumesByDescendingDate(int PatientId)
        {

            DataTable volumes = new DataTable();


            // add PSA Density
            DiagnosticDa d = new DiagnosticDa();
            DataTable ProstateImages = d.GetProstateImageFindings(PatientId);
            DataView ProstateImagesWithLWH = new DataView(ProstateImages);

            string prostateImgFilter = Diagnostic.DxDate + " IS NOT NULL";
            prostateImgFilter += " and Len(" + ImageProstate.ImgProstateHeight + ") > 0";
            prostateImgFilter += " and Len(" + ImageProstate.ImgProstateLength + ") > 0";
            prostateImgFilter += " and Len(" + ImageProstate.ImgProstateWidth + ") > 0";

            ProstateImagesWithLWH.RowFilter = prostateImgFilter;
            if (ProstateImagesWithLWH.Count > 0)
            {
                DataTable ProstateDimensions = ProstateImagesWithLWH.ToTable(false, Diagnostic.DxDateText, Diagnostic.DxDate, ImageProstate.ImgProstateHeight, ImageProstate.ImgProstateLength, ImageProstate.ImgProstateWidth, ImageProstate.ImgProstateVolume);

                foreach (DataRow ProstateMeasurement in ProstateDimensions.Rows)
                {
                    double ImgProstateHeight = 0;
                    double ImgProstateLength = 0;
                    double ImgProstateWidth = 0;

                    if (double.TryParse(ProstateMeasurement[ImageProstate.ImgProstateHeight].ToString(), out ImgProstateHeight)
                        && double.TryParse(ProstateMeasurement[ImageProstate.ImgProstateLength].ToString(), out ImgProstateLength)
                        && double.TryParse(ProstateMeasurement[ImageProstate.ImgProstateWidth].ToString(), out ImgProstateWidth))
                    {
                        double vol = (ImgProstateHeight * ImgProstateLength * ImgProstateWidth * 0.52);
                        ProstateMeasurement[ImageProstate.ImgProstateVolume] = vol;
                    }
                    else ProstateMeasurement[ImageProstate.ImgProstateVolume] = null;

                }

                DataView vols = new DataView(ProstateDimensions);
                vols.RowFilter = ImageProstate.ImgProstateVolume + " IS NOT NULL";
                vols.Sort = Diagnostic.DxDate + " DESC";

                if (vols.Count > 0) volumes = vols.ToTable();

            }

            return volumes;

        }


        private void AddCombinedQOLTherapies()
        {
            IEnumerable<XElement> xmlData = xDoc.XPathSelectElements("//QOL_Therapy");
            foreach (XElement xmlNode in xmlData) { xmlNode.Add(new XAttribute("IsDB", bool.FalseString.ToLower() + "")); }




            QOL_TherapyDa QolDa = new QOL_TherapyDa();
            DataSet QolDs = QolDa.FormListQOL_Therapy(base.EFormPatientId, base.EFormName, "Dynamic");

            if (QolDs.Tables.Count > 0 && QolDs.Tables[0].Rows.Count > 0)
            {

                List<XElement> dbData = XmlUtil.TransformTableToNodes(QolDs.Tables[0], "QOL_Therapy");

                foreach (XElement dbNode in dbData)
                {
                    dbNode.Add(new XAttribute("IsDB", bool.TrueString.ToLower() + ""));
                }
                IEnumerable<XElement> combinedData = dbData.Concat(xmlData);
                IOrderedEnumerable<XElement> sortedCombinedData = XmlUtil.SortXDataByDate(combinedData, BOL.QOL_Therapy.QOL_TxDateText);
                AddXmlNodeTransformArgument("CombinedQOLTherapies", sortedCombinedData);
            }
            else
            {
                AddXmlNodeTransformArgument("CombinedQOLTherapies", xmlData);
            }

        }


        private void AddActiveSurveillanceRectalExamHistory()
        {


            EncRectalExamDa eda = new EncRectalExamDa();
            DataTable dt = eda.GetDREHistory(base.EFormPatientId);

            dt.Columns.Add("ClinStage");
            dt.Columns.Add("FindingsHTML");
            if (dt.Rows.Count > 0)
            {
                //DREHistory.DataSource = dt.DefaultView;
                //DREHistory.DataBind();


                foreach (DataRow RectalExam in dt.Rows)
                {
                    if (RectalExam[Encounter.EncDate].ToString().Length > 0)
                    {
                        RectalExam["ClinStage"] = ProstateClinStageOnDate((DateTime)RectalExam[Encounter.EncDate]);
                    }

                    RectalExam["FindingsHTML"] = FindingsForSingleDRE((int)RectalExam[Encounter.EncounterId]);
                }
            }

            List<XElement> dbData = XmlUtil.TransformTableToNodes(dt, "Encounters");
            foreach (XElement dbNode in dbData)
            {
                dbNode.Add(new XAttribute("IsDB", bool.TrueString.ToLower() + ""));
            }
            AddXmlNodeTransformArgument("ActiveSurveillanceRectalExamHistory", dbData);

        }

        protected string ProstateClinStageOnDate(DateTime EncDate)
        {
            string clinStage = "";

            DataTable stageHistory = ClinicalStageHistory("Prostate");

            DataRow[] clinicalStageRows = stageHistory.Select("ClinStageDate = '#" + EncDate.ToShortDateString() + "#'");
            if (clinicalStageRows.Length > 0)
            {

                string StageT = (clinicalStageRows[0][ClinicalStage.ClinStageT].ToString());
                string StageN = (clinicalStageRows[0][ClinicalStage.ClinStageN].ToString());
                string StageM = (clinicalStageRows[0][ClinicalStage.ClinStageM].ToString());

                if (StageT.Length > 0) clinStage += StageT;
                if (StageN.Length > 0) clinStage += (clinStage.Length > 0) ? (", " + StageN) : StageN;
                if (StageM.Length > 0) clinStage += (clinStage.Length > 0) ? (", " + StageM) : StageM;

            }

            return clinStage;
        }


        protected string FindingsForSingleDRE(int EncounterId)
        {
            string findingsStr = "";


            // get findings
            DataView findings = DREFindingsByEncounter(EncounterId);
            if (findings.Count > 0)
            {

                StringBuilder sb = new StringBuilder();
                sb.Append("<table class=\"PaperFormDataTable\" cellspacing=\"0\" style=\" table-layout: fixed;\" >");
                sb.Append("<tr>");
                sb.Append("<th style=\"width: 20%;\" >Side</th>");
                sb.Append("<th style=\"width: 20%;\" >Laterality</th>");
                sb.Append("<th style=\"width: 20%;\" >Level</th>");
                sb.Append("<th style=\"width: 20%;\" >Result</th>");
                sb.Append("<th style=\"width: 20%;\" >ECE</th>");
                sb.Append(" </tr>");


                foreach (DataRowView DREFinding in findings)
                {
                    sb.Append("<tr>");
                    sb.Append("<td>" + DREFinding[EncRectalExamFinding.DRE_FindSide].ToString() + "&#160;</td>");
                    sb.Append("<td>" + DREFinding[EncRectalExamFinding.DRE_FindLaterality].ToString() + "&#160;</td>");
                    sb.Append("<td>" + DREFinding[EncRectalExamFinding.DRE_FindLevel].ToString() + "&#160;</td>");
                    sb.Append("<td>" + DREFinding[EncRectalExamFinding.DRE_FindResult].ToString() + "&#160;</td>");
                    sb.Append("<td>" + DREFinding[EncRectalExamFinding.DRE_FindExtension].ToString() + "&#160;</td>");
                    sb.Append(" </tr>");
                }

                sb.Append("</table>");





                findingsStr = sb.ToString();

            }

            return findingsStr;
        }


        protected DataTable ClinicalStageHistory(string disease)
        {
            ClinicalStageDa cda = new ClinicalStageDa();
            DataTable cdt = cda.FormGetRecords(base.EFormPatientId);
            DataView cdv = new DataView(cdt);
            cdv.RowFilter = ClinicalStage.ClinStageDisease + " = '" + disease + "'";
            cdv.Sort = ClinicalStage.ClinStageDate + " ASC, " + ClinicalStage.EnteredTime + " DESC";

            return cdv.ToTable();
        }



        protected DataView DREFindingsByEncounter(int EncounterID)
        {
            EncRectalExamDa dreDA = new EncRectalExamDa();
            DataTable dreDT = dreDA.GetAllDREFindings(base.EFormPatientId);
            DataView dreDV = new DataView(dreDT);
            dreDV.RowFilter = EncRectalExamFinding.EncounterId + " = " + EncounterID.ToString();

            return dreDV;
        }





        private void AddCombinedProstateMRI()
        {

            IEnumerable<XElement> xmlData = xDoc.XPathSelectElements("//Diagnostics[DxType=\"MRI\"]");
            foreach (XElement xmlNode in xmlData) { if (xmlNode.Attribute("IsDB").Equals(null))  xmlNode.Add(new XAttribute("IsDB", bool.FalseString.ToLower() + "")); }

            DataTable DxRecords = BusinessObject.GetByParentAsDataView<Diagnostic>(base.EFormPatientId).Table;
            DataView ProstateMRIRecordsView = new DataView(DxRecords);
            ProstateMRIRecordsView.RowFilter = BOL.Diagnostic.DxType + " IN ('MRI', 'EMRI', 'MRSI') and " + BOL.Diagnostic.DxTarget + " = 'Prostate'";
            DataTable ProstateMRIRecords = ProstateMRIRecordsView.ToTable();

            if (ProstateMRIRecords.Rows.Count > 0)
            {
                List<XElement> dbData = XmlUtil.TransformTableToNodes(ProstateMRIRecords, "Diagnostics");

                // TODO
                foreach (XElement dbNode in dbData)
                {
                    dbNode.Add(new XAttribute("IsDB", bool.TrueString.ToLower() + ""));
                    int priKey = int.Parse(dbNode.Element(BOL.Diagnostic.DiagnosticId).Value);
                    EnumerateChildTables("Diagnostics", priKey, dbNode, new string[] { "DxImageProstate", "DxImageFindings", "DxImageFindingsProstate" });
                }
                IEnumerable<XElement> combinedData = dbData.Concat(xmlData);

                AddXmlNodeTransformArgument("CombinedProstateMRI", combinedData);
            }
            else
            {
                AddXmlNodeTransformArgument("CombinedProstateMRI", xmlData);
            }

        }

        private void AddCombinedProstateUlrasound()
        {

            IEnumerable<XElement> xmlData = xDoc.XPathSelectElements("//Diagnostics[DxType=\"TRUS\"]");
            foreach (XElement xmlNode in xmlData) { if (xmlNode.Attribute("IsDB").Equals(null))  xmlNode.Add(new XAttribute("IsDB", bool.FalseString.ToLower() + "")); }

            DataTable DxRecords = BusinessObject.GetByParentAsDataView<Diagnostic>(base.EFormPatientId).Table;
            DataView ProstateTRUSRecordsView = new DataView(DxRecords);
            ProstateTRUSRecordsView.RowFilter = BOL.Diagnostic.DxType + " IN ('TRUS', 'MRUS')";
            DataTable ProstateTRUSRecords = ProstateTRUSRecordsView.ToTable();

            if (ProstateTRUSRecords.Rows.Count > 0)
            {
                List<XElement> dbData = XmlUtil.TransformTableToNodes(ProstateTRUSRecords, "Diagnostics");

                // TODO
                foreach (XElement dbNode in dbData)
                {
                    dbNode.Add(new XAttribute("IsDB", bool.TrueString.ToLower() + ""));
                    int priKey = int.Parse(dbNode.Element(BOL.Diagnostic.DiagnosticId).Value);
                    EnumerateChildTables("Diagnostics", priKey, dbNode, new string[] { "DxImageProstate" });
                }
                IEnumerable<XElement> combinedData = dbData.Concat(xmlData);

                AddXmlNodeTransformArgument("CombinedProstateUlrasound", combinedData);
            }
            else
            {
                AddXmlNodeTransformArgument("CombinedProstateUlrasound", xmlData);
            }

        }


        private void AddCombinedCytology()
        {
            IEnumerable<XElement> xmlData = xDoc.XPathSelectElements("//Pathology[PathSpecimenType=\"Cytology\"]");
            foreach (XElement xmlNode in xmlData) { if (xmlNode.Attribute("IsDB").Equals(null))  xmlNode.Add(new XAttribute("IsDB", bool.FalseString.ToLower() + "")); }

            PathologyDa cytologyDa = new PathologyDa();
            DataSet cytologyDs = cytologyDa.FormGetRecords(base.EFormPatientId, base.EFormName.Replace(" ", ""), "Dynamic");


            if (cytologyDs.Tables.Count > 0 && cytologyDs.Tables[0].Rows.Count > 0)
            {

                DataView cytologyDv = new DataView(cytologyDs.Tables[0]);
                cytologyDv.RowFilter = "PathSpecimenType = 'Cytology'";

                if (cytologyDv.Count > 0)
                {

                    List<XElement> dbData = XmlUtil.TransformTableToNodes(cytologyDv.ToTable(), "Pathology");

                    foreach (XElement dbNode in dbData)
                    {
                        dbNode.Add(new XAttribute("IsDB", bool.TrueString.ToLower() + ""));
                    }
                    IEnumerable<XElement> combinedData = dbData.Concat(xmlData);
                    IOrderedEnumerable<XElement> sortedCombinedData = XmlUtil.SortXDataByDate(combinedData, BOL.Pathology.PathDateText);
                    AddXmlNodeTransformArgument("CombinedCytology", sortedCombinedData);
                }
                else
                {
                    AddXmlNodeTransformArgument("CombinedCytology", xmlData);
                }
            }
            else
            {
                AddXmlNodeTransformArgument("CombinedCytology", xmlData);
            }

        }

        private void AddHadProstatectomy()
        {
            bool hadProstatectomy = false;

            ProstatectomyDa prostatectomiesDa = new ProstatectomyDa();
            DataTable prostatectomiesDt = prostatectomiesDa.GetRecords(base.EFormPatientId);
            if (prostatectomiesDt.Rows.Count > 0)
            {
                hadProstatectomy = true;
            }
            AddTransformArgument("HadProstatectomy", "", hadProstatectomy.ToString().ToLower());

        }




        # endregion Xsl Params
    }
}
