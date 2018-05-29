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
    ///		Summary description for LiverSurgeryEncountersAssessment.
	/// </summary>
    public partial class LiverSurgeryEncountersAssessment : BaseEFormControl
	{

        private int _pastRecordsCountEnc;
        public int PastRecordsCountEnc
        {
            get { return _pastRecordsCountEnc; }
            set { _pastRecordsCountEnc = value; }
        }

		override protected void Page_Load(object sender, System.EventArgs e)
		{
			base.Page_Load(sender, e);
            base.SetTitle(ComponentTitle);
            GetEncounters(this._patientId, this._eformName, "Dynamic");

		}

        protected void GetEncounters(int PatientID, string FormName, string FormType)
        {
            EncounterDa encDa = new EncounterDa();
            DataSet encDs = encDa.FormGetRecords(PatientID, FormName, FormType);
            DataView encDv = new DataView(encDs.Tables[0]);
            encDv.RowFilter = "(" + Encounter.EncECOG_Score + " IS NOT NULL OR " + Encounter.EncECOG_Score + " <> '') AND (" + Encounter.EncKPS + " IS NOT NULL OR " + Encounter.EncKPS + " <> '') ";

            if (encDv.Count > 0)
            {
                // limit to last 10 records
                PastRecordsCountEnc = encDv.Count;                
                encDv.Sort = Encounter.EncDate + " DESC ";
                encDv = GetTopDataViewRows(encDv, 10);
                encDv.Sort = Encounter.EncDate + " ASC ";

                EncounterHx.DataSource = encDv;
                EncounterHx.DataBind();
            }
            else
            {
                PastRecordsCountEnc = 0;
            }

        }

        override protected void EFormRepeaterOnDataBound(Object Sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Header)
            {
                if (PastRecordsCountEnc > 10)
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
