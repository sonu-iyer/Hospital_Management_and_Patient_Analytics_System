Hospital Management & Patient Analytics System
-> Project Overview

This project is a Database Management System (DBMS) designed to manage hospital operations efficiently. It stores and analyzes data related to patients, doctors, appointments, and treatments to generate meaningful insights for better decision-making.

-> Objectives
Design a relational database for hospital data
Manage patient, doctor, and treatment records
Perform data analysis using SQL queries
Generate insights like revenue, doctor performance, and disease trends
-> Tables Used
Patients – Stores patient details
Doctors – Stores doctor information and specialization
Appointments – Tracks patient visits
Treatments – Stores diagnosis and treatment cost
-> Database Schema
CREATE DATABASE hospital_db;
USE hospital_db;

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
-> Key Features / Queries
 1. Most Consulted Doctors
Identifies doctors with highest number of patient visits
 2. Monthly Revenue Analysis
Calculates total treatment cost per month
 3. Most Common Diseases
Finds frequently occurring diagnoses
 4. Patient Visit Frequency
Tracks number of visits per patient
 5. Doctor Performance
Evaluates doctors based on patients handled
-> Advanced Analysis
Top revenue-generating patients
Doctor specialization performance
Monthly patient visit trends
->  How to Run
Install MySQL Server & Workbench
Open MySQL Workbench
Run the SQL script to create database and tables
Insert sample data
Execute queries to generate insights
-> Expected Outcomes
Identify busiest doctors
Analyze hospital revenue trends
Detect common diseases
Monitor patient activity
Evaluate doctor efficiency
