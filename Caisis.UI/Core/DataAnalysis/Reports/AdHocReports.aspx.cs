using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Collections.Generic;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Linq;

using System.Web.UI.DataVisualization.Charting;

using Caisis.UI.Core.Classes;

using Caisis.UI.Core.Classes.CustomControls;
using Caisis.DataAccess;
using Caisis.Security;
using Caisis.Controller;

namespace Caisis.UI.Core.DataAnalysis.Reports
{
    public partial class AdHocReports : BaseReportPage
    {
        /// <summary>
        /// The ID of the ICaisisInputControl representing a dynamic paramater
        /// </summary>
        private static readonly string PARAM_FIELD_ID = "ParamField";

        #region declarations
        //go through these to wich are really needed in this scope

        //Set these from user selections
        protected string report = "";
        //protected int pageSize = 100;
        private DateTime? fromDate;
        private DateTime? toDate;
        private ReportConfigurations reportConfigurations;
        protected bool showReportInfo = false;
        private bool ignoreDdlReportSelectedIndexChanged = false;
        protected bool autoGenerateColumns = false;   //false default
        protected bool enableRowViewState = false;    //false default
        protected bool showFooterPager = true;
        protected bool insertSeperatorRows = true;    //true default

        private bool sorting = false;


        protected string ActiveReportTitle
        {
            get
            {
                return !string.IsNullOrEmpty(report) && reportConfigurations.ContainsKey(report) ? reportConfigurations[report].Title : report;
            }
        }

        protected string ActiveReportDescription
        {
            get
            {
                return !string.IsNullOrEmpty(report) && reportConfigurations.ContainsKey(report) ? reportConfigurations[report].Description : "";
            }
        }

        /// <summary>
        /// Return active report
        /// </summary>
        public override string ReportTitle
        {
            get
            {
                return report;
            }
        }

        #endregion

        /// <summary>
        /// Gets the report passed in the query string
        /// </summary>
        public string QueryStringReport
        {
            get
            {
                return Request.QueryString["report"];
            }
        }

        /// <summary>
        /// Gets a list of report params (keys/values) passed in query string
        /// </summary>
        public Dictionary<string, string> QueryStringParams
        {
            get
            {
                string qParams = Request.QueryString["params"];
                if (!string.IsNullOrEmpty(qParams))
                {
                    // query string dictionary will be url encoded pairs, decode
                    string decodedParams = Server.UrlDecode(qParams);
                    return PageUtil.GetUrlPairs(decodedParams);
                }
                else
                {
                    return new Dictionary<string, string>();
                }
            }
        }

        /// <summary>
        /// Gets the query string category
        /// </summary>
        public string QueryStringCategory
        {
            get
            {
                return Request.QueryString["category"];
            }
        }

        /// <summary>
        /// Gets the query string category
        /// </summary>
        public string QueryStringSubCategory
        {
            get
            {
                return Request.QueryString["subcategory"];
            }
        }

        /// <summary>
        /// Gets the query disease
        /// </summary>
        protected string QueryDisease
        {
            get
            {
                return Request.QueryString["disease"];
            }
        }

        public AdHocReports()
            : base()
        {
            this.Init += (a, b) =>
            {
                // build reports list
                reportConfigurations = ReportConfigurations.LoadFromXml(ReportConfigurationType.User);
                // add event handlers
                AttachEvents();
            };
            this.PreRender += (a, b) => SetMainReportUI();
        }

        // TODO:
        // Add Security; can't currently extend Base Page without error
        // Add use of one parameter and time period to sql 
        // Should reports on query from dataset? yes

        protected override void Page_Load(object sender, EventArgs e)
        {

            // Put user code to initialize the page here
            //base.Page_Load(sender, e);

            // on first load
            if (!Page.IsPostBack)
            {
                
                InitQueryStringDefaults();
                BuildReportMenu();
            }


            if (Page.IsPostBack)
            {
                createCustomPagerControls();
                ignoreDdlReportSelectedIndexChanged = false;

            }
            else
            {
                tblPageTitleAndPager.Visible = false;
            }

            AdminReportGrid.Visible = false;
            if (CanExportToExcel())
            {
                tblReportMenuExport.Visible = true;
            }

            //For now, load xml on every page load
            //The admin reports will probably not be oftens enough for this to be
            //a performace issue



            SetDefaultLayout();

            SetUpPaging();
            SetUpTimePeriod();

            SetReportInUse();

            //TODO BUG if a grid is loaded and combobox index changes the previous dataset i reloaded from database also when report summary is shown
            //causes a performance hit because of extra database query, but only noticable if a really large dataset has been loaded
            if (!Page.IsPostBack)
            {
                var config = reportConfigurations.GetReportById(report);
                if (config != null && config.RunByDefault)
                {
                    ShowReport(report);
                }
            }

            ConfigureMenu();
        }


        #region INIT

        private void SetDefaultLayout()
        {
            lblAdminPage.Visible = false;
            btnExport.Enabled = false;
            btnCSV.Enabled = false;

            // hide chart by default
            ChartLayer.Visible = false;
        }

        private void AttachEvents()
        {
            AdminReportGrid.RowCreated += new GridViewRowEventHandler(AdminReportGrid_ItemCreated);
            AdminReportGrid.PreRender += new EventHandler(AdminReportGrid_PreRender);
            AdminReportGrid.Sorting+=new GridViewSortEventHandler(AdminReportGrid_SortCommand);
            AdminReportGrid.PageIndexChanging+=new GridViewPageEventHandler(AdminReportGrid_PageIndexChanged);
            //ReportMenu.SelectedIndexChanged += new EventHandler(this.ReportMenu_SelectedIndexChanged);
            btnShowReport.Click += new EventHandler(this.showReport_Click);
            //btnExport.Click += new EventHandler(btnExport_Click);

            // important, init grid UI helper
            AdminReportGrid.ShowHeader = true;
            AdminReportGrid.UseAccessibleHeader = true;
            AdminReportGrid.DataBound += new EventHandler(SetGridUIElements);

            // supress choose report when no message shown
            EventHandler hideMessage = (o, e) => SelectReportMessage.Visible = false;
            AdminReportGrid.DataBinding += hideMessage;
            UserReportChart.DataBinding += hideMessage;
        }

