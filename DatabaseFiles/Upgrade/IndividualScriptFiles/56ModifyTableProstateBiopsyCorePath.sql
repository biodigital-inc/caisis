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
CREATE TABLE dbo.Tmp_AuditLog_ProstateBiopsyCorePath
	(
	LoggedOperation varchar(50) NULL,
	LoggedBy varchar(50) NULL,
	LoggedTime datetime NULL,
	PathologyId int NULL,
	ProstateBiopsyCorePathId int NULL,
	PathCoreSide varchar(50) NULL,
	PathCoreLevel varchar(50) NULL,
	PathCoreLaterality varchar(50) NULL,
	PathCoreZone varchar(50) NULL,
	PathCoreNumCores varchar(50) NULL,
	PathCoreNumTotalCores varchar(50) NULL,
	PathCoreNumFragments varchar(50) NULL,
	PathCoreLength varchar(50) NULL,
	PathCorePercCancer varchar(50) NULL,
	PathCoreMaxCancerLength varchar(50) NULL,
	PathCoreCancerLength varchar(50) NULL,
	PathCorePercHG_Cancer varchar(50) NULL,
	PathCoreHG_Length varchar(50) NULL,
	PathCoreGG1 varchar(50) NULL,
	PathCoreGG2 varchar(50) NULL,
	PathCoreGG3 varchar(50) NULL,
	PathCoreGGS varchar(50) NULL,
	PathCoreResult varchar(50) NULL,
	PathCoreExtension varchar(50) NULL,
	PathCoreProstatitis varchar(50) NULL,
	PathCorePerineuralInv varchar(50) NULL,
	PathCorePNI_Diam varchar(50) NULL,
	PathCoreHG_PIN varchar(50) NULL,
	PathCoreType varchar(50) NULL,
	PathCoreCapsule varchar(50) NULL,
	PathCoreFat varchar(50) NULL,
	PathCoreASAP varchar(50) NULL,
	PathCoreAtrophy varchar(50) NULL,
	PathCoreStroma varchar(50) NULL,
	PathCoreNotes varchar(1000) NULL,
	EnteredBy varchar(50) NULL,
	EnteredTime datetime NULL,
	UpdatedBy varchar(50) NULL,
	UpdatedTime datetime NULL
	)  ON [PRIMARY]
