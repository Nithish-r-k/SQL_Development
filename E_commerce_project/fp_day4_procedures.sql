-- Procedure: Get orders by customer ID
DELIMITER //
CREATE PROCEDURE GetOrdersByCustomer(IN uid INT)
BEGIN
    SELECT o.order_id, o.order_date, o.status
    FROM orders o
    WHERE o.user_id = uid;
END;
//
DELIMITER ;

-- Call the procedure
CALL GetOrdersByCustomer(1);

-- Procedure: Insert a new payment
DELIMITER //
CREATE PROCEDURE InsertPayment(
    IN oid INT,
    IN amt DECIMAL(10,2),
    IN pmethod VARCHAR(50)
)
BEGIN
    INSERT INTO payments (order_id, amount, payment_method, status)
    VALUES (oid, amt, pmethod, 'Paid');
END;
//
DELIMITER ;

-- Call InsertPayment procedure
CALL InsertPayment(2, 499.00, 'UPI');

-- Function: Calculate total price for an order
DELIMITER //
CREATE FUNCTION GetOrderTotal(oid INT)
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
    DECLARE total DECIMAL(10,2);
    SELECT SUM(price * quantity) INTO total
    FROM order_items
    WHERE order_id = oid;
    RETURN total;
END;
//
DELIMITER ;

-- Use the function
SELECT GetOrderTotal(1) AS total_order_1;

-- Trigger: After inserting an order, insert into report log
DELIMITER //
CREATE TRIGGER trg_order_insert
AFTER INSERT ON orders
FOR EACH ROW
BEGIN
    INSERT INTO reports (report_name)
    VALUES (CONCAT('New Order Added - ID: ', NEW.order_id));
END;
//
DELIMITER ;

-- Trigger: After payment, update order status to 'Delivered'
DELIMITER //
CREATE TRIGGER trg_payment_update
AFTER INSERT ON payments
FOR EACH ROW
BEGIN
    UPDATE orders
    SET status = 'Delivered'
    WHERE order_id = NEW.order_id AND NEW.status = 'Paid';
END;
//
DELIMITER ;

