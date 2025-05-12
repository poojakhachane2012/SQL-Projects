show databases;
use newdb2;
select * from employe1;
-- 1. Select all employees who work in the ‘Marketing’ department.
select *
from employe1
where department = 'Marketing';
--  Find all employees whose first name is ‘Sarah’ 
select * 
from employe1
where first_name = 'Sarah';

-- 3. Get all employees who live in the city ‘Miami’.
select * from employe1
where city ='miami';

-- 4. Retrieve all employees whose last name starts with ‘C’.
select * from employe1
where last_name like 'C%';
-- 5. List all employees who have ‘Manager’ in their job title.
select * from employe1
where job_title like '%Manager%';

-- 6. Write a SQL query to retrieve the first 5 records from the Employees table.
select * from employe1
order by id  ASC limit 5 ;

-- 7. Create a SQL query to select the top 3 highest-paid employees from the Employees table.
select first_name,salary
from employe1
order by salary DESC limit 3;
-- 8. Select all employees whose last name contains the letter ‘e’.
select * from employe1
where last_name like '%e';

-- 9. Get all employees whose job title ends with ‘Specialist’.
select * from employe1
where  job_title like '%Specialist%';

-- 10. Select all employees who have ‘Engineer’ at the end of their job title.
select * from employe1
where job_title  like '%Engineer%';

-- 11. Order employees by their salary in descending order.
select salary from employe1
order by salary desc ; 

-- 13. Write a query to list the first 5 employees in the ‘Marketing’ department, ordered by their salary in descending order.
select saraly , department from employe1
where department like 'Marketing' limit 5;

-- 14. Retrieve all employees who were hired on the 15th of any month.
select * from employe1
where hire_date like '15';

-- 12. Suppose you need to display employee records 5 at a time on a website. Write 
-- a SQL query to display the second set of 5 employees, ordered by hire_date.
select * from employe1 order by hire_date asc limit 5;

-- 13. Write a query to list the first 5 employees in the ‘Marketing’ department, ordered by their salary in descending order.
select * from employe1 where department = 'Marketing'
order by salary desc
limit 5;

-- 14. Retrieve all employees who were hired on the 15th of any month.
select * from employe1 
where day(hire_date) like 15;

-- 15. Get all employees whose first name does not start with ‘A’ or ‘B’ (use AND).
select * from employe1
where first_name like 'A%' and 'B%';

-- 16. Select all employees who have ‘Director’ in their job title and are from the ‘Arizona’ office (use AND).
select * from employe1
where job_title like '%director%' and state like  'arizona';

-- 17. Write an SQL query to find the salaries of employees whose first name starts with ‘J’ and who work in Texas.
select * from employe1 
where first_name like 'J%' and state = 'texas' ;

-- 18. List all employees whose last name does not contain ‘son’ and who do not work in the ‘Engineering’ department.
select * from employe1
where last_name not like '%son%'  and department not like '%engineering%';

-- 19. Find all employees whose phone number ends with ‘7890’.
select * from employe1 
where phone_number like '%7890%';

-- 21. List all employees who do not live in ‘New York’, ‘Miami’, or ‘Austin’.
select * from employe1
where state not like 'new york' and state not like 'miami' and state not like 'austin';


-- 20. Retrieve all employees who have either ‘Engineer’ or ‘Specialist’ in their job title.
select * from employe1
where job_title like '%specialist' or  job_title like '%engineer';





 