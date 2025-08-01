
-- 📄 fp_bonus_features.sql
-- Bonus Features Script for E-Commerce Order Management System
-- Includes: Trigger, Analytics Queries, Schema Update

-- 🔧 Step 1: Add stock_quantity column to products
ALTER TABLE products ADD COLUMN stock_quantity INT DEFAULT 0;

-- 📌 Step 2: Create Trigger to update stock after inserting into order_items
DELIMITER $$

CREATE TRIGGER trg_update_stock
AFTER INSERT ON order_items
FOR EACH ROW
BEGIN
    UPDATE products
    SET stock_quantity = stock_quantity - NEW.quantity
    WHERE product_id = NEW.product_id;
END$$

DELIMITER ;

-- 👤 Step 3: Sample User Insert (if needed)
INSERT INTO users (user_id, name, email, password, role)
VALUES (4, 'Nithish', 'nithish@example.com', 'dummyhash', 'customer');

-- 🛒 Step 4: Insert New Order
INSERT INTO orders (order_id, user_id, status)
VALUES (9, 4, 'Pending');

-- 📦 Step 5: Insert Order Item that triggers stock update
INSERT INTO order_items (order_id, product_id, quantity, price)
VALUES (9, 2, 1, 499.99);

-- 📈 Step 6: Analytics Queries

-- 6.1: Top-Selling Products
SELECT p.product_name, SUM(oi.quantity) AS total_sold
FROM order_items oi
JOIN products p ON oi.product_id = p.product_id
GROUP BY oi.product_id
ORDER BY total_sold DESC
LIMIT 5;

-- 6.2: Monthly Revenue Report
SELECT DATE_FORMAT(o.order_date, '%Y-%m') AS month,
       SUM(oi.quantity * oi.price) AS total_revenue
FROM orders o
JOIN order_items oi ON o.order_id = oi.order_id
GROUP BY month
ORDER BY month;

-- 6.3: Customer Lifetime Value
SELECT u.name AS customer_name, SUM(oi.quantity * oi.price) AS total_spent
FROM users u
JOIN orders o ON u.user_id = o.user_id
JOIN order_items oi ON o.order_id = oi.order_id
GROUP BY u.user_id
ORDER BY total_spent DESC;
