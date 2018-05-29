using System;
using System.Data;
using System.Data.SqlClient;

namespace Caisis.DataAccess
{
    /// <summary>
    /// Makes database calls for reports that are not table specific
    /// </summary>
    public class ReportDa
    {
        public ReportDa()
        {
        }

        public DataSet GetSurgeriesByDate(string year)
        {
            SqlCommand com = DataAccessHelper.CreateCommand("spRptSurgeriesByDate");
            DataAccessHelper.AddStringInputParam(com, "year", year);

            return DataAccessHelper.GetList(com);
        }

        public DataSet GetMissingCatheterRemovalPatients(string datasetSql)
        {
            SqlCommand com = DataAccessHelper.CreateCommand("spRptSurgCatheterRemovalMissing");
            DataAccessHelper.AddLongStringInputParam(com, "Dataset", datasetSql);
            return DataAccessHelper.GetList(com);
        }

        public DataSet GetPostOpFollowUp(string opType, string institution, string caseSurgeon, int monthsSinceSurgery, int monthsSincePSA, string datasetSQL)
        {
            SqlCommand com = DataAccessHelper.CreateCommand("spRptPostOpFU");

            DataAccessHelper.AddStringInputParam(com, "ProcName", opType);
            DataAccessHelper.AddStringInputParam(com, "OpInstitution", institution);
            DataAccessHelper.AddStringInputParam(com, "OpCaseSurgeon", caseSurgeon);
            DataAccessHelper.AddIntInputParam(com, "MonthsSinceSurgery", monthsSinceSurgery);
            DataAccessHelper.AddIntInputParam(com, "MonthsSincePSA", monthsSincePSA);
            DataAccessHelper.AddLongStringInputParam(com, "Dataset", datasetSQL);
            return DataAccessHelper.GetList(com);
        }

        public DataView GetUrologySurgeryReport(string physicianName, DateTime fromDate, DateTime toDate)
        {
            string sql = @"
DECLARE @InstitutionId int
DECLARE @PhysicianName varchar(100)

SET @InstitutionId = 1
SET @PhysicianName = N'%' + @Physician + '%'

-- Institution name variations
DECLARE @InstitutionName_1 varchar(50)
DECLARE @InstitutionName_2 varchar(50)
DECLARE @InstitutionName_3 varchar(50)
DECLARE @InstitutionName_4 varchar(50)
DECLARE @InstitutionName_5 varchar(50)
DECLARE @ProcQuality varchar(50)

SET @InstitutionName_1 = 'Memorial Sloan Kettering'
SET @InstitutionName_2 = 'Memorial Sloan Kettering Cancer Center'
SET @InstitutionName_3 = 'Memorial Sloan-Kettering Cancer Center'
SET @InstitutionName_4 = 'MSK'
SET @InstitutionName_5 = 'MSKCC'
SET @ProcQuality = 'STD'

-- Prostatectomy proc names
DECLARE @Prostatectomy_1 varchar(50)
DECLARE @Prostatectomy_2 varchar(50)
DECLARE @Prostatectomy_3 varchar(50)
DECLARE @Prostatectomy_5 varchar(50)
DECLARE @Prostatectomy_6 varchar(50)
DECLARE @Prostatectomy_7 varchar(50)
DECLARE @Prostatectomy_9 varchar(50)

SET @Prostatectomy_1 = 'RP'
SET @Prostatectomy_2 = 'LP'
SET @Prostatectomy_3 = 'RALP'
SET @Prostatectomy_5 = 'PP'
SET @Prostatectomy_6 = 'SalvRP'
SET @Prostatectomy_7 = 'SalvLP'
SET @Prostatectomy_9 = 'Partial RP'

;--last statement MUST be semicolon-terminated to use a CTE
WITH ProstatectomyTemp(PatientId, ProcedureId, OperatingRoomDetailId, PtMRN, AgeAtSurgery, ProcName, ProcSurgeon, ProcDate, ProcInstitution) AS
(
	SELECT a.PatientId, b.ProcedureId, ISNULL(b.OperatingRoomDetailId,'') AS OperatingRoomDetailId, a.PtMRN, 
		   DATEDIFF(year, a.PtBirthDate, b.ProcDate) AS AgeAtSurgery, b.ProcName, b.ProcSurgeon, b.ProcDate, b.ProcInstitution
	FROM Patients a INNER JOIN Procedures b ON a.PatientId = b.PatientId
					INNER JOIN PatientInstitutions c ON a.PatientId = c.PatientId					
	WHERE b.ProcName IN(@Prostatectomy_1, @Prostatectomy_2, @Prostatectomy_3, @Prostatectomy_5, @Prostatectomy_6, @Prostatectomy_7, @Prostatectomy_9) AND
		 (b.ProcInstitution IN(@InstitutionName_1, @InstitutionName_2, @InstitutionName_3, @InstitutionName_4, @InstitutionName_5) OR b.ProcQuality = @ProcQuality) AND
		  c.InstitutionId = @InstitutionId AND a.PtMRN <> 'TEST0000' AND b.ProcSurgeon LIKE @PhysicianName AND 
         (b.ProcDate BETWEEN @FromDate AND @ToDate)
)

SELECT a.PtMRN, a.AgeAtSurgery, a.ProcName, a.ProcSurgeon, a.ProcDate, EncounterBMI.EncBMI AS PreOpBMI, b.OpASA, b.OpEstBloodLoss, b.OpAutoTransfused, LabPrePSA.PreOpPSA,
	   PreOpGleasonSum.PreOpGleasonSum, PreOpClinStages.ClinStageT AS PreOpClinStageT, c.ProcStageT, PathStages.PathStageT, PathStages.PathStageN, PathStages.PathStageM, 
	   PathGleason.PathGGS AS PathGleasonSum, PathGleason.PathMargin AS PathMargin, ISNULL(PLNDProc.PLND_Performed, 'No') AS PLNDPerformed, PLNDPath.PLND_Result, 
       PLNDPath.TotalNodes, PLNDPath.PositiveNodes, LabPostPSA.PostOpPSA AS PostOpPSA_30Days, LabRecentPSA.LastPSA, ISNULL(PreOpMRI.PreOpMRIPerformed, 'Absent') AS PreOpMRI_Performed,   
       PreOpSurveys.PreOpContinence, PostOpSurveys.PostOpContinence, 
	   TimeToContinenanceLevel_II  = CASE WHEN PostOpSurveys.PostOpContinence = '2' THEN DATEDIFF(day, a.ProcDate, PostOpSurveys.PostOpContinenceDate) ELSE NULL END,
	   TimeToContinenanceLevel_I  = CASE WHEN PostOpSurveys.PostOpContinence = '1' THEN DATEDIFF(day, a.ProcDate, PostOpSurveys.PostOpContinenceDate) ELSE NULL END,
	   PreOpSexualSurveys.PreOpErectileFunction, PostOpSexualSurveys.PostOpErectileFunction, 
	   TimeToErectileFunctionLevel_III= CASE WHEN PostOpSexualSurveys.PostOpErectileFunction = '3' THEN DATEDIFF(day, a.ProcDate, PostOpSexualSurveys.PostOpErectileDate) ELSE NULL END,
       TimeToErectileFunctionLevel_II  = CASE WHEN PostOpSexualSurveys.PostOpErectileFunction = '2' THEN DATEDIFF(day, a.ProcDate, PostOpSexualSurveys.PostOpErectileDate) ELSE NULL END,
       TimeToErectileFunctionLevel_I  = CASE WHEN PostOpSexualSurveys.PostOpErectileFunction = '1' THEN DATEDIFF(day, a.ProcDate, PostOpSexualSurveys.PostOpErectileDate) ELSE NULL END,
	   ISNULL(PostOpToxicities.PostOpComplications, 'No') AS PostOpComplication_90days,
	   ISNULL(PostOpToxicitiesGrade.PostOpComplicationsGrade, 'No') AS PostOpComplicationGrade_90days
						 -- ASA, Blood Loss, Transfusion
FROM ProstatectomyTemp a LEFT OUTER JOIN OperatingRoomDetails b ON a.PatientId = b.PatientId AND
																  (a.OperatingRoomDetailId = ISNULL(b.OperatingRoomDetailId, '') OR a.ProcDate = b.OpDate)
						 -- T stage from RP procedure
						 LEFT OUTER JOIN ProstatectomyProc c ON a.ProcedureId = c.ProcedureId
						 -- EncBMI right before surgery
						 LEFT OUTER JOIN (SELECT b.EncDate, b.EncQuality, b.EncBMI AS EncBMI, a.PatientId, a.ProcedureId, a.OperatingRoomDetailId
										  FROM ProstatectomyTemp a INNER JOIN Encounters b ON a.PatientId = b.PatientId
										  WHERE b.EncDate = (SELECT MAX(c.EncDate)
															 FROM Encounters c
															 WHERE c.PatientId = b.PatientId AND c.EncDate < a.ProcDate																 
															) AND b.EncBMI IS NOT NULL AND
												ISNULL(b.EncQuality,'') = CASE WHEN EXISTS (SELECT c.EncQuality
																							FROM Encounters c
																							WHERE c.PatientId = b.PatientId AND c.EncDate = b.EncDate AND c.EncQuality = 'RR') THEN 'RR'
																			   WHEN EXISTS (SELECT c.EncQuality
																						    FROM Encounters c
																						    WHERE c.PatientId = b.PatientId AND c.EncDate = b.EncDate AND c.EncQuality = 'STD') THEN 'STD'
																			   WHEN EXISTS (SELECT c.EncQuality
																						    FROM Encounters c
																						    WHERE c.PatientId = b.PatientId AND c.EncDate = b.EncDate AND c.EncQuality = 'REV') THEN 'REV'
																			   WHEN EXISTS (SELECT c.EncQuality
																						    FROM Encounters c
																						    WHERE c.PatientId = b.PatientId AND c.EncDate = b.EncDate AND c.EncQuality = 'OUT') THEN 'OUT'
																			   ELSE ISNULL(NULL,'')
																		  END
										  GROUP BY b.EncDate, b.EncQuality, b.EncBMI, a.PatientId, a.ProcedureId, a.OperatingRoomDetailId
										  ) AS EncounterBMI ON a.PatientId = EncounterBMI.PatientId AND 
															   a.ProcedureId = EncounterBMI.ProcedureId AND 															   
															   a.OperatingRoomDetailId = EncounterBMI.OperatingRoomDetailId
						-- PreOp PSA value and date immediately before proc date
						LEFT OUTER JOIN (SELECT b.LabDate AS PreOpPSA_Date , b.LabQuality, b.LabResult AS PreOpPSA, a.PatientId, a.ProcedureId, a.OperatingRoomDetailId
										 FROM ProstatectomyTemp a INNER JOIN LabTests b ON a.PatientId = b.PatientId
										 WHERE b.LabDate = (SELECT MAX(c.LabDate)
															FROM LabTests c
															WHERE c.PatientId = b.PatientId AND c.LabTest = 'PSA' AND c.LabDate < a.ProcDate																 
														   ) AND b.LabResult IS NOT NULL AND 
											   ISNULL(b.LabQuality, '') = CASE WHEN EXISTS (SELECT c.LabQuality
																							FROM LabTests c
																							WHERE c.PatientId = b.PatientId AND c.LabTest = 'PSA' AND c.LabDate = b.LabDate AND c.LabQuality = 'RR') THEN 'RR'
																			   WHEN EXISTS (SELECT c.LabQuality
						 																    FROM LabTests c
																						    WHERE c.PatientId = b.PatientId AND c.LabTest = 'PSA' AND c.LabDate = b.LabDate AND c.LabQuality = 'STD') THEN 'STD'
																			   WHEN EXISTS (SELECT c.LabQuality
																						    FROM LabTests c
																						    WHERE c.PatientId = b.PatientId AND c.LabTest = 'PSA' AND c.LabDate = b.LabDate AND c.LabQuality = 'REV') THEN 'REV'
																			   WHEN EXISTS (SELECT c.LabQuality
																						    FROM LabTests c
																						    WHERE c.PatientId = b.PatientId AND c.LabTest = 'PSA' AND c.LabDate = b.LabDate AND c.LabQuality = 'OUT') THEN 'OUT'
																			   ELSE ISNULL(NULL,'')
																		  END AND b.LabTest = 'PSA'
										 GROUP BY b.LabDate, b.LabQuality, b.LabResult, a.PatientId, a.ProcedureId, a.OperatingRoomDetailId
										) AS LabPrePSA ON a.PatientId = LabPrePSA.PatientId AND 
													      a.ProcedureId = LabPrePSA.ProcedureId AND 
														  a.OperatingRoomDetailId = LabPrePSA.OperatingRoomDetailId
						-- PostOp PSA value and date immeditately after proc date + 30 days
						LEFT OUTER JOIN (SELECT b.LabDate AS PostOpPSA_Date, b.LabQuality, b.LabResult AS PostOpPSA, a.PatientId, a.ProcedureId, a.OperatingRoomDetailId
										 FROM ProstatectomyTemp a INNER JOIN LabTests b ON a.PatientId = b.PatientId
										 WHERE b.LabDate = (SELECT MIN(c.LabDate)
															FROM LabTests c
															WHERE c.PatientId = b.PatientId AND c.LabTest = 'PSA' AND DATEDIFF(day, a.ProcDate, c.LabDate) >= 30
														   ) AND b.LabResult IS NOT NULL AND
											   ISNULL(b.LabQuality, '') = CASE WHEN EXISTS (SELECT c.LabQuality
																							FROM LabTests c
																							WHERE c.PatientId = b.PatientId AND c.LabTest = 'PSA' AND c.LabDate = b.LabDate AND c.LabQuality = 'RR') THEN 'RR'
																			   WHEN EXISTS (SELECT c.LabQuality
						 																    FROM LabTests c
																						    WHERE c.PatientId = b.PatientId AND c.LabTest = 'PSA' AND c.LabDate = b.LabDate AND c.LabQuality = 'STD') THEN 'STD'
																			   WHEN EXISTS (SELECT c.LabQuality
																						    FROM LabTests c
																						    WHERE c.PatientId = b.PatientId AND c.LabTest = 'PSA' AND c.LabDate = b.LabDate AND c.LabQuality = 'REV') THEN 'REV'
																			   WHEN EXISTS (SELECT c.LabQuality
																						    FROM LabTests c
																						    WHERE c.PatientId = b.PatientId AND c.LabTest = 'PSA' AND c.LabDate = b.LabDate AND c.LabQuality = 'OUT') THEN 'OUT'
																			   ELSE ISNULL(NULL,'')
																		  END AND b.LabTest = 'PSA'
										 GROUP BY b.LabDate, b.LabQuality, b.LabResult, a.PatientId, a.ProcedureId, a.OperatingRoomDetailId
										) AS LabPostPSA ON a.PatientId = LabPostPSA.PatientId AND 
													       a.ProcedureId = LabPostPSA.ProcedureId AND 
														   a.OperatingRoomDetailId = LabPostPSA.OperatingRoomDetailId
						-- Last PSA: Most recent PSA
						LEFT OUTER JOIN (SELECT b.LabDate AS LastPSA_Date, b.LabQuality, b.LabResult AS LastPSA, a.PatientId, a.ProcedureId, a.OperatingRoomDetailId
										 FROM ProstatectomyTemp a INNER JOIN LabTests b ON a.PatientId = b.PatientId
										 WHERE b.LabDate = (SELECT MAX(c.LabDate)
															FROM LabTests c
															WHERE c.PatientId = b.PatientId AND c.LabTest = 'PSA'																 
														   ) AND b.LabResult IS NOT NULL AND 
											   ISNULL(b.LabQuality,'') = CASE WHEN EXISTS (SELECT c.LabQuality
																			               FROM LabTests c
																			               WHERE c.PatientId = b.PatientId AND c.LabTest = 'PSA' AND c.LabDate = b.LabDate AND c.LabQuality = 'RR') THEN 'RR'
																			  WHEN EXISTS (SELECT c.LabQuality
																 						   FROM LabTests c
																						   WHERE c.PatientId = b.PatientId AND c.LabTest = 'PSA' AND c.LabDate = b.LabDate AND c.LabQuality = 'STD') THEN 'STD'
																			  WHEN EXISTS (SELECT c.LabQuality
																						   FROM LabTests c
																						   WHERE c.PatientId = b.PatientId AND c.LabTest = 'PSA' AND c.LabDate = b.LabDate AND c.LabQuality = 'REV') THEN 'REV'
																			  WHEN EXISTS (SELECT c.LabQuality
																						   FROM LabTests c
																						   WHERE c.PatientId = b.PatientId AND c.LabTest = 'PSA' AND c.LabDate = b.LabDate AND c.LabQuality = 'OUT') THEN 'OUT'
																			  ELSE ISNULL(NULL,'')
																		 END AND b.LabTest = 'PSA'
										 GROUP BY b.LabDate, b.LabQuality, b.LabResult, a.PatientId, a.ProcedureId, a.OperatingRoomDetailId
										) AS LabRecentPSA ON a.PatientId = LabRecentPSA.PatientId AND 
														     a.ProcedureId = LabRecentPSA.ProcedureId AND 
															 a.OperatingRoomDetailId = LabRecentPSA.OperatingRoomDetailId
					     -- PreOpStage: T stage prior to RP Proc Date
						 LEFT OUTER JOIN (SELECT b.ClinStageDate, b.ClinStageQuality, b.ClinStageT AS ClinStageT, a.PatientId, a.ProcedureId, a.OperatingRoomDetailId
										  FROM ProstatectomyTemp a INNER JOIN ClinicalStages b ON a.PatientId = b.PatientId
										  WHERE b.ClinStageDate = (SELECT MAX(c.ClinStageDate)
																   FROM ClinicalStages c
																   WHERE c.PatientId = b.PatientId AND c.ClinStageDate < a.ProcDate AND 
																	    (b.ClinStageDisease LIKE '%prostate%' OR b.ClinStageDisease IS NULL)
															      ) AND b.ClinStageT IS NOT NULL AND
											    ISNULL(b.ClinStageQuality,'') = CASE WHEN EXISTS (SELECT c.ClinStageQuality
																					              FROM ClinicalStages c
																								  WHERE c.PatientId = b.PatientId AND c.ClinStageDate = b.ClinStageDate AND 
																									   (b.ClinStageDisease IN('prostate','Prostate cancer') OR b.ClinStageDisease IS NULL) AND 
																									    c.ClinStageQuality = 'RR') THEN 'RR'
																					 WHEN EXISTS (SELECT c.ClinStageQuality
																		 						  FROM ClinicalStages c
																								  WHERE c.PatientId = b.PatientId AND c.ClinStageDate = b.ClinStageDate AND 
																									   (b.ClinStageDisease IN('prostate','Prostate cancer') OR b.ClinStageDisease IS NULL) AND
																									    c.ClinStageQuality = 'STD') THEN 'STD'
																					 WHEN EXISTS (SELECT c.ClinStageQuality
																								  FROM ClinicalStages c
																								  WHERE c.PatientId = b.PatientId AND c.ClinStageDate = b.ClinStageDate AND 
																									   (b.ClinStageDisease IN('prostate','Prostate cancer') OR b.ClinStageDisease IS NULL) AND 
																									    c.ClinStageQuality = 'REV') THEN 'REV'
																					 ELSE 'OUT'
																				END AND (b.ClinStageDisease IN('prostate','Prostate cancer') OR b.ClinStageDisease IS NULL)
									 GROUP BY b.ClinStageDate, b.ClinStageQuality, b.ClinStageT, a.PatientId, a.ProcedureId, a.OperatingRoomDetailId
									) AS PreOpClinStages ON a.PatientId = PreOpClinStages.PatientId AND 
														 a.ProcedureId = PreOpClinStages.ProcedureId AND 
														 a.OperatingRoomDetailId = PreOpClinStages.OperatingRoomDetailId
						-- PreOpGleasonSum: Dx Biopsy GGS
						LEFT OUTER JOIN (SELECT b.PathDate, b.PathQuality, c.PathGGS AS PreOpGleasonSum, a.PatientId, a.ProcedureId, a.OperatingRoomDetailId
										 FROM ProstatectomyTemp a INNER JOIN Pathology b ON a.PatientId = b.PatientId
									 							  INNER JOIN ProstateBiopsyPath c ON b.PathologyId = c.PathologyId
																  INNER JOIN Procedures d ON b.PatientId = d.PatientId AND b.ProcedureId = d.ProcedureId
										 WHERE d.ProcDate = (SELECT MAX(e.ProcDate)
															 FROM Pathology c INNER JOIN ProstateBiopsyPath d ON c.PathologyId = d.PathologyId
																			  INNER JOIN Procedures e ON c.PatientId = e.PatientId AND c.ProcedureId = e.ProcedureId
															 WHERE e.PatientId = b.PatientId AND e.ProcDate < a.ProcDate) AND
											   b.PathDate = (SELECT MAX(c.PathDate)
															 FROM Pathology c INNER JOIN ProstateBiopsyPath f ON c.PathologyId = f.PathologyId
																			  INNER JOIN Procedures e ON c.PatientId = e.PatientId AND c.ProcedureId = e.ProcedureId
															 WHERE c.PatientId = b.PatientId AND e.ProcDate = d.ProcDate AND c.PathDate < a.ProcDate																 
															) AND c.PathGGS IS NOT NULL AND
											   ISNULL(b.PathQuality, '') = CASE WHEN EXISTS (SELECT c.PathQuality
																							 FROM Pathology c INNER JOIN ProstateBiopsyPath d ON c.PathologyId = d.PathologyId
																							 WHERE c.PatientId = b.PatientId AND c.PathDate = b.PathDate AND c.PathQuality = 'RR') THEN 'RR'
																			    WHEN EXISTS (SELECT c.PathQuality
						 																	 FROM Pathology c INNER JOIN ProstateBiopsyPath d ON c.PathologyId = d.PathologyId
																							 WHERE c.PatientId = b.PatientId AND c.PathDate = b.PathDate AND c.PathQuality = 'STD') THEN 'STD'
																			    WHEN EXISTS (SELECT c.PathQuality
																							 FROM Pathology c INNER JOIN ProstateBiopsyPath d ON c.PathologyId = d.PathologyId
																							 WHERE c.PatientId = b.PatientId AND c.PathDate = b.PathDate AND c.PathQuality = 'REV') THEN 'REV'
																			    WHEN EXISTS (SELECT c.PathQuality
																							 FROM Pathology c INNER JOIN ProstateBiopsyPath d ON c.PathologyId = d.PathologyId
																							 WHERE c.PatientId = b.PatientId AND c.PathDate = b.PathDate AND c.PathQuality = 'OUT') THEN 'OUT'
																			    ELSE ISNULL(NULL,'')
																		   END
									 GROUP BY b.PathDate, b.PathQuality, c.PathGGS, a.PatientId, a.ProcedureId, a.OperatingRoomDetailId
									) AS PreOpGleasonSum ON a.PatientId =PreOpGleasonSum.PatientId AND
															a.ProcedureId =PreOpGleasonSum.ProcedureId AND
														    a.OperatingRoomDetailId = PreOpGleasonSum.OperatingRoomDetailId
						-- PreOp MRI Performed: Present/Absent
						LEFT OUTER JOIN (SELECT 'Present' AS PreOpMRIPerformed, a.PatientId, a.ProcedureId, a.OperatingRoomDetailId
										 FROM ProstatectomyTemp a
										 WHERE EXISTS (SELECT b.DxDate
													   FROM Diagnostics b
													   WHERE b.PatientId = a.PatientId AND b.DxDate < a.ProcDate AND b.DxType LIKE '%MRI%'
													  )										
										) AS PreOpMRI ON a.PatientId = PreOpMRI.PatientId AND 
														 a.ProcedureId = PreOpMRI.ProcedureId AND 
														 a.OperatingRoomDetailId = PreOpMRI.OperatingRoomDetailId 
						-- PreOpContinence
						LEFT OUTER JOIN (SELECT b.SurveyDate AS PreOpContinenceDate, b.SurveyQuality, c.SurveyItemResult AS PreOpContinence, a.PatientId, a.ProcedureId, a.OperatingRoomDetailId
										 FROM ProstatectomyTemp a INNER JOIN Surveys b ON a.PatientId = b.PatientId
																  INNER JOIN SurveyItems c ON b.SurveyId = c.SurveyId AND b.SurveyType = 'Urinary Function' AND c.SurveyItem = 'Continence'
										 WHERE b.SurveyDate = (SELECT MAX(c.SurveyDate)
															   FROM Surveys c INNER JOIN SurveyItems d ON c.SurveyId = d.SurveyId AND c.SurveyType = 'Urinary Function' AND d.SurveyItem = 'Continence'
															   WHERE c.PatientId = b.PatientId AND c.SurveyDate < a.ProcDate																 
														) AND c.SurveyItemResult IS NOT NULL AND
											   ISNULL(b.SurveyQuality, '') = CASE WHEN EXISTS (SELECT c.SurveyQuality
																							   FROM Surveys c INNER JOIN SurveyItems d ON c.SurveyId = d.SurveyId AND c.SurveyType = 'Urinary Function' AND d.SurveyItem = 'Continence'
																							   WHERE c.PatientId = b.PatientId AND c.SurveyDate = b.SurveyDate AND c.SurveyQuality = 'RR') THEN 'RR'
																				  WHEN EXISTS (SELECT c.SurveyQuality
																							   FROM Surveys c INNER JOIN SurveyItems d ON c.SurveyId = d.SurveyId AND c.SurveyType = 'Urinary Function' AND d.SurveyItem = 'Continence'
																							   WHERE c.PatientId = b.PatientId AND c.SurveyDate = b.SurveyDate AND c.SurveyQuality = 'STD') THEN 'STD'
																				  WHEN EXISTS (SELECT c.SurveyQuality
																							   FROM Surveys c INNER JOIN SurveyItems d ON c.SurveyId = d.SurveyId AND c.SurveyType = 'Urinary Function' AND d.SurveyItem = 'Continence'
																							   WHERE c.PatientId = b.PatientId AND c.SurveyDate = b.SurveyDate AND c.SurveyQuality = 'MSK') THEN 'MSK'
																				  WHEN EXISTS (SELECT c.SurveyQuality
																							   FROM Surveys c INNER JOIN SurveyItems d ON c.SurveyId = d.SurveyId AND c.SurveyType = 'Urinary Function' AND d.SurveyItem = 'Continence'
																							   WHERE c.PatientId = b.PatientId AND c.SurveyDate = b.SurveyDate AND c.SurveyQuality = 'REV') THEN 'REV'
																				  WHEN EXISTS (SELECT c.SurveyQuality
																							   FROM Surveys c INNER JOIN SurveyItems d ON c.SurveyId = d.SurveyId AND c.SurveyType = 'Urinary Function' AND d.SurveyItem = 'Continence'
																							   WHERE c.PatientId = b.PatientId AND c.SurveyDate = b.SurveyDate AND c.SurveyQuality = 'OUT') THEN 'OUT'
																				  ELSE ISNULL(NULL,'')
																			 END
											 GROUP BY b.SurveyDate, b.SurveyQuality, c.SurveyItemResult, a.PatientId, a.ProcedureId, a.OperatingRoomDetailId
											) AS PreOpSurveys ON a.PatientId = PreOpSurveys.PatientId AND 
																 a.ProcedureId = PreOpSurveys.ProcedureId AND 
																 a.OperatingRoomDetailId = PreOpSurveys.OperatingRoomDetailId 
						-- PostOpContinence
						LEFT OUTER JOIN (SELECT b.SurveyDate AS PostOpContinenceDate, b.SurveyQuality, c.SurveyItemResult AS PostOpContinence, a.PatientId, a.ProcedureId, a.OperatingRoomDetailId
										 FROM ProstatectomyTemp a INNER JOIN Surveys b ON a.PatientId = b.PatientId
																  INNER JOIN SurveyItems c ON b.SurveyId = c.SurveyId AND b.SurveyType = 'Urinary Function' AND c.SurveyItem = 'Continence'
										 WHERE b.SurveyDate = (SELECT MIN(c.SurveyDate)
															   FROM Surveys c INNER JOIN SurveyItems d ON c.SurveyId = d.SurveyId AND c.SurveyType = 'Urinary Function' AND d.SurveyItem = 'Continence'
															   WHERE c.PatientId = b.PatientId AND c.SurveyDate > a.ProcDate																	 
															  ) AND c.SurveyItemResult IS NOT NULL AND
											   ISNULL(b.SurveyQuality, '') = CASE WHEN EXISTS (SELECT c.SurveyQuality
																							   FROM Surveys c INNER JOIN SurveyItems d ON c.SurveyId = d.SurveyId AND c.SurveyType = 'Urinary Function' AND d.SurveyItem = 'Continence'
																							   WHERE c.PatientId = b.PatientId AND c.SurveyDate = b.SurveyDate AND c.SurveyQuality = 'RR') THEN 'RR'
																				  WHEN EXISTS (SELECT c.SurveyQuality
																							   FROM Surveys c INNER JOIN SurveyItems d ON c.SurveyId = d.SurveyId AND c.SurveyType = 'Urinary Function' AND d.SurveyItem = 'Continence'
																							   WHERE c.PatientId = b.PatientId AND c.SurveyDate = b.SurveyDate AND c.SurveyQuality = 'STD') THEN 'STD'
																				  WHEN EXISTS (SELECT c.SurveyQuality
																							   FROM Surveys c INNER JOIN SurveyItems d ON c.SurveyId = d.SurveyId AND c.SurveyType = 'Urinary Function' AND d.SurveyItem = 'Continence'
																							   WHERE c.PatientId = b.PatientId AND c.SurveyDate = b.SurveyDate AND c.SurveyQuality = 'MSK') THEN 'MSK'
																				  WHEN EXISTS (SELECT c.SurveyQuality
																							   FROM Surveys c INNER JOIN SurveyItems d ON c.SurveyId = d.SurveyId AND c.SurveyType = 'Urinary Function' AND d.SurveyItem = 'Continence'
																							   WHERE c.PatientId = b.PatientId AND c.SurveyDate = b.SurveyDate AND c.SurveyQuality = 'REV') THEN 'REV'
																				  WHEN EXISTS (SELECT c.SurveyQuality
																							   FROM Surveys c INNER JOIN SurveyItems d ON c.SurveyId = d.SurveyId AND c.SurveyType = 'Urinary Function' AND d.SurveyItem = 'Continence'
																							   WHERE c.PatientId = b.PatientId AND c.SurveyDate = b.SurveyDate AND c.SurveyQuality = 'OUT') THEN 'OUT'
																				  ELSE ISNULL(NULL,'')
																			  END
											 GROUP BY b.SurveyDate, b.SurveyQuality, c.SurveyItemResult, a.PatientId, a.ProcedureId, a.OperatingRoomDetailId
											) AS PostOpSurveys ON a.PatientId = PostOpSurveys.PatientId AND 
																  a.ProcedureId = PostOpSurveys.ProcedureId AND 
																  a.OperatingRoomDetailId = PostOpSurveys.OperatingRoomDetailId
						-- PreOpErectileFunction
						LEFT OUTER JOIN (SELECT b.SurveyDate AS PreOpErectileDate, b.SurveyQuality, c.SurveyItemResult AS PreOpErectileFunction, a.PatientId, a.ProcedureId, a.OperatingRoomDetailId
										 FROM ProstatectomyTemp a INNER JOIN Surveys b ON a.PatientId = b.PatientId
																  INNER JOIN SurveyItems c ON b.SurveyId = c.SurveyId AND b.SurveyType = 'Sexual Function' AND c.SurveyItem = 'Erectile Function'
										 WHERE b.SurveyDate = (SELECT MAX(c.SurveyDate)
															   FROM Surveys c INNER JOIN SurveyItems d ON c.SurveyId = d.SurveyId AND c.SurveyType = 'Sexual Function' AND d.SurveyItem = 'Erectile Function'
															   WHERE c.PatientId = b.PatientId AND c.SurveyDate < a.ProcDate																 
														) AND c.SurveyItemResult IS NOT NULL AND
											   ISNULL(b.SurveyQuality, '') = CASE WHEN EXISTS (SELECT c.SurveyQuality
																							   FROM Surveys c INNER JOIN SurveyItems d ON c.SurveyId = d.SurveyId AND c.SurveyType = 'Sexual Function' AND d.SurveyItem = 'Erectile Function'
																							   WHERE c.PatientId = b.PatientId AND c.SurveyDate = b.SurveyDate AND c.SurveyQuality = 'RR') THEN 'RR'
																				  WHEN EXISTS (SELECT c.SurveyQuality
																							   FROM Surveys c INNER JOIN SurveyItems d ON c.SurveyId = d.SurveyId AND c.SurveyType = 'Sexual Function' AND d.SurveyItem = 'Erectile Function'
																							   WHERE c.PatientId = b.PatientId AND c.SurveyDate = b.SurveyDate AND c.SurveyQuality = 'STD') THEN 'STD'
																				  WHEN EXISTS (SELECT c.SurveyQuality
																							   FROM Surveys c INNER JOIN SurveyItems d ON c.SurveyId = d.SurveyId AND c.SurveyType = 'Sexual Function' AND d.SurveyItem = 'Erectile Function'
																							   WHERE c.PatientId = b.PatientId AND c.SurveyDate = b.SurveyDate AND c.SurveyQuality = 'MSK') THEN 'MSK'
																				  WHEN EXISTS (SELECT c.SurveyQuality
																							   FROM Surveys c INNER JOIN SurveyItems d ON c.SurveyId = d.SurveyId AND c.SurveyType = 'Sexual Function' AND d.SurveyItem = 'Erectile Function'
																							   WHERE c.PatientId = b.PatientId AND c.SurveyDate = b.SurveyDate AND c.SurveyQuality = 'REV') THEN 'REV'
																				  WHEN EXISTS (SELECT c.SurveyQuality
																							   FROM Surveys c INNER JOIN SurveyItems d ON c.SurveyId = d.SurveyId AND c.SurveyType = 'Sexual Function' AND d.SurveyItem = 'Erectile Function'
																							   WHERE c.PatientId = b.PatientId AND c.SurveyDate = b.SurveyDate AND c.SurveyQuality = 'OUT') THEN 'OUT'
																				  ELSE ISNULL(NULL,'')
																			  END
											 GROUP BY b.SurveyDate, b.SurveyQuality, c.SurveyItemResult, a.PatientId, a.ProcedureId, a.OperatingRoomDetailId
											) AS PreOpSexualSurveys ON a.PatientId = PreOpSexualSurveys.PatientId AND 
																	   a.ProcedureId = PreOpSexualSurveys.ProcedureId AND 
																       a.OperatingRoomDetailId = PreOpSexualSurveys.OperatingRoomDetailId
						-- PostOpErectileFunction
						LEFT OUTER JOIN (SELECT b.SurveyDate AS PostOpErectileDate, b.SurveyQuality, c.SurveyItemResult AS PostOpErectileFunction, a.PatientId, a.ProcedureId, a.OperatingRoomDetailId
										 FROM ProstatectomyTemp a INNER JOIN Surveys b ON a.PatientId = b.PatientId
																  INNER JOIN SurveyItems c ON b.SurveyId = c.SurveyId AND b.SurveyType = 'Sexual Function' AND c.SurveyItem = 'Erectile Function'
										 WHERE b.SurveyDate = (SELECT MIN(c.SurveyDate)
															   FROM Surveys c INNER JOIN SurveyItems d ON c.SurveyId = d.SurveyId AND c.SurveyType = 'Sexual Function' AND d.SurveyItem = 'Erectile Function'
															   WHERE c.PatientId = b.PatientId AND c.SurveyDate > a.ProcDate																 
														) AND c.SurveyItemResult IS NOT NULL AND
											   ISNULL(b.SurveyQuality, '') = CASE WHEN EXISTS (SELECT c.SurveyQuality
																							   FROM Surveys c INNER JOIN SurveyItems d ON c.SurveyId = d.SurveyId AND c.SurveyType = 'Sexual Function' AND d.SurveyItem = 'Erectile Function'
																							   WHERE c.PatientId = b.PatientId AND c.SurveyDate = b.SurveyDate AND c.SurveyQuality = 'RR') THEN 'RR'
																				  WHEN EXISTS (SELECT c.SurveyQuality
																							   FROM Surveys c INNER JOIN SurveyItems d ON c.SurveyId = d.SurveyId AND c.SurveyType = 'Sexual Function' AND d.SurveyItem = 'Erectile Function'
																							   WHERE c.PatientId = b.PatientId AND c.SurveyDate = b.SurveyDate AND c.SurveyQuality = 'STD') THEN 'STD'
																				  WHEN EXISTS (SELECT c.SurveyQuality
																							   FROM Surveys c INNER JOIN SurveyItems d ON c.SurveyId = d.SurveyId AND c.SurveyType = 'Sexual Function' AND d.SurveyItem = 'Erectile Function'
																							   WHERE c.PatientId = b.PatientId AND c.SurveyDate = b.SurveyDate AND c.SurveyQuality = 'MSK') THEN 'MSK'
																				  WHEN EXISTS (SELECT c.SurveyQuality
																							   FROM Surveys c INNER JOIN SurveyItems d ON c.SurveyId = d.SurveyId AND c.SurveyType = 'Sexual Function' AND d.SurveyItem = 'Erectile Function'
																							   WHERE c.PatientId = b.PatientId AND c.SurveyDate = b.SurveyDate AND c.SurveyQuality = 'REV') THEN 'REV'
																				  WHEN EXISTS (SELECT c.SurveyQuality
																							   FROM Surveys c INNER JOIN SurveyItems d ON c.SurveyId = d.SurveyId AND c.SurveyType = 'Sexual Function' AND d.SurveyItem = 'Erectile Function'
																							   WHERE c.PatientId = b.PatientId AND c.SurveyDate = b.SurveyDate AND c.SurveyQuality = 'OUT') THEN 'OUT'
																				  ELSE ISNULL(NULL,'')
																			  END
											 GROUP BY b.SurveyDate, b.SurveyQuality, c.SurveyItemResult, a.PatientId, a.ProcedureId, a.OperatingRoomDetailId
											) AS PostOpSexualSurveys ON a.PatientId = PostOpSexualSurveys.PatientId AND 
																		a.ProcedureId = PostOpSexualSurveys.ProcedureId AND 
																		a.OperatingRoomDetailId = PostOpSexualSurveys.OperatingRoomDetailId
						-- Complication Present within 90 days (Yes/No)
						LEFT OUTER JOIN (SELECT 'Yes' AS PostOpComplications, a.PatientId, a.ProcedureId, a.OperatingRoomDetailId
										 FROM ProstatectomyTemp a
										 WHERE EXISTS (SELECT b.ToxName
													   FROM Toxicities b 
													   WHERE b.PatientId = a.PatientId AND b.ToxDate > a.ProcDate AND
														     DATEDIFF(day, a.ProcDate, b.ToxDate)<90 AND b.ToxName <> 'None'
													  )
										) AS PostOpToxicities ON a.PatientId = PostOpToxicities.PatientId AND 
																 a.ProcedureId = PostOpToxicities.ProcedureId AND 
																 a.OperatingRoomDetailId = PostOpToxicities.OperatingRoomDetailId
						-- Grade >1 Complication Present within 90 days (Yes/No)
						LEFT OUTER JOIN (SELECT 'Yes' AS PostOpComplicationsGrade, a.PatientId, a.ProcedureId, a.OperatingRoomDetailId
										 FROM ProstatectomyTemp a
										 WHERE EXISTS (SELECT b.ToxName
													   FROM Toxicities b 
													   WHERE b.PatientId = a.PatientId AND b.ToxDate > a.ProcDate AND
															 DATEDIFF(day, a.ProcDate, b.ToxDate)<90 AND b.ToxName <> 'None' AND 
															 b.ToxGrade NOT IN('0','1', 'Unknown', 'None', 'UNK')	
													  )
										) AS PostOpToxicitiesGrade ON a.PatientId = PostOpToxicitiesGrade.PatientId AND 
																	  a.ProcedureId = PostOpToxicitiesGrade.ProcedureId AND 
																	  a.OperatingRoomDetailId = PostOpToxicitiesGrade.OperatingRoomDetailId
						-- Path Stage (TN):
						LEFT OUTER JOIN (SELECT b.PathDate, b.PathQuality, c.PathStageT, c.PathStageM, c.PathStageN, a.PatientId, a.ProcedureId, a.OperatingRoomDetailId
										 FROM ProstatectomyTemp a INNER JOIN Pathology b ON a.PatientId = b.PatientId AND
																						    a.OperatingRoomDetailId = ISNULL(b.OperatingRoomDetailId, '') AND
																							a.ProcedureId = b.ProcedureId
																  INNER JOIN PathologyStageGrade c ON b.PathologyId = c.PathologyId AND c.PathStageDisease = 'Prostate'
										 WHERE ISNULL(b.PathQuality, '') = CASE WHEN EXISTS (SELECT c.PathQuality
																							 FROM Pathology c INNER JOIN PathologyStageGrade d ON c.PathologyId = d.PathologyId AND d.PathStageDisease = 'Prostate'
																							 WHERE c.PatientId = b.PatientId AND ISNULL(c.OperatingRoomDetailId, '') = ISNULL(b.OperatingRoomDetailId, '') AND c.ProcedureId = b.ProcedureId AND c.PathQuality = 'RR') THEN 'RR'
																			    WHEN EXISTS (SELECT c.PathQuality
																							 FROM Pathology c INNER JOIN PathologyStageGrade d ON c.PathologyId = d.PathologyId AND d.PathStageDisease = 'Prostate'
																							 WHERE c.PatientId = b.PatientId AND ISNULL(c.OperatingRoomDetailId, '') = ISNULL(b.OperatingRoomDetailId, '') AND c.ProcedureId = b.ProcedureId AND c.PathQuality = 'STD') THEN 'STD'
																			    WHEN EXISTS (SELECT c.PathQuality
																							 FROM Pathology c INNER JOIN PathologyStageGrade d ON c.PathologyId = d.PathologyId AND d.PathStageDisease = 'Prostate'
																							 WHERE c.PatientId = b.PatientId AND ISNULL(c.OperatingRoomDetailId, '') = ISNULL(b.OperatingRoomDetailId, '') AND c.ProcedureId = b.ProcedureId AND c.PathQuality = 'REV') THEN 'REV'
																			    WHEN EXISTS (SELECT c.PathQuality
																							 FROM Pathology c INNER JOIN PathologyStageGrade d ON c.PathologyId = d.PathologyId AND d.PathStageDisease = 'Prostate'
																							 WHERE c.PatientId = b.PatientId AND ISNULL(c.OperatingRoomDetailId, '') = ISNULL(b.OperatingRoomDetailId, '') AND c.ProcedureId = b.ProcedureId AND c.PathQuality = 'OUT') THEN 'OUT'
																			    ELSE ISNULL(NULL,'')
																			END 
										 GROUP BY b.PathDate, b.PathQuality, c.PathStageT, c.PathStageM, c.PathStageN, a.PatientId, a.ProcedureId, a.OperatingRoomDetailId
																				) AS PathStages ON a.PatientId = PathStages.PatientId AND 
																								   a.ProcedureId = PathStages.ProcedureId AND
																								   a.OperatingRoomDetailId = PathStages.OperatingRoomDetailId
						-- Path Gleason, Path Margin Status: 
						LEFT OUTER JOIN (SELECT b.PathQuality, c.PathGGS AS PathGGS, c.PathMargin AS PathMargin, a.PatientId, a.ProcedureId, a.OperatingRoomDetailId
										 FROM ProstatectomyTemp a INNER JOIN Pathology b ON a.PatientId = b.PatientId AND
																						    a.OperatingRoomDetailId = ISNULL(b.OperatingRoomDetailId, '') AND
																						    a.ProcedureId = b.ProcedureId
																  INNER JOIN ProstatectomyPath c ON b.PathologyId = c.PathologyId 
										 WHERE ISNULL(b.PathQuality, '') = CASE WHEN EXISTS (SELECT c.PathQuality
																							 FROM Pathology c INNER JOIN ProstatectomyPath d ON c.PathologyId = d.PathologyId 
																							 WHERE c.PatientId = b.PatientId AND ISNULL(c.OperatingRoomDetailId, '') = ISNULL(b.OperatingRoomDetailId, '') AND c.ProcedureId = b.ProcedureId AND c.PathQuality = 'RR') THEN 'RR'
																			    WHEN EXISTS (SELECT c.PathQuality
																							 FROM Pathology c INNER JOIN ProstatectomyPath d ON c.PathologyId = d.PathologyId 
																							 WHERE c.PatientId = b.PatientId AND ISNULL(c.OperatingRoomDetailId, '') = ISNULL(b.OperatingRoomDetailId, '') AND c.ProcedureId = b.ProcedureId AND c.PathQuality = 'STD') THEN 'STD'
																			    WHEN EXISTS (SELECT c.PathQuality
																							 FROM Pathology c INNER JOIN ProstatectomyPath d ON c.PathologyId = d.PathologyId 
																							 WHERE c.PatientId = b.PatientId AND ISNULL(c.OperatingRoomDetailId, '') = ISNULL(b.OperatingRoomDetailId, '') AND c.ProcedureId = b.ProcedureId AND c.PathQuality = 'REV') THEN 'REV'
																			    WHEN EXISTS (SELECT c.PathQuality
																							 FROM Pathology c INNER JOIN ProstatectomyPath d ON c.PathologyId = d.PathologyId 
																							 WHERE c.PatientId = b.PatientId AND ISNULL(c.OperatingRoomDetailId, '') = ISNULL(b.OperatingRoomDetailId, '') AND c.ProcedureId = b.ProcedureId AND c.PathQuality = 'OUT') THEN 'OUT'
																			    ELSE ISNULL(NULL,'')
																		    END
										 GROUP BY b.PathQuality, c.PathGGS, c.PathMargin, a.PatientId, a.ProcedureId, a.OperatingRoomDetailId
										) AS PathGleason ON a.PatientId = PathGleason.PatientId AND 
															a.ProcedureId = PathGleason.ProcedureId AND
															a.OperatingRoomDetailId = PathGleason.OperatingRoomDetailId
						-- PLND Performed (Yes/No): 
						LEFT OUTER JOIN (SELECT 'Yes' AS PLND_Performed, a.PatientId, a.ProcedureId, a.OperatingRoomDetailId
										 FROM ProstatectomyTemp a 
										 WHERE EXISTS (SELECT b.ProcName
													   FROM Procedures b 
													   WHERE b.PatientId = a.PatientId AND b.ProcName = 'PLND' AND
														    (ISNULL(b.OperatingRoomDetailId, '') = a.OperatingRoomDetailId OR b.ProcDate = a.ProcDate)												    
													  )
										) AS PLNDProc ON a.PatientId = PLNDProc.PatientId AND 
														 a.ProcedureId = PLNDProc.ProcedureId AND
														 a.OperatingRoomDetailId = PLNDProc.OperatingRoomDetailId
						-- Number of total nodes, Number of positive nodes, Positive Nodes (Yes or No)
						LEFT OUTER JOIN (SELECT c.PathQuality, c.PathResult AS PLND_Result, 
										        SUM(CAST((CASE WHEN ISNUMERIC(d.PathFindNumNodes)<>1 THEN NULL ELSE d.PathFindNumNodes END) AS float)) AS TotalNodes,  
												SUM(CAST((CASE WHEN ISNUMERIC(d.PathFindPosNodes)<>1 THEN NULL ELSE d.PathFindPosNodes END) AS float)) AS PositiveNodes, 
												a.PatientId, a.ProcedureId, a.OperatingRoomDetailId
										 FROM ProstatectomyTemp a INNER JOIN Procedures b ON a.PatientId = b.PatientId AND b.ProcName = 'PLND' AND (a.OperatingRoomDetailId = ISNULL(b.OperatingRoomDetailId, '') OR a.ProcDate = b.ProcDate) 
																  INNER JOIN Pathology c ON b.PatientId = c.PatientId AND b.ProcedureId = c.ProcedureId
																  INNER JOIN NodePathFinding d ON c.PathologyId = d.PathologyId 
										 WHERE ISNULL(c.PathQuality, '') = CASE WHEN EXISTS (SELECT f.PathQuality
																							 FROM Pathology f INNER JOIN NodePathFinding k ON f.PathologyId = k.PathologyId 
																							 WHERE f.PatientId = b.PatientId AND f.ProcedureId = b.ProcedureId AND f.PathQuality = 'RR') THEN 'RR'				   
																				WHEN EXISTS (SELECT f.PathQuality
																							 FROM Pathology f INNER JOIN NodePathFinding k ON f.PathologyId = k.PathologyId  
																							 WHERE f.PatientId = b.PatientId AND f.ProcedureId = b.ProcedureId AND f.PathQuality = 'STD') THEN 'STD'
																			    WHEN EXISTS (SELECT f.PathQuality
																							 FROM Pathology f INNER JOIN NodePathFinding k ON f.PathologyId = k.PathologyId 
																							 WHERE f.PatientId = b.PatientId AND f.ProcedureId = b.ProcedureId AND f.PathQuality = 'REV') THEN 'REV'
																			    WHEN EXISTS (SELECT f.PathQuality
																							 FROM Pathology f INNER JOIN NodePathFinding k ON f.PathologyId = k.PathologyId 
																							 WHERE f.PatientId = b.PatientId AND f.ProcedureId = b.ProcedureId AND f.PathQuality = 'OUT') THEN 'OUT'
																			    ELSE ISNULL(NULL,'')
																		   END
											GROUP BY a.PatientId, a.ProcedureId, a.OperatingRoomDetailId, a.PtMRN, a.AgeAtSurgery, 
													 a.ProcName, a.ProcSurgeon, a.ProcDate, a.ProcInstitution, c.PathQuality, c.PathResult
										) AS PLNDPath ON a.PatientId = PLNDPath.PatientId AND 
														 a.ProcedureId = PLNDPath.ProcedureId AND
														 a.OperatingRoomDetailId = PLNDPath.OperatingRoomDetailId
";


            // Create new command
            SqlCommand com = DataAccessHelper.CreateWarehouseSqlCommand(sql);

            // Add User Specifed Params
            DataAccessHelper.AddStringInputParam(com, "Physician", physicianName);
            DataAccessHelper.AddDateTimeInputParam(com, "FromDate", fromDate);
            DataAccessHelper.AddDateTimeInputParam(com, "ToDate", toDate);

            return DataAccessHelper.GetList(com).Tables[0].DefaultView;
        }

