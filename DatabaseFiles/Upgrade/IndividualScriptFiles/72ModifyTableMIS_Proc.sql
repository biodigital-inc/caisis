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
CREATE TABLE dbo.Tmp_AuditLog_MIS_Proc
	(
	LoggedOperation varchar(50) NULL,
	LoggedBy varchar(50) NULL,
	LoggedTime datetime NULL,
	ProcedureId int NULL,
	ProcIntent varchar(50) NULL,
	ProcInstrumentUsed varchar(50) NULL,
	ProcNumPorts varchar(50) NULL,
	ProcConversionReason varchar(255) NULL,
	ProcOpenConversion varchar(50) NULL,
	EnteredBy varchar(50) NULL,
	EnteredTime datetime NULL,
	UpdatedBy varchar(50) NULL,
	UpdatedTime datetime NULL
	)  ON [PRIMARY]
GO
ALTER TABLE dbo.Tmp_AuditLog_MIS_Proc SET (LOCK_ESCALATION = TABLE)
GO
IF EXISTS(SELECT * FROM dbo.AuditLog_MIS_Proc)
	 EXEC('INSERT INTO dbo.Tmp_AuditLog_MIS_Proc (LoggedOperation, LoggedBy, LoggedTime, ProcedureId, ProcIntent, ProcInstrumentUsed, ProcNumPorts, ProcConversionReason, EnteredBy, EnteredTime, UpdatedBy, UpdatedTime)
		SELECT LoggedOperation, LoggedBy, LoggedTime, ProcedureId, ProcIntent, ProcInstrumentUsed, ProcNumPorts, ProcConversionReason, EnteredBy, EnteredTime, UpdatedBy, UpdatedTime FROM dbo.AuditLog_MIS_Proc WITH (HOLDLOCK TABLOCKX)')
GO
DROP TABLE dbo.AuditLog_MIS_Proc
GO
EXECUTE sp_rename N'dbo.Tmp_AuditLog_MIS_Proc', N'AuditLog_MIS_Proc', 'OBJECT' 
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
ALTER TABLE dbo.MIS_Proc
	DROP CONSTRAINT FK_MIS_Proc_Procedures
GO
ALTER TABLE dbo.Procedures SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
BEGIN TRANSACTION
GO
CREATE TABLE dbo.Tmp_MIS_Proc
	(
	ProcedureId int NOT NULL,
	ProcIntent varchar(50) NULL,
	ProcInstrumentUsed varchar(50) NULL,
	ProcNumPorts varchar(50) NULL,
	ProcConversionReason varchar(255) NULL,
	ProcOpenConversion varchar(50) NULL,
	EnteredBy varchar(50) NOT NULL,
	EnteredTime datetime NOT NULL,
	UpdatedBy varchar(50) NULL,
	UpdatedTime datetime NULL
	)  ON [PRIMARY]
GO
ALTER TABLE dbo.Tmp_MIS_Proc SET (LOCK_ESCALATION = TABLE)
GO
IF EXISTS(SELECT * FROM dbo.MIS_Proc)
	 EXEC('INSERT INTO dbo.Tmp_MIS_Proc (ProcedureId, ProcIntent, ProcInstrumentUsed, ProcNumPorts, ProcConversionReason, EnteredBy, EnteredTime, UpdatedBy, UpdatedTime)
		SELECT ProcedureId, ProcIntent, ProcInstrumentUsed, ProcNumPorts, ProcConversionReason, EnteredBy, EnteredTime, UpdatedBy, UpdatedTime FROM dbo.MIS_Proc WITH (HOLDLOCK TABLOCKX)')
GO
DROP TABLE dbo.MIS_Proc
GO
EXECUTE sp_rename N'dbo.Tmp_MIS_Proc', N'MIS_Proc', 'OBJECT' 
GO
ALTER TABLE dbo.MIS_Proc ADD CONSTRAINT
	PK_MIS_Proc PRIMARY KEY CLUSTERED 
	(
	ProcedureId
	) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

GO
ALTER TABLE dbo.MIS_Proc ADD CONSTRAINT
	FK_MIS_Proc_Procedures FOREIGN KEY
	(
	ProcedureId
	) REFERENCES dbo.Procedures
	(
	ProcedureId
	) ON UPDATE  CASCADE 
	 ON DELETE  CASCADE 
	
GO
CREATE TRIGGER [dbo].[trgAuditMIS_Proc_UD]
ON dbo.MIS_Proc FOR UPDATE, DELETE
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
   INSERT INTO AuditLog_MIS_Proc
   SELECT @action AS LoggedOperation, Inserted.UpdatedBy AS LoggedBy, 
          GETDATE() AS LoggedTime, Deleted.*
   FROM Deleted INNER JOIN INSERTED
   ON Deleted.ProcedureId = Inserted.ProcedureId
ELSE IF @action = 'DELETE'
   INSERT INTO AuditLog_MIS_Proc
   SELECT @action AS LoggedOperation, SYSTEM_USER AS LoggedBy, GETDATE() AS LoggedTime, *
   FROM Deleted
GO
sp_settriggerorder N'trgAuditMIS_Proc_UD', N'last', N'update'
GO
COMMIT
GO
