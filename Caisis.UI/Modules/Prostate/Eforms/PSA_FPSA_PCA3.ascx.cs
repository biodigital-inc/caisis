namespace Caisis.UI.Modules.Prostate.Eforms
{
	using System;
	using System.Data;
	using System.Drawing;
	using System.Web;
	using System.Web.UI.WebControls;
	using System.Web.UI.HtmlControls;

	using Caisis.BOL;
	using Caisis.UI.Core.Classes;
    //2.0 	using Caisis.UI.Modules.Prostate.PaperForms;
	using Caisis.DataAccess;


	/// <summary>
    ///		Summary description for PSA_FPSA_PCA3.
	/// </summary>
    public partial class PSA_FPSA_PCA3 : BaseEFormControl
	{
		
		override protected void Page_Load(object sender, System.EventArgs e)
		{
            base.Page_Load(sender, e);
            base.SetTitle(ComponentTitle);

			// BuildLabTests(this._patientId, this._eformName, "Dynamic");
			
//			DataSet ds = GetLabTestDataSet(this._patientId, this._eformName, "Dynamic");
            DataTable dt = FilteredLabs(this._patientId);

			if (dt.Rows.Count > 0)
			{
                BuildPSAs(dt);
                BuildFPSAs(dt);
				BuildOtherLabTests(dt);
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

        private void BuildOtherLabTests(DataTable dt)
		{
            BuildRepeater(OtherLabTests, dt, "LabTest IN ('PCA3', 'UPCA3', 'UPCA3S')");
		}

        private void BuildFPSAs(DataTable dt)
        {
            BuildRepeater(FPSAs, dt, "LabTest = 'FPSA'");
        }

		private void BuildPSAs(DataTable dt)
		{
			BuildRepeater(PSAs, dt, "LabTest = 'PSA'");
		}

        private void BuildRepeater(Repeater r, DataTable dt, string filter)
		{
			DataView dv = new DataView(dt);
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
			return da.FormGetRecords(PatientID, formName, formType);
        }

        private DataTable FilteredLabs(int PatientID)
        {
            DataTable labs = new DataTable();
            string[] labTestsToGet = new string[] { "PSA", "FPSA", "PCA3", "UPCA3", "UPCA3S" };

            LabTestDa da = new LabTestDa();

            DataSet labTestsDs = da.GetLabTestsbyList(PatientID, labTestsToGet);


            if (labTestsDs.Tables.Count > 0 && labTestsDs.Tables[0].Rows.Count > 0)
            {
                DataTable allLabs = labTestsDs.Tables[0];
                DataTable labsToDisplay = allLabs.Clone();

                // get last 3 PSAs
                DataView PSAs = new DataView(allLabs);
                PSAs.RowFilter = LabTest.LabTest_Field + " = 'PSA'";
                PSAs.Sort = LabTest.LabDate + " DESC";
                int maxPSAs = 3;
                if (PSAs.Count > maxPSAs)
                {
                    for (int i = 0; i < maxPSAs; i++)
                    {
                        labsToDisplay.ImportRow(PSAs[i].Row);
                    }
                }
                else labsToDisplay.Merge(PSAs.ToTable());

                // get last 3 FPSAs
                DataView FPSAs = new DataView(allLabs);
                FPSAs.RowFilter = LabTest.LabTest_Field + " = 'FPSA'";
                FPSAs.Sort = LabTest.LabDate + " DESC";
                int maxFPSAs = 3;
                if (FPSAs.Count > maxFPSAs)
                {
                    for (int i = 0; i < maxFPSAs; i++)
                    {
                        labsToDisplay.ImportRow(FPSAs[i].Row);
                    }
                }
                else labsToDisplay.Merge(FPSAs.ToTable());

                // get all PCA3
                DataView PCA3s = new DataView(allLabs);
                PCA3s.RowFilter = LabTest.LabTest_Field + " IN ('PCA3', 'UPCA3', 'UPCA3S')";
                if (PCA3s.Count > 0) { labsToDisplay.Merge(PCA3s.ToTable()); }


                if (labsToDisplay.Rows.Count > 0)
                {
                    DataView sortedLabView = new DataView(labsToDisplay);
                    sortedLabView.Sort = LabTest.LabDate + " ASC";
                    labs = sortedLabView.ToTable();
                }
            }
            return labs;
        }
	}
}
