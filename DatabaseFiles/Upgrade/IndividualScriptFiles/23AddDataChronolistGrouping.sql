--Add lkp for chrono list grouping
INSERT INTO LookupCodes
(LkpFieldName,LkpCode,LkpOrder,EnteredBy,EnteredTime)
SELECT a.LkpFieldName,a.LkpCode,a.LkpOrder,a.EnteredBy,a.EnteredTime
FROM 
   (
   SELECT 'ChronoList' LkpFieldName,'PatientProblems' LkpCode, 206 LkpOrder, 'Caisis_System' EnteredBy, GETDATE() EnteredTime
   ) a LEFT OUTER JOIN LookupCodes b ON a.LkpFieldName=b.LkpFieldName AND
                                        a.LkpCode=b.LkpCode
WHERE b.LkpFieldName IS NULL
GO
