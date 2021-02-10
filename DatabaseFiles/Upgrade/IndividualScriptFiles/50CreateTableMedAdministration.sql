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
CREATE TABLE dbo.AuditLog_MedAdministration
	(
	LoggedOperation varchar(50) NULL,
	LoggedBy varchar(50) NULL,
	LoggedTime datetime NULL,
	MedicationId int NULL,
	MedAdministrationId int NULL,
	MedAdminDateText varchar(50) NULL,
	MedAdminDate datetime NULL,
	MedAdminType varchar(50) NULL,
	MedAdminMedication varchar(100) NULL,
	MedAdminStopDateText varchar(50) NULL,
	MedAdminStopDate datetime NULL,
	MedAdminDose varchar(50) NULL,
	MedAdminTotalDose varchar(50) NULL,
	MedAdminUnits varchar(50) NULL,
	MedAdminRoute varchar(50) NULL,
	MedAdminSchedule varchar(50) NULL,
	MedAdminIndication varchar(50) NULL,
	MedAdminNotes varchar(1000) NULL,
	MedAdminDataSource varchar(100) NULL,
	MedAdminQuality varchar(50) NULL,
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
CREATE TABLE dbo.MedAdministration
	(
	MedicationId int NOT NULL,
	MedAdministrationId int NOT NULL IDENTITY (1, 1),
	MedAdminDateText varchar(50) NULL,
	MedAdminDate datetime NULL,
	MedAdminType varchar(50) NULL,
	MedAdminMedication varchar(100) NULL,
	MedAdminStopDateText varchar(50) NULL,
	MedAdminStopDate datetime NULL,
	MedAdminDose varchar(50) NULL,
	MedAdminTotalDose varchar(50) NULL,
	MedAdminUnits varchar(50) NULL,
	MedAdminRoute varchar(50) NULL,
	MedAdminSchedule varchar(50) NULL,
	MedAdminIndication varchar(50) NULL,
	MedAdminNotes varchar(1000) NULL,
	MedAdminDataSource varchar(100) NULL,
	MedAdminQuality varchar(50) NULL,
	EnteredBy varchar(50) NOT NULL,
	EnteredTime datetime NOT NULL,
	UpdatedBy varchar(50) NULL,
	UpdatedTime datetime NULL
	)  ON [PRIMARY]
GO
ALTER TABLE dbo.MedAdministration ADD CONSTRAINT
	PK_MedAdministration PRIMARY KEY CLUSTERED 
	(
	MedAdministrationId
	) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

GO
CREATE NONCLUSTERED INDEX I_MedAdministration_MedicationId ON dbo.MedAdministration
	(
	MedicationId
	) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE dbo.MedAdministration ADD CONSTRAINT
	FK_MedAdministration_Medications FOREIGN KEY
	(
	MedicationId
	) REFERENCES dbo.Medications
	(
	MedicationId
	) ON UPDATE  CASCADE 
	 ON DELETE  CASCADE 
GO
COMMIT
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[trgAuditMedAdministration_UD]
ON [dbo].[MedAdministration] FOR UPDATE, DELETE
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
   INSERT INTO AuditLog_MedAdministration
   SELECT @action AS LoggedOperation, Inserted.UpdatedBy AS LoggedBy, 
          GETDATE() AS LoggedTime, Deleted.*
   FROM Deleted INNER JOIN INSERTED
   ON Deleted.MedAdministrationId = Inserted.MedAdministrationId
ELSE IF @action = 'DELETE'
   INSERT INTO AuditLog_MedAdministration
   SELECT @action AS LoggedOperation, SYSTEM_USER AS LoggedBy, GETDATE() AS LoggedTime, *
   FROM Deleted
GO
EXEC sp_settriggerorder @triggername=N'[dbo].[trgAuditMedAdministration_UD]', @order=N'Last', @stmttype=N'UPDATE'
GO
