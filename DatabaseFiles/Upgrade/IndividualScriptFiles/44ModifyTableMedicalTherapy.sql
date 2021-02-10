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
CREATE TABLE dbo.Tmp_AuditLog_MedicalTherapy
	(
	LoggedOperation varchar(50) NULL,
	LoggedBy varchar(50) NULL,
	LoggedTime datetime NULL,
	PatientId int NULL,
	ProtocolId int NULL,
	OperatingRoomDetailId int NULL,
	MedicalTherapyId int NULL,
	MedTxPending bit NULL,
	MedTxDateText varchar(50) NULL,
	MedTxDate datetime NULL,
	MedTxType varchar(50) NULL,
	MedTxDisease varchar(50) NULL,
	MedTxIndication varchar(50) NULL,
	MedTxIntent varchar(50) NULL,
	MedTxAgent varchar(255) NULL,
	MedTxStopDateText varchar(50) NULL,
	MedTxStopDate datetime NULL,
	MedTxDose varchar(50) NULL,
	MedTxTotalDose varchar(50) NULL,
	MedTxUnits varchar(50) NULL,
	MedTxRoute varchar(50) NULL,
	MedTxSchedule varchar(50) NULL,
	MedTxCycle varchar(50) NULL,
	MedTxWeek varchar(50) NULL,
	MedTxInstitution varchar(100) NULL,
	MedTxSite varchar(50) NULL,
	MedTxNotes varchar(1000) NULL,
	MedTxDataSource varchar(100) NULL,
	MedTxQuality varchar(50) NULL,
	EnteredBy varchar(50) NULL,
	EnteredTime datetime NULL,
	UpdatedBy varchar(50) NULL,
	UpdatedTime datetime NULL,
	LockedBy varchar(50) NULL,
	LockedTime datetime NULL
	)  ON [PRIMARY]
