CREATE DATABASE hospital_db;
use hospital_db;
CREATE TABLE Patients (
    patient_id INT PRIMARY KEY,
    name VARCHAR(100),
    age INT,
    gender VARCHAR(10)
);

CREATE TABLE Doctors (
    doctor_id INT PRIMARY KEY,
    name VARCHAR(100),
    specialization VARCHAR(100)
);

CREATE TABLE Appointments (
    appointment_id INT PRIMARY KEY,
    patient_id INT,
    doctor_id INT,
    date DATE,
    FOREIGN KEY (patient_id) REFERENCES Patients(patient_id),
    FOREIGN KEY (doctor_id) REFERENCES Doctors(doctor_id)
);

CREATE TABLE Treatments (
    treatment_id INT PRIMARY KEY,
    patient_id INT,
    diagnosis VARCHAR(100),
    cost DECIMAL(10,2),
    date DATE,
    FOREIGN KEY (patient_id) REFERENCES Patients(patient_id)
);

INSERT INTO Patients VALUES
(1, 'Sonalika', 21, 'Female'),
(2, 'Rahul', 30, 'Male'),
(3, 'Anjali', 25, 'Female'),
(4, 'Kiran', 40, 'Male');

INSERT INTO Doctors VALUES
(101, 'Dr. Sharma', 'Cardiology'),
(102, 'Dr. Reddy', 'Orthopedics'),
(103, 'Dr. Khan', 'General');

INSERT INTO Appointments VALUES
(1, 1, 101, '2025-04-01'),
(2, 2, 102, '2025-04-02'),
(3, 1, 101, '2025-04-10'),
(4, 3, 103, '2025-04-05'),
(5, 4, 101, '2025-05-01');

INSERT INTO Treatments VALUES
(1, 1, 'Heart Disease', 5000, '2025-04-01'),
(2, 2, 'Fracture', 3000, '2025-04-02'),
(3, 1, 'Heart Checkup', 2000, '2025-04-10'),
(4, 3, 'Fever', 1000, '2025-04-05'),
(5, 4, 'Heart Disease', 7000, '2025-05-01');

SELECT * FROM Patients;
SELECT * FROM Doctors;
SELECT * FROM Appointments;
SELECT * FROM Treatments;

SELECT d.name, COUNT(*) AS visits
FROM Doctors d
JOIN Appointments a ON d.doctor_id = a.doctor_id
GROUP BY d.name
ORDER BY visits DESC;

SELECT DATE_FORMAT(date, '%Y-%m') AS month,
       SUM(cost) AS revenue
FROM Treatments
GROUP BY month;

SELECT diagnosis, COUNT(*) AS count
FROM Treatments
GROUP BY diagnosis
ORDER BY count DESC;

SELECT p.name, COUNT(*) AS visits
FROM Patients p
JOIN Appointments a ON p.patient_id = a.patient_id
GROUP BY p.name;

SELECT d.name, COUNT(*) AS patients
FROM Doctors d
JOIN Appointments a ON d.doctor_id = a.doctor_id
GROUP BY d.name;

desc appointments;
desc doctors;

SELECT d.specialization, COUNT(*) AS total_cases
FROM Doctors d
JOIN Appointments a ON d.doctor_id = a.doctor_id
GROUP BY d.specialization;

SELECT 
    DATE_FORMAT(date, '%Y-%m') AS month,
    COUNT(*) AS total_visits
FROM Appointments
GROUP BY month;