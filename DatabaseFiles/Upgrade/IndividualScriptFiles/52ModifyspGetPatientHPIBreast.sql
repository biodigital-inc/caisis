SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
ALTER PROCEDURE [dbo].[spGetPatientHPIBreast]
   @PatientId int = NULL,
   @Rowcount int = NULL OUTPUT
AS

SET NOCOUNT ON

--temp table structure
DECLARE @ChronoTable TABLE
   (
   RowId        int NOT NULL Identity(1,1) PRIMARY KEY,
   VarDate      varchar(50) NULL,
   VarName      varchar(50) NULL,
   VarSummary   varchar(1000) NULL,
   Quality      varchar(50) NULL,
   SortDate     datetime,
   TableName    varchar(50) NULL,
   PrimaryKey   int NOT NULL,
   RelatedRowId int NULL,
   VarStopDate  varchar(50) NULL
   --ExtraInfo    varchar(500) NULL
   )

--medical therapies
INSERT @ChronoTable (VarDate,VarName,VarSummary,Quality,SortDate,VarStopDate,TableName,PrimaryKey)
SELECT MedTxDateText, MedTxType, MedTxAgent, MedTxQuality, MedTxDate,MedTxStopDateText, 'MedicalTherapy', MedicalTherapyId
FROM MedicalTherapy
WHERE MedicalTherapy.PatientId = @PatientId

--clinical stages
INSERT @ChronoTable (VarDate,VarName,VarSummary,Quality,SortDate,TableName,PrimaryKey)SELECT ClinStageDateText, '', LTRIM(ISNULL(ClinStageSide,'') + ' ' + ISNULL(ClinStageT,'')), ClinStageQuality, ClinStageDate, 'ClinicalStages', ClinicalStageId
FROM ClinicalStages
WHERE (ClinicalStages.PatientId = @PatientId AND ClinStageDisease='Breast')

--main procedure and associated pathology, grade
INSERT @ChronoTable (VarDate,VarName,VarSummary,Quality,SortDate,TableName,PrimaryKey)
SELECT DISTINCT OpDateText, '', ISNULL(OpCaseSurgeon + ' ',''), OpQuality, OpDate, 'OperatingRoomDetails', a.OperatingRoomDetailId
FROM OperatingRoomDetails a INNER JOIN Procedures b ON a.OperatingRoomDetailId = b.OperatingRoomDetailId
WHERE b.PatientId = @PatientId AND 
      (ProcName LIKE '%Mastectomy%' OR ProcName='Wide Local Excision')

INSERT @ChronoTable (VarDate,VarName,VarSummary,Quality,SortDate,TableName,PrimaryKey,RelatedRowId)
SELECT ProcDateText, '', LTRIM(ISNULL(ProcSide + ' ','') + ISNULL(ProcName,'Breast, unspecified')), 
       ProcQuality, ProcDate, 'Procedures', ProcedureId, OR_RowId
FROM Procedures a INNER JOIN 
     (SELECT PrimaryKey, RowId OR_RowId
      FROM @ChronoTable 
      WHERE TableName = 'OperatingRoomDetails') b ON a.OperatingRoomDetailId = b.PrimaryKey
WHERE a.PatientId = @PatientId AND 
      (ProcName LIKE '%Mastectomy%' OR ProcName='Wide Local Excision')

INSERT @ChronoTable (VarDate,VarName,VarSummary,Quality,SortDate,TableName,PrimaryKey,RelatedRowId)
SELECT PathDateText, '', ISNULL('Histology = ' + PathHistology,''), PathQuality, PathDate, 
      'Pathology', PathologyId, OR_RowId
FROM Pathology a INNER JOIN 
     (SELECT PrimaryKey, RowId ProcRowId
      FROM @ChronoTable 
      WHERE TableName = 'Procedures') b ON a.ProcedureId = b.PrimaryKey INNER JOIN
     Procedures c ON a.ProcedureId = c.ProcedureId INNER JOIN
     (SELECT PrimaryKey, RowId OR_RowId
      FROM @ChronoTable 
      WHERE TableName = 'OperatingRoomDetails') d ON c.OperatingRoomDetailId = d.PrimaryKey
WHERE a.PatientId = @PatientId

INSERT @ChronoTable (VarDate,VarName,VarSummary,Quality,SortDate,TableName,PrimaryKey,RelatedRowId)
SELECT PathDateText, '', 
       ISNULL('TNM-Stage = ' + PathStageT,'') + ISNULL(', ' + PathStageN,'') + ISNULL(', ' + PathStageM,''), 
       a.PathQuality, PathDate, 'PathologyStageGrade', PathologyStageGradeId, OR_RowId
