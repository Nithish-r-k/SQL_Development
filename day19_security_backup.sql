-- Create a new user with password
CREATE USER 'readonly_user'@'localhost' IDENTIFIED BY 'readonlypass';

-- Grant SELECT permission only
GRANT SELECT ON company.* TO 'readonly_user'@'localhost';

-- Revoke INSERT, UPDATE, DELETE permissions
REVOKE INSERT, UPDATE, DELETE ON company.* FROM 'readonly_user'@'localhost';

-- Create a user with full privileges
CREATE USER 'admin_user'@'localhost' IDENTIFIED BY 'adminpass';
GRANT ALL PRIVILEGES ON company.* TO 'admin_user'@'localhost';

-- View current user privileges
SHOW GRANTS FOR 'readonly_user'@'localhost';

-- Drop a user
DROP USER 'readonly_user'@'localhost';

-- Backup the entire database using command line (MySQL)
-- Run from terminal (outside SQL prompt)
mysqldump -u root -p company > company_backup.sql

-- Backup a specific table
mysqldump -u root -p company employees > employees_backup.sql

-- Restore a database from backup
mysql -u root -p company < company_backup.sql

-- PostgreSQL equivalents:
-- pg_dump -U postgres company > company_backup.sql
-- psql -U postgres -d company -f company_backup.sql

-- Create a simple backup table
CREATE TABLE employees_backup AS
SELECT * FROM employees;

-- Schedule backup using EVENT (MySQL)
DELIMITER //
CREATE EVENT backup_employees_daily
ON SCHEDULE EVERY 1 DAY
DO
BEGIN
    INSERT INTO employees_backup
    SELECT * FROM employees;
END;
//
DELIMITER ;

