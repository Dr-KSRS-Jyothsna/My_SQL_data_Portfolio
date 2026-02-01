/*
===========================================================
File Name   : ddl_dml_intro.sql
Author      : Dr. K.S.R.S. Jyothsna
Description : Basic SQL program demonstrating DDL and DML
              operations using a simple Student database.
Database    : MySQL
===========================================================
*/

-- Step 1: Create a new database
CREATE DATABASE student_db;

-- Step 2: Select the database
USE student_db;

-- Step 3: Create a table (DDL Operation)
CREATE TABLE students (
    student_id INT PRIMARY KEY,
    name        VARCHAR(50) NOT NULL,
    department  VARCHAR(50),
    marks       INT CHECK (marks BETWEEN 0 AND 100)
);

-- Step 4: Insert records into the table (DML Operation)
INSERT INTO students VALUES
(1, 'Anita', 'CSE', 85),
(2, 'Ravi', 'ECE', 78),
(3, 'Meena', 'IT', 92),
(4, 'Kiran', 'CSE', 67),
(5, 'Sita', 'ECE', 88);

-- Step 5: Display all records
SELECT * FROM students;

-- Step 6: Display students who scored more than 80
SELECT name, department, marks
FROM students
WHERE marks > 80;

-- Step 7: Sort students by marks (descending)
SELECT name, marks
FROM students
ORDER BY marks DESC;

-- Step 8: Find average marks of all students
SELECT AVG(marks) AS average_marks
FROM students;

-- Step 9: Count number of students in each department
SELECT department, COUNT(*) AS total_students
FROM students
GROUP BY department;

-- Step 10: Update a record
UPDATE students
SET marks = 90
WHERE student_id = 1;

-- Step 11: Delete a record
DELETE FROM students
WHERE student_id = 4;

-- Step 12: Final view of table
SELECT * FROM students;
