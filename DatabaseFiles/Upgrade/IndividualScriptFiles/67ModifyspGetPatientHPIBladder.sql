SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
ALTER PROCEDURE [dbo].[spGetPatientHPIBladder]
   @PatientId int = NULL,
   @Rowcount int = NULL OUTPUT
AS
SET NOCOUNT ON
--Default Missing Values
DECLARE @MISSING_NUMBER int
DECLARE @MISSING_DATE   datetime

/*
SET @MISSING_NUMBER = -999
SET @MISSING_DATE = '1899-12-30 00:00:00.000'

DECLARE @SortTable TABLE
--Temp Table used to force the HPI to sort in an order 
   (
   SortDate     datetime NULL,
   VarString    varchar(255) NULL
   )
*/
DECLARE @ChronoTable TABLE
--Add single compound index on SortDate, VarName, VarSummary
   (
   ChronoId     int NOT NULL Identity(1,1) PRIMARY KEY,
   VarDate      varchar(50) NULL,
   VarName      varchar(50) NULL,
   VarSummary   varchar(1000) NULL,
   Quality      varchar(50) NULL,
   SortDate     datetime,
   TableName    varchar(50) NULL,
   PrimaryKey   int NOT NULL,
   VarStopDate  varchar(50) NULL,
   ExtraInfo    varchar(500) NULL,
   RelatedProcId int NULL
   )

--LookupCodes cached and reused throughtout algorithm.
DECLARE @Codes TABLE
	(
	LkpCode varchar(255) NOT NULL,
   AttributeValue varchar(50) NOT NULL,
   PRIMARY KEY CLUSTERED (LkpCode, AttributeValue)
	)

INSERT INTO @Codes (LkpCode,AttributeValue)
SELECT DISTINCT LkpCode,AttributeValue
FROM LookupCodes a INNER JOIN 
     LookupCodeAttributes b ON a.LookupCodeId=b.LookupCodeId INNER JOIN
     LookupAttributes c ON b.AttributeId=c.AttributeId
WHERE LkpFieldName = 'HPI_Algorithm' AND
      AttributeName = 'HPI_Bladder'
ORDER BY AttributeValue, LkpCode

INSERT @ChronoTable (VarDate,VarName,VarSummary,Quality,SortDate,VarStopDate,TableName,PrimaryKey,ExtraInfo)
SELECT MedTxDateText, MedTxType, MedTxAgent + ISNULL(' (' +  MedTxCycle + ' Cycles) ','') , MedTxQuality, MedTxDate,MedTxStopDateText, 'MedicalTherapy', MedicalTherapyId,
       CASE WHEN LkpCode IS NOT NULL THEN 'Intravesical'
            ELSE 'Systemic'
       END
FROM MedicalTherapy LEFT OUTER JOIN 
     @Codes Codes ON MedTxAgent = LkpCode AND AttributeValue = 'IntravesicalMedTx' 
WHERE PatientId = @PatientId

INSERT @ChronoTable (VarDate,VarName,VarSummary,Quality,SortDate,TableName,PrimaryKey,RelatedProcId,ExtraInfo)
SELECT ProcDateText,ProcName, ISNULL(UD_ProcName+' ',''),
       ProcQuality, ProcDate, 'Procedures', Procedures.ProcedureId, UD_ProcedureId, 'ProcCystectomy'
FROM Procedures LEFT OUTER JOIN (
                                SELECT OperatingRoomDetailId, MAX(ProcedureId) AS UD_MAX_ProcedureId
                                FROM Procedures INNER JOIN 
                                     @Codes Codes ON ProcName = LkpCode AND AttributeValue = 'UrinaryDiversion'     
                                WHERE PatientId=@PatientId
                                GROUP BY OperatingRoomDetailId 
                                ) AS MaxUD ON Procedures.OperatingRoomDetailId = MaxUD.OperatingRoomDetailId 
                LEFT OUTER JOIN (
                                SELECT ProcName AS UD_ProcName,ProcedureId AS UD_ProcedureId
                                FROM Procedures 
                                WHERE PatientId=@PatientId
                                ) AS UrinaryDiversions ON UrinaryDiversions.UD_ProcedureId = MaxUD.UD_MAX_ProcedureId
                INNER JOIN @Codes Codes ON ProcName = LkpCode AND AttributeValue = 'Cystectomy'    
WHERE Procedures.PatientId = @PatientId

