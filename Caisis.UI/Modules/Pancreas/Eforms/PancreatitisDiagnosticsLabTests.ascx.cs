namespace Caisis.UI.Modules.Pancreas.Eforms
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
    ///		Summary description for PancreatitisDiagnosticsLabTests.
	/// </summary>
    public partial class PancreatitisDiagnosticsLabTests : BaseEFormControl
	{
		
		override protected void Page_Load(object sender, System.EventArgs e)
		{
			base.Page_Load(sender, e);
            base.SetTitle(ComponentTitle);

			// BuildLabTests(this._patientId, this._eformName, "Dynamic");
			
			DataSet ds = GetLabTestDataSet(this._patientId, this._eformName, "Dynamic");

			if (ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
			{
				BuildOtherLabTests(ds);
			}

            // retrieve current culture
            System.Globalization.CultureInfo currentCulture = System.Globalization.CultureInfo.CurrentCulture;

            // if culture is set to "en-US", use 12 hr time, else, use 24hr time
            if (currentCulture.Name.Contains("en-US"))
                CultureIsUS.Text = "true";
            else
                CultureIsUS.Text = "false";

            PopulateTimeInterface(Hour_21, Minute_21, AmPm_21);
            PopulateTimeInterface(Hour_22, Minute_22, AmPm_22);
            PopulateTimeInterface(Hour_23, Minute_23, AmPm_23);
            PopulateTimeInterface(Hour_24, Minute_24, AmPm_24);
            PopulateTimeInterface(Hour_25, Minute_25, AmPm_25);
            PopulateTimeInterface(Hour_26, Minute_26, AmPm_26);
            PopulateTimeInterface(Hour_27, Minute_27, AmPm_27);
            PopulateTimeInterface(Hour_28, Minute_28, AmPm_28);
            PopulateTimeInterface(Hour_29, Minute_29, AmPm_29);
            PopulateTimeInterface(Hour_30, Minute_30, AmPm_30);
            PopulateTimeInterface(Hour_31, Minute_31, AmPm_31);
            PopulateTimeInterface(Hour_32, Minute_32, AmPm_32);
            PopulateTimeInterface(Hour_33, Minute_33, AmPm_33);
            PopulateTimeInterface(Hour_34, Minute_34, AmPm_34);
            PopulateTimeInterface(Hour_35, Minute_35, AmPm_35);
            PopulateTimeInterface(Hour_36, Minute_36, AmPm_36);
            PopulateTimeInterface(Hour_37, Minute_37, AmPm_37);
            PopulateTimeInterface(Hour_38, Minute_38, AmPm_38);
            PopulateTimeInterface(Hour_39, Minute_39, AmPm_39);
            PopulateTimeInterface(Hour_40, Minute_40, AmPm_40);
            PopulateTimeInterface(Hour_41, Minute_41, AmPm_41);
            PopulateTimeInterface(Hour_42, Minute_42, AmPm_42);
            PopulateTimeInterface(Hour_43, Minute_43, AmPm_43);
            PopulateTimeInterface(Hour_44, Minute_44, AmPm_44);
            PopulateTimeInterface(Hour_45, Minute_45, AmPm_45);
            PopulateTimeInterface(Hour_46, Minute_46, AmPm_46);
            PopulateTimeInterface(Hour_47, Minute_47, AmPm_47);
            PopulateTimeInterface(Hour_48, Minute_48, AmPm_48);
            PopulateTimeInterface(Hour_49, Minute_49, AmPm_49);
            PopulateTimeInterface(Hour_50, Minute_50, AmPm_50);
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

        private void PopulateTimeInterface(CaisisSelect HourSelect, CaisisSelect MinuteSelect, CaisisSelect AmPmSelect)
        {
            // if culture is set to "en-US", use 12 hr time, else, use 24hr time
            if (CultureIsUS.Text == "true")
            {

                for (int i = 1; i <= 12; i++)
                {
                    ListItem li1 = new ListItem(i.ToString("00"), i.ToString("00"));
                    HourSelect.Items.Add(li1);
                }
            }
            else
            {
                for (int i = 1; i <= 24; i++)
                {
                    ListItem li1 = new ListItem(i.ToString("00"), i.ToString("00"));
                    HourSelect.Items.Add(li1);
                }
            }

            for (int i = 0; i <= 59; i++)
            {
                ListItem li2 = new ListItem(i.ToString("00"), i.ToString("00"));
                MinuteSelect.Items.Add(li2);
            }

            ListItem li3 = new ListItem("am", "am");
            AmPmSelect.Items.Add(li3);
            li3 = new ListItem("pm", "pm");
            AmPmSelect.Items.Add(li3);
        }


	}
}
