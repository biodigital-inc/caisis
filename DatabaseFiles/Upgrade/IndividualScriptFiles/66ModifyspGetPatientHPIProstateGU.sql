SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
ALTER PROCEDURE [dbo].[spGetPatientHPIProstateGU]
   @PatientId int = NULL,
   @EForm bit = 0,
   @Rowcount int = NULL OUTPUT
AS
SET NOCOUNT ON
--These variables are for debuging / testing speed
DECLARE @starttime datetime
DECLARE @stoptime datetime
Declare @strDebug varchar(8000)
--End of Debug variables

DECLARE @strPatientHPI     varchar(1000)
DECLARE @strDate           varchar(50)
DECLARE @strStopDate       varchar(50)
DECLARE @dteDate           datetime
DECLARE @strVariable       varchar(50)
DECLARE @strValue          varchar(255)
DECLARE @strDataQuality    varchar(50)
DECLARE @strTableName      varchar(50)
DECLARE @strExtraInfo      varchar(50) 
DECLARE @intPrimaryKey     int
DECLARE @i                 int
DECLARE @blnPreTx          bit
DECLARE @blnValidPSA       bit
DECLARE @sngTime           float(24) --VBA single float(53) double
DECLARE @BiopsyDate        datetime
DECLARE @BiopsyDays        float(24) -- number of days after prostate biopsy that PSA is invalid
DECLARE @strOutPut         varchar(1000)

--Default Missing Values
DECLARE @MISSING_NUMBER int
DECLARE @MISSING_DATE   datetime

SET @MISSING_NUMBER = -999
SET @MISSING_DATE = '1899-12-30 00:00:00.000'
SET @BiopsyDate = @MISSING_DATE
SET @BiopsyDays = 21

--Clinical states constants (must be ordered)
DECLARE @NO_PROSTATE_CANCER_DIAGNOSIS smallint
DECLARE @LOCALIZED                    smallint
DECLARE @RISING_PSA_NON_CASTRATE      smallint
DECLARE @RISING_PSA_CASTRATE          smallint
DECLARE @NON_CASTRATE_METS            smallint
DECLARE @CASTRATE_METS                smallint
DECLARE @DEAD                         smallint
SET @NO_PROSTATE_CANCER_DIAGNOSIS = 0
SET @LOCALIZED = 1
SET @RISING_PSA_NON_CASTRATE = 2
SET @RISING_PSA_CASTRATE = 3
SET @NON_CASTRATE_METS = 4   
SET @CASTRATE_METS = 5  
SET @DEAD = 6

--This is used to determine castrate clinical states
DECLARE @CASTRATE_TESTOSTERONE_LEVEL smallint
SET @CASTRATE_TESTOSTERONE_LEVEL = 50

DECLARE @ClinStateDate    datetime        --date of last clinical state transition
DECLARE @ClinStateDteText varchar(50)     --datetext of last clinical state transition
DECLARE @ClinState        int             --current clinical state (0 to 5)
DECLARE @Castrate         bit             --castrate levels of testosterone (<50)
DECLARE @DxBiopsyID       int             --primary key for diagnostic biopsy record
DECLARE @DxBxDate         datetime        --date of diagnostic (first positive) biopsy
DECLARE @DxBxDateText     varchar(50)     --datetext of diagnostic (first positive) biopsy
DECLARE @DxBxType         varchar(50)     --diagnostic biopsy type: TURP or needle
DECLARE @DxBxSummary      varchar(255)     --pathologic summary of diagnostic biopsy: eg. 3+4
DECLARE @DxBxQuality      varchar(50)     --data quality for diagnostic biopsy
DECLARE @PreTxPSA         float(24)       --valid PSA before any "curative" treatment (XRT or RP)
DECLARE @PreTxPSADate     datetime 
DECLARE @PreDxBxPSA       varchar(50)     --PSA right before diagnostic biopsy
DECLARE @ClinStageDate	  datetime 
DECLARE @ClinStageSystem  varchar(50)     --UICC TNM staging system used
DECLARE @ClinStageT       varchar(50)     --pre-treatment UICC Tumor Stage
DECLARE @ClinStageN       varchar(50)     --pre-treatment UICC Nodes Stage
DECLARE @ClinStageM       varchar(50)     --pre-treatment UICC Metastatis Stage

DECLARE @ClinStageQuality varchar(50)     --data quality of clinical staging data
DECLARE @NeoAdjHormTx     varchar(50)     --patient has had neo-adjuvant hormone therapy
DECLARE @NeoAdjHormTxDate datetime        --date of first hormone therapy (all PSAs after this are invalid?)
DECLARE @NeoAdjRadTx      varchar(50)     --patient has had neo-adjuvant radiation therapy
DECLARE @NeoAdjRadTxDate  datetime        --date of last neo-adjuvant radiation therapy (all following pre-tx PSAs are invalid)
DECLARE @NeoAdjChemoTx    varchar(50)     --patient has had neo-adjuvant chemotherapy
DECLARE @NeoAdjChemoDate  datetime        --date of last neo-adjuvant chemotherapy
--DECLARE @Prostatectomy    bit           --patient had prostatectomy (means he will always use RP PSA recurrence methods)
DECLARE @TxDate           datetime        --date of first "curative" treatment
DECLARE @TxType           varchar(50)     --curative treatment type
DECLARE @AdjHormTx        varchar(50)
DECLARE @AdjChemoTx       varchar(50)
--DECLARE @NumPSAs          int --number of PSAs after curative treatment
DECLARE @EOD              varchar(50)     --last extent of disease 
DECLARE @LastPSA_Value    varchar(50)
DECLARE @LastPSA_Date     datetime   

DECLARE @HormEvent        varchar(50)
DECLARE @HormTxDate       datetime
DECLARE @MetsEvent        varchar(50)
DECLARE @ChemoTxDate      datetime

--used for eform
DECLARE @strTableNames     varchar(200)
DECLARE @strPrimaryKeys    varchar(50)
DECLARE @strVarDelimited   varchar(500)
DECLARE @strFilters        varchar(200)
DECLARE @strQualities      varchar(200)
DECLARE @ClinStageID       int             --primary key for diagnostic clinical stage record
DECLARE @PreTxPSAID        int             --primary key for pre prostatectomy psa record
DECLARE @PreDxBxPSAID      int             --primary key for pre diagnosis biopsy psa record
DECLARE @PreDxBxPSAQuality varchar(50)     --data quality for pre diagnosis biopsy psa record
DECLARE @ClinStateID       int             --primary key for clin state record
DECLARE @ClinStateTable    varchar(50)     --table name where clin state obtained from
DECLARE @ClinStateQuality  varchar(50)     --data quality of clin state
DECLARE @blnHadRP          bit             --patient had prostatectomy
DECLARE @ProstatePathId    int             --primary key for ProstatectomyPath record
DECLARE @PLNDPathId        int             --primary key for Pathology of the PLND record
DECLARE @NO_PK             varchar(50)     --used to indicate that a table has no data for delimited format
DECLARE @NO_DQ             varchar(50)     --used to indicate that a table has no data quality for delimited format

--used for eform
SET @strTableNames    = ''
SET @strPrimaryKeys   = ''
SET @strVarDelimited  = ''
SET @strQualities = ''
SET @NO_PK = ',NO_PK'
SET @NO_DQ = 'NO_DQ'

SET @ClinStateDate     = @MISSING_DATE
SET @ClinStateDteText  = ''
SET @ClinState         = @NO_PROSTATE_CANCER_DIAGNOSIS
SET @Castrate          = 0
SET @DxBxDate          = @MISSING_DATE
SET @DxBxDateText      = ''
SET @DxBxType          = ''
SET @DxBxSummary       = ''
SET @DxBxQuality       = ''
SET @PreTxPSA          = @MISSING_NUMBER
SET @PreTxPSADate      = @MISSING_DATE
SET @ClinStageDate     = @MISSING_DATE
SET @ClinStageSystem   = ''
SET @ClinStageT        = ''
SET @ClinStageN        = ''
SET @ClinStageM        = ''
SET @ClinStageQuality  = ''
SET @NeoAdjHormTx      = 0
SET @NeoAdjHormTxDate  = @MISSING_DATE
SET @NeoAdjRadTx       = 0
SET @NeoAdjRadTxDate   = @MISSING_DATE
SET @NeoAdjChemoTx     = 0
SET @NeoAdjChemoDate   = @MISSING_DATE
SET @HormTxDate        = @MISSING_DATE
SET @ChemoTxDate       = @MISSING_DATE
--SET @Prostatectomy    = 0
SET @TxDate            = @MISSING_DATE
SET @TxType            = ''
--SET @NumPSAs          = 0
SET @EOD               = ''
SET @LastPSA_Value     = @MISSING_NUMBER
SET @LastPSA_Date      = @MISSING_DATE
SET @MetsEvent         = ''
SET @HormEvent         = ''
SET @PreDxBxPSA        = ''
SET @PreDxBxPSAQuality = ''

