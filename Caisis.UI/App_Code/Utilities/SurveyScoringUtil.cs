using System;
using System.Data;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Collections.Generic;
using System.Collections;

using Caisis.BOL;
using Caisis.DataAccess;



/// <summary>
/// Methods for scoring surveys
/// </summary>
public class SurveyScoringUtil
{
    public static string ASCENDING = "Ascending";
    public static string DESCENDING = "Descending";
    
    // FS 8/09
    public SurveyScoringUtil()
    {
       
    }

    /// <summary>
    /// Gets the Standardized Value of the Response
    /// i.e. Direction Low to High (ASCENDING), response range 1-5,represents:
    /// 1 = 0
    /// 2 = 25
    /// 3 = 50
    /// 4 = 75
    /// 5 = 100
    /// i.e. Direction High to Low (DESCENDING), response range 0-3, represents:
    /// 0 = 100
    /// 1 = 66
    /// 2 = 33
    /// 3 = 0
    /// </summary>
    /// <param name="response">value of the response</param>
    /// <param name="responseStartIndex">start number of incremental response values, usually 1 or 0</param>
    /// <param name="responseEndIndex">end number of incremental response values</param>
    /// <param name="numberResponses">number of possible responses</param>
    /// <param name="direction">ScoringDirection.HighToLow, ScoringDirection.LowToHigh</param>
    /// <returns></returns>
    public static double GetQuestionStandardizedScore(int response, int responseStartIndex, int responseEndIndex, int numberResponses, string scoringDirection)
    {
        double score = -99;

        double scoreFactor = 100 / (double)(numberResponses - 1);

        if (scoringDirection.Equals(ASCENDING))
        {
            score = Math.Round( (response - responseStartIndex) * scoreFactor); 
        }
        else if (scoringDirection.Equals(DESCENDING))
        {
            score = Math.Round((responseEndIndex - response) * scoreFactor);     
        }

        return score;
    }


    /// <summary>
    /// Get scores in a DataTable for a given survey
    /// | Section | TotalQuestions | TotalQuestionsAnswered | Sum | Average | QuestionsEvaluated |
    /// </summary>
    /// <param name="surveyId"></param>
    /// <returns>DataTable</returns>
    public static DataTable FillScores(int surveyId)
    {
        Survey survey = new Survey();
        survey.Get(surveyId);
        string surveyName = survey[Survey.SurveyType].ToString().ToUpper();

		//SurveyItem surveyItems = new SurveyItem();
		//surveyItems.GetByParent(surveyId);

		IEnumerable<SurveyItem> surveyItems = BusinessObject.GetByParent<SurveyItem>(surveyId);

        DataTable scoresDt = new DataTable();
        scoresDt.Columns.Add("Section");
        scoresDt.Columns.Add("TotalQuestions");
        scoresDt.Columns.Add("TotalQuestionsAnswered");
        scoresDt.Columns.Add("Sum");
        scoresDt.Columns.Add("Average");
        scoresDt.Columns.Add("AverageStandardized");
        scoresDt.Columns.Add("QuestionsEvaluated");

        //string[,] sections = new string[,];
        string[,] sections = new string[0,0];
        string[,] questions = new string[0,0];

        if (surveyName.Equals(RANDSurvey.EarlyTxSurveyName.ToUpper()) ||
            surveyName.Equals(RANDSurvey.PreTxSurveyName.ToUpper()) ||
            surveyName.Equals(RANDSurvey.LateTxSurveyName.ToUpper()) ||
            surveyName.Contains("RAND") ) 
        {
            RANDSurvey s = new RANDSurvey();
            sections = new string[7, 3];
            sections = s.QuestionMap();
            questions = new string[27, 4];
            questions = s.ResponseMap();
        }
        else if
                (surveyName.Equals(EPICShortSurvey.ShortName.ToUpper()) ||
                 surveyName.Equals(EPICShortSurvey.FullName.ToUpper())) // TODO: Need to remove this if ever use the EPIC Long Survey
        {
            EPICShortSurvey s = new EPICShortSurvey();
            sections = new string[5, 4];
            sections = s.QuestionMap();
            questions = new string[26, 4];
            questions = s.ResponseMap();
        }
        else if
                (surveyName.Equals(MSKProstateQOLSurvey.ShortName.ToUpper()) ||
                 surveyName.Equals(MSKProstateQOLSurvey.FullName.ToUpper())) // TODO: Need to remove this if ever use the EPIC Long Survey
        {
            MSKProstateQOLSurvey s = new MSKProstateQOLSurvey();
            sections = new string[4, 4];
            sections = s.QuestionMap();
            questions = new string[15, 4];
            questions = s.ResponseMap();
        }
       

        

        for (int i = 0; i < sections.GetLength(0); i++)
        {
            string scoreName = sections[i, 1];

            // check fourth field in array that stipulates number of missing values allowed for valid section scores
            int minAnswersRequired = 0;
            if (sections.GetLength(1) > 3)
                minAnswersRequired = int.Parse(sections[i, 3]);

            List<string> scoreList = SurveyScoringUtil.GetScores(surveyItems, sections[i, 2], minAnswersRequired, questions);
            scoresDt.Rows.Add(scoreName, scoreList[0], scoreList[1], scoreList[2], scoreList[3], scoreList[4], scoreList[5]);
        }

        return scoresDt;
    }

