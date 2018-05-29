namespace Caisis.UI.Modules.Prostate.PaperForms
{
	using System;
	using System.Collections;
	using System.ComponentModel;
	using System.Data;
	using System.Drawing;
	using System.Web;
	using System.Web.SessionState;
	using System.Web.UI;
	using System.Web.UI.WebControls;
	using System.Web.UI.HtmlControls;
    using System.Web.UI.DataVisualization.Charting;
	using System.Data.SqlClient;

	using Caisis.Security;	
	
	using Caisis.DataAccess;
	using Caisis.BOL;

	using Caisis.UI.Core.Classes;

	/// <summary>
	/// This FORM is NOT Typical. Added here from reports until security model can be updated. fs, 6/15/05
	/// </summary>
	public partial class PatientOverview : BasePaperFormControl
	{
		//Constant set to determine when to start the next HPI column based on the number of rows KR
		protected static int NumHpiRowsAllowed = 10;

		protected string patientName;
		protected string reportTitle;

		//protected Label preRPNomo, preXRTNomo, preBrachyNomo, postRP2yrNomo, postRP5yrNomo, postRP7yrNomo;
		
		protected Repeater      rptNarrative;

		protected int recordCount;
		protected string chronListName = "ListCommon";


		
		override protected void SetFormInfo()  
		{
			this._formName = "PatientOverview";
			this._formTitle = "Patient Flow Chart";
		}

		override protected void Page_Load(object sender, System.EventArgs e)
		{
			if(Session[SessionKey.PatientId] != null && Session[SessionKey.PatientId].ToString().Length > 0)
			{
				int patientID = (int)Session[SessionKey.PatientId];
			
				SecurityController sc = new SecurityController();
				string userName = sc.GetUserName();

				reportTitle = "Patient Summary Report";
				patientName = Session[SessionKey.PtFirstName].ToString() + " " + Session[SessionKey.PtLastName].ToString() + "&nbsp;&nbsp;&nbsp;MRN:&nbsp;" + Session[SessionKey.PtMRN].ToString() + "&nbsp;&nbsp;&nbsp;&nbsp;" + System.DateTime.Now;



                //Narrator
				//Narrative narrative = new Narrative();
				//narrative.GetByParent(patientID);
				DataView narrative = BusinessObject.GetByParentAsDataView<Narrative>(patientID);
                //narrative.DataSourceView.Sort = "EnteredTime DESC";
				narrative.Sort = "EnteredTime DESC";
                //rptNarrator.DataSource = narrative.DataSourceView;
				rptNarrator.DataSource = narrative;
                rptNarrator.DataBind();


                //Allergies
				//Allergy allergy = new Allergy();
				//allergy.GetByParent(patientID);
				//rptAllergies.DataSource = allergy.DataSourceView;
				rptAllergies.DataSource = BusinessObject.GetByParentAsDataView<Allergy>(patientID);
                rptAllergies.DataBind();

                //Medications
				//Medication med = new Medication();
				//med.GetByParent(patientID);
				//rptMedications.DataSource = med.DataSourceView;
				rptMedications.DataSource = BusinessObject.GetByParentAsDataView<Medication>(patientID);
                rptMedications.DataBind();

                //Comorbidities
				//Comorbidity com = new Comorbidity();
				//com.GetByParent(patientID);
				//rptComorbidities.DataSource = com.DataSourceView;
				rptComorbidities.DataSource = BusinessObject.GetByParentAsDataView<Comorbidity>(patientID);
                rptComorbidities.DataBind();

				//HPI SUmmary
                try
                {
                    PatientDa hpiDa = new PatientDa();
                    DataSet hpiDs = hpiDa.GetPatientHPI(patientID, 0, 0);
                    //DataSet hpiDs = DataAccessHelper.GetList(phiCom);
                    rptHPI.DataSource = hpiDs.Tables[0].DefaultView;
                    rptHPI.DataBind();
                }
                catch (Exception ex)
                {
                    ExceptionHandler.Publish(ex);
                }

				//nomograms are in a second result set
                //base.preRPNomo.Text = hpiDs.Tables[1].Rows[0]["preRPNomo"].ToString();
                //base.preXRTNomo.Text = hpiDs.Tables[1].Rows[0]["preXRTNomo"].ToString();
                //base.preBrachyNomo.Text = hpiDs.Tables[1].Rows[0]["preBrachyNomo"].ToString();
                //postRP2yrNomo.Text = hpiDs.Tables[1].Rows[0]["postRP2yrNomo"].ToString();
                //postRP5yrNomo.Text = hpiDs.Tables[1].Rows[0]["postRP5yrNomo"].ToString();
                //base.postRP7yrNomo.Text = hpiDs.Tables[1].Rows[0]["postRP7yrNomo"].ToString();

                NomogramDa nda = new NomogramDa();

                try
                {
                    preRP5Nomo.Text = ((int) Math.Round(nda.GetPreRPResult(patientID, 5), 0)).ToString();
                }
                catch { }

                try
                {
                    preRP10Nomo.Text = ((int) Math.Round(nda.GetPreRPResult(patientID, 10), 0)).ToString();
                }
                catch { }

                try
                {
                    preXRTNomo.Text = ((int) Math.Round(nda.GetPreXRTResult(patientID), 0)).ToString();
                }
                catch { }

                try
                {
                    preBrachyNomo.Text = ((int) Math.Round(nda.GetPreBrachyResult(patientID), 0)).ToString();
                }
                catch { }

                try
                {
                    postRP2yrNomo.Text = ((int) Math.Round(nda.GetPostRPResult(patientID, 2), 0)).ToString();
                }
                catch { }

                try
                {
                    postRP5yrNomo.Text = ((int) Math.Round(nda.GetPostRPResult(patientID, 5), 0)).ToString();
                }
                catch { }

                try
                {
                    postRP7yrNomo.Text = ((int) Math.Round(nda.GetPostRPResult(patientID, 7), 0)).ToString();
                }
                catch { }

                try
                {
                    postRP10yrNomo.Text = ((int) Math.Round(nda.GetPostRPResult(patientID, 10), 0)).ToString();
                }
                catch { }
	
			
				//Chron List: displays most relevant/common list
				ChronoDa da = new ChronoDa();
				DataSet ds  = da.GetChronoList(patientID, chronListName, HttpContext.Current.User.Identity.Name);
		
				rptChrono.DataSource = ds.Tables[0].DefaultView;
				rptChrono.DataBind();
				recordCount = ds.Tables[0].Rows.Count;

                BuildChart();
			}


		}

          protected void BuildChart()
        {
            Chart1.Series.Clear();

            SessionHandler sh = new SessionHandler(Session);
            int patientId = sh.GetPatientId();

            ChronoDa da = new ChronoDa();
            DataSet ds = da.GetChronoList(patientId, "LabTests", Page.User.Identity.Name);

            DataView view = new DataView();

            string varName = "PSA";

            view = ds.Tables[0].DefaultView;
            view.RowFilter = "VarName = '" + varName + "'";

            string seriesName = varName;
            Chart1.Series.Add(seriesName);
            Chart1.Series[seriesName]["ShowMarkerLines"] = "True";
            Chart1.Series[seriesName].BorderWidth = 2;
            Chart1.Series[seriesName].ShadowOffset = 1;
            Chart1.Series[seriesName].ShadowColor = System.Drawing.Color.DarkGray;
            Chart1.Series[seriesName].Color = Color.Red;
            Chart1.Series[seriesName].ChartType = SeriesChartType.Line;
            Chart1.Series[seriesName].MarkerStyle = MarkerStyle.Circle;
            Chart1.Series[seriesName].MarkerSize = 7;
            Chart1.Series[seriesName].Points.DataBind(view, "varDate", "varValue", "Tooltip=varDate, Label=varValue");
              

            Chart1.DataBind();
        }
	
	}
}
