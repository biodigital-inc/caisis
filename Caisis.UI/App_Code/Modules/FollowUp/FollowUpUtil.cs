using System;
using System.Data;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;

using Caisis.DataAccess;
using Caisis.BOL;
using Caisis.UI.Core.Classes;


namespace Caisis.UI.Modules.FollowUp
{

   
    /// <summary>
    /// Summary description for FollowUpUtil
    /// </summary>
    public static class FollowUpUtil
    {
        /// <summary>
        /// value is "RP"   
        /// </summary>
        public const string DEFAULT_PROCEDURE = "RP";
        public const string DEFAULT_PROCEDURE_LOOKUPCODE = "ProcName,ModuleDefault,FollowUp";

        /// <summary>
        /// Uses the Category field of Metadata surveys to drive drop down selections
        /// </summary>
        public static void PopulateSurveyDropDown(DropDownList ddlSurveyType)
        {
            FollowUpDA da = new FollowUpDA();
            DataTable dt = da.GetMetadataSurveysByCategory("QOL");
            ddlSurveyType.DataSource = dt;
            ddlSurveyType.DataTextField = MetadataSurvey.SurveyType; //set in front end but to make sure if name changes
            ddlSurveyType.DataValueField = MetadataSurvey.SurveyType;
            ddlSurveyType.DataBind();
        }

        /// <summary>
        /// Get the full long name of a survey, based on the month. 
        /// </summary>
        /// <param name="month"></param>
        /// <param name="surveyShortType">"EPIC" or "RAND"</param>
        /// <returns></returns>
        public static string GetSurveyFullName(int month, string surveyShortType)
        {
            if (surveyShortType.Equals(EPICShortSurvey.ShortName) || surveyShortType.Contains(EPICShortSurvey.ShortName)) // for EPIC surveys, the name is "EPIC" regardless of month
            {
                return EPICShortSurvey.FullName;
            }
            else if (surveyShortType.Contains(RANDSurvey.ShortName)) // for QOL surveys, the name is based on month value
            {
                if (month == 1)
                {
                    return RANDSurvey.EarlyTxSurveyName;
                }
                else if (month > 1)
                {
                    return RANDSurvey.LateTxSurveyName;
                }
                else // month is "0" ..equals PREOP
                {
                    return RANDSurvey.PreTxSurveyName;
                }
            }
            else
            {
                return "Survey Not Found";
            }
        }
        
        public static string GetSurveyShortName(string surveyReference)
        {
            if (surveyReference.Contains(EPICShortSurvey.ShortName))
            {
                return EPICShortSurvey.ShortName;
            }
            else if (surveyReference.Contains(RANDSurvey.ShortName))
            {
                return RANDSurvey.ShortName;
            }
            else
            {
                return "Survey Short Name Not Found";
            }
        }

        /// <summary>
        /// Get action item to log for surveys or letters.
        /// </summary>
        /// <param name="formLongName">Names of surveys/letter</param>
        /// <param name="month">month survey due</param>
        /// <param name="isSurvey">true/false</param>
        /// <returns>the action item</returns>
        public static string GetActionItemToLog(int patientId, string month, string formLongName, bool isSurvey)
        {
            if (isSurvey)
            {
                return FollowUpUtil.GetSurveyActionItem(formLongName, month);
            }
            else // a follow up letter
            {
                return GetLetterActionItem(formLongName, month, patientId);
            }
        }

        /// <summary>
        /// Returns action item in format: NAME + MONTH + Month Sent
        /// </summary>
        /// <param name="surveyName"></param>
        /// <param name="month"></param>
        /// <returns></returns>
        public static string GetSurveyActionItem(string surveyName, string month)
        {
            string actionItem = surveyName + " " + month + " Month Sent";
            return actionItem;
        }

        public static string GetLetterActionItem(string surveyName, string month, int patientId)
        {
            // first get last survey sent
            FollowUpDA da = new FollowUpDA();
            DataTable dt = da.GetLastSurveySent(patientId);

            if (dt.Rows.Count > 0)
            {
                string actionItem = dt.Rows[0][Caisis.BOL.Action.ActionItem].ToString();
                string surveyType = GetSurveyNameFromActionItem(actionItem);
                // format of follow up action item is "NAME x Month Letter Sent"
                string letterActionItem = surveyType + " " + month + " Month Letter Sent";
                return letterActionItem;
            }
            else
            {
                return string.Empty;
            }
           
        }



        /// <summary>
        /// Get the Survey name based on the Survey/Letter Sent ActionItem
        /// </summary>
        /// <param name="actionItem">Survey format is "NAME X MONTH SENT.  Letter format is "NAME X MONTH LETTER SENT". (x is month number)"</param>
        /// <returns>Name of Survey</returns>
        public static string GetSurveyNameFromActionItem(string actionItem)
        {
            char[] delimit = new char[] { ' ' };
            string[] actionItemSplit = actionItem.Split(delimit);

            // take first word from action item
            // EPIC format is "EPIC-26 Short Survey 1 Month [LETTER] Sent"
            // RAND format is "RAND POST Early Tx 1 Month [LETTER] Sent"
            // string surveyType = actionItemSplit[0];

            //get length of array arguments that comprise the survey name
            int nameLength;
            if (!actionItem.Contains("Letter"))
                nameLength = actionItemSplit.Length - 3; // 3 accounts for "X Month Sent";
            else
                nameLength = actionItemSplit.Length - 4; // 4 accounts for "X Month Letter Sent";

            // copy just the survey name into a new array leaving out the "X Month [Letter] Sent" part
            string[] surveyName = new string[nameLength];
            Array.Copy(actionItemSplit, 0, surveyName, 0, nameLength);
            string fullName = String.Join(" ", surveyName);
            
            return fullName;
        }

        /// <summary>
        /// Get the Survey Month Number based on the Survey/Letter Sent ActionItem
        /// </summary>
        /// <param name="actionItem">Survey format is "NAME X MONTH SENT.  Letter format is "NAME X MONTH LETTER SENT". (x is month number)"</param>
        /// <returns>Monthame of Survey</returns>
        public static string GetSurveyMonthNoFromActionItem(string actionItem)
        {
            char[] delimit = new char[] { ' ' };
            string[] actionItemSplit = actionItem.Split(delimit);
            int nameLength = actionItemSplit.Length;

            string monthNo;
            if (!actionItem.Contains("Letter"))
                monthNo = actionItemSplit[nameLength - 3]; // 3 accounts for "X Month Sent";
            else
                monthNo = actionItemSplit[nameLength - 4]; // 4 accounts for "X Month Letter Sent";

            return monthNo;
        }
    }
    
}
