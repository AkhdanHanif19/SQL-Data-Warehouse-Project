USE MASTER;
GO

-- Create database and assign the name of the database
CREATE DATABASE DataWarehouse;
GO

USE Datawarehouse;
GO

-- Create schemas as Bronze, Silver, and Gold
CREATE SCHEMA Bronze;
GO

CREATE SCHEMA Silver;
GO

CREATE SCHEMA Gold;
GO