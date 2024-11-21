CREATE DATABASE join_test;

USE join_test;

CREATE TABLE cutomers(
customer_id INT PRIMARY KEY,
cutomer_name VARCHAR(50)
);


CREATE TABLE order_s (
order_id INT PRIMARY KEY,
customer_id INT,
product_name VARCHAR(100),
quantity INT,
FOREIGN KEY (cutomer_id) REFERENCES cutomers(customer_id)
);

ALTER TABLE cutomers RENAME TO customers;
ALTER TABLE customers RENAME COLUMN cutomer_name TO customer_name;
ALTER TABLE order_s RENAME COLUMN cutomer_id TO customer_id;


INSERT INTO customers (customer_id, customer_name) VALUES
(1, 'Alice'),
(2, 'Bob'),
(3, 'Charlie'),
(4, 'David'),
(5, 'Eve');

-- Insert data into order table

INSERT INTO order_s( order_id, customer_id, product_name, quantity) VALUES 
(101, 1, 'T-shirt', 2),
(102, 1, 'Jeans' , 1),
(103, 2, 'Jacket', 1),
(104, NULL, 'Sneakers', 2); -- oder id with no cutomer id

-- (105, 6, 'Hat', 1); -- order with invalid cutomer id.. this query will not run as there is no cutomer_id 6 in the customer table.


SELECT * FROM customers;
SELECT * FROM order_s;


-- Performing Join

SELECT c.customer_name, o.product_name, o.quantity
FROM customers c
JOIN order_s o ON c.customer_id = o.customer_id;

SELECT c.customer_name, o.product_name, o.quantity
FROM customers c
INNER JOIN order_s o ON c.customer_id = o.customer_id;

SELECT c.customer_name, o.product_name, o.quantity
FROM customers c
LEFT JOIN order_s o ON c.customer_id = o.customer_id;

SELECT c.customer_name, o.product_name, o.quantity
FROM customers c
RIGHT JOIN order_s o ON c.customer_id = o.customer_id;



SELECT c.customer_name, o.product_name, o.quantity
FROM customers c
CROSS JOIN order_s o ;


-- INNER Query 

SELECT customer_name
FROM customers 
WHERE customer_id IN(
			SELECT customer_id
            FROM order_s
            WHERE product_name = 'T-shirt'
            );
            
SELECT customer_id
            FROM order_s
            WHERE product_name = 'T-shirt'