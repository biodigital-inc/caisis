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
CREATE TABLE dbo.Tmp_AuditLog_ProstatectomyProc
	(
	LoggedOperation varchar(50) NULL,
	LoggedBy varchar(50) NULL,
	LoggedTime datetime NULL,
	ProcedureId int NULL,
	ProcStageSystem varchar(50) NULL,
	ProcStageT varchar(50) NULL,
	ProcStageN varchar(50) NULL,
	ProcStageM varchar(50) NULL,
	ProcBulldogClamps varchar(50) NULL,
	ProcBladderClosure varchar(50) NULL,
	ProcAccessVessels varchar(50) NULL,
	ProcAV_Preserved varchar(50) NULL,
	ProcPuboprostatics varchar(50) NULL,
	ProcR_AV_Site varchar(50) NULL,
	ProcR_AV_Diam varchar(50) NULL,
	ProcL_AV_Site varchar(50) NULL,
	ProcL_AV_Diam varchar(50) NULL,
	ProcR_DopplerStatus varchar(50) NULL,
	ProcR_DopplerVA varchar(50) NULL,
	ProcL_DopplerStatus varchar(50) NULL,
	ProcL_DopplerVA varchar(50) NULL,
	ProcL_NVB_DissectionType varchar(50) NULL,
	ProcL_NVB_Status varchar(50) NULL,
	ProcL_NVB_Graft varchar(50) NULL,
	ProcL_NVB_Donor varchar(50) NULL,
	ProcL_NVB_Quality varchar(50) NULL,
	ProcR_NVB_DissectionType varchar(50) NULL,
	ProcR_NVB_Status varchar(50) NULL,
	ProcR_NVB_Graft varchar(50) NULL,
	ProcR_NVB_Donor varchar(50) NULL,
	ProcR_NVB_Quality varchar(50) NULL,
	ProcAnastQuality varchar(50) NULL,
	ProcAnastNumSutures varchar(50) NULL,
	ProcAnastSuturePattern varchar(50) NULL,
	ProcAnastSutureNotes varchar(255) NULL,
	ProcAnastWatertight varchar(50) NULL,
	ProcBN_Diam varchar(50) NULL,
	ProcBN_DegreeEversion varchar(50) NULL,
	ProcSuspVeinComplex varchar(50) NULL,
	ProcL_Drain varchar(50) NULL,
	ProcR_Drain varchar(50) NULL,
	ProcAnteriorDrain varchar(50) NULL,
	ProcPosteriorDrain varchar(50) NULL,
	ProcCathTraction varchar(50) NULL,
	ProcCathTractionDuration varchar(50) NULL,
	ProcSV_DissectFirst varchar(50) NULL,
	ProcPeriprostaticVeins varchar(50) NULL,
	ProcBladderNeckPreservation varchar(50) NULL,
	ProcUrethralStumpScore varchar(50) NULL,
	ProcPelvisAccessibility varchar(50) NULL,
	ProcSkinIncisionLength varchar(50) NULL,
	ProcFascialIncisionLength varchar(50) NULL,
	ProcMedianLobe varchar(50) NULL,
	ProcUrachalSparing varchar(50) NULL,
	ProcNumSize5Ports varchar(50) NULL,
	ProcNumSize8Ports varchar(50) NULL,
	ProcNumSize10Ports varchar(50) NULL,
	ProcNumSize12Ports varchar(50) NULL,
	ProcMethodOfEntry varchar(50) NULL,
	ProcSkinClosure varchar(50) NULL,
	ProcFascialClosureMethod varchar(50) NULL,
	ProcClosureMaterialsUsed varchar(50) NULL,
	ProcSV_Excision varchar(50) NULL,
	ProcL_SV_Excision varchar(50) NULL,
	ProcR_SV_Excision varchar(50) NULL,
	ProcHypogastric varchar(50) NULL,
	ProcPneumoperPressure varchar(50) NULL,
	ProcFoleyPlacement varchar(50) NULL,
	ProcBladderNeckReconstruction varchar(50) NULL,
	ProcAnteriorFascialSuspension varchar(50) NULL,
	EnteredBy varchar(50) NULL,
	EnteredTime datetime NULL,
	UpdatedBy varchar(50) NULL,
	UpdatedTime datetime NULL
	)  ON [PRIMARY]
