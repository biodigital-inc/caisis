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
CREATE TABLE dbo.Tmp_AuditLog_SpecimenAccessions
	(
	LoggedOperation varchar(50) NULL,
	LoggedBy varchar(50) NULL,
	LoggedTime datetime NULL,
	SpecimenAccessionId int NULL,
	PatientId int NULL,
	PathologyReferenceNumber varchar(50) NULL,
	AccessionProcName varchar(50) NULL,
	AccessionDateText varchar(20) NULL,
	AccessionDate datetime NULL,
	AccessionInstitution varchar(50) NULL,
	AccessionDepartment varchar(50) NULL,
	AccessionTime varchar(10) NULL,
	PathologyLab varchar(50) NULL,
	DateBanked datetime NULL,
	TimeReceivedInLab varchar(10) NULL,
	TimeFrozen varchar(10) NULL,
	HoldingCondition varchar(20) NULL,
	NumberTubesEDTA varchar(10) NULL,
	NumberTubesClotted varchar(10) NULL,
	NumberTubesGel varchar(10) NULL,
	NumberTubesOther varchar(10) NULL,
	NumberTubesOtherType varchar(10) NULL,
	AccessionAnatomicSite varchar(50) NULL,
	AccessionVisitType varchar(50) NULL,
	AccessionNotes varchar(1000) NULL,
	EnteredBy varchar(50) NULL,
	EnteredTime datetime NULL,
	UpdatedBy varchar(50) NULL,
	UpdatedTime datetime NULL,
	LockedBy varchar(50) NULL,
	LockedTime datetime NULL
	)  ON [PRIMARY]
