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
CREATE TABLE dbo.Tmp_AuditLog_Toxicities
	(
	LoggedOperation varchar(50) NULL,
	LoggedBy varchar(50) NULL,
	LoggedTime datetime NULL,
	PatientId int NULL,
	OperatingRoomDetailId int NULL,
	ToxicityId int NULL,
	ToxDateText varchar(50) NULL,
	ToxDate datetime NULL,
	ToxName varchar(100) NULL,
	ToxScale varchar(50) NULL,
	ToxClass varchar(50) NULL,
	ToxCategory varchar(255) NULL,
	ToxGrade varchar(50) NULL,
	ToxGradeCriteria varchar(255) NULL,
	ToxRelatedTo varchar(50) NULL,
	ToxProbability varchar(50) NULL,
	ToxIntervention varchar(50) NULL,
	ToxStopDateText varchar(50) NULL,
	ToxStopDate datetime NULL,
	ToxExpected bit NULL,
	ToxDiscontinueTherapy bit NULL,
	ToxBaseLine bit NULL,
	ToxSAE bit NULL,
	ToxOngoing bit NULL,
	ToxNotes varchar(1000) NULL,
	ToxDataSource varchar(100) NULL,
	ToxQuality varchar(50) NULL,
	EnteredBy varchar(50) NULL,
	EnteredTime datetime NULL,
	UpdatedBy varchar(50) NULL,
	UpdatedTime datetime NULL,
	LockedBy varchar(50) NULL,
	LockedTime datetime NULL
	)  ON [PRIMARY]
