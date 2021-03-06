SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
ALTER PROCEDURE [dbo].[spGetPatientHPI]
   @PatientId int = NULL,
   @NomogramResults bit = 0,  --retired
   @NomogramValues bit = 0,   --retired
   @EForm bit = 0,
   @Rowcount int = NULL OUTPUT
AS
--Procedure returns HPI as a select statement instead of output parameter for flexibility
SET NOCOUNT ON

--These variables are for debuging / testing speed
DECLARE @starttime datetime
DECLARE @stoptime datetime
Declare @strDebug varchar(8000)
--End of Debug variables

DECLARE @strPatientHPI     varchar(500)
DECLARE @strDate           varchar(50)
DECLARE @strStopDate       varchar(50)
DECLARE @dteDate           datetime
DECLARE @strVariable       varchar(50)
DECLARE @strValue          varchar(255)
DECLARE @strDataQuality    varchar(50)
DECLARE @intPrimaryKey     int
DECLARE @strTableName      varchar(50)
DECLARE @i                 int
DECLARE @blnPreTx          bit
DECLARE @blnValidPSA       bit
DECLARE @sngTime           float(24) --VBA single float(53) double
DECLARE @BiopsyDate        datetime
DECLARE @BiopsyDays        float(24) -- number of days after prostate biopsy that PSA is invalid
DECLARE @strOutPut         varchar(500)

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
DECLARE @DxBxSummary      varchar(50)     --pathologic summary of diagnostic biopsy: eg. 3+4
DECLARE @DxBxQuality      varchar(50)     --data quality for diagnostic biopsy
DECLARE @PreTxPSA         float(24)       --valid PSA before any "curative" treatment (XRT or RP)
DECLARE @PreTxPSADate     datetime 
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
--DECLARE @ActiveSurId      int           --primary key of Active Surveillance status record

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
DECLARE @ClinStageID       int             --primary key for diagnostic clinical stage record
DECLARE @PreTxPSAID        int             --primary key for pre prostatectomy psa record
DECLARE @ClinStateID       int             --primary key for clin state record
DECLARE @ClinStateTable    varchar(50)     --table name where clin state obtained from
DECLARE @blnHadRP          bit             --patient had prostatectomy
DECLARE @ProstatePathId    int             --primary key for ProstatectomyPath record
DECLARE @PLNDProcId        int             --primary key for Procedure PLND record


--used for eform
SET @strTableNames    = ''
SET @strPrimaryKeys   = ''
SET @strVarDelimited  = ''

SET @ClinStateDate    = @MISSING_DATE
SET @ClinStateDteText = ''
SET @ClinState        = @NO_PROSTATE_CANCER_DIAGNOSIS
SET @Castrate         = 0
SET @DxBxDate         = @MISSING_DATE
SET @DxBxDateText     = ''
SET @DxBxType         = ''
SET @DxBxSummary      = ''
SET @DxBxQuality      = ''
SET @PreTxPSA         = @MISSING_NUMBER
SET @PreTxPSADate     = @MISSING_DATE
SET @ClinStageDate    = @MISSING_DATE
SET @ClinStageSystem  = ''
SET @ClinStageT       = ''
SET @ClinStageN       = ''
SET @ClinStageM       = ''
SET @ClinStageQuality = ''
SET @NeoAdjHormTx     = 0
SET @NeoAdjHormTxDate = @MISSING_DATE
SET @NeoAdjRadTx      = 0
SET @NeoAdjRadTxDate  = @MISSING_DATE
SET @NeoAdjChemoTx    = 0
SET @NeoAdjChemoDate  = @MISSING_DATE
SET @HormTxDate       = @MISSING_DATE
SET @ChemoTxDate      = @MISSING_DATE
SET @blnHadRP         = 0
SET @TxDate           = @MISSING_DATE
SET @TxType           = ''
--SET @NumPSAs          = 0
SET @EOD              = ''
SET @LastPSA_Value    = @MISSING_NUMBER
SET @LastPSA_Date     = @MISSING_DATE
SET @MetsEvent        = ''
SET @HormEvent        = ''
 
DECLARE @SortTable TABLE
--Temp Table used to force the HPI to sort in an order 
   (
   SortDate              datetime NULL,
   VarString             varchar(500) NULL,
   VarDelimited          varchar(500) NULL,
   TableNames            varchar(200) NULL,
   PrimaryKeys           varchar(50) NULL
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
   PrimaryKey   int NOT NULL
   )

