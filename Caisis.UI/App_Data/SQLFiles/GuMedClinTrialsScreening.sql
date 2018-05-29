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
AND b.ApptPhysician LIKE '%' + @PhysicianName + '%' AND ApptDept LIKE '%GU%' AND
b.ApptClinicDate BETWEEN @FromDate AND @ToDate 
ORDER BY b.ApptClinicDate DESC
)
)


---CaseMix: Selecting all Patients with last Visit with GU Physician, Current Disease Status, Specific Medical Therapies, Current Medical therapy and Last 6 PSA's
SELECT ApptClinicDate, CONVERT(Varchar(8), ApptTime, 108) AS ApptTime, ApptVisitType, ApptPhysician, PtMRN, PtFirstName, PtLastName, PtGender, Status, RRP, RT,
	   CASE WHEN DocetaxelTx IS NULL THEN 'No' ELSE DocetaxelTx END DocetaxelTx, 
		Abiraterone, MDV3100  AS Enzalutamide, ARN509, BMS641988, Ketoconazole, Samarium,
	   CASE WHEN MitoxantroneTx IS NULL THEN 'No' ELSE MitoxantroneTx END MitoxantroneTx,
		Carboplatin, Paclitaxel, Cabazitaxel, [5alpha], mTOR_Inhibitor, Chemotherapy_Other,
      TAK_Drugs, Radium223, Cabozantinib,
      CASE WHEN CasodexTx IS NULL THEN 'No' ELSE CasodexTx END CasodexTx, 
	   CASE WHEN LupronTx IS NULL THEN 'No' ELSE LupronTx END LupronTx,
		Nilutamide, Flutamide,MDX010 AS Ipilimumab, VRP, Dasatinib, MensTaxotere, CurrentTherapy, 
	   CurrentMedTxDate, [90_040Consent], ConsentDate, CTCDate1, CTC1, CTCDate2, CTC2, CTCDate3,CTC3,
	   PSADate1, PSA1, PSADate2,PSA2, PSADate3,PSA3
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

LEFT OUTER JOIN

