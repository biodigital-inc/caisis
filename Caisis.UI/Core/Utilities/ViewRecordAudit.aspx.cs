using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

using Caisis.DataAccess;
using Caisis.BOL;

using Caisis.UI.Core.Classes;
using Caisis.UI.Core.Classes.CustomControls;

public partial class Core_DataEntryForms_ViewRecordAudit : System.Web.UI.Page
{
    // BizObject currentRecordBiz; // -> IEnumerable<IBusinessObject>

	IEnumerable<IBusinessObject> bizObjects;
	string bizObjects_tablename;

    protected void Page_Load(object sender, EventArgs e)
    {
        string tableList = Request["tableNames"].ToString();
        string encryptedKey = Request["tablePriKey"].ToString();
        string decryptedKey = "";
        // End Response if key can't be decrypted or bogus key entered
        try
        {
            decryptedKey = Caisis.Security.CustomCryptoHelper.Decrypt(encryptedKey);
        }
        catch (Exception ex)
        {
            Response.End();
        }
        if (string.IsNullOrEmpty(decryptedKey))
        {
            Response.End();
        }
        int priKey = int.Parse(decryptedKey);
        string[] listOfTables = tableList.Split(',');
        string parentTable = listOfTables[0];
        string showTable = Request["showTable"] != null ? Request["showTable"].ToString() : "";

        DataTable linkTable = new DataTable();
        linkTable.Columns.Add("TableName");
        linkTable.Columns.Add("TableURL");
        foreach (string table in listOfTables)
        {
            string url = "?tableNames=" + tableList + "&tablePriKey=" + Caisis.Security.CustomCryptoHelper.Encrypt(priKey.ToString()) + "&showTable=" + table;
            if (table == parentTable)
            {
                ParentTableLink.Text = table;
                ParentTableLink.NavigateUrl = url;
            }
            else
            {
                DataRow row = linkTable.NewRow();
                row["TableName"] = table;
                row["TableURL"] = url;
                linkTable.Rows.Add(row);
            }
        }
        string boTable = string.IsNullOrEmpty(showTable) ? parentTable : showTable;
		//currentRecordBiz = BOFactory.GetBO(boTable);
		//if (boTable == parentTable)
		//{
		//    currentRecordBiz.Get(priKey);
		//}
		//else
		//{
		//    currentRecordBiz.GetByParent(priKey);
		//}
		//SetCurrentRecordGrid(currentRecordBiz, parentTable);
		//if (currentRecordBiz.RecordCount == 1)
		//{
		//    SetAuditGrid(currentRecordBiz);
		//}

		if (boTable == parentTable)
		{
			IBusinessObject b = BusinessObjectFactory.BuildBusinessObject(boTable);
			b.Get(priKey);
			bizObjects = new IBusinessObject[] { b };
		}
		else
		{
			bizObjects = BusinessObject.GetByParent(boTable, priKey);
		}

		bizObjects_tablename = boTable;

		DataTable dt = bizObjects.AsDataView(boTable).Table;
		SetCurrentRecordGrid(dt, boTable, parentTable);
		if (bizObjects.Count() == 1)
		{
			SetAuditGrid(bizObjects.First());
		}

        rptTableList.DataSource = linkTable;
        rptTableList.DataBind();
    }

    #region Event Handlers

    /// <summary>
    /// Sets the Audit Grid for the clicked row in the CurrentRecord Grid.
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void SetAuditGridViewOnViewClick(object sender, EventArgs e)
    {
        LinkButton viewRecordButton = sender as LinkButton;
        GridViewRow row = viewRecordButton.NamingContainer as GridViewRow;
        row.CssClass = "CurrentGridRow";
        //string tableName = currentRecordBiz.Tablename;
        int priKey = int.Parse(viewRecordButton.CommandArgument);
		//BizObject biz = BOFactory.GetBO(tableName);
		//biz.Get(priKey);
		IBusinessObject biz = BusinessObjectFactory.BuildBusinessObject(bizObjects_tablename);
		biz.Get(priKey);
        SetAuditGrid(biz);
    }

