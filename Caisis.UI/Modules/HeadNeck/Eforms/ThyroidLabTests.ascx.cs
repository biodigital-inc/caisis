namespace Caisis.UI.Modules.HeadNeck.Eforms
{
    using System;
    using System.Data;
    using System.Data.SqlClient;
    using System.Drawing;
    using System.Web;
    using System.Web.UI.WebControls;
    using System.Web.UI.HtmlControls;

    using Caisis.UI.Core.Classes;
    using Caisis.UI.Core.Classes.CustomControls;
    using Caisis.DataAccess;

    /// <summary>
    ///		Summary description for Thyroid Labtests.
    /// </summary>
    public partial class ThyroidLabTests : BaseEFormControl
    {
        override protected void Page_Load(object sender, EventArgs e)
        {
            base.Page_Load(sender, e);
            base.SetTitle(ComponentTitle);

            DataSet ds = GetLabTestDataSet(this._patientId);

            if (ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
            {
                BuildLabTests(ds);
            }
        }

        protected void EFormRepeaterOnDataBoundForThyroid(Object Sender, RepeaterItemEventArgs e)
        {
            HtmlImage LockImage;
            LockImage = (HtmlImage)e.Item.FindControl("OtherLockImage");

            if (LockImage != null)
            {
                LockImage.Visible = false;
            }

            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                DataRowView drv = e.Item.DataItem as DataRowView;

                if (drv != null && drv.DataView.Table.Columns.Contains("LockedBy"))
                {
                    if (drv["LockedBy"] != null && !string.IsNullOrEmpty(drv["LockedBy"].ToString()))
                    {
                        if (LockImage != null)
                        {
                            LockImage.Visible = true;
                        }
                    }
                }
            }
        }

        private void BuildLabTests(DataSet ds)
        {
            BuildRepeater(ThyroidLabTestsRpt, ds, ""); // != is not valid syntax here
        }

        private void BuildRepeater(Repeater r, DataSet ds, string filter)
        {
            DataView dv = new DataView(ds.Tables[0]);
            dv.RowFilter = filter;

            if (dv.Count > 0)
            {
                r.DataSource = dv;
                r.DataBind();
            }
        }

        private DataSet GetLabTestDataSet(int PatientID)
        {
            string[] labs = new string[] { "TSH", "FREET4", "THYRO", "CA", "CALCIT", "CEA", "RET Oncogene" };

            LabTestDa da = new LabTestDa();
            return da.GetLabTestsbyList(PatientID, labs);
        }
    }
}