INSERT @ChronoTable (VarDate,VarName,VarValue,Quality,SortDate,TableName,PrimaryKey)
SELECT ProcDateText, ProcName, CAST(dbo.fnSummaryBxProstate(PathGG1,PathGG2,PathGGS,PathResult) as varchar(255)), ISNULL(PathQuality,ProcQuality), ProcDate, 'Procedures', Procedures.ProcedureId
FROM Procedures INNER JOIN Pathology ON Procedures.ProcedureId = Pathology.ProcedureId
                LEFT OUTER JOIN ProstateBiopsyPath ON Pathology.PathologyId=ProstateBiopsyPath.PathologyId
WHERE Procedures.PatientId = @PatientId AND 
      ProcSite='Prostate' AND ProcName IN('TURP','TRUS Biopsy','Biopsy','Needle Biopsy')

INSERT @ChronoTable (VarDate,VarName,VarValue,Quality,SortDate,TableName,PrimaryKey)
SELECT ClinStageDateText, ClinStageSystem, ClinStageT, ClinStageQuality, ClinStageDate, 'ClinicalStages', ClinicalStageId
FROM ClinicalStages
WHERE (ClinicalStages.PatientId = @PatientId)

INSERT @ChronoTable (VarDate,VarName,VarValue,Quality,SortDate,TableName,PrimaryKey)
SELECT DxDateText, DxType, DxResult, DxQuality, DxDate,  'Diagnostics', DiagnosticId
FROM Diagnostics
WHERE (Diagnostics.PatientId = @PatientId)

INSERT @ChronoTable (VarDate,VarName,VarValue,Quality,SortDate,TableName,PrimaryKey)
SELECT LabDateText, LabTest, LabResult, LabQuality, LabDate, 'LabTests', LabTestId
FROM LabTests
WHERE (LabTests.PatientId = @PatientId AND LabTest IN ('PSA','PSAUS','TEST') AND LabResult IS NOT NULL)

INSERT @ChronoTable (VarDate,VarName,VarValue,Quality,SortDate,VarStopDate,TableName,PrimaryKey)
SELECT MedTxDateText, MedTxType, MedTxAgent, MedTxQuality, MedTxDate,MedTxStopDateText, 'MedicalTherapy', MedicalTherapyId
FROM MedicalTherapy
WHERE (MedicalTherapy.PatientId = @PatientId)

INSERT @ChronoTable (VarDate,VarName,VarValue,Quality,SortDate,TableName,PrimaryKey)
SELECT ProcDateText,LTRIM(ISNULL(ProcSide,'') + ' Orchiectomy'), LTRIM(ISNULL(ProcSide,'') + ' Orchiectomy'), ProcQuality, ProcDate,'Procedures', Procedures.ProcedureId
FROM Procedures 
WHERE PatientId = @PatientId AND ProcName = 'Orchiectomy'

INSERT @ChronoTable (VarDate,VarName,VarValue,Quality,SortDate,TableName,PrimaryKey)
SELECT ProcDateText, 'Nephrectomy', ISNULL(ProcName,'Nephrectomy') + ISNULL(' '+ProcSide,''), ProcQuality, ProcDate, 'Procedures',Procedures.ProcedureId
FROM Procedures
WHERE PatientId = @PatientId AND ProcName IN('Nephrectomy','Partial Nephrectomy','Laparoscopic Nephroureterectomy','Partial for Horshoe Kidney','Laparoscopic Partial Nephrectomy','Nephroureterectomy','Laparoscopic Radical Nephrectomy','Radical Nephrectomy','Exploratory Laparotomy')

INSERT @ChronoTable (VarDate,VarName,VarValue,Quality,SortDate,TableName,PrimaryKey)
SELECT ProcDateText, 'RPLND', RTRIM('RPLND ' + ISNULL(ProcApproach,'')), ProcQuality, ProcDate,'Procedures', Procedures.ProcedureId
FROM Procedures 
WHERE PatientId = @PatientId AND ProcName = 'RPLND'