    // <summary>
    /// Tallies and averages the items in a survey
    /// </summary>
    /// <param name="items"></param>
    /// <param name="questionNumbers"></param>
    /// <returns>string List</returns>
    private static List<string> GetScores(IEnumerable<SurveyItem> items, string questionNumbers, int minAnswersRequired, string[,] questionsPropertyArray)
    {
        string[] questions = questionNumbers.Replace(" ", "").Split(',');
        string questionList = "'" + string.Join("','", questions) + "'";
        //DataRow[] resultValues = items.GetTable().Select(SurveyItem.SurveyItemNum + " IN (" + questionList + ")");
		DataRow[] resultValues = items.AsDataView().Table.Select(SurveyItem.SurveyItemNum + " IN (" + questionList + ")");
        
        double questionsAnsweredSum = 0;
        double questionsStandardizedAnsweredSum = 0;

        int totalQuestions = resultValues.Length;
        double totalQuestionsAnswered = 0;
        
        // sums scores that are not equal to null
        foreach (DataRow dr in resultValues)
        {
            string result = dr[SurveyItem.SurveyItemResult].ToString();
            string questionNum = dr[SurveyItem.SurveyItemNum].ToString();
            
            int resultValue = -1;
            if (int.TryParse(result, out resultValue))
            {
                // NEED 
                List<string> l = SurveyScoringUtil.GetSingleResponseProperties(questionNum, questionsPropertyArray);
                int responseStartIndex = int.Parse(l[1]);
                int responseEndIndex = int.Parse(l[0]);

                int numberOfResponses;
                if (responseStartIndex == 0)
                    numberOfResponses = int.Parse(l[0]) + 1;
                else
                    numberOfResponses = int.Parse(l[0]);

                string scoreDirection = l[2];

                double standardizedScore = SurveyScoringUtil.GetQuestionStandardizedScore(resultValue, responseStartIndex, responseEndIndex, numberOfResponses, scoreDirection);
                
                questionsAnsweredSum = questionsAnsweredSum + resultValue;
                questionsStandardizedAnsweredSum = questionsStandardizedAnsweredSum + standardizedScore;

                totalQuestionsAnswered++;
            }
        }


        // initialize for when no questions answered
        string average = "NaN";
        string averageStandardized = "NaN";

        double questionsAnsweredAverage = Math.Round((questionsAnsweredSum / totalQuestionsAnswered), 2);
        double questionsStandardizedAnsereredAverage = Math.Round((questionsStandardizedAnsweredSum / totalQuestionsAnswered), 2);

        // if the minimum number of questions answered and the specified minimum is > 0
        if ((totalQuestionsAnswered >= minAnswersRequired)) 
        {
            averageStandardized = questionsStandardizedAnsereredAverage.ToString();
            average = questionsAnsweredAverage.ToString();
        }
        // if the minimum number of questions NOT answered and the number answered is > 0
        else if ((totalQuestionsAnswered < minAnswersRequired) && (totalQuestionsAnswered > 0)) 
        {
            averageStandardized = "Missing";
            average = "Missing";

        }

        List<string> scoresList = new List<string>(4);
        scoresList.Add(totalQuestions.ToString());
        scoresList.Add(totalQuestionsAnswered.ToString()); 
        scoresList.Add(questionsAnsweredSum.ToString());
        scoresList.Add(average);
        scoresList.Add(averageStandardized);
        scoresList.Add(questionNumbers);

        return scoresList;
    }

    /// <summary>
    /// 
    /// </summary>
    /// <param name="questionNumber"></param>
    /// <param name="questionProperties"></param>
    /// <returns>[number of responses available],[the lowest incremental value],[if improvement is low to high or high to low]</returns>
    private static List<string> GetSingleResponseProperties(string questionNumber, string[,] questionProperties)
    {
        List<string> l = new List<string>();

        for (int i = 0; i < questionProperties.GetLength(0); i++)
        {
            if (questionProperties[i, 0].Equals(questionNumber))
            {
                l.Add(questionProperties[i, 1]);
                l.Add(questionProperties[i, 2]);
                l.Add(questionProperties[i, 3]);
                break;
            }
        }

        return l;
    }
}

public class MSKProstateQOLSurvey
{
    public const string shortName = "Prostate QOL Survey";
    public const string fullName = "MSK Prostate QOL Survey";

    public static string ShortName
    {
            get { return shortName; }
    }

    public static string FullName
    {
            get { return fullName; }
    }

    public string[,] QuestionMap()
    {
        // array args: Short Score Name, Long Score Name, Item #'s Included, Number of non-missing items needed to computer score (otherwise set to score missing)
        string[,] scores = new string[4, 4]
        {
             // Domain Summary Scales
            {"SF","Sexual Domain", "2,3,4,5,6,7", "1"},
            {"UF","Urinary Function Domain", "8,9,10,11,12", "1"},
            {"BF","Bowel Function Domain", "13,14", "1"},
            {"GH","General Health", "15", "1"}
        }; 
        return scores;
    }

    public string[,] ResponseMap()
    {
        string[,] questionProperties = new string[15, 4]
        {
            // have items 1-5 with standardized values 0-100
            
            {"1","5","1", SurveyScoringUtil.DESCENDING}, // TODO: check this QUESTION; different on paper and in Caisis
            
			// sexual domain
			{"2","5","1", SurveyScoringUtil.ASCENDING},
            {"3","5","0", SurveyScoringUtil.ASCENDING},
            {"4","5","0", SurveyScoringUtil.ASCENDING},
            {"5","5","0", SurveyScoringUtil.ASCENDING},
            {"6","5","0", SurveyScoringUtil.ASCENDING},
            {"7","5","0", SurveyScoringUtil.ASCENDING},
           
            // urinary domain
            {"8","5","0", SurveyScoringUtil.DESCENDING},
            {"9","4","0", SurveyScoringUtil.DESCENDING},
            {"10","4","0", SurveyScoringUtil.DESCENDING},
            {"11","4","0", SurveyScoringUtil.DESCENDING},
            {"12","4","0", SurveyScoringUtil.DESCENDING},     
            
            // bowel domain
            {"13","4","0", SurveyScoringUtil.DESCENDING},
            {"14","4","0", SurveyScoringUtil.DESCENDING},

            // general
            {"15","10","0", SurveyScoringUtil.ASCENDING}
        };

        return questionProperties;
    }

	public DataTable GetSurveys(int patientId)
	{
        return GetSurveys(patientId, ShortName);
	}

    public DataTable GetSurveys(int patientId, string surveyName)
    {
        return new SurveyDa().GetSurveyItemsByPatient(patientId, surveyName);
    }

	/// <summary>
	/// Get a DataView with scores order by most recent for all of the patients Prostate QOL Surveys
	/// </summary>
	/// <param name="patientId"></param>
	/// <returns></returns>
	public DataView GetScores(int patientId)
	{
		return GetScores(GetSurveys(patientId));
	}

