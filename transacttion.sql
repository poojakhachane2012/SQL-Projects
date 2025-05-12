
create database transaction;
use transaction;
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

CREATE TABLE departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(50)
);
INSERT INTO departments (department_id, department_name) VALUES
(101, 'HR'),
(102, 'Finance'),
(103, 'Engineering');
select * from departments;

CREATE TABLE archived_employees (
    id INT PRIMARY KEY,
    name VARCHAR(100),
    salary DECIMAL(10, 2),
    department_id INT,
    archived_date DATE
);
 -- Q). Write a transaction to transfer $5000 from Alice's salary to Bob's salary. 
 -- Rollback the transaction if Bob's salary exceeds $60,000 after the update.
 
 -- Q). Create a transaction to update the salaries of multiple employees. 
--  Use a savepoint to rollback the update of one specific employee while committing others.

  start transaction;
  update employees set salary = salary*1.05 where department_id = 101;
  update employees set salary = salary*1.10 where department_id = 102;
 SAVEPOINT after_employee103;
 update employees set salary = salary*1.20 where department_id = 103;
 ROLLBACK TO SAVEPOINT after_employee103;
 commit;
 select * from employees;
 
 -- Q). Create a temporary table to calculate the average salary per department. 
--  Use the table to fetch departments with an average salary above $70,000.

CREATE TEMPORARY TABLE temp_avg_salary AS
SELECT department_id, AVG(salary) AS avg_salary
FROM employees
GROUP BY department_id;
SELECT department_id, avg_salary
FROM temp_avg_salary
WHERE avg_salary > 70000;

-- Q).Schedule an event to archive employees earning less than $50,000 into the archived_employees table every week.
set global event_sheduler = on;

DELIMITER $$
CREATE EVENT archive_employees2
on SCHEDULE every 1 week
starts '2024-01-01 00:00:00'
do
begin
INSERT INTO archived_employees(id, name, salary, department_id)
SELECT id, name, salary, department_id, CURDATE()
    FROM employees
    WHERE salary < 50000;
    DELETE FROM employees WHERE salary < 50000;
END $$
DELIMITER ;  
select * from  archived_employees;



  
  

 
 
  
  
  
  

