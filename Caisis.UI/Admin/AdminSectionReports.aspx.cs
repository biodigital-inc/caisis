using System;
using System.Collections;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Web;
using System.Web.SessionState;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;

using System.Xml;
using System.Linq;

using Caisis.DataAccess;
using Caisis.BOL;
using Caisis.UI.Core.Classes;

using Caisis.Controller;

namespace Caisis.UI.Admin
{
	/// <summary>
	/// Summary description for AdminSectionReports.
	/// </summary>
	public partial class AdminSectionReports : AdminBasePage
	{
	    #region declarations
	    //go through these to wich are really needed in this scope

        //Set these from user selections
        private string report = "";
        //protected int pageSize = 100;
        private DateTime fromDate = DateTime.MinValue;
        private DateTime toDate = DateTime.MaxValue;  
        private ReportConfigurations reportConfigurations;
        protected bool showReportInfo = false;
        private bool ignoreDdlReportSelectedIndexChanged = false;
        //these are primarily for development and testing use 
        //to create 'failsafe' mode
        protected bool autoGenerateColumns = false;   //false default
        protected bool enableRowViewState = false;    //false default
        protected bool showFooterPager = false;
        protected bool insertSeperatorRows = true;    //true default
        
        #endregion

        override protected void OnInit(EventArgs e)
        {
            InitializeComponent();
            base.OnInit(e);
        }

        private void InitializeComponent()
        {
            this.Load += new System.EventHandler(this.Page_Load);
        }
       
        override protected void Page_Load(object sender, System.EventArgs e)
		{
		    //Fix for problem with events disappearing in editor
		    AttachEvents();
            // Put user code to initialize the page here
            base.Page_Load(sender, e);
            
            if(Page.IsPostBack)
            {
                 createCustomPagerControls();
                 ignoreDdlReportSelectedIndexChanged = false;
            }
            
            dgAdminReport.Visible = false;
            lblAdminReportInfo.Visible = false;
            
            //ReportConfigurations must be made serializable to be put in ViewState
            //
            //            if (ViewState["reportConfigurations"]  == null)
            //            {
            //                reportConfigurations = new ReportConfigurations();
            //                reportConfigurations.LoadReportsFromXml();
            //                ViewState.Add("reportConfigurations",reportConfigurations); 
            //            }
            //            else
            //            {
            //                reportConfigurations = (ReportConfigurations)ViewState["reportConfigurations"];
            //            }
            //            
            //For now, load xml on every page load
            //The admin reports will probably not be oftens enough for this to be
            //a performace issue
            reportConfigurations = ReportConfigurations.LoadFromXml(ReportConfigurationType.Admin);
                 
            SetDefaultLayout();
            BuildReportMenu();
            
            SetUpPaging();
            SetUpTimePeriod();
            
            SetReportInUse();
            
            //TODO BUG if a grid is loaded and combobox index changes the previous dataset i reloaded from database also when report summary is shown
            //causes a performance hit because of extra database query, but only noticable if a really large dataset has been loaded
            ShowReport(report);
            
            ShowReportOverview();
            
            ConfigureMenu();
            
        }
		
		private void SetDefaultLayout()
		{  
            lblAdminPage.Visible = false;
            btnExport.Enabled = false;
		}

        private void AttachEvents()
        {
            dgAdminReport.ItemCreated += new DataGridItemEventHandler(dgAdminReport_ItemCreated);
            dgAdminReport.PreRender += new EventHandler(dgAdminReport_PreRender);
            dgAdminReport.SortCommand += new DataGridSortCommandEventHandler(dgAdminReport_SortCommand);
            dgAdminReport.PageIndexChanged += new DataGridPageChangedEventHandler(dgAdminReport_PageIndexChanged);
            ddlReportMenu.SelectedIndexChanged += new EventHandler(this.ddlReportMenu_SelectedIndexChanged);
            btnShowReport.Click += new EventHandler(this.showReport_Click);
            btnExport.Click += new EventHandler(btnExport_Click);
        }

		#region Report Drop Down

		    private void SetReportInUse()
		    {
                if(Request.QueryString["report"] != null && Request.Cookies["AdminReportUseQuerystring"].Value == "true")
                {
                    if(txtDllReportLast.Text == "" || txtDllReportLast.Text == ddlReportMenu.SelectedValue)
                    {
                        report = Request.QueryString["report"].ToString();
                        ignoreDdlReportSelectedIndexChanged = true;
                        ddlReportMenu.SelectedValue = report;
                        txtDllReportLast.Text = report;
                     }
                }
                else
                {
                    report = txtReportHidden.Text;
                }
		    }
		         