INSERT @ChronoTable (VarDate,VarName,VarSummary,Quality,SortDate,TableName,PrimaryKey,RelatedProcId,ExtraInfo)
SELECT ProcDateText,'Bladder Path: ',
       LTRIM(
       + ISNULL(PathStageT+' ','') + ISNULL(PathStageM+' ','') + ISNULL(PathGrade+' ','') 
       + ISNULL(PathHistology+' ','') + ISNULL('Margin:'+PathBladderMargin+' ','')
       + ISNULL('Prostate Inv:'+PathProstateInv+' ',''))
       + ISNULL('Nodes:' + dbo.fnGetNodeRatio(Procedures.OperatingRoomDetailId,ISNULL(Pathology.PathQuality,ProcQuality)),'')
       , ISNULL(Pathology.PathQuality,ProcQuality), ProcDate, 'Pathology', Pathology.PathologyId, Procedures.ProcedureId, 'PathCystectomy'
FROM Procedures INNER JOIN Pathology ON Pathology.ProcedureId = Procedures.ProcedureId 
                LEFT OUTER JOIN PathologyStageGrade ON Pathology.PathologyId = PathologyStageGrade.PathologyId
                LEFT OUTER JOIN ProstatectomyPath ON Pathology.PathologyId = ProstatectomyPath.PathologyId
                LEFT OUTER JOIN CystectomyPath ON Pathology.PathologyId = CystectomyPath.PathologyId
                INNER JOIN @Codes Codes ON ProcName = LkpCode AND AttributeValue = 'Cystectomy'
WHERE Procedures.PatientId = @PatientId AND 
      ProstatectomyPath.PathologyId IS NULL

INSERT @ChronoTable (VarDate,VarName,VarSummary,Quality,SortDate,TableName,PrimaryKey,ExtraInfo)
SELECT ProcDateText, 'Prostate Path: ', 
       LTRIM(ISNULL(PathHistology+' ','') + ISNULL(PathStageT+' ',''))
       + dbo.fnSummaryRP(PathGG1,PathGG2,PathGGS,PathMargin,PathExtension,PathSV_Inv,Procedures.OperatingRoomDetailId,ISNULL(Pathology.PathQuality,ProcQuality)), 
       ISNULL(Pathology.PathQuality,ProcQuality), ProcDate,  
       CASE WHEN Pathology.PathologyId IS NOT NULL THEN 'Pathology' ELSE 'Procedures' END, ISNULL(Pathology.PathologyId,Procedures.ProcedureId), 'PathProstatectomy'
FROM Procedures LEFT OUTER JOIN Pathology ON Pathology.ProcedureId = Procedures.ProcedureId 
                LEFT OUTER JOIN ProstatectomyPath ON ProstatectomyPath.PathologyId = Pathology.PathologyId
                LEFT OUTER JOIN PathologyStageGrade ON Pathology.PathologyId = PathologyStageGrade.PathologyId
                INNER JOIN @Codes Codes ON ProcName = LkpCode AND AttributeValue = 'Prostatectomy'
WHERE Procedures.PatientId = @PatientId AND
      (ProstatectomyPath.PathologyId IS NOT NULL OR 
       PathSite IN(SELECT LkpCode FROM @Codes WHERE AttributeValue = 'SiteProstate'))

INSERT @ChronoTable (VarDate,VarName,VarSummary,Quality,SortDate,TableName,PrimaryKey)
SELECT ProcDateText,'Orchiectomy', LTRIM(ISNULL(ProcSide,'') + ' ' + ISNULL(ProcApproach,'')), ProcQuality, ProcDate,'Procedures', Procedures.ProcedureId
FROM Procedures INNER JOIN @Codes Codes ON ProcName = LkpCode AND AttributeValue = 'Orchiectomy'
WHERE Procedures.PatientId = @PatientId

INSERT @ChronoTable (VarDate,VarName,VarSummary,Quality,SortDate,TableName,PrimaryKey)
SELECT ProcDateText, '', LTRIM(ISNULL(ProcSide + ' ','')  + ISNULL(ProcName,'') + ISNULL(' ' + PathHistology,'')), ProcQuality, ProcDate, 'Procedures',Procedures.ProcedureId
FROM Procedures INNER JOIN @Codes Codes ON ProcName = LkpCode AND AttributeValue = 'Nephrectomy'
                LEFT OUTER JOIN Pathology ON Pathology.ProcedureId = Procedures.ProcedureId 
WHERE Procedures.PatientId = @PatientId

