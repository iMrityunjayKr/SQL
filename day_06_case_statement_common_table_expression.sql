USE  techforallwithpriya;
SHOW TABLES;
SELECT * FROM employee;
SELECT * FROM courses;
SELECT * FROM learner;

-- Case Statements in SQL
/* 
Create a new column named "CourseFeeStatus"
CourseFee>3999 -> expensive
CourseFee>1499 -> moderate
ELSE -> cheap
*/
SELECT CourseID, CourseName, CourseFee,
CASE
	WHEN CourseFee>3999 THEN 'Expensive Course'
    WHEN CourseFee>1499 THEN 'Moderate Course'
    ELSE 'Cheap Course'
    END AS CourseFeeStatus
FROM courses;


-- CASE Expression in SQL
-- CourseType: Premium Course, Plus Course, Regular Course

SELECT CourseID, CourseName, CourseFee,
	CASE CourseFee
				WHEN 4499 THEN 'Premium Course'
                WHEN 2499 THEN 'Plus Course'
                ELSE 'Regular Course'
			END AS CourseType
FROM courses;
                
-- Create a new table "Orders" in the techforallwithpriya 
-- OrderId -> PRIMARY KEY AUTO_INCREMENT
-- Order_date
-- Order-student_id
-- Order_status -> Complete, Pending, Closed

CREATE TABLE orders(orderid INT PRIMARY KEY AUTO_INCREMENT,
orderDate TIMESTAMP NOT NULL,
order_learner_id INT NOT NULL,
order_status VARCHAR(50),
FOREIGN KEY (order_learner_id) REFERENCES learner(LearnerID)
);
DESC orders;
DROP TABLE orders;

-- Insertion of the data

SELECT * FROM learner;

INSERT INTO orders(orderDate, order_learner_id, order_status) VALUES('2024-01-16',1,'Complete');
INSERT INTO orders(orderDate, order_learner_id, order_status) VALUES('2024-01-12',2,'Complete');
INSERT INTO orders(orderDate, order_learner_id, order_status) VALUES('2024-02-24',1,'Pending');
INSERT INTO orders(orderDate, order_learner_id, order_status) VALUES('2024-05-28',3,'Complete');
INSERT INTO orders(orderDate, order_learner_id, order_status) VALUES('2024-08-29',5,'Pending');
INSERT INTO orders(orderDate, order_learner_id, order_status) VALUES('2024-01-12',4,'Complete');
INSERT INTO orders(orderDate, order_learner_id, order_status) VALUES('2024-01-12',5,'Complete');
INSERT INTO orders(orderDate, order_learner_id, order_status) VALUES('2024-01-12',2,'Pending');
SELECT * FROM orders;


-- total orders per student
SELECT order_learner_id, COUNT(*) as total_order
FROM orders
group by order_learner_id;

--  total orders per student 
-- Order_learner_id, LearnerFirstName, LearnerLastName,  Total_oders
SELECT temp.Order_learner_id, LearnerFirstName, LearnerLastName, temp.total_order FROM learner
JOIN
(SELECT order_learner_id, COUNT(*) as total_order
FROM orders
GROUP BY order_learner_id) AS temp
ON
learner.learnerID = temp.order_learner_id;

-- total orders per student 
-- Order_learner_id, LearnerFirstName, LearnerLastName,  Total_oders, Avg_Orders
-- COMPLEX QUERY

SELECT temp.order_learner_id, LearnerFirstName, LearnerLastName, temp.total_order, AVG(SUM(temp.total_order)) OVER() AS avg_order_entire_student
FROM
	(SELECT order_learner_id, COUNT(*) as total_order
		FROM orders
		GROUP BY order_learner_id) AS temp
JOIN 
	learner
ON
temp.order_learner_id = learner.learnerID
GROUP BY 
temp.order_learner_id

-- how can we simplify this table: then we use common table Expressions