            private void BuildReportMenu()
            {
                tblReportMenu.Visible = false;
                if(!Page.IsPostBack)
                {
                    ddlReportMenu.DataSource = reportConfigurations.Reports;
                    ddlReportMenu.DataValueField = "ID";
                    ddlReportMenu.DataTextField = "Title";
                    ddlReportMenu.DataBind();
                    ddlReportMenu.AutoPostBack = true;
                    btnShowReport.Attributes.Add("onClick","clearOldReportInfo();setUseQueryStringCookieNot();");
                    ddlReportMenu.Attributes.Add("OnSelectedIndexChanged","setUseQueryStringCookieNot();clearOldReportInfo();");
                    btnExport.Attributes.Add("onClick","setUseQueryStringCookieNot();");
                    
                }
            }
            public void ddlReportMenu_SelectedIndexChanged(object sender, EventArgs e)
            {
                if(!ignoreDdlReportSelectedIndexChanged)
                {
                    txtReportHidden.Text = "";
                    dgAdminReport.Visible = false;
                    lblAdminReportInfo.Visible = true;
                    if (sender is DropDownList)
                    {
                        string id = ddlReportMenu.SelectedValue;
                        lblAdminReportInfo.Text = "<span class=reportInfoHeading>" 
                            + reportConfigurations[id].Title
                            + "</span><br />"
                            + reportConfigurations[id].Description
                            + "<br /><br />";
                            
                        txtAdditionalFilter1.Text = "";
                        ReportsDesc.Visible = false;
                    }
                    ConfigureMenu();
                    txtDllReportLast.Text = ddlReportMenu.SelectedValue;
                 }
            }
         #endregion  
		
        #region More Admin Menu Stuff
        
        private void SetUpTimePeriod()
        {
            bool setFromDate = false;
            bool setToDate = false;
            
            PageUtil.AddCalendarFunction(txtFromDateCal, txtFromDate);
            PageUtil.AddCalendarFunction(txtToDateCal, txtToDate);
            
            if (!Page.IsPostBack)
            {
                toDate = DateTime.Now;
                fromDate = toDate.AddDays(-30);
                setFromDate = true;
                setToDate = true;
            }
            else
            {  
                if (PageUtil.IsDate(txtFromDate.Value))
                {
                    fromDate = DateTime.Parse(txtFromDate.Value);
                    setFromDate = true;
                }
                if (PageUtil.IsDate(txtToDate.Value))
                {
                    toDate = DateTime.Parse(txtToDate.Value);
                    setToDate = true;
                }
            }
            if (setFromDate)
            {
                txtFromDate.Value = PageUtil.ObjToDateString(fromDate);
            }
            else
            {
                txtFromDate.Value = "";
            }
            if (setToDate)
            {
                txtToDate.Value = PageUtil.ObjToDateString(toDate);
            }
            else
            {
                txtToDate.Value = "";
            }    
        }
        private void SetUpPaging()
        {
            if (!Page.IsPostBack || ddlPageSize.SelectedValue.Length == 0)
            {
                ddlPageSize.Items.Add("[ALL]");
                ddlPageSize.Items.Add("10");
                ddlPageSize.Items.Add("20");
                ddlPageSize.Items.Add("50");
                ddlPageSize.Items.Add("100");
                ddlPageSize.Items.Add("200");
                ddlPageSize.Items.Add("500");
                ddlPageSize.Items.Add("1000");
                ddlPageSize.Items.Add("2000");
                    
                ddlPageSize.SelectedValue = "20";
            }
            if (ddlPageSize.SelectedValue == "[ALL]")
            {
                dgAdminReport.AllowPaging = false;
            }
            else
            {
                dgAdminReport.AllowPaging = true;
                dgAdminReport.PageSize = int.Parse(ddlPageSize.SelectedValue);
            }
        }
		
