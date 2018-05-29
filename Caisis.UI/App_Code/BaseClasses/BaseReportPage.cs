using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using Caisis.BOL;
using Caisis.Security;
using Caisis.Controller;

namespace Caisis.UI.Core.Classes
{
    /// <summary>
    /// The base Page for all Reports
    /// </summary>
    public abstract class BaseReportPage : BasePage
    {
        /// <summary>
        /// The default output filename
        /// </summary>
        public static readonly string DEFAULT_EXPORT_FILENAME = "Report.xls";

        /// <summary>
        /// Returns the client window width passed in the query string
        /// </summary>
        public int? ClientWidth
        {
            get
            {
                return ParseQuerySize("clientWidth");
            }
        }

        /// <summary>
        /// Returns the client window height passed in the query string
        /// </summary>
        public int? ClientHeight
        {
            get
            {
                return ParseQuerySize("clientHeight");
            }
        }

        public BaseReportPage()
            : base()
        {

        }

        /// <summary>
        /// Gets the Report Title
        /// </summary>
        public virtual string ReportTitle
        {
            get
            {
                string reportTitle = this.GetType().Name;
                return reportTitle;
            }
        }

        #region utilities

        /// <summary>
        /// Returns the Report Configuration associated with this Report
        /// </summary>
        /// <returns></returns>
        protected virtual ReportConfiguration GetReportConfiguration()
        {
            // load user report
            var reports = ReportConfigurations.LoadFromXml(ReportConfigurationType.User);
            return reports.GetReportById(ReportTitle);
        }

        /// <summary>
        /// Returns a list of of User entered parameters and values
        /// </summary>
        /// <returns></returns>
        protected virtual IDictionary<string, string> GetUserParams()
        {
            Dictionary<string, string> postedParams = new Dictionary<string, string>();
            // paramaters passed as single encoded query param
            string paramsQS = Request.QueryString["params"]; // move to POST???
            if (!string.IsNullOrEmpty(paramsQS))
            {
                // decode: param1%3Dvalue1%26para2%3Dvalue2 -> param1=value1&para2=value2
                string decodedQS = Server.UrlDecode(paramsQS);
                postedParams = PageUtil.GetUrlPairs(decodedQS);
            }
            return postedParams;
        }

        /// <summary>
        /// Returns a parsed int (if applicable) from the query string paramater
        /// </summary>
        /// <param name="key"></param>
        /// <returns></returns>
        private int? ParseQuerySize(string key)
        {
            int dimension;
            if (Page != null && Page.Request != null)
            {
                if (int.TryParse(Page.Request.QueryString[key], out dimension))
                {
                    return dimension;
                }
            }
            return null;
        }

        #endregion

        #region Report Logging

        /// <summary>
        /// Logs that the current report has been view (via ReportTitle)
        /// </summary>
        protected void LogReportView()
        {
            LogReportView(ReportTitle);
        }

        /// <summary>
        /// Logs that user has viewed report
        /// </summary>
        /// <param name="reportName"></param>
        protected void LogReportView(string reportName)
        {
            LogReportView(reportName, new Dictionary<string, string>());
        }

        /// <summary>
        /// Logs that user has viewed report with paramaters
        /// </summary>
        /// <param name="reportName"></param>
        /// <param name="reportParams"></param>
        protected void LogReportView(string reportName, Dictionary<string, string> reportParams)
        {
            Caisis.Controller.ReportController.LogReportView(reportName, reportParams);
        }

        #endregion

        #region Export

        /// <summary>
        /// Gets the default output name
        /// </summary>
        protected string DefaultOutputFileName
        {
            get
            {
                return ReportTitle.Replace(" ", "") + ".xls";
            }
        }

        /// <summary>
        /// Returns if a User can Export To Excel
        /// </summary>
        /// <returns></returns>
        public bool CanExportToExcel()
        {
            return Caisis.Controller.ExcelExporter.CanExportToExcel();
        }

        /// <summary>
        /// Writes report to ouput for download. ReportTitle will be used for output filename
        /// </summary>
        /// <param name="exportView">The DataView to be exported</param>
        protected void ExportToExcel(DataView exportView)
        {
            ExportToExcel(exportView, ReportTitle, DefaultOutputFileName);
        }        

        /// <summary>
        /// Writes report to ouput for download
        /// </summary>
        /// <param name="exportView">The DataView to be exported</param>
        /// <param name="reportTitle">The friendly name of the output report</param>
        /// <param name="fileName">The filename of the output file</param>
        protected void ExportToExcel(DataView exportView, string reportTitle, string fileName)
        {
            string outputFileName = !string.IsNullOrEmpty(fileName) ? fileName : (!string.IsNullOrEmpty(reportTitle) ? reportTitle + ".xls" : DEFAULT_EXPORT_FILENAME);
            Caisis.Controller.ExcelExporter.ExportToExcel(this, exportView, reportTitle, outputFileName);
        }

        /// <summary>
        /// Write report to csv
        /// </summary>
        /// <param name="exportTable"></param>
        protected void ExportToCSV(DataTable exportTable)
        {
            ExportToCSV(exportTable, ReportTitle);
        }

        /// <summary>
        /// Write report to csv
        /// </summary>
        /// <param name="exportTable"></param>
        /// <param name="reportTitle"></param>
        protected void ExportToCSV(DataTable exportTable, string reportTitle)
        {
            Caisis.Controller.ExcelExporter.ExportToCSV(exportTable, this, reportTitle);
        }

        #endregion
    }

    /// <summary>
    /// ImageButton for exporting to excel based on User's Permission
    /// </summary>
    public class ExcelExportButton : Button
    {
        private static readonly string EXPORT_TEXT = "Export To Excel";
        private static readonly string EXPORT_TOOLTIP = "Save for Microsoft Excel";

        public ExcelExportButton()
        {
            this.Text = EXPORT_TEXT;
            this.ToolTip = EXPORT_TOOLTIP;
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="writer"></param>
        protected override void Render(HtmlTextWriter writer)
        {
            // only render with permission
            if (Caisis.Controller.ExcelExporter.CanExportToExcel())
            {
                base.Render(writer);
            }
        }
    }

    /// <summary>
    /// ImageButton for exporting to excel based on User's Permission
    /// </summary>
    public class ExcelExportImageButton : ImageButton
    {
        private static readonly string EXPORT_IMAGE = "~/Images/ExcelIcon.gif";
        private static readonly string EXPORT_TOOLTIP = "Save for Microsoft Excel";

        public ExcelExportImageButton()
            : base()
        {
            this.ImageUrl = EXPORT_IMAGE;
            this.ToolTip = EXPORT_TOOLTIP;
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="writer"></param>
        protected override void Render(HtmlTextWriter writer)
        {
            // only render with permission
            if (Caisis.Controller.ExcelExporter.CanExportToExcel())
            {
                base.Render(writer);
            }
        }
    }
}