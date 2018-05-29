namespace Caisis.UI.Modules.Bone.Eforms
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
    ///		Summary description for DiagnosticsLabTestsOsteo.
	/// </summary>
    public partial class DiagnosticsLabTestsOsteo : BaseEFormControl
	{
		
		override protected void Page_Load(object sender, System.EventArgs e)
		{
			base.Page_Load(sender, e);
            base.SetTitle(ComponentTitle);

            //BuildLabTests(this._patientId, this._eformName, "Dynamic");
			
			DataSet ds = GetLabTestDataSet(this._patientId, this._eformName, "Dynamic");

			if (ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
			{
				BuildOtherLabTests(ds);
			}

            img_fillDates.Attributes.Add("onclick", "fillAllDatesInColumn('" + LabDateText_Global.ClientID + "'); " +
                                         "SetHiddenDate('" + LabTest_1.ClientID + "','" + LabDate_1.ClientID + "','" + LabDateText_Global.ClientID + "'); " +
                                         "SetHiddenDate('" + LabTest_2.ClientID + "','" + LabDate_2.ClientID + "','" + LabDateText_Global.ClientID + "'); " +
                                         "SetHiddenDate('" + LabTest_3.ClientID + "','" + LabDate_3.ClientID + "','" + LabDateText_Global.ClientID + "'); " +
                                         "SetHiddenDate('" + LabTest_4.ClientID + "','" + LabDate_4.ClientID + "','" + LabDateText_Global.ClientID + "'); " +
                                         "SetHiddenDate('" + LabTest_5.ClientID + "','" + LabDate_5.ClientID + "','" + LabDateText_Global.ClientID + "'); " +
                                         "SetHiddenDate('" + LabTest_6.ClientID + "','" + LabDate_6.ClientID + "','" + LabDateText_Global.ClientID + "'); " +
                                         "SetHiddenDate('" + LabTest_7.ClientID + "','" + LabDate_7.ClientID + "','" + LabDateText_Global.ClientID + "'); " +
                                         "SetHiddenDate('" + LabTest_8.ClientID + "','" + LabDate_8.ClientID + "','" + LabDateText_Global.ClientID + "'); " +
                                         "SetHiddenDate('" + LabTest_9.ClientID + "','" + LabDate_9.ClientID + "','" + LabDateText_Global.ClientID + "'); " +
                                         "SetHiddenDate('" + LabTest_10.ClientID + "','" + LabDate_10.ClientID + "','" + LabDateText_Global.ClientID + "'); " +
                                         "SetHiddenDate('" + LabTest_11.ClientID + "','" + LabDate_11.ClientID + "','" + LabDateText_Global.ClientID + "'); " +
                                         "SetHiddenDate('" + LabTest_12.ClientID + "','" + LabDate_12.ClientID + "','" + LabDateText_Global.ClientID + "'); " +
                                         "SetHiddenDate('" + LabTest_13.ClientID + "','" + LabDate_13.ClientID + "','" + LabDateText_Global.ClientID + "'); " +
                                         "SetHiddenDate('" + LabTest_14.ClientID + "','" + LabDate_14.ClientID + "','" + LabDateText_Global.ClientID + "'); " +
                                         "SetHiddenDate('" + LabTest_15.ClientID + "','" + LabDate_15.ClientID + "','" + LabDateText_Global.ClientID + "'); " +
                                         "SetHiddenDate('" + LabTest_16.ClientID + "','" + LabDate_16.ClientID + "','" + LabDateText_Global.ClientID + "'); " +
                                         "SetHiddenDate('" + LabTest_17.ClientID + "','" + LabDate_17.ClientID + "','" + LabDateText_Global.ClientID + "'); " +
                                         "SetHiddenDate('" + LabTest_18.ClientID + "','" + LabDate_18.ClientID + "','" + LabDateText_Global.ClientID + "'); " +
                                         "SetHiddenDate('" + LabTest_19.ClientID + "','" + LabDate_19.ClientID + "','" + LabDateText_Global.ClientID + "'); " +
                                         "SetHiddenDate('" + LabTest_20.ClientID + "','" + LabDate_20.ClientID + "','" + LabDateText_Global.ClientID + "'); " +
                                         "SetHiddenDate('" + LabTest_21.ClientID + "','" + LabDate_21.ClientID + "','" + LabDateText_Global.ClientID + "'); " +
                                         "SetHiddenDate('" + LabTest_22.ClientID + "','" + LabDate_22.ClientID + "','" + LabDateText_Global.ClientID + "'); ");
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

		private DataSet GetLabTestDataSet(int PatientID, string formName, string formType)
		{
			LabTestDa da = new LabTestDa();
            return da.FormGetAllLabs(PatientID, formName, formType);
		}
	}
}
