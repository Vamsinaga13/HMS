-- Create the database
CREATE DATABASE HealthcareManagementSystem;

-- Use the created database
USE HealthcareManagementSystem;

-- Create Patients table
CREATE TABLE Patients (
    PatientID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Age INT NOT NULL,
    Gender ENUM('Male', 'Female', 'Other') NOT NULL,
    Contact VARCHAR(15) NOT NULL,
    InsuranceDetails VARCHAR(255)
);

-- Create Doctors table
CREATE TABLE Doctors (
    DoctorID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Specialization VARCHAR(100) NOT NULL,
    Contact VARCHAR(15) NOT NULL
);

-- Create Appointments table
CREATE TABLE Appointments (
    AppointmentID INT AUTO_INCREMENT PRIMARY KEY,
    PatientID INT,
    DoctorID INT,
    AppointmentDate DATE NOT NULL,
    TimeSlot TIME NOT NULL,
    Status ENUM('Scheduled', 'Completed', 'Cancelled') DEFAULT 'Scheduled',
    FOREIGN KEY (PatientID) REFERENCES Patients(PatientID),
    FOREIGN KEY (DoctorID) REFERENCES Doctors(DoctorID)
);

-- Create Billing table
CREATE TABLE Billing (
    BillingID INT AUTO_INCREMENT PRIMARY KEY,
    PatientID INT,
    Amount DECIMAL(10, 2) NOT NULL,
    PaymentStatus ENUM('Paid', 'Pending', 'Cancelled') DEFAULT 'Pending',
    FOREIGN KEY (PatientID) REFERENCES Patients(PatientID)
);

-- Create Pharmacy table
CREATE TABLE Pharmacy (
    MedicineID INT AUTO_INCREMENT PRIMARY KEY,
    MedicineName VARCHAR(100) NOT NULL,
    Quantity INT NOT NULL,
    Price DECIMAL(10, 2) NOT NULL
);

-- Create Prescriptions table
CREATE TABLE Prescriptions (
    PrescriptionID INT AUTO_INCREMENT PRIMARY KEY,
    PatientID INT,
    DoctorID INT,
    MedicineID INT,
    Dosage VARCHAR(100) NOT NULL,
    DateIssued DATE NOT NULL,
    FOREIGN KEY (PatientID) REFERENCES Patients(PatientID),
    FOREIGN KEY (DoctorID) REFERENCES Doctors(DoctorID),
    FOREIGN KEY (MedicineID) REFERENCES Pharmacy(MedicineID)
);

 -- Inserting Sample Data
 -- Insert sample data into Patients
INSERT INTO Patients (Name, Age, Gender, Contact, InsuranceDetails) VALUES
('John Doe', 30, 'Male', '1234567890', 'Health Insurance A'),
('Jane Smith', 25, 'Female', '0987654321', 'Health Insurance B');

-- Insert sample data into Doctors
INSERT INTO Doctors (Name, Specialization, Contact) VALUES
('Dr. Alice Johnson', 'Cardiology', '1112223333'),
('Dr. Bob Brown', 'Neurology', '4445556666');

-- Insert sample data into Appointments
INSERT INTO Appointments (PatientID, DoctorID, AppointmentDate, TimeSlot, Status) VALUES
(1, 1, '2023-10-15', '10:00:00', 'Scheduled'),
(2, 2, '2023-10-16', '11:00:00', 'Scheduled');

-- Insert sample data into Billing
INSERT INTO Billing (PatientID, Amount, PaymentStatus) VALUES
(1, 150.00, 'Pending'),
(2, 200.00, 'Paid');

-- Insert sample data into Pharmacy
INSERT INTO Pharmacy (MedicineName, Quantity, Price) VALUES
('Aspirin', 100, 5.00),
('Ibuprofen', 50, 10.00);

-- Insert sample data into Prescriptions
INSERT INTO Prescriptions (PatientID, DoctorID, MedicineID, Dosage, DateIssued) VALUES
(1, 1, 1, '1 tablet daily', '2023-10-15'),
(2, 2, 2, '2 tablets daily', '2023-10-16');

 -- CRUD Operations Now, we will demonstrate basic CRUD operations for the Patients table as an example.
INSERT INTO Patients (Name, Age, Gender, Contact, InsuranceDetails) VALUES
('Emily White', 28, 'Female', '9877654321', 'Health Insurance C');

-- Retrieve all patients
SELECT * FROM Patients;

-- Retrieve a specific patient by ID
SELECT * FROM Patients WHERE PatientID = 1;

UPDATE Patients
SET Contact = '9998887777', InsuranceDetails = 'Updated Insurance'
WHERE PatientID = 1;






