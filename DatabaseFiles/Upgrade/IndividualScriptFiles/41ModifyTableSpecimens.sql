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
CREATE TABLE dbo.Tmp_AuditLog_Specimens
	(
	LoggedOperation varchar(50) NULL,
	LoggedBy varchar(50) NULL,
	LoggedTime datetime NULL,
	SpecimenId int NULL,
	ParentSpecimenId int NULL,
	SpecimenAccessionId int NULL,
	ContactId int NULL,
	SpecimenType varchar(50) NULL,
	SpecimenSubType varchar(50) NULL,
	SpecimenStatus varchar(100) NULL,
	SpecimenPreservationType varchar(100) NULL,
	SpecimenReferenceNumber varchar(50) NULL,
	SpecimenOriginalQty varchar(50) NULL,
	SpecimenUnits varchar(50) NULL,
	SpecimenRemainingQty varchar(50) NULL,
	BoxId int NULL,
	PositionId int NULL,
	SpecimenNotes varchar(1000) NULL,
	SpecimenNumFreezeThaw varchar(50) NULL,
	SpecimenTimeToStorage varchar(50) NULL,
	SpecimenCollectionTime varchar(50) NULL,
	SpecimenFrozenTime varchar(50) NULL,
	SpecimenVialType varchar(50) NULL,
	SpecimenVialNum varchar(50) NULL,
	EnteredBy varchar(50) NULL,
	EnteredTime datetime NULL,
	UpdatedBy varchar(50) NULL,
	UpdatedTime datetime NULL,
	LockedBy varchar(50) NULL,
	LockedTime datetime NULL
	)  ON [PRIMARY]
