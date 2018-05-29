WITH NumericPSAs_CTE (LabTestId, PatientId, LabDate, LabResult)
				AS
				(
					SELECT 
						LabTestId, 
						PatientId, 
						LabDate,
						CASE WHEN IsNumeric(LabResult) = 1 AND LabResult NOT LIKE '%^[0123456789.]%'
							THEN Convert(float, LabResult)
							ELSE 0
						END 
					FROM LabTests
					WHERE LabDate IS NOT NULL
					AND LabTest = 'PSA'
					AND LabResult IS NOT NULL
				)

				SELECT
					Patients.PatientId,
					DATEDIFF(year, Patients.PtBirthDate, GETDATE()) AS Age,
					Procedures.ProcDate,
					Procedures.ProcDateText AS RPDate,
					MIN(MedicalTherapy.MedTxDate) as FirstHormDate,
					MIN(RadiationTherapy.RadTxDate) as FirstXRTDate,
					CASE
						WHEN MIN(MedicalTherapy.MedTxDate) > Procedures.ProcDate THEN 'Yes'
						ELSE 'No'
					END AS PostRPHormones,
					CASE
						WHEN MIN(RadiationTherapy.RadTxDate) > Procedures.ProcDate THEN 'Yes'
						ELSE 'No'
					END AS PostRPRadiotherapy, 
						LabTests.LabResult AS PSA,
					LabTests.LabDateText AS PSADate,
					BCR.LabResult AS BCR_PSA,
					BCR.LabDateText AS BCR_Date,
						PP.PathGG1,
						PP.PathGG2,
						PP.PathMargin as Margin,
						PP.PathSV_Inv as SVI,
						PP.PathExtension as ECE,
						Pathology.PathResult as LNI,
					ProstatectomyProc.ProcL_NVB_Status,
					ProstatectomyProc.ProcR_NVB_Status,
					CASE
						WHEN ProstatectomyProc.ProcL_NVB_Status IN ('Preserved', 'Possible damage') AND
							 ProstatectomyProc.ProcR_NVB_Status IN ('Preserved', 'Possible damage')
						THEN 'Yes'
						ELSE 'No'
					END AS BilateralNerveSparing,
					(
						SELECT Comorbidity + ','
						FROM Comorbidities
						WHERE PatientId = Patients.PatientId
						FOR XML PATH('')
					) AS PatientComorbidities,
					SD.SurveyDate,
					SD.SurveyDateText AS RP_QOL_SurveyDate,
					SD.SurveyType,
					CASE 
						WHEN COUNT(SexualItems.SurveyItemId) > 0 THEN
							(SUM(CONVERT(int, SexualItems.SurveyItemResult)) / CONVERT(float, COUNT(SexualItems.SurveyItemId))) * 6
						ELSE NULL
					END AS EF_Score,
					CASE
						WHEN COUNT(UrinaryItems.SurveyItemId) > 0 THEN
							(SUM(CONVERT(int, UrinaryItems.SurveyItemResult)) / CONVERT(float, COUNT(UrinaryItems.SurveyItemId))) * 5
						ELSE NULL
					END AS UF_Score
				FROM
					Patients
						INNER JOIN Procedures
							ON Patients.PatientId = Procedures.PatientId

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
									INNER JOIN SurveyItems SIA ON SA.SurveyId = SIA.SurveyId
								WHERE SA.PatientId = Procedures.PatientId
								AND SA.SurveyDate >= Procedures.ProcDate
								AND SA.SurveyType = 'Prostate QOL Survey'
								AND SIA.SurveyItemNum = '16'
								AND (SIA.SurveyItemResult = 'No' OR SIA.SurveyItemResult IS NULL) -- physician assessed
								ORDER BY SA.SurveyDate DESC
							)
							AND SexualItems.SurveyItemNum IN ('2', '3', '4', '5', '6', '7')
							AND IsNumeric(SexualItems.SurveyItemResult) = 1
							AND SexualItems.SurveyItemResult NOT LIKE '%^[0123456789]%'

						LEFT OUTER JOIN SurveyItems UrinaryItems
							ON SexualItems.SurveyId = UrinaryItems.SurveyId
							AND UrinaryItems.SurveyItemNum IN ('8', '9', '10', '11', '12')
							AND IsNumeric(UrinaryItems.SurveyItemResult) = 1
							AND UrinaryItems.SurveyItemResult NOT LIKE '%^[0123456789]%'
							
						LEFT OUTER JOIN Surveys SD
							ON Sexualitems.SurveyId = SD.SurveyId

						LEFT OUTER JOIN LabTests
								ON Procedures.PatientId = LabTests.PatientId
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

						LEFT OUTER JOIN LabTests BCR
							ON Procedures.PatientId = BCR.PatientId
							AND BCR.LabTestId =
							(
								SELECT TOP 1 LabTestId
								FROM NumericPSAs_CTE _bcr
								WHERE _bcr.PatientId = Procedures.PatientId
								AND _bcr.LabDate > Procedures.ProcDate
								AND _bcr.LabResult >= .2
								AND _bcr.LabResult >
								(
									SELECT TOP 1 LabResult
									FROM NumericPSAs_CTE
									WHERE PatientId = Procedures.PatientId
									AND LabDate < _bcr.LabDate
									ORDER BY LabDate DESC
								)
								ORDER BY _bcr.LabDate ASC
							)

						LEFT OUTER JOIN ProstatectomyProc
							ON Procedures.ProcedureId = ProstatectomyProc.ProcedureId

						LEFT OUTER JOIN Procedures PLND
							ON Procedures.PatientId = PLND.PatientId
							AND PLND.ProcName = 'PLND'

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

						LEFT OUTER JOIN MedicalTherapy
								ON Procedures.PatientId = MedicalTherapy.PatientId
								AND ((MedicalTherapy.MedTxType LIKE '%HORM%')
										OR (MedicalTherapy.MedTxType = 'ORCH')
										OR (MedicalTherapy.MedTxType ='Bilateral Orchiectomy')
										OR (MedicalTherapy.MedTxType LIKE 'ORCH_BIL%')
										OR (MedicalTherapy.MedTxType LIKE '%LHRH%')
										OR (MedicalTherapy.MedTxType LIKE '%AA%')
										OR (MedicalTherapy.MedTxType LIKE '%ESTROGEN%')
										OR (MedicalTherapy.MedTxType LIKE '%PROGEST%'))
										AND (MedicalTherapy.MedTxType NOT LIKE '%STOP')

						LEFT OUTER JOIN RadiationTherapy
								ON Procedures.PatientId = RadiationTherapy.PatientId
								AND RadiationTherapy.RadTxType
										IN ('XRT','EBRT','RT','COMBO','BRACHY','COMBO','RADIOISOTOPE','SEED','IMPLANT','Brachytherapy',
											'External Beam','Radiation Therapy, Unspecified','External Beam, IMRT',
											'High-Dose Rate Brachytherapy','External Beam, 3D Conventional','External Beam, 3D Conformal')

				WHERE
						Procedures.ProcName IN ('CP','LP','LP_CONV','PP','RALP','RP','SalvCP','SalvLP','SalvRP')
						AND Procedures.ProcDate BETWEEN @FromDate AND @ToDate
					
				GROUP BY
					Patients.PatientId, Patients.PtBirthDate,
					Procedures.ProcDate, Procedures.ProcDateText,
					LabTests.LabDateText, LabTests.LabResult, BCR.LabDateText, BCR.LabResult,
					PP.PathGG1, PP.PathGG2, 
						PP.PathMargin, PP.PathSV_Inv, PP.PathExtension, Pathology.PathResult,
					ProstatectomyProc.ProcL_NVB_Status, ProstatectomyProc.ProcR_NVB_Status,
					SD.SurveyDate,SD.SurveyDateText,SD.SurveyType

				ORDER BY Procedures.ProcDate DESC, Patients.PatientId