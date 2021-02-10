--resize column
ALTER TABLE AuditLog_PathologyFinding ALTER COLUMN PathFindResult varchar(255)
ALTER TABLE PathologyFinding ALTER COLUMN PathFindResult varchar(255)
GO
