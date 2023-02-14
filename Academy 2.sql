CREATE DATABASE Academy;
USE Academy;

CREATE TABLE Departments
(
    [Id]        INT PRIMARY KEY IDENTITY (1,1),
    [Financing] MONEY         NOT NULL DEFAULT (0) CHECK ([Financing] >= 0),
    [Name]      NVARCHAR(100) NOT NULL UNIQUE CHECK ([Name] NOT LIKE N'')
);

CREATE TABLE Faculties
(
    [Id]   INT PRIMARY KEY IDENTITY (1,1),
    [Dean] NVARCHAR(MAX) NOT NULL CHECK ([Dean] NOT LIKE N''),
    [Name] NVARCHAR(100) NOT NULL UNIQUE CHECK ([Name] NOT LIKE '')
);

CREATE TABLE Groups
(
    [Id]     INT PRIMARY KEY IDENTITY (1,1),
    [Name]   NVARCHAR(10) NOT NULL UNIQUE CHECK ([Name] NOT LIKE N''),
    [Rating] INT          NOT NULL CHECK ([Rating] >= 0 AND [Rating] <= 5),
    [Year]   INT          NOT NULL CHECK ([Year] >= 1 AND [Year] <= 5)
);

CREATE TABLE Teachers
(
    [Id]             INT PRIMARY KEY IDENTITY (1,1),
    [EmploymentDate] DATE          NOT NULL CHECK ([EmploymentDate] >= '01.01.1990'),
    [IsAssistant]    BIT           NOT NULL DEFAULT (0),
    [IsProfessor]    BIT           NOT NULL DEFAULT (0),
    [Name]           NVARCHAR(MAX) NOT NULL CHECK ([Name] NOT LIKE N''),
    [Position]       NVARCHAR(MAX) NOT NULL CHECK ([Position] NOT LIKE N''),
    [Premium]        MONEY         NOT NULL DEFAULT (0) CHECK ([Premium] >= 0),
    [Salary]         MONEY         NOT NULL CHECK ([Salary] >= 0),
    [Surname]        NVARCHAR(MAX) NOT NULL CHECK ([Surname] NOT LIKE N'')
);

INSERT INTO Departments(Financing, Name)
VALUES (100, N'DepartmentA');
INSERT INTO Departments(Financing, Name)
VALUES (150, N'DepartmentB');
INSERT INTO Departments(Financing, Name)
VALUES (1600, N'DepartmentC');
INSERT INTO Departments(Financing, Name)
VALUES (90, N'DepartmentD');
INSERT INTO Departments(Financing, Name)
VALUES (1000, N'DepartmentE');
INSERT INTO Departments(Financing, Name)
VALUES (7500, N'DepartmentF');
INSERT INTO Departments(Financing, Name)
VALUES (99, N'DepartmentG');
INSERT INTO Departments(Financing, Name)
VALUES (99, N'Name of Departments');

INSERT INTO Groups(Name, Rating, Year)
VALUES (N'GroupA', 3, 1);
INSERT INTO Groups(Name, Rating, Year)
VALUES (N'GroupB', 2, 2);
INSERT INTO Groups(Name, Rating, Year)
VALUES (N'GroupC', 4, 1);
INSERT INTO Groups(Name, Rating, Year)
VALUES (N'GroupD', 2, 3);
INSERT INTO Groups(Name, Rating, Year)
VALUES (N'GroupE', 0, 4);
INSERT INTO Groups(Name, Rating, Year)
VALUES (N'GroupF', 1, 2);
INSERT INTO Groups(Name, Rating, Year)
VALUES (N'GroupG', 1, 2);

INSERT INTO Teachers([EmploymentDate], [IsAssistant], [IsProfessor], [Name], [Position], [Premium], [Salary], [Surname])
VALUES (N'11.1.2010', 1, 0, N'TeachersA', N'PositionA', 222, 1000, 'SurnameA')

INSERT INTO Teachers([EmploymentDate], [IsAssistant], [IsProfessor], [Name], [Position], [Premium], [Salary], [Surname])
VALUES (N'12.5.2009', 0, 1, N'TeachersB', N'PositionA', 750, 2000, 'SurnameB')

INSERT INTO Teachers([EmploymentDate], [IsAssistant], [IsProfessor], [Name], [Position], [Premium], [Salary], [Surname])
VALUES (N'11.8.2008', 1, 0, N'TeachersC', N'PositionB', 500, 1400, 'SurnameC')

