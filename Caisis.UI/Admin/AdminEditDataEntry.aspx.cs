using System;
using System.Data;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using Caisis.BOL;
using Caisis.DataAccess;
using Caisis.UI.Core.DataEntry;
using Caisis.UI.Core.Classes;
using Caisis.UI.Core.Classes.CustomControls;

using Caisis.Extensions;

using System.Xml;
using System.Xml.Linq;


namespace Caisis.UI.Admin
{
    public partial class AdminEditDataEntry : AdminBasePage
    {
        /// <summary>
        /// Gets the Metadata Table passed via query string
        /// </summary>
        protected string QueryTableName
        {
            get
            {
                return Request.QueryString["table"];
            }
        }

        /// <summary>
        /// Gets the Metadata TableId passed via query string
        /// </summary>
        protected string QueryTableId
        {
            get
            {
                return Request.QueryString["tableId"];
            }
        }

        /// <summary>
        /// 
        /// </summary>
        protected string Table
        {
            get
            {
                return biz != null ? biz.TableName : string.Empty;
            }
        }

        /// <summary>
        /// 
        /// </summary>
        protected string ScrollX
        {
            get
            {
                return Request.QueryString["scrollX"];
            }
        }

        private int? tableId = null;
        private IBusinessObject biz;
        Caisis.Controller.PatientDataEntryController _dataEntryController;

        protected string TableName;

        public AdminEditDataEntry()
            : base()
        {
            this.Init += (a, b) =>
                {
                    // initalize the data entry controller in context of current disease, NOT session
                    _dataEntryController = new Caisis.Controller.PatientDataEntryController(QueryDiseaseName);
                    // defaults
                    SetQueryDefaults();
                };
        }

        protected override void Page_Load(object sender, EventArgs e)
        {
            SetListTitle();
            BuildTables(QueryDiseaseId);
        }

        /// <summary>
        /// Sets the main list title (i.e., editing prostate forms)
        /// </summary>
        private void SetListTitle()
        {
            string type = QueryDiseaseId.HasValue ? QueryDiseaseName : "All";
            ListTitle.Text = type + " Forms";
            ListTitle.ToolTip = ListTitle.Text;
        }

        /// <summary>
        /// Builds a list of Tables based on current disease (if applicable)
        /// </summary>
        ///<param name="diseaseId"></param>
        private void BuildTables(int? diseaseId)
        {
            // get all metatables, filter by table supress in current disease (if applicable)
            var dataEntryForms = _dataEntryController.GetDataEntryForms();
            string disease = !string.IsNullOrEmpty(QueryDiseaseName) ? QueryDiseaseName : "All";
            var metaTables = BOL.BusinessObject.GetAll<MetadataTable>();
            var allTables = from b in metaTables
                            let tableId = (int)b[MetadataTable.TableId]
                            let table = b[MetadataTable.TableName_Field].ToString()
                            // only show current data entry forms
                            where dataEntryForms.Contains(table)
                            select new
                            {
                                TableId = tableId,
                                TableName = table,
                                TableDepth = BOL.BusinessObject.GetTableDepth(table)
                            };
            var tableNames = allTables.Select(t => t.TableName);

            // METHOD 1: get depth map displaying only Patients and decendents
            //bool hasPatients = tableNames.Contains("Patients");
            //var sourceTables = hasPatients ? tableNames : tableNames.Concat(new string[] {  "Patients" });
            //var map = Caisis.Controller.PatientDataEntryController.GetTableDepthMap(sourceTables);
            //var patients = map.Where(x => x.Name.LocalName.Equals("Patients", StringComparison.OrdinalIgnoreCase));
            //var patientsAndChildren = from table in patients.DescendantsAndSelf().Select(x => x.Name.LocalName)
            //                          // remove Patients from list
            //                          where hasPatients ? true : table != "Patients"
            //                          select table;
            //var depthMap = Caisis.Controller.PatientDataEntryController.GetTableDepthMapLookup(patientsAndChildren, true);

            // METHOD 2: get full table map, possibly including non Patient Tables, i.e., Users, Protocols, etc...
            //var depthMap = Caisis.Controller.PatientDataEntryController.GetTableDepthMapLookup(tableNames, true);

            // METHOD 3: get Patient data entry forms
            var depthMap = Caisis.Controller.PatientDataEntryController.GetPatientDataEntryMapLookup(tableNames);


            // build normalized datasource
            var dataSource = from table in depthMap
                             join sib in allTables on table.Key equals sib.TableName
                             select new
                             {
                                 TableName = sib.TableName,
                                 TableId = sib.TableId,
                                 TableLabel = GetTableLabel(sib.TableName),
                                 TableDepth = table.Value
                             };

            // build list of tables
            TablesByDiseaseRptr.DataSource = dataSource;
            TablesByDiseaseRptr.DataBind();

            // if default biz set, build main interface
            if (biz != null)
            {
                BuildInterface(biz, QueryDiseaseName);
            }

            // only show interface if there are tables in disease view
            EditFormBox.Visible = biz != null;
            NoTablesMessage.Visible = dataSource.Count() == 0;
            SearchBox.Visible = dataSource.Count() > 0;
        }

