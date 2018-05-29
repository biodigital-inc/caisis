using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

using Caisis.BOL;
using Caisis.DataAccess;
using Caisis.UI.Core.Classes;
using Caisis.UI.Modules.Prostate.DataAnalysis;

namespace Caisis.UI.Modules.Prostate.PaperForms
{
    public partial class ActiveSurveillanceSurvivorship : BasePaperFormControl
    {
        private const float DAYS_PER_MONTH = 30.43685f;
        private const float DAYS_PER_YEAR = 365.25f;

        #region properties for display
        public string PatientDisplayName
        {
            get;
            private set;
        }

        public string PatientMRN
        {
            get;
            private set;
        }

        public DateTime? AppointmentDate
        {
            get;
            private set;
        }

        public int PatientAge
        {
            get;
            private set;
        }

        public float MonthsSinceDiagnosis
        {
            get;
            private set;
        }

        public string CurrentPSA
        {
            get;
            private set;
        }

        public string PreDiagnosisPSA
        {
            get;
            private set;
        }

        public int BiopsyPrimaryGleason
        {
            get;
            private set;
        }

        public int BiopsySecondaryGleason
        {
            get;
            private set;
        }

        public string ClinTStage
        {
            get;
            private set;
        }

        public int PositiveCores
        {
            get;
            private set;
        }

        public int TotalCores
        {
            get;
            private set;
        }

        // most recent Active Surveillance Survivorship survey
        public int SurveyId
        {
            get;
            private set;
        }
        public DateTime? LastSurveyDate
        {
            get;
            private set;
        }

        public DateTime? LastBiopsyDate
        {
            get;
            private set;
        }

        #endregion

        protected override void SetFormInfo()
        {
            this._formName = "ActiveSurveillanceSurvivorship";
            this._formTitle = "Active Surveillance Survivorship";
        }

        protected override void Page_Load(object sender, EventArgs e)
        {
            base.Page_Load(sender, e);

            // patient header
            PatientMRN = patientMRN;
            PatientDisplayName = (patientFirstName ?? "") + " " + (patientLastName ?? "");
            AppointmentDate = DateTime.Now;

            // TODO: sanity check - is this patient on active surveillance?
            bool onActiveSurveillance = true;

            if (!onActiveSurveillance)
            {
                // TODO: error message
                return;
            }

            DateTime? dxDate = ProcessBiopsyData(patientID);

            if (!dxDate.HasValue)
            {
                reportTable.Visible = false;
                reportTable2.Visible = false;
                InvalidStatusErrorContainer.Visible = true;
                NoDiagnosisMessage.Visible = true;
                return;
            }

            GraphPSAs(patientID, dxDate.Value);
            // graph AS surveys
            DataTable as_surveys = GraphSurveys(patientID, dxDate.Value);
            // graph prostate qol surveys
            DataTable qol_surveys = GraphSurveys_QOL(patientID, dxDate.Value);
            DisplayLatestSurveyResponses(as_surveys);
        }

        DateTime? ProcessBiopsyData(int patientId)
        {
            DataView diagnosticBiopsy = ActiveSurveillanceDa.GetDiagnositicBiopsy(patientId);

            if (diagnosticBiopsy.Count == 0)
            {
                return null;
            }

            DataView biopsies = ActiveSurveillanceDa.GetBiopsies(patientId);
            DataView clinStage = ActiveSurveillanceDa.GetCurrentClinicalStage(patientId);

            DataRowView dx = diagnosticBiopsy[0];
            DateTime dxDate = (DateTime) dx["ProcDate"];
            DateTime now = DateTime.Now;

            PatientAge = (int) dx["PtAge"];
            MonthsSinceDiagnosis = (int) Math.Round((now - dxDate).Days / DAYS_PER_MONTH, 0);

            DataRowView current = biopsies[biopsies.Count - 1];
            LastBiopsyDate = (DateTime) current["ProcDate"];

            int gg1, gg2, posCores, numCores;

            if (int.TryParse(current["PathGG1"].ToString(), out gg1))
                BiopsyPrimaryGleason = gg1;

            if (int.TryParse(current["PathGG2"].ToString(), out gg2))
                BiopsySecondaryGleason = gg2;

            if (int.TryParse(current["PathPosCores"].ToString(), out posCores))
                PositiveCores = posCores;

            if (int.TryParse(current["PathNumCores"].ToString(), out numCores))
                TotalCores = numCores;

            if (clinStage.Count > 0)
                ClinTStage = clinStage[0]["ClinStageT"].ToString();

            List<string> biopsyDates = new List<string>();

            for (int i = 0; i < biopsies.Count - 1; i++)
            {
                biopsyDates.Add(((DateTime) biopsies[i]["ProcDate"]).ToString("MMMM d, yyyy"));
            }

            PreviousBiopsiesRepeater.DataSource = biopsyDates;
            PreviousBiopsiesRepeater.DataBind();

            return dxDate;
        }

