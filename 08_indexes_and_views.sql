/*
===========================================================
File Name   : indexes_and_views.sql
Author      : Dr. K.S.R.S. Jyothsna
Description : Demonstrates creation and usage of
              indexes and views for performance and
              simplified data access.
Database    : MySQL
===========================================================
*/

USE student_db;

---------------------------------------------------
-- INDEXES
---------------------------------------------------

-- 1. Create an index on marks column
CREATE INDEX idx_marks
ON students(marks);

-- 2. Create a composite index on department and marks
CREATE INDEX idx_dept_marks
ON students(department, marks);

-- 3. Check query performance using EXPLAIN
EXPLAIN
SELECT * 
FROM students
WHERE marks > 80;

---------------------------------------------------
-- VIEWS
---------------------------------------------------

-- 4. Create a simple view for high scoring students
CREATE VIEW high_scorers AS
SELECT name, department, marks
FROM students
WHERE marks >= 85;

-- 5. Use the view
SELECT * FROM high_scorers;

-- 6. Create a department summary view
CREATE VIEW dept_summary AS
SELECT department, AVG(marks) AS avg_marks
FROM students
GROUP BY department;

-- 7. Use department summary view
SELECT * FROM dept_summary;

---------------------------------------------------
-- Update through view (if allowed)
---------------------------------------------------
UPDATE high_scorers
SET marks = 95
WHERE name = 'Anita';

-- Final check
SELECT * FROM students;
