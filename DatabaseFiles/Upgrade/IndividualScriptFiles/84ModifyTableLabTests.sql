--Add column
ALTER TABLE AuditLog_LabTests ADD LabClinicalSignificance varchar(50)
ALTER TABLE LabTests ADD LabClinicalSignificance varchar(50)
GO