        /// <summary>
        /// Builds the main and child interfaces
        /// </summary>
        private void BuildInterface(IBusinessObject bizo)
        {
            BuildInterface(bizo, string.Empty);
        }

        private void BuildInterface(IBusinessObject bizo, string disease)
        {
            string mainFormTable = bizo.TableName;

            // get list of tables, top, down
            List<string> tableNames = _dataEntryController.EnumerateTableNames(mainFormTable, null);
            // append optional query string table names (more tables)
            string queryTableNames = Request.QueryString["tableNames"];
            if (!string.IsNullOrEmpty(queryTableNames))
            {
                var queryTables = queryTableNames.Split(',').Except(tableNames);
                tableNames.AddRange(queryTables);
            }
            // get main table
            string tableName = tableNames.First();
            // sub forms
            var subFormTableNames = tableNames.Where(t => t != tableName);

            // MAIN TABLE

            EditFormBox.Visible = true;
            var inputControls = CICHelper.GetCaisisInputControlsByTableName(tableName, disease);
            // build main data entry 
            MainDataEntry.Controls.Clear();
            LoadDataEntryControl(tableName, MainDataEntry, inputControls);

            //SetTableLabel(MainLabel, mainFormTable);
            // build main label using full path of tables
            SetTableLabel(MainLabel, tableNames);
            SetTableIcon(MainTableSpecificIcon, tableName);

            MainLabel.ToolTip = biz.TableName;
            MainMetaTooltip.BuildTooltipTableMetadata(mainFormTable, QueryDiseaseName);

            // set button text
            string btnText = "Edit " + _dataEntryController.GetTableLabel(mainFormTable) + " Form";
            MainDataEntryEditBtn.InnerText = btnText;
            MainDataEntryEditBtn.Attributes["title"] = btnText;

            // CHILD TABLES
            foreach (var childTable in subFormTableNames)
            {
                string title = GetTableLabel(childTable);

                Panel childContainer = new Panel();
                Tabs.AddTab(title, childContainer);
                var childControls = CICHelper.GetCaisisInputControlsByTableName(childTable);
                LoadDataEntryControl(childTable, childContainer, childControls);
            }

            // set child container visibility
            ChildTableContainer.Visible = subFormTableNames.Count() > 0;

            // set table desc 
            string mainFormTableDesc = _dataEntryController.GetTableDescription(mainFormTable);
            TableDescLabel.Text = mainFormTableDesc;

            // set sub form label
            if (subFormTableNames.Count() > 0)
            {
                var childLabels = subFormTableNames.Select(t => GetTableLabel(t)).ToArray();
                string childFullLabel = string.Join(", ", childLabels);
                // trim long lists
                SubFormsLabel.Text = childFullLabel.Length > 25 ? childFullLabel.Substring(0, 25) + "..." : childFullLabel;
                // display full list on tooltip
                SubFormsLabel.ToolTip = childFullLabel;
            }
            else
            {
                SubFormsLabel.Text = "N/A";
                SubFormsLabel.ToolTip = "N/A";
            }

            // MORE TABLES (comment section to supress adding more tabs)
            //var allChildTables = _dataEntryController.GetChildDataEntryForms(mainFormTable);
            //// children + not in current list
            //var moreTables = allChildTables.Except(tableNames);
            //if (moreTables.Count() > 0)
            //{
            //    string baseURL = "AdminEditDataEntry.aspx?diseaseId=" + QueryDiseaseId + "&tableId=" + QueryTableId + "&scrollX=" + ScrollX + "&tableNames=";
            //    foreach (string table in moreTables)
            //    {
            //        string tableLabel = _dataEntryController.GetTableLabel(table);
            //        string tabURL = baseURL + string.Join(",", tableNames.Concat(new string[] { table }).ToArray());
            //        LinkButton link = new LinkButton();
            //        link.Text = tableLabel;
            //        link.OnClientClick = "window.location = '" + tabURL + "'; return false;";
            //        Tabs.AddMoreTab(link);
            //    }
            //}

            // set layout text
            bool isGrid = _dataEntryController.IsGridView(mainFormTable);
            int colCount = _dataEntryController.GetNumDisplayColumns(mainFormTable);
            TableLayoutType.Text = isGrid ? "Grid" : (colCount + " Columns");
        }