        private void ConfigureMenu()
        {
            string sReport = ddlReportMenu.SelectedValue;
            ReportConfiguration rprt = reportConfigurations[sReport];
            if (rprt.UseFilter)
            {   
                //only support for one search criteria in gui, but object stores array of columns
                //so the gui could be extended
                string[] cols = rprt.GetSearchableColumns();
                lblAdditionalFiltering.Text = cols[0];
                string[] matchesToSearchFor = rprt.MatchesToSearchFor(lblAdditionalFiltering.Text);
                if (matchesToSearchFor == null)
                {
                    txtAdditionalFilter1.Visible = true;
                    txtAdditionalFilter1.CssClass = "DisplayInline";
                    ddlAdditionalFilter1.Visible = true;
                    ddlAdditionalFilter1.CssClass = "DisplayNone";
                    ddlAdditionalFilter1.Items.Clear();
                }
                else
                {
                    if(ddlAdditionalFilter1.Items.FindByText(matchesToSearchFor[0]) == null)
                    { 
                        ddlAdditionalFilter1.Items.Clear();
                        txtAdditionalFilter1.Visible = true;
                        txtAdditionalFilter1.CssClass = "DisplayNone";
                        ddlAdditionalFilter1.Visible = true;
                        ddlAdditionalFilter1.CssClass = "DisplayInline";
                        for(int i = 0;i<matchesToSearchFor.Length;i++)
                        {
                            ddlAdditionalFilter1.Items.Add(matchesToSearchFor[i].ToString());
                        }
                     }
                }
            }
            else
            {
                ddlAdditionalFilter1.Items.Clear();
                lblAdditionalFiltering.Text = "N/A";
                lblAdditionalFiltering.Visible = true;
                txtAdditionalFilter1.Text = "";
                txtAdditionalFilter1.Visible = true;
                txtAdditionalFilter1.CssClass = "DisplayNone";
                ddlAdditionalFilter1.Visible = true;
                ddlAdditionalFilter1.CssClass = "DisplayNone";
                ddlAdditionalFilter1.SelectedIndex = -1;
                
            }
            if(rprt.HasHiddenColumns)
            {
                bool doNotShowAll = false;
                if(!rbNotAllColumns.Enabled)
                {
                    doNotShowAll = true;
                }
                rbAllColumns.Enabled = true;
                rbNotAllColumns.Enabled = true;
                if (rbNotAllColumns.Checked || doNotShowAll)
                {
                    rbNotAllColumns.Checked = true;
                    rbAllColumns.Checked = false;
                }
                else
                {
                    rbNotAllColumns.Checked = false;
                    rbAllColumns.Checked = true;
                }
            }
            else
            {
                rbAllColumns.Enabled = true;
                rbNotAllColumns.Enabled = false;
                rbNotAllColumns.Checked = false;
                rbAllColumns.Checked = true;
            }
            if (rprt.UseTimePeriod)
            {
                txtFromDate.Visible  = true;
                txtFromDateCal.Visible = true;
                txtToDate.Visible  = true;
                txtToDateCal.Visible = true;
                lblFromDate.Text = "From:";
                lblToDate.Text = "To:";
            }
            else
            {
                txtToDate.Visible = false;
                txtToDateCal.Visible = false;
                txtFromDate.Visible = false;
                txtFromDateCal.Visible = false;
                lblFromDate.Text = "N/A";
                lblToDate.Text = "";
            }
            if(rprt.UsePageSize)
            {
                ddlPageSize.Enabled = true;
            }
            else
            {
                ddlPageSize.Enabled = false;
            }
            if (rprt.UseExport)
            {
                lblNoExport.Text = "";
                ((TableCell)lblNoExport.Parent).CssClass = "OuterOptionsTableCellRightAlign";
                btnExport.Visible = true;
            }
            else
            {
                lblNoExport.Text = "N/A";
                ((TableCell)lblNoExport.Parent).CssClass = "OuterOptionsTableCellLeftAlign";
                btnExport.Visible = false;
            }
        }
        #endregion

        #region Show Report
        
        private void showReport_Click(object sender, System.EventArgs e)
        {
            dgAdminReport.CurrentPageIndex = 0;
            report = ddlReportMenu.SelectedValue;
            txtReportHidden.Text = report;
            ShowReport(report);
        }
        