--Added Rank in case need to use top 1 clause to return only the best row version
INSERT @ChronoTable (VarDate,VarName,VarValue,Quality,SortDate,TableName,PrimaryKey)
SELECT ProcDateText, ProcName, RPSummary, DataQuality, ProcDate, TableName, ProcedureId
FROM 
(
SELECT ProcDateText, ISNULL(ProcName,'Prostatectomy') ProcName,
       dbo.fnSummaryRP(PathGG1,PathGG2,PathGGS,PathMargin,PathExtension,PathSV_Inv,Procedures.OperatingRoomDetailId,ISNULL(PathQuality,ProcQuality)) + ' (' + 
       dbo.fnGetNodeRatio(Procedures.OperatingRoomDetailId,ISNULL(PathQuality,ProcQuality))+ ')' + ' (' + ISNULL(PathQuality,ProcQuality) + ')' RPSummary, 
       ISNULL(PathQuality,ProcQuality) DataQuality, ProcDate,  'Procedures' TableName, Procedures.ProcedureId,
       CASE PathQuality WHEN 'OUT' THEN 1 
                        WHEN 'REV' THEN 2
                        WHEN 'STD' THEN 3
                        WHEN 'RR' THEN 4
                        ELSE 0
       END RP_RANK
FROM Procedures LEFT OUTER JOIN Pathology ON Pathology.ProcedureId = Procedures.ProcedureId 
                LEFT OUTER JOIN ProstatectomyPath ON ProstatectomyPath.PathologyId = Pathology.PathologyId
WHERE Procedures.PatientId = @PatientId AND ProcName IN('CP','LP','LP_CONV','PP','RALP','RP','SalvCP','SalvLP','SalvRP')
) a 
ORDER BY ProcDate DESC, RP_RANK DESC

INSERT @ChronoTable (VarDate,VarName,VarValue,Quality,SortDate,TableName,PrimaryKey)
SELECT ProcDateText,'Cystectomy', ISNULL(ProcName,'Cystectomy'),ProcQuality,ProcDate, 'Procedures', Procedures.ProcedureId
FROM Procedures 
WHERE PatientId = @PatientId AND ProcName IN('Cystectomy','CP','Cysto-Prostatectomy','Partial Cystectomy','Radical Cystectomy','Salvage Radical Cystectomy')
      AND Procedures.ProcedureId NOT IN (SELECT PrimaryKey FROM @ChronoTable WHERE TableName='Procedures')

--procedures not in the current list
INSERT @ChronoTable (VarDate,VarName,VarValue,Quality,SortDate,TableName,PrimaryKey)
SELECT ProcDateText, ProcName, LTRIM(ISNULL(ProcSide + ' ','') + ISNULL(ProcSite,'')), ProcQuality, ProcDate, 'Procedures', Procedures.ProcedureId
FROM Procedures LEFT OUTER JOIN 
                (SELECT PrimaryKey FROM @ChronoTable WHERE TableName = 'Procedures') AS b
                ON Procedures.ProcedureId = b.PrimaryKey
WHERE Procedures.PatientId = @PatientId AND b.PrimaryKey IS NULL

INSERT @ChronoTable (VarDate,VarName,VarValue,Quality,SortDate,VarStopDate,TableName,PrimaryKey)
SELECT RadTxDateText, RadTxType, RadTxTotalDose, RadTxQuality, RadTxDate,RadTxStopDateText, 'RadiationTherapy', RadiationTherapyId
FROM RadiationTherapy
WHERE (RadiationTherapy.PatientId = @PatientId)

INSERT @ChronoTable (VarDate,VarName,VarValue,Quality,SortDate,TableName,PrimaryKey)
SELECT BrachyDateText,'Brachytherapy',BrachyIsotope,BrachyQuality,BrachyDate,'BrachyTherapy',PatientId
FROM BrachyTherapy
WHERE (BrachyTherapy.PatientId = @PatientId AND ISNULL(BrachyPending,0)=0)

INSERT @ChronoTable (VarDate,VarName,VarValue,Quality,SortDate,TableName,PrimaryKey)
SELECT StatusDateText, 'Status', status, statusQuality, statusDate, 'Status', statusId
FROM Status
WHERE (Status.PatientId = @PatientId)

INSERT @ChronoTable (VarDate,VarName,VarValue,Quality,SortDate,TableName,PrimaryKey)
SELECT PtDeathDateText, 'Status', PtDeathType, Null, PtDeathDate, 'Patients', PatientID
FROM Patients
WHERE (PtDeathDate IS NOT NULL) AND (PatientID=@PatientID)

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

--SELECT * FROM @ChronoTable ORDER BY SortDate
SET @strOutPut = ''
SET @strPatientHPI = ''
DECLARE tables_cursor CURSOR LOCAL FAST_FORWARD
   FOR
   SELECT VarDate,VarName,VarValue,Quality,SortDate,VarStopDate,PrimaryKey,TableName
   FROM @ChronoTable
   ORDER BY SortDate ASC
