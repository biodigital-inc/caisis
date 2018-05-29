using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Collections.Generic;
using System.Collections.Specialized;
using System.ComponentModel;
using System.Web;
using System.Xml;
using System.Linq;
using System.Web.UI.DataVisualization.Charting;

using Caisis.DataAccess;
using Caisis.BOL;
using Caisis.Controller;
using Caisis.UI.Core.Classes;
using Caisis.UI.Core.Classes.CustomControls;

namespace Caisis.Controller
{
    /// <summary>
    /// Represents a type of User Report
    /// </summary>
    public enum ReportConfigurationType
    {
        User,
        Admin
    }

    /// <summary>
    /// Summary description for ReportController
    /// </summary>
    public class ReportController
    {
        /// <summary>
        /// The ExportType representing a report for UserExports table.
        /// </summary>
        private static readonly string REPORT_VIEW_TYPE_NAME = "Report View";

        /// <summary>
        /// The ExportType representing a web service for UserExports table.
        /// </summary>
        private static readonly string WEBSERVICE_VIEW_TYPE_NAME = "Web Service";

        /// <summary>
        /// The TOP n number to restrict Users' most popular reports (null for no limit).
        /// </summary>
        private static readonly int? REPORT_POPULAR_TOP = 10;

        /// <summary>
        /// The number of recent days to limit Users' the most popular reports (null for no limit).
        /// </summary>
        private static readonly int? REPORT_POPULAR_DAYS = 14;

        /// <summary>
        /// The seperator used to seperate report name and report params
        /// </summary>
        private static readonly string REPORT_VIEW_SEPERATOR = "?";

        /// <summary>
        /// The number of recent days to search for user's recent reports
        /// </summary>
        private static readonly int REPORT_RECENT_DAYS = 5;

        /// <summary>
        /// The directory containing report related SQL files.
        /// </summary>
        public static readonly string SQL_FILES_DIRECTORY = "~/App_Data/SQLFiles/";

        public ReportController()
            : base()
        {

        }

        /// <summary>
        /// Logs that user has viewed report, via report name
        /// </summary>
        /// <param name="reportName"></param>
        public static void LogReportView(string reportName)
        {
            LogReportView(reportName, new Dictionary<string, string>());
        }

        /// <summary>
        /// Logs that the user has view report via report name, also capture report params
        /// </summary>
        /// <param name="reportName"></param>
        /// <param name="reportParams"></param>
        public static void LogReportView(string reportName, Dictionary<string, string> reportParams)
        {
            int userId = new UserController().GetUserId();
            int userLoginId = int.Parse(System.Web.HttpContext.Current.Session[SessionKey.LoginId].ToString());
            LogReportView(userLoginId, reportName, REPORT_VIEW_TYPE_NAME, reportParams);
        }

        /// <summary>
        /// Logs that the user has viewed the web service with parameters
        /// </summary>
        /// <param name="userLoginId"></param>
        /// <param name="webServiceName"></param>
        /// <param name="webServiceParams"></param>
        public static void LogWebServiceView(int userLoginId, string webServiceName, Dictionary<string, string> webServiceParams)
        {
            LogReportView(userLoginId, webServiceName, WEBSERVICE_VIEW_TYPE_NAME, webServiceParams);
        }

        /// <summary>
        /// Logs that the user has view report via report name, also capture report params
        /// </summary>
        /// <param name="userLoginId"></param>
        /// <param name="exportName"></param>
        /// <param name="exportType"></param>
        /// <param name="reportParams"></param>
        public static void LogReportView(int userLoginId, string exportName, string exportType, Dictionary<string, string> reportParams)
        {
            UserExport biz = new UserExport();
            biz[UserExport.UserLoginId] = userLoginId;
            biz[UserExport.ExportDate] = DateTime.Now;
            biz[UserExport.ExportType] = exportType;
            // store special report
            // get special report name with report params as url pair
            string reportExportName = CreateReportExportName(exportName, reportParams);
            biz[UserExport.ExportName] = reportExportName;
            biz.Save();
        }

        /// <summary>
        /// Returns a list of the most commonly used User run reports.
        /// </summary>
        /// <returns></returns>
        public static DataTable GetMostCommonlyUserReports()
        {
            UserExportDa da = new UserExportDa();
            DataTable popularReports = da.GetMostCommonlyUserReports(REPORT_POPULAR_TOP, REPORT_POPULAR_DAYS);
            // TODO: filter out report User has access to
            return popularReports;
        }

        /// <summary>
        /// Returns a user's recent report views
        /// </summary>
        /// <returns></returns>
        public static DataTable GetUserRecentReportViews()
        {
            return GetUserRecentReportViews(REPORT_RECENT_DAYS);
        }

        /// <summary>
        /// Returns a user's recent report views withing past days specifed by recentDays.
        /// </summary>
        /// <param name="recentDays"></param>
        /// <returns></returns>
        public static DataTable GetUserRecentReportViews(int recentDays)
        {
            int userId = new UserController(System.Web.HttpContext.Current.Session).GetUserId();
            UserExportDa da = new UserExportDa();
            DataTable dt =  da.GetRecentUserExports(userId, REPORT_VIEW_TYPE_NAME, DateTime.Today.AddDays(-recentDays));
            // add normalized report name column
            DataColumn reportNameColumn = new DataColumn("ReportName", typeof(string));
            dt.Columns.Add(reportNameColumn);
            foreach (DataRow row in dt.Rows)
            {
                string exportName = row[UserExport.ExportName].ToString();
                string reportName = GetNormalizedReportName(exportName);
                row[reportNameColumn] = reportName;
            }
            return dt;
        }

        /// <summary>
        /// Gets a normalized Report Name without optional query string paramaters
        /// </summary>
        /// <param name="reportName"></param>
        /// <returns></returns>
        public static string GetNormalizedReportName(string reportName)
        {
            string[] pairs = GetReportPairs(reportName);
            if (pairs.Count() > 1)
            {
                return pairs[0];
            }
            else
            {
                return reportName;
            }
        }

        /// <summary>
        /// Returns an key value pair of report paramaters extracted from raw Report Name
        /// </summary>
        /// <param name="reportName"></param>
        /// <returns></returns>
        public static Dictionary<string, string> GetNormalizedReportParams(string reportName)
        {
            string[] pairs = GetReportPairs(reportName);
            if (pairs.Count() > 1)
            {
                string paramsKeyValues = pairs[1];
                return PageUtil.GetUrlPairs(paramsKeyValues);
            }
            else
            {
                return new Dictionary<string, string>();
            }
        }

        /// <summary>
        /// Creates a special ExportName capturing report paramaters
        /// </summary>
        /// <param name="reportName"></param>
        /// <param name="reportParams"></param>
        /// <returns></returns>
        private static string CreateReportExportName(string reportName, Dictionary<string, string> reportParams)
        {
            // if params exists, create specially formatted url like paramaters
            if (reportParams != null && reportParams.Count() > 0)
            {
                string urlParams = PageUtil.CreateUrlPairs(reportParams);
                string url = "{0}" + REPORT_VIEW_SEPERATOR + "{1}";
                return string.Format(url, reportName, urlParams);
            }
            // otherwise use report name
            else
            {
                return reportName;
            }
        }

        /// <summary>
        /// Returns the report names/params strings
        /// </summary>
        /// <param name="reportName"></param>
        /// <returns></returns>
        private static string[] GetReportPairs(string reportName)
        {
            return reportName.Split(REPORT_VIEW_SEPERATOR.ToCharArray());
        }

        #region File IO

        /// <summary>
        /// Returns the sql file read from disk.
        /// </summary>
        /// <param name="sqlFile"></param>
        /// <returns></returns>
        public static string LoadSQLFromFile(string sqlFile)
        {
            string fileSQL = string.Empty;
            if (!string.IsNullOrEmpty(sqlFile))
            {
                string relitiveFilePath = SQL_FILES_DIRECTORY + sqlFile;
                string fullFilePath = System.Web.HttpContext.Current.Server.MapPath(System.Web.VirtualPathUtility.ToAbsolute(relitiveFilePath));
                // validate file exists
                if (System.IO.File.Exists(fullFilePath))
                {
                    System.IO.FileInfo fi = new System.IO.FileInfo(fullFilePath);
                    // validate of type sql file, and load text                    
                    if (fi.Extension.Equals(".sql", StringComparison.CurrentCultureIgnoreCase))
                    {
                        System.IO.StreamReader reader = fi.OpenText();
                        fileSQL = reader.ReadToEnd();
                        // cleanup
                        reader.Close();
                    }
                }
            }
            return fileSQL;
        }

        #endregion
    }

