CREATE PROCEDURE [dbo].[SP_GetAiportDetailWithID]
	@Id int
AS
	SELECT * FROM dbo.[Airport] WHERE ID=@Id
RETURN 0
