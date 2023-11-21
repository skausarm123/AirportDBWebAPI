CREATE PROCEDURE [dbo].[SP_InsertCountry]
	@Name NVARCHAR(50)
AS
IF NOT EXISTS(SELECT Name FROM Countries WHERE Name=@Name)
INSERT INTO Countries([Name]) VALUES(@Name)
RETURN 0
