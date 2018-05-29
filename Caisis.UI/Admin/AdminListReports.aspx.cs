using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using Caisis.BOL;
using Caisis.Controller;

namespace Caisis.UI.Admin
{
    public partial class AdminListReports : AdminBasePage
    {
        protected override void Page_Load(object sender, EventArgs e)
        {
            base.Page_Load(sender, e);
            BuildReports();
        }

        private void BuildReports()
        {
            var reportConfig = ReportConfigurations.LoadFromXml(ReportConfigurationType.User);
            var reports = reportConfig.Reports;
            var categories = reportConfig.Reports.SelectMany(r => r.Categories.Keys).Distinct();
            var categoriesToReports = from category in categories
                                      orderby category ascending
                                      select from report in reportConfig.GetReportsByCategory(category)
                                             orderby report.Title ascending
                                             select new
                                             {
                                                 Category = category,
                                                 Title = report.Title,
                                                 Description = report.Description,
                                                 IsStatic = report.IsStatic
                                             };
            CategoriesRptr.DataSource = categoriesToReports.SelectMany(a => a);
            CategoriesRptr.DataBind();
        }
    }
}
