SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
ALTER PROCEDURE [dbo].[spChronologicalList]
	@PatientId int = NULL,
	@UserName varchar(50) = NULL,
   @AbsentEvents bit = 0,
	@Actions bit = 0,
	@Allergies bit = 0,
	@BrachyTherapy bit = 0,
	@Categories bit = 0,
	@ClinicalStages bit = 0,
	@Comorbidities bit = 0,
	@Cytologies bit = 0,
	@Diagnostics bit = 0,
	@DietaryIntake bit = 0,
	@Encounters bit = 0,
	@FamilyMembers bit = 0,
	@Hospitalizations bit = 0,
	@Identifiers bit = 0,
	@ItemsPending bit = 0, --special case
	@ItemsMissing bit = 0, --special case
	@LabTests bit = 0,
	@ListAll bit = 0, --special case
	@ListCommon bit = 0, --special case
	@ListTreatments bit = 0, --special case
	@Medications bit = 0,
	@MedicalTherapy bit = 0,
	@OperatingRoomDetails bit = 0, --special case
	@Pathology bit = 0,
	@PatientConsent bit = 0,
	@PatientPhysicians bit = 0,
	@Procedures bit = 0,
	@ProcNeuralStimulations bit = 0,
	@Protocols bit = 0,
	@QOL_Therapy bit = 0,
	@RadiationTherapy bit = 0,
	@SocialHistories bit = 0,
	@SpecimenAccessions bit = 0,
	@Surveys bit = 0,
	@Status bit = 0,
	@Toxicities bit = 0,
   @ExcludeLabs bit = 0, --special case
   @PatientProblems bit = 0
AS
SET NOCOUNT ON
--Each above variable represents a table name except for the special cases.

--DECLARE @ChronoTable TABLE 
/*
table variable might be more efficient than temp table however cannot
use syntax 'INSERT INTO @ChronoTable EXEC spChronoListAll @PatientId' with
a table variable. Cannot use a procedure as the from clause when inserting to a 
table variable would need to rewrite each spChrono child procedure as a table-valued 
function then can use that function in the FROM clause of Insert statement.
'INSERT INTO @ChronoTable SELECT * FROM dbo.fn_ChronoListAll(@PatientId)'
However sp is much more flexible than table-valued function.
*/

CREATE TABLE #ChronoTable
   (
   ChronoId         int NOT NULL Identity(1,1) PRIMARY KEY,
   VarDate          varchar(50) NULL,
   VarName          varchar(100) NULL,
   VarValue         varchar(500) NULL,
   Quality          varchar(50) NULL,
   SortDate         datetime NULL,
   GroupNumber      int NULL,
   TableName        varchar(50) COLLATE database_default NULL,
   PrimaryKey       int NOT NULL,
   ParentKey        int NULL,
   ProcId           int NULL,
   OpId             int NULL,
   CommonKey        int NULL,
   PendingNote      bit NULL DEFAULT (0)
   )

--Add single compound index
CREATE INDEX I_ChronoTable ON #ChronoTable (SortDate,CommonKey,ProcId,GroupNumber)

--holds patient Notifications records
DECLARE @NotificationTable TABLE
	(
	NotificationId int NOT NULL,
	TableName varchar(50) NULL,
	TablePrimaryKey int NULL,
	Response varchar(255) NULL
	)

--most special cases are mutually exclusive
IF @ListAll = 1
   BEGIN
      SET @AbsentEvents = 1
      SET @Actions = 1
      SET @Allergies = 1
      SET @BrachyTherapy = 1
      SET @Categories = 1
      SET @ClinicalStages = 1
      SET @Comorbidities = 1
      SET @Diagnostics = 1
      SET @DietaryIntake = 1
      SET @Encounters = 1
      SET @FamilyMembers = 1
      SET @Hospitalizations = 1
      SET @Identifiers = 1
      SET @LabTests = 1
      SET @Medications = 1
      SET @MedicalTherapy = 1
      SET @Pathology = 1
      SET @PatientConsent = 1
      SET @PatientPhysicians = 1
      SET @Procedures = 1
      SET @ProcNeuralStimulations = 1
      SET @Protocols = 1
      SET @QOL_Therapy = 1
      SET @RadiationTherapy = 1
      SET @SocialHistories = 1
      SET @OperatingRoomDetails = 1
      SET @SpecimenAccessions = 1
      SET @Status = 1
      SET @Surveys = 1
      SET @Toxicities = 1
      SET @PatientProblems = 1
   END
