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
    ///		Summary description for LiverSurgeryDiagnosticsLabTestsPostOp.
	/// </summary>
    public partial class LiverSurgeryDiagnosticsLabTestsPostOp : BaseEFormControl
	{

        private int _pastRecordsCountLabs;
        public int PastRecordsCountLabs
        {
            get { return _pastRecordsCountLabs; }
            set { _pastRecordsCountLabs = value; }
        }

		override protected void Page_Load(object sender, System.EventArgs e)
		{
			base.Page_Load(sender, e);
            base.SetTitle(ComponentTitle);

            // BuildLabTests(this._patientId, this._eformName, "Dynamic");

            GetLabs(this._patientId, this._eformName, "Dynamic");

            //TodaysDate_23.Attributes.Add("onclick", "SetDate(this, '" + LabDateText_23.ClientID + "', '" + System.DateTime.Now.ToShortDateString() + "', '" + LabTest_23.ClientID + "');");
            //TodaysDate_24.Attributes.Add("onclick", "SetDate(this, '" + LabDateText_24.ClientID + "', '" + System.DateTime.Now.ToShortDateString() + "', '" + LabTest_24.ClientID + "');");
            //TodaysDate_25.Attributes.Add("onclick", "SetDate(this, '" + LabDateText_25.ClientID + "', '" + System.DateTime.Now.ToShortDateString() + "', '" + LabTest_25.ClientID + "');");
            //TodaysDate_26.Attributes.Add("onclick", "SetDate(this, '" + LabDateText_26.ClientID + "', '" + System.DateTime.Now.ToShortDateString() + "', '" + LabTest_26.ClientID + "');");
            //TodaysDate_27.Attributes.Add("onclick", "SetDate(this, '" + LabDateText_27.ClientID + "', '" + System.DateTime.Now.ToShortDateString() + "', '" + LabTest_27.ClientID + "');");
		}


        protected void GetLabs(int PatientID, string formName, string formType)
        {
            LabTestDa da = new LabTestDa();
            DataSet labDs = da.FormGetAllLabs(PatientID, formName, formType);

            if (labDs.Tables.Count > 0 && labDs.Tables[0].Rows.Count > 0)
            {
                // limit to last 10 records
                PastRecordsCountLabs = labDs.Tables[0].Rows.Count;
                DataView labsDv = new DataView(labDs.Tables[0]);
                labsDv.Sort = LabTest.LabDate + " DESC ";
                labsDv = GetTopDataViewRows(labsDv, 10);
                labsDv.Sort = LabTest.LabDate + " ASC ";

                LabTestsHx.DataSource = labsDv;
                LabTestsHx.DataBind();
            }
            else
            {
                PastRecordsCountLabs = 0;
            }

        }

        override protected void EFormRepeaterOnDataBound(Object Sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Header)
            {
                if (PastRecordsCountLabs > 10)
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
