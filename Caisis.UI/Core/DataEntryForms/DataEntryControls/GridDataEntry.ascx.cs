using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using Caisis.UI.Core.Classes;
using Caisis.UI.Core.Classes.CustomControls;
using Caisis.BOL;

namespace Caisis.UI.Core.DataEntry
{
    public partial class GridDataEntry : BasePatientDataControl
    {
        /// <summary>
        /// Adds a grid based on the current table name
        /// </summary>
        /// <param name="tableName"></param>
        public virtual void BuildLayout(string tableName)
        {
            // validate table
            if (BusinessObjectFactory.CanBuildBusinessObject(tableName))
            {
                // get config
                Caisis.Controller.PatientDataEntryController pdec = new Caisis.Controller.PatientDataEntryController();
                int totalBlankRows = pdec.GetTotalBlankGridRows(tableName);
                int totalVisibleBlankRows = pdec.GetVisibleBlankGridRows(tableName);
                var tableFieldsMetadata = pdec.GetTableFieldsMetadata(tableName);
                BuildLayout(tableName, totalBlankRows, totalVisibleBlankRows, tableFieldsMetadata);
            }
        }

        /// <summary>
        /// Adds a grid using the current configuration proerpties
        /// </summary>
        /// <param name="tableName"></param>
        /// <param name="totalBlankRows"></param>
        /// <param name="totalVisibleBlankRows"></param>
        /// <param name="tableFieldsMetadata"></param>
        public virtual void BuildLayout(string tableName, int totalBlankRows, int totalVisibleBlankRows, Dictionary<string, Dictionary<string, string>> tableFieldsMetadata)
        {
            IEnumerable<IBusinessObject> dataSource = from i in Enumerable.Range(0, totalBlankRows)
                                                      select BusinessObjectFactory.BuildBusinessObject(tableName) as IBusinessObject;

            BuildLayout(tableName, dataSource, totalBlankRows, totalVisibleBlankRows, tableFieldsMetadata);
        }

        /// <summary>
        /// Adds a grid using the current configuration proerpties
        /// </summary>
        /// <param name="tableName"></param>
        /// <param name="dataSource"></param>
        /// <param name="totalBlankRows"></param>
        /// <param name="totalVisibleBlankRows"></param>
        /// <param name="tableFieldsMetadata"></param>
        public virtual void BuildLayout(string tableName, IEnumerable<IBusinessObject> dataSource, int totalBlankRows, int totalVisibleBlankRows, Dictionary<string, Dictionary<string, string>> tableFieldsMetadata)
        {
            CaisisGridView grid = CICHelper.AddGridViewByTableName(this, dataSource, tableName, totalBlankRows, totalVisibleBlankRows, tableFieldsMetadata);
            grid.ShowDeleteButton = false;
        }
    }
}