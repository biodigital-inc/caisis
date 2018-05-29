using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;

namespace Caisis.DataAccess
{
    public class PatientOutcomesDa
    {
        #region ugly sql

        private string clinincalSql =
            @"
WITH NumericPSAs_CTE (LabTestId, PatientId, LabDate, LabResult)
AS
(
    SELECT 
        LabTestId, 
        PatientId, 
        LabDate,CASE WHEN IsNumeric(LabResult) = 1 AND LabResult NOT LIKE '%[^0123456789.]%'
            THEN Convert(float, LabResult)
            ELSE 0
        END 
    FROM LabTests
    WHERE LabDate IS NOT NULL
    AND LabTest = 'PSA'
    AND LabResult IS NOT NULL
)

SELECT
-- new
	Patients.PatientId AS patientid,
	
	-- age
	DATEDIFF(day, Patients.PtBirthDate, GETDATE()) / 365.25 AS age,
	
	-- blefsurgeon
	CASE
		WHEN SexualFunction.SurveyDate <= EFS.SurveyDate AND
			 COALESCE(SexualFunction.SurveyResult, SexualFunction.SurveyTotal) IS NOT NULL
			 THEN
				CASE RTRIM(LTRIM(COALESCE(SexualFunction.SurveyResult, SexualFunction.SurveyTotal)))
					WHEN '1' THEN '1'
					WHEN '1-2' THEN '1.5'
					
					WHEN '2' THEN '2'
					WHEN '2.5' THEN '2.5'
					WHEN '2-3' THEN '2.5'
					
					WHEN '3' THEN '3'
					WHEN '3-4' THEN '3.5'
					WHEN '3,4' THEN '3.5'
					
					WHEN '4' THEN '4'
					WHEN '4-3' THEN '3.5'
					WHEN '4-5' THEN '4.5' 
					
					WHEN '5' THEN '5'
					
					ELSE NULL
				END 
		WHEN EFS.SurveyDate < SexualFunction.SurveyDate AND
			 ErectileFunction.SurveyItemResult IS NOT NULL
			 THEN 
				CASE RTRIM(LTRIM(ErectileFunction.SurveyItemResult))
					WHEN '1' THEN '1'
					WHEN '1-2' THEN '1.5'
					
					WHEN '2' THEN '2'
					WHEN '2.5' THEN '2.5'
					WHEN '2-3' THEN '2.5'
					
					WHEN '3' THEN '3'
					WHEN '3-4' THEN '3.5'
					WHEN '3,4' THEN '3.5'
					
					WHEN '4' THEN '4'
					WHEN '4-3' THEN '3.5'
					WHEN '4-5' THEN '4.5' 
					
					WHEN '5' THEN '5'
					
					ELSE NULL
				END
		ELSE 
			 	CASE RTRIM(LTRIM(COALESCE(SexualFunction.SurveyResult, SexualFunction.SurveyTotal, ErectileFunction.SurveyItemResult)))
					WHEN '1' THEN '1'
					WHEN '1-2' THEN '1.5'
					
					WHEN '2' THEN '2'
					WHEN '2.5' THEN '2.5'
					WHEN '2-3' THEN '2.5'
					
					WHEN '3' THEN '3'
					WHEN '3-4' THEN '3.5'
					WHEN '3,4' THEN '3.5'
					
					WHEN '4' THEN '4'
					WHEN '4-3' THEN '3.5'
					WHEN '4-5' THEN '4.5' 
					
					WHEN '5' THEN '5'
					
					ELSE NULL
				END
	END AS blefsurgeon,
	CASE
		WHEN SexualFunction.SurveyDate <= EFS.SurveyDate AND
			 COALESCE(SexualFunction.SurveyResult, SexualFunction.SurveyTotal) IS NOT NULL
			 THEN COALESCE(SexualFunction.SurveyResult, SexualFunction.SurveyTotal)
		WHEN EFS.SurveyDate < SexualFunction.SurveyDate AND
			 ErectileFunction.SurveyItemResult IS NOT NULL
			 THEN ErectileFunction.SurveyItemResult
		ELSE COALESCE(SexualFunction.SurveyResult, SexualFunction.SurveyTotal, ErectileFunction.SurveyItemResult)
	END AS raw_blefsurgeon,
	-- blufsurgeon
	CASE
		WHEN UrinaryFunction.SurveyDate <= CS.SurveyDate AND
			 COALESCE(UrinaryFunction.SurveyResult, UrinaryFunction.SurveyTotal) IS NOT NULL
			 THEN 
				CASE RTRIM(LTRIM(COALESCE(UrinaryFunction.SurveyResult, UrinaryFunction.SurveyTotal)))
					WHEN '1' THEN '1'
					WHEN '1- (2)' THEN '1.5'
					WHEN '1-2' THEN '1.5'
					
					WHEN '2' THEN '2'
					WHEN '2-3' THEN '2.5'
					
					WHEN '3' THEN '3'
					WHEN '3-4' THEN '3.5'
					
					WHEN '4' THEN '4'
					WHEN '4-5' THEN '4.5'
					
					WHEN '5' THEN '5'
					
					WHEN 'Continent' THEN '1'
					ELSE NULL
				END
		WHEN CS.SurveyDate < UrinaryFunction.SurveyDate AND
			 Continence.SurveyItemResult IS NOT NULL
			 THEN 
				CASE RTRIM(LTRIM(Continence.SurveyItemResult))
					WHEN '1' THEN '1'
					WHEN '1- (2)' THEN '1.5'
					WHEN '1-2' THEN '1.5'
					
					WHEN '2' THEN '2'
					WHEN '2-3' THEN '2.5'
					
					WHEN '3' THEN '3'
					WHEN '3-4' THEN '3.5'
					
					WHEN '4' THEN '4'
					WHEN '4-5' THEN '4.5'
					
					WHEN '5' THEN '5'
					
					WHEN 'Continent' THEN '1'
					ELSE NULL
				END
		ELSE 
			 CASE RTRIM(LTRIM(COALESCE(UrinaryFunction.SurveyResult, UrinaryFunction.SurveyTotal, Continence.SurveyItemResult)))
				WHEN '1' THEN '1'
				WHEN '1- (2)' THEN '1.5'
				WHEN '1-2' THEN '1.5'
				
				WHEN '2' THEN '2'
				WHEN '2-3' THEN '2.5'
				
				WHEN '3' THEN '3'
				WHEN '3-4' THEN '3.5'
				
				WHEN '4' THEN '4'
				WHEN '4-5' THEN '4.5'
				
				WHEN '5' THEN '5'
				
				WHEN 'Continent' THEN '1'
				ELSE NULL
			END
	END AS blufsurgeon,
	CASE
		WHEN UrinaryFunction.SurveyDate <= CS.SurveyDate AND
			 COALESCE(UrinaryFunction.SurveyResult, UrinaryFunction.SurveyTotal) IS NOT NULL
			 THEN 
				CASE RTRIM(LTRIM(COALESCE(UrinaryFunction.SurveyResult, UrinaryFunction.SurveyTotal)))
					WHEN '1' THEN '1'
					WHEN '1- (2)' THEN '1.5'
					WHEN '1-2' THEN '1.5'
					
					WHEN '2' THEN '2'
					WHEN '2-3' THEN '2.5'
					
					WHEN '3' THEN '3'
					WHEN '3-4' THEN '3.5'
					
					WHEN '4' THEN '4'
					WHEN '4-5' THEN '4.5'
					
					WHEN '5' THEN '5'
					
					WHEN 'Continent' THEN '1'
					ELSE '1'
				END
		WHEN CS.SurveyDate < UrinaryFunction.SurveyDate AND
			 Continence.SurveyItemResult IS NOT NULL
			 THEN 
				CASE RTRIM(LTRIM(Continence.SurveyItemResult))
					WHEN '1' THEN '1'
					WHEN '1- (2)' THEN '1.5'
					WHEN '1-2' THEN '1.5'
					
					WHEN '2' THEN '2'
					WHEN '2-3' THEN '2.5'
					
					WHEN '3' THEN '3'
					WHEN '3-4' THEN '3.5'
					
					WHEN '4' THEN '4'
					WHEN '4-5' THEN '4.5'
					
					WHEN '5' THEN '5'
					
					WHEN 'Continent' THEN '1'
					ELSE '1'
				END
		ELSE 
			 CASE RTRIM(LTRIM(COALESCE(UrinaryFunction.SurveyResult, UrinaryFunction.SurveyTotal, Continence.SurveyItemResult)))
				WHEN '1' THEN '1'
				WHEN '1- (2)' THEN '1.5'
				WHEN '1-2' THEN '1.5'
				
				WHEN '2' THEN '2'
				WHEN '2-3' THEN '2.5'
				
				WHEN '3' THEN '3'
				WHEN '3-4' THEN '3.5'
				
				WHEN '4' THEN '4'
				WHEN '4-5' THEN '4.5'
				
				WHEN '5' THEN '5'
				
				WHEN 'Continent' THEN '1'
				ELSE '1'
			END
	END AS blufsurgeoni,
	CASE
		WHEN UrinaryFunction.SurveyDate <= CS.SurveyDate AND
			 COALESCE(UrinaryFunction.SurveyResult, UrinaryFunction.SurveyTotal) IS NOT NULL
			 THEN COALESCE(UrinaryFunction.SurveyResult, UrinaryFunction.SurveyTotal)
		WHEN CS.SurveyDate < UrinaryFunction.SurveyDate AND
			 Continence.SurveyItemResult IS NOT NULL
			 THEN Continence.SurveyItemResult
		ELSE COALESCE(UrinaryFunction.SurveyResult, UrinaryFunction.SurveyTotal, Continence.SurveyItemResult)
	END AS raw_blufsurgeon,
	
	-- comorbid0
	CASE
		WHEN
			(CASE
				WHEN COUNT(C_Diabetes.ComorbidityId) > 0 THEN 1
				ELSE 0
			END) +
			(CASE
				WHEN COUNT(C_Obesity.ComorbidityId) > 0 THEN 1
				ELSE 0
			END) +
			(CASE
				WHEN COUNT(C_Hypertension.ComorbidityId) > 0 THEN 1
				ELSE 0
			END) +
			(CASE
				WHEN COUNT(C_Hypercholesterol.ComorbidityId) > 0 THEN 1
				ELSE 0
			END) +
			(CASE
				WHEN COUNT(C_CAD.ComorbidityId) > 0 THEN 1
				ELSE 0
			END) +
			(CASE
				WHEN COUNT(C_Anxiety.ComorbidityId) > 0 THEN 1
				ELSE 0
			END) +
			(CASE
				WHEN COUNT(C_Tobacco.ComorbidityId) > 0 THEN 1
				ELSE 0
			END) = 0 
			THEN 1
		ELSE 0
	END AS comorbid0,
	-- comorbid1
	CASE
		WHEN
			(CASE
				WHEN COUNT(C_Diabetes.ComorbidityId) > 0 THEN 1
				ELSE 0
			END) +
			(CASE
				WHEN COUNT(C_Obesity.ComorbidityId) > 0 THEN 1
				ELSE 0
			END) +
			(CASE
				WHEN COUNT(C_Hypertension.ComorbidityId) > 0 THEN 1
				ELSE 0
			END) +
			(CASE
				WHEN COUNT(C_Hypercholesterol.ComorbidityId) > 0 THEN 1
				ELSE 0
			END) +
			(CASE
				WHEN COUNT(C_CAD.ComorbidityId) > 0 THEN 1
				ELSE 0
			END) +
			(CASE
				WHEN COUNT(C_Anxiety.ComorbidityId) > 0 THEN 1
				ELSE 0
			END) +
			(CASE
				WHEN COUNT(C_Tobacco.ComorbidityId) > 0 THEN 1
				ELSE 0
			END) = 1 
			THEN 1
		ELSE 0
	END AS comorbid1,
	-- comorbid2
	CASE
		WHEN
			(CASE
				WHEN COUNT(C_Diabetes.ComorbidityId) > 0 THEN 1
				ELSE 0
			END) +
			(CASE
				WHEN COUNT(C_Obesity.ComorbidityId) > 0 THEN 1
				ELSE 0
			END) +
			(CASE
				WHEN COUNT(C_Hypertension.ComorbidityId) > 0 THEN 1
				ELSE 0
			END) +
			(CASE
				WHEN COUNT(C_Hypercholesterol.ComorbidityId) > 0 THEN 1
				ELSE 0
			END) +
			(CASE
				WHEN COUNT(C_CAD.ComorbidityId) > 0 THEN 1
				ELSE 0
			END) +
			(CASE
				WHEN COUNT(C_Anxiety.ComorbidityId) > 0 THEN 1
				ELSE 0
			END) +
			(CASE
				WHEN COUNT(C_Tobacco.ComorbidityId) > 0 THEN 1
				ELSE 0
			END) = 2
			THEN 1
		ELSE 0
	END AS comorbid2,
	-- comorbid3
	CASE
		WHEN
			(CASE
				WHEN COUNT(C_Diabetes.ComorbidityId) > 0 THEN 1
				ELSE 0
			END) +
			(CASE
				WHEN COUNT(C_Obesity.ComorbidityId) > 0 THEN 1
				ELSE 0
			END) +
			(CASE
				WHEN COUNT(C_Hypertension.ComorbidityId) > 0 THEN 1
				ELSE 0
			END) +
			(CASE
				WHEN COUNT(C_Hypercholesterol.ComorbidityId) > 0 THEN 1
				ELSE 0
			END) +
			(CASE
				WHEN COUNT(C_CAD.ComorbidityId) > 0 THEN 1
				ELSE 0
			END) +
			(CASE
				WHEN COUNT(C_Anxiety.ComorbidityId) > 0 THEN 1
				ELSE 0
			END) +
			(CASE
				WHEN COUNT(C_Tobacco.ComorbidityId) > 0 THEN 1
				ELSE 0
			END) >= 3 
			THEN 1
		ELSE 0
	END AS comorbid3,
	-- comorbidtot
	(CASE
		WHEN COUNT(C_Diabetes.ComorbidityId) > 0 THEN 1
		ELSE 0
	END) +
	(CASE
		WHEN COUNT(C_Obesity.ComorbidityId) > 0 THEN 1
		ELSE 0
	END) +
	(CASE
		WHEN COUNT(C_Hypertension.ComorbidityId) > 0 THEN 1
		ELSE 0
	END) +
	(CASE
		WHEN COUNT(C_Hypercholesterol.ComorbidityId) > 0 THEN 1
		ELSE 0
	END) +
	(CASE
		WHEN COUNT(C_CAD.ComorbidityId) > 0 THEN 1
		ELSE 0
	END) +
	(CASE
		WHEN COUNT(C_Anxiety.ComorbidityId) > 0 THEN 1
		ELSE 0
	END) +
	(CASE
		WHEN COUNT(C_Tobacco.ComorbidityId) > 0 THEN 1
		ELSE 0
	END) AS comorbidtot,
	
	-- deathdate
	CONVERT(varchar, Patients.PtDeathDate, 101) AS deathdate,
	
	-- ece 
	CASE
		WHEN PP.PathExtension IN ('Established', 'Focal') THEN '1'
		WHEN PP.PathExtension IN ('Invades Capsule', 'None') THEN '0' -- 'None' -> 1 ? (see setup.R)
		ELSE NULL -- set to NULL for production
	END AS ece,
	PP.PathExtension AS raw_ece,
   
	-- institution
	CASE
		WHEN Procedures.ProcInstitution LIKE 'MEMORIAL%SLOAN%KETTERING%' THEN 'MSKCC'
		WHEN Procedures.ProcInstitution IN ('MEM', 'MSK', 'MSKCC') THEN 'MSKCC'
		WHEN Procedures.ProcInstitution = 'OUT' THEN 'OUTSIDE'
		WHEN Procedures.ProcInstitution = 'NEW YORK UNIVERSITY HOSPITAL' THEN 'NYU MEDICAL CENTER'
		WHEN ISDATE(Procedures.ProcInstitution) = 1 THEN 'UNKNOWN'
		ELSE UPPER(Procedures.ProcInstitution)
	END AS institution,
	Procedures.ProcInstitution AS raw_institution,
	
	-- lastfollowupdate
	CASE
		WHEN Enc_Followup.EncDate > SD.SurveyDate THEN CONVERT(varchar, Enc_Followup.EncDate, 101)
		ELSE CONVERT(varchar, SD.SurveyDate, 101)
	END AS lastfollowupdate,
	
	-- lni
	CASE
		WHEN Pathology.PathResult LIKE '%normal%' THEN 0
		WHEN Pathology.PathResult LIKE 'Pos%' THEN 1
		WHEN Pathology.PathResult LIKE 'ABN%' THEN 1
		WHEN Pathology.PathResult LIKE 'Negative%' THEN 0
		WHEN Pathology.PathResult LIKE 'No%' THEN 0
		WHEN Pathology.PathResult IS NULL THEN 0
		ELSE NULL -- NULL for production
	END AS lni,
	Pathology.PathResult as raw_lni,
	-- mrn
	Patients.PtMRN AS mrn,
	
	-- nervespar
	CASE
        WHEN ProstatectomyProc.ProcL_NVB_Status IN ('Preserved', 'Possible damage') AND
             ProstatectomyProc.ProcR_NVB_Status IN ('Preserved', 'Possible damage') THEN 1
        WHEN ProstatectomyProc.ProcL_NVB_Status IN (NULL, 'Unknown') OR
			 ProstatectomyProc.ProcR_NVB_Status IN (NULL, 'Unknown') THEN NULL
        ELSE 0
    END AS nervespar,
    -- nervesparcat
    CASE
		WHEN ProstatectomyProc.ProcL_NVB_Status IN ('Preserved', 'Possible damage') AND
             ProstatectomyProc.ProcR_NVB_Status IN ('Preserved', 'Possible damage') THEN 2
        WHEN ProstatectomyProc.ProcL_NVB_Status IN ('Preserved', 'Possible damage') OR
             ProstatectomyProc.ProcR_NVB_Status IN ('Preserved', 'Possible damage') THEN 1
        WHEN ProstatectomyProc.ProcL_NVB_Status IN ('Resected', 'Definite damage') OR
             ProstatectomyProc.ProcR_NVB_Status IN ('Resected', 'Definite damage') THEN 0
        ELSE NULL
    END AS nervesparcat,
    ProstatectomyProc.ProcL_NVB_Status AS raw_l_nvbstatus,
    ProstatectomyProc.ProcR_NVB_Status AS raw_r_nvbstatus,
    -- nervespar0
    CASE
		WHEN ProstatectomyProc.ProcL_NVB_Status NOT IN ('Preserved', 'Possible damage') AND
             ProstatectomyProc.ProcR_NVB_Status NOT IN ('Preserved', 'Possible damage') THEN 1
        ELSE 0
    END AS nervespar0,
    -- nervespar1
    CASE
		WHEN (ProstatectomyProc.ProcL_NVB_Status IN ('Preserved', 'Possible damage') AND
             ProstatectomyProc.ProcR_NVB_Status NOT IN ('Preserved', 'Possible damage')) OR
             (ProstatectomyProc.ProcL_NVB_Status NOT IN ('Preserved', 'Possible damage') AND
             ProstatectomyProc.ProcR_NVB_Status IN ('Preserved', 'Possible damage')) THEN 1
        ELSE 0
    END AS nervespar1,
    -- nervespar2
    CASE
		WHEN ProstatectomyProc.ProcL_NVB_Status IN ('Preserved', 'Possible damage') AND
             ProstatectomyProc.ProcR_NVB_Status IN ('Preserved', 'Possible damage') THEN 1
        ELSE 0
    END AS nervespar2,
	
	-- pathggs
	CASE
		WHEN ISNUMERIC(NULLIF(PP.PathGG1, 'Unknown')) = 1 AND ISNUMERIC(NULLIF(PP.PathGG2, 'Unknown')) = 1
		THEN CONVERT(int, NULLIF(PP.PathGG1, 'Unknown')) + CONVERT(int, NULLIF(PP.PathGG2, 'Unknown'))
		ELSE NULL
	END AS pathggs,
	-- pathggs6
	CASE
		WHEN ISNUMERIC(NULLIF(PP.PathGG1, 'Unknown')) = 1 AND ISNUMERIC(NULLIF(PP.PathGG2, 'Unknown')) = 1 AND
			 CONVERT(int, NULLIF(PP.PathGG1, 'Unknown')) + CONVERT(int, NULLIF(PP.PathGG2, 'Unknown')) <= 6 
		THEN 1
		WHEN PP.PathGG1 IS NULL OR PP.PathGG2 IS NULL THEN NULL
		ELSE 0
	END AS pathggs6,
	-- pathggs7
	CASE
		WHEN ISNUMERIC(NULLIF(PP.PathGG1, 'Unknown')) = 1 AND ISNUMERIC(NULLIF(PP.PathGG2, 'Unknown')) = 1 AND
			 CONVERT(int, NULLIF(PP.PathGG1, 'Unknown')) + CONVERT(int, NULLIF(PP.PathGG2, 'Unknown')) = 7
		THEN 1
		WHEN PP.PathGG1 IS NULL OR PP.PathGG2 IS NULL THEN NULL
		ELSE 0
	END AS pathggs7,
	-- pathggs8
	CASE
		WHEN ISNUMERIC(NULLIF(PP.PathGG1, 'Unknown')) = 1 AND ISNUMERIC(NULLIF(PP.PathGG2, 'Unknown')) = 1 AND
			 CONVERT(int, NULLIF(PP.PathGG1, 'Unknown')) + CONVERT(int, NULLIF(PP.PathGG2, 'Unknown')) >= 8
		THEN 1
		WHEN PP.PathGG1 IS NULL OR PP.PathGG2 IS NULL THEN NULL
		ELSE 0
	END AS pathggs8,
	PP.PathGG1 as raw_pathgg1,
	PP.PathGG2 as raw_pathgg2,
	
	-- pathstage (<- PathologyStageGrade?)
	PSG.PathStageT as pathstage,
	
	-- psapreop
	CASE
		WHEN LabTests.LabResult LIKE '%>%' THEN SUBSTRING(LabTests.LabResult, CHARINDEX('>', LabTests.LabResult) + 1, 1000)
		WHEN LabTests.LabResult LIKE '%<%' THEN SUBSTRING(LabTests.LabResult, CHARINDEX('<', LabTests.LabResult) + 1, 1000)
		WHEN LabTests.LabResult LIKE '%~%' THEN SUBSTRING(LabTests.LabResult, CHARINDEX('~', LabTests.LabResult) + 1, 1000)
		WHEN ISNUMERIC(LabTests.LabResult) = 1 THEN LabTests.LabResult
		ELSE NULL
	END AS psapreop,
	LabTests.LabResult AS raw_psapreop,
	
	-- bcr
	CASE
        WHEN BCR.LabDate <= ISNULL(MIN(BCR_MedTx.MedTxDate),GETDATE()) AND BCR.LabDate <= ISNULL(MIN(BCR_RadTx.RadTxDate),GETDATE()) THEN 1
        WHEN MIN(BCR_MedTx.MedTxDate) <= ISNULL(BCR.LabDate,GETDATE()) AND MIN(BCR_MedTx.MedTxDate) <= ISNULL(MIN(BCR_RadTx.RadTxDate),GETDATE()) THEN 1
        WHEN MIN(BCR_RadTx.RadTxDate) <= ISNULL(BCR.LabDate,GETDATE()) AND MIN(BCR_RadTx.RadTxDate) <= ISNULL(MIN(BCR_MedTx.MedTxDate),GETDATE()) THEN 1
        ELSE 0
    END AS bcr,
	-- bcrdate
	CASE
        WHEN BCR.LabDate <= ISNULL(MIN(BCR_MedTx.MedTxDate),GETDATE()) AND BCR.LabDate <= ISNULL(MIN(BCR_RadTx.RadTxDate),GETDATE()) THEN CONVERT(varchar, BCR.LabDate, 101)
        WHEN MIN(BCR_MedTx.MedTxDate) <= ISNULL(BCR.LabDate,GETDATE()) AND MIN(BCR_MedTx.MedTxDate) <= ISNULL(MIN(BCR_RadTx.RadTxDate),GETDATE()) THEN CONVERT(varchar, MIN(BCR_MedTx.MedTxDate), 101)
        WHEN MIN(BCR_RadTx.RadTxDate) <= ISNULL(BCR.LabDate,GETDATE()) AND MIN(BCR_RadTx.RadTxDate) <= ISNULL(MIN(BCR_MedTx.MedTxDate),GETDATE()) THEN CONVERT(varchar, MIN(BCR_RadTx.RadTxDate), 101)
        ELSE NULL
    END AS bcrdate,
	
	-- surgdate
	CONVERT(varchar, Procedures.ProcDate, 101) AS surgdate,
	-- surgeon
	CASE
		WHEN Procedures.ProcSurgeon LIKE '%WILLIAM%HUANG%' THEN 'HUANG'
		WHEN Procedures.ProcSurgeon LIKE 'OUTSIDE%' THEN 'OUTSIDE'
		WHEN Procedures.ProcSurgeon IN ('OUT', 'OUTRSIDE') THEN 'OUTSIDE'
		WHEN Procedures.ProcSurgeon = 'HERR/LAUDONE' THEN 'HERR'
		WHEN Procedures.ProcSurgeon = 'HERBERT LEPOR' THEN 'LEPOR'
		ELSE UPPER(Procedures.ProcSurgeon)
	END AS surgeon,
	CASE
		WHEN Procedures.ProcSurgeon LIKE '%WILLIAM%HUANG%' THEN 'MSKCC'
		WHEN Procedures.ProcSurgeon = 'HERR/LAUDONE' THEN 'MSKCC'
		WHEN Procedures.ProcSurgeon = 'HERBERT LEPOR' THEN 'MSKCC'
		WHEN Procedures.ProcSurgeon IN (
			'BOCHNER', 'CARVER', 'COLEMAN', 'DALBAGNI', 'DONAT', 'EASTHAM', 'GUILLONNEAU', 'HERR', 'HUANG', 
			'LAUDONE', 'LEE', 'PARRA', 'RABBANI', 'RAJ', 'RUSSO', 'SANDHU', 'SCARDINO', 'SHARP', 'SOGANI', 'TOUIJER'
		) THEN 'MSKCC'
		ELSE NULL
	END AS surginstitution,
	Procedures.ProcSurgeon as raw_surgeon,
	
