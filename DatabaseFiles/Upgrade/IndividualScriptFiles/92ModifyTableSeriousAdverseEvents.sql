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
CREATE TABLE dbo.Tmp_AuditLog_SeriousAdverseEvents
	(
	LoggedOperation varchar(50) NULL,
	LoggedBy varchar(50) NULL,
	LoggedTime datetime NULL,
	ToxicityId int NULL,
	ContactId int NULL,
	SAE_Age varchar(50) NULL,
	SAE_AttributedOutcome varchar(50) NULL,
	SAE_ReportDateText varchar(50) NULL,
	SAE_ReportDate datetime NULL,
	SAE_EventDescription varchar(1000) NULL,
	SAE_RelevantTestData varchar(50) NULL,
	SAE_OtherRelevantHistory varchar(1000) NULL,
	SAE_ConcommitantMeds varchar(1000) NULL,
	SAE_NDC_Number varchar(50) NULL,
	SAE_EventAbated1 varchar(50) NULL,
	SAE_EventAbated2 varchar(50) NULL,
	SAE_EventReappeared1 varchar(50) NULL,
	SAE_EventReappeared2 varchar(50) NULL,
	SAE_ReportingIndividual varchar(50) NULL,
	SAE_ReportFDA_DateText varchar(50) NULL,
	SAE_ReportFDA_Date datetime NULL,
	SAE_ReportFDA_Status varchar(50) NULL,
	SAE_Sequelae varchar(1000) NULL,
	SAE_ReportedToIRB varchar(50) NULL,
	SAE_Death bit NULL,
	SAE_LifeThreatening bit NULL,
	SAE_Hospitalization bit NULL,
	SAE_Disability bit NULL,
	SAE_Congenital bit NULL,
	SAE_MIE bit NULL,
	SAE_SignedDate datetime NULL,
	SAE_Investigator varchar(50) NULL,
	SAE_Notes varchar(1000) NULL,
	EnteredBy varchar(50) NULL,
	EnteredTime datetime NULL,
	UpdatedBy varchar(50) NULL,
	UpdatedTime datetime NULL
	)  ON [PRIMARY]
