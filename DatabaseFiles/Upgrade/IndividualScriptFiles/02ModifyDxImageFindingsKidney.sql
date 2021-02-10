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
CREATE TABLE dbo.Tmp_AuditLog_DxImageFindingsKidney
	(
	LoggedOperation varchar(50) NULL,
	LoggedBy varchar(50) NULL,
	LoggedTime datetime NULL,
	DiagnosticId int NULL,
	DxImageFindingKidneyId int NULL,
	ImgFindSide varchar(50) NULL,
	ImgFindPole varchar(50) NULL,
	ImgFindAP varchar(50) NULL,
	ImgFindSite varchar(50) NULL,
	ImgFindHeight varchar(50) NULL,
	ImgFindWidth varchar(50) NULL,
	ImgFindLength varchar(50) NULL,
	ImgFindResult varchar(50) NULL,
	ImgFindExtension varchar(50) NULL,
	ImgFindRV_Inv varchar(50) NULL,
	ImgFindIVC_Inv varchar(50) NULL,
	ImgFindIVC_WallInv varchar(50) NULL,
	ImgFindTumorType varchar(50) NULL,
	EnteredBy varchar(50) NULL,
	EnteredTime datetime NULL,
	UpdatedBy varchar(50) NULL,
	UpdatedTime datetime NULL
	)  ON [PRIMARY]
GO
IF EXISTS(SELECT * FROM dbo.AuditLog_DxImageFindingsKidney)
	 EXEC('INSERT INTO dbo.Tmp_AuditLog_DxImageFindingsKidney (LoggedOperation, LoggedBy, LoggedTime, DiagnosticId, DxImageFindingKidneyId, ImgFindSide, ImgFindPole, ImgFindAP, ImgFindSite, ImgFindHeight, ImgFindWidth, ImgFindLength, ImgFindResult, ImgFindExtension, ImgFindRV_Inv, ImgFindIVC_Inv, ImgFindIVC_WallInv, EnteredBy, EnteredTime, UpdatedBy, UpdatedTime)
		SELECT LoggedOperation, LoggedBy, LoggedTime, DiagnosticId, DxImageFindingKidneyId, ImgFindSide, ImgFindPole, ImgFindAP, ImgFindSite, ImgFindHeight, ImgFindWidth, ImgFindLength, ImgFindResult, ImgFindExtension, ImgFindRV_Inv, ImgFindIVC_Inv, ImgFindIVC_WallInv, EnteredBy, EnteredTime, UpdatedBy, UpdatedTime FROM dbo.AuditLog_DxImageFindingsKidney WITH (HOLDLOCK TABLOCKX)')
GO
DROP TABLE dbo.AuditLog_DxImageFindingsKidney
GO
EXECUTE sp_rename N'dbo.Tmp_AuditLog_DxImageFindingsKidney', N'AuditLog_DxImageFindingsKidney', 'OBJECT' 
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
ALTER TABLE dbo.DxImageFindingsKidney
	DROP CONSTRAINT FK_DxImageFindingsKidney_Diagnostics
GO
COMMIT
BEGIN TRANSACTION
GO
CREATE TABLE dbo.Tmp_DxImageFindingsKidney
	(
	DiagnosticId int NOT NULL,
	DxImageFindingKidneyId int NOT NULL IDENTITY (1, 1),
	ImgFindSide varchar(50) NULL,
	ImgFindPole varchar(50) NULL,
	ImgFindAP varchar(50) NULL,
	ImgFindSite varchar(50) NULL,
	ImgFindHeight varchar(50) NULL,
	ImgFindWidth varchar(50) NULL,
	ImgFindLength varchar(50) NULL,
	ImgFindResult varchar(50) NULL,
	ImgFindExtension varchar(50) NULL,
	ImgFindRV_Inv varchar(50) NULL,
	ImgFindIVC_Inv varchar(50) NULL,
	ImgFindIVC_WallInv varchar(50) NULL,
	ImgFindTumorType varchar(50) NULL,
	EnteredBy varchar(50) NOT NULL,
	EnteredTime datetime NOT NULL,
	UpdatedBy varchar(50) NULL,
	UpdatedTime datetime NULL
	)  ON [PRIMARY]
GO
SET IDENTITY_INSERT dbo.Tmp_DxImageFindingsKidney ON
GO
IF EXISTS(SELECT * FROM dbo.DxImageFindingsKidney)
	 EXEC('INSERT INTO dbo.Tmp_DxImageFindingsKidney (DiagnosticId, DxImageFindingKidneyId, ImgFindSide, ImgFindPole, ImgFindAP, ImgFindSite, ImgFindHeight, ImgFindWidth, ImgFindLength, ImgFindResult, ImgFindExtension, ImgFindRV_Inv, ImgFindIVC_Inv, ImgFindIVC_WallInv, EnteredBy, EnteredTime, UpdatedBy, UpdatedTime)
		SELECT DiagnosticId, DxImageFindingKidneyId, ImgFindSide, ImgFindPole, ImgFindAP, ImgFindSite, ImgFindHeight, ImgFindWidth, ImgFindLength, ImgFindResult, ImgFindExtension, ImgFindRV_Inv, ImgFindIVC_Inv, ImgFindIVC_WallInv, EnteredBy, EnteredTime, UpdatedBy, UpdatedTime FROM dbo.DxImageFindingsKidney WITH (HOLDLOCK TABLOCKX)')
GO
SET IDENTITY_INSERT dbo.Tmp_DxImageFindingsKidney OFF
GO
DROP TABLE dbo.DxImageFindingsKidney
GO
EXECUTE sp_rename N'dbo.Tmp_DxImageFindingsKidney', N'DxImageFindingsKidney', 'OBJECT' 
GO
ALTER TABLE dbo.DxImageFindingsKidney ADD CONSTRAINT
	PK_DxImageFindingsKidney PRIMARY KEY CLUSTERED 
	(
	DxImageFindingKidneyId
	) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

GO
CREATE NONCLUSTERED INDEX I_DxImageFindingsKidney_DiagnosticId ON dbo.DxImageFindingsKidney
	(
	DiagnosticId
	) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE dbo.DxImageFindingsKidney WITH NOCHECK ADD CONSTRAINT
	FK_DxImageFindingsKidney_Diagnostics FOREIGN KEY
	(
	DiagnosticId
	) REFERENCES dbo.Diagnostics
	(
	DiagnosticId
	) ON UPDATE  CASCADE 
	 ON DELETE  CASCADE 
	
GO
CREATE TRIGGER dbo.trgAuditDxImageFindingsKidney_UD
ON dbo.DxImageFindingsKidney FOR UPDATE, DELETE
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
   INSERT INTO AuditLog_DxImageFindingsKidney
   SELECT @action AS LoggedOperation, Inserted.UpdatedBy AS LoggedBy, 
          GETDATE() AS LoggedTime, Deleted.*
   FROM Deleted INNER JOIN INSERTED
   ON Deleted.DxImageFindingKidneyId = Inserted.DxImageFindingKidneyId
ELSE IF @action = 'DELETE'
   INSERT INTO AuditLog_DxImageFindingsKidney
   SELECT @action AS LoggedOperation, SYSTEM_USER AS LoggedBy, GETDATE() AS LoggedTime, *
   FROM Deleted
GO
sp_settriggerorder N'trgAuditDxImageFindingsKidney_UD', N'last', N'update'
GO
COMMIT
GO
