--  Create a new database
CREATE DATABASE Company;

--  Show all existing databases
SHOW DATABASES;

--  Select the Company database to use
USE Company;

--  Create a simple table for employees
CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    name VARCHAR(50),
    department VARCHAR(50),
    salary DECIMAL(10,2)
);

--  Insert sample data
INSERT INTO employees (employee_id, name, department, salary)
VALUES 
(101, 'Alice', 'IT', 60000),
(102, 'Bob', 'HR', 55000),
(103, 'Carol', 'Finance', 70000);

--  View data from the table
SELECT * FROM employees;
