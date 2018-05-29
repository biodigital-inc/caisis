using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Linq;
using System.Xml;
using System.Xml.Linq;

using Caisis.BOL;
using Caisis.DataAnalysis;
using Caisis.UI.Core.Classes;
using Caisis.Security;

namespace Caisis.Controller
{

    /// <summary>
    /// Class for exporting data via excel
    /// </summary>
    public class ExcelExporter
    {
        /// <summary>
        /// The ExportType for Reports exported
        /// </summary>
        private static readonly string REPORT_EXPORT_TYPE_EXCEL = "Report Excel";

        private static readonly string REPORT_EXPORT_TYPE_CSV = "Report CSV";

        /// <summary>
        /// Log that a user exported data to an excel file
        /// </summary>
        /// <param name="disease">disease or service the data is relevant to if applicable</param>
        /// <param name="purpose">data exploration, research data analysis, operations data analysis</param>
        /// <param name="identified">does the data contain identifiers</param>
        /// <param name="isIRBApproved">is the export approved by the IRB</param>
        public static void LogUserExport(string disease, string purpose, bool identified, bool isIRBApproved)
        {
            UserExport userExport = new UserExport();

            // need to get User Login Id
            string userLoginId = System.Web.HttpContext.Current.Session[SessionKey.LoginId].ToString();

            string privacyLevel = "Identified";
            string irbApproval = "No";

            if (isIRBApproved)
            {
                irbApproval = "Yes";
            }

            if (identified == false)
            {
                privacyLevel = "Deidentified";
            }

            userExport[UserExport.DiseaseType] = disease;
            userExport[UserExport.ExportDate] = DateTime.Now;
            //userExport[UserExport.IRB_ApprovalDate] = irbApprovalDate;
            userExport[UserExport.IRB_ApprovalType] = irbApproval;
            userExport[UserExport.PrivacyLevel] = privacyLevel;
            userExport[UserExport.Purpose] = purpose;
            userExport[UserExport.UserLoginId] = userLoginId;

            userExport.Save();
        }

        /// <summary>
        /// Logs that User has exported a report via Excel
        /// </summary>
        /// <param name="reportName"></param>
        public static void LogExcelReport(string reportName)
        {
            LogReportExport(REPORT_EXPORT_TYPE_EXCEL, reportName);
        }