--Creating a query that checks to see if the patient has ever had any of the following treatments. Creating columns that state Y or N for the presence or absence of those treatments.
(
SELECT PatientId, Abiraterone, MDV3100, BMS641988, Ketoconazole, Samarium,
		Carboplatin, Paclitaxel,Nilutamide, Flutamide,
		MDX010, VRP, Dasatinib, MensTaxotere, ARN509, Cabazitaxel, [5alpha], mTOR_Inhibitor, 
      Chemotherapy_Other, TAK_Drugs, Radium223, Cabozantinib
FROM
( -- creating columns labeled with the MedTxAgent if the Patient has ever had such a treatment
SELECT a.PatientId, 'Abiraterone' = (CASE WHEN c.PatientId IS NOT NULL THEN 'Y' ELSE 'N' END),
'MDV3100' = (CASE WHEN d.PatientId IS NOT NULL THEN 'Y' ELSE 'N' END),
'BMS641988' = (CASE WHEN e.PatientId IS NOT NULL THEN 'Y' ELSE 'N' END),
'Ketoconazole' = (CASE WHEN f.PatientId IS NOT NULL THEN 'Y' ELSE 'N' END),
'Samarium' = (CASE WHEN g.PatientId IS NOT NULL THEN 'Y' ELSE 'N' END),
'Carboplatin' = (CASE WHEN i.PatientId IS NOT NULL THEN 'Y' ELSE 'N' END),
'Paclitaxel' = (CASE WHEN j.PatientId IS NOT NULL THEN 'Y' ELSE 'N' END),
'Nilutamide' = (CASE WHEN m.PatientId IS NOT NULL THEN 'Y' ELSE 'N' END),
'Flutamide' = (CASE WHEN n.PatientId IS NOT NULL THEN 'Y' ELSE 'N' END),
'MDX010' = (CASE WHEN o.PatientId IS NOT NULL THEN 'Y' ELSE 'N' END),
'VRP' = (CASE WHEN p.PatientId IS NOT NULL THEN 'Y' ELSE 'N' END),
'Dasatinib' = (CASE WHEN q.PatientId IS NOT NULL THEN 'Y' ELSE 'N' END),
'MensTaxotere' = (CASE WHEN r.PatientId IS NOT NULL THEN 'Y' ELSE 'N' END),
'ARN509' = (CASE WHEN s.PatientId IS NOT NULL THEN 'Y' ELSE 'N' END),
'Cabazitaxel' = (CASE WHEN t.PatientId IS NOT NULL THEN 'Y' ELSE 'N' END),
'5alpha' = (CASE WHEN u.PatientId IS NOT NULL THEN 'Y' ELSE 'N' END),
'mTOR_Inhibitor' = (CASE WHEN v.PatientId IS NOT NULL THEN 'Y' ELSE 'N' END),
'Chemotherapy_Other' = (CASE WHEN w.PatientId IS NOT NULL THEN 'Y' ELSE 'N' END),
'TAK_Drugs' = (CASE WHEN x.PatientId IS NOT NULL THEN 'Y' ELSE 'N' END),
'Radium223' = (CASE WHEN y.PatientId IS NOT NULL THEN 'Y' ELSE 'N' END),
'Cabozantinib' = (CASE WHEN z.PatientId IS NOT NULL THEN 'Y' ELSE 'N' END)
FROM

(
Patients a


LEFT OUTER JOIN

(  --All patients who've had Docetaxel
SELECT PatientId
FROM MedicalTherapy
WHERE MedTxAgent  LIKE '%Docetaxel%' OR MedTxAgent LIKE  '%Taxotere%' OR MedTxAgent LIKE '%BIND-014%'
GROUP BY PatientId
)  b ON a.PatientId = b.PatientId

LEFT OUTER JOIN

( --All Patients who've had Abiraterone
SELECT PatientId
FROM MedicalTherapy
WHERE MedTxAgent LIKE '%abiraterone%' OR MedTxAgent LIKE '%Abiraterone Acetate%' OR MedTxAgent LIKE '%CB7630%' OR MedTxAgent LIKE '%Zytiga%'
GROUP BY PatientId
) AS c ON a.PatientId = c.PatientId

LEFT OUTER JOIN

( --All patients with MDV3100
SELECT PatientId
FROM MedicalTherapy
WHERE  MedTxAgent LIKE '%MDV3100%' OR MedTxAgent LIKE'%Medivation%' OR MedTxAgent LIKE'%Enzalutamide%' OR MedTxAgent LIKE'%Xtandi%'
GROUP BY PatientId
) AS d ON a.PatientId = d.PatientId

LEFT OUTER JOIN

( --All patients who've had BMS-641988
SELECT PatientId
FROM MedicalTherapy
WHERE MedTxAgent LIKE '%BMS-641988%'
GROUP BY PatientId
) AS e ON a.PatientId = e.PatientId

LEFT OUTER JOIN

( --All patients who've had Ketoconazole
SELECT PatientId
FROM MedicalTherapy
WHERE MedTxAgent LIKE '%Ketoconazole%' OR MedTxAgent LIKE '%Keto%'OR
MedTxAgent LIKE '%Nizoral%'
GROUP BY PatientId
) AS f ON a.PatientId = f.PatientId

LEFT OUTER JOIN

( -- All Patients who've had Samarium
SELECT PatientId
FROM MedicalTherapy
WHERE MedTxAgent LIKE '%Samarium%'
GROUP BY PatientId
) AS g ON a.PatientId = g.PatientId

LEFT OUTER JOIN 
( -- All Patients who've had Carboplatin
SELECT PatientId
FROM MedicalTherapy
WHERE MedTxAgent LIKE '%Carboplatin%'
GROUP BY PatientId
) AS i ON a.PatientId = i.PatientId

LEFT OUTER JOIN 
( -- All Patients who've had Paclitaxel/taxol
SELECT PatientId
FROM MedicalTherapy
WHERE MedTxAgent LIKE '%Paclitaxel%' OR MedTxAgent LIKE '%taxol%' OR MedTxAgent LIKE '%CT-2103%' 
GROUP BY PatientId
) AS j ON a.PatientId = j.PatientId


LEFT OUTER JOIN 

( -- All Patients who've had nilutamide
SELECT PatientId
FROM MedicalTherapy
WHERE MedTxAgent LIKE '%nilutamide%' 
GROUP BY PatientId
) AS m ON a.PatientId = m.PatientId

LEFT OUTER JOIN 

( -- All Patients who've had flutamide
SELECT PatientId
FROM MedicalTherapy
WHERE MedTxAgent LIKE '%flutamide%' 
GROUP BY PatientId
) AS n ON a.PatientId = n.PatientId

LEFT OUTER JOIN 

( -- All Patients who've had MDX-010
SELECT PatientId
FROM MedicalTherapy
WHERE MedTxAgent LIKE '%MDX%'+'%010%' OR MedTxAgent LIKE '%Ipilimumab%' OR MedTxAgent LIKE '%BMS-734016%'
GROUP BY PatientId
) AS o ON a.PatientId = o.PatientId

LEFT OUTER JOIN 

( -- All Patients who've had VRP
SELECT PatientId
FROM MedicalTherapy
WHERE MedTxAgent LIKE '%VRP%' 
GROUP BY PatientId
) AS p ON a.PatientId = p.PatientId

LEFT OUTER JOIN 

( -- All Patients who've had Dasatinib
SELECT PatientId
FROM MedicalTherapy
WHERE MedTxAgent LIKE '%Dasatinib%' 
GROUP BY PatientId
) AS q ON a.PatientId = q.PatientId

LEFT OUTER JOIN 

( -- All Patients who've had Men's Taxotere 
SELECT PatientId
FROM MedicalTherapy
WHERE MedTxAgent LIKE '%men%' + '%taxotere%' 
GROUP BY PatientId
) AS r ON a.PatientId = r.PatientId

LEFT OUTER JOIN

( -- All Patients who've had ARN-509
SELECT PatientId
FROM MedicalTherapy
WHERE MedTxAgent LIKE '%ARN-509%' OR MedTxAgent LIKE '%JNJ-56021927%'
GROUP BY PatientId
) AS s ON a.PatientId = s.PatientId

LEFT OUTER JOIN

( -- All Patients who've had Cabazitaxel
SELECT PatientId
FROM MedicalTherapy
WHERE MedTxAgent LIKE '%Cabazitaxel%'
GROUP BY PatientId
) AS t ON a.PatientId = t.PatientId

LEFT OUTER JOIN

( -- All Patients who've had 5-alpha
SELECT PatientId
FROM MedicalTherapy
WHERE MedTxAgent LIKE '%Finasteride%' OR MedTxAgent LIKE '%Dutasteride%'
GROUP BY PatientId
) AS u ON a.PatientId = u.PatientId

LEFT OUTER JOIN

( -- All Patients who've had mTOR Inhibitor
SELECT PatientId
FROM MedicalTherapy
WHERE MedTxAgent LIKE '%MLN0128%' OR MedTxAgent LIKE '%INK128%' OR MedTxAgent LIKE '%CC-115%' OR MedTxAgent LIKE '%IMC-A12%' OR MedTxAgent LIKE '%Cixutumumab%'
GROUP BY PatientId
) AS v ON a.PatientId = v.PatientId

LEFT OUTER JOIN

( -- All Patients who've had Chemotherapy (other)
SELECT PatientId
FROM MedicalTherapy
WHERE MedTxAgent LIKE '%taxol%' OR MedTxAgent LIKE '%taxene%' OR MedTxAgent LIKE '%tesetaxel%' OR MedTxAgent LIKE '%STEAP%' OR MedTxAgent LIKE '%DSTP3086S%'
GROUP BY PatientId
) AS w ON a.PatientId = w.PatientId

LEFT OUTER JOIN

( -- All Patients who've had TAK Drugs
SELECT PatientId
FROM MedicalTherapy
WHERE MedTxAgent LIKE '%TAK700%' OR MedTxAgent LIKE '%TAK-242%' OR MedTxAgent LIKE '%orteronel%'
GROUP BY PatientId
) AS x ON a.PatientId = x.PatientId

LEFT OUTER JOIN

( -- All Patients who've had Radium-223
SELECT PatientId
FROM MedicalTherapy
WHERE MedTxAgent LIKE '%Xofigo%' OR MedTxAgent LIKE '%Radium-223%' OR MedTxAgent LIKE '%Ra-223%Dichloride%' OR MedTxAgent LIKE '%Alpharadin%' OR MedTxAgent LIKE '%Ra-223%'
GROUP BY PatientId
) AS y ON a.PatientId = y.PatientId

LEFT OUTER JOIN

( -- All Patients who've had Cabozantinib
SELECT PatientId
FROM MedicalTherapy
WHERE MedTxAgent LIKE '%Cabozantinib%' OR MedTxAgent LIKE '%XL184%'
GROUP BY PatientId
) AS z ON a.PatientId = z.PatientId

)
GROUP BY a.PatientId, b.PatientId, c.PatientId, d.PatientId, e.PatientId, f.PatientId,
g.PatientId, i.PatientId, j.PatientId, m.PatientId,
n.PatientId, o.PatientId, p.PatientId, q.PatientId, r.PatientId, s.PatientId, t.PatientId,
u.PatientId, v.PatientId, w.PatientId, x.PatientId, y.PatientId, z.PatientId
)s -- Overall query that pulls all patientId's associated with the therapies
GROUP BY PatientId, Abiraterone, MDV3100, BMS641988, Ketoconazole, Samarium,
Carboplatin, Paclitaxel, Nilutamide, Flutamide,
MDX010, VRP, Dasatinib, MensTaxotere, ARN509, Cabazitaxel, [5alpha], mTOR_Inhibitor, 
Chemotherapy_Other, TAK_Drugs, Radium223, Cabozantinib
)d

