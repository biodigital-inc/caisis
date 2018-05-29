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

using Caisis.DataAccess;

namespace Caisis.UI.Admin
{
	/// <summary>
	/// Summary description for AdminMetadata.
	/// </summary>
	public partial class AdminMetadata : System.Web.UI.Page
	{
 // why not use Caisis.UI.EditableGrid
		// protected Label errorMessage;

		// TODO: make stored procedures!!!!
		#region ugly sql strings
        //private static readonly string TABLE_SQL = "SELECT TableName, TableId FROM TableMetadata";
        //private static readonly string FIELD_FMT_SQL = "SELECT * FROM FieldMetadata WHERE TableId = ";
        //private static readonly string UPDATE_SQL = "UPDATE FieldMetadata SET FieldName = @FieldName, FieldDescription = @FieldDescription, FieldLabel = @FieldLabel, FieldControlType = @FieldControlType, FieldDataType = @FieldDataType, FieldRowSource = @FieldRowSource WHERE FieldId = @FieldId";

        private static readonly bool UseOldDataModel = true;
        private string TABLE_SQL = "SELECT TableName, TableId FROM MetadataTables";
        private string FIELD_FMT_SQL = "SELECT * FROM MetadataFields WHERE TableId = ";
        private string UPDATE_SQL = "UPDATE MetadataFields SET FieldName = @FieldName, FieldDescription = @FieldDescription, FieldLabel = @FieldLabel, FieldControlType = @FieldControlType, FieldDataType = @FieldDataType, FieldRowSource = @FieldRowSource WHERE FieldId = @FieldId";
        
        ////private static readonly string CONTROL_TYPES_SQL = "SELECT DISTINCT(FieldControlType) FROM FieldMetadata WHERE FieldControlType IS NOT NULL ORDER BY FieldControlType";
		////private static readonly string DATATYPES_SQL = "SELECT DISTINCT(FieldDataType) FROM FieldMetadata WHERE FieldDataType IS NOT NULL ORDER BY FieldDataType";
		

        #endregion

		protected void Page_Load(object sender, System.EventArgs e)
		{ 
			// errorMessage.Text = null;
            if (UseOldDataModel)
            {
                TABLE_SQL = "SELECT TableName, TableId FROM x_TableMetadata";
                FIELD_FMT_SQL = "SELECT * FROM x_FieldMetadata WHERE TableId = ";
                UPDATE_SQL = "UPDATE x_FieldMetadata SET FieldName = @FieldName, FieldDescription = @FieldDescription, FieldLabel = @FieldLabel, FieldControlType = @FieldControlType, FieldDataType = @FieldDataType, FieldRowSource = @FieldRowSource WHERE FieldId = @FieldId";
            }
			if (!Page.IsPostBack)
			{
				PopulateTableList();
			}
		}

		// populates metadata grid on dropdown postback
		protected void ChooseTable(object sender, System.EventArgs e)
		{
			ResetGrid();
		}

		protected void MetadataGrid_EditCommand(object sender, DataGridCommandEventArgs e)
		{
			MetadataGrid.EditItemIndex = e.Item.ItemIndex;
			PopulateMetadataGrid();
		}

