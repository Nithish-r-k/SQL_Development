**#Geminimet Technologies** 

**#🛒 E-Commerce SQL Database Project**


This project simulates a backend database for an e-commerce platform, built using MySQL. It covers complete SQL development from schema design and sample data insertion to business logic queries, stored procedures, triggers, and query optimization.


**## 📁 Project Structure**



| File                      | Description                                  |

|---------------------------|----------------------------------------------|

| `fp\_day1\_schema.sql`      | Database schema creation                     |

| `fp\_day2\_insert.sql`      | Sample data for users, products, orders, etc.|

| `fp\_day3\_queries.sql`     | Business logic and reports                   |

| `fp\_day4\_procedures.sql`  | Procedures, functions, and triggers          |

| `fp\_day5\_optimization.sql`| Indexing and performance optimization        |

| `orders.csv`              | Exported data from the `orders` table        |







**## ✅ Features Implemented**



\- Relational database schema (normalized)

\- Sample data for users, products, orders, and payments

\- Revenue and best-sellers reporting

\- Stored procedures for inserting payments and fetching orders

\- Triggers for automatic status updates and report logging

\- Query optimization using indexes





**## 📊 Example Outputs**



\- ✅ \*\*Total Revenue\*\*: ₹69,998.47

\- 🚚 \*\*Order Status Summary\*\*: Shipped (1), Delivered (1), Pending (1)

\- 📈 \*\*Top Products\*\*: Laptop B2, Smartphone A1, Headphones C3

\- 👤 \*\*Alice Kumar Orders\*\*: Order ID 1 (Shipped), Order ID 3 (Delivered)



---



**## 💻 How to Run**



1\. Create the database and tables:

&nbsp;  

&nbsp;  SOURCE fp\_day1\_schema.sql;



2.Insert sample data:



&nbsp;  SOURCE fp\_day2\_insert.sql;



3.Run reports and analytics:



&nbsp;  SOURCE fp\_day3\_queries.sql;



4.Execute stored procedures and triggers:



&nbsp;  SOURCE fp\_day4\_procedures.sql;



5.Apply performance optimization:



&nbsp;  SOURCE fp\_day5\_optimization.sql;



6.Export order data (if needed):



&nbsp;  SELECT \* FROM orders

&nbsp;  INTO OUTFILE 'C:/ProgramData/MySQL/MySQL Server 9.4/Uploads/orders.csv'

&nbsp;  FIELDS TERMINATED BY ',' ENCLOSED BY '"'

&nbsp;  LINES TERMINATED BY '\\n';





**🛠️ Tools Used:**

MySQL 8+ / 9+



Visual Studio Code (SQL extension)



Windows OS



**Future Enhancements:**



These are features that can be added in future versions of this e-commerce SQL project:



Product Reviews and Ratings:

Allow users to leave feedback and rate products. Add reviews table linked to users and products.



Inventory Alerts:

Trigger alerts when product stock goes below a threshold (e.g., <10 units).



Coupon System:

Support for promo codes or discount coupons stored in a new coupons table.



Admin Dashboard Analytics:

Create stored procedures to display daily/monthly sales summaries and growth charts.



Multi-Vendor Support:

Extend database to handle multiple sellers/vendors per product.



Return/Refund Workflow:

Include order return reasons, refund tracking, and refund policy management.



User Activity Logging:

Add triggers to log login time, order activity, and payments into an audit table.



Data Archiving:

Automatically archive old orders/payments into historical tables for performance and compliance.



**📌 Notes**

Make sure secure\_file\_priv is configured correctly to allow exports.



Triggers auto-log new orders and update order statuses on payment insertions.





