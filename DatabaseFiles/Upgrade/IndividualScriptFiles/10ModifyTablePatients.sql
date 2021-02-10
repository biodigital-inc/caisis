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
CREATE TABLE dbo.Tmp_AuditLog_Patients
	(
	LoggedOperation varchar(50) NULL,
	LoggedBy varchar(50) NULL,
	LoggedTime datetime NULL,
	PtMRN varchar(50) NULL,
	PatientId int NULL,
	PtTitle varchar(50) NULL,
	PtFirstName varchar(50) NULL,
	PtMiddleName varchar(50) NULL,
	PtLastName varchar(50) NULL,
	PtSuffix varchar(50) NULL,
	PtAlias varchar(50) NULL,
	PtMaidenName varchar(50) NULL,
	PtGender varchar(50) NULL,
	PtCompany varchar(50) NULL,
	PtBusinessCity varchar(50) NULL,
	PtBusinessState varchar(50) NULL,
	PtAddress1 varchar(100) NULL,
	PtAddress2 varchar(100) NULL,
	PtCity varchar(50) NULL,
	PtState varchar(50) NULL,
	PtPostalCode varchar(50) NULL,
	PtCountry varchar(50) NULL,
	PtEmail varchar(50) NULL,
	PtBirthDateText varchar(50) NULL,
	PtBirthDate datetime NULL,
	PtBirthPlace varchar(100) NULL,
	PtDeathDateText varchar(50) NULL,
	PtDeathDate datetime NULL,
	PtDeathType varchar(50) NULL,
	PtDeathCause varchar(255) NULL,
	PtContactPerson varchar(50) NULL,
	PtContactAddress1 varchar(100) NULL,
	PtContactAddress2 varchar(100) NULL,
	PtContactCity varchar(50) NULL,
	PtContactState varchar(50) NULL,
	PtContactPostalCode varchar(50) NULL,
	PtContactPhone varchar(50) NULL,
	PtSpouse varchar(50) NULL,
	PtRace varchar(50) NULL,
	PtEthnicity varchar(50) NULL,
	PtLanguage varchar(50) NULL,
	PtContactStatus varchar(50) NULL,
	PtContactPreference varchar(50) NULL,
	PtNotes varchar(1000) NULL,
	EnteredBy varchar(50) NULL,
	EnteredTime datetime NULL,
	UpdatedBy varchar(50) NULL,
	UpdatedTime datetime NULL,
	LockedBy varchar(50) NULL,
	LockedTime datetime NULL
	)  ON [PRIMARY]
