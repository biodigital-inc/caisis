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
CREATE TABLE dbo.AuditLog_GynDebulkingProc
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
   EnteredBy varchar(50) NULL,
   EnteredTime datetime NULL,
   UpdatedBy varchar(50) NULL,
   UpdatedTime datetime NULL,
	)  ON [PRIMARY]
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
COMMIT
BEGIN TRANSACTION
GO
CREATE TABLE dbo.GynDebulkingProc
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
   EnteredBy varchar(50) NOT NULL,
   EnteredTime datetime NOT NULL,
   UpdatedBy varchar(50) NULL,
   UpdatedTime datetime NULL,
	)  ON [PRIMARY]
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
COMMIT
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[trgAuditGynDebulkingProc_UD]
ON [dbo].[GynDebulkingProc] FOR UPDATE, DELETE
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
EXEC sp_settriggerorder @triggername=N'[dbo].[trgAuditGynDebulkingProc_UD]', @order=N'Last', @stmttype=N'UPDATE'
GO
