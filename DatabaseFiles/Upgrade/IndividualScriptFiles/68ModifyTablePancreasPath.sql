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
CREATE TABLE dbo.Tmp_AuditLog_PancreasPath
	(
	LoggedOperation varchar(50) NULL,
	LoggedBy varchar(50) NULL,
	LoggedTime datetime NULL,
	PathologyId int NULL,
	PathDifferentiation varchar(50) NULL,
	PathExtraParenchymalInv varchar(50) NULL,
	PathVascularInv varchar(50) NULL,
	PathPerineuralInv varchar(50) NULL,
	PathPancreaticMargin varchar(50) NULL,
	PathAnteriorMargin varchar(50) NULL,
	PathPosteriorMargin varchar(50) NULL,
	PathDuodenalMargin varchar(50) NULL,
	PathGastricMargin varchar(50) NULL,
	PathBileDuctMargin varchar(50) NULL,
	PathAnteriorPeritonealInv varchar(50) NULL,
	PathPancreatitis varchar(50) NULL,
	PathFibrosis varchar(50) NULL,
	PathDuodenum varchar(50) NULL,
	PathStomach varchar(50) NULL,
	PathPanIn varchar(50) NULL,
	PathIPMN varchar(50) NULL,
	PathLymphaticInv varchar(50) NULL,
	PathEpitheliumType varchar(50) NULL,
	PathDysplasia varchar(50) NULL,
	PathCarcinoma varchar(50) NULL,
	PathCarcinomaType varchar(50) NULL,
	PathPercCarcinoma varchar(50) NULL,
	PathCarcinomaMaxDim varchar(50) NULL,
	PathNonneoplastic varchar(50) NULL,
	PathAddTissueMargin varchar(50) NULL,
	PathProximalMargin varchar(50) NULL,
	PathDistalMargin varchar(50) NULL,
	PathFocality varchar(50) NULL,
	EnteredBy varchar(50) NULL,
	EnteredTime datetime NULL,
	UpdatedBy varchar(50) NULL,
	UpdatedTime datetime NULL
	)  ON [PRIMARY]
