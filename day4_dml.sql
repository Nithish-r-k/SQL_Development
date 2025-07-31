-- Insert single employee record
INSERT INTO employees (employee_id, name, department_id, salary, hire_date)  
VALUES (101, 'Alice Johnson', 1, 60000, '2024-01-15');

-- Insert multiple employee records
INSERT INTO employees (employee_id, name, department_id, salary, hire_date)  
VALUES  
(102, 'Bob Smith', 2, 55000, '2023-12-10'),  
(103, 'Charlie Brown', 3, 70000, '2022-09-05');

-- Insert data into specific columns only
INSERT INTO employees (employee_id, name)  
VALUES (104, 'David Lee');

-- Update an employee’s salary
UPDATE employees  
SET salary = 65000  
WHERE employee_id = 101;

-- Increase salary of all IT department employees by 10%
UPDATE employees  
SET salary = salary * 1.10  
WHERE department_id = 1;

-- Delete an employee by ID
DELETE FROM employees  
WHERE employee_id = 103;

-- Delete all employees from the HR department
DELETE FROM employees  
WHERE department_id = 2;

-- Insert employee data and commit changes
INSERT INTO employees (employee_id, name, department_id, salary)  
VALUES (105, 'Emma Watson', 3, 75000);  

COMMIT;

-- Insert then rollback
INSERT INTO employees (employee_id, name, department_id, salary)  
VALUES (106, 'Frank White', 4, 50000);  

ROLLBACK;

-- Using SAVEPOINT and partial rollback
BEGIN;

INSERT INTO employees (employee_id, name, department_id, salary)  
VALUES (107, 'George Harris', 1, 68000);  

SAVEPOINT sp1;

INSERT INTO employees (employee_id, name, department_id, salary)  
VALUES (108, 'Hannah Scott', 2, 53000);  

ROLLBACK TO sp1;

COMMIT;
