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
CREATE TABLE dbo.AuditLog_DentalImplantProc
	(
	LoggedOperation varchar(50) NULL,
	LoggedBy varchar(50) NULL,
	LoggedTime datetime NULL,
	ProcedureId int NULL,
	ProcIntraOralSite varchar(255) NULL,
	ProcExtraoralAuricularSite varchar(255) NULL,
	ProcExtraoralNasalSite varchar(255) NULL,
	ProcExtraoralOrbitalSite varchar(255) NULL,
	ProcNumOfImplant varchar(50) NULL,
	ProcImplantSite varchar(50) NULL,
	ProcImplantBrand varchar(50) NULL,
	ProcImplantType varchar(50) NULL,
	ProcImplantDiameter varchar(50) NULL,
	ProcImplantLength varchar(50) NULL,
	ProcBone varchar(50) NULL,
	ProcBoneDescription varchar(255) NULL,
	ProcBoneClassification varchar(50) NULL,
	ProcProsthesis varchar(50) NULL,
	ProcIntraoralType varchar(50) NULL,
	ProcProsthesisDeliveryDate datetime NULL,
	EnteredBy varchar(50) NULL,
	EnteredTime datetime NULL,
	UpdatedBy varchar(50) NULL,
	UpdatedTime datetime NULL
	)  ON [PRIMARY]
GO
ALTER TABLE dbo.AuditLog_DentalImplantProc SET (LOCK_ESCALATION = TABLE)
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
ALTER TABLE dbo.Procedures SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
BEGIN TRANSACTION
GO
CREATE TABLE dbo.DentalImplantProc
	(
	ProcedureId int NOT NULL,
	ProcIntraOralSite varchar(255) NULL,
	ProcExtraoralAuricularSite varchar(255) NULL,
	ProcExtraoralNasalSite varchar(255) NULL,
	ProcExtraoralOrbitalSite varchar(255) NULL,
	ProcNumOfImplant varchar(50) NULL,
	ProcImplantSite varchar(50) NULL,
	ProcImplantBrand varchar(50) NULL,
	ProcImplantType varchar(50) NULL,
	ProcImplantDiameter varchar(50) NULL,
	ProcImplantLength varchar(50) NULL,
	ProcBone varchar(50) NULL,
	ProcBoneDescription varchar(255) NULL,
	ProcBoneClassification varchar(50) NULL,
	ProcProsthesis varchar(50) NULL,
	ProcIntraoralType varchar(50) NULL,
	ProcProsthesisDeliveryDate datetime NULL,
	EnteredBy varchar(50) NOT NULL,
	EnteredTime datetime NOT NULL,
	UpdatedBy varchar(50) NULL,
	UpdatedTime datetime NULL
	)  ON [PRIMARY]
GO
ALTER TABLE dbo.DentalImplantProc ADD CONSTRAINT
	PK_DentalImplantProc PRIMARY KEY CLUSTERED 
	(
	ProcedureId
	) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

GO
ALTER TABLE dbo.DentalImplantProc ADD CONSTRAINT
	FK_DentalImplantProc_Procedures FOREIGN KEY
	(
	ProcedureId
	) REFERENCES dbo.Procedures
	(
	ProcedureId
	) ON UPDATE  CASCADE 
	 ON DELETE  CASCADE 
GO
ALTER TABLE dbo.DentalImplantProc SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[trgAuditDentalImplantProc_UD]
ON [dbo].[DentalImplantProc] FOR UPDATE, DELETE
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
   INSERT INTO AuditLog_DentalImplantProc
   SELECT @action AS LoggedOperation, Inserted.UpdatedBy AS LoggedBy, 
          GETDATE() AS LoggedTime, Deleted.*
   FROM Deleted INNER JOIN INSERTED
   ON Deleted.ProcedureId = Inserted.ProcedureId
ELSE IF @action = 'DELETE'
   INSERT INTO AuditLog_DentalImplantProc
   SELECT @action AS LoggedOperation, SYSTEM_USER AS LoggedBy, GETDATE() AS LoggedTime, *
   FROM Deleted
GO
EXEC sp_settriggerorder @triggername=N'[dbo].[trgAuditDentalImplantProc_UD]', @order=N'Last', @stmttype=N'UPDATE'
GO