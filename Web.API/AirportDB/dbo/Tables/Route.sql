CREATE TABLE [dbo].[Route]
(
	[RouteID] INT NOT NULL PRIMARY KEY IDENTITY, 
    [DepartureAirportID] INT NULL, 
    [ArrivalAirportID] INT NULL
)
