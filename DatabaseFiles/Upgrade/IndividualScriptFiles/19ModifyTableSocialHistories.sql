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
CREATE TABLE dbo.Tmp_AuditLog_SocialHistories
	(
	LoggedOperation varchar(50) NULL,
	LoggedBy varchar(50) NULL,
	LoggedTime datetime NULL,
	PatientId int NULL,
	SocHxOccupation varchar(50) NULL,
	SocHxMaritalStatus varchar(50) NULL,
	SocHxChildren varchar(50) NULL,
	SocHxTobaccoType varchar(50) NULL,
	SocHxTobaccoPacksPerDay varchar(50) NULL,
	SocHxTobaccoPacksPerYear varchar(50) NULL,
	SocHxTobaccoYears varchar(50) NULL,
	SocHxTobaccoQuitYear varchar(50) NULL,
	SocHxCarcinogen varchar(50) NULL,
	SocHxAlcohol varchar(50) NULL,
	SocHxAlcoholDrinksPerDay varchar(50) NULL,
	SocHxAlcoholYears varchar(50) NULL,
	SocHxAlcoholQuitYear varchar(50) NULL,
	SocHxOther varchar(255) NULL,
	SocHxMenarcheAge varchar(50) NULL,
	SocHxMenopauseAge varchar(50) NULL,
	SocHxMenopauseStatus varchar(50) NULL,
	SocHxGravida varchar(50) NULL,
	SocHxParity varchar(50) NULL,
	SocHxFirstBirthAge varchar(50) NULL,
	SocHxNotes varchar(1000) NULL,
	SocHxDataSource varchar(100) NULL,
	SocHxQuality varchar(50) NULL,
	EnteredBy varchar(50) NULL,
	EnteredTime datetime NULL,
	UpdatedBy varchar(50) NULL,
	UpdatedTime datetime NULL,
	LockedBy varchar(50) NULL,
	LockedTime datetime NULL
	)  ON [PRIMARY]