	public DataView GetScores(DataTable surveyTable)
	{
		// extracted for reuse elsewhere
		//DataTable surveyTable = new SurveyDa().GetSurveyItemsByPatient(patientId, MSKProstateQOLSurvey.ShortName);
		//DataTable surveyTable = GetSurveys(patientId);
		
		DataTable scoresTable = InitScoresTable();

		// this is equivalent to sorting a DataView of surveyTable, but groups the datarows by survey id
		var groups =
			from row in surveyTable.AsEnumerable()
			let id = (int) row["SurveyId"]
			let itemid = (int) row["SurveyItemId"]
			let date = (DateTime) row["SurveyDate"]
			orderby date ascending, id, itemid
			group row by id;

		// List<int?> erectileAnswers = new List<int?>(); // 2 - 7
		// question #2 has a minimum value of 1
		int?[] erectileAnswers = new int?[6]; // 2 - 7
		List<int?> urinaryAnswers = new List<int?>(); // 8 - 12
		List<int?> bowelAnswers = new List<int?>(); // 13 - 14
		//List<int?> qolAnswers = new List<int?>(); // 15
		int? qolAnswer = null; // 15


		foreach (IGrouping<int, DataRow> group in groups)
		{
			int surveyId = group.Key;
			DateTime? surveyDate = null;
			int? penetrationResponse = null;
			int? padResponse = null;
			int? bowelHabitResponse = null;
			int? bowelEnjoymentResponse = null;
			bool physicianReported = true; // false if "Patient reported" (Q16) = "Yes"

			// erectileAnswers.Clear();
			erectileAnswers = new int?[6];
			urinaryAnswers.Clear();
			bowelAnswers.Clear();
			//qolAnswers.Clear();

			foreach (DataRow row in group)
			{
				int num;
				int? result;

				if (!surveyDate.HasValue)
					surveyDate = (DateTime) row["SurveyDate"];

				if (!int.TryParse(row["SurveyItemNum"].ToString(), out num))
					continue;

				int r;
				if (int.TryParse(row["SurveyItemResult"].ToString(), out r))
					result = r;
				else
					result = null;

				if (num >= 2 && num <= 7)
				{
					// erectileAnswers.Add(result);
					erectileAnswers[num - 2] = result;

					if (num == 4)
						penetrationResponse = result;
				}
				else if (num >= 8 && num <= 12)
				{
					urinaryAnswers.Add(result);

					if (num == 8)
						padResponse = result;
				}
				else if (num == 13)
				{
					bowelAnswers.Add(result);
					bowelHabitResponse = result;
				}
				else if (num == 14)
				{
					bowelAnswers.Add(result);
					bowelEnjoymentResponse = result;
				}
				else if (num == 15)
				{
					qolAnswer = result;
				}
				else if (num == 16)
				{
					if (row["SurveyItemResult"].ToString() == "Yes")
						physicianReported = false;
				}
			}

			#region rules per Dr. Vickers
			/* You give a score if at least 1 question answered. The score uses the formula:
			 * Score = Total of Items reported  / Number of item reported x Total items in domain
			 * e.g. If a patient answers 4 of 6 questions on IIEF, with a total score of 11, he would get 11 / 4 x 6 = 16.5 which you'd round to 17. */
			#endregion

			float erectileScore = CalculateErectileScore(erectileAnswers);
			float urinaryScore = 21 - CalculateScore(urinaryAnswers);
			float bowelScore = 8 - CalculateScore(bowelAnswers);
			//float qolScore = CalculateScore(qolAnswers);
			float qolScore = qolAnswer.HasValue ? qolAnswer.Value : 0;

			DataRow scoresRow = scoresTable.NewRow();

			scoresRow["SurveyId"] = surveyId;

			if (surveyDate.HasValue)
				scoresRow["SurveyDate"] = surveyDate.Value;

			scoresRow["TotalQuestions"] = erectileAnswers.Count() +
										  urinaryAnswers.Count() +
										  bowelAnswers.Count() +
										  1; // qol

			scoresRow["TotalQuestionsAnswered"] = erectileAnswers.Where(x => x.HasValue).Count() +
												  urinaryAnswers.Where(x => x.HasValue).Count() +
												  bowelAnswers.Where(x => x.HasValue).Count() +
												  (qolAnswer.HasValue ? 1 : 0);

			if (erectileAnswers.Where(x => x.HasValue).Count() > 0)
				scoresRow["EF_Score"] = erectileScore;

			scoresRow["EF_Possible"] = 30;

			if (urinaryAnswers.Where(x => x.HasValue).Count() > 0)
				scoresRow["UF_Score"] = urinaryScore;

			scoresRow["UF_Possible"] = 21;

			if (bowelAnswers.Where(x => x.HasValue).Count() > 0)
				scoresRow["BF_Score"] = bowelScore;

			scoresRow["BF_Possible"] = 8;

			if (qolAnswer.HasValue)
				scoresRow["GH_Score"] = qolScore;

			scoresRow["GH_Possible"] = 10;

			if (penetrationResponse.HasValue)
				scoresRow["PenetrationResponse"] = penetrationResponse.Value;

			if (padResponse.HasValue)
				scoresRow["PadResponse"] = padResponse.Value;

			if (bowelHabitResponse.HasValue)
				scoresRow["HabitResponse"] = bowelHabitResponse.Value;

			if (bowelEnjoymentResponse.HasValue)
				scoresRow["EnjoymentResponse"] = bowelEnjoymentResponse.Value;

			scoresRow["PhysicianReported"] = physicianReported;

			scoresTable.Rows.Add(scoresRow);
		}

		return scoresTable.DefaultView;
	}

