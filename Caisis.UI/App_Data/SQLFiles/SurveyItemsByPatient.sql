-- DECLARE @SurveyType varchar(255)
-- DECLARE @PtMRN varchar(50)
DECLARE @dynamic_columns varchar(8000)
DECLARE @query varchar(8000)

-- DROP TABLE #TempItemNums

SELECT DISTINCT SUBSTRING(COALESCE(SurveyItemNum, SurveyItem), 0, 128) 
	AS SurveyItemName
INTO #TempItemNums
FROM MSK_SurveyItems
	INNER JOIN MSK_Surveys
		ON MSK_SurveyItems.SurveyId = MSK_Surveys.SurveyId
WHERE SurveyType = @SurveyType

SELECT
	@dynamic_columns =
	STUFF(
		(SELECT ',[' + #TempItemNums.SurveyItemName + ']'
		FROM #TempItemNums
		ORDER BY LEN(#TempItemNums.SurveyItemName), #TempItemNums.SurveyItemName
		FOR XML PATH('')),
		1, 1, '')
		
SET @query =
'SELECT *
FROM
(
	SELECT 
		MSK_Surveys.PatientId,
		PtMRN,
		MSK_Surveys.SurveyId,
		SurveyDate,
		SurveyType,
		MSK_Surveys.EnteredBy,
		MSK_Surveys.EnteredTime,
		SUBSTRING(COALESCE(SurveyItemNum, SurveyItem), 0, 128) 
			AS SurveyItemName,
		SurveyItemResult
	FROM
		MSK_Surveys
			INNER JOIN MSK_Patients
				ON MSK_Surveys.PatientId = MSK_Patients.PatientId
				AND MSK_Patients.PtMRN = ''' + @PtMRN + '''
			INNER JOIN MSK_SurveyItems
				ON MSK_Surveys.SurveyId = MSK_SurveyItems.SurveyId
	WHERE
		MSK_Surveys.SurveyType = ''' + @SurveyType + '''
) AS P
PIVOT
(
	MIN(SurveyItemResult)
	FOR SurveyItemName IN (' + @dynamic_columns + ')
) AS PVT
ORDER BY
	1, 4, 7'

EXEC(@query)