SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
ALTER PROCEDURE [dbo].[spPluginPSAGraphGetPathSummaryFlash]
   @PatientId int = NULL
AS
/*original
SELECT p.*,dbo.fnSummaryRP(PathGG1,PathGG2,PathGGS,PathMarginStatus,PathExtension,PathSVI,p.SurgeryId) AS CalcPathSummary
FROM Surgeries s, ProcProstatectomiesPath p 
WHERE s.PatientID = @PatientId 
AND s.SurgeryID = p.SurgeryID
*/

SELECT ProstatectomyPath.*,dbo.fnSummaryRP(PathGG1,PathGG2,PathGGS,PathMargin,PathExtension,PathSV_Inv,Procedures.OperatingRoomDetailId,ISNULL(PathQuality,ProcQuality)) AS CalcPathSummary
FROM Procedures LEFT OUTER JOIN Pathology ON Pathology.ProcedureId = Procedures.ProcedureId 
                LEFT OUTER JOIN ProstatectomyPath ON ProstatectomyPath.PathologyId = Pathology.PathologyId
WHERE Procedures.PatientId = @PatientId AND ProcName IN('CP','LP','LP_CONV','PP','RALP','RP','SalvCP','SalvLP','SalvRP')
GO
