**#Geminimet Technologies** 

**#🛒 E-Commerce SQL Database Project**

**📘 Project Description**

The E-Commerce Order Management System is a robust SQL-based backend application designed to manage the core operations of an online store. It handles:

    1.User accounts with role-based structure
    
    2.Product listings with inventory tracking
    
    3.Order placement and real-time stock updates
    
    4.Built-in analytics for business insights

The system is built using MySQL, with SQL scripts divided modularly for easy development, testing, and enhancement. It is ideal for demonstrating relational database design, data integrity via triggers, and insightful reporting using SQL.

**🌟 Features:**

**🧾 Order Management**

Add, view, and manage customer orders

Track order statuses: Pending, Shipped, Delivered, Cancelled

Automatically updates product inventory upon order placement

**🛍️ Product Management**
Stores product details including name, category, price, and stock_quantity

Maintains inventory stock levels with every purchase (via trigger)

**👤 User Management**
Handles multiple user roles: Admin, Customer

User data includes name, email, password, and role

**🧠 Business Logic**
🔁 Trigger: Automatically reduces stock when new order items are inserted

🧮 Procedures: For computing order totals and summarizing sales

**📊 Analytics & Reporting**
Top-selling products report (based on quantity sold)

Monthly revenue trends grouped by order date

Customer lifetime value analysis (total amount spent per user)

**🔐 Role-ready Authentication Structure**
User table supports role-based access logic (prepared for future UI login system)

**📁 Modular SQL Files**
Organized SQL files per project day (schema, procedures, reports, bonus)

**🔥 Bonus Features**

The project includes several advanced features that enhance its real-world usability and analytical capability:

A MySQL trigger named `trg_update_stock` is implemented to automatically update product inventory. When a new item is inserted into the `order_items` table, the corresponding `stock_quantity` in the `products` table is reduced. This ensures accurate, real-time stock management. The trigger is created using:

CREATE TRIGGER trg_update_stock
AFTER INSERT ON order_items
FOR EACH ROW
BEGIN
    UPDATE products
    SET stock_quantity = stock_quantity - NEW.quantity
    WHERE product_id = NEW.product_id;
END;

The system also features a user management structure that supports different roles such as `admin` and `customer`. The `users` table includes fields like `user_id`, `name`, `email`, `password`, and `role`, which allows for future implementation of role-based authentication. For example:

CREATE TABLE users (
    user_id INT PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(100),
    password VARCHAR(100),
    role ENUM('admin', 'customer') DEFAULT 'customer'
);

Analytics queries were developed to provide insights into business performance. These include identifying top-selling products, tracking monthly revenue, and calculating customer lifetime value. These queries were executed, and the results were exported to CSV for reporting:

**-- Top-selling products**
SELECT p.product_name, SUM(oi.quantity) AS total_sold
FROM order_items oi
JOIN products p ON oi.product_id = p.product_id
GROUP BY oi.product_id
ORDER BY total_sold DESC
LIMIT 5;

**-- Monthly revenue**
SELECT DATE_FORMAT(o.order_date, '%Y-%m') AS month,
       SUM(oi.quantity * oi.price) AS total_revenue
FROM orders o
JOIN order_items oi ON o.order_id = oi.order_id
GROUP BY month
ORDER BY month;

**-- Customer lifetime value**
SELECT u.name AS customer_name,
       SUM(oi.quantity * oi.price) AS total_spent
FROM users u
JOIN orders o ON u.user_id = o.user_id
JOIN order_items oi ON o.order_id = oi.order_id
GROUP BY u.user_id
ORDER BY total_spent DESC;

All the above logic is maintained in the `fp_bonus_features.sql` file, and the analytics results are saved in:

**- top_selling_products.csv**
**- monthly_revenue.csv**
**- customer_lifetime_value.csv**


**Tools/Technologies used:**

