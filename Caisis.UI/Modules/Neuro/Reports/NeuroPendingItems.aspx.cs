using System;
using System.Collections;
using System.Configuration;
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
using Caisis.Security;
using Caisis.UI.Core.Classes;

namespace Caisis.UI.Modules.Neuro.Reports
{

    public partial class NeuroPendingItems : BaseReportPage
    {
        protected string resultMessage = "";
        protected string reportTitle = "Pending Items for Neuro Patients";
        private string datasetSql;

        public override string ReportTitle
        {
            get
            {
                return reportTitle;
            }
        }

        override protected void Page_Load(object sender, System.EventArgs e)
        {
            datasetSql = CacheManager.GetDatasetSQL(Session[SessionKey.DatasetId]);

            ReportDa da = new ReportDa();
            DataTable dt = da.GetNeuroPendingItems(datasetSql);

            if (dt.Rows.Count > 0)
            {
                reportResults.DataSource = dt.DefaultView;
                reportResults.DataBind();

                // log report view
                base.LogReportView();

                resultMessage = + dt.Rows.Count + " patient(s) returned";
            }
            else
            {
                resultMessage = "There are no neuro patients with pending items";
            }
        }


        // sorting columns using headers in ascending & descending order
        protected void SortRecords(object sender, CommandEventArgs e)
        {
            SortAndBindRecords(e.CommandName);
        }

        protected void SortAndBindRecords(string sortCriteria)
        {
            string datasetSql = CacheManager.GetDatasetSQL(Session[SessionKey.DatasetId]);

            ReportDa da = new ReportDa();
            DataTable sortdt = da.GetNeuroPendingItems(datasetSql);

            string SortField;
            switch (sortCriteria)
            {
                case "PtName":
                    SortField = "PtFirstName";
                    SortData(sortdt, SortField);
                    break;
                case "PtMRN":
                    SortField = "PtMRN";
                    SortData(sortdt, SortField);
                    break;
                case "VitalStatus":
                    SortField = "VitalStatus";
                    SortData(sortdt, SortField);
                    break;
                case "LastAccessed":
                    SortField = "LastAccessed";
                    SortData(sortdt, SortField);
                    break;
            }

            reportResults.DataSource = sortdt.DefaultView;
            reportResults.DataBind();
        }

        void SortData(DataTable sortdt, string SortExpression)
        {
            if (ViewState["SortOrder"] == null || ViewState["SortOrder"].ToString() == " DESC")
            {
                ViewState["SortOrder"] = " ASC";
            }
            else if (ViewState["SortOrder"].ToString() == " ASC")
            {
                ViewState["SortOrder"] = " DESC";
            }
            sortdt.DefaultView.Sort = SortExpression.ToString() + " " + ViewState["SortOrder"];
        } 
    }
}
