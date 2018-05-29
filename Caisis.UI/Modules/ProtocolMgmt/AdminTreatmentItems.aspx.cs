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

using System.Linq;

namespace Caisis.UI.Modules.ProtocolMgmt
{
    public partial class AdminTreatmentItems : ProtocolMgmtBaseAdminPage
    {
        protected DataTable dtPresetValues;
        List<int> dirtySchemaItems = new List<int>();

        protected override void Page_Load(object sender, EventArgs e)
        {
            base.Page_Load(sender, e);

            base.EnableViewState = true;

            if (!IsPostBack && !string.IsNullOrEmpty(BaseSchemaId))
            {
                int schemaId = int.Parse(BaseSchemaId);
                BuildSchemaItemsListing(schemaId);
            }
        }

        private void BuildSchemaItemsListing(int schemaId)
        {
            dtPresetValues = ProtocolMgmtDa.GetAllSchemaPresetValues(schemaId);

            DataTable dt = GetParentSchemaItems(schemaId);
            SchemaItemsListRptr.DataSource = dt;
            SchemaItemsListRptr.DataBind();

            // reset
            dirtySchemaItems.Clear();
        }


        protected void MarkSchemaItemDirty(object sender, EventArgs e)
        {
            RepeaterItem row = (sender as Control).NamingContainer as RepeaterItem;
            if (!dirtySchemaItems.Contains(row.ItemIndex))
                dirtySchemaItems.Add(row.ItemIndex);
        }

        protected void UpdateSchemaItemsClick(object sender, EventArgs e)
        {
            foreach (int index in dirtySchemaItems)
            {
                RepeaterItem row = SchemaItemsListRptr.Items[index];
                int schemaItemId = int.Parse((row.FindControl("SchemaItemId") as HiddenField).Value);
                string itemOrder = (row.FindControl("ItemOrder") as TextBox).Text;
                SchemaItem biz = new SchemaItem();
                biz.Get(schemaItemId);
                biz[SchemaItem.ItemOrder] = itemOrder;
                biz.Save();
            }
            // re-build
            BuildSchemaItemsListing(int.Parse(BaseSchemaId));
        }

        protected void NavigateClick(object sender, CommandEventArgs e)
        {
            // update order
            UpdateSchemaItemsClick(sender, e);
            // go to step: i.e., goToNext();
            string script = "goTo" + e.CommandArgument.ToString();
            Page.ClientScript.RegisterStartupScript(this.GetType(), script, script + "();", true);
        }

        protected DataTable GetParentSchemaItems(int schemaId)
        {
            DataTable allSchemaItems = ProtocolMgmtDa.GetAllSchemaItems(schemaId);
            var parentSchemaItems = from row in allSchemaItems.AsEnumerable()
                                    group row by (int)row["SchemaItemId"] into entries
                                    let parent = entries.OrderBy(r => r.IsNull("DestTable") ? int.MaxValue : BusinessObject.GetTableDepth(r["DestTable"].ToString())).First()
                                    let itemOrder = parent.IsNull("ItemOrder") ? int.MaxValue : (int)parent["ItemOrder"]
                                    orderby itemOrder ascending
                                    select parent;
            if (parentSchemaItems.Count() > 0)
                return parentSchemaItems.CopyToDataTable();
            else
                return new DataTable();
        }

        protected void PopulateValues(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                // Show only records where DestTable equals to the parent table
                string strParentTable = DataBinder.Eval(e.Item.DataItem, "DestTable").ToString();
                string strCurrentSchemaItem = DataBinder.Eval(e.Item.DataItem, "SchemaItemId").ToString();

                var schemaItemFielsdMetadata = from row in dtPresetValues.AsEnumerable()
                                               where row["SchemaItemId"].ToString() == strCurrentSchemaItem && row["DestTable"].ToString() == strParentTable
                                               let field = new
                                               {
                                                   FieldName = row["DestField"].ToString(),
                                                   FieldLabel = row["FieldLabel"].ToString(),
                                                   DestValue = row["DestValue"].ToString(),
                                                   FieldOrder = row.IsNull("FieldOrder") ? int.MaxValue : (int)row["FieldOrder"]
                                               }
                                               orderby field.FieldOrder ascending
                                               select field;
                // a list of pre selected fields and values
                var presetSchemaItemFields = schemaItemFielsdMetadata.Where(f => f.DestValue != "[enter]");
                // a list of field and values collected at visit
                var collectSchemaItemFields = schemaItemFielsdMetadata.Except(presetSchemaItemFields);

                Repeater presetListRptr = e.Item.FindControl("PresetListRptr") as Repeater;
                if (presetListRptr != null)
                {
                    presetListRptr.DataSource = presetSchemaItemFields;
                    presetListRptr.DataBind();
                }

                Repeater collectListRptr = e.Item.FindControl("CollectVisitRepeater") as Repeater;
                if (collectListRptr != null)
                {
                    collectListRptr.DataSource = collectSchemaItemFields;
                    collectListRptr.DataBind();
                }

                Label lblChildTables = e.Item.FindControl("ChildTablesList") as Label;

                if (lblChildTables != null)
                {
                    DataTable dtAllTables = ProtocolMgmtDa.GetUniqueTableNamesBySchema(int.Parse(strCurrentSchemaItem));
                    var childTableNames = dtAllTables.AsEnumerable().Select(r => r["DestTable"].ToString()).Where(t => t != strParentTable);
                    // if there are child tables
                    if (childTableNames.Count() > 0)
                    {
                        lblChildTables.Text = string.Join(", ", childTableNames.ToArray());
                    }
                    // otherwise "None"
                    else
                    {
                        lblChildTables.Text = "None";
                    }
                }
            }
        }
    }
}