GO
ALTER TABLE dbo.Tmp_AuditLog_SeriousAdverseEvents SET (LOCK_ESCALATION = TABLE)
GO
IF EXISTS(SELECT * FROM dbo.AuditLog_SeriousAdverseEvents)
	 EXEC('INSERT INTO dbo.Tmp_AuditLog_SeriousAdverseEvents (LoggedOperation, LoggedBy, LoggedTime, ToxicityId, ContactId, SAE_Age, SAE_AttributedOutcome, SAE_ReportDateText, SAE_ReportDate, SAE_EventDescription, SAE_RelevantTestData, SAE_OtherRelevantHistory, SAE_ConcommitantMeds, SAE_NDC_Number, SAE_EventAbated1, SAE_EventAbated2, SAE_EventReappeared1, SAE_EventReappeared2, SAE_ReportingIndividual, SAE_ReportFDA_DateText, SAE_ReportFDA_Date, SAE_ReportFDA_Status, SAE_Sequelae, SAE_ReportedToIRB, SAE_Notes, EnteredBy, EnteredTime, UpdatedBy, UpdatedTime)
		SELECT LoggedOperation, LoggedBy, LoggedTime, ToxicityId, ContactId, SAE_Age, SAE_AttributedOutcome, SAE_ReportDateText, SAE_ReportDate, SAE_EventDescription, SAE_RelevantTestData, SAE_OtherRelevantHistory, SAE_ConcommitantMeds, SAE_NDC_Number, SAE_EventAbated1, SAE_EventAbated2, SAE_EventReappeared1, SAE_EventReappeared2, SAE_ReportingIndividual, SAE_ReportFDA_DateText, SAE_ReportFDA_Date, SAE_ReportFDA_Status, SAE_Sequelae, SAE_ReportedToIRB, SAE_Notes, EnteredBy, EnteredTime, UpdatedBy, UpdatedTime FROM dbo.AuditLog_SeriousAdverseEvents WITH (HOLDLOCK TABLOCKX)')
GO
DROP TABLE dbo.AuditLog_SeriousAdverseEvents
GO
EXECUTE sp_rename N'dbo.Tmp_AuditLog_SeriousAdverseEvents', N'AuditLog_SeriousAdverseEvents', 'OBJECT' 
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
ALTER TABLE dbo.SeriousAdverseEvents
	DROP CONSTRAINT FK_SeriousAdverseEvents_Toxicities
GO
ALTER TABLE dbo.Toxicities SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
BEGIN TRANSACTION
GO
CREATE TABLE dbo.Tmp_SeriousAdverseEvents
	(
	ToxicityId int NOT NULL,
	ContactId int NULL,
	SAE_Age varchar(50) NULL,
	SAE_AttributedOutcome varchar(50) NULL,
	SAE_ReportDateText varchar(50) NULL,
	SAE_ReportDate datetime NULL,
	SAE_EventDescription varchar(1000) NULL,
	SAE_RelevantTestData varchar(50) NULL,
	SAE_OtherRelevantHistory varchar(1000) NULL,
	SAE_ConcommitantMeds varchar(1000) NULL,
	SAE_NDC_Number varchar(50) NULL,
	SAE_EventAbated1 varchar(50) NULL,
	SAE_EventAbated2 varchar(50) NULL,
	SAE_EventReappeared1 varchar(50) NULL,
	SAE_EventReappeared2 varchar(50) NULL,
	SAE_ReportingIndividual varchar(50) NULL,
	SAE_ReportFDA_DateText varchar(50) NULL,
	SAE_ReportFDA_Date datetime NULL,
	SAE_ReportFDA_Status varchar(50) NULL,
	SAE_Sequelae varchar(1000) NULL,
	SAE_ReportedToIRB varchar(50) NULL,
	SAE_Death bit NULL,
	SAE_LifeThreatening bit NULL,
	SAE_Hospitalization bit NULL,
	SAE_Disability bit NULL,
	SAE_Congenital bit NULL,
	SAE_MIE bit NULL,
	SAE_SignedDate datetime NULL,
	SAE_Investigator varchar(50) NULL,
	SAE_Notes varchar(1000) NULL,
	EnteredBy varchar(50) NOT NULL,
	EnteredTime datetime NOT NULL,
	UpdatedBy varchar(50) NULL,
	UpdatedTime datetime NULL
	)  ON [PRIMARY]
GO
ALTER TABLE dbo.Tmp_SeriousAdverseEvents SET (LOCK_ESCALATION = TABLE)
GO
IF EXISTS(SELECT * FROM dbo.SeriousAdverseEvents)
	 EXEC('INSERT INTO dbo.Tmp_SeriousAdverseEvents (ToxicityId, ContactId, SAE_Age, SAE_AttributedOutcome, SAE_ReportDateText, SAE_ReportDate, SAE_EventDescription, SAE_RelevantTestData, SAE_OtherRelevantHistory, SAE_ConcommitantMeds, SAE_NDC_Number, SAE_EventAbated1, SAE_EventAbated2, SAE_EventReappeared1, SAE_EventReappeared2, SAE_ReportingIndividual, SAE_ReportFDA_DateText, SAE_ReportFDA_Date, SAE_ReportFDA_Status, SAE_Sequelae, SAE_ReportedToIRB, SAE_Notes, EnteredBy, EnteredTime, UpdatedBy, UpdatedTime)
		SELECT ToxicityId, ContactId, SAE_Age, SAE_AttributedOutcome, SAE_ReportDateText, SAE_ReportDate, SAE_EventDescription, SAE_RelevantTestData, SAE_OtherRelevantHistory, SAE_ConcommitantMeds, SAE_NDC_Number, SAE_EventAbated1, SAE_EventAbated2, SAE_EventReappeared1, SAE_EventReappeared2, SAE_ReportingIndividual, SAE_ReportFDA_DateText, SAE_ReportFDA_Date, SAE_ReportFDA_Status, SAE_Sequelae, SAE_ReportedToIRB, SAE_Notes, EnteredBy, EnteredTime, UpdatedBy, UpdatedTime FROM dbo.SeriousAdverseEvents WITH (HOLDLOCK TABLOCKX)')
GO
DROP TABLE dbo.SeriousAdverseEvents
GO
EXECUTE sp_rename N'dbo.Tmp_SeriousAdverseEvents', N'SeriousAdverseEvents', 'OBJECT' 
GO
ALTER TABLE dbo.SeriousAdverseEvents ADD CONSTRAINT
	PK_SeriousAdverseEvents PRIMARY KEY CLUSTERED 
	(
	ToxicityId
	) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

GO
CREATE NONCLUSTERED INDEX I_SeriousAdverseEvents_ContactId ON dbo.SeriousAdverseEvents
	(
	ContactId
	) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
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
CREATE TRIGGER [dbo].[trgSeriousAdverseEvents_UD]
ON dbo.SeriousAdverseEvents FOR UPDATE, DELETE
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
   INSERT INTO AuditLog_SeriousAdverseEvents
   SELECT @action AS LoggedOperation, Inserted.UpdatedBy AS LoggedBy, 
          GETDATE() AS LoggedTime, Deleted.*
   FROM Deleted INNER JOIN INSERTED
   ON Deleted.ToxicityId = Inserted.ToxicityId
ELSE IF @action = 'DELETE'
   INSERT INTO AuditLog_SeriousAdverseEvents
   SELECT @action AS LoggedOperation, SYSTEM_USER AS LoggedBy, GETDATE() AS LoggedTime, *
   FROM Deleted
GO
sp_settriggerorder N'trgSeriousAdverseEvents_UD', N'last', N'update'
GO
COMMIT
GO
