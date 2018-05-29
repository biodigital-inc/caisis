using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

using Caisis.DataAccess;
using Caisis.UI.Core.Classes;
using Caisis.UI.Modules.Prostate.DataAnalysis;

namespace Caisis.UI.Modules.Prostate.PaperForms
{
	public partial class ProstateQOLResults : BasePaperFormControl
	{
		private const float DAYS_PER_MONTH = 30.43685f;

		#region private members to handle alerts

		//private const int MAX_URINARY_SCORE = 21;

		private List<DateTime> erectileAlerts = new List<DateTime>();
		private List<DateTime> padAlerts = new List<DateTime>();
		private List<DateTime> urinaryDeclineAlerts = new List<DateTime>();
		private List<DateTime> bowelAlerts = new List<DateTime>();
		private List<DateTime> qolAlerts = new List<DateTime>();

		//private int previousMinUrinaryScore = MAX_URINARY_SCORE;

		private List<string> alertsDatasource = new List<string>();

		// private bool showErrorMessage = false;

		private bool patientHadRP = false;
		private bool showErectileChart = false;
		private bool showUrinaryChart = false;
		private bool showSurveyResponses = false;

		//private DataTable _surveyTable = null; // fixme

		#endregion

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

		public float MonthsSinceSurgery
		{
			get;
			private set;
		}

        public DateTime? RPDate
        {
            get;
            private set;
        }

        public string RPType
        {
            get;
            private set;
        }

		public string CurrentPSA
		{
			get;
			private set;
		}

		public string PreSurgeryPSA
		{
			get;
			private set;
		}

		public int PathPrimaryGleason
		{
			get;
			private set;
		}

		public int PathSecondaryGleason
		{
			get;
			private set;
		}

		public string PathStage
		{
			get;
			private set;
		}

		// organ confined? is this ocd yes/no or a more general disease status?
        // alerts? how do we retrieve these?

        // most recent Prostate QOL Survey
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

		public bool LastSurveyIsBaseline
		{
			get;
			private set;
		}

		#endregion

		protected override void SetFormInfo()
		{
			this._formName = "ProstateQOLResults";
			this._formTitle = "Prostate QOL Results";
		}

		protected override void Page_Load(object sender, EventArgs e)
		{
			base.Page_Load(sender, e);

			// patient header
			PatientMRN = patientMRN;
			PatientDisplayName = (patientFirstName ?? "") + " " + (patientLastName ?? "");
			AppointmentDate = DateTime.Now;

			DataView prostateQOLResults = ReportDa.GetProstateQOLResults(patientID);

			if (prostateQOLResults.Count > 0)
			{
				patientHadRP = true;

				DateTime rpDate = AnalyzePatientHistory(prostateQOLResults);
				DataTable surveys = AnalyzeSurveys(patientID, rpDate);

                // TODO: handle expected outcomes
                // if (weHaveDataForOutcomes) { showAdditionalSeries(...); }
                PatientOutcomesServiceAdapter outcomesAdapter = new PatientOutcomesServiceAdapter(Request.PhysicalApplicationPath);
                PatientOutcomesResults results = outcomesAdapter.GetPatientOutcomes(patientID);
                
                outcomesAdapter.AddErectileOutcomesToChart(EFChart, results);
                outcomesAdapter.AddUrinaryOutcomesToChart(UFChart, results);

                // ef/uf "survival" predictions
                PopulateFunctionPredictions(results, rpDate);

				HandleAlerts();

				if (LastSurveyDate.HasValue && surveys.Rows.Count > 0)
				{
					showSurveyResponses = true;
					LastSurveyIsBaseline = LastSurveyDate.Value <= rpDate;

					GetRecentSurveyReponses(surveys);
				}

                PopulateNomogramScores(patientID, rpDate, results);

                RPDate = rpDate;
			}

			SetControlValues();
            BuildQOLReportLabTests();
            GetLastProblemPlans();

		}

