show databases;
create database sql_leraning;
use sql_leraning;
CREATE TABLE employees (
    id INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(50),
    age INT,
    salary INT,
    department VARCHAR(50),
    phone_number VARCHAR(15),
    hire_date DATE,
    PRIMARY KEY (id)
);

INSERT INTO employees (id, name, age, salary, department, phone_number, hire_date) VALUES
(1, 'Alice', 30, 60000, 'IT', 9876543210, '2021-03-15'),
(2, 'Bob', 25, 45000, 'HR', NULL, '2022-06-10'),
(3, 'Charlie', 28, 70000, 'Sales', '9123456789', '2020-11-25'),
(4, 'David', 35, 55000, 'Marketing', NULL, '2019-09-05'),
(5, 'Eve', 40, 80000, 'IT', '9988776655', '2023-01-20'),
(6, 'Frank', 22, 40000, 'HR', '9112233445', '2021-08-30'),
(7, 'Grace', 29, 75000, 'Sales', '9556677889', '2018-07-14'),
(8, 'Martin', 31, 72000, 'IT', '9001122334', '2022-02-28'),
(9, 'Helen', 27, 68000, 'Marketing', '9887766554', '2020-05-18'),
(10, 'Darren', 33, 74000, 'Sales', '9776655443', '2019-11-10'),
(11, 'Ian', 26, 52000, 'IT', '9654321876', '2022-07-19'),
(12, 'Jasmine', 34, 62000, 'HR', NULL, '2017-12-05'),
(13, 'Kevin', 41, 90000, 'Sales', '9543217890', '2016-09-30'),
(14, 'Laura', 36, 88000, 'Marketing', '9234567890', '2015-06-21'),
(15, 'Nathan', 29, 76000, 'IT', '9871236540', '2018-02-14'),
(16, 'Olivia', 24, 48000, 'HR', '9009988776', '2023-05-25');

select * from employees;

CREATE TABLE Users (
    id INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(50),
    age INT,
    city VARCHAR(50),
    PRIMARY KEY (id)
);

INSERT INTO Users (id, name, age, city) VALUES
(1, 'John', 20, 'New York'),
(2, 'Sarah', 25, 'London'),
(3, 'Mike', 30, 'Los Angeles'),
(4, 'Emma', 17, 'Chicago'),
(5, 'Sophia', 60, 'Paris'),
(6, 'Daniel', 35, 'Berlin');

select * from users;

SELECT name, salary, salary * 1.10 AS new_salary
FROM employees;

SELECT salary + 1000 AS increased_salary FROM employees;

SELECT salary - 5000 AS decreased_salary FROM employees;

SELECT salary / age AS salary_per_age FROM employees;

SELECT age % 10 AS remainder FROM employees;

SELECT * FROM users WHERE age = 25;

SELECT * FROM users WHERE age <> 25;

SELECT * FROM users WHERE age > 25;

SELECT * FROM users WHERE age < 25;

SELECT * FROM users WHERE age >= 25;

SELECT * FROM users WHERE age <= 25;

SELECT * FROM employees WHERE salary > 50000;

SELECT * FROM employees WHERE age BETWEEN 25 AND 40;

SELECT * FROM employees WHERE age NOT BETWEEN 20 AND 30;

SELECT * FROM employees WHERE age IN (25, 30, 35);

SELECT * FROM employees WHERE age NOT IN (25, 30, 35);

SELECT * FROM employees WHERE phone_number IS NULL;

SELECT * FROM employees WHERE phone_number IS NOT NULL;

SELECT * FROM employees WHERE department = 'IT' AND salary > 55000;

SELECT * FROM employees WHERE department = 'Sales' OR department = 'Marketing';

SELECT * FROM employees WHERE NOT department = 'HR';

SELECT * FROM employees WHERE age > 30 AND (salary > 50000 OR department = 'IT');

SELECT * FROM employees WHERE department = 'HR';

SELECT * FROM employees WHERE department = 'IT' AND salary > 55000;

SELECT * FROM employees WHERE department = 'Sales' OR department = 'Marketing';

SELECT * FROM employees WHERE NOT department = 'HR';

SELECT * FROM employees WHERE name LIKE 'A%';

SELECT * FROM employees WHERE name LIKE '%n';

SELECT * FROM employees WHERE name LIKE '_o%';

SELECT * FROM employees WHERE name NOT LIKE 'A%';

SELECT * FROM employees ORDER BY salary ASC;

SELECT * FROM employees ORDER BY hire_date DESC;

SELECT * FROM employees ORDER BY department ASC, salary DESC;

SELECT * FROM employees LIMIT 3;

SELECT * FROM employees ORDER BY hire_date LIMIT 5 OFFSET 5;

SELECT * FROM employees ORDER BY hire_date LIMIT 5 OFFSET 10;

SELECT * FROM employees ORDER BY hire_date LIMIT 5 OFFSET 15;

SELECT * FROM employees ORDER BY salary DESC LIMIT 3;

SELECT * FROM employees ORDER BY salary ASC LIMIT 3;

CREATE TABLE employees1 (
	id PRIMARY KEY(),
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    salary INT,
    department VARCHAR(50),
);
INSERT INTO Employees1 (id, first_name, last_name, department, salary)
VALUES (1, 'Alice', 'Smith', 'HR', 60000);

INSERT INTO Employees1 (id, first_name, last_name, department, salary)
VALUES 
(2, 'Bob', 'Johnson', 'IT', 70000),
(3, 'Carol', 'Davis', 'Marketing', 55000);

select * from Employees1;

UPDATE Employees1
SET salary = 75000  
WHERE first_name = 'Alice' AND last_name = 'Smith';

DELETE FROM Employees1 WHERE id = 3;

TRUNCATE TABLE Employees1;

-- Creating a table with a Primary Key
CREATE TABLE employees (
    emp_id INT NOT NULL PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    department VARCHAR(30)
);

-- Creating related tables with a Foreign Key
CREATE TABLE departments (
    dept_id INT NOT NULL PRIMARY KEY,
    dept_name VARCHAR(50) NOT NULL
);

CREATE TABLE employees (
    emp_id INT NOT NULL PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    dept_id INT,
    FOREIGN KEY (dept_id) REFERENCES departments(dept_id)
);

SELECT department_id, COUNT(*) 
FROM employees 
GROUP BY department_id;