	-- svi
	CASE	
		WHEN PP.PathSV_Inv = 'Positive' THEN 1
		WHEN PP.PathSV_Inv = 'Negative' THEN 0
		ELSE NULL
	END as svi,
	PP.PathSV_Inv as raw_svi,
	
	-- ttbcr
	CASE
		WHEN BCR.LabDate <= ISNULL(MIN(BCR_MedTx.MedTxDate),GETDATE()) AND BCR.LabDate <= ISNULL(MIN(BCR_RadTx.RadTxDate),GETDATE()) THEN DATEDIFF(day, Procedures.ProcDate, BCR.LabDate) / 365.25 
        WHEN MIN(BCR_MedTx.MedTxDate) <= ISNULL(BCR.LabDate,GETDATE()) AND MIN(BCR_MedTx.MedTxDate) <= ISNULL(MIN(BCR_RadTx.RadTxDate),GETDATE()) THEN DATEDIFF(day, Procedures.ProcDate, MIN(BCR_MedTx.MedTxDate)) / 365.25
        WHEN MIN(BCR_RadTx.RadTxDate) <= ISNULL(BCR.LabDate,GETDATE()) AND MIN(BCR_RadTx.RadTxDate) <= ISNULL(MIN(BCR_MedTx.MedTxDate),GETDATE()) THEN DATEDIFF(day, Procedures.ProcDate, MIN(BCR_RadTx.RadTxDate)) / 365.25
		ELSE DATEDIFF(day, Procedures.ProcDate, LastPSA.LabDate) / 365.25
	END AS ttbcr,
	
	-- yos
	DATEPART(year, Procedures.ProcDate) AS yos,
	
	-- recent patient ef, uf score
	-- SexualItems
	-- UrinaryItems
	CASE 
        WHEN COUNT(SexualItems.SurveyItemId) > 0 THEN
            (
				SUM (
					CASE
						WHEN SexualItems.SurveyItemNum = '2' THEN CONVERT(int, SexualItems.SurveyItemResult)
						ELSE CONVERT(int, SexualItems.SurveyItemResult) - 1
					END
				) / 
				CONVERT(float, COUNT(SexualItems.SurveyItemId))
			) * 6
        ELSE NULL
    END AS recent_ef_patient,
    CASE
        WHEN COUNT(UrinaryItems.SurveyItemId) > 0 THEN
            21 - ((SUM(CONVERT(int, UrinaryItems.SurveyItemResult) - 1) / CONVERT(float, COUNT(UrinaryItems.SurveyItemId))) * 5)
        ELSE NULL
    END AS recent_uf_patient,
    CONVERT(varchar, SD.SurveyDate, 101) AS recent_patient_survey_date,
	
	-- recent physician ef, uf score
	CASE
		WHEN SexualFunction_C.SurveyDate <= EFS_C.SurveyDate AND
			 COALESCE(SexualFunction_C.SurveyResult, SexualFunction_C.SurveyTotal) IS NOT NULL
			 THEN COALESCE(SexualFunction_C.SurveyResult, SexualFunction_C.SurveyTotal)
		WHEN EFS_C.SurveyDate < SexualFunction_C.SurveyDate AND
			 ErectileFunction_C.SurveyItemResult IS NOT NULL
			 THEN ErectileFunction_C.SurveyItemResult
		ELSE COALESCE(SexualFunction_C.SurveyResult, SexualFunction_C.SurveyTotal, ErectileFunction_C.SurveyItemResult)
	END AS recent_ef_surgeon,
	CONVERT(varchar, COALESCE(SexualFunction_C.SurveyDate, EFS_C.SurveyDate), 101) AS recent_ef_surgeon_date,
	
	CASE
		WHEN UrinaryFunction_C.SurveyDate <= CS_C.SurveyDate AND
			 COALESCE(UrinaryFunction_C.SurveyResult, UrinaryFunction_C.SurveyTotal) IS NOT NULL
			 THEN COALESCE(UrinaryFunction_C.SurveyResult, UrinaryFunction_C.SurveyTotal)
		WHEN CS_C.SurveyDate < UrinaryFunction_C.SurveyDate AND
			 Continence_C.SurveyItemResult IS NOT NULL
			 THEN Continence_C.SurveyItemResult
		ELSE COALESCE(UrinaryFunction_C.SurveyResult, UrinaryFunction_C.SurveyTotal, Continence_C.SurveyItemResult)
	END AS recent_uf_surgeon,
	CONVERT(varchar, COALESCE(UrinaryFunction_C.SurveyDate, CS_C.SurveyDate), 101) AS recent_uf_surgeon_date,
	
	-- neoadjuvant/adjuvant, salvage therapy
	CASE
		WHEN MIN(NAA_MedTx.MedTxDate) <= Procedures.ProcDate OR
			 MIN(NAA_RadTx.RadTxDate) <= Procedures.ProcDate THEN 1
		ELSE 0
	END AS neoadjuvant,
	
	CASE
		WHEN MIN(NAA_MedTx.MedTxDate) <= Procedures.ProcDate THEN MIN(NAA_MedTx.MedTxDate)
		WHEN MIN(NAA_RadTx.RadTxDate) <= Procedures.ProcDate THEN MIN(NAA_RadTx.RadTxDate)
		ELSE NULL
	END AS raw_neoadjuvant,
	
	CASE
		WHEN Procedures.ProcName LIKE 'Salv%' THEN 1
		ELSE 0
	END AS salvage,
	
	Procedures.ProcName as raw_salvage,
	
	CASE
		WHEN MAX(NAA_MedTx.MedTxDate) > Procedures.ProcDate OR
			 MAX(NAA_RadTx.RadTxDate) > Procedures.ProcDate THEN 1
		ELSE 0
	END AS adjuvant,
	
	CASE
		WHEN MAX(NAA_MedTx.MedTxDate) > Procedures.ProcDate THEN MAX(NAA_MedTx.MedTxDate)
		WHEN MAX(NAA_RadTx.RadTxDate) > Procedures.ProcDate THEN MAX(NAA_RadTx.RadTxDate)
		ELSE NULL
	END AS raw_adjuvant,
	
	CASE
		WHEN PP.PathMargin IN ('Positive') THEN 1
		WHEN PP.PathMargin IN ('Negative') THEN 0
		ELSE NULL
	END AS sms,
	PP.PathMargin AS raw_sms,
	
	--CASE
	--	WHEN OperatingRoomDetails.OpDuration LIKE '%:%' THEN ':'
	--	WHEN OperatingRoomDetails.OpDuration LIKE '%hours%min%' THEN 'PARSE HOURS MINS'
	--	WHEN OperatingRoomDetails.OpDuration LIKE '%hours%' THEN 'PARSE HOURS'
	--	WHEN OperatingRoomDetails.OpDuration LIKE '%min%' THEN 'PARSE MINS'
	--	WHEN ISNUMERIC(OperatingRoomDetails.OpDuration) = 1 THEN 'VALID MINS'
	--	ELSE 'OTHER'
	--END AS check_ortime,
	CASE 
		WHEN SUBSTRING(LTRIM(OpDuration), 1, 1) IN ('1', '2', '3', '4', '5', '6', '7', '8', '9', '0') THEN
			CASE
				WHEN OpDuration LIKE '%:%:%' AND OpDuration NOT LIKE '%[^0123456789: ]%' THEN -- e.g. '7:25:00'
					CONVERT(int, RTRIM(LTRIM(SUBSTRING(OpDuration, 1, CHARINDEX(':', OpDuration) - 1)))) * 60 +
					CONVERT(int, RTRIM(LTRIM(SUBSTRING(OpDuration, CHARINDEX(':', OpDuration) + 1, CHARINDEX(':', OpDuration, CHARINDEX(':', OpDuration) + 1 - 2)))))
				WHEN OpDuration LIKE '%:%' AND OpDuration NOT LIKE '%[^0123456789: ]%' THEN -- e.g. '5:30'
					CONVERT(int, RTRIM(LTRIM(SUBSTRING(OpDuration, 1, CHARINDEX(':', OpDuration) - 1)))) * 60 +
					CONVERT(int, RTRIM(LTRIM(SUBSTRING(OpDuration, CHARINDEX(':', OpDuration) + 1, 100))))
				WHEN OpDuration LIKE '%hours%min%' THEN -- e.g. '4 hours 30 minutes'
					CONVERT(int, RTRIM(LTRIM(SUBSTRING(OpDuration, 1, CHARINDEX('hours', OpDuration) - 1)))) * 60 +
					CONVERT(int, RTRIM(LTRIM(SUBSTRING(OpDuration, CHARINDEX('hours', OpDuration) + 5, CHARINDEX('min', OpDuration) - CHARINDEX('hours', OpDuration) - 5))))
				WHEN OpDuration LIKE '%hrs%min%' THEN -- e.g. '4 hrs 30 minutes'
					CONVERT(int, RTRIM(LTRIM(SUBSTRING(OpDuration, 1, CHARINDEX('hrs', OpDuration) - 1)))) * 60 +
					CONVERT(int, RTRIM(LTRIM(SUBSTRING(OpDuration, CHARINDEX('hrs', OpDuration) + 3, CHARINDEX('min', OpDuration) - CHARINDEX('hrs', OpDuration) - 3))))
				WHEN OpDuration LIKE '%hours%' THEN -- e.g. '3 hours'
					CONVERT(int, RTRIM(LTRIM(SUBSTRING(OpDuration, 1, CHARINDEX('hours', OpDuration) - 1)))) * 60
				WHEN OpDuration LIKE '%min%' THEN -- e.g. '80 minutes'
					CONVERT(int, RTRIM(LTRIM(SUBSTRING(OpDuration, 1, CHARINDEX('min', OpDuration) - 1))))
				WHEN OpDuration LIKE '%.%' THEN -- e.g. '2.50'
					CONVERT(int, RTRIM(LTRIM(SUBSTRING(OpDuration, 1, CHARINDEX('.', OpDuration) - 1)))) * 60 +
					CONVERT(int, RTRIM(LTRIM(SUBSTRING(OpDuration, CHARINDEX('.', OpDuration) + 1, 100))))
				WHEN ISNUMERIC(OpDuration) = 1 THEN
					OpDuration
				ELSE NULL
			END
		ELSE NULL
	END AS ortime,
	OperatingRoomDetails.OpDuration AS raw_ortime,
	
	--CASE
	--	WHEN OperatingRoomDetails.OpEstBloodLoss LIKE '%ml%' THEN 'PARSE ML'
	--	WHEN OperatingRoomDetails.OpEstBloodLoss LIKE '%cc%' THEN 'PARSE CC'
	--	WHEN OperatingRoomDetails.OpEstBloodLoss LIKE '%liters%' THEN 'PARSE LITERS'
	--	WHEN ISNUMERIC(OperatingRoomDetails.OpEstBloodLoss) = 1 THEN 'VALID ML'
	--	ELSE 'OTHER'
	--END AS check_ebl,
	CASE
		WHEN OpEstBloodLoss LIKE '<%ml' THEN
			CONVERT(int, RTRIM(LTRIM(SUBSTRING(OpEstBloodLoss, 2, CHARINDEX('ml', OpEstBloodLoss) - 2))))
		WHEN OpEstBloodLoss LIKE '<%cc' THEN
			CONVERT(int, RTRIM(LTRIM(SUBSTRING(OpEstBloodLoss, 2, CHARINDEX('cc', OpEstBloodLoss) - 2))))
		WHEN OpEstBloodLoss LIKE '<%liter%' THEN
			CONVERT(float, RTRIM(LTRIM(SUBSTRING(OpEstBloodLoss, 2, CHARINDEX('liter', OpEstBloodLoss) - 2)))) * 1000
		WHEN OpEstBloodLoss LIKE 'approx%ml' THEN
			CONVERT(int, RTRIM(LTRIM(SUBSTRING(OpEstBloodLoss, 7, CHARINDEX('ml', OpEstBloodLoss) - 7))))
		WHEN OpEstBloodLoss LIKE 'approx%cc' THEN
			CONVERT(int, RTRIM(LTRIM(SUBSTRING(OpEstBloodLoss, 7, CHARINDEX('cc', OpEstBloodLoss) - 7))))
		WHEN OpEstBloodLoss LIKE 'approx%liter%' THEN
			CONVERT(float, RTRIM(LTRIM(SUBSTRING(OpEstBloodLoss, 7, CHARINDEX('liter', OpEstBloodLoss) - 7)))) * 1000
		WHEN OpEstBloodLoss LIKE 'less than%ml' THEN
			CONVERT(int, RTRIM(LTRIM(SUBSTRING(OpEstBloodLoss, 10, CHARINDEX('ml', OpEstBloodLoss) - 10))))
		WHEN OpEstBloodLoss LIKE 'less than%cc' THEN
			CONVERT(int, RTRIM(LTRIM(SUBSTRING(OpEstBloodLoss, 10, CHARINDEX('cc', OpEstBloodLoss) - 10))))
		WHEN OpEstBloodLoss LIKE 'less than%liter%' THEN
			CONVERT(float, RTRIM(LTRIM(SUBSTRING(OpEstBloodLoss, 10, CHARINDEX('liter', OpEstBloodLoss) - 10)))) * 1000
		WHEN OpEstBloodLoss LIKE '%ml' THEN
			CASE
				WHEN OpEstBloodLoss LIKE '%-%' THEN
					(
						CONVERT(int, RTRIM(LTRIM(SUBSTRING(OpEstBloodLoss, 1, CHARINDEX('-', OpEstBloodLoss) - 1)))) +
						CONVERT(int, RTRIM(LTRIM(SUBSTRING(OpEstBloodLoss, CHARINDEX('-', OpEstBloodLoss) + 1, CHARINDEX('ml', OpEstBloodLoss) - CHARINDEX('-', OpEstBloodLoss) - 1))))
					) / 2
				ELSE
					CONVERT(int, CONVERT(money, RTRIM(LTRIM(SUBSTRING(OpEstBloodLoss, 1, CHARINDEX('ml', OpEstBloodLoss) - 1)))))
				END
		WHEN OpEstBloodLoss LIKE '%cc' THEN
			CASE
				WHEN OpEstBloodLoss LIKE '%-%' THEN
					(
						CONVERT(int, RTRIM(LTRIM(SUBSTRING(OpEstBloodLoss, 1, CHARINDEX('-', OpEstBloodLoss) - 1)))) +
						CONVERT(int, RTRIM(LTRIM(SUBSTRING(OpEstBloodLoss, CHARINDEX('-', OpEstBloodLoss) + 1, CHARINDEX('cc', OpEstBloodLoss) - CHARINDEX('-', OpEstBloodLoss) - 1))))
					) / 2
				ELSE
					CONVERT(int, CONVERT(money, RTRIM(LTRIM(SUBSTRING(OpEstBloodLoss, 1, CHARINDEX('cc', OpEstBloodLoss) - 1)))))
				END
		WHEN OpEstBloodLoss LIKE '%liter%' THEN
			CASE
				WHEN OpEstBloodLoss LIKE '%-%' THEN
					(
						CONVERT(float, RTRIM(LTRIM(SUBSTRING(OpEstBloodLoss, 1, CHARINDEX('-', OpEstBloodLoss) - 1)))) +
						CONVERT(float, RTRIM(LTRIM(SUBSTRING(OpEstBloodLoss, CHARINDEX('-', OpEstBloodLoss) + 1, CHARINDEX('liter', OpEstBloodLoss) - CHARINDEX('-', OpEstBloodLoss) - 1))))
					) * 1000 / 2
				ELSE
					CONVERT(float, CONVERT(money, RTRIM(LTRIM(SUBSTRING(OpEstBloodLoss, 1, CHARINDEX('liter', OpEstBloodLoss) - 1))))) * 1000
				END
		WHEN ISNUMERIC(OpEstBloodLoss) = 1 THEN
			OpEstBloodLoss
		ELSE NULL
	END AS ebl,
	OperatingRoomDetails.OpEstBloodLoss AS raw_ebl,
	
	-- length of stay (los)
	DATEDIFF(day, OperatingRoomDetails.OpAdmitDate, OperatingRoomDetails.OpDischargeDate) AS los,
	
	-- clin ggs (pre-treatment ggs?)
	ProstateBiopsyPath.PathGGS AS clinggs,
	-- clin tstage
	ClinicalStages.ClinStageT AS clintstage,
	ClinicalStages.ClinStageSystem AS clinstagesystem,
	-- surgery type
	CASE
		WHEN Procedures.ProcName IN ('CP', 'PP', 'RP', 'SalvCP', 'SalvRP') THEN 'OPEN'
		WHEN Procedures.ProcName IN ('LP', 'LP_CONV', 'SalvLP') THEN 'LAP'
		WHEN Procedures.ProcName = 'RALP' THEN 'ROBOTIC'
		ELSE NULL
	END as surgtype,
	
	-- company
	CASE
		WHEN COUNT(Toxicities.ToxicityId) > 0 THEN 1
		ELSE 0
	END AS company,
	-- compint
	MAX(CONVERT(int, 
				CASE Toxicities.ToxGrade
					WHEN 'Unknown' THEN 0
					WHEN 'UNK' THEN 0
					WHEN 'None' THEN 0
					WHEN NULL THEN 0
					ELSE Toxicities.ToxGrade
				END
				)) AS compint,
	-- compmaj
	CASE
		WHEN MAX(CONVERT(int, 
						CASE Toxicities.ToxGrade
							WHEN 'Unknown' THEN 0
							WHEN 'UNK' THEN 0
							WHEN 'None' THEN 0
							ELSE Toxicities.ToxGrade
						END)) >= 3 THEN 1
		ELSE 0
	END AS compmaj,
	
	CASE
		WHEN Procedures.ProcName IN ('CP', 'SalvCP') THEN 1
		ELSE 0
	END AS cystorp,
	
	-- dod
	CASE
		WHEN Patients.PtDeathDate IS NOT NULL AND Patients.PtDeathType = 'Death from Prostate Cancer' THEN 1
		ELSE 0
	END AS dod,
	-- doc
	CASE
		WHEN Patients.PtDeathDate IS NOT NULL AND Patients.PtDeathType <> 'Death from Prostate Cancer' THEN 1
		ELSE 0
	END AS doc,
	
	-- fields added by DS
	
	-- pcggs
	COALESCE(
		CASE
			WHEN ISNUMERIC(NULLIF(PP.PathGG1, 'Unknown')) = 1 AND ISNUMERIC(NULLIF(PP.PathGG2, 'Unknown')) = 1
			THEN CONVERT(int, NULLIF(PP.PathGG1, 'Unknown')) + CONVERT(int, NULLIF(PP.PathGG2, 'Unknown'))
			ELSE NULL
		END,
		CASE
			WHEN ProstateBiopsyPath.PathGGS IN ('2', '3', '4', '5', '6', '7', '8', '9', '10') 
			THEN ProstateBiopsyPath.PathGGS
			ELSE NULL
		END
	) AS pcggs,
	-- clinggs6
	CASE
		WHEN ProstateBiopsyPath.PathGGS IN ('2', '3', '4', '5', '6') THEN 1
		WHEN ProstateBiopsyPath.PathGGS IS NULL THEN NULL
		ELSE 0
	END AS clinggs6,
	-- clinggs7
	CASE
		WHEN ProstateBiopsyPath.PathGGS = '7' THEN 1
		WHEN ProstateBiopsyPath.PathGGS IS NULL THEN NULL
		ELSE 0
	END AS clinggs7,
	-- clinggs8
	CASE
		WHEN ProstateBiopsyPath.PathGGS IN ('8', '9', '10') THEN 1
		WHEN ProstateBiopsyPath.PathGGS IS NULL THEN NULL
		ELSE 0
	END AS clinggs8,
	
	-- pcggs6
	COALESCE(
		CASE
			WHEN ISNUMERIC(NULLIF(PP.PathGG1, 'Unknown')) = 1 AND ISNUMERIC(NULLIF(PP.PathGG2, 'Unknown')) = 1 AND
				 CONVERT(int, NULLIF(PP.PathGG1, 'Unknown')) + CONVERT(int, NULLIF(PP.PathGG2, 'Unknown')) <= 6 
			THEN 1
			WHEN PP.PathGG1 IS NULL OR PP.PathGG2 IS NULL THEN NULL
			ELSE 0
		END, 
		CASE
			WHEN ProstateBiopsyPath.PathGGS IN ('2', '3', '4', '5', '6') THEN 1
			WHEN ProstateBiopsyPath.PathGGS IS NULL THEN NULL
			ELSE 0
		END
	) AS pcggs6,
	
	-- pcggs7
	COALESCE(
		CASE
			WHEN ISNUMERIC(NULLIF(PP.PathGG1, 'Unknown')) = 1 AND ISNUMERIC(NULLIF(PP.PathGG2, 'Unknown')) = 1 AND
				 CONVERT(int, NULLIF(PP.PathGG1, 'Unknown')) + CONVERT(int, NULLIF(PP.PathGG2, 'Unknown')) = 7
			THEN 1
			WHEN PP.PathGG1 IS NULL OR PP.PathGG2 IS NULL THEN NULL
			ELSE 0
		END, 
		CASE
			WHEN ProstateBiopsyPath.PathGGS = '7' THEN 1
			WHEN ProstateBiopsyPath.PathGGS IS NULL THEN NULL
			ELSE 0
		END
	) AS pcggs7,
	
	-- pcggs8
	COALESCE(
		CASE
			WHEN ISNUMERIC(NULLIF(PP.PathGG1, 'Unknown')) = 1 AND ISNUMERIC(NULLIF(PP.PathGG2, 'Unknown')) = 1 AND
				 CONVERT(int, NULLIF(PP.PathGG1, 'Unknown')) + CONVERT(int, NULLIF(PP.PathGG2, 'Unknown')) >= 8
			THEN 1
			WHEN PP.PathGG1 IS NULL OR PP.PathGG2 IS NULL THEN NULL
			ELSE 0
		END, 
		CASE
			WHEN ProstateBiopsyPath.PathGGS IN ('8', '9', '10') THEN 1
			WHEN ProstateBiopsyPath.PathGGS IS NULL THEN NULL
			ELSE 0
		END
	) AS pcggs8,
	
