using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

using Caisis.BOL;
using Caisis.UI.Core.Classes;
using Caisis.Security;
using System.Xml;
using Caisis.Controller;
using Caisis.DataAccess;
using System.IO;
using iTextSharp.text;
using iTextSharp.text.html.simpleparser;
using iTextSharp.text.pdf;

namespace Caisis.UI.Modules.FollowUp
{

    public partial class Modules_FollowUp_MergedFileContainter : FollowUpBasePage
    {
        private XmlDocument xDocFollowUp;
        string _surveyRuleType = String.Empty;
        MergePDF _objMergePdf = new MergePDF();
        string[] patientIds;

        // comma separated list of patient Ids to pass in qs when printing labels
        protected string printLabelsPageUrlvVars = String.Empty;

        public Modules_FollowUp_MergedFileContainter()
        {
            xDocFollowUp = XmlUtil.GetFollowUpXml();
        }

        protected void Page_PreInit(object sender, EventArgs e)
        {           
            if (Request.QueryString["patientIds"] != null && Request.QueryString["patientIds"].Length > 0)
            {
                string pIds = CustomCryptoHelper.Decrypt(Request.QueryString["patientIds"].ToString());
                patientIds = pIds.Split(",".ToCharArray(), StringSplitOptions.RemoveEmptyEntries);
                
                if (Request.QueryString["surveyRuleType"] != null && Request.QueryString["surveyRuleType"].Length > 0)
                    _surveyRuleType = Request.QueryString["surveyRuleType"].ToString();

                string sourceFolder = Server.MapPath("../../../Modules/FollowUp/Surveys/");
 
                BaseLongitudinalControl lControl = new BaseLongitudinalControl();
               
                foreach (string pId in patientIds)
                {
                    //get survey(s) due for patient                    
                    string fileNames = GetSurveyPacketFileNames(_surveyRuleType, Int32.Parse(pId));
                    string[] fileNamesArray = fileNames.Split(',');

                    // get page number(s) of any pages to skip
                    string[] pagesToSkip = new string[] { String.Empty };

                    foreach (string fileName in fileNamesArray)
                    {
                        // if file is for coverletter (.xml)
                        if (fileName.Contains(".xml"))
                        {
                            lControl = new BaseLongitudinalControl();
                            lControl = (BaseLongitudinalControl)this.LoadControl("~/Modules/FollowUp/LongitudinalFollowUp/LongitudinalLetter.ascx");
                            lControl.PatientId = Int32.Parse(pId);
                            lControl.CoverLetterXmlFileName = fileName;

                            _objMergePdf.AddControlPage(MergedFileForm, lControl);
                        }
                        else if (fileName.Contains(".pdf"))
                        {
                            _objMergePdf.AddFile(fileName, sourceFolder, pagesToSkip);
                        }
                    }

                }
            }
        }

        protected override void Page_Load(object sender, EventArgs e)
        {

         
        }
        protected override void Render(HtmlTextWriter writer)
        {

            if (_objMergePdf.FileCount > 0)
                _objMergePdf.Execute(MergedFileForm);
            else
            {
                HttpContext.Current.Response.Write("No documents were found.<br/><br/>Please ensure the FollowUpRegistry.xml:<br/><br/>1.) contains the necessary rule(s) with type '" + _surveyRuleType + "'<br/><br/>2.) specifies any surveys/forms/letters to be included with rule. ");
                HttpContext.Current.Response.Flush();
                HttpContext.Current.Response.Close();
            }

        }

