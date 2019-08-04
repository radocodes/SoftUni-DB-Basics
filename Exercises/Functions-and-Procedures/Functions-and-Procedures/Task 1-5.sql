USE SoftUni
GO

-- 01. Employees with Salary Above 35000 
CREATE PROCEDURE usp_GetEmployeesSalaryAbove35000
			  AS
		  SELECT e.FirstName,
				 e.LastName
			FROM Employees AS e
		   WHERE e.Salary > 35000
			  GO

-- 02. Employees with Salary Above Number
CREATE PROC usp_GetEmployeesSalaryAboveNumber (@number DECIMAL(18,4))
		 AS
		 SELECT e.FirstName,
				e.LastName
		   FROM Employees AS e
		  WHERE e.Salary >= @number
			 GO

-- 03. Town Names Starting With 
CREATE PROCEDURE usp_GetTownsStartingWith (@stringPattern VARCHAR(10))
			  AS
		  SELECT t.Name AS Town
	        FROM Towns AS t
		   WHERE LEFT(t.Name, LEN(@stringPattern)) = @stringPattern
		      GO

-- 04. Employees from Town
CREATE PROC usp_GetEmployeesFromTown (@townName VARCHAR(10))
         AS
     SELECT e.FirstName,
			e.LastName
	   FROM Employees AS e
 INNER JOIN Addresses AS a
		 ON a.AddressID = e.AddressID
 INNER JOIN Towns AS t
		 ON t.TownID = a.TownID
	  WHERE t.Name = @townName
	     GO
		
-- 05. Salary Level Function 
CREATE FUNCTION ufn_GetSalaryLevel(@salary DECIMAL(18,4))
RETURNS VARCHAR(10)
			 AS
		  BEGIN 
		DECLARE @salaryLevel VARCHAR(10)
		    SET @salaryLevel = 
		   CASE 
		   WHEN @salary < 30000
		   THEN 'Low'
		   WHEN  @salary BETWEEN 30000 AND 50000
		   THEN 'Average'
		   ELSE  'High'
			END
		 RETURN @salaryLevel
			END
			 GO

