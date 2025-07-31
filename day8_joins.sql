-- INNER JOIN: Employees with their department names
SELECT employees.emp_id, employees.name, departments.dept_name
FROM employees
INNER JOIN departments
ON employees.dept_id = departments.dept_id;

-- LEFT JOIN: All employees, even without a department
SELECT employees.emp_id, employees.name, departments.dept_name
FROM employees
LEFT JOIN departments
ON employees.dept_id = departments.dept_id;

-- RIGHT JOIN: All departments, even without employees (MySQL 8+ supports RIGHT JOIN)
SELECT employees.emp_id, employees.name, departments.dept_name
FROM employees
RIGHT JOIN departments
ON employees.dept_id = departments.dept_id;

-- FULL JOIN: All employees and all departments (simulate FULL JOIN if not supported)
SELECT employees.emp_id, employees.name, departments.dept_name
FROM employees
LEFT JOIN departments ON employees.dept_id = departments.dept_id
UNION
SELECT employees.emp_id, employees.name, departments.dept_name
FROM employees
RIGHT JOIN departments ON employees.dept_id = departments.dept_id;

-- CROSS JOIN: All possible combinations of employees and departments
SELECT employees.name, departments.dept_name
FROM employees
CROSS JOIN departments;

-- SELF JOIN: Employees and their managers
SELECT e1.name AS Employee, e2.name AS Manager
FROM employees e1
LEFT JOIN employees e2
ON e1.manager_id = e2.emp_id;