FROM PathologyStageGrade a INNER JOIN 
     (SELECT PrimaryKey, RowId PathRowId
      FROM @ChronoTable 
      WHERE TableName = 'Pathology') b ON a.PathologyId = b.PrimaryKey INNER JOIN
      Pathology c ON a.PathologyId = c.PathologyId INNER JOIN
      Procedures d ON c.ProcedureId = d.ProcedureId INNER JOIN
     (SELECT PrimaryKey, RowId OR_RowId
      FROM @ChronoTable 
      WHERE TableName = 'OperatingRoomDetails') e ON d.OperatingRoomDetailId = e.PrimaryKey
WHERE c.PatientId = @PatientId

--path tests
INSERT @ChronoTable (VarDate,VarName,VarSummary,Quality,SortDate,TableName,PrimaryKey)
SELECT pt.PathDateText, pt.PathTest, pt.PathResult, pt.PathQuality, pt.PathDate, 'PathTest', pt.PathTestId
FROM Pathology p INNER JOIN PathTest pt ON p.PathologyId = pt.PathologyId
WHERE p.PatientId = @PatientId AND PathTest IN ('Her-2 / neu','ER','PR')

--procedures not in the current list and associated pathology, grade
INSERT @ChronoTable (VarDate,VarName,VarSummary,Quality,SortDate,TableName,PrimaryKey)
SELECT ProcDateText, '', ProcName, ProcQuality, ProcDate, 'Procedures', ProcedureId
FROM Procedures a LEFT OUTER JOIN 
                  (SELECT PrimaryKey FROM @ChronoTable WHERE TableName = 'Procedures') AS b
                  ON a.ProcedureId = b.PrimaryKey
WHERE a.PatientId = @PatientId AND b.PrimaryKey IS NULL

INSERT @ChronoTable (VarDate,VarName,VarSummary,Quality,SortDate,TableName,PrimaryKey,RelatedRowId)
SELECT PathDateText, '', 
       LTRIM(ISNULL(RIGHT(PathStageSystem,2),'') + ' '  + ISNULL(PathStageT,'') + ' ' + ISNULL(PathStageN,'') + ISNULL(PathStageM,'')),
       a.PathQuality, PathDate, 'PathologyStageGrade', PathologyStageGradeId, ProcRowId
FROM PathologyStageGrade a INNER JOIN 
     Pathology b ON a.PathologyId=b.PathologyId INNER JOIN
     (SELECT PrimaryKey, RowId ProcRowId
      FROM @ChronoTable 
      WHERE TableName = 'Procedures') c ON b.ProcedureId = c.PrimaryKey
      LEFT OUTER JOIN
      (SELECT PrimaryKey FROM @ChronoTable WHERE TableName = 'PathologyStageGrade') AS d
      ON a.PathologyStageGradeId = d.PrimaryKey
WHERE b.PatientId = @PatientId AND d.PrimaryKey IS NULL

INSERT @ChronoTable (VarDate,VarName,VarSummary,Quality,SortDate,TableName,PrimaryKey,RelatedRowId)
SELECT PathDateText, '', LTRIM(ISNULL(PathHistology,'') + ' ' + ISNULL(PathResult,'')), PathQuality, PathDate, 
      'Pathology', PathologyId, ProcRowId
FROM Pathology a INNER JOIN 
     (SELECT PrimaryKey, RowId ProcRowId
      FROM @ChronoTable 
      WHERE TableName = 'Procedures') b ON a.ProcedureId = b.PrimaryKey
      LEFT OUTER JOIN
      (SELECT PrimaryKey FROM @ChronoTable WHERE TableName = 'Pathology') AS c
      ON a.PathologyId = c.PrimaryKey
WHERE a.PatientId = @PatientId AND c.PrimaryKey IS NULL

--Clean up variables
UPDATE @ChronoTable 
   SET VarName = ''
WHERE VarName IS NULL
UPDATE @ChronoTable 
   SET VarSummary = ''
WHERE VarSummary IS NULL
UPDATE @ChronoTable 
   SET VarDate = ''
WHERE VarDate IS NULL
UPDATE @ChronoTable 
   SET Quality = ''
WHERE Quality IS NULL
UPDATE @ChronoTable 
   SET VarStopDate = ''
WHERE VarStopDate IS NULL

--output resultset
SELECT VarDate, 
      (CASE WHEN VarName<>'' 
             THEN VarName + ' ' 
             ELSE '' 
       END + VarSummary) AS VarSummary,TableName,PrimaryKey,RowId,RelatedRowId
       --,SortDate
FROM @ChronoTable 
ORDER BY SortDate

SET @Rowcount = @@ROWCOUNT
GO
