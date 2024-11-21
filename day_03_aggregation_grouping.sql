USE techforallwithpriya;
SHOW TABLES;

SELECT * FROM learner;

SELECT * FROM courses;
SELECT COUNT(SourceOfJoining) FROM learner;

-- Count of the number of students who joined the course via linkedIn, youTube, Community;
SELECT SourceOfJoining,  COUNT(*) AS no_of_students FROM learner GROUP BY SourceOfJoining;

-- corresponding to each course, how many students have enrolled.

SELECT SelectedCourse, COUNT(*) as no_of_student_erolled_in_the_course FROM Learner GROUP BY SelectedCourse;

-- Corresponding to individual source of joining, give the maximum years of experience any person holds.

SELECT SourceOfJoining, MAX(YearOfExperience) AS max_exp FROM learner GROUP BY SourceOfJoining;

-- Corresponding to individual source of joining, give the minimum years of experience any person holds.

SELECT SourceOfJoining, MIN(YearOfExperience) AS min_exp FROM learner GROUP BY SourceOfJoining;

-- Corresponding to individual source of joining, give the average years of experience any person holds.

SELECT SourceOfJoining, AVG(YearOfExperience) AS avg_exp FROM learner GROUP BY SourceOfJoining;

-- Display the records of those learners who have joined the course via more than 1 source of joining

SELECT SourceOfJoining, COUNT(*) AS num_of_students
FROM learner
GROUP BY SourceOfJoining
HAVING num_of_students>1;

-- Display the count of those students who joined via LinkedIn

SELECT SourceOfJoining, COUNT(*) AS no_of_students 
FROM learner
GROUP BY SourceOfJoining
HAVING SourceOfJoining = "LinkedIn";

-- Display the course which doesn't include "Excel"

SELECT * FROM courses
WHERE CourseName NOT LIKE "%Excel%";

-- Display the records of those students who have less than 4 years of experience and source of joining as youtube and location is Indore; 
SELECT * FROM learner;

SELECT SourceOfJoining, YearOfExperience FROM learner WHERE SourceOfJoining = "Youtube"  AND YearOfExperience<4  AND Location = "Punjab" ;

-- Display the records of those student who have experience btween 1 to 3 years.

SELECT * FROM learner WHERE YearOfExperience BETWEEN 1 AND 3; 

-- ALTER COMMAND IN SQL

DESC employee;
SELECT * FROM employee;

ALTER TABLE employee ADD COLUMN jobposition VARCHAR(50); -- DDL command 
ALTER TABLE employee MODIFY COLUMN FirstName VARCHAR(40); -- DDL command
ALTER TABLE employee DROP PRIMARY KEY ;



