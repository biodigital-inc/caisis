using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Collections.Generic;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Linq;

using Caisis.Controller;
using Caisis.UI.Core.Classes;

namespace Caisis.UI.Core.DataAnalysis.Reports
{
    public partial class SelectReport : BaseReportPage
    {

        /// <summary>
        /// Gets the query category
        /// </summary>
        protected string QueryCategory
        {
            get
            {
                return Request.QueryString["category"];
            }
        }

        /// <summary>
        /// Gets the query disease
        /// </summary>
        protected string QueryDisease
        {
            get
            {
                return Request.QueryString["disease"];
            }
        }

        protected override void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {

                if (string.IsNullOrEmpty(QueryDisease))
                {
                    var xml = XmlUtil.GetModulesConfigXml();
                    var diseases = xml.SelectNodes("//module[@name='Data Analysis']/sections/section[@name='" + QueryCategory + "']/section[@disease]");
                    if (diseases.Count > 0)
                    {
                        ShowDiseaseLabel.Visible = true;
                        ShowReportLabel.Visible = false;

                        DiseaseTitleBar.Visible = false;

                        DiseasesRprt.DataSource = diseases;
                        DiseasesRprt.DataBind();
                        return;
                    }                    
                }
                else
                {
                    ShowDiseaseLabel.Visible = false;
                    ShowReportLabel.Visible = true;

                    DiseaseTitleBar.Visible = true;
                }
                // build list of reports
                BuildReportsList(QueryCategory);                
            }
        }
        /// <summary>
        /// Sets Category and binds the list of reports for current category
        /// </summary>
        /// <param name="category"></param>
        private void BuildReportsList(string category)
        {
            // load list of user reports
            ReportConfigurations config = ReportConfigurations.LoadFromXml(ReportConfigurationType.User);
            // filter list by category (deafault: all)
            IEnumerable<ReportConfiguration> filteredReports = config.Reports;

            bool hasSubCategories = false;

            // set report title and filter reports by category
            if (!string.IsNullOrEmpty(category))
            {
                // set title
                CategoryTitle.Text = category;
                // filter list by category
                filteredReports = config.GetReportsByCategory(category);

                // get a list of sub categories by current reports
                var sub_categories = ReportConfigurations.GetReportSubCategories(filteredReports);
                if (sub_categories.Count() > 0)
                {
                    hasSubCategories = true;

                    var reports_by_sub_cat = from sub_category in sub_categories
                                             let sub_cat_reports = GetFilteredReportDataSource(ReportConfigurations.GetReportsByCategoryAndSubCategory(filteredReports, category, sub_category))
                                             where sub_cat_reports.Count() > 0
                                             select new
                                             {
                                                 SubCategory = sub_category,
                                                 Description = config.GetSubCategoryDescription(category, sub_category),
                                                 Icon = config.GetSubCategoryIcon(category, sub_category),
                                                 Reports = sub_cat_reports
                                             };


                    ReportsInCategoryRptr.Visible = true;
                    ReportsInCategoryRptr.DataSource = reports_by_sub_cat;
                    ReportsInCategoryRptr.DataBind();

                    // adjust main filtered list to those without sub categories
                    filteredReports = from report in filteredReports
                                      where report.Categories.Values.Count() == 0
                                      select report;
                }
                else
                {
                    ReportsInCategoryRptr.Visible = false;
                }
            }

            // show items with valid list
            if (filteredReports.Count() > 0)
            {
                NoReports.Visible = false;
                ReportSelectorRptr.Visible = true;

                // bind list of reports to rptr
                ReportSelectorRptr.DataSource = GetFilteredReportDataSource(filteredReports);
                ReportSelectorRptr.DataBind();
            }
            // otherwise display no records
            else
            {
                if (!hasSubCategories)
                {
                    NoReports.Visible = true;
                    ReportSelectorRptr.Visible = false;
                    ReportsInCategoryRptr.Visible = false;
                }
                else
                {
                    NoReports.Visible = false;
                    ReportSelectorRptr.Visible = false;
                    ReportsInCategoryRptr.Visible = true;
                }
            }
        }

        /// <summary>
        /// Builds a list of reports in the sub category
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void BuildSubReports(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                // list of reports in report configuration
                IEnumerable<ReportConfiguration> reports = DataBinder.Eval(e.Item.DataItem, "Reports") as IEnumerable<ReportConfiguration>;

                // repeater to contain items
                Repeater rptr = e.Item.FindControl("ReportsInSubCategoryRptr") as Repeater;
                rptr.DataSource = reports;
                rptr.DataBind();

                // set sub category icon
                Image subCatIcon = e.Item.FindControl("SubCatIcon") as Image;
                string subCatIconPath = DataBinder.Eval(e.Item.DataItem, "Icon").ToString();
                if (!string.IsNullOrEmpty(subCatIconPath) && ReportConfiguration.ValidateIconPath(Page, subCatIconPath))
                {
                    subCatIcon.ImageUrl = subCatIconPath;
                }
            }
        }

        /// <summary>
        /// Sets the report icon for the current report
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void SetReportIcon(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                bool isMainRptr = sender == ReportSelectorRptr;
                Image reportIcon = e.Item.FindControl("ReportIcon") as Image;
                // get current configuration object
                ReportConfiguration config = e.Item.DataItem as ReportConfiguration;
                // get the path to the icon
                string reportIconPath = isMainRptr ? config.GetReportIcon(Page) : ReportConfiguration.GetReportIconPath(config.Icon);
                // test if icon exists on disk, use, otherwise leave default
                if (!string.IsNullOrEmpty(reportIconPath) &&  ReportConfiguration.ValidateIconPath(Page, reportIconPath))
                {
                    reportIcon.Visible = true;
                    reportIcon.ImageUrl = reportIconPath;
                }
                else
                {
                    reportIcon.Visible = false;
                }
            }
        }         
      
        private IEnumerable<ReportConfiguration> GetFilteredReportDataSource(IEnumerable<ReportConfiguration> reports)
        {
            if (!string.IsNullOrEmpty(QueryDisease))
            {
                return reports.Where(r => r.ReportDiseases.Contains(QueryDisease));
            }
            return reports;
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="value"></param>
        /// <returns></returns>
        protected string EscapeValue(object value)
        {
            return PageUtil.EscapeSingleQuotes(value.ToString());
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="dataItem"></param>
        /// <param name="field"></param>
        /// <returns></returns>
        protected string EvalClientValue(object dataItem, string field)
        {
            string value = DataBinder.Eval(dataItem, field).ToString();
            return PageUtil.EscapeSingleQuotes(value);
        }
    }
}
