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
ALTER TABLE dbo.ProtocolMgr_SchemaItems
	DROP CONSTRAINT FK_ProtocolMgr_SchemaItems_ProtocolMgr_ProtocolSchemas
GO
ALTER TABLE dbo.ProtocolMgr_ProtocolSchemas SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
BEGIN TRANSACTION
GO
ALTER TABLE dbo.ProtocolMgr_SchemaItems
	DROP CONSTRAINT DF_ProtocolMgr_SchemaItems_ItemIsTemplate
GO
CREATE TABLE dbo.Tmp_ProtocolMgr_SchemaItems
	(
	SchemaItemId int NOT NULL IDENTITY (1, 1),
	ProtocolSchemaId int NOT NULL,
	ItemIsTemplate bit NULL,
	ItemDescription varchar(255) NULL,
	ItemOrder int NULL,
	EnteredBy varchar(50) NOT NULL,
	EnteredTime datetime NOT NULL,
	UpdatedBy varchar(50) NULL,
	UpdatedTime datetime NULL
	)  ON [PRIMARY]
GO
ALTER TABLE dbo.Tmp_ProtocolMgr_SchemaItems SET (LOCK_ESCALATION = TABLE)
GO
ALTER TABLE dbo.Tmp_ProtocolMgr_SchemaItems ADD CONSTRAINT
	DF_ProtocolMgr_SchemaItems_ItemIsTemplate DEFAULT ((0)) FOR ItemIsTemplate
GO
SET IDENTITY_INSERT dbo.Tmp_ProtocolMgr_SchemaItems ON
GO
IF EXISTS(SELECT * FROM dbo.ProtocolMgr_SchemaItems)
	 EXEC('INSERT INTO dbo.Tmp_ProtocolMgr_SchemaItems (SchemaItemId, ProtocolSchemaId, ItemIsTemplate, ItemDescription, EnteredBy, EnteredTime, UpdatedBy, UpdatedTime)
		SELECT SchemaItemId, ProtocolSchemaId, ItemIsTemplate, ItemDescription, EnteredBy, EnteredTime, UpdatedBy, UpdatedTime FROM dbo.ProtocolMgr_SchemaItems WITH (HOLDLOCK TABLOCKX)')
GO
SET IDENTITY_INSERT dbo.Tmp_ProtocolMgr_SchemaItems OFF
GO
ALTER TABLE dbo.ProtocolMgr_SchemaItemFields
	DROP CONSTRAINT FK_ProtocolMgr_SchemaItemFields_ProtocolMgr_SchemaItems
GO
ALTER TABLE dbo.ProtocolMgr_ItemTimeline
	DROP CONSTRAINT FK_ProtocolMgr_ItemTimeline_ProtocolMgr_SchemaItems
GO
DROP TABLE dbo.ProtocolMgr_SchemaItems
GO
EXECUTE sp_rename N'dbo.Tmp_ProtocolMgr_SchemaItems', N'ProtocolMgr_SchemaItems', 'OBJECT' 
GO
ALTER TABLE dbo.ProtocolMgr_SchemaItems ADD CONSTRAINT
	PK_ProtocolMgr_SchemaItems PRIMARY KEY CLUSTERED 
	(
	SchemaItemId
	) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

GO
CREATE NONCLUSTERED INDEX I_ProtocolMgr_SchemaItems_ProtocolSchemaId ON dbo.ProtocolMgr_SchemaItems
	(
	ProtocolSchemaId
	) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE dbo.ProtocolMgr_SchemaItems ADD CONSTRAINT
	FK_ProtocolMgr_SchemaItems_ProtocolMgr_ProtocolSchemas FOREIGN KEY
	(
	ProtocolSchemaId
	) REFERENCES dbo.ProtocolMgr_ProtocolSchemas
	(
	ProtocolSchemaId
	) ON UPDATE  NO ACTION 
	 ON DELETE  NO ACTION 
	
GO
COMMIT
BEGIN TRANSACTION
GO
ALTER TABLE dbo.ProtocolMgr_ItemTimeline ADD CONSTRAINT
	FK_ProtocolMgr_ItemTimeline_ProtocolMgr_SchemaItems FOREIGN KEY
	(
	SchemaItemId
	) REFERENCES dbo.ProtocolMgr_SchemaItems
	(
	SchemaItemId
	) ON UPDATE  NO ACTION 
	 ON DELETE  NO ACTION 
	
GO
ALTER TABLE dbo.ProtocolMgr_ItemTimeline SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
BEGIN TRANSACTION
GO
ALTER TABLE dbo.ProtocolMgr_SchemaItemFields ADD CONSTRAINT
	FK_ProtocolMgr_SchemaItemFields_ProtocolMgr_SchemaItems FOREIGN KEY
	(
	SchemaItemId
	) REFERENCES dbo.ProtocolMgr_SchemaItems
	(
	SchemaItemId
	) ON UPDATE  NO ACTION 
	 ON DELETE  NO ACTION 
	
GO
ALTER TABLE dbo.ProtocolMgr_SchemaItemFields SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
GO
