SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER FUNCTION [dbo].[fnGetNodeRatio]
(
@OperatingRoomDetailId int=NULL,
@DataQuality varchar(50)=NULL
)
RETURNS varchar (50)
AS 
BEGIN 
   DECLARE @strReturn varchar(50)
   DECLARE @strPosNodes varchar(10)
   DECLARE @strNumNodes varchar(10)
   DECLARE @QualityExists bit

   SET @QualityExists = 0

   --Test if the row and path quality combo exists
   SELECT TOP 1 @QualityExists = 1
   FROM NodePathFinding INNER JOIN Pathology ON NodePathFinding.PathologyId = Pathology.PathologyId
   WHERE OperatingRoomDetailId = @OperatingRoomDetailId AND 
         ISNULL(PathQuality,'') = ISNULL(@DataQuality,'')

   IF @QualityExists = 1 
      BEGIN

      SELECT @strPosNodes=SUM(CAST(PathFindPosNodes AS INT))
      FROM NodePathFinding INNER JOIN Pathology ON NodePathFinding.PathologyId = Pathology.PathologyId
      WHERE OperatingRoomDetailId = @OperatingRoomDetailId AND 
            ISNULL(PathQuality,'') = ISNULL(@DataQuality,'') AND
            (PathFindPosNodes NOT LIKE '%.%' AND PathFindPosNodes NOT LIKE '%,%' AND ISNUMERIC(PathFindPosNodes)=1)
      GROUP BY OperatingRoomDetailId

      SELECT @strNumNodes=SUM(CAST(PathFindNumNodes AS INT))
      FROM NodePathFinding INNER JOIN Pathology ON NodePathFinding.PathologyId = Pathology.PathologyId
      WHERE OperatingRoomDetailId = @OperatingRoomDetailId AND 
            ISNULL(PathQuality,'') = ISNULL(@DataQuality,'') AND
            (PathFindNumNodes NOT LIKE '%.%' AND PathFindNumNodes NOT LIKE '%,%' AND ISNUMERIC(PathFindNumNodes)=1)
      GROUP BY OperatingRoomDetailId

      END

   IF @QualityExists = 0
      BEGIN

      SELECT @strPosNodes=SUM(CAST(PathFindPosNodes AS INT))
      FROM NodePathFinding INNER JOIN Pathology ON NodePathFinding.PathologyId = Pathology.PathologyId
      WHERE OperatingRoomDetailId = @OperatingRoomDetailId AND 
            (PathFindPosNodes NOT LIKE '%.%' AND PathFindPosNodes NOT LIKE '%,%' AND ISNUMERIC(PathFindPosNodes)=1)
      GROUP BY OperatingRoomDetailId   

      SELECT @strNumNodes=SUM(CAST(PathFindNumNodes AS INT))
      FROM NodePathFinding INNER JOIN Pathology ON NodePathFinding.PathologyId = Pathology.PathologyId
      WHERE OperatingRoomDetailId = @OperatingRoomDetailId AND 
            (PathFindNumNodes NOT LIKE '%.%' AND PathFindNumNodes NOT LIKE '%,%' AND ISNUMERIC(PathFindNumNodes)=1)
      GROUP BY OperatingRoomDetailId

      END

   SET @strReturn = ISNULL(@strPosNodes,'') + '/' + ISNULL(@strNumNodes,'')
   RETURN (@strReturn)
END
GO
