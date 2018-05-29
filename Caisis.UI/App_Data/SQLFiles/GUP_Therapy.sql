---Report 1 GUP Theraputics Group
WITH CTE (ApptPatientId,ApptClinicDate, ApptTime, ApptVisitType, ApptPhysician)  AS
(

SELECT a.ApptPatientId, CONVERT(varchar(10),a.ApptClinicDate,101) ApptClinicDate,
ApptTime, ApptVisitType, a.ApptPhysician 
FROM Appointments a
WHERE a.AppointmentId IN -- Selecting the latest GU appointment based on GU Dept and Physician
(
SELECT TOP 1 (b.AppointmentId)
FROM Appointments b
WHERE a.ApptPatientId = b.ApptPatientId
AND b.ApptPhysician LIKE @ApptPhysician AND ApptDept LIKE '%GU%' AND
b.ApptClinicDate BETWEEN @FromDate AND @ToDate 
ORDER BY b.ApptClinicDate DESC
)
)


---CaseMix: Selecting all Patients with last Visit with GU Physician, Current Disease Status, Specific Medical Therapies, Current Medical therapy and Last 6 PSA's
SELECT  ApptClinicDate, CONVERT(Varchar(8), ApptTime, 108) AS ApptTime, ApptVisitType, 
	   ApptPhysician, PtMRN, PtFirstName, PtLastName, PtGender, Status, CancerDx, KPS, RRPDate,
	   CONVERT(varchar(10), RTDate, 101) RTDate,
	   Docetaxel, Abiraterone, MDV3100, Ketoconazole, Cabozantinib, Mitoxantrone, Casodex,
	   CASE WHEN HORM IS NULL THEN 'Naive' ELSE HORM END HORM,
	   CASE WHEN LHRH IS NULL THEN 'Naive' ELSE LHRH END LHRH, 
	   CASE WHEN IMMUNO IS NULL THEN 'Naive' ELSE IMMUNO END IMMUNO, 
	   CASE WHEN RADIO IS NULL THEN 'Naive' ELSE RADIO END RADIO,
	   CurrentTherapy, CurrentMedTxDate, PSADate1, PSA1, PSADate2,PSA2, PSADate3,PSA3, Bone, Liver, Lung, LymphNodes, Other, Pain
--For Patient MRN, First Name, Last Name
FROM 
(SELECT Patientid, PtMRN, ptfirstname, ptlastname, PtGender
FROM Patients
WHERE ptgender = 'Male') a INNER JOIN CTE b ON a.PatientId=b.ApptPatientId
LEFT OUTER JOIN
--Creating a query that pulls the last GU status (If any) of those GU patients.
(
SELECT PatientId, Status, StatusDate
FROM	Status a
WHERE a.StatusId IN
(
SELECT TOP 1 (StatusId) -- selecting the latest Status with the following GU Status terms
FROM Status
WHERE PatientId = a.PatientId AND Status IN
('Localized', 'Rising PSA Non-Castrate', 'Rising PSA Castrate', 'Clinical Mets Non-Castrate'
,'II. Clinically Localized Disease', 'III. Rising PSA', 'Clinical Mets Castrate',
'IV.Rising PSA, Castrate')
ORDER BY StatusDate DESC
)
) c ON b.ApptPatientId  = c.PatientId

--Pulling Diseases from Status fields. Comma Dilimitated
LEFT OUTER JOIN
(
	SELECT DISTINCT
		c.Patientid,
		'CancerDx' = substring(
							   (SELECT (', ' + StatusDisease)
                               FROM 
								(Select patientid, ISNULL(statusdisease, 'NULL') StatusDisease
								 From Status
								 GROUP BY Patientid, statusdisease
								 ) c2 
                               WHERE c.PatientId = c2.Patientid
                               ORDER BY Patientid ASC, StatusDate DESC
                               FOR XML PATH( '' )
                               )
                    ,3, 1000)
		FROM
			status c
)dis ON b.ApptPatientId = dis.Patientid

--Pulling Last KPS score and date
LEFT OUTER JOIN
(
	SELECT a.Patientid, MaxEncDate, EncKPS, CONVERT(varchar, MaxEncDate, 101) + ': ' + EncKPS as 'KPS'
	FROM
	Encounters a INNER JOIN
	(
		SELECT Patientid, Max(EncDate) MaxEncDate
		FROM Encounters
		WHERE EncKPS IS NOT NULL
		GROUP BY Patientid
	) b ON a.Patientid = b.Patientid and a.EncDate = b.MaxEncDate
	WHERE EncKPS IS NOT NULL

)kps ON b.ApptPatientid = kps.Patientid