	-- los1
	CASE
		WHEN DATEDIFF(day, OperatingRoomDetails.OpAdmitDate, OperatingRoomDetails.OpDischargeDate) > 1 THEN 1
		ELSE 0
	END AS los1,
	-- los2
	CASE
		WHEN DATEDIFF(day, OperatingRoomDetails.OpAdmitDate, OperatingRoomDetails.OpDischargeDate) > 2 THEN 1
		ELSE 0
	END AS los2,
	-- los3
	CASE
		WHEN DATEDIFF(day, OperatingRoomDetails.OpAdmitDate, OperatingRoomDetails.OpDischargeDate) > 3 THEN 1
		ELSE 0
	END AS los3,
	-- blufsurgeonicat
	CASE
		WHEN
			(
				CASE
					WHEN UrinaryFunction.SurveyDate <= CS.SurveyDate AND
						 COALESCE(UrinaryFunction.SurveyResult, UrinaryFunction.SurveyTotal) IS NOT NULL
						 THEN 
							CASE RTRIM(LTRIM(COALESCE(UrinaryFunction.SurveyResult, UrinaryFunction.SurveyTotal)))
								WHEN '1' THEN '1'
								WHEN '1- (2)' THEN '1.5'
								WHEN '1-2' THEN '1.5'
								
								WHEN '2' THEN '2'
								WHEN '2-3' THEN '2.5'
								
								WHEN '3' THEN '3'
								WHEN '3-4' THEN '3.5'
								
								WHEN '4' THEN '4'
								WHEN '4-5' THEN '4.5'
								
								WHEN '5' THEN '5'
								
								WHEN 'Continent' THEN '1'
								ELSE '1'
							END
					WHEN CS.SurveyDate < UrinaryFunction.SurveyDate AND
						 Continence.SurveyItemResult IS NOT NULL
						 THEN 
							CASE RTRIM(LTRIM(Continence.SurveyItemResult))
								WHEN '1' THEN '1'
								WHEN '1- (2)' THEN '1.5'
								WHEN '1-2' THEN '1.5'
								
								WHEN '2' THEN '2'
								WHEN '2-3' THEN '2.5'
								
								WHEN '3' THEN '3'
								WHEN '3-4' THEN '3.5'
								
								WHEN '4' THEN '4'
								WHEN '4-5' THEN '4.5'
								
								WHEN '5' THEN '5'
								
								WHEN 'Continent' THEN '1'
								ELSE '1'
							END
					ELSE 
						 CASE RTRIM(LTRIM(COALESCE(UrinaryFunction.SurveyResult, UrinaryFunction.SurveyTotal, Continence.SurveyItemResult)))
							WHEN '1' THEN '1'
							WHEN '1- (2)' THEN '1.5'
							WHEN '1-2' THEN '1.5'
							
							WHEN '2' THEN '2'
							WHEN '2-3' THEN '2.5'
							
							WHEN '3' THEN '3'
							WHEN '3-4' THEN '3.5'
							
							WHEN '4' THEN '4'
							WHEN '4-5' THEN '4.5'
							
							WHEN '5' THEN '5'
							
							WHEN 'Continent' THEN '1'
							ELSE '1'
						END
				END
			)
			< 2.0 THEN 1
		ELSE 0
	END AS blufsurgeonicat,
	-- blufsurgeoni1
	CASE
		WHEN
			(
				CASE
					WHEN UrinaryFunction.SurveyDate <= CS.SurveyDate AND
						 COALESCE(UrinaryFunction.SurveyResult, UrinaryFunction.SurveyTotal) IS NOT NULL
						 THEN 
							CASE RTRIM(LTRIM(COALESCE(UrinaryFunction.SurveyResult, UrinaryFunction.SurveyTotal)))
								WHEN '1' THEN '1'
								WHEN '1- (2)' THEN '1.5'
								WHEN '1-2' THEN '1.5'
								
								WHEN '2' THEN '2'
								WHEN '2-3' THEN '2.5'
								
								WHEN '3' THEN '3'
								WHEN '3-4' THEN '3.5'
								
								WHEN '4' THEN '4'
								WHEN '4-5' THEN '4.5'
								
								WHEN '5' THEN '5'
								
								WHEN 'Continent' THEN '1'
								ELSE '1'
							END
					WHEN CS.SurveyDate < UrinaryFunction.SurveyDate AND
						 Continence.SurveyItemResult IS NOT NULL
						 THEN 
							CASE RTRIM(LTRIM(Continence.SurveyItemResult))
								WHEN '1' THEN '1'
								WHEN '1- (2)' THEN '1.5'
								WHEN '1-2' THEN '1.5'
								
								WHEN '2' THEN '2'
								WHEN '2-3' THEN '2.5'
								
								WHEN '3' THEN '3'
								WHEN '3-4' THEN '3.5'
								
								WHEN '4' THEN '4'
								WHEN '4-5' THEN '4.5'
								
								WHEN '5' THEN '5'
								
								WHEN 'Continent' THEN '1'
								ELSE '1'
							END
					ELSE 
						 CASE RTRIM(LTRIM(COALESCE(UrinaryFunction.SurveyResult, UrinaryFunction.SurveyTotal, Continence.SurveyItemResult)))
							WHEN '1' THEN '1'
							WHEN '1- (2)' THEN '1.5'
							WHEN '1-2' THEN '1.5'
							
							WHEN '2' THEN '2'
							WHEN '2-3' THEN '2.5'
							
							WHEN '3' THEN '3'
							WHEN '3-4' THEN '3.5'
							
							WHEN '4' THEN '4'
							WHEN '4-5' THEN '4.5'
							
							WHEN '5' THEN '5'
							
							WHEN 'Continent' THEN '1'
							ELSE '1'
						END
				END
			)
			< 2.0 THEN 1
		ELSE 0
	END AS blufsurgeoni1,
	-- blufsurgeoni2
	CASE
		WHEN
			(
				CASE
					WHEN UrinaryFunction.SurveyDate <= CS.SurveyDate AND
						 COALESCE(UrinaryFunction.SurveyResult, UrinaryFunction.SurveyTotal) IS NOT NULL
						 THEN 
							CASE RTRIM(LTRIM(COALESCE(UrinaryFunction.SurveyResult, UrinaryFunction.SurveyTotal)))
								WHEN '1' THEN '1'
								WHEN '1- (2)' THEN '1.5'
								WHEN '1-2' THEN '1.5'
								
								WHEN '2' THEN '2'
								WHEN '2-3' THEN '2.5'
								
								WHEN '3' THEN '3'
								WHEN '3-4' THEN '3.5'
								
								WHEN '4' THEN '4'
								WHEN '4-5' THEN '4.5'
								
								WHEN '5' THEN '5'
								
								WHEN 'Continent' THEN '1'
								ELSE '1'
							END
					WHEN CS.SurveyDate < UrinaryFunction.SurveyDate AND
						 Continence.SurveyItemResult IS NOT NULL
						 THEN 
							CASE RTRIM(LTRIM(Continence.SurveyItemResult))
								WHEN '1' THEN '1'
								WHEN '1- (2)' THEN '1.5'
								WHEN '1-2' THEN '1.5'
								
								WHEN '2' THEN '2'
								WHEN '2-3' THEN '2.5'
								
								WHEN '3' THEN '3'
								WHEN '3-4' THEN '3.5'
								
								WHEN '4' THEN '4'
								WHEN '4-5' THEN '4.5'
								
								WHEN '5' THEN '5'
								
								WHEN 'Continent' THEN '1'
								ELSE '1'
							END
					ELSE 
						 CASE RTRIM(LTRIM(COALESCE(UrinaryFunction.SurveyResult, UrinaryFunction.SurveyTotal, Continence.SurveyItemResult)))
							WHEN '1' THEN '1'
							WHEN '1- (2)' THEN '1.5'
							WHEN '1-2' THEN '1.5'
							
							WHEN '2' THEN '2'
							WHEN '2-3' THEN '2.5'
							
							WHEN '3' THEN '3'
							WHEN '3-4' THEN '3.5'
							
							WHEN '4' THEN '4'
							WHEN '4-5' THEN '4.5'
							
							WHEN '5' THEN '5'
							
							WHEN 'Continent' THEN '1'
							ELSE '1'
						END
				END
			)
			BETWEEN 2.0 AND 2.5 THEN 1
		ELSE 0
	END AS blufsurgeoni2,
	-- blufsurgeoni3
	CASE
		WHEN
			(
				CASE
					WHEN UrinaryFunction.SurveyDate <= CS.SurveyDate AND
						 COALESCE(UrinaryFunction.SurveyResult, UrinaryFunction.SurveyTotal) IS NOT NULL
						 THEN 
							CASE RTRIM(LTRIM(COALESCE(UrinaryFunction.SurveyResult, UrinaryFunction.SurveyTotal)))
								WHEN '1' THEN '1'
								WHEN '1- (2)' THEN '1.5'
								WHEN '1-2' THEN '1.5'
								
								WHEN '2' THEN '2'
								WHEN '2-3' THEN '2.5'
								
								WHEN '3' THEN '3'
								WHEN '3-4' THEN '3.5'
								
								WHEN '4' THEN '4'
								WHEN '4-5' THEN '4.5'
								
								WHEN '5' THEN '5'
								
								WHEN 'Continent' THEN '1'
								ELSE '1'
							END
					WHEN CS.SurveyDate < UrinaryFunction.SurveyDate AND
						 Continence.SurveyItemResult IS NOT NULL
						 THEN 
							CASE RTRIM(LTRIM(Continence.SurveyItemResult))
								WHEN '1' THEN '1'
								WHEN '1- (2)' THEN '1.5'
								WHEN '1-2' THEN '1.5'
								
								WHEN '2' THEN '2'
								WHEN '2-3' THEN '2.5'
								
								WHEN '3' THEN '3'
								WHEN '3-4' THEN '3.5'
								
								WHEN '4' THEN '4'
								WHEN '4-5' THEN '4.5'
								
								WHEN '5' THEN '5'
								
								WHEN 'Continent' THEN '1'
								ELSE '1'
							END
					ELSE 
						 CASE RTRIM(LTRIM(COALESCE(UrinaryFunction.SurveyResult, UrinaryFunction.SurveyTotal, Continence.SurveyItemResult)))
							WHEN '1' THEN '1'
							WHEN '1- (2)' THEN '1.5'
							WHEN '1-2' THEN '1.5'
							
							WHEN '2' THEN '2'
							WHEN '2-3' THEN '2.5'
							
							WHEN '3' THEN '3'
							WHEN '3-4' THEN '3.5'
							
							WHEN '4' THEN '4'
							WHEN '4-5' THEN '4.5'
							
							WHEN '5' THEN '5'
							
							WHEN 'Continent' THEN '1'
							ELSE '1'
						END
				END
			)
			>= 3.0 THEN 1
		ELSE 0
	END AS blufsurgeoni3,
	-- blefsurgeoncat1
	CASE
		WHEN
		(
			CASE
				WHEN SexualFunction.SurveyDate <= EFS.SurveyDate AND
					 COALESCE(SexualFunction.SurveyResult, SexualFunction.SurveyTotal) IS NOT NULL
					 THEN
						CASE RTRIM(LTRIM(COALESCE(SexualFunction.SurveyResult, SexualFunction.SurveyTotal)))
							WHEN '1' THEN '1'
							WHEN '1-2' THEN '1.5'
							
							WHEN '2' THEN '2'
							WHEN '2.5' THEN '2.5'
							WHEN '2-3' THEN '2.5'
							
							WHEN '3' THEN '3'
							WHEN '3-4' THEN '3.5'
							WHEN '3,4' THEN '3.5'
							
							WHEN '4' THEN '4'
							WHEN '4-3' THEN '3.5'
							WHEN '4-5' THEN '4.5' 
							
							WHEN '5' THEN '5'
							
							ELSE NULL
						END 
				WHEN EFS.SurveyDate < SexualFunction.SurveyDate AND
					 ErectileFunction.SurveyItemResult IS NOT NULL
					 THEN 
						CASE RTRIM(LTRIM(ErectileFunction.SurveyItemResult))
							WHEN '1' THEN '1'
							WHEN '1-2' THEN '1.5'
							
							WHEN '2' THEN '2'
							WHEN '2.5' THEN '2.5'
							WHEN '2-3' THEN '2.5'
							
							WHEN '3' THEN '3'
							WHEN '3-4' THEN '3.5'
							WHEN '3,4' THEN '3.5'
							
							WHEN '4' THEN '4'
							WHEN '4-3' THEN '3.5'
							WHEN '4-5' THEN '4.5' 
							
							WHEN '5' THEN '5'
							
							ELSE NULL
						END
				ELSE 
			 			CASE RTRIM(LTRIM(COALESCE(SexualFunction.SurveyResult, SexualFunction.SurveyTotal, ErectileFunction.SurveyItemResult)))
							WHEN '1' THEN '1'
							WHEN '1-2' THEN '1.5'
							
							WHEN '2' THEN '2'
							WHEN '2.5' THEN '2.5'
							WHEN '2-3' THEN '2.5'
							
							WHEN '3' THEN '3'
							WHEN '3-4' THEN '3.5'
							WHEN '3,4' THEN '3.5'
							
							WHEN '4' THEN '4'
							WHEN '4-3' THEN '3.5'
							WHEN '4-5' THEN '4.5' 
							
							WHEN '5' THEN '5'
							
							ELSE NULL
						END
			END
		)
		< 2.0 THEN 1
		ELSE 0
	END AS blefsurgeoncat1,
	-- blefsurgeoncat2
	CASE
		WHEN
		(
			CASE
				WHEN SexualFunction.SurveyDate <= EFS.SurveyDate AND
					 COALESCE(SexualFunction.SurveyResult, SexualFunction.SurveyTotal) IS NOT NULL
					 THEN
						CASE RTRIM(LTRIM(COALESCE(SexualFunction.SurveyResult, SexualFunction.SurveyTotal)))
							WHEN '1' THEN '1'
							WHEN '1-2' THEN '1.5'
							
							WHEN '2' THEN '2'
							WHEN '2.5' THEN '2.5'
							WHEN '2-3' THEN '2.5'
							
							WHEN '3' THEN '3'
							WHEN '3-4' THEN '3.5'
							WHEN '3,4' THEN '3.5'
							
							WHEN '4' THEN '4'
							WHEN '4-3' THEN '3.5'
							WHEN '4-5' THEN '4.5' 
							
							WHEN '5' THEN '5'
							
							ELSE NULL
						END 
				WHEN EFS.SurveyDate < SexualFunction.SurveyDate AND
					 ErectileFunction.SurveyItemResult IS NOT NULL
					 THEN 
						CASE RTRIM(LTRIM(ErectileFunction.SurveyItemResult))
							WHEN '1' THEN '1'
							WHEN '1-2' THEN '1.5'
							
							WHEN '2' THEN '2'
							WHEN '2.5' THEN '2.5'
							WHEN '2-3' THEN '2.5'
							
							WHEN '3' THEN '3'
							WHEN '3-4' THEN '3.5'
							WHEN '3,4' THEN '3.5'
							
							WHEN '4' THEN '4'
							WHEN '4-3' THEN '3.5'
							WHEN '4-5' THEN '4.5' 
							
							WHEN '5' THEN '5'
							
							ELSE NULL
						END
				ELSE 
			 			CASE RTRIM(LTRIM(COALESCE(SexualFunction.SurveyResult, SexualFunction.SurveyTotal, ErectileFunction.SurveyItemResult)))
							WHEN '1' THEN '1'
							WHEN '1-2' THEN '1.5'
							
							WHEN '2' THEN '2'
							WHEN '2.5' THEN '2.5'
							WHEN '2-3' THEN '2.5'
							
							WHEN '3' THEN '3'
							WHEN '3-4' THEN '3.5'
							WHEN '3,4' THEN '3.5'
							
							WHEN '4' THEN '4'
							WHEN '4-3' THEN '3.5'
							WHEN '4-5' THEN '4.5' 
							
							WHEN '5' THEN '5'
							
							ELSE NULL
						END
			END
		)
		BETWEEN 2.0 AND 2.5 THEN 1
		ELSE 0
	END AS blefsurgeoncat2,
	-- blefsurgeoncat3
	CASE
		WHEN
		(
			CASE
				WHEN SexualFunction.SurveyDate <= EFS.SurveyDate AND
					 COALESCE(SexualFunction.SurveyResult, SexualFunction.SurveyTotal) IS NOT NULL
					 THEN
						CASE RTRIM(LTRIM(COALESCE(SexualFunction.SurveyResult, SexualFunction.SurveyTotal)))
							WHEN '1' THEN '1'
							WHEN '1-2' THEN '1.5'
							
							WHEN '2' THEN '2'
							WHEN '2.5' THEN '2.5'
							WHEN '2-3' THEN '2.5'
							
							WHEN '3' THEN '3'
							WHEN '3-4' THEN '3.5'
							WHEN '3,4' THEN '3.5'
							
							WHEN '4' THEN '4'
							WHEN '4-3' THEN '3.5'
							WHEN '4-5' THEN '4.5' 
							
							WHEN '5' THEN '5'
							
							ELSE NULL
						END 
				WHEN EFS.SurveyDate < SexualFunction.SurveyDate AND
					 ErectileFunction.SurveyItemResult IS NOT NULL
					 THEN 
						CASE RTRIM(LTRIM(ErectileFunction.SurveyItemResult))
							WHEN '1' THEN '1'
							WHEN '1-2' THEN '1.5'
							
							WHEN '2' THEN '2'
							WHEN '2.5' THEN '2.5'
							WHEN '2-3' THEN '2.5'
							
							WHEN '3' THEN '3'
							WHEN '3-4' THEN '3.5'
							WHEN '3,4' THEN '3.5'
							
							WHEN '4' THEN '4'
							WHEN '4-3' THEN '3.5'
							WHEN '4-5' THEN '4.5' 
							
							WHEN '5' THEN '5'
							
							ELSE NULL
						END
				ELSE 
			 			CASE RTRIM(LTRIM(COALESCE(SexualFunction.SurveyResult, SexualFunction.SurveyTotal, ErectileFunction.SurveyItemResult)))
							WHEN '1' THEN '1'
							WHEN '1-2' THEN '1.5'
							
							WHEN '2' THEN '2'
							WHEN '2.5' THEN '2.5'
							WHEN '2-3' THEN '2.5'
							
							WHEN '3' THEN '3'
							WHEN '3-4' THEN '3.5'
							WHEN '3,4' THEN '3.5'
							
							WHEN '4' THEN '4'
							WHEN '4-3' THEN '3.5'
							WHEN '4-5' THEN '4.5' 
							
							WHEN '5' THEN '5'
							
							ELSE NULL
						END
			END
		)
		>= 3.0 THEN 1
		ELSE 0
	END AS blefsurgeoncat3
	
FROM
    Patients
        INNER JOIN Procedures
			ON Procedures.ProcedureId =
			(
				SELECT TOP 1 p.ProcedureId
				FROM Procedures p
				WHERE p.PatientId = Patients.PatientId
				AND p.ProcName IN (
					'CP','LP','LP_CONV','PP','RALP','RP','SalvCP','SalvLP','SalvRP'
				)
				--AND p.ProcDate BETWEEN '1/1/2009' AND '12/31/2011'
				--AND p.ProcDate < '1/1/2005'
				ORDER BY
					CASE p.ProcQuality
						WHEN 'RR' THEN 4
                        WHEN 'STD' THEN 3
                        WHEN 'REV' THEN 2
                        WHEN 'OUT' THEN 1
                        ELSE 0
					END DESC
			)
            
        LEFT OUTER JOIN OperatingRoomDetails
			ON Procedures.OperatingRoomDetailId = OperatingRoomDetails.OperatingRoomDetailId

        -- diagnostic biopsy
        LEFT OUTER JOIN ProstateBiopsyPath
			ON ProstateBiopsyPath.PathologyId =
			(
				SELECT TOP 1 pb.PathologyId
				FROM ProstateBiopsyPath pb
					INNER JOIN Pathology pb_path on pb.PathologyId = pb_path.PathologyId
					INNER JOIN Procedures pb_proc on pb_path.ProcedureId = pb_proc.ProcedureId
						AND pb_proc.PatientId = Procedures.PatientId
				WHERE ProcSite = 'Prostate' 
				AND ProcName IN ('TURP', 'TRUS Biopsy', 'Biopsy', 'Needle Biopsy')
				ORDER BY pb_proc.ProcDate ASC,
					CASE pb_path.PathQuality
						WHEN 'RR' THEN 4
                        WHEN 'STD' THEN 3
                        WHEN 'REV' THEN 2
                        WHEN 'OUT' THEN 1
                        ELSE 0
					END DESC
			)
			
		-- clinical stage
		LEFT OUTER JOIN ClinicalStages
			ON ClinicalStages.ClinicalStageId = 
			(
				SELECT TOP 1 ClinicalStageId
				FROM ClinicalStages
				WHERE PatientId = Procedures.PatientId
				AND (ClinStageDate IS NULL OR ClinStageDate <= Procedures.ProcDate)
				ORDER BY ClinStageDate DESC,
					CASE ClinStageQuality
						WHEN 'RR' THEN 4
                        WHEN 'STD' THEN 3
                        WHEN 'REV' THEN 2
                        WHEN 'OUT' THEN 1
                        ELSE 0
					END DESC
			)
        
        LEFT OUTER JOIN ProstatectomyPath PP    
            ON PP.PathologyId =
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

        LEFT OUTER JOIN SurveyItems SexualItems
            ON SexualItems.SurveyId =
            (
                SELECT TOP 1 SA.SurveyId
                FROM Surveys SA
                WHERE SA.PatientId = Procedures.PatientId
                AND SA.SurveyDate >= Procedures.ProcDate
                AND SA.SurveyType = 'Prostate QOL Survey'
                ORDER BY SA.SurveyDate DESC
            )
            AND SexualItems.SurveyItemNum IN ('2', '3', '4', '5', '6', '7')
            AND IsNumeric(SexualItems.SurveyItemResult) = 1
            AND SexualItems.SurveyItemResult NOT LIKE '%[^0123456789]%'

        LEFT OUTER JOIN SurveyItems UrinaryItems
            ON SexualItems.SurveyId = UrinaryItems.SurveyId
            AND UrinaryItems.SurveyItemNum IN ('8', '9', '10', '11', '12')
            AND IsNumeric(UrinaryItems.SurveyItemResult) = 1
            AND UrinaryItems.SurveyItemResult NOT LIKE '%[^0123456789]%'

        LEFT OUTER JOIN Surveys SD
            ON Sexualitems.SurveyId = SD.SurveyId
                        
        LEFT OUTER JOIN LabTests
            ON Patients.PatientId = LabTests.PatientId
            AND LabTests.LabTest = 'PSA'
            AND LabTests.LabTestId = 
            (
                SELECT TOP 1 LabTestId
                FROM LabTests
                WHERE PatientId = Procedures.PatientId
                AND LabTest = 'PSA'
                AND DATEDIFF(day,Procedures.ProcDate,LabDate) <= 0
                ORDER BY DATEDIFF(day,Procedures.ProcDate,LabDate) DESC, 
                    CASE LabQuality
                        WHEN 'RR' THEN 4
                        WHEN 'STD' THEN 3
                        WHEN 'REV' THEN 2
                        WHEN 'OUT' THEN 1
                        ELSE 0
                    END DESC, 
                    LabResult DESC
            )
            
        LEFT OUTER JOIN LabTests LastPSA
			ON Patients.PatientId = LastPSA.PatientId
			AND LastPSA.LabTestId =
			(
				SELECT TOP 1 LabTestId
				FROM NumericPSAs_CTE _lp
				WHERE _lp.PatientId = Patients.PatientId
				AND _lp.LabDate > Procedures.ProcDate
				ORDER BY _lp.LabDate DESC
			)

        LEFT OUTER JOIN LabTests BCR
            ON Patients.PatientId = BCR.PatientId
            AND BCR.LabTestId =
            (
                SELECT TOP 1 LabTestId
                FROM NumericPSAs_CTE _bcr
                WHERE _bcr.PatientId = Procedures.PatientId
                AND _bcr.LabDate > DATEADD(day, 30, Procedures.ProcDate)
                AND _bcr.LabResult >= .2
                ORDER BY _bcr.LabDate ASC
            )
            
        LEFT OUTER JOIN ProstatectomyProc
            ON Procedures.ProcedureId = ProstatectomyProc.ProcedureId

        LEFT OUTER JOIN Procedures PLND
            ON PLND.ProcedureId =
            (
				SELECT TOP 1 ProcedureId
				FROM Procedures p
				WHERE p.PatientId = Procedures.PatientId
				AND p.OperatingRoomDetailId = Procedures.OperatingRoomDetailId
				AND p.ProcName LIKE '%PLND%'
				ORDER BY
					CASE ProcQuality
						WHEN 'RR' THEN 4
                        WHEN 'STD' THEN 3
                        WHEN 'REV' THEN 2
                        WHEN 'OUT' THEN 1
                        ELSE 0
					END DESC,
					UpdatedTime DESC,
					EnteredTime DESC
            )

        LEFT OUTER JOIN Pathology
            ON Pathology.PathologyId = 
            (
                SELECT TOP 1 PathologyId
                FROM Pathology
                WHERE ProcedureId = PLND.ProcedureId
                AND PathSpecimenType = 'PLND'
                ORDER BY
                    CASE PathQuality
                        WHEN 'RR' THEN 4
                        WHEN 'STD' THEN 3
                        WHEN 'REV' THEN 2
                        WHEN 'OUT' THEN 1
                        ELSE 0
                    END DESC
            )
            
        LEFT OUTER JOIN PathologyStageGrade PSG
			ON PSG.PathologyStageGradeId =
			(
				SELECT TOP 1 PathologyStageGradeId
				FROM PathologyStageGrade
				WHERE PathologyId = PP.PathologyId
				AND PathStageT IS NOT NULL
				ORDER BY
					CASE PathQuality
                        WHEN 'RR' THEN 4
                        WHEN 'STD' THEN 3
                        WHEN 'REV' THEN 2
                        WHEN 'OUT' THEN 1
                        ELSE 0
                    END DESC
			)
			
        LEFT OUTER JOIN MedicalTherapy BCR_MedTx
            ON Procedures.PatientId = BCR_MedTx.PatientId
            AND BCR_MedTx.MedTxDate >= DATEADD(month, 6, Procedures.ProcDate)
            AND ((BCR_MedTx.MedTxType LIKE '%HORM%')
                OR (BCR_MedTx.MedTxType = 'ORCH')
                OR (BCR_MedTx.MedTxType ='Bilateral Orchiectomy')
                OR (BCR_MedTx.MedTxType LIKE 'ORCH_BIL%')
                OR (BCR_MedTx.MedTxType LIKE '%LHRH%')
                OR (BCR_MedTx.MedTxType LIKE '%AA%')
                OR (BCR_MedTx.MedTxType LIKE '%ESTROGEN%')
                OR (BCR_MedTx.MedTxType LIKE '%PROGEST%'))
                AND (BCR_MedTx.MedTxType NOT LIKE '%STOP')

        LEFT OUTER JOIN RadiationTherapy BCR_RadTx
            ON Procedures.PatientId = BCR_RadTx.PatientId
            AND BCR_RadTx.RadTxDate >= DATEADD(month, 6, Procedures.ProcDate)
            AND BCR_RadTx.RadTxType
                IN ('XRT','EBRT','RT','COMBO','BRACHY','COMBO','RADIOISOTOPE','SEED','IMPLANT','Brachytherapy',
                    'External Beam','Radiation Therapy, Unspecified','External Beam, IMRT',
                    'High-Dose Rate Brachytherapy','External Beam, 3D Conventional','External Beam, 3D Conformal')
                    
		-- neo adjuvant/adjuvant therapy
		LEFT OUTER JOIN MedicalTherapy NAA_MedTx
            ON Procedures.PatientId = NAA_MedTx.PatientId
            AND ((NAA_MedTx.MedTxType LIKE '%HORM%')
                OR (NAA_MedTx.MedTxType = 'ORCH')
                OR (NAA_MedTx.MedTxType ='Bilateral Orchiectomy')
                OR (NAA_MedTx.MedTxType LIKE 'ORCH_BIL%')
                OR (NAA_MedTx.MedTxType LIKE '%LHRH%')
                OR (NAA_MedTx.MedTxType LIKE '%AA%')
                OR (NAA_MedTx.MedTxType LIKE '%ESTROGEN%')
                OR (NAA_MedTx.MedTxType LIKE '%PROGEST%'))
                AND (NAA_MedTx.MedTxType NOT LIKE '%STOP')

        LEFT OUTER JOIN RadiationTherapy NAA_RadTx
            ON Procedures.PatientId = NAA_RadTx.PatientId
            AND NAA_RadTx.RadTxType
                IN ('XRT','EBRT','RT','COMBO','BRACHY','COMBO','RADIOISOTOPE','SEED','IMPLANT','Brachytherapy',
                    'External Beam','Radiation Therapy, Unspecified','External Beam, IMRT',
                    'High-Dose Rate Brachytherapy','External Beam, 3D Conventional','External Beam, 3D Conformal')
			
		-- new joins
		LEFT OUTER JOIN Comorbidities
			ON Patients.PatientId = Comorbidities.PatientId
			