GO
ALTER TABLE dbo.Tmp_AuditLog_Toxicities SET (LOCK_ESCALATION = TABLE)
GO
IF EXISTS(SELECT * FROM dbo.AuditLog_Toxicities)
	 EXEC('INSERT INTO dbo.Tmp_AuditLog_Toxicities (LoggedOperation, LoggedBy, LoggedTime, PatientId, OperatingRoomDetailId, ToxicityId, ToxDateText, ToxDate, ToxName, ToxScale, ToxClass, ToxCategory, ToxGrade, ToxGradeCriteria, ToxRelatedTo, ToxProbability, ToxIntervention, ToxStopDateText, ToxStopDate, ToxExpected, ToxDiscontinueTherapy, ToxBaseLine, ToxSAE, ToxNotes, ToxDataSource, ToxQuality, EnteredBy, EnteredTime, UpdatedBy, UpdatedTime, LockedBy, LockedTime)
		SELECT LoggedOperation, LoggedBy, LoggedTime, PatientId, OperatingRoomDetailId, ToxicityId, ToxDateText, ToxDate, ToxName, ToxScale, ToxClass, ToxCategory, ToxGrade, ToxGradeCriteria, ToxRelatedTo, ToxProbability, ToxIntervention, ToxStopDateText, ToxStopDate, ToxExpected, ToxDiscontinueTherapy, ToxBaseLine, ToxSAE, ToxNotes, ToxDataSource, ToxQuality, EnteredBy, EnteredTime, UpdatedBy, UpdatedTime, LockedBy, LockedTime FROM dbo.AuditLog_Toxicities WITH (HOLDLOCK TABLOCKX)')
GO
DROP TABLE dbo.AuditLog_Toxicities
GO
EXECUTE sp_rename N'dbo.Tmp_AuditLog_Toxicities', N'AuditLog_Toxicities', 'OBJECT' 
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
ALTER TABLE dbo.Toxicities
	DROP CONSTRAINT FK_Toxicities_Patients
GO
ALTER TABLE dbo.Patients SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
BEGIN TRANSACTION
GO
ALTER TABLE dbo.Toxicities
	DROP CONSTRAINT DF_Toxicities_ToxExpected
GO
ALTER TABLE dbo.Toxicities
	DROP CONSTRAINT DF_Toxicities_ToxDiscontinueTherapy
GO
ALTER TABLE dbo.Toxicities
	DROP CONSTRAINT DF_Toxicities_ToxBaseLine
GO
ALTER TABLE dbo.Toxicities
	DROP CONSTRAINT DF_Toxicities_ToxSAE
GO
CREATE TABLE dbo.Tmp_Toxicities
	(
	PatientId int NOT NULL,
	OperatingRoomDetailId int NULL,
	ToxicityId int NOT NULL IDENTITY (1, 1),
	ToxDateText varchar(50) NULL,
	ToxDate datetime NULL,
	ToxName varchar(100) NULL,
	ToxScale varchar(50) NULL,
	ToxClass varchar(50) NULL,
	ToxCategory varchar(255) NULL,
	ToxGrade varchar(50) NULL,
	ToxGradeCriteria varchar(255) NULL,
	ToxRelatedTo varchar(50) NULL,
	ToxProbability varchar(50) NULL,
	ToxIntervention varchar(50) NULL,
	ToxStopDateText varchar(50) NULL,
	ToxStopDate datetime NULL,
	ToxExpected bit NULL,
	ToxDiscontinueTherapy bit NULL,
	ToxBaseLine bit NULL,
	ToxSAE bit NULL,
	ToxOngoing bit NULL,
	ToxNotes varchar(1000) NULL,
	ToxDataSource varchar(100) NULL,
	ToxQuality varchar(50) NULL,
	EnteredBy varchar(50) NOT NULL,
	EnteredTime datetime NOT NULL,
	UpdatedBy varchar(50) NULL,
	UpdatedTime datetime NULL,
	LockedBy varchar(50) NULL,
	LockedTime datetime NULL
	)  ON [PRIMARY]
GO
ALTER TABLE dbo.Tmp_Toxicities SET (LOCK_ESCALATION = TABLE)
GO
ALTER TABLE dbo.Tmp_Toxicities ADD CONSTRAINT
	DF_Toxicities_ToxExpected DEFAULT ((0)) FOR ToxExpected
GO
ALTER TABLE dbo.Tmp_Toxicities ADD CONSTRAINT
	DF_Toxicities_ToxDiscontinueTherapy DEFAULT ((0)) FOR ToxDiscontinueTherapy
GO
ALTER TABLE dbo.Tmp_Toxicities ADD CONSTRAINT
	DF_Toxicities_ToxBaseLine DEFAULT ((0)) FOR ToxBaseLine
GO
ALTER TABLE dbo.Tmp_Toxicities ADD CONSTRAINT
	DF_Toxicities_ToxSAE DEFAULT ((0)) FOR ToxSAE
GO
SET IDENTITY_INSERT dbo.Tmp_Toxicities ON
GO
IF EXISTS(SELECT * FROM dbo.Toxicities)
	 EXEC('INSERT INTO dbo.Tmp_Toxicities (PatientId, OperatingRoomDetailId, ToxicityId, ToxDateText, ToxDate, ToxName, ToxScale, ToxClass, ToxCategory, ToxGrade, ToxGradeCriteria, ToxRelatedTo, ToxProbability, ToxIntervention, ToxStopDateText, ToxStopDate, ToxExpected, ToxDiscontinueTherapy, ToxBaseLine, ToxSAE, ToxNotes, ToxDataSource, ToxQuality, EnteredBy, EnteredTime, UpdatedBy, UpdatedTime, LockedBy, LockedTime)
		SELECT PatientId, OperatingRoomDetailId, ToxicityId, ToxDateText, ToxDate, ToxName, ToxScale, ToxClass, ToxCategory, ToxGrade, ToxGradeCriteria, ToxRelatedTo, ToxProbability, ToxIntervention, ToxStopDateText, ToxStopDate, ToxExpected, ToxDiscontinueTherapy, ToxBaseLine, ToxSAE, ToxNotes, ToxDataSource, ToxQuality, EnteredBy, EnteredTime, UpdatedBy, UpdatedTime, LockedBy, LockedTime FROM dbo.Toxicities WITH (HOLDLOCK TABLOCKX)')
GO
SET IDENTITY_INSERT dbo.Tmp_Toxicities OFF
GO
ALTER TABLE dbo.ToxAttribution
	DROP CONSTRAINT FK_ToxAttribution_Toxicities
GO
ALTER TABLE dbo.SeriousAdverseEvents
	DROP CONSTRAINT FK_SeriousAdverseEvents_Toxicities
GO
DROP TABLE dbo.Toxicities
GO
EXECUTE sp_rename N'dbo.Tmp_Toxicities', N'Toxicities', 'OBJECT' 
GO
ALTER TABLE dbo.Toxicities ADD CONSTRAINT
	PK_Toxicities PRIMARY KEY CLUSTERED 
	(
	ToxicityId
	) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

GO
CREATE NONCLUSTERED INDEX I_Toxicities_PatientId ON dbo.Toxicities
	(
	PatientId
	) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE dbo.Toxicities WITH NOCHECK ADD CONSTRAINT
	FK_Toxicities_Patients FOREIGN KEY
	(
	PatientId
	) REFERENCES dbo.Patients
	(
	PatientId
	) ON UPDATE  CASCADE 
	 ON DELETE  CASCADE 
	
GO
CREATE TRIGGER dbo.trgAuditToxicities_UD
ON dbo.Toxicities FOR UPDATE, DELETE
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
   INSERT INTO AuditLog_Toxicities
   SELECT @action AS LoggedOperation, Inserted.UpdatedBy AS LoggedBy, 
          GETDATE() AS LoggedTime, Deleted.*
   FROM Deleted INNER JOIN INSERTED
   ON Deleted.ToxicityId = Inserted.ToxicityId
ELSE IF @action = 'DELETE'
   INSERT INTO AuditLog_Toxicities
   SELECT @action AS LoggedOperation, SYSTEM_USER AS LoggedBy, GETDATE() AS LoggedTime, *
   FROM Deleted
GO
sp_settriggerorder N'trgAuditToxicities_UD', N'last', N'update'
GO
COMMIT
BEGIN TRANSACTION
GO
ALTER TABLE dbo.SeriousAdverseEvents ADD CONSTRAINT
	FK_SeriousAdverseEvents_Toxicities FOREIGN KEY
	(
	ToxicityId
	) REFERENCES dbo.Toxicities
	(
	ToxicityId
	) ON UPDATE  CASCADE 
	 ON DELETE  CASCADE 
	
GO
ALTER TABLE dbo.SeriousAdverseEvents SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
BEGIN TRANSACTION
GO
ALTER TABLE dbo.ToxAttribution ADD CONSTRAINT
	FK_ToxAttribution_Toxicities FOREIGN KEY
	(
	ToxicityId
	) REFERENCES dbo.Toxicities
	(
	ToxicityId
	) ON UPDATE  CASCADE 
	 ON DELETE  CASCADE 
	
GO
ALTER TABLE dbo.ToxAttribution SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
GO
