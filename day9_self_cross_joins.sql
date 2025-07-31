-- SELF JOIN: Employee-Manager Relationship
SELECT e1.name AS Employee, e2.name AS Manager
FROM employees e1
LEFT JOIN employees e2
ON e1.manager_id = e2.emp_id;

-- SELF JOIN: Product dependencies (e.g., sub-parts of a product)
SELECT p1.product_name AS Product, p2.product_name AS Component
FROM products p1
LEFT JOIN products p2
ON p1.product_id = p2.parent_product_id;

-- CROSS JOIN: Employee and shift combinations
SELECT employees.name, shifts.shift_time
FROM employees
CROSS JOIN shifts;

-- CROSS JOIN: Product-color combinations
SELECT products.product_name, colors.color_name
FROM products
CROSS JOIN colors;
