-- Final Capstone Tasks

-- 1. Retrieve employees with their department names
SELECT e.emp_id, e.name, d.dept_name
FROM employees e
JOIN departments d ON e.dept_id = d.dept_id;

-- 2. Find top 3 highest paid employees
SELECT name, salary
FROM employees
ORDER BY salary DESC
LIMIT 3;

-- 3. Generate a view of active employees with annual salary
CREATE VIEW active_employee_salary AS
SELECT emp_id, name, salary, salary * 12 AS annual_salary
FROM employees
WHERE status = 'Active';

-- 4. Create a procedure to transfer funds between accounts
DELIMITER //
CREATE PROCEDURE TransferFunds(IN from_id INT, IN to_id INT, IN amount DECIMAL(10,2))
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION ROLLBACK;
    START TRANSACTION;
    UPDATE accounts SET balance = balance - amount WHERE account_id = from_id;
    UPDATE accounts SET balance = balance + amount WHERE account_id = to_id;
    COMMIT;
END;
//
DELIMITER ;

-- 5. Create an audit trigger for insert on employees
DELIMITER //
CREATE TRIGGER trg_log_insert
AFTER INSERT ON employees
FOR EACH ROW
BEGIN
    INSERT INTO employee_audit (emp_id, action)
    VALUES (NEW.emp_id, 'INSERTED');
END;
//
DELIMITER ;

-- 6. Generate report of total salary per department
SELECT d.dept_name, SUM(e.salary) AS total_salary
FROM employees e
JOIN departments d ON e.dept_id = d.dept_id
GROUP BY d.dept_name;

-- 7. Backup employees table
CREATE TABLE employees_final_backup AS
SELECT * FROM employees;

-- 8. Use recursive CTE to list organization chart
WITH RECURSIVE org_chart AS (
    SELECT emp_id, name, manager_id, 1 AS level
    FROM employees
    WHERE manager_id IS NULL
    UNION ALL
    SELECT e.emp_id, e.name, e.manager_id, oc.level + 1
    FROM employees e
    JOIN org_chart oc ON e.manager_id = oc.emp_id
)
SELECT * FROM org_chart
ORDER BY level, name;