		protected override void OnPreRender(EventArgs e)
		{
			base.OnPreRender(e);

			if (patientHadRP)
			{
				AlertRepeater.DataBind();

				if (showErectileChart)
					EFChart.DataBind();
				else
					EFChart.Visible = false;

				if (showUrinaryChart)
					UFChart.DataBind();
				else
					UFChart.Visible = false;

				if (showSurveyResponses)
					SurveyResponsesRepeater.DataBind();

                // suppress 2nd page via query string
                if (DisplayPageNumbers.Length > 0 && !DisplayPageNumbers.Contains(2))
                    LastPageInForm.Visible = false;
			}
			else
			{
                if (this.Parent.ClientID.ToUpper().Contains("QOLREPORTHOLDER"))
                {
                    this.Visible = false;  // just hide this whole form if it's included in a packet via a placeholder called QOLReportHolder
                }
                else
                {
                    FirstPage.Visible = false;
                    reportTable2.Visible = false;
                    NoRPErrorContainer.Visible = true;

                    ErrorPatientName.Text = PatientDisplayName;
                    ErrorPatientMRN.Text = PatientMRN;
                    ErrorTodaysDate.Text = DateTime.Now.ToLongDateString();
                }
			}            
		}

		// handle HPI data, return RP date
		DateTime AnalyzePatientHistory(DataView prostateQOLResults)
		{
			DataRowView r = prostateQOLResults[0];

			PatientAge = (int) r["PtAge"];
			MonthsSinceSurgery = (int) r["MonthsSinceRP"];
			CurrentPSA = r["PostSurgeryPSA"].ToString();
			PreSurgeryPSA = r["PreSurgeryPSA"].ToString();
            RPType = r["RPType"].ToString();

			int gg1, gg2;

			if (int.TryParse(r["PathGG1"].ToString(), out gg1))
				PathPrimaryGleason = gg1;

			if (int.TryParse(r["PathGG2"].ToString(), out gg2))
				PathSecondaryGleason = gg2;

			string eceStr = r["ECE"].ToString().ToUpper();
			string lniStr = r["LNI"].ToString().ToUpper();
			string sviStr = r["SVI"].ToString().ToUpper();

			bool ece = eceStr.StartsWith("POS") || eceStr.StartsWith("EST") || eceStr.StartsWith("FOCAL");
			bool lni = lniStr.StartsWith("MOD") || lniStr.StartsWith("POS");
			bool svi = sviStr.StartsWith("POS");

			Func<bool, string> pm = x => x ? "+" : "-";

			if (!(ece || lni || svi))
				PathStage = "Organ confined";
			else
				PathStage = string.Format("ECE{0}, SVI{1}, LNI{2}", pm(ece), pm(svi), pm(lni));

			object surveyDateObj = r["SurveyDate"];

			if (!(surveyDateObj == null || surveyDateObj == DBNull.Value))
				LastSurveyDate = (DateTime) surveyDateObj;

			return (DateTime) r["RPDate"]; // query prevents null RP Dates
		}

