-- Pancreas Dataset query
-- combines fluids and moffitt dataset
-- column order reflects flow of Pancreas Surgery eform

-- bogon patientids (49, 156, 208)
-- 49: two operations
-- 156: two peripancreatic nodepathfinding records (with different numbers of nodes!)
-- 208: two splenectomies

SELECT
	-- HPI - Demographics
	Patients.PatientId,
	Patients.PtMRN  AS MRN,
	Patients.PtGender AS Gender,
	Patients.PtBirthDateText AS BirthDate,
	Patients.PtRace AS Race,

	-- HPI - Chief Complaint
	CASE
		WHEN PreOpEncounter.EncChiefComplaint LIKE '%Abdominal pain%discomfort%' THEN 'Yes'
		ELSE NULL
	END AS Complaint_AbdominalPainOrDiscomfort,
	CASE
		WHEN PreOpEncounter.EncChiefComplaint LIKE '%Appetite loss%' THEN 'Yes'
		ELSE NULL
	END AS Complaint_AppetiteLoss,
	CASE
		WHEN PreOpEncounter.EncChiefComplaint LIKE '%Asymptomatic%' THEN 'Yes'
		ELSE NULL
	END AS Complaint_Asymptomatic,
	CASE
		WHEN PreOpEncounter.EncChiefComplaint LIKE '%Back pain%' THEN 'Yes'
		ELSE NULL
	END AS Complaint_BackPain,
	CASE
		WHEN PreOpEncounter.EncChiefComplaint LIKE '%Diabetes%' THEN 'Yes'
		ELSE NULL
	END AS Complaint_Diabetes,
	CASE
		WHEN PreOpEncounter.EncChiefComplaint LIKE '%Diarrhea%' THEN 'Yes'
		ELSE NULL
	END AS Complaint_Diarrhea,
	CASE
		WHEN PreOpEncounter.EncChiefComplaint LIKE '%Lymph Node%' THEN 'Yes'
		ELSE NULL
	END AS Complaint_LymphNode,
	CASE
		WHEN PreOpEncounter.EncChiefComplaint LIKE '%Jaundice%' THEN 'Yes'
		ELSE NULL
	END AS Complaint_Jaundice,
	CASE
		WHEN PreOpEncounter.EncChiefComplaint LIKE '%Nausea%' THEN 'Yes'
		ELSE NULL
	END AS Complaint_Nausea,
	CASE
		WHEN PreOpEncounter.EncChiefComplaint LIKE '%Rectum%' THEN 'Yes'
		ELSE NULL
	END AS Complaint_Rectum,
	CASE
		WHEN PreOpEncounter.EncChiefComplaint LIKE '%Tumor found incidentally%' THEN 'Yes'
		ELSE NULL
	END AS Complaint_TumorFoundIncidentally,
	CASE
		WHEN PreOpEncounter.EncChiefComplaint LIKE '%Vomiting%' THEN 'Yes'
		ELSE NULL
	END AS Complaint_Vomiting,
	CASE
		WHEN PreOpEncounter.EncChiefComplaint LIKE '%Weight loss%' THEN 'Yes'
		ELSE NULL
	END AS Complaint_WeightLoss,

	
	-- PAST MEDICAL HISTORY - Comorbidities
	CASE
		WHEN Comorb_CAD.ComorbidityId IS NOT NULL THEN 'Yes'
		ELSE NULL
	END AS Comorb_CAD,
	CASE
		WHEN Comorb_Myoc.ComorbidityId IS NOT NULL THEN 'Yes'
		ELSE NULL
	END AS Comorb_Myoc,
	CASE
		WHEN Comorb_Hypertension.ComorbidityId IS NOT NULL THEN 'Yes'
		ELSE NULL
	END AS Comorb_Hypertension,
	CASE
		WHEN Comorb_CVA.ComorbidityId IS NOT NULL THEN 'Yes'
		ELSE NULL
	END AS Comorb_CVA,
	CASE
		WHEN Comorb_Thrombo.ComorbidityId IS NOT NULL THEN 'Yes'
		ELSE NULL
	END AS Comorb_Thrombo,
	CASE
		WHEN Comorb_Asthma.ComorbidityId IS NOT NULL THEN 'Yes'
		ELSE NULL
	END AS Comorb_Asthma,
	CASE
		WHEN Comorb_DiabIDDM.ComorbidityId IS NOT NULL THEN 'Yes'
		ELSE NULL
	END AS Comorb_DiabIDDM,
	CASE
		WHEN Comorb_DiabNIDDM.ComorbidityId IS NOT NULL THEN 'Yes'
		ELSE NULL
	END AS Comorb_DiabNIDDM,
	CASE
		WHEN Comorb_Hyperchol.ComorbidityId IS NOT NULL THEN 'Yes'
		ELSE NULL
	END AS Comorb_Hyperchol,
	CASE
		WHEN Comorb_Depression.ComorbidityId IS NOT NULL THEN 'Yes'
		ELSE NULL
	END AS Comorb_Depression,
	(
		SELECT Comorbidity + ', '
		FROM Comorbidities
		WHERE PatientId = Patients.PatientId
		AND Comorbidity NOT IN
		(
			'Coronary Artery Disease',    
			'Myocardial Infarction',    
			'Hypertension',  
			'CVA',
			'Thromboembolic Events / DVT',  
			'Asthma',
			'Diabetes (IDDM)',  
			'Diabetes (NIDDM)',
			'Hypercholesterolemia',
			'Depression'
		)
		FOR XML PATH('')
	) AS Comorb_Other,
	
	
	-- PAST MEDICAL HISTORY - Surgical History
	CASE
		WHEN SurgeryHxAorticSurgery.ProcedureId IS NOT NULL THEN 'Yes'
		ELSE NULL
	END AS SurgeryHx_AorticSurgery,
	CASE
		WHEN SurgeryHxCarotidEndarterectomy.ProcedureId IS NOT NULL THEN 'Yes'
		ELSE NULL
	END AS SurgeryHx_CarotidEndarterectomy,
	CASE
		WHEN SurgeryHxColonRectalResection.ProcedureId IS NOT NULL THEN 'Yes'
		ELSE NULL
	END AS SurgeryHx_SurgeryHxColonRectalResection,
	CASE
		WHEN SurgeryHxCoronaryByPassGraft.ProcedureId IS NOT NULL THEN 'Yes'
		ELSE NULL
	END AS SurgeryHx_CoronaryByPassGraft,
	CASE
		WHEN SurgeryHxGastrectomy.ProcedureId IS NOT NULL THEN 'Yes'
		ELSE NULL
	END AS SurgeryHx_Gastrectomy,
	CASE
		WHEN SurgeryHxHeadNeckCancerProcedure.ProcedureId IS NOT NULL THEN 'Yes'
		ELSE NULL
	END AS SurgeryHx_HeadNeckCancerProcedure,
	CASE
		WHEN SurgeryHxLiverResectionAblation.ProcedureId IS NOT NULL THEN 'Yes'
		ELSE NULL
	END AS SurgeryHx_LiverResectionAblation,
	CASE
		WHEN SurgeryHxPeripheralVascular.ProcedureId IS NOT NULL THEN 'Yes'
		ELSE NULL
	END AS SurgeryHx_PeripheralVascularProcedures,
	CASE
		WHEN SurgeryHxVentralInguinalHerniaRepair.ProcedureId IS NOT NULL THEN 'Yes'
		ELSE NULL
	END AS SurgeryHx_VentralInguinalHerniaRepair,
	

	-- SOCIAL HISTORY
	CASE 
		WHEN SocialHistories.SocHxTobaccoType IS NULL THEN NULL
		WHEN SocialHistories.SocHxTobaccoType IN ('No', 'Never', 'Unknown') THEN SocialHistories.SocHxTobaccoType
		ELSE SocialHistories.SocHxTobaccoType + COALESCE(' : ' + SocialHistories.SocHxTobaccoPacksPerDay + ' pack(s)/day','') + COALESCE(' for ' + SocialHistories.SocHxTobaccoYears + ' years','') + COALESCE(' until ' + SocialHistories.SocHxTobaccoQuitYear,'') + COALESCE(', ' + SocialHistories.SocHxOther,'')
	END AS SmokingHistory,	
	CASE 
		WHEN SocialHistories.SocHxAlcohol IS NULL THEN NULL
		WHEN SocialHistories.SocHxAlcohol IN ('No', 'Never', 'Unknown') THEN SocialHistories.SocHxAlcohol
		ELSE SocialHistories.SocHxAlcohol + COALESCE(' : ' + SocialHistories.SocHxAlcoholDrinksPerDay + ' drink(s)/day','')+ COALESCE(' for ' + SocialHistories.SocHxAlcoholYears + ' years','') + COALESCE(' until ' + SocialHistories.SocHxAlcoholQuitYear,'')
	END AS AlcoholHistory,	
		
	-- FAMILY HISTORY	
	CASE
		WHEN FamHistoryAbsentEvent.AbsentEventId IS NULL 
			   AND FamHistoryCancer.FamilyMemberId IS NULL
			   AND FamHistoryHereditaryPancreatitis.FamilyMemberId IS NULL
		     THEN NULL
		WHEN FamHistoryAbsentEvent.AbsentEventId IS NOT NULL 
		     AND FamHistoryCancer.FamilyMemberId IS NULL 
			   AND FamHistoryHereditaryPancreatitis.FamilyMemberId IS NULL
		     THEN FamHistoryAbsentEvent.AbsentReason
		ELSE 'Yes'
	END AS FamilyHistory,


	CASE
		WHEN FamHistoryAbsentEvent.AbsentEventId IS NULL 
			   AND FamHistoryCancer.FamilyMemberId IS NULL
		     THEN NULL
		WHEN FamHistoryAbsentEvent.AbsentEventId IS NOT NULL 
		     AND FamHistoryCancer.FamilyMemberId IS NULL 
		     THEN FamHistoryAbsentEvent.AbsentReason
		ELSE 'Yes'
	END AS FamilyHistoryOfCancer,


	CASE
		WHEN FamHistoryAbsentEvent.AbsentEventId IS NULL 
			   AND FamHistoryHereditaryPancreatitis.FamilyMemberId IS NULL
		     THEN NULL
		WHEN FamHistoryAbsentEvent.AbsentEventId IS NOT NULL 
		     AND FamHistoryHereditaryPancreatitis.FamilyMemberId IS NULL 
		     THEN FamHistoryAbsentEvent.AbsentReason
		ELSE 'Yes'
	END AS HereditaryPancreatitis,
	
			
	-- CLINICAL STAGING - CT Cross-Sectional Imaging
	CASE 
		WHEN ResectabilityCTDx.DxType IS NULL OR
			 ResectabilityCTDx.DxType = '' THEN NULL
		ELSE 'Yes'
	END AS Resectability_CT_Study,	
	ResectabilityCTDx.DxDateText AS Resectability_CT_Date,
	ResectabilityCTDxFindings.ImgFindSite AS Resectability_CT_Site,
	ResectabilityCTDxFindings.ImgFindResult AS Resectability_CT_Result,	

	-- CLINICAL STAGING - MRI Cross-Sectional Imaging
	CASE 
		WHEN ResectabilityMRIDx.DxType IS NULL OR
			 ResectabilityMRIDx.DxType = '' THEN NULL
		ELSE 'Yes'
	END AS Resectability_MRI_Study,	
	ResectabilityMRIDx.DxDateText AS Resectability_MRI_Date,
	ResectabilityMRIDxFindings.ImgFindSite AS Resectability_MRI_Site,
	ResectabilityMRIDxFindings.ImgFindResult AS Resectability_MRI_Result,	

	-- CLINICAL STAGING - Additional Studies
	AdditionalStudy_Dx1.DxType AS AdditionalStudy1,
	AdditionalStudy_Dx1.DxDateText AS AdditionalStudyDate1,
	AdditionalStudy_Dx1.DxResult AS AdditionalStudyResult1,
	AdditionalStudy_Dx2.DxType AS AdditionalStudy2,
	AdditionalStudy_Dx2.DxDateText AS AdditionalStudyDate2,
	AdditionalStudy_Dx2.DxResult AS AdditionalStudyResult2,
	AdditionalStudy_Dx3.DxType AS AdditionalStudy3,
	AdditionalStudy_Dx3.DxDateText AS AdditionalStudyDate3,
	AdditionalStudy_Dx3.DxResult AS AdditionalStudyResult3,
	AdditionalStudy_Dx4.DxType AS AdditionalStudy4,
	AdditionalStudy_Dx4.DxDateText AS AdditionalStudyDate4,
	AdditionalStudy_Dx4.DxResult AS AdditionalStudyResult4,
	AdditionalStudy_Dx5.DxType AS AdditionalStudy5,
	AdditionalStudy_Dx5.DxDateText AS AdditionalStudyDate5,
	AdditionalStudy_Dx5.DxResult AS AdditionalStudyResult5,

	-- CLINICAL STAGING - TNM Staging
	ClinStages.ClinStageDateText AS ClinStageDate,
	ClinStages.ClinStageT,
	ClinStages.ClinStageN,
	ClinStages.ClinStageM,
	
	-- CLINICAL STAGING - Pre-Op Performance
	PreOpEncounter.EncECOG_Score AS ECOG,
	PreOpEncounter.EncKPS AS KPS,
	
	-- TREATMENT PLAN - Treatment Plan	
	(
		SELECT PlanName + ', '
		FROM ProblemPlans pp
		LEFT JOIN PatientProblems ptp ON ptp.PatientProblemId = pp.PatientProblemId
		WHERE PatientId = Patients.PatientId AND ptp.ProblemName LIKE '%pancreas cancer%'
		FOR XML PATH('')
	) AS TreatmentPlan,
		
		
	-- TREATMENT PLAN - Pre-Op Medical Therapies	
	CASE 
		WHEN PreOpMedTx_Capecitabine.MedicalTherapyId IS NOT NULL THEN 'Yes'
		ELSE NULL
	END AS PreOpMedTx_Capecitabine,
	CASE 
		WHEN PreOpMedTx_Cisplatin.MedicalTherapyId IS NOT NULL THEN 'Yes'
		ELSE NULL
	END AS PreOpMedTx_Cisplatin,
	CASE 
		WHEN PreOpMedTx_Erlotinib.MedicalTherapyId IS NOT NULL THEN 'Yes'
		ELSE NULL
	END AS PreOpMedTx_Erlotinib,
	CASE 
		WHEN PreOpMedTx_Fluoropyrimidine.MedicalTherapyId IS NOT NULL THEN 'Yes'
		ELSE NULL
	END AS PreOpMedTx_Fluoropyrimidine,
	CASE 
		WHEN PreOpMedTx_Folfox.MedicalTherapyId IS NOT NULL THEN 'Yes'
		ELSE NULL
	END AS PreOpMedTx_Folfox,
	CASE 
		WHEN PreOpMedTx_Gemcitabine.MedicalTherapyId IS NOT NULL THEN 'Yes'
		ELSE NULL
	END AS PreOpMedTx_Gemcitabine,
	CASE 
		WHEN PreOpMedTx_5FU.MedicalTherapyId IS NOT NULL THEN 'Yes'
		ELSE NULL
	END AS PreOpMedTx_5Fluorouracil,
	(
		SELECT MedTxAgent + ', '
		FROM MedicalTherapy medTx
		WHERE PatientId = Patients.PatientId 
		AND medTx.MedTxDate <= PrimaryProcedure.ProcDate
		AND
			(
				medTx.MedTxAgent NOT LIKE '%Capecitabine%'
				AND medTx.MedTxAgent NOT LIKE '%capeox%'
				AND medTx.MedTxAgent NOT LIKE '%cisplatin%'
				AND medTx.MedTxAgent NOT LIKE '%erlotinib%'
				AND medTx.MedTxAgent NOT LIKE '%fluoropyrimidine%'
				AND medTx.MedTxAgent NOT LIKE '%folfox%'
				AND medTx.MedTxAgent NOT LIKE '%gemcitabine%'
				AND medTx.MedTxAgent NOT LIKE '%5%FU%'
				AND medTx.MedTxAgent NOT LIKE '%5%Fluorouracil%'
			)
		FOR XML PATH('')
	) AS PreOpMedTx_Other,
	(
		SELECT MedTxAgent + ', '
		FROM MedicalTherapy medTx
		WHERE PatientId = Patients.PatientId 
		AND medTx.MedTxDate IS NULL
		FOR XML PATH('')
	) AS MedTx_NoDateSpecified,


	-- TREATMENT PLAN - Pre-Op Radiation Therapies	
	PreOp_RadTx.RadTxType AS PreOpRadTx_Type,
	PreOp_RadTx.RadTxTotalDose AS PreOpRadTx_TotalDose,
	(
		SELECT RadTxType + COALESCE(' : ' + RadTxTotalDose,'') + ', '
		FROM RadiationTherapy radTx
		WHERE PatientId = Patients.PatientId 
		AND radTx.RadTxDate IS NULL
		FOR XML PATH('')
	) AS RadTx_NoDateSpecified,


	-- TREATMENT PLAN - Restaging	
	(
		SELECT Status + ' : ' + StatusDateText + ', '
		FROM Status st
		WHERE PatientId = Patients.PatientId AND st.StatusDisease LIKE '%pancreas cancer%' 
		AND
			(
				st.Status LIKE '%complete response%' OR
				st.Status LIKE '%distant progression%' OR
				st.Status LIKE '%local and distant progression%' OR
				st.Status LIKE '%local progression%' OR
				st.Status LIKE '%no changes%' OR
				st.Status LIKE '%regression%'
			)
		FOR XML PATH('')
	) AS Restaging,
	
	
	-- OPERATIVE DETAILS - Pre-Op Vital Signs
	PreOpEncounter.EncHeight AS PreSurgeryHeight,
	PreOpEncounter.EncWeight AS PreSurgeryWeight,
	
	
	-- OPERATIVE DETAILS - Pre-Op Labs 
	AFP.LabResult AS PreOpLab_AFP,
	Albumin.LabResult AS PreOpLab_Albumin,
	Bilirubin.LabResult AS PreOpLab_Bilirubin,
	BUN.LabResult AS PreOpLab_BUN,
	CA_19_9.LabResult AS PreOpLab_CA_19_9,
	CEA.LabResult AS PreOpLab_CEA,
	Creatinine.LabResult AS PreOpLab_Creatinine,
	Glucose.LabResult AS PreOpLab_Glucose,
	Hematocrit.LabResult AS PreOpLab_Hematocrit,
	Hemoglobin.LabResult AS PreOpLab_Hemoglobin,
	LDH.LabResult AS PreOpLab_LDH,
	SGOT.LabResult AS PreOpLab_SGOT,
	SGPT.LabResult AS PreOpLab_SGPT,
	(
		SELECT LabTest + ' : ' + LabResult + ', '
		FROM LabTests preOpLabs
		WHERE PatientId = Patients.PatientId 
		AND preOpLabs.LabDate <= PrimaryProcedure.ProcDate
		AND preOpLabs.LabTest <> 'AFP'
		AND preOpLabs.LabTest <> 'Albumin'
		AND preOpLabs.LabTest <> 'Total Bilirubin'
		AND preOpLabs.LabTest <> 'CA 19-9'
		AND preOpLabs.LabTest <> 'Creatinine'
		AND preOpLabs.LabTest <> 'Glucose'
		AND preOpLabs.LabTest <> 'Hematocrit'
		AND preOpLabs.LabTest <> 'Hemoglobin'
		AND preOpLabs.LabTest <> 'LDH'
		AND preOpLabs.LabTest <> 'SGOT'
		AND preOpLabs.LabTest <> 'SGPT'
		FOR XML PATH('')
	) AS PreOpLab_Other,
	(
		SELECT LabTest + ' : ' + LabResult + ', '
		FROM LabTests noDateLabs
		WHERE PatientId = Patients.PatientId 
		AND noDateLabs.LabDate IS NULL

		FOR XML PATH('')
	) AS Labs_NoDateSpecified,
		
	
	-- OPERATIVE DETAILS - Operative Detail, Primary Procedure, Primary Procedure Details 
	CASE
		WHEN PrimaryProcedure.ProcedureId IS NOT NULL THEN PrimaryProcedure.ProcName
		ELSE NULL
	END AS PrimaryProcedure,
	PrimaryProcedure.ProcDateText AS PrimaryProcedureDate,

	CASE 
		WHEN CHARINDEX('Feeding tube: ',OperatingRoomDetails.OpNotes) <> 0 THEN REPLACE (SUBSTRING(OperatingRoomDetails.OpNotes,CHARINDEX('Vascular Inv: ',OperatingRoomDetails.OpNotes),CHARINDEX(' || ',OperatingRoomDetails.OpNotes,CHARINDEX('Feeding tube: ',OperatingRoomDetails.OpNotes)) - CHARINDEX('Feeding tube: ',OperatingRoomDetails.OpNotes)),'Feeding tube: ','') 
		ELSE NULL
	END AS FeedingTube,

	PrimaryProcedure.ProcApproach AS Technique,
	
	OperatingRoomDetails.OpCaseSurgeon AS PrimaryProcedureSurgeon,
	OperatingRoomDetails.OpDuration,
	OperatingRoomDetails.OpInTime,
	OperatingRoomDetails.OpOutTime,
	OperatingRoomDetails.OpUrineOutput,
	OperatingRoomDetails.OpCrystalloid,
	OperatingRoomDetails.OpColloid,
	OperatingRoomDetails.OpEstBloodLoss,
	OperatingRoomDetails.OpRBC_Transfused,			

	PrimaryProcDetails.ProcStent AS PrimaryProcDetail_PancreaticStent,
	PrimaryProcDetails.ProcMarginFrozen AS PrimaryProcDetail_MarginFrozenResult,
	PrimaryProcDetails.ProcReconstruction AS PrimaryProcDetail_Reconstruction,
	PrimaryProcDetails.ProcPancreas AS PrimaryProcDetail_Pancreas,
	PrimaryProcDetails.ProcPancreaticDuctSize AS PrimaryProcDetail_PancreaticDuctSize,
	PrimaryProcDetails.ProcBiliaryBypass AS PrimaryProcDetail_BiliaryBypass,
	PrimaryProcDetails.ProcBiliaryBypassOrigin AS PrimaryProcDetail_BiliaryBypassOrigin,
	PrimaryProcDetails.ProcGastricBypass AS PrimaryProcDetail_GastricBypass,
	PrimaryProcDetails.ProcPlexusBlock AS PlexusBlock,
	PrimaryProcDetails.ProcDrains AS PrimaryProcDetail_Drains,
	PrimaryProcDetails.ProcSkinClosure AS PrimaryProcDetail_SkinClosure,
	PrimaryProcDetails.ProcPancreaticAnast AS PrimaryProcDetail_PancreaticAnastamosis,
	-- FIELD NOT IN MAIN BRANCH PrimaryProcDetails.ProcAddOrgansResected AS PrimaryProcDetail_AddlOrgansResected,

	-- OPERATIVE DETAILS - Supplementary Procedures 
	CASE
		WHEN Splenectomy.ProcedureId IS NOT NULL THEN 'Yes'
		ELSE NULL
	END AS Splenectomy,
	Splenectomy.ProcDateText AS SplenectomyDate,
	
	CASE
		WHEN SpleenPreservation.ProcedureId IS NOT NULL THEN 'Yes'
		ELSE NULL
	END AS SpleenPreservation,
	SpleenPreservation.ProcDateText AS SpleenPreservationDate,
	
	CASE
		WHEN PortalVeinResection.ProcedureId IS NOT NULL THEN 'Yes'
		ELSE NULL
	END AS PVResection,
	PortalVeinResection.ProcDateText AS PVResectionDate,
	
	CASE
		WHEN PVPreservation.ProcedureId IS NOT NULL THEN 'Yes'
		ELSE NULL
	END AS PVPreservation,
	PVPreservation.ProcDateText AS PVPreservationDate,
	
	
	-- OPERATIVE DETAILS - Other Procedures 
	CASE
		WHEN Pancreatectomy.ProcedureId IS NOT NULL THEN 'Yes'
		ELSE NULL
	END AS Pancreatectomy,
	Pancreatectomy.ProcDateText AS PancreatectomyDate,

	CASE
		WHEN PancDuodenectomy.ProcedureId IS NOT NULL THEN 'Yes'
		ELSE NULL
	END AS PancDuodenectomy,
	PancDuodenectomy.ProcDateText AS PancDuodenectomyDate,

	CASE
		WHEN DistalPancreatectomy.ProcedureId IS NOT NULL THEN 'Yes'
		ELSE NULL
	END AS DistalPancreatectomy,
	DistalPancreatectomy.ProcDateText AS DistalPancreatectomyDate,

	CASE
		WHEN Excision.ProcedureId IS NOT NULL THEN 'Yes'
		ELSE NULL
	END AS Excision,
	Excision.ProcDateText AS ExcisionDate,

	CASE
		WHEN TotalPancreatectomy.ProcedureId IS NOT NULL THEN 'Yes'
		ELSE NULL
	END AS TotalPancreatectomy,
	TotalPancreatectomy.ProcDateText AS TotalPancreatectomyDate,

	CASE
		WHEN BiliaryByPass.ProcedureId IS NOT NULL THEN 'Yes'
		ELSE NULL
	END AS BiliaryByPass,
	BiliaryByPass.ProcDateText AS BiliaryByPassDate,

	CASE
		WHEN GastricByPass.ProcedureId IS NOT NULL THEN 'Yes'
		ELSE NULL
	END AS GastricByPass,
	GastricByPass.ProcDateText AS GastricByPassDate,

	CASE
		WHEN BiliaryAndGastricByPass.ProcedureId IS NOT NULL THEN 'Yes'
		ELSE NULL
	END AS BiliaryAndGastricByPass,
	BiliaryAndGastricByPass.ProcDateText AS BiliaryAndGastricByPassDate,

	CASE
		WHEN Laparotomy.ProcedureId IS NOT NULL THEN 'Yes'
		ELSE NULL
	END AS Laparotomy,
	Laparotomy.ProcDateText AS LaparotomyDate,

	CASE
		WHEN Biopsy.ProcedureId IS NOT NULL THEN 'Yes'
		ELSE NULL
	END AS Biopsy,
	Biopsy.ProcDateText AS BiopsyDate,

	(
		SELECT ProcName + ': ' + ProcDateText + ', '
		FROM Procedures
		WHERE PatientId = Patients.PatientId
		AND ProcName <> 'Pancreatectomy'
		AND ProcName NOT LIKE '%Pancreatico%duodenectomy%'
		AND ProcName NOT LIKE '%distal%'
		AND ProcName NOT LIKE '%excision%'
		AND ProcName <> 'Total pancreatectomy'
		AND ProcName <> 'Biliary by-pass'
		AND ProcName <> 'gastric by pass'
		AND ProcName <> 'Biliary and gastric by-pass'
		AND ProcName NOT LIKE '%laparotomy%'
		AND ProcName NOT LIKE '%biopsy%'
		FOR XML PATH('')
	) AS Procedures_Other,
	

	-- OPERATIVE DETAILS - Surgery Findings
	(
		SELECT ProcFindSite + ', '
		FROM ProcedureFinding
		WHERE ProcedureId = PrimaryProcedure.ProcedureId
		AND ProcFinding = 'Metastasis'
		AND ProcFindStatus LIKE '%yes%'
		FOR XML PATH('')
	) AS MetastasisSites,
		
	OperatingRoomDetails.OpASA AS Anesthesia,
	
	-- OPERATIVE DETAILS - Intra-Op Complications
	CASE
		WHEN IntraOp_MyocInfarc.ToxicityId IS NOT NULL THEN 'Yes'
		ELSE NULL
	END AS IntraOpComplication_MyocInfarc,
	
	CASE
		WHEN IntraOp_Arrythmia.ToxicityId IS NOT NULL THEN 'Yes'
		ELSE NULL
	END AS IntraOpComplication_Arrythmia,
	
	CASE
		WHEN IntraOp_Arrest.ToxicityId IS NOT NULL THEN 'Yes'
		ELSE NULL
	END AS IntraOpComplication_Arrest,
	
	CASE
		WHEN IntraOp_InjBowel.ToxicityId IS NOT NULL THEN 'Yes'
		ELSE NULL
	END AS IntraOpComplication_InjBowel,
	
	CASE
		WHEN IntraOp_InjSpleen.ToxicityId IS NOT NULL THEN 'Yes'
		ELSE NULL
	END AS IntraOpComplication_InjSpleen,
	
	CASE
		WHEN IntraOp_InjIVC.ToxicityId IS NOT NULL THEN 'Yes'
		ELSE NULL
	END AS IntraOpComplication_InjIVC,
	
	CASE
		WHEN IntraOp_InjPv.ToxicityId IS NOT NULL THEN 'Yes'
		ELSE NULL
	END AS IntraOpComplication_InjPV,
	
	(
		SELECT ToxName + ', '
		FROM Toxicities
		WHERE PatientId = Patients.PatientId
		AND ToxDate = PrimaryProcedure.ProcDate
		AND ToxName NOT IN
		(
			'Myocardial Infarction',
			'Cardiac Arrythmia',
			'Cardiac Arrest',
			'Injury to bowel',
			'Injury to spleen',
			'Injury to IVC, EBL > 700',
			'Injury to PV, EBL > 700'
		)
		FOR XML PATH('')
	) AS IntraOpComplication_Other,
	(
		SELECT ToxName + ', '
		FROM Toxicities
		WHERE PatientId = Patients.PatientId
		AND ToxDate IS NULL
		FOR XML PATH('')
	) AS Complications_NoDateSpecified,
	

	-- POST-OP COURSE - Hospitalization
	Hospitalizations.HospDischargeDateText AS HospDischargeDate,
	Hospitalizations.HospInstitution,
	Hospitalizations.HospICUStay AS HospICUStayDays,
	OperatingRoomDetails.OpRBC_PostOp,
	Hospitalizations.HospNotes,
	
	-- POST-OP COURSE - Post-op Complications
	(
		SELECT ToxName + ' : ' + ToxGrade + ','
		FROM Toxicities
		WHERE PatientId = Patients.PatientId
		AND ToxDate > PrimaryProcedure.ProcDate
		FOR XML PATH('')
	) AS PostOp_Complications,
	(
		SELECT ToxName + ' : ' + ToxGrade + ','
		FROM Toxicities
		WHERE PatientId = Patients.PatientId
		AND ToxDate IS NULL
		FOR XML PATH('')
	) AS Complications_NoDateSpecified,
	
	CASE
		WHEN ReOperation.ToxicityId IS NOT NULL THEN 'Yes'
		ELSE NULL
	END AS ReOp30Days,
	ReOperation.ToxGrade AS ReOp30Days_Grade,
	
	CASE
		WHEN ReAdmission.ToxicityId IS NOT NULL THEN 'Yes'
		ELSE NULL
	END AS ReAdm30Days,
	ReAdmission.ToxGrade AS ReAdm30Days_Grade,
	
		
	-- PATHOLOGY/FINAL STAGING - Pathology Report
	Pathology.PathNum AS PathNum,
	Pathology.PathHistology AS PrimaryHistology,

	-- PATHOLOGY/FINAL STAGING - Pancreas Pathology
	PancreasPath.PathPerineuralInv,
	PancreasPath.PathVascularInv,
	PancreasPath.PathLymphaticInv,
	PancreasPath.PathPancreaticMargin,
	PancreasPath.PathPosteriorMargin,
	PancreasPath.PathAnteriorPeritonealInv,
	PancreasPath.PathBileDuctMargin,
	PancreasPath.PathDuodenalMargin,
	PancreasPath.PathGastricMargin,
	PancreasPath.PathPancreatitis,
	PancreasPath.PathFibrosis,
	PancreasPath.PathPanIn,
	PancreasPath.PathExtraParenchymalInv,
	PancreasPath.PathIPMN,
	-- FIELD NOT IN MAIN BRANCH PancreasPath.PathOtherOrganInv,

	-- PATHOLOGY/FINAL STAGING - Pathology Findings
	
	CASE
		WHEN PathologyFinding_LocationBody.PathologyFindingId IS NOT NULL THEN 'Yes'
		ELSE NULL
	END AS PathFinding_Body_Location,
	PathologyFinding_LocationBody.PathFindWidth AS PathFinding_Body_Size,
	PathologyFinding_LocationBody.PathFindGrade AS PathFinding_Body_Grade,

	CASE
		WHEN PathologyFinding_LocationHead.PathologyFindingId IS NOT NULL THEN 'Yes'
		ELSE NULL
	END AS PathFinding_Head_Location,
	PathologyFinding_LocationHead.PathFindWidth AS PathFinding_Head_Size,
	PathologyFinding_LocationHead.PathFindGrade AS PathFinding_Head_Grade,

	CASE
		WHEN PathologyFinding_LocationNeck.PathologyFindingId IS NOT NULL THEN 'Yes'
		ELSE NULL
	END AS PathFinding_Neck_Location,
	PathologyFinding_LocationNeck.PathFindWidth AS PathFinding_Neck_Size,
	PathologyFinding_LocationNeck.PathFindGrade AS PathFinding_Neck_Grade,

	CASE
		WHEN PathologyFinding_LocationTail.PathologyFindingId IS NOT NULL THEN 'Yes'
		ELSE NULL
	END AS PathFinding_Tail_Location,
	PathologyFinding_LocationTail.PathFindWidth AS PathFinding_Tail_Size,
	PathologyFinding_LocationTail.PathFindGrade AS PathFinding_Tail_Grade,

	CASE
		WHEN PathologyFinding_LocationUncinateProcess.PathologyFindingId IS NOT NULL THEN 'Yes'
		ELSE NULL
	END AS PathFinding_UncinateProcess_Location,
	PathologyFinding_LocationUncinateProcess.PathFindWidth AS PathFinding_UncinateProcess_Size,
	PathologyFinding_LocationUncinateProcess.PathFindGrade AS PathFinding_UncinateProcess_Grade,

	CASE
		WHEN PathologyFinding_LocationUnknown.PathologyFindingId IS NOT NULL THEN 'Yes'
		ELSE NULL
	END AS PathFinding_Unknown_Location,
	PathologyFinding_LocationUnknown.PathFindWidth AS PathFinding_Unknown_Size,
	PathologyFinding_LocationUnknown.PathFindGrade AS PathFinding_Unknown_Grade,

	CASE
		WHEN PathologyFinding_LocationUnspecified.PathologyFindingId IS NOT NULL THEN 'Yes'
		ELSE NULL
	END AS PathFinding_Unspecified_Location,
	PathologyFinding_LocationUnspecified.PathFindWidth AS PathFinding_Unspecified_Size,
	PathologyFinding_LocationUnspecified.PathFindGrade AS PathFinding_Unspecified_Grade,

	(
		SELECT PathFindSite + COALESCE(' : ' + PathFindWidth + ' cm', '') + COALESCE(' : ' + PathFindGrade, '') + ', '
		FROM PathologyFinding
		WHERE PathologyId = pathology.PathologyId
		AND
		(
			PathFindSite NOT LIKE '%Body%'
			AND PathFindSite NOT LIKE '%Head%'
			AND PathFindSite NOT LIKE '%Neck%'
			AND PathFindSite NOT LIKE '%Tail%'
			AND PathFindSite NOT LIKE '%Uncinate process%'
			AND PathFindSite NOT LIKE '%Unknown%'
			AND PathFindSite NOT LIKE '%Unspecified%'
		)
		FOR XML PATH('')
	) AS PathFinding_Other,

	Pathology.PathNotes,

	-- PATHOLOGY/FINAL STAGING - Pathology Node Findings
	CASE
		WHEN Site_Pancreatic.NodePathFindingId IS NOT NULL THEN 'Yes'
		ELSE NULL
	END AS Site_Pancreatic,
	Site_Pancreatic.PathFindPosNodes AS PancreaticPosNodes,
	Site_Pancreatic.PathFindNumNodes AS PancreaticTotalNodes,

	CASE
		WHEN Site_Peripancreatic.NodePathFindingId IS NOT NULL THEN 'Yes'
		ELSE NULL
	END AS Site_Peripancreatic,
	Site_Peripancreatic.PathFindPosNodes AS PeripancreaticPosNodes,
	Site_Peripancreatic.PathFindNumNodes AS PeripancreaticTotalNodes,

	CASE
		WHEN Site_Gastric.NodePathFindingId IS NOT NULL THEN 'Yes'
		ELSE NULL
	END AS Site_Gastric,
	Site_Gastric.PathFindPosNodes AS GastricPosNodes,
	Site_Gastric.PathFindNumNodes AS GastricTotalNodes,

	CASE
		WHEN Site_Pancreaticoduodenal.NodePathFindingId IS NOT NULL THEN 'Yes'
		ELSE NULL
	END AS Site_Pancreaticoduodenal,
	Site_Pancreaticoduodenal.PathFindPosNodes AS PancreaticoduodenalPosNodes,
	Site_Pancreaticoduodenal.PathFindNumNodes AS PancreaticoduodenalTotalNodes,

	CASE
		WHEN Site_BileDuct.NodePathFindingId IS NOT NULL THEN 'Yes'
		ELSE NULL
	END AS Site_BileDuct,
	Site_BileDuct.PathFindPosNodes AS BileDuctPosNodes,
	Site_BileDuct.PathFindNumNodes AS BileDuctTotalNodes,

	CASE
		WHEN Site_Duodenal.NodePathFindingId IS NOT NULL THEN 'Yes'
		ELSE NULL
	END AS Site_Duodenal,
	Site_Duodenal.PathFindPosNodes AS DuodenalPosNodes,
	Site_Duodenal.PathFindNumNodes AS DuodenalTotalNodes,

	(
		SELECT 
			PathFindSite + ': ' + 
			ISNULL(PathFindPosNodes, 0) + '/' + ISNULL(PathFindNumNodes, 0) + ', '
		FROM NodePathFinding
		WHERE 
			PathologyId = Pathology.PathologyId AND
			PathFindSite NOT IN (
				'Pancreatic',
				'Peripancreatic',
				'gastric',
				'Pancreaticoduodenal',
				'Common bile duct',
				'duodenal'
			)
		FOR XML PATH('')
	) AS Site_Other,


	-- PATHOLOGY/FINAL STAGING - Pathologic Staging 		
	PathologyStageGrade.PathStageT,
	PathologyStageGrade.PathStageM,
	PathologyStageGrade.PathStageN,
	PathologyStageGrade.PathStageR,
	
	

	-- POST-OP TREATMENT - Adjuvant Therapies		
	CASE
		WHEN Adjuvant_MedTx.MedicalTherapyId IS NOT NULL THEN 'Yes'
		WHEN Adjuvant_MedTx.MedicalTherapyId IS NULL 
		     AND AdjuvantMedTx_AbsentEvent.AbsentEventId IS NOT NULL
		     THEN AdjuvantMedTx_AbsentEvent.AbsentReason
		ELSE NULL
	END AS AdjuvantMedTx,
	(
		SELECT MedTxAgent + ', '
		FROM MedicalTherapy medTx
		WHERE PatientId = Patients.PatientId 
		AND medTx.MedTxDate IS NULL
		FOR XML PATH('')
	) AS MedTx_WithNoDate,
	
	-- POST-OP TREATMENT - Post-Op Radiation Therapies
	Adjuvant_RadTx.RadTxType AS PostOpRadTx_Type,
	Adjuvant_RadTx.RadTxTotalDose AS PostOpRadTx_TotalDose,
	(
		SELECT RadTxType + COALESCE(' : ' + RadTxTotalDose,'') + ', '
		FROM RadiationTherapy radTx
		WHERE PatientId = Patients.PatientId 
		AND radTx.RadTxDate IS NULL
		FOR XML PATH('')
	) AS RadTx_NoDateSpecified,
			
	-- OUTCOMES - Last Contact Status
	LastContactStatus.StatusDateText AS LastContact_Date,
	LastContactStatus.Status AS LastContact_Status,
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
	RecurrenceStatus.StatusDateText AS RecurrenceDate,
	RecurrenceStatus.StatusNotes AS SitesOfInitialRecurrence,

	-- OUTCOMES - Subsequent metastases
	SubsequentMetastasesStatus.StatusDateText AS SubsequentMetastasesDate,
	SubsequentMetastasesStatus.StatusNotes AS SitesOfMetastases,

	-- OUTCOMES - Patient Death
	Patients.PtDeathDateText AS DeathDate,
	Patients.PtDeathCause AS CauseOfDeath,
	Patients.PtDeathType AS DeathType


	