ELSE IF @ListCommon = 1
   BEGIN
      SET @BrachyTherapy = 1
      SET @ClinicalStages = 1
      SET @Diagnostics = 1
      SET @LabTests = 1
      SET @MedicalTherapy = 1
      SET @Pathology = 1
      SET @Procedures = 1
      SET @Protocols = 1
      SET @QOL_Therapy = 1
      SET @RadiationTherapy = 1
      SET @OperatingRoomDetails = 1
      SET @SpecimenAccessions =1
      SET @Status = 1
      SET @Toxicities = 1
   END
ELSE IF @ListTreatments = 1
   BEGIN
      SET @BrachyTherapy = 1
      SET @MedicalTherapy = 1
      SET @Procedures = 1
      SET @Protocols = 1
      SET @RadiationTherapy = 1
      SET @OperatingRoomDetails = 1
   END
ELSE IF @OperatingRoomDetails = 1
   BEGIN
      SET @Pathology = 1
      SET @Procedures = 1
      SET @ProcNeuralStimulations = 1
      SET @SpecimenAccessions = 1
   END

--Special handling for excluding labs from any list
IF @ExcludeLabs = 1
   SET @LabTests = 0

IF @AbsentEvents = 1
   INSERT INTO #ChronoTable(VarDate,VarName,VarValue,Quality,SortDate,GroupNumber,TableName,PrimaryKey,ParentKey) EXEC spChronoListAbsentEvents @PatientId
IF @Actions = 1
   INSERT INTO #ChronoTable(VarDate,VarName,VarValue,Quality,SortDate,GroupNumber,TableName,PrimaryKey,ParentKey) EXEC spChronoListActions @PatientId
IF @Allergies = 1
   INSERT INTO #ChronoTable(VarDate,VarName,VarValue,Quality,SortDate,GroupNumber,TableName,PrimaryKey,ParentKey) EXEC spChronoListAllergies @PatientId
IF @BrachyTherapy = 1
   INSERT INTO #ChronoTable(VarDate,VarName,VarValue,Quality,SortDate,GroupNumber,TableName,PrimaryKey,ParentKey) EXEC spChronoListBrachyTherapy @PatientId
IF @Categories = 1
   INSERT INTO #ChronoTable(VarDate,VarName,VarValue,Quality,SortDate,GroupNumber,TableName,PrimaryKey,ParentKey) EXEC spChronoListCategories @PatientId, @UserName
IF @ClinicalStages = 1
   INSERT INTO #ChronoTable(VarDate,VarName,VarValue,Quality,SortDate,GroupNumber,TableName,PrimaryKey,ParentKey) EXEC spChronoListClinicalStages @PatientId
IF @Comorbidities = 1
   INSERT INTO #ChronoTable(VarDate,VarName,VarValue,Quality,SortDate,GroupNumber,TableName,PrimaryKey,ParentKey) EXEC spChronoListComorbidities @PatientId
IF @Cytologies = 1
   INSERT INTO #ChronoTable(VarDate,VarName,VarValue,Quality,SortDate,GroupNumber,TableName,PrimaryKey,ParentKey) EXEC spChronoListCytologies @PatientId
IF @Diagnostics = 1
   INSERT INTO #ChronoTable(VarDate,VarName,VarValue,Quality,SortDate,GroupNumber,TableName,PrimaryKey,ParentKey) EXEC spChronoListDiagnostics @PatientId
IF @DietaryIntake = 1
   INSERT INTO #ChronoTable(VarDate,VarName,VarValue,Quality,SortDate,GroupNumber,TableName,PrimaryKey,ParentKey) EXEC spChronoListDietaryIntake @PatientId
IF @Encounters = 1
   INSERT INTO #ChronoTable(VarDate,VarName,VarValue,Quality,SortDate,GroupNumber,TableName,PrimaryKey,ParentKey) EXEC spChronoListEncounters @PatientId
