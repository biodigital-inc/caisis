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
CREATE TABLE dbo.Tmp_AuditLog_SpecimenEvents
	(
	LoggedOperation varchar(50) NULL,
	LoggedBy varchar(50) NULL,
	LoggedTime datetime NULL,
	SpecimenId int NULL,
	ContactId int NULL,
	SpecimenEventId int NULL,
	EventPending bit NULL,
	EventDateText varchar(50) NULL,
	EventDate datetime NULL,
	EventTime varchar(10) NULL,
	EventType varchar(255) NULL,
	EventSubType varchar(255) NULL,
	EventAnalyte varchar(50) NULL,
	EventExtReference varchar(255) NULL,
	EventResult varchar(255) NULL,
	QuantityUsed varchar(50) NULL,
	QuantityUnits varchar(50) NULL,
	ProcessedBy varchar(50) NULL,
	ResultsReceivedDate datetime NULL,
	ResultsReceivedDateText varchar(50) NULL,
	EventNotes varchar(4000) NULL,
	EnteredBy varchar(50) NULL,
	EnteredTime datetime NULL,
	UpdatedBy varchar(50) NULL,
	UpdatedTime datetime NULL,
	LockedBy varchar(50) NULL,
	LockedTime datetime NULL
	)  ON [PRIMARY]
GO
IF EXISTS(SELECT * FROM dbo.AuditLog_SpecimenEvents)
	 EXEC('INSERT INTO dbo.Tmp_AuditLog_SpecimenEvents (LoggedOperation, LoggedBy, LoggedTime, SpecimenId, ContactId, SpecimenEventId, EventPending, EventDateText, EventDate, EventTime, EventType, EventSubType, EventAnalyte, EventExtReference, EventResult, QuantityUsed, QuantityUnits, ProcessedBy, EventNotes, EnteredBy, EnteredTime, UpdatedBy, UpdatedTime, LockedBy, LockedTime)
		SELECT LoggedOperation, LoggedBy, LoggedTime, SpecimenId, ContactId, SpecimenEventId, EventPending, EventDateText, EventDate, EventTime, EventType, EventSubType, EventAnalyte, EventExtReference, EventResult, QuantityUsed, QuantityUnits, ProcessedBy, EventNotes, EnteredBy, EnteredTime, UpdatedBy, UpdatedTime, LockedBy, LockedTime FROM dbo.AuditLog_SpecimenEvents WITH (HOLDLOCK TABLOCKX)')
GO
DROP TABLE dbo.AuditLog_SpecimenEvents
GO
EXECUTE sp_rename N'dbo.Tmp_AuditLog_SpecimenEvents', N'AuditLog_SpecimenEvents', 'OBJECT' 
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
ALTER TABLE dbo.SpecimenEvents
	DROP CONSTRAINT FK_SpecimenEvents_Specimens
GO
COMMIT
BEGIN TRANSACTION
GO
ALTER TABLE dbo.SpecimenEvents
	DROP CONSTRAINT DF_SpecimenEvents_EventPending
GO
CREATE TABLE dbo.Tmp_SpecimenEvents
	(
	SpecimenId int NOT NULL,
	ContactId int NULL,
	SpecimenEventId int NOT NULL IDENTITY (1, 1),
	EventPending bit NULL,
	EventDateText varchar(50) NULL,
	EventDate datetime NULL,
	EventTime varchar(10) NULL,
	EventType varchar(255) NULL,
	EventSubType varchar(255) NULL,
	EventAnalyte varchar(50) NULL,
	EventExtReference varchar(255) NULL,
	EventResult varchar(255) NULL,
	QuantityUsed varchar(50) NULL,
	QuantityUnits varchar(50) NULL,
	ProcessedBy varchar(50) NULL,
	ResultsReceivedDate datetime NULL,
	ResultsReceivedDateText varchar(50) NULL,
	EventNotes varchar(4000) NULL,
	EnteredBy varchar(50) NOT NULL,
	EnteredTime datetime NOT NULL,
	UpdatedBy varchar(50) NULL,
	UpdatedTime datetime NULL,
	LockedBy varchar(50) NULL,
	LockedTime datetime NULL
	)  ON [PRIMARY]
GO
ALTER TABLE dbo.Tmp_SpecimenEvents ADD CONSTRAINT
	DF_SpecimenEvents_EventPending DEFAULT ((0)) FOR EventPending
GO
SET IDENTITY_INSERT dbo.Tmp_SpecimenEvents ON
GO
IF EXISTS(SELECT * FROM dbo.SpecimenEvents)
	 EXEC('INSERT INTO dbo.Tmp_SpecimenEvents (SpecimenId, ContactId, SpecimenEventId, EventPending, EventDateText, EventDate, EventTime, EventType, EventSubType, EventAnalyte, EventExtReference, EventResult, QuantityUsed, QuantityUnits, ProcessedBy, EventNotes, EnteredBy, EnteredTime, UpdatedBy, UpdatedTime, LockedBy, LockedTime)
		SELECT SpecimenId, ContactId, SpecimenEventId, EventPending, EventDateText, EventDate, EventTime, EventType, EventSubType, EventAnalyte, EventExtReference, EventResult, QuantityUsed, QuantityUnits, ProcessedBy, EventNotes, EnteredBy, EnteredTime, UpdatedBy, UpdatedTime, LockedBy, LockedTime FROM dbo.SpecimenEvents WITH (HOLDLOCK TABLOCKX)')
GO
SET IDENTITY_INSERT dbo.Tmp_SpecimenEvents OFF
GO
DROP TABLE dbo.SpecimenEvents
GO
EXECUTE sp_rename N'dbo.Tmp_SpecimenEvents', N'SpecimenEvents', 'OBJECT' 
GO
ALTER TABLE dbo.SpecimenEvents ADD CONSTRAINT
	PK_SpecimenEvent PRIMARY KEY CLUSTERED 
	(
	SpecimenEventId
	) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

GO
CREATE NONCLUSTERED INDEX I_SpecimenEvent_SpecimenId ON dbo.SpecimenEvents
	(
	SpecimenId
	) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX I_SpecimenEvent_ContactId ON dbo.SpecimenEvents
	(
	ContactId
	) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE dbo.SpecimenEvents ADD CONSTRAINT
	FK_SpecimenEvents_Specimens FOREIGN KEY
	(
	SpecimenId
	) REFERENCES dbo.Specimens
	(
	SpecimenId
	) ON UPDATE  CASCADE 
	 ON DELETE  CASCADE 
	
GO
CREATE TRIGGER [dbo].[trgAuditSpecimenEvents_UD]
ON dbo.SpecimenEvents FOR UPDATE, DELETE
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
   INSERT INTO AuditLog_SpecimenEvents
   SELECT @action AS LoggedOperation, Inserted.UpdatedBy AS LoggedBy, 
          GETDATE() AS LoggedTime, Deleted.*
   FROM Deleted INNER JOIN INSERTED
   ON Deleted.SpecimenEventId = Inserted.SpecimenEventId
ELSE IF @action = 'DELETE'
   INSERT INTO AuditLog_SpecimenEvents
   SELECT @action AS LoggedOperation, SYSTEM_USER AS LoggedBy, GETDATE() AS LoggedTime, *
   FROM Deleted
GO
sp_settriggerorder N'trgAuditSpecimenEvents_UD', N'last', N'update'
GO
COMMIT
GO