    public DataView GetScores_Adjusted_ActiveSurvelliance(DataTable surveyTable)
    {
        // extracted for reuse elsewhere
        //DataTable surveyTable = new SurveyDa().GetSurveyItemsByPatient(patientId, MSKProstateQOLSurvey.ShortName);
        //DataTable surveyTable = GetSurveys(patientId);

        DataTable scoresTable = InitScoresTable();

        // this is equivalent to sorting a DataView of surveyTable, but groups the datarows by survey id
        var groups =
            from row in surveyTable.AsEnumerable()
            let id = (int)row["SurveyId"]
            let itemid = (int)row["SurveyItemId"]
            let date = (DateTime)row["SurveyDate"]
            orderby date ascending, id, itemid
            group row by id;

        // List<int?> erectileAnswers = new List<int?>(); // 2 - 7
        // question #2 has a minimum value of 1
        int?[] erectileAnswers = new int?[6]; // 2 - 7
        //List<int?> urinaryAnswers = new List<int?>(); // 8 - 12
        List<int?> urinaryAnswers = new List<int?>(); // 10 - 12
        List<int?> bowelAnswers = new List<int?>(); // 13 - 14
        //List<int?> qolAnswers = new List<int?>(); // 15
        int? qolAnswer = null; // 15


        foreach (IGrouping<int, DataRow> group in groups)
        {
            int surveyId = group.Key;
            DateTime? surveyDate = null;
            int? penetrationResponse = null;
            int? padResponse = null;
            int? bowelHabitResponse = null;
            int? bowelEnjoymentResponse = null;
            bool physicianReported = true; // false if "Patient reported" (Q16) = "Yes"

            // erectileAnswers.Clear();
            erectileAnswers = new int?[6];
            urinaryAnswers.Clear();
            bowelAnswers.Clear();
            //qolAnswers.Clear();

            foreach (DataRow row in group)
            {
                int num;
                int? result;

                if (!surveyDate.HasValue)
                    surveyDate = (DateTime)row["SurveyDate"];

                if (!int.TryParse(row["SurveyItemNum"].ToString(), out num))
                    continue;

                int r;
                if (int.TryParse(row["SurveyItemResult"].ToString(), out r))
                    result = r;
                else
                    result = null;

                if (num >= 2 && num <= 7)
                {
                    // erectileAnswers.Add(result);
                    erectileAnswers[num - 2] = result;

                    if (num == 4)
                        penetrationResponse = result;
                }
                //else if (num >= 8 && num <= 12)
                else if (num >= 10 && num <= 12)
                {
                    urinaryAnswers.Add(result);

                    if (num == 8)
                        padResponse = result;
                }
                else if (num == 13)
                {
                    bowelAnswers.Add(result);
                    bowelHabitResponse = result;
                }
                else if (num == 14)
                {
                    bowelAnswers.Add(result);
                    bowelEnjoymentResponse = result;
                }
                else if (num == 15)
                {
                    qolAnswer = result;
                }
                else if (num == 16)
                {
                    if (row["SurveyItemResult"].ToString() == "Yes")
                        physicianReported = false;
                }
            }

            #region rules per Dr. Vickers
            /* You give a score if at least 1 question answered. The score uses the formula:
			 * Score = Total of Items reported  / Number of item reported x Total items in domain
			 * e.g. If a patient answers 4 of 6 questions on IIEF, with a total score of 11, he would get 11 / 4 x 6 = 16.5 which you'd round to 17. */
            #endregion

            float erectileScore = CalculateErectileScore(erectileAnswers);
            //float urinaryScore = 21 - CalculateScore(urinaryAnswers);
            float urinaryScore = (21 - CalculateScore(urinaryAnswers)) * (8 / 3);
            float bowelScore = 8 - CalculateScore(bowelAnswers);
            //float qolScore = CalculateScore(qolAnswers);
            float qolScore = qolAnswer.HasValue ? qolAnswer.Value : 0;

            DataRow scoresRow = scoresTable.NewRow();

            scoresRow["SurveyId"] = surveyId;

            if (surveyDate.HasValue)
                scoresRow["SurveyDate"] = surveyDate.Value;

            scoresRow["TotalQuestions"] = erectileAnswers.Count() +
                                          urinaryAnswers.Count() +
                                          bowelAnswers.Count() +
                                          1; // qol

            scoresRow["TotalQuestionsAnswered"] = erectileAnswers.Where(x => x.HasValue).Count() +
                                                  urinaryAnswers.Where(x => x.HasValue).Count() +
                                                  bowelAnswers.Where(x => x.HasValue).Count() +
                                                  (qolAnswer.HasValue ? 1 : 0);

            if (erectileAnswers.Where(x => x.HasValue).Count() > 0)
                scoresRow["EF_Score"] = erectileScore;

            scoresRow["EF_Possible"] = 30;

            if (urinaryAnswers.Where(x => x.HasValue).Count() > 0)
                scoresRow["UF_Score"] = urinaryScore;

            scoresRow["UF_Possible"] = 21;

            if (bowelAnswers.Where(x => x.HasValue).Count() > 0)
                scoresRow["BF_Score"] = bowelScore;

            scoresRow["BF_Possible"] = 8;

            if (qolAnswer.HasValue)
                scoresRow["GH_Score"] = qolScore;

            scoresRow["GH_Possible"] = 10;

            if (penetrationResponse.HasValue)
                scoresRow["PenetrationResponse"] = penetrationResponse.Value;

            if (padResponse.HasValue)
                scoresRow["PadResponse"] = padResponse.Value;

            if (bowelHabitResponse.HasValue)
                scoresRow["HabitResponse"] = bowelHabitResponse.Value;

            if (bowelEnjoymentResponse.HasValue)
                scoresRow["EnjoymentResponse"] = bowelEnjoymentResponse.Value;

            scoresRow["PhysicianReported"] = physicianReported;

            scoresTable.Rows.Add(scoresRow);
        }

        return scoresTable.DefaultView;
    }

	private DataTable InitScoresTable()
	{
		DataTable t = new DataTable();
		DataColumnCollection c = t.Columns;

		c.Add("SurveyId", typeof(int));
		c.Add("SurveyDate", typeof(DateTime));
		c.Add("MonthsSinceSurgery", typeof(int));
		c.Add("TotalQuestions", typeof(int));
		c.Add("TotalQuestionsAnswered", typeof(int));
		c.Add("EF_Score", typeof(int));
		c.Add("EF_Possible", typeof(int));
		c.Add("UF_Score", typeof(int));
		c.Add("UF_Possible", typeof(int));
		c.Add("BF_Score", typeof(int));
		c.Add("BF_Possible", typeof(int));
		c.Add("GH_Score", typeof(int));
		c.Add("GH_Possible", typeof(int));
		c.Add("PenetrationResponse", typeof(int));
		c.Add("PadResponse", typeof(int));
		c.Add("HabitResponse", typeof(int));
		c.Add("EnjoymentResponse", typeof(int));
		c.Add("PhysicianReported", typeof(bool));

		return t;
	}

	private int CalculateErectileScore(int?[] answers)
	{
		int count = answers.Length;

		if (count == 0)
			return 0;

		int filterCount = 0;
		int sum = 0;

		for (int i = 0; i < count; i++)
		{
			int? a = answers[i];

			if (a.HasValue)
			{
				filterCount++;
				sum += i == 0 ? a.Value : a.Value - 1;
			}
		}

		if (filterCount == 0)
			return 0;

		return (int) Math.Round(sum / (float) filterCount * count, 0);
	}

	private int CalculateScore(IEnumerable<int?> list)
	{
		int count = list.Count();

		if (count == 0)
			return 0;

		var filter =
			from i in list
			where i.HasValue
			select i.Value - 1;

		int filterCount = filter.Count();

		if (filterCount == 0)
			return 0;

		return (int) Math.Round(filter.Sum() / (float) filterCount * count, 0);
	}
}

public class ActiveSurveillanceSurvey
{
    public const string shortName = "Active Surveillance Clinical Summary";
    public const string fullName = "Active Surveillance Clinical Summary";

    public static string ShortName
    {
        get { return shortName; }
    }

    public static string FullName
    {
        get { return fullName; }
    }

    public string[,] QuestionMap()
    {
        string[,] scores = new string[4, 4]
        {
             // Domain Summary Scales
            {"SF","Sexual Domain", "2,3,4,5,6,7", "1"},
            {"UF","Urinary Function Domain", "17,18,19,20,21,22,23", "1"},
            {"AX","Anxiety Domain", "24,25,26", "1"},
            {"GH","General Health", "15", "1"}
        };
        return scores;
    }

