using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using Caisis.BOL;
using Caisis.UI.Core.Classes;
using Caisis.DataAccess;

namespace Caisis.UI.Core.DataEntry
{
    /// <summary>
    /// Represents a tooltip layer containing metadata for a specific metadata driven table/field/configuration
    /// </summary>
    public partial class MetadataTooltip : BaseControl
    {
        protected string Table;
        protected string Field;
        private Caisis.Controller.PatientDataEntryController pdec = new Caisis.Controller.PatientDataEntryController();

        protected override void OnLoad(EventArgs e)
        {
            base.OnLoad(e);
        }

        /// <summary>
        /// For the specified table, build metadata tooltip for default view
        /// </summary>
        /// <param name="table"></param>
        public virtual void BuildTooltipTableMetadata(string table)
        {
            BuildTooltipTableMetadata(table, null);
        }

        /// <summary>
        /// For the specified table and disease, build metadata tooltip
        /// </summary>
        /// <param name="table"></param>
        /// <param name="disease"></param>
        public virtual void BuildTooltipTableMetadata(string table, string disease)
        {
            var tableMetadata = Caisis.Controller.PatientDataEntryController.GetTableDiseaseMetadata(table, disease);
            BuildTooltipMetadata(table, string.Empty, tableMetadata);
        }

        /// <summary>
        /// For the specified table and field, build a metadata tooltip with the current disease metadata
        /// </summary>
        /// <param name="table"></param>
        /// <param name="field"></param>
        public virtual void BuildTooltipMetadata(string table, string field)
        {
            // get current metadata
            string disease = new Caisis.Controller.DiseaseController().GetDiseaseView();

            // build UI
            BuildTooltipMetadata(table, field, disease);
        }

        /// <summary>
        /// For the specified table and field, build a metadata tooltip with the specified disease metadata
        /// </summary>
        /// <param name="table"></param>
        /// <param name="field"></param>
        /// <param name="disease"></param>
        public virtual void BuildTooltipMetadata(string table, string field, string disease)
        {
            // get current metadata
            var fieldMetadata = Caisis.Controller.PatientDataEntryController.GetTableFieldDiseaseMetadata(table, field, disease);

            // build UI
            BuildTooltipMetadata(table, field, fieldMetadata);
        }

        /// <summary>
        /// For the specified table and field, build a metadata tooltip with the specified field metadata
        /// </summary>
        /// <param name="table"></param>
        /// <param name="field"></param>
        /// <param name="metadata"></param>
        public virtual void BuildTooltipMetadata(string table, string field, IDictionary<string, KeyValuePair<bool, string>> metadata)
        {
            // set public values
            this.Table = table;
            this.Field = field;

            // transform into cleaner data source
            var metaDataSource = from pair in metadata
                                 let name = pair.Key
                                 let value = pair.Value.Value
                                 let isDefault = pair.Value.Key
                                 orderby name ascending
                                 select new
                                 {
                                     Key = name,
                                     Value = value,
                                     IsDefault = isDefault
                                 };
            // build UI
            MetadataTooltipRptr.DataSource = metaDataSource;
            MetadataTooltipRptr.DataBind();
        }
    }
}