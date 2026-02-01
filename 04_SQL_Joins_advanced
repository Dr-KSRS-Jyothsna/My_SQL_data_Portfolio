/*
===========================================================
File Name   : self_cross_join.sql
Author      : Dr. K.S.R.S. Jyothsna
Description : Demonstrates SELF JOIN and CROSS JOIN
              using Employee hierarchy example.
Database    : MySQL
===========================================================
*/

-- Use existing database
USE student_db;

---------------------------------------------------
-- Step 1: Create employees table with manager id
---------------------------------------------------
CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    manager_id INT
);

-- Step 2: Insert sample data
INSERT INTO employees VALUES
(1, 'Ravi', NULL),
(2, 'Anita', 1),
(3, 'Meena', 1),
(4, 'Kiran', 2),
(5, 'Sita', 2);

SELECT * FROM employees;

---------------------------------------------------
-- 1. SELF JOIN
-- Display employee and their manager
---------------------------------------------------
SELECT 
    e.emp_name AS employee,
    m.emp_name AS manager
FROM employees e
LEFT JOIN employees m
ON e.manager_id = m.emp_id;

---------------------------------------------------
-- 2. Employees who have no manager (Top level)
---------------------------------------------------
SELECT emp_name
FROM employees
WHERE manager_id IS NULL;

---------------------------------------------------
-- 3. CROSS JOIN
-- Cartesian product example
---------------------------------------------------

-- Create a simple projects table
CREATE TABLE projects (
    project_id INT,
    project_name VARCHAR(50)
);

INSERT INTO projects VALUES
(101, 'AI System'),
(102, 'Web App');

SELECT * FROM projects;

-- Cross join employees with projects
SELECT e.emp_name, p.project_name
FROM employees e
CROSS JOIN projects p;
