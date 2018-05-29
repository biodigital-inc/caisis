namespace Caisis.UI.Modules.Bladder.Eforms
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
    using System.Linq;

	using Caisis.BOL;
	using Caisis.UI.Core.Classes;
    //2.0 using Caisis.UI.Modules.Prostate.PaperForms;
	using Caisis.DataAccess;


	/// <summary>
    ///		Summary description for HPI_Bladder.
	/// </summary>
    public partial class HPI_Bladder : BaseEFormControl
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
                    DataSet hpiDs = pDa.GetPatientHPIBladder(this._patientId);
                    DataView view = new DataView(hpiDs.Tables[0]);
                    if (view.Count > 0)
                    {
                        hpi.DataSource = view;
                        hpi.DataBind();
                        NoHPIMsgTr.Visible = false;
                    }
                }
                catch (Exception ex)
                {
                    hpi.Visible = false;
                    ExceptionHandler.Publish(ex);
                    NoHPIMsgTr.Visible = true;
                    NoHPIMsgTd.InnerHtml = "There was an error retreiving the HPI for this patient.";
                    NoHPIMsgTd.InnerHtml += ex.Message;
                }

        }

        //private DataView GetPatientHPIView(DataTable dataSource)
        //{
        //    string childTableColumnName = "ChildTableNames";
        //    // validate column
        //    if (!dataSource.Columns.Contains(childTableColumnName))
        //    {
        //        DataColumn childTableColumn = new DataColumn(childTableColumnName, typeof(string));
        //        dataSource.Columns.Add(childTableColumn);
        //    }
        //    // fill child table columns
        //    foreach (DataRow row in dataSource.Rows)
        //    {
        //        string tableName = row["TableName"].ToString();
        //        int priKey = (int)row["PrimaryKey"];
        //        string tableKeyName = BusinessObject.GetPrimaryKeyName(tableName);
        //        // get child tables
        //        IEnumerable<string> childTables = BusinessObject.GetChildTableNames(tableName);
        //        // get child tables with records (i.e, query by ParentKey)
        //        IEnumerable<string> childTablesWithRecords = from child in childTables
        //                                                     where BusinessObject.Count(child, new Dictionary<string, object> { { tableKeyName, priKey } }) > 0
        //                                                     select child;
        //        // create CSV
        //        string childTableNames = string.Join(",", childTablesWithRecords.ToArray());
        //        // set child table names
        //        row[childTableColumnName] = childTableNames;
        //    }
        //    return dataSource.DefaultView;
        //}






	}
}
