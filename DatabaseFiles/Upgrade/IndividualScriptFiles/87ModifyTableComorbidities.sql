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
CREATE TABLE dbo.Tmp_AuditLog_Comorbidities
	(
	LoggedOperation varchar(50) NULL,
	LoggedBy varchar(50) NULL,
	LoggedTime datetime NULL,
	PatientId int NULL,
	ComorbidityId int NULL,
	ComorbDateText varchar(50) NULL,
	ComorbDate datetime NULL,
	ComorbStopDateText varchar(50) NULL,
	ComorbStopDate datetime NULL,
	ComorbSystem varchar(50) NULL,
	Comorbidity varchar(50) NULL,
	ComorbICD9_Code varchar(50) NULL,
	ComorbICD0_Code varchar(50) NULL,
	ComorbTreatment varchar(50) NULL,
	ComorbGrade varchar(50) NULL,
	ComorbStatus varchar(50) NULL,
	ComorbDuration varchar(50) NULL,
	ComorbNotes varchar(1000) NULL,
	ComorbDataSource varchar(100) NULL,
	ComorbQuality varchar(50) NULL,
	EnteredBy varchar(50) NULL,
	EnteredTime datetime NULL,
	UpdatedBy varchar(50) NULL,
	UpdatedTime datetime NULL,
	LockedBy varchar(50) NULL,
	LockedTime datetime NULL
	)  ON [PRIMARY]
GO
ALTER TABLE dbo.Tmp_AuditLog_Comorbidities SET (LOCK_ESCALATION = TABLE)
GO
IF EXISTS(SELECT * FROM dbo.AuditLog_Comorbidities)
	 EXEC('INSERT INTO dbo.Tmp_AuditLog_Comorbidities (LoggedOperation, LoggedBy, LoggedTime, PatientId, ComorbidityId, ComorbDateText, ComorbDate, ComorbSystem, Comorbidity, ComorbICD9_Code, ComorbICD0_Code, ComorbTreatment, ComorbGrade, ComorbStatus, ComorbDuration, ComorbNotes, ComorbDataSource, ComorbQuality, EnteredBy, EnteredTime, UpdatedBy, UpdatedTime, LockedBy, LockedTime)
		SELECT LoggedOperation, LoggedBy, LoggedTime, PatientId, ComorbidityId, ComorbDateText, ComorbDate, ComorbSystem, Comorbidity, ComorbICD9_Code, ComorbICD0_Code, ComorbTreatment, ComorbGrade, ComorbStatus, ComorbDuration, ComorbNotes, ComorbDataSource, ComorbQuality, EnteredBy, EnteredTime, UpdatedBy, UpdatedTime, LockedBy, LockedTime FROM dbo.AuditLog_Comorbidities WITH (HOLDLOCK TABLOCKX)')
GO
DROP TABLE dbo.AuditLog_Comorbidities
GO
EXECUTE sp_rename N'dbo.Tmp_AuditLog_Comorbidities', N'AuditLog_Comorbidities', 'OBJECT' 
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
ALTER TABLE dbo.Comorbidities
	DROP CONSTRAINT FK_Comorbidities_Patients
GO
ALTER TABLE dbo.Patients SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
BEGIN TRANSACTION
GO
CREATE TABLE dbo.Tmp_Comorbidities
	(
	PatientId int NOT NULL,
	ComorbidityId int NOT NULL IDENTITY (1, 1),
	ComorbDateText varchar(50) NULL,
	ComorbDate datetime NULL,
	ComorbStopDateText varchar(50) NULL,
	ComorbStopDate datetime NULL,
	ComorbSystem varchar(50) NULL,
	Comorbidity varchar(50) NOT NULL,
	ComorbICD9_Code varchar(50) NULL,
	ComorbICD0_Code varchar(50) NULL,
	ComorbTreatment varchar(50) NULL,
	ComorbGrade varchar(50) NULL,
	ComorbStatus varchar(50) NULL,
	ComorbDuration varchar(50) NULL,
	ComorbNotes varchar(1000) NULL,
	ComorbDataSource varchar(100) NULL,
	ComorbQuality varchar(50) NULL,
	EnteredBy varchar(50) NOT NULL,
	EnteredTime datetime NOT NULL,
	UpdatedBy varchar(50) NULL,
	UpdatedTime datetime NULL,
	LockedBy varchar(50) NULL,
	LockedTime datetime NULL
	)  ON [PRIMARY]
GO
ALTER TABLE dbo.Tmp_Comorbidities SET (LOCK_ESCALATION = TABLE)
GO
SET IDENTITY_INSERT dbo.Tmp_Comorbidities ON
GO
IF EXISTS(SELECT * FROM dbo.Comorbidities)
	 EXEC('INSERT INTO dbo.Tmp_Comorbidities (PatientId, ComorbidityId, ComorbDateText, ComorbDate, ComorbSystem, Comorbidity, ComorbICD9_Code, ComorbICD0_Code, ComorbTreatment, ComorbGrade, ComorbStatus, ComorbDuration, ComorbNotes, ComorbDataSource, ComorbQuality, EnteredBy, EnteredTime, UpdatedBy, UpdatedTime, LockedBy, LockedTime)
		SELECT PatientId, ComorbidityId, ComorbDateText, ComorbDate, ComorbSystem, Comorbidity, ComorbICD9_Code, ComorbICD0_Code, ComorbTreatment, ComorbGrade, ComorbStatus, ComorbDuration, ComorbNotes, ComorbDataSource, ComorbQuality, EnteredBy, EnteredTime, UpdatedBy, UpdatedTime, LockedBy, LockedTime FROM dbo.Comorbidities WITH (HOLDLOCK TABLOCKX)')
GO
SET IDENTITY_INSERT dbo.Tmp_Comorbidities OFF
GO
DROP TABLE dbo.Comorbidities
GO
EXECUTE sp_rename N'dbo.Tmp_Comorbidities', N'Comorbidities', 'OBJECT' 
GO
ALTER TABLE dbo.Comorbidities ADD CONSTRAINT
	PK_Comorbidities PRIMARY KEY CLUSTERED 
	(
	ComorbidityId
	) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

GO
CREATE NONCLUSTERED INDEX I_Comorbidities_PatientId ON dbo.Comorbidities
	(
	PatientId
	) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE dbo.Comorbidities WITH NOCHECK ADD CONSTRAINT
	FK_Comorbidities_Patients FOREIGN KEY
	(
	PatientId
	) REFERENCES dbo.Patients
	(
	PatientId
	) ON UPDATE  CASCADE 
	 ON DELETE  CASCADE 
	
GO
CREATE TRIGGER dbo.trgAuditComorbidities_UD
ON dbo.Comorbidities FOR UPDATE, DELETE
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
   INSERT INTO AuditLog_Comorbidities
   SELECT @action AS LoggedOperation, Inserted.UpdatedBy AS LoggedBy, 
          GETDATE() AS LoggedTime, Deleted.*
   FROM Deleted INNER JOIN INSERTED
   ON Deleted.ComorbidityId = Inserted.ComorbidityId
ELSE IF @action = 'DELETE'
   INSERT INTO AuditLog_Comorbidities
   SELECT @action AS LoggedOperation, SYSTEM_USER AS LoggedBy, GETDATE() AS LoggedTime, *
   FROM Deleted
GO
sp_settriggerorder N'trgAuditComorbidities_UD', N'last', N'update'
GO
COMMIT
GO
