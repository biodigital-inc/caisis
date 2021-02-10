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
CREATE TABLE dbo.Tmp_AuditLog_Diagnostics
	(
	LoggedOperation varchar(50) NULL,
	LoggedBy varchar(50) NULL,
	LoggedTime datetime NULL,
	PatientId int NULL,
	DiagnosticId int NULL,
	DxPending bit NULL,
	DxDateText varchar(50) NULL,
	DxDate datetime NULL,
	DxType varchar(50) NULL,
	DxDisease varchar(50) NULL,
	DxIndication varchar(50) NULL,
	DxSummary varchar(255) NULL,
	DxSide varchar(50) NULL,
	DxTarget varchar(50) NULL,
	DxSite varchar(50) NULL,
	DxResult varchar(50) NULL,
	DxPhysician varchar(50) NULL,
	DxInstitution varchar(50) NULL,
	ImgReviewed varchar(50) NULL,
	ImgCompared varchar(50) NULL,
	ImgDigitized varchar(50) NULL,
	ImgContrast varchar(50) NULL,
	ImgBaseline varchar(50) NULL,
	DxConfidence varchar(50) NULL,
	DxStatus varchar(50) NULL,
	DxTotalNumTumors varchar(50) NULL,
	DxNumNewTumors varchar(50) NULL,
	DxClinicalSignificance varchar(50) NULL,
	DxNotes varchar(2000) NULL,
	DxDataSource varchar(100) NULL,
	DxQuality varchar(50) NULL,
	EnteredBy varchar(50) NULL,
	EnteredTime datetime NULL,
	UpdatedBy varchar(50) NULL,
	UpdatedTime datetime NULL,
	LockedBy varchar(50) NULL,
	LockedTime datetime NULL
	)  ON [PRIMARY]
