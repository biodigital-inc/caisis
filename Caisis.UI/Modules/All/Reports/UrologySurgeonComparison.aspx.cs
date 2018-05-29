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

namespace Caisis.UI.Modules.All.Reports
{
    public partial class UrologySurgeonComparison : BaseReportPage
    {
        public override string ReportTitle
        {
            get
            {
                return "Urology Surgical Outcomes Report";
            }
        }

        protected override void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                // During inital loading, these items are final
                BuildPhysiciansDropDown();

                // Default Range for 1 month ago to today
                StartDateField.Value = DateTime.Today.Subtract(TimeSpan.FromDays(30)).ToShortDateString();
                EndDateField.Value = DateTime.Today.ToShortDateString();
                         
                proctype.Items.Insert(0, new ListItem("SalvLP"));
                proctype.Items.Insert(0, new ListItem("SalvRP"));
                proctype.Items.Insert(0, new ListItem("RALP"));
                proctype.Items.Insert(0, new ListItem("LP"));
                proctype.Items.Insert(0, new ListItem("RP"));
                proctype.Items.Insert(0, new ListItem("All Prostatectomies"));
            }
        }

        /// <summary>
        /// Build a list of distinct physicans to run report against, or use logged in user (default)
        /// </summary>
        private void BuildPhysiciansDropDown()
        {
            UserController uc = new UserController();
            string phLastName = uc.GetLoggedInUserLastName();

            // If user has permission to edit security/admin, then they should be
            // able to select physician to run report against
            if (PermissionManager.HasPermission(PermissionManager.EditSecurity))
            {
                // Retrieve a list of distinct urology physicians
                string serviceName = "Urology";
                string[] procNames = new string[] { "RP", "CP", "LP", "RALP", "PP", "LP_CONV", "SalvCP", "SalvLP", "SalvRP" };

                PhysicianDa da = new PhysicianDa();
                DataTable distinctPhysicians = da.GetDistinctProcSurgeonsByServiceAndProc(serviceName, procNames);

                PhysiciansSelect.DataSource = distinctPhysicians;
                PhysiciansSelect.DataBind();

                if (distinctPhysicians.Select("ProcSurgeon = '" + phLastName.Replace("'", "''") + "'").Length > 0)
                {
                    PhysiciansSelect.SelectedValue = phLastName;
                }
            }
            // Otherwise logged in user will be shown and select disabled
            else
            {
                ListItem singlePhysician = new ListItem(phLastName, phLastName);
                PhysiciansSelect.Items.Add(singlePhysician);
                PhysiciansSelect.Enabled = false;
            }
        }

        /// <summary>
        /// Handle click of run report
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void RunReportClick(object sender, EventArgs e)
        {
            string physicianName = PhysiciansSelect.SelectedValue;
            string procedureType = proctype.Value;
            BindReportToPhysician(physicianName, procedureType);
        }


        protected void ExportToExcelClick(object sender, EventArgs e)
        {
            string physicianName = PhysiciansSelect.SelectedValue;
            string procedureType = proctype.Value;

            ReportDa da = new ReportDa();
            DataView surgeryReportView = GetReportsDataView(physicianName, procedureType);
            base.ExportToExcel(surgeryReportView);
        }

        /// <summary>
        /// Binds the Report grid to the results.
        /// </summary>
        /// <param name="physicianName"></param>
        /// <param name="rangeCount"></param>
        private void BindReportToPhysician(string physicianName, string procedureType)
        {
            int recordCount = 0;
            if (!string.IsNullOrEmpty(physicianName))
            {
                // Get report from db and bind to grid
                DataView surgeryReportView = GetReportsDataView(physicianName, procedureType);
                ReportGrid.DataSource = surgeryReportView;
                ReportGrid.DataBind();

                recordCount = surgeryReportView.Count;

                // log view
                base.LogReportView();
            }

            if (recordCount == 1)
            {
                UserText.Text = "There is 1 record";
            }
            else
            {
                UserText.Text = "There are " + recordCount + " records";
            }
            UserText.Text += " for Dr. " + physicianName;
        }




        /// <summary>
        /// Gets a report for a physician by month range
        /// </summary>
        /// <param name="physicianName"></param>
        /// <param name="startDate"></param>
        /// <param name="endDate"></param>
        /// <returns></returns>
        private DataView GetReportsDataView(string physicianName, string procedureType)
        {
            DateTime startDate = !string.IsNullOrEmpty(StartDateField.Value) ? DateTime.Parse(StartDateField.Value) : DateTime.Today;
            DateTime endDate = !string.IsNullOrEmpty(EndDateField.Value) ? DateTime.Parse(EndDateField.Value) : DateTime.Today;

            ReportDa da = new ReportDa();
            DataView surgeryReportView = da.GetUrologySurgerySummary(physicianName, startDate, endDate, procedureType);
            return surgeryReportView;
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void HandleSorting(object sender, GridViewSortEventArgs e)
        {
            string physicianName = PhysiciansSelect.SelectedValue;
            string procedureType = proctype.Value;

            DateTime startDate = DateTime.Parse(StartDateField.Value);
            DateTime endDate = DateTime.Parse(EndDateField.Value);

            GridView grid = (sender as GridView);
            DataView view = GetReportsDataView(physicianName, procedureType);
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

    }
}
