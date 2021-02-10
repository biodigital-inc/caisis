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
CREATE TABLE dbo.AuditLog_DxImagePancreas
	(
	LoggedOperation varchar(50) NULL,
	LoggedBy varchar(50) NULL,
	LoggedTime datetime NULL,
	DiagnosticId int NULL,
	ImgCystMaxDim varchar(50) NULL,
	ImgMultiplicity varchar(50) NULL,
	ImgMaxMainDuctDiam varchar(50) NULL,
	ImgMaxUncinateDuctDiam varchar(50) NULL,
	ImgSideBranchMouthSize varchar(50) NULL,
	ImgEnhancingNodules varchar(50) NULL,
	ImgEnhancingNoduleSize varchar(50) NULL,
	ImgPancreaticMass varchar(50) NULL,
	ImgThickEnhancingSepta varchar(50) NULL,
	ImgBorders varchar(50) NULL,
	ImgArterialProximityToLesion varchar(50) NULL,
	ImgVenousProximityToLesion varchar(50) NULL,
	ImgCystMorphology varchar(50) NULL,
	ImgCalcifications varchar(50) NULL,
	EnteredBy varchar(50) NULL,
	EnteredTime datetime NULL,
	UpdatedBy varchar(50) NULL,
	UpdatedTime datetime NULL
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
CREATE TABLE dbo.DxImagePancreas
	(
	DiagnosticId int NOT NULL,
	ImgCystMaxDim varchar(50) NULL,
	ImgMultiplicity varchar(50) NULL,
	ImgMaxMainDuctDiam varchar(50) NULL,
	ImgMaxUncinateDuctDiam varchar(50) NULL,
	ImgSideBranchMouthSize varchar(50) NULL,
	ImgEnhancingNodules varchar(50) NULL,
	ImgEnhancingNoduleSize varchar(50) NULL,
	ImgPancreaticMass varchar(50) NULL,
	ImgThickEnhancingSepta varchar(50) NULL,
	ImgBorders varchar(50) NULL,
	ImgArterialProximityToLesion varchar(50) NULL,
	ImgVenousProximityToLesion varchar(50) NULL,
	ImgCystMorphology varchar(50) NULL,
	ImgCalcifications varchar(50) NULL,
	EnteredBy varchar(50) NOT NULL,
	EnteredTime datetime NOT NULL,
	UpdatedBy varchar(50) NULL,
	UpdatedTime datetime NULL
	)  ON [PRIMARY]
GO
ALTER TABLE dbo.DxImagePancreas ADD CONSTRAINT
	PK_DxImagePancreas PRIMARY KEY CLUSTERED 
	(
	DiagnosticId
	) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

GO
ALTER TABLE dbo.DxImagePancreas ADD CONSTRAINT
	FK_DxImagePancreas_Diagnostics FOREIGN KEY
	(
	DiagnosticId
	) REFERENCES dbo.Diagnostics
	(
	DiagnosticId
	) ON UPDATE  CASCADE 
	 ON DELETE  CASCADE
GO
COMMIT
GO
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[trgAuditDxImagePancreas_UD]
ON [dbo].[DxImagePancreas] FOR UPDATE, DELETE
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
   INSERT INTO AuditLog_DxImagePancreas
   SELECT @action AS LoggedOperation, Inserted.UpdatedBy AS LoggedBy, 
          GETDATE() AS LoggedTime, Deleted.*
   FROM Deleted INNER JOIN INSERTED
   ON Deleted.DiagnosticId = Inserted.DiagnosticId
ELSE IF @action = 'DELETE'
   INSERT INTO AuditLog_DxImagePancreas
   SELECT @action AS LoggedOperation, SYSTEM_USER AS LoggedBy, GETDATE() AS LoggedTime, *
   FROM Deleted
GO
EXEC sp_settriggerorder @triggername=N'[dbo].[trgAuditDxImagePancreas_UD]', @order=N'Last', @stmttype=N'UPDATE'
GO