        public DataView GetUrologySurgerySummary(string physicianName, DateTime fromDate, DateTime toDate, string procedureType)
        {
            string sql = @"

DECLARE @ComparisonReport TABLE
(
Physician varchar(50),
Cnt int,
Age_Range varchar(50), 
Median_Age varchar(50), 
BMI_Range varchar(50), 
Median_BMI varchar(50), 
PSA_Range varchar(50), 
Median_PSA varchar(50), 
EBL_Range varchar(50),
Median_EBL varchar(50), 
TotalNodes_Range varchar(50), 
Median_TotalNodes varchar(50), 
Median_TimeToContinenanceLevel_II varchar(50), 
Median_TimeToContinenanceLevel_I varchar(50), 
Median_TimeToErectileFunctionLevel_III varchar(50), 
Median_TimeToErectileFunctionLevel_II varchar(50), 
Median_TimeToErectileFunctionLevel_I varchar(50), 
PercentOf_PatientsTransfused varchar(50), 
PercentOf_PatientsPathT2 varchar(50), 
PercentOf_PatientsPathT3 varchar(50), 
PercentOf_PatientsWithPositiveNodes varchar(50), 
PercentOf_PatientsWithPositiveMarginT2 varchar(50), 
PercentOf_PatientsWithPositiveMarginT3 varchar(50), 
PercentOf_PatientsWithPositiveMarginOverall varchar(50), 
PercentOf_PatientsWithRecurrences varchar(50), 
PercentOf_PatientsWithComplicationGrade varchar(50), 
PercentOf_PatientsWithClinStageT1 varchar(50), 
PercentOf_PatientsWithClinStageT2 varchar(50), 
PercentOf_PatientsWithClinStageT3 varchar(50),
All_Cnt int
)


DECLARE @UrologySurgeryReport TABLE
(
PtMRN varchar(50), 
AgeAtSurgery float, 
ProcName varchar(50), 
ProcSurgeon varchar(255), 
ProcDate datetime, 
PreOpBMI varchar(50), 
OpASA varchar(50), 
OpEstBloodLoss varchar(50), 
OpAutoTransfused varchar(50), 
PreOpPSA varchar(50),
PreOpGleasonSum varchar(50), 
PreOpClinStageT varchar(50), 
ProcStageT varchar(50), 
PathStageT varchar(50), 
PathStageN varchar(50), 
PathStageM varchar(50), 
PathGleasonSum varchar(50), 
PathMargin varchar(50), 
PLNDPerformed varchar(50), 
PLND_Result varchar(50), 
TotalNodes varchar(50), 
PositiveNodes varchar(50), 
PostOpPSA_30Days varchar(50), 
LastPSA varchar(50), 
PreOpMRI_Performed varchar(50), 
PreOpContinence varchar(50), 
PostOpContinence varchar(50), 
TimeToContinenanceLevel_II float, 
TimeToContinenanceLevel_I float, 
PreOpErectileFunction varchar(50), 
PostOpErectileFunction varchar(50), 
TimeToErectileFunctionLevel_III float, 
TimeToErectileFunctionLevel_II float, 
TimeToErectileFunctionLevel_I float, 
PostOpComplication_90days varchar(50), 
PostOpComplicationGrade_90days varchar(50)
)

DECLARE @UrologySurgeryReport_Service TABLE
(
PtMRN varchar(50), 
AgeAtSurgery float, 
ProcName varchar(50), 
ProcSurgeon varchar(255), 
ProcDate datetime, 
PreOpBMI varchar(50), 
OpASA varchar(50), 
OpEstBloodLoss varchar(50), 
OpAutoTransfused varchar(50), 
PreOpPSA varchar(50),
PreOpGleasonSum varchar(50), 
PreOpClinStageT varchar(50), 
ProcStageT varchar(50), 
PathStageT varchar(50), 
PathStageN varchar(50), 
PathStageM varchar(50), 
PathGleasonSum varchar(50), 
PathMargin varchar(50), 
PLNDPerformed varchar(50), 
PLND_Result varchar(50), 
TotalNodes varchar(50), 
PositiveNodes varchar(50), 
PostOpPSA_30Days varchar(50), 
LastPSA varchar(50), 
PreOpMRI_Performed varchar(50), 
PreOpContinence varchar(50), 
PostOpContinence varchar(50), 
TimeToContinenanceLevel_II float, 
TimeToContinenanceLevel_I float, 
PreOpErectileFunction varchar(50), 
PostOpErectileFunction varchar(50), 
TimeToErectileFunctionLevel_III float, 
TimeToErectileFunctionLevel_II float, 
TimeToErectileFunctionLevel_I float, 
PostOpComplication_90days varchar(50), 
PostOpComplicationGrade_90days varchar(50)
)

INSERT INTO @ComparisonReport (Physician)
SELECT @Physician

INSERT INTO @ComparisonReport (Physician)
SELECT 'Urology Service'

DECLARE @InstitutionId int
DECLARE @PhysicianName varchar(100)

SET @InstitutionId = 1
SET @PhysicianName = N'%' + @Physician + '%'

-- Institution name variations
DECLARE @InstitutionName_1 varchar(50)
DECLARE @InstitutionName_2 varchar(50)
DECLARE @InstitutionName_3 varchar(50)
DECLARE @InstitutionName_4 varchar(50)
DECLARE @InstitutionName_5 varchar(50)
DECLARE @ProcQuality varchar(50)

SET @InstitutionName_1 = 'Memorial Sloan Kettering'
SET @InstitutionName_2 = 'Memorial Sloan Kettering Cancer Center'
SET @InstitutionName_3 = 'Memorial Sloan-Kettering Cancer Center'
SET @InstitutionName_4 = 'MSK'
SET @InstitutionName_5 = 'MSKCC'
SET @ProcQuality = 'STD'

-- Prostatectomy proc names
DECLARE @Prostatectomy_1 varchar(50)
DECLARE @Prostatectomy_2 varchar(50)
DECLARE @Prostatectomy_3 varchar(50)
DECLARE @Prostatectomy_5 varchar(50)
DECLARE @Prostatectomy_6 varchar(50)
DECLARE @Prostatectomy_7 varchar(50)
DECLARE @Prostatectomy_9 varchar(50)

SET @Prostatectomy_1 = 'RP'
SET @Prostatectomy_2 = 'LP'
SET @Prostatectomy_3 = 'RALP'
SET @Prostatectomy_5 = 'PP'
SET @Prostatectomy_6 = 'SalvRP'
SET @Prostatectomy_7 = 'SalvLP'
SET @Prostatectomy_9 = 'Partial RP'

IF @ProcedureType = 'All Prostatectomies'
BEGIN
-- This SELECT statement populates particular surgeon's data
;--last statement MUST be semicolon-terminated to use a CTE
WITH ProstatectomyTemp(PatientId, ProcedureId, OperatingRoomDetailId, PtMRN, AgeAtSurgery, ProcName, ProcSurgeon, ProcDate, ProcInstitution) AS
(
	SELECT a.PatientId, b.ProcedureId, ISNULL(b.OperatingRoomDetailId,'') AS OperatingRoomDetailId, a.PtMRN, 
		   DATEDIFF(year, a.PtBirthDate, b.ProcDate) AS AgeAtSurgery, b.ProcName, b.ProcSurgeon, b.ProcDate, b.ProcInstitution
	FROM Patients a INNER JOIN Procedures b ON a.PatientId = b.PatientId
					INNER JOIN PatientInstitutions c ON a.PatientId = c.PatientId					
	WHERE b.ProcName IN(@Prostatectomy_1, @Prostatectomy_2, @Prostatectomy_3, @Prostatectomy_5, @Prostatectomy_6, @Prostatectomy_7, @Prostatectomy_9) AND
		 (b.ProcInstitution IN(@InstitutionName_1, @InstitutionName_2, @InstitutionName_3, @InstitutionName_4, @InstitutionName_5) OR b.ProcQuality = @ProcQuality) AND
		  c.InstitutionId = @InstitutionId AND a.PtMRN <> 'TEST0000' AND b.ProcSurgeon LIKE @PhysicianName AND 
         (b.ProcDate BETWEEN @FromDate AND @ToDate)
)
INSERT INTO @UrologySurgeryReport
	  (PtMRN, AgeAtSurgery, ProcName, ProcSurgeon, ProcDate, PreOpBMI, OpASA, OpEstBloodLoss, OpAutoTransfused, PreOpPSA,
	   PreOpGleasonSum, PreOpClinStageT, ProcStageT, PathStageT, PathStageN, PathStageM, PathGleasonSum, PathMargin, 
       PLNDPerformed, PLND_Result, TotalNodes, PositiveNodes, PostOpPSA_30Days, LastPSA, PreOpMRI_Performed, PreOpContinence, 
       PostOpContinence, TimeToContinenanceLevel_II, TimeToContinenanceLevel_I, PreOpErectileFunction, PostOpErectileFunction, 
	   TimeToErectileFunctionLevel_III, TimeToErectileFunctionLevel_II, TimeToErectileFunctionLevel_I, PostOpComplication_90days, 
       PostOpComplicationGrade_90days)
SELECT a.PtMRN, a.AgeAtSurgery, a.ProcName, a.ProcSurgeon, a.ProcDate, EncounterBMI.EncBMI AS PreOpBMI, b.OpASA, b.OpEstBloodLoss, b.OpAutoTransfused, LabPrePSA.PreOpPSA,
	   PreOpGleasonSum.PreOpGleasonSum, PreOpClinStages.ClinStageT AS PreOpClinStageT, c.ProcStageT, PathStages.PathStageT, PathStages.PathStageN, PathStages.PathStageM, 
	   PathGleason.PathGGS AS PathGleasonSum, PathGleason.PathMargin AS PathMargin, ISNULL(PLNDProc.PLND_Performed, 'No') AS PLNDPerformed, PLNDPath.PLND_Result, 
       PLNDPath.TotalNodes, PLNDPath.PositiveNodes, LabPostPSA.PostOpPSA AS PostOpPSA_30Days, LabRecentPSA.LastPSA, ISNULL(PreOpMRI.PreOpMRIPerformed, 'Absent') AS PreOpMRI_Performed,   
       PreOpSurveys.PreOpContinence, PostOpSurveys.PostOpContinence, 
	   TimeToContinenanceLevel_II  = CASE WHEN PostOpSurveys.PostOpContinence = '2' THEN DATEDIFF(day, a.ProcDate, PostOpSurveys.PostOpContinenceDate) ELSE NULL END,
	   TimeToContinenanceLevel_I  = CASE WHEN PostOpSurveys.PostOpContinence = '1' THEN DATEDIFF(day, a.ProcDate, PostOpSurveys.PostOpContinenceDate) ELSE NULL END,
	   PreOpSexualSurveys.PreOpErectileFunction, PostOpSexualSurveys.PostOpErectileFunction, 
	   TimeToErectileFunctionLevel_III= CASE WHEN PostOpSexualSurveys.PostOpErectileFunction = '3' THEN DATEDIFF(day, a.ProcDate, PostOpSexualSurveys.PostOpErectileDate) ELSE NULL END,
       TimeToErectileFunctionLevel_II  = CASE WHEN PostOpSexualSurveys.PostOpErectileFunction = '2' THEN DATEDIFF(day, a.ProcDate, PostOpSexualSurveys.PostOpErectileDate) ELSE NULL END,
       TimeToErectileFunctionLevel_I  = CASE WHEN PostOpSexualSurveys.PostOpErectileFunction = '1' THEN DATEDIFF(day, a.ProcDate, PostOpSexualSurveys.PostOpErectileDate) ELSE NULL END,
	   ISNULL(PostOpToxicities.PostOpComplications, 'No') AS PostOpComplication_90days,
	   ISNULL(PostOpToxicitiesGrade.PostOpComplicationsGrade, 'No') AS PostOpComplicationGrade_90days
						 -- ASA, Blood Loss, Transfusion
FROM ProstatectomyTemp a LEFT OUTER JOIN OperatingRoomDetails b ON a.PatientId = b.PatientId AND
																  (a.OperatingRoomDetailId = ISNULL(b.OperatingRoomDetailId, '') OR a.ProcDate = b.OpDate)
						 -- T stage from RP procedure
						 LEFT OUTER JOIN ProstatectomyProc c ON a.ProcedureId = c.ProcedureId
						 -- EncBMI right before surgery
						 LEFT OUTER JOIN (SELECT b.EncDate, b.EncQuality, b.EncBMI AS EncBMI, a.PatientId, a.ProcedureId, a.OperatingRoomDetailId
										  FROM ProstatectomyTemp a INNER JOIN Encounters b ON a.PatientId = b.PatientId
										  WHERE b.EncDate = (SELECT MAX(c.EncDate)
															 FROM Encounters c
															 WHERE c.PatientId = b.PatientId AND c.EncDate < a.ProcDate																 
															) AND b.EncBMI IS NOT NULL AND
												ISNULL(b.EncQuality,'') = CASE WHEN EXISTS (SELECT c.EncQuality
																							FROM Encounters c
																							WHERE c.PatientId = b.PatientId AND c.EncDate = b.EncDate AND c.EncQuality = 'RR') THEN 'RR'
																			   WHEN EXISTS (SELECT c.EncQuality
																						    FROM Encounters c
																						    WHERE c.PatientId = b.PatientId AND c.EncDate = b.EncDate AND c.EncQuality = 'STD') THEN 'STD'
																			   WHEN EXISTS (SELECT c.EncQuality
																						    FROM Encounters c
																						    WHERE c.PatientId = b.PatientId AND c.EncDate = b.EncDate AND c.EncQuality = 'REV') THEN 'REV'
																			   WHEN EXISTS (SELECT c.EncQuality
																						    FROM Encounters c
																						    WHERE c.PatientId = b.PatientId AND c.EncDate = b.EncDate AND c.EncQuality = 'OUT') THEN 'OUT'
																			   ELSE ISNULL(NULL,'')
																		  END
										  GROUP BY b.EncDate, b.EncQuality, b.EncBMI, a.PatientId, a.ProcedureId, a.OperatingRoomDetailId
										  ) AS EncounterBMI ON a.PatientId = EncounterBMI.PatientId AND 
															   a.ProcedureId = EncounterBMI.ProcedureId AND 															   
															   a.OperatingRoomDetailId = EncounterBMI.OperatingRoomDetailId
						-- PreOp PSA value and date immediately before proc date
						LEFT OUTER JOIN (SELECT b.LabDate AS PreOpPSA_Date , b.LabQuality, b.LabResult AS PreOpPSA, a.PatientId, a.ProcedureId, a.OperatingRoomDetailId
										 FROM ProstatectomyTemp a INNER JOIN LabTests b ON a.PatientId = b.PatientId
										 WHERE b.LabDate = (SELECT MAX(c.LabDate)
															FROM LabTests c
															WHERE c.PatientId = b.PatientId AND c.LabTest = 'PSA' AND c.LabDate < a.ProcDate																 
														   ) AND b.LabResult IS NOT NULL AND 
											   ISNULL(b.LabQuality, '') = CASE WHEN EXISTS (SELECT c.LabQuality
																							FROM LabTests c
																							WHERE c.PatientId = b.PatientId AND c.LabTest = 'PSA' AND c.LabDate = b.LabDate AND c.LabQuality = 'RR') THEN 'RR'
																			   WHEN EXISTS (SELECT c.LabQuality
						 																    FROM LabTests c
																						    WHERE c.PatientId = b.PatientId AND c.LabTest = 'PSA' AND c.LabDate = b.LabDate AND c.LabQuality = 'STD') THEN 'STD'
																			   WHEN EXISTS (SELECT c.LabQuality
																						    FROM LabTests c
																						    WHERE c.PatientId = b.PatientId AND c.LabTest = 'PSA' AND c.LabDate = b.LabDate AND c.LabQuality = 'REV') THEN 'REV'
																			   WHEN EXISTS (SELECT c.LabQuality
																						    FROM LabTests c
																						    WHERE c.PatientId = b.PatientId AND c.LabTest = 'PSA' AND c.LabDate = b.LabDate AND c.LabQuality = 'OUT') THEN 'OUT'
																			   ELSE ISNULL(NULL,'')
																		  END AND b.LabTest = 'PSA'
										 GROUP BY b.LabDate, b.LabQuality, b.LabResult, a.PatientId, a.ProcedureId, a.OperatingRoomDetailId
										) AS LabPrePSA ON a.PatientId = LabPrePSA.PatientId AND 
													      a.ProcedureId = LabPrePSA.ProcedureId AND 
														  a.OperatingRoomDetailId = LabPrePSA.OperatingRoomDetailId
						-- PostOp PSA value and date immeditately after proc date + 30 days
						LEFT OUTER JOIN (SELECT b.LabDate AS PostOpPSA_Date, b.LabQuality, b.LabResult AS PostOpPSA, a.PatientId, a.ProcedureId, a.OperatingRoomDetailId
										 FROM ProstatectomyTemp a INNER JOIN LabTests b ON a.PatientId = b.PatientId
										 WHERE b.LabDate = (SELECT MIN(c.LabDate)
															FROM LabTests c
															WHERE c.PatientId = b.PatientId AND c.LabTest = 'PSA' AND DATEDIFF(day, a.ProcDate, c.LabDate) >= 30
														   ) AND b.LabResult IS NOT NULL AND
											   ISNULL(b.LabQuality, '') = CASE WHEN EXISTS (SELECT c.LabQuality
																							FROM LabTests c
																							WHERE c.PatientId = b.PatientId AND c.LabTest = 'PSA' AND c.LabDate = b.LabDate AND c.LabQuality = 'RR') THEN 'RR'
																			   WHEN EXISTS (SELECT c.LabQuality
						 																    FROM LabTests c
																						    WHERE c.PatientId = b.PatientId AND c.LabTest = 'PSA' AND c.LabDate = b.LabDate AND c.LabQuality = 'STD') THEN 'STD'
																			   WHEN EXISTS (SELECT c.LabQuality
																						    FROM LabTests c
																						    WHERE c.PatientId = b.PatientId AND c.LabTest = 'PSA' AND c.LabDate = b.LabDate AND c.LabQuality = 'REV') THEN 'REV'
																			   WHEN EXISTS (SELECT c.LabQuality
																						    FROM LabTests c
																						    WHERE c.PatientId = b.PatientId AND c.LabTest = 'PSA' AND c.LabDate = b.LabDate AND c.LabQuality = 'OUT') THEN 'OUT'
																			   ELSE ISNULL(NULL,'')
																		  END AND b.LabTest = 'PSA'
										 GROUP BY b.LabDate, b.LabQuality, b.LabResult, a.PatientId, a.ProcedureId, a.OperatingRoomDetailId
										) AS LabPostPSA ON a.PatientId = LabPostPSA.PatientId AND 
													       a.ProcedureId = LabPostPSA.ProcedureId AND 
														   a.OperatingRoomDetailId = LabPostPSA.OperatingRoomDetailId
						-- Last PSA: Most recent PSA
						LEFT OUTER JOIN (SELECT b.LabDate AS LastPSA_Date, b.LabQuality, b.LabResult AS LastPSA, a.PatientId, a.ProcedureId, a.OperatingRoomDetailId
										 FROM ProstatectomyTemp a INNER JOIN LabTests b ON a.PatientId = b.PatientId
										 WHERE b.LabDate = (SELECT MAX(c.LabDate)
															FROM LabTests c
															WHERE c.PatientId = b.PatientId AND c.LabTest = 'PSA'																 
														   ) AND b.LabResult IS NOT NULL AND 
											   ISNULL(b.LabQuality,'') = CASE WHEN EXISTS (SELECT c.LabQuality
																			               FROM LabTests c
																			               WHERE c.PatientId = b.PatientId AND c.LabTest = 'PSA' AND c.LabDate = b.LabDate AND c.LabQuality = 'RR') THEN 'RR'
																			  WHEN EXISTS (SELECT c.LabQuality
																 						   FROM LabTests c
																						   WHERE c.PatientId = b.PatientId AND c.LabTest = 'PSA' AND c.LabDate = b.LabDate AND c.LabQuality = 'STD') THEN 'STD'
																			  WHEN EXISTS (SELECT c.LabQuality
																						   FROM LabTests c
																						   WHERE c.PatientId = b.PatientId AND c.LabTest = 'PSA' AND c.LabDate = b.LabDate AND c.LabQuality = 'REV') THEN 'REV'
																			  WHEN EXISTS (SELECT c.LabQuality
																						   FROM LabTests c
																						   WHERE c.PatientId = b.PatientId AND c.LabTest = 'PSA' AND c.LabDate = b.LabDate AND c.LabQuality = 'OUT') THEN 'OUT'
																			  ELSE ISNULL(NULL,'')
																		 END AND b.LabTest = 'PSA'
										 GROUP BY b.LabDate, b.LabQuality, b.LabResult, a.PatientId, a.ProcedureId, a.OperatingRoomDetailId
										) AS LabRecentPSA ON a.PatientId = LabRecentPSA.PatientId AND 
														     a.ProcedureId = LabRecentPSA.ProcedureId AND 
															 a.OperatingRoomDetailId = LabRecentPSA.OperatingRoomDetailId
					     -- PreOpStage: T stage prior to RP Proc Date
						 LEFT OUTER JOIN (SELECT b.ClinStageDate, b.ClinStageQuality, b.ClinStageT AS ClinStageT, a.PatientId, a.ProcedureId, a.OperatingRoomDetailId
										  FROM ProstatectomyTemp a INNER JOIN ClinicalStages b ON a.PatientId = b.PatientId
										  WHERE b.ClinStageDate = (SELECT MAX(c.ClinStageDate)
																   FROM ClinicalStages c
																   WHERE c.PatientId = b.PatientId AND c.ClinStageDate < a.ProcDate AND 
																	    (b.ClinStageDisease LIKE '%prostate%' OR b.ClinStageDisease IS NULL)
															      ) AND b.ClinStageT IS NOT NULL AND
											    ISNULL(b.ClinStageQuality,'') = CASE WHEN EXISTS (SELECT c.ClinStageQuality
																					              FROM ClinicalStages c
																								  WHERE c.PatientId = b.PatientId AND c.ClinStageDate = b.ClinStageDate AND 
																									   (b.ClinStageDisease IN('prostate','Prostate cancer') OR b.ClinStageDisease IS NULL) AND 
																									    c.ClinStageQuality = 'RR') THEN 'RR'
																					 WHEN EXISTS (SELECT c.ClinStageQuality
																		 						  FROM ClinicalStages c
																								  WHERE c.PatientId = b.PatientId AND c.ClinStageDate = b.ClinStageDate AND 
																									   (b.ClinStageDisease IN('prostate','Prostate cancer') OR b.ClinStageDisease IS NULL) AND
																									    c.ClinStageQuality = 'STD') THEN 'STD'
																					 WHEN EXISTS (SELECT c.ClinStageQuality
																								  FROM ClinicalStages c
																								  WHERE c.PatientId = b.PatientId AND c.ClinStageDate = b.ClinStageDate AND 
																									   (b.ClinStageDisease IN('prostate','Prostate cancer') OR b.ClinStageDisease IS NULL) AND 
																									    c.ClinStageQuality = 'REV') THEN 'REV'
																					 ELSE 'OUT'
																				END AND (b.ClinStageDisease IN('prostate','Prostate cancer') OR b.ClinStageDisease IS NULL)
									 GROUP BY b.ClinStageDate, b.ClinStageQuality, b.ClinStageT, a.PatientId, a.ProcedureId, a.OperatingRoomDetailId
									) AS PreOpClinStages ON a.PatientId = PreOpClinStages.PatientId AND 
														 a.ProcedureId = PreOpClinStages.ProcedureId AND 
														 a.OperatingRoomDetailId = PreOpClinStages.OperatingRoomDetailId
						-- PreOpGleasonSum: Dx Biopsy GGS
						LEFT OUTER JOIN (SELECT b.PathDate, b.PathQuality, c.PathGGS AS PreOpGleasonSum, a.PatientId, a.ProcedureId, a.OperatingRoomDetailId
										 FROM ProstatectomyTemp a INNER JOIN Pathology b ON a.PatientId = b.PatientId
									 							  INNER JOIN ProstateBiopsyPath c ON b.PathologyId = c.PathologyId
																  INNER JOIN Procedures d ON b.PatientId = d.PatientId AND b.ProcedureId = d.ProcedureId
										 WHERE d.ProcDate = (SELECT MAX(e.ProcDate)
															 FROM Pathology c INNER JOIN ProstateBiopsyPath d ON c.PathologyId = d.PathologyId
																			  INNER JOIN Procedures e ON c.PatientId = e.PatientId AND c.ProcedureId = e.ProcedureId
															 WHERE e.PatientId = b.PatientId AND e.ProcDate < a.ProcDate) AND
											   b.PathDate = (SELECT MAX(c.PathDate)
															 FROM Pathology c INNER JOIN ProstateBiopsyPath f ON c.PathologyId = f.PathologyId
																			  INNER JOIN Procedures e ON c.PatientId = e.PatientId AND c.ProcedureId = e.ProcedureId
															 WHERE c.PatientId = b.PatientId AND e.ProcDate = d.ProcDate AND c.PathDate < a.ProcDate																 
															) AND c.PathGGS IS NOT NULL AND
											   ISNULL(b.PathQuality, '') = CASE WHEN EXISTS (SELECT c.PathQuality
																							 FROM Pathology c INNER JOIN ProstateBiopsyPath d ON c.PathologyId = d.PathologyId
																							 WHERE c.PatientId = b.PatientId AND c.PathDate = b.PathDate AND c.PathQuality = 'RR') THEN 'RR'
																			    WHEN EXISTS (SELECT c.PathQuality
						 																	 FROM Pathology c INNER JOIN ProstateBiopsyPath d ON c.PathologyId = d.PathologyId
																							 WHERE c.PatientId = b.PatientId AND c.PathDate = b.PathDate AND c.PathQuality = 'STD') THEN 'STD'
																			    WHEN EXISTS (SELECT c.PathQuality
																							 FROM Pathology c INNER JOIN ProstateBiopsyPath d ON c.PathologyId = d.PathologyId
																							 WHERE c.PatientId = b.PatientId AND c.PathDate = b.PathDate AND c.PathQuality = 'REV') THEN 'REV'
																			    WHEN EXISTS (SELECT c.PathQuality
																							 FROM Pathology c INNER JOIN ProstateBiopsyPath d ON c.PathologyId = d.PathologyId
																							 WHERE c.PatientId = b.PatientId AND c.PathDate = b.PathDate AND c.PathQuality = 'OUT') THEN 'OUT'
																			    ELSE ISNULL(NULL,'')
																		   END
									 GROUP BY b.PathDate, b.PathQuality, c.PathGGS, a.PatientId, a.ProcedureId, a.OperatingRoomDetailId
									) AS PreOpGleasonSum ON a.PatientId =PreOpGleasonSum.PatientId AND
															a.ProcedureId =PreOpGleasonSum.ProcedureId AND
														    a.OperatingRoomDetailId = PreOpGleasonSum.OperatingRoomDetailId
						-- PreOp MRI Performed: Present/Absent
						LEFT OUTER JOIN (SELECT 'Present' AS PreOpMRIPerformed, a.PatientId, a.ProcedureId, a.OperatingRoomDetailId
										 FROM ProstatectomyTemp a
										 WHERE EXISTS (SELECT b.DxDate
													   FROM Diagnostics b
													   WHERE b.PatientId = a.PatientId AND b.DxDate < a.ProcDate AND b.DxType LIKE '%MRI%'
													  )										
										) AS PreOpMRI ON a.PatientId = PreOpMRI.PatientId AND 
														 a.ProcedureId = PreOpMRI.ProcedureId AND 
														 a.OperatingRoomDetailId = PreOpMRI.OperatingRoomDetailId 
						-- PreOpContinence
						LEFT OUTER JOIN (SELECT b.SurveyDate AS PreOpContinenceDate, b.SurveyQuality, c.SurveyItemResult AS PreOpContinence, a.PatientId, a.ProcedureId, a.OperatingRoomDetailId
										 FROM ProstatectomyTemp a INNER JOIN Surveys b ON a.PatientId = b.PatientId
																  INNER JOIN SurveyItems c ON b.SurveyId = c.SurveyId AND b.SurveyType = 'Urinary Function' AND c.SurveyItem = 'Continence'
										 WHERE b.SurveyDate = (SELECT MAX(c.SurveyDate)
															   FROM Surveys c INNER JOIN SurveyItems d ON c.SurveyId = d.SurveyId AND c.SurveyType = 'Urinary Function' AND d.SurveyItem = 'Continence'
															   WHERE c.PatientId = b.PatientId AND c.SurveyDate < a.ProcDate																 
														) AND c.SurveyItemResult IS NOT NULL AND
											   ISNULL(b.SurveyQuality, '') = CASE WHEN EXISTS (SELECT c.SurveyQuality
																							   FROM Surveys c INNER JOIN SurveyItems d ON c.SurveyId = d.SurveyId AND c.SurveyType = 'Urinary Function' AND d.SurveyItem = 'Continence'
																							   WHERE c.PatientId = b.PatientId AND c.SurveyDate = b.SurveyDate AND c.SurveyQuality = 'RR') THEN 'RR'
																				  WHEN EXISTS (SELECT c.SurveyQuality
																							   FROM Surveys c INNER JOIN SurveyItems d ON c.SurveyId = d.SurveyId AND c.SurveyType = 'Urinary Function' AND d.SurveyItem = 'Continence'
																							   WHERE c.PatientId = b.PatientId AND c.SurveyDate = b.SurveyDate AND c.SurveyQuality = 'STD') THEN 'STD'
																				  WHEN EXISTS (SELECT c.SurveyQuality
																							   FROM Surveys c INNER JOIN SurveyItems d ON c.SurveyId = d.SurveyId AND c.SurveyType = 'Urinary Function' AND d.SurveyItem = 'Continence'
																							   WHERE c.PatientId = b.PatientId AND c.SurveyDate = b.SurveyDate AND c.SurveyQuality = 'MSK') THEN 'MSK'
																				  WHEN EXISTS (SELECT c.SurveyQuality
																							   FROM Surveys c INNER JOIN SurveyItems d ON c.SurveyId = d.SurveyId AND c.SurveyType = 'Urinary Function' AND d.SurveyItem = 'Continence'
																							   WHERE c.PatientId = b.PatientId AND c.SurveyDate = b.SurveyDate AND c.SurveyQuality = 'REV') THEN 'REV'
																				  WHEN EXISTS (SELECT c.SurveyQuality
																							   FROM Surveys c INNER JOIN SurveyItems d ON c.SurveyId = d.SurveyId AND c.SurveyType = 'Urinary Function' AND d.SurveyItem = 'Continence'
																							   WHERE c.PatientId = b.PatientId AND c.SurveyDate = b.SurveyDate AND c.SurveyQuality = 'OUT') THEN 'OUT'
																				  ELSE ISNULL(NULL,'')
																			 END
											 GROUP BY b.SurveyDate, b.SurveyQuality, c.SurveyItemResult, a.PatientId, a.ProcedureId, a.OperatingRoomDetailId
											) AS PreOpSurveys ON a.PatientId = PreOpSurveys.PatientId AND 
																 a.ProcedureId = PreOpSurveys.ProcedureId AND 
																 a.OperatingRoomDetailId = PreOpSurveys.OperatingRoomDetailId 
						-- PostOpContinence
						LEFT OUTER JOIN (SELECT b.SurveyDate AS PostOpContinenceDate, b.SurveyQuality, c.SurveyItemResult AS PostOpContinence, a.PatientId, a.ProcedureId, a.OperatingRoomDetailId
										 FROM ProstatectomyTemp a INNER JOIN Surveys b ON a.PatientId = b.PatientId
																  INNER JOIN SurveyItems c ON b.SurveyId = c.SurveyId AND b.SurveyType = 'Urinary Function' AND c.SurveyItem = 'Continence'
										 WHERE b.SurveyDate = (SELECT MIN(c.SurveyDate)
															   FROM Surveys c INNER JOIN SurveyItems d ON c.SurveyId = d.SurveyId AND c.SurveyType = 'Urinary Function' AND d.SurveyItem = 'Continence'
															   WHERE c.PatientId = b.PatientId AND c.SurveyDate > a.ProcDate																	 
															  ) AND c.SurveyItemResult IS NOT NULL AND
											   ISNULL(b.SurveyQuality, '') = CASE WHEN EXISTS (SELECT c.SurveyQuality
																							   FROM Surveys c INNER JOIN SurveyItems d ON c.SurveyId = d.SurveyId AND c.SurveyType = 'Urinary Function' AND d.SurveyItem = 'Continence'
																							   WHERE c.PatientId = b.PatientId AND c.SurveyDate = b.SurveyDate AND c.SurveyQuality = 'RR') THEN 'RR'
																				  WHEN EXISTS (SELECT c.SurveyQuality
																							   FROM Surveys c INNER JOIN SurveyItems d ON c.SurveyId = d.SurveyId AND c.SurveyType = 'Urinary Function' AND d.SurveyItem = 'Continence'
																							   WHERE c.PatientId = b.PatientId AND c.SurveyDate = b.SurveyDate AND c.SurveyQuality = 'STD') THEN 'STD'
																				  WHEN EXISTS (SELECT c.SurveyQuality
																							   FROM Surveys c INNER JOIN SurveyItems d ON c.SurveyId = d.SurveyId AND c.SurveyType = 'Urinary Function' AND d.SurveyItem = 'Continence'
																							   WHERE c.PatientId = b.PatientId AND c.SurveyDate = b.SurveyDate AND c.SurveyQuality = 'MSK') THEN 'MSK'
																				  WHEN EXISTS (SELECT c.SurveyQuality
																							   FROM Surveys c INNER JOIN SurveyItems d ON c.SurveyId = d.SurveyId AND c.SurveyType = 'Urinary Function' AND d.SurveyItem = 'Continence'
																							   WHERE c.PatientId = b.PatientId AND c.SurveyDate = b.SurveyDate AND c.SurveyQuality = 'REV') THEN 'REV'
																				  WHEN EXISTS (SELECT c.SurveyQuality
																							   FROM Surveys c INNER JOIN SurveyItems d ON c.SurveyId = d.SurveyId AND c.SurveyType = 'Urinary Function' AND d.SurveyItem = 'Continence'
																							   WHERE c.PatientId = b.PatientId AND c.SurveyDate = b.SurveyDate AND c.SurveyQuality = 'OUT') THEN 'OUT'
																				  ELSE ISNULL(NULL,'')
																			  END
											 GROUP BY b.SurveyDate, b.SurveyQuality, c.SurveyItemResult, a.PatientId, a.ProcedureId, a.OperatingRoomDetailId
											) AS PostOpSurveys ON a.PatientId = PostOpSurveys.PatientId AND 
																  a.ProcedureId = PostOpSurveys.ProcedureId AND 
																  a.OperatingRoomDetailId = PostOpSurveys.OperatingRoomDetailId
						-- PreOpErectileFunction
						LEFT OUTER JOIN (SELECT b.SurveyDate AS PreOpErectileDate, b.SurveyQuality, c.SurveyItemResult AS PreOpErectileFunction, a.PatientId, a.ProcedureId, a.OperatingRoomDetailId
										 FROM ProstatectomyTemp a INNER JOIN Surveys b ON a.PatientId = b.PatientId
																  INNER JOIN SurveyItems c ON b.SurveyId = c.SurveyId AND b.SurveyType = 'Sexual Function' AND c.SurveyItem = 'Erectile Function'
										 WHERE b.SurveyDate = (SELECT MAX(c.SurveyDate)
															   FROM Surveys c INNER JOIN SurveyItems d ON c.SurveyId = d.SurveyId AND c.SurveyType = 'Sexual Function' AND d.SurveyItem = 'Erectile Function'
															   WHERE c.PatientId = b.PatientId AND c.SurveyDate < a.ProcDate																 
														) AND c.SurveyItemResult IS NOT NULL AND
											   ISNULL(b.SurveyQuality, '') = CASE WHEN EXISTS (SELECT c.SurveyQuality
																							   FROM Surveys c INNER JOIN SurveyItems d ON c.SurveyId = d.SurveyId AND c.SurveyType = 'Sexual Function' AND d.SurveyItem = 'Erectile Function'
																							   WHERE c.PatientId = b.PatientId AND c.SurveyDate = b.SurveyDate AND c.SurveyQuality = 'RR') THEN 'RR'
																				  WHEN EXISTS (SELECT c.SurveyQuality
																							   FROM Surveys c INNER JOIN SurveyItems d ON c.SurveyId = d.SurveyId AND c.SurveyType = 'Sexual Function' AND d.SurveyItem = 'Erectile Function'
																							   WHERE c.PatientId = b.PatientId AND c.SurveyDate = b.SurveyDate AND c.SurveyQuality = 'STD') THEN 'STD'
																				  WHEN EXISTS (SELECT c.SurveyQuality
																							   FROM Surveys c INNER JOIN SurveyItems d ON c.SurveyId = d.SurveyId AND c.SurveyType = 'Sexual Function' AND d.SurveyItem = 'Erectile Function'
																							   WHERE c.PatientId = b.PatientId AND c.SurveyDate = b.SurveyDate AND c.SurveyQuality = 'MSK') THEN 'MSK'
																				  WHEN EXISTS (SELECT c.SurveyQuality
																							   FROM Surveys c INNER JOIN SurveyItems d ON c.SurveyId = d.SurveyId AND c.SurveyType = 'Sexual Function' AND d.SurveyItem = 'Erectile Function'
																							   WHERE c.PatientId = b.PatientId AND c.SurveyDate = b.SurveyDate AND c.SurveyQuality = 'REV') THEN 'REV'
																				  WHEN EXISTS (SELECT c.SurveyQuality
																							   FROM Surveys c INNER JOIN SurveyItems d ON c.SurveyId = d.SurveyId AND c.SurveyType = 'Sexual Function' AND d.SurveyItem = 'Erectile Function'
																							   WHERE c.PatientId = b.PatientId AND c.SurveyDate = b.SurveyDate AND c.SurveyQuality = 'OUT') THEN 'OUT'
																				  ELSE ISNULL(NULL,'')
																			  END
											 GROUP BY b.SurveyDate, b.SurveyQuality, c.SurveyItemResult, a.PatientId, a.ProcedureId, a.OperatingRoomDetailId
											) AS PreOpSexualSurveys ON a.PatientId = PreOpSexualSurveys.PatientId AND 
																	   a.ProcedureId = PreOpSexualSurveys.ProcedureId AND 
																       a.OperatingRoomDetailId = PreOpSexualSurveys.OperatingRoomDetailId
						-- PostOpErectileFunction
						LEFT OUTER JOIN (SELECT b.SurveyDate AS PostOpErectileDate, b.SurveyQuality, c.SurveyItemResult AS PostOpErectileFunction, a.PatientId, a.ProcedureId, a.OperatingRoomDetailId
										 FROM ProstatectomyTemp a INNER JOIN Surveys b ON a.PatientId = b.PatientId
																  INNER JOIN SurveyItems c ON b.SurveyId = c.SurveyId AND b.SurveyType = 'Sexual Function' AND c.SurveyItem = 'Erectile Function'
										 WHERE b.SurveyDate = (SELECT MIN(c.SurveyDate)
															   FROM Surveys c INNER JOIN SurveyItems d ON c.SurveyId = d.SurveyId AND c.SurveyType = 'Sexual Function' AND d.SurveyItem = 'Erectile Function'
															   WHERE c.PatientId = b.PatientId AND c.SurveyDate > a.ProcDate																 
														) AND c.SurveyItemResult IS NOT NULL AND
											   ISNULL(b.SurveyQuality, '') = CASE WHEN EXISTS (SELECT c.SurveyQuality
																							   FROM Surveys c INNER JOIN SurveyItems d ON c.SurveyId = d.SurveyId AND c.SurveyType = 'Sexual Function' AND d.SurveyItem = 'Erectile Function'
																							   WHERE c.PatientId = b.PatientId AND c.SurveyDate = b.SurveyDate AND c.SurveyQuality = 'RR') THEN 'RR'
																				  WHEN EXISTS (SELECT c.SurveyQuality
																							   FROM Surveys c INNER JOIN SurveyItems d ON c.SurveyId = d.SurveyId AND c.SurveyType = 'Sexual Function' AND d.SurveyItem = 'Erectile Function'
																							   WHERE c.PatientId = b.PatientId AND c.SurveyDate = b.SurveyDate AND c.SurveyQuality = 'STD') THEN 'STD'
																				  WHEN EXISTS (SELECT c.SurveyQuality
																							   FROM Surveys c INNER JOIN SurveyItems d ON c.SurveyId = d.SurveyId AND c.SurveyType = 'Sexual Function' AND d.SurveyItem = 'Erectile Function'
																							   WHERE c.PatientId = b.PatientId AND c.SurveyDate = b.SurveyDate AND c.SurveyQuality = 'MSK') THEN 'MSK'
																				  WHEN EXISTS (SELECT c.SurveyQuality
																							   FROM Surveys c INNER JOIN SurveyItems d ON c.SurveyId = d.SurveyId AND c.SurveyType = 'Sexual Function' AND d.SurveyItem = 'Erectile Function'
																							   WHERE c.PatientId = b.PatientId AND c.SurveyDate = b.SurveyDate AND c.SurveyQuality = 'REV') THEN 'REV'
																				  WHEN EXISTS (SELECT c.SurveyQuality
																							   FROM Surveys c INNER JOIN SurveyItems d ON c.SurveyId = d.SurveyId AND c.SurveyType = 'Sexual Function' AND d.SurveyItem = 'Erectile Function'
																							   WHERE c.PatientId = b.PatientId AND c.SurveyDate = b.SurveyDate AND c.SurveyQuality = 'OUT') THEN 'OUT'
																				  ELSE ISNULL(NULL,'')
																			  END
											 GROUP BY b.SurveyDate, b.SurveyQuality, c.SurveyItemResult, a.PatientId, a.ProcedureId, a.OperatingRoomDetailId
											) AS PostOpSexualSurveys ON a.PatientId = PostOpSexualSurveys.PatientId AND 
																		a.ProcedureId = PostOpSexualSurveys.ProcedureId AND 
																		a.OperatingRoomDetailId = PostOpSexualSurveys.OperatingRoomDetailId
						-- Complication Present within 90 days (Yes/No)
						LEFT OUTER JOIN (SELECT 'Yes' AS PostOpComplications, a.PatientId, a.ProcedureId, a.OperatingRoomDetailId
										 FROM ProstatectomyTemp a
										 WHERE EXISTS (SELECT b.ToxName
													   FROM Toxicities b 
													   WHERE b.PatientId = a.PatientId AND b.ToxDate > a.ProcDate AND
														     DATEDIFF(day, a.ProcDate, b.ToxDate)<90 AND b.ToxName <> 'None'
													  )
										) AS PostOpToxicities ON a.PatientId = PostOpToxicities.PatientId AND 
																 a.ProcedureId = PostOpToxicities.ProcedureId AND 
																 a.OperatingRoomDetailId = PostOpToxicities.OperatingRoomDetailId
						-- Grade >1 Complication Present within 90 days (Yes/No)
						LEFT OUTER JOIN (SELECT 'Yes' AS PostOpComplicationsGrade, a.PatientId, a.ProcedureId, a.OperatingRoomDetailId
										 FROM ProstatectomyTemp a
										 WHERE EXISTS (SELECT b.ToxName
													   FROM Toxicities b 
													   WHERE b.PatientId = a.PatientId AND b.ToxDate > a.ProcDate AND
															 DATEDIFF(day, a.ProcDate, b.ToxDate)<90 AND b.ToxName <> 'None' AND 
															 b.ToxGrade NOT IN('0','1', 'Unknown', 'None', 'UNK')	
													  )
										) AS PostOpToxicitiesGrade ON a.PatientId = PostOpToxicitiesGrade.PatientId AND 
																	  a.ProcedureId = PostOpToxicitiesGrade.ProcedureId AND 
																	  a.OperatingRoomDetailId = PostOpToxicitiesGrade.OperatingRoomDetailId
						-- Path Stage (TN):
						LEFT OUTER JOIN (SELECT b.PathDate, b.PathQuality, c.PathStageT, c.PathStageM, c.PathStageN, a.PatientId, a.ProcedureId, a.OperatingRoomDetailId
										 FROM ProstatectomyTemp a INNER JOIN Pathology b ON a.PatientId = b.PatientId AND
																						    a.OperatingRoomDetailId = ISNULL(b.OperatingRoomDetailId, '') AND
																							a.ProcedureId = b.ProcedureId
																  INNER JOIN PathologyStageGrade c ON b.PathologyId = c.PathologyId AND c.PathStageDisease = 'Prostate'
										 WHERE ISNULL(b.PathQuality, '') = CASE WHEN EXISTS (SELECT c.PathQuality
																							 FROM Pathology c INNER JOIN PathologyStageGrade d ON c.PathologyId = d.PathologyId AND d.PathStageDisease = 'Prostate'
																							 WHERE c.PatientId = b.PatientId AND ISNULL(c.OperatingRoomDetailId, '') = ISNULL(b.OperatingRoomDetailId, '') AND c.ProcedureId = b.ProcedureId AND c.PathQuality = 'RR') THEN 'RR'
																			    WHEN EXISTS (SELECT c.PathQuality
																							 FROM Pathology c INNER JOIN PathologyStageGrade d ON c.PathologyId = d.PathologyId AND d.PathStageDisease = 'Prostate'
																							 WHERE c.PatientId = b.PatientId AND ISNULL(c.OperatingRoomDetailId, '') = ISNULL(b.OperatingRoomDetailId, '') AND c.ProcedureId = b.ProcedureId AND c.PathQuality = 'STD') THEN 'STD'
																			    WHEN EXISTS (SELECT c.PathQuality
																							 FROM Pathology c INNER JOIN PathologyStageGrade d ON c.PathologyId = d.PathologyId AND d.PathStageDisease = 'Prostate'
																							 WHERE c.PatientId = b.PatientId AND ISNULL(c.OperatingRoomDetailId, '') = ISNULL(b.OperatingRoomDetailId, '') AND c.ProcedureId = b.ProcedureId AND c.PathQuality = 'REV') THEN 'REV'
																			    WHEN EXISTS (SELECT c.PathQuality
																							 FROM Pathology c INNER JOIN PathologyStageGrade d ON c.PathologyId = d.PathologyId AND d.PathStageDisease = 'Prostate'
																							 WHERE c.PatientId = b.PatientId AND ISNULL(c.OperatingRoomDetailId, '') = ISNULL(b.OperatingRoomDetailId, '') AND c.ProcedureId = b.ProcedureId AND c.PathQuality = 'OUT') THEN 'OUT'
																			    ELSE ISNULL(NULL,'')
																			END 
										 GROUP BY b.PathDate, b.PathQuality, c.PathStageT, c.PathStageM, c.PathStageN, a.PatientId, a.ProcedureId, a.OperatingRoomDetailId
																				) AS PathStages ON a.PatientId = PathStages.PatientId AND 
																								   a.ProcedureId = PathStages.ProcedureId AND
																								   a.OperatingRoomDetailId = PathStages.OperatingRoomDetailId
						-- Path Gleason, Path Margin Status: 
						LEFT OUTER JOIN (SELECT b.PathQuality, c.PathGGS AS PathGGS, c.PathMargin AS PathMargin, a.PatientId, a.ProcedureId, a.OperatingRoomDetailId
										 FROM ProstatectomyTemp a INNER JOIN Pathology b ON a.PatientId = b.PatientId AND
																						    a.OperatingRoomDetailId = ISNULL(b.OperatingRoomDetailId, '') AND
																						    a.ProcedureId = b.ProcedureId
																  INNER JOIN ProstatectomyPath c ON b.PathologyId = c.PathologyId 
										 WHERE ISNULL(b.PathQuality, '') = CASE WHEN EXISTS (SELECT c.PathQuality
																							 FROM Pathology c INNER JOIN ProstatectomyPath d ON c.PathologyId = d.PathologyId 
																							 WHERE c.PatientId = b.PatientId AND ISNULL(c.OperatingRoomDetailId, '') = ISNULL(b.OperatingRoomDetailId, '') AND c.ProcedureId = b.ProcedureId AND c.PathQuality = 'RR') THEN 'RR'
																			    WHEN EXISTS (SELECT c.PathQuality
																							 FROM Pathology c INNER JOIN ProstatectomyPath d ON c.PathologyId = d.PathologyId 
																							 WHERE c.PatientId = b.PatientId AND ISNULL(c.OperatingRoomDetailId, '') = ISNULL(b.OperatingRoomDetailId, '') AND c.ProcedureId = b.ProcedureId AND c.PathQuality = 'STD') THEN 'STD'
																			    WHEN EXISTS (SELECT c.PathQuality
																							 FROM Pathology c INNER JOIN ProstatectomyPath d ON c.PathologyId = d.PathologyId 
																							 WHERE c.PatientId = b.PatientId AND ISNULL(c.OperatingRoomDetailId, '') = ISNULL(b.OperatingRoomDetailId, '') AND c.ProcedureId = b.ProcedureId AND c.PathQuality = 'REV') THEN 'REV'
																			    WHEN EXISTS (SELECT c.PathQuality
																							 FROM Pathology c INNER JOIN ProstatectomyPath d ON c.PathologyId = d.PathologyId 
																							 WHERE c.PatientId = b.PatientId AND ISNULL(c.OperatingRoomDetailId, '') = ISNULL(b.OperatingRoomDetailId, '') AND c.ProcedureId = b.ProcedureId AND c.PathQuality = 'OUT') THEN 'OUT'
																			    ELSE ISNULL(NULL,'')
																		    END
										 GROUP BY b.PathQuality, c.PathGGS, c.PathMargin, a.PatientId, a.ProcedureId, a.OperatingRoomDetailId
										) AS PathGleason ON a.PatientId = PathGleason.PatientId AND 
															a.ProcedureId = PathGleason.ProcedureId AND
															a.OperatingRoomDetailId = PathGleason.OperatingRoomDetailId
						-- PLND Performed (Yes/No): 
						LEFT OUTER JOIN (SELECT 'Yes' AS PLND_Performed, a.PatientId, a.ProcedureId, a.OperatingRoomDetailId
										 FROM ProstatectomyTemp a 
										 WHERE EXISTS (SELECT b.ProcName
													   FROM Procedures b 
													   WHERE b.PatientId = a.PatientId AND b.ProcName = 'PLND' AND
														    (ISNULL(b.OperatingRoomDetailId, '') = a.OperatingRoomDetailId OR b.ProcDate = a.ProcDate)												    
													  )
										) AS PLNDProc ON a.PatientId = PLNDProc.PatientId AND 
														 a.ProcedureId = PLNDProc.ProcedureId AND
														 a.OperatingRoomDetailId = PLNDProc.OperatingRoomDetailId
						-- Number of total nodes, Number of positive nodes, Positive Nodes (Yes or No)
						LEFT OUTER JOIN (SELECT c.PathQuality, c.PathResult AS PLND_Result, 
										        SUM(CAST((CASE WHEN ISNUMERIC(d.PathFindNumNodes)<>1 THEN NULL ELSE d.PathFindNumNodes END) AS float)) AS TotalNodes,  
												SUM(CAST((CASE WHEN ISNUMERIC(d.PathFindPosNodes)<>1 THEN NULL ELSE d.PathFindPosNodes END) AS float)) AS PositiveNodes, 
												a.PatientId, a.ProcedureId, a.OperatingRoomDetailId
										 FROM ProstatectomyTemp a INNER JOIN Procedures b ON a.PatientId = b.PatientId AND b.ProcName = 'PLND' AND (a.OperatingRoomDetailId = ISNULL(b.OperatingRoomDetailId, '') OR a.ProcDate = b.ProcDate) 
																  INNER JOIN Pathology c ON b.PatientId = c.PatientId AND b.ProcedureId = c.ProcedureId
																  INNER JOIN NodePathFinding d ON c.PathologyId = d.PathologyId 
										 WHERE ISNULL(c.PathQuality, '') = CASE WHEN EXISTS (SELECT f.PathQuality
																							 FROM Pathology f INNER JOIN NodePathFinding k ON f.PathologyId = k.PathologyId 
																							 WHERE f.PatientId = b.PatientId AND f.ProcedureId = b.ProcedureId AND f.PathQuality = 'RR') THEN 'RR'				   
																				WHEN EXISTS (SELECT f.PathQuality
																							 FROM Pathology f INNER JOIN NodePathFinding k ON f.PathologyId = k.PathologyId  
																							 WHERE f.PatientId = b.PatientId AND f.ProcedureId = b.ProcedureId AND f.PathQuality = 'STD') THEN 'STD'
																			    WHEN EXISTS (SELECT f.PathQuality
																							 FROM Pathology f INNER JOIN NodePathFinding k ON f.PathologyId = k.PathologyId 
																							 WHERE f.PatientId = b.PatientId AND f.ProcedureId = b.ProcedureId AND f.PathQuality = 'REV') THEN 'REV'
																			    WHEN EXISTS (SELECT f.PathQuality
																							 FROM Pathology f INNER JOIN NodePathFinding k ON f.PathologyId = k.PathologyId 
																							 WHERE f.PatientId = b.PatientId AND f.ProcedureId = b.ProcedureId AND f.PathQuality = 'OUT') THEN 'OUT'
																			    ELSE ISNULL(NULL,'')
																		   END
											GROUP BY a.PatientId, a.ProcedureId, a.OperatingRoomDetailId, a.PtMRN, a.AgeAtSurgery, 
													 a.ProcName, a.ProcSurgeon, a.ProcDate, a.ProcInstitution, c.PathQuality, c.PathResult
										) AS PLNDPath ON a.PatientId = PLNDPath.PatientId AND 
														 a.ProcedureId = PLNDPath.ProcedureId AND
														 a.OperatingRoomDetailId = PLNDPath.OperatingRoomDetailId

END
ELSE
BEGIN
-- This SELECT statement populates particular surgeon's data
;--last statement MUST be semicolon-terminated to use a CTE
WITH ProstatectomyTemp(PatientId, ProcedureId, OperatingRoomDetailId, PtMRN, AgeAtSurgery, ProcName, ProcSurgeon, ProcDate, ProcInstitution) AS
(
	SELECT a.PatientId, b.ProcedureId, ISNULL(b.OperatingRoomDetailId,'') AS OperatingRoomDetailId, a.PtMRN, 
		   DATEDIFF(year, a.PtBirthDate, b.ProcDate) AS AgeAtSurgery, b.ProcName, b.ProcSurgeon, b.ProcDate, b.ProcInstitution
	FROM Patients a INNER JOIN Procedures b ON a.PatientId = b.PatientId
					INNER JOIN PatientInstitutions c ON a.PatientId = c.PatientId					
	WHERE b.ProcName IN( 
			CASE 
				 WHEN @ProcedureType = 'RP' THEN @Prostatectomy_1
				 WHEN @ProcedureType = 'LP' THEN @Prostatectomy_2
				 WHEN @ProcedureType = 'RALP' THEN @Prostatectomy_3
				 WHEN @ProcedureType = 'SalvRP' THEN @Prostatectomy_6
				 WHEN @ProcedureType = 'SalvLP' THEN @Prostatectomy_7
				 
			END) AND
		 (b.ProcInstitution IN(@InstitutionName_1, @InstitutionName_2, @InstitutionName_3, @InstitutionName_4, @InstitutionName_5) OR b.ProcQuality = @ProcQuality) AND
		  c.InstitutionId = @InstitutionId AND a.PtMRN <> 'TEST0000' AND b.ProcSurgeon LIKE @PhysicianName AND 
         (b.ProcDate BETWEEN @FromDate AND @ToDate)
)
INSERT INTO @UrologySurgeryReport
	  (PtMRN, AgeAtSurgery, ProcName, ProcSurgeon, ProcDate, PreOpBMI, OpASA, OpEstBloodLoss, OpAutoTransfused, PreOpPSA,
	   PreOpGleasonSum, PreOpClinStageT, ProcStageT, PathStageT, PathStageN, PathStageM, PathGleasonSum, PathMargin, 
       PLNDPerformed, PLND_Result, TotalNodes, PositiveNodes, PostOpPSA_30Days, LastPSA, PreOpMRI_Performed, PreOpContinence, 
       PostOpContinence, TimeToContinenanceLevel_II, TimeToContinenanceLevel_I, PreOpErectileFunction, PostOpErectileFunction, 
	   TimeToErectileFunctionLevel_III, TimeToErectileFunctionLevel_II, TimeToErectileFunctionLevel_I, PostOpComplication_90days, 
       PostOpComplicationGrade_90days)
SELECT a.PtMRN, a.AgeAtSurgery, a.ProcName, a.ProcSurgeon, a.ProcDate, EncounterBMI.EncBMI AS PreOpBMI, b.OpASA, b.OpEstBloodLoss, b.OpAutoTransfused, LabPrePSA.PreOpPSA,
	   PreOpGleasonSum.PreOpGleasonSum, PreOpClinStages.ClinStageT AS PreOpClinStageT, c.ProcStageT, PathStages.PathStageT, PathStages.PathStageN, PathStages.PathStageM, 
	   PathGleason.PathGGS AS PathGleasonSum, PathGleason.PathMargin AS PathMargin, ISNULL(PLNDProc.PLND_Performed, 'No') AS PLNDPerformed, PLNDPath.PLND_Result, 
       PLNDPath.TotalNodes, PLNDPath.PositiveNodes, LabPostPSA.PostOpPSA AS PostOpPSA_30Days, LabRecentPSA.LastPSA, ISNULL(PreOpMRI.PreOpMRIPerformed, 'Absent') AS PreOpMRI_Performed,   
       PreOpSurveys.PreOpContinence, PostOpSurveys.PostOpContinence, 
	   TimeToContinenanceLevel_II  = CASE WHEN PostOpSurveys.PostOpContinence = '2' THEN DATEDIFF(day, a.ProcDate, PostOpSurveys.PostOpContinenceDate) ELSE NULL END,
	   TimeToContinenanceLevel_I  = CASE WHEN PostOpSurveys.PostOpContinence = '1' THEN DATEDIFF(day, a.ProcDate, PostOpSurveys.PostOpContinenceDate) ELSE NULL END,
	   PreOpSexualSurveys.PreOpErectileFunction, PostOpSexualSurveys.PostOpErectileFunction, 
	   TimeToErectileFunctionLevel_III= CASE WHEN PostOpSexualSurveys.PostOpErectileFunction = '3' THEN DATEDIFF(day, a.ProcDate, PostOpSexualSurveys.PostOpErectileDate) ELSE NULL END,
       TimeToErectileFunctionLevel_II  = CASE WHEN PostOpSexualSurveys.PostOpErectileFunction = '2' THEN DATEDIFF(day, a.ProcDate, PostOpSexualSurveys.PostOpErectileDate) ELSE NULL END,
       TimeToErectileFunctionLevel_I  = CASE WHEN PostOpSexualSurveys.PostOpErectileFunction = '1' THEN DATEDIFF(day, a.ProcDate, PostOpSexualSurveys.PostOpErectileDate) ELSE NULL END,
	   ISNULL(PostOpToxicities.PostOpComplications, 'No') AS PostOpComplication_90days,
	   ISNULL(PostOpToxicitiesGrade.PostOpComplicationsGrade, 'No') AS PostOpComplicationGrade_90days
						 -- ASA, Blood Loss, Transfusion
FROM ProstatectomyTemp a LEFT OUTER JOIN OperatingRoomDetails b ON a.PatientId = b.PatientId AND
																  (a.OperatingRoomDetailId = ISNULL(b.OperatingRoomDetailId, '') OR a.ProcDate = b.OpDate)
						 -- T stage from RP procedure
						 LEFT OUTER JOIN ProstatectomyProc c ON a.ProcedureId = c.ProcedureId
						 -- EncBMI right before surgery
						 LEFT OUTER JOIN (SELECT b.EncDate, b.EncQuality, b.EncBMI AS EncBMI, a.PatientId, a.ProcedureId, a.OperatingRoomDetailId
										  FROM ProstatectomyTemp a INNER JOIN Encounters b ON a.PatientId = b.PatientId
										  WHERE b.EncDate = (SELECT MAX(c.EncDate)
															 FROM Encounters c
															 WHERE c.PatientId = b.PatientId AND c.EncDate < a.ProcDate																 
															) AND b.EncBMI IS NOT NULL AND
												ISNULL(b.EncQuality,'') = CASE WHEN EXISTS (SELECT c.EncQuality
																							FROM Encounters c
																							WHERE c.PatientId = b.PatientId AND c.EncDate = b.EncDate AND c.EncQuality = 'RR') THEN 'RR'
																			   WHEN EXISTS (SELECT c.EncQuality
																						    FROM Encounters c
																						    WHERE c.PatientId = b.PatientId AND c.EncDate = b.EncDate AND c.EncQuality = 'STD') THEN 'STD'
																			   WHEN EXISTS (SELECT c.EncQuality
																						    FROM Encounters c
																						    WHERE c.PatientId = b.PatientId AND c.EncDate = b.EncDate AND c.EncQuality = 'REV') THEN 'REV'
																			   WHEN EXISTS (SELECT c.EncQuality
																						    FROM Encounters c
																						    WHERE c.PatientId = b.PatientId AND c.EncDate = b.EncDate AND c.EncQuality = 'OUT') THEN 'OUT'
																			   ELSE ISNULL(NULL,'')
																		  END
										  GROUP BY b.EncDate, b.EncQuality, b.EncBMI, a.PatientId, a.ProcedureId, a.OperatingRoomDetailId
										  ) AS EncounterBMI ON a.PatientId = EncounterBMI.PatientId AND 
															   a.ProcedureId = EncounterBMI.ProcedureId AND 															   
															   a.OperatingRoomDetailId = EncounterBMI.OperatingRoomDetailId
						-- PreOp PSA value and date immediately before proc date
						LEFT OUTER JOIN (SELECT b.LabDate AS PreOpPSA_Date , b.LabQuality, b.LabResult AS PreOpPSA, a.PatientId, a.ProcedureId, a.OperatingRoomDetailId
										 FROM ProstatectomyTemp a INNER JOIN LabTests b ON a.PatientId = b.PatientId
										 WHERE b.LabDate = (SELECT MAX(c.LabDate)
															FROM LabTests c
															WHERE c.PatientId = b.PatientId AND c.LabTest = 'PSA' AND c.LabDate < a.ProcDate																 
														   ) AND b.LabResult IS NOT NULL AND 
											   ISNULL(b.LabQuality, '') = CASE WHEN EXISTS (SELECT c.LabQuality
																							FROM LabTests c
																							WHERE c.PatientId = b.PatientId AND c.LabTest = 'PSA' AND c.LabDate = b.LabDate AND c.LabQuality = 'RR') THEN 'RR'
																			   WHEN EXISTS (SELECT c.LabQuality
						 																    FROM LabTests c
																						    WHERE c.PatientId = b.PatientId AND c.LabTest = 'PSA' AND c.LabDate = b.LabDate AND c.LabQuality = 'STD') THEN 'STD'
																			   WHEN EXISTS (SELECT c.LabQuality
																						    FROM LabTests c
																						    WHERE c.PatientId = b.PatientId AND c.LabTest = 'PSA' AND c.LabDate = b.LabDate AND c.LabQuality = 'REV') THEN 'REV'
																			   WHEN EXISTS (SELECT c.LabQuality
																						    FROM LabTests c
																						    WHERE c.PatientId = b.PatientId AND c.LabTest = 'PSA' AND c.LabDate = b.LabDate AND c.LabQuality = 'OUT') THEN 'OUT'
																			   ELSE ISNULL(NULL,'')
																		  END AND b.LabTest = 'PSA'
										 GROUP BY b.LabDate, b.LabQuality, b.LabResult, a.PatientId, a.ProcedureId, a.OperatingRoomDetailId
										) AS LabPrePSA ON a.PatientId = LabPrePSA.PatientId AND 
													      a.ProcedureId = LabPrePSA.ProcedureId AND 
														  a.OperatingRoomDetailId = LabPrePSA.OperatingRoomDetailId
						-- PostOp PSA value and date immeditately after proc date + 30 days
						LEFT OUTER JOIN (SELECT b.LabDate AS PostOpPSA_Date, b.LabQuality, b.LabResult AS PostOpPSA, a.PatientId, a.ProcedureId, a.OperatingRoomDetailId
										 FROM ProstatectomyTemp a INNER JOIN LabTests b ON a.PatientId = b.PatientId
										 WHERE b.LabDate = (SELECT MIN(c.LabDate)
															FROM LabTests c
															WHERE c.PatientId = b.PatientId AND c.LabTest = 'PSA' AND DATEDIFF(day, a.ProcDate, c.LabDate) >= 30
														   ) AND b.LabResult IS NOT NULL AND
											   ISNULL(b.LabQuality, '') = CASE WHEN EXISTS (SELECT c.LabQuality
																							FROM LabTests c
																							WHERE c.PatientId = b.PatientId AND c.LabTest = 'PSA' AND c.LabDate = b.LabDate AND c.LabQuality = 'RR') THEN 'RR'
																			   WHEN EXISTS (SELECT c.LabQuality
						 																    FROM LabTests c
																						    WHERE c.PatientId = b.PatientId AND c.LabTest = 'PSA' AND c.LabDate = b.LabDate AND c.LabQuality = 'STD') THEN 'STD'
																			   WHEN EXISTS (SELECT c.LabQuality
																						    FROM LabTests c
																						    WHERE c.PatientId = b.PatientId AND c.LabTest = 'PSA' AND c.LabDate = b.LabDate AND c.LabQuality = 'REV') THEN 'REV'
																			   WHEN EXISTS (SELECT c.LabQuality
																						    FROM LabTests c
																						    WHERE c.PatientId = b.PatientId AND c.LabTest = 'PSA' AND c.LabDate = b.LabDate AND c.LabQuality = 'OUT') THEN 'OUT'
																			   ELSE ISNULL(NULL,'')
																		  END AND b.LabTest = 'PSA'
										 GROUP BY b.LabDate, b.LabQuality, b.LabResult, a.PatientId, a.ProcedureId, a.OperatingRoomDetailId
										) AS LabPostPSA ON a.PatientId = LabPostPSA.PatientId AND 
													       a.ProcedureId = LabPostPSA.ProcedureId AND 
														   a.OperatingRoomDetailId = LabPostPSA.OperatingRoomDetailId
						-- Last PSA: Most recent PSA
						LEFT OUTER JOIN (SELECT b.LabDate AS LastPSA_Date, b.LabQuality, b.LabResult AS LastPSA, a.PatientId, a.ProcedureId, a.OperatingRoomDetailId
										 FROM ProstatectomyTemp a INNER JOIN LabTests b ON a.PatientId = b.PatientId
										 WHERE b.LabDate = (SELECT MAX(c.LabDate)
															FROM LabTests c
															WHERE c.PatientId = b.PatientId AND c.LabTest = 'PSA'																 
														   ) AND b.LabResult IS NOT NULL AND 
											   ISNULL(b.LabQuality,'') = CASE WHEN EXISTS (SELECT c.LabQuality
																			               FROM LabTests c
																			               WHERE c.PatientId = b.PatientId AND c.LabTest = 'PSA' AND c.LabDate = b.LabDate AND c.LabQuality = 'RR') THEN 'RR'
																			  WHEN EXISTS (SELECT c.LabQuality
																 						   FROM LabTests c
																						   WHERE c.PatientId = b.PatientId AND c.LabTest = 'PSA' AND c.LabDate = b.LabDate AND c.LabQuality = 'STD') THEN 'STD'
																			  WHEN EXISTS (SELECT c.LabQuality
																						   FROM LabTests c
																						   WHERE c.PatientId = b.PatientId AND c.LabTest = 'PSA' AND c.LabDate = b.LabDate AND c.LabQuality = 'REV') THEN 'REV'
																			  WHEN EXISTS (SELECT c.LabQuality
																						   FROM LabTests c
																						   WHERE c.PatientId = b.PatientId AND c.LabTest = 'PSA' AND c.LabDate = b.LabDate AND c.LabQuality = 'OUT') THEN 'OUT'
																			  ELSE ISNULL(NULL,'')
																		 END AND b.LabTest = 'PSA'
										 GROUP BY b.LabDate, b.LabQuality, b.LabResult, a.PatientId, a.ProcedureId, a.OperatingRoomDetailId
										) AS LabRecentPSA ON a.PatientId = LabRecentPSA.PatientId AND 
														     a.ProcedureId = LabRecentPSA.ProcedureId AND 
															 a.OperatingRoomDetailId = LabRecentPSA.OperatingRoomDetailId
					     -- PreOpStage: T stage prior to RP Proc Date
						 LEFT OUTER JOIN (SELECT b.ClinStageDate, b.ClinStageQuality, b.ClinStageT AS ClinStageT, a.PatientId, a.ProcedureId, a.OperatingRoomDetailId
										  FROM ProstatectomyTemp a INNER JOIN ClinicalStages b ON a.PatientId = b.PatientId
										  WHERE b.ClinStageDate = (SELECT MAX(c.ClinStageDate)
																   FROM ClinicalStages c
																   WHERE c.PatientId = b.PatientId AND c.ClinStageDate < a.ProcDate AND 
																	    (b.ClinStageDisease LIKE '%prostate%' OR b.ClinStageDisease IS NULL)
															      ) AND b.ClinStageT IS NOT NULL AND
											    ISNULL(b.ClinStageQuality,'') = CASE WHEN EXISTS (SELECT c.ClinStageQuality
																					              FROM ClinicalStages c
																								  WHERE c.PatientId = b.PatientId AND c.ClinStageDate = b.ClinStageDate AND 
																									   (b.ClinStageDisease IN('prostate','Prostate cancer') OR b.ClinStageDisease IS NULL) AND 
																									    c.ClinStageQuality = 'RR') THEN 'RR'
																					 WHEN EXISTS (SELECT c.ClinStageQuality
																		 						  FROM ClinicalStages c
																								  WHERE c.PatientId = b.PatientId AND c.ClinStageDate = b.ClinStageDate AND 
																									   (b.ClinStageDisease IN('prostate','Prostate cancer') OR b.ClinStageDisease IS NULL) AND
																									    c.ClinStageQuality = 'STD') THEN 'STD'
																					 WHEN EXISTS (SELECT c.ClinStageQuality
																								  FROM ClinicalStages c
																								  WHERE c.PatientId = b.PatientId AND c.ClinStageDate = b.ClinStageDate AND 
																									   (b.ClinStageDisease IN('prostate','Prostate cancer') OR b.ClinStageDisease IS NULL) AND 
																									    c.ClinStageQuality = 'REV') THEN 'REV'
																					 ELSE 'OUT'
																				END AND (b.ClinStageDisease IN('prostate','Prostate cancer') OR b.ClinStageDisease IS NULL)
									 GROUP BY b.ClinStageDate, b.ClinStageQuality, b.ClinStageT, a.PatientId, a.ProcedureId, a.OperatingRoomDetailId
									) AS PreOpClinStages ON a.PatientId = PreOpClinStages.PatientId AND 
														 a.ProcedureId = PreOpClinStages.ProcedureId AND 
														 a.OperatingRoomDetailId = PreOpClinStages.OperatingRoomDetailId
						-- PreOpGleasonSum: Dx Biopsy GGS
						LEFT OUTER JOIN (SELECT b.PathDate, b.PathQuality, c.PathGGS AS PreOpGleasonSum, a.PatientId, a.ProcedureId, a.OperatingRoomDetailId
										 FROM ProstatectomyTemp a INNER JOIN Pathology b ON a.PatientId = b.PatientId
									 							  INNER JOIN ProstateBiopsyPath c ON b.PathologyId = c.PathologyId
																  INNER JOIN Procedures d ON b.PatientId = d.PatientId AND b.ProcedureId = d.ProcedureId
										 WHERE d.ProcDate = (SELECT MAX(e.ProcDate)
															 FROM Pathology c INNER JOIN ProstateBiopsyPath d ON c.PathologyId = d.PathologyId
																			  INNER JOIN Procedures e ON c.PatientId = e.PatientId AND c.ProcedureId = e.ProcedureId
															 WHERE e.PatientId = b.PatientId AND e.ProcDate < a.ProcDate) AND
											   b.PathDate = (SELECT MAX(c.PathDate)
															 FROM Pathology c INNER JOIN ProstateBiopsyPath f ON c.PathologyId = f.PathologyId
																			  INNER JOIN Procedures e ON c.PatientId = e.PatientId AND c.ProcedureId = e.ProcedureId
															 WHERE c.PatientId = b.PatientId AND e.ProcDate = d.ProcDate AND c.PathDate < a.ProcDate																 
															) AND c.PathGGS IS NOT NULL AND
											   ISNULL(b.PathQuality, '') = CASE WHEN EXISTS (SELECT c.PathQuality
																							 FROM Pathology c INNER JOIN ProstateBiopsyPath d ON c.PathologyId = d.PathologyId
																							 WHERE c.PatientId = b.PatientId AND c.PathDate = b.PathDate AND c.PathQuality = 'RR') THEN 'RR'
																			    WHEN EXISTS (SELECT c.PathQuality
						 																	 FROM Pathology c INNER JOIN ProstateBiopsyPath d ON c.PathologyId = d.PathologyId
																							 WHERE c.PatientId = b.PatientId AND c.PathDate = b.PathDate AND c.PathQuality = 'STD') THEN 'STD'
																			    WHEN EXISTS (SELECT c.PathQuality
																							 FROM Pathology c INNER JOIN ProstateBiopsyPath d ON c.PathologyId = d.PathologyId
																							 WHERE c.PatientId = b.PatientId AND c.PathDate = b.PathDate AND c.PathQuality = 'REV') THEN 'REV'
																			    WHEN EXISTS (SELECT c.PathQuality
																							 FROM Pathology c INNER JOIN ProstateBiopsyPath d ON c.PathologyId = d.PathologyId
																							 WHERE c.PatientId = b.PatientId AND c.PathDate = b.PathDate AND c.PathQuality = 'OUT') THEN 'OUT'
																			    ELSE ISNULL(NULL,'')
																		   END
									 GROUP BY b.PathDate, b.PathQuality, c.PathGGS, a.PatientId, a.ProcedureId, a.OperatingRoomDetailId
									) AS PreOpGleasonSum ON a.PatientId =PreOpGleasonSum.PatientId AND
															a.ProcedureId =PreOpGleasonSum.ProcedureId AND
														    a.OperatingRoomDetailId = PreOpGleasonSum.OperatingRoomDetailId
						-- PreOp MRI Performed: Present/Absent
						LEFT OUTER JOIN (SELECT 'Present' AS PreOpMRIPerformed, a.PatientId, a.ProcedureId, a.OperatingRoomDetailId
										 FROM ProstatectomyTemp a
										 WHERE EXISTS (SELECT b.DxDate
													   FROM Diagnostics b
													   WHERE b.PatientId = a.PatientId AND b.DxDate < a.ProcDate AND b.DxType LIKE '%MRI%'
													  )										
										) AS PreOpMRI ON a.PatientId = PreOpMRI.PatientId AND 
														 a.ProcedureId = PreOpMRI.ProcedureId AND 
														 a.OperatingRoomDetailId = PreOpMRI.OperatingRoomDetailId 
						-- PreOpContinence
						LEFT OUTER JOIN (SELECT b.SurveyDate AS PreOpContinenceDate, b.SurveyQuality, c.SurveyItemResult AS PreOpContinence, a.PatientId, a.ProcedureId, a.OperatingRoomDetailId
										 FROM ProstatectomyTemp a INNER JOIN Surveys b ON a.PatientId = b.PatientId
																  INNER JOIN SurveyItems c ON b.SurveyId = c.SurveyId AND b.SurveyType = 'Urinary Function' AND c.SurveyItem = 'Continence'
										 WHERE b.SurveyDate = (SELECT MAX(c.SurveyDate)
															   FROM Surveys c INNER JOIN SurveyItems d ON c.SurveyId = d.SurveyId AND c.SurveyType = 'Urinary Function' AND d.SurveyItem = 'Continence'
															   WHERE c.PatientId = b.PatientId AND c.SurveyDate < a.ProcDate																 
														) AND c.SurveyItemResult IS NOT NULL AND
											   ISNULL(b.SurveyQuality, '') = CASE WHEN EXISTS (SELECT c.SurveyQuality
																							   FROM Surveys c INNER JOIN SurveyItems d ON c.SurveyId = d.SurveyId AND c.SurveyType = 'Urinary Function' AND d.SurveyItem = 'Continence'
																							   WHERE c.PatientId = b.PatientId AND c.SurveyDate = b.SurveyDate AND c.SurveyQuality = 'RR') THEN 'RR'
																				  WHEN EXISTS (SELECT c.SurveyQuality
																							   FROM Surveys c INNER JOIN SurveyItems d ON c.SurveyId = d.SurveyId AND c.SurveyType = 'Urinary Function' AND d.SurveyItem = 'Continence'
																							   WHERE c.PatientId = b.PatientId AND c.SurveyDate = b.SurveyDate AND c.SurveyQuality = 'STD') THEN 'STD'
																				  WHEN EXISTS (SELECT c.SurveyQuality
																							   FROM Surveys c INNER JOIN SurveyItems d ON c.SurveyId = d.SurveyId AND c.SurveyType = 'Urinary Function' AND d.SurveyItem = 'Continence'
																							   WHERE c.PatientId = b.PatientId AND c.SurveyDate = b.SurveyDate AND c.SurveyQuality = 'MSK') THEN 'MSK'
																				  WHEN EXISTS (SELECT c.SurveyQuality
																							   FROM Surveys c INNER JOIN SurveyItems d ON c.SurveyId = d.SurveyId AND c.SurveyType = 'Urinary Function' AND d.SurveyItem = 'Continence'
																							   WHERE c.PatientId = b.PatientId AND c.SurveyDate = b.SurveyDate AND c.SurveyQuality = 'REV') THEN 'REV'
																				  WHEN EXISTS (SELECT c.SurveyQuality
																							   FROM Surveys c INNER JOIN SurveyItems d ON c.SurveyId = d.SurveyId AND c.SurveyType = 'Urinary Function' AND d.SurveyItem = 'Continence'
																							   WHERE c.PatientId = b.PatientId AND c.SurveyDate = b.SurveyDate AND c.SurveyQuality = 'OUT') THEN 'OUT'
																				  ELSE ISNULL(NULL,'')
																			 END
											 GROUP BY b.SurveyDate, b.SurveyQuality, c.SurveyItemResult, a.PatientId, a.ProcedureId, a.OperatingRoomDetailId
											) AS PreOpSurveys ON a.PatientId = PreOpSurveys.PatientId AND 
																 a.ProcedureId = PreOpSurveys.ProcedureId AND 
																 a.OperatingRoomDetailId = PreOpSurveys.OperatingRoomDetailId 
						-- PostOpContinence
						LEFT OUTER JOIN (SELECT b.SurveyDate AS PostOpContinenceDate, b.SurveyQuality, c.SurveyItemResult AS PostOpContinence, a.PatientId, a.ProcedureId, a.OperatingRoomDetailId
										 FROM ProstatectomyTemp a INNER JOIN Surveys b ON a.PatientId = b.PatientId
																  INNER JOIN SurveyItems c ON b.SurveyId = c.SurveyId AND b.SurveyType = 'Urinary Function' AND c.SurveyItem = 'Continence'
										 WHERE b.SurveyDate = (SELECT MIN(c.SurveyDate)
															   FROM Surveys c INNER JOIN SurveyItems d ON c.SurveyId = d.SurveyId AND c.SurveyType = 'Urinary Function' AND d.SurveyItem = 'Continence'
															   WHERE c.PatientId = b.PatientId AND c.SurveyDate > a.ProcDate																	 
															  ) AND c.SurveyItemResult IS NOT NULL AND
											   ISNULL(b.SurveyQuality, '') = CASE WHEN EXISTS (SELECT c.SurveyQuality
																							   FROM Surveys c INNER JOIN SurveyItems d ON c.SurveyId = d.SurveyId AND c.SurveyType = 'Urinary Function' AND d.SurveyItem = 'Continence'
																							   WHERE c.PatientId = b.PatientId AND c.SurveyDate = b.SurveyDate AND c.SurveyQuality = 'RR') THEN 'RR'
																				  WHEN EXISTS (SELECT c.SurveyQuality
																							   FROM Surveys c INNER JOIN SurveyItems d ON c.SurveyId = d.SurveyId AND c.SurveyType = 'Urinary Function' AND d.SurveyItem = 'Continence'
																							   WHERE c.PatientId = b.PatientId AND c.SurveyDate = b.SurveyDate AND c.SurveyQuality = 'STD') THEN 'STD'
																				  WHEN EXISTS (SELECT c.SurveyQuality
																							   FROM Surveys c INNER JOIN SurveyItems d ON c.SurveyId = d.SurveyId AND c.SurveyType = 'Urinary Function' AND d.SurveyItem = 'Continence'
																							   WHERE c.PatientId = b.PatientId AND c.SurveyDate = b.SurveyDate AND c.SurveyQuality = 'MSK') THEN 'MSK'
																				  WHEN EXISTS (SELECT c.SurveyQuality
																							   FROM Surveys c INNER JOIN SurveyItems d ON c.SurveyId = d.SurveyId AND c.SurveyType = 'Urinary Function' AND d.SurveyItem = 'Continence'
																							   WHERE c.PatientId = b.PatientId AND c.SurveyDate = b.SurveyDate AND c.SurveyQuality = 'REV') THEN 'REV'
																				  WHEN EXISTS (SELECT c.SurveyQuality
																							   FROM Surveys c INNER JOIN SurveyItems d ON c.SurveyId = d.SurveyId AND c.SurveyType = 'Urinary Function' AND d.SurveyItem = 'Continence'
																							   WHERE c.PatientId = b.PatientId AND c.SurveyDate = b.SurveyDate AND c.SurveyQuality = 'OUT') THEN 'OUT'
																				  ELSE ISNULL(NULL,'')
																			  END
											 GROUP BY b.SurveyDate, b.SurveyQuality, c.SurveyItemResult, a.PatientId, a.ProcedureId, a.OperatingRoomDetailId
											) AS PostOpSurveys ON a.PatientId = PostOpSurveys.PatientId AND 
																  a.ProcedureId = PostOpSurveys.ProcedureId AND 
																  a.OperatingRoomDetailId = PostOpSurveys.OperatingRoomDetailId
						-- PreOpErectileFunction
						LEFT OUTER JOIN (SELECT b.SurveyDate AS PreOpErectileDate, b.SurveyQuality, c.SurveyItemResult AS PreOpErectileFunction, a.PatientId, a.ProcedureId, a.OperatingRoomDetailId
										 FROM ProstatectomyTemp a INNER JOIN Surveys b ON a.PatientId = b.PatientId
																  INNER JOIN SurveyItems c ON b.SurveyId = c.SurveyId AND b.SurveyType = 'Sexual Function' AND c.SurveyItem = 'Erectile Function'
										 WHERE b.SurveyDate = (SELECT MAX(c.SurveyDate)
															   FROM Surveys c INNER JOIN SurveyItems d ON c.SurveyId = d.SurveyId AND c.SurveyType = 'Sexual Function' AND d.SurveyItem = 'Erectile Function'
															   WHERE c.PatientId = b.PatientId AND c.SurveyDate < a.ProcDate																 
														) AND c.SurveyItemResult IS NOT NULL AND
											   ISNULL(b.SurveyQuality, '') = CASE WHEN EXISTS (SELECT c.SurveyQuality
																							   FROM Surveys c INNER JOIN SurveyItems d ON c.SurveyId = d.SurveyId AND c.SurveyType = 'Sexual Function' AND d.SurveyItem = 'Erectile Function'
																							   WHERE c.PatientId = b.PatientId AND c.SurveyDate = b.SurveyDate AND c.SurveyQuality = 'RR') THEN 'RR'
																				  WHEN EXISTS (SELECT c.SurveyQuality
																							   FROM Surveys c INNER JOIN SurveyItems d ON c.SurveyId = d.SurveyId AND c.SurveyType = 'Sexual Function' AND d.SurveyItem = 'Erectile Function'
																							   WHERE c.PatientId = b.PatientId AND c.SurveyDate = b.SurveyDate AND c.SurveyQuality = 'STD') THEN 'STD'
																				  WHEN EXISTS (SELECT c.SurveyQuality
																							   FROM Surveys c INNER JOIN SurveyItems d ON c.SurveyId = d.SurveyId AND c.SurveyType = 'Sexual Function' AND d.SurveyItem = 'Erectile Function'
																							   WHERE c.PatientId = b.PatientId AND c.SurveyDate = b.SurveyDate AND c.SurveyQuality = 'MSK') THEN 'MSK'
																				  WHEN EXISTS (SELECT c.SurveyQuality
																							   FROM Surveys c INNER JOIN SurveyItems d ON c.SurveyId = d.SurveyId AND c.SurveyType = 'Sexual Function' AND d.SurveyItem = 'Erectile Function'
																							   WHERE c.PatientId = b.PatientId AND c.SurveyDate = b.SurveyDate AND c.SurveyQuality = 'REV') THEN 'REV'
																				  WHEN EXISTS (SELECT c.SurveyQuality
																							   FROM Surveys c INNER JOIN SurveyItems d ON c.SurveyId = d.SurveyId AND c.SurveyType = 'Sexual Function' AND d.SurveyItem = 'Erectile Function'
																							   WHERE c.PatientId = b.PatientId AND c.SurveyDate = b.SurveyDate AND c.SurveyQuality = 'OUT') THEN 'OUT'
																				  ELSE ISNULL(NULL,'')
																			  END
											 GROUP BY b.SurveyDate, b.SurveyQuality, c.SurveyItemResult, a.PatientId, a.ProcedureId, a.OperatingRoomDetailId
											) AS PreOpSexualSurveys ON a.PatientId = PreOpSexualSurveys.PatientId AND 
																	   a.ProcedureId = PreOpSexualSurveys.ProcedureId AND 
																       a.OperatingRoomDetailId = PreOpSexualSurveys.OperatingRoomDetailId
						-- PostOpErectileFunction
						LEFT OUTER JOIN (SELECT b.SurveyDate AS PostOpErectileDate, b.SurveyQuality, c.SurveyItemResult AS PostOpErectileFunction, a.PatientId, a.ProcedureId, a.OperatingRoomDetailId
										 FROM ProstatectomyTemp a INNER JOIN Surveys b ON a.PatientId = b.PatientId
																  INNER JOIN SurveyItems c ON b.SurveyId = c.SurveyId AND b.SurveyType = 'Sexual Function' AND c.SurveyItem = 'Erectile Function'
										 WHERE b.SurveyDate = (SELECT MIN(c.SurveyDate)
															   FROM Surveys c INNER JOIN SurveyItems d ON c.SurveyId = d.SurveyId AND c.SurveyType = 'Sexual Function' AND d.SurveyItem = 'Erectile Function'
															   WHERE c.PatientId = b.PatientId AND c.SurveyDate > a.ProcDate																 
														) AND c.SurveyItemResult IS NOT NULL AND
											   ISNULL(b.SurveyQuality, '') = CASE WHEN EXISTS (SELECT c.SurveyQuality
																							   FROM Surveys c INNER JOIN SurveyItems d ON c.SurveyId = d.SurveyId AND c.SurveyType = 'Sexual Function' AND d.SurveyItem = 'Erectile Function'
																							   WHERE c.PatientId = b.PatientId AND c.SurveyDate = b.SurveyDate AND c.SurveyQuality = 'RR') THEN 'RR'
																				  WHEN EXISTS (SELECT c.SurveyQuality
																							   FROM Surveys c INNER JOIN SurveyItems d ON c.SurveyId = d.SurveyId AND c.SurveyType = 'Sexual Function' AND d.SurveyItem = 'Erectile Function'
																							   WHERE c.PatientId = b.PatientId AND c.SurveyDate = b.SurveyDate AND c.SurveyQuality = 'STD') THEN 'STD'
																				  WHEN EXISTS (SELECT c.SurveyQuality
																							   FROM Surveys c INNER JOIN SurveyItems d ON c.SurveyId = d.SurveyId AND c.SurveyType = 'Sexual Function' AND d.SurveyItem = 'Erectile Function'
																							   WHERE c.PatientId = b.PatientId AND c.SurveyDate = b.SurveyDate AND c.SurveyQuality = 'MSK') THEN 'MSK'
																				  WHEN EXISTS (SELECT c.SurveyQuality
																							   FROM Surveys c INNER JOIN SurveyItems d ON c.SurveyId = d.SurveyId AND c.SurveyType = 'Sexual Function' AND d.SurveyItem = 'Erectile Function'
																							   WHERE c.PatientId = b.PatientId AND c.SurveyDate = b.SurveyDate AND c.SurveyQuality = 'REV') THEN 'REV'
																				  WHEN EXISTS (SELECT c.SurveyQuality
																							   FROM Surveys c INNER JOIN SurveyItems d ON c.SurveyId = d.SurveyId AND c.SurveyType = 'Sexual Function' AND d.SurveyItem = 'Erectile Function'
																							   WHERE c.PatientId = b.PatientId AND c.SurveyDate = b.SurveyDate AND c.SurveyQuality = 'OUT') THEN 'OUT'
																				  ELSE ISNULL(NULL,'')
																			  END
											 GROUP BY b.SurveyDate, b.SurveyQuality, c.SurveyItemResult, a.PatientId, a.ProcedureId, a.OperatingRoomDetailId
											) AS PostOpSexualSurveys ON a.PatientId = PostOpSexualSurveys.PatientId AND 
																		a.ProcedureId = PostOpSexualSurveys.ProcedureId AND 
																		a.OperatingRoomDetailId = PostOpSexualSurveys.OperatingRoomDetailId
						-- Complication Present within 90 days (Yes/No)
						LEFT OUTER JOIN (SELECT 'Yes' AS PostOpComplications, a.PatientId, a.ProcedureId, a.OperatingRoomDetailId
										 FROM ProstatectomyTemp a
										 WHERE EXISTS (SELECT b.ToxName
													   FROM Toxicities b 
													   WHERE b.PatientId = a.PatientId AND b.ToxDate > a.ProcDate AND
														     DATEDIFF(day, a.ProcDate, b.ToxDate)<90 AND b.ToxName <> 'None'
													  )
										) AS PostOpToxicities ON a.PatientId = PostOpToxicities.PatientId AND 
																 a.ProcedureId = PostOpToxicities.ProcedureId AND 
																 a.OperatingRoomDetailId = PostOpToxicities.OperatingRoomDetailId
						-- Grade >1 Complication Present within 90 days (Yes/No)
						LEFT OUTER JOIN (SELECT 'Yes' AS PostOpComplicationsGrade, a.PatientId, a.ProcedureId, a.OperatingRoomDetailId
										 FROM ProstatectomyTemp a
										 WHERE EXISTS (SELECT b.ToxName
													   FROM Toxicities b 
													   WHERE b.PatientId = a.PatientId AND b.ToxDate > a.ProcDate AND
															 DATEDIFF(day, a.ProcDate, b.ToxDate)<90 AND b.ToxName <> 'None' AND 
															 b.ToxGrade NOT IN('0','1', 'Unknown', 'None', 'UNK')	
													  )
										) AS PostOpToxicitiesGrade ON a.PatientId = PostOpToxicitiesGrade.PatientId AND 
																	  a.ProcedureId = PostOpToxicitiesGrade.ProcedureId AND 
																	  a.OperatingRoomDetailId = PostOpToxicitiesGrade.OperatingRoomDetailId
						-- Path Stage (TN):
						LEFT OUTER JOIN (SELECT b.PathDate, b.PathQuality, c.PathStageT, c.PathStageM, c.PathStageN, a.PatientId, a.ProcedureId, a.OperatingRoomDetailId
										 FROM ProstatectomyTemp a INNER JOIN Pathology b ON a.PatientId = b.PatientId AND
																						    a.OperatingRoomDetailId = ISNULL(b.OperatingRoomDetailId, '') AND
																							a.ProcedureId = b.ProcedureId
																  INNER JOIN PathologyStageGrade c ON b.PathologyId = c.PathologyId AND c.PathStageDisease = 'Prostate'
										 WHERE ISNULL(b.PathQuality, '') = CASE WHEN EXISTS (SELECT c.PathQuality
																							 FROM Pathology c INNER JOIN PathologyStageGrade d ON c.PathologyId = d.PathologyId AND d.PathStageDisease = 'Prostate'
																							 WHERE c.PatientId = b.PatientId AND ISNULL(c.OperatingRoomDetailId, '') = ISNULL(b.OperatingRoomDetailId, '') AND c.ProcedureId = b.ProcedureId AND c.PathQuality = 'RR') THEN 'RR'
																			    WHEN EXISTS (SELECT c.PathQuality
																							 FROM Pathology c INNER JOIN PathologyStageGrade d ON c.PathologyId = d.PathologyId AND d.PathStageDisease = 'Prostate'
																							 WHERE c.PatientId = b.PatientId AND ISNULL(c.OperatingRoomDetailId, '') = ISNULL(b.OperatingRoomDetailId, '') AND c.ProcedureId = b.ProcedureId AND c.PathQuality = 'STD') THEN 'STD'
																			    WHEN EXISTS (SELECT c.PathQuality
																							 FROM Pathology c INNER JOIN PathologyStageGrade d ON c.PathologyId = d.PathologyId AND d.PathStageDisease = 'Prostate'
																							 WHERE c.PatientId = b.PatientId AND ISNULL(c.OperatingRoomDetailId, '') = ISNULL(b.OperatingRoomDetailId, '') AND c.ProcedureId = b.ProcedureId AND c.PathQuality = 'REV') THEN 'REV'
																			    WHEN EXISTS (SELECT c.PathQuality
																							 FROM Pathology c INNER JOIN PathologyStageGrade d ON c.PathologyId = d.PathologyId AND d.PathStageDisease = 'Prostate'
																							 WHERE c.PatientId = b.PatientId AND ISNULL(c.OperatingRoomDetailId, '') = ISNULL(b.OperatingRoomDetailId, '') AND c.ProcedureId = b.ProcedureId AND c.PathQuality = 'OUT') THEN 'OUT'
																			    ELSE ISNULL(NULL,'')
																			END 
										 GROUP BY b.PathDate, b.PathQuality, c.PathStageT, c.PathStageM, c.PathStageN, a.PatientId, a.ProcedureId, a.OperatingRoomDetailId
																				) AS PathStages ON a.PatientId = PathStages.PatientId AND 
																								   a.ProcedureId = PathStages.ProcedureId AND
																								   a.OperatingRoomDetailId = PathStages.OperatingRoomDetailId
						-- Path Gleason, Path Margin Status: 
						LEFT OUTER JOIN (SELECT b.PathQuality, c.PathGGS AS PathGGS, c.PathMargin AS PathMargin, a.PatientId, a.ProcedureId, a.OperatingRoomDetailId
										 FROM ProstatectomyTemp a INNER JOIN Pathology b ON a.PatientId = b.PatientId AND
																						    a.OperatingRoomDetailId = ISNULL(b.OperatingRoomDetailId, '') AND
																						    a.ProcedureId = b.ProcedureId
																  INNER JOIN ProstatectomyPath c ON b.PathologyId = c.PathologyId 
										 WHERE ISNULL(b.PathQuality, '') = CASE WHEN EXISTS (SELECT c.PathQuality
																							 FROM Pathology c INNER JOIN ProstatectomyPath d ON c.PathologyId = d.PathologyId 
																							 WHERE c.PatientId = b.PatientId AND ISNULL(c.OperatingRoomDetailId, '') = ISNULL(b.OperatingRoomDetailId, '') AND c.ProcedureId = b.ProcedureId AND c.PathQuality = 'RR') THEN 'RR'
																			    WHEN EXISTS (SELECT c.PathQuality
																							 FROM Pathology c INNER JOIN ProstatectomyPath d ON c.PathologyId = d.PathologyId 
																							 WHERE c.PatientId = b.PatientId AND ISNULL(c.OperatingRoomDetailId, '') = ISNULL(b.OperatingRoomDetailId, '') AND c.ProcedureId = b.ProcedureId AND c.PathQuality = 'STD') THEN 'STD'
																			    WHEN EXISTS (SELECT c.PathQuality
																							 FROM Pathology c INNER JOIN ProstatectomyPath d ON c.PathologyId = d.PathologyId 
																							 WHERE c.PatientId = b.PatientId AND ISNULL(c.OperatingRoomDetailId, '') = ISNULL(b.OperatingRoomDetailId, '') AND c.ProcedureId = b.ProcedureId AND c.PathQuality = 'REV') THEN 'REV'
																			    WHEN EXISTS (SELECT c.PathQuality
																							 FROM Pathology c INNER JOIN ProstatectomyPath d ON c.PathologyId = d.PathologyId 
																							 WHERE c.PatientId = b.PatientId AND ISNULL(c.OperatingRoomDetailId, '') = ISNULL(b.OperatingRoomDetailId, '') AND c.ProcedureId = b.ProcedureId AND c.PathQuality = 'OUT') THEN 'OUT'
																			    ELSE ISNULL(NULL,'')
																		    END
										 GROUP BY b.PathQuality, c.PathGGS, c.PathMargin, a.PatientId, a.ProcedureId, a.OperatingRoomDetailId
										) AS PathGleason ON a.PatientId = PathGleason.PatientId AND 
															a.ProcedureId = PathGleason.ProcedureId AND
															a.OperatingRoomDetailId = PathGleason.OperatingRoomDetailId
						-- PLND Performed (Yes/No): 
						LEFT OUTER JOIN (SELECT 'Yes' AS PLND_Performed, a.PatientId, a.ProcedureId, a.OperatingRoomDetailId
										 FROM ProstatectomyTemp a 
										 WHERE EXISTS (SELECT b.ProcName
													   FROM Procedures b 
													   WHERE b.PatientId = a.PatientId AND b.ProcName = 'PLND' AND
														    (ISNULL(b.OperatingRoomDetailId, '') = a.OperatingRoomDetailId OR b.ProcDate = a.ProcDate)												    
													  )
										) AS PLNDProc ON a.PatientId = PLNDProc.PatientId AND 
														 a.ProcedureId = PLNDProc.ProcedureId AND
														 a.OperatingRoomDetailId = PLNDProc.OperatingRoomDetailId
						-- Number of total nodes, Number of positive nodes, Positive Nodes (Yes or No)
						LEFT OUTER JOIN (SELECT c.PathQuality, c.PathResult AS PLND_Result, 
										        SUM(CAST((CASE WHEN ISNUMERIC(d.PathFindNumNodes)<>1 THEN NULL ELSE d.PathFindNumNodes END) AS float)) AS TotalNodes,  
												SUM(CAST((CASE WHEN ISNUMERIC(d.PathFindPosNodes)<>1 THEN NULL ELSE d.PathFindPosNodes END) AS float)) AS PositiveNodes, 
												a.PatientId, a.ProcedureId, a.OperatingRoomDetailId
										 FROM ProstatectomyTemp a INNER JOIN Procedures b ON a.PatientId = b.PatientId AND b.ProcName = 'PLND' AND (a.OperatingRoomDetailId = ISNULL(b.OperatingRoomDetailId, '') OR a.ProcDate = b.ProcDate) 
																  INNER JOIN Pathology c ON b.PatientId = c.PatientId AND b.ProcedureId = c.ProcedureId
																  INNER JOIN NodePathFinding d ON c.PathologyId = d.PathologyId 
										 WHERE ISNULL(c.PathQuality, '') = CASE WHEN EXISTS (SELECT f.PathQuality
																							 FROM Pathology f INNER JOIN NodePathFinding k ON f.PathologyId = k.PathologyId 
																							 WHERE f.PatientId = b.PatientId AND f.ProcedureId = b.ProcedureId AND f.PathQuality = 'RR') THEN 'RR'				   
																				WHEN EXISTS (SELECT f.PathQuality
																							 FROM Pathology f INNER JOIN NodePathFinding k ON f.PathologyId = k.PathologyId  
																							 WHERE f.PatientId = b.PatientId AND f.ProcedureId = b.ProcedureId AND f.PathQuality = 'STD') THEN 'STD'
																			    WHEN EXISTS (SELECT f.PathQuality
																							 FROM Pathology f INNER JOIN NodePathFinding k ON f.PathologyId = k.PathologyId 
																							 WHERE f.PatientId = b.PatientId AND f.ProcedureId = b.ProcedureId AND f.PathQuality = 'REV') THEN 'REV'
																			    WHEN EXISTS (SELECT f.PathQuality
																							 FROM Pathology f INNER JOIN NodePathFinding k ON f.PathologyId = k.PathologyId 
																							 WHERE f.PatientId = b.PatientId AND f.ProcedureId = b.ProcedureId AND f.PathQuality = 'OUT') THEN 'OUT'
																			    ELSE ISNULL(NULL,'')
																		   END
											GROUP BY a.PatientId, a.ProcedureId, a.OperatingRoomDetailId, a.PtMRN, a.AgeAtSurgery, 
													 a.ProcName, a.ProcSurgeon, a.ProcDate, a.ProcInstitution, c.PathQuality, c.PathResult
										) AS PLNDPath ON a.PatientId = PLNDPath.PatientId AND 
														 a.ProcedureId = PLNDPath.ProcedureId AND
														 a.OperatingRoomDetailId = PLNDPath.OperatingRoomDetailId
END
DECLARE @Cnt numeric(10,2)
SET @Cnt = (SELECT COUNT(*) FROM @UrologySurgeryReport);

-- Age_Range
UPDATE @ComparisonReport
SET Age_Range = (SELECT CAST(MIN(AgeAtSurgery) AS varchar(10)) + ' - ' + CAST(MAX(AgeAtSurgery) AS varchar(10)) AS Age_Range
                 FROM @UrologySurgeryReport)
WHERE Physician = @Physician
;
-- Median Age
WITH AgeTable AS
(
  SELECT AgeAtSurgery, ROW_NUMBER() OVER(ORDER BY AgeAtSurgery) AS RowNum_AgeAtSurgery
  FROM @UrologySurgeryReport
  WHERE ISNUMERIC(AgeAtSurgery) = 1
)

UPDATE @ComparisonReport
SET Median_Age = (SELECT AVG(CAST(AgeAtSurgery AS float)) AS Median_Age
				  FROM AgeTable
				  WHERE  RowNum_AgeAtSurgery IN(SELECT (MAX(RowNum_AgeAtSurgery) + 1)/2 FROM AgeTable) OR 
						 RowNum_AgeAtSurgery IN(SELECT (MAX(RowNum_AgeAtSurgery) + 2)/2 FROM AgeTable))
WHERE Physician = @Physician

-- BMI Range
UPDATE @ComparisonReport
SET BMI_Range = (SELECT CAST(MIN(CAST(PreOpBMI AS float)) AS varchar(10)) + ' - ' + CAST(MAX(CAST(PreOpBMI AS float)) AS varchar(10)) AS BMI_Range
				 FROM @UrologySurgeryReport
				 WHERE ISNUMERIC(PreOpBMI) = 1)
WHERE Physician = @Physician
;
-- BMI Median
WITH BMITable AS
(
  SELECT PreOpBMI, ROW_NUMBER() OVER(ORDER BY CAST(PreOpBMI AS float)) AS RowNum_BMI
  FROM @UrologySurgeryReport
  WHERE ISNUMERIC(PreOpBMI) = 1
)

UPDATE @ComparisonReport
SET Median_BMI = (SELECT AVG(CAST(PreOpBMI AS float)) AS Median_BMI
				  FROM BMITable
				  WHERE  RowNum_BMI IN(SELECT (MAX(RowNum_BMI) + 1)/2 FROM BMITable) OR 
					     RowNum_BMI IN(SELECT (MAX(RowNum_BMI) + 2)/2 FROM BMITable))
WHERE Physician = @Physician

-- PSA Range
UPDATE @ComparisonReport
SET PSA_Range = (SELECT CAST(MIN(CAST(PreOpPSA AS float)) AS varchar(10)) + ' - ' + CAST(MAX(CAST(PreOpPSA AS float)) AS varchar(10)) AS PSA_Range
				 FROM @UrologySurgeryReport
				 WHERE ISNUMERIC(PreOpPSA) = 1)
WHERE Physician = @Physician
;
-- PSA Median
WITH PSATable AS
(
  SELECT PreOpPSA, ROW_NUMBER() OVER(ORDER BY CAST(PreOpPSA AS float)) AS RowNum_PSA
  FROM @UrologySurgeryReport
  WHERE ISNUMERIC(PreOpPSA) = 1
)

UPDATE @ComparisonReport
SET Median_PSA = (SELECT AVG(CAST(PreOpPSA AS float)) AS Median_PSA
				  FROM PSATable
				  WHERE  RowNum_PSA IN(SELECT (MAX(RowNum_PSA) + 1)/2 FROM PSATable) OR 
					     RowNum_PSA IN(SELECT (MAX(RowNum_PSA) + 2)/2 FROM PSATable))
WHERE Physician = @Physician

-- EBL Range
UPDATE @ComparisonReport
SET EBL_Range = (SELECT CAST(MIN(CAST(OpEstBloodLoss AS float)) AS varchar(10)) + ' - ' + CAST(MAX(CAST(OpEstBloodLoss AS float)) AS varchar(10)) AS EBL_Range
				 FROM @UrologySurgeryReport
				 WHERE ISNUMERIC(OpEstBloodLoss) = 1)
WHERE Physician = @Physician

;
-- EBL Median
WITH EBLTable AS
(
  SELECT OpEstBloodLoss, ROW_NUMBER() OVER(ORDER BY CAST(OpEstBloodLoss AS float)) AS RowNum_EBL
  FROM @UrologySurgeryReport
  WHERE ISNUMERIC(OpEstBloodLoss) = 1
)

UPDATE @ComparisonReport
SET Median_EBL = (SELECT AVG(CAST(OpEstBloodLoss AS float)) AS Median_EBL
				  FROM EBLTable
				  WHERE  RowNum_EBL IN(SELECT (MAX(RowNum_EBL) + 1)/2 FROM EBLTable) OR 
					     RowNum_EBL IN(SELECT (MAX(RowNum_EBL) + 2)/2 FROM EBLTable))
WHERE Physician = @Physician

-- Range Number of Nodes removed
UPDATE @ComparisonReport
SET TotalNodes_Range = (SELECT CAST(MIN(CAST(TotalNodes AS float)) AS varchar(10)) + ' - ' + CAST(MAX(CAST(TotalNodes AS float)) AS varchar(10)) AS TotalNodes_Range
						FROM @UrologySurgeryReport
						WHERE ISNUMERIC(TotalNodes) = 1)
WHERE Physician = @Physician
;
-- Number of Nodes removed Median
WITH TotalNodesTable AS
(
  SELECT TotalNodes, ROW_NUMBER() OVER(ORDER BY CAST(TotalNodes AS float)) AS RowNum_TotalNodes
  FROM @UrologySurgeryReport
  WHERE ISNUMERIC(TotalNodes) = 1
)

UPDATE @ComparisonReport
SET Median_TotalNodes = (SELECT AVG(CAST(TotalNodes AS float)) AS Median_TotalNodes
						 FROM TotalNodesTable
						 WHERE  RowNum_TotalNodes IN(SELECT (MAX(RowNum_TotalNodes) + 1)/2 FROM TotalNodesTable) OR 
							    RowNum_TotalNodes IN(SELECT (MAX(RowNum_TotalNodes) + 2)/2 FROM TotalNodesTable))
WHERE Physician = @Physician
;
-- Median TimeToContinenanceLevel_II
WITH TimeToContinenanceLevel_IITable AS
(
  SELECT TimeToContinenanceLevel_II, ROW_NUMBER() OVER(ORDER BY TimeToContinenanceLevel_II) AS RowNum_TimeToContinenanceLevel_II
  FROM @UrologySurgeryReport
  WHERE ISNUMERIC(TimeToContinenanceLevel_II) = 1
)

UPDATE @ComparisonReport
SET Median_TimeToContinenanceLevel_II = (SELECT AVG(CAST(TimeToContinenanceLevel_II AS float)) AS Median_TimeToContinenanceLevel_II
										 FROM TimeToContinenanceLevel_IITable
										 WHERE  RowNum_TimeToContinenanceLevel_II IN(SELECT (MAX(RowNum_TimeToContinenanceLevel_II) + 1)/2 FROM TimeToContinenanceLevel_IITable) OR 
											    RowNum_TimeToContinenanceLevel_II IN(SELECT (MAX(RowNum_TimeToContinenanceLevel_II) + 2)/2 FROM TimeToContinenanceLevel_IITable))
WHERE Physician = @Physician
;
-- Median TimeToContinenanceLevel_I
WITH TimeToContinenanceLevel_ITable AS
(
  SELECT TimeToContinenanceLevel_I, ROW_NUMBER() OVER(ORDER BY TimeToContinenanceLevel_I) AS RowNum_TimeToContinenanceLevel_I
  FROM @UrologySurgeryReport
  WHERE ISNUMERIC(TimeToContinenanceLevel_I) = 1
)

UPDATE @ComparisonReport
SET Median_TimeToContinenanceLevel_I = (SELECT AVG(CAST(TimeToContinenanceLevel_I AS float)) AS Median_TimeToContinenanceLevel_I
										FROM TimeToContinenanceLevel_ITable
										WHERE  RowNum_TimeToContinenanceLevel_I IN(SELECT (MAX(RowNum_TimeToContinenanceLevel_I) + 1)/2 FROM TimeToContinenanceLevel_ITable) OR 
											   RowNum_TimeToContinenanceLevel_I IN(SELECT (MAX(RowNum_TimeToContinenanceLevel_I) + 2)/2 FROM TimeToContinenanceLevel_ITable))
WHERE Physician = @Physician
;
-- Median TimeToErectileFunctionLevel_III
WITH TimeToErectileFunctionLevel_IIITable AS
(
  SELECT TimeToErectileFunctionLevel_III, ROW_NUMBER() OVER(ORDER BY TimeToErectileFunctionLevel_III) AS RowNum_TimeToErectileFunctionLevel_III
  FROM @UrologySurgeryReport
  WHERE ISNUMERIC(TimeToErectileFunctionLevel_III) = 1
)

UPDATE @ComparisonReport
SET Median_TimeToErectileFunctionLevel_III = (SELECT AVG(CAST(TimeToErectileFunctionLevel_III AS float)) AS Median_TimeToErectileFunctionLevel_III
											  FROM TimeToErectileFunctionLevel_IIITable
											  WHERE  RowNum_TimeToErectileFunctionLevel_III IN(SELECT (MAX(RowNum_TimeToErectileFunctionLevel_III) + 1)/2 FROM TimeToErectileFunctionLevel_IIITable) OR 
												     RowNum_TimeToErectileFunctionLevel_III IN(SELECT (MAX(RowNum_TimeToErectileFunctionLevel_III) + 2)/2 FROM TimeToErectileFunctionLevel_IIITable))
WHERE Physician = @Physician
;
-- Median TimeToErectileFunctionLevel_II
WITH TimeToErectileFunctionLevel_IITable AS
(
  SELECT TimeToErectileFunctionLevel_II, ROW_NUMBER() OVER(ORDER BY TimeToErectileFunctionLevel_II) AS RowNum_TimeToErectileFunctionLevel_II
  FROM @UrologySurgeryReport
  WHERE ISNUMERIC(TimeToErectileFunctionLevel_II) = 1
)

UPDATE @ComparisonReport
SET Median_TimeToErectileFunctionLevel_II = (SELECT AVG(CAST(TimeToErectileFunctionLevel_II AS float)) AS Median_TimeToErectileFunctionLevel_II
											 FROM TimeToErectileFunctionLevel_IITable
											 WHERE  RowNum_TimeToErectileFunctionLevel_II IN(SELECT (MAX(RowNum_TimeToErectileFunctionLevel_II) + 1)/2 FROM TimeToErectileFunctionLevel_IITable) OR 
												    RowNum_TimeToErectileFunctionLevel_II IN(SELECT (MAX(RowNum_TimeToErectileFunctionLevel_II) + 2)/2 FROM TimeToErectileFunctionLevel_IITable))
WHERE Physician = @Physician
;
-- Median TimeToErectileFunctionLevel_I
WITH TimeToErectileFunctionLevel_ITable AS
(
  SELECT TimeToErectileFunctionLevel_I, ROW_NUMBER() OVER(ORDER BY TimeToErectileFunctionLevel_I) AS RowNum_TimeToErectileFunctionLevel_I
  FROM @UrologySurgeryReport
  WHERE ISNUMERIC(TimeToErectileFunctionLevel_I) = 1
)

UPDATE @ComparisonReport
SET Median_TimeToErectileFunctionLevel_I = (SELECT AVG(CAST(TimeToErectileFunctionLevel_I AS float)) AS Median_TimeToErectileFunctionLevel_I
											FROM TimeToErectileFunctionLevel_ITable
											WHERE  RowNum_TimeToErectileFunctionLevel_I IN(SELECT (MAX(RowNum_TimeToErectileFunctionLevel_I) + 1)/2 FROM TimeToErectileFunctionLevel_ITable) OR 
												   RowNum_TimeToErectileFunctionLevel_I IN(SELECT (MAX(RowNum_TimeToErectileFunctionLevel_I) + 2)/2 FROM TimeToErectileFunctionLevel_ITable))
WHERE Physician = @Physician

-- Percentage of Patietns with OpAutoTransfused
UPDATE @ComparisonReport
SET PercentOf_PatientsTransfused = (SELECT CAST((COUNT(*)/NULLIF(@Cnt, 0)) * 100 AS numeric(10,2)) AS PercentOf_PatientsTransfused
									FROM @UrologySurgeryReport
									WHERE OpAutoTransfused IS NOT NULL)
WHERE Physician = @Physician

-- Percentage of Patients with pT2

UPDATE @ComparisonReport
SET PercentOf_PatientsPathT2 = (SELECT CAST((COUNT(*)/NULLIF(@Cnt, 0)) * 100 AS numeric(10,2)) AS PercentOf_PatientsPathT2
								FROM @UrologySurgeryReport
								WHERE PathStageT LIKE '%T2%')
WHERE Physician = @Physician

-- Percentage of Patients with pT3
UPDATE @ComparisonReport
SET PercentOf_PatientsPathT3 = (SELECT CAST((COUNT(*)/NULLIF(@Cnt, 0)) * 100 AS numeric(10,2)) AS PercentOf_PatientsPathT3
								FROM @UrologySurgeryReport
								WHERE PathStageT LIKE '%T3%')
WHERE Physician = @Physician

-- Percentage of Patients with positive nodes
UPDATE @ComparisonReport
SET PercentOf_PatientsWithPositiveNodes = (SELECT CAST((COUNT(*)/NULLIF(@Cnt, 0)) * 100 AS numeric(10,2)) AS PercentOf_PatientsWithPositiveNodes
										   FROM @UrologySurgeryReport
										   WHERE ISNUMERIC(PositiveNodes) = 1 AND PositiveNodes <> '0')
WHERE Physician = @Physician

-- Percentage Positive margin with pT2
UPDATE @ComparisonReport
SET PercentOf_PatientsWithPositiveMarginT2 = (SELECT CAST((COUNT(*)/NULLIF(@Cnt, 0)) * 100 AS numeric(10,2)) AS PercentOf_PatientsWithPositiveMarginT2
											  FROM @UrologySurgeryReport
											  WHERE PathMargin LIKE '%positive%' AND PathStageT LIKE '%T2%')
WHERE Physician = @Physician

-- Percentage Positive margin with pT3
UPDATE @ComparisonReport
SET PercentOf_PatientsWithPositiveMarginT3 = (SELECT CAST((COUNT(*)/NULLIF(@Cnt, 0)) * 100 AS numeric(10,2)) AS PercentOf_PatientsWithPositiveMarginT3
											  FROM @UrologySurgeryReport
											  WHERE PathMargin LIKE '%positive%' AND PathStageT LIKE '%T3%')
WHERE Physician = @Physician

-- Percentage of Patients with positive margin overall
UPDATE @ComparisonReport
SET PercentOf_PatientsWithPositiveMarginOverall = (SELECT CAST((COUNT(*)/NULLIF(@Cnt, 0)) * 100 AS numeric(10,2)) AS PercentOf_PatientsWithPositiveMarginOverall
												   FROM @UrologySurgeryReport
												   WHERE PathMargin LIKE '%positive%')
WHERE Physician = @Physician

-- Percentage of Patients with non-zero PSA after 30 within surgery
UPDATE @ComparisonReport
SET PercentOf_PatientsWithRecurrences = (SELECT CAST((COUNT(*)/NULLIF(@Cnt, 0)) * 100 AS numeric(10,2)) AS PercentOf_PatientsWithRecurrences
										 FROM @UrologySurgeryReport
										 WHERE ISNUMERIC(PostOpPSA_30Days)= 1 AND CAST(PostOpPSA_30Days AS float) > 0)
WHERE Physician = @Physician

-- Percent Complications Grade> 1 within 90 days
UPDATE @ComparisonReport
SET PercentOf_PatientsWithComplicationGrade = (SELECT CAST((COUNT(*)/NULLIF(@Cnt, 0)) * 100 AS numeric(10,2)) AS PercentOf_PatientsWithComplicationGrade
											   FROM @UrologySurgeryReport
											   WHERE PostOpComplication_90days = 'Yes' AND PostOpComplicationGrade_90days = 'Yes')
WHERE Physician = @Physician

-- Percent of patients with cT1
UPDATE @ComparisonReport
SET PercentOf_PatientsWithClinStageT1 = (SELECT CAST((COUNT(*)/NULLIF(@Cnt, 0)) * 100 AS numeric(10,2)) AS PercentOf_PatientsWithClinStageT1
										 FROM @UrologySurgeryReport
										 WHERE PreOpClinStageT LIKE '%T1%')
WHERE Physician = @Physician

-- Percent of patients with cT1
UPDATE @ComparisonReport
SET PercentOf_PatientsWithClinStageT2 = (SELECT CAST((COUNT(*)/NULLIF(@Cnt, 0)) * 100 AS numeric(10,2)) AS PercentOf_PatientsWithClinStageT2
										 FROM @UrologySurgeryReport
										 WHERE PreOpClinStageT LIKE '%T2%')
WHERE Physician = @Physician

-- Percent of patients with cT1
UPDATE @ComparisonReport
SET PercentOf_PatientsWithClinStageT3 = (SELECT CAST((COUNT(*)/NULLIF(@Cnt, 0)) * 100 AS numeric(10,2)) AS PercentOf_PatientsWithClinStageT3
										 FROM @UrologySurgeryReport
										 WHERE PreOpClinStageT LIKE '%T3%')
WHERE Physician = @Physician

-- Prostatectomies by Physician
UPDATE @ComparisonReport
SET Cnt = (SELECT COUNT(*) FROM @UrologySurgeryReport)
WHERE Physician = @Physician

-- All Prostatectomies by Physician
IF @ProcedureType = 'All Prostatectomies'
BEGIN
UPDATE @ComparisonReport
SET All_Cnt = ( SELECT COUNT(*)
							FROM Patients a INNER JOIN Procedures b ON a.PatientId = b.PatientId
											INNER JOIN PatientInstitutions c ON a.PatientId = c.PatientId					
							WHERE b.ProcName IN(@Prostatectomy_1, @Prostatectomy_2, @Prostatectomy_3, @Prostatectomy_5, @Prostatectomy_6, @Prostatectomy_7, @Prostatectomy_9) AND
								 (b.ProcInstitution IN(@InstitutionName_1, @InstitutionName_2, @InstitutionName_3, @InstitutionName_4, @InstitutionName_5) OR b.ProcQuality = @ProcQuality) AND
								  c.InstitutionId = @InstitutionId AND a.PtMRN <> 'TEST0000' AND b.ProcSurgeon LIKE @PhysicianName)
WHERE Physician = @Physician
END
ELSE
BEGIN
UPDATE @ComparisonReport
SET All_Cnt = ( SELECT COUNT(*)
							FROM Patients a INNER JOIN Procedures b ON a.PatientId = b.PatientId
											INNER JOIN PatientInstitutions c ON a.PatientId = c.PatientId					
							WHERE b.ProcName IN 
									(CASE 
										 WHEN @ProcedureType = 'RP' THEN @Prostatectomy_1
										 WHEN @ProcedureType = 'LP' THEN @Prostatectomy_2
										 WHEN @ProcedureType = 'RALP' THEN @Prostatectomy_3
										 WHEN @ProcedureType = 'SalvRP' THEN @Prostatectomy_6
										 WHEN @ProcedureType = 'SalvLP' THEN @Prostatectomy_7
										 
									END) AND
								 (b.ProcInstitution IN(@InstitutionName_1, @InstitutionName_2, @InstitutionName_3, @InstitutionName_4, @InstitutionName_5) OR b.ProcQuality = @ProcQuality) AND
								  c.InstitutionId = @InstitutionId AND a.PtMRN <> 'TEST0000' AND b.ProcSurgeon LIKE @PhysicianName)
WHERE Physician = @Physician
END

-- This SELECT populates rest of the Urology Service data----------------------------------------------------------------------------------
;--last statement MUST be semicolon-terminated to use a CTE
IF @ProcedureType = 'All Prostatectomies'
BEGIN
WITH ProstatectomyTemp(PatientId, ProcedureId, OperatingRoomDetailId, PtMRN, AgeAtSurgery, ProcName, ProcSurgeon, ProcDate, ProcInstitution) AS
(
	SELECT a.PatientId, b.ProcedureId, ISNULL(b.OperatingRoomDetailId,'') AS OperatingRoomDetailId, a.PtMRN, 
		   DATEDIFF(year, a.PtBirthDate, b.ProcDate) AS AgeAtSurgery, b.ProcName, b.ProcSurgeon, b.ProcDate, b.ProcInstitution
	FROM Patients a INNER JOIN Procedures b ON a.PatientId = b.PatientId
					INNER JOIN PatientInstitutions c ON a.PatientId = c.PatientId					
	WHERE b.ProcName IN(@Prostatectomy_1, @Prostatectomy_2, @Prostatectomy_3, @Prostatectomy_5, @Prostatectomy_6, @Prostatectomy_7, @Prostatectomy_9) AND
		 (b.ProcInstitution IN(@InstitutionName_1, @InstitutionName_2, @InstitutionName_3, @InstitutionName_4, @InstitutionName_5) OR b.ProcQuality = @ProcQuality) AND
		  c.InstitutionId = @InstitutionId AND a.PtMRN <> 'TEST0000' AND ISNULL(b.ProcSurgeon, '') NOT LIKE @PhysicianName AND 
         (b.ProcDate BETWEEN @FromDate AND @ToDate)
)
INSERT INTO @UrologySurgeryReport_Service
	  (PtMRN, AgeAtSurgery, ProcName, ProcSurgeon, ProcDate, PreOpBMI, OpASA, OpEstBloodLoss, OpAutoTransfused, PreOpPSA,
	   PreOpGleasonSum, PreOpClinStageT, ProcStageT, PathStageT, PathStageN, PathStageM, PathGleasonSum, PathMargin, 
       PLNDPerformed, PLND_Result, TotalNodes, PositiveNodes, PostOpPSA_30Days, LastPSA, PreOpMRI_Performed, PreOpContinence, 
       PostOpContinence, TimeToContinenanceLevel_II, TimeToContinenanceLevel_I, PreOpErectileFunction, PostOpErectileFunction, 
	   TimeToErectileFunctionLevel_III, TimeToErectileFunctionLevel_II, TimeToErectileFunctionLevel_I, PostOpComplication_90days, 
       PostOpComplicationGrade_90days)
SELECT a.PtMRN, a.AgeAtSurgery, a.ProcName, a.ProcSurgeon, a.ProcDate, EncounterBMI.EncBMI AS PreOpBMI, b.OpASA, b.OpEstBloodLoss, b.OpAutoTransfused, LabPrePSA.PreOpPSA,
	   PreOpGleasonSum.PreOpGleasonSum, PreOpClinStages.ClinStageT AS PreOpClinStageT, c.ProcStageT, PathStages.PathStageT, PathStages.PathStageN, PathStages.PathStageM, 
	   PathGleason.PathGGS AS PathGleasonSum, PathGleason.PathMargin AS PathMargin, ISNULL(PLNDProc.PLND_Performed, 'No') AS PLNDPerformed, PLNDPath.PLND_Result, 
       PLNDPath.TotalNodes, PLNDPath.PositiveNodes, LabPostPSA.PostOpPSA AS PostOpPSA_30Days, LabRecentPSA.LastPSA, ISNULL(PreOpMRI.PreOpMRIPerformed, 'Absent') AS PreOpMRI_Performed,   
       PreOpSurveys.PreOpContinence, PostOpSurveys.PostOpContinence, 
	   TimeToContinenanceLevel_II  = CASE WHEN PostOpSurveys.PostOpContinence = '2' THEN DATEDIFF(day, a.ProcDate, PostOpSurveys.PostOpContinenceDate) ELSE NULL END,
	   TimeToContinenanceLevel_I  = CASE WHEN PostOpSurveys.PostOpContinence = '1' THEN DATEDIFF(day, a.ProcDate, PostOpSurveys.PostOpContinenceDate) ELSE NULL END,
	   PreOpSexualSurveys.PreOpErectileFunction, PostOpSexualSurveys.PostOpErectileFunction, 
	   TimeToErectileFunctionLevel_III= CASE WHEN PostOpSexualSurveys.PostOpErectileFunction = '3' THEN DATEDIFF(day, a.ProcDate, PostOpSexualSurveys.PostOpErectileDate) ELSE NULL END,
       TimeToErectileFunctionLevel_II  = CASE WHEN PostOpSexualSurveys.PostOpErectileFunction = '2' THEN DATEDIFF(day, a.ProcDate, PostOpSexualSurveys.PostOpErectileDate) ELSE NULL END,
       TimeToErectileFunctionLevel_I  = CASE WHEN PostOpSexualSurveys.PostOpErectileFunction = '1' THEN DATEDIFF(day, a.ProcDate, PostOpSexualSurveys.PostOpErectileDate) ELSE NULL END,
	   ISNULL(PostOpToxicities.PostOpComplications, 'No') AS PostOpComplication_90days,
	   ISNULL(PostOpToxicitiesGrade.PostOpComplicationsGrade, 'No') AS PostOpComplicationGrade_90days
						 -- ASA, Blood Loss, Transfusion
FROM ProstatectomyTemp a LEFT OUTER JOIN OperatingRoomDetails b ON a.PatientId = b.PatientId AND
																  (a.OperatingRoomDetailId = ISNULL(b.OperatingRoomDetailId, '') OR a.ProcDate = b.OpDate)
						 -- T stage from RP procedure
						 LEFT OUTER JOIN ProstatectomyProc c ON a.ProcedureId = c.ProcedureId
						 -- EncBMI right before surgery
						 LEFT OUTER JOIN (SELECT b.EncDate, b.EncQuality, b.EncBMI AS EncBMI, a.PatientId, a.ProcedureId, a.OperatingRoomDetailId
										  FROM ProstatectomyTemp a INNER JOIN Encounters b ON a.PatientId = b.PatientId
										  WHERE b.EncDate = (SELECT MAX(c.EncDate)
															 FROM Encounters c
															 WHERE c.PatientId = b.PatientId AND c.EncDate < a.ProcDate																 
															) AND b.EncBMI IS NOT NULL AND
												ISNULL(b.EncQuality,'') = CASE WHEN EXISTS (SELECT c.EncQuality
																							FROM Encounters c
																							WHERE c.PatientId = b.PatientId AND c.EncDate = b.EncDate AND c.EncQuality = 'RR') THEN 'RR'
																			   WHEN EXISTS (SELECT c.EncQuality
																						    FROM Encounters c
																						    WHERE c.PatientId = b.PatientId AND c.EncDate = b.EncDate AND c.EncQuality = 'STD') THEN 'STD'
																			   WHEN EXISTS (SELECT c.EncQuality
																						    FROM Encounters c
																						    WHERE c.PatientId = b.PatientId AND c.EncDate = b.EncDate AND c.EncQuality = 'REV') THEN 'REV'
																			   WHEN EXISTS (SELECT c.EncQuality
																						    FROM Encounters c
																						    WHERE c.PatientId = b.PatientId AND c.EncDate = b.EncDate AND c.EncQuality = 'OUT') THEN 'OUT'
																			   ELSE ISNULL(NULL,'')
																		  END
										  GROUP BY b.EncDate, b.EncQuality, b.EncBMI, a.PatientId, a.ProcedureId, a.OperatingRoomDetailId
										  ) AS EncounterBMI ON a.PatientId = EncounterBMI.PatientId AND 
															   a.ProcedureId = EncounterBMI.ProcedureId AND 															   
															   a.OperatingRoomDetailId = EncounterBMI.OperatingRoomDetailId
						-- PreOp PSA value and date immediately before proc date
						LEFT OUTER JOIN (SELECT b.LabDate AS PreOpPSA_Date , b.LabQuality, b.LabResult AS PreOpPSA, a.PatientId, a.ProcedureId, a.OperatingRoomDetailId
										 FROM ProstatectomyTemp a INNER JOIN LabTests b ON a.PatientId = b.PatientId
										 WHERE b.LabDate = (SELECT MAX(c.LabDate)
															FROM LabTests c
															WHERE c.PatientId = b.PatientId AND c.LabTest = 'PSA' AND c.LabDate < a.ProcDate																 
														   ) AND b.LabResult IS NOT NULL AND 
											   ISNULL(b.LabQuality, '') = CASE WHEN EXISTS (SELECT c.LabQuality
																							FROM LabTests c
																							WHERE c.PatientId = b.PatientId AND c.LabTest = 'PSA' AND c.LabDate = b.LabDate AND c.LabQuality = 'RR') THEN 'RR'
																			   WHEN EXISTS (SELECT c.LabQuality
						 																    FROM LabTests c
																						    WHERE c.PatientId = b.PatientId AND c.LabTest = 'PSA' AND c.LabDate = b.LabDate AND c.LabQuality = 'STD') THEN 'STD'
																			   WHEN EXISTS (SELECT c.LabQuality
																						    FROM LabTests c
																						    WHERE c.PatientId = b.PatientId AND c.LabTest = 'PSA' AND c.LabDate = b.LabDate AND c.LabQuality = 'REV') THEN 'REV'
																			   WHEN EXISTS (SELECT c.LabQuality
																						    FROM LabTests c
																						    WHERE c.PatientId = b.PatientId AND c.LabTest = 'PSA' AND c.LabDate = b.LabDate AND c.LabQuality = 'OUT') THEN 'OUT'
																			   ELSE ISNULL(NULL,'')
																		  END AND b.LabTest = 'PSA'
										 GROUP BY b.LabDate, b.LabQuality, b.LabResult, a.PatientId, a.ProcedureId, a.OperatingRoomDetailId
										) AS LabPrePSA ON a.PatientId = LabPrePSA.PatientId AND 
													      a.ProcedureId = LabPrePSA.ProcedureId AND 
														  a.OperatingRoomDetailId = LabPrePSA.OperatingRoomDetailId
						-- PostOp PSA value and date immeditately after proc date + 30 days
						LEFT OUTER JOIN (SELECT b.LabDate AS PostOpPSA_Date, b.LabQuality, b.LabResult AS PostOpPSA, a.PatientId, a.ProcedureId, a.OperatingRoomDetailId
										 FROM ProstatectomyTemp a INNER JOIN LabTests b ON a.PatientId = b.PatientId
										 WHERE b.LabDate = (SELECT MIN(c.LabDate)
															FROM LabTests c
															WHERE c.PatientId = b.PatientId AND c.LabTest = 'PSA' AND DATEDIFF(day, a.ProcDate, c.LabDate) >= 30
														   ) AND b.LabResult IS NOT NULL AND
											   ISNULL(b.LabQuality, '') = CASE WHEN EXISTS (SELECT c.LabQuality
																							FROM LabTests c
																							WHERE c.PatientId = b.PatientId AND c.LabTest = 'PSA' AND c.LabDate = b.LabDate AND c.LabQuality = 'RR') THEN 'RR'
																			   WHEN EXISTS (SELECT c.LabQuality
						 																    FROM LabTests c
																						    WHERE c.PatientId = b.PatientId AND c.LabTest = 'PSA' AND c.LabDate = b.LabDate AND c.LabQuality = 'STD') THEN 'STD'
																			   WHEN EXISTS (SELECT c.LabQuality
																						    FROM LabTests c
																						    WHERE c.PatientId = b.PatientId AND c.LabTest = 'PSA' AND c.LabDate = b.LabDate AND c.LabQuality = 'REV') THEN 'REV'
																			   WHEN EXISTS (SELECT c.LabQuality
																						    FROM LabTests c
																						    WHERE c.PatientId = b.PatientId AND c.LabTest = 'PSA' AND c.LabDate = b.LabDate AND c.LabQuality = 'OUT') THEN 'OUT'
																			   ELSE ISNULL(NULL,'')
																		  END AND b.LabTest = 'PSA'
										 GROUP BY b.LabDate, b.LabQuality, b.LabResult, a.PatientId, a.ProcedureId, a.OperatingRoomDetailId
										) AS LabPostPSA ON a.PatientId = LabPostPSA.PatientId AND 
													       a.ProcedureId = LabPostPSA.ProcedureId AND 
														   a.OperatingRoomDetailId = LabPostPSA.OperatingRoomDetailId
						-- Last PSA: Most recent PSA
						LEFT OUTER JOIN (SELECT b.LabDate AS LastPSA_Date, b.LabQuality, b.LabResult AS LastPSA, a.PatientId, a.ProcedureId, a.OperatingRoomDetailId
										 FROM ProstatectomyTemp a INNER JOIN LabTests b ON a.PatientId = b.PatientId
										 WHERE b.LabDate = (SELECT MAX(c.LabDate)
															FROM LabTests c
															WHERE c.PatientId = b.PatientId AND c.LabTest = 'PSA'																 
														   ) AND b.LabResult IS NOT NULL AND 
											   ISNULL(b.LabQuality,'') = CASE WHEN EXISTS (SELECT c.LabQuality
																			               FROM LabTests c
																			               WHERE c.PatientId = b.PatientId AND c.LabTest = 'PSA' AND c.LabDate = b.LabDate AND c.LabQuality = 'RR') THEN 'RR'
																			  WHEN EXISTS (SELECT c.LabQuality
																 						   FROM LabTests c
																						   WHERE c.PatientId = b.PatientId AND c.LabTest = 'PSA' AND c.LabDate = b.LabDate AND c.LabQuality = 'STD') THEN 'STD'
																			  WHEN EXISTS (SELECT c.LabQuality
																						   FROM LabTests c
																						   WHERE c.PatientId = b.PatientId AND c.LabTest = 'PSA' AND c.LabDate = b.LabDate AND c.LabQuality = 'REV') THEN 'REV'
																			  WHEN EXISTS (SELECT c.LabQuality
																						   FROM LabTests c
																						   WHERE c.PatientId = b.PatientId AND c.LabTest = 'PSA' AND c.LabDate = b.LabDate AND c.LabQuality = 'OUT') THEN 'OUT'
																			  ELSE ISNULL(NULL,'')
																		 END AND b.LabTest = 'PSA'
										 GROUP BY b.LabDate, b.LabQuality, b.LabResult, a.PatientId, a.ProcedureId, a.OperatingRoomDetailId
										) AS LabRecentPSA ON a.PatientId = LabRecentPSA.PatientId AND 
														     a.ProcedureId = LabRecentPSA.ProcedureId AND 
															 a.OperatingRoomDetailId = LabRecentPSA.OperatingRoomDetailId
					     -- PreOpStage: T stage prior to RP Proc Date
						 LEFT OUTER JOIN (SELECT b.ClinStageDate, b.ClinStageQuality, b.ClinStageT AS ClinStageT, a.PatientId, a.ProcedureId, a.OperatingRoomDetailId
										  FROM ProstatectomyTemp a INNER JOIN ClinicalStages b ON a.PatientId = b.PatientId
										  WHERE b.ClinStageDate = (SELECT MAX(c.ClinStageDate)
																   FROM ClinicalStages c
																   WHERE c.PatientId = b.PatientId AND c.ClinStageDate < a.ProcDate AND 
																	    (b.ClinStageDisease LIKE '%prostate%' OR b.ClinStageDisease IS NULL)
															      ) AND b.ClinStageT IS NOT NULL AND
											    ISNULL(b.ClinStageQuality,'') = CASE WHEN EXISTS (SELECT c.ClinStageQuality
																					              FROM ClinicalStages c
																								  WHERE c.PatientId = b.PatientId AND c.ClinStageDate = b.ClinStageDate AND 
																									   (b.ClinStageDisease IN('prostate','Prostate cancer') OR b.ClinStageDisease IS NULL) AND 
																									    c.ClinStageQuality = 'RR') THEN 'RR'
																					 WHEN EXISTS (SELECT c.ClinStageQuality
																		 						  FROM ClinicalStages c
																								  WHERE c.PatientId = b.PatientId AND c.ClinStageDate = b.ClinStageDate AND 
																									   (b.ClinStageDisease IN('prostate','Prostate cancer') OR b.ClinStageDisease IS NULL) AND
																									    c.ClinStageQuality = 'STD') THEN 'STD'
																					 WHEN EXISTS (SELECT c.ClinStageQuality
																								  FROM ClinicalStages c
																								  WHERE c.PatientId = b.PatientId AND c.ClinStageDate = b.ClinStageDate AND 
																									   (b.ClinStageDisease IN('prostate','Prostate cancer') OR b.ClinStageDisease IS NULL) AND 
																									    c.ClinStageQuality = 'REV') THEN 'REV'
																					 ELSE 'OUT'
																				END AND (b.ClinStageDisease IN('prostate','Prostate cancer') OR b.ClinStageDisease IS NULL)
									 GROUP BY b.ClinStageDate, b.ClinStageQuality, b.ClinStageT, a.PatientId, a.ProcedureId, a.OperatingRoomDetailId
									) AS PreOpClinStages ON a.PatientId = PreOpClinStages.PatientId AND 
														 a.ProcedureId = PreOpClinStages.ProcedureId AND 
														 a.OperatingRoomDetailId = PreOpClinStages.OperatingRoomDetailId
						-- PreOpGleasonSum: Dx Biopsy GGS
						LEFT OUTER JOIN (SELECT b.PathDate, b.PathQuality, c.PathGGS AS PreOpGleasonSum, a.PatientId, a.ProcedureId, a.OperatingRoomDetailId
										 FROM ProstatectomyTemp a INNER JOIN Pathology b ON a.PatientId = b.PatientId
									 							  INNER JOIN ProstateBiopsyPath c ON b.PathologyId = c.PathologyId
																  INNER JOIN Procedures d ON b.PatientId = d.PatientId AND b.ProcedureId = d.ProcedureId
										 WHERE d.ProcDate = (SELECT MAX(e.ProcDate)
															 FROM Pathology c INNER JOIN ProstateBiopsyPath d ON c.PathologyId = d.PathologyId
																			  INNER JOIN Procedures e ON c.PatientId = e.PatientId AND c.ProcedureId = e.ProcedureId
															 WHERE e.PatientId = b.PatientId AND e.ProcDate < a.ProcDate) AND
											   b.PathDate = (SELECT MAX(c.PathDate)
															 FROM Pathology c INNER JOIN ProstateBiopsyPath f ON c.PathologyId = f.PathologyId
																			  INNER JOIN Procedures e ON c.PatientId = e.PatientId AND c.ProcedureId = e.ProcedureId
															 WHERE c.PatientId = b.PatientId AND e.ProcDate = d.ProcDate AND c.PathDate < a.ProcDate																 
															) AND c.PathGGS IS NOT NULL AND
											   ISNULL(b.PathQuality, '') = CASE WHEN EXISTS (SELECT c.PathQuality
																							 FROM Pathology c INNER JOIN ProstateBiopsyPath d ON c.PathologyId = d.PathologyId
																							 WHERE c.PatientId = b.PatientId AND c.PathDate = b.PathDate AND c.PathQuality = 'RR') THEN 'RR'
																			    WHEN EXISTS (SELECT c.PathQuality
						 																	 FROM Pathology c INNER JOIN ProstateBiopsyPath d ON c.PathologyId = d.PathologyId
																							 WHERE c.PatientId = b.PatientId AND c.PathDate = b.PathDate AND c.PathQuality = 'STD') THEN 'STD'
																			    WHEN EXISTS (SELECT c.PathQuality
																							 FROM Pathology c INNER JOIN ProstateBiopsyPath d ON c.PathologyId = d.PathologyId
																							 WHERE c.PatientId = b.PatientId AND c.PathDate = b.PathDate AND c.PathQuality = 'REV') THEN 'REV'
																			    WHEN EXISTS (SELECT c.PathQuality
																							 FROM Pathology c INNER JOIN ProstateBiopsyPath d ON c.PathologyId = d.PathologyId
																							 WHERE c.PatientId = b.PatientId AND c.PathDate = b.PathDate AND c.PathQuality = 'OUT') THEN 'OUT'
																			    ELSE ISNULL(NULL,'')
																		   END
									 GROUP BY b.PathDate, b.PathQuality, c.PathGGS, a.PatientId, a.ProcedureId, a.OperatingRoomDetailId
									) AS PreOpGleasonSum ON a.PatientId =PreOpGleasonSum.PatientId AND
															a.ProcedureId =PreOpGleasonSum.ProcedureId AND
														    a.OperatingRoomDetailId = PreOpGleasonSum.OperatingRoomDetailId
						-- PreOp MRI Performed: Present/Absent
						LEFT OUTER JOIN (SELECT 'Present' AS PreOpMRIPerformed, a.PatientId, a.ProcedureId, a.OperatingRoomDetailId
										 FROM ProstatectomyTemp a
										 WHERE EXISTS (SELECT b.DxDate
													   FROM Diagnostics b
													   WHERE b.PatientId = a.PatientId AND b.DxDate < a.ProcDate AND b.DxType LIKE '%MRI%'
													  )										
										) AS PreOpMRI ON a.PatientId = PreOpMRI.PatientId AND 
														 a.ProcedureId = PreOpMRI.ProcedureId AND 
														 a.OperatingRoomDetailId = PreOpMRI.OperatingRoomDetailId 
						-- PreOpContinence
						LEFT OUTER JOIN (SELECT b.SurveyDate AS PreOpContinenceDate, b.SurveyQuality, c.SurveyItemResult AS PreOpContinence, a.PatientId, a.ProcedureId, a.OperatingRoomDetailId
										 FROM ProstatectomyTemp a INNER JOIN Surveys b ON a.PatientId = b.PatientId
																  INNER JOIN SurveyItems c ON b.SurveyId = c.SurveyId AND b.SurveyType = 'Urinary Function' AND c.SurveyItem = 'Continence'
										 WHERE b.SurveyDate = (SELECT MAX(c.SurveyDate)
															   FROM Surveys c INNER JOIN SurveyItems d ON c.SurveyId = d.SurveyId AND c.SurveyType = 'Urinary Function' AND d.SurveyItem = 'Continence'
															   WHERE c.PatientId = b.PatientId AND c.SurveyDate < a.ProcDate																 
														) AND c.SurveyItemResult IS NOT NULL AND
											   ISNULL(b.SurveyQuality, '') = CASE WHEN EXISTS (SELECT c.SurveyQuality
																							   FROM Surveys c INNER JOIN SurveyItems d ON c.SurveyId = d.SurveyId AND c.SurveyType = 'Urinary Function' AND d.SurveyItem = 'Continence'
																							   WHERE c.PatientId = b.PatientId AND c.SurveyDate = b.SurveyDate AND c.SurveyQuality = 'RR') THEN 'RR'
																				  WHEN EXISTS (SELECT c.SurveyQuality
																							   FROM Surveys c INNER JOIN SurveyItems d ON c.SurveyId = d.SurveyId AND c.SurveyType = 'Urinary Function' AND d.SurveyItem = 'Continence'
																							   WHERE c.PatientId = b.PatientId AND c.SurveyDate = b.SurveyDate AND c.SurveyQuality = 'STD') THEN 'STD'
																				  WHEN EXISTS (SELECT c.SurveyQuality
																							   FROM Surveys c INNER JOIN SurveyItems d ON c.SurveyId = d.SurveyId AND c.SurveyType = 'Urinary Function' AND d.SurveyItem = 'Continence'
																							   WHERE c.PatientId = b.PatientId AND c.SurveyDate = b.SurveyDate AND c.SurveyQuality = 'MSK') THEN 'MSK'
																				  WHEN EXISTS (SELECT c.SurveyQuality
																							   FROM Surveys c INNER JOIN SurveyItems d ON c.SurveyId = d.SurveyId AND c.SurveyType = 'Urinary Function' AND d.SurveyItem = 'Continence'
																							   WHERE c.PatientId = b.PatientId AND c.SurveyDate = b.SurveyDate AND c.SurveyQuality = 'REV') THEN 'REV'
																				  WHEN EXISTS (SELECT c.SurveyQuality
																							   FROM Surveys c INNER JOIN SurveyItems d ON c.SurveyId = d.SurveyId AND c.SurveyType = 'Urinary Function' AND d.SurveyItem = 'Continence'
																							   WHERE c.PatientId = b.PatientId AND c.SurveyDate = b.SurveyDate AND c.SurveyQuality = 'OUT') THEN 'OUT'
																				  ELSE ISNULL(NULL,'')
																			 END
											 GROUP BY b.SurveyDate, b.SurveyQuality, c.SurveyItemResult, a.PatientId, a.ProcedureId, a.OperatingRoomDetailId
											) AS PreOpSurveys ON a.PatientId = PreOpSurveys.PatientId AND 
																 a.ProcedureId = PreOpSurveys.ProcedureId AND 
																 a.OperatingRoomDetailId = PreOpSurveys.OperatingRoomDetailId 
						-- PostOpContinence
						LEFT OUTER JOIN (SELECT b.SurveyDate AS PostOpContinenceDate, b.SurveyQuality, c.SurveyItemResult AS PostOpContinence, a.PatientId, a.ProcedureId, a.OperatingRoomDetailId
										 FROM ProstatectomyTemp a INNER JOIN Surveys b ON a.PatientId = b.PatientId
																  INNER JOIN SurveyItems c ON b.SurveyId = c.SurveyId AND b.SurveyType = 'Urinary Function' AND c.SurveyItem = 'Continence'
										 WHERE b.SurveyDate = (SELECT MIN(c.SurveyDate)
															   FROM Surveys c INNER JOIN SurveyItems d ON c.SurveyId = d.SurveyId AND c.SurveyType = 'Urinary Function' AND d.SurveyItem = 'Continence'
															   WHERE c.PatientId = b.PatientId AND c.SurveyDate > a.ProcDate																	 
															  ) AND c.SurveyItemResult IS NOT NULL AND
											   ISNULL(b.SurveyQuality, '') = CASE WHEN EXISTS (SELECT c.SurveyQuality
																							   FROM Surveys c INNER JOIN SurveyItems d ON c.SurveyId = d.SurveyId AND c.SurveyType = 'Urinary Function' AND d.SurveyItem = 'Continence'
																							   WHERE c.PatientId = b.PatientId AND c.SurveyDate = b.SurveyDate AND c.SurveyQuality = 'RR') THEN 'RR'
																				  WHEN EXISTS (SELECT c.SurveyQuality
																							   FROM Surveys c INNER JOIN SurveyItems d ON c.SurveyId = d.SurveyId AND c.SurveyType = 'Urinary Function' AND d.SurveyItem = 'Continence'
																							   WHERE c.PatientId = b.PatientId AND c.SurveyDate = b.SurveyDate AND c.SurveyQuality = 'STD') THEN 'STD'
																				  WHEN EXISTS (SELECT c.SurveyQuality
																							   FROM Surveys c INNER JOIN SurveyItems d ON c.SurveyId = d.SurveyId AND c.SurveyType = 'Urinary Function' AND d.SurveyItem = 'Continence'
																							   WHERE c.PatientId = b.PatientId AND c.SurveyDate = b.SurveyDate AND c.SurveyQuality = 'MSK') THEN 'MSK'
																				  WHEN EXISTS (SELECT c.SurveyQuality
																							   FROM Surveys c INNER JOIN SurveyItems d ON c.SurveyId = d.SurveyId AND c.SurveyType = 'Urinary Function' AND d.SurveyItem = 'Continence'
																							   WHERE c.PatientId = b.PatientId AND c.SurveyDate = b.SurveyDate AND c.SurveyQuality = 'REV') THEN 'REV'
																				  WHEN EXISTS (SELECT c.SurveyQuality
																							   FROM Surveys c INNER JOIN SurveyItems d ON c.SurveyId = d.SurveyId AND c.SurveyType = 'Urinary Function' AND d.SurveyItem = 'Continence'
																							   WHERE c.PatientId = b.PatientId AND c.SurveyDate = b.SurveyDate AND c.SurveyQuality = 'OUT') THEN 'OUT'
																				  ELSE ISNULL(NULL,'')
																			  END
											 GROUP BY b.SurveyDate, b.SurveyQuality, c.SurveyItemResult, a.PatientId, a.ProcedureId, a.OperatingRoomDetailId
											) AS PostOpSurveys ON a.PatientId = PostOpSurveys.PatientId AND 
																  a.ProcedureId = PostOpSurveys.ProcedureId AND 
																  a.OperatingRoomDetailId = PostOpSurveys.OperatingRoomDetailId
						-- PreOpErectileFunction
						LEFT OUTER JOIN (SELECT b.SurveyDate AS PreOpErectileDate, b.SurveyQuality, c.SurveyItemResult AS PreOpErectileFunction, a.PatientId, a.ProcedureId, a.OperatingRoomDetailId
										 FROM ProstatectomyTemp a INNER JOIN Surveys b ON a.PatientId = b.PatientId
																  INNER JOIN SurveyItems c ON b.SurveyId = c.SurveyId AND b.SurveyType = 'Sexual Function' AND c.SurveyItem = 'Erectile Function'
										 WHERE b.SurveyDate = (SELECT MAX(c.SurveyDate)
															   FROM Surveys c INNER JOIN SurveyItems d ON c.SurveyId = d.SurveyId AND c.SurveyType = 'Sexual Function' AND d.SurveyItem = 'Erectile Function'
															   WHERE c.PatientId = b.PatientId AND c.SurveyDate < a.ProcDate																 
														) AND c.SurveyItemResult IS NOT NULL AND
											   ISNULL(b.SurveyQuality, '') = CASE WHEN EXISTS (SELECT c.SurveyQuality
																							   FROM Surveys c INNER JOIN SurveyItems d ON c.SurveyId = d.SurveyId AND c.SurveyType = 'Sexual Function' AND d.SurveyItem = 'Erectile Function'
																							   WHERE c.PatientId = b.PatientId AND c.SurveyDate = b.SurveyDate AND c.SurveyQuality = 'RR') THEN 'RR'
																				  WHEN EXISTS (SELECT c.SurveyQuality
																							   FROM Surveys c INNER JOIN SurveyItems d ON c.SurveyId = d.SurveyId AND c.SurveyType = 'Sexual Function' AND d.SurveyItem = 'Erectile Function'
																							   WHERE c.PatientId = b.PatientId AND c.SurveyDate = b.SurveyDate AND c.SurveyQuality = 'STD') THEN 'STD'
																				  WHEN EXISTS (SELECT c.SurveyQuality
																							   FROM Surveys c INNER JOIN SurveyItems d ON c.SurveyId = d.SurveyId AND c.SurveyType = 'Sexual Function' AND d.SurveyItem = 'Erectile Function'
																							   WHERE c.PatientId = b.PatientId AND c.SurveyDate = b.SurveyDate AND c.SurveyQuality = 'MSK') THEN 'MSK'
																				  WHEN EXISTS (SELECT c.SurveyQuality
																							   FROM Surveys c INNER JOIN SurveyItems d ON c.SurveyId = d.SurveyId AND c.SurveyType = 'Sexual Function' AND d.SurveyItem = 'Erectile Function'
																							   WHERE c.PatientId = b.PatientId AND c.SurveyDate = b.SurveyDate AND c.SurveyQuality = 'REV') THEN 'REV'
																				  WHEN EXISTS (SELECT c.SurveyQuality
																							   FROM Surveys c INNER JOIN SurveyItems d ON c.SurveyId = d.SurveyId AND c.SurveyType = 'Sexual Function' AND d.SurveyItem = 'Erectile Function'
																							   WHERE c.PatientId = b.PatientId AND c.SurveyDate = b.SurveyDate AND c.SurveyQuality = 'OUT') THEN 'OUT'
																				  ELSE ISNULL(NULL,'')
																			  END
											 GROUP BY b.SurveyDate, b.SurveyQuality, c.SurveyItemResult, a.PatientId, a.ProcedureId, a.OperatingRoomDetailId
											) AS PreOpSexualSurveys ON a.PatientId = PreOpSexualSurveys.PatientId AND 
																	   a.ProcedureId = PreOpSexualSurveys.ProcedureId AND 
																       a.OperatingRoomDetailId = PreOpSexualSurveys.OperatingRoomDetailId
						-- PostOpErectileFunction
						LEFT OUTER JOIN (SELECT b.SurveyDate AS PostOpErectileDate, b.SurveyQuality, c.SurveyItemResult AS PostOpErectileFunction, a.PatientId, a.ProcedureId, a.OperatingRoomDetailId
										 FROM ProstatectomyTemp a INNER JOIN Surveys b ON a.PatientId = b.PatientId
																  INNER JOIN SurveyItems c ON b.SurveyId = c.SurveyId AND b.SurveyType = 'Sexual Function' AND c.SurveyItem = 'Erectile Function'
										 WHERE b.SurveyDate = (SELECT MIN(c.SurveyDate)
															   FROM Surveys c INNER JOIN SurveyItems d ON c.SurveyId = d.SurveyId AND c.SurveyType = 'Sexual Function' AND d.SurveyItem = 'Erectile Function'
															   WHERE c.PatientId = b.PatientId AND c.SurveyDate > a.ProcDate																 
														) AND c.SurveyItemResult IS NOT NULL AND
											   ISNULL(b.SurveyQuality, '') = CASE WHEN EXISTS (SELECT c.SurveyQuality
																							   FROM Surveys c INNER JOIN SurveyItems d ON c.SurveyId = d.SurveyId AND c.SurveyType = 'Sexual Function' AND d.SurveyItem = 'Erectile Function'
																							   WHERE c.PatientId = b.PatientId AND c.SurveyDate = b.SurveyDate AND c.SurveyQuality = 'RR') THEN 'RR'
																				  WHEN EXISTS (SELECT c.SurveyQuality
																							   FROM Surveys c INNER JOIN SurveyItems d ON c.SurveyId = d.SurveyId AND c.SurveyType = 'Sexual Function' AND d.SurveyItem = 'Erectile Function'
																							   WHERE c.PatientId = b.PatientId AND c.SurveyDate = b.SurveyDate AND c.SurveyQuality = 'STD') THEN 'STD'
																				  WHEN EXISTS (SELECT c.SurveyQuality
																							   FROM Surveys c INNER JOIN SurveyItems d ON c.SurveyId = d.SurveyId AND c.SurveyType = 'Sexual Function' AND d.SurveyItem = 'Erectile Function'
																							   WHERE c.PatientId = b.PatientId AND c.SurveyDate = b.SurveyDate AND c.SurveyQuality = 'MSK') THEN 'MSK'
																				  WHEN EXISTS (SELECT c.SurveyQuality
																							   FROM Surveys c INNER JOIN SurveyItems d ON c.SurveyId = d.SurveyId AND c.SurveyType = 'Sexual Function' AND d.SurveyItem = 'Erectile Function'
																							   WHERE c.PatientId = b.PatientId AND c.SurveyDate = b.SurveyDate AND c.SurveyQuality = 'REV') THEN 'REV'
																				  WHEN EXISTS (SELECT c.SurveyQuality
																							   FROM Surveys c INNER JOIN SurveyItems d ON c.SurveyId = d.SurveyId AND c.SurveyType = 'Sexual Function' AND d.SurveyItem = 'Erectile Function'
																							   WHERE c.PatientId = b.PatientId AND c.SurveyDate = b.SurveyDate AND c.SurveyQuality = 'OUT') THEN 'OUT'
																				  ELSE ISNULL(NULL,'')
																			  END
											 GROUP BY b.SurveyDate, b.SurveyQuality, c.SurveyItemResult, a.PatientId, a.ProcedureId, a.OperatingRoomDetailId
											) AS PostOpSexualSurveys ON a.PatientId = PostOpSexualSurveys.PatientId AND 
																		a.ProcedureId = PostOpSexualSurveys.ProcedureId AND 
																		a.OperatingRoomDetailId = PostOpSexualSurveys.OperatingRoomDetailId
						-- Complication Present within 90 days (Yes/No)
						LEFT OUTER JOIN (SELECT 'Yes' AS PostOpComplications, a.PatientId, a.ProcedureId, a.OperatingRoomDetailId
										 FROM ProstatectomyTemp a
										 WHERE EXISTS (SELECT b.ToxName
													   FROM Toxicities b 
													   WHERE b.PatientId = a.PatientId AND b.ToxDate > a.ProcDate AND
														     DATEDIFF(day, a.ProcDate, b.ToxDate)<90 AND b.ToxName <> 'None'
													  )
										) AS PostOpToxicities ON a.PatientId = PostOpToxicities.PatientId AND 
																 a.ProcedureId = PostOpToxicities.ProcedureId AND 
																 a.OperatingRoomDetailId = PostOpToxicities.OperatingRoomDetailId
						-- Grade >1 Complication Present within 90 days (Yes/No)
						LEFT OUTER JOIN (SELECT 'Yes' AS PostOpComplicationsGrade, a.PatientId, a.ProcedureId, a.OperatingRoomDetailId
										 FROM ProstatectomyTemp a
										 WHERE EXISTS (SELECT b.ToxName
													   FROM Toxicities b 
													   WHERE b.PatientId = a.PatientId AND b.ToxDate > a.ProcDate AND
															 DATEDIFF(day, a.ProcDate, b.ToxDate)<90 AND b.ToxName <> 'None' AND 
															 b.ToxGrade NOT IN('0','1', 'Unknown', 'None', 'UNK')	
													  )
										) AS PostOpToxicitiesGrade ON a.PatientId = PostOpToxicitiesGrade.PatientId AND 
																	  a.ProcedureId = PostOpToxicitiesGrade.ProcedureId AND 
																	  a.OperatingRoomDetailId = PostOpToxicitiesGrade.OperatingRoomDetailId
						-- Path Stage (TN):
						LEFT OUTER JOIN (SELECT b.PathDate, b.PathQuality, c.PathStageT, c.PathStageM, c.PathStageN, a.PatientId, a.ProcedureId, a.OperatingRoomDetailId
										 FROM ProstatectomyTemp a INNER JOIN Pathology b ON a.PatientId = b.PatientId AND
																						    a.OperatingRoomDetailId = ISNULL(b.OperatingRoomDetailId, '') AND
																							a.ProcedureId = b.ProcedureId
																  INNER JOIN PathologyStageGrade c ON b.PathologyId = c.PathologyId AND c.PathStageDisease = 'Prostate'
										 WHERE ISNULL(b.PathQuality, '') = CASE WHEN EXISTS (SELECT c.PathQuality
																							 FROM Pathology c INNER JOIN PathologyStageGrade d ON c.PathologyId = d.PathologyId AND d.PathStageDisease = 'Prostate'
																							 WHERE c.PatientId = b.PatientId AND ISNULL(c.OperatingRoomDetailId, '') = ISNULL(b.OperatingRoomDetailId, '') AND c.ProcedureId = b.ProcedureId AND c.PathQuality = 'RR') THEN 'RR'
																			    WHEN EXISTS (SELECT c.PathQuality
																							 FROM Pathology c INNER JOIN PathologyStageGrade d ON c.PathologyId = d.PathologyId AND d.PathStageDisease = 'Prostate'
																							 WHERE c.PatientId = b.PatientId AND ISNULL(c.OperatingRoomDetailId, '') = ISNULL(b.OperatingRoomDetailId, '') AND c.ProcedureId = b.ProcedureId AND c.PathQuality = 'STD') THEN 'STD'
																			    WHEN EXISTS (SELECT c.PathQuality
																							 FROM Pathology c INNER JOIN PathologyStageGrade d ON c.PathologyId = d.PathologyId AND d.PathStageDisease = 'Prostate'
																							 WHERE c.PatientId = b.PatientId AND ISNULL(c.OperatingRoomDetailId, '') = ISNULL(b.OperatingRoomDetailId, '') AND c.ProcedureId = b.ProcedureId AND c.PathQuality = 'REV') THEN 'REV'
																			    WHEN EXISTS (SELECT c.PathQuality
																							 FROM Pathology c INNER JOIN PathologyStageGrade d ON c.PathologyId = d.PathologyId AND d.PathStageDisease = 'Prostate'
																							 WHERE c.PatientId = b.PatientId AND ISNULL(c.OperatingRoomDetailId, '') = ISNULL(b.OperatingRoomDetailId, '') AND c.ProcedureId = b.ProcedureId AND c.PathQuality = 'OUT') THEN 'OUT'
																			    ELSE ISNULL(NULL,'')
																			END 
										 GROUP BY b.PathDate, b.PathQuality, c.PathStageT, c.PathStageM, c.PathStageN, a.PatientId, a.ProcedureId, a.OperatingRoomDetailId
																				) AS PathStages ON a.PatientId = PathStages.PatientId AND 
																								   a.ProcedureId = PathStages.ProcedureId AND
																								   a.OperatingRoomDetailId = PathStages.OperatingRoomDetailId
						-- Path Gleason, Path Margin Status: 
						LEFT OUTER JOIN (SELECT b.PathQuality, c.PathGGS AS PathGGS, c.PathMargin AS PathMargin, a.PatientId, a.ProcedureId, a.OperatingRoomDetailId
										 FROM ProstatectomyTemp a INNER JOIN Pathology b ON a.PatientId = b.PatientId AND
																						    a.OperatingRoomDetailId = ISNULL(b.OperatingRoomDetailId, '') AND
																						    a.ProcedureId = b.ProcedureId
																  INNER JOIN ProstatectomyPath c ON b.PathologyId = c.PathologyId 
										 WHERE ISNULL(b.PathQuality, '') = CASE WHEN EXISTS (SELECT c.PathQuality
																							 FROM Pathology c INNER JOIN ProstatectomyPath d ON c.PathologyId = d.PathologyId 
																							 WHERE c.PatientId = b.PatientId AND ISNULL(c.OperatingRoomDetailId, '') = ISNULL(b.OperatingRoomDetailId, '') AND c.ProcedureId = b.ProcedureId AND c.PathQuality = 'RR') THEN 'RR'
																			    WHEN EXISTS (SELECT c.PathQuality
																							 FROM Pathology c INNER JOIN ProstatectomyPath d ON c.PathologyId = d.PathologyId 
																							 WHERE c.PatientId = b.PatientId AND ISNULL(c.OperatingRoomDetailId, '') = ISNULL(b.OperatingRoomDetailId, '') AND c.ProcedureId = b.ProcedureId AND c.PathQuality = 'STD') THEN 'STD'
																			    WHEN EXISTS (SELECT c.PathQuality
																							 FROM Pathology c INNER JOIN ProstatectomyPath d ON c.PathologyId = d.PathologyId 
																							 WHERE c.PatientId = b.PatientId AND ISNULL(c.OperatingRoomDetailId, '') = ISNULL(b.OperatingRoomDetailId, '') AND c.ProcedureId = b.ProcedureId AND c.PathQuality = 'REV') THEN 'REV'
																			    WHEN EXISTS (SELECT c.PathQuality
																							 FROM Pathology c INNER JOIN ProstatectomyPath d ON c.PathologyId = d.PathologyId 
																							 WHERE c.PatientId = b.PatientId AND ISNULL(c.OperatingRoomDetailId, '') = ISNULL(b.OperatingRoomDetailId, '') AND c.ProcedureId = b.ProcedureId AND c.PathQuality = 'OUT') THEN 'OUT'
																			    ELSE ISNULL(NULL,'')
																		    END
										 GROUP BY b.PathQuality, c.PathGGS, c.PathMargin, a.PatientId, a.ProcedureId, a.OperatingRoomDetailId
										) AS PathGleason ON a.PatientId = PathGleason.PatientId AND 
															a.ProcedureId = PathGleason.ProcedureId AND
															a.OperatingRoomDetailId = PathGleason.OperatingRoomDetailId
						-- PLND Performed (Yes/No): 
						LEFT OUTER JOIN (SELECT 'Yes' AS PLND_Performed, a.PatientId, a.ProcedureId, a.OperatingRoomDetailId
										 FROM ProstatectomyTemp a 
										 WHERE EXISTS (SELECT b.ProcName
													   FROM Procedures b 
													   WHERE b.PatientId = a.PatientId AND b.ProcName = 'PLND' AND
														    (ISNULL(b.OperatingRoomDetailId, '') = a.OperatingRoomDetailId OR b.ProcDate = a.ProcDate)												    
													  )
										) AS PLNDProc ON a.PatientId = PLNDProc.PatientId AND 
														 a.ProcedureId = PLNDProc.ProcedureId AND
														 a.OperatingRoomDetailId = PLNDProc.OperatingRoomDetailId
						-- Number of total nodes, Number of positive nodes, Positive Nodes (Yes or No)
						LEFT OUTER JOIN (SELECT c.PathQuality, c.PathResult AS PLND_Result, 
										        SUM(CAST((CASE WHEN ISNUMERIC(d.PathFindNumNodes)<>1 THEN NULL ELSE d.PathFindNumNodes END) AS float)) AS TotalNodes,  
												SUM(CAST((CASE WHEN ISNUMERIC(d.PathFindPosNodes)<>1 THEN NULL ELSE d.PathFindPosNodes END) AS float)) AS PositiveNodes, 
												a.PatientId, a.ProcedureId, a.OperatingRoomDetailId
										 FROM ProstatectomyTemp a INNER JOIN Procedures b ON a.PatientId = b.PatientId AND b.ProcName = 'PLND' AND (a.OperatingRoomDetailId = ISNULL(b.OperatingRoomDetailId, '') OR a.ProcDate = b.ProcDate) 
																  INNER JOIN Pathology c ON b.PatientId = c.PatientId AND b.ProcedureId = c.ProcedureId
																  INNER JOIN NodePathFinding d ON c.PathologyId = d.PathologyId 
										 WHERE ISNULL(c.PathQuality, '') = CASE WHEN EXISTS (SELECT f.PathQuality
																							 FROM Pathology f INNER JOIN NodePathFinding k ON f.PathologyId = k.PathologyId 
																							 WHERE f.PatientId = b.PatientId AND f.ProcedureId = b.ProcedureId AND f.PathQuality = 'RR') THEN 'RR'				   
																				WHEN EXISTS (SELECT f.PathQuality
																							 FROM Pathology f INNER JOIN NodePathFinding k ON f.PathologyId = k.PathologyId  
																							 WHERE f.PatientId = b.PatientId AND f.ProcedureId = b.ProcedureId AND f.PathQuality = 'STD') THEN 'STD'
																			    WHEN EXISTS (SELECT f.PathQuality
																							 FROM Pathology f INNER JOIN NodePathFinding k ON f.PathologyId = k.PathologyId 
																							 WHERE f.PatientId = b.PatientId AND f.ProcedureId = b.ProcedureId AND f.PathQuality = 'REV') THEN 'REV'
																			    WHEN EXISTS (SELECT f.PathQuality
																							 FROM Pathology f INNER JOIN NodePathFinding k ON f.PathologyId = k.PathologyId 
																							 WHERE f.PatientId = b.PatientId AND f.ProcedureId = b.ProcedureId AND f.PathQuality = 'OUT') THEN 'OUT'
																			    ELSE ISNULL(NULL,'')
																		   END
											GROUP BY a.PatientId, a.ProcedureId, a.OperatingRoomDetailId, a.PtMRN, a.AgeAtSurgery, 
													 a.ProcName, a.ProcSurgeon, a.ProcDate, a.ProcInstitution, c.PathQuality, c.PathResult
										) AS PLNDPath ON a.PatientId = PLNDPath.PatientId AND 
														 a.ProcedureId = PLNDPath.ProcedureId AND
														 a.OperatingRoomDetailId = PLNDPath.OperatingRoomDetailId

END
ELSE
BEGIN
WITH ProstatectomyTemp(PatientId, ProcedureId, OperatingRoomDetailId, PtMRN, AgeAtSurgery, ProcName, ProcSurgeon, ProcDate, ProcInstitution) AS
(
	SELECT a.PatientId, b.ProcedureId, ISNULL(b.OperatingRoomDetailId,'') AS OperatingRoomDetailId, a.PtMRN, 
		   DATEDIFF(year, a.PtBirthDate, b.ProcDate) AS AgeAtSurgery, b.ProcName, b.ProcSurgeon, b.ProcDate, b.ProcInstitution
	FROM Patients a INNER JOIN Procedures b ON a.PatientId = b.PatientId
					INNER JOIN PatientInstitutions c ON a.PatientId = c.PatientId					
	WHERE b.ProcName IN(
			CASE 
				 WHEN @ProcedureType = 'RP' THEN @Prostatectomy_1
				 WHEN @ProcedureType = 'LP' THEN @Prostatectomy_2
				 WHEN @ProcedureType = 'RALP' THEN @Prostatectomy_3
				 WHEN @ProcedureType = 'SalvRP' THEN @Prostatectomy_6
				 WHEN @ProcedureType = 'SalvLP' THEN @Prostatectomy_7
				 
			END) AND
		 (b.ProcInstitution IN(@InstitutionName_1, @InstitutionName_2, @InstitutionName_3, @InstitutionName_4, @InstitutionName_5) OR b.ProcQuality = @ProcQuality) AND
		  c.InstitutionId = @InstitutionId AND a.PtMRN <> 'TEST0000' AND ISNULL(b.ProcSurgeon, '') NOT LIKE @PhysicianName AND 
         (b.ProcDate BETWEEN @FromDate AND @ToDate)
)
INSERT INTO @UrologySurgeryReport_Service
	  (PtMRN, AgeAtSurgery, ProcName, ProcSurgeon, ProcDate, PreOpBMI, OpASA, OpEstBloodLoss, OpAutoTransfused, PreOpPSA,
	   PreOpGleasonSum, PreOpClinStageT, ProcStageT, PathStageT, PathStageN, PathStageM, PathGleasonSum, PathMargin, 
       PLNDPerformed, PLND_Result, TotalNodes, PositiveNodes, PostOpPSA_30Days, LastPSA, PreOpMRI_Performed, PreOpContinence, 
       PostOpContinence, TimeToContinenanceLevel_II, TimeToContinenanceLevel_I, PreOpErectileFunction, PostOpErectileFunction, 
	   TimeToErectileFunctionLevel_III, TimeToErectileFunctionLevel_II, TimeToErectileFunctionLevel_I, PostOpComplication_90days, 
       PostOpComplicationGrade_90days)
SELECT a.PtMRN, a.AgeAtSurgery, a.ProcName, a.ProcSurgeon, a.ProcDate, EncounterBMI.EncBMI AS PreOpBMI, b.OpASA, b.OpEstBloodLoss, b.OpAutoTransfused, LabPrePSA.PreOpPSA,
	   PreOpGleasonSum.PreOpGleasonSum, PreOpClinStages.ClinStageT AS PreOpClinStageT, c.ProcStageT, PathStages.PathStageT, PathStages.PathStageN, PathStages.PathStageM, 
	   PathGleason.PathGGS AS PathGleasonSum, PathGleason.PathMargin AS PathMargin, ISNULL(PLNDProc.PLND_Performed, 'No') AS PLNDPerformed, PLNDPath.PLND_Result, 
       PLNDPath.TotalNodes, PLNDPath.PositiveNodes, LabPostPSA.PostOpPSA AS PostOpPSA_30Days, LabRecentPSA.LastPSA, ISNULL(PreOpMRI.PreOpMRIPerformed, 'Absent') AS PreOpMRI_Performed,   
       PreOpSurveys.PreOpContinence, PostOpSurveys.PostOpContinence, 
	   TimeToContinenanceLevel_II  = CASE WHEN PostOpSurveys.PostOpContinence = '2' THEN DATEDIFF(day, a.ProcDate, PostOpSurveys.PostOpContinenceDate) ELSE NULL END,
	   TimeToContinenanceLevel_I  = CASE WHEN PostOpSurveys.PostOpContinence = '1' THEN DATEDIFF(day, a.ProcDate, PostOpSurveys.PostOpContinenceDate) ELSE NULL END,
	   PreOpSexualSurveys.PreOpErectileFunction, PostOpSexualSurveys.PostOpErectileFunction, 
	   TimeToErectileFunctionLevel_III= CASE WHEN PostOpSexualSurveys.PostOpErectileFunction = '3' THEN DATEDIFF(day, a.ProcDate, PostOpSexualSurveys.PostOpErectileDate) ELSE NULL END,
       TimeToErectileFunctionLevel_II  = CASE WHEN PostOpSexualSurveys.PostOpErectileFunction = '2' THEN DATEDIFF(day, a.ProcDate, PostOpSexualSurveys.PostOpErectileDate) ELSE NULL END,
       TimeToErectileFunctionLevel_I  = CASE WHEN PostOpSexualSurveys.PostOpErectileFunction = '1' THEN DATEDIFF(day, a.ProcDate, PostOpSexualSurveys.PostOpErectileDate) ELSE NULL END,
	   ISNULL(PostOpToxicities.PostOpComplications, 'No') AS PostOpComplication_90days,
	   ISNULL(PostOpToxicitiesGrade.PostOpComplicationsGrade, 'No') AS PostOpComplicationGrade_90days
						 -- ASA, Blood Loss, Transfusion
FROM ProstatectomyTemp a LEFT OUTER JOIN OperatingRoomDetails b ON a.PatientId = b.PatientId AND
																  (a.OperatingRoomDetailId = ISNULL(b.OperatingRoomDetailId, '') OR a.ProcDate = b.OpDate)
						 -- T stage from RP procedure
						 LEFT OUTER JOIN ProstatectomyProc c ON a.ProcedureId = c.ProcedureId
						 -- EncBMI right before surgery
						 LEFT OUTER JOIN (SELECT b.EncDate, b.EncQuality, b.EncBMI AS EncBMI, a.PatientId, a.ProcedureId, a.OperatingRoomDetailId
										  FROM ProstatectomyTemp a INNER JOIN Encounters b ON a.PatientId = b.PatientId
										  WHERE b.EncDate = (SELECT MAX(c.EncDate)
															 FROM Encounters c
															 WHERE c.PatientId = b.PatientId AND c.EncDate < a.ProcDate																 
															) AND b.EncBMI IS NOT NULL AND
												ISNULL(b.EncQuality,'') = CASE WHEN EXISTS (SELECT c.EncQuality
																							FROM Encounters c
																							WHERE c.PatientId = b.PatientId AND c.EncDate = b.EncDate AND c.EncQuality = 'RR') THEN 'RR'
																			   WHEN EXISTS (SELECT c.EncQuality
																						    FROM Encounters c
																						    WHERE c.PatientId = b.PatientId AND c.EncDate = b.EncDate AND c.EncQuality = 'STD') THEN 'STD'
																			   WHEN EXISTS (SELECT c.EncQuality
																						    FROM Encounters c
																						    WHERE c.PatientId = b.PatientId AND c.EncDate = b.EncDate AND c.EncQuality = 'REV') THEN 'REV'
																			   WHEN EXISTS (SELECT c.EncQuality
																						    FROM Encounters c
																						    WHERE c.PatientId = b.PatientId AND c.EncDate = b.EncDate AND c.EncQuality = 'OUT') THEN 'OUT'
																			   ELSE ISNULL(NULL,'')
																		  END
										  GROUP BY b.EncDate, b.EncQuality, b.EncBMI, a.PatientId, a.ProcedureId, a.OperatingRoomDetailId
										  ) AS EncounterBMI ON a.PatientId = EncounterBMI.PatientId AND 
															   a.ProcedureId = EncounterBMI.ProcedureId AND 															   
															   a.OperatingRoomDetailId = EncounterBMI.OperatingRoomDetailId
						-- PreOp PSA value and date immediately before proc date
						LEFT OUTER JOIN (SELECT b.LabDate AS PreOpPSA_Date , b.LabQuality, b.LabResult AS PreOpPSA, a.PatientId, a.ProcedureId, a.OperatingRoomDetailId
										 FROM ProstatectomyTemp a INNER JOIN LabTests b ON a.PatientId = b.PatientId
										 WHERE b.LabDate = (SELECT MAX(c.LabDate)
															FROM LabTests c
															WHERE c.PatientId = b.PatientId AND c.LabTest = 'PSA' AND c.LabDate < a.ProcDate																 
														   ) AND b.LabResult IS NOT NULL AND 
											   ISNULL(b.LabQuality, '') = CASE WHEN EXISTS (SELECT c.LabQuality
																							FROM LabTests c
																							WHERE c.PatientId = b.PatientId AND c.LabTest = 'PSA' AND c.LabDate = b.LabDate AND c.LabQuality = 'RR') THEN 'RR'
																			   WHEN EXISTS (SELECT c.LabQuality
						 																    FROM LabTests c
																						    WHERE c.PatientId = b.PatientId AND c.LabTest = 'PSA' AND c.LabDate = b.LabDate AND c.LabQuality = 'STD') THEN 'STD'
																			   WHEN EXISTS (SELECT c.LabQuality
																						    FROM LabTests c
																						    WHERE c.PatientId = b.PatientId AND c.LabTest = 'PSA' AND c.LabDate = b.LabDate AND c.LabQuality = 'REV') THEN 'REV'
																			   WHEN EXISTS (SELECT c.LabQuality
																						    FROM LabTests c
																						    WHERE c.PatientId = b.PatientId AND c.LabTest = 'PSA' AND c.LabDate = b.LabDate AND c.LabQuality = 'OUT') THEN 'OUT'
																			   ELSE ISNULL(NULL,'')
																		  END AND b.LabTest = 'PSA'
										 GROUP BY b.LabDate, b.LabQuality, b.LabResult, a.PatientId, a.ProcedureId, a.OperatingRoomDetailId
										) AS LabPrePSA ON a.PatientId = LabPrePSA.PatientId AND 
													      a.ProcedureId = LabPrePSA.ProcedureId AND 
														  a.OperatingRoomDetailId = LabPrePSA.OperatingRoomDetailId
						-- PostOp PSA value and date immeditately after proc date + 30 days
						LEFT OUTER JOIN (SELECT b.LabDate AS PostOpPSA_Date, b.LabQuality, b.LabResult AS PostOpPSA, a.PatientId, a.ProcedureId, a.OperatingRoomDetailId
										 FROM ProstatectomyTemp a INNER JOIN LabTests b ON a.PatientId = b.PatientId
										 WHERE b.LabDate = (SELECT MIN(c.LabDate)
															FROM LabTests c
															WHERE c.PatientId = b.PatientId AND c.LabTest = 'PSA' AND DATEDIFF(day, a.ProcDate, c.LabDate) >= 30
														   ) AND b.LabResult IS NOT NULL AND
											   ISNULL(b.LabQuality, '') = CASE WHEN EXISTS (SELECT c.LabQuality
																							FROM LabTests c
																							WHERE c.PatientId = b.PatientId AND c.LabTest = 'PSA' AND c.LabDate = b.LabDate AND c.LabQuality = 'RR') THEN 'RR'
																			   WHEN EXISTS (SELECT c.LabQuality
						 																    FROM LabTests c
																						    WHERE c.PatientId = b.PatientId AND c.LabTest = 'PSA' AND c.LabDate = b.LabDate AND c.LabQuality = 'STD') THEN 'STD'
																			   WHEN EXISTS (SELECT c.LabQuality
																						    FROM LabTests c
																						    WHERE c.PatientId = b.PatientId AND c.LabTest = 'PSA' AND c.LabDate = b.LabDate AND c.LabQuality = 'REV') THEN 'REV'
																			   WHEN EXISTS (SELECT c.LabQuality
																						    FROM LabTests c
																						    WHERE c.PatientId = b.PatientId AND c.LabTest = 'PSA' AND c.LabDate = b.LabDate AND c.LabQuality = 'OUT') THEN 'OUT'
																			   ELSE ISNULL(NULL,'')
																		  END AND b.LabTest = 'PSA'
										 GROUP BY b.LabDate, b.LabQuality, b.LabResult, a.PatientId, a.ProcedureId, a.OperatingRoomDetailId
										) AS LabPostPSA ON a.PatientId = LabPostPSA.PatientId AND 
													       a.ProcedureId = LabPostPSA.ProcedureId AND 
														   a.OperatingRoomDetailId = LabPostPSA.OperatingRoomDetailId
						-- Last PSA: Most recent PSA
						LEFT OUTER JOIN (SELECT b.LabDate AS LastPSA_Date, b.LabQuality, b.LabResult AS LastPSA, a.PatientId, a.ProcedureId, a.OperatingRoomDetailId
										 FROM ProstatectomyTemp a INNER JOIN LabTests b ON a.PatientId = b.PatientId
										 WHERE b.LabDate = (SELECT MAX(c.LabDate)
															FROM LabTests c
															WHERE c.PatientId = b.PatientId AND c.LabTest = 'PSA'																 
														   ) AND b.LabResult IS NOT NULL AND 
											   ISNULL(b.LabQuality,'') = CASE WHEN EXISTS (SELECT c.LabQuality
																			               FROM LabTests c
																			               WHERE c.PatientId = b.PatientId AND c.LabTest = 'PSA' AND c.LabDate = b.LabDate AND c.LabQuality = 'RR') THEN 'RR'
																			  WHEN EXISTS (SELECT c.LabQuality
																 						   FROM LabTests c
																						   WHERE c.PatientId = b.PatientId AND c.LabTest = 'PSA' AND c.LabDate = b.LabDate AND c.LabQuality = 'STD') THEN 'STD'
																			  WHEN EXISTS (SELECT c.LabQuality
																						   FROM LabTests c
																						   WHERE c.PatientId = b.PatientId AND c.LabTest = 'PSA' AND c.LabDate = b.LabDate AND c.LabQuality = 'REV') THEN 'REV'
																			  WHEN EXISTS (SELECT c.LabQuality
																						   FROM LabTests c
																						   WHERE c.PatientId = b.PatientId AND c.LabTest = 'PSA' AND c.LabDate = b.LabDate AND c.LabQuality = 'OUT') THEN 'OUT'
																			  ELSE ISNULL(NULL,'')
																		 END AND b.LabTest = 'PSA'
										 GROUP BY b.LabDate, b.LabQuality, b.LabResult, a.PatientId, a.ProcedureId, a.OperatingRoomDetailId
										) AS LabRecentPSA ON a.PatientId = LabRecentPSA.PatientId AND 
														     a.ProcedureId = LabRecentPSA.ProcedureId AND 
															 a.OperatingRoomDetailId = LabRecentPSA.OperatingRoomDetailId
					     -- PreOpStage: T stage prior to RP Proc Date
						 LEFT OUTER JOIN (SELECT b.ClinStageDate, b.ClinStageQuality, b.ClinStageT AS ClinStageT, a.PatientId, a.ProcedureId, a.OperatingRoomDetailId
										  FROM ProstatectomyTemp a INNER JOIN ClinicalStages b ON a.PatientId = b.PatientId
										  WHERE b.ClinStageDate = (SELECT MAX(c.ClinStageDate)
																   FROM ClinicalStages c
																   WHERE c.PatientId = b.PatientId AND c.ClinStageDate < a.ProcDate AND 
																	    (b.ClinStageDisease LIKE '%prostate%' OR b.ClinStageDisease IS NULL)
															      ) AND b.ClinStageT IS NOT NULL AND
											    ISNULL(b.ClinStageQuality,'') = CASE WHEN EXISTS (SELECT c.ClinStageQuality
																					              FROM ClinicalStages c
																								  WHERE c.PatientId = b.PatientId AND c.ClinStageDate = b.ClinStageDate AND 
																									   (b.ClinStageDisease IN('prostate','Prostate cancer') OR b.ClinStageDisease IS NULL) AND 
																									    c.ClinStageQuality = 'RR') THEN 'RR'
																					 WHEN EXISTS (SELECT c.ClinStageQuality
																		 						  FROM ClinicalStages c
																								  WHERE c.PatientId = b.PatientId AND c.ClinStageDate = b.ClinStageDate AND 
																									   (b.ClinStageDisease IN('prostate','Prostate cancer') OR b.ClinStageDisease IS NULL) AND
																									    c.ClinStageQuality = 'STD') THEN 'STD'
																					 WHEN EXISTS (SELECT c.ClinStageQuality
																								  FROM ClinicalStages c
																								  WHERE c.PatientId = b.PatientId AND c.ClinStageDate = b.ClinStageDate AND 
																									   (b.ClinStageDisease IN('prostate','Prostate cancer') OR b.ClinStageDisease IS NULL) AND 
																									    c.ClinStageQuality = 'REV') THEN 'REV'
																					 ELSE 'OUT'
																				END AND (b.ClinStageDisease IN('prostate','Prostate cancer') OR b.ClinStageDisease IS NULL)
									 GROUP BY b.ClinStageDate, b.ClinStageQuality, b.ClinStageT, a.PatientId, a.ProcedureId, a.OperatingRoomDetailId
									) AS PreOpClinStages ON a.PatientId = PreOpClinStages.PatientId AND 
														 a.ProcedureId = PreOpClinStages.ProcedureId AND 
														 a.OperatingRoomDetailId = PreOpClinStages.OperatingRoomDetailId
						-- PreOpGleasonSum: Dx Biopsy GGS
						LEFT OUTER JOIN (SELECT b.PathDate, b.PathQuality, c.PathGGS AS PreOpGleasonSum, a.PatientId, a.ProcedureId, a.OperatingRoomDetailId
										 FROM ProstatectomyTemp a INNER JOIN Pathology b ON a.PatientId = b.PatientId
									 							  INNER JOIN ProstateBiopsyPath c ON b.PathologyId = c.PathologyId
																  INNER JOIN Procedures d ON b.PatientId = d.PatientId AND b.ProcedureId = d.ProcedureId
										 WHERE d.ProcDate = (SELECT MAX(e.ProcDate)
															 FROM Pathology c INNER JOIN ProstateBiopsyPath d ON c.PathologyId = d.PathologyId
																			  INNER JOIN Procedures e ON c.PatientId = e.PatientId AND c.ProcedureId = e.ProcedureId
															 WHERE e.PatientId = b.PatientId AND e.ProcDate < a.ProcDate) AND
											   b.PathDate = (SELECT MAX(c.PathDate)
															 FROM Pathology c INNER JOIN ProstateBiopsyPath f ON c.PathologyId = f.PathologyId
																			  INNER JOIN Procedures e ON c.PatientId = e.PatientId AND c.ProcedureId = e.ProcedureId
															 WHERE c.PatientId = b.PatientId AND e.ProcDate = d.ProcDate AND c.PathDate < a.ProcDate																 
															) AND c.PathGGS IS NOT NULL AND
											   ISNULL(b.PathQuality, '') = CASE WHEN EXISTS (SELECT c.PathQuality
																							 FROM Pathology c INNER JOIN ProstateBiopsyPath d ON c.PathologyId = d.PathologyId
																							 WHERE c.PatientId = b.PatientId AND c.PathDate = b.PathDate AND c.PathQuality = 'RR') THEN 'RR'
																			    WHEN EXISTS (SELECT c.PathQuality
						 																	 FROM Pathology c INNER JOIN ProstateBiopsyPath d ON c.PathologyId = d.PathologyId
																							 WHERE c.PatientId = b.PatientId AND c.PathDate = b.PathDate AND c.PathQuality = 'STD') THEN 'STD'
																			    WHEN EXISTS (SELECT c.PathQuality
																							 FROM Pathology c INNER JOIN ProstateBiopsyPath d ON c.PathologyId = d.PathologyId
																							 WHERE c.PatientId = b.PatientId AND c.PathDate = b.PathDate AND c.PathQuality = 'REV') THEN 'REV'
																			    WHEN EXISTS (SELECT c.PathQuality
																							 FROM Pathology c INNER JOIN ProstateBiopsyPath d ON c.PathologyId = d.PathologyId
																							 WHERE c.PatientId = b.PatientId AND c.PathDate = b.PathDate AND c.PathQuality = 'OUT') THEN 'OUT'
																			    ELSE ISNULL(NULL,'')
																		   END
									 GROUP BY b.PathDate, b.PathQuality, c.PathGGS, a.PatientId, a.ProcedureId, a.OperatingRoomDetailId
									) AS PreOpGleasonSum ON a.PatientId =PreOpGleasonSum.PatientId AND
															a.ProcedureId =PreOpGleasonSum.ProcedureId AND
														    a.OperatingRoomDetailId = PreOpGleasonSum.OperatingRoomDetailId
						-- PreOp MRI Performed: Present/Absent
						LEFT OUTER JOIN (SELECT 'Present' AS PreOpMRIPerformed, a.PatientId, a.ProcedureId, a.OperatingRoomDetailId
										 FROM ProstatectomyTemp a
										 WHERE EXISTS (SELECT b.DxDate
													   FROM Diagnostics b
													   WHERE b.PatientId = a.PatientId AND b.DxDate < a.ProcDate AND b.DxType LIKE '%MRI%'
													  )										
										) AS PreOpMRI ON a.PatientId = PreOpMRI.PatientId AND 
														 a.ProcedureId = PreOpMRI.ProcedureId AND 
														 a.OperatingRoomDetailId = PreOpMRI.OperatingRoomDetailId 
						-- PreOpContinence
						LEFT OUTER JOIN (SELECT b.SurveyDate AS PreOpContinenceDate, b.SurveyQuality, c.SurveyItemResult AS PreOpContinence, a.PatientId, a.ProcedureId, a.OperatingRoomDetailId
										 FROM ProstatectomyTemp a INNER JOIN Surveys b ON a.PatientId = b.PatientId
																  INNER JOIN SurveyItems c ON b.SurveyId = c.SurveyId AND b.SurveyType = 'Urinary Function' AND c.SurveyItem = 'Continence'
										 WHERE b.SurveyDate = (SELECT MAX(c.SurveyDate)
															   FROM Surveys c INNER JOIN SurveyItems d ON c.SurveyId = d.SurveyId AND c.SurveyType = 'Urinary Function' AND d.SurveyItem = 'Continence'
															   WHERE c.PatientId = b.PatientId AND c.SurveyDate < a.ProcDate																 
														) AND c.SurveyItemResult IS NOT NULL AND
											   ISNULL(b.SurveyQuality, '') = CASE WHEN EXISTS (SELECT c.SurveyQuality
																							   FROM Surveys c INNER JOIN SurveyItems d ON c.SurveyId = d.SurveyId AND c.SurveyType = 'Urinary Function' AND d.SurveyItem = 'Continence'
																							   WHERE c.PatientId = b.PatientId AND c.SurveyDate = b.SurveyDate AND c.SurveyQuality = 'RR') THEN 'RR'
																				  WHEN EXISTS (SELECT c.SurveyQuality
																							   FROM Surveys c INNER JOIN SurveyItems d ON c.SurveyId = d.SurveyId AND c.SurveyType = 'Urinary Function' AND d.SurveyItem = 'Continence'
																							   WHERE c.PatientId = b.PatientId AND c.SurveyDate = b.SurveyDate AND c.SurveyQuality = 'STD') THEN 'STD'
																				  WHEN EXISTS (SELECT c.SurveyQuality
																							   FROM Surveys c INNER JOIN SurveyItems d ON c.SurveyId = d.SurveyId AND c.SurveyType = 'Urinary Function' AND d.SurveyItem = 'Continence'
																							   WHERE c.PatientId = b.PatientId AND c.SurveyDate = b.SurveyDate AND c.SurveyQuality = 'MSK') THEN 'MSK'
																				  WHEN EXISTS (SELECT c.SurveyQuality
																							   FROM Surveys c INNER JOIN SurveyItems d ON c.SurveyId = d.SurveyId AND c.SurveyType = 'Urinary Function' AND d.SurveyItem = 'Continence'
																							   WHERE c.PatientId = b.PatientId AND c.SurveyDate = b.SurveyDate AND c.SurveyQuality = 'REV') THEN 'REV'
																				  WHEN EXISTS (SELECT c.SurveyQuality
																							   FROM Surveys c INNER JOIN SurveyItems d ON c.SurveyId = d.SurveyId AND c.SurveyType = 'Urinary Function' AND d.SurveyItem = 'Continence'
																							   WHERE c.PatientId = b.PatientId AND c.SurveyDate = b.SurveyDate AND c.SurveyQuality = 'OUT') THEN 'OUT'
																				  ELSE ISNULL(NULL,'')
																			 END
											 GROUP BY b.SurveyDate, b.SurveyQuality, c.SurveyItemResult, a.PatientId, a.ProcedureId, a.OperatingRoomDetailId
											) AS PreOpSurveys ON a.PatientId = PreOpSurveys.PatientId AND 
																 a.ProcedureId = PreOpSurveys.ProcedureId AND 
																 a.OperatingRoomDetailId = PreOpSurveys.OperatingRoomDetailId 
						-- PostOpContinence
						LEFT OUTER JOIN (SELECT b.SurveyDate AS PostOpContinenceDate, b.SurveyQuality, c.SurveyItemResult AS PostOpContinence, a.PatientId, a.ProcedureId, a.OperatingRoomDetailId
										 FROM ProstatectomyTemp a INNER JOIN Surveys b ON a.PatientId = b.PatientId
																  INNER JOIN SurveyItems c ON b.SurveyId = c.SurveyId AND b.SurveyType = 'Urinary Function' AND c.SurveyItem = 'Continence'
										 WHERE b.SurveyDate = (SELECT MIN(c.SurveyDate)
															   FROM Surveys c INNER JOIN SurveyItems d ON c.SurveyId = d.SurveyId AND c.SurveyType = 'Urinary Function' AND d.SurveyItem = 'Continence'
															   WHERE c.PatientId = b.PatientId AND c.SurveyDate > a.ProcDate																	 
															  ) AND c.SurveyItemResult IS NOT NULL AND
											   ISNULL(b.SurveyQuality, '') = CASE WHEN EXISTS (SELECT c.SurveyQuality
																							   FROM Surveys c INNER JOIN SurveyItems d ON c.SurveyId = d.SurveyId AND c.SurveyType = 'Urinary Function' AND d.SurveyItem = 'Continence'
																							   WHERE c.PatientId = b.PatientId AND c.SurveyDate = b.SurveyDate AND c.SurveyQuality = 'RR') THEN 'RR'
																				  WHEN EXISTS (SELECT c.SurveyQuality
																							   FROM Surveys c INNER JOIN SurveyItems d ON c.SurveyId = d.SurveyId AND c.SurveyType = 'Urinary Function' AND d.SurveyItem = 'Continence'
																							   WHERE c.PatientId = b.PatientId AND c.SurveyDate = b.SurveyDate AND c.SurveyQuality = 'STD') THEN 'STD'
																				  WHEN EXISTS (SELECT c.SurveyQuality
																							   FROM Surveys c INNER JOIN SurveyItems d ON c.SurveyId = d.SurveyId AND c.SurveyType = 'Urinary Function' AND d.SurveyItem = 'Continence'
																							   WHERE c.PatientId = b.PatientId AND c.SurveyDate = b.SurveyDate AND c.SurveyQuality = 'MSK') THEN 'MSK'
																				  WHEN EXISTS (SELECT c.SurveyQuality
																							   FROM Surveys c INNER JOIN SurveyItems d ON c.SurveyId = d.SurveyId AND c.SurveyType = 'Urinary Function' AND d.SurveyItem = 'Continence'
																							   WHERE c.PatientId = b.PatientId AND c.SurveyDate = b.SurveyDate AND c.SurveyQuality = 'REV') THEN 'REV'
																				  WHEN EXISTS (SELECT c.SurveyQuality
																							   FROM Surveys c INNER JOIN SurveyItems d ON c.SurveyId = d.SurveyId AND c.SurveyType = 'Urinary Function' AND d.SurveyItem = 'Continence'
																							   WHERE c.PatientId = b.PatientId AND c.SurveyDate = b.SurveyDate AND c.SurveyQuality = 'OUT') THEN 'OUT'
																				  ELSE ISNULL(NULL,'')
																			  END
											 GROUP BY b.SurveyDate, b.SurveyQuality, c.SurveyItemResult, a.PatientId, a.ProcedureId, a.OperatingRoomDetailId
											) AS PostOpSurveys ON a.PatientId = PostOpSurveys.PatientId AND 
																  a.ProcedureId = PostOpSurveys.ProcedureId AND 
																  a.OperatingRoomDetailId = PostOpSurveys.OperatingRoomDetailId
						-- PreOpErectileFunction
						LEFT OUTER JOIN (SELECT b.SurveyDate AS PreOpErectileDate, b.SurveyQuality, c.SurveyItemResult AS PreOpErectileFunction, a.PatientId, a.ProcedureId, a.OperatingRoomDetailId
										 FROM ProstatectomyTemp a INNER JOIN Surveys b ON a.PatientId = b.PatientId
																  INNER JOIN SurveyItems c ON b.SurveyId = c.SurveyId AND b.SurveyType = 'Sexual Function' AND c.SurveyItem = 'Erectile Function'
										 WHERE b.SurveyDate = (SELECT MAX(c.SurveyDate)
															   FROM Surveys c INNER JOIN SurveyItems d ON c.SurveyId = d.SurveyId AND c.SurveyType = 'Sexual Function' AND d.SurveyItem = 'Erectile Function'
															   WHERE c.PatientId = b.PatientId AND c.SurveyDate < a.ProcDate																 
														) AND c.SurveyItemResult IS NOT NULL AND
											   ISNULL(b.SurveyQuality, '') = CASE WHEN EXISTS (SELECT c.SurveyQuality
																							   FROM Surveys c INNER JOIN SurveyItems d ON c.SurveyId = d.SurveyId AND c.SurveyType = 'Sexual Function' AND d.SurveyItem = 'Erectile Function'
																							   WHERE c.PatientId = b.PatientId AND c.SurveyDate = b.SurveyDate AND c.SurveyQuality = 'RR') THEN 'RR'
																				  WHEN EXISTS (SELECT c.SurveyQuality
																							   FROM Surveys c INNER JOIN SurveyItems d ON c.SurveyId = d.SurveyId AND c.SurveyType = 'Sexual Function' AND d.SurveyItem = 'Erectile Function'
																							   WHERE c.PatientId = b.PatientId AND c.SurveyDate = b.SurveyDate AND c.SurveyQuality = 'STD') THEN 'STD'
																				  WHEN EXISTS (SELECT c.SurveyQuality
																							   FROM Surveys c INNER JOIN SurveyItems d ON c.SurveyId = d.SurveyId AND c.SurveyType = 'Sexual Function' AND d.SurveyItem = 'Erectile Function'
																							   WHERE c.PatientId = b.PatientId AND c.SurveyDate = b.SurveyDate AND c.SurveyQuality = 'MSK') THEN 'MSK'
																				  WHEN EXISTS (SELECT c.SurveyQuality
																							   FROM Surveys c INNER JOIN SurveyItems d ON c.SurveyId = d.SurveyId AND c.SurveyType = 'Sexual Function' AND d.SurveyItem = 'Erectile Function'
																							   WHERE c.PatientId = b.PatientId AND c.SurveyDate = b.SurveyDate AND c.SurveyQuality = 'REV') THEN 'REV'
																				  WHEN EXISTS (SELECT c.SurveyQuality
																							   FROM Surveys c INNER JOIN SurveyItems d ON c.SurveyId = d.SurveyId AND c.SurveyType = 'Sexual Function' AND d.SurveyItem = 'Erectile Function'
																							   WHERE c.PatientId = b.PatientId AND c.SurveyDate = b.SurveyDate AND c.SurveyQuality = 'OUT') THEN 'OUT'
																				  ELSE ISNULL(NULL,'')
																			  END
											 GROUP BY b.SurveyDate, b.SurveyQuality, c.SurveyItemResult, a.PatientId, a.ProcedureId, a.OperatingRoomDetailId
											) AS PreOpSexualSurveys ON a.PatientId = PreOpSexualSurveys.PatientId AND 
																	   a.ProcedureId = PreOpSexualSurveys.ProcedureId AND 
																       a.OperatingRoomDetailId = PreOpSexualSurveys.OperatingRoomDetailId
						-- PostOpErectileFunction
						LEFT OUTER JOIN (SELECT b.SurveyDate AS PostOpErectileDate, b.SurveyQuality, c.SurveyItemResult AS PostOpErectileFunction, a.PatientId, a.ProcedureId, a.OperatingRoomDetailId
										 FROM ProstatectomyTemp a INNER JOIN Surveys b ON a.PatientId = b.PatientId
																  INNER JOIN SurveyItems c ON b.SurveyId = c.SurveyId AND b.SurveyType = 'Sexual Function' AND c.SurveyItem = 'Erectile Function'
										 WHERE b.SurveyDate = (SELECT MIN(c.SurveyDate)
															   FROM Surveys c INNER JOIN SurveyItems d ON c.SurveyId = d.SurveyId AND c.SurveyType = 'Sexual Function' AND d.SurveyItem = 'Erectile Function'
															   WHERE c.PatientId = b.PatientId AND c.SurveyDate > a.ProcDate																 
														) AND c.SurveyItemResult IS NOT NULL AND
											   ISNULL(b.SurveyQuality, '') = CASE WHEN EXISTS (SELECT c.SurveyQuality
																							   FROM Surveys c INNER JOIN SurveyItems d ON c.SurveyId = d.SurveyId AND c.SurveyType = 'Sexual Function' AND d.SurveyItem = 'Erectile Function'
																							   WHERE c.PatientId = b.PatientId AND c.SurveyDate = b.SurveyDate AND c.SurveyQuality = 'RR') THEN 'RR'
																				  WHEN EXISTS (SELECT c.SurveyQuality
																							   FROM Surveys c INNER JOIN SurveyItems d ON c.SurveyId = d.SurveyId AND c.SurveyType = 'Sexual Function' AND d.SurveyItem = 'Erectile Function'
																							   WHERE c.PatientId = b.PatientId AND c.SurveyDate = b.SurveyDate AND c.SurveyQuality = 'STD') THEN 'STD'
																				  WHEN EXISTS (SELECT c.SurveyQuality
																							   FROM Surveys c INNER JOIN SurveyItems d ON c.SurveyId = d.SurveyId AND c.SurveyType = 'Sexual Function' AND d.SurveyItem = 'Erectile Function'
																							   WHERE c.PatientId = b.PatientId AND c.SurveyDate = b.SurveyDate AND c.SurveyQuality = 'MSK') THEN 'MSK'
																				  WHEN EXISTS (SELECT c.SurveyQuality
																							   FROM Surveys c INNER JOIN SurveyItems d ON c.SurveyId = d.SurveyId AND c.SurveyType = 'Sexual Function' AND d.SurveyItem = 'Erectile Function'
																							   WHERE c.PatientId = b.PatientId AND c.SurveyDate = b.SurveyDate AND c.SurveyQuality = 'REV') THEN 'REV'
																				  WHEN EXISTS (SELECT c.SurveyQuality
																							   FROM Surveys c INNER JOIN SurveyItems d ON c.SurveyId = d.SurveyId AND c.SurveyType = 'Sexual Function' AND d.SurveyItem = 'Erectile Function'
																							   WHERE c.PatientId = b.PatientId AND c.SurveyDate = b.SurveyDate AND c.SurveyQuality = 'OUT') THEN 'OUT'
																				  ELSE ISNULL(NULL,'')
																			  END
											 GROUP BY b.SurveyDate, b.SurveyQuality, c.SurveyItemResult, a.PatientId, a.ProcedureId, a.OperatingRoomDetailId
											) AS PostOpSexualSurveys ON a.PatientId = PostOpSexualSurveys.PatientId AND 
																		a.ProcedureId = PostOpSexualSurveys.ProcedureId AND 
																		a.OperatingRoomDetailId = PostOpSexualSurveys.OperatingRoomDetailId
						-- Complication Present within 90 days (Yes/No)
						LEFT OUTER JOIN (SELECT 'Yes' AS PostOpComplications, a.PatientId, a.ProcedureId, a.OperatingRoomDetailId
										 FROM ProstatectomyTemp a
										 WHERE EXISTS (SELECT b.ToxName
													   FROM Toxicities b 
													   WHERE b.PatientId = a.PatientId AND b.ToxDate > a.ProcDate AND
														     DATEDIFF(day, a.ProcDate, b.ToxDate)<90 AND b.ToxName <> 'None'
													  )
										) AS PostOpToxicities ON a.PatientId = PostOpToxicities.PatientId AND 
																 a.ProcedureId = PostOpToxicities.ProcedureId AND 
																 a.OperatingRoomDetailId = PostOpToxicities.OperatingRoomDetailId
						-- Grade >1 Complication Present within 90 days (Yes/No)
						LEFT OUTER JOIN (SELECT 'Yes' AS PostOpComplicationsGrade, a.PatientId, a.ProcedureId, a.OperatingRoomDetailId
										 FROM ProstatectomyTemp a
										 WHERE EXISTS (SELECT b.ToxName
													   FROM Toxicities b 
													   WHERE b.PatientId = a.PatientId AND b.ToxDate > a.ProcDate AND
															 DATEDIFF(day, a.ProcDate, b.ToxDate)<90 AND b.ToxName <> 'None' AND 
															 b.ToxGrade NOT IN('0','1', 'Unknown', 'None', 'UNK')	
													  )
										) AS PostOpToxicitiesGrade ON a.PatientId = PostOpToxicitiesGrade.PatientId AND 
																	  a.ProcedureId = PostOpToxicitiesGrade.ProcedureId AND 
																	  a.OperatingRoomDetailId = PostOpToxicitiesGrade.OperatingRoomDetailId
						-- Path Stage (TN):
						LEFT OUTER JOIN (SELECT b.PathDate, b.PathQuality, c.PathStageT, c.PathStageM, c.PathStageN, a.PatientId, a.ProcedureId, a.OperatingRoomDetailId
										 FROM ProstatectomyTemp a INNER JOIN Pathology b ON a.PatientId = b.PatientId AND
																						    a.OperatingRoomDetailId = ISNULL(b.OperatingRoomDetailId, '') AND
																							a.ProcedureId = b.ProcedureId
																  INNER JOIN PathologyStageGrade c ON b.PathologyId = c.PathologyId AND c.PathStageDisease = 'Prostate'
										 WHERE ISNULL(b.PathQuality, '') = CASE WHEN EXISTS (SELECT c.PathQuality
																							 FROM Pathology c INNER JOIN PathologyStageGrade d ON c.PathologyId = d.PathologyId AND d.PathStageDisease = 'Prostate'
																							 WHERE c.PatientId = b.PatientId AND ISNULL(c.OperatingRoomDetailId, '') = ISNULL(b.OperatingRoomDetailId, '') AND c.ProcedureId = b.ProcedureId AND c.PathQuality = 'RR') THEN 'RR'
																			    WHEN EXISTS (SELECT c.PathQuality
																							 FROM Pathology c INNER JOIN PathologyStageGrade d ON c.PathologyId = d.PathologyId AND d.PathStageDisease = 'Prostate'
																							 WHERE c.PatientId = b.PatientId AND ISNULL(c.OperatingRoomDetailId, '') = ISNULL(b.OperatingRoomDetailId, '') AND c.ProcedureId = b.ProcedureId AND c.PathQuality = 'STD') THEN 'STD'
																			    WHEN EXISTS (SELECT c.PathQuality
																							 FROM Pathology c INNER JOIN PathologyStageGrade d ON c.PathologyId = d.PathologyId AND d.PathStageDisease = 'Prostate'
																							 WHERE c.PatientId = b.PatientId AND ISNULL(c.OperatingRoomDetailId, '') = ISNULL(b.OperatingRoomDetailId, '') AND c.ProcedureId = b.ProcedureId AND c.PathQuality = 'REV') THEN 'REV'
																			    WHEN EXISTS (SELECT c.PathQuality
																							 FROM Pathology c INNER JOIN PathologyStageGrade d ON c.PathologyId = d.PathologyId AND d.PathStageDisease = 'Prostate'
																							 WHERE c.PatientId = b.PatientId AND ISNULL(c.OperatingRoomDetailId, '') = ISNULL(b.OperatingRoomDetailId, '') AND c.ProcedureId = b.ProcedureId AND c.PathQuality = 'OUT') THEN 'OUT'
																			    ELSE ISNULL(NULL,'')
																			END 
										 GROUP BY b.PathDate, b.PathQuality, c.PathStageT, c.PathStageM, c.PathStageN, a.PatientId, a.ProcedureId, a.OperatingRoomDetailId
																				) AS PathStages ON a.PatientId = PathStages.PatientId AND 
																								   a.ProcedureId = PathStages.ProcedureId AND
																								   a.OperatingRoomDetailId = PathStages.OperatingRoomDetailId
						-- Path Gleason, Path Margin Status: 
						LEFT OUTER JOIN (SELECT b.PathQuality, c.PathGGS AS PathGGS, c.PathMargin AS PathMargin, a.PatientId, a.ProcedureId, a.OperatingRoomDetailId
										 FROM ProstatectomyTemp a INNER JOIN Pathology b ON a.PatientId = b.PatientId AND
																						    a.OperatingRoomDetailId = ISNULL(b.OperatingRoomDetailId, '') AND
																						    a.ProcedureId = b.ProcedureId
																  INNER JOIN ProstatectomyPath c ON b.PathologyId = c.PathologyId 
										 WHERE ISNULL(b.PathQuality, '') = CASE WHEN EXISTS (SELECT c.PathQuality
																							 FROM Pathology c INNER JOIN ProstatectomyPath d ON c.PathologyId = d.PathologyId 
																							 WHERE c.PatientId = b.PatientId AND ISNULL(c.OperatingRoomDetailId, '') = ISNULL(b.OperatingRoomDetailId, '') AND c.ProcedureId = b.ProcedureId AND c.PathQuality = 'RR') THEN 'RR'
																			    WHEN EXISTS (SELECT c.PathQuality
																							 FROM Pathology c INNER JOIN ProstatectomyPath d ON c.PathologyId = d.PathologyId 
																							 WHERE c.PatientId = b.PatientId AND ISNULL(c.OperatingRoomDetailId, '') = ISNULL(b.OperatingRoomDetailId, '') AND c.ProcedureId = b.ProcedureId AND c.PathQuality = 'STD') THEN 'STD'
																			    WHEN EXISTS (SELECT c.PathQuality
																							 FROM Pathology c INNER JOIN ProstatectomyPath d ON c.PathologyId = d.PathologyId 
																							 WHERE c.PatientId = b.PatientId AND ISNULL(c.OperatingRoomDetailId, '') = ISNULL(b.OperatingRoomDetailId, '') AND c.ProcedureId = b.ProcedureId AND c.PathQuality = 'REV') THEN 'REV'
																			    WHEN EXISTS (SELECT c.PathQuality
																							 FROM Pathology c INNER JOIN ProstatectomyPath d ON c.PathologyId = d.PathologyId 
																							 WHERE c.PatientId = b.PatientId AND ISNULL(c.OperatingRoomDetailId, '') = ISNULL(b.OperatingRoomDetailId, '') AND c.ProcedureId = b.ProcedureId AND c.PathQuality = 'OUT') THEN 'OUT'
																			    ELSE ISNULL(NULL,'')
																		    END
										 GROUP BY b.PathQuality, c.PathGGS, c.PathMargin, a.PatientId, a.ProcedureId, a.OperatingRoomDetailId
										) AS PathGleason ON a.PatientId = PathGleason.PatientId AND 
															a.ProcedureId = PathGleason.ProcedureId AND
															a.OperatingRoomDetailId = PathGleason.OperatingRoomDetailId
						-- PLND Performed (Yes/No): 
						LEFT OUTER JOIN (SELECT 'Yes' AS PLND_Performed, a.PatientId, a.ProcedureId, a.OperatingRoomDetailId
										 FROM ProstatectomyTemp a 
										 WHERE EXISTS (SELECT b.ProcName
													   FROM Procedures b 
													   WHERE b.PatientId = a.PatientId AND b.ProcName = 'PLND' AND
														    (ISNULL(b.OperatingRoomDetailId, '') = a.OperatingRoomDetailId OR b.ProcDate = a.ProcDate)												    
													  )
										) AS PLNDProc ON a.PatientId = PLNDProc.PatientId AND 
														 a.ProcedureId = PLNDProc.ProcedureId AND
														 a.OperatingRoomDetailId = PLNDProc.OperatingRoomDetailId
						-- Number of total nodes, Number of positive nodes, Positive Nodes (Yes or No)
						LEFT OUTER JOIN (SELECT c.PathQuality, c.PathResult AS PLND_Result, 
										        SUM(CAST((CASE WHEN ISNUMERIC(d.PathFindNumNodes)<>1 THEN NULL ELSE d.PathFindNumNodes END) AS float)) AS TotalNodes,  
												SUM(CAST((CASE WHEN ISNUMERIC(d.PathFindPosNodes)<>1 THEN NULL ELSE d.PathFindPosNodes END) AS float)) AS PositiveNodes, 
												a.PatientId, a.ProcedureId, a.OperatingRoomDetailId
										 FROM ProstatectomyTemp a INNER JOIN Procedures b ON a.PatientId = b.PatientId AND b.ProcName = 'PLND' AND (a.OperatingRoomDetailId = ISNULL(b.OperatingRoomDetailId, '') OR a.ProcDate = b.ProcDate) 
																  INNER JOIN Pathology c ON b.PatientId = c.PatientId AND b.ProcedureId = c.ProcedureId
																  INNER JOIN NodePathFinding d ON c.PathologyId = d.PathologyId 
										 WHERE ISNULL(c.PathQuality, '') = CASE WHEN EXISTS (SELECT f.PathQuality
																							 FROM Pathology f INNER JOIN NodePathFinding k ON f.PathologyId = k.PathologyId 
																							 WHERE f.PatientId = b.PatientId AND f.ProcedureId = b.ProcedureId AND f.PathQuality = 'RR') THEN 'RR'				   
																				WHEN EXISTS (SELECT f.PathQuality
																							 FROM Pathology f INNER JOIN NodePathFinding k ON f.PathologyId = k.PathologyId  
																							 WHERE f.PatientId = b.PatientId AND f.ProcedureId = b.ProcedureId AND f.PathQuality = 'STD') THEN 'STD'
																			    WHEN EXISTS (SELECT f.PathQuality
																							 FROM Pathology f INNER JOIN NodePathFinding k ON f.PathologyId = k.PathologyId 
																							 WHERE f.PatientId = b.PatientId AND f.ProcedureId = b.ProcedureId AND f.PathQuality = 'REV') THEN 'REV'
																			    WHEN EXISTS (SELECT f.PathQuality
																							 FROM Pathology f INNER JOIN NodePathFinding k ON f.PathologyId = k.PathologyId 
																							 WHERE f.PatientId = b.PatientId AND f.ProcedureId = b.ProcedureId AND f.PathQuality = 'OUT') THEN 'OUT'
																			    ELSE ISNULL(NULL,'')
																		   END
											GROUP BY a.PatientId, a.ProcedureId, a.OperatingRoomDetailId, a.PtMRN, a.AgeAtSurgery, 
													 a.ProcName, a.ProcSurgeon, a.ProcDate, a.ProcInstitution, c.PathQuality, c.PathResult
										) AS PLNDPath ON a.PatientId = PLNDPath.PatientId AND 
														 a.ProcedureId = PLNDPath.ProcedureId AND
														 a.OperatingRoomDetailId = PLNDPath.OperatingRoomDetailId

END
DECLARE @Cnt_Service numeric(10,2)
SET @Cnt_Service = (SELECT COUNT(*) FROM @UrologySurgeryReport_Service);

--Age Range
UPDATE @ComparisonReport
SET Age_Range = (SELECT CAST(MIN(AgeAtSurgery) AS varchar(10)) + ' - ' + CAST(MAX(AgeAtSurgery) AS varchar(10)) AS Age_Range
                 FROM @UrologySurgeryReport_Service)
WHERE Physician <> @Physician

;
-- Median Age
WITH AgeTable AS
(
  SELECT AgeAtSurgery, ROW_NUMBER() OVER(ORDER BY AgeAtSurgery) AS RowNum_AgeAtSurgery
  FROM @UrologySurgeryReport_Service
  WHERE ISNUMERIC(AgeAtSurgery) = 1
)

UPDATE @ComparisonReport
SET Median_Age = (SELECT AVG(CAST(AgeAtSurgery AS float)) AS Median_Age
				  FROM AgeTable
				  WHERE  RowNum_AgeAtSurgery IN(SELECT (MAX(RowNum_AgeAtSurgery) + 1)/2 FROM AgeTable) OR 
						 RowNum_AgeAtSurgery IN(SELECT (MAX(RowNum_AgeAtSurgery) + 2)/2 FROM AgeTable))
WHERE Physician <> @Physician

-- BMI Range
UPDATE @ComparisonReport
SET BMI_Range = (SELECT CAST(MIN(CAST(PreOpBMI AS float)) AS varchar(10)) + ' - ' + CAST(MAX(CAST(PreOpBMI AS float)) AS varchar(10)) AS BMI_Range
				 FROM @UrologySurgeryReport_Service
				 WHERE ISNUMERIC(PreOpBMI) = 1)
WHERE Physician <> @Physician
;
-- BMI Median
WITH BMITable AS
(
  SELECT PreOpBMI, ROW_NUMBER() OVER(ORDER BY CAST(PreOpBMI AS float)) AS RowNum_BMI
  FROM @UrologySurgeryReport_Service
  WHERE ISNUMERIC(PreOpBMI) = 1
)

UPDATE @ComparisonReport
SET Median_BMI = (SELECT AVG(CAST(PreOpBMI AS float)) AS Median_BMI
				  FROM BMITable
				  WHERE  RowNum_BMI IN(SELECT (MAX(RowNum_BMI) + 1)/2 FROM BMITable) OR 
					     RowNum_BMI IN(SELECT (MAX(RowNum_BMI) + 2)/2 FROM BMITable))
WHERE Physician <> @Physician

-- PSA Range
UPDATE @ComparisonReport
SET PSA_Range = (SELECT CAST(MIN(CAST(PreOpPSA AS float)) AS varchar(10)) + ' - ' + CAST(MAX(CAST(PreOpPSA AS float)) AS varchar(10)) AS PSA_Range
				 FROM @UrologySurgeryReport_Service
				 WHERE ISNUMERIC(PreOpPSA) = 1)
WHERE Physician <> @Physician
;
-- PSA Median
WITH PSATable AS
(
  SELECT PreOpPSA, ROW_NUMBER() OVER(ORDER BY CAST(PreOpPSA AS float)) AS RowNum_PSA
  FROM @UrologySurgeryReport_Service
  WHERE ISNUMERIC(PreOpPSA) = 1
)

UPDATE @ComparisonReport
SET Median_PSA = (SELECT AVG(CAST(PreOpPSA AS float)) AS Median_PSA
				  FROM PSATable
				  WHERE  RowNum_PSA IN(SELECT (MAX(RowNum_PSA) + 1)/2 FROM PSATable) OR 
					     RowNum_PSA IN(SELECT (MAX(RowNum_PSA) + 2)/2 FROM PSATable))
WHERE Physician <> @Physician

-- EBL Range
UPDATE @ComparisonReport
SET EBL_Range = (SELECT CAST(MIN(CAST(OpEstBloodLoss AS float)) AS varchar(10)) + ' - ' + CAST(MAX(CAST(OpEstBloodLoss AS float)) AS varchar(10)) AS EBL_Range
				 FROM @UrologySurgeryReport_Service
				 WHERE ISNUMERIC(OpEstBloodLoss) = 1)
WHERE Physician <> @Physician

;
-- EBL Median
WITH EBLTable AS
(
  SELECT OpEstBloodLoss, ROW_NUMBER() OVER(ORDER BY CAST(OpEstBloodLoss AS float)) AS RowNum_EBL
  FROM @UrologySurgeryReport_Service
  WHERE ISNUMERIC(OpEstBloodLoss) = 1
)

UPDATE @ComparisonReport
SET Median_EBL = (SELECT AVG(CAST(OpEstBloodLoss AS float)) AS Median_EBL
				  FROM EBLTable
				  WHERE  RowNum_EBL IN(SELECT (MAX(RowNum_EBL) + 1)/2 FROM EBLTable) OR 
					     RowNum_EBL IN(SELECT (MAX(RowNum_EBL) + 2)/2 FROM EBLTable))
WHERE Physician <> @Physician

-- Range Number of Nodes removed
UPDATE @ComparisonReport
SET TotalNodes_Range = (SELECT CAST(MIN(CAST(TotalNodes AS float)) AS varchar(10)) + ' - ' + CAST(MAX(CAST(TotalNodes AS float)) AS varchar(10)) AS TotalNodes_Range
						FROM @UrologySurgeryReport_Service
						WHERE ISNUMERIC(TotalNodes) = 1)
WHERE Physician <> @Physician
;
-- Number of Nodes removed Median
WITH TotalNodesTable AS
(
  SELECT TotalNodes, ROW_NUMBER() OVER(ORDER BY CAST(TotalNodes AS float)) AS RowNum_TotalNodes
  FROM @UrologySurgeryReport_Service
  WHERE ISNUMERIC(TotalNodes) = 1
)

UPDATE @ComparisonReport
SET Median_TotalNodes = (SELECT AVG(CAST(TotalNodes AS float)) AS Median_TotalNodes
						 FROM TotalNodesTable
						 WHERE  RowNum_TotalNodes IN(SELECT (MAX(RowNum_TotalNodes) + 1)/2 FROM TotalNodesTable) OR 
							    RowNum_TotalNodes IN(SELECT (MAX(RowNum_TotalNodes) + 2)/2 FROM TotalNodesTable))
WHERE Physician <> @Physician
;
-- Median TimeToContinenanceLevel_II
WITH TimeToContinenanceLevel_IITable AS
(
  SELECT TimeToContinenanceLevel_II, ROW_NUMBER() OVER(ORDER BY TimeToContinenanceLevel_II) AS RowNum_TimeToContinenanceLevel_II
  FROM @UrologySurgeryReport_Service
  WHERE ISNUMERIC(TimeToContinenanceLevel_II) = 1
)

UPDATE @ComparisonReport
SET Median_TimeToContinenanceLevel_II = (SELECT AVG(CAST(TimeToContinenanceLevel_II AS float)) AS Median_TimeToContinenanceLevel_II
										 FROM TimeToContinenanceLevel_IITable
										 WHERE  RowNum_TimeToContinenanceLevel_II IN(SELECT (MAX(RowNum_TimeToContinenanceLevel_II) + 1)/2 FROM TimeToContinenanceLevel_IITable) OR 
											    RowNum_TimeToContinenanceLevel_II IN(SELECT (MAX(RowNum_TimeToContinenanceLevel_II) + 2)/2 FROM TimeToContinenanceLevel_IITable))
WHERE Physician <> @Physician
;
-- Median TimeToContinenanceLevel_I
WITH TimeToContinenanceLevel_ITable AS
(
  SELECT TimeToContinenanceLevel_I, ROW_NUMBER() OVER(ORDER BY TimeToContinenanceLevel_I) AS RowNum_TimeToContinenanceLevel_I
  FROM @UrologySurgeryReport_Service
  WHERE ISNUMERIC(TimeToContinenanceLevel_I) = 1
)

UPDATE @ComparisonReport
SET Median_TimeToContinenanceLevel_I = (SELECT AVG(CAST(TimeToContinenanceLevel_I AS float)) AS Median_TimeToContinenanceLevel_I
										FROM TimeToContinenanceLevel_ITable
										WHERE  RowNum_TimeToContinenanceLevel_I IN(SELECT (MAX(RowNum_TimeToContinenanceLevel_I) + 1)/2 FROM TimeToContinenanceLevel_ITable) OR 
											   RowNum_TimeToContinenanceLevel_I IN(SELECT (MAX(RowNum_TimeToContinenanceLevel_I) + 2)/2 FROM TimeToContinenanceLevel_ITable))
WHERE Physician <> @Physician
;
-- Median TimeToErectileFunctionLevel_III
WITH TimeToErectileFunctionLevel_IIITable AS
(
  SELECT TimeToErectileFunctionLevel_III, ROW_NUMBER() OVER(ORDER BY TimeToErectileFunctionLevel_III) AS RowNum_TimeToErectileFunctionLevel_III
  FROM @UrologySurgeryReport_Service
  WHERE ISNUMERIC(TimeToErectileFunctionLevel_III) = 1 
)

UPDATE @ComparisonReport
SET Median_TimeToErectileFunctionLevel_III = (SELECT AVG(CAST(TimeToErectileFunctionLevel_III AS float)) AS Median_TimeToErectileFunctionLevel_III
											  FROM TimeToErectileFunctionLevel_IIITable
											  WHERE  RowNum_TimeToErectileFunctionLevel_III IN(SELECT (MAX(RowNum_TimeToErectileFunctionLevel_III) + 1)/2 FROM TimeToErectileFunctionLevel_IIITable) OR 
												     RowNum_TimeToErectileFunctionLevel_III IN(SELECT (MAX(RowNum_TimeToErectileFunctionLevel_III) + 2)/2 FROM TimeToErectileFunctionLevel_IIITable))
WHERE Physician <> @Physician
;
-- Median TimeToErectileFunctionLevel_II
WITH TimeToErectileFunctionLevel_IITable AS
(
  SELECT TimeToErectileFunctionLevel_II, ROW_NUMBER() OVER(ORDER BY TimeToErectileFunctionLevel_II) AS RowNum_TimeToErectileFunctionLevel_II
  FROM @UrologySurgeryReport_Service
  WHERE ISNUMERIC(TimeToErectileFunctionLevel_II) = 1  
)

UPDATE @ComparisonReport
SET Median_TimeToErectileFunctionLevel_II = (SELECT AVG(CAST(TimeToErectileFunctionLevel_II AS float)) AS Median_TimeToErectileFunctionLevel_II
											 FROM TimeToErectileFunctionLevel_IITable
											 WHERE  RowNum_TimeToErectileFunctionLevel_II IN(SELECT (MAX(RowNum_TimeToErectileFunctionLevel_II) + 1)/2 FROM TimeToErectileFunctionLevel_IITable) OR 
												    RowNum_TimeToErectileFunctionLevel_II IN(SELECT (MAX(RowNum_TimeToErectileFunctionLevel_II) + 2)/2 FROM TimeToErectileFunctionLevel_IITable))
WHERE Physician <> @Physician
;
-- Median TimeToErectileFunctionLevel_I
WITH TimeToErectileFunctionLevel_ITable AS
(
  SELECT TimeToErectileFunctionLevel_I, ROW_NUMBER() OVER(ORDER BY TimeToErectileFunctionLevel_I) AS RowNum_TimeToErectileFunctionLevel_I
  FROM @UrologySurgeryReport_Service
  WHERE ISNUMERIC(TimeToErectileFunctionLevel_I) = 1 
)

UPDATE @ComparisonReport
SET Median_TimeToErectileFunctionLevel_I = (SELECT AVG(CAST(TimeToErectileFunctionLevel_I AS float)) AS Median_TimeToErectileFunctionLevel_I
											FROM TimeToErectileFunctionLevel_ITable
											WHERE  RowNum_TimeToErectileFunctionLevel_I IN(SELECT (MAX(RowNum_TimeToErectileFunctionLevel_I) + 1)/2 FROM TimeToErectileFunctionLevel_ITable) OR 
												   RowNum_TimeToErectileFunctionLevel_I IN(SELECT (MAX(RowNum_TimeToErectileFunctionLevel_I) + 2)/2 FROM TimeToErectileFunctionLevel_ITable))
WHERE Physician <> @Physician

-- Percentage of Patietns with OpAutoTransfused


UPDATE @ComparisonReport
SET PercentOf_PatientsTransfused = (SELECT CAST((COUNT(*)/NULLIF(@Cnt_Service, 0)) * 100 AS numeric(10,2)) AS PercentOf_PatientsTransfused
									FROM @UrologySurgeryReport_Service
									WHERE OpAutoTransfused IS NOT NULL)
WHERE Physician <> @Physician

-- Percentage of Patients with pT2
UPDATE @ComparisonReport
SET PercentOf_PatientsPathT2 = (SELECT CAST((COUNT(*)/NULLIF(@Cnt_Service, 0)) * 100 AS numeric(10,2)) AS PercentOf_PatientsPathT2
								FROM @UrologySurgeryReport_Service
								WHERE PathStageT LIKE '%T2%')
WHERE Physician <> @Physician

-- Percentage of Patients with pT3
UPDATE @ComparisonReport
SET PercentOf_PatientsPathT3 = (SELECT CAST((COUNT(*)/NULLIF(@Cnt_Service, 0)) * 100 AS numeric(10,2)) AS PercentOf_PatientsPathT3
								FROM @UrologySurgeryReport_Service
								WHERE PathStageT LIKE '%T3%')
WHERE Physician <> @Physician

-- Percentage of Patients with positive nodes
UPDATE @ComparisonReport
SET PercentOf_PatientsWithPositiveNodes = (SELECT CAST((COUNT(*)/NULLIF(@Cnt_Service, 0)) * 100 AS numeric(10,2)) AS PercentOf_PatientsWithPositiveNodes
										   FROM @UrologySurgeryReport_Service
										   WHERE ISNUMERIC(PositiveNodes) = 1 AND PositiveNodes <> '0')
WHERE Physician <> @Physician

-- Percentage Positive margin with pT2
UPDATE @ComparisonReport
SET PercentOf_PatientsWithPositiveMarginT2 = (SELECT CAST((COUNT(*)/NULLIF(@Cnt_Service, 0)) * 100 AS numeric(10,2)) AS PercentOf_PatientsWithPositiveMarginT2
											  FROM @UrologySurgeryReport_Service
											  WHERE PathMargin LIKE '%positive%' AND PathStageT LIKE '%T2%')
WHERE Physician <> @Physician

-- Percentage Positive margin with pT3
UPDATE @ComparisonReport
SET PercentOf_PatientsWithPositiveMarginT3 = (SELECT CAST((COUNT(*)/NULLIF(@Cnt_Service, 0)) * 100 AS numeric(10,2)) AS PercentOf_PatientsWithPositiveMarginT3
											  FROM @UrologySurgeryReport_Service
											  WHERE PathMargin LIKE '%positive%' AND PathStageT LIKE '%T3%')
WHERE Physician <> @Physician

-- Percentage of Patients with positive margin overall
UPDATE @ComparisonReport
SET PercentOf_PatientsWithPositiveMarginOverall = (SELECT CAST((COUNT(*)/NULLIF(@Cnt_Service, 0)) * 100 AS numeric(10,2)) AS PercentOf_PatientsWithPositiveMarginOverall
												   FROM @UrologySurgeryReport_Service
												   WHERE PathMargin LIKE '%positive%')
WHERE Physician <> @Physician

-- Percentage of Patients with non-zero PSA after 30 within surgery
UPDATE @ComparisonReport
SET PercentOf_PatientsWithRecurrences = (SELECT CAST((COUNT(*)/NULLIF(@Cnt_Service, 0)) * 100 AS numeric(10,2)) AS PercentOf_PatientsWithRecurrences
										 FROM @UrologySurgeryReport_Service
										 WHERE ISNUMERIC(PostOpPSA_30Days)= 1 AND CAST(PostOpPSA_30Days AS float) > 0)
WHERE Physician <> @Physician

-- Percent Complications Grade> 1 within 90 days
UPDATE @ComparisonReport
SET PercentOf_PatientsWithComplicationGrade = (SELECT CAST((COUNT(*)/NULLIF(@Cnt_Service, 0)) * 100 AS numeric(10,2)) AS PercentOf_PatientsWithComplicationGrade
											   FROM @UrologySurgeryReport_Service
											   WHERE PostOpComplication_90days = 'Yes' AND PostOpComplicationGrade_90days = 'Yes')
WHERE Physician <> @Physician

-- Percent of patients with cT1
UPDATE @ComparisonReport
SET PercentOf_PatientsWithClinStageT1 = (SELECT CAST((COUNT(*)/NULLIF(@Cnt_Service, 0)) * 100 AS numeric(10,2)) AS PercentOf_PatientsWithClinStageT1
										 FROM @UrologySurgeryReport_Service
										 WHERE PreOpClinStageT LIKE '%T1%')
WHERE Physician <> @Physician

-- Percent of patients with cT1
UPDATE @ComparisonReport
SET PercentOf_PatientsWithClinStageT2 = (SELECT CAST((COUNT(*)/NULLIF(@Cnt_Service, 0)) * 100 AS numeric(10,2)) AS PercentOf_PatientsWithClinStageT2
										 FROM @UrologySurgeryReport_Service
										 WHERE PreOpClinStageT LIKE '%T2%')
WHERE Physician <> @Physician

-- Percent of patients with cT1
UPDATE @ComparisonReport
SET PercentOf_PatientsWithClinStageT3 = (SELECT CAST((COUNT(*)/NULLIF(@Cnt_Service, 0)) * 100 AS numeric(10,2)) AS PercentOf_PatientsWithClinStageT3
										 FROM @UrologySurgeryReport_Service
										 WHERE PreOpClinStageT LIKE '%T3%')
WHERE Physician <> @Physician

-- Prostatectomies by Service
UPDATE @ComparisonReport
SET Cnt = (SELECT COUNT(*) FROM @UrologySurgeryReport_Service)
WHERE Physician <> @Physician

-- All Prostatectomies by Service
IF @ProcedureType = 'All Prostatectomies'
BEGIN
UPDATE @ComparisonReport
SET All_Cnt = ( SELECT COUNT(*)
							FROM Patients a INNER JOIN Procedures b ON a.PatientId = b.PatientId
											INNER JOIN PatientInstitutions c ON a.PatientId = c.PatientId					
							WHERE b.ProcName IN(@Prostatectomy_1, @Prostatectomy_2, @Prostatectomy_3, @Prostatectomy_5, @Prostatectomy_6, @Prostatectomy_7, @Prostatectomy_9) AND
								 (b.ProcInstitution IN(@InstitutionName_1, @InstitutionName_2, @InstitutionName_3, @InstitutionName_4, @InstitutionName_5) OR b.ProcQuality = @ProcQuality) AND
								  c.InstitutionId = @InstitutionId AND a.PtMRN <> 'TEST0000' AND ISNULL(b.ProcSurgeon, '') NOT LIKE @PhysicianName)
WHERE Physician <> @Physician
END
ELSE
BEGIN
UPDATE @ComparisonReport
SET All_Cnt = ( SELECT COUNT(*)
							FROM Patients a INNER JOIN Procedures b ON a.PatientId = b.PatientId
											INNER JOIN PatientInstitutions c ON a.PatientId = c.PatientId					
							WHERE b.ProcName IN( 
									CASE 
										 WHEN @ProcedureType = 'RP' THEN @Prostatectomy_1
										 WHEN @ProcedureType = 'LP' THEN @Prostatectomy_2
										 WHEN @ProcedureType = 'RALP' THEN @Prostatectomy_3
										 WHEN @ProcedureType = 'SalvRP' THEN @Prostatectomy_6
										 WHEN @ProcedureType = 'SalvLP' THEN @Prostatectomy_7
										 
									END) AND
								 (b.ProcInstitution IN(@InstitutionName_1, @InstitutionName_2, @InstitutionName_3, @InstitutionName_4, @InstitutionName_5) OR b.ProcQuality = @ProcQuality) AND
								  c.InstitutionId = @InstitutionId AND a.PtMRN <> 'TEST0000' AND ISNULL(b.ProcSurgeon, '') NOT LIKE @PhysicianName)
WHERE Physician <> @Physician
END


SELECT Physician, @ProcedureType AS Proc_Type, Cnt AS Proc_Count,
       Median_Age, Age_Range, Median_BMI, BMI_Range, PSA_Range, Median_PSA, PercentOf_PatientsWithClinStageT1 AS Percent_PtsWithcT1,
       PercentOf_PatientsWithClinStageT2 AS Percent_PtsWithcT2, PercentOf_PatientsWithClinStageT3 AS Percent_PtsWithcT3,
	   Median_EBL, EBL_Range, PercentOf_PatientsTransfused AS Percent_PtsTransfused, PercentOf_PatientsPathT2 AS Percent_PtsWithpT2,
	   PercentOf_PatientsPathT3 AS Percent_PtsWithpT3, PercentOf_PatientsWithPositiveNodes AS Percent_PtsWithPositiveNodes,
	   PercentOf_PatientsWithPositiveMarginT2 AS Percent_PtsWithPosMarginpT2, PercentOf_PatientsWithPositiveMarginT3 AS Percent_PtsWithPosMarginpT3, 
	   PercentOf_PatientsWithPositiveMarginOverall AS Percent_PtsWithPosMarginpOverall, Median_TotalNodes, TotalNodes_Range,
	   PercentOf_PatientsWithRecurrences AS Percent_PtsWithRecurrences, Median_TimeToContinenanceLevel_II, Median_TimeToContinenanceLevel_I,
	   Median_TimeToErectileFunctionLevel_III, Median_TimeToErectileFunctionLevel_II, Median_TimeToErectileFunctionLevel_I, 
	   PercentOf_PatientsWithComplicationGrade AS Percent_PtsWithCompGrade, All_Cnt AS Count_AllProstatectomies
FROM @ComparisonReport
";
            // Create new command
            SqlCommand com = DataAccessHelper.CreateWarehouseSqlCommand(sql);

            // Add User Specifed Params
            DataAccessHelper.AddStringInputParam(com, "Physician", physicianName);
            DataAccessHelper.AddDateTimeInputParam(com, "FromDate", fromDate);
            DataAccessHelper.AddDateTimeInputParam(com, "ToDate", toDate);
            DataAccessHelper.AddStringInputParam(com, "ProcedureType", procedureType);

            return DataAccessHelper.GetList(com).Tables[0].DefaultView;
        }