GO
IF EXISTS(SELECT * FROM dbo.AuditLog_SpecimenAccessions)
	 EXEC('INSERT INTO dbo.Tmp_AuditLog_SpecimenAccessions (LoggedOperation, LoggedBy, LoggedTime, SpecimenAccessionId, PatientId, PathologyReferenceNumber, AccessionProcName, AccessionDateText, AccessionDate, AccessionInstitution, AccessionDepartment, AccessionTime, PathologyLab, DateBanked, TimeReceivedInLab, TimeFrozen, HoldingCondition, NumberTubesEDTA, NumberTubesClotted, NumberTubesGel, NumberTubesOther, NumberTubesOtherType, AccessionNotes, EnteredBy, EnteredTime, UpdatedBy, UpdatedTime, LockedBy, LockedTime)
		SELECT LoggedOperation, LoggedBy, LoggedTime, SpecimenAccessionId, PatientId, PathologyReferenceNumber, AccessionProcName, AccessionDateText, AccessionDate, AccessionInstitution, AccessionDepartment, AccessionTime, PathologyLab, DateBanked, TimeReceivedInLab, TimeFrozen, HoldingCondition, NumberTubesEDTA, NumberTubesClotted, NumberTubesGel, NumberTubesOther, NumberTubesOtherType, AccessionNotes, EnteredBy, EnteredTime, UpdatedBy, UpdatedTime, LockedBy, LockedTime FROM dbo.AuditLog_SpecimenAccessions WITH (HOLDLOCK TABLOCKX)')
GO
DROP TABLE dbo.AuditLog_SpecimenAccessions
GO
EXECUTE sp_rename N'dbo.Tmp_AuditLog_SpecimenAccessions', N'AuditLog_SpecimenAccessions', 'OBJECT' 
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
CREATE TABLE dbo.Tmp_SpecimenAccessions
	(
	SpecimenAccessionId int NOT NULL IDENTITY (1, 1),
	PatientId int NULL,
	PathologyReferenceNumber varchar(50) NULL,
	AccessionProcName varchar(50) NULL,
	AccessionDateText varchar(20) NULL,
	AccessionDate datetime NULL,
	AccessionInstitution varchar(50) NULL,
	AccessionDepartment varchar(50) NULL,
	AccessionTime varchar(10) NULL,
	PathologyLab varchar(50) NULL,
	DateBanked datetime NULL,
	TimeReceivedInLab varchar(10) NULL,
	TimeFrozen varchar(10) NULL,
	HoldingCondition varchar(20) NULL,
	NumberTubesEDTA varchar(10) NULL,
	NumberTubesClotted varchar(10) NULL,
	NumberTubesGel varchar(10) NULL,
	NumberTubesOther varchar(10) NULL,
	NumberTubesOtherType varchar(10) NULL,
	AccessionAnatomicSite varchar(50) NULL,
	AccessionVisitType varchar(50) NULL,
	AccessionNotes varchar(1000) NULL,
	EnteredBy varchar(50) NOT NULL,
	EnteredTime datetime NOT NULL,
	UpdatedBy varchar(50) NULL,
	UpdatedTime datetime NULL,
	LockedBy varchar(50) NULL,
	LockedTime datetime NULL
	)  ON [PRIMARY]
GO
SET IDENTITY_INSERT dbo.Tmp_SpecimenAccessions ON
GO
IF EXISTS(SELECT * FROM dbo.SpecimenAccessions)
	 EXEC('INSERT INTO dbo.Tmp_SpecimenAccessions (SpecimenAccessionId, PatientId, PathologyReferenceNumber, AccessionProcName, AccessionDateText, AccessionDate, AccessionInstitution, AccessionDepartment, AccessionTime, PathologyLab, DateBanked, TimeReceivedInLab, TimeFrozen, HoldingCondition, NumberTubesEDTA, NumberTubesClotted, NumberTubesGel, NumberTubesOther, NumberTubesOtherType, AccessionNotes, EnteredBy, EnteredTime, UpdatedBy, UpdatedTime, LockedBy, LockedTime)
		SELECT SpecimenAccessionId, PatientId, PathologyReferenceNumber, AccessionProcName, AccessionDateText, AccessionDate, AccessionInstitution, AccessionDepartment, AccessionTime, PathologyLab, DateBanked, TimeReceivedInLab, TimeFrozen, HoldingCondition, NumberTubesEDTA, NumberTubesClotted, NumberTubesGel, NumberTubesOther, NumberTubesOtherType, AccessionNotes, EnteredBy, EnteredTime, UpdatedBy, UpdatedTime, LockedBy, LockedTime FROM dbo.SpecimenAccessions WITH (HOLDLOCK TABLOCKX)')
GO
SET IDENTITY_INSERT dbo.Tmp_SpecimenAccessions OFF
GO
ALTER TABLE dbo.Specimens
	DROP CONSTRAINT FK_Specimens_SpecimenAccessions
GO
DROP TABLE dbo.SpecimenAccessions
GO
EXECUTE sp_rename N'dbo.Tmp_SpecimenAccessions', N'SpecimenAccessions', 'OBJECT' 
GO
ALTER TABLE dbo.SpecimenAccessions ADD CONSTRAINT
	PK_SpecimenAccessions PRIMARY KEY CLUSTERED 
	(
	SpecimenAccessionId
	) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

GO
CREATE NONCLUSTERED INDEX I_SpecimenAccessions_PatientId ON dbo.SpecimenAccessions
	(
	PatientId
	) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
CREATE TRIGGER dbo.trgAuditSpecimenAccessions_UD
ON dbo.SpecimenAccessions FOR UPDATE, DELETE
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
   INSERT INTO AuditLog_SpecimenAccessions
   SELECT @action AS LoggedOperation, Inserted.UpdatedBy AS LoggedBy, 
          GETDATE() AS LoggedTime, Deleted.*
   FROM Deleted INNER JOIN INSERTED
   ON Deleted.SpecimenAccessionId = Inserted.SpecimenAccessionId
ELSE IF @action = 'DELETE'
   INSERT INTO AuditLog_SpecimenAccessions
   SELECT @action AS LoggedOperation, SYSTEM_USER AS LoggedBy, GETDATE() AS LoggedTime, *
   FROM Deleted
GO
COMMIT
BEGIN TRANSACTION
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
COMMIT
GO