        private void InitQueryStringDefaults()
        {
            ReportNameField.Value = string.Empty;
            // check if report passed in query string
            if (!string.IsNullOrEmpty(QueryStringReport))
            {
                // validate report exists
                if (reportConfigurations.ContainsKey(QueryStringReport))
                {
                    report = QueryStringReport;
                    ReportNameField.Value = QueryStringReport;
                }
            }
        }

        #endregion
      

        #region datagrid events

        /// <summary>
        /// 
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void SetGridUIElements(object sender, EventArgs e)
        {
            int recordCount = AdminReportGrid.Rows.Count;
            // set accessible header for UI scripts
            if (recordCount > 0)
                AdminReportGrid.HeaderRow.TableSection = TableRowSection.TableHeader;
        }

        private void AdminReportGrid_SortCommand(object sender, GridViewSortEventArgs e)
        {
            // signal sorting
            sorting = true;

            txtSortByColumnHidden.Value = e.SortExpression;
            if (txtSortOrderHidden.Value == "ASC")
            {
                txtSortOrderHidden.Value = "DESC";
            }
            else
            {
                txtSortOrderHidden.Value = "ASC";
            }
            // display report
            ShowReport(report);

            // force focus on grid
            Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "closeChartLayer", "closeChartLayer();", true);
        }

        private void AdminReportGrid_PreRender(object sender, EventArgs e)
        {
            GridView dtg = sender as GridView;

            string txt;
            txt = ((DataView)dtg.DataSource).Count.ToString() + "&nbsp;records&nbsp;found.&nbsp;&nbsp;Page&nbsp;" + (AdminReportGrid.PageIndex + 1).ToString() + "&nbsp;of&nbsp;" + AdminReportGrid.PageCount + ".&nbsp;";
            txtRecordCount.Text = txt;

            if (txtSortByColumnHidden.Value.Length > 0)
            {
                DataView dv = ((DataView)dtg.DataSource);
                //sort changed?
                if (dv.Sort != txtSortByColumnHidden.Value + ' ' + txtSortOrderHidden.Value)
                {
                    dv.Sort = txtSortByColumnHidden.Value + ' ' + txtSortOrderHidden.Value;
                    dtg.DataSource = dv;
                    dtg.DataBind(); //rebind to apply late sort
                    // dtg.CurrentPageIndex = 0; //allways go to first page after sort <- this breaks paging
                }
            }

            labelCustomPagerControls();
            //addSeparatorRows(dtg);
        }

        private void AdminReportGrid_ItemCreated(object sender, GridViewRowEventArgs e)
        {
            DataControlRowType itemType = e.Row.RowType;
            // Is newly created item a pager?
            if (itemType == DataControlRowType.Pager)
            {
                if (!showFooterPager)
                {
                    e.Row.Visible = false;
                }
            }
            else if (itemType == DataControlRowType.Header)
            {
                // locate link buttons and add helper text
                foreach (TableCell cell in e.Row.Cells)
                {
                    var linkButtons = cell.Controls.OfType<LinkButton>();
                    foreach(LinkButton linkButton in linkButtons)
                    {
                        // set onclick
                        linkButton.Attributes.Add("onclick", "setUseQueryStringCookieNot();");
                        // set tooltip
                        linkButton.ToolTip = "Sort By " + linkButton.Text;
                    }                     
                }
            }

            //if (itemType != ListItemType.Header)
            //{
            //    //turn off viewstate for individual rows
            //    //reduces size of viewstate considerably 
            //    //while still retaining built in datagrid functions such as paging and sortíng events
            //    if (!enableRowViewState)
            //    {
            //        e.Item.EnableViewState = false;
            //    }
            //}

        }
        #endregion


        #region Dynamic Parameters

        /// <summary>
        /// Build list of dynamic input controls for capturing report params
        /// </summary>
        /// <param name="reportFields">A list of report configuration fields.</param>
        private void BuildDynamicReportParams(IEnumerable<ReportConfigurationField> reportFields)
        {
            // normalized index
            int i = 1;
            // build a list of normalized index (i.e., some params will be hidden, no index increment)
            var normalizedParams = from reportField in reportFields
                                   let supressParam = reportField.ControlType == typeof(CaisisHidden).Name
                                   select new
                                    {
                                        Index = supressParam ? -1 : i++,
                                        ReportField = reportField
                                    };

            // build and show paramaters
            ReportFieldsRptr.Visible = true;
            ReportFieldsRptr.DataSource = normalizedParams;
            ReportFieldsRptr.DataBind();
        }

        /// <summary>
        /// Gets a dictionary of key/values user entered params for report
        /// </summary>
        /// <returns></returns>
        private Dictionary<string, string> GetDynamicReportParams()
        {
            // for each rptr item, extract param key/value
            var reportFields = from item in ReportFieldsRptr.Items.Cast<RepeaterItem>()
                               // find param control and reurn param key/value
                               let field = item.FindControl(PARAM_FIELD_ID) as ICaisisInputControl
                               where field != null
                               select field;
            // return as a Dictionary<string,string>, i.e., <icic.Field, icic.Value>
            return reportFields.ToDictionary(f => f.Field, f => f.Value);
        }