DECLARE @SortTable TABLE
--Temp Table used to force the HPI to sort in an order 
   (
   SortDate              datetime NULL,
   VarString             varchar(500) NULL,
   VarDelimited          varchar(500) NULL,
   TableNames            varchar(200) NULL,
   Qualities             varchar(50) NULL,
   PrimaryKeys           varchar(50) NULL,
   StopDateText          varchar(50) NULL,
   Filters               varchar(200) NULL
   )

DECLARE @ChronoTable TABLE
--Add single compound index on SortDate, VarName, VarValue
   (
   ChronoId     int NOT NULL Identity(1,1) PRIMARY KEY,
   VarDate      varchar(50) NULL,
   VarName      varchar(50) NULL,
   VarValue     varchar(255) NULL,
   Quality      varchar(50) NULL,
   SortDate     datetime,
   VarStopDate  varchar(50) NULL,
   TableName    varchar(50) NULL,
   PrimaryKey   int NULL,
   VarExtraInfo varchar(110) NULL,
   Filters      varchar(200) NULL,
   VarDelimited varchar(500) NULL,
   TableNames   varchar(200) NULL,
   Qualities    varchar(50) NULL,
   PrimaryKeys  varchar(50) NULL
   )

INSERT @ChronoTable (VarDate,VarName,VarValue,Quality,SortDate,TableName,PrimaryKey,VarExtraInfo,Filters,VarDelimited,TableNames,Qualities,PrimaryKeys)
SELECT ProcDateText, ProcName, CAST((dbo.fnSummaryBxProstate(PathGG1,PathGG2,PathGGS,PathResult) + ISNULL(' Other Histology: ' + PathHistology2,'')) as varchar(255)), ISNULL(PathQuality,ProcQuality), ProcDate, 'Procedures', Procedures.ProcedureId,ProcSite,
       'ProstateProc',
       '__' + ISNULL(ProcDateText,'') + ISNULL(' ' + ProcName,'') + '|' + '__' + ISNULL(CAST((dbo.fnSummaryBxProstate(PathGG1,PathGG2,PathGGS,PathResult) + ISNULL(' Other Histology: ' + PathHistology2,'')) as varchar(255)),'')  + '|',
       'Procedures,ProstateBiopsyPath', ISNULL(ProcQuality,@NO_DQ) + ISNULL(',' + PathQuality,','+@NO_DQ), CAST(Procedures.ProcedureId as varchar(50)) + ISNULL(',' + CAST(ProstateBiopsyPath.PathologyId as varchar(50)),@NO_PK)
FROM Procedures INNER JOIN Pathology ON Procedures.ProcedureId = Pathology.ProcedureId
                LEFT OUTER JOIN ProstateBiopsyPath ON Pathology.PathologyId=ProstateBiopsyPath.PathologyId
WHERE Procedures.PatientId = @PatientId AND 
      ProcSite='Prostate' AND ProcName IN('TURP','TRUS Biopsy','Biopsy','Needle Biopsy')

INSERT @ChronoTable (VarDate,VarName,VarValue,Quality,SortDate,TableName,PrimaryKey,VarExtraInfo)
SELECT ClinStageDateText, ClinStageSystem, ClinStageT, ClinStageQuality, ClinStageDate, 'ClinicalStages', ClinicalStageId,
       ISNULL(ClinStageN,'') + ISNULL(',' + ClinStageM,'')
FROM ClinicalStages
WHERE (ClinicalStages.PatientId = @PatientId)

INSERT @ChronoTable (VarDate,VarName,VarValue,Quality,SortDate,TableName,PrimaryKey)
SELECT DxDateText, DxType, DxResult, DxQuality, DxDate,  'Diagnostics', DiagnosticId
FROM Diagnostics
WHERE (Diagnostics.PatientId = @PatientId)

INSERT @ChronoTable (VarDate,VarName,VarValue,Quality,SortDate,TableName,PrimaryKey)
SELECT LabDateText, LabTest, LabResult, LabQuality, LabDate, 'LabTests', LabTestId
FROM LabTests
WHERE (LabTests.PatientId = @PatientId AND LabTest IN ('PSA','TEST') AND LabResult IS NOT NULL)

INSERT @ChronoTable (VarDate,VarName,VarValue,Quality,SortDate,VarStopDate,TableName,PrimaryKey,VarExtraInfo,Filters)
SELECT MedTxDateText, MedTxType, MedTxAgent, MedTxQuality, MedTxDate,MedTxStopDateText, 'MedicalTherapy', MedicalTherapyId,ProtocolNum, 'MedTxType_' + MedTxType
FROM MedicalTherapy LEFT OUTER JOIN Protocols ON MedicalTherapy.ProtocolId=Protocols.ProtocolId
WHERE (MedicalTherapy.PatientId = @PatientId)

INSERT @ChronoTable (VarDate,VarName,VarValue,Quality,SortDate,TableName,PrimaryKey,Filters,VarDelimited,TableNames,Qualities,PrimaryKeys)
SELECT ProcDateText,LTRIM(ISNULL(ProcSide,'') + ' Orchiectomy'), ISNULL(PathResult,'') + ' ' + ISNULL(PathHistology,''), ProcQuality, ProcDate,'Procedures', Procedures.ProcedureId,'TestisProc',
       '__' + ISNULL(ProcDateText,'') +  ' ' + LTRIM(ISNULL(ProcSide,'') + ' Orchiectomy') + '|' + '__' + ISNULL(PathResult,'') + ' ' + ISNULL(PathHistology,'') + '|',
       'Procedures,Pathology', ISNULL(ProcQuality,@NO_DQ) + ISNULL(',' + PathQuality,','+@NO_DQ),
       CAST(Procedures.ProcedureId as varchar(50)) + ISNULL(',' + CAST(Pathology.PathologyId as varchar(50)),@NO_PK)       
FROM Procedures LEFT OUTER JOIN Pathology ON Pathology.ProcedureId = Procedures.ProcedureId
WHERE Procedures.PatientId = @PatientId AND ProcName = 'Orchiectomy'

INSERT @ChronoTable (VarDate,VarName,VarValue,Quality,SortDate,TableName,PrimaryKey,Filters,VarDelimited,TableNames,Qualities,PrimaryKeys)
SELECT ProcDateText,'Cystectomy', LTRIM(ISNULL(ProcName,'') + ' ' + ISNULL(RIGHT(PathStageSystem,2),'') + ' ' 
       + ISNULL(PathStageT,'') + ' ' + ISNULL(PathStageN,'') + ' ' + ISNULL(PathStageM,'') + ' ' + ISNULL(PathGrade,'') + ' ' + ISNULL(PathResult,'') + ' ' +  ISNULL(PathHistology,'') + ' '
       + CASE WHEN UD_OperatingRoomDetailId IS NULL THEN '' ELSE 'Urinary Diversion:' + UD_ProcName + ' ' END)
       + CASE WHEN Pathology.OperatingRoomDetailId IS NULL THEN '' 
              ELSE ISNULL('Nodes:' + dbo.fnGetNodeRatio(Procedures.OperatingRoomDetailId,ISNULL(Pathology.PathQuality,ProcQuality)),'')
         END
       , ISNULL(Pathology.PathQuality,ProcQuality), ProcDate, 'Procedures', Procedures.ProcedureId,'BladderProc',
       '__' + ISNULL(ProcDateText,'') + ' ' + LTRIM(ISNULL(ProcName,'')) + '|' + 
       '__' + ISNULL(RIGHT(PathStageSystem,2),'') + ' ' + ISNULL(PathStageT,'') + ' ' + ISNULL(PathStageN,'') + ' ' + ISNULL(PathStageM,'') + ' ' + ISNULL(PathGrade,'') + '|' +
       '__' + ISNULL(PathResult,'') + ' ' + ISNULL(PathHistology,'') + '|',
       'Procedures,PathologyStageGrade,Pathology', ISNULL(ProcQuality,@NO_DQ) + ISNULL(',' + PathologyStageGrade.PathQuality,','+@NO_DQ) + ISNULL(',' + Pathology.PathQuality,','+@NO_DQ),
       CAST(Procedures.ProcedureId as varchar(50)) + (ISNULL(',' + CAST(PathologyStageGrade.PathologyStageGradeId as varchar(50)),@NO_PK)) + (ISNULL(',' + CAST(Pathology.PathologyId as varchar(50)),@NO_PK))
