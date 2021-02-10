--resize column
ALTER TABLE AuditLog_PatientProtocols ALTER COLUMN PtProtocolStudyId varchar(50)
ALTER TABLE PatientProtocols ALTER COLUMN PtProtocolStudyId varchar(50)
GO