    public string[,] ResponseMap()
    {
        string[,] questionProperties = new string[18, 4]
        {
            // have items 1-5 with standardized values 0-100
            
            {"1","5","1", SurveyScoringUtil.DESCENDING}, // TODO: check this QUESTION; different on paper and in Caisis
            
			// sexual domain
			{"2","5","1", SurveyScoringUtil.ASCENDING},
            {"3","5","0", SurveyScoringUtil.ASCENDING},
            {"4","5","0", SurveyScoringUtil.ASCENDING},
            {"5","5","0", SurveyScoringUtil.ASCENDING},
            {"6","5","0", SurveyScoringUtil.ASCENDING},
            {"7","5","0", SurveyScoringUtil.ASCENDING},
            
            // urinary domain
			{"17","5","0", SurveyScoringUtil.ASCENDING},
            {"18","5","0", SurveyScoringUtil.ASCENDING},
            {"19","5","0", SurveyScoringUtil.ASCENDING},
            {"20","5","0", SurveyScoringUtil.ASCENDING},
            {"21","5","0", SurveyScoringUtil.ASCENDING},
            {"22","5","0", SurveyScoringUtil.ASCENDING},
            {"23","4","0", SurveyScoringUtil.ASCENDING},
           
            // bowel domain
            {"24","4","0", SurveyScoringUtil.DESCENDING},
            {"25","4","0", SurveyScoringUtil.DESCENDING},
            {"26","4","0", SurveyScoringUtil.DESCENDING},

            // general
            {"15","10","0", SurveyScoringUtil.ASCENDING}
        };

        return questionProperties;
    }

    public DataTable GetSurveys(int patientId)
    {
        return new SurveyDa().GetSurveyItemsByPatient(patientId, ShortName);
    }

    /// <summary>
    /// Get a DataView with scores order by most recent for all of the patients Prostate QOL Surveys
    /// </summary>
    /// <param name="patientId"></param>
    /// <returns></returns>
    public DataView GetScores(int patientId)
    {
        return GetScores(GetSurveys(patientId));
    }

    public DataView GetScores(DataTable surveyTable)
    {
        // extracted for reuse elsewhere
        //DataTable surveyTable = new SurveyDa().GetSurveyItemsByPatient(patientId, MSKProstateQOLSurvey.ShortName);
        //DataTable surveyTable = GetSurveys(patientId);

        DataTable scoresTable = InitScoresTable();

        // this is equivalent to sorting a DataView of surveyTable, but groups the datarows by survey id
        var groups =
            from row in surveyTable.AsEnumerable()
            let id = (int) row["SurveyId"]
            let itemid = (int) row["SurveyItemId"]
            let date = (DateTime) row["SurveyDate"]
            orderby date ascending, id, itemid
            group row by id;

        // List<int?> erectileAnswers = new List<int?>(); // 2 - 7
        // question #2 has a minimum value of 1
        int?[] erectileAnswers = new int?[6]; // 2 - 7
        List<int?> urinaryAnswers = new List<int?>(); // 17 - 23
        List<int?> bowelAnswers = new List<int?>(); // 13 - 14
        //List<int?> qolAnswers = new List<int?>(); // 15
        int? qolAnswer = null; // 15


        foreach (IGrouping<int, DataRow> group in groups)
        {
            int surveyId = group.Key;
            DateTime? surveyDate = null;
            int? penetrationResponse = null;
            int? padResponse = null;
            int? bowelHabitResponse = null;
            int? bowelEnjoymentResponse = null;
            bool physicianReported = true; // false if "Patient reported" (Q16) = "Yes"
            bool anxiety = false;

            // erectileAnswers.Clear();
            erectileAnswers = new int?[6];
            urinaryAnswers.Clear();
            bowelAnswers.Clear();
            //qolAnswers.Clear();

            foreach (DataRow row in group)
            {
                int num;
                int? result;

                if (!surveyDate.HasValue)
                    surveyDate = (DateTime) row["SurveyDate"];

                if (!int.TryParse(row["SurveyItemNum"].ToString(), out num))
                    continue;

                int r;
                if (int.TryParse(row["SurveyItemResult"].ToString(), out r))
                    result = r;
                else
                    result = null;

                if (num >= 2 && num <= 7)
                {
                    // erectileAnswers.Add(result);
                    erectileAnswers[num - 2] = result;

                    if (num == 4)
                        penetrationResponse = result;
                }
                else if (num >= 17 && num <= 23)
                {
                    urinaryAnswers.Add(result);

                    if (num == 8)
                        padResponse = result;
                }
                else if (num == 15)
                {
                    qolAnswer = result;
                }
                else if (num == 16)
                {
                    // bladder?
                }
                else if (num >= 24 && num <= 26)
                {
                    // anxiety?
                    if (result >= 3)
                    {
                        anxiety = true;
                    }
                }
            }

            float erectileScore = CalculateErectileScore(erectileAnswers);
            float urinaryScore = 39 - CalculateUFScore(urinaryAnswers);
            float bowelScore = 8 - CalculateScore(bowelAnswers);
            //float qolScore = CalculateScore(qolAnswers);
            float qolScore = qolAnswer.HasValue ? qolAnswer.Value : 0;

            DataRow scoresRow = scoresTable.NewRow();

            scoresRow["SurveyId"] = surveyId;

            if (surveyDate.HasValue)
                scoresRow["SurveyDate"] = surveyDate.Value;

            scoresRow["TotalQuestions"] = erectileAnswers.Count() +
                                          urinaryAnswers.Count() +
                                          bowelAnswers.Count() +
                                          1; // qol

            scoresRow["TotalQuestionsAnswered"] = erectileAnswers.Where(x => x.HasValue).Count() +
                                                  urinaryAnswers.Where(x => x.HasValue).Count() +
                                                  bowelAnswers.Where(x => x.HasValue).Count() +
                                                  (qolAnswer.HasValue ? 1 : 0);

            if (erectileAnswers.Where(x => x.HasValue).Count() > 0)
                scoresRow["EF_Score"] = erectileScore;

            scoresRow["EF_Possible"] = 30;

            if (urinaryAnswers.Where(x => x.HasValue).Count() > 0)
                scoresRow["UF_Score"] = urinaryScore;

            scoresRow["UF_Possible"] = 39;

            //if (bowelAnswers.Where(x => x.HasValue).Count() > 0)
            //    scoresRow["BF_Score"] = bowelScore;

            //scoresRow["BF_Possible"] = 8;

            scoresRow["Anxiety"] = anxiety;

            if (qolAnswer.HasValue)
                scoresRow["GH_Score"] = qolScore;

            scoresRow["GH_Possible"] = 10;

            if (penetrationResponse.HasValue)
                scoresRow["PenetrationResponse"] = penetrationResponse.Value;

            if (padResponse.HasValue)
                scoresRow["PadResponse"] = padResponse.Value;

            if (bowelHabitResponse.HasValue)
                scoresRow["HabitResponse"] = bowelHabitResponse.Value;

            if (bowelEnjoymentResponse.HasValue)
                scoresRow["EnjoymentResponse"] = bowelEnjoymentResponse.Value;

            scoresRow["PhysicianReported"] = physicianReported;

            scoresTable.Rows.Add(scoresRow);
        }

        return scoresTable.DefaultView;
    }

