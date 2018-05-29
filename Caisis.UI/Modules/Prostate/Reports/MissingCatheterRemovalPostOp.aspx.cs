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

using Caisis.DataAccess;
using Caisis.BOL;
using Caisis.UI.Core.Classes;

namespace Caisis.UI.Modules.Prostate.Reports
{
	/// <summary>
	/// Summary description for MissingCatheterRemovalPostOp.
	/// </summary>
	public partial class MissingCatheterRemovalPostOp : BaseReportPage
	{
		protected string resultMessage = "";
        protected string reportTitle = "Post Operation Patients with Missing Catheter Removals";
		private string datasetSql;

        public override string ReportTitle
        {
            get
            {
                return reportTitle;
            }
        }

        protected override void Page_Load(object sender, System.EventArgs e)
        {
            datasetSql = CacheManager.GetDatasetSQL(Session[SessionKey.DatasetId]);

            ReportDa da = new ReportDa();
            DataSet ds = da.GetMissingCatheterRemovalPatients(datasetSql);

            if (ds.Tables.Count > 0)
            {
                DataView view = ds.Tables[0].DefaultView;
               // BaseReportPage.LogReport();
                reportResults.DataSource = view;
                reportResults.DataBind();

                // log report view
                base.LogReportView();
            }
            else
            {
                resultMessage = "There are no patients missing catheter removal.";
            }
        }
	}
}
