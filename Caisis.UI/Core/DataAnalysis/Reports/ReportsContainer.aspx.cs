using System;
using System.Collections;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Web;
using System.Web.SessionState;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using System.Xml;
using System.Linq;

using Caisis.UI.Core.Classes;
using Caisis.Controller;

namespace Caisis.UI.Core.DataAnalysis.Reports
{
    /// <summary>
    /// Summary description for ReportsContainer.
    /// </summary>
    public partial class ReportContainer : BasePage
    {

        public string QueryReport
        {
            get
            {
                return Request.QueryString["report"];
            }
        }

        public string QueryModule
        {
            get
            {
                return Request.QueryString["module"];
            }
        }

        public bool ShowReportDropDown
        {
            get
            {
                bool doShow = true;
                string doShowString = Request.QueryString["showReportDropDown"];
                if (!string.IsNullOrEmpty(doShowString))
                {
                    doShow = bool.Parse(doShowString);
                }
                return doShow;
            }
        }


        protected override void Page_Load(object sender, System.EventArgs e)
        {
            if (!string.IsNullOrEmpty(QueryReport))
            {
                string modulePath = GetReportPath(QueryReport);
                if (!string.IsNullOrEmpty(modulePath))
                {
                    // pass along report params
                    string reportParams = Request.QueryString["params"];
                    // re-encode params value
                    reportParams = !string.IsNullOrEmpty(reportParams) ? Server.UrlEncode(reportParams) : string.Empty;
                    string url = modulePath + "?params=" + reportParams;
                    ReportContent.Attributes.Add("src", url);
                    //RegisterLoadReportScript(url);
                }
            }

            BuildReportsDropDown();
        }

        /// <summary>
        /// Loads report into iframe via client script, adding width and height params
        /// </summary>
        /// <param name="url"></param>
        private void RegisterLoadReportScript(string url)
        {
            Page.ClientScript.RegisterStartupScript(this.GetType(), "LoadReport", "loadReportFrame('" + url + "');", true);
        }

        private void BuildReportsDropDown()
        {
            // build dorp down
            ReportConfigurations reportConfigurations = new ReportConfigurations();
            reportConfigurations.LoadReportsFromXml(ReportConfigurationType.User);

            var dropDownItems = from report in reportConfigurations.Reports
                                where report.Module.Replace(" ", "") == QueryModule
                                select report;

            ReportsRptr.DataSource = dropDownItems;
            ReportsRptr.DataBind();

            // only show drop down items if they exist
            ModuleListHolder.Visible = ShowReportDropDown;
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void SetAvailableReports(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                // Set select option values
                ReportConfiguration dataItem = e.Item.DataItem as ReportConfiguration;
                HtmlGenericControl opt = e.Item.FindControl("ReportItem") as HtmlGenericControl;
                string reportName = dataItem.ID;
                string reportForm = dataItem.Form;
                string reportPath = GetReportPath(reportForm);

                if (string.IsNullOrEmpty(reportPath))
                {
                    e.Item.Visible = false;
                }
                else
                {
                    opt.InnerText = reportName;
                    opt.Attributes["title"] = reportName;
                    opt.Attributes["value"] = reportPath;
                }
            }
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="reportFormName"></param>
        /// <returns></returns>
        private string GetReportPath(string reportFormName)
        {
            string reportPath = "";
            string reportModule = Caisis.UI.Core.Classes.XmlUtil.GetParentModuleDirectory(reportFormName + ".aspx", "Reports");

            // If filtering by module, return no path if module doesn't match
            if (!string.IsNullOrEmpty(QueryModule) && QueryModule != reportModule)
            {
                return string.Empty;
            }
            else
            {
                return Page.ResolveUrl("~/Modules/" + reportModule + "/Reports/" + reportFormName + ".aspx");
            }
        }
    }
}
