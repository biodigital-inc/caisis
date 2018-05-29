using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using Caisis.BOL;
using Caisis.UI.Core.Classes;

namespace Caisis.UI.Admin
{
    public partial class Metadata_Edit : AdminBasePage
    {
        protected override void Page_Load(object sender, EventArgs e)
        {
            base.Page_Load(sender, e);
            if (!Page.IsPostBack)
            {
                BuildAttributes();
            }
        }

        protected void UpdateClick(object sender, EventArgs e)
        {
            Update();
            BuildAttributes();
        }

        protected void RebuildOnDelete(object sender, GridViewDeletedEventArgs e)
        {
            BuildAttributes();
        }

        private void BuildAttributes()
        {
            // build table attributes
            TableAttributesGrid.DataSource = BusinessObject.GetAllAsDataView<MetadataTableAttribute>();
            TableAttributesGrid.DataBind();

            // build field attributes
            FieldAttributesGrid.DataSource = BusinessObject.GetAllAsDataView<MetadataFieldAttribute>();
            FieldAttributesGrid.DataBind();
        }

        /// <summary>
        /// Manually update "dirty" attributes
        /// </summary>
        private void Update()
        {
            // update table and field attributes (generic update)
            foreach (var grid in new ExtendedGridView[] { TableAttributesGrid, FieldAttributesGrid })
            {
                string table = grid.TableName;
                string priKeyName = BusinessObject.GetPrimaryKeyName(table);
                foreach (GridViewRow row in grid.Rows)
                {
                    object rowPriKey = grid.DataKeys[row.RowIndex][priKeyName];
                    int? rowPriKeyValue = null;
                    if (rowPriKey != null && !string.IsNullOrEmpty(rowPriKey.ToString()))
                    {
                        rowPriKeyValue = int.Parse(rowPriKey.ToString());
                    }
                    // update/insert dirty rows
                    if (grid.DirtyGridRows.Contains(row))
                    {
                        BusinessObject biz = BusinessObjectFactory.BuildBusinessObject(table);
                        // update
                        if (rowPriKeyValue.HasValue)
                        {
                            biz.Get(rowPriKeyValue.Value);
                        }
                        // set values
                        CICHelper.SetBOValues(row.Controls, biz, -1);
                        // save/udpate
                        biz.Save();
                        // udpate key
                        rowPriKeyValue = (int)biz[priKeyName];
                    }

                    // update child options only if parent updated/inserted
                    if (grid == FieldAttributesGrid && rowPriKeyValue.HasValue)
                    {
                        int fieldAttributeId = rowPriKeyValue.Value;

                        // update attribute options
                        var attributeOptionsGrid = row.FindControl("FieldAttributeOptionsGrid") as ExtendedGridView;
                        attributeOptionsGrid.Save(fieldAttributeId);
                    }
                }
            }
        }
    }
}