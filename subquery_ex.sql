show databases;
use subquery;
CREATE TABLE Customers (
    customer_id INT PRIMARY KEY,
    name VARCHAR(100),
    age INT,
    city VARCHAR(100),
    total_spent DECIMAL(10, 2)
);
INSERT INTO Customers (customer_id, name, age, city, total_spent) VALUES
(1, 'John Doe', 28, 'New York', 1200.50),
(2, 'Jane Smith', 34, 'Los Angeles', 2900.00),
(3, 'Emily Johnson', 22, 'Chicago', 1850.75),
(4, 'Michael Brown', 45, 'Miami', 3100.20),
(5, 'Jessica White', 31, 'Dallas', 1500.90),
(6, 'William Black', 37, 'San Francisco', 2150.60),
(7, 'Olivia Green', 29, 'Portland', 1400.30),
(8, 'Lucas Grey', 42, 'Seattle', 2200.70),
(9, 'Madison Silver', 25, 'Denver', 1250.45),
(10, 'Ethan Gold', 39, 'Phoenix', 2400.80);
select * from Customers;

-- Q. Find customers whose age is above the average age of customers.
 select age, name
 from customers
 where  age > (select avg(age) from customers);
 
-- Q. Find customers who have spent more than the average spending.
select total_spent,name
from customers
where total_spent >(select avg(total_spent) from customers);
select * from customers;

-- Q. List customers who are the youngest in their city.
select name , city , age
from customers as c,
 (select city, min(age) from customers group by city) as t
 where c.city = t.city and c.age = t.age;

SELECT name, city, age
FROM customers c1
WHERE age = (SELECT MIN(age) FROM customers c2 WHERE c1.city = c2.city);


-- Q. List the average spending of customers, excluding the highest spender.
select total_spent,name
from customers
where total_spent >(select avg(total_spent) from customers) order by total_spent asc limit 4;
select * from customers;

-- Q. Compare each customer’s spending to the average spending of all customers older than them and list those who are spending more.
select total_spent,name
from customers as c
where total_spent >(select avg(total_spent) from customers where age > c.age);
select * from customers;

-- Q. Display customers whose spending is within 10% of the highest spender.
select total_spent,name
from customers as c
where total_spent < (select max(total_spent) * 0.1 from customers ); 
select * from customers;

-- Q. Display customers who are older than the youngest customer in ‘Dallas’.
select name , age, city
from customers
where age >(select min(age) from customers where city = 'Dallas');

-- Q. Identify the customer who has spent the most in each city.
SELECT name, city, total_spent
FROM customers c1
WHERE total_spent = (
    SELECT MAX(total_spent)
    FROM customers c2
    WHERE c1.city = c2.city
);


-- Q. List all customers whose spending is below the median spending of the dataset.

-- Q. Find the name and total spent of customers who have spent more than any customer in ‘New York’.
SELECT name, total_spent
FROM customers
WHERE total_spent > (SELECT MAX(total_spent)FROM customers WHERE city = 'New York');


-- Q. List the customers along with the number of customers in their respective cities who have spent more than them.

-- Q. Display the oldest customer from each city.(Use join)