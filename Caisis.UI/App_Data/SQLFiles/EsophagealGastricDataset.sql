-- Esophageal Gastric Dataset query
-- column order reflects flow of Esophageal Gastric eform

SELECT

	-- HPI - Demographics	
	MainPt.PtMRN  AS MRN,
	MainPt.PtLastName AS LastName,
	MainPt.PtFirstName AS Firstname,
	MainPt.PtGender AS Gender,
	MainPt.PtBirthDateText AS BirthDate,
	CASE
		WHEN MainPt.PtBirthDate IS NOT NULL
		THEN CASE
				WHEN (DateDiff(year, MainPt.PtBirthDate, GETDATE())  > 0)
					 AND (
						   DATEPART(mm,GETDATE()) <  DATEPART(mm,MainPt.PtBirthDate)
						   OR (
								DATEPART(mm,GETDATE()) =  DATEPART(mm,MainPt.PtBirthDate)
								AND DATEPART(dd,GETDATE()) <  DATEPART(d,MainPt.PtBirthDate)
							  )
						 )
					 THEN CONVERT(VARCHAR,DateDiff(year, MainPt.PtBirthDate, GETDATE()) - 1)	
				WHEN ((DateDiff(year, MainPt.PtBirthDate, GETDATE()) = 0) OR (DateDiff(month, MainPt.PtBirthDate, GETDATE()) < 12)) AND DateDiff(day, MainPt.PtBirthDate, GETDATE()) > 0 AND DateDiff(day, MainPt.PtBirthDate, GETDATE()) < 30 THEN '< 1 month' 
				WHEN ((DateDiff(year, MainPt.PtBirthDate, GETDATE()) = 0) OR (DateDiff(month, MainPt.PtBirthDate, GETDATE()) < 12)) AND DateDiff(day, MainPt.PtBirthDate, GETDATE()) >= 30 AND DateDiff(day, MainPt.PtBirthDate, GETDATE()) < 60 THEN '1 month' 
				WHEN ((DateDiff(year, MainPt.PtBirthDate, GETDATE()) = 0) OR (DateDiff(month, MainPt.PtBirthDate, GETDATE()) < 12)) AND DateDiff(day, MainPt.PtBirthDate, GETDATE()) >= 60 THEN CONVERT(VARCHAR,ABS(DATEPART(mm,GETDATE()) - DATEPART(mm,MainPt.PtBirthDate))) + ' months' 
				ELSE CONVERT(VARCHAR,DateDiff(year, MainPt.PtBirthDate, GETDATE()))					
			END	
		ELSE ''	 	 
	END AS Age,
	MainPt.PtRace AS Race,
	
	-- HPI - Chief Complaint
	Encounter.EncChiefComplaint AS ChiefComplaints,
	
    (
		SELECT TOP 1 EncHeight + ' cm'
		FROM Encounters
		WHERE PatientId = MainPt.PatientId
		AND EncHeight IS NOT NULL
		ORDER BY EncDate DESC
		FOR XML PATH('')
	) AS Height,

    (
		SELECT TOP 1 COALESCE(EncWeight + ' kg','') + COALESCE(' (' + EncDateText + ')','')
		FROM Encounters
		WHERE PatientId = MainPt.PatientId
		AND EncWeight IS NOT NULL
		AND
		(
			(
				PrimaryProcedure.ProcedureId IS NOT NULL
				AND EncDate <= PrimaryProcedure.ProcDate
			)
			OR
			(
				PrimaryProcedure.ProcedureId IS NULL				
			)
		)
		ORDER BY EncDate DESC
		FOR XML PATH('')
	) AS Weight,

    (
		SELECT TOP 1 COALESCE(EncBMI,'')
		FROM Encounters
		WHERE PatientId = MainPt.PatientId
		AND EncBMI IS NOT NULL
		AND
		(
			(
				PrimaryProcedure.ProcedureId IS NOT NULL
				AND EncDate <= PrimaryProcedure.ProcDate
			)
			OR
			(
				PrimaryProcedure.ProcedureId IS NULL				
			)
		)
		ORDER BY EncDate DESC
		FOR XML PATH('')
	) AS BMI,
	
	
	-- CORMOBIDITIES
	CASE
		WHEN Comorb_HTNRequiringMeds.ComorbidityId IS NOT NULL THEN 'Yes' + COALESCE('(' + Comorb_HTNRequiringMeds.ComorbDateText + ')','' )
		ELSE NULL
	END AS Comorb_HTN_requiring_meds,

	CASE
		WHEN Comorb_GERD.ComorbidityId IS NOT NULL THEN 'Yes' + COALESCE('(' + Comorb_GERD.ComorbDateText + ')','' )
		ELSE NULL
	END AS Comorb_GERD,

	CASE
		WHEN Comorb_MyocardialInfarctCAD.ComorbidityId IS NOT NULL THEN 'Yes' + COALESCE('(' + Comorb_MyocardialInfarctCAD.ComorbDateText + ')','' )
		ELSE NULL
	END AS Comorb_Myocardial_Infarct_CAD,

	CASE
		WHEN Comorb_10PerLossBodyWeight.ComorbidityId IS NOT NULL THEN 'Yes' + COALESCE('(' + Comorb_10PerLossBodyWeight.ComorbDateText + ')','' )
		ELSE NULL
	END AS Comorb_10Percent_Loss_Body_Weight_last_6_mo,

	CASE
		WHEN Comorb_PepticUlcerDisease.ComorbidityId IS NOT NULL THEN 'Yes' + COALESCE('(' + Comorb_PepticUlcerDisease.ComorbDateText + ')','' )
		ELSE NULL
	END AS Comorb_Peptic_Ulcer_Disease,

	(
		SELECT Comorbidity + COALESCE('(' + ComorbDateText + ')','' ) + ', '
		FROM Comorbidities
		WHERE PatientId = MainPt.PatientId
		AND Comorbidity NOT LIKE '%HTN%requiring%meds%'
		AND Comorbidity != 'GERD'
		AND Comorbidity NOT LIKE '%Myocardial%infarct%CAD%' 
		AND Comorbidity NOT LIKE '%>10% loss body weight last 6 mo%' 
		AND Comorbidity NOT LIKE '%Peptic%Ulcer%Disease%' 
		FOR XML PATH('')
	) AS Comorb_Other,

	
	-- PAST MEDICAL HISTORY - Social History
	CASE 
		WHEN SocialHistories.SocHxTobaccoType IS NULL THEN NULL
		WHEN SocialHistories.SocHxTobaccoType IN ('No', 'Never', 'Unknown') THEN SocialHistories.SocHxTobaccoType
		ELSE SocialHistories.SocHxTobaccoType + COALESCE(' : ' + SocialHistories.SocHxTobaccoPacksPerDay + ' pack(s)/day','') + COALESCE(' for ' + SocialHistories.SocHxTobaccoYears + ' years','') + CASE WHEN SocialHistories.SocHxTobaccoQuitYear LIKE '%current%' THEN COALESCE(', ' + SocialHistories.SocHxTobaccoQuitYear,'') ELSE COALESCE(' until ' + SocialHistories.SocHxTobaccoQuitYear,'') END + COALESCE(', ' + SocialHistories.SocHxOther,'')
	END AS SmokingHistory,	
	CASE 
		WHEN SocialHistories.SocHxAlcohol IS NULL THEN NULL
		WHEN SocialHistories.SocHxAlcohol IN ('No', 'Never', 'Unknown') THEN SocialHistories.SocHxAlcohol
		ELSE SocialHistories.SocHxAlcohol + COALESCE(' : ' + SocialHistories.SocHxAlcoholDrinksPerDay + ' drink(s)/day','')+ COALESCE(' for ' + SocialHistories.SocHxAlcoholYears + ' years','') + CASE WHEN SocialHistories.SocHxAlcoholQuitYear LIKE '%current%' THEN COALESCE(', ' + SocialHistories.SocHxAlcoholQuitYear,'') ELSE COALESCE(' until ' + SocialHistories.SocHxAlcoholQuitYear,'') END
	END AS AlcoholHistory,
	
	-- PRE OP STAGING
    (
		SELECT COALESCE(ClinStageDisease + ' ', '' ) + COALESCE(ClinStageSystem + ' ', '' ) + COALESCE(ClinStageT, '' ) + COALESCE(ClinStageN, '' ) + COALESCE(ClinStageM, '' ) + COALESCE('('+ClinStageDateText + ')', '' ) + ', '
		FROM ClinicalStages
		WHERE PatientId = MainPt.PatientId		
		FOR XML PATH('')
	) AS Clinical_Staging,

	(
		SELECT COALESCE(Status,'') + COALESCE(' (' + StatusDateText + ')','') + ', '
		FROM Status
		WHERE PatientId = MainPt.PatientId
		AND
		(
			Status LIKE '%complete%response%'
			OR Status LIKE '%distant%progression%'
			OR Status LIKE '%local%progression%'
			OR Status LIKE '%no%changes%'
			OR Status LIKE '%regression%'
		)		
		ORDER BY StatusDate DESC
		FOR XML PATH('')
	) AS Restaging,
	

	-- PRE OP ASSESSMENT
    (
		SELECT TOP 1 COALESCE(EncECOG_Score,'') + + COALESCE(' (' + EncDateText + ')','')
		FROM Encounters
		WHERE PatientId = MainPt.PatientId
		AND EncECOG_Score IS NOT NULL
		AND
		(
			(
				PrimaryProcedure.ProcedureId IS NOT NULL
				AND EncDate <= PrimaryProcedure.ProcDate
			)
			OR
			(
				PrimaryProcedure.ProcedureId IS NULL				
			)
		)
		ORDER BY EncDate DESC
		FOR XML PATH('')
	) AS  ECOG,
	
    (
		SELECT TOP 1 COALESCE(OpASA, '')
		FROM OperatingRoomDetails
		WHERE PatientId = MainPt.PatientId
		AND OpASA IS NOT NULL
		ORDER BY OpDate DESC
		FOR XML PATH('')
	) AS ASA_Score,
	
	
	CASE
		WHEN PreOpLab_1.LabTestId IS NOT NULL THEN COALESCE(PreOpLab_1.LabDateText + ' : ','') + COALESCE(PreOpLab_1.LabTest,'') + COALESCE(' ' + PreOpLab_1.LabResult,'')  + COALESCE(PreOpLab_1.LabUnits,'')
	END AS PreOp_Lab_1,

	CASE
		WHEN PreOpLab_2.LabTestId IS NOT NULL THEN COALESCE(PreOpLab_2.LabDateText + ' : ','') + COALESCE(PreOpLab_2.LabTest,'') + COALESCE(' ' + PreOpLab_2.LabResult,'')  + COALESCE(PreOpLab_2.LabUnits,'')
	END AS PreOp_Lab_2, 

	CASE
		WHEN PreOpLab_3.LabTestId IS NOT NULL THEN COALESCE(PreOpLab_3.LabDateText + ' : ','') + COALESCE(PreOpLab_3.LabTest,'') + COALESCE(' ' + PreOpLab_3.LabResult,'')  + COALESCE(PreOpLab_3.LabUnits,'')
	END AS PreOp_Lab_3,

	CASE
		WHEN PreOpLab_4.LabTestId IS NOT NULL THEN COALESCE(PreOpLab_4.LabDateText + ' : ','') + COALESCE(PreOpLab_4.LabTest,'') + COALESCE(' ' + PreOpLab_4.LabResult,'')  + COALESCE(PreOpLab_4.LabUnits,'')
	END AS PreOp_Lab_4,

	CASE
		WHEN PreOpLab_5.LabTestId IS NOT NULL THEN COALESCE(PreOpLab_5.LabDateText + ' : ','') + COALESCE(PreOpLab_5.LabTest,'') + COALESCE(' ' + PreOpLab_5.LabResult,'')  + COALESCE(PreOpLab_5.LabUnits,'')
	END AS PreOp_Lab_5,
	
	(
		SELECT LabTest + COALESCE(' : ' + LabDateText,'') + COALESCE(' : ' + LabResult,'') + ', '
		FROM LabTests
		WHERE 
			PatientId = MainPt.PatientId
			AND
			(
				-- primary procedure and date exists
				(
					PrimaryProcedure.ProcedureId IS NOT NULL
					AND PrimaryProcedure.ProcDate IS NOT NULL
					AND LabDate IS NOT NULL
					AND LabDate <= PrimaryProcedure.ProcDate
				)
				OR PrimaryProcedure.ProcDate IS NULL
	            OR LabDate IS NULL
			)
			AND LabTestId != COALESCE(PreOpLab_1.LabTestId,'')
			AND LabTestId != COALESCE(PreOpLab_2.LabTestId,'')
			AND LabTestId != COALESCE(PreOpLab_3.LabTestId,'')
			AND LabTestId != COALESCE(PreOpLab_4.LabTestId,'')
			AND LabTestId != COALESCE(PreOpLab_5.LabTestId,'')
		FOR XML PATH('')
	) AS PreOpLabs_Other,
	
	-- Neo Adjuvant Therapies		
	CASE
		WHEN Neo_Adjuvant_MedTx.MedicalTherapyId IS NOT NULL THEN 'Yes' + COALESCE(' : ' + Neo_Adjuvant_MedTx.MedTxAgent,'') + COALESCE(' (' + Neo_Adjuvant_MedTx.MedTxDateText + ')','')
		WHEN Neo_Adjuvant_MedTx.MedicalTherapyId IS NULL 
			 AND Any_MedTx.MedicalTherapyId IS NULL
		     AND NeoAdjuvantMedTx_AbsentEvent.AbsentEventId IS NOT NULL
		     THEN NeoAdjuvantMedTx_AbsentEvent.AbsentReason
		ELSE NULL
	END AS Neo_Adjuvant_Therapy,
	(
		SELECT MedTxAgent + ', '
		FROM MedicalTherapy medTx
		WHERE PatientId = MainPt.PatientId 
		AND medTx.MedTxDate IS NULL
		AND 
		(
			MedTxIntent IS NULL
			OR (MedTxIntent IS NOT NULL AND MedTxIntent NOT LIKE '%pre%op%' AND MedTxIntent NOT LIKE '%Neo%Adjuvant%' )
		)
		
		FOR XML PATH('')
	) AS Adjuvant_Therapy_WithNoDate,
	
	-- Pre Op Radiation Therapies		
	CASE
		WHEN PreOp_Radiation_RadTx.RadiationTherapyId IS NOT NULL THEN 'Yes' + COALESCE(' : ' + PreOp_Radiation_RadTx.RadTxType,'') + COALESCE(' (' + PreOp_Radiation_RadTx.RadTxDateText + ')','')
		WHEN PreOp_Radiation_RadTx.RadiationTherapyId IS NULL 
			 AND Any_RadTx.RadiationTherapyId IS NULL
		     AND PreOpRadTx_AbsentEvent.AbsentEventId IS NOT NULL
		     THEN PreOpRadTx_AbsentEvent.AbsentReason
		ELSE NULL
	END AS PreOp_Radiation_Therapy,
	(
		SELECT RadTxType + ', '
		FROM RadiationTherapy radTx
		WHERE PatientId = MainPt.PatientId 
		AND radTx.RadTxDate IS NULL
		AND 
		(
			RadTxIntent IS NULL
			OR (RadTxIntent IS NOT NULL AND RadTxIntent NOT LIKE '%pre%op%' AND RadTxIntent NOT LIKE '%Neo%Adjuvant%' )
		)		
		FOR XML PATH('')
	) AS Radiation_Therapy_WithNoDate,
	
	-- PRIMARY PROCEDURE
	
	PrimaryProcedure.ProcSurgeon AS PrimaryProcedure_Surgeon,
	PrimaryProcedure.ProcDateText AS PrimaryProcedure_Date,
	PrimaryProcedure.ProcName AS PrimaryProcedure,

	(
		SELECT ProcName + ', '
		FROM Procedures lympProc
		WHERE PatientId = MainPt.PatientId 
		AND lympProc.Procname LIKE '%Lymphadenectomy%'
		FOR XML PATH('')
	) AS Lymphadenectomy,

	(
		SELECT ProcName + ', '
		FROM Procedures resectedProc
		WHERE PatientId = MainPt.PatientId 
		AND resectedProc.Procname LIKE '%resected%'
		FOR XML PATH('')
	) AS Other_organ_resected,

	-- Intra-Op Complications
	CASE
		WHEN IntraOpComplications1.ToxicityId IS NOT NULL THEN IntraOpComplications1.ToxName + COALESCE(' (' + IntraOpComplications1.ToxDateText + ')','') 
		ELSE NULL
	END AS IntraOpComplications1,
	
	CASE
		WHEN IntraOpComplications2.ToxicityId IS NOT NULL THEN IntraOpComplications2.ToxName + COALESCE(' (' + IntraOpComplications2.ToxDateText + ')','') 
		ELSE NULL
	END AS IntraOpComplications2,

	CASE
		WHEN IntraOpComplications3.ToxicityId IS NOT NULL THEN IntraOpComplications3.ToxName + COALESCE(' (' + IntraOpComplications3.ToxDateText + ')','') 
		ELSE NULL
	END AS IntraOpComplications3,
	
		(
		SELECT ToxName + ', '
		FROM Toxicities
		WHERE PatientId = MainPt.PatientId
		AND ToxDate = PrimaryProcedure.ProcDate
		AND ToxicityId != COALESCE(IntraOpComplications1.ToxicityId,'')
		AND ToxicityId != COALESCE(IntraOpComplications2.ToxicityId,'')
		AND ToxicityId != COALESCE(IntraOpComplications3.ToxicityId,'')
		AND ToxName NOT IN 
		(
			'Re-admission within 14 days',
			'Re-admission within 30 days',
			'Re-operation within 30 days',
			'Highest Morbidity grade'
		)
		FOR XML PATH('')
	) AS  IntraOpComplications_Other,
	(
		SELECT ToxName + ', '
		FROM Toxicities
		WHERE PatientId = MainPt.PatientId
		AND ToxDate IS NULL
		AND ToxName NOT IN 
		(
			'Re-admission within 14 days',
			'Re-admission within 30 days',
			'Re-operation within 30 days',
			'Highest Morbidity grade'
		)
		FOR XML PATH('')
	) AS Complications_NoDateSpecified,
	
	
	OperatingRoomDetails.OpDuration AS Duration_Of_Operation_minutes,
	OperatingRoomDetails.OpEstBloodLoss AS Blood_Loss_mL,
	CASE 
		WHEN CHARINDEX('Lowest Heart Rate: ',OperatingRoomDetails.OpPostOpSummary) <> 0 
		THEN REPLACE (SUBSTRING(OperatingRoomDetails.OpPostOpSummary,CHARINDEX('Lowest Heart Rate: ',OperatingRoomDetails.OpPostOpSummary),CHARINDEX(' |',OperatingRoomDetails.OpPostOpSummary,CHARINDEX('Lowest Heart Rate: ',OperatingRoomDetails.OpPostOpSummary)) - CHARINDEX('Lowest Heart Rate: ',OperatingRoomDetails.OpPostOpSummary)),'Lowest Heart Rate: ','') 
		ELSE NULL 
	END AS Lowest_Heart_Rate,
	CASE 
		WHEN CHARINDEX('Lowest Mean Arterial Pressure: ',OperatingRoomDetails.OpPostOpSummary) <> 0 
		THEN REPLACE (SUBSTRING(OperatingRoomDetails.OpPostOpSummary,CHARINDEX('Lowest Mean Arterial Pressure: ',OperatingRoomDetails.OpPostOpSummary),CHARINDEX(' |',OperatingRoomDetails.OpPostOpSummary,CHARINDEX('Lowest Mean Arterial Pressure: ',OperatingRoomDetails.OpPostOpSummary)) - CHARINDEX('Lowest Mean Arterial Pressure: ',OperatingRoomDetails.OpPostOpSummary)),'Lowest Mean Arterial Pressure: ','') 
		ELSE NULL 
	END AS Lowest_Mean_Arterial_Pressure,	
	
	OperatingRoomDetails.OpRBC_Transfused AS RBC_Transfused,
	OperatingRoomDetails.OpRBC_PostOp AS RBC_Transfused_Post_Op,
	
	-- POST-OP COURSE - Hospitalization
	CASE 
		WHEN CHARINDEX('Initial Discharge From ICU: ',Hospitalizations.HospNotes) <> 0 
		THEN REPLACE (SUBSTRING(Hospitalizations.HospNotes,CHARINDEX('Initial Discharge From ICU: ',Hospitalizations.HospNotes),CHARINDEX(' |',Hospitalizations.HospNotes,CHARINDEX('Initial Discharge From ICU: ',Hospitalizations.HospNotes)) - CHARINDEX('Initial Discharge From ICU: ',Hospitalizations.HospNotes)),'Initial Discharge From ICU: ','') 
		ELSE NULL 
	END AS Initial_Discharge_From_ICU,
	CASE 
		WHEN CHARINDEX('Re-admission to ICU: ',Hospitalizations.HospNotes) <> 0 
		THEN REPLACE (SUBSTRING(Hospitalizations.HospNotes,CHARINDEX('Re-admission to ICU: ',Hospitalizations.HospNotes),CHARINDEX(' |',Hospitalizations.HospNotes,CHARINDEX('Re-admission to ICU: ',Hospitalizations.HospNotes)) - CHARINDEX('Re-admission to ICU: ',Hospitalizations.HospNotes)),'Re-admission to ICU: ','') 
		ELSE NULL 
	END AS Readmission_to_ICU,
	Hospitalizations.HospICUStay AS Total_ICU_Stay_Days,
	Hospitalizations.HospDischargeDateText AS Discharge_Date,

	-- Post-Op Complications
	CASE
		WHEN PostOpComplications1.ToxicityId IS NOT NULL THEN PostOpComplications1.ToxName + COALESCE(' (' + PostOpComplications1.ToxDateText + ')','') 
		ELSE NULL
	END AS PostOpComplications1,
	
	CASE
		WHEN PostOpComplications2.ToxicityId IS NOT NULL THEN PostOpComplications2.ToxName + COALESCE(' (' + PostOpComplications2.ToxDateText + ')','') 
		ELSE NULL
	END AS PostOpComplications2,

	CASE
		WHEN PostOpComplications3.ToxicityId IS NOT NULL THEN PostOpComplications3.ToxName + COALESCE(' (' + PostOpComplications3.ToxDateText + ')','') 
		ELSE NULL
	END AS PostOpComplications3,
	
		(
		SELECT ToxName + ', '
		FROM Toxicities
		WHERE PatientId = MainPt.PatientId
		AND ToxDate > PrimaryProcedure.ProcDate
		AND ToxicityId != COALESCE(PostOpComplications1.ToxicityId,'')
		AND ToxicityId != COALESCE(PostOpComplications2.ToxicityId,'')
		AND ToxicityId != COALESCE(PostOpComplications3.ToxicityId,'')
		AND ToxName NOT IN 
		(
			'Re-admission within 14 days',
			'Re-admission within 30 days',
			'Re-operation within 30 days',
			'Highest Morbidity grade'
		)
		ORDER BY ToxDate ASC
		FOR XML PATH('')
	) AS  PostOpComplications_Other,
	(
		SELECT ToxName + ', '
		FROM Toxicities
		WHERE PatientId = MainPt.PatientId
		AND ToxDate IS NULL
		AND ToxName NOT IN 
		(
			'Re-admission within 14 days',
			'Re-admission within 30 days',
			'Re-operation within 30 days',
			'Highest Morbidity grade'
		)
		FOR XML PATH('')
	) AS Complications_NoDateSpecified,

	CASE
		WHEN ReAdmissionWin14Days.ToxicityId IS NOT NULL THEN 'Yes' + COALESCE(' (' + ReAdmissionWin14Days.ToxDateText + ')','')
		ELSE NULL
	END AS Readmission_within_14_days,

	CASE
		WHEN ReAdmissionWin30Days.ToxicityId IS NOT NULL THEN 'Yes' + COALESCE(' (' + ReAdmissionWin30Days.ToxDateText + ')','')
		ELSE NULL
	END AS Readmission_within_30_days,

	CASE
		WHEN ReOperationWin30Days.ToxicityId IS NOT NULL THEN 'Yes' + COALESCE(' (' + ReOperationWin30Days.ToxDateText + ')','')
		ELSE NULL
	END AS Reoperation_within_30_days,

	CASE
		WHEN HighestMorbidityGrade.ToxicityId IS NOT NULL THEN COALESCE(HighestMorbidityGrade.ToxGrade,'') + COALESCE(' (' + ReAdmissionWin14Days.ToxDateText + ')','')
		ELSE NULL
	END AS Highest_Morbidity_Grade,
	
	-- Pathology
	CASE
		WHEN PathologyAbsentEvent.AbsentEventId IS NULL 
			  AND Pathology.PathologyId IS NULL
		     THEN NULL
		WHEN PathologyAbsentEvent.AbsentEventId IS NOT NULL 
		     AND Pathology.PathologyId IS NULL 
		     THEN PathologyAbsentEvent.AbsentReason
		ELSE Pathology.PathDateText
	END AS Pathology_Report,

	Pathology.PathNum AS Pathology_Num,
	Pathology.PathHistology AS Primary_Histology,
	Pathology.PathHistology2 AS Secondary_Histology,
	Pathology.PathNotes AS Pathology_Notes,
	Pathology.PathLymphaticInv AS Lymphatic_vessel_invasion,
	Pathology.PathVascularInv AS Venous_invasion,
	Pathology.PathPerineuralInv AS Neural_invasion,
	
	CASE
		WHEN PathFinding_NegativeMargins.PathologyFindingId IS NOT NULL THEN PathFinding_NegativeMargins.PathFindResult
		ELSE NULL
	END AS Negative_margins,
	
	CASE
		WHEN PathFinding_PositiveProximalMargin.PathologyFindingId IS NOT NULL THEN PathFinding_PositiveProximalMargin.PathFindResult
		ELSE NULL
	END AS Positive_proximal_margin,

	CASE
		WHEN PathFinding_PositiveDistalMargin.PathologyFindingId IS NOT NULL THEN PathFinding_PositiveDistalMargin.PathFindResult
		ELSE NULL
	END AS Positive_distal_margin,

	CASE
		WHEN PathFinding_PositiveRadialMargin.PathologyFindingId IS NOT NULL THEN PathFinding_PositiveRadialMargin.PathFindResult
		ELSE NULL
	END AS Positive_radial_margin,

    (
		SELECT COALESCE(PathFindSide + ' ', '' ) + COALESCE(PathFindSite + ' ', '' ) + COALESCE(PathFindSubsite + ' ', '' ) + COALESCE('tumor size: ' + PathFindWidth + 'cm ', '' ) + ', '
		FROM PathologyFinding
		WHERE PathologyId = Pathology.PathologyId
		AND 
		(
			PathFindSide IS NOT NULL 
			OR PathFindSite IS NOT NULL 
			OR PathFindSubsite IS NOT NULL 
			OR PathFindWidth IS NOT NULL 
		)
		AND PathologyId NOT IN
		(
			PathFinding_NegativeMargins.PathologyFindingId,
			PathFinding_PositiveProximalMargin.PathologyFindingId,
			PathFinding_PositiveDistalMargin.PathologyFindingId,
			PathFinding_PositiveRadialMargin.PathologyFindingId
		)
		FOR XML PATH('')
	) AS Pathology_Findings,
	
    (
		SELECT COALESCE(PathFindSite + ' ', '' ) + COALESCE(PathFindMaxDim + ' max dim (cm) ', '' ) + COALESCE(PathFindPosNodes + ' positive nodes ', '' ) + COALESCE(PathFindNumNodes + ' total nodes ', '' ) + COALESCE(PathFindHistology, '' ) + ', '
		FROM NodePathFinding
		WHERE PathologyId = Pathology.PathologyId
		AND 
		(
			PathFindSite IS NOT NULL 
			OR PathFindMaxDim IS NOT NULL 
			OR PathFindPosNodes IS NOT NULL 
			OR PathFindNumNodes IS NOT NULL 
			OR PathFindHistology IS NOT NULL 
		)
		FOR XML PATH('')
	) AS Pathology_Node_Findings,

    (
		SELECT COALESCE(ClinStageDisease + ' ', '' ) + COALESCE(ClinStageSystem + ' ', '' ) + COALESCE(ClinStageT, '' ) + COALESCE(ClinStageN, '' ) + COALESCE(ClinStageM, '' ) + COALESCE('('+ClinStageDateText + ')', '' ) + ', '
		FROM ClinicalStages
		WHERE PatientId = MainPt.PatientId		
		FOR XML PATH('')
	) AS Clinical_Staging,

    (
		SELECT COALESCE(PathStageDisease + ' ', '' ) + COALESCE(PathStageSystem + ' ', '' ) + COALESCE(PathStageT, '' ) + COALESCE(PathStageN, '' ) + COALESCE(PathStageM, '' ) + COALESCE(' Residual Tumor: ' + PathStageR, '' ) + COALESCE(' Group: ' + PathStageGroup, '' ) + COALESCE(' Grade: ' + PathGrade, '' ) + ', '
		FROM PathologyStageGrade
		WHERE PathologyId = Pathology.PathologyId		
		FOR XML PATH('')
	) AS Pathology_Staging,
	
	-- Adjuvant Therapies		
	CASE
		WHEN Adjuvant_MedTx.MedicalTherapyId IS NOT NULL THEN 'Yes' + COALESCE(' : ' + Adjuvant_MedTx.MedTxAgent,'') + COALESCE(' (' + Adjuvant_MedTx.MedTxDateText + ')','')
		WHEN Adjuvant_MedTx.MedicalTherapyId IS NULL 
			 AND Any_MedTx.MedicalTherapyId IS NULL
		     AND AdjuvantMedTx_AbsentEvent.AbsentEventId IS NOT NULL
		     THEN AdjuvantMedTx_AbsentEvent.AbsentReason
		ELSE NULL
	END AS Adjuvant_Therapy,
	(
		SELECT MedTxAgent + ', '
		FROM MedicalTherapy medTx
		WHERE PatientId = MainPt.PatientId 
		AND medTx.MedTxDate IS NULL
		AND 
		(
			MedTxIntent IS NULL
			OR (MedTxIntent IS NOT NULL AND MedTxIntent NOT LIKE '%post%op%' AND MedTxIntent NOT LIKE 'Adjuvant%' )
		)
		
		FOR XML PATH('')
	) AS Adjuvant_Therapy_WithNoDate,
	
	-- Post Op Radiation Therapies		
	CASE
		WHEN PostOp_Radiation_RadTx.RadiationTherapyId IS NOT NULL THEN 'Yes' + COALESCE(' : ' + PostOp_Radiation_RadTx.RadTxType,'') + COALESCE(' (' + PostOp_Radiation_RadTx.RadTxDateText + ')','')
		WHEN PostOp_Radiation_RadTx.RadiationTherapyId IS NULL 
			 AND Any_RadTx.RadiationTherapyId IS NULL
		     AND PostOpRadTx_AbsentEvent.AbsentEventId IS NOT NULL
		     THEN PostOpRadTx_AbsentEvent.AbsentReason
		ELSE NULL
	END AS PostOp_Radiation_Therapy,
	(
		SELECT RadTxType + ', '
		FROM RadiationTherapy radTx
		WHERE PatientId = MainPt.PatientId 
		AND radTx.RadTxDate IS NULL
		AND 
		(
			RadTxIntent IS NULL
			OR (RadTxIntent IS NOT NULL AND RadTxIntent NOT LIKE '%post%op%' AND RadTxIntent NOT LIKE 'Adjuvant%' )
		)		
		FOR XML PATH('')
	) AS Radiation_Therapy_WithNoDate,

	-- OUTCOMES - Last Contact Status
	CASE
		WHEN LastContactStatus.StatusId IS NOT NULL THEN COALESCE(LastContactStatus.Status,'') + COALESCE(' (' +LastContactStatus.StatusDateText + ')','' )
		ELSE NULL
	END AS LastContact_Status,
	CASE 
		WHEN CHARINDEX('Status based on: ',LastContactStatus.StatusNotes) <> 0 
		THEN REPLACE (SUBSTRING(LastContactStatus.StatusNotes,CHARINDEX('Status based on: ',LastContactStatus.StatusNotes),CHARINDEX(' |||',LastContactStatus.StatusNotes,CHARINDEX('Status based on: ',LastContactStatus.StatusNotes)) - CHARINDEX('Status based on: ',LastContactStatus.StatusNotes)),'Status based on: ','') 
		ELSE NULL 
	END AS LastContact_StatusBasedOn,
	CASE 
		WHEN CHARINDEX('Ongoing Treatment: ',LastContactStatus.StatusNotes) <> 0 
		THEN REPLACE (SUBSTRING(LastContactStatus.StatusNotes,CHARINDEX('Ongoing Treatment: ',LastContactStatus.StatusNotes),CHARINDEX(' |||',LastContactStatus.StatusNotes,CHARINDEX('Ongoing Treatment: ',LastContactStatus.StatusNotes)) - CHARINDEX('Ongoing Treatment: ',LastContactStatus.StatusNotes)),'Ongoing Treatment: ','') 
		ELSE NULL 
	END AS LastContact_OngoingTreatment,
	CASE 
		WHEN CHARINDEX('Other Notes: ',LastContactStatus.StatusNotes) <> 0 
		THEN REPLACE (SUBSTRING(LastContactStatus.StatusNotes,CHARINDEX('Other Notes: ',LastContactStatus.StatusNotes),CHARINDEX(' |||',LastContactStatus.StatusNotes,CHARINDEX('Other Notes: ',LastContactStatus.StatusNotes)) - CHARINDEX('Other Notes: ',LastContactStatus.StatusNotes)),'Other Notes: ','') 
		ELSE NULL 
	END AS LastContact_Notes,
	
	-- OUTCOMES - Recurrence
	RecurrenceStatus.StatusDateText AS Recurrence_Date,
	RecurrenceStatus.StatusNotes AS Sites_Of_Initial_Recurrence,

	-- OUTCOMES - Patient Death
	MainPt.PtDeathDateText AS DeathDate,
	MainPt.PtDeathCause AS CauseOfDeath,
	MainPt.PtDeathType AS DeathType




