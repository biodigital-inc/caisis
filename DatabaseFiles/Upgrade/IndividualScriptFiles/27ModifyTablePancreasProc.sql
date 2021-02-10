--resize columns
ALTER TABLE AuditLog_PancreasProc ALTER COLUMN ProcPancreaticAnast varchar(255)
ALTER TABLE AuditLog_PancreasProc ALTER COLUMN ProcBiliaryAnast varchar(255)
ALTER TABLE AuditLog_PancreasProc ALTER COLUMN ProcFascialClosure varchar(255)
ALTER TABLE PancreasProc ALTER COLUMN ProcPancreaticAnast varchar(255)
ALTER TABLE PancreasProc ALTER COLUMN ProcBiliaryAnast varchar(255)
ALTER TABLE PancreasProc ALTER COLUMN ProcFascialClosure varchar(255)
GO
