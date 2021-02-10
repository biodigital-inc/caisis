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
CREATE TABLE dbo.Tmp_AuditLog_RadiationTherapy
	(
	LoggedOperation varchar(50) NULL,
	LoggedBy varchar(50) NULL,
	LoggedTime datetime NULL,
	PatientId int NULL,
	RadiationTherapyId int NULL,
	RadTxPending bit NULL,
	RadTxDateText varchar(50) NULL,
	RadTxDate datetime NULL,
	RadTxType varchar(50) NULL,
	RadTxDisease varchar(50) NULL,
	RadTxIndication varchar(50) NULL,
	RadTxIntent varchar(50) NULL,
	RadTxTarget varchar(50) NULL,
	RadTxSide varchar(50) NULL,
	RadTxPosition varchar(50) NULL,
	RadTxSite varchar(50) NULL,
	RadTxStopDateText varchar(50) NULL,
	RadTxStopDate datetime NULL,
	RadTxIsotope varchar(50) NULL,
	RadTxDosePerFraction varchar(50) NULL,
	RadTxTotalDose varchar(50) NULL,
	RadTxUnits varchar(50) NULL,
	RadTxNumFractions varchar(50) NULL,
	RadTxNumFields varchar(50) NULL,
	RadTxSchedule varchar(50) NULL,
	RadTxPhysician varchar(50) NULL,
	RadTxInstitution varchar(100) NULL,
	RadTxNotes varchar(1000) NULL,
	RadTxDataSource varchar(100) NULL,
	RadTxQuality varchar(50) NULL,
	EnteredBy varchar(50) NULL,
	EnteredTime datetime NULL,
	UpdatedBy varchar(50) NULL,
	UpdatedTime datetime NULL,
	LockedBy varchar(50) NULL,
	LockedTime datetime NULL
	)  ON [PRIMARY]
