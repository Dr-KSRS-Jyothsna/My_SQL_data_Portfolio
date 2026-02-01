/*
===========================================================
File Name   : triggers.sql
Author      : Dr. K.S.R.S. Jyothsna
Description : Demonstrates BEFORE and AFTER triggers
              for data validation and auditing.
Database    : MySQL
===========================================================
*/

USE student_db;

---------------------------------------------------
-- Step 1: Create an audit table
---------------------------------------------------
CREATE TABLE student_audit (
    audit_id INT AUTO_INCREMENT PRIMARY KEY,
    student_id INT,
    old_marks INT,
    new_marks INT,
    changed_on TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

---------------------------------------------------
-- 1. BEFORE UPDATE Trigger
-- Prevent marks from going above 100
---------------------------------------------------
DELIMITER $$

CREATE TRIGGER before_marks_update
BEFORE UPDATE ON students
FOR EACH ROW
BEGIN
    IF NEW.marks > 100 THEN
        SET NEW.marks = 100;
    END IF;
END$$

DELIMITER ;

---------------------------------------------------
-- 2. AFTER UPDATE Trigger
-- Log marks changes into audit table
---------------------------------------------------
DELIMITER $$

CREATE TRIGGER after_marks_update
AFTER UPDATE ON students
FOR EACH ROW
BEGIN
    INSERT INTO student_audit(student_id, old_marks, new_marks)
    VALUES (OLD.student_id, OLD.marks, NEW.marks);
END$$

DELIMITER ;

---------------------------------------------------
-- Test the triggers
---------------------------------------------------
UPDATE students
SET marks = 120
WHERE student_id = 2;

-- View audit log
SELECT * FROM student_audit;