FROM
	Patients MainPt

		-- drive dates with the most recent primary procedure 
		LEFT OUTER JOIN Procedures PrimaryProcedure
			ON MainPt.PatientId = PrimaryProcedure.PatientId
			AND PrimaryProcedure.ProcedureId =
			(
				SELECT TOP 1 ProcedureId
				FROM Procedures
				WHERE PatientId = MainPt.PatientId
				AND Procedures.ProcPrimary = 'True'
				ORDER BY ProcDate DESC
			)
			
		-- sugery details (primary procedure) absent event test pivot; 
		LEFT OUTER JOIN AbsentEvents PrimaryProcedureAbsentEvent
			ON MainPt.PatientId = PrimaryProcedureAbsentEvent.PatientId
			AND PrimaryProcedureAbsentEvent.AbsentEventId =
			(
				SELECT TOP 1 AbsentEvents.AbsentEventId FROM AbsentEvents
				WHERE AbsentEvents.PatientId = MainPt.PatientId 
					  AND AbsentEvents.FieldValue LIKE '%Surgery%Detail%'
			    ORDER BY AbsentEvents.AbsentDate DESC, AbsentEvents.UpdatedTime DESC, AbsentEvents.EnteredTime
			)
			
		-- the "operation" should be that related to the primary procedure
		LEFT OUTER JOIN OperatingRoomDetails
			ON MainPt.PatientId = OperatingRoomDetails.PatientId
			AND PrimaryProcedure.OperatingRoomDetailId = 
				OperatingRoomDetails.OperatingRoomDetailId


		-- get the pathology record for the patient
		-- latest eform version links Pathology to Primary Procedure and OperatingRoomDetails		
		LEFT OUTER JOIN Pathology
			ON MainPt.PatientId = Pathology.PatientId
			AND Pathology.PathologyId =
			(
				SELECT TOP 1 PathologyId
				FROM Pathology
				WHERE PatientId = MainPt.PatientId
				AND (
				     ProcedureId = PrimaryProcedure.ProcedureId 
				     OR OperatingRoomDetailId = OperatingRoomDetails.OperatingRoomDetailId
				     OR PathDate = PrimaryProcedure.ProcDate
				     )
				ORDER BY PathDate DESC
			)

		-- pathology absent event test pivot; 
		LEFT OUTER JOIN AbsentEvents PathologyAbsentEvent
			ON MainPt.PatientId = PathologyAbsentEvent.PatientId
			AND PathologyAbsentEvent.AbsentEventId =
			(
				SELECT TOP 1 AbsentEvents.AbsentEventId FROM AbsentEvents
				WHERE AbsentEvents.PatientId = MainPt.PatientId 
					  AND AbsentEvents.FieldValue LIKE '%Pathology%Report%'
			    ORDER BY AbsentEvents.AbsentDate DESC, AbsentEvents.UpdatedTime DESC, AbsentEvents.EnteredTime
			)
			
		-- encounter pivit; either get encounter closest to primary procedure, or the most recent encounter in general
		LEFT OUTER JOIN Encounters Encounter
			ON MainPt.PatientId = Encounter.PatientId
			AND Encounter.EncounterId =
			(
				SELECT TOP 1 EncounterId
				FROM Encounters
				WHERE 
					PatientId = MainPt.PatientId
					AND
					(
						-- primary procedure and date exists
						(
							PrimaryProcedure.ProcedureId IS NOT NULL
							AND PrimaryProcedure.ProcDate IS NOT NULL
							AND EncDate <= PrimaryProcedure.ProcDate
						)
						OR PrimaryProcedure.ProcDate IS NULL
						OR EncDate IS NULL						
					)
					 
				ORDER BY EncDate DESC
			)

		-- comorbidity pivots
		-- HTN requiring meds
		LEFT OUTER JOIN Comorbidities Comorb_HTNRequiringMeds
			ON Comorb_HTNRequiringMeds.PatientId = MainPt.PatientId			
			AND Comorb_HTNRequiringMeds.ComorbidityId =
			(
				SELECT TOP 1 ComorbidityId FROM Comorbidities
				WHERE Comorbidities.PatientId = MainPt.PatientId 
				      AND Comorbidities.Comorbidity LIKE '%HTN%requiring%meds%' 
			    ORDER BY ComorbDate DESC
			)

		-- GERD
		LEFT OUTER JOIN Comorbidities Comorb_GERD
			ON Comorb_GERD.PatientId = MainPt.PatientId			
			AND Comorb_GERD.ComorbidityId =
			(
				SELECT TOP 1 ComorbidityId FROM Comorbidities
				WHERE Comorbidities.PatientId = MainPt.PatientId 
				      AND Comorbidities.Comorbidity = 'GERD' 
			    ORDER BY ComorbDate DESC
			)

		-- Myocardial infarct/CAD
		LEFT OUTER JOIN Comorbidities Comorb_MyocardialInfarctCAD
			ON Comorb_MyocardialInfarctCAD.PatientId = MainPt.PatientId			
			AND Comorb_MyocardialInfarctCAD.ComorbidityId =
			(
				SELECT TOP 1 ComorbidityId FROM Comorbidities
				WHERE Comorbidities.PatientId = MainPt.PatientId 
				      AND Comorbidities.Comorbidity LIKE '%Myocardial%infarct%CAD%' 
			    ORDER BY ComorbDate DESC
			)

		-- >10% loss body weight last 6 mo
		LEFT OUTER JOIN Comorbidities Comorb_10PerLossBodyWeight
			ON Comorb_10PerLossBodyWeight.PatientId = MainPt.PatientId			
			AND Comorb_10PerLossBodyWeight.ComorbidityId =
			(
				SELECT TOP 1 ComorbidityId FROM Comorbidities
				WHERE Comorbidities.PatientId = MainPt.PatientId 
				      AND Comorbidities.Comorbidity LIKE '%>10% loss body weight last 6 mo%' 
			    ORDER BY ComorbDate DESC
			)

		-- Peptic Ulcer Disease
		LEFT OUTER JOIN Comorbidities Comorb_PepticUlcerDisease
			ON Comorb_PepticUlcerDisease.PatientId = MainPt.PatientId			
			AND Comorb_PepticUlcerDisease.ComorbidityId =
			(
				SELECT TOP 1 ComorbidityId FROM Comorbidities
				WHERE Comorbidities.PatientId = MainPt.PatientId 
				      AND Comorbidities.Comorbidity LIKE '%Peptic%Ulcer%Disease%' 
			    ORDER BY ComorbDate DESC
			)

		-- social history test pivot
		LEFT OUTER JOIN SocialHistories
			ON MainPt.PatientId = SocialHistories.PatientId	

		-- pre op lab test pivots
		LEFT OUTER JOIN LabTests PreOpLab_1
			ON MainPt.PatientId = PreOpLab_1.PatientId
			AND PreOpLab_1.LabTestId =
			(
				SELECT TOP 5 ptLab.LabTestId FROM LabTests
				INNER JOIN
				(SELECT ROW_NUMBER() OVER(ORDER BY LabDate DESC) OrdinalRow, LabTests.* 
				 FROM LabTests 
				 LEFT JOIN Patients pt ON pt.PatientId = LabTests.Patientid
				 WHERE LabTests.PatientId = MainPt.PatientId  
				 ) ptLab ON ptLab.LabTestId = LabTests.LabTestId
				WHERE ptLab.OrdinalRow = 1 
					AND 
					(
						(
							PrimaryProcedure.ProcedureId IS NOT NULL
							AND PrimaryProcedure.ProcDate IS NOT NULL
							AND ptLab.LabDate IS NOT NULL
							AND ptLab.LabDate <= PrimaryProcedure.ProcDate
						)
						OR PrimaryProcedure.ProcDate IS NULL
			            OR ptLab.LabDate IS NULL
					)
			    ORDER BY ptLab.LabDate DESC, ptLab.LabTest ASC 
			)

		LEFT OUTER JOIN LabTests PreOpLab_2
			ON MainPt.PatientId = PreOpLab_2.PatientId
			AND PreOpLab_2.LabTestId =
			(
				SELECT TOP 5 ptLab.LabTestId FROM LabTests
				INNER JOIN
				(SELECT ROW_NUMBER() OVER(ORDER BY LabDate DESC) OrdinalRow, LabTests.* 
				 FROM LabTests 
				 LEFT JOIN Patients pt ON pt.PatientId = LabTests.Patientid
				 WHERE LabTests.PatientId = MainPt.PatientId  
				 ) ptLab ON ptLab.LabTestId = LabTests.LabTestId
				WHERE ptLab.OrdinalRow = 2 
					AND 
					(
						(
							PrimaryProcedure.ProcedureId IS NOT NULL
							AND PrimaryProcedure.ProcDate IS NOT NULL
							AND ptLab.LabDate IS NOT NULL
							AND ptLab.LabDate <= PrimaryProcedure.ProcDate
						)
						OR PrimaryProcedure.ProcDate IS NULL
			            OR ptLab.LabDate IS NULL
					)
			    ORDER BY ptLab.LabDate DESC, ptLab.LabTest ASC 
			)

		LEFT OUTER JOIN LabTests PreOpLab_3
			ON MainPt.PatientId = PreOpLab_3.PatientId
			AND PreOpLab_3.LabTestId =
			(
				SELECT TOP 5 ptLab.LabTestId FROM LabTests
				INNER JOIN
				(SELECT ROW_NUMBER() OVER(ORDER BY LabDate DESC) OrdinalRow, LabTests.* 
				 FROM LabTests 
				 LEFT JOIN Patients pt ON pt.PatientId = LabTests.Patientid
				 WHERE LabTests.PatientId = MainPt.PatientId  
				 ) ptLab ON ptLab.LabTestId = LabTests.LabTestId
				WHERE ptLab.OrdinalRow = 3
					AND 
					(
						(
							PrimaryProcedure.ProcedureId IS NOT NULL
							AND PrimaryProcedure.ProcDate IS NOT NULL
							AND ptLab.LabDate IS NOT NULL
							AND ptLab.LabDate <= PrimaryProcedure.ProcDate
						)
						OR PrimaryProcedure.ProcDate IS NULL
			            OR ptLab.LabDate IS NULL
					)
			    ORDER BY ptLab.LabDate DESC, ptLab.LabTest ASC 
			)

		LEFT OUTER JOIN LabTests PreOpLab_4
			ON MainPt.PatientId = PreOpLab_4.PatientId
			AND PreOpLab_4.LabTestId =
			(
				SELECT TOP 5 ptLab.LabTestId FROM LabTests
				INNER JOIN
				(SELECT ROW_NUMBER() OVER(ORDER BY LabDate DESC) OrdinalRow, LabTests.* 
				 FROM LabTests 
				 LEFT JOIN Patients pt ON pt.PatientId = LabTests.Patientid
				 WHERE LabTests.PatientId = MainPt.PatientId  
				 ) ptLab ON ptLab.LabTestId = LabTests.LabTestId
				WHERE ptLab.OrdinalRow = 4
					AND 
					(
						(
							PrimaryProcedure.ProcedureId IS NOT NULL
							AND PrimaryProcedure.ProcDate IS NOT NULL
							AND ptLab.LabDate IS NOT NULL
							AND ptLab.LabDate <= PrimaryProcedure.ProcDate
						)
						OR PrimaryProcedure.ProcDate IS NULL
			            OR ptLab.LabDate IS NULL
					)
			    ORDER BY ptLab.LabDate DESC, ptLab.LabTest ASC 
			)

		LEFT OUTER JOIN LabTests PreOpLab_5
			ON MainPt.PatientId = PreOpLab_5.PatientId
			AND PreOpLab_5.LabTestId =
			(
				SELECT TOP 5 ptLab.LabTestId FROM LabTests
				INNER JOIN
				(SELECT ROW_NUMBER() OVER(ORDER BY LabDate DESC) OrdinalRow, LabTests.* 
				 FROM LabTests 
				 LEFT JOIN Patients pt ON pt.PatientId = LabTests.Patientid
				 WHERE LabTests.PatientId = MainPt.PatientId  
				 ) ptLab ON ptLab.LabTestId = LabTests.LabTestId
				WHERE ptLab.OrdinalRow = 5
					AND 
					(
						(
							PrimaryProcedure.ProcedureId IS NOT NULL
							AND PrimaryProcedure.ProcDate IS NOT NULL
							AND ptLab.LabDate IS NOT NULL
							AND 
							(
								ptLab.LabDate <= PrimaryProcedure.ProcDate
							)
						)
						OR PrimaryProcedure.ProcDate IS NULL
			            OR ptLab.LabDate IS NULL
					)
			    ORDER BY ptLab.LabDate DESC, ptLab.LabTest ASC 
			)

		-- neo adjuvant medical therapy absent event test pivot; 
		LEFT OUTER JOIN AbsentEvents NeoAdjuvantMedTx_AbsentEvent
			ON MainPt.PatientId = NeoAdjuvantMedTx_AbsentEvent.PatientId
			AND NeoAdjuvantMedTx_AbsentEvent.AbsentEventId =
			(
				SELECT TOP 1 AbsentEvents.AbsentEventId FROM AbsentEvents
				WHERE AbsentEvents.PatientId = MainPt.PatientId 
					  AND AbsentEvents.FieldValue LIKE '%Neo%Adjuvant%Therapies%'
			    ORDER BY AbsentEvents.AbsentDate DESC, AbsentEvents.UpdatedTime DESC, AbsentEvents.EnteredTime
			)
		
		-- any medical therapy test pivot
		LEFT OUTER JOIN MedicalTherapy Any_MedTx
			ON MainPt.PatientId = Any_MedTx.PatientId
			AND Any_MedTx.MedicalTherapyId =
			(
				SELECT TOP 1 MedicalTherapyId
				FROM MedicalTherapy
				WHERE PatientId = MainPt.PatientId
			)
					
		-- neo adjuvant medical therapy (take date closest to before surgery)
		LEFT OUTER JOIN MedicalTherapy Neo_Adjuvant_MedTx
			ON MainPt.PatientId = Neo_Adjuvant_MedTx.PatientId
			AND Neo_Adjuvant_MedTx.MedicalTherapyId =
			(
				SELECT TOP 1 MedicalTherapyId
				FROM MedicalTherapy
				WHERE PatientId = MainPt.PatientId
				AND 
				(
					MedTxDate < PrimaryProcedure.ProcDate
					OR MedTxIntent LIKE '%pre%op%'
					OR MedTxIntent LIKE '%Neo%Adjuvant%'
				)
				ORDER BY MedTxDate DESC
			)

		-- adjuvant medical therapy absent event test pivot; 
		LEFT OUTER JOIN AbsentEvents AdjuvantMedTx_AbsentEvent
			ON MainPt.PatientId = AdjuvantMedTx_AbsentEvent.PatientId
			AND AdjuvantMedTx_AbsentEvent.AbsentEventId =
			(
				SELECT TOP 1 AbsentEvents.AbsentEventId FROM AbsentEvents
				WHERE AbsentEvents.PatientId = MainPt.PatientId 
					  AND AbsentEvents.FieldValue LIKE 'Adjuvant%Therapies%'
			    ORDER BY AbsentEvents.AbsentDate DESC, AbsentEvents.UpdatedTime DESC, AbsentEvents.EnteredTime
			)
					
		-- adjuvant medical therapy (take date closest to after surgery)
		LEFT OUTER JOIN MedicalTherapy Adjuvant_MedTx
			ON MainPt.PatientId = Adjuvant_MedTx.PatientId
			AND Adjuvant_MedTx.MedicalTherapyId =
			(
				SELECT TOP 1 MedicalTherapyId
				FROM MedicalTherapy
				WHERE PatientId = MainPt.PatientId
				AND 
				(
					MedTxDate >= PrimaryProcedure.ProcDate
					OR MedTxIntent LIKE '%post%op%'
					OR MedTxIntent LIKE 'Adjuvant%'
				)
				ORDER BY MedTxDate ASC
			)

		-- pre op radiation therapy absent event test pivot; 
		LEFT OUTER JOIN AbsentEvents PreOpRadTx_AbsentEvent
			ON MainPt.PatientId = PreOpRadTx_AbsentEvent.PatientId
			AND PreOpRadTx_AbsentEvent.AbsentEventId =
			(
				SELECT TOP 1 AbsentEvents.AbsentEventId FROM AbsentEvents
				WHERE AbsentEvents.PatientId = MainPt.PatientId 
					  AND AbsentEvents.FieldValue LIKE '%Pre%op%Radiation%Therapies%'
			    ORDER BY AbsentEvents.AbsentDate DESC, AbsentEvents.UpdatedTime DESC, AbsentEvents.EnteredTime
			)
		
		-- any radiation therapy test pivot
		LEFT OUTER JOIN RadiationTherapy Any_RadTx
			ON MainPt.PatientId = Any_RadTx.PatientId
			AND Any_RadTx.RadiationTherapyId =
			(
				SELECT TOP 1 RadiationTherapyId
				FROM RadiationTherapy
				WHERE PatientId = MainPt.PatientId
			)
					
		-- pre op radiation therapy (take date closest to before surgery)
		LEFT OUTER JOIN RadiationTherapy PreOp_Radiation_RadTx
			ON MainPt.PatientId = PreOp_Radiation_RadTx.PatientId
			AND PreOp_Radiation_RadTx.RadiationTherapyId =
			(
				SELECT TOP 1 RadiationTherapyId
				FROM RadiationTherapy
				WHERE PatientId = MainPt.PatientId
				AND 
				(
					RadTxDate < PrimaryProcedure.ProcDate
					OR RadTxIntent LIKE '%pre%op%'
					OR RadTxIntent LIKE '%Neo%Adjuvant%'
				)
				ORDER BY RadTxDate DESC
			)

		-- post op radiation therapy absent event test pivot; 
		LEFT OUTER JOIN AbsentEvents PostOpRadTx_AbsentEvent
			ON MainPt.PatientId = PostOpRadTx_AbsentEvent.PatientId
			AND PostOpRadTx_AbsentEvent.AbsentEventId =
			(
				SELECT TOP 1 AbsentEvents.AbsentEventId FROM AbsentEvents
				WHERE AbsentEvents.PatientId = MainPt.PatientId 
					  AND AbsentEvents.FieldValue LIKE '%Post%op%Radiation%Therapies%'
			    ORDER BY AbsentEvents.AbsentDate DESC, AbsentEvents.UpdatedTime DESC, AbsentEvents.EnteredTime
			)
		
				
		-- post op radiation therapy (take date closest to after surgery)
		LEFT OUTER JOIN RadiationTherapy PostOp_Radiation_RadTx
			ON MainPt.PatientId = PostOp_Radiation_RadTx.PatientId
			AND PostOp_Radiation_RadTx.RadiationTherapyId =
			(
				SELECT TOP 1 RadiationTherapyId
				FROM RadiationTherapy
				WHERE PatientId = MainPt.PatientId
				AND 
				(
					RadTxDate >= PrimaryProcedure.ProcDate
					OR RadTxIntent LIKE '%post%op%'
					OR RadTxIntent LIKE 'Adjuvant%'
				)
				ORDER BY RadTxDate ASC
			)


		-- Intraoperative Complications test pivot
		LEFT OUTER JOIN Toxicities IntraOpComplications1
			ON MainPt.PatientId = IntraOpComplications1.PatientId
			AND IntraOpComplications1.ToxicityId =
			(				
				SELECT TOP 3 ptTx.ToxicityId FROM Toxicities
				INNER JOIN
				(SELECT ROW_NUMBER() OVER(ORDER BY ToxDate DESC) OrdinalRow, Toxicities.*
				 FROM Toxicities 
				 WHERE Toxicities.PatientId = MainPt.PatientId
				 ) ptTx ON ptTx.ToxicityId = Toxicities.ToxicityId
				WHERE ptTx.OrdinalRow = 1
						AND		
						(		
					 		-- primary procedure and date exists
							(
								PrimaryProcedure.ProcedureId IS NOT NULL
								AND PrimaryProcedure.ProcDate IS NOT NULL
								AND ptTx.ToxDate IS NOT NULL
								AND ptTx.ToxDate = PrimaryProcedure.ProcDate
							)
							OR
							(
								ptTx.ToxRelatedTo = 'Surgery'
							)
						)
						AND ptTx.ToxName NOT IN 
						(
							'Re-admission within 14 days',
							'Re-admission within 30 days',
							'Re-operation within 30 days',
							'Highest Morbidity grade'
						)
			    ORDER BY ptTx.ToxDate DESC
			)	

		LEFT OUTER JOIN Toxicities IntraOpComplications2
			ON MainPt.PatientId = IntraOpComplications2.PatientId
			AND IntraOpComplications2.ToxicityId =
			(				
				SELECT TOP 3 ptTx.ToxicityId FROM Toxicities
				INNER JOIN
				(SELECT ROW_NUMBER() OVER(ORDER BY ToxDate DESC) OrdinalRow, Toxicities.*
				 FROM Toxicities 
				 WHERE Toxicities.PatientId = MainPt.PatientId
				 ) ptTx ON ptTx.ToxicityId = Toxicities.ToxicityId
				WHERE ptTx.OrdinalRow = 2
						AND		
						(		
					 		-- primary procedure and date exists
							(
								PrimaryProcedure.ProcedureId IS NOT NULL
								AND PrimaryProcedure.ProcDate IS NOT NULL
								AND ptTx.ToxDate IS NOT NULL
								AND ptTx.ToxDate = PrimaryProcedure.ProcDate
							)
							OR
							(
								ptTx.ToxRelatedTo = 'Surgery'
							)
						)
						AND ptTx.ToxName NOT IN 
						(
							'Re-admission within 14 days',
							'Re-admission within 30 days',
							'Re-operation within 30 days',
							'Highest Morbidity grade'
						)
			    ORDER BY ptTx.ToxDate DESC
			)	

		LEFT OUTER JOIN Toxicities IntraOpComplications3
			ON MainPt.PatientId = IntraOpComplications3.PatientId
			AND IntraOpComplications3.ToxicityId =
			(				
				SELECT TOP 3 ptTx.ToxicityId FROM Toxicities
				INNER JOIN
				(SELECT ROW_NUMBER() OVER(ORDER BY ToxDate DESC) OrdinalRow, Toxicities.*
				 FROM Toxicities 
				 WHERE Toxicities.PatientId = MainPt.PatientId
				 ) ptTx ON ptTx.ToxicityId = Toxicities.ToxicityId
				WHERE ptTx.OrdinalRow = 3
						AND		
						(		
					 		-- primary procedure and date exists
							(
								PrimaryProcedure.ProcedureId IS NOT NULL
								AND PrimaryProcedure.ProcDate IS NOT NULL
								AND ptTx.ToxDate IS NOT NULL
								AND ptTx.ToxDate = PrimaryProcedure.ProcDate
							)
							OR
							(
								ptTx.ToxRelatedTo = 'Surgery'
							)
						)
						AND ptTx.ToxName NOT IN 
						(
							'Re-admission within 14 days',
							'Re-admission within 30 days',
							'Re-operation within 30 days',
							'Highest Morbidity grade'
						)
			    ORDER BY ptTx.ToxDate DESC
			)	

		-- find earliest post-op hospitalization
		LEFT OUTER JOIN Hospitalizations
			ON MainPt.PatientId = Hospitalizations.PatientId
			AND Hospitalizations.HospitalizationId =
			(
				SELECT TOP 1 HospitalizationId
				FROM Hospitalizations
				WHERE PatientId = MainPt.PatientId
				AND HospDischargeDate >= OperatingRoomDetails.OpDate
				ORDER BY HospAdmitDate ASC
			)

		-- Post operative Complications test pivot
		LEFT OUTER JOIN Toxicities PostOpComplications1
			ON MainPt.PatientId = PostOpComplications1.PatientId
			AND PostOpComplications1.ToxicityId =
			(				
				SELECT TOP 3 ptTx.ToxicityId FROM Toxicities
				INNER JOIN
				(SELECT ROW_NUMBER() OVER(ORDER BY ToxDate DESC) OrdinalRow, Toxicities.*
				 FROM Toxicities 
				 WHERE Toxicities.PatientId = MainPt.PatientId
				 ) ptTx ON ptTx.ToxicityId = Toxicities.ToxicityId
				WHERE ptTx.OrdinalRow = 1
						AND		
						(		
					 		-- primary procedure and date exists
							(
								PrimaryProcedure.ProcedureId IS NOT NULL
								AND PrimaryProcedure.ProcDate IS NOT NULL
								AND ptTx.ToxDate IS NOT NULL
								AND ptTx.ToxDate > PrimaryProcedure.ProcDate
							)
							OR
							(
								ptTx.ToxRelatedTo = 'Surgery'
							)
						)
						AND ptTx.ToxName NOT IN 
						(
							'Re-admission within 14 days',
							'Re-admission within 30 days',
							'Re-operation within 30 days',
							'Highest Morbidity grade'
						)
			    ORDER BY ptTx.ToxDate ASC
			)	

		LEFT OUTER JOIN Toxicities PostOpComplications2
			ON MainPt.PatientId = PostOpComplications2.PatientId
			AND PostOpComplications2.ToxicityId =
			(				
				SELECT TOP 3 ptTx.ToxicityId FROM Toxicities
				INNER JOIN
				(SELECT ROW_NUMBER() OVER(ORDER BY ToxDate DESC) OrdinalRow, Toxicities.*
				 FROM Toxicities 
				 WHERE Toxicities.PatientId = MainPt.PatientId
				 ) ptTx ON ptTx.ToxicityId = Toxicities.ToxicityId
				WHERE ptTx.OrdinalRow = 2
						AND		
						(		
					 		-- primary procedure and date exists
							(
								PrimaryProcedure.ProcedureId IS NOT NULL
								AND PrimaryProcedure.ProcDate IS NOT NULL
								AND ptTx.ToxDate IS NOT NULL
								AND ptTx.ToxDate > PrimaryProcedure.ProcDate
							)
							OR
							(
								ptTx.ToxRelatedTo = 'Surgery'
							)
						)
						AND ptTx.ToxName NOT IN 
						(
							'Re-admission within 14 days',
							'Re-admission within 30 days',
							'Re-operation within 30 days',
							'Highest Morbidity grade'
						)
			    ORDER BY ptTx.ToxDate ASC
			)	

		LEFT OUTER JOIN Toxicities PostOpComplications3
			ON MainPt.PatientId = PostOpComplications3.PatientId
			AND PostOpComplications3.ToxicityId =
			(				
				SELECT TOP 3 ptTx.ToxicityId FROM Toxicities
				INNER JOIN
				(SELECT ROW_NUMBER() OVER(ORDER BY ToxDate DESC) OrdinalRow, Toxicities.*
				 FROM Toxicities 
				 WHERE Toxicities.PatientId = MainPt.PatientId
				 ) ptTx ON ptTx.ToxicityId = Toxicities.ToxicityId
				WHERE ptTx.OrdinalRow = 3
						AND		
						(		
					 		-- primary procedure and date exists
							(
								PrimaryProcedure.ProcedureId IS NOT NULL
								AND PrimaryProcedure.ProcDate IS NOT NULL
								AND ptTx.ToxDate IS NOT NULL
								AND ptTx.ToxDate > PrimaryProcedure.ProcDate
							)
							OR
							(
								ptTx.ToxRelatedTo = 'Surgery'
							)
						)
						AND ptTx.ToxName NOT IN 
						(
							'Re-admission within 14 days',
							'Re-admission within 30 days',
							'Re-operation within 30 days',
							'Highest Morbidity grade'
						)
			    ORDER BY ptTx.ToxDate ASC
			)	

		LEFT OUTER JOIN Toxicities ReAdmissionWin14Days
			ON MainPt.PatientId = ReAdmissionWin14Days.PatientId
			AND ReAdmissionWin14Days.ToxicityId =
			(
				SELECT TOP 1 ToxicityId
				FROM Toxicities
				WHERE PatientId = MainPt.PatientId
				AND ToxName = 'Re-admission within 14 days'
				ORDER BY ToxDate ASC
			)

		LEFT OUTER JOIN Toxicities ReAdmissionWin30Days
			ON MainPt.PatientId = ReAdmissionWin30Days.PatientId
			AND ReAdmissionWin30Days.ToxicityId =
			(
				SELECT TOP 1 ToxicityId
				FROM Toxicities
				WHERE PatientId = MainPt.PatientId
				AND ToxName = 'Re-admission within 30 days'
				ORDER BY ToxDate ASC
			)

		LEFT OUTER JOIN Toxicities ReOperationWin30Days
			ON MainPt.PatientId = ReOperationWin30Days.PatientId
			AND ReOperationWin30Days.ToxicityId =
			(
				SELECT TOP 1 ToxicityId
				FROM Toxicities
				WHERE PatientId = MainPt.PatientId
				AND ToxName = 'Re-operation within 30 days'
				ORDER BY ToxDate ASC
			)

		LEFT OUTER JOIN Toxicities HighestMorbidityGrade
			ON MainPt.PatientId = HighestMorbidityGrade.PatientId
			AND HighestMorbidityGrade.ToxicityId =
			(
				SELECT TOP 1 ToxicityId
				FROM Toxicities
				WHERE PatientId = MainPt.PatientId
				AND ToxName = 'Highest Morbidity Grade'
				ORDER BY ToxDate ASC
			)


		LEFT OUTER JOIN PathologyFinding PathFinding_NegativeMargins
			ON Pathology.PathologyId = PathFinding_NegativeMargins.PathologyId
			AND PathFinding_NegativeMargins.PathologyFindingId =
			(
				SELECT TOP 1 PathologyFindingId
				FROM PathologyFinding
				WHERE PathologyId = Pathology.PathologyId
				AND PathFinding LIKE '%Negative%margins%'
			)

		LEFT OUTER JOIN PathologyFinding PathFinding_PositiveProximalMargin
			ON Pathology.PathologyId = PathFinding_PositiveProximalMargin.PathologyId
			AND PathFinding_PositiveProximalMargin.PathologyFindingId =
			(
				SELECT TOP 1 PathologyFindingId
				FROM PathologyFinding
				WHERE PathologyId = Pathology.PathologyId
				AND PathFinding LIKE '%Positive%proximal%margin%'
			)

		LEFT OUTER JOIN PathologyFinding PathFinding_PositiveDistalMargin
			ON Pathology.PathologyId = PathFinding_PositiveDistalMargin.PathologyId
			AND PathFinding_PositiveDistalMargin.PathologyFindingId =
			(
				SELECT TOP 1 PathologyFindingId
				FROM PathologyFinding
				WHERE PathologyId = Pathology.PathologyId
				AND PathFinding LIKE '%Positive%distal%margin%'
			)

		LEFT OUTER JOIN PathologyFinding PathFinding_PositiveRadialMargin
			ON Pathology.PathologyId = PathFinding_PositiveRadialMargin.PathologyId
			AND PathFinding_PositiveRadialMargin.PathologyFindingId =
			(
				SELECT TOP 1 PathologyFindingId
				FROM PathologyFinding
				WHERE PathologyId = Pathology.PathologyId
				AND PathFinding LIKE '%Positive%radial%margin%'
			)


		LEFT OUTER JOIN Status LastContactStatus
			ON MainPt.PatientId = LastContactStatus.PatientId
			AND LastContactStatus.StatusId = 
			(
				SELECT TOP 1 StatusId
				FROM Status ptSt
				WHERE ptSt.PatientId = MainPt.PatientId
				AND 
				(
					ptSt.Status LIKE '%AWD%' OR
					ptSt.Status LIKE '%NED%' OR
					ptSt.Status LIKE '%DoD%' OR
					ptSt.Status LIKE '%Alive with Disease%' OR
					ptSt.Status LIKE '%Death of Cancer%' OR
					ptSt.Status LIKE '%No Evidence of Disease%'
				)
				ORDER BY ptSt.StatusDate DESC
			)

		LEFT OUTER JOIN Status RecurrenceStatus
			ON MainPt.PatientId = RecurrenceStatus.PatientId
			AND RecurrenceStatus.StatusId = 
			(
				SELECT TOP 1 StatusId
				FROM Status ptSt
				WHERE ptSt.PatientId = MainPt.PatientId
				AND 
				(
					ptSt.Status LIKE '%Recurrence%'
				)
				ORDER BY ptSt.StatusDate DESC
			)		
		LEFT OUTER JOIN PatientDiseases 
			ON PatientDiseases.PatientId = MainPt.PatientId
		
		LEFT OUTER JOIN Diseases 
			ON Diseases.DiseaseId = PatientDiseases.DiseaseId
	