IF @FamilyMembers = 1
   INSERT INTO #ChronoTable(VarDate,VarName,VarValue,Quality,SortDate,GroupNumber,TableName,PrimaryKey,ParentKey) EXEC spChronoListFamilyMembers @PatientId
IF @Hospitalizations = 1
   INSERT INTO #ChronoTable(VarDate,VarName,VarValue,Quality,SortDate,GroupNumber,TableName,PrimaryKey,ParentKey) EXEC spChronoListHospitalizations @PatientId
IF @Identifiers = 1
   INSERT INTO #ChronoTable(VarDate,VarName,VarValue,Quality,SortDate,GroupNumber,TableName,PrimaryKey,ParentKey) EXEC spChronoListIdentifiers @PatientId
IF @ItemsMissing = 1
   INSERT INTO #ChronoTable(VarDate,VarName,VarValue,Quality,SortDate,GroupNumber,TableName,PrimaryKey,ParentKey) EXEC spChronoListItemsMissing @PatientId
IF @ItemsPending = 1
   INSERT INTO #ChronoTable(VarDate,VarName,VarValue,Quality,SortDate,GroupNumber,TableName,PrimaryKey,ParentKey) EXEC spChronoListItemsPending @PatientId
IF @LabTests = 1
   INSERT INTO #ChronoTable(VarDate,VarName,VarValue,Quality,SortDate,GroupNumber,TableName,PrimaryKey,ParentKey) EXEC spChronoListLabTests @PatientId
IF @Medications = 1
   INSERT INTO #ChronoTable(VarDate,VarName,VarValue,Quality,SortDate,GroupNumber,TableName,PrimaryKey,ParentKey) EXEC spChronoListMedications @PatientId
IF @MedicalTherapy = 1
   INSERT INTO #ChronoTable(VarDate,VarName,VarValue,Quality,SortDate,GroupNumber,TableName,PrimaryKey,ParentKey) EXEC spChronoListMedicalTherapy @PatientId
IF @OperatingRoomDetails = 1
   INSERT INTO #ChronoTable(VarDate,VarName,VarValue,Quality,SortDate,GroupNumber,TableName,PrimaryKey,ParentKey) EXEC spChronoListOperatingRoomDetails @PatientId
IF @Pathology = 1
   INSERT INTO #ChronoTable(VarDate,VarName,VarValue,Quality,SortDate,GroupNumber,TableName,PrimaryKey,ParentKey,ProcId,OpId) EXEC spChronoListPathology @PatientId
IF @PatientConsent = 1
   INSERT INTO #ChronoTable(VarDate,VarName,VarValue,Quality,SortDate,GroupNumber,TableName,PrimaryKey,ParentKey) EXEC spChronoListPatientConsent @PatientId
IF @PatientPhysicians = 1
   INSERT INTO #ChronoTable(VarDate,VarName,VarValue,Quality,SortDate,GroupNumber,TableName,PrimaryKey,ParentKey) EXEC spChronoListPatientPhysicians @PatientId
IF @Procedures = 1
   INSERT INTO #ChronoTable(VarDate,VarName,VarValue,Quality,SortDate,GroupNumber,TableName,PrimaryKey,ParentKey,ProcId,OpId) EXEC spChronoListProcedures @PatientId
IF @ProcNeuralStimulations =1
   INSERT INTO #ChronoTable(VarDate,VarName,VarValue,Quality,SortDate,GroupNumber,TableName,PrimaryKey,ParentKey,ProcId,OpId) EXEC spChronoListProcNeuralStimulations @PatientIdIF @Protocols = 1
   INSERT INTO #ChronoTable(VarDate,VarName,VarValue,Quality,SortDate,GroupNumber,TableName,PrimaryKey,ParentKey) EXEC spChronoListProtocols @PatientId
IF @QOL_Therapy = 1
   INSERT INTO #ChronoTable(VarDate,VarName,VarValue,Quality,SortDate,GroupNumber,TableName,PrimaryKey,ParentKey) EXEC spChronoListQOL_Therapy @PatientId