| Category                  | Tools/Technologies               |
| ------------------------- | -------------------------------- |
| 💻 **Language**           | SQL (MySQL dialect)              |
| 🗃️ **Database**          | MySQL 8.x, SQL Workbench / CLI   |
| ⚙️ **Procedural Logic**   | Stored Procedures, Triggers      |
| 📊 **Analytics**          | SQL Aggregation, Grouping, Joins |
| 🔐 **Security Structure** | User Roles, Password Fields      |
| 🔄 **Version Control**    | Git, GitHub                      |
| 📂 **Project Structure**  | Folder-based schema organization |
| 🧰 **IDE/Editor**         | VS Code / MySQL Workbench        |


**⚙️ How to Run the E-Commerce Order Management System**

Follow these steps to set up and execute the SQL-based project on your local machine.

**🛠 Requirements:**
- MySQL Server (8.x recommended)
- MySQL CLI or MySQL Workbench
- Git (optional, for managing code)
- Text Editor (VS Code, Notepad++)

📁 Folder Structure:
E_commerce_project/
├── fp_day1_schema.sql               -- Schema creation
├── fp_day2_data.sql                 -- Sample data insertion
├── fp_day3_queries.sql              -- Order and product queries
├── fp_day4_procedures.sql           -- Stored procedures & trigger base
├── fp_bonus_features.sql            -- Trigger + analytics + enhancements
├── top_selling_products.csv         -- Output: Analytics
├── monthly_revenue.csv              -- Output: Analytics
├── customer_lifetime_value.csv      -- Output: Analytics

🚀 Step-by-Step Instructions:

1. Open MySQL CLI or MySQL Workbench
   Make sure your MySQL server is running.

2. Create the Database:
   CREATE DATABASE ecommerce;
   USE ecommerce;

3. Run SQL Files in Order:
   SOURCE D:/geminimet/SQL_Development/E_commerce_project/fp_day1_schema.sql;
   SOURCE D:/geminimet/SQL_Development/E_commerce_project/fp_day2_data.sql;
   SOURCE D:/geminimet/SQL_Development/E_commerce_project/fp_day3_queries.sql;
   SOURCE D:/geminimet/SQL_Development/E_commerce_project/fp_day4_procedures.sql;
   SOURCE D:/geminimet/SQL_Development/E_commerce_project/fp_bonus_features.sql;

   (Make sure the file path matches your local machine.)

4. Verify Your Data:
   SHOW TABLES;
   SELECT * FROM users;
   SELECT * FROM products;
   SELECT * FROM orders;

5. Run Reports:
   Run the analytics queries in:
   fp_bonus_features.sql

   Or view the .csv reports:
   - top_selling_products.csv
   - monthly_revenue.csv
   - customer_lifetime_value.csv

6. Test the Trigger (Optional):
   INSERT INTO order_items (order_id, product_id, quantity, price)
   VALUES (9, 2, 1, 499.99);

   Then check stock level:
   SELECT product_id, stock_quantity FROM products WHERE product_id = 2;

## 📊 Example Outputs

- ✅ **Total Revenue**: ₹69,998.47  
- 🚚 **Order Status Summary**: Shipped (1), Delivered (1), Pending (1)  
- 📈 **Top Products**: Laptop B2, Smartphone A1, Headphones C3  
- 👤 **Alice Kumar Orders**: Order ID 1 (Shipped), Order ID 3 (Delivered)  

**🚀 Future Enhancements**

Here are some planned or suggested features that can take the E-Commerce Order Management System to the next level:

**📬 Email Notifications**

Send confirmation emails when orders are placed or shipped

**📊 Dashboard Interface**

Web-based UI with visualizations (using Python Flask + Chart.js or Power BI)

**🗓️ Scheduled Reports**

Automate revenue/lifetime value exports monthly using SQL + cron jobs

**⚙️ Triggers for More Events**

Automatically mark orders as 'Cancelled' if unpaid for X days

Track low-stock alerts via triggers

**📦 Inventory Refill Automation**

Auto-generate a restock list when stock_quantity < threshold

**🌐 API Integration**

REST API endpoints for frontend interaction (GET/POST orders, users, etc.)

**📁 Backup & Recovery**

Scheduled SQL dumps or versioning for disaster recovery








