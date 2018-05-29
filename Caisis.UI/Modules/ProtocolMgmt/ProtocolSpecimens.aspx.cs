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

using Caisis.DataAccess;
using Caisis.BOL;
using System.Collections.Specialized;
using Caisis.UI.Core.Classes;
using Caisis.UI.Core.Classes.CustomControls;

using System.Linq;

namespace Caisis.UI.Modules.ProtocolMgmt
{
    public partial class ProtocolSpecimens : ProtocolMgmtBasePage
    {
        protected static readonly Dictionary<string, string> DISPLAY_COLUMNS = new Dictionary<string, string>
        {
            { "SpecimenSite", "Site" },
            { "PtProtocolStudyId", "Study ID" },
            { "SpecimenReferenceNumber", "Specimen ID" },
            { "SpecimenSubType", "Specimen Type" },
            { "AccessionAnatomicSite", "Biopsy Site" },
            { "AccessionProcName", "Collection Method" },
            { "SpecimenPreservationType", "Processing Method" },
            { "AccessionDate", "Collection Date" },
            { "SpecimenCollectionTime", "Collection Time" },
            { "SpecimenFrozenTime", "Time Frozen" },
            { "SpecimenStatus", "Status" }
       };

        /// <summary>
        /// Contains a list of statuses which allow a specimen to be bulk edited
        /// </summary>
        private Dictionary<SpecimenInventoryMode, IEnumerable<string>> SEQUENCE_STATUSES = new Dictionary<SpecimenInventoryMode, IEnumerable<string>>
        {
           { SpecimenInventoryMode.Pathology, new string[] { "Pathology Review Completed", "Banked by Pathology" } },
           { SpecimenInventoryMode.Sequencing, new string[] { "Pending Sequencing", "Tissue Extraction Unsuccessful", "Library Constructin Unsuccessful", "Sequencing Unsuccessful", "Sequenced" } },
           { SpecimenInventoryMode.Analysis, new string[] { "Pending Analysis", "Analysis Complete", "Analysis Unsuccessful" } }
        };

        #region Transfer Statuses

        public static readonly string[] TRANSFER_COLLECTION_STATUSES = new string[] { "In Transit to Pathology" };
        public static readonly string[] TRANSFER_PATHOLOGY_STATUSES = new string[] { "In Transit to Pathology", "In Transit to Sequencing" };
        public static readonly string[] TRANSFER_SEQUENCING_STATUSES = new string[] { "In Transit to Sequencing", "In Transit to Analysis" };
        public static readonly string[] TRANSFER_ANALYSIS_STATUSES = new string[] { "In Transit to Analysis", "In Transit to cBIO Portal" };
        public static readonly string[] TRANSFER_CBIO_STATUSES = new string[] { "In Transit to cBIO Portal" };

        #endregion

        private static readonly string defaultMode = "collection";
        protected string QueryMode
        {
            get
            {
                string mode = (Request.QueryString["mode"] + "").ToLower();
                return !string.IsNullOrEmpty(mode) ? mode : defaultMode;

            }
        }

        protected string QueryView
        {
            get
            {
                return Request.QueryString["view"] + "";
            }
        }

        private Dictionary<string, string> selectedColumns = new Dictionary<string, string>();

        private SpecimenManagerDa da = new SpecimenManagerDa();
        private SpecimenInventoryMode inventoryMode = SpecimenInventoryMode.Collection;


        public ProtocolSpecimens()
            : base()
        {
            this.Init += (o, e) => SetCollectionMode();
        }

