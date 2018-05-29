namespace Caisis.UI.Modules.Gynecology.Eforms
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
    ///		Summary description for LabTestsGTD.
	/// </summary>
    public partial class LabTestsGTD : BaseEFormControl
	{
        protected static readonly string[] labTests = new string[] { "BHCG", "HCG" };

		override protected void Page_Load(object sender, System.EventArgs e)
		{
			base.Page_Load(sender, e);
            base.SetTitle(ComponentTitle);

			// BuildLabTests(this._patientId, this._eformName, "Dynamic");
			
			DataSet ds = GetLabTestDataSet(this._patientId);

			if (ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
			{
				BuildOtherLabTests(ds);
			}
		}

		protected void EFormRepeaterOnDataBoundForOther(Object Sender, RepeaterItemEventArgs e)
		{
			HtmlImage LockImage;
			LockImage = (HtmlImage) e.Item.FindControl("OtherLockImage");

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

				//if (!(((DataRowView) e.Item.DataItem)["LockedBy"] != null && ((DataRowView) e.Item.DataItem)["LockedBy"].ToString().Length > 0))
				//{
				//    if (LockImage != null)
				//    {
				//        LockImage.Visible = false;
				//    }
				//}
			}
		}

		private void BuildOtherLabTests(DataSet ds)
		{
			BuildRepeater(OtherLabTests, ds, ""); // != is not valid syntax here
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
			LabTestDa da = new LabTestDa();
            return da.GetLabTestsbyList(PatientID, labTests);
		}
	}
}