		-- improved comorbidities
		-- diabetes
		LEFT OUTER JOIN Comorbidities C_Diabetes
			ON Patients.PatientId = C_Diabetes.PatientId
			AND C_Diabetes.Comorbidity LIKE '%diabet%'
			
		-- obesity
		LEFT OUTER JOIN Comorbidities C_Obesity
			ON Patients.PatientId = C_Obesity.PatientId
			AND C_Obesity.Comorbidity LIKE '%obesity%'
			
		-- hypertension
		LEFT OUTER JOIN Comorbidities C_Hypertension
			ON Patients.PatientId = C_Hypertension.PatientId
			AND (C_Hypertension.Comorbidity LIKE '%elevated%blood%pressure' OR 
				 C_Hypertension.Comorbidity LIKE '%high%blood%pressure' OR 
				 C_Hypertension.Comorbidity LIKE '%hypertension%')
			
		-- hypercholesterol
		LEFT OUTER JOIN Comorbidities C_Hypercholesterol
			ON Patients.PatientId = C_Hypercholesterol.PatientId
			AND (C_Hypercholesterol.Comorbidity LIKE '%cholesterol%' OR
				 C_Hypercholesterol.Comorbidity LIKE '%hyperchol%')
				 
		-- coronary artery disease
		LEFT OUTER JOIN Comorbidities C_CAD
			ON Patients.PatientId = C_CAD.PatientId
			AND (C_CAD.Comorbidity LIKE '%coro%artery%disease' OR
				 C_CAD.Comorbidity LIKE '%cad%')
				 
		-- anxiety
		LEFT OUTER JOIN Comorbidities C_Anxiety
			ON Patients.PatientId = C_Anxiety.PatientId
			AND C_Anxiety.Comorbidity LIKE '%anxiety%'
			
		-- tobacco
		LEFT OUTER JOIN Comorbidities C_Tobacco
			ON Patients.PatientId = C_Tobacco.PatientId
			AND (C_Tobacco.Comorbidity LIKE '%tob%' OR
				 C_Tobacco.Comorbidity LIKE '%smok%')
			
		-- urinary (baseline)
		LEFT OUTER JOIN Surveys UrinaryFunction
			ON UrinaryFunction.SurveyId =
			(
				SELECT TOP 1 SurveyId
				FROM Surveys
				WHERE PatientId = Procedures.PatientId 
				AND SurveyType = 'Urinary Function'
				AND SurveyDate <= Procedures.ProcDate
				ORDER BY SurveyDate DESC
			)

		LEFT OUTER JOIN SurveyItems Continence
			ON Continence.SurveyItemId =
			(
				SELECT TOP 1 SurveyItemId
				FROM Surveys
					INNER JOIN SurveyItems
						ON Surveys.SurveyId = SurveyItems.SurveyId
						AND SurveyItem = 'Continence'
				WHERE PatientId = Procedures.PatientId
				AND SurveyType = 'Urinary Function'
				AND SurveyDate <= Procedures.ProcDate
				ORDER BY SurveyDate DESC
			)

		LEFT OUTER JOIN Surveys CS
			ON Continence.SurveyId = CS.SurveyId

		-- erectile (baseline)
		LEFT OUTER JOIN Surveys SexualFunction
			ON SexualFunction.SurveyId =
			(
				SELECT TOP 1 SurveyId
				FROM Surveys
				WHERE PatientId = Procedures.PatientId 
				AND SurveyType = 'Sexual Function'
				AND SurveyDate <= Procedures.ProcDate
				ORDER BY SurveyDate DESC
			)

		LEFT OUTER JOIN SurveyItems ErectileFunction
			ON ErectileFunction.SurveyItemId =
			(
				SELECT TOP 1 SurveyItemId
				FROM Surveys
					INNER JOIN SurveyItems
						ON Surveys.SurveyId = SurveyItems.SurveyId
						AND SurveyItem = 'Erectile Function'
				WHERE PatientId = Procedures.PatientId
				AND SurveyType = 'Sexual Function'
				AND SurveyDate <= Procedures.ProcDate
				ORDER BY SurveyDate DESC
			)

		LEFT OUTER JOIN Surveys EFS
			ON ErectileFunction.SurveyId = EFS.SurveyId
			
		-- last followup - coalesce:
		-- EncType LIKE %FX% OR %FR%
		LEFT OUTER JOIN Encounters Enc_Followup
			ON Enc_Followup.EncounterId =
			(
				SELECT TOP 1 EncounterId
				FROM Encounters
				WHERE PatientId = Procedures.PatientId
				AND EncDate > Procedures.ProcDate
				AND (EncType LIKE '%FX%' OR EncType LIKE '%FR%')
				ORDER BY EncDate DESC
			)
		
		-- most recent physician surveys
		-- erectile (recent)
		LEFT OUTER JOIN Surveys SexualFunction_C
			ON SexualFunction_C.SurveyId =
			(
				SELECT TOP 1 SurveyId
				FROM Surveys
				WHERE PatientId = Procedures.PatientId 
				AND SurveyType = 'Sexual Function'
				AND SurveyDate > Procedures.ProcDate
				ORDER BY SurveyDate DESC
			)

		LEFT OUTER JOIN SurveyItems ErectileFunction_C
			ON ErectileFunction_C.SurveyItemId =
			(
				SELECT TOP 1 SurveyItemId
				FROM Surveys
					INNER JOIN SurveyItems
						ON Surveys.SurveyId = SurveyItems.SurveyId
						AND SurveyItem = 'Erectile Function'
				WHERE PatientId = Procedures.PatientId
				AND SurveyType = 'Sexual Function'
				AND SurveyDate > Procedures.ProcDate
				ORDER BY SurveyDate DESC
			)

		LEFT OUTER JOIN Surveys EFS_C
			ON ErectileFunction_C.SurveyId = EFS_C.SurveyId
			
		-- urinary (recent)
		LEFT OUTER JOIN Surveys UrinaryFunction_C
			ON UrinaryFunction_C.SurveyId =
			(
				SELECT TOP 1 SurveyId
				FROM Surveys
				WHERE PatientId = Procedures.PatientId 
				AND SurveyType = 'Urinary Function'
				AND SurveyDate > Procedures.ProcDate
				ORDER BY SurveyDate DESC
			)

		LEFT OUTER JOIN SurveyItems Continence_C
			ON Continence_C.SurveyItemId =
			(
				SELECT TOP 1 SurveyItemId
				FROM Surveys
					INNER JOIN SurveyItems
						ON Surveys.SurveyId = SurveyItems.SurveyId
						AND SurveyItem = 'Continence'
				WHERE PatientId = Procedures.PatientId
				AND SurveyType = 'Urinary Function'
				AND SurveyDate > Procedures.ProcDate
				ORDER BY SurveyDate DESC
			)

		LEFT OUTER JOIN Surveys CS_C
			ON Continence_C.SurveyId = CS_C.SurveyId
			
		-- complications
		LEFT OUTER JOIN Toxicities
			ON Procedures.PatientId = Toxicities.PatientId
			AND DATEDIFF(day, Procedures.ProcDate, ToxDate) BETWEEN 0 AND 90

WHERE
    Patients.PatientId <> 29214
    AND Patients.PatientId = @PatientId
GROUP BY
	Patients.PatientId, Patients.PtBirthDate,
	SexualFunction.SurveyDate, EFS.SurveyDate, SexualFunction.SurveyResult, SexualFunction.SurveyTotal, ErectileFunction.SurveyItemResult,
	UrinaryFunction.SurveyDate, CS.SurveyDate, UrinaryFunction.SurveyResult, UrinaryFunction.SurveyTotal, Continence.SurveyItemResult,
	Patients.PtDeathDate,
	PP.PathExtension,
	Procedures.ProcInstitution,
	Enc_Followup.EncDate, SD.SurveyDate,
	Pathology.PathResult,
	Patients.PtMRN,
	ProstatectomyProc.ProcL_NVB_Status, ProstatectomyProc.ProcR_NVB_Status,
	PP.PathGG1, PP.PathGG2, PP.PathGGS,
	PSG.PathStageT,
	LabTests.LabResult,
	BCR.LabDate, 
	--BCR_MedTx.MedTxDate, BCR_RadTx.RadTxDate, -- fixes 'extra rows'
	LastPSA.LabDate,
	Procedures.ProcDate,
	Procedures.ProcSurgeon,
	PP.PathSV_Inv,
	SexualFunction_C.SurveyDate, EFS_C.SurveyDate, SexualFunction_C.SurveyResult, SexualFunction_C.SurveyTotal, ErectileFunction_C.SurveyItemResult,
	UrinaryFunction_C.SurveyDate, CS_C.SurveyDate, UrinaryFunction_C.SurveyResult, UrinaryFunction_C.SurveyTotal, Continence_C.SurveyItemResult,
	Procedures.ProcName,
	PP.PathMargin,
	OperatingRoomDetails.OpDuration, OperatingRoomDetails.OpEstBloodLoss, OperatingRoomDetails.OpAdmitDate, OperatingRoomDetails.OpDischargeDate,
	ProstateBiopsyPath.PathGGS,
	ClinicalStages.ClinStageT, ClinicalStages.ClinStageSystem,
	Patients.PtDeathDate, Patients.PtDeathType
	
ORDER BY 
    Patients.PatientId
";

        #endregion

        #region quarterly survey sql
        string quarterlySql =
            @"SELECT
	        -- patientid
	        Patients.PatientId AS patientid,
        	
	        '3 MONTH' AS contact,
        	
	        -- efpatient
	        CASE 
                WHEN COUNT(SexualItems.SurveyItemId) > 0 THEN
                    (SUM(CASE WHEN SexualItems.SurveyItemNum = '2' THEN CONVERT(int, SexualItems.SurveyItemResult) ELSE CONVERT(int, SexualItems.SurveyItemResult) - 1 END) / CONVERT(float, COUNT(SexualItems.SurveyItemId))) * 6
                ELSE NULL
            END AS efpatient,
            
	        -- efsurgeon
	        AVG(CASE RTRIM(LTRIM(ErectileFunction.SurveyItemResult))
		        WHEN '1' THEN 1
		        WHEN '1-2' THEN 1.5
        		
		        WHEN '2' THEN 2
		        WHEN '2.5' THEN 2.5
		        WHEN '2-3' THEN 2.5
        		
		        WHEN '3' THEN 3
		        WHEN '3-4' THEN 3.5
		        WHEN '3,4' THEN 3.5
        		
		        WHEN '4' THEN 4
		        WHEN '4-3' THEN 3.5
		        WHEN '4-5' THEN 4.5 
        		
		        WHEN '5' THEN 5
        		
		        ELSE NULL
	        END) AS efsurgeon,
	        --ErectileFunction.SurveyItemResult AS raw_efsurgeon,
        	
	        -- institution
	        CASE
		        WHEN Procedures.ProcInstitution LIKE 'MEMORIAL%SLOAN%KETTERING%' THEN 'MSKCC'
		        WHEN Procedures.ProcInstitution IN ('MEM', 'MSK', 'MSKCC') THEN 'MSKCC'
		        WHEN Procedures.ProcInstitution = 'OUT' THEN 'OUTSIDE'
		        WHEN Procedures.ProcInstitution = 'NEW YORK UNIVERSITY HOSPITAL' THEN 'NYU MEDICAL CENTER'
		        WHEN ISDATE(Procedures.ProcInstitution) = 1 THEN 'UNKNOWN'
		        ELSE UPPER(Procedures.ProcInstitution)
	        END AS institution,
	        Procedures.ProcInstitution AS raw_institution,
        	
	        -- mrn
	        Patients.PtMRN as mrn,
        	
	        -- patientassessdate
	        CONVERT(varchar, PatEF.SurveyDate, 101) as patientassessefdate,
	        CONVERT(varchar, PatUF.SurveyDate, 101) as patientassessufdate,
        	
	        -- surgeonassessdate
	        CONVERT(varchar, PhyEF.SurveyDate, 101) as surgeonassessefdate,
	        CONVERT(varchar, PhyUF.SurveyDate, 101) as surgeonassessufdate,
        	
	        -- ufpatient
	        CASE
                WHEN COUNT(UrinaryItems.SurveyItemId) > 0 THEN
                    21 - ((SUM(CONVERT(int, UrinaryItems.SurveyItemResult) - 1) / CONVERT(float, COUNT(UrinaryItems.SurveyItemId))) * 5)
                ELSE NULL
            END AS ufpatient,
            
	        -- ufsurgeon
	        AVG(CASE RTRIM(LTRIM(Continence.SurveyItemResult))
		        WHEN '1' THEN 1
		        WHEN '1- (2)' THEN 1.5
		        WHEN '1-2' THEN 1.5
        		
		        WHEN '2' THEN 2
		        WHEN '2-3' THEN 2.5
        		
		        WHEN '3' THEN 3
		        WHEN '3-4' THEN 3.5
        		
		        WHEN '4' THEN 4
		        WHEN '4-5' THEN 4.5
        		
		        WHEN '5' THEN 5
        		
		        WHEN 'Continent' THEN 1
		        ELSE NULL
	        END) AS ufsurgeon,
	        --Continence.SurveyItemResult AS raw_ufsurgeon,
        	
	        -- DIAGNOSTICS
	        CONVERT(varchar, Procedures.ProcDate, 101) as surgerydate,
        	
	        3 as sort

        FROM
	        Patients
		        INNER JOIN Procedures
			        ON Procedures.ProcedureId =
			        (
				        SELECT TOP 1 p.ProcedureId
				        FROM Procedures p
				        WHERE p.PatientId = Patients.PatientId
				        AND p.ProcName IN (
					        'CP','LP','LP_CONV','PP','RALP','RP','SalvCP','SalvLP','SalvRP'
				        )
				        --AND p.ProcDate BETWEEN '1/1/2005' AND '12/31/2010'
				        ORDER BY
					        CASE p.ProcQuality
						        WHEN 'RR' THEN 4
                                WHEN 'STD' THEN 3
                                WHEN 'REV' THEN 2
                                WHEN 'OUT' THEN 1
                                ELSE 0
					        END DESC
			        )
        		
		        LEFT OUTER JOIN Surveys PatEF
			        ON Patients.PatientId = PatEF.PatientId
			        AND PatEF.SurveyId =
			        (
				        SELECT TOP 1 s.SurveyId
					        FROM Surveys s
						        INNER JOIN SurveyItems i ON s.SurveyId = i.SurveyId
					        WHERE PatientId = Patients.PatientId
					        AND SurveyType = 'Prostate QOL Survey'
					        AND SurveyDate BETWEEN DATEADD(month, 2, Procedures.ProcDate) AND DATEADD(month, 4, Procedures.ProcDate)
					        AND SurveyItemNum IN ('2', '3', '4', '5', '6', '7')
					        AND SurveyItemResult NOT LIKE '%[^0123456789]%'
					        ORDER BY ABS(DATEDIFF(day, DATEADD(month, 3, Procedures.ProcDate), SurveyDate)), COALESCE(s.UpdatedTime, s.EnteredTime) DESC
			        )
        			
		        LEFT OUTER JOIN Surveys PatUF
			        ON Patients.PatientId = PatUF.PatientId
			        AND PatUF.SurveyId =
			        -- select survey in window has uf results and is closest to middle of window
			        (
				        SELECT TOP 1 s.SurveyId
				        FROM Surveys s
					        INNER JOIN SurveyItems i ON s.SurveyId = i.SurveyId
				        WHERE PatientId = Patients.PatientId
				        AND SurveyType = 'Prostate QOL Survey'
				        AND SurveyDate BETWEEN DATEADD(month, 2, Procedures.ProcDate) AND DATEADD(month, 4, Procedures.ProcDate)
				        AND SurveyItemNum IN ('8', '9', '10', '11', '12')
				        AND SurveyItemResult NOT LIKE '%[^0123456789]%'
				        ORDER BY ABS(DATEDIFF(day, DATEADD(month, 3, Procedures.ProcDate), SurveyDate)), COALESCE(s.UpdatedTime, s.EnteredTime) DESC
			        )
        			
		        LEFT OUTER JOIN SurveyItems SexualItems
                    ON PatEF.SurveyId = SexualItems.SurveyId
                    AND SexualItems.SurveyItemResult IS NOT NULL
                    AND IsNumeric(SexualItems.SurveyItemResult) = 1
                    AND SexualItems.SurveyItemNum IN ('2', '3', '4', '5', '6', '7')
                    AND SexualItems.SurveyItemResult NOT LIKE '%[^0123456789]%'
        			
		        LEFT OUTER JOIN  SurveyItems UrinaryItems
			        ON PatUF.SurveyId = UrinaryItems.SurveyId
			        AND UrinaryItems.SurveyItemResult IS NOT NULL
                    AND IsNumeric(UrinaryItems.SurveyItemResult) = 1
                    AND UrinaryItems.SurveyItemNum IN ('8', '9', '10', '11', '12')
                    AND UrinaryItems.SurveyItemResult NOT LIKE '%[^0123456789]%'
                    
        		
		         -- physician		
		        LEFT OUTER JOIN Surveys PhyUF
			        ON Patients.PatientId = PhyUF.PatientId
			        AND PhyUF.SurveyId = 
			        (
				        SELECT TOP 1 SurveyId
				        FROM Surveys
				        WHERE PatientId = Patients.PatientId
				        AND SurveyType = 'Urinary Function'
				        AND SurveyDate > Procedures.ProcDate
				        -- is this survey in the same window as the qol survey?
				        -- qol in [rp + 90x - 45, rp + 90x + 44]
				        AND SurveyDate BETWEEN DATEADD(month, 2, Procedures.ProcDate) AND DATEADD(month, 4, Procedures.ProcDate) 
				        ORDER BY ABS(DATEDIFF(day, DATEADD(month, 3, Procedures.ProcDate), SurveyDate)), COALESCE(UpdatedTime, EnteredTime) DESC
			        )
        			
		        LEFT OUTER JOIN SurveyItems Continence
			        ON PhyUF.SurveyId = Continence.SurveyId
			        AND Continence.SurveyItem = 'Continence'
        			
		        LEFT OUTER JOIN Surveys PhyEF
			        ON Patients.PatientId = PhyEF.PatientId
			        AND PhyEF.SurveyId = 
			        (
				        SELECT TOP 1 SurveyId
				        FROM Surveys
				        WHERE PatientId = Patients.PatientId
				        AND SurveyType = 'Sexual Function'
				        AND SurveyDate > Procedures.ProcDate
				        -- is this survey in the same window as the qol survey?
				        -- qol in [rp + 90x - 45, rp + 90x + 44]
				        AND SurveyDate BETWEEN DATEADD(month, 2, Procedures.ProcDate) AND DATEADD(month, 4, Procedures.ProcDate) 
				        ORDER BY ABS(DATEDIFF(day, DATEADD(month, 3, Procedures.ProcDate), SurveyDate)), COALESCE(UpdatedTime, EnteredTime) DESC
			        )
        			
		        LEFT OUTER JOIN SurveyItems ErectileFunction
			        ON PhyEF.SurveyId = ErectileFunction.SurveyId
			        AND ErectileFunction.SurveyItem = 'Erectile Function'
        WHERE
	        Patients.PatientId <> 29214 AND Patients.PatientId = @PatientId
        		
        GROUP BY
	        Patients.PatientId,
	        Procedures.ProcInstitution,
	        Patients.PtMRN,
	        Procedures.ProcDate,
	        PatEF.SurveyDate,
	        PatUF.SurveyDate,
	        --ErectileFunction.SurveyItemResult,
	        --Continence.SurveyItemResult,
	        PhyEF.SurveyDate,
	        PhyUF.SurveyDate
        	
        -- need at least one survey score
        HAVING 
	        PatEF.SurveyDate IS NOT NULL OR
	        PatUF.SurveyDate IS NOT NULL OR
	        PhyEF.SurveyDate IS NOT NULL OR
	        PhyUF.SurveyDate IS NOT NULL

        	
        UNION


        SELECT
	        -- patientid
	        Patients.PatientId AS patientid,
        	
	        '6 MONTH' AS contact,
        	
	        -- efpatient
	        CASE 
                WHEN COUNT(SexualItems.SurveyItemId) > 0 THEN
                    (SUM(CASE WHEN SexualItems.SurveyItemNum = '2' THEN CONVERT(int, SexualItems.SurveyItemResult) ELSE CONVERT(int, SexualItems.SurveyItemResult) - 1 END) / CONVERT(float, COUNT(SexualItems.SurveyItemId))) * 6
                ELSE NULL
            END AS efpatient,
            
	        -- efsurgeon
	        AVG(CASE RTRIM(LTRIM(ErectileFunction.SurveyItemResult))
		        WHEN '1' THEN 1
		        WHEN '1-2' THEN 1.5
        		
		        WHEN '2' THEN 2
		        WHEN '2.5' THEN 2.5
		        WHEN '2-3' THEN 2.5
        		
		        WHEN '3' THEN 3
		        WHEN '3-4' THEN 3.5
		        WHEN '3,4' THEN 3.5
        		
		        WHEN '4' THEN 4
		        WHEN '4-3' THEN 3.5
		        WHEN '4-5' THEN 4.5 
        		
		        WHEN '5' THEN 5
        		
		        ELSE NULL
	        END) AS efsurgeon,
	        --ErectileFunction.SurveyItemResult AS raw_efsurgeon,
        	
	        -- institution
	        CASE
		        WHEN Procedures.ProcInstitution LIKE 'MEMORIAL%SLOAN%KETTERING%' THEN 'MEMORIAL SLOAN KETTERING CANCER CENTER'
		        WHEN Procedures.ProcInstitution IN ('MEM', 'MSK', 'MSKCC') THEN 'MEMORIAL SLOAN KETTERING CANCER CENTER'
		        WHEN Procedures.ProcInstitution = 'OUT' THEN 'OUTSIDE'
		        WHEN Procedures.ProcInstitution = 'NEW YORK UNIVERSITY HOSPITAL' THEN 'NYU MEDICAL CENTER'
		        WHEN ISDATE(Procedures.ProcInstitution) = 1 THEN 'UNKNOWN'
		        ELSE UPPER(Procedures.ProcInstitution)
	        END AS institution,
	        Procedures.ProcInstitution AS raw_institution,
        	
	        -- mrn
	        Patients.PtMRN as mrn,
        	
	        -- patientassessdate
	        CONVERT(varchar, PatEF.SurveyDate, 101) as patientassessefdate,
	        CONVERT(varchar, PatUF.SurveyDate, 101) as patientassessufdate,
        	
	        -- surgeonassessdate
	        CONVERT(varchar, PhyEF.SurveyDate, 101) as surgeonassessefdate,
	        CONVERT(varchar, PhyUF.SurveyDate, 101) as surgeonassessufdate,
        	
	        -- ufpatient
	        CASE
                WHEN COUNT(UrinaryItems.SurveyItemId) > 0 THEN
                    21 - ((SUM(CONVERT(int, UrinaryItems.SurveyItemResult) - 1) / CONVERT(float, COUNT(UrinaryItems.SurveyItemId))) * 5)
                ELSE NULL
            END AS ufpatient,
	        -- ufsurgeon
	        AVG(CASE RTRIM(LTRIM(Continence.SurveyItemResult))
		        WHEN '1' THEN 1
		        WHEN '1- (2)' THEN 1.5
		        WHEN '1-2' THEN 1.5
        		
		        WHEN '2' THEN 2
		        WHEN '2-3' THEN 2.5
        		
		        WHEN '3' THEN 3
		        WHEN '3-4' THEN 3.5
        		
		        WHEN '4' THEN 4
		        WHEN '4-5' THEN 4.5
        		
		        WHEN '5' THEN 5
        		
		        WHEN 'Continent' THEN 1
		        ELSE NULL
	        END) AS ufsurgeon,
	        --Continence.SurveyItemResult AS raw_ufsurgeon,
        	
	        -- DIAGNOSTICS
	        CONVERT(varchar, Procedures.ProcDate, 101) as surgerydate,
        	
	        6 as sort

        FROM
	        Patients
		        INNER JOIN Procedures
			        ON Procedures.ProcedureId =
			        (
				        SELECT TOP 1 p.ProcedureId
				        FROM Procedures p
				        WHERE p.PatientId = Patients.PatientId
				        AND p.ProcName IN (
					        'CP','LP','LP_CONV','PP','RALP','RP','SalvCP','SalvLP','SalvRP'
				        )
				        --AND p.ProcDate BETWEEN '1/1/2005' AND '12/31/2010'
				        ORDER BY
					        CASE p.ProcQuality
						        WHEN 'RR' THEN 4
                                WHEN 'STD' THEN 3
                                WHEN 'REV' THEN 2
                                WHEN 'OUT' THEN 1
                                ELSE 0
					        END DESC
			        )
        		
		        LEFT OUTER JOIN Surveys PatEF
			        ON Patients.PatientId = PatEF.PatientId
			        AND PatEF.SurveyId =
			        (
				        SELECT TOP 1 s.SurveyId
					        FROM Surveys s
						        INNER JOIN SurveyItems i ON s.SurveyId = i.SurveyId
					        WHERE PatientId = Patients.PatientId
					        AND SurveyType = 'Prostate QOL Survey'
					        AND SurveyDate BETWEEN DATEADD(month, 5, Procedures.ProcDate) AND DATEADD(month, 7, Procedures.ProcDate)
					        AND SurveyItemNum IN ('2', '3', '4', '5', '6', '7')
					        AND SurveyItemResult NOT LIKE '%[^0123456789]%'
					        ORDER BY ABS(DATEDIFF(day, DATEADD(month, 6, Procedures.ProcDate), SurveyDate)), COALESCE(s.UpdatedTime, s.EnteredTime) DESC
			        )
        			
