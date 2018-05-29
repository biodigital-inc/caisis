SET NOCOUNT ON;

-- DO NOT MODIFY LINES BELOW--
IF OBJECT_ID(N'tempdb..#ColorectalReport', N'U') IS NOT NULL
DROP TABLE #ColorectalReport

IF OBJECT_ID(N'tempdb..#ScreeningReport', N'U') IS NOT NULL
DROP TABLE #ScreeningReport

IF OBJECT_ID(N'tempdb..#ScreeningReportDetails', N'U') IS NOT NULL
DROP TABLE #ScreeningReportDetails

CREATE TABLE #ColorectalReport
(Physician varchar(255),
 MRN varchar(50),
 ProtocolStatus varchar(50),
 ProtocolStatusNotes varchar(50), 
 ProtocolStatusReason varchar(50)
)

CREATE TABLE #ScreeningReport
(Physician varchar(255),
 Screened int,
 Eligible int,
 Consented int,
 Considering int,
 Rescreen int,
 Approached_Refused int,
 NotApproached_PerClinicianJudgement int,
 Ineligible int
)
INSERT INTO #ScreeningReport (Physician)
SELECT ApptPhysician FROM Colorectal_Appointments
WHERE ApptDept LIKE '%COLORECTAL%' AND ApptPhysician NOT LIKE '%WONG%'
GROUP BY ApptPhysician

CREATE TABLE #ScreeningReportDetails
(Physician varchar(255),
 Rescreen_ClinicDelay int,
 Rescreen_PatientUpset int,
 Rescreen_NoDefinitiveDiagnosis int,
 Rescreen_ClinicAppointmentNoShow int,
 Ineligible_NoTissueLeftover int,
 Ineligible_NoSurgicalTreatment int,
 Ineligible_InclusionExclusionCriteria int,
 Ineligible_PatientWithdrawalOfConsent int
)
INSERT INTO #ScreeningReportDetails (Physician)
SELECT ApptPhysician FROM Colorectal_Appointments
WHERE ApptDept LIKE '%COLORECTAL%' AND ApptPhysician NOT LIKE '%WONG%'
GROUP BY ApptPhysician

;
WITH ColorectalReport(Physician, MRN, ProtocolStatus, ProtocolStatusNotes, ProtocolStatusReason) AS
(
SELECT ApptPhysician, a.ApptMRN, PtProtocolStatus, PtProtocolStatusNotes, PtProtocolStatusReason
FROM Colorectal_Appointments a LEFT OUTER JOIN (
SELECT c.PatientId, a.PatientProtocolId, c.ProtocolNum, a.PtProtocolStatusDate, a.PtProtocolStatus, a.PtProtocolStatusNotes, a.PtProtocolStatusReason
FROM Colorectal_PatientProtocolStatus a INNER JOIN Colorectal_PatientProtocols b ON a.PatientProtocolId = b.PatientProtocolId
                                        INNER JOIN 
                                          (
                                          SELECT b.PatientId, a.PatientProtocolId, c.ProtocolNum, MAX(a.PtProtocolStatusDate) AS LatestPtProcolStatusDate
                                          FROM Colorectal_PatientProtocolStatus a INNER JOIN Colorectal_PatientProtocols b ON a.PatientProtocolId = b.PatientProtocolId
                                                                                  INNER JOIN Colorectal_Protocols c ON b.ProtocolId = c.ProtocolId
                                          WHERE c.ProtocolNum = @ProtocolNum
                                          GROUP BY b.PatientId, a.PatientProtocolId, c.ProtocolNum
                                          ) c ON a.PatientProtocolId = c.PatientProtocolId AND 
                                                 a.PtProtocolStatusDate = c.LatestPtProcolStatusDate
WHERE b.PtProtocolNotes LIKE '%Weiser%' OR b.PtProtocolNotes LIKE '%Nash%' OR b.PtProtocolNotes LIKE '%Temple%' OR
      b.PtProtocolNotes LIKE '%Guillem%' OR b.PtProtocolNotes LIKE '%Paty%' --OR b.PtProtocolNotes LIKE '%Wong%'
) b ON a.ApptPatientId = b.PatientId
WHERE a.ApptClinicDate BETWEEN @FromDate AND @ToDate AND 
      b.PtProtocolStatusDate BETWEEN @FromDate AND @ToDate AND
      a.ApptDept LIKE '%COLORECTAL%' AND
     (b.PtProtocolStatusNotes IS NULL OR PtProtocolStatusNotes IN('ConsentedBy: EGAWA,FUMIKO', 'ConsentedBy: LEVY,RACHEL A', 'ConsentedBy: GUILLEM,JOSE G', 'ConsentedBy: CHANG,GERARD','ConsentedBy: SAIDMAN,JAKOB','ConsentedBy: MEDINA,ELIZABETH','ConsentedBy: MISHOLY,JUSTINE','ConsentedBy: WEISER,MARTIN R','ConsentedBy: TEMPLE,LARISSA','ConsentedBy: PATY,PHILIP B','ConsentedBy: NASH,GARRETT')) --'ConsentedBy: WONG,W DOUGLAS'
GROUP BY a.ApptPhysician, b.PtProtocolStatus, b.PtProtocolStatusNotes, b.PtProtocolStatusReason, a.ApptMRN
)

