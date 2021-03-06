SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
ALTER  VIEW [dbo].[FJ_CurrentDataView]
AS
--Not all tables are represented here Includes deceased patients
SELECT a.PatientId AS PatientId
FROM 
   (
   SELECT ClinStageDate AS SortDate, 'ClinicalStages' AS TableName, PatientId
   FROM ClinicalStages
   WHERE ClinStageDate > DATEADD(m,-14,GETDATE())
   UNION
   SELECT DxDate, 'Diagnostics', PatientId
   FROM Diagnostics
   WHERE DxDate > DATEADD(m,-14,GETDATE())
   UNION
   SELECT LabDate, 'LabTests', PatientId
   FROM LabTests
   WHERE LabDate > DATEADD(m,-14,GETDATE())
   UNION
   SELECT MedTxDate, 'MedicalTherapy', PatientId
   FROM MedicalTherapy
   WHERE MedTxDate > DATEADD(m,-14,GETDATE())
   UNION
   SELECT ProcDate, 'Procedures', PatientId
   FROM Procedures
   WHERE ProcDate > DATEADD(m,-14,GETDATE())
   UNION
   SELECT OpDate, 'OperatingRoomDetails', PatientId
   FROM OperatingRoomDetails
   WHERE OpDate > DATEADD(m,-14,GETDATE())
   UNION
   SELECT PathDate, 'Pathology', PatientId
   FROM Pathology
   WHERE PathDate > DATEADD(m,-14,GETDATE())
   UNION
   SELECT BrachyDate, 'BrachyTherapy', PatientId
   FROM BrachyTherapy
   WHERE BrachyDate > DATEADD(m,-14,GETDATE())
   UNION
   SELECT RadTxDate, 'RadiationTherapy', PatientId
   FROM RadiationTherapy
   WHERE RadTxDate > DATEADD(m,-14,GETDATE())
   UNION
   SELECT StatusDate, 'Status', PatientId
   FROM Status
   WHERE StatusDate > DATEADD(m,-14,GETDATE())
   UNION
   SELECT PtProtocolStatusDate, 'Protocols', PatientId
   FROM PatientProtocols INNER JOIN PatientProtocolStatus ON PatientProtocolStatus.PatientProtocolId = PatientProtocols.PatientProtocolId
   WHERE PtProtocolStatusDate > DATEADD(m,-14,GETDATE())
   UNION
   SELECT EncDate, 'Encounters', PatientId
   FROM Encounters
   WHERE EncDate > DATEADD(m,-14,GETDATE())
   UNION
   SELECT SurveyDate, 'Surveys', PatientId
   FROM Surveys
   WHERE SurveyDate > DATEADD(m,-14,GETDATE())
   --Add in deceased patients classified as having a DeathDateText
   UNION
   SELECT PtDeathDate, 'Patients',PatientId
   FROM Patients
   WHERE (PtDeathDateText IS NOT NULL)
   )  AS a
GROUP BY a.PatientId
GO