		// TODO: make this less ugly
		protected void MetadataGrid_UpdateCommand(object sender, DataGridCommandEventArgs e)
		{
			// setup the update command
			SqlCommand cmd = null;

			// extract controls from the command args
			// USE TEXTBOXES to Test
			string id = e.Item.Cells[1].Text;
			string name = e.Item.Cells[2].Text;
			string description = ((TextBox) e.Item.Cells[4].Controls[0]).Text;
			string label = ((TextBox) e.Item.Cells[3].Controls[0]).Text;
			// string ctype = ((DropDownList) e.Item.Cells["HelpFieldControlType"].Controls[0]).SelectedValue;

			DropDownList clist = (DropDownList) e.Item.FindControl("ControlTypes");
			string ctype = null;
			if (!"".Equals(clist.SelectedValue))
			{
				ctype = clist.SelectedValue;
			}

			DropDownList dlist = (DropDownList) e.Item.FindControl("Datatypes");
			string dtype = null;
			if (!"".Equals(dlist.SelectedValue))
			{
				dtype = dlist.SelectedValue;
			}

			// suppress required for now ...
			// bool required = ((CheckBox) e.Item.Cells["HelpFieldRequired"].Controls[0]).Checked;
			// string required = null;
			// string min = null;
			// string max = null;
			string rowsource = ((TextBox) e.Item.Cells[7].Controls[0]).Text;
			if (rowsource != null && "".Equals(rowsource))
			{
				rowsource = null;
			}
			// string notes = null;


			cmd = DataAccessHelper.CreateCommand(UPDATE_SQL);
			cmd.CommandType = CommandType.Text;


			AddParameterWithNullCheck(cmd, "@FieldId", Int32.Parse(id));
			AddParameterWithNullCheck(cmd, "@FieldName", name);
			AddParameterWithNullCheck(cmd, "@FieldDescription", description);
			AddParameterWithNullCheck(cmd, "@FieldLabel", label);
			AddParameterWithNullCheck(cmd, "@FieldControlType", ctype);
			AddParameterWithNullCheck(cmd, "@FieldDataType", dtype);
			AddParameterWithNullCheck(cmd, "@FieldRowSource", rowsource);

			// what about null values?
			//DataAccessHelper.AddStringInputParam(cmd, "HelpFieldRequired", required); // HelpFieldRequired is varchar(50)
			//DataAccessHelper.AddStringInputParam(cmd, "HelpFieldMin", min);
			//DataAccessHelper.AddStringInputParam(cmd, "HelpFieldMax", max);
			//DataAccessHelper.AddStringInputParam(cmd, "HelpFieldNotes", notes);

			DataAccessHelper.ExecuteScalar(cmd); // this handles connections
			
			// reset the grid to its default mode
			ResetGrid();
		}

		protected void MetadataGrid_CancelCommand(object sender, DataGridCommandEventArgs e)
		{
			ResetGrid();
		}

		protected void PreSelectDropDowns(object sender, DataGridItemEventArgs e)
		{
			PreSelectDropDown("ControlTypes", "FieldControlType", e.Item);
			PreSelectDropDown("Datatypes", "FieldDataType", e.Item);
		}

		private void PreSelectDropDown(string controlName, string fieldName, DataGridItem item)
		{
			DropDownList ddl = (DropDownList) item.FindControl(controlName);
			if (ddl != null)
			{
				DataRow row = ((DataRowView) item.DataItem).Row;
				ddl.SelectedValue = row[fieldName].ToString();
			}
		}

		private void AddParameterWithNullCheck(SqlCommand cmd, string fieldname, object val)
		{
			if (val == null)
			{
				cmd.Parameters.Add(new SqlParameter(fieldname, DBNull.Value));
			}
			else
			{
				cmd.Parameters.Add(new SqlParameter(fieldname, val));
			}
		}

		private void ResetGrid()
		{
			MetadataGrid.EditItemIndex = -1;
			PopulateMetadataGrid();
		}

		private void PopulateMetadataGrid()
		{
			if (TableList.SelectedIndex > 0)
			{
				MetadataGrid.DataSource = GetFieldNames(Int32.Parse(TableList.SelectedValue)).DefaultView;
				MetadataGrid.DataBind();
			}
		}

		private void PopulateTableList()
		{
			TableList.DataSource = GetTableNames().DefaultView;
			TableList.DataTextField = "TableName";
			TableList.DataValueField = "TableId";
			TableList.DataBind();
			TableList.Items.Insert(0, new ListItem("",""));
		}

		private DataTable GetFieldNames(int helpTableId)
		{
			return GetDataTable(FIELD_FMT_SQL + helpTableId.ToString());
		}

		private DataTable GetTableNames()
		{
			return GetDataTable(TABLE_SQL);
		}

		#region database interaction
		private DataTable GetDataTable(string sql)
		{
			SqlCommand cmd = null;
			DataTable table = null;
			try
			{
				cmd = DataAccessHelper.CreateCommand(sql);
				cmd.CommandType = CommandType.Text;
				DataSet ds = DataAccessHelper.GetList(cmd);
				table = ds.Tables[0];
			}
			finally
			{
				cmd.Connection.Close();
			}
			return table;
		}
		#endregion
	}
}
