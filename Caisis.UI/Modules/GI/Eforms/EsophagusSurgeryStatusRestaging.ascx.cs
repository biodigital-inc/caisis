namespace Caisis.UI.Modules.GI.Eforms
{
	using System;
	using System.Data;
	using System.Drawing;
	using System.Web;
	using System.Web.UI.WebControls;
	using System.Web.UI.HtmlControls;

	using Caisis.BOL;
	using Caisis.UI.Core.Classes;
	using Caisis.DataAccess;
	using Caisis.UI.Core.Classes.CustomControls;


	/// <summary>
    ///		Summary description for EsophagusSurgeryStatusRestaging.
	/// </summary>
    public partial class EsophagusSurgeryStatusRestaging : BaseEFormControl
	{
        
		override protected void Page_Load(object sender, System.EventArgs e)
		{
			base.Page_Load(sender, e);
            GetRestagingHx(this._patientId, this._eformName, "Dynamic");
            base.SetTitle(ComponentTitle);
		}

        private void GetRestagingHx(int PatientID, string FormName, string FormType)
		{
            DataView ptStatusTableView = BusinessObject.GetByParentAsDataView<Status>(PatientID);

            // retrieve restaging lookupcode values
            DataTable restagingLkpcodes = CacheManager.GetLookupCodeList(Status_1.LookupCode);
            string restagingStatusList = CreateDelimitedString(restagingLkpcodes, LookupCode.LkpCode, ",");

            // retrieve current patient medications only for specified lookupcode values
            string filterString = !String.IsNullOrEmpty(restagingStatusList) ? Status.Status_Field + " IN (" + restagingStatusList + ")" : String.Empty;

            DataTable restagingStatusDt = FilterTable(ptStatusTableView.Table, filterString);

            // set medication rows to repeater control
            DataView dv = new DataView(restagingStatusDt);
            dv.Sort = Status.StatusDate + " ASC ";

            if (dv.Count > 0)
            {
                RestagingHx.DataSource = dv;
                RestagingHx.DataBind();
            }
		}

        private DataTable FilterTable(DataTable medProsTable, string filterString)
        {
            //DataRow[] filteredRows = medPros.GetTable().Select(filterString);
            //DataTable filteredDt = medPros.GetTable().Clone();

            DataRow[] filteredRows = medProsTable.Select(filterString);
            DataTable filteredDt = medProsTable.Clone();

            DataRow dr;
            foreach (DataRow oldDr in filteredRows)
            {
                dr = filteredDt.NewRow();
                //for (int i = 0; i < medPros.GetTable().Columns.Count; i++)
                //    dr[medPros.GetTable().Columns[i].ColumnName] = oldDr[medPros.GetTable().Columns[i].ColumnName];
                for (int i = 0; i < medProsTable.Columns.Count; i++)
                    dr[medProsTable.Columns[i].ColumnName] = oldDr[medProsTable.Columns[i].ColumnName];
                filteredDt.Rows.Add(dr);
            }

            return filteredDt;
        }

        private String CreateDelimitedString(DataTable dt, string columnName, string delimter)
        {
            string list = "";
            foreach (DataRow dr in dt.Rows)
            {
                list = String.Concat(list, "\'", dr[columnName].ToString(), "\'", delimter);
            }

            if (list.EndsWith(delimter))
            {
                int index = list.LastIndexOf(delimter);
                list = list.Remove(index);
            }
            return list;
        }


	}
}