        void GraphPSAs(int patientId, DateTime dxDate)
        {
            DataView labtests = ActiveSurveillanceDa.GetPSAs(patientId);
            

            float? dxPSA = null;
            DateTime? dxPSADate = null;

            bool enableGraph = false;
            SortedList<DateTime, List<float>> postDxDatapoints = new SortedList<DateTime, List<float>>();

            foreach (DataRowView row in labtests)
            {
                // are the date and result valid?
                string ds = row["LabDate"].ToString();
                DateTime psaDate;

                if (!DateTime.TryParse(ds, out psaDate))
                {
                    continue;
                }

                string rs = row["LabResult"].ToString();
                if (!string.IsNullOrEmpty(rs))
                {
                    rs = rs.Replace("<", "");
                }

                float psa;
                if (!float.TryParse(rs, out psa))
                {
                    continue;
                }

                // update the current psa
                CurrentPSA = rs;

                // update dx psa if <= dx date
                if (psaDate <= dxDate)
                {
                    PreDiagnosisPSA = rs;
                    dxPSA = psa;
                    dxPSADate = psaDate;
                }
                else if (postDxDatapoints.ContainsKey(psaDate))
                {
                    postDxDatapoints[psaDate].Add(psa);
                }
                else
                {
                    List<float> f = new List<float>();
                    f.Add(psa);
                    postDxDatapoints[psaDate] = f;
                }
            }

            // graph last pre dx and subsequent psas (bool)
            DataTable table = InitPSAChartTable();
            DateTime baseDate = DateTime.MinValue;

            if (dxPSADate.HasValue)
            {
                baseDate = dxPSADate.Value;
                enableGraph = true;
            }
            else if (postDxDatapoints.Count > 0)
            {
                baseDate = postDxDatapoints.First().Key;
                enableGraph = true;
            }

            if (enableGraph)
            {
                if (dxPSADate.HasValue)
                {
                    AddPSADataPoint(table, 0, dxPSA.Value);
                }

                foreach (var dp in postDxDatapoints)
                {
                    AddPSADataPoint(table, (dp.Key - baseDate).Days / DAYS_PER_MONTH, dp.Value.Average());
                }

                PSAChart.Series["Actual"].Points.DataBind(table.DefaultView, "Months", "ngml", "Tooltip=ngml, Label=ngml");


                // add series for biopsies
                SortedList<DateTime, SortedList<float, string>> postDxBiopsyDatapoints = new SortedList<DateTime, SortedList<float, string>>();
                DataView biopsies = ActiveSurveillanceDa.GetBiopsies(patientId);
                DataTable biopsyChartTable = InitBiopsyChartTable();

                foreach (DataRowView row in biopsies)
                {
                    int gg1, gg2, posCores, numCores;
                    string  biopsyToolTip = String.Empty;
                    DateTime biopsyDate;
                    string ds = row[Procedure.ProcDate].ToString();                    

                    // only continue if date is valid
                    if (!DateTime.TryParse(ds, out biopsyDate))
                    {
                        continue;
                    }
                    else
                        biopsyToolTip = String.Concat(biopsyToolTip, biopsyDate.ToShortDateString());

                    if (!String.IsNullOrEmpty(row[Procedure.ProcName].ToString()))
                        biopsyToolTip = String.Concat(biopsyToolTip, " ", row[Procedure.ProcName].ToString());

                    if (int.TryParse(row[BiopsyProstatePathology.PathGG1].ToString(), out gg1))
                        biopsyToolTip = String.Concat(biopsyToolTip, " ", gg1.ToString());

                    if (int.TryParse(row[BiopsyProstatePathology.PathGG2].ToString(), out gg2))
                        biopsyToolTip = String.Concat(biopsyToolTip, "+", gg2.ToString());

                    if (int.TryParse(row[BiopsyProstatePathology.PathPosCores].ToString(), out posCores))
                        biopsyToolTip = String.Concat(biopsyToolTip, " Pos. Cores: ", posCores.ToString());

                    if (int.TryParse(row[BiopsyProstatePathology.PathNumCores].ToString(), out numCores))
                        biopsyToolTip = String.Concat(biopsyToolTip, "/", numCores.ToString());


                    if (postDxBiopsyDatapoints.ContainsKey(biopsyDate))
                    {
                        postDxBiopsyDatapoints[biopsyDate].Add(1, biopsyToolTip);
                    }
                    else
                    {
                        SortedList<float, string> f = new SortedList<float, string>();
                        f.Add(1, biopsyToolTip);
                        postDxBiopsyDatapoints[biopsyDate] = f;
                    }
                }

                if (postDxBiopsyDatapoints.Count > 0)
                {
                    foreach (var dp in postDxBiopsyDatapoints)
                    {   
                        SortedList<float, string> sortedDbValue = dp.Value;
                        AddBiopsyDataPoint(biopsyChartTable, (dp.Key - baseDate).Days / DAYS_PER_MONTH, sortedDbValue.Keys.Average(), sortedDbValue.Values[0]);
                    }

                    PSAChart.Series["Biopsies"].Points.DataBind(biopsyChartTable.DefaultView, "Months", "ngml", "Tooltip=BiopsyToolTip");
                }

            }
            else
            {
                // no graph to see!
            }
        }

