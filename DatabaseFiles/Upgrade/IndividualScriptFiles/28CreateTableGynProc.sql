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
CREATE TABLE dbo.AuditLog_GynProc
	(
	LoggedOperation varchar(50) NULL,
	LoggedBy varchar(50) NULL,
	LoggedTime datetime NULL,
	ProcedureId int NULL,
   ProcDrains varchar(50) NULL,
   ProcLymphNodeMapping varchar(1000) NULL,
   ProcDistensionMedia varchar(50) NULL,
   ProcDistensionMediaInput varchar(50) NULL,
   ProcDistensionMediaOutput varchar(50) NULL,
   ProcEntirePolypRemoved varchar(50) NULL,
   ProcIncisionType varchar(1000) NULL,
   ProcL_InguinalExtent varchar(50) NULL,
   ProcR_InguinalExtent varchar(50) NULL,
   ProcOtherFascialClosureSutureOptions varchar(255) NULL,
   ProcFascialClosureMethod varchar(50) NULL,
   ProcFascialClosureSutureOptions varchar(50) NULL,
   ProcUterusAdnexa varchar(50) NULL,
   ProcPeritonealSurface varchar(50) NULL,
   ProcUpperAbdominal varchar(50) NULL,
   ProcHemostasis varchar(255) NULL,
   ProcHerniaRepairMesh varchar(50) NULL,
   ProcHerniaType varchar(50) NULL,
   ProcHerniaIncisionEvent varchar(50) NULL,
   ProcHeparinSaline_IP_PortTest varchar(50) NULL,
   ProcLocFlosealPlacement varchar(255) NULL,
   ProcLocLymphazurinIntraOpInjection varchar(255) NULL,
   ProcLocOtherMaterialPlacement varchar(255) NULL,
   ProcLocSeprafilmPlacement varchar(255) NULL,
   ProcLeepLoopSize varchar(50) NULL,
   ProcMaterialUsed varchar(50) NULL,
   ProcMethodOfEntry varchar(50) NULL,
   ProcNumPorts varchar(50) NULL,
   ProcPreOpTechnetiumInjection varchar(50) NULL,
   ProcConversionReason varchar(255) NULL,
   ProcResectoscopeUsed varchar(50) NULL,
   ProcL_SaphonousVeinTransect varchar(50) NULL,
   ProcR_SaphonousVeinTransect varchar(50) NULL,
   ProcSharpCurettage varchar(50) NULL,
   ProcSkinClosure varchar(255) NULL,
   ProcSubcutaneousClosureMethod varchar(50) NULL,
   ProcSubcutaneousClosureSuture varchar(255) NULL,
   ProcSuctionCurettage varchar(50) NULL,
   ProcSutureType varchar(50) NULL,
   ProcUltraSoundGuidance varchar(50) NULL,
   ProcUterineManipulatorType varchar(50) NULL,
   ProcUterineManipulator varchar(50) NULL,
   ProcUterusSound varchar(50) NULL,
   ProcLysisOfAdhesionTime varchar(50) NULL,
   ProcVaginalCuffClosureMethod varchar(50) NULL,
   ProcVaginalCuffClosureSuture varchar(255) NULL,
   ProcDenseAdhesionReason varchar(255) NULL,
   ProcFindingNotes varchar(2000) NULL,
   ProcAdditionalProcedureNotes varchar(2000) NULL,
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
CREATE TABLE dbo.GynProc
	(
	ProcedureId int NOT NULL,
   ProcDrains varchar(50) NULL,
   ProcLymphNodeMapping varchar(1000) NULL,
   ProcDistensionMedia varchar(50) NULL,
   ProcDistensionMediaInput varchar(50) NULL,
   ProcDistensionMediaOutput varchar(50) NULL,
   ProcEntirePolypRemoved varchar(50) NULL,
   ProcIncisionType varchar(1000) NULL,
   ProcL_InguinalExtent varchar(50) NULL,
   ProcR_InguinalExtent varchar(50) NULL,
   ProcOtherFascialClosureSutureOptions varchar(255) NULL,
   ProcFascialClosureMethod varchar(50) NULL,
   ProcFascialClosureSutureOptions varchar(50) NULL,
   ProcUterusAdnexa varchar(50) NULL,
   ProcPeritonealSurface varchar(50) NULL,
   ProcUpperAbdominal varchar(50) NULL,
   ProcHemostasis varchar(255) NULL,
   ProcHerniaRepairMesh varchar(50) NULL,
   ProcHerniaType varchar(50) NULL,
   ProcHerniaIncisionEvent varchar(50) NULL,
   ProcHeparinSaline_IP_PortTest varchar(50) NULL,
   ProcLocFlosealPlacement varchar(255) NULL,
   ProcLocLymphazurinIntraOpInjection varchar(255) NULL,
   ProcLocOtherMaterialPlacement varchar(255) NULL,
   ProcLocSeprafilmPlacement varchar(255) NULL,
   ProcLeepLoopSize varchar(50) NULL,
   ProcMaterialUsed varchar(50) NULL,
   ProcMethodOfEntry varchar(50) NULL,
   ProcNumPorts varchar(50) NULL,
   ProcPreOpTechnetiumInjection varchar(50) NULL,
   ProcConversionReason varchar(255) NULL,
   ProcResectoscopeUsed varchar(50) NULL,
   ProcL_SaphonousVeinTransect varchar(50) NULL,
   ProcR_SaphonousVeinTransect varchar(50) NULL,
   ProcSharpCurettage varchar(50) NULL,
   ProcSkinClosure varchar(255) NULL,
   ProcSubcutaneousClosureMethod varchar(50) NULL,
   ProcSubcutaneousClosureSuture varchar(255) NULL,
   ProcSuctionCurettage varchar(50) NULL,
   ProcSutureType varchar(50) NULL,
   ProcUltraSoundGuidance varchar(50) NULL,
   ProcUterineManipulatorType varchar(50) NULL,
   ProcUterineManipulator varchar(50) NULL,
   ProcUterusSound varchar(50) NULL,
   ProcLysisOfAdhesionTime varchar(50) NULL,
   ProcVaginalCuffClosureMethod varchar(50) NULL,
   ProcVaginalCuffClosureSuture varchar(255) NULL,
   ProcDenseAdhesionReason varchar(255) NULL,
   ProcFindingNotes varchar(2000) NULL,
   ProcAdditionalProcedureNotes varchar(2000) NULL,
   EnteredBy varchar(50) NOT NULL,
   EnteredTime datetime NOT NULL,
   UpdatedBy varchar(50) NULL,
   UpdatedTime datetime NULL,
	)  ON [PRIMARY]
GO
ALTER TABLE dbo.GynProc ADD CONSTRAINT
	PK_GynProc PRIMARY KEY CLUSTERED 
	(
	ProcedureId
	) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE dbo.GynProc ADD CONSTRAINT
	FK_GynProc_Procedures FOREIGN KEY
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
CREATE TRIGGER [dbo].[trgAuditGynProc_UD]
ON [dbo].[GynProc] FOR UPDATE, DELETE
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
   INSERT INTO AuditLog_GynProc
   SELECT @action AS LoggedOperation, Inserted.UpdatedBy AS LoggedBy, 
          GETDATE() AS LoggedTime, Deleted.*
   FROM Deleted INNER JOIN INSERTED
   ON Deleted.ProcedureId = Inserted.ProcedureId
ELSE IF @action = 'DELETE'
   INSERT INTO AuditLog_GynProc
   SELECT @action AS LoggedOperation, SYSTEM_USER AS LoggedBy, GETDATE() AS LoggedTime, *
   FROM Deleted
GO
EXEC sp_settriggerorder @triggername=N'[dbo].[trgAuditGynProc_UD]', @order=N'Last', @stmttype=N'UPDATE'
GO
