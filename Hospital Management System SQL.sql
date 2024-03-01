create database HMS;
use HMS;
CREATE TABLE Patients (
    PatientID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    DateOfBirth DATE,
    Gender VARCHAR(10),
    ContactInfo VARCHAR(100),
    InsuranceDetails VARCHAR(100)
);
select * from patients;
CREATE TABLE Doctors (
    DoctorID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Specialization VARCHAR(50),
    ContactInfo VARCHAR(100)
);
show tables;
CREATE TABLE Appointments (
    AppointmentID INT PRIMARY KEY,
    PatientID INT,
    DoctorID INT,
    AppointmentDateTime DATETIME,
    Diagnosis VARCHAR(200),
    Prescriptions TEXT,
    Status VARCHAR(20),
    FOREIGN KEY (PatientID) REFERENCES Patients(PatientID),
    FOREIGN KEY (DoctorID) REFERENCES Doctors(DoctorID)
);
CREATE TABLE Wards (
    WardID INT PRIMARY KEY,
    WardName VARCHAR(50),
    WardType VARCHAR(50),
    MaxCapacity INT
);
CREATE TABLE Admissions (
    AdmissionID INT PRIMARY KEY,
    PatientID INT,
    WardID INT,
    AdmissionDate DATE,
    DischargeDate DATE,
    MedicalNotes TEXT,
    FOREIGN KEY (PatientID) REFERENCES Patients(PatientID),
    FOREIGN KEY (WardID) REFERENCES Wards(WardID)
);
CREATE TABLE Billing (
    BillID INT PRIMARY KEY,
    PatientID INT,
    AdmissionID INT,
    DoctorCharges DECIMAL(10, 2),
    RoomCharges DECIMAL(10, 2),
    MedicationCharges DECIMAL(10, 2),
    TotalAmount DECIMAL(10, 2),
    FOREIGN KEY (PatientID) REFERENCES Patients(PatientID),
    FOREIGN KEY (AdmissionID) REFERENCES Admissions(AdmissionID)
);
use HMS;
INSERT INTO Patients VALUES
(1, 'John', 'Doe', '1990-01-15', 'Male', '123-456-7890', 'ABC Insurance'),
(2, 'Jane', 'Smith', '1985-07-22', 'Female', '987-654-3210', 'XYZ Insurance'),
(3, 'Alex', 'Johnson', '1988-03-10', 'Male', '555-123-4567', 'DEF Insurance'),
(4, 'Emily', 'Davis', '1995-12-05', 'Female', '444-789-0123', 'GHI Insurance'),
(5, 'Michael', 'Brown', '1980-09-18', 'Male', '222-333-4444', 'JKL Insurance'),
(6, 'Sophia', 'Miller', '1992-06-30', 'Female', '999-888-7777', 'MNO Insurance'),
(7, 'David', 'Taylor', '1982-11-25', 'Male', '111-222-3333', 'PQR Insurance'),
(8, 'Olivia', 'Anderson', '1998-04-14', 'Female', '777-666-5555', 'STU Insurance'),
(9, 'William', 'Clark', '1987-08-08', 'Male', '333-444-5555', 'VWX Insurance'),
(10, 'Ava', 'Martin', '1993-02-28', 'Female', '888-999-0000', 'YZA Insurance');
select * from  Patients;
INSERT INTO Doctors VALUES
(1, 'Dr. Robert', 'Johnson', 'Cardiologist', '456-789-0123'),
(2, 'Dr. Emily', 'Williams', 'Pediatrician', '789-012-3456'),
(3, 'Dr. Michael', 'Smith', 'Dermatologist', '123-456-7890'),
(4, 'Dr. Olivia', 'Jones', 'Orthopedic Surgeon', '234-567-8901'),
(5, 'Dr. William', 'Taylor', 'Neurologist', '345-678-9012'),
(6, 'Dr. Sophia', 'Brown', 'Ophthalmologist', '456-789-0123'),
(7, 'Dr. David', 'Miller', 'Gastroenterologist', '567-890-1234'),
(8, 'Dr. Ava', 'Davis', 'Obstetrician', '678-901-2345'),
(9, 'Dr. Ethan', 'Anderson', 'ENT Specialist', '789-012-3456'),
(10, 'Dr. Emma', 'Clark', 'Psychiatrist', '890-123-4567');
select * from Doctors;
INSERT INTO Appointments VALUES
(1, 1, 1, '2023-01-20 10:00:00', 'Cardiac checkup', 'Prescription details', 'Confirmed'),
(2, 2, 2, '2023-02-15 14:30:00', 'Pediatric consultation', 'Prescription details', 'Confirmed'),
(3, 3, 3, '2023-03-10 11:45:00', 'Dermatology appointment', 'Prescription details', 'Pending'),
(4, 4, 4, '2023-04-05 09:15:00', 'Orthopedic assessment', 'Prescription details', 'Confirmed'),
(5, 5, 5, '2023-05-20 15:30:00', 'Neurology follow-up', 'Prescription details', 'Pending'),
(6, 6, 6, '2023-06-30 13:00:00', 'Ophthalmology checkup', 'Prescription details', 'Confirmed'),
(7, 7, 7, '2023-07-25 12:30:00', 'Gastroenterology consultation', 'Prescription details', 'Pending'),
(8, 8, 8, '2023-08-14 16:45:00', 'Obstetrics appointment', 'Prescription details', 'Confirmed'),
(9, 9, 9, '2023-09-08 08:00:00', 'ENT assessment', 'Prescription details', 'Confirmed'),
(10, 10, 10, '2023-10-01 17:15:00', 'Psychiatric evaluation', 'Prescription details', 'Pending');
select * from Appointments;
INSERT INTO Wards VALUES
(1, 'Cardiac Ward', 'Specialized', 15),
(2, 'Pediatric Ward', 'General', 20),
(3, 'Orthopedic Ward', 'Specialized', 18),
(4, 'Neurology Ward', 'General', 25),
(5, 'Ophthalmology Ward', 'Specialized', 12),
(6, 'Gastroenterology Ward', 'General', 22),
(7, 'Obstetrics Ward', 'Specialized', 16),
(8, 'ENT Ward', 'General', 20),
(9, 'Psychiatry Ward', 'Specialized', 14),
(10, 'Dermatology Ward', 'General', 18);
select * from Wards;
INSERT INTO Admissions VALUES
(1, 1, 1, '2023-01-20', '2023-01-25', 'Cardiac patient admitted'),
(2, 2, 2, '2023-02-15', '2023-02-20', 'Pediatric case admitted'),
(3, 3, 3, '2023-03-10', '2023-03-15', 'Dermatology admission'),
(4, 4, 4, '2023-04-05', '2023-04-10', 'Orthopedic case admitted'),
(5, 5, 5, '2023-05-20', '2023-05-25', 'Neurology admission'),
(6, 6, 6, '2023-06-30', '2023-07-05', 'Ophthalmology case admitted'),
(7, 7, 7, '2023-07-25', '2023-07-30', 'Gastroenterology admission'),
(8, 8, 8, '2023-08-14', '2023-08-19', 'Obstetrics admission'),
(9, 9, 9, '2023-09-08', '2023-09-13', 'ENT admission'),
(10, 10, 10, '2023-10-01', '2023-10-06', 'Psychiatric admission');
select * from Admissions;
INSERT INTO Billing VALUES
(1, 1, 1, 150.00, 200.00, 50.00, 400.00),
(2, 2, 2, 120.00, 180.00, 30.00, 330.00),
(3, 3, 3, 130.00, 220.00, 40.00, 390.00),
(4, 4, 4, 180.00, 250.00, 60.00, 490.00),
(5, 5, 5, 200.00, 280.00, 70.00, 550.00),
(6, 6, 6, 160.00, 200.00, 50.00, 410.00),
(7, 7, 7, 140.00, 230.00, 45.00, 415.00),
(8, 8, 8, 190.00, 260.00, 65.00, 515.00),
(9, 9, 9, 170.00, 240.00, 55.00, 465.00),
(10, 10, 10, 150.00, 210.00,50.00,410.00);
select * from billing;
use hms;

