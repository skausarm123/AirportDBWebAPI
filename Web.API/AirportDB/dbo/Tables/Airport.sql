﻿CREATE TABLE [dbo].[Airport]
(
	[Id] INT NOT NULL PRIMARY KEY IDENTITY,
	[IATACode] NVARCHAR(50),
	[GeographyLevel1ID] INT,
	[Type] NVARCHAR(50)
)