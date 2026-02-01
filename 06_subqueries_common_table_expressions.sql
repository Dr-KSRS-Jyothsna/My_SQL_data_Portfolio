/*
===========================================================
File Name   : common_table_expressions.sql
Author      : Dr. K.S.R.S. Jyothsna
Description : Demonstrates usage of Common Table Expressions
              (CTEs) for readable and modular SQL queries.
Database    : MySQL 8+
===========================================================
*/

USE student_db;

---------------------------------------------------
-- 1. Simple CTE
-- Find students who scored above average
---------------------------------------------------
WITH avg_marks_cte AS (
    SELECT AVG(marks) AS avg_marks
    FROM students
)
SELECT name, marks
FROM students, avg_marks_cte
WHERE students.marks > avg_marks_cte.avg_marks;

---------------------------------------------------
-- 2. CTE with JOIN
-- Department-wise average marks
---------------------------------------------------
WITH dept_avg AS (
    SELECT dept_id, AVG(marks) AS avg_marks
    FROM students
    GROUP BY dept_id
)
SELECT d.department_name, da.avg_marks
FROM dept_avg da
JOIN departments d
ON da.dept_id = d.dept_id;

---------------------------------------------------
-- 3. Multiple CTEs
-- Find top student in each department
---------------------------------------------------
WITH dept_max AS (
    SELECT department, MAX(marks) AS max_marks
    FROM students
    GROUP BY department
)
SELECT s.name, s.department, s.marks
FROM students s
JOIN dept_max dm
ON s.department = dm.department
AND s.marks = dm.max_marks;

---------------------------------------------------
-- 4. CTE for ranking (without window function)
-- Rank students by marks
---------------------------------------------------
WITH ranked_students AS (
    SELECT name, marks
    FROM students
    ORDER BY marks DESC
)
SELECT * FROM ranked_students;