--Creating a query that checks to see if the patient has ever had any of the following treatments. 
LEFT OUTER JOIN

(
SELECT a.PatientId, Docetaxel, Abiraterone, MDV3100, KetoConazole, Mitoxantrone, Cabozantinib, Casodex

FROM

(
	Patients a


	LEFT OUTER JOIN

	(  --All patients who've had Docetaxel
	
		SELECT DISTINCT
		c.Patientid,
		'Docetaxel' = substring(
							   (SELECT (', ' + MedTxAgent + ': '+ CONVERT(varchar,MedTxDate, 101) +
							    ' - ' + ISNULL(CONVERT(varchar, MedTxStopDate,101), 'NULL'))
                               FROM MedicalTherapy c2 
                               WHERE c.PatientId = c2.Patientid AND c.MaxMedTxDate = c2.MedTxDate AND
                               (MedTxAgent  LIKE '%Docetaxel%' OR MedTxAgent LIKE  '%Taxotere%')
                               ORDER BY Patientid ASC, MedTxDate ASC, MedTxStopDate ASC
                               FOR XML PATH( '' )
                               )
                    , 3, 1000)
		FROM
			(SELECT a.MedicalTherapyId, a.PatientId, MaxMedTxDate, MedTxStopDate, MedTxAgent
			FROM
				Medicaltherapy a 
				INNER JOIN
				(
					SELECT Patientid, Max(MedTxDate) MaxMedTxDate
					FROM MedicalTherapy
					WHERE MedTxAgent  LIKE '%Docetaxel%' OR MedTxAgent LIKE  '%Taxotere%'
					GROUP BY Patientid
				) b ON a.PatientId = b.PatientId AND a.MedTxDate = b.MaxMedTxDate
			WHERE MedTxAgent  LIKE '%Docetaxel%' OR MedTxAgent LIKE  '%Taxotere%'
	   ) c 
	)  b ON a.PatientId = b.PatientId

	LEFT OUTER JOIN

	( --All Patients who've had Abiraterone
		SELECT DISTINCT
		c.Patientid,
		'Abiraterone' = substring(
							   (SELECT (', ' + MedTxAgent + ': '+ CONVERT(varchar,MedTxDate, 101) +
							    ' - ' + ISNULL(CONVERT(varchar, MedTxStopDate,101), 'NULL'))
                               FROM MedicalTherapy c2 
                               WHERE c.PatientId = c2.Patientid AND c.MaxMedTxDate = c2.MedTxDate AND
                               (MedTxAgent LIKE '%abiraterone%' OR MedTxagent LIKE '%zytiga%' OR MedTxAgent LIKE '%CB7630%' )
                               ORDER BY Patientid ASC, MedTxDate ASC, MedTxStopDate ASC
                               FOR XML PATH( '' )
                               )
                    , 3, 1000)
		FROM
			(SELECT a.MedicalTherapyId, a.PatientId, MaxMedTxDate, MedTxStopDate, MedTxAgent
			FROM
				Medicaltherapy a 
				INNER JOIN
				(
					SELECT Patientid, Max(MedTxDate) MaxMedTxDate
					FROM MedicalTherapy
					WHERE MedTxAgent LIKE '%abiraterone%' OR MedTxagent LIKE '%zytiga%' OR MedTxAgent LIKE '%CB7630%' 
					GROUP BY Patientid
				) b ON a.PatientId = b.PatientId AND a.MedTxDate = b.MaxMedTxDate
			WHERE MedTxAgent LIKE '%abiraterone%' OR MedTxagent LIKE '%zytiga%' OR MedTxAgent LIKE '%CB7630%' 
	   ) c 
	) AS c ON a.PatientId = c.PatientId

	LEFT OUTER JOIN

	( --All patients with MDV3100
		SELECT DISTINCT
		c.Patientid,
		'MDV3100' = substring(
							   (SELECT (', ' + MedTxAgent + ': '+ CONVERT(varchar,MedTxDate, 101) +
							    ' - ' + ISNULL(CONVERT(varchar, MedTxStopDate,101), 'NULL'))
                               FROM MedicalTherapy c2 
                               WHERE c.PatientId = c2.Patientid AND c.MaxMedTxDate = c2.MedTxDate AND
                               (MedTxAgent LIKE '%MDV3100%' OR MedTxAgent LIKE'%Medivation%' OR 
								MedTxAgent LIKE '%Xtandi%' OR MedTxAgent LIKE '%Enzalutamide%')
                               ORDER BY Patientid ASC, MedTxDate ASC, MedTxStopDate ASC
                               FOR XML PATH( '' )
                               )
                    , 3, 1000)
		FROM
			(SELECT a.MedicalTherapyId, a.PatientId, MaxMedTxDate, MedTxStopDate, MedTxAgent
			FROM
				Medicaltherapy a 
				INNER JOIN
				(
					SELECT Patientid, Max(MedTxDate) MaxMedTxDate
					FROM MedicalTherapy
					WHERE MedTxAgent LIKE '%MDV3100%' OR MedTxAgent LIKE'%Medivation%' OR 
						  MedTxAgent LIKE '%Xtandi%' OR MedTxAgent LIKE '%Enzalutamide%'
					GROUP BY Patientid
				) b ON a.PatientId = b.PatientId AND a.MedTxDate = b.MaxMedTxDate
			WHERE MedTxAgent LIKE '%MDV3100%' OR MedTxAgent LIKE'%Medivation%' OR 
				  MedTxAgent LIKE '%Xtandi%' OR MedTxAgent LIKE '%Enzalutamide%' 
	   ) c 
	) AS d ON a.PatientId = d.PatientId


	LEFT OUTER JOIN

	( --All patients who've had Ketoconazole
		SELECT DISTINCT
		c.Patientid,
		'Ketoconazole' = substring(
							   (SELECT (', ' + MedTxAgent + ': '+ CONVERT(varchar,MedTxDate, 101) +
							    ' - ' + ISNULL(CONVERT(varchar, MedTxStopDate,101), 'NULL'))
                               FROM MedicalTherapy c2 
                               WHERE c.PatientId = c2.Patientid AND c.MaxMedTxDate = c2.MedTxDate AND
                               (MedTxAgent LIKE '%Ketoconazole%' OR MedTxAgent LIKE '%Keto%'OR MedTxAgent LIKE '%Nizoral%')
                               ORDER BY Patientid ASC, MedTxDate ASC, MedTxStopDate ASC
                               FOR XML PATH( '' )
                               )
                    , 3, 1000)
		FROM
			(SELECT a.MedicalTherapyId, a.PatientId, MaxMedTxDate, MedTxStopDate, MedTxAgent
			FROM
				Medicaltherapy a 
				INNER JOIN
				(
					SELECT Patientid, Max(MedTxDate) MaxMedTxDate
					FROM MedicalTherapy
					WHERE MedTxAgent LIKE '%Ketoconazole%' OR MedTxAgent LIKE '%Keto%'OR MedTxAgent LIKE '%Nizoral%'
					GROUP BY Patientid
				) b ON a.PatientId = b.PatientId AND a.MedTxDate = b.MaxMedTxDate
			WHERE MedTxAgent LIKE '%Ketoconazole%' OR MedTxAgent LIKE '%Keto%'OR MedTxAgent LIKE '%Nizoral%'
	   ) c 			
	) AS f ON a.PatientId = f.PatientId

	LEFT OUTER JOIN

	( --All patients who've had MitoxantroneTx
		SELECT DISTINCT
		c.Patientid,
		'Mitoxantrone' = substring(
							   (SELECT (', ' + MedTxAgent + ': '+ CONVERT(varchar,MedTxDate, 101) +
							    ' - ' + ISNULL(CONVERT(varchar, MedTxStopDate,101), 'NULL'))
                               FROM MedicalTherapy c2 
                               WHERE c.PatientId = c2.Patientid AND c.MaxMedTxDate = c2.MedTxDate AND
                               (MedTxAgent LIKE '%Mitoxantrone%' OR MedTxAgent LIKE '%Novantrone%')
                               ORDER BY Patientid ASC, MedTxDate ASC, MedTxStopDate ASC
                               FOR XML PATH( '' )
                               )
                    , 3, 1000)
		FROM
			(SELECT a.MedicalTherapyId, a.PatientId, MaxMedTxDate, MedTxStopDate, MedTxAgent
			FROM
				Medicaltherapy a 
				INNER JOIN
				(
					SELECT Patientid, Max(MedTxDate) MaxMedTxDate
					FROM MedicalTherapy
					WHERE MedTxAgent LIKE '%Mitoxantrone%' OR MedTxAgent LIKE '%Novantrone%'
					GROUP BY Patientid
				) b ON a.PatientId = b.PatientId AND a.MedTxDate = b.MaxMedTxDate
			WHERE MedTxAgent LIKE '%Mitoxantrone%' OR MedTxAgent LIKE '%Novantrone%'
	   ) c 		
	) AS g ON a.PatientId = g.PatientId

	LEFT OUTER JOIN

	( --All patients who've had Cabozantinib
		SELECT DISTINCT
		c.Patientid,
		'Cabozantinib' = substring(
							   (SELECT (', ' + MedTxAgent + ': '+ CONVERT(varchar,MedTxDate, 101) +
							    ' - ' + ISNULL(CONVERT(varchar, MedTxStopDate,101), 'NULL'))
                               FROM MedicalTherapy c2 
                               WHERE c.PatientId = c2.Patientid AND c.MaxMedTxDate = c2.MedTxDate AND
                               (MedTxAgent LIKE '%Cabozantinib%' OR MedTxAgent LIKE '%xl184%')
                               ORDER BY Patientid ASC, MedTxDate ASC, MedTxStopDate ASC
                               FOR XML PATH( '' )
                               )
                    , 3, 1000)
		FROM
			(SELECT a.MedicalTherapyId, a.PatientId, MaxMedTxDate, MedTxStopDate, MedTxAgent
			FROM
				Medicaltherapy a 
				INNER JOIN
				(
					SELECT Patientid, Max(MedTxDate) MaxMedTxDate
					FROM MedicalTherapy
					WHERE MedTxAgent LIKE '%Cabozantinib%' OR MedTxAgent LIKE '%xl184%'
					GROUP BY Patientid
				) b ON a.PatientId = b.PatientId AND a.MedTxDate = b.MaxMedTxDate
			WHERE MedTxAgent LIKE '%Cabozantinib%' OR MedTxAgent LIKE '%xl184%'
	   ) c 	
	) AS h ON a.PatientId = h.PatientId

	LEFT OUTER JOIN

	( --All patients who've had Casodex
		SELECT DISTINCT
		c.Patientid,
		'Casodex' = substring(
							   (SELECT (', ' + MedTxAgent + ': '+ CONVERT(varchar,MedTxDate, 101) +
							    ' - ' + ISNULL(CONVERT(varchar, MedTxStopDate,101), 'NULL'))
                               FROM MedicalTherapy c2 
                               WHERE c.PatientId = c2.Patientid AND c.MaxMedTxDate = c2.MedTxDate AND
                               (MedTxAgent LIKE '%Casodex%')
                               ORDER BY Patientid ASC, MedTxDate ASC, MedTxStopDate ASC
                               FOR XML PATH( '' )
                               )
                    , 3, 1000)
		FROM
			(SELECT a.MedicalTherapyId, a.PatientId, MaxMedTxDate, MedTxStopDate, MedTxAgent
			FROM
				Medicaltherapy a 
				INNER JOIN
				(
					SELECT Patientid, Max(MedTxDate) MaxMedTxDate
					FROM MedicalTherapy
					WHERE MedTxAgent LIKE '%Casodex%'
					GROUP BY Patientid
				) b ON a.PatientId = b.PatientId AND a.MedTxDate = b.MaxMedTxDate
			WHERE MedTxAgent LIKE '%Casodex%'
	   ) c 		
	) AS i ON a.PatientId = i.PatientId

)
GROUP BY a.PatientId, c.PatientId, d.PatientId, f.PatientId,
g.PatientId, h.patientid, i.PatientId, Docetaxel, Abiraterone, MDV3100, KetoConazole, Mitoxantrone, Cabozantinib, Casodex

)d

