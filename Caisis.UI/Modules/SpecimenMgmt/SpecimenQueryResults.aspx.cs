using System;
using System.Collections;
using System.ComponentModel;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Web;
using System.Web.SessionState;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using System.Collections.Generic;
using System.Security;
using System.Security.Principal;
using System.Security.Permissions;
using Caisis.Security;

using Caisis.UI.Core.Classes;
using Caisis.UI.Core.Classes.CustomControls;
using Caisis.DataAccess;
using Caisis.BOL;

namespace Caisis.UI.Modules.SpecimenMgmt
{
    /// <summary>
    /// Takes query parameters as url variables and displays specimen result sets.
    /// </summary>
    public partial class SpecimenQueryResults : SpecimenMgmtBasePage
    {
        private string _queryType = ""; //<null> "Local" "BTCResearch" "BreastResearch" or "ProstateResearch"
        private string diseaseType = ""; //"All" "All" "Brain" "Breast" or "Prostate" - used in excelexportlog
        private string queryPurpose = ""; //used in excelexportlog
        private int _pageSize = 99; // results in 100 items per page
        private int _startRow = 1;
        private string _orderBy = "";
        private string _identifierType = CaisisConfiguration.GetWebConfigValue("SpecimenModuleDefaultId");
        SpecimenManagerDa da = new SpecimenManagerDa();

        protected override void Page_Load(object sender, System.EventArgs e)
        {
            if (Request.QueryString["QueryType"] != null)
            {
                _queryType = Request.QueryString["QueryType"];
            }

            if (!Page.IsPostBack)
            {
                string queryString = "";
                if (Request.Url.Query.Length > 0)
                {
                    queryString = "&" + PageUtil.EscapeSingleQuotes(Request.Url.Query.Substring(1));
                }
                // publish js variables client side for us by javascript functions
                ClientScript.RegisterClientScriptBlock(Page.GetType(), "x1", "<script language=\"javascript\">var queryType=\"" + _queryType + "\";</script>");
                ClientScript.RegisterClientScriptBlock(Page.GetType(), "x2", "<script language=\"javascript\">var queryString=\"" + queryString + "\";</script>");
                bool viewAllSpecs = bool.Parse(getQS("ViewAll"));
                this.chkViewAll.Checked = viewAllSpecs;

                // set title of column header from web config value
                PtId.Text = _identifierType;

                LoadSpecimensByQueryType(viewAllSpecs);

                LoadCollectionDDL();

            }
        }

        protected void ViewAllCheckChanged(object sender, EventArgs e)
        {
            LoadSpecimensByQueryType(this.chkViewAll.Checked);
        }

        private void LoadCollectionDDL()
        {
            ddlCollectionName.DataValueField = SpecimenCollection.CollectionId;
            ddlCollectionName.DataTextField = SpecimenCollection.CollectionName;
            //ddlCollectionName.DataSource = da.GetCollections(string.Empty, string.Empty, "Available", string.Empty, string.Empty, false);
            ddlCollectionName.DataSource = da.GetAvailableCollectionsForSpecimens();
            ddlCollectionName.DataBind();
        }

        private void LoadSpecimensByQueryType(bool showAll)
        {
            //to show patient MRN header on permission
            if (PermissionManager.HasPermission(PermissionManager.ViewPatientIdentifiers))
            {
                hdrMRN.Visible = true;
                //ExcelBtn.Visible = true;
            }

            // load results based on type of search 
            if (_queryType.Equals(""))
            {
                LoadSpecimens(showAll);
            }
            else if (_queryType.Equals("Local"))
            {
                LoadLocalData(showAll);
            }
            else if (_queryType.Equals("BTCResearch"))
            {
                LoadBTCResearchData(showAll);
            }
            else if (_queryType.Equals("BreastResearch"))
            {
                LoadBreastResearchData(showAll);
            }
            else if (_queryType.Equals("ProstateResearchByHistology"))
            {
                LoadProstateResearchByHistologyData(showAll);
            }
            else if (_queryType.Equals("ProstateResearchByReferenceNumber"))
            {
                LoadProstateResearchByReferenceNumberData(showAll);
            }
        }

        /// <summary>
        /// Execute the query that returns all specimens and bind to repeater
        /// </summary>
        private void LoadSpecimens(bool showAll)
        {
            this.modifyQueryBtn.Visible = false;

            if (showAll == true)
            {
                ResultsTitle.Text = "View All Specimens";
            }
            else
            {
                ResultsTitle.Text = "View Available Specimens";
            }

            string datasetSql = CacheManager.GetDatasetSQL(Session[SessionKey.DatasetId]);

            DataTable dt = da.GetAllSpecimensInRange(false, _identifierType, showAll, _startRow, _startRow + _pageSize, _orderBy, datasetSql);

            DataTable countTable = da.GetAllSpecimensInRange(true, _identifierType, showAll, _startRow, _startRow + _pageSize, _orderBy, datasetSql);
            int totalRecords = int.Parse(countTable.Rows[0]["TotalCount"].ToString());

            BindData(totalRecords, dt);
        }        
        
        /// <summary>
        /// Execute the local specimen query using values passed in query string and bind to repeater
        /// </summary>
        private void LoadLocalData(bool showAll)
        {
            ResultsTitle.Text = "Basic Search Results";
           
            if (!getQS("SampleStatus").Equals("Available") && !getQS("SampleStatus").Equals(""))
            {
                this.chkViewAll.Checked = true;
                this.chkViewAll.Enabled = false;
            }

            DataTable dt = GetLocalData(showAll, false, _startRow, _startRow + _pageSize);

            DataTable countTable = GetLocalData(showAll, true, _startRow, _startRow + _pageSize);
            int totalRecords = int.Parse(countTable.Rows[0]["TotalCount"].ToString());

            BindData(totalRecords, dt);
        }        

