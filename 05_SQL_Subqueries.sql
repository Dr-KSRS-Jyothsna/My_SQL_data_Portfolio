/*
===========================================================
File Name   : subqueries.sql
Author      : Dr. K.S.R.S. Jyothsna
Description : Demonstrates simple and correlated subqueries
              using employee and student data.
Database    : MySQL
===========================================================
*/

USE student_db;

---------------------------------------------------
-- 1. Subquery in WHERE clause
-- Find students who scored above average
---------------------------------------------------
SELECT name, marks
FROM students
WHERE marks > (SELECT AVG(marks) FROM students);

---------------------------------------------------
-- 2. Subquery with IN
-- Students from departments that exist in departments table
---------------------------------------------------
SELECT name, department
FROM students
WHERE dept_id IN (
    SELECT dept_id 
    FROM departments
);

---------------------------------------------------
-- 3. Subquery in SELECT clause
-- Display student name with average marks
---------------------------------------------------
SELECT 
    name,
    marks,
    (SELECT AVG(marks) FROM students) AS avg_marks
FROM students;

---------------------------------------------------
-- 4. Correlated Subquery
-- Students who scored highest in each department
---------------------------------------------------
SELECT s1.name, s1.department, s1.marks
FROM students s1
WHERE s1.marks = (
    SELECT MAX(s2.marks)
    FROM students s2
    WHERE s2.department = s1.department
);

---------------------------------------------------
-- 5. Subquery with EXISTS
-- Check if any student scored above 90
---------------------------------------------------
SELECT name
FROM students s
WHERE EXISTS (
    SELECT 1 
    FROM students 
    WHERE marks > 90
);

---------------------------------------------------
-- 6. Subquery in FROM clause (Derived Table)
-- Find department-wise average marks
---------------------------------------------------
SELECT department, avg_marks
FROM (
    SELECT department, AVG(marks) AS avg_marks
    FROM students
    GROUP BY department
) AS dept_avg;