FROM
	Patients
		-- drive dates with the primary procedure 
		-- NOTE: for older eform versions (before 02/18/2011), 'Pancreatectomy' was always the default primary procedure;
		--       for latest efrom version, primary procedure can be any from list below
		LEFT OUTER JOIN Procedures PrimaryProcedure
			ON Patients.PatientId = PrimaryProcedure.PatientId
			AND PrimaryProcedure.ProcedureId =
			(
				SELECT TOP 1 ProcedureId
				FROM Procedures
				WHERE PatientId = Patients.PatientId
				AND
				(	
					-- for primary procedures created using older eform version			
					(
						Procedures.ProcDataSource LIKE '%eform%'
						AND Procedures.EnteredTime < '02/11/2011'
						AND
						(
						  Procedures.ProcName = 'Pancreatectomy'
						  OR EXISTS(SELECT PancreasProc.ProcedureId FROM PancreasProc WHERE PancreasProc.ProcedureId = Procedures.ProcedureId)
						  OR EXISTS (SELECT TOP 1 ProcedureFinding.ProcedureId FROM ProcedureFinding WHERE ProcedureFinding.ProcedureId = Procedures.ProcedureId)
						 )
					)

					-- for primary procedures created using latest eform version
					OR				
					(
						Procedures.ProcPrimary = 'True'
						AND 
						(
							ProcName LIKE 'Pancreatectomy'
							OR ProcName LIKE '%Pancreatico%duodenectomy%'
							OR ProcName LIKE '%distal%'
							OR ProcName LIKE '%excision%'
							OR ProcName LIKE 'Total pancreatectomy'
							OR ProcName LIKE 'Biliary by-pass'
							OR ProcName LIKE 'gastric by pass'
							OR ProcName LIKE 'Biliary and gastric by-pass'
							OR ProcName LIKE '%laparotomy%'
							OR ProcName LIKE '%biopsy%'
						)
					 )
				 )
				ORDER BY ProcDate DESC
			)
			
		-- the "operation" should be that related to the primary procedure
		LEFT OUTER JOIN OperatingRoomDetails
			ON Patients.PatientId = OperatingRoomDetails.PatientId
			AND PrimaryProcedure.OperatingRoomDetailId = 
				OperatingRoomDetails.OperatingRoomDetailId

		-- pancreas procedure pivot
		LEFT OUTER JOIN PancreasProc PrimaryProcDetails
			ON PrimaryProcedure.ProcedureId = PrimaryProcDetails.ProcedureId
			AND PrimaryProcDetails.ProcedureId =
			(
				SELECT TOP 1 ProcedureId
				FROM PancreasProc
				WHERE 
					ProcedureId = PrimaryProcedure.ProcedureId
				ORDER BY UpdatedTime DESC, EnteredTime DESC
			)
							
		-- get the "best" pathology record for the patient, given that these records
		-- are not linked to Procedures or OperatingRoomDetails (in older eform version)
		-- However, latest eform version links Pathology to Primary Procedure and OperatingRoomDetails		
		-- NOTE: "best" = closest post(inclusive)-surgery record (for records created using older eform versions)
		--       "best" = ProcedureId or OperatingRoomDetailId (for records created using newer eform version)
		LEFT OUTER JOIN Pathology
			ON Patients.PatientId = Pathology.PatientId
			AND Pathology.PathologyId =
			(
				SELECT TOP 1 PathologyId
				FROM Pathology
				WHERE PatientId = Patients.PatientId
				AND (
					 PathDate >= PrimaryProcedure.ProcDate 
				     OR ProcedureId = PrimaryProcedure.ProcedureId 
				     OR OperatingRoomDetailId = OperatingRoomDetails.OperatingRoomDetailId
				     )
				ORDER BY PathDate DESC
			)
			
		-- NOTE: heuristic analysis suggests only 1 per pathology record	
		LEFT OUTER JOIN PathologyStageGrade
			ON Pathology.PathologyId = PathologyStageGrade.PathologyId
			AND PathologyStageGrade.PathologyStageGradeId =
			(
				SELECT TOP 1 PathologyStageGradeId
				FROM dbo.PathologyStageGrade
				WHERE PathologyId = Pathology.PathologyId
				ORDER BY EnteredTime DESC
			)
		
		LEFT OUTER JOIN PancreasPath
			ON Pathology.PathologyId = PancreasPath.PathologyId
			
		-- NOTE: heuristic analysis suggests only 1 per pathology record
		-- NOTE: the best place to find grade and size seems to be in Pathology.PathNotes (for ealier eform version);
		--       latest version is puts grade and size in pathologyfinding table
		LEFT OUTER JOIN PathologyFinding
			ON pathology.PathologyId = PathologyFinding.PathologyId

		LEFT OUTER JOIN PathologyFinding PathologyFinding_LocationBody
			ON pathology.PathologyId = PathologyFinding_LocationBody.PathologyId
			AND PathologyFinding_LocationBody.PathologyFindingId =
			(
				SELECT TOP 1 PathologyFindingId
				FROM PathologyFinding
				WHERE 
					PathologyFinding.PathFindSite LIKE '%Body%'
					AND PathologyId = pathology.PathologyId
				ORDER BY UpdatedTime DESC, EnteredTime DESC
			)

		LEFT OUTER JOIN PathologyFinding PathologyFinding_LocationHead
			ON pathology.PathologyId = PathologyFinding_LocationHead.PathologyId
			AND PathologyFinding_LocationHead.PathologyFindingId =
			(
				SELECT TOP 1 PathologyFindingId
				FROM PathologyFinding
				WHERE 
					PathologyFinding.PathFindSite LIKE '%Head%'
					AND PathologyId = pathology.PathologyId
				ORDER BY UpdatedTime DESC, EnteredTime DESC
			)

		LEFT OUTER JOIN PathologyFinding PathologyFinding_LocationNeck
			ON pathology.PathologyId = PathologyFinding_LocationNeck.PathologyId
			AND PathologyFinding_LocationNeck.PathologyFindingId =
			(
				SELECT TOP 1 PathologyFindingId
				FROM PathologyFinding
				WHERE 
					PathologyFinding.PathFindSite LIKE '%Neck%'
					AND PathologyId = pathology.PathologyId
				ORDER BY UpdatedTime DESC, EnteredTime DESC
			)

		LEFT OUTER JOIN PathologyFinding PathologyFinding_LocationTail
			ON pathology.PathologyId = PathologyFinding_LocationTail.PathologyId
			AND PathologyFinding_LocationTail.PathologyFindingId =
			(
				SELECT TOP 1 PathologyFindingId
				FROM PathologyFinding
				WHERE 
					PathologyFinding.PathFindSite LIKE '%Tail%'
					AND PathologyId = pathology.PathologyId
				ORDER BY UpdatedTime DESC, EnteredTime DESC
			)

		LEFT OUTER JOIN PathologyFinding PathologyFinding_LocationUncinateProcess
			ON pathology.PathologyId = PathologyFinding_LocationUncinateProcess.PathologyId
			AND PathologyFinding_LocationUncinateProcess.PathologyFindingId =
			(
				SELECT TOP 1 PathologyFindingId
				FROM PathologyFinding
				WHERE 
					PathologyFinding.PathFindSite LIKE '%Uncinate%process%'
					AND PathologyId = pathology.PathologyId
				ORDER BY UpdatedTime DESC, EnteredTime DESC
			)

		LEFT OUTER JOIN PathologyFinding PathologyFinding_LocationUnknown
			ON pathology.PathologyId = PathologyFinding_LocationUnknown.PathologyId
			AND PathologyFinding_LocationUnknown.PathologyFindingId =
			(
				SELECT TOP 1 PathologyFindingId
				FROM PathologyFinding
				WHERE 
					PathologyFinding.PathFindSite LIKE '%Unknown%'
					AND PathologyId = pathology.PathologyId
				ORDER BY UpdatedTime DESC, EnteredTime DESC
			)

		LEFT OUTER JOIN PathologyFinding PathologyFinding_LocationUnspecified
			ON pathology.PathologyId = PathologyFinding_LocationUnspecified.PathologyId
			AND PathologyFinding_LocationUnspecified.PathologyFindingId =
			(
				SELECT TOP 1 PathologyFindingId
				FROM PathologyFinding
				WHERE 
					PathologyFinding.PathFindSite LIKE '%Unspecified%'
					AND PathologyId = pathology.PathologyId
				ORDER BY UpdatedTime DESC, EnteredTime DESC
			)
			
		-- use pre-primary procedure encounter for vital signs, etc.
		LEFT OUTER JOIN Encounters PreOpEncounter
			ON Patients.PatientId = PreOpEncounter.PatientId
			AND PreOpEncounter.EncounterId =
			(
				SELECT TOP 1 EncounterId
				FROM Encounters
				WHERE 
					EncDate <= PrimaryProcedure.ProcDate
					AND PatientId = Patients.PatientId
				ORDER BY EncDate DESC
			)

		-- node path finding pivots
		LEFT OUTER JOIN NodePathFinding Site_Pancreatic
			ON Pathology.PathologyId = Site_Pancreatic.PathologyId
			AND Site_Pancreatic.PathFindSite = 'Pancreatic'

		LEFT OUTER JOIN NodePathFinding Site_Peripancreatic
			ON Pathology.PathologyId = Site_Peripancreatic.PathologyId
			AND Site_Peripancreatic.PathFindSite = 'Peripancreatic'

		LEFT OUTER JOIN NodePathFinding Site_Gastric
			ON Pathology.PathologyId = Site_Gastric.PathologyId
			AND Site_Gastric.PathFindSite = 'gastric'

		LEFT OUTER JOIN NodePathFinding Site_Pancreaticoduodenal
			ON Pathology.PathologyId = Site_Pancreaticoduodenal.PathologyId
			AND Site_Pancreaticoduodenal.PathFindSite = 'Pancreaticoduodenal'

		LEFT OUTER JOIN NodePathFinding Site_BileDuct
			ON Pathology.PathologyId = Site_BileDuct.PathologyId
			AND Site_BileDuct.PathFindSite = 'Common bile duct'

		LEFT OUTER JOIN NodePathFinding Site_Duodenal
			ON Pathology.PathologyId = Site_Duodenal.PathologyId
			AND Site_Duodenal.PathFindSite = 'duodenal'
			
		-- optional social history for smoking
		LEFT OUTER JOIN SocialHistories
			ON Patients.PatientId = SocialHistories.PatientId	

		-- family history of cancer test pivot; find any occureance of cancer family hx for this patient
		LEFT OUTER JOIN FamilyMembers FamHistoryCancer
			ON Patients.PatientId = FamHistoryCancer.PatientId
			AND FamHistoryCancer.FamilyMemberId =
			(
				SELECT TOP 1 FamilyMembers.FamilyMemberId FROM FamilyMembers
				INNER JOIN
				(SELECT FamilyMembers.*
				 FROM FamilyMembers 
				 LEFT JOIN FamilyMemberDiagnosis ON FamilyMemberDiagnosis.FamilyMemberId = FamilyMembers.FamilyMemberId
				 WHERE FamilyMembers.PatientId = Patients.PatientId 
					   AND 
					   (
						 FamilyMemberDiagnosis.FamMemDiagnosis LIKE '%cancer%'
						 OR FamilyMemberDiagnosis.FamMemDiagnosis LIKE '%Leukemia%'
					   )
				 ) ptFamHxCancer ON ptFamHxCancer.FamilyMemberId = FamilyMembers.FamilyMemberId
				 ORDER BY FamilyMembers.UpdatedTime DESC, FamilyMembers.EnteredTime
			)

		-- family history of Hereditary pancreatitis test pivot; find any occureance of cancer family hx for this patient
		LEFT OUTER JOIN FamilyMembers FamHistoryHereditaryPancreatitis
			ON Patients.PatientId = FamHistoryHereditaryPancreatitis.PatientId
			AND FamHistoryHereditaryPancreatitis.FamilyMemberId =
			(
				SELECT TOP 1 FamilyMembers.FamilyMemberId FROM FamilyMembers
				INNER JOIN
				(SELECT FamilyMembers.*
				 FROM FamilyMembers 
				 LEFT JOIN FamilyMemberDiagnosis ON FamilyMemberDiagnosis.FamilyMemberId = FamilyMembers.FamilyMemberId
				 WHERE FamilyMembers.PatientId = Patients.PatientId 
					   AND FamilyMemberDiagnosis.FamMemDiagnosis LIKE '%hereditary%pancreatitis%'
				 ) ptFamHxHerPan ON ptFamHxHerPan.FamilyMemberId = FamilyMembers.FamilyMemberId
				 ORDER BY FamilyMembers.UpdatedTime DESC, FamilyMembers.EnteredTime
			)

		-- family history absent event test pivot; 
		LEFT OUTER JOIN AbsentEvents FamHistoryAbsentEvent
			ON Patients.PatientId = FamHistoryAbsentEvent.PatientId
			AND FamHistoryAbsentEvent.AbsentEventId =
			(
				SELECT TOP 1 AbsentEvents.AbsentEventId FROM AbsentEvents
				WHERE AbsentEvents.PatientId = Patients.PatientId 
					  AND AbsentEvents.FieldValue LIKE '%Family%History%'
			    ORDER BY AbsentEvents.AbsentDate DESC, AbsentEvents.UpdatedTime DESC, AbsentEvents.EnteredTime
			)
											
		-- diagnostic CT resectability test pivot
		LEFT OUTER JOIN Diagnostics ResectabilityCTDx
			ON Patients.PatientId = ResectabilityCTDx.PatientId
			AND ResectabilityCTDx.DiagnosticId =
			(
				SELECT TOP 1 ptDx.DiagnosticId FROM Diagnostics
				INNER JOIN
				(SELECT Diagnostics.*
				 FROM Diagnostics 
				 LEFT JOIN DxImageFindings ON DxImageFindings.DiagnosticId = Diagnostics.DiagnosticId
				 LEFT JOIN Patients pt ON pt.PatientId = Diagnostics.Patientid
				 WHERE Diagnostics.PatientId = Patients.PatientId AND DxImageFindings.ImgFindStatus LIKE '%resectability%'
				       AND Diagnostics.DxType LIKE '%ct%'
				 ) ptDx ON ptDx.DiagnosticId = Diagnostics.DiagnosticId
				WHERE ptDx.DxDate IS NULL OR ptDx.DxDate <= PrimaryProcedure.ProcDate
			    ORDER BY ptDx.DxDate DESC
			)	
		
		LEFT OUTER JOIN	DxImageFindings ResectabilityCTDxFindings
			ON ResectabilityCTDx.DiagnosticId = ResectabilityCTDxFindings.DiagnosticId	

		-- diagnostic MRI resectability test pivot
		LEFT OUTER JOIN Diagnostics ResectabilityMRIDx
			ON Patients.PatientId = ResectabilityMRIDx.PatientId
			AND ResectabilityMRIDx.DiagnosticId =
			(
				SELECT TOP 1 ptDx.DiagnosticId FROM Diagnostics
				INNER JOIN
				(SELECT Diagnostics.*
				 FROM Diagnostics 
				 LEFT JOIN DxImageFindings ON DxImageFindings.DiagnosticId = Diagnostics.DiagnosticId
				 LEFT JOIN Patients pt ON pt.PatientId = Diagnostics.Patientid
				 WHERE Diagnostics.PatientId = Patients.PatientId AND DxImageFindings.ImgFindStatus LIKE '%resectability%'
				       AND Diagnostics.DxType LIKE '%mri%'
				 ) ptDx ON ptDx.DiagnosticId = Diagnostics.DiagnosticId
				WHERE ptDx.DxDate IS NULL OR ptDx.DxDate <= PrimaryProcedure.ProcDate
			    ORDER BY ptDx.DxDate DESC
			)	
		
		LEFT OUTER JOIN	DxImageFindings ResectabilityMRIDxFindings
			ON ResectabilityMRIDx.DiagnosticId = ResectabilityMRIDxFindings.DiagnosticId	

		-- diagnostic test pivots
		LEFT OUTER JOIN Diagnostics AdditionalStudy_Dx1
			ON Patients.PatientId = AdditionalStudy_Dx1.PatientId
			AND AdditionalStudy_Dx1.DiagnosticId =
			(
				SELECT TOP 5 ptDx.DiagnosticId FROM Diagnostics
				INNER JOIN
				(SELECT ROW_NUMBER() OVER(ORDER BY DxDate DESC) OrdinalRow, Diagnostics.* 
				 FROM Diagnostics 
				 LEFT JOIN DxImageFindings ON DxImageFindings.DiagnosticId = Diagnostics.DiagnosticId
				 LEFT JOIN Patients pt ON pt.PatientId = Diagnostics.Patientid
				 WHERE Diagnostics.PatientId = Patients.PatientId AND 
				       ((DxImageFindings.ImgFindStatus IS NULL) OR (DxImageFindings.ImgFindStatus NOT LIKE '%resectability%') )
				 ) ptDx ON ptDx.DiagnosticId = Diagnostics.DiagnosticId
				WHERE ptDx.OrdinalRow = 1 AND (ptDx.DxDate IS NULL OR ptDx.DxDate <= PrimaryProcedure.ProcDate)
			    ORDER BY ptDx.DxDate DESC
			)

		LEFT OUTER JOIN Diagnostics AdditionalStudy_Dx2
			ON Patients.PatientId = AdditionalStudy_Dx2.PatientId
			AND AdditionalStudy_Dx2.DiagnosticId =
			(
				SELECT TOP 5 ptDx.DiagnosticId FROM Diagnostics
				INNER JOIN
				(SELECT ROW_NUMBER() OVER(ORDER BY DxDate DESC) OrdinalRow, Diagnostics.* 
				 FROM Diagnostics 
				 LEFT JOIN DxImageFindings ON DxImageFindings.DiagnosticId = Diagnostics.DiagnosticId
				 LEFT JOIN Patients pt ON pt.PatientId = Diagnostics.Patientid
				 WHERE Diagnostics.PatientId = Patients.PatientId AND 
				       ((DxImageFindings.ImgFindStatus IS NULL) OR (DxImageFindings.ImgFindStatus NOT LIKE '%resectability%') )
				 ) ptDx ON ptDx.DiagnosticId = Diagnostics.DiagnosticId
				WHERE ptDx.OrdinalRow = 2 AND (ptDx.DxDate IS NULL OR ptDx.DxDate <= PrimaryProcedure.ProcDate)
			    ORDER BY ptDx.DxDate DESC
			)
			
		LEFT OUTER JOIN Diagnostics AdditionalStudy_Dx3
			ON Patients.PatientId = AdditionalStudy_Dx1.PatientId
			AND AdditionalStudy_Dx3.DiagnosticId =
			(
				SELECT TOP 5 ptDx.DiagnosticId FROM Diagnostics
				INNER JOIN
				(SELECT ROW_NUMBER() OVER(ORDER BY DxDate DESC) OrdinalRow, Diagnostics.* 
				 FROM Diagnostics 
				 LEFT JOIN DxImageFindings ON DxImageFindings.DiagnosticId = Diagnostics.DiagnosticId
				 LEFT JOIN Patients pt ON pt.PatientId = Diagnostics.Patientid
				 WHERE Diagnostics.PatientId = Patients.PatientId AND 
				       ((DxImageFindings.ImgFindStatus IS NULL) OR (DxImageFindings.ImgFindStatus NOT LIKE '%resectability%') )
				 ) ptDx ON ptDx.DiagnosticId = Diagnostics.DiagnosticId
				WHERE ptDx.OrdinalRow = 3 AND (ptDx.DxDate IS NULL OR ptDx.DxDate <= PrimaryProcedure.ProcDate)
			    ORDER BY ptDx.DxDate DESC
			)
			
		LEFT OUTER JOIN Diagnostics AdditionalStudy_Dx4
			ON Patients.PatientId = AdditionalStudy_Dx4.PatientId
			AND AdditionalStudy_Dx4.DiagnosticId =
			(
				SELECT TOP 5 ptDx.DiagnosticId FROM Diagnostics
				INNER JOIN
				(SELECT ROW_NUMBER() OVER(ORDER BY DxDate DESC) OrdinalRow, Diagnostics.* 
				 FROM Diagnostics 
				 LEFT JOIN DxImageFindings ON DxImageFindings.DiagnosticId = Diagnostics.DiagnosticId
				 LEFT JOIN Patients pt ON pt.PatientId = Diagnostics.Patientid
				 WHERE Diagnostics.PatientId = Patients.PatientId AND 
				       ((DxImageFindings.ImgFindStatus IS NULL) OR (DxImageFindings.ImgFindStatus NOT LIKE '%resectability%') )
				 ) ptDx ON ptDx.DiagnosticId = Diagnostics.DiagnosticId
				WHERE ptDx.OrdinalRow = 4 AND (ptDx.DxDate IS NULL OR ptDx.DxDate <= PrimaryProcedure.ProcDate)
			    ORDER BY ptDx.DxDate DESC
			)
			
		LEFT OUTER JOIN Diagnostics AdditionalStudy_Dx5
			ON Patients.PatientId = AdditionalStudy_Dx5.PatientId
			AND AdditionalStudy_Dx5.DiagnosticId =
			(
				SELECT TOP 5 ptDx.DiagnosticId FROM Diagnostics
				INNER JOIN
				(SELECT ROW_NUMBER() OVER(ORDER BY DxDate DESC) OrdinalRow, Diagnostics.* 
				 FROM Diagnostics 
				 LEFT JOIN DxImageFindings ON DxImageFindings.DiagnosticId = Diagnostics.DiagnosticId
				 LEFT JOIN Patients pt ON pt.PatientId = Diagnostics.Patientid
				 WHERE Diagnostics.PatientId = Patients.PatientId AND 
				       ((DxImageFindings.ImgFindStatus IS NULL) OR (DxImageFindings.ImgFindStatus NOT LIKE '%resectability%') )
				 ) ptDx ON ptDx.DiagnosticId = Diagnostics.DiagnosticId
				WHERE ptDx.OrdinalRow = 5 AND (ptDx.DxDate IS NULL OR ptDx.DxDate <= PrimaryProcedure.ProcDate)
			    ORDER BY ptDx.DxDate DESC
			)					
			
			-- clinical staging pivots
		LEFT OUTER JOIN ClinicalStages ClinStages
			ON Patients.PatientId = ClinStages.PatientId
			AND ClinStages.ClinicalStageId =
			(
				SELECT TOP 1 ClinicalStageId
				FROM ClinicalStages
				WHERE ClinicalStages.PatientId = Patients.PatientId
				AND ClinicalStages.ClinStageDate <= PrimaryProcedure.ProcDate
				ORDER BY ClinicalStages.ClinStageDate DESC
			)
			
				
		-- lab test pivots
		LEFT OUTER JOIN LabTests AFP
			ON Patients.PatientId = AFP.PatientId
			AND AFP.LabTestId =
			(
				SELECT TOP 1 LabTestId
				FROM LabTests
				WHERE PatientId = Patients.PatientId
				AND	LabTest = 'AFP'
				AND (LabDate IS NULL OR LabDate <= PrimaryProcedure.ProcDate)
				ORDER BY LabDate DESC
			)

		LEFT OUTER JOIN LabTests Albumin
			ON Patients.PatientId = Albumin.PatientId
			AND Albumin.LabTestId =
			(
				SELECT TOP 1 LabTestId
				FROM LabTests
				WHERE PatientId = Patients.PatientId
				AND	LabTest = 'Albumin'
				AND (LabDate IS NULL OR LabDate <= PrimaryProcedure.ProcDate)
				ORDER BY LabDate DESC
			)

		LEFT OUTER JOIN LabTests Bilirubin
			ON Patients.PatientId = Bilirubin.PatientId
			AND Bilirubin.LabTestId =
			(
				SELECT TOP 1 LabTestId
				FROM LabTests
				WHERE PatientId = Patients.PatientId
				AND	LabTest = 'Total Bilirubin'
				AND (LabDate IS NULL OR LabDate <= PrimaryProcedure.ProcDate)
				ORDER BY LabDate DESC
			)

		LEFT OUTER JOIN LabTests BUN
			ON Patients.PatientId = BUN.PatientId
			AND BUN.LabTestId =
			(
				SELECT TOP 1 LabTestId
				FROM LabTests
				WHERE PatientId = Patients.PatientId
				AND	LabTest = 'BUN'
				AND (LabDate IS NULL OR LabDate <= PrimaryProcedure.ProcDate)
				ORDER BY LabDate DESC
			)

		LEFT OUTER JOIN LabTests CA_19_9
			ON Patients.PatientId = CA_19_9.PatientId
			AND CA_19_9.LabTestId =
			(
				SELECT TOP 1 LabTestId
				FROM LabTests
				WHERE PatientId = Patients.PatientId
				AND	LabTest = 'CA 19-9'
				AND (LabDate IS NULL OR LabDate <= PrimaryProcedure.ProcDate)
				ORDER BY LabDate DESC
			)

		LEFT OUTER JOIN LabTests CEA
			ON Patients.PatientId = CEA.PatientId
			AND CEA.LabTestId =
			(
				SELECT TOP 1 LabTestId
				FROM LabTests
				WHERE PatientId = Patients.PatientId
				AND	LabTest = 'CEA'
				AND (LabDate IS NULL OR LabDate <= PrimaryProcedure.ProcDate)
				ORDER BY LabDate DESC
			)

		LEFT OUTER JOIN LabTests Creatinine
			ON Patients.PatientId = Creatinine.PatientId
			AND Creatinine.LabTestId =
			(
				SELECT TOP 1 LabTestId
				FROM LabTests
				WHERE PatientId = Patients.PatientId
				AND	LabTest = 'Creatinine'
				AND (LabDate IS NULL OR LabDate <= PrimaryProcedure.ProcDate)
				ORDER BY LabDate DESC
			)

		LEFT OUTER JOIN LabTests Glucose
			ON Patients.PatientId = Glucose.PatientId
			AND Glucose.LabTestId =
			(
				SELECT TOP 1 LabTestId
				FROM LabTests
				WHERE PatientId = Patients.PatientId
				AND	LabTest = 'Glucose'
				AND (LabDate IS NULL OR LabDate <= PrimaryProcedure.ProcDate)
				ORDER BY LabDate DESC
			)

		LEFT OUTER JOIN LabTests Hematocrit
			ON Patients.PatientId = Hematocrit.PatientId
			AND Hematocrit.LabTestId =
			(
				SELECT TOP 1 LabTestId
				FROM LabTests
				WHERE PatientId = Patients.PatientId
				AND	LabTest = 'Hematocrit'
				AND (LabDate IS NULL OR LabDate <= PrimaryProcedure.ProcDate)
				ORDER BY LabDate DESC
			)

		LEFT OUTER JOIN LabTests Hemoglobin
			ON Patients.PatientId = Hemoglobin.PatientId
			AND Hemoglobin.LabTestId =
			(
				SELECT TOP 1 LabTestId
				FROM LabTests
				WHERE PatientId = Patients.PatientId
				AND	LabTest = 'Hemoglobin'
				AND (LabDate IS NULL OR LabDate <= PrimaryProcedure.ProcDate)
				ORDER BY LabDate DESC
			)

		LEFT OUTER JOIN LabTests LDH
			ON Patients.PatientId = LDH.PatientId
			AND LDH.LabTestId =
			(
				SELECT TOP 1 LabTestId
				FROM LabTests
				WHERE PatientId = Patients.PatientId
				AND	LabTest = 'LDH'
				AND (LabDate IS NULL OR LabDate <= PrimaryProcedure.ProcDate)
				ORDER BY LabDate DESC
			)

		LEFT OUTER JOIN LabTests SGOT
			ON Patients.PatientId = SGOT.PatientId
			AND SGOT.LabTestId =
			(
				SELECT TOP 1 LabTestId
				FROM LabTests
				WHERE PatientId = Patients.PatientId
				AND	LabTest = 'SGOT'
				AND (LabDate IS NULL OR LabDate <= PrimaryProcedure.ProcDate)
				ORDER BY LabDate DESC
			)

		LEFT OUTER JOIN LabTests SGPT
			ON Patients.PatientId = SGPT.PatientId
			AND SGPT.LabTestId =
			(
				SELECT TOP 1 LabTestId
				FROM LabTests
				WHERE PatientId = Patients.PatientId
				AND	LabTest = 'SGPT'
				AND (LabDate IS NULL OR LabDate <= PrimaryProcedure.ProcDate)
				ORDER BY LabDate DESC
			)
			
		-- pre-op medical therapies (take date closest to surgery)
		LEFT OUTER JOIN MedicalTherapy PreOpMedTx_Capecitabine
			ON Patients.PatientId = PreOpMedTx_Capecitabine.PatientId
			AND PreOpMedTx_Capecitabine.MedicalTherapyId =
			(
				SELECT TOP 1 MedicalTherapyId
				FROM MedicalTherapy
				WHERE PatientId = Patients.PatientId
				AND	MedTxAgent LIKE '%Capecitabine%'
				AND (MedTxDate < PrimaryProcedure.ProcDate)
				ORDER BY MedTxDate DESC
			)

		LEFT OUTER JOIN MedicalTherapy PreOpMedTx_Capeox
			ON Patients.PatientId = PreOpMedTx_Capeox.PatientId
			AND PreOpMedTx_Capeox.MedicalTherapyId =
			(
				SELECT TOP 1 MedicalTherapyId
				FROM MedicalTherapy
				WHERE PatientId = Patients.PatientId
				AND	MedTxAgent LIKE '%capeox%'
				AND (MedTxDate < PrimaryProcedure.ProcDate)
				ORDER BY MedTxDate DESC
			)

		LEFT OUTER JOIN MedicalTherapy PreOpMedTx_Cisplatin
			ON Patients.PatientId = PreOpMedTx_Cisplatin.PatientId
			AND PreOpMedTx_Cisplatin.MedicalTherapyId =
			(
				SELECT TOP 1 MedicalTherapyId
				FROM MedicalTherapy
				WHERE PatientId = Patients.PatientId
				AND	MedTxAgent LIKE '%cisplatin%'
				AND (MedTxDate < PrimaryProcedure.ProcDate)
				ORDER BY MedTxDate DESC
			)

		LEFT OUTER JOIN MedicalTherapy PreOpMedTx_Erlotinib
			ON Patients.PatientId = PreOpMedTx_Erlotinib.PatientId
			AND PreOpMedTx_Erlotinib.MedicalTherapyId =
			(
				SELECT TOP 1 MedicalTherapyId
				FROM MedicalTherapy
				WHERE PatientId = Patients.PatientId
				AND	MedTxAgent LIKE '%erlotinib%'
				AND (MedTxDate < PrimaryProcedure.ProcDate)
				ORDER BY MedTxDate DESC
			)

		LEFT OUTER JOIN MedicalTherapy PreOpMedTx_Fluoropyrimidine
			ON Patients.PatientId = PreOpMedTx_Fluoropyrimidine.PatientId
			AND PreOpMedTx_Fluoropyrimidine.MedicalTherapyId =
			(
				SELECT TOP 1 MedicalTherapyId
				FROM MedicalTherapy
				WHERE PatientId = Patients.PatientId
				AND	MedTxAgent LIKE '%fluoropyrimidine%'
				AND (MedTxDate < PrimaryProcedure.ProcDate)
				ORDER BY MedTxDate DESC
			)

		LEFT OUTER JOIN MedicalTherapy PreOpMedTx_Folfox
			ON Patients.PatientId = PreOpMedTx_Folfox.PatientId
			AND PreOpMedTx_Folfox.MedicalTherapyId =
			(
				SELECT TOP 1 MedicalTherapyId
				FROM MedicalTherapy
				WHERE PatientId = Patients.PatientId
				AND	MedTxAgent LIKE '%folfox%'
				AND (MedTxDate < PrimaryProcedure.ProcDate)
				ORDER BY MedTxDate DESC
			)

		LEFT OUTER JOIN MedicalTherapy PreOpMedTx_Gemcitabine
			ON Patients.PatientId = PreOpMedTx_Gemcitabine.PatientId
			AND PreOpMedTx_Gemcitabine.MedicalTherapyId =
			(
				SELECT TOP 1 MedicalTherapyId
				FROM MedicalTherapy
				WHERE PatientId = Patients.PatientId
				AND	MedTxAgent LIKE '%gemcitabine%'
				AND (MedTxDate < PrimaryProcedure.ProcDate)
				ORDER BY MedTxDate DESC
			)

		LEFT OUTER JOIN MedicalTherapy PreOpMedTx_5FU
			ON Patients.PatientId = PreOpMedTx_5FU.PatientId
			AND PreOpMedTx_5FU.MedicalTherapyId =
			(
				SELECT TOP 1 MedicalTherapyId
				FROM MedicalTherapy
				WHERE PatientId = Patients.PatientId
				AND	
				(
					MedTxAgent LIKE '%5%FU%'
					OR MedTxAgent LIKE '%fluorouracil%'
				)
				AND (MedTxDate < PrimaryProcedure.ProcDate)
				ORDER BY MedTxDate DESC
			)
			
		-- neo pre-op radiation (take date closest to surgery)
		LEFT OUTER JOIN RadiationTherapy PreOp_RadTx
			ON Patients.PatientId = PreOp_RadTx.PatientId
			AND PreOp_RadTx.RadiationTherapyId =
			(
				SELECT TOP 1 RadiationTherapyId
				FROM RadiationTherapy
				WHERE PatientId = Patients.PatientId
				AND RadTxDate < PrimaryProcedure.ProcDate
				ORDER BY RadTxDate DESC
			)
			
		-- adjuvant medical therapy (take date closest to surgery)
		LEFT OUTER JOIN MedicalTherapy Adjuvant_MedTx
			ON Patients.PatientId = Adjuvant_MedTx.PatientId
			AND Adjuvant_MedTx.MedicalTherapyId =
			(
				SELECT TOP 1 MedicalTherapyId
				FROM MedicalTherapy
				WHERE PatientId = Patients.PatientId
				AND MedTxDate >= PrimaryProcedure.ProcDate
				ORDER BY MedTxDate ASC
			)


		-- adjuvant medical therapy absent event test pivot; 
		LEFT OUTER JOIN AbsentEvents AdjuvantMedTx_AbsentEvent
			ON Patients.PatientId = AdjuvantMedTx_AbsentEvent.PatientId
			AND AdjuvantMedTx_AbsentEvent.AbsentEventId =
			(
				SELECT TOP 1 AbsentEvents.AbsentEventId FROM AbsentEvents
				WHERE AbsentEvents.PatientId = Patients.PatientId 
					  AND AbsentEvents.FieldValue LIKE '%Adjuvant%Therapies%'
			    ORDER BY AbsentEvents.AbsentDate DESC, AbsentEvents.UpdatedTime DESC, AbsentEvents.EnteredTime
			)

		-- adjuvant radiation (take date closest to surgery)
		LEFT OUTER JOIN RadiationTherapy Adjuvant_RadTx
			ON Patients.PatientId = Adjuvant_RadTx.PatientId
			AND Adjuvant_RadTx.RadiationTherapyId =
			(
				SELECT TOP 1 RadiationTherapyId
				FROM RadiationTherapy
				WHERE PatientId = Patients.PatientId
				AND RadiationTherapy.RadTxDate >= PrimaryProcedure.ProcDate
				ORDER BY RadTxDate ASC
			)			
		-- other surgery pivots
		LEFT OUTER JOIN Procedures Pancreatectomy
			ON Patients.PatientId = Pancreatectomy.PatientId
			AND Pancreatectomy.ProcedureId =
			(
				SELECT TOP 1 ProcedureId
				FROM Procedures
				WHERE PatientId = Patients.PatientId
				AND Procedures.ProcName = 'Pancreatectomy'
				ORDER BY ProcDate DESC
			)

		LEFT OUTER JOIN Procedures PancDuodenectomy
			ON Patients.PatientId = PancDuodenectomy.PatientId
			AND PancDuodenectomy.ProcedureId =
			(
				SELECT TOP 1 ProcedureId
				FROM Procedures
				WHERE PatientId = Patients.PatientId
				AND Procedures.ProcName = '%Pancreatico%duodenectomy%'
				ORDER BY ProcDate DESC
			)

		LEFT OUTER JOIN Procedures DistalPancreatectomy
			ON Patients.PatientId = DistalPancreatectomy.PatientId
			AND DistalPancreatectomy.ProcedureId =
			(
				SELECT TOP 1 ProcedureId
				FROM Procedures
				WHERE PatientId = Patients.PatientId
				AND Procedures.ProcName = 'distal pancreatectomy'
				ORDER BY ProcDate DESC
			)

		LEFT OUTER JOIN Procedures Excision
			ON Patients.PatientId = Excision.PatientId
			AND Excision.ProcedureId =
			(
				SELECT TOP 1 ProcedureId
				FROM Procedures
				WHERE PatientId = Patients.PatientId
				AND Procedures.ProcName LIKE '%excision'
				ORDER BY ProcDate DESC
			)

		LEFT OUTER JOIN Procedures TotalPancreatectomy
			ON Patients.PatientId = TotalPancreatectomy.PatientId
			AND TotalPancreatectomy.ProcedureId =
			(
				SELECT TOP 1 ProcedureId
				FROM Procedures
				WHERE PatientId = Patients.PatientId
				AND Procedures.ProcName = 'Total pancreatectomy'
				ORDER BY ProcDate DESC
			)

		LEFT OUTER JOIN Procedures BiliaryByPass
			ON Patients.PatientId = BiliaryByPass.PatientId
			AND BiliaryByPass.ProcedureId =
			(
				SELECT TOP 1 ProcedureId
				FROM Procedures
				WHERE PatientId = Patients.PatientId
				AND Procedures.ProcName = 'Biliary by-pass'
				ORDER BY ProcDate DESC
			)

		LEFT OUTER JOIN Procedures GastricByPass
			ON Patients.PatientId = GastricByPass.PatientId
			AND GastricByPass.ProcedureId =
			(
				SELECT TOP 1 ProcedureId
				FROM Procedures
				WHERE PatientId = Patients.PatientId
				AND Procedures.ProcName = 'gastric by pass'
				ORDER BY ProcDate DESC
			)

		LEFT OUTER JOIN Procedures BiliaryAndGastricByPass
			ON Patients.PatientId = BiliaryAndGastricByPass.PatientId
			AND BiliaryAndGastricByPass.ProcedureId =
			(
				SELECT TOP 1 ProcedureId
				FROM Procedures
				WHERE PatientId = Patients.PatientId
				AND Procedures.ProcName = 'Biliary and gastric by-pass'
				ORDER BY ProcDate DESC
			)

		LEFT OUTER JOIN Procedures Laparotomy
			ON Patients.PatientId = Laparotomy.PatientId
			AND Laparotomy.ProcedureId =
			(
				SELECT TOP 1 ProcedureId
				FROM Procedures
				WHERE PatientId = Patients.PatientId
				AND Procedures.ProcName LIKE '%laparotomy%'
				ORDER BY ProcDate DESC
			)

		LEFT OUTER JOIN Procedures Biopsy
			ON Patients.PatientId = Biopsy.PatientId
			AND Biopsy.ProcedureId =
			(
				SELECT TOP 1 ProcedureId
				FROM Procedures
				WHERE PatientId = Patients.PatientId
				AND Procedures.ProcName LIKE '%biopsy%'
				ORDER BY ProcDate DESC
			)
			
		-- splenectomy
		LEFT OUTER JOIN Procedures Splenectomy
			ON Patients.PatientId = Splenectomy.PatientId
			AND Splenectomy.ProcedureId =
			(
				SELECT TOP 1 ProcedureId
				FROM Procedures
				WHERE PatientId = Patients.PatientId
				AND Procedures.ProcName LIKE '%Splenectomy%'
				ORDER BY ProcDate DESC
			)

		-- portal vein resection
		LEFT OUTER JOIN Procedures PortalVeinResection
			ON Patients.PatientId = PortalVeinResection.PatientId
			AND PortalVeinResection.ProcedureId =
			(
				SELECT TOP 1 ProcedureId
				FROM Procedures
				WHERE PatientId = Patients.PatientId
				AND Procedures.ProcName LIKE '%PV%'
				AND Procedures.ProcName LIKE '%resection%'
				ORDER BY ProcDate DESC
			)
			
		LEFT OUTER JOIN Procedures SpleenPreservation
			ON Patients.PatientId = SpleenPreservation.PatientId
			AND SpleenPreservation.ProcedureId =
			(
				SELECT TOP 1 ProcedureId
				FROM Procedures
				WHERE PatientId = Patients.PatientId
				AND Procedures.ProcName = 'Spleen Preservation'
				ORDER BY ProcDate DESC
			)

		LEFT OUTER JOIN Procedures PVPreservation
			ON Patients.PatientId = PVPreservation.PatientId
			AND PVPreservation.ProcedureId =
			(
				SELECT TOP 1 ProcedureId
				FROM Procedures
				WHERE PatientId = Patients.PatientId
				AND Procedures.ProcName = 'PV Preservation'
				ORDER BY ProcDate DESC
			)

		-- surgical history
		LEFT OUTER JOIN Procedures SurgeryHxHeadNeckCancerProcedure
			ON Patients.PatientId = SurgeryHxHeadNeckCancerProcedure.PatientId
			AND SurgeryHxHeadNeckCancerProcedure.ProcedureId =
			(
				SELECT TOP 1 ProcedureId
				FROM Procedures
				WHERE PatientId = Patients.PatientId
				AND Procedures.ProcName LIKE '%Head%Neck Cancer Procedure%'
				AND Procedures.ProcDate < PrimaryProcedure.ProcDate
				ORDER BY ProcDate DESC
			)

		LEFT OUTER JOIN Procedures SurgeryHxCarotidEndarterectomy
			ON Patients.PatientId = SurgeryHxCarotidEndarterectomy.PatientId
			AND SurgeryHxCarotidEndarterectomy.ProcedureId =
			(
				SELECT TOP 1 ProcedureId
				FROM Procedures
				WHERE PatientId = Patients.PatientId
				AND Procedures.ProcName LIKE '%Carotid%endarterectomy%'
				AND Procedures.ProcDate < PrimaryProcedure.ProcDate
				ORDER BY ProcDate DESC
			)

		LEFT OUTER JOIN Procedures SurgeryHxCoronaryByPassGraft
			ON Patients.PatientId = SurgeryHxCoronaryByPassGraft.PatientId
			AND SurgeryHxCoronaryByPassGraft.ProcedureId =
			(
				SELECT TOP 1 ProcedureId
				FROM Procedures
				WHERE PatientId = Patients.PatientId
				AND Procedures.ProcName LIKE '%Coronary%By%Pass%Graft%'
				AND Procedures.ProcDate < PrimaryProcedure.ProcDate
				ORDER BY ProcDate DESC
			)

		LEFT OUTER JOIN Procedures SurgeryHxAorticSurgery
			ON Patients.PatientId = SurgeryHxAorticSurgery.PatientId
			AND SurgeryHxAorticSurgery.ProcedureId =
			(
				SELECT TOP 1 ProcedureId
				FROM Procedures
				WHERE PatientId = Patients.PatientId
				AND Procedures.ProcName LIKE '%Aortic%surgery%'
				AND Procedures.ProcDate < PrimaryProcedure.ProcDate
				ORDER BY ProcDate DESC
			)

		LEFT OUTER JOIN Procedures SurgeryHxPeripheralVascular
			ON Patients.PatientId = SurgeryHxPeripheralVascular.PatientId
			AND SurgeryHxPeripheralVascular.ProcedureId =
			(
				SELECT TOP 1 ProcedureId
				FROM Procedures
				WHERE PatientId = Patients.PatientId
				AND Procedures.ProcName LIKE '%Peripheral%vascular%procedures%'
				AND Procedures.ProcDate < PrimaryProcedure.ProcDate
				ORDER BY ProcDate DESC
			)

		LEFT OUTER JOIN Procedures SurgeryHxGastrectomy
			ON Patients.PatientId = SurgeryHxGastrectomy.PatientId
			AND SurgeryHxGastrectomy.ProcedureId =
			(
				SELECT TOP 1 ProcedureId
				FROM Procedures
				WHERE PatientId = Patients.PatientId
				AND Procedures.ProcName LIKE '%Gastrectomy%'
				AND Procedures.ProcDate < PrimaryProcedure.ProcDate
				ORDER BY ProcDate DESC
			)

		LEFT OUTER JOIN Procedures SurgeryHxColonRectalResection
			ON Patients.PatientId = SurgeryHxColonRectalResection.PatientId
			AND SurgeryHxColonRectalResection.ProcedureId =
			(
				SELECT TOP 1 ProcedureId
				FROM Procedures
				WHERE PatientId = Patients.PatientId
				AND Procedures.ProcName LIKE '%Colon%rectal%Resection%'
				AND Procedures.ProcDate < PrimaryProcedure.ProcDate
				ORDER BY ProcDate DESC
			)

		LEFT OUTER JOIN Procedures SurgeryHxLiverResectionAblation
			ON Patients.PatientId = SurgeryHxLiverResectionAblation.PatientId
			AND SurgeryHxLiverResectionAblation.ProcedureId =
			(
				SELECT TOP 1 ProcedureId
				FROM Procedures
				WHERE PatientId = Patients.PatientId
				AND Procedures.ProcName LIKE '%Liver%resection%Ablation%'
				AND Procedures.ProcDate < PrimaryProcedure.ProcDate
				ORDER BY ProcDate DESC
			)

		LEFT OUTER JOIN Procedures SurgeryHxVentralInguinalHerniaRepair
			ON Patients.PatientId = SurgeryHxVentralInguinalHerniaRepair.PatientId
			AND SurgeryHxVentralInguinalHerniaRepair.ProcedureId =
			(
				SELECT TOP 1 ProcedureId
				FROM Procedures
				WHERE PatientId = Patients.PatientId
				AND Procedures.ProcName LIKE '%Ventral%Inguinal%Hernia%Repair%'
				AND Procedures.ProcDate < PrimaryProcedure.ProcDate
				ORDER BY ProcDate DESC
			)
			
		-- comorbidity pivots
		-- Coronary Artery Disease
		LEFT OUTER JOIN Comorbidities Comorb_CAD
			ON Patients.PatientId = Comorb_CAD.PatientId
			AND Comorb_CAD.Comorbidity = 'Coronary Artery Disease'

		-- Myocardial Infarction
		LEFT OUTER JOIN Comorbidities Comorb_Myoc
			ON Patients.PatientId = Comorb_Myoc.PatientId
			AND Comorb_Myoc.Comorbidity = 'Myocardial Infarction'

		-- Hypertension
		LEFT OUTER JOIN Comorbidities Comorb_Hypertension
			ON Patients.PatientId = Comorb_Hypertension.PatientId
			AND Comorb_Hypertension.Comorbidity = 'Hypertension'

		-- CVA
		LEFT OUTER JOIN Comorbidities Comorb_CVA
			ON Patients.PatientId = Comorb_CVA.PatientId
			AND Comorb_CVA.Comorbidity = 'CVA'
    
		-- Thromboembolic Events / DVT
		LEFT OUTER JOIN Comorbidities Comorb_Thrombo
			ON Patients.PatientId = Comorb_Thrombo.PatientId
			AND Comorb_Thrombo.Comorbidity = 'Thromboembolic Events / DVT'
 
		-- Asthma
		LEFT OUTER JOIN Comorbidities Comorb_Asthma
			ON Patients.PatientId = Comorb_Asthma.PatientId
			AND Comorb_Asthma.Comorbidity = 'Asthma'

		-- Diabetes (IDDM)
		LEFT OUTER JOIN Comorbidities Comorb_DiabIDDM
			ON Patients.PatientId = Comorb_DiabIDDM.PatientId
			AND Comorb_DiabIDDM.Comorbidity = 'Diabetes (IDDM)'

		-- Diabetes (NIDDM)
		LEFT OUTER JOIN Comorbidities Comorb_DiabNIDDM
			ON Patients.PatientId = Comorb_DiabNIDDM.PatientId
			AND Comorb_DiabNIDDM.Comorbidity = 'Diabetes (NIDDM)'

		-- Hypercholesterolemia
		LEFT OUTER JOIN Comorbidities Comorb_Hyperchol
			ON Patients.PatientId = Comorb_Hyperchol.PatientId
			AND Comorb_Hyperchol.Comorbidity = 'Hypercholesterolemia'

		-- Depression
		LEFT OUTER JOIN Comorbidities Comorb_Depression
			ON Patients.PatientId = Comorb_Depression.PatientId
			AND Comorb_Depression.Comorbidity = 'Depression'
			
		-- intraop complications
		LEFT OUTER JOIN Toxicities IntraOp_MyocInfarc
			ON Patients.PatientId = IntraOp_MyocInfarc.PatientId
			AND IntraOp_MyocInfarc.ToxName = 'Myocardial Infarction'

		LEFT OUTER JOIN Toxicities IntraOp_Arrythmia
			ON Patients.PatientId = IntraOp_Arrythmia.PatientId
			AND IntraOp_Arrythmia.ToxName = 'Cardiac Arrythmia'

		LEFT OUTER JOIN Toxicities IntraOp_Arrest
			ON Patients.PatientId = IntraOp_Arrest.PatientId
			AND IntraOp_Arrest.ToxName = 'Cardiac Arrest'

		LEFT OUTER JOIN Toxicities IntraOp_InjBowel
			ON Patients.PatientId = IntraOp_InjBowel.PatientId
			AND IntraOp_InjBowel.ToxName = 'Injury to bowel'

		LEFT OUTER JOIN Toxicities IntraOp_InjSpleen
			ON Patients.PatientId = IntraOp_InjSpleen.PatientId
			AND IntraOp_InjSpleen.ToxName = 'Injury to spleen'

		LEFT OUTER JOIN Toxicities IntraOp_InjIVC
			ON Patients.PatientId = IntraOp_InjIVC.PatientId
			AND IntraOp_InjIVC.ToxName = 'Injury to IVC, EBL > 700'

		LEFT OUTER JOIN Toxicities IntraOp_InjPV
			ON Patients.PatientId = IntraOp_InjPV.PatientId
			AND IntraOp_InjPV.ToxName = 'Injury to PV, EBL > 700'
						
		-- find earliest post-op hospitalization
		LEFT OUTER JOIN Hospitalizations
			ON Patients.PatientId = Hospitalizations.PatientId
			AND Hospitalizations.HospitalizationId =
			(
				SELECT TOP 1 HospitalizationId
				FROM Hospitalizations
				WHERE PatientId = Patients.PatientId
				AND HospDischargeDate > OperatingRoomDetails.OpDate
				ORDER BY HospAdmitDate ASC
			)
			
		-- find earliest post-op re-op w/i 30 days
		LEFT OUTER JOIN Toxicities ReOperation
			ON Patients.PatientId = ReOperation.PatientId
			AND ReOperation.ToxicityId =
			(
				SELECT TOP 1 ToxicityId
				FROM Toxicities
				WHERE PatientId = Patients.PatientId
				AND ToxName = 'Re-operation within 30 days'
				AND ToxDate > OperatingRoomDetails.OpDate
				ORDER BY ToxDate ASC
			)

		-- find earliest post-op re-adm w/i 30 days
		LEFT OUTER JOIN Toxicities ReAdmission
			ON Patients.PatientId = ReAdmission.PatientId
			AND ReAdmission.ToxicityId =
			(
				SELECT TOP 1 ToxicityId
				FROM Toxicities
				WHERE PatientId = Patients.PatientId
				AND ToxName = 'Re-admission within 30 days'
				AND ToxDate > OperatingRoomDetails.OpDate
				ORDER BY ToxDate ASC
			)
			
		LEFT OUTER JOIN Status LastContactStatus
			ON Patients.PatientId = LastContactStatus.PatientId
			AND LastContactStatus.StatusId = 
			(
				SELECT TOP 1 StatusId
				FROM Status ptSt
				WHERE ptSt.PatientId = Patients.PatientId
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
			ON Patients.PatientId = RecurrenceStatus.PatientId
			AND RecurrenceStatus.StatusId = 
			(
				SELECT TOP 1 StatusId
				FROM Status ptSt
				WHERE ptSt.PatientId = Patients.PatientId
				AND 
				(
					ptSt.Status LIKE '%Recurrence'
				)
				ORDER BY ptSt.StatusDate DESC
			)

		LEFT OUTER JOIN Status SubsequentMetastasesStatus
			ON Patients.PatientId = SubsequentMetastasesStatus.PatientId
			AND SubsequentMetastasesStatus.StatusId = 
			(
				SELECT TOP 1 StatusId
				FROM Status ptSt
				WHERE ptSt.PatientId = Patients.PatientId
				AND 
				(
					ptSt.Status LIKE '%Subsequent metastases%'
				)
				ORDER BY ptSt.StatusDate DESC
			)

		LEFT OUTER JOIN PatientDiseases 
			ON PatientDiseases.PatientId = Patients.PatientId
		
		LEFT OUTER JOIN Diseases 
			ON Diseases.DiseaseId = PatientDiseases.DiseaseId
		 
WHERE 
	-- exclude test/bogus patients
	Patients.PatientId NOT IN (1, 3, 4, 641, 645)
	AND Diseases.Diseasename = 'Pancreas Cancer'
	
GROUP BY
	Patients.PatientId,
	Patients.PtMRN,
	Patients.PtGender,
	Patients.PtBirthDateText,
	Patients.PtRace,

	Comorb_CAD.ComorbidityId,
	Comorb_Myoc.ComorbidityId,
	Comorb_Hypertension.ComorbidityId,
	Comorb_CVA.ComorbidityId,
	Comorb_Thrombo.ComorbidityId,
	Comorb_Asthma.ComorbidityId,
	Comorb_DiabIDDM.ComorbidityId,
	Comorb_DiabNIDDM.ComorbidityId,
	Comorb_Hyperchol.ComorbidityId,
	Comorb_Depression.ComorbidityId,

	SurgeryHxHeadNeckCancerProcedure.ProcedureId,
	SurgeryHxCarotidEndarterectomy.ProcedureId,
	SurgeryHxCoronaryByPassGraft.ProcedureId,
	SurgeryHxAorticSurgery.ProcedureId,
	SurgeryHxPeripheralVascular.ProcedureId,
	SurgeryHxGastrectomy.ProcedureId,
	SurgeryHxColonRectalResection.ProcedureId,
	SurgeryHxLiverResectionAblation.ProcedureId,
	SurgeryHxVentralInguinalHerniaRepair.ProcedureId,
	
	SocialHistories.SocHxTobaccoType,
	SocialHistories.SocHxTobaccoPacksPerDay,
	SocialHistories.SocHxTobaccoYears,
	SocialHistories.SocHxTobaccoQuitYear,
	SocialHistories.SocHxAlcohol,
	SocialHistories.SocHxOther,
	SocialHistories.SocHxAlcoholDrinksPerDay,
	SocialHistories.SocHxAlcoholYears,
	SocialHistories.SocHxAlcoholQuitYear,
	
	FamHistoryCancer.FamilyMemberId,
	FamHistoryHereditaryPancreatitis.FamilyMemberId,
	FamHistoryAbsentEvent.AbsentEventId,
	FamHistoryAbsentEvent.AbsentReason,
	
	ResectabilityCTDx.DxType,
	ResectabilityCTDx.DxDateText,
	ResectabilityCTDx.DxResult,
	ResectabilityCTDxFindings.ImgFindSite,
	ResectabilityCTDxFindings.ImgFindResult,	
	ResectabilityMRIDx.DxType,
	ResectabilityMRIDx.DxDateText,
	ResectabilityMRIDx.DxResult,
	ResectabilityMRIDxFindings.ImgFindSite,
	ResectabilityMRIDxFindings.ImgFindResult,	
	
	AdditionalStudy_Dx1.DxType,
	AdditionalStudy_Dx1.DxDateText,
	AdditionalStudy_Dx1.DxResult,
	AdditionalStudy_Dx2.DxType,
	AdditionalStudy_Dx2.DxDateText,
	AdditionalStudy_Dx2.DxResult,
	AdditionalStudy_Dx3.DxType,
	AdditionalStudy_Dx3.DxDateText,
	AdditionalStudy_Dx3.DxResult,
	AdditionalStudy_Dx4.DxType,
	AdditionalStudy_Dx4.DxDateText,
	AdditionalStudy_Dx4.DxResult,
	AdditionalStudy_Dx5.DxType,
	AdditionalStudy_Dx5.DxDateText,
	AdditionalStudy_Dx5.DxResult,

	PreOpEncounter.EncECOG_Score,
	PreOpEncounter.EncKPS,

    ClinStages.ClinStageDateText,
    ClinStages.ClinStageT,
	ClinStages.ClinStageN,
	ClinStages.ClinStageM,

	PreOpMedTx_Capecitabine.MedicalTherapyId,
	PreOpMedTx_Cisplatin.MedicalTherapyId,
	PreOpMedTx_Cisplatin.MedicalTherapyId,
	PreOpMedTx_Erlotinib.MedicalTherapyId,
	PreOpMedTx_Fluoropyrimidine.MedicalTherapyId,
	PreOpMedTx_Folfox.MedicalTherapyId,
	PreOpMedTx_Gemcitabine.MedicalTherapyId,
	PreOpMedTx_5FU.MedicalTherapyId,

	PreOp_RadTx.RadTxType,
	PreOp_RadTx.RadTxTotalDose,
		
	PreOpEncounter.EncHeight,
	PreOpEncounter.EncWeight,
	PreOpEncounter.EncChiefComplaint,
	
	OperatingRoomDetails.OpASA,
	
	AFP.LabResult,
	Albumin.LabResult,
	Bilirubin.LabResult,
	BUN.LabResult,
	CA_19_9.LabResult,
	CEA.LabResult,
	Creatinine.LabResult,
	Glucose.LabResult,
	Hematocrit.LabResult,
	Hemoglobin.LabResult,
	LDH.LabResult,
	SGOT.LabResult,
	SGPT.LabResult,
	
	OperatingRoomDetails.OpDate,		
	
	PrimaryProcedure.ProcedureId,
	PrimaryProcedure.ProcDate,
	PrimaryProcedure.ProcDateText,
	PrimaryProcedure.ProcName,
	PrimaryProcedure.ProcApproach,
	
	OperatingRoomDetails.OpCaseSurgeon,
	OperatingRoomDetails.OpDuration,
	OperatingRoomDetails.OpInTime,
	OperatingRoomDetails.OpOutTime,
	OperatingRoomDetails.OpUrineOutput,
	OperatingRoomDetails.OpCrystalloid,
	OperatingRoomDetails.OpColloid,
	OperatingRoomDetails.OpEstBloodLoss,
	OperatingRoomDetails.OpRBC_Transfused,
	OperatingRoomDetails.OpNotes,
	
	PrimaryProcDetails.ProcStent,
	PrimaryProcDetails.ProcMarginFrozen,
	PrimaryProcDetails.ProcReconstruction,
	PrimaryProcDetails.ProcPancreas,
	PrimaryProcDetails.ProcPancreaticDuctSize,
	PrimaryProcDetails.ProcBiliaryBypass,
	PrimaryProcDetails.ProcBiliaryBypassOrigin,
	PrimaryProcDetails.ProcGastricBypass,
	PrimaryProcDetails.ProcPlexusBlock,
	PrimaryProcDetails.ProcDrains,
	PrimaryProcDetails.ProcSkinClosure,
	PrimaryProcDetails.ProcPancreaticAnast,
	-- FIELD NOT IN MAIN BRANCH PrimaryProcDetails.ProcAddOrgansResected,

	
	
	
	Pancreatectomy.ProcedureId,
	Pancreatectomy.ProcDateText,	
	PancDuodenectomy.ProcedureId,
	PancDuodenectomy.ProcDateText,
	DistalPancreatectomy.ProcedureId,
	DistalPancreatectomy.ProcDateText,
	Excision.ProcedureId,
	Excision.ProcDateText,
	TotalPancreatectomy.ProcedureId,
	TotalPancreatectomy.ProcDateText,
	BiliaryByPass.ProcedureId,
	BiliaryByPass.ProcDateText,
	GastricByPass.ProcedureId,
	GastricByPass.ProcDateText,
	BiliaryAndGastricByPass.ProcedureId,
	BiliaryAndGastricByPass.ProcDateText,
	Laparotomy.ProcedureId,
	Laparotomy.ProcDateText,
	Biopsy.ProcedureId,
	Biopsy.ProcDateText,
	
	Splenectomy.ProcedureId,
	Splenectomy.ProcDateText,
	SpleenPreservation.ProcedureId,
	SpleenPreservation.ProcDateText,
	PortalVeinResection.ProcedureId,
	PortalVeinResection.ProcDateText,
	PVPreservation.ProcedureId,
	PVPreservation.ProcDateText,
	
	
	IntraOp_MyocInfarc.ToxicityId,
	IntraOp_Arrythmia.ToxicityId,
	IntraOp_Arrest.ToxicityId,
	IntraOp_InjBowel.ToxicityId,
	IntraOp_InjSpleen.ToxicityId,
	IntraOp_InjIVC.ToxicityId,
	IntraOp_InjPv.ToxicityId,
	
	Pathology.PathologyId,
	Pathology.PathNum,
	Pathology.PathHistology,
	PancreasPath.PathPerineuralInv,
	PancreasPath.PathVascularInv,
	PancreasPath.PathLymphaticInv,
	PancreasPath.PathPancreaticMargin,
	PancreasPath.PathPosteriorMargin,
	PancreasPath.PathAnteriorPeritonealInv,
	PancreasPath.PathBileDuctMargin,
	PancreasPath.PathDuodenalMargin,
	PancreasPath.PathGastricMargin,
	PancreasPath.PathPancreatitis,
	PancreasPath.PathFibrosis,
	PancreasPath.PathPanIn,
	PancreasPath.PathExtraParenchymalInv,
	PancreasPath.PathIPMN,
	-- FIELD NOT IN MAIN BRANCH PancreasPath.PathOtherOrganInv,
		
	PathologyStageGrade.PathStageT,
	PathologyStageGrade.PathStageM,
	PathologyStageGrade.PathStageN,
	PathologyStageGrade.PathStageR,
	
	Site_Pancreatic.NodePathFindingId,
	Site_Pancreatic.PathFindPosNodes,
	Site_Pancreatic.PathFindNumNodes,
	Site_Peripancreatic.NodePathFindingId,
	Site_Peripancreatic.PathFindPosNodes,
	Site_Peripancreatic.PathFindNumNodes,
	Site_Gastric.NodePathFindingId,
	Site_Gastric.PathFindPosNodes,
	Site_Gastric.PathFindNumNodes,
	Site_Pancreaticoduodenal.NodePathFindingId,
	Site_Pancreaticoduodenal.PathFindPosNodes,
	Site_Pancreaticoduodenal.PathFindNumNodes,
	Site_BileDuct.NodePathFindingId,
	Site_BileDuct.PathFindPosNodes,
	Site_BileDuct.PathFindNumNodes,
	Site_Duodenal.NodePathFindingId,
	Site_Duodenal.PathFindPosNodes,
	Site_Duodenal.PathFindNumNodes,
		
	PathologyFinding_LocationBody.PathologyFindingId,
	PathologyFinding_LocationBody.PathFindSite,
	PathologyFinding_LocationBody.PathFindWidth,
	PathologyFinding_LocationBody.PathFindGrade,

	PathologyFinding_LocationHead.PathologyFindingId,
	PathologyFinding_LocationHead.PathFindSite,
	PathologyFinding_LocationHead.PathFindWidth,
	PathologyFinding_LocationHead.PathFindGrade,

	PathologyFinding_LocationNeck.PathologyFindingId,
	PathologyFinding_LocationNeck.PathFindSite,
	PathologyFinding_LocationNeck.PathFindWidth,
	PathologyFinding_LocationNeck.PathFindGrade,

	PathologyFinding_LocationTail.PathologyFindingId,
	PathologyFinding_LocationTail.PathFindSite,
	PathologyFinding_LocationTail.PathFindWidth,
	PathologyFinding_LocationTail.PathFindGrade,

	PathologyFinding_LocationUncinateProcess.PathologyFindingId,
	PathologyFinding_LocationUncinateProcess.PathFindSite,
	PathologyFinding_LocationUncinateProcess.PathFindWidth,
	PathologyFinding_LocationUncinateProcess.PathFindGrade,

	PathologyFinding_LocationUnknown.PathologyFindingId,
	PathologyFinding_LocationUnknown.PathFindSite,
	PathologyFinding_LocationUnknown.PathFindWidth,
	PathologyFinding_LocationUnknown.PathFindGrade,

	PathologyFinding_LocationUnspecified.PathologyFindingId,
	PathologyFinding_LocationUnspecified.PathFindSite,
	PathologyFinding_LocationUnspecified.PathFindWidth,
	PathologyFinding_LocationUnspecified.PathFindGrade,
	
	Pathology.PathNotes,
	
	Hospitalizations.HospICUStay,
	Hospitalizations.HospDischargeDateText,
	OperatingRoomDetails.OpRBC_PostOp,
	Hospitalizations.HospInstitution,
	Hospitalizations.HospNotes,
	
	ReOperation.ToxicityId,
	ReOperation.ToxGrade,
	
	ReAdmission.ToxicityId,
	ReAdmission.ToxGrade,

	Adjuvant_RadTx.RadiationTherapyId,
	Adjuvant_RadTx.RadTxType,
	Adjuvant_RadTx.RadTxTotalDose,
	
	Adjuvant_MedTx.MedicalTherapyId,
	AdjuvantMedTx_AbsentEvent.AbsentEventId,
	AdjuvantMedTx_AbsentEvent.AbsentReason,
		
	LastContactStatus.StatusDateText,
	LastContactStatus.Status,
	LastContactStatus.StatusNotes,
	
	RecurrenceStatus.StatusDateText,
	RecurrenceStatus.Status,
	RecurrenceStatus.StatusNotes,

	SubsequentMetastasesStatus.StatusDateText,
	SubsequentMetastasesStatus.StatusNotes,

	Patients.PtDeathDateText,
	Patients.PtDeathCause,
	Patients.PtDeathType

		
ORDER BY PatientId, PrimaryProcedureDate