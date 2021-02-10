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
CREATE TABLE dbo.AuditLog_SpineProc
	(
	LoggedOperation varchar(50) NULL,
	LoggedBy varchar(50) NULL,
	LoggedTime datetime NULL,
	ProcedureId int NULL,
	ProcTumorResection varchar(50) NULL,
	ProcNumLaminectomyLevel varchar(50) NULL,
	ProcLaminectomyLevels varchar(50) NULL,
	ProcNumVertebrectomyLevels varchar(50) NULL,
	ProcVertebrectomyLevels varchar(50) NULL,
	ProcPercVertebralBodyRemoved varchar(50) NULL,
	ProcAnteriorReconstruction varchar(50) NULL,
	ProcAnteriorReconstructionType varchar(50) NULL,
	ProcNumPediclesRemoved varchar(50) NULL,
	ProcPediclesRemovedLevel varchar(50) NULL,
	ProcNumInstrumentedLevel varchar(50) NULL,
	ProcInstrumentedLevel varchar(50) NULL,
	ProcPreOpEmbolization varchar(50) NULL,
	ProcCementAugmentation varchar(50) NULL,
	ProcCementLevel varchar(50) NULL,
	EnteredBy varchar(50) NULL,
	EnteredTime datetime NULL,
	UpdatedBy varchar(50) NULL,
	UpdatedTime datetime NULL
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
CREATE TABLE dbo.SpineProc
	(
	ProcedureId int NOT NULL,
	ProcTumorResection varchar(50) NULL,
	ProcNumLaminectomyLevel varchar(50) NULL,
	ProcLaminectomyLevels varchar(50) NULL,
	ProcNumVertebrectomyLevels varchar(50) NULL,
	ProcVertebrectomyLevels varchar(50) NULL,
	ProcPercVertebralBodyRemoved varchar(50) NULL,
	ProcAnteriorReconstruction varchar(50) NULL,
	ProcAnteriorReconstructionType varchar(50) NULL,
	ProcNumPediclesRemoved varchar(50) NULL,
	ProcPediclesRemovedLevel varchar(50) NULL,
	ProcNumInstrumentedLevel varchar(50) NULL,
	ProcInstrumentedLevel varchar(50) NULL,
	ProcPreOpEmbolization varchar(50) NULL,
	ProcCementAugmentation varchar(50) NULL,
	ProcCementLevel varchar(50) NULL,
	EnteredBy varchar(50) NOT NULL,
	EnteredTime datetime NOT NULL,
	UpdatedBy varchar(50) NULL,
	UpdatedTime datetime NULL
	)  ON [PRIMARY]
GO
ALTER TABLE dbo.SpineProc ADD CONSTRAINT
	PK_SpineProc PRIMARY KEY CLUSTERED 
	(
	ProcedureId
	) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

GO
ALTER TABLE dbo.SpineProc ADD CONSTRAINT
	FK_SpineProc_Procedures FOREIGN KEY
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
CREATE TRIGGER [dbo].[trgAuditSpineProc_UD]
ON [dbo].[SpineProc] FOR UPDATE, DELETE
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
   INSERT INTO AuditLog_SpineProc
   SELECT @action AS LoggedOperation, Inserted.UpdatedBy AS LoggedBy, 
          GETDATE() AS LoggedTime, Deleted.*
   FROM Deleted INNER JOIN INSERTED
   ON Deleted.ProcedureId = Inserted.ProcedureId
ELSE IF @action = 'DELETE'
   INSERT INTO AuditLog_SpineProc
   SELECT @action AS LoggedOperation, SYSTEM_USER AS LoggedBy, GETDATE() AS LoggedTime, *
   FROM Deleted
GO
EXEC sp_settriggerorder @triggername=N'[dbo].[trgAuditSpineProc_UD]', @order=N'Last', @stmttype=N'UPDATE'
GO
