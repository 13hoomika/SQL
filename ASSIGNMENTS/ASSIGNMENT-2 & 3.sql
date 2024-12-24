CREATE DATABASE ASSIGNMENT2;
USE ASSIGNMENT2;

CREATE TABLE ORDERS(
ORDER_ID INT AUTO_INCREMENT PRIMARY KEY,
PRODUCT_ID INT UNIQUE NOT NULL,
QUANTITY INT NOT NULL,
PRICE DECIMAL(5,2),
CUSTOMER_ID VARCHAR(10) NOT NULL UNIQUE
);

INSERT INTO ORDERS(PRODUCT_ID,QUANTITY,PRICE,CUSTOMER_ID) VALUES
(101,4,259.99,"C01"),
(102,2,39.99,"C02"),
(103,6,59.99,"C03"),
(104,5,999.00,"C04"),
(105,10,736.00,"C05");
	-- TRUNCATE TABLE ORDERS;
SELECT * FROM ORDERS;

CREATE TABLE PRODUCTS( 
PRODUCT_ID INT UNIQUE NOT NULL, 
PRODUCT_NAME VARCHAR(50) NOT NULL UNIQUE,  
PRICE DECIMAL(5,2) NOT NULL
); 
	-- DROP TABLE PRODUCTS;
INSERT INTO PRODUCTS(PRODUCT_ID,PRODUCT_NAME,PRICE) VALUES
(111,'Storage Boxes',179.99),
(112,'Moisturizer',338.98),
(113,'SAREE',949.99),
(114,'Three Thousand Stitches',167.00),
(115,'URBAN FOREST WALLET',449.00);
SELECT * FROM PRODUCTS;

CREATE TABLE CATEGORIES (
    CATEGORY_ID VARCHAR(5) PRIMARY KEY,
    CATEGORY_NAME VARCHAR(50)
);

INSERT INTO CATEGORIES (CATEGORY_ID, CATEGORY_NAME) VALUES 
("CAT01", 'HOME & KITCHEN'),
("CAT02", 'BEAUTY'),
("CAT03", 'FASHION'),
("CAT04", 'BOOKS'),
("CAT05", 'GIFTS');
SELECT * FROM CATEGORIES;
-- -------------------------------------------------------------------------------------------------------------------------------------------------------
-- Question 1: Total Revenue per Product
SELECT PRODUCT_ID,SUM(PRICE*QUANTITY) AS TOTAL_REVENUE FROM ORDERS GROUP BY PRODUCT_ID;
SELECT PRODUCT_ID,AVG(PRICE*QUANTITY) AS AVG_TOTAL_REVENUE FROM ORDERS GROUP BY PRODUCT_ID;
SELECT COUNT(*) FROM ORDERS;

-- Question 2: Minimum and Maximum Order Amount
SELECT MIN(PRICE), MAX(PRICE) FROM ORDERS;

-- Question 3: Average Price of Products
SELECT AVG(PRICE) AS PRODUCT_AVG_PRICE FROM PRODUCTS;

-- Question 4: Count Unique Customers
SELECT COUNT(DISTINCT CUSTOMER_ID) FROM ORDERS;

-- Question 5: Total Number of Orders Per Day
ALTER TABLE ORDERS 
ADD COLUMN ORDER_DATE DATE NOT NULL DEFAULT '2024-10-01', 
ADD COLUMN TOTAL_PRICE DECIMAL(20,4) AS (PRICE * QUANTITY);
	-- UPDATE ORDERS SET TOTAL_PRICE = PRICE * QUANTITY;
UPDATE ORDERS SET ORDER_DATE = '2024-10-11' WHERE ORDER_ID = 1;
UPDATE ORDERS SET ORDER_DATE = '2024-10-11' WHERE ORDER_ID = 2;
UPDATE ORDERS SET ORDER_DATE = '2024-10-03' WHERE ORDER_ID = 3;
UPDATE ORDERS SET ORDER_DATE = '2024-10-05' WHERE ORDER_ID = 4;
SELECT * FROM ORDERS;
-- Sol Q5:
SELECT ORDER_DATE, COUNT(*) AS TOTAL_ORDERS 
FROM ORDERS GROUP BY ORDER_DATE;

