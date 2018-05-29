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

using Caisis.UI.Core.Classes;

namespace Caisis.UI.Modules.All.Reports
{
    /// <summary>
    /// Summary description for SurgeriesByDateReport.
    /// </summary>
    public partial class SurgeriesByDateReport : BaseReportPage
    {
        protected bool displayDate = false;
        protected string resultMessage = "";

        private static readonly int RECENT_YEARS = 15;

        public override string ReportTitle
        {
            get
            {
                return "Surgeries by Date";
            }
        }

        protected override void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                BuildYears();
            }
        }

        /// <summary>
        /// 
        /// </summary>
        private void BuildYears()
        {
            int yearNow = DateTime.Today.Year;
            int[] years = new int[RECENT_YEARS];
            for (int i = 0; i < RECENT_YEARS; i++)
            {
                int dropDownYear = yearNow - i;
                years[i] = dropDownYear;
            }
            year.DataSource = years;
            year.DataBind();
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void SetReportOnChange(object sender, EventArgs e)
        {
            string yearValue = year.SelectedValue;
            RunReport(yearValue);
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="yearValue"></param>
        private void RunReport(string yearValue)
        {
            SelectYearLabel.Text = "<br/><br/><strong>Surgeries for the year:</strong> ";

            ReportDa da = new ReportDa();
            DataSet ds = da.GetSurgeriesByDate(yearValue);

            if (ds.Tables.Count != 0)
            {
                reportResults.DataSource = ds.Tables[0].DefaultView;
                reportResults.DataBind();

                // log report view
                base.LogReportView();

                if (ds.Tables[0].Rows.Count == 0)
                {
                    resultMessage = "There are no records for " + yearValue + ".";
                }
            }

            if (yearValue.Equals("All") || yearValue.Equals(""))
            {
                displayDate = true;
            }
        }

    }
}
