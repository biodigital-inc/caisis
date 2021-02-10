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
CREATE TABLE dbo.Tmp_AuditLog_NodePathFinding
	(
	LoggedOperation varchar(50) NULL,
	LoggedBy varchar(50) NULL,
	LoggedTime datetime NULL,
	PathologyId int NULL,
	NodePathFindingId int NULL,
	PathFindSide varchar(50) NULL,
	PathFindSite varchar(255) NULL,
	PathFindMaxDim varchar(50) NULL,
	PathFindExtension varchar(50) NULL,
	PathFindPosNodes varchar(50) NULL,
	PathFindNumNodes varchar(50) NULL,
	PathFindHistology varchar(255) NULL,
	PathFindMetsFocusMaxDim varchar(50) NULL,
	PathFindNotes varchar(1000) NULL,
	EnteredBy varchar(50) NULL,
	EnteredTime datetime NULL,
	UpdatedBy varchar(50) NULL,
	UpdatedTime datetime NULL
	)  ON [PRIMARY]
GO
IF EXISTS(SELECT * FROM dbo.AuditLog_NodePathFinding)
	 EXEC('INSERT INTO dbo.Tmp_AuditLog_NodePathFinding (LoggedOperation, LoggedBy, LoggedTime, PathologyId, NodePathFindingId, PathFindSide, PathFindSite, PathFindMaxDim, PathFindExtension, PathFindPosNodes, PathFindNumNodes, PathFindHistology, EnteredBy, EnteredTime, UpdatedBy, UpdatedTime)
		SELECT LoggedOperation, LoggedBy, LoggedTime, PathologyId, NodePathFindingId, PathFindSide, PathFindSite, PathFindMaxDim, PathFindExtension, PathFindPosNodes, PathFindNumNodes, PathFindHistology, EnteredBy, EnteredTime, UpdatedBy, UpdatedTime FROM dbo.AuditLog_NodePathFinding WITH (HOLDLOCK TABLOCKX)')
GO
DROP TABLE dbo.AuditLog_NodePathFinding
GO
EXECUTE sp_rename N'dbo.Tmp_AuditLog_NodePathFinding', N'AuditLog_NodePathFinding', 'OBJECT' 
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
ALTER TABLE dbo.NodePathFinding
	DROP CONSTRAINT FK_NodePathFinding_Pathology
GO
COMMIT
BEGIN TRANSACTION
GO
CREATE TABLE dbo.Tmp_NodePathFinding
	(
	PathologyId int NOT NULL,
	NodePathFindingId int NOT NULL IDENTITY (1, 1),
	PathFindSide varchar(50) NULL,
	PathFindSite varchar(255) NULL,
	PathFindMaxDim varchar(50) NULL,
	PathFindExtension varchar(50) NULL,
	PathFindPosNodes varchar(50) NULL,
	PathFindNumNodes varchar(50) NULL,
	PathFindHistology varchar(255) NULL,
	PathFindMetsFocusMaxDim varchar(50) NULL,
	PathFindNotes varchar(1000) NULL,
	EnteredBy varchar(50) NOT NULL,
	EnteredTime datetime NOT NULL,
	UpdatedBy varchar(50) NULL,
	UpdatedTime datetime NULL
	)  ON [PRIMARY]
GO
SET IDENTITY_INSERT dbo.Tmp_NodePathFinding ON
GO
IF EXISTS(SELECT * FROM dbo.NodePathFinding)
	 EXEC('INSERT INTO dbo.Tmp_NodePathFinding (PathologyId, NodePathFindingId, PathFindSide, PathFindSite, PathFindMaxDim, PathFindExtension, PathFindPosNodes, PathFindNumNodes, PathFindHistology, EnteredBy, EnteredTime, UpdatedBy, UpdatedTime)
		SELECT PathologyId, NodePathFindingId, PathFindSide, PathFindSite, PathFindMaxDim, PathFindExtension, PathFindPosNodes, PathFindNumNodes, PathFindHistology, EnteredBy, EnteredTime, UpdatedBy, UpdatedTime FROM dbo.NodePathFinding WITH (HOLDLOCK TABLOCKX)')
GO
SET IDENTITY_INSERT dbo.Tmp_NodePathFinding OFF
GO
DROP TABLE dbo.NodePathFinding
GO
EXECUTE sp_rename N'dbo.Tmp_NodePathFinding', N'NodePathFinding', 'OBJECT' 
GO
ALTER TABLE dbo.NodePathFinding ADD CONSTRAINT
	PK_NodePathFinding PRIMARY KEY CLUSTERED 
	(
	NodePathFindingId
	) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

GO
ALTER TABLE dbo.NodePathFinding WITH NOCHECK ADD CONSTRAINT
	FK_NodePathFinding_Pathology FOREIGN KEY
	(
	PathologyId
	) REFERENCES dbo.Pathology
	(
	PathologyId
	) ON UPDATE  CASCADE 
	 ON DELETE  CASCADE 
	
GO
CREATE TRIGGER dbo.trgAuditNodePathFinding_UD
ON dbo.NodePathFinding FOR UPDATE, DELETE
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
   INSERT INTO AuditLog_NodePathFinding
   SELECT @action AS LoggedOperation, Inserted.UpdatedBy AS LoggedBy, 
          GETDATE() AS LoggedTime, Deleted.*
   FROM Deleted INNER JOIN INSERTED
   ON Deleted.NodePathFindingId = Inserted.NodePathFindingId
ELSE IF @action = 'DELETE'
   INSERT INTO AuditLog_NodePathFinding
   SELECT @action AS LoggedOperation, SYSTEM_USER AS LoggedBy, GETDATE() AS LoggedTime, *
   FROM Deleted
GO
COMMIT
GO
