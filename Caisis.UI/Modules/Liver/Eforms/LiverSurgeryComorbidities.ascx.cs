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
    using System.Linq;

	/// <summary>
    ///		Summary description for LiverSurgeryComorbidities.
	/// </summary>
    public partial class LiverSurgeryComorbidities : BaseEFormControl
	{
        private int _pastRecordsCountComorb;
        public int PastRecordsCountComorb
        {
            get { return _pastRecordsCountComorb; }
            set { _pastRecordsCountComorb = value; }
        }

        private int _pastRecordsCountAntiViral;
        public int PastRecordsCountAntiViral
        {
            get { return _pastRecordsCountAntiViral; }
            set { _pastRecordsCountAntiViral = value; }
        }

		override protected void Page_Load(object sender, System.EventArgs e)
		{
			base.Page_Load(sender, e);
            GetComorbidities(this._patientId, this._eformName, "Dynamic");
            GetAntiViralMedTx(this._patientId, this._eformName, "Dynamic");
            base.SetTitle(ComponentTitle);
		}


        protected void GetComorbidities(int PatientID, string FormName, string FormType)
        {

            ComorbidityDa comorbiditiesDa = new ComorbidityDa();
            DataSet comorbiditiesDs = comorbiditiesDa.FormGetRecords(PatientID, FormName, FormType);


            if (comorbiditiesDs.Tables.Count > 0 && comorbiditiesDs.Tables[0].Rows.Count > 0)
            {
                // limit to last 10 records
                PastRecordsCountComorb = comorbiditiesDs.Tables[0].Rows.Count;
                DataView comorbiditiesDv = new DataView(comorbiditiesDs.Tables[0]);
                comorbiditiesDv.Sort = Comorbidity.ComorbDate + " DESC ";
                comorbiditiesDv = GetTopDataViewRows(comorbiditiesDv,10);
                comorbiditiesDv.Sort = Comorbidity.ComorbDate + " ASC, " + Comorbidity.Comorbidity_Field + " ASC ";

                pastComorbidities.DataSource = comorbiditiesDv;
                pastComorbidities.DataBind();
            }
            else
                PastRecordsCountComorb = 0;

        }

        protected void GetAntiViralMedTx(int PatientID, string FormName, string FormType)
        {

            MedicalTherapyDa antiViralMedTxDa = new MedicalTherapyDa();
            DataSet antiViralMedTxDs = antiViralMedTxDa.FormGetSpecialRecords(PatientID, FormName, FormType, MedicalTherapy.MedTxType, "IN", "'Anti-viral History'");  

            if (antiViralMedTxDs.Tables.Count > 0 && antiViralMedTxDs.Tables[0].Rows.Count > 0)
            {
                // limit to last 10 records
                PastRecordsCountAntiViral = antiViralMedTxDs.Tables[0].Rows.Count;
                DataView antiViralMedTxDv = new DataView(antiViralMedTxDs.Tables[0]);
                antiViralMedTxDv.Sort = MedicalTherapy.MedTxDate + " DESC ";
                antiViralMedTxDv = GetTopDataViewRows(antiViralMedTxDv, 10);
                antiViralMedTxDv.Sort = MedicalTherapy.MedTxDate + " ASC, " + MedicalTherapy.MedTxAgent + " ASC ";

                antiViralHistory.DataSource = antiViralMedTxDv;
                antiViralHistory.DataBind();
            }
            else
                PastRecordsCountAntiViral = 0;
        }

        protected override void EFormRepeaterOnDataBound(Object Sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Header)
            {
                if (PastRecordsCountComorb > 10)
                {
                    Literal mostRecentMsg = (Literal)e.Item.FindControl("MostRecentMsg");
                    mostRecentMsg.Visible = true;

                }
            }

            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
            }
        }

        protected void antiViralHistoryEFormRepeaterOnDataBound(Object Sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Header)
            {
                if (PastRecordsCountAntiViral > 10)
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