        private void ShowReport(string useReport)
        {
            if (useReport.Length < 1)
            {   
                showReportInfo = true;
                return;
            }
              
            DataSet ds = new DataSet();
            bool bindData = true;
           
            AdminReportsDa da = new AdminReportsDa();
            
            ReportConfiguration rprt = reportConfigurations[useReport];
            string datasetSql = CacheManager.GetDatasetSQL(System.Web.HttpContext.Current.Session[SessionKey.DatasetId]);

            if(rprt.UseGenericReportFormat)
            {
                bindData = true;
                lblPageTitle.Text = rprt.Title;
                string paramName = null;
                string paramValue = null;
                if(lblAdditionalFiltering.Text != "N/A")
                {
                    paramName = lblAdditionalFiltering.Text;
                        
                    if(txtAdditionalFilter1.CssClass != "DisplayNone")
                    {
                        paramValue = txtAdditionalFilter1.Text;
                    }
                    else
                    {
                        paramValue = ddlAdditionalFilter1.SelectedItem.Text;
                    }
                  
                }
                if(Request.QueryString["paramValue"] != null && Request.Cookies["AdminReportUseQuerystring"].Value == "true")
                {
                    paramValue = Request.QueryString["paramValue"];
                    paramName = Request.QueryString["paramName"];
                    lblAdditionalFiltering.Text = paramName;
                    txtAdditionalFilter1.Text = paramValue;
                }
                if(rprt.UseTimePeriod)
                {
                    ds = da.GetAdminReport(null, rprt.StoredProcedure, paramName, paramValue, txtFromDate.Value, txtToDate.Value, false);
                }
                else
                {
                    ds = da.GetAdminReport(null, rprt.StoredProcedure, paramName, paramValue, false);
                }
            }
            else
            {
                #region userSummary
                if(useReport == "UserSummary")
                {
                    if (ddlReportMenu.SelectedValue != "UserSummary") 
                    {   
                        if(Page.IsPostBack || Request.QueryString["report"] == null || Request.QueryString["report"].ToString() != "UserSummary")
                        {
                            return;
                        }
                    }
                    lblAdminReportInfo.Visible = false;
                    lblAdminPage.Visible = true;
                    dgAdminReport.Visible = false;
                    
                    string iUserId;
                    string userName, userFirstName, userLastName, userEmail,enteredBy,updatedBy;
                    string enteredTime, updatedTime, deactivatedTime;
                    TimeSpan timespan;
                    
                    Label lblAdminReportSubHeading2 = new Label();
                    
                    lblAdminPage.Controls.Add(lblAdminReportSubHeading2);
                    
                    if(Request.QueryString["paramName"] == "userName" && Request.Cookies["AdminReportUseQuerystring"].Value == "true")
                    {
                        userName = Request.QueryString["paramValue"];
                    }
                    else
                    {
                        userName = txtAdditionalFilter1.Text;
                    }
                    
                    ds = da.GetUserInfo(userName);
                    
                    if(ds.Tables[0].Rows.Count != 1)
                    {
                        lblAdminReportSubHeading2.Text = "No matching user found.";
                        lblAdminReportSubHeading2.Visible = true;
                    }
                    else
                    {
                        //TODO FIX "username" etc
                        iUserId = ds.Tables[0].Rows[0]["UserId"].ToString();
                        userName = ds.Tables[0].Rows[0]["UserName"].ToString();
                        userFirstName = ds.Tables[0].Rows[0]["UserFirstName"].ToString();
                        userLastName = ds.Tables[0].Rows[0]["UserLastName"].ToString();
                        userEmail = ds.Tables[0].Rows[0]["UserEmail"].ToString();
                        enteredBy = ds.Tables[0].Rows[0]["EnteredBy"].ToString();
                        updatedBy = ds.Tables[0].Rows[0]["UpdatedBy"].ToString();
                        enteredTime = ds.Tables[0].Rows[0]["EnteredTime"].ToString();
                        updatedTime = ds.Tables[0].Rows[0]["UpdatedTime"].ToString();
                        
                        if(PageUtil.IsDate(updatedTime))
                        {
                            timespan = DateTime.Now - DateTime.Parse(updatedTime);
                        }
                        else
                        {
                            timespan = DateTime.Now - DateTime.Parse(enteredTime);
                        }
                        
                        deactivatedTime = ds.Tables[0].Rows[0]["DeactivatedTime"].ToString();
                        lblPageTitle.Text = "User Summary: " + userName;
                        
                        lblAdminReportSubHeading2.Text = "<table><tr><td width=100>First name:</td><td>" + userFirstName + "</td></tr>" +
                            "<tr><td>Last name:</td><td>" + userLastName + "</td></tr>" +
                            "<tr><td>Email:</td><td><a href=\"mailto:" + userEmail + "\">" + userEmail + "</a></td></tr>" +
                            "<tr><td>Entered time:</td><td>" + enteredTime + "</td></tr>" +
                            "<tr><td>Entered by:</td><td>" + enteredBy + "</td></tr>" +
                            "<tr><td>Updated time:</td><td>" + updatedTime + "</td></tr>" +
                            "<tr><td>Updated by:</td><td>" + updatedBy + "</td></tr>" +
                            "<tr><td>Days since update:</td><td>" + timespan.Days.ToString() + "</td></tr>" +
                            "<tr><td>Deactivated time:</td><td>" + deactivatedTime + "</td></tr></tr></table><br><br>" +
                            "<b>Last 5 logins for this user:</b> <br>";
                        
                        lblAdminReportSubHeading2.Visible = true;
                        
                        Label lblAdminReportSubHeading3 = new Label();
                        
                        DataGrid dgAdminReport01 = new DataGrid();
                        lblAdminPage.Controls.Add(dgAdminReport01);
                        lblAdminPage.Controls.Add(lblAdminReportSubHeading3);
                        
                        ds = da.GetUsersLastFiveLogins(userName);
                        
                        if (ds.Tables[0].Rows.Count < 1)
                        {
                            lblAdminReportSubHeading2.Text += "<br>No logins for this user.<br><br>"; 
                            bindData = false;
                            dgAdminReport01.Visible = false;
                         }
                        else
                        {
                            dgAdminReport01.AutoGenerateColumns = true;
                            dgAdminReport01.DataSource = ds.Tables[0].DefaultView;
                            dgAdminReport01   .DataBind();
                            dgAdminReport01.Width = 630;
                            dgAdminReport01.CssClass = "DatagridTable";
                            lblAdminReportSubHeading3.Text = "<a href=AdminSectionReports.aspx?report=LoginsForUser&paramValue=" + userName + "&paramName=userName onClick=\"javascript:setUseQueryStringCookie();\">View all logins for this user.</a><br><br>";
                        }
                        lblAdminReportSubHeading3.Visible = true;
                        lblAdminReportSubHeading3.Text += "<b>Last 5 patient views for this user:</B> <br>";
                        
                        lblAdminPage.Controls.Add(lblAdminReportSubHeading3);
                        
                        DataGrid dgAdminReport2 = new DataGrid();
                        lblAdminPage.Controls.Add(dgAdminReport2);
                        DataSet ds2 = new DataSet();
                        ds2 = da.GetUsersLastFivePatientViews(iUserId);
                        dgAdminReport2.Width = 630;
                        dgAdminReport2.Visible = true;
                        Label lblAdminReportSubHeading4 = new Label();
                        lblAdminPage.Controls.Add(lblAdminReportSubHeading4);
                        
                        if (ds2.Tables[0].Rows.Count < 1)
                        {
                            dgAdminReport2.Visible = false;
                            lblAdminReportSubHeading3.Text += "<br>No patient views for this user.";
                        }
                        else
                        {
                            dgAdminReport2.AutoGenerateColumns = true;
                            dgAdminReport2.DataSource = ds2.Tables[0].DefaultView;
                            dgAdminReport2   .DataBind();
                            lblAdminReportSubHeading4.Visible = true;
                            lblAdminReportSubHeading4.Text = "<a href=AdminSectionReports.aspx?report=PatientsViewsByUser&paramValue=" + userName + "&paramName=userName onClick=\"javascript:setUseQueryStringCookie()\">View all patient views for this user.</a>";                 
                            }
                        
                        /*user record changes*/
                        
                        DataGrid dgAdminReport3 = new DataGrid();
                        lblAdminPage.Controls.Add(dgAdminReport3);
                        DataSet ds3 = new DataSet();
                        ds3 = da.GetUsersLastFiveRecordChanges(iUserId);
                        dgAdminReport3.Width = 630;
                        dgAdminReport3.Visible = true;
                        
                        lblAdminReportSubHeading4.Text += "<br><br><b>Last 5 user record changes:</b> <br>";
                        
                        Label lblAdminReportSubHeading5 = new Label();
                        if (ds3.Tables[0].Rows.Count < 1)
                        {
                            dgAdminReport3.Visible = false;
                            lblAdminReportSubHeading4.Text += "<br>No patient views for this user.";
                        }
                        else
                        {
                            dgAdminReport3.AutoGenerateColumns = true;
                            dgAdminReport3.DataSource = ds3.Tables[0].DefaultView;
                            dgAdminReport3   .DataBind();
                            lblAdminReportSubHeading5.Visible = true;
                            lblAdminReportSubHeading5.Text = "<a href=AdminSectionReports.aspx?report=UsersRecordChanges&paramValue=" + userName + "&paramName=userName onClick=\"javascript:setUseQueryStringCookie()\">View all record changes for this user.</a><br>";                 
                            
                        }
                        lblAdminPage.Controls.Add(lblAdminReportSubHeading5);
                        
                        /*users groups*/
                        
                        DataGrid dgAdminReport4 = new DataGrid();
                        lblAdminPage.Controls.Add(dgAdminReport4);
                        DataSet ds4 = new DataSet();
                        ds4 = da.GetAdminReport(null, "spRptAdminGetAUsersGroups","UserId",iUserId,false);
                        dgAdminReport4.Width = 630;
                        dgAdminReport4.Visible = true;
                        
                        lblAdminReportSubHeading5.Text += "<br><br><b>This user belongs to the following groups: </b><br>";
                        
                        if (ds4.Tables[0].Rows.Count < 1)
                        {
                            dgAdminReport4.Visible = false;
                            lblAdminReportSubHeading5.Text += "<br>This user does not belong to any group.";
                        }
                        else
                        {
                            dgAdminReport4.AutoGenerateColumns = true;
                            dgAdminReport4.DataSource = ds4.Tables[0].DefaultView;
                            dgAdminReport4   .DataBind();
                        }
                    }
                    bindData = false;
                    
                }
                #endregion
            }
            if(bindData)
            {   
                doBindData(ds);
                btnExport.Enabled = true;
            }
    }
        
