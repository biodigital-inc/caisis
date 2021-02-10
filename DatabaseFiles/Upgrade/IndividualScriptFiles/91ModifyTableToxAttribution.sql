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
CREATE TABLE dbo.Tmp_AuditLog_ToxAttribution
	(
	LoggedOperation varchar(50) NULL,
	LoggedBy varchar(50) NULL,
	LoggedTime datetime NULL,
	ToxicityId int NULL,
	ToxAttributionId int NULL,
	ToxAttribution varchar(100) NULL,
	ToxAttributionProbability varchar(50) NULL,
	ToxAttributionAction varchar(50) NULL,
	EnteredBy varchar(50) NULL,
	EnteredTime datetime NULL,
	UpdatedBy varchar(50) NULL,
	UpdatedTime datetime NULL
	)  ON [PRIMARY]
GO
ALTER TABLE dbo.Tmp_AuditLog_ToxAttribution SET (LOCK_ESCALATION = TABLE)
GO
IF EXISTS(SELECT * FROM dbo.AuditLog_ToxAttribution)
	 EXEC('INSERT INTO dbo.Tmp_AuditLog_ToxAttribution (LoggedOperation, LoggedBy, LoggedTime, ToxicityId, ToxAttributionId, ToxAttribution, ToxAttributionProbability, EnteredBy, EnteredTime, UpdatedBy, UpdatedTime)
		SELECT LoggedOperation, LoggedBy, LoggedTime, ToxicityId, ToxAttributionId, ToxAttribution, ToxAttributionProbability, EnteredBy, EnteredTime, UpdatedBy, UpdatedTime FROM dbo.AuditLog_ToxAttribution WITH (HOLDLOCK TABLOCKX)')
GO
DROP TABLE dbo.AuditLog_ToxAttribution
GO
EXECUTE sp_rename N'dbo.Tmp_AuditLog_ToxAttribution', N'AuditLog_ToxAttribution', 'OBJECT' 
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
ALTER TABLE dbo.ToxAttribution
	DROP CONSTRAINT FK_ToxAttribution_Toxicities
GO
ALTER TABLE dbo.Toxicities SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
BEGIN TRANSACTION
GO
CREATE TABLE dbo.Tmp_ToxAttribution
	(
	ToxicityId int NOT NULL,
	ToxAttributionId int NOT NULL IDENTITY (1, 1),
	ToxAttribution varchar(100) NULL,
	ToxAttributionProbability varchar(50) NULL,
	ToxAttributionAction varchar(50) NULL,
	EnteredBy varchar(50) NOT NULL,
	EnteredTime datetime NOT NULL,
	UpdatedBy varchar(50) NULL,
	UpdatedTime datetime NULL
	)  ON [PRIMARY]
GO
ALTER TABLE dbo.Tmp_ToxAttribution SET (LOCK_ESCALATION = TABLE)
GO
SET IDENTITY_INSERT dbo.Tmp_ToxAttribution ON
GO
IF EXISTS(SELECT * FROM dbo.ToxAttribution)
	 EXEC('INSERT INTO dbo.Tmp_ToxAttribution (ToxicityId, ToxAttributionId, ToxAttribution, ToxAttributionProbability, EnteredBy, EnteredTime, UpdatedBy, UpdatedTime)
		SELECT ToxicityId, ToxAttributionId, ToxAttribution, ToxAttributionProbability, EnteredBy, EnteredTime, UpdatedBy, UpdatedTime FROM dbo.ToxAttribution WITH (HOLDLOCK TABLOCKX)')
GO
SET IDENTITY_INSERT dbo.Tmp_ToxAttribution OFF
GO
DROP TABLE dbo.ToxAttribution
GO
EXECUTE sp_rename N'dbo.Tmp_ToxAttribution', N'ToxAttribution', 'OBJECT' 
GO
ALTER TABLE dbo.ToxAttribution ADD CONSTRAINT
	PK_ToxAttribution PRIMARY KEY CLUSTERED 
	(
	ToxAttributionId
	) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

GO
CREATE NONCLUSTERED INDEX I_ToxAttribution_ToxicityId ON dbo.ToxAttribution
	(
	ToxicityId
	) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
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
CREATE TRIGGER [dbo].[trgAuditToxAttribution_UD]
ON dbo.ToxAttribution FOR UPDATE, DELETE
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
   INSERT INTO AuditLog_ToxAttribution
   SELECT @action AS LoggedOperation, Inserted.UpdatedBy AS LoggedBy, 
          GETDATE() AS LoggedTime, Deleted.*
   FROM Deleted INNER JOIN INSERTED
   ON Deleted.ToxAttributionId = Inserted.ToxAttributionId
ELSE IF @action = 'DELETE'
   INSERT INTO AuditLog_ToxAttribution
   SELECT @action AS LoggedOperation, SYSTEM_USER AS LoggedBy, GETDATE() AS LoggedTime, *
   FROM Deleted
GO
sp_settriggerorder N'trgAuditToxAttribution_UD', N'last', N'update'
GO
COMMIT
GO