    /// <summary>
    /// 
    /// </summary>
    public class ReportConfigurations : Dictionary<string, ReportConfiguration>
    {
        private Dictionary<string, ReportCategoryConfig> categories = new Dictionary<string, ReportCategoryConfig>();

        public static readonly string DEFAULT_XML_DATA_PATH = "~\\App_Data\\";

        /// <summary>
        /// Base patht to XML config files
        /// </summary>
        protected string xmlDataPath;

        /// <summary>
        /// Contains a lookup of report configuration files by type
        /// </summary>
        private static Dictionary<ReportConfigurationType, string> REPORTS_FILES =
            new Dictionary<ReportConfigurationType, string>()
            {
                { ReportConfigurationType.Admin, "AdminSectionReports.xml" },
                { ReportConfigurationType.User, "CannedReports.xml" }
            };

        /// <summary>
        /// Gets the XML DataPath
        /// </summary>
        /// <param name="reportType"></param>
        /// <returns></returns>
        private string GetXmlDataPath(ReportConfigurationType reportType)
        {
            if (REPORTS_FILES.ContainsKey(reportType))
            {
                string reportFileName = REPORTS_FILES[reportType];
                return xmlDataPath + reportFileName;
            }
            else
            {
                return "";
            }
        }

        public ReportConfigurations()
            : this(DEFAULT_XML_DATA_PATH)
        {
            // default constructor
        }

