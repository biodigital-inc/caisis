SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[spGetPatientHPIKidney]
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
   ExtraInfo    varchar(500) NULL,
   VarStopDate  varchar(50) NULL
   )

INSERT @ChronoTable (VarDate,VarName,VarSummary,Quality,SortDate,VarStopDate,TableName,PrimaryKey)
SELECT MedTxDateText, 'Systemic Therapy: ' + MedTxType + ':', LTRIM(ISNULL(MedTxAgent,'')), MedTxQuality, MedTxDate,MedTxStopDateText, 'MedicalTherapy', MedicalTherapyId
FROM MedicalTherapy
WHERE MedicalTherapy.PatientId = @PatientId AND
      MedTxType IN('Chemo','Immuno','Bio_Tx')

INSERT @ChronoTable (VarDate,VarName,VarSummary,Quality,SortDate,VarStopDate,TableName,PrimaryKey)
SELECT MedTxDateText, MedTxType , LTRIM(ISNULL(': ' + MedTxAgent,'')), MedTxQuality, MedTxDate,MedTxStopDateText, 'MedicalTherapy', MedicalTherapyId
FROM MedicalTherapy
WHERE MedicalTherapy.PatientId = @PatientId AND
      MedTxType NOT IN('Chemo','Immuno','Bio_Tx')

INSERT @ChronoTable (VarDate,VarName,VarSummary,Quality,SortDate,VarStopDate,TableName,PrimaryKey)
SELECT RadTxDateText, 'Radiation Therapy: ' + ISNULL(RadTxType,'') + ':' , ISNULL(RadTxTarget,''), RadTxQuality, RadTxDate,RadTxStopDateText, 'RadiationTherapy', RadiationTherapyId
FROM RadiationTherapy
WHERE (RadiationTherapy.PatientId = @PatientId)

INSERT @ChronoTable (VarDate,VarName,VarSummary,Quality,SortDate,TableName,PrimaryKey)
SELECT TOP 1 StatusDateText, '', Status  + ISNULL(': ' + StatusNotes,''), StatusQuality, StatusDate, 'Status', StatusId
FROM Status
WHERE Status.PatientId = @PatientId AND Status = 'Distant Metastasis'
ORDER BY StatusDate ASC 

INSERT @ChronoTable (VarDate,VarName,VarSummary,Quality,SortDate,TableName,PrimaryKey)
SELECT TOP 1 StatusDateText, '', Status  + ISNULL(': ' + StatusNotes,''), StatusQuality, StatusDate, 'Status', StatusId
FROM Status
WHERE Status.PatientId = @PatientId AND Status = 'Local Recurrence'
ORDER BY StatusDate ASC 

INSERT @ChronoTable (VarDate,VarName,VarSummary,Quality,SortDate,TableName,PrimaryKey)
SELECT TOP 1 StatusDateText, '', Status  + ISNULL(': ' + StatusNotes,''), StatusQuality, StatusDate, 'Status', StatusId
FROM Status
WHERE Status.PatientId = @PatientId AND 
      StatusDisease In('Renal Cell Carcinoma','Kidney','Kidney Cancer','Renal Cancer','Renal Pelvis Cancer')  AND
      StatusId NOT IN (SELECT PrimaryKey FROM @ChronoTable WHERE TableName='Status')
ORDER BY StatusDate DESC 

INSERT @ChronoTable (VarDate,VarName,VarSummary,Quality,SortDate,TableName,PrimaryKey,ExtraInfo)
SELECT OpDateText, '' VarName, ISNULL(OpCaseSurgeon + ' ','') + LTRIM(ISNULL(ProcSide + ' ','') 
       + ISNULL(ProcName,'Nephrectomy, unspecified')  + ISNULL(', Intra-Op Complications = ' + ProcComplication,'') 
       + ISNULL(', Histology = ' + PathHistology,'') + ISNULL(', Histology2 = ' + PathHistology2,'') 
       + ISNULL(', Tumor Size = ' + PathCancerMaxDim + ' cm','') + ISNULL(', TNM-Stage = ' + PathStageT,'') 
       + ISNULL(', ' + PathStageM,'') + + ISNULL(' (' + PathStageSystem + ')','')  
       ) VarSummary, OpQuality, OpDate, 'Procedures' TableName, Procedures.ProcedureId PrimaryKey,
       CASE WHEN (NephrectomyProc.ProcedureId IS NOT NULL OR Pathology.PathologyId IS NOT NULL )  
            THEN 'ProcNephrectomyDetails' 
            ELSE 'ProcNephrectomyNoDetails' 
       END ExtraInfo --The marks dupes
FROM OperatingRoomDetails INNER JOIN Procedures ON OperatingRoomDetails.OperatingRoomDetailId = Procedures.OperatingRoomDetailId
                          LEFT OUTER JOIN Pathology ON Procedures.ProcedureId = Pathology.ProcedureId
                          LEFT OUTER JOIN PathologyStageGrade ON Pathology.PathologyId = PathologyStageGrade.PathologyId AND
                                                                 PathologyStageGradeId = (SELECT TOP 1 PathologyStageGradeId 
                                                                                          FROM PathologyStageGrade
                                                                                          WHERE PathologyId = Pathology.PathologyId)
                          LEFT OUTER JOIN NephrectomyPath ON Pathology.PathologyId = NephrectomyPath.PathologyId
                          LEFT OUTER JOIN NephrectomyProc ON Procedures.ProcedureId = NephrectomyProc.ProcedureId
