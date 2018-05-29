	--SELECT Patients.PatientId FROM Patients.... WHERE last status is metastasis* and not deceased,  and no survey received in last 3 months
	
	  ------------------------------------------------------------------------
      -- Returns patients that meet the following criteria:
      -- * most recent status is 'metastasis'
      -- * patient is not deceased
      -- * EITHER: 
      --   1.) has had no previous survey(s) sent OR,
      --   2.) survey(s) 90 days or more ago, but has not been returned
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
	 LEFT JOIN Status LastStatus
	 ON LastStatus.PatientId = Patients.PatientId
	 AND LastStatus.StatusId IN
	 (
		SELECT TOP 1 StatusId FROM Status
		WHERE Status.PatientId = Patients.PatientId
		ORDER BY StatusDate DESC
	 )
	 
	 WHERE Patients.PtDeathDate IS NULL
		   AND	SurveyReceived.ActionId IS NULL 
		   AND (SurveySent.ActionId IS NULL OR (SurveySent.ActionId IS NOT NULL AND DATEDIFF(day,SurveySent.ActionDate,GETDATE()) >= 90)) 
		   AND LastStatus.Status LIKE '%metastasis%'
