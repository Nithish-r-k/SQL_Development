-- Basic CTE to get employees with salary > 60000
WITH HighSalaryEmployees AS (
    SELECT emp_id, name, salary
    FROM employees
    WHERE salary > 60000
)
SELECT * FROM HighSalaryEmployees;

-- CTE to calculate average salary per department
WITH DeptAvg AS (
    SELECT dept_id, AVG(salary) AS avg_salary
    FROM employees
    GROUP BY dept_id
)
SELECT e.name, e.salary, d.avg_salary
FROM employees e
JOIN DeptAvg d ON e.dept_id = d.dept_id;

-- Recursive CTE to generate numbers from 1 to 10
WITH RECURSIVE NumberSeries AS (
    SELECT 1 AS n
    UNION ALL
    SELECT n + 1 FROM NumberSeries WHERE n < 10
)
SELECT * FROM NumberSeries;

-- Recursive CTE for hierarchical employee-manager relationship
WITH RECURSIVE OrgChart AS (
    SELECT emp_id, name, manager_id, 1 AS level
    FROM employees
    WHERE manager_id IS NULL

    UNION ALL

    SELECT e.emp_id, e.name, e.manager_id, oc.level + 1
    FROM employees e
    JOIN OrgChart oc ON e.manager_id = oc.emp_id
)
SELECT * FROM OrgChart
ORDER BY level, name;

