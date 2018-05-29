using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using System.Web.UI.DataVisualization;
using System.Web.UI.DataVisualization.Charting;
using System.Drawing;

using Caisis.BOL;
using Caisis.DataAccess;
using Caisis.Extensions;
using Caisis.UI.Core.Classes;
using Caisis.UI.Core.Utilities;

namespace Caisis.UI.Modules.Kidney.PaperForms
{
    public partial class KidneyClinicalSummary : BasePaperFormControl
    {
        private SurveyDa da = new SurveyDa();

        private string _reportTitle = "";

        private DateTime LastSurgeryDate = new DateTime();




        #region DefinitionsAndDictionaries;

        /// <summary>
        /// A list of survey types for the Kidney QOL Survey
        /// </summary>
        private static readonly string[] KIDNEY_SURVEY_TYPES = new string[] { "12-079 Kidney", "12079Kidney" };
        
        private static readonly string PainScore = "PainScore";
        private static readonly string FatigueScore = "FatigueScore";
        private static readonly string QOLScore = "QOLScore";
        private static readonly string FirstVisit = "FirstVisit";
        private static readonly string ActivityLevel = "ActivityLevel";
        private static readonly string BowelFunction = "BowelFunction";
        private static readonly string AnxietyWithCancer = "AnxietyWithCancer";
        private static readonly string Complications = "Complications";

        /// <summary>
        /// Question numbers
        /// </summary>
        private static IDictionary<int, string> SurveyQuestionNumber = new Dictionary<int, string>
        {
            { 0, "First visit" },
            { 1, "Light activities" },
            { 2, "Moderate activities" },
            { 3, "Vigorous activities" },
            { 4, "Bowel problems" },
            { 5, "Bowel problems frequency" },
            { 6, "Medical professional visit" },
            { 7, "Medication" },
            { 8, "Procedure" },
            { 9, "Overnight hospital stay" },
            { 10, "Worried" },
            { 11, "Mood" },
            { 12, "Cannot plan for the future" },
            { 13, "QOL" },
            { 14, "Pain" },
            { 15, "Fatigue" }
        };
        /// <summary>
        /// Question Categorization
        /// </summary>
        private static IDictionary<string, string> ScoreCategory = new Dictionary<string, string>
        {
            { SurveyQuestionNumber[0], FirstVisit },
            { SurveyQuestionNumber[1], ActivityLevel },
            { SurveyQuestionNumber[2], ActivityLevel },
            { SurveyQuestionNumber[3], ActivityLevel },
            { SurveyQuestionNumber[4], BowelFunction },
            { SurveyQuestionNumber[5], BowelFunction },
            { SurveyQuestionNumber[6], Complications },
            { SurveyQuestionNumber[7], Complications },
            { SurveyQuestionNumber[8], Complications },
            { SurveyQuestionNumber[9], Complications },
            { SurveyQuestionNumber[10], AnxietyWithCancer },
            { SurveyQuestionNumber[11], AnxietyWithCancer },
            { SurveyQuestionNumber[12], AnxietyWithCancer },
            { SurveyQuestionNumber[13], QOLScore },
            { SurveyQuestionNumber[14], PainScore },
            { SurveyQuestionNumber[15], FatigueScore }
        };


        
        /// <summary>
        /// A list of Primary Procedures, considered Major resections
        /// </summary>
        private static List<string> PRIMARY_PROCEDURES = new List<string>
        {
            
            { "Nephrectomy" },
            { "Radical Nephrectomy" },
            { "Partial Nephrectomy" },
            { "Nephroureterectomy" }

        };



        /// <summary>
        /// A list of Secondary Procedures
        /// </summary>
        //private static List<string> SECONDARY_PROCEDURES = new List<string>
        //{
        //    { "Ileostomy Closure" },
        //    { "Colostomy Closure" },
        //    { "Hartmann Closure" }
        //};

        private static readonly Font DEFAULT_FONT = new System.Drawing.Font("Arial", 12, System.Drawing.FontStyle.Bold);


        #endregion



        public virtual string ReportTitle
        {
            get
            {
                return _reportTitle;
            }
            set
            {
                _reportTitle = value;
            }
        }
        

        #region COLORS

        int colorIndex = 0;

        private static readonly Color[] COLOR_WHEEL = new Color[]
        {
            Color.FromArgb(79,129,189),
            Color.FromArgb(192,0,0),
            Color.FromArgb(255,192,0),
            Color.FromArgb(0,176,80),
            Color.FromArgb(230,185,184),
            Color.FromArgb(96,74,123), 
        };

        /// <summary>
        /// Gets the next Color on the Color Wheel
        /// </summary>
        /// <returns></returns>
        protected Color GetNextColor()
        {
            var color = COLOR_WHEEL[colorIndex++ % COLOR_WHEEL.Length];
            return color;
        }

        #endregion



        protected override void Page_Load(object sender, EventArgs e)
        {
            base.Page_Load(sender, e);


            if (base.patientID > -1)
            {
                

                BuildReport();
//                BuildChartNephrectomys();
                BuildSurveys();
            }
        }

        /// <summary>
        /// For the current Patient, build the BreastQ report
        /// </summary>
        public void BuildReport()
        {
            // build patient details
            BuildProcedureDetails(this, base.patientID);
            this.BuildGFR();
  //          this.getLastSurvey();
        }



