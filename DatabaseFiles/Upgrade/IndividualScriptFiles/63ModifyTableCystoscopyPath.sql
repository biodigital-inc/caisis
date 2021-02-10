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
CREATE TABLE dbo.Tmp_AuditLog_CystoscopyPath
	(
	LoggedOperation varchar(50) NULL,
	LoggedBy varchar(50) NULL,
	LoggedTime datetime NULL,
	PathologyId int NULL,
	PathMorphology varchar(50) NULL,
	PathCarcinomaInSitu varchar(50) NULL,
	PathPattern varchar(50) NULL,
	PathExtension varchar(50) NULL,
	PathVascularInv varchar(50) NULL,
	PathMucosaInv varchar(50) NULL,
	PathUrethra varchar(50) NULL,
	PathMusclePresentStatement varchar(255) NULL,
	EnteredBy varchar(50) NULL,
	EnteredTime datetime NULL,
	UpdatedBy varchar(50) NULL,
	UpdatedTime datetime NULL
	)  ON [PRIMARY]
GO
ALTER TABLE dbo.Tmp_AuditLog_CystoscopyPath SET (LOCK_ESCALATION = TABLE)
GO
IF EXISTS(SELECT * FROM dbo.AuditLog_CystoscopyPath)
	 EXEC('INSERT INTO dbo.Tmp_AuditLog_CystoscopyPath (LoggedOperation, LoggedBy, LoggedTime, PathologyId, PathMorphology, PathCarcinomaInSitu, PathPattern, PathExtension, PathVascularInv, PathMucosaInv, PathUrethra, EnteredBy, EnteredTime, UpdatedBy, UpdatedTime)
		SELECT LoggedOperation, LoggedBy, LoggedTime, PathologyId, PathMorphology, PathCarcinomaInSitu, PathPattern, PathExtension, PathVascularInv, PathMucosaInv, PathUrethra, EnteredBy, EnteredTime, UpdatedBy, UpdatedTime FROM dbo.AuditLog_CystoscopyPath WITH (HOLDLOCK TABLOCKX)')
GO
DROP TABLE dbo.AuditLog_CystoscopyPath
GO
EXECUTE sp_rename N'dbo.Tmp_AuditLog_CystoscopyPath', N'AuditLog_CystoscopyPath', 'OBJECT' 
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
ALTER TABLE dbo.CystoscopyPath
	DROP CONSTRAINT FK_CystoscopyPath_Pathology
GO
ALTER TABLE dbo.Pathology SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
BEGIN TRANSACTION
GO
CREATE TABLE dbo.Tmp_CystoscopyPath
	(
	PathologyId int NOT NULL,
	PathMorphology varchar(50) NULL,
	PathCarcinomaInSitu varchar(50) NULL,
	PathPattern varchar(50) NULL,
	PathExtension varchar(50) NULL,
	PathVascularInv varchar(50) NULL,
	PathMucosaInv varchar(50) NULL,
	PathUrethra varchar(50) NULL,
	PathMusclePresentStatement varchar(255) NULL,
	EnteredBy varchar(50) NOT NULL,
	EnteredTime datetime NOT NULL,
	UpdatedBy varchar(50) NULL,
	UpdatedTime datetime NULL
	)  ON [PRIMARY]
GO
ALTER TABLE dbo.Tmp_CystoscopyPath SET (LOCK_ESCALATION = TABLE)
GO
IF EXISTS(SELECT * FROM dbo.CystoscopyPath)
	 EXEC('INSERT INTO dbo.Tmp_CystoscopyPath (PathologyId, PathMorphology, PathCarcinomaInSitu, PathPattern, PathExtension, PathVascularInv, PathMucosaInv, PathUrethra, EnteredBy, EnteredTime, UpdatedBy, UpdatedTime)
		SELECT PathologyId, PathMorphology, PathCarcinomaInSitu, PathPattern, PathExtension, PathVascularInv, PathMucosaInv, PathUrethra, EnteredBy, EnteredTime, UpdatedBy, UpdatedTime FROM dbo.CystoscopyPath WITH (HOLDLOCK TABLOCKX)')
GO
DROP TABLE dbo.CystoscopyPath
GO
EXECUTE sp_rename N'dbo.Tmp_CystoscopyPath', N'CystoscopyPath', 'OBJECT' 
GO
ALTER TABLE dbo.CystoscopyPath ADD CONSTRAINT
	PK_CystoscopyPath PRIMARY KEY CLUSTERED 
	(
	PathologyId
	) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

GO
ALTER TABLE dbo.CystoscopyPath WITH NOCHECK ADD CONSTRAINT
	FK_CystoscopyPath_Pathology FOREIGN KEY
	(
	PathologyId
	) REFERENCES dbo.Pathology
	(
	PathologyId
	) ON UPDATE  CASCADE 
	 ON DELETE  CASCADE 
	
GO
CREATE TRIGGER dbo.trgAuditCystoscopyPath_UD
ON dbo.CystoscopyPath FOR UPDATE, DELETE
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
   INSERT INTO AuditLog_CystoscopyPath
   SELECT @action AS LoggedOperation, Inserted.UpdatedBy AS LoggedBy, 
          GETDATE() AS LoggedTime, Deleted.*
   FROM Deleted INNER JOIN INSERTED
   ON Deleted.PathologyId = Inserted.PathologyId
ELSE IF @action = 'DELETE'
   INSERT INTO AuditLog_CystoscopyPath
   SELECT @action AS LoggedOperation, SYSTEM_USER AS LoggedBy, GETDATE() AS LoggedTime, *
   FROM Deleted
GO
COMMIT
GO