        DataTable GraphSurveys(int patientId, DateTime baseDate)
        {
            ActiveSurveillanceSurvey helper = new ActiveSurveillanceSurvey(); // we could make GetSurveyTable a property that returns a DataView
            DataTable _surveyTable = helper.GetSurveys(patientId);
            DataView surveyScores = helper.GetScores(_surveyTable);

            DataTable efChartTable = InitChartTable();
            DataTable ufChartTable = InitChartTable();

            foreach (DataRowView row in surveyScores)
            {
                Func<int, string, string> frac = (x, f) => x + " / " + row[f];
                Func<string, int?> getScore = s => row[s] == DBNull.Value ? null : (int?) row[s];

                // conditionally build status messages
                Action<Label, string, Func<int, string>, HtmlContainerControl> status =
                    (l, s, f, bullet) =>
                    {
                        object obj = row[s];
                        if (obj != DBNull.Value)
                            l.Text = "Current: " + f((int) obj);
                        else if (bullet != null)
                            bullet.Visible = false;
                    };

                int? efScore = getScore("EF_Score");
                int? ufScore = getScore("UF_Score");
                int? qolScore = getScore("GH_Score");
                //int? bowelScore = getScore("BF_Score");
                bool anxiety = (bool) row["Anxiety"];

                DateTime surveyDate = (DateTime) row["SurveyDate"];
                LastSurveyDate = surveyDate;
                //double monthsSinceBaseDate = (surveyDate - baseDate).Days / DAYS_PER_MONTH;
                double yearsSinceBaseDate = (surveyDate - baseDate).Days / DAYS_PER_YEAR;
                //int roundedMonths = (int) Math.Round(monthsSinceBaseDate, 0);
                //int roundedYears = (int) Math.Round(yearsSinceBaseDate, 0);


                if (efScore.HasValue)
                {
                    AddDataPoint(efChartTable, yearsSinceBaseDate, efScore.Value);
                    CurrentEFScore.Text = frac(efScore.Value, "EF_Possible") + " " + GetErectileStatus(efScore.Value);
                }

                if (ufScore.HasValue)
                {
                    AddDataPoint(ufChartTable, yearsSinceBaseDate, ufScore.Value);
                    CurrentUFScore.Text = frac(ufScore.Value, "UF_Possible") + " " + GetUrinaryStatus(ufScore.Value);
                }

                //if (bowelScore.HasValue)
                //    CurrentBFScore.Text = GetBowelSymptoms(bowelScore.Value);

                if (anxiety)
                {
                    AnxietyValue.Text = "Yes";
                }

                if (qolScore.HasValue)
                    CurrentGeneralScore.Text = frac(qolScore.Value, "GH_Possible");

                status(CurrentPenetrationStatus, "PenetrationResponse", GetPenetrationMessage, CurrentPenetrationBullet);
                status(CurrentPadStatus, "PadResponse", GetPadMessage, PadStatusBullet);
            }

            // bas: remove filter for AS results until further notice

            /*
            List<int> months = new List<int>() { 0, 3, 6, 9, 12, 15, 18, 21, 24, 36, 48 };
            var ranges = GenerateRanges(months);

            DataTable ufTableFiltered = FilterChartDataPoints(ufChartTable, ranges);
            DataTable efTableFiltered = FilterChartDataPoints(efChartTable, ranges);

            UFChart.DataSource = ufTableFiltered;
            EFChart.DataSource = efTableFiltered;
            */

            //UFChart.DataSource = ufChartTable;
            //EFChart.DataSource = efChartTable;
            EFChart.Series["AS_Scores"].Points.DataBind(efChartTable.DefaultView, "Years", "Score", "Tooltip=Score, Label=Score");
            UFChart.Series["AS_Scores"].Points.DataBind(ufChartTable.DefaultView, "Years", "Score", "Tooltip=Score, Label=Score");

            //showUrinaryChart = ufTableFiltered.Rows.Count > 1;
            //showErectileChart = efTableFiltered.Rows.Count > 1;

            if (LastSurveyDate.HasValue)
            {
                int surveyWeeksAgo = (int) Math.Round((DateTime.Now - LastSurveyDate.Value).Days / 7.0, 0);
                string s;

                if (surveyWeeksAgo == 0)
                    s = "Less than one week ago";
                else
                    s = string.Format("{0} week{1}ago", surveyWeeksAgo, HandlePlural(surveyWeeksAgo));

                string longDate = LastSurveyDate.Value.ToLongDateString();

                LastSurveyDateLabel.Text = "Most Recent Survey: " + longDate + ". " + s;
            }

            return _surveyTable;
        }