-- 2. Constraints
-- Question 6: Create a Table with Constraints
-- Create a customers table with columns customer_id, first_name, last_name, email, phone, and age. Ensure that:
-- customer_id is the primary key.
-- email is unique.
-- age cannot be less than 18.
CREATE TABLE CUSTOMERS( 
CUSTOMERS_ID INT AUTO_INCREMENT PRIMARY KEY,
FIRST_NAME VARCHAR(50) NOT NULL, 
LAST_NAME VARCHAR(50) NOT NULL, 
EMAIL VARCHAR(50) UNIQUE , 
PHONE VARCHAR(50) UNIQUE NOT NULL,
AGE INT NOT NULL CHECK(AGE >= 18)
);

INSERT INTO CUSTOMERS (FIRST_NAME, LAST_NAME, EMAIL, PHONE, AGE) VALUES 
( 'RAMESH', 'SHARMA', 'ramesh.sharma@gmail.com', '1234567890', 30),
( 'PRIYA', 'GUPTHA', 'priya.guptha@gmail.com', '2345678901', 25),
( 'ARJUN', 'ROA', 'arjun.roa@gmail.com', '3456789012', 28),
( 'NARAYAN', 'SWAMY', 'narayan.swamy@gmail.com', '4567890123', 40),
( 'AKHILA', 'URS', 'akhila.urs@gmail.com', '5678901234', 22);
SELECT * FROM CUSTOMERS;

-- Question 7: Add a Foreign Key
-- You have a products table and a categories table. 
-- Write a query to add a foreign key in the products table linking it to the categories table on category_id.

CREATE TABLE CAT_PRODUCT (
    CAT_PRODUCT_ID INT PRIMARY KEY,
    CAT_PRODUCT_NAME VARCHAR(100) NOT NULL,
    PRICE DECIMAL(10, 2) NOT NULL,
    STOCK INT NOT NULL CHECK (STOCK >= 0),
    CATEGORY_ID VARCHAR(5) NOT NULL,
    FOREIGN KEY (CATEGORY_ID) REFERENCES CATEGORIES(CATEGORY_ID)
);

INSERT INTO CAT_PRODUCT (CAT_PRODUCT_ID, CAT_PRODUCT_NAME, PRICE, STOCK, CATEGORY_ID) VALUES 
(101, 'LAPTOP', 1200.00, 10, "CAT01"), 
(102, 'SOFA', 800.00, 5, "CAT02"),     
(103, 'T-SHIRT', 20.00, 50, "CAT03"),   
(104, 'BOOK', 15.00, 100, "CAT04"),   
(105, 'ACTION FIGURE', 25.00, 30, "CAT05");
	-- TRUNCATE TABLE CAT_PRODUCT;
SELECT * FROM CAT_PRODUCT;

-- Question 8: Add a Check Constraint on Stock
-- You have a products table with columns product_id, name, price, and stock. 
-- Write a query to add a check constraint that ensures the stock value cannot be negative.
UPDATE CAT_PRODUCT SET STOCK = 20 WHERE CAT_PRODUCT_NAME= "LAPTOP";
UPDATE CAT_PRODUCT SET STOCK = -5 WHERE CAT_PRODUCT_NAME= "LAPTOP";
SET SQL_SAFE_UPDATES = 0;  -- TURN OFF SAFE MODE TO UPDATE TABLE USING WHERE WITH KEY VAL

-- 3. Operators
-- Question 9: Filter Orders by Amount
-- You have an orders table with columns order_id, customer_id, quantity, and total_price. 
-- Write a query to retrieve all orders where the total price is greater than $500.
SELECT * FROM ORDERS WHERE TOTAL_PRICE > 500;

-- Question 10: Find Products in a Specific Price Range
-- You have a products table with columns product_id, product_name, and price. 
-- Write a query to find all products where the price is between $100 and $500.
SELECT * FROM PRODUCTS WHERE  PRICE BETWEEN 100 AND 500;