GO
IF EXISTS(SELECT * FROM dbo.AuditLog_Patients)
	 EXEC('INSERT INTO dbo.Tmp_AuditLog_Patients (LoggedOperation, LoggedBy, LoggedTime, PtMRN, PatientId, PtTitle, PtFirstName, PtMiddleName, PtLastName, PtSuffix, PtAlias, PtMaidenName, PtGender, PtCompany, PtBusinessCity, PtBusinessState, PtAddress1, PtAddress2, PtCity, PtState, PtPostalCode, PtCountry, PtEmail, PtBirthDateText, PtBirthDate, PtBirthPlace, PtDeathDateText, PtDeathDate, PtDeathType, PtDeathCause, PtContactPerson, PtContactAddress1, PtContactAddress2, PtContactCity, PtContactState, PtContactPostalCode, PtContactPhone, PtSpouse, PtRace, PtEthnicity, PtLanguage, PtContactStatus, PtNotes, EnteredBy, EnteredTime, UpdatedBy, UpdatedTime, LockedBy, LockedTime)
		SELECT LoggedOperation, LoggedBy, LoggedTime, PtMRN, PatientId, PtTitle, PtFirstName, PtMiddleName, PtLastName, PtSuffix, PtAlias, PtMaidenName, PtGender, PtCompany, PtBusinessCity, PtBusinessState, PtAddress1, PtAddress2, PtCity, PtState, PtPostalCode, PtCountry, PtEmail, PtBirthDateText, PtBirthDate, PtBirthPlace, PtDeathDateText, PtDeathDate, PtDeathType, PtDeathCause, PtContactPerson, PtContactAddress1, PtContactAddress2, PtContactCity, PtContactState, PtContactPostalCode, PtContactPhone, PtSpouse, PtRace, PtEthnicity, PtLanguage, PtContactStatus, PtNotes, EnteredBy, EnteredTime, UpdatedBy, UpdatedTime, LockedBy, LockedTime FROM dbo.AuditLog_Patients WITH (HOLDLOCK TABLOCKX)')
GO
DROP TABLE dbo.AuditLog_Patients
GO
EXECUTE sp_rename N'dbo.Tmp_AuditLog_Patients', N'AuditLog_Patients', 'OBJECT' 
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
CREATE TABLE dbo.Tmp_Patients
	(
	PtMRN varchar(50) NULL,
	PatientId int NOT NULL IDENTITY (1, 1),
	PtTitle varchar(50) NULL,
	PtFirstName varchar(50) NULL,
	PtMiddleName varchar(50) NULL,
	PtLastName varchar(50) NULL,
	PtSuffix varchar(50) NULL,
	PtAlias varchar(50) NULL,
	PtMaidenName varchar(50) NULL,
	PtGender varchar(50) NULL,
	PtCompany varchar(50) NULL,
	PtBusinessCity varchar(50) NULL,
	PtBusinessState varchar(50) NULL,
	PtAddress1 varchar(100) NULL,
	PtAddress2 varchar(100) NULL,
	PtCity varchar(50) NULL,
	PtState varchar(50) NULL,
	PtPostalCode varchar(50) NULL,
	PtCountry varchar(50) NULL,
	PtEmail varchar(50) NULL,
	PtBirthDateText varchar(50) NULL,
	PtBirthDate datetime NULL,
	PtBirthPlace varchar(100) NULL,
	PtDeathDateText varchar(50) NULL,
	PtDeathDate datetime NULL,
	PtDeathType varchar(50) NULL,
	PtDeathCause varchar(255) NULL,
	PtContactPerson varchar(50) NULL,
	PtContactAddress1 varchar(100) NULL,
	PtContactAddress2 varchar(100) NULL,
	PtContactCity varchar(50) NULL,
	PtContactState varchar(50) NULL,
	PtContactPostalCode varchar(50) NULL,
	PtContactPhone varchar(50) NULL,
	PtSpouse varchar(50) NULL,
	PtRace varchar(50) NULL,
	PtEthnicity varchar(50) NULL,
	PtLanguage varchar(50) NULL,
	PtContactStatus varchar(50) NULL,
	PtContactPreference varchar(50) NULL,
	PtNotes varchar(1000) NULL,
	EnteredBy varchar(50) NOT NULL,
	EnteredTime datetime NOT NULL,
	UpdatedBy varchar(50) NULL,
	UpdatedTime datetime NULL,
	LockedBy varchar(50) NULL,
	LockedTime datetime NULL
	)  ON [PRIMARY]
GO
SET IDENTITY_INSERT dbo.Tmp_Patients ON
GO
IF EXISTS(SELECT * FROM dbo.Patients)
	 EXEC('INSERT INTO dbo.Tmp_Patients (PtMRN, PatientId, PtTitle, PtFirstName, PtMiddleName, PtLastName, PtSuffix, PtAlias, PtMaidenName, PtGender, PtCompany, PtBusinessCity, PtBusinessState, PtAddress1, PtAddress2, PtCity, PtState, PtPostalCode, PtCountry, PtEmail, PtBirthDateText, PtBirthDate, PtBirthPlace, PtDeathDateText, PtDeathDate, PtDeathType, PtDeathCause, PtContactPerson, PtContactAddress1, PtContactAddress2, PtContactCity, PtContactState, PtContactPostalCode, PtContactPhone, PtSpouse, PtRace, PtEthnicity, PtLanguage, PtContactStatus, PtNotes, EnteredBy, EnteredTime, UpdatedBy, UpdatedTime, LockedBy, LockedTime)
		SELECT PtMRN, PatientId, PtTitle, PtFirstName, PtMiddleName, PtLastName, PtSuffix, PtAlias, PtMaidenName, PtGender, PtCompany, PtBusinessCity, PtBusinessState, PtAddress1, PtAddress2, PtCity, PtState, PtPostalCode, PtCountry, PtEmail, PtBirthDateText, PtBirthDate, PtBirthPlace, PtDeathDateText, PtDeathDate, PtDeathType, PtDeathCause, PtContactPerson, PtContactAddress1, PtContactAddress2, PtContactCity, PtContactState, PtContactPostalCode, PtContactPhone, PtSpouse, PtRace, PtEthnicity, PtLanguage, PtContactStatus, PtNotes, EnteredBy, EnteredTime, UpdatedBy, UpdatedTime, LockedBy, LockedTime FROM dbo.Patients WITH (HOLDLOCK TABLOCKX)')
GO
SET IDENTITY_INSERT dbo.Tmp_Patients OFF
GO
ALTER TABLE dbo.Encounters
	DROP CONSTRAINT FK_Encounters_Patients
GO
ALTER TABLE dbo.FamilyMembers
	DROP CONSTRAINT FK_FamilyMembers_Patients
GO
ALTER TABLE dbo.BrachyTherapy
	DROP CONSTRAINT FK_BrachyTherapy_Patients
GO
ALTER TABLE dbo.PatientPhysicians
	DROP CONSTRAINT FK_PatientPhysicians_Patients
GO
ALTER TABLE dbo.AbsentEvents
	DROP CONSTRAINT FK_AbsentEvents_Patients
GO
ALTER TABLE dbo.PatientProblems
	DROP CONSTRAINT FK_PatientProblems_Patients
GO
ALTER TABLE dbo.Comorbidities
	DROP CONSTRAINT FK_Comorbidities_Patients
GO
ALTER TABLE dbo.DietaryIntake
	DROP CONSTRAINT FK_DietaryIntake_Patients
GO
ALTER TABLE dbo.PatientConsent
	DROP CONSTRAINT FK_PatientConsent_Patients
GO
ALTER TABLE dbo.Status
	DROP CONSTRAINT FK_Status_Patients
GO
ALTER TABLE dbo.EForms
	DROP CONSTRAINT FK_EForms_Patients
GO
ALTER TABLE dbo.PatientProtocols
	DROP CONSTRAINT FK_PatientProtocols_Patients
GO
ALTER TABLE dbo.Toxicities
	DROP CONSTRAINT FK_Toxicities_Patients
GO
ALTER TABLE dbo.ProtocolMgr_PatientSchemas
	DROP CONSTRAINT FK_ProtocolMgr_PatientSchemas_Patients
GO
ALTER TABLE dbo.Allergies
	DROP CONSTRAINT FK_Allergies_Patients
GO
ALTER TABLE dbo.Categories
	DROP CONSTRAINT FK_Categories_Patients
GO
ALTER TABLE dbo.Identifiers
	DROP CONSTRAINT FK_Identifiers_Patients
GO
ALTER TABLE dbo.Narratives
	DROP CONSTRAINT FK_Narratives_Patients
GO
ALTER TABLE dbo.Actions
	DROP CONSTRAINT FK_Actions_Patients
GO
ALTER TABLE dbo.Surveys
	DROP CONSTRAINT FK_Surveys_Patients
GO
ALTER TABLE dbo.PatientPhoneNumbers
	DROP CONSTRAINT FK_PatientPhoneNumbers_Patients
GO
ALTER TABLE dbo.SocialHistories
	DROP CONSTRAINT FK_SocialHistories_Patients
GO
ALTER TABLE dbo.Procedures
	DROP CONSTRAINT FK_Procedures_Patients
GO
ALTER TABLE dbo.OperatingRoomDetails
	DROP CONSTRAINT FK_OperatingRoomDetails_Patients
GO
ALTER TABLE dbo.ClinicalStages
	DROP CONSTRAINT FK_ClinicalStages_Patients
GO
ALTER TABLE dbo.QOL_Therapy
	DROP CONSTRAINT FK_QOL_Therapy_Patients
GO
ALTER TABLE dbo.Medications
	DROP CONSTRAINT FK_Medications_Patients
GO
ALTER TABLE dbo.LabTests
	DROP CONSTRAINT FK_LabTests_Patients
GO
ALTER TABLE dbo.Pathology
	DROP CONSTRAINT FK_Pathology_Patients
GO
ALTER TABLE dbo.Hospitalizations
	DROP CONSTRAINT FK_Hospitalizations_Patients
GO
ALTER TABLE dbo.MedicalTherapy
	DROP CONSTRAINT FK_MedicalTherapy_Patients
GO
ALTER TABLE dbo.RadiationTherapy
	DROP CONSTRAINT FK_RadiationTherapy_Patients
GO
ALTER TABLE dbo.Diagnostics
	DROP CONSTRAINT FK_Diagnostics_Patients
GO
ALTER TABLE dbo.PatientDiseases
	DROP CONSTRAINT FK_PatientDiseases_Patients
GO
ALTER TABLE dbo.PatientInstitutions
	DROP CONSTRAINT FK_PatientInstitutions_Patients
GO
DROP TABLE dbo.Patients
GO
EXECUTE sp_rename N'dbo.Tmp_Patients', N'Patients', 'OBJECT' 
GO
ALTER TABLE dbo.Patients ADD CONSTRAINT
	PK_Patients PRIMARY KEY CLUSTERED 
	(
	PatientId
	) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

GO
CREATE NONCLUSTERED INDEX I_Patients_PtMRN ON dbo.Patients
	(
	PtMRN
	) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX I_Patients_PtLastName ON dbo.Patients
	(
	PtLastName
	) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
CREATE TRIGGER dbo.trgAuditPatients_UD
ON dbo.Patients FOR UPDATE, DELETE
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
   INSERT INTO AuditLog_Patients
   SELECT @action AS LoggedOperation, Inserted.UpdatedBy AS LoggedBy, 
          GETDATE() AS LoggedTime, Deleted.*
   FROM Deleted INNER JOIN INSERTED
   ON Deleted.PatientId = Inserted.PatientId
ELSE IF @action = 'DELETE'
   INSERT INTO AuditLog_Patients
   SELECT @action AS LoggedOperation, SYSTEM_USER AS LoggedBy, GETDATE() AS LoggedTime, *
   FROM Deleted
GO
sp_settriggerorder N'trgAuditPatients_UD', N'last', N'update'
GO
COMMIT
BEGIN TRANSACTION
GO
ALTER TABLE dbo.PatientInstitutions ADD CONSTRAINT
	FK_PatientInstitutions_Patients FOREIGN KEY
	(
	PatientId
	) REFERENCES dbo.Patients
	(
	PatientId
	) ON UPDATE  CASCADE 
	 ON DELETE  CASCADE 
	
GO
COMMIT
BEGIN TRANSACTION
GO
ALTER TABLE dbo.PatientDiseases WITH NOCHECK ADD CONSTRAINT
	FK_PatientDiseases_Patients FOREIGN KEY
	(
	PatientId
	) REFERENCES dbo.Patients
	(
	PatientId
	) ON UPDATE  CASCADE 
	 ON DELETE  CASCADE 
	
GO
COMMIT
BEGIN TRANSACTION
GO
ALTER TABLE dbo.Diagnostics WITH NOCHECK ADD CONSTRAINT
	FK_Diagnostics_Patients FOREIGN KEY
	(
	PatientId
	) REFERENCES dbo.Patients
	(
	PatientId
	) ON UPDATE  CASCADE 
	 ON DELETE  CASCADE 
	
GO
COMMIT
BEGIN TRANSACTION
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
COMMIT
BEGIN TRANSACTION
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
COMMIT
BEGIN TRANSACTION
GO
ALTER TABLE dbo.Hospitalizations ADD CONSTRAINT
	FK_Hospitalizations_Patients FOREIGN KEY
	(
	PatientId
	) REFERENCES dbo.Patients
	(
	PatientId
	) ON UPDATE  CASCADE 
	 ON DELETE  CASCADE 
	
GO
COMMIT
BEGIN TRANSACTION
GO
ALTER TABLE dbo.Pathology WITH NOCHECK ADD CONSTRAINT
	FK_Pathology_Patients FOREIGN KEY
	(
	PatientId
	) REFERENCES dbo.Patients
	(
	PatientId
	) ON UPDATE  CASCADE 
	 ON DELETE  CASCADE 
	 NOT FOR REPLICATION

GO
COMMIT
BEGIN TRANSACTION
GO
ALTER TABLE dbo.LabTests WITH NOCHECK ADD CONSTRAINT
	FK_LabTests_Patients FOREIGN KEY
	(
	PatientId
	) REFERENCES dbo.Patients
	(
	PatientId
	) ON UPDATE  CASCADE 
	 ON DELETE  CASCADE 
	
GO
COMMIT
BEGIN TRANSACTION
GO
ALTER TABLE dbo.Medications WITH NOCHECK ADD CONSTRAINT
	FK_Medications_Patients FOREIGN KEY
	(
	PatientId
	) REFERENCES dbo.Patients
	(
	PatientId
	) ON UPDATE  CASCADE 
	 ON DELETE  CASCADE 
	
GO
COMMIT
BEGIN TRANSACTION
GO
ALTER TABLE dbo.QOL_Therapy WITH NOCHECK ADD CONSTRAINT
	FK_QOL_Therapy_Patients FOREIGN KEY
	(
	PatientId
	) REFERENCES dbo.Patients
	(
	PatientId
	) ON UPDATE  CASCADE 
	 ON DELETE  CASCADE 
	
GO
COMMIT
BEGIN TRANSACTION
GO
ALTER TABLE dbo.ClinicalStages WITH NOCHECK ADD CONSTRAINT
	FK_ClinicalStages_Patients FOREIGN KEY
	(
	PatientId
	) REFERENCES dbo.Patients
	(
	PatientId
	) ON UPDATE  CASCADE 
	 ON DELETE  CASCADE 
	
GO
COMMIT
BEGIN TRANSACTION
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
COMMIT
BEGIN TRANSACTION
GO
ALTER TABLE dbo.Procedures WITH NOCHECK ADD CONSTRAINT
	FK_Procedures_Patients FOREIGN KEY
	(
	PatientId
	) REFERENCES dbo.Patients
	(
	PatientId
	) ON UPDATE  CASCADE 
	 ON DELETE  CASCADE 
	 NOT FOR REPLICATION

GO
COMMIT
BEGIN TRANSACTION
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
COMMIT
BEGIN TRANSACTION
GO
ALTER TABLE dbo.PatientPhoneNumbers WITH NOCHECK ADD CONSTRAINT
	FK_PatientPhoneNumbers_Patients FOREIGN KEY
	(
	PatientId
	) REFERENCES dbo.Patients
	(
	PatientId
	) ON UPDATE  CASCADE 
	 ON DELETE  CASCADE 
	
GO
COMMIT
BEGIN TRANSACTION
GO
ALTER TABLE dbo.Surveys WITH NOCHECK ADD CONSTRAINT
	FK_Surveys_Patients FOREIGN KEY
	(
	PatientId
	) REFERENCES dbo.Patients
	(
	PatientId
	) ON UPDATE  CASCADE 
	 ON DELETE  CASCADE 
	
GO
COMMIT
BEGIN TRANSACTION
GO
ALTER TABLE dbo.Actions WITH NOCHECK ADD CONSTRAINT
	FK_Actions_Patients FOREIGN KEY
	(
	PatientId
	) REFERENCES dbo.Patients
	(
	PatientId
	) ON UPDATE  CASCADE 
	 ON DELETE  CASCADE 
	
GO
COMMIT
BEGIN TRANSACTION
GO
ALTER TABLE dbo.Narratives WITH NOCHECK ADD CONSTRAINT
	FK_Narratives_Patients FOREIGN KEY
	(
	PatientId
	) REFERENCES dbo.Patients
	(
	PatientId
	) ON UPDATE  CASCADE 
	 ON DELETE  CASCADE 
	
GO
COMMIT
BEGIN TRANSACTION
GO
ALTER TABLE dbo.Identifiers WITH NOCHECK ADD CONSTRAINT
	FK_Identifiers_Patients FOREIGN KEY
	(
	PatientId
	) REFERENCES dbo.Patients
	(
	PatientId
	) ON UPDATE  CASCADE 
	 ON DELETE  CASCADE 
	
GO
COMMIT
BEGIN TRANSACTION
GO
ALTER TABLE dbo.Categories WITH NOCHECK ADD CONSTRAINT
	FK_Categories_Patients FOREIGN KEY
	(
	PatientId
	) REFERENCES dbo.Patients
	(
	PatientId
	) ON UPDATE  CASCADE 
	 ON DELETE  CASCADE 
	
GO
COMMIT
BEGIN TRANSACTION
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
COMMIT
BEGIN TRANSACTION
GO
ALTER TABLE dbo.ProtocolMgr_PatientSchemas ADD CONSTRAINT
	FK_ProtocolMgr_PatientSchemas_Patients FOREIGN KEY
	(
	PatientId
	) REFERENCES dbo.Patients
	(
	PatientId
	) ON UPDATE  NO ACTION 
	 ON DELETE  NO ACTION 
	
GO
COMMIT
BEGIN TRANSACTION
GO
ALTER TABLE dbo.Toxicities WITH NOCHECK ADD CONSTRAINT
	FK_Toxicities_Patients FOREIGN KEY
	(
	PatientId
	) REFERENCES dbo.Patients
	(
	PatientId
	) ON UPDATE  CASCADE 
	 ON DELETE  CASCADE 
	
GO
COMMIT
BEGIN TRANSACTION
GO
ALTER TABLE dbo.PatientProtocols WITH NOCHECK ADD CONSTRAINT
	FK_PatientProtocols_Patients FOREIGN KEY
	(
	PatientId
	) REFERENCES dbo.Patients
	(
	PatientId
	) ON UPDATE  CASCADE 
	 ON DELETE  CASCADE 
	 NOT FOR REPLICATION

GO
COMMIT
BEGIN TRANSACTION
GO
ALTER TABLE dbo.EForms WITH NOCHECK ADD CONSTRAINT
	FK_EForms_Patients FOREIGN KEY
	(
	PatientId
	) REFERENCES dbo.Patients
	(
	PatientId
	) ON UPDATE  CASCADE 
	 ON DELETE  NO ACTION 
	
GO
COMMIT
BEGIN TRANSACTION
GO
ALTER TABLE dbo.Status WITH NOCHECK ADD CONSTRAINT
	FK_Status_Patients FOREIGN KEY
	(
	PatientId
	) REFERENCES dbo.Patients
	(
	PatientId
	) ON UPDATE  CASCADE 
	 ON DELETE  CASCADE 
	
GO
COMMIT
BEGIN TRANSACTION
GO
ALTER TABLE dbo.PatientConsent WITH NOCHECK ADD CONSTRAINT
	FK_PatientConsent_Patients FOREIGN KEY
	(
	PatientId
	) REFERENCES dbo.Patients
	(
	PatientId
	) ON UPDATE  CASCADE 
	 ON DELETE  CASCADE 
	
GO
COMMIT
BEGIN TRANSACTION
GO
ALTER TABLE dbo.DietaryIntake WITH NOCHECK ADD CONSTRAINT
	FK_DietaryIntake_Patients FOREIGN KEY
	(
	PatientId
	) REFERENCES dbo.Patients
	(
	PatientId
	) ON UPDATE  CASCADE 
	 ON DELETE  CASCADE 
	
GO
COMMIT
BEGIN TRANSACTION
GO
ALTER TABLE dbo.Comorbidities WITH NOCHECK ADD CONSTRAINT
	FK_Comorbidities_Patients FOREIGN KEY
	(
	PatientId
	) REFERENCES dbo.Patients
	(
	PatientId
	) ON UPDATE  CASCADE 
	 ON DELETE  CASCADE 
	
GO
COMMIT
BEGIN TRANSACTION
GO
ALTER TABLE dbo.PatientProblems WITH NOCHECK ADD CONSTRAINT
	FK_PatientProblems_Patients FOREIGN KEY
	(
	PatientId
	) REFERENCES dbo.Patients
	(
	PatientId
	) ON UPDATE  CASCADE 
	 ON DELETE  CASCADE 
	
GO
COMMIT
BEGIN TRANSACTION
GO
ALTER TABLE dbo.AbsentEvents ADD CONSTRAINT
	FK_AbsentEvents_Patients FOREIGN KEY
	(
	PatientId
	) REFERENCES dbo.Patients
	(
	PatientId
	) ON UPDATE  CASCADE 
	 ON DELETE  CASCADE 
	
GO
COMMIT
BEGIN TRANSACTION
GO
ALTER TABLE dbo.PatientPhysicians WITH NOCHECK ADD CONSTRAINT
	FK_PatientPhysicians_Patients FOREIGN KEY
	(
	PatientId
	) REFERENCES dbo.Patients
	(
	PatientId
	) ON UPDATE  CASCADE 
	 ON DELETE  CASCADE 
	
GO
COMMIT
BEGIN TRANSACTION
GO
ALTER TABLE dbo.BrachyTherapy WITH NOCHECK ADD CONSTRAINT
	FK_BrachyTherapy_Patients FOREIGN KEY
	(
	PatientId
	) REFERENCES dbo.Patients
	(
	PatientId
	) ON UPDATE  CASCADE 
	 ON DELETE  NO ACTION 
	
GO
COMMIT
BEGIN TRANSACTION
GO
ALTER TABLE dbo.FamilyMembers WITH NOCHECK ADD CONSTRAINT
	FK_FamilyMembers_Patients FOREIGN KEY
	(
	PatientId
	) REFERENCES dbo.Patients
	(
	PatientId
	) ON UPDATE  CASCADE 
	 ON DELETE  CASCADE 
	
GO
COMMIT
BEGIN TRANSACTION
GO
ALTER TABLE dbo.Encounters WITH NOCHECK ADD CONSTRAINT
	FK_Encounters_Patients FOREIGN KEY
	(
	PatientId
	) REFERENCES dbo.Patients
	(
	PatientId
	) ON UPDATE  CASCADE 
	 ON DELETE  CASCADE 
	
GO
COMMIT
GO
