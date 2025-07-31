-- Challenge 1: Employee Management System

-- 1. Retrieve all employees along with their department names
SELECT e.name, d.dept_name
FROM employees e
LEFT JOIN departments d
ON e.dept_id = d.dept_id;

-- 2. Get the total number of employees in each department
SELECT d.dept_name, COUNT(e.emp_id) AS total_employees
FROM employees e
LEFT JOIN departments d
ON e.dept_id = d.dept_id
GROUP BY d.dept_name;

-- 3. Find the employee(s) with the highest salary
SELECT name, salary
FROM employees
WHERE salary = (SELECT MAX(salary) FROM employees);

-- 4. List employees who joined before 2019
SELECT name, hire_date
FROM employees
WHERE hire_date < '2019-01-01';


-- Challenge 2: E-Commerce Sales Data Analysis

-- 1. Find the total revenue generated from all orders
SELECT SUM(total_price) AS total_revenue
FROM orders;

-- 2. List all orders with product names
SELECT o.order_id, p.product_name, o.quantity, o.total_price
FROM orders o
JOIN products p
ON o.product_id = p.product_id;

-- 3. Find the customer who placed the most orders
SELECT customer_id, COUNT(order_id) AS total_orders
FROM orders
GROUP BY customer_id
ORDER BY total_orders DESC
LIMIT 1;

-- 4. Get the average order value per customer
SELECT customer_id, AVG(total_price) AS avg_order_value
FROM orders
GROUP BY customer_id;


-- Challenge 3: Library Management System

-- 1. Find the total number of books borrowed
SELECT COUNT(borrow_id) AS total_borrowed
FROM borrowed_books;

-- 2. Retrieve details of books that haven’t been returned yet
SELECT b.title, bb.member_id
FROM borrowed_books bb
JOIN books b
ON bb.book_id = b.book_id
WHERE bb.return_date IS NULL;

-- 3. Get the most borrowed book
SELECT book_id, COUNT(*) AS borrow_count
FROM borrowed_books
GROUP BY book_id
ORDER BY borrow_count DESC
LIMIT 1;

-- 4. List the members who borrowed books the most
SELECT member_id, COUNT(*) AS borrow_count
FROM borrowed_books
GROUP BY member_id
ORDER BY borrow_count DESC
LIMIT 3;

