-- Create a table with a JSON column
CREATE TABLE customers (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100),
    contact_details JSON
);

-- Insert JSON data into the table
INSERT INTO customers (name, contact_details)
VALUES ('John Doe', '{
    "email": "john@example.com",
    "phone": "+1234567890"
}');

-- Retrieve specific fields from JSON using SQL functions
SELECT name, contact_details->>'$.email' AS email
FROM customers;

-- Filter rows based on JSON field value
SELECT * FROM customers
WHERE contact_details->>'$.phone' = '+1234567890';

-- Update a nested JSON field
UPDATE customers
SET contact_details = JSON_SET(contact_details, '$.email', 'newemail@example.com')
WHERE id = 1;

-- Convert SQL query results to JSON
SELECT id, name, JSON_OBJECT('email', contact_details->>'$.email') AS json_data
FROM customers;

-- Create a table with an XML column
CREATE TABLE orders (
    order_id INT PRIMARY KEY AUTO_INCREMENT,
    order_details XML
);

-- Insert XML data
INSERT INTO orders (order_details)
VALUES ('<order><product>Phone</product><price>599</price></order>');

-- Extract product name from XML
SELECT order_details.value('(/order/product)[1]', 'VARCHAR(50)') AS product_name
FROM orders;

-- Convert relational data to XML format (SQL Server / PostgreSQL syntax)
SELECT order_id, order_details 
FROM orders 
FOR XML AUTO;

