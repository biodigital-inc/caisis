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
CREATE TABLE dbo.Tmp_AuditLog_GynGI_UpperAbdominalProc
	(
	LoggedOperation varchar(50) NULL,
	LoggedBy varchar(50) NULL,
	LoggedTime datetime NULL,
	ProcedureId int NULL,
	ProcAirLeakTest varchar(50) NULL,
	ProcSmallBowelAnastChecked varchar(255) NULL,
	ProcHemicolectomyAnastMethod varchar(50) NULL,
	ProcHemicolectomyAnastType varchar(50) NULL,
	ProcMesentericDefect varchar(50) NULL,
	ProcLAR_Details varchar(1000) NULL,
	ProcLenSmallBowelRemaining varchar(50) NULL,
	ProcL_ColonManeuverAnast varchar(255) NULL,
	ProcMaxSizeDiaphragmRemoved varchar(50) NULL,
	ProcMethodOfAnast varchar(50) NULL,
	ProcL_PositivePressureBubbleResult varchar(50) NULL,
	ProcR_PositivePressureBubbleResult varchar(50) NULL,
	ProcProximalIntestinalTransection varchar(50) NULL,
	ProcReconType varchar(50) NULL,
	ProcAirLeakTestResult varchar(50) NULL,
	ProcStaplerSize varchar(50) NULL,
	ProcChestTubeSize varchar(50) NULL,
	ProcStaplerType varchar(50) NULL,
	ProcL_DiaphragmResectionExtent varchar(50) NULL,
	ProcR_DiaphragmResectionExtent varchar(50) NULL,
	ProcR_DiaphragmSutureType varchar(50) NULL,
	ProcL_DiaphragmSutureType varchar(50) NULL,
	ProcDiaphragmClosedMeshRight varchar(50) NULL,
	ProcDiaphragmClosedMeshLeft varchar(50) NULL,
	ProcProximalIntestinalTtransection varchar(50) NULL,
	ProcLocAnastAnalVerge varchar(50) NULL,
	ProcSatisfactoryAnast varchar(255) NULL,
	ProcLenFirstResectSmallBowel varchar(50) NULL,
	ProcLenSecondResectSmallBowel varchar(50) NULL,
	ProcStomachWallClosure varchar(50) NULL,
	ProcStomClosureMethod varchar(50) NULL,
	ProcStomaDiversionType varchar(50) NULL,
	ProcRemnantClosure varchar(50) NULL,
	ProcBypassPerformed varchar(50) NULL,
	EnteredBy varchar(50) NULL,
	EnteredTime datetime NULL,
	UpdatedBy varchar(50) NULL,
	UpdatedTime datetime NULL
	)  ON [PRIMARY]
