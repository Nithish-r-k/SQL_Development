-- Analyze query performance
EXPLAIN SELECT * FROM orders WHERE user_id = 1;

-- Create indexes to speed up joins and searches
CREATE INDEX idx_user_id ON orders(user_id);
CREATE INDEX idx_order_id ON payments(order_id);
CREATE INDEX idx_product_id ON order_items(product_id);
CREATE INDEX idx_email ON users(email);
CREATE INDEX idx_status ON orders(status);

-- Optimize product search by category
SELECT product_name, price
FROM products
WHERE category = 'Electronics';

-- Add index for product category
CREATE INDEX idx_category ON products(category);

-- Optimize order summary by limiting results
SELECT o.order_id, u.name, p.amount
FROM orders o
JOIN users u ON o.user_id = u.user_id
JOIN payments p ON o.order_id = p.order_id
WHERE p.status = 'Paid'
ORDER BY p.amount DESC
LIMIT 10;

-- Rewriting OR queries using UNION
SELECT * FROM orders WHERE status = 'Pending'
UNION
SELECT * FROM orders WHERE status = 'Shipped';

-- Remove unused indexes (if any exist)
-- DROP INDEX idx_unused ON tablename;

-- Use prepared statements in application layer (not shown here)

-- Use proper column types and normalize where possible
-- Already applied during schema design in Day 1

-- Analyze query cost (PostgreSQL)
-- EXPLAIN ANALYZE SELECT * FROM order_items WHERE product_id = 2;

-- View slow query log (if enabled in server settings, outside SQL)

