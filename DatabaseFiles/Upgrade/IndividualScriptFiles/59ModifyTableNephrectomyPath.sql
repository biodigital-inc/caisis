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
CREATE TABLE dbo.Tmp_AuditLog_NephrectomyPath
	(
	LoggedOperation varchar(50) NULL,
	LoggedBy varchar(50) NULL,
	LoggedTime datetime NULL,
	PathologyId int NULL,
	PathExtension varchar(50) NULL,
	PathMargin varchar(50) NULL,
	PathAdrenalInv varchar(50) NULL,
	PathAdrenalSide varchar(50) NULL,
	PathMultifocal varchar(50) NULL,
	PathNuclearGrade varchar(50) NULL,
	PathPattern varchar(50) NULL,
	PathCancerMaxDim varchar(50) NULL,
	PathOtherKidney varchar(255) NULL,
	PathAngiolymphaticInv varchar(50) NULL,
	PathRenalSinusFatInv varchar(50) NULL,
	PathMarginClearance varchar(50) NULL,
	EnteredBy varchar(50) NULL,
	EnteredTime datetime NULL,
	UpdatedBy varchar(50) NULL,
	UpdatedTime datetime NULL
	)  ON [PRIMARY]
GO
ALTER TABLE dbo.Tmp_AuditLog_NephrectomyPath SET (LOCK_ESCALATION = TABLE)
GO
IF EXISTS(SELECT * FROM dbo.AuditLog_NephrectomyPath)
	 EXEC('INSERT INTO dbo.Tmp_AuditLog_NephrectomyPath (LoggedOperation, LoggedBy, LoggedTime, PathologyId, PathExtension, PathMargin, PathAdrenalInv, PathAdrenalSide, PathMultifocal, PathNuclearGrade, PathPattern, PathCancerMaxDim, PathOtherKidney, PathAngiolymphaticInv, PathRenalSinusFatInv, EnteredBy, EnteredTime, UpdatedBy, UpdatedTime)
		SELECT LoggedOperation, LoggedBy, LoggedTime, PathologyId, PathExtension, PathMargin, PathAdrenalInv, PathAdrenalSide, PathMultifocal, PathNuclearGrade, PathPattern, PathCancerMaxDim, PathOtherKidney, PathAngiolymphaticInv, PathRenalSinusFatInv, EnteredBy, EnteredTime, UpdatedBy, UpdatedTime FROM dbo.AuditLog_NephrectomyPath WITH (HOLDLOCK TABLOCKX)')
GO
DROP TABLE dbo.AuditLog_NephrectomyPath
GO
EXECUTE sp_rename N'dbo.Tmp_AuditLog_NephrectomyPath', N'AuditLog_NephrectomyPath', 'OBJECT' 
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
ALTER TABLE dbo.NephrectomyPath
	DROP CONSTRAINT FK_NephrectomyPath_Pathology
GO
ALTER TABLE dbo.Pathology SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
BEGIN TRANSACTION
GO
CREATE TABLE dbo.Tmp_NephrectomyPath
	(
	PathologyId int NOT NULL,
	PathExtension varchar(50) NULL,
	PathMargin varchar(50) NULL,
	PathAdrenalInv varchar(50) NULL,
	PathAdrenalSide varchar(50) NULL,
	PathMultifocal varchar(50) NULL,
	PathNuclearGrade varchar(50) NULL,
	PathPattern varchar(50) NULL,
	PathCancerMaxDim varchar(50) NULL,
	PathOtherKidney varchar(255) NULL,
	PathAngiolymphaticInv varchar(50) NULL,
	PathRenalSinusFatInv varchar(50) NULL,
	PathMarginClearance varchar(50) NULL,
	EnteredBy varchar(50) NOT NULL,
	EnteredTime datetime NOT NULL,
	UpdatedBy varchar(50) NULL,
	UpdatedTime datetime NULL
	)  ON [PRIMARY]
GO
ALTER TABLE dbo.Tmp_NephrectomyPath SET (LOCK_ESCALATION = TABLE)
GO
IF EXISTS(SELECT * FROM dbo.NephrectomyPath)
	 EXEC('INSERT INTO dbo.Tmp_NephrectomyPath (PathologyId, PathExtension, PathMargin, PathAdrenalInv, PathAdrenalSide, PathMultifocal, PathNuclearGrade, PathPattern, PathCancerMaxDim, PathOtherKidney, PathAngiolymphaticInv, PathRenalSinusFatInv, EnteredBy, EnteredTime, UpdatedBy, UpdatedTime)
		SELECT PathologyId, PathExtension, PathMargin, PathAdrenalInv, PathAdrenalSide, PathMultifocal, PathNuclearGrade, PathPattern, PathCancerMaxDim, PathOtherKidney, PathAngiolymphaticInv, PathRenalSinusFatInv, EnteredBy, EnteredTime, UpdatedBy, UpdatedTime FROM dbo.NephrectomyPath WITH (HOLDLOCK TABLOCKX)')
GO
DROP TABLE dbo.NephrectomyPath
GO
EXECUTE sp_rename N'dbo.Tmp_NephrectomyPath', N'NephrectomyPath', 'OBJECT' 
GO
ALTER TABLE dbo.NephrectomyPath ADD CONSTRAINT
	PK_NephrectomyPath PRIMARY KEY CLUSTERED 
	(
	PathologyId
	) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

GO
ALTER TABLE dbo.NephrectomyPath WITH NOCHECK ADD CONSTRAINT
	FK_NephrectomyPath_Pathology FOREIGN KEY
	(
	PathologyId
	) REFERENCES dbo.Pathology
	(
	PathologyId
	) ON UPDATE  CASCADE 
	 ON DELETE  CASCADE 
	
GO
CREATE TRIGGER dbo.trgAuditNephrectomyPath_UD
ON dbo.NephrectomyPath FOR UPDATE, DELETE
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
   INSERT INTO AuditLog_NephrectomyPath
   SELECT @action AS LoggedOperation, Inserted.UpdatedBy AS LoggedBy, 
          GETDATE() AS LoggedTime, Deleted.*
   FROM Deleted INNER JOIN INSERTED
   ON Deleted.PathologyId = Inserted.PathologyId
ELSE IF @action = 'DELETE'
   INSERT INTO AuditLog_NephrectomyPath
   SELECT @action AS LoggedOperation, SYSTEM_USER AS LoggedBy, GETDATE() AS LoggedTime, *
   FROM Deleted
GO
COMMIT
GO
