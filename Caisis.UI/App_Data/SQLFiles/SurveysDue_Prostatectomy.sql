      ------------------------------------------------------------------------
      -- Returns patients that meet the following criteria:
      -- * had a prostectomy procedure 365 days or more ago
      -- * has NOT had a PSA lab test within the last 365 days
      -- * EITHER: 
      --   1.) has had no previous survey(s) sent OR,
      --   2.) survey(s) sent 365 days or more ago, but has not been returned
      --
      ------------------------------------------------------------------------
      
      SELECT Patients.* ,SurveySent.* FROM Patients
      LEFT JOIN Actions SurveyReceived
      ON SurveyReceived.PatientId = Patients.PatientId
      AND SurveyReceived.ActionId IN
      (
        SELECT TOP 1 ActionId FROM Actions
        WHERE Actions.PatientId = Patients.PatientId
        AND ActionItem = 'DataReceived'
        ORDER BY ActionDate DESC
      )
      LEFT JOIN Actions SurveySent
      ON SurveySent.PatientId = Patients.PatientId
      AND SurveySent.ActionId IN
      (
        SELECT TOP 1 ActionId FROM Actions
        WHERE Actions.PatientId = Patients.PatientId
        AND ActionItem LIKE '%Letter%_Sent%'
        ORDER BY ActionDate DESC
      )
      LEFT JOIN LabTests RecentLab_PSA
      ON RecentLab_PSA.PatientId = Patients.PatientId
      AND RecentLab_PSA.LabTestId IN
      (
        SELECT TOP 1 LabTestId FROM LabTests
        WHERE LabTests.PatientId = Patients.PatientId
        AND DATEDIFF(day,LabDate,GETDATE()) < 365	 
	      AND LabTest = 'PSA'
	      ORDER BY LabDate DESC
     )
      LEFT JOIN Procedures Procedure_Prostatectomy
     ON Procedure_Prostatectomy.PatientId = Patients.PatientId
     AND Procedure_Prostatectomy.ProcedureId IN
     (
	      SELECT TOP 1 ProcedureId FROM Procedures
	      WHERE Procedures.PatientId = Patients.PatientId
	      AND DATEDIFF(day,ProcDate,GETDATE()) >= 365	 
	      AND
	      (
		      ProcName = 'RP'
		      OR ProcName LIKE '%prostatectomy%'	
	      )
	      ORDER BY ProcDate DESC
     )
     
     WHERE SurveyReceived.ActionId IS NULL 
           AND (SurveySent.ActionId IS NULL OR (SurveySent.ActionId IS NOT NULL AND DATEDIFF(day,SurveySent.ActionDate,GETDATE()) >= 365)) 
           AND RecentLab_PSA.LabTestId IS NULL
           AND Procedure_Prostatectomy.ProcedureId IS NOT NULL   