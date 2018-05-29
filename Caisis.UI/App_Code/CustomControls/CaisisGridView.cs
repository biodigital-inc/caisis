using System;
using System.Data;
using System.Collections;
using System.Collections.Generic;
using System.Collections.Specialized;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.ComponentModel;

using Caisis.BOL;
using Caisis.UI.Core.Classes.CustomControls;

using System.Linq;

namespace Caisis.UI.Core.Classes
{
    public interface ICaisisGridView
    {
        List<int> DirtyRows
        {
            get;
        }

        IEnumerable<GridViewRow> DirtyGridRows
        {
            get;
        }
    }

    // Custom Caisis Grid View
    [DefaultProperty("Text"), ToolboxData("<{0}:CaisisGridView runat=server></{0}:CaisisGridView>")]
    public class CaisisGridView : GridView, ICaisisGridView
    {
        private List<int> dirtyRows = new List<int>();
        public string sid, eid, aid, did, checkid;

        private bool hasEmptyNewRow = false;
        private int totalBlankRows = 1;
        private int visibleBlankRows = 1;
        private bool enabledClientSideValidation;

        private bool autoGenerateStyles = true;
        private bool autoPopulateValues = true;
        private bool autoExtractValues = true;

        private bool showDeleteButton = true;
        private bool showUIHelper = true;
        private bool showDeleteInFirstPosition = false;

        private string auditTable;

        #region CSS Constants
        private static readonly string GRID_CSS_CLASS = "dataGrid";
        private static readonly string GRID_HEADER_CSS_CLASS = "dataGridHeader";
        private static readonly string GRID_ROW_CSS_CLASS = "dataGridItemRowA";
        private static readonly string GRID_ALT_ROW_CSS_CLASS = "dataGridItemRowB";
        private static readonly string GRID_BLANK_ROW_HIDDEN_CSS_CLASS = "dataGridBlankRowHidden";
        private static readonly string GRID_BLANK_ROW_VISIBLE_CSS_CLASS = "dataGridBlankRowVisible";
        #endregion

        #region Event Handlers
        /// <summary>
        /// Handles event when rows are added though the Add New Row button click (via AddButtonId)
        /// </summary>
        public event CancelEventHandler AddRowClick;
        /// <summary>
        /// Handles event when Grid is saving rows, that is,the Save Image is clicked (via SaveButtonId)
        /// </summary>
        public event CancelEventHandler SaveClick;
        #endregion

        protected override void OnRowUpdated(GridViewUpdatedEventArgs e)
        {
            base.OnRowUpdated(e);
        }

        // Static Helper Event Handlers
        public static readonly EventHandler CICDataBinderHandler = BindCaisisIputControlToData;

        #region CONSTRUCTOR
        public CaisisGridView()
            : base()
        {
            this.EnableViewState = false;
            this.autoExtractValues = false;
            this.AutoPopulateValues = false;
            InitializeGrid();
        }
        #endregion

        #region PUBLIC PROPERTIES

        /// <summary>
        /// Override datakey names and handle setting of duplicate key names
        /// </summary>
        public override string[] DataKeyNames
        {
            get
            {
                return base.DataKeyNames;
            }
            set
            {
                List<string> keyNames = new List<string>(value);
                List<string> uniqueKeyNames = new List<string>();
                foreach (string key in keyNames)
                {
                    if (!uniqueKeyNames.Contains(key))
                    {
                        uniqueKeyNames.Add(key);
                    }
                }
                base.DataKeyNames = uniqueKeyNames.ToArray();
            }
        }

        /// <summary>
        /// Gets or Sets whether to auto populate CaisisInputControl values to display.
        /// </summary>
        public bool AutoPopulateValues
        {
            get
            {
                return autoPopulateValues;
            }
            set
            {
                autoPopulateValues = value;
            }
        }

        /// <summary>
        /// Gets or Sets whether to auto extract CaisisInputControl values for saving.
        /// </summary>
        public bool AutoExtractValues
        {
            get
            {
                return autoExtractValues;
            }
            set
            {
                autoExtractValues = value;
            }
        }

        /// <summary>
        /// Gets or sets whether to AutoGenerate Grid, Rows, Alternating Styles, etc...
        /// </summary>
        public bool AutoGenerateStyles
        {
            get
            {
                return autoGenerateStyles;
            }
            set
            {
                autoGenerateStyles = value;
            }
        }

        /// <summary>
        /// Gets or Sets the number of empty rows in the grid.
        /// </summary>
        public int TotalBlankRows
        {
            get
            {
                return totalBlankRows;
            }
            set
            {
                totalBlankRows = value;
            }
        }

        /// <summary>
        /// Gets or sets the number of empty rows to display by default.
        /// </summary>
        public int VisibleBlankRows
        {
            get
            {
                return visibleBlankRows;
            }
            set
            {
                visibleBlankRows = value;
            }
        }

        /// <summary>
        /// Gets or sets whether to show/hide delete buttons
        /// </summary>
        public bool ShowDeleteButton
        {
            get
            {
                return showDeleteButton;
            }
            set
            {
                showDeleteButton = value;
            }
        }

        /// <summary>
        /// Gets or Sets whether to show/hide delete buttons
        /// </summary>
        public bool ShowUIHelper
        {
            get
            {
                return showUIHelper;
            }
            set
            {
                showUIHelper = value;
            }
        }

        /// <summary>
        /// The name of the audit table
        /// </summary>
        public string AuditTable
        {
            get
            {
                return auditTable;
            }
            set
            {
                auditTable = value;
            }
        } 

        /// <summary>
        /// Gets the indexes of rows which have changed values during PostBack.
        /// </summary>
        public List<int> DirtyRows
        {
            get
            {
                return dirtyRows;
            }
        }

        /// <summary>
        /// 
        /// </summary>
        public IEnumerable<GridViewRow> DirtyGridRows
        {
            get
            {
                return from row in dirtyRows
                       select this.Rows[row];
            }
        }

        /// <summary>
        /// Gets or sets the ID to the Button(Image,Link,Button) used to save records.
        /// </summary>
        [IDReferenceProperty(typeof(Control))]
        public string SaveButtonID
        {
            get
            {
                if (string.IsNullOrEmpty(sid))
                {
                    return "";
                }
                return sid;
            }
            set
            {
                sid = value;
            }
        }

        /// <summary>
        /// Gets or sets the ID to the Button(Image,Link,Button) to enable the Grid.
        /// </summary>
        [IDReferenceProperty(typeof(Control))]
        public string EditButtonID
        {
            get
            {
                if (string.IsNullOrEmpty(eid))
                {
                    return "";
                }
                return eid;
            }
            set
            {
                eid = value;
            }
        }

        /// <summary>
        /// Gets or sets the ID to the Button(Image,Link,Button) used to Add New Rows.
        /// </summary>
        [IDReferenceProperty(typeof(Control))]
        public string AddButtonId
        {
            get
            {
                if (string.IsNullOrEmpty(aid))
                {
                    return "";
                }
                return aid;
            }
            set
            {
                aid = value;
            }
        }

        /// <summary>
        /// Gets or sets the ID to the Button(Image,Link,Button) used to bulk delete records.
        /// </summary>
        [IDReferenceProperty(typeof(Control))]
        public string BulkDeleteButtonId
        {
            get
            {
                if (string.IsNullOrEmpty(did))
                {
                    return "";
                }
                return did;
            }
            set
            {
                did = value;
            }
        }

        [IDReferenceProperty(typeof(Control))]
        public string CheckAllRecordsId
        {
            get
            {
                if (string.IsNullOrEmpty(checkid))
                {
                    return "";
                }
                return checkid;
            }
            set
            {
                checkid = value;
            }
        }

        /// <summary>
        /// Gets or Sets whether to enable client side validation
        /// of Required CaisisInputControl Fields
        /// </summary>
        public bool EnableClientSideValidation
        {
            get
            {
                return enabledClientSideValidation;
            }
            set
            {
                enabledClientSideValidation = true;
            }
        }

        /// <summary>
        /// Gets the number of GridViewRows which are not bound to Database Keys
        /// </summary>
        public int ActualRows
        {
            get
            {
                var actualRows = from row in this.Rows.Cast<GridViewRow>()
                                 let rowIndex = row.RowIndex
                                 let keys = from keyName in this.DataKeyNames
                                            let keyValue = this.DataKeys[rowIndex][keyName]
                                            where keyValue != null && !string.IsNullOrEmpty(keyValue.ToString())
                                            select keyName
                                 where keys.Count() == this.DataKeyNames.Count()
                                 select row;
                return actualRows.Count();
                //return this.Rows.Count - this.TotalBlankRows;
            }
        }

        #endregion

        #region INITALIZATION/CREATION EVENTS