        /// <summary>
        /// Logs that User has exported a report via CSV
        /// </summary>
        /// <param name="reportName"></param>
        public static void LogCSVReport(string reportName)
        {
            LogReportExport(REPORT_EXPORT_TYPE_CSV, reportName);
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="exportType"></param>
        /// <param name="reportName"></param>
        public static void LogReportExport(string exportType, string reportName)
        {
            UserExport biz = new UserExport();
            string userLoginId = System.Web.HttpContext.Current.Session[SessionKey.LoginId].ToString();
            biz[UserExport.UserLoginId] = userLoginId;
            biz[UserExport.ExportDate] = DateTime.Now;
            biz[UserExport.ExportType] = exportType;
            biz[UserExport.ExportName] = reportName;
            biz.Save();
        }

        /// <summary>
        /// Can stream DataTable to Browser, directly, you need to set 
        /// 
        /// Response.Clear();
        /// Response.Buffer= true;
        /// Response.ContentType = "application/vnd.ms-excel";
        /// Response.AddHeader("Content-Disposition", "inline;filename=Clientes.xls"); Response.Charset = "";
        /// this.EnableViewState = false
        /// // ACTUAL CODE 
        /// ProduceCSV(dt, Response.Output, true);
        /// </summary>
        /// <param name="dt"></param>
        /// <param name="httpStream"></param>
        /// <param name="WriteHeader"></param>
        //public static void ProduceCSV(DataTable dt, System.IO.TextWriter httpStream, bool WriteHeader)
        //{
        //    if (WriteHeader)
        //    {
        //        string[] arr = new String[dt.Columns.Count];
        //        for (int i = 0; i < dt.Columns.Count; i++)
        //        {
        //            arr[i] = dt.Columns[i].ColumnName;
        //            arr[i] = GetWriteableValue(arr[i]);
        //        }

        //        httpStream.WriteLine(string.Join(",", arr));
        //    }

        //    for (int j = 0; j < dt.Rows.Count; j++)
        //    {
        //        string[] dataArr = new String[dt.Columns.Count];
        //        for (int i = 0; i < dt.Columns.Count; i++)
        //        {
        //            object o = dt.Rows[j][i];
        //            dataArr[i] = GetWriteableValue(o);
        //        }
        //        httpStream.WriteLine(string.Join(",", dataArr));
        //    }
        //}

        /// <summary>
        /// Exports the data table as a CSV file via HttpResponse output stream
        /// </summary>
        /// <param name="dt"></param>
        /// <param name="page"></param>
        /// <param name="reportName"></param>
        public static void ExportToCSV(DataTable dt, Page page, string reportName)
        {
            // out response output
            var response = page.Response;
            var outputStream = response.Output;
            // set required headers, and output to response
            response.Clear();
            response.Buffer = true;
            response.AddHeader("Content-Disposition", "attachment; filename=" + "export.txt");
            response.ContentType = "text/plain";
            response.Charset = string.Empty;
            // write csv to stream
            //ProduceCSV(dt, outputStream, true);
            CSV.Write(dt, outputStream);
            // log export
            LogCSVReport(reportName);
            // end write
            page.Response.End();
        }


        //#region CSV Producer
        //public static void ProduceCSV(DataTable dt, System.IO.StreamWriter file, bool WriteHeader)
        //{
        //    if (WriteHeader)
        //    {
        //        string[] arr = new String[dt.Columns.Count];
        //        for (int i = 0; i < dt.Columns.Count; i++)
        //        {
        //            arr[i] = dt.Columns[i].ColumnName;
        //            arr[i] = GetWriteableValue(arr[i]);
        //        }

        //        file.WriteLine(string.Join(",", arr));
        //    }

        //    for (int j = 0; j < dt.Rows.Count; j++)
        //    {
        //        string[] dataArr = new String[dt.Columns.Count];
        //        for (int i = 0; i < dt.Columns.Count; i++)
        //        {
        //            object o = dt.Rows[j][i];
        //            dataArr[i] = GetWriteableValue(o);
        //        }
        //        file.WriteLine(string.Join(",", dataArr));
        //    }
        //}

        //public static string GetWriteableValue(object o)
        //{
        //    if (o == null || o == Convert.DBNull)
        //        return "";
        //    else if (o.ToString().IndexOf(",") == -1)
        //        return o.ToString();
        //    else
        //        return "\"" + o.ToString() + "\"";

        //}
        //#endregion

        /// <summary>
        /// Returns if a User can Export To Excel
        /// </summary>
        /// <returns></returns>
        public static bool CanExportToExcel()
        {
            return PermissionManager.HasPermission(PermissionManager.ExportData);
        }

        /// <summary>
        /// Exports all columns and data in DataView to an Excel document via output stream.
        /// Also logs export to db.
        /// </summary>
        /// <param name="page">The Page containing the HttpResponse to which the output will be written</param>
        /// <param name="exportView">The data as a view to be exported</param>
        /// <param name="reportName">The user friendly name of the report</param>
        /// <param name="fileName">The output filename for user download, i.e., Export.xls</param>
        public static void ExportToExcel(Page page, DataView exportView, string reportName, string fileName)
        {
            // explicitly build list of export columns names/columns titles
            var exportColumns = (from column in exportView.Table.Columns.Cast<DataColumn>()
                                 select column.ColumnName).ToDictionary(col => col, col => col);
            ExportToExcel(page, exportView, reportName, fileName, exportColumns);
        }

        /// <summary>
        /// Exports the specified columsnin the DataView to an Excel document via output stream.
        /// Also logs export to db.
        /// </summary>
        /// <param name="page">The Page containing the HttpResponse to which the output will be written</param>
        /// <param name="exportView">The data as a view to be exported</param>
        /// <param name="reportName">The user friendly name of the report</param>
        /// <param name="fileName">The output filename for user download, i.e., Export.xls</param>
        /// <param name="columns">A list of columns names(for binding to data)/column titles(for displaying in header) to export.</param>
        public static void ExportToExcel(Page page, DataView exportView, string reportName, string fileName, IDictionary<string, string> columns)
        {
            // Validate User can Export
            if (CanExportToExcel())
            {
                // grid representing ouput structure
                GridView exportGrid = new GridView();
                exportGrid.EnableViewState = false;
                exportGrid.UseAccessibleHeader = true;
                exportGrid.AllowSorting = false;
                exportGrid.HeaderStyle.ForeColor = System.Drawing.Color.Black;
                // build a list of explicit columns
                exportGrid.AutoGenerateColumns = false;
                foreach (string columnName in columns.Keys)
                {
                    string columnTitle = columns[columnName];
                    BoundField boundField = new BoundField();
                    boundField.DataField = columnName;
                    boundField.HeaderText = columnTitle;
                    exportGrid.Columns.Add(boundField);
                }
                exportGrid.DataSource = exportView;
                exportGrid.DataBind();
 
                // finally write output grid
                ExportToExcel(page, exportGrid, reportName, fileName);
            }
        }

        /// <summary>
        /// Write the specified GridView out Response Stream (includes all columns)
        /// </summary>
        /// <param name="page">The Page containing the HttpResponse to which the output will be written</param>
        /// <param name="exportGrid">The GridView containing data to export</param>
        /// <param name="reportName">The user friendly name of the report</param>
        /// <param name="fileName">The output filename for user download, i.e., Export.xls</param>
        public static void ExportToExcel(Page page, GridView exportGrid, string reportName, string fileName)
        {
            // Validate User can Export
            if (CanExportToExcel())
            {
                // clean outputname
                string normalizedFileName = fileName.Trim().Replace(" ", "");

                // The HTTP Response for writing the data
                HttpResponse Response = page.Response;

                // Render Grid Output into String
                System.IO.StringWriter oStringWriter = new System.IO.StringWriter();
                System.Web.UI.HtmlTextWriter oHtmlTextWriter = new System.Web.UI.HtmlTextWriter(oStringWriter);
                exportGrid.RenderControl(oHtmlTextWriter);
                string excelOutput = oStringWriter.ToString();

                // Write Data to Response
                Response.Clear();
                Response.Buffer = true;
                Response.AddHeader("Content-Disposition", "attachment; filename=" + normalizedFileName);
                Response.ContentType = "application/vnd.ms-excel";
                Response.Charset = string.Empty;
                Response.Write(excelOutput);

                // VERY IMPORTANT: DON'T End Response until report logged

                // Log User Export
                LogExcelReport(reportName);

                // FINALLY: end stream
                Response.End();
            }
        }

        /// <summary>
        /// Write the specified DataSet as an Excel document to the Response Stream (includes all columns)
        /// </summary>
        /// <param name="page">The Page containing the HttpResponse to which the output will be written</param>
        /// <param name="ds">The DataSet containing the data to export</param>
        /// <param name="reportName">The user friendly name of the report</param>
        /// <param name="fileName">The output filename for user download, i.e., Export.xls</param>
        public static void ExportToExcel(Page page, DataSet ds, string reportName, string fileName)
        {
            // Validate User can Export
            if (CanExportToExcel())
            {
                WriteExcelToResponse(page.Response, reportName, fileName, (response) =>
                {
                    // Get Doccument
                    XmlWriterSettings settings = new XmlWriterSettings();
                    settings.Indent = true;
                    settings.IndentChars = "  ";
                    XmlWriter output = XmlWriter.Create(response.OutputStream, settings);
                    XDocument excelDocument = ExcelGenerator.GetExcelDocument(ds);
                    excelDocument.WriteTo(output);
                    // !important
                    output.Flush();
                    //output.Close();
                });
            }
        }

        private static void WriteExcelToResponse(HttpResponse response, string reportName, string fileName, Action<HttpResponse> write)
        {
            // Validate User can Export
            if (CanExportToExcel())
            {
                // clean outputname
                string normalizedFileName = fileName.Trim().Replace(" ", "");

                // Write Data to Response
                response.Clear();
                response.Buffer = true;
                response.AddHeader("Content-Disposition", "attachment; filename=" + normalizedFileName);
                response.ContentType = "application/vnd.ms-excel";
                response.Charset = string.Empty;
                write(response);

                // VERY IMPORTANT: DON'T End Response until report logged

                // Log User Export
                LogExcelReport(reportName);

                // FINALLY: end stream
                response.End();
            }
        }
    }

