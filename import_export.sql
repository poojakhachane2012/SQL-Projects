create database import_export;
use import_export;
create table emp1(NAME varchar(20),GENDER varchar(20),RACE varchar(20),DEPARTMENT varchar(20),YEARS_EXPERIENCE int,SALARY int);
LOAD DATA INFILE "C://ProgramData//MySQL//MySQL Server 8.0//Uploads//employee_sample.csv" INTO TABLE emp1
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES;
SHOW GLOBAL variables like 'local_.infile';	
set GLOBAL local_infile = true;
show variables like 'secure_file_priv';
select * from emp1;
-----------------------------------------------------------------------------------------------------------------------------------------------
create table food2(name varchar(40),state varchar(40),color varchar(40),food varchar(40),age int,height int,score decimal);
LOAD DATA INFILE "C://ProgramData//MySQL//MySQL Server 8.0//Uploads//sample_data.csv" INTO TABLE food2
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES;
SHOW GLOBAL variables like 'local_.infile';	
set GLOBAL local_infile = true;
show variables like 'secure_file_priv';
select * from food2;
 -----------------------------------------------------------------------------------------------------------------------------------------
SELECT 'name', 'height', 'age', 'score'
union all
SELECT name, height, age, score
INTO OUTFILE "C://ProgramData//MySQL//MySQL Server 8.0//Uploads//high_food.csv"
FIELDS TERMINATED BY ',' 
LINES TERMINATED BY '\n'
FROM food2
WHERE height > 70;

-------------------------------------------------------------------------------------------------------------------------------------------



