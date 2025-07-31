-- Create a stored procedure to retrieve all employees
DELIMITER //
CREATE PROCEDURE GetAllEmployees()
BEGIN
    SELECT * FROM employees;
END;
//
DELIMITER ;

-- Execute the stored procedure
CALL GetAllEmployees();

-- Create a stored procedure with a parameter to get employees by department
DELIMITER //
CREATE PROCEDURE GetEmployeesByDepartment(IN dept INT)
BEGIN
    SELECT * FROM employees WHERE dept_id = dept;
END;
//
DELIMITER ;

-- Execute with department ID 2
CALL GetEmployeesByDepartment(2);

-- Create a procedure to update employee salary
DELIMITER //
CREATE PROCEDURE UpdateEmployeeSalary(IN emp INT, IN new_sal DECIMAL(10,2))
BEGIN
    UPDATE employees SET salary = new_sal WHERE emp_id = emp;
END;
//
DELIMITER ;

-- Execute the update
CALL UpdateEmployeeSalary(5, 75000.00);

-- Drop a stored procedure
DROP PROCEDURE IF EXISTS GetAllEmployees;

-- Create a scalar function to calculate annual salary
DELIMITER //
CREATE FUNCTION CalculateAnnualSalary(monthly_salary DECIMAL(10,2))
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
    RETURN monthly_salary * 12;
END;
//
DELIMITER ;

-- Use the scalar function in a query
SELECT emp_id, name, salary, CalculateAnnualSalary(salary) AS annual_salary
FROM employees;

-- Create a table-valued function to get high salary employees
-- Note: This is syntax for SQL Server or PostgreSQL
-- In MySQL, you would use a stored procedure or view instead

-- Drop function if needed
DROP FUNCTION IF EXISTS CalculateAnnualSalary;