GO
IF EXISTS(SELECT * FROM dbo.AuditLog_ProstateBiopsyCorePath)
	 EXEC('INSERT INTO dbo.Tmp_AuditLog_ProstateBiopsyCorePath (LoggedOperation, LoggedBy, LoggedTime, PathologyId, ProstateBiopsyCorePathId, PathCoreSide, PathCoreLevel, PathCoreLaterality, PathCoreZone, PathCoreNumCores, PathCoreNumFragments, PathCoreLength, PathCorePercCancer, PathCoreMaxCancerLength, PathCoreCancerLength, PathCorePercHG_Cancer, PathCoreHG_Length, PathCoreGG1, PathCoreGG2, PathCoreGG3, PathCoreGGS, PathCoreResult, PathCoreExtension, PathCoreProstatitis, PathCorePerineuralInv, PathCorePNI_Diam, PathCoreHG_PIN, PathCoreType, PathCoreCapsule, PathCoreFat, PathCoreASAP, PathCoreAtrophy, PathCoreStroma, PathCoreNotes, EnteredBy, EnteredTime, UpdatedBy, UpdatedTime)
		SELECT LoggedOperation, LoggedBy, LoggedTime, PathologyId, ProstateBiopsyCorePathId, PathCoreSide, PathCoreLevel, PathCoreLaterality, PathCoreZone, PathCoreNumCores, PathCoreNumFragments, PathCoreLength, PathCorePercCancer, PathCoreMaxCancerLength, PathCoreCancerLength, PathCorePercHG_Cancer, PathCoreHG_Length, PathCoreGG1, PathCoreGG2, PathCoreGG3, PathCoreGGS, PathCoreResult, PathCoreExtension, PathCoreProstatitis, PathCorePerineuralInv, PathCorePNI_Diam, PathCoreHG_PIN, PathCoreType, PathCoreCapsule, PathCoreFat, PathCoreASAP, PathCoreAtrophy, PathCoreStroma, PathCoreNotes, EnteredBy, EnteredTime, UpdatedBy, UpdatedTime FROM dbo.AuditLog_ProstateBiopsyCorePath WITH (HOLDLOCK TABLOCKX)')
GO
DROP TABLE dbo.AuditLog_ProstateBiopsyCorePath
GO
EXECUTE sp_rename N'dbo.Tmp_AuditLog_ProstateBiopsyCorePath', N'AuditLog_ProstateBiopsyCorePath', 'OBJECT' 
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
ALTER TABLE dbo.ProstateBiopsyCorePath
	DROP CONSTRAINT FK_ProstateBiopsyCorePath_Pathology
GO
COMMIT
BEGIN TRANSACTION
GO
CREATE TABLE dbo.Tmp_ProstateBiopsyCorePath
	(
	PathologyId int NOT NULL,
	ProstateBiopsyCorePathId int NOT NULL IDENTITY (1, 1),
	PathCoreSide varchar(50) NULL,
	PathCoreLevel varchar(50) NULL,
	PathCoreLaterality varchar(50) NULL,
	PathCoreZone varchar(50) NULL,
	PathCoreNumCores varchar(50) NULL,
	PathCoreNumTotalCores varchar(50) NULL,
	PathCoreNumFragments varchar(50) NULL,
	PathCoreLength varchar(50) NULL,
	PathCorePercCancer varchar(50) NULL,
	PathCoreMaxCancerLength varchar(50) NULL,
	PathCoreCancerLength varchar(50) NULL,
	PathCorePercHG_Cancer varchar(50) NULL,
	PathCoreHG_Length varchar(50) NULL,
	PathCoreGG1 varchar(50) NULL,
	PathCoreGG2 varchar(50) NULL,
	PathCoreGG3 varchar(50) NULL,
	PathCoreGGS varchar(50) NULL,
	PathCoreResult varchar(50) NULL,
	PathCoreExtension varchar(50) NULL,
	PathCoreProstatitis varchar(50) NULL,
	PathCorePerineuralInv varchar(50) NULL,
	PathCorePNI_Diam varchar(50) NULL,
	PathCoreHG_PIN varchar(50) NULL,
	PathCoreType varchar(50) NULL,
	PathCoreCapsule varchar(50) NULL,
	PathCoreFat varchar(50) NULL,
	PathCoreASAP varchar(50) NULL,
	PathCoreAtrophy varchar(50) NULL,
	PathCoreStroma varchar(50) NULL,
	PathCoreNotes varchar(1000) NULL,
	EnteredBy varchar(50) NOT NULL,
	EnteredTime datetime NOT NULL,
	UpdatedBy varchar(50) NULL,
	UpdatedTime datetime NULL
	)  ON [PRIMARY]
GO
SET IDENTITY_INSERT dbo.Tmp_ProstateBiopsyCorePath ON
GO
IF EXISTS(SELECT * FROM dbo.ProstateBiopsyCorePath)
	 EXEC('INSERT INTO dbo.Tmp_ProstateBiopsyCorePath (PathologyId, ProstateBiopsyCorePathId, PathCoreSide, PathCoreLevel, PathCoreLaterality, PathCoreZone, PathCoreNumCores, PathCoreNumFragments, PathCoreLength, PathCorePercCancer, PathCoreMaxCancerLength, PathCoreCancerLength, PathCorePercHG_Cancer, PathCoreHG_Length, PathCoreGG1, PathCoreGG2, PathCoreGG3, PathCoreGGS, PathCoreResult, PathCoreExtension, PathCoreProstatitis, PathCorePerineuralInv, PathCorePNI_Diam, PathCoreHG_PIN, PathCoreType, PathCoreCapsule, PathCoreFat, PathCoreASAP, PathCoreAtrophy, PathCoreStroma, PathCoreNotes, EnteredBy, EnteredTime, UpdatedBy, UpdatedTime)
		SELECT PathologyId, ProstateBiopsyCorePathId, PathCoreSide, PathCoreLevel, PathCoreLaterality, PathCoreZone, PathCoreNumCores, PathCoreNumFragments, PathCoreLength, PathCorePercCancer, PathCoreMaxCancerLength, PathCoreCancerLength, PathCorePercHG_Cancer, PathCoreHG_Length, PathCoreGG1, PathCoreGG2, PathCoreGG3, PathCoreGGS, PathCoreResult, PathCoreExtension, PathCoreProstatitis, PathCorePerineuralInv, PathCorePNI_Diam, PathCoreHG_PIN, PathCoreType, PathCoreCapsule, PathCoreFat, PathCoreASAP, PathCoreAtrophy, PathCoreStroma, PathCoreNotes, EnteredBy, EnteredTime, UpdatedBy, UpdatedTime FROM dbo.ProstateBiopsyCorePath WITH (HOLDLOCK TABLOCKX)')
GO
SET IDENTITY_INSERT dbo.Tmp_ProstateBiopsyCorePath OFF
GO
DROP TABLE dbo.ProstateBiopsyCorePath
GO
EXECUTE sp_rename N'dbo.Tmp_ProstateBiopsyCorePath', N'ProstateBiopsyCorePath', 'OBJECT' 
GO
ALTER TABLE dbo.ProstateBiopsyCorePath ADD CONSTRAINT
	PK_ProstateBiopsyCorePath PRIMARY KEY CLUSTERED 
	(
	ProstateBiopsyCorePathId
	) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

GO
ALTER TABLE dbo.ProstateBiopsyCorePath WITH NOCHECK ADD CONSTRAINT
	FK_ProstateBiopsyCorePath_Pathology FOREIGN KEY
	(
	PathologyId
	) REFERENCES dbo.Pathology
	(
	PathologyId
	) ON UPDATE  CASCADE 
	 ON DELETE  CASCADE 
	
GO
CREATE TRIGGER dbo.trgAuditProstateBiopsyCorePath_UD
ON dbo.ProstateBiopsyCorePath FOR UPDATE, DELETE
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
   INSERT INTO AuditLog_ProstateBiopsyCorePath
   SELECT @action AS LoggedOperation, Inserted.UpdatedBy AS LoggedBy, 
          GETDATE() AS LoggedTime, Deleted.*
   FROM Deleted INNER JOIN INSERTED
   ON Deleted.ProstateBiopsyCorePathId = Inserted.ProstateBiopsyCorePathId
ELSE IF @action = 'DELETE'
   INSERT INTO AuditLog_ProstateBiopsyCorePath
   SELECT @action AS LoggedOperation, SYSTEM_USER AS LoggedBy, GETDATE() AS LoggedTime, *
   FROM Deleted
GO
COMMIT
GO
