using System;
using System.Data;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using Caisis.Controller;
using Caisis.DataAccess;
using System.Web.UI.DataVisualization.Charting;


namespace Caisis.UI.Core.Utilities.Widget
{
    public partial class UserReportWidget : BaseWidgetControl
    {
        protected override void OnLoad(EventArgs e)
        {
            base.OnLoad(e);
            if (!Page.IsPostBack)
            {
                BuildUserRecentReports();
            }
        }

        /// <summary>
        /// Builds a list of User's recent reports.
        /// </summary>
        private void BuildUserRecentReports()
        {
            // get a list of valid reports
            var reportNames = ReportConfigurations.LoadFromXml(ReportConfigurationType.User).Keys;

            DataTable recentReports = ReportController.GetUserRecentReportViews();
            // filter list to distinct report names, with most recent entry
            var distinctReports = from report in recentReports.AsEnumerable()
                                  let reportName = report["ReportName"].ToString()
                                  let reportDate = (DateTime)report["ExportDate"]
                                  orderby reportDate descending
                                  group report by reportName into g
                                  let report = g.First()
                                  select new
                                  {
                                      ReportName = report["ReportName"].ToString(),
                                      ExportDate = (DateTime)report["ExportDate"],
                                      IsReport = reportNames.Contains(report["ReportName"].ToString(), StringComparer.OrdinalIgnoreCase)
                                  };
            if (distinctReports.Count() > 0)
            {
                UserRecentReports.DataSource = distinctReports;
                UserRecentReports.DataBind();

                NoReportsMessage.Visible = false;
            }
        }
    }
}