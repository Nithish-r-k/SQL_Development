-- Create a single-column index on last name
CREATE INDEX idx_lastname ON employees(last_name);

-- Create a composite index on last name and department_id
CREATE INDEX idx_emp_dept ON employees(last_name, department_id);

-- Create a unique index on email
CREATE UNIQUE INDEX idx_email ON users(email);

-- Create a full-text index on product descriptions (if supported)
CREATE FULLTEXT INDEX idx_description ON products(description);

-- Create a clustered index on emp_id (for SQL Server or PostgreSQL)
-- In MySQL, PRIMARY KEY is the clustered index by default
CREATE CLUSTERED INDEX idx_id ON employees(emp_id);

-- Create a non-clustered index on salary (for SQL Server or PostgreSQL)
CREATE NONCLUSTERED INDEX idx_salary ON employees(salary);

-- Drop an index that is no longer needed
DROP INDEX idx_email ON users;

-- Sample query that benefits from an index
SELECT * FROM customers WHERE email = 'john@email.com';

-- Query using a composite index
SELECT * FROM employees 
WHERE last_name = 'Smith' AND department_id = 2;

-- Explain query plan (MySQL)
EXPLAIN SELECT * FROM employees WHERE last_name = 'Smith';

