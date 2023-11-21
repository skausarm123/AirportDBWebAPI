CREATE TABLE [dbo].[Route]
(
	[RouteID] INT NOT NULL PRIMARY KEY IDENTITY, 
    [DepartureID] INT NULL, 
    [ArrivalAirportID] INT NULL
)