ON b.ApptPatientId = d.PatientId

--marking all patients who've had a Prostatectomy operation
LEFT OUTER JOIN
(SELECT PatientId, (CASE WHEN PatientId IS NULL THEN '' ELSE 'YES' END) 'RRP' 
FROM Procedures
WHERE ProcName IN  ('LP', 'RP', 'RRP', 'CP', 'SALVRP', 'RALP') OR Procname LIKE ('%Prostat%'+'%tomy')

) RRP ON b.ApptPatientId = RRP.PatientId

--Marking all patients who've had Radiation Therapy

LEFT OUTER JOIN
(
SELECT PatientId, (CASE WHEN PatientId IS NULL THEN '' ELSE 'YES' END) RT
FROM RadiationTherapy
)RT ON b.ApptPatientid = RT.PatientId

--Calculating Days on Docetaxel Therapies

LEFT OUTER JOIN 

(SELECT PatientId, 'DocetaxelTx' = (Case WHEN [TherapyDate_DaysTotal] IS NULL THEN 'Yes:NoStopDate' ELSE [TherapyDate_DaysTotal] END)
FROM
(SELECT a.Patientid, MedTxDate,
'TherapyDate_DaysTotal' = 
MAX(CASE rowno WHEN 1 THEN md.Medtxdatetext + ':'+ RTRIM(Md.days) END) +
coalesce(MAX(CASE md.rowno WHEN 2 THEN ', ' + md.Medtxdatetext + ':' + RTRIM(Md.Days) END), '') +
coalesce(MAX(CASE Md.rowno WHEN 3 THEN ', ' + md.Medtxdatetext + ':' + RTRIM(Md.Days) END), '') +
coalesce(MAX(CASE Md.rowno WHEN 4 THEN ', ' + md.Medtxdatetext + ':' + RTRIM(Md.Days) END), '') 


FROM
MedicalTherapy a 
INNER JOIN 
(SELECT PatientId,MedTxDateText, 
		CAST ((DATEDIFF (Day, MedTxDate, MedTxStopDate))as char) Days, 
		Rowno = (SELECT COUNT(*)
				 FROM 
					(SELECT Patientid, MedTxDate, 
					'MedTxAgent' = (Case when (MedTxAgent  LIKE '%Docetaxel%' OR MedTxAgent LIKE  '%Taxotere%')
					THEN 'Docetaxel' ELSE '' END )
					FROM MedicalTherapy ) b
				 WHERE b.PatientId = a.PatientId and b.MedTxDate <= a.MedTxDate and
						a.MedTxAgent = b.MedTxAgent)
FROM (SELECT Patientid, MedTxDateText, MedTxStopDate, MedTxDate,
					'MedTxAgent' = (Case when (MedTxAgent  LIKE '%Docetaxel%' OR MedTxAgent LIKE  '%Taxotere%')
					THEN 'Docetaxel' ELSE '' END )
					FROM MedicalTherapy) a
WHERE (MedTxAgent  LIKE '%Docetaxel%' OR MedTxAgent LIKE  '%Taxotere%') ) md
ON a.Patientid = md.Patientid
WHERE (MedTxAgent  LIKE '%Docetaxel%' OR MedTxAgent LIKE  '%Taxotere%')
GROUP BY a.patientid, medtxdate)a)DDays ON b.apptPatientId = DDays.PatientId