		        LEFT OUTER JOIN Surveys PatUF
			        ON Patients.PatientId = PatUF.PatientId
			        AND PatUF.SurveyId =
			        -- select survey in window has uf results and is closest to middle of window
			        (
				        SELECT TOP 1 s.SurveyId
				        FROM Surveys s
					        INNER JOIN SurveyItems i ON s.SurveyId = i.SurveyId
				        WHERE PatientId = Patients.PatientId
				        AND SurveyType = 'Prostate QOL Survey'
				        AND SurveyDate BETWEEN DATEADD(month, 5, Procedures.ProcDate) AND DATEADD(month, 7, Procedures.ProcDate)
				        AND SurveyItemNum IN ('8', '9', '10', '11', '12')
				        AND SurveyItemResult NOT LIKE '%[^0123456789]%'
				        ORDER BY ABS(DATEDIFF(day, DATEADD(month, 6, Procedures.ProcDate), SurveyDate)), COALESCE(s.UpdatedTime, s.EnteredTime) DESC
			        )
        			
		        LEFT OUTER JOIN SurveyItems SexualItems
                    ON PatEF.SurveyId = SexualItems.SurveyId
                    AND SexualItems.SurveyItemResult IS NOT NULL
                    AND IsNumeric(SexualItems.SurveyItemResult) = 1
                    AND SexualItems.SurveyItemNum IN ('2', '3', '4', '5', '6', '7')
                    AND SexualItems.SurveyItemResult NOT LIKE '%[^0123456789]%'
        			
		        LEFT OUTER JOIN  SurveyItems UrinaryItems
			        ON PatUF.SurveyId = UrinaryItems.SurveyId
			        AND UrinaryItems.SurveyItemResult IS NOT NULL
                    AND IsNumeric(UrinaryItems.SurveyItemResult) = 1
                    AND UrinaryItems.SurveyItemNum IN ('8', '9', '10', '11', '12')
                    AND UrinaryItems.SurveyItemResult NOT LIKE '%[^0123456789]%'
                    
        		
		         -- physician		
		        LEFT OUTER JOIN Surveys PhyUF
			        ON Patients.PatientId = PhyUF.PatientId
			        AND PhyUF.SurveyId = 
			        (
				        SELECT TOP 1 SurveyId
				        FROM Surveys
				        WHERE PatientId = Patients.PatientId
				        AND SurveyType = 'Urinary Function'
				        AND SurveyDate > Procedures.ProcDate
				        -- is this survey in the same window as the qol survey?
				        -- qol in [rp + 90x - 45, rp + 90x + 44]
				        AND SurveyDate BETWEEN DATEADD(month, 5, Procedures.ProcDate) AND DATEADD(month, 7, Procedures.ProcDate) 
				        ORDER BY ABS(DATEDIFF(day, DATEADD(month, 6, Procedures.ProcDate), SurveyDate)), COALESCE(UpdatedTime, EnteredTime) DESC
			        )
        			
		        LEFT OUTER JOIN SurveyItems Continence
			        ON PhyUF.SurveyId = Continence.SurveyId
			        AND Continence.SurveyItem = 'Continence'
        			
		        LEFT OUTER JOIN Surveys PhyEF
			        ON Patients.PatientId = PhyEF.PatientId
			        AND PhyEF.SurveyId = 
			        (
				        SELECT TOP 1 SurveyId
				        FROM Surveys
				        WHERE PatientId = Patients.PatientId
				        AND SurveyType = 'Sexual Function'
				        AND SurveyDate > Procedures.ProcDate
				        -- is this survey in the same window as the qol survey?
				        -- qol in [rp + 90x - 45, rp + 90x + 44]
				        AND SurveyDate BETWEEN DATEADD(month, 5, Procedures.ProcDate) AND DATEADD(month, 7, Procedures.ProcDate)
				        ORDER BY ABS(DATEDIFF(day, DATEADD(month, 6, Procedures.ProcDate), SurveyDate)), COALESCE(UpdatedTime, EnteredTime) DESC
			        )
        			
		        LEFT OUTER JOIN SurveyItems ErectileFunction
			        ON PhyEF.SurveyId = ErectileFunction.SurveyId
			        AND ErectileFunction.SurveyItem = 'Erectile Function'
        WHERE
	        Patients.PatientId <> 29214 AND Patients.PatientId = @PatientId
        		
        GROUP BY
	        Patients.PatientId,
	        Procedures.ProcInstitution,
	        Patients.PtMRN,
	        Procedures.ProcDate,
	        PatEF.SurveyDate,
	        PatUF.SurveyDate,
	        --ErectileFunction.SurveyItemResult,
	        --Continence.SurveyItemResult,
	        PhyEF.SurveyDate,
	        PhyUF.SurveyDate
        	
        -- need at least one survey score
        HAVING 
	        PatEF.SurveyDate IS NOT NULL OR
	        PatUF.SurveyDate IS NOT NULL OR
	        PhyEF.SurveyDate IS NOT NULL OR
	        PhyUF.SurveyDate IS NOT NULL
        	
        UNION
        	
        SELECT
	        -- patientid
	        Patients.PatientId AS patientid,
        	
	        '9 MONTH' AS contact,
        	
	        -- efpatient
	        CASE 
                WHEN COUNT(SexualItems.SurveyItemId) > 0 THEN
                    (SUM(CASE WHEN SexualItems.SurveyItemNum = '2' THEN CONVERT(int, SexualItems.SurveyItemResult) ELSE CONVERT(int, SexualItems.SurveyItemResult) - 1 END) / CONVERT(float, COUNT(SexualItems.SurveyItemId))) * 6
                ELSE NULL
            END AS efpatient,
            
	        -- efsurgeon
	        AVG(CASE RTRIM(LTRIM(ErectileFunction.SurveyItemResult))
		        WHEN '1' THEN 1
		        WHEN '1-2' THEN 1.5
        		
		        WHEN '2' THEN 2
		        WHEN '2.5' THEN 2.5
		        WHEN '2-3' THEN 2.5
        		
		        WHEN '3' THEN 3
		        WHEN '3-4' THEN 3.5
		        WHEN '3,4' THEN 3.5
        		
		        WHEN '4' THEN 4
		        WHEN '4-3' THEN 3.5
		        WHEN '4-5' THEN 4.5 
        		
		        WHEN '5' THEN 5
        		
		        ELSE NULL
	        END) AS efsurgeon,
	        --ErectileFunction.SurveyItemResult AS raw_efsurgeon,
        	
	        -- institution
	        CASE
		        WHEN Procedures.ProcInstitution LIKE 'MEMORIAL%SLOAN%KETTERING%' THEN 'MEMORIAL SLOAN KETTERING CANCER CENTER'
		        WHEN Procedures.ProcInstitution IN ('MEM', 'MSK', 'MSKCC') THEN 'MEMORIAL SLOAN KETTERING CANCER CENTER'
		        WHEN Procedures.ProcInstitution = 'OUT' THEN 'OUTSIDE'
		        WHEN Procedures.ProcInstitution = 'NEW YORK UNIVERSITY HOSPITAL' THEN 'NYU MEDICAL CENTER'
		        WHEN ISDATE(Procedures.ProcInstitution) = 1 THEN 'UNKNOWN'
		        ELSE UPPER(Procedures.ProcInstitution)
	        END AS institution,
	        Procedures.ProcInstitution AS raw_institution,
        	
	        -- mrn
	        Patients.PtMRN as mrn,
        	
	        -- patientassessdate
	        CONVERT(varchar, PatEF.SurveyDate, 101) as patientassessefdate,
	        CONVERT(varchar, PatUF.SurveyDate, 101) as patientassessufdate,
        	
	        -- surgeonassessdate
	        CONVERT(varchar, PhyEF.SurveyDate, 101) as surgeonassessefdate,
	        CONVERT(varchar, PhyUF.SurveyDate, 101) as surgeonassessufdate,
        	
	        -- ufpatient
	        CASE
                WHEN COUNT(UrinaryItems.SurveyItemId) > 0 THEN
                    21 - ((SUM(CONVERT(int, UrinaryItems.SurveyItemResult) - 1) / CONVERT(float, COUNT(UrinaryItems.SurveyItemId))) * 5)
                ELSE NULL
            END AS ufpatient,
	        -- ufsurgeon
	        AVG(CASE RTRIM(LTRIM(Continence.SurveyItemResult))
		        WHEN '1' THEN 1
		        WHEN '1- (2)' THEN 1.5
		        WHEN '1-2' THEN 1.5
        		
		        WHEN '2' THEN 2
		        WHEN '2-3' THEN 2.5
        		
		        WHEN '3' THEN 3
		        WHEN '3-4' THEN 3.5
        		
		        WHEN '4' THEN 4
		        WHEN '4-5' THEN 4.5
        		
		        WHEN '5' THEN 5
        		
		        WHEN 'Continent' THEN 1
		        ELSE NULL
	        END) AS ufsurgeon,
	        --Continence.SurveyItemResult AS raw_ufsurgeon,
        	
	        -- DIAGNOSTICS
	        CONVERT(varchar, Procedures.ProcDate, 101) as surgerydate,
        	
	        9 as sort

        FROM
	        Patients
		        INNER JOIN Procedures
			        ON Procedures.ProcedureId =
			        (
				        SELECT TOP 1 p.ProcedureId
				        FROM Procedures p
				        WHERE p.PatientId = Patients.PatientId
				        AND p.ProcName IN (
					        'CP','LP','LP_CONV','PP','RALP','RP','SalvCP','SalvLP','SalvRP'
				        )
				        --AND p.ProcDate BETWEEN '1/1/2005' AND '12/31/2010'
				        ORDER BY
					        CASE p.ProcQuality
						        WHEN 'RR' THEN 4
                                WHEN 'STD' THEN 3
                                WHEN 'REV' THEN 2
                                WHEN 'OUT' THEN 1
                                ELSE 0
					        END DESC
			        )
        		
		        LEFT OUTER JOIN Surveys PatEF
			        ON Patients.PatientId = PatEF.PatientId
			        AND PatEF.SurveyId =
			        (
				        SELECT TOP 1 s.SurveyId
					        FROM Surveys s
						        INNER JOIN SurveyItems i ON s.SurveyId = i.SurveyId
					        WHERE PatientId = Patients.PatientId
					        AND SurveyType = 'Prostate QOL Survey'
					        AND SurveyDate BETWEEN DATEADD(month, 8, Procedures.ProcDate) AND DATEADD(month, 10, Procedures.ProcDate)
					        AND SurveyItemNum IN ('2', '3', '4', '5', '6', '7')
					        AND SurveyItemResult NOT LIKE '%[^0123456789]%'
					        ORDER BY ABS(DATEDIFF(day, DATEADD(month, 9, Procedures.ProcDate), SurveyDate)), COALESCE(s.UpdatedTime, s.EnteredTime) DESC
			        )
        			
		        LEFT OUTER JOIN Surveys PatUF
			        ON Patients.PatientId = PatUF.PatientId
			        AND PatUF.SurveyId =
			        -- select survey in window has uf results and is closest to middle of window
			        (
				        SELECT TOP 1 s.SurveyId
				        FROM Surveys s
					        INNER JOIN SurveyItems i ON s.SurveyId = i.SurveyId
				        WHERE PatientId = Patients.PatientId
				        AND SurveyType = 'Prostate QOL Survey'
				        AND SurveyDate BETWEEN DATEADD(month, 8, Procedures.ProcDate) AND DATEADD(month, 10, Procedures.ProcDate)
				        AND SurveyItemNum IN ('8', '9', '10', '11', '12')
				        AND SurveyItemResult NOT LIKE '%[^0123456789]%'
				        ORDER BY ABS(DATEDIFF(day, DATEADD(month, 9, Procedures.ProcDate), SurveyDate)), COALESCE(s.UpdatedTime, s.EnteredTime) DESC
			        )
        			
		        LEFT OUTER JOIN SurveyItems SexualItems
                    ON PatEF.SurveyId = SexualItems.SurveyId
                    AND SexualItems.SurveyItemResult IS NOT NULL
                    AND IsNumeric(SexualItems.SurveyItemResult) = 1
                    AND SexualItems.SurveyItemNum IN ('2', '3', '4', '5', '6', '7')
                    AND SexualItems.SurveyItemResult NOT LIKE '%[^0123456789]%'
        			
		        LEFT OUTER JOIN  SurveyItems UrinaryItems
			        ON PatUF.SurveyId = UrinaryItems.SurveyId
			        AND UrinaryItems.SurveyItemResult IS NOT NULL
                    AND IsNumeric(UrinaryItems.SurveyItemResult) = 1
                    AND UrinaryItems.SurveyItemNum IN ('8', '9', '10', '11', '12')
                    AND UrinaryItems.SurveyItemResult NOT LIKE '%[^0123456789]%'
                    
        		
		         -- physician		
		        LEFT OUTER JOIN Surveys PhyUF
			        ON Patients.PatientId = PhyUF.PatientId
			        AND PhyUF.SurveyId = 
			        (
				        SELECT TOP 1 SurveyId
				        FROM Surveys
				        WHERE PatientId = Patients.PatientId
				        AND SurveyType = 'Urinary Function'
				        AND SurveyDate > Procedures.ProcDate
				        -- is this survey in the same window as the qol survey?
				        -- qol in [rp + 90x - 45, rp + 90x + 44]
				        AND SurveyDate BETWEEN DATEADD(month, 8, Procedures.ProcDate) AND DATEADD(month, 10, Procedures.ProcDate) 
				        ORDER BY ABS(DATEDIFF(day, DATEADD(month, 9, Procedures.ProcDate), SurveyDate)), COALESCE(UpdatedTime, EnteredTime) DESC
			        )
        			
		        LEFT OUTER JOIN SurveyItems Continence
			        ON PhyUF.SurveyId = Continence.SurveyId
			        AND Continence.SurveyItem = 'Continence'
        			
		        LEFT OUTER JOIN Surveys PhyEF
			        ON Patients.PatientId = PhyEF.PatientId
			        AND PhyEF.SurveyId = 
			        (
				        SELECT TOP 1 SurveyId
				        FROM Surveys
				        WHERE PatientId = Patients.PatientId
				        AND SurveyType = 'Sexual Function'
				        AND SurveyDate > Procedures.ProcDate
				        -- is this survey in the same window as the qol survey?
				        -- qol in [rp + 90x - 45, rp + 90x + 44]
				        AND SurveyDate BETWEEN DATEADD(month, 8, Procedures.ProcDate) AND DATEADD(month, 10, Procedures.ProcDate)
				        ORDER BY ABS(DATEDIFF(day, DATEADD(month, 9, Procedures.ProcDate), SurveyDate)), COALESCE(UpdatedTime, EnteredTime) DESC
			        )
        			
		        LEFT OUTER JOIN SurveyItems ErectileFunction
			        ON PhyEF.SurveyId = ErectileFunction.SurveyId
			        AND ErectileFunction.SurveyItem = 'Erectile Function'
        WHERE
	        Patients.PatientId <> 29214 AND Patients.PatientId = @PatientId
        		
        GROUP BY
	        Patients.PatientId,
	        Procedures.ProcInstitution,
	        Patients.PtMRN,
	        Procedures.ProcDate,
	        PatEF.SurveyDate,
	        PatUF.SurveyDate,
	        --ErectileFunction.SurveyItemResult,
	        --Continence.SurveyItemResult,
	        PhyEF.SurveyDate,
	        PhyUF.SurveyDate
        	
        -- need at least one survey score
        HAVING 
	        PatEF.SurveyDate IS NOT NULL OR
	        PatUF.SurveyDate IS NOT NULL OR
	        PhyEF.SurveyDate IS NOT NULL OR
	        PhyUF.SurveyDate IS NOT NULL

        UNION

        SELECT
	        -- patientid
	        Patients.PatientId AS patientid,
        	
	        '12 MONTH' AS contact,
        	
	        -- efpatient
	        CASE 
                WHEN COUNT(SexualItems.SurveyItemId) > 0 THEN
                    (SUM(CASE WHEN SexualItems.SurveyItemNum = '2' THEN CONVERT(int, SexualItems.SurveyItemResult) ELSE CONVERT(int, SexualItems.SurveyItemResult) - 1 END) / CONVERT(float, COUNT(SexualItems.SurveyItemId))) * 6
                ELSE NULL
            END AS efpatient,
            
	        -- efsurgeon
	        AVG(CASE RTRIM(LTRIM(ErectileFunction.SurveyItemResult))
		        WHEN '1' THEN 1
		        WHEN '1-2' THEN 1.5
        		
		        WHEN '2' THEN 2
		        WHEN '2.5' THEN 2.5
		        WHEN '2-3' THEN 2.5
        		
		        WHEN '3' THEN 3
		        WHEN '3-4' THEN 3.5
		        WHEN '3,4' THEN 3.5
        		
		        WHEN '4' THEN 4
		        WHEN '4-3' THEN 3.5
		        WHEN '4-5' THEN 4.5 
        		
		        WHEN '5' THEN 5
        		
		        ELSE NULL
	        END) AS efsurgeon,
	        --ErectileFunction.SurveyItemResult AS raw_efsurgeon,
        	
	        -- institution
	        CASE
		        WHEN Procedures.ProcInstitution LIKE 'MEMORIAL%SLOAN%KETTERING%' THEN 'MEMORIAL SLOAN KETTERING CANCER CENTER'
		        WHEN Procedures.ProcInstitution IN ('MEM', 'MSK', 'MSKCC') THEN 'MEMORIAL SLOAN KETTERING CANCER CENTER'
		        WHEN Procedures.ProcInstitution = 'OUT' THEN 'OUTSIDE'
		        WHEN Procedures.ProcInstitution = 'NEW YORK UNIVERSITY HOSPITAL' THEN 'NYU MEDICAL CENTER'
		        WHEN ISDATE(Procedures.ProcInstitution) = 1 THEN 'UNKNOWN'
		        ELSE UPPER(Procedures.ProcInstitution)
	        END AS institution,
	        Procedures.ProcInstitution AS raw_institution,
        	
	        -- mrn
	        Patients.PtMRN as mrn,
        	
	        -- patientassessdate
	        CONVERT(varchar, PatEF.SurveyDate, 101) as patientassessefdate,
	        CONVERT(varchar, PatUF.SurveyDate, 101) as patientassessufdate,
        	
	        -- surgeonassessdate
	        CONVERT(varchar, PhyEF.SurveyDate, 101) as surgeonassessefdate,
	        CONVERT(varchar, PhyUF.SurveyDate, 101) as surgeonassessufdate,
        	
	        -- ufpatient
	        CASE
                WHEN COUNT(UrinaryItems.SurveyItemId) > 0 THEN
                    21 - ((SUM(CONVERT(int, UrinaryItems.SurveyItemResult) - 1) / CONVERT(float, COUNT(UrinaryItems.SurveyItemId))) * 5)
                ELSE NULL
            END AS ufpatient,
	        -- ufsurgeon
	        AVG(CASE RTRIM(LTRIM(Continence.SurveyItemResult))
		        WHEN '1' THEN 1
		        WHEN '1- (2)' THEN 1.5
		        WHEN '1-2' THEN 1.5
        		
		        WHEN '2' THEN 2
		        WHEN '2-3' THEN 2.5
        		
		        WHEN '3' THEN 3
		        WHEN '3-4' THEN 3.5
        		
		        WHEN '4' THEN 4
		        WHEN '4-5' THEN 4.5
        		
		        WHEN '5' THEN 5
        		
		        WHEN 'Continent' THEN 1
		        ELSE NULL
	        END) AS ufsurgeon,
	        --Continence.SurveyItemResult AS raw_ufsurgeon,
        	
	        -- DIAGNOSTICS
	        CONVERT(varchar, Procedures.ProcDate, 101) as surgerydate,
        	
	        12 as sort

        FROM
	        Patients
		        INNER JOIN Procedures
			        ON Procedures.ProcedureId =
			        (
				        SELECT TOP 1 p.ProcedureId
				        FROM Procedures p
				        WHERE p.PatientId = Patients.PatientId
				        AND p.ProcName IN (
					        'CP','LP','LP_CONV','PP','RALP','RP','SalvCP','SalvLP','SalvRP'
				        )
				        --AND p.ProcDate BETWEEN '1/1/2005' AND '12/31/2010'
				        ORDER BY
					        CASE p.ProcQuality
						        WHEN 'RR' THEN 4
                                WHEN 'STD' THEN 3
                                WHEN 'REV' THEN 2
                                WHEN 'OUT' THEN 1
                                ELSE 0
					        END DESC
			        )
        		
		        LEFT OUTER JOIN Surveys PatEF
			        ON Patients.PatientId = PatEF.PatientId
			        AND PatEF.SurveyId =
			        (
				        SELECT TOP 1 s.SurveyId
					        FROM Surveys s
						        INNER JOIN SurveyItems i ON s.SurveyId = i.SurveyId
					        WHERE PatientId = Patients.PatientId
					        AND SurveyType = 'Prostate QOL Survey'
					        AND SurveyDate BETWEEN DATEADD(month, 10, Procedures.ProcDate) AND DATEADD(month, 14, Procedures.ProcDate)
					        AND SurveyItemNum IN ('2', '3', '4', '5', '6', '7')
					        AND SurveyItemResult NOT LIKE '%[^0123456789]%'
					        ORDER BY ABS(DATEDIFF(day, DATEADD(month, 12, Procedures.ProcDate), SurveyDate)), COALESCE(s.UpdatedTime, s.EnteredTime) DESC
			        )
        			
		        LEFT OUTER JOIN Surveys PatUF
			        ON Patients.PatientId = PatUF.PatientId
			        AND PatUF.SurveyId =
			        -- select survey in window has uf results and is closest to middle of window
			        (
				        SELECT TOP 1 s.SurveyId
				        FROM Surveys s
					        INNER JOIN SurveyItems i ON s.SurveyId = i.SurveyId
				        WHERE PatientId = Patients.PatientId
				        AND SurveyType = 'Prostate QOL Survey'
				        AND SurveyDate BETWEEN DATEADD(month, 10, Procedures.ProcDate) AND DATEADD(month, 14, Procedures.ProcDate)
				        AND SurveyItemNum IN ('8', '9', '10', '11', '12')
				        AND SurveyItemResult NOT LIKE '%[^0123456789]%'
				        ORDER BY ABS(DATEDIFF(day, DATEADD(month, 12, Procedures.ProcDate), SurveyDate)), COALESCE(s.UpdatedTime, s.EnteredTime) DESC
			        )
        			
		        LEFT OUTER JOIN SurveyItems SexualItems
                    ON PatEF.SurveyId = SexualItems.SurveyId
                    AND SexualItems.SurveyItemResult IS NOT NULL
                    AND IsNumeric(SexualItems.SurveyItemResult) = 1
                    AND SexualItems.SurveyItemNum IN ('2', '3', '4', '5', '6', '7')
                    AND SexualItems.SurveyItemResult NOT LIKE '%[^0123456789]%'
        			
		        LEFT OUTER JOIN  SurveyItems UrinaryItems
			        ON PatUF.SurveyId = UrinaryItems.SurveyId
			        AND UrinaryItems.SurveyItemResult IS NOT NULL
                    AND IsNumeric(UrinaryItems.SurveyItemResult) = 1
                    AND UrinaryItems.SurveyItemNum IN ('8', '9', '10', '11', '12')
                    AND UrinaryItems.SurveyItemResult NOT LIKE '%[^0123456789]%'
                    
        		
		         -- physician		
		        LEFT OUTER JOIN Surveys PhyUF
			        ON Patients.PatientId = PhyUF.PatientId
			        AND PhyUF.SurveyId = 
			        (
				        SELECT TOP 1 SurveyId
				        FROM Surveys
				        WHERE PatientId = Patients.PatientId
				        AND SurveyType = 'Urinary Function'
				        AND SurveyDate > Procedures.ProcDate
				        -- is this survey in the same window as the qol survey?
				        -- qol in [rp + 90x - 45, rp + 90x + 44]
				        AND SurveyDate BETWEEN DATEADD(month, 10, Procedures.ProcDate) AND DATEADD(month, 14, Procedures.ProcDate) 
				        ORDER BY ABS(DATEDIFF(day, DATEADD(month, 12, Procedures.ProcDate), SurveyDate)), COALESCE(UpdatedTime, EnteredTime) DESC
			        )
        			
		        LEFT OUTER JOIN SurveyItems Continence
			        ON PhyUF.SurveyId = Continence.SurveyId
			        AND Continence.SurveyItem = 'Continence'
        			
		        LEFT OUTER JOIN Surveys PhyEF
			        ON Patients.PatientId = PhyEF.PatientId
			        AND PhyEF.SurveyId = 
			        (
				        SELECT TOP 1 SurveyId
				        FROM Surveys
				        WHERE PatientId = Patients.PatientId
				        AND SurveyType = 'Sexual Function'
				        AND SurveyDate > Procedures.ProcDate
				        -- is this survey in the same window as the qol survey?
				        -- qol in [rp + 90x - 45, rp + 90x + 44]
				        AND SurveyDate BETWEEN DATEADD(month, 10, Procedures.ProcDate) AND DATEADD(month, 14, Procedures.ProcDate)
				        ORDER BY ABS(DATEDIFF(day, DATEADD(month, 12, Procedures.ProcDate), SurveyDate)), COALESCE(UpdatedTime, EnteredTime) DESC
			        )
        			
		        LEFT OUTER JOIN SurveyItems ErectileFunction
			        ON PhyEF.SurveyId = ErectileFunction.SurveyId
			        AND ErectileFunction.SurveyItem = 'Erectile Function'
        WHERE
	        Patients.PatientId <> 29214 AND Patients.PatientId = @PatientId
        		
        GROUP BY
	        Patients.PatientId,
	        Procedures.ProcInstitution,
	        Patients.PtMRN,
	        Procedures.ProcDate,
	        PatEF.SurveyDate,
	        PatUF.SurveyDate,
	        --ErectileFunction.SurveyItemResult,
	        --Continence.SurveyItemResult,
	        PhyEF.SurveyDate,
	        PhyUF.SurveyDate
        	
