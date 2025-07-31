-- Create employees table with NOT NULL constraint
CREATE TABLE employees (
    id INT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    department VARCHAR(50)
);

-- Create users table with UNIQUE constraint on email
CREATE TABLE users (
    user_id INT PRIMARY KEY,
    email VARCHAR(100) UNIQUE
);

-- Create students table with PRIMARY KEY constraint
CREATE TABLE students (
    student_id INT PRIMARY KEY,
    name VARCHAR(50) NOT NULL
);

-- Create departments and employees table with FOREIGN KEY
CREATE TABLE departments (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(50) NOT NULL
);

CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    dept_id INT,
    FOREIGN KEY (dept_id) REFERENCES departments(dept_id)
);

-- Create products table with CHECK constraint
CREATE TABLE products (
    product_id INT PRIMARY KEY,
    price DECIMAL(10,2) CHECK (price > 0)
);

-- Create orders table with DEFAULT constraint
CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    order_status VARCHAR(20) DEFAULT 'Pending'
);

-- Add a UNIQUE constraint to the email column of employees
ALTER TABLE employees ADD CONSTRAINT unique_email UNIQUE(email);

-- Drop the unique_email constraint from employees
ALTER TABLE employees DROP CONSTRAINT unique_email;