        protected override void Page_Load(object sender, EventArgs e)
        {
            // AJAX
            ProcessAJAX();

            // TODO:
            string specimenConditionsArray = "['" + string.Join("','", specimenController.GetConditions()) + "']";
            Page.ClientScript.RegisterStartupScript(this.GetType(), "SpeicmenConditions", "initSpecimenConditions(" + specimenConditionsArray + ");", true);

            // TODO: register client side script for searching
            PageUtil.RegitserControlPostBackScript(SearchBtn, "doSearchClick");

            // set view mode
            SetCollectionNavigation();
            SetSpecimenNavigation();

            // TODO: refactor
            if (QueryMode == "manage")
            {
                Form.Visible = false;
                Manage_Frame.Visible = true;
                return;
            }
            else
            {
                // init filters
                InitializeFilters();
            }
            // trigger reload on postback
            bool reload = Request.Form["reload"] == "true";
            if (!Page.IsPostBack || reload)
            {
                bool isTransferMode = QueryView == "transfer";
                if (isTransferMode)
                {
                    BuildTransfers(sender, e);
                }
                else
                {
                    // get default list
                    DataTable defaultSpecimens = GetSpecimensInventory("", "");

                    // build list
                    BuildInventory(defaultSpecimens.DefaultView);
                }
                // set UI
                TransferListing_SectionHeader.Visible = isTransferMode;
                TransferListing_Section.Visible = isTransferMode;
                SpecimenInventory_SectionHeader.Visible = !isTransferMode;
                SpecimenInventory_Section.Visible = !isTransferMode;
                SpecimenInventoryButton_Section.Visible = !isTransferMode;

                // determine if transfer or view mode
                Specimen_Filters.Visible = !isTransferMode;
                Transfer_Filters.Visible = isTransferMode;
            }
            // set notice about dataset
            ImportantNotice.Visible = UserSpecimenType.HasValue && UserSpecimenType.Value == ProtocolMgmtSpecimenUser.Admin;
        
            // set report link
            ReportBtn.NavigateUrl = GetQueryString("Reports/ProtocolSpecimenReport.aspx");
        }

        // TODO: refactor to base page
        private void SetSpecimenNavigation()
        {
            // set link query string
            Collection_Link.HRef = GetQueryString("ProtocolSpecimens.aspx") + "&mode=collection";
            Pathology_Link.HRef = GetQueryString("ProtocolSpecimens.aspx") + "&mode=pathology";
            Sequencing_Link.HRef = GetQueryString("ProtocolSpecimens.aspx") + "&mode=sequencing";
            Analysis_Link.HRef = GetQueryString("ProtocolSpecimens.aspx") + "&mode=analysis";
            cBIO_Link.HRef = GetQueryString("ProtocolSpecimens.aspx") + "&mode=cbio";
            Manage_Link.HRef = GetQueryString("ProtocolSpecimens.aspx") + "&mode=manage";
            Manage_Frame.Attributes["src"] = GetQueryString("ProtocolSubjectIDs.aspx");

            // set active link            
            switch (inventoryMode)
            {
                case (SpecimenInventoryMode.Collection):
                    Collection_Link.Attributes["class"] = "active";
                    break;
                case (SpecimenInventoryMode.Pathology):
                    Pathology_Link.Attributes["class"] = "active";
                    break;
                case (SpecimenInventoryMode.Sequencing):
                    Sequencing_Link.Attributes["class"] = "active";
                    break;
                case (SpecimenInventoryMode.Analysis):
                    Analysis_Link.Attributes["class"] = "active";
                    break;
                case (SpecimenInventoryMode.cBIO):
                    cBIO_Link.Attributes["class"] = "active";
                    break;
                default:
                    break;
            }
            // set visibility via permissions
            if (!base.UserSpecimenType.HasValue)
            {
                Response.Write("Please see admin for access.");
                Response.End();
            }
            else
            {
                bool specimenUser = base.UserSpecimenType.Value == ProtocolMgmtSpecimenUser.User;
                bool specimenAdminUser = base.UserSpecimenType.Value == ProtocolMgmtSpecimenUser.Admin;

                Collection_Link.Visible = specimenUser || specimenAdminUser;
                Pathology_Link.Visible = specimenUser || specimenAdminUser;
                Sequencing_Link.Visible = specimenAdminUser;
                Analysis_Link.Visible = specimenAdminUser;
                cBIO_Link.Visible = specimenAdminUser;
                Manage_Link.Visible = specimenUser || specimenAdminUser;
            }

        }