        DataTable GraphSurveys_QOL(int patientId, DateTime baseDate)
        {

            MSKProstateQOLSurvey helper = new MSKProstateQOLSurvey(); // we could make GetSurveyTable a property that returns a DataView
            DataTable _surveyTable = helper.GetSurveys(patientId);
            //DataView surveyScores = helper.GetScores(_surveyTable);
            DataView surveyScores = helper.GetScores_Adjusted_ActiveSurvelliance(_surveyTable);

            DataTable efChartTable = InitChartTable();
            DataTable ufChartTable = InitChartTable();

            int count = surveyScores.Count;

            SurveyDa.BaselineScores baseline = SurveyDa.GetPhysicianBaselineScores(patientId, baseDate);

            for (int i = 0; i < count; i++)
            {
                DataRowView row = surveyScores[i];

                DateTime surveyDate = (DateTime)row["SurveyDate"];

                double yearsSinceBaseDate = (surveyDate - baseDate).Days / DAYS_PER_YEAR;

                Func<string, int?> getScore = s => row[s] == DBNull.Value ? null : (int?)row[s];

                int? efScore = getScore("EF_Score");
                int? ufScore = getScore("UF_Score");

                if (efScore.HasValue)
                {
                    AddDataPoint(efChartTable, yearsSinceBaseDate, efScore.Value);
                }

                if (ufScore.HasValue)
                {
                    AddDataPoint(ufChartTable, yearsSinceBaseDate, ufScore.Value);
                }

                EFChart.Series["QOL_Scores"].Points.DataBind(efChartTable.DefaultView, "Years", "Score", "Tooltip=Score, Label=Score");
                UFChart.Series["QOL_Scores"].Points.DataBind(ufChartTable.DefaultView, "Years", "Score", "Tooltip=Score, Label=Score");

            }
            return _surveyTable;
        }

