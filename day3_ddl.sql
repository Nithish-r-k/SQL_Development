-- Create departments table with a primary key
CREATE TABLE departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(100) NOT NULL
);

-- Create employees table with various constraints and foreign key
CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    department_id INT,
    salary DECIMAL(10,2) CHECK (salary > 0),
    hire_date DATE DEFAULT CURRENT_DATE,
    FOREIGN KEY (department_id) REFERENCES departments(department_id)
);

-- Add a new column 'email' to employees table
ALTER TABLE employees ADD email VARCHAR(100);

-- Modify the salary column data type
ALTER TABLE employees MODIFY salary DECIMAL(12,2);

-- Drop the 'email' column from employees table
ALTER TABLE employees DROP COLUMN email;

-- Drop the employees table permanently
DROP TABLE employees;

-- Truncate the employees table (delete all data but keep structure)
TRUNCATE TABLE employees;

