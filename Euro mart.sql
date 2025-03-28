Create database eda_practice;
USE eda_practice;

select * from euromart_stores;

ALTER USER 'root'@'localhost' IDENTIFIED BY 'sound';
GRANT ALL PRIVILEGES ON *.* TO 'root'@'localhost';
FLUSH PRIVILEGES;

