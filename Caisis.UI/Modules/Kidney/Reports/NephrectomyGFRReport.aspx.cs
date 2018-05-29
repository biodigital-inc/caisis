using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

using Caisis.Controller;
using Caisis.Security;
using Caisis.DataAccess;
using Caisis.BOL;
using Caisis.UI.Core.Classes;

namespace Caisis.UI.Modules.Kidney.Reports
{
    public partial class NephrectomyGFRReport : BaseReportPage
    {

        public override string ReportTitle
        {
            get
            {
                return "Nephrectomy GFR Report";
            }
        }

        protected override void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                // During inital loading, these items are final

                // Default Range for 1 month ago to today
                StartDateField.Value = DateTime.Today.Subtract(TimeSpan.FromDays(30)).ToShortDateString();
                EndDateField.Value = DateTime.Today.ToShortDateString();
            }
        }


        /// <summary>
        /// Handle click of run report
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void RunReportClick(object sender, EventArgs e)
        {
            BindReport();
        }


        protected void ExportToExcelClick(object sender, EventArgs e)
        {
            ReportDa da = new ReportDa();
            DataView surgeryReportView = GetReportsDataView();
            base.ExportToExcel(surgeryReportView);
        }

        /// <summary>
        /// Binds the Report grid to the results.
        /// </summary>
        /// <param name="physicianName"></param>
        /// <param name="rangeCount"></param>
        private void BindReport()
        {
            int recordCount = 0;
            //if (!string.IsNullOrEmpty(physicianName))
            //{
                // Get report from db and bind to grid
                DataView surgeryReportView = GetReportsDataView();
                ReportGrid.DataSource = surgeryReportView;
                ReportGrid.DataBind();

                recordCount = surgeryReportView.Count;

                // log report view
                base.LogReportView();
            //}

            if (recordCount == 1)
            {
                UserText.Text = "There is 1 record";
            }
            else
            {
                UserText.Text = "There are " + recordCount + " records";
            }
        }


        

        /// <summary>
        /// Gets a report for a physician by month range
        /// </summary>
        /// <param name="physicianName"></param>
        /// <param name="startDate"></param>
        /// <param name="endDate"></param>
        /// <returns></returns>
        private DataView GetReportsDataView()
        {
            DateTime startDate = !string.IsNullOrEmpty(StartDateField.Value) ? DateTime.Parse(StartDateField.Value) : DateTime.Today;
            DateTime endDate = !string.IsNullOrEmpty(EndDateField.Value) ? DateTime.Parse(EndDateField.Value) : DateTime.Today;

            ReportDa da = new ReportDa();
            DataTable reportTable = da.GetNephrectomyCREATReport(startDate, endDate);
            DataView reportView = GFRView(reportTable);

            return reportView;
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void HandleSorting(object sender, GridViewSortEventArgs e)
        {

            DateTime startDate = DateTime.Parse(StartDateField.Value);
            DateTime endDate = DateTime.Parse(EndDateField.Value);

            GridView grid = (sender as GridView);
            DataView view = GetReportsDataView();
            string dir = "DESC";
            if (string.IsNullOrEmpty(GridSortDirection))
            {
                GridSortDirection = SortDirection.Descending.ToString();
            }
            else
            {
                if (GridSortDirection == SortDirection.Ascending.ToString())
                {
                    GridSortDirection = SortDirection.Descending.ToString();
                    dir = "DESC";
                }
                else
                {
                    GridSortDirection = SortDirection.Ascending.ToString();
                    dir = "ASC";
                }
            }

            view.Sort = e.SortExpression + " " + dir;

            grid.DataSource = view;
            grid.DataBind();
        }

        public string GridSortDirection
        {
            get
            {
                if (ViewState["sort"] != null)
                {
                    return ViewState["sort"].ToString();
                }
                else
                {
                    return string.Empty;
                }
            }
            set
            {
                ViewState["sort"] = value;
            }
        }

        protected DataView GFRView(DataTable CreatTable)
        {

            CreatTable.Columns.Add("GFR");
            CreatTable.Columns.Add("GFRError");

            // Calculate GFR
            // eGFR = 141 * min(SCr/k,1)^a * max(SCr/k,1)^-1.209 * 0.993^Age x [1.018 if female] * [1.159 if black]

            foreach (DataRow ReportRow in CreatTable.Rows)
            {

                bool AgeOK = false;
                bool GenderOK = false;
                bool RaceOK = false;


                string ptGender = ReportRow[BOL.Patient.PtGender].ToString();
                string ptRace = ReportRow[BOL.Patient.PtRace].ToString();
                int ptAge = 0;

                DateTime ptBirthDate;
                if (DateTime.TryParse(ReportRow[BOL.Patient.PtBirthDate].ToString(), out ptBirthDate))
                {
                    ptAge = Convert.ToInt32(Math.Floor(((DateTime.Now - ptBirthDate).TotalDays) / (365.242222)));
                    AgeOK = true;
                }

                double k = 0;
                double a = 0;

                if (ptGender.ToUpper() == "MALE") { k = 0.9; a = -0.411; GenderOK = true; }
                else if (ptGender.ToUpper() == "FEMALE") { k = 0.7; a = -0.329; GenderOK = true; }

                if (ptRace.Length > 0) { RaceOK = true; }


                if (GenderOK && RaceOK && AgeOK)
                {
                        double creatResult;
                        if (ReportRow[BOL.LabTest.LabResult].ToString().Length > 0 && double.TryParse(ReportRow[BOL.LabTest.LabResult].ToString(), out creatResult))
                        {
                            try
                            {
                                double gfrCalc = (141) * (Math.Pow((Math.Min((creatResult / k), 1)), a)) * (Math.Pow((Math.Max((creatResult / k), 1)), -1.209)) * (Math.Pow(0.993, ptAge));
                                if (ptGender.ToUpper() == "FEMALE") gfrCalc = gfrCalc * 1.018;
                                if (ptRace.ToUpper().Contains("BLACK")) gfrCalc = gfrCalc * 1.159;
                                ReportRow["GFR"] = Math.Round(gfrCalc, 3);
                            }
                            catch { }
                        }
                        else { ReportRow["GFRError"] = "Invalid Creatinine Value"; }
                }
                else
                {
                    string errorMsg = "GFR cannot be calculated. (";
                    if (!GenderOK) errorMsg += "No Gender. ";
                    if (!RaceOK) errorMsg += "No Race. ";
                    if (!AgeOK) errorMsg += "No Age.";
                    errorMsg += ")";
                    ReportRow["GFRError"] = errorMsg;
                }


            }
            return CreatTable.DefaultView;
        }
    }
}
