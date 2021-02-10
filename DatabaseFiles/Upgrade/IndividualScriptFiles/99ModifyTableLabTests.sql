--resize columns
ALTER TABLE AuditLog_LabTests
ALTER COLUMN LabAccessionNum varchar(100)
GO
ALTER TABLE LabTests
ALTER COLUMN LabAccessionNum varchar(100)
GO