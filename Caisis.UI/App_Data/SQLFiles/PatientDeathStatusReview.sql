/*
This Shows patients that are marked deceased in Caisis, but alive in source system
Action Item documents conflict with source system but willing to keep in Caisis.
*/
SELECT a.PtMRN, PtFirstName, PtLastName, PtBirthDateText, PtDeathDateText, 
       PtDeathType, ISNULL(a.UpdatedTime, a.EnteredTime) UpdatedTime, 
       STUFF((SELECT ',' + d.Institution AS [text()]                        
              FROM Institutions d INNER JOIN 
                   PatientInstitutions e ON d.InstitutionId=e.InstitutionId  
              WHERE a.PatientId = e.PatientId
              FOR XML PATH('')
              ), 1, 1, ''
            ) AS DatasetList
      ,ActionItem, ActionDate
FROM All_Patients a INNER JOIN
      (
      SELECT DISTINCT PatientId 
      FROM All_DataFeed_DataDiscrepancies
      WHERE Fieldname IN('PtDeathDateText') AND
            CurrentData IS NOT NULL AND 
            SourceData IS NULL
      ) b ON a.PatientId = b.PatientId LEFT OUTER JOIN
      (
      SELECT PatientId, ActionItem, MAX(ActionDate) ActionDate
      FROM All_Actions
      WHERE ActionItem = 'DeathStatusVerified'
      GROUP BY PatientId, ActionItem
      ) c ON a.PatientId = c.PatientId
ORDER BY UpdatedTime DESC