        private void ShowReportOverview()
        {
            if (!showReportInfo)
            {
                lblAdminReportInfo.Visible = false;
                ReportsDesc.Visible = false;
                return;
            }
            lblPageTitle.Text = "";
            lblAdminReportInfo.Visible = true;
            ReportsDesc.Visible = true;
            
            // bind rptr desc to list of reports
            ReportsListRptr.DataSource = reportConfigurations.Reports;
            ReportsListRptr.DataBind();

            //lblAdminReportInfo.Text = "Please select a report in the drop down menu to the left." +
            //"<br /><br />Use the date filter function below the left menu to show data for a chosen time period. The default time period is last 30 days." +
            //"<br /><br />For some reports additional filtering can be applied." +
            //"<br /><br />Click 'Export to Excel' to export the selected report to Excel." +
            //"<br /><br /><span class=reportInfoHeading>Available reports:</span><br />";

            //for (int i = 0; i < reportConfigurations.Count; i++)
            //{
            //    lblAdminReportInfo.Text += "<span class=reportInfoHeading>"
            //         + reportConfigurations[i].Title
            //         + "</span><br />"
            //         + reportConfigurations[i].Description
            //         + "<br /><br />";
            //}
        }

        /// <summary>
        /// Supress Reports List when reports title is hidden
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void ShowHideHelpDesc(object sender, EventArgs e)
        {
            if (!lblAdminReportInfo.Visible)
            {
                ReportsDesc.Visible = false;
            }
        }
        
        private void doBindData(DataSet ds)
        {   
            dgAdminReport.Visible = true;
                
            if(autoGenerateColumns)
            {
                dgAdminReport.AutoGenerateColumns = true;
            }
            else
            {   
                dgAdminReport.AutoGenerateColumns = false;
                CreateTemplateColumns(dgAdminReport,ds.Tables[0]);
            }
            dgAdminReport.DataSource = ds.Tables[0].DefaultView;
            dgAdminReport   .DataBind();
            dgAdminReport.Visible = true;
            lblAdminReportInfo.Visible = false;
            txtReportHidden.Text = report;
        }
        
