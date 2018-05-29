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

namespace Caisis.UI.Modules.Colorectal.PaperForms
{
    public partial class StomaSurvey : BasePaperFormControl
    {
        private SurveyDa da = new SurveyDa();

        private string _reportTitle = "";

        private DateTime LastSurgeryDate = DateTime.MinValue;

        private bool PatientIsFemale = false;


        #region DefinitionsAndDictionaries;

        private static readonly string StomaMale = "Stoma Male";
        private static readonly string StomaFemale = "Stoma Female";
        private static readonly string NoStomaMale = "No Stoma Male";
        private static readonly string NoStomaFemale = "No Stoma Female";
        private readonly string[] EnteredSurveys = new string[]
        {
            StomaMale, StomaFemale, NoStomaMale, NoStomaFemale
        };

        private static readonly string BowelFunction = "Bowel Function";
        private static readonly string BladderFunction = "Bladder Function";
        private static readonly string SexualFunctionMale = "Sexual Function Male";
        private static readonly string SexualFunctionFemale = "Sexual Function Female";
        private static readonly string QualityOfLife = "Quality of Life";

        private static readonly string PostChemoFlag = " (Post-Chemo)";
        private static readonly string PostOpFlag = " (Post-Op)";
        private static readonly string BaselineFlag = " (Baseline)";
        private static readonly string BFQStr = "Colorectal BFQ";

        private static readonly int questionTotalValue = 5; // all questions worth 5 points right now






        private readonly string[] CollectedSurveys = new string[]
        {
 //           BladderFunction, SexualFunctionMale, SexualFunctionFemale, BowelFunction, QualityOfLife
            BowelFunction, QualityOfLife, BladderFunction, SexualFunctionMale, SexualFunctionFemale
        };


        /// <summary>
        /// SurveyNum Prefix codes from STAR
        /// </summary>
        private static IDictionary<string, string> PrefixCodes = new Dictionary<string, string>
        {
            { BowelFunction, "BFI"},
            { BladderFunction, "B" },
            { SexualFunctionMale, "MS" },
            { SexualFunctionFemale, "FS" },
            { QualityOfLife, "QL"}
        };

        /// <summary>
        /// Min Number of Responses
        /// </summary>
        private static IDictionary<string, int> RequiredResponseCount = new Dictionary<string, int>
        {
            { BowelFunction, 6},
            { BladderFunction, 2 },
            { SexualFunctionMale, 3 },
            { SexualFunctionFemale, 4 },
            { QualityOfLife, 0}
        };

        /// <summary>
        /// Y min on chart
        /// </summary>
        private static IDictionary<string, int> YAxisMin = new Dictionary<string, int>
        {
            { BowelFunction, 0 },
            { BladderFunction, 0 },
            { SexualFunctionMale, 0 },
            { SexualFunctionFemale, 0 },
            { QualityOfLife, 0}
        };

        /// <summary>
        /// Y max on chart
        /// </summary>
        private static IDictionary<string, int> YAxisMax = new Dictionary<string, int>
        {
            { BowelFunction, 100 },
            { BladderFunction, 15 },
            { SexualFunctionMale, 30 },
            { SexualFunctionFemale, 35 },
            { QualityOfLife, 100}
        };

        /// <summary>
        /// Optional custom Y axis title on chart
        /// </summary>
        private static IDictionary<string, string> YAxisCustomLabel = new Dictionary<string, string>
        {
            { BowelFunction, ""},
            { BladderFunction, ""},
            { SexualFunctionMale, ""},
            { SexualFunctionFemale, ""},
            { QualityOfLife, "HealthScale Score"}
        };


        //<summary>
        //TotalNumberOfQuestions
        //</summary>
        private static IDictionary<string, int> TotalNumberOfQuestions = new Dictionary<string, int>
        {
            { StomaMale + BowelFunction, 10},
            { StomaMale + BladderFunction, 2},
            { StomaMale + SexualFunctionMale, 5},
            { StomaMale + SexualFunctionFemale, 0},
            { StomaMale + QualityOfLife, 5},

            { StomaFemale + BowelFunction, 10},
            { StomaFemale + BladderFunction, 2},
            { StomaFemale + SexualFunctionMale, 0},
            { StomaFemale + SexualFunctionFemale, 6},
            { StomaFemale + QualityOfLife, 5},

            { NoStomaMale + BowelFunction, 19},
            { NoStomaMale + BladderFunction, 2},
            { NoStomaMale + SexualFunctionMale, 5},
            { NoStomaMale + SexualFunctionFemale, 0},
            { NoStomaMale + QualityOfLife, 5},

            { NoStomaFemale + BowelFunction, 19},
            { NoStomaFemale + BladderFunction, 2},
            { NoStomaFemale + SexualFunctionMale, 0},
            { NoStomaFemale + SexualFunctionFemale, 6},
            { NoStomaFemale + QualityOfLife, 5}
        };


        /// <summary>
        /// RequiredResponseCountByPair
        /// </summary>
        private static IDictionary<string, int> RequiredResponseCountByPair = new Dictionary<string, int>
        {
            { StomaMale + BowelFunction, 6},
            { StomaMale + BladderFunction, 2},
            { StomaMale + SexualFunctionMale, 3},
            { StomaMale + SexualFunctionFemale, 0},
            { StomaMale + QualityOfLife, 0},
            { StomaFemale + BowelFunction, 6},
            { StomaFemale + BladderFunction, 2},
            { StomaFemale + SexualFunctionMale, 0},
            { StomaFemale + SexualFunctionFemale, 4},
            { StomaFemale + QualityOfLife, 0},
            { NoStomaMale + BowelFunction, 10},
            { NoStomaMale + BladderFunction, 2},
            { NoStomaMale + SexualFunctionMale, 3},
            { NoStomaMale + SexualFunctionFemale, 0},
            { NoStomaMale + QualityOfLife, 0},
            { NoStomaFemale + BowelFunction, 10},
            { NoStomaFemale + BladderFunction, 2},
            { NoStomaFemale + SexualFunctionMale, 0},
            { NoStomaFemale + SexualFunctionFemale, 4},
            { NoStomaFemale + QualityOfLife, 0}
        };

        private static readonly string Frequency = "Frequency";
        private static readonly string Diet = "Diet";
        private static readonly string Urgency = "Urgency";
        private readonly string[] Subscores_Bowel = new string[]
        {
            Frequency, Diet, Urgency
        };

