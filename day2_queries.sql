
-- Retrieve all data from the employees table
SELECT * FROM employees;

-- Retrieve only name and department
SELECT name, department FROM employees;

-- Retrieve employees from the IT department
SELECT * FROM employees WHERE department = 'IT';

-- Retrieve employees earning more than 60,000
SELECT * FROM employees WHERE salary > 60000;

-- Retrieve employees earning between 50,000 and 70,000
SELECT * FROM employees 
WHERE salary >= 50000 AND salary <= 70000;

-- Sort employees by salary (lowest to highest)
SELECT * FROM employees ORDER BY salary ASC;

-- Sort employees by name in descending order
SELECT * FROM employees ORDER BY name DESC;

-- Retrieve employees with salaries between 40,000 and 70,000
SELECT * FROM employees WHERE salary BETWEEN 40000 AND 70000;

-- Retrieve employees from IT and HR departments
SELECT * FROM employees WHERE department IN ('IT', 'HR');

-- Retrieve employees whose names start with 'A'
SELECT * FROM employees WHERE name LIKE 'A%';

-- Retrieve employees whose names contain 'son'
SELECT * FROM employees WHERE name LIKE '%son%';