ON b.ApptPatientId = d.PatientId

--Pulling Last Medical Therapy That is either a HORM or AA.
LEFT OUTER JOIN
(
	SELECT DISTINCT
		c.Patientid,
		'HORM' = substring(
							   (SELECT (', ' + MedTxType + ': '+ ISNULL(MedTxAgent, 'NULL') + ': '+ CONVERT(varchar,MedTxDate, 101) +
							    ' - ' + ISNULL(CONVERT(varchar, MedTxStopDate,101), 'NULL'))
                               FROM MedicalTherapy c2 
                               WHERE c.PatientId = c2.Patientid AND c.MaxMedTxDate = c2.MedTxDate AND
                               (MedTxType IN ('HORM', 'AA'))
                               ORDER BY Patientid ASC, MedTxDate ASC, MedTxStopDate ASC
                               FOR XML PATH( '' )
                               )
                    , 3, 1000)
		FROM
			(SELECT a.MedicalTherapyId, a.PatientId, MaxMedTxDate, MedTxStopDate, MedTxAgent
			FROM
				Medicaltherapy a 
				INNER JOIN
				(
					SELECT Patientid, Max(MedTxDate) MaxMedTxDate
					FROM MedicalTherapy
					WHERE MedTxType IN ('HORM', 'AA')
					GROUP BY Patientid
				) b ON a.PatientId = b.PatientId AND a.MedTxDate = b.MaxMedTxDate
			WHERE MedTxType IN ('HORM', 'AA')
	   ) c 
) HORM ON b.ApptPatientId = HORM.Patientid