GO
IF EXISTS(SELECT * FROM dbo.AuditLog_Specimens)
	 EXEC('INSERT INTO dbo.Tmp_AuditLog_Specimens (LoggedOperation, LoggedBy, LoggedTime, SpecimenId, ParentSpecimenId, SpecimenAccessionId, ContactId, SpecimenType, SpecimenSubType, SpecimenStatus, SpecimenPreservationType, SpecimenReferenceNumber, SpecimenOriginalQty, SpecimenUnits, SpecimenRemainingQty, BoxId, PositionId, SpecimenNotes, SpecimenNumFreezeThaw, SpecimenTimeToStorage, EnteredBy, EnteredTime, UpdatedBy, UpdatedTime, LockedBy, LockedTime)
		SELECT LoggedOperation, LoggedBy, LoggedTime, SpecimenId, ParentSpecimenId, SpecimenAccessionId, ContactId, SpecimenType, SpecimenSubType, SpecimenStatus, SpecimenPreservationType, SpecimenReferenceNumber, SpecimenOriginalQty, SpecimenUnits, SpecimenRemainingQty, BoxId, PositionId, SpecimenNotes, SpecimenNumFreezeThaw, SpecimenTimeToStorage, EnteredBy, EnteredTime, UpdatedBy, UpdatedTime, LockedBy, LockedTime FROM dbo.AuditLog_Specimens WITH (HOLDLOCK TABLOCKX)')
GO
DROP TABLE dbo.AuditLog_Specimens
GO
EXECUTE sp_rename N'dbo.Tmp_AuditLog_Specimens', N'AuditLog_Specimens', 'OBJECT' 
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
ALTER TABLE dbo.Specimens
	DROP CONSTRAINT FK_Specimens_SpecimenAccessions
GO
COMMIT
BEGIN TRANSACTION
GO
CREATE TABLE dbo.Tmp_Specimens
	(
	SpecimenId int NOT NULL IDENTITY (1, 1),
	ParentSpecimenId int NULL,
	SpecimenAccessionId int NOT NULL,
	ContactId int NULL,
	SpecimenType varchar(50) NULL,
	SpecimenSubType varchar(50) NULL,
	SpecimenStatus varchar(100) NULL,
	SpecimenPreservationType varchar(100) NULL,
	SpecimenReferenceNumber varchar(50) NULL,
	SpecimenOriginalQty varchar(50) NULL,
	SpecimenUnits varchar(50) NULL,
	SpecimenRemainingQty varchar(50) NULL,
	BoxId int NULL,
	PositionId int NULL,
	SpecimenNotes varchar(1000) NULL,
	SpecimenNumFreezeThaw varchar(50) NULL,
	SpecimenTimeToStorage varchar(50) NULL,
	SpecimenCollectionTime varchar(50) NULL,
	SpecimenFrozenTime varchar(50) NULL,
	SpecimenVialType varchar(50) NULL,
	SpecimenVialNum varchar(50) NULL,
	EnteredBy varchar(50) NOT NULL,
	EnteredTime datetime NOT NULL,
	UpdatedBy varchar(50) NULL,
	UpdatedTime datetime NULL,
	LockedBy varchar(50) NULL,
	LockedTime datetime NULL
	)  ON [PRIMARY]
GO
SET IDENTITY_INSERT dbo.Tmp_Specimens ON
GO
IF EXISTS(SELECT * FROM dbo.Specimens)
	 EXEC('INSERT INTO dbo.Tmp_Specimens (SpecimenId, ParentSpecimenId, SpecimenAccessionId, ContactId, SpecimenType, SpecimenSubType, SpecimenStatus, SpecimenPreservationType, SpecimenReferenceNumber, SpecimenOriginalQty, SpecimenUnits, SpecimenRemainingQty, BoxId, PositionId, SpecimenNotes, SpecimenNumFreezeThaw, SpecimenTimeToStorage, EnteredBy, EnteredTime, UpdatedBy, UpdatedTime, LockedBy, LockedTime)
		SELECT SpecimenId, ParentSpecimenId, SpecimenAccessionId, ContactId, SpecimenType, SpecimenSubType, SpecimenStatus, SpecimenPreservationType, SpecimenReferenceNumber, SpecimenOriginalQty, SpecimenUnits, SpecimenRemainingQty, BoxId, PositionId, SpecimenNotes, SpecimenNumFreezeThaw, SpecimenTimeToStorage, EnteredBy, EnteredTime, UpdatedBy, UpdatedTime, LockedBy, LockedTime FROM dbo.Specimens WITH (HOLDLOCK TABLOCKX)')
GO
SET IDENTITY_INSERT dbo.Tmp_Specimens OFF
GO
ALTER TABLE dbo.Specimen_SpecimenCollections
	DROP CONSTRAINT FK_Specimen_SpecimenCollections_Specimens
GO
ALTER TABLE dbo.SpecimenEvents
	DROP CONSTRAINT FK_SpecimenEvents_Specimens
GO
DROP TABLE dbo.Specimens
GO
EXECUTE sp_rename N'dbo.Tmp_Specimens', N'Specimens', 'OBJECT' 
GO
ALTER TABLE dbo.Specimens ADD CONSTRAINT
	PK_Specimens PRIMARY KEY CLUSTERED 
	(
	SpecimenId
	) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

GO
CREATE NONCLUSTERED INDEX I_Specimens_SpecimenAccessionId ON dbo.Specimens
	(
	SpecimenAccessionId
	) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE dbo.Specimens WITH NOCHECK ADD CONSTRAINT
	FK_Specimens_SpecimenAccessions FOREIGN KEY
	(
	SpecimenAccessionId
	) REFERENCES dbo.SpecimenAccessions
	(
	SpecimenAccessionId
	) ON UPDATE  NO ACTION 
	 ON DELETE  NO ACTION 
	
GO
CREATE TRIGGER [dbo].[trgAuditSpecimens_UD]
ON dbo.Specimens FOR UPDATE, DELETE
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
   INSERT INTO AuditLog_Specimens
   SELECT @action AS LoggedOperation, Inserted.UpdatedBy AS LoggedBy, 
          GETDATE() AS LoggedTime, Deleted.*
   FROM Deleted INNER JOIN INSERTED
   ON Deleted.SpecimenId = Inserted.SpecimenId
ELSE IF @action = 'DELETE'
   BEGIN
	   INSERT INTO AuditLog_Specimens
	   SELECT @action AS LoggedOperation, SYSTEM_USER AS LoggedBy, GETDATE() AS LoggedTime, *
	   FROM Deleted

	   DELETE SpecimenPositions FROM SpecimenPositions INNER JOIN Deleted ON 
							   SpecimenPositions.PositionId=Deleted.PositionId
   END
GO
COMMIT
BEGIN TRANSACTION
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
COMMIT
BEGIN TRANSACTION
GO
ALTER TABLE dbo.Specimen_SpecimenCollections ADD CONSTRAINT
	FK_Specimen_SpecimenCollections_Specimens FOREIGN KEY
	(
	SpecimenId
	) REFERENCES dbo.Specimens
	(
	SpecimenId
	) ON UPDATE  CASCADE 
	 ON DELETE  CASCADE 
	
GO
COMMIT
GO
