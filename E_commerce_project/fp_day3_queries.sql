-- 1. Retrieve all orders with customer name and total amount
SELECT o.order_id, u.name AS customer_name, o.order_date, p.amount AS total_amount, o.status
FROM orders o
JOIN users u ON o.user_id = u.user_id
LEFT JOIN payments p ON o.order_id = p.order_id;

-- 2. Get total revenue generated
SELECT SUM(amount) AS total_revenue
FROM payments
WHERE status = 'Paid';

-- 3. List top 3 best-selling products
SELECT p.product_name, SUM(oi.quantity) AS total_sold
FROM order_items oi
JOIN products p ON oi.product_id = p.product_id
GROUP BY p.product_id, p.product_name
ORDER BY total_sold DESC
LIMIT 3;

-- 4. Report: Number of orders by status
SELECT status, COUNT(*) AS order_count
FROM orders
GROUP BY status;

-- 5. Orders placed by a specific customer (e.g., Alice Kumar)
SELECT o.order_id, o.order_date, o.status
FROM orders o
JOIN users u ON o.user_id = u.user_id
WHERE u.name = 'Alice Kumar';

-- 6. Payments summary by method
SELECT payment_method, COUNT(*) AS count, SUM(amount) AS total
FROM payments
WHERE status = 'Paid'
GROUP BY payment_method;

-- 7. Retrieve all pending orders with item details
SELECT o.order_id, u.name AS customer, p.product_name, oi.quantity
FROM orders o
JOIN users u ON o.user_id = u.user_id
JOIN order_items oi ON o.order_id = oi.order_id
JOIN products p ON oi.product_id = p.product_id
WHERE o.status = 'Pending';

-- 8. Generate daily sales report
SELECT order_date, SUM(amount) AS daily_sales
FROM orders o
JOIN payments p ON o.order_id = p.order_id
WHERE p.status = 'Paid'
GROUP BY order_date
ORDER BY order_date DESC;