INSERT INTO Teachers([EmploymentDate], [IsAssistant], [IsProfessor], [Name], [Position], [Premium], [Salary], [Surname])
VALUES (N'8.22.2011', 0, 1, N'TeachersD', N'PositionB', 450, 900, 'SurnameD')

INSERT INTO Teachers([EmploymentDate], [IsAssistant], [IsProfessor], [Name], [Position], [Premium], [Salary], [Surname])
VALUES (N'7.18.2012', 1, 0, N'TeachersE', N'PositionC', 150, 700, 'SurnameE')

INSERT INTO Teachers([EmploymentDate], [IsAssistant], [IsProfessor], [Name], [Position], [Premium], [Salary], [Surname])
VALUES (N'10.9.2005', 0, 1, N'TeachersF', N'PositionC', 350, 860, 'SurnameF')

INSERT INTO Teachers([EmploymentDate], [IsAssistant], [IsProfessor], [Name], [Position], [Premium], [Salary], [Surname])
VALUES (N'10.11.1998', 1, 0, N'TeachersG', N'PositionD', 200, 6777, 'SurnameG')


INSERT INTO Departments(Financing, Name)
VALUES (10000, N'DepartmentsA')
INSERT INTO Departments(Financing, Name)
VALUES (5000, N'DepartmentsB')
INSERT INTO Departments(Financing, Name)
VALUES (11000, N'DepartmentsC')
INSERT INTO Departments(Financing, Name)
VALUES (7000, N'DepartmentsD')
INSERT INTO Departments(Financing, Name)
VALUES (8000, N'DepartmentsE')
INSERT INTO Departments(Financing, Name)
VALUES (9000, N'DepartmentsF')
INSERT INTO Departments(Financing, Name)
VALUES (12000, N'DepartmentsG')

INSERT INTO Faculties(Dean, Name)
VALUES (N'DeanA', N'Computer Science')
INSERT INTO Faculties(Dean, Name)
VALUES (N'DeanB', N'Computer computer')
INSERT INTO Faculties(Dean, Name)
VALUES (N'DeanC', N'Computer a')
INSERT INTO Faculties(Dean, Name)
VALUES (N'DeanD', N'Computer b')
INSERT INTO Faculties(Dean, Name)
VALUES (N'DeanE', N'Computer c')
INSERT INTO Faculties(Dean, Name)
VALUES (N'DeanE', N'Computer c')
INSERT INTO Faculties(Dean, Name)
VALUES (N'DeanF', N'Software of Department')

--1
SELECT *
FROM Departments
ORDER BY [Id] DESC;

--2
SELECT [Name] AS [Group Name], [Rating] AS [Group Rating]
FROM Groups;

--3 доделать
SELECT [Surname],
       [Premium] / (([Salary] + [Premium]) / 100) AS [Rate to premium],
       [Salary] / (([Salary] + [Premium]) / 100)  AS [Rate to salary]
FROM Teachers;

--4
SELECT CONCAT(N'The dean faculty ', [Name] + ' is ', [Financing])
FROM Departments;

--5
SELECT *
FROM Teachers
WHERE Teachers.IsProfessor = 1
  AND Teachers.Salary + Teachers.Premium >= 1050;

--6
SELECT *
FROM Departments
WHERE Financing <= 11000
   OR Financing >= 25000;

--7
SELECT *
FROM Faculties
WHERE Name != N'Computer Science';

--8
SELECT [Name], [Surname]
FROM Teachers
WHERE [IsProfessor] = 0;

--9
SELECT [Surname], [IsAssistant], [IsProfessor], [Salary], [Premium]
FROM Teachers
WHERE [IsAssistant] = 0
  AND 550 >= [Salary]
  AND [Salary] >= 160;

--10
SELECT [Surname], [Salary] + [Premium] as [TotalSalary]
FROM Teachers
WHERE [IsAssistant] = 1;

--11
SELECT [Surname], [IsAssistant], [IsProfessor]
FROM Teachers
WHERE [EmploymentDate] <= N'01.01.2000';

--12
SELECT [Name] AS [Name of Department]
FROM Faculties
WHERE [Name] < N'Software of Department'
ORDER BY [Name];

--13
SELECT [Surname]
FROM Teachers
WHERE IsAssistant = 1
  AND [Salary] + [Premium] <= 1200;

--14
SELECT [Name]
FROM Groups
WHERE [Year] = 1
  AND [Rating] >= 2
  AND [Rating] <= 4;

--15
SELECT [Surname]
FROM Teachers
WHERE Salary <= 550
  AND [Premium] <= 200;
