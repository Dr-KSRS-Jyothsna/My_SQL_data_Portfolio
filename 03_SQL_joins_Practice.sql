/*
===========================================================
File Name   : joins_Practice.sql
Author      : Dr. K.S.R.S. Jyothsna
Description : Demonstrates INNER JOIN, LEFT JOIN,
              RIGHT JOIN using Students and Departments.
Database    : MySQL
===========================================================
*/

-- Use existing database
USE student_db;

-- Step 1: Create a new table: departments
CREATE TABLE departments (
    dept_id INT PRIMARY KEY,
    department_name VARCHAR(50)
);

-- Step 2: Insert data into departments table
INSERT INTO departments VALUES
(1, 'CSE'),
(2, 'ECE'),
(3, 'IT'),
(4, 'MECH');

-- Step 3: Add dept_id column to students table
ALTER TABLE students
ADD dept_id INT;

-- Step 4: Update students with dept_id
UPDATE students SET dept_id = 1 WHERE department = 'CSE';
UPDATE students SET dept_id = 2 WHERE department = 'ECE';
UPDATE students SET dept_id = 3 WHERE department = 'IT';

-- View both tables
SELECT * FROM students;
SELECT * FROM departments;

---------------------------------------------------
-- 1. INNER JOIN
-- Returns only matching records from both tables
---------------------------------------------------
SELECT s.name, d.department_name, s.marks
FROM students s
INNER JOIN departments d
ON s.dept_id = d.dept_id;

---------------------------------------------------
-- 2. LEFT JOIN
-- Returns all records from left table (students)
---------------------------------------------------
SELECT s.name, d.department_name, s.marks
FROM students s
LEFT JOIN departments d
ON s.dept_id = d.dept_id;

---------------------------------------------------
-- 3. RIGHT JOIN
-- Returns all records from right table (departments)
---------------------------------------------------
SELECT s.name, d.department_name, s.marks
FROM students s
RIGHT JOIN departments d
ON s.dept_id = d.dept_id;

---------------------------------------------------
-- 4. Students without department
---------------------------------------------------
SELECT s.name
FROM students s
LEFT JOIN departments d
ON s.dept_id = d.dept_id
WHERE d.department_name IS NULL;

---------------------------------------------------
-- 5. Count students in each department
---------------------------------------------------
SELECT d.department_name, COUNT(s.student_id) AS total_students
FROM departments d
LEFT JOIN students s
ON s.dept_id = d.dept_id
GROUP BY d.department_name;