FROM Procedures LEFT OUTER JOIN Pathology ON Pathology.ProcedureId = Procedures.ProcedureId 
                LEFT OUTER JOIN PathologyStageGrade ON Pathology.PathologyId = PathologyStageGrade.PathologyId
                LEFT OUTER JOIN (
                                SELECT OperatingRoomDetailId, MAX(ProcedureId) AS UD_MAX_ProcedureId
                                FROM Procedures 
                                WHERE PatientId=@PatientId AND ProcName IN('IlealConduit','NeoBladder','ContCutaneous','ileal conduit','indiana pouch','IndianaPouch','Ileal Loop','Studer Pouch','Sigmoid Conduit','IlealConduit/SigmoidNeobladder')
                                GROUP BY OperatingRoomDetailId 
                                ) AS MaxUD ON Procedures.OperatingRoomDetailId = MaxUD.OperatingRoomDetailId 
                LEFT OUTER JOIN (
                                SELECT OperatingRoomDetailId AS UD_OperatingRoomDetailId, ProcName AS UD_ProcName,ProcedureId AS UD_ProcedureId
                                FROM Procedures 
                                WHERE PatientId=@PatientId
                                ) AS UrinaryDiversions ON UrinaryDiversions.UD_ProcedureId = MaxUD.UD_MAX_ProcedureId  
WHERE Procedures.PatientId = @PatientId AND ProcName IN('Cystectomy','CP','Cysto-Prostatectomy','Partial Cystectomy','Radical Cystectomy','Salvage Radical Cystectomy')

INSERT @ChronoTable (VarDate,VarName,VarValue,Quality,SortDate,TableName,PrimaryKey,Filters,VarDelimited,TableNames,Qualities,PrimaryKeys)
SELECT ProcDateText, ISNULL(ProcName,'Prostatectomy'),
       dbo.fnSummaryRP(PathGG1,PathGG2,PathGGS,PathMargin,PathExtension,PathSV_Inv,Procedures.OperatingRoomDetailId,ISNULL(Pathology.PathQuality,ProcQuality)) +
       ' (' + dbo.fnGetNodeRatio(Procedures.OperatingRoomDetailId,ISNULL(Pathology.PathQuality,ProcQuality))+ ')' + 
       ' (' + ISNULL(Pathology.PathQuality,ProcQuality) + ')', 
       ProcQuality, ProcDate,  'Procedures', Procedures.ProcedureId, 'ProstateProc',
       '__' + ISNULL(ProcDateText + ' ' ,'') + '|' + '__' + RTRIM(ISNULL(LkpProcName,'Prostatectomy')) + '|' + '__' + ISNULL(dbo.fnSummaryRP(PathGG1,PathGG2,PathGGS,PathMargin,PathExtension,PathSV_Inv,Procedures.OperatingRoomDetailId,ISNULL(Pathology.PathQuality,ProcQuality)),'') +
       ' (' + dbo.fnGetNodeRatio(Procedures.OperatingRoomDetailId,ISNULL(Pathology.PathQuality,ProcQuality))+ ')' + '|',
       'Procedures,ProstatectomyProc,ProstatectomyPath' + CASE WHEN PLND.PathologyId IS NOT NULL THEN ',Pathology' ELSE '' END, 
       ISNULL(ProcQuality,@NO_DQ) + ISNULL(',' + ProcQuality,','+@NO_DQ) + ISNULL(',' + Pathology.PathQuality,','+@NO_DQ) + 
       CASE WHEN PLND.PathologyId IS NOT NULL THEN ISNULL(',' + COALESCE(Pathology.PathQuality,ProcQuality),@NO_DQ) ELSE '' END,
       CAST(Procedures.ProcedureId as varchar(50)) + (ISNULL(',' + CAST(ProstatectomyProc.ProcedureId as varchar(50)),@NO_PK)) + (ISNULL(',' + CAST(ProstatectomyPath.PathologyId as varchar(50)),@NO_PK)) + 
       CASE WHEN PLND.PathologyId IS NOT NULL THEN (ISNULL(',' + CAST(PLND.PathologyId as varchar(50)),'')) ELSE '' END
FROM Procedures LEFT OUTER JOIN ProstatectomyProc ON ProstatectomyProc.ProcedureId = Procedures.ProcedureId 
                LEFT OUTER JOIN Pathology ON Pathology.ProcedureId = Procedures.ProcedureId 
                LEFT OUTER JOIN ProstatectomyPath ON ProstatectomyPath.PathologyId = Pathology.PathologyId 
                LEFT OUTER JOIN (
                                SELECT PathologyId,OperatingRoomDetailId,PathQuality,
                                       ROW_NUMBER() OVER(ORDER BY PathologyId DESC) AS RowNum
                                FROM Pathology
                                WHERE Pathology.PatientId=@PatientId AND PathSpecimenType='PLND'
                                ) PLND ON Procedures.OperatingRoomDetailId = PLND.OperatingRoomDetailId AND
                                          COALESCE(Pathology.PathQuality,ProcQuality,'') = ISNULL(PLND.PathQuality,'') AND
                                          RowNum = 1
               LEFT OUTER JOIN (
                               SELECT LkpCode,LkpDescription LkpProcName
                               FROM LookupCodes 
                               WHERE LkpFieldName = 'ProcName' 
                               ) LKP ON ProcName=LkpCode
WHERE Procedures.PatientId = @PatientId AND ProcName IN('CP','LP','LP_CONV','PP','RALP','RP','SalvCP','SalvLP','SalvRP')
      AND Procedures.ProcedureId NOT IN (SELECT PrimaryKey FROM @ChronoTable WHERE TableName='Procedures')

INSERT @ChronoTable (VarDate,VarName,VarValue,Quality,SortDate,TableName,PrimaryKey,Filters,VarDelimited,TableNames,Qualities,PrimaryKeys)
SELECT ProcDateText, 'RPLND', LTRIM(ISNULL(ProcApproach,'') + ' ' + ISNULL(PathResult,'') + ' ' + ' ' + ISNULL(PathHistology,'') + ' ' + ISNULL(PathStageT,'') + ' ' + ISNULL(PathStageN,'') + ' ' +  ISNULL(PathStageM,'')),
       ProcQuality, ProcDate,'Procedures', Procedures.ProcedureId,'TestisProc',
       '__' + ISNULL(ProcDateText,'') + ' ' + RTRIM(ProcName +  ' ' + ISNULL(ProcApproach,'')) + '|' + '__' + ISNULL(PathResult,'') + ' ' + ISNULL(PathHistology,'') + '|' + '__' + ISNULL(PathStageT,'') + ' ' + ISNULL(PathStageN,'') + ' ' +  ISNULL(PathStageM,'') + '|',
       'Procedures,Pathology,PathologyStageGrade', ISNULL(ProcQuality,@NO_DQ) + ISNULL(',' + Pathology.PathQuality,','+@NO_DQ) + ISNULL(',' + PathologyStageGrade.PathQuality,','+@NO_DQ),
       CAST(Procedures.ProcedureId as varchar(50)) + (ISNULL(',' + CAST(Pathology.PathologyId as varchar(50)),@NO_PK)) + (ISNULL(',' + CAST(PathologyStageGrade.PathologyStageGradeId as varchar(50)),@NO_PK))
FROM Procedures LEFT OUTER JOIN Pathology ON Pathology.ProcedureId = Procedures.ProcedureId 
                LEFT OUTER JOIN PathologyStageGrade ON Pathology.PathologyId = PathologyStageGrade.PathologyId
WHERE Procedures.PatientId = @PatientId AND ProcName = 'RPLND'

INSERT @ChronoTable (VarDate,VarName,VarValue,Quality,SortDate,TableName,PrimaryKey,Filters,VarDelimited,TableNames,Qualities,PrimaryKeys)
SELECT ProcDateText, ProcName, ISNULL(ProcSide,'') + ' ' + ISNULL(PathResult,'') + ' ' + ISNULL(PathHistology,''), ProcQuality, ProcDate, 'Procedures',Procedures.ProcedureId, 'KidneyProc',
       '__' + ISNULL(ProcDateText,'') +  ' ' + ISNULL(ProcName,'') + ' ' + ISNULL(ProcSide,'') + '|' + '__' + ISNULL(PathResult,'') + ' ' + ISNULL(PathHistology,'') + '|',
       'Procedures,Pathology', ISNULL(ProcQuality,@NO_DQ) + ISNULL(',' + PathQuality,','+@NO_DQ),
       CAST(Procedures.ProcedureId as varchar(50)) + ISNULL(',' + CAST(Pathology.PathologyId as varchar(50)),@NO_PK) 
FROM Procedures LEFT OUTER JOIN Pathology ON Pathology.ProcedureId = Procedures.ProcedureId
WHERE Procedures.PatientId  = @PatientId AND ProcName IN('Nephrectomy','Partial Nephrectomy','Laparoscopic Nephroureterectomy','Partial for Horshoe Kidney','Laparoscopic Partial Nephrectomy','Nephroureterectomy','Laparoscopic Radical Nephrectomy','Radical Nephrectomy')