-- Question 11: Find Orders Placed by Multiple Customers
-- You have an orders table with columns order_id, customer_id, product_id, and total_price.
-- Write a query to retrieve orders placed by customers whose customer_id is either 1, 2, or 3.
SELECT * FROM ORDERS WHERE CUSTOMER_ID IN ("C01","C02","C03");


-- 4. DML (INSERT, UPDATE, DELETE)
-- Question 12: Insert a New Product
-- You need to add a new product to the products table. 
-- The product has product_id, name, price, and stock columns. 
-- Write a query to insert the product with ID 106, name Smartwatch, price $299.99, and stock 50.
ALTER TABLE CAT_PRODUCT
MODIFY COLUMN PRICE FLOAT;
SELECT * FROM CAT_PRODUCT;

INSERT INTO CATEGORIES (CATEGORY_ID,CATEGORY_NAME) 
VALUES ("CAT06","ELECTROINICS");
SELECT * FROM CATEGORIES;

INSERT INTO CAT_PRODUCT (CAT_PRODUCT_ID, CAT_PRODUCT_NAME, PRICE, STOCK, CATEGORY_ID) 
VALUES (106, 'Smartwatch', 299.99, 50,"CAT06");
SELECT * FROM CAT_PRODUCT;

-- Question 13: Update Product Stock
-- You have a products table with columns product_id, name, and stock. 
-- Write a query to update the stock of the product with product_id = 102 to 75.
UPDATE CAT_PRODUCT SET STOCK = 75
WHERE CAT_PRODUCT_ID = 102;
SELECT * FROM CAT_PRODUCT WHERE CAT_PRODUCT_ID = 102;

-- Question 14: Delete Low-Stock Products
-- You have a products table with columns product_id, name, and stock. 
-- Write a query to delete all products where the stock is less than 10.
UPDATE CAT_PRODUCT SET STOCK = 5
WHERE CAT_PRODUCT_ID = 104;
SELECT * FROM CAT_PRODUCT;

DELETE FROM CAT_PRODUCT WHERE STOCK < 10;

-- 5. DDL (CREATE, ALTER, DROP)
-- Question 15: Create a Products Table
-- Write a query to create a products table with the following columns:
-- product_id (INT, primary key)
-- name (VARCHAR(100), not null)
-- price (DECIMAL(10,2))
-- stock (INT, with a check constraint ensuring stock is greater than or equal to 0)

CREATE TABLE PRODUCT_DDL(
DDLP_id INT primary key,
DDLP_name VARCHAR(100) not null,
DDLP_price DECIMAL(10,2),
DDLP_stock INT CHECK (DDLP_stock >= 0)
);
INSERT INTO PRODUCT_DDL(DDLP_ID,DDLP_name,DDLP_price,DDLP_stock) VALUES
(171701,"DORE MAT",228.76,140),
(171702,"SMALL STORAGE BOX",36.60,140),
(171703,"LUNCH BOX",349.36,40);
SELECT * FROM PRODUCT_DDL;

-- Question 16: Alter a Table to Add a Column
-- You have an orders table. 
-- Write a query to add a new column delivery_date of type DATE to the orders table.
ALTER TABLE ORDERS ADD COLUMN delivery_date DATE;
SELECT * FROM ORDERS;

-- Question 17: Drop a Table
-- You have a reviews table. 
-- Write a query to drop the reviews table from the database
CREATE TABLE REVIEWS (
REVIEWS_ID INT UNIQUE NOT NULL,
REVIEWING_PRODUCT VARCHAR(50) NOT NULL,
REVIEWS_MSG VARCHAR(300));

INSERT INTO REVIEWS(REVIEWS_ID,REVIEWING_PRODUCT,REVIEWS_MSG) VALUES
(401,"Artificial Leaf Curtain LED String Light","Quality of brightness is little low. But overall it's a good product. One can use for diwali or pooja Mandir lighting purpose. But length of the wire is not so long it's just may be 1meter from the main wire."),
(402,"Fairy Snow Flake String Lights"," Wire quality is very poor and 3-4 bulb not in working condition.");
SELECT * FROM REVIEWS;

DROP TABLE REVIEWS;
