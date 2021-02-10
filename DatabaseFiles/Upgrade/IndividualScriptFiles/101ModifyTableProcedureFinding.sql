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
CREATE TABLE dbo.Tmp_AuditLog_ProcedureFinding
	(
	LoggedOperation varchar(50) NULL,
	LoggedBy varchar(50) NULL,
	LoggedTime datetime NULL,
	ProcedureId int NULL,
	ProcedureFindingId int NULL,
	ProcFinding varchar(50) NULL,
	ProcFindSide varchar(50) NULL,
	ProcFindLaterality varchar(50) NULL,
	ProcFindSite varchar(50) NULL,
	ProcFindSubsite varchar(50) NULL,
	ProcFindDissection varchar(50) NULL,
	ProcFindPrimaryDimension varchar(50) NULL,
	ProcFindSecondaryDimension varchar(50) NULL,
	ProcFindTertiaryDimension varchar(50) NULL,
	ProcFindExtension varchar(50) NULL,
	ProcFindEncapsulation varchar(50) NULL,
	ProcFindDiseaseExtent varchar(50) NULL,
	ProcFindStatus varchar(50) NULL,
	ProcFindFrozen varchar(50) NULL,
	ProcFindMorphology varchar(50) NULL,
	ProcFindHistology varchar(255) NULL,
	ProcFindScore varchar(50) NULL,
	ProcFindNotes varchar(1000) NULL,
	EnteredBy varchar(50) NULL,
	EnteredTime datetime NULL,
	UpdatedBy varchar(50) NULL,
	UpdatedTime datetime NULL
	)  ON [PRIMARY]
