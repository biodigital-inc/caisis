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
using System.Text.RegularExpressions;
using System.Text;


using Caisis.Security;
using Caisis.DataAccess;
using Caisis.BOL;
using Caisis.UI.Core.Classes;

namespace Caisis.UI.Modules.All.Reports
{
    public partial class NursingReport : BaseReportPage
    {
        ReportDa da = new ReportDa();

        public override string ReportTitle
        {
            get
            {
                return "Nursing Report";
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
            }
        }

        /// <summary>
        /// Build a list of distinct physicans to run report
        /// </summary>
        private void BuildPhysiciansDropDown()
        {
            PhysicianDa da = new PhysicianDa();
            DataTable distinctPhysicians = da.GetDistinctApptPhysicians();

            PhysiciansSelect.DataSource = distinctPhysicians.DefaultView; ;
            PhysiciansSelect.DataBind();
        }

        /// <summary>
        /// Handle click of run report
        /// </summary>
        protected void RunReportClick(object sender, EventArgs e)
        {
            string physicianName = PhysiciansSelect.SelectedValue;
            BindReportToPhysician(physicianName);
        }
        
        /// <summary>
        /// Binds the Report grid to the results.
        /// </summary>
        private void BindReportToPhysician(string physicianName)
        {
            int recordCount = 0;
            if (!string.IsNullOrEmpty(physicianName))
            {
                // Get report from db and bind to repeater
                DataView NursingReportView = GetReportsDataView(physicianName);

                nursingRptr.DataSource = NursingReportView;
                nursingRptr.DataBind();

                // log view
                base.LogReportView();

                recordCount = NursingReportView.Count;
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

        protected void BindData(Object Sender, RepeaterItemEventArgs e)
        {
            Literal ProbsPlans = (Literal)e.Item.FindControl("ProbsPlans");
            Literal PtHPI = (Literal)e.Item.FindControl("PtHPI");

            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                DataRowView drv = (DataRowView)e.Item.DataItem;
                string PtId = drv["ApptPatientId"].ToString();
                string physician=drv["ApptPhysician"].ToString();
                if (!string.IsNullOrEmpty(PtId))
                {
                    //gets all problems from recent encounter per patient per physician
                    DataTable ProbsDt = da.GetProblems(PtId, physician);

                    StringBuilder plstr = new StringBuilder();
                    StringBuilder str = new StringBuilder();
                    if (ProbsDt.Rows.Count > 0)
                    {
                        foreach (DataRow probs in ProbsDt.Rows)
                        {
                            string ProbPlanDt = probs["EnteredDate"].ToString();

                            string ProbName = probs["ProblemName"].ToString();
                            int PtprobId = int.Parse(probs["PatientProblemId"].ToString());
                            //gets all plans per problem
                            DataTable PlansDt = da.GetPlans(PtprobId);
                            if (PlansDt.Rows.Count > 0)
                            {
                                foreach (DataRow plans in PlansDt.Rows)
                                {
                                    string PlanName = plans["PlanName"].ToString();
                                    plstr.Append(PlanName + ", ");
                                }
                                str.Append("<strong>Problem:</strong> " + ProbName + "<br/><strong>Plans:</strong> " + plstr.ToString() + "<br/><br/>");
                            }
                            ProbsPlans.Text = "<strong>Visit Date:</strong> " + ProbPlanDt + "<br/>" + str.ToString();
                            plstr.Remove(0, plstr.Length);
                        }
                    }
                    //gets HPI data for each patient
                    PatientDa ptDa = new PatientDa();
                    DataSet hpiDs = ptDa.GetPatientHPI(int.Parse(PtId), 0, 0);
                    StringBuilder hpiStr = new StringBuilder();
                    if (hpiDs.Tables[0].Rows.Count > 0)
                    {
                        foreach (DataRow hpi in hpiDs.Tables[0].Rows)
                        {
                            string hpiData = hpi["patientHPI"].ToString();
                            hpiStr.Append(hpiData + "<br/>");
                        }
                    }
                    PtHPI.Text = hpiStr.ToString();
                }
            }
        }

        /// <summary>
        /// Gets appointments report for a physician by date range
        /// </summary>
        private DataView GetReportsDataView(string physicianName)
        {
            DateTime startDate = !string.IsNullOrEmpty(StartDateField.Value) ? DateTime.Parse(StartDateField.Value) : DateTime.Today;
            DateTime endDate = !string.IsNullOrEmpty(EndDateField.Value) ? DateTime.Parse(EndDateField.Value) : DateTime.Today;

            ReportDa da = new ReportDa();
            DataTable dt = da.GetNursingReport(physicianName, startDate, endDate);

            DataView NursingReportView = dt.DefaultView;
            return NursingReportView;
        }

        #region Code Graveyard
        //protected void ExportToExcelClick(object sender, EventArgs e)
        //{
        //    string physicianName = PhysiciansSelect.SelectedValue;

        //    DataView NursingReportView = GetReportsDataView(physicianName);
        //    WriteReportToExcel(NursingReportView);
        //}

        //protected void WriteReportToExcel(DataView view)
        //{
        //    Response.Clear();
        //    Response.Buffer = true;
        //    Response.ContentType = "application/vnd.ms-excel";
        //    Response.AddHeader("Content-Disposition", "attachment;filename=NursingReport.xls");
        //    Response.Charset = "";
        //    this.EnableViewState = false;

        //    GridView ExcelDg = new GridView();
        //    ExcelDg.DataSource = view;
        //    ExcelDg.DataBind();

        //    System.IO.StringWriter oStringWriter = new System.IO.StringWriter();
        //    System.Web.UI.HtmlTextWriter oHtmlTextWriter = new System.Web.UI.HtmlTextWriter(oStringWriter);

        //    ExcelDg.RenderControl(oHtmlTextWriter);
        //    Response.Write(oStringWriter.ToString());
        //    Response.End();
        //}

        /// <summary>
        /// 
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        //protected void HandleSorting(object sender, GridViewSortEventArgs e)
        //{
        //    string physicianName = PhysiciansSelect.SelectedValue;

        //    DateTime startDate = DateTime.Parse(StartDateField.Value);
        //    DateTime endDate = DateTime.Parse(EndDateField.Value);

        //    GridView grid = (sender as GridView);
        //    DataView view = GetReportsDataView(physicianName);
        //    string dir = "DESC";
        //    if (string.IsNullOrEmpty(GridSortDirection))
        //    {
        //        GridSortDirection = SortDirection.Descending.ToString();
        //    }
        //    else
        //    {
        //        if (GridSortDirection == SortDirection.Ascending.ToString())
        //        {
        //            GridSortDirection = SortDirection.Descending.ToString();
        //            dir = "DESC";
        //        }
        //        else
        //        {
        //            GridSortDirection = SortDirection.Ascending.ToString();
        //            dir = "ASC";
        //        }
        //    }

        //    view.Sort = e.SortExpression + " " + dir;

        //    grid.DataSource = view;
        //    grid.DataBind();
        //}

        //public string GridSortDirection
        //{
        //    get
        //    {
        //        if (ViewState["sort"] != null)
        //        {
        //            return ViewState["sort"].ToString();
        //        }
        //        else
        //        {
        //            return string.Empty;
        //        }
        //    }
        //    set
        //    {
        //        ViewState["sort"] = value;
        //    }
        //}
        #endregion
    }
}