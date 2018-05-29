using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Data;
using System.Data.SqlClient;



namespace Caisis.DataAccess
{
    /// <summary>
    /// SurveryDataAccess
    /// </summary>
    public class SurveyDa : BaseDA
    {

		public struct BaselineScores
		{
			public int? ErectileFunction;
			public int? UrinaryFunction;
		}


        public DataSet FormGetRecentSurveyByType(int PatientId, string FormName, string FormType, string SurveyType)
        {
            SqlCommand com = DataAccessHelper.CreateCommand("spFormGetRecentSurveyByType");
            DataAccessHelper.AddIntInputParam(com, "PatientId", PatientId);
            DataAccessHelper.AddStringInputParam(com, "FormName", FormName);
            DataAccessHelper.AddStringInputParam(com, "FormType", FormType);
            DataAccessHelper.AddStringInputParam(com, "SurveyType", SurveyType);
            DataSet ds = DataAccessHelper.GetList(com);

            return ds;
        }


        public DataSet FormGetSurveysByType(int PatientId, string FormName, string FormType, string SurveyType)
        {
            SqlCommand com = DataAccessHelper.CreateCommand("spFormGetSurveysByType");
            DataAccessHelper.AddIntInputParam(com, "PatientId", PatientId);
            DataAccessHelper.AddStringInputParam(com, "FormName", FormName);
            DataAccessHelper.AddStringInputParam(com, "FormType", FormType);
            DataAccessHelper.AddStringInputParam(com, "SurveyType", SurveyType);
            DataSet ds = DataAccessHelper.GetList(com);

            return ds;
        }


        public DataSet FormGetSurveyItemsByType(int PatientId, string FormName, string FormType, string SurveyType)
        {
            SqlCommand com = DataAccessHelper.CreateCommand("spFormGetSurveyItemsByType");
            DataAccessHelper.AddIntInputParam(com, "PatientId", PatientId);
            DataAccessHelper.AddStringInputParam(com, "FormName", FormName);
            DataAccessHelper.AddStringInputParam(com, "FormType", FormType);
            DataAccessHelper.AddStringInputParam(com, "SurveyType", SurveyType);
            DataSet ds = DataAccessHelper.GetList(com);

            return ds;
        }

        public DataSet FormGetSurveyItemsResult(int SurveyId, string FormName, string FormType, string SurveyItem)
        {
            SqlCommand com = DataAccessHelper.CreateCommand("spFormGetSurveyItemsResult");
            DataAccessHelper.AddIntInputParam(com, "SurveyId", SurveyId);
            DataAccessHelper.AddStringInputParam(com, "FormName", FormName);
            DataAccessHelper.AddStringInputParam(com, "FormType", FormType);
            DataAccessHelper.AddStringInputParam(com, "SurveyItem", SurveyItem);
            DataSet ds = DataAccessHelper.GetList(com);

            return ds;
        }


        public Hashtable FormGetPotencyStatusValues(int PatientId, string FormName, string FormType)
        {
            SqlCommand potencyStatusCom = DataAccessHelper.CreateCommand("spFormGetPotencyStatusValues");
            DataAccessHelper.AddIntInputParam(potencyStatusCom, "PatientId", PatientId);
            DataAccessHelper.AddStringInputParam(potencyStatusCom, "FormName", FormName);
            DataAccessHelper.AddStringInputParam(potencyStatusCom, "FormType", FormType);
            DataAccessHelper.AddStringOutputParam(potencyStatusCom, "LastPot");
            DataAccessHelper.AddStringOutputParam(potencyStatusCom, "PotLv3");
            DataAccessHelper.AddStringOutputParam(potencyStatusCom, "PotLv2");
            DataAccessHelper.AddStringOutputParam(potencyStatusCom, "PotLv1");
            DataAccessHelper.AddStringOutputParam(potencyStatusCom, "LastPotTx");
            DataAccessHelper.AddStringOutputParam(potencyStatusCom, "PreTxPot");
            DataAccessHelper.AddStringOutputParam(potencyStatusCom, "SexualQOL");

            Hashtable ht = DataAccessHelper.ExecuteScalar(potencyStatusCom);

            return ht;
        }


        public Hashtable FormGetUrinaryStatusValues(int PatientId, string FormName, string FormType)
        {
            SqlCommand UrinaryStatusCom = DataAccessHelper.CreateCommand("spFormGetUrinaryStatusValues");
            DataAccessHelper.AddIntInputParam(UrinaryStatusCom, "PatientId", PatientId);
            DataAccessHelper.AddStringInputParam(UrinaryStatusCom, "FormName", FormName);
            DataAccessHelper.AddStringInputParam(UrinaryStatusCom, "FormType", FormType);
            DataAccessHelper.AddStringOutputParam(UrinaryStatusCom, "LastCont");
            DataAccessHelper.AddStringOutputParam(UrinaryStatusCom, "ContLv2");
            DataAccessHelper.AddStringOutputParam(UrinaryStatusCom, "ContLv1");
            DataAccessHelper.AddStringOutputParam(UrinaryStatusCom, "LastIncontTx");
            DataAccessHelper.AddStringOutputParam(UrinaryStatusCom, "UrinaryQOL");

            Hashtable ht = DataAccessHelper.ExecuteScalar(UrinaryStatusCom);

            return ht;
        }

