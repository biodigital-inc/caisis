using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System;
using System.Collections;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Web;
using System.Web.SessionState;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using System.Xml.Linq;

using Caisis.UI.ClientScript.JSON;
using Caisis.UI.Core.Classes;
using Caisis.UI.Core.Classes.CustomControls;
using Caisis.BOL;

namespace Caisis.UI.Admin
{
    public partial class AdminEformBuilder : AdminBasePage
    {
        /// <summary>
        /// The table level metadata attribute used for controlling which tables can be used for eform builder
        /// </summary>
        private static readonly string EFORM_METATABLE_ATTRIBUTE_NAME = "UseInWorkflows";

        /// <summary>
        /// A client list of exisiting eforms
        /// </summary>
        protected string ACTIVE_EFORM_ARRAY = "[]";

        private EformPage _page;
        private IEnumerable<TableLookup> Lookup;

        /// <summary>
        /// Gets the current PatientId (encrpyted)
        /// </summary>
        protected string EPID
        {
            get
            {
                string epid = string.Empty;
                if (Session[SessionKey.PatientId] != null)
                {
                    epid = Security.CustomCryptoHelper.Encrypt(Session[SessionKey.PatientId].ToString());
                }
                return epid;
            }
        }

        /// <summary>
        /// Gets the EForm name passed in the Query String
        /// </summary>
        protected string QueryEFormName
        {
            get
            {
                return Request.QueryString["eform"];
            }
        }

        /// <summary>
        /// Gets the Dynamic EForm Id passed in the Query String
        /// </summary>
        protected string QueryEFormId
        {
            get
            {
                return Request.QueryString["eformId"];
            }
        }

        public AdminEformBuilder()
            : base()
        {
            this.Init += (a, b) =>
                {
                    // build a list of tables which have special attribute
                    Lookup = from table in BusinessObject.GetAllTableNames()
                             where BusinessObject.HasMetadataTableAttribute(table, EFORM_METATABLE_ATTRIBUTE_NAME) && BusinessObject.GetMetadataTableAttribute(table, EFORM_METATABLE_ATTRIBUTE_NAME).ToLower() == bool.TrueString.ToLower()
                             select new TableLookup(table);
                    // Build list of tables and diseases
                    BuildTableOptions();
                    BuildDiseaseDropDown();

                    var allEforms = from eform in MetadataEForm.GetAll<MetadataEForm>()
                                        let eformName = eform[MetadataEForm.EFormName].ToString()
                                        select eformName.Replace("'","\\'");
                    // build client array 'Eform 1','Eform 2',etc...
                    if (allEforms.Count() > 0)
                    {
                        ACTIVE_EFORM_ARRAY = "['" + string.Join("','", allEforms.ToArray()) + "']";
                    }
                };
            this.PreRender += (a, b) =>
                {
                    // register parent table lookup
                    BuildClientTableRulesMap();
                };
        }

        protected override void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                // load by id
                if (!string.IsNullOrEmpty(QueryEFormId))
                {
                    LoadEForm(int.Parse(QueryEFormId));
                }
                // load by name
                else if (!string.IsNullOrEmpty(QueryEFormName))
                {
                    EformName.Value = QueryEFormName;
                    LoadEForm(QueryEFormName);
                }
                // otherwise new
                else
                {
                }
            }
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="eid"></param>
        private void LoadEForm(int eid)
        {
            // load by id
            MetadataEForm biz = new MetadataEForm();
            biz.Get(eid);

            // set name and id fields
            EformName.Value = biz[MetadataEForm.EFormName].ToString();
            EformId.Value = biz[MetadataEForm.MetadataEFormId].ToString();

            DiseaseList.SelectedValue = biz[MetadataEForm.EFormDisease].ToString();
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="eformName"></param>
        private void LoadEForm(string eformName)
        {
            // load by name
            MetadataEForm biz = MetadataEForm.GetByFields<MetadataEForm>(new Dictionary<string, object>() { { MetadataEForm.EFormName, eformName } }).First();
            LoadEForm((int)biz[biz.PrimaryKeyName]);
        }


        /// <summary>
        /// Builds a list of drop down options of Table's which are used for building dynamic Eforms
        /// </summary>
        private void BuildTableOptions()
        {
            // build top level tables
            var parentTables = from table in Lookup
                               where table.ParentTableName == "Patients"
                               select table;
            ParentTables.DataSource = parentTables;
            ParentTables.DataBind();
        }


        /// <summary>
        /// Builds a list of child tables for current top level table
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void BuildChildTables(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                string parentTable = (e.Item.DataItem as TableLookup).TableName;
                var childTables = from table in Lookup
                                  where table.ParentTableName == parentTable
                                  orderby table.TableLabel ascending
                                  select table;
                Repeater childTablesRptr = e.Item.FindControl("ChildTables") as Repeater;
                childTablesRptr.DataSource = childTables;
                childTablesRptr.DataBind();
            }
        }

        /// <summary>
        /// Builds a client object RULES_MAP used for looking table info.
        /// RULES_MAP['Encounters'].TableName => 'Encounters'
        /// RULES_MAP['Encounters'].ParentTableName => 'Patients'
        /// </summary>
        private void BuildClientTableRulesMap()
        {
            var map = from table in Lookup
                      select table.ToString();
            string rulesMap = "var RULES_MAP = { " + string.Join(",", map.ToArray()) + "};";
            Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "TableRulesMap", rulesMap, true);
        }

        /// <summary>
        /// Populates disease dropdown
        /// </summary>
        private void BuildDiseaseDropDown()
        {
            DiseaseList.DataSource = CaisisConfiguration.GetViewConfigList();
            DiseaseList.DataBind();
        }

        /// <summary>
        /// Simple table level metadata
        /// </summary>
        protected internal class TableLookup
        {
            public string TableName;
            public string TableLabel;
            public string ParentTableName;
            public string ParentTableLabel;

            public TableLookup(string table)
            {
                TableName = table;
                TableLabel = BusinessObject.HasTableLabel(table) ? BusinessObject.GetTableLabel(table) : table;
                ParentTableName = !string.IsNullOrEmpty(BusinessObject.GetParentTablename(table)) ? BusinessObject.GetParentTablename(table) : string.Empty;
                ParentTableLabel = !string.IsNullOrEmpty(ParentTableName) && BusinessObject.HasTableLabel(ParentTableName) ? BusinessObject.GetTableLabel(ParentTableName) : ParentTableName;

            }

            public override string ToString()
            {
                return "'" + this.TableName + "' : { 'TableLabel' : '" + this.TableLabel + "', 'ParentTableName' : '" + this.ParentTableName + "', 'ParentTableLabel' : '" + this.ParentTableLabel + "' } ";
            }
        }
    }
}

