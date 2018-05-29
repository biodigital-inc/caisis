namespace Caisis.UI.Modules.All.Eforms
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
    ///		Summary description for LiverSurgeryRadiationTherapy2.
	/// </summary>
    public partial class LiverSurgeryRadiationTherapy2 : BaseEFormControl
	{

        private int _pastRecordsCountRadTx;
        public int PastRecordsCountRadTx
        {
            get { return _pastRecordsCountRadTx; }
            set { _pastRecordsCountRadTx = value; }
        }

		override protected void Page_Load(object sender, System.EventArgs e)
		{
			base.Page_Load(sender, e);
			base.BuildXRT(this._patientId, this._eformName, "Dynamic");
            base.SetTitle(ComponentTitle);
            GetRadTx(this._patientId, this._eformName, "Dynamic");

		}

        protected void GetRadTx(int PatientID, string FormName, string FormType)
        {
            RadiationTherapyDa radTxDa = new RadiationTherapyDa();
            DataSet radTxDs = radTxDa.FormGetRecords(PatientID, FormName, FormType);

            if (radTxDs.Tables.Count > 0 && radTxDs.Tables[0].Rows.Count > 0)
            {
                // limit to last 10 records
                PastRecordsCountRadTx = radTxDs.Tables[0].Rows.Count;
                DataView radTxDv = new DataView(radTxDs.Tables[0]);
                radTxDv.Sort = RadiationTherapy.RadTxDate + " DESC ";
                radTxDv = GetTopDataViewRows(radTxDv, 10);
                radTxDv.Sort = RadiationTherapy.RadTxDate + " ASC ";

                XRT.DataSource = radTxDv;
                XRT.DataBind();
            }
            else
            {
                PastRecordsCountRadTx = 0;
            }

        }

        override protected void EFormRepeaterOnDataBound(Object Sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Header)
            {
                if (PastRecordsCountRadTx > 10)
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
