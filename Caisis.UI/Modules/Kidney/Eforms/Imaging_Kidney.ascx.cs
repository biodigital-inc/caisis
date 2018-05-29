namespace Caisis.UI.Modules.Kidney.Eforms
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
	///		Summary description for MedicationsClinical.
	/// </summary>
    public partial class Imaging_Kidney : BaseEFormControl
	{


		override protected void Page_Load(object sender, System.EventArgs e)
		{
            base.Page_Load(sender, e);
            this.BuildImagesWithKidneyFindings(7, 1);
            base.SetTitle(ComponentTitle);
		}



        protected virtual void BuildImagesWithKidneyFindings(int MinNumImageRowsToShow, int minNumBlankImageRows)
        {
                string[] kidneyDx = new string[] { "CT Scan", "MRI", "Ultrasound" };

                DiagnosticDa imagesDa = new DiagnosticDa();
                DataTable imagesDt = imagesDa.GetDiagnosticsByType(this._patientId, kidneyDx);

                if (imagesDt.Rows.Count > 0)
                {
                    // filter to last 18mo
                    DataView imagesDv = new DataView(imagesDt);
                    string imagesFilter = BOL.Diagnostic.DxDate + " >= #" + DateTime.Now.AddMonths(-18).Date.ToShortDateString() + "#";
                    imagesFilter += " AND (";
                    imagesFilter += BOL.Diagnostic.DxTarget + "  LIKE '%CHEST%'";
                    imagesFilter += " OR " + BOL.Diagnostic.DxTarget + "  LIKE '%ABDOMEN%'";
                    imagesFilter += " OR " + BOL.Diagnostic.DxTarget + "  LIKE '%PELVIS%'";
                    imagesFilter += " OR " + BOL.Diagnostic.DxTarget + "  LIKE '%KIDNEY%'";
                    imagesFilter += " OR " + BOL.Diagnostic.DxTarget + "  LIKE '%RENAL%'";
                    imagesFilter += ")";
                    imagesDv.RowFilter = imagesFilter;


                    imagesDv.Sort = BOL.Diagnostic.DxDate + " ASC";

                    DataTable filteredImagesDt = imagesDv.ToTable();



                    // check for older intitial CT/US
                    DataView olderImagesDv = new DataView(imagesDt);
                    string olderImagesFilter = BOL.Diagnostic.DxDate + " < #" + DateTime.Now.AddMonths(-18).Date.ToShortDateString() + "#";
                    olderImagesFilter += " AND " + BOL.Diagnostic.DxType + " <> 'MRI'";
                    olderImagesFilter += " AND (";
                    olderImagesFilter += BOL.Diagnostic.DxTarget + "  LIKE '%CHEST%'";
                    olderImagesFilter += " OR " + BOL.Diagnostic.DxTarget + "  LIKE '%ABDOMEN%'";
                    olderImagesFilter += " OR " + BOL.Diagnostic.DxTarget + "  LIKE '%PELVIS%'";
                    olderImagesFilter += " OR " + BOL.Diagnostic.DxTarget + "  LIKE '%KIDNEY%'";
                    olderImagesFilter += " OR " + BOL.Diagnostic.DxTarget + "  LIKE '%RENAL%'";
                    olderImagesFilter += ")";
                    olderImagesDv.RowFilter = olderImagesFilter;
                    olderImagesDv.Sort = BOL.Diagnostic.DxDate + " ASC";

                    if (olderImagesDv.Count > 0)
                    {
                        filteredImagesDt.ImportRow(olderImagesDv[0].Row);
                        DataView repeaterDV = new DataView(filteredImagesDt);
                        repeaterDV.Sort = BOL.Diagnostic.DxDate + " ASC";
                        filteredImagesDt = repeaterDV.ToTable();
                    }


                    images.DataSource = filteredImagesDt;
                    images.DataBind();
                }


        }







        protected void PopulateKindneyImageFindings(Object Sender, RepeaterItemEventArgs e)
        {
                if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
                {
                    Literal MaxDim = (Literal)e.Item.FindControl("MaxDim");
                    Label NumTumors = (Label)e.Item.FindControl("NumTumors");
                    Label MaxDimMsg = (Label)e.Item.FindControl("MaxDimMsg");
                    Literal ImgFindSide = (Literal)e.Item.FindControl("ImgFindSide");
                    Literal TumorType = (Literal)e.Item.FindControl("TumorType");



                    int rowNumber = e.Item.ItemIndex + 1;



                    if (((DataRowView)e.Item.DataItem)[BOL.Diagnostic.DiagnosticId] != null || ((DataRowView)e.Item.DataItem)[BOL.Diagnostic.DiagnosticId].ToString().Length > 0)
                    {
                        int DiagnosticId = int.MinValue;

                        if (int.TryParse(((DataRowView)e.Item.DataItem)[BOL.Diagnostic.DiagnosticId].ToString(), out DiagnosticId))
                        {
                            DiagnosticDa DXda = new DiagnosticDa();
                            DataTable DXdt = DXda.GetDxImageFindingsKidneyByDiagnosticId(DiagnosticId);

                            if (DXdt.Rows.Count > 0)
                            {
                                decimal maxDimVal = decimal.MinValue;
                                int maxDimFindingsRowId = int.MinValue;


                                foreach (DataRow DXdr in DXdt.Rows)
                                {

                                    decimal ImgFindHeight = decimal.MinValue;
                                    decimal ImgFindWidth = decimal.MinValue;
                                    decimal ImgFindLength = decimal.MinValue;

                                    bool ImgFindHeightExists = decimal.TryParse(DXdt.Rows[0][BOL.ImageFindingKidney.ImgFindHeight].ToString(), out ImgFindHeight);
                                    bool ImgFindWidthExists = decimal.TryParse(DXdt.Rows[0][BOL.ImageFindingKidney.ImgFindWidth].ToString(), out ImgFindWidth);
                                    bool ImgFindLengthExists = decimal.TryParse(DXdt.Rows[0][BOL.ImageFindingKidney.ImgFindLength].ToString(), out ImgFindLength);

                                    decimal MaxDimValForThisFindingRecord = Math.Max(Math.Max(ImgFindHeight, ImgFindWidth), ImgFindLength);

                                    if (MaxDimValForThisFindingRecord > maxDimVal)
                                    {
                                        maxDimVal = MaxDimValForThisFindingRecord;
                                        int FindingsRowId = int.MinValue;

                                        string MaxDimDisplayText = MaxDimValForThisFindingRecord.ToString();

                                        if (DXdt.Rows[0][BOL.ImageFindingKidney.ImgFindSide].ToString().Length > 0)
                                        {
                                            ImgFindSide.Text = DXdt.Rows[0][BOL.ImageFindingKidney.ImgFindSide].ToString();
                                            //                                           MaxDimDisplayText += " (" + DXdt.Rows[0][BOL.ImageFindingKidney.ImgFindSide].ToString() + ")";
                                        }

                                        MaxDim.Text = MaxDimDisplayText;


                                        if (!ImgFindHeightExists || !ImgFindWidthExists || !ImgFindLengthExists)
                                        {
                                            MaxDimMsg.Visible = true;
                                        }
                                        else { MaxDimMsg.Visible = false; }


                                        if (int.TryParse(DXdt.Rows[0][BOL.ImageFindingKidney.DxImageFindingKidneyId].ToString(), out FindingsRowId))
                                        {
                                            maxDimFindingsRowId = FindingsRowId;
                                        }

                                        try
                                        {
                                            if (DXdt.Rows[0][BOL.ImageFindingKidney.ImgFindTumorType] != null && DXdt.Rows[0][BOL.ImageFindingKidney.ImgFindTumorType].ToString().Length > 0)
                                            {
                                                TumorType.Text = DXdt.Rows[0][BOL.ImageFindingKidney.ImgFindTumorType].ToString();
                                            }

                                        }
                                        catch (Exception ex)
                                        {
                                            ExceptionHandler.Publish(ex);
                                        }

                                    }
                                }
                            }
                        }
                    }



                    if (((DataRowView)e.Item.DataItem)[BOL.Diagnostic.DxTotalNumTumors] != null || ((DataRowView)e.Item.DataItem)[BOL.Diagnostic.DxTotalNumTumors].ToString().Length > 0)
                    {
                        int DxTotalNumTumors = int.MinValue;

                        if (int.TryParse(((DataRowView)e.Item.DataItem)[BOL.Diagnostic.DxTotalNumTumors].ToString(), out DxTotalNumTumors))
                        {
                            if (DxTotalNumTumors > 1) { NumTumors.Text = DxTotalNumTumors.ToString(); }
                        }
                    }

                }

        }

	}
}