        private void ProcessAJAX()
        {
            string method = Request.QueryString["method"] + "";
            if (!string.IsNullOrEmpty(Request.QueryString["ajax"]))
            {
                System.Web.Script.Serialization.JavaScriptSerializer serializer = new System.Web.Script.Serialization.JavaScriptSerializer();
                if (method == "getTransferSpecimens")
                {
                    int protocolId = int.Parse(Request.QueryString["protocolId"]);
                    int collectionId = int.Parse(Request.QueryString["collectionId"]);
                    Dictionary<int, string> existingSpecimens = new Dictionary<int, string>();

                    var specimens = BOL.BusinessObject.GetByFields<Specimen_SpecimenCollections>(new Dictionary<string, object>
                    {
                        { Specimen_SpecimenCollections.CollectionId, collectionId }
                    });
                    string datasetSQL = base.GetSpecimenPatientsDatasetSQL();
                    Specimens_Results.DataSource = da.GetTransferSpecimensByProtocol(protocolId, collectionId, datasetSQL);
                    Specimens_Results.DataBind();
                    Specimens_Results.Visible = true;
                }
            }
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void BuildTransfers(object sender, EventArgs e)
        {
            int protocolId = int.Parse(BaseProtocolId);
            // get specimen patients dataset
            string datasetSQL = base.GetSpecimenPatientsDatasetSQL();

            // display transfers initiated or recived in mode
            string[] collectionStatusList = new string[0];           
            switch (inventoryMode)
            {
                case (SpecimenInventoryMode.Collection):
                    collectionStatusList = TRANSFER_COLLECTION_STATUSES;
                    break;
                case (SpecimenInventoryMode.Pathology):
                    collectionStatusList = TRANSFER_PATHOLOGY_STATUSES;
                    break;
                case (SpecimenInventoryMode.Sequencing):
                    collectionStatusList = TRANSFER_SEQUENCING_STATUSES;
                    break;
                case (SpecimenInventoryMode.Analysis):
                    collectionStatusList = TRANSFER_ANALYSIS_STATUSES;
                    break;
                case (SpecimenInventoryMode.cBIO):
                    collectionStatusList = TRANSFER_CBIO_STATUSES;
                    break;
                default:
                    break;
            }

            DataView transfers = da.GetSpecimenTransfersByProtocol(protocolId, datasetSQL, collectionStatusList, new int[0]).DefaultView;

            //var data = from row in transfers.Table.AsEnumerable()
            //           group row by  (int)row["SpecimenRequestId"]  into g
            //           let row = g.First()
            //           select new
            //           {
            //               SpecimenRequestId = (int)row["SpecimenRequestId"],
            //               DistributionId = (int)row["DistributionId"],
            //               CollectionId = (int)row["CollectionId"],
            //               SpecimenCount = (int)row["SpecimenCount"],
            //               RequestIdentifier = row["RequestIdentifier"].ToString(),
            //               RequestDate = row["RequestDate"],
            //               DispatchedDate = row["DispatchedDate"],
            //               DispatchedContact = row["DispatchedContact"].ToString(),
            //               DispatchedInstitution = row["DispatchedInstitution"].ToString(),
            //               ReceivedDate = row["ReceivedDate"],
            //               ReceivedContact = row["ReceivedContact"].ToString(),
            //               ReceivedInstitution = row["ReceivedInstitution"].ToString(),
            //               DispatchedTrackingNumber = row["DispatchedTrackingNumber"].ToString(),
            //               SpecimenStatuses = g.Select(r => r["SpecimenStatus"].ToString()).Distinct()
            //           }; 
            ////DataTable transfers = da.GetRequests("", "", "", "", "", true);

            //TransferListing.DataSource = transfers;
            //TransferListing.DataBind();
            transfers.Sort = "DispatchedDate DESC";
            TransferListing_Rptr.DataSource = transfers;
            TransferListing_Rptr.DataBind();

            RecordCount.Text = transfers.Count + " Transfer(s)";
        }

        private void SetCollectionMode()
        {
            switch (QueryMode)
            {
                case ("pathology"):
                    inventoryMode = SpecimenInventoryMode.Pathology;
                    break;
                case ("sequencing"):
                    inventoryMode = SpecimenInventoryMode.Sequencing;
                    break;
                case ("analysis"):
                    inventoryMode = SpecimenInventoryMode.Analysis;
                    break;
                case ("cbio"):
                    inventoryMode = SpecimenInventoryMode.cBIO;
                    break;
                default:
                    inventoryMode = SpecimenInventoryMode.Collection;
                    break;
            }            
        }

        private void SetCollectionNavigation()
        {
            // set buttons
            Collection_Panel.Visible = inventoryMode == SpecimenInventoryMode.Collection;
            Pathology_Panel.Visible = inventoryMode == SpecimenInventoryMode.Pathology;
            Sequencing_Panel.Visible = inventoryMode == SpecimenInventoryMode.Sequencing;
            Analysis_Panel.Visible = inventoryMode == SpecimenInventoryMode.Analysis;
            cBIO_Panel.Visible = inventoryMode == SpecimenInventoryMode.cBIO;

            // set bulk edit button
            EditSequencePanel.Visible = inventoryMode == SpecimenInventoryMode.Pathology || inventoryMode == SpecimenInventoryMode.Sequencing || inventoryMode == SpecimenInventoryMode.Analysis;

            // legend
            bool isTransferMode = QueryView == "transfer";
            Legend.Visible = !isTransferMode;

            // banked specimens
            BankedSpecimensPreference.Visible = inventoryMode == SpecimenInventoryMode.Collection || inventoryMode == SpecimenInventoryMode.Pathology;
            if (BankedSpecimensPreference.Visible && !Page.IsPostBack)
            {
                var cookie = Request.Cookies.Get("HideBankedSpecimens");
                BankedSpecimensPreference.Checked = cookie != null && !string.IsNullOrEmpty(cookie.Value) && bool.Parse(cookie.Value);
            }
        }

        protected void SetSorting(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemIndex > -1)
            {
                string columnName = DataBinder.Eval(e.Item.DataItem, "Key").ToString();
                string columnText = DataBinder.Eval(e.Item.DataItem, "Value").ToString();
                LinkButton btn = e.Item.FindControl("SortLink") as LinkButton;
                btn.Text = columnText;
                btn.CommandArgument = columnName;
            }
        }

