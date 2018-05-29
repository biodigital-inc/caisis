using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Collections.Generic;
using System.Collections.Specialized;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Linq;
using System.Xml;
using System.Xml.Linq;

using Caisis.BOL;
using Caisis.DataAccess;
using Caisis.Security;
using Caisis.UI.Core.Classes.CustomControls;
using Caisis.UI.Core.Classes;

namespace Caisis.UI.Modules.ProjectMgmt
{
    public partial class ProjectAccrual : ProjectMgmtBasePage
    {
        protected override void Page_Load(object sender, EventArgs e)
        {
            base.Page_Load(sender, e);
            // get protocol
            int projectId = int.Parse(base.ProjectId);
            int? protocolId = GetProtocolId(projectId);
            if (protocolId.HasValue)
            {
                BuildPatientDetails(protocolId.Value);
                BuildStats(protocolId.Value);
            }
            else
            {
                ErrorText.Visible = true;
                Form.Visible = false;
            }
        }

        private void BuildPatientDetails(int protocolId)
        {
            AccrualDetailsFrame.Attributes["src"] = Page.ResolveUrl("~/Modules/ProtocolMgmt/PatientBulkScreening.aspx?prid=" + protocolId + "&readonly=true");
            AccrualDetailsFrame.Visible = true;
        }

        private void BuildStats(int protocolId)
        {
            var protocolStats = ProtocolMgmtDa.GetProtocolAccrual(protocolId);
            DataView statsByYear = protocolStats.Tables[0].DefaultView;
            DataView statsByInstitution = protocolStats.Tables[1].DefaultView;

            ProjectAccrualByYearGrid.RowDataBound += (o, ee) =>
            {
                if (ee.Row.RowType == DataControlRowType.Footer)
                {
                    IEnumerable<int> indexes = Enumerable.Range(2, 1);
                    var sums = ColumnsToSum(statsByYear, indexes);
                    SetFooterSums(ee.Row, sums, statsByYear.Count);
                }
            };
            ProjectAccrualByYearGrid.DataSource = statsByYear;
            ProjectAccrualByYearGrid.DataBind();

            ProjectAccrualByInstitutionGrid.RowDataBound += (o, ee) =>
            {
                if (ee.Row.RowType == DataControlRowType.Footer)
                {
                    IEnumerable<int> indexes = Enumerable.Range(3, statsByInstitution.Table.Columns.Count - 3);
                    var sums = ColumnsToSum(statsByInstitution, indexes);
                    SetFooterSums(ee.Row, sums, statsByInstitution.Count);
                }
            };
            ProjectAccrualByInstitutionGrid.DataSource = statsByInstitution;
            ProjectAccrualByInstitutionGrid.DataBind();

            bool hasStatus = statsByYear.Count > 0 || statsByInstitution.Count > 0;
            ErrorText.Visible = !hasStatus;
            DetailsPanel.Visible = hasStatus;
        }

        private void SetFooterSums(GridViewRow footerRow, Dictionary<int, int> sums, int rowCount)
        {
            footerRow.Cells[0].Text = "<b>Total</b>";
            foreach (var sum in sums)
            {
                footerRow.Cells[sum.Key].Text = sum.Value + "";
            }
            footerRow.CssClass = rowCount % 2 == 0 ? "dataGridItemRowA" : "dataGridItemRowB";
        }

        private static int? GetProtocolId(int projectId)
        {
            Protocol protocol = BOL.BusinessObject.GetByFields<Protocol>(new Dictionary<string, object> { { Protocol.ProjectId, projectId } }).FirstOrDefault();
            if (protocol != null && protocol.PrimaryKeyHasValue)
                return (int)protocol[Protocol.ProtocolId];
            else
                return null;
        }

        private Dictionary<int, int> ColumnsToSum(DataView data, IEnumerable<int> indexes)
        {
            var sumByIndex = from row in data.Cast<DataRowView>()
                             from index in indexes
                             group row by index into g
                             select new
                             {
                                 Index = g.Key,
                                 Sum = g.Sum(r => (int)r[g.Key])
                             };
            return sumByIndex.ToDictionary(a => a.Index, a => a.Sum);
        }
    }
}
