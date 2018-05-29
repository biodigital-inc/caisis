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
    ///		Summary description for LiverSurgeryProceduresBiopsy.
	/// </summary>
    public partial class LiverSurgeryProceduresBiopsy : BaseEFormControl
    {

        private int _pastRecordsCountProcedure;
        public int PastRecordsCountProcedure
        {
            get { return _pastRecordsCountProcedure; }
            set { _pastRecordsCountProcedure = value; }
        }
        
        protected override void Page_Load(object sender, EventArgs e)
        {
            base.Page_Load(sender, e);
            base.SetTitle(ComponentTitle);
            GetBiopsies(this._patientId, this._eformName, "Dynamic");

        }

        protected void GetBiopsies(int PatientID, string FormName, string FormType)
        {
            ProcedureDa procDa = new ProcedureDa();
            DataSet procDs = procDa.FormGetSpecialRecords(PatientID, FormName, FormType, Procedure.ProcName," IN ", "'Biopsy'");

            if (procDs.Tables.Count > 0 && procDs.Tables[0].Rows.Count > 0)
            {
                // limit to last 10 records
                PastRecordsCountProcedure = procDs.Tables[0].Rows.Count;
                DataView procDv = new DataView(procDs.Tables[0]);
                procDv.Sort = Procedure.ProcDate + " DESC ";
                procDv = GetTopDataViewRows(procDv, 10);
                procDv.Sort = Procedure.ProcDate + " ASC ";

                BiopsyHx.DataSource = procDv;
                BiopsyHx.DataBind();
            }
            else
            {
                PastRecordsCountProcedure = 0;
            }

        }

        override protected void EFormRepeaterOnDataBound(Object Sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Header)
            {
                if (PastRecordsCountProcedure > 10)
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