WHERE 
	
	Diseases.Diseasename = 'Gastroesophageal'
	
	---- exclude known test/bogus patients
	--AND MainPt.PatientId NOT IN (1, 3, 4, 641, 645, 640, 436, 647)
	 
GROUP BY
	MainPt.PatientId,
	MainPt.PtMRN,
	MainPt.PtGender,
	MainPt.PtBirthDate,
	MainPt.PtBirthDateText,
	MainPt.PtRace,
	MainPt.PtLastName,
	MainPt.PtFirstName,
	
	Encounter.EncChiefComplaint,

    Comorb_HTNRequiringMeds.ComorbidityId,
    Comorb_HTNRequiringMeds.ComorbDateText,
    Comorb_GERD.ComorbidityId,
    Comorb_GERD.ComorbDateText,
    Comorb_MyocardialInfarctCAD.ComorbidityId,
    Comorb_MyocardialInfarctCAD.ComorbDateText,
    Comorb_10PerLossBodyWeight.ComorbidityId,
    Comorb_10PerLossBodyWeight.ComorbDateText,
    Comorb_PepticUlcerDisease.ComorbidityId,
    Comorb_PepticUlcerDisease.ComorbDateText,
    Comorb_HTNRequiringMeds.ComorbidityId,
	
	SocialHistories.SocHxTobaccoType,
	SocialHistories.SocHxTobaccoPacksPerDay,
	SocialHistories.SocHxTobaccoYears,
	SocialHistories.SocHxTobaccoQuitYear,
	SocialHistories.SocHxAlcohol,
	SocialHistories.SocHxOther,
	SocialHistories.SocHxAlcoholDrinksPerDay,
	SocialHistories.SocHxAlcoholYears,
	SocialHistories.SocHxAlcoholQuitYear,
	
	PreOpLab_1.LabTestId,
	PreOpLab_1.LabDate,
	PreOpLab_1.LabDateText,
	PreOpLab_1.LabTest,
	PreOpLab_1.LabResult,
	PreOpLab_1.LabUnits,

	PreOpLab_2.LabTestId,
	PreOpLab_2.LabDate,
	PreOpLab_2.LabDateText,
	PreOpLab_2.LabTest,
	PreOpLab_2.LabResult,
	PreOpLab_2.LabUnits,

	PreOpLab_3.LabTestId,
	PreOpLab_3.LabDate,
	PreOpLab_3.LabDateText,
	PreOpLab_3.LabTest,
	PreOpLab_3.LabResult,
	PreOpLab_3.LabUnits,

	PreOpLab_4.LabTestId,
	PreOpLab_4.LabDate,
	PreOpLab_4.LabDateText,
	PreOpLab_4.LabTest,
	PreOpLab_4.LabResult,
	PreOpLab_4.LabUnits,

	PreOpLab_5.LabTestId,
	PreOpLab_5.LabDate,
	PreOpLab_5.LabDateText,
	PreOpLab_5.LabTest,
	PreOpLab_5.LabResult,
	PreOpLab_5.LabUnits,

	Neo_Adjuvant_MedTx.MedicalTherapyId,
	Neo_Adjuvant_MedTx.MedTxDateText,
	Neo_Adjuvant_MedTx.MedTxAgent,
	NeoAdjuvantMedTx_AbsentEvent.AbsentEventId,
	NeoAdjuvantMedTx_AbsentEvent.AbsentReason,
	Any_MedTx.MedicalTherapyId,

	Adjuvant_MedTx.MedicalTherapyId,
	Adjuvant_MedTx.MedTxDateText,
	Adjuvant_MedTx.MedTxAgent,
	AdjuvantMedTx_AbsentEvent.AbsentEventId,
	AdjuvantMedTx_AbsentEvent.AbsentReason,

	PreOp_Radiation_RadTx.RadiationTherapyId,
	PreOp_Radiation_RadTx.RadTxDateText,
	PreOp_Radiation_RadTx.RadTxType,
	PreOpRadTx_AbsentEvent.AbsentEventId,
	PreOpRadTx_AbsentEvent.AbsentReason,
	Any_RadTx.RadiationTherapyId,

	PostOp_Radiation_RadTx.RadiationTherapyId,
	PostOp_Radiation_RadTx.RadTxDateText,
	PostOp_Radiation_RadTx.RadTxType,
	PostOpRadTx_AbsentEvent.AbsentEventId,
	PostOpRadTx_AbsentEvent.AbsentReason,
	
	PrimaryProcedure.ProcedureId,
	PrimaryProcedure.ProcDate,
	PrimaryProcedure.ProcDateText,
	PrimaryProcedure.ProcName,
	PrimaryProcedure.ProcSurgeon,
	PrimaryProcedure.ProcApproach,
	PrimaryProcedure.ProcNotes,
	PrimaryProcedure.ProcDataSource,
	PrimaryProcedure.EnteredTime,

	OperatingRoomDetails.OperatingRoomDetailId,
	OperatingRoomDetails.OpDuration,
	OperatingRoomDetails.OpPostOpSummary,
	OperatingRoomDetails.OpEstBloodLoss,
	OperatingRoomDetails.OpRBC_Transfused,
	OperatingRoomDetails.OpRBC_PostOp,
	OperatingRoomDetails.OpCrystalloid,
	OperatingRoomDetails.OpColloid,
	OperatingRoomDetails.OpUrineOutput,
	OperatingRoomDetails.OpFluidHespan,
	OperatingRoomDetails.OpNotes,

	IntraOpComplications1.ToxicityId,
	IntraOpComplications1.ToxDateText,
	IntraOpComplications1.ToxName,
	IntraOpComplications1.ToxNotes,
	IntraOpComplications2.ToxicityId,
	IntraOpComplications2.ToxDateText,
	IntraOpComplications2.ToxName,
	IntraOpComplications2.ToxNotes,
	IntraOpComplications3.ToxicityId,
	IntraOpComplications3.ToxDateText,
	IntraOpComplications3.ToxName,
	IntraOpComplications3.ToxNotes,
	
	Hospitalizations.HospICUStay,
	Hospitalizations.HospDischargeDateText,
	OperatingRoomDetails.OpRBC_PostOp,
	Hospitalizations.HospInstitution,
	Hospitalizations.HospNotes,
	
	PostOpComplications1.ToxicityId,
	PostOpComplications1.ToxDateText,
	PostOpComplications1.ToxName,
	PostOpComplications1.ToxNotes,
	PostOpComplications2.ToxicityId,
	PostOpComplications2.ToxDateText,
	PostOpComplications2.ToxName,
	PostOpComplications2.ToxNotes,
	PostOpComplications3.ToxicityId,
	PostOpComplications3.ToxDateText,
	PostOpComplications3.ToxName,
	PostOpComplications3.ToxNotes,

	ReAdmissionWin14Days.ToxicityId,
	ReAdmissionWin14Days.ToxGrade,
	ReAdmissionWin14Days.ToxDateText,
	ReAdmissionWin30Days.ToxicityId,
	ReAdmissionWin30Days.ToxGrade,
	ReAdmissionWin30Days.ToxDateText,
	ReOperationWin30Days.ToxicityId,
	ReOperationWin30Days.ToxGrade,
	ReOperationWin30Days.ToxDateText,
	HighestMorbidityGrade.ToxicityId,
	HighestMorbidityGrade.ToxGrade,
	HighestMorbidityGrade.ToxDateText,
	
    Pathology.PathologyId,
	PathologyAbsentEvent.AbsentEventId,
	PathologyAbsentEvent.AbsentReason,
	Pathology.PathDateText,
	Pathology.PathDate,
	Pathology.PathNum,
	Pathology.PathHistology,
	Pathology.PathHistology2,
	Pathology.PathNotes,
    Pathology.PathLymphaticInv,
    Pathology.PathVascularInv,
    Pathology.PathPerineuralInv,
    
    PathFinding_NegativeMargins.PathologyFindingId,
    PathFinding_NegativeMargins.PathFinding,
    PathFinding_NegativeMargins.PathFindResult,
    PathFinding_PositiveProximalMargin.PathologyFindingId,
    PathFinding_PositiveProximalMargin.PathFinding,
    PathFinding_PositiveProximalMargin.PathFindResult,
    PathFinding_PositiveDistalMargin.PathologyFindingId,
    PathFinding_PositiveDistalMargin.PathFinding,
    PathFinding_PositiveDistalMargin.PathFindResult,
    PathFinding_PositiveRadialMargin.PathologyFindingId,
    PathFinding_PositiveRadialMargin.PathFinding,
    PathFinding_PositiveRadialMargin.PathFindResult,
    
	LastContactStatus.StatusId,
	LastContactStatus.StatusDateText,
	LastContactStatus.Status,
	LastContactStatus.StatusNotes,
    
	LastContactStatus.StatusDateText,
	LastContactStatus.Status,
	LastContactStatus.StatusNotes,
	
	RecurrenceStatus.StatusDateText,
	RecurrenceStatus.Status,
	RecurrenceStatus.StatusNotes,

	MainPt.PtDeathDateText,
	MainPt.PtDeathCause,
	MainPt.PtDeathType
	
ORDER BY MainPt.PtLastName, MainPt.PtFirstName	