        /// <summary>
        /// Retreive data to populate Mullhall Sexual Function Follow Up 
        /// </summary>
        /// <param name="metaSurveyId"></param>
        /// <returns></returns>
        public DataSet FormGetSurveyErectileFunction(int PatientId)
        {
            SqlCommand com = DataAccessHelper.CreateCommand("spFormGetSurveyErectileFunction");
            DataAccessHelper.AddIntInputParam(com, "PatientId", PatientId);
            DataSet ds = DataAccessHelper.GetList(com);

            return ds;
        }
        #region METADATA SURVEY RELATED METHODS

        /// <summary>
        /// Returns a list of MetadataSurveyQuestions.
        /// </summary>
        /// <param name="metaDataSurveyId"></param>
        /// <returns></returns>
        public DataTable GetPatientMetaSurvey(int metaDataSurveyId)
        {
            return GetPatientMetaSurveyHelper(metaDataSurveyId, null);
        }

        /// <summary>
        /// Returns a list of MetadataSurveyQuestions joined to SurveyItems by Question Num and Question.
        /// </summary>
        /// <param name="metaDataSurveyId"></param>
        /// <param name="surveyId"></param>
        /// <returns></returns>
        public DataTable GetPatientMetaSurvey(int? metaDataSurveyId, int surveyId)
        {
            return GetPatientMetaSurveyHelper(metaDataSurveyId, surveyId);
        }
            
        /// <summary>
        /// Returns a list of unique pages from MetadataSurveyQuestions table.
        /// </summary>
        /// <param name="metaDataSurveyId"></param>
        /// <returns></returns>
        public DataTable GetPatientMetaSurveyPages(int metaDataSurveyId)
        {
            return GetPatientMetaSurveyPagesHelper(metaDataSurveyId, null);
        }

        /// <summary>
        /// Returns a list of unique pages from MetadataSurveyQuestions (joined with patient's survey items).
        /// </summary>
        /// <param name="metaDataSurveyId"></param>
        /// <param name="surveyId"></param>
        /// <returns></returns>
        public DataTable GetPatientMetaSurveyPages(int? metaDataSurveyId, int surveyId)
        {
            return GetPatientMetaSurveyPagesHelper(metaDataSurveyId, surveyId);
        }

        /// <summary>
        /// Returns a list of unique Survey Pages, Sections
        /// </summary>
        /// <param name="metaDataSurveyId"></param>
        /// <returns></returns>
        public DataTable GetPatientMetaSurveySections(int metaDataSurveyId)
        {
            return GetPatientMetaSurveySectionsHelper(metaDataSurveyId, null);
        }

