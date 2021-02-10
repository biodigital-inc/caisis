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
CREATE TABLE dbo.Tmp_AuditLog_GynDebulkingProc
	(
	LoggedOperation varchar(50) NULL,
	LoggedBy varchar(50) NULL,
	LoggedTime datetime NULL,
	ProcedureId int NULL,
	ProcPercentTumorRemoved varchar(50) NULL,
	ProcAscitesAmount varchar(50) NULL,
	ProcDebulkingType varchar(50) NULL,
	ProcDebulkingStatus varchar(50) NULL,
	ProcDebulkingDetails varchar(2000) NULL,
	ProcIntraOpHIPEC varchar(50) NULL,
	ProcActualNumMassRemain varchar(50) NULL,
	ProcLocLargestMassRemain varchar(50) NULL,
	ProcLargestMassRemainMaxDiam varchar(50) NULL,
	ProcNumOfMassRemain varchar(50) NULL,
	ProcLocLargestMassFound varchar(50) NULL,
	ProcLargestMassFoundMaxDiam varchar(50) NULL,
	ProcSuboptimalReason varchar(255) NULL,
	ProcLargestVisibleMassFoundMaxDiam varchar(50) NULL,
	ProcBulkyUpperAbdDisease varchar(50) NULL,
	ProcCarcinomatosis varchar(50) NULL,
	EnteredBy varchar(50) NULL,
	EnteredTime datetime NULL,
	UpdatedBy varchar(50) NULL,
	UpdatedTime datetime NULL
	)  ON [PRIMARY]
