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
    public partial class ProtocolScreeningReport : BaseReportPage
    {

        public override string ReportTitle
        {
            get
            {
                return "Protocol Screening Report";
            }
        }

        protected override void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                BuildPhysiciansDropDown();

                ClinicDateField.Value = DateTime.Today.ToShortDateString();

            }
        }


        /// <summary>
        /// Build a list of distinct physicans to run report
        /// </summary>
        private void BuildPhysiciansDropDown()
        {
            PhysicianDa da = new PhysicianDa();
            DataTable distinctPhysicians = da.GetDistinctApptPhysicians();

            PhysiciansSelect.DataSource = distinctPhysicians.DefaultView;
            PhysiciansSelect.DataBind();
        }

        /// <summary>
        /// Handle click of run report
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void RunReportClick(object sender, EventArgs e)
        {
            int recordCount = 0;

            // Get report from db and bind to grid
            DataView screeningReportView = GetReportsDataView();
            ReportGrid.DataSource = screeningReportView;
            ReportGrid.DataBind();
            recordCount = screeningReportView.Count;

            if (recordCount == 1)
            {
                UserText.Text = "There is 1 record";
            }
            else
            {
                UserText.Text = "There are " + recordCount + " records";
            }

            // log report view
            base.LogReportView();

        }


        protected void ExportToExcelClick(object sender, EventArgs e)
        {
            DataView surgeryReportView = GetReportsDataView();
            WriteReportToExcel(surgeryReportView);
        }

        public override void VerifyRenderingInServerForm(Control control)
        {
            /* NOTE: Needed for Gridview export.  Confirms that an HtmlForm control 
             * is rendered for the specifie
             * d ASP.NET server control at run time. */
        }

        protected void WriteReportToExcel(DataView view)
        {
           
            //Response.Clear();
            //Response.Buffer = true;
            //Response.ContentType = "application/vnd.ms-excel";
            //Response.AddHeader("Content-Disposition", "attachment;filename=SurveyHistory.xls");
            //Response.Charset = "";
            this.EnableViewState = false;

            ReportGrid.AllowSorting = false;
            ReportGrid.HeaderStyle.ForeColor = System.Drawing.Color.Black;
            ReportGrid.DataSource = view;
            ReportGrid.DataBind();
            DisableControls(ReportGrid);

            //System.IO.StringWriter oStringWriter = new System.IO.StringWriter();
            //System.Web.UI.HtmlTextWriter oHtmlTextWriter = new System.Web.UI.HtmlTextWriter(oStringWriter);

            //ReportGrid.RenderControl(oHtmlTextWriter);
            //Response.Write(oStringWriter.ToString());
            //Response.End();

            //ReportGrid.AllowSorting = true;
            //ReportGrid.HeaderStyle.ForeColor = System.Drawing.Color.White;
            //ExportToExcel(view, "", "SurveyHistory.xls");

            // write grid to output
            Caisis.Controller.ExcelExporter.ExportToExcel(Page, ReportGrid, ReportTitle, "SurveyHistory.xls");
        }

        private void DisableControls(Control gv)
        {
            LinkButton lb = new LinkButton();
            Literal l = new Literal();

            string name = String.Empty;
            for (int i = 0; i < gv.Controls.Count; i++)
            {
                if (gv.Controls[i].GetType() == typeof(HyperLink))
                {
                    l.Text = (gv.Controls[i] as HyperLink).Text;
                    gv.Controls.Remove(gv.Controls[i]);
                    gv.Controls.AddAt(i, l);
                }
                if (gv.Controls[i].HasControls())
                {
                    DisableControls(gv.Controls[i]);
                }
            }
        }

        /// <summary>
        /// Gets a report of surveys OR letters sent by date range 
        /// </summary>
        /// <param name="physicianName"></param>
        /// <param name="startDate"></param>
        /// <param name="endDate"></param>
        /// <returns></returns>
        private DataView GetReportsDataView()
        {
            string docName = PhysiciansSelect.SelectedValue;
            DateTime clinicDate = !string.IsNullOrEmpty(ClinicDateField.Value) ? DateTime.Parse(ClinicDateField.Value) : DateTime.Today;

            DataView dw = ReportDa.GetClinicScreeningList(docName, clinicDate.ToShortDateString());

            return dw;
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void HandleSorting(object sender, GridViewSortEventArgs e)
        {
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
    }
}