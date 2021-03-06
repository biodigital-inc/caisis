SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[spChronoListPatientProblems]
	@PatientId int = NULL
AS
SELECT ProblemDateText AS VarDate, 'Patient Problem' AS VarName, LEFT(ProblemName,100) AS VarValue, NULL AS Quality, ProblemDate AS SortDate, NULL AS GroupNumber, 'PatientProblems' AS TableName, PatientProblemId AS PrimaryKey, PatientId AS ParentKey
FROM PatientProblems
WHERE PatientId = @PatientId
GO