GO
ALTER TABLE dbo.Tmp_AuditLog_GynDebulkingProc SET (LOCK_ESCALATION = TABLE)
GO
IF EXISTS(SELECT * FROM dbo.AuditLog_GynDebulkingProc)
	 EXEC('INSERT INTO dbo.Tmp_AuditLog_GynDebulkingProc (LoggedOperation, LoggedBy, LoggedTime, ProcedureId, ProcPercentTumorRemoved, ProcAscitesAmount, ProcDebulkingType, ProcDebulkingStatus, ProcDebulkingDetails, ProcIntraOpHIPEC, ProcActualNumMassRemain, ProcLocLargestMassRemain, ProcLargestMassRemainMaxDiam, ProcNumOfMassRemain, ProcLocLargestMassFound, ProcLargestMassFoundMaxDiam, ProcSuboptimalReason, ProcLargestVisibleMassFoundMaxDiam, EnteredBy, EnteredTime, UpdatedBy, UpdatedTime)
		SELECT LoggedOperation, LoggedBy, LoggedTime, ProcedureId, ProcPercentTumorRemoved, ProcAscitesAmount, ProcDebulkingType, ProcDebulkingStatus, ProcDebulkingDetails, ProcIntraOpHIPEC, ProcActualNumMassRemain, ProcLocLargestMassRemain, ProcLargestMassRemainMaxDiam, ProcNumOfMassRemain, ProcLocLargestMassFound, ProcLargestMassFoundMaxDiam, ProcSuboptimalReason, ProcLargestVisibleMassFoundMaxDiam, EnteredBy, EnteredTime, UpdatedBy, UpdatedTime FROM dbo.AuditLog_GynDebulkingProc WITH (HOLDLOCK TABLOCKX)')
GO
DROP TABLE dbo.AuditLog_GynDebulkingProc
GO
EXECUTE sp_rename N'dbo.Tmp_AuditLog_GynDebulkingProc', N'AuditLog_GynDebulkingProc', 'OBJECT' 
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
ALTER TABLE dbo.GynDebulkingProc
	DROP CONSTRAINT FK_GynDebulkingProc_Procedures
GO
ALTER TABLE dbo.Procedures SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
BEGIN TRANSACTION
GO
CREATE TABLE dbo.Tmp_GynDebulkingProc
	(
	ProcedureId int NOT NULL,
	ProcPercentTumorRemoved varchar(50) NULL,
	ProcAscitesAmount varchar(50) NULL,
	ProcDebulkingType varchar(50) NULL,
	ProcDebulkingStatus varchar(50) NULL,
	ProcDebulkingDetails varchar(2000) NULL,
	ProcIntraOpHIPEC varchar(50) NULL,
	ProcActualNumMassRemain varchar(50) NULL,
	ProcLocLargestMassRemain varchar(50) NULL,
	ProcLargestMassRemainMaxDiam varchar(50) NULL,
	ProcNumOfMassRemain varchar(50) NULL,
	ProcLocLargestMassFound varchar(50) NULL,
	ProcLargestMassFoundMaxDiam varchar(50) NULL,
	ProcSuboptimalReason varchar(255) NULL,
	ProcLargestVisibleMassFoundMaxDiam varchar(50) NULL,
	ProcBulkyUpperAbdDisease varchar(50) NULL,
	ProcCarcinomatosis varchar(50) NULL,
	EnteredBy varchar(50) NOT NULL,
	EnteredTime datetime NOT NULL,
	UpdatedBy varchar(50) NULL,
	UpdatedTime datetime NULL
	)  ON [PRIMARY]
GO
ALTER TABLE dbo.Tmp_GynDebulkingProc SET (LOCK_ESCALATION = TABLE)
GO
IF EXISTS(SELECT * FROM dbo.GynDebulkingProc)
	 EXEC('INSERT INTO dbo.Tmp_GynDebulkingProc (ProcedureId, ProcPercentTumorRemoved, ProcAscitesAmount, ProcDebulkingType, ProcDebulkingStatus, ProcDebulkingDetails, ProcIntraOpHIPEC, ProcActualNumMassRemain, ProcLocLargestMassRemain, ProcLargestMassRemainMaxDiam, ProcNumOfMassRemain, ProcLocLargestMassFound, ProcLargestMassFoundMaxDiam, ProcSuboptimalReason, ProcLargestVisibleMassFoundMaxDiam, EnteredBy, EnteredTime, UpdatedBy, UpdatedTime)
		SELECT ProcedureId, ProcPercentTumorRemoved, ProcAscitesAmount, ProcDebulkingType, ProcDebulkingStatus, ProcDebulkingDetails, ProcIntraOpHIPEC, ProcActualNumMassRemain, ProcLocLargestMassRemain, ProcLargestMassRemainMaxDiam, ProcNumOfMassRemain, ProcLocLargestMassFound, ProcLargestMassFoundMaxDiam, ProcSuboptimalReason, ProcLargestVisibleMassFoundMaxDiam, EnteredBy, EnteredTime, UpdatedBy, UpdatedTime FROM dbo.GynDebulkingProc WITH (HOLDLOCK TABLOCKX)')
GO
DROP TABLE dbo.GynDebulkingProc
GO
EXECUTE sp_rename N'dbo.Tmp_GynDebulkingProc', N'GynDebulkingProc', 'OBJECT' 
GO
ALTER TABLE dbo.GynDebulkingProc ADD CONSTRAINT
	PK_GynDebulkingProc PRIMARY KEY CLUSTERED 
	(
	ProcedureId
	) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

GO
ALTER TABLE dbo.GynDebulkingProc ADD CONSTRAINT
	FK_GynDebulkingProc_Procedures FOREIGN KEY
	(
	ProcedureId
	) REFERENCES dbo.Procedures
	(
	ProcedureId
	) ON UPDATE  CASCADE 
	 ON DELETE  CASCADE 
GO
CREATE TRIGGER [dbo].[trgAuditGynDebulkingProc_UD]
ON dbo.GynDebulkingProc FOR UPDATE, DELETE
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
   INSERT INTO AuditLog_GynDebulkingProc
   SELECT @action AS LoggedOperation, Inserted.UpdatedBy AS LoggedBy, 
          GETDATE() AS LoggedTime, Deleted.*
   FROM Deleted INNER JOIN INSERTED
   ON Deleted.ProcedureId = Inserted.ProcedureId
ELSE IF @action = 'DELETE'
   INSERT INTO AuditLog_GynDebulkingProc
   SELECT @action AS LoggedOperation, SYSTEM_USER AS LoggedBy, GETDATE() AS LoggedTime, *
   FROM Deleted
GO
sp_settriggerorder N'trgAuditGynDebulkingProc_UD', N'last', N'update'
GO
COMMIT
GO
