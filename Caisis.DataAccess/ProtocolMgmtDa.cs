using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Text;
using System.Linq;

namespace Caisis.DataAccess
{
    public struct CallBackVars
    {
        public string Value;
        public string Type;
        public string SortString;
    }

    public class ProtocolMgmtDa
    {
        public static string[] PROTOCOL_RACES = new string[]
        {
            "White Non-Hispanic",
            "White Hispanic",
            "Asian",
            "Black or African American",
            "Native American/ Alaska Native",
            "Native Hawaiian or Other Pacific Islander",
            "More than one race",
            "Unknown or not reported"
        };

        /// <summary>
        /// Return a list of all Schemas for a Protocol.
        /// SELECT ProtocolSchemaId, ProtocolArmDescription, ProtocolVersionId, VersionNumber
        /// </summary>
        /// <param name="protocolId"></param>
        /// <returns></returns>
        public static DataTable GetSchemasByProtocol(int protocolId)
        {
            string sql =
            @"
            SELECT
	            ProtocolSchemaId,
	            ProtocolArmDescription,
	            MaxAccrual,
	            CurrentAccrual,
	            CASE
		            WHEN CurrentAccrual >= MaxAccrual
		            THEN 1
		            ELSE 0
	            END AS IsMaxAccrual,  
	            ProtocolVersionId,
	            VersionNumber
            FROM
            (
	            SELECT 
		            ps.ProtocolSchemaId, 
		            ps.ProtocolArmDescription,
		            AVG(ps.ProtocolArmMaxAccrual) AS MaxAccrual,
		            COUNT(pps.PatientSchemaId) AS CurrentAccrual,
		            pv.ProtocolVersionId,
		            pv.VersionNumber
	            FROM ProtocolMgr_ProtocolSchemas ps
	            INNER JOIN ProtocolMgr_ProtocolVersions pv
		            ON ps.ProtocolVersionId = pv.ProtocolVersionId
	            LEFT OUTER JOIN ProtocolMgr_PatientSchemas pps
		            ON ps.ProtocolSchemaId = pps.ProtocolSchemaId
            	WHERE
                    pv.ProtocolId = @ProtocolId 
	            GROUP BY
		            ps.ProtocolSchemaId, 
		            ps.ProtocolArmDescription,                
		            pv.ProtocolVersionId,
		            pv.VersionNumber
            ) a
            ";

            SqlCommand cmd = DataAccessHelper.CreateSqlCommand(sql);
            DataAccessHelper.AddIntInputParam(cmd, "ProtocolId", protocolId);

            DataTable dt = new DataTable();
            DataAccessHelper.GetList(cmd, dt);

            return dt;
        }

        /// <summary>
        /// Returns a list of Schema by Protocol Verion.
        /// </summary>
        /// <param name="versionId"></param>
        /// <returns></returns>
        public static DataTable GetSchemasByProtocolVersion(int versionId)
        {
            string sql =
            @"
            SELECT
                a.ProtocolSchemaId,
                a.ProtocolVersionId,
                a.ProtocolArmNumber, 
                a.ProtocolArmActive,
                a.ProtocolArmMaxAccrual,	
                a.ProtocolArmDescription,
                ISNULL(b.PatientSchemaCount, 0) PatientSchemaCount
            FROM ProtocolMgr_ProtocolSchemas a 
            LEFT OUTER JOIN 
            (
                SELECT
                    a.ProtocolSchemaId,
                    COUNT(a.PatientSchemaId) PatientSchemaCount
                FROM ProtocolMgr_PatientSchemas a INNER JOIN ProtocolMgr_ProtocolSchemas b 
                ON a.ProtocolSchemaId = b.ProtocolSchemaId
                WHERE b.ProtocolVersionId = @VersionId
                GROUP BY a.ProtocolSchemaId
            ) b 
            ON a.ProtocolSchemaId = b.ProtocolSchemaId
            WHERE ProtocolVersionId = @VersionId
            ";

            SqlCommand cmd = DataAccessHelper.CreateSqlCommand(sql);
            DataAccessHelper.AddIntInputParam(cmd, "VersionId", versionId);

            DataTable dt = new DataTable();
            DataAccessHelper.GetList(cmd, dt);

            return dt;
        }

        /// <summary>
        /// Builds a sql statement which returns a list of Protocols,
        /// with optional paramters to restrict results between rows.
        /// Rows are restricted by index, so for the first 5 rows, startIndex=0, endIndex=4
        /// </summary>
        /// <param name="strWhereClause"></param>
        /// <param name="startIndex">The start index of the row to return.</param>
        /// <param name="endIndex">The end index of the row to return.</param>
        /// <param name="sortColumn"></param>
        /// <param name="sortDirection"></param>
        /// <returns></returns>
        private static string GetAllProtocolsSql(String strWhereClause, int? startIndex, int? endIndex, string sortColumn, string sortDirection, int? userId)
        {
            bool restrictByRows = startIndex.HasValue && endIndex.HasValue;
            bool restrictByUser = userId.HasValue;
            string SQL_BASE = @"
            SELECT * FROM
            (
                SELECT *, 
                -- order field, before searching
		        ROW_NUMBER() OVER (ORDER BY {0}) AS RowNum
                FROM
                (
                    SELECT * FROM
                    (
	                    SELECT 
		                    p.ProtocolId,
		                    p.ProtocolNum,
		                    p.ProtocolTitle,
		                    COUNT(ps.ProtocolSchemaId) SchemaCount                    
	                    FROM Protocols p
		                    LEFT OUTER JOIN ProtocolMgr_ProtocolVersions pv
		                    ON pv.ProtocolId = p.ProtocolId
		                    LEFT OUTER JOIN ProtocolMgr_ProtocolSchemas ps
		                    ON pv.ProtocolVersionId = ps.ProtocolVersionId
                            -- optional filter by user
                            {3}
                            -- optional search filter
                            {1}
	                    GROUP BY 
		                    p.ProtocolId,
		                    p.ProtocolNum,
		                    p.ProtocolTitle
                    ) a
                ) a
            ) a
            -- optional row filter
            {2}";

            // build order by col and direction
            string orderBy = !string.IsNullOrEmpty(sortColumn) && !string.IsNullOrEmpty(sortDirection) ? string.Format("{0} {1}", sortColumn, sortDirection) : "ProtocolNum ASC";

            string filterBySearch = string.Empty;
            string filterByUser = string.Empty;
            // filter by search clause (i.e., field like '%seach%')
            if (!string.IsNullOrEmpty(strWhereClause))
            {
                filterBySearch = strWhereClause;
            }
            string filterByRange = string.Empty;
            // filter by rows 
            if (restrictByRows)
            {
                // normalize index to row number,
                // i.e., 0-4, 5 records, row numbers between 1 and 5
                // i.e., 5-9, 5 records, row numbers between 6 and 10
                int sRowNum = startIndex.Value + 1; // start row num should be >= 0
                int eRowNum = endIndex.Value + 1;

                filterByRange = string.Format("WHERE RowNum BETWEEN {0} AND {1}", sRowNum, eRowNum);
            }
            if (restrictByUser)
            {
                string userSQL =
                @"
                SELECT
	                g.ProtocolId
                FROM Users a
                INNER JOIN Contact b
	                ON a.UserId = b.UserId
                INNER JOIN ProjectOrganization_ProjectContact c
	                ON b.ContactId = c.ContactId
                INNER JOIN ProjectOrganization d
	                ON c.OrganizationId = d.OrganizationId
                INNER JOIN Project_ProjectOrganization e
	                ON e.OrganizationId = d.OrganizationId
                INNER JOIN Project f
	                ON e.ProjectId = f.ProjectId
                INNER JOIN Protocols g
	                ON f.ProjectId = g.ProjectId
                WHERE
	                a.UserId =
                " + userId.Value;
                filterByUser = string.Format("INNER JOIN ({0}) user_p ON user_p.ProtocolId = p.ProtocolId", userSQL);
            }

            // finally format sql with inner and outer restrictions (if applicable)
            return string.Format(SQL_BASE, orderBy, filterBySearch, filterByRange, filterByUser);
        }

        /// <summary>
        /// Returns a list of all Protocol records
        /// </summary>
        /// <returns></returns>
        public static DataTable GetAllProtocols()
        {
            SqlCommand com = DataAccessHelper.CreateSqlCommand(GetAllProtocolsSql(null, null, null, null, null, null));

            DataTable dt = DataAccessHelper.GetRecord(com).Tables[0];
            return dt;
        }

        public static DataTable GetAllProtocolsWithProjects()
        {
            string sql =
            @"
            SELECT
	            a.ProtocolId,
	            b.ProjectId,
	            a.ProtocolTitle,
	            a.ProtocolNum,
	            b.Title as ProjectTitle,
	            b.ProjectNum
            FROM Protocols a
            INNER JOIN Project b
	            ON a.ProjectId = b.ProjectId
            ";
            SqlCommand com = DataAccessHelper.CreateSqlCommand(sql);
            DataTable dt = DataAccessHelper.GetRecord(com).Tables[0];
            return dt;
        }

        /// <summary>
        /// Returns a list of all Protocol Records specified in range start to end.
        /// i.e., startIndex=0,endIndex=4, will return upto first 5 records.
        /// i.e., startIndex=5,endIndex=9, will return upto 6th through 10th records.
        /// </summary>
        /// <param name="startIndex"></param>
        /// <param name="endIndex"></param>
        /// <param name="sortColumn"></param>
        /// <param name="sortExpression"></param>
        /// <returns></returns>
        public static DataTable GetAllProtocols(int startIndex, int endIndex, string sortColumn, string sortExpression, int? userId)
        {
            SqlCommand com = DataAccessHelper.CreateSqlCommand(GetAllProtocolsSql(string.Empty, startIndex, endIndex, sortColumn, sortExpression, userId));
            DataTable dt = DataAccessHelper.GetRecord(com).Tables[0];
            return dt;
        }

        /// <summary>
        /// Return the number of Protocol records
        /// </summary>
        /// <param name="userId">Restrict Protocols to User</param>
        /// <returns></returns>
        public static int GetProtocolCount(int? userId)
        {
            string getProtocolsSQL = GetAllProtocolsSql(string.Empty, null, null, string.Empty, string.Empty, userId);
            string getProtocolCountSQL = string.Format("SELECT COUNT(ProtocolId) FROM ({0}) a", getProtocolsSQL);
            SqlCommand com = DataAccessHelper.CreateSqlCommand(getProtocolCountSQL);
            DataTable dt = DataAccessHelper.GetRecord(com).Tables[0];
            return int.Parse(dt.Rows[0][0].ToString());
        }

        public static DataTable ProtocolMgmtSearch(CallBackVars callbackVars, string[] searchColumnsProtocol, string[] searchColumnsSchema, string sortColumn, string sortDirection, int? userId)
        {
            string where = string.Empty;
            // build where clause to filter by search
            if (!String.IsNullOrEmpty(callbackVars.Value))
            {
                where += " WHERE ";
                where += GetMatchExpr(callbackVars.Value, searchColumnsProtocol);

                if (searchColumnsSchema.Length > 0)
                {
                    where += " OR ";
                    where += GetMatchExpr(callbackVars.Value, searchColumnsSchema);
                }
            }
            string sql = GetAllProtocolsSql(where, null, null, sortColumn, sortDirection, userId);
            SqlCommand com = DataAccessHelper.CreateSqlCommand(sql);
            DataTable dt = DataAccessHelper.GetRecord(com).Tables[0];
            return dt;
        }

        /// <summary>
        /// Returns the SQL to restrict to schemas in schemaIds.
        /// (ProtocolMgr_ProtocolSchemas.ProtocolSchemaId IN (1,3,7,8,12) )
        /// </summary>
        /// <param name="schemaIds"></param>
        /// <returns></returns>
        private static string GetSchemaString(IEnumerable<int> schemaIds)
        {
            if (schemaIds.Count() > 0)
            {
                string csvSchemaIds = string.Join(",", schemaIds.Select(sid => sid.ToString()).ToArray());
                string restrictBySchema = string.Format(" (ProtocolMgr_ProtocolSchemas.ProtocolSchemaId IN ({0}) ) ", csvSchemaIds);
                return restrictBySchema;
            }
            // empty list should return any results
            else
            {
                string restrictBySchema = " (ProtocolMgr_ProtocolSchemas.ProtocolSchemaId IS NULL) ";
                return restrictBySchema;
            }
        }

        public static IEnumerable<string> GetSurveyTypesByTimelineId(int timelineId)
        {
            #region sql
            string sql =
                @"SELECT DestValue
                    FROM ProtocolMgr_ItemTimeline
	                    INNER JOIN ProtocolMgr_SchemaItemFields 
		                    ON ProtocolMgr_ItemTimeline.SchemaItemId = ProtocolMgr_SchemaItemFields.SchemaItemId
		                    AND ProtocolMgr_SchemaItemFields.DestTable = 'Surveys' 
		                    AND ProtocolMgr_SchemaItemFields.DestField = 'SurveyType'
                    WHERE TimelineId = @TimelineId
                    ORDER BY DestValue";
            #endregion

            List<string> surveyTypes = new List<string>();
            SqlCommand cmd = DataAccessHelper.CreateSqlCommand(sql);
            DataAccessHelper.AddIntInputParam(cmd, "TimelineId", timelineId);

            using (SqlConnection conn = cmd.Connection)
            {
                conn.Open();

                using (SqlDataReader r = cmd.ExecuteReader())
                {
                    while (r.Read())
                        surveyTypes.Add(r.GetString(0));
                }
            }

            return surveyTypes;
        }

