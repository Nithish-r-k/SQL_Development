-- Use EXPLAIN to analyze query performance
EXPLAIN SELECT * FROM employees WHERE salary > 60000;

-- Add index on salary column to improve performance
CREATE INDEX idx_salary ON employees(salary);

-- Optimize join with indexes on joining keys
CREATE INDEX idx_emp_dept ON employees(dept_id);
CREATE INDEX idx_dept_id ON departments(dept_id);

-- Use SELECT only required columns (avoid SELECT *)
SELECT name, salary FROM employees WHERE salary > 60000;

-- Avoid subqueries when possible – use JOIN
-- Subquery approach
SELECT name FROM employees
WHERE dept_id IN (SELECT dept_id FROM departments WHERE location = 'Chennai');

-- Optimized with JOIN
SELECT e.name
FROM employees e
JOIN departments d ON e.dept_id = d.dept_id
WHERE d.location = 'Chennai';

-- Use LIMIT to reduce result set size
SELECT * FROM employees ORDER BY salary DESC LIMIT 10;

-- Rewrite OR condition as UNION for better performance
-- Original OR query
SELECT * FROM employees WHERE dept_id = 1 OR salary > 70000;

-- Rewritten using UNION
SELECT * FROM employees WHERE dept_id = 1
UNION
SELECT * FROM employees WHERE salary > 70000;

-- Drop unused indexes (if needed)
DROP INDEX idx_unused ON employees;

-- Use proper data types (e.g., INT for id, DECIMAL for money)
-- Avoid using TEXT where VARCHAR suffices

