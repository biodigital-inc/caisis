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
CREATE TABLE dbo.Tmp_AuditLog_OperatingRoomDetails
	(
	LoggedOperation varchar(50) NULL,
	LoggedBy varchar(50) NULL,
	LoggedTime datetime NULL,
	PatientId int NULL,
	OperatingRoomDetailId int NULL,
	OpLogNum varchar(50) NULL,
	OpPending bit NULL,
	OpDateText varchar(50) NULL,
	OpDate datetime NULL,
	OpInstitution varchar(50) NULL,
	OpService varchar(50) NULL,
	OpAdmitDateText varchar(50) NULL,
	OpAdmitDate datetime NULL,
	OpDischargeDateText varchar(50) NULL,
	OpDischargeDate datetime NULL,
	OpCaseSurgeon varchar(50) NULL,
	OpDuration varchar(50) NULL,
	OpAnesthesiaDuration varchar(50) NULL,
	OpAnesthesiaType varchar(50) NULL,
	OpEstBloodLoss varchar(50) NULL,
	OpAutoAvailable varchar(50) NULL,
	OpAutoTransfused varchar(50) NULL,
	OpAutoIntraOp varchar(50) NULL,
	OpAutoPostOp varchar(50) NULL,
	OpRBC_Available varchar(50) NULL,
	OpRBC_Transfused varchar(50) NULL,
	OpRBC_IntraOp varchar(50) NULL,
	OpRBC_PostOp varchar(50) NULL,
	OpHD_Available varchar(50) NULL,
	OpHD_Transfused varchar(50) NULL,
	OpHD_IntraOp varchar(50) NULL,
	OpHGB_Admit varchar(50) NULL,
	OpHCT_Admit varchar(50) NULL,
	OpHGB_IntraOp varchar(50) NULL,
	OpHCT_IntraOp varchar(50) NULL,
	OpFFP_Available varchar(50) NULL,
	OpFFP_Transfused varchar(50) NULL,
	OpFFP_IntraOp varchar(50) NULL,
	OpFFP_PostOp varchar(50) NULL,
	OpPlateletsAvailable varchar(50) NULL,
	OpPlateletsTransfused varchar(50) NULL,
	OpPlateletsIntraOp varchar(50) NULL,
	OpPlateletsPostOp varchar(50) NULL,
	OpCryoAvailable varchar(50) NULL,
	OpCryoTransfused varchar(50) NULL,
	OpCryoIntraOp varchar(50) NULL,
	OpCryoPostOp varchar(50) NULL,
	OpPreOpAntibiotics varchar(50) NULL,
	OpIntraOpAntibiotics varchar(50) NULL,
	OpPostOpAntibiotics varchar(50) NULL,
	OpNG_Tube varchar(50) NULL,
	OpAnticoagulation varchar(50) NULL,
	OpPneumatics varchar(50) NULL,
	OpICU_PostOp varchar(50) NULL,
	OpPostOpDayFed varchar(50) NULL,
	OpASA varchar(50) NULL,
	OpFluids varchar(50) NULL,
	OpFluidNormosol varchar(50) NULL,
	OpFluidAlbumin varchar(50) NULL,
	OpFluidManitol varchar(50) NULL,
	OpFluidHespan varchar(50) NULL,
	OpColloid varchar(50) NULL,
	OpCrystalloid varchar(50) NULL,
	OpUrineOutput varchar(50) NULL,
	OpDifficulty varchar(50) NULL,
	OpNS_ProbeType varchar(50) NULL,
	OpNS_Notes varchar(1000) NULL,
	OpPresenceStatement varchar(100) NULL,
	OpPresenceKeyPortions varchar(100) NULL,
	OpInTime varchar(50) NULL,
	OpOutTime varchar(50) NULL,
	OpPatientDisposition varchar(50) NULL,
	OpAdmitStatus varchar(50) NULL,
	OpLocation varchar(50) NULL,
	OpIntraopMonitoring varchar(50) NULL,
	OpPreOpSummary varchar(500) NULL,
	OpPostOpSummary varchar(500) NULL,
	OpFoleyCatheter varchar(50) NULL,
	OpStraightCatheter varchar(50) NULL,
	OpNotes varchar(2000) NULL,
	OpDataSource varchar(100) NULL,
	OpQuality varchar(50) NULL,
	EnteredBy varchar(50) NULL,
	EnteredTime datetime NULL,
	UpdatedBy varchar(50) NULL,
	UpdatedTime datetime NULL,
	LockedBy varchar(50) NULL,
	LockedTime datetime NULL
	)  ON [PRIMARY]