        public static DataTable GetSurveyItemsByTimelineId(int timelineId, params string[] surveyTypes)
        {
            #region sql
            string sql =
@"
-- The section is only needed in SSMS when keeping the window open for work
/*
IF OBJECT_ID('tempdb..#PatientSurveys') IS NOT NULL
    DROP TABLE #PatientSurveys
IF OBJECT_ID('tempdb..#TempItemNums') IS NOT NULL
    DROP TABLE #TempItemNums
IF OBJECT_ID('tempdb..#PatientRecords') IS NOT NULL
    DROP TABLE #PatientRecords 
*/

DECLARE @ProtocolId int
--Retrieve the protocol id for the selected timeline
SET @ProtocolId = (SELECT TOP 1 d.ProtocolId
                   FROM ProtocolMgr_Timeline a INNER JOIN
                        ProtocolMgr_ProtocolSchemas b ON a.ProtocolSchemaId = b.ProtocolSchemaId INNER JOIN
                        ProtocolMgr_ProtocolVersions c ON b.ProtocolVersionId = c.ProtocolVersionId INNER JOIN
                        Protocols d ON c.ProtocolId = d.ProtocolId
                   WHERE a.TimeLineId = @TimelineId)

--For the given timeline/visit, cache the keys, tables and field for patient data entered on the visit
--Not filtering by dest table and dest field name here due query inefficiency
SELECT DISTINCT DestTablePrimKey,ProtocolMgr_ItemTimeline.ItemTimelineId, DestTable, DestField INTO #PatientRecords
FROM ProtocolMgr_PatientItems
 INNER JOIN ProtocolMgr_PatientItemFields
    ON ProtocolMgr_PatientItems.PatientItemId = ProtocolMgr_PatientItemFields.PatientItemId
 INNER JOIN ProtocolMgr_SchemaItemFields
    ON ProtocolMgr_PatientItemFields.SchemaItemFieldId = ProtocolMgr_SchemaItemFields.SchemaItemFieldId
    AND DestTablePrimKey IS NOT NULL
    AND ItemTimelineId IS NOT NULL
INNER JOIN ProtocolMgr_ItemTimeline
    ON ProtocolMgr_PatientItems.ItemTimelineId = ProtocolMgr_ItemTimeline.ItemTimelineId
 INNER JOIN ProtocolMgr_Timeline
    ON ProtocolMgr_ItemTimeline.TimelineId = ProtocolMgr_Timeline.TimelineId
    AND ProtocolMgr_Timeline.TimelineId = @TimelineId

--Cahce the surveys entered for the selected visit
--This query was separated from the above by design to speed execution time.
SELECT DISTINCT DestTablePrimKey, ItemtimelineId INTO #PatientSurveys
FROM #PatientRecords
WHERE DestTable= 'Surveys' AND
      DestField = 'SurveyType' 

--Cache this resultset so it can be reused in below dynamic query
SELECT 
 DISTINCT SurveyType, COALESCE(SurveyItemNum, SUBSTRING(SurveyItem, 0, 5)) AS SurveyItemName
INTO #TempItemNums
FROM #PatientSurveys
 INNER JOIN Surveys
    ON #PatientSurveys.DestTablePrimKey = Surveys.SurveyId
 INNER JOIN SurveyItems
    ON Surveys.SurveyId = SurveyItems.SurveyId
 {0}
            
 DECLARE @dynamic_columns varchar(max)
 DECLARE @query varchar(max)

 SELECT
    @dynamic_columns =
    STUFF(
       (SELECT ',[' + SUBSTRING(#TempItemNums.SurveyType + ': ' + #TempItemNums.SurveyItemName, 0, 128) + ']'
       FROM #TempItemNums
       ORDER BY 
          #TempItemNums.SurveyType,
          LEN(#TempItemNums.SurveyItemName),
          #TempItemNums.SurveyItemName
       FOR XML PATH('')),
       1, 1, '')
 		
--PRINT @dynamic_columns

 SET @query =
 'SELECT *
 FROM
 (
    SELECT
       Surveys.PatientId,
         -- StudyId
       PatientProtocols.PtProtocolStudyId AS StudyId,
       --PtMRN,
       --PtFirstName,
       --PtLastName,
       DisplayUnitName + '' '' + CONVERT(varchar, NumberOfUnits) as Visit,
       VisitLabel,
       SUBSTRING(SurveyType + '': '' + COALESCE(SurveyItemNum, SUBSTRING(SurveyItem, 0, 5)), 0, 128) AS SurveyTypeItem,
       SurveyItemResult
    FROM #PatientSurveys  
          INNER JOIN Surveys
             ON #PatientSurveys.DestTablePrimKey = Surveys.SurveyId
          INNER JOIN SurveyItems
             ON Surveys.SurveyId = SurveyItems.SurveyId
          INNER JOIN PatientProtocols
             ON PatientProtocols.PatientId = Surveys.PatientId AND
                PatientProtocols.ProtocolId = ' + CONVERT(varchar, @ProtocolId) + '
          INNER JOIN ProtocolMgr_ItemTimeline
             ON #PatientSurveys.ItemTimelineId = ProtocolMgr_ItemTimeline.ItemTimelineId
          INNER JOIN ProtocolMgr_Timeline
             ON ProtocolMgr_ItemTimeline.TimelineId = ProtocolMgr_Timeline.TimelineId
             AND ProtocolMgr_Timeline.TimelineId = ' + CONVERT(varchar, @TimelineId) + '
 ) AS P
 PIVOT
 (
    MIN(SurveyItemResult)
    FOR SurveyTypeItem IN (' + @dynamic_columns +')
 ) AS PVT
 ORDER BY 1'

--PRINT @query
EXEC (@query)
";
            #endregion

            SqlCommand cmd = null;

            if (surveyTypes.Length > 0)
            {
                // construct a sequence of dynamic sql parameters
                string s = "WHERE Surveys.SurveyType IN ({0})";
                StringBuilder b = new StringBuilder();

                for (int i = 1; i <= surveyTypes.Length; i++)
                {
                    if (i > 1)
                        b.Append(", ");

                    b.Append("@S").Append(i);
                }

                // create the command
                string surveys = string.Format(s, b.ToString());
                //cmd = DataAccessHelper.CreateWarehouseSqlCommand(string.Format(wsql, surveys));
                cmd = DataAccessHelper.CreateSqlCommand(string.Format(sql, surveys));

                // apply the parameters
                for (int i = 1; i <= surveyTypes.Length; i++)
                {
                    string param = "S" + i.ToString();
                    DataAccessHelper.AddStringInputParam(cmd, param, surveyTypes[i - 1]);
                }
            }
            else
            {
                //cmd = DataAccessHelper.CreateWarehouseSqlCommand(string.Format(wsql, ""));
                cmd = DataAccessHelper.CreateSqlCommand(string.Format(sql, ""));
            }

            DataAccessHelper.AddIntInputParam(cmd, "TimelineId", timelineId);

            DataTable dt = new DataTable();
            DataAccessHelper.GetList(cmd, dt);

            return dt;
        }

        /// <summary>
        /// Returns the full timeline of all patients (by dataset) for the specified Protocol.
        /// </summary>
        /// <param name="protocolId">The pri key of the Protocol.</param>
        /// <param name="dataset">Restricts to patients in this dataset.</param>
        /// <param name="includeDeceasedPatients">includes a list of deceased patients in the list</param>
        /// <returns>A list of all patients' schedules on the Protocol.</returns>
        public static DataTable GetFullTimeline(int protocolId, string dataset, bool includeDeceasedPatients)
        {
            return GetFullTimeline(protocolId, null, dataset, includeDeceasedPatients);
        }

        /// <summary>
        /// Returns the full timeline of all patients (by dataset) for the specified Protocol.
        /// </summary>
        /// <param name="protocolId">The pri key of the Protocol.</param>
        /// <param name="schemaIds">Restricts search to patients on these treatment arms.</param>
        /// <param name="dataset">Restricts to patients in this dataset.</param>
        /// <param name="includeDeceasedPatients">includes a list of deceased patients in the list</param>
        /// <returns>A list of all patients' schedules on the Protocol.</returns>
        public static DataTable GetFullTimeline(int protocolId, IEnumerable<int> schemaIds, string dataset, bool includeDeceasedPatients)
        {
            //SqlCommand cmd = DataAccessHelper.CreateCommand("spGetProtocolCalendarTimeline");

            string sql =
                    @" SELECT DISTINCT DSET.PatientId, ProtocolMgr_PatientSchemas.ProtocolSchemaId, ProtocolMgr_PatientSchemas.StartDate, 
						DSET.PtFirstName, DSET.PtLastName, Patients.PtDeathDate, Patients.PtDeathDateText, ProtocolMgr_PatientItems.ScheduledDate, 
						ProtocolMgr_PatientItems.FirstAnticipatedDate, ProtocolMgr_PatientItems.LastAnticipatedDate, ProtocolMgr_PatientItems.Status,
						DATEADD(DAY, FLOOR(DATEDIFF(DAY, ProtocolMgr_PatientItems.FirstAnticipatedDate, ProtocolMgr_PatientItems.LastAnticipatedDate) / 2), ProtocolMgr_PatientItems.FirstAnticipatedDate) as MedAnticipatedDate,
						ProtocolMgr_SchemaItems.ItemDescription, ProtocolMgr_ItemTimeline.TimelineId, Protocols.ProtocolId, 
						ProtocolMgr_Timeline.DisplayUnitName, ProtocolMgr_Timeline.NumberOfUnits, ProtocolMgr_Timeline.BufferUnitName, ProtocolMgr_Timeline.BufferNumberOfUnitsPlus, ProtocolMgr_Timeline.BufferNumberOfUnitsMinus, 
                        PatientProtocols.PtProtocolStudyId, ProtocolMgr_PatientItems.PatientSchemaId, ProtocolMgr_SchemaItems.SchemaItemId 
						
						FROM ProtocolMgr_PatientSchemas
							JOIN ({0}) AS DSET
								ON ProtocolMgr_PatientSchemas.PatientId = DSET.PatientId INNER JOIN
                              -- get all items accounting for unscheduled/dependent items
                              ({1}) ProtocolMgr_PatientItems
                              ON ProtocolMgr_PatientSchemas.PatientSchemaId = ProtocolMgr_PatientItems.PatientSchemaId INNER JOIN
                              ProtocolMgr_ItemTimeline ON ProtocolMgr_PatientItems.ItemTimelineId = ProtocolMgr_ItemTimeline.ItemTimelineId INNER JOIN
                              ProtocolMgr_Timeline ON ProtocolMgr_ItemTimeline.TimelineId = ProtocolMgr_Timeline.TimelineId INNER JOIN
                              ProtocolMgr_SchemaItems ON ProtocolMgr_ItemTimeline.SchemaItemId = ProtocolMgr_SchemaItems.SchemaItemId INNER JOIN
                              ProtocolMgr_ProtocolSchemas ON 
                              ProtocolMgr_PatientSchemas.ProtocolSchemaId = ProtocolMgr_ProtocolSchemas.ProtocolSchemaId AND 
                              ProtocolMgr_Timeline.ProtocolSchemaId = ProtocolMgr_ProtocolSchemas.ProtocolSchemaId AND 
                              ProtocolMgr_SchemaItems.ProtocolSchemaId = ProtocolMgr_ProtocolSchemas.ProtocolSchemaId INNER JOIN
                              ProtocolMgr_ProtocolVersions ON 
                              ProtocolMgr_ProtocolSchemas.ProtocolVersionId = ProtocolMgr_ProtocolVersions.ProtocolVersionId INNER JOIN
                              Protocols ON ProtocolMgr_ProtocolVersions.ProtocolId = Protocols.ProtocolId INNER JOIN
                              PatientProtocols ON Protocols.ProtocolId = PatientProtocols.ProtocolId AND DSET.PatientId = PatientProtocols.PatientId INNER JOIN
                              Patients ON DSET.PatientId = Patients.PatientId


						WHERE Protocols.ProtocolId = @ProtocolId ";
            if (schemaIds != null)
                sql += " AND " + GetSchemaString(schemaIds);
            // deceased patients filter
            if (!includeDeceasedPatients)
                sql += " AND (PtDeathDateText IS NULL AND PtDeathDate IS NULL)";
            sql += " ORDER BY FirstAnticipatedDate, LastAnticipatedDate";

            string computedPatientItemSQL = GetComputedTimelineSQL(null);

            SqlCommand cmd = DataAccessHelper.CreateSqlCommand(String.Format(sql, dataset, computedPatientItemSQL));
            DataAccessHelper.AddStringInputParam(cmd, "Dataset", dataset);
            DataAccessHelper.AddIntInputParam(cmd, "ProtocolId", protocolId);
            DataTable table = new DataTable();
            DataAccessHelper.GetList(cmd, table);
            return table;
        }

        /// <summary>
        /// Gets a list of distinct Timeline records for the patient's calendar
        /// </summary>
        /// <param name="protocolId"></param>
        /// <param name="patientId"></param>
        /// <param name="dataset"></param>
        /// <param name="visitDatasetSQL"></param>
        /// <param name="includeUnscheduled"></param>
        /// <param name="includeOffStudy"></param>
        /// <returns></returns>
        public static DataTable GetPatientTimelineVisits(int protocolId, int patientId, string dataset, string visitDatasetSQL, bool includeUnscheduled, bool includeOffStudy)
        {
            string sql = GetTimelineSQL(protocolId, patientId, dataset, visitDatasetSQL, new string[0], includeUnscheduled, includeOffStudy);
            string format =
@"
    SELECT
        TimelineId,
        ISNULL(PreStudySchemaItem, 0) AS [PreStudySchemaItem],
        VisitLabel,
        MIN(ScheduledDate) AS [ScheduledDate]
    FROM ({0}) a
    GROUP BY
	    TimelineId,
	    PreStudySchemaItem,
	    VisitLabel
    ORDER BY
	    ScheduledDate ASC
";
            SqlCommand cmd = DataAccessHelper.CreateSqlCommand(string.Format(format, sql));
            DataAccessHelper.AddIntInputParam(cmd, "ProtocolId", protocolId);
            DataAccessHelper.AddIntInputParam(cmd, "PatientId", patientId);
            DataTable table = new DataTable();
            DataAccessHelper.GetList(cmd, table);
            return table;

            /* v2
            string format =
@"
    
DECLARE @_PatientInfo TABLE
(
	PatientProtocolId int not null,
	PatientSchemaId int not null,
	OnStudyDate datetime not null,
	Status varchar(50) NULL,
	StatusDate datetime NULL
)

INSERT INTO @_PatientInfo
SELECT
	pp.PatientProtocolId,
	pps.PatientSchemaId,		
	MAX(pp_status.PtProtocolStatusDate) AS [OnStudyDate],
	pp_other_status.PtProtocolStatus,
	pp_other_status.PtProtocolStatusDate
FROM ProtocolMgr_PatientSchemas pps
INNER JOIN ProtocolMgr_ProtocolSchemas ps
	ON pps.ProtocolSchemaId = ps.ProtocolSchemaId
INNER JOIN ProtocolMgr_ProtocolVersions pv
	ON ps.ProtocolVersionId = pv.ProtocolVersionId
INNER JOIN Protocols p
	ON p.ProtocolId = pv.ProtocolId
INNER JOIN PatientProtocols pp
	ON pps.PatientId = pp.PatientId AND p.ProtocolId = pp.ProtocolId
INNER JOIN PatientProtocolStatus pp_status
	ON pp.PatientProtocolId = pp_status.PatientProtocolId
LEFT OUTER JOIN PatientProtocolStatus pp_other_status
	ON pp.PatientProtocolId = pp_other_status.PatientProtocolId 
WHERE
	pp_status.PtProtocolStatusDate IS NOT NULL
	AND
	pp_status.PtProtocolStatus = 'On Study'
	AND
	pp.ProtocolId = @ProtocolId AND pp.PatientId = @PatientId
GROUP BY
	pp.PatientId,
	pps.PatientSchemaId,
	pp.PatientProtocolId,
	pp_other_status.PtProtocolStatus,
	pp_other_status.PtProtocolStatusDate

SELECT
	TimelineId,
	VisitLabel
FROM
(
SELECT
	TimelineId,
	VisitLabel,
	MIN(Calc_ScheduledDate) AS Calc_ScheduledDate
FROM
(
SELECT
	TimelineId,
	VisitLabel,
	DATEADD(DAY, 0 - [shift_buffer_plus], [Calc_Last]) AS [Calc_ScheduledDate]
FROM
(
	SELECT
		TimelineId,
		VisitLabel,
		DATEADD(DAY, (NumberOfUnits * shiftdays) - (BufferNumberOfUnitsMinus * shift_buffer) + [shift_offset], [StartScheduledDate]) AS [Calc_First],
		DATEADD(DAY, (NumberOfUnits * shiftdays) + (BufferNumberofUnitsPlus * [shift_buffer]) + [shift_offset], [StartScheduledDate]) AS [Calc_Last],
		BufferNumberofUnitsPlus * [shift_buffer] AS [shift_buffer_plus]
	FROM
	(
		SELECT
			-- timeline
			TimelineId,
			VisitLabel,
			a.PatientItemId,
			b.PatientItemId AS [Related_PatientItemId],
			-- calc scheduled date
			a.OnStudyDate,
			a.ScheduledDate,
			b.ScheduledDate AS [DependentItem_Date],
			-- anchor date
			COALESCE(pp_info.StatusDate,b.ScheduledDate, a.ScheduledDate) AS [StartScheduledDate],
			a.Status,
			b.Status AS [DependentItem_Status],
			pp_info.Status AS [DependentStatus_Status],
			pp_info.StatusDate AS [DependentStatus_Date],
			NumberOfUnits,
			BufferNumberOfUnitsMinus,
			BufferNumberOfUnitsPlus,
			[shiftdays],
			[shift_offset],
			[shift_buffer]
		FROM
		(
			SELECT
				a.PatientProtocolId,
				a.PatientSchemaId,
				t.TimelineId,
				t.VisitLabel,
				it.ItemTimelineId,
				pi.PatientItemId,
				a.OnStudyDate,
				pi.ScheduledDate,
				pi.FirstAnticipatedDate,
				pi.LastAnticipatedDate,
				pi.Status,
				t.ItemIntervalType,
				t.DisplayUnitName,
				t.NumberOfUnits,
				t.BufferUnitName,
				t.BufferNumberOfUnitsMinus,
				t.BufferNumberOfUnitsPlus,
				CASE DisplayUnitName
					WHEN 'Day' THEN 1
					WHEN 'Week' THEN 7
					WHEN 'Month' THEN 28
					ELSE 0
				END AS [shiftdays], 
				CASE BufferUnitName
					WHEN 'Day' THEN 1
					WHEN 'Week' THEN 7
					WHEN 'Month' THEN 28
					ELSE 0
				END	AS [shift_buffer],
				-- offset: regular: Day 1 = First Day, dependent: Day 1 = 1 Day after
				CASE
					WHEN DisplayUnitName = 'Day' AND ItemIntervalType NOT LIKE '%Dependent%' THEN -1
					ELSE 0
				END AS [shift_offset]
			FROM @_PatientInfo a
			INNER JOIN {0} pi
				ON a.PatientSchemaId = pi.PatientSchemaId
			INNER JOIN ProtocolMgr_ItemTimeline it
				ON pi.ItemTimelineId = it.ItemTimelineId
			INNER JOIN ProtocolMgr_Timeline t
				ON it.TimelineId = t.TimelineId
		) a
		-- OPTIONAL: Dependent on Item
		LEFT OUTER JOIN
		(
			SELECT
				source_items.PatientSchemaId,
				source_items.PatientItemId,
				source_Items.ScheduledDate,
				source_Items.Status,
				related.SrcPrimaryKey
			FROM ProtocolMgr_PatientItems source_items
			INNER JOIN ProtocolMgr_ItemTimeline pit
			ON pit.ItemTimelineId = source_items.ItemTimelineId
			-- join to related records: restrict to itme timelines which are dependent on this visit's item
			INNER JOIN RelatedRecords related
			ON  related.SrcTableName = 'ProtocolMgr_Timeline'
			AND related.DestTableName = 'ProtocolMgr_ItemTimeline'
			AND related.DestPrimaryKey = pit.ItemTimelineId
			AND related.SrcSystem = 'Caisis'
		) b
		ON	a.TimelineId = b.SrcPrimaryKey
			-- restrict to items which are siblings of this visit's item
			AND a.PatientSchemaId = b.PatientSchemaId
			AND a.ItemIntervalType IN ('Dependent', 'Recurring|Dependent', 'Dependent|Recurring')
		-- OPTIONAL: Dependent on Status
		LEFT OUTER JOIN @_PatientInfo pp_info
			ON pp_info.PatientProtocolId = a.PatientProtocolId
			AND
			a.ItemIntervalType LIKE '%Dependent %'
			AND
			pp_info.StatusDate IS NOT NULL
			AND
			-- i.e., Dependent on 'Off Treatment'
			pp_info.Status = REPLACE(REPLACE(REPLACE(ItemIntervalType,'Recurring', ''), '|', ''), 'Dependent ','')
		-- filtering
		WHERE
			b.PatientItemId IS NULL OR	b.Status = 'Performed'
	) a
) a
) a
WHERE
	Calc_ScheduledDate IS NOT NULL
GROUP BY
	TimelineId,
	VisitLabel
) a
ORDER BY
	Calc_ScheduledDate ASC
";
            string patientItemDatasetSQL = "";
            if (!string.IsNullOrEmpty(visitDatasetSQL))
            {
                patientItemDatasetSQL = string.Format("({0})", visitDatasetSQL);
            }
            else
            {
                patientItemDatasetSQL = "ProtocolMgr_PatientItems";
            }
            SqlCommand cmd = DataAccessHelper.CreateSqlCommand(string.Format(format, patientItemDatasetSQL));
            DataAccessHelper.AddIntInputParam(cmd, "ProtocolId", protocolId);
            DataAccessHelper.AddIntInputParam(cmd, "PatientId", patientId);
            DataTable table = new DataTable();
            DataAccessHelper.GetList(cmd, table);
            return table;
           */
        }

        /// <summary>
        /// For the specified Protocol and Dataset, Visit Dataset (optional) and Patient (optional), get the SQL for the Timeline.
        /// </summary>
        /// <param name="protocolId"></param>
        /// <param name="patientId"></param>
        /// <param name="datasetSQL"></param>
        /// <param name="visitDatasetSQL"></param>
        /// <param name="restrictions"></param>
        /// <param name="includeUnscheduled"></param>
        /// <param name="includeOffStudyVisits"></param>
        /// <returns></returns>
        private static string GetTimelineSQL(int protocolId, int? patientId, string datasetSQL, string visitDatasetSQL, IEnumerable<string> restrictions, bool includeUnscheduled, bool includeOffStudyVisits)
        {
            string sql =
@"
SELECT DISTINCT
    -- patient
	patients.PtFirstName,
	patients.PtLastName,
	patients.PtDeathDate,
	patients.PtDeathDateText,
    -- protocol
    p.ProtocolId,
    -- patient protocol
    pp.PatientId,
    pp.PatientProtocolId,
    pp.PtProtocolStudyId,
    -- patient schema
    pps.ProtocolSchemaId,
    pps.PatientSchemaId,
    pps.StartDate,
    [OnStudyDate],
	[OffTreatmentDate],
	[OffStudyDate],
	-- visit
	t.TimelineId,
	t.DisplayColumnPosition,
	ISNULL(t.PreStudySchemaItem, 0) AS [PreStudySchemaItem],
	t.DisplayUnitName,
	t.NumberOfUnits,
    t.BufferUnitName,
	t.BufferNumberOfUnitsPlus,
	t.BufferNumberOfUnitsMinus,
	t.VisitLabel,
	-- items
    si.SchemaItemId,
	si.ItemDescription,
    sif.DestTable,
	-- patient item
	pi.PatientItemId,
	pi.ScheduledDate,
	pi.FirstAnticipatedDate,
	pi.LastAnticipatedDate,
	pi.Status	
FROM
-- get patient protocol info
(
    SELECT DISTINCT
        ProtocolId,
        PatientId,
	    PatientProtocolId,
        PtProtocolStudyId,
        [On Study] AS [OnStudyDate],
	    [Off Treatment] AS [OffTreatmentDate],
	    [Off Study] AS [OffStudyDate]
    FROM
    (
	    SELECT
		    pp.ProtocolId,
		    pp.PatientId,
		    pp.PatientProtocolId,
            pp.PtProtocolStudyId,
		    pps.PtProtocolStatus,
		    pps.PtProtocolStatusDate
	    FROM PatientProtocols pp
	    LEFT OUTER JOIN PatientProtocolStatus pps
		    ON pp.PatientProtocolId = pps.PatientProtocolId
	    WHERE
            pp.ProtocolId = @ProtocolId
    ) a
    PIVOT
    (
	    MIN(PtProtocolStatusDate)
	    FOR PtProtocolStatus IN ([On Study],[Off Treatment],[Off Study])
    ) AS a
) AS pp
INNER JOIN ({0}) dataset
	ON pp.PatientId = dataset.PatientId
INNER JOIN Patients patients
    ON dataset.PatientId = patients.PatientId
INNER JOIN Protocols p
	ON pp.ProtocolId = p.ProtocolId
INNER JOIN ProtocolMgr_ProtocolVersions pv
	ON p.ProtocolId = pv.ProtocolId
INNER JOIN ProtocolMgr_ProtocolSchemas ps
	ON pv.ProtocolVersionId = ps.ProtocolVersionId
INNER JOIN ProtocolMgr_PatientSchemas pps
	ON pp.PatientId = pps.PatientId AND ps.ProtocolSchemaId = pps.ProtocolSchemaId
INNER JOIN {1} pi
	ON pps.PatientSchemaId = pi.PatientSchemaId
INNER JOIN ProtocolMgr_ItemTimeline it
	ON pi.ItemTimelineId = it.ItemTimelineId
INNER JOIN ProtocolMgr_Timeline t
	ON it.TimelineId = t.TimelineId
INNER JOIN ProtocolMgr_SchemaItems si
	ON it.SchemaItemId = si.SchemaItemId
INNER JOIN ProtocolMgr_SchemaItemFields sif
	ON si.SchemaItemId = sif.SchemaItemId
WHERE {2}
";

            string offStudyVisitSQL =
@"   
-- special case, restrict off treatment/study visits which aren't dependent
NOT
(
	pi.ScheduledDate IS NOT NULL
    AND
    pi.Status NOT IN ('Performed','Completed')
	AND 
	(
		(
			-- NEW LOGIC: validate off study/off treatment visibility 1=OK, 0=NOT OK
			CASE
				WHEN [OffStudyDate] IS NOT NULL AND t.ItemIntervalType LIKE '%Dependent Off Study%' THEN 1 
				WHEN [OffStudyDate] IS NOT NULL AND pi.ScheduledDate > [OffStudyDate] THEN 0
				WHEN [OffTreatmentDate] IS NOT NULL AND t.ItemIntervalType LIKE '%Dependent Off Treatment%' THEN 1	
				WHEN [OffTreatmentDate] IS NOT NULL AND pi.ScheduledDate > [OffTreatmentDate] THEN 0						
				ELSE 1
			END
		) = 0
		-- OLD LOGIC
		-- if off study, only show dependent off study visits
		--([OffStudyDate] IS NOT NULL AND pi.ScheduledDate > [OffStudyDate] AND t.ItemIntervalType NOT LIKE '%Dependent Off Study%')
 		--OR
		--else if off treatment, only show depdent off treatment
		--([OffTreatmentDate] IS NOT NULL AND pi.ScheduledDate > [OffTreatmentDate] AND t.ItemIntervalType NOT LIKE '%Dependent Off Treatment%')
	)
)
";

            // build restriction list
            List<string> sqlRestrictions = restrictions.ToList();
            // required
            sqlRestrictions.Add("pp.ProtocolId = @ProtocolId");
            // optional patient
            if (patientId.HasValue)
            {
                sqlRestrictions.Add("pp.PatientId = @PatientId");
            }
            // restrict unscheduled items
            if (!includeUnscheduled)
            {
                sqlRestrictions.Add("pi.ScheduledDate IS NOT NULL");
                sqlRestrictions.Add("pi.FirstAnticipatedDate IS NOT NULL");
                sqlRestrictions.Add("pi.LastAnticipatedDate IS NOT NULL");
            }
            // optional visit restrictions
            string patientItemDatasetSQL = "";
            if (!string.IsNullOrEmpty(visitDatasetSQL))
            {
                patientItemDatasetSQL = string.Format("({0})", visitDatasetSQL);
            }
            else
            {
                patientItemDatasetSQL = "ProtocolMgr_PatientItems";
            }
            // optional off study restriction
            if (!includeOffStudyVisits)
            {
                sqlRestrictions.Add(offStudyVisitSQL);
            }
            // build restrictions
            string restrictionsSQL = sqlRestrictions.Count > 0 ? string.Join(" AND ", sqlRestrictions.ToArray()) : "";
            string fullSQL = string.Format(sql, datasetSQL, patientItemDatasetSQL, restrictionsSQL);
            return fullSQL;
        }

        /// <summary>
        /// Returns true if the patient has a Timeline
        /// </summary>
        /// <param name="protocolId"></param>
        /// <param name="patientId"></param>
        /// <param name="timelineId"></param>
        /// <param name="dataset"></param>
        /// <returns></returns>
        public static bool PatientHasTimeline(int protocolId, int patientId, int? timelineId, string dataset)
        {
            List<string> restrictions = new List<string>();
            if (timelineId.HasValue)
                restrictions.Add("t.TimelineId = @TimelineId");
            string sql = GetTimelineSQL(protocolId, patientId, dataset, "", restrictions, true, true);
            SqlCommand cmd = DataAccessHelper.CreateSqlCommand(sql);
            // required params
            DataAccessHelper.AddIntInputParam(cmd, "ProtocolId", protocolId);
            DataAccessHelper.AddIntInputParam(cmd, "PatientId", patientId);
            // optional param
            if (timelineId.HasValue)
                DataAccessHelper.AddIntInputParam(cmd, "TimelineId", timelineId.Value);
            // check first (if any) entry
            bool hasTimeline = false;
            Connectivity.ConsumeRecord(cmd, (r) => { return !(hasTimeline = true); });
            return hasTimeline;
        }

        public static DataTable GetFullPatientTimeline(int protocolId, int patientId, string dataset)
        {
            string sql = @" SELECT DISTINCT DSET.PatientId, ProtocolMgr_PatientSchemas.ProtocolSchemaId, ProtocolMgr_PatientSchemas.StartDate, 
						DSET.PtFirstName, DSET.PtLastName, ProtocolMgr_PatientItems.ScheduledDate, 
						ProtocolMgr_PatientItems.FirstAnticipatedDate, ProtocolMgr_PatientItems.LastAnticipatedDate, ProtocolMgr_PatientItems.Status,
						DATEADD(DAY, FLOOR(DATEDIFF(DAY, ProtocolMgr_PatientItems.FirstAnticipatedDate, ProtocolMgr_PatientItems.LastAnticipatedDate) / 2), ProtocolMgr_PatientItems.FirstAnticipatedDate) as MedAnticipatedDate,
						ProtocolMgr_SchemaItems.ItemDescription, ProtocolMgr_ItemTimeline.TimelineId, Protocols.ProtocolId, 
						ProtocolMgr_Timeline.DisplayUnitName, ProtocolMgr_Timeline.NumberOfUnits, ProtocolMgr_Timeline.BufferUnitName, ProtocolMgr_Timeline.BufferNumberOfUnitsPlus, ProtocolMgr_Timeline.BufferNumberOfUnitsMinus, 
                        ProtocolMgr_PatientItems.PatientItemId 
						
						FROM ProtocolMgr_PatientSchemas
							JOIN ({0}) AS DSET
								ON ProtocolMgr_PatientSchemas.PatientId = DSET.PatientId INNER JOIN
                              -- get computed patientitem with dependent items estimated scheduling
                              ({1}) ProtocolMgr_PatientItems
                              ON ProtocolMgr_PatientSchemas.PatientSchemaId = ProtocolMgr_PatientItems.PatientSchemaId INNER JOIN
                              ProtocolMgr_ItemTimeline ON ProtocolMgr_PatientItems.ItemTimelineId = ProtocolMgr_ItemTimeline.ItemTimelineId INNER JOIN
                              ProtocolMgr_Timeline ON ProtocolMgr_ItemTimeline.TimelineId = ProtocolMgr_Timeline.TimelineId INNER JOIN
                              ProtocolMgr_SchemaItems ON ProtocolMgr_ItemTimeline.SchemaItemId = ProtocolMgr_SchemaItems.SchemaItemId INNER JOIN
                              ProtocolMgr_ProtocolSchemas ON 
                              ProtocolMgr_PatientSchemas.ProtocolSchemaId = ProtocolMgr_ProtocolSchemas.ProtocolSchemaId AND 
                              ProtocolMgr_Timeline.ProtocolSchemaId = ProtocolMgr_ProtocolSchemas.ProtocolSchemaId AND 
                              ProtocolMgr_SchemaItems.ProtocolSchemaId = ProtocolMgr_ProtocolSchemas.ProtocolSchemaId INNER JOIN
                              ProtocolMgr_ProtocolVersions ON 
                              ProtocolMgr_ProtocolSchemas.ProtocolVersionId = ProtocolMgr_ProtocolVersions.ProtocolVersionId INNER JOIN
                              Protocols ON ProtocolMgr_ProtocolVersions.ProtocolId = Protocols.ProtocolId
						WHERE Protocols.ProtocolId = @ProtocolId AND DSET.PatientId = @PatientId {2}
						ORDER BY FirstAnticipatedDate, LastAnticipatedDate";

            string computedPatientItemSQL = GetComputedTimelineSQL(null);
            string timelineSQL = "";

            SqlCommand cmd = DataAccessHelper.CreateSqlCommand(string.Format(sql, dataset, computedPatientItemSQL, timelineSQL));
            DataAccessHelper.AddStringInputParam(cmd, "Dataset", dataset);
            DataAccessHelper.AddIntInputParam(cmd, "ProtocolId", protocolId);
            DataAccessHelper.AddIntInputParam(cmd, "PatientId", patientId);

            DataTable table = new DataTable();
            DataAccessHelper.GetList(cmd, table);
            return table;
        }

        // v6.x
        // new

        /// <summary>
        /// Get the Timeline for all patients on Protocol, restricting to schemas (optional).
        /// </summary>
        /// <param name="protocolId"></param>
        /// <param name="schemaIds"></param>
        /// <param name="datasetSQL"></param>
        /// <param name="visitDatasetSQL"></param>
        /// <param name="includeDeceasedPatients"></param>
        /// <returns></returns>
        public static DataTable GetTimeline(int protocolId, IEnumerable<int> schemaIds, string datasetSQL, string visitDatasetSQL, bool includeDeceasedPatients)
        {
            List<string> restrictions = new List<string>();
            // restrict to non-deceased patients
            if (!includeDeceasedPatients)
            {
                restrictions.Add("patients.PtDeathDate IS NULL");
            }
            // restrict to schemas
            if (schemaIds.Count() > 0)
            {
                string[] ids = schemaIds.Select(sid => sid + "").ToArray();
                restrictions.Add("ps.ProtocolSchemaId IN (" + string.Join(",", ids) + ")");
            }
            string sql = GetTimelineSQL(protocolId, null, datasetSQL, visitDatasetSQL, restrictions, false, false);
            SqlCommand cmd = DataAccessHelper.CreateSqlCommand(sql);
            DataAccessHelper.AddIntInputParam(cmd, "ProtocolId", protocolId);
            return DataAccessHelper.GetRecord(cmd).Tables[0];
        }

        /// <summary>
        /// Gets the patient's timeline, optionally restricted to a specific visit (TimelineId), with restrictions to unscheduled visits, off study visits and dataset visits.
        /// </summary>
        /// <param name="protocolId">The ProtocolId</param>
        /// <param name="patientId">The PatientId</param>
        /// <param name="datasetSQL">The dataset SQL of patients</param>
        /// <param name="visitDatasetSQL">The dataset SQL of patient visits</param>
        /// <param name="timelineId">The optional TimelineId(visit) to restrict view.</param>
        /// <returns></returns>
        public static DataTable GetPatientTimeline(int protocolId, int patientId, string datasetSQL, string visitDatasetSQL, int? timelineId)
        {
            return GetPatientTimeline(protocolId, patientId, datasetSQL, "", timelineId, false, false);
        }

        /// <summary>
        /// Gets the patient's timeline, optionally restricted to a specific visit (TimelineId), without restrictions to unscheduled visits and off study visits.
        /// </summary>
        /// <param name="protocolId">The ProtocolId</param>
        /// <param name="patientId">The PatientId</param>
        /// <param name="datasetSQL">The dataset SQL of patients</param>
        /// <param name="timelineId">The optional TimelineId(visit) to restrict view.</param>
        /// <returns></returns>
        public static DataTable GetPatientFullTimeline(int protocolId, int patientId, string datasetSQL, int? timelineId)
        {
            return GetPatientTimeline(protocolId, patientId, datasetSQL, "", timelineId, true, true);
        }

        private static DataTable GetPatientTimeline(int protocolId, int patientId, string datasetSQL, string visitDatasetSQL, int? timelineId,bool includeUnscheduled, bool includeOffStudyVisits)
        {
            List<string> restrictions = new List<string>();
            if (timelineId.HasValue)
                restrictions.Add("t.TimelineId = @TimelineId");
            string sql = GetTimelineSQL(protocolId, patientId, datasetSQL, visitDatasetSQL, restrictions, includeUnscheduled, includeOffStudyVisits);
            SqlCommand cmd = DataAccessHelper.CreateSqlCommand(sql);
            DataAccessHelper.AddIntInputParam(cmd, "ProtocolId", protocolId);
            DataAccessHelper.AddIntInputParam(cmd, "PatientId", patientId);
            if (timelineId.HasValue)
                DataAccessHelper.AddIntInputParam(cmd, "TimelineId", timelineId.Value);
            return DataAccessHelper.GetRecord(cmd).Tables[0];
        }

        private static void ConsumePatientTimeline(int protocolId, int? patientId, string dataset, string visitDatasetSQL, int? timelineId, Connectivity.RecordConsumerDelegate consumer)
        {
            List<string> restrictions = new List<string>();
            if (timelineId.HasValue)
                restrictions.Add("t.TimelineId = @TimelineId");
            string sql = GetTimelineSQL(protocolId, patientId, dataset, visitDatasetSQL, restrictions, true, false);
            SqlCommand cmd = DataAccessHelper.CreateSqlCommand(sql);
            DataAccessHelper.AddIntInputParam(cmd, "ProtocolId", protocolId);
            if (patientId.HasValue)
                DataAccessHelper.AddIntInputParam(cmd, "PatientId", patientId.Value);
            if (timelineId.HasValue)
                DataAccessHelper.AddIntInputParam(cmd, "TimelineId", timelineId.Value);

            // consume records
            Connectivity.ConsumeRecord(cmd, consumer);
        }

        /// <summary>
        /// Gets the timeline record associated with the patient item
        /// </summary>
        /// <param name="patientItemId"></param>
        /// <returns></returns>
        public static int? GetPatientTimelineId(int patientItemId)
        {
            string sql =
@"
SELECT TOP 1 c.TimelineId
FROM ProtocolMgr_PatientItems a
INNER JOIN ProtocolMgr_ItemTimeline b
	ON a.ItemTimelineId = b.ItemTimelineId
INNER JOIN ProtocolMgr_Timeline c
	ON b.TimelineId = c.TimelineId
 WHERE
	a.PatientItemId = @PatientItemId
";
            SqlCommand cmd = DataAccessHelper.CreateSqlCommand(sql);
            DataAccessHelper.AddIntInputParam(cmd, "PatientItemId", patientItemId);
            DataTable table = DataAccessHelper.GetRecord(cmd).Tables[0];

            if (table.Rows.Count > 0)
                return (int)table.Rows[0]["TimelineId"];
            else
                return null;
        }

        /// <summary>
        /// Gets the SchemaItem related to the Patient Item
        /// </summary>
        /// <param name="patientItemId"></param>
        /// <returns></returns>
        public static DataTable GetSchemaItemByPatientItemId(int patientItemId)
        {
            string sql =
@"
SELECT TOP 1 c.SchemaItemId, c.ProtocolSchemaId, c.ItemDescription, c.ItemOrder
FROM ProtocolMgr_PatientItems a
INNER JOIN ProtocolMgr_ItemTimeline b
	ON a.ItemTimelineId = b.ItemTimelineId
INNER JOIN ProtocolMgr_SchemaItems c
	ON b.SchemaItemId = c.SchemaItemId
 WHERE
	a.PatientItemId = @PatientItemId
";
            SqlCommand cmd = DataAccessHelper.CreateSqlCommand(sql);
            DataAccessHelper.AddIntInputParam(cmd, "PatientItemId", patientItemId);
            DataTable table = DataAccessHelper.GetRecord(cmd).Tables[0];
            return table;
        }

        public static DataTable GetPatientsByProtocol(string protocolid, IEnumerable<int> schemaIds, bool bShowPatientIdentifiers, string dataset, bool bIncludeFail)
        {
            string sql = @"SELECT a.PatientId, c.ProtocolId, ";
            if (bShowPatientIdentifiers)
                sql += " b.PtMRN, b.PtLastName + ', ' + b.PtFirstName AS Name, ";
            else
                sql += " '--------' AS PtMRN, '----- -----' AS Name, ";

            sql += @" f.NextVisit, f.DisplayUnitName, f.NumberOfUnits, a.PatientProtocolId, a.PtProtocolStudyId,a.PtProtocolScreeningId, MAX(f.ProtocolSchemaId) AS ProtocolSchemaId 
                        FROM PatientProtocols a INNER JOIN ({0}) b ON a.PatientId = b.PatientId
                                                INNER JOIN Protocols c ON a.ProtocolId = c.ProtocolId
                                                INNER JOIN ProtocolMgr_ProtocolVersions d ON c.ProtocolId = d.ProtocolId
                                                LEFT OUTER JOIN (SELECT a.PatientId, a.PtMRN, d.ProtocolId, ProtocolMgr_ProtocolSchemas.ProtocolSchemaId, ProtocolMgr_ProtocolSchemas.ProtocolVersionId, MIN(pt_items.ScheduledDate) AS NextVisit,
                                                                                    CASE WHEN MIN(pt_items.ScheduledDate) IS NULL THEN NULL ELSE MIN(timeline.DisplayUnitName) END AS DisplayUnitName, 
                                                                                    CASE WHEN MIN(pt_items.ScheduledDate) IS NULL THEN NULL ELSE MIN(timeline.NumberOfUnits) END AS NumberOfUnits
                                                                        FROM ({0}) a INNER JOIN ProtocolMgr_PatientSchemas b ON a.PatientId = b.PatientId
                                                                                                INNER JOIN ProtocolMgr_ProtocolSchemas ON b.ProtocolSchemaId = ProtocolMgr_ProtocolSchemas.ProtocolSchemaId
                                                                                                INNER JOIN PatientProtocols d ON a.PatientId = d.PatientId
                                                                                                LEFT OUTER JOIN ProtocolMgr_PatientSchemas AS pt_schemas ON a.PatientId = pt_schemas.PatientId AND 
                                                                                                    ProtocolMgr_ProtocolSchemas.ProtocolSchemaId = pt_schemas.ProtocolSchemaId 
                                                                                                LEFT OUTER JOIN ProtocolMgr_PatientItems AS pt_items ON pt_schemas.PatientSchemaId = pt_items.PatientSchemaId AND 
                                                                                                    pt_items.Status NOT IN ('Performed','Completed') 
                                                                                                LEFT OUTER JOIN ProtocolMgr_ItemTimeline AS it_timeline ON it_timeline.ItemTimelineId = pt_items.ItemTimelineId 
                                                                                                LEFT OUTER JOIN ProtocolMgr_Timeline AS timeline ON it_timeline.TimelineId = timeline.TimelineId
                                                                        WHERE d.ProtocolId = ";
            sql += protocolid;
            if (schemaIds.Count() > 0)
                sql += " AND (" + GetSchemaString(schemaIds) + " ) ";
            sql += @" GROUP BY a.PatientId, a.PtMRN, d.ProtocolId, ProtocolMgr_ProtocolSchemas.ProtocolSchemaId, ProtocolMgr_ProtocolSchemas.ProtocolVersionId
                                                                         ) as f ON a.PatientId = f.PatientId AND
                                                                                c.ProtocolId = f.ProtocolId AND
                                                                                d.ProtocolVersionId = f.ProtocolVersionId
            WHERE c.ProtocolId = ";

            sql += protocolid;

            sql += @" GROUP BY a.PatientId, b.PtMRN, b.PtLastName, b.PtFirstName, c.ProtocolId,  
                         f.NextVisit, f.DisplayUnitName, f.NumberOfUnits, a.PatientProtocolId, a.PtProtocolStudyId,a.PtProtocolScreeningId ";

            if (!bIncludeFail)
                sql += "HAVING (a.PtProtocolStudyId IS NOT NULL)";

            SqlCommand com = DataAccessHelper.CreateSqlCommand(String.Format(sql, dataset));
            DataTable dt = DataAccessHelper.GetRecord(com).Tables[0];
            return dt;
        }

        /// <summary>
        /// Returns a list of Patient's in the specified schema.
        /// </summary>
        /// <param name="protocolSchemaId"></param>
        /// <param name="dataset"></param>
        /// <returns></returns>
        public static DataTable GetPatientsByProtocolSchema(int protocolSchemaId, string dataset)
        {
            string sql =
                string.Format(@"
                SELECT DISTINCT
                    p.PatientId,
	                p.PtMrn,
	                p.PtLastName,
	                p.PtFirstName,
	                pps.PatientSchemaId,
                    pps.ProtocolSchemaId,
                    a.PtProtocolStudyId,
	                b.Identifier AS ParticipantID
                FROM ProtocolMgr_PatientSchemas pps
                INNER JOIN ({0}) p
                ON p.PatientId = pps.PatientId
                LEFT OUTER JOIN
                (
                    SELECT pp.PatientId,pp.PtProtocolStudyId
                    FROM PatientProtocols pp
                    INNER JOIN ProtocolMgr_ProtocolVersions pv
                    ON pv.ProtocolId = pp.ProtocolId  
                    INNER JOIN ProtocolMgr_ProtocolSchemas ps
                    ON ps.ProtocolVersionId = pv.ProtocolVersionId
                    WHERE ps.ProtocolSchemaId = @ProtocolSchemaId
                ) a
                ON a.PatientId = pps.PatientId
                LEFT OUTER JOIN Identifiers b
	                ON p.PatientId = b.PatientId AND b.IdType = 'Participant ID'
                WHERE pps.ProtocolSchemaId = @ProtocolSchemaId
                ", dataset);
            SqlCommand com = DataAccessHelper.CreateSqlCommand(sql);
            DataAccessHelper.AddIntInputParam(com, "ProtocolSchemaId", protocolSchemaId);
            DataTable dt = DataAccessHelper.GetRecord(com).Tables[0];
            return dt;
        }

        /// <summary>
        /// Returns a list of all patients on the protocols (PatientProtocol with optional PatientSchema)
        /// </summary>
        /// <param name="protocolId"></param>
        /// <returns></returns>
        public static DataTable GetPatientProtocolsAndSchemas(int protocolId)
        {
            string sql =
            @"
            SELECT DISTINCT
	            patient.PtMRN,
	            patient.PtFirstName,
	            patient.PtLastName,
	            pp.PatientId,
	            pp.ProtocolId,
	            pp.PatientProtocolId,
	            pp.PtProtocolScreeningId,
	            pp.PtProtocolStudyId,
	            pps.ProtocolSchemaId,
	            pps.PatientSchemaId,
                ps.ProtocolArmDescription
            FROM PatientProtocols pp
            INNER JOIN Patients patient
	            ON pp.PatientId = patient.PatientId
            INNER JOIN Protocols p
	            ON pp.ProtocolId = p.ProtocolId
            LEFT OUTER JOIN ProtocolMgr_ProtocolVersions pv
	            ON p.ProtocolId = pv.ProtocolId
            LEFT OUTER JOIN ProtocolMgr_ProtocolSchemas ps
	            ON pv.ProtocolVersionId = ps.ProtocolVersionId
            LEFT OUTER JOIN ProtocolMgr_PatientSchemas pps
	            ON pp.PatientId = pps.PatientId AND ps.ProtocolSchemaId = pps.ProtocolSchemaId
            WHERE
	            pp.ProtocolId = @ProtocolId
            ORDER BY
	            pp.ProtocolId,
	            pp.PatientId,
	            pps.PatientSchemaId
            ";

            SqlCommand com = DataAccessHelper.CreateSqlCommand(sql);
            DataAccessHelper.AddIntInputParam(com, "ProtocolId", protocolId);
            DataTable dt = DataAccessHelper.GetRecord(com).Tables[0];
            return dt;
        }

        /// <summary>
        /// Gets a list of patients across all tratment arms
        /// </summary>
        /// <param name="protocolId"></param>
        /// <param name="dataset"></param>
        /// <param name="bShowPatientIdentifiers"></param>
        /// <param name="includeDeceasedPatients">true or false if to include deceased patients in the list</param>
        /// <returns></returns>
        public static DataTable GetPatientsByProtocol(int protocolId, string dataset, bool bShowPatientIdentifiers, bool includeDeceasedPatients)
        {
            return GetPatientsByProtocol(protocolId, dataset, null, null, bShowPatientIdentifiers, includeDeceasedPatients);
        }

        /// <summary>
        ///  Gets a list of patients across specified list of tratment arms
        /// </summary>
        /// <param name="protocolId">The protocol id of the Protocol</param>
        /// <param name="dataset">Dataset SQL for patients withing dataset.</param>
        /// <param name="schemaIds">Restrict to Patients by list of Treatment Arms. NULL for all arms.</param>
        /// <param name="includeStatuses">Restrict to Patients by list of Statuses. NULL for all statuses.</param>
        /// <param name="bShowPatientIdentifiers">true or false if including Patient Identifiers.</param>
        /// <param name="includeDeceasedPatients">true or false if to include deceased patients in the list</param>
        /// <returns></returns>
        public static DataTable GetPatientsByProtocol(int protocolId, string dataset, IEnumerable<int> schemaIds, IEnumerable<string> includeStatuses, bool bShowPatientIdentifiers, bool includeDeceasedPatients)
        {
            string fullSQL = GetPatientsByProtocolSQL(protocolId, dataset, schemaIds, includeStatuses, bShowPatientIdentifiers, includeDeceasedPatients);
            SqlCommand com = DataAccessHelper.CreateSqlCommand(fullSQL);
            // add parameters
            DataAccessHelper.AddIntInputParam(com, "ProtocolId", protocolId);
            DataTable dt = DataAccessHelper.GetRecord(com).Tables[0];
            return dt;
        }

        /// <summary>
        /// Returns the SQL used for capturning all Patients on a Protocols
        /// </summary>
        /// <param name="protocolId">The protocol id of the Protocol</param>
        /// <param name="dataset">Dataset SQL for patients withing dataset.</param>
        /// <param name="schemaIds">Restrict to Patients by list of Treatment Arms. NULL for all arms.</param>
        /// <param name="includeStatuses">Restrict to Patients by list of Statuses. NULL for all statuses.</param>
        /// <param name="bShowPatientIdentifiers">true or false if including Patient Identifiers.</param>
        /// <param name="includeDeceasedPatients">true or false if to include deceased patients in the list</param>
        /// <returns></returns>
        private static string GetPatientsByProtocolSQL(int protocolId, string dataset, IEnumerable<int> schemaIds, IEnumerable<string> includeStatuses, bool bShowPatientIdentifiers, bool includeDeceasedPatients)
        {
            // v1
            //            string sql = @"
            //	
            //SELECT DISTINCT a.PatientId, a.Name, a.PtMRN, a.PtDeathDate, a.PtDeathDateText, a.ProtocolId, b.ProtocolSchemaId, a.PatientProtocolId, a.PtProtocolScreeningId, a.PtProtocolStudyId ,b.VisitLabel, b.ScheduledDate NextVisit, pps.PtProtocolStatus
            //
            //FROM
            //
            //(
            //";

            //            if (bShowPatientIdentifiers)
            //            {
            //                sql += "SELECT b.PtMRN, b.PtLastName + ', ' + b.PtFirstName AS Name, c.PtDeathDate, c.PtDeathDateText, a.* ";
            //            }
            //            else
            //            {
            //                sql += "SELECT '--------' AS PtMRN, '----- -----' AS Name, c.PtDeathDate, c.PtDeathDateText, a.* ";
            //            }

            //            sql += @"FROM PatientProtocols a INNER JOIN ({0}) b ON a.PatientId = b.PatientId INNER JOIN Patients c ON b.PatientId = c.PatientId
            //
            //WHERE ProtocolId = @ProtocolId
            //
            //) a LEFT OUTER JOIN
            //
            // 
            //(
            //
            //SELECT a.ProtocolSchemaId, a.PatientId, c.ProtocolId, d.VisitLabel, d.ScheduledDate
            //
            //FROM ProtocolMgr_PatientSchemas a INNER JOIN ProtocolMgr_ProtocolSchemas b ON a.ProtocolSchemaId = b.ProtocolSchemaId
            //
            //                                  INNER JOIN ProtocolMgr_ProtocolVersions c ON b.ProtocolVersionId = c.ProtocolVersionId
            //
            //                                  LEFT OUTER JOIN 
            //
            //                                    (
            //
            //                                    SELECT * FROM
            //
            //                                     (
            //
            //                                         SELECT ROW_NUMBER() OVER (PARTITION BY ProtocolMgr_PatientItems.PatientSchemaId ORDER BY ProtocolMgr_PatientItems.ScheduledDate ASC) AS RowNumber,
            //
            //                                         ProtocolMgr_Timeline.VisitLabel, ProtocolMgr_PatientItems.PatientSchemaId,
            //
            //                                         ProtocolMgr_PatientItems.ScheduledDate
            //
            //                                         FROM ProtocolMgr_PatientItems INNER JOIN ProtocolMgr_ItemTimeline
            //
            //                                                                       ON ProtocolMgr_ItemTimeline.ItemTimelineId = ProtocolMgr_PatientItems.ItemTimelineId
            //
            //                                                                       INNER JOIN ProtocolMgr_Timeline 
            //
            //                                                                       ON ProtocolMgr_Timeline.TimelineId = ProtocolMgr_ItemTimeline.TimelineId
            //
            //                                                                       INNER JOIN ProtocolMgr_ProtocolSchemas
            //
            //                                                                       ON ProtocolMgr_ProtocolSchemas.ProtocolSchemaId = ProtocolMgr_Timeline.ProtocolSchemaId
            //
            //                                                                       INNER JOIN ProtocolMgr_ProtocolVersions
            //
            //                                                                       ON ProtocolMgr_ProtocolVersions.ProtocolVersionId = ProtocolMgr_ProtocolSchemas.ProtocolVersionId AND
            //
            //                                                                                                                           ProtocolMgr_ProtocolVersions.ProtocolId = @ProtocolId
            //
            //                                                                       INNER JOIN ProtocolMgr_PatientSchemas
            //
            //                                                                       ON ProtocolMgr_PatientSchemas.PatientSchemaId = ProtocolMgr_PatientItems.PatientSchemaId
            //
            //                                         WHERE ProtocolMgr_PatientItems.ScheduledDate > (GETDATE() - 1)
            //
            //                                     ) a
            //
            //                                        WHERE a.RowNumber <= 1
            //
            //                                    ) d ON a.PatientSchemaId = d.PatientSchemaId        
            //
            //WHERE c.ProtocolId = @ProtocolId
            //
            //) b ON a.PatientId = b.PatientId AND a.ProtocolId = b.ProtocolId
            //
            //-- Include Latest Patient Status
            //LEFT OUTER JOIN
            //(
            //	SELECT pps.PatientProtocolId, pps.PtProtocolStatus FROM
            //	(
            //        SELECT
            //	        PatientProtocolId,
            //	        PtProtocolStatusDate,
            //	        PtProtocolStatus,
            //	        ROW_NUMBER() OVER (PARTITION BY PatientProtocolId ORDER BY [Year] DESC, [Month] DESC, [Day] DESC, [StatusRank] DESC) AS RowNumber
            //        FROM
            //        (	
            //	        SELECT
            //		        PatientProtocolId,
            //		        PtProtocolStatus,
            //		        PtProtocolStatusDate,
            //		        YEAR(PtProtocolStatusDate) AS [Year],
            //		        MONTH(PtProtocolStatusDate) AS [Month],
            //		        DAY(PtProtocolStatusDate) AS [Day],
            //                -- explicit status ranking
            //		        CASE PtProtocolStatus
            //			        WHEN 'Failed Screening' THEN 1
            //			        WHEN 'Passed Screening' THEN 2
            //			        WHEN 'Consented' THEN 3
            //			        WHEN 'Ineligible' THEN 4
            //			        WHEN 'Eligible' THEN 5
            //			        WHEN 'Registration Pending' THEN 6
            //			        WHEN 'Registered' THEN 7
            //			        WHEN 'On Study' THEN 8
            //			        WHEN 'Off Treatment' THEN 9
            //			        WHEN 'Off Study' THEN 10
            //			        ELSE 0
            //		        END
            //		        AS [StatusRank]
            //	        FROM PatientProtocolStatus
            //	        WHERE PtProtocolStatus IS NOT NULL AND PtProtocolStatus <> 'Start Date Entered'
            //        ) a	
            //	) pps
            //    INNER JOIN PatientProtocols pp
            //        ON pp.PatientProtocolId = pps.PatientProtocolId
            //    INNER JOIN 
            //    (
            //        SELECT
            //            pds.*,
            //            p.PtDeathDateText,
            //            p.PtDeathDate
            //        FROM ({0}) pds
            //        INNER JOIN Patients p
            //            ON p.PatientId = pds.PatientId
            //    ) pds
            //        ON pds.PatientId = pp.PatientId
            //    INNER JOIN Protocols p
            //        ON p.ProtocolId = pp.ProtocolId
            //    WHERE pps.RowNumber = 1 AND p.ProtocolId = @ProtocolId
            //) pps ON a.PatientProtocolId = pps.PatientProtocolId
            //
            //-- main WHERE clause
            //{1}";

            //            List<string> whereRestrictions = new List<string>();
            //            // always include patients without sceening and study ids
            //            string protocolFeedPatients = " (a.PtProtocolScreeningId IS NULL AND a.PtProtocolStudyId IS NULL) ";
            //            // string notOnStudy = "( a.PtProtocolStudyId IS NOT NULL OR " + protocolFeedPatients + " )";
            //            //whereRestrictions.Add(protocolFeedPatients);
            //            if (schemaIds != null)
            //            {
            //                string[] schemaParams = schemaIds.Select<int, string>(s => s.ToString()).ToArray();
            //                string restrictBySchema = "( b.ProtocolSchemaId IN (" + string.Join(",", schemaParams) + ") )";
            //                whereRestrictions.Add(restrictBySchema);
            //            }
            //            // restring by status
            //            if (includeStatuses != null)
            //            {
            //                // escape single quotes in statuses
            //                var sqlEscapedStatuses = from status in includeStatuses
            //                                         select "'" + status.Replace("'", "''") + "'";
            //                string statusIn = string.Join(",", sqlEscapedStatuses.ToArray());
            //                string includeStatusesSQL = " (pps.PtProtocolStatus IN (" + statusIn + ") ) ";
            //                whereRestrictions.Add(includeStatusesSQL);
            //            }
            //            // restrict deceased patients
            //            if (!includeDeceasedPatients)
            //            {
            //                // 05/15/2013, optionally filter deceased patints
            //                string excludeDeceased = "(a.PtDeathDateText IS NULL AND a.PtDeathDate IS NULL)";
            //                whereRestrictions.Add(excludeDeceased);
            //            }
            //            string optRestrictions = string.Empty;
            //            if (whereRestrictions.Count() > 0)
            //            {
            //                // build where clause with each restriction added as AND statement
            //                optRestrictions = " WHERE " + string.Join(" AND ", whereRestrictions.ToArray());
            //            }
            //            string fullSQL = string.Format(sql, dataset, optRestrictions);
            //            return fullSQL;
            string TEMPLATE_SQL =
@"
SELECT DISTINCT
	patient_dataset.PatientId,
    {2},
	--patient_dataset.PtLastName + ', ' + patient_dataset.PtFirstName AS [Name],
	--patient_dataset.PtMRN,
	patient_dataset.PtDeathDate,
	patient_dataset.PtDeathDateText,
	patient_info.ProtocolId,
	patient_info.ProtocolSchemaId,
	patient_info.PatientProtocolId,
	patient_info.PtProtocolScreeningId,
	patient_info.PtProtocolStudyId,
	patient_schedule.ScheduledDate AS [NextVisit],
	patient_schedule.VisitLabel,
	patient_status.PtProtocolStatus
FROM
(
	SELECT
		a.PatientProtocolId,
		a.PatientId,
		a.ProtocolId,
		a.PtProtocolScreeningId,
		a.PtProtocolStudyId,
		c.ProtocolSchemaId,
		c.PatientSchemaId
	FROM PatientProtocols a
	INNER JOIN Protocols b
		ON a.ProtocolId = b.ProtocolId
	LEFT OUTER JOIN
	(
		SELECT
			a.PatientSchemaId,
			a.PatientId,
			a.ProtocolSchemaId,
			c.ProtocolId
		FROM ProtocolMgr_PatientSchemas a
		INNER JOIN ProtocolMgr_ProtocolSchemas b
			ON a.ProtocolSchemaId = b.ProtocolSchemaId
		INNER JOIN ProtocolMgr_ProtocolVersions c
			ON b.ProtocolVersionId = c.ProtocolVersionId
	) c
		ON a.PatientId = c.PatientId AND a.ProtocolId = c.ProtocolId
) patient_info
-- get latest status
LEFT OUTER JOIN
(
    SELECT
		PatientProtocolId,
		PtProtocolStatusDate,
		PtProtocolStatus,
		ROW_NUMBER() OVER (PARTITION BY PatientProtocolId ORDER BY [StatusRank] DESC) AS StatusOrder
	FROM
	(	
		SELECT
			a.PatientProtocolId,
			a.PtProtocolStatus,
			PtProtocolStatusDate,
			YEAR(PtProtocolStatusDate) AS [Year],
			MONTH(PtProtocolStatusDate) AS [Month],
			DAY(PtProtocolStatusDate) AS [Day],
			-- explicit status ranking
			CASE a.PtProtocolStatus
				WHEN 'Failed Screening' THEN 1
				WHEN 'Passed Screening' THEN 2
				WHEN 'Consented' THEN 3
				WHEN 'Ineligible' THEN 4
				WHEN 'Eligible' THEN 5
				WHEN 'Registration Pending' THEN 6
				WHEN 'Registered' THEN 7
				WHEN 'On Study' THEN 8
				WHEN 'Off Treatment' THEN 9
				WHEN 'Off Study' THEN 10
				ELSE 0
			END
			AS [StatusRank]
		FROM PatientProtocolStatus a
		INNER JOIN PatientProtocols b
			ON a.PatientProtocolId = b.PatientProtocolId
		WHERE
			a.PtProtocolStatus IS NOT NULL AND a.PtProtocolStatus <> 'Start Date Entered'
			AND
			b.ProtocolId = @ProtocolId
	) a	
) patient_status
	ON patient_info.PatientProtocolId = patient_status.PatientProtocolId
-- get latest visit
LEFT OUTER JOIN
(
	SELECT
		a.PatientItemId,
		a.PatientSchemaId,
		a.ScheduledDate,
		c.VisitLabel,
		ROW_NUMBER() OVER (PARTITION BY a.PatientSchemaId ORDER BY a.ScheduledDate ASC) AS VisitSort
	FROM ProtocolMgr_PatientItems a
	INNER JOIN ProtocolMgr_ItemTimeline b
		ON a.ItemTimelineId = b.ItemTimelineId
	INNER JOIN ProtocolMgr_Timeline c
		ON b.TimelineId = c.TimelineId
	INNER JOIN ProtocolMgr_PatientSchemas d
		ON a.PatientSchemaId = d.PatientSchemaId
	INNER JOIN ProtocolMgr_ProtocolSchemas e
		ON d.ProtocolSchemaId = e.ProtocolSchemaId
	INNER JOIN ProtocolMgr_ProtocolVersions f
		ON e.ProtocolVersionId = f.ProtocolVersionId
	WHERE
		-- restrict to protocol
		f.ProtocolId = @ProtocolId
		-- restrict to next visit 
		AND a.ScheduledDate > DATEADD(dd, DATEDIFF(dd, 0, GETDATE()),0)
) patient_schedule
	ON patient_info.PatientSchemaId = patient_schedule.PatientSchemaId
-- get patient info
INNER JOIN ({0}) dataset
	ON patient_info.PatientId = dataset.PatientId
INNER JOIN Patients patient_dataset
    ON dataset.PatientId = patient_dataset.PatientId
WHERE
	-- restrict to protocol
	patient_info.ProtocolId = @ProtocolId
	AND
	-- restrict to last status
	ISNULL(patient_status.StatusOrder, 1) = 1
	-- restrict to next visit
	AND
	ISNULL(patient_schedule.VisitSort, 1) = 1
    {1}
";

            // build where restrictions
            List<string> sqlRestrictions = new List<string>();
            // restrict schemas
            if (schemaIds != null && schemaIds.Count() > 0)
            {
                string[] schemaIdList = schemaIds.Select(s => s.ToString()).ToArray();
                string schemaRestrictionSQL = "patient_info.ProtocolSchemaId IN(" + string.Join("", schemaIdList) + ")";
                sqlRestrictions.Add(schemaRestrictionSQL);
            }
            // restrict statuses
            if (includeStatuses != null && includeStatuses.Count() > 0)
            {
                string[] statusCSV = includeStatuses.Select(s => "'" + s.Replace("'", "''") + "'").ToArray();
                string statusSQL = "patient_status.PtProtocolStatus IN (" + string.Join(",", statusCSV) + ")";
                sqlRestrictions.Add(statusSQL);
            }
            // restirct to non-deceased patient
            if (!includeDeceasedPatients)
            {
                string restrictDeceasedSQL = "patient_dataset.PtDeathDate IS NULL";
                sqlRestrictions.Add(restrictDeceasedSQL);
            }

            // format where
            string whereSQL = "";
            if (sqlRestrictions.Count() > 0)
                whereSQL = " AND " + string.Join(" AND ", sqlRestrictions.ToArray());

            // format name
            string patientNameSQL = "";
            if (bShowPatientIdentifiers)
                patientNameSQL = "patient_dataset.PtMRN, patient_dataset.PtLastName + ', ' + patient_dataset.PtFirstName AS [Name]";
            else
                patientNameSQL = "'--------' AS [PtMRN], '----- -----' AS [Name]";

            // final format
            string sql = string.Format(TEMPLATE_SQL, dataset, whereSQL, patientNameSQL);
            return sql;
        }

        private static String GetMatchExpr(string colVal, string[] searchColumns)
        {
            if (searchColumns == null)
                return String.Empty;
            string sql = " ( ";
            string matchExpr = "LIKE '%" + colVal.Replace("'", "''") + "%'";
            for (int i = 0; i < searchColumns.Length; i++)
            {
                string col = searchColumns[i];
                // Append like expression + OR clause, except for last searchCol
                sql += col + " " + matchExpr + (i != searchColumns.Length - 1 ? " OR " : ")");
            }

            return sql;
        }

        /// <summary>
        /// Returns if any partients are scheduled on a Schema
        /// </summary>
        /// <param name="protocolSchemaId"></param>
        /// <returns></returns>
        public static bool ArePatientsScheduledOnSchema(int protocolSchemaId)
        {
            //SqlCommand cmd = DataAccessHelper.CreateCommand("spGetProtocolMgrCountScheduledPatientsOnSchema");
            //DataAccessHelper.AddIntInputParam(cmd, "ProtocolSchemaId", schemaId);

            //DataTable table = new DataTable();
            //DataAccessHelper.GetList(cmd, table);

            //return ((int)table.Rows[0]["PatientCount"]) > 0;
            string sql =
            @"
SELECT
	COUNT(DISTINCT pps.PatientSchemaId) AS PatientCount
FROM ProtocolMgr_PatientSchemas pps
INNER JOIN ProtocolMgr_PatientItems ppi
	ON ppi.PatientSchemaId = pps.PatientSchemaId
WHERE pps.ProtocolSchemaId = @ProtocolSchemaId AND ppi.ScheduledDate IS NOT NULL
             ";
            SqlCommand cmd = DataAccessHelper.CreateSqlCommand(sql);
            DataAccessHelper.AddIntInputParam(cmd, "ProtocolSchemaId", protocolSchemaId);
            DataTable dt = DataAccessHelper.GetRecord(cmd).Tables[0];
            return (int)dt.Rows[0][0] > 0;
        }

        /// <summary>
        /// Assigns patient to schema and create timeline
        /// </summary>
        /// <param name="ProtocolSchemaId"></param>
        /// <param name="PatientId"></param>
        /// <param name="username"></param>
        /// <param name="startDate"></param>
        /// <param name="today"></param>
        public static void AssignPatients(int ProtocolSchemaId, int PatientId, String username, DateTime startDate, DateTime today)
        {
            SqlCommand cmd = DataAccessHelper.CreateCommand("spInsertProtocolMgrAssignPatient");

            DataAccessHelper.AddDateTimeInputParam(cmd, "StartDate", startDate);
            //DataAccessHelper.AddStringInputParam(cmd, "StartDateText", startDate.ToShortDateString());
            DataAccessHelper.AddIntInputParam(cmd, "PatientId", PatientId);
            DataAccessHelper.AddIntInputParam(cmd, "ProtocolSchemaId", ProtocolSchemaId);
            DataAccessHelper.AddStringInputParam(cmd, "EnteredBy", username);
            DataAccessHelper.AddDateTimeInputParam(cmd, "EnteredTime", today);
            DataAccessHelper.AddStringInputParam(cmd, "UpdatedBy", username);
            DataAccessHelper.AddDateTimeInputParam(cmd, "UpdatedTime", today);

            DataAccessHelper.ExecuteScalar(cmd);
        }


        public static DataTable ProtocolPatientSearch(CallBackVars callbackVars, string[] searchColumnsPatient, string protocolId, bool bShowPatientIdentifiers, string dataset, bool bIncludeFail)
        {
            string sql = @"SELECT list.PtMRN, list.Name, list.PtProtocolNotes, list.ProtocolSchemaId, list.PatientId, list.ProtocolId, list.PtProtocolStudyId, list.PtProtocolScreeningId,
                                list.PatientProtocolId, list.NextVisit, CASE WHEN list.NextVisit IS NULL THEN NULL ELSE MIN(timeline.DisplayUnitName) END AS DisplayUnitName, 
                                CASE WHEN list.NextVisit IS NULL THEN NULL ELSE MIN(timeline.NumberOfUnits) END AS NumberOfUnits
                           FROM ProtocolMgr_ItemTimeline AS it_timeline INNER JOIN
                                ProtocolMgr_PatientItems AS pt_items ON it_timeline.ItemTimelineId = pt_items.ItemTimelineId INNER JOIN
                                ProtocolMgr_Timeline AS timeline ON it_timeline.TimelineId = timeline.TimelineId RIGHT OUTER JOIN
                          (SELECT     pt_schemas.PatientSchemaId, ";

            if (bShowPatientIdentifiers)
                sql += "DSET.PtMRN, DSET.PtLastName + ',' + DSET.PtFirstName AS Name, ";
            else
            {
                searchColumnsPatient = null;
                sql += "'' AS PtMRN, '' AS Name, ";
            }
            sql += @"pt_protocols.PtProtocolNotes, 
                        pt_schemas.ProtocolSchemaId, pt_protocols.PatientId, versions.ProtocolId, pt_protocols.PtProtocolStudyId, 
                        pt_protocols.PatientProtocolId, MIN(pt_items.ScheduledDate) AS NextVisit
                    FROM ProtocolMgr_ProtocolVersions AS versions INNER JOIN
                         ProtocolMgr_ProtocolSchemas ON versions.ProtocolVersionId = ProtocolMgr_ProtocolSchemas.ProtocolVersionId INNER JOIN
                         PatientProtocols AS pt_protocols ON versions.ProtocolId = pt_protocols.ProtocolId INNER JOIN
                         ({0}) AS DSET ON pt_protocols.PatientId = DSET.PatientId LEFT OUTER JOIN
                         ProtocolMgr_PatientSchemas AS pt_schemas ON DSET.PatientId = pt_schemas.PatientId AND 
                         ProtocolMgr_ProtocolSchemas.ProtocolSchemaId = pt_schemas.ProtocolSchemaId LEFT OUTER JOIN
                         ProtocolMgr_PatientItems AS pt_items ON pt_schemas.PatientSchemaId = pt_items.PatientSchemaId AND 
                         pt_items.Status NOT IN('Performed','Completed')  ";

            sql += @" GROUP BY pt_schemas.PatientSchemaId, DSET.PtMRN, DSET.PtLastName + ',' + DSET.PtFirstName, pt_protocols.PtProtocolNotes, 
                            pt_schemas.ProtocolSchemaId, pt_protocols.PatientId, versions.ProtocolId, pt_protocols.PtProtocolStudyId, 
                            pt_protocols.PatientProtocolId
                       HAVING (versions.ProtocolId = ";
            sql += protocolId;

            if (searchColumnsPatient != null
                && searchColumnsPatient.Length > 0
                && !String.IsNullOrEmpty(callbackVars.Value))
            {
                sql += " AND ";

                sql += GetMatchExpr(callbackVars.Value, searchColumnsPatient);
            }


            sql += @")) AS list ON ISNULL(pt_items.ScheduledDate, '') = ISNULL(list.NextVisit, '') AND 
                      pt_items.PatientSchemaId = list.PatientSchemaId
                GROUP BY  list.PtMRN, list.Name, list.PtProtocolNotes, list.ProtocolSchemaId, list.PatientId, list.ProtocolId, list.PtProtocolStudyId, 
                      list.PatientProtocolId, list.NextVisit ";

            if (!bIncludeFail)
                sql += "HAVING (list.PtProtocolStudyId IS NOT NULL)";

            if (callbackVars.Type == "Sort")
            {
                sql += "ORDER BY " + callbackVars.SortString;
            }

            SqlCommand com = DataAccessHelper.CreateSqlCommand(String.Format(sql, dataset));
            DataTable dt = DataAccessHelper.GetRecord(com).Tables[0];
            return dt;
        }
        /// <summary>
        /// 
        /// </summary>
        /// <returns></returns>
        public static int GetNextScreeningId()
        {
            string sql = "SELECT ISNULL(MAX(PtProtocolScreeningId),0) + 1 ";
            sql += "FROM PatientProtocols WHERE PtProtocolScreeningId ";
            sql += "IS NOT NULL";
            SqlCommand com = DataAccessHelper.CreateSqlCommand(sql);
            DataTable dt = DataAccessHelper.GetRecord(com).Tables[0];
            int nextScreeingId = 1;
            int.TryParse(dt.Rows[0][0].ToString(), out nextScreeingId);
            return nextScreeingId;
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="protocolId"></param>
        /// <returns></returns>
        public static int GetNextStudyId(int protocolId)
        {
            string sql = "SELECT ISNULL(MAX(PtProtocolStudyId),0) + 1 ";
            sql += "FROM PatientProtocols WHERE ProtocolId = @ProtocolId ";
            sql += "AND PtProtocolScreeningId IS NOT NULL";
            SqlCommand com = DataAccessHelper.CreateSqlCommand(sql);
            DataAccessHelper.AddIntInputParam(com, "ProtocolId", protocolId);
            DataTable dt = DataAccessHelper.GetRecord(com).Tables[0];
            int nextStudyId = 1;
            if (int.TryParse(dt.Rows[0][0].ToString(), out nextStudyId))
            {
                return nextStudyId;
            }
            else
            {
                return 1;
            }
        }

        /// <summary>
        /// For the given Protocol and Orgnaization, get the next study id.
        /// </summary>
        /// <param name="protocolId"></param>
        /// <param name="organizationId"></param>
        /// <returns></returns>
        public static int? GetNextStudyId(int protocolId, int organizationId)
        {
            string sql =
@"
/*
StudyId: ProtocolNum + Organization Code + Auto #
	ProtocolNum: CT01-007
	Site Id: 02
	Last Organization Study Id: 1
	Next Organization Study Id: 200702
*/
DECLARE @OrgNum varchar(255)
DECLARE @ProtocolNum varchar(255)
DECLARE @Prefix varchar(255)
DECLARE @NextStudyId int
DECLARE @DefaultStudyId int
SET @DefaultStudyId = 1

-- STEP 1: get Org Num + Protocol Num (stripped)
SELECT TOP 1
	@OrgNum = o.OrgNum,
	@ProtocolNum = p.ProtocolNum
FROM 
(
	SELECT
		ProtocolId,
		ProjectId,
		-- normalize protocol num
			CASE 
			WHEN CHARINDEX('-', ProtocolNum) > 0 THEN RIGHT(ProtocolNum, LEN(ProtocolNum) - CHARINDEX('-', ProtocolNum))
			ELSE ProtocolNum
		END AS ProtocolNum
		FROM Protocols
		WHERE
			ProtocolId = @ProtocolId
) p
INNER JOIN Project_ProjectOrganization po
	ON p.ProjectId = po.ProjectId
INNER JOIN ProjectOrganization o
	ON po.OrganizationId = o.OrganizationId
WHERE
	p.ProtocolId = @ProtocolId
	AND ISNUMERIC(p.ProtocolNum) = 1
	AND o.OrganizationId = @OrganizationId
	AND o.OrgNum IS NOT NULL
	AND ISNUMERIC(o.OrgNum) = 1
	
-- STEP 2: get next patient id, number after protocol num
IF @ProtocolNum IS NOT NULL
	BEGIN

	SELECT
			@NextStudyId = MAX(CAST(StudyId AS int)) + 1
		FROM
		(
			SELECT
				-- study id: 1007001, org num: 01, protocol num: 007, study id: 001
				-- 1007001, 7 - 1 - 3 = trim 3 right char 
				SUBSTRING(FullStudyId, CHARINDEX(@ProtocolNum, FullStudyId) + LEN(@ProtocolNum), LEN(FullStudyId)) AS StudyId
			FROM
			(
				SELECT
					CAST(pp.PtProtocolStudyId AS varchar(255)) FullStudyId
				FROM Protocols p
				INNER JOIN PatientProtocols pp
					ON p.ProtocolId = pp.ProtocolId
				WHERE
					p.ProtocolId = @ProtocolId
			) a
			WHERE
				FullStudyId LIKE '%' + @ProtocolNum + '%'
		) a
		WHERE
			ISNUMERIC(StudyId) = 1
	END

-- STEP 3: validate Org Num + Protocol Num
IF @OrgNum IS NOT NULL AND @ProtocolNum IS NOT NULL
	-- inputs valid: get next study id
	BEGIN
		SET @Prefix = @OrgNum + @ProtocolNum
		-- validate: set inital study id
		IF @NextStudyId IS NULL	
			SET @NextStudyId = @DefaultStudyId
			
	    -- pad 0s
	    DECLARE @UnpaddedStudyId varchar(255)
	    SET @UnpaddedStudyId = CAST(@NextStudyId as varchar(255))
	    
	    DECLARE @PaddedStudyId varchar(255) 
	    SET @PaddedStudyId =
			(CASE LEN(@UnpaddedStudyId)
				WHEN 1 THEN '00' + @UnpaddedStudyId
				WHEN 2 THEN '0' + @UnpaddedStudyId
				ELSE @UnpaddedStudyId
			END)
			
		-- result: next study id
		SELECT
			CAST(NextStudyId AS int) AS NextStudyId
		FROM
		(
			SELECT
				CAST(@Prefix AS varchar(255))
				+ @PaddedStudyId
				AS NextStudyId	 
		) a
	END
-- inputs invalid: no study id
ELSE
	BEGIN
		SELECT NULL AS NextStudyId
	END
";
            SqlCommand com = DataAccessHelper.CreateSqlCommand(sql);
            DataAccessHelper.AddIntInputParam(com, "ProtocolId", protocolId);
            DataAccessHelper.AddIntInputParam(com, "OrganizationId", organizationId);
            DataTable dt = DataAccessHelper.GetRecord(com).Tables[0];
            int? nextStudyId = null;
            if (dt.Rows.Count > 0)
            {
                object output = dt.Rows[0][0];
                if (!string.IsNullOrEmpty(output + ""))
                {
                    nextStudyId = (int)output;
                }
            }
            return nextStudyId;
        }

        /// <summary>
        ///  Returns if the study id "compareStudyId" exists for this Protocol
        /// </summary>
        /// <param name="compareStudyId"></param>
        /// <param name="protocolId"></param>
        /// <returns></returns>
        public static bool StudyIdExists(string compareStudyId, int protocolId)
        {
            string sql = "SELECT TOP(1) PtProtocolStudyId FROM PatientProtocols WHERE PtProtocolStudyId = @PtProtocolStudyId AND ProtocolId = @ProtocolId";
            SqlCommand com = DataAccessHelper.CreateSqlCommand(sql);
            DataAccessHelper.AddStringInputParam(com, "PtProtocolStudyId", compareStudyId);
            DataAccessHelper.AddIntInputParam(com, "ProtocolId", protocolId);
            DataTable dt = DataAccessHelper.GetRecord(com).Tables[0];
            bool studyIdExists = dt.Rows.Count > 0;
            return studyIdExists;
        }

        /// <summary>
        /// Returns the next Participant Id
        /// </summary>
        /// <returns></returns>
        public static int GetNextParticipantID()
        {
            // min start number for participant ids
            int participantIDStart = 100000;

            string sql = "SELECT ISNULL(MAX(CAST(Identifier AS int))," + participantIDStart + ") FROM Identifiers WHERE IdType = 'Participant ID' AND ISNUMERIC(Identifier) = 1";
            SqlCommand com = DataAccessHelper.CreateSqlCommand(sql);
            DataTable dt = DataAccessHelper.GetRecord(com).Tables[0];
            int parseParticipantID = 1;
            if (int.TryParse(dt.Rows[0][0].ToString(), out parseParticipantID))
            {
                return parseParticipantID + 1;
            }
            else
            {
                return participantIDStart;
            }
        }

        #region Patient methods

        /// <summary>
        /// 
        /// </summary>
        /// <param name="protocolId"></param>
        /// <returns></returns>
        public static DataTable GetPatientProtocolStatuses(int protocolId)
        {
            string sql = "SELECT PatientProtocolId, MAX(EnteredTime) EnteredTime ,PtProtocolStatus ";
            sql += "FROM PatientProtocolStatus ";
            sql += "WHERE PatientProtocolId IN";
            sql += "(SELECT PatientProtocolId ";
            sql += "FROM PatientProtocols ";
            sql += "WHERE ProtocolId = @ProtocolId) ";
            sql += "GROUP BY PatientProtocolId,PtProtocolStatus ";
            sql += "ORDER BY PatientProtocolId ";


            SqlCommand com = DataAccessHelper.CreateSqlCommand(sql);
            DataAccessHelper.AddIntInputParam(com, "ProtocolId", protocolId);
            DataTable dt = DataAccessHelper.GetRecord(com).Tables[0];
            return dt;
        }

        public static DataTable GetProtocolStatuses(int protocolId)
        {
            return GetProtocolStatuses(protocolId, "SELECT * FROM Patients");
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="protocolId"></param>
        /// <param name="dataset"></param>
        /// <returns></returns>
        public static DataTable GetProtocolStatuses(int protocolId, string dataset)
        {
            string sql = "SELECT pps.PatientProtocolId, pps.PatientProtocolStatusId, pps.PtProtocolStatus, pps.PtProtocolStatusDate  ";
            sql += "FROM PatientProtocolStatus pps ";
            sql += "INNER JOIN PatientProtocols pp ";
            sql += "ON pp.PatientProtocolId = pps.PatientProtocolId ";
            sql += "INNER JOIN ({0}) pds ";
            sql += "ON pds.PatientId = pp.PatientId ";
            sql += "INNER JOIN Protocols p ";
            sql += "ON p.ProtocolId = pp.ProtocolId ";
            sql += "WHERE p.ProtocolId = @ProtocolId ";

            SqlCommand com = DataAccessHelper.CreateSqlCommand(string.Format(sql, dataset));
            DataAccessHelper.AddIntInputParam(com, "ProtocolId", protocolId);
            DataTable dt = DataAccessHelper.GetRecord(com).Tables[0];
            return dt;
        }

        /// <summary>
        /// Returns a list of unique PtProtocolStatus and PatientCount (# of patients with that status).
        /// Looks across all schema arms and status of patients on the Protocol.
        /// </summary>
        /// <param name="protocolId"></param>
        /// <param name="datasetSQL"></param>
        /// <param name="bShowPatientIdentifiers"></param>
        /// <param name="includeDeceasedPatients">true or false if to include deceased patients in the list</param>
        /// <returns></returns>
        public static DataTable GetLatestPatientProtocolStatuses(int protocolId, string datasetSQL, bool bShowPatientIdentifiers, bool includeDeceasedPatients)
        {
            // sql which retrieves a list of patients on the protocol
            string getAllProtocolPatients = GetPatientsByProtocolSQL(protocolId, datasetSQL, null, null, bShowPatientIdentifiers, includeDeceasedPatients);
            // build sql which will select from filtered list of patients on a protocol
            string sqlFormat = @"
            SELECT pps.PtProtocolStatus, COUNT(pps.PatientProtocolId) PatientCount
                FROM ({0}) pps
            GROUP BY pps.PtProtocolStatus 
            ORDER BY pps.PtProtocolStatus ASC ";
            // fill in SQL
            string fullSQL = string.Format(sqlFormat, getAllProtocolPatients);

            SqlCommand com = DataAccessHelper.CreateSqlCommand(string.Format(fullSQL, datasetSQL));
            DataAccessHelper.AddIntInputParam(com, "ProtocolId", protocolId);
            DataTable dt = DataAccessHelper.GetRecord(com).Tables[0];
            return dt;
        }

        [Obsolete("No longer deleting visits, filter via queries.", false)]
        /// <summary>
        /// Removes patient items and fields for a patient on a protocol treatment arm after (and including) offStudyDate
        /// </summary>
        /// <param name="patientProtocolId"></param>
        /// <param name="patientSchemaId"></param>
        /// <param name="deleteDate"></param>
        public static void DeletePatientItems(int patientProtocolId, int patientSchemaId, DateTime deleteDate)
        {
            return;
            /*
            // a list of special dependent statuses to ignore when deleteing visits
            string[] excludeDependentStatuses = new string[] { "Off Treatment", "Off Study" };
            var excludeSQLList = from status in excludeDependentStatuses
                                 select " pt.ItemIntervalType NOT LIKE '%Dependent " + status + "%' ";

            // get a list of all patient visits and items
            string PATIENT_VISITS_ITEMS_SQL =
            @"
                -- get a list of all items collected on all visits  
                SELECT DISTINCT
                    pif.PatientItemFieldId,
                    ppi.PatientItemId
                FROM ProtocolMgr_PatientItemFields pif
                -- important, include items without fields
                RIGHT JOIN ProtocolMgr_PatientItems ppi
                    ON pif.PatientItemId = ppi.PatientItemId
                INNER JOIN ProtocolMgr_ItemTimeline it
                    ON ppi.ItemTimelineId = it.ItemTimelineId
                INNER JOIN ProtocolMgr_Timeline pt
                    ON pt.TimelineId = it.TimelineId
                INNER JOIN ProtocolMgr_PatientSchemas pps			
                    ON pt.ProtocolSchemaId = pps.ProtocolSchemaId	
                WHERE
                    -- restrict to patient schama id (patient's visits on schema arm)
                    ppi.PatientSchemaId = @PatientSchemaId
                    -- restrict by date
                    AND ppi.ScheduledDate >= @DeleteDate

            ";
            // ignore visits dependent on special statuses
            PATIENT_VISITS_ITEMS_SQL += "AND (" + string.Join(" AND ", excludeSQLList.ToArray()) + ")";

            string deletePatientItemFields =
            @"
                DELETE FROM ProtocolMgr_PatientItemFields
                WHERE PatientItemFieldId IN
                (
                    SELECT DISTINCT
                        PatientItemFieldId
                    FROM ({0}) pif
                )
            ";
            string deletePatientItems =
            @"
                DELETE FROM ProtocolMgr_PatientItems
                WHERE PatientItemId IN
                (
                    SELECT DISTINCT
                        PatientItemId
                    FROM ({0}) pi
                )
            ";

            // generate sql to delete item fields and items
            StringBuilder sb = new StringBuilder();
            sb.AppendFormat(deletePatientItemFields, PATIENT_VISITS_ITEMS_SQL);
            sb.AppendLine(";");
            sb.AppendFormat(deletePatientItems, PATIENT_VISITS_ITEMS_SQL);

            string sql = sb.ToString();

            // create command with params
            SqlCommand cmd = DataAccessHelper.CreateSqlCommand(sql);
            DataAccessHelper.AddIntInputParam(cmd, "PatientProtocolId", patientProtocolId);
            DataAccessHelper.AddIntInputParam(cmd, "PatientSchemaId", patientSchemaId);
            // normalize date to one day after
            DateTime normalizedDate = new DateTime(deleteDate.Year, deleteDate.Month, deleteDate.Day, 0, 0, 0).AddDays(1);
            DataAccessHelper.AddDateTimeInputParam(cmd, "DeleteDate", normalizedDate);

            // execute delete
            DataAccessHelper.GetRecord(cmd);
            */
        }

        #endregion

        /// <summary>
        /// Remove a patient item and its associated fields
        /// </summary>
        /// <param name="patientItemId"></param>
        public static void DeletePatientItem(int patientItemId)
        {
            string sql =
               @"
                DELETE FROM ProtocolMgr_PatientItemFields
                WHERE PatientItemId = @PatientItemId

                DELETE FROM ProtocolMgr_PatientItems
                WHERE PatientItemId = @PatientItemId
            ";

            // create command with params
            SqlCommand cmd = DataAccessHelper.CreateSqlCommand(sql);
            DataAccessHelper.AddIntInputParam(cmd, "PatientItemId", patientItemId);

            // execute delete
            DataAccessHelper.GetRecord(cmd);
        }
        /// <summary>
        /// 
        /// </summary>
        /// <param name="protocolSchemaId"></param>
        /// <returns></returns>
        public static DataTable GetDistinctSchemaItems(int protocolSchemaId)
        {
            string sql =
            @"
             SELECT
	            ProtocolSchemaId, 
	            SchemaItemId,
	            ItemDescription,
	            ItemOrder
            FROM ProtocolMgr_SchemaItems psi
            WHERE ProtocolSchemaId = @ProtocolSchemaId
            GROUP BY 
	            ProtocolSchemaId, 
	            SchemaItemId, 
	            ItemDescription,
	            ItemOrder
            ORDER BY
				CASE WHEN psi.ItemOrder IS NOT NULL THEN 0 ELSE 1 END,
				psi.ItemOrder,
				psi.ItemDescription
            ";

            SqlCommand cmd = DataAccessHelper.CreateSqlCommand(sql);
            DataAccessHelper.AddIntInputParam(cmd, "ProtocolSchemaId", protocolSchemaId);
            DataTable dt = DataAccessHelper.GetRecord(cmd).Tables[0];

            return dt;
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="protocolSchemaId"></param>
        /// <returns></returns>
        public static DataTable GetAllSchemaItems(int protocolSchemaId)
        {
            string sql =
            @"
            SELECT
	            psi.ProtocolSchemaId, 
                psi.SchemaItemId, 
                psi.ItemDescription,
                psi.ItemOrder, 
                psif.DestTable
            FROM ProtocolMgr_SchemaItems psi
            LEFT OUTER JOIN ProtocolMgr_SchemaItemFields psif
            ON psi.SchemaItemId = 
                psif.SchemaItemId
            WHERE psi.ProtocolSchemaId = @ProtocolSchemaId
            GROUP BY
	            psi.ProtocolSchemaId, 
                psi.SchemaItemId, 
                psi.ItemDescription,
                psi.ItemOrder,
                psif.DestTable
            ORDER BY
		        CASE WHEN psi.ItemOrder IS NOT NULL THEN 0 ELSE 1 END,
				psi.ItemOrder,
				psi.ItemDescription
            ";

            SqlCommand cmd = DataAccessHelper.CreateSqlCommand(sql);
            DataAccessHelper.AddIntInputParam(cmd, "ProtocolSchemaId", protocolSchemaId);
            DataTable dt = DataAccessHelper.GetRecord(cmd).Tables[0];

            return dt;
        }

        public static DataTable GetDistinctSchemaItemFields(int schemaItemId)
        {
            string sql = @"SELECT DestTable, SchemaItemId
                            FROM ProtocolMgr_SchemaItemFields
                            GROUP BY DestTable, SchemaItemId
                            HAVING (SchemaItemId = @SchemaItemId)";

            SqlCommand cmd = DataAccessHelper.CreateSqlCommand(sql);
            DataAccessHelper.AddIntInputParam(cmd, "SchemaItemId", schemaItemId);
            DataTable dt = DataAccessHelper.GetRecord(cmd).Tables[0];

            return dt;
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="protocolSchemaId"></param>
        /// <returns></returns>
        public static DataTable GetAllSchemaPresetValues(int protocolSchemaId)
        {
            string sql =
            @"
            SELECT
	            a.ProtocolSchemaId,
	            a.SchemaItemId,
	            a.ItemDescription,
	            b.SchemaItemFieldId,
	            b.DestTable,
	            b.DestField,
	            b.DestValue,
	            d.FieldOrder,					
	            ISNULL(e.AttributeValue, b.DestField) AS [FieldLabel]
            FROM ProtocolMgr_SchemaItems a
            JOIN ProtocolMgr_SchemaItemFields b
	            ON a.SchemaItemId = b.SchemaItemId
            JOIN MetadataTables c
	            ON b.DestTable = c.TableName
            JOIN MetadataFields d
	            ON (c.TableId = d.TableId AND b.DestField = d.FieldName)
            JOIN MetadataFieldAttributeValues e
	            ON d.FieldId = e.FieldId
            JOIN MetadataFieldAttributes f
	            ON (f.AttributeId = e.AttributeId AND f.AttributeName = 'FieldLabel')
            WHERE 
	            (a.ProtocolSchemaId = @ProtocolSchemaId)
	            AND (b.DestValue IS NOT NULL AND b.DestValue <> '')
	            AND (b.FieldRowIndex = 0 OR b.FieldRowIndex IS NULL)		
            ORDER BY
	            a.SchemaItemId, d.FieldOrder
            ";

            SqlCommand cmd = DataAccessHelper.CreateSqlCommand(sql);
            DataAccessHelper.AddIntInputParam(cmd, "ProtocolSchemaId", protocolSchemaId);
            DataTable dt = DataAccessHelper.GetRecord(cmd).Tables[0];

            return dt;
        }

        public static DataTable GetTimelineBySchmeaId(int protocolSchemaId)
        {
            string sql = GetTimelineBySchmeaIdSQL();
            SqlCommand cmd = DataAccessHelper.CreateSqlCommand(sql);
            DataAccessHelper.AddIntInputParam(cmd, "ProtocolSchemaId", protocolSchemaId);
            DataTable dt = DataAccessHelper.GetRecord(cmd).Tables[0];
            return dt;
        }


        public static string GetTimelineBySchmeaIdSQL()
        {
            string sql =
            @"
            SELECT
	            -- the timeline records
	            pt.*,
	            -- optional visit item
	            rr.DestPrimaryKey AS DependentItemTimelineId,
	            -- optional visit item's timeline
	            pit.TimelineId AS DependentTimelineId,
	            -- optional visit item's schema item
	            pit.SchemaItemId AS DependentSchemaItemId
            FROM ProtocolMgr_Timeline pt
            LEFT OUTER JOIN RelatedRecords rr
            ON rr.SrcPrimaryKey = pt.TimelineId
               AND rr.SrcTableName = 'ProtocolMgr_Timeline'
               AND rr.DestTableName = 'ProtocolMgr_ItemTimeline'
               AND rr.SrcSystem = '{0}'
            LEFT OUTER JOIN ProtocolMgr_ItemTimeline pit
            ON pit.ItemTimelineId = rr.DestPrimaryKey 
            WHERE pt.ProtocolSchemaId = @ProtocolSchemaId
            ";
            return string.Format(sql, RelatedRecordsDa.CAISIS_SRC_SYSTEM);
        }

        /// <summary>
        /// Gets all TimelineItems which belong to a ProtocolSchema
        /// </summary>
        /// <param name="protocolSchemaId"></param>
        /// <returns></returns>
        public static DataTable GetTimelineItemsBySchemaId(int protocolSchemaId)
        {
            string sql = "SELECT ProtocolMgr_ItemTimeline.ItemTimelineId, ProtocolMgr_Timeline.TimelineId, ProtocolMgr_SchemaItems.SchemaItemId ";
            sql += "FROM ProtocolMgr_ItemTimeline ";
            sql += "INNER JOIN  ProtocolMgr_Timeline ";
            sql += "ON ProtocolMgr_ItemTimeline.TimelineId = ProtocolMgr_Timeline.TimelineId ";
            sql += "INNER JOIN  ProtocolMgr_SchemaItems  ";
            sql += "ON ProtocolMgr_ItemTimeline.SchemaItemId = ProtocolMgr_SchemaItems.SchemaItemId ";
            sql += "WHERE ProtocolMgr_SchemaItems.ProtocolSchemaId = @ProtocolSchemaId AND ProtocolMgr_Timeline.ProtocolSchemaId = @ProtocolSchemaId";
            SqlCommand cmd = DataAccessHelper.CreateSqlCommand(sql);
            DataAccessHelper.AddIntInputParam(cmd, "ProtocolSchemaId", protocolSchemaId);
            DataTable dt = DataAccessHelper.GetRecord(cmd).Tables[0];
            return dt;
        }

        /// <summary>
        ///  
        /// </summary>
        /// <param name="protocolSchemaId"></param>
        /// <param name="patientId"></param>
        /// <returns></returns>
        public static DataTable GetPatientProtocolSchema(int protocolSchemaId, int patientId)
        {
            string sql = "SELECT * FROM ProtocolMgr_PatientSchemas WHERE ProtocolSchemaId = @ProtocolSchemaId AND PatientId = @PatientId";
            SqlCommand cmd = DataAccessHelper.CreateSqlCommand(sql);
            DataAccessHelper.AddIntInputParam(cmd, "ProtocolSchemaId", protocolSchemaId);
            DataAccessHelper.AddIntInputParam(cmd, "PatientId", patientId);
            DataTable dt = DataAccessHelper.GetRecord(cmd).Tables[0];
            return dt;
        }

        /// <summary>
        /// Gets a list of PatientSchema for a protocol
        /// </summary>
        /// <param name="protocolId"></param>
        /// <param name="patientId"></param>
        /// <returns></returns>
        public static DataTable GetPatientProtocolSchemasByProtocol(int protocolId, int patientId)
        {
            string sql = "SELECT ProtocolMgr_PatientSchemas.* FROM ProtocolMgr_PatientSchemas ";
            sql += "INNER JOIN ProtocolMgr_ProtocolSchemas ON ProtocolMgr_ProtocolSchemas.ProtocolSchemaId = ProtocolMgr_PatientSchemas.ProtocolSchemaId ";
            sql += "INNER JOIN ProtocolMgr_ProtocolVersions ON ProtocolMgr_ProtocolVersions.ProtocolVersionId = ProtocolMgr_ProtocolSchemas.ProtocolVersionId ";
            sql += "WHERE  ProtocolMgr_ProtocolVersions.ProtocolId = @ProtocolId AND ProtocolMgr_PatientSchemas.PatientId = @PatientId";
            SqlCommand cmd = DataAccessHelper.CreateSqlCommand(sql);
            DataAccessHelper.AddIntInputParam(cmd, "ProtocolId", protocolId);
            DataAccessHelper.AddIntInputParam(cmd, "PatientId", patientId);
            DataTable dt = DataAccessHelper.GetRecord(cmd).Tables[0];
            return dt;

        }

        /// <summary>
        /// Gets all Child Tables which belong to a ProtocolSchema
        /// </summary>
        /// <param name="protocolSchemaId"></param>
        /// <returns></returns>
        public static DataTable GetChildTablesBySchema(int schemaItemId)
        {
            string sql = "SELECT ProtocolMgr_SchemaItemFields.DestTable ";
            sql += "FROM ProtocolMgr_SchemaItems ";
            sql += "INNER JOIN ProtocolMgr_SchemaItemFields ";
            sql += "ON ProtocolMgr_SchemaItems.SchemaItemId = ProtocolMgr_SchemaItemFields.SchemaItemId ";
            sql += "GROUP BY ProtocolMgr_SchemaItemFields.DestTable, ProtocolMgr_SchemaItemFields.SchemaItemId ";
            sql += "HAVING (ProtocolMgr_SchemaItemFields.SchemaItemId  = @SchemaItemId) ";

            SqlCommand cmd = DataAccessHelper.CreateSqlCommand(sql);
            DataAccessHelper.AddIntInputParam(cmd, "SchemaItemId", schemaItemId);
            DataTable dt = DataAccessHelper.GetRecord(cmd).Tables[0];
            return dt;
        }

        public static DataTable GetChildRowsBySchemaItemId(int schemaItemId, string tableName, bool bParentTable)
        {
            string sql = "SELECT SchemaItemId, DestTable, FieldRowIndex ";
            sql += "FROM ProtocolMgr_SchemaItemFields ";
            sql += "GROUP BY SchemaItemId, DestTable, FieldRowIndex ";
            sql += "HAVING (SchemaItemId = @SchemaItemId) AND ";
            sql += "(FieldRowIndex IS NOT NULL) ";
            sql += "AND (DestTable = @TableName) ";
            sql += "ORDER BY FieldRowIndex ";

            SqlCommand cmd = DataAccessHelper.CreateSqlCommand(sql);
            DataAccessHelper.AddIntInputParam(cmd, "SchemaItemId", schemaItemId);
            DataAccessHelper.AddStringInputParam(cmd, "TableName", tableName);
            DataTable dt = DataAccessHelper.GetRecord(cmd).Tables[0];
            return dt;
        }

        /// <summary>
        /// Returns if the Schema Item is a grid (i.e., FieldRowIndex IS NOT NULL)
        /// </summary>
        /// <param name="tableName"></param>
        /// <param name="schemaItemId"></param>
        /// <returns></returns>
        public static bool IsTableAGrid(string tableName, int schemaItemId)
        {
            /*
            string sql = "SELECT DestTable, FieldRowIndex, SchemaItemId ";
            sql += "FROM ProtocolMgr_SchemaItemFields ";
            sql += "GROUP BY DestTable, FieldRowIndex, SchemaItemId ";
            sql += "HAVING (SchemaItemId = @SchemaItemId) AND (DestTable = @TableName) ";
            sql += "ORDER BY FieldRowIndex";
            */
            string sql =
            @"
            SELECT
                COUNT(SchemaItemFieldId) AS [Count]
            FROM ProtocolMgr_SchemaItemFields
            WHERE
	            SchemaItemId = @SchemaItemId
	            AND DestTable = @TableName
	            AND FieldRowIndex IS NOT NULL
            ";

            SqlCommand cmd = DataAccessHelper.CreateSqlCommand(sql);
            DataAccessHelper.AddIntInputParam(cmd, "SchemaItemId", schemaItemId);
            DataAccessHelper.AddStringInputParam(cmd, "TableName", tableName);
            DataTable dt = DataAccessHelper.GetRecord(cmd).Tables[0];

            int count = (int)dt.Rows[0][0];
            return count > 0;
            /*
            if (dt.Rows.Count >= 1)
            {
                if (dt.Rows[0]["FieldRowIndex"] != DBNull.Value)
                    return true;
            }
            return false;
             */
        }

        /// <summary>
        /// Returns if there are any visits created for this item.
        /// </summary>
        /// <param name="schemaItemId"></param>
        /// <returns></returns>
        public static bool HasTimelineBeenCreated(int schemaItemId)
        {
            /*
            string sql = "SELECT ProtocolMgr_SchemaItems.SchemaItemId, ProtocolMgr_ItemTimeline.ItemTimelineId ";
            sql += "FROM ProtocolMgr_SchemaItems INNER JOIN ";
            sql += "ProtocolMgr_ItemTimeline ON ProtocolMgr_SchemaItems.SchemaItemId = ProtocolMgr_ItemTimeline.SchemaItemId ";
            sql += "WHERE (ProtocolMgr_SchemaItems.SchemaItemId = @SchemaItemId)";
            */

            string sql =
            @"
            SELECT
	            COUNT(a.ItemTimelineId) AS [Count]
            FROM ProtocolMgr_ItemTimeline a
            WHERE 
	            a.SchemaItemId = @SchemaItemId
            ";

            SqlCommand cmd = DataAccessHelper.CreateSqlCommand(sql);
            DataAccessHelper.AddIntInputParam(cmd, "SchemaItemId", schemaItemId);
            DataTable dt = DataAccessHelper.GetRecord(cmd).Tables[0];

            int count = (int)dt.Rows[0][0];
            return count > 0;

            /*
            if (dt.Rows.Count > 1)
                return true;

            return false;
            */
        }

        /// <summary>
        /// Returns if there are any patients scheduled for this item.
        /// </summary>
        /// <param name="schemaItemId"></param>
        /// <returns></returns>
        public static bool HavePatientsBeenAssignedToSchema(int schemaItemId)
        {
            /*
            string sql = "SELECT ProtocolMgr_SchemaItemFields.SchemaItemId, ProtocolMgr_PatientItemFields.PatientItemFieldId ";
            sql += "FROM ProtocolMgr_PatientItemFields INNER JOIN ";
            sql += "ProtocolMgr_SchemaItemFields ON ";
            sql += "ProtocolMgr_PatientItemFields.SchemaItemFieldId = ProtocolMgr_SchemaItemFields.SchemaItemFieldId ";
            sql += "WHERE (ProtocolMgr_SchemaItemFields.SchemaItemId = @SchemaItemId)";
            */

            string sql =
            @"
            SELECT
	            COUNT(a.PatientItemFieldId) AS [Count]
            FROM ProtocolMgr_PatientItemFields a
            INNER JOIN ProtocolMgr_SchemaItemFields b
	            ON a.SchemaItemFieldId = b.SchemaItemFieldId 
            WHERE
	            b.SchemaItemId = @SchemaItemId
            ";

            SqlCommand cmd = DataAccessHelper.CreateSqlCommand(sql);
            DataAccessHelper.AddIntInputParam(cmd, "SchemaItemId", schemaItemId);
            DataTable dt = DataAccessHelper.GetRecord(cmd).Tables[0];

            int count = (int)dt.Rows[0][0];
            return count > 0;

            /*
            if (dt.Rows.Count > 1)
                return true;

            return false;
            */
        }

        public static DataTable GetUniqueTableNamesBySchema(int schemaItemId)
        {
            string sql = "SELECT DestTable ";
            sql += "FROM ProtocolMgr_SchemaItemFields ";
            sql += "WHERE (SchemaItemId = @SchemaItemId) ";
            sql += "GROUP BY DestTable ";

            SqlCommand cmd = DataAccessHelper.CreateSqlCommand(sql);
            DataAccessHelper.AddIntInputParam(cmd, "SchemaItemId", schemaItemId);
            DataTable dt = DataAccessHelper.GetRecord(cmd).Tables[0];
            return dt;
        }

        #region Metadata Surveys (Questtionaire)

        /// <summary>
        /// Returns a list of ProtocolVersionIds associated with a MetadataSurvey
        /// </summary>
        /// <param name="metaSurveyId"></param>
        /// <returns></returns>
        public static DataTable GetProtocolVersionsBySurvey(int metaSurveyId)
        {
            string sql = "SELECT * FROM ProtocolMgr_ProtocolVersions ";
            sql += "WHERE ProtocolMgr_ProtocolVersions.MetadataSurveyId = @MetadataSurveyId ";

            SqlCommand cmd = DataAccessHelper.CreateSqlCommand(sql);
            DataAccessHelper.AddIntInputParam(cmd, "MetadataSurveyId", metaSurveyId);
            DataTable dt = DataAccessHelper.GetRecord(cmd).Tables[0];
            return dt;
        }

        /// <summary>
        /// Gets a list of normalized questions and responses based on the mata survey and patient registration.
        /// SELECT
        ///     [PatientProtocolRegQuestionnaireId], -- optional
        ///     [MetadataSurveyQuestionId], -- optional
        ///     [QuestionNum],
        ///     [Question],
        ///     [Response], -- optional
        ///     [IneligibleResponseOverride], -- optional
        ///     [IneligibleOverrideReason] -- optional
        /// </summary>
        /// <param name="metaSurveyId"></param>
        /// <param name="registrationId"></param>
        /// <returns></returns>
        public static DataTable GetPatientQuestionnaire(int? metaSurveyId, int? registrationId)
        {
            // default case
            string sql =
@"
DECLARE @QuestionnaireCount int
SELECT
	@QuestionnaireCount = COUNT([PatientProtocolRegQuestionnaireId])
FROM PatientProtocolRegQuestionnaires
WHERE PatientProtocolRegistrationId = @PatientProtocolRegistrationId

IF  @MetadataSurveyId IS NOT NULL
	AND (@PatientProtocolRegistrationId IS NOT NULL AND @QuestionnaireCount > 0)
BEGIN
	SELECT DISTINCT
		b.[PatientProtocolRegQuestionnaireId],
		a.[MetadataSurveyQuestionId],
		ISNULL(b.[QuestionNum], a.[QuestionNum]) AS [QuestionNum],
		ISNULL(b.[Question], a.[Question]) AS [Question],
		ISNULL(b.[Response], a.[Response]) AS [Response],
		ISNULL(b.[IneligibleResponseOverride], a.[IneligibleResponseOverride]) AS [IneligibleResponseOverride],
        ISNULL(b.[IneligibleOverrideReason], a.[IneligibleOverrideReason]) AS [IneligibleOverrideReason]
	FROM
	(
		SELECT
			NULL [PatientProtocolRegQuestionnaireId],
			MetadataSurveyQuestionId AS [MetadataSurveyQuestionId],
			QuestionNumber AS [QuestionNum],
			[Question],
			NULL [Response],
			NULL [IneligibleResponseOverride],
            NULL [IneligibleOverrideReason]
		FROM MetadataSurveyQuestions mq
		WHERE
			mq.MetadataSurveyId = @MetadataSurveyId
	) a
	RIGHT OUTER JOIN
	(
		SELECT
			[PatientProtocolRegQuestionnaireId],
			NULL [MetadataSurveyQuestionId],
			[QuestionNum],
			[Question],
			[Response],
			[IneligibleResponseOverride],
            [IneligibleOverrideReason]
		FROM PatientProtocolRegQuestionnaires pq
		WHERE PatientProtocolRegistrationId = @PatientProtocolRegistrationId
	) b
	ON
		a.QuestionNum = b.QuestionNum AND a.Question = b.Question
END
ELSE IF @MetadataSurveyId IS NOT NULL 
		AND (@PatientProtocolRegistrationId IS NULL OR @QuestionnaireCount = 0)
BEGIN
		SELECT
			NULL [PatientProtocolRegQuestionnaireId],
			MetadataSurveyQuestionId AS [MetadataSurveyQuestionId],
			QuestionNumber AS [QuestionNum],
			[Question],
			NULL [Response],
			NULL [IneligibleResponseOverride],
            NULL [IneligibleOverrideReason]
		FROM MetadataSurveyQuestions mq
		WHERE
			mq.MetadataSurveyId = @MetadataSurveyId
END
ELSE 
BEGIN
	SELECT
			[PatientProtocolRegQuestionnaireId],
			NULL [MetadataSurveyQuestionId],
			[QuestionNum],
			[Question],
			[Response],
			[IneligibleResponseOverride],
            [IneligibleOverrideReason]
	FROM PatientProtocolRegQuestionnaires pq
	WHERE PatientProtocolRegistrationId = @PatientProtocolRegistrationId
END
";
            SqlCommand cmd = DataAccessHelper.CreateSqlCommand(sql);
            DataAccessHelper.AddInputParam(cmd, "MetadataSurveyId", metaSurveyId, true);
            DataAccessHelper.AddInputParam(cmd, "PatientProtocolRegistrationId", registrationId, true);
            DataTable dt = DataAccessHelper.GetRecord(cmd).Tables[0];
            return dt;
        }

        #endregion

        /// <summary>
        /// Deletes the treatment arm.
        /// </summary>
        /// <param name="protocolSchemaId"></param>
        public static void DeleteTreatmentArm(int protocolSchemaId)
        {
            string sql =
            @"
                -- clean up item timeline
                DELETE FROM ProtocolMgr_ItemTimeline
                WHERE ItemTimelineId IN
                (
                    SELECT DISTINCT
	                    a.ItemTimelineId
                    FROM ProtocolMgr_ItemTimeline a
                    INNER JOIN ProtocolMgr_SchemaItems b
	                    ON a.SchemaItemId = b.SchemaItemId
                    WHERE b.ProtocolSchemaId = @ProtocolSchemaId
                )

                -- clean up timeline
                DELETE FROM ProtocolMgr_Timeline
                WHERE TimelineId IN
                (
                    SELECT DISTINCT
	                    a.TimelineId
                    FROM ProtocolMgr_Timeline a
                    WHERE a.ProtocolSchemaId = @ProtocolSchemaId
                )

                -- clean up schema item fields
                DELETE FROM ProtocolMgr_SchemaItemFields
                WHERE SchemaItemFieldId IN
                (
                    SELECT DISTINCT
	                    a.SchemaItemFieldId
                    FROM ProtocolMgr_SchemaItemFields a
                    INNER JOIN ProtocolMgr_SchemaItems b
	                    ON a.SchemaItemId = b.SchemaItemId
                    WHERE b.ProtocolSchemaId = @ProtocolSchemaId
                )

                -- clean up schema items
                DELETE FROM ProtocolMgr_SchemaItems
                WHERE SchemaItemId IN
                (
                    SELECT DISTINCT
	                    a.SchemaItemId
                    FROM ProtocolMgr_SchemaItems a
                    WHERE a.ProtocolSchemaId = @ProtocolSchemaId
                )

                -- delete schema
                DELETE FROM ProtocolMgr_ProtocolSchemas
                WHERE ProtocolSchemaId IN
                (
                    SELECT DISTINCT
	                    a.ProtocolSchemaId 
                    FROM ProtocolMgr_ProtocolSchemas a
                    WHERE a.ProtocolSchemaId = @ProtocolSchemaId
                )
            ";
            SqlCommand cmd = DataAccessHelper.CreateSqlCommand(sql);
            DataAccessHelper.AddIntInputParam(cmd, "ProtocolSchemaId", protocolSchemaId);
            DataAccessHelper.GetRecord(cmd);
        }

        /// <summary>
        /// Removes old Timeline and ItemTimeline records.
        /// </summary>
        /// <param name="protocolSchemaId"></param>
        public static void DeleteOldTimeline(int protocolSchemaId)
        {
            string sql = "DELETE FROM ProtocolMgr_ItemTimeline ";
            sql += "WHERE TimelineId IN ";
            sql += "(SELECT TimelineId ";
            sql += "FROM ProtocolMgr_Timeline ";
            sql += "WHERE ProtocolSchemaId = @ProtocolSchemaId) ";
            sql += "DELETE ";
            sql += "FROM ProtocolMgr_Timeline ";
            sql += "WHERE ProtocolSchemaId = @ProtocolSchemaId ";
            SqlCommand cmd = DataAccessHelper.CreateSqlCommand(sql);
            DataAccessHelper.AddIntInputParam(cmd, "ProtocolSchemaId", protocolSchemaId);
            DataAccessHelper.GetRecord(cmd);
        }

        /// <summary>
        /// Returns a list of Patient Visits and items collected during the visit.
        /// </summary>
        /// <param name="patientSchemaId">The Patient Schema Id</param>
        /// <param name="timelineId">Restrict to optional timeline</param>
        /// <returns></returns>
        public static DataTable GetPatientVisitSchedulingSummary(int patientSchemaId, int? timelineId)
        {
            string sql =
            @"
            SELECT
	            -- visits
	            pt.TimelineId,
	            pt.PreStudySchemaItem,
	            pt.DisplayColumnPosition,
	            pt.DisplayUnitName,
	            pt.NumberOfUnits,
	            pt.VisitLabel,
	            -- items
	            psi.ItemDescription,
	            -- patient items on visit
	            ppi.PatientItemId,
	            ppi.FirstAnticipatedDate,
	            ppi.LastAnticipatedDate,
	            ppi.ScheduledDate,
	            ppi.Status,
	            COUNT(ppif.DestTablePrimKey) AS DataEntryCount 
            FROM ProtocolMgr_PatientItems ppi
            INNER JOIN ProtocolMgr_ItemTimeline pit
	            ON ppi.ItemTimelineId = pit.ItemTimelineId
            INNER JOIN ProtocolMgr_Timeline pt
	            ON pt.TimelineId = pit.TimelineId
            INNER JOIN ProtocolMgr_SchemaItems psi
	            ON psi.SchemaItemId = pit.SchemaItemId
            INNER JOIN ProtocolMgr_PatientItemFields ppif
	            ON ppif.PatientItemId = ppi.PatientItemId
            WHERE ppi.PatientSchemaId = @PatientSchemaId {0}
            GROUP BY
	            -- visits
	            pt.TimelineId,
	            pt.PreStudySchemaItem,
	            pt.DisplayColumnPosition,
	            pt.DisplayUnitName,
	            pt.NumberOfUnits,
	            pt.VisitLabel,
	            -- items
                psi.SchemaItemId,
	            psi.ItemDescription,
                psi.ItemOrder,
	            -- patient items on visit
	            ppi.PatientItemId,
	            ppi.FirstAnticipatedDate,
	            ppi.LastAnticipatedDate,
	            ppi.ScheduledDate,
	            ppi.Status
            ORDER BY
	            -- pre study items sorted to top
	            ISNULL(pt.PreStudySchemaItem, 0) DESC,
	            pt.DisplayColumnPosition ASC,
	            pt.TimelineId ASC,
	            pt.VisitLabel ASC,
                -- order by Schema Item Order
                CASE WHEN psi.ItemOrder IS NOT NULL THEN 0 ELSE 1 END,
				psi.ItemOrder,
				psi.ItemDescription
            ";
            string timelineSQL = "";
            if (timelineId.HasValue)
                timelineSQL = "AND pt.TimelineId = @TimelineId";

            SqlCommand cmd = DataAccessHelper.CreateSqlCommand(string.Format(sql, timelineSQL));
            DataAccessHelper.AddIntInputParam(cmd, "PatientSchemaId", patientSchemaId);
            if (timelineId.HasValue)
                DataAccessHelper.AddIntInputParam(cmd, "TimelineId", timelineId.Value);
            DataTable dt = DataAccessHelper.GetRecord(cmd).Tables[0];

            return dt;
        }

        public static DataTable GetPatientVisitSummary(int patientSchemaId)
        {
            string sql = @"SELECT Protocols.ProtocolNum, Protocols.ProtocolAlias, ProtocolMgr_ProtocolVersions.VersionNumber, 
                              ProtocolMgr_ProtocolSchemas.ProtocolSchemaId, ProtocolMgr_ProtocolSchemas.ProtocolArmNumber, 
                              ProtocolMgr_ProtocolSchemas.ProtocolArmDescription, MAX(ProtocolMgr_Timeline.TimelineId) AS 'TimelineId', 
                              ProtocolMgr_Timeline.DisplayUnitName, ProtocolMgr_Timeline.NumberOfUnits, ProtocolMgr_SchemaItems.ItemDescription, 
                              ProtocolMgr_PatientSchemas.PatientId, ProtocolMgr_PatientSchemas.StartDate, MAX(ProtocolMgr_PatientItems.PatientItemId) 
                              AS 'PatientItemId', ProtocolMgr_PatientItems.Status, ProtocolMgr_PatientItems.ScheduledDate, 
                              ProtocolMgr_PatientItems.FirstAnticipatedDate, ProtocolMgr_PatientItems.LastAnticipatedDate, 
                              COALESCE (ProtocolMgr_PatientItems.ScheduledDate, ProtocolMgr_PatientItems.FirstAnticipatedDate) AS 'SortDate', 
                              ProtocolMgr_SchemaItems.SchemaItemId, ProtocolMgr_PatientItems.PatientSchemaId, 
                              COUNT(ProtocolMgr_PatientItemFields.DestTablePrimKey) AS DataEntryCount 
                        FROM ProtocolMgr_PatientSchemas INNER JOIN
                              ProtocolMgr_PatientItems ON ProtocolMgr_PatientSchemas.PatientSchemaId = ProtocolMgr_PatientItems.PatientSchemaId INNER JOIN
                              ProtocolMgr_ItemTimeline ON ProtocolMgr_PatientItems.ItemTimelineId = ProtocolMgr_ItemTimeline.ItemTimelineId INNER JOIN
                              ProtocolMgr_Timeline ON ProtocolMgr_ItemTimeline.TimelineId = ProtocolMgr_Timeline.TimelineId INNER JOIN
                              ProtocolMgr_SchemaItems ON ProtocolMgr_ItemTimeline.SchemaItemId = ProtocolMgr_SchemaItems.SchemaItemId INNER JOIN
                              ProtocolMgr_ProtocolSchemas ON 
                              ProtocolMgr_PatientSchemas.ProtocolSchemaId = ProtocolMgr_ProtocolSchemas.ProtocolSchemaId INNER JOIN
                              ProtocolMgr_ProtocolVersions ON 
                              ProtocolMgr_ProtocolSchemas.ProtocolVersionId = ProtocolMgr_ProtocolVersions.ProtocolVersionId INNER JOIN
                              Protocols ON ProtocolMgr_ProtocolVersions.ProtocolId = Protocols.ProtocolId INNER JOIN
                              ProtocolMgr_PatientItemFields ON ProtocolMgr_PatientItems.PatientItemId = ProtocolMgr_PatientItemFields.PatientItemId
                        WHERE     (ProtocolMgr_PatientSchemas.PatientSchemaId = @PatientSchemaId)
                        GROUP BY Protocols.ProtocolNum, Protocols.ProtocolAlias, ProtocolMgr_ProtocolVersions.VersionNumber, 
                              ProtocolMgr_ProtocolSchemas.ProtocolSchemaId, ProtocolMgr_ProtocolSchemas.ProtocolArmNumber, 
                              ProtocolMgr_ProtocolSchemas.ProtocolArmDescription, ProtocolMgr_Timeline.DisplayUnitName, ProtocolMgr_Timeline.NumberOfUnits, 
                              ProtocolMgr_SchemaItems.ItemDescription, ProtocolMgr_PatientSchemas.PatientId, ProtocolMgr_PatientSchemas.StartDate, 
                              ProtocolMgr_PatientItems.Status, ProtocolMgr_PatientItems.ScheduledDate, ProtocolMgr_PatientItems.FirstAnticipatedDate, 
                              ProtocolMgr_PatientItems.LastAnticipatedDate, COALESCE (ProtocolMgr_PatientItems.ScheduledDate, 
                              ProtocolMgr_PatientItems.FirstAnticipatedDate), ProtocolMgr_SchemaItems.SchemaItemId, 
                              ProtocolMgr_SchemaItems.SchemaItemId, ProtocolMgr_PatientItems.PatientSchemaId
                        ORDER BY 'SortDate', ProtocolMgr_SchemaItems.ItemDescription ";

            SqlCommand cmd = DataAccessHelper.CreateSqlCommand(sql);
            DataAccessHelper.AddIntInputParam(cmd, "PatientSchemaId", patientSchemaId);
            DataTable dt = DataAccessHelper.GetRecord(cmd).Tables[0];

            return dt;
        }

        public static void UpdateGroupPatientItems(int patientSchemaId, string patientItemStatus, string scheduledDate, int schemaItemId)
        {
            string sql = "UPDATE ProtocolMgr_PatientItems ";
            sql += "SET ProtocolMgr_PatientItems.Status = @Status, ProtocolMgr_PatientItems.ScheduledDate = @ScheduledDate ";
            sql += "FROM ProtocolMgr_PatientItems INNER JOIN ";
            sql += "ProtocolMgr_ItemTimeline ON ProtocolMgr_PatientItems.ItemTimelineId = ProtocolMgr_ItemTimeline.ItemTimelineId INNER JOIN ";
            sql += "ProtocolMgr_SchemaItems ON ProtocolMgr_ItemTimeline.SchemaItemId = ProtocolMgr_SchemaItems.SchemaItemId ";
            sql += "WHERE (ProtocolMgr_PatientItems.PatientSchemaId = @PatientSchemaId) AND (ProtocolMgr_SchemaItems.SchemaItemId = @SchemaItemId) ";

            SqlCommand cmd = DataAccessHelper.CreateSqlCommand(sql);
            DataAccessHelper.AddIntInputParam(cmd, "PatientSchemaId", patientSchemaId);
            DataAccessHelper.AddIntInputParam(cmd, "SchemaItemId", schemaItemId);
            DataAccessHelper.AddStringInputParam(cmd, "Status", patientItemStatus);
            DataAccessHelper.AddStringInputParam(cmd, "ScheduledDate", scheduledDate);
            DataAccessHelper.GetRecord(cmd);
        }

        /// <summary>
        /// Removes old Schema Item
        /// </summary>
        /// <param name="protocolSchemaId"></param>
        public static bool DeleteOldSchemaItem(int schemaItemId)
        {
            bool retVal = false;

            SqlTransaction tran = DataAccessHelper.BeginTransaction();

            try
            {
                DeleteOldSchemaItemFields(schemaItemId, tran);

                string sql = "DELETE FROM ProtocolMgr_SchemaItems ";
                sql += "WHERE SchemaItemId = @SchemaItemId ";

                SqlCommand cmd = DataAccessHelper.CreateSqlCommand(sql, tran.Connection);
                cmd.Transaction = tran;

                DataAccessHelper.AddIntInputParam(cmd, "SchemaItemId", schemaItemId);
                DataAccessHelper.GetRecord(cmd);

                DataAccessHelper.EndTransaction(tran);

                retVal = true;
            }
            catch
            {
                if (tran != null)
                {
                    try
                    {
                        tran.Rollback();
                    }
                    catch
                    {
                    }
                }

                retVal = false;
            }
            finally
            {
                if (tran != null)
                {
                    SqlConnection conn = tran.Connection;
                    if (conn != null)
                        conn.Close();
                    tran.Dispose();
                }
            }

            return retVal;
        }

        /// <summary>
        /// Removes old Schema Item Fields
        /// </summary>
        /// <param name="protocolSchemaId"></param>
        public static void DeleteOldSchemaItemFields(int schemaItemId, SqlTransaction tran)
        {
            string sql = "DELETE FROM ProtocolMgr_SchemaItemFields ";
            sql += "WHERE SchemaItemId = @SchemaItemId ";

            SqlCommand cmd = DataAccessHelper.CreateSqlCommand(sql, tran.Connection);
            cmd.Transaction = tran;
            DataAccessHelper.AddIntInputParam(cmd, "SchemaItemId", schemaItemId);
            DataAccessHelper.GetRecord(cmd);
        }

        public static void DeleteSchemaItemField(int schemaItemFieldId)
        {
            string sql =
@"
DELETE a FROM ProtocolMgr_PatientItemFields a
INNER JOIN ProtocolMgr_SchemaItemFields b
    ON a.SchemaItemFieldId = b.SchemaItemFieldId
WHERE b.SchemaItemFieldId = @SchemaItemFieldId

DELETE FROM ProtocolMgr_SchemaItemFields 
WHERE SchemaItemFieldId = @SchemaItemFieldId
";
            SqlCommand cmd = DataAccessHelper.CreateSqlCommand(sql);
            DataAccessHelper.AddIntInputParam(cmd, "SchemaItemFieldId", schemaItemFieldId);
            DataAccessHelper.GetRecord(cmd);
        }

        public static void DeleteItemTimeline(int itemTimelineId)
        {
            string sql =
            @"
DECLARE @ErrSeverity int
DECLARE @ErrMsg varchar(250)

BEGIN TRY
   BEGIN TRANSACTION

            -- delete patient item fields
            DELETE FROM ProtocolMgr_PatientItemFields
            WHERE PatientItemFieldId IN
            (
	            SELECT
		            pif.PatientItemFieldId
	            FROM ProtocolMgr_PatientItemFields pif
	            INNER JOIN ProtocolMgr_PatientItems pi
		            ON pif.PatientItemId = pi.PatientItemId
	            INNER JOIN ProtocolMgr_ItemTimeline it
		            ON pi.ItemTimelineId = it.ItemTimelineId
	            WHERE
		            it.ItemTimelineId = @ItemTimelineId
            )

            -- delete patient items
            DELETE FROM ProtocolMgr_PatientItems
            WHERE PatientItemId IN
            (
	            SELECT
		            pi.PatientItemId
	            FROM ProtocolMgr_PatientItems pi
	            INNER JOIN ProtocolMgr_ItemTimeline it
		            ON pi.ItemTimelineId = it.ItemTimelineId
	            WHERE
		            it.ItemTimelineId = @ItemTimelineId
            )

            -- delete item timeline
            DELETE FROM ProtocolMgr_ItemTimeline
            WHERE ItemTimelineId = @ItemTimelineId
   
    COMMIT TRANSACTION
END TRY

BEGIN CATCH
    SET @ErrSeverity = ERROR_SEVERITY()
    SET @ErrMsg = ERROR_MESSAGE()
    ROLLBACK TRANSACTION
    RAISERROR (@ErrMsg, @ErrSeverity, 1)
END CATCH
            ";

            SqlCommand cmd = DataAccessHelper.CreateSqlCommand(sql);
            DataAccessHelper.AddIntInputParam(cmd, "ItemTimelineId", itemTimelineId);
            DataAccessHelper.GetRecord(cmd);
        }

        /// <summary>
        /// Returns a list of all Schema Items that are templates
        /// </summary>
        /// <param name="metaSurveyId"></param>
        /// <returns></returns>
        public static DataTable GetAllTemplates()
        {
            string sql = "SELECT SchemaItemId, ItemDescription FROM ProtocolMgr_SchemaItems ";
            sql += "WHERE ItemIsTemplate = 1 ";

            SqlCommand cmd = DataAccessHelper.CreateSqlCommand(sql);
            DataTable dt = DataAccessHelper.GetRecord(cmd).Tables[0];
            return dt;
        }

        public static int GetProtocolIdByPatientItemId(int patientItemId)
        {
            string sql =
                @"SELECT ProtocolMgr_ProtocolVersions.ProtocolId
					FROM ProtocolMgr_ProtocolVersions
						INNER JOIN ProtocolMgr_ProtocolSchemas 
							ON ProtocolMgr_ProtocolVersions.ProtocolVersionId = ProtocolMgr_ProtocolSchemas.ProtocolVersionId
						INNER JOIN ProtocolMgr_PatientSchemas
							ON ProtocolMgr_ProtocolSchemas.ProtocolSchemaId = ProtocolMgr_PatientSchemas.ProtocolSchemaId
						INNER JOIN ProtocolMgr_PatientItems
							ON ProtocolMgr_PatientSchemas.PatientSchemaId = ProtocolMgr_PatientItems.PatientSchemaId
					WHERE ProtocolMgr_PatientItems.PatientItemId = @PatientItemId";

            using (SqlConnection conn = Connectivity.GetConnection())
            {
                conn.Open();

                SqlCommand cmd = new SqlCommand(sql, conn);
                cmd.Parameters.Add(new SqlParameter("@PatientItemId", patientItemId));

                SqlDataReader reader = cmd.ExecuteReader();

                int protocolId;

                if (reader.Read())
                    protocolId = reader.GetInt32(0);
                else
                    throw new ArgumentException("That PatientItemId does not exist in the database.", "patientItemId");

                reader.Close();

                return protocolId;
            }
        }

        public static int AddNewArm(int SchemaDropDown, string NewArmNumber, string NewArmDescription, int TimelineDropDown, string username)
        {
            SqlCommand cmd = DataAccessHelper.CreateCommand("spInsertProtocolMgrCopySchemaFromTimelineId");
            DataAccessHelper.AddIntInputParam(cmd, "ProtocolSchemaId", SchemaDropDown);
            DataAccessHelper.AddStringInputParam(cmd, "NewArmNumber", NewArmNumber);
            DataAccessHelper.AddStringInputParam(cmd, "NewArmDescription", NewArmDescription);
            DataAccessHelper.AddIntInputParam(cmd, "StartTimelineId", TimelineDropDown);
            // pass null values
            cmd.Parameters.Add(new SqlParameter("ProtocolArmActive", DBNull.Value));
            cmd.Parameters.Add(new SqlParameter("ProtocolArmMaxAccrual", DBNull.Value));

            DateTime date = DateTime.Now;
            DataAccessHelper.AddStringInputParam(cmd, "EnteredBy", username);
            DataAccessHelper.AddDateTimeInputParam(cmd, "EnteredTime", date);
            DataAccessHelper.AddStringInputParam(cmd, "UpdatedBy", username);
            DataAccessHelper.AddDateTimeInputParam(cmd, "UpdatedTime", date);
            DataAccessHelper.AddIntOutputParam(cmd, "NewSchemaId");

            //string newSchemaId = dh.GetFirstRow()["@NewSchemaId"].ToString();
            Hashtable tb = DataAccessHelper.ExecuteScalar(cmd);// dh.RunNonQueryWithReturnValue("@NewSchemaId");
            int newSchmeaId = int.Parse(tb["NewSchemaId"].ToString());

            // return newly created schema id
            return newSchmeaId;
        }

        /// <summary>
        /// Returns a list of Unplanned Events based on records in Deviation Table and list of Related Tables
        /// </summary>
        /// <param name="protocolId"></param>
        /// <param name="schemaId"></param>
        /// <param name="patientId"></param>
        /// <param name="patientSchemaId"></param>
        /// <returns></returns>
        public static DataTable GetPatientDeviations(int protocolId, int schemaId, int patientId, int patientSchemaId)
        {
            // controls the list of tables which are related to PatientItems via Related records table.
            // string[3] where string[] { "table name", "pri key name", "table description field" } 
            // NOTE: table description field can be column or literal string,
            //       i.e, "Toxicities.ToxName" for Field or "'Literal Description'" for any literal description
            List<string[]> tablePriKeyDescField = new List<string[]> 
            { 
                new string[] { "Toxicities", "ToxicityId", "ToxName" },
                new string[] { "Surveys", "SurveyId", "SurveyType" },
                new string[] { "LabTests", "LabTestId", "LabTest" },
                new string[] { "Diagnostics", "DiagnosticId", "DxType" },
                new string[] { "Encounters", "EncounterId", "EncChiefComplaint" },
                new string[] { "Actions", "ActionId", "ActionItem" }
            };
            string tableDeviationsSQLFormat =
        @"
        SELECT
	        t.ProtocolId,
	        t.ProtocolSchemaId,
	        pps.PatientId,
	        pi.PatientSchemaId,
	        pi.PatientItemId,
	        pi.Status,
	        pi.ScheduledDate,
	        pi.FirstAnticipatedDate,
	        pi.LastAnticipatedDate,
	        t.TimelineId,
	        ISNULL({0}.{2},'Unplanned') as ItemDescription,
	        DestTableName AS DeviationTable,
	        DestPrimaryKey as DeviationKey
        FROM RelatedRecords
        INNER JOIN ProtocolMgr_PatientItems pi
	        ON pi.PatientItemId = SrcPrimaryKey
        INNER JOIN {0}
	        ON RelatedRecords.DestPrimaryKey = {0}.{1}
        LEFT OUTER JOIN
        (
	        SELECT
		        pv.ProtocolId,
		        ps.ProtocolSchemaId,
		        t.TimelineId,
		        it.ItemTimelineId
	        FROM ProtocolMgr_ItemTimeline it
	        INNER JOIN ProtocolMgr_Timeline t
		        ON it.TimelineId = t.TimelineId
	        INNER JOIN ProtocolMgr_ProtocolSchemas ps
		        ON t.ProtocolSchemaId = ps.ProtocolSchemaId
	        INNER JOIN ProtocolMgr_ProtocolVersions pv
		        ON ps.ProtocolVersionId = pv.ProtocolVersionId
        ) t
	        ON 	pi.ItemTimelineId = t.ItemTimelineId
        LEFT OUTER JOIN ProtocolMgr_PatientSchemas pps
	        ON t.ProtocolSchemaId = pps.ProtocolSchemaId
        WHERE
            pi.PatientSchemaId = @PatientSchemaId
            AND SrcSystem = 'Caisis'
            AND SrcTableName = 'ProtocolMgr_PatientItems'
            AND DestTableName = '{0}'
        ";

            // create sql for Deviations table
            string patientDeviationsSQL =
            @"
                SELECT
	                pv.ProtocolId,
	                pps.ProtocolSchemaId,
	                pps.PatientId,
	                pi.PatientSchemaId,
	                pi.PatientItemId,
	                pi.Status,
	                pi.ScheduledDate,
	                pi.FirstAnticipatedDate,
	                pi.LastAnticipatedDate,
	                t.TimelineId,
	                'Deviation' as ItemDescription,
	                'ProtocolMgr_PatientDeviations' AS DeviationTable,
	                pd.PatientDeviationId AS DeviationKey 
                FROM ProtocolMgr_PatientItems pi
                INNER JOIN ProtocolMgr_PatientDeviations pd
	                ON pi.PatientItemId = pd.PatientItemId
                INNER JOIN ProtocolMgr_PatientSchemas pps
	                ON pi.PatientSchemaId = pps.PatientSchemaId
                INNER JOIN ProtocolMgr_ProtocolSchemas ps
		                ON pps.ProtocolSchemaId = ps.ProtocolSchemaId
                INNER JOIN ProtocolMgr_ProtocolVersions pv
		                ON ps.ProtocolVersionId = pv.ProtocolVersionId
                LEFT OUTER JOIN ProtocolMgr_ItemTimeline it
	                ON 	pi.ItemTimelineId = it.ItemTimelineId
                LEFT OUTER JOIN ProtocolMgr_Timeline t
	                ON it.TimelineId = t.TimelineId
                WHERE
	                pi.PatientSchemaId = @PatientSchemaId
            ";

            // declare list of UNION tables
            List<string> deviationTableSQL = new List<string>();

            // add main deviation table
            deviationTableSQL.Add(patientDeviationsSQL);

            // add other table deviations
            IEnumerable<string> tableDeviationsSQL = from list in tablePriKeyDescField
                                                     select string.Format(tableDeviationsSQLFormat, list);
            deviationTableSQL.AddRange(tableDeviationsSQL);

            // create sql joinging list of realted records tables and deviations table
            string sql = string.Join(" UNION ALL ", deviationTableSQL.ToArray());
            SqlCommand cmd = DataAccessHelper.CreateSqlCommand(sql);
            // add parameters
            DataAccessHelper.AddIntInputParam(cmd, "ProtocolId", protocolId);
            DataAccessHelper.AddIntInputParam(cmd, "ProtocolSchemaId", schemaId);
            DataAccessHelper.AddIntInputParam(cmd, "PatientId", patientId);
            DataAccessHelper.AddIntInputParam(cmd, "PatientSchemaId", patientSchemaId);
            DataTable dt = DataAccessHelper.GetRecord(cmd).Tables[0];
            return dt;
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="PatientSchemaId"></param>
        /// <param name="ShiftDate"></param>
        /// <param name="ShiftNumberOfDays"></param>
        /// <param name="UpdatedBy"></param>
        /// <param name="UpdatedTime"></param>
        public static void SaveShiftData(int PatientSchemaId, DateTime ShiftDate, int ShiftNumberOfDays, string UpdatedBy, DateTime UpdatedTime)
        {
            SqlCommand cmd = DataAccessHelper.CreateCommand("spUpdateProtocolMgrPatientShiftInfo");

            DataAccessHelper.AddIntInputParam(cmd, "PatientSchemaId", PatientSchemaId);
            DataAccessHelper.AddDateTimeInputParam(cmd, "ShiftDate", ShiftDate);
            DataAccessHelper.AddIntInputParam(cmd, "ShiftNumberOfDays", ShiftNumberOfDays);
            DataAccessHelper.AddStringInputParam(cmd, "UpdatedBy", UpdatedBy);
            DataAccessHelper.AddDateTimeInputParam(cmd, "UpdatedTime", UpdatedTime);

            DataAccessHelper.ExecuteScalar(cmd);
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="protocolSchemaId"></param>
        /// <returns></returns>
        public static DataView GetSchemaNameInfo(int protocolSchemaId)
        {
            SqlCommand cmd = DataAccessHelper.CreateCommand("spGetProtocolMgrSchemaNameInfo");
            DataAccessHelper.AddIntInputParam(cmd, "ProtocolSchemaId", protocolSchemaId);

            DataTable dt = new DataTable();
            DataAccessHelper.GetList(cmd, dt);
            return dt.DefaultView;
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="patientItemId"></param>
        /// <returns></returns>
        public static int GetPatientIdByPatientItemId(int patientItemId)
        {
            string sql = "SELECT ProtocolMgr_PatientItems.PatientItemId, ProtocolMgr_PatientSchemas.PatientId " +
                "FROM ProtocolMgr_PatientItems INNER JOIN " +
                "ProtocolMgr_PatientSchemas ON ProtocolMgr_PatientItems.PatientSchemaId = " +
                "ProtocolMgr_PatientSchemas.PatientSchemaId " +
                "WHERE ProtocolMgr_PatientItems.PatientItemId = " + patientItemId;

            SqlCommand cmd = DataAccessHelper.CreateSqlCommand(sql);

            DataTable dt = new DataTable();
            DataAccessHelper.GetList(cmd, dt);

            return Int32.Parse(dt.Rows[0]["PatientId"].ToString());
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="patientid"></param>
        /// <param name="schemaid"></param>
        /// <returns></returns>
        public static DataTable GetProtocolMgrPatientSchemaInfo(int patientid, int schemaid)
        {
            string sql = "SELECT * FROM ProtocolMgr_PatientSchemas WHERE PatientId = ";
            sql += patientid + " AND ProtocolSchemaId = ";
            sql += schemaid;

            SqlCommand cmd = DataAccessHelper.CreateSqlCommand(sql);

            DataTable dt = new DataTable();
            DataAccessHelper.GetList(cmd, dt);

            return dt;
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="patientSchemaId"></param>
        /// <returns></returns>
        public static DataTable PopulateSummaryRepeater(int patientSchemaId)
        {
            SqlCommand cmd = DataAccessHelper.CreateCommand("spGetProtocolMgrPatientSchemaSummary");
            DataAccessHelper.AddIntInputParam(cmd, "PatientSchemaId", patientSchemaId);

            DataTable table = new DataTable();
            DataAccessHelper.GetList(cmd, table);

            return table;
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="PatientItemId"></param>
        /// <param name="DestTablePrimKey"></param>
        [Obsolete]
        public static void UpdateProtocolMgrPatientFieldsWithPKey(int PatientItemId, int DestTablePrimKey)
        {
            SqlCommand cmd = DataAccessHelper.CreateCommand("spUpdateProtocolMgrPatientFieldsWithPKey");

            DataAccessHelper.AddIntInputParam(cmd, "PatientItemId", PatientItemId);
            DataAccessHelper.AddIntInputParam(cmd, "DestTablePrimKey", DestTablePrimKey);

            DataAccessHelper.ExecuteScalar(cmd);
        }

        /// <summary>
        /// Updates PatientItemFields with entries for the specified tables and primary keys.
        /// </summary>
        /// <param name="patientItemId"></param>
        /// <param name="destTableToKeys"></param>
        /// <param name="username"></param>
        public static void UpdateProtocolMgrPatientFieldsWithPKey(int patientItemId, IDictionary<string, IEnumerable<int>> destTableToKeys, string username)
        {
            /*
            // validate running updates
            if (!destTableToKeys.Any(p => p.Value.Count() > 0))
                return;
            string templateTableName = "{0}_TableName";
            string templateParamName = "{0}_{1}_DestTablePrimKey";

            // STEP 1: insert patient item fields for grid related saves
            // STEP 2: delete inital patient item field metadata
            // STEP 3: update pri key for standard non grid base fields
            string templateSQL =
            @"

            -- create entry for grid fields for table/prikey
            INSERT INTO ProtocolMgr_PatientItemFields
                       (PatientItemId
                       ,SchemaItemFieldId
                       ,DestTablePrimKey
                       ,EnteredBy
                       ,EnteredTime)
            SELECT
                a.PatientItemId,
                b.SchemaItemFieldId,
                @{0} AS DestTablePrimKey,
                @AuditName AS EnteredBy,
                @AuditTime AS EnteredTime
            FROM ProtocolMgr_PatientItemFields a
            INNER JOIN ProtocolMgr_SchemaItemFields b
                ON a.SchemaItemFieldId = b.SchemaItemFieldId         
            WHERE
                  a.PatientItemId = @PatientItemId
                  AND b.DestTable = @{1}
                  --AND a.DestTablePrimKey IS NULL
                  AND b.FieldRowIndex = 0
                  -- verify table and key don't exist across patient schem fields
                  AND NOT EXISTS
                  (
                    SELECT
                        d.PatientItemFieldId
                    FROM ProtocolMgr_PatientItems a
                    INNER JOIN ProtocolMgr_PatientSchemas b
                        ON a.PatientSchemaId = b.PatientSchemaId
                    INNER JOIN ProtocolMgr_PatientItems c
                        ON b.PatientSchemaId = c.PatientSchemaId
                    INNER JOIN ProtocolMgr_PatientItemFields d
                        ON c.PatientItemId = d.PatientItemId
                    INNER JOIN ProtocolMgr_SchemaItemFields e
                        ON d.SchemaItemFieldId = e.SchemaItemFieldId 
                    WHERE
                        a.PatientItemId = @PatientItemId
                        AND e.DestTable = @{1}
                        AND d.DestTablePrimKey = @{0}
                    --SELECT
                       -- a.PatientItemFieldId
                    --FROM ProtocolMgr_PatientItemFields a
                    --INNER JOIN ProtocolMgr_PatientItems b
                       -- ON a.PatientItemId = b.PatientItemId
                    --INNER JOIN ProtocolMgr_PatientSchemas c
                       -- ON b.PatientSchemaId = c.PatientSchemaId
                       -- AND c.PatientSchemaId = 
                       -- (
                          --  SELECT TOP 1 b.PatientSchemaId
                          --  FROM ProtocolMgr_PatientSchemas a
                          --  INNER JOIN ProtocolMgr_PatientItems b
                             --   ON a.PatientSchemaId = b.PatientSchemaId
                          --  WHERE b.PatientItemId = @PatientItemId
                       -- )
                    --INNER JOIN ProtocolMgr_SchemaItemFields d
                    --    ON a.SchemaItemFieldId = d.SchemaItemFieldId 
                    --WHERE
                    --     d.DestTable = @{1} AND a.DestTablePrimKey = @{0}
                  )
            GROUP BY
                  a.PatientItemId,
                  b.SchemaItemFieldId,
                  b.DisplayOrder,
                  b.FieldRowIndex;

            -- cleanup entry fields from inserted grids
            --DELETE FROM ProtocolMgr_PatientItemFields
--            WHERE PatientItemFieldId IN
--            (
--                SELECT
--	                a.PatientItemFieldId
--                FROM ProtocolMgr_PatientItemFields a
--                INNER JOIN ProtocolMgr_SchemaItemFields b
--                    ON a.SchemaItemFieldId = b.SchemaItemFieldId         
--                WHERE
--	                  a.PatientItemId = @PatientItemId
--                      AND b.DestTable = @{1}
--                      AND a.DestTablePrimKey IS NULL
--                      AND b.FieldRowIndex IS NOT NULL
--            

            -- update standard data entry fields for table/prikey
            UPDATE ProtocolMgr_PatientItemFields
                SET DestTablePrimKey = @{0},
                    UpdatedBy = @AuditName,
                    UpdatedTime = @AuditTime
            FROM ProtocolMgr_PatientItemFields a
            INNER JOIN ProtocolMgr_SchemaItemFields b
                ON a.SchemaItemFieldId = b.SchemaItemFieldId           
            WHERE a.PatientItemId = @PatientItemId
                  AND b.DestTable = @{1}
                  AND a.DestTablePrimKey IS NULL
                  AND b.FieldRowIndex IS NULL;
            ";
            StringBuilder sb = new StringBuilder();
            // dynamically build update for each table/key
            foreach (var pair in destTableToKeys)
            {
                string table = pair.Key;
                string tableParam = string.Format(templateTableName, table);
                foreach (int priKey in pair.Value)
                {
                    string keyParam = string.Format(templateParamName, table, priKey);
                    string sql = string.Format(templateSQL, keyParam, tableParam);
                    sb.AppendLine(sql);
                }
            }
            // create command
            SqlCommand cmd = DataAccessHelper.CreateSqlCommand(sb.ToString());
            DataAccessHelper.AddIntInputParam(cmd, "PatientItemId", patientItemId);
            // add pri key paramaters for each table/key
            foreach (var pair in destTableToKeys)
            {
                string table = pair.Key;
                string tableParam = string.Format(templateTableName, table);
                DataAccessHelper.AddStringInputParam(cmd, tableParam, table);
                foreach (int priKey in pair.Value)
                {
                    string keyParam = string.Format(templateParamName, table, priKey);
                    DataAccessHelper.AddIntInputParam(cmd, keyParam, priKey);
                }
            }
            // set audit params
            DataAccessHelper.AddStringInputParam(cmd, "AuditName", username);
            DataAccessHelper.AddDateTimeInputParam(cmd, "AuditTime", DateTime.Now);

            // execute update
            DataAccessHelper.ExecuteScalar(cmd);
            */

            //v 2.0

            // STEP: validate running updates
            if (!destTableToKeys.Any(p => p.Value.Count() > 0))
                return;

            string TRANSACTION_TEMPLATE =
@"
DECLARE @ErrSeverity int
DECLARE @ErrMsg varchar(250)

BEGIN TRY
    BEGIN TRANSACTION
        {0}   
    COMMIT TRANSACTION
END TRY

BEGIN CATCH
    SET @ErrSeverity = ERROR_SEVERITY()
    SET @ErrMsg = ERROR_MESSAGE()
    ROLLBACK TRANSACTION
    RAISERROR (@ErrMsg, @ErrSeverity, 1)
END CATCH
";
            /* sql: get a list of existing pri keys by table */
            string FORMAT_GET_DESTKEYS =
@"
SELECT DISTINCT pif.DestTablePrimKey
FROM ProtocolMgr_PatientItemFields pif
INNER JOIN ProtocolMgr_PatientItems pi
	ON pif.PatientItemId = pi.PatientItemId
INNER JOIN ProtocolMgr_SchemaItemFields sif
	ON pif.SchemaItemFieldId = sif.SchemaItemFieldId
WHERE
	pi.PatientItemId = @PatientItemId AND sif.DestTable = @TableName AND pif.DestTablePrimKey IN ({0})
";
            /* sql: for updating column data entry */
            string GET_COLUMN_PATIENT_ITEM_FIELDS =
@"
SELECT DISTINCT	pif.PatientItemFieldId
FROM ProtocolMgr_PatientItemFields pif
INNER JOIN ProtocolMgr_PatientItems pi
	ON pif.PatientItemId = pi.PatientItemId
INNER JOIN ProtocolMgr_SchemaItemFields sif
	ON pif.SchemaItemFieldId = sif.SchemaItemFieldId
WHERE
	pi.PatientItemId = @PatientItemId
	AND
	sif.DestTable = @TableName
	AND
	sif.FieldRowIndex IS NULL
	AND
	pif.DestTablePrimKey IS NULL
";
            string FORMAT_UDPATE_COLUMN_PATIENT_ITEM_FIELD = @"UPDATE ProtocolMgr_PatientItemFields SET DestTablePrimKey = {0} , UpdatedBy=@EnteredBy, UpdatedTime=@EnteredTime WHERE PatientItemFieldId = {1}";

            /* sql: for inserting grid rows */
            string GET_GRID_SCHEMA_ITEM_FIELDS =
@"
SELECT DISTINCT	sif.SchemaItemFieldId
FROM ProtocolMgr_PatientItemFields pif
INNER JOIN ProtocolMgr_PatientItems pi
	ON pif.PatientItemId = pi.PatientItemId
INNER JOIN ProtocolMgr_SchemaItemFields sif
	ON pif.SchemaItemFieldId = sif.SchemaItemFieldId
WHERE
	pi.PatientItemId = @PatientItemId
	AND
	sif.DestTable = @TableName
	AND
	sif.FieldRowIndex = 0
";
            string FORMAT_INSERT_GRID_PATIENT_ITEM_FIELD = @"INSERT INTO ProtocolMgr_PatientItemFields(PatientItemId, SchemaItemFieldId,DestTablePrimKey,EnteredBy,EnteredTime) VALUES(@PatientItemId, {0}, {1} ,@EnteredBy, @EnteredTime)";

            // STEP: for each table, create entry for keys            
            foreach (string table in destTableToKeys.Keys)
            {
                var pri_keys = destTableToKeys[table];
                // validate
                if (pri_keys.Count() == 0)
                    continue;

                string[] pri_keys_values = pri_keys.Select(k => k.ToString()).ToArray();

                // STEP 1: query existing pri key entries, ignore found entries
                string query_existing_keys = string.Format(FORMAT_GET_DESTKEYS, string.Join(",", pri_keys_values));
                SqlCommand query_existing_keys_cmd = DataAccessHelper.CreateSqlCommand(query_existing_keys);
                DataAccessHelper.AddIntInputParam(query_existing_keys_cmd, "PatientItemId", patientItemId);
                DataAccessHelper.AddStringInputParam(query_existing_keys_cmd, "TableName", table);
                // fill
                List<int> existing_keys = ConsumeKeyFields(query_existing_keys_cmd);
                List<int> add_db_keys = pri_keys.Except(existing_keys).Distinct().ToList();

                // validation
                if (add_db_keys.Count() == 0)
                    continue;

                // STEP 2: UPDATE existing column fields
                SqlCommand query_patient_item_fields_cmd = DataAccessHelper.CreateSqlCommand(GET_COLUMN_PATIENT_ITEM_FIELDS);
                // add params
                DataAccessHelper.AddIntInputParam(query_patient_item_fields_cmd, "PatientItemId", patientItemId);
                DataAccessHelper.AddStringInputParam(query_patient_item_fields_cmd, "TableName", table);
                List<int> patient_item_field_ids = ConsumeKeyFields(query_patient_item_fields_cmd);
                if (patient_item_field_ids.Count() > 0)
                {
                    StringBuilder update_buffer = new StringBuilder();
                    foreach (int dest_pri_key in add_db_keys)
                    {
                        foreach (int patient_item_field_id in patient_item_field_ids)
                        {
                            string append_sql = string.Format(FORMAT_UDPATE_COLUMN_PATIENT_ITEM_FIELD, dest_pri_key, patient_item_field_id);
                            update_buffer.AppendLine(append_sql);
                        }
                    }
                    string update_sql = update_buffer.ToString();
                    if (!string.IsNullOrEmpty(update_sql))
                    {
                        string transactionSQL = string.Format(TRANSACTION_TEMPLATE, update_sql);
                        SqlCommand update_cmd = DataAccessHelper.CreateSqlCommand(transactionSQL);
                        DataAccessHelper.AddIntInputParam(update_cmd, "PatientItemId", patientItemId);
                        // set audit params
                        DataAccessHelper.AddStringInputParam(update_cmd, "EnteredBy", username);
                        DataAccessHelper.AddDateTimeInputParam(update_cmd, "EnteredTime", DateTime.Now);
                        // exec
                        DataAccessHelper.ExecuteScalar(update_cmd);
                    }
                }

                // STEP 3: INSERT fields for data grid rows
                SqlCommand query_found_cmd = DataAccessHelper.CreateSqlCommand(GET_GRID_SCHEMA_ITEM_FIELDS);
                // add params
                DataAccessHelper.AddIntInputParam(query_found_cmd, "PatientItemId", patientItemId);
                DataAccessHelper.AddStringInputParam(query_found_cmd, "TableName", table);
                List<int> schema_item_fields = ConsumeKeyFields(query_found_cmd);
                // INSERT: grid fields
                if (schema_item_fields.Count() > 0)
                {
                    StringBuilder insert_buffer = new StringBuilder();
                    // check existing
                    // for each record: insert value for each field
                    foreach (int dest_pri_key in add_db_keys)
                    {
                        foreach (int schema_item_field_id in schema_item_fields)
                        {
                            string append_sql = string.Format(FORMAT_INSERT_GRID_PATIENT_ITEM_FIELD, schema_item_field_id, dest_pri_key);
                            insert_buffer.AppendLine(append_sql);
                        }
                    }
                    string insert_sql = insert_buffer.ToString();
                    if (!string.IsNullOrEmpty(insert_sql))
                    {
                        string transactionSQL = string.Format(TRANSACTION_TEMPLATE, insert_sql);
                        SqlCommand insert_cmd = DataAccessHelper.CreateSqlCommand(transactionSQL);
                        DataAccessHelper.AddIntInputParam(insert_cmd, "PatientItemId", patientItemId);
                        // set audit params
                        DataAccessHelper.AddStringInputParam(insert_cmd, "EnteredBy", username);
                        DataAccessHelper.AddDateTimeInputParam(insert_cmd, "EnteredTime", DateTime.Now);
                        // exec
                        DataAccessHelper.ExecuteScalar(insert_cmd);
                    }
                }

            }
        }

        public static void ClearProtocolMgrPatientFieldsWithPKey(int patientItemId, IDictionary<string, IEnumerable<int>> destTableToKeys, string username)
        {
            string sqlTemplate =
@"
UPDATE a
	SET DestTablePrimKey = NULL,
        UpdatedBy = @UpdatedBy,
        UpdatedTime = @UpdatedTime
FROM ProtocolMgr_PatientItemFields a
INNER JOIN ProtocolMgr_SchemaItemFields b
	ON a.SchemaItemFieldId = b.SchemaItemFieldId
WHERE
	a.PatientItemId = @PatientItemId
	AND b.DestTable = @DestTable
	AND a.DestTablePrimKey IN({0})
";
            foreach (string table in destTableToKeys.Keys)
            {
                string[] keys = destTableToKeys[table].Select(k => k + "").ToArray();
                string sql = string.Format(sqlTemplate, string.Join(",", keys));

                SqlCommand cmd = DataAccessHelper.CreateSqlCommand(sql);
                // add params
                DataAccessHelper.AddIntInputParam(cmd, "PatientItemId", patientItemId);
                DataAccessHelper.AddStringInputParam(cmd, "DestTable", table);
                DataAccessHelper.AddStringInputParam(cmd, "UpdatedBy", username);
                DataAccessHelper.AddDateTimeInputParam(cmd, "UpdatedTime", DateTime.Now);
                DataAccessHelper.ExecuteScalar(cmd);
            }
        }

        /// <summary>
        /// For the given command, return a list of ints based on first column values
        /// </summary>
        /// <param name="cmd"></param>
        /// <returns></returns>
        private static List<int> ConsumeKeyFields(SqlCommand cmd)
        {
            int priKeyIndex = 0;
            return Connectivity.GetPrimitiveValues<int>(cmd, priKeyIndex);
        }

        /// <summary>
        /// Get the medical therapy record associated with a previous medical therapy administration, given the patient item.
        /// </summary>
        /// <param name="patientItemId"></param>
        /// <returns></returns>
        public static int? GetPreviousMedTxAdministrationParentId(int patientItemId)
        {
            #region sql
            string sql =
                @"SELECT TOP 1
	                    F.DestTablePrimKey, T.DisplayColumnPosition

                    FROM
	                    ProtocolMgr_PatientItems PM_PI
		                    INNER JOIN ProtocolMgr_PatientItemFields F
			                    ON PM_PI.PatientItemId = F.PatientItemId
		                    INNER JOIN ProtocolMgr_ItemTimeline IT
			                    ON PM_PI.ItemTimelineId = IT.ItemTimelineId
		                    INNER JOIN ProtocolMgr_Timeline T
			                    ON IT.TimelineId = T.TimelineId
		                    INNER JOIN ProtocolMgr_PatientSchemas
			                    ON PM_PI.PatientSchemaId = ProtocolMgr_PatientSchemas.PatientSchemaId
		                    INNER JOIN ProtocolMgr_PatientItems PI2
			                    ON ProtocolMgr_PatientSchemas.PatientSchemaId = PI2.PatientSchemaId
			                    AND PI2.PatientItemId = @PatientItemId
		                    INNER JOIN ProtocolMgr_ItemTimeline IT2
			                    ON IT2.ItemTimelineId = PI2.ItemTimelineId
		                    INNER JOIN ProtocolMgr_SchemaItems SI
			                    ON IT2.SchemaItemId = SI.SchemaItemId
                    WHERE
	                    DestTablePrimKey IS NOT NULL
					
	                    AND

	                    EXISTS (
		                    SELECT ProtocolMgr_SchemaItemFields.SchemaItemFieldId
		                    FROM 
			                    ProtocolMgr_SchemaItemFields
			                    INNER JOIN ProtocolMgr_SchemaItems 
				                    ON ProtocolMgr_SchemaItemFields.SchemaItemId = ProtocolMgr_SchemaItems.SchemaItemId
			                    INNER JOIN ProtocolMgr_ItemTimeline
				                    ON ProtocolMgr_SchemaItems.SchemaItemId = ProtocolMgr_ItemTimeline.SchemaItemId
				                    AND ProtocolMgr_ItemTimeline.ItemTimelineId = PM_PI.ItemTimelineId				
		                    WHERE 
			                    ProtocolMgr_SchemaItemFields.DestTable = 'MedicalTherapy'
			                    AND ProtocolMgr_SchemaItems.ItemDescription = SI.ItemDescription
	                    )

	                    AND
						
	                    EXISTS (
		                    SELECT ProtocolMgr_SchemaItemFields.SchemaItemFieldId
		                    FROM 
			                    ProtocolMgr_SchemaItemFields
			                    INNER JOIN ProtocolMgr_SchemaItems 
				                    ON ProtocolMgr_SchemaItemFields.SchemaItemId = ProtocolMgr_SchemaItems.SchemaItemId
			                    INNER JOIN ProtocolMgr_ItemTimeline
				                    ON ProtocolMgr_SchemaItems.SchemaItemId = ProtocolMgr_ItemTimeline.SchemaItemId
				                    AND ProtocolMgr_ItemTimeline.ItemTimelineId = PM_PI.ItemTimelineId
		                    WHERE 
			                    ProtocolMgr_SchemaItemFields.DestTable = 'MedTxAdministration'
	                    )

                    ORDER BY T.DisplayColumnPosition, F.PatientItemId, F.PatientItemFieldId";
            #endregion

            SqlCommand cmd = DataAccessHelper.CreateSqlCommand(sql);
            cmd.Parameters.AddWithValue("@PatientItemId", patientItemId);

            int? medicalTherapyId = null;

            Connectivity.ConsumeRecord(
                cmd,
                record =>
                {
                    int pkFieldIndex = record.GetOrdinal("DestTablePrimKey");

                    if (!record.IsDBNull(pkFieldIndex))
                        medicalTherapyId = record.GetInt32(pkFieldIndex);

                    return false;
                });

            return medicalTherapyId;
        }

        /// <summary>
        /// Delete the Patient from the treatment arm.
        /// </summary>
        /// <param name="patientSchemaId">The patient schema id representing the patient on the treatment arm.</param>
        public static void DeletePatientFromSchema(int patientSchemaId)
        {
            string sql =
            @"
            --Check and remove deviations
            DELETE FROM ProtocolMgr_PatientDeviations
            WHERE PatientDeviationId IN
            (
                SELECT
                    PatientDeviationId
                FROM ProtocolMgr_PatientItems a
                INNER JOIN ProtocolMgr_PatientSchemas b
                    ON a.PatientSchemaId = @PatientSchemaId
                INNER JOIN ProtocolMgr_PatientDeviations c
                    ON a.PatientItemId = c.PatientItemId
            )

            --Check and remove the all the fields for visits for a particular item
            DELETE FROM ProtocolMgr_PatientItemFields
            WHERE PatientItemFieldId IN
            (
                SELECT PatientItemFieldId
                FROM ProtocolMgr_PatientItems a
                INNER JOIN ProtocolMgr_PatientSchemas b
                    ON a.PatientSchemaId = @PatientSchemaId
                INNER JOIN ProtocolMgr_PatientItemFields c
                    ON a.PatientItemId = c.PatientItemId
            )

            --Check and remove the visits for each patient on an arm.
            DELETE FROM ProtocolMgr_PatientItems
            WHERE PatientItemId IN
            (
                SELECT PatientItemId
                FROM ProtocolMgr_PatientItems a
                INNER JOIN ProtocolMgr_PatientSchemas b
                    ON a.PatientSchemaId = @PatientSchemaId
            )

            --Check and remove the patients that were scheduled for this arm of a protocol
            DELETE FROM ProtocolMgr_PatientSchemas
            WHERE PatientSchemaId = @PatientSchemaId
            ";
            SqlCommand cmd = DataAccessHelper.CreateSqlCommand(sql);
            DataAccessHelper.AddIntInputParam(cmd, "PatientSchemaId", patientSchemaId);
            DataAccessHelper.GetRecord(cmd);
        }


        #region DEPENDENT EVENTS

        /// <summary>
        /// Return a list of visits which are contingent on a patient status.
        /// </summary>
        /// <param name="patientSchemaId"></param>
        /// <returns></returns>
        public static DataTable GetCalculatedDependentPatientItemsByStatus(int patientSchemaId)
        {
            string sql = GetComputedDependentItemTimelineByStatusSQL(patientSchemaId, true);
            SqlCommand cmd = DataAccessHelper.CreateSqlCommand(sql);
            DataAccessHelper.AddIntInputParam(cmd, "PatientSchemaId", patientSchemaId);
            return DataAccessHelper.GetRecord(cmd).Tables[0];
        }

        /// <summary>
        /// For the specified Patient Item, if performed, schedule items which are depdent on it.
        /// </summary>
        /// <param name="patientItemId">The patient item on which visits are dependent.</param>
        /// <param name="username">The username of the User executing the scheduling.</param>
        public static void ScheduleDependentPatientItems(int patientItemId, string username)
        {
            // get a list of dependent items  which haven't been scheduled with calcualted dates
            string computedDependentSQL = GetComputedDependentItemTimelineSQL(patientItemId, true);
            // update items
            ScheduleDependentPatientItems(computedDependentSQL, "PatientItemId", patientItemId, username);
        }

        /// <summary>
        /// Schedule Patient Items which are to be scheduled on specified Patient status.
        /// </summary>
        /// <param name="patientSchemaId"></param>
        /// <param name="username">The username of the User executing the scheduling.</param>
        public static void ScheduleDependentPatientItemsByStatus(int patientSchemaId, string username)
        {
            // get a list of dependent items for patient schema which haven't been scheduled with calcualted dates
            string sql = GetComputedDependentItemTimelineByStatusSQL(patientSchemaId, true);
            // update items
            ScheduleDependentPatientItems(sql, "PatientSchemaId", patientSchemaId, username);
        }

        public static void ScheduleAllDependentPatientItems(int patientSchemaId, string username)
        {
            // fix by dependent status
            string sql = GetComputedDependentItemTimelineByStatusSQL(patientSchemaId, false);
            ScheduleDependentPatientItems(sql, "PatientSchemaId", patientSchemaId, username);
            // fix by dependent items
            var cmd = Caisis.DataAccess.DataAccessHelper.CreateSqlCommand("SELECT DISTINCT PatientItemId FROM ProtocolMgr_PatientItems WHERE PatientSchemaId = @PatientSchemaId");
            DataAccess.DataAccessHelper.AddIntInputParam(cmd, "PatientSchemaId", patientSchemaId);
            var table = Caisis.DataAccess.DataAccessHelper.GetRecord(cmd).Tables[0];
            IEnumerable<int> patientItemIds = table.AsEnumerable().Select(r => (int)r[0]);
            foreach (int patientItemId in patientItemIds)
            {
                // get a list of dependent items  which haven't been scheduled with calcualted dates
                string computedDependentSQL = GetComputedDependentItemTimelineSQL(patientItemId, false);
                // update items
                ScheduleDependentPatientItems(computedDependentSQL, "PatientItemId", patientItemId, username);
            }
        }

        /// <summary>
        /// For the given Protocol Schema, schedule items which are not scheduled
        /// </summary>
        /// <param name="protocolSchemaId"></param>
        /// <param name="username"></param>
        public static void ScheduleNewPatientItems(int protocolSchemaId, string username)
        {
            //return;
            string scedulePatientsSQL =
                @"
-- DECLARE ITERATOR
DECLARE @RowsToProcess  int
DECLARE @CurrentRow     int

-- LOCALS
DECLARE @PatientSchemaId int
DECLARE @SchemaItemId int
DECLARE @TimelineId int
DECLARE @ItemTimelineId int
DECLARE @OnStudyDate datetime
DECLARE @_PatientItemId int

DECLARE @Preview int
SET @Preview = 0
		
DECLARE @_Temp TABLE
(
	ProtocolSchemaId int,
	PatientSchemaId int,
	TimelineId int,
	ItemTimelineId int,
	SchemaItemId int,	
	SchemaItemFieldId int,
	PatientItemId int,
	OnStudyDate datetime
)  
INSERT INTO @_Temp
SELECT
	ps.ProtocolSchemaId,
	ps.PatientSchemaId,
	t.TimelineId,
	it.ItemTimelineId,
	si.SchemaItemId,
	sif.SchemaItemFieldId,
	pi.PatientItemId,
	p.OnStudyDate
FROM ProtocolMgr_SchemaItems si
INNER JOIN ProtocolMgr_SchemaItemFields sif
	ON si.SchemaItemId = sif.SchemaItemId
INNER JOIN ProtocolMgr_PatientSchemas ps
	ON si.ProtocolSchemaId = ps.ProtocolSchemaId
INNER JOIN ProtocolMgr_ItemTimeline it
	ON si.SchemaItemId = it.SchemaItemId
INNER JOIN ProtocolMgr_Timeline t
	ON it.TimelineId = t.TimelineId
LEFT OUTER JOIN ProtocolMgr_PatientItems pi
	ON it.ItemTimelineId = pi.ItemTimelineId
	AND ps.PatientSchemaId = pi.PatientSchemaId
LEFT OUTER JOIN ProtocolMgr_PatientItemFields pif
	ON pi.PatientItemId = pif.PatientItemId
	AND sif.SchemaItemFieldId = pif.SchemaItemFieldId
-- get OnStudyDate used as anchor
INNER JOIN
(
	SELECT
		a.PatientSchemaId,
		MIN(e.PtProtocolStatusDate) AS OnStudyDate
	FROM ProtocolMgr_PatientSchemas a
	INNER JOIN ProtocolMgr_ProtocolSchemas b
		ON a.ProtocolSchemaId = b.ProtocolSchemaId
	INNER JOIN ProtocolMgr_ProtocolVersions c
		ON b.ProtocolVersionId = c.ProtocolVersionId
	INNER JOIN PatientProtocols d
		ON c.ProtocolId = d.ProtocolId
		AND a.PatientId = d.PatientId
	INNER JOIN PatientProtocolStatus e
		ON d.PatientProtocolId = e.PatientProtocolId
	WHERE
		a.ProtocolSchemaId = @ProtocolSchemaId
		AND e.PtProtocolStatus = 'On Study'
		AND e.PtProtocolStatusDate IS NOT NULL
	GROUP BY
		a.PatientSchemaId
) p
ON
	ps.PatientSchemaId = p.PatientSchemaId 
WHERE
	si.ProtocolSchemaId = @ProtocolSchemaId
	AND pi.PatientItemId IS NULL
	AND p.OnStudyDate IS NOT NULL

DECLARE @_Loop TABLE(RowID int not null primary key identity(1,1), TimelineId int, SchemaItemId int, ItemTimelineId int, PatientSchemaId int, OnStudyDate datetime)
INSERT INTO @_Loop
SELECT DISTINCT
	TimelineId, SchemaItemId, ItemTimelineId, PatientSchemaId, OnStudyDate
FROM @_Temp

-- GLOBAL Row_Count
SET @RowsToProcess=@@ROWCOUNT
			
-- PREVIEW
IF @Preview = 1
	BEGIN
		SELECT * FROM @_Temp
		SELECT * FROM @_Loop
		SELECT @RowsToProcess
	END
-- LIVE
IF @Preview = 0
	BEGIN
		-- START ITERATION

		SET @CurrentRow = 0			

		-- START WHILE
		WHILE @CurrentRow < @RowsToProcess
			-- START ITERATION
			BEGIN
			-- SET ITERATOR
				SET @CurrentRow=@CurrentRow+1		
				SET @PatientSchemaId = NULL
				SET @SchemaItemId = NULL
				SET @TimelineId = NULL
				SET @ItemTimelineId = NULL
				SET @OnStudyDate = NULL
				
				SET @_PatientItemId = NULL
				-- SET LOCALS
				SELECT 
					@PatientSchemaId = PatientSchemaId,
					@SchemaItemId = SchemaItemId,
					@TimelineId = TimelineId,
					@ItemTimelineId = ItemTimelineId,
					@OnStudyDate = OnStudyDate
				FROM @_Loop
				WHERE RowID=@CurrentRow
						
				-- STEP 1: CREATE ProtocolMgr_PatientItems	
                INSERT INTO ProtocolMgr_PatientItems
	                (ItemTimelineId, PatientSchemaId, ScheduledDate, FirstAnticipatedDate, LastAnticipatedDate, Status, EnteredBy, EnteredTime)				
                SELECT TOP 1
	                @ItemTimelineId,
	                @PatientSchemaId,
	                DATEADD(DAY, 0 - [shift_buffer_plus], LastAnticipatedDate) AS ScheduledDate,
	                FirstAnticipatedDate,
	                LastAnticipatedDate,
                    'Anticipated' AS [Status],
	                @EnteredBy,
	                @EnteredTime
                FROM
                (
	                SELECT
		                BufferNumberofUnitsPlus,
		                DATEADD(DAY, (NumberOfUnits * shiftdays) - (BufferNumberOfUnitsMinus * shift_buffer) + [shift_offset], @OnStudyDate) AS FirstAnticipatedDate,
		                DATEADD(DAY, (NumberOfUnits * shiftdays) + (BufferNumberofUnitsPlus * [shift_buffer]) + [shift_offset], @OnStudyDate) AS LastAnticipatedDate,
		                BufferNumberofUnitsPlus * [shift_buffer] AS [shift_buffer_plus]
	                FROM
	                (
		                SELECT
			                t.DisplayUnitName,
			                t.NumberOfUnits,
			                t.BufferUnitName,
			                t.BufferNumberOfUnitsPlus,
			                t.BufferNumberOfUnitsMinus,
			                CASE DisplayUnitName
				                WHEN 'Day' THEN 1
				                WHEN 'Week' THEN 7
				                WHEN 'Month' THEN 28
				                ELSE 0
			                END AS [shiftdays], 
			                CASE BufferUnitName
				                WHEN 'Day' THEN 1
				                WHEN 'Week' THEN 7
				                WHEN 'Month' THEN 28
				                ELSE 0
			                END	AS [shift_buffer],
			                CASE DisplayUnitName WHEN 'Day' THEN -1 ELSE 0 END AS [shift_offset]
		                FROM @_Temp it
		                INNER JOIN ProtocolMgr_Timeline t
			                ON it.TimelineId = t.TimelineId
		                WHERE
			                it.TimelineId = @TimelineId
	                ) a
                ) a					
					
				SET @_PatientItemId = SCOPE_IDENTITY()
				
				-- STEP 2: CREATE ProtocolMgr_PatientItemFields
				INSERT INTO ProtocolMgr_PatientItemFields
					(PatientItemId, SchemaItemFieldId, EnteredBy, EnteredTime)
				SELECT
					@_PatientItemId,
					SchemaItemFieldId,
					@EnteredBy,
					@EnteredTime
				FROM @_Temp
				WHERE
					SchemaItemId = @SchemaItemId
					 
			END			
			-- END ITERATION
		-- END WHILE
END
";

            // create update command
            SqlCommand cmd = DataAccessHelper.CreateSqlCommand(scedulePatientsSQL);
            // add params
            DataAccessHelper.AddIntInputParam(cmd, "ProtocolSchemaId", protocolSchemaId);
            DataAccessHelper.AddStringInputParam(cmd, "EnteredBy", username);
            DataAccessHelper.AddDateTimeInputParam(cmd, "EnteredTime", DateTime.Now);

            // execute update
            DataAccessHelper.ExecuteScalar(cmd);
        }

        /// <summary>
        /// Helper method to update patient item records
        /// </summary>
        /// <param name="selectSQL"></param>
        /// <param name="keyName"></param>
        /// <param name="keyValue"></param>
        /// <param name="username">The username of the User executing the scheduling.</param>
        private static void ScheduleDependentPatientItems(string selectSQL, string keyName, int keyValue, string username)
        {
            string auditUserName = string.Format("{0} (scheduler)", username);
            string baseSQL =
            @"
            UPDATE dependent_items_source
            SET
	            -- set scheduling data
	            dependent_items_source.ScheduledDate = CASE WHEN dependent_items_source.[Status] IS NOT NULL AND dependent_items_source.[Status] NOT IN ('Anticipated') THEN dependent_items_source.ScheduledDate ELSE dependent_items_computed.ScheduledDate END,
	            dependent_items_source.FirstAnticipatedDate = dependent_items_computed.FirstAnticipatedDate,
	            dependent_items_source.LastAnticipatedDate = dependent_items_computed.LastAnticipatedDate,
	            -- mark items as scheduled anticipated
	            dependent_items_source.Status = ISNULL(dependent_items_source.Status, 'Anticipated'),
                -- mark audit fields
                dependent_items_source.UpdatedBy = @UpdatedBy,
                dependent_items_source.UpdatedTime = @UpdatedTime
            FROM ProtocolMgr_PatientItems dependent_items_source
            -- the computed dependent items
            INNER JOIN ({0}) dependent_items_computed
            -- only update dependent items
            ON dependent_items_source.PatientItemId = dependent_items_computed.PatientItemId
            ";

            // build full update statement on select list
            string fullSQL = string.Format(baseSQL, selectSQL);
            // create update command
            SqlCommand cmd = DataAccessHelper.CreateSqlCommand(fullSQL);
            // add key field
            DataAccessHelper.AddIntInputParam(cmd, keyName, keyValue);
            DataAccessHelper.AddStringInputParam(cmd, "UpdatedBy", auditUserName);
            DataAccessHelper.AddDateTimeInputParam(cmd, "UpdatedTime", DateTime.Now);
            // execute update
            DataAccessHelper.ExecuteScalar(cmd);
        }

        /// <summary>
        /// For the given schema, unschedule visits which are scheduled but no status exits for dependency.
        /// </summary>
        /// <param name="username"></param>
        /// <param name="paramName">ProtocolSchemaId or PatientSchemaId</param>
        /// <param name="paramValue"></param>
        public static void FixDependentItemTimelineByStatuses(string username, string paramName, int paramValue)
        {
            string[] paramNames = new string[] { "ProtocolSchemaId", "PatientSchemaId" };
            if (!paramNames.Contains(paramName))
                throw new Exception("Invalid param @" + paramName);
            string sqlFormat =
@"
-- create status listing
DECLARE @PatientStatuses TABLE(DependentStatus varchar(25))
INSERT INTO @PatientStatuses VALUES('Failed Screening')
INSERT INTO @PatientStatuses VALUES('Passed Screening')
INSERT INTO @PatientStatuses VALUES('Consented')
INSERT INTO @PatientStatuses VALUES('Ineligible')
INSERT INTO @PatientStatuses VALUES('Eligible')
INSERT INTO @PatientStatuses VALUES('Registration Pending')
INSERT INTO @PatientStatuses VALUES('Registered')
INSERT INTO @PatientStatuses VALUES('On Study')
INSERT INTO @PatientStatuses VALUES('Off Treatment')
INSERT INTO @PatientStatuses VALUES('Off Study')

UPDATE a
	SET
		ScheduledDate = NULL,
		FirstAnticipatedDate = NULL,
		LastAnticipatedDate = NULL,
        UpdatedBy = @UpdatedBy,
        UpdatedTime = @UpdatedTime
FROM ProtocolMgr_PatientItems a
INNER JOIN
(
	SELECT
		ppi.PatientItemId
	FROM ProtocolMgr_PatientSchemas pps
	INNER JOIN ProtocolMgr_ProtocolSchemas ps
		ON ps.ProtocolSchemaId = pps.ProtocolSchemaId
	INNER JOIN ProtocolMgr_ProtocolVersions pv
		ON pv.ProtocolVersionId = ps.ProtocolVersionId
	INNER JOIN PatientProtocols pp
		ON pp.PatientId = pps.PatientId AND pp.ProtocolId = pv.ProtocolId
	-- get timeline items which are marked as Dependent on status
	INNER JOIN 
	(
        SELECT
			a.ProtocolSchemaId,
			a.TimelineId,
			c.DependentStatus
		FROM ProtocolMgr_Timeline a
		INNER JOIN ProtocolMgr_PatientSchemas b
			ON a.ProtocolSchemaId = b.ProtocolSchemaId
		INNER JOIN @PatientStatuses c
			ON CHARINDEX('Dependent ' + c.DependentStatus, a.ItemIntervalType) > 0
        -- restrict to applicable schema/patient schema
        WHERE
            b.{0} = @{0}
	)
	 pt
		ON pt.ProtocolSchemaId = pps.ProtocolSchemaId
	-- check if status exists
	LEFT OUTER JOIN PatientProtocolStatus pStatus
		ON pStatus.PatientProtocolId = pp.PatientProtocolId
		AND pt.DependentStatus = pStatus.PtProtocolStatus
	INNER JOIN ProtocolMgr_ItemTimeline pit
		ON pit.TimelineId = pt.TimelineId
	INNER JOIN ProtocolMgr_PatientItems ppi
		ON ppi.ItemTimelineId = pit.ItemTimelineId AND pps.PatientSchemaId = ppi.PatientSchemaId
	WHERE
		pps.{0} = @{0}
		-- dependent visits which don't have a status
		AND	pStatus.PatientProtocolStatusId IS NULL
		-- dates which are scheduled
		AND (ppi.ScheduledDate IS NOT NULL OR ppi.FirstAnticipatedDate IS NOT NULL OR ppi.LastAnticipatedDate IS NOT NULL)
		-- exclude performed visits
		AND	(ppi.Status IS NULL OR ppi.Status NOT IN ('Performed','Completed'))
 ) b
	ON a.PatientItemId = b.PatientItemId
";
            SqlCommand cmd = DataAccessHelper.CreateSqlCommand(string.Format(sqlFormat, paramName));
            DataAccessHelper.AddIntInputParam(cmd, paramName, paramValue);
            string auditUserName = string.Format("{0} (scheduler)", username);
            DataAccessHelper.AddStringInputParam(cmd, "UpdatedBy", auditUserName);
            DataAccessHelper.AddDateTimeInputParam(cmd, "UpdatedTime", DateTime.Now);

            DataAccessHelper.ExecuteScalar(cmd);
        }

        /// <summary>
        /// Returns the SQL which will return a normalilzed list of Patient Items.
        /// This will return the depdendent items with their calcualted schedule dates.
        /// </summary>
        /// <param name="patientItemId"></param>
        /// <returns></returns>
        public static string GetComputedTimelineSQL(int? patientItemId)
        {
            string sql =
            @"
            /* idea:
                    Return PatientItems with ScheduledDate, FirstAnticipatedDate and LastAnticipatedDate
                    estimated for dependent items which have yet to be scheduled.
                    Also, exclude items which don't have a calculate date, i.e., dependent on patient status.
                    
                    SELECT
                      *
                    FROM ProtocolMgr_PatientItems 
            */
            -- get all non dependent items
            SELECT
            *
            FROM
            (
                 SELECT
                      PatientItemId
                      ,ItemTimelineId
                      ,PatientSchemaId
                      ,ScheduledDate
                      ,FirstAnticipatedDate
                      ,LastAnticipatedDate
                      ,[Status]
                      ,EnteredBy
                      ,EnteredTime
                      ,UpdatedBy
                      ,UpdatedTime
                 FROM {0}
                 -- exclude items which are dependent
                 WHERE PatientItemId NOT IN
                    (SELECT
                        PatientItemId
                     FROM ({1}) a)

                 UNION ALL

                 -- all all dependent items
                 {1}
            ) a
            --remove items from list which don't have valid schedule dates
            WHERE
                ScheduledDate IS NOT NULL
                AND FirstAnticipatedDate IS NOT NULL
                AND LastAnticipatedDate IS NOT NULL
            ";
            string restrictToSiblingPatientItemsSQL = string.Empty;

            if (patientItemId.HasValue)
            {
                // restrict to only patient items part of this PatientSchema
                restrictToSiblingPatientItemsSQL =
                    @"
                    (SELECT
                        *
                    FROM ProtocolMgr_PatientItems
                    WHERE
	                    PatientSchemaId IN 
		                    (SELECT PatientSchemaId 
		                     FROM ProtocolMgr_PatientItems
		                     WHERE PatientItemId = " + patientItemId.Value + ") ) ProtocolMgr_PatientItems ";
            }
            // otherwise return all records
            else
            {
                restrictToSiblingPatientItemsSQL = "ProtocolMgr_PatientItems";
            }

            string computedDependentSQL = GetComputedDependentItemTimelineSQL(patientItemId, true);
            string fullSQL = string.Format(sql, restrictToSiblingPatientItemsSQL, computedDependentSQL);
            return fullSQL;
        }

        /// <summary>
        /// Returns the SQL which will return ALL dependent PatientItems which have yet to be scheduled.
        /// Return all columns from ProtocolMgr_PatientItems with ScheduledDate,
        /// FirstAnticipatedDate and LastAnticipatedDate calculated on the ScheduledDate of the source visit item.
        /// </summary>
        /// <param name="patientItemId"></param>
        /// <param name="restrictToUnschedled"></param>
        /// <returns></returns>
        public static string GetComputedDependentItemTimelineSQL(int? patientItemId, bool restrictToUnschedled)
        {
            string sql =
            @"
            -- return all ProtocolMgr_PatientItems columns in order
            SELECT
	            -- the dependent item to be update
	            PatientItemId,
	            ItemTimelineId,
	            PatientSchemaId,
	            -- the computed scheduled date
	            DATEADD(DAY, 0 - (BufferNumberofUnitsPlus * BufferMultiplier), LastAnticipatedDate)
		            AS ScheduledDate,
	            -- the computed first anticipated date
	            FirstAnticipatedDate,
	            -- the computed last anticipated date
	            LastAnticipatedDate,
	            [Status],
	            EnteredBy,
	            EnteredTime,
	            UpdatedBy,
	            UpdatedTime
            FROM
            ( 	 
	            SELECT
		            -- the primary key of the dependent visit item
		            dependent_items_computed.PatientItemId,
		            dependent_items_computed.ItemTimelineId,
		            dependent_items_computed.PatientSchemaId,
		            dependent_items_computed.ScheduledDate,
		            --dbo.fnProtocolMgrAnticipatedDate(source_items.ScheduledDate,DisplayUnitName,NumberOfUnits,BufferUnitName,BufferNumberOfUnitsPlus,BufferNumberOfUnitsMinus,1)
		            {1}	AS FirstAnticipatedDate,
		            --dbo.fnProtocolMgrAnticipatedDate(source_items.ScheduledDate,DisplayUnitName,NumberOfUnits,BufferUnitName,BufferNumberOfUnitsPlus,BufferNumberOfUnitsMinus,0)
		            {2}	AS LastAnticipatedDate,
		            CASE
			            WHEN BufferUnitName LIKE 'Day%' THEN 1
			            WHEN BufferUnitName LIKE 'Week%' THEN 7
			            WHEN BufferUnitName LIKE 'Month%' THEN 28
		            END 
			            AS BufferMultiplier,
		            dependent_items_computed.Status,
		            dependent_items_computed.BufferNumberOfUnitsPlus,
		            dependent_items_computed.EnteredBy,
		            dependent_items_computed.EnteredTime,
		            dependent_items_computed.UpdatedBy,
		            dependent_items_computed.UpdatedTime
	            -- join to item timeline to get this visit item's source item timeline
	            FROM ProtocolMgr_PatientItems source_items
	            INNER JOIN ProtocolMgr_ItemTimeline pit
		            ON pit.ItemTimelineId = source_items.ItemTimelineId
	            -- join to related records: restrict to itme timelines which are dependent on this visit's item
	            INNER JOIN RelatedRecords rr
		            ON  rr.SrcTableName = 'ProtocolMgr_Timeline'
			            AND rr.DestTableName = 'ProtocolMgr_ItemTimeline'
			            AND rr.DestPrimaryKey = pit.ItemTimelineId
			            AND rr.SrcSystem = 'Caisis'
	            -- a list of all patient items in schema which haven't been scheduled
	            INNER JOIN 
	            (
		            SELECT
			            ppi.*,
			            pit.TimelineId,
			            DisplayUnitName,
			            NumberOfUnits,
			            BufferUnitName,
			            BufferNumberOfUnitsPlus,
			            BufferNumberOfUnitsMinus,
			            pt.VisitLabel AS DependentVisit,
			            psi.ItemDescription AS DependentItem		
		            FROM ProtocolMgr_Timeline pt
		            INNER JOIN ProtocolMgr_ItemTimeline pit
			            ON pit.TimelineId = pt.TimelineId
		            INNER JOIN ProtocolMgr_PatientItems ppi
			            ON ppi.ItemTimelineId = pit.ItemTimelineId
		            INNER JOIN ProtocolMgr_SchemaItems psi
			            ON psi.SchemaItemId = pit.SchemaItemId
		            -- restrict to only items without scheduling info
		            {3}
	            ) dependent_items_computed
	            -- restrict to those items which are dependent on this vist and which are part of same patient schema
	            ON	dependent_items_computed.TimelineId = rr.SrcPrimaryKey
		            -- restrict to items which are siblings of this visit's item
		            AND dependent_items_computed.PatientSchemaId = source_items.PatientSchemaId
                {0}	 
            ) dependent_items_computed
            ";
            string restrictBySourcePatientItemSQL = string.Empty;
            string restrictToUnschedledSQL = string.Empty;

            if (patientItemId.HasValue)
            {
                restrictBySourcePatientItemSQL =
                @"
                WHERE
	                -- only for current visit item and verify it has been scheduled
	                source_items.PatientItemId = @PatientItemId AND source_items.ScheduledDate IS NOT NULL
	                -- ignore this visit item in dependent list
	                AND dependent_items_computed.PatientItemId != @PatientItemId	
                ";

            }
            if (restrictToUnschedled)
            {
                restrictToUnschedledSQL =
                @"
                WHERE
                    ppi.FirstAnticipatedDate IS NULL
                    AND ppi.LastAnticipatedDate IS NULL
                    AND ppi.ScheduledDate IS NULL
                ";
            }
            string getFirstDate = GetAnticipatedDateSQL(true, "source_items.ScheduledDate");
            string getLastDate = GetAnticipatedDateSQL(false, "source_items.ScheduledDate");
            string fullSQL = string.Format(sql, restrictBySourcePatientItemSQL, getFirstDate, getLastDate, restrictToUnschedledSQL);
            return fullSQL;
        }

        /// <summary>
        /// Returns the SQL which will return the calcualted firts, last and scheduled date for patient schema
        /// </summary>
        /// <param name="patientSchemaId"></param>
        /// <param name="restrictToUnschedled"></param>
        /// <returns></returns>
        public static string GetComputedDependentItemTimelineByStatusSQL(int? patientSchemaId, bool restrictToUnschedled)
        {
            string sql =
            @"
SELECT
    PatientSchemaId,
	PatientItemId,
	ItemTimelineId,
    ISNULL([Updated_ScheduledDate], [Calc_ScheduledDate]) AS [ScheduledDate],	
    [FirstAnticipatedDate],
	[LastAnticipatedDate],
	[Status],
    EnteredBy,
	EnteredTime,
	UpdatedBy,
	UpdatedTime
FROM
(
    SELECT
        PatientSchemaId,
	    PatientItemId,
	    ItemTimelineId,
	    --ProtocolNum,
	    --PtProtocolStudyId,
	    --[DependentStatus],
	    --[DependentStatusDate],
	    [Updated_ScheduledDate],
	    DATEADD(DAY, 0 - [shift_buffer_plus], [Calc_Last]) AS [Calc_ScheduledDate],
	    [Calc_First] AS [FirstAnticipatedDate],
	    [Calc_Last] AS [LastAnticipatedDate],
	    [Status],
        EnteredBy,
	    EnteredTime,
	    UpdatedBy,
	    UpdatedTime
    FROM
    (
        SELECT
            PatientSchemaId,
            -- the dependent item to be update
            PatientItemId,
            ItemTimelineId,
	        [Status],
		    EnteredBy,
	        EnteredTime,
	        UpdatedBy,
	        UpdatedTime,
		    -- v2.0
		    ProtocolNum,
		    PtProtocolStudyId,
		    [DependentStatus],
		    [DependentStatusDate],
            -- anticipated visits can be scheduled
		    CASE WHEN [Status] IS NOT NULL AND [Status] NOT IN ('Anticipated') THEN ScheduledDate ELSE NULL END AS [Updated_ScheduledDate],
		    DATEADD(DAY, (NumberOfUnits * shiftdays) - (BufferNumberOfUnitsMinus * shift_buffer) + [shift_offset], [DependentStatusDate]) AS [Calc_First],
		    DATEADD(DAY, (NumberOfUnits * shiftdays) + (BufferNumberofUnitsPlus * [shift_buffer]) + [shift_offset], [DependentStatusDate]) AS [Calc_Last],
		    BufferNumberofUnitsPlus * [shift_buffer] AS [shift_buffer_plus]
        FROM
        (
	        SELECT
                ppi.PatientSchemaId,
		        ppi.PatientItemId,
		        ppi.ItemTimelineId,		    
		        ppi.ScheduledDate,		           
		        ppi.Status,
		        --pt.BufferNumberOfUnitsPlus,
		        ppi.EnteredBy,
		        ppi.EnteredTime,
		        ppi.UpdatedBy,
		        ppi.UpdatedTime,
			    -- v2.0
			    p.ProtocolNum,
			    pp.PtProtocolStudyId,
			    CASE DisplayUnitName
				    WHEN 'Day' THEN 1
				    WHEN 'Week' THEN 7
				    WHEN 'Month' THEN 28
				    ELSE 0
			    END AS [shiftdays], 
			    CASE BufferUnitName
				    WHEN 'Day' THEN 1
				    WHEN 'Week' THEN 7
				    WHEN 'Month' THEN 28
				    ELSE 0
			    END	AS [shift_buffer],
			    --CASE DisplayUnitName WHEN 'Day' THEN -1 ELSE 0 END AS [shift_offset],
			    0 AS [shift_offset],
			    NumberOfUnits,
			    BufferNumberOfUnitsMinus,
			    BufferNumberOfUnitsPlus,
			    pStatus.PtProtocolStatus AS [DependentStatus],
			    pStatus.PtProtocolStatusDate AS [DependentStatusDate]
	        FROM ProtocolMgr_PatientSchemas pps
	        INNER JOIN ProtocolMgr_ProtocolSchemas ps
		        ON ps.ProtocolSchemaId = pps.ProtocolSchemaId
	        INNER JOIN ProtocolMgr_ProtocolVersions pv
		        ON pv.ProtocolVersionId = ps.ProtocolVersionId
	        INNER JOIN PatientProtocols pp
		        ON pp.PatientId = pps.PatientId AND pp.ProtocolId = pv.ProtocolId
	        INNER JOIN ProtocolMgr_Timeline pt
		        ON pt.ProtocolSchemaId = pps.ProtocolSchemaId
	        INNER JOIN ProtocolMgr_ItemTimeline pit
		        ON pit.TimelineId = pt.TimelineId
	        INNER JOIN 
    (
        SELECT DISTINCT
	        pp.PatientId,
	        pp.PatientProtocolId,
	        c.StatusDate AS [PtProtocolStatusDate],
	        REPLACE(c.Status, 'Progression', 'Disease Progression') AS [PtProtocolStatus]
        FROM Patients a
        INNER JOIN PatientProtocols pp
	        ON a.PatientId = pp.PatientId
        INNER JOIN Status c
	        ON a.PatientId = c.PatientId
        WHERE
	        -- valid dates
	        c.StatusDate IS NOT NULL
	        -- specified disease
	        AND c.StatusDisease = 'Prostate Cancer'
	        -- specfied progression
	        AND c.Status IN ('1st Progression','2nd Progression')

        UNION			 

        SELECT
	        pp.PatientId,
	        pp.PatientProtocolId,
	        pps.PtProtocolStatusDate,
	        pps.PtProtocolStatus
        FROM PatientProtocolStatus pps
        INNER JOIN PatientProtocols pp
	        ON pps.PatientProtocolId = pp.PatientProtocolId
        WHERE
	        pps.PtProtocolStatusDate IS NOT NULL
    )
    pStatus
		        ON pStatus.PatientProtocolId = pp.PatientProtocolId
		        AND pt.ItemIntervalType LIKE '%' + pStatus.PtProtocolStatus + '%'
	        INNER JOIN ProtocolMgr_PatientItems ppi
		        ON ppi.ItemTimelineId = pit.ItemTimelineId AND pps.PatientSchemaId = ppi.PatientSchemaId
		    INNER JOIN Protocols p
			    ON pp.ProtocolId = p.ProtocolId
	        -- limit to this patient's protocol schema
	        -- and to unscheduled items with valid status date
	        WHERE
		        pps.PatientSchemaId = @PatientSchemaId
                {0}
		        --AND
			    --(ppi.Status IS NULL OR ppi.Status NOT IN ('Performed','Completed'))
			    AND
			    pStatus.PtProtocolStatusDate IS NOT NULL
        ) a
     ) a
) a
            ";

            string restrictToUnschedledSQL = "";
            if (restrictToUnschedled)
            {
                restrictToUnschedledSQL =
                @"
                    AND
                    (
                        ppi.FirstAnticipatedDate IS NULL
                        AND ppi.LastAnticipatedDate IS NULL
                        AND ppi.ScheduledDate IS NULL
                    )
                ";
            }
            //string getFirstDate = GetAnticipatedDateSQL(true, "pStatus.PtProtocolStatusDate");
            //string getLastDate = GetAnticipatedDateSQL(false, "pStatus.PtProtocolStatusDate");
            //string fullSQL = string.Format(sql, getFirstDate, getLastDate, restrictToUnschedledSQL);
            string fullSQL = string.Format(sql, restrictToUnschedledSQL);
            return fullSQL;
        }

        /// <summary>
        /// Returns the SQL which calculates the anticipated dates for dependent items
        /// </summary>
        /// <param name="isFirst"></param>
        /// <param name="scheduleDateColumn"></param>
        /// <returns></returns>
        private static string GetAnticipatedDateSQL(bool isFirst, string scheduleDateColumn)
        {
            string firstSQL =
@"
(
    NumberOfUnits
    * 
    CASE DisplayUnitName
        WHEN 'Day' THEN 1
        WHEN 'Week' THEN 7
        WHEN 'Month' THEN 28
        ELSE 0
    END
)
- 
(
    BufferNumberOfUnitsMinus
    * 
    CASE BufferUnitName
        WHEN 'Day' THEN 1
        WHEN 'Week' THEN 7
        WHEN 'Month' THEN 28
        ELSE 0
    END
)
";
            string lastSQL =
@"
(
    NumberOfUnits
    * 		
    CASE DisplayUnitName
        WHEN 'Day' THEN 1
        WHEN 'Week' THEN 7
        WHEN 'Month' THEN 28
        ELSE 0
    END
)
+ 
(
    BufferNumberOfUnitsPlus
    * 		
    CASE BufferUnitName
        WHEN 'Day' THEN 1
        WHEN 'Week' THEN 7
        WHEN 'Month' THEN 28
        ELSE 0
    END
)
";
            string sqlFormat = "(DATEADD(DAY, {0}, {1}))";
            string sqlDateExpr = isFirst ? firstSQL : lastSQL;
            return string.Format(sqlFormat, sqlDateExpr, scheduleDateColumn);
        }

        #endregion

        #region Patient Items

        public static DataTable GetPatientItemFields(int patientItemId)
        {
            object[][] columns = new object[][]
            {
                new object[] { "PatientItemFieldId", typeof(int) },
               new object[] { "DestTablePrimKey", typeof(int) },
               new object[] { "SchemaItemFieldId", typeof(int) },
              new object[] { "DestTable", typeof(string) },
              new object[] { "DestField", typeof(string) },
              new object[] { "DestValue", typeof(string) },
               new object[] { "DisplayOrder", typeof(int) },
              new object[] { "FieldRowIndex", typeof(int) }
            };
            int colCount = columns.Length;
            DataTable dt = new DataTable();
            for (int i = 0; i < colCount; i++)
                dt.Columns.Add(new DataColumn(columns[i][0].ToString(), (Type)columns[i][1]));
            ReadPatientItemFields(patientItemId, (record) =>
            {
                object[] values = new object[colCount];
                for (int i = 0; i < colCount; i++)
                    values[i] = record.GetValue(i);
                dt.Rows.Add(values);
                return true;
            });
            return dt;
        }

        /// <summary>
        /// Read each from from the patient's scheduled visit items
        /// </summary>
        /// <param name="patientItemId"></param>
        /// <param name="consumer"></param>
        public static void ReadPatientItemFields(int patientItemId, Caisis.DataAccess.Connectivity.RecordConsumerDelegate consumer)
        {
            string sql =
            @"
                SELECT 
	                a.PatientItemFieldId,
                    a.DestTablePrimKey,
	                b.SchemaItemFieldId,
                    b.DestTable,
                    b.DestField,
                    b.DestValue,
                    b.DisplayOrder,
                    b.FieldRowIndex
                FROM ProtocolMgr_PatientItemFields a
                INNER JOIN ProtocolMgr_SchemaItemFields b
	                ON a.SchemaItemFieldId = b.SchemaItemFieldId
                WHERE
	                a.PatientItemId = @PatientItemId
                ORDER BY
                    a.PatientItemFieldId ASC
            ";
            SqlCommand cmd = DataAccessHelper.CreateSqlCommand(sql);
            // add key field
            DataAccessHelper.AddIntInputParam(cmd, "PatientItemId", patientItemId);
            Caisis.DataAccess.Connectivity.ConsumeRecord(cmd, consumer);
        }

        #endregion

        #region REPORTS (move after testing)

        /// <summary>
        /// Gets a summary of each patient on the protocol
        /// </summary>
        /// <param name="protocolId"></param>
        /// <param name="datasetSQL"></param>
        /// <returns></returns>
        public static DataTable GetProtocolPatientSummary(int protocolId, string datasetSQL)
        {
            string sql =
@"
SELECT
	pp.PatientProtocolId,
	pp.PtProtocolScreeningId,
	pp.PtProtocolStudyId,
	pt.PatientId,
	pt.PtMRN,
	pt.PtLastName,
	pt.PtFirstName,
	pt.PtRace,
	MIN(pps.PatientProtocolStatusId) AS PatientProtocolStatusId,
	MIN(pps.PtProtocolStatusDate) AS PtProtocolStatusDate,
    MIN(pps.PtProtocolStatusDateText) AS PtProtocolStatusDateText,
	MIN(id.IdentifierId) AS [IdentifierId],
	id.Identifier,
	po.ShortName AS [Institution]
FROM Protocols p
INNER JOIN PatientProtocols pp
	ON p.ProtocolId = pp.ProtocolId
INNER JOIN ({0}) ds
	ON pp.PatientId = ds.PatientId
INNER JOIN Patients pt
    ON ds.PatientId = pt.PatientId
LEFT OUTER JOIN PatientProtocolStatus pps
	ON pp.PatientProtocolId = pps.PatientProtocolId AND pps.PtProtocolStatus = 'Registered'
LEFT OUTER JOIN Identifiers id
	ON pt.PatientId = id.PatientId AND id.IdType = 'Registration ID'
LEFT JOIN ProjectOrganization po
	ON LEFT(pp.PtProtocolStudyId, 2) = po.OrgNum
WHERE
	p.ProtocolId = @ProtocolId
GROUP BY
	pp.PatientProtocolId,
	pp.PtProtocolScreeningId,
	pp.PtProtocolStudyId,
	pt.PatientId,
	pt.PtMRN,
	pt.PtLastName,
	pt.PtFirstName,
	pt.PtRace,
	pps.PtProtocolStatus,
	id.Identifier,
	po.ShortName
ORDER BY
    PtProtocolStudyId
";
            SqlCommand cmd = DataAccessHelper.CreateSqlCommand(string.Format(sql, datasetSQL));
            DataAccessHelper.AddIntInputParam(cmd, "ProtocolId", protocolId);
            return DataAccessHelper.GetList(cmd).Tables[0];
        }

        public static DataSet GetProtocolReport(int protocolId, string datasetSQL)
        {
            string sql =
@"
-- set dataset
DECLARE @Dataset TABLE(PatientId int)
INSERT INTO @Dataset(PatientId)
SELECT PatientId FROM ({0}) p

-- TABLE: Get a list of all patient's screened (failed or passed) for protocol
DECLARE @ProtocolPopulation TABLE
(
	PatientId int,
	PtAge int,
	PatientProtocolId int,
	PatientSchemaId int,
	ProtocolId int,
	ProtocolVersionId int,
	ProtocolSchemaId int,
	StartDate datetime,
	ConsentDate datetime,
	OnStudyDate datetime,
	OffTreatmentDate  datetime,
	OffStudyDate datetime,
	FailedScreeningDate datetime
)

-- patients on trial
INSERT INTO @ProtocolPopulation
SELECT
	c.PatientId,
	FLOOR(DATEDIFF(DAY, c.PtBirthDate, ISNULL(c.PtDeathDate, GETDATE()) ) / 365.25) AS PtAge,
	a.[PatientProtocolId],
	a.[PatientSchemaId],
	a.[ProtocolId],
	a.[ProtocolVersionId],
	a.[ProtocolSchemaId],
	a.[StartDate],
	a.[ConsentDate],
	a.[OnStudyDate],
	a.[OffTreatmentDate],
	a.[OffStudyDate],
	a.[FailedScreeningDate]
FROM
(
	SELECT
		[PatientId],
		[PatientProtocolId],
		[PatientSchemaId],
		[ProtocolId],
		[ProtocolVersionId],
		[ProtocolSchemaId],
		[StartDate],
		[Consented] AS [ConsentDate],
		[On Study] AS [OnStudyDate],
		[Off Treatment] AS [OffTreatmentDate],
		[Off Study] AS [OffStudyDate],
		[Failed Screening] AS [FailedScreeningDate]
	FROM
	(
		SELECT DISTINCT
			p.PatientId,
			pp.PatientProtocolId,
			ps.PatientSchemaId,
			protocol.ProtocolId,
			pro_version.ProtocolVersionId,
			pro_schema.ProtocolSchemaId,
			ps.StartDate,
			pps.PtProtocolStatus,
			pps.PtProtocolStatusDate,
			ROW_NUMBER() OVER (PARTITION BY pps.PatientProtocolId, pps.PtProtocolStatus ORDER BY pps.PtProtocolStatusDate ASC) AS StatusRowNum
		FROM Patients p
		INNER JOIN Patients dataset
			ON p.PatientId = dataset.PatientId
		INNER JOIN PatientProtocols pp
			ON p.PatientId = pp.PatientId
		INNER JOIN Protocols protocol
			ON pp.ProtocolId = protocol.ProtocolId
		LEFT OUTER JOIN PatientProtocolStatus pps
			ON pp.PatientProtocolId = pps.PatientProtocolId
		LEFT OUTER JOIN ProtocolMgr_PatientSchemas ps
			ON p.PatientId = ps.PatientId
		LEFT OUTER JOIN ProtocolMgr_ProtocolSchemas pro_schema
			ON ps.ProtocolSchemaId = pro_schema.ProtocolSchemaId
		LEFT OUTER JOIN ProtocolMgr_ProtocolVersions pro_version
			ON
				protocol.ProtocolId = pro_version.ProtocolId
				AND	pro_schema.ProtocolVersionId = pro_version.ProtocolVersionId
		WHERE
				pps.PtProtocolStatus IS NOT NULL
	) a
	PIVOT
	(
		MIN(PtProtocolStatusDate)
		FOR PtProtocolStatus IN 
		(
			[Consented],
			[On Study],
			[Off Treatment],
			[Off Study],
			[Failed Screening]
		)
	) AS b
	WHERE
		StatusRowNum = 1
) a
INNER JOIN @Dataset b
	ON a.PatientId = b.PatientId
INNER JOIN Patients c
	ON b.PatientId = c.PatientId
WHERE
	[ProtocolId] = @ProtocolId
ORDER BY
	a.ProtocolId,
	a.ProtocolVersionId,
	a.ProtocolSchemaId,
	a.PatientProtocolId
	
--SELECT * FROM @ProtocolPopulation
	
-- TABLE: Get a list of distinct patients currently on study, per treatment arm
DECLARE @OnStudyPatients TABLE(PatientId int, PatientProtocolId int, PatientSchemaId int, ConsentDate datetime, StartDate datetime)
INSERT INTO @OnStudyPatients(PatientId, PatientProtocolId, PatientSchemaId, ConsentDate, StartDate)
SELECT DISTINCT PatientId, PatientProtocolId, PatientSchemaId, ConsentDate, StartDate
FROM @ProtocolPopulation
WHERE
	OnStudyDate IS NOT NULL	
	-- patient off treatment|off study are ineligible
	AND OffStudyDate IS NULL
	-- PtProtocolStatus NOT LIKE '%Off Study%'
	--AND PtProtocolStatus NOT LIKE '%Off Treatment%'
	AND OffTreatmentDate IS NULL
	
-- TABLE: Get a list of distinct Patient's on trial
DECLARE @OnStudyPatientIds TABLE(PatientId int)
INSERT INTO @OnStudyPatientIds(PatientId)
SELECT DISTINCT PatientId
FROM @OnStudyPatients

-- count: on study patients
DECLARE @OnStudyPatientCount int
SET @OnStudyPatientCount = 
(
	SELECT COUNT(PatientId)
	FROM @OnStudyPatientIds
)
	
/* ENROLLMENT */
SELECT
	EnrolledPatients,
	TotalOnStudyPatients,
	TotalFailedScreenedPatients
FROM
(
	SELECT
	(
		-- Total Patients
		SELECT
			COUNT(PatientId)
		FROM
		(
			SELECT DISTINCT PatientId
			FROM @ProtocolPopulation
			WHERE
				OnStudyDate IS NOT NULL
		) a
	) AS EnrolledPatients, 
	(
		-- On Study Patients (Status=On Study)
		SELECT
			COUNT(PatientId)
		FROM @OnStudyPatientIds
	) AS TotalOnStudyPatients,
	(
		-- Screening Failed Patients (Status=Failed Screening)
		SELECT
			COUNT(PatientId)
		FROM
		(
			SELECT DISTINCT PatientId
			FROM @ProtocolPopulation
			WHERE
				FailedScreeningDate IS NOT NULL
		) a
	) AS TotalFailedScreenedPatients
) AS PatientEnrollment


/* BASELINE CHARACTERISTICS */
-- mean age: 78.45 - > 78
SELECT
	CAST(FLOOR(MIN(PtAge)) AS int) AS MinAge,
	CAST(FLOOR(MAX(PtAge)) AS int) AS MaxAge,
	CAST(FLOOR(AVG(PtAge)) AS int) AS MeanAge
FROM @OnStudyPatientIds a
INNER JOIN @ProtocolPopulation b
	ON a.PatientId = b.PatientId
	
-- Median Gleason Score (range)
SELECT
	MIN(PathGGS) AS MinGGS,
	MAX(PathGGS) AS MaxGGS,
	AVG
	(
		CASE
			WHEN GGSRank IN (GGSCount/2+1, (GGSCount+1)/2)
			THEN PathGGS
			ELSE NULL 
		END
	) AS MedianGGS
FROM
(
	SELECT
		CAST(a.PathGGS as int) AS PathGGS,
		ROW_NUMBER() OVER (PARTITION BY PathGGS ORDER BY PathGGS ASC) AS GGSRank,
		COUNT(a.PathologyId) OVER (PARTITION BY PathGGS) AS GGSCount
	FROM ProstatectomyPath a
	INNER JOIN Pathology b
		ON a.PathologyId = b.PathologyId
	INNER JOIN @OnStudyPatientIds c
		ON b.PatientId = c.PatientId
	WHERE ISNUMERIC(a.PathGGS) = 1
) a
WHERE
	GGSRank = 1
	
-- ECOG
SELECT
(
-- Number of patients with baseline ECOG 1 (KPS 70-80%)
	SELECT
		COUNT(a.PatientId)
	FROM Encounters a
	INNER JOIN @OnStudyPatientIds b
		ON a.PatientId = b.PatientId
	WHERE
		a.EncKPS IS NOT NULL
		AND ISNUMERIC(a.EncKPS) = 1
		AND FLOOR(a.EncKPS) >= 70
		AND CEILING(a.EncKPS) <= 80
) AS ECOG1,
(	
	--Number of patients with baseline ECOG 0 (KPS 90-100%)
	SELECT
		COUNT(a.PatientId)
	FROM
	(
		SELECT
			a.PatientId,
			ISNULL(a.EncKPS, a.EncECOG_Score) AS ECOG0
		FROM Encounters a
		INNER JOIN @OnStudyPatientIds b
			ON a.PatientId = b.PatientId
		WHERE
			a.EncKPS IS NOT NULL OR a.EncECOG_Score IS NOT NULL
	) a
	WHERE
		ISNUMERIC(a.ECOG0) = 1
		AND FLOOR(a.ECOG0) >= 90
		AND CEILING(a.ECOG0) <= 100
) AS ECOG0

/* SITES OF DISEASES (flatten patient id: DONE) */
DECLARE @SitesOfDisease TABLE
(
	PatientId int,
	SiteOfDisease varchar(255)
)
INSERT INTO @SitesOfDisease
(
	PatientId,
	SiteOfDisease
)
SELECT
	b.PatientId,
	a.SurveyItem AS [SiteOfDisease]	
FROM SurveyItems a
INNER JOIN Surveys b
	ON a.SurveyId = b.SurveyId
INNER JOIN Patients c --@OnStudyPatientIds c
	ON b.PatientId = c.PatientId
WHERE
	b.SurveyType = 'Prostate Sites of Disease'
	AND a.SurveyItemResult = 'Present'
ORDER BY
	a.SurveyItem

/* SITES OF DISEASES (flatten patient id: DONE) */
SELECT DISTINCT
	b.PatientId,
	a.SurveyItem AS [SiteOfDisease]	
FROM SurveyItems a
INNER JOIN Surveys b
	ON a.SurveyId = b.SurveyId
INNER JOIN @OnStudyPatientIds c
	ON b.PatientId = c.PatientId
WHERE
	b.SurveyType = 'Prostate Sites of Disease'
	AND a.SurveyItemResult = 'Present'
ORDER BY
	a.SurveyItem

/* PRIOR THERAPY (flatten patient id: DONE) */
SELECT
	[TableName],
	[Procedure],
	COUNT(DISTINCT a.[PatientId]) AS [Count]
FROM
(
	SELECT PatientId, 'Procedures' AS [TableName], ProcName AS [Procedure], ProcedureId AS [PriKey], ProcDate AS [Date]
		FROM Procedures a
		 WHERE
			a.ProcName LIKE '%Prostatectomy%'
			OR a.ProcName LIKE '%Radiation Therapy%'
	UNION ALL
		SELECT PatientId, 'RadiationTherapy' AS [TableName], RadTxIndication AS [Procedure], RadiationTherapyId AS [PriKey], RadTxDate AS [Date]
		FROM RadiationTherapy a
		WHERE
			a.RadTxIndication LIKE '%Salvage%'
	UNION ALL
		SELECT PatientId, 'MedicalTherapy' AS [TableName], MedTxType AS [Procedure], MedicalTherapyId AS [PriKey], MedTxDate AS [Date]
		FROM MedicalTherapy a
		WHERE
			a.MedTxType LIKE '%HORM%'
			OR a.MedTxType LIKE '%CHEMO%'
			OR a.MedTxType LIKE '%IMMUNO%'
) a
INNER JOIN @OnStudyPatients b
	ON a.PatientId = b.PatientId
WHERE
	a.[Date] < b.[ConsentDate]
GROUP BY
	[TableName],
	[Procedure]
ORDER BY
	[TableName],
	[Procedure]
	
/* 2.2 SECONDARY ENDPOINTS */

/* RECIST 1.1 response criteria for target lesions  */
SELECT
	ResponseType,
	COUNT(PatientResponseId) AS ResponseCount
FROM ProtocolMgr_PatientResponse a
INNER JOIN (SELECT DISTINCT PatientProtocolId FROM @OnStudyPatients) b
	ON a.PatientProtocolId = b.PatientProtocolId
WHERE
	a.ResponseType IS NOT NULL
GROUP BY
	a.ResponseType
ORDER BY
	a.ResponseType

/* Safety (NCI CTC v4.0) */
SELECT
	ToxName,
	[Grade 1],
	--ROUND([Grade 1]/@_OnStudyPatientCount*100, 0) AS [Grade 1 Percentage],
	[Grade 2],
	[Grade 3],
	[Grade 4],
	[Grade 1] + [Grade 2] + [Grade 3] + [Grade 4] AS [Grade Sum]
FROM
(
	SELECT
		ToxName,
		[1] AS [Grade 1],
		[2] AS [Grade 2],
		[3] AS [Grade 3],
		[4] AS [Grade 4]
	FROM 
	(
		-- Collapse patient's tox+grade
		SELECT
			a.PatientId,
			a.ToxName,
			MAX(CAST(a.ToxGrade AS int)) AS ToxGrade
		FROM Toxicities a
		INNER JOIN @OnStudyPatientIds b
			ON a.PatientId = b.PatientId
		WHERE
			ToxName IS NOT NULL
			-- normalized values
			AND ISNUMERIC(ToxGrade) = 1
			-- only values 1-5
			AND ToxGrade > 0
			AND ToxGrade <5
		GROUP BY
			a.PatientId,
			a.ToxName
	)
	a
	PIVOT
	(
		COUNT(PatientId)
		FOR ToxGrade IN ([1],[2],[3],[4])
	) AS b
) a
ORDER BY
	a.ToxName
	
-- Changes in Circulating Tumor Cells 
SELECT
(
	SELECT
		COUNT(PatientId)
	FROM
	(
		SELECT
			DISTINCT a.PatientId
		FROM LabTests a
		INNER JOIN @OnStudyPatientIds b
			ON a.PatientId = b.PatientId
		WHERE
			a.LabTest LIKE 'CTC'
			AND ISNUMERIC(a.LabResult) = 1
			AND CAST(a.LabResult AS float) < 5
	) a
) AS CTC_LESS_5,
(
	SELECT
		COUNT(PatientId)
	FROM
	(
		SELECT
			DISTINCT a.PatientId
		FROM LabTests a
		INNER JOIN @OnStudyPatientIds b
			ON a.PatientId = b.PatientId
		WHERE
			a.LabTest LIKE 'CTC'
			AND ISNUMERIC(a.LabResult) = 1
			AND CAST(a.LabResult AS float) >= 5
	) a
)  AS CTC_5_PLUS

/* PSAs with 24 month window */
SELECT DISTINCT
	a.PatientId,
	CAST(a.LabResult AS float) AS LabResult,
	a.LabDate
FROM LabTests a
INNER JOIN @OnStudyPatients b
	ON a.PatientId = b.PatientId
WHERE
	a.LabTest = 'PSA'
	AND a.LabDate IS NOT NULL
	AND a.LabResult IS NOT NULL
	AND ISNUMERIC(a.LabResult) = 1
	-- restrict to 24 week window from consent date
	AND a.LabDate > b.ConsentDate
	AND a.LabDate < DATEADD(WEEK, 24 , b.ConsentDate)
ORDER BY
	a.PatientId ASC,
	a.LabDate ASC 
";

            SqlCommand cmd = DataAccessHelper.CreateSqlCommand(string.Format(sql, datasetSQL));
            DataAccessHelper.AddIntInputParam(cmd, "ProtocolId", protocolId);
            return DataAccessHelper.GetList(cmd);
        }

        /// <summary>
        /// Returns the PSA Decline (Key) and MAX PSA Decline (Value) for each patient across a trial.
        /// </summary>
        /// <param name="datsetSQL"></param>
        /// <param name="protocolId"></param>
        /// <returns></returns>
        public static KeyValuePair<List<double>, List<double>> GetPSADeclineAndMaxChange(string datsetSQL, int protocolId)
        {
            string sql =
@"
-- variables
DECLARE @Now datetime
SET @Now = GETDATE()

DECLARE @Dataset TABLE(PatientId int)
INSERT INTO @Dataset(PatientId)
SELECT PatientId FROM ({0}) p

-- TABLE: Get a list of all patient's screened (failed or passed) for protocol
DECLARE @ProtocolPopulation TABLE
(
	PatientId int,
	PtAge int,
	PatientProtocolId int,
	PatientSchemaId int,
	ProtocolId int,
	ProtocolVersionId int,
	ProtocolSchemaId int,
	StartDate datetime,
	ConsentDate datetime,
	OnStudyDate datetime,
	OffTreatmentDate  datetime,
	OffStudyDate datetime,
	FailedScreeningDate datetime
)
	
INSERT INTO @ProtocolPopulation
SELECT
	c.PatientId,
	FLOOR(DATEDIFF(DAY, c.PtBirthDate, ISNULL(c.PtDeathDate, GETDATE()) ) / 365.25) AS PtAge,
	a.[PatientProtocolId],
	a.[PatientSchemaId],
	a.[ProtocolId],
	a.[ProtocolVersionId],
	a.[ProtocolSchemaId],
	a.[StartDate],
	a.[ConsentDate],
	a.[OnStudyDate],
	a.[OffTreatmentDate],
	a.[OffStudyDate],
	a.[FailedScreeningDate]
FROM
(
	SELECT
		[PatientId],
		[PatientProtocolId],
		[PatientSchemaId],
		[ProtocolId],
		[ProtocolVersionId],
		[ProtocolSchemaId],
		[StartDate],
		[Consented] AS [ConsentDate],
		[On Study] AS [OnStudyDate],
		[Off Treatment] AS [OffTreatmentDate],
		[Off Study] AS [OffStudyDate],
		[Failed Screening] AS [FailedScreeningDate]
	FROM
	(
		SELECT DISTINCT
			p.PatientId,
			pp.PatientProtocolId,
			ps.PatientSchemaId,
			protocol.ProtocolId,
			pro_version.ProtocolVersionId,
			pro_schema.ProtocolSchemaId,
			ps.StartDate,
			pps.PtProtocolStatus,
			pps.PtProtocolStatusDate,
			ROW_NUMBER() OVER (PARTITION BY pps.PatientProtocolId, pps.PtProtocolStatus ORDER BY pps.PtProtocolStatusDate ASC) AS StatusRowNum
		FROM Patients p
		INNER JOIN Patients dataset
			ON p.PatientId = dataset.PatientId
		INNER JOIN PatientProtocols pp
			ON p.PatientId = pp.PatientId
		INNER JOIN Protocols protocol
			ON pp.ProtocolId = protocol.ProtocolId
		LEFT OUTER JOIN PatientProtocolStatus pps
			ON pp.PatientProtocolId = pps.PatientProtocolId
		LEFT OUTER JOIN ProtocolMgr_PatientSchemas ps
			ON p.PatientId = ps.PatientId
		LEFT OUTER JOIN ProtocolMgr_ProtocolSchemas pro_schema
			ON ps.ProtocolSchemaId = pro_schema.ProtocolSchemaId
		LEFT OUTER JOIN ProtocolMgr_ProtocolVersions pro_version
			ON
				protocol.ProtocolId = pro_version.ProtocolId
				AND	pro_schema.ProtocolVersionId = pro_version.ProtocolVersionId
		WHERE
				pps.PtProtocolStatus IS NOT NULL
	) a
	PIVOT
	(
		MIN(PtProtocolStatusDate)
		FOR PtProtocolStatus IN 
		(
			[Consented],
			[On Study],
			[Off Treatment],
			[Off Study],
			[Failed Screening]
		)
	) AS b
	WHERE
		StatusRowNum = 1
) a
INNER JOIN @Dataset b
	ON a.PatientId = b.PatientId
INNER JOIN Patients c
	ON b.PatientId = c.PatientId
WHERE
	[ProtocolId] = @ProtocolId
ORDER BY
	a.ProtocolId,
	a.ProtocolVersionId,
	a.ProtocolSchemaId,
	a.PatientProtocolId
	
--SELECT * FROM @ProtocolPopulation
	
-- TABLE: Get a list of distinct patients currently on study, per treatment arm
DECLARE @OnStudyPatients TABLE(PatientId int, PatientProtocolId int, PatientSchemaId int, ConsentDate datetime, StartDate datetime)
INSERT INTO @OnStudyPatients(PatientId, PatientProtocolId, PatientSchemaId, ConsentDate, StartDate)
SELECT DISTINCT PatientId, PatientProtocolId, PatientSchemaId, ConsentDate, StartDate
FROM @ProtocolPopulation
WHERE
	OnStudyDate IS NOT NULL	
	-- patient off treatment|off study are ineligible
	AND OffStudyDate IS NULL
	-- PtProtocolStatus NOT LIKE '%Off Study%'
	--AND PtProtocolStatus NOT LIKE '%Off Treatment%'
	AND OffTreatmentDate IS NULL
 
/* PSAs with 24 month window */
SELECT DISTINCT
	a.PatientId,
	CAST(a.LabResult AS float) AS LabResult,
	a.LabDate
FROM LabTests a
INNER JOIN @OnStudyPatients b
	ON a.PatientId = b.PatientId
WHERE
	a.LabTest = 'PSA'
	AND a.LabDate IS NOT NULL
	AND a.LabResult IS NOT NULL
	AND ISNUMERIC(a.LabResult) = 1
	-- restrict to 24 month window from consent date
	AND a.LabDate > b.ConsentDate
	AND a.LabDate < DATEADD(MONTH, 24 , b.ConsentDate)
ORDER BY
	a.PatientId ASC,
	a.LabDate ASC
";

            Func<double, double, double> calcPercent = (psa1, psa2) =>
            {
                // psa1: 3.2, psa2: 5
                // calculate change 5 - 3.2 = 1.8
                double change = psa2 - psa1;
                // calculate change as a percent 1.8 / 5 = 0.36 * 100 = 36% increase
                double changePercent = change / psa1 * 100.0;
                return changePercent;
            };

            Func<List<double>, double> calculateOverallChange = (psas) =>
            {
                if (psas.Count() > 0)
                {
                    double first = psas.First();
                    double last = psas.Last();
                    return calcPercent(first, last);
                }
                else
                {
                    return 0.0;
                }
            };
            Func<List<double>, double> calculateMaxPSAChange = (psas) =>
            {
                List<double> psaChanges = new List<double>();
                int i = 0;
                psas.ForEach((psa) =>
                {
                    if (i > 0)
                    {
                        double prevPSA = psas.ElementAt(i - 1);
                        double changePercent = calcPercent(prevPSA, psa);
                        psaChanges.Add(changePercent);
                    }
                    i++;
                });
                return psaChanges.Count() > 0 ? psaChanges.Min() : 0.0;
            };


            int? currentPatientId = null;
            List<double> psaResults = new List<double>();

            List<double> overallPSADecline = new List<double>();
            List<double> maxPSADecline = new List<double>();

            // EXECURE READER
            SqlCommand command = new SqlCommand(string.Format(sql, datsetSQL));
            DataAccessHelper.AddIntInputParam(command, "ProtocolId", protocolId);

            Connectivity.ConsumeRecord(command, (r) =>
            {
                int patientId = (int)r["PatientId"];
                double labResult = (double)r["LabResult"];
                // determine if working with same patient
                if (currentPatientId.HasValue)
                {
                    if (currentPatientId.Value == patientId)
                    {
                        psaResults.Add(labResult);
                    }
                    // next patient
                    else
                    {
                        // calculate prev patient's results
                        overallPSADecline.Add(calculateOverallChange(psaResults));
                        maxPSADecline.Add(calculateMaxPSAChange(psaResults));
                        // re-init
                        currentPatientId = null;
                        psaResults.Clear();
                    }
                }
                // first patient
                else
                {
                    psaResults.Add(labResult);
                }
                // update current patient
                currentPatientId = patientId;
                return true;
            });

            // calculate last set of psa changes
            if (currentPatientId.HasValue && psaResults.Count() > 0)
            {
                overallPSADecline.Add(calculateOverallChange(psaResults));
                maxPSADecline.Add(calculateMaxPSAChange(psaResults));
            }
            return new KeyValuePair<List<double>, List<double>>(overallPSADecline, maxPSADecline);
        }

        public static DataSet GetProtocolToxicityReport(string datasetSQL, int? protocolId, int? protocolSchemaId, string orgNum, string studyId, string status, DateTime? startDate, DateTime? endDate, string toxicity)
        {
            string sql =
@"
-- set dataset
DECLARE @Dataset TABLE(PatientId int)
INSERT INTO @Dataset(PatientId)
SELECT PatientId FROM (SELECT * FROM Patients) p

-- variables
DECLARE @Now datetime
SET @Now = GETDATE()

-- TABLE: Get a list of all patient's screened (failed or passed) for protocol
DECLARE @ProtocolPopulation TABLE
(
	PatientId int,
	PtAge int,
	PatientProtocolId int,
	PtProtocolStudyId varchar(255),
	PatientSchemaId int,
	ProtocolId int,
	ProtocolVersionId int,
	ProtocolSchemaId int,
	StartDate datetime,
	ConsentDate datetime,
	OnStudyDate datetime,
	OffTreatmentDate  datetime,
	OffStudyDate datetime,
	FailedScreeningDate datetime
)

-- patients on trial
INSERT INTO @ProtocolPopulation
SELECT
	c.PatientId,
	FLOOR(DATEDIFF(DAY, c.PtBirthDate, ISNULL(c.PtDeathDate, GETDATE()) ) / 365.25) AS PtAge,
	a.[PatientProtocolId],
	a.[PtProtocolStudyId],
	a.[PatientSchemaId],
	a.[ProtocolId],
	a.[ProtocolVersionId],
	a.[ProtocolSchemaId],
	a.[StartDate],
	a.[ConsentDate],
	a.[OnStudyDate],
	a.[OffTreatmentDate],
	a.[OffStudyDate],
	a.[FailedScreeningDate]
FROM
(
	SELECT
		[PatientId],
		[PatientProtocolId],
		[PtProtocolStudyId],
		[PatientSchemaId],
		[ProtocolId],
		[ProtocolVersionId],
		[ProtocolSchemaId],
		[StartDate],
		[Consented] AS [ConsentDate],
		[On Study] AS [OnStudyDate],
		[Off Treatment] AS [OffTreatmentDate],
		[Off Study] AS [OffStudyDate],
		[Failed Screening] AS [FailedScreeningDate]
	FROM
	(
		SELECT DISTINCT
			p.PatientId,
			pp.PatientProtocolId,
			pp.PtProtocolStudyId,
			ps.PatientSchemaId,
			protocol.ProtocolId,
			pro_version.ProtocolVersionId,
			pro_schema.ProtocolSchemaId,
			ps.StartDate,
			pps.PtProtocolStatus,
			pps.PtProtocolStatusDate,
			ROW_NUMBER() OVER (PARTITION BY pps.PatientProtocolId, pps.PtProtocolStatus ORDER BY pps.PtProtocolStatusDate ASC) AS StatusRowNum
		FROM Patients p
		INNER JOIN Patients dataset
			ON p.PatientId = dataset.PatientId
		INNER JOIN PatientProtocols pp
			ON p.PatientId = pp.PatientId
		INNER JOIN Protocols protocol
			ON pp.ProtocolId = protocol.ProtocolId
		LEFT OUTER JOIN PatientProtocolStatus pps
			ON pp.PatientProtocolId = pps.PatientProtocolId
		LEFT OUTER JOIN ProtocolMgr_PatientSchemas ps
			ON p.PatientId = ps.PatientId
		LEFT OUTER JOIN ProtocolMgr_ProtocolSchemas pro_schema
			ON ps.ProtocolSchemaId = pro_schema.ProtocolSchemaId
		LEFT OUTER JOIN ProtocolMgr_ProtocolVersions pro_version
			ON
				protocol.ProtocolId = pro_version.ProtocolId
				AND	pro_schema.ProtocolVersionId = pro_version.ProtocolVersionId
		WHERE
				pps.PtProtocolStatus IS NOT NULL
	) a
	PIVOT
	(
		MIN(PtProtocolStatusDate)
		FOR PtProtocolStatus IN 
		(
			[Consented],
			[On Study],
			[Off Treatment],
			[Off Study],
			[Failed Screening]
		)
	) AS b
	WHERE
		StatusRowNum = 1
) a
INNER JOIN @Dataset b
	ON a.PatientId = b.PatientId
INNER JOIN Patients c
	ON b.PatientId = c.PatientId
WHERE
	-- filter by protocol
	(@ProtocolId IS NULL OR @ProtocolId = '' OR @ProtocolId = a.ProtocolId)
	AND
	-- filter by site
	(@OrgNum IS NULL OR @OrgNum = '' OR a.PtProtocolStudyId LIKE @OrgNum + '%')
ORDER BY
	a.ProtocolId,
	a.ProtocolVersionId,
	a.ProtocolSchemaId,
	a.PatientProtocolId
	
-- TABLE: Get a list of distinct patients currently on study, per treatment arm
DECLARE @OnStudyPatients TABLE(PatientId int, PatientProtocolId int, PatientSchemaId int, ConsentDate datetime, StartDate datetime)
INSERT INTO @OnStudyPatients(PatientId, PatientProtocolId, PatientSchemaId, ConsentDate, StartDate)
SELECT DISTINCT PatientId, PatientProtocolId, PatientSchemaId, ConsentDate, StartDate
FROM @ProtocolPopulation

-- TABLE: Get a list of distinct Patient's on trial
DECLARE @OnStudyPatientIds TABLE(PatientId int)
INSERT INTO @OnStudyPatientIds(PatientId)
SELECT DISTINCT PatientId
FROM @OnStudyPatients

	
-- toxicites by scale
SELECT
	ToxName,
	[Grade 1],
	--ROUND([Grade 1]/@_OnStudyPatientCount*100, 0) AS [Grade 1 Percentage],
	[Grade 2],
	[Grade 3],
	[Grade 4],
	[Grade 5],
	[Grade 1] + [Grade 2] + [Grade 3] + [Grade 4] +  [Grade 5] AS [Grade Sum]
FROM
(
	SELECT
		ToxName,
		[1] AS [Grade 1],
		[2] AS [Grade 2],
		[3] AS [Grade 3],
		[4] AS [Grade 4],
		[5] AS [Grade 5]
	FROM 
	(
		-- Collapse patient's tox+grade
		SELECT
			a.PatientId,
			a.ToxName,
			MAX(CAST(a.ToxGrade AS int)) AS ToxGrade
		FROM Toxicities a
		INNER JOIN @OnStudyPatientIds b
			ON a.PatientId = b.PatientId
		WHERE
			ToxName IS NOT NULL
			-- normalized values
			AND ISNUMERIC(ToxGrade) = 1
			-- only values 1-5
			AND ToxGrade > 0
			AND ToxGrade < 6
		GROUP BY
			a.PatientId,
			a.ToxName
	)
	a
	PIVOT
	(
		COUNT(PatientId)
		FOR ToxGrade IN ([1],[2],[3],[4],[5])
	) AS b
) a
ORDER BY
	a.ToxName

-- toxicites by attribution/probability
SELECT
	ToxName,
	[Definite],
	[Possible],
	[Probable],
	[Unlikely],
	[Unrelated]
FROM 
(
	-- Collapse patient's tox+grade
	SELECT
		a.PatientId,
		a.ToxName,
		a.ToxProbability,
		MAX(CAST(a.ToxGrade AS int)) AS ToxGrade
	FROM Toxicities a
	INNER JOIN @OnStudyPatientIds b
		ON a.PatientId = b.PatientId
	WHERE
		ToxName IS NOT NULL
		-- normalized values
		AND ISNUMERIC(ToxGrade) = 1
		-- only values 1-5
		AND ToxGrade > 0
		AND ToxGrade < 6
		AND ToxProbability IS NOT NULL
	GROUP BY
		a.PatientId,
		a.ToxName,
		a.ToxProbability
)
a
PIVOT
(
	COUNT(PatientId)
	FOR ToxProbability IN ([Definite],[Possible],[Probable],[Unlikely],[Unrelated])
) AS b 


-- toxicites related to
SELECT
	ToxName,
	[Disease],
	[Treatment],
	[Surgery],
	[Other],
	[Unknown]
FROM 
(
	-- Collapse patient's tox+grade
	SELECT
		a.PatientId,
		a.ToxName,
		a.ToxRelatedTo,
		MAX(CAST(a.ToxGrade AS int)) AS ToxGrade
	FROM Toxicities a
	INNER JOIN @OnStudyPatientIds b
		ON a.PatientId = b.PatientId
	WHERE
		ToxName IS NOT NULL
		-- normalized values
		AND ISNUMERIC(ToxGrade) = 1
		-- only values 1-5
		AND ToxGrade > 0
		AND ToxGrade < 6
		AND ToxRelatedTo IS NOT NULL
	GROUP BY
		a.PatientId,
		a.ToxName,
		a.ToxRelatedTo
)
a
PIVOT
(
	COUNT(PatientId)
	FOR ToxRelatedTo IN ([Disease],[Treatment],[Surgery],[Other],[Unknown])
) AS b 

";
            string formattedSQL = string.Format(sql, datasetSQL);
            SqlCommand cmd = DataAccessHelper.CreateSqlCommand(formattedSQL);
            // add params
            DataAccessHelper.AddInputParam(cmd, "ProtocolId", protocolId, true);
            DataAccessHelper.AddInputParam(cmd, "OrgNum", orgNum, true);
            return DataAccessHelper.GetList(cmd);
        }

        public static DataTable GetProtocolSpecimenReport(string datasetSQL)
        {
            string sql =
@"
SELECT
	Institution,
	RIGHT(Identifier,8) AS 'Study ID',
	SpecimenReferenceNumber AS 'Specimen ID',
	SpecimenType AS 'Blood or Tissue',
	SpecimenSubType AS 'Specimen Type',
	AccessionAnatomicSite AS 'Biopsy Site',
	AccessionProcName AS 'Collection Method',
	AccessionDateText AS 'Collection Date',
	SpecimenNotes AS 'Pathology Condition',
	SpecimenStatus AS 'Status'
FROM Specimens 
LEFT JOIN SpecimenAccessions ON SpecimenAccessions.SpecimenAccessionID=Specimens.SpecimenAccessionID
LEFT JOIN Identifiers ON SpecimenAccessions.PatientId=Identifiers.PatientId
LEFT JOIN PatientInstitutions ON PatientInstitutions.PatientId = Identifiers.PatientId
LEFT OUTER JOIN Institutions ON PatientInstitutions.InstitutionId = Institutions.InstitutionId
WHERE
	SpecimenStatus IS NOT NULL
	AND SpecimenReferenceNumber NOT LIKE '%99999%'
	AND IdType='Study Id'
ORDER BY  RIGHT(Identifiers.Identifier,3)
";
            string formattedSQL = string.Format(sql, datasetSQL);
            SqlCommand cmd = DataAccessHelper.CreateSqlCommand(formattedSQL);
            return DataAccessHelper.GetList(cmd).Tables[0];
        }

        #region REPORT

        public static DataSet GetProtocolAccrual(int protocolId)
        {
            string sql =
@"
DECLARE @PatientDataset	TABLE
(
	PatientId int,
	PtProtocolStudyId varchar(50),
	PtRace varchar(50),
	PtRegisteredDate datetime,
	PtRegisteredYear int,
	PtRegisteredQuarter varchar(2),
	PtInstitution varchar(50)
)
DECLARE @RaceDataset TABLE
(
	PatientId int,
	PtProtocolStudyId varchar(50),
	PtRace varchar(50),
	PtRegisteredDate datetime
)

INSERT INTO @PatientDataset
(
	PatientId,
	PtProtocolStudyId,
	PtRace,
	PtRegisteredDate,
	PtRegisteredYear,
	PtRegisteredQuarter,
	PtInstitution
)
SELECT
	PatientId,
	PtProtocolStudyId,
	PtRace,
	PtProtocolStatusDate,
	YEAR(PtProtocolStatusDate),
	CASE
		WHEN MONTH([PtProtocolStatusDate]) BETWEEN 1 AND 3 THEN 'Q1'
		WHEN MONTH([PtProtocolStatusDate]) BETWEEN 4 AND 6 THEN 'Q2'
		WHEN MONTH([PtProtocolStatusDate]) BETWEEN 7 AND 9 THEN 'Q3'
		WHEN MONTH([PtProtocolStatusDate]) BETWEEN 10 AND 12 THEN 'Q4'
		ELSE ''
	END AS [PtRegisteredQuarter],
	PtInstitution
FROM
(
	SELECT DISTINCT
		p.PatientId,
		pp.PtProtocolStudyId,
		ISNULL(p.PtRace, 'N/A') AS [PtRace],
		MAX(ISNULL(pps.PtProtocolStatusDate, audit_pps.PtProtocolStatusDate)) AS [PtProtocolStatusDate],
		po.ShortName AS [PtInstitution]
	FROM PatientProtocols pp
	INNER JOIN Patients p
		ON pp.PatientId = p.PatientId
	INNER JOIN Protocols pr
		ON pp.ProtocolId = pr.ProtocolId
    INNER JOIN PatientProtocolStatus pps
        ON pp.PatientProtocolId = pps.PatientProtocolId
	LEFT JOIN AuditLog_PatientProtocolStatus audit_pps
		ON pp.PatientProtocolId = audit_pps.PatientProtocolId
	LEFT JOIN ProjectOrganization po
		ON LEFT(pp.PtProtocolStudyId, 2) = po.OrgNum
	WHERE
		pr.ProtocolId = @ProtocolId
		AND
		ISNULL(pps.PtProtocolStatus, audit_pps.PtProtocolStatus) = 'Registered'
		AND
		ISNULL(pps.PtProtocolStatusDate, audit_pps.PtProtocolStatusDate) IS NOT NULL
	GROUP BY
		p.PatientId,
		pp.PtProtocolStudyId,
		p.PtRace,
		po.ShortName
) a
WHERE PtRace IN
(
	'N/A',
	'White Non-Hispanic',
	'White Hispanic',
	'Asian',
	'Black or African American',
	'Native American/ Alaska Native',
	'Native Hawaiian or Other Pacific Islander',
	'More than one race',
	'Unknown or not reported'
)

/*
	Registered By Quarter
*/
SELECT
	[PtRegisteredYear],
	[PtRegisteredQuarter],
	COUNT(PatientId) AS [PatientCount]
FROM @PatientDataset
GROUP BY
	PtRegisteredYear,
	PtRegisteredQuarter
ORDER BY
	PtRegisteredYear,
	PtRegisteredQuarter

/*
	Registered By Insitution, Year, Quarter
*/
SELECT
	ISNULL([PtInstitution], '') AS [PtInstitution],
	PtRegisteredYear,
	PtRegisteredQuarter,
    COUNT(PatientId) AS [TotalPatients]		
FROM @PatientDataset
GROUP BY
	PtRegisteredYear,
	PtRegisteredQuarter,
	PtInstitution
ORDER BY
	PtInstitution,
	PtRegisteredYear,
	PtRegisteredQuarter
";
            SqlCommand cmd = DataAccessHelper.CreateSqlCommand(sql);
            DataAccessHelper.AddIntInputParam(cmd, "ProtocolId", protocolId);
            return DataAccessHelper.GetList(cmd);
        }

        #endregion

        #endregion

        public static DataTable GetProtocolsByOrganization(int organizationId)
        {
            string sql =
            @"
            SELECT
	            d.*
            FROM ProjectOrganization a
            INNER JOIN Project_ProjectOrganization b
                ON a.OrganizationId = b.OrganizationId
            INNER JOIN Project c
                ON b.ProjectId = c.ProjectId
            INNER JOIN Protocols d
                ON c.ProjectId = d.ProjectId
            WHERE
	            a.OrganizationId = @OrganizationId
            ";
            SqlCommand cmd = DataAccessHelper.CreateSqlCommand(sql);
            DataAccessHelper.AddIntInputParam(cmd, "OrganizationId", organizationId);
            return DataAccessHelper.GetList(cmd).Tables[0];
        }

        #region Identifiers

        public static DataTable GetProtocolPatientIdentifiers(int protocolId, string datasetSQL)
        {
            string sql =
                @"
SELECT DISTINCT
    pp.PatientId,
    pp.PatientProtocolId,
    pp.PtProtocolStudyId,
    id1.IdentifierId AS [Broad_Subject_ID_IdentifierId],
    id1.Identifier AS [Broad_Subject_ID],
    id2.IdentifierId AS [Michigan_Subject_ID_IdentifierId],
    id2.Identifier AS [Michigan_Subject_ID],
    id3.IdentifierId AS [Local_Subject_ID_IdentifierId],
    id3.Identifier AS [Local_Subject_ID]
FROM PatientProtocols pp
INNER JOIN Protocols p
	ON pp.ProtocolId = p.ProtocolId
INNER JOIN ({0}) ds
	ON pp.PatientId = ds.PatientId
LEFT OUTER JOIN Identifiers id1
	ON pp.PatientId = id1.PatientId AND id1.IdType = 'Broad Subject ID'
LEFT OUTER JOIN Identifiers id2
	ON pp.PatientId = id2.PatientId AND id2.IdType = 'Michigan Subject ID'
LEFT OUTER JOIN Identifiers id3
	ON pp.PatientId = id3.PatientId AND id3.IdType = 'Local Subject ID'
WHERE
	pp.ProtocolId = @ProtocolId
";

            SqlCommand cmd = DataAccessHelper.CreateSqlCommand(string.Format(sql, datasetSQL));
            DataAccessHelper.AddIntInputParam(cmd, "ProtocolId", protocolId);
            return DataAccessHelper.GetList(cmd).Tables[0];
        }

        #endregion

        #region Modify Timeline

        private static readonly string BASE_TIMELINE_VARIABLES =
@"
-- private variables
-- unit
DECLARE @UnitValueMultiplier int
DECLARE @UnitValueDays int

-- buffer unit
DECLARE @BufferUnitMultiplier int
DECLARE @DaysPlus int
DECLARE @DaysMinus int

-- unit
SET @UnitValueMultiplier =	CASE @DisplayUnitName
							WHEN 'Day' THEN 1
							WHEN 'Week' THEN 7
							WHEN 'Month' THEN 28
							ELSE 0
						END
SET @UnitValueDays = ABS(@NumberOfUnits * @UnitValueMultiplier)

-- buffer unit
SET @BufferUnitMultiplier =	CASE @BufferUnitName
							WHEN 'Day' THEN 1
							WHEN 'Week' THEN 7
							WHEN 'Month' THEN 28
							ELSE 0
						END
SET @DaysPlus  = ABS(@BufferNumberOfUnitsPlus * @BufferUnitMultiplier)
SET @DaysMinus  = ABS(@BufferNumberOfUnitsMinus * @BufferUnitMultiplier)
";

        public static void UpdateTimeline(int timelineId, string visitLabel, string displayUnitName, int numberOfUnits, string bufferUnitName, int bufferUnitPlus, int bufferUnitMinus, string itemIntervalType, string username)
        {
            string format_sql =
@"
/* UPDATE TIMELINE: script for updating Timeline */

-- private variables
-- unit
DECLARE @UnitValueMultiplier int
DECLARE @UnitValueDays int

-- buffer unit
DECLARE @BufferUnitMultiplier int
DECLARE @DaysPlus int
DECLARE @DaysMinus int

-- unit
SET @UnitValueMultiplier =	CASE @DisplayUnitName
							WHEN 'Day' THEN 1
							WHEN 'Week' THEN 7
							WHEN 'Month' THEN 28
							ELSE 0
						END
SET @UnitValueDays = ABS(@NumberOfUnits * @UnitValueMultiplier)

-- buffer unit
SET @BufferUnitMultiplier =	CASE @BufferUnitName
							WHEN 'Day' THEN 1
							WHEN 'Week' THEN 7
							WHEN 'Month' THEN 28
							ELSE 0
						END
SET @DaysPlus  = ABS(@BufferNumberOfUnitsPlus * @BufferUnitMultiplier)
SET @DaysMinus  = ABS(@BufferNumberOfUnitsMinus * @BufferUnitMultiplier)

-- print
/*
SELECT
	@DisplayUnitName AS [UnitName],
	@NumberOfUnits AS [UnitValue],
	@UnitValueMultiplier AS [DaysMultiplier],	
	@UnitValueDays AS [DaysValue]
SELECT
	@BufferUnitName AS [UnitName],	
	@BufferNumberOfUnitsPlus AS [UnitPlusValue],
	@BufferNumberOfUnitsMinus AS [UnitMinusValue],
	@BufferUnitMultiplier AS [DaysMultiplier],
	@DaysPlus AS [DaysPlusValue],
	@DaysMinus AS [DaysMinusValue]
*/

/* STEP 1: update timeline */
UPDATE t
SET 
	-- label
	VisitLabel = @VisitLabel,
	-- unit
	DisplayUnitName = @DisplayUnitName,
	NumberOfUnits = @NumberOfUnits,	
	-- buffer
	BufferUnitName = @BufferUnitName,
	BufferNumberOfUnitsPlus = @BufferNumberOfUnitsPlus,
	BufferNumberOfUnitsMinus = @BufferNumberOfUnitsMinus,
    -- interval
    ItemIntervalType = @ItemIntervalType,
	-- audit
	UpdatedBy = @UpdatedBy,
	UpdatedTime = @UpdatedTime
/*
SELECT
	-- label
	VisitLabel,
	-- unit
	DisplayUnitName,
	NumberOfUnits,	
	-- buffer
	BufferUnitName,
	BufferNumberOfUnitsPlus,
	BufferNumberOfUnitsMinus,
	-- audit
	UpdatedBy,
	UpdatedTime
*/
FROM ProtocolMgr_Timeline t
-- only update where a value changed
WHERE
	t.TimelineId = @TimelineId
	AND
	(
		VisitLabel <> @VisitLabel
		OR DisplayUnitName <> @DisplayUnitName
		OR NumberOfUnits <> @NumberOfUnits
		OR BufferUnitName <> @BufferUnitName
		OR BufferNumberOfUnitsPlus <> @BufferNumberOfUnitsPlus
		OR BufferNumberOfUnitsMinus <> @BufferNumberOfUnitsMinus
        OR ItemIntervalType <> @ItemIntervalType
	)

/* STEP 2: updated schedules */
{0}
";
            string update_patients_sql = GetUpdateTimelineSQL(username, "TimelineId");
            string full_sql = string.Format(format_sql, update_patients_sql);

            SqlCommand cmd = DataAccessHelper.CreateSqlCommand(full_sql);
            // visit params
            DataAccessHelper.AddIntInputParam(cmd, "TimelineId", timelineId);
            DataAccessHelper.AddStringInputParam(cmd, "VisitLabel", visitLabel);
            DataAccessHelper.AddStringInputParam(cmd, "DisplayUnitName", displayUnitName);
            DataAccessHelper.AddIntInputParam(cmd, "NumberOfUnits", numberOfUnits);
            // buffer params
            DataAccessHelper.AddStringInputParam(cmd, "BufferUnitName", bufferUnitName);
            DataAccessHelper.AddIntInputParam(cmd, "BufferNumberOfUnitsPlus", bufferUnitPlus);
            DataAccessHelper.AddIntInputParam(cmd, "BufferNumberOfUnitsMinus", bufferUnitMinus);
            // interval
            DataAccessHelper.AddStringInputParam(cmd, "ItemIntervalType", itemIntervalType);

            // audit params, i.e., UpdatedBy="admin (timeline)"
            string updatedByAudit = string.Format("{0} ({1})", username, "timeline");
            DataAccessHelper.AddStringInputParam(cmd, "UpdatedBy", updatedByAudit);
            DataAccessHelper.AddDateTimeInputParam(cmd, "UpdatedTime", DateTime.Now);

            DataAccessHelper.ExecuteScalar(cmd);

        }

        public static void UpdateSchemaTimeline(int protocolSchemaId, string username)
        {
            string update_schema_patients_sql = GetUpdateTimelineSQL(username, "ProtocolSchemaId");

            SqlCommand cmd = DataAccessHelper.CreateSqlCommand(update_schema_patients_sql);
            // visit params
            DataAccessHelper.AddIntInputParam(cmd, "ProtocolSchemaId", protocolSchemaId);

            // audit params, i.e., UpdatedBy="admin (timeline)"
            string updatedByAudit = string.Format("{0} ({1})", username, "timeline");
            DataAccessHelper.AddStringInputParam(cmd, "UpdatedBy", updatedByAudit);
            DataAccessHelper.AddDateTimeInputParam(cmd, "UpdatedTime", DateTime.Now);

            DataAccessHelper.ExecuteScalar(cmd);
        }

        /// <summary>
        /// For the given patient's schedule (patient schema's timeline), update the Scheduled, First Anticipated and Last Anticpated
        /// dates based on the patient's OnStudyDate.
        /// Visits with status "Performed" will not be scheduled(updated).
        /// </summary>
        /// <param name="patientSchemaId"></param>
        /// <param name="username"></param>
        public static void UpdatePatientTimeline(int patientSchemaId, string username)
        {
            string update_sql = GetUpdateTimelineSQL(username, "PatientSchemaId");
            SqlCommand cmd = DataAccessHelper.CreateSqlCommand(update_sql);

            DataAccessHelper.AddIntInputParam(cmd, "PatientSchemaId", patientSchemaId);
            DataAccessHelper.AddStringInputParam(cmd, "UpdatedBy", username);
            DataAccessHelper.AddDateTimeInputParam(cmd, "UpdatedTime", DateTime.Now);

            DataAccessHelper.ExecuteScalar(cmd);
        }


        private static string GetUpdateTimelineSQL(string username, params string[] restrictions)
        {
            string sql_format =
          @"
/*
 For the given patient, sync their scheduled based on On Study Date
*/


UPDATE pi
	SET
		pi.ScheduledDate = Updated_ScheduledDate,
		pi.FirstAnticipatedDate = Calc_First,
		pi.LastAnticipatedDate = Calc_Last,
		pi.UpdatedBy = @UpdatedBy,
		pi.UpdatedTime = @UpdatedTime
/*
SELECT
    [Status],
    ScheduledDate,
	[Updated_ScheduledDate],
    FirstAnticipatedDate,
	[Calc_First],
    LastAnticipatedDate,
	[Calc_Last]
*/
FROM
(
    SELECT
	    pi.PatientItemId,
	    ISNULL([Updated_ScheduledDate], [Calc_ScheduledDate]) AS Updated_ScheduledDate,	
	    Calc_First,	
	    Calc_Last,
	    @UpdatedBy AS [UpdatedBy],
	    @UpdatedTime AS [UpdatedTime]
    FROM ProtocolMgr_PatientItems pi
    INNER JOIN
    (
	    SELECT
		    PatientItemId,
		    OnStudyDate,
		    Updated_ScheduledDate,
		    DATEADD(DAY, 0 - [shift_buffer_plus], [Calc_Last]) AS [Calc_ScheduledDate],
		    [Calc_First],
		    [Calc_Last]	
	    FROM
	    (
		    SELECT
		    a.PatientItemId,
		    -- calc scheduled date
		    a.OnStudyDate,
		    -- anticipated visits can be scheduled
		    CASE WHEN [Status] IS NOT NULL AND [Status] NOT IN ('Anticipated') THEN a.ScheduledDate ELSE NULL END AS [Updated_ScheduledDate],
		    DATEADD(DAY, (NumberOfUnits * shiftdays) - (BufferNumberOfUnitsMinus * shift_buffer) + [shift_offset], OnStudyDate) AS [Calc_First],
		    DATEADD(DAY, (NumberOfUnits * shiftdays) + (BufferNumberofUnitsPlus * [shift_buffer]) + [shift_offset], OnStudyDate) AS [Calc_Last],
		    BufferNumberofUnitsPlus * [shift_buffer] AS [shift_buffer_plus]
		    FROM
		    (
			    SELECT				
				    pi.PatientItemId,
				    a.OnStudyDate,
				    pi.ScheduledDate,
				    pi.FirstAnticipatedDate,
				    pi.LastAnticipatedDate,
				    pi.Status,
				    t.DisplayUnitName,
				    t.NumberOfUnits,
				    t.BufferUnitName,
				    t.BufferNumberOfUnitsMinus,
				    t.BufferNumberOfUnitsPlus,
				    CASE DisplayUnitName
					    WHEN 'Day' THEN 1
					    WHEN 'Week' THEN 7
					    WHEN 'Month' THEN 28
					    ELSE 0
				    END AS [shiftdays], 
				    CASE BufferUnitName
					    WHEN 'Day' THEN 1
					    WHEN 'Week' THEN 7
					    WHEN 'Month' THEN 28
					    ELSE 0
				    END	AS [shift_buffer],
				    CASE DisplayUnitName WHEN 'Day' THEN -1 ELSE 0 END AS [shift_offset]
			    FROM 
			    (
			    SELECT
				    pp.PatientId,
				    pps.PatientSchemaId,
				    pp.PatientProtocolId,
				    MAX(pp_status.PtProtocolStatusDate) AS [OnStudyDate]
			    FROM ProtocolMgr_PatientSchemas pps
			    INNER JOIN ProtocolMgr_ProtocolSchemas ps
				    ON pps.ProtocolSchemaId = ps.ProtocolSchemaId
			    INNER JOIN ProtocolMgr_ProtocolVersions pv
				    ON ps.ProtocolVersionId = pv.ProtocolVersionId
			    INNER JOIN Protocols p
				    ON p.ProtocolId = pv.ProtocolId
			    INNER JOIN PatientProtocols pp
				    ON pps.PatientId = pp.PatientId AND p.ProtocolId = pp.ProtocolId
			    INNER JOIN PatientProtocolStatus pp_status
				    ON pp.PatientProtocolId = pp_status.PatientProtocolId
			    WHERE
				    {0}
				    pp_status.PtProtocolStatusDate IS NOT NULL
				    AND
				    pp_status.PtProtocolStatus = 'On Study'
			    GROUP BY
				    pp.PatientId,
				    pps.PatientSchemaId,
				    pp.PatientProtocolId
			    ) a
			    INNER JOIN ProtocolMgr_PatientItems pi
				    ON a.PatientSchemaId = pi.PatientSchemaId
			    INNER JOIN ProtocolMgr_ItemTimeline it
				    ON pi.ItemTimelineId = it.ItemTimelineId
			    INNER JOIN ProtocolMgr_Timeline t
				    ON it.TimelineId = t.TimelineId
			    WHERE
                    {1}
				    (t.ItemIntervalType IS NULL OR ItemIntervalType NOT LIKE '%Dependent%')
		    ) a
	    ) a
    ) a
    ON pi.PatientItemId = a.PatientItemId
) a
-- join original items back to computed values
INNER JOIN ProtocolMgr_PatientItems pi
	ON a.PatientItemId = pi.PatientItemId
-- restrictions
WHERE
	-- exclude 'Performed' visits
	--([Status] IS NULL OR [Status] NOT IN ('Performed','Completed') )
	-- restrict to scheduled visits
	--AND
    ScheduledDate IS NOT NULL
	AND FirstAnticipatedDate IS NOT NULL
	AND	LastAnticipatedDate IS NOT NULL
	-- restrict calc date
	AND Updated_ScheduledDate IS NOT NULL
	-- restrict to those where value changed
	AND
	(
		ScheduledDate <> [Updated_ScheduledDate]
		OR
		FirstAnticipatedDate <> [Calc_First]
		OR
		LastAnticipatedDate <> [Calc_Last]
	)
";

            string schemaRestrictionSQL = "";
            string timelineSQL = "";
            // update patient timeline
            if (restrictions.Contains("PatientSchemaId"))
            {
                schemaRestrictionSQL = "pps.PatientSchemaId = @PatientSchemaId AND";
            }
            else if (restrictions.Contains("ProtocolSchemaId"))
            {
                schemaRestrictionSQL = "ps.ProtocolSchemaId = @ProtocolSchemaId AND";
            }
            // update all patients on timeline
            if (restrictions.Contains("TimelineId"))
            {
                timelineSQL = " t.TimelineId = @TimelineId AND ";
            }
            return string.Format(sql_format, schemaRestrictionSQL, timelineSQL);
        }


        #endregion

        /// <summary>
        /// Normalizes FieldRowIndex (0-n) for each table in schema item
        /// </summary>
        /// <param name="schemaItemId"></param>
        /// <param name="username"></param>
        public static void FixSchemaItemIndexes(int schemaItemId, string username)
        {
            string sql =
@"
UPDATE sif
	SET
		FieldRowIndex = b.Calc_FieldRowIndex,
		UpdatedBy = @UpdatedBy,
		UpdatedTime = @UpdatedTime
FROM ProtocolMgr_SchemaItemFields sif
INNER JOIN
(
	SELECT
		sif.SchemaItemFieldId,
		sif.FieldRowIndex,
		DisplayOrder,
		sif.DestTable,
		ROW_NUMBER() OVER (PARTITION BY DestTable, DisplayOrder ORDER BY FieldRowIndex) - 1 AS Calc_FieldRowIndex
	FROM ProtocolMgr_SchemaItemFields sif
	INNER JOIN ProtocolMgr_SchemaItems si
	ON sif.SchemaItemId = si.SchemaItemId
	WHERE
		si.SchemaItemId = @SchemaItemId
		AND
		sif.FieldRowIndex IS NOT NULL
) b
	ON sif.SchemaItemFieldId = b.SchemaItemFieldId
WHERE
	sif.FieldRowIndex <> b.Calc_FieldRowIndex
";
            SqlCommand cmd = DataAccessHelper.CreateSqlCommand(sql);
            DataAccessHelper.AddIntInputParam(cmd, "SchemaItemId", schemaItemId);
            DataAccessHelper.AddStringInputParam(cmd, "UpdatedBy", username);
            DataAccessHelper.AddDateTimeInputParam(cmd, "UpdatedTime", DateTime.Now);
            DataAccessHelper.ExecuteScalar(cmd);
        }
    }

    public class ProtocolMgmtTimelineService
    {
        /// <summary>
        /// 
        /// </summary>
        /// <param name="protocolSchemaId"></param>
        /// <param name="username"></param>
        public static void FixSchema(int protocolSchemaId, string username)
        {
            // fix missing schema items
            ProtocolMgmtDa.ScheduleNewPatientItems(protocolSchemaId, username);
            // update schedules for all patients
            ProtocolMgmtDa.UpdateSchemaTimeline(protocolSchemaId, username);
            // for each patient, fix schedules (inclues dependent items)
            SqlCommand cmd = DataAccessHelper.CreateSqlCommand("SELECT DISTINCT PatientSchemaId FROM ProtocolMgr_PatientSchemas WHERE ProtocolSchemaId = @ProtocolSchemaId");
            DataAccessHelper.AddIntInputParam(cmd, "ProtocolSchemaId", protocolSchemaId);
            List<int> patientSchemaIds = Connectivity.GetPrimitiveValues<int>(cmd, "PatientSchemaId");
            foreach (int patientSchemaId in patientSchemaIds)
            {
                // will manually update special dependency fix
                FixPatientSchema(patientSchemaId, username, false);
            }
            ProtocolMgmtDa.FixDependentItemTimelineByStatuses(username, "ProtocolSchemaId", protocolSchemaId);
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="patientSchemaId"></param>
        /// <param name="username"></param>
        public static void FixPatientSchema(int patientSchemaId, string username)
        {
            FixPatientSchema(patientSchemaId, username, true);
        }

        private static void FixPatientSchema(int patientSchemaId, string username, bool fixStatusVisits)
        {
            ProtocolMgmtDa.UpdatePatientTimeline(patientSchemaId, username);
            ProtocolMgmtDa.ScheduleAllDependentPatientItems(patientSchemaId, username);
            if (fixStatusVisits)
            {
                ProtocolMgmtDa.FixDependentItemTimelineByStatuses(username, "PatientSchemaId", patientSchemaId);
            }
        }
    }
}
