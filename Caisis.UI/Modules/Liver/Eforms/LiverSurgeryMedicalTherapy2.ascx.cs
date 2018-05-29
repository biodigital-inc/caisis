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
    ///		Summary description for LiverSurgeryMedicalTherapy2.
	/// </summary>
    public partial class LiverSurgeryMedicalTherapy2 : BaseEFormControl
	{

        private int _pastRecordsCountMedTx;
        public int PastRecordsCountMedTx
        {
            get { return _pastRecordsCountMedTx; }
            set { _pastRecordsCountMedTx = value; }
        }
        
        override protected void Page_Load(object sender, System.EventArgs e)
		{
			base.Page_Load(sender, e);
            base.SetTitle(ComponentTitle);
            GetMedTx(this._patientId, this._eformName, "Dynamic");

		}

        protected void GetMedTx(int PatientID, string FormName, string FormType)
        {
            MedicalTherapyDa medTxDa = new MedicalTherapyDa();
            DataSet medTxDs = medTxDa.FormGetSpecialRecords(PatientID, FormName, FormType, MedicalTherapy.MedTxType, " NOT IN ", "'Anti-viral History'");  

            if (medTxDs.Tables.Count > 0 && medTxDs.Tables[0].Rows.Count > 0)
            {
                // limit to last 10 records
                PastRecordsCountMedTx = medTxDs.Tables[0].Rows.Count;
                DataView medTxDv = new DataView(medTxDs.Tables[0]);
                medTxDv.Sort = MedicalTherapy.MedTxDate + " DESC ";
                medTxDv = GetTopDataViewRows(medTxDv, 10);
                medTxDv.Sort = MedicalTherapy.MedTxDate + " ASC ";

                MedicalTherapies.DataSource = medTxDv;
                MedicalTherapies.DataBind();
            }
            else
            {
                PastRecordsCountMedTx = 0;
            }

        }

        override protected void EFormRepeaterOnDataBound(Object Sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Header)
            {
                if (PastRecordsCountMedTx > 10)
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
