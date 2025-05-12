show databases;
create database newdb3;
use newdb3;
-- Q1. Create a table called products with the following columns:
 
create table products ( product_id int primary key , name varchar(200) not null , price decimal(10,2) check (price > 0) );

-- Q2. Create a table of employees with the following columns:

create table employees (employee_id int primary key , first_name varchar(200) not null , 
                        last_name varchar(200) not null , salary decimal(10,2) not null);
                        

-- Q3. Create an orders table where:   
create table orders (order_id int primary key,
                    product_id int,
                    quantity INT CHECK (quantity > 0),
					constraint fk_product foreign key  (product_id ) references products(product_id));
                    
-- Q4. Create a customers table where: customer_id (integer, primary key), email (varchar, must be unique), phone_number (varchar, must be unique)
create table customers (customer_id int primary key, email varchar(200) unique, phone_number varchar(50) unique);

-- Q5. Create a departments table with the following columns 
   create table departments (department_id int primary key,  
                             department_name varchar(200) unique not null, 
						     manager_id int, foreign key (manager_id) references employees(employee_id) );      
                             
                             
                             
-- Q6. Create a projects table where: project_id (integer, primary key), project_name (varchar, cannot be null), 
-- start_date (date, must be greater than today), budget (decimal, must be greater than 10000)

create table projects(project_id int primary key, project_name varchar(200) not null,
                      start_date date check(start_date>current_date()),
                      budget decimal(15,2) check(budget>10000));

-- Q7. Add a foreign key constraint to an existing orders table: Add a foreign key customer_id in
  -- the orders table that references customer_id in the customers table.
     
ALTER TABLE orders add column customer_id int, ADD CONSTRAINT fk_customer FOREIGN KEY (customer_id) REFERENCES customers (customer_id);
    
 -- Q8. Add a CHECK constraint to an existing employee's table: Add a CHECK constraint to the salary column to ensure the salary exceeds 30,000.
 
 ALTER TABLE Employees ADD CONSTRAINT check_salary CHECK (salary > 30000);
 
 
 -- Q9. Add a UNIQUE constraint to an existing customer's table: Add a UNIQUE constraint to the email column to ensure each employee has a unique email address.
  ALTER TABLE customers  ADD CONSTRAINT unique_email UNIQUE (email);
  
  
  CREATE TABLE vehicles (
    vehicle_id INT AUTO_INCREMENT PRIMARY KEY,
    make VARCHAR(100),
    model VARCHAR(100),
    price DECIMAL(10, 2),
    year INT,
    color VARCHAR(50),
    body_style VARCHAR(50),
    fuel_type VARCHAR(50),
    type VARCHAR(50)
);
INSERT INTO vehicles (make, model, price, year, color, body_style, fuel_type, type) VALUES
('BMW', 'X5', 60000, 2022, 'Black', 'SUV', 'Gasoline', 'Utility'),
('Chevrolet', 'Malibu', 25000, 2018, 'Silver', 'Sedan', 'Gasoline', 'Passenger'),
('Tesla', 'Model S', 75000, 2021, 'White', 'Sedan', 'Electric', 'Passenger'),
('Ford', 'F-150', 45000, 2019, 'Red', 'Truck', 'Gasoline', 'Utility'),
('Audi', 'Q7', 55000, 2021, 'Black', 'SUV', 'Gasoline', 'Utility'),
('Honda', 'Civic', 22000, 2016, 'Blue', 'Sedan', 'Gasoline', 'Passenger'),
('Mustang', 'GT', 45000, 2020, 'Yellow', 'Coupe', 'Gasoline', 'Sport'),
('Nissan', 'Leaf', 35000, 2020, 'Green', 'Sedan', 'Electric', 'Passenger'),
('Toyota', 'Camry', 24000, 2017, 'Silver', 'Sedan', 'Gasoline', 'Passenger'),
('Chevrolet', 'Bolt EV', 45000, 2021, 'Silver', 'Sedan', 'Electric', 'Passenger');
select * from vehicles;
-- Q10. Write a query to display the make, model, and a new column price_category that classifies each vehicle as ‘Economy’, ‘Premium’, or ‘Luxury’.
SELECT make,model,price,
    CASE
        WHEN price < 25000 THEN 'Economy'
        WHEN price BETWEEN 25000 AND 50000 THEN 'Premium'
        WHEN price > 50000 THEN 'Luxury'
    END AS price_category
FROM vehicles ;

-- Q11. Create a query to list the make, model, and a new column age_group categorizing vehicles as ‘New’ (year >= 2020), 
-- ‘Recent’ (year between 2017 and 2019), or ‘Older’ (year < 2017).

select make,model,year,
   case 
	 when year >= 2020 then 'new'
     when  year between 2017 and 2019 then 'recent'
     when  year < 2017 then 'older'
   END AS age_group 
