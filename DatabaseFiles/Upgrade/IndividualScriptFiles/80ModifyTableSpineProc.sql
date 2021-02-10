EXEC sp_rename 'AuditLog_SpineProc.ProcCementVolumeUnits', 'ProcMISProcedure', 'COLUMN'
EXEC sp_rename 'AuditLog_SpineProc.ProcInflationPressureUnits', 'ProcGraftMaterialUsed', 'COLUMN'
GO
ALTER TABLE AuditLog_SpineProc ALTER COLUMN ProcGraftMaterialUsed varchar(255)
GO
EXEC sp_rename 'SpineProc.ProcCementVolumeUnits', 'ProcMISProcedure', 'COLUMN'
EXEC sp_rename 'SpineProc.ProcInflationPressureUnits', 'ProcGraftMaterialUsed', 'COLUMN'
GO
ALTER TABLE SpineProc ALTER COLUMN ProcGraftMaterialUsed varchar(255)
GO