        /// <summary>
        /// Sets UI elements on main disease list
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void SetDiseaseListUI(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                string table = DataBinder.Eval(e.Item.DataItem, "TableName").ToString();
                Image tableIcon = e.Item.FindControl("TableSpecificIcon") as Image;
                SetTableIcon(tableIcon, table);
            }
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="icon"></param>
        /// <param name="table"></param>
        protected void SetTableIcon(Image icon, string table)
        {
            string iconPath = _dataEntryController.GetTableIcon(table, true);
            if (!string.IsNullOrEmpty(iconPath))
            {
                icon.Visible = true;
                icon.ImageUrl = iconPath;
            }
            else
            {
                icon.Visible = false;
                icon.ImageUrl = "";
            }
        }

        /// <summary>
        /// Builds a grid on standard layout for child table
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void BuildChildDataEntryItem(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                string childTable = e.Item.DataItem.ToString();
                PlaceHolder childDataEntry = e.Item.FindControl("ChildDataEntry") as PlaceHolder;

                // set child label
                Label childLabel = e.Item.FindControl("ChildTableLabel") as Label;
                SetTableLabel(childLabel, childTable);

                // determine data entry type
                var controls = CICHelper.GetCaisisInputControlsByTableName(childTable);
                LoadDataEntryControl(childTable, childDataEntry, controls);
            }
        }

        #region utilities

