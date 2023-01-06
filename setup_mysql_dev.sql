-- Prepares mysql server

CREATE DATABASE IF NOT EXISTS reconnect_db;

CREATE USER IF NOT EXISTS 'rediet_dev'@'localhost' IDENTIFIED BY 'rediet_pwd';

GRANT ALL PRIVILEGES ON reconnect_db.* TO 'rediet_dev'@'localhost';

GRANT SELECT ON performance_schema.* TO 'rediet_dev'@'localhost';

FLUSH PRIVILEGES;