GO
IF EXISTS(SELECT * FROM dbo.AuditLog_MedicalTherapy)
	 EXEC('INSERT INTO dbo.Tmp_AuditLog_MedicalTherapy (LoggedOperation, LoggedBy, LoggedTime, PatientId, ProtocolId, OperatingRoomDetailId, MedicalTherapyId, MedTxPending, MedTxDateText, MedTxDate, MedTxType, MedTxDisease, MedTxIndication, MedTxIntent, MedTxAgent, MedTxStopDateText, MedTxStopDate, MedTxDose, MedTxTotalDose, MedTxUnits, MedTxRoute, MedTxSchedule, MedTxCycle, MedTxWeek, MedTxInstitution, MedTxNotes, MedTxDataSource, MedTxQuality, EnteredBy, EnteredTime, UpdatedBy, UpdatedTime, LockedBy, LockedTime)
		SELECT LoggedOperation, LoggedBy, LoggedTime, PatientId, ProtocolId, OperatingRoomDetailId, MedicalTherapyId, MedTxPending, MedTxDateText, MedTxDate, MedTxType, MedTxDisease, MedTxIndication, MedTxIntent, MedTxAgent, MedTxStopDateText, MedTxStopDate, MedTxDose, MedTxTotalDose, MedTxUnits, MedTxRoute, MedTxSchedule, MedTxCycle, MedTxWeek, MedTxInstitution, MedTxNotes, MedTxDataSource, MedTxQuality, EnteredBy, EnteredTime, UpdatedBy, UpdatedTime, LockedBy, LockedTime FROM dbo.AuditLog_MedicalTherapy WITH (HOLDLOCK TABLOCKX)')
GO
DROP TABLE dbo.AuditLog_MedicalTherapy
GO
EXECUTE sp_rename N'dbo.Tmp_AuditLog_MedicalTherapy', N'AuditLog_MedicalTherapy', 'OBJECT' 
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
ALTER TABLE dbo.MedicalTherapy
	DROP CONSTRAINT FK_MedicalTherapy_Patients
GO
COMMIT
BEGIN TRANSACTION
GO
ALTER TABLE dbo.MedicalTherapy
	DROP CONSTRAINT DF_MedicalTherapy_MedTxPending
GO
CREATE TABLE dbo.Tmp_MedicalTherapy
	(
	PatientId int NOT NULL,
	ProtocolId int NULL,
	OperatingRoomDetailId int NULL,
	MedicalTherapyId int NOT NULL IDENTITY (1, 1),
	MedTxPending bit NULL,
	MedTxDateText varchar(50) NULL,
	MedTxDate datetime NULL,
	MedTxType varchar(50) NOT NULL,
	MedTxDisease varchar(50) NULL,
	MedTxIndication varchar(50) NULL,
	MedTxIntent varchar(50) NULL,
	MedTxAgent varchar(255) NULL,
	MedTxStopDateText varchar(50) NULL,
	MedTxStopDate datetime NULL,
	MedTxDose varchar(50) NULL,
	MedTxTotalDose varchar(50) NULL,
	MedTxUnits varchar(50) NULL,
	MedTxRoute varchar(50) NULL,
	MedTxSchedule varchar(50) NULL,
	MedTxCycle varchar(50) NULL,
	MedTxWeek varchar(50) NULL,
	MedTxInstitution varchar(100) NULL,
	MedTxSite varchar(50) NULL,
	MedTxNotes varchar(1000) NULL,
	MedTxDataSource varchar(100) NULL,
	MedTxQuality varchar(50) NULL,
	EnteredBy varchar(50) NOT NULL,
	EnteredTime datetime NOT NULL,
	UpdatedBy varchar(50) NULL,
	UpdatedTime datetime NULL,
	LockedBy varchar(50) NULL,
	LockedTime datetime NULL
	)  ON [PRIMARY]
GO
ALTER TABLE dbo.Tmp_MedicalTherapy ADD CONSTRAINT
	DF_MedicalTherapy_MedTxPending DEFAULT ((0)) FOR MedTxPending
GO
SET IDENTITY_INSERT dbo.Tmp_MedicalTherapy ON
GO
IF EXISTS(SELECT * FROM dbo.MedicalTherapy)
	 EXEC('INSERT INTO dbo.Tmp_MedicalTherapy (PatientId, ProtocolId, OperatingRoomDetailId, MedicalTherapyId, MedTxPending, MedTxDateText, MedTxDate, MedTxType, MedTxDisease, MedTxIndication, MedTxIntent, MedTxAgent, MedTxStopDateText, MedTxStopDate, MedTxDose, MedTxTotalDose, MedTxUnits, MedTxRoute, MedTxSchedule, MedTxCycle, MedTxWeek, MedTxInstitution, MedTxNotes, MedTxDataSource, MedTxQuality, EnteredBy, EnteredTime, UpdatedBy, UpdatedTime, LockedBy, LockedTime)
		SELECT PatientId, ProtocolId, OperatingRoomDetailId, MedicalTherapyId, MedTxPending, MedTxDateText, MedTxDate, MedTxType, MedTxDisease, MedTxIndication, MedTxIntent, MedTxAgent, MedTxStopDateText, MedTxStopDate, MedTxDose, MedTxTotalDose, MedTxUnits, MedTxRoute, MedTxSchedule, MedTxCycle, MedTxWeek, MedTxInstitution, MedTxNotes, MedTxDataSource, MedTxQuality, EnteredBy, EnteredTime, UpdatedBy, UpdatedTime, LockedBy, LockedTime FROM dbo.MedicalTherapy WITH (HOLDLOCK TABLOCKX)')
GO
SET IDENTITY_INSERT dbo.Tmp_MedicalTherapy OFF
GO
ALTER TABLE dbo.MedTxAdministration
	DROP CONSTRAINT FK_MedTxAdministration_MedicalTherapy
GO
DROP TABLE dbo.MedicalTherapy
GO
EXECUTE sp_rename N'dbo.Tmp_MedicalTherapy', N'MedicalTherapy', 'OBJECT' 
GO
ALTER TABLE dbo.MedicalTherapy ADD CONSTRAINT
	PK_MedicalTherapy PRIMARY KEY CLUSTERED 
	(
	MedicalTherapyId
	) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

GO
CREATE NONCLUSTERED INDEX I_MedicalTherapy_PatientId ON dbo.MedicalTherapy
	(
	PatientId
	) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE dbo.MedicalTherapy WITH NOCHECK ADD CONSTRAINT
	FK_MedicalTherapy_Patients FOREIGN KEY
	(
	PatientId
	) REFERENCES dbo.Patients
	(
	PatientId
	) ON UPDATE  CASCADE 
	 ON DELETE  NO ACTION 
	
GO
CREATE TRIGGER dbo.trgAuditMedicalTherapy_UD
ON dbo.MedicalTherapy FOR UPDATE, DELETE
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
   INSERT INTO AuditLog_MedicalTherapy
   SELECT @action AS LoggedOperation, Inserted.UpdatedBy AS LoggedBy, 
          GETDATE() AS LoggedTime, Deleted.*
   FROM Deleted INNER JOIN INSERTED
   ON Deleted.MedicalTherapyId = Inserted.MedicalTherapyId
ELSE IF @action = 'DELETE'
   INSERT INTO AuditLog_MedicalTherapy
   SELECT @action AS LoggedOperation, SYSTEM_USER AS LoggedBy, GETDATE() AS LoggedTime, *
   FROM Deleted
GO
sp_settriggerorder N'trgAuditMedicalTherapy_UD', N'last', N'update'
GO
COMMIT
BEGIN TRANSACTION
GO
ALTER TABLE dbo.MedTxAdministration ADD CONSTRAINT
	FK_MedTxAdministration_MedicalTherapy FOREIGN KEY
	(
	MedicalTherapyId
	) REFERENCES dbo.MedicalTherapy
	(
	MedicalTherapyId
	) ON UPDATE  CASCADE 
	 ON DELETE  CASCADE 
GO
COMMIT
GO

