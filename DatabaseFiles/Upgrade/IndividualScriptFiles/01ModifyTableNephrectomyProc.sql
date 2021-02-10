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
CREATE TABLE dbo.Tmp_AuditLog_NephrectomyProc
	(
	LoggedOperation varchar(50) NULL,
	LoggedBy varchar(50) NULL,
	LoggedTime datetime NULL,
	ProcedureId int NULL,
	ProcPlannedType varchar(50) NULL,
	ProcCaseQuality varchar(50) NULL,
	ProcCompleteResection varchar(50) NULL,
	ProcPartialReason varchar(50) NULL,
	ProcPartialIschemia varchar(50) NULL,
	ProcPartialIceSlush varchar(50) NULL,
	ProcPartialClampStartTime varchar(50) NULL,
	ProcPartialClampStopTime varchar(50) NULL,
	ProcPartialClampDuration varchar(50) NULL,
	ProcPreOpDiagnosis varchar(255) NULL,
	ProcPostOpDiagnosis varchar(255) NULL,
	ProcTumorLocation varchar(255) NULL,
	ProcNumTumors varchar(50) NULL,
	ProcConversionReason varchar(255) NULL,
	ProcExcisionTechnique varchar(50) NULL,
	ProcIntraOpUS varchar(50) NULL,
	ProcIntraOpUS_Lesions varchar(50) NULL,
	ProcIVC_Inv varchar(50) NULL,
	ProcHypothermia varchar(50) NULL,
	ProcRenalHypothermiaType varchar(50) NULL,
	ProcUreteralStent varchar(50) NULL,
	ProcCollectingSystemEntry varchar(50) NULL,
	ProcCollectingSystemRepair varchar(50) NULL,
	ProcRenalVeinClamping varchar(50) NULL,
	ProcNumRenalArteries varchar(50) NULL,
	ProcNumRenalArteriesOccluded varchar(50) NULL,
	ProcSinusFatExtension varchar(50) NULL,
	ProcFrozenSections varchar(50) NULL,
	ProcAddTissue varchar(50) NULL,
	ProcDrains varchar(50) NULL,
	ProcCO2_PressureDuration varchar(50) NULL,
	ProcPercKidneySpared varchar(50) NULL,
	ProcComplication varchar(50) NULL,
	ProcInfusionType varchar(50) NULL,
	ProcInfusionBeforeClamping varchar(50) NULL,
	ProcInfusionToRenalVeinClampingTime varchar(50) NULL,
	ProcInfusionDetails varchar(1000) NULL,
	EnteredBy varchar(50) NULL,
	EnteredTime datetime NULL,
	UpdatedBy varchar(50) NULL,
	UpdatedTime datetime NULL
	)  ON [PRIMARY]