        /// <summary>
        /// Populate the Patient's Procedure details
        /// </summary>
        /// <param name="panel"></param>
        /// <param name="patientId"></param>
        private void BuildProcedureDetails(Control panel, int patientId)
        {
            //
            int? age = PatientAge(patientId);
            if (age.HasValue) PatientAgeLabel.Text = age.ToString() + " years old";
            


            //try
            //{
            // procedure
            var allProcedures = BusinessObject.GetByFields<Procedure>(new Dictionary<string, object> { { Procedure.PatientId, patientID } });

            // filter procedures by ProcName
            var procedures = from procedure in allProcedures
                             let procName = procedure[Procedure.ProcName].ToString()
                             where (PRIMARY_PROCEDURES.Any(str => str.Contains(procName)))
                             orderby procedure[Procedure.ProcDate] ascending
                             select procedure;

            //().Text = FormatListOutput(Procedure.ProcName, Procedure.ProcDate, procedures);
            IEnumerable<IBusinessObject> iProc = procedures.Cast<IBusinessObject>();

            DataView v = ProcListOutput(iProc);
            if (v.Count > 0)
            {
                NoProceduresLabel.Visible = false;
                ProceduresRpt.DataSource = v;
                ProceduresRpt.DataBind();
            }

            foreach (Procedure p in iProc)  // path values
            {

                DataView dv = BOL.BusinessObject.GetByFieldsAsDataView<BOL.Pathology>(new Dictionary<string, object> { { BOL.Pathology.ProcedureId, (int)p[BOL.Procedure.ProcedureId] } });
                dv.Sort = BOL.Pathology.PathDate + " DESC";

                if (dv.Count > 0)
                {
                    dv.Sort = BOL.Pathology.PathDate + " DESC";
                    PathologyLabel.Text = "";


                    foreach (DataRowView rv in dv)
                    {
                        PathologyLabel.Text = rv[BOL.Pathology.PathHistology].ToString();

                        IEnumerable<IBusinessObject> c = BusinessObject.GetByParent("PathologyStageGrade", (int)rv[BOL.Pathology.PathologyId]);
                        if (c != null && c.Count<IBusinessObject>() > 0)
                        {
                            string t = c.First<IBusinessObject>()[BOL.PathologyStageGrade.PathStageT].ToString();
                            string n = c.First<IBusinessObject>()[BOL.PathologyStageGrade.PathStageN].ToString();
                            string m = c.First<IBusinessObject>()[BOL.PathologyStageGrade.PathStageM].ToString();
                            if (t.Length > 0 || n.Length > 0 || m.Length > 0) PathologyLabel.Text += " Stage " + t + " " + n + " " + m;
                        }
                        string quality = rv[BOL.Pathology.PathQuality].ToString();
                        string dateText = rv[BOL.Pathology.PathDateText].ToString();

                        if (quality.Length > 0 || dateText.Length > 0) PathologyLabel.Text += " (" + quality + " " + dateText + ")";
                        PathologyLabel.Text += "<br/>";
                    }
                }


            }

            if (iProc.Count() > 0 && iProc.Last<IBusinessObject>()[BOL.Procedure.ProcDate].ToString().Length > 0)
            {
                LastSurgeryDate = (DateTime)iProc.Last<IBusinessObject>()[BOL.Procedure.ProcDate];
                TimeFromLastSurgery.Text = TimeSpanLongString(LastSurgeryDate, DateTime.Now) + " since surgery";
            }

        //}
            //catch (Exception ex)
            //{
            //    ExceptionHandler.Publish(ex);
            //}

            //risk factors
            var comorbidities = BusinessObject.GetByFields<Comorbidity>(new Dictionary<string, object> { { Comorbidity.PatientId, patientID } }).Cast<IBusinessObject>();
            Label RiskFactorsLabel = panel.FindControl("RiskFactorsLabel") as Label;
            string RiskFactorsLabelTxt = FormatListOutput(Comorbidity.Comorbidity_Field, Comorbidity.ComorbDate, comorbidities);
            if (RiskFactorsLabelTxt.Length > 0) RiskFactorsLabel.Text = RiskFactorsLabelTxt;


            DataView socialHxView = BOL.BusinessObject.GetByParentAsDataView<BOL.SocialHistory>(patientID);
            if (socialHxView.Count > 0)
            {
                string socHxTobaccoType = socialHxView[0][BOL.SocialHistory.SocHxTobaccoType].ToString();
                string socHxTobaccoPacksPerDay = socialHxView[0][BOL.SocialHistory.SocHxTobaccoPacksPerDay].ToString();
                string socHxTobaccoYears = socialHxView[0][BOL.SocialHistory.SocHxTobaccoYears].ToString();
                string socHxTobaccoQuitYear = socialHxView[0][BOL.SocialHistory.SocHxTobaccoQuitYear].ToString();
                string socHxTobaccoPacksPerYear = socialHxView[0][BOL.SocialHistory.SocHxTobaccoPacksPerYear].ToString();
                string socHxCarcinogen = socialHxView[0][BOL.SocialHistory.SocHxCarcinogen].ToString();

                string socHxStr = "";
                if ((socHxTobaccoType.Length > 0 && socHxTobaccoType != "Never" && socHxTobaccoType != "No") || socHxTobaccoPacksPerDay.Length > 0 || socHxTobaccoYears.Length > 0 || socHxTobaccoQuitYear.Length > 0)//|| socHxTobaccoPacksPerYear.Length > 0
                {
                    socHxStr += (socHxTobaccoType.Length > 0) ? (socHxTobaccoType + ": ") : "Smoking: ";
                    socHxStr += (socHxTobaccoPacksPerDay.Length > 0) ? (socHxTobaccoPacksPerDay + " packs per day") : "";
                    socHxStr += (socHxTobaccoYears.Length > 0) ? (" for " + socHxTobaccoYears + " years") : "";
                    socHxStr += (socHxTobaccoQuitYear.Length > 0) ? (((socHxTobaccoPacksPerDay.Length > 0 || socHxTobaccoYears.Length > 0) ? " (" : "") + "Quit in " + socHxTobaccoQuitYear + ((socHxTobaccoPacksPerDay.Length > 0 || socHxTobaccoYears.Length > 0) ? ")" : "")) : "";
                }

                if (socHxCarcinogen.Length > 0) socHxStr += (((socHxStr.Length > 0) ? ", " : "") + "Carcinogen Exposure: " +  socHxCarcinogen);
                if (socHxStr.Length > 0) RiskFactorsLabel.Text += (((RiskFactorsLabel.Text.Length > 0) ? ", " : "") + socHxStr);
            }

            try
            {
                // radiation
                var radiation = BusinessObject.GetByFields<RadiationTherapy>(new Dictionary<string, object> { { RadiationTherapy.PatientId, patientID } }).Cast<IBusinessObject>();
                Label radiationLabel = panel.FindControl("RadiationLabel") as Label;
                string radiationLabelTxt = FormatListOutput(RadiationTherapy.RadTxType, RadiationTherapy.RadTxDate, radiation);
                if (radiationLabelTxt.Length > 0) radiationLabel.Text = radiationLabelTxt;

            }
            catch (Exception ex2)
            {
                ExceptionHandler.Publish(ex2);
            }


            try
            {
            // chemo
            var chemo = BusinessObject.GetByFields<MedicalTherapy>(new Dictionary<string, object> { { MedicalTherapy.PatientId, patientID }, { MedicalTherapy.MedTxType, "CHEMO" } }).Cast<IBusinessObject>();
            Label chemoLabel = panel.FindControl("ChemotherapyLabel") as Label;
            string chemoLabelTxt = FormatListOutput(MedicalTherapy.MedTxAgent, MedicalTherapy.MedTxDate, chemo);
            if (chemoLabelTxt.Length > 0) chemoLabel.Text = chemoLabelTxt;


            }
            catch (Exception ex3)
            {
                ExceptionHandler.Publish(ex3);
            }

            try
            {
                // protocols
                var protocols = BusinessObject.GetByFields<PatientProtocol>(new Dictionary<string, object> { { PatientProtocol.PatientId, patientID } }).Cast<IBusinessObject>();

                DataView protocolsDV = protocols.AsDataView("PatientProtocols");
                protocolsDV.RowFilter = PatientProtocol.PtProtocolStatus + " IN ('On Study')";

//                string[] StatusNotOnProtocol = { "ON STUDY" };



                if (protocolsDV.Count > 0)
                {

                    string ProtocolsLabelTxt = "";
                    foreach (DataRowView pDrv in protocolsDV)
                    {
                        var theProtocol = BusinessObject.GetByFields<Protocol>(new Dictionary<string, object> { { Protocol.ProtocolId, (int)pDrv[PatientProtocol.ProtocolId] } }).Cast<IBusinessObject>();

                        if (theProtocol.Count() > 0)
                        {
                            string theProtocolTxt = theProtocol.Last<IBusinessObject>()[BOL.Protocol.ProtocolNum].ToString();
                            if (theProtocol.Last<IBusinessObject>()[BOL.Protocol.ProtocolAlias].ToString().Length > 0) theProtocolTxt += " (" + theProtocol.Last<IBusinessObject>()[BOL.Protocol.ProtocolAlias].ToString() + ")";
                            if (ProtocolsLabelTxt.Length > 0) ProtocolsLabelTxt += ", ";
                            ProtocolsLabelTxt += theProtocolTxt;

                        }

                    }
                    if (ProtocolsLabelTxt.Length > 0) ProtocolsLabel.Text = ProtocolsLabelTxt;
                    
                }

            }
            catch (Exception ex2)
            {
                ExceptionHandler.Publish(ex2);
            }

            try
            {
                // complications
                var complications = BusinessObject.GetByFields<Toxicity>(new Dictionary<string, object> { { Toxicity.PatientId, patientID } }).Cast<IBusinessObject>();
                Label ComplicationsLabel = panel.FindControl("ComplicationsLabel") as Label;
                string ComplicationsLabelTxt = FormatListOutput(Toxicity.ToxName, Toxicity.ToxDate, complications);
                if (ComplicationsLabelTxt.Length > 0) ComplicationsLabel.Text = ComplicationsLabelTxt;

            }
            catch (Exception ex2)
            {
                ExceptionHandler.Publish(ex2);
            }


        }



