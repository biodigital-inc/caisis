namespace Caisis.UI.Modules.Kidney.Eforms
{
	using System;
    using System.Collections;
    using System.Collections.Generic;
	using System.Data;
	using System.Drawing;
	using System.Web;
    using System.Web.UI;
	using System.Web.UI.WebControls;
	using System.Web.UI.HtmlControls;
	using System.Text;
	using System.Collections;
    using System.Linq;

	using Caisis.BOL;
	using Caisis.UI.Core.Classes;
    //2.0 using Caisis.UI.Modules.Prostate.PaperForms;
	using Caisis.DataAccess;


	/// <summary>
    ///		Summary description for HPI_Kidney.
	/// </summary>
    public partial class HPI_Kidney : BaseEFormControl
	{




		override protected void Page_Load(object sender, System.EventArgs e)
		{
			base.Page_Load(sender, e);
			BuildHPI();

        }

        protected void BuildHPI()
        {
                try
                {
                    PatientDa pDa = new PatientDa();
                    DataSet hpiDs = pDa.GetPatientHPIKidney(this._patientId);
                    DataView view = GetPatientHPIKidneyView(hpiDs.Tables[0]);
                    hpi.DataSource = view;
                    hpi.DataBind();
                }
                catch (Exception ex)
                {
                    hpi.Visible = false;
                    ExceptionHandler.Publish(ex);
                }

        }

        private DataView GetPatientHPIKidneyView(DataTable dataSource)
        {
            string childTableColumnName = "ChildTableNames";
            // validate column
            if (!dataSource.Columns.Contains(childTableColumnName))
            {
                DataColumn childTableColumn = new DataColumn(childTableColumnName, typeof(string));
                dataSource.Columns.Add(childTableColumn);
            }
            // fill child table columns
            foreach (DataRow row in dataSource.Rows)
            {
                string tableName = row["TableName"].ToString();
                int priKey = (int)row["PrimaryKey"];
                string tableKeyName = BusinessObject.GetPrimaryKeyName(tableName);
                // get child tables
                IEnumerable<string> childTables = BusinessObject.GetChildTableNames(tableName);
                // get child tables with records (i.e, query by ParentKey)
                IEnumerable<string> childTablesWithRecords = from child in childTables
                                                             where BusinessObject.Count(child, new Dictionary<string, object> { { tableKeyName, priKey } }) > 0
                                                             select child;
                // create CSV
                string childTableNames = string.Join(",", childTablesWithRecords.ToArray());
                // set child table names
                row[childTableColumnName] = childTableNames;
            }
            return dataSource.DefaultView;
        }


        protected void SetHpiItem(Object Sender, RepeaterItemEventArgs e)
		{
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {

            }			
		}




	}
}