GO
ALTER TABLE dbo.Tmp_AuditLog_Diagnostics SET (LOCK_ESCALATION = TABLE)
GO
IF EXISTS(SELECT * FROM dbo.AuditLog_Diagnostics)
	 EXEC('INSERT INTO dbo.Tmp_AuditLog_Diagnostics (LoggedOperation, LoggedBy, LoggedTime, PatientId, DiagnosticId, DxPending, DxDateText, DxDate, DxType, DxDisease, DxIndication, DxSummary, DxSide, DxTarget, DxSite, DxResult, DxPhysician, DxInstitution, ImgReviewed, ImgCompared, ImgDigitized, ImgContrast, ImgBaseline, DxConfidence, DxStatus, DxTotalNumTumors, DxNumNewTumors, DxNotes, DxDataSource, DxQuality, EnteredBy, EnteredTime, UpdatedBy, UpdatedTime, LockedBy, LockedTime)
		SELECT LoggedOperation, LoggedBy, LoggedTime, PatientId, DiagnosticId, DxPending, DxDateText, DxDate, DxType, DxDisease, DxIndication, DxSummary, DxSide, DxTarget, DxSite, DxResult, DxPhysician, DxInstitution, ImgReviewed, ImgCompared, ImgDigitized, ImgContrast, ImgBaseline, DxConfidence, DxStatus, DxTotalNumTumors, DxNumNewTumors, DxNotes, DxDataSource, DxQuality, EnteredBy, EnteredTime, UpdatedBy, UpdatedTime, LockedBy, LockedTime FROM dbo.AuditLog_Diagnostics WITH (HOLDLOCK TABLOCKX)')
GO
DROP TABLE dbo.AuditLog_Diagnostics
GO
EXECUTE sp_rename N'dbo.Tmp_AuditLog_Diagnostics', N'AuditLog_Diagnostics', 'OBJECT' 
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
ALTER TABLE dbo.Diagnostics
	DROP CONSTRAINT FK_Diagnostics_Patients
GO
ALTER TABLE dbo.Patients SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
BEGIN TRANSACTION
GO
ALTER TABLE dbo.Diagnostics
	DROP CONSTRAINT DF_Diagnostics_DxPending
GO
CREATE TABLE dbo.Tmp_Diagnostics
	(
	PatientId int NOT NULL,
	DiagnosticId int NOT NULL IDENTITY (1, 1),
	DxPending bit NULL,
	DxDateText varchar(50) NULL,
	DxDate datetime NULL,
	DxType varchar(50) NOT NULL,
	DxDisease varchar(50) NULL,
	DxIndication varchar(50) NULL,
	DxSummary varchar(255) NULL,
	DxSide varchar(50) NULL,
	DxTarget varchar(50) NULL,
	DxSite varchar(50) NULL,
	DxResult varchar(50) NULL,
	DxPhysician varchar(50) NULL,
	DxInstitution varchar(50) NULL,
	ImgReviewed varchar(50) NULL,
	ImgCompared varchar(50) NULL,
	ImgDigitized varchar(50) NULL,
	ImgContrast varchar(50) NULL,
	ImgBaseline varchar(50) NULL,
	DxConfidence varchar(50) NULL,
	DxStatus varchar(50) NULL,
	DxTotalNumTumors varchar(50) NULL,
	DxNumNewTumors varchar(50) NULL,
	DxClinicalSignificance varchar(50) NULL,
	DxNotes varchar(2000) NULL,
	DxDataSource varchar(100) NULL,
	DxQuality varchar(50) NULL,
	EnteredBy varchar(50) NOT NULL,
	EnteredTime datetime NOT NULL,
	UpdatedBy varchar(50) NULL,
	UpdatedTime datetime NULL,
	LockedBy varchar(50) NULL,
	LockedTime datetime NULL
	)  ON [PRIMARY]
GO
ALTER TABLE dbo.Tmp_Diagnostics SET (LOCK_ESCALATION = TABLE)
GO
ALTER TABLE dbo.Tmp_Diagnostics ADD CONSTRAINT
	DF_Diagnostics_DxPending DEFAULT ((0)) FOR DxPending
GO
SET IDENTITY_INSERT dbo.Tmp_Diagnostics ON
GO
IF EXISTS(SELECT * FROM dbo.Diagnostics)
	 EXEC('INSERT INTO dbo.Tmp_Diagnostics (PatientId, DiagnosticId, DxPending, DxDateText, DxDate, DxType, DxDisease, DxIndication, DxSummary, DxSide, DxTarget, DxSite, DxResult, DxPhysician, DxInstitution, ImgReviewed, ImgCompared, ImgDigitized, ImgContrast, ImgBaseline, DxConfidence, DxStatus, DxTotalNumTumors, DxNumNewTumors, DxNotes, DxDataSource, DxQuality, EnteredBy, EnteredTime, UpdatedBy, UpdatedTime, LockedBy, LockedTime)
		SELECT PatientId, DiagnosticId, DxPending, DxDateText, DxDate, DxType, DxDisease, DxIndication, DxSummary, DxSide, DxTarget, DxSite, DxResult, DxPhysician, DxInstitution, ImgReviewed, ImgCompared, ImgDigitized, ImgContrast, ImgBaseline, DxConfidence, DxStatus, DxTotalNumTumors, DxNumNewTumors, DxNotes, DxDataSource, DxQuality, EnteredBy, EnteredTime, UpdatedBy, UpdatedTime, LockedBy, LockedTime FROM dbo.Diagnostics WITH (HOLDLOCK TABLOCKX)')
GO
SET IDENTITY_INSERT dbo.Tmp_Diagnostics OFF
GO
ALTER TABLE dbo.DxImagePancreas
	DROP CONSTRAINT FK_DxImagePancreas_Diagnostics
GO
ALTER TABLE dbo.DxImageFindingsProstate
	DROP CONSTRAINT FK_DxImageFindingsProstate_Diagnostics
GO
ALTER TABLE dbo.DxImageThyroid
	DROP CONSTRAINT FK_DxImageThyroid_Diagnostics
GO
ALTER TABLE dbo.DxImageEndorectalUltrasound
	DROP CONSTRAINT FK_DxImageEndorectalUltrasound_Diagnostics
GO
ALTER TABLE dbo.DxImageProstate
	DROP CONSTRAINT FK_DxImageProstate_Diagnostics
GO
ALTER TABLE dbo.DxImageThyroidUltrasound
	DROP CONSTRAINT FK_DxImageThyroidUltrasound_Diagnostics
GO
ALTER TABLE dbo.DxPulmonaryTest
	DROP CONSTRAINT FK_DxPulmonaryTest_Diagnostics
GO
ALTER TABLE dbo.DxImageFindings
	DROP CONSTRAINT FK_DxImageFindings_Diagnostics
GO
ALTER TABLE dbo.DxImageFindingsKidney
	DROP CONSTRAINT FK_DxImageFindingsKidney_Diagnostics
GO
DROP TABLE dbo.Diagnostics
GO
EXECUTE sp_rename N'dbo.Tmp_Diagnostics', N'Diagnostics', 'OBJECT' 
GO
ALTER TABLE dbo.Diagnostics ADD CONSTRAINT
	PK_Diagnostics PRIMARY KEY CLUSTERED 
	(
	DiagnosticId
	) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

GO
CREATE NONCLUSTERED INDEX I_Diagnostics_PatientId ON dbo.Diagnostics
	(
	PatientId
	) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE dbo.Diagnostics WITH NOCHECK ADD CONSTRAINT
	FK_Diagnostics_Patients FOREIGN KEY
	(
	PatientId
	) REFERENCES dbo.Patients
	(
	PatientId
	) ON UPDATE  CASCADE 
	 ON DELETE  CASCADE 
	
GO
CREATE TRIGGER dbo.trgAuditDiagnostics_UD
ON dbo.Diagnostics FOR UPDATE, DELETE
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
   INSERT INTO AuditLog_Diagnostics
   SELECT @action AS LoggedOperation, Inserted.UpdatedBy AS LoggedBy, 
          GETDATE() AS LoggedTime, Deleted.*
   FROM Deleted INNER JOIN INSERTED
   ON Deleted.DiagnosticId = Inserted.DiagnosticId
ELSE IF @action = 'DELETE'
   INSERT INTO AuditLog_Diagnostics
   SELECT @action AS LoggedOperation, SYSTEM_USER AS LoggedBy, GETDATE() AS LoggedTime, *
   FROM Deleted
GO
sp_settriggerorder N'trgAuditDiagnostics_UD', N'last', N'update'
GO
COMMIT
BEGIN TRANSACTION
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
ALTER TABLE dbo.DxImageFindingsKidney SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
BEGIN TRANSACTION
GO
ALTER TABLE dbo.DxImageFindings WITH NOCHECK ADD CONSTRAINT
	FK_DxImageFindings_Diagnostics FOREIGN KEY
	(
	DiagnosticId
	) REFERENCES dbo.Diagnostics
	(
	DiagnosticId
	) ON UPDATE  CASCADE 
	 ON DELETE  CASCADE 
	
GO
ALTER TABLE dbo.DxImageFindings SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
BEGIN TRANSACTION
GO
ALTER TABLE dbo.DxPulmonaryTest WITH NOCHECK ADD CONSTRAINT
	FK_DxPulmonaryTest_Diagnostics FOREIGN KEY
	(
	DiagnosticId
	) REFERENCES dbo.Diagnostics
	(
	DiagnosticId
	) ON UPDATE  CASCADE 
	 ON DELETE  CASCADE 
	
GO
ALTER TABLE dbo.DxPulmonaryTest SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
BEGIN TRANSACTION
GO
ALTER TABLE dbo.DxImageThyroidUltrasound WITH NOCHECK ADD CONSTRAINT
	FK_DxImageThyroidUltrasound_Diagnostics FOREIGN KEY
	(
	DiagnosticId
	) REFERENCES dbo.Diagnostics
	(
	DiagnosticId
	) ON UPDATE  CASCADE 
	 ON DELETE  CASCADE 
	 NOT FOR REPLICATION

GO
ALTER TABLE dbo.DxImageThyroidUltrasound SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
BEGIN TRANSACTION
GO
ALTER TABLE dbo.DxImageProstate WITH NOCHECK ADD CONSTRAINT
	FK_DxImageProstate_Diagnostics FOREIGN KEY
	(
	DiagnosticId
	) REFERENCES dbo.Diagnostics
	(
	DiagnosticId
	) ON UPDATE  CASCADE 
	 ON DELETE  CASCADE 
	
GO
ALTER TABLE dbo.DxImageProstate SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
BEGIN TRANSACTION
GO
ALTER TABLE dbo.DxImageEndorectalUltrasound WITH NOCHECK ADD CONSTRAINT
	FK_DxImageEndorectalUltrasound_Diagnostics FOREIGN KEY
	(
	DiagnosticId
	) REFERENCES dbo.Diagnostics
	(
	DiagnosticId
	) ON UPDATE  CASCADE 
	 ON DELETE  CASCADE 
	
GO
ALTER TABLE dbo.DxImageEndorectalUltrasound SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
BEGIN TRANSACTION
GO
ALTER TABLE dbo.DxImageThyroid WITH NOCHECK ADD CONSTRAINT
	FK_DxImageThyroid_Diagnostics FOREIGN KEY
	(
	DiagnosticId
	) REFERENCES dbo.Diagnostics
	(
	DiagnosticId
	) ON UPDATE  CASCADE 
	 ON DELETE  CASCADE 
	 NOT FOR REPLICATION

GO
ALTER TABLE dbo.DxImageThyroid SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
BEGIN TRANSACTION
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
ALTER TABLE dbo.DxImageFindingsProstate SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
BEGIN TRANSACTION
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
ALTER TABLE dbo.DxImagePancreas SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
GO
