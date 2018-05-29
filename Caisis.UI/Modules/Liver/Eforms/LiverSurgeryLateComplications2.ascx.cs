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
    //2.0 using Caisis.UI.Modules.Prostate.PaperForms;
	using Caisis.DataAccess;

	/// <summary>
    ///		Summary description for LiverSurgeryLateComplications2.
	/// </summary>
    public partial class LiverSurgeryLateComplications2 : BaseEFormControl
	{
        private int _pastRecordsCountComplication;
        public int PastRecordsCountComplication
        {
            get { return _pastRecordsCountComplication; }
            set { _pastRecordsCountComplication = value; }
        }
        
        override protected void Page_Load(object sender, System.EventArgs e)
		{
			base.Page_Load(sender, e);
            base.SetTitle(ComponentTitle);
            GetComplications(this._patientId, this._eformName, "Dynamic");
			
		}

        protected void GetComplications(int PatientID, string FormName, string FormType)
        {
            ToxicityDa toxDa = new ToxicityDa();
            DataSet toxDs = toxDa.FormListToxicities(PatientID, FormName, FormType, "");

            if (toxDs.Tables.Count > 0 && toxDs.Tables[0].Rows.Count > 0)
            {
                // limit to last 10 records
                PastRecordsCountComplication = toxDs.Tables[0].Rows.Count;
                DataView toxDv = new DataView(toxDs.Tables[0]);
                toxDv.Sort = Toxicity.ToxDate + " DESC ";
                toxDv = GetTopDataViewRows(toxDv, 10);
                toxDv.Sort = Toxicity.ToxDate + " ASC ";

                ComplicationsHx.DataSource = toxDv;
                ComplicationsHx.DataBind();
            }
            else
            {
                PastRecordsCountComplication = 0;
            }

        }

        override protected void EFormRepeaterOnDataBound(Object Sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Header)
            {
                if (PastRecordsCountComplication > 10)
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
