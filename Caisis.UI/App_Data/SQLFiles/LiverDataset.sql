
      -- Liver Dataset query
      -- column order reflects flow of Liver Surgery eform

      -- known test/bogus patients (1, 3, 4, 641, 645, 640, 436, 647)

      SELECT
      -- HPI - Demographics
      Patients.PatientId,
      Patients.PtMRN  AS MRN,
      Patients.PtGender AS Gender,
      Patients.PtBirthDateText AS BirthDate,
      Patients.PtBirthPlace AS CountryOfBirth,
      Patients.PtRace AS Race,
      ResidencyStatusLegalResident.SurveyItemResult AS LegalResidentOfUS,
      ResidencyStatusYearImmigrated.SurveyItemResult AS YearImmigratedToUS,

      -- HPI - Chief Complaint
      Encounter.EncChiefComplaint AS ChiefComplaintPresentation,

      -- HPI - Date of Diagnosis
      DiagnosisDate.StatusDisease AS Diagnosis_DiseaseType,
      DiagnosisDate.StatusDateText AS Diagnosis_Date,

      -- PAST MEDICAL HISTORY - Underlying Liver Disease
      CASE
      WHEN UnderlyingLiverDiseaseAbsentEvent.AbsentEventId IS NULL
      AND ComorbiditiesAny.ComorbidityId IS NULL
      THEN NULL
      WHEN UnderlyingLiverDiseaseAbsentEvent.AbsentEventId IS NOT NULL
      AND ComorbiditiesAny.ComorbidityId IS NULL
      THEN UnderlyingLiverDiseaseAbsentEvent.AbsentReason
      ELSE 'Yes'
      END AS UnderlyingLiverDisease,

      CASE
      WHEN Comorb_HepatitisB.ComorbidityId IS NOT NULL THEN 'Yes'
      ELSE NULL
      END AS Comorb_HepatitisB,
      CASE
      WHEN Comorb_HepatitisC.ComorbidityId IS NOT NULL THEN 'Yes'
      ELSE NULL
      END AS Comorb_HepatitisC,
      CASE
      WHEN Comorb_EtOH.ComorbidityId IS NOT NULL THEN 'Yes'
      ELSE NULL
      END AS Comorb_EtOH,
      CASE
      WHEN Comorb_HIV.ComorbidityId IS NOT NULL THEN 'Yes'
      ELSE NULL
      END AS Comorb_HIV,
      CASE
      WHEN Comorb_Diabetes.ComorbidityId IS NOT NULL THEN 'Yes'
      ELSE NULL
      END AS Comorb_Diabetes,
      (
      SELECT Comorbidity + ', '
      FROM Comorbidities
      WHERE PatientId = Patients.PatientId
      AND Comorbidity NOT IN
      (
      'Hepatitis B',
      'Hepatitis C',
      'EtOH Cirrhosis',
      'HIV',
      'Diabetes'
      )
      FOR XML PATH('')
      ) AS Comorb_Other,


      -- PAST MEDICAL HISTORY - Anti-viral Therapy
      CASE
      WHEN AntiviralTherapyAbsentEvent.AbsentEventId IS NULL
      AND AntiviralTherapy.MedicalTherapyId IS NULL
      THEN NULL
      WHEN AntiviralTherapyAbsentEvent.AbsentEventId IS NOT NULL
      AND AntiviralTherapy.MedicalTherapyId IS NULL
      THEN AntiviralTherapyAbsentEvent.AbsentReason
      ELSE 'Yes'
      END AS HistoryOfAntiviralTherapy,
      AntiviralTherapy.MedTxAgent AS Antiviral_Agent,
      AntiviralTherapy.MedTxDateText AS Antiviral_StartDate,
      AntiviralTherapy.MedTxStopDateText AS Antiviral_StopDate,


      -- PAST MEDICAL HISTORY - Social History
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

      -- PAST MEDICAL HISTORY - Family History
      CASE
      WHEN FamHistoryAbsentEvent.AbsentEventId IS NULL
      AND FamHistoryDiagnosis.FamilyMemberId IS NULL
      THEN NULL
      WHEN FamHistoryAbsentEvent.AbsentEventId IS NOT NULL
      AND FamHistoryDiagnosis.FamilyMemberId IS NULL
      THEN FamHistoryAbsentEvent.AbsentReason
      ELSE 'Yes'
      END AS FamilyHistory,

      (
      SELECT COALESCE(FamilyMembers.FamMemRelation,'') + COALESCE(' : ' + FamilyMemberDiagnosis.FamMemDiagnosis,'') + ', '
      FROM FamilyMemberDiagnosis
      LEFT JOIN FamilyMembers ON FamilyMembers.FamilyMemberId = FamilyMemberDiagnosis.FamilyMemberId
      WHERE PatientId = Patients.PatientId
      AND FamilyMemberDiagnosis.FamMemDiagnosis IS NOT NULL
      FOR XML PATH('')
      ) AS FamilyMemberDiagnoses,


      -- ASSESSMENT/ECOG - Encounter
      Encounter.EncDateText AS Encounter_Date,
      Encounter.EncHeight AS Encounter_Height,
      Encounter.EncWeight AS Encounter_Weight,
      Encounter.EncBMI AS Encounter_BMI,
      Encounter.EncInstitution AS Encounter_Institution,
      CASE
      WHEN CHARINDEX('OTHER EFORM DATA: ',Encounter.EncNotes) != 0
      THEN SUBSTRING(Encounter.EncNotes,0,CHARINDEX('OTHER EFORM DATA: ',Encounter.EncNotes))
      ELSE NULL
      END AS Encounter_Notes,

      -- ASSESSMENT/ECOG - Assessment
      Encounter.EncECOG_Score AS Encounter_ECOG,
      Encounter.EncKPS AS Encounter_KPS,

      -- IMAGING - Imaging
      CASE
      WHEN ImagingAbsentEvent.AbsentEventId IS NULL
      AND ImagingAny.DiagnosticId IS NULL
      THEN NULL
      WHEN ImagingAbsentEvent.AbsentEventId IS NOT NULL
      AND ImagingAny.DiagnosticId IS NULL
      THEN ImagingAbsentEvent.AbsentReason
      ELSE 'Yes'
      END AS Imaging,

      CASE
      WHEN ImagingCTScan.DiagnosticId IS NULL THEN NULL
      ELSE 'Yes'
      END AS Imaging_CTScan,
      ImagingCTScan.DxDateText AS Imaging_CTScan_Date,
      ImagingCTScan.DxResult AS Imaging_CTScan_Result,
      ImagingCTScan.DxTotalNumTumors AS Imaging_CTScan_NumOfTumors,
      ImagingCTScan.DxInstitution AS Imaging_CTScan_Institution,
      (
      SELECT ImgFindResult + COALESCE(' : ' + ImgFindSubsite,'') + COALESCE(' : ' + ImgFindWidth + 'cm','') + ', '
      FROM DxImageFindings
      WHERE DiagnosticId = ImagingCTScan.DiagnosticId
      FOR XML PATH('')
      ) AS Imaging_CTScan_Findings,
      ImagingCTScan.DxNotes AS Imaging_CTScan_Notes,


      CASE
      WHEN ImagingMRI.DiagnosticId IS NULL THEN NULL
      ELSE 'Yes'
      END AS Imaging_MRI,
      ImagingMRI.DxDateText AS Imaging_MRI_Date,
      ImagingMRI.DxResult AS Imaging_MRI_Result,
      ImagingMRI.DxTotalNumTumors AS Imaging_MRI_NumOfTumors,
      ImagingMRI.DxInstitution AS Imaging_MRI_Institution,
      (
      SELECT ImgFindResult + COALESCE(' : ' + ImgFindSubsite,'') + COALESCE(' : ' + ImgFindWidth + 'cm','') + ', '
      FROM DxImageFindings
      WHERE DiagnosticId = ImagingMRI.DiagnosticId
      FOR XML PATH('')
      ) AS Imaging_MRI_Findings,
      ImagingMRI.DxNotes AS Imaging_MRI_Notes,


      ImagingOther_1.DxType AS Imaging_Other1_ScanType,
      ImagingOther_1.DxDateText AS Imaging_Other1_Date,
      ImagingOther_1.DxResult AS Imaging_Other1_Result,
      ImagingOther_1.DxTotalNumTumors AS Imaging_Other1_NumOfTumors,
      ImagingOther_1.DxInstitution AS Imaging_Other1_Institution,
      (
      SELECT ImgFindResult + COALESCE(' : ' + ImgFindSubsite,'') + COALESCE(' : ' + ImgFindWidth + 'cm','') + ', '
      FROM DxImageFindings
      WHERE DiagnosticId = ImagingOther_1.DiagnosticId
      FOR XML PATH('')
      ) AS Imaging_Other1_Findings,
      ImagingOther_1.DxNotes AS Imaging_Other1_Notes,


      ImagingOther_2.DxType AS Imaging_Other2_ScanType,
      ImagingOther_2.DxDateText AS Imaging_Other2_Date,
      ImagingOther_2.DxResult AS Imaging_Other2_Result,
      ImagingOther_2.DxTotalNumTumors AS Imaging_Other2_NumOfTumors,
      ImagingOther_2.DxInstitution AS Imaging_Other2_Institution,
      (
      SELECT ImgFindResult + COALESCE(' : ' + ImgFindSubsite,'') + COALESCE(' : ' + ImgFindWidth + 'cm','') + ', '
      FROM DxImageFindings
      WHERE DiagnosticId = ImagingOther_2.DiagnosticId
      FOR XML PATH('')
      ) AS Imaging_Other2_Findings,
      ImagingOther_2.DxNotes AS Imaging_Other2_Notes,


      ImagingOther_3.DxType AS Imaging_Other3_ScanType,
      ImagingOther_3.DxDateText AS Imaging_Other3_Date,
      ImagingOther_3.DxResult AS Imaging_Other3_Result,
      ImagingOther_3.DxTotalNumTumors AS Imaging_Other3_NumOfTumors,
      ImagingOther_3.DxInstitution AS Imaging_Other3_Institution,
      (
      SELECT ImgFindResult + COALESCE(' : ' + ImgFindSubsite,'') + COALESCE(' : ' + ImgFindWidth + 'cm','') + ', '
      FROM DxImageFindings
      WHERE DiagnosticId = ImagingOther_3.DiagnosticId
      FOR XML PATH('')
      ) AS Imaging_Other3_Findings,
      ImagingOther_3.DxNotes AS Imaging_Other3_Notes,


      ImagingOther_4.DxType AS Imaging_Other4_ScanType,
      ImagingOther_4.DxDateText AS Imaging_Other4_Date,
      ImagingOther_4.DxResult AS Imaging_Other4_Result,
      ImagingOther_4.DxTotalNumTumors AS Imaging_Other4_NumOfTumors,
      ImagingOther_4.DxInstitution AS Imaging_Other4_Institution,
      (
      SELECT ImgFindResult + COALESCE(' : ' + ImgFindSubsite,'') + COALESCE(' : ' + ImgFindWidth + 'cm','') + ', '
      FROM DxImageFindings
      WHERE DiagnosticId = ImagingOther_4.DiagnosticId
      FOR XML PATH('')
      ) AS Imaging_Other4_Findings,
      ImagingOther_4.DxNotes AS Imaging_Other4_Notes,


      ImagingOther_5.DxType AS Imaging_Other5_ScanType,
      ImagingOther_5.DxDateText AS Imaging_Other5_Date,
      ImagingOther_5.DxResult AS Imaging_Other5_Result,
      ImagingOther_5.DxTotalNumTumors AS Imaging_Other5_NumOfTumors,
      ImagingOther_5.DxInstitution AS Imaging_Other5_Institution,
      (
      SELECT ImgFindResult + COALESCE(' : ' + ImgFindSubsite,'') + COALESCE(' : ' + ImgFindWidth + 'cm','') + ', '
      FROM DxImageFindings
      WHERE DiagnosticId = ImagingOther_5.DiagnosticId
      FOR XML PATH('')
      ) AS Imaging_Other5_Findings,
      ImagingOther_5.DxNotes AS Imaging_Other5_Notes,


      -- IMAGING - Biopsy Performed
      CASE
      WHEN BiopsyProcedure.ProcedureId IS NULL
      THEN NULL
      ELSE 'Yes'
      END AS Biopsy_Performed,
      BiopsyProcedure.ProcDateText AS Biopsy_Date,
      BiopsyProcedure.ProcApproach AS Biopsy_Type,
      BiopsyProcedure.ProcNotes AS Biopsy_PathReport,

      -- LABS - Lab Tests (Pre-Op)
      CASE
      WHEN PreOpLab_Platelets.LabTestId IS NULL
      THEN NULL
      ELSE 'Yes'
      END AS PreOpLab_Platelets,
      PreOpLab_Platelets.LabDateText AS PreOpLab_Platelets_Date,
      PreOpLab_Platelets.LabResult AS PreOpLab_Platelets_Result,
      PreOpLab_Platelets.LabNotes AS PreOpLab_Platelets_Notes,

      CASE
      WHEN PreOpLab_AFP.LabTestId IS NULL
      THEN NULL
      ELSE 'Yes'
      END AS PreOpLab_AFP,
      PreOpLab_AFP.LabDateText AS PreOpLab_AFP_Date,
      PreOpLab_AFP.LabResult AS PreOpLab_AFP_Result,
      PreOpLab_AFP.LabNotes AS PreOpLab_AFP_Notes,

      CASE
      WHEN PreOpLab_CEA.LabTestId IS NULL
      THEN NULL
      ELSE 'Yes'
      END AS PreOpLab_CEA,
      PreOpLab_CEA.LabDateText AS PreOpLab_CEA_Date,
      PreOpLab_CEA.LabResult AS PreOpLab_CEA_Result,
      PreOpLab_CEA.LabNotes AS PreOpLab_CEA_Notes,

      CASE
      WHEN PreOpLab_CA199.LabTestId IS NULL
      THEN NULL
      ELSE 'Yes'
      END AS PreOpLab_CA199,
      PreOpLab_CA199.LabDateText AS PreOpLab_CA199_Date,
      PreOpLab_CA199.LabResult AS PreOpLab_CA199_Result,
      PreOpLab_CA199.LabNotes AS PreOpLab_CA199_Notes,

      CASE
      WHEN PreOpLab_HepatitisB.LabTestId IS NULL
      THEN NULL
      ELSE 'Yes'
      END AS PreOpLab_HepatitisBViralLoad,
      PreOpLab_HepatitisB.LabDateText AS PreOpLab_HepatitisBViralLoad_Date,
      PreOpLab_HepatitisB.LabResult AS PreOpLab_HepatitisBViralLoad_Result,
      PreOpLab_HepatitisB.LabNotes AS PreOpLab_HepatitisBViralLoad_Notes,

      (
      SELECT LabTest + COALESCE(' : ' + LabDateText,'') + COALESCE(' : ' + LabResult,'') + ', '
      FROM LabTests
      WHERE
      PatientId = Patients.PatientId
      AND
      (
      -- primary procedure and date exists
      (
      PrimaryProcedure.ProcedureId IS NOT NULL
      AND PrimaryProcedure.ProcDate IS NOT NULL
      AND LabDate <= PrimaryProcedure.ProcDate
      )
      OR
      -- primary procedure exists, but no date; see if lab and procedure were entered with same eform
      (
      PrimaryProcedure.ProcedureId IS NOT NULL
      AND PrimaryProcedure.ProcDate IS NULL
      AND LabDataSource LIKE '%eform%'
      AND PrimaryProcedure.ProcDataSource LIKE '%eform%'
      AND DATEPART(mm,EnteredTime) = DATEPART(mm,PrimaryProcedure.EnteredTime)
      AND DATEPART(dd,EnteredTime) = DATEPART(dd,PrimaryProcedure.EnteredTime)
      AND DATEPART(yyyy,EnteredTime) = DATEPART(yyyy,PrimaryProcedure.EnteredTime)
      )
      OR
      -- no primary procedure; just get most recent lab
      (
      PrimaryProcedure.ProcedureId IS NULL
      )
      )
      AND LabTestId != COALESCE(PreOpLab_Platelets.LabTestId,'')
      AND LabTestId != COALESCE(PreOpLab_AFP.LabTestId,'')
      AND LabTestId != COALESCE(PreOpLab_CEA.LabTestId,'')
      AND LabTestId != COALESCE(PreOpLab_CA199.LabTestId,'')
      AND LabTestId != COALESCE(PreOpLab_HepatitisB.LabTestId,'')
      FOR XML PATH('')
      ) AS PreOpLabs_Other,

      (
      SELECT LabTest + ' : ' + LabResult + ', '
      FROM LabTests noDateLabs
      WHERE PatientId = Patients.PatientId
      AND noDateLabs.LabDate IS NULL

      FOR XML PATH('')
      ) AS Labs_NoDateSpecified,


      -- LABS - Child-Pugh Score
      ChildPughScore.SurveyDateText AS ChildPugh_Date,
      ChildPughScore.SurveyTotal AS ChildPugh_TotalScore,
      ChildPughScore.SurveyResult AS ChildPugh_TotalPoints,
      (
      SELECT  + COALESCE('Result: ' + SurveyItemResult,'') + COALESCE(', Points: ' + SurveyItemTotal,'')
      FROM SurveyItems
      WHERE
      SurveyId = ChildPughScore.SurveyId
      AND SurveyItem = 'Total bilirubin'
      FOR XML PATH('')
      ) AS ChildPugh_Totalbilirubin,
      (
      SELECT  + COALESCE('Result: ' + SurveyItemResult,'') + COALESCE(', Points: ' + SurveyItemTotal,'')
      FROM SurveyItems
      WHERE
      SurveyId = ChildPughScore.SurveyId
      AND SurveyItem = 'Albumin'
      FOR XML PATH('')
      ) AS ChildPugh_Albumin,
      (
      SELECT  + COALESCE('Result: ' + SurveyItemResult,'') + COALESCE(', Points: ' + SurveyItemTotal,'')
      FROM SurveyItems
      WHERE
      SurveyId = ChildPughScore.SurveyId
      AND SurveyItem = 'INR'
      FOR XML PATH('')
      ) AS ChildPugh_INR,
      (
      SELECT  + COALESCE('Result: ' + SurveyItemResult,'') + COALESCE(', Points: ' + SurveyItemTotal,'')
      FROM SurveyItems
      WHERE
      SurveyId = ChildPughScore.SurveyId
      AND SurveyItem = 'Encephalopathy'
      FOR XML PATH('')
      ) AS ChildPugh_Encephalopathy,
      (
      SELECT  + COALESCE('Result: ' + SurveyItemResult,'') + COALESCE(', Points: ' + SurveyItemTotal,'')
      FROM SurveyItems
      WHERE
      SurveyId = ChildPughScore.SurveyId
      AND SurveyItem = 'Ascites'
      FOR XML PATH('')
      ) AS ChildPugh_Ascites,


      ChildPughScore.SurveyNotes AS ChildPugh_Notes,


      -- INTERVENTIONAL RADIOLOGY - TACE
      CASE
      WHEN InterventionalRad_TACE1.ProcedureId IS NULL
      AND InterventionalRad_TACE2.ProcedureId IS NULL
      AND InterventionalRad_TACE3.ProcedureId IS NULL
      THEN NULL
      ELSE 'Yes'
      END AS InterventionalRad_TACE,

      InterventionalRad_TACE1.ProcDateText AS TACE1_Date,
      InterventionalRad_TACE1.ProcSubsite AS TACE1_Location,
      InterventionalRad_TACE1.ProcNotes AS TACE1_Notes,

      InterventionalRad_TACE2.ProcDateText AS TACE2_Date,
      InterventionalRad_TACE2.ProcSubsite AS TACE2_Location,
      InterventionalRad_TACE2.ProcNotes AS TACE2_Notes,

      InterventionalRad_TACE3.ProcDateText AS TACE3_Date,
      InterventionalRad_TACE3.ProcSubsite AS TACE3_Location,
      InterventionalRad_TACE3.ProcNotes AS TACE3_Notes,

      (
      SELECT  COALESCE(ProcDateText,'') + COALESCE(' : ' + ProcSubsite,'') + ', '
      FROM Procedures
      WHERE PatientId = Patients.PatientId
      AND ProcName LIKE '%TACE%'
      AND ProcedureId != COALESCE(InterventionalRad_TACE1.ProcedureId,'')
      AND ProcedureId != COALESCE(InterventionalRad_TACE2.ProcedureId,'')
      AND ProcedureId != COALESCE(InterventionalRad_TACE3.ProcedureId,'')
      Order By ProcDate DESC
      FOR XML PATH('')
      ) AS TACE_Other,

      -- INTERVENTIONAL RADIOLOGY - PVE
      CASE
      WHEN InterventionalRad_PVE1.ProcedureId IS NULL
      AND InterventionalRad_PVE2.ProcedureId IS NULL
      AND InterventionalRad_PVE3.ProcedureId IS NULL
      THEN NULL
      ELSE 'Yes'
      END AS InterventionalRad_PVE,

      InterventionalRad_PVE1.ProcDateText AS PVE1_Date,
      InterventionalRad_PVE1.ProcSubsite AS PVE1_Location,
      InterventionalRad_PVE1.ProcNotes AS PVE1_Notes,

      InterventionalRad_PVE2.ProcDateText AS PVE2_Date,
      InterventionalRad_PVE2.ProcSubsite AS PVE2_Location,
      InterventionalRad_PVE2.ProcNotes AS PVE2_Notes,

      InterventionalRad_PVE3.ProcDateText AS PVE3_Date,
      InterventionalRad_PVE3.ProcSubsite AS PVE3_Location,
      InterventionalRad_PVE3.ProcNotes AS PVE3_Notes,

      (
      SELECT  COALESCE(ProcDateText,'') + COALESCE(' : ' + ProcSubsite,'') + ', '
      FROM Procedures
      WHERE PatientId = Patients.PatientId
      AND ProcName LIKE '%PVE%'
      AND ProcedureId != COALESCE(InterventionalRad_PVE1.ProcedureId,'')
      AND ProcedureId != COALESCE(InterventionalRad_PVE2.ProcedureId,'')
      AND ProcedureId != COALESCE(InterventionalRad_PVE3.ProcedureId,'')
      Order By ProcDate DESC
      FOR XML PATH('')
      ) AS PVE_Other,


      -- INTERVENTIONAL RADIOLOGY - RFA
      CASE
      WHEN InterventionalRad_RFA1.ProcedureId IS NULL
      AND InterventionalRad_RFA2.ProcedureId IS NULL
      AND InterventionalRad_RFA3.ProcedureId IS NULL
      THEN NULL
      ELSE 'Yes'
      END AS InterventionalRad_RFA,

      InterventionalRad_RFA1.ProcDateText AS RFA1_Date,
      InterventionalRad_RFA1.ProcSurgeon AS RFA1_Surgeon,
      InterventionalRad_RFA1.ProcSubsite AS RFA1_Location,
      InterventionalRad_RFA1.ProcApproach AS RFA1_ProcApproach,
      InterventionalRad_RFA1.ProcNotes AS RFA1_Notes,

      InterventionalRad_RFA2.ProcDateText AS RFA2_Date,
      InterventionalRad_RFA2.ProcSurgeon AS RFA2_Surgeon,
      InterventionalRad_RFA2.ProcSubsite AS RFA2_Location,
      InterventionalRad_RFA2.ProcApproach AS RFA2_ProcApproach,
      InterventionalRad_RFA2.ProcNotes AS RFA2_Notes,

      InterventionalRad_RFA3.ProcDateText AS RFA3_Date,
      InterventionalRad_RFA3.ProcSurgeon AS RFA3_Surgeon,
      InterventionalRad_RFA3.ProcSubsite AS RFA3_Location,
      InterventionalRad_RFA3.ProcApproach AS RFA3_ProcApproach,
      InterventionalRad_RFA3.ProcNotes AS RFA3_Notes,

      (
      SELECT  COALESCE(ProcDateText,'') + COALESCE(' : ' + ProcSurgeon,'') + COALESCE(' : ' + ProcSubsite,'') + COALESCE(' : ' + ProcApproach,'') + ', '
      FROM Procedures
      WHERE PatientId = Patients.PatientId
      AND ProcName LIKE '%RFA%'
      AND ProcedureId != COALESCE(InterventionalRad_RFA1.ProcedureId,'')
      AND ProcedureId != COALESCE(InterventionalRad_RFA2.ProcedureId,'')
      AND ProcedureId != COALESCE(InterventionalRad_RFA3.ProcedureId,'')
      Order By ProcDate DESC
      FOR XML PATH('')
      ) AS RFA_Other,

      -- Operative Detials - Operative Detail, Primary Procedure, Supplementary Procedures, Other Procedures
      CASE
      WHEN PrimaryProcedureAbsentEvent.AbsentEventId IS NULL
      AND PrimaryProcedure.ProcedureId IS NULL
      THEN NULL
      WHEN PrimaryProcedureAbsentEvent.AbsentEventId IS NOT NULL
      AND PrimaryProcedure.ProcedureId IS NULL
      THEN PrimaryProcedureAbsentEvent.AbsentReason
      ELSE PrimaryProcedure.ProcName
      END AS PrimaryProcedure,
      PrimaryProcedure.ProcDateText AS PrimaryProcedureDate,

      OperatingRoomDetails.OpCaseSurgeon AS PrimaryProcedureSurgeon,
      PrimaryProcedure.ProcApproach AS SurgicalApproach,
      OperatingRoomDetails.OpDuration AS OperatingTimeMinutes,
      OperatingRoomDetails.OpRBC_Transfused AS RBCTransfusedUnits,
      CASE
      WHEN CHARINDEX('Duration of Pringle (min): ',OperatingRoomDetails.OpPostOpSummary) != 0 THEN REPLACE (SUBSTRING(OperatingRoomDetails.OpPostOpSummary,CHARINDEX('Duration of Pringle (min): ',OperatingRoomDetails.OpPostOpSummary),CHARINDEX(' ||| ',OperatingRoomDetails.OpPostOpSummary,CHARINDEX('Duration of Pringle (min): ',OperatingRoomDetails.OpPostOpSummary)) - CHARINDEX('Duration of Pringle (min): ',OperatingRoomDetails.OpPostOpSummary)),'Duration of Pringle (min): ','')
      ELSE NULL
      END AS DurationOfPringleMinutes,

      PrimaryProcedure.ProcNotes AS PrimaryProcedureNotes,

      (
      SELECT ProcName + ', '
      FROM Procedures suppProcedures
      WHERE PatientId = Patients.PatientId
      AND suppProcedures.OperatingRoomDetailId = PrimaryProcedure.OperatingRoomDetailId
      AND suppProcedures.ProcedureId != COALESCE(PrimaryProcedure.ProcedureId,'')
      FOR XML PATH('')
      ) AS SupplementaryProcedures,

      (
      SELECT ProcName + ' : ' + ProcDateText + ', '
      FROM Procedures otherProcedures
      WHERE PatientId = Patients.PatientId
      AND otherProcedures.OperatingRoomDetailId != PrimaryProcedure.OperatingRoomDetailId
      AND otherProcedures.ProcedureId != COALESCE(PrimaryProcedure.ProcedureId,'')
      FOR XML PATH('')
      ) AS OtherOperations,



      -- POST-OP COURSE - Hospitalization
      Hospitalizations.HospDischargeDateText AS Hospital_DischargeDate,
      Hospitalizations.HospICUStay AS Hospital_ICUStayDays,
      CASE
      WHEN CHARINDEX('Length Of Stay (days): ',Hospitalizations.HospNotes) != 0 THEN REPLACE (SUBSTRING(Hospitalizations.HospNotes,CHARINDEX('Length Of Stay (days): ',Hospitalizations.HospNotes),CHARINDEX(' || ',Hospitalizations.HospNotes,CHARINDEX('Length Of Stay (days): ',Hospitalizations.HospNotes)) - CHARINDEX('Length Of Stay (days): ',Hospitalizations.HospNotes)),'Length Of Stay (days): ','')
      ELSE NULL
      END AS Hospital_LengthOfStayDays,
      Hospitalizations.HospInstitution AS Hospital,


      -- POST-OP COURSE - Post-Op Labs
      CASE
      WHEN PostOpLab_INR.LabTestId IS NULL
      THEN NULL
      ELSE 'Yes'
      END AS PostOpLab_PeakINR,
      PostOpLab_INR.LabDateText AS PostOpLab_PeakINR_Date,
      PostOpLab_INR.LabResult AS PostOpLab_PeakINR_Result,
      PostOpLab_INR.LabNotes AS PostOpLab_PeakINR_Notes,

      CASE
      WHEN PostOpLab_TotalBilirubin.LabTestId IS NULL
      THEN NULL
      ELSE 'Yes'
      END AS PostOpLab_PeakTotalBilirubin,
      PostOpLab_TotalBilirubin.LabDateText AS PostOpLab_PeakTotalBilirubin_Date,
      PostOpLab_TotalBilirubin.LabResult AS PostOpLab_PeakTotalBilirubin_Result,
      PostOpLab_TotalBilirubin.LabNotes AS PostOpLab_PeakTotalBilirubin_Notes,

      (
      SELECT LabTest + COALESCE(' : ' + LabDateText,'') + COALESCE(' : ' + LabResult,'') + ', '
      FROM LabTests
      WHERE
      PatientId = Patients.PatientId
      AND
      (
      -- primary procedure and date exists
      (
      PrimaryProcedure.ProcedureId IS NOT NULL
      AND PrimaryProcedure.ProcDate IS NOT NULL
      AND LabDate > PrimaryProcedure.ProcDate
      )
      OR
      -- primary procedure exists, but no date; see if lab and procedure were entered with same eform
      (
      PrimaryProcedure.ProcedureId IS NOT NULL
      AND PrimaryProcedure.ProcDate IS NULL
      AND LabDataSource LIKE '%eform%'
      AND PrimaryProcedure.ProcDataSource LIKE '%eform%'
      AND DATEPART(mm,EnteredTime) = DATEPART(mm,PrimaryProcedure.EnteredTime)
      AND DATEPART(dd,EnteredTime) = DATEPART(dd,PrimaryProcedure.EnteredTime)
      AND DATEPART(yyyy,EnteredTime) = DATEPART(yyyy,PrimaryProcedure.EnteredTime)
      )
      OR
      -- no primary procedure; just get most recent lab
      (
      PrimaryProcedure.ProcedureId IS NULL
      )
      )
      AND LabTestId != COALESCE(PostOpLab_INR.LabTestId,'')
      AND LabTestId != COALESCE(PostOpLab_TotalBilirubin.LabTestId,'')
      FOR XML PATH('')
      ) AS PostOpLabs_Other,

      (
      SELECT LabTest + ' : ' + LabResult + ', '
      FROM LabTests noDateLabs
      WHERE PatientId = Patients.PatientId
      AND noDateLabs.LabDate IS NULL

      FOR XML PATH('')
      ) AS Labs_NoDateSpecified,



      -- POST-OP COURSE - Post-Op Complications
      CASE
      WHEN PostOpComplications1.ToxicityId IS NOT NULL THEN PostOpComplications1.ToxName
      ELSE NULL
      END AS PostOpComplications1,
      PostOpComplications1.ToxDateText AS PostOpComplications1_Date,
      PostOpComplications1.ToxNotes AS PostOpComplications1_Notes,

      CASE
      WHEN PostOpComplications2.ToxicityId IS NOT NULL THEN PostOpComplications2.ToxName
      ELSE NULL
      END AS PostOpComplications2,
      PostOpComplications2.ToxDateText AS PostOpComplications2_Date,
      PostOpComplications2.ToxNotes AS PostOpComplications2_Notes,

      CASE
      WHEN PostOpComplications3.ToxicityId IS NOT NULL THEN PostOpComplications3.ToxName
      ELSE NULL
      END AS PostOpComplications3,
      PostOpComplications3.ToxDateText AS PostOpComplications3_Date,
      PostOpComplications3.ToxNotes AS PostOpComplications3_Notes,

      (
      SELECT ToxName + ', '
      FROM Toxicities
      WHERE PatientId = Patients.PatientId
      AND ToxDate > PrimaryProcedure.ProcDate
      AND ToxicityId != COALESCE(PostOpComplications1.ToxicityId,'')
      AND ToxicityId != COALESCE(PostOpComplications2.ToxicityId,'')
      AND ToxicityId != COALESCE(PostOpComplications3.ToxicityId,'')
      FOR XML PATH('')
      ) AS  PostOpComplications_Other,
      (
      SELECT ToxName + ', '
      FROM Toxicities
      WHERE PatientId = Patients.PatientId
      AND ToxDate IS NULL
      FOR XML PATH('')
      ) AS Complications_NoDateSpecified,


      -- PATHOLOGY - Pathology Report
      CASE
      WHEN PathologyAbsentEvent.AbsentEventId IS NULL
      AND Pathology.PathologyId IS NULL
      THEN NULL
      WHEN PathologyAbsentEvent.AbsentEventId IS NOT NULL
      AND Pathology.PathologyId IS NULL
      THEN PathologyAbsentEvent.AbsentReason
      ELSE 'Yes'
      END AS PathologyReport,

      Pathology.PathDateText AS PathReportDate,
      Pathology.PathNum AS PathNum,
      Pathology.PathHistology AS PathTumorHistology,

      LiverPath.PathVascularInv AS PathVascularInv,
      LiverPath.PathMargin AS PathMargin,
      LiverPath.PathClosestMarginDistance AS PathClosestMargin,
      LiverPath.PathTumorMaxDim AS SizeOfLargestTumor,
      LiverPath.PathNumTotalTumors AS NumOfTumors,

      Pathology.PathNotes AS PathReportNotes,

      -- POST-OP TREATEMENT - Medcial Therapies
      CASE
      WHEN PostOpMedTx_Sorafenib.MedicalTherapyId IS NULL THEN NULL
      ELSE 'Yes'
      END AS PostOpMedTx_Sorafenib,
      PostOpMedTx_Sorafenib.MedTxDateText AS PostOpMedTx_Sorafenib_StartDate,
      PostOpMedTx_Sorafenib.MedTxStopDateText AS PostOpMedTx_Sorafenib_StopDate,
      COALESCE(PostOpMedTx_Sorafenib.MedTxDose,'') + COALESCE(' ' + PostOpMedTx_Sorafenib.MedTxUnits,'') AS PostOpMedTx_Sorafenib_Dose,
      PostOpMedTx_Sorafenib.MedTxNotes AS PostOpMedTx_Sorafenib_Notes,

      (
      SELECT MedTxType + COALESCE(' : ' + MedTxDateText,'') + COALESCE(' until ' + MedTxStopDateText,'') + COALESCE(' : ' + MedTxDose,'') + COALESCE(' ' + MedTxUnits,'') + ', '
      FROM MedicalTherapy
      WHERE
      PatientId = Patients.PatientId
      AND MedicalTherapy.MedTxType NOT LIKE 'Anti%viral%History'
      AND
      (
      -- primary procedure and date exists
      (
      PrimaryProcedure.ProcedureId IS NOT NULL
      AND PrimaryProcedure.ProcDate IS NOT NULL
      AND MedTxDate > PrimaryProcedure.ProcDate
      )
      OR
      -- primary procedure exists, but no date; see if lab and procedure were entered with same eform
      (
      PrimaryProcedure.ProcedureId IS NOT NULL
      AND PrimaryProcedure.ProcDate IS NULL
      AND MedTxDataSource LIKE '%eform%'
      AND PrimaryProcedure.ProcDataSource LIKE '%eform%'
      AND DATEPART(mm,EnteredTime) = DATEPART(mm,PrimaryProcedure.EnteredTime)
      AND DATEPART(dd,EnteredTime) = DATEPART(dd,PrimaryProcedure.EnteredTime)
      AND DATEPART(yyyy,EnteredTime) = DATEPART(yyyy,PrimaryProcedure.EnteredTime)
      )
      OR
      -- no primary procedure; just get most recent lab
      (
      PrimaryProcedure.ProcedureId IS NULL
      )
      )
      AND MedicalTherapyId != COALESCE(PostOpMedTx_Sorafenib.MedicalTherapyId,'')
      FOR XML PATH('')
      ) AS PostOpMedTx_Other,

      (
      SELECT MedTxType + COALESCE(' : ' + MedTxDateText,'') + COALESCE(' until ' + MedTxStopDateText,'') + COALESCE(' : ' + MedTxDose,'') + COALESCE(' ' + MedTxUnits,'') + ', '
      FROM MedicalTherapy noDateMedTx
      WHERE PatientId = Patients.PatientId
      AND noDateMedTx.MedTxDate IS NULL
      AND noDateMedTx.MedTxType NOT LIKE 'Anti%viral%History'
      AND MedicalTherapyId != COALESCE(PostOpMedTx_Sorafenib.MedicalTherapyId,'')
      FOR XML PATH('')
      ) AS PostOpMedTx_NoDateSpecified,

      -- POST-OP TREATEMENT - Radiation Therapies
      PostOpRadTx_1.RadTxType AS PostOpRadTx_Type_1,
      PostOpRadTx_1.RadTxDateText AS PostOpRadTx_Date_1,
      PostOpRadTx_1.RadTxTarget AS PostOpRadTx_Target_1,
      PostOpRadTx_1.RadTxTotalDose AS PostOpRadTx_TotalDose_1,
      PostOpRadTx_1.RadTxInstitution AS PostOpRadTx_Institution_1,
      PostOpRadTx_1.RadTxNotes AS PostOpRadTx_Notes_1,

      PostOpRadTx_2.RadTxType AS PostOpRadTx_Type_2,
      PostOpRadTx_2.RadTxDateText AS PostOpRadTx_Date_2,
      PostOpRadTx_2.RadTxTarget AS PostOpRadTx_Target_2,
      PostOpRadTx_2.RadTxTotalDose AS PostOpRadTx_TotalDose_2,
      PostOpRadTx_2.RadTxInstitution AS PostOpRadTx_Institution_2,
      PostOpRadTx_2.RadTxNotes AS PostOpRadTx_Notes_2,

      PostOpRadTx_3.RadTxType AS PostOpRadTx_Type_3,
      PostOpRadTx_3.RadTxDateText AS PostOpRadTx_Date_3,
      PostOpRadTx_3.RadTxTarget AS PostOpRadTx_Target_3,
      PostOpRadTx_3.RadTxTotalDose AS PostOpRadTx_TotalDose_3,
      PostOpRadTx_3.RadTxInstitution AS PostOpRadTx_Institution_3,
      PostOpRadTx_3.RadTxNotes AS PostOpRadTx_Notes_3,

      (
      SELECT RadTxType + COALESCE(' : ' + RadTxDateText,'')  + COALESCE(' : ' + RadTxTarget,'') + COALESCE(' : ' + RadTxTotalDose,'') + ', '
      FROM RadiationTherapy
      WHERE
      PatientId = Patients.PatientId
      AND
      (
      -- primary procedure and date exists
      (
      PrimaryProcedure.ProcedureId IS NOT NULL
      AND PrimaryProcedure.ProcDate IS NOT NULL
      AND RadTxDate > PrimaryProcedure.ProcDate
      )
      OR
      -- primary procedure exists, but no date; see if lab and procedure were entered with same eform
      (
      PrimaryProcedure.ProcedureId IS NOT NULL
      AND PrimaryProcedure.ProcDate IS NULL
      AND RadTxDataSource LIKE '%eform%'
      AND PrimaryProcedure.ProcDataSource LIKE '%eform%'
      AND DATEPART(mm,EnteredTime) = DATEPART(mm,PrimaryProcedure.EnteredTime)
      AND DATEPART(dd,EnteredTime) = DATEPART(dd,PrimaryProcedure.EnteredTime)
      AND DATEPART(yyyy,EnteredTime) = DATEPART(yyyy,PrimaryProcedure.EnteredTime)
      )
      OR
      -- no primary procedure; just get most recent lab
      (
      PrimaryProcedure.ProcedureId IS NULL
      )
      )
      AND RadiationTherapyId != COALESCE(PostOpRadTx_1.RadiationTherapyId,'')
      AND RadiationTherapyId != COALESCE(PostOpRadTx_2.RadiationTherapyId,'')
      AND RadiationTherapyId != COALESCE(PostOpRadTx_3.RadiationTherapyId,'')
      FOR XML PATH('')
      ) AS PostOpRadTx_Other,


      (
      SELECT RadTxType + COALESCE(' : ' + RadTxDateText,'')  + COALESCE(' : ' + RadTxTarget,'') + COALESCE(' : ' + RadTxTotalDose,'') + ', '
      FROM RadiationTherapy noDateMedTx
      WHERE PatientId = Patients.PatientId
      AND noDateMedTx.RadTxDate IS NULL
      AND RadiationTherapyId != COALESCE(PostOpRadTx_1.RadiationTherapyId,'')
      AND RadiationTherapyId != COALESCE(PostOpRadTx_2.RadiationTherapyId,'')
      AND RadiationTherapyId != COALESCE(PostOpRadTx_3.RadiationTherapyId,'')
      FOR XML PATH('')
      ) AS PostOpRadTx_NoDateSpecified,


      -- OUTCOMES - Contact Status
      LastContactStatus.StatusDateText AS LastContact_Date,
      LastContactStatus.Status AS LastContact_Status,
      LastContactStatus.StatusNotes AS LastContact_Notes,

      -- OUTCOMES - Recurrence Status
      RecurrenceStatus.StatusDateText AS RecurrenceDate,
      CASE
      WHEN CHARINDEX('Recurrence detected by: ',RecurrenceStatus.StatusNotes) != 0
      THEN REPLACE (SUBSTRING(RecurrenceStatus.StatusNotes,CHARINDEX('Recurrence detected by: ',RecurrenceStatus.StatusNotes),CHARINDEX(' ||',RecurrenceStatus.StatusNotes,CHARINDEX('Recurrence detected by: ',RecurrenceStatus.StatusNotes)) - CHARINDEX('Recurrence detected by: ',RecurrenceStatus.StatusNotes)),'Recurrence detected by: ','')
      ELSE NULL
      END AS RecurrenceDetectedBy,
      CASE
      WHEN CHARINDEX('Location of first recurrence: ',RecurrenceStatus.StatusNotes) != 0
      THEN REPLACE (SUBSTRING(RecurrenceStatus.StatusNotes,CHARINDEX('Location of first recurrence: ',RecurrenceStatus.StatusNotes),CHARINDEX(' ||',RecurrenceStatus.StatusNotes,CHARINDEX('Location of first recurrence: ',RecurrenceStatus.StatusNotes)) - CHARINDEX('Location of first recurrence: ',RecurrenceStatus.StatusNotes)),'Location of first recurrence: ','')
      ELSE NULL
      END AS LocationOfFirstRecurrence,

      -- OUTCOMES - Patient Death
      Patients.PtDeathDateText AS DeathDate,
      Patients.PtDeathCause AS CauseOfDeath,
      Patients.PtDeathType AS DeathType


      FROM
      Patients

      -- residency status pivit
      LEFT OUTER JOIN SurveyItems ResidencyStatusLegalResident
      ON ResidencyStatusLegalResident.SurveyItemId =
      (
      SELECT TOP 1 SurveyItemId
      FROM SurveyItems
      LEFT JOIN Surveys ON Surveys.SurveyId = SurveyItems.SurveyId
      WHERE PatientId = Patients.PatientId
      AND SurveyType = 'Residency Status'
      AND SurveyItem = 'Legal Resident of US'
      ORDER BY SurveyItems.UpdatedTime, SurveyItems.EnteredTime DESC
      )

      LEFT OUTER JOIN SurveyItems ResidencyStatusYearImmigrated
      ON ResidencyStatusYearImmigrated.SurveyItemId =
      (
      SELECT TOP 1 SurveyItemId
      FROM SurveyItems
      LEFT JOIN Surveys ON Surveys.SurveyId = SurveyItems.SurveyId
      WHERE PatientId = Patients.PatientId
      AND SurveyType = 'Residency Status'
      AND SurveyItem = 'Year Immigrated to US'
      ORDER BY SurveyItems.UpdatedTime, SurveyItems.EnteredTime DESC
      )

      -- date of diganosis pivit
      LEFT OUTER JOIN Status DiagnosisDate
      ON DiagnosisDate.StatusId =
      (
      SELECT TOP 1 StatusId
      FROM Status
      WHERE PatientId = Patients.PatientId
      AND Status = 'Diagnosis Date'
      ORDER BY StatusDate DESC
      )


      -- drive dates with the most recent primary procedure
      LEFT OUTER JOIN Procedures PrimaryProcedure
      ON Patients.PatientId = PrimaryProcedure.PatientId
      AND PrimaryProcedure.ProcedureId =
      (
      SELECT TOP 1 ProcedureId
      FROM Procedures
      WHERE PatientId = Patients.PatientId
      AND Procedures.ProcPrimary = 'True'
      ORDER BY ProcDate DESC
      )

      -- sugery details (primary procedure) absent event test pivot;
      LEFT OUTER JOIN AbsentEvents PrimaryProcedureAbsentEvent
      ON Patients.PatientId = PrimaryProcedureAbsentEvent.PatientId
      AND PrimaryProcedureAbsentEvent.AbsentEventId =
      (
      SELECT TOP 1 AbsentEvents.AbsentEventId FROM AbsentEvents
      WHERE AbsentEvents.PatientId = Patients.PatientId
      AND AbsentEvents.FieldValue LIKE '%Surgery%Detail%'
      ORDER BY AbsentEvents.AbsentDate DESC, AbsentEvents.UpdatedTime DESC, AbsentEvents.EnteredTime
      )

      -- the "operation" should be that related to the primary procedure
      LEFT OUTER JOIN OperatingRoomDetails
      ON Patients.PatientId = OperatingRoomDetails.PatientId
      AND PrimaryProcedure.OperatingRoomDetailId =
      OperatingRoomDetails.OperatingRoomDetailId


      -- encounter pivit; either get encounter closest to primary procedure, or the most recent encounter in general
      LEFT OUTER JOIN Encounters Encounter
      ON Patients.PatientId = Encounter.PatientId
      AND Encounter.EncounterId =
      (
      SELECT TOP 1 EncounterId
      FROM Encounters
      WHERE
      PatientId = Patients.PatientId
      AND
      (
      -- primary procedure and date exists
      (
      PrimaryProcedure.ProcedureId IS NOT NULL
      AND PrimaryProcedure.ProcDate IS NOT NULL
      AND EncDate <= PrimaryProcedure.ProcDate
      )
      OR
      -- primary procedure exists, but no date; see if encounter and procedure were entered with same eform
      (
      PrimaryProcedure.ProcedureId IS NOT NULL
      AND PrimaryProcedure.ProcDate IS NULL
      AND EncDataSource LIKE '%eform%'
      AND PrimaryProcedure.ProcDataSource LIKE '%eform%'
      AND DATEPART(mm,EnteredTime) = DATEPART(mm,PrimaryProcedure.EnteredTime)
      AND DATEPART(dd,EnteredTime) = DATEPART(dd,PrimaryProcedure.EnteredTime)
      AND DATEPART(yyyy,EnteredTime) = DATEPART(yyyy,PrimaryProcedure.EnteredTime)
      )
      OR
      -- no primary procedure; just get most recent encounter
      (
      PrimaryProcedure.ProcedureId IS NULL
      )

      )

      ORDER BY EncDate DESC
      )


      -- comorbidities absent event test pivot;
      LEFT OUTER JOIN AbsentEvents UnderlyingLiverDiseaseAbsentEvent
      ON Patients.PatientId = UnderlyingLiverDiseaseAbsentEvent.PatientId
      AND UnderlyingLiverDiseaseAbsentEvent.AbsentEventId =
      (
      SELECT TOP 1 AbsentEvents.AbsentEventId FROM AbsentEvents
      WHERE AbsentEvents.PatientId = Patients.PatientId
      AND AbsentEvents.FieldValue LIKE '%Underlying%Liver%Disease%'
      ORDER BY AbsentEvents.AbsentDate DESC, AbsentEvents.UpdatedTime DESC, AbsentEvents.EnteredTime
      )

      -- any comorbidities test pivot;
      LEFT OUTER JOIN Comorbidities ComorbiditiesAny
      ON Patients.PatientId = ComorbiditiesAny.PatientId
      AND ComorbiditiesAny.ComorbidityId =
      (
      SELECT TOP 1 ComorbidityId FROM Comorbidities
      WHERE Comorbidities.PatientId = Patients.PatientId
      ORDER BY ComorbDate DESC
      )

      -- comorbidity pivots
      -- Hepatitis B
      LEFT OUTER JOIN Comorbidities Comorb_HepatitisB
      ON Patients.PatientId = Comorb_HepatitisB.PatientId
      AND Comorb_HepatitisB.ComorbidityId =
      (
      SELECT TOP 1 ComorbidityId FROM Comorbidities
      WHERE Comorbidities.PatientId = Patients.PatientId
      AND Comorbidities.Comorbidity LIKE '%Hepatitis%B%'
      ORDER BY ComorbDate DESC
      )

      -- Hepatitis C
      LEFT OUTER JOIN Comorbidities Comorb_HepatitisC
      ON Patients.PatientId = Comorb_HepatitisC.PatientId
      AND Comorb_HepatitisC.ComorbidityId =
      (
      SELECT TOP 1 ComorbidityId FROM Comorbidities
      WHERE Comorbidities.PatientId = Patients.PatientId
      AND Comorbidities.Comorbidity LIKE '%Hepatitis%C%'
      ORDER BY ComorbDate DESC
      )

      -- EtOH Cirrhosis
      LEFT OUTER JOIN Comorbidities Comorb_EtOH
      ON Patients.PatientId = Comorb_EtOH.PatientId
      AND Comorb_EtOH.ComorbidityId =
      (
      SELECT TOP 1 ComorbidityId FROM Comorbidities
      WHERE Comorbidities.PatientId = Patients.PatientId
      AND Comorbidities.Comorbidity LIKE '%EtOH%Cirrhosis%'
      ORDER BY ComorbDate DESC
      )

      -- HIV
      LEFT OUTER JOIN Comorbidities Comorb_HIV
      ON Patients.PatientId = Comorb_HIV.PatientId
      AND Comorb_HIV.ComorbidityId =
      (
      SELECT TOP 1 ComorbidityId FROM Comorbidities
      WHERE Comorbidities.PatientId = Patients.PatientId
      AND Comorbidities.Comorbidity LIKE '%HIV%'
      ORDER BY ComorbDate DESC
      )

      -- Diabetes
      LEFT OUTER JOIN Comorbidities Comorb_Diabetes
      ON Patients.PatientId = Comorb_Diabetes.PatientId
      AND Comorb_Diabetes.ComorbidityId =
      (
      SELECT TOP 1 ComorbidityId FROM Comorbidities
      WHERE Comorbidities.PatientId = Patients.PatientId
      AND Comorbidities.Comorbidity LIKE 'Diabetes'
      ORDER BY ComorbDate DESC
      )

      -- anti-viral therapy absent event test pivot;
      LEFT OUTER JOIN AbsentEvents AntiviralTherapyAbsentEvent
      ON Patients.PatientId = AntiviralTherapyAbsentEvent.PatientId
      AND AntiviralTherapyAbsentEvent.AbsentEventId =
      (
      SELECT TOP 1 AbsentEvents.AbsentEventId FROM AbsentEvents
      WHERE AbsentEvents.PatientId = Patients.PatientId
      AND AbsentEvents.FieldValue LIKE '%Anti%viral%History%'
      ORDER BY AbsentEvents.AbsentDate DESC, AbsentEvents.UpdatedTime DESC, AbsentEvents.EnteredTime
      )

      -- anti-viral therapy test pivot
      LEFT OUTER JOIN MedicalTherapy AntiviralTherapy
      ON Patients.PatientId = AntiviralTherapy.PatientId
      AND AntiviralTherapy.MedicalTherapyId =
      (
      SELECT TOP 1 MedicalTherapyId FROM MedicalTherapy
      WHERE MedicalTherapy.PatientId = Patients.PatientId
      AND MedicalTherapy.MedTxType LIKE 'Anti%viral%History'
      ORDER BY MedTxDate DESC
      )

      -- social history test pivot
      LEFT OUTER JOIN SocialHistories
      ON Patients.PatientId = SocialHistories.PatientId

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

      -- family history diagnosis test pivot; find any diagnosis family hx for this patient
      LEFT OUTER JOIN FamilyMembers FamHistoryDiagnosis
      ON Patients.PatientId = FamHistoryDiagnosis.PatientId
      AND FamHistoryDiagnosis.FamilyMemberId =
      (
      SELECT TOP 1 FamilyMembers.FamilyMemberId FROM FamilyMembers
      INNER JOIN
      (SELECT FamilyMembers.*
      FROM FamilyMembers
      LEFT JOIN FamilyMemberDiagnosis ON FamilyMemberDiagnosis.FamilyMemberId = FamilyMembers.FamilyMemberId
      WHERE FamilyMembers.PatientId = Patients.PatientId
      AND FamilyMemberDiagnosis.FamMemDiagnosis IS NOT NULL

      ) ptFamHxDiagnosis ON ptFamHxDiagnosis.FamilyMemberId = FamilyMembers.FamilyMemberId
      ORDER BY FamilyMembers.FamilyMemberId
      )

      -- imaging absent event test pivot;
      LEFT OUTER JOIN AbsentEvents ImagingAbsentEvent
      ON Patients.PatientId = ImagingAbsentEvent.PatientId
      AND ImagingAbsentEvent.AbsentEventId =
      (
      SELECT TOP 1 AbsentEvents.AbsentEventId FROM AbsentEvents
      WHERE AbsentEvents.PatientId = Patients.PatientId
      AND AbsentEvents.FieldValue LIKE '%Imaging%'
      ORDER BY AbsentEvents.AbsentDate DESC, AbsentEvents.UpdatedTime DESC, AbsentEvents.EnteredTime
      )

      -- any imaging test pivot;
      LEFT OUTER JOIN Diagnostics ImagingAny
      ON Patients.PatientId = ImagingAny.PatientId
      AND ImagingAny.DiagnosticId =
      (
      SELECT TOP 1 DiagnosticId FROM Diagnostics
      WHERE Diagnostics.PatientId = Patients.PatientId
      ORDER BY DxDate DESC
      )

      -- imaging CT Scan test pivot
      LEFT OUTER JOIN Diagnostics ImagingCTScan
      ON Patients.PatientId = ImagingCTScan.PatientId
      AND ImagingCTScan.DiagnosticId =
      (
      SELECT TOP 1 ptDx.DiagnosticId FROM Diagnostics
      INNER JOIN
      (SELECT Diagnostics.*
      FROM Diagnostics
      LEFT JOIN DxImageFindings ON DxImageFindings.DiagnosticId = Diagnostics.DiagnosticId
      LEFT JOIN Patients pt ON pt.PatientId = Diagnostics.Patientid
      WHERE Diagnostics.PatientId = Patients.PatientId
      AND Diagnostics.DxType LIKE '%ct%scan%'
      ) ptDx ON ptDx.DiagnosticId = Diagnostics.DiagnosticId
      WHERE 	-- primary procedure and date exists
      (
      PrimaryProcedure.ProcedureId IS NOT NULL
      AND PrimaryProcedure.ProcDate IS NOT NULL
      AND ptDx.DxDate <= PrimaryProcedure.ProcDate
      )
      OR
      -- primary procedure exists, but no date; see if imaging and procedure were entered with same eform
      (
      PrimaryProcedure.ProcedureId IS NOT NULL
      AND PrimaryProcedure.ProcDate IS NULL
      AND ptDx.DxDataSource LIKE '%eform%'
      AND PrimaryProcedure.ProcDataSource LIKE '%eform%'
      AND DATEPART(mm,ptDx.EnteredTime) = DATEPART(mm,PrimaryProcedure.EnteredTime)
      AND DATEPART(dd,ptDx.EnteredTime) = DATEPART(dd,PrimaryProcedure.EnteredTime)
      AND DATEPART(yyyy,ptDx.EnteredTime) = DATEPART(yyyy,PrimaryProcedure.EnteredTime)
      )
      OR
      -- no primary procedure; just get most recent ct scan
      (
      PrimaryProcedure.ProcedureId IS NULL
      )

      ORDER BY ptDx.DxDate DESC
      )

      -- imaging MRI Scan test pivot
      LEFT OUTER JOIN Diagnostics ImagingMRI
      ON Patients.PatientId = ImagingMRI.PatientId
      AND ImagingMRI.DiagnosticId =
      (
      SELECT TOP 1 ptDx.DiagnosticId FROM Diagnostics
      INNER JOIN
      (SELECT Diagnostics.*
      FROM Diagnostics
      LEFT JOIN DxImageFindings ON DxImageFindings.DiagnosticId = Diagnostics.DiagnosticId
      LEFT JOIN Patients pt ON pt.PatientId = Diagnostics.Patientid
      WHERE Diagnostics.PatientId = Patients.PatientId
      AND Diagnostics.DxType LIKE '%mri%'
      ) ptDx ON ptDx.DiagnosticId = Diagnostics.DiagnosticId
      WHERE 	-- primary procedure and date exists
      (
      PrimaryProcedure.ProcedureId IS NOT NULL
      AND PrimaryProcedure.ProcDate IS NOT NULL
      AND ptDx.DxDate <= PrimaryProcedure.ProcDate
      )
      OR
      -- primary procedure exists, but no date; see if imaging and procedure were entered with same eform
      (
      PrimaryProcedure.ProcedureId IS NOT NULL
      AND PrimaryProcedure.ProcDate IS NULL
      AND ptDx.DxDataSource LIKE '%eform%'
      AND PrimaryProcedure.ProcDataSource LIKE '%eform%'
      AND DATEPART(mm,ptDx.EnteredTime) = DATEPART(mm,PrimaryProcedure.EnteredTime)
      AND DATEPART(dd,ptDx.EnteredTime) = DATEPART(dd,PrimaryProcedure.EnteredTime)
      AND DATEPART(yyyy,ptDx.EnteredTime) = DATEPART(yyyy,PrimaryProcedure.EnteredTime)
      )
      OR
      -- no primary procedure; just get most recent mri scan
      (
      PrimaryProcedure.ProcedureId IS NULL
      )
      ORDER BY ptDx.DxDate DESC
      )

      -- additional imaging test pivots
      LEFT OUTER JOIN Diagnostics ImagingOther_1
      ON Patients.PatientId = ImagingOther_1.PatientId
      AND ImagingOther_1.DiagnosticId =
      (
      SELECT TOP 5 ptDx.DiagnosticId FROM Diagnostics
      INNER JOIN
      (SELECT ROW_NUMBER() OVER(ORDER BY DxDate DESC) OrdinalRow, Diagnostics.*
      FROM Diagnostics
      --LEFT JOIN DxImageFindings ON DxImageFindings.DiagnosticId = Diagnostics.DiagnosticId
      LEFT JOIN Patients pt ON pt.PatientId = Diagnostics.Patientid
      WHERE Diagnostics.PatientId = Patients.PatientId
      AND Diagnostics.DiagnosticId != ImagingCTScan.DiagnosticId
      AND Diagnostics.DiagnosticId != ImagingMRI.DiagnosticId
      ) ptDx ON ptDx.DiagnosticId = Diagnostics.DiagnosticId
      WHERE ptDx.OrdinalRow = 1
      AND
      (
      (
      PrimaryProcedure.ProcedureId IS NOT NULL
      AND PrimaryProcedure.ProcDate IS NOT NULL
      AND ptDx.DxDate <= PrimaryProcedure.ProcDate
      )
      OR
      -- primary procedure exists, but no date; see if imaging and procedure were entered with same eform
      (
      PrimaryProcedure.ProcedureId IS NOT NULL
      AND PrimaryProcedure.ProcDate IS NULL
      AND ptDx.DxDataSource LIKE '%eform%'
      AND PrimaryProcedure.ProcDataSource LIKE '%eform%'
      AND DATEPART(mm,ptDx.EnteredTime) = DATEPART(mm,PrimaryProcedure.EnteredTime)
      AND DATEPART(dd,ptDx.EnteredTime) = DATEPART(dd,PrimaryProcedure.EnteredTime)
      AND DATEPART(yyyy,ptDx.EnteredTime) = DATEPART(yyyy,PrimaryProcedure.EnteredTime)
      )
      OR
      -- no primary procedure; just scan
      (
      PrimaryProcedure.ProcedureId IS NULL
      )
      )
      ORDER BY ptDx.DxDate DESC
      )

      LEFT OUTER JOIN Diagnostics ImagingOther_2
      ON Patients.PatientId = ImagingOther_2.PatientId
      AND ImagingOther_2.DiagnosticId =
      (
      SELECT TOP 5 ptDx.DiagnosticId FROM Diagnostics
      INNER JOIN
      (SELECT ROW_NUMBER() OVER(ORDER BY DxDate DESC) OrdinalRow, Diagnostics.*
      FROM Diagnostics
      --LEFT JOIN DxImageFindings ON DxImageFindings.DiagnosticId = Diagnostics.DiagnosticId
      LEFT JOIN Patients pt ON pt.PatientId = Diagnostics.Patientid
      WHERE Diagnostics.PatientId = Patients.PatientId
      AND Diagnostics.DiagnosticId != ImagingCTScan.DiagnosticId
      AND Diagnostics.DiagnosticId != ImagingMRI.DiagnosticId
      ) ptDx ON ptDx.DiagnosticId = Diagnostics.DiagnosticId
      WHERE ptDx.OrdinalRow = 2
      AND
      (
      (
      PrimaryProcedure.ProcedureId IS NOT NULL
      AND PrimaryProcedure.ProcDate IS NOT NULL
      AND ptDx.DxDate <= PrimaryProcedure.ProcDate
      )
      OR
      -- primary procedure exists, but no date; see if imaging and procedure were entered with same eform
      (
      PrimaryProcedure.ProcedureId IS NOT NULL
      AND PrimaryProcedure.ProcDate IS NULL
      AND ptDx.DxDataSource LIKE '%eform%'
      AND PrimaryProcedure.ProcDataSource LIKE '%eform%'
      AND DATEPART(mm,ptDx.EnteredTime) = DATEPART(mm,PrimaryProcedure.EnteredTime)
      AND DATEPART(dd,ptDx.EnteredTime) = DATEPART(dd,PrimaryProcedure.EnteredTime)
      AND DATEPART(yyyy,ptDx.EnteredTime) = DATEPART(yyyy,PrimaryProcedure.EnteredTime)
      )
      OR
      -- no primary procedure; just scan
      (
      PrimaryProcedure.ProcedureId IS NULL
      )
      )
      ORDER BY ptDx.DxDate DESC
      )

      LEFT OUTER JOIN Diagnostics ImagingOther_3
      ON Patients.PatientId = ImagingOther_3.PatientId
      AND ImagingOther_3.DiagnosticId =
      (
      SELECT TOP 5 ptDx.DiagnosticId FROM Diagnostics
      INNER JOIN
      (SELECT ROW_NUMBER() OVER(ORDER BY DxDate DESC) OrdinalRow, Diagnostics.*
      FROM Diagnostics
      --LEFT JOIN DxImageFindings ON DxImageFindings.DiagnosticId = Diagnostics.DiagnosticId
      LEFT JOIN Patients pt ON pt.PatientId = Diagnostics.Patientid
      WHERE Diagnostics.PatientId = Patients.PatientId
      AND Diagnostics.DiagnosticId != ImagingCTScan.DiagnosticId
      AND Diagnostics.DiagnosticId != ImagingMRI.DiagnosticId
      ) ptDx ON ptDx.DiagnosticId = Diagnostics.DiagnosticId
      WHERE ptDx.OrdinalRow = 3
      AND
      (
      (
      PrimaryProcedure.ProcedureId IS NOT NULL
      AND PrimaryProcedure.ProcDate IS NOT NULL
      AND ptDx.DxDate <= PrimaryProcedure.ProcDate
      )
      OR
      -- primary procedure exists, but no date; see if imaging and procedure were entered with same eform
      (
      PrimaryProcedure.ProcedureId IS NOT NULL
      AND PrimaryProcedure.ProcDate IS NULL
      AND ptDx.DxDataSource LIKE '%eform%'
      AND PrimaryProcedure.ProcDataSource LIKE '%eform%'
      AND DATEPART(mm,ptDx.EnteredTime) = DATEPART(mm,PrimaryProcedure.EnteredTime)
      AND DATEPART(dd,ptDx.EnteredTime) = DATEPART(dd,PrimaryProcedure.EnteredTime)
      AND DATEPART(yyyy,ptDx.EnteredTime) = DATEPART(yyyy,PrimaryProcedure.EnteredTime)
      )
      OR
      -- no primary procedure; just scan
      (
      PrimaryProcedure.ProcedureId IS NULL
      )
      )
      ORDER BY ptDx.DxDate DESC
      )

      LEFT OUTER JOIN Diagnostics ImagingOther_4
      ON Patients.PatientId = ImagingOther_4.PatientId
      AND ImagingOther_4.DiagnosticId =
      (
      SELECT TOP 5 ptDx.DiagnosticId FROM Diagnostics
      INNER JOIN
      (SELECT ROW_NUMBER() OVER(ORDER BY DxDate DESC) OrdinalRow, Diagnostics.*
      FROM Diagnostics
      --LEFT JOIN DxImageFindings ON DxImageFindings.DiagnosticId = Diagnostics.DiagnosticId
      LEFT JOIN Patients pt ON pt.PatientId = Diagnostics.Patientid
      WHERE Diagnostics.PatientId = Patients.PatientId
      AND Diagnostics.DiagnosticId != ImagingCTScan.DiagnosticId
      AND Diagnostics.DiagnosticId != ImagingMRI.DiagnosticId
      ) ptDx ON ptDx.DiagnosticId = Diagnostics.DiagnosticId
      WHERE ptDx.OrdinalRow = 4
      AND
      (
      (
      PrimaryProcedure.ProcedureId IS NOT NULL
      AND PrimaryProcedure.ProcDate IS NOT NULL
      AND ptDx.DxDate <= PrimaryProcedure.ProcDate
      )
      OR
      -- primary procedure exists, but no date; see if imaging and procedure were entered with same eform
      (
      PrimaryProcedure.ProcedureId IS NOT NULL
      AND PrimaryProcedure.ProcDate IS NULL
      AND ptDx.DxDataSource LIKE '%eform%'
      AND PrimaryProcedure.ProcDataSource LIKE '%eform%'
      AND DATEPART(mm,ptDx.EnteredTime) = DATEPART(mm,PrimaryProcedure.EnteredTime)
      AND DATEPART(dd,ptDx.EnteredTime) = DATEPART(dd,PrimaryProcedure.EnteredTime)
      AND DATEPART(yyyy,ptDx.EnteredTime) = DATEPART(yyyy,PrimaryProcedure.EnteredTime)
      )
      OR
      -- no primary procedure; just scan
      (
      PrimaryProcedure.ProcedureId IS NULL
      )
      )
      ORDER BY ptDx.DxDate DESC
      )

      LEFT OUTER JOIN Diagnostics ImagingOther_5
      ON Patients.PatientId = ImagingOther_5.PatientId
      AND ImagingOther_5.DiagnosticId =
      (
      SELECT TOP 5 ptDx.DiagnosticId FROM Diagnostics
      INNER JOIN
      (SELECT ROW_NUMBER() OVER(ORDER BY DxDate DESC) OrdinalRow, Diagnostics.*
      FROM Diagnostics
      --LEFT JOIN DxImageFindings ON DxImageFindings.DiagnosticId = Diagnostics.DiagnosticId
      LEFT JOIN Patients pt ON pt.PatientId = Diagnostics.Patientid
      WHERE Diagnostics.PatientId = Patients.PatientId
      AND Diagnostics.DiagnosticId != ImagingCTScan.DiagnosticId
      AND Diagnostics.DiagnosticId != ImagingMRI.DiagnosticId
      ) ptDx ON ptDx.DiagnosticId = Diagnostics.DiagnosticId
      WHERE ptDx.OrdinalRow = 5
      AND
      (
      (
      PrimaryProcedure.ProcedureId IS NOT NULL
      AND PrimaryProcedure.ProcDate IS NOT NULL
      AND ptDx.DxDate <= PrimaryProcedure.ProcDate
      )
      OR
      -- primary procedure exists, but no date; see if imaging and procedure were entered with same eform
      (
      PrimaryProcedure.ProcedureId IS NOT NULL
      AND PrimaryProcedure.ProcDate IS NULL
      AND ptDx.DxDataSource LIKE '%eform%'
      AND PrimaryProcedure.ProcDataSource LIKE '%eform%'
      AND DATEPART(mm,ptDx.EnteredTime) = DATEPART(mm,PrimaryProcedure.EnteredTime)
      AND DATEPART(dd,ptDx.EnteredTime) = DATEPART(dd,PrimaryProcedure.EnteredTime)
      AND DATEPART(yyyy,ptDx.EnteredTime) = DATEPART(yyyy,PrimaryProcedure.EnteredTime)
      )
      OR
      -- no primary procedure; just scan
      (
      PrimaryProcedure.ProcedureId IS NULL
      )
      )
      ORDER BY ptDx.DxDate DESC
      )

      -- biopsy performed pivit; either get biopsy closest to primary procedure, or the most recent biopsy in general
      LEFT OUTER JOIN Procedures BiopsyProcedure
      ON Patients.PatientId = BiopsyProcedure.PatientId
      AND BiopsyProcedure.ProcedureId =
      (
      SELECT TOP 1 ProcedureId
      FROM Procedures
      WHERE
      PatientId = Patients.PatientId
      AND ProcName = 'Biopsy'
      AND
      (
      -- primary procedure and date exists
      (
      PrimaryProcedure.ProcedureId IS NOT NULL
      AND PrimaryProcedure.ProcDate IS NOT NULL
      AND ProcDate <= PrimaryProcedure.ProcDate
      )
      OR
      -- primary procedure exists, but no date; see if biopsy and procedure were entered with same eform
      (
      PrimaryProcedure.ProcedureId IS NOT NULL
      AND PrimaryProcedure.ProcDate IS NULL
      AND ProcDataSource LIKE '%eform%'
      AND PrimaryProcedure.ProcDataSource LIKE '%eform%'
      AND DATEPART(mm,EnteredTime) = DATEPART(mm,PrimaryProcedure.EnteredTime)
      AND DATEPART(dd,EnteredTime) = DATEPART(dd,PrimaryProcedure.EnteredTime)
      AND DATEPART(yyyy,EnteredTime) = DATEPART(yyyy,PrimaryProcedure.EnteredTime)
      )
      OR
      -- no primary procedure; just get most recent biopsy
      (
      PrimaryProcedure.ProcedureId IS NULL
      )

      )

      ORDER BY EncDate DESC
      )

      -- pre 0-lab test pivots
      LEFT OUTER JOIN LabTests PreOpLab_Platelets
      ON Patients.PatientId = PreOpLab_Platelets.PatientId
      AND PreOpLab_Platelets.LabTestId =
      (
      SELECT TOP 1 LabTestId
      FROM LabTests
      WHERE PatientId = Patients.PatientId
      AND	LabTest LIKE '%Platelets%'
      AND
      (
      -- primary procedure and date exists
      (
      PrimaryProcedure.ProcedureId IS NOT NULL
      AND PrimaryProcedure.ProcDate IS NOT NULL
      AND LabDate <= PrimaryProcedure.ProcDate
      )
      OR
      -- primary procedure exists, but no date; see if lab and procedure were entered with same eform
      (
      PrimaryProcedure.ProcedureId IS NOT NULL
      AND PrimaryProcedure.ProcDate IS NULL
      AND LabDataSource LIKE '%eform%'
      AND PrimaryProcedure.ProcDataSource LIKE '%eform%'
      AND DATEPART(mm,EnteredTime) = DATEPART(mm,PrimaryProcedure.EnteredTime)
      AND DATEPART(dd,EnteredTime) = DATEPART(dd,PrimaryProcedure.EnteredTime)
      AND DATEPART(yyyy,EnteredTime) = DATEPART(yyyy,PrimaryProcedure.EnteredTime)
      )
      OR
      -- no primary procedure; just get most recent lab
      (
      PrimaryProcedure.ProcedureId IS NULL
      )

      )
      ORDER BY LabDate DESC, UpdatedTime DESC, EnteredTime DESC
      )

      LEFT OUTER JOIN LabTests PreOpLab_AFP
      ON Patients.PatientId = PreOpLab_AFP.PatientId
      AND PreOpLab_AFP.LabTestId =
      (
      SELECT TOP 1 LabTestId
      FROM LabTests
      WHERE PatientId = Patients.PatientId
      AND	LabTest LIKE '%AFP%'
      AND
      (
      -- primary procedure and date exists
      (
      PrimaryProcedure.ProcedureId IS NOT NULL
      AND PrimaryProcedure.ProcDate IS NOT NULL
      AND LabDate <= PrimaryProcedure.ProcDate
      )
      OR
      -- primary procedure exists, but no date; see if lab and procedure were entered with same eform
      (
      PrimaryProcedure.ProcedureId IS NOT NULL
      AND PrimaryProcedure.ProcDate IS NULL
      AND LabDataSource LIKE '%eform%'
      AND PrimaryProcedure.ProcDataSource LIKE '%eform%'
      AND DATEPART(mm,EnteredTime) = DATEPART(mm,PrimaryProcedure.EnteredTime)
      AND DATEPART(dd,EnteredTime) = DATEPART(dd,PrimaryProcedure.EnteredTime)
      AND DATEPART(yyyy,EnteredTime) = DATEPART(yyyy,PrimaryProcedure.EnteredTime)
      )
      OR
      -- no primary procedure; just get most recent lab
      (
      PrimaryProcedure.ProcedureId IS NULL
      )

      )
      ORDER BY LabDate DESC, UpdatedTime DESC, EnteredTime DESC
      )

      LEFT OUTER JOIN LabTests PreOpLab_CEA
      ON Patients.PatientId = PreOpLab_CEA.PatientId
      AND PreOpLab_CEA.LabTestId =
      (
      SELECT TOP 1 LabTestId
      FROM LabTests
      WHERE PatientId = Patients.PatientId
      AND	LabTest LIKE '%CEA%'
      AND
      (
      -- primary procedure and date exists
      (
      PrimaryProcedure.ProcedureId IS NOT NULL
      AND PrimaryProcedure.ProcDate IS NOT NULL
      AND LabDate <= PrimaryProcedure.ProcDate
      )
      OR
      -- primary procedure exists, but no date; see if lab and procedure were entered with same eform
      (
      PrimaryProcedure.ProcedureId IS NOT NULL
      AND PrimaryProcedure.ProcDate IS NULL
      AND LabDataSource LIKE '%eform%'
      AND PrimaryProcedure.ProcDataSource LIKE '%eform%'
      AND DATEPART(mm,EnteredTime) = DATEPART(mm,PrimaryProcedure.EnteredTime)
      AND DATEPART(dd,EnteredTime) = DATEPART(dd,PrimaryProcedure.EnteredTime)
      AND DATEPART(yyyy,EnteredTime) = DATEPART(yyyy,PrimaryProcedure.EnteredTime)
      )
      OR
      -- no primary procedure; just get most recent lab
      (
      PrimaryProcedure.ProcedureId IS NULL
      )

      )
      ORDER BY LabDate DESC, UpdatedTime DESC, EnteredTime DESC
      )

      LEFT OUTER JOIN LabTests PreOpLab_CA199
      ON Patients.PatientId = PreOpLab_CA199.PatientId
      AND PreOpLab_CA199.LabTestId =
      (
      SELECT TOP 1 LabTestId
      FROM LabTests
      WHERE PatientId = Patients.PatientId
      AND	LabTest LIKE '%CA%19%9%'
      AND
      (
      -- primary procedure and date exists
      (
      PrimaryProcedure.ProcedureId IS NOT NULL
      AND PrimaryProcedure.ProcDate IS NOT NULL
      AND LabDate <= PrimaryProcedure.ProcDate
      )
      OR
      -- primary procedure exists, but no date; see if lab and procedure were entered with same eform
      (
      PrimaryProcedure.ProcedureId IS NOT NULL
      AND PrimaryProcedure.ProcDate IS NULL
      AND LabDataSource LIKE '%eform%'
      AND PrimaryProcedure.ProcDataSource LIKE '%eform%'
      AND DATEPART(mm,EnteredTime) = DATEPART(mm,PrimaryProcedure.EnteredTime)
      AND DATEPART(dd,EnteredTime) = DATEPART(dd,PrimaryProcedure.EnteredTime)
      AND DATEPART(yyyy,EnteredTime) = DATEPART(yyyy,PrimaryProcedure.EnteredTime)
      )
      OR
      -- no primary procedure; just get most recent lab
      (
      PrimaryProcedure.ProcedureId IS NULL
      )

      )
      ORDER BY LabDate DESC, UpdatedTime DESC, EnteredTime DESC
      )

      LEFT OUTER JOIN LabTests PreOpLab_HepatitisB
      ON Patients.PatientId = PreOpLab_HepatitisB.PatientId
      AND PreOpLab_HepatitisB.LabTestId =
      (
      SELECT TOP 1 LabTestId
      FROM LabTests
      WHERE PatientId = Patients.PatientId
      AND	LabTest LIKE '%Hepatitis%B%viral%load%'
      AND
      (
      -- primary procedure and date exists
      (
      PrimaryProcedure.ProcedureId IS NOT NULL
      AND PrimaryProcedure.ProcDate IS NOT NULL
      AND LabDate <= PrimaryProcedure.ProcDate
      )
      OR
      -- primary procedure exists, but no date; see if lab and procedure were entered with same eform
      (
      PrimaryProcedure.ProcedureId IS NOT NULL
      AND PrimaryProcedure.ProcDate IS NULL
      AND LabDataSource LIKE '%eform%'
      AND PrimaryProcedure.ProcDataSource LIKE '%eform%'
      AND DATEPART(mm,EnteredTime) = DATEPART(mm,PrimaryProcedure.EnteredTime)
      AND DATEPART(dd,EnteredTime) = DATEPART(dd,PrimaryProcedure.EnteredTime)
      AND DATEPART(yyyy,EnteredTime) = DATEPART(yyyy,PrimaryProcedure.EnteredTime)
      )
      OR
      -- no primary procedure; just get most recent lab
      (
      PrimaryProcedure.ProcedureId IS NULL
      )

      )
      ORDER BY LabDate DESC, UpdatedTime DESC, EnteredTime DESC
      )


      -- child-pugh score test pivot
      LEFT OUTER JOIN Surveys ChildPughScore
      ON Patients.PatientId = ChildPughScore.PatientId
      AND ChildPughScore.SurveyId =
      (
      SELECT TOP 1 SurveyId FROM Surveys
      WHERE PatientId = Patients.PatientId
      AND SurveyType = 'Child-Pugh Score'
      ORDER BY SurveyDate DESC, UpdatedTime DESC, EnteredTime
      )

      -- interventional radiology tace test pivots
      LEFT OUTER JOIN Procedures InterventionalRad_TACE1
      ON Patients.PatientId = InterventionalRad_TACE1.PatientId
      AND InterventionalRad_TACE1.ProcedureId =
      (
      SELECT TOP 3 ptProc.ProcedureId FROM Procedures
      INNER JOIN
      (SELECT ROW_NUMBER() OVER(ORDER BY ProcDate DESC) OrdinalRow, Procedures.*
      FROM Procedures
      WHERE Procedures.PatientId = Patients.PatientId
      AND Procedures.ProcName LIKE '%TACE%'
      ) ptProc ON ptProc.ProcedureId = Procedures.ProcedureId
      WHERE ptProc.OrdinalRow = 1
      AND
      (
      -- primary procedure and date exists
      (
      PrimaryProcedure.ProcedureId IS NOT NULL
      AND PrimaryProcedure.ProcDate IS NOT NULL
      AND ptProc.ProcDate <= PrimaryProcedure.ProcDate
      )
      OR
      -- primary procedure exists, but no date; see if imaging and procedure were entered with same eform
      (
      PrimaryProcedure.ProcedureId IS NOT NULL
      AND PrimaryProcedure.ProcDate IS NULL
      AND ptProc.ProcDataSource LIKE '%eform%'
      AND PrimaryProcedure.ProcDataSource LIKE '%eform%'
      AND DATEPART(mm,ptProc.EnteredTime) = DATEPART(mm,PrimaryProcedure.EnteredTime)
      AND DATEPART(dd,ptProc.EnteredTime) = DATEPART(dd,PrimaryProcedure.EnteredTime)
      AND DATEPART(yyyy,ptProc.EnteredTime) = DATEPART(yyyy,PrimaryProcedure.EnteredTime)
      )
      OR
      -- no primary procedure; just get most recent mri scan
      (
      PrimaryProcedure.ProcedureId IS NULL
      )
      )
      ORDER BY ptProc.ProcDate DESC
      )


      LEFT OUTER JOIN Procedures InterventionalRad_TACE2
      ON Patients.PatientId = InterventionalRad_TACE2.PatientId
      AND InterventionalRad_TACE2.ProcedureId =
      (
      SELECT TOP 3 ptProc.ProcedureId FROM Procedures
      INNER JOIN
      (SELECT ROW_NUMBER() OVER(ORDER BY ProcDate DESC) OrdinalRow, Procedures.*
      FROM Procedures
      WHERE Procedures.PatientId = Patients.PatientId
      AND Procedures.ProcName LIKE '%TACE%'
      ) ptProc ON ptProc.ProcedureId = Procedures.ProcedureId
      WHERE ptProc.OrdinalRow = 2
      AND
      (
      -- primary procedure and date exists
      (
      PrimaryProcedure.ProcedureId IS NOT NULL
      AND PrimaryProcedure.ProcDate IS NOT NULL
      AND ptProc.ProcDate <= PrimaryProcedure.ProcDate
      )
      OR
      -- primary procedure exists, but no date; see if imaging and procedure were entered with same eform
      (
      PrimaryProcedure.ProcedureId IS NOT NULL
      AND PrimaryProcedure.ProcDate IS NULL
      AND ptProc.ProcDataSource LIKE '%eform%'
      AND PrimaryProcedure.ProcDataSource LIKE '%eform%'
      AND DATEPART(mm,ptProc.EnteredTime) = DATEPART(mm,PrimaryProcedure.EnteredTime)
      AND DATEPART(dd,ptProc.EnteredTime) = DATEPART(dd,PrimaryProcedure.EnteredTime)
      AND DATEPART(yyyy,ptProc.EnteredTime) = DATEPART(yyyy,PrimaryProcedure.EnteredTime)
      )
      OR
      -- no primary procedure; just get most recent mri scan
      (
      PrimaryProcedure.ProcedureId IS NULL
      )
      )
      ORDER BY ptProc.ProcDate DESC
      )


      LEFT OUTER JOIN Procedures InterventionalRad_TACE3
      ON Patients.PatientId = InterventionalRad_TACE3.PatientId
      AND InterventionalRad_TACE3.ProcedureId =
      (
      SELECT TOP 3 ptProc.ProcedureId FROM Procedures
      INNER JOIN
      (SELECT ROW_NUMBER() OVER(ORDER BY ProcDate DESC) OrdinalRow, Procedures.*
      FROM Procedures
      WHERE Procedures.PatientId = Patients.PatientId
      AND Procedures.ProcName LIKE '%TACE%'
      ) ptProc ON ptProc.ProcedureId = Procedures.ProcedureId
      WHERE ptProc.OrdinalRow = 3
      AND
      (
      -- primary procedure and date exists
      (
      PrimaryProcedure.ProcedureId IS NOT NULL
      AND PrimaryProcedure.ProcDate IS NOT NULL
      AND ptProc.ProcDate <= PrimaryProcedure.ProcDate
      )
      OR
      -- primary procedure exists, but no date; see if imaging and procedure were entered with same eform
      (
      PrimaryProcedure.ProcedureId IS NOT NULL
      AND PrimaryProcedure.ProcDate IS NULL
      AND ptProc.ProcDataSource LIKE '%eform%'
      AND PrimaryProcedure.ProcDataSource LIKE '%eform%'
      AND DATEPART(mm,ptProc.EnteredTime) = DATEPART(mm,PrimaryProcedure.EnteredTime)
      AND DATEPART(dd,ptProc.EnteredTime) = DATEPART(dd,PrimaryProcedure.EnteredTime)
      AND DATEPART(yyyy,ptProc.EnteredTime) = DATEPART(yyyy,PrimaryProcedure.EnteredTime)
      )
      OR
      -- no primary procedure; just get most recent mri scan
      (
      PrimaryProcedure.ProcedureId IS NULL
      )
      )
      ORDER BY ptProc.ProcDate DESC
      )


      -- interventional radiology pve test pivots
      LEFT OUTER JOIN Procedures InterventionalRad_PVE1
      ON Patients.PatientId = InterventionalRad_PVE1.PatientId
      AND InterventionalRad_PVE1.ProcedureId =
      (
      SELECT TOP 3 ptProc.ProcedureId FROM Procedures
      INNER JOIN
      (SELECT ROW_NUMBER() OVER(ORDER BY ProcDate DESC) OrdinalRow, Procedures.*
      FROM Procedures
      WHERE Procedures.PatientId = Patients.PatientId
      AND Procedures.ProcName LIKE '%PVE%'
      ) ptProc ON ptProc.ProcedureId = Procedures.ProcedureId
      WHERE ptProc.OrdinalRow = 1
      AND
      (
      -- primary procedure and date exists
      (
      PrimaryProcedure.ProcedureId IS NOT NULL
      AND PrimaryProcedure.ProcDate IS NOT NULL
      AND ptProc.ProcDate <= PrimaryProcedure.ProcDate
      )
      OR
      -- primary procedure exists, but no date; see if imaging and procedure were entered with same eform
      (
      PrimaryProcedure.ProcedureId IS NOT NULL
      AND PrimaryProcedure.ProcDate IS NULL
      AND ptProc.ProcDataSource LIKE '%eform%'
      AND PrimaryProcedure.ProcDataSource LIKE '%eform%'
      AND DATEPART(mm,ptProc.EnteredTime) = DATEPART(mm,PrimaryProcedure.EnteredTime)
      AND DATEPART(dd,ptProc.EnteredTime) = DATEPART(dd,PrimaryProcedure.EnteredTime)
      AND DATEPART(yyyy,ptProc.EnteredTime) = DATEPART(yyyy,PrimaryProcedure.EnteredTime)
      )
      OR
      -- no primary procedure; just get most recent mri scan
      (
      PrimaryProcedure.ProcedureId IS NULL
      )
      )
      ORDER BY ptProc.ProcDate DESC
      )


      LEFT OUTER JOIN Procedures InterventionalRad_PVE2
      ON Patients.PatientId = InterventionalRad_PVE2.PatientId
      AND InterventionalRad_PVE2.ProcedureId =
      (
      SELECT TOP 3 ptProc.ProcedureId FROM Procedures
      INNER JOIN
      (SELECT ROW_NUMBER() OVER(ORDER BY ProcDate DESC) OrdinalRow, Procedures.*
      FROM Procedures
      WHERE Procedures.PatientId = Patients.PatientId
      AND Procedures.ProcName LIKE '%PVE%'
      ) ptProc ON ptProc.ProcedureId = Procedures.ProcedureId
      WHERE ptProc.OrdinalRow = 2
      AND
      (
      -- primary procedure and date exists
      (
      PrimaryProcedure.ProcedureId IS NOT NULL
      AND PrimaryProcedure.ProcDate IS NOT NULL
      AND ptProc.ProcDate <= PrimaryProcedure.ProcDate
      )
      OR
      -- primary procedure exists, but no date; see if imaging and procedure were entered with same eform
      (
      PrimaryProcedure.ProcedureId IS NOT NULL
      AND PrimaryProcedure.ProcDate IS NULL
      AND ptProc.ProcDataSource LIKE '%eform%'
      AND PrimaryProcedure.ProcDataSource LIKE '%eform%'
      AND DATEPART(mm,ptProc.EnteredTime) = DATEPART(mm,PrimaryProcedure.EnteredTime)
      AND DATEPART(dd,ptProc.EnteredTime) = DATEPART(dd,PrimaryProcedure.EnteredTime)
      AND DATEPART(yyyy,ptProc.EnteredTime) = DATEPART(yyyy,PrimaryProcedure.EnteredTime)
      )
      OR
      -- no primary procedure; just get most recent mri scan
      (
      PrimaryProcedure.ProcedureId IS NULL
      )
      )
      ORDER BY ptProc.ProcDate DESC
      )

      LEFT OUTER JOIN Procedures InterventionalRad_PVE3
      ON Patients.PatientId = InterventionalRad_PVE3.PatientId
      AND InterventionalRad_PVE3.ProcedureId =
      (
      SELECT TOP 3 ptProc.ProcedureId FROM Procedures
      INNER JOIN
      (SELECT ROW_NUMBER() OVER(ORDER BY ProcDate DESC) OrdinalRow, Procedures.*
      FROM Procedures
      WHERE Procedures.PatientId = Patients.PatientId
      AND Procedures.ProcName LIKE '%PVE%'
      ) ptProc ON ptProc.ProcedureId = Procedures.ProcedureId
      WHERE ptProc.OrdinalRow = 3
      AND
      (
      -- primary procedure and date exists
      (
      PrimaryProcedure.ProcedureId IS NOT NULL
      AND PrimaryProcedure.ProcDate IS NOT NULL
      AND ptProc.ProcDate <= PrimaryProcedure.ProcDate
      )
      OR
      -- primary procedure exists, but no date; see if imaging and procedure were entered with same eform
      (
      PrimaryProcedure.ProcedureId IS NOT NULL
      AND PrimaryProcedure.ProcDate IS NULL
      AND ptProc.ProcDataSource LIKE '%eform%'
      AND PrimaryProcedure.ProcDataSource LIKE '%eform%'
      AND DATEPART(mm,ptProc.EnteredTime) = DATEPART(mm,PrimaryProcedure.EnteredTime)
      AND DATEPART(dd,ptProc.EnteredTime) = DATEPART(dd,PrimaryProcedure.EnteredTime)
      AND DATEPART(yyyy,ptProc.EnteredTime) = DATEPART(yyyy,PrimaryProcedure.EnteredTime)
      )
      OR
      -- no primary procedure; just get most recent mri scan
      (
      PrimaryProcedure.ProcedureId IS NULL
      )
      )
      ORDER BY ptProc.ProcDate DESC
      )


      -- interventional radiology rfa test pivots
      LEFT OUTER JOIN Procedures InterventionalRad_RFA1
      ON Patients.PatientId = InterventionalRad_RFA1.PatientId
      AND InterventionalRad_RFA1.ProcedureId =
      (
      SELECT TOP 3 ptProc.ProcedureId FROM Procedures
      INNER JOIN
      (SELECT ROW_NUMBER() OVER(ORDER BY ProcDate DESC) OrdinalRow, Procedures.*
      FROM Procedures
      WHERE Procedures.PatientId = Patients.PatientId
      AND Procedures.ProcName LIKE '%RFA%'
      ) ptProc ON ptProc.ProcedureId = Procedures.ProcedureId
      WHERE ptProc.OrdinalRow = 1
      AND
      (
      -- primary procedure and date exists
      (
      PrimaryProcedure.ProcedureId IS NOT NULL
      AND PrimaryProcedure.ProcDate IS NOT NULL
      AND ptProc.ProcDate <= PrimaryProcedure.ProcDate
      )
      OR
      -- primary procedure exists, but no date; see if imaging and procedure were entered with same eform
      (
      PrimaryProcedure.ProcedureId IS NOT NULL
      AND PrimaryProcedure.ProcDate IS NULL
      AND ptProc.ProcDataSource LIKE '%eform%'
      AND PrimaryProcedure.ProcDataSource LIKE '%eform%'
      AND DATEPART(mm,ptProc.EnteredTime) = DATEPART(mm,PrimaryProcedure.EnteredTime)
      AND DATEPART(dd,ptProc.EnteredTime) = DATEPART(dd,PrimaryProcedure.EnteredTime)
      AND DATEPART(yyyy,ptProc.EnteredTime) = DATEPART(yyyy,PrimaryProcedure.EnteredTime)
      )
      OR
      -- no primary procedure; just get most recent mri scan
      (
      PrimaryProcedure.ProcedureId IS NULL
      )
      )
      ORDER BY ptProc.ProcDate DESC
      )

      LEFT OUTER JOIN Procedures InterventionalRad_RFA2
      ON Patients.PatientId = InterventionalRad_RFA2.PatientId
      AND InterventionalRad_RFA2.ProcedureId =
      (
      SELECT TOP 3 ptProc.ProcedureId FROM Procedures
      INNER JOIN
      (SELECT ROW_NUMBER() OVER(ORDER BY ProcDate DESC) OrdinalRow, Procedures.*
      FROM Procedures
      WHERE Procedures.PatientId = Patients.PatientId
      AND Procedures.ProcName LIKE '%RFA%'
      ) ptProc ON ptProc.ProcedureId = Procedures.ProcedureId
      WHERE ptProc.OrdinalRow = 2
      AND
      (
      -- primary procedure and date exists
      (
      PrimaryProcedure.ProcedureId IS NOT NULL
      AND PrimaryProcedure.ProcDate IS NOT NULL
      AND ptProc.ProcDate <= PrimaryProcedure.ProcDate
      )
      OR
      -- primary procedure exists, but no date; see if imaging and procedure were entered with same eform
      (
      PrimaryProcedure.ProcedureId IS NOT NULL
      AND PrimaryProcedure.ProcDate IS NULL
      AND ptProc.ProcDataSource LIKE '%eform%'
      AND PrimaryProcedure.ProcDataSource LIKE '%eform%'
      AND DATEPART(mm,ptProc.EnteredTime) = DATEPART(mm,PrimaryProcedure.EnteredTime)
      AND DATEPART(dd,ptProc.EnteredTime) = DATEPART(dd,PrimaryProcedure.EnteredTime)
      AND DATEPART(yyyy,ptProc.EnteredTime) = DATEPART(yyyy,PrimaryProcedure.EnteredTime)
      )
      OR
      -- no primary procedure; just get most recent mri scan
      (
      PrimaryProcedure.ProcedureId IS NULL
      )
      )
      ORDER BY ptProc.ProcDate DESC
      )


      LEFT OUTER JOIN Procedures InterventionalRad_RFA3
      ON Patients.PatientId = InterventionalRad_RFA3.PatientId
      AND InterventionalRad_RFA3.ProcedureId =
      (
      SELECT TOP 3 ptProc.ProcedureId FROM Procedures
      INNER JOIN
      (SELECT ROW_NUMBER() OVER(ORDER BY ProcDate DESC) OrdinalRow, Procedures.*
      FROM Procedures
      WHERE Procedures.PatientId = Patients.PatientId
      AND Procedures.ProcName LIKE '%RFA%'
      ) ptProc ON ptProc.ProcedureId = Procedures.ProcedureId
      WHERE ptProc.OrdinalRow = 3
      AND
      (
      -- primary procedure and date exists
      (
      PrimaryProcedure.ProcedureId IS NOT NULL
      AND PrimaryProcedure.ProcDate IS NOT NULL
      AND ptProc.ProcDate <= PrimaryProcedure.ProcDate
      )
      OR
      -- primary procedure exists, but no date; see if imaging and procedure were entered with same eform
      (
      PrimaryProcedure.ProcedureId IS NOT NULL
      AND PrimaryProcedure.ProcDate IS NULL
      AND ptProc.ProcDataSource LIKE '%eform%'
      AND PrimaryProcedure.ProcDataSource LIKE '%eform%'
      AND DATEPART(mm,ptProc.EnteredTime) = DATEPART(mm,PrimaryProcedure.EnteredTime)
      AND DATEPART(dd,ptProc.EnteredTime) = DATEPART(dd,PrimaryProcedure.EnteredTime)
      AND DATEPART(yyyy,ptProc.EnteredTime) = DATEPART(yyyy,PrimaryProcedure.EnteredTime)
      )
      OR
      -- no primary procedure; just get most recent mri scan
      (
      PrimaryProcedure.ProcedureId IS NULL
      )
      )
      ORDER BY ptProc.ProcDate DESC
      )


      -- find earliest post-op hospitalization
      LEFT OUTER JOIN Hospitalizations
      ON Patients.PatientId = Hospitalizations.PatientId
      AND Hospitalizations.HospitalizationId =
      (
      SELECT TOP 1 HospitalizationId
      FROM Hospitalizations
      WHERE PatientId = Patients.PatientId
      AND HospDischargeDate >= OperatingRoomDetails.OpDate
      ORDER BY HospDischargeDate ASC
      )


      -- post op labs test pivot
      LEFT OUTER JOIN LabTests PostOpLab_INR
      ON Patients.PatientId = PostOpLab_INR.PatientId
      AND PostOpLab_INR.LabTestId =
      (
      SELECT TOP 1 LabTestId
      FROM LabTests
      WHERE PatientId = Patients.PatientId
      AND	LabTest LIKE '%peak%inr%'
      AND
      (
      -- primary procedure and date exists
      (
      PrimaryProcedure.ProcedureId IS NOT NULL
      AND PrimaryProcedure.ProcDate IS NOT NULL
      AND LabDate > PrimaryProcedure.ProcDate
      )
      OR
      -- primary procedure exists, but no date; see if lab and procedure were entered with same eform
      (
      PrimaryProcedure.ProcedureId IS NOT NULL
      AND PrimaryProcedure.ProcDate IS NULL
      AND LabDataSource LIKE '%eform%'
      AND PrimaryProcedure.ProcDataSource LIKE '%eform%'
      AND DATEPART(mm,EnteredTime) = DATEPART(mm,PrimaryProcedure.EnteredTime)
      AND DATEPART(dd,EnteredTime) = DATEPART(dd,PrimaryProcedure.EnteredTime)
      AND DATEPART(yyyy,EnteredTime) = DATEPART(yyyy,PrimaryProcedure.EnteredTime)
      )
      OR
      -- no primary procedure; just get most recent lab
      (
      PrimaryProcedure.ProcedureId IS NULL
      )

      )
      ORDER BY LabDate DESC, UpdatedTime DESC, EnteredTime DESC
      )

      LEFT OUTER JOIN LabTests PostOpLab_TotalBilirubin
      ON Patients.PatientId = PostOpLab_TotalBilirubin.PatientId
      AND PostOpLab_TotalBilirubin.LabTestId =
      (
      SELECT TOP 1 LabTestId
      FROM LabTests
      WHERE PatientId = Patients.PatientId
      AND	LabTest LIKE '%peak%total%bilirubin%'
      AND
      (
      -- primary procedure and date exists
      (
      PrimaryProcedure.ProcedureId IS NOT NULL
      AND PrimaryProcedure.ProcDate IS NOT NULL
      AND LabDate > PrimaryProcedure.ProcDate
      )
      OR
      -- primary procedure exists, but no date; see if lab and procedure were entered with same eform
      (
      PrimaryProcedure.ProcedureId IS NOT NULL
      AND PrimaryProcedure.ProcDate IS NULL
      AND LabDataSource LIKE '%eform%'
      AND PrimaryProcedure.ProcDataSource LIKE '%eform%'
      AND DATEPART(mm,EnteredTime) = DATEPART(mm,PrimaryProcedure.EnteredTime)
      AND DATEPART(dd,EnteredTime) = DATEPART(dd,PrimaryProcedure.EnteredTime)
      AND DATEPART(yyyy,EnteredTime) = DATEPART(yyyy,PrimaryProcedure.EnteredTime)
      )
      OR
      -- no primary procedure; just get most recent lab
      (
      PrimaryProcedure.ProcedureId IS NULL
      )

      )
      ORDER BY LabDate DESC, UpdatedTime DESC, EnteredTime DESC
      )


      -- post op complications test pivot
      LEFT OUTER JOIN Toxicities PostOpComplications1
      ON Patients.PatientId = PostOpComplications1.PatientId
      AND PostOpComplications1.ToxicityId =
      (
      SELECT TOP 3 ptTx.ToxicityId FROM Toxicities
      INNER JOIN
      (SELECT ROW_NUMBER() OVER(ORDER BY ToxDate DESC) OrdinalRow, Toxicities.*
      FROM Toxicities
      WHERE Toxicities.PatientId = Patients.PatientId
      ) ptTx ON ptTx.ToxicityId = Toxicities.ToxicityId
      WHERE ptTx.OrdinalRow = 1
      AND
      (
      -- primary procedure and date exists
      (
      PrimaryProcedure.ProcedureId IS NOT NULL
      AND PrimaryProcedure.ProcDate IS NOT NULL
      AND ptTx.ToxDate > PrimaryProcedure.ProcDate
      )
      OR
      -- primary procedure exists, but no date; see if complication and procedure were entered with same eform
      (
      PrimaryProcedure.ProcedureId IS NOT NULL
      AND PrimaryProcedure.ProcDate IS NULL
      AND ptTx.ToxDataSource LIKE '%eform%'
      AND PrimaryProcedure.ProcDataSource LIKE '%eform%'
      AND DATEPART(mm,ptTx.EnteredTime) = DATEPART(mm,PrimaryProcedure.EnteredTime)
      AND DATEPART(dd,ptTx.EnteredTime) = DATEPART(dd,PrimaryProcedure.EnteredTime)
      AND DATEPART(yyyy,ptTx.EnteredTime) = DATEPART(yyyy,PrimaryProcedure.EnteredTime)
      )
      OR
      -- no primary procedure; just get most recent complication
      (
      PrimaryProcedure.ProcedureId IS NULL
      )
      )
      ORDER BY ptTx.ToxDate DESC
      )


      LEFT OUTER JOIN Toxicities PostOpComplications2
      ON Patients.PatientId = PostOpComplications2.PatientId
      AND PostOpComplications2.ToxicityId =
      (
      SELECT TOP 3 ptTx.ToxicityId FROM Toxicities
      INNER JOIN
      (SELECT ROW_NUMBER() OVER(ORDER BY ToxDate DESC) OrdinalRow, Toxicities.*
      FROM Toxicities
      WHERE Toxicities.PatientId = Patients.PatientId
      ) ptTx ON ptTx.ToxicityId = Toxicities.ToxicityId
      WHERE ptTx.OrdinalRow = 2
      AND
      (
      -- primary procedure and date exists
      (
      PrimaryProcedure.ProcedureId IS NOT NULL
      AND PrimaryProcedure.ProcDate IS NOT NULL
      AND ptTx.ToxDate > PrimaryProcedure.ProcDate
      )
      OR
      -- primary procedure exists, but no date; see if complication and procedure were entered with same eform
      (
      PrimaryProcedure.ProcedureId IS NOT NULL
      AND PrimaryProcedure.ProcDate IS NULL
      AND ptTx.ToxDataSource LIKE '%eform%'
      AND PrimaryProcedure.ProcDataSource LIKE '%eform%'
      AND DATEPART(mm,ptTx.EnteredTime) = DATEPART(mm,PrimaryProcedure.EnteredTime)
      AND DATEPART(dd,ptTx.EnteredTime) = DATEPART(dd,PrimaryProcedure.EnteredTime)
      AND DATEPART(yyyy,ptTx.EnteredTime) = DATEPART(yyyy,PrimaryProcedure.EnteredTime)
      )
      OR
      -- no primary procedure; just get most recent complication
      (
      PrimaryProcedure.ProcedureId IS NULL
      )
      )
      ORDER BY ptTx.ToxDate DESC
      )


      LEFT OUTER JOIN Toxicities PostOpComplications3
      ON Patients.PatientId = PostOpComplications3.PatientId
      AND PostOpComplications3.ToxicityId =
      (
      SELECT TOP 3 ptTx.ToxicityId FROM Toxicities
      INNER JOIN
      (SELECT ROW_NUMBER() OVER(ORDER BY ToxDate DESC) OrdinalRow, Toxicities.*
      FROM Toxicities
      WHERE Toxicities.PatientId = Patients.PatientId
      ) ptTx ON ptTx.ToxicityId = Toxicities.ToxicityId
      WHERE ptTx.OrdinalRow = 3
      AND
      (
      -- primary procedure and date exists
      (
      PrimaryProcedure.ProcedureId IS NOT NULL
      AND PrimaryProcedure.ProcDate IS NOT NULL
      AND ptTx.ToxDate > PrimaryProcedure.ProcDate
      )
      OR
      -- primary procedure exists, but no date; see if complication and procedure were entered with same eform
      (
      PrimaryProcedure.ProcedureId IS NOT NULL
      AND PrimaryProcedure.ProcDate IS NULL
      AND ptTx.ToxDataSource LIKE '%eform%'
      AND PrimaryProcedure.ProcDataSource LIKE '%eform%'
      AND DATEPART(mm,ptTx.EnteredTime) = DATEPART(mm,PrimaryProcedure.EnteredTime)
      AND DATEPART(dd,ptTx.EnteredTime) = DATEPART(dd,PrimaryProcedure.EnteredTime)
      AND DATEPART(yyyy,ptTx.EnteredTime) = DATEPART(yyyy,PrimaryProcedure.EnteredTime)
      )
      OR
      -- no primary procedure; just get most recent complication
      (
      PrimaryProcedure.ProcedureId IS NULL
      )
      )
      ORDER BY ptTx.ToxDate DESC
      )

      -- get the pathology record for the patient
      -- latest eform version links Pathology to Primary Procedure and OperatingRoomDetails
      LEFT OUTER JOIN Pathology
      ON Patients.PatientId = Pathology.PatientId
      AND Pathology.PathologyId =
      (
      SELECT TOP 1 PathologyId
      FROM Pathology
      WHERE PatientId = Patients.PatientId
      AND (
      ProcedureId = PrimaryProcedure.ProcedureId
      OR OperatingRoomDetailId = OperatingRoomDetails.OperatingRoomDetailId
      )
      ORDER BY PathDate DESC
      )

      -- pathology absent event test pivot;
      LEFT OUTER JOIN AbsentEvents PathologyAbsentEvent
      ON Patients.PatientId = PathologyAbsentEvent.PatientId
      AND PathologyAbsentEvent.AbsentEventId =
      (
      SELECT TOP 1 AbsentEvents.AbsentEventId FROM AbsentEvents
      WHERE AbsentEvents.PatientId = Patients.PatientId
      AND AbsentEvents.FieldValue LIKE '%Pathology%Report%'
      ORDER BY AbsentEvents.AbsentDate DESC, AbsentEvents.UpdatedTime DESC, AbsentEvents.EnteredTime
      )

      LEFT OUTER JOIN LiverPath
      ON LiverPath.PathologyId = Pathology.PathologyId


      -- sorafenib med tx test pivot
      LEFT OUTER JOIN MedicalTherapy PostOpMedTx_Sorafenib
      ON Patients.PatientId = PostOpMedTx_Sorafenib.PatientId
      AND PostOpMedTx_Sorafenib.MedicalTherapyId =
      (
      SELECT TOP 1 MedicalTherapyId FROM MedicalTherapy
      WHERE MedicalTherapy.PatientId = Patients.PatientId
      AND MedicalTherapy.MedTxType LIKE '%Sorafenib%'
      AND
      (
      -- primary procedure and date exists
      (
      PrimaryProcedure.ProcedureId IS NOT NULL
      AND PrimaryProcedure.ProcDate IS NOT NULL
      AND MedicalTherapy.MedTxDate > PrimaryProcedure.ProcDate
      )
      OR
      -- primary procedure exists, but no date; see if complication and procedure were entered with same eform
      (
      PrimaryProcedure.ProcedureId IS NOT NULL
      AND PrimaryProcedure.ProcDate IS NULL
      AND MedicalTherapy.MedTxDataSource LIKE '%eform%'
      AND PrimaryProcedure.ProcDataSource LIKE '%eform%'
      AND DATEPART(mm,MedicalTherapy.EnteredTime) = DATEPART(mm,PrimaryProcedure.EnteredTime)
      AND DATEPART(dd,MedicalTherapy.EnteredTime) = DATEPART(dd,PrimaryProcedure.EnteredTime)
      AND DATEPART(yyyy,MedicalTherapy.EnteredTime) = DATEPART(yyyy,PrimaryProcedure.EnteredTime)
      )
      OR
      -- no primary procedure; just get most recent complication
      (
      PrimaryProcedure.ProcedureId IS NULL
      )
      )
      ORDER BY MedTxDate DESC
      )

      -- post op radiation therapy test pivot
      LEFT OUTER JOIN RadiationTherapy PostOpRadTx_1
      ON Patients.PatientId = PostOpRadTx_1.PatientId
      AND PostOpRadTx_1.RadiationTherapyId =
      (
      SELECT TOP 3 ptRadTx.RadiationTherapyId FROM RadiationTherapy
      INNER JOIN
      (SELECT ROW_NUMBER() OVER(ORDER BY RadTxDate ASC) OrdinalRow, RadiationTherapy.*
      FROM RadiationTherapy
      --LEFT JOIN DxImageFindings ON DxImageFindings.DiagnosticId = Diagnostics.DiagnosticId
      LEFT JOIN Patients pt ON pt.PatientId = RadiationTherapy.Patientid
      WHERE RadiationTherapy.PatientId = Patients.PatientId
      ) ptRadTx ON ptRadTx.RadiationTherapyId = RadiationTherapy.RadiationTherapyId
      WHERE ptRadTx.OrdinalRow = 1
      AND
      (
      (
      PrimaryProcedure.ProcedureId IS NOT NULL
      AND PrimaryProcedure.ProcDate IS NOT NULL
      AND ptRadTx.RadTxDate > PrimaryProcedure.ProcDate
      )
      OR
      -- primary procedure exists, but no date; see if rad tx and procedure were entered with same eform
      (
      PrimaryProcedure.ProcedureId IS NOT NULL
      AND PrimaryProcedure.ProcDate IS NULL
      AND ptRadTx.RadTxDataSource LIKE '%eform%'
      AND PrimaryProcedure.ProcDataSource LIKE '%eform%'
      AND DATEPART(mm,ptRadTx.EnteredTime) = DATEPART(mm,PrimaryProcedure.EnteredTime)
      AND DATEPART(dd,ptRadTx.EnteredTime) = DATEPART(dd,PrimaryProcedure.EnteredTime)
      AND DATEPART(yyyy,ptRadTx.EnteredTime) = DATEPART(yyyy,PrimaryProcedure.EnteredTime)
      )
      OR
      -- no primary procedure; rad tx
      (
      PrimaryProcedure.ProcedureId IS NULL
      )
      )
      ORDER BY ptRadTx.RadTxDate ASC
      )

      -- post op radiation therapy test pivot
      LEFT OUTER JOIN RadiationTherapy PostOpRadTx_2
      ON Patients.PatientId = PostOpRadTx_2.PatientId
      AND PostOpRadTx_2.RadiationTherapyId =
      (
      SELECT TOP 3 ptRadTx.RadiationTherapyId FROM RadiationTherapy
      INNER JOIN
      (SELECT ROW_NUMBER() OVER(ORDER BY RadTxDate ASC) OrdinalRow, RadiationTherapy.*
      FROM RadiationTherapy
      --LEFT JOIN DxImageFindings ON DxImageFindings.DiagnosticId = Diagnostics.DiagnosticId
      LEFT JOIN Patients pt ON pt.PatientId = RadiationTherapy.Patientid
      WHERE RadiationTherapy.PatientId = Patients.PatientId
      ) ptRadTx ON ptRadTx.RadiationTherapyId = RadiationTherapy.RadiationTherapyId
      WHERE ptRadTx.OrdinalRow = 2
      AND
      (
      (
      PrimaryProcedure.ProcedureId IS NOT NULL
      AND PrimaryProcedure.ProcDate IS NOT NULL
      AND ptRadTx.RadTxDate > PrimaryProcedure.ProcDate
      )
      OR
      -- primary procedure exists, but no date; see if rad tx and procedure were entered with same eform
      (
      PrimaryProcedure.ProcedureId IS NOT NULL
      AND PrimaryProcedure.ProcDate IS NULL
      AND ptRadTx.RadTxDataSource LIKE '%eform%'
      AND PrimaryProcedure.ProcDataSource LIKE '%eform%'
      AND DATEPART(mm,ptRadTx.EnteredTime) = DATEPART(mm,PrimaryProcedure.EnteredTime)
      AND DATEPART(dd,ptRadTx.EnteredTime) = DATEPART(dd,PrimaryProcedure.EnteredTime)
      AND DATEPART(yyyy,ptRadTx.EnteredTime) = DATEPART(yyyy,PrimaryProcedure.EnteredTime)
      )
      OR
      -- no primary procedure; rad tx
      (
      PrimaryProcedure.ProcedureId IS NULL
      )
      )
      ORDER BY ptRadTx.RadTxDate ASC
      )

      -- post op radiation therapy test pivot
      LEFT OUTER JOIN RadiationTherapy PostOpRadTx_3
      ON Patients.PatientId = PostOpRadTx_3.PatientId
      AND PostOpRadTx_3.RadiationTherapyId =
      (
      SELECT TOP 3 ptRadTx.RadiationTherapyId FROM RadiationTherapy
      INNER JOIN
      (SELECT ROW_NUMBER() OVER(ORDER BY RadTxDate ASC) OrdinalRow, RadiationTherapy.*
      FROM RadiationTherapy
      --LEFT JOIN DxImageFindings ON DxImageFindings.DiagnosticId = Diagnostics.DiagnosticId
      LEFT JOIN Patients pt ON pt.PatientId = RadiationTherapy.Patientid
      WHERE RadiationTherapy.PatientId = Patients.PatientId
      ) ptRadTx ON ptRadTx.RadiationTherapyId = RadiationTherapy.RadiationTherapyId
      WHERE ptRadTx.OrdinalRow = 3
      AND
      (
      (
      PrimaryProcedure.ProcedureId IS NOT NULL
      AND PrimaryProcedure.ProcDate IS NOT NULL
      AND ptRadTx.RadTxDate > PrimaryProcedure.ProcDate
      )
      OR
      -- primary procedure exists, but no date; see if rad tx and procedure were entered with same eform
      (
      PrimaryProcedure.ProcedureId IS NOT NULL
      AND PrimaryProcedure.ProcDate IS NULL
      AND ptRadTx.RadTxDataSource LIKE '%eform%'
      AND PrimaryProcedure.ProcDataSource LIKE '%eform%'
      AND DATEPART(mm,ptRadTx.EnteredTime) = DATEPART(mm,PrimaryProcedure.EnteredTime)
      AND DATEPART(dd,ptRadTx.EnteredTime) = DATEPART(dd,PrimaryProcedure.EnteredTime)
      AND DATEPART(yyyy,ptRadTx.EnteredTime) = DATEPART(yyyy,PrimaryProcedure.EnteredTime)
      )
      OR
      -- no primary procedure; rad tx
      (
      PrimaryProcedure.ProcedureId IS NULL
      )
      )
      ORDER BY ptRadTx.RadTxDate ASC
      )

      -- contact status test pivot
      LEFT OUTER JOIN Status LastContactStatus
      ON Patients.PatientId = LastContactStatus.PatientId
      AND LastContactStatus.StatusId =
      (
      SELECT TOP 1 StatusId
      FROM Status ptSt
      WHERE ptSt.PatientId = Patients.PatientId
      AND ptSt.StatusDisease = 'Liver Cancer'
      AND ptSt.Status NOT LIKE '%Diagnosis%Date%'
      AND ptSt.Status NOT LIKE '%Recurrence%'
      ORDER BY ptSt.StatusDate DESC
      )

      -- recurrence date test pivot
      LEFT OUTER JOIN Status RecurrenceStatus
      ON Patients.PatientId = RecurrenceStatus.PatientId
      AND RecurrenceStatus.StatusId =
      (
      SELECT TOP 1 StatusId
      FROM Status ptSt
      WHERE ptSt.PatientId = Patients.PatientId
      AND ptSt.StatusDisease = 'Liver Cancer'
      AND ptSt.Status LIKE '%Recurrence%'
      ORDER BY ptSt.StatusDate DESC
      )


      LEFT OUTER JOIN PatientDiseases
      ON PatientDiseases.PatientId = Patients.PatientId

      LEFT OUTER JOIN Diseases
      ON Diseases.DiseaseId = PatientDiseases.DiseaseId

      WHERE
      -- exclude known test/bogus patients
      Patients.PatientId NOT IN (1, 3, 4, 641, 645, 640, 436, 647)
      AND Diseases.Diseasename = 'Liver Cancer'

      GROUP BY
      Patients.PatientId,
      Patients.PtMRN,
      Patients.PtGender,
      Patients.PtBirthDateText,
      Patients.PtBirthPlace,
      Patients.PtRace,

      ResidencyStatusLegalResident.SurveyItemId,
      ResidencyStatusLegalResident.SurveyItemResult,
      ResidencyStatusYearImmigrated.SurveyItemId,
      ResidencyStatusYearImmigrated.SurveyItemResult,

      DiagnosisDate.StatusId,
      DiagnosisDate.StatusDisease,
      DiagnosisDate.StatusDateText,

      Encounter.EncounterId,
      Encounter.EncDate,
      Encounter.EncDateText,
      Encounter.EncChiefComplaint,
      Encounter.EncPhysician,
      Encounter.EncHeight,
      Encounter.EncWeight,
      Encounter.EncBSA,
      Encounter.EncBMI,
      Encounter.EncKPS,
      Encounter.EncECOG_Score,
      Encounter.EncNotes,
      Encounter.EncInstitution,

      UnderlyingLiverDiseaseAbsentEvent.AbsentEventId,
      UnderlyingLiverDiseaseAbsentEvent.AbsentReason,
      ComorbiditiesAny.ComorbidityId,
      Comorb_HepatitisB.ComorbidityId,
      Comorb_HepatitisC.ComorbidityId,
      Comorb_EtOH.ComorbidityId,
      Comorb_HIV.ComorbidityId,
      Comorb_Diabetes.ComorbidityId,

      AntiviralTherapyAbsentEvent.AbsentEventId,
      AntiviralTherapyAbsentEvent.AbsentReason,
      AntiviralTherapy.MedicalTherapyId,
      AntiviralTherapy.MedTxDateText,
      AntiviralTherapy.MedTxStopDateText,
      AntiviralTherapy.MedTxAgent,

      SocialHistories.SocHxTobaccoType,
      SocialHistories.SocHxTobaccoPacksPerDay,
      SocialHistories.SocHxTobaccoYears,
      SocialHistories.SocHxTobaccoQuitYear,
      SocialHistories.SocHxAlcohol,
      SocialHistories.SocHxOther,
      SocialHistories.SocHxAlcoholDrinksPerDay,
      SocialHistories.SocHxAlcoholYears,
      SocialHistories.SocHxAlcoholQuitYear,

      FamHistoryAbsentEvent.AbsentEventId,
      FamHistoryAbsentEvent.AbsentReason,
      FamHistoryDiagnosis.FamilyMemberId,

      ImagingAbsentEvent.AbsentEventId,
      ImagingAbsentEvent.AbsentReason,
      ImagingAny.DiagnosticId,

      ImagingCTScan.DiagnosticId,
      ImagingCTScan.DxDate,
      ImagingCTScan.DxDateText,
      ImagingCTScan.DxResult,
      ImagingCTScan.DxTarget,
      ImagingCTScan.DxTotalNumTumors,
      ImagingCTScan.DxInstitution,
      ImagingCTScan.DxNotes,

      ImagingMRI.DiagnosticId,
      ImagingMRI.DxDate,
      ImagingMRI.DxDateText,
      ImagingMRI.DxResult,
      ImagingMRI.DxTarget,
      ImagingMRI.DxTotalNumTumors,
      ImagingMRI.DxInstitution,
      ImagingMRI.DxNotes,

      ImagingOther_1.DiagnosticId,
      ImagingOther_1.DxType,
      ImagingOther_1.DxDateText,
      ImagingOther_1.DxResult,
      ImagingOther_1.DxTarget,
      ImagingOther_1.DxTotalNumTumors,
      ImagingOther_1.DxInstitution,
      ImagingOther_1.DxNotes,
      ImagingOther_2.DiagnosticId,
      ImagingOther_2.DxType,
      ImagingOther_2.DxDateText,
      ImagingOther_2.DxResult,
      ImagingOther_2.DxTarget,
      ImagingOther_2.DxTotalNumTumors,
      ImagingOther_2.DxInstitution,
      ImagingOther_2.DxNotes,
      ImagingOther_3.DiagnosticId,
      ImagingOther_3.DxType,
      ImagingOther_3.DxDateText,
      ImagingOther_3.DxResult,
      ImagingOther_3.DxTarget,
      ImagingOther_3.DxTotalNumTumors,
      ImagingOther_3.DxInstitution,
      ImagingOther_3.DxNotes,
      ImagingOther_4.DiagnosticId,
      ImagingOther_4.DxType,
      ImagingOther_4.DxDateText,
      ImagingOther_4.DxResult,
      ImagingOther_4.DxTarget,
      ImagingOther_4.DxTotalNumTumors,
      ImagingOther_4.DxInstitution,
      ImagingOther_4.DxNotes,
      ImagingOther_5.DiagnosticId,
      ImagingOther_5.DxType,
      ImagingOther_5.DxDateText,
      ImagingOther_5.DxResult,
      ImagingOther_5.DxTarget,
      ImagingOther_5.DxTotalNumTumors,
      ImagingOther_5.DxInstitution,
      ImagingOther_5.DxNotes,

      BiopsyProcedure.ProcedureId,
      BiopsyProcedure.ProcDate,
      BiopsyProcedure.ProcDateText,
      BiopsyProcedure.ProcName,
      BiopsyProcedure.ProcApproach,
      BiopsyProcedure.ProcNotes,

      PreOpLab_Platelets.LabTestId,
      PreOpLab_Platelets.LabDate,
      PreOpLab_Platelets.LabDateText,
      PreOpLab_Platelets.LabResult,
      PreOpLab_Platelets.LabUnits,
      PreOpLab_Platelets.LabNotes,

      PreOpLab_AFP.LabTestId,
      PreOpLab_AFP.LabDate,
      PreOpLab_AFP.LabDateText,
      PreOpLab_AFP.LabResult,
      PreOpLab_AFP.LabUnits,
      PreOpLab_AFP.LabNotes,

      PreOpLab_CEA.LabTestId,
      PreOpLab_CEA.LabDate,
      PreOpLab_CEA.LabDateText,
      PreOpLab_CEA.LabResult,
      PreOpLab_CEA.LabUnits,
      PreOpLab_CEA.LabNotes,

      PreOpLab_CA199.LabTestId,
      PreOpLab_CA199.LabDate,
      PreOpLab_CA199.LabDateText,
      PreOpLab_CA199.LabResult,
      PreOpLab_CA199.LabUnits,
      PreOpLab_CA199.LabNotes,

      PreOpLab_HepatitisB.LabTestId,
      PreOpLab_HepatitisB.LabDate,
      PreOpLab_HepatitisB.LabDateText,
      PreOpLab_HepatitisB.LabResult,
      PreOpLab_HepatitisB.LabUnits,
      PreOpLab_HepatitisB.LabNotes,

      ChildPughScore.SurveyId,
      ChildPughScore.SurveyDate,
      ChildPughScore.SurveyDateText,
      ChildPughScore.SurveyResult,
      ChildPughScore.SurveyTotal,
      ChildPughScore.SurveyNotes,

      InterventionalRad_TACE1.ProcedureId,
      InterventionalRad_TACE1.ProcDateText,
      InterventionalRad_TACE1.ProcSubsite,
      InterventionalRad_TACE1.ProcNotes,
      InterventionalRad_TACE2.ProcedureId,
      InterventionalRad_TACE2.ProcDateText,
      InterventionalRad_TACE2.ProcSubsite,
      InterventionalRad_TACE2.ProcNotes,
      InterventionalRad_TACE3.ProcedureId,
      InterventionalRad_TACE3.ProcDateText,
      InterventionalRad_TACE3.ProcSubsite,
      InterventionalRad_TACE3.ProcNotes,

      InterventionalRad_PVE1.ProcedureId,
      InterventionalRad_PVE1.ProcDateText,
      InterventionalRad_PVE1.ProcSubsite,
      InterventionalRad_PVE1.ProcNotes,
      InterventionalRad_PVE2.ProcedureId,
      InterventionalRad_PVE2.ProcDateText,
      InterventionalRad_PVE2.ProcSubsite,
      InterventionalRad_PVE2.ProcNotes,
      InterventionalRad_PVE3.ProcedureId,
      InterventionalRad_PVE3.ProcDateText,
      InterventionalRad_PVE3.ProcSubsite,
      InterventionalRad_PVE3.ProcNotes,

      InterventionalRad_RFA1.ProcedureId,
      InterventionalRad_RFA1.ProcDateText,
      InterventionalRad_RFA1.ProcSurgeon,
      InterventionalRad_RFA1.ProcSubsite,
      InterventionalRad_RFA1.ProcApproach,
      InterventionalRad_RFA1.ProcNotes,
      InterventionalRad_RFA2.ProcedureId,
      InterventionalRad_RFA2.ProcDateText,
      InterventionalRad_RFA2.ProcSurgeon,
      InterventionalRad_RFA2.ProcSubsite,
      InterventionalRad_RFA2.ProcApproach,
      InterventionalRad_RFA2.ProcNotes,
      InterventionalRad_RFA3.ProcedureId,
      InterventionalRad_RFA3.ProcDateText,
      InterventionalRad_RFA3.ProcSurgeon,
      InterventionalRad_RFA3.ProcSubsite,
      InterventionalRad_RFA3.ProcApproach,
      InterventionalRad_RFA3.ProcNotes,

      PrimaryProcedureAbsentEvent.AbsentEventId,
      PrimaryProcedureAbsentEvent.AbsentReason,

      PrimaryProcedure.ProcedureId,
      PrimaryProcedure.OperatingRoomDetailId,
      PrimaryProcedure.ProcDate,
      PrimaryProcedure.ProcDateText,
      PrimaryProcedure.ProcName,
      PrimaryProcedure.ProcApproach,
      PrimaryProcedure.ProcNotes,
      PrimaryProcedure.ProcDataSource,
      PrimaryProcedure.EnteredTime,

      OperatingRoomDetails.OpCaseSurgeon,
      OperatingRoomDetails.OpDuration,
      OperatingRoomDetails.OpRBC_Transfused,
      OperatingRoomDetails.OpNotes,
      OperatingRoomDetails.OpPostOpSummary,

      Hospitalizations.HospICUStay,
      Hospitalizations.HospDischargeDateText,
      Hospitalizations.HospInstitution,
      Hospitalizations.HospNotes,

      PostOpLab_INR.LabTestId,
      PostOpLab_INR.LabDate,
      PostOpLab_INR.LabDateText,
      PostOpLab_INR.LabResult,
      PostOpLab_INR.LabUnits,
      PostOpLab_INR.LabNotes,
      PostOpLab_TotalBilirubin.LabTestId,
      PostOpLab_TotalBilirubin.LabDate,
      PostOpLab_TotalBilirubin.LabDateText,
      PostOpLab_TotalBilirubin.LabResult,
      PostOpLab_TotalBilirubin.LabUnits,
      PostOpLab_TotalBilirubin.LabNotes,

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

      Pathology.PathologyId,
      PathologyAbsentEvent.AbsentEventId,
      PathologyAbsentEvent.AbsentReason,
      Pathology.PathDateText,
      Pathology.PathDate,
      Pathology.PathNum,
      Pathology.PathHistology,
      Pathology.PathNotes,
      LiverPath.PathVascularInv,
      LiverPath.PathMargin,
      LiverPath.PathClosestMarginDistance,
      LiverPath.PathTumorMaxDim,
      LiverPath.PathNumTotalTumors,

      PostOpMedTx_Sorafenib.MedicalTherapyId,
      PostOpMedTx_Sorafenib.MedTxDateText,
      PostOpMedTx_Sorafenib.MedTxDate,
      PostOpMedTx_Sorafenib.MedTxDose,
      PostOpMedTx_Sorafenib.MedTxUnits,
      PostOpMedTx_Sorafenib.MedTxStopDateText,
      PostOpMedTx_Sorafenib.MedTxStopDate,
      PostOpMedTx_Sorafenib.MedTxNotes,

      PostOpRadTx_1.RadiationTherapyId,
      PostOpRadTx_1.RadTxDateText,
      PostOpRadTx_1.RadTxDate,
      PostOpRadTx_1.RadTxType,
      PostOpRadTx_1.RadTxTarget,
      PostOpRadTx_1.RadTxTotalDose,
      PostOpRadTx_1.RadTxInstitution,
      PostOpRadTx_1.RadTxNotes,

      PostOpRadTx_2.RadiationTherapyId,
      PostOpRadTx_2.RadTxDateText,
      PostOpRadTx_2.RadTxDate,
      PostOpRadTx_2.RadTxType,
      PostOpRadTx_2.RadTxTarget,
      PostOpRadTx_2.RadTxTotalDose,
      PostOpRadTx_2.RadTxInstitution,
      PostOpRadTx_2.RadTxNotes,

      PostOpRadTx_3.RadiationTherapyId,
      PostOpRadTx_3.RadTxDateText,
      PostOpRadTx_3.RadTxDate,
      PostOpRadTx_3.RadTxType,
      PostOpRadTx_3.RadTxTarget,
      PostOpRadTx_3.RadTxTotalDose,
      PostOpRadTx_3.RadTxInstitution,
      PostOpRadTx_3.RadTxNotes,

      LastContactStatus.StatusId,
      LastContactStatus.StatusDateText,
      LastContactStatus.StatusDate,
      LastContactStatus.Status,
      LastContactStatus.StatusNotes,

      RecurrenceStatus.StatusId,
      RecurrenceStatus.StatusDateText,
      RecurrenceStatus.Status,
      RecurrenceStatus.StatusNotes,

      Patients.PtDeathDateText,
      Patients.PtDeathCause,
      Patients.PtDeathType

      ORDER BY PatientId, PrimaryProcedureDate