        -- need at least one survey score
        HAVING 
	        PatEF.SurveyDate IS NOT NULL OR
	        PatUF.SurveyDate IS NOT NULL OR
	        PhyEF.SurveyDate IS NOT NULL OR
	        PhyUF.SurveyDate IS NOT NULL
        	
        UNION

        SELECT
	        -- patientid
	        Patients.PatientId AS patientid,
        	
	        '15 MONTH' AS contact,
        	
	        -- efpatient
	        CASE 
                WHEN COUNT(SexualItems.SurveyItemId) > 0 THEN
                    (SUM(CASE WHEN SexualItems.SurveyItemNum = '2' THEN CONVERT(int, SexualItems.SurveyItemResult) ELSE CONVERT(int, SexualItems.SurveyItemResult) - 1 END) / CONVERT(float, COUNT(SexualItems.SurveyItemId))) * 6
                ELSE NULL
            END AS efpatient,
            
	        -- efsurgeon
	        AVG(CASE RTRIM(LTRIM(ErectileFunction.SurveyItemResult))
		        WHEN '1' THEN 1
		        WHEN '1-2' THEN 1.5
        		
		        WHEN '2' THEN 2
		        WHEN '2.5' THEN 2.5
		        WHEN '2-3' THEN 2.5
        		
		        WHEN '3' THEN 3
		        WHEN '3-4' THEN 3.5
		        WHEN '3,4' THEN 3.5
        		
		        WHEN '4' THEN 4
		        WHEN '4-3' THEN 3.5
		        WHEN '4-5' THEN 4.5 
        		
		        WHEN '5' THEN 5
        		
		        ELSE NULL
	        END) AS efsurgeon,
	        --ErectileFunction.SurveyItemResult AS raw_efsurgeon,
        	
	        -- institution
	        CASE
		        WHEN Procedures.ProcInstitution LIKE 'MEMORIAL%SLOAN%KETTERING%' THEN 'MEMORIAL SLOAN KETTERING CANCER CENTER'
		        WHEN Procedures.ProcInstitution IN ('MEM', 'MSK', 'MSKCC') THEN 'MEMORIAL SLOAN KETTERING CANCER CENTER'
		        WHEN Procedures.ProcInstitution = 'OUT' THEN 'OUTSIDE'
		        WHEN Procedures.ProcInstitution = 'NEW YORK UNIVERSITY HOSPITAL' THEN 'NYU MEDICAL CENTER'
		        WHEN ISDATE(Procedures.ProcInstitution) = 1 THEN 'UNKNOWN'
		        ELSE UPPER(Procedures.ProcInstitution)
	        END AS institution,
	        Procedures.ProcInstitution AS raw_institution,
        	
	        -- mrn
	        Patients.PtMRN as mrn,
        	
	        -- patientassessdate
	        CONVERT(varchar, PatEF.SurveyDate, 101) as patientassessefdate,
	        CONVERT(varchar, PatUF.SurveyDate, 101) as patientassessufdate,
        	
	        -- surgeonassessdate
	        CONVERT(varchar, PhyEF.SurveyDate, 101) as surgeonassessefdate,
	        CONVERT(varchar, PhyUF.SurveyDate, 101) as surgeonassessufdate,
        	
	        -- ufpatient
	        CASE
                WHEN COUNT(UrinaryItems.SurveyItemId) > 0 THEN
                    21 - ((SUM(CONVERT(int, UrinaryItems.SurveyItemResult) - 1) / CONVERT(float, COUNT(UrinaryItems.SurveyItemId))) * 5)
                ELSE NULL
            END AS ufpatient,
	        -- ufsurgeon
	        AVG(CASE RTRIM(LTRIM(Continence.SurveyItemResult))
		        WHEN '1' THEN 1
		        WHEN '1- (2)' THEN 1.5
		        WHEN '1-2' THEN 1.5
        		
		        WHEN '2' THEN 2
		        WHEN '2-3' THEN 2.5
        		
		        WHEN '3' THEN 3
		        WHEN '3-4' THEN 3.5
        		
		        WHEN '4' THEN 4
		        WHEN '4-5' THEN 4.5
        		
		        WHEN '5' THEN 5
        		
		        WHEN 'Continent' THEN 1
		        ELSE NULL
	        END) AS ufsurgeon,
	        --Continence.SurveyItemResult AS raw_ufsurgeon,
        	
	        -- DIAGNOSTICS
	        CONVERT(varchar, Procedures.ProcDate, 101) as surgerydate,
        	
	        15 as sort

        FROM
	        Patients
		        INNER JOIN Procedures
			        ON Procedures.ProcedureId =
			        (
				        SELECT TOP 1 p.ProcedureId
				        FROM Procedures p
				        WHERE p.PatientId = Patients.PatientId
				        AND p.ProcName IN (
					        'CP','LP','LP_CONV','PP','RALP','RP','SalvCP','SalvLP','SalvRP'
				        )
				        --AND p.ProcDate BETWEEN '1/1/2005' AND '12/31/2010'
				        ORDER BY
					        CASE p.ProcQuality
						        WHEN 'RR' THEN 4
                                WHEN 'STD' THEN 3
                                WHEN 'REV' THEN 2
                                WHEN 'OUT' THEN 1
                                ELSE 0
					        END DESC
			        )
        		
		        LEFT OUTER JOIN Surveys PatEF
			        ON Patients.PatientId = PatEF.PatientId
			        AND PatEF.SurveyId =
			        (
				        SELECT TOP 1 s.SurveyId
					        FROM Surveys s
						        INNER JOIN SurveyItems i ON s.SurveyId = i.SurveyId
					        WHERE PatientId = Patients.PatientId
					        AND SurveyType = 'Prostate QOL Survey'
					        AND SurveyDate BETWEEN DATEADD(month, 13, Procedures.ProcDate) AND DATEADD(month, 17, Procedures.ProcDate)
					        AND SurveyItemNum IN ('2', '3', '4', '5', '6', '7')
					        AND SurveyItemResult NOT LIKE '%[^0123456789]%'
					        ORDER BY ABS(DATEDIFF(day, DATEADD(month, 15, Procedures.ProcDate), SurveyDate)), COALESCE(s.UpdatedTime, s.EnteredTime) DESC
			        )
        			
		        LEFT OUTER JOIN Surveys PatUF
			        ON Patients.PatientId = PatUF.PatientId
			        AND PatUF.SurveyId =
			        -- select survey in window has uf results and is closest to middle of window
			        (
				        SELECT TOP 1 s.SurveyId
				        FROM Surveys s
					        INNER JOIN SurveyItems i ON s.SurveyId = i.SurveyId
				        WHERE PatientId = Patients.PatientId
				        AND SurveyType = 'Prostate QOL Survey'
				        AND SurveyDate BETWEEN DATEADD(month, 13, Procedures.ProcDate) AND DATEADD(month, 17, Procedures.ProcDate)
				        AND SurveyItemNum IN ('8', '9', '10', '11', '12')
				        AND SurveyItemResult NOT LIKE '%[^0123456789]%'
				        ORDER BY ABS(DATEDIFF(day, DATEADD(month, 15, Procedures.ProcDate), SurveyDate)), COALESCE(s.UpdatedTime, s.EnteredTime) DESC
			        )
        			
		        LEFT OUTER JOIN SurveyItems SexualItems
                    ON PatEF.SurveyId = SexualItems.SurveyId
                    AND SexualItems.SurveyItemResult IS NOT NULL
                    AND IsNumeric(SexualItems.SurveyItemResult) = 1
                    AND SexualItems.SurveyItemNum IN ('2', '3', '4', '5', '6', '7')
                    AND SexualItems.SurveyItemResult NOT LIKE '%[^0123456789]%'
        			
		        LEFT OUTER JOIN  SurveyItems UrinaryItems
			        ON PatUF.SurveyId = UrinaryItems.SurveyId
			        AND UrinaryItems.SurveyItemResult IS NOT NULL
                    AND IsNumeric(UrinaryItems.SurveyItemResult) = 1
                    AND UrinaryItems.SurveyItemNum IN ('8', '9', '10', '11', '12')
                    AND UrinaryItems.SurveyItemResult NOT LIKE '%[^0123456789]%'
                    
        		
		         -- physician		
		        LEFT OUTER JOIN Surveys PhyUF
			        ON Patients.PatientId = PhyUF.PatientId
			        AND PhyUF.SurveyId = 
			        (
				        SELECT TOP 1 SurveyId
				        FROM Surveys
				        WHERE PatientId = Patients.PatientId
				        AND SurveyType = 'Urinary Function'
				        AND SurveyDate > Procedures.ProcDate
				        -- is this survey in the same window as the qol survey?
				        -- qol in [rp + 90x - 45, rp + 90x + 44]
				        AND SurveyDate BETWEEN DATEADD(month, 13, Procedures.ProcDate) AND DATEADD(month, 17, Procedures.ProcDate) 
				        ORDER BY ABS(DATEDIFF(day, DATEADD(month, 15, Procedures.ProcDate), SurveyDate)), COALESCE(UpdatedTime, EnteredTime) DESC
			        )
        			
		        LEFT OUTER JOIN SurveyItems Continence
			        ON PhyUF.SurveyId = Continence.SurveyId
			        AND Continence.SurveyItem = 'Continence'
        			
		        LEFT OUTER JOIN Surveys PhyEF
			        ON Patients.PatientId = PhyEF.PatientId
			        AND PhyEF.SurveyId = 
			        (
				        SELECT TOP 1 SurveyId
				        FROM Surveys
				        WHERE PatientId = Patients.PatientId
				        AND SurveyType = 'Sexual Function'
				        AND SurveyDate > Procedures.ProcDate
				        -- is this survey in the same window as the qol survey?
				        -- qol in [rp + 90x - 45, rp + 90x + 44]
				        AND SurveyDate BETWEEN DATEADD(month, 13, Procedures.ProcDate) AND DATEADD(month, 17, Procedures.ProcDate)
				        ORDER BY ABS(DATEDIFF(day, DATEADD(month, 15, Procedures.ProcDate), SurveyDate)), COALESCE(UpdatedTime, EnteredTime) DESC
			        )
        			
		        LEFT OUTER JOIN SurveyItems ErectileFunction
			        ON PhyEF.SurveyId = ErectileFunction.SurveyId
			        AND ErectileFunction.SurveyItem = 'Erectile Function'
        WHERE
	        Patients.PatientId <> 29214 AND Patients.PatientId = @PatientId
        		
        GROUP BY
	        Patients.PatientId,
	        Procedures.ProcInstitution,
	        Patients.PtMRN,
	        Procedures.ProcDate,
	        PatEF.SurveyDate,
	        PatUF.SurveyDate,
	        --ErectileFunction.SurveyItemResult,
	        --Continence.SurveyItemResult,
	        PhyEF.SurveyDate,
	        PhyUF.SurveyDate
        	
        -- need at least one survey score
        HAVING 
	        PatEF.SurveyDate IS NOT NULL OR
	        PatUF.SurveyDate IS NOT NULL OR
	        PhyEF.SurveyDate IS NOT NULL OR
	        PhyUF.SurveyDate IS NOT NULL

        UNION

        SELECT
	        -- patientid
	        Patients.PatientId AS patientid,
        	
	        '18 MONTH' AS contact,
        	
	        -- efpatient
	        CASE 
                WHEN COUNT(SexualItems.SurveyItemId) > 0 THEN
                    (SUM(CASE WHEN SexualItems.SurveyItemNum = '2' THEN CONVERT(int, SexualItems.SurveyItemResult) ELSE CONVERT(int, SexualItems.SurveyItemResult) - 1 END) / CONVERT(float, COUNT(SexualItems.SurveyItemId))) * 6
                ELSE NULL
            END AS efpatient,
            
	        -- efsurgeon
	        AVG(CASE RTRIM(LTRIM(ErectileFunction.SurveyItemResult))
		        WHEN '1' THEN 1
		        WHEN '1-2' THEN 1.5
        		
		        WHEN '2' THEN 2
		        WHEN '2.5' THEN 2.5
		        WHEN '2-3' THEN 2.5
        		
		        WHEN '3' THEN 3
		        WHEN '3-4' THEN 3.5
		        WHEN '3,4' THEN 3.5
        		
		        WHEN '4' THEN 4
		        WHEN '4-3' THEN 3.5
		        WHEN '4-5' THEN 4.5 
        		
		        WHEN '5' THEN 5
        		
		        ELSE NULL
	        END) AS efsurgeon,
	        --ErectileFunction.SurveyItemResult AS raw_efsurgeon,
        	
	        -- institution
	        CASE
		        WHEN Procedures.ProcInstitution LIKE 'MEMORIAL%SLOAN%KETTERING%' THEN 'MEMORIAL SLOAN KETTERING CANCER CENTER'
		        WHEN Procedures.ProcInstitution IN ('MEM', 'MSK', 'MSKCC') THEN 'MEMORIAL SLOAN KETTERING CANCER CENTER'
		        WHEN Procedures.ProcInstitution = 'OUT' THEN 'OUTSIDE'
		        WHEN Procedures.ProcInstitution = 'NEW YORK UNIVERSITY HOSPITAL' THEN 'NYU MEDICAL CENTER'
		        WHEN ISDATE(Procedures.ProcInstitution) = 1 THEN 'UNKNOWN'
		        ELSE UPPER(Procedures.ProcInstitution)
	        END AS institution,
	        Procedures.ProcInstitution AS raw_institution,
        	
	        -- mrn
	        Patients.PtMRN as mrn,
        	
	        -- patientassessdate
	        CONVERT(varchar, PatEF.SurveyDate, 101) as patientassessefdate,
	        CONVERT(varchar, PatUF.SurveyDate, 101) as patientassessufdate,
        	
	        -- surgeonassessdate
	        CONVERT(varchar, PhyEF.SurveyDate, 101) as surgeonassessefdate,
	        CONVERT(varchar, PhyUF.SurveyDate, 101) as surgeonassessufdate,
        	
	        -- ufpatient
	        CASE
                WHEN COUNT(UrinaryItems.SurveyItemId) > 0 THEN
                    21 - ((SUM(CONVERT(int, UrinaryItems.SurveyItemResult) - 1) / CONVERT(float, COUNT(UrinaryItems.SurveyItemId))) * 5)
                ELSE NULL
            END AS ufpatient,
	        -- ufsurgeon
	        AVG(CASE RTRIM(LTRIM(Continence.SurveyItemResult))
		        WHEN '1' THEN 1
		        WHEN '1- (2)' THEN 1.5
		        WHEN '1-2' THEN 1.5
        		
		        WHEN '2' THEN 2
		        WHEN '2-3' THEN 2.5
        		
		        WHEN '3' THEN 3
		        WHEN '3-4' THEN 3.5
        		
		        WHEN '4' THEN 4
		        WHEN '4-5' THEN 4.5
        		
		        WHEN '5' THEN 5
        		
		        WHEN 'Continent' THEN 1
		        ELSE NULL
	        END) AS ufsurgeon,
	        --Continence.SurveyItemResult AS raw_ufsurgeon,
        	
	        -- DIAGNOSTICS
	        CONVERT(varchar, Procedures.ProcDate, 101) as surgerydate,
        	
	        18 as sort

        FROM
	        Patients
		        INNER JOIN Procedures
			        ON Procedures.ProcedureId =
			        (
				        SELECT TOP 1 p.ProcedureId
				        FROM Procedures p
				        WHERE p.PatientId = Patients.PatientId
				        AND p.ProcName IN (
					        'CP','LP','LP_CONV','PP','RALP','RP','SalvCP','SalvLP','SalvRP'
				        )
				        --AND p.ProcDate BETWEEN '1/1/2005' AND '12/31/2010'
				        ORDER BY
					        CASE p.ProcQuality
						        WHEN 'RR' THEN 4
                                WHEN 'STD' THEN 3
                                WHEN 'REV' THEN 2
                                WHEN 'OUT' THEN 1
                                ELSE 0
					        END DESC
			        )
        		
		        LEFT OUTER JOIN Surveys PatEF
			        ON Patients.PatientId = PatEF.PatientId
			        AND PatEF.SurveyId =
			        (
				        SELECT TOP 1 s.SurveyId
					        FROM Surveys s
						        INNER JOIN SurveyItems i ON s.SurveyId = i.SurveyId
					        WHERE PatientId = Patients.PatientId
					        AND SurveyType = 'Prostate QOL Survey'
					        AND SurveyDate BETWEEN DATEADD(month, 16, Procedures.ProcDate) AND DATEADD(month, 20, Procedures.ProcDate)
					        AND SurveyItemNum IN ('2', '3', '4', '5', '6', '7')
					        AND SurveyItemResult NOT LIKE '%[^0123456789]%'
					        ORDER BY ABS(DATEDIFF(day, DATEADD(month, 18, Procedures.ProcDate), SurveyDate)), COALESCE(s.UpdatedTime, s.EnteredTime) DESC
			        )
        			
		        LEFT OUTER JOIN Surveys PatUF
			        ON Patients.PatientId = PatUF.PatientId
			        AND PatUF.SurveyId =
			        -- select survey in window has uf results and is closest to middle of window
			        (
				        SELECT TOP 1 s.SurveyId
				        FROM Surveys s
					        INNER JOIN SurveyItems i ON s.SurveyId = i.SurveyId
				        WHERE PatientId = Patients.PatientId
				        AND SurveyType = 'Prostate QOL Survey'
				        AND SurveyDate BETWEEN DATEADD(month, 16, Procedures.ProcDate) AND DATEADD(month, 20, Procedures.ProcDate)
				        AND SurveyItemNum IN ('8', '9', '10', '11', '12')
				        AND SurveyItemResult NOT LIKE '%[^0123456789]%'
				        ORDER BY ABS(DATEDIFF(day, DATEADD(month, 18, Procedures.ProcDate), SurveyDate)), COALESCE(s.UpdatedTime, s.EnteredTime) DESC
			        )
        			
		        LEFT OUTER JOIN SurveyItems SexualItems
                    ON PatEF.SurveyId = SexualItems.SurveyId
                    AND SexualItems.SurveyItemResult IS NOT NULL
                    AND IsNumeric(SexualItems.SurveyItemResult) = 1
                    AND SexualItems.SurveyItemNum IN ('2', '3', '4', '5', '6', '7')
                    AND SexualItems.SurveyItemResult NOT LIKE '%[^0123456789]%'
        			
		        LEFT OUTER JOIN  SurveyItems UrinaryItems
			        ON PatUF.SurveyId = UrinaryItems.SurveyId
			        AND UrinaryItems.SurveyItemResult IS NOT NULL
                    AND IsNumeric(UrinaryItems.SurveyItemResult) = 1
                    AND UrinaryItems.SurveyItemNum IN ('8', '9', '10', '11', '12')
                    AND UrinaryItems.SurveyItemResult NOT LIKE '%[^0123456789]%'
                    
        		
		         -- physician		
		        LEFT OUTER JOIN Surveys PhyUF
			        ON Patients.PatientId = PhyUF.PatientId
			        AND PhyUF.SurveyId = 
			        (
				        SELECT TOP 1 SurveyId
				        FROM Surveys
				        WHERE PatientId = Patients.PatientId
				        AND SurveyType = 'Urinary Function'
				        AND SurveyDate > Procedures.ProcDate
				        -- is this survey in the same window as the qol survey?
				        -- qol in [rp + 90x - 45, rp + 90x + 44]
				        AND SurveyDate BETWEEN DATEADD(month, 16, Procedures.ProcDate) AND DATEADD(month, 20, Procedures.ProcDate) 
				        ORDER BY ABS(DATEDIFF(day, DATEADD(month, 18, Procedures.ProcDate), SurveyDate)), COALESCE(UpdatedTime, EnteredTime) DESC
			        )
        			
		        LEFT OUTER JOIN SurveyItems Continence
			        ON PhyUF.SurveyId = Continence.SurveyId
			        AND Continence.SurveyItem = 'Continence'
        			
		        LEFT OUTER JOIN Surveys PhyEF
			        ON Patients.PatientId = PhyEF.PatientId
			        AND PhyEF.SurveyId = 
			        (
				        SELECT TOP 1 SurveyId
				        FROM Surveys
				        WHERE PatientId = Patients.PatientId
				        AND SurveyType = 'Sexual Function'
				        AND SurveyDate > Procedures.ProcDate
				        -- is this survey in the same window as the qol survey?
				        -- qol in [rp + 90x - 45, rp + 90x + 44]
				        AND SurveyDate BETWEEN DATEADD(month, 16, Procedures.ProcDate) AND DATEADD(month, 20, Procedures.ProcDate)
				        ORDER BY ABS(DATEDIFF(day, DATEADD(month, 18, Procedures.ProcDate), SurveyDate)), COALESCE(UpdatedTime, EnteredTime) DESC
			        )
        			
		        LEFT OUTER JOIN SurveyItems ErectileFunction
			        ON PhyEF.SurveyId = ErectileFunction.SurveyId
			        AND ErectileFunction.SurveyItem = 'Erectile Function'
        WHERE
	        Patients.PatientId <> 29214 AND Patients.PatientId = @PatientId
        		
        GROUP BY
	        Patients.PatientId,
	        Procedures.ProcInstitution,
	        Patients.PtMRN,
	        Procedures.ProcDate,
	        PatEF.SurveyDate,
	        PatUF.SurveyDate,
	        --ErectileFunction.SurveyItemResult,
	        --Continence.SurveyItemResult,
	        PhyEF.SurveyDate,
	        PhyUF.SurveyDate
        	
        -- need at least one survey score
        HAVING 
	        PatEF.SurveyDate IS NOT NULL OR
	        PatUF.SurveyDate IS NOT NULL OR
	        PhyEF.SurveyDate IS NOT NULL OR
	        PhyUF.SurveyDate IS NOT NULL
        	
        UNION

        SELECT
	        -- patientid
	        Patients.PatientId AS patientid,
        	
	        '21 MONTH' AS contact,
        	
	        -- efpatient
	        CASE 
                WHEN COUNT(SexualItems.SurveyItemId) > 0 THEN
                    (SUM(CASE WHEN SexualItems.SurveyItemNum = '2' THEN CONVERT(int, SexualItems.SurveyItemResult) ELSE CONVERT(int, SexualItems.SurveyItemResult) - 1 END) / CONVERT(float, COUNT(SexualItems.SurveyItemId))) * 6
                ELSE NULL
            END AS efpatient,
            
	        -- efsurgeon
	        AVG(CASE RTRIM(LTRIM(ErectileFunction.SurveyItemResult))
		        WHEN '1' THEN 1
		        WHEN '1-2' THEN 1.5
        		
		        WHEN '2' THEN 2
		        WHEN '2.5' THEN 2.5
		        WHEN '2-3' THEN 2.5
        		
		        WHEN '3' THEN 3
		        WHEN '3-4' THEN 3.5
		        WHEN '3,4' THEN 3.5
        		
		        WHEN '4' THEN 4
		        WHEN '4-3' THEN 3.5
		        WHEN '4-5' THEN 4.5 
        		
		        WHEN '5' THEN 5
        		
		        ELSE NULL
	        END) AS efsurgeon,
	        --ErectileFunction.SurveyItemResult AS raw_efsurgeon,
        	
	        -- institution
	        CASE
		        WHEN Procedures.ProcInstitution LIKE 'MEMORIAL%SLOAN%KETTERING%' THEN 'MEMORIAL SLOAN KETTERING CANCER CENTER'
		        WHEN Procedures.ProcInstitution IN ('MEM', 'MSK', 'MSKCC') THEN 'MEMORIAL SLOAN KETTERING CANCER CENTER'
		        WHEN Procedures.ProcInstitution = 'OUT' THEN 'OUTSIDE'
		        WHEN Procedures.ProcInstitution = 'NEW YORK UNIVERSITY HOSPITAL' THEN 'NYU MEDICAL CENTER'
		        WHEN ISDATE(Procedures.ProcInstitution) = 1 THEN 'UNKNOWN'
		        ELSE UPPER(Procedures.ProcInstitution)
	        END AS institution,
	        Procedures.ProcInstitution AS raw_institution,
        	
	        -- mrn
	        Patients.PtMRN as mrn,
        	
	        -- patientassessdate
	        CONVERT(varchar, PatEF.SurveyDate, 101) as patientassessefdate,
	        CONVERT(varchar, PatUF.SurveyDate, 101) as patientassessufdate,
        	
	        -- surgeonassessdate
	        CONVERT(varchar, PhyEF.SurveyDate, 101) as surgeonassessefdate,
	        CONVERT(varchar, PhyUF.SurveyDate, 101) as surgeonassessufdate,
        	
	        -- ufpatient
	        CASE
                WHEN COUNT(UrinaryItems.SurveyItemId) > 0 THEN
                    21 - ((SUM(CONVERT(int, UrinaryItems.SurveyItemResult) - 1) / CONVERT(float, COUNT(UrinaryItems.SurveyItemId))) * 5)
                ELSE NULL
            END AS ufpatient,
	        -- ufsurgeon
	        AVG(CASE RTRIM(LTRIM(Continence.SurveyItemResult))
		        WHEN '1' THEN 1
		        WHEN '1- (2)' THEN 1.5
		        WHEN '1-2' THEN 1.5
        		
		        WHEN '2' THEN 2
		        WHEN '2-3' THEN 2.5
        		
		        WHEN '3' THEN 3
		        WHEN '3-4' THEN 3.5
        		
		        WHEN '4' THEN 4
		        WHEN '4-5' THEN 4.5
        		
		        WHEN '5' THEN 5
        		
		        WHEN 'Continent' THEN 1
		        ELSE NULL
	        END) AS ufsurgeon,
	        --Continence.SurveyItemResult AS raw_ufsurgeon,
        	
	        -- DIAGNOSTICS
	        CONVERT(varchar, Procedures.ProcDate, 101) as surgerydate,
        	
	        21 as sort