    /// <summary>
    /// Sets the CommandArgument for the View Record Link in each row. This will be the primaryKey of the bizobject.
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void SetupCurrentRecordGridRow(object sender, GridViewRowEventArgs e)
    {
        TableCell viewRecordCell = e.Row.Cells[0];
		DataTable table = bizObjects.AsDataView(bizObjects_tablename).Table;

        for (int i = 0; i < e.Row.Cells.Count - 2; i++)
        {
            TableCell cell = e.Row.Cells[i + 1];
			//string colName = currentRecordBiz.DataSourceView.Table.Columns[i].ColumnName;
			//if (colName == currentRecordBiz.PrimaryKeyName || colName == currentRecordBiz.ParentKeyName)
			string colName = table.Columns[i].ColumnName;
			if (colName == BusinessObject.GetPrimaryKeyName(bizObjects_tablename) ||
				colName == BusinessObject.GetParentKeyName(bizObjects_tablename))
            {
                cell.Visible = false;
            }
        }
        //if (currentRecordBiz.RecordCount > 1)
		if (table.Rows.Count > 1)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                LinkButton link = viewRecordCell.Controls[1] as LinkButton;
                object dataItem = DataBinder.GetDataItem(e.Row);
                //string priKey = DataBinder.Eval(dataItem, currentRecordBiz.PrimaryKeyName).ToString();
				string priKey = DataBinder.Eval(dataItem, BusinessObject.GetPrimaryKeyName(bizObjects_tablename)).ToString();
                link.CommandArgument = priKey;
            }
        }
        else
        {
            viewRecordCell.Visible = false;
        }
    }

    protected void SetTableLinks(object sender, RepeaterItemEventArgs e)
    {
        string tableTitle = DataBinder.Eval(DataBinder.GetDataItem(e.Item), "TableName").ToString();
        string tableURL = DataBinder.Eval(DataBinder.GetDataItem(e.Item), "TableURL").ToString();
        HtmlAnchor link = e.Item.FindControl("TableLink") as HtmlAnchor;
        //string currentLinkColor = tableTitle == currentRecordBiz.Tablename ? "#0066cc" : "#cc0000";
        //link.Style.Add("background-color", currentLinkColor);

        link.InnerText = tableTitle;
        link.HRef = tableURL;
    }

    #endregion

    #region GridHelpers

    /// <summary>
    /// Bind the datagrid to a datasource, and set titles via metadata
    /// </summary>
    /// <param name="grid"></param>
    /// <param name="dt"></param>
    /// <param name="biz"></param>
    protected void BindGridViaMetaData(GridView grid, DataTable dt, string tablename)
    {
        MetadataDa mdDa = new MetadataDa();
        DataTable fieldsDt = mdDa.GetFieldsByTableName(tablename);
        DataTable attributesDt = mdDa.GetFieldMetadataByTableName(tablename);
        foreach (DataColumn col in dt.Columns)
        {
            if (col.ColumnName != "LoggedBy")
            {
                string s = CICHelper.GetFieldAttributeValue(attributesDt, col.ColumnName, "FieldLabel");
                BoundField newGridCol = new BoundField();
                newGridCol.DataField = col.ColumnName;
                newGridCol.HeaderText = !string.IsNullOrEmpty(s) ? s : col.ColumnName;
                grid.Columns.Add(newGridCol);
            }
        }
        grid.DataSource = dt;
        grid.DataBind();
    }

    /// <summary>
    /// Binds the Grid to the current record and updates the title.
    /// </summary>
    /// <param name="biz"></param>
    protected void SetCurrentRecordGrid(DataTable table, string tablename, string parentTable)
    {
        //DataTable recordTable = biz.DataSourceView.Table;
        BindGridViaMetaData(CurrentRecordGrid, table, tablename);

		int count = table.Rows.Count;

        if (count > 0)
        {
            if (count == 1)
            {
                CurrentRecordTitle.Text = tablename + " RECORD";
            }
            else
            {
                CurrentRecordTitle.Text = "TABLE " + tablename + " has multiple records, please select a row.";
            }
        }
        else
        {
            CurrentRecordTitle.Text = "There are no records for TABLE " + tablename;
        }
    }

    /// <summary>
    /// Binds the Grid for the Audit log based on a row in the current record and updates the title.
    /// </summary>
    /// <param name="biz"></param>
    protected void SetAuditGrid(IBusinessObject biz)
    {
        DataTable auditTable = GetAuditDataSource(biz);
        BindGridViaMetaData(CurrentRecordAuditGrid, auditTable, biz.TableName);

        string auditRecordText = " TABLE " + biz.TableName;
        if (auditTable.Rows.Count > 0)
        {
            CurrentAuditTitle.Text = "AUDIT LOG for " + auditRecordText;
            ShowHideHelper.Visible = true;
        }
        else
        {
            CurrentAuditTitle.Text = "There is no Audit for this record in the AUDIT LOG";
            ShowHideHelper.Visible = false;
        }
    }

    /// <summary>
    /// Retrieves the Audit record for the first row in the biz object.
    /// </summary>
    /// <param name="biz"></param>
    /// <returns></returns>
    protected DataTable GetAuditDataSource(IBusinessObject biz)
    {
        string tableName = biz.TableName;
        string tablePriKeyName = biz.PrimaryKeyName;
        int tablePriKeyValue = int.Parse(biz[biz.PrimaryKeyName].ToString());
        List<string> exclusionCols = GetExclusionList(biz.TableName);
        List<string> inclusionCols = new List<string>();
		//foreach (DataColumn col in biz.DataSourceView.Table.Columns)
		//{
		//    if (!exclusionCols.Contains(col.ColumnName))
		//    {
		//        inclusionCols.Add(col.ColumnName);
		//    }
		//}
		foreach (string f in biz.FieldNames)
		{
			if (!exclusionCols.Contains(f))
				inclusionCols.Add(f);
		}
		
        inclusionCols.AddRange(new string[] { "LoggedOperation", "LoggedBy", "LoggedTime" });
        // AuditLogDa da = new AuditLogDa();
		// DataTable recordAudit;
		
		// da.GetAuditByTableAndPrimaryKey(tableName, tablePriKeyName, tablePriKeyValue, inclusionCols);

		return AuditServices.GetAuditLog(biz.TableName, tablePriKeyValue, inclusionCols);
    }
    #endregion

    /// <summary>
    /// Get a list of fields to exclude from a viewable DataTable
    /// </summary>
    /// <param name="biz"></param>
    /// <returns></returns>
    private List<string> GetExclusionList(string tablename)
    {
		string primaryKeyName = BusinessObject.GetPrimaryKeyName(tablename);
		string parentKeyName = BusinessObject.GetParentKeyName(tablename);
		List<string> tmp = new List<string>(new string[] { primaryKeyName, parentKeyName, BusinessObject.EnteredBy, BusinessObject.EnteredTime, BusinessObject.LockedBy, BusinessObject.LockedTime, BusinessObject.UpdatedBy, BusinessObject.UpdatedTime });
        List<string> exclusions = new List<string>();
        foreach (string s in tmp)
        {
            if (!string.IsNullOrEmpty(s))
            {
                exclusions.Add(s);
            }
        }
        return exclusions;
    }

    protected override void Render(HtmlTextWriter writer)
    {
        // Handle Current Record Grid
        foreach (DataControlField col in CurrentRecordGrid.Columns)
        {
            List<string> exclusdeFromCurrentRecord = GetExclusionList(bizObjects_tablename);
            if (exclusdeFromCurrentRecord.Contains(col.HeaderText))
            {
                col.Visible = false;
            }
        }
        // Handle Audit Grid Render
        if (CurrentRecordAuditGrid.Rows.Count > 0)
        {
            System.Collections.Hashtable colorHash = new System.Collections.Hashtable();
            string startHex = "ffffff";
            int startGradation = System.Convert.ToInt32(startHex, 16);
            int maxHash = System.Convert.ToInt32("ffffff", 16);
            int numberOfGradient = 16;
            int offset = maxHash / (numberOfGradient - 1);
            for (int i = startGradation; i > 0; )
            {
                string hashVal = "#" + String.Format("{0:x2}", i);
                string nextHashVal = "#" + String.Format("{0:x2}", i -= offset);
                string textColor = i >= startGradation / 2 ? "#000000" : "#ffffff";
                colorHash.Add(hashVal, new string[] { nextHashVal, textColor });
            }
            foreach (GridViewRow currentRow in CurrentRecordAuditGrid.Rows)
            {
                int currentRowIndex = currentRow.RowIndex;
                if (currentRowIndex > 0)
                {
                    GridViewRow previousRow = CurrentRecordAuditGrid.Rows[currentRowIndex - 1];
                    for (int conIndex = 0; conIndex < currentRow.Controls.Count; conIndex++)
                    {
                        Control con = currentRow.Controls[conIndex];
                        if (con is DataControlFieldCell)
                        {
                            DataControlFieldCell currentRowCell = con as DataControlFieldCell;
                            DataControlFieldCell previousRowCell = previousRow.Controls[conIndex] as DataControlFieldCell;
                            if (currentRowCell.Text != previousRowCell.Text)
                            {
                                string prevColor = previousRowCell.Style[HtmlTextWriterStyle.BackgroundColor];
                                if (!string.IsNullOrEmpty(prevColor))
                                {
                                    object testColor = colorHash[prevColor];
                                    if (testColor != null)
                                    {
                                        currentRowCell.Style[HtmlTextWriterStyle.BackgroundColor] = (testColor as string[])[0];
                                        currentRowCell.Style[HtmlTextWriterStyle.Color] = (testColor as string[])[1];
                                    }
                                    else
                                    {
                                        string secondHash = (colorHash["#" + startHex] as string[])[0];
                                        currentRowCell.Style[HtmlTextWriterStyle.BackgroundColor] = (colorHash[secondHash] as string[])[0];
                                        currentRowCell.Style[HtmlTextWriterStyle.Color] = (colorHash[secondHash] as string[])[1];
                                    }
                                }
                                else
                                {
                                    string firstHash = "#" + startHex;
                                    currentRowCell.Style[HtmlTextWriterStyle.BackgroundColor] = (colorHash[firstHash] as string[])[0];
                                    currentRowCell.Style[HtmlTextWriterStyle.Color] = (colorHash[firstHash] as string[])[1];
                                }
                            }
                        }
                    }
                }
            }
        }
        base.Render(writer);
    }
}