        /// <summary>
        /// Execute the BTC specimen query using values passed in query string and bind to repeater
        /// </summary>
        private void LoadBTCResearchData(bool showAll)
        {
            ResultsTitle.Text = "Brain Search Results";

            bool viewAllFields = bool.Parse(getQS("ViewAllFields"));
            if (viewAllFields == true)
            {
                PtIdHdr.Text = _identifierType;
                AllFieldsPanel.Visible = true;
                specimensPanel.Visible = false;

                DataTable Allfieldsdt = GetBTCResearchData(showAll, false, _startRow, _startRow + _pageSize);

                DataTable countTable = GetBTCResearchData(showAll, true, _startRow, _startRow + _pageSize);
                int totalRecords = int.Parse(countTable.Rows[0]["TotalCount"].ToString());

                if (totalRecords > 0)
                {
                    AllFieldsSpecsRpt.DataSource = Allfieldsdt.DefaultView;
                    AllFieldsSpecsRpt.DataBind();

                    ShowRecordCount(totalRecords);
                    this.checkAll.Enabled = true;
                }
                else
                {
                    this.noSpecimensRow.Visible = true;
                    DisableControls();
                }
            }
            else
            {
                //to show Pathology header
                hdrPathology.Visible = true;

                if (!getQS("SampleStatus").Equals("Available") && !getQS("SampleStatus").Equals(""))
                {
                    this.chkViewAll.Checked = true;
                    this.chkViewAll.Enabled = false;
                }

                DataTable dt = GetBTCResearchData(showAll, false, _startRow, _startRow + _pageSize);

                DataTable countTable = GetBTCResearchData(showAll, true, _startRow, _startRow + _pageSize);
                int totalRecords = int.Parse(countTable.Rows[0]["TotalCount"].ToString());

                BindData(totalRecords, dt);                
            }
        }        

        /// <summary>
        /// Execute the breast specimen query using clinical values passed in query string and bind to repeater
        /// </summary>
        private void LoadBreastResearchData(bool showAll)
        {
            ResultsTitle.Text = "Breast Search Results";

            DataTable dt = GetBreastResearchData(showAll, false, _startRow, _startRow + _pageSize);

            DataTable countTable = GetBreastResearchData(showAll, true, _startRow, _startRow + _pageSize);
            int totalRecords = int.Parse(countTable.Rows[0]["TotalCount"].ToString());

            BindData(totalRecords, dt);
        }

        /// <summary>
        /// Execute the prostate specimen query by histology using clinical values passed in query string and bind to repeater
        /// </summary>
        private void LoadProstateResearchByHistologyData(bool showAll)
        {
            ResultsTitle.Text = "Prostate Search Results By Histology";

            DataTable dt = GetProstateResearchByHistologyData(showAll, false, _startRow, _startRow + _pageSize);

            DataTable countTable = GetProstateResearchByHistologyData(showAll, true, _startRow, _startRow + _pageSize);
            int totalRecords = int.Parse(countTable.Rows[0]["TotalCount"].ToString());

            //BindData(totalRecords, dt);
            //PtIdHdr.Text = _identifierType;

            ProsSpecHistologyPanel.Visible = true;
            specimensPanel.Visible = false;

            if (totalRecords > 0)
            {
                ProsSpecHistologyRpt.DataSource = dt.DefaultView;
                ProsSpecHistologyRpt.DataBind();

                ShowRecordCount(totalRecords);
                this.checkAll.Enabled = true;
            }
            else
            {
                this.ProsSpecHistologyNoSpecsRow.Visible = true;
                DisableControls();
            }
        }

        /// <summary>
        /// Execute the prostate specimen query by reference number using clinical values passed in query string and bind to repeater
        /// </summary>
        private void LoadProstateResearchByReferenceNumberData(bool showAll)
        {
            ResultsTitle.Text = "Prostate Search Results By Reference Number";

            DataTable dt = GetProstateResearchByReferenceNumberData(showAll, false, _startRow, _startRow + _pageSize);

            DataTable countTable = GetProstateResearchByReferenceNumberData(showAll, true, _startRow, _startRow + _pageSize);
            int totalRecords = int.Parse(countTable.Rows[0]["TotalCount"].ToString());

            //BindData(totalRecords, dt);
            //PtIdHdr.Text = _identifierType;

            ProsSpecRefNumPanel.Visible = true;
            specimensPanel.Visible = false;

            if (totalRecords > 0)
            {
                ProsSpecRefNumRpt.DataSource = dt.DefaultView;
                ProsSpecRefNumRpt.DataBind();

                ShowRecordCount(totalRecords);
                this.checkAll.Enabled = true;
            }
            else
            {
                this.ProsSpecRefNumNoSpecsRow.Visible = true;
                DisableControls();
            }
        }

        //binds data to repeater
        private void BindData(int totalRecords, DataTable dt)
        {
            if (totalRecords > 0)
            {
                if (_queryType.Equals("BTCResearch"))
                {
                    rptSpecimenResults.DataSource = dt.DefaultView.ToTable(true, "SpecimenId", "ParentSpecimenId", "BoxId", "SpecimenReferenceNumber", "Identifier", "MRN", "SpecimenType", "SpecimenSubType", "SpecimenStatus", "SpecimenOriginalQty", "SpecimenUnits", "BoxName", "Position", "PathHistology");
                }
                else
                {
                    //to populate only distinct rows from DataTable depending upon columns binded to Repeater
                    rptSpecimenResults.DataSource = dt.DefaultView.ToTable(true, "SpecimenId", "ParentSpecimenId", "BoxId", "SpecimenReferenceNumber", "Identifier", "MRN", "SpecimenType", "SpecimenSubType", "SpecimenStatus", "SpecimenOriginalQty", "SpecimenUnits", "BoxName", "Position");
                }
                rptSpecimenResults.DataBind();

                ShowRecordCount(totalRecords);
                this.checkAll.Enabled = true;
            }
            else
            {
                this.noSpecimensRow.Visible = true;
                DisableControls();
            }

            // log report view
            Caisis.Controller.ReportController.LogReportView("Specimen: " + ResultsTitle.Text);
        }

        //gets datatable from Basic specimen query which is used in Repeater bind and sorting
        private DataTable GetLocalData(bool showAll, bool totalCount, int StartRow, int EndRow)
        {
            string collectDateFrom = "";
            string collectDateTo = "";
            if (PageUtil.IsDate(getQS("CollectDateFrom")))
            {
                collectDateFrom = getQS("CollectDateFrom").ToString();
            }
            if (PageUtil.IsDate(getQS("CollectDateTo")))
            {
                collectDateTo = getQS("CollectDateTo").ToString();
            }

            string[] typeArray = getQS("TypeArr").Split(new Char[] { ',' }, StringSplitOptions.RemoveEmptyEntries);
            string[] subTypeArray = getQS("SubTypeArr").Split(new Char[] { ',' }, StringSplitOptions.RemoveEmptyEntries);

            //NOTE TODO: Must take each querystring type-subtype pair and put into 2d array
            int numOfPairs = int.Parse(getQS("NumOfPairs"));
            string[,] pairsArray = new string[numOfPairs, 2]; //numOfPairs will tell us how many Type# and SubType# there are

            for (int i = 0; i < numOfPairs; i++)
            {
                int num = i + 1;
                string typeVal = getQS("Type" + num.ToString());
                string subtypeVal = getQS("SubType" + num.ToString());

                pairsArray[i, 0] = typeVal;
                pairsArray[i, 1] = subtypeVal;
            }

            string datasetSql = CacheManager.GetDatasetSQL(Session[SessionKey.DatasetId]);

            bool useBoxNameWildcard = bool.Parse(getQS("useBoxNameWildcard"));
            DataTable dt = da.GetLocalSpecimensInRange(totalCount, collectDateFrom, collectDateTo, pairsArray, getQS("Identifier"), getQS("SampleStatus"), getQS("BoxNo"), useBoxNameWildcard, getQS("IdType"), getQS("RefNum"), showAll, StartRow, EndRow, _orderBy, datasetSql);

            return dt;
        }

