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
    ///		Summary description for LiverSurgeryImaging.
	/// </summary>
    public partial class LiverSurgeryImaging : BaseEFormControl
	{

        private int _pastRecordsCountImaging;
        public int PastRecordsCountImaging
        {
            get { return _pastRecordsCountImaging; }
            set { _pastRecordsCountImaging = value; }
        }

		override protected void Page_Load(object sender, System.EventArgs e)
		{
			base.Page_Load(sender, e);
            BuildImagingHistory(this._patientId, this._eformName, "Dynamic");
            base.SetTitle(ComponentTitle);
		}

        protected void BuildImagingHistory(int PatientID, string FormName, string FormType)
        {
            DataTable dxDt, dxFindingDt;
            DiagnosticDa dxDa = new DiagnosticDa();

            // retrieve lookupcode values for specified dx types
            DataTable dxTypeLkpcodes = CacheManager.GetLookupCodeList(DxType_1.LookupCode);
            string dxTypeList = CreateDelimitedString(dxTypeLkpcodes, LookupCode.LkpCode, ",");

            dxDt = dxDa.GetDiagnosticsByTypeString(PatientID, dxTypeList);            

            if (dxDt.Rows.Count > 0)
            {
                NoImagingHxMsgTr.Visible = false;

                // limit to last 10 records
                PastRecordsCountImaging = dxDt.Rows.Count;
                DataView dxDv = new DataView(dxDt);
                dxDv.Sort = Diagnostic.DxDate + " DESC ";
                dxDv = GetTopDataViewRows(dxDv, 10);
                dxDv.Sort = Diagnostic.DxDate + " ASC ";
                DataTable dxTopTenDt = dxDv.ToTable();

                // get the diagnostic ids of the most recent 10 to find their corressponding findings
                string diagnosticIds = String.Empty;
                foreach (DataRow dr in dxTopTenDt.Rows)
                    diagnosticIds = String.Concat(diagnosticIds,dr[Diagnostic.DiagnosticId].ToString(),",");
                diagnosticIds = diagnosticIds.Trim(',');

                dxFindingDt = dxDa.GetDxImagesByDiagnosticIds(PatientID, diagnosticIds);

                dxTopTenDt.TableName = "Imaging";
                dxFindingDt.TableName = "ImagingFindings";

                DataSet dxWithDxFindingsDs = new DataSet();
                dxWithDxFindingsDs.Tables.Add(dxTopTenDt.Copy());
                dxWithDxFindingsDs.Tables.Add(dxFindingDt.Copy());

                dxWithDxFindingsDs.Relations.Add("myrelation", dxWithDxFindingsDs.Tables["Imaging"].Columns[Diagnostic.DiagnosticId], dxWithDxFindingsDs.Tables["ImagingFindings"].Columns[Diagnostic.DiagnosticId]);

                ImagingHx.DataSource = dxWithDxFindingsDs.Tables["Imaging"].DefaultView;
                ImagingHx.DataBind();
            }

        }

        override protected void EFormRepeaterOnDataBound(Object Sender, RepeaterItemEventArgs e)
        {

            base.EFormRepeaterOnDataBound(Sender, e);

            if (e.Item.ItemType == ListItemType.Header)
            {
                if (PastRecordsCountImaging > 10)
                {
                    Literal mostRecentMsg = (Literal)e.Item.FindControl("MostRecentMsg");
                    mostRecentMsg.Visible = true;

                }
            }


            DataRowView dv = e.Item.DataItem as DataRowView;
            if (dv != null)
            {
                Repeater nestedRepeater = e.Item.FindControl("ImagingFindingHx") as Repeater;
                if (nestedRepeater != null)
                {
                    nestedRepeater.DataSource = dv.CreateChildView("myrelation");
                    nestedRepeater.DataBind();
                }

            }
        }

        protected void dxFindingsEFormRepeaterOnDataBound(Object Sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                if (((DataRowView)e.Item.DataItem)[ImageFinding.ImgFindResult].ToString().Length > 0 ||
                     ((DataRowView)e.Item.DataItem)[ImageFinding.ImgFindSubsite].ToString().Length > 0 ||
                     ((DataRowView)e.Item.DataItem)[ImageFinding.ImgFindWidth].ToString().Length > 0
                    )
                {

                }


            }

            if (e.Item.ItemType == ListItemType.Footer)
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