GO
ALTER TABLE dbo.Tmp_AuditLog_ProcedureFinding SET (LOCK_ESCALATION = TABLE)
GO
IF EXISTS(SELECT * FROM dbo.AuditLog_ProcedureFinding)
	 EXEC('INSERT INTO dbo.Tmp_AuditLog_ProcedureFinding (LoggedOperation, LoggedBy, LoggedTime, ProcedureId, ProcedureFindingId, ProcFinding, ProcFindSide, ProcFindSite, ProcFindSubsite, ProcFindDissection, ProcFindPrimaryDimension, ProcFindSecondaryDimension, ProcFindTertiaryDimension, ProcFindExtension, ProcFindEncapsulation, ProcFindDiseaseExtent, ProcFindStatus, ProcFindFrozen, ProcFindMorphology, ProcFindHistology, ProcFindNotes, EnteredBy, EnteredTime, UpdatedBy, UpdatedTime)
		SELECT LoggedOperation, LoggedBy, LoggedTime, ProcedureId, ProcedureFindingId, ProcFinding, ProcFindSide, ProcFindSite, ProcFindSubsite, ProcFindDissection, ProcFindPrimaryDimension, ProcFindSecondaryDimension, ProcFindTertiaryDimension, ProcFindExtension, ProcFindEncapsulation, ProcFindDiseaseExtent, ProcFindStatus, ProcFindFrozen, ProcFindMorphology, ProcFindHistology, ProcFindNotes, EnteredBy, EnteredTime, UpdatedBy, UpdatedTime FROM dbo.AuditLog_ProcedureFinding WITH (HOLDLOCK TABLOCKX)')
GO
DROP TABLE dbo.AuditLog_ProcedureFinding
GO
EXECUTE sp_rename N'dbo.Tmp_AuditLog_ProcedureFinding', N'AuditLog_ProcedureFinding', 'OBJECT' 
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
ALTER TABLE dbo.ProcedureFinding
	DROP CONSTRAINT FK_ProcedureFinding_Procedures
GO
ALTER TABLE dbo.Procedures SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
BEGIN TRANSACTION
GO
CREATE TABLE dbo.Tmp_ProcedureFinding
	(
	ProcedureId int NOT NULL,
	ProcedureFindingId int NOT NULL IDENTITY (1, 1),
	ProcFinding varchar(50) NULL,
	ProcFindSide varchar(50) NULL,
	ProcFindLaterality varchar(50) NULL,
	ProcFindSite varchar(50) NULL,
	ProcFindSubsite varchar(50) NULL,
	ProcFindDissection varchar(50) NULL,
	ProcFindPrimaryDimension varchar(50) NULL,
	ProcFindSecondaryDimension varchar(50) NULL,
	ProcFindTertiaryDimension varchar(50) NULL,
	ProcFindExtension varchar(50) NULL,
	ProcFindEncapsulation varchar(50) NULL,
	ProcFindDiseaseExtent varchar(50) NULL,
	ProcFindStatus varchar(50) NULL,
	ProcFindFrozen varchar(50) NULL,
	ProcFindMorphology varchar(50) NULL,
	ProcFindHistology varchar(255) NULL,
	ProcFindScore varchar(50) NULL,
	ProcFindNotes varchar(1000) NULL,
	EnteredBy varchar(50) NOT NULL,
	EnteredTime datetime NOT NULL,
	UpdatedBy varchar(50) NULL,
	UpdatedTime datetime NULL
	)  ON [PRIMARY]
GO
ALTER TABLE dbo.Tmp_ProcedureFinding SET (LOCK_ESCALATION = TABLE)
GO
SET IDENTITY_INSERT dbo.Tmp_ProcedureFinding ON
GO
IF EXISTS(SELECT * FROM dbo.ProcedureFinding)
	 EXEC('INSERT INTO dbo.Tmp_ProcedureFinding (ProcedureId, ProcedureFindingId, ProcFinding, ProcFindSide, ProcFindSite, ProcFindSubsite, ProcFindDissection, ProcFindPrimaryDimension, ProcFindSecondaryDimension, ProcFindTertiaryDimension, ProcFindExtension, ProcFindEncapsulation, ProcFindDiseaseExtent, ProcFindStatus, ProcFindFrozen, ProcFindMorphology, ProcFindHistology, ProcFindNotes, EnteredBy, EnteredTime, UpdatedBy, UpdatedTime)
		SELECT ProcedureId, ProcedureFindingId, ProcFinding, ProcFindSide, ProcFindSite, ProcFindSubsite, ProcFindDissection, ProcFindPrimaryDimension, ProcFindSecondaryDimension, ProcFindTertiaryDimension, ProcFindExtension, ProcFindEncapsulation, ProcFindDiseaseExtent, ProcFindStatus, ProcFindFrozen, ProcFindMorphology, ProcFindHistology, ProcFindNotes, EnteredBy, EnteredTime, UpdatedBy, UpdatedTime FROM dbo.ProcedureFinding WITH (HOLDLOCK TABLOCKX)')
GO
SET IDENTITY_INSERT dbo.Tmp_ProcedureFinding OFF
GO
DROP TABLE dbo.ProcedureFinding
GO
EXECUTE sp_rename N'dbo.Tmp_ProcedureFinding', N'ProcedureFinding', 'OBJECT' 
GO
ALTER TABLE dbo.ProcedureFinding ADD CONSTRAINT
	PK_ProcedureFinding PRIMARY KEY CLUSTERED 
	(
	ProcedureFindingId
	) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

GO
ALTER TABLE dbo.ProcedureFinding WITH NOCHECK ADD CONSTRAINT
	FK_ProcedureFinding_Procedures FOREIGN KEY
	(
	ProcedureId
	) REFERENCES dbo.Procedures
	(
	ProcedureId
	) ON UPDATE  CASCADE 
	 ON DELETE  CASCADE 
	
GO
CREATE TRIGGER dbo.trgAuditProcedureFinding_UD
ON dbo.ProcedureFinding FOR UPDATE, DELETE
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
   INSERT INTO AuditLog_ProcedureFinding
   SELECT @action AS LoggedOperation, Inserted.UpdatedBy AS LoggedBy, 
          GETDATE() AS LoggedTime, Deleted.*
   FROM Deleted INNER JOIN INSERTED
   ON Deleted.ProcedureFindingId = Inserted.ProcedureFindingId
ELSE IF @action = 'DELETE'
   INSERT INTO AuditLog_ProcedureFinding
   SELECT @action AS LoggedOperation, SYSTEM_USER AS LoggedBy, GETDATE() AS LoggedTime, *
   FROM Deleted
GO
sp_settriggerorder N'trgAuditProcedureFinding_UD', N'last', N'update'
GO
COMMIT
GO