        //gets datatable from Basic specimen query which is used in Repeater bind and sorting
        private DataTable GetBTCResearchData(bool showAll, bool totalCount, int StartRow, int EndRow)
        {
            string collectDateFrom = "";
            string collectDateTo = "";
            if (PageUtil.IsDate(getQS("CollectDateFrom")))
            {
                collectDateFrom = getQS("CollectDateFrom").ToString();
            }
            if (PageUtil.IsDate(getQS("CollectDateTo")))
            {
                collectDateTo = getQS("CollectDateTo").ToString();
            }

            string[] typeArray = getQS("TypeArr").Split(new Char[] { ',' }, StringSplitOptions.RemoveEmptyEntries);
            string[] bloodArray = getQS("BloodSubTypeArr").Split(new Char[] { ',' }, StringSplitOptions.RemoveEmptyEntries);
            string[] tissueArray = getQS("TissueSubTypeArr").Split(new Char[] { ',' }, StringSplitOptions.RemoveEmptyEntries);
            string[] histologyArray = getQS("HistArr").Split(new Char[] { ',' }, StringSplitOptions.RemoveEmptyEntries);

            string datasetSql = CacheManager.GetDatasetSQL(Session[SessionKey.DatasetId]);

            bool useBoxNameWildcard = bool.Parse(getQS("useBoxNameWildcard"));
            DataTable dt = da.GetBTCSpecimensInRange(totalCount, collectDateFrom, collectDateTo, typeArray, bloodArray, tissueArray, histologyArray, getQS("HistopaOther"), getQS("HistopaGrade"), getQS("Contact"), getQS("OrgQty"), getQS("Optr"), getQS("Units"), getQS("RemQty"), getQS("RemOptr"), getQS("RemUnits"), getQS("Surgeon"), getQS("EventTest"), getQS("EventResult"), getQS("VitalStatus"), getQS("Identifier"), getQS("SampleStatus"), getQS("BoxNo"), useBoxNameWildcard, getQS("IdType"), getQS("RefNum"), getQS("MRN"), showAll, StartRow, EndRow, _orderBy, datasetSql);

            return dt;
        }

        //gets datatable from Breast specimen query which is used in Repeater bind and sorting
        private DataTable GetBreastResearchData(bool showAll, bool totalCount, int StartRow, int EndRow)
        {
            string[] typeArray = getQS("TypeArr").Split(new Char[] { ',' }, StringSplitOptions.RemoveEmptyEntries);
            string[] bloodArray = getQS("BloodSubTypeArr").Split(new Char[] { ',' }, StringSplitOptions.RemoveEmptyEntries);
            string[] tissueArray = getQS("TissueSubTypeArr").Split(new Char[] { ',' }, StringSplitOptions.RemoveEmptyEntries);
            
            string datasetSql = CacheManager.GetDatasetSQL(Session[SessionKey.DatasetId]);

            DataTable dt = da.GetBreastResearchSpecimensInRange(totalCount, getQS("AgeFrom"), getQS("AgeTo"),
                                               getQS("PriHistDiag"), getQS("HistopaGrade"),
                                               getQS("ER"), getQS("PR"), getQS("Her2ICC"), getQS("NodePositive"),
                                               getQS("AdjAgent"), getQS("RelapseStatus"),
                                               typeArray, bloodArray, tissueArray,
                                               getQS("PreservationType"), getQS("IdType"), showAll, StartRow, EndRow, datasetSql);
            return dt;
        }

        //gets datatable from Prostate specimen query by histology which is used in Repeater bind and sorting
        private DataTable GetProstateResearchByHistologyData(bool showAll, bool totalCount, int StartRow, int EndRow)
        {
            string datasetSql = CacheManager.GetDatasetSQL(Session[SessionKey.DatasetId]);

            DataTable dt = da.GetProstateResearchByHistologySpecimensInRange(totalCount, getQS("Histology"), getQS("IdType"), showAll, StartRow, EndRow, datasetSql);
            return dt;
        }

        //gets datatable from Prostate specimen query by reference number which is used in Repeater bind and sorting
        private DataTable GetProstateResearchByReferenceNumberData(bool showAll, bool totalCount, int StartRow, int EndRow)
        {
            string datasetSql = CacheManager.GetDatasetSQL(Session[SessionKey.DatasetId]);

            DataTable dt = da.GetProstateResearchByReferenceNumberSpecimensInRange(totalCount, getQS("ReferenceNumber"), getQS("IdType"), showAll, StartRow, EndRow, datasetSql);
            return dt;
        }

        /// <summary>
        /// sorting Specimens using headers in ascending & descending order
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void SortRecords(object sender, CommandEventArgs e)
        {
            SortAndBindRecords(e.CommandName);
        }