WHERE Procedures.PatientId = @PatientId AND 
      ProcName IN('Nephrectomy','Partial Nephrectomy','Laparoscopic Nephroureterectomy','Partial for Horshoe Kidney','Laparoscopic Partial Nephrectomy','Nephroureterectomy','Laparoscopic Radical Nephrectomy','Radical Nephrectomy','Exploratory Laparotomy', 'Robotic Partial Nephrectomy', 'Robotic Radical Nephrectomy') 

/*
INSERT @ChronoTable (VarDate,VarName,VarSummary,Quality,SortDate,TableName,PrimaryKey)
SELECT ProcDateText,ISNULL(ProcName + ',',''), ISNULL('Result = ' + PathResult,'') + ISNULL(', Histology = ' + PathHistology,'') + ISNULL(', Histology2 = ' + PathHistology2,''), PathQuality, ProcDate, 'Procedures', Procedures.ProcedureId
FROM Procedures LEFT OUTER JOIN Pathology ON Procedures.ProcedureId = Pathology.ProcedureId
WHERE (Procedures.PatientId = @PatientId) AND 
      ProcName IN('RLND','Thoracotomy','Lobectomy','Craniotomy','Adrenalectomy','Vertebral Body Resection','Hepatic Resection','Distal Pancreatectomy','Lobectomy','Wedge Resection','Bronchoscopy','Bone Resection','Renal Bed Resection','RPLND')
*/

--procedures not in the current list
INSERT @ChronoTable (VarDate,VarName,VarSummary,Quality,SortDate,TableName,PrimaryKey)
SELECT ProcDateText, ProcName, ISNULL(ProcApproach + ' ','') +  LTRIM(ISNULL(RIGHT(PathStageSystem,2),'') + ' '  + ISNULL(PathStageT,'') + ' ' + ISNULL(PathStageN,'') + ISNULL(PathStageM,'') + ' ' + ISNULL(PathHistology,'') + ' ' + ISNULL(PathResult,'')), ISNULL(Pathology.PathQuality,ProcQuality), ProcDate, 'Procedures', Procedures.ProcedureId
FROM Procedures LEFT OUTER JOIN Pathology ON Procedures.ProcedureId = Pathology.ProcedureId
                LEFT OUTER JOIN PathologyStageGrade ON Pathology.PathologyId = PathologyStageGrade.PathologyId
                LEFT OUTER JOIN 
                (SELECT PrimaryKey,VarName FROM @ChronoTable WHERE TableName = 'Procedures') AS b
                ON Procedures.ProcedureId = b.PrimaryKey
WHERE Procedures.PatientId = @PatientId AND b.PrimaryKey IS NULL

INSERT @ChronoTable (VarDate,VarName,VarSummary,Quality,SortDate,VarStopDate,TableName,PrimaryKey)
SELECT VarDate,VarName, ISNULL(VarExtraInfo,'') + ISNULL(' ' + VarValue,''),Quality,SortDate,
       (SELECT TOP 1 PtProtocolStatusDateText
        FROM PatientProtocolStatus 
        WHERE PatientProtocolId = PatProtId AND PtProtocolStatus = 'Off Study') VarStopDate,
       TableName,PrimaryKey
FROM 
   (
   SELECT dbo.fnGetPtProtocolStatusDate(PatientProtocolId,'DateText') VarDate,'Protocol' VarName,
          ISNULL(dbo.fnGetPtProtocolStatusLast(PatientProtocolId),PtProtocolStatus) VarValue,PtProtocolQuality Quality,
          CAST(dbo.fnGetPtProtocolStatusDate(PatientProtocolId,'Date') AS datetime) SortDate,
          'PatientProtocols' TableName,PatientProtocolId PrimaryKey,
          ProtocolNum VarExtraInfo,
          PatientProtocolId PatProtId
   FROM PatientProtocols INNER JOIN Protocols ON PatientProtocols.ProtocolId = Protocols.ProtocolId
   WHERE (PatientId = @PatientId) 
   ) a LEFT OUTER JOIN 
   (
   SELECT c.LkpCode 
   FROM LookupCodeAttributes a INNER JOIN
        LookupAttributes b ON a.AttributeId=b.AttributeId INNER JOIN
        LookupCodes c ON a.LookupCodeId=c.LookupCodeId
   WHERE AttributeName = 'ProtocolScreening' AND
         AttributeValue = 'HPI'
   ) b ON a.VarValue LIKE ('%' + b.LkpCode + '%')
WHERE b.LkpCode IS NULL

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
UPDATE @ChronoTable 
   SET ExtraInfo = ''
WHERE ExtraInfo IS NULL

--Remove Dupe nephrectomy records
DELETE @ChronoTable FROM @ChronoTable a INNER JOIN 
                           (
                           SELECT SortDate FROM @ChronoTable
                           WHERE TableName='Procedures' AND ExtraInfo = 'ProcNephrectomyDetails'
                           ) b ON a.SortDate = b.SortDate
WHERE TableName='Procedures' AND ExtraInfo='ProcNephrectomyNoDetails' 

--More dupe procedures removed
SELECT PatientHPI 
FROM 
   (
   SELECT DISTINCT LTRIM(VarDate 
               + CASE WHEN VarStopDate IS NULL THEN ' ' ELSE ' - ' + VarStopDate + ' ' END 
               + CASE WHEN VarName<>'' THEN VarName + ' ' ELSE '' END 
               + VarSummary) AS PatientHPI,SortDate --,VarName,VarDate
   FROM @ChronoTable
   ) a
ORDER BY SortDate
SET @Rowcount = @@ROWCOUNT
GO
