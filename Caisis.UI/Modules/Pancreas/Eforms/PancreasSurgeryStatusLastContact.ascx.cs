namespace Caisis.UI.Modules.Pancreas.Eforms
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
    ///		Summary description for PancreasSurgeryStatusLastContact.
	/// </summary>
    public partial class PancreasSurgeryStatusLastContact : BaseEFormControl
	{



        override protected void Page_Load(object sender, System.EventArgs e)
        {
            base.Page_Load(sender, e);
            GetLastContactHx(this._patientId, this._eformName, "Dynamic");
            base.SetTitle(ComponentTitle);
        }

        private void GetLastContactHx(int PatientID, string FormName, string FormType)
        {
            DataView ptStatusTableView = BusinessObject.GetByParentAsDataView<Status>(PatientID);

            // retrieve restaging lookupcode values
            DataTable restagingLkpcodes = CacheManager.GetLookupCodeList(Status_11.LookupCode);
            string restagingStatusList = CreateDelimitedString(restagingLkpcodes, LookupCode.LkpCode, ",");

            // retrieve current patient medications only for specified lookupcode values
            string filterString = String.Concat(Status.Status_Field, " IN (", restagingStatusList, ")");

            DataTable restagingStatusDt = FilterTable(ptStatusTableView.Table, filterString);

            // set medication rows to repeater control
            DataView dv = new DataView(restagingStatusDt);
            dv.Sort = Status.StatusDate + " ASC ";

            if (dv.Count > 0)
            {
                LastContactHx.DataSource = dv;
                LastContactHx.DataBind();
            }
        }

        override protected void EFormRepeaterOnDataBound(Object Sender, RepeaterItemEventArgs e)
        {
            Literal StatusBasedOnHx = (Literal)e.Item.FindControl("StatusBasedOnHx");
            Literal OngoingTreatmentHx = (Literal)e.Item.FindControl("OngoingTreatmentHx");
            Literal UserNotesHx = (Literal)e.Item.FindControl("UserNotesHx");

            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                if (((DataRowView)e.Item.DataItem)[Status.StatusNotes].ToString().Length > 0)
                {
                    string statusNotes = ((DataRowView)e.Item.DataItem)[Status.StatusNotes].ToString();
                    int startIndex;
                    int endIndex;
 
                    if (statusNotes.ToLower().Contains("status based on: "))
                    {
                        startIndex = statusNotes.ToLower().IndexOf("status based on: ") + "status based on: ".Length;
                        endIndex = statusNotes.IndexOf(" |||", startIndex);
                        if (endIndex - startIndex > 0)
                            StatusBasedOnHx.Text = statusNotes.Substring(startIndex, endIndex - startIndex);
                    }
                    else
                        StatusBasedOnHx.Text = String.Empty;

                    if (statusNotes.ToLower().Contains("ongoing treatment: "))
                    {
                        startIndex = statusNotes.ToLower().IndexOf("ongoing treatment: ") + "ongoing treatment: ".Length;
                        endIndex = statusNotes.IndexOf(" |||", startIndex);
                        if (endIndex - startIndex > 0)
                            OngoingTreatmentHx.Text = statusNotes.Substring(startIndex, endIndex - startIndex);
                    }
                    else
                        OngoingTreatmentHx.Text = String.Empty;

                    if (statusNotes.ToLower().Contains("other notes: "))
                    {
                        startIndex = statusNotes.ToLower().IndexOf("other notes: ") + "other notes: ".Length;
                        endIndex = statusNotes.IndexOf(" |||", startIndex);
                        if (endIndex - startIndex > 0)
                            UserNotesHx.Text = statusNotes.Substring(startIndex, endIndex - startIndex);
                    }
                    else
                        UserNotesHx.Text = String.Empty;
                }

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