--Pulling Prior LHRH Patients
LEFT OUTER JOIN
(
	SELECT DISTINCT
		c.Patientid,
		'LHRH' = substring(
							   (SELECT (', ' + MedTxType + ': '+ ISNULL(MedTxAgent, 'NULL') + ': '+ CONVERT(varchar,MedTxDate, 101) +
							    ' - ' + ISNULL(CONVERT(varchar, MedTxStopDate,101), 'NULL'))
                               FROM MedicalTherapy c2 
                               WHERE c.PatientId = c2.Patientid AND c.MaxMedTxDate = c2.MedTxDate AND
                               (MedTxType IN ('LHRH'))
                               ORDER BY Patientid ASC, MedTxDate ASC, MedTxStopDate ASC
                               FOR XML PATH( '' )
                               )
                    , 3, 1000)
		FROM
			(SELECT a.MedicalTherapyId, a.PatientId, MaxMedTxDate, MedTxStopDate, MedTxAgent
			FROM
				Medicaltherapy a 
				INNER JOIN
				(
					SELECT Patientid, Max(MedTxDate) MaxMedTxDate
					FROM MedicalTherapy
					WHERE MedTxType IN ('LHRH')
					GROUP BY Patientid
				) b ON a.PatientId = b.PatientId AND a.MedTxDate = b.MaxMedTxDate
			WHERE MedTxType IN ('LHRH')
	   ) c 		
) LHRH ON b.ApptPatientid = LHRH.Patientid

