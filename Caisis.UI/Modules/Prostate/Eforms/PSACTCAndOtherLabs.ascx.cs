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
	using Caisis.DataAccess;


	/// <summary>
    ///		Summary description for PSACTCAndOtherLabs.
	/// </summary>
    public partial class PSACTCAndOtherLabs : BaseEFormControl
	{
		
		override protected void Page_Load(object sender, System.EventArgs e)
		{
			base.Page_Load(sender, e);

			// BuildLabTests(this._patientId, this._eformName, "Dynamic");

            DataSet ds = GetLabTestDataSet(this._patientId, "GUProsFU", "Dynamic");

            BuildFishboneView(ds);
            BuildTrendView(ds);

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
			}
		}

		private void BuildOtherLabTests(DataSet ds)
		{
            BuildRepeater(OtherLabTests, ds, "LabTest <> 'PSA' AND LabTest <> 'CTC'"); // != is not valid syntax here
		}

		private void BuildPSAs(DataSet ds)
		{
            BuildRepeater(PSAs, ds, "LabTest = 'PSA' OR LabTest = 'CTC'");
		}

        private void BuildFishboneView(DataSet ds)
        {
            DataView dv = new DataView(ds.Tables[0]);
            dv.RowFilter = "LabTest IN ('WBC', 'HGB', 'HCT', 'UNVPLT', 'NA', 'K', 'CL', 'CO2', 'BUN', 'CREAT', 'GLU')";
            dv.Sort = BOL.LabTest.LabDate + " ASC";

            if (dv.Count > 0)
            {
                DataTable dt = dv.ToTable();
                //DataTable fbt = Pivot(dt, BOL.LabTest.LabDateText, BOL.LabTest.LabTest_Field, BOL.LabTest.LabResult);

                DataTable CBCTable = this.CBCTable();


                foreach (DataRowView fRow in dv)
                {
                    CBCTable = AddValueToCBCTable(CBCTable, fRow);
                }


                FishboneDateSelector.DataSource = CBCTable;
                FishboneDateSelector.DataTextField = BOL.LabTest.LabDateText;
                FishboneDateSelector.DataValueField = BOL.LabTest.LabDateText;
                FishboneDateSelector.Attributes.Add("onchange", "setFishboneDate(this);");
                FishboneDateSelector.DataBind();




                fishboneRpt.DataSource = CBCTable;
                fishboneRpt.DataBind();


            }
            else
            {
                labFishbonesContainer.Visible = false;
                labFishbonesMessage.Visible = true;
            }
        }



        protected DataTable AddValueToCBCTable(DataTable CBCTable, DataRowView fRow)
        {

            if (CBCTable.Rows.Count > 0)
            {
                bool dateExists = false;
                foreach (DataRow cRow in CBCTable.Rows)
                {
                    if (cRow[BOL.LabTest.LabDateText].ToString() == fRow[BOL.LabTest.LabDateText].ToString())
                    {
                        if (fRow[BOL.LabTest.LabTest_Field].ToString().Length > 0)
                        {
                            cRow[fRow[BOL.LabTest.LabTest_Field].ToString()] = fRow[BOL.LabTest.LabResult]; 
                        }

                        dateExists = true;
                        break;
                    }
                }

                if (!dateExists)
                {
                    DataRow dr = CBCTable.NewRow();
                    dr[fRow[BOL.LabTest.LabTest_Field].ToString()] = fRow[BOL.LabTest.LabResult];
                    dr[BOL.LabTest.LabDateText] = fRow[BOL.LabTest.LabDateText];
                    dr[BOL.LabTest.LabDate] = fRow[BOL.LabTest.LabDate];
                    CBCTable.Rows.Add(dr);
                }

            }
            else
            {
                DataRow dr = CBCTable.NewRow();
                dr[fRow[BOL.LabTest.LabTest_Field].ToString()] = fRow[BOL.LabTest.LabResult];
                dr[BOL.LabTest.LabDateText] = fRow[BOL.LabTest.LabDateText];
                dr[BOL.LabTest.LabDate] = fRow[BOL.LabTest.LabDate];
                CBCTable.Rows.Add(dr);
            }

            return CBCTable;

        }



        private void BuildTrendView(DataSet ds)
        {

            DataView dv = ds.Tables[0].DefaultView;
            DataTable trendViewRowNames = dv.ToTable(true, BOL.LabTest.LabTest_Field);
            DataTable trendViewColumnNames = dv.ToTable(true, BOL.LabTest.LabDateText);

            
            DataTable TrendViewTable = new DataTable();

            //DataColumn DateTextCol = new DataColumn();
            //DateTextCol.ColumnName = BOL.LabTest.LabDateText;
            //TrendViewTable.Columns.Add(DateTextCol);

            //DataColumn DateCol = new DataColumn();
            //DateCol.ColumnName = BOL.LabTest.LabDate;
            //DateCol.DataType = System.Type.GetType("System.DateTime");
            //TrendViewTable.Columns.Add(DateCol);



            DataColumn LabTestCol = new DataColumn();
            LabTestCol.ColumnName = "Test";
            TrendViewTable.Columns.Add(LabTestCol);


            DataColumn[] pk = new DataColumn[1];
            pk[0] = LabTestCol;
            TrendViewTable.PrimaryKey = pk;


            // create columns for TrendView
            foreach (DataRow row in trendViewColumnNames.Rows)
            {
                string d = row[BOL.LabTest.LabDateText].ToString();

                if (d.Length > 0)
                {
                    DataColumn TrendViewCol = new DataColumn();
                    TrendViewCol.ColumnName = row[BOL.LabTest.LabDateText].ToString();
                    TrendViewTable.Columns.Add(TrendViewCol);
                }
            }


            foreach (DataRow row in trendViewRowNames.Rows)
            {
                DataRow ndr = TrendViewTable.NewRow();
                ndr["Test"] = row[BOL.LabTest.LabTest_Field].ToString();
                TrendViewTable.Rows.Add(ndr);
            }


             //add rows to TrendView
            foreach (DataRow dr in ds.Tables[0].Rows)
            {
                TrendViewTable = AddValueToTrendViewTable(TrendViewTable, dr);
            }

            if (TrendViewTable.Rows.Count > 0)
            {
                TrendViewGridView.DataSource = TrendViewTable.DefaultView;
                TrendViewGridView.DataBind();
            }
            else
            {
                TrendViewNoRecordsMsg.Visible = true;
                LabChartFrame.Visible = false;
            }


        }



        protected DataTable AddValueToTrendViewTable(DataTable TrendViewTable, DataRow dr)
        {

            string labTest = dr[BOL.LabTest.LabTest_Field].ToString();
            string labDateText = dr[BOL.LabTest.LabDateText].ToString();
            string labTestResult = dr[BOL.LabTest.LabResult].ToString();

            if (labTest.Length > 0 && labDateText.Length > 0 && labTestResult.Length > 0)
            {
                DataRow labTestRow = TrendViewTable.Rows.Find(labTest);
                labTestRow[labDateText] = labTestResult;
            }

            return TrendViewTable;

        }



		private void BuildRepeater(Repeater r, DataSet ds, string filter)
		{
			DataView dv = new DataView(ds.Tables[0]);
			dv.RowFilter = filter;
            dv.Sort = BOL.LabTest.LabDate + " ASC";

			if (dv.Count > 0)
			{
				r.DataSource = dv;
				r.DataBind();
			}
		}

		private DataSet GetLabTestDataSet(int PatientID, string formName, string formType)
		{
			LabTestDa da = new LabTestDa();
//			return da.FormGetRecords(PatientID, formName, formType);

            return da.FormGetAllLabs(PatientID, formName, formType);
            
		}

        protected DataTable CBCTable()
        {
            DataTable CBCTable = new DataTable();

            DataColumn DateTextCol = new DataColumn();
            DateTextCol.ColumnName = "LabDateText";
            CBCTable.Columns.Add(DateTextCol);

            DataColumn DateCol = new DataColumn();
            DateCol.ColumnName = "LabDate";
            DateCol.DataType = System.Type.GetType("System.DateTime");
            CBCTable.Columns.Add(DateCol);

            DataColumn WBC = new DataColumn();
            WBC.ColumnName = "WBC";
            CBCTable.Columns.Add(WBC);

            DataColumn HGB = new DataColumn();
            HGB.ColumnName = "HGB";
            CBCTable.Columns.Add(HGB);

            DataColumn HCT = new DataColumn();
            HCT.ColumnName = "HCT";
            CBCTable.Columns.Add(HCT);

            DataColumn PLT = new DataColumn();
            PLT.ColumnName = "UNVPLT";
            CBCTable.Columns.Add(PLT);

            DataColumn NA = new DataColumn();
            NA.ColumnName = "NA";
            CBCTable.Columns.Add(NA);

            DataColumn K = new DataColumn();
            K.ColumnName = "K";
            CBCTable.Columns.Add(K);

            DataColumn CL = new DataColumn();
            CL.ColumnName = "CL";
            CBCTable.Columns.Add(CL);

            DataColumn HCO3 = new DataColumn();
            HCO3.ColumnName = "CO2";
            CBCTable.Columns.Add(HCO3);

            DataColumn BUN = new DataColumn();
            BUN.ColumnName = "BUN";
            CBCTable.Columns.Add(BUN);

            DataColumn CR = new DataColumn();
            CR.ColumnName = "CREAT";
            CBCTable.Columns.Add(CR);

            DataColumn GLU = new DataColumn();
            GLU.ColumnName = "GLU";
            CBCTable.Columns.Add(GLU);

            return CBCTable;
        }








        public static DataTable Pivot(DataTable dataValues, string keyColumn, string pivotNameColumn, string pivotValueColumn)
        {
            try
            {
                DataTable tmp = new DataTable();
                DataRow r;
                string LastKey = "//dummy//";
                int i, pValIndex, pNameIndex;
                string s;
                bool FirstRow = true;

                // Add non-pivot columns to the data table:
                pValIndex = dataValues.Columns.IndexOf(pivotValueColumn);
                pNameIndex = dataValues.Columns.IndexOf(pivotNameColumn);

                for (i = 0; i <= dataValues.Columns.Count - 1; i++)
                    if (i != pValIndex && i != pNameIndex)
                    {
                        tmp.Columns.Add(dataValues.Columns[i].ColumnName.ToString(), dataValues.Columns[i].DataType);
                    }
                r = tmp.NewRow();

                // now, fill up the table with the data:
                foreach (DataRow row in dataValues.Rows)
                {
                    // see if we need to start a new row
                    if (row[keyColumn].ToString() != LastKey)
                    {
                        // if this isn't the very first row, we need to add the last one to the table
                        if (!FirstRow)
                        {
                            tmp.Rows.Add(r);
                        }
                        r = tmp.NewRow();
                        FirstRow = false;

                        // Add all non-pivot column values to the new row:
                        for (i = 0; i <= dataValues.Columns.Count - 3; i++)
                        {
                            r[i] = row[tmp.Columns[i].ColumnName];
                        }
                        LastKey = row[keyColumn].ToString();
                    }

                    // assign the pivot values to the proper column; add new columns if needed:
                    s = row[pNameIndex].ToString();
                    if (s.Length > 0)
                    {
                        if (!tmp.Columns.Contains(s) && s != null)
                        {
                            tmp.Columns.Add(s, dataValues.Columns[pValIndex].DataType);
                        }
                        r[s] = row[pValIndex];
                    }
                }
                // add that final row to the datatable:
                tmp.Rows.Add(r);

                // and that's it!
                return tmp;
            }
            catch (Exception ex)
            {
                return null;
            }
        }



	}
}
