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
CREATE TABLE dbo.Tmp_AuditLog_ThyroidProc
	(
	LoggedOperation varchar(50) NULL,
	LoggedBy varchar(50) NULL,
	LoggedTime datetime NULL,
	ProcedureId int NULL,
	ProcR_Lobe varchar(50) NULL,
	ProcL_Lobe varchar(50) NULL,
	ProcIsthmus varchar(50) NULL,
	ProcTracheaMgmt varchar(50) NULL,
	ProcTracheaReconstruct varchar(50) NULL,
	ProcTracheostomy varchar(50) NULL,
	ProcLarynxMgmt varchar(50) NULL,
	ProcEsophagusPharynxMgmt varchar(50) NULL,
	ProcEsophagusPharynxReconstruct varchar(50) NULL,
	ProcLaryngealNerveRight varchar(50) NULL,
	ProcLaryngealNerveLeft varchar(50) NULL,
	ProcPalpableNodes varchar(50) NULL,
	ProcNodeDissection varchar(255) NULL,
	ProcTotalThyroidectomy varchar(50) NULL,
	ProcR_SuperiorParathyroid varchar(50) NULL,
	ProcR_InferiorParathyroid varchar(50) NULL,
	ProcL_SuperiorParathyroid varchar(50) NULL,
	ProcL_InferiorParathyroid varchar(50) NULL,
	ProcStrapMuscle varchar(50) NULL,
	ProcPositioningDraping varchar(1000) NULL,
	ProcIncisionFlaps varchar(1000) NULL,
	ProcR_Lobectomy varchar(1000) NULL,
	ProcL_Lobectomy varchar(1000) NULL,
	ProcWoundClosure varchar(1000) NULL,
	ProcDrain varchar(50) NULL,
	ProcIncisionLength varchar(50) NULL,
	ProcSuperiorLaryngealNerve varchar(50) NULL,
	EnteredBy varchar(50) NULL,
	EnteredTime datetime NULL,
	UpdatedBy varchar(50) NULL,
	UpdatedTime datetime NULL
	)  ON [PRIMARY]