        private String GetSurveyPacketFileNames(string surveyRuleType, int patientId)
        {
            string fileNames = String.Empty;

            if (!String.IsNullOrEmpty(surveyRuleType))
            {
                // run survey due queries to ensure patients have the appropriate 'NeedLetterX' status, if needed
                XmlNodeList rulesNodes = xDocFollowUp.SelectSingleNode("/surveyrules") != null ? xDocFollowUp.SelectSingleNode("/surveyrules").ChildNodes : null;

                foreach (XmlNode currNode in rulesNodes)
                {
                    bool ruleActive = false;
                    if (currNode.Attributes["type"] != null && currNode.Attributes["type"].Value.ToLower().Equals(surveyRuleType.ToLower()) && Boolean.TryParse(currNode.Attributes["active"].Value, out ruleActive))
                    {
                        if (ruleActive)
                        {
                            string ruleName = currNode.Attributes["name"] != null ? currNode.Attributes["name"].Value : String.Empty;
                            string ruleDescription = currNode.SelectSingleNode("description") != null ? currNode.SelectSingleNode("description").InnerText : String.Empty;
                            string queryFileName = currNode.SelectSingleNode("sqlFile") != null ? currNode.SelectSingleNode("sqlFile").InnerText : String.Empty;

                            XmlNodeList coverLetterNodes = currNode.SelectSingleNode("coverletters") != null ? currNode.SelectSingleNode("coverletters").ChildNodes : null;
                            Hashtable coverLettersForRule = new Hashtable();

                            foreach (XmlNode currentCoverLetterNode in coverLetterNodes)
                            {
                                string coverLetterDisplayName = currentCoverLetterNode.Name.ToUpper() == "coverletter".ToUpper() && currentCoverLetterNode.Attributes["displayName"] != null ? currentCoverLetterNode.Attributes["displayName"].Value : String.Empty;
                                string coverLetterFileName = currentCoverLetterNode.Name.ToUpper() == "coverletter".ToUpper() && currentCoverLetterNode.Attributes["xmlFileName"] != null ? currentCoverLetterNode.Attributes["xmlFileName"].Value : String.Empty;

                                if (!String.IsNullOrEmpty(coverLetterDisplayName) && !String.IsNullOrEmpty(coverLetterFileName))
                                    coverLettersForRule.Add(coverLetterDisplayName, coverLetterFileName);
                            }

                            XmlNodeList surveyNodes = currNode.SelectSingleNode("surveys") != null ? currNode.SelectSingleNode("surveys").ChildNodes : null;
                            Hashtable surveysForRule = new Hashtable();

                            foreach (XmlNode currentSurveyNode in surveyNodes)
                            {
                                string surveyDisplayName = currentSurveyNode.Name.ToUpper() == "survey".ToUpper() && currentSurveyNode.Attributes["displayName"] != null ? currentSurveyNode.Attributes["displayName"].Value : String.Empty;
                                string surveyFileName = currentSurveyNode.Name.ToUpper() == "survey".ToUpper() & currentSurveyNode.Attributes["pdfFileName"] != null ? currentSurveyNode.Attributes["pdfFileName"].Value : String.Empty;

                                if (!String.IsNullOrEmpty(surveyDisplayName) && !String.IsNullOrEmpty(surveyFileName))
                                    surveysForRule.Add(surveyDisplayName, surveyFileName);

                            }

                            if (!String.IsNullOrEmpty(queryFileName))
                            {
                                string surveydueSql = ReportController.LoadSQLFromFile(queryFileName);

                                if (!String.IsNullOrEmpty(surveydueSql))
                                {
                                    DataTable surveysDueDt = new DataTable();
                                    DataAccessHelper.ExecuteSqlSelect(surveydueSql, surveysDueDt);
                                    DataView surveysDueDv = new DataView(surveysDueDt);
                                    surveysDueDv.RowFilter = Patient.PatientId + " = " + patientId;

                                    if (surveysDueDv.Count == 1)
                                    {
                                        foreach (DictionaryEntry item in coverLettersForRule)
                                        {
                                            fileNames = fileNames + item.Value.ToString() + ",";
                                        }
                                        foreach (DictionaryEntry item in surveysForRule)
                                        {
                                            fileNames = fileNames + item.Value.ToString() + ",";
                                        }

                                    }
                                }
                            }
                            else
                            {
                                foreach (DictionaryEntry item in coverLettersForRule)
                                {
                                    fileNames = fileNames + item.Value.ToString() + ",";
                                }
                                foreach (DictionaryEntry item in surveysForRule)
                                {
                                    fileNames = fileNames + item.Value.ToString() + ",";
                                }

                            }

                        }
                    }
                }
            }
            fileNames = fileNames.Trim(',');
            return fileNames;
        }


    }
}