GO
ALTER TABLE dbo.Tmp_AuditLog_OperatingRoomDetails SET (LOCK_ESCALATION = TABLE)
GO
IF EXISTS(SELECT * FROM dbo.AuditLog_OperatingRoomDetails)
	 EXEC('INSERT INTO dbo.Tmp_AuditLog_OperatingRoomDetails (LoggedOperation, LoggedBy, LoggedTime, PatientId, OperatingRoomDetailId, OpLogNum, OpPending, OpDateText, OpDate, OpInstitution, OpService, OpAdmitDateText, OpAdmitDate, OpDischargeDateText, OpDischargeDate, OpCaseSurgeon, OpDuration, OpAnesthesiaDuration, OpAnesthesiaType, OpEstBloodLoss, OpAutoAvailable, OpAutoTransfused, OpAutoIntraOp, OpAutoPostOp, OpRBC_Available, OpRBC_Transfused, OpRBC_IntraOp, OpRBC_PostOp, OpHD_Available, OpHD_Transfused, OpHD_IntraOp, OpHGB_Admit, OpHCT_Admit, OpHGB_IntraOp, OpHCT_IntraOp, OpFFP_Available, OpFFP_Transfused, OpFFP_IntraOp, OpFFP_PostOp, OpPlateletsAvailable, OpPlateletsTransfused, OpPlateletsIntraOp, OpPlateletsPostOp, OpCryoAvailable, OpCryoTransfused, OpCryoIntraOp, OpCryoPostOp, OpPreOpAntibiotics, OpIntraOpAntibiotics, OpPostOpAntibiotics, OpNG_Tube, OpAnticoagulation, OpPneumatics, OpICU_PostOp, OpPostOpDayFed, OpASA, OpFluids, OpFluidNormosol, OpFluidAlbumin, OpFluidManitol, OpFluidHespan, OpColloid, OpCrystalloid, OpUrineOutput, OpDifficulty, OpNS_ProbeType, OpNS_Notes, OpPresenceStatement, OpPresenceKeyPortions, OpInTime, OpOutTime, OpPatientDisposition, OpAdmitStatus, OpLocation, OpIntraopMonitoring, OpPreOpSummary, OpPostOpSummary, OpNotes, OpDataSource, OpQuality, EnteredBy, EnteredTime, UpdatedBy, UpdatedTime, LockedBy, LockedTime)
		SELECT LoggedOperation, LoggedBy, LoggedTime, PatientId, OperatingRoomDetailId, OpLogNum, OpPending, OpDateText, OpDate, OpInstitution, OpService, OpAdmitDateText, OpAdmitDate, OpDischargeDateText, OpDischargeDate, OpCaseSurgeon, OpDuration, OpAnesthesiaDuration, OpAnesthesiaType, OpEstBloodLoss, OpAutoAvailable, OpAutoTransfused, OpAutoIntraOp, OpAutoPostOp, OpRBC_Available, OpRBC_Transfused, OpRBC_IntraOp, OpRBC_PostOp, OpHD_Available, OpHD_Transfused, OpHD_IntraOp, OpHGB_Admit, OpHCT_Admit, OpHGB_IntraOp, OpHCT_IntraOp, OpFFP_Available, OpFFP_Transfused, OpFFP_IntraOp, OpFFP_PostOp, OpPlateletsAvailable, OpPlateletsTransfused, OpPlateletsIntraOp, OpPlateletsPostOp, OpCryoAvailable, OpCryoTransfused, OpCryoIntraOp, OpCryoPostOp, OpPreOpAntibiotics, OpIntraOpAntibiotics, OpPostOpAntibiotics, OpNG_Tube, OpAnticoagulation, OpPneumatics, OpICU_PostOp, OpPostOpDayFed, OpASA, OpFluids, OpFluidNormosol, OpFluidAlbumin, OpFluidManitol, OpFluidHespan, OpColloid, OpCrystalloid, OpUrineOutput, OpDifficulty, OpNS_ProbeType, OpNS_Notes, OpPresenceStatement, OpPresenceKeyPortions, OpInTime, OpOutTime, OpPatientDisposition, OpAdmitStatus, OpLocation, OpIntraopMonitoring, OpPreOpSummary, OpPostOpSummary, OpNotes, OpDataSource, OpQuality, EnteredBy, EnteredTime, UpdatedBy, UpdatedTime, LockedBy, LockedTime FROM dbo.AuditLog_OperatingRoomDetails WITH (HOLDLOCK TABLOCKX)')
GO
DROP TABLE dbo.AuditLog_OperatingRoomDetails
GO
EXECUTE sp_rename N'dbo.Tmp_AuditLog_OperatingRoomDetails', N'AuditLog_OperatingRoomDetails', 'OBJECT' 
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
ALTER TABLE dbo.OperatingRoomDetails
	DROP CONSTRAINT FK_OperatingRoomDetails_Patients
GO
ALTER TABLE dbo.Patients SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
BEGIN TRANSACTION
GO
ALTER TABLE dbo.OperatingRoomDetails
	DROP CONSTRAINT DF_OpDetails_SurgPending
GO
CREATE TABLE dbo.Tmp_OperatingRoomDetails
	(
	PatientId int NOT NULL,
	OperatingRoomDetailId int NOT NULL IDENTITY (1, 1),
	OpLogNum varchar(50) NULL,
	OpPending bit NULL,
	OpDateText varchar(50) NULL,
	OpDate datetime NULL,
	OpInstitution varchar(50) NULL,
	OpService varchar(50) NULL,
	OpAdmitDateText varchar(50) NULL,
	OpAdmitDate datetime NULL,
	OpDischargeDateText varchar(50) NULL,
	OpDischargeDate datetime NULL,
	OpCaseSurgeon varchar(50) NULL,
	OpDuration varchar(50) NULL,
	OpAnesthesiaDuration varchar(50) NULL,
	OpAnesthesiaType varchar(50) NULL,
	OpEstBloodLoss varchar(50) NULL,
	OpAutoAvailable varchar(50) NULL,
	OpAutoTransfused varchar(50) NULL,
	OpAutoIntraOp varchar(50) NULL,
	OpAutoPostOp varchar(50) NULL,
	OpRBC_Available varchar(50) NULL,
	OpRBC_Transfused varchar(50) NULL,
	OpRBC_IntraOp varchar(50) NULL,
	OpRBC_PostOp varchar(50) NULL,
	OpHD_Available varchar(50) NULL,
	OpHD_Transfused varchar(50) NULL,
	OpHD_IntraOp varchar(50) NULL,
	OpHGB_Admit varchar(50) NULL,
	OpHCT_Admit varchar(50) NULL,
	OpHGB_IntraOp varchar(50) NULL,
	OpHCT_IntraOp varchar(50) NULL,
	OpFFP_Available varchar(50) NULL,
	OpFFP_Transfused varchar(50) NULL,
	OpFFP_IntraOp varchar(50) NULL,
	OpFFP_PostOp varchar(50) NULL,
	OpPlateletsAvailable varchar(50) NULL,
	OpPlateletsTransfused varchar(50) NULL,
	OpPlateletsIntraOp varchar(50) NULL,
	OpPlateletsPostOp varchar(50) NULL,
	OpCryoAvailable varchar(50) NULL,
	OpCryoTransfused varchar(50) NULL,
	OpCryoIntraOp varchar(50) NULL,
	OpCryoPostOp varchar(50) NULL,
	OpPreOpAntibiotics varchar(50) NULL,
	OpIntraOpAntibiotics varchar(50) NULL,
	OpPostOpAntibiotics varchar(50) NULL,
	OpNG_Tube varchar(50) NULL,
	OpAnticoagulation varchar(50) NULL,
	OpPneumatics varchar(50) NULL,
	OpICU_PostOp varchar(50) NULL,
	OpPostOpDayFed varchar(50) NULL,
	OpASA varchar(50) NULL,
	OpFluids varchar(50) NULL,
	OpFluidNormosol varchar(50) NULL,
	OpFluidAlbumin varchar(50) NULL,
	OpFluidManitol varchar(50) NULL,
	OpFluidHespan varchar(50) NULL,
	OpColloid varchar(50) NULL,
	OpCrystalloid varchar(50) NULL,
	OpUrineOutput varchar(50) NULL,
	OpDifficulty varchar(50) NULL,
	OpNS_ProbeType varchar(50) NULL,
	OpNS_Notes varchar(1000) NULL,
	OpPresenceStatement varchar(100) NULL,
	OpPresenceKeyPortions varchar(100) NULL,
	OpInTime varchar(50) NULL,
	OpOutTime varchar(50) NULL,
	OpPatientDisposition varchar(50) NULL,
	OpAdmitStatus varchar(50) NULL,
	OpLocation varchar(50) NULL,
	OpIntraopMonitoring varchar(50) NULL,
	OpPreOpSummary varchar(500) NULL,
	OpPostOpSummary varchar(500) NULL,
	OpFoleyCatheter varchar(50) NULL,
	OpStraightCatheter varchar(50) NULL,
	OpNotes varchar(2000) NULL,
	OpDataSource varchar(100) NULL,
	OpQuality varchar(50) NULL,
	EnteredBy varchar(50) NOT NULL,
	EnteredTime datetime NOT NULL,
	UpdatedBy varchar(50) NULL,
	UpdatedTime datetime NULL,
	LockedBy varchar(50) NULL,
	LockedTime datetime NULL
	)  ON [PRIMARY]
GO
ALTER TABLE dbo.Tmp_OperatingRoomDetails SET (LOCK_ESCALATION = TABLE)
GO
ALTER TABLE dbo.Tmp_OperatingRoomDetails ADD CONSTRAINT
	DF_OpDetails_SurgPending DEFAULT ((0)) FOR OpPending
GO
SET IDENTITY_INSERT dbo.Tmp_OperatingRoomDetails ON
GO
IF EXISTS(SELECT * FROM dbo.OperatingRoomDetails)
	 EXEC('INSERT INTO dbo.Tmp_OperatingRoomDetails (PatientId, OperatingRoomDetailId, OpLogNum, OpPending, OpDateText, OpDate, OpInstitution, OpService, OpAdmitDateText, OpAdmitDate, OpDischargeDateText, OpDischargeDate, OpCaseSurgeon, OpDuration, OpAnesthesiaDuration, OpAnesthesiaType, OpEstBloodLoss, OpAutoAvailable, OpAutoTransfused, OpAutoIntraOp, OpAutoPostOp, OpRBC_Available, OpRBC_Transfused, OpRBC_IntraOp, OpRBC_PostOp, OpHD_Available, OpHD_Transfused, OpHD_IntraOp, OpHGB_Admit, OpHCT_Admit, OpHGB_IntraOp, OpHCT_IntraOp, OpFFP_Available, OpFFP_Transfused, OpFFP_IntraOp, OpFFP_PostOp, OpPlateletsAvailable, OpPlateletsTransfused, OpPlateletsIntraOp, OpPlateletsPostOp, OpCryoAvailable, OpCryoTransfused, OpCryoIntraOp, OpCryoPostOp, OpPreOpAntibiotics, OpIntraOpAntibiotics, OpPostOpAntibiotics, OpNG_Tube, OpAnticoagulation, OpPneumatics, OpICU_PostOp, OpPostOpDayFed, OpASA, OpFluids, OpFluidNormosol, OpFluidAlbumin, OpFluidManitol, OpFluidHespan, OpColloid, OpCrystalloid, OpUrineOutput, OpDifficulty, OpNS_ProbeType, OpNS_Notes, OpPresenceStatement, OpPresenceKeyPortions, OpInTime, OpOutTime, OpPatientDisposition, OpAdmitStatus, OpLocation, OpIntraopMonitoring, OpPreOpSummary, OpPostOpSummary, OpNotes, OpDataSource, OpQuality, EnteredBy, EnteredTime, UpdatedBy, UpdatedTime, LockedBy, LockedTime)
		SELECT PatientId, OperatingRoomDetailId, OpLogNum, OpPending, OpDateText, OpDate, OpInstitution, OpService, OpAdmitDateText, OpAdmitDate, OpDischargeDateText, OpDischargeDate, OpCaseSurgeon, OpDuration, OpAnesthesiaDuration, OpAnesthesiaType, OpEstBloodLoss, OpAutoAvailable, OpAutoTransfused, OpAutoIntraOp, OpAutoPostOp, OpRBC_Available, OpRBC_Transfused, OpRBC_IntraOp, OpRBC_PostOp, OpHD_Available, OpHD_Transfused, OpHD_IntraOp, OpHGB_Admit, OpHCT_Admit, OpHGB_IntraOp, OpHCT_IntraOp, OpFFP_Available, OpFFP_Transfused, OpFFP_IntraOp, OpFFP_PostOp, OpPlateletsAvailable, OpPlateletsTransfused, OpPlateletsIntraOp, OpPlateletsPostOp, OpCryoAvailable, OpCryoTransfused, OpCryoIntraOp, OpCryoPostOp, OpPreOpAntibiotics, OpIntraOpAntibiotics, OpPostOpAntibiotics, OpNG_Tube, OpAnticoagulation, OpPneumatics, OpICU_PostOp, OpPostOpDayFed, OpASA, OpFluids, OpFluidNormosol, OpFluidAlbumin, OpFluidManitol, OpFluidHespan, OpColloid, OpCrystalloid, OpUrineOutput, OpDifficulty, OpNS_ProbeType, OpNS_Notes, OpPresenceStatement, OpPresenceKeyPortions, OpInTime, OpOutTime, OpPatientDisposition, OpAdmitStatus, OpLocation, OpIntraopMonitoring, OpPreOpSummary, OpPostOpSummary, OpNotes, OpDataSource, OpQuality, EnteredBy, EnteredTime, UpdatedBy, UpdatedTime, LockedBy, LockedTime FROM dbo.OperatingRoomDetails WITH (HOLDLOCK TABLOCKX)')
GO
SET IDENTITY_INSERT dbo.Tmp_OperatingRoomDetails OFF
GO
ALTER TABLE dbo.PhysicianBilling
	DROP CONSTRAINT FK_PhysicianBilling_OperatingRoomDetails
GO
DROP TABLE dbo.OperatingRoomDetails
GO
EXECUTE sp_rename N'dbo.Tmp_OperatingRoomDetails', N'OperatingRoomDetails', 'OBJECT' 
GO
ALTER TABLE dbo.OperatingRoomDetails ADD CONSTRAINT
	PK_OperatingRoomDetails PRIMARY KEY CLUSTERED 
	(
	OperatingRoomDetailId
	) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

GO
CREATE NONCLUSTERED INDEX I_OperatingRoomDetails_PatientId ON dbo.OperatingRoomDetails
	(
	PatientId
	) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE dbo.OperatingRoomDetails WITH NOCHECK ADD CONSTRAINT
	FK_OperatingRoomDetails_Patients FOREIGN KEY
	(
	PatientId
	) REFERENCES dbo.Patients
	(
	PatientId
	) ON UPDATE  CASCADE 
	 ON DELETE  CASCADE 
	 NOT FOR REPLICATION

GO
CREATE TRIGGER dbo.trgAuditOperatingRoomDetails_UD
ON dbo.OperatingRoomDetails FOR UPDATE, DELETE
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
   INSERT INTO AuditLog_OperatingRoomDetails
   SELECT @action AS LoggedOperation, Inserted.UpdatedBy AS LoggedBy, 
          GETDATE() AS LoggedTime, Deleted.*
   FROM Deleted INNER JOIN INSERTED
   ON Deleted.OperatingRoomDetailId = Inserted.OperatingRoomDetailId
ELSE IF @action = 'DELETE'
   INSERT INTO AuditLog_OperatingRoomDetails
   SELECT @action AS LoggedOperation, SYSTEM_USER AS LoggedBy, GETDATE() AS LoggedTime, *
   FROM Deleted
GO
COMMIT
BEGIN TRANSACTION
GO
ALTER TABLE dbo.PhysicianBilling WITH NOCHECK ADD CONSTRAINT
	FK_PhysicianBilling_OperatingRoomDetails FOREIGN KEY
	(
	OperatingRoomDetailId
	) REFERENCES dbo.OperatingRoomDetails
	(
	OperatingRoomDetailId
	) ON UPDATE  CASCADE 
	 ON DELETE  CASCADE 
	 NOT FOR REPLICATION

GO
ALTER TABLE dbo.PhysicianBilling SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
GO