IF @RadiationTherapy = 1
   INSERT INTO #ChronoTable(VarDate,VarName,VarValue,Quality,SortDate,GroupNumber,TableName,PrimaryKey,ParentKey) EXEC spChronoListRadiationTherapy @PatientId
IF @SocialHistories = 1
   INSERT INTO #ChronoTable(VarDate,VarName,VarValue,Quality,SortDate,GroupNumber,TableName,PrimaryKey,ParentKey) EXEC spChronoListSocialHistories @PatientId
IF @SpecimenAccessions = 1
   INSERT INTO #ChronoTable(VarDate,VarName,VarValue,Quality,SortDate,GroupNumber,TableName,PrimaryKey,ParentKey) EXEC spChronoListSpecimenAccessions @PatientId
IF @Status = 1
   INSERT INTO #ChronoTable(VarDate,VarName,VarValue,Quality,SortDate,GroupNumber,TableName,PrimaryKey,ParentKey) EXEC spChronoListStatus @PatientId
IF @Surveys = 1
   INSERT INTO #ChronoTable(VarDate,VarName,VarValue,Quality,SortDate,GroupNumber,TableName,PrimaryKey,ParentKey) EXEC spChronoListSurveys @PatientId
IF @Toxicities = 1
   INSERT INTO #ChronoTable(VarDate,VarName,VarValue,Quality,SortDate,GroupNumber,TableName,PrimaryKey,ParentKey) EXEC spChronoListToxicities @PatientId
IF @PatientProblems = 1
   INSERT INTO #ChronoTable(VarDate,VarName,VarValue,Quality,SortDate,GroupNumber,TableName,PrimaryKey,ParentKey) EXEC spChronoListPatientProblems @PatientId

--load the notifications records for the patient. PatientId is indexed
INSERT INTO @NotificationTable (NotificationId,TableName,TablePrimaryKey,Response)
SELECT NotificationId,TableName,TablePrimaryKey,Response
FROM Notifications
WHERE PatientId=@PatientId

--Would work instead of using column list but makes chrono list slower
--ALTER TABLE #ChronoTable ADD OpId int

--This section is post processing to display complex data
--ProstatectomyPath
UPDATE #ChronoTable
SET VarValue = dbo.fnSummaryRP(PathGG1,PathGG2,PathGGS,PathMargin,PathExtension,PathSV_Inv,OperatingRoomDetailId,PathQuality)
FROM #ChronoTable INNER JOIN ProstatectomyPath ON PrimaryKey = PathologyId
                  INNER JOIN Pathology ON ProstatectomyPath.PathologyId=Pathology.PathologyId
WHERE TableName = 'Pathology'
--CystectomyPath
UPDATE #ChronoTable
SET VarValue = LTRIM(ISNULL(RIGHT(PathStageSystem,2),'') + ' ' + ISNULL(PathStageT,'') + ' ' +  ISNULL(PathGrade,''))            
FROM #ChronoTable INNER JOIN CystectomyPath ON PrimaryKey = PathologyId
                  INNER JOIN Pathology ON CystectomyPath.PathologyId=Pathology.PathologyId
                  LEFT OUTER JOIN PathologyStageGrade ON Pathology.PathologyId=PathologyStageGrade.PathologyId
WHERE TableName = 'Pathology'
--PancreasPath
UPDATE #ChronoTable
SET VarValue = RTRIM(ISNULL(PathStageSystem,'') + ' ' + ISNULL(PathStageT,'')) + ' ' + RTRIM(ISNULL(PathHistology,'') + ' ' + RTRIM(ISNULL(PathGrade,'')) + ' ' + ISNULL(PathSite,''))
FROM #ChronoTable INNER JOIN PancreasPath ON PrimaryKey = PathologyId
                  INNER JOIN Pathology ON PancreasPath.PathologyId=Pathology.PathologyId
                  LEFT OUTER JOIN PathologyStageGrade ON Pathology.PathologyId=PathologyStageGrade.PathologyId