GO
IF EXISTS(SELECT * FROM dbo.AuditLog_SocialHistories)
	 EXEC('INSERT INTO dbo.Tmp_AuditLog_SocialHistories (LoggedOperation, LoggedBy, LoggedTime, PatientId, SocHxOccupation, SocHxMaritalStatus, SocHxChildren, SocHxTobaccoType, SocHxTobaccoPacksPerDay, SocHxTobaccoPacksPerYear, SocHxTobaccoYears, SocHxTobaccoQuitYear, SocHxCarcinogen, SocHxAlcohol, SocHxAlcoholDrinksPerDay, SocHxAlcoholYears, SocHxAlcoholQuitYear, SocHxOther, SocHxMenarcheAge, SocHxMenopauseAge, SocHxGravida, SocHxParity, SocHxFirstBirthAge, SocHxNotes, SocHxDataSource, SocHxQuality, EnteredBy, EnteredTime, UpdatedBy, UpdatedTime, LockedBy, LockedTime)
		SELECT LoggedOperation, LoggedBy, LoggedTime, PatientId, SocHxOccupation, SocHxMaritalStatus, SocHxChildren, SocHxTobaccoType, SocHxTobaccoPacksPerDay, SocHxTobaccoPacksPerYear, SocHxTobaccoYears, SocHxTobaccoQuitYear, SocHxCarcinogen, SocHxAlcohol, SocHxAlcoholDrinksPerDay, SocHxAlcoholYears, SocHxAlcoholQuitYear, SocHxOther, SocHxMenarcheAge, SocHxMenopauseAge, SocHxGravida, SocHxParity, SocHxFirstBirthAge, SocHxNotes, SocHxDataSource, SocHxQuality, EnteredBy, EnteredTime, UpdatedBy, UpdatedTime, LockedBy, LockedTime FROM dbo.AuditLog_SocialHistories WITH (HOLDLOCK TABLOCKX)')
GO
DROP TABLE dbo.AuditLog_SocialHistories
GO
EXECUTE sp_rename N'dbo.Tmp_AuditLog_SocialHistories', N'AuditLog_SocialHistories', 'OBJECT' 
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
ALTER TABLE dbo.SocialHistories
	DROP CONSTRAINT FK_SocialHistories_Patients
GO
COMMIT
BEGIN TRANSACTION
GO
CREATE TABLE dbo.Tmp_SocialHistories
	(
	PatientId int NOT NULL,
	SocHxOccupation varchar(50) NULL,
	SocHxMaritalStatus varchar(50) NULL,
	SocHxChildren varchar(50) NULL,
	SocHxTobaccoType varchar(50) NULL,
	SocHxTobaccoPacksPerDay varchar(50) NULL,
	SocHxTobaccoPacksPerYear varchar(50) NULL,
	SocHxTobaccoYears varchar(50) NULL,
	SocHxTobaccoQuitYear varchar(50) NULL,
	SocHxCarcinogen varchar(50) NULL,
	SocHxAlcohol varchar(50) NULL,
	SocHxAlcoholDrinksPerDay varchar(50) NULL,
	SocHxAlcoholYears varchar(50) NULL,
	SocHxAlcoholQuitYear varchar(50) NULL,
	SocHxOther varchar(255) NULL,
	SocHxMenarcheAge varchar(50) NULL,
	SocHxMenopauseAge varchar(50) NULL,
	SocHxMenopauseStatus varchar(50) NULL,
	SocHxGravida varchar(50) NULL,
	SocHxParity varchar(50) NULL,
	SocHxFirstBirthAge varchar(50) NULL,
	SocHxNotes varchar(1000) NULL,
	SocHxDataSource varchar(100) NULL,
	SocHxQuality varchar(50) NULL,
	EnteredBy varchar(50) NOT NULL,
	EnteredTime datetime NOT NULL,
	UpdatedBy varchar(50) NULL,
	UpdatedTime datetime NULL,
	LockedBy varchar(50) NULL,
	LockedTime datetime NULL
	)  ON [PRIMARY]
GO
IF EXISTS(SELECT * FROM dbo.SocialHistories)
	 EXEC('INSERT INTO dbo.Tmp_SocialHistories (PatientId, SocHxOccupation, SocHxMaritalStatus, SocHxChildren, SocHxTobaccoType, SocHxTobaccoPacksPerDay, SocHxTobaccoPacksPerYear, SocHxTobaccoYears, SocHxTobaccoQuitYear, SocHxCarcinogen, SocHxAlcohol, SocHxAlcoholDrinksPerDay, SocHxAlcoholYears, SocHxAlcoholQuitYear, SocHxOther, SocHxMenarcheAge, SocHxMenopauseAge, SocHxGravida, SocHxParity, SocHxFirstBirthAge, SocHxNotes, SocHxDataSource, SocHxQuality, EnteredBy, EnteredTime, UpdatedBy, UpdatedTime, LockedBy, LockedTime)
		SELECT PatientId, SocHxOccupation, SocHxMaritalStatus, SocHxChildren, SocHxTobaccoType, SocHxTobaccoPacksPerDay, SocHxTobaccoPacksPerYear, SocHxTobaccoYears, SocHxTobaccoQuitYear, SocHxCarcinogen, SocHxAlcohol, SocHxAlcoholDrinksPerDay, SocHxAlcoholYears, SocHxAlcoholQuitYear, SocHxOther, SocHxMenarcheAge, SocHxMenopauseAge, SocHxGravida, SocHxParity, SocHxFirstBirthAge, SocHxNotes, SocHxDataSource, SocHxQuality, EnteredBy, EnteredTime, UpdatedBy, UpdatedTime, LockedBy, LockedTime FROM dbo.SocialHistories WITH (HOLDLOCK TABLOCKX)')
GO
DROP TABLE dbo.SocialHistories
GO
EXECUTE sp_rename N'dbo.Tmp_SocialHistories', N'SocialHistories', 'OBJECT' 
GO
ALTER TABLE dbo.SocialHistories ADD CONSTRAINT
	PK_SocialHistories PRIMARY KEY CLUSTERED 
	(
	PatientId
	) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

GO
ALTER TABLE dbo.SocialHistories WITH NOCHECK ADD CONSTRAINT
	FK_SocialHistories_Patients FOREIGN KEY
	(
	PatientId
	) REFERENCES dbo.Patients
	(
	PatientId
	) ON UPDATE  CASCADE 
	 ON DELETE  CASCADE 
	
GO
CREATE TRIGGER dbo.trgAuditSocialHistories_UD
ON dbo.SocialHistories FOR UPDATE, DELETE
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
   INSERT INTO AuditLog_SocialHistories
   SELECT @action AS LoggedOperation, Inserted.UpdatedBy AS LoggedBy, 
          GETDATE() AS LoggedTime, Deleted.*
   FROM Deleted INNER JOIN INSERTED
   ON Deleted.PatientId = Inserted.PatientId
ELSE IF @action = 'DELETE'
   INSERT INTO AuditLog_SocialHistories
   SELECT @action AS LoggedOperation, SYSTEM_USER AS LoggedBy, GETDATE() AS LoggedTime, *
   FROM Deleted
GO
sp_settriggerorder N'trgAuditSocialHistories_UD', N'last', N'update'
GO
COMMIT
GO