--Pulling all Prior IMMUNO therapies
LEFT OUTER JOIN
(
	SELECT DISTINCT
		c.Patientid,
		'IMMUNO' = substring(
							   (SELECT (', ' + MedTxType + ': '+ ISNULL(MedTxAgent, 'NULL') + ': '+ CONVERT(varchar,MedTxDate, 101) +
							    ' - ' + ISNULL(CONVERT(varchar, MedTxStopDate,101), 'NULL'))
                               FROM MedicalTherapy c2 
                               WHERE c.PatientId = c2.Patientid AND c.MaxMedTxDate = c2.MedTxDate AND
                               (MedTxType IN ('IMMUNO'))
                               ORDER BY Patientid ASC, MedTxDate ASC, MedTxStopDate ASC
                               FOR XML PATH( '' )
                               )
                    , 3, 1000)
		FROM
			(SELECT a.MedicalTherapyId, a.PatientId, MaxMedTxDate, MedTxStopDate, MedTxAgent
			FROM
				Medicaltherapy a 
				INNER JOIN
				(
					SELECT Patientid, Max(MedTxDate) MaxMedTxDate
					FROM MedicalTherapy
					WHERE MedTxType IN ('IMMUNO')
					GROUP BY Patientid
				) b ON a.PatientId = b.PatientId AND a.MedTxDate = b.MaxMedTxDate
			WHERE MedTxType IN ('IMMUNO')
	   ) c 
) IMMUNO ON b.ApptPatientid = immuno.Patientid


--Pulling last prior RadioIsotope
LEFT OUTER JOIN
(
	SELECT DISTINCT
		c.Patientid,
		'Radio' = substring(
							   (SELECT (', ' + MedTxType + ': '+ ISNULL(MedTxAgent, 'NULL') + ': '+ CONVERT(varchar,MedTxDate, 101) +
							    ' - ' + ISNULL(CONVERT(varchar, MedTxStopDate,101), 'NULL'))
                               FROM MedicalTherapy c2 
                               WHERE c.PatientId = c2.Patientid AND c.MaxMedTxDate = c2.MedTxDate AND
                               (MedTxType IN ('Radioisotope'))
                               ORDER BY Patientid ASC, MedTxDate ASC, MedTxStopDate ASC
                               FOR XML PATH( '' )
                               )
                    , 3, 1000)
		FROM
			(SELECT a.MedicalTherapyId, a.PatientId, MaxMedTxDate, MedTxStopDate, MedTxAgent
			FROM
				Medicaltherapy a 
				INNER JOIN
				(
					SELECT Patientid, Max(MedTxDate) MaxMedTxDate
					FROM MedicalTherapy
					WHERE MedTxType IN ('Radioisotope')
					GROUP BY Patientid
				) b ON a.PatientId = b.PatientId AND a.MedTxDate = b.MaxMedTxDate
			WHERE MedTxType IN ('Radioisotope')
	   ) c 
) radio on b.apptpatientid = radio.patientid

