show databases;
create database joins_unions;
use  joins_unions;
CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(100),
    department VARCHAR(50)
);
INSERT INTO employees (emp_id, emp_name, department)
VALUES 
(1, 'John Doe', 'HR'),
(2, 'Jane Smith', 'Sales');
select * from employees;

CREATE TABLE contractors (
    cont_id INT PRIMARY KEY,
    cont_name VARCHAR(100),
    department VARCHAR(50)
);
insert into  contractors(cont_id,cont_name,department) values
(101,'Mark Johnson','Finance'),
(102,'Sarah Brown','IT');

select * from contractors ;

SELECT emp_id, emp_name, department FROM employees
UNION
SELECT cont_id, cont_name, department FROM contractors;

CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    order_date DATE,
    customer_id INT
);
INSERT INTO Orders (order_id, order_date, customer_id)
VALUES
    (101, '2023-05-01', 1),
    (102, '2023-05-02', 2),
    (103, '2023-05-03', 1),
    (104, '2023-05-04', 3),
    (105, '2023-05-05', 2);

    select * from Orders;

CREATE TABLE Customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100),
    city VARCHAR(100)
);
INSERT INTO Customers (customer_id, customer_name, city)
VALUES
    (1, 'John Doe', 'New York'),
    (2, 'Jane Smith', 'Los Angeles'),
    (3, 'Michael Lee', 'Chicago');
    select * from Customers;
    
SELECT orders.order_id, orders.order_date, customers.customer_name
FROM orders
INNER JOIN customers
ON orders.customer_id = customers.customer_id;


CREATE TABLE Departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(100)
);
INSERT INTO Departments (department_id, department_name)
VALUES
    (101, 'HR'),
    (102, 'Sales'),
    (103, 'Marketing');
    select * from Departments;
    
    CREATE TABLE Employees1 (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(100),
    department_id INT,
    FOREIGN KEY (department_id) REFERENCES Departments(department_id)
);
INSERT INTO Employees1 (emp_id, emp_name, department_id)
VALUES
    (1, 'John Doe', 101),
    (2, 'Jane Smith', 102),
    (3, 'Michael Lee', 101),
    (4, 'Emily Brown', 103);
    select * from Employees1;
    
SELECT employees1.emp_name, departments.department_name
FROM employees1
LEFT JOIN departments
ON employees1.department_id = departments.department_id;

SELECT employees1.emp_name, departments.department_name
FROM employees1
RIGHT JOIN departments
ON employees1.department_id = departments.department_id;

SELECT employees1.emp_name, Departments.department_name
FROM employees1
CROSS JOIN Departments;

SELECT a.emp_name AS employees1, b.emp_name AS Employee2
FROM employees1 a
INNER JOIN employees1 b
ON a.department_id = b.department_id
WHERE a.department_id != b.department_id;

SELECT employees1.emp_name, Departments.department_name
FROM employees1
LEFT JOIN Departments
ON employees1.department_id = Departments.department_id
UNION
SELECT employees1.emp_name, Departments.department_name
FROM employees1
RIGHT JOIN Departments
ON employees1.department_id = Departments.department_id;

    







