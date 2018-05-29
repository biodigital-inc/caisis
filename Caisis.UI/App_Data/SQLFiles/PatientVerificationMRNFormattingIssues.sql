--Report to show which patients MRNs do not exist in the source system.

--**This report can only run off the Caisis warehouse.**
SELECT DISTINCT 
       a.PtMRN, a.PtLastName, a.PtFirstName, a.PtBirthDateText, a.EnteredTime,
       STUFF((SELECT ',' + d.Institution AS [text()]                        
              FROM Institutions d INNER JOIN 
                   PatientInstitutions e ON d.InstitutionId=e.InstitutionId  
              WHERE a.PatientId = e.PatientId
              FOR XML PATH('')
              ), 1, 1, ''
            ) AS DatasetList
FROM Patients a INNER JOIN
     (
      --MRNS that are not valid
      SELECT PatientId, CurrentData NonConformedMRN
      FROM DataFeed_DataDiscrepancies
      WHERE TableName = 'Patients' AND
            FieldName = 'PtMRN'
     ) b ON a.PatientId = b.PatientId LEFT OUTER JOIN
     (
      --Exclude user verified MRNs
      SELECT PatientId 
      FROM Actions 
      WHERE ActionItem = 'MRN Verified'
     ) c ON c.PatientId = a.PatientId
WHERE c.PatientId IS NULL
ORDER BY EnteredTime

