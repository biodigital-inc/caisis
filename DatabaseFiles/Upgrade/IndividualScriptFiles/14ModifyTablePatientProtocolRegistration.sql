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
ALTER TABLE dbo.PatientProtocolRegistration
	DROP CONSTRAINT FK_PatientProtocolRegistration_PatientProtocols
GO
COMMIT
BEGIN TRANSACTION
GO
CREATE TABLE dbo.Tmp_PatientProtocolRegistration
	(
	PatientProtocolId int NOT NULL,
	PatientProtocolRegistrationId int NOT NULL IDENTITY (1, 1),
	ConsentedBy varchar(50) NULL,
	ConsentedTo varchar(1000) NULL,
	RegisteredBy varchar(50) NULL,
	PhysicianOfRecord varchar(50) NULL,
	ResearchAuthorizationSigned varchar(50) NULL,
	PrivacyPracticeNoticeVerified varchar(50) NULL,
	PtRegistrationAge varchar(50) NULL,
	EnteredBy varchar(50) NOT NULL,
	EnteredTime datetime NOT NULL,
	UpdatedBy varchar(50) NULL,
	UpdatedTime datetime NULL
	)  ON [PRIMARY]
GO
SET IDENTITY_INSERT dbo.Tmp_PatientProtocolRegistration ON
GO
IF EXISTS(SELECT * FROM dbo.PatientProtocolRegistration)
	 EXEC('INSERT INTO dbo.Tmp_PatientProtocolRegistration (PatientProtocolId, PatientProtocolRegistrationId, ConsentedBy, ConsentedTo, RegisteredBy, PhysicianOfRecord, ResearchAuthorizationSigned, PrivacyPracticeNoticeVerified, EnteredBy, EnteredTime, UpdatedBy, UpdatedTime)
		SELECT PatientProtocolId, PatientProtocolRegistrationId, ConsentedBy, ConsentedTo, RegisteredBy, PhysicianOfRecord, ResearchAuthorizationSigned, PrivacyPracticeNoticeVerified, EnteredBy, EnteredTime, UpdatedBy, UpdatedTime FROM dbo.PatientProtocolRegistration WITH (HOLDLOCK TABLOCKX)')
GO
SET IDENTITY_INSERT dbo.Tmp_PatientProtocolRegistration OFF
GO
ALTER TABLE dbo.PatientProtocolRegQuestionnaires
	DROP CONSTRAINT FK_PatientProtocolRegQuestionnaires_PatientProtocolRegistration
GO
DROP TABLE dbo.PatientProtocolRegistration
GO
EXECUTE sp_rename N'dbo.Tmp_PatientProtocolRegistration', N'PatientProtocolRegistration', 'OBJECT' 
GO
ALTER TABLE dbo.PatientProtocolRegistration ADD CONSTRAINT
	PK_PatientProtocolRegistration PRIMARY KEY CLUSTERED 
	(
	PatientProtocolRegistrationId
	) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

GO
CREATE NONCLUSTERED INDEX I_PatientProtocolRegistration_PatientProtocolId ON dbo.PatientProtocolRegistration
	(
	PatientProtocolId
	) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE dbo.PatientProtocolRegistration ADD CONSTRAINT
	FK_PatientProtocolRegistration_PatientProtocols FOREIGN KEY
	(
	PatientProtocolId
	) REFERENCES dbo.PatientProtocols
	(
	PatientProtocolId
	) ON UPDATE  CASCADE 
	 ON DELETE  CASCADE 
	
GO
COMMIT
BEGIN TRANSACTION
GO
ALTER TABLE dbo.PatientProtocolRegQuestionnaires ADD CONSTRAINT
	FK_PatientProtocolRegQuestionnaires_PatientProtocolRegistration FOREIGN KEY
	(
	PatientProtocolRegistrationId
	) REFERENCES dbo.PatientProtocolRegistration
	(
	PatientProtocolRegistrationId
	) ON UPDATE  CASCADE 
	 ON DELETE  CASCADE 
	
GO
COMMIT
GO
