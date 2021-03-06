SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
ALTER FUNCTION [dbo].[fnGetPtProtocolStatusLast]
(
@PatientProtocolId int=NULL
)
RETURNS varchar (50)
AS 
BEGIN 
   DECLARE @strReturn varchar(50)
   DECLARE @dteLastIneligible datetime
   DECLARE @dteLastEligible datetime

   SELECT TOP 1 @strReturn = PtProtocolStatus 
   FROM PatientProtocolStatus
   WHERE PatientProtocolId = @PatientProtocolId
   ORDER BY PtProtocolStatusDate DESC

   SELECT TOP 1 @dteLastIneligible = PtProtocolStatusDate
   FROM PatientProtocolStatus
   WHERE PatientProtocolId = @PatientProtocolId  AND 
         PtProtocolStatus='Ineligible'
   ORDER BY PtProtocolStatusDate DESC

   SELECT TOP 1 @dteLastEligible = PtProtocolStatusDate
   FROM PatientProtocolStatus
   WHERE PatientProtocolId = @PatientProtocolId  AND 
         PtProtocolStatus='Eligible'
   ORDER BY PtProtocolStatusDate DESC

   IF EXISTS(SELECT * FROM PatientProtocolStatus 
             WHERE PatientProtocolId = @PatientProtocolId AND 
                   PtProtocolStatus='Registered') AND
                   @strReturn <> 'Registered'
      SET @strReturn = 'Registered' + (': ' + @strReturn)
   ELSE IF (@dteLastIneligible > @dteLastEligible) OR 
           (@dteLastIneligible IS NOT NULL AND @dteLastEligible IS NULL)
           AND @strReturn <> 'Ineligible'
      SET @strReturn = 'Ineligible' + (': ' + @strReturn)
   RETURN (@strReturn)
END
GO
