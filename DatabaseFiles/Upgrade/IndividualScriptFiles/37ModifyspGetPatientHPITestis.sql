SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
ALTER  PROCEDURE [dbo].[spGetPatientHPITestis]
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
   VarName      varchar(100) NULL,
   VarSummary   varchar(1000) NULL,
   Quality      varchar(50) NULL,
   SortDate     datetime,
   TableName    varchar(50) NULL,
   PrimaryKey   int NOT NULL,
   VarStopDate  varchar(50) NULL
   --ExtraInfo    varchar(500) NULL
   )

INSERT @ChronoTable (VarDate,VarName,VarSummary,Quality,SortDate,VarStopDate,TableName,PrimaryKey)
SELECT MedTxDateText, MedTxType, LTRIM(ISNULL(MedTxIndication,'') + ' ' + ISNULL(MedTxIntent,'') + ' ' + ISNULL(MedTxAgent,'') + ' ' + ISNULL('x '+MedTxCycle,'')), MedTxQuality, MedTxDate,MedTxStopDateText, 'MedicalTherapy', MedicalTherapyId
FROM MedicalTherapy
WHERE (MedicalTherapy.PatientId = @PatientId)

INSERT @ChronoTable (VarDate,VarName,VarSummary,Quality,SortDate,VarStopDate,TableName,PrimaryKey)
SELECT RadTxDateText, RadTxType, RadTxTotalDose, RadTxQuality, RadTxDate,RadTxStopDateText, 'RadiationTherapy', RadiationTherapyId
FROM RadiationTherapy
WHERE (RadiationTherapy.PatientId = @PatientId)

INSERT @ChronoTable (VarDate,VarName,VarSummary,Quality,SortDate,TableName,PrimaryKey)
SELECT ProcDateText,'Orchiectomy', LTRIM(ISNULL(ProcSide,'') + ' ' + ISNULL(ProcApproach,'') + ' ' + ISNULL(PathHistology,'') + ' ' + ISNULL(PathStageT,'') + ' ' + ISNULL(PathStageSystem,'')), Pathology.PathQuality, ProcDate,'Procedures', Procedures.ProcedureId
FROM Procedures LEFT OUTER JOIN Pathology ON Pathology.ProcedureId = Procedures.ProcedureId 
                LEFT OUTER JOIN PathologyStageGrade ON Pathology.PathologyId = PathologyStageGrade.PathologyId
WHERE Procedures.PatientId = @PatientId AND ProcName = 'Orchiectomy'

INSERT @ChronoTable (VarDate,VarName,VarSummary,Quality,SortDate,TableName,PrimaryKey)
SELECT ProcDateText, 'RPLND', LTRIM(ISNULL(ProcApproach,'') + ' ' + CASE WHEN ProcDesperation='Yes' THEN 'Desp:Yes' ELSE '' END  + ' ' + ISNULL(PathHistology,'') + ' ' + ISNULL(PathStageSystem,'') + ' ' + ISNULL(PathStageGroup,'') + ' ' + ISNULL(PathStageN,'') + ' ' +  ISNULL(PathStageM,'')
       + ' ' + ISNULL((SELECT TOP 1 Status + ' ' + CAST(ISNULL(StatusNotes,'') as varchar(50))FROM Status WHERE (Status.PatientId = @PatientId AND Status = 'Last AFP' AND StatusDate=ProcDate)),'')
       + ' ' + ISNULL((SELECT TOP 1 Status + ' ' + CAST(ISNULL(StatusNotes,'') as varchar(50))FROM Status WHERE (Status.PatientId = @PatientId AND Status = 'Last bHCG' AND StatusDate=ProcDate)),'')), 
       ProcQuality, ProcDate,'Procedures', Procedures.ProcedureId
FROM Procedures LEFT OUTER JOIN Pathology ON Pathology.ProcedureId = Procedures.ProcedureId 
                LEFT OUTER JOIN PathologyStageGrade ON Pathology.PathologyId = PathologyStageGrade.PathologyId
                LEFT OUTER JOIN RPLND_Proc ON Procedures.ProcedureId = RPLND_Proc.ProcedureId
WHERE Procedures.PatientId = @PatientId AND ProcName = 'RPLND'

INSERT @ChronoTable (VarDate,VarName,VarSummary,Quality,SortDate,TableName,PrimaryKey)
SELECT ProcDateText,'', LTRIM(ISNULL(ProcName,'') + ' ' + ISNULL(RIGHT(PathStageSystem,2),'') + ' ' 
       + ISNULL(PathStageT,'') + ' ' + ISNULL(PathStageM,'') +  ISNULL(PathGrade,'') + ' ' +  ISNULL(PathHistology,''))
       , ISNULL(Pathology.PathQuality,ProcQuality), ProcDate, 'Procedures', Procedures.ProcedureId
