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

using Caisis.DataAccess;
using Caisis.UI.Core.Classes;
using System.Xml;
using Caisis.Controller;

namespace Caisis.UI.Core.Utilities
{
    public partial class NeedPacketCallBack : System.Web.UI.Page
    {

        private XmlDocument xDocFollowUp;

        protected void Page_Load(object sender, EventArgs e)
        {
            int patientId;
            string surveyRuleType = String.Empty;
            string packetDivId = String.Empty;
            string packetLinkTitleId = String.Empty;
            string packetLabelId = String.Empty;
            string packetFileNamesId = String.Empty;

            if (Request.Form["patientId"] != null && Int32.TryParse(Request.Form["patientId"].ToString(), out patientId)
                && Request.Form["surveyRuleType"] != null && !String.IsNullOrEmpty(Request.Form["surveyRuleType"].ToString()))
           {
               surveyRuleType = Request.Form["surveyRuleType"].ToString();
                
               if (Request.Form["packetDivId"] != null && !String.IsNullOrEmpty(Request.Form["packetDivId"].ToString()))
                   packetDivId = Request.Form["packetDivId"].ToString();
               if (Request.Form["packetLinkTitleId"] != null && !String.IsNullOrEmpty(Request.Form["packetLinkTitleId"].ToString()))
                   packetLinkTitleId = Request.Form["packetLinkTitleId"].ToString();
               if (Request.Form["packetLabelId"] != null && !String.IsNullOrEmpty(Request.Form["packetLabelId"].ToString()))
                   packetLabelId = Request.Form["packetLabelId"].ToString();
               if (Request.Form["packetFileNamesId"] != null && !String.IsNullOrEmpty(Request.Form["packetFileNamesId"].ToString()))
                   packetFileNamesId = Request.Form["packetFileNamesId"].ToString();
                
               xDocFollowUp = XmlUtil.GetFollowUpXml();
               string followUpMonth = String.Empty;
               string surveySent = String.Empty;
               string surveysDue = String.Empty;
               string surveysDueFileNames = String.Empty;
               string surveyMenuLinkTitle = String.Empty;
               string currentStatus = String.Empty;

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
                           
                           string surveydueSql = !String.IsNullOrEmpty(queryFileName) ? ReportController.LoadSQLFromFile(queryFileName) : String.Empty;

                           if (!String.IsNullOrEmpty(surveydueSql))
                           {
                               DataTable surveysDueDt = new DataTable();
                               DataAccessHelper.ExecuteSqlSelect(surveydueSql, surveysDueDt);
                               DataView surveysDueDv = new DataView(surveysDueDt);
                               surveysDueDv.RowFilter = BOL.Patient.PatientId + " = " + patientId;

                               if (surveysDueDv.Count == 1)
                               {
                                   currentStatus = surveysDueDv[0][BOL.Patient.PtContactStatus].ToString();
                                   string lastSurveySent = surveysDueDv[0][BOL.Action.ActionItem].ToString();
                                   string lastSurveySentDateText = surveysDueDv[0][BOL.Action.ActionDateText].ToString();
                                   string lastSurveySentDate = surveysDueDv[0][BOL.Action.ActionDate].ToString();

                                   surveySent = !String.IsNullOrEmpty(lastSurveySent) ? lastSurveySent : "no survey sent";
                                   surveySent = !String.IsNullOrEmpty(lastSurveySent) && !String.IsNullOrEmpty(lastSurveySentDateText) ? surveySent + " - " + lastSurveySentDateText + "" : surveySent;

                                   DateTime lastSurveySentDateObj;
                                   if (DateTime.TryParse(lastSurveySentDate, out lastSurveySentDateObj))
                                   {
                                       TimeSpan diff = DateTime.Today.Subtract(lastSurveySentDateObj);

                                       // Total years
                                       int years = DateTime.Today.Year - lastSurveySentDateObj.Year;

                                       int months = 0;
                                       // Total montsh
                                       if (DateTime.Today.Month < lastSurveySentDateObj.Month)
                                       {
                                           // example: March 2010 (3) and January 2011 (1); this should be 10 monts
                                           // 12 - 3 + 1 = 10
                                           // Take the 12 months of a year into account
                                           months = 12 - lastSurveySentDateObj.Month + DateTime.Today.Month;
                                       }
                                       else
                                       {
                                           months = DateTime.Today.Month - lastSurveySentDateObj.Month;
                                       }
                                       if (years > 0)
                                           months = months + years * 12;

                                       followUpMonth = months.ToString();
                                   }
                                   else
                                       followUpMonth = "n/a";


                                   surveysDue = surveysDue + "<strong>" + ruleName + "</strong> packet to be sent to patient:  </br>";
                                   if (coverLettersForRule.Count == 0 && surveysForRule.Count == 0)
                                       surveysDue = surveysDue + "&nbsp;&nbsp;* no documents specified</br>";
                                   else
                                   {
                                       foreach (DictionaryEntry item in coverLettersForRule)
                                       {
                                           surveysDue = surveysDue + "&nbsp;&nbsp;* " + item.Key.ToString() + "</br>";
                                       }

                                       foreach (DictionaryEntry item in surveysForRule)
                                       {
                                           surveysDue = surveysDue + "&nbsp;&nbsp;* " + item.Key.ToString() + "</br>";
                                           surveysDueFileNames = surveysDueFileNames + item.Value.ToString() + ",";
                                       }
                                   }
                                   surveysDue = surveysDue + "</br>";
                               }
                           }
                           else
                           {
                               BOL.Patient ptObj = new BOL.Patient();
                               ptObj.Get(patientId);
                               currentStatus = ptObj[BOL.Patient.PtContactStatus].ToString();
                               
                               surveysDue = surveysDue + "<b>" + ruleName + "</b> packet to be sent to patient:  </br>";
                               if (coverLettersForRule.Count == 0 && surveysForRule.Count == 0)
                                   surveysDue = surveysDue + "&nbsp;&nbsp;* no documents specified</br>";
                               else
                               {
                                   foreach (DictionaryEntry item in coverLettersForRule)
                                   {
                                       surveysDue = surveysDue + "&nbsp;&nbsp;* " + item.Key.ToString() + "</br>";
                                   }

                                   foreach (DictionaryEntry item in surveysForRule)
                                   {
                                       surveysDue = surveysDue + "&nbsp;&nbsp;* " + item.Key.ToString() + "</br>";
                                       surveysDueFileNames = surveysDueFileNames + item.Value.ToString() + ",";
                                   }
                               }
                               surveysDue = surveysDue + "</br>";
                           }
                       }
                   }
               }
               surveysDueFileNames = surveysDueFileNames.Trim(',');


               string jsString = "['" + patientId.ToString() 
                   + "','" + currentStatus 
                   + "','" + followUpMonth 
                   + "','" + surveySent 
                   + "','" + surveysDue 
                   + "','" + surveysDueFileNames
                   + "','" + surveyMenuLinkTitle
                   + "','" + packetDivId 
                   + "','" + packetLinkTitleId 
                   + "','" + packetLabelId
                   + "','" + packetFileNamesId                    
                   + "']";
               Response.Write(jsString);

           }
        }

        public DataView GetTopDataViewRows(DataView dv, Int32 n)
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
    }
}
