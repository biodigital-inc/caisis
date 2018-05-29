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
	/// Summary description for PostOpFollowUpReport.
	/// </summary>
	/// 
	// TODO 1) remove unwanted columns from Excel Export based on op report
	// 

    public partial class PostOpFollowUpReport : BaseReportPage
	{
		protected string reportTitle;

		protected int recordCount;

        public override string ReportTitle
        {
            get
            {
                return "Post Op Follow Up Report";
            }
        }

		private string _opType;// = "RP";
		private string _institution = "memorial sloan kettering cancer center";
		private string _surgeon;
		private int _monthsSinceSurgery;
		private int _monthsSincePSA;
		private string datasetSql;

		override protected void Page_Load(object sender, System.EventArgs e)
		{
			//defaults
			RP_LP_Panel.Visible = false;
			LN_Panel.Visible = false;
			
			
			if(Page.IsPostBack)
			{
				resultMessage.Text = "";
				
				_opType = OpType.SelectedValue;
				_surgeon = OpSurgeon.SelectedValue;
				_institution = OpInstitution.SelectedValue;
				_monthsSinceSurgery = int.Parse(DateRange.SelectedValue);
				_monthsSincePSA = int.Parse(MonthsSincePSA.SelectedValue);
				datasetSql = CacheManager.GetDatasetSQL(Session[SessionKey.DatasetId]);
				
				// calculate date from today

				ReportDa da = new ReportDa();
				DataSet ds = da.GetPostOpFollowUp(_opType, _institution, _surgeon, _monthsSinceSurgery, _monthsSincePSA, datasetSql);

				recordCount = ds.Tables[0].Rows.Count;

				if (recordCount > 0)  
				{
					string sortBy = "PtMrn ASC";

					if(Request.Form["__EVENTTARGET"] != null && !Request.Form["__EVENTTARGET"].Equals("")) 
					{
						if(Request.Form["__EVENTTARGET"].Equals("SortByName"))
						{
							sortBy = "PtLastName";
						}
						else if(Request.Form["__EVENTTARGET"].Equals("SortByMonthsSinceSurgery"))
						{
							sortBy = "MonthsSinceSurgery";
						}
						else if(Request.Form["__EVENTTARGET"].Equals("SortByMonthsSincePSA"))
						{
							sortBy = "MonthsSincePSA";
						}

					}
					
					
					if(_opType.Equals("RP") || _opType.Equals("LP"))
					{
						RP_LP_Panel.Visible = true;

						DataView dv1 = ds.Tables[0].DefaultView;

						dv1.Sort = sortBy;

						RP_LP_Repeater.DataSource = dv1;
						
						RP_LP_Repeater.DataBind();
					}
					else if(_opType.Equals("LN"))
					{
						LN_Panel.Visible = true;

						DataView dv2 = ds.Tables[0].DefaultView;

						dv2.Sort  = sortBy;

						LN_Repeater.DataSource = dv2;
						
						LN_Repeater.DataBind();
					}

                    // log report view
                    base.LogReportView();
				}
				else
				{
					resultMessage.Text = "<br><br>There are no " + _institution + " " + _opType + " patients for " + _surgeon + " outside of " + _monthsSinceSurgery + " months of surgery and " + _monthsSincePSA + " months of PSA for follow-up.";
				}
			
			}
			else // not a post back; set defaults
			{


                InstitutionDa iDa = new InstitutionDa();
			
				// populate dropdown with distinct institutions from surgeries table
                DataTable instDt = iDa.GetDistinctSurgeryInstitution().Tables[0];
				OpInstitution.DataSource = instDt.DefaultView;
				OpInstitution.DataTextField = instDt.Columns[0].ColumnName;
				OpInstitution.DataValueField = instDt.Columns[0].ColumnName;
				OpInstitution.DataBind();

				// populate drop down with distint surgeons from surgeries table
                ReportDa rptDa = new ReportDa();
                DataTable surgDt = rptDa.GetDistinctSurgeons().Tables[0];
				OpSurgeon.DataSource = surgDt.DefaultView;
				OpSurgeon.DataTextField = surgDt.Columns[0].ColumnName;
				OpSurgeon.DataValueField = surgDt.Columns[0].ColumnName;
				OpSurgeon.DataBind();
				OpSurgeon.Items.Add("All");

				OpType.Items.Add("RP");
				OpType.Items.Add("LP");
				OpType.Items.Add("LN");

				DateRange.Items.Add("0");
				DateRange.Items.Add("3");
				DateRange.Items.Add("6");
				DateRange.Items.Add("12");
				DateRange.Items.Add("24");

				MonthsSincePSA.Items.Add("0");
				MonthsSincePSA.Items.Add("3");
				MonthsSincePSA.Items.Add("6");
				MonthsSincePSA.Items.Add("12");
				MonthsSincePSA.Items.Add("24");
				
				reportTitle = "Post Operation Follow Up Patients";
			}
		}

		protected void ExcelBtn_Click(object sender, System.Web.UI.ImageClickEventArgs e)
		{	
			ReportDa da = new ReportDa();
			DataSet ds = da.GetPostOpFollowUp(_opType, _institution, _surgeon, _monthsSinceSurgery, _monthsSincePSA, datasetSql);
            DataTable dt = ds.Tables[0];
			if(dt.Rows.Count > 0)
			{		
				// should remove date text and irrelevant columns
				dt.Columns.Remove("PatientId");
				dt.Columns.Remove("PtBirthDate");
				dt.Columns.Remove("SurgDate");
				dt.Columns.Remove("LabDate");
				dt.Columns.Remove("ActionDate");
				dt.Columns.Remove("LastFollowUpDate");

				// these columns only apply to ln
				if(_opType.ToLower().Equals("rp") || _opType.ToLower().Equals("lp"))
				{
					dt.Columns.Remove("PathHistology");
					dt.Columns.Remove("LastFollowUpDateText");
					dt.Columns.Remove("MonthsToLastFollowUp");
					dt.Columns.Remove("MonthsSinceFollowUp");
				}
				
				// these columsn only apply to rp and lp
				if(_opType.ToLower().Equals("ln"))
				{
					dt.Columns.Remove("LabTest");
					dt.Columns.Remove("LabDateText");
					dt.Columns.Remove("LabResult");
					dt.Columns.Remove("PostOpPSAs");
					dt.Columns.Remove("MonthsSincePSA");
					dt.Columns.Remove("ActionDateText");
					dt.Columns.Remove("ActionItem");
					dt.Columns.Remove("ActionNotes");
				}

                DataView view = ds.Tables[0].DefaultView;
                // write to excel
                base.ExportToExcel(view);
			}
			else
			{
				resultMessage.Text = "<br><br>There are no " + _institution + " " + _opType + " patients for " + _surgeon + " outside of " + _monthsSinceSurgery + " months for follow-up.";
			}
			
		}

        private void InitializeComponent()
        {
        
        }


		protected void RP_LP_Repeater_DataBound(Object Sender, RepeaterItemEventArgs e) 
		{
			
			HtmlTableRow ActionNotesRow;
			ActionNotesRow = (HtmlTableRow) e.Item.FindControl("ActionNotesRow");

			if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem) 
			{
				if (((DataRowView) e.Item.DataItem )["ActionNotes"] != null && ((DataRowView) e.Item.DataItem )["ActionNotes"].ToString().Length > 0)
				{
					ActionNotesRow.Visible = true;
				}
				else
				{
					ActionNotesRow.Visible = false;
				}
			}
		}
	}
}