        /// <summary>
        /// Returns a list of unique Survey Pages, Sections joined to patient's Survey Items
        /// </summary>
        /// <param name="metaDataSurveyId"></param>
        /// <param name="surveyId"></param>
        /// <returns></returns>
        public DataTable GetPatientMetaSurveySections(int? metaDataSurveyId, int surveyId)
        {
            return GetPatientMetaSurveySectionsHelper(metaDataSurveyId, surveyId);
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="metaDataSurveyId"></param>
        /// <param name="page"></param>
        /// <param name="section"></param>
        /// <returns></returns>
        public DataTable GetPatientMetaSurveySectionQuestions(int metaDataSurveyId, string page, string section)
        {
            return GetPatientMetaSurveySectionQuestionsHelper(metaDataSurveyId, null, page, section);
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="metaDataSurveyId"></param>
        /// <param name="surveyId"></param>
        /// <param name="page"></param>
        /// <param name="section"></param>
        /// <returns></returns>
        public DataTable GetPatientMetaSurveySectionQuestions(int? metaDataSurveyId, int surveyId, string page, string section)
        {
            return GetPatientMetaSurveySectionQuestionsHelper(metaDataSurveyId, surveyId, page, section);
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="metaDataSurveyId"></param>
        /// <param name="surveyId"></param>
        /// <returns></returns>
        private DataTable GetPatientMetaSurveyPagesHelper(int? metaDataSurveyId, int? surveyId)
        {
            string getAllQuestions = GetPatientMetaSurveySQL(metaDataSurveyId, surveyId);
            // get a list of Pages
            string getAllPagesByQuestions =
                @"
                SELECT
	                ISNULL(p.Page,'') as Page	
                FROM
                (
                    {0}
                ) p
                GROUP BY p.Page
                ORDER BY MIN(p.SortNumber)
                ";
            // dynamically fill in inner sql which gets all questions
            string sql = string.Format(getAllPagesByQuestions, getAllQuestions);
            SqlCommand com= GetPatientMetaSurveyExecuteSelect(sql, metaDataSurveyId, surveyId);
            return DataAccessHelper.GetRecord(com).Tables[0];
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="metaDataSurveyId"></param>
        /// <param name="surveyId"></param>
        /// <returns></returns>
        private DataTable GetPatientMetaSurveySectionsHelper(int? metaDataSurveyId, int? surveyId)
        {
            string getAllQuestions = GetPatientMetaSurveySQL(metaDataSurveyId, surveyId);
            // get a list of Page, Section
            string getAllPagesByQuestions =
                @"
                SELECT 
	                ISNULL(Page,'') as Page,
	                ISNULL(Section,'') AS Section,
	                MIN(p.SortNumber) AS SortNumber
                FROM
                (
                    {0}
                ) p
                GROUP BY
	                p.Page,
	                p.Section
                ORDER BY
	                MIN(p.SortNumber)
                ";
            // dynamically fill in inner sql which gets all questions
            string sql = string.Format(getAllPagesByQuestions, getAllQuestions);
            SqlCommand com= GetPatientMetaSurveyExecuteSelect(sql, metaDataSurveyId, surveyId);
            return DataAccessHelper.GetRecord(com).Tables[0];
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="metaDataSurveyId"></param>
        /// <param name="surveyId"></param>
        /// <param name="page"></param>
        /// <param name="section"></param>
        /// <returns></returns>
        private DataTable GetPatientMetaSurveySectionQuestionsHelper(int? metaDataSurveyId, int? surveyId, string page, string section)
        {
            string getAllQuestions = GetPatientMetaSurveySQL(metaDataSurveyId, surveyId);
            // get a list of Page, Section
            string getAllSectionQuestions =
                @"
                SELECT 
	                p.*
                FROM
                (
                    {0}
                ) p
                WHERE p.Page = @Page AND p.Section = @Section
                ORDER BY
	                p.SortNumber ASC
                ";
            // dynamically fill in inner sql which gets all questions
            string sql = string.Format(getAllSectionQuestions, getAllQuestions);
            SqlCommand com= GetPatientMetaSurveyExecuteSelect(sql, metaDataSurveyId, surveyId);
            // fill in extra params
            DataAccessHelper.AddStringInputParam(com, "Page", page);
            DataAccessHelper.AddStringInputParam(com, "Section", section);
            return DataAccessHelper.GetRecord(com).Tables[0];
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="metaDataSurveyId"></param>
        /// <param name="surveyId"></param>
        /// <returns></returns>
        private DataTable GetPatientMetaSurveyHelper(int? metaDataSurveyId, int? surveyId)
        {
            // get sql to return all questions
            string sql = GetPatientMetaSurveySQL(metaDataSurveyId, surveyId);
            SqlCommand com = GetPatientMetaSurveyExecuteSelect(sql, metaDataSurveyId, surveyId);
            return DataAccessHelper.GetRecord(com).Tables[0];
        }

        /// <summary>
        /// Returns a SQLCommand with MetadataSurveyId and optional SurveyId paramaters filled.
        /// </summary>
        /// <param name="sql"></param>
        /// <param name="metaDataSurveyId"></param>
        /// <param name="surveyId"></param>
        /// <returns></returns>
        private SqlCommand GetPatientMetaSurveyExecuteSelect(string sql, int? metaDataSurveyId, int? surveyId)
        {
            SqlCommand com = DataAccessHelper.CreateSqlCommand(sql);
            if (metaDataSurveyId.HasValue)
            {
                DataAccessHelper.AddIntInputParam(com, "MetadataSurveyId", metaDataSurveyId);
            }
            if (surveyId.HasValue)
            {
                DataAccessHelper.AddIntInputParam(com, "SurveyId", surveyId);
            }
            return com;
        }

        /// <summary>
        /// Returns the SQL which will select all meta survey questions joined to patient's survey (if not null).
        /// </summary>
        /// <param name="metaDataSurveyId">The MetadataSurveyId foreign key of MetadataSurveyQuestions table.</param>
        /// <param name="surveyId">Joins the meta questions to patient's survey items by survey id (no join if surveyid=null)</param>
        /// <returns></returns>
        private static string GetPatientMetaSurveySQL(int? metaDataSurveyId, int? surveyId)
        {
            string sql = string.Empty;
            // join to survey's survey items
            if (surveyId.HasValue)
            {
                sql =
                @"
                SELECT
                    -- actual survey item fields
                    a.SurveyId,
                    a.SurveyItemId,
                    a.SurveyItemResult,
                    a.SurveyItemNum,
                    a.SurveyItem,
                    -- normalized question num
                    ISNULL(a.SurveyItemNum, b.QuestionNumber) AS QuestionNumber,
                    -- normalized question
                    ISNULL(a.SurveyItem, b.Question) AS Question,
                    ISNULL(b.Page,'') as Page,
                    ISNULL(b.Section,'') AS Section,
                    ISNULL(b.SortNumber, 0) AS SortNumber,
                    b.MetadataSurveyQuestionId,
                    --b.QuestionNumber,
                    --b.Question,
                    --b.Page,
                    --b.Section,
                    --b.SortNumber,
                    b.ResponseType,
                    b.ResponseRequired,
                    b.ResponseLayout,
                    b.ResponseControlType,
                    b.ReponseEligibilityCriteria
                FROM
                (
	                SELECT 
		                a.SurveyType,
		                a.SurveyId,
		                b.SurveyItemId,
		                b.SurveyItemNum,
		                b.SurveyItem,
		                b.SurveyItemResult
	                FROM Surveys a
	                INNER JOIN SurveyItems b
		                ON a.SurveyId = b.SurveyId
	                WHERE b.SurveyId = @SurveyId
                ) a
                FULL JOIN 
                (
                    {0}
                )
                b
                ON 
                    a.SurveyType = b.SurveyType AND
                    a.SurveyItemNum = b.QuestionNumber AND
                    a.SurveyItem = b.Question
                ";

                string selectMetaSurvey = "";

                // join to meta survey table
                if (metaDataSurveyId.HasValue)
                {
                    selectMetaSurvey =
                        @"
                        SELECT 
	                        a.SurveyType,
	                        b.* 
                        FROM MetadataSurveys a
                        INNER JOIN MetadataSurveyQuestions b
	                        ON a.MetadataSurveyId = b.MetadataSurveyId
                        WHERE a.MetadataSurveyId = @MetadataSurveyId
                        ";
                }
                // otherwise join to empty table
                else
                {
                    selectMetaSurvey =
                        @"
                        SELECT * FROM
                        (
	                        SELECT
                                NULL AS SurveyType,
		                        NULL AS QuestionNumber,
		                        NULL AS Question,
		                        NULL AS Page,
		                        NULL AS Section,
		                        NULL AS SortNumber,    
		                        NULL AS MetadataSurveyQuestionId,
		                        NULL AS ResponseType,
		                        NULL AS ResponseRequired,
		                        NULL AS ResponseLayout,
		                        NULL AS ResponseControlType,
		                        NULL AS ReponseEligibilityCriteria
                        ) a
                        WHERE a.MetadataSurveyQuestionId IS NOT NULL
                        ";
                }

                // fill in SQL to get metadata survey
                sql = string.Format(sql, selectMetaSurvey);
            }
            // otheriwse, just return meta questions, with NULL survey item columns
            else if (metaDataSurveyId.HasValue)
            {
                sql =
                @"
	            SELECT 
		            NULL AS SurveyId,
		            NULL AS SurveyItemId,
		            NULL AS SurveyItemResult,
		            a.SurveyType,
		            b.* 
	            FROM MetadataSurveys a
	            INNER JOIN MetadataSurveyQuestions b
		            ON a.MetadataSurveyId = b.MetadataSurveyId
	            WHERE a.MetadataSurveyId = @MetadataSurveyId
                ";
            }
            else
            {
                throw new Exception("@MetadataSurveyId or @SurveyId are both NULL");
            }
            return sql;
        }

        #endregion

        public DataTable GetSurveyItemsByPatient(int patientId, string surveyType)
        {
            string sql = @"SELECT Surveys.SurveyId, Surveys.SurveyDate, Surveys.EnteredTime, SurveyItemId, SurveyItemNum, SurveyItem, SurveyItemResult 
            FROM Surveys INNER JOIN SurveyItems ON Surveys.SurveyId=SurveyItems.SurveyId 
            WHERE PatientId = @PatientId AND SurveyType = @SurveyType AND SurveyDate IS NOT NULL AND SurveyItemNum IS NOT NULL
            ORDER BY SurveyDate,Surveys.SurveyId,SurveyItemId";

            SqlCommand com = DataAccessHelper.CreateSqlCommand(sql);
            DataAccessHelper.AddIntInputParam(com, "PatientId", patientId);
            DataAccessHelper.AddStringInputParam(com, "SurveyType", surveyType);
            DataTable dt = DataAccessHelper.GetRecord(com).Tables[0];
            return dt;
        }

        public DataTable GetSurveyItems(int surveyId)
        {
            string sql = @"
            SELECT 
                Surveys.*, 
                SurveyItemId, SurveyItemNum, SurveyItem, SurveyItemResult, SurveyItemTotal,SurveyItemNotes   
            FROM Surveys 
                INNER JOIN SurveyItems ON Surveys.SurveyId=SurveyItems.SurveyId 
            WHERE Surveys.SurveyId = @SurveyId
            ORDER BY SurveyDate,Surveys.SurveyId,SurveyItemId";

            SqlCommand com = DataAccessHelper.CreateSqlCommand(sql);
            DataAccessHelper.AddIntInputParam(com, "SurveyId", surveyId);
            DataTable dt = DataAccessHelper.GetRecord(com).Tables[0];
            return dt;
        }

        public DataTable GetSurveysByPatient(int patientId)
        {
            string sql = @"SELECT * 
            FROM Surveys 
            WHERE PatientId = @PatientId 
            ORDER BY SurveyDate ASC";

            SqlCommand com = DataAccessHelper.CreateSqlCommand(sql);
            DataAccessHelper.AddIntInputParam(com, "PatientId", patientId);
            DataTable dt = DataAccessHelper.GetRecord(com).Tables[0];
            return dt;
        }


        /// <summary>
        /// Returns a list of Sections for a Survey, ordered by MIN(QuestionNum)
        /// </summary>
        /// <param name="metaSurveyId"></param>
        /// <returns></returns>
        public DataTable GetSurveySections(int metaSurveyId)
        {
            // OLD CODE, Group questions with empty sections
            //string sql = "SELECT ISNULL(Section,'') as Section,ISNULL(Page,'') as Page FROM MetadataSurveyQuestions WHERE MetadataSurveyId = @MetadataSurveyId ";
            //sql += "GROUP BY Section,Page ORDER BY MIN(SortNumber)";

            // NEW CODE, questions with no sections will be grouped seperately
            string sql = "SELECT * FROM ( ";
            sql += "SELECT DISTINCT MIN(SortNumber) SortNumber, Page, Section ";
            sql += "FROM MetadataSurveyQuestions ";
            sql += "WHERE Section IS NOT NULL AND Section <> '' AND MetadataSurveyId = @MetadataSurveyId  ";
            sql += "GROUP BY Page, Section ";
            sql += "UNION ALL ";
            sql += "SELECT DISTINCT SortNumber, Page, Section ";
            sql += "FROM MetadataSurveyQuestions ";
            sql += "WHERE (Section IS NULL OR Section = '') AND MetadataSurveyId = @MetadataSurveyId  ";
            sql += "GROUP BY SortNumber, Page, Section ";
            sql += ") SurveySections ";
            sql += "ORDER BY SurveySections.SortNumber ASC, SurveySections.Page ASC, SurveySections.Section ASC";
            SqlCommand com = DataAccessHelper.CreateSqlCommand(sql);
            DataAccessHelper.AddIntInputParam(com, "MetadataSurveyId", metaSurveyId);
            DataTable dt = DataAccessHelper.GetRecord(com).Tables[0];
            return dt;
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="metaSurveyId"></param>
        /// <returns></returns>
        public DataTable GetSurveyPages(int metaSurveyId)
        {
            string sql = "SELECT ISNULL(Page,'') as Page FROM MetadataSurveyQuestions WHERE MetadataSurveyId = @MetadataSurveyId ";
            sql += "GROUP BY Page ORDER BY MIN(SortNumber)";
            SqlCommand com = DataAccessHelper.CreateSqlCommand(sql);
            DataAccessHelper.AddIntInputParam(com, "MetadataSurveyId", metaSurveyId);
            DataTable dt = DataAccessHelper.GetRecord(com).Tables[0];
            return dt;
        }

        /// <summary>
        /// Returns the responses to a MetaSurvey Question with computed ResponseComputedText column
        /// </summary>
        /// <param name="metaQuestionId"></param>
        /// <returns></returns>
        public DataTable GetSurveyQuestionResponses(int metaQuestionId)
        {
            string sql = "SELECT MetadataSurveyQuestionId, MetadataQuestionResponseId, ResponseText, ResponseValue, ";
            sql += "CASE WHEN ResponseText = ResponseValue THEN ResponseValue ";
            sql += "WHEN ResponseText <> ResponseValue THEN ResponseText + ' (' + ResponseValue + ')' END ";
            sql += "AS ResponseComputedText FROM MetadataQuestionResponses WHERE MetadataSurveyQuestionId = @MetadataSurveyQuestionId";

            SqlCommand com = DataAccessHelper.CreateSqlCommand(sql);
            DataAccessHelper.AddIntInputParam(com, "MetadataSurveyQuestionId", metaQuestionId);
            DataTable dt = DataAccessHelper.GetRecord(com).Tables[0];
            return dt;
        }

        public DataSet FormGetSpecialRecords(int PatientId, string FormName, string FormType, string searchField, string searchClause, string searchFilter)
        {
            DataSet ds = new DataSet();

            if (FormType == "Dynamic" && !String.IsNullOrEmpty(searchFilter) && !String.IsNullOrEmpty(searchField))
            {
                string sql = "SELECT * ";
                sql += "FROM Surveys ";
                sql += "INNER JOIN SurveyItems ON Surveys.SurveyId=SurveyItems.SurveyId ";
                sql += "WHERE PatientId = @PatientId ";
                sql += "AND " + searchField + " " + searchClause + " (" + searchFilter + ") ";
                sql += "ORDER BY SurveyDate DESC, Surveys.SurveyId, SurveyItemId ";

                SqlCommand com = DataAccessHelper.CreateSqlCommand(sql);
                DataAccessHelper.AddIntInputParam(com, "PatientId", PatientId);

                ds = DataAccessHelper.GetRecord(com);
            }

            return ds;
        }

		public static void ConsumeProstateQOLSurveyDates(int patientId, Func<int, DateTime, bool> consumer)
		{
			string sql =
				@"SELECT SurveyId, SurveyDate
					FROM Surveys
					WHERE PatientId = @PatientId
					AND SurveyDate IS NOT NULL
					AND SurveyType = 'Prostate QOL Survey'
					ORDER BY SurveyDate";

			SqlCommand cmd = new SqlCommand(sql);
			cmd.Parameters.AddWithValue("@PatientId", patientId);

			Func<IDataRecord, bool> f =
				r =>
				{
					return consumer(r.GetInt32(0), r.GetDateTime(1));
				};

			Connectivity.ConsumeRecord(cmd, new Connectivity.RecordConsumerDelegate(f));
		}

		public static IDictionary<KeyValuePair<string, string>, string> GetSurveyItemResponseMap(string surveyType)
		{
			string sql =
				@"SELECT 
						MetadataSurveyQuestions.QuestionNumber,
						MetadataSurveyQuestions.Question, 
						MetadataQuestionResponses.ResponseText, 
						MetadataQuestionResponses.ResponseValue
					FROM MetadataQuestionResponses 
						INNER JOIN MetadataSurveyQuestions
							ON MetadataQuestionResponses.MetadataSurveyQuestionId =  MetadataSurveyQuestions.MetadataSurveyQuestionId
						INNER JOIN MetadataSurveys
							ON MetadataSurveyQuestions.MetadataSurveyId = MetadataSurveys.MetadataSurveyId
					WHERE MetadataSurveys.SurveyType = @SurveyType";

			SqlCommand cmd = new SqlCommand(sql);
			cmd.Parameters.AddWithValue("@SurveyType", surveyType);

			Dictionary<KeyValuePair<string, string>, string> map = new Dictionary<KeyValuePair<string, string>, string>();

			Func<IDataRecord, bool> consumer =
				record =>
				{
					string num = record.GetString(0);
					string question = record.GetString(1);
					string response = record.GetString(2);
					string val = record.GetString(3);

					map[new KeyValuePair<string, string>(question, val)] = response;
					map[new KeyValuePair<string, string>(num, val)] = response;
					return true;
				};

			Connectivity.ConsumeRecord(cmd, new Connectivity.RecordConsumerDelegate(consumer));

			return map;
		}

		public static BaselineScores GetPhysicianBaselineScores(int patientId, DateTime procedureDate)
		{
			#region sql
			string sql =
				@"SELECT
						CASE
							WHEN UrinaryFunction.SurveyDate <= CS.SurveyDate AND
								 COALESCE(UrinaryFunction.SurveyResult, UrinaryFunction.SurveyTotal) IS NOT NULL
								 THEN COALESCE(UrinaryFunction.SurveyResult, UrinaryFunction.SurveyTotal)
							WHEN CS.SurveyDate < UrinaryFunction.SurveyDate AND
								 Continence.SurveyItemResult IS NOT NULL
								 THEN Continence.SurveyItemResult
							ELSE COALESCE(UrinaryFunction.SurveyResult, UrinaryFunction.SurveyTotal, Continence.SurveyItemResult)
						END AS BaselineUFScore,
						CASE
							WHEN SexualFunction.SurveyDate <= EFS.SurveyDate AND
								 COALESCE(SexualFunction.SurveyResult, SexualFunction.SurveyTotal) IS NOT NULL
								 THEN COALESCE(SexualFunction.SurveyResult, SexualFunction.SurveyTotal)
							WHEN EFS.SurveyDate < SexualFunction.SurveyDate AND
								 ErectileFunction.SurveyItemResult IS NOT NULL
								 THEN ErectileFunction.SurveyItemResult
							ELSE COALESCE(SexualFunction.SurveyResult, SexualFunction.SurveyTotal, ErectileFunction.SurveyItemResult)
						END AS BaselineEFScore
					FROM
						Procedures P
							-- urinary
							LEFT OUTER JOIN Surveys UrinaryFunction
								ON UrinaryFunction.SurveyId =
								(
									SELECT TOP 1 SurveyId
									FROM Surveys
									WHERE PatientId = P.PatientId 
									AND SurveyType = 'Urinary Function'
									AND SurveyDate > P.ProcDate
									ORDER BY SurveyDate
								)

							LEFT OUTER JOIN SurveyItems Continence
								ON Continence.SurveyItemId =
								(
									SELECT TOP 1 SurveyItemId
									FROM Surveys
										INNER JOIN SurveyItems
											ON Surveys.SurveyId = SurveyItems.SurveyId
											AND SurveyItem = 'Continence'
									WHERE PatientId = P.PatientId
									AND SurveyType = 'Urinary Function'
									AND SurveyDate > P.ProcDate
									ORDER BY SurveyDate
								)

							LEFT OUTER JOIN Surveys CS
								ON Continence.SurveyId = CS.SurveyId

							-- erectile
							LEFT OUTER JOIN Surveys SexualFunction
								ON SexualFunction.SurveyId =
								(
									SELECT TOP 1 SurveyId
									FROM Surveys
									WHERE PatientId = P.PatientId 
									AND SurveyType = 'Sexual Function'
									AND SurveyDate > P.ProcDate
									ORDER BY SurveyDate
								)

							LEFT OUTER JOIN SurveyItems ErectileFunction
								ON ErectileFunction.SurveyItemId =
								(
									SELECT TOP 1 SurveyItemId
									FROM Surveys
										INNER JOIN SurveyItems
											ON Surveys.SurveyId = SurveyItems.SurveyId
											AND SurveyItem = 'Erectile Function'
									WHERE PatientId = P.PatientId
									AND SurveyType = 'Sexual Function'
									AND SurveyDate > P.ProcDate
									ORDER BY SurveyDate
								)

							LEFT OUTER JOIN Surveys EFS
								ON ErectileFunction.SurveyId = EFS.SurveyId

					WHERE P.ProcName IN ('CP','LP','LP_CONV','PP','RALP','RP','SalvCP','SalvLP','SalvRP') AND 
						  P.ProcDate = @ProcDate AND
						  P.PatientId = @PatientId";
			#endregion

			SqlCommand cmd = new SqlCommand(sql);
			cmd.Parameters.AddWithValue("@PatientId", patientId);
			cmd.Parameters.AddWithValue("@ProcDate", procedureDate);

			BaselineScores baseline = new BaselineScores();

			Connectivity.ConsumeRecord(
				cmd,
				record =>
				{
					int ef, uf;

					if (!record.IsDBNull(0) && int.TryParse(record.GetString(0), out uf))
						baseline.UrinaryFunction = uf;

					if (!record.IsDBNull(1) && int.TryParse(record.GetString(1), out ef))
						baseline.ErectileFunction = ef;

					return false;
				}
			);

			return baseline;
		}

        /// <summary>
        /// Returns a list of Surveys and Items by specified match expression ('%Like Match%' or 'Exact Match')
        /// </summary>
        /// <param name="patientId"></param>
        /// <param name="type"></param>
        /// <param name="fromDate"></param>
        /// <param name="toDate"></param>
        /// <returns></returns>
        public DataTable GetSurveysAndItemsByType(int patientId, string type, DateTime? fromDate, DateTime? toDate)
        {
            string sql =
            @"
            SELECT
	            a.SurveyId,
	            a.SurveyDateText,
	            a.SurveyDate,
	            a.SurveyType,
	            b.SurveyItemId,
	            b.SurveyItemNum,
	            b.SurveyItem,
	            b.SurveyItemResult
            FROM Surveys a
            INNER JOIN SurveyItems b
	            ON a.SurveyId = b.SurveyId
            WHERE
	            a.PatientId = @PatientId
	            AND a.SurveyType {0} @SurveyType
            ORDER BY
	            a.SurveyDate
            ";
            bool isLike = type.Contains("%");
            SqlCommand com = DataAccessHelper.CreateSqlCommand(string.Format(sql, isLike ? "LIKE" : "="));
            DataAccessHelper.AddIntInputParam(com, "PatientId", patientId);
            DataAccessHelper.AddStringInputParam(com, "SurveyType", type);
            DataAccessHelper.AddInputParam(com, "FromDate", fromDate, true);
            DataAccessHelper.AddInputParam(com, "ToDate", toDate, true);
            DataTable dt = DataAccessHelper.GetRecord(com).Tables[0];
            return dt;
        }

        public DataTable GetBreastQPhysicians(string datasetSQL)
        {
            string sql=
@"
SELECT DISTINCT a.ApptPhysician
FROM Appointments a
INNER JOIN ({0}) b
	ON a.ApptPatientId = b.PatientId
INNER JOIN Surveys c
    ON b.PatientId = c.PatientId
WHERE
    c.SurveyType LIKE '%Breast Q%'
ORDER BY
    ApptPhysician ASC
";
            SqlCommand com = DataAccessHelper.CreateSqlCommand(string.Format(sql,datasetSQL));
            DataTable dt = DataAccessHelper.GetRecord(com).Tables[0];
            return dt;
        }

        public void ConsumeBreastQSurveyDataByPhysician(string datasetSQL, string[] apptPhysicians, string surveyType, string[] surveyItems, Connectivity.RecordConsumerDelegate callback)
        {
            string sqlTemplate =
@"
SELECT
	a.ApptPatientId AS [PatientId]
FROM Appointments a
INNER JOIN ({0}) b
	ON a.ApptPatientId = b.PatientId
WHERE
	a.ApptPhysician IN ({1})
";
            var sqlParams = new Dictionary<string, string>();            
            // add apptCaseSurgeons list
            for (int i = 0; i < apptPhysicians.Length; i++)
            {
                string paramName = "ApptPhysician" + i;
                string paramValue = apptPhysicians[i];
                sqlParams.Add(paramName, paramValue);
            }
            string apptCaseSurgeonList = "@" + string.Join(",@", sqlParams.Keys.ToArray());

            // add survey type
            sqlParams.Add("SurveyType", surveyType);

            // get sql
            string fullDatasetSQL = string.Format(sqlTemplate, datasetSQL, apptCaseSurgeonList);
            _ConsumeBreastQSurveyData(fullDatasetSQL, surveyType, surveyItems, sqlParams, callback);
        }

        public void ConsumeBreastQSurveyDataByPatient(string datasetSQL, int patientId, string surveyType, string[] surveyItems, Connectivity.RecordConsumerDelegate callback)
        {
            string sqlTemplate =
            @"
            SELECT
	            a.PatientId
            FROM Patients a
            INNER JOIN ({0}) b
	            ON a.PatientId = b.PatientId
            WHERE
	            a.PatientId = {1}
            "; 

            // get sql
            string fullDatasetSQL = string.Format(sqlTemplate, datasetSQL, patientId);
            ConsumeBreastQSurveyData(fullDatasetSQL, surveyType, surveyItems, callback);
        }

        public void ConsumeBreastQSurveyData(string datasetSQL, string surveyType, string[] surveyItems, Connectivity.RecordConsumerDelegate callback)
        {            
            var sqlParams = new Dictionary<string, string>() 
            {
                { "SurveyType", surveyType }
            };
            _ConsumeBreastQSurveyData(datasetSQL, surveyType, surveyItems, sqlParams, callback);
		
        }

        private static void _ConsumeBreastQSurveyData(string datasetSQL, string surveyType, string[] surveyItems, Dictionary<string, string> sqlParams, Connectivity.RecordConsumerDelegate callback)
        {
            string sqlTemplate =
@"
SELECT
*
FROM
(
	SELECT
		p.PatientId,
        p.PtMRN,
		s.SurveyId,
		s.SurveyDate,
		si.SurveyItemNum,
		si.SurveyItemResult
	FROM Surveys s
    INNER JOIN ({0}) ds
        ON s.PatientId = ds.PatientId
    INNER JOIN Patients p
        ON ds.PatientId = p.PatientId
	INNER JOIN SurveyItems si
		ON s.SurveyId = si.SurveyId
	WHERE
		s.SurveyType = @SurveyType
	)
AS S
PIVOT
(
	MIN(SurveyItemResult)
	FOR SurveyItemNum IN ({1})
) AS P
ORDER BY
	PatientId,
	SurveyDate
";
            List<string> sanitizedSurveyItems = new List<string>();
            // validate non-alpha characters
            System.Text.RegularExpressions.Regex regexValidator = new System.Text.RegularExpressions.Regex("[^a-zA-Z0-9]");
            foreach (string item in surveyItems)
            {
                string sanitizedSurveyItem = regexValidator.Replace(item, "");
                if (sanitizedSurveyItem == item && !sanitizedSurveyItems.Contains(sanitizedSurveyItem))
                {
                    sanitizedSurveyItems.Add(sanitizedSurveyItem);
                }
            }
            string dynamicColumns = "[" + string.Join("],[", sanitizedSurveyItems.ToArray()) + "]";
            string fullSQL = string.Format(sqlTemplate, datasetSQL, dynamicColumns);

            SqlCommand cmd = DataAccessHelper.CreateSqlCommand(fullSQL);
            foreach (var param in sqlParams)
            {
                DataAccessHelper.AddStringInputParam(cmd, param.Key, param.Value);
            }

            Connectivity.ConsumeRecord(cmd, (record) =>
            {
                callback(record);
                return true;
            });

        }


        /// <summary>
        /// Returns a list of Surveys and Items by specified match expression ('%Like Match%' or 'Exact Match')
        /// </summary>
        /// <param name="patientId"></param>
        /// <param name="type"></param>
        /// <returns></returns>
        public DataTable GetMostRecentSurveyWithItemsByType(int patientId, string type)
        {
            string sql =
            @"
            SELECT * FROM
            (
                SELECT TOP 1 *
                FROM Surveys
                WHERE PatientId = @PatientId AND SurveyType {0} @SurveyType
                ORDER BY SurveyDate DESC
            ) a
            INNER JOIN SurveyItems b
	            ON a.SurveyId = b.SurveyId
            ORDER BY b.SurveyItemNum

            ";
            bool isLike = type.Contains("%");
            SqlCommand com = DataAccessHelper.CreateSqlCommand(string.Format(sql, isLike ? "LIKE" : "="));
            DataAccessHelper.AddIntInputParam(com, "PatientId", patientId);
            DataAccessHelper.AddStringInputParam(com, "SurveyType", type);
            DataTable dt = DataAccessHelper.GetRecord(com).Tables[0];
            return dt;
        }



    }
}