        public DataSet GetDistinctSurgeons()
        {
            SqlCommand com = DataAccessHelper.CreateCommand("spGetDistinctCaseSurgeons");
            return DataAccessHelper.GetList(com);
        }

        /// <summary>
        /// Get all data for Nursing report
        /// </summary>
        /// <returns></returns>
        public DataTable GetNursingReport(string physicianName, DateTime fromDate, DateTime toDate)
        {
            DataTable dt = new DataTable();
            string sql = "SELECT DISTINCT(CONVERT(VARCHAR,ApptClinicDate,101)) AS Date, ApptTime AS ApptTime, ApptPatientId, ApptMRN, ApptLastName, ApptFirstName, " +
                            "ApptVisitType, ApptPhysician " +
                            "FROM Appointments " +
                            "WHERE ApptPhysician= '" + physicianName + "' AND ApptClinicDate BETWEEN '" + fromDate + "' AND '" + toDate + "'" +
                            "ORDER BY ApptTime, Date, ApptLastName ASC, ApptFirstName ASC";

            DataAccessHelper.ExecuteSqlSelect(sql.ToString(), dt);
            return dt;
        }

        public DataTable GetProblems(string PtId, string physicianName)
        {
            DataTable dt=new DataTable();
            string sql = "WITH Plans(PatientProblemId) AS "+
                            "( "+
                              "SELECT DISTINCT PatientProblemId FROM ProblemPlans WHERE EncounterId in (SELECT Top 1 EncounterId FROM Encounters " +
                              "WHERE PatientId=" + PtId + " AND EncPhysician='" + physicianName + "' ORDER BY EncounterId DESC) " +
                            ") "+
                            "SELECT CONVERT(VARCHAR,pr.EnteredTime,101) AS EnteredDate, pl.PatientProblemId, pr.ProblemName "+
                            "FROM Plans pl " +
                            "LEFT OUTER JOIN PatientProblems pr ON pr.PatientProblemId=pl.PatientProblemId "+
                            "WHERE pr.PatientId=" + PtId + " ORDER BY PatientproblemId;";

            DataAccessHelper.ExecuteSqlSelect(sql.ToString(), dt);
            return dt;
        }

