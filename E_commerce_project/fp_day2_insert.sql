-- Insert sample users
INSERT INTO users (name, email, password, role) VALUES
('Alice Kumar', 'alice@example.com', 'alice123', 'customer'),
('Bob Singh', 'bob@example.com', 'bob123', 'customer'),
('Admin User', 'admin@example.com', 'admin123', 'admin');

-- Insert sample products
INSERT INTO products (product_name, category, price, stock) VALUES
('Smartphone A1', 'Electronics', 19999.99, 50),
('Laptop B2', 'Electronics', 45999.50, 30),
('Headphones C3', 'Accessories', 1999.99, 100),
('Book D4', 'Books', 499.00, 200);

-- Insert sample orders
INSERT INTO orders (user_id, order_date, status) VALUES
(1, '2025-07-20', 'Shipped'),
(2, '2025-07-25', 'Pending'),
(1, '2025-07-30', 'Delivered');

-- Insert sample order items
INSERT INTO order_items (order_id, product_id, quantity, price) VALUES
(1, 1, 1, 19999.99),
(1, 3, 2, 1999.99),
(2, 4, 1, 499.00),
(3, 2, 1, 45999.50);

-- Insert sample payments
INSERT INTO payments (order_id, amount, payment_date, payment_method, status) VALUES
(1, 23999.97, '2025-07-20', 'Credit Card', 'Paid'),
(2, 499.00, '2025-07-25', 'UPI', 'Failed'),
(3, 45999.50, '2025-07-30', 'Net Banking', 'Paid');

-- Insert sample reports
INSERT INTO reports (report_name) VALUES
('July Sales Report'),
('Pending Orders Report'),
('Top Products Report');
