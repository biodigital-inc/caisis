BEGIN TRANSACTION
SET QUOTED_IDENTIFIER ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ANSI_NULLS ON
SET ANSI_PADDING ON
SET ANSI_WARNINGS ON
COMMIT
BEGIN TRANSACTION
GO
CREATE TABLE dbo.Tmp_AuditLog_Appointments
	(
	LoggedOperation varchar(50) NULL,
	LoggedBy varchar(50) NULL,
	LoggedTime datetime NULL,
	AppointmentId int NULL,
	ApptPatientId int NULL,
	ApptMRN varchar(50) NULL,
	ApptTime datetime NULL,
	ApptLastName varchar(50) NULL,
	ApptFirstName varchar(50) NULL,
	ApptBirthDate datetime NULL,
	ApptPhysician varchar(50) NULL,
	ApptVisitType varchar(50) NULL,
	ApptDept varchar(50) NULL,
	ApptClinicDate datetime NULL,
	ApptNotes varchar(1000) NULL,
	ApptICD_Code varchar(50) NULL,
	ApptICD_CodeDescription varchar(50) NULL,
	ApptHide varchar(50) NULL,
	ApptStatus varchar(50) NULL,
	EnteredBy varchar(50) NULL,
	EnteredTime datetime NULL,
	UpdatedBy varchar(50) NULL,
	UpdatedTime datetime NULL
	)  ON [PRIMARY]
GO
IF EXISTS(SELECT * FROM dbo.AuditLog_Appointments)
	 EXEC('INSERT INTO dbo.Tmp_AuditLog_Appointments (LoggedOperation, LoggedBy, LoggedTime, AppointmentId, ApptPatientId, ApptMRN, ApptTime, ApptLastName, ApptFirstName, ApptBirthDate, ApptPhysician, ApptVisitType, ApptDept, ApptClinicDate, ApptNotes, ApptICD_Code, ApptICD_CodeDescription, ApptHide, EnteredBy, EnteredTime, UpdatedBy, UpdatedTime)
		SELECT LoggedOperation, LoggedBy, LoggedTime, AppointmentId, ApptPatientId, ApptMRN, ApptTime, ApptLastName, ApptFirstName, ApptBirthDate, ApptPhysician, ApptVisitType, ApptDept, ApptClinicDate, ApptNotes, ApptICD_Code, ApptICD_CodeDescription, ApptHide, EnteredBy, EnteredTime, UpdatedBy, UpdatedTime FROM dbo.AuditLog_Appointments WITH (HOLDLOCK TABLOCKX)')
GO
DROP TABLE dbo.AuditLog_Appointments
GO
EXECUTE sp_rename N'dbo.Tmp_AuditLog_Appointments', N'AuditLog_Appointments', 'OBJECT' 
GO
COMMIT
GO
BEGIN TRANSACTION
SET QUOTED_IDENTIFIER ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ANSI_NULLS ON
SET ANSI_PADDING ON
SET ANSI_WARNINGS ON
COMMIT
BEGIN TRANSACTION
GO
CREATE TABLE dbo.Tmp_Appointments
	(
	AppointmentId int NOT NULL IDENTITY (1, 1),
	ApptPatientId int NULL,
	ApptMRN varchar(50) NULL,
	ApptTime datetime NULL,
	ApptLastName varchar(50) NULL,
	ApptFirstName varchar(50) NULL,
	ApptBirthDate datetime NULL,
	ApptPhysician varchar(50) NULL,
	ApptVisitType varchar(50) NULL,
	ApptDept varchar(50) NULL,
	ApptClinicDate datetime NULL,
	ApptNotes varchar(1000) NULL,
	ApptICD_Code varchar(50) NULL,
	ApptICD_CodeDescription varchar(50) NULL,
	ApptHide varchar(50) NULL,
	ApptStatus varchar(50) NULL,
	EnteredBy varchar(50) NOT NULL,
	EnteredTime datetime NOT NULL,
	UpdatedBy varchar(50) NULL,
	UpdatedTime datetime NULL
	)  ON [PRIMARY]
GO
SET IDENTITY_INSERT dbo.Tmp_Appointments ON
GO
IF EXISTS(SELECT * FROM dbo.Appointments)
	 EXEC('INSERT INTO dbo.Tmp_Appointments (AppointmentId, ApptPatientId, ApptMRN, ApptTime, ApptLastName, ApptFirstName, ApptBirthDate, ApptPhysician, ApptVisitType, ApptDept, ApptClinicDate, ApptNotes, ApptICD_Code, ApptICD_CodeDescription, ApptHide, EnteredBy, EnteredTime, UpdatedBy, UpdatedTime)
		SELECT AppointmentId, ApptPatientId, ApptMRN, ApptTime, ApptLastName, ApptFirstName, ApptBirthDate, ApptPhysician, ApptVisitType, ApptDept, ApptClinicDate, ApptNotes, ApptICD_Code, ApptICD_CodeDescription, ApptHide, EnteredBy, EnteredTime, UpdatedBy, UpdatedTime FROM dbo.Appointments WITH (HOLDLOCK TABLOCKX)')
GO
SET IDENTITY_INSERT dbo.Tmp_Appointments OFF
GO
DROP TABLE dbo.Appointments
GO
EXECUTE sp_rename N'dbo.Tmp_Appointments', N'Appointments', 'OBJECT' 
GO
ALTER TABLE dbo.Appointments ADD CONSTRAINT
	PK_Appointments PRIMARY KEY CLUSTERED 
	(
	AppointmentId
	) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

GO
CREATE NONCLUSTERED INDEX I_Appointments_ApptPatientId ON dbo.Appointments
	(
	ApptPatientId
	) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
CREATE TRIGGER dbo.trgAuditAppointments_UD
ON dbo.Appointments FOR UPDATE, DELETE
AS
DECLARE @i int
DECLARE @d int
DECLARE @action char(6)
IF (@@ROWCOUNT = 0) RETURN 
SELECT @i = COUNT(*) FROM Inserted
SELECT @d = COUNT(*) FROM Deleted
SELECT @action = CASE 
WHEN (@i <> 0) and (@d <> 0) THEN 'UPDATE'
WHEN (@i = 0) and (@d <> 0) THEN 'DELETE'
END
IF @action = 'UPDATE'
   INSERT INTO AuditLog_Appointments
   SELECT @action AS LoggedOperation, Inserted.UpdatedBy AS LoggedBy, 
          GETDATE() AS LoggedTime, Deleted.*
   FROM Deleted INNER JOIN INSERTED
   ON Deleted.AppointmentId = Inserted.AppointmentId
ELSE IF @action = 'DELETE'
   INSERT INTO AuditLog_Appointments
   SELECT @action AS LoggedOperation, SYSTEM_USER AS LoggedBy, GETDATE() AS LoggedTime, *
   FROM Deleted
GO
COMMIT
GO