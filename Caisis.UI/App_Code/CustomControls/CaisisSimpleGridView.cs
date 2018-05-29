using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using Caisis.BOL;
using Caisis.UI.Core.Classes.CustomControls;

namespace Caisis.UI.Core.Classes
{
	public class CaisisSimpleGridView : GridView
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

		#region CSS Constants
		private static readonly string GRID_CSS_CLASS = "dataGrid";
		private static readonly string GRID_HEADER_CSS_CLASS = "dataGridHeader";
		private static readonly string GRID_ROW_CSS_CLASS = "dataGridItemRowA";
		private static readonly string GRID_ALT_ROW_CSS_CLASS = "dataGridItemRowB";
		private static readonly string GRID_BLANK_ROW_HIDDEN_CSS_CLASS = "dataGridBlankRowHidden";
		private static readonly string GRID_BLANK_ROW_VISIBLE_CSS_CLASS = "dataGridBlankRowVisible";
		#endregion

		public CaisisSimpleGridView() : base()
		{
			this.AutoGenerateColumns = false;
			this.CssClass = GRID_CSS_CLASS;
			this.HeaderStyle.CssClass = GRID_HEADER_CSS_CLASS;
			this.RowStyle.CssClass = GRID_ROW_CSS_CLASS;
			this.AlternatingRowStyle.CssClass = GRID_ALT_ROW_CSS_CLASS;
		}

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
				if (value == null)
				{
					base.DataKeyNames = value;
				}
				else
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
				return this.Rows.Count - this.TotalBlankRows;
			}
		}

		#endregion

		protected override void OnLoad(EventArgs e)
		{
			base.OnLoad(e);
		}

		protected override GridViewRow CreateRow(int rowIndex, int dataSourceIndex, DataControlRowType rowType, DataControlRowState rowState)
		{
			return base.CreateRow(rowIndex, dataSourceIndex, rowType, rowState | DataControlRowState.Edit);
		}

		/// <summary>
		/// Handle binding to ODS, show new empty row
		/// </summary>
		/// <param name="e"></param>
		protected override void OnDataBinding(EventArgs e)
		{
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
			}

			if (!hasEmptyNewRow)
			{
				AddNewRows(TotalBlankRows);
				hasEmptyNewRow = true;
			}

			base.OnDataBinding(e);
		}

		protected override void Render(HtmlTextWriter writer)
		{
			Control aid = PageUtil.RecursiveFindControl(this.NamingContainer, this.AddButtonId);

			if (aid != null)
			{
				aid.Visible = this.Enabled;
			}

			// Mark each blank row
			if (this.Rows.Count > 0)
			{
				// Total - Empty = blank rows start index
				int startIndex = this.Rows.Count - TotalBlankRows;
				int endIndex = this.Rows.Count - 1;
				int visibleBlankRows = Math.Min(VisibleBlankRows, TotalBlankRows);
				foreach (GridViewRow row in this.Rows)
				{
					// Get Blank Rows and set UI Stylings,
					// hiding delete images on blank rows
					// as well setting style on blank rows
					if (row.RowIndex >= startIndex && row.RowIndex <= endIndex)
					{
						bool isVisibleRow = visibleBlankRows > 0;
						row.CssClass = isVisibleRow ? GRID_BLANK_ROW_VISIBLE_CSS_CLASS : GRID_BLANK_ROW_HIDDEN_CSS_CLASS;
						// Hide delete images in blank rows
						//if (delColIndex > -1)
						//{
						//    (row.Cells[delColIndex].Controls[0] as ImageButton).Style.Add("visibility", "hidden");
						//}
						visibleBlankRows--;
					}
				}
			}

			base.Render(writer);
		}

		private void AddNewRows(int numRows)
		{
			if (this.DataSource is BusinessObjectDataSource)
			{
				BusinessObjectDataSource ds = this.DataSource as BusinessObjectDataSource;
				ds.AddNewRows(numRows);
			}
		}
	}
}
