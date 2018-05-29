using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

using Caisis.UI.Core.Classes;
using Caisis.BOL;
using Caisis.DataAccess;
using Caisis.Security;

namespace Caisis.UI.Modules.FollowUp
{

    /// <summary>
    /// Summary description for SurveyBasePage
    /// </summary>
    public class SurveyBasePage : BasePage
    {
        /* Logging of Actions and SurveyType(name) uses the following syntax:
            RAND 1 Month Survey Sent
            EPIC 1 Month Survey Sent 
            etc....
            RAND 1 Month Letter Sent
        
         *  Etc...
            SurveyType in the surveys table you can use:
            EVU QOL 1 Month
            Etc...*/


        public SurveyBasePage()
            : base()
        {

        }

        /// <summary>
        /// Exports the report to excel (via Response output)
        /// </summary>
        /// <param name="report"></param>
        /// <param name="reportName"></param>
        /// <param name="fileName"></param>
        protected void ExportToExcel(DataView report, string reportName, string fileName)
        {
            Caisis.Controller.ExcelExporter.ExportToExcel(this, report, reportName, fileName);
        }

        /// <summary>
        /// Logs report view
        /// </summary>
        /// <param name="reportName"></param>
        protected void LogReportView(string reportName)
        {
            Caisis.Controller.ReportController.LogReportView(reportName);
        }

 
    }
}
