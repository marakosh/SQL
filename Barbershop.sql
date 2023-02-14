CREATE TABLE barbers (
id INT PRIMARY KEY,
full_name VARCHAR(255),
gender VARCHAR(10),
phone_number VARCHAR(20),
email VARCHAR(255),
date_of_birth DATE,
hire_date DATE,
position VARCHAR(20)
);

CREATE TABLE feedbacks (
id INT PRIMARY KEY,
barber_id INT,
client_id INT,
feedback VARCHAR(255),
rating VARCHAR(20),
FOREIGN KEY (barber_id) REFERENCES barbers(id),
FOREIGN KEY (client_id) REFERENCES clients(id)
);

CREATE TABLE schedules (
id INT PRIMARY KEY,
barber_id INT,
date_available DATE,
time_available TIME,
FOREIGN KEY (barber_id) REFERENCES barbers(id)
);

CREATE TABLE appointments (
id INT PRIMARY KEY,
barber_id INT,
client_id INT,
date_booked DATE,
time_booked TIME,
FOREIGN KEY (barber_id) REFERENCES barbers(id),
FOREIGN KEY (client_id) REFERENCES clients(id)
);

CREATE TABLE clients (
id INT PRIMARY KEY,
full_name VARCHAR(255),
phone_number VARCHAR(20),
email VARCHAR(255),
feedback VARCHAR(255),
rating VARCHAR(20)
);

CREATE TABLE visit_history (
id INT PRIMARY KEY,
client_id INT,
barber_id INT,
service_id INT,
date_visited DATE,
total_cost DECIMAL(10,2),
rating VARCHAR(20),
feedback VARCHAR(255),
FOREIGN KEY (client_id) REFERENCES clients(id),
FOREIGN KEY (barber_id) REFERENCES barbers(id),
FOREIGN KEY (service_id) REFERENCES services(id)
);

GO
CREATE FUNCTION GetBarbers()
RETURNS TABLE
AS RETURN (SELECT FirstName, LastName, MiddleName FROM Barbers)
GO

GO
CREATE FUNCTION GetSeniorBarbers()
RETURNS TABLE
AS RETURN (SELECT * FROM Barbers WHERE Position = 'Senior')
GO

GO
CREATE FUNCTION GetBarbersForTraditionalBeardShave()
RETURNS TABLE
AS RETURN (SELECT * FROM Barbers WHERE TraditionalBeardShave = 1)
GO

GO
CREATE FUNCTION GetBarbersForService(@service NVARCHAR(50))
RETURNS TABLE
AS RETURN (SELECT * FROM Barbers WHERE [Service] = @service)
GO

GO
CREATE FUNCTION GetBarbersByExperience(@years INT)
RETURNS TABLE
AS RETURN (SELECT * FROM Barbers WHERE DATEDIFF(year, HireDate, GETDATE()) >= @years)
GO

GO
CREATE PROCEDURE GetBarberCountByPosition
AS
BEGIN
    SELECT COUNT(*) AS JuniorBarberCount FROM Barbers WHERE Position = 'Junior'
    SELECT COUNT(*) AS SeniorBarberCount FROM Barbers WHERE Position = 'Senior'
END
GO

GO
CREATE PROCEDURE GetFrequentCustomers(@visits INT)
AS
BEGIN
    SELECT FirstName, LastName, MiddleName, Phone, Email FROM Customers
    WHERE (SELECT COUNT(*) FROM Appointments WHERE Appointments.CustomerId = Customers.Id) >= @visits
END
GO

GO
CREATE TRIGGER PreventChiefBarberDelete ON Barbers
FOR DELETE
AS
IF (SELECT COUNT(*) FROM Barbers WHERE Position = 'Chief') < 2
BEGIN
    RAISERROR('Cannot delete chief barber. There must be at least two chief barbers.', 16, 1)
    ROLLBACK TRANSACTION
END
GO

GO
CREATE TRIGGER usl_2
ON Читатели
FOR INSERT, UPDATE
AS
IF EXISTS(
SELECT Дата_рождения
FROM INSERTED
WHERE DATEDIFF (year, Дата_рождения, GETDATE())<17
)
ROLLBACK TRAN;
GO