    private DataTable InitScoresTable()
    {
        DataTable t = new DataTable();
        DataColumnCollection c = t.Columns;

        c.Add("SurveyId", typeof(int));
        c.Add("SurveyDate", typeof(DateTime));
        c.Add("MonthsSinceSurgery", typeof(int));
        c.Add("TotalQuestions", typeof(int));
        c.Add("TotalQuestionsAnswered", typeof(int));
        c.Add("EF_Score", typeof(int));
        c.Add("EF_Possible", typeof(int));
        c.Add("UF_Score", typeof(int));
        c.Add("UF_Possible", typeof(int));
        //c.Add("BF_Score", typeof(int));
        //c.Add("BF_Possible", typeof(int));
        c.Add("Anxiety", typeof(bool));
        c.Add("GH_Score", typeof(int));
        c.Add("GH_Possible", typeof(int));
        c.Add("PenetrationResponse", typeof(int));
        c.Add("PadResponse", typeof(int));
        c.Add("HabitResponse", typeof(int));
        c.Add("EnjoymentResponse", typeof(int));
        c.Add("PhysicianReported", typeof(bool));

        return t;
    }

    private int CalculateErectileScore(int?[] answers)
    {
        int count = answers.Length;

        if (count == 0)
            return 0;

        int filterCount = 0;
        int sum = 0;

        for (int i = 0; i < count; i++)
        {
            int? a = answers[i];

            if (a.HasValue)
            {
                filterCount++;
                sum += i == 0 ? a.Value : a.Value - 1;
            }
        }

        if (filterCount == 0)
            return 0;

        return (int) Math.Round(sum / (float) filterCount * count, 0);
    }

    private int CalculateScore(IEnumerable<int?> list)
    {
        int count = list.Count();

        if (count == 0)
            return 0;

        var filter =
            from i in list
            where i.HasValue
            select i.Value - 1;

        int filterCount = filter.Count();

        if (filterCount == 0)
            return 0;

        return (int) Math.Round(filter.Sum() / (float) filterCount * count, 0);
    }

    private int CalculateUFScore(IEnumerable<int?> list)
    {
        int count = list.Count();

        if (count == 0)
            return 0;

        var filter =
            from i in list
            where i.HasValue
            select i.Value;

        int filterCount = filter.Count();

        if (filterCount == 0)
            return 0;

        return (int) Math.Round(filter.Sum() / (float) filterCount * count, 0);
    }
}

public class RANDSurvey// : ISurvey
{
   
    public RANDSurvey()
    {
    }

    // Survey Names in Survey Meta Data MUST match these!
    public const string PreTxSurveyName     = "RAND Pre Tx Survey";
    public const string EarlyTxSurveyName   = "RAND Post Early Tx Survey";
    public const string LateTxSurveyName    = "RAND Post Late Tx Survey";
    private const string shortName          = "RAND";
    //private const string fullName           = "RAND Survey";

    public static string ShortName
    {
        get { return shortName; }
    }

    //public static string FullName
    //{
    //    get { return fullName; }
    //}
   
    /// <summary>
    /// Fills an array with the section and corresponding question numbers that should be scored for UCLA RAND survey responses
    /// </summary>
    /// <returns>An array of sections with questions numbers</returns>
    public string[,] QuestionMap()
    {
        // array like: Short Score Name, Long Name, Questions Included
        string[,] scores = new string[7, 4]
        {
            {"BF", "Bowel Function", "13,14,15,16", "2" },
            {"SF", "Sexual Function", "18a,18b,18c,19,20,21,22,23", "4"}, 
            {"UF", "Urinary Function", "25,26,27,28a, 28b", "3"},
            {"BB", "Bowel Bother", "17", "1"},
            {"SB", "Sexual Bother", "24", "1"},
            {"UB", "Urinary Bother", "29", "1"},
            {"AUA", "AUA/General Urinary Function", "30a,30b,30c,30d,30e,30f,30g", "4"},
        }; // need to handle multi-part questions: 18,28,30
  
        return scores;
    }

    // takes a RAND Question Number and 
    // returns the three things you need to get a standardized score: number of responses available, the lowest incremental value, and if improvement is low to high or high to low
    // TODO: Either put this info in the DB OR at least make a Dictionary for quick lookups!
    public string[,] ResponseMap()
    {
        string[,] questionProperties = new string[27,4]
        {
            {"13","5","1", SurveyScoringUtil.ASCENDING},
            {"14","5","1", SurveyScoringUtil.DESCENDING},
            {"15","4","1", SurveyScoringUtil.ASCENDING},
            {"16","6","1", SurveyScoringUtil.ASCENDING},
            
            {"18a","5","1", SurveyScoringUtil.ASCENDING},
            {"18b","5","1", SurveyScoringUtil.ASCENDING},
            {"18c","5","1", SurveyScoringUtil.ASCENDING},
            {"19","4","1", SurveyScoringUtil.ASCENDING},
            {"20","5","1", SurveyScoringUtil.ASCENDING},
            {"21","5","1", SurveyScoringUtil.ASCENDING},
            {"22","3","1", SurveyScoringUtil.ASCENDING},
            {"23","5","1", SurveyScoringUtil.ASCENDING},

            {"25","4","1", SurveyScoringUtil.ASCENDING},
            {"26","4","1", SurveyScoringUtil.ASCENDING},
            {"27","4","1", SurveyScoringUtil.ASCENDING},
            {"28a","4","0", SurveyScoringUtil.DESCENDING},
            {"28b","4","0", SurveyScoringUtil.DESCENDING},

            {"17","5","1", SurveyScoringUtil.ASCENDING},

            {"24","5","1", SurveyScoringUtil.DESCENDING},

            {"29","5","1", SurveyScoringUtil.DESCENDING},

            // if properties of multipart questions are always the same may need to store only once
            {"30a","5","0", SurveyScoringUtil.DESCENDING},
            {"30b","5","0", SurveyScoringUtil.DESCENDING},
            {"30c","5","0", SurveyScoringUtil.DESCENDING},
            {"30d","5","0", SurveyScoringUtil.DESCENDING},
            {"30e","5","0", SurveyScoringUtil.DESCENDING},
            {"30f","5","0", SurveyScoringUtil.DESCENDING},
            {"30g","5","0", SurveyScoringUtil.DESCENDING}
        };

        return questionProperties;
    }

   
}

