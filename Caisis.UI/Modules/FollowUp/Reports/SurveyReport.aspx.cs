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

using Caisis.Security;
using Caisis.DataAccess;
using Caisis.BOL;
using Caisis.UI.Core.Classes;

namespace Caisis.UI.Modules.FollowUp
{
    public partial class SurveyReport : SurveyBasePage 
    {
        private static readonly string reportTitle = "Survey Report";

        protected override void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                LoadFormTypeDDL();

                ProcedureType.Text = FollowUpUtil.DEFAULT_PROCEDURE;

                // Default Range for 1 month ago to today
                StartDateField.Value = DateTime.Today.Subtract(TimeSpan.FromDays(30)).ToShortDateString();
                EndDateField.Value = DateTime.Today.ToShortDateString();

                ddlFormType.SelectedValue = "Survey";
            }
        }

     
        /// <summary>
        /// Populate the form type drop down list.
        /// </summary>
        private void LoadFormTypeDDL()
        {
            ddlFormType.Items.Add(new ListItem("Survey", "Survey"));
            ddlFormType.Items.Add(new ListItem("Letter", "Letter"));
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
            DataView surgeryReportView = GetReportsDataView();
            ReportGrid.DataSource = surgeryReportView;
            ReportGrid.DataBind();
            recordCount = surgeryReportView.Count;

            if (recordCount == 1)
            {
                UserText.Text = "There is 1 record";
            }
            else
            {
                UserText.Text = "There are " + recordCount + " records";
            }
            // log report view
            base.LogReportView(reportTitle);
        }


        protected void ExportToExcelClick(object sender, EventArgs e)
        {
            DataView surgeryReportView = GetReportsDataView();
            base.ExportToExcel(surgeryReportView, reportTitle, "SurveyHistory.xls");
        }

        public override void VerifyRenderingInServerForm(Control control)
        {
            /* NOTE: Needed for Gridview export.  Confirms that an HtmlForm control 
             * is rendered for the specifie
             * d ASP.NET server control at run time. */
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
            DateTime startDate = !string.IsNullOrEmpty(StartDateField.Value) ? DateTime.Parse(StartDateField.Value) : DateTime.Today;
            DateTime endDate = !string.IsNullOrEmpty(EndDateField.Value) ? DateTime.Parse(EndDateField.Value) : DateTime.Today;
            string procType = this.ProcedureType.SelectedValue;
            
            string actionItem;

            if (this.GetFormType() == "Survey")
                actionItem = "%" + this.GetFormType() + "% Month Sent";
            else
                actionItem = "%Month " + this.GetFormType() + " Sent";

            FollowUpDA da = new FollowUpDA();
            DataTable followUpReportTable = da.GetFollowUpReportList(procType, startDate.ToShortDateString(), endDate.ToShortDateString(), actionItem);

            // now we need to create a new datatable so we can loop and add the column for Completed Date
            DataTable myTable = new DataTable();
            string[] colNames = new string[] { "PatientId", "Patient", "Survey", "Month", "Treating Physician", "Sent Date", "Received Date" };
            foreach (string colName in colNames)
            {
                myTable.Columns.Add(new DataColumn(colName));
            }

            foreach (DataRow dr in followUpReportTable.Rows)
            {
                DataRow newRow = myTable.NewRow();
                string ptName = dr[Patient.PtFirstName].ToString() + " " + dr[Patient.PtMiddleName].ToString() + " " + dr[Patient.PtLastName].ToString();
                newRow["PatientId"] = dr[Patient.PatientId].ToString();
                newRow["Patient"] = ptName;

                newRow["Treating Physician"] = da.GetMostRecentTreatingPhysician(int.Parse(dr[Patient.PatientId].ToString()));

                string actionItemStr = dr[Caisis.BOL.Action.ActionItem].ToString();
                string actionId = dr[Caisis.BOL.Action.ActionId].ToString();

                string fuMonth = FollowUpUtil.GetSurveyMonthNoFromActionItem(actionItemStr);
                newRow["Month"] = fuMonth;

                string formName = FollowUpUtil.GetSurveyNameFromActionItem(actionItemStr);

                if (this.GetFormType() == "Letter")
                {
                    formName += " " + "Follow Up Letter";
                }

                newRow["Survey"] = formName;
                newRow["Sent Date"] = DateTime.Parse(dr[Caisis.BOL.Action.ActionDate].ToString()).ToShortDateString();

                // Add Survey completed date, if it exists (we check the Surveys table)
                string completedDate = string.Empty;
                 
                //DataTable dtRec = da.GetSurveyReceived(Int32.Parse(dr[Patient.PatientId].ToString()), actionItemExpr);

                DataTable dtRec = da.GetSurveyByActionItem(Int32.Parse(dr[Patient.PatientId].ToString()), actionItemStr);
                
                if (dtRec.Rows.Count > 0 && !string.IsNullOrEmpty(dtRec.Rows[0][Survey.SurveyDate].ToString()))
                {
                    completedDate = DateTime.Parse(dtRec.Rows[0][Survey.SurveyDate].ToString()).ToShortDateString();
                }
                else
                {
                    completedDate = "--";
                }

                newRow["Received Date"] = completedDate;

                // Finally add new row to datasource
                myTable.Rows.Add(newRow);
            }

            return myTable.DefaultView;
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



        /// <summary>
        /// Returns the form type that is currently selected"  
        /// </summary>
        /// <returns>"Survey" or "Letter"</returns>
        private string GetFormType()
        {
            return ddlFormType.SelectedValue;
        }

    }
}
