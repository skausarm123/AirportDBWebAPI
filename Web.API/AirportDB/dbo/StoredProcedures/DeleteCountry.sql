CREATE PROCEDURE [dbo].[DeleteCountry]
@GeographyLevel1ID INT
AS
IF NOT EXISTS(SELECT GeographyLevel1ID FROM Countries WHERE GeographyLevel1ID=@GeographyLevel1ID)
BEGIN
IF NOT EXISTS(SELECT GeographyLevel1ID FROM Airport WHERE GeographyLevel1ID=@GeographyLevel1ID)
  BEGIN
	DELETE Countries WHERE GeographyLevel1ID=@GeographyLevel1ID
  END
END

RETURN 0
