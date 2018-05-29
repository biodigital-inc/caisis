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
    ///		Summary description for LabTests_ActiveSurveillance.
	/// </summary>
    public partial class LabTests_ActiveSurveillance : BaseEFormControl
	{
		
		override protected void Page_Load(object sender, System.EventArgs e)
		{
            base.Page_Load(sender, e);
            base.SetTitle(ComponentTitle);
            BuildLabTests();
		}





        protected void BuildLabTests()
        {
            string[] labTestsToGet = new string[] { "PSA", "Prolaris Score", "Prolaris AUA", "Oncotype GPS", "Oncotype Path", "PCA3", "UPCA3", "UPCA3S", "PHI", "4K" };

            //Lab Tests

            LabTestDa da = new LabTestDa();

            DataSet labTestsDs = da.GetLabTestsbyList(this._patientId, labTestsToGet);


            DataTable allLabs = labTestsDs.Tables[0];
            DataTable labsToDisplay = ASLabsTable(labTestsToGet, allLabs);


            DataView sortedLabView = new DataView(labsToDisplay);
            sortedLabView.Sort = LabTest.LabDate + " ASC";
            DataTable sortedLabs = sortedLabView.ToTable();

            labTests.DataSource = sortedLabs.DefaultView;

            labTests.DataBind();

        }



        protected DataTable ASLabsTable(string[] labTestsToGet, DataTable allLabs)
        {

            // data table structure
            DataTable labsTable = new DataTable();

            DataColumn DateTextCol = new DataColumn();
            DateTextCol.ColumnName = "LabDateText";
            labsTable.Columns.Add(DateTextCol);

            DataColumn DateCol = new DataColumn();
            DateCol.ColumnName = "LabDate";
            DateCol.DataType = System.Type.GetType("System.DateTime");
            labsTable.Columns.Add(DateCol);

            DataColumn PSADT = new DataColumn();
            PSADT.ColumnName = "PSADT";
            labsTable.Columns.Add(PSADT);


            foreach (string lab in labTestsToGet)
            {
                DataColumn col = new DataColumn();
                col.ColumnName = lab;
                labsTable.Columns.Add(col);

                DataColumn IDCol = new DataColumn();
                IDCol.ColumnName = (lab + "Id");
                IDCol.DataType = System.Type.GetType("System.Int32");
                labsTable.Columns.Add(IDCol);
            }


            // table rows

            if (allLabs != null)
            {
                foreach (DataRow row in allLabs.Rows)
                {
                    string LabDateText = row[BOL.LabTest.LabDateText].ToString();
                    DateTime LabDate = new DateTime();
                    if (row[BOL.LabTest.LabDate].ToString().Length > 0) LabDate = (DateTime)row[BOL.LabTest.LabDate];
                    string LabType = row[BOL.LabTest.LabTest_Field].ToString();
                    string LabResult = row[BOL.LabTest.LabResult].ToString();
                    string LabNotes = row[BOL.LabTest.LabNotes].ToString();
                    int LabTestId = (int)row[BOL.LabTest.LabTestId];

                    DataRow[] currentDateRow = labsTable.Select("LabDateText = '" + LabDateText + "'");
                    if (currentDateRow.Length > 0)
                    {
                        currentDateRow[0][LabType] = LabResult;
                        currentDateRow[0][LabType + "Id"] = LabTestId;

                        // special cases
                        if (LabType.ToUpper().Equals("PROLARIS SCORE")) currentDateRow[0]["Prolaris AUA"] = LabNotes;
                        if (LabType.ToUpper().Equals("ONCOTYPE GPS")) currentDateRow[0]["Oncotype Path"] = LabNotes;

                    }
                    else
                    {
                        DataRow dr = labsTable.NewRow();
                        dr["LabDateText"] = LabDateText;
                        dr["LabDate"] = LabDate;
                        dr[LabType] = LabResult;
                        dr[LabType + "Id"] = LabTestId;

                        // special cases
                        if (LabType.ToUpper().Equals("PROLARIS SCORE")) dr["Prolaris AUA"] = LabNotes;
                        if (LabType.ToUpper().Equals("ONCOTYPE GPS")) dr["Oncotype Path"] = LabNotes;

                        labsTable.Rows.Add(dr);
                    }


                }


                if (labsTable.Rows.Count > 0)
                {
                    DataView sortedLabView = new DataView(labsTable);
                    sortedLabView.Sort = LabTest.LabDate + " ASC";
                    labsTable = sortedLabView.ToTable();



                    // get prostate volumes to calculate PSADensity in lab tests
                    DataTable ProstateVolumes = ProstateVolumesByDescendingDate();
                    if (ProstateVolumes.Rows.Count > 0)
                    {
                        foreach (DataRow labRow in labsTable.Rows)
                        {
                            double psa = 0;
                            if (labRow["LabDate"].ToString().Length > 0 && labRow["PSA"].ToString().Length > 0 && double.TryParse(labRow["PSA"].ToString(), out psa))
                            {

                                DataView v = new DataView(ProstateVolumes);
                                v.RowFilter = Diagnostic.DxDate + " <= #" + ((DateTime)labRow["LabDate"]).ToShortDateString() + "#";

                                if (v.Count > 0)
                                {
                                    double mostRecentVolumeMeasurement = 0;

                                    if (double.TryParse(v[0][ImageProstate.ImgProstateVolume].ToString(), out mostRecentVolumeMeasurement))
                                    {
                                        double psadt = Math.Round((psa / mostRecentVolumeMeasurement), 4);
                                        labRow["PSADT"] = psadt;
                                    }
                                }

                            }
                        }
                    }


                }

            }
            return labsTable;
        }





        protected DataTable ProstateVolumesByDescendingDate()
        {

            DataTable volumes = new DataTable();


            // add PSA Density
            DiagnosticDa d = new DiagnosticDa();
            DataTable ProstateImages = d.GetProstateImageFindings(this._patientId);
            DataView ProstateImagesWithLWH = new DataView(ProstateImages);

            string prostateImgFilter = Diagnostic.DxDate + " IS NOT NULL";
            prostateImgFilter += " and Len(" + ImageProstate.ImgProstateHeight + ") > 0";
            prostateImgFilter += " and Len(" + ImageProstate.ImgProstateLength + ") > 0";
            prostateImgFilter += " and Len(" + ImageProstate.ImgProstateWidth + ") > 0";

            ProstateImagesWithLWH.RowFilter = prostateImgFilter;
            if (ProstateImagesWithLWH.Count > 0)
            {
                DataTable ProstateDimensions = ProstateImagesWithLWH.ToTable(false, Diagnostic.DxDateText, Diagnostic.DxDate, ImageProstate.ImgProstateHeight, ImageProstate.ImgProstateLength, ImageProstate.ImgProstateWidth, ImageProstate.ImgProstateVolume);

                foreach (DataRow ProstateMeasurement in ProstateDimensions.Rows)
                {
                    double ImgProstateHeight = 0;
                    double ImgProstateLength = 0;
                    double ImgProstateWidth = 0;

                    if (double.TryParse(ProstateMeasurement[ImageProstate.ImgProstateHeight].ToString(), out ImgProstateHeight)
                        && double.TryParse(ProstateMeasurement[ImageProstate.ImgProstateLength].ToString(), out ImgProstateLength)
                        && double.TryParse(ProstateMeasurement[ImageProstate.ImgProstateWidth].ToString(), out ImgProstateWidth))
                    {
                        double vol = (ImgProstateHeight * ImgProstateLength * ImgProstateWidth * 0.52);
                        ProstateMeasurement[ImageProstate.ImgProstateVolume] = vol;
                    }
                    else ProstateMeasurement[ImageProstate.ImgProstateVolume] = null;

                }

                DataView vols = new DataView(ProstateDimensions);
                vols.RowFilter = ImageProstate.ImgProstateVolume + " IS NOT NULL";
                vols.Sort = Diagnostic.DxDate + " DESC";

                if (vols.Count > 0) volumes = vols.ToTable();

            }

            return volumes;

        }


	}
}
