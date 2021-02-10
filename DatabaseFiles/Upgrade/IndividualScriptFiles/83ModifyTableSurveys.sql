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
CREATE TABLE dbo.Tmp_AuditLog_Surveys
	(
	LoggedOperation varchar(50) NULL,
	LoggedBy varchar(50) NULL,
	LoggedTime datetime NULL,
	PatientId int NULL,
	SurveyId int NULL,
	SurveyDateText varchar(50) NULL,
	SurveyDate datetime NULL,
	SurveyType varchar(255) NULL,
	SurveyResult varchar(50) NULL,
	SurveyTotal varchar(50) NULL,
	SurveyVersion varchar(50) NULL,
	SurveyStatus varchar(50) NULL,
	SurveyClinician varchar(50) NULL,
	SurveyNotes varchar(1000) NULL,
	SurveyDataSource varchar(100) NULL,
	SurveyQuality varchar(50) NULL,
	EnteredBy varchar(50) NULL,
	EnteredTime datetime NULL,
	UpdatedBy varchar(50) NULL,
	UpdatedTime datetime NULL,
	LockedBy varchar(50) NULL,
	LockedTime datetime NULL
	)  ON [PRIMARY]
GO
ALTER TABLE dbo.Tmp_AuditLog_Surveys SET (LOCK_ESCALATION = TABLE)
GO
IF EXISTS(SELECT * FROM dbo.AuditLog_Surveys)
	 EXEC('INSERT INTO dbo.Tmp_AuditLog_Surveys (LoggedOperation, LoggedBy, LoggedTime, PatientId, SurveyId, SurveyDateText, SurveyDate, SurveyType, SurveyResult, SurveyTotal, SurveyVersion, SurveyStatus, SurveyNotes, SurveyDataSource, SurveyQuality, EnteredBy, EnteredTime, UpdatedBy, UpdatedTime, LockedBy, LockedTime)
		SELECT LoggedOperation, LoggedBy, LoggedTime, PatientId, SurveyId, SurveyDateText, SurveyDate, SurveyType, SurveyResult, SurveyTotal, SurveyVersion, SurveyStatus, SurveyNotes, SurveyDataSource, SurveyQuality, EnteredBy, EnteredTime, UpdatedBy, UpdatedTime, LockedBy, LockedTime FROM dbo.AuditLog_Surveys WITH (HOLDLOCK TABLOCKX)')
GO
DROP TABLE dbo.AuditLog_Surveys
GO
EXECUTE sp_rename N'dbo.Tmp_AuditLog_Surveys', N'AuditLog_Surveys', 'OBJECT' 
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
ALTER TABLE dbo.Surveys
	DROP CONSTRAINT FK_Surveys_Patients
GO
ALTER TABLE dbo.Patients SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
BEGIN TRANSACTION
GO
CREATE TABLE dbo.Tmp_Surveys
	(
	PatientId int NOT NULL,
	SurveyId int NOT NULL IDENTITY (1, 1),
	SurveyDateText varchar(50) NULL,
	SurveyDate datetime NULL,
	SurveyType varchar(255) NULL,
	SurveyResult varchar(50) NULL,
	SurveyTotal varchar(50) NULL,
	SurveyVersion varchar(50) NULL,
	SurveyStatus varchar(50) NULL,
	SurveyClinician varchar(50) NULL,
	SurveyNotes varchar(1000) NULL,
	SurveyDataSource varchar(100) NULL,
	SurveyQuality varchar(50) NULL,
	EnteredBy varchar(50) NOT NULL,
	EnteredTime datetime NOT NULL,
	UpdatedBy varchar(50) NULL,
	UpdatedTime datetime NULL,
	LockedBy varchar(50) NULL,
	LockedTime datetime NULL
	)  ON [PRIMARY]
GO
ALTER TABLE dbo.Tmp_Surveys SET (LOCK_ESCALATION = TABLE)
GO
SET IDENTITY_INSERT dbo.Tmp_Surveys ON
GO
IF EXISTS(SELECT * FROM dbo.Surveys)
	 EXEC('INSERT INTO dbo.Tmp_Surveys (PatientId, SurveyId, SurveyDateText, SurveyDate, SurveyType, SurveyResult, SurveyTotal, SurveyVersion, SurveyStatus, SurveyNotes, SurveyDataSource, SurveyQuality, EnteredBy, EnteredTime, UpdatedBy, UpdatedTime, LockedBy, LockedTime)
		SELECT PatientId, SurveyId, SurveyDateText, SurveyDate, SurveyType, SurveyResult, SurveyTotal, SurveyVersion, SurveyStatus, SurveyNotes, SurveyDataSource, SurveyQuality, EnteredBy, EnteredTime, UpdatedBy, UpdatedTime, LockedBy, LockedTime FROM dbo.Surveys WITH (HOLDLOCK TABLOCKX)')
GO
SET IDENTITY_INSERT dbo.Tmp_Surveys OFF
GO
ALTER TABLE dbo.SurveyItems
	DROP CONSTRAINT FK_SurveyItems_Surveys
GO
DROP TABLE dbo.Surveys
GO
EXECUTE sp_rename N'dbo.Tmp_Surveys', N'Surveys', 'OBJECT' 
GO
ALTER TABLE dbo.Surveys ADD CONSTRAINT
	PK_Surveys PRIMARY KEY CLUSTERED 
	(
	SurveyId
	) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

GO
CREATE NONCLUSTERED INDEX I_Surveys_PatientId ON dbo.Surveys
	(
	PatientId
	) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE dbo.Surveys WITH NOCHECK ADD CONSTRAINT
	FK_Surveys_Patients FOREIGN KEY
	(
	PatientId
	) REFERENCES dbo.Patients
	(
	PatientId
	) ON UPDATE  CASCADE 
	 ON DELETE  CASCADE 
	
GO
CREATE TRIGGER dbo.trgAuditSurveys_UD
ON dbo.Surveys FOR UPDATE, DELETE
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
   INSERT INTO AuditLog_Surveys
   SELECT @action AS LoggedOperation, Inserted.UpdatedBy AS LoggedBy, 
          GETDATE() AS LoggedTime, Deleted.*
   FROM Deleted INNER JOIN INSERTED
   ON Deleted.SurveyId = Inserted.SurveyId
ELSE IF @action = 'DELETE'
   INSERT INTO AuditLog_Surveys
   SELECT @action AS LoggedOperation, SYSTEM_USER AS LoggedBy, GETDATE() AS LoggedTime, *
   FROM Deleted
GO
sp_settriggerorder N'trgAuditSurveys_UD', N'last', N'update'
GO
COMMIT
BEGIN TRANSACTION
GO
ALTER TABLE dbo.SurveyItems WITH NOCHECK ADD CONSTRAINT
	FK_SurveyItems_Surveys FOREIGN KEY
	(
	SurveyId
	) REFERENCES dbo.Surveys
	(
	SurveyId
	) ON UPDATE  CASCADE 
	 ON DELETE  CASCADE 	
GO
ALTER TABLE dbo.SurveyItems SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
GO
