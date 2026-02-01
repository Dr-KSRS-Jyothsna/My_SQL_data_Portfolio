/*
===========================================================
File Name   : stored_procedures.sql
Author      : Dr. K.S.R.S. Jyothsna
Description : Demonstrates creation and execution of
              stored procedures for reusable logic.
Database    : MySQL
===========================================================
*/

USE student_db;

---------------------------------------------------
-- 1. Simple Stored Procedure
-- Display all students
---------------------------------------------------
DELIMITER $$

CREATE PROCEDURE get_all_students()
BEGIN
    SELECT * FROM students;
END$$

DELIMITER ;

-- Call the procedure
CALL get_all_students();

---------------------------------------------------
-- 2. Stored Procedure with Input Parameter
-- Get students by department
---------------------------------------------------
DELIMITER $$

CREATE PROCEDURE get_students_by_dept(IN dept_name VARCHAR(50))
BEGIN
    SELECT name, marks
    FROM students
    WHERE department = dept_name;
END$$

DELIMITER ;

-- Call the procedure
CALL get_students_by_dept('CSE');

---------------------------------------------------
-- 3. Stored Procedure with Input and Output
-- Get total students in a department
---------------------------------------------------
DELIMITER $$

CREATE PROCEDURE total_students_by_dept(
    IN dept_name VARCHAR(50),
    OUT total INT
)
BEGIN
    SELECT COUNT(*) INTO total
    FROM students
    WHERE department = dept_name;
END$$

DELIMITER ;

-- Call with output
CALL total_students_by_dept('ECE', @count);
SELECT @count AS total_students_in_ECE;