        protected ReportConfigurations(string xmlDataPath)
        {
            this.xmlDataPath = xmlDataPath;
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="reportType"></param>
        public ReportConfigurations(ReportConfigurationType reportType)
            : this()
        {
            LoadReportsFromXml(reportType);
        }

        #region public properties

        /// <summary>
        /// Gets a list of all reports ordered by title asc
        /// </summary>
        public IOrderedEnumerable<ReportConfiguration> Reports
        {
            get
            {
                var reportlist = from r in this.Values
                                 orderby r.Title ascending
                                 select r;
                return reportlist;
            }
        }

        /// <summary>
        /// Gets a list of all static reports ordered by title asc
        /// </summary>
        public IOrderedEnumerable<ReportConfiguration> StaticReports
        {
            get
            {
                // set list of reports
                var staticreports = from r in this.Values
                                    where r.IsStatic
                                    orderby r.Title ascending
                                    select r;
                return staticreports;
            }
        }

        /// <summary>
        /// Get configuration by index
        /// </summary>
        /// <param name="index"></param>
        /// <returns></returns>
        public ReportConfiguration this[int index]
        {
            get
            {
                return this.ElementAt(index).Value;
            }
        }

        #endregion

        /// <summary>
        /// Returns a list of reports filters by category
        /// </summary>
        /// <param name="category"></param>
        /// <returns></returns>
        public IEnumerable<ReportConfiguration> GetReportsByCategory(string category)
        {
            return GetReportsByCategories(new string[] { category });
        }
 
        /// <summary>
        /// 
        /// </summary>
        /// <param name="reports"></param>
        /// <param name="category"></param>
        /// <returns></returns>
        public static IEnumerable<ReportConfiguration> GetReportsByCategory(IEnumerable<ReportConfiguration> reports, string category)
        {
            return GetReportsByCategories(reports, new string[] { category });
        }

        /// <summary>
        /// Returns a list of reports filters by categories
        /// </summary>
        /// <param name="categories"></param>
        /// <returns></returns>
        public IEnumerable<ReportConfiguration> GetReportsByCategories(IEnumerable<string> categories)
        {
            return GetReportsByCategories(Reports, categories);
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="reports"></param>
        /// <param name="categories"></param>
        /// <returns></returns>
        public static IEnumerable<ReportConfiguration> GetReportsByCategories(IEnumerable<ReportConfiguration> reports, IEnumerable<string> categories)
        {
            var filteredReports = from report in reports
                                  // select item if report's category list contains values in categories param
                                  let containCategory = report.CategoriesList.Intersect(categories).Count() > 0
                                  where containCategory
                                  orderby report.Title ascending
                                  select report;
            return filteredReports;
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="category"></param>
        /// <param name="subcategory"></param>
        /// <returns></returns>
        public IEnumerable<ReportConfiguration> GetReportsByCategoryAndSubCategory(string category, string subcategory)
        {
            var filteredReports = from report in GetReportsByCategory(category)
                                  where report.Categories[category].Contains(subcategory)
                                  select report;
            return filteredReports;
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="reports"></param>
        /// <param name="category"></param>
        /// <param name="subcategory"></param>
        /// <returns></returns>
        public static IEnumerable<ReportConfiguration> GetReportsByCategoryAndSubCategory(IEnumerable<ReportConfiguration> reports, string category, string subcategory)
        {
            // get all reports by category, then filter by subcategory
            var filteredReports = from report in GetReportsByCategory(reports, category)
                                  where report.Categories[category].Contains(subcategory)
                                  select report;
            return filteredReports;
        }

        /// <summary>
        /// Returns a list of dictinct categories across current Reports.
        /// </summary>
        /// <returns></returns>
        public IEnumerable<string> GetReportCategories()
        {
            return GetReportCategories(Reports);
        }
        /// <summary>
        /// Returns a list of dictinct categories across the list of reporst.
        /// </summary>
        /// <param name="reports"></param>
        /// <returns></returns>
        public static IEnumerable<string> GetReportCategories(IEnumerable<ReportConfiguration> reports)
        {
            // get categories across all reports (filter to distinct)
            var categories = reports.SelectMany(r => r.CategoriesList).Distinct();
            return categories;
        }

        /// <summary>
        /// Returns a list of distinct sub categories across all reports.
        /// </summary>
        /// <returns></returns>
        public IEnumerable<string> GetReportSubCategories()
        {
            return GetReportSubCategories(Reports);
        }

        /// <summary>
        /// Returns a list of distinct sub categories across the list of reports.
        /// </summary>
        /// <param name="reports"></param>
        /// <returns></returns>
        public static IEnumerable<string> GetReportSubCategories(IEnumerable<ReportConfiguration> reports)
        {
            var sub_categories = reports.SelectMany(r => r.Categories.Values.SelectMany(c => c)).Distinct();
            return sub_categories;
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="category"></param>
        /// <returns></returns>
        public ReportCategoryConfig GetCategoryConfig(string category)
        {
            if (categories.ContainsKey(category))
            {
                var cat = categories[category];
                return cat;
            }
            return null;
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="category"></param>
        /// <param name="subcategory"></param>
        /// <returns></returns>
        public ReportCategoryConfig GetSubCategoryConfig(string category, string subcategory)
        {
            if (categories.ContainsKey(category))
            {
                var cat = categories[category];
                if (cat.SubCategoriesDictionary.ContainsKey(subcategory))
                {
                    var subcat = cat.SubCategoriesDictionary[subcategory];
                    return subcat;
                }
            }
            return null;
        }


        /// <summary>
        /// Returns the category description
        /// </summary>
        /// <param name="category"></param>
        /// <returns></returns>
        public string GetCategoryDescription(string category)
        {
            var cat = GetCategoryConfig(category);
            return cat!= null? cat.Description: string.Empty;
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="category"></param>
        /// <param name="subcategory"></param>
        /// <returns></returns>
        public string GetSubCategoryDescription(string category, string subcategory)
        {
            var subcat = GetSubCategoryConfig(category, subcategory);
            return subcat != null ? subcat.Description : string.Empty;
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="category"></param>
        /// <returns></returns>
        public string GetCategoryIcon(string category)
        {
            var cat = GetCategoryConfig(category);
            return cat != null ? cat.GetCategoryIcon() : string.Empty;
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="category"></param>
        /// <param name="subcategory"></param>
        /// <returns></returns>
        public string GetSubCategoryIcon(string category, string subcategory)
        {
            var sub = GetSubCategoryConfig(category, subcategory);
            return sub != null ? sub.GetCategoryIcon() : string.Empty;
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="category"></param>
        /// <returns></returns>
        public string GetCategoryDocumentation(string category)
        {
            var cat = GetCategoryConfig(category);
            return cat != null ? cat.DocFile : string.Empty;
        }

        /// <summary>
        /// Returns the ReportConfiguration object by id, else NULL.
        /// </summary>
        /// <param name="reportId">The id of the report to find</param>
        /// <returns></returns>
        public ReportConfiguration GetReportById(string reportId)
        {
            if (this.ContainsKey(reportId))
            {
                return this[reportId];
            }
            else
            {
                return null;
            }
        }

        /// <summary>
        /// Returns a ReportsConfigurations loaded from xml via reportType
        /// </summary>
        /// <param name="reportType"></param>
        /// <returns></returns>
        public static ReportConfigurations LoadFromXml(ReportConfigurationType reportType)
        {
            ReportConfigurations rptr = new ReportConfigurations();
            LoadFromXml(rptr, reportType);
            return rptr;
        }

        /// <summary>
        /// Loads a report by id
        /// </summary>
        /// <param name="reportType"></param>
        /// <param name="reportId"></param>
        /// <returns>Returns the specified configuration or NULL if not found</returns>
        public static ReportConfiguration GetReportById(ReportConfigurationType reportType, string reportId)
        {
            ReportConfigurations rptr = new ReportConfigurations();
            string selectXPath = "reports/report[@id='" + PageUtil.EscapeSingleQuotes(reportId) + "']";
            LoadFromXml(rptr, reportType, selectXPath);
            return rptr.GetReportById(reportId);
        }

        //Exception handling should be implemented for a more robust solution
        //e.g. what happens if a node/attribute i missing etc

        /// <summary>
        /// Fills the currnet ReportsConfigurations with reports via reportType xml
        /// </summary>
        /// <param name="reportType"></param>
        public void LoadReportsFromXml(ReportConfigurationType reportType)
        {
            LoadFromXml(this, reportType);
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="categories"></param>
        public void SetCategoriesLookup(IEnumerable<ReportCategoryConfig> categories)
        {
            this.categories = categories.ToDictionary(c => c.Name, c => c);
        }

        private static void LoadFromXml(ReportConfigurations config, ReportConfigurationType reportType)
        {
            // load all reports
            string selectXPath = "reports/report";
            LoadFromXml(config, reportType, selectXPath);
        }

        /// <summary>
        /// Fills the ReportsConfiguratios with reports via reportType xml
        /// </summary>
        /// <param name="config"></param>
        /// <param name="reportType"></param>
        /// <param name="selectXPath"></param>
        private static void LoadFromXml(ReportConfigurations config, ReportConfigurationType reportType, string selectXPath)
        {
            // clear dictionary
            config.Clear();

            // report main xml doc
            XmlDocument xmlDoc;

            // get report file by type
            if (REPORTS_FILES.ContainsKey(reportType))
            {
                string xmlPath = config.GetXmlDataPath(reportType);
                xmlDoc = XmlUtil.GetXmlDoc(xmlPath);
            }
            else
            {
                throw new ArgumentException("The specified report type '" + reportType.ToString() + "' does not have a realted configuration file.");
            }             

            XmlNodeList reports = xmlDoc.SelectNodes(selectXPath);

            // set the node for handling categories
            XmlNodeList catLookupNodes = xmlDoc.SelectNodes("reports/categories/category");
            //config.SetCategoriesNode(catLookupNode);
            // process categories lookup for all reports

            // get a tree of categories and sub categories
            var categories = from catNode in catLookupNodes.Cast<XmlNode>()
                             let catName = GetAttributeValue(catNode, "name")
                             let catDesc = GetAttributeValue(catNode, "description")
                             let catIcon = GetAttributeValue(catNode, "icon")
                             let catDocFile = GetAttributeValue(catNode, "docFile")
                             where !string.IsNullOrEmpty(catName)
                             let subCategories = from subCatNode in catNode.SelectNodes("subcategory").Cast<XmlNode>()
                                                 let subCatName = GetAttributeValue(subCatNode, "name")
                                                 let subCatDesc = GetAttributeValue(subCatNode, "description")
                                                 let subCatIcon = GetAttributeValue(subCatNode, "icon")
                                                 let subCatDocFile = GetAttributeValue(catNode, "docFile")
                                                 where !string.IsNullOrEmpty(subCatName)
                                                 select new ReportCategoryConfig(subCatName, subCatDesc, subCatIcon, subCatDocFile)
                             select new ReportCategoryConfig(catName, catDesc, catIcon, catDocFile, subCategories);

            // set dictionary for quick lookup
            config.SetCategoriesLookup(categories);

            
            // =================================================================================================
            // store information from CannedReports.xml <reports><about> nodes.
            Dictionary<string, ReportAbout> reportAboutsByDisease = new Dictionary<string, ReportAbout>();

            //traverse <about>
            XmlNode aboutNode = xmlDoc.SelectSingleNode("reports/about");
            if (aboutNode != null)
            {
                //Get and Store Common Attribute of <about>, traverse and stored
                XmlNodeList aboutCommonItems = aboutNode.SelectNodes("common");
                List<aboutItem> common = new List<aboutItem>();
                foreach (XmlNode aboutCommonItem in aboutCommonItems)
                {
                    aboutItem genItem = new aboutItem();
                    genItem.section = aboutCommonItem.Attributes["section"].Value;
                    genItem.group = aboutCommonItem.Attributes["group"].Value;
                    genItem.id = aboutCommonItem.Attributes["id"].Value;
                    genItem.label = aboutCommonItem.SelectSingleNode("label").InnerText;
                    genItem.description = aboutCommonItem.SelectSingleNode("description").InnerText;
                    common.Add(genItem);

                }

                //Get all disease-agnostic items - items that don't depend on disease
                List<aboutItem> agnosticItems = new List<aboutItem>();
                XmlNodeList aboutDiseaseAgnosticNodes = aboutNode.SelectNodes("diseaseAgnostic/infoItem");
                foreach (XmlNode disAgnosticItem in aboutDiseaseAgnosticNodes)
                {

                    //assign values to genItem
                    aboutItem genItem = new aboutItem();
                    genItem.section = disAgnosticItem.Attributes["section"].Value;
                    genItem.group = disAgnosticItem.Attributes["group"].Value;
                    genItem.id = disAgnosticItem.Attributes["id"].Value;
                    genItem.label = disAgnosticItem.SelectSingleNode("label").InnerText;
                    genItem.description = disAgnosticItem.SelectSingleNode("description").InnerText;

                    agnosticItems.Add(genItem);
                }

                //Get all disease-specific items - items that do depend on disease
                Dictionary<string, List<aboutItem>> specificItems = new Dictionary<string, List<aboutItem>>();
                XmlNodeList aboutDiseaseSpecificNodes = aboutNode.SelectNodes("diseaseSpecific/disease/infoItem");
                foreach (XmlNode disSpecificItem in aboutDiseaseSpecificNodes)
                {
                    //get the disease
                    string diseaseName = disSpecificItem.ParentNode.Attributes["name"].Value;

                    //assign values to genItem
                    aboutItem genItem = new aboutItem();
                    genItem.section = disSpecificItem.Attributes["section"].Value;
                    genItem.group = disSpecificItem.Attributes["group"].Value;
                    genItem.id = disSpecificItem.Attributes["id"].Value;
                    genItem.label = disSpecificItem.SelectSingleNode("label").InnerText;
                    genItem.description = disSpecificItem.SelectSingleNode("description").InnerText;


                    //Create or add item to dictionary
                    List<aboutItem> myList = new List<aboutItem>();
                    bool isinlist = specificItems.TryGetValue(diseaseName, out myList);
                    if (isinlist)
                    {
                        myList.Add(genItem);
                        specificItems[diseaseName] = myList;
                    }
                    else
                    {
                        List<aboutItem> newList = new List<aboutItem>();
                        newList.Add(genItem);
                        specificItems[diseaseName] = newList;
                    }
                }

                //create a reportAbout class instance for each disease
                foreach (KeyValuePair<string, List<aboutItem>> kvp in specificItems)
                {
                    // concatonate all aboutItems: commonItems, diseaseAgnosticItems, diseaseSpecificItems
                    List<aboutItem> allAboutItems = common.Concat(agnosticItems).ToList<aboutItem>();
                    allAboutItems = allAboutItems.Concat(kvp.Value).ToList<aboutItem>();

                    // call constructor for reportAbout(List<aboutItems>)
                    ReportAbout aReportAbout = new ReportAbout(allAboutItems);

                    //store the about-report instance in a dictionary keyed by disease
                    reportAboutsByDisease[kvp.Key.ToString()] = aReportAbout;

                }
            }



            ReportConfiguration rprt;
            ReportHyperLinkColumn hcol;

            foreach (XmlNode report in reports)
            {
                // init locals
                string reportId = "";
                string reportTitle = "";
                string reportDescription = "";
                string query = "";

                string columnsShowAsNormal = "";
                string columnsSearchable = "";
                string columnsSearchableAlternatives = "";
                char separator = ';';
                bool isStoredProc = true;
                bool useWarehouse = false;

                reportId = report.Attributes.GetNamedItem("id").InnerText;
                reportTitle = report.SelectSingleNode("reportTitle").InnerText;
                reportDescription = report.SelectSingleNode("reportDescription").InnerText;

                if (report.SelectSingleNode("storedProcedure") != null)
                {
                    query = report.SelectSingleNode("storedProcedure").InnerText;
                    isStoredProc = true;
                }
                else if (report.SelectSingleNode("sqlStatement") != null)
                {
                    query = report.SelectSingleNode("sqlStatement").InnerText;
                    isStoredProc = false;
                }

                // Determine if we need to use a warehouse connection
                if (report.SelectSingleNode("useWarehouse") != null)
                {
                    string useWarehouseString = report.SelectSingleNode("useWarehouse").InnerText;
                    if (!string.IsNullOrEmpty(useWarehouseString))
                    {
                        useWarehouse = bool.Parse(useWarehouseString);
                    }
                }

                rprt = new ReportConfiguration(reportId, reportTitle, reportDescription, query, isStoredProc, useWarehouse);

                rprt.UseTimePeriod = nodeTrueOrFalse(report, "useTimePeriod", false);
                rprt.UseGenericReportFormat = nodeTrueOrFalse(report, "useGenericReportFormat", true);
                rprt.UseExport = nodeTrueOrFalse(report, "useExport", false);
                rprt.UsePageSize = nodeTrueOrFalse(report, "usePageSize", true);

                // set SQL file (optional)
                if (report.SelectSingleNode("sqlFile") != null)
                {
                    string sqlFile = report.SelectSingleNode("sqlFile").InnerText;
                    if (!string.IsNullOrEmpty(sqlFile))
                    {
                        rprt.SQLFile = sqlFile;
                    }
                }

                // set static form if applicable
                if (report.SelectSingleNode("form") != null)
                {
                    XmlNode formNode = report.SelectSingleNode("form");
                    if (!string.IsNullOrEmpty(formNode.InnerText))
                    {
                        rprt.Form = formNode.InnerText;
                    }
                }

                // set module if applicable
                if (report.SelectSingleNode("module") != null)
                {
                    XmlNode moduleNode = report.SelectSingleNode("module");
                    if (!string.IsNullOrEmpty(moduleNode.InnerText))
                    {
                        rprt.Module = moduleNode.InnerText;
                    }
                }

                XmlNodeList columns;

                columnsShowAsNormal = "";
                columns = report.SelectNodes("columnConfiguration/showAsNormalColumns/column");

                if (columns.Count > 0)
                {
                    foreach (XmlNode column in columns)
                    {
                        columnsShowAsNormal += column.InnerText + separator.ToString();
                    }
                    if (columnsShowAsNormal.EndsWith(";"))
                    {
                        columnsShowAsNormal = columnsShowAsNormal.TrimEnd(';');
                    }
                    rprt.AddColumns(ReportConfiguration.ColumnMode.ShowAsNormal, columnsShowAsNormal, separator);
                }

                columns = report.SelectNodes("columnConfiguration/hyperLinkColumns/column");
                foreach (XmlNode column in columns)
                {
                    hcol = new ReportHyperLinkColumn();

                    hcol.DataTextField = column.SelectSingleNode("dataTextField").InnerText;
                    hcol.DataTextFormatString = column.SelectSingleNode("dataTextFormatString").InnerText;
                    hcol.DataNavigateUrlField = column.SelectSingleNode("dataNavigateUrlField").InnerText;
                    hcol.HeaderText = column.SelectSingleNode("headerText").InnerText;
                    hcol.GoToReport = column.SelectSingleNode("goToReport").InnerText;
                    hcol.Param = column.SelectSingleNode("param").InnerText;
                    rprt.AddHyperLinkColumn(hcol);
                }

                columns = report.SelectNodes("columnConfiguration/searchableColumns/column");
                columnsSearchable = "";
                if (columns.Count > 0)
                {
                    foreach (XmlNode column in columns)
                    {
                        columnsSearchable += column.SelectSingleNode("columnName").InnerText + separator.ToString();
                    }
                    if (columnsSearchable.EndsWith(";"))
                    {
                        columnsSearchable = columnsSearchable.TrimEnd(';');
                    }
                    rprt.AddColumn(ReportConfiguration.ColumnMode.Searchable, columnsSearchable);
                    //same iteration again, column must be added before alternatives for dropdown box
                    columnsSearchableAlternatives = "";
                    foreach (XmlNode column in columns)
                    {
                        XmlNodeList alternatives = column.SelectNodes("alternatives/alternative");

                        if (alternatives.Count > 0)
                        {
                            foreach (XmlNode alternative in alternatives)
                            {
                                columnsSearchableAlternatives += alternative.InnerText + separator.ToString();
                            }

                            if (columnsSearchableAlternatives.EndsWith(";"))
                            {
                                columnsSearchableAlternatives = columnsSearchableAlternatives.TrimEnd(';');
                            }

                            rprt.AddMatchAlternativesToChoseFromForSearchableColumn(column.SelectSingleNode("columnName").InnerText, columnsSearchableAlternatives);
                        }
                    }
                }

                // show param panel
                bool showParamsPanel = true;
                string showPanelValue = GetChildNodeValue(report, "showParamsPanel");
                if (!string.IsNullOrEmpty(showPanelValue))
                {
                    showParamsPanel = bool.Parse(showPanelValue);
                }
                rprt.ShowParamsPanel = showParamsPanel;

                bool showExtendedColumns = false;
                string showExtendedValue = GetChildNodeValue(report, "showExtendedColumns");
                if (!string.IsNullOrEmpty(showExtendedValue))
                {
                    showExtendedColumns = bool.Parse(showExtendedValue);
                }
                rprt.ShowExtendedColumns = showExtendedColumns;

                // run by default
                string runByDefaultValue = GetChildNodeValue(report, "runByDefault");
                // overwrite default if applicable
                if (!string.IsNullOrEmpty(runByDefaultValue))
                {
                    rprt.RunByDefault = bool.Parse(runByDefaultValue);
                }

                // categories
                XmlNodeList categoryNodes = report.SelectNodes("category");
                for (int i = 0; i < categoryNodes.Count; i++)
                {
                    XmlNode categoryNode = categoryNodes[i];
                    XmlAttribute categoryAttribute = categoryNode.Attributes["name"];
                    if (categoryAttribute != null)
                    {
                        string category = categoryAttribute.Value;
                        rprt.AddCategory(category);
                        // add sub categories if applicable
                        XmlAttribute subCategoryAttribute = categoryNode.Attributes["subCategory"];
                        if (subCategoryAttribute != null)
                        {
                            string subCategory = subCategoryAttribute.Value;
                            rprt.AddSubCategory(category, subCategory);
                        }
                    }
                }

                // diseases
                rprt.ReportDiseases = from node in report.SelectNodes("diseases/disease").Cast<XmlNode>()
                                      select node.InnerText;

                // datasets: get a list of white listed DataSets
                /*
                XmlNodeList datasetNodes = report.SelectNodes("dataSets/dataSet");
                IEnumerable<string> dataSets = from dataSetNode in datasetNodes.Cast<XmlNode>()
                                               select dataSetNode.InnerText;
               
                  rprt.DataSets = dataSets;
                */

                // add headings
                XmlNodeList headingTitle = report.SelectNodes("headings/title");
                foreach (XmlNode title in headingTitle)
                {
                    rprt.AddHeading(title.InnerText);
                }

                // icon param
                string iconName = GetChildNodeValue(report, "icon");
                if (!string.IsNullOrEmpty(iconName))
                {
                    rprt.Icon = iconName;
                }

                // report doc
                string docFile = GetChildNodeValue(report, "docFile");
                if (!string.IsNullOrEmpty(docFile))
                {
                    rprt.DocFile = docFile;
                }

                //attach the correct about-report instance to this report
                string theDisease = rprt.ReportDiseases.FirstOrDefault<string>();
                if (!string.IsNullOrEmpty(theDisease))
                {
                    if (reportAboutsByDisease.ContainsKey(theDisease))
                    {
                        rprt.About = reportAboutsByDisease[theDisease];
                    }
                    
                }


                // add optional fields to caputure user input
                XmlNodeList inputParams = report.SelectNodes("inputParams/param");
                if (inputParams.Count > 0)
                {
                    foreach (XmlNode inputParam in inputParams)
                    {
                        // the param which in the report
                        string paramName = GetChildNodeValue(inputParam, "name");
                        // the optional friendly title of the parameter field
                        string paramTitle = GetChildNodeValue(inputParam, "title");
                        // the caisis input control type
                        string paramControlType = GetChildNodeValue(inputParam, "control");
                        // default param value
                        string paramDefaultValue = GetChildNodeValue(inputParam, "defaultValue");
                        // if param is required
                        string paramRequiredNode = GetChildNodeValue(inputParam, "required");
                        if (!string.IsNullOrEmpty(paramName))
                        {
                            string name = paramName;
                            string title = !string.IsNullOrEmpty(paramTitle) ? paramTitle : name;
                            string defaultValue = !string.IsNullOrEmpty(paramDefaultValue) ? paramDefaultValue : string.Empty;
                            bool required = !string.IsNullOrEmpty(paramRequiredNode) ? bool.Parse(paramRequiredNode) : false;
                            ReportConfigurationField paramField;
                            if (paramControlType != null)
                            {
                                // for caisisinput controls, dynamically set public properties, i.e.,ShowCalendar = true
                                XmlNodeList typeStaticAttributes = inputParam.SelectNodes("controlAttributes/*");
                                Dictionary<string, string> staticAttributes = new Dictionary<string, string>();
                                foreach (XmlNode typeStaticAttribute in typeStaticAttributes)
                                {
                                    string attName = typeStaticAttribute.Name;
                                    string attValue = typeStaticAttribute.InnerText;
                                    staticAttributes.Add(attName, attValue);
                                }
                                // build manualy list of data items
                                XmlNodeList dataItemNodes = inputParam.SelectNodes("items/item");
                                Dictionary<string, string> dataItems = new Dictionary<string, string>();
                                foreach (XmlNode dataItemNode in dataItemNodes)
                                {
                                    string key = dataItemNode.Attributes["text"] != null ? dataItemNode.Attributes["text"].Value : null;
                                    string value = dataItemNode.Attributes["value"] != null ? dataItemNode.Attributes["value"].Value : key;
                                    if (!string.IsNullOrEmpty(key))
                                    {
                                        dataItems.Add(key, value);
                                    }
                                }

                                paramField = new ReportConfigurationField(name, title, required, paramControlType, paramDefaultValue, staticAttributes, dataItems);
                            }
                            else
                            {
                                paramField = new ReportConfigurationField(name, title, required, defaultValue);
                            }
                            rprt.AddReportField(paramField);
                        }
                    }
                }

                // charting options
                XmlNode chartingNode = report.SelectSingleNode("chart");
                if (chartingNode != null)
                {
                    string xAxis = GetChildNodeValue(chartingNode, "xAxis");
                    string yAxis = GetChildNodeValue(chartingNode, "yAxis");
                    ReportChartingConfig chartConfig = new ReportChartingConfig(xAxis, yAxis);
                    // optional
                    string chartType = GetChildNodeValue(chartingNode, "type");
                    string chartColor = GetChildNodeValue(chartingNode, "color");
                    string showChartingTypes = GetChildNodeValue(chartingNode, "showChartingTypes");
                    string showByDefault = GetChildNodeValue(chartingNode, "showByDefault");
                    if (!string.IsNullOrEmpty(chartType))
                    {
                        chartConfig.ChartType = (SeriesChartType)Enum.Parse(typeof(SeriesChartType), chartType, true);
                    }
                    if (!string.IsNullOrEmpty(chartColor))
                    {
                        string color = chartColor;
                        if (color.StartsWith("#"))
                        {
                            chartConfig.ChartColor = System.Drawing.ColorTranslator.FromHtml(color);
                        }
                        else
                        {
                            chartConfig.ChartColor = System.Drawing.Color.FromName(color);
                        }
                    }
                    if (!string.IsNullOrEmpty(showChartingTypes))
                    {
                        chartConfig.ShowChartingTypes = bool.Parse(showChartingTypes);
                    }
                    if (!string.IsNullOrEmpty(showByDefault))
                    {
                        chartConfig.ShowByDefault = bool.Parse(showByDefault);
                    }

                    // handle notes
                    string notesTitle = GetChildNodeValue(chartingNode, "//notes/title");
                    chartConfig.NotesTitle = notesTitle;

                    XmlNodeList notesNodes = chartingNode.SelectNodes("//notes/note");
                    var notes = from node in notesNodes.Cast<XmlNode>()
                                select node.InnerText;
                    chartConfig.Notes.AddRange(notes);

                    // set config
                    rprt.ChartConfig = chartConfig;
                }

                // add entry
                config.Add(rprt.ID, rprt);
            }
        }

        /// <summary>
        /// Returns the value of the child node (null if child node found)
        /// </summary>
        /// <param name="parentNode"></param>
        /// <param name="singleNodeExpression"></param>
        /// <returns></returns>
        private static string GetChildNodeValue(XmlNode parentNode, string singleNodeExpression)
        {
            XmlNode childNode = parentNode.SelectSingleNode(singleNodeExpression);
            return childNode != null ? childNode.InnerText.Trim() : null;
        }

        /// <summary>
        /// Returns the node's attribute value or null for no attribute found
        /// </summary>
        /// <param name="node"></param>
        /// <param name="attribute"></param>
        /// <returns></returns>
        private static string GetAttributeValue(XmlNode node, string attribute)
        {
            string attributeValue = node.Attributes[attribute] != null ? node.Attributes[attribute].Value : null;
            return attributeValue;
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="parentNode"></param>
        /// <param name="nodepath"></param>
        ///<param name="defaultValue">Default bool value if no parseable value found</param>
        /// <returns></returns>
        private static bool nodeTrueOrFalse(XmlNode parentNode, string nodepath, bool defaultValue)
        {
            if (!(parentNode.SelectSingleNode(nodepath) == null))
            {
                string innertext = parentNode.SelectSingleNode(nodepath).InnerText;
                if (!string.IsNullOrEmpty(innertext))
                {
                    string boolValue = innertext.Trim();
                    if (boolValue.Equals(bool.FalseString, StringComparison.OrdinalIgnoreCase))
                    {
                        return false;
                    }
                    else if (boolValue.Equals(bool.TrueString, StringComparison.OrdinalIgnoreCase))
                    {
                        return true;
                    }
                }
            }
            return defaultValue;
        }

    }

    public class ReportConfiguration
    {
        /// <summary>
        /// The relative path to the default report icon
        /// </summary>
        public static readonly string DEFAULT_REPORT_ICON = "~/Images/ReportIcon_MainReport.png";

        private string reportId = "";
        private string reportTitle = "";
        private string reportDescription = "";
        private string reportIcon = "";
        private string storedProcedure;
        private string sqlFile = "";
        private string sqlFileContent = "";
        private string queryString;

        private string form = "";
        private string module = "Reports";
        private string docFile = "";

        private bool useGenericReportFormat = true;
        private bool useTimePeriod = true;
        private bool usePageSize = true;
        private bool useExport = true;
        private bool useWarehouse = false;
        private bool runByDefault = false;
        private bool showParamsPanel = true;
        private bool showExtendedColumns = false;

        private List<string> columnsToShow = new List<string>();
        private List<string> columnsToHide = new List<string>();
        private List<string> columnsSearchable = new List<string>();
        private List<string> tableHeadings = new List<string>();
        private Dictionary<string, ReportHyperLinkColumn> columnsToHyperlink = new Dictionary<string, ReportHyperLinkColumn>();

        private Dictionary<string, string[]> searchMatchAlternativesToChoseFrom = new Dictionary<string, string[]>();

        private Dictionary<string, List<string>> _categories = new Dictionary<string, List<string>>();
        private List<ReportConfigurationField> _reportFields = new List<ReportConfigurationField>();

        private IEnumerable<string> _diseases = new string[0];

        private ReportChartingConfig chartConfig;

        private ReportAbout _About;

        public enum ColumnMode
        {
            ShowAsNormal = 1,
            ShowAsHyperLink = 2,
            Hide = 4,
            Searchable = 8,
            Uknown = 16
        }

        #region constructors
        public ReportConfiguration(string id)
        {
            reportId = id;
        }

        public ReportConfiguration(string id, string title, string description, string sql, bool isStoredProc, bool useWarehouseConnection)
            : this(id)
        {
            this.Title = title;
            this.Description = description;
            this.StoredProcedure = sql;
            this.UseWarehouse = useWarehouseConnection;
            /*if (isStoredProc)
            {
                this.StoredProcedure = sql;
                this.QueryString = "";
            }
            else
            {
                this.StoredProcedure = "";
                this.QueryString = sql;
            }*/
        }
        #endregion

        #region columnSettings
        public ColumnMode ColumnDisplay(string columnName)
        {
            ColumnMode rtrn = ColumnMode.Uknown;
            if (columnsToHide != null)
            {
                if (columnsToHide.Contains(columnName))
                {
                    rtrn = ColumnMode.Hide;
                }
            }
            if (columnsToHyperlink != null)
            {
                if (columnsToHyperlink.ContainsKey(columnName))
                    //                        if(Array.IndexOf(columnsToHyperlink,columnName) <= 0)
                    //                        {
                    rtrn = ColumnMode.ShowAsHyperLink;
                //                        }
            }
            if (columnsToShow != null)
            {
                if (rtrn == ColumnMode.Uknown)
                {
                    rtrn = ColumnMode.Hide;
                }
                if (columnsToShow.Contains(columnName))
                {
                    rtrn = ColumnMode.ShowAsNormal;
                }
            }
            if (rtrn == ColumnMode.Uknown)
            {
                rtrn = ColumnMode.ShowAsNormal;
            }
            return rtrn;
        }

        public void AddColumn(ColumnMode columnMode, string columnName)
        {
            if (columnMode == ColumnMode.ShowAsHyperLink)
            {
                throw new ArgumentException("Hyperlink columns cannot be added without object. Use AddHyperLinkColumn.");
            }
            else
            {
                switch (columnMode)
                {
                    case ColumnMode.ShowAsNormal:
                        columnsToShow.Add(columnName);
                        break;
                    //                        case ColumnMode.ShowAsHyperLink:
                    //                            columns = columnsToHyperlink;
                    //                            break;
                    case ColumnMode.Hide:
                        columnsToHide.Add(columnName);
                        break;
                    case ColumnMode.Searchable:
                        columnsSearchable.Add(columnName);
                        break;
                }
            }
        }

        public void AddColumns(ColumnMode columnMode, string columnNames, char separator)
        {
            if (columnMode == ColumnMode.ShowAsHyperLink)
            {
                throw new ArgumentException("Hyperlink columns cannot be added without object");
            }
            string[] colNames = columnNames.Split(separator);
            for (int i = 0; i < colNames.Length; i++)
            {
                string colName = colNames[i];
                AddColumn(columnMode, colName);
            }
        }

        public void AddHyperLinkColumn(ReportHyperLinkColumn hcol)
        {
            columnsToHyperlink.Add(hcol.DataTextField, hcol);
        }
        public ReportHyperLinkColumn GetHyperLinkColumn(string columnName)
        {
            return columnsToHyperlink[columnName];
        }
        public string[] GetSearchableColumns()
        {
            return columnsSearchable.ToArray();
        }
        public void AddMatchAlternativesToChoseFromForSearchableColumn(string columnName, string[] matches)
        {
            if (searchMatchAlternativesToChoseFrom.ContainsKey(columnName))
            {
                searchMatchAlternativesToChoseFrom[columnName] = matches;
            }
            else
            {
                searchMatchAlternativesToChoseFrom.Add(columnName, matches);
            }
        }
        public void AddMatchAlternativesToChoseFromForSearchableColumn(string columnName, string matches)
        {
            if (!matches.StartsWith("spRpt"))
            {
                string[] tempMatches;
                tempMatches = matches.Split(';');
                AddMatchAlternativesToChoseFromForSearchableColumn(columnName, tempMatches);
            }
            else
            {
                AdminReportsDa da = new AdminReportsDa();
                DataSet ds = new DataSet();
                string datasetSql = CacheManager.GetDatasetSQL(System.Web.HttpContext.Current.Session[SessionKey.DatasetId]);
                ds = da.GetAdminReport(datasetSql, matches, "", "", useWarehouse);
                string sep = "";
                if (ds.Tables[0].Rows.Count > 0)
                {
                    string tempMatches = "";
                    for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
                    {
                        tempMatches = tempMatches + sep + ds.Tables[0].Rows[i][0];
                        sep = ";";
                    }
                    this.AddMatchAlternativesToChoseFromForSearchableColumn(columnName, tempMatches);
                }
            }
        }
        public string[] MatchesToSearchFor(string columnName)
        {
            if (searchMatchAlternativesToChoseFrom.ContainsKey(columnName))
            {
                return searchMatchAlternativesToChoseFrom[columnName];
            }
            else
            {
                return null;
            }
        }
        #endregion

        /// <summary>
        /// Adds a category to the report
        /// </summary>
        /// <param name="category"></param>
        public void AddCategory(string category)
        {
            // if no entry in category lookup, add entry with empty sub category list
            if (!_categories.ContainsKey(category))
            {
                List<string> subCategories = new List<string>();
                _categories.Add(category, subCategories);
            }
        }

        /// <summary>
        /// Adds a sub category to the specified category
        /// </summary>
        /// <param name="category"></param>
        /// <param name="subCategory"></param>
        public void AddSubCategory(string category, string subCategory)
        {
            // add category
            AddCategory(category);
            List<string> subCategories = _categories[category];
            // if sub cat doesn't exists, add to sub category list
            if (!subCategories.Contains(subCategory))
            {
                subCategories.Add(subCategory);
            }
        }

        /// <summary>
        /// Adds a heading
        /// </summary>
        /// <param name="title"></param>
        public void AddHeading(string title)
        {
            tableHeadings.Add(title);
        }

        #region adding report field params

        /// <summary>
        /// Adds a field for capturing User input
        /// </summary>
        /// <param name="reportField"></param>
        public void AddReportField(ReportConfigurationField reportField)
        {
            _reportFields.Add(reportField);
        }

        #endregion

        #region properties

        /// <summary>
        /// Gets the report Id
        /// </summary>
        public string ID
        {
            get
            {
                return reportId;
            }

        }

        /// <summary>
        /// Gets or sets the report Title
        /// </summary>
        public string Title
        {
            get
            {
                return reportTitle;
            }
            set
            {
                reportTitle = value;
            }
        }

        /// <summary>
        /// Gets or sets the description of the report
        /// </summary>
        public string Description
        {
            get
            {
                return reportDescription;
            }
            set
            {
                reportDescription = value;
            }
        }

        /// <summary>
        /// Gets or sets the icon for the report, i.e., "ReportIcon_CustomReport.png" store in the ~/Images folder.
        /// </summary>
        public string Icon
        {
            get
            {
                return reportIcon;
            }
            set
            {
                reportIcon = value;
            }
        }

        /// <summary>
        /// Gets or sets the relative path to the report's document file.
        /// </summary>
        public string DocFile
        {
            get
            {
                return docFile;
            }
            set
            {
                docFile = value;
            }
        }

        /// <summary>
        /// Gets or sets if the current configuration can run with default paramaters.
        /// </summary>
        public bool RunByDefault
        {
            get
            {
                return runByDefault;
            }
            set
            {
                runByDefault = value;
            }
        }

        /// <summary>
        /// Gets or sets if the params panel is shown by default
        /// </summary>
        public bool ShowParamsPanel
        {
            get
            {
                return showParamsPanel;
            }
            set
            {
                showParamsPanel = value;
            }
        }

        /// <summary>
        /// Gets or sets if params panel shows All & Subset Options
        /// </summary>
        public bool ShowExtendedColumns
        {
            get
            {
                return showExtendedColumns;
            }
            set
            {
                showExtendedColumns = value;
            }
        }

        /// <summary>
        /// Returns a list of diseases applying to the report
        /// </summary>
        public IEnumerable<string> ReportDiseases
        {
            get
            {
                return _diseases;
            }
            set
            {
                _diseases = value;
            }
        }

        /// <summary>
        /// Returns the relative path to the report's icon.
        /// Ex: Icon="" (no icon specified) -> "~/Images/ReportIcon_MainReport.png"
        /// Ex: Icon="MyReport" (no charting by default) -> "~/Images/MyReport.png"
        /// Ex: Icon="MyReport", ChartType="Line" (default charting) -> "~/Images/ReportIcon_LineChart.png"
        /// </summary>
        /// <param name="page">The optional page object, which is used to validate that the image exists before returning.</param>
        /// <returns>The relative path to the icon, i.e., "~/Images/MyReport.png", otherwise empty string</returns>
        public string GetReportIcon(System.Web.UI.Page page)
        {
            // default icon name
            string reportIconName = Icon;
            // if no user defined icon, determine optional charting icon
            if (string.IsNullOrEmpty(reportIconName))
            {
                // if using charting configuration and is default
                if (this.ChartConfig != null && this.ChartConfig.ShowByDefault)
                {
                    // chart type = "Line"
                    string chartType = this.ChartConfig.ChartType.ToString();
                    // "Line_Chart.png"
                    reportIconName = string.Format("ReportIcon_{0}Chart.png", chartType);
                }
            }
            // return relative path
            if (!string.IsNullOrEmpty(reportIconName))
            {
                string fullIconPath = GetReportIconPath(reportIconName);
                // validate ??
                if (ValidateIconPath(page,fullIconPath))
                {
                    return fullIconPath;
                }
                return DEFAULT_REPORT_ICON;
            }
            // otherwise empty icon
            else
            {
                return DEFAULT_REPORT_ICON;
            }
        }

        /// <summary>
        /// Returns the relative path to the icon stored in the ~/Images folder.
        /// </summary>
        /// <param name="reportIconName">The name of the image, i.e., ReportIcon.png</param>
        /// <returns>The relative path to the icon, i.e., ~/Images/ReportIcon.png</returns>
        public static string GetReportIconPath(string reportIconName)
        {
            string fullIconPath = string.Format("~/Images/{0}", reportIconName);
            return fullIconPath;
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="page"></param>
        /// <param name="fullIconPath"></param>
        /// <returns></returns>
        public static bool ValidateIconPath(System.Web.UI.Page page, string fullIconPath)
        {
            // validate ??
            if (page != null)
            {
                if (System.IO.File.Exists(page.Server.MapPath(fullIconPath.Replace("/","//"))))
                {
                    return true;
                }
            }
            return false;
        }

        public string QueryString
        {
            get
            {
                return queryString;
            }
            set
            {
                //for security, only SPs written for this 
                //report tool can be executed
                if (value.ToLower().Contains("delete") || value.ToLower().Contains("insert") || value.ToLower().Contains("update") || value.ToLower().Contains("create"))
                {
                    throw new Exception("SQL string contains illegal terms. Only select statements are permitted");
                }
                else
                {
                    queryString = value;
                }
            }
        }

        // now contains either stored procedure name or entire sql string
        public string StoredProcedure
        {
            get
            {
                if (string.IsNullOrEmpty(storedProcedure) && !string.IsNullOrEmpty(SQLFile))
                {
                    // read only once
                    if (string.IsNullOrEmpty(sqlFileContent))
                    {
                        sqlFileContent = GetSQLFromFile();
                    }
                    return sqlFileContent;
                }
                return storedProcedure;
            }
            set
            {
                // consider adding validation of string integrity
                //if (value.ToLower().Contains("delete") || value.ToLower().Contains("drop"))  
                //{
                //    throw new Exception("Stored procedure name must start with 'spRpt'.");
                //}
                //else
                //{
                storedProcedure = value;
                //}
            }
        }

        /// <summary>
        /// Gets or sets the relative path to the SQl file for this report.
        /// </summary>
        public string SQLFile
        {
            get
            {
                return sqlFile;
            }
            set
            {
                sqlFile = value;
            }
        }

        public bool UseGenericReportFormat
        {
            get
            {
                return useGenericReportFormat;
            }
            set
            {
                useGenericReportFormat = value;
            }
        }

        public bool UseTimePeriod
        {
            get
            {
                return useTimePeriod;
            }
            set
            {
                useTimePeriod = value;
            }
        }

        public bool UsePageSize
        {
            get
            {
                return usePageSize;
            }
            set
            {
                usePageSize = value;
            }
        }

        public bool UseExport
        {
            get
            {
                return useExport;
            }
            set
            {
                useExport = value;
            }
        }

        public bool UseFilter
        {
            get
            {
                return columnsSearchable.Count() > 0;
            }
        }

        /// <summary>
        /// Gets or sets whether or not to use the warehouse connection to run query
        /// </summary>
        public bool UseWarehouse
        {
            get
            {
                return useWarehouse;
            }
            set
            {
                useWarehouse = value;
            }
        }

        public bool HasHiddenColumns
        {
            get
            {
                return columnsToHide.Count() > 0 || columnsToShow.Count() > 0;
            }
        }

        /// <summary>
        /// Gets or sets the path to static Form
        /// </summary>
        public string Form
        {
            get
            {
                return form;
            }
            set
            {
                form = value;
            }
        }

        /// <summary>
        /// 
        /// </summary>
        public bool IsStatic
        {
            get
            {
                return !string.IsNullOrEmpty(form);
            }
        }

        public string Module
        {
            get
            {
                return module;
            }
            set
            {
                module = value;
            }
        }

        /// <summary>
        /// Returns a Dictiory of categories => list of sub categories
        /// </summary>
        public IDictionary<string, List<string>> Categories
        {
            get
            {
                return _categories;
            }
        }

        /// <summary>
        /// Returns a list of all categories
        /// </summary>
        public IEnumerable<string> CategoriesList
        {
            get
            {
                return _categories.Select(p => p.Key);
            }
        }

        /// <summary>
        /// Gets a list of report configuration fields for capturing user entered paramaters
        /// </summary>
        public IEnumerable<ReportConfigurationField> ReportFields
        {
            get
            {
                return _reportFields;
            }
        }

        /// <summary>
        /// Gets a list of headings for the report output DataSet
        /// </summary>
        public string[] ReportHeadings
        {
            get
            {
                return tableHeadings.ToArray();
            }
        }

        /// <summary>
        /// Gets of sets the charting configuration
        /// </summary>
        public ReportChartingConfig ChartConfig
        {
            get
            {
                return chartConfig;
            }
            set
            {
                chartConfig = value;
            }
        }

        /// <summary>
        /// Gets and Sets Property for any Report About Information
        /// 
        /// </summary>
        public ReportAbout About
        {
            get
            {
                return _About;
            }
            set
            {
                _About = value;
            }
        }

        #endregion

        #region SQL file handling

        /// Returns the SQL from the file set by SQLFile.
        /// </summary>
        /// <returns>The SQL read from file.</returns>
        public string GetSQLFromFile()
        {
            string fileSQL = ReportController.LoadSQLFromFile(this.SQLFile);
            return fileSQL;
        }

        #endregion
    }

    /// <summary>
    /// Represents a search paramater field for a report
    /// </summary>
    public class ReportConfigurationField
    {
        /// <summary>
        /// The default ICaisisInputControl type representing a report field
        /// </summary>
        private static readonly string DEFAULT_CONTROL_TYPE = typeof(CaisisTextBox).Name;

        private string fieldName;
        private string title;
        private string controlType;
        private string defaultValue;
        private bool required;
        private IDictionary<string, string> controlAttributeValues;
        private IDictionary<string, string> dataItems;

        /// <summary>
        /// Gets or sets the Field used in report
        /// </summary>
        public string FieldName
        {
            get
            {
                return fieldName;
            }
            set
            {
                fieldName = value;
            }
        }

        /// <summary>
        /// Gets or sets the friendly title for the field
        /// </summary>
        public string Title
        {
            get
            {
                return title;
            }
            set
            {
                title = value;
            }
        }

        /// <summary>
        /// Gets or sets the ICaisisInputControl type which represents the Field
        /// </summary>
        public string ControlType
        {
            get
            {
                return controlType;
            }
            set
            {
                controlType = value;
            }
        }

        /// <summary>
        /// 
        /// </summary>
        public string DefaultValue
        {
            get
            {
                return defaultValue;
            }
            set
            {
                defaultValue = value;
            }
        }

        /// <summary>
        /// Gets or sets if the parameter is required
        /// </summary>
        public bool Required
        {
            get
            {
                return required;
            }
            set
            {
                required = value;
            }
        }

        /// <summary>
        /// 
        /// </summary>
        public IDictionary<string, string> ControlAttributeValues
        {
            get
            {
                return controlAttributeValues;
            }
        }

        /// <summary>
        /// 
        /// </summary>
        public IDictionary<string, string> DataItems
        {
            get
            {
                return dataItems;
            }
        }

        #region constructors (overloaded)

        public ReportConfigurationField(string fieldName)
            : this(fieldName, fieldName, false)
        {

        }

        public ReportConfigurationField(string fieldName, string title, bool required)
            : this(fieldName, title, required, string.Empty)
        {
        }

        public ReportConfigurationField(string fieldName, string title, bool required, string defaultValue)
            : this(fieldName, title, required, DEFAULT_CONTROL_TYPE, defaultValue)
        {
        }

        public ReportConfigurationField(string fieldName, string title, bool required, string controlType, string defaultValue)
            : this(fieldName, title, required, controlType, defaultValue, new Dictionary<string, string>(), new Dictionary<string, string>())
        {
        }

        public ReportConfigurationField(string fieldName, string title, bool required, string controlType, string defaultValue, IDictionary<string, string> controlAttributeValues, IDictionary<string, string> dataItems)
        {
            this.fieldName = fieldName;
            this.title = title;
            this.controlType = controlType;
            this.defaultValue = defaultValue;
            this.required = required;
            this.controlAttributeValues = controlAttributeValues;
            this.dataItems = dataItems;
        }

        #endregion

        /// <summary>
        /// Returns an instance of an ICaisisInputControl representing a report search field
        /// </summary>
        /// <returns></returns>
        public ICaisisInputControl GetControl()
        {
            // create instance of control
            ICaisisInputControl icic = CICHelper.InvokeInputControl(controlType);
            if (icic == null)
            {
                icic = CICHelper.InvokeInputControl(DEFAULT_CONTROL_TYPE);
            }
            // set field name
            icic.Table = "NO_TABLE";
            icic.Field = fieldName;
            icic.ShowLabel = false;
            // set static attribute values
            if (controlAttributeValues != null && controlAttributeValues.Count > 0)
            {
                CICHelper.SetCICAttributes(icic, controlAttributeValues);
            }
            return icic;
        }
    }

    /// <summary>
    /// Represents a charting related configuration
    /// </summary>
    public class ReportChartingConfig
    {
        private string _xAxis;
        private string _yAxis;
        private SeriesChartType chartType;
        private System.Drawing.Color chartColor;
        private bool showChartingTypes;
        private bool showByDefault;

        private string notesTitle;
        private List<string> notes = new List<string>();

        /// <summary>
        /// Gets or sets the field representing the X-Axis field of the chart
        /// </summary>
        public string XAxis
        {
            get
            {
                return _xAxis;
            }
            set
            {
                _xAxis = value;
            }
        }

        /// <summary>
        /// Gets or sets the field representing the Y-Axis field of the chart
        /// </summary>
        public string YAxis
        {
            get
            {
                return _yAxis;
            }
            set
            {
                _yAxis = value;
            }
        }

        /// <summary>
        /// Gets or sets the default charting type
        /// </summary>
        public SeriesChartType ChartType
        {
            get
            {
                return chartType;
            }
            set
            {
                chartType = value;
            }
        }

        /// <summary>
        /// 
        /// </summary>
        public System.Drawing.Color ChartColor
        {
            get
            {
                return chartColor;
            }
            set
            {
                chartColor = value;
            }
        }

        /// <summary>
        /// Gets or sets whether charing type dropdown is shown
        /// </summary>
        public bool ShowChartingTypes
        {
            get
            {
                return showChartingTypes;
            }
            set
            {
                showChartingTypes = value;
            }
        }

        /// <summary>
        /// Gets or sets whether the chart is shown by default
        /// </summary>
        public bool ShowByDefault
        {
            get
            {
                return showByDefault;
            }
            set
            {
                showByDefault = value;
            }
        }

        /// <summary>
        /// Returns the heading for the list of notes
        /// </summary>
        public string NotesTitle
        {
            get
            {
                return notesTitle;
            }
            set
            {
                notesTitle = value;
            }
        }

        /// <summary>
        /// Gets or sets a list of notes
        /// </summary>
        public List<string> Notes
        {
            get
            {
                return notes;
            }
            set
            {
                notes = value;
            }
        }

        public ReportChartingConfig(string xAxis, string yAxis)
        {
            this._xAxis = xAxis;
            this._yAxis = yAxis;
            // default
            chartType = SeriesChartType.Column;
            chartColor = System.Drawing.Color.Red;
            showChartingTypes = false;
            showByDefault = false;
        }
    }

    /// <summary>
    /// Represents a report category
    /// </summary>
    public class ReportCategoryConfig
    {
        private string name = string.Empty;
        private string description = string.Empty;
        private string icon = string.Empty;
        private string docFile = string.Empty;

        private List<ReportCategoryConfig> subCategories = new List<ReportCategoryConfig>();

        public ReportCategoryConfig(string name)
        {
            this.name = name;
        }

        public ReportCategoryConfig(string name, string description, string icon, string docFile)
            : this(name)
        {
            this.description = description;
            this.icon = icon;
            this.docFile = docFile;
        }

        public ReportCategoryConfig(string name, string desc, string icon, string docFile, IEnumerable<ReportCategoryConfig> subCategories)
            : this(name, desc, icon, docFile)
        {
            this.subCategories.AddRange(subCategories);
        }   

        /// <summary>
        /// Gets the name of the category
        /// </summary>
        public string Name
        {
            get
            {
                return name;
            }
        }

        /// <summary>
        /// Gets the category description
        /// </summary>
        public string Description
        {
            get
            {
                return description;
            }
        }

        /// <summary>
        /// 
        /// </summary>
        public string Icon
        {
            get
            {
                return icon;
            }
        }

        /// <summary>
        /// 
        /// </summary>
        public string DocFile
        {
            get
            {
                return docFile;
            }
        }

        /// <summary>
        /// Gets the list of sub categories
        /// </summary>
        public List<ReportCategoryConfig> SubCategories
        {
            get
            {
                return subCategories;
            }
        }

        /// <summary>
        /// Returns a list of sub categories lookup by name
        /// </summary>
        public IDictionary<string, ReportCategoryConfig> SubCategoriesDictionary
        {
            get
            {
                return SubCategories.ToDictionary(r => r.name, r => r);
            }
        }

        /// <summary>
        /// Returns a list of sub category names
        /// </summary>
        public IEnumerable<string> SubCategoryNames
        {
            get
            {
                return SubCategories.Select(c => c.Name);
            }
        }

        /// <summary>
        /// Returns the relateive path (or empty string) to the icon
        /// </summary>
        /// <returns></returns>
        public string GetCategoryIcon()
        {
            return ReportConfiguration.GetReportIconPath(Icon);
        }
    }

    //(string dataTextField,string dataTextFormatString,string dataNavigateUrlField,string headerText,string goToReport, string param)
    public class ReportHyperLinkColumn
    {
        private string dataTextField = "";
        private string dataTextFormatString = "";
        private string dataNavigateUrlField = "";
        private string headerText = "";
        private string goToReport = "";
        private string param = "";

        public string DataTextField
        {
            get
            {
                return dataTextField;
            }
            set
            {
                dataTextField = value;
            }
        }
        public string DataTextFormatString
        {
            get
            {
                return dataTextFormatString;
            }
            set
            {
                dataTextFormatString = value;
            }
        }
        public string DataNavigateUrlField
        {
            get
            {
                return dataNavigateUrlField;
            }
            set
            {
                dataNavigateUrlField = value;
            }
        }
        public string HeaderText
        {
            get
            {
                return headerText;
            }
            set
            {
                headerText = value;
            }
        }
        public string GoToReport
        {
            get
            {
                return goToReport;
            }
            set
            {
                goToReport = value;
            }
        }
        public string Param
        {
            get
            {
                return param;
            }
            set
            {
                param = value;
            }
        }
    }

    /// <summary>
    /// Represents all the text data for each disease-specific report
    /// </summary>
    public class ReportAbout
    {
        

        private List<string> _sections;     // implemented directly from nodelist
        private List<aboutItem> _sectionItems;

        // Property getters and setters
        public List<string> sections
        {
            get
            {
                return _sections;
            }
            set
            {
                _sections = value;
            }
        }
        public List<aboutItem> sectionItems
        {
            get
            {
                return _sectionItems;
            }
            set
            {
                _sectionItems = value;
            }
        }

        // Constructor
        public ReportAbout(List<aboutItem> listOfItems)
        {
            
            List<string> tempSections = new List<string>();
            foreach (aboutItem item in listOfItems)
            {
                //store any new sections
                bool sectionDNE = (tempSections.IndexOf(item.section)<0);
                if ((sectionDNE) & (item.section.ToLower()!="common"))
                {
                    tempSections.Add(item.section);
                }
                                
            }
            this.sections = tempSections;
            this.sectionItems = listOfItems;
        }

        // Helper functions
        public List<aboutItem> retrieveSectionItems(string section)
        {
            List<aboutItem> sectionList = new List<aboutItem>();
            sectionList = this.sectionItems.Where(aboutItem => aboutItem.section == section).ToList<aboutItem>();
            
            /* Need to do exception handling */


            //**** ALSO NEED TO GROUP SECTION ITEMS BY GROUP
            sectionList = sectionList.OrderBy(aboutItem => aboutItem.group).ToList<aboutItem>();
            return sectionList;
        }

        


    }

    /// <summary>
    /// Represents a single item to be displayed in an about section.
    /// </summary>
    public class aboutItem
    {
        private string _section; // the section to which the item belongs
        private string _group;   // the group (sub-section) to which the item belongs
        private string _id;
        private string _label;
        private string _description;

        public string section
        {
            get
            {
                return _section;
            }
            set
            {
                _section = value;
            }
        }

        public string group
        {
            get 
            {
                return _group;
            }
            set
            {
                _group = value;
            }
        }

        public string id { get; set; }
        public string label
        {
            get
            {
                return _label;
            }
            set {
                _label = value;

            }
        }

        public string description
        {
            get 
            {
                return _description;
            }
            set
            {
                _description = value;
            }
        }
    }
}