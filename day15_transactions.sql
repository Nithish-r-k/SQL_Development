-- Start a transaction (manual mode)
START TRANSACTION;

-- Step 1: Deduct from Account A
UPDATE accounts SET balance = balance - 1000 WHERE account_id = 1;

-- Step 2: Add to Account B
UPDATE accounts SET balance = balance + 1000 WHERE account_id = 2;

-- Step 3: Commit if both succeeded
COMMIT;

-- Rollback example (in case of error)
START TRANSACTION;

UPDATE accounts SET balance = balance - 500 WHERE account_id = 3;

-- Something goes wrong here, so rollback
ROLLBACK;

-- Savepoint usage
START TRANSACTION;

UPDATE accounts SET balance = balance - 300 WHERE account_id = 4;
SAVEPOINT sp1;

UPDATE accounts SET balance = balance + 300 WHERE account_id = 5;

-- Undo second update only
ROLLBACK TO sp1;

-- Commit first update
COMMIT;

-- Error handling using TRY-CATCH (SQL Server / PostgreSQL-style, not supported in MySQL directly)
-- MySQL error handling is usually handled in stored procedures

-- Example in MySQL with handler in stored procedure
DELIMITER //
CREATE PROCEDURE SafeTransfer()
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
    END;

    START TRANSACTION;
        UPDATE accounts SET balance = balance - 200 WHERE account_id = 6;
        UPDATE accounts SET balance = balance + 200 WHERE account_id = 7;
    COMMIT;
END;
//
DELIMITER ;

-- Call procedure
CALL SafeTransfer();

