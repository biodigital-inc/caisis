using System;
using System.Data;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;

using System.Xml;
using System.Xml.Linq;

using Caisis.BOL;
using Caisis.DataAccess;
using Caisis.UI.Core.Classes;
using Caisis.Controller;

namespace Caisis.UI.Modules.ProtocolMgmt
{
    public partial class ProtocolSpecimenReport : ProtocolMgmtBasePage
    {
        private static readonly string REPORT_TITLE = "Protocol Specimen Report";

        protected override void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                RunReport();
            }
        }

        private DataTable GetReport()
        {
            string datasetSQL = base.GetSpecimenPatientsDatasetSQL();
            DataTable results = ProtocolMgmtDa.GetProtocolSpecimenReport(datasetSQL);
            return results;
        }

        private void RunReport()
        {
            DataTable report = GetReport();
            string[] columns = report.Columns.Cast<DataColumn>().Select(c => c.ColumnName).ToArray();
            // build header
            HeaderRptr.DataSource = columns;
            HeaderRptr.DataBind();
            // build results
            ResultsGrid.DataSource = report;
            ResultsGrid.DataBind();
        }

        protected void ExportClick(object sender, EventArgs e)
        {
            ExcelExporter.ExportToExcel(this, GetReport().DefaultView, REPORT_TITLE, REPORT_TITLE.Replace(" ", "") + ".xls");
        }
    }
}