        /// <summary>
        /// Bowel Subscore Categorization
        /// </summary>
        private static IDictionary<int, string> SubscoreCategory_BowelFunction = new Dictionary<int, string>
        {
            { 1, Frequency },
            { 2, Diet },
            { 3, Diet },
            { 4, "" },
            { 5, Frequency },
            { 6, "" },
            { 7, "" },
            { 8, Frequency },
            { 9, Frequency },
            { 10, Frequency },
            { 11, Frequency },
            { 12, "" },
            { 13, Diet },
            { 14, Diet },
            { 15, Urgency },
            { 16, Urgency },
            { 17, Urgency },
            { 18, Urgency },
            { 19, "" }
        };



        /// <summary>
        /// QOL score - use "inverse" of database value for question score? true/false
        /// </summary>
        private static IDictionary<int, bool> InverseScoredQuestion_QualityOfLife = new Dictionary<int, bool>
        {
            { 1, true },
            { 2, true },
            { 3, true },
            { 4, true },
            { 5, true }
        };



        /// <summary>
        /// Bowel score - use "inverse" of database value for question score? true/false
        /// </summary>
        private static IDictionary<int, bool> InverseScoredQuestion_BowelFunction = new Dictionary<int, bool>
        {
            { 1, false },
            { 2, true },
            { 3, true },
            { 4, false },
            { 5, false },
            { 6, true },
            { 7, false },
            { 8, true },
            { 9, true },
            { 10, true },
            { 11, false },
            { 12, false },
            { 13, true },
            { 14, true },
            { 15, true },
            { 16, true },
            { 17, true },
            { 18, true },
            { 19, false }
        };




        /// <summary>
        /// String to numeric translation (NO INVERSE APPLIED, if inverse is required apply after translation)
        /// </summary>
        private static IDictionary<string, int> SurveyAnswerStringToNumTranslation = new Dictionary<string, int>
        {
            { "Always", 5 },
            { "Most of the time", 4 },
            { "Sometimes", 3 },
            { "Rarely", 2 },
            { "Never", 1 }
        };



        private static readonly string Mobility = "Mobility";
        private static readonly string SelfCare = "Self-Care";
        private static readonly string UsualActivities = "Usual Activities";
        private static readonly string PainDiscomfort = "Pain/Discomfort";
        private static readonly string AnxietyDepression = "Anxiety/Depression";
        private readonly string[] Subscores_QualityOfLife = new string[]
        {
            Mobility, SelfCare, UsualActivities, PainDiscomfort, AnxietyDepression
        };
        
        

        /// <summary>
        /// QOL Subscore Categorization
        /// </summary>
        private static IDictionary<int, string> SubscoreCategory_QualityOfLife = new Dictionary<int, string>
        {
            { 1, Mobility },
            { 2, SelfCare },
            { 3, UsualActivities },
            { 4, PainDiscomfort },
            { 5, AnxietyDepression },
            { 6, "" }
        };






        
        /// <summary>
        /// A list of Primary Procedures, considered Major resections
        /// </summary>
        private static List<string> PRIMARY_PROCEDURES = new List<string>
        {
            { "LAR" },
            { "Abdomino-Perineal Resection" },
            { "Abdominal Perineal Resection" },
            { "Ileostomy Closure" },
            { "Colectomy" },
            { "Right Hemicolectomy" },
            { "Extended Right Hemicolectomy" },
            { "Left Hemicolectomy" },
            { "Extended Left Hemicolectomy" },
            { "Subtotal Colectomy" },
            { "Anterior/Sigmoid Resection" },
            { "Hartmann Colectomy" },
            { "Sigmoid Resection" },
            { "Subtotal Colectomy" },
            { "Total Abdominal Colectomy" },
            { "Transanal excision" },
            { "Transanal excision rectal tumor" },
            { "Transanal microsurgery" },
            { "Transanal Endo Microsurg (TAMIS)" },
            { "Total proctocolectomy with end ileostomy" },
            { "Proctocolectomy" },
            { "Low Anterior Resection" },
            { "LAR/CAA" },
            { "LAR / CAA" }
        };



