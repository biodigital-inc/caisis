namespace Caisis.UI.Modules.Liver.Eforms
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
    ///		Summary description for LiverSurgeryStatusDiagnosis.
	/// </summary>
    public partial class LiverSurgeryStatusDiagnosis : BaseEFormControl
	{
        private int _pastRecordsCountStatus;
        public int PastRecordsCountStatus
        {
            get { return _pastRecordsCountStatus; }
            set { _pastRecordsCountStatus = value; }
        }
        
        override protected void Page_Load(object sender, System.EventArgs e)
		{
			base.Page_Load(sender, e);
            base.SetTitle(ComponentTitle);

            GetDiagnosis(this._patientId, this._eformName, "Dynamic");
        }

        protected void GetDiagnosis(int PatientID, string FormName, string FormType)
        {
            StatusDa statusDa = new StatusDa();
            DataSet statusDs = statusDa.GetStatusField(PatientID, "Diagnosis Date");

            if (statusDs.Tables.Count > 0 && statusDs.Tables[0].Rows.Count > 0)
            {
                // limit to last 10 records
                PastRecordsCountStatus = statusDs.Tables[0].Rows.Count;
                DataView statusDv = new DataView(statusDs.Tables[0]);
                statusDv.Sort = Status.StatusDate + " DESC ";
                statusDv = GetTopDataViewRows(statusDv, 10);
                statusDv.Sort = Status.StatusDate + " ASC ";

                DiagnosisHx.DataSource = statusDv;
                DiagnosisHx.DataBind();
            }
            else
                PastRecordsCountStatus = 0;


        }

        override protected void EFormRepeaterOnDataBound(Object Sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Header)
            {
                if (PastRecordsCountStatus > 10)
                {
                    Literal mostRecentMsg = (Literal)e.Item.FindControl("MostRecentMsg");
                    mostRecentMsg.Visible = true;

                }
            }

            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
            }
        }


        private DataView GetTopDataViewRows(DataView dv, Int32 n)
        {
            DataTable dt = dv.Table.Clone();

            for (int i = 0; i < n; i++)
            {
                if (i >= dv.Count)
                {
                    break;
                }
                dt.ImportRow(dv[i].Row);
            }
            return new DataView(dt, dv.RowFilter, dv.Sort, dv.RowStateFilter);
        }

    }
}
