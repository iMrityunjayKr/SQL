CREATE DATABASE normal_test;

CREATE TABLE orders(
order_id SERIAL PRIMARY KEY,
customer_name VARCHAR(50),
products VARCHAR (233),
quantities VARCHAR(100)
);

INSERT INTO orders(customer_name,products,quantities)
VALUES
('Alice', 'T-shirt, Jeans', '2 1'); -- bad practise, can't store values as array.

SELECT * FROM orders;