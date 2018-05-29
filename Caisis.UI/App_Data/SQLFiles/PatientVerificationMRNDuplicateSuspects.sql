--Report to show which patient records seem to be duplicated. 
SELECT a.PtMRN, a.PtLastName, a.PtFirstName, a.PtBirthDateText,
       EnteredTime,
       STUFF((SELECT ',' + d.Institution AS [text()]                        
              FROM Institutions d INNER JOIN 
                   PatientInstitutions e ON d.InstitutionId=e.InstitutionId  
              WHERE a.PatientId = e.PatientId
              FOR XML PATH('')
              ), 1, 1, ''
            ) AS DatasetList
FROM Patients a INNER JOIN
      (
      --Middle initial is stripped from First name when doing comparison
      SELECT PtLastName, PtBirthDateText,
             CASE CHARINDEX(' ',PtFirstName)
               WHEN 0 THEN PtFirstName
               ELSE LEFT(PtFirstName, CHARINDEX(' ',PtFirstName))
             END PtFirstName
      FROM Patients
      WHERE PatientId IN
            (
            --Exclude special datasets
            SELECT DISTINCT PatientId
            FROM PatientInstitutions a INNER JOIN
                 Institutions b ON a.InstitutionId = b.InstitutionId 
            WHERE Institution NOT IN ('IMM','BCM','CRUK')
            )
      GROUP BY PtLastName, PtBirthDateText,             
                CASE CHARINDEX(' ',PtFirstName)
                  WHEN 0 THEN PtFirstName
                  ELSE LEFT(PtFirstName, CHARINDEX(' ',PtFirstName))
                END
      HAVING COUNT(*) > 1
      ) b ON ISNULL(a.PtLastName,'') = ISNULL(b.PtLastName,'') AND
             ISNULL(
             CASE CHARINDEX(' ',a.PtFirstName)
               WHEN 0 THEN a.PtFirstName
               ELSE LEFT(a.PtFirstName, CHARINDEX(' ',a.PtFirstName))
             END,'') = ISNULL(b.PtFirstName,'') AND
             ISNULL(a.PtBirthDateText,'') = ISNULL(b.PtBirthDateText,'') INNER JOIN
      (
      SELECT DISTINCT PatientId
      FROM PatientInstitutions a INNER JOIN
           Institutions b ON a.InstitutionId = b.InstitutionId 
      WHERE Institution NOT IN ('IMM','BCM','CRUK')
      ) c ON a.PatientId = c.PatientId LEFT OUTER JOIN
      (
      --Exclude Paitients on the XREF list as they exist in other reports
      SELECT PatientId
      FROM Identifiers
      WHERE IdType = 'PT_XREF_MRN'
      ) d ON a.PatientId = d.PatientId LEFT OUTER JOIN
      (
      --Exclude Paitients on the XREF list as they exist in other reports
      SELECT Identifier XREF_MRN
      FROM Identifiers
      WHERE IdType = 'PT_XREF_MRN'
      ) e ON a.PtMRN = XREF_MRN LEFT OUTER JOIN
      (
      --Exclude user verified MRNs
      SELECT PatientId 
      FROM Actions 
      WHERE ActionItem = 'MRN Verified'
      ) f ON f.PatientId = a.PatientId
WHERE d.PatientId IS NULL AND
      a.PtMRN <> ISNULL(XREF_MRN,'') AND
      f.PatientId IS NULL
ORDER BY a.PtLastName, a.PtFirstName, a.PtBirthDateText, a.PtMrn, EnteredTime