# Writing Basic Queries: some basic SQL queries for the hospital management system 
#Search for Doctors by Specialization:
SELECT * FROM Doctors WHERE Specialization = 'Cardiologist';

# Discharge a Patient:	

UPDATE Admissions SET DischargeDate = '2023-10-31' WHERE AdmissionID = 1;
select * from admissions;

 # SQL queries for the hospital management system using operators
# Display the details of patients who's name is 'Michael Brown'
SELECT *
FROM Patients
WHERE FirstName = 'Michael' AND LastName = 'Brown';

# Display the details of doctor who's name starts with D
SELECT *
FROM Doctors
WHERE lastname LIKE 'D%'; 

#Diplay the details of patients who has 'D' and 'R' in their name.
SELECT *
FROM Patients
WHERE FirstName LIKE '%D%' AND LastName LIKE '%R%';

# display the DoctorId, firstname, and lastname of doctors who has a Specialization in 'Orthopedic Surgeon' : 

SELECT DoctorID, FirstName, LastName
FROM Doctors
WHERE  Specialization = 'Orthopedic Surgeon';

#Diplay the details of patients whose totalamount is greater than 350
select * from billing where totalamount >=350;

#Diplay the details of patients whose totalamount is less than 350
select * from billing where totalamount <=350;


 # SQL queries for the hospital management system using (Aggregate functions) 
 
 select count(doctorid) from doctors;