        protected void BuildOnSortClick(object sender, CommandEventArgs e)
        {
            // determine sort
            string currentSortColumn = SortColumn.Value;
            string currentSortDirection = SortDirection.Value;
            string newSortColumn = e.CommandArgument.ToString();
            string newSortDirection = currentSortColumn == newSortColumn && currentSortDirection == "ASC" ? "DESC" : "ASC";
            // set fields
            SortColumn.Value = newSortColumn;
            SortDirection.Value = newSortDirection;
            // run search
            SearchSpecimensClick(sender, e);
        }

        protected void BindSpecimenColumns(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemIndex > -1)
            {
                DataRowView row = (DataRowView)e.Item.DataItem;
                string status = row[Specimen.SpecimenStatus].ToString();
                string[] values = selectedColumns.Keys.Select(c => string.Format(c.EndsWith("Date") ? "{0:d}" : "{0}", row[c])).ToArray();
                Repeater columnsRptr = e.Item.FindControl("SpecimenInventoryColumns") as Repeater;
                columnsRptr.DataSource = values;
                columnsRptr.DataBind();

                string specimenId = row[Specimen.SpecimenId].ToString();

                // edit sequence in popup
                string[] statuses = GetSequencingStatuses();
                if (statuses.Count() > 0)
                {
                    bool canEditStatus = statuses.Any(s => status.Contains(s));
                    if (canEditStatus)
                        (e.Item.FindControl("SequenceRowClass") as Literal).Text = "editSequenceRow";
                }
            }
        }