INSERT INTO #ColorectalReport 
      (Physician, MRN, ProtocolStatus, ProtocolStatusNotes, ProtocolStatusReason)
SELECT Physician, MRN, ProtocolStatus, ProtocolStatusNotes, ProtocolStatusReason
FROM ColorectalReport

-- Consented
UPDATE #ScreeningReport
SET Consented = ISNULL(b.Consented, 0)
FROM #ScreeningReport a LEFT OUTER JOIN (
                                    SELECT Physician, COUNT(*) Consented
                                    FROM #ColorectalReport
                                    WHERE ProtocolStatus = 'Consented'
                                    GROUP BY Physician
                                    ) b ON a.Physician = b.Physician

-- Considering
UPDATE #ScreeningReport
SET Considering = ISNULL(b.Considering, 0)
FROM #ScreeningReport a LEFT OUTER JOIN (
                                    SELECT Physician, COUNT(*) Considering
                                    FROM #ColorectalReport
                                    WHERE ProtocolStatus = 'Considering'
                                    GROUP BY Physician
                                    ) b ON a.Physician = b.Physician

-- Rescreen
UPDATE #ScreeningReport
SET Rescreen = ISNULL(b.Rescreen, 0)
FROM #ScreeningReport a LEFT OUTER JOIN (
                                    SELECT Physician, COUNT(*) Rescreen
                                    FROM #ColorectalReport
                                    WHERE ProtocolStatus = 'Re-screen' AND 
                                          ProtocolStatusReason IN('Clinic Delay','Patient Upset','No Definitive Diagnosis','Clinic Appointment No Show')
                                    GROUP BY Physician
                                    ) b ON a.Physician = b.Physician

-- Approached&Refused
UPDATE #ScreeningReport
SET Approached_Refused = ISNULL(b.Approached_Refused, 0)
FROM #ScreeningReport a LEFT OUTER JOIN (
                                    SELECT Physician, COUNT(*) Approached_Refused
                                    FROM #ColorectalReport
                                    WHERE ProtocolStatus = 'Approached and Refused'
                                    GROUP BY Physician
                                    ) b ON a.Physician = b.Physician

-- NotApproached_PerClinicianJudgement
UPDATE #ScreeningReport
SET NotApproached_PerClinicianJudgement = ISNULL(b.NotApproached_PerClinicianJudgement,0)
FROM #ScreeningReport a LEFT OUTER JOIN (
                                    SELECT Physician, COUNT(*) NotApproached_PerClinicianJudgement
                                    FROM #ColorectalReport
                                    WHERE ProtocolStatus = 'Not Approached Per clinician Judgment'
                                    GROUP BY Physician
                                    ) b ON a.Physician = b.Physician

-- Ineligible
UPDATE #ScreeningReport
SET Ineligible = ISNULL(b.Ineligible,0)
FROM #ScreeningReport a LEFT OUTER JOIN (
                                    SELECT Physician, COUNT(*) Ineligible
                                    FROM #ColorectalReport
                                    WHERE (ProtocolStatus = 'Ineligible' AND ProtocolStatusReason IN('No Tissue Leftover','No Surgical Treatment','Inclusion/exclusion criteria')) OR
                                          (ProtocolStatus = 'Off-Study' AND ProtocolStatusReason IN('Patient Withdrawal of Consent'))
                                    GROUP BY Physician
                                    ) b ON a.Physician = b.Physician

-- Eligible = Consented + Considering + Rescreen + Approached/Refused + Not Approached per Clinician judgement
UPDATE #ScreeningReport
SET Eligible = ISNULL(Consented, 0) + ISNULL(Considering, 0) + ISNULL(Rescreen, 0) + 
               ISNULL(Approached_Refused,0) + ISNULL(NotApproached_PerClinicianJudgement, 0)

-- Screened = Eligible + Ineligible
UPDATE #ScreeningReport
SET Screened = ISNULL(Eligible, 0) + ISNULL(Ineligible, 0)

-- Rescreen_Delay
UPDATE #ScreeningReportDetails
SET Rescreen_ClinicDelay = ISNULL(b.Rescreen_ClinicDelay,0)
FROM #ScreeningReportDetails a LEFT OUTER JOIN (
                                          SELECT Physician, COUNT(*) Rescreen_ClinicDelay
                                          FROM #ColorectalReport
                                          WHERE ProtocolStatus = 'Re-screen' AND ProtocolStatusReason IN('Clinic Delay')
                                          GROUP BY Physician
                                          ) b ON a.Physician = b.Physician