GO
ALTER TABLE dbo.Tmp_AuditLog_PancreasPath SET (LOCK_ESCALATION = TABLE)
GO
IF EXISTS(SELECT * FROM dbo.AuditLog_PancreasPath)
	 EXEC('INSERT INTO dbo.Tmp_AuditLog_PancreasPath (LoggedOperation, LoggedBy, LoggedTime, PathologyId, PathDifferentiation, PathExtraParenchymalInv, PathVascularInv, PathPerineuralInv, PathPancreaticMargin, PathAnteriorMargin, PathPosteriorMargin, PathDuodenalMargin, PathGastricMargin, PathBileDuctMargin, PathAnteriorPeritonealInv, PathPancreatitis, PathFibrosis, PathDuodenum, PathStomach, PathPanIn, PathIPMN, PathLymphaticInv, PathEpitheliumType, PathDysplasia, PathCarcinoma, PathCarcinomaType, PathPercCarcinoma, PathCarcinomaMaxDim, PathNonneoplastic, PathAddTissueMargin, PathProximalMargin, PathDistalMargin, EnteredBy, EnteredTime, UpdatedBy, UpdatedTime)
		SELECT LoggedOperation, LoggedBy, LoggedTime, PathologyId, PathDifferentiation, PathExtraParenchymalInv, PathVascularInv, PathPerineuralInv, PathPancreaticMargin, PathAnteriorMargin, PathPosteriorMargin, PathDuodenalMargin, PathGastricMargin, PathBileDuctMargin, PathAnteriorPeritonealInv, PathPancreatitis, PathFibrosis, PathDuodenum, PathStomach, PathPanIn, PathIPMN, PathLymphaticInv, PathEpitheliumType, PathDysplasia, PathCarcinoma, PathCarcinomaType, PathPercCarcinoma, PathCarcinomaMaxDim, PathNonneoplastic, PathAddTissueMargin, PathProximalMargin, PathDistalMargin, EnteredBy, EnteredTime, UpdatedBy, UpdatedTime FROM dbo.AuditLog_PancreasPath WITH (HOLDLOCK TABLOCKX)')
GO
DROP TABLE dbo.AuditLog_PancreasPath
GO
EXECUTE sp_rename N'dbo.Tmp_AuditLog_PancreasPath', N'AuditLog_PancreasPath', 'OBJECT' 
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
ALTER TABLE dbo.PancreasPath
	DROP CONSTRAINT FK_PancreasPath_Pathology
GO
ALTER TABLE dbo.Pathology SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
BEGIN TRANSACTION
GO
CREATE TABLE dbo.Tmp_PancreasPath
	(
	PathologyId int NOT NULL,
	PathDifferentiation varchar(50) NULL,
	PathExtraParenchymalInv varchar(50) NULL,
	PathVascularInv varchar(50) NULL,
	PathPerineuralInv varchar(50) NULL,
	PathPancreaticMargin varchar(50) NULL,
	PathAnteriorMargin varchar(50) NULL,
	PathPosteriorMargin varchar(50) NULL,
	PathDuodenalMargin varchar(50) NULL,
	PathGastricMargin varchar(50) NULL,
	PathBileDuctMargin varchar(50) NULL,
	PathAnteriorPeritonealInv varchar(50) NULL,
	PathPancreatitis varchar(50) NULL,
	PathFibrosis varchar(50) NULL,
	PathDuodenum varchar(50) NULL,
	PathStomach varchar(50) NULL,
	PathPanIn varchar(50) NULL,
	PathIPMN varchar(50) NULL,
	PathLymphaticInv varchar(50) NULL,
	PathEpitheliumType varchar(50) NULL,
	PathDysplasia varchar(50) NULL,
	PathCarcinoma varchar(50) NULL,
	PathCarcinomaType varchar(50) NULL,
	PathPercCarcinoma varchar(50) NULL,
	PathCarcinomaMaxDim varchar(50) NULL,
	PathNonneoplastic varchar(50) NULL,
	PathAddTissueMargin varchar(50) NULL,
	PathProximalMargin varchar(50) NULL,
	PathDistalMargin varchar(50) NULL,
	PathFocality varchar(50) NULL,
	EnteredBy varchar(50) NOT NULL,
	EnteredTime datetime NOT NULL,
	UpdatedBy varchar(50) NULL,
	UpdatedTime datetime NULL
	)  ON [PRIMARY]
GO
ALTER TABLE dbo.Tmp_PancreasPath SET (LOCK_ESCALATION = TABLE)
GO
IF EXISTS(SELECT * FROM dbo.PancreasPath)
	 EXEC('INSERT INTO dbo.Tmp_PancreasPath (PathologyId, PathDifferentiation, PathExtraParenchymalInv, PathVascularInv, PathPerineuralInv, PathPancreaticMargin, PathAnteriorMargin, PathPosteriorMargin, PathDuodenalMargin, PathGastricMargin, PathBileDuctMargin, PathAnteriorPeritonealInv, PathPancreatitis, PathFibrosis, PathDuodenum, PathStomach, PathPanIn, PathIPMN, PathLymphaticInv, PathEpitheliumType, PathDysplasia, PathCarcinoma, PathCarcinomaType, PathPercCarcinoma, PathCarcinomaMaxDim, PathNonneoplastic, PathAddTissueMargin, PathProximalMargin, PathDistalMargin, EnteredBy, EnteredTime, UpdatedBy, UpdatedTime)
		SELECT PathologyId, PathDifferentiation, PathExtraParenchymalInv, PathVascularInv, PathPerineuralInv, PathPancreaticMargin, PathAnteriorMargin, PathPosteriorMargin, PathDuodenalMargin, PathGastricMargin, PathBileDuctMargin, PathAnteriorPeritonealInv, PathPancreatitis, PathFibrosis, PathDuodenum, PathStomach, PathPanIn, PathIPMN, PathLymphaticInv, PathEpitheliumType, PathDysplasia, PathCarcinoma, PathCarcinomaType, PathPercCarcinoma, PathCarcinomaMaxDim, PathNonneoplastic, PathAddTissueMargin, PathProximalMargin, PathDistalMargin, EnteredBy, EnteredTime, UpdatedBy, UpdatedTime FROM dbo.PancreasPath WITH (HOLDLOCK TABLOCKX)')
GO
DROP TABLE dbo.PancreasPath
GO
EXECUTE sp_rename N'dbo.Tmp_PancreasPath', N'PancreasPath', 'OBJECT' 
GO
ALTER TABLE dbo.PancreasPath ADD CONSTRAINT
	PK_PancreasPath PRIMARY KEY CLUSTERED 
	(
	PathologyId
	) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

GO
ALTER TABLE dbo.PancreasPath WITH NOCHECK ADD CONSTRAINT
	FK_PancreasPath_Pathology FOREIGN KEY
	(
	PathologyId
	) REFERENCES dbo.Pathology
	(
	PathologyId
	) ON UPDATE  CASCADE 
	 ON DELETE  CASCADE 
	 NOT FOR REPLICATION

GO
CREATE TRIGGER dbo.trgAuditPancreasPath_UD
ON dbo.PancreasPath FOR UPDATE, DELETE
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
   INSERT INTO AuditLog_PancreasPath
   SELECT @action AS LoggedOperation, Inserted.UpdatedBy AS LoggedBy, 
          GETDATE() AS LoggedTime, Deleted.*
   FROM Deleted INNER JOIN INSERTED
   ON Deleted.PathologyId = Inserted.PathologyId
ELSE IF @action = 'DELETE'
   INSERT INTO AuditLog_PancreasPath
   SELECT @action AS LoggedOperation, SYSTEM_USER AS LoggedBy, GETDATE() AS LoggedTime, *
   FROM Deleted
GO
COMMIT
GO
