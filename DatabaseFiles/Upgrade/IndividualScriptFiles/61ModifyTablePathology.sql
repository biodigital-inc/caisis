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
CREATE TABLE dbo.Tmp_AuditLog_Pathology
	(
	LoggedOperation varchar(50) NULL,
	LoggedBy varchar(50) NULL,
	LoggedTime datetime NULL,
	PatientId int NULL,
	OperatingRoomDetailId int NULL,
	ProcedureId int NULL,
	PathologyId int NULL,
	PathDateText varchar(50) NULL,
	PathDate datetime NULL,
	PathInstitution varchar(50) NULL,
	PathLaboratory varchar(50) NULL,
	PathSpecimenType varchar(50) NULL,
	PathSpecimenCollection varchar(50) NULL,
	PathSite varchar(50) NULL,
	PathSubsite varchar(50) NULL,
	PathSide varchar(50) NULL,
	PathNum varchar(50) NULL,
	PathHistology varchar(255) NULL,
	PathHistology2 varchar(255) NULL,
	PathResult varchar(50) NULL,
	Pathologist varchar(50) NULL,
	PathLymphaticInv varchar(50) NULL,
	PathVascularInv varchar(50) NULL,
	PathPerineuralInv varchar(50) NULL,
	PathDisease varchar(50) NULL,
	PathNotes varchar(8000) NULL,
	PathDataSource varchar(100) NULL,
	PathQuality varchar(50) NULL,
	EnteredBy varchar(50) NULL,
	EnteredTime datetime NULL,
	UpdatedBy varchar(50) NULL,
	UpdatedTime datetime NULL,
	LockedBy varchar(50) NULL,
	LockedTime datetime NULL
	)  ON [PRIMARY]
