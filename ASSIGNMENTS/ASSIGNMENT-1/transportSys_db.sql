create schema transportSys_db;
use transportSys_db;

CREATE TABLE Flights (
    FlightID INT NOT NULL UNIQUE,
    FlightNumber VARCHAR(10) NOT NULL UNIQUE,
    Airline VARCHAR(50) NOT NULL,
    DepartureCity VARCHAR(50) NOT NULL,
    ArrivalCity VARCHAR(50) NOT NULL,
    DepartureDate DATE NOT NULL,
    ArrivalDate DATE NOT NULL
);

INSERT INTO Flights VALUES 
(1, 'AI202', 'Air India', 'Mumbai', 'Delhi', '2024-10-25', '2024-10-25'),
(2, 'IT405', 'IndiGo', 'Bangalore', 'Chennai', '2024-10-26', '2024-10-26'),
(3, 'SG903', 'SpiceJet', 'Delhi', 'Goa', '2024-10-27', '2024-10-27'),
(4, 'AI303', 'Air India', 'Kolkata', 'Mumbai', '2024-10-28', '2024-10-28'),
(5, '6E404', 'IndiGo', 'Chennai', 'Hyderabad', '2024-10-29', '2024-10-29'),
(6, 'SG678', 'SpiceJet', 'Delhi', 'Kolkata', '2024-10-30', '2024-10-30'),
(7, 'AI123', 'Air India', 'Mumbai', 'Bangalore', '2024-10-31', '2024-10-31');

select * from Flights;

CREATE TABLE Passengers (
    PassengerID INT NOT NULL UNIQUE,
    PassengerName VARCHAR(100) NOT NULL,
    Age INT NOT NULL,
    Gender VARCHAR(10) NOT NULL,
    PhoneNumber VARCHAR(15) NOT NULL UNIQUE,
    Email VARCHAR(100) NOT NULL UNIQUE,
    Address VARCHAR(255) NOT NULL
);
INSERT INTO Passengers VALUES 
(201, 'Rahul', 29, 'Male', '+91-9876543210', 'rahul@gmail.com', '123, MG Road, Mumbai'),
(202, 'Priya', 26, 'Female', '+91-9988776655', 'priya@gmail.com', '456, 5th Main, Bangalore'),
(203, 'Amit', 34, 'Male', '+91-9876541230', 'amit@gmail.com', '789, Green Park, Delhi'),
(204, 'Sita', 22, 'Female', '+91-9595959595', 'sita@gmail.com', '159, Sea View, Goa'),
(205, 'Vikram', 31, 'Male', '+91-9191919191', 'vikram@gmail.com', '258, IT Park, Chennai'),
(206, 'Anjali', 28, 'Female', '+91-8765432109', 'anjali@gmail.com', '357, Old Town, Kolkata'),
(207, 'bhoomika', 22, 'Female', '+91-9876541568', 'bhoomik@example.com', '123, JP nagar, Mysore');

select * from Passengers;
rename table Passengers to Passengers_details;
select * from Passengers_details;
SELECT COUNT(*) FROM Passengers_details;
select * from Passengers_details;

select * from Passengers_details where Age < 25;
select * from Passengers_details where Age > 25;
select * from Passengers_details where Age <= 24;
select * from Passengers_details where Age >= 28;
select * from Passengers_details where PassengerID = 201;
select * from Passengers_details where gender != 'Male';
select * from Passengers_details where  not gender = 'Female';
select * from Passengers_details where PhoneNumber in ('+91-9595959595','+91-9876541568');
select * from Passengers_details where Age between 25 and 30;

CREATE TABLE FlightSchedules (
    ScheduleID INT NOT NULL UNIQUE,
    FlightID INT NOT NULL UNIQUE,
    ScheduledDeparture DATE NOT NULL,
    ScheduledArrival DATE NOT NULL,
    Duration VARCHAR(10) NOT NULL,
    flightStatus VARCHAR(20) NOT NULL,
    Gate VARCHAR(10) NOT NULL
);

INSERT INTO FlightSchedules VALUES 
(1, 101, '2024-10-25', '2024-10-25', '02:00', 'On Time', 'A1'),
(2, 102, '2024-10-26', '2024-10-26', '01:30', 'On Time', 'B2'),
(3, 103, '2024-10-27', '2024-10-27', '01:45', 'Delayed', 'C3'),
(4, 104, '2024-10-28', '2024-10-28', '02:15', 'On Time', 'D4'),
(5, 105, '2024-10-29', '2024-10-29', '01:55', 'Cancelled', 'E5'),
(6, 106, '2024-10-30', '2024-10-30', '02:10', 'On Time', 'F6'),
(7, 107, '2024-10-31', '2024-10-31', '01:40', 'On Time', 'G7');

SELECT COUNT(*) FROM FlightSchedules;
select * from FlightSchedules;
select * from FlightSchedules where ScheduleID < 5;
select * from FlightSchedules where FlightID > 105;
select * from FlightSchedules where ScheduledDeparture <= '2024-10-27';
select * from FlightSchedules where ScheduledDeparture >= '2024-10-28';
select * from FlightSchedules where Gate = 'F6';
select * from FlightSchedules where flightStatus != 'On Time';
select * from FlightSchedules where  not flightStatus = 'On Time';
select * from FlightSchedules where flightStatus in ('Delayed','Cancelled');
select * from FlightSchedules where Duration between '01:55' and '02:15';