        #endregion
        
        #region DataGridRelated
            
            private HyperLinkColumn createHyperLinkColumn(string dataTextField,string dataTextFormatString,string dataNavigateUrlField,string headerText,string goToReport, string param)
            {
                DateTime fromDate = DateTime.Parse(txtFromDate.Value);
                string fDate = fromDate.ToString("yyyyMMdd");
                DateTime toDate = DateTime.Parse(txtToDate.Value);
                string tDate = toDate.ToString("yyyyMMdd");
                HyperLinkColumn linkColumn = new HyperLinkColumn();
                linkColumn.DataTextField = dataTextField;
                linkColumn.DataTextFormatString = dataTextFormatString; //"{0}"
                linkColumn.DataNavigateUrlField = dataNavigateUrlField;
                linkColumn.DataNavigateUrlFormatString = 
                    "AdminSectionReports.aspx?" +
                    "order=" + txtSortOrderHidden.Text + 
                    "&sortBy=" + txtSortByColumnHidden.Text + 
                    "&pageSize=" + ddlPageSize.SelectedValue + 
                    "&fromDate=" + fDate + 
                    "&toDate=" + tDate + 
                    "&report=" + goToReport + 
                    "&paramName=" + param + 
                    "&paramValue={0}";
                    //"&" + param + "={0}";
                linkColumn.HeaderText = headerText;
                linkColumn.HeaderStyle.CssClass = "AdminReportHeader DataGridFixedHeader";
                
                return linkColumn;
            }
            private void CreateTemplateColumns(DataGrid dtg,DataTable dt)
                {
                        ReportConfiguration rprt = reportConfigurations[report];
                        for( int c=0; c<dt.Columns.Count; c++ )
                        {
                            string columnName = "";
                            columnName = dt.Columns[c].ColumnName;
                            ReportConfiguration.ColumnMode columnMode = rprt.ColumnDisplay(columnName);
                            
                            if(columnMode == ReportConfiguration.ColumnMode.ShowAsHyperLink)
                            {
                                ReportHyperLinkColumn hcol = rprt.GetHyperLinkColumn(columnName);
                                HyperLinkColumn linkColumn = createHyperLinkColumn(hcol.DataTextField,hcol.DataTextFormatString,hcol.DataNavigateUrlField,hcol.HeaderText,hcol.GoToReport,hcol.Param);
                                dtg.Columns.Add(linkColumn);
                            }
                            else if(columnMode == ReportConfiguration.ColumnMode.ShowAsNormal || rbAllColumns.Checked)
                            {
                                BoundColumn bc = new BoundColumn();
                                bc.DataField = columnName;
                                bc.HeaderText =  columnName;
                                bc.SortExpression = columnName;
                                dtg.Columns.Add( bc );
                            }
                        }
                    
                    }
            
            private void addSeparatorRows(DataGrid dtg)
            {
                if(insertSeperatorRows)
                {
                    Table Tbl = (Table)dtg.Controls[0];
                    
                    //Extra row above heading needed for layout
                    //heading text gets cut at top otherwise
                    int topSeparatorRowIndex = 2; //Account for pager row
                    
                    //Adjust for ALL, paging = false
                    int AllAdjust = 0;
                    if (dtg.AllowPaging == false)
                    {
                        AllAdjust = - 1;
                        topSeparatorRowIndex=1;
                    }
                    //add rows
                    for (int i = Tbl.Rows.Count - 2;i > (0 + AllAdjust);i -= 1)
                    {
                        DataGridItem DGI;
                        TableCell Cell;
                        
                        DGI = new DataGridItem (0, 0, ListItemType.Item);
                        DGI.CssClass = "ListManDataTableDottedLine";
                        
                        Cell = new TableCell();
                        Cell.ColumnSpan = dtg.Columns.Count;
                        Cell.Text = "<img src=\"../Images/shim.gif\" width=\"1\" height=\"1\">";
                        DGI.Cells.Add(Cell);
                        
                        //fixed if first seperator under header
                        if(i == topSeparatorRowIndex)
                        {
                            DGI.CssClass += " DataGridFixedHeader";
                        }
                        Tbl.Controls.AddAt(i, DGI);
                    }
                }
            }

                
            #region datagrid events
            private void dgAdminReport_SortCommand(object source, DataGridSortCommandEventArgs e)
            {
                txtSortByColumnHidden.Text = e.SortExpression;
                if (txtSortOrderHidden.Text == "ASC")
                {
                    txtSortOrderHidden.Text = "DESC";
                }
                else
                {
                    txtSortOrderHidden.Text = "ASC";
                }   
            }
            private void dgAdminReport_PreRender(object sender, EventArgs e)
            {
                DataGrid dtg = (DataGrid)sender;
                 
                string txt;
                txt = ((DataView)dtg.DataSource).Count.ToString() + "&nbsp;records&nbsp;found.&nbsp;&nbsp;Page&nbsp;" + (dgAdminReport.CurrentPageIndex + 1).ToString() + "&nbsp;of&nbsp;" + dgAdminReport.PageCount + ".&nbsp;";
                txtRecordCount.Text = txt;
                    
                if(txtSortByColumnHidden.Text.Length > 0)
                {
                    DataView dv = ((DataView) dtg.DataSource);
                    //sort changed?
                    if(dv.Sort != txtSortByColumnHidden.Text + ' ' + txtSortOrderHidden.Text)
                    {
                        dv.Sort = txtSortByColumnHidden.Text + ' ' + txtSortOrderHidden.Text;
                        dtg.DataSource = dv;
                        dtg.DataBind(); //rebind to apply late sort
                        dtg.CurrentPageIndex = 0;//allways go to first page after sort
                    }
                }
                   
                labelCustomPagerControls();
                addSeparatorRows(dtg);
            }
            private void dgAdminReport_ItemCreated(object sender, DataGridItemEventArgs e)
            {
            ListItemType itemType = e.Item.ItemType;
            // Is newly created item a pager?
                if (itemType == ListItemType.Pager)
                {   
                    if (!showFooterPager)
                    {
                        e.Item.Visible = false;
                    }
                }
                else if (itemType == ListItemType.Header)
                 {   
                    foreach (TableCell cell in e.Item.Cells)
                    {
                        try
                        {
                            LinkButton lb = (LinkButton) cell.Controls[0];
                            
                            if(lb != null)
                            {
                                lb.Attributes.Add("onClick","setUseQueryStringCookieNot();");
                            }
                        
                            lb.ToolTip = "Sort By " + lb.Text;
                        }
                        catch{}
                    }
                 } 
                
            if (itemType != ListItemType.Header)
            {
                //turn off viewstate for individual rows
                //reduces size of viewstate considerably 
                //while still retaining built in datagrid functions such as paging and sortíng events
                if(!enableRowViewState)
                {
                    e.Item.EnableViewState = false;
                }
            }
               
        }
            #endregion
            