GO
ALTER TABLE dbo.Tmp_AuditLog_Pathology SET (LOCK_ESCALATION = TABLE)
GO
IF EXISTS(SELECT * FROM dbo.AuditLog_Pathology)
	 EXEC('INSERT INTO dbo.Tmp_AuditLog_Pathology (LoggedOperation, LoggedBy, LoggedTime, PatientId, OperatingRoomDetailId, ProcedureId, PathologyId, PathDateText, PathDate, PathInstitution, PathLaboratory, PathSpecimenType, PathSpecimenCollection, PathSite, PathSubsite, PathSide, PathNum, PathHistology, PathHistology2, PathResult, Pathologist, PathLymphaticInv, PathVascularInv, PathPerineuralInv, PathNotes, PathDataSource, PathQuality, EnteredBy, EnteredTime, UpdatedBy, UpdatedTime, LockedBy, LockedTime)
		SELECT LoggedOperation, LoggedBy, LoggedTime, PatientId, OperatingRoomDetailId, ProcedureId, PathologyId, PathDateText, PathDate, PathInstitution, PathLaboratory, PathSpecimenType, PathSpecimenCollection, PathSite, PathSubsite, PathSide, PathNum, PathHistology, PathHistology2, PathResult, Pathologist, PathLymphaticInv, PathVascularInv, PathPerineuralInv, PathNotes, PathDataSource, PathQuality, EnteredBy, EnteredTime, UpdatedBy, UpdatedTime, LockedBy, LockedTime FROM dbo.AuditLog_Pathology WITH (HOLDLOCK TABLOCKX)')
GO
DROP TABLE dbo.AuditLog_Pathology
GO
EXECUTE sp_rename N'dbo.Tmp_AuditLog_Pathology', N'AuditLog_Pathology', 'OBJECT' 
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
ALTER TABLE dbo.Pathology
	DROP CONSTRAINT FK_Pathology_Patients
GO
ALTER TABLE dbo.Patients SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
BEGIN TRANSACTION
GO
CREATE TABLE dbo.Tmp_Pathology
	(
	PatientId int NOT NULL,
	OperatingRoomDetailId int NULL,
	ProcedureId int NULL,
	PathologyId int NOT NULL IDENTITY (1, 1),
	PathDateText varchar(50) NULL,
	PathDate datetime NULL,
	PathInstitution varchar(50) NULL,
	PathLaboratory varchar(50) NULL,
	PathSpecimenType varchar(50) NULL,
	PathSpecimenCollection varchar(50) NULL,
	PathSite varchar(50) NULL,
	PathSubsite varchar(50) NULL,
	PathSide varchar(50) NULL,
	PathNum varchar(50) NULL,
	PathHistology varchar(255) NULL,
	PathHistology2 varchar(255) NULL,
	PathResult varchar(50) NULL,
	Pathologist varchar(50) NULL,
	PathLymphaticInv varchar(50) NULL,
	PathVascularInv varchar(50) NULL,
	PathPerineuralInv varchar(50) NULL,
	PathDisease varchar(50) NULL,
	PathNotes varchar(8000) NULL,
	PathDataSource varchar(100) NULL,
	PathQuality varchar(50) NULL,
	EnteredBy varchar(50) NOT NULL,
	EnteredTime datetime NOT NULL,
	UpdatedBy varchar(50) NULL,
	UpdatedTime datetime NULL,
	LockedBy varchar(50) NULL,
	LockedTime datetime NULL
	)  ON [PRIMARY]
GO
ALTER TABLE dbo.Tmp_Pathology SET (LOCK_ESCALATION = TABLE)
GO
SET IDENTITY_INSERT dbo.Tmp_Pathology ON
GO
IF EXISTS(SELECT * FROM dbo.Pathology)
	 EXEC('INSERT INTO dbo.Tmp_Pathology (PatientId, OperatingRoomDetailId, ProcedureId, PathologyId, PathDateText, PathDate, PathInstitution, PathLaboratory, PathSpecimenType, PathSpecimenCollection, PathSite, PathSubsite, PathSide, PathNum, PathHistology, PathHistology2, PathResult, Pathologist, PathLymphaticInv, PathVascularInv, PathPerineuralInv, PathNotes, PathDataSource, PathQuality, EnteredBy, EnteredTime, UpdatedBy, UpdatedTime, LockedBy, LockedTime)
		SELECT PatientId, OperatingRoomDetailId, ProcedureId, PathologyId, PathDateText, PathDate, PathInstitution, PathLaboratory, PathSpecimenType, PathSpecimenCollection, PathSite, PathSubsite, PathSide, PathNum, PathHistology, PathHistology2, PathResult, Pathologist, PathLymphaticInv, PathVascularInv, PathPerineuralInv, PathNotes, PathDataSource, PathQuality, EnteredBy, EnteredTime, UpdatedBy, UpdatedTime, LockedBy, LockedTime FROM dbo.Pathology WITH (HOLDLOCK TABLOCKX)')
GO
SET IDENTITY_INSERT dbo.Tmp_Pathology OFF
GO
ALTER TABLE dbo.CystectomyPath
	DROP CONSTRAINT FK_CystectomyPath_Pathology
GO
ALTER TABLE dbo.ThyroidPath
	DROP CONSTRAINT FK_ThyroidPath_Pathology
GO
ALTER TABLE dbo.ProstatectomyPathFinding
	DROP CONSTRAINT FK_ProstatectomyPathFinding_Pathology
GO
ALTER TABLE dbo.PathologyStageGrade
	DROP CONSTRAINT FK_PathologyStageGrade_Pathology
GO
ALTER TABLE dbo.CystoscopyPathFinding
	DROP CONSTRAINT FK_CystoscopyPathFinding_Pathology
GO
ALTER TABLE dbo.PancreasPath
	DROP CONSTRAINT FK_PancreasPath_Pathology
GO
ALTER TABLE dbo.PathologyFinding
	DROP CONSTRAINT FK_PathologyFinding_Pathology
GO
ALTER TABLE dbo.ProstateBiopsyCorePath
	DROP CONSTRAINT FK_ProstateBiopsyCorePath_Pathology
GO
ALTER TABLE dbo.NodePathFinding
	DROP CONSTRAINT FK_NodePathFinding_Pathology
GO
ALTER TABLE dbo.LiverPath
	DROP CONSTRAINT FK_LiverPath_Pathology
GO
ALTER TABLE dbo.BiopsyPath
	DROP CONSTRAINT FK_BiopsyPath_Pathology
GO
ALTER TABLE dbo.CystectomyPathFinding
	DROP CONSTRAINT FK_CystectomyPathFinding_Pathology
GO
ALTER TABLE dbo.CystoscopyPath
	DROP CONSTRAINT FK_CystoscopyPath_Pathology
GO
ALTER TABLE dbo.HeadNeckPath
	DROP CONSTRAINT FK_HeadNeckPath_Pathology
GO
ALTER TABLE dbo.GastricPath
	DROP CONSTRAINT FK_GastricPath_Pathology
GO
ALTER TABLE dbo.NephrectomyPathFinding
	DROP CONSTRAINT FK_NephrectomyPathFinding_Pathology
GO
ALTER TABLE dbo.OrchiectomyPath
	DROP CONSTRAINT FK_OrchiectomyPath_Pathology
GO
ALTER TABLE dbo.PathTest
	DROP CONSTRAINT FK_PathTest_Pathology
GO
ALTER TABLE dbo.PolypectomyPath
	DROP CONSTRAINT FK_PolypectomyPath_Pathology
GO
ALTER TABLE dbo.ProstatectomyPath
	DROP CONSTRAINT FK_ProstatectomyPath_Pathology
GO
ALTER TABLE dbo.ProstatectomyPathSection
	DROP CONSTRAINT FK_ProstatectomyPathSection_Pathology
GO
ALTER TABLE dbo.ProstateBiopsyPath
	DROP CONSTRAINT FK_ProstateBiopsyPath_Pathology
GO
ALTER TABLE dbo.BreastPathFinding
	DROP CONSTRAINT FK_BreastPathFinding_Pathology
GO
ALTER TABLE dbo.ColorectalPath
	DROP CONSTRAINT FK_ColorectalPath_Pathology
GO
ALTER TABLE dbo.LungPath
	DROP CONSTRAINT FK_LungPath_Pathology
GO
ALTER TABLE dbo.BreastPath
	DROP CONSTRAINT FK_BreastPath_Pathology
GO
ALTER TABLE dbo.ColorectalPathFinding
	DROP CONSTRAINT FK_ColorectalPathFinding_Pathology
GO
ALTER TABLE dbo.NephrectomyPath
	DROP CONSTRAINT FK_NephrectomyPath_Pathology
GO
DROP TABLE dbo.Pathology
GO
EXECUTE sp_rename N'dbo.Tmp_Pathology', N'Pathology', 'OBJECT' 
GO
ALTER TABLE dbo.Pathology ADD CONSTRAINT
	PK_Pathology PRIMARY KEY CLUSTERED 
	(
	PathologyId
	) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

GO
CREATE NONCLUSTERED INDEX I_Pathology_PatientId ON dbo.Pathology
	(
	PatientId
	) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE dbo.Pathology WITH NOCHECK ADD CONSTRAINT
	FK_Pathology_Patients FOREIGN KEY
	(
	PatientId
	) REFERENCES dbo.Patients
	(
	PatientId
	) ON UPDATE  CASCADE 
	 ON DELETE  CASCADE 
	 NOT FOR REPLICATION

GO
CREATE TRIGGER dbo.trgAuditPathology_UD
ON dbo.Pathology FOR UPDATE, DELETE
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
   INSERT INTO AuditLog_Pathology
   SELECT @action AS LoggedOperation, Inserted.UpdatedBy AS LoggedBy, 
          GETDATE() AS LoggedTime, Deleted.*
   FROM Deleted INNER JOIN INSERTED
   ON Deleted.PathologyId = Inserted.PathologyId
ELSE IF @action = 'DELETE'
   INSERT INTO AuditLog_Pathology
   SELECT @action AS LoggedOperation, SYSTEM_USER AS LoggedBy, GETDATE() AS LoggedTime, *
   FROM Deleted
GO
COMMIT
BEGIN TRANSACTION
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
ALTER TABLE dbo.NephrectomyPath SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
BEGIN TRANSACTION
GO
ALTER TABLE dbo.ColorectalPathFinding WITH NOCHECK ADD CONSTRAINT
	FK_ColorectalPathFinding_Pathology FOREIGN KEY
	(
	PathologyId
	) REFERENCES dbo.Pathology
	(
	PathologyId
	) ON UPDATE  CASCADE 
	 ON DELETE  CASCADE 
	 NOT FOR REPLICATION

GO
ALTER TABLE dbo.ColorectalPathFinding SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
BEGIN TRANSACTION
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
ALTER TABLE dbo.BreastPath SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
BEGIN TRANSACTION
GO
ALTER TABLE dbo.LungPath WITH NOCHECK ADD CONSTRAINT
	FK_LungPath_Pathology FOREIGN KEY
	(
	PathologyId
	) REFERENCES dbo.Pathology
	(
	PathologyId
	) ON UPDATE  CASCADE 
	 ON DELETE  CASCADE 
	
GO
ALTER TABLE dbo.LungPath SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
BEGIN TRANSACTION
GO
ALTER TABLE dbo.ColorectalPath WITH NOCHECK ADD CONSTRAINT
	FK_ColorectalPath_Pathology FOREIGN KEY
	(
	PathologyId
	) REFERENCES dbo.Pathology
	(
	PathologyId
	) ON UPDATE  CASCADE 
	 ON DELETE  CASCADE 
	 NOT FOR REPLICATION

GO
ALTER TABLE dbo.ColorectalPath SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
BEGIN TRANSACTION
GO
ALTER TABLE dbo.BreastPathFinding WITH NOCHECK ADD CONSTRAINT
	FK_BreastPathFinding_Pathology FOREIGN KEY
	(
	PathologyId
	) REFERENCES dbo.Pathology
	(
	PathologyId
	) ON UPDATE  CASCADE 
	 ON DELETE  CASCADE 
	 NOT FOR REPLICATION

GO
ALTER TABLE dbo.BreastPathFinding SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
BEGIN TRANSACTION
GO
ALTER TABLE dbo.ProstateBiopsyPath WITH NOCHECK ADD CONSTRAINT
	FK_ProstateBiopsyPath_Pathology FOREIGN KEY
	(
	PathologyId
	) REFERENCES dbo.Pathology
	(
	PathologyId
	) ON UPDATE  CASCADE 
	 ON DELETE  CASCADE 
	
GO
ALTER TABLE dbo.ProstateBiopsyPath SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
BEGIN TRANSACTION
GO
ALTER TABLE dbo.ProstatectomyPathSection WITH NOCHECK ADD CONSTRAINT
	FK_ProstatectomyPathSection_Pathology FOREIGN KEY
	(
	PathologyId
	) REFERENCES dbo.Pathology
	(
	PathologyId
	) ON UPDATE  CASCADE 
	 ON DELETE  CASCADE 
	
GO
ALTER TABLE dbo.ProstatectomyPathSection SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
BEGIN TRANSACTION
GO
ALTER TABLE dbo.ProstatectomyPath WITH NOCHECK ADD CONSTRAINT
	FK_ProstatectomyPath_Pathology FOREIGN KEY
	(
	PathologyId
	) REFERENCES dbo.Pathology
	(
	PathologyId
	) ON UPDATE  CASCADE 
	 ON DELETE  CASCADE 
	
GO
ALTER TABLE dbo.ProstatectomyPath SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
BEGIN TRANSACTION
GO
ALTER TABLE dbo.PolypectomyPath WITH NOCHECK ADD CONSTRAINT
	FK_PolypectomyPath_Pathology FOREIGN KEY
	(
	PathologyId
	) REFERENCES dbo.Pathology
	(
	PathologyId
	) ON UPDATE  CASCADE 
	 ON DELETE  CASCADE 
	 NOT FOR REPLICATION

GO
ALTER TABLE dbo.PolypectomyPath SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
BEGIN TRANSACTION
GO
ALTER TABLE dbo.PathTest WITH NOCHECK ADD CONSTRAINT
	FK_PathTest_Pathology FOREIGN KEY
	(
	PathologyId
	) REFERENCES dbo.Pathology
	(
	PathologyId
	) ON UPDATE  CASCADE 
	 ON DELETE  CASCADE 
	 NOT FOR REPLICATION

GO
ALTER TABLE dbo.PathTest SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
BEGIN TRANSACTION
GO
ALTER TABLE dbo.OrchiectomyPath WITH NOCHECK ADD CONSTRAINT
	FK_OrchiectomyPath_Pathology FOREIGN KEY
	(
	PathologyId
	) REFERENCES dbo.Pathology
	(
	PathologyId
	) ON UPDATE  CASCADE 
	 ON DELETE  CASCADE 
	
GO
ALTER TABLE dbo.OrchiectomyPath SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
BEGIN TRANSACTION
GO
ALTER TABLE dbo.NephrectomyPathFinding WITH NOCHECK ADD CONSTRAINT
	FK_NephrectomyPathFinding_Pathology FOREIGN KEY
	(
	PathologyId
	) REFERENCES dbo.Pathology
	(
	PathologyId
	) ON UPDATE  CASCADE 
	 ON DELETE  CASCADE 
	
GO
ALTER TABLE dbo.NephrectomyPathFinding SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
BEGIN TRANSACTION
GO
ALTER TABLE dbo.GastricPath WITH NOCHECK ADD CONSTRAINT
	FK_GastricPath_Pathology FOREIGN KEY
	(
	PathologyId
	) REFERENCES dbo.Pathology
	(
	PathologyId
	) ON UPDATE  CASCADE 
	 ON DELETE  CASCADE 
	 NOT FOR REPLICATION

GO
ALTER TABLE dbo.GastricPath SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
BEGIN TRANSACTION
GO
ALTER TABLE dbo.HeadNeckPath ADD CONSTRAINT
	FK_HeadNeckPath_Pathology FOREIGN KEY
	(
	PathologyId
	) REFERENCES dbo.Pathology
	(
	PathologyId
	) ON UPDATE  CASCADE 
	 ON DELETE  CASCADE 
	
GO
ALTER TABLE dbo.HeadNeckPath SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
BEGIN TRANSACTION
GO
ALTER TABLE dbo.CystoscopyPath WITH NOCHECK ADD CONSTRAINT
	FK_CystoscopyPath_Pathology FOREIGN KEY
	(
	PathologyId
	) REFERENCES dbo.Pathology
	(
	PathologyId
	) ON UPDATE  CASCADE 
	 ON DELETE  CASCADE 
	
GO
ALTER TABLE dbo.CystoscopyPath SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
BEGIN TRANSACTION
GO
ALTER TABLE dbo.CystectomyPathFinding WITH NOCHECK ADD CONSTRAINT
	FK_CystectomyPathFinding_Pathology FOREIGN KEY
	(
	PathologyId
	) REFERENCES dbo.Pathology
	(
	PathologyId
	) ON UPDATE  CASCADE 
	 ON DELETE  CASCADE 
	
GO
ALTER TABLE dbo.CystectomyPathFinding SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
BEGIN TRANSACTION
GO
ALTER TABLE dbo.BiopsyPath WITH NOCHECK ADD CONSTRAINT
	FK_BiopsyPath_Pathology FOREIGN KEY
	(
	PathologyId
	) REFERENCES dbo.Pathology
	(
	PathologyId
	) ON UPDATE  CASCADE 
	 ON DELETE  CASCADE 
	
GO
ALTER TABLE dbo.BiopsyPath SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
BEGIN TRANSACTION
GO
ALTER TABLE dbo.LiverPath WITH NOCHECK ADD CONSTRAINT
	FK_LiverPath_Pathology FOREIGN KEY
	(
	PathologyId
	) REFERENCES dbo.Pathology
	(
	PathologyId
	) ON UPDATE  CASCADE 
	 ON DELETE  CASCADE 
	
GO
ALTER TABLE dbo.LiverPath SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
BEGIN TRANSACTION
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
ALTER TABLE dbo.NodePathFinding SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
BEGIN TRANSACTION
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
ALTER TABLE dbo.ProstateBiopsyCorePath SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
BEGIN TRANSACTION
GO
ALTER TABLE dbo.PathologyFinding WITH NOCHECK ADD CONSTRAINT
	FK_PathologyFinding_Pathology FOREIGN KEY
	(
	PathologyId
	) REFERENCES dbo.Pathology
	(
	PathologyId
	) ON UPDATE  CASCADE 
	 ON DELETE  CASCADE 
	
GO
ALTER TABLE dbo.PathologyFinding SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
BEGIN TRANSACTION
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
ALTER TABLE dbo.PancreasPath SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
BEGIN TRANSACTION
GO
ALTER TABLE dbo.CystoscopyPathFinding WITH NOCHECK ADD CONSTRAINT
	FK_CystoscopyPathFinding_Pathology FOREIGN KEY
	(
	PathologyId
	) REFERENCES dbo.Pathology
	(
	PathologyId
	) ON UPDATE  CASCADE 
	 ON DELETE  CASCADE 
	
GO
ALTER TABLE dbo.CystoscopyPathFinding SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
BEGIN TRANSACTION
GO
ALTER TABLE dbo.PathologyStageGrade WITH NOCHECK ADD CONSTRAINT
	FK_PathologyStageGrade_Pathology FOREIGN KEY
	(
	PathologyId
	) REFERENCES dbo.Pathology
	(
	PathologyId
	) ON UPDATE  CASCADE 
	 ON DELETE  CASCADE 
	
GO
ALTER TABLE dbo.PathologyStageGrade SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
BEGIN TRANSACTION
GO
ALTER TABLE dbo.ProstatectomyPathFinding WITH NOCHECK ADD CONSTRAINT
	FK_ProstatectomyPathFinding_Pathology FOREIGN KEY
	(
	PathologyId
	) REFERENCES dbo.Pathology
	(
	PathologyId
	) ON UPDATE  CASCADE 
	 ON DELETE  CASCADE 
	
GO
ALTER TABLE dbo.ProstatectomyPathFinding SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
BEGIN TRANSACTION
GO
ALTER TABLE dbo.ThyroidPath WITH NOCHECK ADD CONSTRAINT
	FK_ThyroidPath_Pathology FOREIGN KEY
	(
	PathologyId
	) REFERENCES dbo.Pathology
	(
	PathologyId
	) ON UPDATE  CASCADE 
	 ON DELETE  CASCADE 
	 NOT FOR REPLICATION

GO
ALTER TABLE dbo.ThyroidPath SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
BEGIN TRANSACTION
GO
ALTER TABLE dbo.CystectomyPath WITH NOCHECK ADD CONSTRAINT
	FK_CystectomyPath_Pathology FOREIGN KEY
	(
	PathologyId
	) REFERENCES dbo.Pathology
	(
	PathologyId
	) ON UPDATE  CASCADE 
	 ON DELETE  CASCADE 
	
GO
ALTER TABLE dbo.CystectomyPath SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
GO