LEFT OUTER JOIN
--Calculating days on Bicalutamide/casodex
(SELECT PatientId, 'CasodexTx' = (Case WHEN [TherapyDate_DaysTotal] IS NULL THEN 'Yes:NoStopDate' ELSE [TherapyDate_DaysTotal] END)
FROM
(SELECT a.Patientid, MedTxDate,
'TherapyDate_DaysTotal' = 
MAX(CASE rowno WHEN 1 THEN md.Medtxdatetext + ':'+ RTRIM(Md.days) END) +
coalesce(MAX(CASE md.rowno WHEN 2 THEN ', ' + md.Medtxdatetext + ':' + RTRIM(Md.Days) END), '') +
coalesce(MAX(CASE Md.rowno WHEN 3 THEN ', ' + md.Medtxdatetext + ':' + RTRIM(Md.Days) END), '') +
coalesce(MAX(CASE Md.rowno WHEN 4 THEN ', ' + md.Medtxdatetext + ':' + RTRIM(Md.Days) END), '') 

FROM
MedicalTherapy a 
INNER JOIN 
(SELECT PatientId,MedTxDateText, 
		CAST ((DATEDIFF (Day, MedTxDate, MedTxStopDate))as char) Days, 
		Rowno = (SELECT COUNT(*)
				 FROM 
					(SELECT Patientid, MedTxDate, 
					'MedTxAgent' = (Case when (MedTxAgent  LIKE '%Bicalutamide%' OR MedTxAgent LIKE  '%casodex%')
					THEN 'Bicalutamide' ELSE '' END )
					FROM MedicalTherapy ) b
				 WHERE b.PatientId = a.PatientId and b.MedTxDate <= a.MedTxDate and
						a.MedTxAgent = b.MedTxAgent)
FROM (SELECT Patientid, MedTxDateText, MedTxStopDate, MedTxDate,
					'MedTxAgent' = (Case when (MedTxAgent  LIKE '%Bicalutamide%' OR MedTxAgent LIKE  '%casodex%')
					THEN 'Bicalutamide' ELSE '' END )
					FROM MedicalTherapy) a
WHERE (MedTxAgent  LIKE '%Bicalutamide%' OR MedTxAgent LIKE  '%casodex%') ) md
ON a.Patientid = md.Patientid
WHERE (MedTxAgent  LIKE '%Bicalutamide%' OR MedTxAgent LIKE  '%casodex%')
GROUP BY a.patientid, medtxdate)a)BDays ON b.apptPatientId = BDays.PatientId