WHERE TableName = 'Pathology'
--RPLND
UPDATE #ChronoTable
SET VarValue = ISNULL(NULLIF(LTRIM(ISNULL(PathHistology,'') + ' ' + ISNULL(PathStageN,'') + ' ' +  ISNULL(PathStageM,'')),''), VarValue)
FROM #ChronoTable INNER JOIN Pathology ON PrimaryKey = Pathology.PathologyId
                  INNER JOIN RPLND_Proc ON RPLND_Proc.ProcedureId=Pathology.ProcedureId
                  LEFT OUTER JOIN PathologyStageGrade ON Pathology.PathologyId=PathologyStageGrade.PathologyId
WHERE TableName = 'Pathology'
--Endoscopy based on a lookup code
UPDATE #ChronoTable
SET VarName = ISNULL(PathSpecimenCollection,PathSpecimenType),
    VarValue = LTRIM(ISNULL(RIGHT(PathStageSystem,2),'') + ' '  + ISNULL(PathStageT,'') + ' ' + ISNULL(PathGrade,''))
FROM #ChronoTable INNER JOIN Pathology ON PrimaryKey = Pathology.PathologyId
                  LEFT OUTER JOIN PathologyStageGrade ON Pathology.PathologyId=PathologyStageGrade.PathologyId
WHERE TableName = 'Pathology' AND PathSpecimenType = 'Endoscopy'
--Prostate Biopsies
UPDATE #ChronoTable
SET VarValue = dbo.fnSummaryBxProstate(PathGG1,PathGG2,PathGGS,PathResult)
FROM #ChronoTable INNER JOIN ProstateBiopsyPath ON PrimaryKey = PathologyId
                  INNER JOIN Pathology ON ProstateBiopsyPath.PathologyId=Pathology.PathologyId
WHERE TableName = 'Pathology'

/*
The GroupNumber Columns allows a secondary sort order after the date.
It also allows the date value to be removed for certain rows.
*/
UPDATE #ChronoTable
SET GroupNumber = LkpOrder
FROM #ChronoTable INNER JOIN LookupCodes ON TableName = LkpCode
WHERE LkpFieldName = 'ChronoList' AND GroupNumber IS NULL

/*
The CommonKey column allows grouping parent and child records together
*/
UPDATE #ChronoTable
SET CommonKey = PrimaryKey
WHERE TableName IN ('Encounters','OperatingRoomDetails') AND CommonKey IS NULL

UPDATE #ChronoTable
SET CommonKey = ParentKey
WHERE TableName Like 'Enc%' AND CommonKey IS NULL

UPDATE #ChronoTable
SET CommonKey = ISNULL(OpId,ProcId)
WHERE TableName IN ('Procedures','Pathology','NeuralStimulationProcFinding') AND CommonKey IS NULL

--force patient problems to sort under encounters when possible
UPDATE #ChronoTable
SET CommonKey = b.EncounterId,
    SortDate = c.EncDate
FROM #ChronoTable a INNER JOIN
     ProblemPlans b ON a.PrimaryKey = b.PatientProblemId AND
                       TableName ='PatientProblems' INNER JOIN
     Encounters c ON b.EncounterId = c.EncounterId
WHERE CommonKey IS NULL

/*
This will force a pathology to group with it's related procedure or Operating room detail
regardless of the date assigned in the path report however date does need to be filled in
because of null comparison. 
*/
UPDATE #ChronoTable
SET SortDate = b.SortDate
FROM #ChronoTable AS a INNER JOIN 
                  (SELECT CommonKey,SortDate
                   FROM  #ChronoTable 
                   WHERE TableName IN('Procedures','OperatingRoomDetails') AND CommonKey IS NOT NULL
                  ) AS b ON a.CommonKey = b.CommonKey AND a.SortDate <> b.SortDate
WHERE a.TableName = 'Pathology' AND a.CommonKey IS NOT NULL

--Update the PendingNote using the notification data
UPDATE #ChronoTable
SET PendingNote = 1
FROM #ChronoTable AS a INNER JOIN @NotificationTable b ON a.PrimaryKey=b.TablePrimaryKey AND
                                                          a.TableName=b.TableName
WHERE ISNULL(Response,'None') = 'None'

SELECT * FROM #ChronoTable
ORDER BY SortDate,CommonKey,ProcId,GroupNumber
--DROP TABLE #ChronoTable
GO
