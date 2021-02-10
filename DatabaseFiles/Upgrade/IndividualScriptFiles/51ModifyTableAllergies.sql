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
CREATE TABLE dbo.Tmp_AuditLog_Allergies
	(
	LoggedOperation varchar(50) NULL,
	LoggedBy varchar(50) NULL,
	LoggedTime datetime NULL,
	PatientId int NULL,
	AllergyId int NULL,
	Allergen varchar(255) NULL,
	AllergyResponse varchar(50) NULL,
	AllergyNotes varchar(1000) NULL,
	EnteredBy varchar(50) NULL,
	EnteredTime datetime NULL,
	UpdatedBy varchar(50) NULL,
	UpdatedTime datetime NULL,
	LockedBy varchar(50) NULL,
	LockedTime datetime NULL
	)  ON [PRIMARY]
GO
IF EXISTS(SELECT * FROM dbo.AuditLog_Allergies)
	 EXEC('INSERT INTO dbo.Tmp_AuditLog_Allergies (LoggedOperation, LoggedBy, LoggedTime, PatientId, AllergyId, Allergen, AllergyResponse, EnteredBy, EnteredTime, UpdatedBy, UpdatedTime, LockedBy, LockedTime)
		SELECT LoggedOperation, LoggedBy, LoggedTime, PatientId, AllergyId, Allergen, AllergyResponse, EnteredBy, EnteredTime, UpdatedBy, UpdatedTime, LockedBy, LockedTime FROM dbo.AuditLog_Allergies WITH (HOLDLOCK TABLOCKX)')
GO
DROP TABLE dbo.AuditLog_Allergies
GO
EXECUTE sp_rename N'dbo.Tmp_AuditLog_Allergies', N'AuditLog_Allergies', 'OBJECT' 
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
ALTER TABLE dbo.Allergies
	DROP CONSTRAINT FK_Allergies_Patients
GO
COMMIT
BEGIN TRANSACTION
GO
CREATE TABLE dbo.Tmp_Allergies
	(
	PatientId int NOT NULL,
	AllergyId int NOT NULL IDENTITY (1, 1),
	Allergen varchar(255) NOT NULL,
	AllergyResponse varchar(50) NULL,
	AllergyNotes varchar(1000) NULL,
	EnteredBy varchar(50) NOT NULL,
	EnteredTime datetime NOT NULL,
	UpdatedBy varchar(50) NULL,
	UpdatedTime datetime NULL,
	LockedBy varchar(50) NULL,
	LockedTime datetime NULL
	)  ON [PRIMARY]
GO
SET IDENTITY_INSERT dbo.Tmp_Allergies ON
GO
IF EXISTS(SELECT * FROM dbo.Allergies)
	 EXEC('INSERT INTO dbo.Tmp_Allergies (PatientId, AllergyId, Allergen, AllergyResponse, EnteredBy, EnteredTime, UpdatedBy, UpdatedTime, LockedBy, LockedTime)
		SELECT PatientId, AllergyId, Allergen, AllergyResponse, EnteredBy, EnteredTime, UpdatedBy, UpdatedTime, LockedBy, LockedTime FROM dbo.Allergies WITH (HOLDLOCK TABLOCKX)')
GO
SET IDENTITY_INSERT dbo.Tmp_Allergies OFF
GO
DROP TABLE dbo.Allergies
GO
EXECUTE sp_rename N'dbo.Tmp_Allergies', N'Allergies', 'OBJECT' 
GO
ALTER TABLE dbo.Allergies ADD CONSTRAINT
	PK_Allergies PRIMARY KEY CLUSTERED 
	(
	AllergyId
	) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

GO
CREATE NONCLUSTERED INDEX I_Allergies_PatientId ON dbo.Allergies
	(
	PatientId
	) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE dbo.Allergies WITH NOCHECK ADD CONSTRAINT
	FK_Allergies_Patients FOREIGN KEY
	(
	PatientId
	) REFERENCES dbo.Patients
	(
	PatientId
	) ON UPDATE  CASCADE 
	 ON DELETE  CASCADE 
	
GO
CREATE TRIGGER dbo.trgAuditAllergies_UD
ON dbo.Allergies FOR UPDATE, DELETE
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
   INSERT INTO AuditLog_Allergies
   SELECT @action AS LoggedOperation, Inserted.UpdatedBy AS LoggedBy, 
          GETDATE() AS LoggedTime, Deleted.*
   FROM Deleted INNER JOIN INSERTED
   ON Deleted.AllergyId = Inserted.AllergyId
ELSE IF @action = 'DELETE'
   INSERT INTO AuditLog_Allergies
   SELECT @action AS LoggedOperation, SYSTEM_USER AS LoggedBy, GETDATE() AS LoggedTime, *
   FROM Deleted
GO
sp_settriggerorder N'trgAuditAllergies_UD', N'last', N'update'
GO
COMMIT
GO
