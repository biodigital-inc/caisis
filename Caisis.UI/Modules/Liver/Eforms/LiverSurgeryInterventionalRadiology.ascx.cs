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

	/// <summary>
    ///		Summary description for LiverSurgeryInterventionalRadiology.
	/// </summary>
    public partial class LiverSurgeryInterventionalRadiology : BaseEFormControl
	{

        private int _pastRecordsCountTace;
        public int PastRecordsCountTace
        {
            get { return _pastRecordsCountTace; }
            set { _pastRecordsCountTace = value; }
        }

        private int _pastRecordsCountPve;
        public int PastRecordsCountPve
        {
            get { return _pastRecordsCountPve; }
            set { _pastRecordsCountPve = value; }
        }

        private int _pastRecordsCountRfa;
        public int PastRecordsCountRfa
        {
            get { return _pastRecordsCountRfa; }
            set { _pastRecordsCountRfa = value; }
        }

		override protected void Page_Load(object sender, System.EventArgs e)
		{
			base.Page_Load(sender, e);
            base.SetTitle(ComponentTitle);
            GetInterventionalRadiology(this._patientId, this._eformName, "Dynamic");
		}

        protected void GetInterventionalRadiology(int PatientID, string FormName, string FormType)
        {
            ProcedureDa procDa = new ProcedureDa();


            DataSet taceDs = procDa.FormGetSpecialRecords(PatientID, FormName, FormType, Procedure.ProcName, " IN ", "'TACE'");

            if (taceDs.Tables.Count > 0 && taceDs.Tables[0].Rows.Count > 0)
            {
                // limit to last 10 records
                PastRecordsCountTace = taceDs.Tables[0].Rows.Count;
                DataView taceDv = new DataView(taceDs.Tables[0]);
                taceDv.Sort = Procedure.ProcDate + " DESC ";
                taceDv = GetTopDataViewRows(taceDv, 10);
                taceDv.Sort = Procedure.ProcDate + " ASC ";

                TaceHx.DataSource = taceDv;
                TaceHx.DataBind();
            }
            else
            {
                PastRecordsCountTace = 0;
            }


            DataSet pveDs = procDa.FormGetSpecialRecords(PatientID, FormName, FormType, Procedure.ProcName, " IN ", "'PVE'");

            if (pveDs.Tables.Count > 0 && pveDs.Tables[0].Rows.Count > 0)
            {
                // limit to last 10 records
                PastRecordsCountPve = pveDs.Tables[0].Rows.Count;
                DataView pveDv = new DataView(pveDs.Tables[0]);
                pveDv.Sort = Procedure.ProcDate + " DESC ";
                pveDv = GetTopDataViewRows(pveDv, 10);
                pveDv.Sort = Procedure.ProcDate + " ASC ";

                PveHx.DataSource = pveDv;
                PveHx.DataBind();
            }
            else
            {
                PastRecordsCountPve = 0;
            }

            DataSet rfaDs = procDa.FormGetSpecialRecords(PatientID, FormName, FormType, Procedure.ProcName, " IN ", "'RFA'");

            if (rfaDs.Tables.Count > 0 && rfaDs.Tables[0].Rows.Count > 0)
            {
                // limit to last 10 records
                PastRecordsCountRfa = rfaDs.Tables[0].Rows.Count;
                DataView rfaDv = new DataView(rfaDs.Tables[0]);
                rfaDv.Sort = Procedure.ProcDate + " DESC ";
                rfaDv = GetTopDataViewRows(rfaDv, 10);
                rfaDv.Sort = Procedure.ProcDate + " ASC ";

                RfaHx.DataSource = rfaDv;
                RfaHx.DataBind();
            }
            else
            {
                PastRecordsCountRfa = 0;
            }

        }

        protected void EFormRepeaterOnDataBoundTace(Object Sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Header)
            {
                if (PastRecordsCountTace > 10)
                {
                    Literal mostRecentMsg = (Literal)e.Item.FindControl("MostRecentMsg");
                    mostRecentMsg.Visible = true;

                }
            }

            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
            }
        }

        protected void EFormRepeaterOnDataBoundPve(Object Sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Header)
            {
                if (PastRecordsCountPve > 10)
                {
                    Literal mostRecentMsg = (Literal)e.Item.FindControl("MostRecentMsg");
                    mostRecentMsg.Visible = true;

                }
            }

            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
            }
        }

        protected void EFormRepeaterOnDataBoundRfa(Object Sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Header)
            {
                if (PastRecordsCountRfa > 10)
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
