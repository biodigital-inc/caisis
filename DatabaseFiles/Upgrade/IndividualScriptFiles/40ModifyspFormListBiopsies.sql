SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
ALTER PROCEDURE [dbo].[spFormListBiopsies]
   @PatientId int = NULL,
   @ProcedureId int = NULL,
   @FormName varchar(50) = NULL,
   @FormType varchar(50) = 'Dynamic'
AS
IF @FormType = 'Dynamic'
   SELECT ProcDateText, ProcDate, ProcName, dbo.fnSummaryBxProstate(PathGG1,PathGG2,PathGGS,PathResult) AS PathResult, PathQuality, 
          Procedures.LockedBy, Procedures.ProcedureId AS PrimaryKey, 'Procedures' AS TableName, PathGG1, PathGG2, PathGG3, PathResult AS PathResult2, PathHG_PIN, PathASAP
   FROM Procedures INNER JOIN Pathology ON Procedures.ProcedureId = Pathology.ProcedureId
                   LEFT OUTER JOIN ProstateBiopsyPath ON Pathology.PathologyId=ProstateBiopsyPath.PathologyId
   WHERE Procedures.PatientId = @PatientId AND Procedures.ProcedureId <> @ProcedureId AND
         ProcSite='Prostate' AND ProcName IN('TURP','TRUS Biopsy','Biopsy','Needle Biopsy')
   UNION ALL
   SELECT ProcDateText, ProcDate, ProcName, PathResult, PathQuality, 
          Procedures.LockedBy, Procedures.ProcedureId, 'Procedures', NULL, NULL, NULL, PathResult, NULL, NULL
   FROM Procedures LEFT OUTER JOIN Pathology ON Procedures.ProcedureId = Pathology.ProcedureId
   WHERE (ProcName LIKE '%Biopsy%' OR ProcName = 'Needle Aspiration') AND 
         (Procedures.PatientId = @PatientId) AND
         (Procedures.ProcedureId NOT IN
                          (
                           SELECT ProcedureId
                           FROM Procedures 
                           WHERE PatientId = @PatientId AND ProcSite='Prostate' AND ProcName IN('TURP','TRUS Biopsy','Biopsy','Needle Biopsy')
                          ))
   ORDER BY ProcDate
/*
ELSE IF @FormType = 'Interactive'
*/
GO