GO
IF EXISTS(SELECT * FROM dbo.AuditLog_NephrectomyProc)
	 EXEC('INSERT INTO dbo.Tmp_AuditLog_NephrectomyProc (LoggedOperation, LoggedBy, LoggedTime, ProcedureId, ProcPlannedType, ProcCaseQuality, ProcCompleteResection, ProcPartialReason, ProcPartialIschemia, ProcPartialIceSlush, ProcPartialClampStartTime, ProcPartialClampStopTime, ProcPartialClampDuration, ProcPreOpDiagnosis, ProcPostOpDiagnosis, ProcTumorLocation, ProcNumTumors, ProcConversionReason, ProcExcisionTechnique, ProcIntraOpUS, ProcIntraOpUS_Lesions, ProcIVC_Inv, ProcHypothermia, ProcRenalHypothermiaType, ProcUreteralStent, ProcCollectingSystemEntry, ProcCollectingSystemRepair, ProcRenalVeinClamping, ProcNumRenalArteries, ProcNumRenalArteriesOccluded, ProcSinusFatExtension, ProcFrozenSections, ProcAddTissue, ProcDrains, ProcCO2_PressureDuration, ProcPercKidneySpared, ProcComplication, EnteredBy, EnteredTime, UpdatedBy, UpdatedTime)
		SELECT LoggedOperation, LoggedBy, LoggedTime, ProcedureId, ProcPlannedType, ProcCaseQuality, ProcCompleteResection, ProcPartialReason, ProcPartialIschemia, ProcPartialIceSlush, ProcPartialClampStartTime, ProcPartialClampStopTime, ProcPartialClampDuration, ProcPreOpDiagnosis, ProcPostOpDiagnosis, ProcTumorLocation, ProcNumTumors, ProcConversionReason, ProcExcisionTechnique, ProcIntraOpUS, ProcIntraOpUS_Lesions, ProcIVC_Inv, ProcHypothermia, ProcRenalHypothermiaType, ProcUreteralStent, ProcCollectingSystemEntry, ProcCollectingSystemRepair, ProcRenalVeinClamping, ProcNumRenalArteries, ProcNumRenalArteriesOccluded, ProcSinusFatExtension, ProcFrozenSections, ProcAddTissue, ProcDrains, ProcCO2_PressureDuration, ProcPercKidneySpared, ProcComplication, EnteredBy, EnteredTime, UpdatedBy, UpdatedTime FROM dbo.AuditLog_NephrectomyProc WITH (HOLDLOCK TABLOCKX)')
GO
DROP TABLE dbo.AuditLog_NephrectomyProc
GO
EXECUTE sp_rename N'dbo.Tmp_AuditLog_NephrectomyProc', N'AuditLog_NephrectomyProc', 'OBJECT' 
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
ALTER TABLE dbo.NephrectomyProc
	DROP CONSTRAINT FK_NephrectomyProc_Procedures
GO
COMMIT
BEGIN TRANSACTION
GO
CREATE TABLE dbo.Tmp_NephrectomyProc
	(
	ProcedureId int NOT NULL,
	ProcPlannedType varchar(50) NULL,
	ProcCaseQuality varchar(50) NULL,
	ProcCompleteResection varchar(50) NULL,
	ProcPartialReason varchar(50) NULL,
	ProcPartialIschemia varchar(50) NULL,
	ProcPartialIceSlush varchar(50) NULL,
	ProcPartialClampStartTime varchar(50) NULL,
	ProcPartialClampStopTime varchar(50) NULL,
	ProcPartialClampDuration varchar(50) NULL,
	ProcPreOpDiagnosis varchar(255) NULL,
	ProcPostOpDiagnosis varchar(255) NULL,
	ProcTumorLocation varchar(255) NULL,
	ProcNumTumors varchar(50) NULL,
	ProcConversionReason varchar(255) NULL,
	ProcExcisionTechnique varchar(50) NULL,
	ProcIntraOpUS varchar(50) NULL,
	ProcIntraOpUS_Lesions varchar(50) NULL,
	ProcIVC_Inv varchar(50) NULL,
	ProcHypothermia varchar(50) NULL,
	ProcRenalHypothermiaType varchar(50) NULL,
	ProcUreteralStent varchar(50) NULL,
	ProcCollectingSystemEntry varchar(50) NULL,
	ProcCollectingSystemRepair varchar(50) NULL,
	ProcRenalVeinClamping varchar(50) NULL,
	ProcNumRenalArteries varchar(50) NULL,
	ProcNumRenalArteriesOccluded varchar(50) NULL,
	ProcSinusFatExtension varchar(50) NULL,
	ProcFrozenSections varchar(50) NULL,
	ProcAddTissue varchar(50) NULL,
	ProcDrains varchar(50) NULL,
	ProcCO2_PressureDuration varchar(50) NULL,
	ProcPercKidneySpared varchar(50) NULL,
	ProcComplication varchar(50) NULL,
	ProcInfusionType varchar(50) NULL,
	ProcInfusionBeforeClamping varchar(50) NULL,
	ProcInfusionToRenalVeinClampingTime varchar(50) NULL,
	ProcInfusionDetails varchar(1000) NULL,
	EnteredBy varchar(50) NOT NULL,
	EnteredTime datetime NOT NULL,
	UpdatedBy varchar(50) NULL,
	UpdatedTime datetime NULL
	)  ON [PRIMARY]
GO
IF EXISTS(SELECT * FROM dbo.NephrectomyProc)
	 EXEC('INSERT INTO dbo.Tmp_NephrectomyProc (ProcedureId, ProcPlannedType, ProcCaseQuality, ProcCompleteResection, ProcPartialReason, ProcPartialIschemia, ProcPartialIceSlush, ProcPartialClampStartTime, ProcPartialClampStopTime, ProcPartialClampDuration, ProcPreOpDiagnosis, ProcPostOpDiagnosis, ProcTumorLocation, ProcNumTumors, ProcConversionReason, ProcExcisionTechnique, ProcIntraOpUS, ProcIntraOpUS_Lesions, ProcIVC_Inv, ProcHypothermia, ProcRenalHypothermiaType, ProcUreteralStent, ProcCollectingSystemEntry, ProcCollectingSystemRepair, ProcRenalVeinClamping, ProcNumRenalArteries, ProcNumRenalArteriesOccluded, ProcSinusFatExtension, ProcFrozenSections, ProcAddTissue, ProcDrains, ProcCO2_PressureDuration, ProcPercKidneySpared, ProcComplication, EnteredBy, EnteredTime, UpdatedBy, UpdatedTime)
		SELECT ProcedureId, ProcPlannedType, ProcCaseQuality, ProcCompleteResection, ProcPartialReason, ProcPartialIschemia, ProcPartialIceSlush, ProcPartialClampStartTime, ProcPartialClampStopTime, ProcPartialClampDuration, ProcPreOpDiagnosis, ProcPostOpDiagnosis, ProcTumorLocation, ProcNumTumors, ProcConversionReason, ProcExcisionTechnique, ProcIntraOpUS, ProcIntraOpUS_Lesions, ProcIVC_Inv, ProcHypothermia, ProcRenalHypothermiaType, ProcUreteralStent, ProcCollectingSystemEntry, ProcCollectingSystemRepair, ProcRenalVeinClamping, ProcNumRenalArteries, ProcNumRenalArteriesOccluded, ProcSinusFatExtension, ProcFrozenSections, ProcAddTissue, ProcDrains, ProcCO2_PressureDuration, ProcPercKidneySpared, ProcComplication, EnteredBy, EnteredTime, UpdatedBy, UpdatedTime FROM dbo.NephrectomyProc WITH (HOLDLOCK TABLOCKX)')
GO
DROP TABLE dbo.NephrectomyProc
GO
EXECUTE sp_rename N'dbo.Tmp_NephrectomyProc', N'NephrectomyProc', 'OBJECT' 
GO
ALTER TABLE dbo.NephrectomyProc ADD CONSTRAINT
	PK_NephrectomyProc PRIMARY KEY CLUSTERED 
	(
	ProcedureId
	) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

GO
ALTER TABLE dbo.NephrectomyProc WITH NOCHECK ADD CONSTRAINT
	FK_NephrectomyProc_Procedures FOREIGN KEY
	(
	ProcedureId
	) REFERENCES dbo.Procedures
	(
	ProcedureId
	) ON UPDATE  CASCADE 
	 ON DELETE  CASCADE 
	
GO
CREATE TRIGGER dbo.trgAuditNephrectomyProc_UD
ON dbo.NephrectomyProc FOR UPDATE, DELETE
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
   INSERT INTO AuditLog_NephrectomyProc
   SELECT @action AS LoggedOperation, Inserted.UpdatedBy AS LoggedBy, 
          GETDATE() AS LoggedTime, Deleted.*
   FROM Deleted INNER JOIN INSERTED
   ON Deleted.ProcedureId = Inserted.ProcedureId
ELSE IF @action = 'DELETE'
   INSERT INTO AuditLog_NephrectomyProc
   SELECT @action AS LoggedOperation, SYSTEM_USER AS LoggedBy, GETDATE() AS LoggedTime, *
   FROM Deleted
GO
COMMIT
GO
