﻿/*
Deployment script for MinimalDB

This code was generated by a tool.
Changes to this file may cause incorrect behavior and will be lost if
the code is regenerated.
*/

GO
SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, CONCAT_NULL_YIELDS_NULL, QUOTED_IDENTIFIER ON;

SET NUMERIC_ROUNDABORT OFF;


GO
:setvar DatabaseName "MinimalDB"
:setvar DefaultFilePrefix "MinimalDB"
:setvar DefaultDataPath "C:\Users\Mohammed Irfan B\AppData\Local\Microsoft\Microsoft SQL Server Local DB\Instances\MSSQLLocalDB\"
:setvar DefaultLogPath "C:\Users\Mohammed Irfan B\AppData\Local\Microsoft\Microsoft SQL Server Local DB\Instances\MSSQLLocalDB\"

GO
:on error exit
GO
/*
Detect SQLCMD mode and disable script execution if SQLCMD mode is not supported.
To re-enable the script after enabling SQLCMD mode, execute the following:
SET NOEXEC OFF; 
*/
:setvar __IsSqlCmdEnabled "True"
GO
IF N'$(__IsSqlCmdEnabled)' NOT LIKE N'True'
    BEGIN
        PRINT N'SQLCMD mode must be enabled to successfully execute this script.';
        SET NOEXEC ON;
    END


GO
USE [master];


GO

IF (DB_ID(N'$(DatabaseName)') IS NOT NULL) 
BEGIN
    ALTER DATABASE [$(DatabaseName)]
    SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
    DROP DATABASE [$(DatabaseName)];
END

GO
PRINT N'Creating database $(DatabaseName)...'
GO
CREATE DATABASE [$(DatabaseName)]
    ON 
    PRIMARY(NAME = [$(DatabaseName)], FILENAME = N'$(DefaultDataPath)$(DefaultFilePrefix)_Primary.mdf')
    LOG ON (NAME = [$(DatabaseName)_log], FILENAME = N'$(DefaultLogPath)$(DefaultFilePrefix)_Primary.ldf') COLLATE SQL_Latin1_General_CP1_CI_AS
GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET AUTO_CLOSE OFF 
            WITH ROLLBACK IMMEDIATE;
    END


GO
USE [$(DatabaseName)];


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET ANSI_NULLS ON,
                ANSI_PADDING ON,
                ANSI_WARNINGS ON,
                ARITHABORT ON,
                CONCAT_NULL_YIELDS_NULL ON,
                NUMERIC_ROUNDABORT OFF,
                QUOTED_IDENTIFIER ON,
                ANSI_NULL_DEFAULT ON,
                CURSOR_DEFAULT LOCAL,
                CURSOR_CLOSE_ON_COMMIT OFF,
                AUTO_CREATE_STATISTICS ON,
                AUTO_SHRINK OFF,
                AUTO_UPDATE_STATISTICS ON,
                RECURSIVE_TRIGGERS OFF 
            WITH ROLLBACK IMMEDIATE;
    END


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET ALLOW_SNAPSHOT_ISOLATION OFF;
    END


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET READ_COMMITTED_SNAPSHOT OFF 
            WITH ROLLBACK IMMEDIATE;
    END


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET AUTO_UPDATE_STATISTICS_ASYNC OFF,
                PAGE_VERIFY NONE,
                DATE_CORRELATION_OPTIMIZATION OFF,
                DISABLE_BROKER,
                PARAMETERIZATION SIMPLE,
                SUPPLEMENTAL_LOGGING OFF 
            WITH ROLLBACK IMMEDIATE;
    END


GO
IF IS_SRVROLEMEMBER(N'sysadmin') = 1
    BEGIN
        IF EXISTS (SELECT 1
                   FROM   [master].[dbo].[sysdatabases]
                   WHERE  [name] = N'$(DatabaseName)')
            BEGIN
                EXECUTE sp_executesql N'ALTER DATABASE [$(DatabaseName)]
    SET TRUSTWORTHY OFF,
        DB_CHAINING OFF 
    WITH ROLLBACK IMMEDIATE';
            END
    END
ELSE
    BEGIN
        PRINT N'The database settings cannot be modified. You must be a SysAdmin to apply these settings.';
    END


GO
IF IS_SRVROLEMEMBER(N'sysadmin') = 1
    BEGIN
        IF EXISTS (SELECT 1
                   FROM   [master].[dbo].[sysdatabases]
                   WHERE  [name] = N'$(DatabaseName)')
            BEGIN
                EXECUTE sp_executesql N'ALTER DATABASE [$(DatabaseName)]
    SET HONOR_BROKER_PRIORITY OFF 
    WITH ROLLBACK IMMEDIATE';
            END
    END
ELSE
    BEGIN
        PRINT N'The database settings cannot be modified. You must be a SysAdmin to apply these settings.';
    END


GO
ALTER DATABASE [$(DatabaseName)]
    SET TARGET_RECOVERY_TIME = 0 SECONDS 
    WITH ROLLBACK IMMEDIATE;


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET FILESTREAM(NON_TRANSACTED_ACCESS = OFF),
                CONTAINMENT = NONE 
            WITH ROLLBACK IMMEDIATE;
    END


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET AUTO_CREATE_STATISTICS ON(INCREMENTAL = OFF),
                MEMORY_OPTIMIZED_ELEVATE_TO_SNAPSHOT = OFF,
                DELAYED_DURABILITY = DISABLED 
            WITH ROLLBACK IMMEDIATE;
    END


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET QUERY_STORE (QUERY_CAPTURE_MODE = ALL, DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_PLANS_PER_QUERY = 200, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 367), MAX_STORAGE_SIZE_MB = 100) 
            WITH ROLLBACK IMMEDIATE;
    END


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET QUERY_STORE = OFF 
            WITH ROLLBACK IMMEDIATE;
    END


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
        ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
        ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
        ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
        ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
        ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
        ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
        ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
    END


