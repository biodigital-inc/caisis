--Config (3507)
--DECLARE @Dataset varchar(50)
--DECLARE @ProtocolDept varchar(50)
--DECLARE @FromDate DateTime
--DECLARE @ToDate DateTime
--SET @Dataset = ''
--SET @ProtocolDept = ''
--SET @FromDate = NULL
--SET @ToDate = NULL

SELECT PtMRN, ProtocolNum Protocol, 
	   CONVERT(CHAR(10),ConsentDate,101) [Consent Date], 
	   ProtocolDept Department, DatasetList Datasets, Issue
FROM
(
   SELECT PtMRN, ProtocolNum, ConsentDate, 
          Issue, ProtocolDept,
          LTRIM(SUBSTRING(InstitutionSummary,2,LEN(InstitutionSummary))) DatasetList
   FROM
   (
      SELECT a.PtMRN, e.PatientId, d.ProtocolNum, b.PtProtocolStatusDate ConsentDate,
             a.SourceData Issue, d.ProtocolDept, MIN(e.EnteredTime) MinEnteredTime
      FROM
      (
      SELECT * 
      FROM ALL_DataFeed_DataDiscrepancies
      WHERE TableName = 'PatientProtocolStatus'
      ) a INNER JOIN 
        ALL_PatientProtocolStatus b ON a.CurrentData = b.PatientProtocolStatusId INNER JOIN 
        ALL_PatientProtocols c ON b.PatientProtocolId = c.PatientProtocolId INNER JOIN 
        ALL_Protocols d ON c.ProtocolId = d.ProtocolId INNER JOIN
        ALL_PatientInstitutions e ON c.PatientId=e.PatientId INNER JOIN
        ALL_Institutions f ON e.InstitutionId=f.InstitutionId  
		INNER JOIN @Patients ON c.PatientId = Patients.PatientId
      GROUP BY a.PtMRN, e.PatientId, d.ProtocolNum, b.PtProtocolStatusDate,
               a.SourceData, d.ProtocolDept
   ) a INNER JOIN 
       ALL_PatientInstitutions b ON a.PatientId = b.PatientId AND
                                    a.MinEnteredTime = b.EnteredTime INNER JOIN 
       ALL_Institutions c ON b.InstitutionId=c.InstitutionId
       INNER JOIN 
         (
            SELECT *,
                   CASE WHEN MSKUrology = 'Yes' THEN ', Urology' ELSE '' END +
                   CASE WHEN MSKPancreas = 'Yes' THEN ', Pancreas' ELSE '' END +
                   CASE WHEN MSKColorectal = 'Yes' THEN ', Colorectal' ELSE '' END +
                   CASE WHEN MSKHeadNeck = 'Yes' THEN ', HeadNeck' ELSE '' END +  
                   CASE WHEN MSKBreast = 'Yes' THEN ', Breast' ELSE '' END +
                   CASE WHEN MSKGastric = 'Yes' THEN ', Gastric' ELSE '' END +
                   CASE WHEN MSKGYN = 'Yes' THEN ', GYN' ELSE '' END +
                   CASE WHEN MSKLeukemia = 'Yes' THEN ', Leukemia' ELSE '' END +
                   CASE WHEN MSKSRS = 'Yes' THEN ', SRS' ELSE '' END +
                   CASE WHEN MSKOrthopedics = 'Yes' THEN ', Orthopedics' ELSE '' END +
                   CASE WHEN MSKNeuro = 'Yes' THEN ', Neuro' ELSE '' END +
                   CASE WHEN MSKThoracic = 'Yes' THEN ', Thoracic' ELSE '' END +
                   CASE WHEN MSKGMT = 'Yes' THEN ', GMT' ELSE '' END +
                   CASE WHEN MSKPedsNeuro = 'Yes' THEN ', PedsNeuro' ELSE '' END
                   AS InstitutionSummary
            FROM 
            (
               SELECT DISTINCT b.PatientId,'Yes' Value, 
                               CASE WHEN a.Institution = 'MSK'    
                                       THEN 'MSKUrology'
                                       ELSE a.Institution  
                               END Institution
               FROM ALL_Institutions a INNER JOIN 
                    ALL_PatientInstitutions b ON a.InstitutionId=b.InstitutionId
               WHERE a.Institution LIKE 'MSK%'
            ) AS SourceTable
            PIVOT
            (
               MAX(Value)
               FOR Institution IN ([MSKUrology],[MSKPancreas],[MSKColorectal],[MSKHeadNeck],
                                   [MSKBreast],[MSKGastric],[MSKGyn],[MSKLeukemia],
                                   [MSKSRS],[MSKOrthopedics],[MSKNeuro],
                                   [MSKThoracic],[MSKGMT],[MSKPedsNeuro])
            ) AS PivotTable
         ) d ON a.PatientId=d.PatientId
      INNER JOIN
         (
            SELECT b.PatientId, COUNT(*) NumInstitutions
            FROM ALL_Institutions a INNER JOIN 
                 ALL_PatientInstitutions b ON a.InstitutionId=b.InstitutionId
            WHERE a.Institution LIKE 'MSK%'
            GROUP BY b.PatientId
         ) e ON a.PatientId = e.PatientId
) a
WHERE DataSetList LIKE '%' + @Dataset + '%' AND
      ProtocolDept LIKE '%' + @ProtocolDept + '%' AND
	  ConsentDate BETWEEN CASE WHEN NULLIF(@FromDate,'') IS NULL 
								THEN CAST(0 as DATETIME)
							   ELSE @FromDate 
						  END AND
						  CASE WHEN NULLIF(@ToDate,'') IS NULL 
								THEN GETDATE()
							   ELSE @ToDate 
						  END 
ORDER BY ConsentDate DESC