        /// <summary>
        /// A list of Secondary Procedures
        /// </summary>
        private static List<string> SECONDARY_PROCEDURES = new List<string>
        {
            { "Ileostomy Closure" },
            { "Colostomy Closure" },
            { "Hartmann Closure" }
        };

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
//                BuildCharts();
                BuildAllCharts();
            }
        }


        /// <summary>
        /// For the current Patient, build the BreastQ report
        /// </summary>
        public virtual void BuildReport()
        {
            // build patient details
            BuildProcedureDetails(this, base.patientID);
//            this.getLastSurvey();
        }



        /// <summary>
        /// Populate the Patient's Procedure details
        /// </summary>
        /// <param name="panel"></param>
        /// <param name="patientId"></param>
        private void BuildProcedureDetails(Control panel, int patientId)
        {

            // patient demographics - get gender
            BOL.Patient pt = new BOL.Patient();
            pt.Get(patientId);

            DataView pv = new BOL.Patient[] { pt }.AsDataView();
            if (pv[0][BOL.Patient.PtGender].ToString().ToUpper().Contains("FEMALE")) PatientIsFemale = true;


            //status
            //StatusDa sDa = new StatusDa();
            //DataSet sDs = sDa.GetStatus(patientID, "Colorectal");

            //if (sDs.Tables.Count > 0 && sDs.Tables[0].Rows.Count > 0)
            //{
            //    DataView sDv = sDs.Tables[0].DefaultView;
            //    sDv.Sort = "" + BOL.Status.StatusDate + " DESC";

            //    DataRow lastStatus = sDs.Tables[0].Rows[0];

            //    string dateStr = (lastStatus[BOL.Status.StatusDateText].ToString().Length > 0) ? lastStatus[BOL.Status.StatusDateText].ToString() : "Date N/A";

            //    ColorectalStage.Text = "Colorectal - " + lastStatus[BOL.Status.Status_Field] + " (" + dateStr + ")";
            //}


           // clinstage
            ClinicalStageDa csDa = new ClinicalStageDa();
            DataTable csDt = csDa.GetClinicalStages(patientID, "Colorectal");

            if (csDt.Rows.Count > 0)
            {
                DataView csDv = csDt.DefaultView;
                csDv.Sort = BOL.ClinicalStage.ClinStageDate + " DESC";

                DataRow lastClinicalStage = csDv.ToTable().Rows[0];

                string dateStr = (lastClinicalStage[BOL.ClinicalStage.ClinStageDateText].ToString().Length > 0) ? lastClinicalStage[BOL.ClinicalStage.ClinStageDateText].ToString() : "Date N/A";

                ColorectalStage.Text = lastClinicalStage[BOL.ClinicalStage.ClinStageDisease].ToString() + " - " + lastClinicalStage[BOL.ClinicalStage.ClinStageT].ToString() + " " + lastClinicalStage[BOL.ClinicalStage.ClinStageN].ToString() + " " + lastClinicalStage[BOL.ClinicalStage.ClinStageM].ToString() +  " (" + dateStr + ")";
            }






            try
            {
            // procedure
                var allProcedures = BusinessObject.GetByFields<Procedure>(new Dictionary<string, object> { { Procedure.PatientId, patientID } });

            // filter procedures by ProcName
            var procedures = from procedure in allProcedures
                             let procName = procedure[Procedure.ProcName].ToString()
                             let dateTxt = procedure[Procedure.ProcDateText].ToString()
                             let d = (DateTime)(procedure[Procedure.ProcDate])
                             where (PRIMARY_PROCEDURES.Any(str => str.ToUpper().Contains(procName.ToUpper())))
                             group procedure by new { procName = procName, dateTxt = dateTxt, date = d } into g
                             orderby g.Key.date ascending
                             select g.First();



            Label procLabel = panel.FindControl("ProceduresLabel") as Label;
            IEnumerable<IBusinessObject> iProc = procedures.Cast<IBusinessObject>();

                //this is moved inside of the foreach
            //string procLabelTxt = FormatListOutput(Procedure.ProcName, Procedure.ProcDate, iProc);
            //if (procLabelTxt.Length > 0) procLabel.Text = procLabelTxt;


            if (iProc.Count() > 0)
            {
                List<string> procs = new List<string>();


                DataTable procTable = ProcTable();



                foreach (Procedure p in iProc)  // build procedure list and show last value for ColorectalProc>ProcTumorAnalVerge
                {
                    string procDisplayStr = p[BOL.Procedure.ProcName].ToString();
                    string procDateDisplayString = " (" + p[BOL.Procedure.ProcDateText].ToString() + ")";
                    bool procHasColorectalProc = false;
                    IEnumerable<IBusinessObject> c = BusinessObject.GetByParent("ColorectalProc", (int)p[BOL.Procedure.ProcedureId]);

                    if (c != null && c.Count<IBusinessObject>() > 0)
                    {
                        procHasColorectalProc = true;

                        string level = c.First<IBusinessObject>()[BOL.ColorectalProcedure.ProcTumorAnalVerge].ToString();
                        if (level.Length > 0) LevelOfTumor.Text = level + "cm" + procDateDisplayString;

                        string height = c.First<IBusinessObject>()[BOL.ColorectalProcedure.ProcAnastAnalVergeDist].ToString();
                        if (height.Length > 0) HeightOfAnastomosis.Text = height + "cm" + procDateDisplayString;

                        //string location = c.First<IBusinessObject>()[BOL.ColorectalProcedure.ProcTumorLocation].ToString();
                        //if (location.Length > 0) TumorLocation.Text = location + procDateDisplayString;

                        //string jpouch = c.First<IBusinessObject>()[BOL.ColorectalProcedure.ProcPouchSize].ToString();
                        //if (jpouch.Length > 0) Jpouch.Text = jpouch + "cm" + procDateDisplayString;

                        //string staple = c.First<IBusinessObject>()[BOL.ColorectalProcedure.ProcStaplerType].ToString();
                        //if (staple.Length > 0) Staple.Text = staple + procDateDisplayString;

                        string anatomy = c.First<IBusinessObject>()[BOL.ColorectalProcedure.ProcAnatomy].ToString();
                        if (anatomy.Length > 0) Anatomy.Text = anatomy + procDateDisplayString;

                        string anastomosis = c.First<IBusinessObject>()[BOL.ColorectalProcedure.ProcAnast].ToString();
                        if (anastomosis.Length > 0) Anastomosis.Text = anastomosis + procDateDisplayString;

                        string LADiversion = c.First<IBusinessObject>()[BOL.ColorectalProcedure.ProcLA_Diversion].ToString();
                        if (LADiversion.Length > 0) procDisplayStr += "/" + LADiversion;
                    }

//                    procs.Add(procDisplayStr + procDateDisplayString);

                    procs = AddProcToList(procs, procDisplayStr, procDateDisplayString, procHasColorectalProc);
                    procTable = AddProc(procTable, procDisplayStr, (DateTime)p[BOL.Procedure.ProcDate], procDateDisplayString, procHasColorectalProc);
                }

//                procLabel.Text = string.Join(", ", procs.ToArray());

                if (procTable.Rows.Count > 0)
                {
                    var a = from DataRow row in procTable.Rows
                                select (string)row["procTotalDisplayString"];
                    string[] procTotalDisplayArr = a.ToArray();
                    procLabel.Text = string.Join(", ", procTotalDisplayArr.ToArray());
                }

                //proctemp.DataSource = procTable.DefaultView;
                //proctemp.DataBind();

            }

            if (iProc.Count() > 0 && iProc.Last<IBusinessObject>()[BOL.Procedure.ProcDate].ToString().Length > 0)
             {
                 LastSurgeryDate = (DateTime)iProc.Last<IBusinessObject>()[BOL.Procedure.ProcDate];
                 int diff = (DateTime.Now - LastSurgeryDate).Days;
                 if (diff > 365)
                 {
                     int years = (int)(Math.Floor(diff / 365.25));
                     int extraMonthDays = (int)(Math.Floor(diff % (365.25)));
                     int months = (int)(Math.Floor(extraMonthDays / (365.25 / 12)));
                     int extraDays = (int)(Math.Round(extraMonthDays % (365.25 / 12)));
                     TimeFromLastSurgery.Text = years.ToString() + " yr, " + months.ToString() + " mo, " + extraDays + " days";
                 }
                 else if (diff > 30)
                 {
                     int months = (int)(Math.Floor(diff / (365.25 / 12)));
                     int extraDays = (int)(Math.Round(diff % (365.25 / 12)));
                     TimeFromLastSurgery.Text = months.ToString() + " months, " + extraDays + " days";
                 }
                 else
                 {
                     TimeFromLastSurgery.Text = diff.ToString() + " days";
                 }
             }

            }
            catch (Exception ex)
            {
                ExceptionHandler.Publish(ex);
            }


            try
            {
                // radiation
                var radiation = BusinessObject.GetByFields<RadiationTherapy>(new Dictionary<string, object> { { RadiationTherapy.PatientId, patientID } }).Cast<IBusinessObject>();
                Label radiationLabel = panel.FindControl("RadiationLabel") as Label;
                string radiationLabelTxt = FormatTreatmentListOutput(RadiationTherapy.RadTxType, RadiationTherapy.RadTxDate, RadiationTherapy.RadTxStopDate, radiation);
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

            foreach (IBusinessObject i in chemo) { if (i[MedicalTherapy.MedTxAgent].ToString().Length < 1) i[MedicalTherapy.MedTxAgent] = i[MedicalTherapy.MedTxType].ToString(); }

            Label chemoLabel = panel.FindControl("ChemotherapyLabel") as Label;
            string chemoLabelTxt = FormatTreatmentListOutput(MedicalTherapy.MedTxAgent, MedicalTherapy.MedTxDate, MedicalTherapy.MedTxStopDate, chemo);
            if (chemoLabelTxt.Length > 0) chemoLabel.Text = chemoLabelTxt;


            }
            catch (Exception ex3)
            {
                ExceptionHandler.Publish(ex3);
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

        /// <summary>
        /// Create a specialized csv list of treatments with Start and Stop Dates
        /// </summary>
        /// <param name="displayField"></param>
        /// <param name="dateField"></param>
        /// <param name="dataSource"></param>
        /// <returns></returns>
        private string FormatTreatmentListOutput(string displayField, string dateField, string stopDateField, IEnumerable<IBusinessObject> dataSource)
        {
            var outputValues = from row in dataSource
                               let displayValue = row[displayField].ToString()
                               let dateHasValue = !row.IsNull(dateField)
                               let dateValue = dateHasValue ? ((DateTime)row[dateField]).ToShortDateString() : ""
                               let stopDateHasValue = !row.IsNull(stopDateField)
                               let stopDateValue = stopDateHasValue ? ((DateTime)row[stopDateField]).ToShortDateString() : ""
                               //                             orderby dateHasValue ? (DateTime)row[dateField] : DateTime.MinValue descending
                               select (!string.IsNullOrEmpty(dateValue) || !string.IsNullOrEmpty(stopDateValue)) ? displayValue + " (" + dateValue + "-" + stopDateValue + ")" : displayValue;
            if (outputValues.Count() == 0)
                return "";
            else
                return string.Join(", ", outputValues.ToArray());

        }


        //protected void getLastSurvey()
        //{

        //    DataTable dt = da.GetMostRecentSurveyWithItemsByType(this.patientID, "%STOMA%");

        //    if (dt.Rows.Count > 0)
        //    {
        //        DataView dv = dt.DefaultView;
        //        SurveyResponsesRepeater.DataSource = dt.DefaultView;
        //        SurveyResponsesRepeater.DataBind();

        //        LastSurveyTitle.Text = "Last Survey: " + dv[0][BOL.Survey.SurveyType].ToString() + " (" + dv[0][BOL.Survey.SurveyDateText].ToString() + ")";
        //        NoSurveyMsg.Visible = false;
        //    }
        //}

        private DataTable AllStomaSurveys()
        {
            DataTable dt = da.GetSurveysAndItemsByType(patientID, "%STOMA%", null, null);

/*
            DataView dv = new DataView(dt);
            dv.RowFilter = BOL.Survey.SurveyType + " LIKE '%" + PostChemoFlag + "' or " + BOL.Survey.SurveyType + " LIKE '%" + BaselineFlag + "'";
            if (dv.Count < 1)
            {
                // add BFQ results, which is a complete bowel function survey
                DataTable dtBFQ = da.GetSurveysAndItemsByType(patientID, "Colorectal BFQ", null, null);
                if (dtBFQ.Rows.Count > 0)
                {
                    foreach (DataRow r in dtBFQ.Rows)
                    {
                        if (r[BOL.SurveyItem.SurveyItemNum].ToString().Length > 0 && r[BOL.SurveyItem.SurveyItemNum].ToString().IndexOf(PrefixCodes[BowelFunction]) != 0) r[BOL.SurveyItem.SurveyItemNum] = (PrefixCodes[BowelFunction] + r[BOL.SurveyItem.SurveyItemNum].ToString());
                        r[BOL.Survey.SurveyType] = NoStomaMale; // set as NoStomaMale since that case also has all 19 bowel questions

                    }
                    dt.Merge(dtBFQ);
                }
            }
 */




            // add BFQ results, which is a complete bowel function survey
            DataTable dtBFQ = da.GetSurveysAndItemsByType(patientID, "Colorectal BFQ", null, null);
            if (dtBFQ.Rows.Count > 0)
            {

                DataView dvBFQ = new DataView(dtBFQ);



                //filter out BFQ results on the same date as a PostChemo or Baseline survey
                // get PostChemo and Baseline survey dates
                DataView dv = new DataView(dt);
                dv.RowFilter = BOL.Survey.SurveyType + " LIKE '%" + PostChemoFlag + "' or " + BOL.Survey.SurveyType + " LIKE '%" + BaselineFlag + "' AND (Isnull(" + BOL.Survey.SurveyDateText + ",'') = '')";

                if (dv.Count > 0)
                {
                    DataTable PostChemoAndBaselineDates = dv.ToTable(true, BOL.Survey.SurveyDateText);
                    List<string> PostChemoAndBaselineDateList = (from row in PostChemoAndBaselineDates.AsEnumerable()
                                                                 select row.Field<string>(BOL.Survey.SurveyDateText)).ToList<string>();

                    if (PostChemoAndBaselineDateList.Count > 0) dvBFQ.RowFilter = BOL.Survey.SurveyDateText + " NOT IN ('" + string.Join("','", PostChemoAndBaselineDateList.ToArray()) + "')";
                }




                    if (dvBFQ.Count > 0)
                    {
                        DataTable filteredBFQ = dvBFQ.ToTable();

                        foreach (DataRow r in filteredBFQ.Rows)
                        {
                            if (r[BOL.SurveyItem.SurveyItemNum].ToString().Length > 0 && r[BOL.SurveyItem.SurveyItemNum].ToString().IndexOf(PrefixCodes[BowelFunction]) != 0) r[BOL.SurveyItem.SurveyItemNum] = (PrefixCodes[BowelFunction] + r[BOL.SurveyItem.SurveyItemNum].ToString());
                            r[BOL.Survey.SurveyType] = NoStomaMale; // set as NoStomaMale since that case also has all 19 bowel questions
                        }
                        dt.Merge(filteredBFQ);

                    }


            }

            return dt;
        }


        



        protected void BuildAllCharts()
        {
            DataTable allSurveys = AllStomaSurveys();

            if (allSurveys.Rows.Count > 0)
            {

                charts_rpt.DataSource = CollectedSurveys;
                charts_rpt.DataBind();

            }
        }

        protected void BuildChart(Object Sender, RepeaterItemEventArgs e)
        {

            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                string currentSurvey = (e.Item.DataItem).ToString();

                if (!((currentSurvey.Equals(SexualFunctionMale) && PatientIsFemale) || (currentSurvey.Equals(SexualFunctionFemale) && !PatientIsFemale))) //only show sexual function chart for correct gender
                {



                    //if (currentSurvey != QualityOfLife)
                    //{
                    DataTable allSurveys = AllStomaSurveys();
                    DataView dv = new DataView(allSurveys);

                    string SurveyTypeFilter = BOL.SurveyItem.SurveyItemNum + " LIKE '" + PrefixCodes[currentSurvey] + "%'";

                    // special case for bowel because they have asked us not to include any BFI19 surveyItems
                    if (currentSurvey == BowelFunction) SurveyTypeFilter += " AND " + BOL.SurveyItem.SurveyItemNum + " <> 'BFI19'";
                    // special case for bladder because bladder and bowel prefixes are similar
                    else if (currentSurvey == BladderFunction) SurveyTypeFilter = BOL.SurveyItem.SurveyItemNum + " LIKE '" + PrefixCodes[currentSurvey] + "%' and " + BOL.SurveyItem.SurveyItemNum + " NOT LIKE '" + PrefixCodes[BowelFunction] + "%'";
                    // special case for QOL because HealthScale !=
                    else if (currentSurvey == QualityOfLife) SurveyTypeFilter = "(" + BOL.SurveyItem.SurveyItemNum + " LIKE '" + PrefixCodes[currentSurvey] + "%' or " + BOL.SurveyItem.SurveyItemNum + " LIKE '%Health%')";


                    dv.RowFilter = SurveyTypeFilter;  // all survey items of specified type
                    dv.Sort = BOL.Survey.SurveyDate + " ASC";

                    //if (dv.Count > 0)
                    //{
                    NoSurveyMsg.Visible = false;
                    ChartTableRow.Visible = true;

                    DataTable surveyDates = dv.ToTable(true, BOL.Survey.SurveyDate); // all dates for this survey

                    DataTable surveyScores = new DataTable();
                    surveyScores.Columns.Add(new DataColumn("SurveyDateText", typeof(string)));
                    surveyScores.Columns.Add(new DataColumn("SurveyDate", typeof(DateTime)));
                    surveyScores.Columns.Add(new DataColumn("MonthsSinceSurgery", typeof(int)));
                    surveyScores.Columns.Add("SurveyScore");

                    DataView subscoresView = new DataView();
                    foreach (DataRow dr in surveyDates.Rows)  // iterate through each date
                    {
                        dv.RowFilter = SurveyTypeFilter + " AND " + BOL.Survey.SurveyDate + " = #" + ((DateTime)dr[BOL.Survey.SurveyDate]).ToShortDateString() + "#";

                        if (dv.Count > 0)
                        {
                            string SurveyType = CleanSurveyType(dv[0][BOL.Survey.SurveyType].ToString());
                            if (SurveyType.Length > 0 && dv.Count >= RequiredResponseCountByPair[(SurveyType + currentSurvey)])  // check for Min number of answered questions
                            {
                                DataTable CurrentSurveyItemsForThisDate = dv.ToTable();
                                // Bowel & QOL surveys have inversed values
                                if (currentSurvey == BowelFunction || currentSurvey == QualityOfLife) CurrentSurveyItemsForThisDate = ProcessSpecialSurveyItems(CurrentSurveyItemsForThisDate, currentSurvey);
                                // Check for any "special case" where a point should not be added.  Only QOL so far
                                if (NoSpecialExceptions(CurrentSurveyItemsForThisDate, currentSurvey))
                                {
                                    int score = SurveyScore(SurveyType, currentSurvey, CurrentSurveyItemsForThisDate);

                                    DataRow newPoint = surveyScores.NewRow();
                                    newPoint["SurveyDateText"] = dv[0][BOL.Survey.SurveyDateText].ToString();
                                    newPoint["SurveyDate"] = ((DateTime)dv[0][BOL.Survey.SurveyDate]);
                                    newPoint["MonthsSinceSurgery"] = MonthsSinceLastSurgery((DateTime)dv[0][BOL.Survey.SurveyDate]);
                                    newPoint["SurveyScore"] = score;
                                    surveyScores.Rows.Add(newPoint);

                                    // show last total score for Bowel only
                                    if (currentSurvey == BowelFunction)
                                    {
                                        HtmlTableRow LastTotalScoreDisplayContainer = (HtmlTableRow)e.Item.FindControl("LastTotalScoreDisplayContainer");
                                        Label LastTotalScoreDisplay = (Label)e.Item.FindControl("LastTotalScoreDisplay");
                                        LastTotalScoreDisplayContainer.Visible = true;
                                        LastTotalScoreDisplay.Text = score.ToString() + " / " + (dv.Count * questionTotalValue).ToString();
                                    }
                                }
                                // collect subscores. only bowel function and QOL have subscores right now.
                                if (currentSurvey == BowelFunction || currentSurvey == QualityOfLife) subscoresView = AddSubScores(currentSurvey, CurrentSurveyItemsForThisDate);
                            }
                        }
                    }

                    if (subscoresView.Count > 0)
                    {
                        Repeater SubScores = (Repeater)e.Item.FindControl("SubScores");
                        SubScores.DataSource = subscoresView;
                        SubScores.DataBind();
                    }


                    CaisisChart SurveyChart = (CaisisChart)e.Item.FindControl("SurveyChart");

                    var series = BuildSeries(SurveyChart, currentSurvey);
                    BindSeries(SurveyChart, series, surveyScores, currentSurvey);

                }
                else
                {
                    HtmlContainerControl ChartContainer = (HtmlContainerControl)e.Item.FindControl("ChartContainer");
                    ChartContainer.Visible = false;
                }

            }


        }
        
        
        protected int SurveyScore(string SurveyType, string CurrentMeasure, DataTable Survey)
        {
            int score = 0;
            List<int> responses = new List<int>();

            // QOL & Bowel are scored differently

            if (CurrentMeasure.Equals(QualityOfLife))
            {
                DataView qolDv = new DataView(Survey);
                qolDv.RowFilter = SurveyItem.SurveyItemNum + " LIKE '%Health%'";
                if (qolDv.Count > 0)
                {
                    int num = 0;
                    if (int.TryParse(qolDv[0][BOL.SurveyItem.SurveyItemResult].ToString(), out num))
                    {
                        score = num;
                    }
                }
            }
            else
            {
                foreach (DataRow dr in Survey.Rows)
                {
                    int num = 0;
                    if (int.TryParse(dr[BOL.SurveyItem.SurveyItemResult].ToString(), out num))
                    {
                        score += num;
                        responses.Add(num);
                    }
                }

                int numResponses = responses.Count;

                if (numResponses < TotalNumberOfQuestions[SurveyType + CurrentMeasure])
                {
                    int responsesToAdd = TotalNumberOfQuestions[SurveyType + CurrentMeasure] - numResponses;
                    int meanResponse = Convert.ToInt32(Math.Round((double)(score / numResponses)));

                    score += (meanResponse * responsesToAdd);
                }
            }

            return score;
        }

        protected DataView AddSubScores(string CurrentMeasure, DataTable Survey)
        {
            DataTable SubScores = new DataTable();
            SubScores.Columns.Add(new DataColumn("SubItem", typeof(string)));
            SubScores.Columns.Add(new DataColumn("PatientSubScore", typeof(int)));
            SubScores.Columns.Add(new DataColumn("TotalSubScore", typeof(int)));

                string QuestionNumPrefix = PrefixCodes[CurrentMeasure];

                foreach (DataRow dr in Survey.Rows)
                {
                    int num = 0;
                    int QuestionNum = 0;
                    string QuestionNumStr = dr[BOL.SurveyItem.SurveyItemNum].ToString().Replace(QuestionNumPrefix, "");

                    if ((int.TryParse(dr[BOL.SurveyItem.SurveyItemResult].ToString(), out num)) && (int.TryParse(QuestionNumStr, out QuestionNum)))
                    {
                        string subItemType = CurrentMeasure.Equals(BowelFunction) ? SubscoreCategory_BowelFunction[QuestionNum] : SubscoreCategory_QualityOfLife[QuestionNum];  // only bowel function and QOL at this time.  generalize here if more surveys get subscores.

                        if (subItemType.Length > 0) // no need to add rows for scores with no subScore type
                        {
                            DataRow[] existingRow = SubScores.Select("SubItem = '" + subItemType + "'");

                            if (existingRow.Length > 0)
                            {
                                existingRow.First<DataRow>()["PatientSubScore"] = (int)existingRow.First<DataRow>()["PatientSubScore"] + num;
                                existingRow.First<DataRow>()["TotalSubScore"] = (int)existingRow.First<DataRow>()["TotalSubScore"] + questionTotalValue;
                            }
                            else
                            {
                                DataRow newRow = SubScores.NewRow();
                                newRow["SubItem"] = subItemType;
                                newRow["PatientSubScore"] = num;
                                newRow["TotalSubScore"] = questionTotalValue;
                                SubScores.Rows.Add(newRow);
                            }
                        }

                    }
                }

            DataView SubScoreView = new DataView(SubScores);
            return SubScoreView;

        }

        protected int InverseQuestionScore(int DBScore, int MinValue, int MaxValue)
        {
            //int inverse = 0;
            //double MidValue = ((MaxValue - MinValue) / 2) + MinValue;
            //if (MidValue % 1 == 0) inverse = (int)MidValue * 2 - DBScore; // derived from inverse = ((int)MidValue - DBScore) + (int)MidValue;
            //else inverse = (MaxValue + MinValue - DBScore);

            int inverse = (MaxValue + MinValue - DBScore);  // should work for everything
            return inverse;
        }

        protected int ScoreAvgNumBowelMovements(string DBScore)
        {
            int score = 0;
            double DBScoreDouble = 0;

            if (double.TryParse(DBScore, out DBScoreDouble))
            {
                if (DBScoreDouble < 2) score = 5;
                else if (DBScoreDouble < 3) score = 4;
                else if (DBScoreDouble < 4) score = 3;
                else if (DBScoreDouble < 5.5) score = 2;
                else score = 1;
            }
            return score;
        }

        // Bowel and QOL have some question answer values inversed
        protected DataTable ProcessSpecialSurveyItems(DataTable SurveyItems, string CurrentSurvey)
        {
            string QuestionNumPrefix = PrefixCodes[CurrentSurvey];
            foreach (DataRow dr in SurveyItems.Rows)
            {
                // for bowel some question values need to be "inversed"
                int QuestionNum = 0;
                string QuestionNumStr = dr[BOL.SurveyItem.SurveyItemNum].ToString().Replace(QuestionNumPrefix, "");
                if (int.TryParse(QuestionNumStr, out QuestionNum))
                {
                    // unique case
                    if (CurrentSurvey.Equals(BowelFunction) && QuestionNum.Equals(1) && dr[BOL.SurveyItem.SurveyItemResult].ToString().Length > 0) { dr[BOL.SurveyItem.SurveyItemResult] = ScoreAvgNumBowelMovements(dr[BOL.SurveyItem.SurveyItemResult].ToString()); } // unique case
                    else // all others
                    {

                        //if bowel, check if the SurveyItemResult is a string as found in BFQ Survey and translate to numeric
                        if (CurrentSurvey.Equals(BowelFunction) && dr[BOL.SurveyItem.SurveyItemResult].ToString().Length > 0 && SurveyAnswerStringToNumTranslation.Keys.Contains(dr[BOL.SurveyItem.SurveyItemResult].ToString()))
                        {
                            dr[BOL.SurveyItem.SurveyItemResult] = SurveyAnswerStringToNumTranslation[dr[BOL.SurveyItem.SurveyItemResult].ToString()];
                        }

                        int DBScore = 0;
                        if (int.TryParse(dr[BOL.SurveyItem.SurveyItemResult].ToString(), out DBScore))
                        {
                            // for bowel some question values need to be "inversed"
                            bool isInverse = false;
                            if (int.TryParse(QuestionNumStr, out QuestionNum))
                            {
                                isInverse = (CurrentSurvey.Equals(BowelFunction)) ? (InverseScoredQuestion_BowelFunction.ContainsKey(QuestionNum) ? InverseScoredQuestion_BowelFunction[QuestionNum] : false) : (InverseScoredQuestion_QualityOfLife.ContainsKey(QuestionNum) ? InverseScoredQuestion_QualityOfLife[QuestionNum] : false);
                                    
                            }
                            if (isInverse) { dr[BOL.SurveyItem.SurveyItemResult] = InverseQuestionScore(DBScore, 1, 5); } // just hard coding the min (1) and max (5) values for now
                        }
                        else
                        {
                            dr[BOL.SurveyItem.SurveyItemResult] = "";
                        }
                    }
                }

            }

            return SurveyItems;
        }

        protected bool NoSpecialExceptions(DataTable SurveyItems, string CurrentSurvey)
        {
            bool noExceptions = true;
            
            // only QOL has an odd special exception
            if (CurrentSurvey.Equals(QualityOfLife))
            {
                DataView healthscaleRecords = new DataView(SurveyItems);
                healthscaleRecords.RowFilter = BOL.SurveyItem.SurveyItemNum + " LIKE '%Health%'";

                if (healthscaleRecords.Count < 1) noExceptions = false;
            }

            return noExceptions;
        }

        protected int MonthsSinceLastSurgery(DateTime SurveyDate)
        {
            int months = 0;
            if (LastSurgeryDate > DateTime.MinValue)
            {
                double dMonths = ((SurveyDate - LastSurgeryDate).Days) / (365.25 / 12);
                months = Convert.ToInt32(Math.Round(dMonths));
            }
            return months;
        }

        string CleanSurveyType(string SurveyType)
        {
            string sType = SurveyType;

            if (sType.IndexOf(PostChemoFlag) > -1) { sType = sType.Replace(PostChemoFlag, ""); }
            else if (sType.IndexOf(PostOpFlag) > -1) { sType = sType.Replace(PostOpFlag, ""); }
            else if (sType.IndexOf(BaselineFlag) > -1) { sType = sType.Replace(BaselineFlag, ""); }

//            if (SurveyType == BFQStr) sType = NoStomaMale; // set as NoStomaMale since that case also has all 19 bowel questions

            return sType;
        }


        protected List<string> AddProcToList(List<string> procs, string procDisplayStr, string procDateDisplayString, bool procHasColorectalProc)
        {
            string[] dupeProcs = new string[7] { "LAR/Ileostomy", "LAR/CAA", "LAR / CAA", "Low Anterior Resection", "LAR", "Ileostomy", "Ileostomy Closure" };


            if (procs.Count > 0 && dupeProcs.Contains(procDisplayStr))
            {
                bool needToAddProc = true;
                bool deleteProcInList = false;
                string ProcToDelete = "";

                foreach (string procInList in procs)
                {
                    if (procInList.EndsWith(procDateDisplayString))
                    {
                        foreach (string s in dupeProcs)
                        {
                            if (procInList.StartsWith(s))
                            {
                                if (procHasColorectalProc)
                                {
                                    // if the procedure record has a child colorectalProc record then always use that one
                                    //procs.Remove(procInList);
                                    //deleteProcInList = true;
                                    ProcToDelete = procInList;
                                    break;
                                }
                                else if (Array.IndexOf(dupeProcs, procDisplayStr) < Array.IndexOf(dupeProcs, s))
                                {
                                    // if the new procedure record is earlier in the list than use new one instead
                                    //procs.Remove(procInList);
                                    deleteProcInList = true;
                                    ProcToDelete = procInList;
                                    break;
                                }
                                else { needToAddProc = false; }
                            }
                        }
                    }
                    if (deleteProcInList || !needToAddProc) break;
                }
                if (deleteProcInList) procs.Remove(ProcToDelete);
                if (needToAddProc) procs.Add(procDisplayStr + procDateDisplayString);
            }
            else procs.Add(procDisplayStr + procDateDisplayString);
            return procs;
        }


        protected DataTable ProcTable()
        {
            DataTable Procs = new DataTable();

            DataColumn DateCol = new DataColumn();
            DateCol.ColumnName = BOL.Procedure.ProcDate;
            DateCol.DataType = System.Type.GetType("System.DateTime");
            Procs.Columns.Add(DateCol);

            DataColumn DateTextCol = new DataColumn();
            DateTextCol.ColumnName = BOL.Procedure.ProcDateText;
            Procs.Columns.Add(DateTextCol);

            DataColumn ProcNameCol = new DataColumn();
            ProcNameCol.ColumnName = BOL.Procedure.ProcName;
            Procs.Columns.Add(ProcNameCol);

            DataColumn procDisplayStrCol = new DataColumn();
            procDisplayStrCol.ColumnName = "procDisplayStr";
            Procs.Columns.Add(procDisplayStrCol);

            DataColumn procDateDisplayStringCol = new DataColumn();
            procDateDisplayStringCol.ColumnName = "procDateDisplayString";
            Procs.Columns.Add(procDateDisplayStringCol);

            DataColumn procHasColorectalProcCol = new DataColumn();
            procHasColorectalProcCol.ColumnName = "procHasColorectalProc";
            Procs.Columns.Add(procHasColorectalProcCol);

            DataColumn procTotalDisplayStringCol = new DataColumn();
            procTotalDisplayStringCol.ColumnName = "procTotalDisplayString";
            Procs.Columns.Add(procTotalDisplayStringCol);

            return Procs;
        }

        protected DataTable AddProc(DataTable ProcTable, string ProcName, DateTime d, string procDateDisplayString, bool procHasColorectalProc)
        {
            string[] dupeProcs = new string[5] { "LAR/Ileostomy", "Low Anterior Resection", "LAR", "Ileostomy", "Ileostomy Closure" };
            bool needToAddRow = true;
            if (ProcTable.Rows.Count > 0)
            {
                var dates = from DataRow row in ProcTable.Rows
                        select (DateTime)row[BOL.Procedure.ProcDate];
                DateTime[] existingDates = dates.ToArray();


                if (existingDates.Contains(d) && dupeProcs.Contains(ProcName))
                {
                   
                    foreach (DataRow r in ProcTable.Rows)
                    {
                        if (r[BOL.Procedure.ProcDate].Equals(d) && dupeProcs.Contains(r["procDisplayStr"].ToString()))
                        {
                            needToAddRow = false;
                            if (procHasColorectalProc || (Array.IndexOf(dupeProcs, ProcName) < Array.IndexOf(dupeProcs, r["procDisplayStr"].ToString()))) r["procDisplayStr"] = ProcName;
                        }
                    }
                    
                }

            }
            if (needToAddRow)
            {
                DataRow newProc = ProcTable.NewRow();

                //                    newProc[BOL.Procedure.ProcName] = ProcName;
                newProc[BOL.Procedure.ProcDate] = d;
                newProc["procDisplayStr"] = ProcName;
                newProc["procDateDisplayString"] = procDateDisplayString;
                newProc["procTotalDisplayString"] = ProcName + procDateDisplayString;

                ProcTable.Rows.Add(newProc);
            }

            return ProcTable;
        }


        private void BindSeries(CaisisChart chart, Series series, DataTable pointsTable, string currentSurvey)
        {

            bool graphHasPoints = true;


            // hack to show graph axes even if there are no points to graph.  add a point that is off the visible scale
            if (pointsTable.Rows.Count < 1)
            {
                graphHasPoints = false;
                DataRow newPoint = pointsTable.NewRow();
                newPoint["SurveyDateText"] = DateTime.MinValue.ToShortDateString();
                newPoint["SurveyDate"] = DateTime.MinValue;
                newPoint["MonthsSinceSurgery"] = MonthsSinceLastSurgery(DateTime.MinValue);
                newPoint["SurveyScore"] = -100;
                pointsTable.Rows.Add(newPoint);
            }



            DataView points = new DataView(pointsTable);

            if (LastSurgeryDate > DateTime.MinValue)
            {

                points.Sort = "MonthsSinceSurgery ASC";
                series.Points.DataBind(points, "MonthsSinceSurgery", "SurveyScore", "");
                chart.ChartAreas[0].AxisY.Minimum = YAxisMin[currentSurvey];
                chart.ChartAreas[0].AxisY.Maximum = YAxisMax[currentSurvey];
                chart.ChartAreas[0].AxisY.Interval = (chart.ChartAreas[0].AxisY.Maximum <= 10) ? 1 : ((chart.ChartAreas[0].AxisY.Maximum <= 30) ? 5 : 10);
                if (YAxisCustomLabel[currentSurvey].Length > 0) chart.ChartAreas[0].AxisY.Title = YAxisCustomLabel[currentSurvey];

                //              chart.ChartAreas[0].AxisX.MajorTickMark.Interval = ((int)points[points.Count - 1]["MonthsSinceSurgery"] >= 6) ? 6 : 1;
                chart.ChartAreas[0].AxisX.LabelStyle.Interval = (((int)points[points.Count - 1]["MonthsSinceSurgery"]) >= 6 && ((((int)points[points.Count - 1]["MonthsSinceSurgery"]) - ((int)points[0]["MonthsSinceSurgery"])) > 10)) ? 6 : 1;




                if ((((int)points[0]["MonthsSinceSurgery"]) >= 12 && (points.Count == 1)) || ((((int)points[points.Count - 1]["MonthsSinceSurgery"]) - ((int)points[0]["MonthsSinceSurgery"])) > 24)) chart.ChartAreas[0].AxisX.LabelStyle.Interval = 12;
                else if (points.Count == 2 && (((int)points[points.Count - 1]["MonthsSinceSurgery"]) - ((int)points[0]["MonthsSinceSurgery"])) > 0) chart.ChartAreas[0].AxisX.LabelStyle.Interval = Math.Ceiling((float)((((int)points[points.Count - 1]["MonthsSinceSurgery"]) - ((int)points[0]["MonthsSinceSurgery"]))/2));

//                if (chart.ChartAreas[0].AxisX.LabelStyle.c)

                chart.ChartAreas[0].AxisX.LabelStyle.Angle = 0;
                if (chart.ChartAreas[0].AxisX.Minimum > 0) { chart.ChartAreas[0].AxisX.Minimum = 0; }
                else { chart.ChartAreas[0].AxisX.Minimum = chart.Series[0].Points[0].XValue; }
                //else { chart.ChartAreas[0].AxisX.Minimum = (chart.Series[0].Points[0].XValue < chart.Series[0].Points[chart.Series[0].Points.Count - 1].XValue) ? chart.Series[0].Points[0].XValue : chart.Series[0].Points[chart.Series[0].Points.Count - 1].XValue; }
                chart.ChartAreas[0].AxisX.Title = "Months From Surgery, 0=Surgery Date (" + LastSurgeryDate.ToShortDateString() +")";
            }
            else
            {

                series.Points.DataBind(points, "SurveyDateText", "SurveyScore", "");
                chart.ChartAreas[0].AxisY.Minimum = YAxisMin[currentSurvey];
                chart.ChartAreas[0].AxisY.Maximum = YAxisMax[currentSurvey];
                chart.ChartAreas[0].AxisY.Interval = (chart.ChartAreas[0].AxisY.Maximum <= 10) ? 1 : ((chart.ChartAreas[0].AxisY.Maximum <= 30) ? 5 : 10);
                if (YAxisCustomLabel[currentSurvey].Length > 0) chart.ChartAreas[0].AxisY.Title = YAxisCustomLabel[currentSurvey];


                chart.ChartAreas[0].AxisX.LabelStyle.Angle = 45;
                chart.ChartAreas[0].AxisX.Title = "Survey Date";

            }


            // hide x-axis titles if there are no points
            if (!graphHasPoints)
            {
                chart.ChartAreas[0].AxisX.LabelStyle.Enabled = false;
                chart.ChartAreas[0].AxisX.Title = "";
            }
                
        }

        private Series BuildSeries(CaisisChart chart, string scaleName)
        {
            // set title
            string currentTitle = chart.Titles[0].Text;
            if (string.IsNullOrEmpty(currentTitle))
            {
                chart.Titles[0].Text = scaleName;
            }
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
