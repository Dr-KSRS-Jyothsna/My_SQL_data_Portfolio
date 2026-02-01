/*
===========================================================
File Name   : aggregate_and_string_functions.sql
Author      : Dr. K.S.R.S. Jyothsna
Description : Demonstrates aggregate and string functions
              used in data analysis.
Database    : MySQL
===========================================================
*/

USE student_db;

---------------------------------------------------
-- AGGREGATE FUNCTIONS
---------------------------------------------------

-- 1. Total number of students
SELECT COUNT(*) AS total_students
FROM students;

-- 2. Total marks of all students
SELECT SUM(marks) AS total_marks
FROM students;

-- 3. Average marks
SELECT AVG(marks) AS average_marks
FROM students;

-- 4. Highest and lowest marks
SELECT 
    MAX(marks) AS highest_marks,
    MIN(marks) AS lowest_marks
FROM students;

-- 5. Department-wise total marks
SELECT department, SUM(marks) AS dept_total
FROM students
GROUP BY department;

---------------------------------------------------
-- STRING FUNCTIONS
---------------------------------------------------

-- 6. Convert names to uppercase
SELECT UPPER(name) AS name_upper
FROM students;

-- 7. Convert names to lowercase
SELECT LOWER(name) AS name_lower
FROM students;

-- 8. Concatenate name and department
SELECT CONCAT(name, ' - ', department) AS student_info
FROM students;

-- 9. Length of each student name
SELECT name, LENGTH(name) AS name_length
FROM students;

-- 10. Trim extra spaces
SELECT TRIM('   Data Analytics   ') AS trimmed_text;

---------------------------------------------------
-- NUMERIC & DATE FUNCTIONS
---------------------------------------------------

-- 11. Round average marks
SELECT ROUND(AVG(marks), 2) AS rounded_avg
FROM students;

-- 12. Current date
SELECT CURRENT_DATE() AS today_date;

-- 13. Year of joining (from employees table)
SELECT emp_name, YEAR(CURDATE()) AS current_year
FROM employees;
