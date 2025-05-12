create database subquery;
use subquery;
CREATE TABLE employees (
    id INT PRIMARY KEY,
    name VARCHAR(100),
    salary DECIMAL(10, 2),
    department_id INT
);

INSERT INTO employees (id, name, salary, department_id) VALUES
(1, 'Alice Smith', 75000.00, 101),
(2, 'Bob Johnson', 54000.00, 102),
(3, 'Charlie Davis', 84000.00, 103),
(4, 'Diana Reynolds', 92000.00, 101),
(5, 'Ethan Taylor', 61000.00, 102),
(6, 'Fiona Green', 58000.00, 103),
(7, 'George White', 76000.00, 101),
(8, 'Hannah Brown', 67000.00, 102),
(9, 'Ian Clark', 43500.00, 103),
(10, 'Jenny Adams', 89000.00, 101);

select * from employees;

SELECT name, salary, department_id
FROM employees
WHERE (department_id, salary) in  (SELECT department_id, MAX(salary) FROM employees GROUP BY department_id);

SELECT name, salary 
FROM employees 
WHERE salary > (SELECT AVG(salary) FROM employees);