GO
IF EXISTS(SELECT * FROM dbo.AuditLog_ProstatectomyProc)
	 EXEC('INSERT INTO dbo.Tmp_AuditLog_ProstatectomyProc (LoggedOperation, LoggedBy, LoggedTime, ProcedureId, ProcStageSystem, ProcStageT, ProcBulldogClamps, ProcBladderClosure, ProcAccessVessels, ProcAV_Preserved, ProcPuboprostatics, ProcR_AV_Site, ProcR_AV_Diam, ProcL_AV_Site, ProcL_AV_Diam, ProcR_DopplerStatus, ProcR_DopplerVA, ProcL_DopplerStatus, ProcL_DopplerVA, ProcL_NVB_DissectionType, ProcL_NVB_Status, ProcL_NVB_Graft, ProcL_NVB_Donor, ProcL_NVB_Quality, ProcR_NVB_DissectionType, ProcR_NVB_Status, ProcR_NVB_Graft, ProcR_NVB_Donor, ProcR_NVB_Quality, ProcAnastQuality, ProcAnastNumSutures, ProcAnastSuturePattern, ProcAnastSutureNotes, ProcAnastWatertight, ProcBN_Diam, ProcBN_DegreeEversion, ProcSuspVeinComplex, ProcL_Drain, ProcR_Drain, ProcAnteriorDrain, ProcPosteriorDrain, ProcCathTraction, ProcCathTractionDuration, ProcSV_DissectFirst, ProcPeriprostaticVeins, ProcBladderNeckPreservation, ProcUrethralStumpScore, ProcPelvisAccessibility, ProcSkinIncisionLength, ProcFascialIncisionLength, ProcMedianLobe, ProcUrachalSparing, ProcNumSize5Ports, ProcNumSize8Ports, ProcNumSize10Ports, ProcNumSize12Ports, ProcMethodOfEntry, ProcSkinClosure, ProcFascialClosureMethod, ProcClosureMaterialsUsed, ProcSV_Excision, ProcL_SV_Excision, ProcR_SV_Excision, ProcHypogastric, ProcPneumoperPressure, ProcFoleyPlacement, ProcBladderNeckReconstruction, ProcAnteriorFascialSuspension, EnteredBy, EnteredTime, UpdatedBy, UpdatedTime)
		SELECT LoggedOperation, LoggedBy, LoggedTime, ProcedureId, ProcStageSystem, ProcStageT, ProcBulldogClamps, ProcBladderClosure, ProcAccessVessels, ProcAV_Preserved, ProcPuboprostatics, ProcR_AV_Site, ProcR_AV_Diam, ProcL_AV_Site, ProcL_AV_Diam, ProcR_DopplerStatus, ProcR_DopplerVA, ProcL_DopplerStatus, ProcL_DopplerVA, ProcL_NVB_DissectionType, ProcL_NVB_Status, ProcL_NVB_Graft, ProcL_NVB_Donor, ProcL_NVB_Quality, ProcR_NVB_DissectionType, ProcR_NVB_Status, ProcR_NVB_Graft, ProcR_NVB_Donor, ProcR_NVB_Quality, ProcAnastQuality, ProcAnastNumSutures, ProcAnastSuturePattern, ProcAnastSutureNotes, ProcAnastWatertight, ProcBN_Diam, ProcBN_DegreeEversion, ProcSuspVeinComplex, ProcL_Drain, ProcR_Drain, ProcAnteriorDrain, ProcPosteriorDrain, ProcCathTraction, ProcCathTractionDuration, ProcSV_DissectFirst, ProcPeriprostaticVeins, ProcBladderNeckPreservation, ProcUrethralStumpScore, ProcPelvisAccessibility, ProcSkinIncisionLength, ProcFascialIncisionLength, ProcMedianLobe, ProcUrachalSparing, ProcNumSize5Ports, ProcNumSize8Ports, ProcNumSize10Ports, ProcNumSize12Ports, ProcMethodOfEntry, ProcSkinClosure, ProcFascialClosureMethod, ProcClosureMaterialsUsed, ProcSV_Excision, ProcL_SV_Excision, ProcR_SV_Excision, ProcHypogastric, ProcPneumoperPressure, ProcFoleyPlacement, ProcBladderNeckReconstruction, ProcAnteriorFascialSuspension, EnteredBy, EnteredTime, UpdatedBy, UpdatedTime FROM dbo.AuditLog_ProstatectomyProc WITH (HOLDLOCK TABLOCKX)')
GO
DROP TABLE dbo.AuditLog_ProstatectomyProc
GO
EXECUTE sp_rename N'dbo.Tmp_AuditLog_ProstatectomyProc', N'AuditLog_ProstatectomyProc', 'OBJECT' 
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
ALTER TABLE dbo.ProstatectomyProc
	DROP CONSTRAINT FK_ProstatectomyProc_Procedures
GO
COMMIT
BEGIN TRANSACTION
GO
CREATE TABLE dbo.Tmp_ProstatectomyProc
	(
	ProcedureId int NOT NULL,
	ProcStageSystem varchar(50) NULL,
	ProcStageT varchar(50) NULL,
	ProcStageN varchar(50) NULL,
	ProcStageM varchar(50) NULL,
	ProcBulldogClamps varchar(50) NULL,
	ProcBladderClosure varchar(50) NULL,
	ProcAccessVessels varchar(50) NULL,
	ProcAV_Preserved varchar(50) NULL,
	ProcPuboprostatics varchar(50) NULL,
	ProcR_AV_Site varchar(50) NULL,
	ProcR_AV_Diam varchar(50) NULL,
	ProcL_AV_Site varchar(50) NULL,
	ProcL_AV_Diam varchar(50) NULL,
	ProcR_DopplerStatus varchar(50) NULL,
	ProcR_DopplerVA varchar(50) NULL,
	ProcL_DopplerStatus varchar(50) NULL,
	ProcL_DopplerVA varchar(50) NULL,
	ProcL_NVB_DissectionType varchar(50) NULL,
	ProcL_NVB_Status varchar(50) NULL,
	ProcL_NVB_Graft varchar(50) NULL,
	ProcL_NVB_Donor varchar(50) NULL,
	ProcL_NVB_Quality varchar(50) NULL,
	ProcR_NVB_DissectionType varchar(50) NULL,
	ProcR_NVB_Status varchar(50) NULL,
	ProcR_NVB_Graft varchar(50) NULL,
	ProcR_NVB_Donor varchar(50) NULL,
	ProcR_NVB_Quality varchar(50) NULL,
	ProcAnastQuality varchar(50) NULL,
	ProcAnastNumSutures varchar(50) NULL,
	ProcAnastSuturePattern varchar(50) NULL,
	ProcAnastSutureNotes varchar(255) NULL,
	ProcAnastWatertight varchar(50) NULL,
	ProcBN_Diam varchar(50) NULL,
	ProcBN_DegreeEversion varchar(50) NULL,
	ProcSuspVeinComplex varchar(50) NULL,
	ProcL_Drain varchar(50) NULL,
	ProcR_Drain varchar(50) NULL,
	ProcAnteriorDrain varchar(50) NULL,
	ProcPosteriorDrain varchar(50) NULL,
	ProcCathTraction varchar(50) NULL,
	ProcCathTractionDuration varchar(50) NULL,
	ProcSV_DissectFirst varchar(50) NULL,
	ProcPeriprostaticVeins varchar(50) NULL,
	ProcBladderNeckPreservation varchar(50) NULL,
	ProcUrethralStumpScore varchar(50) NULL,
	ProcPelvisAccessibility varchar(50) NULL,
	ProcSkinIncisionLength varchar(50) NULL,
	ProcFascialIncisionLength varchar(50) NULL,
	ProcMedianLobe varchar(50) NULL,
	ProcUrachalSparing varchar(50) NULL,
	ProcNumSize5Ports varchar(50) NULL,
	ProcNumSize8Ports varchar(50) NULL,
	ProcNumSize10Ports varchar(50) NULL,
	ProcNumSize12Ports varchar(50) NULL,
	ProcMethodOfEntry varchar(50) NULL,
	ProcSkinClosure varchar(50) NULL,
	ProcFascialClosureMethod varchar(50) NULL,
	ProcClosureMaterialsUsed varchar(50) NULL,
	ProcSV_Excision varchar(50) NULL,
	ProcL_SV_Excision varchar(50) NULL,
	ProcR_SV_Excision varchar(50) NULL,
	ProcHypogastric varchar(50) NULL,
	ProcPneumoperPressure varchar(50) NULL,
	ProcFoleyPlacement varchar(50) NULL,
	ProcBladderNeckReconstruction varchar(50) NULL,
	ProcAnteriorFascialSuspension varchar(50) NULL,
	EnteredBy varchar(50) NOT NULL,
	EnteredTime datetime NOT NULL,
	UpdatedBy varchar(50) NULL,
	UpdatedTime datetime NULL
	)  ON [PRIMARY]
GO
IF EXISTS(SELECT * FROM dbo.ProstatectomyProc)
	 EXEC('INSERT INTO dbo.Tmp_ProstatectomyProc (ProcedureId, ProcStageSystem, ProcStageT, ProcBulldogClamps, ProcBladderClosure, ProcAccessVessels, ProcAV_Preserved, ProcPuboprostatics, ProcR_AV_Site, ProcR_AV_Diam, ProcL_AV_Site, ProcL_AV_Diam, ProcR_DopplerStatus, ProcR_DopplerVA, ProcL_DopplerStatus, ProcL_DopplerVA, ProcL_NVB_DissectionType, ProcL_NVB_Status, ProcL_NVB_Graft, ProcL_NVB_Donor, ProcL_NVB_Quality, ProcR_NVB_DissectionType, ProcR_NVB_Status, ProcR_NVB_Graft, ProcR_NVB_Donor, ProcR_NVB_Quality, ProcAnastQuality, ProcAnastNumSutures, ProcAnastSuturePattern, ProcAnastSutureNotes, ProcAnastWatertight, ProcBN_Diam, ProcBN_DegreeEversion, ProcSuspVeinComplex, ProcL_Drain, ProcR_Drain, ProcAnteriorDrain, ProcPosteriorDrain, ProcCathTraction, ProcCathTractionDuration, ProcSV_DissectFirst, ProcPeriprostaticVeins, ProcBladderNeckPreservation, ProcUrethralStumpScore, ProcPelvisAccessibility, ProcSkinIncisionLength, ProcFascialIncisionLength, ProcMedianLobe, ProcUrachalSparing, ProcNumSize5Ports, ProcNumSize8Ports, ProcNumSize10Ports, ProcNumSize12Ports, ProcMethodOfEntry, ProcSkinClosure, ProcFascialClosureMethod, ProcClosureMaterialsUsed, ProcSV_Excision, ProcL_SV_Excision, ProcR_SV_Excision, ProcHypogastric, ProcPneumoperPressure, ProcFoleyPlacement, ProcBladderNeckReconstruction, ProcAnteriorFascialSuspension, EnteredBy, EnteredTime, UpdatedBy, UpdatedTime)
		SELECT ProcedureId, ProcStageSystem, ProcStageT, ProcBulldogClamps, ProcBladderClosure, ProcAccessVessels, ProcAV_Preserved, ProcPuboprostatics, ProcR_AV_Site, ProcR_AV_Diam, ProcL_AV_Site, ProcL_AV_Diam, ProcR_DopplerStatus, ProcR_DopplerVA, ProcL_DopplerStatus, ProcL_DopplerVA, ProcL_NVB_DissectionType, ProcL_NVB_Status, ProcL_NVB_Graft, ProcL_NVB_Donor, ProcL_NVB_Quality, ProcR_NVB_DissectionType, ProcR_NVB_Status, ProcR_NVB_Graft, ProcR_NVB_Donor, ProcR_NVB_Quality, ProcAnastQuality, ProcAnastNumSutures, ProcAnastSuturePattern, ProcAnastSutureNotes, ProcAnastWatertight, ProcBN_Diam, ProcBN_DegreeEversion, ProcSuspVeinComplex, ProcL_Drain, ProcR_Drain, ProcAnteriorDrain, ProcPosteriorDrain, ProcCathTraction, ProcCathTractionDuration, ProcSV_DissectFirst, ProcPeriprostaticVeins, ProcBladderNeckPreservation, ProcUrethralStumpScore, ProcPelvisAccessibility, ProcSkinIncisionLength, ProcFascialIncisionLength, ProcMedianLobe, ProcUrachalSparing, ProcNumSize5Ports, ProcNumSize8Ports, ProcNumSize10Ports, ProcNumSize12Ports, ProcMethodOfEntry, ProcSkinClosure, ProcFascialClosureMethod, ProcClosureMaterialsUsed, ProcSV_Excision, ProcL_SV_Excision, ProcR_SV_Excision, ProcHypogastric, ProcPneumoperPressure, ProcFoleyPlacement, ProcBladderNeckReconstruction, ProcAnteriorFascialSuspension, EnteredBy, EnteredTime, UpdatedBy, UpdatedTime FROM dbo.ProstatectomyProc WITH (HOLDLOCK TABLOCKX)')
GO
DROP TABLE dbo.ProstatectomyProc
GO
EXECUTE sp_rename N'dbo.Tmp_ProstatectomyProc', N'ProstatectomyProc', 'OBJECT' 
GO
ALTER TABLE dbo.ProstatectomyProc ADD CONSTRAINT
	PK_ProstatectomyProc PRIMARY KEY CLUSTERED 
	(
	ProcedureId
	) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

GO
ALTER TABLE dbo.ProstatectomyProc WITH NOCHECK ADD CONSTRAINT
	FK_ProstatectomyProc_Procedures FOREIGN KEY
	(
	ProcedureId
	) REFERENCES dbo.Procedures
	(
	ProcedureId
	) ON UPDATE  CASCADE 
	 ON DELETE  CASCADE 
	
GO
CREATE TRIGGER dbo.trgAuditProstatectomyProc_UD
ON dbo.ProstatectomyProc FOR UPDATE, DELETE
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
   INSERT INTO AuditLog_ProstatectomyProc
   SELECT @action AS LoggedOperation, Inserted.UpdatedBy AS LoggedBy, 
          GETDATE() AS LoggedTime, Deleted.*
   FROM Deleted INNER JOIN INSERTED
   ON Deleted.ProcedureId = Inserted.ProcedureId
ELSE IF @action = 'DELETE'
   INSERT INTO AuditLog_ProstatectomyProc
   SELECT @action AS LoggedOperation, SYSTEM_USER AS LoggedBy, GETDATE() AS LoggedTime, *
   FROM Deleted
GO
COMMIT
GO