// EPIC- 26
public class EPICShortSurvey
{
    public const string shortName = "EPIC-26";

    // Survey Names in Survey Meta Data MUST the full name!
    public const string fullName = "EPIC-26 Short Survey";

    public static string ShortName
    {
        get { return shortName; }
    }

    public static string FullName
    {
        get { return fullName; }
    }

    
    public string[,] QuestionMap()
    {
        // THERE IS ALSO A FINAL SECTION WHICH IS NOT SCORED AS PART OF EPIC-26, but raw data should be reported (its 10 multipart questions)
        
        // array args: Short Score Name, Long Score Name, Item #'s Included, Number of non-missing items needed to computer score (otherwise set to score missing)
        string[,] scores = new string[5, 4]
        {
            // HRQOL Domain Summary Scales
            {"UI","Urinary Incontinence", "1,2,3,4a", "4"},
            {"UO","Urinary Irritative/Obstructive", "4b,4c,4d,4e", "4"},
            {"Bowel","Bowel", "6a,6b,6c,6d,6e,7", "5"},
            {"Sexual","Sexual", "8a,8b,9,10,11,12", "5"},
            {"Hormonal","Hormonal", "13a,13b,13c,13d,13e", "4"}
            
            // questions 5 (item 34) is not in any section/domain score
            // questions in the Final Section are also not in any scored section: Questions 1-10 (Items 87-117)
        };
        return scores;
    }

    public string[,] ResponseMap()
    {
        string[,] questionProperties = new string[26,4]
        {
            // items 35 - 41 not included in scoring doc. AUA section?

            // have items 1-5 with standardized values 0-100
            {"1","5","1", SurveyScoringUtil.ASCENDING},
            {"8a","5","1", SurveyScoringUtil.ASCENDING},
            {"8b","5","1", SurveyScoringUtil.ASCENDING},
            {"10","5","1", SurveyScoringUtil.ASCENDING},
            {"11","5","1", SurveyScoringUtil.ASCENDING},

            {"2","4","1", SurveyScoringUtil.ASCENDING},
            {"9","4","1", SurveyScoringUtil.ASCENDING},
           
            {"3","3","0", SurveyScoringUtil.DESCENDING},
            
            {"4a","4","0", SurveyScoringUtil.DESCENDING},
            {"4b","4","0", SurveyScoringUtil.DESCENDING},
            {"4c","4","0", SurveyScoringUtil.DESCENDING},
            {"4d","4","0", SurveyScoringUtil.DESCENDING},     
            {"4e","4","0", SurveyScoringUtil.DESCENDING},
            {"6a","4","0", SurveyScoringUtil.DESCENDING},
            {"6b","4","0", SurveyScoringUtil.DESCENDING},    
            {"6c","4","0", SurveyScoringUtil.DESCENDING},
            {"6d","4","0", SurveyScoringUtil.DESCENDING},
            {"6e","4","0", SurveyScoringUtil.DESCENDING},  
            {"13a","4","0", SurveyScoringUtil.DESCENDING},
            {"13b","4","0", SurveyScoringUtil.DESCENDING},          
            {"13c","4","0", SurveyScoringUtil.DESCENDING},
            {"13d","4","0", SurveyScoringUtil.DESCENDING},
            {"13e","4","0", SurveyScoringUtil.DESCENDING},

            {"5","5","1", SurveyScoringUtil.DESCENDING},
            {"7","5","1", SurveyScoringUtil.DESCENDING},
            {"12","5","1", SurveyScoringUtil.DESCENDING}

        };

        return questionProperties;
    }
}

// Inactive
public class EPICSurvey//: ISurvey
{
  
    public EPICSurvey()
    {

    }

    public const string shortName = "EPIC";
    public const string fullName = "EPIC Long Survey";

    public static string ShortName
    {
            get { return shortName; }
    }

    public static string FullName
    {
            get { return fullName; }
    }

    public string[,] QuestionMap()
    {
        // array args: Short Score Name, Long Score Name, Item #'s Included, Number of non-missing items needed to computer score (otherwise set to score missing)
        string[,] scores = new string[14, 4]
        {
            // Summary Scores
            {"US", "Urinary Summary", "23,24,25,26,27,28,29,30,31,32,33,34", "10"},
            {"BS", "Bowel Summary", "42,43,44,45,46,47,48,49,50,51,52,53,54,55", "12"}, 
            {"SS", "Sexual Summary", "56,57,58,59,60,61,62,63,64,65,66,67,68", "11"}, 
            {"HS", "Hormonal Summary", "69,70,71,72,73,74,75,76,77,78,79", "9"}, 

            // Urinary Subscales
            {"UF", "Urinary Function", "23,24,25,26,27", "4"}, 
            {"UB", "Urinary Bother", "28,29,30,31,32,33,34", "6"}, 
            {"UI", "Urinary Incontinence", "23,26,27,28", "4"}, 
            {"UO", "Urinary Obstructive", "24,25,29,30,31,32,33", "6"}, 

            // Bowel Subscales
            {"BF", "Bowel Function", "42,43,44,45,46,47,48", "6"}, 
            {"BB", "Bowel Bother", "49,50,51,52,53,54,55", "6"}, 

            // Sexual Subscores
            {"SF", "Sexual Function", "56,57,58,59,60,61,62,63,64", "8"}, 
            {"SB", "Sexual Bother", "65,66,67,68", "4"}, 

            // Hormonal Subscores
            {"HF", "Hormonal Function", "69,70,71,72,73", "4"}, 
            {"HB", "Hormonal Bother", "74,75,76,77,78,79", "5"}
        }; 
        return scores;
    }

