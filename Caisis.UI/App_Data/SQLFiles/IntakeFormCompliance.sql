/*
	Description: This code generates a report that shows how many patients have new clinic visits
				 but an Intake Eform was not created/approved. Original requester group is Colorectal. However,
				 the report was designed to be used accross all Caisis groups that has data feeding in by the appointment feed.
				 Parameters: Appointment physician's name, ApptDept, EformName, FromDate and ToDate  
*/

-- declare Parameters
--DECLARE @ApptPhysician varchar(100)
--DECLARE @ApptDepartment Varchar(100)
--DECLARE @Eform Varchar(100)
--DECLARE @FromDate DateTime
--DECLARE @ToDate DateTime

-- Set parameters (user input)
--SET @ApptPhysician = '' -- this is an input parameter (user chooses physician's name)
--SET @ApptDepartment = '' -- this is an input parameter (user chooses physician's clinic location)
--SET @Eform = '' -- this is an input parameter (user chooses eform name)
--SET @FromDate = '' -- this is an input Paremeter (user chooses from-date)
--SET @ToDate = '' -- this is an input Paremeter (user chooses to-date)


--Drop Table #ApptNewVisit
SELECT * INTO #ApptNewVisit
FROM 
	(
	SELECT AppointmentId, ApptPatientId, ApptMRN, ApptTime, ApptLastName, 
			ApptFirstName, ApptPhysician, ApptDept, ApptClinicDate, ApptVisitType, ApptNotes
	FROM Appointments WHERE ApptDept = ''+@ApptDepartment+'' --'COLORECTAL 53'
	AND ApptVisitType IN ('IR', 'IR1', 'IR2', 'NV', 'NV1', 'NV3') AND ApptPatientId IS NOT NULL
	) a
	
 
 --Drop Table #IntakeForm

SELECT * INTO #IntakeForm
FROM
(SELECT EformName, CurrentStatus, PatientId, UpdatedBy FROM EFORMS WHERE EformName = ''+ @Eform + '' /*'Colorectal Intake EForm'*/)a


SELECT a.ApptPhysician Physician, /*a.ApptClinicDate,*/ REPLACE((CONVERT(VARCHAR, a.ApptTime, 9)), ':00:000','') ApptDateTime, a.ApptMRN MRN, 
	   a.ApptLastName LastName, a.ApptFirstName FirstName,
	   a.ApptVisitType VisitType, a.ApptNotes Notes, b.EformName, b.CurrentStatus EformStatus, b.UpdatedBy
FROM #ApptNewVisit a LEFT OUTER JOIN
#IntakeForm b ON a.ApptPatientId = b.PatientId
WHERE ((b.PatientId IS NULL AND a.ApptPatientId IS NOT NULL) OR CurrentStatus NOT IN ('Approved', 'Deleted'))
AND a.ApptClinicDate BETWEEN @FromDate AND @ToDate AND a.ApptPhysician = ''+ @ApptPhysician +''