        /// <summary>
        /// For each report parameter set ICaisisInputControl, label, required, etc...
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void BuildReportFields(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                // locate label and placeholders
                Label fieldLabel = e.Item.FindControl("FieldLabel") as Label;
                PlaceHolder fieldHolder = e.Item.FindControl("FieldHolder") as PlaceHolder;
                
                if(e.Item.DataItem != null) 
                {
                    // get row configuration field object
                    int paramIndex = e.Item.ItemIndex;
                    int paramNormalizedIndex = (int)DataBinder.Eval(e.Item.DataItem, "Index");
                    ReportConfigurationField reportField = DataBinder.Eval(e.Item.DataItem, "ReportField") as ReportConfigurationField; //e.Item.DataItem as ReportConfigurationField;
                 
                    // get dynamic ICaisisInputControl
                    ICaisisInputControl iCIC = reportField.GetControl();
                    // add dynamic control
                    Control icic = iCIC as Control;
                    // set control id for later retreival
                    icic.ID = PARAM_FIELD_ID;
                    if (icic is WebControl)
                    {
                        (icic as WebControl).CssClass = "ParamField";
                    }
                    else if (icic is HtmlControl)
                    {
                        (icic as HtmlControl).Attributes["class"] = "ParamField";
                    }
                    fieldHolder.Controls.Add(icic);

                    // if field required, add validator
                    RequiredFieldValidator requiredField = null;
                    // only create required field if field is required and not a check control (.NET issues)
                    if (reportField.Required && !(iCIC is CheckBox || icic is CheckBoxList))
                    {                        
                        requiredField = new RequiredFieldValidator();
                        requiredField.SetFocusOnError = true;
                        requiredField.ErrorMessage = "*required field";
                        requiredField.CssClass = "errorText";
                        requiredField.Display = ValidatorDisplay.Dynamic;
                        // fix, added wrapper to required field
                        Panel requiredWrapper = new Panel();
                        requiredWrapper.Controls.Add(requiredField);
                        fieldHolder.Controls.Add(requiredWrapper);
                    }

                    // if default value set, set value control binding
                    if (!string.IsNullOrEmpty(reportField.DefaultValue))
                    {
                        if (iCIC is ListControl)
                        {
                            (iCIC as ListControl).DataBound += (a, b) => iCIC.Value = reportField.DefaultValue;
                        }
                        else
                        {
                            (iCIC as Control).DataBinding += (a, b) => iCIC.Value = reportField.DefaultValue;
                        }
                    }
                    
                    // late bound events, set label text and associated control and required fields
                    e.Item.DataBinding += (a, b) =>
                        {
                            // determin if field required, set required control to validate
                            if (reportField.Required && requiredField != null)
                            {
                                requiredField.ControlToValidate = icic.ID;
                            }

                            // set label
                            string fieldName = reportField.FieldName;
                            string fieldTitle = reportField.Title;
                            fieldLabel.AssociatedControlID = icic.ID;
                            fieldLabel.Text = !string.IsNullOrEmpty(fieldTitle) ? fieldTitle : fieldName;

                            // determine if static datasource
                            if (reportField.DataItems.Count > 0 && iCIC is ListControl)
                            {
                                ListControl dataControl = icic as ListControl;
                                //dataControl.AppendDataBoundItems = false;
                                //dataControl.DataTextField = "Key";
                                //dataControl.DataValueField = "Value";
                                //dataControl.DataSource = reportField.DataItems;
                                //dataControl.DataBind();

                                // prepend static items ???
                                int prependIndex = dataControl.Items.Count > 0 && dataControl.Items[0].Value == "" ? 1 : 0;
                                foreach (var item in reportField.DataItems.Reverse())
                                {
                                    dataControl.Items.Insert(prependIndex, new ListItem(item.Key, item.Value));
                                }
                            }
                        };

                    // supress param on neg index
                    if (paramNormalizedIndex < 0)
                    {
                        e.Item.Visible = false;
                    }
                }
            }
        }

        private void ConfigureMenu()
        {
            //string sReport = ReportMenu.SelectedValue;
            // validate report
            if (string.IsNullOrEmpty(report) || !reportConfigurations.ContainsKey(report))
            {
                return;
            }
            ReportConfiguration rprt = reportConfigurations[report];
            // if selected item is static, return
            if (HandleStaticReports(report, null))
            {
                // fix??? build inital dynamic report params
                BuildDynamicReportParams(rprt.ReportFields);
                var reportParams = GetDynamicReportParams();
                HandleStaticReports(report, reportParams);
                return;
            }

            SetParamsVisibility(rprt);

            BuildDynamicReportParams(rprt.ReportFields);
        }

        #endregion

        // REPORTS 

        private void SetReportInUse()
        {
            HttpCookie adminCookie = Request.Cookies["AdminReportUseQuerystring"];
            if (!string.IsNullOrEmpty(QueryStringReport))
            {
                if (adminCookie != null && adminCookie.Value == "true")
                {
                    if (txtDllReportLast.Value == "" || txtDllReportLast.Value == report)//ReportMenu.SelectedValue)
                    {
                        report = QueryStringReport;
                        ignoreDdlReportSelectedIndexChanged = true;
                        //ReportMenu.SelectedValue = report;
                        txtDllReportLast.Value = report;
                    }
                }
                if(string.IsNullOrEmpty(report))
                {
                    report = QueryStringReport;
                }
            }
            // set hidden field
            if (string.IsNullOrEmpty(report))
            {
                report = txtReportHidden.Value;
            }
            else
            {
                txtReportHidden.Value = report;
            }
        }

        #region UI ELEMENTS (Menus, List, Params, etc...)

        /// <summary>
        /// Builds drop down with list of available reports
        /// </summary>
        private void BuildReportMenu()
        {
            IEnumerable<ReportConfiguration> filteredList = reportConfigurations.Reports;
            // filter by category in query string
            if (!string.IsNullOrEmpty(QueryStringCategory))
            {
                if (!string.IsNullOrEmpty(QueryStringSubCategory))
                {
                    filteredList = reportConfigurations.GetReportsByCategoryAndSubCategory(QueryStringCategory, QueryStringSubCategory);
                }
                else
                {
                    filteredList = reportConfigurations.GetReportsByCategory(QueryStringCategory);
                }
            }
            // otheriwse, if loading report from query string, reverse loopup reports with same category
            else if (!string.IsNullOrEmpty(QueryStringReport) && reportConfigurations.ContainsKey(QueryStringReport))
            {
                ReportConfiguration defaultReport = reportConfigurations[QueryStringReport];
                filteredList = reportConfigurations.GetReportsByCategories(defaultReport.CategoriesList);
            }

            // filter by disease
            if (!string.IsNullOrEmpty(QueryDisease))
            {
                filteredList = filteredList.Where(r => r.ReportDiseases.Contains(QueryDisease));
            }

            //ReportMenu.DataSource = filteredList;
            //ReportMenu.DataBind();
            //ReportMenu.Items.Insert(0, new ListItem("", ""));

            // bind list of reports to build rptr
            ReportMenuRptr.DataSource = filteredList;
            ReportMenuRptr.DataBind();

            btnShowReport.Attributes.Add("onclick", "clearOldReportInfo();setUseQueryStringCookieNot();");
            //ReportMenu.Attributes.Add("onchange", "setUseQueryStringCookieNot();clearOldReportInfo();");
            btnExport.Attributes.Add("onclick", "setUseQueryStringCookieNot();");
            btnCSV.Attributes.Add("onclick", "setUseQueryStringCookieNot();");
        }

        /// <summary>
        /// Sets the current report's icon
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void SetReportIcon(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                Image reportIcon = e.Item.FindControl("ReportIcon") as Image;
                // get current configuration object
                ReportConfiguration config = e.Item.DataItem as ReportConfiguration;
                // get the path to the icon
                string reportIconPath = config.GetReportIcon(Page);
                // test if icon exists on disk, use, otherwise leave default
                if (!string.IsNullOrEmpty(reportIconPath))
                {
                    reportIcon.ImageUrl = reportIconPath;
                }
            }
        }

        /// <summary>
        /// Sets the path to the current list of reports by category (optional) and sub category (optional).
        /// Also sets various UI elements such as graph creation, labels, etc...
        /// </summary>
        private void SetMainReportUI()
        {
            if (!string.IsNullOrEmpty(QueryStringCategory))
            {
                MainReportsLink.Visible = true;
                MainReportsLink.Text = QueryDisease;
                MainReportsLink.NavigateUrl = "SelectReport.aspx?category=" + Server.UrlEncode(QueryStringCategory);


               // SelectReport.aspx?disease=Ovarian&category=AMPLIO

                CategoriesReportsLink.Visible = true;
                CategoriesReportsLink.Text = QueryStringCategory;
                
                //CategoriesReportsLink.NavigateUrl = "SelectReport.aspx?category=" + Server.UrlEncode(QueryStringCategory);

                
                CategoriesReportsLink.NavigateUrl = "SelectReport.aspx?disease="+Server.UrlEncode(QueryDisease)+"&category="+Server.UrlEncode(QueryStringCategory);
                

                if (!string.IsNullOrEmpty(QueryStringSubCategory))
                {
                    SubCategoriesReportsLink.Visible = true;
                    SubCategoriesReportsLink.Text = QueryStringSubCategory;
                }
                else
                {
                    SubCategoriesReportsLink.Visible = false;
                }
                // HOW ARE THESE GRAPHS CREATED
                string docPath = "";
                // use report documentation
                if (!string.IsNullOrEmpty(QueryStringReport) && reportConfigurations.ContainsKey(QueryStringReport))
                {
                    ReportConfiguration report = reportConfigurations[QueryStringReport];
                    docPath = report.DocFile;
                }
                // use category documentation
                if (string.IsNullOrEmpty(docPath))
                {
                    docPath = reportConfigurations.GetCategoryDocumentation(QueryStringCategory);
                }
                if (!string.IsNullOrEmpty(docPath))
                {
                    GraphsCreatedImg.Visible = true;
                    ReportConfiguration report = reportConfigurations[QueryStringReport];
                    string modalPath = PageUtil.EscapeSingleQuotes(Page.ResolveUrl(docPath)) + "?id=" + Server.UrlEncode(report.ID);

                    GraphsCreatedImg.Attributes["onclick"] = "showHowGraphsMade('" + modalPath + "');";

                    /* GraphsCreatedImg.Attributes["onclick"] = "showHowGraphsMade('" + PageUtil.EscapeSingleQuotes(Page.ResolveUrl(docPath)) + "');"; */

                }
                else
                {
                    GraphsCreatedImg.Visible = false;
                }
            }
            else
            {
                MainReportsLink.Visible = true;
                CategoriesReportsLink.Visible = false;
                SubCategoriesReportsLink.Visible = false;
                GraphsCreatedImg.Visible = false;
            }
        }

        #endregion

        //public void ReportMenu_SelectedIndexChanged(object sender, EventArgs e)
        //{
        //    ReportFieldsRptr.Visible = false;

        //    if (!ignoreDdlReportSelectedIndexChanged)
        //    {
        //        txtReportHidden.Value = "";
        //        AdminReportGrid.Visible = false;
        //        tblPageTitleAndPager.Visible = false;
        //        if (sender is DropDownList)
        //        {
        //            string id = ReportMenu.SelectedValue;
        //            report = id;
        //            if (HandleStaticReports(id, null))
        //            {
        //                return;
        //            }

        //            //lblAdminReportInfo.Text = "<span class=reportInfoHeading>"
        //            //    + reportConfigurations[id].Title
        //            //    + "</span><br />"
        //            //    + reportConfigurations[id].Description
        //            //    + "<br /><br />";
        //            txtAdditionalFilter1.Text = "";
        //        }
        //        ConfigureMenu();
        //        txtDllReportLast.Value = ReportMenu.SelectedValue;
        //    }
        //}

        private void showReport_Click(object sender, EventArgs e)
        {
            AdminReportGrid.PageIndex = 0;
            //report = ReportMenu.SelectedValue;
            txtReportHidden.Value = report;
            ShowReport(report);
        }

        private void ShowReport(string userReport)
        {
            // the report configuration object
            ReportConfiguration rprt = reportConfigurations[userReport];

            // supress params panel
            if (!rprt.ShowParamsPanel)
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "hideParamsPanel", "hideParamaters();", true);
            }

            if (!rprt.UseExport)
            {
                tblReportMenuExport.Visible = false;
            }
            else if (CanExportToExcel())
            {
                tblReportMenuExport.Visible = true;
            }


            // list of dynamic report parameters
            Dictionary<string, string> reportParams = new Dictionary<string, string>();
            // during inital load, when using query report
            if (!Page.IsPostBack && userReport == QueryStringReport)
            {
                // use inital query params
                if (QueryStringParams.Count() > 0)
                {
                    reportParams = QueryStringParams;
                }
                // otherwise use default generated params
                else
                {
                    // build inital params
                    BuildDynamicReportParams(rprt.ReportFields);
                    // get inital params
                    reportParams = GetDynamicReportParams();
                }
            }
            // otherwise extract from rptr
            else
            {
                reportParams = GetDynamicReportParams();
            }

            if (HandleStaticReports(userReport, reportParams))
            {
                return;
            }
            if (userReport.Length < 1)
            {
                showReportInfo = true;
                return;
            }

            DataSet ds = new DataSet();
            bool bindData = true;

            AdminReportsDa da = new AdminReportsDa();
            string datasetSql = CacheManager.GetDatasetSQL(System.Web.HttpContext.Current.Session[SessionKey.DatasetId]);

            if (rprt.UseGenericReportFormat)
            {
                bindData = true;
                lblPageTitle.Text = rprt.Title;
                string paramName = null;
                string paramValue = null;

                if (lblAdditionalFiltering.Text != "N/A")
                {
                    paramName = lblAdditionalFiltering.Text;

                    if (txtAdditionalFilter1.CssClass != "DisplayNone")
                    {
                        paramValue = txtAdditionalFilter1.Text;
                    }
                    else
                    {
                        paramValue = ddlAdditionalFilter1.SelectedItem.Text;
                    }

                }


                HttpCookie adminCookie = Request.Cookies["AdminReportUseQuerystring"];
                if (Request.QueryString["paramValue"] != null && adminCookie != null && adminCookie.Value == "true")
                {
                    paramValue = Request.QueryString["paramValue"];
                    paramName = Request.QueryString["paramName"];
                    lblAdditionalFiltering.Text = paramName;
                    txtAdditionalFilter1.Text = paramValue;
                }

                // retrieve data
                //if (string.IsNullOrEmpty(rprt.QueryString) == false)
                //{
                //    ds = da.GetAdminReport(rprt.QueryString);
                //}

                // rprt.StoredProcedure can be name of stored procedure or sql string
                if (rprt.UseTimePeriod)
                {
                    //try
                    //{
                    if (reportParams.Count > 0)
                    {
                        ds = da.GetAdminReport(datasetSql, rprt.StoredProcedure, reportParams, txtFromDate.Value, txtToDate.Value, rprt.UseWarehouse);
                        //var data = (from row in ds.Tables[0].AsEnumerable()
                        //           select new
                        //           {
                        //               Medication = row["Medication"].ToString(),
                        //               MedCount = (int)row["MedCount"]
                        //           }).AsEnumerable();
                        //DataTable dt = ds.Tables[0];
                        //ReportChart.Series[0].Points.DataBind(data.ToArray(), "", "MedCount", "Tooltip=Medication");
                    }
                    else
                    {
                        ds = da.GetAdminReport(datasetSql, rprt.StoredProcedure, paramName, paramValue, txtFromDate.Value, txtToDate.Value, rprt.UseWarehouse);
                    }
                    //}
                    //catch (System.Data.SqlClient.SqlException e)
                    //{
                    //    if (e.Message.Contains("FromDate") || e.Message.Contains("ToDate"))
                    //    {
                    //        ErrorMsg.Text = "From and To Dates are required";
                    //        ErrorMsg.Visible = true;
                    //    }
                    //}
                }
                else
                {
                    if (reportParams.Count > 0)
                    {
                        ds = da.GetAdminReport(datasetSql, rprt.StoredProcedure, reportParams, rprt.UseWarehouse);
                    }
                    else
                    {
                        ds = da.GetAdminReport(datasetSql, rprt.StoredProcedure, paramName, paramValue, rprt.UseWarehouse);
                    }
                }
                // log view of report
                ReportController.LogReportView(rprt.ID, reportParams);
            }
            else
            {
                #region userSummary
                if (userReport == "UserSummary")
                {
                    //if ( ReportMenu.SelectedValue != "UserSummary")
                    if (report != "UserSummary")
                    {
                        if (Page.IsPostBack || QueryStringReport == null || QueryStringReport != "UserSummary")
                        {
                            return;
                        }
                    }
                    lblAdminPage.Visible = true;
                    AdminReportGrid.Visible = false;

                    string iUserId;
                    string userName, userFirstName, userLastName, userEmail, enteredBy, updatedBy;
                    string enteredTime, updatedTime, deactivatedTime;
                    TimeSpan timespan;

                    Label lblAdminReportSubHeading2 = new Label();

                    lblAdminPage.Controls.Add(lblAdminReportSubHeading2);
                    HttpCookie adminCookie = Request.Cookies["AdminReportUseQuerystring"];
                    if (Request.QueryString["paramName"] == "userName" && adminCookie != null && adminCookie.Value == "true")
                    {
                        userName = Request.QueryString["paramValue"];
                    }
                    else
                    {
                        userName = txtAdditionalFilter1.Text;
                    }

                    ds = da.GetUserInfo(userName);

                    if (ds.Tables[0].Rows.Count != 1)
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

                        if (PageUtil.IsDate(updatedTime))
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

                        GridView dgAdminReport01 = new GridView();
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
                            dgAdminReport01.DataBind();
                            dgAdminReport01.Width = 630;
                            dgAdminReport01.CssClass = "DatagridTable";
                            lblAdminReportSubHeading3.Text = "<a href=AdminSectionReports.aspx?report=LoginsForUser&paramValue=" + userName + "&paramName=userName onclick=\"javascript:setUseQueryStringCookie();\">View all logins for this user.</a><br><br>";
                        }
                        lblAdminReportSubHeading3.Visible = true;
                        lblAdminReportSubHeading3.Text += "<b>Last 5 patient views for this user:</B> <br>";

                        lblAdminPage.Controls.Add(lblAdminReportSubHeading3);

                        GridView dgAdminReport2 = new GridView();
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
                            dgAdminReport2.DataBind();
                            lblAdminReportSubHeading4.Visible = true;
                            lblAdminReportSubHeading4.Text = "<a href=AdminSectionReports.aspx?report=PatientsViewsByUser&paramValue=" + userName + "&paramName=userName onclick=\"javascript:setUseQueryStringCookie()\">View all patient views for this user.</a>";
                        }

                        /*user record changes*/

                        GridView dgAdminReport3 = new GridView();
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
                            dgAdminReport3.DataBind();
                            lblAdminReportSubHeading5.Visible = true;
                            lblAdminReportSubHeading5.Text = "<a href=AdminSectionReports.aspx?report=UsersRecordChanges&paramValue=" + userName + "&paramName=userName onclick=\"javascript:setUseQueryStringCookie()\">View all record changes for this user.</a><br>";

                        }
                        lblAdminPage.Controls.Add(lblAdminReportSubHeading5);

                        /*users groups*/

                        GridView dgAdminReport4 = new GridView();
                        lblAdminPage.Controls.Add(dgAdminReport4);
                        DataSet ds4 = new DataSet();
                        ds4 = da.GetAdminReport(datasetSql, "spRptAdminGetAUsersGroups", "UserId", iUserId, rprt.UseWarehouse);
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
                            dgAdminReport4.DataBind();
                        }
                    }
                    bindData = false;
                }
                #endregion
            }
            if (bindData)
            {
                doBindData(ds, userReport, reportParams);
                btnExport.Enabled = true;
                btnCSV.Enabled = true;
            }
        }

        private void doBindData(DataSet ds, string useReport, Dictionary<string, string> reportParams)
        {

            AdminReportGrid.Visible = true;

            if (autoGenerateColumns)
            {
                AdminReportGrid.AutoGenerateColumns = true;
            }
            else
            {
                AdminReportGrid.AutoGenerateColumns = false;
                CreateTemplateColumns(AdminReportGrid, ds.Tables[0]);
            }
            AdminReportGrid.Visible = true;

            DataView dataSource = ds.Tables[0].DefaultView;
            AdminReportGrid.DataSource = dataSource;
            AdminReportGrid.DataBind();
            // set record count
            int totalRecordCount = dataSource.Count;
            int totalVisibleCount = AdminReportGrid.Rows.Count;
            // set message based on record count
            if (totalRecordCount > 0)
            {
                string recordCountOutput = string.Format("Viewing {0} of {1} Records", totalVisibleCount, totalRecordCount);
                ReportRecordCount.Text = recordCountOutput;
            }
            else
            {
                ReportRecordCount.Text = "0 records found";
            }

            txtReportHidden.Value = report;

            BuildChart(useReport, ds.Tables[0].DefaultView);

            // Log that user is viewing report
            base.LogReportView(useReport, reportParams);
        }

        #region CHARTING

        /// <summary>
        /// 
        /// </summary>
        /// <param name="reportName"></param>
        /// <param name="view"></param>
        private void BuildChart(string reportName, DataView view)
        {
            ReportConfiguration rprt = reportConfigurations[reportName];
            ReportChartingConfig charting = rprt.ChartConfig;
            if (charting != null)
            {
                ChartLayer.Visible = true;
                ResultsToggleContainer.Visible = true;
                DataAnalysisResults.Visible = true;

                //ReportChart.Series.Clear();

                if (charting.ShowByDefault && !sorting)
                {
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "showChartLayer", "showChartLayer();", true);
                }
                //string label = charting.XAxis;
                //string tooltip = charting.YAxis;
                //string seriesName = rprt.Title;
                //System.Web.UI.DataVisualization.Charting.Series series = new Series(seriesName);
                //ReportChart.Series.Add(series);
                //series["ShowMarkerLines"] = "True";
                //series.BorderWidth = 2;
                //series.ShadowOffset = 1;
                //series.ShadowColor = System.Drawing.Color.DarkGray;
                //series.Color = System.Drawing.Color.Red;
                //series.ChartType = charting.ChartType;
                //series.MarkerStyle = MarkerStyle.Circle;
                //series.MarkerSize = 7;
                //series.Points.DataBind(view, charting.XAxis, charting.YAxis, string.Format("Tooltip={0}, Label={1}", tooltip, label));

                // BUILD REPORT CHART
                UserReportChart.BuildChart(view, rprt);
                // CHARTING NOTES

                // for title, replace paramater references
                Dictionary<string, string> pairs = GetDynamicReportParams();
                
                // TODO uncomment when working properly
                // ReportNotesTitle.Text = GetNormalizeNote(pairs, charting.NotesTitle);
                
                // for each note, replace paramater references
                var normalizedNotes = from note in charting.Notes
                                      select GetNormalizeNote(pairs, note);
                // build list of notes
                ReportNotesRptr.DataSource = normalizedNotes;
                ReportNotesRptr.DataBind();

            }
            else
            {
                ResultsToggleContainer.Visible = false;
                ChartLayer.Visible = false;
                DataAnalysisResults.Visible = false;
            }
        }

        #endregion


        private string GetNormalizeNote(Dictionary<string, string> keyValues, string note)
        {
            foreach (string paramName in keyValues.Keys)
            {
                string paramValue = keyValues[paramName];
                note = note.Replace("@" + paramName, paramValue);
            }
            return note;
        }

        private void CreateTemplateColumns(GridView grid, DataTable dt)
        {
            grid.Columns.Clear(); // reset columns ???

            ReportConfiguration rprt = reportConfigurations[report];
            int columnCount = dt.Columns.Count;
            for (int i = 0; i < columnCount; i++)
            {
                // get column type
                string columnName = dt.Columns[i].ColumnName;
                ReportConfiguration.ColumnMode columnMode = rprt.ColumnDisplay(columnName);

                // hyperlink columns
                if (columnMode == ReportConfiguration.ColumnMode.ShowAsHyperLink)
                {
                    ReportHyperLinkColumn hcol = rprt.GetHyperLinkColumn(columnName);
                    HyperLinkField linkColumn = createHyperLinkColumn(hcol.DataTextField, hcol.DataTextFormatString, hcol.DataNavigateUrlField, hcol.HeaderText, hcol.GoToReport, hcol.Param);
                    grid.Columns.Add(linkColumn);
                }
                // normal columns
                else if (columnMode == ReportConfiguration.ColumnMode.ShowAsNormal || rbAllColumns.Checked)
                {
                    BoundField bc = new BoundField();
                    bc.DataField = columnName;
                    bc.HeaderText = columnName;
                    bc.SortExpression = columnName;
                    grid.Columns.Add(bc);
                }
            }
        }

        private HyperLinkField createHyperLinkColumn(string dataTextField, string dataTextFormatString, string dataNavigateUrlField, string headerText, string goToReport, string param)
        {
            DateTime fromDate = DateTime.Parse(txtFromDate.Value);
            string fDate = fromDate.ToString("yyyyMMdd");
            DateTime toDate = DateTime.Parse(txtToDate.Value);
            string tDate = toDate.ToString("yyyyMMdd");
            HyperLinkField linkColumn = new HyperLinkField();
            linkColumn.DataTextField = dataTextField;
            linkColumn.DataTextFormatString = dataTextFormatString; //"{0}"
            linkColumn.DataNavigateUrlFields = new string[] { dataNavigateUrlField };
            linkColumn.DataNavigateUrlFormatString =
                "AdminSectionReports.aspx?" +
                "order=" + txtSortOrderHidden.Value +
                "&sortBy=" + txtSortByColumnHidden.Value +
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

        // HANDLE PAGING

        private void AdminReportGrid_PageIndexChanged(object sender, GridViewPageEventArgs e)
        {
            setCurrentPageOnPaging(e.NewPageIndex);
            ShowReport(report);
            //AdminReportGrid.DataBind();

            lblPageTitle.Visible = true;
        }
        //custom pager event
        private void pagerLnk_Click(object sender, EventArgs e)
        {
            int gotopage = 0;
            string btnId;
            LinkButton lnkbtn = (LinkButton)sender;
            btnId = lnkbtn.ID;

            if (btnId == "lnkPrev")
            {
                gotopage = 0;
            }
            else if (btnId == "lnkNext")
            {
                gotopage = AdminReportGrid.PageCount - 1;
            }
            else if (PageUtil.IsInteger(this.ViewState[btnId].ToString()))
            {
                gotopage = int.Parse(this.ViewState[btnId].ToString()) - 1;
            }
            setCurrentPageOnPaging(gotopage);
        }


        private void setCurrentPageOnPaging(int currentpage)
        {
            AdminReportGrid.PageIndex = currentpage;

        }

        private void SetUpPaging()
        {
            if (!Page.IsPostBack || ddlPageSize.SelectedValue.Length == 0)
            {
                ddlPageSize.Items.Add("[ALL]");
                ddlPageSize.Items.Add("20");
                ddlPageSize.Items.Add("50");
                ddlPageSize.Items.Add("100");
                ddlPageSize.Items.Add("200");
                ddlPageSize.Items.Add("500");
                ddlPageSize.Items.Add("1000");
                ddlPageSize.Items.Add("2000");

                ddlPageSize.SelectedValue = "100";
            }
            if (ddlPageSize.SelectedValue == "[ALL]")
            {
                AdminReportGrid.AllowPaging = false;
            }
            else
            {
                AdminReportGrid.AllowPaging = true;
                AdminReportGrid.PageSize = int.Parse(ddlPageSize.SelectedValue);
            }
        }


        private void SetUpTimePeriod()
        {
            bool setFromDate = false;
            bool setToDate = false;

            if (!Page.IsPostBack)
            {
                toDate = DateTime.Now;
                fromDate = toDate.Value.AddDays(-30);
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

        /// <summary>
        /// Adjust visible client panels/frame and returns if report is static
        /// </summary>
        /// <param name="reportName"></param>
        /// <returns></returns>
        private bool HandleStaticReports(string reportName, Dictionary<string,string> reportParams)
        {
           
            
            // find static report matching report Name
            var foundStaticReport = reportConfigurations.StaticReports.Where(r => r.ID == reportName);
            // if static report found, load static iframe url
            if (foundStaticReport.Count() > 0)// && Page.IsPostBack)
            {
                ReportConfiguration config = foundStaticReport.First();
                // supress params panel
                if (!config.ShowParamsPanel)
                {
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "hideParamsPanel", "hideParamaters();", true);
                }

                string staticFormName = config.Form;
                string encodedParams = string.Empty;
                if (reportParams != null)
                {
                    // add ToDate and FromDate as params
                    if (config.UseTimePeriod)
                    {
                        reportParams.Add("ToDate", txtToDate.Value);
                        reportParams.Add("FromDate", txtFromDate.Value);
                    }

                    // add ReportTitle to params
                    reportParams.Add("reportTitle", ReportTitle);
                    encodedParams = Server.UrlEncode(PageUtil.CreateUrlPairs(reportParams));
                }
                StaticReportsFrame.Attributes["src"] = "ReportsContainer.aspx?showReportDropDown=false&report=" + staticFormName + "&params=" + encodedParams;
                StaticReportsFrame.Visible = true;
                //DynamicReportPanel.Visible = false;
                GraphContainer.Visible = false;                
                //tblReportMenuOptions.Style["display"] = "none";
                if (!config.UseExport)
                {
                    tblReportMenuExport.Visible = false;
                }
                else if (CanExportToExcel())
                {
                    tblReportMenuExport.Visible = true;
                }
                // configure params
                SetParamsVisibility(config);

                return true;
            }
            else
            {
                StaticReportsFrame.Attributes["src"] = string.Empty;
                StaticReportsFrame.Visible = false;
                DynamicReportPanel.Visible = true;
                GraphContainer.Visible = true;
                //tblReportMenuOptions.Style.Remove("display");

                return false;
            }
        }


        private void SetParamsVisibility(ReportConfiguration rprt)
        {
            // adjust panels visibility by report
            ReportFieldsRptr.Visible = rprt.ReportFields.Count() > 0;
            DateFilterTable.Visible = rprt.UseTimePeriod;
            AdditionalFilterTable.Visible = rprt.UseFilter;
            PageFilterTable.Visible = rprt.UsePageSize;

            if (rprt.UseFilter)
            {
                //only support for one search criteria in gui, but object stores array of columns
                //so the gui could be extended
                string[] cols = rprt.GetSearchableColumns();
                lblAdditionalFiltering.Text = cols[0];
                lblAdditionalFiltering.Visible = true;
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
                    if (ddlAdditionalFilter1.Items.FindByText(matchesToSearchFor[0]) == null)
                    {
                        ddlAdditionalFilter1.Items.Clear();
                        txtAdditionalFilter1.Visible = true;
                        txtAdditionalFilter1.CssClass = "DisplayNone";
                        ddlAdditionalFilter1.Visible = true;
                        ddlAdditionalFilter1.CssClass = "DisplayInline";
                        for (int i = 0; i < matchesToSearchFor.Length; i++)
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
                lblAdditionalFiltering.Visible = false;
                txtAdditionalFilter1.Text = "";
                txtAdditionalFilter1.Visible = true;
                txtAdditionalFilter1.CssClass = "DisplayNone";
                ddlAdditionalFilter1.Visible = true;
                ddlAdditionalFilter1.CssClass = "DisplayNone";
                ddlAdditionalFilter1.SelectedIndex = -1;

            }
            if (rprt.HasHiddenColumns)
            {
                bool doNotShowAll = false;
                if (!rbNotAllColumns.Enabled)
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
                txtFromDate.Visible = true;
                txtToDate.Visible = true;
                lblFromDate.Text = "From: ";
                lblFromDate.Visible = true;
                lblToDate.Text = "To: ";
            }
            else
            {
                txtToDate.Visible = false;
                txtFromDate.Visible = false;
                lblFromDate.Text = "N/A";
                lblFromDate.Visible = false;
                lblToDate.Text = "";
            }
            if (rprt.UsePageSize)
            {
                ddlPageSize.Enabled = true;
            }
            else
            {
                ddlPageSize.Enabled = false;
            }
            if (rprt.UseExport)
            {
                btnExport.Visible = true;
                btnCSV.Visible = true;
            }
            else
            {
                btnExport.Visible = false;
                btnCSV.Visible = false;
            }

            ColumnsRadios.Visible = rprt.ShowExtendedColumns;
            PatientCharacteristics.Visible = PatientCharacteristicsExist(QueryDisease);
        }

        #region SetUpustomPagerControl
        private void createCustomPagerControls()
        {
            /* FS
            TableCell pagerParent = tcHeadingPager;
            int noOfControls = AdminReportGrid.PagerStyle.PageButtonCount;

            LinkButton lnkPrev = new LinkButton();
            pagerParent.Controls.Add(lnkPrev);
            lnkPrev.ID = "lnkPrev";
            lnkPrev.Text = "«";
            lnkPrev.Click += new EventHandler(this.pagerLnk_Click);
            lnkPrev.Visible = false;
            lnkPrev.CssClass = "DisplayNone";
            lnkPrev.ToolTip = "First page";

            Label lblPrev = new Label();
            pagerParent.Controls.Add(lblPrev);
            lblPrev.ID = "lblPrev";
            lblPrev.Text = "«";
            lblPrev.Visible = false;
            lblPrev.CssClass = "DisplayNone";

            for (int i = 0; i < noOfControls; i++)
            {
                Label newLbl = new Label();
                pagerParent.Controls.Add(newLbl);
                newLbl.ID = "lbl" + i.ToString();
                newLbl.Text = ""; (i + 1).ToString();
                newLbl.Visible = false;
                newLbl.CssClass = "DisplayNone";

                LinkButton pagerLnk = new LinkButton();
                pagerParent.Controls.Add(pagerLnk);
                pagerLnk.ID = "lnk" + i.ToString();
                pagerLnk.Text = ""; (i + 1).ToString();
                pagerLnk.Click += new EventHandler(this.pagerLnk_Click);
                pagerLnk.Visible = false;
                pagerLnk.CssClass = "DisplayNone";
            }

            LinkButton lnkNext = new LinkButton();
            pagerParent.Controls.Add(lnkNext);
            lnkNext.ID = "lnkNext";
            lnkNext.Text = "»";
            lnkNext.Click += new EventHandler(this.pagerLnk_Click);
            lnkNext.Visible = false;
            lnkNext.CssClass = "DisplayNone";
            lnkNext.ToolTip = "Last page";

            Label lblNext = new Label();
            pagerParent.Controls.Add(lblNext);
            lblNext.ID = "lblNext";
            lblNext.Text = "»";
            lblNext.Visible = false;
            lblNext.CssClass = "DisplayNone";
            */
        }

        private void labelCustomPagerControls()
        {
            /* FS
            int noOfPagerControls = AdminReportGrid.PagerStyle.PageButtonCount;
            int noOfPages = AdminReportGrid.PageCount;
            int currentPage = AdminReportGrid.CurrentPageIndex;
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
                pageOffset = noOfPages - (noOfPages - currentPage) - middleCtrl + addindex;
            }
            //Label

            Label lbltest = (Label)tcHeadingPager.FindControl("lbl0");
            if (lbltest == null)
            {
                createCustomPagerControls();
            }
            for (int i = 0; i < noOfPagerControls; i++)
            {
                if (i == currentPageControlPosition)
                {
                    Label lbl = (Label)tcHeadingPager.FindControl("lbl" + i);

                    lbl.Text = (i + 1 + pageOffset).ToString();
                    if (i == 1 && lbl.Text != "2")
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
                    this.ViewState.Add(lnk.ID, (lnk.Text));
                    if (lnk.CssClass != "HeaderPagerNoMargin")
                        lnk.CssClass = "DisplayInline";
                    lnk.Visible = true;
                }
            }
            if (noOfPages > 1)
            {
                if (currentPage != 0)
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
                if (currentPage == noOfPages - 1)
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
             */
        }

        /*
        private void addSeparatorRows(DataGrid dtg)
        {
            if (insertSeperatorRows)
            {
                Table Tbl = (Table)dtg.Controls[0];

                //Extra row above heading needed for layout
                //heading text gets cut at top otherwise
                int topSeparatorRowIndex = 2; //Account for pager row

                //Adjust for ALL, paging = false
                int AllAdjust = 0;
                if (dtg.AllowPaging == false)
                {
                    AllAdjust = -1;
                    topSeparatorRowIndex = 1;
                }
                //add rows
                for (int i = Tbl.Rows.Count - 2; i > (0 + AllAdjust); i -= 1)
                {
                    DataGridItem DGI;
                    TableCell Cell;

                    DGI = new DataGridItem(0, 0, ListItemType.Item);
                    DGI.CssClass = "ListManDataTableDottedLine";

                    Cell = new TableCell();
                    Cell.ColumnSpan = dtg.Columns.Count;
                    Cell.Text = "<img src=\"../Images/shim.gif\" width=\"1\" height=\"1\">";
                    DGI.Cells.Add(Cell);

                    //fixed if first seperator under header
                    if (i == topSeparatorRowIndex)
                    {
                        DGI.CssClass += " DataGridFixedHeader";
                    }
                    Tbl.Controls.AddAt(i, DGI);
                }
            }
        }*/
        #endregion

        #region Export To Excel

        protected void ExportToExcelClick(object sender, EventArgs e)
        {
            // reload report
            showReport_Click(sender, e);
            // export
            ExportReportToExcel();
        }

        protected void ExportToCSVClick(object sender, EventArgs e)
        {
            // reload report
            showReport_Click(sender, e);
            // export
            ExportReportToCSV();
        }

        private void ExportReportToExcel()
        {
            DataView dv = AdminReportGrid.DataSource as DataView;
            if (dv != null && dv.Table.Rows.Count > 0)
            {
                base.ExportToExcel(dv);
            }
        }

        private void ExportReportToCSV()
        {
            DataView dv = AdminReportGrid.DataSource as DataView;
            if (dv != null && dv.Table.Rows.Count > 0)
            {
                base.ExportToCSV(dv.Table);
            }
        }

        #endregion

        #region Patient Characteristics
        private bool PatientCharacteristicsExist(string disease)
        {
            string webPath = "~/App_Data/RData/" + disease + "/TableOne.csv";
            string filePath = System.Web.Hosting.HostingEnvironment.MapPath(webPath);
        
            if (disease == "Ovarian" || disease == "Gastric")
            {
                return false;
            }
            else 
            {
                return System.IO.File.Exists(filePath);
            }

            
        }
        #endregion
    }
}