    // takes a RAND Question Number and 
    // returns the three things you need to get a standardized score: number of responses available, the lowest incremental value, and if improvement is low to high or high to low
    // TODO: Either put this info in the DB OR at least make a Dictionary for quick lookups!
    public string[,] ResponseMap()
    {
        string[,] questionProperties = new string[50, 4]
        {
            // items 35 - 41 not included in scoring doc. AUA section?

            // have items 1-5 with standardized values 0-100
            {"23","5","1", SurveyScoringUtil.ASCENDING},
            {"24","5","1", SurveyScoringUtil.ASCENDING},
            {"25","5","1", SurveyScoringUtil.ASCENDING},
            {"42","5","1", SurveyScoringUtil.ASCENDING},
            {"43","5","1", SurveyScoringUtil.ASCENDING},
            {"48","5","1", SurveyScoringUtil.ASCENDING},
            {"56","5","1", SurveyScoringUtil.ASCENDING},
            {"57","5","1", SurveyScoringUtil.ASCENDING},
            {"58","5","1", SurveyScoringUtil.ASCENDING},
            {"60","5","1", SurveyScoringUtil.ASCENDING},
            {"61","5","1", SurveyScoringUtil.ASCENDING},
            {"62","5","1", SurveyScoringUtil.ASCENDING},
            {"63","5","1", SurveyScoringUtil.ASCENDING},
            {"64","5","1", SurveyScoringUtil.ASCENDING},
            {"69","5","1", SurveyScoringUtil.ASCENDING},
            {"70","5","1", SurveyScoringUtil.ASCENDING},
            {"71","5","1", SurveyScoringUtil.ASCENDING},
            {"72","5","1", SurveyScoringUtil.ASCENDING},

            {"26","4","1", SurveyScoringUtil.ASCENDING},
            {"59","4","1", SurveyScoringUtil.ASCENDING},

            {"27","4","0", SurveyScoringUtil.DESCENDING},

            {"28","5","0", SurveyScoringUtil.DESCENDING},
            {"29","5","0", SurveyScoringUtil.DESCENDING},
            {"30","5","0", SurveyScoringUtil.DESCENDING},
            {"31","5","0", SurveyScoringUtil.DESCENDING},
            {"32","5","0", SurveyScoringUtil.DESCENDING},
            {"33","5","0", SurveyScoringUtil.DESCENDING},
            {"49","5","0", SurveyScoringUtil.DESCENDING},
            {"50","5","0", SurveyScoringUtil.DESCENDING},
            {"51","5","0", SurveyScoringUtil.DESCENDING},
            {"52","5","0", SurveyScoringUtil.DESCENDING},
            {"53","5","0", SurveyScoringUtil.DESCENDING},
            {"54","5","0", SurveyScoringUtil.DESCENDING},
            {"65","5","0", SurveyScoringUtil.DESCENDING},
            {"66","5","0", SurveyScoringUtil.DESCENDING},
            {"67","5","0", SurveyScoringUtil.DESCENDING},
            {"74","5","0", SurveyScoringUtil.DESCENDING},
            {"75","5","0", SurveyScoringUtil.DESCENDING},
            {"76","5","0", SurveyScoringUtil.DESCENDING},
            {"77","5","0", SurveyScoringUtil.DESCENDING},
            {"78","5","0", SurveyScoringUtil.DESCENDING},
            {"79","5","0", SurveyScoringUtil.DESCENDING},

            {"34","5","1", SurveyScoringUtil.DESCENDING},
            {"44","5","1", SurveyScoringUtil.DESCENDING},
            {"45","5","1", SurveyScoringUtil.DESCENDING},
            {"46","5","1", SurveyScoringUtil.DESCENDING},
            {"55","5","1", SurveyScoringUtil.DESCENDING},
            {"68","5","1", SurveyScoringUtil.DESCENDING},

            {"47","3","1", SurveyScoringUtil.DESCENDING},

            // odd case; does not ascend or descend; values are 0,50,100,50,0
            {"73","5","1", SurveyScoringUtil.DESCENDING},
           
        };

        return questionProperties;
    }
}


#region Interface ISurvey

/*public interface ISurvey
{
       
        string ShortName
        {
            get;
        }

       
        string FullName
        {
            get;
        }
 }*/

 #endregion

#region graveyard
// EPIC- 26
/*
public class EPICShortSurvey
{
    public const string shortName = "EPIC-26";

    // Survey Names in Survey Meta Data MUST the full name!
    public const string fullName = "EPIC-26 Short Survey";

    public static string ShortName
    {
        get { return shortName; }
    }

    public static string FullName
    {
        get { return fullName; }
    }


    public string[,] QuestionMap()
    {
        // NOTE THESE ARE NOT QUESTION NO's. They are Item Numbers.. ie. Question 5f may be item number 20

        // array args: Short Score Name, Long Score Name, Item #'s Included, Number of non-missing items needed to computer score (otherwise set to score missing)
        string[,] scores = new string[5, 4]
        {
            // HRQOL Domain Summary Scales
            {"UI","Urinary Incontinence", "23,26,27,28", "4"},
            {"UO","Urinary Irritative/Obstructive", "29,30,31,33", "4"},
            {"Bowel","Bowel", "49,50,52,53,54,55", "5"},
            {"Sexual","Sexual", "57,58,59,60,64,68", "5"},
            {"Hormonal","Hormonal", "74,75,77,78,79", "4"}
        };
        return scores;
    }

    public string[,] ResponseMap()
    {
        string[,] questionProperties = new string[26, 4]
        {
            // items 35 - 41 not included in scoring doc. AUA section?

            // have items 1-5 with standardized values 0-100
            {"23","5","1", SurveyScoringUtil.ASCENDING},
            {"57","5","1", SurveyScoringUtil.ASCENDING},
            {"58","5","1", SurveyScoringUtil.ASCENDING},
            {"60","5","1", SurveyScoringUtil.ASCENDING},
            {"64","5","1", SurveyScoringUtil.ASCENDING},

            {"26","4","1", SurveyScoringUtil.ASCENDING},
            {"59","4","1", SurveyScoringUtil.ASCENDING},
           
            {"27","4","0", SurveyScoringUtil.DESCENDING},
            
            {"28","5","0", SurveyScoringUtil.DESCENDING},
            {"29","5","0", SurveyScoringUtil.DESCENDING},
            {"30","5","0", SurveyScoringUtil.DESCENDING},
            {"31","5","0", SurveyScoringUtil.DESCENDING},     
            {"33","5","0", SurveyScoringUtil.DESCENDING},
            {"49","5","0", SurveyScoringUtil.DESCENDING},
            {"50","5","0", SurveyScoringUtil.DESCENDING},    
            {"52","5","0", SurveyScoringUtil.DESCENDING},
            {"53","5","0", SurveyScoringUtil.DESCENDING},
            {"54","5","0", SurveyScoringUtil.DESCENDING},  
            {"74","5","0", SurveyScoringUtil.DESCENDING},
            {"75","5","0", SurveyScoringUtil.DESCENDING},          
            {"77","5","0", SurveyScoringUtil.DESCENDING},
            {"78","5","0", SurveyScoringUtil.DESCENDING},
            {"79","5","0", SurveyScoringUtil.DESCENDING},

            {"34","5","1", SurveyScoringUtil.DESCENDING},
            {"55","5","1", SurveyScoringUtil.DESCENDING},
            {"68","5","1", SurveyScoringUtil.DESCENDING},

        };

        return questionProperties;
    }
    
}*/
#endregion