    /// <summary>
    /// Utility for generating Excel Compliant Xml Documents
    /// </summary>
    public static class ExcelGenerator
    {
        private static readonly Type[] NUMBER_TYPES = new Type[] { typeof(int), typeof(double), typeof(float), typeof(decimal) };

        /// <summary>
        /// Returns an Excel XML formatted document for the given DataSet
        /// </summary>
        /// <param name="data"></param>
        /// <returns></returns>
        public static XDocument GetExcelDocument(DataSet data)
        {
            // !imporatnt: ss namespace required
            XNamespace ss = "urn:schemas-microsoft-com:office:spreadsheet";
            // create Workbook
            XElement root = new XElement(ss + "Workbook",
               new XAttribute(XNamespace.Xmlns + "ss", "urn:schemas-microsoft-com:office:spreadsheet")
            );
            XDocument xml = new XDocument(new XDeclaration("1.0", "utf-8", "yes"), root);

            // add stylesheet
            /*
            <ss:Styles>
                <ss:Style ss:ID="1">
                    <ss:Font ss:Bold="1"/>
                </ss:Style>
            </ss:Styles>
            */
            root.Add(new XElement(ss + "Styles",
                        new XElement(ss + "Style", new XAttribute(ss + "ID", "1"),
                                new XElement(ss + "Font", new XAttribute(ss + "Bold", "1")))));
            // add a worksheet for each table
            foreach (DataTable table in data.Tables)
            {
                int colCount = table.Columns.Count;
                XElement xWorksheet = new XElement(ss + "Worksheet", new XAttribute(ss + "Name", table.TableName));
                // create Table
                XElement xTable = new XElement(ss + "Table");
                // create Header Columns
                XElement xHeaderRow = new XElement(ss + "Row", new XAttribute(ss + "StyleID", "1"));
                // auto column sizes
                Dictionary<int, int> colIndexToLength = new Dictionary<int, int>();
                for (int i = 0; i < colCount; i++)
                {
                    string colName = table.Columns[i].ColumnName;
                    XElement xHeaderCell = new XElement(ss + "Cell");
                    XElement xHeaderData = new XElement(ss + "Data", new XAttribute(ss + "Type", "String"), colName);
                    xHeaderCell.Add(xHeaderData);
                    xHeaderRow.Add(xHeaderCell);

                    // set min column width
                    colIndexToLength.Add(i, Math.Max(1, colName.Length));
                }
                xTable.Add(xHeaderRow);
                // add rows to each table
                foreach (DataRow row in table.Rows)
                {
                    XElement xRow = new XElement(ss + "Row");
                    // get row data
                    for (int i = 0; i < colCount; i++)
                    {
                        // get column data
                        KeyValuePair<string, string> dataTypeToValue = GetData(row[i]);
                        XElement xCell = new XElement(ss + "Cell");
                        XElement xData = new XElement(ss + "Data",
                                                new XAttribute(ss + "Type", dataTypeToValue.Key),
                                                dataTypeToValue.Value);
                        xCell.Add(xData);
                        xRow.Add(xCell);

                        // update column width
                        colIndexToLength[i] = Math.Max(colIndexToLength[i], dataTypeToValue.Value.Length);
                    }
                    xTable.Add(xRow);
                }
                // add column widths
                List<XElement> columnWidths = new List<XElement>();
                for (int i = 0; i < colCount; i++)
                {
                    int minWidth = 20;
                    int maxWidth = colIndexToLength[i];
                    int colWidth = Math.Max(minWidth, maxWidth * 6);
                    XElement xHeaderColumn = new XElement(ss + "Column", new XAttribute(ss + "Width", colWidth));
                    columnWidths.Add(xHeaderColumn);
                }
                xTable.AddFirst(columnWidths);
                xWorksheet.Add(xTable);
                root.Add(xWorksheet);
            }
            return xml;
        }

        /// <summary>
        /// Returns the raw data type + value as excel type + value
        /// </summary>
        /// <param name="rawData"></param>
        /// <returns></returns>
        private static KeyValuePair<string, string> GetData(object rawData)
        {
            string dataType = "";
            string dataValue = "";
            Type type = rawData.GetType();
            if (NUMBER_TYPES.Contains(type))
            {
                dataType = "Number";
                dataValue = rawData.ToString();
            }
            else if (type == typeof(DateTime))
            {
                dataType = "DateTime";
                dataValue = string.Format("{0:s}", rawData);
            }
            else if (type == typeof(Boolean))
            {
                dataType = "Boolean";
                dataValue = rawData.ToString();
            }
            else
            {
                dataType = "String";
                dataValue = rawData.ToString();
            }
            return new KeyValuePair<string, string>(dataType, dataValue);
        }
    }
}