        void DisplayLatestSurveyResponses(DataTable surveys)
        {
            IDictionary<KeyValuePair<string, string>, string> map = SurveyDa.GetSurveyItemResponseMap(ActiveSurveillanceSurvey.ShortName);

            Func<string, string, string, string> getResponse =
                (text, num, result) =>
                {
                    KeyValuePair<string, string> kvp =
                        new KeyValuePair<string, string>(text, result);

                    KeyValuePair<string, string> numKVP =
                        new KeyValuePair<string, string>(num, result);

                    if (map.ContainsKey(kvp))
                        return map[kvp];
                    else if (map.ContainsKey(numKVP))
                        return map[numKVP];
                    else
                        return result;
                };

            DataView sv = surveys.DefaultView;
            sv.Sort = "SurveyDate DESC, SurveyId DESC";

            if (sv.Count == 0)
            {
                return;
            }

            int latestSurveyId = (int) sv[0]["SurveyId"];

            var ds =
                from row in surveys.AsEnumerable()
                let surveyId = (int) row["SurveyId"]
                let itemNum = row["SurveyItemNum"].ToString()
                let text = row["SurveyItem"].ToString()
                where surveyId == latestSurveyId &&
                      !text.StartsWith("Total", StringComparison.CurrentCultureIgnoreCase) &&
                      !text.StartsWith("Patient reported", StringComparison.CurrentCultureIgnoreCase)
                select new
                {
                    QuestionNum = itemNum,
                    QuestionText = text,
                    QuestionResult = getResponse(text, itemNum, row["SurveyItemResult"].ToString())
                };

            SurveyResponsesRepeater.DataSource = ds;
            SurveyResponsesRepeater.DataBind();
        }

        string GetErectileStatus(int score)
        {
            if (score >= 24)
                return "(Good)";
            else if (score >= 18 && score <= 24)
                return "(Intermediate)";
            else if (score >= 12 && score <= 18)
                return "(Moderate)";
            else
                return "(Poor)";
        }

        string GetUrinaryStatus(int score)
        {
            if (score >= 31)
                return "(Good)";
            else if (score >= 19 && score <= 30)
                return "(Moderate)";
            else
                return "(Poor)";
        }

        string GetBowelSymptoms(int score)
        {
            if (score < 6)
                return "Bowel symptoms";
            else if (score == 6 || score == 7)
                return "Minor bowel symptoms";
            else
                return "No bowel symptoms";
        }

        string GetPenetrationMessage(int penetrationResult)
        {
            switch (penetrationResult)
            {
                case 1: // No sexual activity
                case 2: // Almost never / never
                    return "NO erection sufficient for penetration";
                case 3: // A few times (less than half the time)
                    return "Erection sufficient LESS THAN HALF THE TIME";
                case 4: // Sometimes (about half the time)
                    return "Erection sufficient HALF THE TIME";
                case 5: // Most times (more than half the time)
                case 6: // Almost always / always
                    return "Erection sufficient MOST TIMES";
                default:
                    return null;
            }
        }

