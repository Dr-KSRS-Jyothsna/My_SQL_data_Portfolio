/*
===========================================================
File Name   : query_optimization.sql
Author      : Dr. K.S.R.S. Jyothsna
Description : Demonstrates query optimization techniques
              using EXPLAIN and indexing strategies.
Database    : MySQL
===========================================================
*/

USE student_db;

---------------------------------------------------
-- 1. Analyze query without index
---------------------------------------------------
EXPLAIN
SELECT *
FROM students
WHERE department = 'CSE';

---------------------------------------------------
-- 2. Create index on department
---------------------------------------------------
CREATE INDEX idx_department
ON students(department);

---------------------------------------------------
-- 3. Analyze same query with index
---------------------------------------------------
EXPLAIN
SELECT *
FROM students
WHERE department = 'CSE';

---------------------------------------------------
-- 4. Optimize SELECT columns
-- Bad practice: SELECT *
---------------------------------------------------
SELECT *
FROM students;

---------------------------------------------------
-- Good practice: Select only required columns
---------------------------------------------------
SELECT name, marks
FROM students;

---------------------------------------------------
-- 5. Avoid functions in WHERE clause
-- Bad (index not used)
---------------------------------------------------
SELECT *
FROM students
WHERE UPPER(department) = 'CSE';

---------------------------------------------------
-- Good (index used)
---------------------------------------------------
SELECT *
FROM students
WHERE department = 'CSE';

---------------------------------------------------
-- 6. LIMIT for large datasets
---------------------------------------------------
SELECT name, marks
FROM students
ORDER BY marks DESC
LIMIT 5;

---------------------------------------------------
-- 7. Use proper joins instead of subqueries
---------------------------------------------------
-- Subquery
SELECT name
FROM students
WHERE dept_id IN (
    SELECT dept_id FROM departments
);

-- Join (better)
SELECT s.name
FROM students s
JOIN departments d
ON s.dept_id = d.dept_id;
