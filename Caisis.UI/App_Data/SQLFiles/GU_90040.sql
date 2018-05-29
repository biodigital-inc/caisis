---Report 2 - 90040 Team
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
	   ApptPhysician, PtMRN, PtFirstName, PtLastName, PtGender, Status, Abiraterone, MDV3100, 
	   CurrentTherapy, CurrentMedTxDate, [90_040Consent], ConsentDate,
	   CTCDate1, CTC1, CTCDate2, CTC2, CTCDate3,CTC3, PSADate1, PSA1, PSADate2,PSA2, PSADate3,PSA3,
	  CEADate1, CEA1, CEADate2, CEA2, CEADate3, CEA3
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

--Creating a query that checks to see if the patient has ever had any of the following treatments. 
LEFT OUTER JOIN

(
SELECT a.PatientId, MDV3100, Abiraterone

FROM

(
	Patients a
	
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

	( --All patients who've had Abiraterone
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
	) AS f ON a.PatientId = f.PatientId

	
--) AS i ON a.PatientId = i.PatientId

)
GROUP BY a.PatientId, d.PatientId, f.PatientId,
MDV3100, Abiraterone

)d

ON b.ApptPatientId = d.PatientId

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

FROM

MedicalTherapy a

INNER JOIN

(
SELECT PatientId, MedTxAgent, MedTxDate,
rowno = (SELECT COUNT(*)
		FROM MedicalTherapy b
		WHERE b.PatientId = a.PatientId AND b.MedTxDate = a.MedTxDate
		AND b.MedTxAgent <= a.MedTxAgent
		)
FROM MedicalTherapy a
) AS MT
ON a.PatientId = MT.PatientId
WHERE MT.MedTxAgent IS NOT NULL AND MT.MedTxDate IS NOT NULL
GROUP BY MT.PatientId, MT.MedTxDate, a.PatientId

) AS MC

ON MaxDA.MaxId = MC.CurrentTherapyDate AND MaxDA.PatientId = MC.PatientID
GROUP BY MC.PatientId, MaxDA.MaxId, MC.CurrentTherapy

) e

ON b.ApptPatientId = e.PatientId

LEFT OUTER JOIN 
--Pulling all patients and dates of consent who have been consented to protocol 90-040
(SELECT a.PatientId, '90_040Consent'= CASE WHEN a.PatientId IS NOT NULL THEN 'Yes' ELSE '' END,
	   CONVERT (varchar(50), MIN(PtProtocolStatusDate), 101) ConsentDate
FROM Patients a 
	INNER JOIN PatientProtocols b ON a.PatientId = b.PatientId
	INNER JOIN PatientProtocolStatus c ON b.PatientProtocolId = c.PatientProtocolId
	INNER JOIN Protocols d ON b.ProtocolId = d.ProtocolId
WHERE ProtocolNum = '90-040' and c.PtProtocolstatus = 'Consented'
GROUP BY a.patientId) cons ON ApptPatientId = cons.PatientId


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
	FROM (
	SELECT LabTestId,c.PatientId,LabDate,LabResult,
	  ROW_NUMBER() OVER(ORDER BY c.PatientId,LabDate) AS 'RowNumber'
	FROM LabTests c 
	WHERE LabTest = 'PSA' AND LabResult IS NOT NULL AND LabDate IS NOT NULL 
	) a
	) b
	WHERE RowRank <=3
	) a
	UNPIVOT
	(ItemValue FOR LabItem IN (LabDate,LabResult)
	)AS UnPivotTable
	) a
	) AS SourceTable
	PIVOT
	(
	MIN (ItemValue)
	FOR RowRank IN ([1],[2],[3],[4],[5],[6])
	) AS PivotTable
	) f
	ON  b.ApptPatientId  = f.PatientId

	---Selecting the last 3 CTC's for the patients
	LEFT OUTER JOIN 
	(SELECT PatientId,
	[1] CTCDate1,[2] CTC1, [3] CTCDate2, [4] CTC2, 
	[5] CTCDate3,[6] CTC3
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
	FROM (
	SELECT LabTestId,c.PatientId,LabDate,LabResult,
	  ROW_NUMBER() OVER(ORDER BY c.PatientId,LabDate) AS 'RowNumber'
	FROM LabTests c 
	WHERE LabTest = 'CTC' AND LabResult IS NOT NULL AND LabDate IS NOT NULL 
	) a
	) b
	WHERE RowRank <=3
	) a
	UNPIVOT
	(ItemValue FOR LabItem IN (LabDate,LabResult)
	)AS UnPivotTable
	) a
	) AS SourceTable
	PIVOT
	(
	MIN (ItemValue)
	FOR RowRank IN ([1],[2],[3],[4],[5],[6])
	) AS PivotTable
) g ON b.ApptPatientId = g.PatientId

---Selecting the last 3 CEA's for the patients
	LEFT OUTER JOIN 
	(SELECT PatientId,
	[1] CEADate1,[2] CEA1, [3] CEADate2, [4] CEA2, 
	[5] CEADate3,[6] CEA3
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
	FROM (
	SELECT LabTestId,c.PatientId,LabDate,LabResult,
	  ROW_NUMBER() OVER(ORDER BY c.PatientId,LabDate) AS 'RowNumber'
	FROM LabTests c 
	WHERE LabTest = 'CEA' AND LabResult IS NOT NULL AND LabDate IS NOT NULL 
	) a
	) b
	WHERE RowRank <=3
	) a
	UNPIVOT
	(ItemValue FOR LabItem IN (LabDate,LabResult)
	)AS UnPivotTable
	) a
	) AS SourceTable
	PIVOT
	(
	MIN (ItemValue)
	FOR RowRank IN ([1],[2],[3],[4],[5],[6])
	) AS PivotTable
) h ON b.ApptPatientId = h.PatientId

GROUP BY ApptClinicDate, ApptPhysician, PtMRN, PtFirstName, PtLastName, [Status], 
		RRPDate, RTDate, Abiraterone, MDV3100,  CurrentTherapy, CurrentMedTxDate, [90_040Consent], 
	   ConsentDate, CTCDate1, CTC1, CTCDate2, CTC2, CTCDate3,CTC3,
	   PSADate1, PSA1, PSADate2,PSA2, PSADate3,PSA3, CEADate1, CEA1, CEADate2, CEA2, CEADate3, CEA3, PtGender, ApptTime, ApptVisitType
ORDER BY CAST(ApptClinicDate as datetime), ApptTime, PTMRN
