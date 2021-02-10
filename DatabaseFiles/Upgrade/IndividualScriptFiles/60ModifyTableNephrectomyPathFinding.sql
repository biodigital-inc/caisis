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
CREATE TABLE dbo.Tmp_AuditLog_NephrectomyPathFinding
	(
	LoggedOperation varchar(50) NULL,
	LoggedBy varchar(50) NULL,
	LoggedTime datetime NULL,
	PathologyId int NULL,
	NephrectomyPathFindingId int NULL,
	PathFindMaxDim varchar(50) NULL,
	PathFindHistology varchar(255) NULL,
	PathFindPole varchar(50) NULL,
	PathFindAP varchar(50) NULL,
	PathFindLaterality varchar(50) NULL,
	PathFindSite varchar(50) NULL,
	PathFindGrade varchar(50) NULL,
	PathFindPattern varchar(50) NULL,
	PathFindSarcomatoid varchar(50) NULL,
	PathFindNecrosis varchar(50) NULL,
	PathFindVascularInv varchar(50) NULL,
	PathFindRV_Inv varchar(50) NULL,
	PathFindIVC_Inv varchar(50) NULL,
	PathFindIVC_WallInv varchar(50) NULL,
	PathFindExtension varchar(50) NULL,
	PathNotes varchar(1000) NULL,
	PathFindRV_InvOtherFindings varchar(255) NULL,
	EnteredBy varchar(50) NULL,
	EnteredTime datetime NULL,
	UpdatedBy varchar(50) NULL,
	UpdatedTime datetime NULL
	)  ON [PRIMARY]
