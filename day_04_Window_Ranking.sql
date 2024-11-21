SHOW DATABASES;
USE techforallwithpriya;

SHOW TABLES;

-- For each location, what is the count of each employee and avg salary of the employee in those location

SELECT * FROM employee;

SELECT Location, COUNT(Location) AS total, AVG(Salary) AS averageSalary FROM employee GROUP BY Location;

-- For each location, what is the count of each employee and avg salary each employee in those location 
-- But, also display first name and last name corresponding to each record.

SELECT FirstName, LastName, employee.Location, Total, averageSalary 
FROM employee
JOIN
(SELECT Location, COUNT(Location) AS total, AVG(Salary) AS averageSalary FROM employee GROUP BY Location) AS temp
ON employee.Location = temp.Location;

-- Join are computationally high, so we try to avoid it.
-- PARTITION BY came in picture.

SELECT FirstName, LastName, Location, 
COUNT(Location) OVER (PARTITION BY Location) AS total, 
AVG(Salary) OVER (PARTITION BY Salary) AS averageSalary 
FROM employee ;

-- SORT the  employee as per salary.

SELECT FirstName, LastName, Salary,
ROW_NUMBER() OVER (ORDER BY Salary DESC) AS priority_employee
FROM employee;


SELECT FirstName, LastName, Salary,
RANK() OVER (ORDER BY Salary DESC) AS priority_employee
FROM employee;

SELECT FirstName, LastName, Salary,
DENSE_RANK() OVER (ORDER BY Salary DESC) AS priority_employee
FROM employee;

-- Give the record of the employee having second highest salary 
SELECT * FROM
(SELECT FirstName, LastName, Salary,
DENSE_RANK() OVER (ORDER BY Salary DESC) AS priority_employee
FROM employee ) AS temp
WHERE  priority_employee=2;

-- Give the record of the employee having second highest salary who joined the company early
SELECT * FROM
(SELECT FirstName, LastName, Salary,
ROW_NUMBER() OVER (ORDER BY Salary DESC) AS priority_employee
FROM employee ) AS temp
WHERE  priority_employee=2;

-- Specify the details of highest salary people in each location.

SELECT * FROM
(SELECT FirstName, LastName, Salary,
ROW_NUMBER() OVER (PARTITION BY Location ORDER BY Salary DESC) AS priority_employee
FROM employee ) AS temp
WHERE  priority_employee=1;



SELECT * FROM employee;