--procedures not in the current list
INSERT @ChronoTable (VarDate,VarName,VarValue,Quality,SortDate,TableName,PrimaryKey,Filters,VarDelimited,TableNames,Qualities,PrimaryKeys)
SELECT ProcDateText, ISNULL(ProcName,''), ISNULL(ProcSite,'') + ' ' + ISNULL(PathResult,'') + ' ' + ISNULL(PathHistology,''), ProcQuality, ProcDate, 'Procedures', Procedures.ProcedureId, 
       CASE WHEN ProcName='PLND' THEN 'ProstateProc' 
            WHEN ProcName LIKE 'Cysto%' THEN 'CystoProc' 
            ELSE 'OtherProc' 
       END,
       '__' + ISNULL(ProcDateText,'') +  ' ' + ISNULL(ProcName,'') + ' ' + ISNULL(ProcSite,'') + '|' + '__' + ISNULL(PathResult,'') + ' ' + ISNULL(PathHistology,'') + '|',
       'Procedures,Pathology', ISNULL(ProcQuality,@NO_DQ) + ISNULL(',' + PathQuality,','+@NO_DQ),
       CAST(Procedures.ProcedureId as varchar(50)) + ISNULL(',' + CAST(Pathology.PathologyId as varchar(50)),@NO_PK)       
FROM Procedures LEFT OUTER JOIN 
                (SELECT PrimaryKey FROM @ChronoTable WHERE TableName = 'Procedures') AS b
                ON Procedures.ProcedureId = b.PrimaryKey
                LEFT OUTER JOIN Pathology ON Pathology.ProcedureId = Procedures.ProcedureId
WHERE Procedures.PatientId = @PatientId AND b.PrimaryKey IS NULL

INSERT @ChronoTable (VarDate,VarName,VarValue,Quality,SortDate,VarStopDate,TableName,PrimaryKey,VarExtraInfo)
SELECT RadTxDateText, RadTxType, RadTxTotalDose, RadTxQuality, RadTxDate,RadTxStopDateText, 'RadiationTherapy', RadiationTherapyId, ISNULL(RadTxTarget+' ','') + ISNULL(RadTxIntent,'')
FROM RadiationTherapy
WHERE (RadiationTherapy.PatientId = @PatientId)

INSERT @ChronoTable (VarDate,VarName,VarValue,Quality,SortDate,TableName,PrimaryKey)
SELECT BrachyDateText,'Brachytherapy',BrachyIsotope,BrachyQuality,BrachyDate,'BrachyTherapy',PatientId
FROM BrachyTherapy
WHERE (BrachyTherapy.PatientId = @PatientId AND ISNULL(BrachyPending,0)=0)

INSERT @ChronoTable (VarDate,VarName,VarValue,Quality,SortDate,TableName,PrimaryKey)
SELECT statusDateText, 'Status', status, statusQuality, statusDate, 'Status', statusId
FROM Status
WHERE (Status.PatientId = @PatientId)

INSERT @ChronoTable (VarDate,VarName,VarValue,Quality,SortDate,TableName,PrimaryKey)
SELECT PtDeathDateText, 'Status', PtDeathType, Null, PtDeathDate, 'Patients', PatientID
FROM Patients
WHERE (PtDeathDate Is Not Null) AND (PatientID=@PatientID)

INSERT @ChronoTable (VarDate,VarName,VarValue,Quality,SortDate,TableName,PrimaryKey,VarExtraInfo,VarStopDate)
SELECT VarDate,VarName,VarValue,Quality,SortDate,TableName,PrimaryKey,VarExtraInfo,
       (SELECT TOP 1 PtProtocolStatusDateText
        FROM PatientProtocolStatus 
        WHERE PatientProtocolId = PatProtId AND PtProtocolStatus = 'Off Study') VarStopDate
