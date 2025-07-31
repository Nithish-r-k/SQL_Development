-- Retrieve employees from the Sales department
SELECT * FROM employees WHERE department = 'Sales';

-- Retrieve customers whose names start with 'A'
SELECT * FROM customers WHERE name LIKE 'A%';

-- Retrieve customers whose names end with 'ohn'
SELECT * FROM customers WHERE name LIKE '_ohn';

-- Retrieve employees from multiple departments
SELECT * FROM employees WHERE department IN ('Sales', 'HR', 'IT');

-- Retrieve products in a price range
SELECT * FROM products WHERE price BETWEEN 100 AND 500;

-- Retrieve employees with no department assigned
SELECT * FROM employees WHERE department IS NULL;

-- Retrieve employees in Sales with salary above 50,000
SELECT * FROM employees 
WHERE department = 'Sales' AND salary > 50000;

-- Retrieve employees in HR or salary less than 40,000
SELECT * FROM employees 
WHERE department = 'HR' OR salary < 40000;

-- Subquery: Employees earning above average salary
SELECT * FROM employees 
WHERE salary > (SELECT AVG(salary) FROM employees);

-- Subquery in SELECT: Get department name using department id
SELECT name, (SELECT dept_name FROM departments WHERE departments.dept_id = employees.dept_id) AS department 
FROM employees;

-- Subquery in FROM: Average salary per department for salary > 40000
SELECT department, AVG(salary) AS avg_salary 
FROM (
    SELECT department, salary FROM employees WHERE salary > 40000
) AS temp_table 
GROUP BY department;

-- Subquery in INSERT: Backup IT employees
INSERT INTO employees_backup (emp_id, name, department, salary) 
SELECT emp_id, name, department, salary FROM employees 
WHERE department = 'IT';

-- Subquery in UPDATE: Increase salary for underpaid employees
UPDATE employees 
SET salary = salary * 1.10 
WHERE salary < (SELECT AVG(salary) FROM employees);

-- Subquery in DELETE: Remove employees in non-existing departments
DELETE FROM employees 
WHERE dept_id NOT IN (SELECT dept_id FROM departments);
