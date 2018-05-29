namespace Caisis.UI.Modules.Prostate.Eforms
{
	using System;
	using System.Data;
	using System.Data.SqlClient;
	using System.Drawing;
	using System.Web;
	using System.Web.UI.WebControls;
	using System.Web.UI.HtmlControls;

	using Caisis.BOL;
	using Caisis.UI.Core.Classes;
    //2.0 using Caisis.UI.Modules.Prostate.PaperForms;
	using Caisis.DataAccess;
	using Caisis.UI.Core.Classes.CustomControls;



	/// <summary>
    ///		Summary description for BiopsyOfProstateDREHistory.
	/// </summary>
    public partial class BiopsyOfProstateDREHistory : BaseEFormControl
	{





        //2.0 protected Literal  DreResultFieldId;






		override protected void Page_Load(object sender, System.EventArgs e)
		{
			base.Page_Load(sender, e);


            BuildDREHistory();




		}






        protected void BuildDREHistory()
        {
                EncRectalExamDa eda = new EncRectalExamDa();
                DataTable dt = eda.GetDREHistory(this._patientId);

                if (dt.Rows.Count > 0)
                {
                    DREHistory.DataSource = dt.DefaultView;
                    DREHistory.DataBind();

                    DREHistoryTableHeader.Visible = true;
                    NoDREHistoryTableMessage.Visible = false;
                        
                }


        }



        protected void DREHistoryItemDataBound(Object Sender, RepeaterItemEventArgs e)
        {

            if ((e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem) && e.Item.DataItem != null)
            {

                DataRowView record = ((DataRowView)e.Item.DataItem);

                // get clinical stages from same date
                if (record[Encounter.EncDate].ToString().Length > 0)
                {
                    DataTable stageHistory = ClinicalStageHistory();

                    DataRow[] clinicalStageRows = stageHistory.Select("ClinStageDate = '#" + record[Encounter.EncDate] + "#'");
                    if (clinicalStageRows.Length > 0)
                    {

                        string StageT = (clinicalStageRows[0][ClinicalStage.ClinStageT].ToString());
                        string StageN = (clinicalStageRows[0][ClinicalStage.ClinStageN].ToString());
                        string StageM = (clinicalStageRows[0][ClinicalStage.ClinStageM].ToString());

                        string stages = "";
                        if (StageT.Length > 0) stages += StageT;
                        if (StageN.Length > 0) stages += (stages.Length > 0) ? (", " + StageN) : StageN;
                        if (StageM.Length > 0) stages += (stages.Length > 0) ? (", " + StageM) : StageM;

                        if (stages.Length > 0)
                        {
                            Literal ClinicalStageVals = (Literal)e.Item.FindControl("ClinicalStageVals");
                            ClinicalStageVals.Text = stages;
                        }


                    }
                }

                // get findings
                int EncounterId = (int)record[Encounter.EncounterId];
                DataView findings = DREFindingsByEncounter(EncounterId);
                if (findings.Count > 0)
                {
                    Repeater DREFindings = (Repeater)e.Item.FindControl("DREFindings");
                    DREFindings.DataSource = findings;
                    DREFindings.DataBind();
                    
                    Literal RectalExamJSLinkModifier = (Literal)e.Item.FindControl("RectalExamJSLinkModifier");
                    RectalExamJSLinkModifier.Text = "true"; // this changes which javascript function gets called, includes finding
                }

            }
        }


        protected DataTable ClinicalStageHistory()
        {
            ClinicalStageDa cda = new ClinicalStageDa();
            DataTable cdt = cda.FormGetRecords(this._patientId);
            DataView cdv = new DataView(cdt);
            cdv.RowFilter = ClinicalStage.ClinStageDisease + " = 'Prostate'";
            cdv.Sort = ClinicalStage.ClinStageDate + " ASC, " + ClinicalStage.EnteredTime + " DESC";

            return cdv.ToTable();
        }



        protected DataView DREFindingsByEncounter(int EncounterID)
        {
            EncRectalExamDa dreDA = new EncRectalExamDa();
            DataTable dreDT = dreDA.GetAllDREFindings(this._patientId);
            DataView dreDV = new DataView(dreDT);
            dreDV.RowFilter = EncRectalExamFinding.EncounterId + " = " + EncounterID.ToString();

            return dreDV;
        }


	}
}
