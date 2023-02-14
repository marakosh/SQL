CREATE DATABASE Academy;

USE Academy;

CREATE TABLE Groups
(
    [Id]     INT PRIMARY KEY IDENTITY (1,1),
    [Name]   NVARCHAR(10) NOT NULL UNIQUE CHECK ([Name] NOT LIKE N''),
    [Rating] INT          NOT NULL CHECK ([Rating] >= 0 AND [Rating] <= 5),
    [Year]   INT          NOT NULL CHECK ([Year] >= 1 AND [Year] <= 5)
);

CREATE TABLE Faculties
(
    [Id]   INT PRIMARY KEY IDENTITY (1,1),
    [Name] NVARCHAR(100) NOT NULL UNIQUE CHECK ([Name] NOT LIKE N'')
);

CREATE TABLE Departments
(
    [Id]        INT PRIMARY KEY IDENTITY (1,1),
    [Financing] MONEY         NOT NULL DEFAULT (0) CHECK ([Financing] > 0),
    [Name]      NVARCHAR(100) NOT NULL UNIQUE CHECK ([Name] NOT LIKE N'')
);

CREATE TABLE Teachers
(
    [Id]             INT PRIMARY KEY IDENTITY (1,1),
    [EmploymentDate] DATE          NOT NULL CHECK ([EmploymentDate] >= '01.01.1990'),
    [Name]           NVARCHAR(MAX) NOT NULL CHECK ([Name] NOT LIKE N''),
    [Premium]        MONEY         NOT NULL DEFAULT (0) CHECK ([Premium] > 0),
    [Salary]         MONEY         NOT NULL CHECK ([Salary] > 0),
    [Surname]        NVARCHAR(MAX) NOT NULL CHECK ([Surname] NOT LIKE N'')
);