LEFT OUTER JOIN

--calculating days on mitoxantrone
(SELECT PatientId, 'MitoxantroneTx' = (Case WHEN [TherapyDate_DaysTotal] IS NULL THEN 'Yes:NoStopDate' ELSE [TherapyDate_DaysTotal] END)
FROM
(SELECT a.Patientid, MedTxDate,
'TherapyDate_DaysTotal' = 
MAX(CASE rowno WHEN 1 THEN md.Medtxdatetext + ':'+ RTRIM(Md.days) END) +
coalesce(MAX(CASE md.rowno WHEN 2 THEN ', ' + md.Medtxdatetext + ':' + RTRIM(Md.Days) END), '') +
coalesce(MAX(CASE Md.rowno WHEN 3 THEN ', ' + md.Medtxdatetext + ':' + RTRIM(Md.Days) END), '') +
coalesce(MAX(CASE Md.rowno WHEN 4 THEN ', ' + md.Medtxdatetext + ':' + RTRIM(Md.Days) END), '') 

FROM
MedicalTherapy a 
INNER JOIN 
(SELECT PatientId,MedTxDateText, 
		CAST ((DATEDIFF (Day, MedTxDate, MedTxStopDate))as char) Days, 
		Rowno = (SELECT COUNT(*)
				 FROM MedicalTherapy b
				 WHERE b.PatientId = a.PatientId and b.MedTxDate <= a.MedTxDate and
						a.MedTxAgent = b.MedTxAgent)
FROM MedicalTherapy a
WHERE (MedTxAgent  LIKE '%Mitoxantrone%') ) md
ON a.Patientid = md.Patientid
WHERE (MedTxAgent  LIKE '%Mitoxantrone%')
GROUP BY a.patientid, medtxdate)a)MDays ON b.apptPatientId = MDays.PatientId

