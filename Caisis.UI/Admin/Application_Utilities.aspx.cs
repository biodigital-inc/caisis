using System;
using System.Data;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using Caisis.UI.Core.Classes;
using Caisis.BOL;
using Caisis.DataAccess;

namespace Caisis.UI.Admin
{
    public partial class Application_Utilities : AdminBasePage
    {
        protected override void Page_Load(object sender, EventArgs e)
        {
            base.Page_Load(sender, e);
            if (!Page.IsPostBack)
            {
                PublishAppStats();
                string type = Request.QueryString["type"];
                if (!string.IsNullOrEmpty(type))
                {
                    RefreshCacheItem(type);
                }
            }
        }


        protected void PublishTableAudit(object sender, EventArgs e)
        {
            bool onlyShowTables = AuditOptions.Items[0].Selected;
            bool onlyShowConflict = AuditOptions.Items[1].Selected;

            MetadataNewDa da = new MetadataNewDa();
            var pdec = new Caisis.Controller.PatientDataEntryController(null);

            DataTable dt = da.GetAllTableAndColumns();
            var db = from row in dt.AsEnumerable()
                     let table = row["TABLE_NAME"].ToString()
                     let field = row["COLUMN_NAME"].ToString()
                     let pair = new { Table = table, Field = field }
                     group pair by pair.Table into g
                     select new
                     {
                         Table = g.Key,
                         Fields = g.Select(t => t.Field)
                     };
            var dbTableNames = db.ToDictionary(a => a.Table, a => a.Fields);

            var biz = from table in BusinessObject.GetAllTableNames()
                      from field in BusinessObject.GetFieldNames(table)
                      group field by table into g
                      select new
                      {
                          Table = g.Key,
                          Fields = g
                      };
            var bizTableName = biz.ToDictionary(a => a.Table, a => a.Fields.Select(f => f));
            var allTables = dbTableNames.Keys.Union(bizTableName.Keys).Distinct();
            var tableAndFieldAudit = from table in allTables
                                     let indb = dbTableNames.ContainsKey(table)
                                     let inbiz = bizTableName.ContainsKey(table)
                                     let dbFields = indb ? dbTableNames[table] : new string[0]
                                     let bizFields = inbiz ? bizTableName[table] : new string[0]
                                     let allFields = dbFields.Union(bizFields).Distinct()
                                     from field in allFields
                                     orderby table, field
                                     let fieldInDB = indb && dbFields.Contains(field)
                                     let fieldInBiz = inbiz && bizFields.Contains(field)
                                     where !onlyShowConflict || fieldInDB != fieldInBiz || (fieldInDB == false && fieldInBiz == false)
                                     select new
                                     {
                                         Table = table,
                                         Field = field,
                                         InDB = fieldInDB,
                                         InBiz = fieldInBiz
                                     };
            if (onlyShowTables)
            {
                tableAndFieldAudit = from t in tableAndFieldAudit
                                     group t by t.Table into g
                                     select new
                                     {
                                         Table = g.Key,
                                         Field = "",
                                         InDB = g.Where(b => b.InDB).Count() == g.Count(),
                                         InBiz = g.Where(b => b.InBiz).Count() == g.Count()
                                     };
            }

            AuditTableGrid.DataSource = tableAndFieldAudit;
            AuditTableGrid.DataBind();
        }

        protected void SetInvalidColumns(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                var dbCell = e.Row.Cells[2];
                var bizCell = e.Row.Cells[3];
                bool inDB = (bool)DataBinder.Eval(e.Row.DataItem, "InDB");
                bool inBiz = (bool)DataBinder.Eval(e.Row.DataItem, "InBiz");
                dbCell.CssClass = inDB ? "valid" : "invalid";
                bizCell.CssClass = inBiz ? "valid" : "invalid";
            }
        }

        /// <summary>
        /// 
        /// </summary>
        private void PublishAppStats()
        {
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void RefreshApplicationItem(object sender, CommandEventArgs e)
        {
            string type = e.CommandArgument.ToString();
            RefreshCacheItem(type);
        }

        /// <summary>
        /// Refreshes the specified cached items
        /// </summary>
        /// <param name="type"></param>
        private void RefreshCacheItem(string type)
        {
            bool updated = false;
            switch (type)
            {
                case "LookupCodes":
                    RefreshLookupCache();
                    updated = true;
                    break;
                case "BusinessObjects":
                    RefreshBusinessObjects();
                    updated = true;
                    break;
                case "PatientData":
                    RefreshPatientDataCache();
                    updated = true;
                    break;
                case "Application":
                    RefreshApplicationCache();
                    updated = true;
                    break;
            }
            if (updated)
            {
                string message = "The '{0}' cache has been updated";
                Message.Text = string.Format(message, type);
            }
        }

        /// <summary>
        /// Refresh lookup code cache
        /// </summary>
        private void RefreshLookupCache()
        {
            CacheManager.ResetLookupCodeCache();
        }

        /// <summary>
        /// Refresh main application cache
        /// </summary>
        private void RefreshApplicationCache()
        {
            CacheManager.RefreshApplicationCache();
            RefreshBusinessObjects();
        }

        /// <summary>
        /// Refresh all table and field metadata
        /// </summary>
        private void RefreshBusinessObjects()
        {
            Caisis.BOL.BusinessObject.RefreshMetadataFromDatabase();
        }

        /// <summary>
        /// Refresh Patient Data cache
        /// </summary>
        private void RefreshPatientDataCache()
        {
            // special case, clear diseas specific cache
            if (Request.QueryString.AllKeys.Contains("disease"))
            {
                CacheManager.RefreshPatientDataCache(QueryDiseaseName);
            }
            else
            {
                CacheManager.RefreshPatientDataCache();
            }
        }
    }
}