create database Food_Delivery_DB;
use Food_Delivery_DB;

create table Restaurants(
RestaurantID int not null unique,
RestaurantName varchar(20) not null ,
CuisineType varchar(20) not null ,
ContactNumber varchar(20) not null ,
Email varchar(30) not null ,
Rating int not null,
Address varchar(50) not null
);

INSERT INTO Restaurants (RestaurantID, RestaurantName, CuisineType, ContactNumber, Email, Rating, Address) VALUES
(1, 'Spice Route', 'Indian', '9123456789', 'spiceroute@gmail.com', 4.5, 'Sector 1, Noida'),
(2, 'Dragon Wok', 'Chinese', '9212345678', 'dragonwok@gmail.com', 4.0, 'Sector 3, Gurugram'),
(3, 'Pizza Planet', 'Italian', '9345678912', 'pizzaplanet@gmail.com', 3.5, 'Sector 4, Faridabad'),
(4, 'Taco Bell', 'Mexican', '9478561230', 'tacobell@gmail.com', 4.2, 'Sector 5, Ghaziabad'),
(5, 'Cafe Gourmet', 'Continental', '9587961234', 'cafegourmet@gmail.com', 4.8, 'Sector 6, Delhi'),
(6, 'Biryani Bliss', 'Indian', '9678392212', 'biryanibliss@gmail.com', 4.6, 'Sector 7, Bengaluru'),
(7, 'Burger King', 'Fast Food', '9898989898', 'burgerking@gmail.com', 4.0, 'Sector 8, Mumbai');

create table Customers(
CustomerID int not null unique,
CustomerName varchar(20) not null ,
ContactNumber varchar(20) not null ,
Email varchar(30) not null ,
Location varchar(30) not null,
MembershipType varchar(10) not null,
PreferredCuisine varchar(20)
);

INSERT INTO Customers (CustomerID, CustomerName, ContactNumber, Email, Location, MembershipType, PreferredCuisine) VALUES
(1201, 'Ajay Sharma', '9876543210', 'ajay@gmail.com', 'Noida', 'Gold', 'Indian'),
(1202, 'Pooja Verma', '8765432109', 'pooja@gmail.com', 'Gurugram', 'Silver', 'Chinese'),
(1203, 'Rohit Kumar', '9988776655', 'rohit@gmail.com', 'Faridabad', 'Bronze', 'Italian'),
(1204, 'Sonia Gupta', '9666332244', 'sonia@gmail.com', 'Ghaziabad', 'Gold', 'Mexican'),
(1205, 'Vikram Mehta', '9556677889', 'vikram@gmail.com', 'Delhi', 'Silver', 'Continental'),
(1206, 'Nisha Patel', '9445566778', 'nisha@gmail.com', 'Bengaluru', 'Gold', 'Indian'),
(1207, 'Rahul Singh', '9334455667', 'rahul@gmail.com', 'Mumbai', 'Bronze', 'Fast Food');

create table Orders(
OrderID int not null unique,
CustomerID int not null unique,
RestaurantID int not null unique,
OrderDate datetime not null,
TotalAmount int not null,
OrderStatus varchar(10) not null,
DeliveryAddress varchar(50) not null
);
INSERT INTO Orders (OrderID, CustomerID, RestaurantID, OrderDate, TotalAmount, OrderStatus, DeliveryAddress) VALUES
(701, 1201, 1, '2024-10-15 18:30:00', 1200.50, 'Delivered', '#109, 43 Main , Noida'),
(702, 1202, 2, '2024-10-16 19:00:00', 850.75, 'Pending', '500, 11th a cross, 4th main, Gurugram'),
(703, 1203, 3, '2024-10-17 20:15:00', 1500.00, 'Canceled', '1221 13th Main, Sector 4, Faridabad'),
(704, 1204, 4, '2024-10-18 21:00:00', 900.25, 'Delivered', 'D-40,35th cross 2nd block, Sector 5, Ghaziabad'),
(705, 1205, 5, '2024-10-19 12:30:00', 450.00, 'Pending', ' 123, 11th a cross,  2nd block,Sector 6, Delhi'),
(706, 1206, 6, '2024-10-20 13:45:00', 1250.80, 'Delivered', '500, 11th a cross, 4th main, Mahalakshmipuram, Rajajinagar, Rajajinagar Stage 2, Bengaluru'),
(707, 1207, 7, '2024-10-21 14:15:00', 300.00, 'Delivered', 'G170 near ambabavani temple, Sector 8, Mumbai');

truncate table Orders;
-- ALTER TABLE Orders ADD COLUMN `PaymentStatus` VARCHAR(20) NOT NULL;
-- ALTER TABLE Customers ADD COLUMN `LoyaltyPoints` INT NOT NULL;
-- ALTER TABLE Restaurants ADD COLUMN `DeliveryOptions` VARCHAR(50) NOT NULL;

SELECT COUNT(*) FROM Orders;
select * from Orders;
select * from Orders where TotalAmount < 1000;
select * from Orders where TotalAmount > 1500;
select * from Orders where OrderDate <= '2024-10-18 14:15:00';
select * from Orders where OrderDate >= '2024-10-19 14::30:0';
select * from Orders where OrderStatus = 'Pending';
select * from Orders where OrderStatus != 'Delivered';
select * from Orders where  not OrderStatus = 'Delivered';
select * from Orders where DeliveryAddress in ('500, 11th a cross, 4th main, Mahalakshmipuram, Rajajinagar, Rajajinagar Stage 2, Bengaluru','1221 13th Main, Sector 4, Faridabad');
select * from Orders where RestaurantID between 1 and 3;