        private void BuildGFR()
        {

            DataRow Nephrectomy = PatientNephrectomy(this.patientID, this.FormName, "Dynamic");

            if (Nephrectomy != null && Nephrectomy[BOL.Procedure.ProcDate] != null)
            {
                DateTime NephDate;
                if (DateTime.TryParse(Nephrectomy[BOL.Procedure.ProcDate].ToString(), out NephDate))
                {
                    BuildLabTestsKidney(NephDate);
                }
                else
                {
                    BuildLabTestsKidney(DateTime.MinValue);
                }
            }
            else
            {
                BuildLabTestsKidney(DateTime.MinValue);
            }
        }


        protected void BuildLabTestsKidney(DateTime NephrectomyDate)
        {
            LabTestDa da = new LabTestDa();

            string[] l = { "CREAT" };
            DataSet ds = da.GetLabTestsbyList(this.patientID, l);

            if (ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
            {
                DataTable dt = ds.Tables[0];

                DataColumn LastBeforeNeph = new DataColumn();
                LastBeforeNeph.ColumnName = "LastBeforeNeph";
                LastBeforeNeph.DataType = System.Type.GetType("System.Boolean");
                LastBeforeNeph.DefaultValue = false;
                dt.Columns.Add(LastBeforeNeph);

                // highlight pre-op creat
                if (NephrectomyDate != null && NephrectomyDate != DateTime.MinValue)
                {
                    for (int i = 0; i < dt.Rows.Count; i++)
                    {
                        if (dt.Rows[i][BOL.LabTest.LabDate] != null && (DateTime)dt.Rows[i][BOL.LabTest.LabDate] <= NephrectomyDate)
                        {
                            if ((i == (dt.Rows.Count - 1)) || (DateTime)dt.Rows[i + 1][BOL.LabTest.LabDate] > NephrectomyDate || (DateTime)dt.Rows[i][BOL.LabTest.LabDate] == NephrectomyDate)
                            {
                                dt.Rows[i]["LastBeforeNeph"] = true;
                            }
                        }
                    }
                }





                if (dt.Rows.Count > 0)
                {
                    DataView labDv = new DataView(dt);
                    DataView labRptDv = KidneyLabsWithGFR(this.patientID, labDv);
                    labTests.DataSource = labRptDv;
                    labTests.DataBind();

                    NoLabsMsg.Visible = false;
                    GFRChart.Visible = true;

                    var graphtable = labRptDv.ToTable(false, "GFR", "LabDateText", "LabDate", "LabResult");
                    graphtable.Columns.Add("MonthsSinceSurgery");

                    foreach (DataRow dr in graphtable.Rows)  // iterate through each date
                    {
                            if (!string.IsNullOrEmpty(dr[BOL.LabTest.LabDate].ToString())) 
                            {
                                dr["MonthsSinceSurgery"] = MonthsSinceLastSurgery((DateTime)dr[BOL.LabTest.LabDate]);
                            }
                    }


                    var series = BuildSeries(GFRChart, "GFR");

                    if (LastSurgeryDate > DateTime.MinValue)
                    {
                        series.Points.DataBind(graphtable.DefaultView, "MonthsSinceSurgery", "GFR", "");
                        GFRChart.ChartAreas[0].AxisX.Title = "Months Since Surgery";
                        GFRChart.ChartAreas[0].AxisX.Minimum = 0;
                    GFRChart.ChartAreas[0].AxisX.LabelStyle.Angle = 0;
                    }
                    else
                    {

                        series.XValueType = ChartValueType.DateTime;
                        series.Points.DataBind(graphtable.DefaultView, "LabDateText", "GFR", "");
                        GFRChart.ChartAreas[0].AxisX.Title = "Date";
                        GFRChart.ChartAreas[0].AxisX.LabelStyle.Angle = 45;
//                        GFRChart.ChartAreas[0].AxisX.Minimum = 0;


                        //series.Points.DataBind(points, "SurveyDateText", "SurveyScore", "");
                        //chart.ChartAreas[0].AxisY.Minimum = YAxisMin[currentSurvey];
                        //chart.ChartAreas[0].AxisY.Maximum = YAxisMax[currentSurvey];
                        //chart.ChartAreas[0].AxisY.Interval = (chart.ChartAreas[0].AxisY.Maximum <= 10) ? 1 : ((chart.ChartAreas[0].AxisY.Maximum <= 30) ? 5 : 10);
                        //if (YAxisCustomLabel[currentSurvey].Length > 0) chart.ChartAreas[0].AxisY.Title = YAxisCustomLabel[currentSurvey];


                    }




                    GFRChart.ChartAreas[0].AxisX.LineWidth = 1;




                    List<int> HLines = new List<int>(new int[] { 15, 45, 60, 90 });

                    foreach (int i in HLines)
                    {
                        StripLine s1 = new StripLine();
                        s1.StripWidth = 0;
                        s1.BorderColor = Color.Gray;
                        s1.BorderWidth = 1;
                        s1.BorderDashStyle = ChartDashStyle.Dash;
                        s1.Interval = 0;
                        s1.IntervalOffset = i;
                        s1.Text = i.ToString();
                        s1.TextAlignment = StringAlignment.Far;

                        GFRChart.ChartAreas[0].AxisY.StripLines.Add(s1);
                    }

                    GFRChart.Titles[0].Visible = false;
                }

            }


        }






        /// <summary>
        /// Create a specialized csv list
        /// </summary>
        /// <param name="displayField"></param>
        /// <param name="dateField"></param>
        /// <param name="dataSource"></param>
        /// <returns></returns>
        private string FormatListOutput(string displayField, string dateField, IEnumerable<IBusinessObject> dataSource)
        {
            var outputValues = from row in dataSource
                               let displayValue = row[displayField].ToString()
                               let dateHasValue = !row.IsNull(dateField)
                               let dateValue = dateHasValue ? ((DateTime)row[dateField]).ToShortDateString() : ""
  //                             orderby dateHasValue ? (DateTime)row[dateField] : DateTime.MinValue descending
                               select !string.IsNullOrEmpty(dateValue) ? displayValue + " (" + dateValue + ")" : displayValue;
            if (outputValues.Count() == 0)
                return "";
            else
                return string.Join(", ", outputValues.ToArray());
            
        }




        private DataView ProcListOutput(IEnumerable<IBusinessObject> dataSource)
        {
            DataTable dt = dataSource.AsDataView("Procedures").ToTable();
            dt.Columns.Add(Nephrectomy.ProcHypothermia);
            dt.Columns.Add(Nephrectomy.ProcPartialIschemia);
            dt.Columns.Add(Nephrectomy.ProcPartialClampDuration);
            dt.Columns.Add(Nephrectomy.ProcPercKidneySpared);


            foreach (DataRow dr in dt.Rows)
            {
                IEnumerable<IBusinessObject> c = BusinessObject.GetByParent("NephrectomyProc", (int)dr[Procedure.ProcedureId]);
                if (c != null && c.Count<IBusinessObject>() > 0)
                {
                    dr[Nephrectomy.ProcHypothermia] = c.First<IBusinessObject>()[Nephrectomy.ProcHypothermia].ToString();
                    dr[Nephrectomy.ProcPartialIschemia] = c.First<IBusinessObject>()[Nephrectomy.ProcPartialIschemia].ToString();
                    dr[Nephrectomy.ProcPartialClampDuration] = c.First<IBusinessObject>()[Nephrectomy.ProcPartialClampDuration].ToString();
                    dr[Nephrectomy.ProcPercKidneySpared] = c.First<IBusinessObject>()[Nephrectomy.ProcPercKidneySpared].ToString();
                }
            }


            DataView dv = new DataView(dt);
            dv.Sort = Procedure.ProcDate + " ASC";

            return dv;

        }


        protected void getLastSurvey()
        {

            DataTable dt = da.GetMostRecentSurveyWithItemsByType(this.patientID, "%Kidney QOL%");

            if (dt.Rows.Count > 0)
            {
                DataView dv = dt.DefaultView;
                dv.Sort = SurveyItem.SurveyItemId;
                SurveyResponsesRepeater.DataSource = dv;
                SurveyResponsesRepeater.DataBind();

                LastSurveyTitle.Text = "Most Recent Survey: " + dv[0][BOL.Survey.SurveyDateText].ToString();

                
                if (!string.IsNullOrEmpty( dv[0][BOL.Survey.SurveyDate].ToString()))
                {
                    DateTime d = (DateTime)dv[0][BOL.Survey.SurveyDate];
                    string t = TimeSpanLongString(d, DateTime.Now);
                    if (t.Length > 0) LastSurveyTitle.Text += " (" + t + " ago)";
                    
                }

                NoSurveyMsg.Visible = false;
            }
        }

        private DataTable AllKidneyQOLSurveys()
        {
            // account for special naming conventions
            var surveys = from type in KIDNEY_SURVEY_TYPES
                          // search by wild card
                          let searchType = type + "%"
                          let rows = da.GetSurveysAndItemsByType(patientID, searchType, null, null).AsEnumerable()
                          select rows;
            var allRows = surveys.Where(r => r.Count() > 0).SelectMany(r => r);
            if (allRows.Count() > 0)
                return allRows.CopyToDataTable();
            else
                return new DataTable();
        }


        protected void BuildSurveys()
        {


            DataTable allSurveys = AllKidneyQOLSurveys();
            DataView dv = new DataView(allSurveys);

            if (dv.Count > 0)
            {
                NoSurveyMsg.Visible = false;
                SurveyContainer.Visible = true;

                DataTable surveyDates = dv.ToTable(true, BOL.Survey.SurveyDate); // all dates for this survey

                DataTable surveyScores = new DataTable();
                surveyScores.Columns.Add(new DataColumn("SurveyDateText", typeof(string)));
                surveyScores.Columns.Add(new DataColumn("SurveyDate", typeof(DateTime)));
                surveyScores.Columns.Add(new DataColumn("MonthsSinceSurgery", typeof(int)));
                surveyScores.Columns.Add(new DataColumn(PainScore, typeof(int)));
                surveyScores.Columns.Add(new DataColumn(FatigueScore, typeof(int)));
                surveyScores.Columns.Add(new DataColumn(QOLScore, typeof(int)));
                surveyScores.Columns.Add(new DataColumn(ActivityLevel, typeof(string)));
                surveyScores.Columns.Add(new DataColumn(BowelFunction, typeof(string)));
                surveyScores.Columns.Add(new DataColumn(AnxietyWithCancer, typeof(string)));
                surveyScores.Columns.Add(new DataColumn(Complications, typeof(string)));

                foreach (DataRow dr in surveyDates.Rows)  // iterate through each date
                {
                    dv.RowFilter = BOL.Survey.SurveyDate + " = #" + ((DateTime)dr[BOL.Survey.SurveyDate]).ToShortDateString() + "#";

                    if (dv.Count > 0)
                    {
                            DataRow newPoint = surveyScores.NewRow();
                            newPoint = SurveyScore(newPoint, dv.ToTable());
                            surveyScores.Rows.Add(newPoint);
                    }
                }


                var seriesPain = BuildSeries(SurveyChart, "Pain");
                var seriesFatigue = BuildSeries(SurveyChart, "Fatigue");
                var seriesQOL = BuildSeries(SurveyChart, "QOL");




                if (LastSurgeryDate > DateTime.MinValue)
                {
                    seriesPain.Points.DataBind(surveyScores.DefaultView, "MonthsSinceSurgery", PainScore, "");
                    seriesFatigue.Points.DataBind(surveyScores.DefaultView, "MonthsSinceSurgery", FatigueScore, "");
                    seriesQOL.Points.DataBind(surveyScores.DefaultView, "MonthsSinceSurgery", QOLScore, "");

                    SurveyChart.ChartAreas[0].AxisX.Title = "Months Since Surgery";
                    SurveyChart.ChartAreas[0].AxisX.Minimum = 0;
                    SurveyChart.ChartAreas[0].AxisX.LabelStyle.Angle = 0;
                }
                else
                {

                    seriesPain.XValueType = ChartValueType.DateTime;
                    seriesFatigue.XValueType = ChartValueType.DateTime;
                    seriesQOL.XValueType = ChartValueType.DateTime;
                    seriesPain.Points.DataBind(surveyScores.DefaultView, "SurveyDateText", PainScore, "");
                    seriesFatigue.Points.DataBind(surveyScores.DefaultView, "SurveyDateText", FatigueScore, "");
                    seriesQOL.Points.DataBind(surveyScores.DefaultView, "SurveyDateText", QOLScore, "");

                    GFRChart.ChartAreas[0].AxisX.Title = "Date";
                    GFRChart.ChartAreas[0].AxisX.LabelStyle.Angle = 45;

                }



                showLastSurvey(surveyScores.Rows[(surveyScores.Rows.Count - 1)]);
            }




        }



        protected DataRow SurveyScore(DataRow SurveyScore, DataTable Survey)
        {

            bool _ActivityLevel_Light = false;
            bool _ActivityLevel_Moderate = false;
            bool _ActivityLevel_Vigorous = false;
            string _ActivityLevel = "None";

            int _BowelFunction_Habits = 0;
            int _BowelFunction_Pain = 0;
            string _BowelFunction = "No Bowel Symptoms";

            bool _Complications = false;
            bool _Complications_AntibioticPainkiller = false;
            bool _Complications_Procedure = false;
            bool _Complications_Inpatient = false;
            string _ComplicationsText = "No";

            bool _AnxietyWithCancer_Thoughts = false;
            bool _AnxietyWithCancer_Mood = false;
            bool _AnxietyWithCancer_Plans = false;
            string _AnxietyWithCancer = "No";


            foreach (DataRow dr in Survey.Rows)
            {
                int? ItemNumericScore = ItemScore(dr[BOL.SurveyItem.SurveyItemResult].ToString());

                if (dr[BOL.SurveyItem.SurveyItemNum].ToString().Equals(SurveyQuestionNumber[1]))
                {
                        if (ItemNumericScore != null && ItemNumericScore < 3) _ActivityLevel_Light = true;
                }
                else if (dr[BOL.SurveyItem.SurveyItemNum].ToString().Equals(SurveyQuestionNumber[2]))
                {
                    if (ItemNumericScore != null && ItemNumericScore < 3) _ActivityLevel_Moderate = true;
                }
                else if (dr[BOL.SurveyItem.SurveyItemNum].ToString().Equals(SurveyQuestionNumber[3]))
                {
                    if (ItemNumericScore != null && ItemNumericScore < 3) _ActivityLevel_Vigorous = true;
                }
                else if (dr[BOL.SurveyItem.SurveyItemNum].ToString().Equals(SurveyQuestionNumber[4]))
                {
                        //int BowelFunction_HabitsScore = 0;
                        //if (int.TryParse(dr[BOL.SurveyItem.SurveyItemResult].ToString(), out BowelFunction_HabitsScore)) _BowelFunction_Habits = BowelFunction_HabitsScore;

                        if (ItemNumericScore != null) _BowelFunction_Habits = ItemNumericScore.Value;
                }
                else if (dr[BOL.SurveyItem.SurveyItemNum].ToString().Equals(SurveyQuestionNumber[5]))
                {
                        //int BowelFunction_PainScore = 0;
                    //if (int.TryParse(dr[BOL.SurveyItem.SurveyItemResult].ToString(), out BowelFunction_PainScore)) _BowelFunction_Pain = BowelFunction_PainScore;

                    if (ItemNumericScore != null) _BowelFunction_Pain = ItemNumericScore.Value;
                }
                else if (dr[BOL.SurveyItem.SurveyItemNum].ToString().Equals(SurveyQuestionNumber[6]))
                {
                    if (dr[BOL.SurveyItem.SurveyItemResult].ToString().ToUpper().StartsWith("Y")) _Complications = true;
                }
                else if (dr[BOL.SurveyItem.SurveyItemNum].ToString().Equals(SurveyQuestionNumber[7]))
                {
                    if (dr[BOL.SurveyItem.SurveyItemResult].ToString().ToUpper().StartsWith("Y")) _Complications_AntibioticPainkiller = true;
                }
                else if (dr[BOL.SurveyItem.SurveyItemNum].ToString().Equals(SurveyQuestionNumber[8]))
                {
                    if (dr[BOL.SurveyItem.SurveyItemResult].ToString().ToUpper().StartsWith("Y")) _Complications_Procedure = true;
                }
                else if (dr[BOL.SurveyItem.SurveyItemNum].ToString().Equals(SurveyQuestionNumber[9]))
                {
                    if (dr[BOL.SurveyItem.SurveyItemResult].ToString().ToUpper().StartsWith("Y")) _Complications_Inpatient = true;
                }
                else if (dr[BOL.SurveyItem.SurveyItemNum].ToString().Equals(SurveyQuestionNumber[10]))
                {
                    //                  if (dr[BOL.SurveyItem.SurveyItemResult].ToString().ToUpper().StartsWith("Y")) _AnxietyWithCancer_Thoughts = true;
                    if (ItemNumericScore != null && ItemNumericScore > 3) _AnxietyWithCancer_Thoughts = true;
                }
                else if (dr[BOL.SurveyItem.SurveyItemNum].ToString().Equals(SurveyQuestionNumber[11]))
                {
//                    if (dr[BOL.SurveyItem.SurveyItemResult].ToString().ToUpper().StartsWith("Y")) _AnxietyWithCancer_Mood = true;
                    if (ItemNumericScore != null && ItemNumericScore > 3) _AnxietyWithCancer_Mood = true;
                }
                else if (dr[BOL.SurveyItem.SurveyItemNum].ToString().Equals(SurveyQuestionNumber[12]))
                {
//                    if (dr[BOL.SurveyItem.SurveyItemResult].ToString().ToUpper().StartsWith("Y")) _AnxietyWithCancer_Plans = true;
                    if (ItemNumericScore != null && ItemNumericScore > 3) _AnxietyWithCancer_Plans = true;
                }
                else if (dr[BOL.SurveyItem.SurveyItemNum].ToString().Equals(SurveyQuestionNumber[13]))
                {
                        //int qolScore = 0;
                    //if (int.TryParse(dr[BOL.SurveyItem.SurveyItemResult].ToString(), out qolScore)) SurveyScore[QOLScore] = qolScore;

                    if (ItemNumericScore != null) SurveyScore[QOLScore] = ItemNumericScore.Value;
                }
                else if (dr[BOL.SurveyItem.SurveyItemNum].ToString().Equals(SurveyQuestionNumber[14]))
                {
                        //int painScore = 0;
                    //if (int.TryParse(dr[BOL.SurveyItem.SurveyItemResult].ToString(), out painScore)) SurveyScore[PainScore] = painScore;

                    if (ItemNumericScore != null) SurveyScore[PainScore] = ItemNumericScore.Value;
                }
                else if (dr[BOL.SurveyItem.SurveyItemNum].ToString().Equals(SurveyQuestionNumber[15]))
                {
                        //int fatigueScore = 0;
                        //if (int.TryParse(dr[BOL.SurveyItem.SurveyItemResult].ToString(), out fatigueScore)) SurveyScore[FatigueScore] = fatigueScore;

                    if (ItemNumericScore != null) SurveyScore[FatigueScore] = ItemNumericScore.Value;
                }
            }
            if (_ActivityLevel_Vigorous) SurveyScore[ActivityLevel] = "Vigorous";
            else if (_ActivityLevel_Moderate) SurveyScore[ActivityLevel] = "Moderate";
            else if (_ActivityLevel_Light) SurveyScore[ActivityLevel] = "Light";

            if (_BowelFunction_Habits > 0 || _BowelFunction_Pain > 0)
            {
                SurveyScore[BowelFunction] = (_BowelFunction_Habits > 0) ? "Overall Problems: " + _BowelFunction_Habits.ToString() + "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" : "";
                SurveyScore[BowelFunction] += (_BowelFunction_Pain > 0) ? "Pain: " + _BowelFunction_Pain.ToString() : "";
            }

            if (_Complications)
            {
                _ComplicationsText = "Yes";
            }
            SurveyScore[Complications] = _ComplicationsText;

            if (_AnxietyWithCancer_Thoughts || _AnxietyWithCancer_Mood || _AnxietyWithCancer_Plans)
            {
                _AnxietyWithCancer = "Yes";
            }
            SurveyScore["AnxietyWithCancer"] = _AnxietyWithCancer;

            SurveyScore["SurveyDateText"] = Survey.Rows[0][BOL.Survey.SurveyDateText];
            SurveyScore["SurveyDate"] = (DateTime)Survey.Rows[0][BOL.Survey.SurveyDate];
            SurveyScore["MonthsSinceSurgery"] = MonthsSinceLastSurgery((DateTime)Survey.Rows[0][BOL.Survey.SurveyDate]);

            return SurveyScore;

        }

        protected int? ItemScore(string SurveyItemResult)
        {
            int? score = null;
            int scoreInt = 0;
            if (SurveyItemResult.Length > 0 && int.TryParse(SurveyItemResult, out scoreInt)) score = scoreInt;

            return score;
        }

        protected int MonthsSinceLastSurgery(DateTime SurveyDate)
        {
            double dMonths = ((SurveyDate - LastSurgeryDate).Days) / (365.25 / 12);
            int months = Convert.ToInt32(Math.Round(dMonths));

            return months;
        }

        protected void showLastSurvey(DataRow LastSurvey)
        {

            LastSurveyTitle.Text = "Most Recent Survey: " + LastSurvey[BOL.Survey.SurveyDateText].ToString();


            if (!string.IsNullOrEmpty(LastSurvey[BOL.Survey.SurveyDate].ToString()))
            {
                DateTime d = (DateTime)LastSurvey[BOL.Survey.SurveyDate];
                string t = TimeSpanLongString(d, DateTime.Now);
                if (t.Length > 0) LastSurveyTitle.Text += " (" + t + " ago)";

            }

            if (!string.IsNullOrEmpty(LastSurvey["PainScore"].ToString())) PainLabel.Text = LastSurvey["PainScore"].ToString();
            if (!string.IsNullOrEmpty(LastSurvey["FatigueScore"].ToString())) FatigueLabel.Text = LastSurvey["FatigueScore"].ToString();
            if (!string.IsNullOrEmpty(LastSurvey["QOLScore"].ToString())) QOLLabel.Text = LastSurvey["QOLScore"].ToString();
            if (!string.IsNullOrEmpty(LastSurvey["ActivityLevel"].ToString())) ActivityLabel.Text = LastSurvey["ActivityLevel"].ToString();
            if (!string.IsNullOrEmpty(LastSurvey["BowelFunction"].ToString())) BowelFunctionLabel.Text = LastSurvey["BowelFunction"].ToString();
            if (!string.IsNullOrEmpty(LastSurvey["AnxietyWithCancer"].ToString())) AnxietyLabel.Text = LastSurvey["AnxietyWithCancer"].ToString();
            if (!string.IsNullOrEmpty(LastSurvey["Complications"].ToString())) ComplicationsSinceLastSurveyLabel.Text = LastSurvey["Complications"].ToString();


        }


        private void BindSeries(CaisisChart chart, Series series, DataView points, string currentSurvey)
        {
            series.Points.DataBind(points, "MonthsSinceSurgery", "SurveyScore", "");
//            chart.ChartAreas[0].AxisY.Minimum = YAxisMin[currentSurvey];
//            chart.ChartAreas[0].AxisY.Maximum = YAxisMax[currentSurvey];
            chart.ChartAreas[0].AxisY.Interval = (chart.ChartAreas[0].AxisY.Maximum <= 10) ? 1 : ((chart.ChartAreas[0].AxisY.Maximum <= 30) ? 5 : 10);

//            chart.ChartAreas[0].AxisX.MajorTickMark.Interval = ((int)points[points.Count - 1]["MonthsSinceSurgery"] >= 6) ? 6 : 1;
            chart.ChartAreas[0].AxisX.LabelStyle.Interval = ((int)points[points.Count - 1]["MonthsSinceSurgery"] >= 6) ? 6 : 1;
            chart.ChartAreas[0].AxisX.LabelStyle.Angle = 0;
            chart.ChartAreas[0].AxisX.Minimum = 0;
            chart.ChartAreas[0].AxisX.Title = "Months Since Surgery";

                
        }

        private Series BuildSeries(CaisisChart chart, string scaleName)
        {
            chart.Titles[0].Font = DEFAULT_FONT;
            // create new series
            Series series = new Series(scaleName);
            series.ChartArea = "MainArea";
            series.ChartType = SeriesChartType.Line;
            series.Color = GetNextColor();
            series.BorderWidth = 2;
            series.MarkerStyle = MarkerStyle.Circle;
            series.MarkerColor = System.Drawing.ColorTranslator.FromHtml("#000000"); //COLOR_WHEEL[0];
            series.MarkerSize = 7;
            series["ShowMarkerLines"] = "False";
            series.LabelFormat = "";
            series.IsValueShownAsLabel = false;
            series.SmartLabelStyle.Enabled = true;
            series.LabelAngle = 0;
            series.Font = new Font(FontFamily.GenericSansSerif, 7, FontStyle.Regular);
            series.LabelForeColor = Color.Black;
            //            series.XValueType = ChartValueType.DateTime;
            series.XValueType = ChartValueType.Int32;
            chart.Series.Add(series);

            return series;
        }


    }
}
