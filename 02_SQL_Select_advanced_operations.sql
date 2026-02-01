/*
===========================================================
File Name   : select_advanced.sql
Author      : Dr. K.S.R.S. Jyothsna
Description : Demonstrates advanced SELECT queries using
              filtering, pattern matching, and limits.
Database    : MySQL
===========================================================
*/

-- Use the same database created earlier
USE student_db;

-- Display all records
SELECT * FROM students;

-- 1. DISTINCT: Display unique departments
SELECT DISTINCT department
FROM students;

-- 2. WHERE with AND condition
SELECT name, marks
FROM students
WHERE department = 'CSE' AND marks > 80;

-- 3. WHERE with OR condition
SELECT name, department
FROM students
WHERE department = 'IT' OR department = 'ECE';

-- 4. BETWEEN: Students with marks between 70 and 90
SELECT name, marks
FROM students
WHERE marks BETWEEN 70 AND 90;

-- 5. IN: Students from specific departments
SELECT name, department
FROM students
WHERE department IN ('CSE', 'IT');

-- 6. LIKE: Names starting with 'A'
SELECT name
FROM students
WHERE name LIKE 'A%';

-- 7. LIKE: Names ending with 'a'
SELECT name
FROM students
WHERE name LIKE '%a';

-- 8. ORDER BY with LIMIT: Top 3 students
SELECT name, marks
FROM students
ORDER BY marks DESC
LIMIT 3;

-- 9. Find minimum and maximum marks
SELECT 
    MIN(marks) AS minimum_marks,
    MAX(marks) AS maximum_marks
FROM students;

-- 10. Count students scoring above average
SELECT COUNT(*) AS above_average_students
FROM students
WHERE marks > (SELECT AVG(marks) FROM students);
