# You have been apprached by a client who runs a small chai store and wants to set up a simple database to manage their chai offerings. The cliend has provided the following requirements.

#Database Setup:

#create a new database name chai_store_db for managing chai products.alter;

CREATE DATABASE chai_store_db;

#Chai Table:
#Create a table called chai_store with the following columns:
#id: A unique identifier for each chai (auto-incrementing)
#chai_name: The name of the chai (e.g., "Masala Chai, "Green Chai").
#price: The price of each chai.
#chai_type: Type of chai (e.g., "Spiced", "Herbal", "Cold").
#available: Boolean value indicating if the chai is currently available or not.

USE chai_store_db;

CREATE TABLE chai_store(
id 			SERIAL PRIMARY KEY,
chai_name	VARCHAR(40),
price 		DECIMAL(5, 2),
chai_type	VARCHAR(40),
available	BOOLEAN
);

#Initial Data Insertion:
#The client provides a list of their chai offerings and wants you to insert the follwing data:

#Masala Chai - 30 - Spiced - Available
#Green Chai 25 Herbal Available
#Black Chai 20 Classic Available
#Iced Chai 35 Cold Not Available
#Oolong Chai 40 Speciality Available

INSERT INTO chai_store(
chai_name, price, chai_type, available
) VALUES
('Masala Chai', 30.00, 'Spiced', TRUE),
('Green Chai', 25.00, 'Herbal', TRUE), 
('Black Chai', 20.00, 'Herbal', TRUE),
('Iced Chai', 35.00, 'Cold', FALSE),
('Oolong Chai', 40.00, 'Speciality', TRUE);

SELECT * FROM chai_store;

#Data Queries:
# The cliend needs some reports: 
# - Display all chai name and prices using column aliased like "Chai Name" and "Cost in INR"

SELECT chai_name AS "Chai Name", price AS "Cost in INR" FROM chai_store;

#Find all the chai varieties that have the word "Chai" in their name;

SELECT * FROM chai_store WHERE chai_name LIKE '%Chai%';

#Find all the chai varieties that have price less than 30.

SELECT * FROM chai_store WHERE price<30;

#Show chai varieties sorted by price form highest to lowest.

SELECT * FROM chai_store ORDER BY price DESC; 

#Data Updates: 
#The client wants to update the price of "Iced Chai" to 38 and mark it as available;

UPDATE chai_store SET price = 38.00, available = TRUE WHERE chai_name = 'Iced Chai';


#Data Deletions:
#The client decideds to discontinue "Black Chai" and requests it's removal from the database.

DELETE FROM chai_store WHERE chai_name = 'Black Chai';

SELECT * FROM chai_store;     


# Just practising DDL commands


ALTER TABLE products ADD stock INT DEFAULT 0;

ALTER TABLE poducts ALTER COLUMN price TYPE DECIMAL(12, 2);

ALTER TABLE products DROP COLUMN category;

DROP TABLE products;

TRUNCATE TABLE products;

ALTER TABLE products RENAME TO inventory;

ALTER TABLE products RENAME COLUMN p_name TO product_name;

#Practising DML commands

INSERT INTO products (name, price, stock)
VALUES('Tshirt', 500.00, 10);

UPDATE products SET price  = 800.00 WHERE name = 'Tshirt';

DELETE FROM  products WHERE name = 'Tshirt';

SELECT * FROM products;

SELECT name AS "T-Shirt", price AS "Price in INR" FROM products WHERE price>200;

# Practising DCL commands

GRANT SELECT ON products TO hitesh;

GRANT INSERT,UPDATE ON products TO sales_team;

REVOKE SELECT ON products FROM hitesh;

REVOKE INSERT, UPDATE ON products FROM sales_team;

#Practising TCL commands

BEGIN;
INSERT INTO products (name, price, stock)
VALUE ('Jacket', 3000.00, 5);
UPDATE inventory SET stock = stock-5 WHERE name = 'Jacket';
COMMIT;


BEGIN;
-- Create a savepoint
SAVEPOINT savepoint1;
-- perform some operation 
INSERT INTO products (name, price, stock) VALUES ('Jeans', 3000.00, 60);
-- rollback to savepoint if something goes wrong
ROLLBACK TO savepoint1;