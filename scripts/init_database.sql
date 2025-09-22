/*
======================================================================================
Create Database and Schemas
======================================================================================

Purpose : 
  Creates a new database named "DataWarehouse", after it checks if it already exists.
  If the databse exists, it is dropped and recreated. 
  Setup 3 schemas in the databse "bronze", "silver", "gold".

WARNING :
  Running this script will drop the entire "DataWarehouse" databse if it already exists.
  All data will be permanently deleted.
  Proceed with caution and ensure you have proper backups before running this script.

*/

USE master;
GO

-- Drop and recreate the "DataWarehouse" database --
IF EXISTS(SELECT 1 FROM sys.databases WHERE name = 'DataWarehouse')
BEGIN
	ALTER DATABASE DataWarehouse SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
	DROP DATABASE DataWarehouse;
END;
GO

-- Create the "DataWarehouse" database --
CREATE DATABASE DataWarehouse;
GO

-- Switch to "DataWarehouse" database --
USE DataWarehouse;
GO

-- Create Schemas requireed --
CREATE SCHEMA bronze;
GO

CREATE SCHEMA silver;
GO

CREATE SCHEMA gold;
GO