LEFT OUTER JOIN 
--Calculating days on Lupron
(SELECT PatientId, 'LupronTx' = (Case WHEN [TherapyDate_DaysTotal] IS NULL THEN 'Yes:NoStopDate' ELSE [TherapyDate_DaysTotal] END)
FROM
(SELECT a.Patientid, MedTxDate,
'TherapyDate_DaysTotal' = 
MAX(CASE rowno WHEN 1 THEN md.Medtxdatetext + ':'+ RTRIM(Md.days) END) +
coalesce(MAX(CASE md.rowno WHEN 2 THEN ', ' + md.Medtxdatetext + ':' + RTRIM(Md.Days) END), '') +
coalesce(MAX(CASE Md.rowno WHEN 3 THEN ', ' + md.Medtxdatetext + ':' + RTRIM(Md.Days) END), '') +
coalesce(MAX(CASE Md.rowno WHEN 4 THEN ', ' + md.Medtxdatetext + ':' + RTRIM(Md.Days) END), '') 

FROM
MedicalTherapy a 
INNER JOIN 
(SELECT PatientId,MedTxDateText, 
		CAST ((DATEDIFF (Day, MedTxDate, MedTxStopDate))as char) Days, 
		Rowno = (SELECT COUNT(*)
				 FROM MedicalTherapy b
				 WHERE b.PatientId = a.PatientId and b.MedTxDate <= a.MedTxDate and
						a.MedTxAgent = b.MedTxAgent)
FROM MedicalTherapy a
WHERE (MedTxAgent  LIKE '%Lupron%') ) md
ON a.Patientid = md.Patientid
WHERE (MedTxAgent  LIKE '%Lupron%')
GROUP BY a.patientid, medtxdate)a)LDays ON b.apptPatientId = LDays.PatientId

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
GROUP BY PatientId
) AS MaxDate

INNER JOIN

( -- Selecting the Agent associated with the latest Therapy Date
SELECT MedTxAgent, MedTxDate, PatientId
FROM MedicalTherapy
) AS Agents

ON MaxDate.MaxId = Agents.MedTxDate

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
) AS PivotTable) g ON b.ApptPatientId = g.PatientId
GROUP BY ApptClinicDate, ApptPhysician, PtMRN, PtFirstName, PtLastName, Status, RRP, RT,
	   DocetaxelTx, Abiraterone, MDV3100, BMS641988, Ketoconazole, Samarium,
	   MitoxantroneTx, Carboplatin, Paclitaxel, CasodexTx, 
	   LupronTx,  Nilutamide, Flutamide,MDX010, VRP, Dasatinib, MensTaxotere, 
      ARN509, Cabazitaxel, [5alpha], mTOR_Inhibitor, Chemotherapy_Other, TAK_Drugs, 
      Radium223, Cabozantinib, CurrentTherapy, 
	   CurrentMedTxDate, [90_040Consent], ConsentDate, CTCDate1, CTC1, CTCDate2, CTC2, CTCDate3,CTC3,
	   PSADate1, PSA1, PSADate2,PSA2, PSADate3,PSA3, PtGender, ApptTime, ApptVisitType
ORDER BY CAST(ApptClinicDate as datetime), PTMRN