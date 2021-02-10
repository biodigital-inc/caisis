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
CREATE TABLE dbo.Tmp_AuditLog_BreastPath
	(
	LoggedOperation varchar(50) NULL,
	LoggedBy varchar(50) NULL,
	LoggedTime datetime NULL,
	PathologyId int NULL,
	PathMargin varchar(50) NULL,
	PathSuperiorMargin varchar(50) NULL,
	PathInferiorMargin varchar(50) NULL,
	PathAnteriorMargin varchar(50) NULL,
	PathPosteriorMargin varchar(50) NULL,
	PathIntraductal varchar(50) NULL,
	PathMultifocal varchar(50) NULL,
	PathLocation varchar(50) NULL,
	PathLocation2 varchar(50) NULL,
	PathExtension varchar(50) NULL,
	PathNumFociCancer varchar(50) NULL,
	PathNucPleo varchar(50) NULL,
	PathTubForm varchar(50) NULL,
	PathMitIdx varchar(50) NULL,
	PathTumorMaxDim varchar(50) NULL,
	PathAngloInv varchar(50) NULL,
	PathLymphaticInv varchar(50) NULL,
	PathVascularInv varchar(50) NULL,
	PathPerineuralInv varchar(50) NULL,
	PathAssInSitu varchar(50) NULL,
	PathExtentInSitu varchar(50) NULL,
	PathNuclearGrade varchar(50) NULL,
	PathInSituNecrosis varchar(50) NULL,
	PathCalcifications varchar(50) NULL,
	PathBenign varchar(50) NULL,
	PathNumReExcision varchar(50) NULL,
	PathNumPositiveMargins varchar(50) NULL,
	PathOverallGrade varchar(50) NULL,
	PathMulticentric varchar(50) NULL,
	EnteredBy varchar(50) NULL,
	EnteredTime datetime NULL,
	UpdatedBy varchar(50) NULL,
	UpdatedTime datetime NULL
	)  ON [PRIMARY]