        /// <summary>
        /// 
        /// </summary>
        /// <param name="events"></param>
        protected override void OnLoad(EventArgs events)
        {
            base.OnLoad(events);
            // Add UI Helpers
            if (this.Columns.Count > 0)
            {
                if (ShowDeleteButton)
                {
                    this.Columns.Insert(this.Columns.Count, new GridRowDeleteImage());
                }
                if (ShowUIHelper)
                {
                    this.Columns.Insert(this.Columns.Count, new GridRowUIHelper());
                }
                if (!string.IsNullOrEmpty(AuditTable))
                {
                    // add audit column
                    this.Columns.Insert(this.Columns.Count, new AuditField(AuditTable));
                }
            }
            this.AttachClickEventToRefControls();
            this.DataBind();
        }

        /// <summary>
        /// 
        /// </summary>
        protected void InitializeGrid()
        {
            this.AutoGenerateColumns = false;
            if (this.AutoGenerateStyles)
            {
                this.CssClass = GRID_CSS_CLASS;
                this.HeaderStyle.CssClass = GRID_HEADER_CSS_CLASS;
                this.RowStyle.CssClass = GRID_ROW_CSS_CLASS;
                this.AlternatingRowStyle.CssClass = GRID_ALT_ROW_CSS_CLASS;
            }
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="row"></param>
        /// <param name="fields"></param>
        protected override void InitializeRow(GridViewRow row, DataControlField[] fields)
        {
            base.InitializeRow(row, fields);
            List<ICaisisInputControl> cicList = PageUtil.GetCaisisInputControlsInContainer(row);
            AttachFieldChangeToControls(cicList, this.HandleRowChanged);
            if (AutoPopulateValues)
            {
                AttachDataBindingToCaisisInputControls(cicList);
            }
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="rowIndex"></param>
        /// <param name="dataSourceIndex"></param>
        /// <param name="rowType"></param>
        /// <param name="rowState"></param>
        /// <returns></returns>
        protected override GridViewRow CreateRow(int rowIndex, int dataSourceIndex, DataControlRowType rowType, DataControlRowState rowState)
        {
            return base.CreateRow(rowIndex, dataSourceIndex, rowType, rowState | DataControlRowState.Edit);
        }
        #endregion

        #region EVENT HANDLERS

        #region CLICK EVENTS

        /// <summary>
        /// Occurs when user clicks Button/Link referenced by SaveButtonId
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void SaveClicked(object sender, EventArgs e)
        {
            this.HandleRowClickEvent(AddRowClick, sender, e);
        }

        /// <summary>
        /// Occurs when user clicks Button/Link referenced by AddButtonId
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void AddRowClicked(object sender, EventArgs e)
        {
            this.HandleRowClickEvent(AddRowClick, sender, e);
        }

        /// <summary>
        /// Occurs when user clicks Button/Link referenced by EditButtonId
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void EditClicked(object sender, EventArgs e)
        {
            this.DataBind();
            this.Enabled = true;
        }

        /// <summary>
        /// Handles click event on Add New Row click for Grids. 
        /// </summary>
        /// <param name="handler"></param>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void HandleRowClickEvent(CancelEventHandler handler, object sender, EventArgs e)
        {
            if (handler != null)
            {
                CancelEventArgs cancelArg = new CancelEventArgs(false);
                handler(this, cancelArg);
                if (!cancelArg.Cancel)
                {
                    this.Save();
                }
            }
            else
            {
                this.Save();
            }
        }

        /// <summary>
        /// Occurs when user clicks Button/Link referenced by BulkDeleteId
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void BulkDeleteClicked(object sender, EventArgs e)
        {
            foreach (int rowIndex in dirtyRows)
            {
                if (rowIndex < this.ActualRows && ActualRows > 0)
                {
                    foreach (Control c in this.Rows[rowIndex].Cells[0].Controls)
                    {
                        if (c is CheckBox)
                        {
                            if (((CheckBox)c).Checked)
                            {
                                this.DeleteRow(rowIndex);
                            }
                        }
                    }
                }
            }
            dirtyRows.Clear();
        }

        /// <summary>
        /// When a change has occured in a control for a row,
        /// that row is marked to be updated (dirty)
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="args"></param>
        protected void HandleRowChanged(object sender, EventArgs args)
        {
            GridViewRow row = ((Control)sender).NamingContainer as GridViewRow;
            if (null != row && !dirtyRows.Contains(row.RowIndex))
            {
                if (row.RowIndex >= 0)
                {
                    dirtyRows.Add(row.RowIndex);
                }
            }
        }

        #endregion

        /// <summary>
        /// Handle binding to ODS, show new empty row
        /// </summary>
        /// <param name="e"></param>
        protected override void OnDataBinding(EventArgs e)
        {
            if (!hasEmptyNewRow)
            {
                AddNewRows(TotalBlankRows);
                hasEmptyNewRow = true;
            }
            base.OnDataBinding(e);

        }


        /// <summary>
        /// Saves/Inserts/Updates the Dirty Rows,i.e.,
        /// GridViewRows with controls whose values
        /// have changed during PostBack.
        /// </summary>
        public void Save()
        {
            // Only updates rows with dirty controls
            foreach (int dirtyRowIndex in this.dirtyRows)
            {
                this.UpdateRow(dirtyRowIndex, false);
            }
            // Clear dirty rows array so multiple saves aren't needed.
            this.dirtyRows.Clear();
        }

        /// <summary>
        /// Extract CIC Field/Values from Grid Row
        /// </summary>
        /// <param name="fieldValues"></param>
        /// <param name="row"></param>
        /// <param name="includeReadOnlyFields"></param>
        /// <param name="includePrimaryKey"></param>
        protected override void ExtractRowValues(IOrderedDictionary fieldValues, GridViewRow row, bool includeReadOnlyFields, bool includePrimaryKey)
        {
            base.ExtractRowValues(fieldValues, row, includeReadOnlyFields, includePrimaryKey);
            if (AutoExtractValues)
            {
                CaisisGridView.ExtractCaisisInputValuesFromContainer(row, fieldValues);
            }
        }
        #endregion

        #region HELPER METHODS
        /// <summary>
        /// Attach click event to Control
        /// </summary>
        /// <param name="controlID"></param>
        /// <param name="handler"></param>
        private void AttachClickEventToControl(string controlID, EventHandler handler)
        {
            if (!string.IsNullOrEmpty(controlID))
            {
                Control ctrl = PageUtil.RecursiveFindControl(this.NamingContainer, controlID);
                if (ctrl != null)
                {
                    if (ctrl is Button)
                    {
                        ((Button)ctrl).Click += new EventHandler(handler);
                    }
                    if (ctrl is LinkButton)
                    {
                        ((LinkButton)ctrl).Click += new EventHandler(handler);
                    }

                    else if (ctrl is ImageButton)
                    {
                        ((ImageButton)ctrl).Click += new ImageClickEventHandler(handler);
                    }
                }
            }
        }

        /// <summary>
        /// Attaches event handler to occur when field has changed
        /// </summary>
        /// <param name="controls"></param>
        /// <param name="handler"></param>
        private void AttachFieldChangeToControls(List<ICaisisInputControl> controls, EventHandler handler)
        {
            foreach (ICaisisInputControl ctrl in controls)
            {
                if (ctrl is TextBox)
                {
                    ((TextBox)ctrl).TextChanged += new EventHandler(handler);
                }
                else if (ctrl is CheckBox)
                {
                    ((CheckBox)ctrl).CheckedChanged += new EventHandler(handler);
                }
                else if (ctrl is DropDownList)
                {
                    ((DropDownList)ctrl).TextChanged += new EventHandler(handler);
                }
            }
        }

        /// <summary>
        /// Wires controls to set values after they have been bound to data.
        /// </summary>
        /// <param name="cicList"></param>
        private void AttachDataBindingToCaisisInputControls(List<ICaisisInputControl> cicList)
        {
            foreach (ICaisisInputControl cic in cicList)
            {
                if (cic is CaisisSelect)
                {
                    (cic as DropDownList).DataBound += CICDataBinderHandler;
                }
                else
                {
                    (cic as Control).DataBinding += CICDataBinderHandler;
                }
            }
        }

        /// <summary>
        /// Wires referenced control IDs (AddButtonId, EditButtonId, etc..) for events
        /// </summary>
        private void AttachClickEventToRefControls()
        {
            AttachClickEventToControl(this.SaveButtonID, this.SaveClicked);
            AttachClickEventToControl(this.EditButtonID, this.EditClicked);
            AttachClickEventToControl(this.AddButtonId, this.AddRowClicked);
            AttachClickEventToControl(this.BulkDeleteButtonId, this.BulkDeleteClicked);
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="numRows"></param>
        private void AddNewRows(int numRows)
        {
            object o = PageUtil.RecursiveFindControl(this.NamingContainer, this.DataSourceID);
            if (o is CustomObjectDataSource)
            {
                CustomObjectDataSource ds = PageUtil.RecursiveFindControl(this.NamingContainer, this.DataSourceID) as CustomObjectDataSource;
                ds.AddNewRows(numRows);
            }
        }

        #endregion

        #region STATIC HELPERS

        public static bool IsDirtyGridRow(GridViewRow gridRow)
        {
            CaisisGridView parentGrid = (CaisisGridView)gridRow.NamingContainer;
            int rowIndex = gridRow.RowIndex;
            return (parentGrid.dirtyRows.Contains(rowIndex) || gridRow.RowIndex < parentGrid.ActualRows);
        }

        /// <summary>
        /// Returns a reference to the GridView containing the specified control
        /// Returns null is not a child of a GridView
        /// </summary>
        /// <param name="child">Control in GridView</param>
        /// <returns></returns>
        public static CaisisGridView GetGridViewByControl(Control child)
        {
            Control container = child.NamingContainer;
            while (!(container is CaisisGridView) || container == null)
            {
                container = container.NamingContainer;
            }
            return (CaisisGridView)container;
        }

        /// <summary>
        /// Get GridViewRow containing control "child"
        /// </summary>
        /// <param name="child">contorl is row</param>
        /// <returns></returns>
        public static GridViewRow GetGridViewRowByControl(Control child)
        {
            Control container = child.NamingContainer;
            while (!(container is GridViewRow) && container != null)
            {
                if (container.NamingContainer != null)
                {
                    container = container.NamingContainer;
                }
                else
                {
                    return null;
                }
            }
            if (container is GridViewRow)
            {
                return (GridViewRow)container;
            }
            else
            {
                return null;
            }
        }
        // NOTE - below method should be used internall to wire event handlers

        /// <summary>
        /// Attaches a DataBound/DataBinding event handler to CaisisInputControls
        /// to populate the Value when bound to DataSource
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        public static void AttachDataBindingOnRowInitalize(object sender, Control container)
        {
            List<ICaisisInputControl> cicList = PageUtil.GetCaisisInputControlsInContainer(container);
            foreach (ICaisisInputControl cic in cicList)
            {
                if (cic is CaisisSelect)
                {
                    (cic as CaisisSelect).DataBound += CICDataBinderHandler;
                }
                else
                {
                    (cic as Control).DataBinding += CICDataBinderHandler;
                }
            }
        }

        /// <summary>
        /// Binds Caisis Input Controls to their associated "Field" based on underlying DataSource
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private static void BindCaisisIputControlToData(object sender, EventArgs e)
        {
            Control con = sender as Control;
            ICaisisInputControl iCIC = sender as ICaisisInputControl;
            object dataItem = DataBinder.GetDataItem(con.NamingContainer);
            if (dataItem != null && !string.IsNullOrEmpty(iCIC.Field))
            {
                string val = DataBinder.Eval(dataItem, iCIC.Field).ToString();
                iCIC.Value = val;
            }
        }

        /// <summary>
        /// Extracts values from CaisisInputControls in a container, and adds then to the dictionary based
        /// on ICaisisInputControl Field names. Will not overwrite existing values in dictionary (skip).
        /// </summary>
        /// <param name="con">The container control which contains the values to extract.</param>
        /// <param name="dictionary">A dictionary in which extracted key/value pairs will be added.</param>
        public static void ExtractCaisisInputValuesFromContainer(Control con, IOrderedDictionary dictionary)
        {
            ExtractCaisisInputValuesFromContainer(con, dictionary, string.Empty);
        }
        /// <summary>
        /// Extracts values from CaisisInputControls in a container, and adds then to the dictionary based
        /// on ICaisisInputControl Field names. Will not overwrite existing values in dictionary (skip).
        /// </summary>
        /// <param name="container">The container control which contains the values to extract.</param>
        /// <param name="dictionary">A dictionary in which extracted key/value pairs will be added.</param>
        /// <param name="tableFilter">Extact values from CIC with TableName=tableFilter</param>
        public static void ExtractCaisisInputValuesFromContainer(Control container, IOrderedDictionary dictionary, string tableFilter)
        {
            List<ICaisisInputControl> cicList = PageUtil.GetCaisisInputControlsInContainer(container);
            foreach (ICaisisInputControl iCIC in cicList)
            {
                if (string.IsNullOrEmpty(tableFilter) || tableFilter.Equals(iCIC.Table))
                {
                    string fieldName = iCIC.Field;
                    string fieldValue = iCIC.Value;
                    if (!dictionary.Contains(fieldName))
                    {
                        dictionary.Add(fieldName, fieldValue);
                    }
                }
            }
        }

        /// <summary>
        /// Handle Rendering to enable javascript/styling handling.
        /// </summary>
        /// <param name="writer"></param>
        protected override void Render(HtmlTextWriter writer)
        {
            int delColIndex = -1;
            for (int i = 0; i < this.Columns.Count; i++)
            {
                DataControlField col = this.Columns[i];
                if (col is GridRowDeleteImage)
                {
                    col.Visible = this.Enabled;
                    delColIndex = i;
                }
            }
            Control aid = PageUtil.RecursiveFindControl(this.NamingContainer, this.AddButtonId);

            if (aid != null)
            {
                aid.Visible = this.Enabled;
            }

            // Mark each blank row
            if (this.Rows.Count > 0)
            {
                int visibleBlankRows = Math.Min(VisibleBlankRows, TotalBlankRows);
                int lastActualRowIndex = ActualRows - 1;
                int lastVisibleRowIndex = lastActualRowIndex + visibleBlankRows;
                foreach (GridViewRow row in this.Rows)
                {
                    // blank rows
                    if (row.RowIndex > lastActualRowIndex)
                    {
                        // set css for visible or hidden blank row
                        bool isVisibleRow = row.RowIndex <= lastVisibleRowIndex;
                        row.CssClass = isVisibleRow ? GRID_BLANK_ROW_VISIBLE_CSS_CLASS : GRID_BLANK_ROW_HIDDEN_CSS_CLASS;
                        // hide delete button on blank rows
                        if (delColIndex > -1)
                        {
                            ImageButton deleteBtn = row.Cells[delColIndex].Controls[0] as ImageButton;
                            if (deleteBtn != null)
                            {
                                deleteBtn.Style.Add("visibility", "hidden");
                            }
                        }
                    }
                }
            }

            base.Render(writer);
        }
        #endregion
    }

    public class ExtendedGridView : GridView, ICaisisGridView
    {
        private string tableName;
        private BusinessObject baseBiz;
        private string appendToUserName;
        private bool autoUpdateChildGridViews = false;
        private bool autoBindChildGridByRowPrimaryKey = false;
        private bool blankData = false;
        private bool showFooterOnEmpty = false;
        private bool rebindDataOnDelete = false;

        //style
        private string blankRowCssClass;
        private string visibleBlankRowCssClass;
        private bool isEmpty;
        private bool showEmptyRecordsMessage;
        private string emptyRecordsMessage;
        private bool renderFullTable = false;
 
        private int blankRows = 0;
        private int visibleBlankRows = 1;
        private List<int> blankRowIndexs = new List<int>();

        private List<int> dirtyRows = new List<int>();

        /// <summary>
        /// Gets or sets the name of the BusinessObject table associated to the underlying DataSource
        /// </summary>
        public string TableName
        {
            get
            {
                return tableName;
            }
            set
            {
                tableName = value;
            }
        }

        /// <summary>
        /// Returns a list of "dirty" row indexes
        /// </summary>
        public List<int> DirtyRows
        {
            get
            {
                return dirtyRows;
            }
        }

        /// <summary>
        /// 
        /// </summary>
        public IEnumerable<GridViewRow> DirtyGridRows
        {
            get
            {
                return from row in dirtyRows
                       select this.Rows[row];
            }
        }

        public bool AutoUpdateChildGridViews
        {
            get
            {
                return autoUpdateChildGridViews;
            }
            set
            {
                autoUpdateChildGridViews = value;
            }
        }

        /// <summary>
        /// Gets or set whether child Grids should be DataBound to BusinessObject
        /// by parent key using Primary Key from parent grid row.
        /// </summary>
        public bool AutoBindChildGridByRowPrimaryKey
        {
            get
            {
                return autoBindChildGridByRowPrimaryKey;
            }
            set
            {
                autoBindChildGridByRowPrimaryKey = value;
            }
        }

        /// <summary>
        /// Gets or sets whether to show footer row when no data is present
        /// </summary>
        public bool ShowFooterOnEmpty
        {
            get
            {
                return showFooterOnEmpty;
            }
            set
            {
                showFooterOnEmpty = value;
            }
        }

        /// <summary>
        /// Gets or sets whether to rebind grid to by parent key after delete
        /// </summary>
        public bool RebindOnDelete
        {
            get
            {
                return rebindDataOnDelete;
            }
            set
            {
                rebindDataOnDelete = value;
            }
        }

        /// <summary>
        /// Returns a list of index(ints) signifying blank rows added to grid's datasoruce
        /// </summary>
        public List<int> BlankRowIndexes
        {
            get
            {
                return blankRowIndexs;
            }
        }

        /// <summary>
        /// Gets or sets the number of blank rows to insert into the grid
        /// </summary>
        public int BlankRows
        {
            get
            {
                return blankRows;
            }
            set
            {
                blankRows = value;
            }
        }

        /// <summary>
        /// Gets or sets the number of empty rows to display by default.
        /// </summary>
        public int VisibleBlankRows
        {
            get
            {
                return visibleBlankRows;
            }
            set
            {
                visibleBlankRows = value;
            }
        }

        public string BlankRowCssClass
        {
            get
            {
                return blankRowCssClass;
            }
            set
            {
                blankRowCssClass = value;
            }
        }

        public string VisibleBlankRowCssClass
        {
            get
            {
                return visibleBlankRowCssClass;
            }
            set
            {
                visibleBlankRowCssClass = value;
            }
        }

        /// <summary>
        /// Gets whether the Grid contains any records
        /// </summary>
        public bool IsEmpty
        {
            get
            {
                return isEmpty;
            }
        }

        /// <summary>
        /// Gets of sets whether to show a message indicating that there are no records
        /// </summary>
        public bool ShowEmptyRecordsMessage
        {
            get
            {
                return showEmptyRecordsMessage;
            }
            set
            {
                showEmptyRecordsMessage = value;
            }
        }

        /// <summary>
        /// Sets the message to show when there are now records.
        /// </summary>
        public string EmptyRecordsMessage
        {
            get
            {
                return emptyRecordsMessage;
            }
            set
            {
                emptyRecordsMessage = value;
            }
        }

        /// <summary>
        /// Render full thead, tbody, tfoot nodes
        /// </summary>
        public bool RenderFullTable
        {
            get
            {
                return renderFullTable;
            }
            set
            {
                renderFullTable = value;
            }
        }

        /// <summary>
        /// Gets or sets the option string append to username
        /// </summary>
        public string AppendToUserName
        {
            get
            {
                return appendToUserName;
            }
            set
            {
                appendToUserName = value;
            }
        }

        public ExtendedGridView()
            : base()
        {
            this.blankRowCssClass = string.Empty;
            this.isEmpty = true;
            this.showEmptyRecordsMessage = false;
            this.emptyRecordsMessage = string.Empty;
            this.DataBound += (o, e) =>
                {
                    if (RenderFullTable)
                    {
                        if (this.ShowHeader == true && this.Rows.Count > 0)
                            this.HeaderRow.TableSection = TableRowSection.TableHeader;
                        if (this.ShowFooter == true && this.Rows.Count > 0)
                            this.FooterRow.TableSection = TableRowSection.TableFooter;
                    }
                };
        }

        protected override void OnInit(EventArgs e)
        {
            base.OnInit(e);
            this.RowUpdating += new GridViewUpdateEventHandler(HandleRowUpdating);

            // Set  base BusinessObject type and set DataKey Names based off of BusinessObject
            // Otherwise keys are specified by user (i.e., for multiple parent keys)
            if (!string.IsNullOrEmpty(tableName))
            {
                // Create new instance of base BusinessObject used for populating/saving/deleting
                baseBiz = BusinessObjectFactory.BuildBusinessObject(tableName);
                if (DataKeyNames.Length == 0)
                {
                    // Set DataKeyNames
                    DataKeyNames = new string[] { baseBiz.PrimaryKeyName, baseBiz.ParentKeyName };
                }
                // If DataKeyNames are specified, then primary key and parent keys are in DataKeyNames
                else
                {
                    bool priKeyFound = false;
                    foreach (string key in this.DataKeyNames)
                    {
                        if (key == baseBiz.PrimaryKeyName)
                        {
                            priKeyFound = true;
                        }
                    }

                    if (!priKeyFound)
                    {
                        throw new Exception("The DataKeyNames does not contain the Primary Key Name," + baseBiz.PrimaryKeyName + ",specified by the table " + tableName + ".");
                    }
                }
            }
            else
            {
                throw new Exception("The TableName attribute was not specified.");
            }
        }

        #region - CRUD Operations
        /// <summary>
        /// Saves a BusinessObject by TableName, extracting values from CaisisInputControls within a GridRow.
        /// </summary>
        /// <param name="e"></param>
        protected void HandleRowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            // If client code request the update event to stop, don't proceed
            if (e.Cancel)
            {
                return;
            }
            else
            {
                // Row executing update, -1 index is update on FooterRow/HeaderRow
                int rowIndex = e.RowIndex;
                GridViewRow updateRow = rowIndex == -1 ? FooterRow : Rows[rowIndex];

                // Only run updates/inserts if either real row is updating
                // or footer row is inserting. Its never the case that we'll run
                // update on a non footer row when there is blank data (i.e., blank row inserted).

                string parentKey;

                // GET PARENT KEY
                CaisisGridView.ExtractCaisisInputValuesFromContainer(updateRow, e.Keys, TableName);

                // If record is inserting, i.e. Footer Row, extract values from Event Argument
                //if (e.Keys.Contains(baseBiz.ParentKeyName) && updateRow == FooterRow)
                if (e.Keys.Contains(baseBiz.ParentKeyName))
                {
                    parentKey = e.Keys[baseBiz.ParentKeyName].ToString();
                }
                // Else keys are part of DataKeys
                else
                {
                    parentKey = this.DataKeys[rowIndex][baseBiz.ParentKeyName].ToString();
                }

                // If a parent key exists, proceed
                if (!string.IsNullOrEmpty(parentKey) && updateRow != null)
                {
                    int parKey = int.Parse(parentKey);
                    // Initalize a New BusinessObject
                    BusinessObject biz = BusinessObjectFactory.BuildBusinessObject(baseBiz.TableName);

                    // IMPORTANT - ORDER MATTERS

                    // Load record if key exists in DataKeyNames 
                    //(i.e., row was bound using this PriKey)
                    if (rowIndex > -1)
                    {
                        string primaryKey = this.DataKeys[rowIndex][biz.PrimaryKeyName].ToString();
                        if (!string.IsNullOrEmpty(primaryKey))
                        {
                            int priKey = int.Parse(primaryKey);
                            biz.Get(priKey);
                        }
                    }

                    // Populate Keys from Update Event Args (if any)
                    // This includes any forein keys
                    foreach (string key in e.Keys.Keys)
                    {
                        if (key != biz.PrimaryKeyName)
                        {
                            object valInUpdateEventKey = e.Keys[key];
                            biz[key] = valInUpdateEventKey;
                        }
                    }

                    // Next, see if DataKeys exist, then use to poulate keys
                    // Keys only exist in non-footer/header rows
                    if (rowIndex > -1)
                    {
                        foreach (string key in this.DataKeyNames)
                        {
                            object val = DataKeys[rowIndex][key];
                            // Only poulate keys (pri/foreign keys) which exist
                            if (key != baseBiz.PrimaryKeyName && val != null && val.ToString() != "")
                            {
                                biz[key] = DataKeys[rowIndex][key];
                            }
                        }
                    }

                    // Extract Values from fields and populate BusinessObject
                    // CICHelper.SetBOValues(updateRow.Controls, biz, parKey);

                    // Extract values from new keys if user populates event arguments
                    // with values to be updates (will overwrite extracted CIC values)
                    foreach (string key in e.NewValues.Keys)
                    {
                        List<string> colNames = new List<string>(biz.FieldNames);
                        if (colNames.Contains(key))
                        {
                            biz[key] = e.NewValues[key];
                        }
                    }
                    // special case: append optional audit text
                    if (!string.IsNullOrEmpty(AppendToUserName))
                        biz.AppendToUserName(AppendToUserName);

                    // Save Record
                    biz.Save();

                    // Fire Row Updated
                    GridViewUpdatedEventArgs updateArgs = new GridViewUpdatedEventArgs(1, null);
                    // Extract Key Values from BusinessObject, as they contain updated keys
                    foreach (string key in this.DataKeyNames)
                    {
                        updateArgs.Keys[key] = biz[key];
                    }
                    this.OnRowUpdated(updateArgs);

                    // If AutoUpdateChildGrids is enabled, save child grids
                    if (autoUpdateChildGridViews)
                    {
                        SaveChildGrid(rowIndex);
                    }
                }
                else
                {
                    if (!string.IsNullOrEmpty(parentKey) && updateRow != null)
                    {
                        string errMessage = rowIndex > -1 ? "Row " + rowIndex : "The FooterRow";
                        errMessage += " cannot be updated as no parent key(s) was provided for the update.";
                        throw new Exception(errMessage);
                    }
                }
            }
        }

        /// <summary>
        /// Extracts primary key from row and delete record based on Biz Object
        /// </summary>
        /// <param name="e"></param>
        protected override void OnRowDeleting(GridViewDeleteEventArgs e)
        {
            if (baseBiz != null)
            {
                string priKey = this.DataKeys[e.RowIndex][baseBiz.PrimaryKeyName].ToString();
                if (!string.IsNullOrEmpty(priKey))
                {
                    // Delete Record based on PriKey
                    int primaryKey = int.Parse(priKey);
                    baseBiz.Delete(primaryKey);
                    // Fire Row Deleted Event Handler
                    GridViewDeletedEventArgs deletedEventArgs = new GridViewDeletedEventArgs(1, null);

                    // Copy Keys from DataKeys from deleted record to pass along after row deleted
                    foreach (string key in this.DataKeyNames)
                    {
                        deletedEventArgs.Keys[key] = this.DataKeys[e.RowIndex][key];
                    }
                    if (this.DataKeyNames.Length == 2 && this.DataKeys[e.RowIndex][baseBiz.ParentKeyName] != null && rebindDataOnDelete)
                    {
						//BusinessObject biz = BusinessObjectFactory.BuildBusinessObject(baseBiz.TableName);
						//biz.GetByParent(int.Parse(this.DataKeys[e.RowIndex][biz.ParentKeyName].ToString()));
						//this.DataSource = biz.DataSourceView;

						string t = baseBiz.TableName;
						int k = int.Parse(this.DataKeys[e.RowIndex][BusinessObject.GetParentKeyName(t)].ToString());
						DataView dataView = BusinessObject.GetByParentAsDataView(baseBiz.TableName, k);
						this.DataSource = dataView;

                        this.DataBind();
                    }

                    this.OnRowDeleted(deletedEventArgs);
                }
            }
        }

        /// <summary>
        /// Data Source must only be of type DataTable or DataView
        /// </summary>
        /// <param name="e"></param>
        protected override void OnDataBinding(EventArgs e)
        {
            object data = this.DataSource;
            if (data != null)
            {
                DataView dataSource = null;
                if (data is DataView)
                {
                    dataSource = (data as DataView);
                }
                else if (data is DataTable)
                {
                    dataSource = (data as DataTable).DefaultView;
                }
                if (dataSource != null)
                {
                    if (showFooterOnEmpty && dataSource.Table.Rows.Count == 0)
                    {
                        dataSource.AddNew();
                        blankData = true;
                    }
                    else if (blankRows > 0)
                    {
                        String dataSort = dataSource.Sort;
                        DataTable clone = dataSource.Table.Copy();
                        clone.Constraints.Clear();
                        foreach (DataColumn col in clone.Columns)
                        {
                            col.AllowDBNull = true;
                        }
                        DataColumn sortCol = new DataColumn("SortColumn");
                        sortCol.DefaultValue = 1;
                        clone.Columns.Add(sortCol);

                        int blankIndex = clone.Rows.Count;
                        for (int i = 0; i < blankRows; i++, blankIndex++)
                        {
                            DataRow blankRow = clone.NewRow();
                            blankRow[sortCol] = 0;
                            clone.Rows.Add(blankRow);
                            blankRowIndexs.Add(blankIndex);
                        }
                        dataSource = clone.DefaultView;

                        if (String.IsNullOrEmpty(dataSort))
                            dataSource.Sort = sortCol.ColumnName + " DESC," + baseBiz.PrimaryKeyName + " ASC";
                        else
                            dataSource.Sort = sortCol.ColumnName + " DESC," + dataSort;
                    }
                    else
                    {
                        // Set sort order if not by user
                        if (string.IsNullOrEmpty(dataSource.Sort))
                        {
                            // Enforce DataBinding to PK ASC
                            dataSource.Sort = baseBiz.PrimaryKeyName + " ASC";
                        }
                    }
                    this.DataSource = dataSource;
                    // Set is empty based on data source
                    isEmpty = dataSource.Count == 0;
                }
                else
                {
                    throw new Exception("The DataSource can only be of type DataView or DataTable for correct update/insert/delete logic.");
                }
            }
            base.OnDataBinding(e);
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="e"></param>
        protected override void OnDataBound(EventArgs e)
        {
            base.OnDataBound(e);
            // If there is blank data, hide single row to allow footer to be shown
            if (showFooterOnEmpty && blankData && this.Rows.Count == 1)
            {
                this.Rows[0].Visible = false;
            }
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="writer"></param>
        protected override void Render(HtmlTextWriter writer)
        {
            // adjust delete button
            int delColIndex = -1;
            for (int i = 0; i < this.Columns.Count; i++)
            {
                DataControlField col = this.Columns[i];
                if (col is GridRowDeleteImage)
                {
                    delColIndex = i;
                    break;
                }
            }

            // Check if blank rows class name should be set
            int blankStartIndex = this.Rows.Count - this.blankRows;
            int lastVisibleBlankRowIndex = blankStartIndex + visibleBlankRows - 1;
            foreach (GridViewRow row in this.Rows)
            {
                if (blankStartIndex >= 0 && row.RowIndex >= blankStartIndex)
                {
                    // If the row is a visible blank row
                    if (row.RowIndex <= lastVisibleBlankRowIndex)
                    {
                        row.CssClass = visibleBlankRowCssClass;
                    }
                    else
                    {
                        row.CssClass = blankRowCssClass;
                    }
                    // hide delete button
                    if (delColIndex > -1)
                    {
                        if (row.Cells[delColIndex].HasControls())
                        {
                            row.Cells[delColIndex].Controls[0].Visible = false;
                        }
                    }
                }
            }
           

            base.Render(writer);
            // Check if a message needs to be rendered to show empty records
            if (isEmpty && showEmptyRecordsMessage)
            {
                Label l = new Label();
                string displayText;
                if (!string.IsNullOrEmpty(emptyRecordsMessage))
                {
                    l.Text = emptyRecordsMessage;
                }
                else
                {
                    l.Text = "There are no records for this table " + tableName;
                }
                l.Style["display"] = "block";
                l.Style["text-align"] = "center";
                l.RenderControl(writer);
            }

        }
        #endregion


        /// <summary>
        /// Override databound event to handle binding child grids based on row prikey
        /// </summary>
        /// <param name="e"></param>
        protected override void OnRowDataBound(GridViewRowEventArgs e)
        {
            base.OnRowDataBound(e);
            if (e.Row.RowIndex > -1 && baseBiz != null && autoBindChildGridByRowPrimaryKey)
            {
                string priKey = this.DataKeys[e.Row.RowIndex][baseBiz.PrimaryKeyName].ToString();
                if (!string.IsNullOrEmpty(priKey))
                {
                    ExtendedGridView childGrid = LocateChildGrid(e.Row);
                    if (childGrid != null && !string.IsNullOrEmpty(childGrid.TableName))
                    {
                        int parentKey = int.Parse(priKey);
						//BusinessObject childBiz = BusinessObjectFactory.BuildBusinessObject(childGrid.TableName);
						//childBiz.GetByParent(parentKey);
						//childGrid.DataSource = childBiz.DataSourceView;
						childGrid.DataSource = BusinessObject.GetByParentAsDataView(childGrid.TableName, parentKey);
                        childGrid.DataBind();
                    }
                }
            }
        }

        /// <summary>
        /// Initalizes a grid row by attaching data binding and change event handlers to populate and
        /// keep track of dirty controls duing posts
        /// </summary>
        /// <param name="row"></param>
        /// <param name="fields"></param>
        protected override void InitializeRow(GridViewRow row, DataControlField[] fields)
        {
            base.InitializeRow(row, fields);
            // Call helper method in main grid class to wire Data Binding events to controls
            // which will set values based on datasource and control Table and Field name
            CaisisGridView.AttachDataBindingOnRowInitalize(this, row);
            List<Type> excludeContainers = new List<Type>(new Type[] { typeof(GridView), typeof(ExtendedGridView), typeof(Repeater) });
            List<ICaisisInputControl> cicList = PageUtil.GetCaisisInputControlsInContainer(row, excludeContainers);
            foreach (ICaisisInputControl cic in cicList)
            {
                if (cic is TextBox)
                {
                    (cic as TextBox).TextChanged += OnRowControlDirty;
                }
                else if (cic is ListControl)
                {
                    (cic as ListControl).SelectedIndexChanged += OnRowControlDirty;
                }
                else if (cic is CheckBox)
                {
                    (cic as CheckBox).CheckedChanged += OnRowControlDirty;
                }
            }
        }

        /// <summary>
        /// Marks Dirty Rows When a Control's value changes during POSTs
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void OnRowControlDirty(object sender, EventArgs e)
        {
            GridViewRow row = ((Control)sender).NamingContainer as GridViewRow;
            if (null != row && !dirtyRows.Contains(row.RowIndex))
            {
                // Update all rows including Footer
                dirtyRows.Add(row.RowIndex);
            }
        }

        /// <summary>
        /// Saves all "dirty" Rows in a Grid using the parent key for inserts (new records)
        /// and verification (updates).
        /// </summary>
        /// <param name="parentKey">The Parent Key used to updated/insert records.</param>
        public void Save(int parentKey)
        {
            for (int i = -1; i < this.Rows.Count; i++)
            {
                if (dirtyRows.Contains(i))
                {
                    SaveRow(i, parentKey);
                    dirtyRows.Remove(i);
                }
                else if (autoUpdateChildGridViews && i > -1)
                {
                    SaveChildGrid(i);
                }
            }
            dirtyRows.Clear();
        }

        /// <summary>
        /// Saves all "dirty" rows in Grid unless "saveAll" equals true, 
        /// which all rows (including footer) are saved.
        /// </summary>
        /// <param name="parentKey">The Parent Key used to updated/insert records.</param>
        /// <param name="saveAll">True if to save all rows, else if false, only dirty rows are updated.</param>
        public void Save(int parentKey, bool saveAll)
        {
            if (saveAll)
            {
                for (int i = -1; i < this.Rows.Count; i++)
                {
                    SaveRow(i, parentKey);
                }
            }
            else
            {
                Save(parentKey);
            }
            dirtyRows.Clear();
        }

        /// <summary>
        /// Saves all "dirty" rows in a grid, unless saveAll bool is true,
        /// which results in all rows being updated, even if not dirty.
        /// </summary>
        /// <param name="parFieldNameToKeys">A dictionary of key/values pairs corresponding to Parent Keys in BusinessObject fields.</param>
        public void Save(Dictionary<string, int> parFieldNameToKeys)
        {
            for (int i = -1; i < this.Rows.Count; i++)
            {
                if (dirtyRows.Contains(i))
                {
                    SaveRow(i, parFieldNameToKeys);
                    dirtyRows.Remove(i);
                }
                else if (autoUpdateChildGridViews && i > -1)
                {
                    SaveChildGrid(i);
                }
            }
            dirtyRows.Clear();
        }

        /// <summary>
        /// Saves all "dirty" rows in Grid unless "saveAll" equals true, 
        /// which all rows (including footer) are saved.
        /// </summary>
        /// <param name="parFieldNameToKeys">A dictionary of key/values pairs corresponding to Parent Keys in BusinessObject fields.</param>
        /// <param name="saveAll">True if to save all rows, else if false, only dirty rows are updated.</param>
        public void Save(Dictionary<string, int> parFieldNameToKeys, bool saveAll)
        {
            if (saveAll)
            {
                for (int i = -1; i < this.Rows.Count; i++)
                {
                    SaveRow(i, parFieldNameToKeys);
                }
            }
            else
            {
                Save(parFieldNameToKeys);
            }
            dirtyRows.Clear();
        }

        /// <summary>
        /// Save's a Child Grid using row's prikey. Only child grids following simple parent/child
        /// relationship will update.
        /// </summary>
        /// <param name="rowIndex"></param>
        private void SaveChildGrid(int rowIndex)
        {
            // Don't update footer rows
            if (rowIndex > -1)
            {
                GridViewRow row = this.Rows[rowIndex];
                ExtendedGridView childGrid = LocateChildGrid(row);
                string parentKey = this.DataKeys[rowIndex][baseBiz.PrimaryKeyName].ToString();
                // Can only run update on child grid if a proper key exists
                if (childGrid != null && !string.IsNullOrEmpty(parentKey) && ChildGridUpdateable(childGrid))
                {
                    int childGridParentKey = int.Parse(parentKey);
                    childGrid.Save(childGridParentKey);
                    if (autoBindChildGridByRowPrimaryKey)
                    {
						//BusinessObject biz = BusinessObjectFactory.BuildBusinessObject(childGrid.TableName);
						//biz.GetByParent(childGridParentKey);
						//childGrid.DataSource = biz.DataSourceView;
						childGrid.DataSource = BusinessObject.GetByParentAsDataView(childGrid.TableName, childGridParentKey);
                        childGrid.DataBind();
                    }
                }
            }
        }

        /// <summary>
        /// Returns if a child grid is able to be updated, i.e., it has 2 data keys
        /// , and its parent key = primary key of current row
        /// </summary>
        /// <param name="childGrid"></param>
        /// <returns></returns>
        private bool ChildGridUpdateable(ExtendedGridView childGrid)
        {
            string childParentKeyName = baseBiz.PrimaryKeyName;
            int numChildKeys = childGrid.DataKeyNames.Length;
            bool keyExistsInChild = DataKeyNameExists(childGrid, baseBiz.PrimaryKeyName);
            bool parKeyIsRowPriKey = childGrid.baseBiz.ParentKeyName == baseBiz.PrimaryKeyName;
            return numChildKeys == 2 && keyExistsInChild && parKeyIsRowPriKey;
        }

        /// <summary>
        /// Returns whether a Grid's DataKeyNames contains a name.
        /// </summary>
        /// <param name="grid"></param>
        /// <param name="searchKey"></param>
        /// <returns></returns>
        private bool DataKeyNameExists(ExtendedGridView grid, string searchName)
        {
            foreach (string key in grid.DataKeyNames)
            {
                if (key == searchName)
                {
                    return true;
                }
            }
            return false;
        }

        /// <summary>
        /// Inserts/Updates a single row in the grid
        /// </summary>
        /// <param name="rowIndex"></param>
        /// <param name="parentKey"></param>
        public void SaveRow(int rowIndex, int parentKey)
        {
            UpdateRowWithKey(rowIndex, parentKey);
        }

        /// <summary>
        /// Insets/Updates a single row in the grid
        /// </summary>
        /// <param name="rowIndex"></param>
        /// <param name="parFieldNameToKeys"></param>
        public void SaveRow(int rowIndex, Dictionary<string, int> parFieldNameToKeys)
        {
            UpdateRowWithKeys(rowIndex, parFieldNameToKeys);
        }

        /// <summary>
        /// Saves a new record based on footer template.
        /// </summary>
        public void SaveFooterRecord(Dictionary<string, int> parFieldNameToKeys)
        {
            UpdateRowWithKeys(FooterRow.RowIndex, parFieldNameToKeys);
        }

        /// <summary>
        /// Inserts a new row based on footer row using single parent key.
        /// </summary>
        /// <param name="parentKey">the parent key</param>
        public void SaveFooterRecord(int parentKey)
        {
            UpdateRowWithKey(FooterRow.RowIndex, parentKey);
        }

        #region CRUD Helpers

        /// <summary>
        /// Updates a Row in the grid using provided parent key for verification (existing rows)
        /// and inserts (for new rows).
        /// </summary>
        /// <param name="rowIndex"></param>
        /// <param name="parentKey"></param>
        private void UpdateRowWithKey(int rowIndex, int parentKey)
        {
            // Verify that there is only 1 parent key
            if (this.DataKeyNames.Length > 2)
            {
                throw new Exception("ERROR SAVING: A single parent key was provided, though this table has multiple parent keys.");
            }
            GridViewUpdateEventArgs e = new GridViewUpdateEventArgs(rowIndex);
            e.Keys[baseBiz.ParentKeyName] = parentKey;
            this.OnRowUpdating(e);
        }

        /// <summary>
        /// Updates a Row in the grid using provided parent keys for verification (existing rows)
        /// and inserts (for new rows).
        /// </summary>
        /// <param name="rowIndex"></param>
        /// <param name="parFieldNameToKeys"></param>
        private void UpdateRowWithKeys(int rowIndex, Dictionary<string, int> parFieldNameToKeys)
        {
            GridViewUpdateEventArgs e = new GridViewUpdateEventArgs(rowIndex);
            foreach (string field in parFieldNameToKeys.Keys)
            {
                if (field != baseBiz.PrimaryKeyName)
                {
                    e.Keys[field] = parFieldNameToKeys[field];
                }
            }
            this.OnRowUpdating(e);
        }
        #endregion

        /// <summary>
        /// Returns the first child grid in a container
        /// </summary>
        /// <param name="container"></param>
        /// <returns></returns>
        private ExtendedGridView LocateChildGrid(Control container)
        {
            if (container is ExtendedGridView)
            {
                return container as ExtendedGridView;
            }
            else if (container != null && container.HasControls())
            {
                foreach (Control con in container.Controls)
                {
                    ExtendedGridView returnVal = LocateChildGrid(con);
                    if (returnVal != null)
                    {
                        return returnVal;
                    }
                }
            }
            return null;
        }
    }



    /// <summary>
    /// Extending class for Template Field containing basic functionality of Extended class
    /// </summary>
    public class ExtendedTemplateField : TemplateField
    {

        public override void ExtractValuesFromCell(IOrderedDictionary dictionary, DataControlFieldCell cell, DataControlRowState rowState, bool includeReadOnly)
        {
            base.ExtractValuesFromCell(dictionary, cell, rowState, includeReadOnly);
            CaisisGridView.ExtractCaisisInputValuesFromContainer(cell, dictionary);
        }
    }

    #region - Helper Classes

   
    /// <summary>
    /// Provides basic abstract functionality for creating a templated field
    /// </summary>
    public abstract class BaseTemplateField : ITemplate
    {
        protected abstract void AddControls(object sender, EventArgs e);
        public event EventHandler ControlAdded;
        public void InstantiateIn(Control container)
        {
            var e = new EventArgs();
            // add control
            AddControls(container, e);
            // signal event
            OnControlAdded(container, e);
        }

        protected void OnControlAdded(object sender, EventArgs e)
        {
            if (ControlAdded != null)
            {
                ControlAdded(sender, e);
            }
        }
    }

    public class GridViewHeaderField : BaseTemplateField
    {
        string title = "";
        public GridViewHeaderField(string title)
            : base()
        {
            this.title = title;
        }

        protected override void AddControls(object sender, EventArgs e)
        {
            var cell = sender as TableCell;
            Label label = new Label();
            label.Text = title;
            cell.Controls.Add(label);
            cell.CssClass = "dataGridHeader";
        }
    }

    public class GridRowDeleteImage : TemplateField
    {
        public GridRowDeleteImage()
            : base()
        {
            this.ItemTemplate = new DeleteItemField();
            this.HeaderTemplate = new GridViewHeaderField("Delete");
        }

        internal class DeleteItemField : ITemplate
        {
            public DeleteItemField()
            {
            }

            public void InstantiateIn(Control container)
            {
                ImageButton DeleteButton = new ImageButton();
                DeleteButton.Load += new EventHandler(AttachDeleteOnClick);
                DeleteButton.CommandName = "Delete";
                DeleteButton.ImageUrl = "~/Images/EFormDeleteRow.png";
                DeleteButton.AlternateText = "Delete This Record";
                container.Controls.Add(DeleteButton);
            }

            protected void AttachDeleteOnClick(object sender, EventArgs e)
            {
                if (sender is ImageButton)
                {
                    ImageButton deleteBtn = sender as ImageButton;
                    GridViewRow deleteRow = CaisisGridView.GetGridViewRowByControl(deleteBtn);
                    GridView deleteGrid = deleteRow.NamingContainer as GridView;

                    // Build a JS Object containing row keys/values
                    string[] keyVal = new string[deleteGrid.DataKeyNames.Length];
                    for (int i = 0; i < deleteGrid.DataKeyNames.Length; i++)
                    {
                        string key = deleteGrid.DataKeyNames[i];
                        string val = deleteGrid.DataKeys[deleteRow.RowIndex][key].ToString();
                        // normalize keys so '' == null
                        val = !string.IsNullOrEmpty(val) ? val : "null";

                        keyVal[i] = " '" + key + "' : " + val + "";
                    }
                    // If page defined js function onRowDelete, invoke instead of default delete message
                    // onRowDelete = function(row) -> return true/false if to continue deleteing record
                    string uniqueNode = "_deleteRow" + deleteRow.ClientID;
                    string jsObj = "var " + uniqueNode + " = document.getElementById('" + deleteRow.ClientID + "'); " + uniqueNode + ".Keys = { " + string.Join(",", keyVal) + " }; ";

                    string confirmDelete = jsObj + " if(window.onRowDelete) { return window.onRowDelete(" + uniqueNode + "); } else { return confirm('Are you sure you want to delete this row?'); }";
                    // Test to see if invoking element is this the delete button, else, do not submit/cancel bubbling
                    deleteBtn.OnClientClick = "if((event.target||event.srcElement)!=this) { return false; } else { " + confirmDelete + " }";

                }
            }
        }
    }

    public class GridRowClearImage : TemplateField
    {
        public GridRowClearImage()
            : base()
        {
            this.ItemTemplate = new ClearItemField();
            this.HeaderTemplate = new GridViewHeaderField("Clear");
        }

        internal class ClearItemField : ITemplate
        {
            public ClearItemField()
            {
            }

            public void InstantiateIn(Control container)
            {
                HyperLink clearBtn = new HyperLink();
                clearBtn.ID = "ClearBtn";
                clearBtn.ToolTip = "Clear";
                clearBtn.CssClass = "ClearGridRowLink";
                clearBtn.ImageUrl = "~/Images/Button_X_Clear.png";
                clearBtn.Style.Add("cursor", "pointer");
                container.Controls.Add(clearBtn);
            }
        }
    }

    public class AuditField : TemplateField
    {
        private static readonly string AUDIT_CELL_CSS = "auditFieldCell";

        public AuditField(string tableName)
            : base()
        {
            string headerText = "";
            // create item and header
            var item = new AuditItemField(tableName);
            var header = new GridViewHeaderField(headerText);
            // set header and item cell css
            item.ControlAdded += SetAuditCell;
            header.ControlAdded += SetAuditCell;
            // add templated fields
            this.ItemTemplate = item;
            this.HeaderTemplate = header;
        }

        public static void SetAuditCell(object sender, EventArgs e)
        {
            if (sender is TableCell)
            {
                var cell = sender as TableCell;
                cell.CssClass = (cell.CssClass + " " + AUDIT_CELL_CSS).Trim();
            }
        }

        internal class AuditItemField : BaseTemplateField
        {
            private string _table;
            private string _keyName;
            private IEnumerable<string> _auditFieldNames;

            public AuditItemField(string tableName )
                : base()
            {
                // set table and key
                this._table = tableName;
                this._keyName = BusinessObject.GetPrimaryKeyName(tableName);
                // get a list of audit columns
                var auditColumnNames = BusinessObject.GetFieldNames(tableName).Intersect(
                    new string[] 
                    { 
                        BusinessObject.EnteredBy,
                        BusinessObject.EnteredTime,
                        BusinessObject.UpdatedBy,
                        BusinessObject.UpdatedTime
                    });
                this._auditFieldNames = auditColumnNames;
            }

            protected override void AddControls(object sender, EventArgs e)
            {
                TableCell cell = sender as TableCell;
                // add icon to cell
                Image auditIcon = new Image();
                auditIcon.Load += new EventHandler(SetAuditTooltip);
                auditIcon.ImageUrl = "~/Images/ViewAuditLogIcon.gif";
                auditIcon.AlternateText = "Audit Info";
                auditIcon.Visible = false;
                cell.Controls.Add(auditIcon);
                // add tooltip layer
                Panel fieldTooltip = new Panel();
                fieldTooltip.ID = "auditFieldTooltip";
                fieldTooltip.CssClass = "auditFieldTooltip";
                fieldTooltip.Visible = false;
                cell.Controls.Add(fieldTooltip);
            }

            protected void SetAuditTooltip(object sender, EventArgs e)
            {
                Image auditIcon = sender as Image;
                TableCell cell = auditIcon.Parent as TableCell;
                var gridRow = auditIcon.NamingContainer as GridViewRow;

                if (gridRow.DataItem != null)
                {
                    List<string> displayTexts = new List<string>();
                    // ENTERED BY
                    if (_auditFieldNames.Contains(BusinessObject.EnteredBy) && _auditFieldNames.Contains(BusinessObject.EnteredTime))
                    {
                        string enteredBy = DataBinder.Eval(gridRow.DataItem, BusinessObject.EnteredBy).ToString();
                        string enteredTime = DataBinder.Eval(gridRow.DataItem, BusinessObject.EnteredTime).ToString(); ;
                        if (!string.IsNullOrEmpty(enteredBy) && !string.IsNullOrEmpty(enteredTime))
                        {
                            string displayText = string.Format("Entered By: {0} @ {1}", enteredBy, enteredTime);
                            displayTexts.Add(displayText);
                        }
                    }
                    // UPDATED BY
                    if (_auditFieldNames.Contains(BusinessObject.UpdatedBy) && _auditFieldNames.Contains(BusinessObject.UpdatedTime))
                    {
                        string updatedBy = DataBinder.Eval(gridRow.DataItem, BusinessObject.UpdatedBy).ToString();
                        string updatedTime = DataBinder.Eval(gridRow.DataItem, BusinessObject.UpdatedTime).ToString(); ;
                        if (!string.IsNullOrEmpty(updatedBy) && !string.IsNullOrEmpty(updatedTime))
                        {
                            string displayText = string.Format("Updated By: {0} @ {1}", updatedBy, updatedTime);
                            displayTexts.Add(displayText);
                        }
                    }
 
                    // build output table
                    if (displayTexts.Count() > 0)
                    {
                        auditIcon.Visible = true;

                        // build audit key value pairs
                        Panel fieldTooltip = cell.FindControl("auditFieldTooltip") as Panel;
                        fieldTooltip.Visible = true;

                        //Label headText = new Label();
                        //headText.Font.Bold = true;
                        //headText.Text = "Change History";
                        //fieldTooltip.Controls.Add(headText);

                        foreach (var displayText in displayTexts)
                        {
                            Label label = new Label();
                            label.Text = displayText;
                            fieldTooltip.Controls.Add(label);
                        }

                        Label footText = new Label();
                        footText.Text = "Click to view details.";
                        fieldTooltip.Controls.Add(footText);


                        // setup tooltip hover
                        string onMouseOver = "if(window.showAuditTooltip) { showAuditTooltip(this, '" + fieldTooltip.ClientID + "', event); }";
                        string onMouseOut = "if(window.hideAuditTooltip) { hideAuditTooltip(this, '" + fieldTooltip.ClientID + "', event); }"; ;
                        cell.Attributes["onmouseover"] = onMouseOver;
                        cell.Attributes["onmouseout"] = onMouseOut;

                        // build audit interface link
                        string priKeyValue = DataBinder.Eval(gridRow.DataItem, _keyName).ToString();
                        string showModalAudit = cell.Page.ResolveUrl("~/Core/Utilities/ViewRecordAudit.aspx?tableNames=" + _table + "&tablePriKey=" + Security.CustomCryptoHelper.Encrypt(priKeyValue));
                        cell.Attributes["onclick"] = "top.showModal('" + PageUtil.EscapeSingleQuotes(showModalAudit) + "');";
                        //cell.ToolTip = "View Previous Changes To This Record";
                    }
                }
            }
        }
    }

    public class GridRowUIHelper : TemplateField
    {
        public GridRowUIHelper()
            : base()
        {
            this.ItemTemplate = new GridRowUIHelperField();
            this.HeaderTemplate = new GridViewHeaderField("Reset");
        }

        internal class GridRowUIHelperField : ITemplate
        {
            public GridRowUIHelperField()
            {
            }

            public void InstantiateIn(Control container)
            {
                HyperLink link = new HyperLink();
                link.CssClass = "ResetGridRowLink";
                link.ImageUrl = "~/Images/icon_refresh_small.gif";
                link.Style.Add("margin-left", "6px");
                link.Style.Add("visibility", "hidden");
                link.Style.Add("cursor", "pointer");
                container.Controls.Add(link);
            }
        }
    }

    /// <summary>
    /// Custom DataBound Caisis Input Control Field
    /// </summary>
    public class CaisisDataBoundField : DataControlField
    {
        private string cicFieldName;
        private string controlTypeName;
        protected ICaisisInputControl controlBase;

        private IDictionary<string, string> _metadata = new Dictionary<string, string>();

        private static EventHandler CICValueBinder = CaisisGridView.CICDataBinderHandler;

        public string CaisisControlTypeName
        {
            get
            {
                return controlTypeName;
            }
        }

        public ICaisisInputControl BaseCaisisInputControl
        {
            get
            {
                return controlBase;
            }
        }

        #region CONSTRUCTORS
        public CaisisDataBoundField()
        {
        }

        /// <summary>
        /// Creates a templated field with the Caisis control as the cell control.
        /// </summary>
        /// <param name="caisisControlBase"></param>
        public CaisisDataBoundField(ICaisisInputControl caisisControlBase)
        {
            this.HeaderText = caisisControlBase.FieldLabel;
            this.controlBase = caisisControlBase;
            this.controlTypeName = caisisControlBase.GetType().Name;
            this.cicFieldName = caisisControlBase.Field;
        }

        /// <summary>
        /// Creates a templated field with the Caisis control as the cell control using the specified metadata.
        /// </summary>
        /// <param name="caisisControlBase"></param>
        /// <param name="metaData"></param>
        public CaisisDataBoundField(ICaisisInputControl caisisControlBase, DataTable metaData)
            : this(caisisControlBase, CICHelper.GetFieldAttributeLookup(metaData, caisisControlBase.Field))
        {
        }

        /// <summary>
        /// Creates a templated field with the Caisis control as the cell control using the specified metadata.
        /// </summary>
        /// <param name="caisisControlBase"></param>
        /// <param name="metaData"></param>
        public CaisisDataBoundField(ICaisisInputControl caisisControlBase, IDictionary<string, string> metaData)
            : this(caisisControlBase)
        {
            this._metadata = metaData;
        }

        #endregion

        #region OVERRIDEN METHODS

        protected override DataControlField CreateField()
        {
            return new CaisisDataBoundField();
        }

        #endregion

        #region INITALIZATION METHODS
        public override void InitializeCell(DataControlFieldCell cell, DataControlCellType cellType, DataControlRowState rowState, int rowIndex)
        {
            base.InitializeCell(cell, cellType, rowState, rowIndex);
            switch (cellType)
            {
                case DataControlCellType.DataCell:
                    this.InitializeDataCell(cell, rowState);
                    break;
                case DataControlCellType.Header:
                    this.InitializeHeaderCell(cell, rowState);
                    break;
                case DataControlCellType.Footer:
                    this.InitializeFooterCell(cell, rowState);
                    break;
            }
            // Hide DataBoundCaisisHidden Fields from Interface
            if (CaisisControlTypeName.Equals(typeof(CaisisHidden).Name))
            {
                cell.Style.Add("display", "none");
            }
        }

        /// <summary>
        /// Adds a new instance of controlBase (a CaisisInputControl) to the row's cell
        /// </summary>
        /// <param name="cell"></param>
        /// <param name="rowState"></param>
        protected virtual void InitializeDataCell(DataControlFieldCell cell, DataControlRowState rowState)
        {
            ICaisisInputControl iCIC = new CaisisTextBox();
            if (BaseCaisisInputControl == null)
            {
                if (!string.IsNullOrEmpty(CaisisControlTypeName))
                {
                    //// Create Control, set Field, then set MetaData values
                    //iCIC = CICHelper.InvokeInputControl(CaisisControlTypeName);
                    //iCIC.Field = cicFieldName;
                    //CICHelper.SetCICAttributes(iCIC, CaisisControlMetaTable);
                }
            }
            else
            {
                // if metadata specified, create new instance and set properties via metadat
                if (this._metadata != null)
                {
                    // create new instance
                    iCIC = CICHelper.InvokeInputControl(controlBase.GetType().Name);
                    // set default properties
                    iCIC.Table = controlBase.Table;
                    iCIC.Field = controlBase.Field;
                    // set metadata
                    CICHelper.SetCICAttributes(iCIC, this._metadata);
                }
                // otherwise clone through reflection
                else
                {
                    iCIC = CICHelper.CloneCIC(controlBase);
                }
            }
            // Supress FieldLabel
            iCIC.ShowLabel = false;

            // DropDownLists need to have value set on DataBound,
            // while other control values are set on DataBinding.
            if (iCIC is CaisisSelect)
            {
                (iCIC as CaisisSelect).DataBound += CICValueBinder;
            }
            else
            {
                (iCIC as Control).DataBinding += CICValueBinder;
            }

            // input conrol for adding to container
            Control inputControl = iCIC as Control;

            // add control directly to cell
            cell.Controls.Add(inputControl);

            //// !important, each cell renders control inside wrapper, no server context, only client side
            //inputControl.SetRenderMethodDelegate((writer, cellControl) =>
            //{
            //    writer.Write("<span class=\"EditDataEntryField_Container_Grid\">");
            //    foreach (Control con in cellControl.Controls)
            //    {
            //        con.RenderControl(writer);
            //    }
            //    writer.Write("</span>");
            //});
        }

        /// <summary>
        /// Create Header Cell contents
        /// </summary>
        /// <param name="cell"></param>
        /// <param name="rowState"></param>
        protected void InitializeHeaderCell(DataControlFieldCell cell, DataControlRowState rowState)
        {
            Label l = new Label();
            this.ShowHeader = true;
            this.HeaderText = !string.IsNullOrEmpty(controlBase.FieldLabel) ? controlBase.FieldLabel : controlBase.Field;
            // if help is valid, generate tool tip
            if (!string.IsNullOrEmpty(controlBase.HelpDescription))
            {
                string safeHelpDescription = controlBase.HelpDescription.Replace("'", "\\'");
               
                // js tooltip
                //cell.Attributes.Add("onmouseover", "if(window.showToolTipMessage) { showToolTipMessage('" + safeHelpDescription + "'); }");
                //cell.Attributes.Add("onmouseout", "if(window.hideToolTip) { hideToolTip(); }");
                
                // html tooltip
                cell.ToolTip = controlBase.HelpDescription;
            }
            cell.CssClass = controlBase.Required ? "dataGridHeaderRequired" : "dataGridHeader";
        }

        /// <summary>
        /// Create footer
        /// </summary>
        /// <param name="cell"></param>
        /// <param name="rowState"></param>
        protected void InitializeFooterCell(DataControlFieldCell cell, DataControlRowState rowState)
        {

        }

        #endregion

        /// <summary>
        /// Extracts values for controls use in updating BizObj
        /// </summary>
        /// <param name="dictionary"></param>
        /// <param name="cell"></param>
        /// <param name="rowState"></param>
        /// <param name="includeReadOnly"></param>
        public override void ExtractValuesFromCell(System.Collections.Specialized.IOrderedDictionary dictionary, DataControlFieldCell cell, DataControlRowState rowState, bool includeReadOnly)
        {
            CaisisGridView.ExtractCaisisInputValuesFromContainer(cell, dictionary);
        }
    }

    #endregion
}