        protected void SortAndBindRecords(string sortCriteria)
        {
            bool showAll;
            bool check = this.chkViewAll.Checked;
            if (!check)
            {
                showAll = false;
            }
            else
            {
                showAll = true;
            }
            DataTable sortdt = new DataTable();

            string datasetSql = CacheManager.GetDatasetSQL(Session[SessionKey.DatasetId]);

            if (_queryType.Equals(""))
            {
                sortdt = da.GetAllSpecimens(_identifierType, showAll, datasetSql);
            }
            //sorting for Basic specimen query
            else if (_queryType.Equals("Local"))
            {
                DataTable countTable = GetLocalData(showAll, true, _startRow, _startRow + _pageSize);
                int totalRecords = int.Parse(countTable.Rows[0]["TotalCount"].ToString());

                sortdt = GetLocalData(showAll, false, _startRow, totalRecords);
            }
            //sorting for BTC query
            else if (_queryType.Equals("BTCResearch"))
            {
                //sortdt = GetBTCResearchData(showAll);
                DataTable countTable = GetBTCResearchData(showAll, true, _startRow, _startRow + _pageSize);
                int totalRecords = int.Parse(countTable.Rows[0]["TotalCount"].ToString());

                sortdt = GetBTCResearchData(showAll, false, _startRow, totalRecords);
            }
            //sorting for Breast query
            else if (_queryType.Equals("BreastResearch"))
            {
                DataTable countTable = GetBreastResearchData(showAll, true, _startRow, _startRow + _pageSize);
                int totalRecords = int.Parse(countTable.Rows[0]["TotalCount"].ToString());

                sortdt = GetBreastResearchData(showAll, false, _startRow, totalRecords);
            }
            else if (_queryType.Equals("ProstateResearch"))
            {
                //TODO
            }

            string SortField;
            switch (sortCriteria)
            {
                case "Ref":
                    SortField = "SpecimenReferenceNumber";
                    SortData(sortdt, SortField);
                    break;
                case "PtId":
                    SortField = "Identifier";
                    SortData(sortdt, SortField);
                    break;
                case "Type":
                    SortField = "SpecimenType";
                    SortData(sortdt, SortField);
                    break;
                case "SubType":
                    SortField = "SpecimenSubType";
                    SortData(sortdt, SortField);
                    break;
                case "Status":
                    SortField = "SpecimenStatus";
                    SortData(sortdt, SortField);
                    break;
                case "Box":
                    if (Box.ToolTip == "Click to sort descending")
                    {
                        sortdt.DefaultView.Sort = "BoxName Desc, Position";
                        Box.ToolTip = "Click to sort ascending";
                    }
                    else
                    {
                        sortdt.DefaultView.Sort = "BoxName, Position";
                        Box.ToolTip = "Click to sort descending";
                    }
                    break;
                case "PtMRN":
                    SortField = "MRN";
                    SortData(sortdt, SortField);
                    break;
                case "PtName":
                    SortField = "PtName";
                    SortData(sortdt, SortField);
                    break;
                case "OrgQty":
                    SortField = "SpecimenOriginalQty";
                    SortData(sortdt, SortField);
                    break;
                case "RemQty":
                    SortField = "SpecimenRemainingQty";
                    SortData(sortdt, SortField);
                    break;
                case "DOS":
                    SortField = "OpDate";
                    SortData(sortdt, SortField);
                    break;

            }
            
            DataView dv = sortdt.DefaultView;
            DataTable pagedTable = this.GetSortedDataTable(_pageSize, dv);

            // store sort criteria in hidden field to use in paging
            HiddenOrderBy.Value = dv.Sort;

            //update different repeater for Brain - view all fields results            
            if (_queryType.Equals("BTCResearch"))
            {
                rptSpecimenResults.DataSource = pagedTable.DefaultView.ToTable(true, "SpecimenId", "ParentSpecimenId", "BoxId", "SpecimenReferenceNumber", "Identifier", "MRN", "SpecimenType", "SpecimenSubType", "SpecimenStatus", "SpecimenOriginalQty", "SpecimenUnits", "BoxName", "Position", "PathHistology");
                rptSpecimenResults.DataBind();

                bool viewAllFields = bool.Parse(getQS("ViewAllFields"));
                if (viewAllFields == true)
                {
                    AllFieldsSpecsRpt.DataSource = pagedTable;
                    AllFieldsSpecsRpt.DataBind();
                }
            }
            else
            {
                //to populate only distinct rows from DataTable depending upon columns selected in Repeater
                rptSpecimenResults.DataSource = pagedTable.DefaultView.ToTable(true, "SpecimenId", "ParentSpecimenId", "BoxId", "SpecimenReferenceNumber", "Identifier", "MRN", "SpecimenType", "SpecimenSubType", "SpecimenStatus", "SpecimenOriginalQty", "SpecimenUnits", "BoxName", "Position");
                rptSpecimenResults.DataBind();
            }
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

        //paging sorted dataview table
        private DataTable GetSortedDataTable(int maxCount, DataView dv)
        {
            DataTable Table = dv.Table.Clone();
            int currentCount = 0;
            foreach (DataRowView drv in dv)
            {
                foreach (DataRow rowInTable in Table.Rows)
                {
                    for (int index = 0; index < rowInTable.ItemArray.Length; index++)
                    {
                        drv.Row.ItemArray[index].Equals(rowInTable.ItemArray[index]);
                    }
                }
                Table.ImportRow(drv.Row);
                if (currentCount++ == maxCount) break;
            }
            return Table;
        }

        protected void AddSpecimensToCollection(object sender, ImageClickEventArgs e)
        {
            int colIndex = this.ddlCollectionName.SelectedIndex;
            string addType = "";
            string redirectTo = "";

            // Build List of SpecimenIds
            string specimenIdList = "";

            if (_queryType.Equals("ProstateResearchByHistology"))
            {
                foreach (RepeaterItem item in ProsSpecHistologyRpt.Items)
                {
                    HtmlInputCheckBox checkBox = item.FindControl("chkSpId") as HtmlInputCheckBox;
                    if (checkBox.Checked)
                    {
                        HiddenField specimenId = item.FindControl("RowSpecimenId") as HiddenField;
                        specimenIdList += specimenId.Value + ",";
                    }
                }
            }
            else if (_queryType.Equals("ProstateResearchByReferenceNumber"))
            {
                foreach (RepeaterItem item in ProsSpecRefNumRpt.Items)
                {
                    HtmlInputCheckBox checkBox = item.FindControl("chkSpId") as HtmlInputCheckBox;
                    if (checkBox.Checked)
                    {
                        HiddenField specimenId = item.FindControl("RowSpecimenId") as HiddenField;
                        specimenIdList += specimenId.Value + ",";
                    }
                }
            }
            else
            {
                foreach (RepeaterItem item in rptSpecimenResults.Items)
                {
                    HtmlInputCheckBox checkBox = item.FindControl("chkSpId") as HtmlInputCheckBox;
                    if (checkBox.Checked)
                    {
                        HiddenField specimenId = item.FindControl("RowSpecimenId") as HiddenField;
                        specimenIdList += specimenId.Value + ",";
                    }
                }
            }
            specimenIdList = specimenIdList.TrimEnd(new char[] { ',' });

            if (colIndex == 0)
            {
                addType = "New";
                redirectTo = "Collection.aspx?showAsLayer=true&addTo=" + addType + "&specimenIds=" + specimenIdList;
            }
            else
            {
                addType = "Existing";
                redirectTo = "Collection.aspx?showAsLayer=true&addTo=" + addType + "&specimenIds=" + specimenIdList + "&colId=" + this.ddlCollectionName.Value;
            }

            Response.Redirect(redirectTo);
        }

        private void DisableControls()
        {
            this.checkAll.Enabled = false;

            this.addToCollectionBtn.Enabled = false;
            this.addToCollectionBtn.Style["cursor"] = "default";

            this.ddlCollectionName.Enabled = false;
        }

        /// <summary>
        /// Go Back to the appropriate Search Page.
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void GoBackToSearchPage(object sender, ImageClickEventArgs e)
        {
            string pageName = "";
            string optionalParamters = String.Empty;

            if (_queryType.Equals("Local"))
            {
                pageName = "LocalSpecimenQuery.aspx";
            }
            else if (_queryType.Equals("BTCResearch"))
            {
                pageName = "BTCSpecimenQuery.aspx";
            }
            else if (_queryType.Equals("BreastResearch"))
            {
                pageName = "AdvancedBreastSpecimenQuery.aspx";
            }
            else if (_queryType.Equals("ProstateResearchByHistology"))
            {
                pageName = "AdvancedProstateSpecimenQuery.aspx";
                optionalParamters = "&prostateQueryType=histology";
            }
            else if (_queryType.Equals("ProstateResearchByReferenceNumber"))
            {
                pageName = "AdvancedProstateSpecimenQuery.aspx";
                optionalParamters = "&prostateQueryType=reference number";
            }

            string redirectTo = pageName + "?" + Request.QueryString + "&setCriteria=true" + optionalParamters;

            Response.Redirect(redirectTo);
        }

        /// <summary>
        /// Disable the checkbox if the specimen is unavailable.
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void rptItemCreated(Object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                HtmlInputCheckBox cb = e.Item.FindControl("chkSpId") as HtmlInputCheckBox;
                HtmlAnchor a = e.Item.FindControl("selectAllinBoxTitle") as HtmlAnchor;
                HtmlTableCell cell = e.Item.FindControl("boxCell") as HtmlTableCell;

                DataRowView drv = (DataRowView)e.Item.DataItem;
                string specimenStatus = drv[Specimen.SpecimenStatus].ToString();
                if (specimenStatus.Contains("Unavailable"))
                {
                    cb.Disabled = true;
                    a.Title = "";
                    cell.Attributes.Remove("onmouseover");
                    cell.Attributes.Remove("onmouseout");
                    cell.Style.Add("cursor", "default");
                }
                else
                {
                    a.Title = "Select all specimens in box " + DataBinder.Eval(e.Item.DataItem, "BoxName");
                }

                //to show patient MRN on permission
                if (PermissionManager.HasPermission(PermissionManager.ViewPatientIdentifiers))
                {
                    HtmlTableCell mrn = (HtmlTableCell)e.Item.FindControl("dataMRN");
                    mrn.Visible = true;                    
                }

                if (_queryType.Equals("BTCResearch"))
                {
                    //show path histology
                    HtmlTableCell pathCell = (HtmlTableCell)e.Item.FindControl("dataPathology");
                    pathCell.Visible = true;
                    Label pathLbl = (Label)e.Item.FindControl("BTCPath");
                    pathLbl.Text = drv[Caisis.BOL.Pathology.PathHistology].ToString();
                }
            }
        }