GO
IF fulltextserviceproperty(N'IsFulltextInstalled') = 1
    EXECUTE sp_fulltext_database 'enable';


GO
PRINT N'Creating Table [dbo].[Airport]...';


GO
CREATE TABLE [dbo].[Airport] (
    [Id]                INT           IDENTITY (1, 1) NOT NULL,
    [IATACode]          NVARCHAR (50) NULL,
    [GeographyLevel1ID] INT           NULL,
    [Type]              NVARCHAR (50) NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Creating Table [dbo].[AirportGroup]...';


GO
CREATE TABLE [dbo].[AirportGroup] (
    [AirportGroupID] INT           IDENTITY (1, 1) NOT NULL,
    [Name]           NVARCHAR (50) NULL,
    PRIMARY KEY CLUSTERED ([AirportGroupID] ASC)
);


GO
PRINT N'Creating Table [dbo].[Countries]...';


GO
CREATE TABLE [dbo].[Countries] (
    [GeographyLevel1ID] INT           IDENTITY (1, 1) NOT NULL,
    [Name]              NVARCHAR (50) NULL,
    PRIMARY KEY CLUSTERED ([GeographyLevel1ID] ASC)
);


GO
PRINT N'Creating Table [dbo].[Route]...';


GO
CREATE TABLE [dbo].[Route] (
    [RouteID]          INT IDENTITY (1, 1) NOT NULL,
    [DepartureID]      INT NULL,
    [ArrivalAirportID] INT NULL,
    PRIMARY KEY CLUSTERED ([RouteID] ASC)
);


GO
PRINT N'Creating Procedure [dbo].[DeleteCountry]...';


GO
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
GO
PRINT N'Creating Procedure [dbo].[SP_GetAiportDetailWithID]...';


GO
CREATE PROCEDURE [dbo].[SP_GetAiportDetailWithID]
	@Id int
AS
	SELECT * FROM dbo.[Airport] WHERE ID=@Id
RETURN 0
GO
PRINT N'Creating Procedure [dbo].[SP_GetAirportDetails]...';


GO
CREATE PROCEDURE [dbo].[SP_GetAirportDetails]
AS
	SELECT * FROM dbo.[Airport]
RETURN 0
GO
PRINT N'Creating Procedure [dbo].[SP_GetCountries]...';


GO
CREATE PROCEDURE [dbo].[SP_GetCountries]
	
AS
	SELECT * FROM Countries
RETURN 0
GO
PRINT N'Creating Procedure [dbo].[SP_GetRoutes]...';


GO
CREATE PROCEDURE [dbo].[SP_GetRoutes]
	
AS
	SELECT * FROM Route
RETURN 0
GO
PRINT N'Creating Procedure [dbo].[SP_InsertCountry]...';


GO
CREATE PROCEDURE [dbo].[SP_InsertCountry]
	@Name NVARCHAR(50)
AS
IF NOT EXISTS(SELECT Name FROM Countries WHERE Name=@Name)
INSERT INTO Countries([Name]) VALUES(@Name)
RETURN 0
GO
PRINT N'Creating Procedure [dbo].[SP_InsertRoute]...';


GO
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
GO
-- Refactoring step to update target server with deployed transaction logs

IF OBJECT_ID(N'dbo.__RefactorLog') IS NULL
BEGIN
    CREATE TABLE [dbo].[__RefactorLog] (OperationKey UNIQUEIDENTIFIER NOT NULL PRIMARY KEY)
    EXEC sp_addextendedproperty N'microsoft_database_tools_support', N'refactoring log', N'schema', N'dbo', N'table', N'__RefactorLog'
END
GO
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = '6f31fdce-6184-4c80-a69d-d6b92c91699f')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('6f31fdce-6184-4c80-a69d-d6b92c91699f')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = 'b2a91b34-dd20-4901-8b96-d6ce775f270a')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('b2a91b34-dd20-4901-8b96-d6ce775f270a')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = '37d9fda0-4815-4ad6-8f16-96018d666123')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('37d9fda0-4815-4ad6-8f16-96018d666123')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = 'd1f314e2-6ed3-45a6-b070-47fa165745ee')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('d1f314e2-6ed3-45a6-b070-47fa165745ee')

GO

GO
if not exists(select 1 from dbo.[Airport])
begin
insert into dbo.[Airport] 
values('LGW',1,'Departure and Arrival')
insert into dbo.[Airport] 
values('PMI',2,'Arrival Only')
insert into dbo.[Airport] 
values('LAX',3,'Arrival Only')

end
GO

GO
DECLARE @VarDecimalSupported AS BIT;

SELECT @VarDecimalSupported = 0;

IF ((ServerProperty(N'EngineEdition') = 3)
    AND (((@@microsoftversion / power(2, 24) = 9)
          AND (@@microsoftversion & 0xffff >= 3024))
         OR ((@@microsoftversion / power(2, 24) = 10)
             AND (@@microsoftversion & 0xffff >= 1600))))
    SELECT @VarDecimalSupported = 1;

IF (@VarDecimalSupported > 0)
    BEGIN
        EXECUTE sp_db_vardecimal_storage_format N'$(DatabaseName)', 'ON';
    END


GO
PRINT N'Update complete.';


GO