--marking all patients who've had a Prostatectomy operation
LEFT OUTER JOIN
(
	SELECT PatientId, (CASE WHEN PatientId IS NULL THEN '' ELSE 'YES' END) 'RRP', max(procdatetext) 'RRPDate'  
	FROM Procedures
	WHERE ProcName IN  ('LP', 'RP', 'RRP', 'CP', 'SALVRP', 'RALP') OR Procname LIKE ('%Prostat%'+'%tomy')
	GROUP BY Patientid

) RRP ON b.ApptPatientId = RRP.PatientId

--Marking all patients who've had Radiation Therapy

LEFT OUTER JOIN
(
	SELECT PatientId, (CASE WHEN PatientId IS NULL THEN '' ELSE 'YES' END) RT, max(RadTxDate) 'RTDate'
	FROM RadiationTherapy
	GROUP BY Patientid
)RT ON b.ApptPatientid = RT.PatientId


LEFT OUTER JOIN 
--Pulling the last Medical therapy treatment. A 'CurrentTherapy' column was created that includes cases where there were multiple treatments on the same day.
(
	SELECT MC.PatientId, 'CurrentMedTxDate'=MaxDA.MaxId, MC.CurrentTherapy
	FROM
	( -- Selecting Latest Medical Therapy Date
		SELECT MaxDate.PatientId, MaxDate.MaxId, Agents.MedTxAgent
		FROM
			(
				SELECT CONVERT(varchar(50),MAX(a.MedTxDate),101) MaxId, PatientId
				FROM MedicalTherapy a
				WHERE MedTxType NOT IN ('LHRH', 'Bisphosphonates', 'Steroid') AND MedTxStopDate IS NULL
				GROUP BY PatientId
			) AS MaxDate
			INNER JOIN
			( -- Selecting the Agent associated with the latest Therapy Date
				SELECT MedTxAgent, MedTxDate, PatientId
				FROM MedicalTherapy
				WHERE MedTxType NOT IN ('LHRH', 'Bisphosphonates', 'Steroid')
			) AS Agents	ON MaxDate.MaxId = Agents.MedTxDate

	) MaxDA

	INNER JOIN
	( ---Pulls all Therapies. In cases where there are multiple (up to 7) therapies on the same day the therapies are brought over into one column (CurrentTherapy) and are delimited by a comma
		SELECT a.PatientId, 'CurrentTherapyDate'= MT.MedTxDate,
		'CurrentTherapy'=
		MAX(CASE rowno WHEN 1 THEN MT.MedTxAgent END) +
		coalesce(MAX(CASE MT.rowno WHEN 2 THEN ', ' + MT.MedTxAgent END), '') +
		coalesce(MAX(CASE MT.rowno WHEN 3 THEN ', ' + MT.MedTxAgent END), '') +
		coalesce(MAX(CASE MT.rowno WHEN 4 THEN ', ' + MT.MedTxAgent END), '') +
		coalesce(MAX(CASE MT.rowno WHEN 5 THEN ', ' + MT.MedTxAgent END), '') +
		coalesce(MAX(CASE MT.rowno WHEN 6 THEN ', ' + MT.MedTxAgent END), '') +
		coalesce(MAX(CASE MT.rowno WHEN 7 THEN ', ' + MT.MedTxAgent END), '')
		FROM	MedicalTherapy a
		INNER JOIN
		(
			SELECT PatientId, MedTxAgent, MedTxDate,
			rowno = (SELECT COUNT(*)
					FROM MedicalTherapy b
					WHERE b.PatientId = a.PatientId AND b.MedTxDate = a.MedTxDate
					AND MedTxType NOT IN ('LHRH')
					AND b.MedTxAgent <= a.MedTxAgent
					)
			FROM MedicalTherapy a
			) AS MT
			ON a.PatientId = MT.PatientId
			WHERE MT.MedTxAgent IS NOT NULL AND MT.MedTxDate IS NOT NULL AND MedTxType NOT IN ('LHRH')
			GROUP BY MT.PatientId, MT.MedTxDate, a.PatientId

		) AS MC ON MaxDA.MaxId = MC.CurrentTherapyDate AND MaxDA.PatientId = MC.PatientID
		GROUP BY MC.PatientId, MaxDA.MaxId, MC.CurrentTherapy
) e
ON b.ApptPatientId = e.PatientId

LEFT OUTER JOIN
--Pulling the last three PSA Lab dates and results for each patient.

