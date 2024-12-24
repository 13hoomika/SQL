CREATE DATABASE Hospital_DB;
USE Hospital_DB;

CREATE TABLE Doctors (
    DoctorID varchar(10) not null unique,
    DoctorName varchar(100) not null,
    Specialization varchar(50) not null,
    ContactNumber varchar(15) not null unique,
    Email varchar(100) not null unique,
    ExperienceYears int not null,
    HospitalAffiliation varchar(100) not null,
    ConsultationFee decimal(10, 2) not null
);

INSERT INTO Doctors VALUES ('D001', 'Dr. Rajesh Kumar', 'Cardiology', '+91-9876543210', 'rajesh.kumar@hospital.com', 10, 'Apollo Hospital', 500.00);
INSERT INTO Doctors VALUES ('D002', 'Dr. Sneha Sharma', 'Orthopedics', '+91-9988776655', 'sneha.sharma@hospital.com', 8, 'Fortis Hospital', 800.00);
INSERT INTO Doctors VALUES ('D003', 'Dr. Amit Verma', 'Pediatrics', '+91-9123456789', 'amit.verma@hospital.com', 5, 'Max Healthcare', 400.00);
INSERT INTO Doctors VALUES ('D004', 'Dr. Priya Iyer', 'Dermatology', '+91-9654321098', 'priya.iyer@hospital.com', 12, 'Manipal Hospital', 600.00);
INSERT INTO Doctors VALUES ('D005', 'Dr. Ravi Mehta', 'General Medicine', '+91-8765432109', 'ravi.mehta@hospital.com', 15, 'Narayana Health', 700.00);
INSERT INTO Doctors VALUES ('D006', 'Dr. Neha Singh', 'Gynecology', '+91-9445566778', 'neha.singh@hospital.com', 7, 'BLK Super Speciality', 900.00);
INSERT INTO Doctors VALUES ('D007', 'Dr. Vikram Joshi', 'Neurology', '+91-8888776655', 'vikram.joshi@hospital.com', 20, 'Apollo Hospital', 1000.00);

rename table Doctors to Doctors_details;
-- ALTER TABLE Doctors_details ADD COLUMN `Availability` VARCHAR(50) NOT NULL;
select * from Doctors_details;

select * from Doctors_details where ExperienceYears < 15;
select * from Doctors_details where ExperienceYears > 10;
select * from Doctors_details where ExperienceYears <= 10;
select * from Doctors_details where ExperienceYears >= 5;
select * from Doctors_details where ConsultationFee = 600;
select * from Doctors_details where HospitalAffiliation != "Apollo Hospital";
select * from Doctors_details where  not Specialization= 'Gynecology';
select * from Doctors_details where Specialization in ('Dermatology','Neurology','General Medicine');
select * from Doctors_details where ExperienceYears between 10 and 20;

CREATE TABLE Appointments (
    AppointmentID int not null unique,
    DoctorID varchar(10) not null,
    PatientName varchar(100) not null,
    AppointmentDate date not null,
    AppointmentTime time not null,
    ContactNumber varchar(15) not null,
    Email varchar(100) not null unique,
    AppointmentStatus varchar(20) not null
);
INSERT INTO Appointments VALUES (0101, 'D001', 'Aarav Singh', '2024-10-27', '09:30:00', '+91-9876543211', 'aarav.singh@example.com', 'Confirmed');
INSERT INTO Appointments VALUES (0102, 'D002', 'Meera Nair', '2024-10-28', '11:00:00', '+91-9888776655', 'meera.nair@example.com', 'Pending');
INSERT INTO Appointments VALUES (0103, 'D003', 'Rohan Verma', '2024-10-29', '10:00:00', '+91-9999887766', 'rohan.verma@example.com', 'Confirmed');
INSERT INTO Appointments VALUES (0104, 'D004', 'Sita Patel', '2024-10-30', '14:00:00', '+91-9012345678', 'sita.patel@example.com', 'Cancelled');
INSERT INTO Appointments VALUES (0105, 'D005', 'Vikrant Joshi', '2024-10-31', '15:30:00', '+91-9321456789', 'vikrant.joshi@example.com', 'Confirmed');
INSERT INTO Appointments VALUES (0106, 'D006', 'Nisha Reddy', '2024-11-01', '09:00:00', '+91-8765432198', 'nisha.reddy@example.com', 'Rescheduled');
INSERT INTO Appointments VALUES (0107, 'D007', 'Priya Joshi', '2024-11-02', '13:00:00', '+91-8333445567', 'priya.joshi@example.com', 'Cancelled');

select * from Appointments;
truncate Appointments;
-- alter table Appointments add column `Prescription` varchar(255);

rename table Appointments to Appointments_details;
select * from Appointments_details;

select * from Appointments_details where DoctorID < 'D007';
select * from Appointments_details where AppointmentID > 0105;
select * from Appointments_details where AppointmentTime <= '09:00:00';
select * from Appointments_details where AppointmentTime >= '14:00:00';
select * from Appointments_details where AppointmentStatus = 'Confirmed';
select * from Appointments_details where AppointmentStatus != 'Confirmed';
select * from Appointments_details where  not PatientName= 'Priya Joshi';
select * from Appointments_details where AppointmentID in (0107,0105,0103);
select * from Appointments_details where AppointmentDate between '2024-10-30' and '2024-11-02';

CREATE TABLE Patients(
Patient_ID int not null unique,
Patient_Name varchar(50) not null,
Age int not null,
Gender varchar(10) not null,
ContactNumber varchar(10) not null unique,
Email varchar(25) not null unique,
Address varchar(100) not null
);
-- drop table Patients; 

INSERT INTO Patients VALUES(101, 'Rahul Sharma', 30, 'Male', '9876543210', 'rahul@gmail.com', 'Delhi');
INSERT INTO Patients VALUES(102, 'Anjali Verma', 28, 'Female', '8765432109', 'anjali@gmail.com', 'Mumbai');
INSERT INTO Patients VALUES(103, 'Amit Kumar', 45, 'Male', '9988776655', 'amit@gmail.com', 'Bengaluru');
INSERT INTO Patients VALUES(104, 'Priya Singh', 35, 'Female', '9666332244', 'priya@gmail.com', 'Chennai');
INSERT INTO Patients VALUES(105, 'Rahul Sharma', 50, 'Male', '9556677889', 'rahul.s@gmail.com', 'Hyderabad'); 
INSERT INTO Patients VALUES(106, 'Neha Gupta', 40, 'Female', '9445566778', 'neha@gmail.com', 'Kolkata');
INSERT INTO Patients VALUES(107, 'Suresh Yadav', 60, 'Male', '9334455667', 'suresh@gmail.com', 'Pune');

ALTER TABLE Patients ADD COLUMN `EmergencyContactNumber` VARCHAR(15) NOT NULL;
ALTER TABLE Patients DROP COLUMN `EmergencyContactNumber`;
select * from Patients;

RENAME TABLE Patients TO Patients_details;
select * from Patients_details;

select * from Patients_details where Age < 30;
select * from Patients_details where Age > 40;
select * from Patients_details where Age <= 40;
select * from Patients_details where Age >= 40;
select * from Patients_details where Age = 60;
select * from Patients_details where Age != 50;
select * from Patients_details where  not Email= 'rahul@gmail.com';
select * from Patients_details where Patient_Name in ('Amit Kumar','Suresh Yadav','Neha Gupta');
select * from Patients_details where Patient_ID between 103 and 106;