--Show all TUR% with the Path results or any other endoscopies that have a result of Fulguration
INSERT @ChronoTable (VarDate,VarName,VarSummary,Quality,SortDate,TableName,PrimaryKey,ExtraInfo)
SELECT ProcDateText, ISNULL(ProcName,'Endoscopy'), LTRIM(ISNULL(PathStageT + ' ','') + ISNULL(PathGrade + ' ' ,'') + ISNULL(PathResult,'')), ISNULL(Pathology.PathQuality,ProcQuality), ProcDate, 'Procedures', Procedures.ProcedureId
       , CASE WHEN PathResult LIKE '%Positive%' OR PathHistology IS NOT NULL THEN 'PathPositive' END
FROM Procedures LEFT OUTER JOIN Pathology ON Procedures.ProcedureId = Pathology.ProcedureId
                LEFT OUTER JOIN PathologyStageGrade ON Pathology.PathologyId = PathologyStageGrade.PathologyId
                LEFT OUTER JOIN @Codes Codes ON ProcName = LkpCode AND AttributeValue = 'TUR'
WHERE (Procedures.PatientId = @PatientId) AND 
      (LkpCode IS NOT NULL OR 
       PathResult IN(SELECT LkpCode FROM @Codes WHERE AttributeValue = 'TURFulguration'))

--put in the last 3 endoscopies that are not already in
INSERT @ChronoTable (VarDate,VarName,VarSummary,Quality,SortDate,TableName,PrimaryKey)
SELECT TOP 3 ProcDateText, ISNULL(ProcName,'Endoscopy'), LTRIM(ISNULL(PathGrade + ' ' ,'') + ISNULL(PathResult,'')), ISNULL(b.PathQuality,ProcQuality), ProcDate, 'Procedures', a.ProcedureId
FROM Procedures a LEFT OUTER JOIN Pathology b ON a.ProcedureId = b.ProcedureId AND
                    ISNULL(b.PathSpecimenType,'') NOT IN(SELECT LkpCode FROM @Codes 
                                                         WHERE AttributeValue = 'CytologySpecimen')
                  LEFT OUTER JOIN PathologyStageGrade c ON b.PathologyId = c.PathologyId
                  LEFT OUTER JOIN 
                  (SELECT PrimaryKey FROM @ChronoTable WHERE TableName = 'Procedures') AS d
                   ON a.ProcedureId = d.PrimaryKey
                  INNER JOIN @Codes Codes ON ProcName = LkpCode AND AttributeValue = 'Endoscopy'
WHERE a.PatientId = @PatientId AND d.PrimaryKey IS NULL 
ORDER BY ProcDate DESC

INSERT @ChronoTable (VarDate,VarName,VarSummary,Quality,SortDate,TableName,PrimaryKey)
SELECT ProcDateText, 'RPLND', LTRIM(ISNULL(ProcApproach,'') + ' ' + ' ' + ISNULL(PathHistology,'') + ' ' + ISNULL(PathStageN,'') + ' ' +  ISNULL(PathStageM,'')),
       ProcQuality, ProcDate,'Procedures', Procedures.ProcedureId
FROM Procedures LEFT OUTER JOIN Pathology ON Pathology.ProcedureId = Procedures.ProcedureId 
                LEFT OUTER JOIN PathologyStageGrade ON Pathology.PathologyId = PathologyStageGrade.PathologyId
                INNER JOIN @Codes Codes ON ProcName = LkpCode AND AttributeValue = 'RPLND'
WHERE Procedures.PatientId = @PatientId

--non prostate biopsies
INSERT @ChronoTable (VarDate,VarName,VarSummary,Quality,SortDate,TableName,PrimaryKey)
SELECT ProcDateText, 'Biopsy', LTRIM(ISNULL(ProcSide,'') + ' ' + ISNULL(ProcName,'') + ' ' + ISNULL(PathHistology,'') + ' ' + ISNULL(PathResult,'')), ISNULL(PathQuality,ProcQuality), ProcDate, 'Procedures', Procedures.ProcedureId
FROM Procedures LEFT OUTER JOIN Pathology ON Procedures.ProcedureId = Pathology.ProcedureId
                INNER JOIN @Codes Codes ON ProcName = LkpCode AND AttributeValue = 'BiopsyNonProstate'
