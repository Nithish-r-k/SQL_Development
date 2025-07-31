-- Create audit table for employee actions
CREATE TABLE employee_audit (
    audit_id INT PRIMARY KEY AUTO_INCREMENT,
    emp_id INT,
    action VARCHAR(50),
    action_time DATETIME DEFAULT CURRENT_TIMESTAMP
);

-- AFTER INSERT trigger to log new employees
DELIMITER //
CREATE TRIGGER trg_AfterEmployeeInsert
AFTER INSERT ON employees
FOR EACH ROW
BEGIN
    INSERT INTO employee_audit (emp_id, action)
    VALUES (NEW.emp_id, 'INSERTED');
END;
//
DELIMITER ;

-- AFTER UPDATE trigger to log salary changes
DELIMITER //
CREATE TRIGGER trg_AfterSalaryUpdate
AFTER UPDATE ON employees
FOR EACH ROW
BEGIN
    INSERT INTO employee_audit (emp_id, action)
    VALUES (NEW.emp_id, 'SALARY UPDATED');
END;
//
DELIMITER ;

-- INSTEAD OF DELETE trigger to mark employee as inactive
-- Only for systems like SQL Server. In MySQL, use BEFORE DELETE instead
ALTER TABLE employees ADD COLUMN status VARCHAR(20) DEFAULT 'Active';

DELIMITER //
CREATE TRIGGER trg_BeforeEmployeeDelete
BEFORE DELETE ON employees
FOR EACH ROW
BEGIN
    UPDATE employees SET status = 'Inactive' WHERE emp_id = OLD.emp_id;
END;
//
DELIMITER ;

-- Drop a trigger
DROP TRIGGER IF EXISTS trg_AfterEmployeeInsert;

-- Enable event scheduler (for MySQL)
SET GLOBAL event_scheduler = ON;

-- Create an event to delete old logs every day
DELIMITER //
CREATE EVENT DeleteOldLogs
ON SCHEDULE EVERY 1 DAY
DO
BEGIN
    DELETE FROM employee_audit WHERE action_time < NOW() - INTERVAL 30 DAY;
END;
//
DELIMITER ;

-- Create an event to generate a monthly report entry
DELIMITER //
CREATE EVENT GenerateMonthlySalesReport
ON SCHEDULE EVERY 1 MONTH
DO
BEGIN
    INSERT INTO reports (report_name, created_at)
    VALUES ('Monthly Sales Report', NOW());
END;
//
DELIMITER ;

-- Alter event schedule
ALTER EVENT DeleteOldLogs
ON SCHEDULE EVERY 7 DAY;

-- Drop an event
DROP EVENT IF EXISTS DeleteOldLogs;

