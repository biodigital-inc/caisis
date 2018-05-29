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
    ///		Summary description for BiopsiesProstateWithCores.
	/// </summary>
    public partial class BiopsiesProstateWithCores : BaseEFormControl
	{


		override protected void Page_Load(object sender, System.EventArgs e)
		{
            base.Page_Load(sender, e);
            base.SetTitle(ComponentTitle);
            this.BuildProstateBiopsies(this._patientId);


		}

        override protected void BuildProstateBiopsies(int PatientID)
        {
            base.BuildProstateBiopsies(this._patientId);

  //          if (Biopsies.Items.Count > 1) ProstateBiopsyCoreHeader2.Visible = true;
        }


		override protected void EFormRepeaterOnDataBound(Object Sender, RepeaterItemEventArgs e)
		{

			base.EFormRepeaterOnDataBound(Sender, e);



            Literal ResultField = (Literal)e.Item.FindControl("ResultField");
            Literal CommentsField = (Literal)e.Item.FindControl("CommentsField");


            if ((e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem) && e.Item.DataItem != null)
            {

                DataRowView record = ((DataRowView)e.Item.DataItem);


                if (record["BxType"].ToString().Length > 0 && (record["BxType"].ToString().ToUpper().IndexOf("PROSTATE") > -1))
                {
                    string resultText = "";

                    if (record["PathGG1"].ToString().Length > 0 || record["PathGG2"].ToString().Length > 0)
                    {
                        resultText = record["PathGG1"].ToString() + " + " + record["PathGG2"].ToString();
                        if (record["PathGGS"].ToString().Length > 0) resultText += (" = " + record["PathGGS"].ToString());

                        if (record["PathResult"].ToString().Length > 0) resultText += (" (" + record["PathResult"].ToString() + ")");

                    }
                    else { resultText = record["PathResult"].ToString(); }


                    ResultField.Text = resultText;
                }
                else
                {
                    ResultField.Text = record["PathResult"].ToString();
                }


                string comments = "";
                if (record[BOL.ProstatectomyPathology.PathHG_PIN].ToString().Length > 0) comments += "PIN:" + record[BOL.ProstatectomyPathology.PathHG_PIN].ToString() + ", ";
                if (record["PathASAP"].ToString().Length > 0) comments += "ASAP:" + record["PathASAP"].ToString();

                if (comments.Length > 0) CommentsField.Text = comments;




                if (record[BOL.BiopsyCoreProstatePathology.PathologyId].ToString().Length > 0)
                {

                    BiopsyDa b = new BiopsyDa();
                    DataTable coresDt = b.FormGetBiopsyCorePathsByPathologyId((int)record[BOL.BiopsyCoreProstatePathology.PathologyId]);


                    if (coresDt.Rows.Count > 0)
                    {

                        string corefilter = "LEN(" + BOL.BiopsyCoreProstatePathology.PathCoreGG1 + ") > 0 or LEN(" + BOL.BiopsyCoreProstatePathology.PathCoreGG2 + ") > 0 or LEN(" + BOL.BiopsyCoreProstatePathology.PathCoreGGS + ") > 0 or LEN(" + BOL.BiopsyCoreProstatePathology.PathCorePercCancer + ") > 0 or LEN(" + BOL.BiopsyCoreProstatePathology.PathCoreMaxCancerLength + ") > 0 or LEN(" + BOL.BiopsyCoreProstatePathology.PathCoreLength + ") > 0 or LEN(" + BOL.BiopsyCoreProstatePathology.PathCorePerineuralInv + ") > 0 or LEN(" + BOL.BiopsyCoreProstatePathology.PathCorePNI_Diam + ") > 0 or LEN(" + BOL.BiopsyCoreProstatePathology.PathCoreHG_PIN + ") > 0 or LEN(" + BOL.BiopsyCoreProstatePathology.PathCoreNumCores + ") > 0";

                        DataView coresDv = new DataView(coresDt);
                        coresDv.RowFilter = corefilter;

                        if (coresDv.Count > 0)
                        {
                            HtmlTableRow CoresContainer = (HtmlTableRow)e.Item.FindControl("CoresContainer");
                            CoresContainer.Visible = true;

                            Repeater Cores = (Repeater)e.Item.FindControl("Cores");
                            Cores.DataSource = coresDv;
                            Cores.DataBind();
                        }
                    }

                }





            }


		}




	}
}
