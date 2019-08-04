USE SoftUni
GO

-- 01. Employee Address 
SELECT TOP(5) e.EmployeeID, 
              e.JobTitle, 
		      e.AddressID, 
		      a.AddressText
         FROM Employees AS e
   INNER JOIN Addresses AS a
           ON a.AddressID = e.AddressID
     ORDER BY e.AddressID ASC

-- 02. Addresses with Towns 
SELECT TOP(50) e.FirstName,
	           e.LastName,
			   t.Name AS [Town],
			   a.AddressText
		  FROM Employees AS e
	INNER JOIN Addresses AS a
			ON a.AddressID = e.AddressID
	INNER JOIN Towns AS t
			ON t.TownID = a.TownID
	  ORDER BY e.FirstName ASC, e.LastName

-- 03. Sales Employees 
    SELECT e.EmployeeID,
	       e.FirstName,
	       e.LastName,
	       d.Name AS [DepartmentName]
      FROM Employees AS e
INNER JOIN Departments AS d
        ON d.DepartmentID = e.DepartmentID
     WHERE d.Name = 'Sales'
  ORDER BY e.EmployeeID ASC

-- 04. Employee Departments
SELECT TOP(5) e.EmployeeID,
	          e.FirstName,
	          e.Salary,
			  d.Name AS [DepartmentName]
	     FROM Employees AS e
   INNER JOIN Departments AS d
		   ON d.DepartmentID = e.DepartmentID
		WHERE e.Salary > 15000
     ORDER BY d.DepartmentID ASC

-- 05. Employees Without Projects 
  SELECT TOP(3) e.EmployeeID,
	            e.FirstName
           FROM Employees AS e
LEFT OUTER JOIN EmployeesProjects AS ep
			 ON ep.EmployeeID = e.EmployeeID
		  WHERE ep.EmployeeID IS NULL
	   ORDER BY e.EmployeeID ASC
	   
-- 06. Employees Hired After
	SELECT e.FirstName,
           e.LastName,
		   e.HireDate,
	       d.Name AS [DeptName]
      FROM Employees AS e
INNER JOIN Departments AS d
		ON d.DepartmentID = e.DepartmentID
	 WHERE e.HireDate > '1-1-1999'
	   AND d.Name IN ('Sales', 'Finance')
  ORDER BY e.HireDate ASC

-- 07. Employees With Project
SELECT TOP(5) e.EmployeeID,
			  e.FirstName,
			  p.Name AS [ProjectName]
		 FROM Employees AS e
   INNER JOIN EmployeesProjects AS ep
		   ON ep.EmployeeID = e.EmployeeID
   INNER JOIN Projects AS p
		   ON p.ProjectID = ep.ProjectID
		WHERE p.StartDate > '08-13-2002'
		  AND p.EndDate IS NULL
	 ORDER BY e.EmployeeID ASC