FROM Procedures LEFT OUTER JOIN Pathology ON Pathology.ProcedureId = Procedures.ProcedureId 
                LEFT OUTER JOIN CystectomyPath ON CystectomyPath.PathologyId = Pathology.PathologyId 
                LEFT OUTER JOIN PathologyStageGrade ON Pathology.PathologyId = PathologyStageGrade.PathologyId
WHERE Procedures.PatientId = @PatientId AND ProcName IN('Cystectomy','CP','Cysto-Prostatectomy','Partial Cystectomy','Radical Cystectomy','Salvage Radical Cystectomy')

INSERT @ChronoTable (VarDate,VarName,VarSummary,Quality,SortDate,TableName,PrimaryKey)
SELECT ProcDateText, ISNULL(ProcName,'Prostatectomy'),dbo.fnSummaryRP(PathGG1,PathGG2,PathGGS,PathMargin,PathExtension,PathSV_Inv,Procedures.OperatingRoomDetailId,ISNULL(PathQuality,ProcQuality)) + ' (' + ISNULL(PathQuality,ProcQuality) + ')', ISNULL(PathQuality,ProcQuality), ProcDate,  'Procedures', Procedures.ProcedureId
FROM Procedures LEFT OUTER JOIN Pathology ON Pathology.ProcedureId = Procedures.ProcedureId 
                LEFT OUTER JOIN ProstatectomyPath ON ProstatectomyPath.PathologyId = Pathology.PathologyId
WHERE Procedures.PatientId = @PatientId AND ProcName IN('CP','LP','LP_CONV','PP','RALP','RP','SalvCP','SalvLP','SalvRP')
      AND Procedures.ProcedureId NOT IN (SELECT PrimaryKey FROM @ChronoTable WHERE TableName='Procedures')

INSERT @ChronoTable (VarDate,VarName,VarSummary,Quality,SortDate,TableName,PrimaryKey)
SELECT ProcDateText, '', LTRIM(ISNULL(ProcSide,'') + ' '  + ISNULL(ProcName,'')), ProcQuality, ProcDate, 'Procedures',Procedures.ProcedureId
FROM Procedures
WHERE Procedures.PatientId = @PatientId AND ProcName IN('Nephrectomy','Partial Nephrectomy','Laparoscopic Nephroureterectomy','Partial for Horshoe Kidney','Laparoscopic Partial Nephrectomy','Nephroureterectomy','Laparoscopic Radical Nephrectomy','Radical Nephrectomy','Exploratory Laparotomy')

--non prostate biopsies
INSERT @ChronoTable (VarDate,VarName,VarSummary,Quality,SortDate,TableName,PrimaryKey)
SELECT ProcDateText, '', LTRIM(ISNULL(ProcSide,'') + ' ' + ISNULL(ProcName,'') + ' ' + ISNULL(PathResult,'')), ISNULL(PathQuality,ProcQuality), ProcDate, 'Procedures', Procedures.ProcedureId
FROM Procedures LEFT OUTER JOIN Pathology ON Procedures.ProcedureId = Pathology.ProcedureId
WHERE Procedures.PatientId = @PatientId AND ProcName IN('Open Excisional Biopsy','Bone Marrow Biopsy','Biopsy','Needle Biopsy','Brushings','Needle Aspiration')
AND (Procedures.ProcedureId NOT IN
     (
      SELECT ProcedureId
      FROM Procedures 
      WHERE PatientId = @PatientId AND ProcSite='Prostate' AND ProcName IN('TURP','TRUS Biopsy','Biopsy','Needle Biopsy')
     ))

--prostate biopsy
INSERT @ChronoTable (VarDate,VarName,VarSummary,Quality,SortDate,TableName,PrimaryKey)
SELECT ProcDateText, ProcName, CAST(dbo.fnSummaryBxProstate(PathGG1,PathGG2,PathGGS,PathResult) as varchar(255)), ISNULL(PathQuality,ProcQuality), ProcDate, 'Procedures', Procedures.ProcedureId
FROM Procedures INNER JOIN Pathology ON Procedures.ProcedureId = Pathology.ProcedureId
                LEFT OUTER JOIN ProstateBiopsyPath ON Pathology.PathologyId=ProstateBiopsyPath.PathologyId
WHERE Procedures.PatientId = @PatientId AND 
      ProcSite='Prostate' AND ProcName IN('TURP','TRUS Biopsy','Biopsy','Needle Biopsy')