        public DataTable GetPlans(int probId)
        {
            DataTable dt = new DataTable();
            string sql = "SELECT PlanName FROM ProblemPlans WHERE PatientProblemId=" + probId + "";

            DataAccessHelper.ExecuteSqlSelect(sql.ToString(), dt);
            return dt;
        }

        /// <summary>
        /// Get all records with missing OR for neuro specimen patients
        /// </summary>
        /// <returns></returns>
        public DataTable GetNeuroSpecimenMissingOR(string datasetSql)
        {
            DataTable dt = new DataTable();
            string sql = "WITH samples(PatientId, AccessionDate, SpecimenType, SpecimenSubType) AS  ";
	        sql += "( ";
            sql += "SELECT DISTINCT c.PatientID,c.AccessionDate,d.SpecimenType, d.SpecimenSubType ";
                sql += "FROM Patients a INNER JOIN SpecimenAccessions c ON a.PatientId = c.PatientId ";
		        sql += "INNER JOIN Specimens d ON c.SpecimenAccessionId = d.SpecimenAccessionId  ";
		        sql += "WHERE c.AccessionDepartment='neurosurgery' ";
                sql += ") ";
            sql += "SELECT DISTINCT pt.PatientId, pt.PtMRN, pt.PtLastName, pt.PtFirstName, sa.AccessionDate, ";
            sql += "CASE WHEN s.SpecimenReferenceNumber LIKE 'SP%' THEN 'Spine' ELSE 'Brain' END Disease ";
            sql += ",ISNULL(LTRIM(STUFF((SELECT DISTINCT '; ' + x.SpecimenType+'- '+x.SpecimenSubType FROM samples x WHERE x.PatientID=pt.PatientID  ";
            sql += "AND x.AccessionDate=sa.AccessionDate FOR XML PATH(''), TYPE).value('.', 'nvarchar(max)'), 1, 1, '')),'N/A')Specimens ";
            sql += "FROM SpecimenAccessions sa INNER JOIN Specimens s ON s.SpecimenAccessionId=sa.SpecimenAccessionId ";
            sql += "INNER JOIN Patients pt ON sa.PatientId = pt.PatientId ";
            sql += "INNER JOIN (" + datasetSql + ") AS ds ON sa.PatientId= ds.PatientId ";
            sql += "LEFT OUTER JOIN OperatingRoomDetails op ON sa.PatientId = op.PatientId ";
            sql += "AND (sa.AccessionDate = op.OpDate OR sa.DateBanked = op.OpDate) AND op.OpService IN ('Neurosurgery','Neurology') ";
            sql += "WHERE op.PatientId IS NULL AND pt.PtMRN<>'TEST0000' AND sa.AccessionDepartment = 'Neurosurgery' ";
            sql += "ORDER BY sa.AccessionDate, pt.PtMRN ";

            DataAccessHelper.ExecuteSqlSelect(sql.ToString(), dt);
            return dt;
        }