GO
ALTER TABLE dbo.Tmp_AuditLog_BreastPath SET (LOCK_ESCALATION = TABLE)
GO
IF EXISTS(SELECT * FROM dbo.AuditLog_BreastPath)
	 EXEC('INSERT INTO dbo.Tmp_AuditLog_BreastPath (LoggedOperation, LoggedBy, LoggedTime, PathologyId, PathMargin, PathSuperiorMargin, PathInferiorMargin, PathAnteriorMargin, PathPosteriorMargin, PathIntraductal, PathMultifocal, PathLocation, PathLocation2, PathExtension, PathNumFociCancer, PathNucPleo, PathTubForm, PathMitIdx, PathTumorMaxDim, PathAngloInv, PathLymphaticInv, PathVascularInv, PathPerineuralInv, PathAssInSitu, PathExtentInSitu, PathNuclearGrade, PathInSituNecrosis, PathCalcifications, PathBenign, PathNumReExcision, PathNumPositiveMargins, EnteredBy, EnteredTime, UpdatedBy, UpdatedTime)
		SELECT LoggedOperation, LoggedBy, LoggedTime, PathologyId, PathMargin, PathSuperiorMargin, PathInferiorMargin, PathAnteriorMargin, PathPosteriorMargin, PathIntraductal, PathMultifocal, PathLocation, PathLocation2, PathExtension, PathNumFociCancer, PathNucPleo, PathTubForm, PathMitIdx, PathTumorMaxDim, PathAngloInv, PathLymphaticInv, PathVascularInv, PathPerineuralInv, PathAssInSitu, PathExtentInSitu, PathNuclearGrade, PathInSituNecrosis, PathCalcifications, PathBenign, PathNumReExcision, PathNumPositiveMargins, EnteredBy, EnteredTime, UpdatedBy, UpdatedTime FROM dbo.AuditLog_BreastPath WITH (HOLDLOCK TABLOCKX)')
GO
DROP TABLE dbo.AuditLog_BreastPath
GO
EXECUTE sp_rename N'dbo.Tmp_AuditLog_BreastPath', N'AuditLog_BreastPath', 'OBJECT' 
GO
COMMIT
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
ALTER TABLE dbo.BreastPath
	DROP CONSTRAINT FK_BreastPath_Pathology
GO
ALTER TABLE dbo.Pathology SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
BEGIN TRANSACTION
GO
CREATE TABLE dbo.Tmp_BreastPath
	(
	PathologyId int NOT NULL,
	PathMargin varchar(50) NULL,
	PathSuperiorMargin varchar(50) NULL,
	PathInferiorMargin varchar(50) NULL,
	PathAnteriorMargin varchar(50) NULL,
	PathPosteriorMargin varchar(50) NULL,
	PathIntraductal varchar(50) NULL,
	PathMultifocal varchar(50) NULL,
	PathLocation varchar(50) NULL,
	PathLocation2 varchar(50) NULL,
	PathExtension varchar(50) NULL,
	PathNumFociCancer varchar(50) NULL,
	PathNucPleo varchar(50) NULL,
	PathTubForm varchar(50) NULL,
	PathMitIdx varchar(50) NULL,
	PathTumorMaxDim varchar(50) NULL,
	PathAngloInv varchar(50) NULL,
	PathLymphaticInv varchar(50) NULL,
	PathVascularInv varchar(50) NULL,
	PathPerineuralInv varchar(50) NULL,
	PathAssInSitu varchar(50) NULL,
	PathExtentInSitu varchar(50) NULL,
	PathNuclearGrade varchar(50) NULL,
	PathInSituNecrosis varchar(50) NULL,
	PathCalcifications varchar(50) NULL,
	PathBenign varchar(50) NULL,
	PathNumReExcision varchar(50) NULL,
	PathNumPositiveMargins varchar(50) NULL,
	PathOverallGrade varchar(50) NULL,
	PathMulticentric varchar(50) NULL,
	EnteredBy varchar(50) NOT NULL,
	EnteredTime datetime NOT NULL,
	UpdatedBy varchar(50) NULL,
	UpdatedTime datetime NULL
	)  ON [PRIMARY]
GO
ALTER TABLE dbo.Tmp_BreastPath SET (LOCK_ESCALATION = TABLE)
GO
IF EXISTS(SELECT * FROM dbo.BreastPath)
	 EXEC('INSERT INTO dbo.Tmp_BreastPath (PathologyId, PathMargin, PathSuperiorMargin, PathInferiorMargin, PathAnteriorMargin, PathPosteriorMargin, PathIntraductal, PathMultifocal, PathLocation, PathLocation2, PathExtension, PathNumFociCancer, PathNucPleo, PathTubForm, PathMitIdx, PathTumorMaxDim, PathAngloInv, PathLymphaticInv, PathVascularInv, PathPerineuralInv, PathAssInSitu, PathExtentInSitu, PathNuclearGrade, PathInSituNecrosis, PathCalcifications, PathBenign, PathNumReExcision, PathNumPositiveMargins, EnteredBy, EnteredTime, UpdatedBy, UpdatedTime)
		SELECT PathologyId, PathMargin, PathSuperiorMargin, PathInferiorMargin, PathAnteriorMargin, PathPosteriorMargin, PathIntraductal, PathMultifocal, PathLocation, PathLocation2, PathExtension, PathNumFociCancer, PathNucPleo, PathTubForm, PathMitIdx, PathTumorMaxDim, PathAngloInv, PathLymphaticInv, PathVascularInv, PathPerineuralInv, PathAssInSitu, PathExtentInSitu, PathNuclearGrade, PathInSituNecrosis, PathCalcifications, PathBenign, PathNumReExcision, PathNumPositiveMargins, EnteredBy, EnteredTime, UpdatedBy, UpdatedTime FROM dbo.BreastPath WITH (HOLDLOCK TABLOCKX)')
GO
DROP TABLE dbo.BreastPath
GO
EXECUTE sp_rename N'dbo.Tmp_BreastPath', N'BreastPath', 'OBJECT' 
GO
ALTER TABLE dbo.BreastPath ADD CONSTRAINT
	PK_BreastPath PRIMARY KEY CLUSTERED 
	(
	PathologyId
	) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

GO
ALTER TABLE dbo.BreastPath WITH NOCHECK ADD CONSTRAINT
	FK_BreastPath_Pathology FOREIGN KEY
	(
	PathologyId
	) REFERENCES dbo.Pathology
	(
	PathologyId
	) ON UPDATE  CASCADE 
	 ON DELETE  CASCADE 
	 NOT FOR REPLICATION

GO
CREATE TRIGGER dbo.trgAuditBreastPath_UD
ON dbo.BreastPath FOR UPDATE, DELETE
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
   INSERT INTO AuditLog_BreastPath
   SELECT @action AS LoggedOperation, Inserted.UpdatedBy AS LoggedBy, 
          GETDATE() AS LoggedTime, Deleted.*
   FROM Deleted INNER JOIN INSERTED
   ON Deleted.PathologyId = Inserted.PathologyId
ELSE IF @action = 'DELETE'
   INSERT INTO AuditLog_BreastPath
   SELECT @action AS LoggedOperation, SYSTEM_USER AS LoggedBy, GETDATE() AS LoggedTime, *
   FROM Deleted
GO
COMMIT
GO
EXEC sp_settriggerorder @triggername=N'[dbo].[trgAuditBreastPath_UD]', @order=N'Last', @stmttype=N'UPDATE'
GO
