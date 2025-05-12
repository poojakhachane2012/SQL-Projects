show databases;
create database agregate_fun;
drop database agreefun;
use agregate_fun;
CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    customer_name VARCHAR(100),
    order_date DATETIME,
    order_amount FLOAT
);
INSERT INTO Orders (order_id, customer_name, order_date, order_amount) VALUES
(1, 'John Doe', '2023-05-01 14:23:00', 150.00),
(2, 'Jane Smith', '2023-05-02 10:45:00', 250.00),
(3, 'Mark Johnson', '2023-04-30 16:20:00', 75.00);

SELECT COUNT(*) AS total_orders FROM orders;

SELECT SUM(order_amount) AS total_revenue FROM Orders ;

SELECT AVG(Order_amount) AS average_price FROM Orders ;

SELECT MIN(order_amount) AS lowest_salary, MAX(order_amount) AS highest_order FROM Orders ;

SELECT order_id, COUNT(*) AS order_amount
FROM orders
GROUP BY order_id;

SELECT order_id, SUM(order_amount) AS order_amount
FROM orders
GROUP BY order_id;

SELECT customer_name , AVG(order_amount) AS avg_amount
FROM orders
GROUP BY customer_name
HAVING AVG(order_amount)>150 ;