OPEN tables_cursor
IF CURSOR_STATUS ('local','tables_cursor') = 1
BEGIN
   --SET @starttime= GETDATE()
   --SET @strDebug= 'START ' + CAST(@starttime as varchar)
   FETCH NEXT FROM tables_cursor INTO @strDate,@strVariable,@strValue,@strDataQuality,@dteDate,@strStopDate,@intPrimaryKey,@strTableName
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
      IF @strVariable IN('PSA','PSAUS')
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
                     BEGIN
                        SET @PreTxPSA = CAST(@strValue AS float(24))
                        IF @EForm=1
                           SET @PreTxPSAID = @intPrimaryKey --used for eform
                     END 
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
      IF @strVariable IN('NEEDLE BIOPSY','BIOPSY','TURP','TRUS Biopsy') --dbo.fnIsBiopsyProstate (@strVariable)= 1
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
                     SET @DxBxSummary = @strValue + ' (' + @strDataQuality + ')'
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
	               SET @ClinStageQuality = @strDataQuality
                  SELECT @ClinStageN = ClinStageN, @ClinStageM = ClinStageM
                  FROM ClinicalStages WHERE ClinicalStageId = @intPrimaryKey
                  IF @EForm=1
                     SET @ClinStageID = @intPrimaryKey --used for eform
	            END
	            ELSE IF @strValue > @ClinStageT
	            BEGIN
		            -- don't need to copy date b/c all nulls sort to top
         		   SET @ClinStageSystem = @strVariable
	               SET @ClinStageT = @strValue
	               SET @ClinStageQuality = @strDataQuality
                  SELECT @ClinStageN = ClinStageN, @ClinStageM = ClinStageM
                  FROM ClinicalStages WHERE ClinicalStageId = @intPrimaryKey
                  IF @EForm=1
                     SET @ClinStageID = @intPrimaryKey --used for eform
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
               IF @EForm=1
                  INSERT @SortTable (SortDate,VarString,VarDelimited,TableNames,PrimaryKeys) VALUES(@dteDate,@strOutPut,'__'+@strOutPut+'|',@strTableName,@intPrimaryKey)
               ELSE
                  INSERT @SortTable (SortDate,VarString) VALUES(@dteDate,@strOutPut)
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
               --prevent the same record from being inserted again need a better way
               IF NOT EXISTS(SELECT SortDate FROM @SortTable WHERE SortDate=@dteDate AND VarString=@strOutput)
                  BEGIN
                     IF @EForm=1                  
                        INSERT @SortTable (SortDate,VarString,VarDelimited,TableNames,PrimaryKeys) VALUES(@dteDate,@strOutPut,'__'+@strOutPut+'|',@strTableName,@intPrimaryKey)
                     ELSE
                        INSERT @SortTable (SortDate,VarString) VALUES(@dteDate,@strOutPut)                        
                  END
               SET @strOutput = ''   
         END 
      END    
      --Testosterone
      IF @strVariable LIKE 'TEST%' 
      --look for castrate levels of testosterone
      BEGIN 
        IF ISNUMERIC(@strValue) = 1
           IF CAST(@strValue As float(24)) < @CASTRATE_TESTOSTERONE_LEVEL
              SET @Castrate = 1     
      END
      --check if castrated
      IF @strVariable IN ('ORCH_BIL','Bilateral Orchiectomy')
         SET @Castrate = 1
      --Diagnostics Imaging
      --these should be positive diagnostics for metastasis
      --what exactly is positive?
      --should it require specifying extent of disease?
      --should CT and MRI be confirmed by LN_BX?
      --should BS or PET be confirmed by BONE_BX?
      --add target latter so can use other scan types?
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
                  BEGIN
                     SET @ClinState = @CASTRATE_METS
                     IF @EForm=1
                        BEGIN
                           SET @ClinStateID = @intPrimaryKey
                           SET @ClinStateTable = @strTableName
                        END   
                  END
               ELSE
                  BEGIN
                     SET @ClinState = @NON_CASTRATE_METS
                     IF @EForm=1
                        BEGIN
                           SET @ClinStateID = @intPrimaryKey
                           SET @ClinStateTable = @strTableName
                        END   
                  END
               IF @dteDate IS NOT NULL
                  BEGIN
                     SET @ClinStateDate = @dteDate
                     SET @ClinStateDteText = @strDate
                  END
            END
      END
      ELSE
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
               IF @dteDate IS NOT NULL
                  SET @TxDate = @dteDate
            END
         SET @strOutput = @strOutput + @strDate + ' '
         IF @strStopDate <> ''
            SET @strOutput = RTRIM(@strOutput) + '-' + @strStopDate + ' '
         SET @strOutput = @strOutput + @strVariable + ' ' + @strValue
         IF @EForm=1
            INSERT @SortTable (SortDate,VarString,VarDelimited,TableNames,PrimaryKeys) VALUES(@dteDate,@strOutPut,'__'+@strOutPut+'|',@strTableName,@intPrimaryKey)
         ELSE
            INSERT @SortTable (SortDate,VarString) VALUES(@dteDate,@strOutPut)
         SET @strOutput = ''     
      END
      ELSE
      -- Other Medical Therapy
      IF @strVariable IN('BIO_TX','IMMUNO','CLIN_TRIAL','STEROID','OTHER','GENE_TX')
      BEGIN
         SET @strOutput = @strOutput + @strDate + ' ' 
         IF @strStopDate <> ''
            SET @strOutput = RTRIM(@strOutput) + '-' + @strStopDate + ' '
         IF @strValue <> ''
            SET @strOutput = @strOutput +  @strValue
         ELSE
            SET @strOutput = @strOutput + @strVariable
         IF @EForm=1
            INSERT @SortTable (SortDate,VarString,VarDelimited,TableNames,PrimaryKeys) VALUES(@dteDate,@strOutPut,'__'+@strOutPut+'|',@strTableName,@intPrimaryKey)
         ELSE
            INSERT @SortTable (SortDate,VarString) VALUES(@dteDate,@strOutPut)            
         SET @strOutput = ''   
      END
      ELSE
      -- Extent of Disease
      IF @strVariable = 'EOD'
      BEGIN
         SET @strOutput = @strOutput + @strDate + ' ' + @strVariable + ' ' + @strValue -- + @CharLineFeed
         IF @EForm=1
            INSERT @SortTable (SortDate,VarString,VarDelimited,TableNames,PrimaryKeys) VALUES(@dteDate,@strOutPut,'__'+@strOutPut+'|',@strTableName,@intPrimaryKey)
         ELSE
            INSERT @SortTable (SortDate,VarString) VALUES(@dteDate,@strOutPut)
         SET @strOutput = ''   
      END
      ELSE
      -- Radical Prostatectomy
      IF @strVariable LIKE 'R[RCPL]P' OR @strVariable LIKE '[RCPL]P' OR @strVariable LIKE 'Salv[RCPL]P' OR @strVariable='RALP' OR @strVariable = 'LP_CONV' --dbo.fnIsRadicalProstatectomy(@strVariable) = 1
      BEGIN
         SET @blnHadRP = 1
         IF @ClinState < @LOCALIZED
         BEGIN
           SET @ClinState = @LOCALIZED
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
         IF @blnPreTx = 1 
            IF @dteDate IS NOT NULL
               SET @TxDate = @dteDate
         SET @strOutput = @strOutput + @strDate + ' ' + @strVariable + ' ' + @strValue -- + @CharLineFeed
         IF @EForm=1
            BEGIN
            	SET @strTableNames = 'ProstatectomyProc'
               SET @strPrimaryKeys = CAST(@intPrimaryKey as varchar(50))
               SET @strVarDelimited = '__'+ @strDate + ' ' + @strVariable + '|'
               IF @strValue <> ''
                  BEGIN
                     SELECT TOP 1 @ProstatePathId=ProstatectomyPath.PathologyId 
                     FROM Procedures INNER JOIN Pathology ON Procedures.ProcedureId=Pathology.ProcedureId
                                     INNER JOIN ProstatectomyPath ON Pathology.PathologyId=ProstatectomyPath.PathologyId
                     WHERE Procedures.ProcedureId=@intPrimaryKey
                     IF @ProstatePathId IS NOT NULL
                        BEGIN
                           SET @strTableNames = @strTableNames + ',ProstatectomyPath'
                           SET @strPrimaryKeys =  @strPrimaryKeys + ',' + CAST(@ProstatePathId as varchar(50))
                           SET @strVarDelimited = @strVarDelimited + '__' + @strValue + '|'
                        END
                     ELSE
                        SET @strVarDelimited = @strVarDelimited + '__' + @strValue + '|'

                     SELECT TOP 1 @PLNDProcId=Procedures.ProcedureId 
                     FROM Procedures LEFT OUTER JOIN Pathology ON Procedures.ProcedureId=Pathology.ProcedureId
                     WHERE Procedures.OperatingRoomDetailId IN
                           (SELECT OperatingRoomDetailId FROM Procedures WHERE ProcedureId=@intPrimaryKey) AND 
                           Procedures.PatientId=@PatientId AND ProcName='PLND' AND PathResult IS NOT NULL
                     IF @PLNDProcId IS NOT NULL
                        BEGIN
                           SET @strTableNames = @strTableNames + ',Procedures'
                           SELECT @strPrimaryKeys = @strPrimaryKeys + ',' + CAST(@PLNDProcId as varchar(50))
                           IF @ProstatePathId IS NOT NULL
                              SET @strVarDelimited = REPLACE(@strVarDelimited,'LNI','|__LNI')
                        END
                  END
               INSERT @SortTable (SortDate,VarString,VarDelimited,TableNames,PrimaryKeys) VALUES(@dteDate,@strOutPut,@strVarDelimited,@strTableNames,@strPrimaryKeys)
               SET @strTableNames = ''
               SET @strPrimaryKeys = ''
               SET @strVarDelimited = ''
            END
         ELSE
            INSERT @SortTable (SortDate,VarString) VALUES(@dteDate,@strOutPut)
         SET @strOutput = ''   
      END      
      ELSE
      -- Display all these other surgeries
      IF (@strVariable LIKE '%Orchiectomy') OR @strVariable IN('Nephrectomy','RPLND','Cystectomy')
      BEGIN
         SET @strOutput = @strOutput +  @strDate + ' ' + @strVariable + ' ' +  @strValue
         IF @EForm=1     
            INSERT @SortTable (SortDate,VarString,VarDelimited,TableNames,PrimaryKeys) VALUES(@dteDate,@strOutPut,'__'+@strOutPut+'|',@strTableName,@intPrimaryKey)
         ELSE 
            INSERT @SortTable (SortDate,VarString) VALUES(@dteDate,@strOutPut)
         SET @strOutput = ''
      END
      ELSE
      -- Status    
      IF @strVariable = 'Status'
      BEGIN

      -- Extent of Disease
         IF @strValue IN('Localized','LCR','Local Recurrence')
            BEGIN
               IF @ClinState < @LOCALIZED                   BEGIN
                        SET @ClinState = @LOCALIZED
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
            IF @strValue IN('BCR','Biochemical Recurrence')
            BEGIN
               IF @Castrate = 1 AND @ClinState < @RISING_PSA_CASTRATE
                  BEGIN
                     SET @ClinState = @RISING_PSA_CASTRATE
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
               ELSE IF @ClinState < @RISING_PSA_NON_CASTRATE
                  BEGIN
                     SET @ClinState = @RISING_PSA_NON_CASTRATE
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
            IF @strValue IN('RisingPSA_Castrate','Rising PSA Castrate')
            BEGIN
               IF @ClinState < @RISING_PSA_CASTRATE
               BEGIN
                  SET @ClinState = @RISING_PSA_CASTRATE
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
            IF @strValue IN('RisingPSA_NonCastrate','Rising PSA Non-Castrate')
            BEGIN
               IF @ClinState < @RISING_PSA_NON_CASTRATE
               BEGIN
                  SET @ClinState = @RISING_PSA_NON_CASTRATE
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
            IF @strValue IN('ClinMetsNonCastrate','Non-Castrate Mets','Clinical Mets Non-Castrate')
            BEGIN
               IF @ClinState < @NON_CASTRATE_METS
               BEGIN
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
            IF @strValue IN('ClinMetsCastrate','Castrate Mets','Clinical Mets Castrate')
            BEGIN
               IF @ClinState < @CASTRATE_METS
               BEGIN
                  SET @ClinState = @CASTRATE_METS
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
            IF @strValue IN('METS','Distant Metastasis')
            BEGIN
               IF @ClinState < @CASTRATE_METS AND @Castrate = 1
                  BEGIN
                     SET @ClinState = @CASTRATE_METS
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
               ELSE IF @ClinState < @NON_CASTRATE_METS
                  BEGIN
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
                        END   
                     IF @dteDate IS NOT NULL
                        BEGIN
                           SET @ClinStateDate = @dteDate
                           SET @ClinStateDteText = @strDate
                        END
                  END
            END
         --Active Surveillance detection removed due to inaccuracy, code based detection algorithm built
         /*
         ELSE
            IF @strValue = 'Active Surveillance'
               BEGIN
                  IF @ActiveSurId IS NULL
                     BEGIN 
                        SELECT @ActiveSurId=StatusId
                        FROM Status 
                        WHERE Status = 'Active Surveillance' AND
                              StatusDisease IN('Prostate','Prostate Cancer') AND
                              StatusDate IS NOT NULL AND
                              StatusId = @intPrimaryKey

                        IF @ActiveSurId IS NOT NULL
                           BEGIN 
                              SET @strOutput = @strDate + ' Started ' + @strValue
                              IF @EForm=1
                                 INSERT @SortTable (SortDate,VarString,VarDelimited,TableNames,PrimaryKeys) VALUES(@dteDate,@strOutPut,'__'+@strOutPut+'|',@strTableName,@intPrimaryKey)
                              ELSE
                                 INSERT @SortTable (SortDate,VarString) VALUES(@dteDate,@strOutPut)
                              SET @strOutput = ''
                           END
                     END
               END
         */
      END
      --PRINT @strDate + ' ' + @strVariable + ' ' + @strValue + ' ' + @strDataQuality
      --SET @stoptime= GETDATE()
      --SET @strdebug = @strdebug + char(10) + @strVariable + ' ' + @stoptime --Cast to text
      --SELECT @stoptime - @starttime
      FETCH NEXT FROM tables_cursor INTO @strDate,@strVariable,@strValue,@strDataQuality,@dteDate,@strStopDate,@intPrimaryKey,@strTableName
      --SET @starttime= GETDATE()
   END
   DEALLOCATE tables_cursor
   --PRINT @strdebug