(
	SELECT PatientId,
	[1] PSADate1,[2] PSA1, [3] PSADate2, [4] PSA2, 
	[5] PSADate3,[6] PSA3
	FROM 
	--Wish to Pivot on two columns so unpivot lab table first
	 (
		SELECT a.PatientId,ItemValue,
		--6labitems total 3 results + 3 dates = 6 NTILE
		NTILE(6) OVER(PARTITION BY PatientId ORDER BY RowRank DESC) AS 'RowRank'
		FROM 
		(
		--Unpack the lab table ie. Unpivot the table.
			SELECT PatientId,LabItem,ItemValue,RowRank,
			--use this to force the final sort order before unpacking
			ROW_NUMBER() OVER(ORDER BY PatientId,RowRank) AS 'RowNumber'
			FROM 
			(
				SELECT PatientId,CONVERT(varchar(50),b.LabDate,101) LabDate, LabResult,RowRank
				FROM (
						SELECT PatientId, LabDate, LabResult,RowNumber,
						--add the grouping
						RANK() OVER(PARTITION BY PatientId ORDER BY RowNumber DESC) AS 'RowRank' 
						FROM	(
									SELECT LabTestId,c.PatientId,LabDate,LabResult,
									  ROW_NUMBER() OVER(ORDER BY c.PatientId,LabDate) AS 'RowNumber'
									FROM LabTests c 
									WHERE LabTest = 'PSA' AND LabResult IS NOT NULL AND LabDate IS NOT NULL 
								) a
					  ) b
				WHERE RowRank <=3
			) a
			UNPIVOT
			(ItemValue FOR LabItem IN (LabDate,LabResult))AS UnPivotTable
		) a 
	) AS SourceTable
	PIVOT
	(
		MIN (ItemValue)
		FOR RowRank IN ([1],[2],[3],[4],[5],[6])
	) AS PivotTable
) g ON b.ApptPatientId = g.PatientId

--Pulling Pain information from Encounter Exams
LEFT OUTER JOIN
(
	SELECT x.Patientid, MaxEncDate, y.EncounterId, z.ROS_System, z.ROS_Symptom, z.ROS_Notes,
ROS_System + ', Symptom: '+ ROS_Symptom  + ', Notes: ' + ROS_Notes as 'FullPain', 'Pain Score: '+ ROS_Notes as 'Pain' 
FROM
(
	Select Distinct a.Patientid, MaxEncDate, EncType, EncChiefComplaint, EncPhysician
	FROM
	(
		Select Patientid, Max(EncDate) MaxEncDate 
		FROM Encounters a INNER JOIN EncReviewOfSystems b ON a.EncounterId = b.EncounterId
		GROUP BY Patientid
	) a INNER JOIN Encounters b On a.MaxEncDate = b.EncDate AND a.Patientid = b.Patientid
	INNER JOIN EncReviewOfSystems c ON b.EncounterId = c.EncounterId
	WHERE ROS_System = 'Pain' AND ROS_Symptom = 'Pain Score'
) x INNER JOIN Encounters y ON x.Patientid = y.Patientid AND x.MaxEncDate = y.EncDate 
	AND x.EncType = y.EncType AND x.EncChiefComplaint = y.EncChiefComplaint AND x.EncPhysician = y.EncPhysician
INNER JOIN EncReviewOfSystems z ON y.EncounterId = z.EncounterId
WHERE ROS_System = 'Pain' AND ROS_Symptom = 'Pain Score'

)PN ON b.ApptPatientid = pn.Patientid