GO
ALTER TABLE dbo.Tmp_AuditLog_NephrectomyPathFinding SET (LOCK_ESCALATION = TABLE)
GO
IF EXISTS(SELECT * FROM dbo.AuditLog_NephrectomyPathFinding)
	 EXEC('INSERT INTO dbo.Tmp_AuditLog_NephrectomyPathFinding (LoggedOperation, LoggedBy, LoggedTime, PathologyId, NephrectomyPathFindingId, PathFindMaxDim, PathFindHistology, PathFindPole, PathFindAP, PathFindLaterality, PathFindSite, PathFindGrade, PathFindPattern, PathFindSarcomatoid, PathFindNecrosis, PathFindVascularInv, PathFindRV_Inv, PathFindIVC_Inv, PathFindIVC_WallInv, PathFindExtension, PathNotes, EnteredBy, EnteredTime, UpdatedBy, UpdatedTime)
		SELECT LoggedOperation, LoggedBy, LoggedTime, PathologyId, NephrectomyPathFindingId, PathFindMaxDim, PathFindHistology, PathFindPole, PathFindAP, PathFindLaterality, PathFindSite, PathFindGrade, PathFindPattern, PathFindSarcomatoid, PathFindNecrosis, PathFindVascularInv, PathFindRV_Inv, PathFindIVC_Inv, PathFindIVC_WallInv, PathFindExtension, PathNotes, EnteredBy, EnteredTime, UpdatedBy, UpdatedTime FROM dbo.AuditLog_NephrectomyPathFinding WITH (HOLDLOCK TABLOCKX)')
GO
DROP TABLE dbo.AuditLog_NephrectomyPathFinding
GO
EXECUTE sp_rename N'dbo.Tmp_AuditLog_NephrectomyPathFinding', N'AuditLog_NephrectomyPathFinding', 'OBJECT' 
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
ALTER TABLE dbo.NephrectomyPathFinding
	DROP CONSTRAINT FK_NephrectomyPathFinding_Pathology
GO
ALTER TABLE dbo.Pathology SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
BEGIN TRANSACTION
GO
CREATE TABLE dbo.Tmp_NephrectomyPathFinding
	(
	PathologyId int NOT NULL,
	NephrectomyPathFindingId int NOT NULL IDENTITY (1, 1),
	PathFindMaxDim varchar(50) NULL,
	PathFindHistology varchar(255) NULL,
	PathFindPole varchar(50) NULL,
	PathFindAP varchar(50) NULL,
	PathFindLaterality varchar(50) NULL,
	PathFindSite varchar(50) NULL,
	PathFindGrade varchar(50) NULL,
	PathFindPattern varchar(50) NULL,
	PathFindSarcomatoid varchar(50) NULL,
	PathFindNecrosis varchar(50) NULL,
	PathFindVascularInv varchar(50) NULL,
	PathFindRV_Inv varchar(50) NULL,
	PathFindIVC_Inv varchar(50) NULL,
	PathFindIVC_WallInv varchar(50) NULL,
	PathFindExtension varchar(50) NULL,
	PathNotes varchar(1000) NULL,
	PathFindRV_InvOtherFindings varchar(255) NULL,
	EnteredBy varchar(50) NOT NULL,
	EnteredTime datetime NOT NULL,
	UpdatedBy varchar(50) NULL,
	UpdatedTime datetime NULL
	)  ON [PRIMARY]
GO
ALTER TABLE dbo.Tmp_NephrectomyPathFinding SET (LOCK_ESCALATION = TABLE)
GO
SET IDENTITY_INSERT dbo.Tmp_NephrectomyPathFinding ON
GO
IF EXISTS(SELECT * FROM dbo.NephrectomyPathFinding)
	 EXEC('INSERT INTO dbo.Tmp_NephrectomyPathFinding (PathologyId, NephrectomyPathFindingId, PathFindMaxDim, PathFindHistology, PathFindPole, PathFindAP, PathFindLaterality, PathFindSite, PathFindGrade, PathFindPattern, PathFindSarcomatoid, PathFindNecrosis, PathFindVascularInv, PathFindRV_Inv, PathFindIVC_Inv, PathFindIVC_WallInv, PathFindExtension, PathNotes, EnteredBy, EnteredTime, UpdatedBy, UpdatedTime)
		SELECT PathologyId, NephrectomyPathFindingId, PathFindMaxDim, PathFindHistology, PathFindPole, PathFindAP, PathFindLaterality, PathFindSite, PathFindGrade, PathFindPattern, PathFindSarcomatoid, PathFindNecrosis, PathFindVascularInv, PathFindRV_Inv, PathFindIVC_Inv, PathFindIVC_WallInv, PathFindExtension, PathNotes, EnteredBy, EnteredTime, UpdatedBy, UpdatedTime FROM dbo.NephrectomyPathFinding WITH (HOLDLOCK TABLOCKX)')
GO
SET IDENTITY_INSERT dbo.Tmp_NephrectomyPathFinding OFF
GO
DROP TABLE dbo.NephrectomyPathFinding
GO
EXECUTE sp_rename N'dbo.Tmp_NephrectomyPathFinding', N'NephrectomyPathFinding', 'OBJECT' 
GO
ALTER TABLE dbo.NephrectomyPathFinding ADD CONSTRAINT
	PK_NephrectomyPathFinding PRIMARY KEY CLUSTERED 
	(
	NephrectomyPathFindingId
	) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

GO
ALTER TABLE dbo.NephrectomyPathFinding WITH NOCHECK ADD CONSTRAINT
	FK_NephrectomyPathFinding_Pathology FOREIGN KEY
	(
	PathologyId
	) REFERENCES dbo.Pathology
	(
	PathologyId
	) ON UPDATE  CASCADE 
	 ON DELETE  CASCADE 
	
GO
CREATE TRIGGER dbo.trgAuditNephrectomyPathFinding_UD
ON dbo.NephrectomyPathFinding FOR UPDATE, DELETE
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
   INSERT INTO AuditLog_NephrectomyPathFinding
   SELECT @action AS LoggedOperation, Inserted.UpdatedBy AS LoggedBy, 
          GETDATE() AS LoggedTime, Deleted.*
   FROM Deleted INNER JOIN INSERTED
   ON Deleted.NephrectomyPathFindingId = Inserted.NephrectomyPathFindingId
ELSE IF @action = 'DELETE'
   INSERT INTO AuditLog_NephrectomyPathFinding
   SELECT @action AS LoggedOperation, SYSTEM_USER AS LoggedBy, GETDATE() AS LoggedTime, *
   FROM Deleted
GO
COMMIT
GO
