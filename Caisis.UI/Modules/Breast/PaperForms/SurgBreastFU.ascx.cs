namespace Caisis.UI.Modules.Breast.PaperForms
{
	using System;
	using System.Data;
	using System.Collections;
	using System.Web;
	using System.Web.UI;
	using System.Web.UI.WebControls;
	using System.Web.UI.HtmlControls;

	using Caisis.BOL;
	
	using Caisis.DataAccess;

	using System.Data.SqlClient;

	using System.Configuration;

	using Caisis.UI.Core.Classes;

	/// <summary>
	///		Summary description for UroProsFU.
	/// </summary>
    public partial class SurgBreastFU : BasePaperFormControl
	{

		protected static int NumHpiRowsAllowed = 10;

//		protected Label	postRP7yrNomo, LastStatus, NVB_Right, NVB_Left, PreTxPot, LastPot, SexualQOL;


//		protected Repeater complications, hpiBiopsies, HpiProstatectomies, QolTherapy;

//		protected System.Web.UI.HtmlControls.HtmlInputText potLv3Textbox, potLv2Textbox, potLv1Textbox, ContLv2Textbox, ContLv1Textbox;

//		protected bool viagraShown = false;




//		protected int hpiBiopsyId;
		private BasePaperFormControl  SurveyFormControl = null;


		override protected void Page_Load(object sender, EventArgs e)
		{

			base.Page_Load(sender, e);

			BuildReferringMD();
			BuildHPI();
//			BuildPotencyStatusValues();
//			BuildHpiProstatectomies();
//			BuildHpiProtocols();
//			BuildHpiBiopsies(hpiBiopsyId);
//			BuildHPINerveStatus();
			BuildMedications(4,2);
			BuildAllergies(4,1);
			BuildComorbidities();
			//BuildLabTests(6,0);
			BuildImages(4,1);
			//			BuildComplications();
			LastStatus.Text = GetLastStatus();




		}



		
		override protected void SetFormInfo()  
		{
			this._formName = "SurgBreastFU";
			this._formTitle = "Breast Surgery Follow-Up";
		}





		protected void BuildHPI()
		{
			if (patientID != 0)
			{
				try
				{
					PatientDa hpiDa = new PatientDa();
                    DataSet hpiDs = hpiDa.GetPatientHPIBreast(this.patientID);


                    if (hpiDs.Tables[0].Rows.Count > 0)
                    {
                        DataColumn VarOrderNumCol = new DataColumn("VarOrderNum", typeof(System.Int32));
                        hpiDs.Tables[0].Columns.Add(VarOrderNumCol);

                        DataColumn IsAppendedRowCol = new DataColumn("RowType", typeof(System.String));
                        hpiDs.Tables[0].Columns.Add(IsAppendedRowCol);

                        for (int i = 0; i < hpiDs.Tables[0].Rows.Count; i++)
                        {
                            hpiDs.Tables[0].Rows[i]["VarOrderNum"] = i;
                            hpiDs.Tables[0].Rows[i]["RowType"] = "normal";
                        }

                        int currentRowId = 0;
                        for (int k = 0; k < hpiDs.Tables[0].Rows.Count; k++)
                        {
                            currentRowId = Convert.ToInt16(hpiDs.Tables[0].Rows[k]["RowId"]);
                            for (int j = 0; j < hpiDs.Tables[0].Rows.Count; j++)
                            {
                                if (j != k && hpiDs.Tables[0].Rows[j]["RelatedRowId"].Equals(currentRowId))
                                {
                                    hpiDs.Tables[0].Rows[j]["VarOrderNum"] = hpiDs.Tables[0].Rows[k]["VarOrderNum"];
                                    hpiDs.Tables[0].Rows[j]["RowType"] = "multi";
                                    hpiDs.Tables[0].Rows[k]["RowType"] = "start multi";
                                }
                            }

                        }


                        DataView hpiDv = hpiDs.Tables[0].DefaultView;
                        hpiDv.Sort = "VarOrderNum ASC, RowId ASC";

                        hpi.DataSource = hpiDv;
                        hpi.DataBind();

                    }





				}
				catch (Exception ex)
				{
					hpi.Visible = false;
					ExceptionHandler.Publish(ex);
				}

			}


		}


        protected void hpiItemDataBound(Object Sender, RepeaterItemEventArgs e)
        {
            Literal hpiStartRow = (Literal)e.Item.FindControl("hpiStartRow");
            Literal hpiDate = (Literal)e.Item.FindControl("hpiDate");


            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                if (((DataRowView)e.Item.DataItem)["RowType"].ToString() == "normal" || ((DataRowView)e.Item.DataItem)["RowType"].ToString() == "start multi")
                {
                    hpiStartRow.Visible = true;
                    hpiDate.Text = ((DataRowView)e.Item.DataItem)["VarDate"].ToString() + "&nbsp;&nbsp;";
                }
                else
                {

                }
            }
        }

        //protected void hpiItemDataBound(Object Sender, RepeaterItemEventArgs e) 
        //{

        //    Literal StartNextHpiColumn;
        //    StartNextHpiColumn = (Literal) e.Item.FindControl("StartNextHpiColumn");

        //    if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem) 
        //    {
        //        int rowNumber = e.Item.ItemIndex + 1;
        //        if (System.Math.IEEERemainder(rowNumber, NumHpiRowsAllowed) == 0)
        //        {
        //            StartNextHpiColumn.Text = "</td><td class=\"HPITextExtraColumns\" valign=\"top\">";
        //        }
        //        else
        //        {
        //            StartNextHpiColumn.Visible = false;
        //        }
        //    }
        //}





	}
}