        /// <summary>
        /// Gets the friendly table label
        /// </summary>
        /// <param name="table"></param>
        /// <returns></returns>
        protected string GetTableLabel(string table)
        {
            return !string.IsNullOrEmpty(table) ? _dataEntryController.GetTableLabel(table) : string.Empty;
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="testTableId"></param>
        /// <param name="index"></param>
        /// <returns></returns>
        protected bool IsDefaultTable(int testTableId, int index)
        {
            return tableId.HasValue ? tableId.Value == testTableId : false;// index == 0;
        }

        /// <summary>
        /// Loads the data entry interface by type (grid or standard layout)
        /// </summary>
        /// <param name="tableName"></param>
        /// <param name="container"></param>
        /// <param name="controls"></param>
        private void LoadDataEntryControl(string tableName, Control container, IEnumerable<ICaisisInputControl> controls)
        {
            // @PatientId lookup FIX: don't use session patient
            var lkpControls = from lkp in controls.OfType<ICaisisLookupControl>()
                              where
                                (!string.IsNullOrEmpty(lkp.LookupCode) && lkp.LookupCode.Contains("@PatientId"))
                                ||
                                (!string.IsNullOrEmpty(lkp.LookupDistinct) && lkp.LookupDistinct.Contains("@PatientId"))
                              select lkp;
            foreach (var lkpControl in lkpControls)
            {
                lkpControl.LookupCode = string.Empty;
                lkpControl.LookupDistinct = string.Empty;
            }

            // build grid table
            bool isGrid = _dataEntryController.IsGridView(tableName);
            if (isGrid)
            {
                int blankRows = _dataEntryController.GetTotalBlankGridRows(tableName);
                int totalBlankRows = _dataEntryController.GetVisibleBlankGridRows(tableName);
                var tableFieldsMetadata = _dataEntryController.GetTableFieldsMetadata(tableName);

                GridDataEntry con = LoadControl("~/Core/DataEntryForms/DataEntryControls/GridDataEntry.ascx") as GridDataEntry;
                container.Controls.Add(con);
                con.BuildLayout(tableName, blankRows, totalBlankRows, tableFieldsMetadata);
            }
            // build column layout
            else
            {
                int colCount = _dataEntryController.GetNumDisplayColumns(tableName);
                var commonDataElements = _dataEntryController.GetCommonDataElements(tableName);
                ColumnDataEntry con = LoadControl("~/Core/DataEntryForms/DataEntryControls/ColumnDataEntry.ascx") as ColumnDataEntry;
                con.SetControlIcon = SetControlMetaData;
                con.BuildControl += new CaisisEventHandler(SetControlToolTip);
                container.Controls.Add(con);
                con.BuildLayout(controls, colCount, commonDataElements);
            }
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void SetControlToolTip(ICaisisInputControl sender, EventArgs e)
        {
            string table = sender.Table;
            string field = sender.Field;
            MetadataTooltip tooltip = LoadControl("~/Core/DataEntryForms/DataEntryControls/MetadataTooltip.ascx") as MetadataTooltip;
            tooltip.BuildTooltipMetadata(table, field, QueryDiseaseName);
            this.Controls.Add(tooltip);
        }

        /// <summary>
        /// Sets the icon for the item based on disease specific attributes
        /// </summary>
        /// <param name="inputContorol"></param>
        /// <param name="icon"></param>
        private void SetControlMetaData(ICaisisInputControl inputControl, Image icon)
        {
            string disease = QueryDiseaseName;
            string table = inputControl.Table;
            string field = inputControl.Field;

            // determine if input control has disease customized metadata
            var fieldDiseaseMetadata = Caisis.Controller.PatientDataEntryController.GetTableFieldDiseaseMetadata(table, field, disease);
            bool isCustom = fieldDiseaseMetadata.Values.Where(a => a.Key == false).Count() > 0;
            if (isCustom)
            {
                icon.CssClass = "EditDataEntryField_icon_customized";
            }
        }

        /// <summary>
        /// Sets the default disease and table via query string
        /// </summary>
        private void SetQueryDefaults()
        {
            if (!string.IsNullOrEmpty(QueryTableId))
            {
                MetadataTable table = new MetadataTable();
                int key = int.Parse(QueryTableId);
                table.Get(key);

                SetTable(table);
            }
            else if (!string.IsNullOrEmpty(QueryTableName))
            {
                MetadataTable metaTable = BusinessObject.GetByFields<MetadataTable>(new Dictionary<string, object> { { MetadataTable.TableName_Field, QueryTableName } }).FirstOrDefault();
                if (metaTable != null)
                {
                    SetTable(metaTable);
                }
            }
            // sets current disease id field
            if (QueryDiseaseId.HasValue)
            {
                // set pri key
                CurrentDiseaseId.Value = QueryDiseaseId.Value.ToString();
                // set display name
                Disease disease = new Disease();
                disease.Get(QueryDiseaseId.Value);
                CurrentDiseaseName.Value = disease[Disease.DiseaseName].ToString();

                // show tables edit
                ManageTablesBtn.Visible = true;
                // set title
                ManageTablesBtn.InnerText = "Add/Remove " + QueryDiseaseName + " Forms";
            }
            else
            {
                // show tables edit
                //ManageTablesBtn.Visible = false;
            }
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="table"></param>
        private void SetTable(MetadataTable table)
        {
            tableId = (int)table[MetadataTable.TableId];
            TableName = table[MetadataTable.TableName_Field].ToString();

            biz = BusinessObjectFactory.BuildBusinessObject(TableName);
            if (tableId.HasValue)
            {
                CurrentTableId.Value = tableId.Value.ToString();
            }
            else
            {
                CurrentTableId.Value = string.Empty;
            }
        }

        /// <summary>
        /// Sets the friendly table label via metadata
        /// </summary>
        /// <param name="label"></param>
        /// <param name="tableName"></param>
        private void SetTableLabel(Label label, string tableName)
        {
            label.Text = GetTableLabel(tableName);
        }

        /// <summary>
        /// Sets the friendly trail of table names
        /// </summary>
        /// <param name="label"></param>
        /// <param name="tableNames"></param>
        private void SetTableLabel(Label label, List<string> tableNames)
        {
            if (tableNames.Count() > 0)
            {
                string mainTable = tableNames.First();
                var otherTables = tableNames.Where(t => t != mainTable);
                string mainTableLabel = GetTableLabel(mainTable);
                // set main label
                label.Text = mainTableLabel;
                // set other labels
                if (otherTables.Count() > 0)
                {
                    var otherTableLabels = otherTables.Select(t => GetTableLabel(t));
                    label.Text += " > " + string.Join(",", otherTableLabels.ToArray());
                }
            }
        }

        #endregion
    }
}