        FROM
	        Patients
		        INNER JOIN Procedures
			        ON Procedures.ProcedureId =
			        (
				        SELECT TOP 1 p.ProcedureId
				        FROM Procedures p
				        WHERE p.PatientId = Patients.PatientId
				        AND p.ProcName IN (
					        'CP','LP','LP_CONV','PP','RALP','RP','SalvCP','SalvLP','SalvRP'
				        )
				        --AND p.ProcDate BETWEEN '1/1/2005' AND '12/31/2010'
				        ORDER BY
					        CASE p.ProcQuality
						        WHEN 'RR' THEN 4
                                WHEN 'STD' THEN 3
                                WHEN 'REV' THEN 2
                                WHEN 'OUT' THEN 1
                                ELSE 0
					        END DESC
			        )
        		
		        LEFT OUTER JOIN Surveys PatEF
			        ON Patients.PatientId = PatEF.PatientId
			        AND PatEF.SurveyId =
			        (
				        SELECT TOP 1 s.SurveyId
					        FROM Surveys s
						        INNER JOIN SurveyItems i ON s.SurveyId = i.SurveyId
					        WHERE PatientId = Patients.PatientId
					        AND SurveyType = 'Prostate QOL Survey'
					        AND SurveyDate BETWEEN DATEADD(month, 19, Procedures.ProcDate) AND DATEADD(month, 23, Procedures.ProcDate)
					        AND SurveyItemNum IN ('2', '3', '4', '5', '6', '7')
					        AND SurveyItemResult NOT LIKE '%[^0123456789]%'
					        ORDER BY ABS(DATEDIFF(day, DATEADD(month, 21, Procedures.ProcDate), SurveyDate)), COALESCE(s.UpdatedTime, s.EnteredTime) DESC
			        )
        			
		        LEFT OUTER JOIN Surveys PatUF
			        ON Patients.PatientId = PatUF.PatientId
			        AND PatUF.SurveyId =
			        -- select survey in window has uf results and is closest to middle of window
			        (
				        SELECT TOP 1 s.SurveyId
				        FROM Surveys s
					        INNER JOIN SurveyItems i ON s.SurveyId = i.SurveyId
				        WHERE PatientId = Patients.PatientId
				        AND SurveyType = 'Prostate QOL Survey'
				        AND SurveyDate BETWEEN DATEADD(month, 19, Procedures.ProcDate) AND DATEADD(month, 23, Procedures.ProcDate)
				        AND SurveyItemNum IN ('8', '9', '10', '11', '12')
				        AND SurveyItemResult NOT LIKE '%[^0123456789]%'
				        ORDER BY ABS(DATEDIFF(day, DATEADD(month, 21, Procedures.ProcDate), SurveyDate)), COALESCE(s.UpdatedTime, s.EnteredTime) DESC
			        )
        			
		        LEFT OUTER JOIN SurveyItems SexualItems
                    ON PatEF.SurveyId = SexualItems.SurveyId
                    AND SexualItems.SurveyItemResult IS NOT NULL
                    AND IsNumeric(SexualItems.SurveyItemResult) = 1
                    AND SexualItems.SurveyItemNum IN ('2', '3', '4', '5', '6', '7')
                    AND SexualItems.SurveyItemResult NOT LIKE '%[^0123456789]%'
        			
		        LEFT OUTER JOIN  SurveyItems UrinaryItems
			        ON PatUF.SurveyId = UrinaryItems.SurveyId
			        AND UrinaryItems.SurveyItemResult IS NOT NULL
                    AND IsNumeric(UrinaryItems.SurveyItemResult) = 1
                    AND UrinaryItems.SurveyItemNum IN ('8', '9', '10', '11', '12')
                    AND UrinaryItems.SurveyItemResult NOT LIKE '%[^0123456789]%'
                    
        		
		         -- physician		
		        LEFT OUTER JOIN Surveys PhyUF
			        ON Patients.PatientId = PhyUF.PatientId
			        AND PhyUF.SurveyId = 
			        (
				        SELECT TOP 1 SurveyId
				        FROM Surveys
				        WHERE PatientId = Patients.PatientId
				        AND SurveyType = 'Urinary Function'
				        AND SurveyDate > Procedures.ProcDate
				        -- is this survey in the same window as the qol survey?
				        -- qol in [rp + 90x - 45, rp + 90x + 44]
				        AND SurveyDate BETWEEN DATEADD(month, 19, Procedures.ProcDate) AND DATEADD(month, 23, Procedures.ProcDate) 
				        ORDER BY ABS(DATEDIFF(day, DATEADD(month, 21, Procedures.ProcDate), SurveyDate)), COALESCE(UpdatedTime, EnteredTime) DESC
			        )
        			
		        LEFT OUTER JOIN SurveyItems Continence
			        ON PhyUF.SurveyId = Continence.SurveyId
			        AND Continence.SurveyItem = 'Continence'
        			
		        LEFT OUTER JOIN Surveys PhyEF
			        ON Patients.PatientId = PhyEF.PatientId
			        AND PhyEF.SurveyId = 
			        (
				        SELECT TOP 1 SurveyId
				        FROM Surveys
				        WHERE PatientId = Patients.PatientId
				        AND SurveyType = 'Sexual Function'
				        AND SurveyDate > Procedures.ProcDate
				        -- is this survey in the same window as the qol survey?
				        -- qol in [rp + 90x - 45, rp + 90x + 44]
				        AND SurveyDate BETWEEN DATEADD(month, 19, Procedures.ProcDate) AND DATEADD(month, 23, Procedures.ProcDate)
				        ORDER BY ABS(DATEDIFF(day, DATEADD(month, 21, Procedures.ProcDate), SurveyDate)), COALESCE(UpdatedTime, EnteredTime) DESC
			        )
        			
		        LEFT OUTER JOIN SurveyItems ErectileFunction
			        ON PhyEF.SurveyId = ErectileFunction.SurveyId
			        AND ErectileFunction.SurveyItem = 'Erectile Function'
        WHERE
	        Patients.PatientId <> 29214 AND Patients.PatientId = @PatientId
        		
        GROUP BY
	        Patients.PatientId,
	        Procedures.ProcInstitution,
	        Patients.PtMRN,
	        Procedures.ProcDate,
	        PatEF.SurveyDate,
	        PatUF.SurveyDate,
	        --ErectileFunction.SurveyItemResult,
	        --Continence.SurveyItemResult,
	        PhyEF.SurveyDate,
	        PhyUF.SurveyDate
        	
        -- need at least one survey score
        HAVING 
	        PatEF.SurveyDate IS NOT NULL OR
	        PatUF.SurveyDate IS NOT NULL OR
	        PhyEF.SurveyDate IS NOT NULL OR
	        PhyUF.SurveyDate IS NOT NULL

        UNION

        SELECT
	        -- patientid
	        Patients.PatientId AS patientid,
        	
	        '24 MONTH' AS contact,
        	
	        -- efpatient
	        CASE 
                WHEN COUNT(SexualItems.SurveyItemId) > 0 THEN
                    (SUM(CASE WHEN SexualItems.SurveyItemNum = '2' THEN CONVERT(int, SexualItems.SurveyItemResult) ELSE CONVERT(int, SexualItems.SurveyItemResult) - 1 END) / CONVERT(float, COUNT(SexualItems.SurveyItemId))) * 6
                ELSE NULL
            END AS efpatient,
            
	        -- efsurgeon
	        AVG(CASE RTRIM(LTRIM(ErectileFunction.SurveyItemResult))
		        WHEN '1' THEN 1
		        WHEN '1-2' THEN 1.5
        		
		        WHEN '2' THEN 2
		        WHEN '2.5' THEN 2.5
		        WHEN '2-3' THEN 2.5
        		
		        WHEN '3' THEN 3
		        WHEN '3-4' THEN 3.5
		        WHEN '3,4' THEN 3.5
        		
		        WHEN '4' THEN 4
		        WHEN '4-3' THEN 3.5
		        WHEN '4-5' THEN 4.5 
        		
		        WHEN '5' THEN 5
        		
		        ELSE NULL
	        END) AS efsurgeon,
	        --ErectileFunction.SurveyItemResult AS raw_efsurgeon,
        	
	        -- institution
	        CASE
		        WHEN Procedures.ProcInstitution LIKE 'MEMORIAL%SLOAN%KETTERING%' THEN 'MEMORIAL SLOAN KETTERING CANCER CENTER'
		        WHEN Procedures.ProcInstitution IN ('MEM', 'MSK', 'MSKCC') THEN 'MEMORIAL SLOAN KETTERING CANCER CENTER'
		        WHEN Procedures.ProcInstitution = 'OUT' THEN 'OUTSIDE'
		        WHEN Procedures.ProcInstitution = 'NEW YORK UNIVERSITY HOSPITAL' THEN 'NYU MEDICAL CENTER'
		        WHEN ISDATE(Procedures.ProcInstitution) = 1 THEN 'UNKNOWN'
		        ELSE UPPER(Procedures.ProcInstitution)
	        END AS institution,
	        Procedures.ProcInstitution AS raw_institution,
        	
	        -- mrn
	        Patients.PtMRN as mrn,
        	
	        -- patientassessdate
	        CONVERT(varchar, PatEF.SurveyDate, 101) as patientassessefdate,
	        CONVERT(varchar, PatUF.SurveyDate, 101) as patientassessufdate,
        	
	        -- surgeonassessdate
	        CONVERT(varchar, PhyEF.SurveyDate, 101) as surgeonassessefdate,
	        CONVERT(varchar, PhyUF.SurveyDate, 101) as surgeonassessufdate,
        	
	        -- ufpatient
	        CASE
                WHEN COUNT(UrinaryItems.SurveyItemId) > 0 THEN
                    21 - ((SUM(CONVERT(int, UrinaryItems.SurveyItemResult) - 1) / CONVERT(float, COUNT(UrinaryItems.SurveyItemId))) * 5)
                ELSE NULL
            END AS ufpatient,
	        -- ufsurgeon
	        AVG(CASE RTRIM(LTRIM(Continence.SurveyItemResult))
		        WHEN '1' THEN 1
		        WHEN '1- (2)' THEN 1.5
		        WHEN '1-2' THEN 1.5
        		
		        WHEN '2' THEN 2
		        WHEN '2-3' THEN 2.5
        		
		        WHEN '3' THEN 3
		        WHEN '3-4' THEN 3.5
        		
		        WHEN '4' THEN 4
		        WHEN '4-5' THEN 4.5
        		
		        WHEN '5' THEN 5
        		
		        WHEN 'Continent' THEN 1
		        ELSE NULL
	        END) AS ufsurgeon,
	        --Continence.SurveyItemResult AS raw_ufsurgeon,
        	
	        -- DIAGNOSTICS
	        CONVERT(varchar, Procedures.ProcDate, 101) as surgerydate,
        	
	        24 as sort

        FROM
	        Patients
		        INNER JOIN Procedures
			        ON Procedures.ProcedureId =
			        (
				        SELECT TOP 1 p.ProcedureId
				        FROM Procedures p
				        WHERE p.PatientId = Patients.PatientId
				        AND p.ProcName IN (
					        'CP','LP','LP_CONV','PP','RALP','RP','SalvCP','SalvLP','SalvRP'
				        )
				        --AND p.ProcDate BETWEEN '1/1/2005' AND '12/31/2010'
				        ORDER BY
					        CASE p.ProcQuality
						        WHEN 'RR' THEN 4
                                WHEN 'STD' THEN 3
                                WHEN 'REV' THEN 2
                                WHEN 'OUT' THEN 1
                                ELSE 0
					        END DESC
			        )
        		
		        LEFT OUTER JOIN Surveys PatEF
			        ON Patients.PatientId = PatEF.PatientId
			        AND PatEF.SurveyId =
			        (
				        SELECT TOP 1 s.SurveyId
					        FROM Surveys s
						        INNER JOIN SurveyItems i ON s.SurveyId = i.SurveyId
					        WHERE PatientId = Patients.PatientId
					        AND SurveyType = 'Prostate QOL Survey'
					        AND SurveyDate BETWEEN DATEADD(month, 21, Procedures.ProcDate) AND DATEADD(month, 27, Procedures.ProcDate)
					        AND SurveyItemNum IN ('2', '3', '4', '5', '6', '7')
					        AND SurveyItemResult NOT LIKE '%[^0123456789]%'
					        ORDER BY ABS(DATEDIFF(day, DATEADD(month, 24, Procedures.ProcDate), SurveyDate)), COALESCE(s.UpdatedTime, s.EnteredTime) DESC
			        )
        			
		        LEFT OUTER JOIN Surveys PatUF
			        ON Patients.PatientId = PatUF.PatientId
			        AND PatUF.SurveyId =
			        -- select survey in window has uf results and is closest to middle of window
			        (
				        SELECT TOP 1 s.SurveyId
				        FROM Surveys s
					        INNER JOIN SurveyItems i ON s.SurveyId = i.SurveyId
				        WHERE PatientId = Patients.PatientId
				        AND SurveyType = 'Prostate QOL Survey'
				        AND SurveyDate BETWEEN DATEADD(month, 21, Procedures.ProcDate) AND DATEADD(month, 27, Procedures.ProcDate)
				        AND SurveyItemNum IN ('8', '9', '10', '11', '12')
				        AND SurveyItemResult NOT LIKE '%[^0123456789]%'
				        ORDER BY ABS(DATEDIFF(day, DATEADD(month, 24, Procedures.ProcDate), SurveyDate)), COALESCE(s.UpdatedTime, s.EnteredTime) DESC
			        )
        			
		        LEFT OUTER JOIN SurveyItems SexualItems
                    ON PatEF.SurveyId = SexualItems.SurveyId
                    AND SexualItems.SurveyItemResult IS NOT NULL
                    AND IsNumeric(SexualItems.SurveyItemResult) = 1
                    AND SexualItems.SurveyItemNum IN ('2', '3', '4', '5', '6', '7')
                    AND SexualItems.SurveyItemResult NOT LIKE '%[^0123456789]%'
        			
		        LEFT OUTER JOIN  SurveyItems UrinaryItems
			        ON PatUF.SurveyId = UrinaryItems.SurveyId
			        AND UrinaryItems.SurveyItemResult IS NOT NULL
                    AND IsNumeric(UrinaryItems.SurveyItemResult) = 1
                    AND UrinaryItems.SurveyItemNum IN ('8', '9', '10', '11', '12')
                    AND UrinaryItems.SurveyItemResult NOT LIKE '%[^0123456789]%'
                    
        		
		         -- physician		
		        LEFT OUTER JOIN Surveys PhyUF
			        ON Patients.PatientId = PhyUF.PatientId
			        AND PhyUF.SurveyId = 
			        (
				        SELECT TOP 1 SurveyId
				        FROM Surveys
				        WHERE PatientId = Patients.PatientId
				        AND SurveyType = 'Urinary Function'
				        AND SurveyDate > Procedures.ProcDate
				        -- is this survey in the same window as the qol survey?
				        -- qol in [rp + 90x - 45, rp + 90x + 44]
				        AND SurveyDate BETWEEN DATEADD(month, 21, Procedures.ProcDate) AND DATEADD(month, 27, Procedures.ProcDate) 
				        ORDER BY ABS(DATEDIFF(day, DATEADD(month, 24, Procedures.ProcDate), SurveyDate)), COALESCE(UpdatedTime, EnteredTime) DESC
			        )
        			
		        LEFT OUTER JOIN SurveyItems Continence
			        ON PhyUF.SurveyId = Continence.SurveyId
			        AND Continence.SurveyItem = 'Continence'
        			
		        LEFT OUTER JOIN Surveys PhyEF
			        ON Patients.PatientId = PhyEF.PatientId
			        AND PhyEF.SurveyId = 
			        (
				        SELECT TOP 1 SurveyId
				        FROM Surveys
				        WHERE PatientId = Patients.PatientId
				        AND SurveyType = 'Sexual Function'
				        AND SurveyDate > Procedures.ProcDate
				        -- is this survey in the same window as the qol survey?
				        -- qol in [rp + 90x - 45, rp + 90x + 44]
				        AND SurveyDate BETWEEN DATEADD(month, 21, Procedures.ProcDate) AND DATEADD(month, 27, Procedures.ProcDate)
				        ORDER BY ABS(DATEDIFF(day, DATEADD(month, 24, Procedures.ProcDate), SurveyDate)), COALESCE(UpdatedTime, EnteredTime) DESC
			        )
        			
		        LEFT OUTER JOIN SurveyItems ErectileFunction
			        ON PhyEF.SurveyId = ErectileFunction.SurveyId
			        AND ErectileFunction.SurveyItem = 'Erectile Function'
        WHERE
	        Patients.PatientId <> 29214 AND Patients.PatientId = @PatientId
        		
        GROUP BY
	        Patients.PatientId,
	        Procedures.ProcInstitution,
	        Patients.PtMRN,
	        Procedures.ProcDate,
	        PatEF.SurveyDate,
	        PatUF.SurveyDate,
	        --ErectileFunction.SurveyItemResult,
	        --Continence.SurveyItemResult,
	        PhyEF.SurveyDate,
	        PhyUF.SurveyDate
        	
        -- need at least one survey score
        HAVING 
	        PatEF.SurveyDate IS NOT NULL OR
	        PatUF.SurveyDate IS NOT NULL OR
	        PhyEF.SurveyDate IS NOT NULL OR
	        PhyUF.SurveyDate IS NOT NULL

        UNION

        SELECT
	        -- patientid
	        Patients.PatientId AS patientid,
        	
	        '36 MONTH' AS contact,
        	
	        -- efpatient
	        CASE 
                WHEN COUNT(SexualItems.SurveyItemId) > 0 THEN
                    (SUM(CASE WHEN SexualItems.SurveyItemNum = '2' THEN CONVERT(int, SexualItems.SurveyItemResult) ELSE CONVERT(int, SexualItems.SurveyItemResult) - 1 END) / CONVERT(float, COUNT(SexualItems.SurveyItemId))) * 6
                ELSE NULL
            END AS efpatient,
            
	        -- efsurgeon
	        AVG(CASE RTRIM(LTRIM(ErectileFunction.SurveyItemResult))
		        WHEN '1' THEN 1
		        WHEN '1-2' THEN 1.5
        		
		        WHEN '2' THEN 2
		        WHEN '2.5' THEN 2.5
		        WHEN '2-3' THEN 2.5
        		
		        WHEN '3' THEN 3
		        WHEN '3-4' THEN 3.5
		        WHEN '3,4' THEN 3.5
        		
		        WHEN '4' THEN 4
		        WHEN '4-3' THEN 3.5
		        WHEN '4-5' THEN 4.5 
        		
		        WHEN '5' THEN 5
        		
		        ELSE NULL
	        END) AS efsurgeon,
	        --ErectileFunction.SurveyItemResult AS raw_efsurgeon,
        	
	        -- institution
	        CASE
		        WHEN Procedures.ProcInstitution LIKE 'MEMORIAL%SLOAN%KETTERING%' THEN 'MEMORIAL SLOAN KETTERING CANCER CENTER'
		        WHEN Procedures.ProcInstitution IN ('MEM', 'MSK', 'MSKCC') THEN 'MEMORIAL SLOAN KETTERING CANCER CENTER'
		        WHEN Procedures.ProcInstitution = 'OUT' THEN 'OUTSIDE'
		        WHEN Procedures.ProcInstitution = 'NEW YORK UNIVERSITY HOSPITAL' THEN 'NYU MEDICAL CENTER'
		        WHEN ISDATE(Procedures.ProcInstitution) = 1 THEN 'UNKNOWN'
		        ELSE UPPER(Procedures.ProcInstitution)
	        END AS institution,
	        Procedures.ProcInstitution AS raw_institution,
        	
	        -- mrn
	        Patients.PtMRN as mrn,
        	
	        -- patientassessdate
	        CONVERT(varchar, PatEF.SurveyDate, 101) as patientassessefdate,
	        CONVERT(varchar, PatUF.SurveyDate, 101) as patientassessufdate,
        	
	        -- surgeonassessdate
	        CONVERT(varchar, PhyEF.SurveyDate, 101) as surgeonassessefdate,
	        CONVERT(varchar, PhyUF.SurveyDate, 101) as surgeonassessufdate,
        	
	        -- ufpatient
	        CASE
                WHEN COUNT(UrinaryItems.SurveyItemId) > 0 THEN
                    21 - ((SUM(CONVERT(int, UrinaryItems.SurveyItemResult) - 1) / CONVERT(float, COUNT(UrinaryItems.SurveyItemId))) * 5)
                ELSE NULL
            END AS ufpatient,
	        -- ufsurgeon
	        AVG(CASE RTRIM(LTRIM(Continence.SurveyItemResult))
		        WHEN '1' THEN 1
		        WHEN '1- (2)' THEN 1.5
		        WHEN '1-2' THEN 1.5
        		
		        WHEN '2' THEN 2
		        WHEN '2-3' THEN 2.5
        		
		        WHEN '3' THEN 3
		        WHEN '3-4' THEN 3.5
        		
		        WHEN '4' THEN 4
		        WHEN '4-5' THEN 4.5
        		
		        WHEN '5' THEN 5
        		
		        WHEN 'Continent' THEN 1
		        ELSE NULL
	        END) AS ufsurgeon,
	        --Continence.SurveyItemResult AS raw_ufsurgeon,
        	
	        -- DIAGNOSTICS
	        CONVERT(varchar, Procedures.ProcDate, 101) as surgerydate,
        	
	        36 as sort

        FROM
	        Patients
		        INNER JOIN Procedures
			        ON Procedures.ProcedureId =
			        (
				        SELECT TOP 1 p.ProcedureId
				        FROM Procedures p
				        WHERE p.PatientId = Patients.PatientId
				        AND p.ProcName IN (
					        'CP','LP','LP_CONV','PP','RALP','RP','SalvCP','SalvLP','SalvRP'
				        )
				        --AND p.ProcDate BETWEEN '1/1/2005' AND '12/31/2010'
				        ORDER BY
					        CASE p.ProcQuality
						        WHEN 'RR' THEN 4
                                WHEN 'STD' THEN 3
                                WHEN 'REV' THEN 2
                                WHEN 'OUT' THEN 1
                                ELSE 0
					        END DESC
			        )
        		
		        LEFT OUTER JOIN Surveys PatEF
			        ON Patients.PatientId = PatEF.PatientId
			        AND PatEF.SurveyId =
			        (
				        SELECT TOP 1 s.SurveyId
					        FROM Surveys s
						        INNER JOIN SurveyItems i ON s.SurveyId = i.SurveyId
					        WHERE PatientId = Patients.PatientId
					        AND SurveyType = 'Prostate QOL Survey'
					        AND SurveyDate BETWEEN DATEADD(month, 33, Procedures.ProcDate) AND DATEADD(month, 39, Procedures.ProcDate)
					        AND SurveyItemNum IN ('2', '3', '4', '5', '6', '7')
					        AND SurveyItemResult NOT LIKE '%[^0123456789]%'
					        ORDER BY ABS(DATEDIFF(day, DATEADD(month, 36, Procedures.ProcDate), SurveyDate)), COALESCE(s.UpdatedTime, s.EnteredTime) DESC
			        )
        			
		        LEFT OUTER JOIN Surveys PatUF
			        ON Patients.PatientId = PatUF.PatientId
			        AND PatUF.SurveyId =
			        -- select survey in window has uf results and is closest to middle of window
			        (
				        SELECT TOP 1 s.SurveyId
				        FROM Surveys s
					        INNER JOIN SurveyItems i ON s.SurveyId = i.SurveyId
				        WHERE PatientId = Patients.PatientId
				        AND SurveyType = 'Prostate QOL Survey'
				        AND SurveyDate BETWEEN DATEADD(month, 33, Procedures.ProcDate) AND DATEADD(month, 39, Procedures.ProcDate)
				        AND SurveyItemNum IN ('8', '9', '10', '11', '12')
				        AND SurveyItemResult NOT LIKE '%[^0123456789]%'
				        ORDER BY ABS(DATEDIFF(day, DATEADD(month, 36, Procedures.ProcDate), SurveyDate)), COALESCE(s.UpdatedTime, s.EnteredTime) DESC
			        )
        			
		        LEFT OUTER JOIN SurveyItems SexualItems
                    ON PatEF.SurveyId = SexualItems.SurveyId
                    AND SexualItems.SurveyItemResult IS NOT NULL
                    AND IsNumeric(SexualItems.SurveyItemResult) = 1
                    AND SexualItems.SurveyItemNum IN ('2', '3', '4', '5', '6', '7')
                    AND SexualItems.SurveyItemResult NOT LIKE '%[^0123456789]%'
        			
		        LEFT OUTER JOIN  SurveyItems UrinaryItems
			        ON PatUF.SurveyId = UrinaryItems.SurveyId
			        AND UrinaryItems.SurveyItemResult IS NOT NULL
                    AND IsNumeric(UrinaryItems.SurveyItemResult) = 1
                    AND UrinaryItems.SurveyItemNum IN ('8', '9', '10', '11', '12')
                    AND UrinaryItems.SurveyItemResult NOT LIKE '%[^0123456789]%'
                    
        		
		         -- physician		
		        LEFT OUTER JOIN Surveys PhyUF
			        ON Patients.PatientId = PhyUF.PatientId
			        AND PhyUF.SurveyId = 
			        (
				        SELECT TOP 1 SurveyId
				        FROM Surveys
				        WHERE PatientId = Patients.PatientId
				        AND SurveyType = 'Urinary Function'
				        AND SurveyDate > Procedures.ProcDate
				        -- is this survey in the same window as the qol survey?
				        -- qol in [rp + 90x - 45, rp + 90x + 44]
				        AND SurveyDate BETWEEN DATEADD(month, 33, Procedures.ProcDate) AND DATEADD(month, 39, Procedures.ProcDate) 
				        ORDER BY ABS(DATEDIFF(day, DATEADD(month, 36, Procedures.ProcDate), SurveyDate)), COALESCE(UpdatedTime, EnteredTime) DESC
			        )
        			
