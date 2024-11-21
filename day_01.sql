SHOW DATABASES;
CREATE DATABASE IF NOT EXISTS techforallwithpriya;
USE techforallwithpriya;

CREATE TABLE IF NOT EXISTS employee(
EID INT PRIMARY KEY,
FirstName varchar(50) NOT NULL,
LastName varchar(50) NOT NULL,
Age INT NOT NULL,
Salary INT NOT NULL,
Location VARCHAR(50) NOT NULL
);
SHOW TABLES;
CREATE TABLE IF NOT EXISTS employee_1(
EID INT ,
FirstName varchar(50) NOT NULL,
LastName varchar(50) NOT NULL,
Age INT NOT NULL,
Salary INT NOT NULL,
Location VARCHAR(50) NOT NULL,
primary key(EID)
);
SHOW TABLES;

DESC employee;

INSERT INTO employee VALUES (1, "Mrityunjay", "Kumar", 23, 75000, "Indore");

DROP TABLE employee;

CREATE TABLE IF NOT EXISTS employee(
EID INT  AUTO_INCREMENT,
FirstName varchar(50) NOT NULL,
LastName varchar(50) NOT NULL,
Age INT NOT NULL,
Salary INT NOT NULL,
Location VARCHAR(50) NOT NULL,
PRIMARY KEY (EID)
);


INSERT INTO employee(FirstName, LastName, Age, Salary, Location) VALUES ("Mrityunjay", "Kumar", 23, 75000, "Indore");
INSERT INTO employee(FirstName, LastName, Age, Salary, Location) VALUES ("Priya", "Kumari", 29, 85000, "Banglore");
INSERT INTO employee(FirstName, LastName, Age, Salary, Location) VALUES ("Mithu", "Kumari", 18, 170000, "Noida");
SELECT * FROM EMPLOYEE;

SELECT * FROM EMPLOYEE WHERE SALARY > 100000;

-- Write a command to fetch records of the employee having age more than 25


SELECT * FROM EMPLOYEE WHERE AGE > 25;

--  Update the last name of  Mrityunjay whose EID = 2
UPDATE employee SET LastName = "Rai" WHERE EID = 2 ; 

-- Delete the record whose EID = 3
DELETE FROM employee where EID = 3