        /// <summary>
        /// Get all records with missing Pathology for neuro specimen patients, having OR record
        /// </summary>
        /// <returns></returns>
        public DataTable GetNeuroSpecimenMissingPathology(string datasetSql)
        {
            DataTable dt = new DataTable();
            string sql = "WITH samples(PatientId, AccessionDate, SpecimenType, SpecimenSubType) AS  ";
            sql += "( ";
            sql += "SELECT DISTINCT c.PatientID,c.AccessionDate,d.SpecimenType, d.SpecimenSubType ";
            sql += "FROM Patients a INNER JOIN SpecimenAccessions c ON a.PatientId = c.PatientId ";
            sql += "INNER JOIN Specimens d ON c.SpecimenAccessionId = d.SpecimenAccessionId  ";
            sql += "WHERE c.AccessionDepartment='neurosurgery' ";
            sql += ") ";
            sql += "SELECT DISTINCT pt.PatientId, pt.PtMRN, pt.PtLastName, pt.PtFirstName, op.OpDate, pa.PathDate, ";
            sql += "CASE WHEN s.SpecimenReferenceNumber LIKE 'SP%' THEN 'Spine' ELSE 'Brain' END Disease ";
            sql += ",ISNULL(LTRIM(STUFF((SELECT DISTINCT '; ' + x.SpecimenType+'- '+x.SpecimenSubType FROM samples x WHERE x.PatientID=pt.PatientID  ";
            sql += "AND x.AccessionDate=sa.AccessionDate FOR XML PATH(''), TYPE).value('.', 'nvarchar(max)'), 1, 1, '')),'N/A')Specimens ";
            sql += "FROM SpecimenAccessions sa INNER JOIN Specimens s ON s.SpecimenAccessionId=sa.SpecimenAccessionId ";
            sql += "INNER JOIN Patients pt ON sa.PatientId = pt.PatientId ";
            sql += "INNER JOIN (" + datasetSql + ") AS ds ON sa.PatientId= ds.PatientId ";
            sql += "INNER JOIN (SELECT a.patientid, max(a.OperatingRoomDetailId) as OpId,a.opdate ";
            sql += "FROM OperatingRoomDetails a ";
			sql += "INNER JOIN SpecimenAccessions b ON a.PatientId=b.PatientId ";
            sql += "WHERE (b.AccessionDate = a.OpDate OR b.DateBanked = a.OpDate) AND a.OpService IN ('Neurosurgery','Neurology') ";
            sql += "AND a.PatientId=b.PatientId ";
            sql += "GROUP BY a.patientid,a.opdate)op ON op.PatientId=sa.PatientId ";
            sql += "INNER JOIN OperatingRoomDetails x ON x.OperatingRoomDetailId = op.OpId ";
            sql += "AND (sa.AccessionDate = x.OpDate OR sa.DateBanked = x.OpDate) AND x.OpService IN ('Neurosurgery','Neurology') ";
            sql += "LEFT OUTER JOIN Pathology pa ON sa.PatientId = pa.PatientId AND x.OperatingRoomDetailId = pa.OperatingRoomDetailId  ";
            sql += "WHERE (pa.OperatingRoomDetailId IS NULL OR pa.PathSpecimenType is NULL) ";
            sql += "AND pt.PtMRN<>'TEST0000' ORDER BY pa.PathDate, op.OpDate, pt.PtMRN ";

            DataAccessHelper.ExecuteSqlSelect(sql.ToString(), dt);
            return dt;
        }

        
        /// <summary>
        /// Get all records with missing Cytogenetic report for neuro specimen patients, having Pathology record
        /// Cytogenetics are present for different types of Glioblastoma and Astrocytoma
        /// Not all of the above histology types should have Cytogentic reports, hence marked in Notes
        /// </summary>
        /// <returns></returns>
        public DataTable GetNeuroSpecimenMissingCyto(string datasetSql)
        {
            DataTable dt = new DataTable();
            string sql = "SELECT DISTINCT pt.PatientId, pt.PtMRN, pt.PtLastName, pt.PtFirstName, pa.PathDate, pa.PathHistology ";
            sql += "FROM SpecimenAccessions sa INNER JOIN Patients pt ON sa.PatientId = pt.PatientId ";
            sql += "INNER JOIN (" + datasetSql + ") AS ds ON sa.PatientId= ds.PatientId ";
            sql += "INNER JOIN OperatingRoomDetails op ON sa.PatientId = op.PatientId AND ";
            sql += "(sa.AccessionDate = op.OpDate OR sa.DateBanked = op.OpDate) AND op.OpService = 'Neurosurgery' ";
            sql += "INNER JOIN Pathology pa ON op.OperatingRoomDetailId = pa.OperatingRoomDetailId AND op.PatientId=pa.PatientId ";
            sql += "LEFT OUTER JOIN Pathology p ON sa.PatientId = p.PatientId AND ";
            sql += "pa.OperatingRoomDetailId = p.OperatingRoomDetailId AND p.PathSpecimenType LIKE '%tumor%' ";
            sql += "AND p.PathHistology LIKE '%cytogenetic%' ";
            sql += "WHERE((pa.PathHistology LIKE '%glio%' OR pa.PathHistology LIKE '%astrocytoma%') ";
            sql += "AND (pa.PathNotes NOT LIKE '%Cytogenetic Report:N/A%' OR pa.PathNotes is null)) AND (pa.pathquality != 'OUT') ";
            sql += "AND p.OperatingRoomDetailId IS NULL AND pt.PtMRN<>'TEST0000' ORDER BY pt.PtMRN, pa.PathDate, pa.PathHistology ";

            DataAccessHelper.ExecuteSqlSelect(sql.ToString(), dt);
            return dt;
        }

