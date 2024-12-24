CREATE DATABASE DAY3;
USE DAY3;

CREATE TABLE PRODUCTS(
	P_ID INT PRIMARY KEY auto_increment,
    P_NAME VARCHAR(100) NOT NULL,
    P_PRICE DOUBLE NOT NULL,
    P_RATING INT CHECK (P_RATING <= 5),
    P_DESCRIPTION VARCHAR(500) NOT NULL
);
-- DROP TABLE PRODUCTS;
SELECT * FROM PRODUCTS;

CREATE TABLE CUSTOMERS(
	C_ID INT PRIMARY KEY auto_increment,
    C_NAME VARCHAR(50) NOT NULL,
    C_PHNO VARCHAR(12) NOT NULL UNIQUE,
    C_EMAIL VARCHAR(50) NOT NULL UNIQUE,
    C_ADD VARCHAR(50) NOT NULL
);
SELECT * FROM CUSTOMERS;
-- DROP TABLE CUSTOMERS;

CREATE TABLE ORDERS(
	O_ID INT NOT NULL UNIQUE auto_increment,
    P_ID INT(20) NOT NULL,
    FOREIGN KEY (P_ID) REFERENCES PRODUCTS(P_ID),
    C_ID INT NOT NULL,
    FOREIGN KEY (C_ID) REFERENCES CUSTOMERS(C_ID)
);
SELECT * FROM ORDERS;
DROP TABLE ORDERS;

-- -------- INSERT TABLE------------
INSERT INTO PRODUCTS (P_NAME, P_PRICE, P_RATING, P_DESCRIPTION) VALUES 
('Bluetooth Speaker', 750.50, 4, 'Portable wireless speaker with rich bass'),
('Smart Watch', 999.99, 5, 'Fitness tracking and notifications'),
('Headphones', 499.00, 3, 'Noise-canceling over-ear headphones'),
('USB-C Cable', 150.00, 4, 'Fast charging and data transfer cable'),
('Laptop Stand', 899.99, 5, 'Ergonomic aluminum laptop stand'),
('Wireless Mouse', 350.00, 4, 'Ergonomic wireless mouse with precision control'),
('Power Bank', 799.00, 4, 'Fast-charging 10,000mAh power bank'),
('Gaming Keyboard', 950.00, 5, 'Mechanical gaming keyboard with RGB lighting'),
('Phone Holder', 250.00, 4, 'Adjustable phone holder for desks and tables'),
('Portable Fan', 499.99, 3, 'Compact and rechargeable portable fan');

INSERT INTO CUSTOMERS (C_NAME, C_PHNO, C_EMAIL, C_ADD) VALUES
('Ravi Kumar', '9876543210', 'ravi.kumar@example.com', 'Rajajinagar'),
('ANU', '8765432109', 'anjali.sharma@example.com', 'Vijaya Nagar'),
('Karthik Rao', '7654321098', 'karthik.rao@example.com', 'Rajajinagar'),
('Priya Mehta', '6543210987', 'priya.mehta@example.com', 'Vijaya Nagar'),
('Rahul Singh', '5432109876', 'rahul.singh@example.com', 'Rajajinagar'),
('Nisha Patel', '4321098765', 'nisha.patel@example.com', 'Vijaya Nagar'),
('Amit Verma', '3210987654', 'amit.verma@example.com', 'Rajajinagar'),
('Megha Nair', '2109876543', 'megha.nair@example.com', 'Vijaya Nagar'),
('Vikram Gupta', '1098765432', 'vikram.gupta@example.com', 'Rajajinagar'),
('Shreya Roy', '9087654321', 'shreya.roy@example.com', 'Vijaya Nagar');

INSERT INTO CUSTOMERS (C_NAME, C_PHNO, C_EMAIL, C_ADD) VALUES
('Poojitha', '1234567890', 'poojithagowda@example.com', 'Bangaore'),
('keerthi', '98765432345', 'keerthi@example.com', 'sagara'),
('chaitra', '0987545676', 'chaitra@example.com', 'sagara');