GO
ALTER TABLE dbo.Tmp_AuditLog_GynGI_UpperAbdominalProc SET (LOCK_ESCALATION = TABLE)
GO
IF EXISTS(SELECT * FROM dbo.AuditLog_GynGI_UpperAbdominalProc)
	 EXEC('INSERT INTO dbo.Tmp_AuditLog_GynGI_UpperAbdominalProc (LoggedOperation, LoggedBy, LoggedTime, ProcedureId, ProcAirLeakTest, ProcSmallBowelAnastChecked, ProcHemicolectomyAnastMethod, ProcHemicolectomyAnastType, ProcMesentericDefect, ProcLAR_Details, ProcLenSmallBowelRemaining, ProcL_ColonManeuverAnast, ProcMaxSizeDiaphragmRemoved, ProcMethodOfAnast, ProcL_PositivePressureBubbleResult, ProcR_PositivePressureBubbleResult, ProcProximalIntestinalTransection, ProcReconType, ProcAirLeakTestResult, ProcStaplerSize, ProcChestTubeSize, ProcStaplerType, ProcL_DiaphragmResectionExtent, ProcR_DiaphragmResectionExtent, ProcR_DiaphragmSutureType, ProcL_DiaphragmSutureType, ProcDiaphragmClosedMeshRight, ProcDiaphragmClosedMeshLeft, ProcProximalIntestinalTtransection, ProcLocAnastAnalVerge, ProcSatisfactoryAnast, ProcLenFirstResectSmallBowel, ProcLenSecondResectSmallBowel, ProcStomachWallClosure, ProcStomClosureMethod, ProcStomaDiversionType, ProcRemnantClosure, EnteredBy, EnteredTime, UpdatedBy, UpdatedTime)
		SELECT LoggedOperation, LoggedBy, LoggedTime, ProcedureId, ProcAirLeakTest, ProcSmallBowelAnastChecked, ProcHemicolectomyAnastMethod, ProcHemicolectomyAnastType, ProcMesentericDefect, ProcLAR_Details, ProcLenSmallBowelRemaining, ProcL_ColonManeuverAnast, ProcMaxSizeDiaphragmRemoved, ProcMethodOfAnast, ProcL_PositivePressureBubbleResult, ProcR_PositivePressureBubbleResult, ProcProximalIntestinalTransection, ProcReconType, ProcAirLeakTestResult, ProcStaplerSize, ProcChestTubeSize, ProcStaplerType, ProcL_DiaphragmResectionExtent, ProcR_DiaphragmResectionExtent, ProcR_DiaphragmSutureType, ProcL_DiaphragmSutureType, ProcDiaphragmClosedMeshRight, ProcDiaphragmClosedMeshLeft, ProcProximalIntestinalTtransection, ProcLocAnastAnalVerge, ProcSatisfactoryAnast, ProcLenFirstResectSmallBowel, ProcLenSecondResectSmallBowel, ProcStomachWallClosure, ProcStomClosureMethod, ProcStomaDiversionType, ProcRemnantClosure, EnteredBy, EnteredTime, UpdatedBy, UpdatedTime FROM dbo.AuditLog_GynGI_UpperAbdominalProc WITH (HOLDLOCK TABLOCKX)')
GO
DROP TABLE dbo.AuditLog_GynGI_UpperAbdominalProc
GO
EXECUTE sp_rename N'dbo.Tmp_AuditLog_GynGI_UpperAbdominalProc', N'AuditLog_GynGI_UpperAbdominalProc', 'OBJECT' 
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
ALTER TABLE dbo.GynGI_UpperAbdominalProc
	DROP CONSTRAINT FK_GynGI_UpperAbdominalProc_Procedures
GO
ALTER TABLE dbo.Procedures SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
BEGIN TRANSACTION
GO
CREATE TABLE dbo.Tmp_GynGI_UpperAbdominalProc
	(
	ProcedureId int NOT NULL,
	ProcAirLeakTest varchar(50) NULL,
	ProcSmallBowelAnastChecked varchar(255) NULL,
	ProcHemicolectomyAnastMethod varchar(50) NULL,
	ProcHemicolectomyAnastType varchar(50) NULL,
	ProcMesentericDefect varchar(50) NULL,
	ProcLAR_Details varchar(1000) NULL,
	ProcLenSmallBowelRemaining varchar(50) NULL,
	ProcL_ColonManeuverAnast varchar(255) NULL,
	ProcMaxSizeDiaphragmRemoved varchar(50) NULL,
	ProcMethodOfAnast varchar(50) NULL,
	ProcL_PositivePressureBubbleResult varchar(50) NULL,
	ProcR_PositivePressureBubbleResult varchar(50) NULL,
	ProcProximalIntestinalTransection varchar(50) NULL,
	ProcReconType varchar(50) NULL,
	ProcAirLeakTestResult varchar(50) NULL,
	ProcStaplerSize varchar(50) NULL,
	ProcChestTubeSize varchar(50) NULL,
	ProcStaplerType varchar(50) NULL,
	ProcL_DiaphragmResectionExtent varchar(50) NULL,
	ProcR_DiaphragmResectionExtent varchar(50) NULL,
	ProcR_DiaphragmSutureType varchar(50) NULL,
	ProcL_DiaphragmSutureType varchar(50) NULL,
	ProcDiaphragmClosedMeshRight varchar(50) NULL,
	ProcDiaphragmClosedMeshLeft varchar(50) NULL,
	ProcProximalIntestinalTtransection varchar(50) NULL,
	ProcLocAnastAnalVerge varchar(50) NULL,
	ProcSatisfactoryAnast varchar(255) NULL,
	ProcLenFirstResectSmallBowel varchar(50) NULL,
	ProcLenSecondResectSmallBowel varchar(50) NULL,
	ProcStomachWallClosure varchar(50) NULL,
	ProcStomClosureMethod varchar(50) NULL,
	ProcStomaDiversionType varchar(50) NULL,
	ProcRemnantClosure varchar(50) NULL,
	ProcBypassPerformed varchar(50) NULL,
	EnteredBy varchar(50) NOT NULL,
	EnteredTime datetime NOT NULL,
	UpdatedBy varchar(50) NULL,
	UpdatedTime datetime NULL
	)  ON [PRIMARY]
GO
ALTER TABLE dbo.Tmp_GynGI_UpperAbdominalProc SET (LOCK_ESCALATION = TABLE)
GO
IF EXISTS(SELECT * FROM dbo.GynGI_UpperAbdominalProc)
	 EXEC('INSERT INTO dbo.Tmp_GynGI_UpperAbdominalProc (ProcedureId, ProcAirLeakTest, ProcSmallBowelAnastChecked, ProcHemicolectomyAnastMethod, ProcHemicolectomyAnastType, ProcMesentericDefect, ProcLAR_Details, ProcLenSmallBowelRemaining, ProcL_ColonManeuverAnast, ProcMaxSizeDiaphragmRemoved, ProcMethodOfAnast, ProcL_PositivePressureBubbleResult, ProcR_PositivePressureBubbleResult, ProcProximalIntestinalTransection, ProcReconType, ProcAirLeakTestResult, ProcStaplerSize, ProcChestTubeSize, ProcStaplerType, ProcL_DiaphragmResectionExtent, ProcR_DiaphragmResectionExtent, ProcR_DiaphragmSutureType, ProcL_DiaphragmSutureType, ProcDiaphragmClosedMeshRight, ProcDiaphragmClosedMeshLeft, ProcProximalIntestinalTtransection, ProcLocAnastAnalVerge, ProcSatisfactoryAnast, ProcLenFirstResectSmallBowel, ProcLenSecondResectSmallBowel, ProcStomachWallClosure, ProcStomClosureMethod, ProcStomaDiversionType, ProcRemnantClosure, EnteredBy, EnteredTime, UpdatedBy, UpdatedTime)
		SELECT ProcedureId, ProcAirLeakTest, ProcSmallBowelAnastChecked, ProcHemicolectomyAnastMethod, ProcHemicolectomyAnastType, ProcMesentericDefect, ProcLAR_Details, ProcLenSmallBowelRemaining, ProcL_ColonManeuverAnast, ProcMaxSizeDiaphragmRemoved, ProcMethodOfAnast, ProcL_PositivePressureBubbleResult, ProcR_PositivePressureBubbleResult, ProcProximalIntestinalTransection, ProcReconType, ProcAirLeakTestResult, ProcStaplerSize, ProcChestTubeSize, ProcStaplerType, ProcL_DiaphragmResectionExtent, ProcR_DiaphragmResectionExtent, ProcR_DiaphragmSutureType, ProcL_DiaphragmSutureType, ProcDiaphragmClosedMeshRight, ProcDiaphragmClosedMeshLeft, ProcProximalIntestinalTtransection, ProcLocAnastAnalVerge, ProcSatisfactoryAnast, ProcLenFirstResectSmallBowel, ProcLenSecondResectSmallBowel, ProcStomachWallClosure, ProcStomClosureMethod, ProcStomaDiversionType, ProcRemnantClosure, EnteredBy, EnteredTime, UpdatedBy, UpdatedTime FROM dbo.GynGI_UpperAbdominalProc WITH (HOLDLOCK TABLOCKX)')
GO
DROP TABLE dbo.GynGI_UpperAbdominalProc
GO
EXECUTE sp_rename N'dbo.Tmp_GynGI_UpperAbdominalProc', N'GynGI_UpperAbdominalProc', 'OBJECT' 
GO
ALTER TABLE dbo.GynGI_UpperAbdominalProc ADD CONSTRAINT
	PK_GynGI_UpperAbdominalProc PRIMARY KEY CLUSTERED 
	(
	ProcedureId
	) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

GO
ALTER TABLE dbo.GynGI_UpperAbdominalProc ADD CONSTRAINT
	FK_GynGI_UpperAbdominalProc_Procedures FOREIGN KEY
	(
	ProcedureId
	) REFERENCES dbo.Procedures
	(
	ProcedureId
	) ON UPDATE  CASCADE 
	 ON DELETE  CASCADE 
	
GO
CREATE TRIGGER [dbo].[trgAuditGynGI_UpperAbdominalProc_UD]
ON dbo.GynGI_UpperAbdominalProc FOR UPDATE, DELETE
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
   INSERT INTO AuditLog_GynGI_UpperAbdominalProc
   SELECT @action AS LoggedOperation, Inserted.UpdatedBy AS LoggedBy, 
          GETDATE() AS LoggedTime, Deleted.*
   FROM Deleted INNER JOIN INSERTED
   ON Deleted.ProcedureId = Inserted.ProcedureId
ELSE IF @action = 'DELETE'
   INSERT INTO AuditLog_GynGI_UpperAbdominalProc
   SELECT @action AS LoggedOperation, SYSTEM_USER AS LoggedBy, GETDATE() AS LoggedTime, *
   FROM Deleted
GO
sp_settriggerorder N'trgAuditGynGI_UpperAbdominalProc_UD', N'last', N'update'
GO
COMMIT
GO
