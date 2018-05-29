/*
Description:
			Generate a report for protocol numbers with the following criteria: 
			User will type a Protocol number, select an appointment physician and
			an appointment date range. The report will display the latest protocol information
			for qualified patients. It will also show appointments 
			where no information was entered for the identified protocol.
Note: the code was designed to use accross multiple datasets and any valid protocol number
*/

SELECT b.MRN, b.[Last Name], b.[First Name], a.PtBirthDateText DOB, a.PtLanguage 'Patient Language',
		b.[Physician], b.[ApptDate], b.[Visit Type], b.[Protocol #], 
		b.[Protocol Status Date], b.[Protocol Status], b.[Protocol status reason], 
		b.[Protocol Status Notes], b.EnteredBy, b.UpdatedBy
FROM Patients a RIGHT OUTER JOIN
( 
	SELECT * 
	FROM
		(	-- code in this block is the original code before users request to add PtLanguage (3/22/12)
			SELECT DISTINCT a.ApptMRN MRN, a.ApptLastName 'Last Name', a.ApptFirstName 'First Name', 
					a.ApptPhysician 'Physician', a.ApptTime 'ApptDate', a.ApptVisitType 'Visit Type',
					b.ProtocolNum 'Protocol #', CONVERT(VARCHAR, b.PtProtocolStatusDate, 101) 'Protocol Status Date', b.PtProtocolStatus 'Protocol Status', 
					b.PtProtocolStatusReason 'Protocol status reason', 
					b.PtProtocolStatusNotes 'Protocol Status Notes', b.EnteredBy, b.UpdatedBy 
			FROM Appointments a LEFT OUTER JOIN 
				(
					SELECT  DISTINCT AllStatusDate.ApptMRN, AllStatusDate.ProtocolNum, AllStatusDate.ApptLastName, AllStatusDate.ApptFirstName, AllStatusDate.ApptPhysician, AllStatusDate.ApptClinicDate,
							MaxStatusDate.PtProtocolStatusDate, AllStatusDate.PtProtocolStatus, AllStatusDate.PtProtocolStatusReason,
							AllStatusDate.PtProtocolStatusNotes, AllStatusDate.EnteredBy, AllStatusDate.UpdatedBy

					FROM 

						(SELECT e.ProtocolNum, a.ApptMRN, a.ApptLastName, a.ApptFirstName, a.ApptPhysician, a.ApptClinicDate, d.PtProtocolStatusDate,
								d.PtProtocolStatus, d.PtProtocolStatusReason, d.PtProtocolStatusNotes, d.EnteredBy, d.UpdatedBy
								
						FROM 
						Appointments a INNER JOIN Patients b on a.ApptPatientId = b.PatientId
										INNER JOIN PatientProtocols c on b.PatientId = c.PatientId
										INNER JOIN PatientProtocolStatus d on c.PatientProtocolId = d.PatientProtocolId
										INNER JOIN Protocols e on c.ProtocolId = e.ProtocolId
						WHERE e.ProtocolNum = @ProtocolNum AND a.ApptPhysician LIKE '%' + @Physician + '%' AND (a.apptClinicDate BETWEEN @FromDate AND @ToDate)
						) AllStatusDate   
					INNER JOIN 
						(

							SELECT ApptMRN, ApptLastName, ApptFirstName, ApptPhysician, ApptClinicDate, 
									MAX(PtProtocolStatusDate) PtProtocolStatusDate
							FROM
								(

									SELECT e.ProtocolNum, a.ApptMRN, a.ApptLastName, a.ApptFirstName, a.ApptPhysician, a.ApptClinicDate, d.PtProtocolStatusDate,
											d.PtProtocolStatus, d.PtProtocolStatusReason, d.PtProtocolStatusNotes, d.EnteredBy, d.UpdatedBy
											
									FROM 
									Appointments a INNER JOIN Patients b on a.ApptPatientId = b.PatientId
													INNER JOIN PatientProtocols c on b.PatientId = c.PatientId
													INNER JOIN PatientProtocolStatus d on c.PatientProtocolId = d.PatientProtocolId
													INNER JOIN Protocols e on c.ProtocolId = e.ProtocolId
									WHERE e.ProtocolNum = @ProtocolNum AND a.ApptPhysician Like '%' + @Physician + '%' AND (a.apptClinicDate BETWEEN @FromDate AND @ToDate)
								) a 
							GROUP BY ApptMRN, ApptLastName, ApptFirstName, ApptPhysician, ApptClinicDate
						) MaxStatusDate ON 
										AllStatusDate.ApptMRN = MaxStatusDate.ApptMRN AND AllStatusDate.ApptLastName = MaxStatusDate.ApptLastName AND
										AllStatusDate.ApptFirstName = MaxStatusDate.ApptFirstName AND AllStatusDate.ApptPhysician = MaxStatusDate.ApptPhysician AND
										AllStatusDate.ApptClinicDate = MaxStatusDate.ApptClinicDate AND AllStatusDate.PtProtocolStatusDate = MaxStatusDate.PtProtocolStatusDate 
						) b ON a.ApptMRN = b.ApptMRN
			WHERE a.ApptPhysician Like '%' + @Physician + '%' AND (a.apptClinicDate BETWEEN @FromDate AND @ToDate)AND a.ApptMRN IS NOT NULL
			--ORDER BY a.ApptMRN, b.ProtocolNum, a.ApptTime DESC
		) z 
) b ON a.PtMrn = b.MRN
ORDER BY b.MRN, b.[Protocol #], b.[ApptDate] DESC 