truncate TABLE CUSTOMERS;

INSERT INTO ORDERS (P_ID, C_ID) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 9),
(10, 10);

-- -------- LIKE OP------------
SELECT *
FROM ORDERS AS O, CUSTOMERS AS C , PRODUCTS AS P; -- Cross join this creaye duplicates 
-- NOT GOOD PRACTICE we need to give condition WHERE

SELECT *
FROM ORDERS AS O, CUSTOMERS AS C , PRODUCTS AS P   
WHERE O.O_ID = 3 AND O.C_ID = C.C_ID AND O.P_ID = P.P_ID
AND C.C_NAME LIKE "K%";

SELECT * FROM CUSTOMERS WHERE C_NAME LIKE "R%"; -- BEGIN WITH S

SELECT * FROM CUSTOMERS WHERE C_NAME LIKE "%R"; -- END WITH S

SELECT * FROM CUSTOMERS WHERE C_NAME LIKE "%R%"; -- MIDDLE

SELECT * FROM CUSTOMERS; 
SELECT * FROM CUSTOMERS WHERE C_NAME LIKE "_A%"; -- 2ND LETTER IS 'A'
SELECT * FROM CUSTOMERS WHERE C_NAME LIKE "_N_"; -- MIDDLE LETTER IS 'A' POSSIBLE ONLY WHEN THERE ARE 3 LETTER NAME EX: ANU _N_

-- ----- JOIN -------------------------------------

SELECT *
FROM PRODUCTS AS P
JOIN CUSTOMERS AS C
ON P.P_ID = C.C_ID;

-- INNER JOIN ----------
SELECT *
FROM PRODUCTS AS P
INNER JOIN CUSTOMERS AS C
ON P.P_ID = C.C_ID;

SELECT *
FROM PRODUCTS AS P
INNER JOIN CUSTOMERS AS C
ON P.P_ID = C.C_ID
WHERE C.C_NAME LIKE 'R%'; -- WE CAN USE WHERE CLAUSE IN JOIN

SELECT *
FROM PRODUCTS AS P
INNER JOIN CUSTOMERS AS C
ON P.P_NAME = C.C_NAME -- THIS WILL NOT GIVE ANY DATA *NO MATCHING COL -> P_NAME AND C_NAME WONT MATCH 
WHERE C.C_NAME LIKE '%R%'; 

-- OUTER JOIN ----------
SELECT *
FROM PRODUCTS AS P
LEFT JOIN CUSTOMERS AS C
ON P.P_ID = C.C_ID;

SELECT *
FROM PRODUCTS AS P
RIGHT JOIN CUSTOMERS AS C
ON P.P_ID = C.C_ID;

-- FULL OUTER JOIN  *WILL NOT WORK IN MYSQL ----------
SELECT *
FROM PRODUCTS AS P
FULL OUTER JOIN CUSTOMERS AS C 
ON P.P_ID = C.C_ID;  

-- WE ACHIVE FULL OIUTER JOIN BY PERFORMING LEFT-RIGHT-UNION
SELECT *
FROM PRODUCTS AS P
LEFT JOIN CUSTOMERS AS C
ON P.P_ID = C.C_ID
UNION
SELECT *
FROM PRODUCTS AS P
RIGHT JOIN CUSTOMERS AS C
ON P.P_ID = C.C_ID; 

-- INSERT INTO PRODUCTS (P_NAME,P_PRICE,P_ADD,P_RATING,P_DESCRIPTION) VALUES
-- ("KEYBORD",4556,"MYSORE",5,"");

-- UNION ----
SELECT * FROM PRODUCTS UNION SELECT * FROM CUSTOMERS;
SELECT * FROM PRODUCTS UNION ALL SELECT * FROM CUSTOMERS;
-- SELECT * FROM PRODUCTS INTERSECT TABLE CUSTOMERS;

-- PAGINATION: LIMIT & OFFSET ------
SELECT * FROM PRODUCTS LIMIT 3;
SELECT * FROM PRODUCTS LIMIT 2 OFFSET 4;