            #region SetUpustomPagerControl
            private void createCustomPagerControls()
            {
                TableCell pagerParent = tcHeadingPager;
                int noOfControls = dgAdminReport.PagerStyle.PageButtonCount;
                    
                LinkButton lnkPrev = new LinkButton();
                pagerParent.Controls.Add(lnkPrev);
                lnkPrev.ID = "lnkPrev";
                lnkPrev.Text = "«";
                lnkPrev.Click +=new EventHandler(this.pagerLnk_Click);
                lnkPrev.Visible = false;
                lnkPrev.CssClass = "DisplayNone";
                lnkPrev.ToolTip = "First page";
                    
                Label lblPrev = new Label();
                pagerParent.Controls.Add(lblPrev);
                lblPrev.ID = "lblPrev";
                lblPrev.Text = "«";
                lblPrev.Visible = false;
                lblPrev.CssClass = "DisplayNone";
                    
                for(int i = 0;i<noOfControls;i++)
                {
                    Label newLbl = new Label();
                    pagerParent.Controls.Add(newLbl);
                    newLbl.ID = "lbl" + i.ToString();
                    newLbl.Text = "";(i + 1).ToString();
                    newLbl.Visible = false;
                    newLbl.CssClass = "DisplayNone";
                        
                    LinkButton pagerLnk = new LinkButton();
                    pagerParent.Controls.Add(pagerLnk);
                    pagerLnk.ID = "lnk" + i.ToString();
                    pagerLnk.Text = "";(i + 1).ToString();
                    pagerLnk.Click +=new EventHandler(this.pagerLnk_Click);
                    pagerLnk.Visible = false;
                    pagerLnk.CssClass = "DisplayNone";
                }
                    
                LinkButton lnkNext = new LinkButton();
                pagerParent.Controls.Add(lnkNext);
                lnkNext.ID = "lnkNext";
                lnkNext.Text = "»";
                lnkNext.Click +=new EventHandler(this.pagerLnk_Click);
                lnkNext.Visible = false;
                lnkNext.CssClass = "DisplayNone";
                lnkNext.ToolTip = "Last page";
                    
                Label lblNext = new Label();
                pagerParent.Controls.Add(lblNext);
                lblNext.ID = "lblNext";
                lblNext.Text = "»";
                lblNext.Visible = false;
                lblNext.CssClass = "DisplayNone";
                    
            }
               
