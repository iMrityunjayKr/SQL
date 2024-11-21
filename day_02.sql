/* create table having course id,
courseName, CourseDuration,
courseFee
*/
show databases;
USE  techforallwithpriya;

CREATE TABLE COURSES(
CourseId INT AUTO_INCREMENT,
CourseName VARCHAR(50) NOT NULL,
CourseDurationMonths INT NOT NULL,
CourseFee INT NOT NULL,
PRIMARY KEY(CourseId)

);

DROP TABLE COURSES;
DESC courses;
ALTER TABLE COURSES DROP COLUMN CourseDuration ;
ALTER TABLE COURSES DROP COLUMN CourseFee ;
ALTER TABLE COURSES ADD COLUMN CourseDurationMonths INT NOT NULL ;
ALTER TABLE COURSES ADD COLUMN CourseFee INT NOT NULL ;

SELECT * FROM COURSEs;
SELECT * FROM employee ;

INSERT INTO COURSES(CourseName, CourseDurationMonths, CourseFee) VALUES("The Excel Mastery Course", 2 , 1499);
INSERT INTO COURSES(CourseName, CourseDurationMonths, CourseFee) VALUES("DSA For Interview Preparation", 2 , 4499);
INSERT INTO COURSES(CourseName, CourseDurationMonths, CourseFee) VALUES("SQL Bootcamp", 1 , 2499);


CREATE TABLE LEARNER(
LearnerID INT AUTO_INCREMENT,
LearnerFirstName VARCHAR(50) NOT NULL,
LearnerLastName VARCHAR(50) NOT NULL,
LearnerPhoneNo VARCHAR(10)  NOT NULL,
LearnerEmailID VARCHAR(50),
LearnerEnrollmentDate TIMESTAMP NOT NULL,
SelectedCourse INT NOT NULL,
YearOfExperience VARCHAR(50) NOT NULL,
LearnerCompany VARCHAR(50) ,
SourceOfJoining VARCHAR(50) NOT NULL,
BatchStartingDate TIMESTAMP NOT NULL,
Location VARCHAR(50) NOT NULL,
PRIMARY KEY (LearnerID),
UNIQUE  (LearnerEmailID),
FOREIGN KEY(SelectedCourse) REFERENCES Courses(CourseID)
);
DROP TABLE LEARNER;
DESC LEARNER;
SELECT * FROM LEARNER;
INSERT INTO LEARNER(LearnerFirstName,LearnerLastName,LearnerPhoneNo,LearnerEmailID,LearnerEnrollmentDate,SelectedCourse,YearOfExperience,LearnerCompany,SourceOfJoining,BatchStartingDate,Location) VALUES("Mrityunjay","Kumar","9939099390","kmrityunjay@gmail.com", '2024-07-23',1, 1,"Amazon", "LinkedIN",'2024-07-25',"Indore");
INSERt INTO LEARNER(LearnerFirstName,LearnerLastName,LearnerPhoneNo,LearnerEmailID,LearnerEnrollmentDate,SelectedCourse,YearOfExperience,LearnerCompany,SourceOfJoining,BatchStartingDate,Location) VALUES("Akhil","George","9925499390","akhil.george.8743@gmail.com", '2024-07-23',1, 1,"Flipkart", "Community",'2024-07-25',"Patna");
INSERt INTO LEARNER(LearnerFirstName,LearnerLastName,LearnerPhoneNo,LearnerEmailID,LearnerEnrollmentDate,SelectedCourse,YearOfExperience,LearnerCompany,SourceOfJoining,BatchStartingDate,Location) VALUES("Rishikesh","Joshi","9939257790","carjkop@gmail.com", '2024-07-24',2, 1,"Cisco", "Youtube",'2024-07-28',"Punjab");

UPDATE LEARNER SET LearnerFirstName = "Akhil",  LearnerLastName = "George"   WHERE LearnerID = 2;

INSERt INTO LEARNER(LearnerFirstName,LearnerLastName,LearnerPhoneNo,LearnerEmailID,LearnerEnrollmentDate,SelectedCourse,YearOfExperience,LearnerCompany,SourceOfJoining,BatchStartingDate,Location) VALUES("Madhuram","Ravichandran","9211257790","ravichandran.madhura@gmail.com", '2024-07-25',2, 2,"Morgan Stanley", "Youtube",'2024-07-30',"Gujrat");
INSERt INTO LEARNER(LearnerFirstName,LearnerLastName,LearnerPhoneNo,LearnerEmailID,LearnerEnrollmentDate,SelectedCourse,YearOfExperience,LearnerCompany,SourceOfJoining,BatchStartingDate,Location) VALUES("Jeevan","Hegde","9745057790","jeevanhegdek@yahoo.co.in", '2024-07-24',3, 3,"Microsoft", "LinkedIN",'2024-08-02',"Kolkata");



-- Data Analysis [Employee, Course, Learner]
-- 1. Give me the record of the employee

SELECT * FROM EMPLOYEE ORDER BY SALARY DESC LIMIT 2;

-- 2. Give me the record of the employee getting highest salary and age is bigger than 30
SELECT * FROM EMPLOYEE;

SELECT * FROM EMPLOYEE WHERE AGE > 25 ORDER BY SALARY DESC LIMIT 1;

-- Display the number of enrollments in the website of techwithpriyaforall

SELECT COUNT(*) as num_of_enrollments FROM LEARNER;

-- Display the number of enrollments for the courseid = 3 [SQL Bootcamp]

SELECT COUNT(*) as no_of_enrollment_for_SQL_Bootcamp FROM LEARNER WHERE SELECTEDCOURSE=3;

-- 5. Count the number of learner enrolled in the month of jan

SELECT COUNT(*) as num_learner_in_jan FROM LEARNER WHERE LearnerEnrollmentDate LIKE '%-07-%';

-- Count the number of learner enrolled on 23 july

SELECT COUNT(*) as num_learner_in_jan FROM LEARNER WHERE LearnerEnrollmentDate LIKE '%-07-23%';

-- 6. Update the Jeevan data with year of experience as 1 and learner company as "Amazon"

UPDATE LEARNER SET LearnerCompany = "Amazon", YearOfExperience = 2 WHERE LearnerID=5;

SELECT * FROM LEARNER;

-- 7. Count the number of companies where learners currently doing their job

SELECT COUNT( LearnerCompany)  FROM LEARNER;
SELECT COUNT(DISTINCT LearnerCompany)  FROM LEARNER;