        /// <summary>
        /// Get all pending records for neuro patients (Brain,Spine,Pituitary Adenoma pts)
        /// </summary>
        /// <returns></returns>
        public DataTable GetNeuroPendingItems(string datasetSql)
        {
            DataTable dt = new DataTable();

            #region sql
            string sql = string.Format(@"DECLARE @ItemsTable TABLE
              (
              PatientId           int NOT NULL,
              ItemCount           int NOT NULL,
              TableName           varchar(50) NOT NULL,
              ItemSummary         varchar(100) NULL,
			  LastAccessed		  datetime NULL
              )

            DECLARE @SummaryTable TABLE
               (
               PatientId           int NOT NULL PRIMARY KEY,
               TotalItems          int NOT NULL,
               Items               varchar(500) NULL,
			   LastAccessed		   datetime NULL
               )

               INSERT INTO @ItemsTable(PatientId,ItemCount,TableName,ItemSummary,LastAccessed)
	            (
	            SELECT PatientId,COUNT(*),'Encounters',(CAST(COUNT(*) AS varchar(50)) +  ' ' + 'Encounters' + ' ') AS Item,
				CASE WHEN max(UpdatedTime) IS NOT NULL THEN max(UpdatedTime) ELSE max(EnteredTime) END AS LastAccessed 
	            FROM Encounters WHERE EncPending=1 GROUP BY PatientId
            UNION ALL 
	            SELECT PatientId,COUNT(*),'OperatingRoomDetails',(CAST(COUNT(*) AS varchar(50)) +  ' ' + 'OperatingRoomDetails' + ' ') AS Item, CASE WHEN max(UpdatedTime) IS NOT NULL THEN max(UpdatedTime) ELSE max(EnteredTime) END AS LastAccessed
	            FROM OperatingRoomDetails WHERE OpPending=1 GROUP BY PatientId
            UNION ALL 
	            SELECT PatientId,COUNT(*),'Procedures',(CAST(COUNT(*) AS varchar(50)) +  ' ' + 'Procedures' + ' ') AS Item,
				CASE WHEN max(UpdatedTime) IS NOT NULL THEN max(UpdatedTime) ELSE max(EnteredTime) END AS LastAccessed
	            FROM Procedures WHERE ProcPending=1 GROUP BY PatientId
            UNION ALL 
	            SELECT PatientId,COUNT(*),'Pathology',(CAST(COUNT(*) AS varchar(50)) +  ' ' + 'Pathology' + ' ') AS Item,
				CASE WHEN max(UpdatedTime) IS NOT NULL THEN max(UpdatedTime) ELSE max(EnteredTime) END AS LastAccessed 
	            FROM Pathology WHERE PathNotes like '%Pending%' GROUP BY PatientId
            UNION ALL 
	            SELECT PatientId,COUNT(*),'Pathology Tests',(CAST(COUNT(*) AS varchar(50)) +  ' ' + 'Pathology Tests' + ' ') AS Item, CASE WHEN max(b.UpdatedTime) IS NOT NULL THEN max(b.UpdatedTime) ELSE max(b.EnteredTime) END AS LastAccessed
	            FROM Pathology a INNER JOIN PathTest b ON a.PathologyId=b.PathologyId
	            WHERE b.PathResult='Pending' GROUP BY PatientId
            UNION ALL 
	            SELECT PatientId,COUNT(*),'Medical Therapy',(CAST(COUNT(*) AS varchar(50)) +  ' ' + 'Medical Tx' + ' ') AS Item, CASE WHEN max(UpdatedTime) IS NOT NULL THEN max(UpdatedTime) ELSE max(EnteredTime) END AS LastAccessed
	            FROM MedicalTherapy WHERE MedTxPending=1 GROUP BY PatientId
            UNION ALL 
	            SELECT PatientId,COUNT(*),'Radiation Therapy',(CAST(COUNT(*) AS varchar(50)) +  ' ' + 'Radiation Tx' + ' ') AS Item, CASE WHEN max(UpdatedTime) IS NOT NULL THEN max(UpdatedTime) ELSE max(EnteredTime) END AS LastAccessed 
                FROM RadiationTherapy WHERE RadTxPending=1 GROUP BY PatientId
            UNION ALL 
	            SELECT PatientId,COUNT(*),'Diagnostics',(CAST(COUNT(*) AS varchar(50)) +  ' ' + 'Diagnostics' + ' ') AS Item, CASE WHEN max(UpdatedTime) IS NOT NULL THEN max(UpdatedTime) ELSE max(EnteredTime) END AS LastAccessed 
	            FROM Diagnostics WHERE DxPending=1 GROUP BY PatientId
            ) 

            INSERT INTO @SummaryTable(PatientId,TotalItems,Items,LastAccessed)
               SELECT PatientId,SUM(ItemCount),'',max(LastAccessed)
               FROM @ItemsTable where PatientId!=29214 
               GROUP BY PatientId
               
               UPDATE @SummaryTable 
               SET Items = ItemSummary
               FROM @SummaryTable a INNER JOIN @ItemsTable as b ON a.PatientId = b.PatientId
               WHERE TableName = 'Encounters'
               
               UPDATE @SummaryTable 
               SET Items = Items + ItemSummary
               FROM @SummaryTable a INNER JOIN @ItemsTable as b ON a.PatientId = b.PatientId
               WHERE TableName = 'OperatingRoomDetails'

               UPDATE @SummaryTable 
               SET Items = Items + ItemSummary
               FROM @SummaryTable a INNER JOIN @ItemsTable as b ON a.PatientId = b.PatientId
               WHERE TableName = 'Procedures'

               UPDATE @SummaryTable 
               SET Items = Items + ItemSummary
               FROM @SummaryTable a INNER JOIN @ItemsTable as b ON a.PatientId = b.PatientId
               WHERE TableName = 'Pathology'

               UPDATE @SummaryTable 
               SET Items = Items + ItemSummary
               FROM @SummaryTable a INNER JOIN @ItemsTable as b ON a.PatientId = b.PatientId
               WHERE TableName = 'Pathology Tests'

               UPDATE @SummaryTable 
               SET Items = Items + ItemSummary
               FROM @SummaryTable a INNER JOIN @ItemsTable as b ON a.PatientId = b.PatientId
               WHERE TableName = 'Medical Therapy'
               
               UPDATE @SummaryTable 
               SET Items = Items + ItemSummary
               FROM @SummaryTable a INNER JOIN @ItemsTable as b ON a.PatientId = b.PatientId
               WHERE TableName = 'Radiation Therapy'

               UPDATE @SummaryTable 
               SET Items = Items + ItemSummary
               FROM @SummaryTable a INNER JOIN @ItemsTable as b ON a.PatientId = b.PatientId
               WHERE TableName = 'Diagnostics'                

            select distinct pt.PatientId,pt.PtFirstName,pt.PtLastName,pt.PtBirthDate,pt.PtMRN,Items,
            CASE WHEN pt.PtDeathDate IS NULL THEN 'Alive' ELSE 'Deceased' END AS VitalStatus,a.LastAccessed
            FROM Patients pt
            INNER JOIN Status st ON st.PatientId=pt.PatientId
            INNER JOIN @SummaryTable a ON a.PatientId=pt.PatientId
            INNER JOIN ({0}) ds ON pt.PatientId = ds.PatientId
            WHERE (st.StatusDisease in ('Brain','Spine') or st.StatusDisease like 'Pituitary Adenoma%') ORDER BY VitalStatus desc, a.LastAccessed, pt.PtLastName", datasetSql);

            #endregion

            DataAccessHelper.ExecuteSqlSelect(sql, dt);
            return dt;
        }

		public static DataView GetProstateQOLResults(int patientId)
		{
			#region sql
			string sql =
                @"SELECT
						Patients.PatientId,
						Patients.PtFirstName,
						Patients.PtLastName,
						Patients.PtMRN,
						DATEDIFF(year, Patients.PtBirthDate, GETDATE()) AS PtAge,
						Procedures.ProcDate AS RPDate,
						DATEDIFF(month, ProcDate, GETDATE()) AS MonthsSinceRP,
						Procedures.ProcName AS RPType,
						PrePSAs.LabResult AS PreSurgeryPSA,
						PostPSAs.LabResult AS PostSurgeryPSA,
						ProstatectomyPath.PathGG1,
						ProstatectomyPath.PathGG2,
						ProstatectomyPath.PathSV_Inv AS SVI,
						ProstatectomyPath.PathExtension AS ECE,
						LNIPathology.PathResult AS LNI,
                        Surveys.SurveyId,
						Surveys.SurveyDate
					FROM
						Patients
							INNER JOIN Procedures 
								ON Patients.PatientId = Procedures.PatientId

							LEFT OUTER JOIN LabTests PrePSAs
								ON Patients.PatientId = PrePSAs.PatientId
								AND PrePSAs.LabTest = 'PSA'
								AND PrePSAs.LabTestId =
								(
									SELECT TOP 1 LabTestId
									FROM LabTests
									WHERE PatientId = Procedures.PatientId
									AND LabTest = 'PSA'
									AND LabDate < Procedures.ProcDate
									ORDER BY LabDate DESC
								)

							LEFT OUTER JOIN LabTests PostPSAs
								ON Patients.PatientId = PostPSAs.PatientId
								AND PostPSAs.LabTest = 'PSA'
								AND PostPSAs.LabTestId =
								(
									SELECT TOP 1 LabTestId
									FROM LabTests
									WHERE PatientId = Procedures.PatientId
									AND LabTest = 'PSA'
									AND LabDate >= Procedures.ProcDate
									ORDER BY LabDate DESC
								)

							LEFT OUTER JOIN ProstatectomyPath
								ON ProstatectomyPath.PathologyId =
								(
									SELECT TOP 1 a.PathologyId
									FROM Pathology a
										INNER JOIN ProstatectomyPath b
											ON a.PathologyId = b.PathologyId
									WHERE a.ProcedureId = Procedures.ProcedureId
									ORDER BY
										CASE a.PathQuality
											WHEN 'RR' THEN 4
											WHEN 'STD' THEN 3
											WHEN 'REV' THEN 2
											WHEN 'OUT' THEN 1
											ELSE 0
										END DESC
								)

							LEFT OUTER JOIN Pathology LNIPathology
								ON LNIPathology.PathologyId =
								(
									SELECT TOP 1 Pathology.PathologyId
									FROM Pathology
										INNER JOIN Procedures PLND
											ON PLND.PatientId = Pathology.PatientId
											AND PLND.ProcedureID = Pathology.ProcedureId
											AND PLND.ProcName = 'PLND'
									WHERE Pathology.PathSpecimenType = 'PLND'
									AND Pathology.PatientId = Patients.PatientId
									ORDER BY
										CASE PathQuality
											WHEN 'RR' THEN 4
											WHEN 'STD' THEN 3
											WHEN 'REV' THEN 2
											WHEN 'OUT' THEN 1
											ELSE 0
										END DESC
								)

							LEFT OUTER JOIN Surveys
								ON Patients.PatientId = Surveys.PatientId
								AND Surveys.SurveyId =
								(
									SELECT TOP 1 SurveyId
									FROM Surveys
									WHERE PatientId = Patients.PatientId
									AND SurveyType = 'Prostate QOL Survey'
									ORDER BY SurveyDate DESC
								)
					WHERE
						Procedures.ProcName IN ('CP','LP','LP_CONV','PP','RALP','RP','SalvCP','SalvLP','SalvRP','SalvRALP')
						AND Procedures.ProcDate IS NOT NULL
						AND Patients.PtBirthDate IS NOT NULL
						AND Patients.PatientId = @PatientId";
			#endregion

			SqlCommand cmd = DataAccessHelper.CreateSqlCommand(sql);
			cmd.Parameters.AddWithValue("@PatientId", patientId);

			return DataAccessHelper.GetList(cmd).Tables[0].DefaultView;
		}

		public static DataView GetClinicScreeningList(string docName, string clinicDate)
		{
			#region sql 
			/*
			Colorectal Clinic Screening:
			Shows latest Protocol Status for Colorectal Service clinic patients by Attending [specify], by date [specify].
			Filtered for protocols: 01-110, 03-127, 06-107, 07-151, 08-073, 08-161
			Sorted by: Appointment Time (ascending)
			*/
			string sql = @"SELECT ApptPhysician, ApptTime, ApptMRN, ApptLastName + ', ' + ApptFirstName as Name_Full, DateDiff(yyyy, ApptBirthDate, GetDate()) as Age, 
							ApptVisitType, ProtocolNum, PtProtocolStatusDate, PtProtocolStatus, PtProtocolStatusReason, PtProtocolStatusNotes, b.EnteredBy
							FROM Appointments a 
							LEFT OUTER JOIN (SELECT PatientId, a.PatientProtocolId, ProtocolNum, a.PtProtocolStatusDate, a.PtProtocolStatus, a.PtProtocolStatusReason, 
											  a.PtProtocolStatusNotes, a.EnteredBy
									   FROM PatientProtocolStatus a
											  INNER JOIN (SELECT b.PatientId, a.PatientProtocolId, c.ProtocolNum, MAX(PtProtocolStatusDate) as PtProtocolStatusDate
														  FROM PatientProtocolStatus a INNER JOIN PatientProtocols b ON a.PatientProtocolId = b.PatientProtocolId
																								  INNER JOIN Protocols c ON b.ProtocolId = c.ProtocolId
														  WHERE ProtocolNum IN ('01-110', '03-127', '06-107', '07-151', '08-073', '08-161')
														  GROUP BY  b.PatientId, a.PatientProtocolId, c.ProtocolNum
														 ) b ON a.PatientProtocolId = b.PatientProtocolId AND 
																a.PtProtocolStatusDate = b.PtProtocolStatusDate
									  ) b ON a.ApptPatientId = b.PatientId
							WHERE ApptClinicDate = @clinicDate AND ApptPhysician = @docName ORDER BY ApptTime, ApptMRN ASC";
			#endregion

			SqlCommand cmd = DataAccessHelper.CreateSqlCommand(sql);
			cmd.Parameters.AddWithValue("@docName", docName);
			cmd.Parameters.AddWithValue("@clinicDate", clinicDate);

			return DataAccessHelper.GetList(cmd).Tables[0].DefaultView;
		}

        /// <summary>
        /// Get all data for Nephrectomy CREAT report for use in calculating GFR Report
        /// </summary>
        /// <returns></returns>
        public DataTable GetNephrectomyCREATReport(DateTime fromDate, DateTime toDate)
        {
            DataTable dt = new DataTable();
            string sql = @"
            SELECT LabTests.LabTest, LabTests.LabDate, LabTests.LabResult, Procedures.ProcName, Procedures.ProcDate, Patients.PtMRN, Patients.PtBirthDate, Patients.PtGender, Patients.PtRace FROM LabTests
            INNER JOIN Procedures
            ON Procedures.PatientId = LabTests.PatientId
            INNER JOIN Patients
            ON Patients.PatientId = LabTests.PatientId
            WHERE Procedures.ProcName LIKE '%neph%' AND  Procedures.ProcDate BETWEEN @fromDate AND @toDate AND LabTests.LabTest = 'CREAT' 
            ";

            SqlCommand cmd = DataAccessHelper.CreateSqlCommand(sql);
            cmd.Parameters.AddWithValue("@fromDate", fromDate);
            cmd.Parameters.AddWithValue("@toDate", toDate);

            return DataAccessHelper.GetList(cmd).Tables[0];
        }
		
    }
}