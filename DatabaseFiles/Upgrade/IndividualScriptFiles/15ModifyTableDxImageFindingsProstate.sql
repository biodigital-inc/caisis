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
CREATE TABLE dbo.Tmp_AuditLog_DxImageFindingsProstate
	(
	LoggedOperation varchar(50) NULL,
	LoggedBy varchar(50) NULL,
	LoggedTime datetime NULL,
	DiagnosticId int NULL,
	DxImageFindingProstateId int NULL,
	ImgFindSide varchar(50) NULL,
	ImgFindLevel varchar(50) NULL,
	ImgFindAP varchar(50) NULL,
	ImgFindZone varchar(50) NULL,
	ImgFindHeight varchar(50) NULL,
	ImgFindWidth varchar(50) NULL,
	ImgFindLength varchar(50) NULL,
	ImgFindResult varchar(50) NULL,
	ImgFindExtension varchar(50) NULL,
	ImgFindLaterality varchar(50) NULL,
	ImgNotes varchar(1000) NULL,
	EnteredBy varchar(50) NULL,
	EnteredTime datetime NULL,
	UpdatedBy varchar(50) NULL,
	UpdatedTime datetime NULL
	)  ON [PRIMARY]
GO
IF EXISTS(SELECT * FROM dbo.AuditLog_DxImageFindingsProstate)
	 EXEC('INSERT INTO dbo.Tmp_AuditLog_DxImageFindingsProstate (LoggedOperation, LoggedBy, LoggedTime, DiagnosticId, DxImageFindingProstateId, ImgFindSide, ImgFindLevel, ImgFindAP, ImgFindZone, ImgFindHeight, ImgFindWidth, ImgFindLength, ImgFindResult, ImgFindExtension, ImgNotes, EnteredBy, EnteredTime, UpdatedBy, UpdatedTime)
		SELECT LoggedOperation, LoggedBy, LoggedTime, DiagnosticId, DxImageFindingProstateId, ImgFindSide, ImgFindLevel, ImgFindAP, ImgFindZone, ImgFindHeight, ImgFindWidth, ImgFindLength, ImgFindResult, ImgFindExtension, ImgNotes, EnteredBy, EnteredTime, UpdatedBy, UpdatedTime FROM dbo.AuditLog_DxImageFindingsProstate WITH (HOLDLOCK TABLOCKX)')
GO
DROP TABLE dbo.AuditLog_DxImageFindingsProstate
GO
EXECUTE sp_rename N'dbo.Tmp_AuditLog_DxImageFindingsProstate', N'AuditLog_DxImageFindingsProstate', 'OBJECT' 
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
ALTER TABLE dbo.DxImageFindingsProstate
	DROP CONSTRAINT FK_DxImageFindingsProstate_Diagnostics
GO
COMMIT
BEGIN TRANSACTION
GO
CREATE TABLE dbo.Tmp_DxImageFindingsProstate
	(
	DiagnosticId int NOT NULL,
	DxImageFindingProstateId int NOT NULL IDENTITY (1, 1),
	ImgFindSide varchar(50) NULL,
	ImgFindLevel varchar(50) NULL,
	ImgFindAP varchar(50) NULL,
	ImgFindZone varchar(50) NULL,
	ImgFindHeight varchar(50) NULL,
	ImgFindWidth varchar(50) NULL,
	ImgFindLength varchar(50) NULL,
	ImgFindResult varchar(50) NULL,
	ImgFindExtension varchar(50) NULL,
	ImgFindLaterality varchar(50) NULL,
	ImgNotes varchar(1000) NULL,
	EnteredBy varchar(50) NOT NULL,
	EnteredTime datetime NOT NULL,
	UpdatedBy varchar(50) NULL,
	UpdatedTime datetime NULL
	)  ON [PRIMARY]
GO
SET IDENTITY_INSERT dbo.Tmp_DxImageFindingsProstate ON
GO
IF EXISTS(SELECT * FROM dbo.DxImageFindingsProstate)
	 EXEC('INSERT INTO dbo.Tmp_DxImageFindingsProstate (DiagnosticId, DxImageFindingProstateId, ImgFindSide, ImgFindLevel, ImgFindAP, ImgFindZone, ImgFindHeight, ImgFindWidth, ImgFindLength, ImgFindResult, ImgFindExtension, ImgNotes, EnteredBy, EnteredTime, UpdatedBy, UpdatedTime)
		SELECT DiagnosticId, DxImageFindingProstateId, ImgFindSide, ImgFindLevel, ImgFindAP, ImgFindZone, ImgFindHeight, ImgFindWidth, ImgFindLength, ImgFindResult, ImgFindExtension, ImgNotes, EnteredBy, EnteredTime, UpdatedBy, UpdatedTime FROM dbo.DxImageFindingsProstate WITH (HOLDLOCK TABLOCKX)')
GO
SET IDENTITY_INSERT dbo.Tmp_DxImageFindingsProstate OFF
GO
DROP TABLE dbo.DxImageFindingsProstate
GO
EXECUTE sp_rename N'dbo.Tmp_DxImageFindingsProstate', N'DxImageFindingsProstate', 'OBJECT' 
GO
ALTER TABLE dbo.DxImageFindingsProstate ADD CONSTRAINT
	PK_DxImageFindingsProstate PRIMARY KEY CLUSTERED 
	(
	DxImageFindingProstateId
	) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

GO
CREATE NONCLUSTERED INDEX I_DxImageFindingsProstate_DiagnosticId ON dbo.DxImageFindingsProstate
	(
	DiagnosticId
	) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE dbo.DxImageFindingsProstate WITH NOCHECK ADD CONSTRAINT
	FK_DxImageFindingsProstate_Diagnostics FOREIGN KEY
	(
	DiagnosticId
	) REFERENCES dbo.Diagnostics
	(
	DiagnosticId
	) ON UPDATE  CASCADE 
	 ON DELETE  CASCADE 
	
GO
CREATE TRIGGER dbo.trgAuditDxImageFindingsProstate_UD
ON dbo.DxImageFindingsProstate FOR UPDATE, DELETE
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
   INSERT INTO AuditLog_DxImageFindingsProstate
   SELECT @action AS LoggedOperation, Inserted.UpdatedBy AS LoggedBy, 
          GETDATE() AS LoggedTime, Deleted.*
   FROM Deleted INNER JOIN INSERTED
   ON Deleted.DxImageFindingProstateId = Inserted.DxImageFindingProstateId
ELSE IF @action = 'DELETE'
   INSERT INTO AuditLog_DxImageFindingsProstate
   SELECT @action AS LoggedOperation, SYSTEM_USER AS LoggedBy, GETDATE() AS LoggedTime, *
   FROM Deleted
GO
sp_settriggerorder N'trgAuditDxImageFindingsProstate_UD', N'last', N'update'
GO
COMMIT
GO