GO
IF EXISTS(SELECT * FROM dbo.AuditLog_ThyroidProc)
	 EXEC('INSERT INTO dbo.Tmp_AuditLog_ThyroidProc (LoggedOperation, LoggedBy, LoggedTime, ProcedureId, ProcR_Lobe, ProcL_Lobe, ProcIsthmus, ProcTracheaMgmt, ProcTracheaReconstruct, ProcTracheostomy, ProcLarynxMgmt, ProcEsophagusPharynxMgmt, ProcEsophagusPharynxReconstruct, ProcLaryngealNerveRight, ProcLaryngealNerveLeft, ProcPalpableNodes, ProcNodeDissection, ProcTotalThyroidectomy, ProcR_SuperiorParathyroid, ProcR_InferiorParathyroid, ProcL_SuperiorParathyroid, ProcL_InferiorParathyroid, ProcStrapMuscle, ProcPositioningDraping, ProcIncisionFlaps, ProcR_Lobectomy, ProcL_Lobectomy, ProcWoundClosure, ProcDrain, EnteredBy, EnteredTime, UpdatedBy, UpdatedTime)
		SELECT LoggedOperation, LoggedBy, LoggedTime, ProcedureId, ProcR_Lobe, ProcL_Lobe, ProcIsthmus, ProcTracheaMgmt, ProcTracheaReconstruct, ProcTracheostomy, ProcLarynxMgmt, ProcEsophagusPharynxMgmt, ProcEsophagusPharynxReconstruct, ProcLaryngealNerveRight, ProcLaryngealNerveLeft, ProcPalpableNodes, ProcNodeDissection, ProcTotalThyroidectomy, ProcR_SuperiorParathyroid, ProcR_InferiorParathyroid, ProcL_SuperiorParathyroid, ProcL_InferiorParathyroid, ProcStrapMuscle, ProcPositioningDraping, ProcIncisionFlaps, ProcR_Lobectomy, ProcL_Lobectomy, ProcWoundClosure, ProcDrain, EnteredBy, EnteredTime, UpdatedBy, UpdatedTime FROM dbo.AuditLog_ThyroidProc WITH (HOLDLOCK TABLOCKX)')
GO
DROP TABLE dbo.AuditLog_ThyroidProc
GO
EXECUTE sp_rename N'dbo.Tmp_AuditLog_ThyroidProc', N'AuditLog_ThyroidProc', 'OBJECT' 
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
ALTER TABLE dbo.ThyroidProc
	DROP CONSTRAINT FK_ThyroidProc_Procedures
GO
COMMIT
BEGIN TRANSACTION
GO
CREATE TABLE dbo.Tmp_ThyroidProc
	(
	ProcedureId int NOT NULL,
	ProcR_Lobe varchar(50) NULL,
	ProcL_Lobe varchar(50) NULL,
	ProcIsthmus varchar(50) NULL,
	ProcTracheaMgmt varchar(50) NULL,
	ProcTracheaReconstruct varchar(50) NULL,
	ProcTracheostomy varchar(50) NULL,
	ProcLarynxMgmt varchar(50) NULL,
	ProcEsophagusPharynxMgmt varchar(50) NULL,
	ProcEsophagusPharynxReconstruct varchar(50) NULL,
	ProcLaryngealNerveRight varchar(50) NULL,
	ProcLaryngealNerveLeft varchar(50) NULL,
	ProcPalpableNodes varchar(50) NULL,
	ProcNodeDissection varchar(255) NULL,
	ProcTotalThyroidectomy varchar(50) NULL,
	ProcR_SuperiorParathyroid varchar(50) NULL,
	ProcR_InferiorParathyroid varchar(50) NULL,
	ProcL_SuperiorParathyroid varchar(50) NULL,
	ProcL_InferiorParathyroid varchar(50) NULL,
	ProcStrapMuscle varchar(50) NULL,
	ProcPositioningDraping varchar(1000) NULL,
	ProcIncisionFlaps varchar(1000) NULL,
	ProcR_Lobectomy varchar(1000) NULL,
	ProcL_Lobectomy varchar(1000) NULL,
	ProcWoundClosure varchar(1000) NULL,
	ProcDrain varchar(50) NULL,
	ProcIncisionLength varchar(50) NULL,
	ProcSuperiorLaryngealNerve varchar(50) NULL,
	EnteredBy varchar(50) NOT NULL,
	EnteredTime datetime NOT NULL,
	UpdatedBy varchar(50) NULL,
	UpdatedTime datetime NULL
	)  ON [PRIMARY]
GO
IF EXISTS(SELECT * FROM dbo.ThyroidProc)
	 EXEC('INSERT INTO dbo.Tmp_ThyroidProc (ProcedureId, ProcR_Lobe, ProcL_Lobe, ProcIsthmus, ProcTracheaMgmt, ProcTracheaReconstruct, ProcTracheostomy, ProcLarynxMgmt, ProcEsophagusPharynxMgmt, ProcEsophagusPharynxReconstruct, ProcLaryngealNerveRight, ProcLaryngealNerveLeft, ProcPalpableNodes, ProcNodeDissection, ProcTotalThyroidectomy, ProcR_SuperiorParathyroid, ProcR_InferiorParathyroid, ProcL_SuperiorParathyroid, ProcL_InferiorParathyroid, ProcStrapMuscle, ProcPositioningDraping, ProcIncisionFlaps, ProcR_Lobectomy, ProcL_Lobectomy, ProcWoundClosure, ProcDrain, EnteredBy, EnteredTime, UpdatedBy, UpdatedTime)
		SELECT ProcedureId, ProcR_Lobe, ProcL_Lobe, ProcIsthmus, ProcTracheaMgmt, ProcTracheaReconstruct, ProcTracheostomy, ProcLarynxMgmt, ProcEsophagusPharynxMgmt, ProcEsophagusPharynxReconstruct, ProcLaryngealNerveRight, ProcLaryngealNerveLeft, ProcPalpableNodes, ProcNodeDissection, ProcTotalThyroidectomy, ProcR_SuperiorParathyroid, ProcR_InferiorParathyroid, ProcL_SuperiorParathyroid, ProcL_InferiorParathyroid, ProcStrapMuscle, ProcPositioningDraping, ProcIncisionFlaps, ProcR_Lobectomy, ProcL_Lobectomy, ProcWoundClosure, ProcDrain, EnteredBy, EnteredTime, UpdatedBy, UpdatedTime FROM dbo.ThyroidProc WITH (HOLDLOCK TABLOCKX)')
GO
DROP TABLE dbo.ThyroidProc
GO
EXECUTE sp_rename N'dbo.Tmp_ThyroidProc', N'ThyroidProc', 'OBJECT' 
GO
ALTER TABLE dbo.ThyroidProc ADD CONSTRAINT
	PK_ThyroidProc PRIMARY KEY CLUSTERED 
	(
	ProcedureId
	) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

GO
ALTER TABLE dbo.ThyroidProc WITH NOCHECK ADD CONSTRAINT
	FK_ThyroidProc_Procedures FOREIGN KEY
	(
	ProcedureId
	) REFERENCES dbo.Procedures
	(
	ProcedureId
	) ON UPDATE  CASCADE 
	 ON DELETE  CASCADE 
	 NOT FOR REPLICATION

GO
CREATE TRIGGER dbo.trgAuditThyroidProc_UD
ON dbo.ThyroidProc FOR UPDATE, DELETE
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
   INSERT INTO AuditLog_ThyroidProc
   SELECT @action AS LoggedOperation, Inserted.UpdatedBy AS LoggedBy, 
          GETDATE() AS LoggedTime, Deleted.*
   FROM Deleted INNER JOIN INSERTED
   ON Deleted.ProcedureId = Inserted.ProcedureId
ELSE IF @action = 'DELETE'
   INSERT INTO AuditLog_ThyroidProc
   SELECT @action AS LoggedOperation, SYSTEM_USER AS LoggedBy, GETDATE() AS LoggedTime, *
   FROM Deleted
GO
COMMIT
GO
