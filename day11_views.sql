-- Create a simple view for customer name and email
CREATE VIEW customer_contacts AS
SELECT name, email
FROM customers;

-- Query the view
SELECT * FROM customer_contacts;

-- Create a complex view to show employee names with their department names
CREATE VIEW employee_department AS
SELECT e.name AS employee_name, d.dept_name
FROM employees e
JOIN departments d
ON e.dept_id = d.dept_id;

-- Query the complex view
SELECT * FROM employee_department;

-- Attempt to update a simple view
UPDATE customer_contacts
SET email = 'newemail@email.com'
WHERE name = 'John';

-- Modify an existing view to include phone number
CREATE OR REPLACE VIEW customer_contacts AS
SELECT name, email, phone
FROM customers;

-- Drop a view
DROP VIEW customer_contacts;