        string GetPadMessage(int padResult)
        {
            switch (padResult)
            {
                case 1: // None (or no leakage)
                    return "NO pads";
                case 2: // An occasional pad or protective material
                    return "OCCASIONAL pad";
                case 3: // 1 pad per 24-hour period
                    return "1 pad per day";
                case 4: // 2 pads per 24-hour period
                    return "2 pads per day";
                case 5: // 3 or more pads per 24-hour period
                    return "3 pads per day";
                case 6: // Adult diaper(s)
                    return "Adult diapers";
                default:
                    return null;
            }
        }

        string GetInjectionMessage(int injectionResult)
        {
            switch (injectionResult)
            {
                case 0: // "No sexual activity";
                case 1: // "Almost never/never";
                    return "NO erection sufficient for penetration";
                case 2: // "A few times (less than half the time)";
                    return "Erection sufficient LESS THAN HALF THE TIME";
                case 3: // "Sometimes (about half the time)";
                    return "Erection sufficient HALF THE TIME";
                case 4: // "Most times (more than half the time)";
                case 5: // "Almost always/always";
                    return "Erection sufficient MOST TIMES";
                default:
                    return null;
            }
        }

        string MapInjectionMessage(string injectionResult)
        {
            switch (injectionResult)
            {
                case "No sexual activity":
                case "Almost never/never":
                    return "NO erection sufficient for penetration";
                case "A few times (less than half the time)":
                    return "Erection sufficient LESS THAN HALF THE TIME";
                case "Sometimes (about half the time)":
                    return "Erection sufficient HALF THE TIME";
                case "Most times (more than half the time)":
                case "Almost always/always":
                    return "Erection sufficient MOST TIMES";
                default:
                    return null;
            }
        }

        IEnumerable<FRange> GenerateRanges(IEnumerable<int> months)
        {
            foreach (int m in months)
            {
                FRange range = new FRange();
                range.attractor = m;
                range.includeLow = true;
                range.includeHigh = true;

                int window = 1 + Math.Min(2, m / 12); // yes, integer division is what we want
                range.low = m - window;
                range.high = m + window;

                yield return range;
            }
        }

        DataTable FilterChartDataPoints(DataTable table, IEnumerable<FRange> ranges)
        {
            DataTable ft = InitChartTable();

            IEnumerable<FPoint> points =
                table.AsEnumerable().Select(r => new FPoint((int) r["Months"], (int) r["Score"]));

            foreach (FPoint p in FuncFilter.Filter(points, ranges))
            {
                AddDataPoint(ft, (int) p.x, (int) p.y);
            }

            return ft;
        }

        DataTable InitChartTable()
        {
            DataTable t = new DataTable();
            t.Columns.Add("Years", typeof(double));
            t.Columns.Add("Score", typeof(int));

            return t;
        }

        DataTable InitPSAChartTable()
        {
            DataTable t = new DataTable();
            t.Columns.Add("Months", typeof(double));
            t.Columns.Add("ngml", typeof(double));

            return t;
        }

        DataTable InitBiopsyChartTable()
        {
            DataTable t = new DataTable();
            t.Columns.Add("Months", typeof(double));
            t.Columns.Add("ngml", typeof(double));
            t.Columns.Add("BiopsyToolTip", typeof(string));
            return t;
        }

        void AddPSADataPoint(DataTable chartTable, float months, float psavalue)
        {
            DataRow row = chartTable.NewRow();

            row["Months"] = months;
            row["ngml"] = Math.Round(psavalue, 2);

            chartTable.Rows.Add(row);
        }

        void AddBiopsyDataPoint(DataTable chartTable, float months, float biopsyvalue, string toolTip)
        {
            DataRow row = chartTable.NewRow();

            row["Months"] = months;
            row["ngml"] = Math.Round(biopsyvalue, 2);
            row["BiopsyToolTip"] = toolTip;

            chartTable.Rows.Add(row);
        }

        void AddDataPoint(DataTable chartTable, double years, int score)
        {
            DataRow row = chartTable.NewRow();

            row["Years"] = years;
            row["Score"] = score;

            chartTable.Rows.Add(row);
        }

        protected string HandlePlural(double val)
        {
            return val > 1 ? "s " : " ";
        }
    }
}
