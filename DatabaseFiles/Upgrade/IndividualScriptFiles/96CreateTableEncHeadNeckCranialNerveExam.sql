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
CREATE TABLE dbo.AuditLog_EncHeadNeckCranialNerveExam
	(
	LoggedOperation varchar(50) NULL,
	LoggedBy varchar(50) NULL,
	LoggedTime datetime NULL,
	EncounterId int NULL,
	EncHeadNeckCranialNerveExamId int NULL,
	EncSide varchar(50) NULL,
	EncCranialNerveII varchar(50) NULL,
	EncCranialNerveIII_IV_VI varchar(50) NULL,
	EncSupraorbitalV1 varchar(50) NULL,
	EncSupratrochlearV1 varchar(50) NULL,
	EncInfraorbitalV2 varchar(50) NULL,
	EnclingualV3 varchar(50) NULL,
	EncMentalV3 varchar(50) NULL,
	EncInfAlveolarV3 varchar(50) NULL,
	EncMasseterAtrophyV3 varchar(50) NULL,
	EncTemporalVII varchar(50) NULL,
	EncZygomaticVII varchar(50) NULL,
	EncBuccalVII varchar(50) NULL,
	EncMarginalVII varchar(50) NULL,
	EncHouseBrackmannScore varchar(50) NULL,
	EncVagusX varchar(50) NULL,
	EncVocalCord varchar(50) NULL,
	EncAccessoryXI varchar(50) NULL,
	EncHypoglossalXII varchar(50) NULL,
	EncOtherNamedNerve varchar(50) NULL,
	EncOtherNamedNerveResult varchar(50) NULL,
	EnteredBy varchar(50) NULL,
	EnteredTime datetime NULL,
	UpdatedBy varchar(50) NULL,
	UpdatedTime datetime NULL
	)  ON [PRIMARY]
GO
ALTER TABLE dbo.AuditLog_EncHeadNeckCranialNerveExam SET (LOCK_ESCALATION = TABLE)
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
ALTER TABLE dbo.Encounters SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
BEGIN TRANSACTION
GO
CREATE TABLE dbo.EncHeadNeckCranialNerveExam
	(
	EncounterId int NOT NULL,
	EncHeadNeckCranialNerveExamId int NOT NULL IDENTITY (1, 1),
	EncSide varchar(50) NULL,
	EncCranialNerveII varchar(50) NULL,
	EncCranialNerveIII_IV_VI varchar(50) NULL,
	EncSupraorbitalV1 varchar(50) NULL,
	EncSupratrochlearV1 varchar(50) NULL,
	EncInfraorbitalV2 varchar(50) NULL,
	EnclingualV3 varchar(50) NULL,
	EncMentalV3 varchar(50) NULL,
	EncInfAlveolarV3 varchar(50) NULL,
	EncMasseterAtrophyV3 varchar(50) NULL,
	EncTemporalVII varchar(50) NULL,
	EncZygomaticVII varchar(50) NULL,
	EncBuccalVII varchar(50) NULL,
	EncMarginalVII varchar(50) NULL,
	EncHouseBrackmannScore varchar(50) NULL,
	EncVagusX varchar(50) NULL,
	EncVocalCord varchar(50) NULL,
	EncAccessoryXI varchar(50) NULL,
	EncHypoglossalXII varchar(50) NULL,
	EncOtherNamedNerve varchar(50) NULL,
	EncOtherNamedNerveResult varchar(50) NULL,
	EnteredBy varchar(50) NOT NULL,
	EnteredTime datetime NOT NULL,
	UpdatedBy varchar(50) NULL,
	UpdatedTime datetime NULL
	)  ON [PRIMARY]
GO
ALTER TABLE dbo.EncHeadNeckCranialNerveExam ADD CONSTRAINT
	PK_EncHeadNeckCranialNerveExam PRIMARY KEY CLUSTERED 
	(
	EncHeadNeckCranialNerveExamId
	) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

GO
CREATE NONCLUSTERED INDEX I_EncHeadNeckCranialNerveExam_EncounterId ON dbo.EncHeadNeckCranialNerveExam
	(
	EncounterId
	) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE dbo.EncHeadNeckCranialNerveExam ADD CONSTRAINT
	FK_EncHeadNeckCranialNerveExam_Encounters FOREIGN KEY
	(
	EncounterId
	) REFERENCES dbo.Encounters
	(
	EncounterId
	) ON UPDATE  CASCADE 
	 ON DELETE  CASCADE 
	
GO
ALTER TABLE dbo.EncHeadNeckCranialNerveExam SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
GO

SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE TRIGGER [dbo].[trgAuditEncHeadNeckCranialNerveExam_UD]
ON [dbo].[EncHeadNeckCranialNerveExam] FOR UPDATE, DELETE
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
   INSERT INTO AuditLog_EncHeadNeckCranialNerveExam
   SELECT @action AS LoggedOperation, Inserted.UpdatedBy AS LoggedBy, 
          GETDATE() AS LoggedTime, Deleted.*
   FROM Deleted INNER JOIN INSERTED
   ON Deleted.EncHeadNeckCranialNerveExamId = Inserted.EncHeadNeckCranialNerveExamId
ELSE IF @action = 'DELETE'
   INSERT INTO AuditLog_EncHeadNeckCranialNerveExam
   SELECT @action AS LoggedOperation, SYSTEM_USER AS LoggedBy, GETDATE() AS LoggedTime, *
   FROM Deleted

GO
EXEC sp_settriggerorder @triggername=N'[dbo].[trgAuditEncHeadNeckCranialNerveExam_UD]', @order=N'Last', @stmttype=N'UPDATE'
GO