		// analyze post-rp survey data, return raw survey data
		DataTable AnalyzeSurveys(int patientId, DateTime rpDate)
		{
			MSKProstateQOLSurvey helper = new MSKProstateQOLSurvey(); // we could make GetSurveyTable a property that returns a DataView
			DataTable _surveyTable = helper.GetSurveys(patientId);
			DataView surveyScores = helper.GetScores(_surveyTable);

			DataTable efChartTable = InitChartTable();
			DataTable ufChartTable = InitChartTable();
			
			int count = surveyScores.Count;

			SurveyDa.BaselineScores baseline = SurveyDa.GetPhysicianBaselineScores(patientId, rpDate);

			BaselinePhysicianEFScore.Text = baseline.ErectileFunction.HasValue ? baseline.ErectileFunction.ToString() : "N/A";
			BaselinePhysicianUFScore.Text = baseline.UrinaryFunction.HasValue ? baseline.UrinaryFunction.ToString() : "N/A";

			bool foundPatientBaseline_EF = false;
			bool addedPatientBaseline_EF = false;
			bool foundPatientBaseline_UF = false;
			bool addedPatientBaseline_UF = false;

			int patientBaseline_efScore = 0;
			int patientBaseline_ufScore = 0;

			int? prevMinUrinaryScore = null;
			int? prevUrinaryScore = null;
			
			for (int i = 0; i < count; i++)
			{
				DataRowView row = surveyScores[i];

				DateTime surveyDate = (DateTime) row["SurveyDate"];

				double monthsSinceRP = (surveyDate - rpDate).Days / DAYS_PER_MONTH;
				//int roundedMonths = (int) Math.Round(monthsSinceRP, 0);
                double roundedMonths = monthsSinceRP;
				bool physicianReported = (bool) row["PhysicianReported"];

				// display scores as a fraction
				Func<int, string, string> frac = (x, f) => x + " / " + row[f];
				Func<string, int?> getScore = s => row[s] == DBNull.Value ? null : (int?) row[s];

				int? efScore = getScore("EF_Score");
				int? ufScore = getScore("UF_Score");
				int? qolScore = getScore("GH_Score");
				int? bowelScore = getScore("BF_Score");

				// add only the most recent pre-rp survey to the chart datasources
				if (surveyDate <= rpDate)
				{
					if (efScore.HasValue)
					{
						patientBaseline_efScore = efScore.Value;
						foundPatientBaseline_EF = true;

						if (count == 1)
						{
							BaselinePatientEFScore.Text = frac(patientBaseline_efScore, "EF_Possible") + " " + GetErectileStatus(patientBaseline_efScore);
							AddDataPoint(efChartTable, 0, patientBaseline_efScore);
						}
					}

					if (ufScore.HasValue)
					{
						patientBaseline_ufScore = ufScore.Value;
						foundPatientBaseline_UF = true;

						if (count == 1)
						{
							BaselinePatientUFScore.Text = frac(patientBaseline_ufScore, "UF_Possible") + " " + GetUrinaryStatus(patientBaseline_ufScore);
							AddDataPoint(ufChartTable, 0, patientBaseline_ufScore);
						}
					}

					continue;
				}
				else
				{
					if (foundPatientBaseline_EF && !addedPatientBaseline_EF)
					{
						BaselinePatientEFScore.Text = frac(patientBaseline_efScore, "EF_Possible") + " " + GetErectileStatus(patientBaseline_efScore);
						AddDataPoint(efChartTable, 0, patientBaseline_efScore);

						addedPatientBaseline_EF = true;
					}

					if (foundPatientBaseline_UF && !addedPatientBaseline_UF)
					{
						BaselinePatientUFScore.Text = frac(patientBaseline_ufScore, "UF_Possible") + " " + GetUrinaryStatus(patientBaseline_ufScore);
						AddDataPoint(ufChartTable, 0, patientBaseline_ufScore);

						addedPatientBaseline_UF = true;
					}
				}

				if (efScore.HasValue)
					AddDataPoint(efChartTable, roundedMonths, efScore.Value);

				if (ufScore.HasValue)
					AddDataPoint(ufChartTable, roundedMonths, ufScore.Value);

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

				if (i == count - 1)
				{
					// handle current
					if (efScore.HasValue)
						CurrentEFScore.Text = frac(efScore.Value, "EF_Possible") + " " + GetErectileStatus(efScore.Value);

					if (ufScore.HasValue)
						CurrentUFScore.Text = frac(ufScore.Value, "UF_Possible") + " " + GetUrinaryStatus(ufScore.Value);

					if (bowelScore.HasValue)
						CurrentBFScore.Text = GetBowelSymptoms(bowelScore.Value);

					if (qolScore.HasValue)
						CurrentGeneralScore.Text = frac(qolScore.Value, "GH_Possible");

					status(CurrentPenetrationStatus, "PenetrationResponse", GetPenetrationMessage, CurrentPenetrationBullet);
					status(CurrentPadStatus, "PadResponse", GetPadMessage, PadStatusBullet);
				}

				// clear alerts if conditions improve

				// erectile alerts
				if (efScore.HasValue)
				{
					if (efScore < 22)
						erectileAlerts.Add(surveyDate);
					else
						erectileAlerts.Clear();
				}

				// urinary alerts
				// handle max urinary score
				if (ufScore.HasValue)
				{
					if (i > 0 && prevMinUrinaryScore.HasValue)
					{
						if ((monthsSinceRP > 12 && ufScore <= prevMinUrinaryScore.Value - 3) ||
							(monthsSinceRP <= 12 && ufScore < prevMinUrinaryScore.Value))
							urinaryDeclineAlerts.Add(surveyDate);
						else if (prevUrinaryScore.HasValue && ufScore > prevUrinaryScore)
							urinaryDeclineAlerts.Clear();
					}

					if (!prevMinUrinaryScore.HasValue || ufScore < prevMinUrinaryScore.Value)
						prevMinUrinaryScore = ufScore;

					prevUrinaryScore = ufScore;
				}

				// qol alerts
				if (qolScore.HasValue)
				{
					if (qolScore < 6)
						qolAlerts.Add(surveyDate);
					else
						qolAlerts.Clear();
				}

				// pad alerts
				object padObj = row["PadResponse"];
				if (padObj != DBNull.Value && surveyDate > rpDate.AddYears(1))
				{
					if (3 <= (int) padObj)
						padAlerts.Add(surveyDate);
					else
						padAlerts.Clear();
				}

				// bowel alerts
				object bowelHabitObj = row["HabitResponse"];
				object bowelEnjoymentObj = row["EnjoymentResponse"];

				if ((bowelHabitObj != DBNull.Value && 3 <= (int) bowelHabitObj) ||
					(bowelEnjoymentObj != DBNull.Value && 3 <= (int) bowelEnjoymentObj))
				{
					bowelAlerts.Add(surveyDate);
				}
				else if (bowelHabitObj != DBNull.Value && bowelEnjoymentObj != DBNull.Value &&
						 2 >= (int) bowelHabitObj && 2 >= (int) bowelEnjoymentObj)
				{
					bowelAlerts.Clear();
				}
			}

            UFChart.DataSource = ufChartTable;
            EFChart.DataSource = efChartTable;

            /*
            List<int> months = new List<int>() { 0, 3, 6, 9, 12, 15, 18, 21, 24, 36, 48 };
            var ranges = GenerateRanges(months);

            DataTable ufTableFiltered = FilterChartDataPoints(ufChartTable, ranges);
            DataTable efTableFiltered = FilterChartDataPoints(efChartTable, ranges);

            UFChart.DataSource = ufTableFiltered;
            EFChart.DataSource = efTableFiltered;

			showUrinaryChart = ufTableFiltered.Rows.Count > 1;
            showErectileChart = efTableFiltered.Rows.Count > 1;
            */

            showUrinaryChart = ufChartTable.Rows.Count > 1;
            showErectileChart = efChartTable.Rows.Count > 1;

			return _surveyTable;
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

		// build a dynamic datasource for the survey response repeater
		void GetRecentSurveyReponses(DataTable surveys)
		{
			IDictionary<KeyValuePair<string, string>, string> map = SurveyDa.GetSurveyItemResponseMap(MSKProstateQOLSurvey.ShortName);

			Func<string, string, string, string> getResponse =
				(text, num, result) =>
				{
					KeyValuePair<string, string> kvp =
						new KeyValuePair<string, string>(text, result);

					KeyValuePair<string, string> numKVP =
						new KeyValuePair<string, string>(num, result);

                    if (map.ContainsKey(kvp))
                    {
                        return map[kvp];
                    }
                    else if (map.ContainsKey(numKVP))
                    {
                        return map[numKVP];
                    }
                    else
                    {
                        return result;
                    }
				};

			DataView sv = surveys.DefaultView;
			sv.Sort = "SurveyDate DESC, SurveyId DESC";
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

            // handle injection questions
            var injections =
                from row in surveys.AsEnumerable()
                let surveyId = (int)row["SurveyId"]
                let itemNum = row["SurveyItemNum"].ToString()
                let text = row["SurveyItem"].ToString()
                where surveyId == latestSurveyId &&
                    (text.Contains("use injections") || text.Contains("used injection"))
                select new
                {
                    Num = itemNum,
                    Question = text,
                    Response = row["SurveyItemResult"].ToString()
                };

            bool hadInjection = false;
            string injectionStatus = null;

            foreach (var i in injections)
            {
                if (i.Question.Contains("Do you use injections") && i.Response == "Yes")
                {
                    hadInjection = true;
                }
                else if (i.Question.Contains("used injection therapy"))
                {
                    int injectionResponse;
                    if (int.TryParse(i.Response, out injectionResponse))
                    {
                        injectionStatus = GetInjectionMessage(injectionResponse);
                    }
                    else
                    {
                        injectionStatus = MapInjectionMessage(i.Response);
                    }
                }
            }

            if (hadInjection)
            {
                CurrentInjectionStatus.Text = injectionStatus;
            }
		}

		void HandleAlerts()
		{
			HandleAlert(erectileAlerts, "Erectile dysfunction");
			HandleAlert(padAlerts, "Urinary dysfunction > 1 yr after surgery");
			HandleAlert(urinaryDeclineAlerts, "Decline in urinary function");
			HandleAlert(bowelAlerts, "Bowel symptoms");
			HandleAlert(qolAlerts, "Low health related quality of life");

			if (alertsDatasource.Count == 0)
				alertsDatasource.Add("None"); // add a blank row

			AlertRepeater.DataSource = alertsDatasource;
		}

		// populate nomo score labels
        void PopulateNomogramScores(int patientId, DateTime rpDate, PatientOutcomesResults r)
		{
			NomogramDa da = new NomogramDa();

			Action<Label, Func<int, int, double>, int> nomocall =
				(lbl, f, yr) =>
				{
					try
					{
                        lbl.Text = ((int)Math.Round(f(patientId, yr), 0)).ToString() + "&nbsp;&nbsp;&nbsp;";
					}
					catch
					{
						lbl.Text = "N/A";
					}
				};

			nomocall(Pre5Result, da.GetPreRPResult, 5);
            // nomocall(Post5Result, da.GetPostRPResult, 5);

            DateTime today = DateTime.Today;

            Post5Result.Text = r.NomogramPredictionBaseline.HasValue ? ((int) Math.Round(r.NomogramPredictionBaseline.Value, 0)) + "&nbsp;&nbsp;&nbsp;" : "N/A";

            // output only relevant results
            if (rpDate.AddYears(2) > today)
                //nomocall(Current2Result, da.GetPostRPResult, 2);
                Current2Result.Text = r.NomogramPrediction2Year.HasValue ? ((int) Math.Round(r.NomogramPrediction2Year.Value, 0)) + "&nbsp;&nbsp;&nbsp;" : "N/A";
            else
                Show2Yr.Visible = false;

            if (rpDate.AddYears(5) > today)
                Current5Result.Text = r.NomogramPrediction5Year.HasValue ? ((int) Math.Round(r.NomogramPrediction5Year.Value, 0)) + "&nbsp;&nbsp;&nbsp;" : "N/A";
            else
                Show5Yr.Visible = false;

            if (rpDate.AddYears(7) > today)
                //nomocall(Current7Result, da.GetPostRPResult, 7);
                Current7Result.Text = r.NomogramPrediction7Year.HasValue ? ((int) Math.Round(r.NomogramPrediction7Year.Value, 0)) + "&nbsp;&nbsp;&nbsp;" : "N/A";
            else
                Show7Yr.Visible = false;

            if (rpDate.AddYears(10) > today)
                Current10Result.Text = r.NomogramPrediction10Year.HasValue ? ((int) Math.Round(r.NomogramPrediction10Year.Value, 0)) + "&nbsp;&nbsp;&nbsp;" : "N/A";
            else
                Show10Yr.Visible = false;
		}

        void PopulateFunctionPredictions(PatientOutcomesResults r, DateTime rpDate)
        {
            if (r == null)
                return;

            DateTime today = DateTime.Today;
            Func<double?, string> s = d => d.HasValue ? (Math.Round(d.Value, 0).ToString() + "%") : "N/A";

            List<string> efPredictions = new List<string>();
            List<string> ufPredictions = new List<string>();

            //if (rpDate.AddMonths(3) > today)
            {
                efPredictions.Add(string.Format("{0}: {1}", 3, s(r.ErectileRate1YearBasedOn3Month)));
                ufPredictions.Add(string.Format("{0}: {1}", 3, s(r.UrinaryRate1YearBasedOn3Month)));
            }

            //if (rpDate.AddMonths(6) > today)
            {
                efPredictions.Add(string.Format("{0}: {1}", 6, s(r.ErectileRate1YearBasedOn6Month)));
                ufPredictions.Add(string.Format("{0}: {1}", 6, s(r.UrinaryRate1YearBasedOn6Month)));
            }

            //if (rpDate.AddMonths(9) > today)
            {
                efPredictions.Add(string.Format("{0}: {1}", 9, s(r.ErectileRate1YearBasedOn9Month)));
                ufPredictions.Add(string.Format("{0}: {1}", 9, s(r.UrinaryRate1YearBasedOn9Month)));
            }

            if (efPredictions.Count > 0)
            {
                EFPrediction.Text = string.Join(", ", efPredictions.ToArray());
            }
            else
            {
                EFPredictionLabel.Visible = false;
                EFPredictionBullet.Visible = false;
            }


            if (ufPredictions.Count > 0)
            {
                UFPrediction.Text = string.Join(", ", ufPredictions.ToArray());
            }
            else
            {
                UFPredictionLabel.Visible = false;
                UFPredictionBullet.Visible = false;
            }
        }

		void SetControlValues()
		{
			PatientDisplayNameLabel.Text = PatientDisplayName;

			if (AppointmentDate.HasValue)
				AppointmentDateLabel.Text = AppointmentDate.Value.ToLongDateString();

			PatientMRNLabel.Text = PatientMRN;

			string fs = string.Format("{0} year{1}old, {2} month{3}since surgery",
									  PatientAge,
									  HandlePlural(PatientAge),
									  MonthsSinceSurgery,
									  HandlePlural(MonthsSinceSurgery));

			PatientAgeLabel.Text = fs;

            if (!string.IsNullOrEmpty(RPType))
                RPTypeDateLabel.Text = RPType.ToString();


            if (RPDate.HasValue)
                RPTypeDateLabel.Text += (" on " + RPDate.Value.ToShortDateString());


			if (!string.IsNullOrEmpty(CurrentPSA))
				CurrentPSALabel.Text = CurrentPSA;

			GleasonScoreLabel.Text = string.Format("Gleason {0} + {1}", PathPrimaryGleason, PathSecondaryGleason);
			PathologicalStageLabel.Text = PathStage;

			if (!string.IsNullOrEmpty(PreSurgeryPSA))
				PreSurgeryPSALabel.Text = PreSurgeryPSA;

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
		}

		void HandleAlert(IEnumerable<DateTime> events, string msg)
		{
			int count = events.Count();

			if (count > 0)
			{
				StringBuilder b = new StringBuilder();

				b.Append(msg).Append(". ");

				if (count > 1)
				{
					b.AppendFormat(@"{0}<sup style=""font-size: 10px;"">{1}</sup> Alert, ", count, SequenceSuffix(count));

					b.Append(@"1<sup style=""font-size: 10px;"">st</sup> Alert: ");

					DateTime firstAlertDate = events.ElementAt(0);

					b.Append(firstAlertDate.ToLongDateString())
					 .Append(", ")
					 .Append(Math.Round((DateTime.Now - firstAlertDate).Days / DAYS_PER_MONTH, 1))
					 .Append(" months ago");
				}
				else
				{
					b.Append(@"1<sup style=""font-size: 10px;"">st</sup> Alert.");
				}

				alertsDatasource.Add(b.ToString());
			}
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
			if (score >= 16)
				return "(Good)";
			else if (score >= 10 && score <= 15)
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
                case 1: // "No sexual activity";
                case 2: // "Almost never/never";
                    return "NO erection sufficient for penetration";
                case 3: // "A few times (less than half the time)";
                    return "Erection sufficient LESS THAN HALF THE TIME";
                case 4: // "Sometimes (about half the time)";
                    return "Erection sufficient HALF THE TIME";
                case 5: // "Most times (more than half the time)";
                case 6: // "Almost always/always";
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

		DataTable InitChartTable()
		{
			DataTable t = new DataTable();
			t.Columns.Add("Months", typeof(double));
			t.Columns.Add("Score", typeof(int));

			return t;
		}

		void AddDataPoint(DataTable chartTable, double months, int score)
		{
			DataRow row = chartTable.NewRow();

			row["Months"] = months;
			row["Score"] = score;

			chartTable.Rows.Add(row);
		}

		string SequenceSuffix(int i)
		{
			// if i > 20 || < 10, use last digit (i % 10), else "th"

			if (i > 9 && i < 21)
				return "th";

			switch (i % 10)
			{
				case 1:
					return "st";
				case 2:
					return "nd";
				case 3:
					return "rd";
				default:
					return "th";
			}
		}

		string HandlePlural(double val)
		{
			return val > 1 ? "s " : " ";
		}


        protected void BuildQOLReportLabTests()
        {
            if (patientID != 0)
            {
                //Lab Tests
                LabTestDa da = new LabTestDa();

                DataSet labTestsDs = da.FormGetRecords(this.patientID, "UroProsFU", "Dynamic");

                if (labTestsDs.Tables.Count > 0 && labTestsDs.Tables[0].Rows.Count > 0)
                {
                    labTests.DataSource = labTestsDs.Tables[0].DefaultView;
                    labTests.DataBind();
                    LabTestHeaderNote.Visible = true;
                }
                else
                {
                    NoLabTestMessage.Visible = true;
                }
            }
        }



        protected void GetLastProblemPlans()
        {
            if (patientID != 0)
            {

                PatientDa da = new PatientDa();
                DataSet ds = da.FormGetLastPatientProblemPlans(this.patientID);
                if (ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
                {
                    DataTable dt = ds.Tables[0];
                    dt.Columns.Add("ProblemDisplayName");
                    dt.Rows[0]["ProblemDisplayName"] = dt.Rows[0][BOL.PatientProblem.ProblemName];

                    if (dt.Rows.Count > 1)
                    {
                        for (int i = 1; i < dt.Rows.Count; i++)
                        {
                            if (dt.Rows[i][BOL.PatientProblem.ProblemName].ToString() != dt.Rows[i - 1][BOL.PatientProblem.ProblemName].ToString())
                            {
                                dt.Rows[i]["ProblemDisplayName"] = dt.Rows[i][BOL.PatientProblem.ProblemName];
                            }
                        }
                    }

                    RptProblems.DataSource = ds.Tables[0].DefaultView;
                    RptProblems.DataBind();
                    noProblemPlans.Visible = false;
                    
                    string ProblemPlanNoteText = "";
                    if (dt.Rows[0][BOL.Encounter.EncPhysician].ToString().Length > 0) ProblemPlanNoteText += "by " + dt.Rows[0][BOL.Encounter.EncPhysician].ToString();
                    if (dt.Rows[0][BOL.Encounter.EncDateText].ToString().Length > 0) ProblemPlanNoteText += " on " + dt.Rows[0][BOL.Encounter.EncDateText].ToString();

                    ProblemPlanNote.Text = (ProblemPlanNoteText.Length > 0) ? ProblemPlanNoteText : "(None Recorded)";
                }
            }
        }



	}
}