		        LEFT OUTER JOIN SurveyItems Continence
			        ON PhyUF.SurveyId = Continence.SurveyId
			        AND Continence.SurveyItem = 'Continence'
        			
		        LEFT OUTER JOIN Surveys PhyEF
			        ON Patients.PatientId = PhyEF.PatientId
			        AND PhyEF.SurveyId = 
			        (
				        SELECT TOP 1 SurveyId
				        FROM Surveys
				        WHERE PatientId = Patients.PatientId
				        AND SurveyType = 'Sexual Function'
				        AND SurveyDate > Procedures.ProcDate
				        -- is this survey in the same window as the qol survey?
				        -- qol in [rp + 90x - 45, rp + 90x + 44]
				        AND SurveyDate BETWEEN DATEADD(month, 33, Procedures.ProcDate) AND DATEADD(month, 39, Procedures.ProcDate)
				        ORDER BY ABS(DATEDIFF(day, DATEADD(month, 36, Procedures.ProcDate), SurveyDate)), COALESCE(UpdatedTime, EnteredTime) DESC
			        )
        			
		        LEFT OUTER JOIN SurveyItems ErectileFunction
			        ON PhyEF.SurveyId = ErectileFunction.SurveyId
			        AND ErectileFunction.SurveyItem = 'Erectile Function'
        WHERE
	        Patients.PatientId <> 29214 AND Patients.PatientId = @PatientId
        		
        GROUP BY
	        Patients.PatientId,
	        Procedures.ProcInstitution,
	        Patients.PtMRN,
	        Procedures.ProcDate,
	        PatEF.SurveyDate,
	        PatUF.SurveyDate,
	        --ErectileFunction.SurveyItemResult,
	        --Continence.SurveyItemResult,
	        PhyEF.SurveyDate,
	        PhyUF.SurveyDate
        	
        -- need at least one survey score
        HAVING 
	        PatEF.SurveyDate IS NOT NULL OR
	        PatUF.SurveyDate IS NOT NULL OR
	        PhyEF.SurveyDate IS NOT NULL OR
	        PhyUF.SurveyDate IS NOT NULL

        UNION

        SELECT
	        -- patientid
	        Patients.PatientId AS patientid,
        	
	        '48 MONTH' AS contact,
        	
	        -- efpatient
	        CASE 
                WHEN COUNT(SexualItems.SurveyItemId) > 0 THEN
                    (SUM(CASE WHEN SexualItems.SurveyItemNum = '2' THEN CONVERT(int, SexualItems.SurveyItemResult) ELSE CONVERT(int, SexualItems.SurveyItemResult) - 1 END) / CONVERT(float, COUNT(SexualItems.SurveyItemId))) * 6
                ELSE NULL
            END AS efpatient,
            
	        -- efsurgeon
	        AVG(CASE RTRIM(LTRIM(ErectileFunction.SurveyItemResult))
		        WHEN '1' THEN 1
		        WHEN '1-2' THEN 1.5
        		
		        WHEN '2' THEN 2
		        WHEN '2.5' THEN 2.5
		        WHEN '2-3' THEN 2.5
        		
		        WHEN '3' THEN 3
		        WHEN '3-4' THEN 3.5
		        WHEN '3,4' THEN 3.5
        		
		        WHEN '4' THEN 4
		        WHEN '4-3' THEN 3.5
		        WHEN '4-5' THEN 4.5 
        		
		        WHEN '5' THEN 5
        		
		        ELSE NULL
	        END) AS efsurgeon,
	        --ErectileFunction.SurveyItemResult AS raw_efsurgeon,
        	
	        -- institution
	        CASE
		        WHEN Procedures.ProcInstitution LIKE 'MEMORIAL%SLOAN%KETTERING%' THEN 'MEMORIAL SLOAN KETTERING CANCER CENTER'
		        WHEN Procedures.ProcInstitution IN ('MEM', 'MSK', 'MSKCC') THEN 'MEMORIAL SLOAN KETTERING CANCER CENTER'
		        WHEN Procedures.ProcInstitution = 'OUT' THEN 'OUTSIDE'
		        WHEN Procedures.ProcInstitution = 'NEW YORK UNIVERSITY HOSPITAL' THEN 'NYU MEDICAL CENTER'
		        WHEN ISDATE(Procedures.ProcInstitution) = 1 THEN 'UNKNOWN'
		        ELSE UPPER(Procedures.ProcInstitution)
	        END AS institution,
	        Procedures.ProcInstitution AS raw_institution,
        	
	        -- mrn
	        Patients.PtMRN as mrn,
        	
	        -- patientassessdate
	        CONVERT(varchar, PatEF.SurveyDate, 101) as patientassessefdate,
	        CONVERT(varchar, PatUF.SurveyDate, 101) as patientassessufdate,
        	
	        -- surgeonassessdate
	        CONVERT(varchar, PhyEF.SurveyDate, 101) as surgeonassessefdate,
	        CONVERT(varchar, PhyUF.SurveyDate, 101) as surgeonassessufdate,
        	
	        -- ufpatient
	        CASE
                WHEN COUNT(UrinaryItems.SurveyItemId) > 0 THEN
                    21 - ((SUM(CONVERT(int, UrinaryItems.SurveyItemResult) - 1) / CONVERT(float, COUNT(UrinaryItems.SurveyItemId))) * 5)
                ELSE NULL
            END AS ufpatient,
	        -- ufsurgeon
	        AVG(CASE RTRIM(LTRIM(Continence.SurveyItemResult))
		        WHEN '1' THEN 1
		        WHEN '1- (2)' THEN 1.5
		        WHEN '1-2' THEN 1.5
        		
		        WHEN '2' THEN 2
		        WHEN '2-3' THEN 2.5
        		
		        WHEN '3' THEN 3
		        WHEN '3-4' THEN 3.5
        		
		        WHEN '4' THEN 4
		        WHEN '4-5' THEN 4.5
        		
		        WHEN '5' THEN 5
        		
		        WHEN 'Continent' THEN 1
		        ELSE NULL
	        END) AS ufsurgeon,
	        --Continence.SurveyItemResult AS raw_ufsurgeon,
        	
	        -- DIAGNOSTICS
	        CONVERT(varchar, Procedures.ProcDate, 101) as surgerydate,
        	
	        48 as sort

        FROM
	        Patients
		        INNER JOIN Procedures
			        ON Procedures.ProcedureId =
			        (
				        SELECT TOP 1 p.ProcedureId
				        FROM Procedures p
				        WHERE p.PatientId = Patients.PatientId
				        AND p.ProcName IN (
					        'CP','LP','LP_CONV','PP','RALP','RP','SalvCP','SalvLP','SalvRP'
				        )
				        --AND p.ProcDate BETWEEN '1/1/2005' AND '12/31/2010'
				        ORDER BY
					        CASE p.ProcQuality
						        WHEN 'RR' THEN 4
                                WHEN 'STD' THEN 3
                                WHEN 'REV' THEN 2
                                WHEN 'OUT' THEN 1
                                ELSE 0
					        END DESC
			        )
        		
		        LEFT OUTER JOIN Surveys PatEF
			        ON Patients.PatientId = PatEF.PatientId
			        AND PatEF.SurveyId =
			        (
				        SELECT TOP 1 s.SurveyId
					        FROM Surveys s
						        INNER JOIN SurveyItems i ON s.SurveyId = i.SurveyId
					        WHERE PatientId = Patients.PatientId
					        AND SurveyType = 'Prostate QOL Survey'
					        AND SurveyDate BETWEEN DATEADD(month, 45, Procedures.ProcDate) AND DATEADD(month, 51, Procedures.ProcDate)
					        AND SurveyItemNum IN ('2', '3', '4', '5', '6', '7')
					        AND SurveyItemResult NOT LIKE '%[^0123456789]%'
					        ORDER BY ABS(DATEDIFF(day, DATEADD(month, 48, Procedures.ProcDate), SurveyDate)), COALESCE(s.UpdatedTime, s.EnteredTime) DESC
			        )
        			
		        LEFT OUTER JOIN Surveys PatUF
			        ON Patients.PatientId = PatUF.PatientId
			        AND PatUF.SurveyId =
			        -- select survey in window has uf results and is closest to middle of window
			        (
				        SELECT TOP 1 s.SurveyId
				        FROM Surveys s
					        INNER JOIN SurveyItems i ON s.SurveyId = i.SurveyId
				        WHERE PatientId = Patients.PatientId
				        AND SurveyType = 'Prostate QOL Survey'
				        AND SurveyDate BETWEEN DATEADD(month, 45, Procedures.ProcDate) AND DATEADD(month, 51, Procedures.ProcDate)
				        AND SurveyItemNum IN ('8', '9', '10', '11', '12')
				        AND SurveyItemResult NOT LIKE '%[^0123456789]%'
				        ORDER BY ABS(DATEDIFF(day, DATEADD(month, 48, Procedures.ProcDate), SurveyDate)), COALESCE(s.UpdatedTime, s.EnteredTime) DESC
			        )
        			
		        LEFT OUTER JOIN SurveyItems SexualItems
                    ON PatEF.SurveyId = SexualItems.SurveyId
                    AND SexualItems.SurveyItemResult IS NOT NULL
                    AND IsNumeric(SexualItems.SurveyItemResult) = 1
                    AND SexualItems.SurveyItemNum IN ('2', '3', '4', '5', '6', '7')
                    AND SexualItems.SurveyItemResult NOT LIKE '%[^0123456789]%'
        			
		        LEFT OUTER JOIN  SurveyItems UrinaryItems
			        ON PatUF.SurveyId = UrinaryItems.SurveyId
			        AND UrinaryItems.SurveyItemResult IS NOT NULL
                    AND IsNumeric(UrinaryItems.SurveyItemResult) = 1
                    AND UrinaryItems.SurveyItemNum IN ('8', '9', '10', '11', '12')
                    AND UrinaryItems.SurveyItemResult NOT LIKE '%[^0123456789]%'
                    
        		
		         -- physician		
		        LEFT OUTER JOIN Surveys PhyUF
			        ON Patients.PatientId = PhyUF.PatientId
			        AND PhyUF.SurveyId = 
			        (
				        SELECT TOP 1 SurveyId
				        FROM Surveys
				        WHERE PatientId = Patients.PatientId
				        AND SurveyType = 'Urinary Function'
				        AND SurveyDate > Procedures.ProcDate
				        -- is this survey in the same window as the qol survey?
				        -- qol in [rp + 90x - 45, rp + 90x + 44]
				        AND SurveyDate BETWEEN DATEADD(month, 45, Procedures.ProcDate) AND DATEADD(month, 51, Procedures.ProcDate) 
				        ORDER BY ABS(DATEDIFF(day, DATEADD(month, 48, Procedures.ProcDate), SurveyDate)), COALESCE(UpdatedTime, EnteredTime) DESC
			        )
        			
		        LEFT OUTER JOIN SurveyItems Continence
			        ON PhyUF.SurveyId = Continence.SurveyId
			        AND Continence.SurveyItem = 'Continence'
        			
		        LEFT OUTER JOIN Surveys PhyEF
			        ON Patients.PatientId = PhyEF.PatientId
			        AND PhyEF.SurveyId = 
			        (
				        SELECT TOP 1 SurveyId
				        FROM Surveys
				        WHERE PatientId = Patients.PatientId
				        AND SurveyType = 'Sexual Function'
				        AND SurveyDate > Procedures.ProcDate
				        -- is this survey in the same window as the qol survey?
				        -- qol in [rp + 90x - 45, rp + 90x + 44]
				        AND SurveyDate BETWEEN DATEADD(month, 45, Procedures.ProcDate) AND DATEADD(month, 51, Procedures.ProcDate)
				        ORDER BY ABS(DATEDIFF(day, DATEADD(month, 48, Procedures.ProcDate), SurveyDate)), COALESCE(UpdatedTime, EnteredTime) DESC
			        )
        			
		        LEFT OUTER JOIN SurveyItems ErectileFunction
			        ON PhyEF.SurveyId = ErectileFunction.SurveyId
			        AND ErectileFunction.SurveyItem = 'Erectile Function'
        WHERE
	        Patients.PatientId <> 29214 AND Patients.PatientId = @PatientId
        		
        GROUP BY
	        Patients.PatientId,
	        Procedures.ProcInstitution,
	        Patients.PtMRN,
	        Procedures.ProcDate,
	        PatEF.SurveyDate,
	        PatUF.SurveyDate,
	        --ErectileFunction.SurveyItemResult,
	        --Continence.SurveyItemResult,
	        PhyEF.SurveyDate,
	        PhyUF.SurveyDate
        	
        -- need at least one survey score
        HAVING 
	        PatEF.SurveyDate IS NOT NULL OR
	        PatUF.SurveyDate IS NOT NULL OR
	        PhyEF.SurveyDate IS NOT NULL OR
	        PhyUF.SurveyDate IS NOT NULL


        ORDER BY
	        patientid, sort";
        #endregion

        #region bcr sql
        private string bcrSql =
            @"
            WITH NumericPSAs_CTE (LabTestId, PatientId, LabDate, LabResult)
            AS
            (
                SELECT 
                    LabTestId, 
                    PatientId, 
                    LabDate,CASE WHEN IsNumeric(LabResult) = 1 AND LabResult NOT LIKE '%[^0123456789.]%'
                        THEN Convert(float, LabResult)
                        ELSE 0
                    END 
                FROM LabTests
                WHERE LabDate IS NOT NULL
                AND LabTest = 'PSA'
                AND LabResult IS NOT NULL
            )

            SELECT
	            Patients.PatientId AS patientid,
            	
	            -- lastfollowupdate
	            CASE
		            WHEN Enc_Followup.EncDate > SD.SurveyDate THEN CONVERT(varchar, Enc_Followup.EncDate, 101)
		            ELSE CONVERT(varchar, SD.SurveyDate, 101)
	            END AS lastfollowupdate,
            	
	            -- psapreop
	            CASE
		            WHEN LabTests.LabResult LIKE '%>%' THEN SUBSTRING(LabTests.LabResult, CHARINDEX('>', LabTests.LabResult) + 1, 1000)
		            WHEN LabTests.LabResult LIKE '%<%' THEN SUBSTRING(LabTests.LabResult, CHARINDEX('<', LabTests.LabResult) + 1, 1000)
		            WHEN LabTests.LabResult LIKE '%~%' THEN SUBSTRING(LabTests.LabResult, CHARINDEX('~', LabTests.LabResult) + 1, 1000)
		            WHEN ISNUMERIC(LabTests.LabResult) = 1 THEN LabTests.LabResult
		            ELSE NULL
	            END AS psapreop,
            	
	            -- bcr
	            CASE
                    WHEN BCR.LabDate <= ISNULL(MIN(BCR_MedTx.MedTxDate),GETDATE()) AND BCR.LabDate <= ISNULL(MIN(BCR_RadTx.RadTxDate),GETDATE()) THEN 1
                    WHEN MIN(BCR_MedTx.MedTxDate) <= ISNULL(BCR.LabDate,GETDATE()) AND MIN(BCR_MedTx.MedTxDate) <= ISNULL(MIN(BCR_RadTx.RadTxDate),GETDATE()) THEN 1
                    WHEN MIN(BCR_RadTx.RadTxDate) <= ISNULL(BCR.LabDate,GETDATE()) AND MIN(BCR_RadTx.RadTxDate) <= ISNULL(MIN(BCR_MedTx.MedTxDate),GETDATE()) THEN 1
                    ELSE 0
                END AS bcr,
                
	            -- bcrdate
	            CASE
                    WHEN BCR.LabDate <= ISNULL(MIN(BCR_MedTx.MedTxDate),GETDATE()) AND BCR.LabDate <= ISNULL(MIN(BCR_RadTx.RadTxDate),GETDATE()) THEN CONVERT(varchar, BCR.LabDate, 101)
                    WHEN MIN(BCR_MedTx.MedTxDate) <= ISNULL(BCR.LabDate,GETDATE()) AND MIN(BCR_MedTx.MedTxDate) <= ISNULL(MIN(BCR_RadTx.RadTxDate),GETDATE()) THEN CONVERT(varchar, MIN(BCR_MedTx.MedTxDate), 101)
                    WHEN MIN(BCR_RadTx.RadTxDate) <= ISNULL(BCR.LabDate,GETDATE()) AND MIN(BCR_RadTx.RadTxDate) <= ISNULL(MIN(BCR_MedTx.MedTxDate),GETDATE()) THEN CONVERT(varchar, MIN(BCR_RadTx.RadTxDate), 101)
                    ELSE NULL
                END AS bcrdate,
            	
	            -- surgdate
	            CONVERT(varchar, Procedures.ProcDate, 101) AS surgdate,
	            Procedures.ProcName AS procname,

	            -- ttbcr
	            CASE
		            WHEN BCR.LabDate <= ISNULL(MIN(BCR_MedTx.MedTxDate),GETDATE()) AND BCR.LabDate <= ISNULL(MIN(BCR_RadTx.RadTxDate),GETDATE()) THEN DATEDIFF(day, Procedures.ProcDate, BCR.LabDate) / 365.25 
                    WHEN MIN(BCR_MedTx.MedTxDate) <= ISNULL(BCR.LabDate,GETDATE()) AND MIN(BCR_MedTx.MedTxDate) <= ISNULL(MIN(BCR_RadTx.RadTxDate),GETDATE()) THEN DATEDIFF(day, Procedures.ProcDate, MIN(BCR_MedTx.MedTxDate)) / 365.25
                    WHEN MIN(BCR_RadTx.RadTxDate) <= ISNULL(BCR.LabDate,GETDATE()) AND MIN(BCR_RadTx.RadTxDate) <= ISNULL(MIN(BCR_MedTx.MedTxDate),GETDATE()) THEN DATEDIFF(day, Procedures.ProcDate, MIN(BCR_RadTx.RadTxDate)) / 365.25
		            ELSE DATEDIFF(day, Procedures.ProcDate, LastPSA.LabDate) / 365.25
	            END AS ttbcr,
            	
	            -- recent psa (last psa lab date?)
	            CONVERT(varchar, LastPSA.LabDate, 101) AS lastpsadate
            	
            FROM
                Patients
                    INNER JOIN Procedures
			            ON Procedures.ProcedureId =
			            (
				            SELECT TOP 1 p.ProcedureId
				            FROM Procedures p
				            WHERE p.PatientId = Patients.PatientId
				            AND p.ProcName IN (
					            'CP','LP','LP_CONV','PP','RALP','RP','SalvCP','SalvLP','SalvRP'
				            )
				            ORDER BY
					            CASE p.ProcQuality
						            WHEN 'RR' THEN 4
                                    WHEN 'STD' THEN 3
                                    WHEN 'REV' THEN 2
                                    WHEN 'OUT' THEN 1
                                    ELSE 0
					            END DESC
			            )
                            
                    LEFT OUTER JOIN Surveys SD
                        ON SD.SurveyId = 
                        (
				            SELECT TOP 1 SA.SurveyId
                            FROM Surveys SA
                            WHERE SA.PatientId = Procedures.PatientId
                            AND SA.SurveyDate >= Procedures.ProcDate
                            AND SA.SurveyType = 'Prostate QOL Survey'
                            ORDER BY SA.SurveyDate DESC
                        )
                                    
                    LEFT OUTER JOIN LabTests
                        ON Patients.PatientId = LabTests.PatientId
                        AND LabTests.LabTest = 'PSA'
                        AND LabTests.LabTestId = 
                        (
                            SELECT TOP 1 LabTestId
                            FROM LabTests
                            WHERE PatientId = Procedures.PatientId
                            AND LabTest = 'PSA'
                            AND DATEDIFF(day,Procedures.ProcDate,LabDate) <= 0
                            ORDER BY DATEDIFF(day,Procedures.ProcDate,LabDate) DESC, 
                                CASE LabQuality
                                    WHEN 'RR' THEN 4
                                    WHEN 'STD' THEN 3
                                    WHEN 'REV' THEN 2
                                    WHEN 'OUT' THEN 1
                                    ELSE 0
                                END DESC, 
                                LabResult DESC
                        )
                        
                    LEFT OUTER JOIN LabTests LastPSA
			            ON Patients.PatientId = LastPSA.PatientId
			            AND LastPSA.LabTestId =
			            (
				            SELECT TOP 1 LabTestId
				            FROM NumericPSAs_CTE _lp
				            WHERE _lp.PatientId = Patients.PatientId
				            AND _lp.LabDate > Procedures.ProcDate
				            ORDER BY _lp.LabDate DESC
			            )

                    LEFT OUTER JOIN LabTests BCR
                        ON Patients.PatientId = BCR.PatientId
                        AND BCR.LabTestId =
                        (
                            SELECT TOP 1 LabTestId
                            FROM NumericPSAs_CTE _bcr
                            WHERE _bcr.PatientId = Procedures.PatientId
                            AND _bcr.LabDate > DATEADD(day, 30, Procedures.ProcDate)
                            AND _bcr.LabResult >= .2
                            ORDER BY _bcr.LabDate ASC
                        )
                        
                    
            			
                    LEFT OUTER JOIN MedicalTherapy BCR_MedTx
                        ON Procedures.PatientId = BCR_MedTx.PatientId
                        AND BCR_MedTx.MedTxDate >= DATEADD(month, 6, Procedures.ProcDate)
                        AND ((BCR_MedTx.MedTxType LIKE '%HORM%')
                            OR (BCR_MedTx.MedTxType = 'ORCH')
                            OR (BCR_MedTx.MedTxType ='Bilateral Orchiectomy')
                            OR (BCR_MedTx.MedTxType LIKE 'ORCH_BIL%')
                            OR (BCR_MedTx.MedTxType LIKE '%LHRH%')
                            OR (BCR_MedTx.MedTxType LIKE '%AA%')
                            OR (BCR_MedTx.MedTxType LIKE '%ESTROGEN%')
                            OR (BCR_MedTx.MedTxType LIKE '%PROGEST%'))
                            AND (BCR_MedTx.MedTxType NOT LIKE '%STOP')

                    LEFT OUTER JOIN RadiationTherapy BCR_RadTx
                        ON Procedures.PatientId = BCR_RadTx.PatientId
                        AND BCR_RadTx.RadTxDate >= DATEADD(month, 6, Procedures.ProcDate)
                        AND BCR_RadTx.RadTxType
                            IN ('XRT','EBRT','RT','COMBO','BRACHY','COMBO','RADIOISOTOPE','SEED','IMPLANT','Brachytherapy',
                                'External Beam','Radiation Therapy, Unspecified','External Beam, IMRT',
                                'High-Dose Rate Brachytherapy','External Beam, 3D Conventional','External Beam, 3D Conformal')
                                
		            -- last followup - coalesce:
		            -- EncType LIKE %FX% OR %FR%
		            LEFT OUTER JOIN Encounters Enc_Followup
			            ON Enc_Followup.EncounterId =
			            (
				            SELECT TOP 1 EncounterId
				            FROM Encounters
				            WHERE PatientId = Procedures.PatientId
				            AND EncDate > Procedures.ProcDate
				            AND (EncType LIKE '%FX%' OR EncType LIKE '%FR%')
				            ORDER BY EncDate DESC
			            )

            WHERE
                Patients.PatientId <> 29214 AND
                Patients.PatientId = @PatientId
            GROUP BY
	            Patients.PatientId, 
	            Enc_Followup.EncDate, SD.SurveyDate,
	            LabTests.LabResult,
	            BCR.LabDate, 
	            LastPSA.LabDate,
	            Procedures.ProcDate,
	            Procedures.ProcName
            	
            ORDER BY 
                Patients.PatientId
            ";
        #endregion

        private SqlConnection GetConnection()
        {
            return Connectivity.GetConnection();
        }

        public void ConsumeBCRStatus(int patientId, Func<IDataRecord, bool> consumer)
        {
            SqlCommand cmd = new SqlCommand(bcrSql);
            cmd.Parameters.AddWithValue("@PatientId", patientId);

            Connectivity.ConsumeRecord(cmd, new Connectivity.RecordConsumerDelegate(consumer));
        }

        private DataTable GetClinicalResults(int patientId, SqlConnection conn)
        {
            return GetResults(clinincalSql, patientId, conn);
        }

        private DataTable GetQuarterlySurveyResults(int patientId, SqlConnection conn)
        {
            return GetResults(quarterlySql, patientId, conn);
        }

        private DataTable GetResults(string sql, int patientId, SqlConnection conn)
        {
            SqlCommand cmd = new SqlCommand(sql, conn);
            cmd.Parameters.AddWithValue("@PatientId", patientId);

            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);

            return dt;
        }

        // combine (pivot based on survey quarter) quarterly results with clinical results
        public DataTable GetCombinedResults(int patientId)
        {
            using (SqlConnection conn = GetConnection())
            {
                DataTable clinical = GetClinicalResults(patientId, conn);
                DataTable quarterly = GetQuarterlySurveyResults(patientId, conn);

                string[] quarters = { "3", "6", "9", "12", "15", "18", "21", "24", "36", "48" };

                foreach (string q in quarters)
                {
                    clinical.Columns.Add("efpatient" + q);
                    clinical.Columns.Add("efsurgeon" + q);
                    clinical.Columns.Add("ufpatient" + q);
                    clinical.Columns.Add("ufsurgeon" + q);
                }

                foreach (DataRow qrow in quarterly.Rows)
                {
                    foreach (DataRow crow in clinical.Rows)
                    {
                        UpdateQS(qrow, crow);
                    }
                }

                return clinical;
            }
        }

        private void UpdateQS(DataRow sourceRow, DataRow targetRow)
        {
            string s = sourceRow["contact"].ToString();
            string q = s.Substring(0, s.IndexOf(' '));
            string[] fields = { "efpatient", "efsurgeon", "ufpatient", "ufsurgeon" };
            foreach (string f in fields)
            {
                if (!sourceRow.IsNull(f))
                    targetRow[f + q] = sourceRow[f];
            }
        }
    }
}