        //Repeater to show all fields
        protected void AllFieldsRptItemCreated(Object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                HtmlInputCheckBox cb = e.Item.FindControl("chkSpId") as HtmlInputCheckBox;
                HtmlAnchor a = e.Item.FindControl("selectAllinBoxTitle") as HtmlAnchor;
                HtmlTableCell cell = e.Item.FindControl("boxCell") as HtmlTableCell;

                DataRowView drv = (DataRowView)e.Item.DataItem;
                string specimenStatus = drv[Specimen.SpecimenStatus].ToString();
                if (specimenStatus.Contains("Unavailable"))
                {
                    cb.Disabled = true;
                    a.Title = "";
                    cell.Attributes.Remove("onmouseover");
                    cell.Attributes.Remove("onmouseout");
                    cell.Style.Add("cursor", "default");
                }
                else
                {
                    a.Title = "Select all specimens in box " + DataBinder.Eval(e.Item.DataItem, "BoxName");
                }

                string datasetSql = CacheManager.GetDatasetSQL(Session[SessionKey.DatasetId]);

                //Checks blood samples for tissue available patients
                int saId = int.Parse(drv["SpecimenAccessionId"].ToString());                
                DataTable BloodDt = da.CheckBloodForTissue(saId, datasetSql);
                if (BloodDt.Rows.Count > 0)
                {
                    foreach (DataRow blood in BloodDt.Rows)
                    {
                        Label bloodLbl = (Label)e.Item.FindControl("BloodLbl");
                        if (blood["SpecimenType"].ToString() == "Blood")
                        {
                            bloodLbl.Text = "Y";
                        }
                    }
                }

                //check for Cytogenetic report for specimens
                int sId = int.Parse(drv["SpecimenId"].ToString());
                DataTable cytogeneticsDt = da.GetCytogeneticRpt(datasetSql);
                if (cytogeneticsDt.Rows.Count > 0)
                {
                    foreach (DataRow cytoRpt in cytogeneticsDt.Rows)
                    {
                        Label CytoLbl = (Label)e.Item.FindControl("CytoRptLbl");
                        if (cytoRpt["SpecimenId"].ToString() == sId.ToString())
                        {
                            CytoLbl.Text = "Y";
                        }
                        else if (drv["SpecimenType"].ToString() == "Blood")
                        {
                            CytoLbl.Text = "N/A";
                        }
                    }
                }
            }
        }

