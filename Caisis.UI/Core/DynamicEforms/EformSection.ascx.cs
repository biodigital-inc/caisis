using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Caisis.UI.Core.DynamicEforms
{
	public partial class EformSection : System.Web.UI.UserControl
	{
		private string disease;

		private Control[,] cells = null;

		bool initialized = false;
		bool containsGrid = false;

		public int Rows
		{
			get;
			set;
		}

		public int Columns
		{
			get;
			set;
		}

		public string Title
		{
			get;
			set;
		}

		public bool ShowTitle
		{
			get;
			set;
		}

		protected override void OnInit(EventArgs e)
		{
			base.OnInit(e);

			if (cells == null)
				cells = new Control[Rows, Columns];
			
			CellContainer.Controls.Add(BuildLayout());

			initialized = true;
		}

		// TODO: (PostBack) if we don't add sections at init or page load, do child controls handle postback correctly?

		protected void Page_Load(object sender, EventArgs e)
		{
			if (ShowTitle)
			{
				SectionNameLabel.Text = Title;
                SectionNameAnchor.Name = Title;
				SectionNameLabel.Visible = true;
			}
		}

		protected override void OnPreRender(EventArgs e)
		{
			base.OnPreRender(e);

			if (containsGrid)
				RemoveContainerStyle();
		}

		private void RemoveContainerStyle()
		{
            CellContainer.Attributes.Remove("class");
		}

		/// <summary>
		/// Replaces the EformControl in the section cell with that passed as an
		/// argument to the method.
		/// </summary>
		/// <param name="column">The zero-based index of the column in which to insert the control.</param>
		/// <param name="row">The zero-based index of the row in which to insert the control.</param>
		/// <param name="control">An Eform control.</param>
		public void InsertControl(Control control, int row, int column)
		{
			if (cells == null)
				cells = new Control[Rows, Columns];

			// TODO: narrow the third arg to EformControl or whatever is appropriate
			if (row >= Rows)
				throw new ArgumentException(string.Format("{0} exceeds the number of rows ({1}) in the section.", row, Rows), "row");

			if (column >= Columns)
				throw new ArgumentException(string.Format("{0} exceeds the number of columns ({1}) in the section.", column, Columns), "column");

			if (initialized)
				throw new InvalidOperationException("Controls cannot be added to the section after initialization. Insert controls before adding section to a page.");

			cells[row, column] = control;

			if (!containsGrid)
				containsGrid = ContainsGrid(control);
		}

		private bool ContainsGrid(Control c)
		{
			if (c is GridView)
				return true;

			foreach (Control child in c.Controls)
			{
				if (ContainsGrid(child))
					return true;
			}

			return false;	
		}

		private Table BuildLayout()
		{
			Table table = new Table();

			for (int i = 0; i < cells.GetLength(0); i++)
			{
				TableRow row = new TableRow();

				for (int j = 0; j < cells.GetLength(1); j++)
				{
					TableCell cell = new TableCell();
					Control c = cells[i, j];
					
					if (c != null)
						cell.Controls.Add(c);

					row.Cells.Add(cell);
				}

				table.Rows.Add(row);
			}

			return table;
		}
	}
}