FROM vehicles ;

-- Q12. Write a query to show the make, model, and a column body_style that converts ‘Sedan’ and ‘Coupe’ to 
-- ‘Passenger’, ‘SUV’ and ‘Truck’ to ‘Utility’, and ‘Electric’ remains the same.

select make, model,body_style,
   case
     when body_style in  ('Sedan' 'Coupe') then 'Passenger'
     when body_style in  ('SUV' 'Truck') then 'Utility'
     when body_style= 'Electric' then 'Electric'
	end as body_style
from vehicles ;  

-- Q13. Write a query to display the make, model, and a new column fuel_type where ‘Electric’ vehicles are listed as ‘Electric’ and others as ‘Gasoline’.
select make,model,
 case
   when fuel_type ='Electric' then 'Electric'
   else 'Gasoline'
 end as fuel_type
 from vehicles ;
 select * from vehicles;
 -- Q14.List make, model, and a column price_range indicating if the price is ‘Below 25k’, ‘25k to 50k’, or ‘Above 50k’.
 select make, model,
 case
   when price<25000 then 'below 25k'
   when price > 25000 and price<50000 then '25k to 50k'
   else 'above 50k'
 end as price_range
 from vehicles ;
 
 
 -- Q15. Write a query to show make, model, and a new column warranty_status as ‘In Warranty’ or 
 -- ‘Out of Warranty’ based on the year (assuming 5-year warranty from the year of manufacture).
 
 select make ,model,
 case
    when year < 2020 then 'In Warranty'
    else 'Out of Warranty'
 end as warranty_status
 from vehicles;
 
 -- Q16. Create a query to show make, model, and a column size_category classifying ‘Sedan’, 
 -- ‘Coupe’, and ‘Electric’ as ‘Small’, ‘SUV’ as ‘Medium’, and ‘Truck’ as ‘Large’.
 
 select make, model,
 case
  when body_style and fuel_type in ( 'sedan','Coupe','Electric') then 'small'
  when body_style = 'SUV' then 'medium'
  when body_style = 'truck' then 'large'
  else 'unknown'
 end as size_category
 from vehicles; 
 
 -- Q17. Display make model, and a new column year_class that classifies vehicles as ‘Vintage’ for years before 2000, ‘Modern’ 
 -- for years between 2000 and 2015, and ‘Current’ for years after 2015.
 
select make,model,
case 
when year < 2000 then 'vintage'
when year > 2000 and year < 2015 then 'modern'
when year > 2015 then 'current'
end as 'year_class '
from vehicles;
select * from vehicles ;

--  Q18. Create a query to show make, model, and column popularity where ‘Black’ and ‘White’ vehicles are ‘Popular’, and others are ‘Standard’.
select make,model,
case
when color='black' then 'popular'
when color = 'white' then 'popular'
else 'standard'
end as 'popularity'
from vehicles;

-- Q19. Write a query to show the make, model, and a column highlight that marks ‘Electric’ vehicles as ‘’ and others as ‘Conventional’.
select make,model,
case
when fuel_type ='electric' then 'Eco-Friendly'
else 'Conventional'
end as 'highlight'
from vehicles;

-- Q20. Write a query to display the make, model, and a new column luxury_brand where ‘BMW’, 
-- ‘Mercedes’, and ‘Audi’ are flagged as ‘Yes’, and other makes as ‘No’.
select make,model,
case 
when make in ('BMW','Mercedes','Audi')then 'yes'
else 'no' 
end as 'luxury_brand'
from vehicles;

-- Q21. Create a query to display make, model and a new column origin classifying ‘Ford’ and ‘Chevrolet’ as ‘Domestic’ and others as ‘Imported’.
 select make,model,
 case
 when make in ('ford','Chevrolet') then 'Domestic'
 else 'Imported'
 end as 'origin'
 from vehicles;
 
 -- Q22. Write a query to determine the suitability of the vehicle colour for hot climates (‘Suitable’ for light colours, ‘Unsuitable’ for dark colours)
select make,model,color,
case
when color in ('black','blue','green','red') then 'unsuitable'
else 'suitable'
end as 'suitability_vehicle_color'
from vehicles;

select * from vehicles;

-- Q23. Classify vehicles as ‘Urban’ if they are smaller cars or ‘Rural’ if they are larger vehicles or trucks.
select make ,model,
case
when body_style in('sedan','coupe') then 'urban'
else 'rural'
end as vehicles_size
from vehicles;

-- Q24. Classify vehicles based on their model year as ‘Experienced’ for older models and ‘Novice’ for newer models (year < 2015, ‘Experienced’).

select make,model,
case
when year < 2015 then 'Experienced'
else 'novice'
end as Experienced
from vehicles;







  
 


                           