        //Repeater for prostate results by histology
        protected void ProsSpecHistologyRptItemCreated(Object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                HtmlInputCheckBox cb = e.Item.FindControl("chkSpId") as HtmlInputCheckBox;
                HtmlAnchor a = e.Item.FindControl("selectAllinBoxTitle") as HtmlAnchor;
                HtmlTableCell cell = e.Item.FindControl("boxCell") as HtmlTableCell;

                DataRowView drv = (DataRowView)e.Item.DataItem;
                string specimenStatus = drv[Specimen.SpecimenStatus].ToString();
                if (specimenStatus.Contains("Unavailable"))
                {
                    cb.Disabled = true;
                    a.Title = "";
                    cell.Attributes.Remove("onmouseover");
                    cell.Attributes.Remove("onmouseout");
                    cell.Style.Add("cursor", "default");
                }
                else
                {
                    a.Title = "Select all specimens in box " + DataBinder.Eval(e.Item.DataItem, "BoxName");
                }
            }
        }

        //Repeater for prostate results by reference
        protected void ProsSpecRefNumRptItemCreated(Object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                HtmlInputCheckBox cb = e.Item.FindControl("chkSpId") as HtmlInputCheckBox;
                //HtmlAnchor a = e.Item.FindControl("selectAllinBoxTitle") as HtmlAnchor;
                //HtmlTableCell cell = e.Item.FindControl("boxCell") as HtmlTableCell;

                DataRowView drv = (DataRowView)e.Item.DataItem;
                string specimenStatus = drv[Specimen.SpecimenStatus].ToString();
                if (specimenStatus.Contains("Unavailable"))
                {
                    cb.Disabled = true;
                    //a.Title = "";
                    //cell.Attributes.Remove("onmouseover");
                    //cell.Attributes.Remove("onmouseout");
                    //cell.Style.Add("cursor", "default");
                }
                else
                {
                    //a.Title = "Select all specimens in box " + DataBinder.Eval(e.Item.DataItem, "BoxName");
                }
            }
        }

        /// <summary>
        /// Display message with total number of specimen records returned
        /// </summary>
        /// <param name="numRecords">number of specimens returned</param>
        private void ShowRecordCount(int numRecords)
        {
            int numpages = numRecords / _pageSize;
            int endRow = _startRow + _pageSize;
            if (endRow > numRecords)
            {
                endRow = numRecords;
            }
            if (_startRow < 1)
            {
                _startRow = 1;
            }
            endRecordNumber.Value = endRow.ToString();
            startRecordNumber.Value = _startRow.ToString();

            if (numRecords > _pageSize)
            {
                // show previous and next btns
                priorRecordsBtn.Visible = true;
                nextRecordsBtn.Visible = true;

                if (_startRow <= 1)
                {
                    // disable previous button
                    priorRecordsBtn.Enabled = false;
                    priorRecordsBtn.ImageUrl = "~/Images/shim.gif";
                }
                else
                {
                    priorRecordsBtn.Enabled = true;
                    priorRecordsBtn.ImageUrl = "~/Images/Arrow_Previous_Red.gif";
                }

                if (endRow >= numRecords)
                {
                    // disable forward button
                    nextRecordsBtn.Enabled = false;
                    nextRecordsBtn.ImageUrl = "~/Images/shim.gif";
                }
                else
                {
                    // disable forward button
                    nextRecordsBtn.Enabled = true;
                    nextRecordsBtn.ImageUrl = "~/Images/Arrow_Next_Red.gif";
                }
            }
            numOfRecordsMsg.Text = "Viewing " + _startRow + " to " + endRow + " of " + numRecords + " records that matched your search criteria";
        }

        protected void GetMoreRecords(Object sender, CommandEventArgs e)
        {
            if (e.CommandName == "Previous")
            {
                _startRow = (int.Parse(startRecordNumber.Value) - (_pageSize + 1));
            }
            else if (e.CommandName == "Next")
            {
                _startRow = int.Parse(endRecordNumber.Value) + 1;
            }

            _orderBy = HiddenOrderBy.Value;

            bool check = this.chkViewAll.Checked;
            if (!check)
            {
                LoadSpecimensByQueryType(false);
            }
            else
            {
                LoadSpecimensByQueryType(true);
            }
        }

        //export all types of query results to Excel
        protected void ExportToExcelClick(object sender, EventArgs e)
        {
            bool showAll = this.chkViewAll.Checked;
            string datasetSql = CacheManager.GetDatasetSQL(Session[SessionKey.DatasetId]);

            DataTable XLDt=new DataTable();

            if (_queryType.Equals(""))
            {
                diseaseType = "All";
                queryPurpose = "Specimen:All Query Results";
                DataTable countTable = da.GetAllSpecimens(_identifierType, showAll, datasetSql);
                int totalRecords = countTable.Rows.Count;

                XLDt = da.GetAllSpecimensInRange(false, _identifierType, showAll, _startRow, totalRecords, _orderBy, datasetSql); 
            }
            else if (_queryType.Equals("Local"))
            {
                diseaseType = "All";
                queryPurpose = "Specimen:General Query Results";
                DataTable countTable = GetLocalData(showAll, true, _startRow, _startRow + _pageSize);
                int totalRecords = int.Parse(countTable.Rows[0]["TotalCount"].ToString());

                XLDt = GetLocalData(showAll, false, _startRow, totalRecords);
            }
            else if (_queryType.Equals("BTCResearch"))
            {
                diseaseType = "Neuro";
                queryPurpose = "Specimen:Brain Query Results";
                DataTable countTable = GetBTCResearchData(showAll, true, _startRow, _startRow + _pageSize);
                int totalRecords = int.Parse(countTable.Rows[0]["TotalCount"].ToString());

                XLDt = GetBTCResearchData(showAll, false, _startRow, totalRecords);


                bool viewAllFields = bool.Parse(getQS("ViewAllFields"));
                if (viewAllFields == true)
                {
                    XLDt.Columns.Remove("Position");
                    //renaming column names
                    XLDt.Columns["ContactPurpose"].ColumnName = "Contact/Purpose";
                    XLDt.Columns["EventType"].ColumnName = "Test";
                    XLDt.Columns["OpDate"].ColumnName = "DOS";
                    XLDt.Columns["OpCaseSurgeon"].ColumnName = "Surgeon";
                    XLDt.Columns["specimenRemainingQty"].ColumnName = "Rem Qty";
                                        
                    //DataColumn bloodFlag = new DataColumn("Blood", System.Type.GetType("System.String"));
                    //XLDt.Columns.Add(bloodFlag);
                    //DataColumn cytoRptFlag = new DataColumn("CytogeneticReport", System.Type.GetType("System.String"));
                    //XLDt.Columns.Add(cytoRptFlag);

                    //if new columns are added externally, they will be appended to the end of datatable
                    //so, using notes columns to append blood and cyto report flag to follow order of index shown on frondend
                    XLDt.Columns["SpecimenNotes"].ColumnName = "Blood";
                    XLDt.Columns["AccessionNotes"].ColumnName = "CytogeneticReport";
                    for(int i=0;i<XLDt.Rows.Count;i++)
                    {
                        XLDt.Rows[i]["Blood"] = "N";
                        int saId = int.Parse(XLDt.Rows[i]["SpecimenAccessionId"].ToString());
                        DataTable BloodDt = da.CheckBloodForTissue(saId, datasetSql);
                        if (BloodDt.Rows.Count > 0)
                        {
                            foreach (DataRow blood in BloodDt.Rows)
                            {
                                if (blood["SpecimenType"].ToString() == "Blood")
                                {
                                    XLDt.Rows[i]["Blood"] = "Y";
                                }
                            }
                        }                        
                        XLDt.Rows[i]["CytogeneticReport"] = "N";
                        string sId = XLDt.Rows[i]["SpecimenId"].ToString();
                        DataTable cytogeneticsDt = da.GetCytogeneticRpt(datasetSql);
                        if (cytogeneticsDt.Rows.Count > 0)
                        {
                            foreach (DataRow cytoRpt in cytogeneticsDt.Rows)
                            {
                                if (cytoRpt["SpecimenId"].ToString() == sId)
                                {
                                    XLDt.Rows[i]["CytogeneticReport"] = "Y";
                                }
                            }
                        }
                    }
                }
                else
                {
                    XLDt.Columns.Remove("specimenRemainingQty");
                    XLDt.Columns.Remove("PtName");
                    XLDt.Columns.Remove("ContactPurpose");
                    XLDt.Columns.Remove("OpDate");
                    XLDt.Columns.Remove("OpCaseSurgeon");
                    XLDt.Columns.Remove("EventType");
                    XLDt.Columns.Remove("VitalStatus");
                    XLDt.Columns.Remove("SpecimenNotes");
                    XLDt.Columns.Remove("AccessionNotes");
                }

                XLDt.Columns["PathHistology"].ColumnName = "Pathology";
                 //removing irrelevant columns
                XLDt.Columns.Remove("SpecimenAccessionId");
            }
            else if (_queryType.Equals("BreastResearch"))
            {
                diseaseType = "Breast";
                queryPurpose = "Specimen:Breast Query Results";
                DataTable countTable = GetBreastResearchData(showAll, true, _startRow, _startRow + _pageSize);
                int totalRecords = int.Parse(countTable.Rows[0]["TotalCount"].ToString());

                XLDt = GetBreastResearchData(showAll, false, _startRow, totalRecords);

            }
            else if (_queryType.Equals("ProstateResearchByHistology"))
            {
                diseaseType = "Prostate";
                queryPurpose = "Specimen:Prostate Query Results By Histology";


                DataTable countTable = GetProstateResearchByHistologyData(showAll, true, _startRow, _startRow + _pageSize);
                int totalRecords = int.Parse(countTable.Rows[0]["TotalCount"].ToString());

                XLDt = GetProstateResearchByHistologyData(showAll, false, _startRow, totalRecords);

                XLDt.Columns["specimenReferenceNumber"].ColumnName = "Ref. #";
                XLDt.Columns["pathHistology"].ColumnName = "Histology";
                XLDt.Columns["specimenType"].ColumnName = "Sample Type";
                XLDt.Columns["specimenSubType"].ColumnName = "SubType";
                XLDt.Columns["specimenStatus"].ColumnName = "Status";
                XLDt.Columns["specimenRemainingQty"].ColumnName = "Qty Remaining";
                XLDt.Columns["siteName"].ColumnName = "Site";
                XLDt.Columns["storageName"].ColumnName = "Freezer";
                XLDt.Columns["containerName"].ColumnName = "Container";
                XLDt.Columns["boxName"].ColumnName = "Box";
                XLDt.Columns["position"].ColumnName = "Position";

                //removing irrelevant columns
                if (XLDt.Columns["MRN"] != null) XLDt.Columns.Remove("MRN");
                if (XLDt.Columns["specimenid"] != null) XLDt.Columns.Remove("specimenid");
                if (XLDt.Columns["patientid"] != null) XLDt.Columns.Remove("patientid");
                if (XLDt.Columns["boxId"] != null) XLDt.Columns.Remove("boxId");
                if (XLDt.Columns["positionId"] != null) XLDt.Columns.Remove("positionId");
                if (XLDt.Columns["ParentSpecimenId"] != null) XLDt.Columns.Remove("ParentSpecimenId");

                if (XLDt.Columns["AccessionProcName"] != null) XLDt.Columns.Remove("AccessionProcName");
                if (XLDt.Columns["specimenPreservationType"] != null) XLDt.Columns.Remove("specimenPreservationType");
                if (XLDt.Columns["specimenOriginalQty"] != null) XLDt.Columns.Remove("specimenOriginalQty");
                if (XLDt.Columns["identifier"] != null) XLDt.Columns.Remove("identifier");
                if (XLDt.Columns["Age"] != null) XLDt.Columns.Remove("Age");
                if (XLDt.Columns["specimenUnits"] != null) XLDt.Columns.Remove("specimenUnits");
                if (XLDt.Columns["pathGGS"] != null) XLDt.Columns.Remove("pathGGS");
                if (XLDt.Columns["pathGrade"] != null) XLDt.Columns.Remove("pathGrade");
                if (XLDt.Columns["pathStageGroup"] != null) XLDt.Columns.Remove("pathStageGroup");
                if (XLDt.Columns["Last_PSA_Date"] != null) XLDt.Columns.Remove("Last_PSA_Date");
                if (XLDt.Columns["PSA_Result"] != null) XLDt.Columns.Remove("PSA_Result");
            }

            else if (_queryType.Equals("ProstateResearchByReferenceNumber"))
            {
                diseaseType = "Prostate";
                queryPurpose = "Specimen:Prostate Query Results By Reference Number";


                DataTable countTable = GetProstateResearchByReferenceNumberData(showAll, true, _startRow, _startRow + _pageSize);
                int totalRecords = int.Parse(countTable.Rows[0]["TotalCount"].ToString());

                XLDt = GetProstateResearchByReferenceNumberData(showAll, false, _startRow, totalRecords);

                XLDt.Columns["specimenReferenceNumber"].ColumnName = "Ref. #";
                XLDt.Columns["pathHistology"].ColumnName = "Histology";
                XLDt.Columns["specimenType"].ColumnName = "Sample Type";
                XLDt.Columns["specimenSubType"].ColumnName = "SubType";
                XLDt.Columns["Age"].ColumnName = "Age";
                XLDt.Columns["pathGGS"].ColumnName = "Gleason Score";
                XLDt.Columns["pathGrade"].ColumnName = "Stage Grade";
                XLDt.Columns["pathStageGroup"].ColumnName = "Stage Group";
                XLDt.Columns["Last_PSA_Date"].ColumnName = "Last PSA Date";
                XLDt.Columns["PSA_Result"].ColumnName = "PSA Result";

                //removing irrelevant columns
                if (XLDt.Columns["MRN"] != null) XLDt.Columns.Remove("MRN");
                if (XLDt.Columns["specimenid"] != null) XLDt.Columns.Remove("specimenid");
                if (XLDt.Columns["patientid"] != null) XLDt.Columns.Remove("patientid");
                if (XLDt.Columns["boxId"] != null) XLDt.Columns.Remove("boxId");
                if (XLDt.Columns["positionId"] != null) XLDt.Columns.Remove("positionId");
                if (XLDt.Columns["ParentSpecimenId"] != null) XLDt.Columns.Remove("ParentSpecimenId");

                if (XLDt.Columns["AccessionProcName"] != null) XLDt.Columns.Remove("AccessionProcName");
                if (XLDt.Columns["specimenPreservationType"] != null) XLDt.Columns.Remove("specimenPreservationType");
                if (XLDt.Columns["specimenOriginalQty"] != null) XLDt.Columns.Remove("specimenOriginalQty");
                if (XLDt.Columns["identifier"] != null) XLDt.Columns.Remove("identifier");
                if (XLDt.Columns["specimenUnits"] != null) XLDt.Columns.Remove("specimenUnits");
                if (XLDt.Columns["specimenRemainingQty"] != null) XLDt.Columns.Remove("specimenRemainingQty");
                if (XLDt.Columns["siteName"] != null) XLDt.Columns.Remove("siteName");
                if (XLDt.Columns["storageName"] != null) XLDt.Columns.Remove("storageName");
                if (XLDt.Columns["containerName"] != null) XLDt.Columns.Remove("containerName");
                if (XLDt.Columns["boxName"] != null) XLDt.Columns.Remove("boxName");
                if (XLDt.Columns["position"] != null) XLDt.Columns.Remove("position");
                if (XLDt.Columns["specimenStatus"] != null) XLDt.Columns.Remove("specimenStatus");

            }


            if (!_queryType.Equals("ProstateResearchByHistology") && !_queryType.Equals("ProstateResearchByReferenceNumber"))
            {
                //renaming column names
                XLDt.Columns["specimenReferenceNumber"].ColumnName = "Ref. #";
                XLDt.Columns["identifier"].ColumnName = _identifierType;
                if (XLDt.Columns["ptMRN"] != null)
                {
                    XLDt.Columns["ptMRN"].ColumnName = "MRN";
                }
                XLDt.Columns["specimenType"].ColumnName = "Type";
                XLDt.Columns["specimenSubType"].ColumnName = "SubType";
                XLDt.Columns["specimenStatus"].ColumnName = "Status";
                XLDt.Columns["specimenOriginalQty"].ColumnName = "Org Qty";             
                XLDt.Columns["specimenUnits"].ColumnName = "Units";
                XLDt.Columns["boxName"].ColumnName = "Box";
                
                //removing irrelevant columns
                XLDt.Columns.Remove("specimenid");
                XLDt.Columns.Remove("patientid");
                XLDt.Columns.Remove("AccessionProcName");
                XLDt.Columns.Remove("boxId");
                XLDt.Columns.Remove("positionId");
                XLDt.Columns.Remove("specimenPreservationType");
                XLDt.Columns.Remove("ParentSpecimenId");
                if (!_queryType.Equals("BTCResearch"))
                {
                    XLDt.Columns.Remove("specimenRemainingQty");
                }
            }

            if (!PermissionManager.HasPermission(PermissionManager.ViewPatientIdentifiers))
            {
                if (XLDt.Columns["ptMRN"] != null)
                {
                    XLDt.Columns.Remove("ptMRN");
                }

                if (XLDt.Columns["MRN"] != null)
                {
                    XLDt.Columns.Remove("MRN");
                }
            }

            if (XLDt.Rows.Count > 0)
            {
                DataView qryDataReportView = XLDt.DefaultView;

                WriteReportToExcel(qryDataReportView, diseaseType, queryPurpose);
            }
            else
            {
                Response.Write("<script language='javascript'>alert('There are no search results to export to excel !');</script>");
            }

        }

        protected void WriteReportToExcel(DataView view, string disease, string purpose)
        {
            // OLD CODE
            //Response.Clear();
            //Response.Buffer = true;
            ////Response.ContentType = "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet";
            //Response.ContentType = "application/vnd.ms-excel";
            //Response.AddHeader("Content-Disposition", "attachment;filename=SpecimenResults.xls");
            //Response.Charset = "";
            //this.EnableViewState = false;

            //GridView ExcelDg = new GridView();
            //ExcelDg.DataSource = view;
            //ExcelDg.DataBind();

            //System.IO.StringWriter oStringWriter = new System.IO.StringWriter();
            //System.Web.UI.HtmlTextWriter oHtmlTextWriter = new System.Web.UI.HtmlTextWriter(oStringWriter);

            //ExcelDg.RenderControl(oHtmlTextWriter);
            //Response.Write(oStringWriter.ToString());
            //Response.End();

            // NEW CODE
            //used to log user and export details on data export
            Caisis.Controller.ExcelExporter.ExportToExcel(this, view, "Specimen Results", "SpecimenResults.xls");            
        }

        #region Code Graveyard

        //protected string FormatRowColor(string strParentSpecimenId)
        //{
        //    string ParentSpecId = strParentSpecimenId.ToString();
        //    if (!string.IsNullOrEmpty(ParentSpecId))
        //    {
        //        return "style=backGround-color:#dfedf9";
        //    }
        //    else
        //    {
        //        return "style=backGround-color:#ffffff";
        //    }
        //}

        /*
		public void dgData_SortCommand(object source, DataGridSortCommandEventArgs e)
		{
			//BindData(e.SortExpression);
			string sortExpression = (string)Session["SortExp"];
			string sortDirection = (string)Session["SortDir"];

			if(sortExpression != e.SortExpression)
			{
				sortExpression = e.SortExpression;
				sortDirection = "asc";
			}
			else
			{
				if(sortDirection == "asc")
					sortDirection = "desc";
				else
					sortDirection = "asc";
			}      
			Session["SortExp"] = sortExpression;
			Session["SortDir"] = sortDirection;
			BindData(sortExpression + " " + sortDirection);
		}
         */

        /*
    private void onRowClick(object sender, System.Web.UI.WebControls.DataGridItemEventArgs e)
    {
        string strArg="";
        Label lblSpID=new Label();
			
        if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
        {
            lblSpID = ((Label)(e.Item.FindControl("spId"))); 
            strArg=lblSpID.Text;

            if(base.IsMemberOfgSpecimenIdList(gSpecimenIdList,strArg))
            {	HtmlInputCheckBox chkBx=new HtmlInputCheckBox();
                chkBx = (HtmlInputCheckBox)e.Item.FindControl("chkSpId") ;
                chkBx.Checked=true;
					
            }
		

        }
    }*/
        #endregion
    }
}