GO
IF EXISTS(SELECT * FROM dbo.AuditLog_RadiationTherapy)
	 EXEC('INSERT INTO dbo.Tmp_AuditLog_RadiationTherapy (LoggedOperation, LoggedBy, LoggedTime, PatientId, RadiationTherapyId, RadTxPending, RadTxDateText, RadTxDate, RadTxType, RadTxDisease, RadTxIndication, RadTxIntent, RadTxTarget, RadTxSide, RadTxPosition, RadTxStopDateText, RadTxStopDate, RadTxIsotope, RadTxDosePerFraction, RadTxTotalDose, RadTxUnits, RadTxNumFractions, RadTxNumFields, RadTxSchedule, RadTxPhysician, RadTxInstitution, RadTxNotes, RadTxDataSource, RadTxQuality, EnteredBy, EnteredTime, UpdatedBy, UpdatedTime, LockedBy, LockedTime)
		SELECT LoggedOperation, LoggedBy, LoggedTime, PatientId, RadiationTherapyId, RadTxPending, RadTxDateText, RadTxDate, RadTxType, RadTxDisease, RadTxIndication, RadTxIntent, RadTxTarget, RadTxSide, RadTxPosition, RadTxStopDateText, RadTxStopDate, RadTxIsotope, RadTxDosePerFraction, RadTxTotalDose, RadTxUnits, RadTxNumFractions, RadTxNumFields, RadTxSchedule, RadTxPhysician, RadTxInstitution, RadTxNotes, RadTxDataSource, RadTxQuality, EnteredBy, EnteredTime, UpdatedBy, UpdatedTime, LockedBy, LockedTime FROM dbo.AuditLog_RadiationTherapy WITH (HOLDLOCK TABLOCKX)')
GO
DROP TABLE dbo.AuditLog_RadiationTherapy
GO
EXECUTE sp_rename N'dbo.Tmp_AuditLog_RadiationTherapy', N'AuditLog_RadiationTherapy', 'OBJECT' 
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
ALTER TABLE dbo.RadiationTherapy
	DROP CONSTRAINT FK_RadiationTherapy_Patients
GO
COMMIT
BEGIN TRANSACTION
GO
ALTER TABLE dbo.RadiationTherapy
	DROP CONSTRAINT DF_RadiationTherapy_RadTxPending
GO
CREATE TABLE dbo.Tmp_RadiationTherapy
	(
	PatientId int NOT NULL,
	RadiationTherapyId int NOT NULL IDENTITY (1, 1),
	RadTxPending bit NULL,
	RadTxDateText varchar(50) NULL,
	RadTxDate datetime NULL,
	RadTxType varchar(50) NOT NULL,
	RadTxDisease varchar(50) NULL,
	RadTxIndication varchar(50) NULL,
	RadTxIntent varchar(50) NULL,
	RadTxTarget varchar(50) NULL,
	RadTxSide varchar(50) NULL,
	RadTxPosition varchar(50) NULL,
	RadTxSite varchar(50) NULL,
	RadTxStopDateText varchar(50) NULL,
	RadTxStopDate datetime NULL,
	RadTxIsotope varchar(50) NULL,
	RadTxDosePerFraction varchar(50) NULL,
	RadTxTotalDose varchar(50) NULL,
	RadTxUnits varchar(50) NULL,
	RadTxNumFractions varchar(50) NULL,
	RadTxNumFields varchar(50) NULL,
	RadTxSchedule varchar(50) NULL,
	RadTxPhysician varchar(50) NULL,
	RadTxInstitution varchar(100) NULL,
	RadTxNotes varchar(1000) NULL,
	RadTxDataSource varchar(100) NULL,
	RadTxQuality varchar(50) NULL,
	EnteredBy varchar(50) NOT NULL,
	EnteredTime datetime NOT NULL,
	UpdatedBy varchar(50) NULL,
	UpdatedTime datetime NULL,
	LockedBy varchar(50) NULL,
	LockedTime datetime NULL
	)  ON [PRIMARY]
GO
ALTER TABLE dbo.Tmp_RadiationTherapy ADD CONSTRAINT
	DF_RadiationTherapy_RadTxPending DEFAULT ((0)) FOR RadTxPending
GO
SET IDENTITY_INSERT dbo.Tmp_RadiationTherapy ON
GO
IF EXISTS(SELECT * FROM dbo.RadiationTherapy)
	 EXEC('INSERT INTO dbo.Tmp_RadiationTherapy (PatientId, RadiationTherapyId, RadTxPending, RadTxDateText, RadTxDate, RadTxType, RadTxDisease, RadTxIndication, RadTxIntent, RadTxTarget, RadTxSide, RadTxPosition, RadTxStopDateText, RadTxStopDate, RadTxIsotope, RadTxDosePerFraction, RadTxTotalDose, RadTxUnits, RadTxNumFractions, RadTxNumFields, RadTxSchedule, RadTxPhysician, RadTxInstitution, RadTxNotes, RadTxDataSource, RadTxQuality, EnteredBy, EnteredTime, UpdatedBy, UpdatedTime, LockedBy, LockedTime)
		SELECT PatientId, RadiationTherapyId, RadTxPending, RadTxDateText, RadTxDate, RadTxType, RadTxDisease, RadTxIndication, RadTxIntent, RadTxTarget, RadTxSide, RadTxPosition, RadTxStopDateText, RadTxStopDate, RadTxIsotope, RadTxDosePerFraction, RadTxTotalDose, RadTxUnits, RadTxNumFractions, RadTxNumFields, RadTxSchedule, RadTxPhysician, RadTxInstitution, RadTxNotes, RadTxDataSource, RadTxQuality, EnteredBy, EnteredTime, UpdatedBy, UpdatedTime, LockedBy, LockedTime FROM dbo.RadiationTherapy WITH (HOLDLOCK TABLOCKX)')
GO
SET IDENTITY_INSERT dbo.Tmp_RadiationTherapy OFF
GO
ALTER TABLE dbo.RadTxAdministration
	DROP CONSTRAINT FK_RadTxAdministration_RadiationTherapy
GO
DROP TABLE dbo.RadiationTherapy
GO
EXECUTE sp_rename N'dbo.Tmp_RadiationTherapy', N'RadiationTherapy', 'OBJECT' 
GO
ALTER TABLE dbo.RadiationTherapy ADD CONSTRAINT
	PK_RadiationTherapy PRIMARY KEY CLUSTERED 
	(
	RadiationTherapyId
	) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

GO
CREATE NONCLUSTERED INDEX I_RadiationTherapy_PatientId ON dbo.RadiationTherapy
	(
	PatientId
	) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE dbo.RadiationTherapy WITH NOCHECK ADD CONSTRAINT
	FK_RadiationTherapy_Patients FOREIGN KEY
	(
	PatientId
	) REFERENCES dbo.Patients
	(
	PatientId
	) ON UPDATE  CASCADE 
	 ON DELETE  NO ACTION 
	
GO
CREATE TRIGGER dbo.trgAuditRadiationTherapy_UD
ON dbo.RadiationTherapy FOR UPDATE, DELETE
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
   INSERT INTO AuditLog_RadiationTherapy
   SELECT @action AS LoggedOperation, Inserted.UpdatedBy AS LoggedBy, 
          GETDATE() AS LoggedTime, Deleted.*
   FROM Deleted INNER JOIN INSERTED
   ON Deleted.RadiationTherapyId = Inserted.RadiationTherapyId
ELSE IF @action = 'DELETE'
   INSERT INTO AuditLog_RadiationTherapy
   SELECT @action AS LoggedOperation, SYSTEM_USER AS LoggedBy, GETDATE() AS LoggedTime, *
   FROM Deleted
GO
sp_settriggerorder N'trgAuditRadiationTherapy_UD', N'last', N'update'
GO
COMMIT
BEGIN TRANSACTION
GO
ALTER TABLE dbo.RadTxAdministration ADD CONSTRAINT
	FK_RadTxAdministration_RadiationTherapy FOREIGN KEY
	(
	RadiationTherapyId
	) REFERENCES dbo.RadiationTherapy
	(
	RadiationTherapyId
	) ON UPDATE  CASCADE 
	 ON DELETE  CASCADE 
	
GO
COMMIT
GO
