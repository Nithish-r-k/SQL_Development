-- Retrieve all employee names and salaries
SELECT name, salary FROM employees;

-- Find employees in the IT department earning more than 60,000
SELECT name, salary FROM employees  
WHERE department_id = 1 AND salary > 60000;

-- Sort employees by highest salary first
SELECT name, salary FROM employees  
ORDER BY salary DESC;

-- Count the number of employees in each department
SELECT department_id, COUNT(*) AS employee_count  
FROM employees  
GROUP BY department_id;

-- Find departments with an average salary greater than 65,000
SELECT department_id, AVG(salary) AS avg_salary  
FROM employees  
GROUP BY department_id  
HAVING AVG(salary) > 65000;

-- Count total employees
SELECT COUNT(*) AS total_employees FROM employees;

-- Find the highest and lowest salary
SELECT MAX(salary) AS highest_salary, MIN(salary) AS lowest_salary FROM employees;

-- Calculate total salary expense per department
SELECT department_id, SUM(salary) AS total_salary  
FROM employees  
GROUP BY department_id;

-- Retrieve employees sorted by department and then by salary descending
SELECT name, department_id, salary  
FROM employees  
ORDER BY department_id ASC, salary DESC;