END      
   
   -- assembles diagnosis date, stage, grade, pre tx psa line
   IF @EForm=1
      BEGIN
         IF @DxBxDate <> @MISSING_DATE
            BEGIN
               SET @strPatientHPI = @DxBxDateText + ' '
            	SET @strTableNames = 'Procedures'
               SET @strPrimaryKeys = CAST(@DxBiopsyID as varchar(50))
               SET @strVarDelimited = '__' + @DxBxDateText + '|'
            END 
         IF @ClinStageT <> ''
            BEGIN
               SET @strPatientHPI = @strPatientHPI + @ClinStageT + ISNULL(@ClinStageN,'') + ISNULL(@ClinStageM,'') + ' (' + RIGHT(@ClinStageSystem,2) + ') '
               SET @strTableNames = @strTableNames + ',ClinicalStages'
               SET @strPrimaryKeys = @strPrimaryKeys + ',' + CAST(@ClinStageID as varchar(50))
               SET @strVarDelimited = @strVarDelimited + '__' + @ClinStageT + ISNULL(@ClinStageN,'') + ISNULL(@ClinStageM,'') + ' (' + RIGHT(@ClinStageSystem,2) + ')|'
            END
         IF @DxBxType <> ''
            BEGIN 
               SET @strPatientHPI =  @strPatientHPI + @DxBxType + ' ' + @DxBxSummary + ' '
               SET @strTableNames = @strTableNames + ',Procedures'
               SET @strPrimaryKeys = @strPrimaryKeys + ',' + CAST(@DxBiopsyID as varchar(50))
               SET @strVarDelimited = @strVarDelimited + '__' + @DxBxType + ' ' + @DxBxSummary + '|'
            END
         IF @PreTxPSA <> @MISSING_NUMBER AND @blnHadRP =1
            BEGIN
               SET @strPatientHPI = @strPatientHPI + ' PreRP PSA ' + CAST(@PreTxPSA AS varchar(50)) + ' '
               SET @strTableNames = @strTableNames + ',LabTests'
               SET @strPrimaryKeys = @strPrimaryKeys + ',' + CAST(@PreTxPSAID as varchar(50))
               SET @strVarDelimited = @strVarDelimited + '__PreRP PSA ' + CAST(@PreTxPSA AS varchar(50)) + '|'
            END
         --strip leading comma from TableNames and PrimaryKeys concatenation
         IF LEFT(@strTableNames,1) = ','
            SET @strTableNames = RIGHT(@strTableNames,LEN(@strTableNames)-1)
         IF LEFT(@strPrimaryKeys,1) = ','
            SET @strPrimaryKeys = RIGHT(@strPrimaryKeys,LEN(@strPrimaryKeys)-1)
         INSERT @SortTable (SortDate,VarString,VarDelimited,TableNames,PrimaryKeys) VALUES(CASE WHEN @DxBxDate <> @MISSING_DATE THEN @DxBxDate ELSE NULL END,@strPatientHPI,@strVarDelimited,@strTableNames,@strPrimaryKeys)
         SET @strTableNames = ''
         SET @strPrimaryKeys = ''
         SET @strVarDelimited = ''
      END 
   ELSE
      BEGIN
         IF @DxBxDate <> @MISSING_DATE
            SET @strPatientHPI = @DxBxDateText + ' '
         IF @ClinStageT <> ''
            SET @strPatientHPI = @strPatientHPI + @ClinStageT + ISNULL(@ClinStageN,'') + ISNULL(@ClinStageM,'') + ' (' + RIGHT(@ClinStageSystem,2) + ') '
         IF @DxBxType <> ''
            SET @strPatientHPI =  @strPatientHPI + @DxBxType + ' ' + @DxBxSummary + ' ' 
         IF @PreTxPSA <> @MISSING_NUMBER AND @blnHadRP =1
            SET @strPatientHPI = @strPatientHPI + ' PreRP PSA ' + CAST(@PreTxPSA AS varchar(50)) + ' '
         INSERT @SortTable (SortDate,VarString) VALUES(CASE WHEN @DxBxDate <> @MISSING_DATE THEN @DxBxDate ELSE NULL END,@strPatientHPI)
      END
   SET @strPatientHPI = ''   -- make sure this is set to '' by default

   --adds pre diagnosis biopsy psa to HPI
   IF @EForm=1
      INSERT INTO @SortTable (SortDate,VarString,VarDelimited,TableNames,PrimaryKeys)
      SELECT TOP 1 SortDate, VarDate + ' PreDx Biopsy PSA: ' + VarValue,'__'+VarDate + ' PreDx Biopsy PSA: ' + VarValue+'|',TableName,PrimaryKey
      FROM @ChronoTable 
      WHERE TableName='LabTests' AND VarName IN('PSA','PSAUS') AND VarValue<>'' AND SortDate<=@DxBxDate
      ORDER BY SortDate DESC
   ELSE
      INSERT INTO  @SortTable (SortDate,VarString)
      SELECT TOP 1 SortDate, VarDate + ' PreDx Biopsy PSA: ' + VarValue
      FROM @ChronoTable 
      WHERE TableName='LabTests' AND VarName IN('PSA','PSAUS') AND VarValue<>'' AND SortDate<=@DxBxDate
      ORDER BY SortDate DESC

   -- assemble clinical state / status line
   IF @ClinStateDate <> @MISSING_DATE
      BEGIN
         SET @strPatientHPI = @strPatientHPI + @ClinStateDteText + ' '
         -- decode numeric clinical states back into text for display
         --IF @ClinState = @NO_PROSTATE_CANCER_DIAGNOSIS
         --   SET @strPatientHPI = @strPatientHPI + '' --Removed 'No Prostate Cancer Diagnosis '
         IF @ClinState = @LOCALIZED
            SET @strPatientHPI = @strPatientHPI + 'Localized'
         IF @ClinState = @RISING_PSA_NON_CASTRATE
            SET @strPatientHPI = @strPatientHPI + 'Rising PSA Non-Castrate'
         IF @ClinState = @RISING_PSA_CASTRATE
            SET @strPatientHPI = @strPatientHPI + 'Rising PSA Castrate'
         IF @ClinState = @NON_CASTRATE_METS
            SET @strPatientHPI = @strPatientHPI + 'Non-Castrate Mets'
         IF @ClinState = @CASTRATE_METS
            SET @strPatientHPI = @strPatientHPI + 'Castrate Mets'
         IF @ClinState = @DEAD
            SET @strPatientHPI = @strPatientHPI + 'Dead'
         IF @EForm=1
            BEGIN
               SET @strVarDelimited = '__' + @strPatientHPI + '|'
               SET @strTableNames = @ClinStateTable
               SET @strPrimaryKeys = CAST(@ClinstateID as varchar(50))
               INSERT @SortTable (SortDate,VarString,VarDelimited,TableNames,PrimaryKeys) VALUES(CASE WHEN @ClinStateDate <> @MISSING_DATE THEN @ClinStateDate ELSE NULL END,@strPatientHPI,@strVarDelimited,@strTableNames,@strPrimaryKeys)
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
         SELECT VarString AS PatientHPI,VarDelimited AS PatientHPIDelimited,TableNames,PrimaryKeys
         FROM @SortTable WHERE VarString <> '' ORDER BY SortDate
         SET @Rowcount = @@ROWCOUNT
      END
   ELSE
      BEGIN
         SELECT VarString AS PatientHPI 
         FROM @SortTable WHERE VarString <> '' ORDER BY SortDate
         SET @Rowcount = @@ROWCOUNT
      END
   --SELECT * FROM @ChronoTable
  
   SELECT @DxBiopsyID AS DxBiopsyId, NULL AS PreRPNomo,NULL AS PreRPError, 
          NULL AS PreXRTNomo, NULL AS PreXRTError, NULL AS PreBrachyNomo,
          NULL AS PreBrachyError,NULL AS PostRP2yrNomo,NULL AS PostRP5yrNomo,
          NULL AS PostRP7yrNomo,NULL PostRPError

   --Retired, used to view the parameters used to calculate nomogram scores
   IF @NomogramValues = 1 
      SELECT NULL AS PreTxPSA ,NULL AS ClinStage, NULL AS ClinStageSystem, 
             NULL AS ClinStage92, NULL AS ClinStage97, NULL AS BxGG1, 
             NULL AS BxGG2,NULL AS NeoAdjHormTx,NULL AS NeoAdjRadTx,
             @DxBiopsyID AS DxBiopsyId,NULL AS BxGGS, NULL AS XRTDose,NULL AS RP_GGS,
             NULL as RP_ECE,NULL AS RP_MarginStatus,NULL AS RP_SVI,NULL AS RP_LNI
