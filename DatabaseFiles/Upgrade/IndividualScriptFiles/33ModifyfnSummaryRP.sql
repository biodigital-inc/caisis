SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER FUNCTION [dbo].[fnSummaryRP]
(
@varRP_GG1 varchar(50)=NULL, 
@varRP_GG2 varchar(50)=NULL,
@varRP_GGS varchar(50)=NULL,
@varRP_MarginStatus varchar(50)=NULL,
@varRP_ECE varchar(50)=NULL,
@varRP_SVI varchar(50)=NULL,
@OperatingRoomDetailId int=NULL,
@DataQuality varchar(50)=NULL
)
RETURNS varchar (50)
AS 
BEGIN 
	DECLARE @varRP_Summary varchar(50)
	DECLARE @varRP_LNI varchar(50)
	SET @varRP_LNI=dbo.fnGetLNI(@OperatingRoomDetailId,@DataQuality)
	IF ISNUMERIC(@varRP_GG1) = 1  AND ISNUMERIC(@varRP_GG2) = 1
		SET @varRP_Summary = @varRP_GG1 + '+' + @varRP_GG2 + ' '
	ELSE IF @varRP_GGS IS NOT NULL
		SET @varRP_Summary = @varRP_GGS + ' '
	ELSE
		SET @varRP_Summary = ''
	IF @varRP_MarginStatus IS NOT NULL
		BEGIN
		--Keep codes "Neg" And "POS"
		IF @varRP_MarginStatus LIKE 'POS%'
			SET @varRP_Summary = @varRP_Summary + 'SMS+ '
		ELSE IF @varRP_MarginStatus LIKE 'NEG%'
			SET @varRP_Summary = @varRP_Summary + 'SMS- '
		ELSE IF @varRP_MarginStatus IS NOT NULL
			SET @varRP_Summary = @varRP_Summary + 'SMS=' + @varRP_MarginStatus + ' '
		END		
	IF @varRP_ECE IS NOT NULL
		SET @varRP_Summary = @varRP_Summary + 'ECE=' + LOWER(@varRP_ECE) + ' '
	IF @varRP_SVI IS NOT NULL
		BEGIN
		--Keep codes "Neg" And "POS"
		IF @varRP_SVI LIKE 'POS%'
			SET @varRP_Summary = @varRP_Summary + 'SVI+ '
		ELSE IF @varRP_SVI LIKE 'NEG%'
			SET @varRP_Summary = @varRP_Summary + 'SVI- '
		ELSE IF @varRP_SVI IS NOT NULL
			SET @varRP_Summary = @varRP_Summary + 'SVI=' + @varRP_SVI + ' '
		END
	IF @varRP_LNI IS NOT NULL
		BEGIN
		--Keep codes "Abnormal" And "Normal"
		IF @varRP_LNI = 'Abnormal'
			SET @varRP_Summary = @varRP_Summary + 'LNI+ '
		ELSE IF @varRP_LNI = 'Normal'
			SET @varRP_Summary = @varRP_Summary + 'LNI- '
		ELSE IF @varRP_LNI IS NOT NULL
			SET @varRP_Summary = @varRP_Summary + 'LNI=' + @varRP_LNI + ' '
		END
	SET @varRP_Summary = NULLIF(RTRIM(@varRP_Summary),'')
	RETURN (@varRP_Summary)
END
GO