INSERT @ChronoTable (VarDate,VarName,VarSummary,Quality,SortDate,TableName,PrimaryKey)
SELECT ProcDateText, ISNULL(ProcName,'Endoscopy'), LTRIM(ISNULL(RIGHT(PathStageSystem,2),'') + ' '  + ISNULL(PathStageT,'') + ' ' + ISNULL(PathGrade,'') + ' ' + ISNULL(PathResult,'')), ISNULL(Pathology.PathQuality,ProcQuality), ProcDate, 'Procedures', Procedures.ProcedureId
FROM Procedures LEFT OUTER JOIN Pathology ON Procedures.ProcedureId = Pathology.ProcedureId
                LEFT OUTER JOIN PathologyStageGrade ON Pathology.PathologyId = PathologyStageGrade.PathologyId
WHERE Procedures.PatientId = @PatientId AND ProcName IN('TURBT','TURBN','TURB','TUR','Cystoscopy','Endoscopy')

--procedures not in the current list
INSERT @ChronoTable (VarDate,VarName,VarSummary,Quality,SortDate,TableName,PrimaryKey)
SELECT ProcDateText, ProcName, LTRIM(ISNULL(PathStageSystem,'') + ' '  + ISNULL(PathStageT,'') + ' ' + ISNULL(PathStageN,'') + ISNULL(PathStageM,'') + ' ' + ISNULL(PathHistology,'') + ' ' + ISNULL(PathResult,'')) , ISNULL(Pathology.PathQuality,ProcQuality), ProcDate, 'Procedures', Procedures.ProcedureId
FROM Procedures LEFT OUTER JOIN Pathology ON Procedures.ProcedureId = Pathology.ProcedureId
                LEFT OUTER JOIN PathologyStageGrade ON Pathology.PathologyId = PathologyStageGrade.PathologyId
                LEFT OUTER JOIN 
                (SELECT PrimaryKey FROM @ChronoTable WHERE TableName = 'Procedures') AS b
                ON Procedures.ProcedureId = b.PrimaryKey
WHERE Procedures.PatientId = @PatientId AND b.PrimaryKey IS NULL

INSERT @ChronoTable (VarDate,VarName,VarSummary,Quality,SortDate,TableName,PrimaryKey)SELECT ClinStageDateText, ClinStageSystem, LTRIM(ISNULL(ClinStageGroup,'') + ' ' + ISNULL(CAST(ClinStageNotes as varchar(50)),'') + ' ' + ISNULL(ClinStageT,'')), ClinStageQuality, ClinStageDate, 'ClinicalStages', ClinicalStageId
FROM ClinicalStages
WHERE (ClinicalStages.PatientId = @PatientId AND ClinStageDisease='Testis')

INSERT @ChronoTable (VarDate,VarName,VarSummary,Quality,SortDate,TableName,PrimaryKey)
SELECT ToxDateText, ToxName, '', ToxQuality, ToxDate, 'Toxicities', ToxicityId
FROM Toxicities
WHERE (Toxicities.PatientId = @PatientId)

INSERT @ChronoTable (VarDate,VarName,VarSummary,Quality,SortDate,TableName,PrimaryKey)
SELECT '', Category, '', '', '', 'Categories', CategoryId
FROM Categories
WHERE (Categories.PatientId = @PatientId AND Category IN ('TestisLateRelapse','TestisFailedSurveillance','TestisSurveillance'))

INSERT @ChronoTable (VarDate,VarName,VarSummary,Quality,SortDate,TableName,PrimaryKey)
SELECT SurveyDateText,SurveyType,LTRIM(ISNULL(SurveyItem,'') + ' ' + ISNULL(SurveyItemResult,'')),SurveyQuality,SurveyDate,'SurveyItems',SurveyItems.SurveyItemId
FROM Surveys INNER JOIN SurveyItems ON Surveys.SurveyId = SurveyItems.SurveyId
WHERE (Surveys.PatientId=@PatientId AND SurveyType='Testis Relapse')

INSERT @ChronoTable (VarDate,VarName,VarSummary,Quality,SortDate,TableName,PrimaryKey)
SELECT EncDateText,ROS_Symptom,LTRIM(ISNULL(ROS_Result,'') + ' ' + ISNULL(ROS_Notes,'')),EncQuality,EncDate,'EncReviewOfSystems',EncReviewOfSystemId
FROM Encounters INNER JOIN EncReviewOfSystems ON Encounters.EncounterId = EncReviewOfSystems.EncounterId
                INNER JOIN Procedures ON Encounters.PatientId = Procedures.PatientId
WHERE (Encounters.PatientId=@PatientId AND ROS_Symptom = 'Ejaculation' AND ProcName='RPLND') AND 
      (EncDate IS NULL OR EncDate>ProcDate)

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

SELECT LTRIM(VarDate + ' ' + CASE WHEN VarName<>'' THEN VarName + ' ' ELSE '' END 
            + VarSummary) AS PatientHPI--,VarName,VarDate
FROM @ChronoTable 
ORDER BY SortDate
SET @Rowcount = @@ROWCOUNT
GO