WHERE Procedures.PatientId = @PatientId 
AND (Procedures.ProcedureId NOT IN
     (
      SELECT ProcedureId
      FROM Procedures INNER JOIN @Codes Codes ON ProcName = LkpCode AND AttributeValue = 'BiopsyProstate'
      WHERE PatientId = @PatientId AND 
            ProcSite IN(SELECT LkpCode FROM @Codes WHERE AttributeValue = 'SiteProstate')
     ))

--procedures not in the current list exclude prostate biopsies, endoscopies and already included urinary diverion record
INSERT @ChronoTable (VarDate,VarName,VarSummary,Quality,SortDate,TableName,PrimaryKey)
SELECT ProcDateText, ProcName, LTRIM(ISNULL(RIGHT(PathStageSystem,2),'') + ' '  + ISNULL(PathStageT,'') + ' ' + ISNULL(PathStageN,'') + ISNULL(PathStageM,'') + ' ' + ISNULL(PathHistology,'') + ' ' + ISNULL(PathResult,'')), ISNULL(Pathology.PathQuality,ProcQuality), ProcDate, 'Procedures', Procedures.ProcedureId
FROM Procedures LEFT OUTER JOIN Pathology ON Procedures.ProcedureId = Pathology.ProcedureId
                LEFT OUTER JOIN PathologyStageGrade ON Pathology.PathologyId = PathologyStageGrade.PathologyId
                LEFT OUTER JOIN 
                (SELECT PrimaryKey,VarName,ExtraInfo FROM @ChronoTable WHERE TableName = 'Procedures') AS b
                ON Procedures.ProcedureId = b.PrimaryKey
                LEFT OUTER JOIN @Codes BiopsyProstate ON ProcName = BiopsyProstate.LkpCode AND BiopsyProstate.AttributeValue = 'BiopsyProstate'
                LEFT OUTER JOIN @Codes Endoscopy ON ProcName = Endoscopy.LkpCode AND Endoscopy.AttributeValue = 'Endoscopy'
WHERE Procedures.PatientId = @PatientId AND b.PrimaryKey IS NULL AND
      BiopsyProstate.LkpCode IS NULL AND Endoscopy.LkpCode IS NULL AND
      Procedures.ProcedureId NOT IN (SELECT RelatedProcId FROM @ChronoTable WHERE TableName='Procedures' AND ExtraInfo = 'ProcCystectomy')

--Add in cytology side by side comparison first by PK then by date
UPDATE @ChronoTable 
   SET VarSummary = VarSummary +  ' / ' + PathSpecimenType + ' ' + PathResult
FROM @ChronoTable a INNER JOIN 
     Pathology b ON a.PrimaryKey = b.ProcedureId AND
                    b.PathSpecimenType IN(SELECT LkpCode FROM @Codes 
                                          WHERE AttributeValue = 'CytologySpecimen')
WHERE b.PatientId = @PatientId AND
      VarName IN('Cystoscopy','Endoscopy') AND
      b.PathResult IS NOT NULL

UPDATE @ChronoTable 
   SET VarSummary = VarSummary +  ' / ' + PathSpecimenType + ' ' + PathResult
FROM @ChronoTable a INNER JOIN Pathology b ON b.PatientId = @PatientId AND
                                              a.SortDate = b.PathDate AND
                                              b.PathSpecimenType = 'Cytology' AND
                                              a.PrimaryKey <> b.ProcedureId
WHERE b.PatientId = @PatientId AND
      VarName IN('Cystoscopy','Endoscopy') AND
      b.PathResult IS NOT NULL

--Clean up columns
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

--Remove PLND records that are on the same date as cystectomy because the nodes are already displayed
DELETE @ChronoTable FROM @ChronoTable a INNER JOIN 
                           (
                           SELECT SortDate FROM @ChronoTable
                           WHERE TableName='Procedures' AND ExtraInfo = 'ProcCystectomy'
                           ) b ON a.SortDate = b.SortDate
WHERE TableName='Procedures' AND VarName='PLND'  

SELECT LTRIM(VarDate 
            + CASE WHEN VarStopDate IS NULL THEN ' ' ELSE ' - ' + VarStopDate + ' ' END 
            --Remove duplicate Labeling
            + CASE WHEN CHARINDEX (VarName,VarSummary) <> 0 THEN '' ELSE VarName + ' ' END 
            + VarSummary) AS PatientHPI,VarName,VarDate,ExtraInfo--, TableName,PrimaryKey,SortDate
FROM @ChronoTable 
ORDER BY SortDate, ChronoId
SET @Rowcount = @@ROWCOUNT
GO


