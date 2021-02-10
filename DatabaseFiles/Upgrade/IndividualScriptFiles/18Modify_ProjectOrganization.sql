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
ALTER TABLE dbo.ProjectOrganization
	DROP CONSTRAINT DF_ProjectOrganization_CoordinatingCenter
GO
CREATE TABLE dbo.Tmp_ProjectOrganization
	(
	OrganizationId int NOT NULL IDENTITY (1, 1),
	Name varchar(255) NULL,
	ShortName varchar(50) NULL,
	Address1 varchar(50) NULL,
	Address2 varchar(50) NULL,
	City varchar(50) NULL,
	State varchar(50) NULL,
	Country varchar(50) NULL,
	PostalCode varchar(50) NULL,
	ColorCode varchar(50) NULL,
	CoordinatingCenter bit NULL,
	OrgNum varchar(50) NULL,
	EnteredBy varchar(50) NOT NULL,
	EnteredTime datetime NOT NULL,
	UpdatedBy varchar(50) NULL,
	UpdatedTime datetime NULL
	)  ON [PRIMARY]
GO
ALTER TABLE dbo.Tmp_ProjectOrganization ADD CONSTRAINT
	DF_ProjectOrganization_CoordinatingCenter DEFAULT ((0)) FOR CoordinatingCenter
GO
SET IDENTITY_INSERT dbo.Tmp_ProjectOrganization ON
GO
IF EXISTS(SELECT * FROM dbo.ProjectOrganization)
	 EXEC('INSERT INTO dbo.Tmp_ProjectOrganization (OrganizationId, Name, ShortName, Address1, Address2, City, State, Country, PostalCode, ColorCode, CoordinatingCenter, EnteredBy, EnteredTime, UpdatedBy, UpdatedTime)
		SELECT OrganizationId, Name, ShortName, Address1, Address2, City, State, Country, PostalCode, ColorCode, CoordinatingCenter, EnteredBy, EnteredTime, UpdatedBy, UpdatedTime FROM dbo.ProjectOrganization WITH (HOLDLOCK TABLOCKX)')
GO
SET IDENTITY_INSERT dbo.Tmp_ProjectOrganization OFF
GO
ALTER TABLE dbo.Project_ProjectOrganization
	DROP CONSTRAINT FK_Project_ProjectOrganization_ProjectOrganization
GO
ALTER TABLE dbo.ProjectOrganization_ProjectContact
	DROP CONSTRAINT FK_ProjectOrganization_ProjectContact_ProjectOrganization
GO
ALTER TABLE dbo.ProjectLOIResponse
	DROP CONSTRAINT FK_ProjectLOIResponse_ProjectOrganization
GO
ALTER TABLE dbo.ProjectCommunicationLog
	DROP CONSTRAINT FK_ProjectCommunicationLog_ProjectOrganization
GO
DROP TABLE dbo.ProjectOrganization
GO
EXECUTE sp_rename N'dbo.Tmp_ProjectOrganization', N'ProjectOrganization', 'OBJECT' 
GO
ALTER TABLE dbo.ProjectOrganization ADD CONSTRAINT
	PK_ProjectOrganization PRIMARY KEY CLUSTERED 
	(
	OrganizationId
	) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

GO
COMMIT
BEGIN TRANSACTION
GO
ALTER TABLE dbo.ProjectCommunicationLog ADD CONSTRAINT
	FK_ProjectCommunicationLog_ProjectOrganization FOREIGN KEY
	(
	OrganizationId
	) REFERENCES dbo.ProjectOrganization
	(
	OrganizationId
	) ON UPDATE  CASCADE 
	 ON DELETE  SET NULL 
	
GO
COMMIT
BEGIN TRANSACTION
GO
ALTER TABLE dbo.ProjectLOIResponse ADD CONSTRAINT
	FK_ProjectLOIResponse_ProjectOrganization FOREIGN KEY
	(
	OrganizationId
	) REFERENCES dbo.ProjectOrganization
	(
	OrganizationId
	) ON UPDATE  CASCADE 
	 ON DELETE  CASCADE 
	
GO
COMMIT
BEGIN TRANSACTION
GO
ALTER TABLE dbo.ProjectOrganization_ProjectContact WITH NOCHECK ADD CONSTRAINT
	FK_ProjectOrganization_ProjectContact_ProjectOrganization FOREIGN KEY
	(
	OrganizationId
	) REFERENCES dbo.ProjectOrganization
	(
	OrganizationId
	) ON UPDATE  CASCADE 
	 ON DELETE  CASCADE 
	
GO
COMMIT
BEGIN TRANSACTION
GO
ALTER TABLE dbo.Project_ProjectOrganization WITH NOCHECK ADD CONSTRAINT
	FK_Project_ProjectOrganization_ProjectOrganization FOREIGN KEY
	(
	OrganizationId
	) REFERENCES dbo.ProjectOrganization
	(
	OrganizationId
	) ON UPDATE  CASCADE 
	 ON DELETE  CASCADE 
	
GO
COMMIT
GO