--Getting Survey Disease Sites
LEFT OUTER JOIN
(
		SELECT DISTINCT a.Patientid, 
				  b.SurveyItemResult as 'Bone',
				  c.SurveyItemResult as 'Liver',
				  d.SurveyItemResult as 'Lung',
				  e.SurveyItemResult as 'LymphNodes',
				  f.Site as 'Other'
FROM
Surveys a 

LEFT OUTER JOIN
--Selecting Patients with Bone Site
(
	SELECT DISTINCT a.Patientid, SurveyItem, SurveyItemResult
	FROM Surveys a INNER JOIN SurveyItems b ON a.Surveyid = b.Surveyid
		  INNER JOIN (
					SELECT PatientId, Max(SurveyDate)MaxSurveyDate
					FROM Surveys a INNER JOIN SurveyItems b ON a.Surveyid = b.Surveyid
					WHERE SurveyType = 'Prostate Sites of Disease' AND SurveyItem = 'Bone' AND SurveyItemResult IN ('Absent', 'Present')
					GROUP BY Patientid
				) c ON a.SurveyDate = c.MaxSurveyDate and a.Patientid = c.Patientid
	WHERE SurveyType = 'Prostate Sites of Disease' AND SurveyItem = 'Bone'
) b ON a.Patientid = b.Patientid

LEFT OUTER JOIN
--Selecting pts with Live site
(
	SELECT DISTINCT a.Patientid, SurveyItem, SurveyItemResult
	FROM Surveys a INNER JOIN SurveyItems b ON a.Surveyid = b.Surveyid
		  INNER JOIN (
					SELECT PatientId, Max(SurveyDate)MaxSurveyDate
					FROM Surveys a INNER JOIN SurveyItems b ON a.Surveyid = b.Surveyid
					WHERE SurveyType = 'Prostate Sites of Disease' AND SurveyItem = 'Liver' AND SurveyItemResult IN ('Absent', 'Present')
					GROUP BY Patientid
				) c ON a.SurveyDate = c.MaxSurveyDate and a.Patientid = c.Patientid
	WHERE SurveyType = 'Prostate Sites of Disease' AND SurveyItem = 'Liver'
)c ON a.PatientId = c.Patientid

LEFT OUTER JOIN
--Selecting pts with Lung Site
(
	SELECT DISTINCT a.Patientid, SurveyItem, SurveyItemResult
	FROM Surveys a INNER JOIN SurveyItems b ON a.Surveyid = b.Surveyid
		  INNER JOIN (
					SELECT PatientId, Max(SurveyDate)MaxSurveyDate
					FROM Surveys a INNER JOIN SurveyItems b ON a.Surveyid = b.Surveyid
					WHERE SurveyType = 'Prostate Sites of Disease' AND SurveyItem = 'Lung' AND SurveyItemResult IN ('Absent', 'Present')
					GROUP BY Patientid
				) c ON a.SurveyDate = c.MaxSurveyDate and a.Patientid = c.Patientid
	WHERE SurveyType = 'Prostate Sites of Disease' AND SurveyItem = 'Lung'
)d ON a.Patientid = d.Patientid

LEFT OUTER JOIN
--Selecting pts with LN site
(
	SELECT DISTINCT a.Patientid, SurveyItem, SurveyItemResult
	FROM Surveys a INNER JOIN SurveyItems b ON a.Surveyid = b.Surveyid
			INNER JOIN (
					SELECT PatientId, Max(SurveyDate)MaxSurveyDate
					FROM Surveys a INNER JOIN SurveyItems b ON a.Surveyid = b.Surveyid
					WHERE SurveyType = 'Prostate Sites of Disease' AND SurveyItem = 'Lymph Nodes' AND SurveyItemResult IN ('Absent', 'Present')
					GROUP BY Patientid
				) c ON a.SurveyDate = c.MaxSurveyDate and a.Patientid = c.Patientid
	WHERE SurveyType = 'Prostate Sites of Disease' AND SurveyItem = 'Lymph Nodes'
) e ON a.Patientid = e.Patientid

LEFT OUTER JOIN
--Selecting pts with all other sites
(
	SELECT DISTINCT Patientid,
						STUFF(
						(SELECT DISTINCT ', ' + SurveyItem + ': '+ SurveyItemResult
						FROM SurveyItems s INNER JOIN Surveys x ON s.surveyid = x.surveyid
						WHERE a.patientid = x.patientid AND SurveyItem IN ('Local Disease', 'Prostatic Mass', 'Soft Tissue') AND SurveyItemResult = 'Present'
						FOR XML PATH('')), 1, 1, '') AS 'Site'
	FROM Surveys a 
	WHERE SurveyType = 'Prostate Sites of Disease' 
)f ON a.Patientid = f.Patientid

WHERE a.SurveyType = 'Prostate Sites of Disease'
)Sts ON b.ApptPatientid = sts.Patientid

GROUP BY ApptClinicDate, ApptPhysician, PtMRN, PtFirstName, PtLastName, [Status], CancerDx, KPS,
		RRPDate, RTDate, Docetaxel, Abiraterone, MDV3100, Ketoconazole, Cabozantinib,
	   Mitoxantrone, Casodex, Horm, Lhrh, immuno, radio, CurrentTherapy, CurrentMedTxDate, 
	   PSADate1, PSA1, PSADate2,PSA2, PSADate3,PSA3, PtGender, ApptTime, ApptVisitType, Bone, Liver, Lung, LymphNodes, Other, Pain

ORDER BY CAST(ApptClinicDate as datetime), ApptTime, PTMRN