select max(totalamount) from billing;
select min(totalamount) from billing;
select sum(DoctorCharges) from billing;
select count(PatientID) as 'totalcount', sum(totalamount) as 'totalsum' from billing;

  # SQL queries for the hospital management system using (order by clause) 
  
  # display totalamount from billing in ascending order
 select * from billing order by totalamount asc;
 
  # display totalamount from billing in descending order
 select * from billing order by totalamount desc;
 
 # Retrieve the names of all patients in alphabetical order.
SELECT * FROM Patients ORDER BY LastName, FirstName; 

#List doctors along with their specializations in alphabetical order. 
 SELECT * FROM Doctors ORDER BY Specialization, LastName;
 
# Show the duration of each admission, ordered by the admission start date.
SELECT *, DATEDIFF(DischargeDate, AdmissionDate) AS Duration
FROM Admissions
ORDER BY AdmissionDate; 

# List wards along with their types and capacities, ordered by the ward capacity. 
SELECT * FROM Wards ORDER BY maxCapacity; 

# Retrieve doctors' names and contact numbers, ordered alphabetically by the doctors' last names. 
SELECT DoctorID, CONCAT(FirstName, ' ', LastName) AS 'DoctorName' , Contactinfo
FROM Doctors
ORDER BY LastName;

# Show details of psychiatric admissions, ordered by the admission start date.
SELECT * FROM Admissions WHERE medicalnotes = 'Psychiatric admission' ORDER BY AdmissionDate; 

# Display the names and birthdates of patients, ordered by their birthdates.
SELECT FirstName, LastName, dateofbirth FROM Patients ORDER BY dateofbirth;

  # SQL queries for the hospital management system using (Group by clause) 
  
#Count the number of patients for each gender.
SELECT Gender, COUNT(*) AS Patientid
FROM Patients
GROUP BY Gender;

# Count the total number of appointments for each doctor.
SELECT DoctorID, COUNT(*) AS 'TotalAppointments'
FROM Appointments
GROUP BY DoctorID;

# Sum the total billing amount for each patient.
SELECT PatientID, SUM(TotalAmount) AS 'TotalBillingAmount'
FROM Billing
GROUP BY PatientID;

# Average Ward Capacity by Ward Type
SELECT WardType, AVG(MaxCapacity) AS 'AvgWardCapacity'
FROM Wards
GROUP BY WardType;

 # Total Appointments by Patient
SELECT PatientID, COUNT(*) AS 'TotalAppointments'
FROM Appointments
GROUP BY PatientID;

# SQL queries for the hospital management system using (Joins) 

# Retrieve the details of patients who have confirmed appointments, including the appointment information. (inner join)
SELECT Patients.*, Appointments.*
FROM Patients
INNER JOIN Appointments ON Patients.PatientID = Appointments.PatientID
WHERE Appointments.Status = 'Confirmed';

# Show the patients and their admission details, including the reason for admission.
SELECT Patients.*, Admissions.*
FROM Patients
INNER JOIN Admissions ON Patients.PatientID = Admissions.PatientID;

# left join
#List all doctors and their appointments, including doctors without any appointments.
SELECT Doctors.*, Appointments.*
FROM Doctors
LEFT JOIN Appointments ON Doctors.DoctorID = Appointments.DoctorID;

#Retrieve the details of all patients along with their appointment information, if available.
SELECT Patients.*, Appointments.*
FROM Patients
LEFT JOIN Appointments ON Patients.PatientID = Appointments.PatientID;

#right join
#Display all appointments and doctors, including appointments without assigned doctors.
SELECT Appointments.*, Doctors.*
FROM Appointments
RIGHT JOIN Doctors ON Appointments.DoctorID = Doctors.DoctorID;

#List all doctors and their associated appointments, including doctors without any appointments.
SELECT Doctors.*, Appointments.*
FROM Doctors
RIGHT JOIN Appointments ON Doctors.DoctorID = Appointments.DoctorID;

#self join 
# Retrieve the names of patients and their corresponding doctors for appointments.
SELECT A.AppointmentID, P.PatientID, P.FirstName AS PatientFirstName, P.LastName AS PatientLastName,
       D.DoctorID, D.FirstName AS DoctorFirstName, D.LastName AS DoctorLastName
FROM Appointments A
JOIN Patients P ON A.PatientID = P.PatientID
JOIN Doctors D ON A.DoctorID = D.DoctorID;

# List the names of patients and their primary doctors for admissions
SELECT A.AdmissionID, P.PatientID, P.FirstName AS PatientFirstName, P.LastName AS PatientLastName,
       D.DoctorID, D.FirstName AS DoctorFirstName, D.LastName AS DoctorLastName
FROM Admissions A
JOIN Patients P ON A.PatientID = P.PatientID
JOIN Doctors D ON P.PatientID = D.DoctorID;

use hms;

select avg(RoomCharges) from billing;