            private void labelCustomPagerControls()
        {
            int noOfPagerControls = dgAdminReport.PagerStyle.PageButtonCount;
            int noOfPages = dgAdminReport.PageCount;
            int currentPage = dgAdminReport.CurrentPageIndex;
            int currentPageControlPosition = currentPage;
            int pageOffset = 0;
           // bool showPrev = false;
           // bool showNext = false;
            
            if (noOfPages == 1)
            {
                noOfPagerControls = -1;
            }
            else if (noOfPagerControls > noOfPages)
            {
                noOfPagerControls = noOfPages;
            }
            
            // Page Offset
            if (noOfPages > noOfPagerControls)
            {
                int addindex = 0;
                int middleCtrl = (int)(noOfPagerControls / 2);
                
                if (currentPage + 1 > (noOfPages - middleCtrl))
                {
                    //addindex = (noOfPages - middleCtrl) - noOfPages + 1;
                    addindex = noOfPages - (currentPage + 1) - middleCtrl;
                }
                if (currentPage < middleCtrl)
                {
                    addindex = middleCtrl - currentPage;
                }
                currentPageControlPosition = middleCtrl - addindex;
                pageOffset = noOfPages - (noOfPages -currentPage) - middleCtrl + addindex;   
            }
            //Label
            
            Label lbltest = (Label)tcHeadingPager.FindControl("lbl0");
            if(lbltest == null)
            {
                createCustomPagerControls();
            }
            for(int i = 0;i<noOfPagerControls;i++)
            {
                if(i == currentPageControlPosition)
                {
                    Label lbl = (Label)tcHeadingPager.FindControl("lbl" + i);
                    
                    lbl.Text = (i + 1 + pageOffset).ToString();
                    if(i == 1 && lbl.Text != "2")
                    {
                        lbl.Text = "..." + lbl.Text;
                        lbl.CssClass = "HeaderPagerNoMargin CurrentPageInPager";
                    }
                    else
                    {
                        lbl.CssClass = "DisplayInline  CurrentPageInPager";
                    }
                    lbl.Visible = true;
                    
                }
                else
                {
                    LinkButton lnk = (LinkButton)tcHeadingPager.FindControl("lnk" + i);
                    lnk.Text = (i + 1 + pageOffset).ToString();
                    this.ViewState.Add(lnk.ID,(lnk.Text));
                    if (lnk.CssClass != "HeaderPagerNoMargin")
                        lnk.CssClass = "DisplayInline";
                    lnk.Visible = true;
                }
            }
            if(noOfPages > 1)
            {
                if(currentPage != 0)
                {
                    LinkButton lnk = (LinkButton)tcHeadingPager.FindControl("lnkPrev");
                    lnk.Visible = true;
                    lnk.CssClass = "DisplayInline";
                }
                else
                {
                    Label lbl = (Label)tcHeadingPager.FindControl("lblPrev");
                    lbl.Visible = true;
                    lbl.CssClass = "DisplayInline  CurrentPageInPager";
                }
                if(currentPage == noOfPages -1)
                {
                    Label lbl = (Label)tcHeadingPager.FindControl("lblNext");
                    lbl.Visible = true;
                    lbl.CssClass = "DisplayInline  CurrentPageInPager";
                }
                else
                {
                    LinkButton lnk = (LinkButton)tcHeadingPager.FindControl("lnkNext");
                    lnk.Visible = true;
                    lnk.CssClass = "DisplayInline  CurrentPageInPager";
                }
            }                        
        }
        
        #endregion
        
            #region onpaging
            //Datagrids own pager hidden on itemcreated so this could be removed...:
            private void dgAdminReport_PageIndexChanged(object source, DataGridPageChangedEventArgs e)
            {
                setCurrentPageOnPaging(e.NewPageIndex);
            }        
            
            
            //custom pager event
            private void pagerLnk_Click(object sender, EventArgs e)
            {   
                int gotopage = 0;
                string btnId;
                LinkButton lnkbtn = (LinkButton)sender;
                btnId = lnkbtn.ID;
                
                if(btnId == "lnkPrev")
                {
                    gotopage = 0;
                }
                else if(btnId == "lnkNext")
                {
                    gotopage = dgAdminReport.PageCount - 1;
                }
                else if (PageUtil.IsInteger(this.ViewState[btnId].ToString()))
                {
                    gotopage = int.Parse(this.ViewState[btnId].ToString()) - 1;
                }
                setCurrentPageOnPaging(gotopage);
            }
            
            
            private void setCurrentPageOnPaging(int currentpage)
        {
            dgAdminReport.CurrentPageIndex = currentpage;
            
        }
        #endregion

      
        #endregion

        #region Export To Excel
            private void btnExport_Click(object sender, System.EventArgs e)
            {
                
                DataView dv = ((DataView) dgAdminReport.DataSource);
                    
                    
                if(dv != null && dv.Table.Rows.Count > 0)
                {
                    // OLD CODE
                    //Response.Clear();
                    //Response.Buffer= true;
                    //Response.ContentType = "application/vnd.ms-excel";
                    //Response.AddHeader("Content-Disposition", "attachment;filename=AdminReport_" + report + ".xls"); 
                    //Response.Charset = "";
                    //this.EnableViewState = false; 
			
                    ////ds.Tables[0].Columns.Remove("PatientId");
                    
                    //dgExcel.DataSource = dv.Table;
                    //dgExcel.DataBind();
                    
                    //System.IO.StringWriter oStringWriter = new System.IO.StringWriter();
                    //System.Web.UI.HtmlTextWriter oHtmlTextWriter = new System.Web.UI.HtmlTextWriter(oStringWriter);

                    //dgExcel.RenderControl(oHtmlTextWriter);
				
                    //Response.Write(oStringWriter.ToString());

                    //Response.End();

                    // NEW CODE
                    // call controller for export
                    string reportFileName = "AdminReport_" + report + ".xls";
                    Caisis.Controller.ExcelExporter.ExportToExcel(this, dv,report, reportFileName);
                }
            }
        #endregion
    
    }
}
 