-- Rescreen_PatientUpset
UPDATE #ScreeningReportDetails
SET Rescreen_PatientUpset = ISNULL(b.Rescreen_PatientUpset,0)
FROM #ScreeningReportDetails a LEFT OUTER JOIN (
                                          SELECT Physician, COUNT(*) Rescreen_PatientUpset
                                          FROM #ColorectalReport
                                          WHERE ProtocolStatus = 'Re-screen' AND ProtocolStatusReason IN('Patient Upset')
                                          GROUP BY Physician
                                          ) b ON a.Physician = b.Physician

-- Rescreen_NoDefinitiveDiagnosis
UPDATE #ScreeningReportDetails
SET Rescreen_NoDefinitiveDiagnosis = ISNULL(b.Rescreen_NoDefinitiveDiagnosis,0)
FROM #ScreeningReportDetails a LEFT OUTER JOIN (
                                          SELECT Physician, COUNT(*) Rescreen_NoDefinitiveDiagnosis
                                          FROM #ColorectalReport
                                          WHERE ProtocolStatus = 'Re-screen' AND ProtocolStatusReason IN('No Definitive Diagnosis')
                                          GROUP BY Physician
                                          ) b ON a.Physician = b.Physician

-- Rescreen_ClinicAppointmentNoShow
UPDATE #ScreeningReportDetails
SET Rescreen_ClinicAppointmentNoShow = ISNULL(b.Rescreen_ClinicAppointmentNoShow,0)
FROM #ScreeningReportDetails a LEFT OUTER JOIN (
                                          SELECT Physician, COUNT(*) Rescreen_ClinicAppointmentNoShow
                                          FROM #ColorectalReport
                                          WHERE ProtocolStatus = 'Re-screen' AND ProtocolStatusReason IN('Clinic Appointment No Show')
                                          GROUP BY Physician
                                          ) b ON a.Physician = b.Physician

-- Ineligible_NoTissueLeftover
UPDATE #ScreeningReportDetails
SET Ineligible_NoTissueLeftover = ISNULL(b.Ineligible_NoTissueLeftover,0)
FROM #ScreeningReportDetails a LEFT OUTER JOIN (
                                          SELECT Physician, COUNT(*) Ineligible_NoTissueLeftover
                                          FROM #ColorectalReport
                                          WHERE ProtocolStatus = 'Ineligible' AND ProtocolStatusReason IN('No Tissue Leftover')
                                          GROUP BY Physician
                                          ) b ON a.Physician = b.Physician

-- Ineligible_NoSurgicalTreatment
UPDATE #ScreeningReportDetails
SET Ineligible_NoSurgicalTreatment = ISNULL(b.Ineligible_NoSurgicalTreatment,0)
FROM #ScreeningReportDetails a LEFT OUTER JOIN (
                                          SELECT Physician, COUNT(*) Ineligible_NoSurgicalTreatment
                                          FROM #ColorectalReport
                                          WHERE ProtocolStatus = 'Ineligible' AND ProtocolStatusReason IN('No Surgical Treatment')
                                          GROUP BY Physician
                                          ) b ON a.Physician = b.Physician

-- Ineligible_InclusionExclusionCriteria
UPDATE #ScreeningReportDetails
SET Ineligible_InclusionExclusionCriteria = ISNULL(b.Ineligible_InclusionExclusionCriteria,0)
FROM #ScreeningReportDetails a LEFT OUTER JOIN (
                                          SELECT Physician, COUNT(*) Ineligible_InclusionExclusionCriteria
                                          FROM #ColorectalReport
                                          WHERE ProtocolStatus = 'Ineligible' AND ProtocolStatusReason IN('Inclusion/exclusion criteria')
                                          GROUP BY Physician
                                          ) b ON a.Physician = b.Physician

-- Ineligible_PatientWithdrawalOfConsent
UPDATE #ScreeningReportDetails
SET Ineligible_PatientWithdrawalOfConsent = ISNULL(b.Ineligible_PatientWithdrawalOfConsent,0)
FROM #ScreeningReportDetails a LEFT OUTER JOIN (
                                          SELECT Physician, COUNT(*) Ineligible_PatientWithdrawalOfConsent
                                          FROM #ColorectalReport
                                          WHERE ProtocolStatus = 'Off-Study' AND ProtocolStatusReason IN('Patient Withdrawal of Consent')
                                          GROUP BY Physician
                                          ) b ON a.Physician = b.Physician

SELECT *
FROM #ScreeningReport

--SELECT *
--FROM #ScreeningReportDetails