        protected void SetCurrentTransferClick(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                string requestId = DataBinder.Eval(e.Item.DataItem, SpecimenRequest.SpecimenRequestId).ToString();
                int collectionId = (int)DataBinder.Eval(e.Item.DataItem, SpecimenCollection.CollectionId);
                string distributionId = DataBinder.Eval(e.Item.DataItem, SpecimenDistribution.DistributionId).ToString();
                // build row onclick action to edit transfer
                string script = string.Format("return editExistingTransfer('{0}', '{1}', '{2}', '{3}', null, null, null, event);", "edit", requestId, distributionId, collectionId);
                // allow modification in collection mode
                Button receivedButton = e.Item.FindControl("ReceivedButton") as Button;
                string statusMode = "received";
                string action = "edit";
                string status = "";
                string btnText = "";

                //string transferStatus = DataBinder.Eval(e.Item.DataItem, Specimen.SpecimenStatus).ToString();
                //string compareStatus = transferStatus.ToLower();

                // TODO: search specimen status for special statuses
                int protocolId = int.Parse(BaseProtocolId);
                DataTable specimens = da.GetTransferSpecimensByProtocol(protocolId, collectionId, base.GetSpecimenPatientsDatasetSQL());
                // determine button mode
                if (inventoryMode == SpecimenInventoryMode.Pathology && SearchStatus(specimens, "in transit to pathology"))
                {
                    status = "Banked by Pathology";
                    btnText = "Received by Pathology";
                }
                else if (inventoryMode == SpecimenInventoryMode.Sequencing && SearchStatus(specimens, "in transit to sequencing"))
                {
                    status = "Pending Sequencing Review";
                    btnText = "Received By Sequencing";
                }
                else if (inventoryMode == SpecimenInventoryMode.Analysis && SearchStatus(specimens, "in transit to analysis"))
                {
                    status = "Pending Analysis";
                    btnText = "Received By Analysis";
                }
                else if (inventoryMode == SpecimenInventoryMode.cBIO && SearchStatus(specimens, "in transit to cbio portal"))
                {
                    status = "Pending cBIO Portal Review";
                    btnText = "Received By cBIO";
                }
                else
                {
                    action = "readonly";
                    status = "readonly";
                    statusMode = "readonly";
                    btnText = "View";
                }            
               
                if (!string.IsNullOrEmpty(status))
                {
                    string receivedScript = string.Format("return editExistingTransfer('{0}', '{1}', '{2}', '{3}', '{4}', '{5}', '{6}', event);", action, requestId, distributionId, collectionId, statusMode, PageUtil.EscapeSingleQuotes(status), PageUtil.EscapeSingleQuotes(btnText));
                    receivedButton.Attributes["onclick"] = receivedScript;
                    receivedButton.Text = btnText;
                    receivedButton.Visible = CanEditTransfer(status);
                }
                else
                {
                    receivedButton.Visible = false;
                }
                if (inventoryMode == SpecimenInventoryMode.Collection)
                {
                    receivedButton.Text = "Edit";
                    receivedButton.Attributes["onclick"] = script;
                   // receivedButton.Visible = true;
                }
            }
        }

        protected string[] GetSequencingStatuses()
        {
            if (SEQUENCE_STATUSES.ContainsKey(inventoryMode))
                return SEQUENCE_STATUSES[inventoryMode].ToArray();
            return new string[0];
        }

        private bool SearchStatus(DataTable table, string status)
        {
            DataView view = table.DefaultView;
            view.RowFilter = Specimen.SpecimenStatus + " = '" + PageUtil.EscapeSingleQuotesForSql(status) + "'";
            return view.Count > 0;
        }

        protected void BuildSpecimenTransfers(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                var transfers = DataBinder.Eval(e.Item.DataItem, "SpecimenTransfers");
                var rptr = e.Item.FindControl("SpecimenTransfers_Rptr") as Repeater;
                rptr.DataSource = transfers;
                rptr.DataBind();
            }
        }

        protected void SearchSpecimensClick(object sender, EventArgs e)
        {
            string column = SearchSelection.Value;
            string search = "";
            switch (column)
            {
                case "PtProtocolStudyId":
                    search = PtProtocolStudyId_Filter.Value;
                    break;
                case "SpecimenReferenceNumber":
                    search = SpecimenReferenceNumber_Filter.Value;
                    break;
                case "SpecimenStatus":
                    search = SpecimenStatus_Filter.Value;
                    break;
                case "SpecimenSite":
                    search = SpecimenSite_Filter.Value;
                    break;
                default:
                    column = "";
                    break;
            }
            // clear sorting on search click
            if (sender == SearchBtn)
            {
                SortColumn.Value = "";
                SortDirection.Value = "";
            }
            // run search
            SearchSpecimens(search, column);

            // set banked preference
            if (BankedSpecimensPreference.Visible)
            {
                var cookie = new HttpCookie("HideBankedSpecimens");
                cookie.Expires = DateTime.Now.AddDays(7);
                cookie.Value = BankedSpecimensPreference.Checked.ToString().ToLower();
                Response.Cookies.Set(cookie);
            }
        }

        protected void SearchTransfersClick(object sender, EventArgs e)
        {
            int protocolId = int.Parse(BaseProtocolId);
            string datasetSQL = base.GetSpecimenPatientsDatasetSQL();

            string column = Transfer_SearchSelection.Value;
            string search = Transfer_SearchValue.Value;
            DataTable transfers = da.SearchSpecimenTransfersByProtocol(protocolId, datasetSQL, column, search);
            // for specimen search, adjust UI
            if (column == Specimen.SpecimenReferenceNumber)
            {
                var results = from row in transfers.AsEnumerable()
                              group row by row["SpecimenReferenceNumber"].ToString() into g
                              let row = g.First()
                              let result = new
                              {
                                  SpecimenReferenceNumber = g.Key,
                                  SpecimenTransfers = from r in g
                                                      where !r.IsNull(SpecimenRequest.RequestIdentifier)
                                                      select new
                                                      {
                                                          RequestIdentifier = r[SpecimenRequest.RequestIdentifier].ToString()
                                                      }
                              }
                              where result.SpecimenTransfers.Count() > 0
                              select result;

                TransferSpecimenListing_Rptr.DataSource = results;
                TransferSpecimenListing_Rptr.DataBind();

                RecordCount.Text = results.Count() + " Specimen(s)";

                TransferListing_Rptr.Visible = false;
                TransferListing_Header.Visible = false;
                TransferSpecimenListing_Rptr.Visible = true;
                TransferSpecimenListing_Header.Visible = true;
            }
            else
            {
                TransferListing_Rptr.DataSource = transfers;
                TransferListing_Rptr.DataBind();
                RecordCount.Text = transfers.Rows.Count + " Transfer(s)";

                TransferListing_Rptr.Visible = true;
                TransferListing_Header.Visible = true;
                TransferSpecimenListing_Rptr.Visible = false;
                TransferSpecimenListing_Header.Visible = false;
            }            
        }

        /// <summary>
        /// Dynamically update selected specimens' status based on source button/action
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void UpdateSpecimenStatusCommand(object sender, CommandEventArgs e)
        {
            string status = e.CommandArgument.ToString();
            if (!string.IsNullOrEmpty(status))
            {
                IEnumerable<int> selectedSpecimens = GetSelectedSpecimens();
                if (selectedSpecimens.Count() > 0)
                {
                    // mark selected with new status
                    UpdateSpecimenStatus(selectedSpecimens, status);
                    // refresh list to reflect update
                    SearchSpecimensClick(sender, e);
                }
            }
        }

        /// <summary>
        /// Foreach specimen id, update specimen record with new status
        /// </summary>
        /// <param name="specimens"></param>
        /// <param name="status"></param>
        private void UpdateSpecimenStatus(IEnumerable<int> specimens, string status)
        {
            foreach (int specimenId in specimens)
            {
                Specimen biz = new Specimen();
                biz.Get(specimenId);
                biz[Specimen.SpecimenStatus] = status;
                biz.Save();
            }
        }

        private void InitializeFilters()
        {
            int protocolId = int.Parse(BaseProtocolId);
            string datasetSQL = base.GetSpecimenPatientsDatasetSQL();
            DataSet searchFilters = da.GetSpecimenInventoryFiltersByProtocol(protocolId, datasetSQL, GetIncludedStatuses(), GetExcludedStatuses());
            DataTable distinctStudyIds = searchFilters.Tables[0];
            DataTable distinctStutuses = searchFilters.Tables[1];
            // static data bind
            if (!Page.IsPostBack)
            {
                SpecimenStatus_Filter.ShowEmptyListItem = distinctStutuses.Select("FieldValue = ''").Length == 0;
                SpecimenStatus_Filter.DataSource = distinctStutuses;
                SpecimenStatus_Filter.DataBind();

                // data bind columns
                ColumnSelection.DataSource = DISPLAY_COLUMNS;
                ColumnSelection.DataBind();
                foreach (ListItem item in ColumnSelection.Items)
                {
                    if (item.Value == PatientProtocol.PtProtocolStudyId || item.Value == Specimen.SpecimenReferenceNumber)
                        item.Enabled = false;
                    item.Selected = true;
                }
            }
            // special case: dynamic data binding
            PtProtocolStudyId_Filter.BuildComboData(distinctStudyIds, "FieldValue", "FieldValue");

            //PtProtocolStudyId_Filter.ShowEmptyListItem = distinctStudyIds.Select("FieldValue = ''").Length == 0;
            //PtProtocolStudyId_Filter.DataSource = distinctStudyIds;
            //PtProtocolStudyId_Filter.DataBind();

             // build sites
            if (!Page.IsPostBack)
            {
                Protocol protocol = new Protocol();
                protocol.Get(protocolId);
                if (!protocol.IsNull(Protocol.ProjectId))
                {
                    int projectId = (int)protocol[Protocol.ProjectId];
                    DataTable organizations = new ProjectManagementDa().GetAllOrganizationsByProjectId(projectId);
                    SpecimenSite_Filter.DataSource = organizations;
                    SpecimenSite_Filter.DataBind();
                }
            }
        }

        private string[] GetIncludedStatuses()
        {
            return new string[0];
        }

        private string[] GetExcludedStatuses()
        {
            List<string> excludedStatuses = new List<string>();
            excludedStatuses.Add("Collected");
            switch (inventoryMode)
            {
                case SpecimenInventoryMode.Collection:
                    excludedStatuses.Remove("Collected");
                    break;
                case SpecimenInventoryMode.Sequencing:
                case SpecimenInventoryMode.Analysis:
                case SpecimenInventoryMode.cBIO:
                    excludedStatuses.Add("Banked by Pathology");
                    break;
                default:
                    break;
            }
            return excludedStatuses.ToArray();
        }

        private void SearchSpecimens(string search, string column)
        {
            DataTable inventory = GetSpecimensInventory(search, column);
            BuildInventory(inventory.DefaultView);
        }

        private void BuildInventory(DataView inventoryView)
        {
            selectedColumns = GetSpecimenColumns();

            // build header
            HeaderRptr.DataSource = selectedColumns;
            HeaderRptr.DataBind();

            // build data
            string sortColumn = SortColumn.Value;
            string sortDirection = SortDirection.Value;
            if (!string.IsNullOrEmpty(sortColumn))
            {
                // special case
                if (sortColumn == "PtProtocolStudyId" && inventoryView.Count > 0)
                {
                    inventoryView = PatientProtocolController.SortPatientsByStudyId(inventoryView.ToTable(), sortDirection);
                }
                else
                {
                    inventoryView.Sort = sortColumn + " " + sortDirection;
                }
            }
            // do not show NULL statuses
            inventoryView.RowFilter = Specimen.SpecimenStatus + " IS NOT NULL";
            bool hideBankedSpeicmens = BankedSpecimensPreference.Checked && BankedSpecimensPreference.Visible;
            if (hideBankedSpeicmens)
            {
                inventoryView.RowFilter += " AND SpecimenSubType NOT IN ('Serum', 'Plasma', 'PAXGen')";
            }
            SpecimenInventoryRows.DataSource = inventoryView;
            SpecimenInventoryRows.DataBind();

            RecordCount.Text = inventoryView.Count + " Record(s)";
        }

        /// <summary>
        /// Get search results for selected speicmen query
        /// </summary>
        /// <param name="search"></param>
        /// <param name="column"></param>
        /// <returns></returns>
        private DataTable GetSpecimensInventory(string search, string column)
        {
            int protocolId = int.Parse(BaseProtocolId);
            string datasetSQL = base.GetSpecimenPatientsDatasetSQL();
            // for collection mode, show all statuses
            DataTable inventory = da.GetSpecimenInventoryByProtocol(protocolId, datasetSQL, search, column, GetIncludedStatuses(), GetExcludedStatuses());
            // determine "enabled" transfer state for each specimen
            inventory.Columns.Add(new DataColumn("TransferEnabled", typeof(bool)));
            foreach (DataRow row in inventory.Rows)
                row["TransferEnabled"] = IsTransferEnabled(row[Specimen.SpecimenStatus].ToString());
            return inventory;
        }

        /// <summary>
        /// Returns if a specimen is available for transfer to the next stage
        /// </summary>
        /// <param name="status"></param>
        /// <returns></returns>
        private bool IsTransferEnabled(string status)
        {
            bool enabled = false;
            switch (inventoryMode)
            {
                case (SpecimenInventoryMode.Collection):
                    enabled = new string[] { "Collected", "In Transit to Pathology" }.Contains(status, StringComparer.OrdinalIgnoreCase);
                    break;
                case (SpecimenInventoryMode.Pathology):
                    enabled = new string[] { "Pathology Review Completed" }.Contains(status, StringComparer.OrdinalIgnoreCase);
                    break;
                case (SpecimenInventoryMode.Sequencing):
                    enabled = new string[] { "Sequenced" }.Contains(status, StringComparer.OrdinalIgnoreCase);
                    break;
                case (SpecimenInventoryMode.Analysis):
                    enabled = new string[] { "Analysis Complete", "Analysis Unsuccessul" }.Contains(status, StringComparer.OrdinalIgnoreCase);
                    break;
                case (SpecimenInventoryMode.cBIO):
                    enabled = new string[] { "Pending cBIO Portal Review" }.Contains(status, StringComparer.OrdinalIgnoreCase);
                    break;
                default:
                    enabled = false;
                    break;
            }
            return enabled;
        }

        /// <summary>
        /// Get a listing of the display columns
        /// </summary>
        /// <returns></returns>
        private Dictionary<string, string> GetSpecimenColumns()
        {
            var values = ColumnSelection.Items.Cast<ListItem>().Where(i => i.Selected && !string.IsNullOrEmpty(i.Value)).Select(i => i.Value).Distinct();
            return values.ToDictionary(c => c, c => DISPLAY_COLUMNS[c]);
        }

        /// <summary>
        /// Gets a list of selected Speicmens
        /// </summary>
        /// <returns></returns>
        private IEnumerable<int> GetSelectedSpecimens()
        {
            string formSpecimens = Request.Form["specimens"] + "";
            IEnumerable<int> formSpecimenIds = formSpecimens.Split(',').Select(s => int.Parse(s));
            return formSpecimenIds.Distinct();
        }

        private bool CanEditTransfer(string status)
        {
            bool isAdmin = base.UserSpecimenType.Value == ProtocolMgmtSpecimenUser.Admin;
            if (isAdmin)
            {
                return true;
            }
            // non-admins can only edit transfers in special statuses
            else
            {
                string[] statuses = new string[] { "Collected", "In Transit to Pathology", "Banked by Pathology", "Pathology Review Completed" };
                return statuses.Contains(status, StringComparer.OrdinalIgnoreCase);
            }
        }
    }
}