FROM 
   (
   SELECT dbo.fnGetPtProtocolStatusDate(PatientProtocolId,'DateText') VarDate,'Protocol' VarName,
          ISNULL(dbo.fnGetPtProtocolStatusLast(PatientProtocolId),PtProtocolStatus) VarValue,PtProtocolQuality Quality,
          CAST(dbo.fnGetPtProtocolStatusDate(PatientProtocolId,'Date') AS datetime) SortDate,
          'PatientProtocols' TableName,PatientProtocolId PrimaryKey,
          ISNULL(ProtocolNum,'') + ISNULL(' ('+ProtocolAlias+')','') VarExtraInfo,
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

--Clean up local variables for each record fetched
UPDATE @ChronoTable 
   SET VarName = ''
WHERE VarName IS NULL
UPDATE @ChronoTable 
   SET VarValue = ''
WHERE VarValue IS NULL
UPDATE @ChronoTable 
   SET VarDate = ''
WHERE VarDate IS NULL
UPDATE @ChronoTable 
   SET Quality = ''
WHERE Quality IS NULL
UPDATE @ChronoTable 
   SET VarValue = dbo.fnPacManStr(VarValue)
WHERE TableName = 'LabTests' AND ISNUMERIC(VarValue)=0
UPDATE @ChronoTable 
   SET VarStopDate = ''
WHERE VarStopDate IS NULL
UPDATE @ChronoTable 
   SET VarExtraInfo = ''
WHERE VarExtraInfo IS NULL

--Figure out Aborted Prostatectomies
UPDATE @ChronoTable
   SET VarName = 'PLND Aborted Prostatectomy',
       Filters = 'ProstateProc'
FROM @ChronoTable INNER JOIN Procedures ON Procedures.ProcedureId=PrimaryKey
                  LEFT OUTER JOIN Pathology ON Procedures.ProcedureId=Pathology.ProcedureId
WHERE TableName='Procedures' AND VarName='PLND' AND 
      Pathology.ProcedureId IS NULL

SET @strOutPut = ''
SET @strPatientHPI = ''
DECLARE tables_cursor CURSOR LOCAL FAST_FORWARD
   FOR
   SELECT VarDate,VarName,VarValue,Quality,SortDate,VarStopDate,TableName,PrimaryKey,VarExtraInfo,
          Filters,Qualities,VarDelimited,TableNames,PrimaryKeys
   FROM @ChronoTable
   ORDER BY SortDate ASC   
OPEN tables_cursor
IF CURSOR_STATUS ('local','tables_cursor') = 1
BEGIN
   --SET @starttime= GETDATE()
   --SET @strDebug= 'START ' + CAST(@starttime as varchar)
   FETCH NEXT FROM tables_cursor INTO @strDate,@strVariable,@strValue,@strDataQuality,@dteDate,@strStopDate,@strTableName,@intPrimaryKey,@strExtraInfo,@strFilters,@strQualities,@strVarDelimited,@strTableNames,@strPrimaryKeys
   WHILE (@@FETCH_STATUS <> -1)
   BEGIN  
      --DETERMINE if record is pre-treatment assume record is not pre-treatment
      SET @blnPreTx = 0
      IF @dteDate IS NULL 
         SET @blnPreTx = 1
      ELSE IF @TxDate = @MISSING_DATE
         SET @blnPreTx = 1
      ELSE IF @dteDate = @TxDate
         SET @blnPreTx = 1     

      -- PSA
      IF @strVariable = 'PSA'
      BEGIN
         --accomodate <,>, <=, >=
         --SET @strValue = dbo.fnPacManStr(@strValue) --not need cause of update statement        
         IF ISNUMERIC(@strValue) = 1
         BEGIN
            SET @blnValidPSA = 1
            -- PSA invalid if patient on hormone therapy
            IF (@blnPreTx = 1 AND @NeoAdjHormTx <> '') OR (@AdjHormTx <> '') OR (@HormEvent <> '')
               IF @dteDate IS NOT NULL
                  SET @blnValidPSA = 1 -- assume psas without dates are not effected by homrones
               ELSE
                  IF (@HormTxDate = @MISSING_DATE) OR (@dteDate > @HormTxDate)
                     SET @blnValidPSA = 0

            -- PSA invalid if patient on chemotherapy
            IF (@blnPreTx = 1 AND @NeoAdjChemoTx <> '') OR (@AdjChemoTx <> '') OR (@MetsEvent LIKE '%CHEMO%')
               IF @dteDate IS NOT NULL
                  SET @blnValidPSA = 1 -- assume psas without dates are not effected by homrones
               ELSE
                  IF (@ChemoTxDate = @MISSING_DATE) OR (@dteDate > @ChemoTxDate)
                     SET @blnValidPSA = 0

            -- PSAs invalid within specified days after prostate biopsy
            IF @BiopsyDate <> @MISSING_DATE AND @dteDate IS NOT NULL
               IF @dteDate > @BiopsyDate
                  IF (@dteDate - @BiopsyDate) < @BiopsyDays
                     SET @blnValidPSA = 0

            -- find valid pre-treatment PSA 
            IF @blnValidPSA = 1   
               IF @blnPreTx = 1
               BEGIN
                  IF NOT (@dteDate IS NULL AND @PreTxPSA <> @MISSING_NUMBER AND @PreTxPSA > CAST(@strValue AS float(24)))
                     SET @PreTxPSA = CAST(@strValue AS float(24))
                     IF @EForm=1
                        SET @PreTxPSAID = @intPrimaryKey  
                  IF @dteDate IS NOT NULL
                     SET @PreTxPSADate = @dteDate
               END
               ELSE
                  SET @LastPSA_Value = @strValue
               IF @dteDate IS NOT NULL
                  SET @LastPSA_Date = @dteDate
         END 
      END
      ELSE
      -- Prostate Biopsy
      IF @strVariable IN('NEEDLE BIOPSY','BIOPSY','TURP','TRUS Biopsy') AND @strExtraInfo='Prostate'--dbo.fnIsBiopsyProstate (@strVariable)= 1
      BEGIN
         -- which biopsy is the diagnostic biopsy?
         -- save date to check for PSAs within 3 weeks of biopsy
         IF @blnPreTx = 1
            IF @dteDate IS NOT NULL
            BEGIN
               SET @BiopsyDate = @dteDate
               -- diagnostic biopsy is first positive biopsy
               -- but if ther are later pre-tx grades, use them
               IF @strValue <> '' AND @strValue NOT IN('NEG','PIN','ASAP','Negative') --dbo.fnIsAbnormalBiopsyProstate (@strValue) = 1
                  IF @DxBxDate = @MISSING_DATE OR 
                                 (@strDataQuality='RR' AND @DxBxQuality <> 'RR' AND @DxBxDate = @dteDate) OR 
                                 (@strDataQuality IN('STD','REV') AND @DxBxQuality = 'OUT' AND @DxBxDate = @dteDate)
                  BEGIN
                     SET @DxBxType = @strVariable
                     SET @DxBxDate = @dteDate
                     SET @DxBxDateText = @strDate
                     SET @DxBxSummary = @strValue
                     SET @DxBxQuality = @strDataQuality
	                  SET @DxBiopsyID = @intPrimaryKey --for paper form
                     -- move the clinical state forward
                     IF @ClinState < @LOCALIZED
                     BEGIN
                        SET @ClinState = @LOCALIZED
                        SET @ClinStateDate = @dteDate 
                        SET @ClinStateDteText = @strDate
                        IF @EForm=1
                           BEGIN
                              SET @ClinStateID = @intPrimaryKey
                              SET @ClinStateTable = @strTableName
                              SET @ClinStateQuality = @strDataQuality
                           END                                             
                     END
                  END
            END         
      END   -- does not deal with post-curative treatment (RP, XRT) biopsies
      ELSE
      -- UICC/AJCC Clinical Tumor Stage
      IF @strVariable IN('UICC_92','UICC_97','UICC_02')
      BEGIN
         IF @blnPreTx = 1 AND @strValue <> ''
            If @strDataQuality = 'RR' OR @ClinStageQuality <> 'RR'
            BEGIN
               IF @dteDate IS NOT NULL
               BEGIN
	               SET @ClinStageDate = @dteDate            
	               SET @ClinStageSystem = @strVariable
	               SET @ClinStageT = @strValue
                  IF CHARINDEX(',',@strExtraInfo) > 0
                     BEGIN
                        SET @ClinStageN = SUBSTRING(@strExtraInfo,1,CHARINDEX(',',@strExtraInfo)-1)
                        SET @ClinStageM = SUBSTRING(@strExtraInfo,CHARINDEX(',',@strExtraInfo)+1,LEN(@strExtraInfo))
                     END
                  ELSE IF @strExtraInfo <> ''
                     SET @ClinStageN = @strExtraInfo
	               SET @ClinStageQuality = @strDataQuality
                  IF @EForm=1
                     SET @ClinStageID = @intPrimaryKey
	            END
	            ELSE IF @strValue > @ClinStageT
	            BEGIN
		            -- don't need to copy date b/c all nulls sort to top
         		   SET @ClinStageSystem = @strVariable
	               SET @ClinStageT = @strValue
                  IF CHARINDEX(',',@strExtraInfo) > 0
                     BEGIN
                        SET @ClinStageN = SUBSTRING(@strExtraInfo,1,CHARINDEX(',',@strExtraInfo)-1)
                        SET @ClinStageM = SUBSTRING(@strExtraInfo,CHARINDEX(',',@strExtraInfo)+1,LEN(@strExtraInfo))
                     END
                  ELSE IF @strExtraInfo <> ''
                     SET @ClinStageN = @strExtraInfo
	               SET @ClinStageQuality = @strDataQuality
                  IF @EForm=1
                     SET @ClinStageID = @intPrimaryKey
               END
            END       
      END
      ELSE
      BEGIN   
         -- Chemotherapy (NOT AN ELSE b/c of combination therapies)
         IF (@strVariable LIKE '%CHEMO%') AND (@strVariable NOT LIKE '%STOP')
         BEGIN
            IF @dteDate IS NOT NULL
               IF @ChemoTxDate = @MISSING_DATE
                  SET @ChemoTxDate = @dteDate
   
            IF @blnPreTx = 1
               SET @NeoAdjChemoTx = @strVariable   
            ELSE
               IF @MetsEvent = '' 
                  SET @AdjChemoTx = @strVariable
               -- assumes any chemo after treatment indicates metastasis
               SET @MetsEvent = @strVariable
               SET @strOutput = @strOutput + @strDate + ' ' 
               IF @strStopDate <> ''
                  SET @strOutput = RTRIM(@strOutput) + '-' + @strStopDate + ' '
               IF @strValue <> ''
                  SET @strOutput = @strOutput +  @strValue
               ELSE
                  SET @strOutput = @strOutput + @strVariable
               IF @strExtraInfo <> ''
                  SET @strOutput = @strOutput +  ' IRB#' + @strExtraInfo
               IF @EForm=1
                  INSERT @SortTable (SortDate,VarString,VarDelimited,TableNames,Filters,Qualities,PrimaryKeys,StopDateText) VALUES(@dteDate,@strOutPut,'__'+@strOutPut+'|',@strTableName,@strFilters,@strDataQuality,@intPrimaryKey,NULLIF(@strStopDate,''))
               ELSE
                  INSERT @SortTable (SortDate,VarString,TableNames,PrimaryKeys,StopDateText) VALUES(@dteDate,@strOutPut,@strTableName,@intPrimaryKey,NULLIF(@strStopDate,''))
               SET @strOutput = ''
         END
         -- Hormone Therapy (NOT AN ELSE b/c of combination therapies)
         IF ((@strVariable LIKE '%HORM%')
            OR (@strVariable = 'ORCH')
            OR (@strVariable ='Bilateral Orchiectomy')
            OR (@strVariable LIKE 'ORCH_BIL%')
            OR (@strVariable LIKE '%LHRH%')
            OR (@strVariable LIKE '%AA%')
            OR (@strVariable LIKE '%ESTROGEN%')
            OR (@strVariable LIKE '%PROGEST%'))
            AND (@strVariable NOT LIKE '%STOP')
         BEGIN
            IF @dteDate IS NOT NULL
               IF @HormTxDate = @MISSING_DATE
                  SET @HormTxDate = @dteDate
            IF @blnPreTx = 1
               SET @NeoAdjHormTx = @strVariable   
            ELSE
               IF @MetsEvent = '' 
                  SET @AdjHormTx = @strVariable
               SET @HormEvent = @strVariable
               SET @strOutput = @strOutput + @strDate + ' '  
               IF @strStopDate <> ''
                  SET @strOutput = RTRIM(@strOutput) + '-' + @strStopDate + ' '
               IF @strValue <> ''
                  SET @strOutput = @strOutput +  @strValue
               ELSE
                  SET @strOutput = @strOutput + @strVariable
               IF @strExtraInfo <> ''
                  SET @strOutput = @strOutput +  ' IRB#' + @strExtraInfo
               --prevent the same record from being inserted again need a better way
               IF NOT EXISTS(SELECT SortDate FROM @SortTable WHERE SortDate=@dteDate AND VarString=@strOutput)
                  BEGIN
                     IF @EForm=1                  
                        INSERT @SortTable (SortDate,VarString,VarDelimited,TableNames,Filters,Qualities,PrimaryKeys,StopDateText) VALUES(@dteDate,@strOutPut,'__'+@strOutPut+'|',@strTableName,@strFilters,@strDataQuality,@intPrimaryKey,NULLIF(@strStopDate,''))
                     ELSE
                        INSERT @SortTable (SortDate,VarString,TableNames,PrimaryKeys,StopDateText) VALUES(@dteDate,@strOutPut,@strTableName,@intPrimaryKey,NULLIF(@strStopDate,''))                        
                  END
               SET @strOutput = ''   
         END 
      END    
      --Testosterone
      /*
      IF @strVariable LIKE 'TEST%' 
      --look for castrate levels of testosterone
      BEGIN 
        IF ISNUMERIC(@strValue) = 1
           IF CAST(@strValue As float(24)) < @CASTRATE_TESTOSTERONE_LEVEL
              SET @Castrate = 1     
      END
      */
      --check if castrated
      --IF @strVariable IN ('ORCH_BIL','Bilateral Orchiectomy')
      --   SET @Castrate = 1
      --Diagnostics Imaging
      /*
      these should be positive diagnostics for metastasis
      what exactly is positive?
      should it require specifying extent of disease?
      should CT and MRI be confirmed by LN_BX?
      should BS or PET be confirmed by BONE_BX?
      add target latter so can use other scan types?
      */
      /*
      IF @strVariable IN('BS','Bone Scan','BONE_BX','LN_BX') --('PET','PET Scan','XRAY','X-RAY','RADIOGRPH',)  
            --OR @strVariable LIKE 'CT%' OR @strVariable LIKE '%MRI%'--dbo.fnIsDiagnostic(@strVariable) = 1
      BEGIN
         IF @strValue LIKE 'POS%' OR 
            @strValue LIKE 'ABN_P%' OR 
            @strValue LIKE 'ABN_MAL%' OR
            @strValue='Abnormal Malignant' OR
            @strValue='Abnormal'	OR
            @strValue='Abnormal Prostate'--dbo.fnIsAbnormalDiagnostic(@strValue) = 1
            IF @ClinState < @NON_CASTRATE_METS
            BEGIN
               IF @Castrate = 1
                  SET @ClinState = @CASTRATE_METS
               ELSE
                  SET @ClinState = @NON_CASTRATE_METS
               IF @EForm=1
                  BEGIN
                     SET @ClinStateID = @intPrimaryKey
                     SET @ClinStateTable = @strTableName
                  END   
               IF @dteDate IS NOT NULL
               BEGIN
                  SET @ClinStateDate = @dteDate
                  SET @ClinStateDteText = @strDate
               END
            END
      END
      ELSE
      */
      -- Radiation Therapy
      IF @strVariable IN('XRT','EBRT','RT','COMBO','BRACHY','COMBO','RADIOISOTOPE','SEED'
                        ,'IMPLANT','Brachytherapy',
                        'External Beam','Radiation Therapy, Unspecified','External Beam, IMRT',
                        'High-Dose Rate Brachytherapy','External Beam, 3D Conventional',
                        'External Beam, 3D Conformal') --dbo.fnIsRadiationtherapy(@strVariable) = 1 OR dbo.fnIsBrachytherapy(@strVariable)= 1
      BEGIN
         IF @ClinState < @LOCALIZED
         BEGIN
            SET @ClinState = @LOCALIZED
            IF @EForm=1
               BEGIN
                  SET @ClinStateID = @intPrimaryKey
                  SET @ClinStateTable = @strTableName
                  SET @ClinStateQuality = @strDataQuality
               END   
            IF @dteDate IS NOT NULL
            BEGIN
               SET @ClinStateDate = @dteDate
               SET @ClinStateDteText = @strDate
            END                                          
         END
         IF @blnPreTx = 1
            BEGIN 
               SET @NeoAdjRadTx = @strVariable
               --SET @RadTxDate = @dteDate
               IF @dteDate IS NOT NULL
                  SET @TxDate = @dteDate
            END
         SET @strOutput = @strOutput + @strDate + ' '
         IF @strStopDate <> ''
            SET @strOutput = RTRIM(@strOutput) + '-' + @strStopDate + ' '
         SET @strOutput = @strOutput + @strVariable + ' ' + @strExtraInfo + ' ' + @strValue
         IF @EForm=1
            INSERT @SortTable (SortDate,VarString,VarDelimited,TableNames,Qualities,PrimaryKeys,StopDateText) VALUES(@dteDate,@strOutPut,'__'+@strOutPut+'|',@strTableName,@strDataQuality,@intPrimaryKey,NULLIF(@strStopDate,''))
         ELSE
            INSERT @SortTable (SortDate,VarString,TableNames,PrimaryKeys,StopDateText) VALUES(@dteDate,@strOutPut,@strTableName,@intPrimaryKey,NULLIF(@strStopDate,''))
         SET @strOutput = ''     
      END
      ELSE
      -- Extent of Disease
      IF @strVariable = 'EOD'
      BEGIN
         SET @strOutput = @strOutput + @strDate + ' ' + @strVariable + ' ' + @strValue
         IF @EForm=1
            INSERT @SortTable (SortDate,VarString,VarDelimited,TableNames,PrimaryKeys) VALUES(@dteDate,@strOutPut,'__'+@strOutPut+'|',@strTableName,@intPrimaryKey)
         ELSE
            INSERT @SortTable (SortDate,VarString,TableNames,PrimaryKeys) VALUES(@dteDate,@strOutPut,@strTableName,@intPrimaryKey)
         SET @strOutput = ''   
      END
      ELSE
      -- Radical Prostatectomy
      IF @strVariable LIKE 'R[RCPL]P' OR @strVariable LIKE '[RCPL]P' OR @strVariable LIKE 'Salv[RCPL]P' OR @strVariable='RALP' OR @strVariable = 'LP_CONV' --dbo.fnIsRadicalProstatectomy(@strVariable) = 1
      BEGIN
         IF @ClinState < @LOCALIZED
         BEGIN
           SET @ClinState = @LOCALIZED
           IF @EForm=1
              BEGIN
                 SET @ClinStateID = @intPrimaryKey
                 SET @ClinStateTable = @strTableName
                 SET @ClinStateQuality = @strDataQuality
              END
           IF @dteDate IS NOT NULL
           BEGIN
              SET @ClinStateDate = @dteDate
              SET @ClinStateDteText = @strDate
           END                                          
         END
         IF @blnPreTx = 1 
            IF @dteDate IS NOT NULL
               SET @TxDate = @dteDate
         --recoding some variables here
         SELECT @strVariable=LkpDescription FROM LookupCodes WHERE LkpCode=@strVariable AND LkpFieldName = 'ProcName' 
         SET @strOutput = @strOutput + @strDate + ' ' + ISNULL(@strVariable,'') + ' ' + @strValue
         SET @strOutput = REPLACE(REPLACE(REPLACE(REPLACE(@strOutput,'SMS','Margin'),'ECE','Extension'),'SVI','Seminal Vesicles'),'LNI','Nodes')
         IF @EForm=1
            BEGIN
               SET @strVarDelimited = REPLACE(REPLACE(REPLACE(REPLACE(@strVarDelimited,'SMS','Margin'),'ECE','Extension'),'SVI','Seminal Vesicles'),'LNI','|__Nodes')
               INSERT @SortTable (SortDate,VarString,VarDelimited,TableNames,PrimaryKeys,Filters,Qualities) VALUES(@dteDate,@strOutPut,@strVarDelimited,@strTableNames,@strPrimaryKeys,@strFilters,@strQualities)
               SET @strTableNames = ''
               SET @strPrimaryKeys = ''
               SET @strVarDelimited = ''
            END
         ELSE
            INSERT @SortTable (SortDate,VarString,TableNames,PrimaryKeys,Filters,Qualities) VALUES(@dteDate,@strOutPut,@strTableName,@intPrimaryKey,@strFilters,@strQualities)
         SET @strOutput = ''   
      END
      ELSE
      -- Status    
      IF @strVariable = 'Status'
      BEGIN
         IF @strValue IN('Localized','LCR','Local Recurrence')
            BEGIN
               IF @ClinState < @LOCALIZED 
               BEGIN
                  SET @ClinState = @LOCALIZED
                  IF @EForm=1
                     BEGIN
                        SET @ClinStateID = @intPrimaryKey
                        SET @ClinStateTable = @strTableName
                        SET @ClinStateQuality = @strDataQuality
                     END
                  IF @dteDate IS NOT NULL
                  BEGIN
                     SET @ClinStateDate = @dteDate
                     SET @ClinStateDteText = @strDate
                  END
               END
            END
         ELSE
            IF @strValue IN('BCR','Biochemical Recurrence')
            BEGIN
               IF @Castrate = 1 AND @ClinState < @RISING_PSA_CASTRATE
                  BEGIN
                     SET @ClinState = @RISING_PSA_CASTRATE
                     IF @dteDate IS NOT NULL
                     BEGIN
                        SET @ClinStateDate = @dteDate
                        SET @ClinStateDteText = @strDate
                     END
                  END
               ELSE IF @ClinState < @RISING_PSA_NON_CASTRATE
                  BEGIN
                     SET @ClinState = @RISING_PSA_NON_CASTRATE
                     IF @EForm=1
                        BEGIN
                           SET @ClinStateID = @intPrimaryKey
                           SET @ClinStateTable = @strTableName
                           SET @ClinStateQuality = @strDataQuality
                        END
                     IF @dteDate IS NOT NULL
                     BEGIN
                        SET @ClinStateDate = @dteDate
                        SET @ClinStateDteText = @strDate
                     END
                  END
            END
         ELSE
            IF @strValue IN('RisingPSA_Castrate','Rising PSA Castrate')
            BEGIN
               IF @ClinState < @RISING_PSA_CASTRATE
               BEGIN
                  SET @ClinState = @RISING_PSA_CASTRATE
                  IF @EForm=1
                     BEGIN
                        SET @ClinStateID = @intPrimaryKey
                        SET @ClinStateTable = @strTableName
                        SET @ClinStateQuality = @strDataQuality
                     END
                  IF @dteDate IS NOT NULL
                  BEGIN
                     SET @ClinStateDate = @dteDate
                     SET @ClinStateDteText = @strDate
                  END
               END
            END
         ELSE
            IF @strValue IN('RisingPSA_NonCastrate','Rising PSA Non-Castrate')
            BEGIN
               IF @ClinState < @RISING_PSA_NON_CASTRATE
               BEGIN
                  SET @ClinState = @RISING_PSA_NON_CASTRATE
                  IF @EForm=1
                     BEGIN
                        SET @ClinStateID = @intPrimaryKey
                        SET @ClinStateTable = @strTableName
                        SET @ClinStateQuality = @strDataQuality
                     END 
                  IF @dteDate IS NOT NULL
                  BEGIN
                     SET @ClinStateDate = @dteDate
                     SET @ClinStateDteText = @strDate
                  END
               END
            END
         ELSE
            IF @strValue IN('ClinMetsNonCastrate','Non-Castrate Mets','Clinical Mets Non-Castrate')
            BEGIN
               IF @ClinState < @NON_CASTRATE_METS
               BEGIN
                  SET @ClinState = @NON_CASTRATE_METS
                  IF @EForm=1
                     BEGIN
                        SET @ClinStateID = @intPrimaryKey
                        SET @ClinStateTable = @strTableName
                        SET @ClinStateQuality = @strDataQuality
                     END 
                  IF @dteDate IS NOT NULL
                  BEGIN
                     SET @ClinStateDate = @dteDate
                     SET @ClinStateDteText = @strDate
                  END
               END
            END
         ELSE
            IF @strValue IN('ClinMetsCastrate','Castrate Mets','Clinical Mets Castrate')
            BEGIN
               IF @ClinState < @CASTRATE_METS
               BEGIN
                  SET @ClinState = @CASTRATE_METS
                  IF @EForm=1
                     BEGIN
                        SET @ClinStateID = @intPrimaryKey
                        SET @ClinStateTable = @strTableName
                        SET @ClinStateQuality = @strDataQuality
                     END
                  IF @dteDate IS NOT NULL
                  BEGIN
                     SET @ClinStateDate = @dteDate
                     SET @ClinStateDteText = @strDate
                  END
               END
            END
         ELSE
            IF @strValue IN('METS','Distant Metastasis')
            BEGIN
               IF @ClinState < @CASTRATE_METS AND @Castrate = 1
                  BEGIN
                     SET @ClinState = @CASTRATE_METS
                     IF @EForm=1
                        BEGIN
                           SET @ClinStateID = @intPrimaryKey
                           SET @ClinStateTable = @strTableName
                           SET @ClinStateQuality = @strDataQuality
                        END
                     IF @dteDate IS NOT NULL
                     BEGIN
                        SET @ClinStateDate = @dteDate
                        SET @ClinStateDteText = @strDate
                     END
                  END
               ELSE IF @ClinState < @NON_CASTRATE_METS
                  BEGIN
                     SET @ClinState = @NON_CASTRATE_METS
                     IF @EForm=1
                        BEGIN
                           SET @ClinStateID = @intPrimaryKey
                           SET @ClinStateTable = @strTableName
                           SET @ClinStateQuality = @strDataQuality
                        END
                     IF @dteDate IS NOT NULL
                     BEGIN
                        SET @ClinStateDate = @dteDate
                        SET @ClinStateDteText = @strDate
                     END
                  END
            END
         ELSE
            IF @strValue IN('DOD','DOC','DUC','Dead','Death from Prostate Cancer','Death from Other Cause',
                            'Death from Unknown Causes')
            BEGIN
               If @ClinState < @DEAD 
                  BEGIN
                     SET @ClinState = @DEAD
                     IF @EForm=1
                        BEGIN
                           SET @ClinStateID = @intPrimaryKey
                           SET @ClinStateTable = @strTableName
                           SET @ClinStateQuality = @strDataQuality
                        END
                     IF @dteDate IS NOT NULL
                     BEGIN
                        SET @ClinStateDate = @dteDate
                        SET @ClinStateDteText = @strDate
                     END
                  END
            END
      END
      --Protocols
      IF @strVariable = 'Protocol'
      BEGIN
         SET @strOutput = @strOutput + @strDate + ' '  
         IF @strStopDate <> ''
            SET @strOutput = RTRIM(@strOutput) + '-' + @strStopDate + ' '
         IF @strVariable <> ''
            SET @strOutput = @strOutput +  @strVariable
         IF @strExtraInfo <> ''
            SET @strOutput = @strOutput +  ' ' + @strExtraInfo
         IF @strValue <> ''
            SET @strOutput = @strOutput + ' ' + @strValue

         IF @EForm=1
            INSERT @SortTable (SortDate,VarString,VarDelimited,TableNames,Qualities,PrimaryKeys,StopDateText) VALUES(@dteDate,@strOutPut,'__'+@strOutPut+'|',@strTableName,@strDataQuality,@intPrimaryKey,NULLIF(@strStopDate,''))
         ELSE
            INSERT @SortTable (SortDate,VarString,TableNames,PrimaryKeys) VALUES(@dteDate,@strOutPut,@strTableName,@intPrimaryKey)
         SET @strOutput = ''
      END
      ELSE
      --PRINT @strDate + ' ' + @strVariable + ' ' + @strValue + ' ' + @strDataQuality
      --SET @stoptime= GETDATE()
      --SET @strdebug = @strdebug + char(10) + @strVariable + ' ' + @stoptime --Cast to text
      --SELECT @stoptime - @starttime
      
      --Here we catch a bunch of values that are normally ignored and instead put them back into the output table
      IF @strTableName IN('MedicalTherapy','RadiationTherapy','BrachyTherapy','Procedures')
         BEGIN
            IF NOT EXISTS(SELECT PrimaryKeys FROM @SortTable WHERE TableNames LIKE '%' + @strTableName + '%' AND PrimaryKeys LIKE '%' + CAST(@intPrimaryKey as varchar(50)) + '%')
               BEGIN
                  IF @strTableName IN('MedicalTherapy','RadiationTherapy')
                     BEGIN
                        SET @strOutput = ISNULL(@strDate,'') + ' ' 
                        IF @strStopDate <> ''
                           SET @strOutput = RTRIM(@strOutput) + '-' + @strStopDate + ' '
                        IF @strTableName='MedicalTherapy'
                           BEGIN
                              IF @strValue <> ''
                                 SET @strOutput = @strOutput +  @strValue
                              ELSE
                                 SET @strOutput = @strOutput + @strVariable
                              IF @strExtraInfo <> ''
                                 SET @strOutput = @strOutput +  ' IRB#' + @strExtraInfo
                           END
                        ELSE
                           SET @strOutput = @strOutput+@strVariable+' '+' '+@strExtraInfo+' '+@strValue
                     END  
                  ELSE IF (@strTableName = 'Procedures' AND @intPrimaryKey<>@DxBiopsyID) OR @strTableName = 'BrachyTherapy'
                     SET @strOutput = RTRIM(LTRIM(ISNULL(@strDate,'') + ' ' + ISNULL(@strVariable,'') + ' ' + ISNULL(@strValue,'')))
                  IF @EForm=1
                     BEGIN
                        IF @strVarDelimited IS NOT NULL AND @strTableNames IS NOT NULL AND @strPrimaryKeys IS NOT NULL
                           INSERT @SortTable (SortDate,VarString,VarDelimited,TableNames,PrimaryKeys,StopDateText,Filters,Qualities) VALUES(@dteDate,@strOutPut,@strVarDelimited,@strTableNames,@strPrimaryKeys,NULLIF(@strStopDate,''),@strFilters,@strQualities)
                        ELSE
                           INSERT @SortTable (SortDate,VarString,VarDelimited,TableNames,PrimaryKeys,StopDateText,Filters,Qualities) VALUES(@dteDate,@strOutPut,'__'+@strOutPut+'|',@strTableName,@intPrimaryKey,NULLIF(@strStopDate,''),@strFilters,@strDataQuality)
                     END
                  ELSE
                     INSERT @SortTable (SortDate,VarString,TableNames,PrimaryKeys,StopDateText,Filters,Qualities) VALUES(@dteDate,@strOutPut,@strTableName,@intPrimaryKey,NULLIF(@strStopDate,''),@strFilters,@strQualities)
                  SET @strOutput = '' 
               END
         END
      FETCH NEXT FROM tables_cursor INTO @strDate,@strVariable,@strValue,@strDataQuality,@dteDate,@strStopDate,@strTableName,@intPrimaryKey,@strExtraInfo,@strFilters,@strQualities,@strVarDelimited,@strTableNames,@strPrimaryKeys
      --SET @starttime= GETDATE()
   END
   DEALLOCATE tables_cursor
   --PRINT @strdebug
END      
   --Capture PreDx Biopsy PSA
   SELECT TOP 1 @PreDxBxPSA=VarValue, @PreDxBxPSAID=PrimaryKey, @PreDxBxPSAQuality=Quality
   FROM @ChronoTable 
   WHERE TableName='LabTests' AND VarName='PSA' AND VarValue<>'' AND SortDate<=@DxBxDate 
   ORDER BY SortDate DESC
   --reformat BxSummary
   IF LEFT(@DxBxSummary,3) LIKE '[1-5]+[1-5]'
      SET @DxBxSummary = 'Gleason ' + CAST(CAST(LEFT(@DxBxSummary,1) AS int) 
                       + CAST(SUBSTRING(@DxBxSummary,3,1) AS int) AS varchar(50)) + ' (' + LEFT(@DxBxSummary,3) + ')' 
                       + CASE WHEN LEN(@DxBxSummary)>3 THEN RIGHT(@DxBxSummary,LEN(@DxBxSummary)-3) ELSE '' END 
   ELSE IF @DxBxSummary<>''
      SET @DxBxSummary = 'Gleason ' + @DxBxSummary
   IF @EForm <> 1
      SET @DxBxSummary = @DxBxSummary + ISNULL(' (' + @DxBxQuality + ')','')

   -- assembles diagnosis date, stage, grade, pre tx psa line
   IF @EForm=1
      BEGIN
         IF @DxBxDate <> @MISSING_DATE
            BEGIN
               SET @strPatientHPI = @DxBxDateText + ' '
            	SET @strTableNames = 'Procedures'
               SET @strQualities = ISNULL(@DxBxQuality,@NO_DQ)
               SET @strPrimaryKeys = CAST(@DxBiopsyID as varchar(50))
               SET @strVarDelimited = '__' + @DxBxDateText + ' ' +  '|'
            END 
         IF @ClinStageT <> ''
            BEGIN
               --SET @strPatientHPI = @strPatientHPI + @ClinStageT + ' (' + RIGHT(@ClinStageSystem,2) + ') '
               SET @strPatientHPI = @strPatientHPI + @ClinStageT + @ClinStageN + @ClinStageM + ' (' + RIGHT(@ClinStageSystem,2) + ') '
               SET @strTableNames = @strTableNames + ',ClinicalStages'
               SET @strQualities = @strQualities +  ISNULL(',' + @ClinStageQuality,','+@NO_DQ)
               SET @strPrimaryKeys = @strPrimaryKeys + ',' + CAST(@ClinStageID as varchar(50))
               SET @strVarDelimited = @strVarDelimited + '__' + @ClinStageT + @ClinStageN + @ClinStageM + ' (' + RIGHT(@ClinStageSystem,2) + ')|'
            END
         IF @DxBxType <> ''
            BEGIN 
               SET @strPatientHPI =  @strPatientHPI + @DxBxType + ' ' + @DxBxSummary + ' '
               SET @strTableNames = @strTableNames + ',Procedures'
               SET @strQualities = @strQualities +  ISNULL(',' + @DxBxQuality,','+@NO_DQ)
               SET @strPrimaryKeys = @strPrimaryKeys + ',' + CAST(@DxBiopsyID as varchar(50))
               SET @strVarDelimited = @strVarDelimited + '__' + @DxBxType + ' ' + @DxBxSummary + '|'
            END
         IF @PreDxBxPSA <> ''
            BEGIN
               SET @strPatientHPI = @strPatientHPI + ' PSA ' + @PreDxBxPSA + ' '
               SET @strTableNames = @strTableNames + ',LabTests'
               SET @strQualities = @strQualities +  ISNULL(',' + @PreDxBxPSAQuality,','+@NO_DQ)
               SET @strPrimaryKeys = @strPrimaryKeys + ',' + CAST(@PreDxBxPSAID as varchar(50))
               SET @strVarDelimited = @strVarDelimited + '__ PSA ' + CAST(@PreDxBxPSA AS varchar(50)) + '|'
            END
         --strip leading comma from TableNames and PrimaryKeys concatenation
         IF LEFT(@strTableNames,1) = ','
            SET @strTableNames = RIGHT(@strTableNames,LEN(@strTableNames)-1)
         IF LEFT(@strPrimaryKeys,1) = ','
            SET @strPrimaryKeys = RIGHT(@strPrimaryKeys,LEN(@strPrimaryKeys)-1)
         INSERT @SortTable (SortDate,VarString,VarDelimited,TableNames,Qualities,PrimaryKeys,Filters) VALUES(CASE WHEN @DxBxDate <> @MISSING_DATE THEN @DxBxDate ELSE NULL END,@strPatientHPI,@strVarDelimited,@strTableNames,@strQualities,@strPrimaryKeys,'ProstateProc')
         SET @strTableNames = ''
         SET @strPrimaryKeys = ''
         SET @strVarDelimited = ''
      END 
   ELSE
      BEGIN
         IF @DxBxType <> ''
            SET @DxBxSummary = @DxBxType + ' ' + @DxBxSummary
         IF @DxBxDate <> @MISSING_DATE
            SET @strPatientHPI = @DxBxDateText
         IF @ClinStageT <> ''
            SET @strPatientHPI = @strPatientHPI + ' ' + @ClinStageT + @ClinStageN + @ClinStageM + ' (' + RIGHT(@ClinStageSystem,2) + ')'
         IF @DxBxSummary <> ''
            SET @strPatientHPI = @strPatientHPI + ' ' + @DxBxSummary  
         IF @PreDxBxPSA <> ''
            SET @strPatientHPI = @strPatientHPI + ' PSA ' + @PreDxBxPSA + ' '
         IF @strPatientHPI <> ''
            INSERT @SortTable (SortDate,VarString,VarDelimited,TableNames,PrimaryKeys,Filters) VALUES(CASE WHEN @DxBxDate <> @MISSING_DATE THEN @DxBxDate ELSE NULL END,@strPatientHPI,NULL,NULL,NULL,'ProstateProc')
      END
   SET @strPatientHPI = ''   -- make sure this is set to '' by default

   -- assemble clinical state / status line
   IF @ClinStateDate <> @MISSING_DATE 
   BEGIN
      SET @strPatientHPI = @strPatientHPI + @ClinStateDteText + ' '
      -- decode numeric clinical states back into text for display
      --Removed by request orignially coded as 'No Prostate Cancer Diagnosis '
      IF @ClinState = @NO_PROSTATE_CANCER_DIAGNOSIS
         SET @strPatientHPI = '' --@strPatientHPI + ''
      IF @ClinState = @LOCALIZED
         SET @strPatientHPI = @strPatientHPI + 'Localized'
      IF @ClinState = @RISING_PSA_NON_CASTRATE
         SET @strPatientHPI = @strPatientHPI + 'Rising PSA Non-Castrate'
      IF @ClinState = @RISING_PSA_CASTRATE
         SET @strPatientHPI = @strPatientHPI + 'Rising PSA Castrate'
      --Removed by request, orignially coded as 'Non-Castrate Mets'
      IF @ClinState = @NON_CASTRATE_METS
         SET @strPatientHPI = '' --@strPatientHPI + 'Metastasis' 
      IF @ClinState = @CASTRATE_METS
         SET @strPatientHPI = @strPatientHPI + 'Castrate Mets'
      IF @ClinState = @DEAD
         SET @strPatientHPI = @strPatientHPI + 'Dead'

      IF @EForm=1 AND @strPatientHPI <> ''
         BEGIN
            SET @strVarDelimited = '__' + @strPatientHPI + '|'
            SET @strTableNames = @ClinStateTable
            SET @strPrimaryKeys = CAST(@ClinstateID as varchar(50))
            INSERT @SortTable (SortDate,VarString,VarDelimited,TableNames,Qualities,PrimaryKeys,Filters) VALUES(CASE WHEN @ClinStateDate <> @MISSING_DATE THEN @ClinStateDate ELSE NULL END,@strPatientHPI,@strVarDelimited,@strTableNames,@ClinStateQuality,@strPrimaryKeys,CASE WHEN @ClinStateTable = 'Procedures' THEN 'ProstateProc' END)
            SET @strTableNames = ''
            SET @strPrimaryKeys = ''
            SET @strVarDelimited = ''
         END
      ELSE
         INSERT @SortTable (SortDate,VarString) VALUES(CASE WHEN @ClinStateDate <> @MISSING_DATE THEN @ClinStateDate ELSE NULL END,@strPatientHPI)
   END      
   SET @strPatientHPI = '' 

   IF @EForm=1
      BEGIN
         SELECT VarString AS PatientHPI,VarDelimited AS PatientHPIDelimited,TableNames,
                PrimaryKeys, SortDate, StopDateText, Filters, Qualities
         FROM @SortTable WHERE VarString <> '' ORDER BY SortDate
         SET @Rowcount = @@ROWCOUNT
      END
   ELSE
      BEGIN
         SELECT VarString AS PatientHPI--,TableNames,PrimaryKeys
         FROM @SortTable WHERE VarString <> '' ORDER BY SortDate
         SET @Rowcount = @@ROWCOUNT
      END
   --SELECT * FROM @ChronoTable

   SELECT @DxBiopsyID AS DxBiopsyId
GO


