CREATE PROCEDURE [dbo].[SP_InsertRoute]
	@DepartureAirportID INT,
	@ArrivalAirportID INT
AS
IF NOT EXISTS(SELECT DepartureID,ArrivalAirportID FROM Route WHERE DepartureID=@DepartureAirportID AND ArrivalAirportID=@ArrivalAirportID)
BEGIN
IF EXISTS(SELECT ID FROM Airport WHERE ID IN(@DepartureAirportID,@ArrivalAirportID))
BEGIN
	INSERT INTO Route(DepartureID,ArrivalAirportID) VALUES(@DepartureAirportID,@ArrivalAirportID)
END
END
RETURN 0
