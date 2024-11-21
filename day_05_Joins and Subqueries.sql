SHOW DATABASES;
USE  techforallwithpriya;
SHOW TABLES;
SELECT * FROM employee;
SELECT * FROM courses;
SELECT * FROM learner;

-- Which courses have the highest enrollment rates?
SELECT SelectedCourse,
COUNT(*) AS enrollmentCount 
FROM Learner 
GROUP BY SelectedCourse 
ORDER BY enrollmentCount DESC LIMIT 1;

-- Which courses have the highest enrollment rates? Also print courseid, courseName, EnrollmentCount
SELECT courseId, CourseName, temp.enrollmentCount 
FROM courses
JOIN
(SELECT SelectedCourse,
COUNT(*) AS enrollmentCount 
FROM Learner 
GROUP BY SelectedCourse 
ORDER BY enrollmentCount DESC LIMIT 1) as temp
ON
Courses.courseId = temp.selectedCourse;

-- ANOTHER WAY TO SOLVE ABOVE PROBLEM.

SELECT courseId, CourseName,COUNT(*) as enrollmentCount
FROM Learner
JOIN courses
ON Learner.selectedCourse=courses.CourseId
GROUP BY selectedCourse
ORDER BY enrollmentCount DESC LIMIT 1;

 -- first answer is more optimised as join is an expensive operation. 
 -- 2 nd solution joins first that is more expensive as operatioin. 
 -- 1 st is more optimized as it filters out the stuff first and then joins the table.