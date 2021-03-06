SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
ALTER FUNCTION [dbo].[fnGetLNI]
(
@OperatingRoomDetailId int=NULL,
@DataQuality varchar(50)=NULL
)
RETURNS varchar (50)
AS 
BEGIN 
	DECLARE @strReturn varchar(50)
   DECLARE @QualityExists bit

   SET @QualityExists = 0

   --Test if the row and path quality combo exists
   SELECT TOP 1 @QualityExists = 1
	FROM Pathology
	WHERE OperatingRoomDetailId = @OperatingRoomDetailId AND 
         PathSpecimenType='PLND' AND
         ISNULL(PathQuality,'') = ISNULL(@DataQuality,'')

   IF @QualityExists = 1
	   SELECT TOP 1 @strReturn = PathResult 
	   FROM Pathology
	   WHERE OperatingRoomDetailId = @OperatingRoomDetailId AND 
            PathSpecimenType='PLND' AND
            ISNULL(PathQuality,'') = ISNULL(@DataQuality,'')
      ORDER BY PathologyId DESC

   IF @QualityExists = 0
	   SELECT TOP 1 @strReturn = PathResult 
	   FROM Pathology
	   WHERE OperatingRoomDetailId = @OperatingRoomDetailId AND 
            PathSpecimenType='PLND'
      ORDER BY PathologyId DESC
	RETURN (@strReturn)
END
GO
