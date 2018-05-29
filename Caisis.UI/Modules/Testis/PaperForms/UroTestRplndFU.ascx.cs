namespace Caisis.UI.Modules.Testis.PaperForms
{
	using System;
	using System.Data;
	using System.Drawing;
	using System.Web;
	using System.Web.UI.WebControls;
	using System.Web.UI.HtmlControls;

	using Caisis.DataAccess;

	/// <summary>
	///		Summary description for UroTestRplndFU.
	/// </summary>
	public class UroTestRplndFU : FormControl
	{
		protected static int NumHpiRowsAllowed = 18;

		protected Repeater CTAbdomenPelvis, CTChest, BrainScan, XRayChest, PETScan, ScrotalUS;
		protected System.Web.UI.HtmlControls.HtmlTable BlankCXRTable, BlankScrotalUSTable, BlankChestCTTable, BlankCTAbdomenPelvisTable, BlankBrainScanTable, BlankPETScanTable;


		override protected void Page_Load(object sender, EventArgs e)
		{

			base.Page_Load(sender, e);

			this.BuildHPI();
			this.BuildMedications(4,2);
			this.BuildAllergies(4, 2);
			this.BuildComorbidities();

			this.BuildImages();
			BuildLabTestsTrendView(4, 1, 24, "HCG,HCGN,AFP,LDH", 4);
			//

			BuildEarlyComplications();
		}


		protected void BuildHPI()
		{
			if (patientID != 0)
			{

				try
				{
					PatientDa hpiDa = new PatientDa();


					DataSet hpiDs = hpiDa.GetPatientHPITestis(this.patientID);
					hpi.DataSource = hpiDs.Tables[0].DefaultView;
					hpi.DataBind();


					int rowCount = hpiDs.Tables[0].Rows.Count;
					if (rowCount < NumHpiRowsAllowed)
					{
						int newHeight = (NumHpiRowsAllowed-rowCount)*10;
						HpiSpacer.Height = newHeight;
					}
				}
				catch (Exception ex)
				{
					HpiSpacer.Height = NumHpiRowsAllowed*10;
					ExceptionHandler.Publish(ex);
				}
			}
			else
			{
				HpiSpacer.Height = NumHpiRowsAllowed*10;
			}

		}


		protected void hpiItemDataBound(Object Sender, RepeaterItemEventArgs e)
		{

			Literal StartNextHpiColumn;
			StartNextHpiColumn = (Literal) e.Item.FindControl("StartNextHpiColumn");

			if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem) 
			{
				int rowNumber = e.Item.ItemIndex + 1;
				if (System.Math.IEEERemainder(rowNumber, NumHpiRowsAllowed) == 0)
				{
					StartNextHpiColumn.Text = "</td><td class=\"HPITextExtraColumns\" valign=\"top\">";
				}
				else
				{
					StartNextHpiColumn.Visible = false;
				}
			}
		}


		protected void BuildImages()
		{
			if (patientID != 0)
			{
				DiagnosticDa imagesDa = new DiagnosticDa();
				DataSet imagesDs = imagesDa.FormGetDxImages(this.patientID, this._formName, "Dynamic");

				if (imagesDs.Tables.Count > 0 && imagesDs.Tables[0].Rows.Count > 0)
				{
					BuildImagesRpt(imagesDs.Tables[0], "X-ray Chest", XRayChest, BlankCXRTable);
					BuildImagesRpt(imagesDs.Tables[0], "US Scrotum", ScrotalUS, BlankScrotalUSTable);
					BuildImagesRpt(imagesDs.Tables[0], "CT Chest", CTChest, BlankChestCTTable);
					BuildImagesRpt(imagesDs.Tables[0], "CT Abdomen/Pelvis", CTAbdomenPelvis, BlankCTAbdomenPelvisTable);
					BuildImagesRpt(imagesDs.Tables[0], "Brain Scan", BrainScan, BlankBrainScanTable);
					BuildImagesRpt(imagesDs.Tables[0], "PET Scan", PETScan, BlankPETScanTable);
					
				}
			}
		}

		protected void BuildImagesRpt(DataTable CompleteImageTable, string ImageType, Repeater ImageRepeater, HtmlTable BlankImageTable)
		{
			int numRows = CompleteImageTable.Rows.Count;
			DataTable ImageTable = CompleteImageTable.Clone();


			for (int i=0; i<(numRows-1); i++)
			{
				if (CompleteImageTable.Rows[i]["FormMapping"].ToString() == ImageType)
				{
					ImageTable.ImportRow(CompleteImageTable.Rows[i]);
				}

			}

			if (ImageTable.Rows.Count > 0)
			{
				ImageRepeater.DataSource = ImageTable.DefaultView;
				ImageRepeater.DataBind();
				BlankImageTable.Visible = false;
			}
			else
			{
				ImageRepeater.Visible = false;
			}

		}


		protected virtual void BuildEarlyComplications()
		{

			if (patientID != 0)
			{


				ToxicityDa Da = new ToxicityDa();
				DataSet Ds = Da.FormListToxicities(patientID, this._formName, "Dynamic", "Early");

				if (Ds.Tables.Count > 0 && Ds.Tables[0].Rows.Count > 0)
				{
					EarlyComplications.DataSource = Ds.Tables[0].DefaultView;
					EarlyComplications.DataBind();
				}
				else
				{
					EarlyComplications.Visible = false;
				}
			}
			else
			{
				EarlyComplications.Visible = false;
			}
						
			
		}




		override protected void SetFormInfo()  
		{
			this._formName = "UroTestRplndFU";
			this._formTitle = "Urology RPLND Follow-Up";
		}




	}
}
