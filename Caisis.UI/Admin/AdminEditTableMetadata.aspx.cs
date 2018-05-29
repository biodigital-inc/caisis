using System;
using System.Data;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using Caisis.BOL;
using Caisis.DataAccess;
using Caisis.UI.Core.Classes;
using Caisis.UI.Core.Classes.CustomControls;

namespace Caisis.UI.Admin
{
    public partial class AdminEditTableMetadata : AdminBaseMetadataPage
    {
        Caisis.Controller.PatientDataEntryController _dataEntryController;

        public string QueryTableId
        {
            get
            {
                return Request.QueryString["tableId"];
            }
        }

        public AdminEditTableMetadata()
            : base(new MetadataTable().TableName, new MetadataTableAttribute().TableName, MetadataTableAttribute.TableAttributeName, new MetadataTableAttributeValue().TableName, MetadataTableAttributeValue.TableAttributeValue)
        {
            _dataEntryController = new Controller.PatientDataEntryController(QueryDiseaseName);
        }

        #region build interface

        /// <summary>
        /// Builds a list of available MetadataTables
        /// </summary>
        protected override void PopulateAttributeValues()
        {
            MetadataDa da = new MetadataDa();
            var allTables = da.GetAllTableMetadata(null, QueryDiseaseId).AsEnumerable();
            // restrict to disease specific tables
            if (QueryDiseaseId.HasValue)
            {
                allTables = allTables.Where(r => !r.IsNull(Disease.DiseaseId));
            }
            // build a list of unique metadata tables with there associated metadata
            var tableToAttributes = from row in allTables
                                    let tableId = (int)row[MetadataTable.TableId]
                                    group row by tableId into groupByTable
                                    let tableName = groupByTable.First()[MetadataTable.TableName_Field].ToString()
                                    orderby tableName ascending
                                    select new
                                    {
                                        TableId = groupByTable.Key,
                                        TableName = tableName,
                                        Data = groupByTable,
                                        DiseaseAttributes = from record in groupByTable
                                                            where !record.IsNull(DiseaseAttributeValue.DiseaseAttributeValueId)
                                                            select record
                                    };
            MetadataGrid.DataSource = tableToAttributes;
            MetadataGrid.DataBind();

            // build missing metadata tables
            MetadataNewDa MNDa = new MetadataNewDa();
            DataTable tablesDt = MNDa.GetAllTablesInDB();
            // create display column for formatting
            DataView view = tablesDt.DefaultView;
            view.RowFilter = "TABLE_TYPE = 'BASE TABLE'";
            view.Sort = "TABLE_NAME ASC";

            NewMetadataTablesGrid.DataSource = view;
            NewMetadataTablesGrid.DataBind();
        }

        #endregion

        protected override void Update()
        {
            base.Update();
            // refresh all table metadata
            BOL.BusinessObject.RefreshTableMetadataFromDatabase();

            // close modal
            string updateScript = "if(top.reloadDataEntryFrame) { top.reloadDataEntryFrame(); top.hideModal(); }";
            Page.ClientScript.RegisterStartupScript(this.GetType(), "OnUpdateScript", updateScript, true);
        }

        protected void AddTablesClick(object sender, EventArgs e)
        {
            // add metadata tables
            foreach (GridViewRow row in NewMetadataTablesGrid.Rows)
            {
                CheckBox cb = row.FindControl("AddMetaTableCheckBox") as CheckBox;
                if (cb.Checked)
                {
                    string tableName = NewMetadataTablesGrid.DataKeys[row.RowIndex]["TABLE_NAME"].ToString();
                    MetadataTable biz = new MetadataTable();
                    biz[MetadataTable.TableName_Field] = tableName;
                    biz.Save();
                }
            }

            // rebuild interface
            PopulateAttributeValues();
        }

        #region Custom Getter and Setter Methods for processing non-standard attributes

        /// <summary>
        /// Hilights the table passed in query string
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void SetActiveRow(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                string rowTableId = DataBinder.Eval(e.Row.DataItem, MetadataTable.TableId).ToString();
                if (!string.IsNullOrEmpty(QueryTableId) && QueryTableId == rowTableId)
                {
                    e.Row.CssClass = e.Row.CssClass + " activeRow";
                }
            }
        }

        protected override void SetInputControlValue(ICaisisInputControl attributeValueField, string attributeValue, DataRow data)
        {
            if (data != null)
            {
                string tableName = data[MetadataTable.TableName_Field].ToString();
                string attributeName = data[MetadataTableAttribute.TableAttributeName].ToString();
                // handle special cases
                switch (attributeName)
                {
                    case ("DisplayWithChild"):
                        SetDisplayWithChild(attributeValueField, tableName, attributeValue);
                        break;
                    case ("GridView"):
                        SetGridView(attributeValueField, tableName, attributeValue);
                        break;
                    default:
                        base.SetInputControlValue(attributeValueField, attributeValue, data);
                        break;
                }
            }
            else
            {
                base.SetInputControlValue(attributeValueField, attributeValue, data);
            }
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="icic"></param>
        /// <param name="tableName"></param>
        /// <param name="tableAttributeValue"></param>
        protected void SetDisplayWithChild(ICaisisInputControl icic, string tableName, string tableAttributeValue)
        {
            CaisisCheckBoxList cbl = icic as CaisisCheckBoxList;
            var childTables = BusinessObject.GetChildTableNames(tableName);
            // build child tables if applicable
            if (childTables.Count() > 0)
            {
                cbl.DataSource = childTables;
                cbl.DataBind();
            }
            else
            {
                SetNAField(icic);
            }

            // set value
            icic.Value = tableAttributeValue;
        }

        protected void SetGridView(ICaisisInputControl icic, string tableName, string tableAttributeValue)
        {
            CaisisCheckBox cb = icic as CaisisCheckBox;
            bool isGrid = BusinessObject.GetParentKeyName(tableName) != BusinessObject.GetPrimaryKeyName(tableName);
            if (!isGrid)
            {
                SetNAField(icic);
            }
            // set value
            icic.Value = tableAttributeValue;
        }

        private void SetNAField(ICaisisInputControl icic)
        {
            Control inputField = icic as Control;
            Label naField = inputField.NamingContainer.FindControl(inputField.ID + "_NA") as Label;
            if (naField != null)
            {
                inputField.Visible = false;
                naField.Visible = true;
            }
        }

        protected override string GetInputControlValue(ICaisisInputControl attributeValueField)
        {
            return base.GetInputControlValue(attributeValueField);
        }

        #endregion


        /// <summary>
        /// Gets the friendly table label
        /// </summary>
        /// <param name="table"></param>
        /// <returns></returns>
        protected string GetTableLabel(string table)
        {
            return !string.IsNullOrEmpty(table) ? _dataEntryController.GetTableLabel(table) : string.Empty;
        }
    }
}